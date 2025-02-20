// Variable declarations with proper initializations
int bunny = 100;  // starting x position for the bunny
int bg1, bg2, bg3;
int vx = 5;       // bunny horizontal speed

// Meteor variables
int m1, m2;
int v1 = 10, v2 = 5;  // meteor speed components

// For animating bunny ears
//a floating-point variable used to calculate a varying rotation for the bunny’s ears to simulate flapping.
float earAngle = 0; 

void setup() {
  size(800, 600, P2D);

  // Initialize background hills positions
  bg1 = 0;
  bg2 = 400;
  bg3 = 800;

  // Initialize meteor starting position
  m1 = -100;
  m2 = 100;
}

void draw() {
  background(3, 173, 255); // Sky
   // Draw a rainbow using arcs (from outer to inner)
  noStroke();
  fill(255, 0, 0);            // red
  ellipse(320, 300, 320, 300);
  fill(255, 127, 0);          // orange
  ellipse(320, 300, 300, 280);
  fill(255, 255, 0);          // yellow
  ellipse(320, 300, 280, 260);
  fill(0, 255, 0);            // green
  ellipse(320, 300, 260, 240);
  fill(0, 0, 255);            // blue
  ellipse(320, 300, 240, 220);
  fill(75, 0, 130);           // indigo
  ellipse(320, 300, 220, 200);
  fill(148, 0, 211);          // violet
  ellipse(320, 300, 200, 180);
  fill(3, 173, 255);        // inner light blue
  ellipse(320, 300, 180, 160);
  
  // Draw the green ground
  fill(0, 128, 0);  // green
  rect(0, 300, width, 100);
  

  // Draw a moving sun across the sky
  noStroke();
  fill(255, 204, 0);
  ellipse(frameCount % width, 100, 80, 80);// ensures the sun's x-coordinate wraps around when it reaches the end

  // Draw background hills
  fill(3, 255, 93);
  ellipse(bg1, 400, 400, 400);
  ellipse(bg2, 400, 400, 400);
  ellipse(bg3, 400, 400, 400);

  // Draw ground
  fill(255, 249, 72);
  rect(0, 400, 800, 200);

  // Move hills for a looping parallax effect
  bg1 += 2;
  bg2 += 2;
  bg3 += 2;
  if (bg1 > 1000) bg1 = -200;
  if (bg2 > 1000) bg2 = -200;
  if (bg3 > 1000) bg3 = -200;

  // Draw the animated bunny
  drawBunny();

  // Update and draw the meteor
  updateMeteor();
}

void drawBunny() {
  pushMatrix();

  // Calculate ear flap angle oscillating between -15 and 15 degrees
  earAngle = radians(15) * sin(radians(frameCount * 5));

  // Draw bunny head
  fill(255);
  ellipse(bunny, 400, 200, 200);  // head

  // Draw left ear with animated flap
  pushMatrix();
  translate(bunny - 50, 300);
  rotate(earAngle);
  ellipse(0, 0, 50, 100);
  popMatrix();

  // Draw right ear with animated flap (mirrored)
  pushMatrix();
  translate(bunny + 50, 300);
  rotate(-earAngle);
  ellipse(0, 0, 50, 100);
  popMatrix();

  // Draw eyes with highlights
  fill(0);
  ellipse(bunny - 30, 380, 30, 30);
  ellipse(bunny + 30, 380, 30, 30);
  fill(255);
  ellipse(bunny - 30, 375, 10, 10);
  ellipse(bunny + 30, 375, 10, 10);

  // Update bunny position: bounce horizontally between x = 100 and x = 700
  bunny += vx;
  if (bunny > 700) {
    vx = -abs(vx);
  }
  if (bunny < 100) {
    vx = abs(vx);
  }

  popMatrix();
}

void updateMeteor() {
  pushMatrix();

  // Draw the meteor as a bright yellow circle
   fill(#FFF417);
  ellipse(m1, m2, 20, 20);
 
  m1=m1+v1;
  v1=15;

  if (m1 > 900) {
    m1=-100;
  }
  m2=m2+v2;
  if (m1 < 0) {
    m2=300;
    v2=-5;
  }
  m2=m2+v2;
  m2 = m2 + v2;

  if (m1 > 400) {
    v2=5;
  }
  
  // Left cloud cluster
  fill(255);
  ellipse(100, 80, 60, 40);
  ellipse(130, 80, 70, 50);
  ellipse(160, 80, 60, 40);
  // Right cloud cluster
  ellipse(450, 70, 50, 30);
  ellipse(480, 70, 60, 35);
  ellipse(510, 70, 50, 30);

  popMatrix();
}
