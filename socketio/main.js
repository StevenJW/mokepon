//SOCKETIO/EXPRESS
const socket = require('socket.io');
var express = require('express'),app = express();

const http = require('http');
const server = http.Server(app);
const io = socket(server);

server.listen(5000, function(){
 console.log('listening on *:5000');
});

var players = {};
io.on('connection', socket => {
	console.log("a user connected");
  var playerid = 0;
  //Getting the emit.
	socket.on('user', data => {
    if(data.player.new == true) {
      playerid = data.player.id
      players[playerid] = data.player;
    }
    if(data.player.currentScene > 0) {
      socket.broadcast.emit('player', {
        player: data.player
      });
    }
	});

  socket.on('disconnect', function() {
    players[playerid] = null;
    socket.broadcast.emit('playerDisconnect', {
      id: playerid
    });
    //Add emit when so player can be deleted.
  });


});
