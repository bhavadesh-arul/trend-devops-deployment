provider "aws" {
  region = "ap-south-1"
}

# VPC
resource "aws_vpc" "trend_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "trend-vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "trend_igw" {
  vpc_id = aws_vpc.trend_vpc.id
  tags = {
    Name = "trend-igw"
  }
}

# Subnet
resource "aws_subnet" "trend_subnet" {
  vpc_id                  = aws_vpc.trend_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "trend-subnet"
  }
}

# Route Table
resource "aws_route_table" "trend_rt" {
  vpc_id = aws_vpc.trend_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.trend_igw.id
  }
  tags = {
    Name = "trend-rt"
  }
}

# Route Table Association
resource "aws_route_table_association" "trend_rta" {
  subnet_id      = aws_subnet.trend_subnet.id
  route_table_id = aws_route_table.trend_rt.id
}

# Security Group for Jenkins
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins-sg"
  description = "Allow SSH and Jenkins"
  vpc_id      = aws_vpc.trend_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 for Jenkins
resource "aws_instance" "jenkins_ec2" {
  ami                         = "ami-0f5ee92e2d63afc18"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.trend_subnet.id
  vpc_security_group_ids      = [aws_security_group.jenkins_sg.id]
  associate_public_ip_address = true
  key_name                    = "jenkins-key"

  tags = {
    Name = "jenkins-server"
  }
}