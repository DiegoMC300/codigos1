//esta clase Pato va a ser la que repitamos 3 veces va a tener el objeto de un Pato y va a moverse randomicamente entre la pantalla.
class Pato {
  //cargamos una imagen para el objeto
  PImage image;
  //creamos un float para la posicion en X
  float posX;
  //y otro para la posicion en Y
  float posY;
  //creamos una variable tipo entero para el desplazamiento en X que va a tener el pato en la pantalla
  float desp;
  //otro float para el desplazamiento en el eje Y que va a tener el pato en la pantalla
  float despY;
  //Este float tamano nos va a ayudar a variar el tamano randomicamente de los patos, por eso salen algunos mas grandes y otros mas pequeños que otros.
  float tamano;

  //constructor
  Pato() {
    //La posicion de los patos se inicia, empezando del lado izquierdo de la pantalla por lo cual se inicia con posX en 0 y la posicion en Y es randomica entre 50 y la altura de la pantalla de juego - 100.
    posX = 0;
    posY = random (50, height -100);
    //el desplazamiento va a ser un numero random entre 5 y 10
    desp = random ( 5, 10);
    // el desplazamiento en Y va a ser un numero random entre -8 y 8 x lo cual algunos patos van para arriba y otros para abajo y asi randomicamente
    despY = random ( -8, 8);
    //el tamano varia entre 50 y 100 de cada pato.
    tamano = random (50, 150);
  }
  
//Estos getPos es para que el programa devuelva la posicion en X, estas nos van a ayudan con la funcion de detectarImpacto para que regrese la posicion en X del objeto  
  float getPosX() {
    return posX;
  }
//Estos getPos es para que el programa devuelva la posicion en Y, estas nos van a ayudan con la funcion de detectarImpacto para que regrese la posicion en Y del objeto
  float  getPosY() {
    return posY;
  }
  
  //esta funcion mueve a los patos en ejes de X y Y respectivamente.
  void mover() {
    //se suma a posX y a posY su respectiva variable float la cual en el caso de Y iba a ser randomica.
    posX = posX +desp;
    posY = posY +despY;
  }
//esta funcion nos ayuda a detener los patos, devolviendoles a la posicion en X 0.
  void detener() {
    
    posY = random (0, height);
    posX = 0;
  } 
  //esta funcion es solo para que salga la imagen del pato en la pantalla con su respectiva posicion en X y Y y su tamano el cual iba a variar.
  void display() {
    imageMode(CENTER);
    image = loadImage("roca.png");
    image(image, posX, posY, tamano, tamano);
  }
  
  //Esta funcion booleana es para saber si el pato sobrepaso el limite de la pantalla, estaMuerta es solo un nombre para la funcion, esta identifica si la posX del pato es mayor a la pantalla
  //si este es el caso regresa un true, caso contrario es siempre un false.
  boolean estaMuerta() {
    if (posX> width) {

      return true;
    }
    return false;
  }
}

