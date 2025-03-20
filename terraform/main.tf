provider "aws" {
  region = "eu-west-1" 
}

resource "aws_instance" "docker_server" {
  ami           = "ami-0a89fa9a6d8c7ad98"
  instance_type = "t2.micro"
  key_name      = "docker-server-key" 

  vpc_security_group_ids = [aws_security_group.docker_sg.id]

  tags = {
    Name = "Docker-Server"
  }
}
resource "aws_security_group" "docker_sg" {
  name        = "docker_sg"
  description = "Allow SSH and HTTP traffic"
  vpc_id      = "vpc-0cf8b5765af25bf79"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


output "public_ip" {
  value = aws_instance.docker_server.public_ip
}