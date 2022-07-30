// Taken from: https://github.com/brycewray/zola_twcss/blob/main/initcss.js
// Initializes ./static/css/index.css necessary for package scripts

const fs = require("fs")
const initDir = 'static/css'
const initCSSFile = 'static/css/index.css'
const initValue = ``

if(!fs.existsSync(initDir)) {
  fs.mkdirSync(initDir)
}
if(!fs.existsSync(initCSSFile)) {
  fs.writeFileSync(initCSSFile, initValue)
}