@interface PSPasscodeSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSPasscodeSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=PASSCODE"];
}

@end