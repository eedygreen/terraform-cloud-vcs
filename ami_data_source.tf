data "aws_ami" "amzlinuz" {
  most_recent = true
  owners = [ "amazon" ]
  executable_users = [ "self" ]

  filter {
    name = "name"
    values = [ "amzn2-ami-hvm-*-gp2" ]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}