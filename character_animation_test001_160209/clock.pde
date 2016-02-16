void clock(){
  image(clock, cX, cY);
  // hand of the clock
  pushMatrix();
  translate(cX, cY);
  rotate(radians(cS));
  stroke(0);
  strokeWeight(2);
  line(0, 0, 0, -80);
  noStroke();
  popMatrix();

  pushMatrix();
  translate(cX, cY);
  rotate(radians(cS/12));
  stroke(0);
  strokeWeight(4);
  line(0, 0, 0, -60);
  noStroke();
  popMatrix();

  cS+=6/frameRate;
}