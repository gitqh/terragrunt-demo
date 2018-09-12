data "terraform_remote_state" "web-server" {
  backend = "s3"

  config {
    bucket = "terragrunt-demo-state"
    key    = "prod/web-server/terragrunt-state"
    region = "ap-southeast-1"
  }
}

locals {
  frontal_lb = "${data.terraform_remote_state.web-server.frontal_lb}"
}
