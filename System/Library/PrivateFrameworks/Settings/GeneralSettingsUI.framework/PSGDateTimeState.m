@interface PSGDateTimeState
+ (BOOL)is24HourTime;
+ (BOOL)localeForces24HourTime;
+ (void)set24HourTime:(BOOL)a3;
@end

@implementation PSGDateTimeState

+ (BOOL)localeForces24HourTime
{
  CFStringRef v2 = (const __CFString *)CFPreferencesCopyAppValue(@"AppleLocale", (CFStringRef)*MEMORY[0x263EFFE48]);
  if (v2)
  {
    CFStringRef v3 = v2;
    CFLocaleRef v4 = CFLocaleCreate(0, v2);
    CFRelease(v3);
    if (v4)
    {
LABEL_3:
      char v5 = PSLocaleUses24HourClock();
      CFRelease(v4);
      return v5;
    }
  }
  else
  {
    CFLocaleRef v4 = CFLocaleCopyCurrent();
    if (v4) {
      goto LABEL_3;
    }
  }
  return 0;
}

+ (BOOL)is24HourTime
{
  int v2 = [a1 localeForces24HourTime];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x263EFFE48];
  if (v2) {
    return CFPreferencesGetAppBooleanValue(@"AppleICUForce12HourTime", v3, 0) == 0;
  }
  else {
    return CFPreferencesGetAppBooleanValue(@"AppleICUForce24HourTime", v3, 0) != 0;
  }
}

+ (void)set24HourTime:(BOOL)a3
{
  BOOL v3 = a3;
  int v4 = [a1 localeForces24HourTime];
  if (v3) {
    char v5 = (const void *)*MEMORY[0x263EFFB40];
  }
  else {
    char v5 = (const void *)*MEMORY[0x263EFFB38];
  }
  if (v3) {
    v6 = 0;
  }
  else {
    v6 = (const void *)*MEMORY[0x263EFFB40];
  }
  if (v3) {
    v7 = (const void *)*MEMORY[0x263EFFB40];
  }
  else {
    v7 = 0;
  }
  CFPreferencesSetAppValue(@"StatusBarHidesAMPM", v5, @"com.apple.UIKit");
  if (v4) {
    v8 = v6;
  }
  else {
    v8 = 0;
  }
  if (v4) {
    v9 = 0;
  }
  else {
    v9 = v7;
  }
  CFStringRef v10 = (const __CFString *)*MEMORY[0x263EFFE48];
  CFPreferencesSetAppValue(@"AppleICUForce12HourTime", v8, (CFStringRef)*MEMORY[0x263EFFE48]);
  CFPreferencesSetAppValue(@"AppleICUForce24HourTime", v9, v10);
  CFPreferencesAppSynchronize(v10);
  CFPreferencesAppSynchronize(@"com.apple.UIKit");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleTimePreferencesChangedNotification", 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SignificantTimeChangeNotification", 0, 0, 1u);
}

@end