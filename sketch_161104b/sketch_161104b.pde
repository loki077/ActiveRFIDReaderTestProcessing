import processing.serial.*;

Serial myPort;  

void setup() 
{

	printArray(Serial.list());
	myPort = new Serial(this, Serial.list()[0], 19200);
}

void draw() 
{
	while (myPort.available() > 0) 
	{
		String inBuffer = myPort.readString();   
		if (inBuffer != null) 
		{
			println(inBuffer);
		}
	}
}