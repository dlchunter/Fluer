ArrayList<Flue> flueListe = new ArrayList<Flue>();
ArrayList<storFlue> flueStorListe = new ArrayList<storFlue>();

void setup() {
  size(500, 500);
}

void draw() {
  for (int i=0; i<flueListe.size(); i++) {
    Flue f = flueListe.get(i);
    f.tegnFlue();
    f.flyt();
  }
  for (int i=0; i<flueStorListe.size(); i++) { //Vi tegner storFluen med dens egenskaber
    storFlue f = flueStorListe.get(i);
    f.tegnstorFlue();
    f.flyt();
    f.border();
  }
}

void keyPressed() {
  if (key == 'e' || key == 'E') {
    flueStorListe.add(new storFlue());
  }
  if (key == 'w' || key == 'W') {
    flueListe.add(new Flue());
  }
}

void mousePressed() {
  flueListe.add(new Flue(mouseX, mouseY));
}



/////////////////////////////////////////////////////////
class storFlue { // Vi laver en anden class der hedder storFlue

  float positionX2, positionY2; //Vi introducerer variablerne
  float distanceFlyttet2;
  float vinkel2 = 0; 
  float scale2;
  float posx = cos(vinkel2)*distanceFlyttet2;
  float posy = sin(vinkel2)*distanceFlyttet2;
  float rposx = posx + positionX2;
  float rposy = posy + positionY2;


  storFlue() { //Variablerne defineres
    positionX2  = random(0, height); 
    positionY2  = random(0, width);
    scale2      = 2;
    vinkel2     = random(0, 2*PI);
  }

  storFlue(float a, float b) { //Vi definerer hvor den skal tegnes
    positionX2 = a;
    positionY2 = b;
    vinkel2    = random(0, 2*PI);
  }
  void flyt() { //Vi definerer dens hastighed den flytter med
    distanceFlyttet2 = distanceFlyttet2 + 0.5;
  }
  void border() {

  posx = cos(vinkel2)*distanceFlyttet2;
  posy = sin(vinkel2)*distanceFlyttet2;
  rposx = posx + positionX2;
  rposy = posy + positionY2;
  
  println(rposx + " \t positionX2= "+positionX2 + " \t positionY2="+positionY2 + " \t posx="+ posx + " \t posy="+ posy );
  println(rposy);
  
    if (rposx > width || rposy > height || rposx < 0 || rposy < 0) {
 
      positionX2 = rposx;
      positionY2 = rposy;
      distanceFlyttet2 = 0;
      vinkel2 = vinkel2 - random(PI,2*PI);
  //    println(rposx);
  //    println(rposy);
   //   println(vinkel2);
    }
  }


  void tegnstorFlue() { //Vi definerer hvordan den skal tegnes
    pushMatrix();
    translate(positionX2, positionY2);
    rotate(vinkel2);
    translate(distanceFlyttet2, 0);
    scale(scale2);
    ellipse(0, 0, 20, 8);
    ellipse(0, 0-8, 15, 10);
    ellipse(0, 0+8, 15, 10);
    ellipse(0+6, 0, 8, 8);
    popMatrix();
  }
} 


class Flue {

  float positionX, positionY;
  float distanceFlyttet;
  float vinkel = 0; 
  float scale;

  Flue() {
    positionX  = random(0, height);
    positionY  = random(0, width);
    scale      = random(0, 20);
    vinkel     = random(0, 2*PI);
  }

  Flue(float a, float b) {
    positionX = a;
    positionY = b;
    vinkel    = random(0, 2*PI);
  }

  void flyt() {
    distanceFlyttet = distanceFlyttet + 0.5;
  }

  void tegnFlue() {
    pushMatrix();
    translate(positionX, positionY);
    rotate(vinkel);
    translate(distanceFlyttet, 0);
    ellipse(0, 0, 20, 8);
    ellipse(0, 0-8, 15, 10);
    ellipse(0, 0+8, 15, 10);
    ellipse(0+6, 0, 8, 8);
    popMatrix();
  }
}
//////////////////////////////////////////////////////
