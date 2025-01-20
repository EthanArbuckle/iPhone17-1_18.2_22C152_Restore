@interface BusinessSettingsHelper
- (BOOL)areBusinessUpdatesEnabled;
- (void)setRCSBusinessMessagesEnabled:(BOOL)a3;
@end

@implementation BusinessSettingsHelper

- (void)setRCSBusinessMessagesEnabled:(BOOL)a3
{
  CFPreferencesSetAppValue(@"RCSForBusinessEnabled", (CFPropertyListRef)[NSNumber numberWithBool:a3], @"com.apple.madrid");
  CFPreferencesSynchronize(@"com.apple.madrid", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.ReadReceiptsEnabled.changed", 0, 0, 1u);
}

- (BOOL)areBusinessUpdatesEnabled
{
  CFPreferencesSynchronize(@"com.apple.madrid", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"RCSForBusinessEnabled", @"com.apple.madrid", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v3 = AppBooleanValue == 0;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

@end