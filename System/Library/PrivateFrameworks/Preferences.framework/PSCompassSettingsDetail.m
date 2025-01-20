@interface PSCompassSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSCompassSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=COMPASS"];
}

@end