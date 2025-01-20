@interface PSMessagesSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSMessagesSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=MESSAGES"];
}

@end