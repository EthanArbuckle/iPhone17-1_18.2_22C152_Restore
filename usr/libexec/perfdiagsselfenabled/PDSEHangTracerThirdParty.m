@interface PDSEHangTracerThirdParty
+ (BOOL)wantsEnablement;
+ (id)prefixForDefaults;
+ (void)writeEnablementSettings;
@end

@implementation PDSEHangTracerThirdParty

+ (id)prefixForDefaults
{
  return @"PDSEHTThirdParty";
}

+ (BOOL)wantsEnablement
{
  unsigned int v3 = +[MXSourceUtilities anyClientsAvailable];
  if (DiagnosticLogSubmissionEnabled()) {
    int v4 = AppAnalyticsEnabled();
  }
  else {
    int v4 = 0;
  }
  v5 = sub_10000DCE8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000EA0C(v3, v4, v5);
  }

  v6 = sub_10000DCE8();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v7)
    {
      v8 = +[HTPrefs sharedPrefs];
      int v16 = 67109120;
      unsigned int v17 = [v8 pdseHTThirdPartyPeriodDays];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PDSE: PDSEHTThirdParty: log upload enabled on device, will use pdseHTThirdPartyPeriod=%i to determine wantsEnablement", (uint8_t *)&v16, 8u);
    }
    v6 = +[HTPrefs sharedPrefs];
    unsigned int v9 = [v6 pdseHTThirdPartyPeriodDays];
LABEL_14:
    int v11 = v9;
    v12 = [a1 prefixForDefaults];
    int v13 = sub_10000E5C4(v12);
    BOOL v14 = sub_10000E31C(v11, 2, v13);

    goto LABEL_18;
  }
  if (v3)
  {
    if (v7)
    {
      v10 = +[HTPrefs sharedPrefs];
      int v16 = 67109120;
      unsigned int v17 = [v10 pdseHTThirdPartyNoLogUploadPeriodDays];
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PDSE: PDSEHTThirdParty: log upload disabled on device and MetricKit clients enabled, will use pdseHTThirdPartyNoLogUploadPeriodDays=%i to determine wantsEnablement", (uint8_t *)&v16, 8u);
    }
    v6 = +[HTPrefs sharedPrefs];
    unsigned int v9 = [v6 pdseHTThirdPartyNoLogUploadPeriodDays];
    goto LABEL_14;
  }
  if (v7)
  {
    int v16 = 67109376;
    unsigned int v17 = 0;
    __int16 v18 = 1024;
    int v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PDSE: PDSEHTThirdParty: not enabling HT 3rd Party mode due to (enableForMetricKit=%{BOOL}d enableForLogUpload=%{BOOL}d", (uint8_t *)&v16, 0xEu);
  }
  BOOL v14 = 0;
LABEL_18:

  return v14;
}

+ (void)writeEnablementSettings
{
  unsigned int v3 = [a1 prefixForDefaults];
  CFStringRef v4 = (const __CFString *)sub_1000038B8(@"HangTracerEnabled", (uint64_t)v3);
  CFPreferencesSetValue(v4, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  v5 = sub_10000DCE8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000EBD4();
  }

  v6 = [a1 prefixForDefaults];
  CFStringRef v7 = (const __CFString *)sub_1000038B8(@"HangTracerReportPeriod", (uint64_t)v6);
  CFPreferencesSetValue(v7, +[NSNumber numberWithDouble:3600.0], @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  v8 = sub_10000DCE8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000EC70();
  }

  unsigned int v9 = [a1 prefixForDefaults];
  CFStringRef v10 = (const __CFString *)sub_1000038B8(@"HangTracerEnableTailspin", (uint64_t)v9);
  CFPreferencesSetValue(v10, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  int v11 = sub_10000DCE8();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10000EBD4();
  }

  v12 = [a1 prefixForDefaults];
  CFStringRef v13 = (const __CFString *)sub_1000038B8(@"HangTracerFenceTrackingEnabled", (uint64_t)v12);
  CFPreferencesSetValue(v13, kCFBooleanFalse, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  BOOL v14 = sub_10000DCE8();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_10000EB38();
  }

  v15 = [a1 prefixForDefaults];
  CFStringRef v16 = (const __CFString *)sub_1000038B8(@"HangTracerPercentFullSpinReports", (uint64_t)v15);
  CFPreferencesSetValue(v16, +[NSNumber numberWithDouble:0.0], @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  unsigned int v17 = sub_10000DCE8();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10000EA9C();
  }

  __int16 v18 = [a1 prefixForDefaults];
  CFStringRef v19 = (const __CFString *)sub_1000038B8(@"HangTracerDailyLogLimit", (uint64_t)v18);
  CFPreferencesSetValue(v19, +[NSNumber numberWithInt:0], @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  v20 = sub_10000DCE8();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_10000EA9C();
  }

  v21 = [a1 prefixForDefaults];
  CFStringRef v22 = (const __CFString *)sub_1000038B8(@"HangTracerDailyLongLogLimit", (uint64_t)v21);
  CFPreferencesSetValue(v22, +[NSNumber numberWithInt:0], @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

  v23 = sub_10000DCE8();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_10000EA9C();
  }

  CFPreferencesSynchronize(@"com.apple.da", @"mobile", kCFPreferencesAnyHost);
}

@end