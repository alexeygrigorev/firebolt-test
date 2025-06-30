#!/bin/bash

# Base URL
BASE_URL="https://d37ci6vzurychx.cloudfront.net/trip-data"

# Year
YEAR="2024"

# Loop through months 01 to 12
for MONTH in {01..12}; do
    FILE_NAME="fhvhv_tripdata_${YEAR}-${MONTH}.parquet"
    URL="${BASE_URL}/${FILE_NAME}"
    
    echo "Downloading ${FILE_NAME}..."
    wget "$URL" -O "$FILE_NAME"

    # Optional: check if download was successful
    if [ $? -eq 0 ]; then
        echo "Downloaded ${FILE_NAME} successfully."
    else
        echo "Failed to download ${FILE_NAME}."
    fi
done
