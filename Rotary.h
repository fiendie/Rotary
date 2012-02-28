/*
* Rotary encoder library for Arduino.
*/

#if ARDUINO >= 100
	#include "Arduino.h"
#else
	#include "WProgram.h"
#endif


#ifndef Rotary_h
#define Rotary_h

// Enable this to emit codes twice per step.
#define HALF_STEP

// Enable weak pullups
#define ENABLE_PULLUPS

// Values returned by process().
// No complete step yet.
#define DIR_NONE 0x0

// Clockwise step.
#define DIR_CW 0x40

// Counter-clockwise step.
#define DIR_CCW 0x80


class Rotary {
	public:
		Rotary(char, char);
    
		// Process pin(s)
		char process();
  
	private:
		char state;
		char pin1;
		char pin2;
};

#endif
