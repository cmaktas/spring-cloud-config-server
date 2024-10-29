#!/bin/bash

# Variables for JKS generation
KEYSTORE_NAME="config-server.jks"
KEYSTORE_PASSWORD="changeit"
ALIAS_NAME="config-server"
VALIDITY_DAYS=365
KEY_SIZE=2048
DNAME="CN=example.com, OU=ExampleOrg, O=ExampleCompany, L=City, S=State, C=Country"

echo "Generating a Java KeyStore (JKS) with a self-signed certificate..."

if [ -f "$KEYSTORE_NAME" ]; then
    echo "KeyStore '$KEYSTORE_NAME' already exists. Aborting to avoid overwriting."
    exit 1
fi

keytool -genkeypair \
    -alias "$ALIAS_NAME" \
    -keyalg RSA \
    -keysize "$KEY_SIZE" \
    -validity "$VALIDITY_DAYS" \
    -dname "$DNAME" \
    -keystore "$KEYSTORE_NAME" \
    -storepass "$KEYSTORE_PASSWORD" \
    -keypass "$KEYSTORE_PASSWORD"

if [ -f "$KEYSTORE_NAME" ]; then
    echo "KeyStore '$KEYSTORE_NAME' created successfully with alias '$ALIAS_NAME'."
    echo "Remember to update your application configuration with the keystore path and password."
else
    echo "Failed to create KeyStore. Please check for errors."
fi
