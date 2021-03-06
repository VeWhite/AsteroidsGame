SpaceShip sos;
ArrayList <aor> Asteroids;
public void setup() 
{
  
  sos = new SpaceShip();
  bod = new ArrayList <Bullet>();
  aor = new ArrayList <Asteroids>();
   
}
public void draw() 
{
  background(0);
  star.show();
  sos.show();
  
  for (int i = 0; i < aor.size; i++)
  {
    for (int j = 0; j < bullet.size(); i++)
    {
      float checkDestrusction = dist(bullets.get(j).getX(), bullets.get(j).getY(), aor.get(i).getX(), aor.get(i).getY());
      if(checkDestrusction < 25*aor.get(i).getSizeMult())
      {
        if(aor.get(i).getSizeMult() > 1)
        {
          Asteroids aor1 = new Asteroids(aor.get(i).getX(), aor.get(i).getSizeMult() -1);
          Asteroids aor2 = new Asteroids(aor.get(i).getY(), aor.get(i).getSizeMult() - 1);
          aor.add(aor1); 
          aor.add(aor2);
        }
      }
    }
  }
/*public void keyTyped()
  {
    if(key == 'h') //72
    {
      setDirectionX(0);
      setCenterX();
    }
    if(key == 'a') //65
      {
        sos.rotate();
        getPointDirection++;
      }
      if(key == 'd') //68
      {
        sos.rotate();
        getPointDirection--;
      }
      if(key == 'w') //87
        {
          sos.accelerate();
          getCenterX++;
          getCenterY++;
        }
        if(key == 's') //83
          {
            sos.accelerate();
            getCenterY--;
            getCenterX--;
          }
  }*/

}
class Star 
{
  int starX, starY;
  Star()
  {
    starX = (int)(Math.random()*500);
    starY = (int)(Math.random()*500);
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
    SpaceShip()
    {
    corners = 7;
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

    myColor = color(255);
    myCenterX = 230;
    myCenterY = 230;
    myDirectionX = 0;
    myDirectionY = 0;
    myPointDirection = 0;
    }
}
class Asteroids extends Floater
{
  int rotateSpeed;




  /*boolean add(Object x);
  void add(int index, Object element);
  Object get(int index);
  Object set(int index, Object x);
  int size();


Asteroids()
  {
    corners = 9;
    int[] xS = {0,2,4,4,2,-2,-4,-4,-2};
    int[] yS = {5,4,2,-2,-4,-4,-2,2,4};
    xCorners = xS;
    yCorners = yS;
    myColor =  color(199);
    myCenterX = 
  }
}*/
class Bullet extends Floater
Bullet(SpaceShip sos)
{
  myCenterX = 230;
  myCenterY = 230;
  myPointDirection = 0; 
  double dRadians = myPointDirection*(Math.PI/180);
  myDirectionX = 5*Math.cos(dRadians) + 0;
  myDirectionY = 5*Math.sin(dRadians) + 0;
}
public void aMove()
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

}  
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

