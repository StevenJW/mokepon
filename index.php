<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>Mokepon</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
	<script src="minim.js"></script>
	<script src="js/processing.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.0/socket.io.js"></script>
	<script type="text/javascript">
		function makeid(charAmount) {
			var text = "";
			var possible = "abcdefghijklmnopqrstuvwxyz0123456789";

			for (var i = 0; i < charAmount; i++)
				text += possible.charAt(Math.floor(Math.random() * possible.length));

			return text;
		}
		var players = {};
		var character = {
			positions: [0,0],
			view: null,
			currentScene: 0,
			id: makeid(8),
			new: true,
			online: true
		}
	</script>
</head>
<body>
	<div id="container">
		<canvas id="canvas1" data-processing-sources="js/processingCode.pjs" tabindex="0"></canvas>
	</div>
	<h1>There is currently maintenance going on so things might not work properly</h1>
	<h1>To go back or for the menu, press the '=' sign</h1>
	<script type="text/javascript">
		document.getElementById('canvas1').focus();
		var socket = io("188.166.42.131");
		socket.emit('user', {
			player: character,
		});
		character.new = false;
		socket.on('player', function(data){ //2 arguments may cause an error
			if( !(data.player.id in players) ) {
				players[data.player.id] = data.player;
			} else {
				players[data.player.id].positions = data.player.positions;
				players[data.player.id].view = data.player.view;
				players[data.player.id].currentScene = data.player.currentScene;
				players[data.player.id].online = data.player.online;
			}
		});
		socket.on('playerDisconnect', function(data) {
			players[data.id].online = false;
		});
	</script>
</body>
</html>
