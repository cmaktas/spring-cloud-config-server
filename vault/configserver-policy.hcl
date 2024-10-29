path "secret/data/config-server" {
  capabilities = ["read", "list"]
}

path "secret/metadata/config-server" {
  capabilities = ["list"]
}

path "secret/data/client-backend" {
  capabilities = ["read", "list"]
}

path "secret/metadata/client-backend" {
  capabilities = ["list"]
}

path "secret/data/client-backend/test" {
  capabilities = ["read", "list"]
}

path "secret/metadata/client-backend/test" {
  capabilities = ["list"]
}
