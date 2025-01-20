@interface PDSEHangTracerRateOnly
+ (BOOL)wantsEnablement;
+ (id)prefixForDefaults;
+ (tailspin_config)desiredTailspinConfig;
+ (void)writeEnablementSettings;
@end

@implementation PDSEHangTracerRateOnly

+ (id)prefixForDefaults
{
  return @"PDSEHTRateOnly";
}

+ (BOOL)wantsEnablement
{
  v3 = +[HTPrefs sharedPrefs];
  unsigned int v4 = [v3 pdseHTRateOnlyPeriodDays];
  v5 = [a1 prefixForDefaults];
  int v6 = sub_10000E5C4(v5);
  LOBYTE(v4) = sub_10000E31C(v4, 2, v6);

  return v4;
}

+ (void)writeEnablementSettings
{
  v3 = [a1 prefixForDefaults];
  CFStringRef v4 = (const __CFString *)sub_1000038B8(@"HangTracerEnabled", (uint64_t)v3);
  CFPreferencesSetValue(v4, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  v5 = sub_10000DCE8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000EEDC(a1);
  }

  int v6 = [a1 prefixForDefaults];
  CFStringRef v7 = (const __CFString *)sub_1000038B8(@"HangTracerReportPeriod", (uint64_t)v6);
  CFPreferencesSetValue(v7, +[NSNumber numberWithDouble:3600.0], @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  v8 = sub_10000DCE8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000EE38(a1);
  }

  v9 = [a1 prefixForDefaults];
  CFStringRef v10 = (const __CFString *)sub_1000038B8(@"HangTracerEnableTailspin", (uint64_t)v9);
  CFPreferencesSetValue(v10, kCFBooleanFalse, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  v11 = sub_10000DCE8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10000ED94(a1);
  }

  CFPreferencesSynchronize(@"com.apple.da", @"mobile", kCFPreferencesAnyHost);
}

+ (tailspin_config)desiredTailspinConfig
{
  return 0;
}

@end