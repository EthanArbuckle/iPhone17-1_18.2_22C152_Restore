@interface PPMClientUserClientInterface
- (BOOL)attribute;
- (int)admissionCheckOfValuePPM:(unsigned int)a3 clientNumber:(unsigned int)a4 level:(int)a5 result:(unsigned int *)a6;
- (int)openPPMUserClient:(unsigned int)a3 clientNumber:(int)a4;
- (int)pushTelemetry:(unsigned int)a3 userDictRef:(UserClientTelemetryDict *)a4;
- (int)setBudget:(unsigned int)a3 clientNumber:(unsigned int)a4 value:(unsigned int)a5;
- (int)setDebugFlag:(unsigned int)a3 value:(unsigned int)a4;
- (int)startActivity:(unsigned int)a3 clientNumber:(unsigned int)a4 level:(int)a5;
- (int)stopActivity:(unsigned int)a3 clientNumber:(unsigned int)a4 level:(int)a5;
- (unsigned)connect;
@end

@implementation PPMClientUserClientInterface

- (int)pushTelemetry:(unsigned int)a3 userDictRef:(UserClientTelemetryDict *)a4
{
  return IOConnectCallStructMethod(a3, 0x17u, a4, 0xA58uLL, 0, 0);
}

- (int)openPPMUserClient:(unsigned int)a3 clientNumber:(int)a4
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = a4;
  return IOConnectCallScalarMethod(a3, 0xAu, v5, 1u, 0, 0);
}

- (int)admissionCheckOfValuePPM:(unsigned int)a3 clientNumber:(unsigned int)a4 level:(int)a5 result:(unsigned int *)a6
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a4;
  input[1] = a5;
  uint64_t output = 0;
  uint32_t outputCnt = 1;
  int result = IOConnectCallScalarMethod(a3, 0xCu, input, 2u, &output, &outputCnt);
  *a6 = output;
  return result;
}

- (int)stopActivity:(unsigned int)a3 clientNumber:(unsigned int)a4 level:(int)a5
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a4;
  input[1] = a5;
  return IOConnectCallScalarMethod(a3, 0xDu, input, 2u, 0, 0);
}

- (int)startActivity:(unsigned int)a3 clientNumber:(unsigned int)a4 level:(int)a5
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a4;
  input[1] = a5;
  return IOConnectCallScalarMethod(a3, 0xEu, input, 2u, 0, 0);
}

- (int)setBudget:(unsigned int)a3 clientNumber:(unsigned int)a4 value:(unsigned int)a5
{
  input[2] = *MEMORY[0x263EF8340];
  input[0] = a4;
  input[1] = a5;
  return IOConnectCallScalarMethod(a3, 0xFu, input, 2u, 0, 0);
}

- (int)setDebugFlag:(unsigned int)a3 value:(unsigned int)a4
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = a4;
  return IOConnectCallScalarMethod(a3, 0x11u, v5, 1u, 0, 0);
}

- (BOOL)attribute
{
  return self->_attribute;
}

- (unsigned)connect
{
  return self->_connect;
}

@end