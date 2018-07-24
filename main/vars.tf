variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default= "us-west-2"
}
variable "user_data" {
  description = "Instance user data. Do not pass gzip-compressed data via this argument"
  default     = ""
}
