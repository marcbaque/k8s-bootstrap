resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = var.argocd_k8s_namespace
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_helm_chart_version
  timeout          = var.argocd_helm_chart_timeout_seconds
  create_namespace = true

  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = var.argocd_password
    type  = "string"
  }
}
