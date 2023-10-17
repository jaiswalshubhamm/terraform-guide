variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
  default     = "t2.micro"

}
variable "aws_ami" {
  type        = string
  description = "AWS ami"
  default     = "ami-09417eee4ac0ef01e"

}
variable "aws_key" {
  type        = string
  description = "AWS public key variable"
  default     = "aws_key2"
}
