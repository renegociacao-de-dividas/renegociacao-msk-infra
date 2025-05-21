variable "aws_region" {
  description = "Região AWS para deploy"
  type        = string
  default     = "ca-central-1"
}

variable "default_vpc_id" {
  description = "VPC padrão"
  type        = string
  default     = "vpc-06f9d8f53f94f2678"
}

variable "aws_subnet_1a_id" {
  description = "ID da subnet 1a"
  type        = string
  default     = "subnet-0603bc66a876e2cf8"
}

variable "aws_subnet_1b_id" {
  description = "ID da subnet 1b"
  type        = string
  default     = "subnet-08884f6c15856ab6b"
}
