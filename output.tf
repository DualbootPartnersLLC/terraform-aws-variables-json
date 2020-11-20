output "json" {
  description = "JSON representation of variables map."

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
