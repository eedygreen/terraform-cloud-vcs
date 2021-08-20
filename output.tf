# Attribute reference public ip
output "instance_public_ip" {
  description = "The public ip of EC2 instance"
  value = aws_instance.terraform-cloud.*.public_ip
}

output "instance_private_ip" {
  description = "The privae ip of EC2 instance"
  value = aws_instance.terraform-cloud.*.private_ip
}

output "security_groups" {
    description = "list of security groups"
    value = aws_instance.terraform-cloud.*.security_groups
}

output "public_dns" {
  description = "Public DNS URL of EC2 instance"
  value = "http://${aws_instance.terraform-cloud.*.public_dns}"
  sensitive = true # surpress sensitive variable
}

# * must be used because of count index to avoid the following error
/* 
Error: Missing resource instance key
│ 
│   on output.tf line 19, in output "public_dns":
│   19:   value = "http://${aws_instance.terraform-cloud.public_dns}"
│ 
│ Because aws_instance.terraform-cloud has "count" set, its attributes must be accessed on
│ specific instances.
│ 
│ For example, to correlate with indices of a referring resource, use:
│     aws_instance.terraform-cloud[count.index]
*/