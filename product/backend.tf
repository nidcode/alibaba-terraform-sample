terraform {
  backend "s3" {
    bucket = "senshin-tfstate"
    key    = "alibaba/product/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
