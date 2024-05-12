resource "google_secret_manager_secret" "token_private_key" {
  project = var.project_id
  secret_id = "TOKEN_PRIVATE_KEY"
  replication {
    user_managed {
      replicas {
        location = var.region 
      }
    }
  }
}

resource "google_secret_manager_secret_version" "token_private_key" {
  secret = google_secret_manager_secret.token_private_key.id
  secret_data = "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCsujZg/Fxhytbh\nIbpMF8n/ExSv4ZKPhAiWsfUXvAyhRZrkjCX2Kd3a/1xRZY5myZS+A1RG4Uzv+UTY\nEdoNvypHsqySu7K6MRDuSNoPF5BslbH0cmsPeLXuMX2Oty644JrpTDS34WnUbnoT\nskUyeoJPtX1eaMnRn5b9mrWhMkFlLZHiMmefHwcno+/nd3p0/Se8+tFi9W4ZRD2f\nVFezAz6UfM9ixf6G1sHX/II+C5hj8nj/viiSDDsn/+M89uAfxcHxSrnyfKj15glm\n+A9FaFMYFtHt4cgb5G2cADQb03q/5V2cjASL+527fjVZbdA+LfxBqaTX2UOUlrry\n3MaNXtcjAgMBAAECggEAGJu7DZxGqSQV8yM0AI1PGQkl5Fz13X6JHrch3QzMm9ln\n1PHmoqiaVA4Xn/0hCaHkkCG3SxXkOThBR6tbbqPyqR5amdkmAILnD5vPfWD1EZNO\nNC5s9FpVSSdB5ShR/sL5Lw3NYPk7c6l9uPqoAyYTFLodr2qsfjIHeAAnqlyXloto\nOlIax4CxeekuiHJ3lTouIHe86+4naKg/kGfLojMYreW114ch7EWtyXIGOgCE57e6\ny4cRcov39DQ4taSioqcb2rZ8Ehh+FxDIolRdntecJOKgZdHik3Ag8jIhge8qfJby\n8Vn+GiCYRwtINTOql+QM+ettA7VhnTOzBti7tDaTiQKBgQDqv0JYjTexrGKyGD4C\nNgahgkRgCocvI0C41L1nJeJewj/CMaaXRxH8hICt3Y2pvWyP8Ys2ci9rDOhwXMQH\n1LiaGkkPrhtOTIL5fLbaugJe0OhQfuKNUlWO9i8rY1/nDad68PWxZW0FttCUVknS\nBUiIq8ffEU53Vf29ha6egdzzvwKBgQC8XYU8gxJFUNlQ2Pw3r3b3johXvw2r0JkM\noO6e5rWzka+xR+hWBQXw+MpyB08M4sUfK9BhJlJd4Of9qxu5W6VrkRTyHP4tynTP\nScdAk0LHDXIxQG8OVY+8jvmz6lxetFBEpzrDq4OknOn39+AVtDs30MOrbGGwkGBW\nqA2KpA1lnQKBgQDQEbCT3q/T2xEr/FLSEOL1uwox+oLyJBQU//PVfn3UMebjkLCx\ne7wUj7mi4jLTleOo/pa/LpybDTjlh0P2EPWDGfNSY6cuUqDw1DsbSi4Zrp+L4bub\nObQ+YDVVBuMVYEPns7aCg30LyIu+P3F1J1uwUFp7fNKI8f5TQy+QrViT7wKBgQCN\nZ29T49lda7oX9Swx6WjXooo7xNLQfoHGdzFq3CrfKKjJ3v9NQ+wX38yqGU6Aj+QG\n6G8/3vLKQsIlLcRcO65Mt9cPgjBV07wouGv50BK7Nx7YVlSIYDbNCE/vfinldlsj\njp6QsTrb4mfJnKz93hTua6vYDj6vu1J2+yVfRJRCCQKBgAxdt89OQsYAnQKeIYOj\nSovV1QPOqIuQollPCyADYDZQgeg0HInepWJCFk1PAGHitPJvpk4cj7Vfy0XkgkAT\nYCB+W6qVBJxTgHb9308W33hX8VFAaMw9omeBQ6YQnhxZ784PDt7PYMXSZ9LYPOtj\n1RGutxJ1c4ZdmQPKSLlS3Yjw\n-----END PRIVATE KEY-----\n"
}

resource "google_secret_manager_secret_iam_member" "token_private_key" {
  project = var.project_id
  secret_id = google_secret_manager_secret.token_private_key.secret_id
  role = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${var.service_account_email}"
}

resource "google_secret_manager_secret" "mongodb_url" {
  project = var.project_id
  secret_id = "MONGODB_URL"
  replication {
    user_managed {
      replicas {
        location = var.region 
      }
    }
  }
}

resource "google_secret_manager_secret_version" "mongodb_url" {
  secret = google_secret_manager_secret.mongodb_url.id
  secret_data = "mongodb+srv://fiaptcgrupo22:mongo2024@serverlessinstance0.25wwxch.mongodb.net/?retryWrites=true&w=majority&appName=ServerlessInstance0"
}

resource "google_secret_manager_secret_iam_member" "mongodb_url" {
  project = var.project_id
  secret_id = google_secret_manager_secret.mongodb_url.secret_id
  role = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${var.service_account_email}"
}

resource "google_secret_manager_secret" "service_account" {
  project = var.project_id
  secret_id = "GOOGLE_APPLICATION_CREDENTIALS"
  replication {
    user_managed {
      replicas {
        location = "southamerica-east1" 
      }
    }
  }
}

resource "google_secret_manager_secret_version" "service_account" {
  secret = google_secret_manager_secret.service_account.id
  secret_data = file("oficina-facil-prd-c1ed73d0899a.json")
}

resource "google_secret_manager_secret_iam_member" "service_account" {
  project = var.project_id
  secret_id = google_secret_manager_secret.service_account.secret_id
  role = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${var.service_account_email}"
}
