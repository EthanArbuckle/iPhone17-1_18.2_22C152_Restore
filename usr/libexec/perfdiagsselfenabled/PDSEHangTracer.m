@interface PDSEHangTracer
+ (BOOL)didDisableDiagnostics;
+ (BOOL)wantsEnablement;
+ (BOOL)willEnableDiagnostics;
+ (double)timeoutDurationSec;
+ (id)prefixForDefaults;
+ (tailspin_config)desiredTailspinConfig;
+ (void)writeEnablementSettings;
@end

@implementation PDSEHangTracer

+ (id)prefixForDefaults
{
  return @"PDSEHangTracer";
}

+ (BOOL)wantsEnablement
{
  v3 = +[HTPrefs sharedPrefs];
  unsigned int v4 = [v3 pdseHTPeriodDays];
  v5 = [a1 prefixForDefaults];
  int v6 = sub_10000E5C4(v5);
  LOBYTE(v4) = sub_10000E31C(v4, 2, v6);

  return v4;
}

+ (BOOL)willEnableDiagnostics
{
  v3 = sub_10000DCE8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = [a1 prefixForDefaults];
    int v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDSE: Enable HangTracer: set necessary settings with HT's Self-Enablement prefix = %@", (uint8_t *)&v7, 0xCu);
  }
  v5 = sub_10000CDB8();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v7) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HTSelfEnable.DisableToEnable", " enableTelemetry=YES ", (uint8_t *)&v7, 2u);
  }
  [a1 writeEnablementSettings];

  return 1;
}

+ (void)writeEnablementSettings
{
  v3 = [a1 prefixForDefaults];
  CFStringRef v4 = (const __CFString *)sub_1000038B8(@"HangTracerEnabled", (uint64_t)v3);
  CFPreferencesSetValue(v4, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  v5 = sub_10000DCE8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000F374();
  }

  int v6 = [a1 prefixForDefaults];
  CFStringRef v7 = (const __CFString *)sub_1000038B8(@"HangTracerReportPeriod", (uint64_t)v6);
  CFPreferencesSetValue(v7, +[NSNumber numberWithDouble:3600.0], @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  v8 = sub_10000DCE8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000F4AC();
  }

  v9 = [a1 prefixForDefaults];
  CFStringRef v10 = (const __CFString *)sub_1000038B8(@"HangTracerDailyThirdPartyLogLimit", (uint64_t)v9);
  CFPreferencesSetValue(v10, +[NSNumber numberWithInt:0], @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  v11 = sub_10000DCE8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10000F410();
  }

  v12 = +[HTPrefs sharedPrefs];
  unsigned int v13 = [v12 pdseAllowEnableTailspin];

  if (v13)
  {
    v14 = [a1 prefixForDefaults];
    CFStringRef v15 = (const __CFString *)sub_1000038B8(@"HangTracerEnableTailspin", (uint64_t)v14);
    CFPreferencesSetValue(v15, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

    v16 = sub_10000DCE8();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      sub_10000F374();
    }
  }
  CFPreferencesSynchronize(@"com.apple.da", @"mobile", kCFPreferencesAnyHost);
}

+ (BOOL)didDisableDiagnostics
{
  v3 = sub_10000DCE8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v4 = [a1 prefixForDefaults];
    *(_DWORD *)buf = 138412290;
    CFStringRef v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "HTSE: Disable HTSE: disable tailspin and delete all settings with Self-Enablement prefix = %@", buf, 0xCu);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v20 = a1;
  v5 = [a1 prefixForDefaults];
  int v6 = sub_1000038F0(@"com.apple.da", @"mobile", (uint64_t)v5);

  id v7 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        CFStringRef v11 = *(const __CFString **)(*((void *)&v21 + 1) + 8 * i);
        CFPreferencesSetValue(v11, 0, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
        v12 = sub_10000DCE8();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v27 = v11;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "HTSE: Disable HTSE: delete setting %@", buf, 0xCu);
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v8);
  }

  CFPreferencesSynchronize(@"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  unsigned int v13 = [v20 prefixForDefaults];
  v14 = sub_1000038F0(@"com.apple.da", @"mobile", (uint64_t)v13);
  id v15 = [v14 count];

  v16 = sub_10000DCE8();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
  if (v15)
  {
    if (v17)
    {
      v18 = [v20 prefixForDefaults];
      *(_DWORD *)buf = 138412290;
      CFStringRef v27 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "HTSE: Disable HTSE: some HTSE prefs with prefix %@ remain", buf, 0xCu);
    }
  }
  else
  {
    if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "HTSE: Disable HTSE: All prefix'ed settings were successfully deleted", buf, 2u);
    }

    v16 = sub_10000CDB8();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "HTSelfEnable.EnableToDisable", " enableTelemetry=YES ", buf, 2u);
    }
  }

  return v15 == 0;
}

+ (tailspin_config)desiredTailspinConfig
{
  v2 = (tailspin_config *)tailspin_config_create_with_default_config();
  if (v2)
  {
    tailspin_enabled_set();
    tailspin_buffer_size_set();
    tailspin_oncore_sampling_period_set();
    tailspin_full_sampling_period_set();
  }
  else
  {
    v3 = sub_10000DCE8();
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
  return 216000.0;
}

@end