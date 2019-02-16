'use strict';

require('./index.html');
var Elm = require('./elm/Main.elm').Elm;

var app = Elm.Main.init({
  node: document.getElementById('elm')
});
var socket = io();
app.ports.sendMessage.subscribe(function(message) {
  socket.emit('chat message', message);
});
socket.on('chat message', function(message) {
  app.ports.receiveMessage.send(message);
});
