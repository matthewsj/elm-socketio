# elm-socketio
This repository is an example of how to write a websockets-based web application
using an [Elm 0.19](https://elm-lang.org/)-based client, a
[Node.js](https://nodejs.org/en/) / [Express](https://expressjs.com/)-based
server, and the [socket.io](https://socket.io/) websockets library.
It is a fully-working implementation of the
chat system from socket.io's [Getting Started guide](https://socket.io/get-started/chat/),
but instead of rendering with jQuery, it uses Elm plus a small JavaScript
wrapper that passes websocket events to and from Elm using ports. It also
includes an example build system based on [npm](https://www.npmjs.com/) and
[webpack](https://webpack.js.org/) using
[elm-webpack-loader](https://github.com/elm-community/elm-webpack-loader) and
[babel](https://babeljs.io/).

## Quickstart

You need to have already installed Node.js on your system. From a terminal, run:

```
$ git clone https://github.com/matthewsj/elm-socketio
$ cd elm-socketio
$ npm install
$ npm run dev
```

This should start an express server that handles websockets and open a browser
window on localhost port 4000 with a chat box. Open the same URL multiple times
and you'll see that sending a chat from any client broadcasts to all of them.

For a production build, run:

```
$ npm run build
$ npm run start
```

This will start a server on localhost:3000 that serves the client assets at `/`
and handles websocket connections for them.

## Credits

* The client and server code are based off of the socket.io [Getting Started guide](https://socket.io/get-started/chat/).
* Build system is based on [crsandeep/simple-react-full-stack](https://github.com/crsandeep/simple-react-full-stack).
