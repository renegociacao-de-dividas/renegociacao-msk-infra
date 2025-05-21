output "msk_cluster_arn" {
  description = "ARN do cluster MSK"
  value       = aws_msk_cluster.msk_cluster.arn
}

output "msk_cluster_bootstrap_brokers_tls" {
  description = "Bootstrap broker TLS endpoint"
  value       = aws_msk_cluster.msk_cluster.bootstrap_brokers_tls
}
