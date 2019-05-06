int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 1;
}

/*Create Sierpiski's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    //YOU WRITE THIS METHOD!
    gasketH(0, levels, v1x, v1y, v2x, v2y, v3x, v3y); //helper method
}

/**A recursive helper method that repeatedly splits a given triangle into three sections by drawing a white triangle in the middle
*@param int cur is the current level
*@param int levels is the total levels
*@param float v1x, v1y are the coordinates of the first vertex
*@param float v2x, v2y are the coordinates of the second vertex
*@param float v3x, v3y are the coordinates of the third vertex
*/
void gasketH(int cur, int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y){
  if(cur == 0){ //first triangle
    fill(255, 0, 0); //red
    triangle(v1x, v1y, v2x, v2y, v3x, v3y);
  }
  if(cur < levels){ //keep going until cur == levels
    fill(255, 255, 255); //white
    //making new vertices (half way)
    float newX1 = (v1x+v2x)/2;
    float newY1 = (v1y+v2y)/2;
    float newX2 = (v1x+v3x)/2;
    float newY2 = (v1y+v3y)/2;
    float newX3 = (v2x+v3x)/2;
    float newY3 = (v2y+v3y)/2;
    triangle((v1x+v2x)/2, (v1y+v2y)/2, (v1x+v3x)/2, (v1y+v3y)/2, (v2x+v3x)/2, (v2y+v3y)/2); //drawing the middle white triangle
    gasketH(cur + 1, levels, v1x, v1y, newX1, newY1, newX2, newY2); //first triangle
    gasketH(cur + 1, levels, v2x, v2y, newX1, newY1, newX3, newY3); //second triangle
    gasketH(cur + 1, levels, v3x, v3y, newX2, newY2, newX3, newY3); //third triangle
  }
}


void draw() { 
  background(50);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levels",20,20);

  gasket(levels,0, height-10, width, height-10, width/2, 10);

 //koch(levels,width-10, height/2,10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
 levels --; 
}
