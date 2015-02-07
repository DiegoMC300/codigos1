//Esta clase es para la Mira que va a ser controlada por el mouse y va a colisionar con los patos para obtener mas puntaje.

class Mira {
  //En esta clase esta cargado una imagen para la mira.
  PImage image;
  //Un float que va a ser la posicion en X de la mira.
  float posX;
  //otro float para obtener la posicion en Y de la mira.
  float posY;

  //Este es el constructor de la clase Mira
  Mira() {
    //la posicion en X se define
    posX = width/2;
    //la posicion en Y se define.
    posY = height-70;
    //La imagen se carga con el respectivo nombre y en formato png.
    image = loadImage("buena.png");
  }
//La funcion que sirve para mover con el mouse y delimitar la misma
  void moverderecha() {
    posX = mouseX;
    posY = mouseY;
    //este if delimita la posicion en X
    if (posX> width)
      posX= width;
  }
//La funcion que sirve para mover con el mouse y delimitar la misma
  void moverizquierda() {
    posX = mouseX;
    posY = mouseY;
    //este if delimita la posicion en Y
    if (posX< 0)
      posX= 0;
  }


//Estos getPos es para que el programa devuelva la posicion en X, estas nos van a ayudan con la funcion de detectarImpacto para que regrese la posicion en X del objeto
  float getPosX() {
    return posX;
  }
//Estos getPos es para que el programa devuelva la posicion en Y, estas nos van a ayudan con la funcion de detectarImpacto para que regrese la posicion en Y del objeto

  float  getPosY() {
    return posY;
  }
  
  //esta funcion de display es unicamente para que la imagen de la mira la cual cargamos arriba salga con sus respectivas posiciones y tamaño.
  void display() {
    imageMode(CENTER);
    image(image, posX, posY, 120, 120);
  }
}

