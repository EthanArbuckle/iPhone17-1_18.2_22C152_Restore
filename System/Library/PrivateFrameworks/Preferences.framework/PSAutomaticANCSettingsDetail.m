@interface PSAutomaticANCSettingsDetail
+ (BOOL)isEnabled;
+ (id)iconImage;
+ (id)preferencesURL;
+ (void)setEnabled:(BOOL)a3;
@end

@implementation PSAutomaticANCSettingsDetail

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
  v3 = PSConnected698();
  if (v3)
  {
    id v4 = v3;
    PSBTSetAccessoryListeningMode(v3);
    v3 = v4;
  }
}

+ (BOOL)isEnabled
{
  v2 = PSConnected698();
  v3 = v2;
  if (v2) {
    BOOL v4 = PSBTAccessoryListeningMode(v2) == 4;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

@end