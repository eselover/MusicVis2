import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Point[] points;

Minim minim;
AudioPlayer song;
BeatDetect beat;

int R = 255;
int G = 255;
int B = 255;
int scale = 0;

void setup()
{
  
  size(800, 500);
  
  minim = new Minim(this);
  song = minim.loadFile("FutureBeats.mp3", 1024);
  song.loop();
  
  beat = new BeatDetect();
  
  int unit = 40;
  
  // Sets spacing of grid
  int wideCount = width / unit;
  int highCount = height / unit;
  int count = wideCount * highCount;
  points = new Point[count];
  
  // Creates the grid of points
  int index = 0;
  for(int y = 0; y < highCount; y++)
  {
    for(int x = 0; x < wideCount; x++)
    {
      points[index++] = new Point(x*unit, y*unit, unit/2, unit/2, unit);
    }
  }
}
void draw()
{
  // Fades the background
  noStroke();
  fill(0,0,0,30);
  rect(0,0,width,height);
  
  // Sets the beat detect mode to the Frequency Energy of the song
  beat.detectMode(BeatDetect.FREQ_ENERGY);
  beat.detect(song.mix);
  
  // Resets the RGB values to black and can be passed to another function if needed
  R = 0;
  G = 0;
  B = 0;
  
  // Detects if there is a beat that has the same frequency as a bass drum
  //Gets a random number and uses that random number for the index in Points[]
  // Sets the points color to Blue and increases its size
  if(beat.isKick())
  {
    int rand = (int)random(0, points.length);
    
    points[rand].B = 255;
    points[rand].R = 0;
    points[rand].G = 0;
   
    points[rand].scale = 15;
  }
  
  // Detects if there is a beat that has the same frequency as a snare drum
  //Gets a random number and uses that random number for the index in Points[]
  // Sets the points color to Red and increases its size  
  if(beat.isSnare())
  {
    int rand = (int)random(0, points.length);
    points[rand].R = 255;
    points[rand].G = 0;
    points[rand].B = 0;
    
    points[rand].scale = 15;
  }
  
  // Detects if there is a beat that has the same frequency as a High Hat
  //Gets a random number and uses that random number for the index in Points[]
  // Sets the points color to Green and increases its size
  if(beat.isHat())
  {
    int rand = (int)random(0, points.length);
    points[rand].R = 0;
    points[rand].G = 255;
    points[rand].B = 0;
    
    points[rand].scale = 15;
  }
  
  // Draws the Point to the screen and then resets it back to default
  for(Point p : points)
  {
    p.draw();
    p.R = R;
    p.B = B;
    p.G = G;
    p.scale = scale;
  }
}

