module "servers" {
  source = "./ec2"
  count = var.servers_enabled ? 1 : 0
}

