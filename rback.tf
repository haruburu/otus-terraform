resource "kubernetes_manifest" "role_pod_reader" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "Role"
    "metadata" = {
      "name" = "pod-reader"
      "namespace" = "default"
    }
    "rules" = [
      {
        "apiGroups" = [
          "",
        ]
        "resources" = [
          "pods",
        ]
        "verbs" = [
          "get",
          "watch",
          "list",
        ]
      },
    ]
  }
}

resource "kubernetes_manifest" "rolebinding_read_pods" {
  manifest = {
    "apiVersion" = "rbac.authorization.k8s.io/v1"
    "kind" = "RoleBinding"
    "metadata" = {
      "name" = "read-pods"
      "namespace" = "default"
    }
    "roleRef" = {
      "apiGroup" = "rbac.authorization.k8s.io"
      "kind" = "Role"
      "name" = "pod-reader"
    }
    "subjects" = [
      {
        "apiGroup" = "rbac.authorization.k8s.io"
        "kind" = "User"
        "name" = "user1"
      },
    ]
  }
}