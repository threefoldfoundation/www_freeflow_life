# gets and builds executable if doesn't exist
if [[ ! -f "tailwindcss" ]]
then
    curl -sLO https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-macos-x64
    chmod +x tailwindcss-macos-x64
    mv tailwindcss-macos-x64 tailwindcss
fi

# initialized and configures tailwind if not configured
if [[ ! -f "tailwind.config.js" ]]
then
    ./tailwindcss init
    sed -i '' "s|  content: \\[\\],|  content: \\['./templates/**/*.html'\\],|g" tailwind.config.js
fi

# compiles tailwind css & launches locally
rm -rf public static/css
./tailwindcss -i css/index.css -o ./static/css/index.css --watch & zola serve &

# compiles tailwind css for prod & builds project
./tailwindcss -i css/index.css -o ./static/css/index.css --minify &
zola build


