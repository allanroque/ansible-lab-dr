output "instance_ids" {
  description = "IDs of the EC2 instances"
  value       = aws_instance.rhel[*].id
}

output "instance_public_ips" {
  description = "Public IP addresses of the EC2 instances"
  value       = aws_instance.rhel[*].public_ip
}

output "instance_private_ips" {
  description = "Private IP addresses of the EC2 instances"
  value       = aws_instance.rhel[*].private_ip
}

output "instance_public_dns" {
  description = "Public DNS names of the EC2 instances"
  value       = aws_instance.rhel[*].public_dns
}

output "ami_id" {
  description = "AMI ID used for the RHEL instances"
  value       = data.aws_ami.rhel.id
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "subnet_id" {
  description = "Public subnet ID"
  value       = aws_subnet.public.id
}
