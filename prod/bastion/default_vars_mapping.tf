data "terraform_remote_state" "network" {
  backend = "s3"

  config {
    bucket = "terragrunt-demo-state"
    key    = "prod/network/terragrunt-state"
    region = "ap-southeast-1"
  }
}

locals {
  vpc_id            = "${data.terraform_remote_state.network.vpc_id}"
  bastion_subnet_id = "${data.terraform_remote_state.network.bastion_subnet_id}"
}
