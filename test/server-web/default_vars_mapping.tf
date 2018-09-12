data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "terragrunt-demo-state"
    key    = "test/network/terragrunt-state"
    region = "ap-southeast-1"
  }
}

data "terraform_remote_state" "bastion" {
  backend = "s3"

  config {
    bucket = "terragrunt-demo-state"
    key    = "test/bastion/terragrunt-state"
    region = "ap-southeast-1"
  }
}

locals {
  vpc_id           = "${data.terraform_remote_state.network.vpc_id}"
  server_subnet_id = "${data.terraform_remote_state.network.server_subnet_id}"
  bastion_sg_id    = "${data.terraform_remote_state.bastion.bastion_sg_id}"
}
