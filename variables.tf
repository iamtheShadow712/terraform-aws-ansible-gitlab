variable "instance_count" {
  default = 3
  type    = number
}

variable "instance_type" {
  default = "t2.micro"
  type    = string
}

variable "instance_ami" {
  default = "ami-029f33a91738d30e9"
  type    = string
}

variable "aws_region" {
  default = "us-east-1"
  type    = string
}

variable "availability_zone" {
  default = "us-east-1a"
  type    = string
}
