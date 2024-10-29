# spring-cloud-config-server

**Author:** Cem Aktas

---

An SSL-enabled Spring Cloud Config Server example that uses Vault to import its own sensitive configuration data, with Git and Vault composite environment repositories.

### Setup Guide
Start the Vault Container:
```bash
docker-compose up --build -d config-vault
```

Initialize and unseal the vault. Don't forget to enable kv-v2 engine.
Execute the following within the Vault container:
```bash
vault secrets enable -path=secret kv-v2
```

Add secrets for Git and security credentials:
>         ${git.uri}
>         ${git.username}
>         ${git.password}
>         ${security.username}
>         ${security.password}

Run the provided bash script to create a JKS file for SSL:
```bash
./certs/generate-keystore.sh
```

Start the Config Server
```bash
docker-compose up --build -d config-server
```

### Testing the Configuration Server
Once the setup is complete, the Config Server will be available at https://localhost:8888.