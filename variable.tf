variable "ami_id" {
    default = "ami-0557a15b87f6559cf"
  
}

variable "instance_type" {
    type = string
    default = "t2.micro"
  
}

variable "security_group_id" {}

variable "ami_id" {
    default = "ami-0557a15b87f6559cf"

}

variable "instance_type" {
    type = string
    default = "t2.micro"

}

#variable "security_group_id" {}

data "aws_security_group" "launch-wizard-1" {
  id = "sg-0cf0081f588e7faef"
}