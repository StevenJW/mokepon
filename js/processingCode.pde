import ddf.minim.*;

Minim minim;
AudioPlayer currentPlayerMusic, insideMusic, outsideMusic, battleMusic1,battleMusic2;

var xSize = 800;
var ySize = 600;
var tokenSize = 100;
float speed = 4.0;
float value = 0.0;
int MAX = 255;
PFont font;
int counter;
String trainerName = "";


PImage mokepon, trainer, damonImage, grass, treeWall, tree, path, battleBackground, mokeponGrass, playerBattleStandGrass, enemyBattleStandGrass, mokeponGym, pokeBattleBall, trainerHouse, outsideGround, sofa, carpet, livingTable, chairFaceRight, tvFaceLeft, window, carpet2, dad, grandpa, grandma, bookShelf, chairFaceLeft, chairFaceDown, plant, sofaFaceRight, bed, kruk, desk, table, tv, roomFloor, wall, trainerWalkingForwardRight, trainerWalkingForwardLeft, trainerBackwards;
PImage backWards = [], forWards = [], rightWards = [], leftWards = [];
PImage scorpineImage, scorpineImagePlayer, scorpineIcon, herbarakImage, herbarakImagePlayer, herbarakIcon, hyponyImage, hyponyImagePlayer, hyponyIcon, donkoomImage, donkoomImagePlayer, donkoomIcon, chillenaImage, chillenaImagePlayer, chillenaIcon;
var FRAME_SPEED = 175;

minim = new Minim(this);
insideMusic = minim.loadFile("music/mokeponSoundtrack.ogg");
currentPlayerMusic = insideMusic;
outsideMusic = minim.loadFile("music/mokeponOutside.ogg");
battleMusic1 = minim.loadFile("music/battleSound.ogg");
battleMusic2 = minim.loadFile("music/battleSound2.ogg");
var isMusicPlaying = false;

void setup() {
  size(xSize, ySize);
  stroke(0);
  font = createFont("Arial", 55);
  textFont(font, 35);
}

//Images
  mokepon = loadImage("https://fontmeme.com/permalink/180307/d1c144a62e1207aea747c96a79e7bd06.png", "png");

  forWards.push(loadImage("https://i.imgur.com/jMe8RJ6.png", "png")); //Standing
  forWards.push(loadImage("https://i.imgur.com/bhCfShh.png", "png")); //Right
  forWards.push(loadImage("https://i.imgur.com/Iy3BUql.png", "png")) //Left

  //An array with [0] = Standing trainer, [1] = Walking Right, [2] = Walking Left
  backWards.push(loadImage("https://i.imgur.com/vO2gwOp.png", "png")); //Standing
  backWards.push(loadImage("https://i.imgur.com/D9dE4kb.png", "png")); //Right
  backWards.push(loadImage("https://i.imgur.com/7qDaQTR.png", "png")); //Left

  leftWards.push(loadImage("https://i.imgur.com/ZuDGoxF.png", "png")); //Standing
  leftWards.push(loadImage("https://i.imgur.com/3fjdZOT.png", "png")); //Right
  leftWards.push(loadImage("https://i.imgur.com/IhfsNei.png", "png")); //Left

  rightWards.push(loadImage("https://i.imgur.com/KQVA9C8.png", "png")); //Standing
  rightWards.push(loadImage("https://i.imgur.com/YYQfkS0.png", "png")); //Right
  rightWards.push(loadImage("https://i.imgur.com/Pxvu7L7.png", "png")); //Left

  grass = loadImage("https://i.imgur.com/n9czhrG.png", "png");
  outsideGround = loadImage("https://i.imgur.com/6w7trnF.png", "png");
  roomFloor = loadImage("https://i.imgur.com/sfvUZjF.png", "png");
  wall = loadImage("https://i.imgur.com/lZfMcxm.png", "png");
  trainerHouse = loadImage("https://i.imgur.com/UP9ByLO.png", "png");
  treeWall = loadImage("https://i.imgur.com/SOguDEb.png", "png");
  tree = loadImage("https://i.imgur.com/oVF7OSH.png", "png");
  sofa = loadImage("https://i.imgur.com/ZgLnF5D.png", "png");
  table = loadImage("https://i.imgur.com/5Kg9nb8.png", "png");
  bed = loadImage("https://i.imgur.com/KOMOMI3.png", "png");
  tv = loadImage("https://i.imgur.com/YN4sXbD.png", "png");
  carpet = loadImage("https://i.imgur.com/OdYYiuo.png", "png");
  carpetHorizontal = loadImage("https://i.imgur.com/ZuryrTC.png", "png");
  livingTable = loadImage("https://i.imgur.com/cdE9lz1.png", "png");
  chairFaceRight = loadImage("https://i.imgur.com/WHhweOm.png", "png");
  chairFaceLeft = loadImage("https://i.imgur.com/jUXbxUF.png", "png");
  chairFaceDown = loadImage("https://i.imgur.com/HQDe604.png", "png");
  plant = loadImage("https://i.imgur.com/Di1PMmG.png", "png");
  sofaFaceRight = loadImage("https://i.imgur.com/HHXYVqj.png", "png");
  tvFaceLeft = loadImage("https://i.imgur.com/2XbpgH7.png", "png");
  bookShelf = loadImage("https://i.imgur.com/mC4dfP9.png", "png");
  window = loadImage("https://i.imgur.com/G3dRohz.png", "png");
  carpet2 = loadImage("https://i.imgur.com/YUQaMCT.png", "png");
  grandpa = loadImage("https://i.imgur.com/asJXRBU.png", "png");
  grandma = loadImage("https://i.imgur.com/RiRzwM4.png", "png");
  dad = loadImage("https://i.imgur.com/AQoIKVb.png", "png");
  path = loadImage("https://i.imgur.com/8fGmcdQ.png", "png");
  mokeponGrass = loadImage("https://i.imgur.com/vg8dR2i.png", "png");
  mokeponGym = loadImage("https://i.imgur.com/f322XEq.png", "png");
  pokeBattleBall = loadImage("https://i.imgur.com/EEnAWjB.png", "png");
  battleBackground = loadImage("https://i.imgur.com/f3DuEIZ.png", "png");
  enemyBattleStandGrass = loadImage("https://i.imgur.com/ha7PPfw.png", "png");
  playerBattleStandGrass = loadImage("https://i.imgur.com/8jBwSjh.png", "png");
  hyponyImage = loadImage("https://i.imgur.com/nJhZ1kC.png", "png");
  hyponyImagePlayer = loadImage("https://i.imgur.com/XNFiXQl.png", "png");
  hyponyIcon = loadImage("https://i.imgur.com/EknBHrq.png", "png");
  donkoomImage = loadImage("https://i.imgur.com/jaObkAY.png", "png");
  donkoomImagePlayer = loadImage("https://i.imgur.com/QewuiiX.png", "png");
  donkoomIcon = loadImage("https://i.imgur.com/QddWhcf.png", "png");
  chillenaImage = loadImage("https://i.imgur.com/dpAWVvC.png", "png");
  chillenaImagePlayer = loadImage("https://i.imgur.com/o9SlkQj.png", "png");
  chillenaIcon = loadImage("https://i.imgur.com/YRUsg0j.png", "png");
  herbarakImage = loadImage("https://i.imgur.com/pKksIzY.png", "png");
  herbarakImagePlayer = loadImage("https://i.imgur.com/v4614Hc.png", "png");
  herbarakIcon = loadImage("https://i.imgur.com/WpdQ5mo.png", "png");
  scorpineImage = loadImage("https://i.imgur.com/gdQCmuJ.png", "png");
  scorpineImagePlayer = loadImage("https://i.imgur.com/i2b6JXK.png", "png");
  scorpineIcon = loadImage("https://i.imgur.com/r3wfSpG.png", "png");
  damonImage = loadImage("https://i.imgur.com/DYRntX3.png", "png");
  kevinImage = loadImage("https://i.imgur.com/NJiHVHH.png", "png");
  //Chillena = mokedex 190, donkoom = 288, hypony = 38

//Hierboven niet aankomen nils
//Hieronder ook niet
//het is al minde r  wanky!!!#!1111

var currentScene = -1;
var positionChangeX = 0;
var positionChangeY = 0;
var currentEnemyMokepon = 0;
var currentPlayerMokepon = 0;
var enemyHealthBar = 200;
var playerHealthBar = 200;
var tempDamage = 200;
var roomOneStart = [0,0];
var bigMapStart = [-4,-5];
var checkGrassPosition = [-4,-5];
var battleAttackChoice = 0; //Fight/Run/Catch
var mainFightChoice = 0;
var randomAttack = null;
var enteredAttackChoice = false;
var missed = false;
var enteredMenuChoice = false;
var playersTurn = true;
var lastScene = 1;
var completed = 1; //Set to zero if done with the map!!!
var dialogNumber = 0;
var activeDialog = false;
var completedSentence = false;
var battleAnimation = true
var	nameState = false;
const blockSize = 43;
var walking = false;
var slowDown = false;
var randomPokemon = false;
var wildAppeared = false;
var currentMokepon = null;
var playerRun = false;
var continueBattle = false;
var starterPokemon = 0;
var catchedMokepon = null;
var numCount = 1;
var switchingPokemon = false;
var trainerActive = false;
var currentTrainer = null;
var switchingTrainer = false;

//Menu vars
var xMenu1 = 115;
var xMenu2 = 124;
var yMenu1 = 135;
var yDistance = 50;
var optionChoice = 0;
var enteredOptionChoice = null;
var controlsX = 94;
var controlsY = 24;
var quitChoice = 0;
var enteredQuitChoice = null;
var myMokeponsY = 43;
var myMokeponsX = 77;

//Player object
var Character = function(image) {
  this.position = [xSize/2,ySize/2];
  this.image = image;
  this.rightOrLeftFoot = 1;
  this.mokepon = [];
}


//Trainer object
//function(name, image, mokepons, width, height, xPosition, yPosition, battleMessage, loseMessage)

//Mokepon object
var Mokepon = function(name, health, attack1,attack2,attack3,attack4,frontImage,backImage,icon,status,description) {
  this.name = name;
  this.health = health;
  this.attacks = [attack1, attack2, attack3, attack4];
  this.status = status;
  this.description = description;
  this.frontImage = frontImage;
  this.backImage = backImage;
  this.icon = icon;
}

//Object for attacks
var Attack = function(name, damage, accuracy) {
	this.name = name;
	this.damage = damage;
	this.accuracy = accuracy;
}

//Attacks
var tailWhip = new Attack("Tail whip", 17, 0.9);
var tickle = new Attack("Tickle", 1, 1.0);
var tailSlap = new Attack("Tail slap", 30, 0.8);
var rockThrow = new Attack("Rock throw", 20, 0.7);
var screech = new Attack("Screech", 10, 1.0);
var focusEnergy = new Attack("Focus energy", 40, 0.1);
var runningKick = new Attack("Running kick", 17, 0.9);
var rapidSlaps = new Attack("Rapid Slaps", 14, 0.75);
var hypnosis = new Attack("Hypnosis", 20, 0.7);
var knowledge = new Attack("Knowledge", 25, 0.8);
var deathStare = new Attack("Death stare", 1, 0.9);
var tailSwipes = new Attack("Tail swipes", 36, 0.8);
var moonwalk = new Attack("Moonwalk", 20, 0.8);
var shuffle = new Attack("Shuffle", 20, 1.0);
var boogie = new Attack("Boogie", 25, 0.9);
var punch = new Attack("Punch", 10, 0.7);
var terrorStare = new Attack("Terror stare", 0, 0.3);
var strike = new Attack("Strike", 20, 0.9);
var energyFocus = new Attack("Energy focus", 0, 1.0);
var mindBeam = new Attack("Mind beam", 500, 0.66);

//Mokepon
var donkoom = new Mokepon("Donkoom", 65, screech, focusEnergy, runningKick, rapidSlaps, donkoomImage, donkoomImagePlayer, donkoomIcon, true, "When out of action, Donkoom rarely moves. It does this to save up it’s energy. During battle Donkoom is a formiddable opponent because of his seemingly unending stamina.");
var chillena = new Mokepon("Chillena", 60, tailWhip, tickle, tailSlap, rockThrow, chillenaImage, chillenaImagePlayer, chillenaIcon, true, "Chillena is a very agile Moképon. It uses his strong tail to rapidy climb up trees. It’s also able to throw objects and block incoming attacks with it’s tail.");
var hypony = new Mokepon("Hypony", 90, hypnosis, knowledge, deathStare, tailSwipes, hyponyImage, hyponyImagePlayer, hyponyIcon, true, "Hypony is a very intelligent and majestic Moképon with nine tails. It’s able to hypnotise the enemy with it’s glowing red eyes. Some say Hypony was created by combining the souls of nine ancient nobles.");
var herbarak = new Mokepon("Herbarak", 90, moonwalk, shuffle, boogie, punch, herbarakImage, herbarakImagePlayer, herbarakIcon, true, "Herbarak is a very good dancer. While dancing, It’s able to hypnotise it’s opponent. Grumpig is also strong and heavy.");
var scorpine = new Mokepon("Scorpine", 150, terrorStare, strike, energyFocus, mindBeam, scorpineImage, scorpineImagePlayer, scorpineIcon, true, "Scorpine is one of the mightiest Moképon in existence. It is able to scare opponents away with it’s stare. When focusing all it’s energy, it’s able to create a devastating mind beam.");

//Object for objects placed on the map.
var Furniture = function(noFurniture, name, objectSize, solid, secondImage, image, objectWidth, objectHeight, xPosition, yPosition) {   //xPosition/yPosition can be deleted if 2D arrays is a thing.
  this.checkFurniture = noFurniture;
  this.objectSize = objectSize;
  this.solid = solid;
  this.name = name;
  this.image = image;
  this.width = objectWidth;
  this.height = objectHeight;
  this.xPosition = xPosition;
  this.yPosition = yPosition;
  this.secondImage = secondImage;
}

var BattleOpponent = function(name, image, mokepons, solid, npc, width, height, xPosition, yPosition, loseMessage, battleMessage) {
  this.npc = npc
  this.name = name;
  this.image = image;
  this.mokepons = mokepons;
  this.battleMessage = battleMessage;
  this.loseMessage = loseMessage;
  this.width = width;
  this.height = height;
  this.solid = solid;
  this.xPosition = xPosition;
  this.yPosition = yPosition;
}

//Objects for characters that don't fight but have something to say.
var NPC = function(name, image, message, solid, npc, width, height, xPosition, yPosition) {
  this.npc = npc
  this.name = name;
  this.image = image;
  this.message = message;
  this.width = width;
  this.height = height;
  this.solid = solid;
  this.xPosition = xPosition;
  this.yPosition = yPosition;
}

var currentMessage = null;

var say = function(message) {
  activeDialog = true;
  var boxEdgeDistance = 20;
  //textbox
  strokeWeight(5);
  fill(255, 255, 255);
  rect(xSize/2 - 140, ySize/2 + 100, 389 - boxEdgeDistance*2, 141 - boxEdgeDistance*2, 10);
  fill(0,0,0);
  textSize(15);
  typewriteText(message);
}

//This game has been created by Nils en Steven ©

//Placement of all furniture/objects

//Creates a grid for the furniture in the bedroom.
var bedRoomArray = new Array(4);
for (var i = 0; i < bedRoomArray.length; i++) {
  bedRoomArray[i] = new Array(6);
  for(var x=0; x < bedRoomArray[i].length; x++) {
    bedRoomArray[i][x] = new Furniture(false, "none", 0, false, null, 0, 0, 0, 0);
  }
}

bedRoomArray[0][2] = new Furniture(true, "sofa", 2, false, null, sofa, blockSize*2, blockSize, 0, 0);
bedRoomArray[0][5] = new Furniture(true, "bed", 1, true, null, bed, blockSize, 59, 0, 0);
bedRoomArray[1][2] = new Furniture(true, "table", 1, true, null, table, blockSize,blockSize, 0, 0);
bedRoomArray[1][3] = new Furniture(true, "table2", 1, true, null, table, blockSize,blockSize, 0, 0);
bedRoomArray[3][0] = new Furniture(true, "table3", 1, true, tv, table, blockSize,blockSize, 0, 0);
bedRoomArray[3][5] = new Furniture(true, "carpet", 1, false, null, carpet, 36, 48, 0, 0);


//Creates a grid for the living room.
var livingRoomArray = new Array(8);
for (var i = 0; i < livingRoomArray.length; i++) {
  livingRoomArray[i] = new Array(12);
  for(var x=0; x < livingRoomArray[i].length; x++) {
    livingRoomArray[i][x] = new Furniture(false, "none", 0, false, null, 0, 0, 0, 0);
    if(i >= 0 && i <= 4 && x >= 3 && x <= 5) {
      livingRoomArray[i][x].solid = true;
    }
  }
}

livingRoomArray[0][0] = new Furniture(true, "plant1", 1, true, null, plant, 32, 56, 0, -15);
livingRoomArray[0][11] = new Furniture(true, "plant2", 1, true, null, plant, 32, 56, 10, -15);
livingRoomArray[3][0] = new Furniture(true, "bedRoomCarpet", 1, false, null, carpet, 36, 48, 0, 0);
livingRoomArray[1][2] = new Furniture(true, "carpet", 1, false, null, carpet, 36, 48, 0, 0);
livingRoomArray[7][0] = new Furniture(true, "carpet", 1, false, null, carpet, 36, 48, 0, 0);
livingRoomArray[1][7] = new Furniture(true, "livingTable", 2, true, null, livingTable, blockSize, blockSize*2, 0, 0);
livingRoomArray[2][7].solid = true;
livingRoomArray[1][6] = new Furniture(true, "livingChair1", 1, false, null, chairFaceRight, 28, 34, 10, 0);
livingRoomArray[2][6] = new Furniture(true, "livingChair2", 1, false, null, chairFaceRight, 28, 34, 10, 0);
livingRoomArray[0][7] = new Furniture(true, "livingChair3", 1, false, null, chairFaceDown, 26, 34, 7, 10);
livingRoomArray[1][8] = new Furniture(true, "livingChair4", 1, false, null, chairFaceLeft, 28, 34, 10, 0);
livingRoomArray[2][8] = new Furniture(true, "livingChair5", 1, false, null, chairFaceLeft, 28, 34, 10, 0);
livingRoomArray[1][10] = new Furniture(true, "sofaRight1", 2, false, null, sofaFaceRight, 32, 95, -8, 5);
livingRoomArray[1][11] = new Furniture(true, "tvFaceLeft1", 2, true, null, tvFaceLeft, 33, 43, 10, 25);
livingRoomArray[2][11].solid = true;
livingRoomArray[5][3] = new Furniture(true, "bookShelf", 2, true, null, bookShelf, 68, 58, 0, -15);
livingRoomArray[5][4].solid = true;
livingRoomArray[5][5] = new Furniture(true, "bookShelf2", 2, true, null, bookShelf, 68, 58, -18, -15);
livingRoomArray[7][10] = new Furniture(true, "carpetDoor", 1, false, null, carpetHorizontal, 52, 32, 0, 20);

//Livingroom NPC's
livingRoomArray[4][7] = new NPC("grandpa", grandpa, "I used to be a Mok\u00E9pon trainer like you... \nThen a Scorpine bit me in the knee...", true, true, 30, 38, 5,0);
livingRoomArray[4][8] = new NPC("dad", dad, "Hi there " + trainerName + "! I just got a message \nfrom your mom and your brother. They say that \nit's a shame they can't make it, \nbut the they wish you a happy birthday \nnonetheless!", true, true, 30, 38, 5,0);
livingRoomArray[4][9] = new NPC("grandma", grandma, "Hello my dear, you look hungry, \nI'll make you something to eat later on.", true, true, 30, 38, 5,0);




var bigMapArray = new Array(23);
for (var i = 0; i < bigMapArray.length; i++) {
  bigMapArray[i] = new Array(36);
  for(var x=0; x < bigMapArray[i].length; x++) {
    bigMapArray[i][x] = new Furniture(false, "none", 0, false, null, 0, 0, 0, 0);
  }
}

//Treeeeeeeeees {
bigMapArray[13][5] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
bigMapArray[13][6] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
bigMapArray[14][5] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
//Long row trees
for(var d=0;d<bigMapArray.length;d++) {
  bigMapArray[d][0] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, -25, -43);
}
//Middle right trees
bigMapArray[13][13] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
for(var d=0;d<14;d++) {
  for(var e=8;e<13;e++) {
    if(d<5) {
      bigMapArray[d][e] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
    } else if( e > 10) {
      bigMapArray[d][e] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
    }
  }
}
//Middle middle trees
bigMapArray[13][21] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
bigMapArray[13][22] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
for(var d=13;d<16;d++) {
  for(var e=14;e<26;e++) {
    if(d < 15 && e < 17) {
      bigMapArray[d][e] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
    }
    if(d>13 && e>16 && e < 22 && !( d == 15 && (e == 20 || e == 21) )) {
      bigMapArray[d][e] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
    }
    if(e>22 && !(d == 15 && (e >= 22 && e <= 24 ) ) ) {
      bigMapArray[d][e] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
    }
  }
}
//left under trees
for(var d=10;d<bigMapArray.length;d++) {
  for(var e=1;e<6;e++) {
    if(e<3) {
      bigMapArray[d][e] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
    }
    else if( e < 5 && d > 11 && d < 17) {
      bigMapArray[d][e] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
    }
  }
}
//middle trees under
for(var d=20;d<23;d++) {
  for(var e=15;e<23;e++) {
    if(e > 17 && e <21) {
      bigMapArray[d][e] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
    } else if( d>20 && !((e == 15 || e == 16) && d == 21) ) {
		  bigMapArray[d][e] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);
	  }

  }
}

//Right tree line
for(var d=0;d<23;d++) {
  for(var e=30;e<31;e++) {
    bigMapArray[d][e] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);

  }
}
for(var d=8;d<9;d++) {
  for(var e=17;e<30;e++) {
    bigMapArray[d][e] = new Furniture(true, "tree", 1, true, null, tree, 64, 96, 0, -43);

  }
}

// } no treeeees

//Mokepon grass
var grassSize = 32;
bigMapArray[9][1] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 0);
bigMapArray[9][2] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 0);
bigMapArray[12][5] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 0);
bigMapArray[12][6] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 0);
//First grass
for(var d=3;d<7;d++) {
  for(var e=9;e<12;e++) {
    bigMapArray[e][d] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 0);
  }
}
//left half of 2nd grass
bigMapArray[14][6] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
for(var d=3;d<7;d++) {
  for(var e=15;e<23;e++) {
    if(e >= 15 && e <= 17 && d>=5 && d<= 6 ) {
      bigMapArray[e][d] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
    } else if(e > 16) {
      bigMapArray[e][d] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
    }
  }
}
//right half of 2nd grass
bigMapArray[20][17] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
for(var d=7;d<17;d++) {
  for(var e=20;e<23;e++) {
    if(d < 15 ) {
      bigMapArray[e][d] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
    } else if(d > 14 && e >= 20 && e <= 21) {
      bigMapArray[e][d] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
    }
  }
}
//First grass middle
bigMapArray[14][22] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
for(var d=11;d<25;d++) {
  for(var e=13;e<16;e++) {
    if(d < 14 && e>13 ) {
      bigMapArray[e][d] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
    } else if( d > 13 && d < 17  && e > 14 ) {
		  bigMapArray[e][d] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
  	} else if(d > 19 && e > 14 ) {
  		bigMapArray[e][d] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
  	} else if( d > 16 && d < 21 && e == 13 ) {
  		bigMapArray[e][d] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
  	}
  }
}
//Grass right under
for(var d=21;d<30;d++) {
  for(var e=20;e<23;e++) {
    if(d > 22 ) {
      bigMapArray[e][d] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
    } else if(e < 21) {
      bigMapArray[e][d] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
    }
  }
}

//Middle top grass
for(var d=13;d<19;d++) {
  for(var e=0;e<5;e++) {
    bigMapArray[e][d] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
  }
}

for(var d=28;d<30;d++) {
  for(var e=0;e<6;e++) {
    bigMapArray[e][d] = new Furniture(true, "mokeponGrass", 1, false, null, mokeponGrass, grassSize, grassSize, 15, 10);
  }
}

//Houses/buildings
bigMapArray[1][2] = new Furniture(true, "trainerHouse", 6, true, null, trainerHouse, blockSize*5, 172, 0, 0);
bigMapArray[3][4].name = "houseDoor";
for(var d=0;d<4;d++) {
  for(var e=0;e<5;e++) {
    bigMapArray[1+d][2+e].solid = true;
  }
}
bigMapArray[4][4].name = "houseDoor";
bigMapArray[4][4].solid = false;

bigMapArray[0][20] = new Furniture(true, "mokeponGym", 6, true, null, mokeponGym, blockSize*7, 212, 0, 0);
bigMapArray[4][23].solid = true;
for(var d=0;d<4;d++) {
  for(var e=20;e<27;e++) {
    bigMapArray[d][e].solid = true;
  }
}

var tempArray = [];
tempArray.push(hypony);
var damon = new BattleOpponent("Damon", damonImage, tempArray, true, true, 28,40, 5,0,"Damon: Jeez, you’re pretty good kid.\n If really want a challenge, you should try and defeat Gabriel,\n the local gymleader.","Damon: Hey! You’re that new trainer, aren’t you!\n I’m not gonna let you win. Prepare to die!");
bigMapArray[16][18] = damon;
var tempArray = [];
tempArray.push(herbarak);
tempArray.push(hypony);
var kevin = new BattleOpponent("Kevin", kevinImage, tempArray, true,true, 26,40,5,0,"Kevin: Did I just lose?\n Well, this is embarrassing.\n If want to become even better,\n you should try and catch the rare scorpine in the area.", "I just saw you defeat Damon but \nI'm not scared of you!\n I've trained a lot with my Moképon\n and your just a beginner,\n so this should be easy!" );
bigMapArray[8][16] = kevin;


//Begin of the reaaaal code

Character.prototype.move = function(direction, trainerPositions, roomArray, accumulate, maxSize) {
  if(walking == false) {
    if(direction == "w" || direction == "s") {
      if( accumulate(positionChangeY*blockSize, blockSize) <= 0 && accumulate(positionChangeY*blockSize, blockSize) >= maxSize[1] ) {
        if( invalidStep(positionChangeX, positionChangeY, accumulate, false, roomArray) == false ) {
          walking = true;
          positionChangeY = accumulate(positionChangeY, 0.5);
          if( (this.rightOrLeftFoot % 2) == 0) {
            this.image = trainerPositions[1];
          } else {
            this.image = trainerPositions[2];
          }
          setTimeout(function(){
            positionChangeY = accumulate(positionChangeY, 0.5);
            player.image = trainerPositions[0];
            walking = false;
          }, FRAME_SPEED);
          this.rightOrLeftFoot++;
        }
      }
    } else {
      if(accumulate(positionChangeX*blockSize,blockSize) <= 0 && accumulate(positionChangeX*blockSize, blockSize) >= maxSize[0] ) {
        if( invalidStep(positionChangeX, positionChangeY, accumulate, true, roomArray) == false ) {
          walking = true;
          positionChangeX = accumulate(positionChangeX, 0.5);
          if( (this.rightOrLeftFoot % 2) == 0) {
            this.image = trainerPositions[1];
          } else {
            this.image = trainerPositions[2];
          }
          setTimeout(function(){
            positionChangeX = accumulate(positionChangeX, 0.5);
            player.image = trainerPositions[0];
            walking = false;
          }, FRAME_SPEED);
          this.rightOrLeftFoot++;
        }
      }
    }
  }
}


var player = new Character(trainer);
void keyPressed(){
  if( !isMusicPlaying ) {
    isMusicPlaying = true;
    currentPlayerMusic.loop();
  }
  var currentRoomGrid = [];
  var maxSize = [0,0];

	if(starterPokemon == 1 || starterPokemon == 2 && completed != 1) {
		if(key == 'a') {
			starterPokemon = 1;
			return;
		} else if(key == 'd') {
			starterPokemon = 2;
			return;
		} else if(key == ENTER) {
			if(starterPokemon == 1) {
				player.mokepon.push(donkoom);
				dialogNumber++;
				return;
			} else {
				player.mokepon.push(chillena);
				dialogNumber++;
				return;
			}
		} else {
			return;
		}
	}

  if(key == '=' && currentScene != 5 && currentScene != 6) {
      lastScene = currentScene;
      currentScene = 6;
      return;
  }
  if(currentScene == 6) {
    if(key == '=') {
      enteredOptionChoice = null;
      optionChoice = 0;
    }
    if(keyCode === 87) {
        if(optionChoice !== 0) {
            optionChoice--;
        }
    } else if (keyCode === 83) {
        if(optionChoice !== 3) {
            optionChoice++;
        }
    }
    else if (optionChoice === 0 && keyCode === ENTER) {
        enteredOptionChoice = null;
        currentScene = lastScene;
    } else if (optionChoice === 1 && keyCode === ENTER) {
        enteredOptionChoice = 1;
    } else if (optionChoice === 2 && keyCode === ENTER) {
        enteredOptionChoice = 2;
    } else if (optionChoice === 3 && keyCode === ENTER) {
        enteredOptionChoice = 3;
    } else if (enteredOptionChoice === 3 && keyCode === 68) {
        if(quitChoice !== 1) {
        quitChoice++;
        }
    } else if (enteredOptionChoice === 3 && keyCode === 65) {
        if(quitChoice !== 0){
        quitChoice--;
        }
    } else if (enteredOptionChoice <= 3 && keyCode === BACKSPACE) {
        enteredOptionChoice = null;
    } else if (enteredOptionChoice === 3 && quitChoice === 0 && keyCode === ENTER){
       enteredOptionChoice = null;
    }
    return;
  }

    if(currentScene != 0 && currentScene != 5 && activeDialog != true) {
      switch(currentScene) {
        case 1:
          currentRoomGrid = bedRoomArray;
          maxSize[1] = -3*blockSize;
          maxSize[0] = -5*blockSize;
          break;
        case 2:
          currentRoomGrid = livingRoomArray;
          maxSize[1] = -7*blockSize;
          maxSize[0] = -11*blockSize;
          break;
        case 3:
          currentRoomGrid = bigMapArray;
          maxSize[1] = -22*blockSize;
          maxSize[0] = -35*blockSize;
          break;
        default:
          break;
    }

    if(key == 'w') {
      player.move("w", backWards, currentRoomGrid, function(a,b) { return a + b}, maxSize);
    } else if(key == 's') {
      player.move("s", forWards, currentRoomGrid, function(a,b) { return a - b}, maxSize);
    } else if(key == 'a') {
      player.move("a", leftWards, currentRoomGrid, function(a,b) { return a + b}, maxSize);
    } else if(key == 'd') {
      player.move("d", rightWards, currentRoomGrid, function(a,b) { return a - b}, maxSize);
    } else if(key == 'r') {
      //Checks if the player is standing next to an NPC and in the right direction.
      //If you can move direction in the spot this doesn't work anymore! (but you can't)
      for(var y=0;y<currentRoomGrid.length;y++) {
        for(var x=0;x<currentRoomGrid[y].length;x++) {
          if(currentRoomGrid[y][x].npc == true) {
            if( (y - -positionChangeY == 1 || -positionChangeY - y == 1) && (x - -positionChangeX == 0 || -positionChangeX - x == 0) ) {
              if(player.image == backWards[0] || player.image == forWards[0]) {
                currentMessage = currentRoomGrid[y][x].message;
              }
            } else if( (y - -positionChangeY == 0 || -positionChangeY - y == 0) && (x - -positionChangeX == 1 || -positionChangeX - x == 1) ) {
              if(player.image == rightWards[0] || player.image == leftWards[0]) {
                currentMessage = currentRoomGrid[y][x].message;
              }
            }
          }
        }
      }
    }
  } else if(activeDialog == true && slowDown == false && completedSentence == true && currentScene > 0 && currentScene != 5) {
    slowDown = true;
    setTimeout(function() {
      counter = 0;
      dialogNumber++;
      slowDown = false;
      currentMessage = null;
      activeDialog = false;
    }, 1000);
  } else if(currentScene == 0) {
	if( key == BACKSPACE || key == DELETE) {
		trainerName = trainerName.substring(0, trainerName.length - 1);
	} else if(key == ENTER || key == RETURN) {
		nameState = true;
	} else if (keyCode == SHIFT) {
		//do nothing otherwise shift is seen as a character.
	} else {
		if( trainerName.length < 11) {
			var chr = String.fromCharCode(key.code);
			trainerName += chr;
		}
	}
  } else if(currentScene == 5 && slowDown != true && battleAnimation != true) {
	//slowDown = true;
	switch(key) {
		case 'a':
			if(enteredMenuChoice == true) {
				if(battleAttackChoice != 0) {
					battleAttackChoice--;
				}
			} else {
				if(mainFightChoice != 0) {
					mainFightChoice--;
				}
			}
			break;
		case 'd':
			if(enteredMenuChoice == true) {
				if(battleAttackChoice != 3) {
					battleAttackChoice++;
				}
			} else {
				if(mainFightChoice != 2) {
					mainFightChoice++;
				}
			}
			break;
		default:
			break;
	}
	if(key == '=') {
		enteredMenuChoice = false;
		mainFightChoice = 1;
	}
	if(key == ENTER) {
		if(enteredMenuChoice != true) {
			if(mainFightChoice == 0) {
				enteredMenuChoice = true;
				battleAttackChoice = 0;
			} else if(mainFightChoice == 1) {
				enteredMenuChoice = true;
				battleAttackChoice = 0;
			} else if(mainFightChoice == 2) {
				playerRun = true;
			}
		} else {
			enteredAttackChoice = true;
		}
	}

	slowDown = false;
  }
}

var startScreen = function() {
  background(0);
  image(mokepon,160,150);
  fill(255);
  textSize(25);

  //For fading text
  value+=speed;
  float fade = MAX - abs(value % (2*MAX) - MAX);
  fill(255, fade);
  text("Press any key to start", 280,460);

  if(keyPressed) {
    currentScene++;
  }
}


//Checks if furniture is in the way.

var invalidStep = function(xPosition, yPosition, accumulate, upOrDown, objectArray) {
  if(upOrDown == true) {
    if( objectArray[-yPosition][-accumulate(xPosition,1)].solid != true) {
          return false;
    }
  } else {
    if(objectArray[-accumulate(yPosition,1)][-xPosition].solid != true) {
          return false;
    }
  }
  return true;
}



var trainerPosX = xSize/2;
var trainerPosY = ySize/2;
var roomPositionX = 0;
var roomPositionY = 0;

//Trainer WALKING
var trainerBedRoom = function() {
  if(currentPlayerMusic != insideMusic) {
    console.log('hey');
    currentPlayerMusic.pause();
    currentPlayerMusic = insideMusic;
    currentPlayerMusic.loop();
  }
  background(0);
  for(var i=0;i<4;i++){
    for(var x=0;x<6;x++) {
      roomPositionX = xSize/2 + blockSize*x + positionChangeX*blockSize;
      roomPositionY = ySize/2 + blockSize*i + 7.5 + positionChangeY*blockSize;
      image(roomFloor, roomPositionX, roomPositionY, blockSize, blockSize);
      if(i == 0) {
        image(wall, roomPositionX, roomPositionY - blockSize*2 + 5, blockSize, blockSize + 40);
      }
    }
  }

  for(var i=0;i<bedRoomArray.length;i++) {
    for(var z=0;z<bedRoomArray[i].length;z++) {
      if(bedRoomArray[i][z].checkFurniture == true ) {       //Add NPCs here later.
        image(bedRoomArray[i][z].image, xSize/2 + blockSize*z + blockSize*positionChangeX + bedRoomArray[i][z].xPosition, ySize/2 - 2.5 + blockSize*i + blockSize*positionChangeY + bedRoomArray[i][z].yPosition, bedRoomArray[i][z].width, bedRoomArray[i][z].height );
        if(bedRoomArray[i][z].secondImage != null) {
          image(bedRoomArray[i][z].secondImage, xSize/2 + blockSize*z + blockSize*positionChangeX + bedRoomArray[i][z].xPosition, ySize/2 - 2.5 + blockSize*i + blockSize*positionChangeY + bedRoomArray[i][z].yPosition);
        }
      }
    }
  }

  if(walking == false) {
    if(bedRoomArray[-positionChangeY][-positionChangeX].name == "carpet") {
      currentScene++;
      positionChangeX = -1;
      positionChangeY = -3;
    }
  }

  //Add player spawning next to bed.
  if(player.image != null) {
    image(player.image,trainerPosX + 7,trainerPosY,30,38);
  } else {
    player.image = forWards[0];
    image(player.image,trainerPosX + 7,trainerPosY,30,38);
  }
}

//Livingroom
var trainerLivingRoom = function() {
  if(currentPlayerMusic != insideMusic) {
    console.log('hey');
    currentPlayerMusic.pause();
    currentPlayerMusic = insideMusic;
    currentPlayerMusic.loop();
  }

  background(0);

  //First 'rectangle' hallway
  for(var i=0;i<8;i++){
    for(var x=0;x<3;x++) {
      roomPositionX = xSize/2 + blockSize*x + positionChangeX*blockSize;
      roomPositionY = ySize/2 + blockSize*i + 7.5 + positionChangeY*blockSize;
      image(roomFloor, roomPositionX, roomPositionY, blockSize, blockSize);
      if(i == 0) {
        image(wall, roomPositionX, roomPositionY - blockSize*2 + 5, blockSize, blockSize + 40);
      }
    }
  }

  //Small part inbetween hallway/livingroom
  for(var i=5;i<8;i++){
    for(var x=3;x<6;x++) {
      roomPositionX = xSize/2 + blockSize*x + positionChangeX*blockSize;
      roomPositionY = ySize/2 + blockSize*i + 7.5 + positionChangeY*blockSize;
      image(roomFloor, roomPositionX, roomPositionY, blockSize, blockSize);
      if(i == 5) {
        image(wall, roomPositionX , roomPositionY - blockSize*2 + 5, blockSize, blockSize + 40);
      }
    }
  }

  //Livingroom
  for(var i=0;i<8;i++){
    for(var x=6;x<12;x++) {
      roomPositionX = xSize/2 + blockSize*x + positionChangeX*blockSize;
      roomPositionY = ySize/2 + blockSize*i + 7.5 + positionChangeY*blockSize;
      image(roomFloor, roomPositionX, roomPositionY, blockSize, blockSize);
      if(i == 0) {
        image(wall, roomPositionX , roomPositionY - blockSize*2 + 5, blockSize, blockSize + 40);
        if(x == 8) {
          image(window, roomPositionX - 10 , roomPositionY - blockSize*2 + 35);
        }
      }
    }
  }
  image(carpet2, xSize/2 + blockSize*7 + positionChangeX*blockSize, ySize/2 + blockSize*4 + 7.5 + positionChangeY*blockSize, 88, 88);

  for(var i=0;i< livingRoomArray.length;i++) {
    for(var z=0;z< livingRoomArray[i].length;z++) {
      if(livingRoomArray[i][z].checkFurniture == true || livingRoomArray[i][z].npc == true) {
        image(livingRoomArray[i][z].image, xSize/2 + blockSize*z + blockSize*positionChangeX + livingRoomArray[i][z].xPosition, ySize/2 - 2.5 + blockSize*i + blockSize*positionChangeY + livingRoomArray[i][z].yPosition, livingRoomArray[i][z].width, livingRoomArray[i][z].height );
        if(livingRoomArray[i][z].secondImage != null) {
          image(livingRoomArray[i][z].secondImage, xSize/2 + blockSize*z + blockSize*positionChangeX + livingRoomArray[i][z].xPosition, ySize/2 - 2.5 + blockSize*i + blockSize*positionChangeY + livingRoomArray[i][z].yPosition);
        }
      }
    }
  }

  if(player.image != null) {
    image(player.image,trainerPosX + 5,trainerPosY ,30,38);
  } else {
    //player.image = forWards[0];
    image(player.image,trainerPosX + 5,trainerPosY,30,38);
  }


  if(walking == false) {
      if(livingRoomArray[-positionChangeY][-positionChangeX].name == "bedRoomCarpet") {
        currentScene--;
        positionChangeX = -4;
        positionChangeY = -3;
      }
  }

  if(walking == false) {
      if(livingRoomArray[-positionChangeY][-positionChangeX].name == "carpetDoor") {
        currentScene++;
        currentPlayerMusic.pause();
        positionChangeX = bigMapStart[0];
        positionChangeY = bigMapStart[1];
      }
  }

  if(currentMessage != null) {
    say(currentMessage);
  }

  if(-positionChangeX <= 5 && -positionChangeX >= 4 && -positionChangeY >= 5 && -positionChangeY <= 7 && completed == 0 ) {
    activeDialog = true;
    var boxEdgeDistance = 20;
    //textbox
    strokeWeight(10);
    fill(255, 255, 255);
    rect(xSize/2 - 140, ySize/2 + 100, 389 - boxEdgeDistance*2, 141 - boxEdgeDistance*2, 10);
    fill(0,0,0);
    textSize(15);

    var fatherText = "Dad: Congratulations with your 16th birthday,\n " + trainerName + "!";
    var grandmaText = "Grandma: Congratulations, honey.";
    var grandpaText = "Grandpa: They grow up so fast, don't they!";
    var father2Text = "Dad: Now that you're 16, you're finally allowed \n to become a real Mok\u00E9pon trainer! Here's the \n brand new Mok\u00E9dex I bought for you. You can \n also choose a starter Mok\u00E9pon to begin your \n adventure.";
    var narratorText = trainerName + " received the Mok\u00E9dex!";

    //console.log(fatherText.charAt(0));
    //text(fatherText, xSize/2 - 130, ySize/2 + 120);
    //text(fatherText, xSize/2 - 130, ySize/2 + 120);
    switch(dialogNumber) {
      case 0:
        typewriteText(fatherText);
        break;
      case 1:
        typewriteText(grandmaText);
        break;
      case 2:
        typewriteText(grandpaText);
        break;
      case 3:
        typewriteText(father2Text);
        break;
      case 4:
        typewriteText(narratorText);
        break;
	  case 5:
		var x1 = xSize/2 + 40;
		var y1 = ySize/2 + 170;
		fill(0);
		if(starterPokemon == 0) {
			starterPokemon = 1;
		}
		switch(starterPokemon) {
			case 2:
				x1 = xSize/2 + 40;
				y1 = ySize/2 + 170;
				break;
			case 1:
				x1 = xSize/2 - 60;
				y1 = ySize/2 + 170;
				break;
			default:
				break;
		}
		triangle(x1, y1 -6, x1-15, y1, x1-15, y1 - 10);
		text("Which Mokepon would you want to begin with?", xSize/2 - 120, ySize/2 + 120);
	    text("Donkoom", xSize/2 - 50, ySize/2 + 170);
		text("Chillena", xSize/2 + 50, ySize/2 + 170);
		break;
      default:
        activeDialog = false;
        completed++;
        break;
    }

  }
}

var bigMap = function() {
  if(currentPlayerMusic != outsideMusic) {
    currentPlayerMusic.pause();
    currentPlayerMusic.pause();
    currentPlayerMusic = outsideMusic;
    currentPlayerMusic.loop();
  }

  var tree = false;
  background(0);

  //Overall background trees  + path;
  for(var i=0;i<23;i++){
    for(var x=0;x<35;x++) {
      roomPositionX = xSize/2 + blockSize*x + positionChangeX*blockSize;
      roomPositionY = ySize/2 + blockSize*i + 7.5 + positionChangeY*blockSize;
      image(outsideGround, roomPositionX, roomPositionY, blockSize, blockSize);

      if(i == 0) {
        var b = x-1
        image(treeWall, roomPositionX + b*85, roomPositionY - blockSize*2 - 10 , blockSize*3, 97);
      }
    }
  }

  for(var y=0;y<bigMapArray.length;y++) {
    for(var x=0;x<bigMapArray[y].length;x++) {
      if(bigMapArray[y][x].name == "tree") {
        if( (y - -positionChangeY == 1 || -positionChangeY - y == 1) && (x - -positionChangeX == 0 || -positionChangeX - x == 0) ) {
          if(player.image == backWards[0] || player.image == forWards[0]) {
            tree = true;
          }
        } else if( (y - -positionChangeY == 0 || -positionChangeY - y == 0) && (x - -positionChangeX == 1 || -positionChangeX - x == 1) ) {
          if(player.image == rightWards[0] || player.image == leftWards[0]) {
            tree = true;
          }
        }
      }
      tree = false;
    }
  }

  //Grid
  for(var i=0;i<bigMapArray.length;i++) {
    for(var z=0;z< bigMapArray[i].length;z++) {
      if(bigMapArray[i][z].checkFurniture == true || bigMapArray[i][z].npc == true ) {       //Add NPCs here later.
        image(bigMapArray[i][z].image, xSize/2 + blockSize*z + blockSize*positionChangeX + bigMapArray[i][z].xPosition, ySize/2 - 2.5 + blockSize*i + blockSize*positionChangeY + bigMapArray[i][z].yPosition, bigMapArray[i][z].width, bigMapArray[i][z].height);
        if(bigMapArray[i][z].secondImage != null) {
          image(bigMapArray[i][z].secondImage, xSize/2 + blockSize*z + blockSize*positionChangeX + bigMapArray[i][z].xPosition, ySize/2 - 2.5 + blockSize*i + blockSize*positionChangeY + bigMapArray[i][z].yPosition);
        }
      }
    }
  }
  //Back to the player's house
  if(walking == false) {
    if(bigMapArray[-positionChangeY][-positionChangeX].name == "houseDoor") {
      currentPlayerMusic.pause();
      currentScene--;
      positionChangeX = -10;
      positionChangeY = -6;
    }
  }
  //Check if player walks into the trainer
	if(walking == false && completed < 2) {
		if(-positionChangeY >= 16 && -positionChangeY <= 19 && -positionChangeX == 18) {
      if(activeDialog != true) {
        setTimeout(function() {
          lastScene = currentScene;
          currentScene = 5;
          currentMokepon = damon.mokepons[currentEnemyMokepon];
          trainerActive = true;
          currentTrainer = damon;
          currentPlayerMusic.pause();
          currentPlayerMusic = battleMusic1;
          currentPlayerMusic.loop();
          activeDialog = false;
          counter = 0;
        },3000);
      }
			activeDialog = true;
			var boxEdgeDistance = 20;
			//textbox
			strokeWeight(10);
			fill(255, 255, 255);
			rect(xSize/2 - 140, ySize/2 + 100, 389 - boxEdgeDistance*2, 141 - boxEdgeDistance*2, 10);
			fill(0,0,0);
			textSize(15);
			typewriteText(damon.battleMessage);
		}
	}
  //Check if player walks in to second trainer
  if(walking == false && completed < 3) {
		if(-positionChangeY == 8 && -positionChangeX >= 13 && -positionChangeX <= 16) {
      if(activeDialog != true) {
        setTimeout(function() {
          lastScene = currentScene;
          currentScene = 5;
          currentMokepon = kevin.mokepons[currentEnemyMokepon];
          trainerActive = true;
          currentTrainer = kevin;
          currentPlayerMusic.pause();
          currentPlayerMusic = battleMusic1;
          currentPlayerMusic.loop();
          activeDialog = false;
          counter = 0;
        },3000);
      }
			activeDialog = true;
			var boxEdgeDistance = 20;
			//textbox
			strokeWeight(10);
			fill(255, 255, 255);
			rect(xSize/2 - 140, ySize/2 + 100, 389 - boxEdgeDistance*2, 141 - boxEdgeDistance*2, 10);
			fill(0,0,0);
			textSize(15);
			typewriteText(kevin.battleMessage);
		}
	}
  //Is the player walking in grass
  if(walking == false && (checkGrassPosition[0] != positionChangeX || checkGrassPosition[1] != positionChangeY)) {
    if(bigMapArray[-positionChangeY][-positionChangeX].name == "mokeponGrass") {
		checkGrassPosition = [positionChangeX, positionChangeY];
		//15% chance of facing a pokemon in the grass.
		var randomNumber = random(1.0);
		if( randomNumber > 0.85) {
			randomPokemon = true;
			lastScene = 3;
			currentScene = 5;
      currentPlayerMusic.pause();
      currentPlayerMusic = battleMusic1;
      currentPlayerMusic.loop();
		}
    }
  }

  image(player.image,trainerPosX + 5,trainerPosY,32,41);

}

var rectY = 0;
var drawBattleAnimation = function() {
  noStroke();
  fill(255);
  rect(0, rectY - 300, 800, 300);
  rect(0, ySize - rectY, 800, 300);
  rectY += 5;
  image(pokeBattleBall, xSize/2-100, ySize/2-100, 200,200);
  if(rectY >= 310) {
    battleAnimation = false;
	rectY = 0;
  }
}

var performAttack = function() {
	//enteredAttackChoice = false;
	if(slowDown == true) {
		return;
	}
	slowDown = true;
	if(random(1.0) < player.mokepon[currentPlayerMokepon].attacks[battleAttackChoice].accuracy) {
		continueBattle = false;
		//textSize(18);
		//text(player.mokepon[currentPlayerMokepon].name + " used " + player.mokepon[currentPlayerMokepon].attacks[battleAttackChoice].name, 50, 288*1.8);
		setTimeout(function() {
			tempDamage = int(enemyHealthBar - (200*player.mokepon[currentPlayerMokepon].attacks[battleAttackChoice].damage/currentMokepon.health));
			continueBattle = false;
		}, 2000);
		setTimeout(function() {
			if(continueBattle == true) {
				enteredAttackChoice = false;
				enteredMenuChoice = false;
				battleAttackChoice = 0;
				mainFightChoice = 0;
				slowDown = false;
				playersTurn = false;
				tempDamage = 200;
			} else {
				setTimeout(function() {
					enteredAttackChoice = false;
					enteredMenuChoice = false;
					battleAttackChoice = 0;
					mainFightChoice = 0;
					slowDown = false;
					playersTurn = false;
					tempDamage = 200;
				}, 4000);
			}
		}, 4000);
	} else {
		missed = true;
		setTimeout(function() {
			enteredAttackChoice = false;
			enteredMenuChoice = false;
			slowDown = false;
			playersTurn = false;
			missed = false;
		}, 2500);
	}
}

//Temporarily adding first pokemon to trainer for test purposes
//player.mokepon.push(chillena);
//player.mokepon.push(hypony);
player.mokepon.push(scorpine);

var catchMokepon = function() {
	if(catchedMokepon == null) {
		fill(0);
		textSize(25);
		text(trainerName + " threw a mokeball! Will you catch it?", 50, 288*1.8);
	}
	fill(0);
	textSize(25);
	if(catchedMokepon == true) {
		text("1..", 50, 288*1.9);
		if(numCount >= 2) {
			text("2..",80,288*1.9);
		}
		if(numCount >= 3) {
			text("3..",110,288*1.9);
		}
		if(numCount >= 4) {
			text("You caught it! Congratulations!",50,288*1.78);
		}

	}
	if(catchedMokepon == false) {
		text("1..", 50, 288*1.9);
		if(numCount >= 2) {
			text("2..",80,288*1.9);
		}
		if(numCount >= 3) {
			text("3..",110,288*1.9);
		}
		if(numCount >= 4) {
			text("You're too wack, you didn't catch it.", 50, 288*1.78);
		}
	}

	if(catchedMokepon == null) {
		var catchChance = enemyHealthBar/200;
		catchChance = 1 - catchChance;
		console.log(catchChance);
		if(random(1.0) <= catchChance) {
			catchedMokepon = true;
			setTimeout(function() {
				numCount = 2;
				player.mokepon.push(currentMokepon);
				console.log(currentMokepon);
				setTimeout(function() {
					numCount = 3;
					setTimeout(function() {
						numCount = 4;
						setTimeout(function() {
							quitBattle();
							numCount = 1;
						}, 4000);
					}, 1000);
				}, 1000);
			}, 2000);
		} else {
			catchedMokepon = false;
			setTimeout(function() {
				numCount = 2;
				setTimeout(function() {
					numCount = 3;
					setTimeout(function() {
						numCount = 4;
						setTimeout(function() {
							enteredAttackChoice = false;
							enteredMenuChoice = false;
							battleAttackChoice = 0;
							mainFightChoice = 0;
							playersTurn = false;
							slowDown = false;
							catchedMokepon = null;
							numCount = 0;
						}, 4000);
					}, 1000);
				}, 1000);
			}, 2000);
		}
	}

}

var quitBattle = function() {
	currentScene = lastScene;
	currentMokepon = null;
	catchedMokepon = null;
	battleAnimation = true;
	playerHealthBar = 200;
	enemyHealthBar = 200;
	tempDamage = 200;
	playersTurn = true;
	enteredAttackChoice = false;
	enteredMenuChoice = false;
	battleAttackChoice = 0;
	mainFightChoice = 0;
	wildAppeared = false;
	playerRun = false;
  slowDown = false;
}

var wildMokeponBattle = function() {

  if(currentPlayerMusic == battleMusic1 && currentPlayerMusic != battleMusic2) {
    setTimeout(function() {
      if(currentScene == 5) {
        currentPlayerMusic.pause();
        currentPlayerMusic = battleMusic2;
        currentPlayerMusic.loop();
      }
    },13000);
  }

  if(battleAnimation == true) {
    drawBattleAnimation();
  	if(random(1.0) >= 0.25) {
  		playersTurn = true;
  	} else {
  		playersTurn = false;
  	}
  } else {
    background(0);
	   var battlePosition = ySize - 288*1.6
    image(battleBackground,0,0, 512*2.25, 288*1.6);

    if(currentScene != 4) { //Not equal to 4 because the gym should have a different player/enemy standing.
      image(enemyBattleStandGrass, 450, 300 - battlePosition);
      image(playerBattleStandGrass, 0, ySize-64-battlePosition);
    }

	if(currentMokepon == null && trainerActive != true) {
		var randomMokepon = random(1.0);
		if(randomMokepon <= 0.485) {
			currentMokepon = herbarak;
		} else if(randomMokepon < 0.97) {
			currentMokepon = hypony;
		} else {
			currentMokepon = scorpine;
		}
	} else {
		fill(255);
		strokeWeight(5);
		rect(0, 288*1.62, 800, battlePosition);
		if(mainFightChoice == 1 && enteredMenuChoice == true) {
      if(trainerActive != true) {
			   catchMokepon();
      } else {
        fill(0);
        textSize(25);
        text("You cannot catch the trainer's mokepon!", 50, 288*1.8);
        if(slowDown != true) {
          slowDown = true;
          setTimeout(function() {
            playersTurn = false;
            mainFightChoice = 0;
            enteredMenuChoice = false;
            slowDown = false;
          }, 2000);
        }
      }
		} else if(playerRun) {
      if(slowDown != true) {
        if(trainerActive != true) {
          setTimeout(function() {
            quitBattle();
            slowDown = false;
          }, 3000);
        } else {
          setTimeout(function() {
            playerRun = false;
            slowDown = false;
            playersTurn = false;
            enteredMenuChoice = false;
            mainFightChoice = 0;
          }, 3000);
        }
      }
      slowDown = true;
      if(trainerActive != true) {
  			fill(0);
  			textSize(25);
  			text("Got away safely!", 50, 288*1.8);
      } else {
        fill(0);
        textSize(25);
        text("You can't run while playing against a trainer!", 50, 288*1.8);
      }
		} else if(wildAppeared == false) {
			fill(0);
			textSize(25);
			if(trainerActive == true) {
				text(currentTrainer.name + " is battling with a " + currentMokepon.name + "!", 50, 288*1.8);
			} else {
				text("A wild " + currentMokepon.name + " appeared!", 50, 288*1.8);
			}
			setTimeout(function() {
				wildAppeared = true;
			}, 3000);
		} else {
			if(playersTurn == true) {
				if(enteredAttackChoice == true) {
					performAttack();
					fill(0);
					textSize(25);
					if(missed != true) {
						text(player.mokepon[currentPlayerMokepon].name + " used " + player.mokepon[currentPlayerMokepon].attacks[battleAttackChoice].name, 50, 288*1.8);
					} else {
						text(player.mokepon[currentPlayerMokepon].name + " missed the attack!", 50, 288*1.8);
					}
				} else {
						fill(0);
						textSize(25);
						text("What will " + player.mokepon[currentPlayerMokepon].name + " do?", 50, 288*1.8);
						textSize(20);
						//triangle(x1,y1,x2,y2,x3,y3); just sample triangle.
						var x1 = 490;
						var y1 = 1.775;
						var tempChoice = mainFightChoice;
						if(enteredMenuChoice == true) {
							tempChoice = battleAttackChoice;
						}

						switch(tempChoice) {
							case 0:
								x1 = 490;
								y1 = 1.775;
								break;
							case 1:
								x1 = 640;
								y1 = 1.775;
								break;
							case 2:
								x1 = 490;
								y1 = 1.975;
								break;
							case 3:
								x1 = 640;
								y1 = 1.975;
								break;
							default:
								break;
						}
						triangle(x1, 288*y1, x1-15, 288*(y1-0.02), x1-15, 288*(y1+0.02));

						if(enteredMenuChoice == false) {
							text("Fight", 500, 288*1.8);
							text("Catch", 650, 288*1.8);
							text("Run", 500, 288*2);
						} else if( mainFightChoice == 0) {
							text(player.mokepon[currentPlayerMokepon].attacks[0].name, 500, 288*1.8);
							text(player.mokepon[currentPlayerMokepon].attacks[1].name, 650, 288*1.8);
							text(player.mokepon[currentPlayerMokepon].attacks[2].name, 500, 288*2);
							text(player.mokepon[currentPlayerMokepon].attacks[3].name, 650, 288*2);
							text("Damage: " + player.mokepon[currentPlayerMokepon].attacks[tempChoice].damage + ", Accuracy: " + player.mokepon[currentPlayerMokepon].attacks[tempChoice].accuracy*100 + "%", 50, 288*2);
						} else if( mainFightChoice == 1) {
							//Text throws pokeball
							//Show pokeball immage
							//Count 1.2..3...Gotem! and add to players mokepon if catched
						}
				}
			} else {
				if(randomAttack == null) {
					randomAttack = int(random(0,4));
					if( random(1.0) < currentMokepon.attacks[randomAttack].accuracy) {
						continueBattle = false;
						setTimeout(function() {
							tempDamage = int(playerHealthBar - (200*currentMokepon.attacks[randomAttack].damage/player.mokepon[currentPlayerMokepon].health));
						}, 2000);
						setTimeout(function() {
							if(continueBattle == true) {
								tempDamage = 200;
								playersTurn = true;
								randomAttack = null;
							} else {
								setTimeout(function() {
									tempDamage = 200;
									playersTurn = true;
									randomAttack = null;
								},2500);
							}
						}, 4000);
					} else {
						missed = true;
						setTimeout(function() {
							missed = false;
							playersTurn = true;
							randomAttack = null;
							return;
						}, 3000);
					}
				}
				fill(0);
				textSize(25);
				if(missed != true) {
					if(trainerActive == true) {
						text(currentTrainer.name + "'s " + currentMokepon.name + " used " + currentMokepon.attacks[randomAttack].name, 50, 288*1.8);
					} else {
						text("The wild " + currentMokepon.name + " used " + currentMokepon.attacks[randomAttack].name, 50, 288*1.8);
					}
				} else {
					if(trainerActive == true) {
						text(currentTrainer.name + "'s " + currentMokepon.name + " missed!", 50, 288*1.8);
					} else {
						text("The wild " + currentMokepon.name + " missed the attack!", 50, 288*1.8);
					}
				}
			}
		}
		if(playerHealthBar != 0) {
			image(player.mokepon[currentPlayerMokepon].backImage, 150, ySize-160-battlePosition);
			//image(chillenaImagePlayer, 150, ySize-160-battlePosition);
			//Mokepon player health/name bar
			stroke(0);
			strokeWeight(2);
			fill(255);
			rect(450, ySize-250, 300, 75, 10);
			fill(0);
			textSize(17);
			//Change 'chillena' to player.mokepon.name (something like that)
			text(player.mokepon[currentPlayerMokepon].name, 490, ySize-220);
			//health bar player
			fill(0);
			rect(520, ySize-200, 210, 10, 10);
			fill(107,237,92);
			rect(525, ySize-198, playerHealthBar, 6, 10);
		}

		//Mokepon enemy health/name bar
		if(enemyHealthBar != 0) {
			//image(currentEnemy.mokepon[currentEnemyMokepon].image, 500, 240- battlePosition);
			image(currentMokepon.frontImage, 500, 240-battlePosition);
			//image(chillenaImage, 500, 240- battlePosition);
			fill(255);
			rect(50, 150, 300, 75, 10);
			fill(0);
			textSize(17);
			//Change 'chillena' to player.mokepon.name (something like that)
			text(currentMokepon.name, 90 , 180);
			//health bar enemy player
			fill(0);
			rect(120, 200, 210, 10, 10);
			fill(107,237,92);
			rect(125, 202, enemyHealthBar, 6, 10);
		}

		if(playersTurn) {
			if(enemyHealthBar > tempDamage && enemyHealthBar >= 0) {
				enemyHealthBar--;
			} else {
				continueBattle = true;
			}
		} else {
			if(playerHealthBar > tempDamage && playerHealthBar >= 0) {
				playerHealthBar--;
			} else {
				continueBattle = true;
			}
		}

		var checkMokepon = currentPlayerMokepon;
    var checkEnemyMokepon = currentEnemyMokepon;
		if(playerHealthBar <= 0 || enemyHealthBar <= 0) {
			//Add text here before you go back to the map.
			continueBattle = false;
			fill(0);
			textSize(25);
			currentPlayerMokepon++;
      currentEnemyMokepon++;
			if(player.mokepon[currentPlayerMokepon] != null) {
				if(playerHealthBar <= 0) {
					playerHealthBar = 200;
					enteredAttackChoice = false;
					enteredMenuChoice = false;
					battleAttackChoice = 0;
					mainFightChoice = 0;
					playersTurn = false;
					slowDown = false;
					catchedMokepon = null;
					tempDamage = 200;
					switchingPokemon = true;
					setTimeout(function() {
						switchingPokemon = false;
					}, 3000);
          currentEnemyMokepon--;
				}
			} else if(playerHealthBar <= 0) {
        if(slowDown != true) {
          setTimeout(function() {
            currentPlayerMokepon = 0;
            quitBattle();
            currentScene = 1;
            positionChangeX = 0;
            positionChangeY = 0;
            slowDown = false;
          }, 3000);
        }
        slowDown = true;
        if(trainerActive) {
          fill(255);
          strokeWeight(5);
          rect(0, 288*1.62, 800, battlePosition);
          fill(0);
          textSize(25);
          text(currentTrainer.name + " defeated you in battle! Let's head back home..", 50, 288*1.8);
        } else {
          fill(255);
    			strokeWeight(5);
    			rect(0, 288*1.62, 800, battlePosition);
    			fill(0);
    			textSize(25);
          text("You lost the battle! Let's head back home.", 50, 288*1.8);
        }
			} else if(enemyHealthBar <= 0) {
        if(currentTrainer.mokepons[currentEnemyMokepon] == null) {
          if(slowDown != true) {
            setTimeout(function() {
              quitBattle();
              slowDown = false;
              if(trainerActive) {
                completed++;
                currentTrainer = null;
                currentMokepon = null;
                trainerActive = false;
                currentEnemyMokepon = 0;
              }
            }, 3000);
          }
          slowDown = true;
          fill(255);
          strokeWeight(5);
          rect(0, 288*1.62, 800, battlePosition);
          fill(0);
          textSize(25);
          text("You won the battle! Congratulations!", 50, 288*1.8);
          continueBattle = false;
        } else {
          currentMokepon = currentTrainer.mokepons[currentEnemyMokepon];
          currentEnemyMokepon++;
          enemyHealthBar = 200;
          enteredAttackChoice = false;
          enteredMenuChoice = false;
          battleAttackChoice = 0;
          mainFightChoice = 0;
          playersTurn = true;
          slowDown = false;
          catchedMokepon = null;
          tempDamage = 200;
          switchingPokemon = true;
          switchingTrainer = true;
          setTimeout(function() {
            switchingPokemon = false;
            switchingTrainer = false;
        }, 3000);
        }
      }
      currentPlayerMokepon--;
      currentEnemyMokepon--;
		}
		if(switchingPokemon == true) {
      if(switchingTrainer != true) {
  			fill(255);
  			strokeWeight(5);
  			rect(0, 288*1.62, 800, battlePosition);
  			fill(0);
  			textSize(25);
  			text(player.mokepon[checkMokepon].name + " fainted, " + trainerName + " switched to " + player.mokepon[currentPlayerMokepon].name + "!", 50, 288*1.8);
      } else {
        fill(255);
        strokeWeight(5);
        rect(0, 288*1.62, 800, battlePosition);
        fill(0);
        textSize(25);
        text(currentTrainer.mokepons[checkEnemyMokepon].name + " fainted, " + currentTrainer.name + " switched to " + currentTrainer.mokepons[currentEnemyMokepon].name + "!", 50, 288*1.8);
      }
		}
	}
  }
}

var drawMenu = function() {
  background(0);
  fill(255);
  stroke(0, 0, 0);
    strokeWeight(5);
    fill(255, 255, 255);
    rect(50, 50, 300, 300, 10);

    //menu opties
    fill(0, 0, 0);
    textSize(29);
    text("Resume", xMenu2, yMenu1);
    text("My Moképons", xMenu2, yMenu1 + yDistance);
    text("Controls", xMenu2, yMenu1 + yDistance*2);
    text("Quit", xMenu2, yMenu1 + yDistance*3);

    if(enteredOptionChoice === null) {
        switch(optionChoice) {
            case 0:
                triangle(xMenu1, 126, xMenu1 - 25, 116, xMenu1 - 25, 136);
                break;
            case 1:
                triangle(xMenu1, 126 + yDistance, xMenu1 - 25, 116 + yDistance, xMenu1 - 25, 136 + yDistance);
                break;
            case 2:
                 triangle(xMenu1, 126 + yDistance*2, xMenu1 - 25, 116 + yDistance*2, xMenu1 - 25, 136 + yDistance*2);
                break;
            case 3:
                 triangle(xMenu1, 126 + yDistance*3, xMenu1 - 25, 116 + yDistance*3, xMenu1 - 25, 136 + yDistance*3);
                break;
            default:
                break;
        }
    }

    else if (enteredOptionChoice === 0) {
        fill(255, 255, 255);
        rect(50, 50, 300, 300, 10);
        fill(255, 0, 0);
        text("Back to game", 85, 141);
    } else if (enteredOptionChoice === 1) {
        fill(255, 255, 255);
        rect(50, 50, 300, 300, 10);
        fill(0, 0, 0);

        if(player.mokepon[0] != null) {
          text(player.mokepon[0].name, myMokeponsX, 125 + myMokeponsY*0);
          image(player.mokepon[0].icon, myMokeponsX + 120, 80 + myMokeponsY*0);
        }
        if(player.mokepon[1] != null) {
          text(player.mokepon[1].name, myMokeponsX, 125 + myMokeponsY*1);
          image(player.mokepon[1].icon, myMokeponsX + 120, 80 + myMokeponsY*1);
        }
        if(player.mokepon[2] != null) {
          text(player.mokepon[2].name, myMokeponsX, 125 + myMokeponsY*2);
          image(player.mokepon[2].icon, myMokeponsX + 120, 80 + myMokeponsY*2);
        }
        if(player.mokepon[3] != null) {
          text(player.mokepon[3].name, myMokeponsX, 125 + myMokeponsY*3);
          image(player.mokepon[3].icon, myMokeponsX + 120, 80 + myMokeponsY*3);
        }

    } else if(enteredOptionChoice === 2) {
        fill(255, 255, 255);
        rect(50, 50, 300, 300, 10);
        fill(0, 0, 0);
        textSize(20);
        text("Walking and navigating menus:", controlsX - 30, 100);
        text("W = Up", controlsX, 100 + controlsY*1);
        text("A = Left", controlsX, 100 + controlsY*2);
        text("S = Down", controlsX, 100 + controlsY*3);
        text("D = Right", controlsX, 100 + controlsY*4);
        text("Other controls:", controlsX - 30, 100 + controlsY*5);
        text("Enter/Backspace = ", controlsX, 100 + controlsY*6);
        text("continue/back", controlsX, 100 + controlsY*7);
        text("R = Start dialog", controlsX, 100 + controlsY*8);
        text("Any key = forward dialog", controlsX, 100 + controlsY*9);
    }
    else if (enteredOptionChoice === 3) {
        fill(255, 255, 255);
        rect(50, 50, 300, 300, 10);
        fill(0, 0, 0);
        text("Are you sure?",108, 147);
        textSize(29);
        text("No", 124, 200);
        text("Yes", 240, 200);
    }

     if (enteredOptionChoice === 3 && enteredQuitChoice === null) {
        switch(quitChoice) {
            case 0:
                triangle(xMenu1, 190, xMenu1 - 25, 200, xMenu1 - 25, 180);
                break;
            case 1:
                triangle(231, 190, 206, 200, 206, 180);
                break;
            default:
                break;
        }
    }
}

var typewriteText = function(text1){
  if (counter < text1.length()) {
    counter++;
    completedSentence = false;
  } else {
    completedSentence = true;
  }

  text(text1.substring(0, counter), xSize/2 - 130, ySize/2 + 120);
}

var userSetup = function() {
	background(0);
	if(nameState == false) {
		fill(255);
		textSize(25);
		text("Please enter your name:", xSize/2 - 200, ySize/2 - 100);
		textSize(20);
		text(trainerName, xSize/2 - 200, ySize/2);
	} else {
		currentScene ++;
	}
}

/*var i = 0;
var typeWriter = function(txt) {
  fill(0,0,0);
  if (i < txt.length) {
    text(txt.charAt(i), xSize/2 - 130 + i*9, ySize/2 + 120);
    i++;
    setTimeout(function() {
      typeWriter(txt);
    }, 50);
  }
}*/

draw = function() {
  switch(currentScene) {
	case -1:
		startScreen();
		break;
    case 0:
		userSetup();
		break;
    case 1:
      trainerBedRoom();
      break;
    case 2:
		//currentScene = 5;
		//wildMokeponBattle();
		trainerLivingRoom();
      break;
    case 3:
      bigMap();
      break;
    case 4:
      //Gymroom
      break;
    case 5:
      wildMokeponBattle();
      break;
    case 6:
      drawMenu();
      break;
    default:
      break;
  }
  fill(255);
  //text(mouseX,mouseX+10,mouseY);
  //text(mouseY,mouseX+10,mouseY+10);
}