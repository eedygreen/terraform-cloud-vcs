variable "aws_region" {
  description = "AWS Region for infratructure resources"
  type        = string
  default     = "us-east-1"
}
/* # ami is updated from data source
variable "ec2_ami_id" {
  description = "Amazon Linux machine identity"
  type        = string
  default     = "ami-047a51fa27710B16e"
}
*/

# promp for input - prompt variables don't have value assigned
variable "ec2_instance_type" {
  description = "EC2 instance Type"
  type        = list(string)
  default = [ "t3.medium", "t3.small", "t2.micro" ]
}

variable "num_instance" {
  description = "Number of EC2 instance"
  type = number
  default = 2
}