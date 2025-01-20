@interface CFHelper
- (BOOL)readTzAuto;
- (CFHelper)init;
- (CFHelper)initWithLog:(id)a3;
- (id)read24HrMode;
- (id)readTimezone;
- (id)readUTCOffset;
- (void)readDST:(id *)a3 :(id *)a4;
- (void)write24HrMode:(__CFBoolean *)a3;
- (void)writeTimezone:(id)a3;
- (void)writeTzAuto;
@end

@implementation CFHelper

- (void)writeTimezone:(id)a3
{
  id v4 = a3;
  [v4 UTF8String];
  if (tzlink())
  {
    logs = self->logs;
    if (os_log_type_enabled((os_log_t)logs, OS_LOG_TYPE_ERROR)) {
      sub_1000024D0((os_log_t)logs);
    }
  }
  else
  {
    TMSetAutomaticTimeZoneEnabled();
    TMSetAutomaticTimeEnabled();
    CFPreferencesSetAppValue(@"timezone", v4, @"com.apple.preferences.datetime");
    CFPreferencesSetAppValue(@"timezoneset", kCFBooleanTrue, @"com.apple.preferences.datetime");
    CFPreferencesAppSynchronize(@"com.apple.preferences.datetime");
    +[NSTimeZone resetSystemTimeZone];
  }
}

- (void)writeTzAuto
{
  TMSetAutomaticTimeEnabled();
  TMSetAutomaticTimeZoneEnabled();
  CFPreferencesSetAppValue(@"automatic-time", 0, @"com.apple.preferences.datetime");

  CFPreferencesAppSynchronize(@"com.apple.preferences.datetime");
}

- (BOOL)readTzAuto
{
  return TMIsAutomaticTimeZoneEnabled() != 0;
}

- (id)readTimezone
{
  v2 = +[NSTimeZone systemTimeZone];
  v3 = [v2 name];

  return v3;
}

- (id)readUTCOffset
{
  v2 = +[NSTimeZone systemTimeZone];
  v3 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v2 secondsFromGMT]);
  id v4 = [v3 stringValue];

  return v4;
}

- (void)readDST:(id *)a3 :(id *)a4
{
  v6 = +[NSTimeZone systemTimeZone];
  id v16 = [v6 nextDaylightSavingTimeTransition];

  if (v16)
  {
    [v16 timeIntervalSince1970];
    uint64_t v8 = v7;
    v9 = +[NSTimeZone systemTimeZone];
    unsigned int v10 = [v9 isDaylightSavingTime];

    v11 = +[NSTimeZone systemTimeZone];
    v12 = v11;
    if (v10)
    {
      [v11 daylightSavingTimeOffset];
      double v14 = -v13;
    }
    else
    {
      [v11 daylightSavingTimeOffsetForDate:v16];
      double v14 = v15;
    }
  }
  else
  {
    double v14 = 0.0;
    uint64_t v8 = 0;
  }
  *a3 = +[NSString stringWithFormat:@"%.0f", v8];
  *a4 = +[NSString stringWithFormat:@"%.0f", *(void *)&v14];
}

- (void)write24HrMode:(__CFBoolean *)a3
{
  CFPreferencesSetValue(@"AppleICUForce24HourTime", a3, kCFPreferencesAnyApplication, @"mobile", kCFPreferencesCurrentHost);
  CFPreferencesSynchronize(kCFPreferencesAnyApplication, @"mobile", kCFPreferencesCurrentHost);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();

  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleTimePreferencesChangedNotification", 0, 0, 1u);
}

- (id)read24HrMode
{
  id v3 = objc_alloc_init((Class)NSDateFormatter);
  id v4 = +[NSLocale currentLocale];
  [v3 setLocale:v4];

  [v3 setLocalizedDateFormatFromTemplate:@"j"];
  logs = self->logs;
  if (os_log_type_enabled(logs, OS_LOG_TYPE_DEBUG)) {
    sub_100002514(logs, v3);
  }
  v6 = [v3 dateFormat];
  unsigned int v7 = [v6 containsString:@"H"];

  uint64_t v8 = +[NSString stringWithFormat:@"%d", v7];

  return v8;
}

- (CFHelper)init
{
  v3.receiver = self;
  v3.super_class = (Class)CFHelper;
  return [(CFHelper *)&v3 init];
}

- (CFHelper)initWithLog:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CFHelper;
  v5 = [(CFHelper *)&v9 init];
  v6 = v5;
  if (v5)
  {
    if (v4) {
      unsigned int v7 = v4;
    }
    else {
      unsigned int v7 = &_os_log_default;
    }
    objc_storeStrong((id *)&v5->logs, v7);
  }

  return v6;
}

- (void).cxx_destruct
{
}

@end