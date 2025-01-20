@interface PSSiriSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSSiriSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=SIRI"];
}

@end