data "template_file" "values_nexus" {
  template = file("${path.module}/custom_values/values_nexus.yaml")
}

data "template_file" "values_grafana" {
  template = file("${path.module}/custom_values/values_grafana.yaml")
}

data "template_file" "values_prometheus" {
  template = file("${path.module}/custom_values/values_prometheus.yaml")
}

data "template_file" "values_argocd" {
  template = file("${path.module}/custom_values/values_argo.yaml")
  vars = {
    repo_url  = var.repo_url
    app_url   = var.repo_app_url
    app_name  = var.argo_repo_name
  }
}