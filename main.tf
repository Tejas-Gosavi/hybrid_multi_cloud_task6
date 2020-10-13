resource "null_resource" "minikubeservice" {
	  provisioner "local-exec" {
	    command = "minikube service list"
	    
	  }
	  depends_on = [
	      kubernetes_deployment.tejaspress,
	      kubernetes_service.tejaslb,
	      aws_db_instance.tejasdb
	 
	     ]
	}