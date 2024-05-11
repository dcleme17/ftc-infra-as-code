resource "google_artifact_registry_repository" "default" {
  project       = var.project_id
  location      = var.region
  repository_id = "fiap"
  format        = "DOCKER"
  description   = "containers do tech challange da FIAP"
}