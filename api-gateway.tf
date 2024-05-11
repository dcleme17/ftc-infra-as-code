resource "google_api_gateway_api" "default" {
  provider     = google-beta
  api_id       = "backend"
  display_name = "backend"
  project      = var.project_id
}

resource "google_api_gateway_api_config" "default" {
  provider      = google-beta
  api           = google_api_gateway_api.default.api_id
  api_config_id = "cfg-backend"

  gateway_config {
    backend_config {
      google_service_account = var.service_account_email
    }
  }
  openapi_documents {
    document {
      path = "cfg-backend.yaml"
      contents = base64encode(templatefile("swagger.yaml", {
        titulo    = "BFF para o Cloud Run"
        descricao = "API gateway"
        })
      )
    }
  }
}

resource "google_api_gateway_gateway" "default" {
  provider   = google-beta
  api_config = google_api_gateway_api_config.default.id
  gateway_id = "backend"
  region     = "us-east1"
  project    = var.project_id
}
