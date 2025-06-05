/**
 * Arctangent. 
 * 
 * Move the mouse to change the direction of the eyes. 
 * The atan2() function computes the angle from each eye 
 * to the cursor. 
 */
 
Eye e1, e2, e3;

void setup() {
  size(640, 360, P3D);
  surface.setResizable(true);
  noStroke();
  // Don't initialize eyes here anymore!
}

void draw() {
  background(102);

  // Dynamic positioning of eyes based on current window size
  Eye e1 = new Eye(width / 2 - 150, height / 2 - 100, 120);
  Eye e2 = new Eye(width / 2 - 100, height / 2 + 30, 80);
  Eye e3 = new Eye(width / 2 + 100, height / 2 + 70, 220);

  e1.update(mouseX, mouseY);
  e2.update(mouseX, mouseY);
  e3.update(mouseX, mouseY);

  e1.display();
  e2.display();
  e3.display();
}

class Eye {
  int x, y;
  int size;
  float angle = 0.0;
  
  Eye(int tx, int ty, int ts) {
    x = tx;
    y = ty;
    size = ts;
 }

  void update(int mx, int my) {
    angle = atan2(my-y, mx-x);
  }
  
  void display() {
    pushMatrix();
    translate(x, y);
    fill(255);
    ellipse(0, 0, size, size);
    rotate(angle);
    fill(153, 204, 0);
    ellipse(size/4, 0, size/2, size/2);
    popMatrix();
  }
}

