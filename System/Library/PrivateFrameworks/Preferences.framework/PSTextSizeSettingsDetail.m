@interface PSTextSizeSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSTextSizeSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=DISPLAY&path=TEXT_SIZE"];
}

@end