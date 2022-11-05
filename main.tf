terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "web01" {
  ami           = var.ami-var
  instance_type = var.instance_type-var
  subnet_id     = aws_subnet.sub1.id
  user_data     = file("jenkinsinstall.sh")
  depends_on = [
    aws_internet_gateway.gateway
  ]
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = "project-jenkins-terr"
  }
}

resource "aws_instance" "web02" {
  ami           = var.ami-var
  instance_type = var.instance_type-var
  subnet_id     = aws_subnet.sub1.id
  user_data     = file("jenkinsinstall.sh")
  depends_on = [
    aws_internet_gateway.gateway
  ]
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {
    Name = "project-docker-terr"
  }
}
