#creating aws instance
resource "aws_instance" "ec2-01" {
    ami= "ami-0d5eff06f840b45e9"
    region= "us-east-1"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    tags ={
        Name= "Jenkins-demo"
        }
    }
