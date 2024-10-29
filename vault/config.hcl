storage "file" {
  path = "/vault/file"
}

listener "tcp" {
  address     = "0.0.0.0:8200"
  tls_disable = true
}

disable_mlock = true
ui = true

api_addr = "http://config-vault:8200"
token_explicit_max_ttl = "365d"
max_ttl = "365d"
