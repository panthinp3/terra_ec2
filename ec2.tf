provider "aws" {
  profile = "default"
  region= "us-east-1"
}

#creating aws instance
resource "aws_instance" "ec2-01" {
    ami= "ami-0d5eff06f840b45e9"
    instance_type = "t2.micro"
    tags ={
        Name= "Jenkins-demo"
        }
    }
