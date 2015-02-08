class Point
{
  
  int xOffset;
  int yOffset;
  PVector position = new PVector();
  int unit;
  
  int scale = 0;
  
  int R = 0;
  int G = 0;
  int B = 0;
  
  // Receives an offset number for x and y and the unit of spacing
  // sets the positions X value to the xTemp, and sets the positions Y value to the yTemp
  public Point(int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp, int tempUnit)
  {
    this.xOffset = xOffsetTemp;
    this.yOffset = yOffsetTemp;
    position.x = xTemp;
    position.y = yTemp;
    
    this.unit = tempUnit;
  }
  
  public void update()
  {
     
  }
  
  // Draws and Ellipse to the screen based on its position and offsets them apart
  public void draw()
  {
    fill(R, G, B);
    ellipse(xOffset + position.x, yOffset + position.y, scale, scale);
  }
}
