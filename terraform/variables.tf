variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-2"
}

variable "aws_name_tag" {
  description = "Name tag prefix for AWS resources"
  type        = string
  default     = "tfevm"
}

variable "aws_instance_size" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "aws_instance_count" {
  description = "Number of EC2 instances to provision"
  type        = number
  default     = 3
}

variable "aws_instance_public_key" {
  description = "SSH public key for instance access"
  type        = string
}
