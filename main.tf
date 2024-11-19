provider "aws" {
    region = var.web_region
}

module "module1" {
    source = "./module1"
}

module "module2" {
    source = "./module2"
}