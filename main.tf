resource "aws_security_group" "devops_sg" {

  name = "devops-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
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

resource "aws_instance" "dev_server" {

  ami           = var.ami_id
  instance_type = var.instance_type

  user_data = file("userdata.sh")

  vpc_security_group_ids = [aws_security_group.devops_sg.id]

  tags = {
    Name = "ALLSERVER"
  }
}

