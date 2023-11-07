# The name of the new namespace
output "namespace_name" {
  value       = kubernetes_namespace.homework.metadata[0].name
  description = "Namespace name"
}