# Define the EKS cluster
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_name    = "eks-test"                                               # Replace with your cluster name
  cluster_version = "1.28"                                                   # Replace with your desired Kubernetes version
  subnets         = ["subnet-0747121fd70781052", "subnet-0434ed7655f151532"] #["subnet-0fb5b4cead47de28b", "subnet-0e6c5340fba36ee19"]  # Replace with your subnet IDs
  vpc_id          = "vpc-01c4cf11d0ead2523"                                  # "vpc-05d8be8e4f35947f1"     # Replace with your VPC ID - vpc-0cae438d416627f8f

  node_groups = {
    eks_nodes = {
      desired_capacity = 2          # Replace with the desired node count
      max_capacity     = 3          # Replace with the maximum node count
      min_capacity     = 1          # Replace with the minimum node count
      instance_type    = "t3.small"   #"t2.micro" # Replace with your desired EC2 instance type
    }
  }

  tags = {
    Terraform   = "true"
    Environment = "dev" # Replace with your environment
  }
}
