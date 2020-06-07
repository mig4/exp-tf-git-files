# tf-git-files

An experiment with managing file in Git repositories on GitHub with Terraform.

## Usage

Terraform needs to maintain state of resources so when you want to manage a
file that already exists in a repo you need to import it into state file so
Terraform is aware of it (contents don't matter, it will manage drift).

``` sh
terraform import 'github_repository_file.circleconf["cci-test-02"]' cci-test-02/.circleci/config.yml
```

then just `terraform apply` to keep everything in sync.
