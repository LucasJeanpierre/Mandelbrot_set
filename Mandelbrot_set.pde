float a=0;
float b=0;

float aa;
float bb;

float ca=a;
float cb=b;

boolean borne;

int nb;

float nb1p=2;
float nb1m=-2;
float nb2p=2;
float nb2m=-2;

float size=2;


float xm;
float ym;

int nbboucle=1;


float fx;
float fy;
float lx;
float ly;
boolean pressed=false;

float fxi;
float fyi;
float lxi;
float lyi;

boolean startdraw=false;
PGraphics canvas;

color c;



void setup() {
  size(displayHeight, displayHeight);
  noStroke();
  fxi=-2;
  fyi=-2;
  lxi=2;
  lyi=2;
  canvas = createGraphics(width, width);
  canvas.beginDraw();
  canvas.background(0);
  canvas.endDraw();
}

void draw() {


  /*
  if (mousePressed) {
   size-=0.5/nbboucle;
   xm = map(mouseX, 0, width, nb1m, nb1p);
   ym = map(mouseY, 0, height, nb2m, nb2p);
   nb1m=xm-size;
   nb1p=xm+size;
   nb2m=ym-size;
   nb2p=ym+size;
   nbboucle+=1;
   }*/


  image(canvas, 0, 0);




  if (!startdraw) {

    canvas.beginDraw();

    for (int x = 0; x < height; x++) {
      for (int y = 0; y < width; y++) {
        ca = map(x, 0, width, fxi, lxi);
        cb = map(y, 0, height, fyi, lyi);


        a=0;
        b=0;

        for (int i = 0; i <500; i++) {
          aa = a * a - b* b;
          bb = 2 * a * b;
          a = aa + ca;
          b = bb + cb;

          if (abs(a+b)>500) {
            borne = false;
            nb=i;
            break;
          } else {
            borne = true;
          }
        }
        if (borne) {
          fill(0);
          c = color(0);
        } else {
          fill(brightness(int(map(nb, 0, 50, 0, 255))));
          c = color(brightness(int(map(nb, 0, 50, 0, 255))));
        }
        canvas.fill(c);
        canvas.noStroke();
        canvas.rect(x, y, 1, 1);
      }
    }
    canvas.endDraw();
    startdraw = true;
  }

  if (mousePressed) {
    if (!pressed) {
      fx=mouseX;
      fy=mouseY;
      pressed=true;
    } 
    if (pressed) {
      lx=mouseX;
      ly=(mouseX-fx)+fy;
    }
    noFill();
    strokeWeight(5);
    stroke(255);
    rect(fx, fy, lx-fx, ly-fy);
  } else {
    pressed=false;
  }

  // noLoop();
}

void mouseReleased() {
  float f1=map(fx, 0, width, fxi, lxi);
  float f2=map(fy, 0, height, fyi, lyi);
  float l1=map(lx, 0, width, fxi, lxi);
  float l2=map(ly, 0, height, fyi, lyi);
  lxi=l1;
  lyi=l2;
  fxi=f1;
  fyi=f2;
  startdraw=false;
}
