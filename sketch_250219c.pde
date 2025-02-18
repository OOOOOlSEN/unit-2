// Variable declaration
int bunny;
int bg1, bg2, bg3;
int compassAngle;
int vx;
int m1;
int m2;
int v1;
void setup() {
  size(800, 600, P2D); // Example canvas size
  translate(400, 300);
  bg1=0;
  bg2=400;
  bg3=800;
  compassAngle=0;
  vx=5;
  m1=10;
  m2=0;
}

void draw() {
  background(3, 173, 255);//sky
  //backgroud hills
  fill(3, 255, 93);
  ellipse(bg1, 400, 400, 400);
  ellipse(bg2, 400, 400, 400);
  ellipse(bg3, 400, 400, 400);
  //ground
  fill(255, 249, 72);
  rect(0, 400, 800, 200);
  //move hills
  bg1=bg1+2;
  bg2=bg2+2;
  bg3=bg3+2;
  //loop the hills
  if (bg1>1000) {
    bg1=-200;
  }
  if (bg2>1000) {
    bg2=-200;
  }
  if (bg3>1000) {
    bg3=-200;
  }

  //rotate(radians(45));

  compass();
  compassAngle=compassAngle+5;
}

void compass() {
  pushMatrix();//beginning of transformation
  // Draw the bunny
  fill(255);

  ellipse(bunny, 400, 200, 200);       // Head
  ellipse(bunny - 50, 300, 50, 100);    // Left ear
  ellipse(bunny + 50, 300, 50, 100);    // Right ear
  fill(0);
  ellipse(bunny - 50, 380, 30, 30);//left eye
  ellipse(bunny + 50, 380, 30, 30);//right eye
  fill(255);
  ellipse(bunny - 50, 380, 10, 10);//left high light
  ellipse(bunny + 50, 380, 10, 10);//right high light
  // Move the bunny
  bunny = bunny + vx;

  // Reset bunny position (not fully provided in the transcript)
  if (bunny > 700) {
    //bunny = -100; // Assume restart from the left
    vx=-5;
  }
  if (bunny < 100) {
    vx=5;
  }
  //meteor
  fill(#FFF417);
  ellipse(m1, m2, 5, 5);
  m1=m1+v1;
  popMatrix();//endding of transformation
}
