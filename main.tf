### MINIKUBE LAB ###

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "nexus" {
  metadata {
    name = var.nexus_namespace
  }
}
resource "kubernetes_namespace" "grafana" {
  metadata {
    name = var.grafana_namespace
  }
}

resource "kubernetes_namespace" "prometheus" {
  metadata {
    name = var.prometheus_namespace
  }
}

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.argocd_namespace
  }
}
resource "helm_release" "nexus" {
  name        = "nexus"

  repository  = "https://sonatype.github.io/helm3-charts"
  chart       = "nexus-repository-manager"
  version     = "55.0.0"  # versión específica del chart
  namespace   = kubernetes_namespace.nexus.metadata[0].name

  values = [data.template_file.values_nexus.rendered]
  depends_on = [ 
    kubernetes_namespace.nexus
   ]
}

resource "helm_release" "grafana" {
  name = "grafana"

  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = "6.57.2"

  namespace        = kubernetes_namespace.grafana.metadata[0].name
  wait             = true
  timeout          = 300

  values = [data.template_file.values_grafana.rendered]
  depends_on = [
    kubernetes_namespace.grafana
  ]
}

resource "helm_release" "prometheus" {
  name = "prometheus"

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = "22.6.7"

  namespace        = kubernetes_namespace.prometheus.metadata[0].name
  wait             = true
  timeout          = 300

  values = [data.template_file.values_prometheus.rendered]
  depends_on = [
    kubernetes_namespace.grafana
  ]
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.37.0"  #versión específica del chart
  namespace        = kubernetes_namespace.argocd.metadata[0].name

  values = [data.template_file.values_argocd.rendered]
  
}