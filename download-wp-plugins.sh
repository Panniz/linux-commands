#!/bin/bash

SLUGS_FILE="plugin_list.txt"

# Percorso dove salvare i plugin scaricati
DOWNLOAD_PATH="./plugins"

mkdir -p "$DOWNLOAD_PATH"

download_plugin() {
    local slug=$1
    local url="https://downloads.wordpress.org/plugin/${slug}.latest-stable.zip"
    local plugin_zip_path="${DOWNLOAD_PATH}/${slug}.zip"
    
    echo "Downloading ${slug}..."
    if curl -L -o "$plugin_zip_path" "$url"; then
        echo "Downloaded ${slug} successfully."
    else
        echo "Failed to download ${slug}."
    fi
}

while IFS= read -r slug; do
    # Salta le righe vuote
    if [[ -n "$slug" ]]; then
        download_plugin "$slug"
    fi
done < "$SLUGS_FILE"
