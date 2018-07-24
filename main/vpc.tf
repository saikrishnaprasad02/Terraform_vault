resource "aws_vpc" "vpc_main" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support = true
  enable_dns_hostnames = true

  tags {
    Name = "Main VPC"
  }
}
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.vpc_main.id}"
}

resource "aws_route" "internet_access" {
  route_table_id          = "${aws_vpc.vpc_main.main_route_table_id}"
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = "${aws_internet_gateway.default.id}"
}

# Create a public subnet to launch our load balancers
resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.vpc_main.id}"
  cidr_block              = "10.0.1.0/24" # 10.0.1.0 - 10.0.1.255 (256)
  map_public_ip_on_launch = true
}

# Create a private subnet to launch our backend instances
resource "aws_subnet" "private" {
  vpc_id                  = "${aws_vpc.vpc_main.id}"
  cidr_block              = "10.0.16.0/20" # 10.0.16.0 - 10.0.31.255 (4096)
  map_public_ip_on_launch = true
}
