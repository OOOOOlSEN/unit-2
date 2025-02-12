int x;
int y;
void setup() {
  size(800,600);
}
void draw() {
  background(3,173,255);//sky
  //backgroud hills
  //strokeWeight(1);
  ellipse(x,250,y,y);
  x=x+5;
  y=y+1;
  if(x>800){
    x=-100;
    y=0;}
  //line(300,300,mouseX,mouseY);
}
