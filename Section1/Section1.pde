int MAX_VALUE = 100;
int MIN_VALUE = -100;
Visualizer v;

/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  int width, height;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    width = 400;
    height = 200;
    //max and min value don't have to be adjusted
    values = new float[10];
    speeds = new float[10];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }
  /**Part c) variable num visualizer constructor
  *@param float x, y
  *@param int num number of values
  */
  Visualizer(float X, float Y, int num){
    x = X;
    y = Y;
    width = 400;
    height = 200;
    MAX_VALUE=height/2;
    MIN_VALUE=-MAX_VALUE;
    values = new float[num];
    speeds = new float[num];
    for(int i = 0; i < values.length; i++){
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }
  /**Part c) constructor allowing for variable width/height on bounding box
  *@param float x, y
  *@param int num number of values
  *@param width, height  
  */
  Visualizer(float X, float Y, int num, int Width, int Height){
    x = X;
    y = Y;
    width = Width;
    height = Height;
    MAX_VALUE=height/2;
    MIN_VALUE=-MAX_VALUE;    
    values = new float[num];
    speeds = new float[num];
    for (int i = 0; i < values.length; i++){
      values[i] = random(-99, 99);
      speeds[i] = random(2);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, width, height);
    //This is a 200x400 box.
    //The width of the visualizer is 400! This rect is the border

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+(height/2), x+width, y+(height/2));

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD FIRST!!!
    //THESE ARE WRONG: They just illustrate how they could look
    float startx = x;
    float starty = y+(height/2); //y=0 line
    float wide = 1.0*width/values.length;//how wide the rectangle should be: width/values.length
    for (int i = 0; i < values.length; i++){
      if (values[i] >= 0){ //pos
        float rChange = (MAX_VALUE - values[i])*(255*1.25/MAX_VALUE);
        fill(rChange, 255, 0);
        rect(startx, starty-values[i], wide, values[i]);
      }
      else{//neg
        float gChange = (MAX_VALUE + values[i]) * (255*1.25/MAX_VALUE); //adjust green
        fill(255, gChange, 0);
        rect(startx, starty, wide, values[i]*-1);
      }
      startx+=wide;
      //rect(x+ (i*width), y+100, width, values[i]);
    }


    //Width of the visualizer is 400!

  
  }
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? keep them values between max/min value so they stay in the box.
      
      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min
      if (values[i] > MAX_VALUE) {
        values[i] = MAX_VALUE;
        speeds[i] *= -1;
      }
      if (values[i] < MIN_VALUE) {
        values[i] = MIN_VALUE;
        speeds[i] *= -1;
      }
    }
  }
}

void setup() {
  size(600, 500);
  //v = new Visualizer(20, 20);
  //v = new Visualizer(20, 20, 15);
  v = new Visualizer (30, 50, 25, 500, 400);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
