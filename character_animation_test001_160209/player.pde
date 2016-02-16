void movePlayer() {
  VX+=aX;
  playerX+=VX;

  // limitation of speed 
  if (4<VX) {
    VX=4;
  }
  if (VX<-4) {
    VX=-4;
  }

  // define acceleration
  if (!keyPressed) {
    if (1<abs(VX)) {
      VX*=0.9;
    } else {
      VX=0;
    }
  }

  if (keyPressed && keyCode==LEFT ) {
    if (0<VX && aX==0) {
      aX=1; //slowly stop
    } else {
      aX=-2; // accelate speed
    }
  }
  if (keyPressed && keyCode==RIGHT ) {
    if (VX<0 && aX==0) {
      aX=-1; // slow stop
    } else {
      aX=2; // accelate speed
    }
  }

  // constrain the field of player
  if (playerX<25) {
    playerX=25;
    VX=0;
  } else if (playerX>width-25) {
    playerX=width-25;
    VX=0;
  }

  VY+=gravity*1.3;
  playerY+=VY;

  // constrain y-axis field of player
  if (playerY>floorHeight-25) {
    playerY=floorHeight-25;
    VY=0;
  }

  if (keyPressed && keyCode==UP && playerY==floorHeight-25 && VY==0) {
    VY=-17;
  }


  // dipict player
  if (VX>0 && VY==0 ) {
    playerPhase=1;
  } else if (VX<0 && VY==0) {
    playerPhase=2;
  }

  if (VX==0 && aX==0 && VY<0 ) {
    playerPhase=3;
  } else if (VX==0 && aX==0 && VY>0) {
    playerPhase=4;
  }

  if (VX>0 && VY<0 ) {
    playerPhase=5;
  } else if (VX<0 && VY>0) {
    playerPhase=6;
  }

  if (VX>0 && VY>0 ) {
    playerPhase=7;
  } else if (VX<0 && VY<0) {
    playerPhase=8;
  }

  if (!keyPressed && VX==0 && aX==0 && VY==0) {
    playerPhase=0;
  }
}

void keyReleased() {
  aX = 0;
}