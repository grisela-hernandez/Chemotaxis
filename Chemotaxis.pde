 Bacteria [] red;
int difficulty = 50; 
int speed = 5; 

 void setup(){     
  red = new Bacteria[25]; 
   size(900, 900); 
   frameRate(18); 

   for (int i = 0; i < red.length; i++){
     red[i] = new Bacteria(800, 800); 
   }
 }
 
 void draw(){  
   background(0, 34, 255); 
   turtle(); 
   blackHole(); 
   
  for (int k = 0; k < red.length; k++){
    red[k].move(); 
    red[k].show(); 
  }
}  
 
 class Bacteria {     
   int myX, myY, bactColor; 

  Bacteria(int x, int y){
    
    myX = x; 
    myY = y; 
   bactColor = color((int)(Math.random()* 255), (int)(Math.random()* 255) + 195, 255); 
  }
  
  void move(){
 
  myX = myX + (int) (Math.random() * speed*2) - speed; 
  myY = myY + (int) (Math.random() * speed*2) - speed;
// border restrictions
    while (myX <= 20){
      myX+=30; 
     }
     while (myX >= 900){
      myX-=30; 
     }
     while (myY <= 20){
      myY+=30; 
     }
     while (myY >= 880){
      myY-=30; 
     }
// mouse Control     
     if (dist(myX, myY, mouseX, mouseY) < difficulty){
       myX = mouseX; 
       myY = mouseY;
     }
  }
  void show(){
 
   // draw the circles while not overlapping with turtle() or blackHole() 
   if (myX < 900 && myY > 50){
      fill(bactColor);
      stroke(0, 0, 0);
      ellipse(myX,myY,50,50);
    }
    // if any circle makes it to the turtle
    if (myX < 100 && myY < 80){
    fill(255, 255, 255);
    stroke(0, 0, 0); 
    textSize(50); 
    text("Oh no... :(", 325, 450); 
    noLoop(); 
    } 
    // if any circle makes it to the blackHole
   else if (myX > 860 && myY < 50){
    fill(255, 255, 255);
    stroke(0, 0, 0); 
    textSize(50); 
    text("You did it!", 300, 450); 
    noLoop(); }
  }
}
 
// key presses
void keyPressed(){
  // level difficulty ]
   if (key == 'e'){
    difficulty = 50; 
    speed = 5; 
   }
   if (key == 'm'){
     difficulty = 30; 
     speed = 10; 
   }
   if (key == 'h'){
     difficulty = 30; 
     speed = 15; 
   }
}
// turtle and the black hole 
void turtle(){
    fill(0, 255, 0);
    stroke(0, 255, 0); 
    ellipse(50,50, 150,150); 
    
    fill(0, 0, 0);
    stroke(0, 0, 0); 
    ellipse(59,100, 25,25); 
    
    fill(0, 0, 0);
    stroke(0, 0, 0); 
    ellipse(100, 50, 25,25); 
}

void blackHole(){
  fill(0, 0, 0);
  stroke(0, 0, 0); 
  ellipse(900, 50, 150,100);   
}
