@interface NSURL(UserNotificationsUIKit)
+ (id)nc_notificationSettingsURLForSectionIdentifier:()UserNotificationsUIKit isAppClip:;
@end

@implementation NSURL(UserNotificationsUIKit)

+ (id)nc_notificationSettingsURLForSectionIdentifier:()UserNotificationsUIKit isAppClip:
{
  if (a4) {
    [NSString stringWithFormat:@"%@%@%@", @"prefs:root=NOTIFICATIONS_ID&path=", @"APP_CLIPS_ID/", a3];
  }
  else {
  v4 = [NSString stringWithFormat:@"%@%@", @"prefs:root=NOTIFICATIONS_ID&path=", a3, v7];
  }
  v5 = [MEMORY[0x1E4F1CB10] URLWithString:v4];

  return v5;
}

@end