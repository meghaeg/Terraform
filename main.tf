data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_instance" "dev_server" {

  count = length(data.aws_availability_zones.available.names)

  ami           = var.ami_id
  instance_type = var.instance_type

  availability_zone = data.aws_availability_zones.available.names[count.index]

  user_data = file("userdata.sh")

  tags = {
    Name = "Terraform-${data.aws_availability_zones.available.names[count.index]}-Server-${count.index + 1}"
  }
}
