pelota p[];
PImage image;
int MAX = 100, kill=0,clicks=0;

void setup(){
  int i ;
  size(400,400);
  p=new pelota[MAX];
  
  for(i=0;i<MAX;i++ )
  p[i]= new pelota((int) random(400), (int) random(380), (int) random(20)+5,color ((int) random(256)), (int) pow(-1,i),(int)pow(-1,i),1);


}

void draw(){
  int i ;
  background(255);
  for (i=0; i<MAX; i++){
    p[i].pinta();
    p[i].mueve();
  
  }
  gana();

}
class pelota{
  int x,y,r,sx,sy,v;
  color c;
  pelota(int px, int py, int rad, color col, int sentidox, int sentidoy , int vel){
    x=px;
    y=py;
    r=rad;
    c=col;
    sx=sentidox;
    sy=sentidoy;
    v=vel;
  }
  void pinta(){
    fill(c);
    ellipse(x,y,r,r);
  
  }
  void mueve(){
    if(x == 400)
    sx=sx*-v;
    if(x==0)
    sx=sx*-v;
    if(y==400)
    sy=sy*-v;
    if(y==0)
    sy=sy*-v;
    x=x+sx;
    y=y+sy;
  }
}

void cambia(int px, int py){
  int i;
  pelota aux;
  int max = MAX;
  int flat=0;
  
  
  for (i=0;i<MAX;i++){
    if(px >= p[i].x-10 && px<=p[i].x+10 && py>=p[i].y-10 && py <= p[i].y+10){
      p[i].c=color(255,0,0);
      p[i].r=0;
      kill++;
      println("kill = "+kill);
      MAX--;
      flat=1;
    }
    if(flat==1){
    p[i]=p[i+1];
    
    }
  
  }
  println("FIN");


}

void gana(){
  if ( MAX == 0 ){
    println("GANASTE");
    println("CLICKS="+clicks);
    image=loadImage("winner.png");
    colorMode(HSB,360,100,100);
    background(image);
    noLoop();
  
  }

}

void mousePressed(){
  println(mouseX,mouseY);
  clicks++;
  cambia(mouseX,mouseY);

}
