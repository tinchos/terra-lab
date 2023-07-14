variable "nexus_namespace" {
  type    = string
  default = "nexus"
}

variable "grafana_namespace" {
  type    = string
  default = "grafana"
}

variable "prometheus_namespace" {
  type    = string
  default = "prometheus"
}

variable "argocd_namespace" {
  type    = string
  default = "argocd"
}

variable "repo_url" {
  description = "Github repo url"
  type        = string
  default     = "https://github.com/tinchos"
}

variable "repo_app_url" {
  description = "Github repo APP url"
  type        = string
  default     = "https://github.com/tinchos/argo-demo.git"
}

variable "argo_repo_name" {
  description = "Nombre de repositio APP"
  type        = string
  default     = "argo-demo"
}

variable "github_username" {
  type    = string
  default = "your_github_username"
}

variable "github_token" {
  type    = string
  default = "your_github_token"
}
