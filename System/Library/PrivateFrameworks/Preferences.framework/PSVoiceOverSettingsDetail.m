@interface PSVoiceOverSettingsDetail
+ (BOOL)isEnabled;
+ (id)iconImage;
+ (id)preferencesURL;
+ (void)setEnabled:(BOOL)a3;
@end

@implementation PSVoiceOverSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ACCESSIBILITY&path=VOICEOVER_TITLE"];
}

+ (id)iconImage
{
  return (id)objc_msgSend(MEMORY[0x1E4F42A80], "ps_synchronousIconWithTypeIdentifier:", @"com.apple.graphic-icon.accessibility");
}

+ (void)setEnabled:(BOOL)a3
{
}

+ (BOOL)isEnabled
{
  return _AXSVoiceOverTouchEnabled() != 0;
}

@end