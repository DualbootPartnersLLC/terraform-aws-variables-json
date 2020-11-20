# Terraform module for transforming a map of values into a valid JSON

This module can be useful if you need to inject a list of environment variables into
[AWS ECS task definition](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html).

## Usage example

```terraform
locals {
  app_env_vars = {
    AWS_REGION            = "us-east-1"
    AWS_ACCESS_KEY_ID     = "some_access_key"
    AWS_SECRET_ACCESS_KEY = "some_secret_access_key"
    REDIS_URL             = "redis://${module.redis.endpoint}:${module.redis.port}"
    S3_BUCKET_NAME        = module.s3.bucket_name
  }
}

module "variables" {
  source  = "DualbootPartnersLLC/variables-json/aws"
  version = "1.0.2"
  map     = local.app_env_vars
}

module "app" {
  source = "<path/to/app/module>"
  env_vars = module.variables.json
}

```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| map | Map of variables. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| json | JSON representation of variables map |
