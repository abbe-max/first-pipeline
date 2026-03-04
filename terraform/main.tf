terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.35"
    }
  }

  backend "gcs" {
    bucket = "chas-tf-state-lillteamet"
    prefix = "terraform/state/abdulghani-fkhir"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "redis" {
  source    = "./modules/k8s-app"
  name      = "redis"
  namespace = var.namespace
  image     = var.redis_image
  port      = 6379

  cpu_request    = "100m"
  memory_request = "128Mi"
  cpu_limit      = "200m"
  memory_limit   = "256Mi"
}

module "api" {
  source    = "./modules/k8s-app"
  name      = "api"
  namespace = var.namespace
  image     = var.api_image
  port      = 3000
  replicas  = var.api_replicas

  env_vars = {
    REDIS_HOST = "redis-service"
    REDIS_PORT = "6379"
    NODE_ENV   = var.environment
  }
}

module "frontend" {
  source    = "./modules/k8s-app"
  name      = "frontend"
  namespace = var.namespace
  image     = var.frontend_image
  port      = 80
  replicas  = 1
}
