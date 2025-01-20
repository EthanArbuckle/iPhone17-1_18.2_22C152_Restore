@interface PSPrivacySettingsDetail
+ (id)preferencesURL;
@end

@implementation PSPrivacySettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=Privacy"];
}

@end