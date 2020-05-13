PImage image;
void setup()
{
  image = loadImage("C:\\Users\\Dell\\Desktop\\Gor\\images_Videos\\Gor Grigoryan\\Kelly-Webmasters-and-Marketers-512x512-Logo.png");
  size(1024,500);
  
  image.filter(GRAY);
  image(image,0,0);
  
  //image(image,515,0);
}
int index(int x, int y)
{
    return x + y * image.height;
}
void draw()
{
  image.loadPixels();
  for(int y = 0; y < image.height - 1; y++)
  {
    for(int x = 1; x < image.width - 1; x++)
    {
      color pix = image.pixels[index(x,y)];
      
      
      float r = red(pix);
      float g = green(pix);
      float b = blue(pix);
      
      int factor = 1;
      
      int newR = round(factor * r / 255) * (255 / factor);
      int newG = round(factor * g / 255) * (255 / factor);
      int newB = round(factor * b / 255) * (255 / factor);
      
      float errR = r - newR;
      float errG = g - newR;
      float errB = b - newR;
      
      int index = index(x + 1,y    );
      
      color c  = image.pixels[index];
      float rC  = red(c);
      float gC  = green(c);
      float bC  = blue(c);
      
      rC = rC + errR * 7/16.0;
      gC = gC + errG * 7/16.0;
      bC = bC + errB * 7/16.0;
      
      image.pixels[index] = color(rC,gC,bC);
      
      
      index = index(x - 1,y + 1);
      c  = image.pixels[index];
      rC  = red(c);
      gC  = green(c);
      bC  = blue(c);
      
      rC = rC + errR * 3/16.0;
      gC = gC + errG * 3/16.0;
      bC = bC + errB * 3/16.0;
      
      image.pixels[index] = color(rC,gC,bC);
        
        
        
      index = index(x    ,y + 1);
      c  = image.pixels[index];
      rC  = red(c);
      gC  = green(c);
      bC  = blue(c);
      
      rC = rC + errR * 5/16.0;
      gC = gC + errG * 5/16.0;
      bC = bC + errB * 5/16.0;
      
      image.pixels[index] = color(rC,gC,bC);
        
        
      index = index(x + 1,y + 1);
      c  = image.pixels[index];
      rC  = red(c);
      gC  = green(c);
      bC  = blue(c);
      
      rC = rC + errR * 1/16.0;
      gC = gC + errG * 1/16.0;
      bC = bC + errB * 1/16.0;
      
      image.pixels[index] = color(rC,gC,bC);
        
       
      
      
      
      //image.pixels[index(x + 1,y    )] 
      //image.pixels[index(x - 1,y + 1)]
      //image.pixels[index(x    ,y + 1)]
      //image.pixels[index(x + 1,y + 1)]
      
      
      
      image.pixels[index(x,y)] = color(newR,newG,newB);
      
    }
  }
  image.updatePixels();
  image(image,512,0);
}
