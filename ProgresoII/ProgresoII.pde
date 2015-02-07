// Este es un programa orientado a programacion por objetos, el objetivo de este programa es hacer un juego que controla un mira con el mouse y disparar a patos que salen en posicion randomica
//a traves de la pantalla
//Todo lo minim es para importar la librearia de processing que contiene la informacion necesaria para acceder y poder cargar sonidos.
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

//Aqui se pone el Audioplayer que como nombre tiene disparo.
Minim minim;
AudioPlayer disparo ;

//El objeto Mira es la mira que sale en la pantalla
Mira mira1;
//El objeto Pato vienen a ser los 3 patos que salen randomicamente
Pato pato, pato2, pato3;
//Se importa una Pimage que va a tener como nombre fondo y se la cargara en el setup

PImage fondo;
//se crea una variable entero (int) llamada hit que sera como la vida que tiene el juego, si los patos no son disparados y se pierden 15 veces el juego acabara
int hit = 5;
//se crea una variable entero para llevar el puntaje del juego, cada pato disparado es un punto
int puntos = 0;

void setup() {
  //en el textSize se pone el tamaño de texto que se quiere que salga
  textSize(30);
 // en el Size va el tamaño de la pantalla del juego
  size(1024, 700);
  //Aqui se carga la imagen de fondo, el cual es un jpg con un fondo de un pantano.
  fondo = loadImage("background.JPG");



  //Aqui decimos al objeto que creamos anteriormente como un objeto dependiente de la clase Mira, quiere decir que mira1 es un Mira
  mira1= new Mira();
  //Igualmente con cada Pato se crea 3 en total, cada pato es un objeto de la clase Pato.
  pato = new Pato();
  pato2 = new Pato();
  pato3 = new Pato();
  
  
}

void draw() {
  //Aqui seleccionamos la imagen de fondo que va a salir, el nombre del elemento ya creado el cual llamamos fondo antes, y las medidas que va a tener que son del mismo que la pantalla del juego.
  image(fondo, width/2, height/2, width, height);
    //Aqui ponemos el texto que va a salir para comenzar.
  text ("PRESIONA ENTER Y DA CLICK PARA EMPEZAR", 50, 100);
  //Aqui va la funcion para que la mira salga en la pantalla, el cual esta en el objeto Mira que esta en la Clase Mira en la pestaña siguiente.
  mira1.display();
  //Aqui se pone las funciones de empezar la cual va a hacer alguna secuencia de funciones como detectar si hay impacto mover las piedras y hacer que aparescan en la pantalla
  // se lo carga en el draw porque se requiere que este codigo vaya ejecutandose continuamente.
  empezar();
  mira1.moverderecha();
  mira1.moverizquierda();

//Estas son condiciones para que cuando el pato sobrepase la pantalla se vuelva a generar como un objeto nuevo y se piedra un punto de vida (hit).
  if ( pato.estaMuerta()) {

    pato = new Pato();
    hit = hit-1;
  }
  if ( pato2.estaMuerta()) {

    pato2 = new Pato();
    hit = hit-1;
  }

  if ( pato3.estaMuerta()) {

    pato3 = new Pato();
    hit = hit-1;
  }
  
}

// Esta funcion de empezar se la cargo anteriormente , se la inicia con la tecla ENTER y tiene como funciones detectar los impactos de la mira y los patos, mover a los patos y mostrarlos
// continuamente esta programado para que salga el texto de los puntaje y tambien se le cargo una funcion llamada GameOver() la cual es para que finalize el juego.
void empezar() {
  if (keyCode == ENTER) {

    detectarImpacto();
    detectarImpacto2();
    detectarImpacto3();
    pato.mover();
    pato.display();
    pato2.mover();
    pato2.display();
    pato3.mover();
    pato3.display();
    text ("PUNTOS: " + puntos, 720, 50);
    GameOver ();
  }
}


// estas funciones de detectar impacto contienen un if el cual con la funcion getPosX y getPosY que estan en la clase de cada uno de los objetos, obtienen la posicion de los objetos
// y las comparan una con la otra para ver si colisionan, 
void detectarImpacto() {


  if (mira1.getPosX() < pato.getPosX()+100 
    && mira1.getPosX() > pato.getPosX()-100 
    && mira1.getPosY() < pato.getPosY()+50
    && mira1.getPosY() > pato.getPosY()-50) {
      //esto pasa si el if se cumple ( osea cuando colisionan)
      //el puntaje incremente
    puntos = puntos +1;
    //el pato se detiene y vuelve al punto de inicio
    pato.detener();
    //suena un disparo
    disparo = minim.loadFile("disparo.mp3");
    disparo.play();
  }
}
//Lo de arriba es con cada una de estas funciones son basicamente lo mismo pero con cada uno de los Patos 

void detectarImpacto2() {


  if (mira1.getPosX() < pato2.getPosX()+100 
    && mira1.getPosX() > pato2.getPosX()-100 
    && mira1.getPosY() < pato2.getPosY()+50
    && mira1.getPosY() > pato2.getPosY()-50) {
    disparo = minim.loadFile("disparo.mp3");
    disparo.play();
    pato2.detener();
    puntos = puntos +1;
  }
}

//esta funcion tambien hace lo mismo
void detectarImpacto3() {


  if (mira1.getPosX() < pato3.getPosX()+100 
    && mira1.getPosX() > pato3.getPosX()-100 
    && mira1.getPosY() < pato3.getPosY()+50
    && mira1.getPosY() > pato3.getPosY()-50) {
    disparo = minim.loadFile("disparo.mp3");
    disparo.play();
    pato3.detener();
    puntos = puntos +1;
  }
}
//Esta funcion Game Over dice que si hit( osea la variable entero que creamos al inicio y que contiene los puntos de vida es = a 0, el juego termina
void GameOver () {

  if (hit <= 0) {
    //Si hit = a 0 pasa esto
    //la pantalla se hace roja
    fill (255, 0, 0);
    //el puntaje de hit se mantiene en 0 
    hit = 0;
    // se detienen a los patos
    pato.detener();
    pato2.detener();
    pato3.detener();
    //Sale el texto Game Over 
    text ("GAME OVER ", width/2, height/2);
    //Sale el texto Tu puntaje es y la cantiadad de puntos q tengas
    text ("TU PUNTAJE ES " + puntos, width/2, 400/2);
  }
}


//Esta funcion de mouse clicked hace que suene un sonido de disparo, cada vez que se da click suena el disparo
void mouseClicked() {
  minim = new Minim(this);
  disparo = minim.loadFile("disparo.mp3");
  disparo.play();
}


