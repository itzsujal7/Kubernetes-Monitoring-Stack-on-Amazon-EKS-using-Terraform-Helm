terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "project-4-EKS-Cluster"
  cluster_version = "1.31"

  vpc_id     = "vpc-0c2ab99b50f86e11b"
  subnet_ids = ["subnet-04ebaf1850b910ade", "subnet-0441feab4caf9e880"]

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  eks_managed_node_groups = {
    default = {
      desired_size = 2
      min_size     = 1
      max_size     = 3

      instance_types = ["t2.medium"]
    }
  }
}
