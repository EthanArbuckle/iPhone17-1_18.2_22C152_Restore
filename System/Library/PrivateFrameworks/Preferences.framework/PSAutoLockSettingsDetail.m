@interface PSAutoLockSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSAutoLockSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=DISPLAY&path=AUTOLOCK"];
}

@end