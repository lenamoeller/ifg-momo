class GreyMan {  

  float gX;
  float gY=floorHeight-20;
  float gVY=0;
  float gravity;
  int gDiameter;
  color gC;
  float targetX;
  float targetY;
  float searchSpeed;
  int countNumber=0;
  int jumpTime=int(random(200));

  //constructor
  GreyMan(float gX, int gDiameter, color gC  ) {
    this.gX=gX;
    this.gDiameter=gDiameter;
    this.gC=gC;
  }

  // move enemy
  void move(  float targetX, float searchSpeed) {
    gX=lerp(gX, targetX, searchSpeed );
    
    // enemy randomly jump
    countNumber++;
    if (jumpTime<countNumber && countNumber<jumpTime+240) {
      gVY=-5;
      gravity+=0.08;
      gVY+=gravity;
      gY+=gVY;
    }
    if(countNumber>jumpTime+240){
      countNumber=0;
      gVY=0;
      gravity=0;
    }
    if(gY>floorHeight-20){
      gY=floorHeight-20;
    }
  }

  // draw enemy
  void drawEnemy() {
    fill(gC);
    ellipse(gX, gY, gDiameter, gDiameter);
  }

  // judge the colision
  boolean pColision() {
    return dist(playerX, playerY, gX, gY)<gDiameter/2+25;
  }

  // event of the colision for enemy
  void eColision() {
    if (dist(playerX, playerY, gX, gY)<gDiameter/2+25) {
      gC=color(255, 0, 0);
    } else {
      gC=color (100);
    }
  }
}