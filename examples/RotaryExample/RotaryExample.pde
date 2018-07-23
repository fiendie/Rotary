#include <Rotary.h>

Rotary r1 = Rotary(4, 7);
Rotary r2 = Rotary(9, 10);

volatile int encoder0Val = 0;
volatile int encoder1Val = 0;
int currentEncoder0Val = 0;
int currentEncoder1Val = 0;


void setup() {   
	// Disable the other timer
	TCCR1A	= 0;
	
	// Configure timer for 500Hz
	TCCR1B  = (1 << WGM12) | (1<<CS10); 
	OCR1A   = 0x7D0;
	TIMSK1  = (1 << OCIE1A);
	
	Serial.begin(9600);
} 


void loop() {
	if(currentEncoder0Val != encoder0Val) {
		currentEncoder0Val = encoder0Val;  
		Serial.println(encoder0Val);
	}
  
	if(currentEncoder1Val != encoder1Val) {
		currentEncoder1Val = encoder1Val;  
		Serial.println(encoder1Val);
	}
}


ISR(TIMER1_COMPA_vect) {
	char result1 = r1.process();
	char result2 = r2.process();

	if (result1) {
		if(result1 == DIR_CW) {
			encoder0Val++;
		}
		else {
			encoder0Val--;
		}
	}
  
	if (result2) {
		if(result2 == DIR_CW) {
			encoder1Val++;
		}
		else {
			encoder1Val--;
		}
	}
}
