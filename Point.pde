class Point {
  float x, y; // koordinatları

  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }

  Point(Point p) {
    this(p.x, p.y);
  }

  Point add(float x, float y) {
    this.x += x;
    this.y += y;
    return this;
  }

  Point add(Point p) {
    return add(p.x, p.y);
  }

  void set(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void set(Point p) {
    set(p.x, p.y);
  }

  boolean greater(Point comparePoint) {
    return this.x > comparePoint.x && this.y > comparePoint.y ;
  }

  String toString() {
    return "(" + String.format("%.4f", x) + ", " 
      + String.format("%.4f", y) + ")";
  }
}
