#!/bin/bash

if [ $# -ne 2 ]
  then
    echo "This script requires exactly 2 arguments: brand_name followed by app_name"
    echo "For example: ./customize-app.sh Geometrixx ShapesCon"
    exit 1
fi

find . -name epsilon -type d -depth -execdir mv {} $1 \;
find . -name epsilon-mobile-app -type d -depth -execdir mv {} $2 \;
find . -name epsilon-mobile-app-dev -type d -depth -execdir mv {} $2-dev \;

find . -type f \( -name '*.xml' -o -name '*.jsp' -o -name index.html -o -name config.json \) -depth -exec sed -i '' s/epsilon/$1/g {} \;
find . -type f \( -name '*.xml' -o -name '*.jsp' -o -name index.html -o -name config.json \) -depth -exec sed -i '' s/epsilon-mobile-app/$2/g {} \;

echo "Finished customizing app with $1 brand name and $2 app name."