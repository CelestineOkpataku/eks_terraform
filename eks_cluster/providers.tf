

provider "kubernetes" {
    host = module.eks_blueprints.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(module.eks_blueprints.eks_cluster_certificate_authority_data)

    exec {
        api_version = "client.authentication.k8s.io/v1"
        command = "aws"
        #This requires awscli to be installed locally where Terraform is executed

        args = ["eks", "get-token", "--cluster-name", module.eks_blueprints.eks_cluster_id]
    }
}

