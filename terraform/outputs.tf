output "namespace" {
  description = "The team namespace"
  value       = var.namespace
}

output "redis_service_dns" {
  description = "Redis service DNS"
  value       = "redis-service.${var.namespace}.svc.cluster.local"
}

output "api_service_dns" {
  description = "API service DNS"
  value       = "api-service.${var.namespace}.svc.cluster.local"
}

output "frontend_service_dns" {
  description = "Frontend service DNS"
  value       = "frontend-service.${var.namespace}.svc.cluster.local"
}
