
# Configure the google provider
provider "google" {
  credentials = file("dev1-284604-bd7c8d3df290.json")
  project     = "dev1-284604"
  region      = "europe-west4"
  zone        = "europe-west4-a"
}

# Enable Compute Engine API in project
# Enable Billing in project
# Configure the virtual machine instance in GCP
resource "google_compute_instance" "default" {
  name         = "test"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  # To keep the setup simple you can set the network_interface to default
  # For Advance network setup refer to Point-7 : Setup Network and Firewall for virtual machine
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}
