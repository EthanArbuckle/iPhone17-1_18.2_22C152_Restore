@interface PSKeyboardSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSKeyboardSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=Keyboard"];
}

@end