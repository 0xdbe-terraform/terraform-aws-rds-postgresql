provider "aws" {
  region = "us-east-2"
  default_tags {
    tags = {
      Environment = "Test"
      Owner       = "0xdbe"
    }
  }
}