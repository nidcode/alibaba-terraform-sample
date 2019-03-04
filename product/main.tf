provider "alicloud" {
  region = "${var.region}"
}

data "alicloud_zones" main {
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone = "${data.alicloud_zones.main.zones.0.id}"
  cpu_core_count    = 1
  memory_size       = 2
}

resource "alicloud_cs_kubernetes" "main" {
  name_prefix           = "${var.cluster-name}"
  availability_zone     = "${data.alicloud_zones.main.zones.0.id}"
  new_nat_gateway       = true
  master_instance_types = ["${data.alicloud_instance_types.default.instance_types.0.id}"]
  worker_instance_types = ["${data.alicloud_instance_types.default.instance_types.0.id}"]
  worker_numbers        = [2]
  key_name              = "qu"
  pod_cidr              = "172.20.0.0/16"
  service_cidr          = "172.21.0.0/20"
  install_cloud_monitor = true
  worker_disk_category  = "cloud_efficiency"
}
