/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


module "bucket" {
  source = "app.terraform.io/omkar-tfcloud-org01/cloud-gcs/google"
  version = "1.0.0"

  name       = "${var.project_id}-bucket"
  project_id = var.project_id
  location   = "europe-west3"

  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age        = 365
      with_state = "ANY"
    }
  }]

  iam_members = [{
    role   = "roles/storage.objectViewer"
    member = "user:omkar.o.sonawane@henkel.com"
  }]
}
