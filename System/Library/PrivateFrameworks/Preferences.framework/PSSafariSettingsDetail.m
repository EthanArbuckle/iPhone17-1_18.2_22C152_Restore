@interface PSSafariSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSSafariSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=SAFARI"];
}

@end