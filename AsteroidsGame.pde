SpaceShip sos;
public void setup() 
{
  
  SpaceShip sos = new SpaceShip();
   
}
public void draw() 
{
  background(0);
  star.show();
  sos.show();
  
public void keyPressed(72)
  {
    getX == (int)(Math.random()*500);
    getY == (int)(Math.random()*500);
  }
public void keyPressed(65)
{
  sos.rotate();
  getPointDirection++;
}
public void keyPressed(68)
{
  sos.rotate();
  getPointDirection--;
}
public void keyPressed(87)
{
  sos.accelerate();
  getCenterX++;
  getCenterY++;
}
publiv void keyPressed(83)
{
  sos.accelerate();
  getCenterY--;
  getCenterX--;

}
}
class Star 
{
  int myX, myY;
  Star()
  {
    myX = (int)(Math.random()*500);
    myY = (int)(Math.random()*500);
  }
  void show()
  {
    fill(255);
    ellipse(myX, myY, 3, 3);
  }
}
class SpaceShip extends Floater  
{   
    public SpaceShip() {x = 0;}
    public void setX(int x) {myX = x;}
    public void setY(int y) {myY = y;}
    public void setCenterX(int x) {myX = x;}
    public void setCenterY(int y) {myY = y;}
    public void setDirectionX(double x) {myX = x;}
    public void setDirectionY(double y) {myY = y;}
    public void setPointDirection(int degrees) {degrees = 0;}
    abstract public void corners = 7;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 6;
    yCorners[1] = -8;
    xCorners[2] = 2;
    yCorners[2] = -4;
    xCorners[3] = 16;
    yCorners[3] = 0;
    xCorners[4] = 2;
    yCorners[4] = 4;
    xCorners[5] = 6;
    yCorners[5] = 8;
    xCorners[6] = -8;
    yCorners[6] = 8;
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

