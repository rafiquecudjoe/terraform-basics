# Terraform

provider "aws" {

  region = "eu-west-2"

}

resource "aws_s3_bucket" "terraform-bucket" {

    bucket = "rafique-azubi-assignment-bucket"
 
}

module "s3_user" {
  source = "cloudposse/iam-s3-user/aws"
  version = "1.2.0"
  name = "azubi-rafique"
  s3_actions = ["s3:GetObject","s3:PutObject"]
  s3_resources = ["arn:aws:s3:::rafique-azubi-assignment-bucket/*"]
}
