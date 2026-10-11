resource "google_bigtable_authorized_view" "bigtable_authorized_views" {
  for_each = var.bigtable_authorized_views

  instance_name       = each.value.instance_name
  name                = each.value.name
  table_name          = each.value.table_name
  deletion_policy     = each.value.deletion_policy
  deletion_protection = each.value.deletion_protection
  project             = each.value.project

  dynamic "subset_view" {
    for_each = each.value.subset_view != null ? [each.value.subset_view] : []
    content {
      dynamic "family_subsets" {
        for_each = subset_view.value.family_subsets != null ? subset_view.value.family_subsets : []
        content {
          family_name        = family_subsets.value.family_name
          qualifier_prefixes = family_subsets.value.qualifier_prefixes
          qualifiers         = family_subsets.value.qualifiers
        }
      }
      row_prefixes = subset_view.value.row_prefixes
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      update = timeouts.value.update
    }
  }
}

