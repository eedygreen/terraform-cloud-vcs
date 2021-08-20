# EC2 instance as apache web server

resource "aws_instance" "terraform-cloud" {
  ami           = data.aws_ami.amzlinuz.id
  instance_type = var.ec2_instance_type[1]
  key_name      = "terraform-key" # The key must be created before applying it here
  count         = 1
  tags = {
    "Name" = "terraform-cloud-${count.index}"
  }
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]

  user_data = file("install_server.sh")
}