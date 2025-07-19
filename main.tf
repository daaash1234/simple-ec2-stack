# Provider configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

variable "allowed_ip" {
  description = "Office IP ranges for prefix list"
  type = list(object({
    cidr        = string
    description = string
  }))
}

variable "project" {
  type = string
}

variable "environment" {
  type = string
}
variable "tool" {
  type = string
}

variable "key_name" {
  type        = string
  description = "Name of the SSH key pair to use for EC2 instances"
}

variable "aws_region" {
  type        = string
  description = "AWS region where resources will be created"
  default     = "ap-northeast-1"
}