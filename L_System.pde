String array = "X";

void setup() {
  size(600, 600);
  background(63, 138, 26);
}

void draw() {
  translate(25, 575);
  rotate(-PI/4);
  scale(.04);
  lineL(array);
}

void mousePressed() {
  StringBuffer next = new StringBuffer();
  for (int i = 0; i < array.length(); i++) {
    char c = array.charAt(i);
    if (c == 'X') {
      next.append("F+[[X]-X]-F[-FX]+X");
    } else if (c == 'F') {
      next.append("FF");
    } else {
      next.append(c);
    }
  }
  array = next.toString();
  println("Generation " + array);
}

void lineL(String array) {
  if (array.length() > 10) {
    for (int i = 0; i < array.length(); i++) {
      char c = array.charAt(i);
      if (c == 'F') {
        line(0, 0, 20, 0);
        translate(20, 0);
      } 
      if (c == '-') {
        rotate((-25*PI)/180);
      }
      if (c == '+') {
        rotate((25*PI)/180);
      }
      if (c == '[') {
        pushMatrix();
      }
      if (c == ']') {
        popMatrix();
      }
    }
  } else {
    return;
  }
}
