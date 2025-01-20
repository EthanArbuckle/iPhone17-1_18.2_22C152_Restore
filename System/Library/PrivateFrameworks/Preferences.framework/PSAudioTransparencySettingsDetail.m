@interface PSAudioTransparencySettingsDetail
+ (BOOL)isEnabled;
+ (id)iconImage;
+ (id)preferencesURL;
+ (void)setEnabled:(BOOL)a3;
@end

@implementation PSAudioTransparencySettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Bluetooth"];
}

+ (id)iconImage
{
  return 0;
}

+ (void)setEnabled:(BOOL)a3
{
  v3 = PSConnected298();
  if (v3)
  {
    id v4 = v3;
    PSBTSetAccessoryListeningMode(v3);
    v3 = v4;
  }
}

+ (BOOL)isEnabled
{
  v2 = PSConnected298();
  v3 = v2;
  if (v2) {
    BOOL v4 = PSBTAccessoryListeningMode(v2) == 3;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

@end