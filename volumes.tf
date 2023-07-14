resource "kubernetes_persistent_volume" "nexus_pv" {
  metadata {
    name = "nexus-pv"
  }

  spec {
    capacity = {
      storage = "10Gi"
    }

    access_modes = ["ReadWriteOnce"]

    persistent_volume_source {
      host_path {
        path = "/home/mjc/Documents/terra-minikube/nexus-pv"
      }
    }
  }
}

# resource "kubernetes_persistent_volume_claim" "nexus_pvc" {
#   metadata {
#     name = "nexus-pv-claim"
#   }
#   spec {
#     access_modes = ["ReadWriteOnce"]
#     resources {
#       requests = {
#         storage = "10Gi"
#       }
#     }
#     volume_name = kubernetes_persistent_volume.nexus_pv.metadata[0].name
#   }
# }