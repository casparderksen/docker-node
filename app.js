const express = require('express')
const app = express()
const port = process.env.PORT0 || 3000;


app.get('/', ( req, res ) => {
    res.sendFile(`${__dirname}/index.html`)
})

app.listen(port, () => {
    console.log(`Listening on port ${port}!`)
})
