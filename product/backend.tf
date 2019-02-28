terraform {
  bakend "s3" {
    bucket = "senshin-tfstates"
    key    = "alibaba/product/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
