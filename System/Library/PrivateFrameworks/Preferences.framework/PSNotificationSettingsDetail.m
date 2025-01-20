@interface PSNotificationSettingsDetail
+ (id)preferencesURL;
@end

@implementation PSNotificationSettingsDetail

+ (id)preferencesURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=NOTIFICATIONS_ID"];
}

@end