//PID and Speeed Values
import java.lang.Math;
double kP = 0.1;
double kI = 0.0001;
double kD = 0.010;

double xPos = 0;
double yPos = 0;

double xSpeed = 0;
double xSpeed_prev = 0;

double ySpeed = 0;
double ySpeed_prev = 0;

double integralY = 0;
double derivativeY = 0;

double integralX = 0;
double derivativeX = 0;

double errorY = 0;
double error_prevY = 0;

double errorX = 0;
double error_prevX = 0;

double framerate = 60;
double frame = 0;
Rover Rover1;

int millis; 
//double y = 0 ;
//double x = 9;
void setup(){
  Rover1 = new Rover();
  
  size(1920,1080);
  frameRate((float)framerate);
  background(#FFAACC);


}
void draw(){
//y = 500 * Math.sin(xPos / 50) + 540;
double xTarget = mouseX;
double yTarget = mouseY;
/*
double xTarget = x;
double yTarget = y;
*/
background(#E18700);
line (0,mouseY,width,mouseY);
line (mouseX,0,mouseX,height);
stroke (#ffffff);
Rover();

//PID bit
double dt = 1/(framerate);

//Y axis
errorY = yTarget - yPos-squareLength/2;
integralY += (errorY * dt);
derivativeY = (errorY - error_prevY)/(dt);

ySpeed += (errorY * kP) + (integralY * kI) + (derivativeY * kD);

//X axis
errorX = xTarget - xPos-squareLength/2;
integralX += (errorX * dt);
derivativeX = (errorX - error_prevX)/(dt);

xSpeed += (errorX * kP) + (integralX * kI) + (derivativeX * kD);

xPos = xPos + xSpeed;
yPos = yPos + ySpeed;
error_prevY = errorY;
error_prevX = errorX;
xSpeed_prev = xSpeed;
ySpeed_prev = ySpeed;
}
