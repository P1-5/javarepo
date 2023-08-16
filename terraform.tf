provider "aws" {
    region = "ap-south-1"
}
resource "aws_security_group" "inbound_rules" {
    name = "aws_security_group"
    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]
    
    }


}
resource "aws_instance" "javawebapp" {
    
    ami = "ami-0da59f1af71ea4ad2"
    instance_type = "t2.micro"
    key_name = "key"
    vpc_security_group_ids = [ aws_security_group.inbound_rules.id ]
    tags={
        name="javawebapp"
    }
  
}