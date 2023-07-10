terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.21.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.10.1"
    }
  }
}

locals {
  endpoint               = kind_cluster.default.endpoint
  client_certificate     = kind_cluster.default.client_certificate
  client_key             = kind_cluster.default.client_key
  cluster_ca_certificate = kind_cluster.default.cluster_ca_certificate
}

provider "kind" {}

provider "kubernetes" {
  host                   = local.endpoint
  client_certificate     = local.client_certificate
  client_key             = local.client_key
  cluster_ca_certificate = local.cluster_ca_certificate
}

provider "helm" {
  kubernetes {
    host                   = local.endpoint
    client_certificate     = local.client_certificate
    client_key             = local.client_key
    cluster_ca_certificate = local.cluster_ca_certificate
  }
}
