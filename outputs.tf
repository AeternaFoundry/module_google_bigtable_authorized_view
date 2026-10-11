output "bigtable_authorized_views_id" {
  description = "Map of id values across all bigtable_authorized_views, keyed the same as var.bigtable_authorized_views except keys with no id are omitted"
  value       = { for k, v in google_bigtable_authorized_view.bigtable_authorized_views : k => v.id if v.id != null && length(v.id) > 0 }
}
output "bigtable_authorized_views_deletion_policy" {
  description = "Map of deletion_policy values across all bigtable_authorized_views, keyed the same as var.bigtable_authorized_views except keys with no deletion_policy are omitted"
  value       = { for k, v in google_bigtable_authorized_view.bigtable_authorized_views : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "bigtable_authorized_views_deletion_protection" {
  description = "Map of deletion_protection values across all bigtable_authorized_views, keyed the same as var.bigtable_authorized_views except keys with no deletion_protection are omitted"
  value       = { for k, v in google_bigtable_authorized_view.bigtable_authorized_views : k => v.deletion_protection if v.deletion_protection != null && length(v.deletion_protection) > 0 }
}
output "bigtable_authorized_views_instance_name" {
  description = "Map of instance_name values across all bigtable_authorized_views, keyed the same as var.bigtable_authorized_views except keys with no instance_name are omitted"
  value       = { for k, v in google_bigtable_authorized_view.bigtable_authorized_views : k => v.instance_name if v.instance_name != null && length(v.instance_name) > 0 }
}
output "bigtable_authorized_views_name" {
  description = "Map of name values across all bigtable_authorized_views, keyed the same as var.bigtable_authorized_views except keys with no name are omitted"
  value       = { for k, v in google_bigtable_authorized_view.bigtable_authorized_views : k => v.name if v.name != null && length(v.name) > 0 }
}
output "bigtable_authorized_views_project" {
  description = "Map of project values across all bigtable_authorized_views, keyed the same as var.bigtable_authorized_views except keys with no project are omitted"
  value       = { for k, v in google_bigtable_authorized_view.bigtable_authorized_views : k => v.project if v.project != null && length(v.project) > 0 }
}
output "bigtable_authorized_views_subset_view" {
  description = "Map of subset_view values across all bigtable_authorized_views, keyed the same as var.bigtable_authorized_views except keys with no subset_view are omitted"
  value       = { for k, v in google_bigtable_authorized_view.bigtable_authorized_views : k => one(v.subset_view) if v.subset_view != null && length(v.subset_view) > 0 }
}
output "bigtable_authorized_views_table_name" {
  description = "Map of table_name values across all bigtable_authorized_views, keyed the same as var.bigtable_authorized_views except keys with no table_name are omitted"
  value       = { for k, v in google_bigtable_authorized_view.bigtable_authorized_views : k => v.table_name if v.table_name != null && length(v.table_name) > 0 }
}

