class Vector {
  float x;
  float y;
  char status = 's';
  float newX;
  float newY;
  boolean changeDirection = false;
  int animcounter = 0;

  Vector(float xCoor, float yCoor, char s) {
    this.x = xCoor;
    this.y = yCoor;
    this.status = s;
  }

  float magnitude() {
    return sqrt(sq(this.x) + sq(this.y));
  }

  float angle() { //find the angle from the origin in radians
    if (this.x >= 0 && this.y >= 0) {
      return atan(this.y/this.x);
    } else if (this.x <= 0 && this.y >= 0) {
      return PI - abs(atan(this.y/this.x));
    } else if (this.x <= 0 && this.y <= 0) {
      return PI + abs(atan(this.y/this.x));
    } else {
      return TWO_PI - abs(atan(this.y/this.x));
    }
  }

  void choseColour() {
    switch(status) {
    case 'o':
      fill(93, 207, 107);
      stroke(93, 207, 107);
      break;
    case 'b': //this is the colour for the second vector
      fill(128, 197, 128);
      stroke(128, 197, 128);
      break;
    case 'r':
      fill(251, 76, 92);
      strokeWeight(4); 
      stroke(251, 76, 92);
      break;
    case 't':
      fill(75, 141, 82);
      stroke(75, 141, 82);
      break;
    default:
      stroke(255);
      break;
    }
  }

  void drawVector(float bx, float by) {
    push();
    strokeWeight(2);
    choseColour();
    translate(bx, by);
    
    if (changeDirection == true) {
      rotate(-this.angle() + PI);
    } else {
      rotate(-this.angle());
    }
    
    line(0, 0, this.animcounter, 0);
    triangle(this.animcounter-8, -4, this.animcounter, 0, this.animcounter-8, 4);
    
    if(this.animcounter < this.magnitude()) {
      this.animcounter += 2;
    }

    pop();
  }


  void displayPoint(float bx, float by) {
    String d = "("+this.x +", "+ this.y+")";
    push();
    translate(bx, by);
    text(d, this.x+8, -this.y-8);
    pop();
  }
  
  Vector addVector(Vector v) { //returns the resultant vector
    float a = this.x + v.x;
    float b = this.y + v.y;
    Vector r = new Vector(a , b, 'r');
    return r;
  }

  Vector subVector(Vector v) { //returns the resultant vector
    float a = this.x - v.x;
    float b = this.y - v.y;
    Vector r = new Vector(a, b, 'r');
    return r;
  }

  float dotProduct(Vector v) {
    return this.x*v.x + this.y*v.y;
  }
}
