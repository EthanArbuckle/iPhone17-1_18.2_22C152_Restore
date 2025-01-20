@interface AVExternalDevice(WiFiKit)
+ (BOOL)isCarPlaySessionActive;
@end

@implementation AVExternalDevice(WiFiKit)

+ (BOOL)isCarPlaySessionActive
{
  v0 = [MEMORY[0x263EFA6F8] currentCarPlayExternalDevice];
  v1 = v0;
  BOOL v2 = v0 && [v0 transportType] == 3;

  return v2;
}

@end