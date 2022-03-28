int angle = 0;
int vertexMin = 50;
int vertexMax = 450;
int vertexChange = 50;
PShape ps;
color shapeColor;

void newShape() {
  background(245);
  angle = 0;
  shapeColor = color(random(0,255),random(0,255),random(0,255));
  ps = createShape();
  ps.beginShape();
  int alpha = int(random(40,60));
  ps.fill(shapeColor,alpha);
  ps.stroke(shapeColor);
  int j = int(random(5,10));
  for (int i = 0; i < j; i++) {
    ps.vertex(random(vertexMin,vertexMax),random(vertexMin,vertexMax));
  }
  ps.endShape(CLOSE);
}

void setup() {
  size(500,500);
  background(245);
  stroke(20);
  rectMode(CENTER);
  newShape();
}

void draw() {
  translate((width/2),(height/2));
  rotate(angle);
  shape(ps, -250+angle, -250);
  angle ++;
}

void keyPressed() {
  saveFrame("flower#####.png");
  vertexMin = vertexMin + vertexChange;
  vertexMax = vertexMax - vertexChange;
  noLoop();
}

void mousePressed() {
  loop();
  newShape();
}

void mouseWheel() {
  loop();
  vertexMin = 50;
  vertexMax = 450;
  newShape();
}
