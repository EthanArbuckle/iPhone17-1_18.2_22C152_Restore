@interface PSRemindersSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSRemindersSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=REMINDERS"];
}

@end