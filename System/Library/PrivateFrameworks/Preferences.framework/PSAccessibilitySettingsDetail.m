@interface PSAccessibilitySettingsDetail
+ (id)iconImage;
+ (id)preferencesURL;
@end

@implementation PSAccessibilitySettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ACCESSIBILITY"];
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E4F42A80], "ps_synchronousIconWithTypeIdentifier:", @"com.apple.graphic-icon.accessibility");
}

@end