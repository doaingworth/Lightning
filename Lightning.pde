void setup()
{
  size(300,300);
  background(0,0,0);
  strokeWeight(126);
}
void draw()
{
  strokeWeight(10);
  stroke(153);
  while(endX <= 300 && endY <= 300) {
    endY = startY + (int) (Math.random() * 9.0);
    endX = startX + (int) (Math.random() * 18.0) - 9;
    line(startX,startY,endX,endY);
    startX = endX;
    startY = endY;
}
void mousePressed()
{

}

