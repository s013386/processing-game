//Calendar variables
float hours = 0;
int day = 0;
int August = 1;
int September = 2;
int October = 3;
int November = 4;
int December = 5;
int EndOfSemester = 6;
int Month = 1;
int MonthDay = 1;
int happiness = 0;
int grades = 0;
int sadness = 0;
int energy = 0;
int loneliness = 0;
int tiredness = 0;
int money = 0;
float Sunday = ((7*day)+ 1);
float Monday = ((7*day)+ 2);
float Tuesday = ((7*day)+ 3);
float Wednesday = ((7*day)+ 4);
float Thursday = ((7*day)+ 5);
float Friday = ((7*day)+ 6);
float Saturday = ((7*day)+ 7);
boolean onmap=true;
boolean isminigame=false;
int place = 1;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
String texttodraw = " ";
int firstnum = (int)random(10);
int secondnum = (int)random(10);
int operator = (int)random(3);
int wrongone=0,wrongtwo=0;
int savedtime;
int answer;
int position;
int score =0;
int game=-1;
int totalquestions;
int returnedscore;
 ArrayList<ball> balls = new ArrayList<ball>();
int jugglex=800;
boolean movingLeft=false, movingRight=false;
void setup() {
  background(0);
  size(1600, 900);
   img1 = loadImage("Bedroom.png");
 img2 = loadImage("Store.png");
 img3 = loadImage("Erickson Field.png");
 img4 = loadImage("Dining Hall.png");
}

void draw() {

  background(0);
   fill(160, 160, 160);
  rect(0, 0, 448, 900);
  fill(0);
  textSize(32);
  text("Stats (448x900 pixels)", 10, 30);
  fill(0);
  rect(448, 0, 1152, 648);
  fill(255);
  textSize(32);
  text("Display (1152x648 pixels)", 500, 30 );
  calendarDate();
  //drawmonth();
  dayoftheweek();
  drawtext();
  displaystats();
  if (onmap==true){
   if(place == 1) {
   // background(0);
    image(img1, 448,0);
    fill(0,0,255,50);
    rect(100+350,800-252,100,100);
    rect(725,325,100,100);
    rect(1500,800-252,100,100);

  }
  else if(place == 2) {
    //background(0);
    image(img2, 448,0);
    fill(0,0,255,50);
    rect(100+350,800-252,100,100);

  }
  else if(place == 3) {
  //  background(0);
    image(img3, 448,0);
   fill(0,0,255,50);
    rect(1000,500,100,100);
    rect(1400,500,100,100);
    rect(660,250,100,100);
  }
  else if(place == 4) {
  //  background(0);
    image(img4, 448,0);
    fill(0,0,255,50);
    rect(450,550,100,100);
    rect(450,0,100,100);
  }
}
if (isminigame==true){
  if( game==1){
   // print(balls.size());
    //  background(0);
      fill(255);
  for( int i=0; i < balls.size(); i++){
    fill(255);
    ellipse(balls.get(i).landingpoint,balls.get(i).currentposition, 25,25);
    if (balls.get(i).currentposition>610 && (balls.get(i).landingpoint>jugglex+50 || balls.get(i).landingpoint<jugglex-50)){
   endgame();
    }
    balls.get(i).move();
    if (balls.get(i).addscore==true){
     score+=1; 
     if (score%10==0){
       balls.add(new ball(random(448+25,1575),5,250));
     }
     balls.get(i).addscore=false;
    }
  }
  text(score,1500,50);
  rect(jugglex, 625,50,10);
  if( movingLeft==true) jugglex-=10;
  if( movingRight==true) jugglex+=10;
  if (jugglex<448) jugglex=448;
  if (jugglex>1550) jugglex= 1550;
  }
 if (game==0){
    fill(255);
    switch(operator){
  case 0:
  text(firstnum + "+" + secondnum + " =",800,250);
  break;
  case 1:
  text(firstnum + "-" + secondnum + " =",800,250);
  break;
  case 2:
  text(firstnum + "*" + secondnum + " =",800,250);
  break;

  
} 
fill(255);
switch(position){
  case(0):
   //  fill(0,0,255);
   text(answer,750,300); 
  // fill(255);
   text(wrongone,800,300); 
   text(wrongtwo,850,300); 
   break;
   case(1):
   text(wrongone,750,300); 
    //  fill(0,0,255);
   text(answer,800,300); 
   //fill( 255);
   text(wrongtwo,850,300); 
   break;  
   case(2):
   text(wrongone,750,300); 
   text(wrongtwo,800,300); 
  // fill(0,0,255);
   text(answer,850,300); 
  // fill(255);
   break;
}
  float percentageleft= ((float)millis()-(float)savedtime)/5000;
  arc(448+25,25,25,25,0,2*PI*percentageleft);
  text(score,1550,25);
  if (savedtime<millis()-5000){
   newquestion(); 
  } 
 }



}
}
 
  
void keyPressed(){
  if  (isminigame==true){
  if (game==-1){
    texttodraw="";
        if (key=='m'){
     mathsetup();
     game=0;
  }
  if( key=='p'){
    physsetup();
    game=1;
  }}
   if (game ==1){
  if (keyCode==LEFT) movingLeft=true;
  if (keyCode==RIGHT) movingRight=true;}

 } 
  
}

void keyReleased() {
  if( game ==1){
  if (keyCode==LEFT) movingLeft=false;
  if (keyCode==RIGHT) movingRight=false;
  }
}


void mousePressed() {
  if (isminigame==true && game==0){
     if(mouseY>230&&mouseY<320){
  if(mouseX>750 && mouseX<800 && position==0)score+=1;
  if(mouseX>800 && mouseX<850 && position==1)score+=1;
  if(mouseX>850 && mouseX<900 && position==2)score+=1;
 println(mouseX);
  newquestion();
  }
  }
 // day = day + 1;
 // MonthDay = MonthDay + 1;
  if (onmap== true){
               println(mouseX + " " + mouseY);
     if(place == 1) {
              println(mouseX + " " + mouseY);
   // background(0);
    if ( (mouseX > 450 && mouseX < 550) && (mouseY > 550 && mouseY <650)) {
 
      place = 3;
    }
    if ( (mouseX > 1450 && mouseX < 1550) && (mouseY >550 && mouseY <650)) {
      place = 4;
    }
     if ( (mouseX > 675 && mouseX < 775) && (mouseY >375 && mouseY <475)) {
      startminigame();
    }
  }
   else if(place == 2) {
    //background(0);
    if ( (mouseX > 450 && mouseX < 550) && (mouseY >550 && mouseY <650)) {
      place = 3;
    }
  }
   else if(place == 3) {
  //  background(0);
    if ((mouseX > 1000 && mouseX < 1100) && (mouseY > 500 && mouseY < 600)) {
      place = 1;
    }
    if ((mouseX > 1400 && mouseX < 1500) && (mouseY < 600 && mouseY > 500)) {
      place = 4;
    }
    if ((mouseX > 660 && mouseX < 760) && (mouseY > 250 && mouseY <350)) {
      place = 2;
    }
  }
    else if(place == 4) {
  //  background(0);
    if ( (mouseX > 450 && mouseX < 550) && (mouseY >550  && mouseY < 650)) {
      place = 3;
    }
    if ((mouseX > 450 && mouseX < 550) && (mouseY > 0 && mouseY < 100)) {
      place = 1;
    }
  }
  
  }
}
void physsetup(){
balls = new ArrayList<ball>();
int jugglex=800;
score=0;
//background(0);
//font = createFont("Arial Italic", fontSize, true);
//textFont(font, fontSize);
 balls.add(new ball(800,5,250));
 }
void mathsetup(){
 background(0);
 score=0;
 totalquestions=10;
 //font = createFont("Arial Italic", fontSize, true);
// textFont(font, fontSize);
 newquestion();

}

void displaystats(){
  text("Day is" + MonthDay, 10, 90);
  text("Month is", 10, 60); 
switch (Month){
  case 1:
  text("august",150,60);
  break;
  case 2:
  text("september",150,60);
  break;
  case 3:
  text("october",150,60);
  break;
  case 4:
  text("november",150,60);
  break;
  case 5:
  text("december",150,60);
  break;
}
  text("happiness:" + happiness,10,120); 
  text("grades:" + grades,10,150); 
  text("sadness: " + sadness,10,180); 
  text("Energy: " + energy, 10, 210);
  text("Loneliness: " + loneliness, 10, 240);
  text("Tiredness: " + tiredness, 10, 270); 
  text("Money: $" + money, 10, 300);
  
}
void dayoftheweek() { //shows the weekday
  /*
  if (day == Sunday) {
    fill(0);
    rect(600, 473, 180, 40);
    fill(255);
    text( "Sunday", 600, 500);
  } else if (day == Monday) {
    fill(0);
    rect(600, 473, 180, 40);
    fill(255);
    text( "Monday", 600, 500);
  } else if (day == Tuesday) {
    fill(0);
    rect(600, 473, 180, 40);
    fill(255);
    text( "Tuesday", 600, 500);
  } else if (day == Wednesday) {
    fill(0);
    rect(600, 473, 180, 40);
    fill(255);
    text( "Wednesday", 600, 500);
  } else if (day == Thursday) {
    fill(0);
    rect(600, 473, 180, 40);
    fill(255);
    text( "Thursday", 600, 500);
  } else if (day == Friday) {
    fill(0);
    rect(600, 473, 180, 40);
    fill(255);
    text( "Friday", 600, 500);
  } else if (day == Saturday) {
    fill(0);
    rect(600, 473, 180, 40);
    fill(255);
    text( "Saturday", 600, 500);
    day = 0;
  }
  */
}
void endgame(){
 returnedscore=score;
 score=0;
 game=-1;
 isminigame=false;
 onmap=true;
}
void checkmonth(){

/*if (onmap = true){
  
  
}*/
}




void calendarDate() {
  fill(255);
  if ((MonthDay == 32)&&(Month == August)) {
    Month = September;
    MonthDay = 0;
  } else if ((MonthDay == 30)&&(Month == September)) {
    Month = October;
    MonthDay = 0;
  } else if ((MonthDay == 32)&&(Month == October)) {
    Month = November;
    MonthDay = 0;
  } else if ((MonthDay == 30)&&(Month == October)) {
    Month = December;
    MonthDay = 0;
  }
}

void startminigame(){
 texttodraw="press p for physichs and m for math"; 
 onmap=false;
 isminigame=true;
 game=-1;
}

void drawtext(){
   fill(0, 0, 204);
  rect(448, 648, 1152, 252);
  fill(0);
  textSize(32);
  text(texttodraw, 500, 700);
  
}

void newquestion(){
  totalquestions-=1;
  if (totalquestions==0){
    endgame();
    return;
  }
savedtime = millis();
//text(score,400,100);
//background(0);
 firstnum = (int)random(10);
 secondnum = (int)random(10);
operator = (int)random(3);
position = (int)random(3);
switch(operator){
  case 0:
  answer = firstnum+secondnum;
  break;
  case 1:
  answer = firstnum-secondnum;
  break;
  case 2:
  answer = firstnum*secondnum;
  break;

  
}
 
  wrongone = answer+(int)random(5,1);//*(1-(((int)(random(0,2)))*2));

  wrongtwo = answer-(int)random(5,1);//*(1-((int)(random(2))*2));
 // if( wrongtwo == wrongone) wrongtwo+=(int)random(5,1);
}
