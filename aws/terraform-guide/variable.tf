# # No default value
# variable "instance_type" {
#   type        = string
#   description = "EC2 Instance Type"
#   default     = "t2.micro"
# }

# variable "project_environment" {
#   description = "project name and environment"
#   type        = map(string)
#   default = {
#     project     = "project-alpha",
#     environment = "dev"
#     Name        = "Terraform EC2"
#   }
# }

# # default value for the variable location
# variable "location" {
#   type        = string
#   description = "The project region"
#   default     = "ap-south-1"
# }


variable "instance_type" {
}
variable "location" {
}
variable "aws_ami" {
}
variable "project_environment" {
}
variable "access_key" {
}
variable "secret_key" {
}
variable "instance_count" {
}
variable "aws_key" {
}
variable "public_ssh_key" {
}
