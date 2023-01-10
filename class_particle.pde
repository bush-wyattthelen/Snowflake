class Particle {
  float x;
  float y;
  float direction;
  Boolean moving;
  
  Particle() {
    x = 800;
    y = (int)((Math.random() - 0.5) * 100);
    //direction = degrees(-atan(800.0 / (y - 400)));
    //direction = (direction < 0) ? direction : -direction;
    moving = true;
  }
  
  void step() {
    /*x += sin(radians(direction));
    y -= cos(radians(direction));*/
    x -= 2;
  }
}
