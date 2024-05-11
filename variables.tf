variable "project_id" {
  description = "id do Projeto"
  type        = string
  default     = "oficina-facil-prd"
}

variable "region" {
  description = "Região default dos recursos"
  type        = string
  default     = "southamerica-east1"
}

variable "service_account_email" {
  description = "Email do service account"
  type        = string
  default     = "197343799268-compute@developer.gserviceaccount.com"
}