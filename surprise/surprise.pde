float x;
float y;
float z;
float I;
color start;
color end;
color r = color(251, 13, 27);
color o = color(253, 121, 35);
color Y = color(255, 253, 56);
color g = color(42, 219, 47);
color b = color(52, 86, 251);
color i = color(122, 40, 161);
color v = color(211, 28, 247);
int h;
int j;
float base;
color f;
import processing.serial.*;
boolean draw = false;
boolean backgroundCleared = false;
Serial myPort;

color [] colorArray = {r, o, Y, g, b, i, v};
byte[]n = new byte[2];
long fCount;
int count;
void setup()
{
  size(1900, 777, P3D);
  ortho();
  background(0);
  I = height / 7;
  println(I);
  h = 0;
  count = 0;
  y = 0;
  String portName = "/dev/tty.usbserial-DA01L5YR";
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil('/');
  fCount = 0;
}

void draw()
{   
  if (draw)
  {
    fCount++;
    if((fCount%5 == 0) && y >= 0)
    { 
      x = 0.08*(3750 - fCount)*sin(radians(fCount)) + width/2;
      z = 0.15*(3750-fCount)*cos(radians(fCount));
      y = height - 0.2*fCount;
      
      j = 6 - int(y / I);
      start = colorArray[j];
      end = colorArray[(j + 1)%7];
      base = I*(ceil(abs(y/I)));
      f = lerpColor(start, end, ((base - y) / I));
  
      pushMatrix();
      translate(x, y, z);
      fill(f);
      noStroke();
      pointLight(red(f), green(f), blue(f), 0, -100, 10000);
      //fill(f);
      sphere(3);
      popMatrix();
      
      
      x = 0.08*(3500 - fCount + 500)*sin(radians(fCount + 500)) + width/2;
      z = 0.15*(3500-fCount + 500)*cos(radians(fCount + 500));
      y = height - 0.2*(fCount);
      
      j = (j + 1) % 7;;
      start = colorArray[j];
      end = colorArray[(j + 1)%7];
      base = I*(ceil(abs(y/I)));
      f = lerpColor(start, end, ((base - y) / I));
  
      pushMatrix();
      translate(x, y, z);
      fill(f);
      noStroke();
      pointLight(red(f), green(f), blue(f), 0, -100, 10000);
      //fill(f);
      sphere(3);
      popMatrix();
  
      x = 0.08*(3500 - fCount + 100)*sin(radians(fCount + 100)) + width/2;
      z = 0.15*(3500-fCount + 100)*cos(radians(fCount + 100));
      y = height - 0.2*(fCount);
      
      j =(j + 1) % 7;;
      start = colorArray[j];
      end = colorArray[(j + 1)%7];
      base = I*(ceil(abs(y/I)));
      f = lerpColor(start, end, ((base - y) / I));
  
      pushMatrix();
      translate(x, y, z);
      fill(f);
      noStroke();
      pointLight(red(f), green(f), blue(f), 0, -100, 10000);
      //fill(f);
      sphere(3);
      popMatrix();
      
      x = 0.08*(3500 - fCount + 900)*sin(radians(fCount + 900)) + width/2;
      z = 0.15*(3500-fCount + 900)*cos(radians(fCount + 900));
      y = height - 0.2*(fCount);
      
      j = (j + 1) % 7;
      start = colorArray[j];
      end = colorArray[(j + 1)%7];
      base = I*(ceil(abs(y/I)));
      f = lerpColor(start, end, ((base - y) / I));
  
      pushMatrix();
      translate(x, y, z);
      fill(f);
      noStroke();
      pointLight(red(f), green(f), blue(f), 0, -100, 10000);
      //fill(f
      sphere(3);
      popMatrix();
    }
    
    if (y < 0)
    {
      background(0);
      //draw = false;
      fCount = 0;
      y = 0;
    }
  }
}

void serialEvent(Serial myPort)
{
  n = myPort.readBytes(2);
  if (n[0]==1)
  {
    draw = true;
  }
}

void keyPressed()
{
  if(key=='1')
    draw = true;
}

void drawCylinder(int sides, float r, float h)
{
  float halfHeight = h / 2;
  float angle = 360 / sides;
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    vertex( x, y, halfHeight);
    vertex( x, y, -halfHeight);    
  }
  endShape(CLOSE); 
}