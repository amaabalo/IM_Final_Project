long timeTurnedOn;
long timeTurnedOff;
long timeToTurnOn;
long timeToTurnOff;
long currentTime;
int vibratingDuration;
int flexPosition0;
int flexPosition1;
boolean vibrating = false;   
boolean state;
int duration;
const int flexpin0 = 0; 
const int flexpin1 = 1; 
int i;
// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin 13 as an output.
  Serial.begin(9600);
  for(i=8; i<14; i++)
    pinMode(i, OUTPUT);
  duration = 1000;
  state = false;
}

// the loop function runs over and over again forever
void loop() {
  flexPosition0 = analogRead(flexpin0);
  flexPosition1 = analogRead(flexpin1);
  //Serial.println(flexPosition1);
  currentTime = millis();
  //Serial.println(flexPosition1);
  if ((flexPosition0 > 865 || flexPosition1 > 600) && !vibrating)
  {
    vibrating = true;
    for(i=7; i<14; i++)
      digitalWrite(i, HIGH);   // turn the vibrators on
   
    Serial.write(1);
    Serial.write('/');
    
    //timeTurnedOn = millis();
    //state = true;
  }
  else if ((flexPosition0 < 865 && flexPosition1 < 735) && vibrating)
  {
    vibrating = false;
    for(i=7; i<14; i++)
      digitalWrite(i, LOW);   // turn the vibrators off
    //state = true;
  }

//0;770; 1;729

  // Because every flex sensor has a slightly different resistance,
  // the 600-900 range may not exactly cover the flex sensor's
  // output. To help tune our program, we'll use the serial port to
  // print out our values to the serial monitor window:
  
  //Serial.print("sensor: ");
  //Serial.print(flexPosition0);
  //Serial.print("\n");
  /*
  for(i=7; i<14; i++)
    digitalWrite(i, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(1000);              // wait for a second
  for(i=7 ; i<14; i++)
    digitalWrite(i, LOW);    // turn the LED off by making the voltage LOW
  delay(1000);              // wait for a second
  */
}
