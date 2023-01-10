ArrayList<Particle> flakes = new ArrayList<Particle>();
static int particleSize = 20;
static int numArms = 6;

void setup() {
  size(800, 800);
  flakes.add(new Particle());
  noStroke();
}

void draw() {
  background(0);
  
  for (int i = 0; i < flakes.size(); i++) {
    Particle tempParticle = flakes.get(i);
    
    if (tempParticle.moving == true) {
      for (int j = 0; j < 5; j++) {
        tempParticle.step();
        if (checkCollisions(tempParticle)) {
          tempParticle.moving = false;
          flakes.add(new Particle());
          if (checkCollisions(flakes.get(flakes.size() - 1))) stop();
          break;
        }
      }
    }
    for (int a = 0; a < numArms; a++) {
      pushMatrix();
      
      translate(400, 400);
      rotate(2*PI / numArms * a);
      
      fill(255);
      ellipse(tempParticle.x, tempParticle.y, particleSize, particleSize);
      
      popMatrix();
    }
  }
    

}

Boolean checkCollisions(Particle input) {
  for (Particle p : flakes) {
    if (input.x - particleSize / 2.0 < 0) return true;
    else if (!(p.x == input.x && p.y == input.y)) {
      if (dist(p.x, p.y, input.x, input.y) < particleSize) return true;
    }
  }
  return false;
}
