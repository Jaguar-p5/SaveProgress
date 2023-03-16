
Player bob;
ArrayList <Entity> ents;
public void setup() {
size(400, 400)
  background(0);
  ellipse(100,100,100,100);
  textSize(48);
  textAlign(CENTER,CENTER);
  String[] lines  = loadStrings("progress.txt");
  
  bob = new Player(lines[0], lines[0], 50);
  ents = new ArrayList <Entity>();
  ents.add(bob);
  String[] newLines = {"" + ((int(lines[0])+50))%400};
  saveStrings("progress.txt", newLines);
}
void draw(){
 background(111);
 for(int i = 0; i < ents.size(); i++){
 ents.get(i).doStuff(); 
 }
}

class Player extends Entity{
 float mySpeed;
 public Player(float x, float y, float radius){
  super(x, y, radius); 
  mySpeed = 2;
 }
 void doStuff(){
  readMovement();  checkWarp(); show(); readSave();
 }
 void readSave(){
   
 }
 void readMovement(){
   float myXchange = 0;
   float myYchange = 0;
   if(getPressed(87)) myYchange -= mySpeed;
   if(getPressed(83)) myYchange += mySpeed;
   if(getPressed(65)) myXchange -= mySpeed;
   if(getPressed(68)) myXchange += mySpeed;
   if(myXchange != 0 && myYchange != 0){
    myX += myXchange*0.707;
    myY += myYchange*0.707;
   }
   else{
    myX += myXchange; myY += myYchange; 
   }
 }
  
}
class Entity{
 float myX, myY, myRadius;
 public Entity(float x, float y, float radius){
   myX = x; myY = y; myRadius = radius;
 }
 void doStuff(){
   show();
 }
 void checkWarp(){
  if(myX < 0) myX = width;
  if(myY < 0) myY = height;
  if(myY > height) myY = 0;
  if(myX > width) myX = 0;
 }
 void show(){
  fill(255); stroke(0); strokeWeight(1); ellipse(myX, myY, myRadius*2, myRadius*2); 
 }
  
}



boolean[] keys = new boolean[600];
void keyPressed(){ keys[keyCode] = true;}
void keyReleased(){keys[keyCode] = false;}
boolean getPressed(int code){
  return keys[code];
}
