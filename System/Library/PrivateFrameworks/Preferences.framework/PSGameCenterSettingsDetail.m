@interface PSGameCenterSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSGameCenterSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=GAMECENTER"];
}

@end