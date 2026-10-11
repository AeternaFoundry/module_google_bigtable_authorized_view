variable "bigtable_authorized_views" {
  description = <<EOT
Map of bigtable_authorized_views, attributes below
Required:
    - instance_name
    - name
    - table_name
Optional:
    - deletion_policy
    - deletion_protection
    - project
    - subset_view (block):
        - family_subsets (optional, block):
            - family_name (required)
            - qualifier_prefixes (optional)
            - qualifiers (optional)
        - row_prefixes (optional)
    - timeouts (block):
        - create (optional)
        - update (optional)
EOT

  type = map(object({
    instance_name       = string
    name                = string
    table_name          = string
    deletion_policy     = optional(string)
    deletion_protection = optional(string)
    project             = optional(string)
    subset_view = optional(object({
      family_subsets = optional(list(object({
        family_name        = string
        qualifier_prefixes = optional(set(string))
        qualifiers         = optional(set(string))
      })))
      row_prefixes = optional(set(string))
    }))
    timeouts = optional(object({
      create = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.bigtable_authorized_views : (
        v.deletion_protection == null || (contains(["PROTECTED", "UNPROTECTED"], v.deletion_protection))
      )
    ])
    error_message = "must be one of: \"PROTECTED\", \"UNPROTECTED\""
  }
}

