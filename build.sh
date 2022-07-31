trap "killall background" EXIT

# gets and builds executable for os and cpu if doesn't exist
echo "Installing & building tailwind"
ls
rm tailwindcss
ls
if [[ ! -f "tailwindcss" ]]
then
    echo "Checking environment"
    #https://stackoverflow.com/a/8597411 
    ASSET="tailwindcss"
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        ASSET = "$ASSET-linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        ASSET="$ASSET-macos"
    fi
    echo $(uname -m)
    if [[ "$(uname -m)" == "x86_64"* ]]; then
        ASSET="$ASSET-x64"
    elif [[ "$(uname -m)" == "arm64"* ]]; then
        ASSET="$ASSET-arm64"
    fi

    echo "Installing & building tailwind from ${ASSET}"
    curl -sLO "https://github.com/tailwindlabs/tailwindcss/releases/latest/download/${ASSET}"
    chmod +x $ASSET
    mv $ASSET tailwindcss
fi

# initialized and configures tailwind if not configured
if [[ ! -f "tailwind.config.js" ]]
then
    ./tailwindcss init
    sed -i '' "s|  content: \\[\\],|  content: \\['./templates/**/*.html'\\],|g" tailwind.config.js
fi

# compiles tailwind css for prod & builds project
rm -rf public static/css
./tailwindcss -i css/index.css -o ./static/css/index.css --minify
zola build


