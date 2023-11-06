provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context = "minikube"
}

resource "kubernetes_namespace" "homework" {
  metadata {
    name = "homework"
  }
}

resource "kubernetes_deployment" "web-app" {
  metadata {
    name      = "web-app"
    #namespace = kubernetes_namespace.homework.metadata[0].name
    namespace = "homework"
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "web-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "web-app"
        }
      }

      spec {
        container {
          name  = "web-app"
          image = "nginx:1.21.6"

          resources {
            requests = {
              cpu = "250m"
              memory = "50Mi"
            }
            limits = {
              cpu = "0.5"
              memory = "250Mi"
            }
          }
        }
      }
    }
  }
}
