resource "kubernetes_deployment" "tejaspress" {
 metadata {
  name = "wordpressapplication"
 }
spec {
 replicas = 3
 selector {
  match_labels = {
   env = "production"
   region = "IN"
   App = "wordpress"
  }
  match_expressions {
   key = "env"
   operator = "In"
   values = ["production" , "webserver"]
  }
 }
 template {
  metadata {
   labels = {
    env = "production"
    region = "IN"
    App = "wordpress"
   }
  }
  spec {
   container {
    image = "wordpress"
    name = "wordpress1" 
    }
   }
  }
 }
}
resource "kubernetes_service" "tejaslb" {
 metadata {
  name = "tejaslb"
 }
 spec {
  selector = {
   app = "wordpress"
  }
  port {
   protocol = "TCP"
   port = 80
   target_port = 80
  }
  type = "NodePort"
 }
}