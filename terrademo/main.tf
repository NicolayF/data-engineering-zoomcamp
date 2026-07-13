terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.39.0"
    }
  }
}

provider "google" {
  project     = "terraform-demo-502221"
  region      = "us-central1"
}

resource "google_storage_bucket" "auto-expire" {
  name          = "terraform-demo-502221-terra-bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "Delete"
    }
  }
}