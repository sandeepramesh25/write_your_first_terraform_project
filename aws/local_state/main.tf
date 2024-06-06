terraform {
  backend "s3" {
    bucket = "905417994036-terraform-states"
    key = "some_environment/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    kms_key_id = "88cc7455-f5bb-4cc2-89de-3b980ba243d0"
    dynamodb_table = "terraform-lock"

  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server2" {
  ami           = "ami-04b70fa74e45c3917"
  instance_type = "t2.micro"

  tags = {
    Name = "Terraform_Demo4" }
}

