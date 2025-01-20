@interface PSSoundsSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSSoundsSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Sounds"];
}

@end