// Pressing Control-R will render this sketch. //<>// //<>//

// Many parts of this program are commented. 
// This is b/c I wanted to make multiple things to happen with Thread, 
// but I gave up after learning that Processing can't use Thread.  

//import java.lang.Thread;

//Lightning
int startY = 0;
int startX = 150;
int endY = 0;
int endX = 150;

//Snake
float snakePositionX = 150;
float snakePositionY = 150;
float lightningLength = 9.0;
int[][] snakeSegments = {{50, 50}, {50, 40}, {40, 40}};
int[] raspberryPosition = {70, 70};
int raspberrySpawned = 1;
String direction = "right";
String changeDirection = direction;
int move = 0;
int move2 = 0;
int x;

void setup()
{
  size(300, 300);
  background(0, 0, 0);
  strokeWeight(126);
}

void draw()
{
  lightning();
  snake();
}

void lightning() {
  if (move2 % 100 == 0) {
    //clear();
    //color(255, 255, 0);
    //LightningThread lightning = LightningThread.createAndStart("Lightning");
    strokeWeight(10);
    stroke(153);
    while (endX <= 300 && endY <= 300) {
      endY = startY + (int) (Math.random() * lightningLength);
      endX = startX + (int) (Math.random() * 2 * lightningLength) - lightningLength;
      line(startX, startY, endX, endY);
      startX = endX;
      startY = endY;
    }
    startY = 0;
    startX = 159;
    endY = 0;
    endX = 150;
  }
  move2++;
  
  fill(153);
  //square(snakePositionX, snakePositionY, 10);
  rect(snakePositionX, snakePositionY, 10, 10);
}

void snake() {
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      changeDirection = "up";
    }
  } else if (key == 'a' || key == 'A') {
      changeDirection = "left";
  } else if (key == 's' || key == 'S') {
      changeDirection = "down";
  } else if (key == 'd' || key == 'D') {
      changeDirection = "right";
  }
  if (move % 10 == 0) {
    if (changeDirection == "right" && direction != "left") direction = changeDirection;
    if (changeDirection == "left" && direction != "right") direction = changeDirection;
    if (changeDirection == "up" && direction != "down") direction = changeDirection;
    if (changeDirection == "down" && direction != "up") direction = changeDirection;

    if (direction == "right") snakePositionX += 10;
    if (direction == "left") snakePositionX -= 10;
    if (direction == "down") snakePositionY += 10;
    if (direction == "up") snakePositionY -= 10;

    //snakeSegments = addX((int) snakeSegments.length, snakeSegments, snakePosition);
    
    //color(0, 255, 0);
    /*for (int n = 0; n <= snakeSegments.length/2; n++) {
      square(snakeSegments[n][0], snakeSegments[n][1], 10);
    }*/
    
    fill(153);
    //square(snakePositionX, snakePositionY, 10);
    rect(snakePositionX, snakePositionY, 10, 10);
  }
  move++;
}

public static int[][] addX(int n, int[][] arr, int[] x) { 
  int i; 

  // create a new array of size n+1 
  int newarr[][] = new int[n + 1][]; 

  // insert the elements from 
  // the old array into the new array 
  // insert all elements till n 
  // then insert x at n+1 
  for (i = 0; i < n; i++) 
    newarr[i] = arr[i]; 

  newarr[0][0] = x[0]; 
  newarr[0][1] = x[1];

  return newarr;
} 

/*void mousePressed() {
  startY = 0;
  startX = 159;
  endY = 0;
  endX = 150;
}*/

void keyPressed() {
  if (key == CODED) {
    if (keyCode == KeyEvent.VK_UP) {
      changeDirection = "up";
    } else if (keyCode == KeyEvent.VK_DOWN) {
      changeDirection = "down";
    } else if (keyCode == KeyEvent.VK_LEFT) {
      changeDirection = "left";
    } else if (keyCode == KeyEvent.VK_RIGHT) {
      changeDirection = "right";
    }
    lightning();
  }
}

/*public class LightningThread implements Runnable {
 
 Thread thrd;
 public static LightningThread createAndStart(String name) {
   LightningThread myThrd = new LightningThread(name);
 
   myThrd.thrd.start();
   return myThrd;
 }
 
 LightningThread(String name) {
   thrd = new Thread(this, name);
 }
 
 
 public void run() {
   strokeWeight(10);
   stroke(153);
   while (endX <= 300 && endY <= 300) {
     endY = startY + (int) (Math.random() * 9.0);
     endX = startX + (int) (Math.random() * 18.0) - 9;
     line(startX, startY, endX, endY);
     startX = endX;
     startY = endY;
   }
 }
}*/
