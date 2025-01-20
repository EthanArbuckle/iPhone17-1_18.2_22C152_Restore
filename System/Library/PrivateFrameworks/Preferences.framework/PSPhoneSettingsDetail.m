@interface PSPhoneSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSPhoneSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=PHONE"];
}

@end