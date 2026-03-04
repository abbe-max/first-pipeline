variable "namespace" {
  description = "Kubernetes namespace for your team"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "production"
}

variable "redis_image" {
  description = "Redis container image"
  type        = string
  default     = "redis:7-alpine"
}

variable "api_image" {
  description = "API backend container image"
  type        = string
  default     = "retro87/team-api:latest"
}

variable "frontend_image" {
  description = "Frontend container image"
  type        = string
  default     = "retro87/team-frontend:latest"
}

variable "api_replicas" {
  description = "Number of API replicas"
  type        = number
  default     = 1

  validation {
    condition     = var.api_replicas >= 1 && var.api_replicas <= 3
    error_message = "Replicas must be between 1 and 3 (namespace quota limit)."
  }
}
