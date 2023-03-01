output "public_ip_ec2" {
  value       = aws_instance.webserver.public_ip
  description = "Public IP address of EC2 instance"
}

output "instance_id" {
  value       = aws_instance.webserver.id
  description = "ID of EC2 instance"
}