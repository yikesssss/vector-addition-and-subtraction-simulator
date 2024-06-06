import g4p_controls.*;

PFont myFont;

boolean isAdd = false;
boolean isSub = false;
boolean isPoint = false;
int clicks;

int padding = 40;

Vector v1 = new Vector(0, 0, 'o');
Vector v2 = new Vector(0, 0, 'o');
Vector rA, rS, t, tA, tS;

void setup() {
  size(800, 800);  
  myFont = createFont("Arial", 12);
  createGUI();
  textFont(myFont);
  frameRate(48);
}

void draw() {

  background(0);
  grid();
  translate(width/2, height/2); //translate to middle so that all vectors are drawn from the right place
  
  if(v1.magnitude() != 0) {
    v1.drawVector(0, 0);
    v1.displayPoint(0, 0);
  }
  
  if(v2.magnitude() != 0) {
    v2.drawVector(0, 0);
    v2.displayPoint(0, 0);
  }
  
  if(isAdd == true && v1.magnitude() != 0 && v2.magnitude() != 0) {
    tA.drawVector(v1.x, -v1.y); //this draws the translated vector from the first vectors position
    rA.drawVector(0, 0);
    rA.displayPoint(0, 0);
    
    rPosition.setText("("+rA.x+", "+rA.y+")");
    rMagnitude.setText(str(rA.magnitude()));
    rAngle.setText(str(int(degrees(rA.angle())))+" degrees");
  }
  
  if(isSub == true && v1.magnitude() != 0 && v2.magnitude() != 0) {
    tS.drawVector(v1.x, -v1.y);
    rS.drawVector(0, 0);
    rS.displayPoint(0, 0);
    
    rPosition.setText("("+rS.x+", "+rS.y+")");
    rMagnitude.setText(str(rS.magnitude()));
    rAngle.setText(str(int(degrees(rS.angle())))+" degrees");
  }
  
}

void mouseClicked() { 
  if (isPoint == true) { //will only start counting clicks if the button has been pressed
    clicks++;
    
    if(clicks == 1) {
      int a = mouseX - width/2;
      int b = height/2 - mouseY;
      v1 = new Vector(a, b, 'o');
      int angle = int(degrees(v1.angle()));
      chosePointButton.setText("Chose your second point");
      v1Position.setText("("+a+", "+b+")");
      v1Magnitude.setText(str(v1.magnitude()));
      v1Angle.setText(angle+" degrees");
    }
    
    if(clicks == 2) { 
      chosePointButton.setText("no more points to chose");
      int a = mouseX - width/2;
      int b = height/2 - mouseY;
      v2 = new Vector(a, b, 'o');
      int angle = int(degrees(v2.angle()));
      v2Position.setText("("+a+", "+b+")");
      v2Magnitude.setText(str(v2.magnitude()));
      v2Angle.setText(angle+" degrees");
      intro.setText("Now chose which operation you want for these vectors");
      rA = v1.addVector(v2); //two different vectors for each operation
      rS = v1.subVector(v2);
      tA = new Vector(a, b, 't');
      tS = new Vector(a, b, 't'); 
      tS.changeDirection = true; //for subtraction the vector goes in the oposite direction
    }
  }
  dotProductDisplay.setText(str(v1.dotProduct(v2)));
  
}


void grid() { //draws the grid and the numbers at tick lines
  push();
  strokeWeight(1);
  stroke(255);
  line(width/2, padding, width/2, height-padding);
  line(padding, height/2, width-padding, height/2);
  int len = width - 2*padding;
  translate(width/2, height/2);
  line(-len/4, 4, -len/4, -4);
  text(len/4, -len/4-8, 16);
  line(len/4, 4, len/4, -4);
  text(-len/4, len/4-8, 16);
  line(4, len/4, -4, len/4);
  text(-len/4, 4, len/4);
  line(4, -len/4, -4, -len/4);
  text(len/4, 4, -len/4);
  pop();
}
