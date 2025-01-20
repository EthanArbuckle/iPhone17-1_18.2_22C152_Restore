@interface UIDevice(WiFiKitUI)
+ (BOOL)currentIsIPad;
@end

@implementation UIDevice(WiFiKitUI)

+ (BOOL)currentIsIPad
{
  v0 = [MEMORY[0x263F82670] currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 1;

  return v1;
}

@end