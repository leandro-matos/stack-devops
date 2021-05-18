output "VPC_ID" {
  value = aws_vpc.default.id
}

output "Public_Subnet_ID" {
  value = aws_subnet.public-subnet.id
}

output "Private_Subnet_ID" {
  value = aws_subnet.private-subnet.id
}

output "Internet_Gateway_ID" {
  value = aws_internet_gateway.igw.id
}

output "Route_Table_ID" {
  value = aws_route_table.web-public-rt.id
}

output "Security_Group_ID" {
  value = aws_security_group.sgweb.id
}

output "CloudWatch_Cpu_Name" {
  value = aws_cloudwatch_metric_alarm.cpu.id
}

output "CloudWatch_HealthCheck_Name" {
  value = aws_cloudwatch_metric_alarm.health.id
}

output "EC2_Instance_Public_DNS" {
  value = aws_instance.wb.public_dns
}

output "EC2_Instance_IP" {
  value = aws_instance.wb.public_ip
}
