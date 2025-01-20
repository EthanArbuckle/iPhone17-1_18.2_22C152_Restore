@interface PSAirplaneModeSettingsDetail
+ (BOOL)isEnabled;
+ (id)iconImage;
+ (id)preferencesURL;
+ (void)setEnabled:(BOOL)a3;
@end

@implementation PSAirplaneModeSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ROOT#AIRPLANE_MODE"];
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E4F42A80], "ps_synchronousIconWithTypeIdentifier:", @"com.apple.graphic-icon.airplane-mode");
}

+ (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F4BE78]);
  [v4 setAirplaneMode:v3];
}

+ (BOOL)isEnabled
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F4BE78]);
  char v3 = [v2 airplaneMode];

  return v3;
}

@end