
class ball{
  public boolean addscore= false;
  public float landingpoint;
  public float speed;
  public float currentposition;
  public ball(float landingpoint, float speed, float currentposition){
    this.landingpoint = landingpoint;
    this.speed = speed; 
    this.currentposition = currentposition;
  }
  public void move(){
   currentposition-= speed;
   if (currentposition<25/2){
     addscore=true;
     speed = -speed;
   }
   if(currentposition>615){
    speed = -speed; 
   }
    
  }
  
}
