provider "github" {
  organization = "mig4-ez"
}

locals {
  repos = toset(["cci-test-01", "cci-test-02"])
  context = {
    alpine_image_tag  = "alpine:3.7"
    architect_orb = "giantswarm/architect@0.8.14"
    a_list = ["foo", "bar", "baz"]
    a_map = {
      k1 = "quux"
    }
  }
}

resource "local_file" "circleconf" {
  filename          = "out-circleci-conf.yaml"
  sensitive_content = templatefile("${path.module}/circleci-config.yml.tpl", local.context)
  file_permission   = "0644"
}

resource "github_repository_file" "circleconf" {
  for_each = local.repos

  repository = each.value
  file       = ".circleci/config.yml"
  content    = templatefile("${path.module}/circleci-config.yml.tpl", local.context)
}
