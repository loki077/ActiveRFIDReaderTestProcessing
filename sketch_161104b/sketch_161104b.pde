import processing.serial.*;

Serial myPortTx;  
Serial myPortRx;  
String inBuffer;
boolean bufferFlag = true;
void setup() 
{
	printArray(Serial.list());
	myPortTx = new Serial(this, "COM10", 19200);
	myPortRx = new Serial(this, "COM9", 19200);
}

void draw() 
{
	while (myPortRx.available() > 0) 
	{
		inBuffer = myPortRx.readString();   
		if (inBuffer != null) 
		{
			bufferFlag = true;
			println(inBuffer);
		}
	}
	if(bufferFlag == false)
	{
		myPortTx.write(inBuffer);
		bufferFlag = true;
	}
}