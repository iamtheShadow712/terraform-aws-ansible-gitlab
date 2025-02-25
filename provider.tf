terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.88.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
  backend "http" {
  }
}

provider "aws" {
  region = var.aws_region
}
