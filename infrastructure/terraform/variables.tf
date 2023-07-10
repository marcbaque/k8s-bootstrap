# ===================== KUBERNETES CLUSTER VARS =======================



# ===================== ARGOCD HELM CONFIG VARS =======================

variable "argocd_helm_chart_version" {
  type        = string
  default     = "5.16.14"
  description = "ArgoCD Helm chart version to deploy"
}
variable "argocd_helm_chart_timeout_seconds" {
  type        = number
  default     = 300
  description = "Timeout value for Helm chart install/upgrade operations"
}

variable "argocd_k8s_namespace" {
  type        = string
  default     = "argocd"
  description = "Kubernetes namespace to use for the argocd Helm release"
}

variable "argocd_password" {
  type        = string
  default     = ""
  description = "ArgoCD admin password"
}
