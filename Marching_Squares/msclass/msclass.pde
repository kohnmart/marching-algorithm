MarchingSquares ms;
void setup()
{
  size(1000,1000);
  background(255/2);
  ms = new MarchingSquares(100, 100, 40);
  ms.generateGrid();
  //enable for static
  //ms.staticGrid();
}

void draw()
{  
  //disable for static
   background(255/2);
   //ms.animation(1);
  ms.brush(brush, 30);
}


boolean brush = false;
void mousePressed() {
 
  if (brush == false) {
    brush = true;
  } else {
     brush = false;
  }
}
