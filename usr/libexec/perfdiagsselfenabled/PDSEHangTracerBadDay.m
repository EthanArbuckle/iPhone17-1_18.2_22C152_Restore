@interface PDSEHangTracerBadDay
+ (BOOL)wantsEnablement;
+ (double)timeoutDurationSec;
+ (id)prefixForDefaults;
+ (void)writeEnablementSettings;
@end

@implementation PDSEHangTracerBadDay

+ (id)prefixForDefaults
{
  return @"PDSEHTBadDay";
}

+ (BOOL)wantsEnablement
{
  if (_os_feature_enabled_impl())
  {
    v2 = +[HTPrefs sharedPrefs];
    unsigned int v3 = [v2 badDayEnablementForPreviousDays];

    v4 = +[HTPrefs sharedPrefs];
    id v5 = [v4 badDayEnablementForHangDurationMSec];

    v6 = +[HTPrefs sharedPrefs];
    unsigned int v7 = [v6 badDayEnablementForLogCount];

    v8 = +[HTPrefs sharedPrefs];
    unsigned int v9 = [v8 badDayEnablementMinimumBreakDurationDays];

    v10 = +[HTPrefs sharedPrefs];
    [v10 badDaySecondsBetweenLastEnablementAndReferenceDate];
    double v12 = v11;

    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100004664;
    v46[3] = &unk_100018438;
    *(double *)&v46[4] = v12;
    v46[5] = v5;
    unsigned int v47 = v7;
    unsigned int v48 = v9;
    uint64_t v13 = objc_retainBlock(v46);
    +[NSDate timeIntervalSinceReferenceDate];
    double v15 = v14;
    double v16 = v14 - v12;
    [(id)objc_opt_class() timeoutDurationSec];
    if (v16 < v17 || v16 >= v17 + (double)v9 * 86400.0)
    {
      if (v16 >= v17)
      {
        v18 = CFPreferencesCopyValue(@"BadDaySecondsBetweenLastEvaluationAndReferenceDate", @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
        [v18 doubleValue];
        if (v15 - v21 >= 43200.0)
        {
          CFPreferencesSetValue(@"BadDaySecondsBetweenLastEvaluationAndReferenceDate", +[NSNumber numberWithDouble:v15], @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
          CFPreferencesSynchronize(@"com.apple.da", @"mobile", kCFPreferencesAnyHost);
          double v24 = (double)v3;
          float v25 = (float)(unint64_t)v5 / 1000.0;
          id v26 = [objc_alloc((Class)NSCountedSet) initWithCapacity:0];
          v27 = +[NSDate dateWithTimeIntervalSinceNow:v24 * -86400.0];
          v28 = +[NSDate date];
          v43[0] = _NSConcreteStackBlock;
          v43[1] = 3221225472;
          v43[2] = sub_100004854;
          v43[3] = &unk_100018460;
          float v45 = v25;
          v22 = v26;
          v44 = v22;
          v38 = v27;
          sub_100006AD4(v27, v28, 0, v43);

          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          v29 = [v22 objectEnumerator];
          id v30 = [v29 countByEnumeratingWithState:&v39 objects:v49 count:16];
          if (v30)
          {
            id v31 = v30;
            unsigned int v32 = 0;
            uint64_t v33 = *(void *)v40;
            while (2)
            {
              for (i = 0; i != v31; i = (char *)i + 1)
              {
                if (*(void *)v40 != v33) {
                  objc_enumerationMutation(v29);
                }
                v35 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                if ((sub_10000D6BC(v35) & 1) == 0) {
                  v32 += [v22 countForObject:v35];
                }
                if (v32 >= v7)
                {
                  v36 = sub_10000DCE8();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "PDSE: enabling bad day log collection", buf, 2u);
                  }

                  BOOL v20 = 1;
                  (*(void (**)(uint64_t, uint64_t))(v13 + 16))(v13, 1);

                  goto LABEL_32;
                }
              }
              id v31 = [v29 countByEnumeratingWithState:&v39 objects:v49 count:16];
              if (v31) {
                continue;
              }
              break;
            }
          }

          (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
          BOOL v20 = 0;
LABEL_32:
        }
        else
        {
          [v18 doubleValue];
          v22 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
          v23 = sub_10000DCE8();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v51 = v22;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PDSE: bad day log not evaluated since last evaluation (%@) is too close", buf, 0xCu);
          }

          (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
          BOOL v20 = 0;
        }
      }
      else
      {
        v18 = sub_10000DCE8();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          sub_10000E90C(v18);
        }
        BOOL v20 = 1;
      }
    }
    else
    {
      v18 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v12];
      v19 = sub_10000DCE8();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PDSE: bad day log not enabled since last enablement (%@) is too close", buf, 0xCu);
      }

      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
      BOOL v20 = 0;
    }
  }
  else
  {
    uint64_t v13 = sub_10000DCE8();
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "PDSE: bad day log collection feature is turned off", buf, 2u);
    }
    BOOL v20 = 0;
  }

  return v20;
}

+ (void)writeEnablementSettings
{
  +[NSDate timeIntervalSinceReferenceDate];
  CFPreferencesSetValue(@"BadDaySecondsBetweenLastEnablementAndReferenceDate", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"), @"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  unsigned int v3 = +[HTPrefs sharedPrefs];
  unsigned __int8 v4 = [v3 isInternal];

  if (v4)
  {
    id v5 = [a1 prefixForDefaults];
    CFStringRef v6 = (const __CFString *)sub_1000038B8(@"HangTracerEnabled", (uint64_t)v5);
    CFPreferencesSetValue(v6, kCFBooleanTrue, @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

    unsigned int v7 = sub_10000DCE8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10000E950(a1, @"HangTracerEnabled", v7);
    }

    CFPreferencesSynchronize(@"com.apple.da", @"mobile", kCFPreferencesAnyHost);
  }
  else
  {
    v29[0] = @"HangTracerDailyLogLimit";
    v29[1] = @"HangTracerDailyMicroHangLogLimit";
    v29[2] = @"HangTracerFenceHangLogLimit";
    +[NSArray arrayWithObjects:v29 count:3];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v8)
    {
      id v10 = v8;
      uint64_t v11 = *(void *)v23;
      *(void *)&long long v9 = 138412290;
      long long v19 = v9;
      do
      {
        double v12 = 0;
        do
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v12);
          double v14 = [a1 prefixForDefaults:v19];
          CFStringRef v15 = (const __CFString *)sub_1000038B8(v13, (uint64_t)v14);
          CFPreferencesSetValue(v15, +[NSNumber numberWithInt:0], @"com.apple.da", @"mobile", kCFPreferencesAnyHost);

          double v16 = sub_10000DCE8();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            double v17 = [a1 prefixForDefaults];
            v18 = sub_1000038B8(v13, (uint64_t)v17);
            *(_DWORD *)buf = v19;
            v27 = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "PDSE: set setting %@ to 0 for bad day log collection", buf, 0xCu);
          }
          double v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v10);
    }

    v21.receiver = a1;
    v21.super_class = (Class)&OBJC_METACLASS___PDSEHangTracerBadDay;
    [super writeEnablementSettings];
  }
}

+ (double)timeoutDurationSec
{
  v2 = +[HTPrefs sharedPrefs];
  unsigned int v3 = [v2 badDayEnablementDurationDays];

  return (double)v3 * 86400.0 + 43200.0;
}

@end