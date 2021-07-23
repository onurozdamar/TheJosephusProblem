

ArrayList < Man > mans, temp;
int manCount = 41;

int winner;

Point animationV = new Point(0.5, - 0.160);

void setup() {
  size(800, 800);
  surface.setLocation(100, 100);
  textAlign(CENTER, CENTER);

  winner = findWinner();

  mans = new ArrayList();
  temp = new ArrayList();
  for (int i = 0; i < manCount; i++) {
    mans.add(new Man(0, 300, i));
    temp.add(mans.get(i));
  }
}

void draw() {
  background(0);

  text("v" + animationV, 60, 10);

  if (attackEnd) {  
    textSize(20);
    text("Winner: " + winner, width / 2, height / 2);
  }

  pushMatrix();

  translate(width / 2, height / 2);
  for (int i = 0; i < mans.size(); i++) {
    rotate( - PI / mans.size() * 2);
    mans.get(i).draw();
  }

  popMatrix();
}

boolean attackStarted = false, attackEnd;

void mousePressed() {
  if (!attackStarted) {
    attackStarted = true;
    mans.get(0).attack();
  }
}

void keyPressed() {
  if (keyCode == UP) {
    animationV.add(0.5, - 0.160);
  } else if (keyCode == DOWN) {
    animationV.add( - 0.5, + 0.160);
  }
}

int findWinner() {
  byte[] binary = toBinary(manCount);
  shift(binary);
  return toDecimal(binary);
}

byte[] toBinary(int number) {
  int c = 0, temp = number;
  while (temp > 0) {
    temp /= 2;
    c++;
  }

  byte[] binary = new byte[c];

  int i = c;
  while (number > 0) {
    binary[--i] = (byte)(number % 2);
    number /= 2;
  }

  return binary;
}

int toDecimal(byte[] arr) {
  int number = 0;

  for (int i = arr.length - 1; i >= 0; i--) {
    number += int(pow(2, arr.length - 1 - i)) * arr[i];
  }

  return number;
}

byte[] shift(byte[] arr) {
  byte temp = arr[0];
  for (int i = 0; i < arr.length - 1; i++) {
    arr[i] = arr[i + 1];
  }
  arr[arr.length - 1] = temp;

  return arr;
}

void printArr(byte[] arr) {
  for (int i = 0; i < arr.length; i++) {
    print(arr[i], "");
  }
  println();
}
