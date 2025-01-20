@interface STUICoreDevice
+ (BOOL)isMac;
+ (BOOL)isiPad;
+ (BOOL)isiPhone;
+ (BOOL)isiPodTouch;
+ (NSString)localizedModel;
@end

@implementation STUICoreDevice

+ (BOOL)isiPad
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  v3 = [v2 model];
  char v4 = [v3 hasPrefix:@"iPad"];

  return v4;
}

+ (BOOL)isiPhone
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  v3 = [v2 model];
  char v4 = [v3 hasPrefix:@"iPhone"];

  return v4;
}

+ (BOOL)isiPodTouch
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  v3 = [v2 model];
  char v4 = [v3 hasPrefix:@"iPod touch"];

  return v4;
}

+ (BOOL)isMac
{
  return 0;
}

+ (NSString)localizedModel
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  v3 = [v2 localizedModel];

  return (NSString *)v3;
}

@end