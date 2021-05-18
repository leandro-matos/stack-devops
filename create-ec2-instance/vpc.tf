# Definir VPC
resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "server VPC"
  }
}

# Definir public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet_cidr
  #availability_zone = "us-east-1a"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "Server Public Subnet"
  }
}

# Definir private subnet
resource "aws_subnet" "private-subnet" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_cidr
  #availability_zone = "us-east-1b"
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "Server Private Subnet"
  }
}

# Definir internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "Server VPC IGW"
  }
}

# Definir route table
resource "aws_route_table" "web-public-rt" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "Server Public Subnet RT"
  }
}

resource "aws_route_table_association" "web-public-rt" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.web-public-rt.id
}