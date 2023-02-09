  resource "aws_vpc" "task_1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "vpc_task1"
  }
}
resource "aws_internet_gateway" "task1_gw" {
  vpc_id = aws_vpc.task_1.id

  tags = {
    Name = "task1_gw"
  }
}
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.task_1.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "task1_subnet1"
  }
}
resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.task_1.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "task1_subnet2"
  }
}
resource "aws_subnet" "subnet3" {
  vpc_id     = aws_vpc.task_1.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "task1_subnet3"
  }
}
resource "aws_route_table" "task1_rt" {
  vpc_id = aws_vpc.task_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.task1_gw.id
  }
 
    tags = {
    Name = "task1_rt"
  }
}