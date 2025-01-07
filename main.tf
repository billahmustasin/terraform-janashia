provider "aws" {
  region = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"
}

resource "aws_vpc" "development-vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name: "development"
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "us-east-1a"
    tags = {
      Name: "subnet-1-dev"
      vpc_env: "dev"
  }
}


# data "aws_vpc" "existing_vpc" {
#   default = true #means aws vpc default vpc will be used, go to management console 
# }

# resource "aws_subnet" "dev-subnet-2" {
#   vpc_id = data.aws_vpc.existing_vpc.id
#   cidr_block = "172.31.96.0/20"
#   availability_zone = "us-east-1a"
#   tags = {
#       Name: "subnet-2-default"
#   }
# }