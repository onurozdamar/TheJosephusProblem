class Man {
  Point head, body, arm, leg, swordStart, swordEnd;
  Point swordAnimationPoint, tempSwordEnd;

  float r = 36;
  float h = 50;
  float w = 25;

  int index;
  String indexStr;
  boolean attacking = false;
  boolean isDead = false;

  color strokeColor =255, deadColor = #D16363;

  Man(float x, float y, int index) {
    head = new Point(x, y);
    body = new Point(x, y).add(0, r / 2);
    arm = new Point(x, y).add(0, r / 2).add(0, h / 2);
    leg = new Point(x, y).add(0, r / 2).add(0, h + w);
    swordStart = new Point(x, y).add(0, r / 2).add(0, h / 2).add(w, w);
    swordEnd = new Point(x, y).add(0, r / 2)
      .add(0, h / 2).add(w, w).add(0, - w * 2);
    swordAnimationPoint = new Point(swordEnd).add(50, - 50);
    tempSwordEnd = new Point(swordEnd);

    this.index = index + 1;
    this.indexStr = this.index + "";
  }

  void draw() {
    noFill();
    stroke(strokeColor);
    textSize(12);
    text(indexStr, head.x, head.y);

    ellipse(head.x, head.y, r, r);//baş
    line(body.x, body.y, leg.x, leg.y);//gövde

    line(arm.x, arm.y, arm.x + w, arm.y + w);//sağ kol
    line(arm.x, arm.y, arm.x - w, arm.y + w);//sol kol

    line(leg.x, leg.y, leg.x + w / 2, leg.y + w / 2);//sağ bacak
    line(leg.x, leg.y, leg.x - w / 2, leg.y + w / 2);//sol bacak

    line(swordStart.x, swordStart.y, swordEnd.x, swordEnd.y);//kılıç

    if (attacking) {
      swordEnd.add(animationV);
      if (swordEnd.greater(swordAnimationPoint)) {
        attacking = false;
        swordEnd.set(tempSwordEnd);

        if (temp.size() > 1) {
          mans.get(mans.indexOf(temp.get(index % temp.size()))).isDead = true;
          mans.get(mans.indexOf(temp.get(index % temp.size()))).strokeColor = deadColor;
          temp.remove(index % temp.size());

          for (int i = index > temp.size() ? 0 : index; i < temp.size(); i++) {
            temp.get(i).index--;
          }
          if (temp.size() > 1)
            temp.get(index % temp.size()).attack();
          else
            attackEnd = true;
        }
      }
    }
  }

  void attack() {
    attacking = !attacking;
  }
}
