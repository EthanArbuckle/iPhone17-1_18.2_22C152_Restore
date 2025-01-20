@interface ClockManager
+ (void)loadUserPreferences;
+ (void)saveAndNotifyForUserPreferences:(BOOL)a3 localNotifications:(BOOL)a4;
@end

@implementation ClockManager

+ (void)loadUserPreferences
{
}

+ (void)saveAndNotifyForUserPreferences:(BOOL)a3 localNotifications:(BOOL)a4
{
  if (a3)
  {
    if (a3 && a4) {
      CFStringRef v4 = @"com.apple.mobiletimer.user-preferences-and-local-notifications-changed";
    }
    else {
      CFStringRef v4 = @"com.apple.mobiletimer.user-preferences-changed";
    }
    CFPreferencesAppSynchronize(@"com.apple.mobiletimer");
  }
  else
  {
    if (!a4) {
      return;
    }
    CFStringRef v4 = @"com.apple.mobiletimer.local-notifications-changed";
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, v4, 0, 0, 0);
}

@end