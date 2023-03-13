public void setup() {
size(400, 400)
  background(0);
  ellipse(100,100,100,100);
  textSize(48);
  textAlign(CENTER,CENTER);
  String[] lines  = loadStrings("progress.txt");
  text(lines[0],50,50);
  String[] newLines = {"" + (int(lines[0])+1)};
  saveStrings("progress.txt", newLines);
}
