@interface PDSESentry
+ (BOOL)didDisableDiagnostics;
+ (BOOL)wantsEnablement;
+ (BOOL)willEnableDiagnostics;
+ (double)timeoutDurationSec;
+ (id)prefixForDefaults;
+ (tailspin_config)desiredTailspinConfig;
@end

@implementation PDSESentry

+ (id)prefixForDefaults
{
  return @"PDSESentry";
}

+ (BOOL)wantsEnablement
{
  v2 = +[HTPrefs sharedPrefs];
  unsigned int v3 = [v2 pdseSentryPeriodDays];
  int v4 = sub_10000E5C4(@"PDSESentry");
  LOBYTE(v3) = sub_10000E31C(v3, 1, v4);

  return v3;
}

+ (BOOL)willEnableDiagnostics
{
  v2 = sub_10000DCE8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    CFStringRef v7 = @"PDSESentry";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "HTSTYE: Enable HTSTYE: enable tailspin and set necessary settings with Sentry-Enablement prefix = %@", (uint8_t *)&v6, 0xCu);
  }

  CFStringRef v3 = (const __CFString *)sub_1000038B8(@"HangTracerEnableSignpostMonitoring", @"PDSESentry");
  CFPreferencesSetValue(v3, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  int v4 = sub_10000DCE8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000F548(@"HangTracerEnableSignpostMonitoring", @"PDSESentry", v4);
  }

  return 1;
}

+ (BOOL)didDisableDiagnostics
{
  v2 = sub_10000DCE8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v24 = @"PDSESentry";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "HTSTYE: Disable HTSTYE: disable tailspin and delete all settings with Sentry-Enablement prefix = %@", buf, 0xCu);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  CFStringRef v3 = sub_1000038F0(@"com.apple.da", @"mobile", @"PDSESentry");
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        CFStringRef v8 = *(const __CFString **)(*((void *)&v18 + 1) + 8 * i);
        CFPreferencesSetValue(v8, 0, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
        v9 = sub_10000DCE8();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v24 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "HTSTYE: Disable HTSTYE: delete setting %@", buf, 0xCu);
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }

  CFPreferencesSynchronize(@"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  v10 = sub_1000038F0(@"com.apple.da", @"mobile", @"PDSESentry");
  id v11 = [v10 count];

  v12 = sub_10000DCE8();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v24 = @"PDSESentry";
      v14 = "HTSTYE: Disable HTSTYE: some HTSTYE prefs with prefix %@ remain";
      v15 = v12;
      uint32_t v16 = 12;
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
    }
  }
  else if (v13)
  {
    *(_WORD *)buf = 0;
    v14 = "HTSTYE: Disable HTSTYE: All prefix'ed settings were successfully deleted";
    v15 = v12;
    uint32_t v16 = 2;
    goto LABEL_17;
  }

  return 1;
}

+ (tailspin_config)desiredTailspinConfig
{
  v2 = (tailspin_config *)tailspin_config_create_with_default_config();
  if (v2)
  {
    tailspin_enabled_set();
  }
  else
  {
    CFStringRef v3 = sub_10000DCE8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
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