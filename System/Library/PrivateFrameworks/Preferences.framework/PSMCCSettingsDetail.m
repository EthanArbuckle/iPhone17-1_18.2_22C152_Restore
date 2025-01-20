@interface PSMCCSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSMCCSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=ACCOUNT_SETTINGS"];
}

@end