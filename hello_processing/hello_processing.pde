float c = 0;
float angle = 0;

void setup() {
  colorMode(HSB);
  size(500, 500);
}

void draw() {
  c = (c + 0.7) % 255;
  angle += 0.1;

  background(240);
  fill(c, 255, 255);

  float x = cos(angle) * 150 + (width / 2);
  float y = sin(angle) * 150 + (height / 2);

  ellipse(x, y, 100, 100);
}
