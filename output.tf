output "json" {
  value = join(",",
    [for k in keys(var.map):
      templatefile(
        "${path.module}/json_template.tpl", {
          k = k
          v = var.map[k],
        }
      )
    ]
  )
}
