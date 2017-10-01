import java.util.Random;
import processing.sound.*;

/*
size(800, 400);
 background(200, 100, 150);
 
 stroke(256, 0, 0);
 fill(0, 256, 0);
 rect(30, 50, 100, 200);
 */


Random rnd = new Random();
int oldX = mouseX;
int oldY = mouseY;
SinOsc sine;

void setup() {
  size(880, 620);
    // Create the sine oscillator.
  sine = new SinOsc(this);
  sine.play();
}

void draw() {
  if (oldX == mouseX && oldY == mouseY) return;

  if (mousePressed) {
    fill(0, 0, mouseX % 256);
  } else {
    fill(rnd.nextInt(256), 0, 0);
  }
  
  sine.freq(mouseX+mouseY);
  sine.pan(map(mouseX, 0, width, -1.0, 1.0));
  
  ellipse(mouseX, mouseY, 80, 80);
  oldX = mouseX; 
  oldY = mouseY;
}