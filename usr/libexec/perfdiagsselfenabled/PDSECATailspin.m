@interface PDSECATailspin
+ (BOOL)didDisableDiagnostics;
+ (BOOL)wantsEnablement;
+ (BOOL)willEnableDiagnostics;
+ (double)timeoutDurationSec;
+ (id)prefixForDefaults;
+ (tailspin_config)desiredTailspinConfig;
@end

@implementation PDSECATailspin

+ (id)prefixForDefaults
{
  return @"PDSECATailspin";
}

+ (BOOL)wantsEnablement
{
  v2 = +[HTPrefs sharedPrefs];
  unsigned int v3 = [v2 pdseCATailspinPeriodDays];
  int v4 = sub_10000E5C4(@"PDSECATailspin");
  LOBYTE(v3) = sub_10000E31C(v3, 1, v4);

  return v3;
}

+ (BOOL)willEnableDiagnostics
{
  v2 = sub_10000DCE8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    CFStringRef v7 = @"PDSECATailspin";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "PDSE: Enable HangTracer: set necessary settings with CA's Self-Enablement prefix = %@", (uint8_t *)&v6, 0xCu);
  }

  CFStringRef v3 = (const __CFString *)sub_1000038B8(@"CATailspinEnable", @"PDSECATailspin");
  CFPreferencesSetValue(v3, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  int v4 = sub_10000DCE8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000E754(@"CATailspinEnable", @"PDSECATailspin");
  }

  return 1;
}

+ (BOOL)didDisableDiagnostics
{
  CFStringRef v2 = (const __CFString *)sub_1000038B8(@"CATailspinEnable", @"PDSECATailspin");
  CFPreferencesSetValue(v2, 0, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  CFStringRef v3 = sub_10000DCE8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000E7DC(@"CATailspinEnable", @"PDSECATailspin");
  }

  return 1;
}

+ (tailspin_config)desiredTailspinConfig
{
  CFStringRef v2 = (tailspin_config *)tailspin_config_create_with_default_config();
  if (v2)
  {
    tailspin_enabled_set();
    tailspin_buffer_size_set();
  }
  else
  {
    CFStringRef v3 = sub_10000DCE8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Failed to create tailspin config object", v5, 2u);
    }
  }
  return v2;
}

+ (double)timeoutDurationSec
{
  return 129600.0;
}

@end