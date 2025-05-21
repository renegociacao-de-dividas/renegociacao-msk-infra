# main.tf

resource "aws_security_group" "msk_sg" {
  name        = "msk-security-group"
  description = "Allow access to MSK brokers"
  vpc_id      = var.default_vpc_id

  ingress {
    from_port   = 9094
    to_port     = 9094
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Ajuste conforme necessário
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "msk-sg"
  }
}

resource "aws_msk_cluster" "msk_cluster" {
  cluster_name           = "msk-proposta"
  kafka_version          = "3.6.0"
  number_of_broker_nodes = 2

  broker_node_group_info {
    instance_type   = "kafka.t3.small"
    storage_info {
      ebs_storage_info {
        volume_size = 20
      }
    }
    client_subnets  = [var.aws_subnet_1a_id, var.aws_subnet_1b_id]
    security_groups = [aws_security_group.msk_sg.id]
  }

  encryption_info {
    encryption_in_transit {
      client_broker = "TLS"
      in_cluster    = true
    }
  }

  tags = {
    Environment = "production"
    Project     = "Proposta"
  }
}
