resource "aws_ec2_managed_prefix_list" "allowed_ips" {
  name           = "${var.project}-${var.environment}-allowed-ips"
  address_family = "IPv4"
  max_entries    = 5

  dynamic "entry" {
    for_each = var.allowed_ip
    content {
      cidr        = entry.value.cidr
      description = entry.value.description
    }
  }

  tags = {
    Name    = "${var.project}-${var.environment}-allowed-ips"
    Project = var.project
    Env     = var.environment
  }
}