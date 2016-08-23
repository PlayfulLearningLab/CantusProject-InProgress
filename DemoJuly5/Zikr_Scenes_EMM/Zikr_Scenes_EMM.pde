/*
  06/29/2016
 Emily Meuer
 
 Zikr Scenes: Compilation of rosettes and Game of Life, in one sketch,
 to be cycled through on (mousePressed/keyPressed).
 
 Calibration options:
 [ Tab                       : variableName        (controls what) ]
 Zikr_Scenes_EMM           :  drawTenorCutoff    (controls which voices control which functionality)
 colorsTenorCutoff
 rotateTenorCutoff       
 SceneClass                :  highPitch          (controls amt by which pitch affects color)
 SceneDrawRosette          :  freqThresholds     (controls at what frequencies new rosette lines will be drawn)
 SceneRosetteV3ColorChange :  growFrequencies    (controls at what frequencies bigger rosettes will be shown)
 */

// Calibrate:
// (tenorCutoff: mic numbers below this will be "low voices", and all mics numbered this and higher will be "high voices.")
int  drawTenorCutoff    = 3;    // mics below this number will control the drawing;
// if lines don't draw that should, make sure that this is low enough,
// i.e., that the only mics numbered below this are for the voices that sing in the first low part.

int  colorsTenorCutoff  = 3;    // mics below this will control red (high pitch = more red, low pitch = less)
// and mics this number and above will control blue in the same way.

int  rotateTenorCutoff  = 3;    // mics numbered below this control rosette growth, mics numbered this and above control rotation
// (higher pitch = bigger rosettes/faster rotation, respectively)

Scene  drawRosette;
Scene  rosetteV3Colors;
Scene  rosetteV3Rotate;
Scene  gameOfLife;

Input  inputs;

int  scene;
int  waitUntil;

void setup()
{
  fullScreen();
  background(0);

  inputs     = new Input(4);

  drawRosette      = new DrawRosette(inputs, 3);
  rosetteV3Colors  = new RosetteV3Colors(inputs, 3);
  rosetteV3Rotate  = new RosetteV3Rotate(inputs, 3);
  gameOfLife       = new GameOfLife(inputs, 3, "ring");

  scene = 1;
  waitUntil  = millis();
} // setup()

void draw()
{

  if (mousePressed && millis() > waitUntil)  
  {  
    waitUntil  = millis() + 300;
    scene++;
  }

  if (scene == 1) {
    drawRosette.run();
  } // scene 1

  if (scene == 2) {
    rosetteV3Colors.run();
  } // scene 2

  if (scene == 3) {
    rosetteV3Rotate.run();
  } // scene 3
  
  if (scene >= 4)  {
    
    gameOfLife.run();
  } // scene 4
} //draw()