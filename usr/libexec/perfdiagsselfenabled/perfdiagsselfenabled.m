NSString *sub_1000038B8(uint64_t a1, uint64_t a2)
{
  return +[NSString stringWithFormat:@"%@.%@", a2, a1];
}

id sub_1000038F0(const __CFString *a1, void *a2, uint64_t a3)
{
  v5 = a2;
  v6 = +[NSString stringWithFormat:@"%@.", a3];
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  CFArrayRef v8 = CFPreferencesCopyKeyList(a1, v5, kCFPreferencesAnyHost);
  id v9 = [(__CFArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v13 hasPrefix:v6]) {
          [v7 addObject:v13];
        }
      }
      id v10 = [(__CFArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

void sub_100003D68(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void start()
{
  v0 = sub_10000DCE8();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "perfdiagsselfenabled: launched", buf, 2u);
  }

  xpc_activity_register("com.apple.perfdiagsselfenabled", XPC_ACTIVITY_CHECK_IN, &stru_1000183D8);
  v1 = sub_10000DCE8();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "perfdiagsselfenabled: setup prefs", v3, 2u);
  }

  v2 = +[HTPrefs sharedPrefs];
  [v2 setupPrefsWithQueue:&_dispatch_main_q];

  dispatch_main();
}

void sub_100003E6C(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (!xpc_activity_get_state(v2))
  {
    uint64_t v11 = sub_10000DCE8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10000E864(v11, v19, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_9;
  }
  if (xpc_activity_get_state(v2) == 2)
  {
    v3 = sub_10000DCE8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_10000E8D4(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &stru_1000183F8);
    uint64_t v11 = sub_10000DCE8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10000E89C(v11, v12, v13, v14, v15, v16, v17, v18);
    }
LABEL_9:
  }
}

void sub_100003F34(id a1)
{
  v1 = sub_10000DCE8();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "perfdiagsselfenabled: begin evaluateSelfEnablement", buf, 2u);
  }

  +[PerfDiagsSelfEnablementController evaluateSelfEnablement];
  v2 = sub_10000DCE8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "perfdiagsselfenabled: finished evaluateSelfEnablement", v5, 2u);
  }

  v3 = sub_10000DCE8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "perfdiagsselfenabled: exit cleanly", v4, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_100004034(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t sub_100004664()
{
  return AnalyticsSendEventLazy();
}

id sub_1000046F0(uint64_t a1)
{
  v9[0] = @"enable";
  v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v10[0] = v2;
  v9[1] = @"last_enablement";
  v3 = +[NSNumber numberWithDouble:*(double *)(a1 + 32)];
  v10[1] = v3;
  v9[2] = @"log_count_threshold";
  uint64_t v4 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  v10[2] = v4;
  v9[3] = @"duration_threshold_ms";
  uint64_t v5 = +[NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
  v10[3] = v5;
  v9[4] = @"minimum_break_days";
  uint64_t v6 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 52)];
  v10[4] = v6;
  uint64_t v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:5];

  return v7;
}

uint64_t sub_100004854(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 durationSeconds];
  if (v4 >= *(float *)(a1 + 40))
  {
    uint64_t v5 = [v3 beginEvent];
    uint64_t v6 = [v5 attributes];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"BundleIdOverride"];

    if (v7 && [v7 hasPrefix:@"com.apple."]) {
      [*(id *)(a1 + 32) addObject:v7];
    }
  }
  return 1;
}

void sub_100004EA4(id a1)
{
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:8];
  v2 = (void *)qword_10001E518;
  qword_10001E518 = v1;
}

id sub_100006054(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFStringRef v4 = @"client";
  uint64_t v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_1000060D8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v4[0] = @"client";
  v4[1] = @"transitionType";
  v5[0] = v1;
  v5[1] = @"DisableToDisable";
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

id sub_100006170(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = @"client";
  v5[1] = @"transitionType";
  v6[0] = v1;
  v6[1] = @"DisableToEnable";
  void v5[2] = @"success";
  v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v6[2] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];

  return v3;
}

id sub_100006248(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = @"client";
  v5[1] = @"transitionType";
  v6[0] = v1;
  v6[1] = @"EnableToDisable";
  void v5[2] = @"success";
  v2 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v6[2] = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:3];

  return v3;
}

id sub_100006320(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v4[0] = @"client";
  v4[1] = @"transitionType";
  v5[0] = v1;
  v5[1] = @"EnableToEnable";
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

id sub_1000063B8(uint64_t a1)
{
  v8[0] = *(void *)(a1 + 32);
  v7[0] = @"client";
  v7[1] = @"enabled";
  uint64_t v1 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v8[1] = v1;
  v7[2] = @"hasMetricKitClients";
  v2 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[MXSourceUtilities anyClientsAvailable]);
  v8[2] = v2;
  v7[3] = @"thirdPartyLogUploadEnabled";
  if (DiagnosticLogSubmissionEnabled()) {
    uint64_t v3 = AppAnalyticsEnabled();
  }
  else {
    uint64_t v3 = 0;
  }
  CFStringRef v4 = +[NSNumber numberWithInt:v3];
  v8[3] = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:4];

  return v5;
}

BOOL sub_100006AD4(void *a1, void *a2, float *a3, void *a4)
{
  id v7 = a4;
  id v8 = a2;
  id v9 = a1;
  uint64_t v10 = objc_opt_new();
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100006DB0;
  v21[3] = &unk_100018898;
  id v11 = v7;
  id v22 = v11;
  [v10 setIntervalCompletionProcessingBlock:v21];
  uint64_t v12 = objc_opt_new();
  [v12 addSubsystem:@"com.apple.hangtracer" category:@"always_on_hang"];
  [v10 setSubsystemCategoryFilter:v12];
  memset(&v19, 0, sizeof(v19));
  memset(&v20, 0, sizeof(v20));
  getrusage(0, &v20);
  id v18 = 0;
  [v10 processLogArchiveWithPath:0 startDate:v9 endDate:v8 errorOut:&v18];

  id v13 = v18;
  getrusage(0, &v19);
  if (a3)
  {
    float v14 = (float)((float)((float)v19.ru_stime.tv_usec / 1000000.0) + (float)v19.ru_stime.tv_sec)
        - (float)((float)((float)v20.ru_stime.tv_usec / 1000000.0) + (float)v20.ru_stime.tv_sec)
        + (float)((float)((float)v19.ru_utime.tv_usec / 1000000.0) + (float)v19.ru_utime.tv_sec)
        - (float)((float)((float)v20.ru_utime.tv_usec / 1000000.0) + (float)v20.ru_utime.tv_sec);
    *a3 = v14;
  }
  if (v13)
  {
    uint64_t v15 = sub_10000DCE8();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v13 localizedDescription];
      *(_DWORD *)buf = 136315394;
      uint64_t v24 = "enumerateHangIntervalsInTimeRange";
      __int16 v25 = 2112;
      v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s completed with error: %@\n", buf, 0x16u);
    }
  }

  return v13 == 0;
}

uint64_t sub_100006DB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000073F0()
{
  return v0;
}

void sub_100007C6C(id a1)
{
  v3[0] = @"HTProfile";
  v3[1] = @"HTEPL";
  v3[2] = @"HTThirdPartyDevSupport";
  v3[3] = @"PLTasking";
  v3[4] = &stru_1000189E8;
  v3[5] = @"PDSEHangTracer";
  v3[6] = @"PDSEHTBadDay";
  v3[7] = @"PDSEHTThirdParty";
  void v3[8] = @"PDSEWorkflowResponsiveness";
  v3[9] = @"PDSEHTRateOnly";
  v3[10] = @"PDSESentry";
  v3[11] = @"PDSEAppLaunch";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:12];
  v2 = (void *)qword_10001E530;
  qword_10001E530 = v1;
}

void sub_100009B0C(id a1)
{
  qword_10001E538 = objc_alloc_init(HTPrefs);

  _objc_release_x1();
}

void sub_10000BD24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  objc_destroyWeak(v33);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v34 - 208), 8);
  _Block_object_dispose((const void *)(v34 - 176), 8);
  _Block_object_dispose((const void *)(v34 - 144), 8);
  objc_destroyWeak((id *)(v34 - 104));
  _Unwind_Resume(a1);
}

void sub_10000BD88(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == a2)
  {
    uint64_t v3 = sub_10000DCE8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      CFStringRef v4 = "HTPrefs: Tasking Changed";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, buf, 2u);
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) == a2)
  {
    uint64_t v3 = sub_10000DCE8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      CFStringRef v4 = "HTPrefs: Telemetry Changed";
      goto LABEL_16;
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == a2)
  {
    uint64_t v3 = sub_10000DCE8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      CFStringRef v4 = "HTPrefs: Profile List Changed";
      goto LABEL_16;
    }
  }
  else if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == a2)
  {
    uint64_t v3 = sub_10000DCE8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      CFStringRef v4 = "HTPrefs: EPL State Changed";
      goto LABEL_16;
    }
  }
  else
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) != a2) {
      goto LABEL_18;
    }
    uint64_t v3 = sub_10000DCE8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      CFStringRef v4 = "HTPrefs: HT Self-Enablement State Changed Triggered Refresh";
      goto LABEL_16;
    }
  }

LABEL_18:
  uint64_t v5 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  unsigned int v7 = [WeakRetained hangtracerDaemonEnabled];

  [*(id *)(a1 + 32) refreshHTPrefs];
  id v8 = objc_loadWeakRetained((id *)(a1 + 80));
  LODWORD(WeakRetained) = [v8 hangtracerDaemonEnabled];

  if (v7 != WeakRetained)
  {
    id v9 = sub_10000DCE8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (v7) {
        CFStringRef v10 = @"ON";
      }
      else {
        CFStringRef v10 = @"OFF";
      }
      id v11 = objc_loadWeakRetained(v5);
      if ([v11 hangtracerDaemonEnabled]) {
        CFStringRef v12 = @"ON";
      }
      else {
        CFStringRef v12 = @"OFF";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v21 = v10;
      __int16 v22 = 2112;
      CFStringRef v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "HTPrefs: HangTracer Enabled State Changed: %@ -> %@", buf, 0x16u);
    }
    id v13 = objc_loadWeakRetained(v5);
    float v14 = [NSNumber numberWithBool:objc_msgSend(v13, "hangtracerDaemonEnabled", @"Enabled")];
    rusage v19 = v14;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

    uint64_t v16 = +[NSNotificationCenter defaultCenter];
    id v17 = objc_loadWeakRetained(v5);
    [v16 postNotificationName:@"com.apple.hangtracer.daemonstate" object:v17 userInfo:v15];
  }
}

void sub_10000C0DC(uint64_t a1, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == a2)
  {
    v2 = sub_10000DCE8();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "HTPrefs: Test Reset Log Limits", v3, 2u);
    }
  }
}

void sub_10000CB5C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

uint64_t sub_10000CB98(uint64_t a1)
{
  v2 = sub_10000DCE8();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (a1)
  {
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: change tailspin config", buf, 2u);
    }

    return tailspin_config_apply_sync();
  }
  else
  {
    if (v3)
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "ApplyTailspinConfig: provided desiredConfig is null", v5, 2u);
    }

    return 0;
  }
}

uint64_t sub_10000CC48(uint64_t a1)
{
  v2 = sub_1000038F0(@"com.apple.da", @"mobile", @"HTEPL");
  unint64_t v3 = (unint64_t)[v2 count];

  uint64_t v4 = sub_1000038F0(@"com.apple.da", @"mobile", @"HTThirdPartyDevSupport");
  unint64_t v5 = v3 | (unint64_t)[v4 count];

  uint64_t v6 = sub_10000DCE8();
  unsigned int v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFStringRef v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ConfigureTailspinForSelfEnableConfig: Other HangTracer enablement modes are ACTIVE, do not attempt to configure tailspin", v10, 2u);
    }

    if (!v3) {
      return 0;
    }
    goto LABEL_9;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "ConfigureTailspinForSelfEnableConfig: Other HangTracer enablement modes are NOT active, attempt to configure tailspin", buf, 2u);
  }

  uint64_t v8 = 1;
  j__ADClientAddValueForScalarKey();
  if ((sub_10000CB98(a1) & 1) == 0)
  {
LABEL_9:
    j__ADClientAddValueForScalarKey();
    return 0;
  }
  return v8;
}

id sub_10000CDB8()
{
  if (qword_10001E550 != -1) {
    dispatch_once(&qword_10001E550, &stru_100018948);
  }
  uint64_t v0 = (void *)qword_10001E548;

  return v0;
}

void sub_10000CE0C(id a1)
{
  qword_10001E548 = (uint64_t)os_log_create("com.apple.hangtracer", "hangtracer_enablement");

  _objc_release_x1();
}

uint64_t sub_10000D6BC(void *a1)
{
  id v1 = a1;
  v2 = +[HTPrefs sharedPrefs];
  unsigned __int8 v3 = [v2 enableLoggingForWidgetRenderer];

  if ((v3 & 1) != 0 || ([v1 containsString:@"WidgetRenderer-Default"] & 1) == 0)
  {
    unint64_t v5 = +[HTPrefs sharedPrefs];
    unsigned __int8 v6 = [v5 enableLoggingForPoster];

    if (v6 & 1) != 0 || ([v1 containsString:@"PosterBoard"])
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      id v7 = [objc_alloc((Class)LSApplicationExtensionRecord) initWithBundleIdentifier:v1 error:0];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = [v7 extensionPointRecord];
        uint64_t v4 = v9;
        if (v9)
        {
          CFStringRef v10 = [v9 identifier];
          unsigned int v11 = [v10 isEqualToString:@"com.apple.posterkit.provider"];

          LODWORD(v4) = (int)(v11 << 31) >> 31;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
  }
  else
  {
    LOBYTE(v4) = 1;
  }

  return v4 & 1;
}

id sub_10000DCE8()
{
  if (qword_10001E560 != -1) {
    dispatch_once(&qword_10001E560, &stru_100018968);
  }
  uint64_t v0 = (void *)qword_10001E558;

  return v0;
}

void sub_10000DD3C(id a1)
{
  qword_10001E558 = (uint64_t)os_log_create("com.apple.hangtracer", "");

  _objc_release_x1();
}

double sub_10000E288()
{
  if (qword_10001E570 != -1) {
    dispatch_once(&qword_10001E570, &stru_100018988);
  }
  return *(double *)&qword_10001E568;
}

void sub_10000E2CC(id a1)
{
  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  *(double *)&qword_10001E568 = (float)((float)((float)info.numer * 0.000001) / (float)info.denom);
}

BOOL sub_10000E31C(int a1, int a2, int a3)
{
  unsigned __int8 v6 = sub_10000DCE8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    LODWORD(v23) = a1;
    WORD2(v23) = 1024;
    *(_DWORD *)((char *)&v23 + 6) = a2;
    WORD5(v23) = 1024;
    HIDWORD(v23) = a3;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "PDSE: determineTodayEnablement: repeatPeriod = %i, enableDurationLengthInDays = %i, CRKeyOffset = %i", buf, 0x14u);
  }

  int v7 = a1 / a2;
  uint64_t v8 = (void *)MGCopyAnswer();
  id v9 = [v8 substringWithRange:a3];
  unsigned int v21 = 0;
  CFStringRef v10 = +[NSScanner scannerWithString:v9];
  [v10 scanHexInt:&v21];

  int v11 = v21 % v7;
  CFStringRef v12 = sub_10000DCE8();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109634;
    LODWORD(v23) = v11;
    WORD2(v23) = 2112;
    *(void *)((char *)&v23 + 6) = v8;
    HIWORD(v23) = 1024;
    int v24 = v21;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "PDSE: determineTodayEnablement: targetEnableDurationNum based off crKey = %i (crKey string = %@ numerical = %u)", buf, 0x18u);
  }

  id v13 = +[NSDate date];
  [v13 timeIntervalSinceReferenceDate];
  int v15 = (int)(v14 / ((double)a2 * 86400.0));

  int v16 = v15 % v7;
  id v17 = sub_10000DCE8();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    sub_10000F678(v15 % v7, v15, v17);
  }

  uint64_t v18 = sub_10000DCE8();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v19 = @"Disable";
    *(_DWORD *)buf = 138412802;
    if (v11 == v16) {
      CFStringRef v19 = @"Enable";
    }
    *(void *)&long long v23 = v19;
    WORD4(v23) = 1024;
    *(_DWORD *)((char *)&v23 + 10) = v11;
    HIWORD(v23) = 1024;
    int v24 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "PDSE: determineTodayEnablement: Should %@ Today, since TargetEnableDurationNum = %i and TodayEnableDurationNum = %i", buf, 0x18u);
  }

  return v11 == v16;
}

uint64_t sub_10000E5C4(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"PDSEHangTracer"])
  {
    uint64_t v2 = 0;
  }
  else if ([v1 isEqualToString:@"PDSESentry"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"PDSECATailspin"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"PDSEHTRateOnly"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"PDSEHTThirdParty"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"PDSEAppLaunch"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"PDSEWorkflowResponsiveness"])
  {
    uint64_t v2 = 6;
  }
  else
  {
    unsigned __int8 v3 = sub_10000DCE8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      id v6 = v1;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PDSE: getCRKeyOffsetForPrefix: Unknown prefix \"%@\"", (uint8_t *)&v5, 0xCu);
    }

    uint64_t v2 = 10;
  }

  return v2;
}

void sub_10000E754(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1000038B8(a1, a2);
  sub_100003D68((void *)&_mh_execute_header, v3, v4, "PDSE: Enable CA Tailspin collection: set setting %@ to TRUE", v5, v6, v7, v8, 2u);
}

void sub_10000E7DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1000038B8(a1, a2);
  sub_100003D68((void *)&_mh_execute_header, v3, v4, "PDSE: Enable CA Tailspin collection: Delete setting %@", v5, v6, v7, v8, 2u);
}

void sub_10000E864(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000E89C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000E8D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000E90C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "PDSE: bad day enablement is still valid", v1, 2u);
}

void sub_10000E950(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 prefixForDefaults];
  uint64_t v6 = sub_1000038B8(a2, (uint64_t)v5);
  int v7 = 138412290;
  uint64_t v8 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "PDSE: Enable HangTracer: set setting %@ to TRUE", (uint8_t *)&v7, 0xCu);
}

void sub_10000EA0C(char a1, char a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "PDSE: PDSEHTThirdParty: determining enabling HT 3rd Party mode with these device settings: (enableForMetricKit=%{BOOL}d enableForLogUpload=%{BOOL}d", (uint8_t *)v3, 0xEu);
}

void sub_10000EA9C()
{
  sub_100007400();
  [v1 prefixForDefaults];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = sub_1000073F0();
  __int16 v4 = sub_1000038B8(v2, v3);
  sub_10000740C();
  sub_100003D68((void *)&_mh_execute_header, v5, v6, "PDSE: Enable Third Party HangTracer: set setting %@ to 0", v7, v8, v9, v10, v11);
}

void sub_10000EB38()
{
  sub_100007400();
  [v1 prefixForDefaults];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = sub_1000073F0();
  __int16 v4 = sub_1000038B8(v2, v3);
  sub_10000740C();
  sub_100003D68((void *)&_mh_execute_header, v5, v6, "PDSE: Enable Third Party HangTracer: set setting %@ to FALSE", v7, v8, v9, v10, v11);
}

void sub_10000EBD4()
{
  sub_100007400();
  [v1 prefixForDefaults];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = sub_1000073F0();
  __int16 v4 = sub_1000038B8(v2, v3);
  sub_10000740C();
  sub_100003D68((void *)&_mh_execute_header, v5, v6, "PDSE: Enable Third Party HangTracer: set setting %@ to TRUE", v7, v8, v9, v10, v11);
}

void sub_10000EC70()
{
  sub_100007400();
  [v1 prefixForDefaults];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = sub_1000073F0();
  __int16 v4 = sub_1000038B8(v2, v3);
  sub_10000740C();
  sub_100003D68((void *)&_mh_execute_header, v5, v6, "PDSE: Enable Third Party HangTracer: set setting %@ to 3600", v7, v8, v9, v10, v11);
}

void sub_10000ED0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1000038B8(a1, a2);
  sub_100003D68((void *)&_mh_execute_header, v3, v4, "PDSE: Enable App Launch Monitoring: setting %@ to TRUE", v5, v6, v7, v8, 2u);
}

void sub_10000ED94(void *a1)
{
  [a1 prefixForDefaults];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = sub_1000073F0();
  uint64_t v4 = sub_1000038B8(v2, v3);
  sub_100003D68((void *)&_mh_execute_header, v5, v6, "PDSE: Enable HangTracer Rate Only: set setting %@ to FALSE", v7, v8, v9, v10, 2u);
}

void sub_10000EE38(void *a1)
{
  [a1 prefixForDefaults];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = sub_1000073F0();
  uint64_t v4 = sub_1000038B8(v2, v3);
  sub_100003D68((void *)&_mh_execute_header, v5, v6, "PDSE: Enable HangTracer Rate Only: set setting %@ to 3600", v7, v8, v9, v10, 2u);
}

void sub_10000EEDC(void *a1)
{
  [a1 prefixForDefaults];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = sub_1000073F0();
  uint64_t v4 = sub_1000038B8(v2, v3);
  sub_100003D68((void *)&_mh_execute_header, v5, v6, "PDSE: Enable HangTracer Rate Only: set setting %@ to TRUE", v7, v8, v9, v10, 2u);
}

void sub_10000EF80(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "HTPrefs: %@ was not found in the %@ domain, a profile, by EPL, by PowerLog Tasking domain, by HT Self Enablement or by HT Sentry Enablement", (uint8_t *)&v3, 0x16u);
}

void sub_10000F008(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412802;
  *(void *)&v3[4] = @"enablementPrefix";
  *(_WORD *)&void v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_10000CB5C((void *)&_mh_execute_header, (uint64_t)a2, a3, "HTPrefs: %@: %@ -> %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *a2);
}

void sub_10000F094()
{
  sub_10000CB7C();
  sub_10000CB8C();
  sub_10000CB5C((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_10000F130()
{
  sub_10000CB7C();
  sub_10000CB8C();
  sub_10000CB5C((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_10000F1CC()
{
  sub_10000CB7C();
  sub_10000CB8C();
  sub_10000CB5C((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_10000F268()
{
  sub_10000CB7C();
  sub_10000CB8C();
  sub_10000CB5C((void *)&_mh_execute_header, v0, v1, "HTPrefs: %@: %@ -> %@");
}

void sub_10000F304(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Preparing prefInitList", v1, 2u);
}

void sub_10000F348()
{
  __assert_rtn("-[HTPrefs setupPrefsWithQueue:]", "HTPrefs.m", 1486, "prefsQueue != NULL");
}

void sub_10000F374()
{
  sub_100007400();
  [v1 prefixForDefaults];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = sub_1000073F0();
  uint64_t v4 = sub_1000038B8(v2, v3);
  sub_10000740C();
  sub_100003D68((void *)&_mh_execute_header, v5, v6, "PDSE: Enable HangTracer: set setting %@ to TRUE", v7, v8, v9, v10, v11);
}

void sub_10000F410()
{
  sub_100007400();
  [v1 prefixForDefaults];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = sub_1000073F0();
  uint64_t v4 = sub_1000038B8(v2, v3);
  sub_10000740C();
  sub_100003D68((void *)&_mh_execute_header, v5, v6, "PDSE: Enable HangTracer: set setting %@ to 0", v7, v8, v9, v10, v11);
}

void sub_10000F4AC()
{
  sub_100007400();
  [v1 prefixForDefaults];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = sub_1000073F0();
  uint64_t v4 = sub_1000038B8(v2, v3);
  sub_10000740C();
  sub_100003D68((void *)&_mh_execute_header, v5, v6, "PDSE: Enable HangTracer: set setting %@ to 3600", v7, v8, v9, v10, v11);
}

void sub_10000F548(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = sub_1000038B8(a1, a2);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "HTSTYE: Enable HTSTYE: set setting %@ to TRUE", (uint8_t *)&v5, 0xCu);
}

void sub_10000F5E0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4 = sub_1000038B8(a1, a2);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "HTWRE: Enable HTWRE: set setting %@ to TRUE", (uint8_t *)&v5, 0xCu);
}

void sub_10000F678(int a1, int a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 1024;
  int v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "PDSE: determineTodayEnablement: Today's EnableDurationNum Within Period = %i (total EnableDurationsSinceRef = %i)", (uint8_t *)v3, 0xEu);
}

uint64_t ADClientAddValueForScalarKey()
{
  return _ADClientAddValueForScalarKey();
}

uint64_t ADClientSetValueForScalarKey()
{
  return _ADClientSetValueForScalarKey();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t AppAnalyticsEnabled()
{
  return _AppAnalyticsEnabled();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyKeyList(applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

uint64_t DiagnosticLogSubmissionEnabled()
{
  return _DiagnosticLogSubmissionEnabled();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

int getrusage(int a1, rusage *a2)
{
  return _getrusage(a1, a2);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t tailspin_buffer_size_set()
{
  return _tailspin_buffer_size_set();
}

uint64_t tailspin_config_apply_sync()
{
  return _tailspin_config_apply_sync();
}

uint64_t tailspin_config_create_with_default_config()
{
  return _tailspin_config_create_with_default_config();
}

uint64_t tailspin_config_free()
{
  return _tailspin_config_free();
}

uint64_t tailspin_enabled_set()
{
  return _tailspin_enabled_set();
}

uint64_t tailspin_full_sampling_period_set()
{
  return _tailspin_full_sampling_period_set();
}

uint64_t tailspin_oncore_sampling_period_set()
{
  return _tailspin_oncore_sampling_period_set();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend___createInternalSettings(void *a1, const char *a2, ...)
{
  return [a1 __createInternalSettings];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addSubsystem_category_(void *a1, const char *a2, ...)
{
  return [a1 addSubsystem:category:];
}

id objc_msgSend_anyClientsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 anyClientsAvailable];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_badDayEnablementDurationDays(void *a1, const char *a2, ...)
{
  return _[a1 badDayEnablementDurationDays];
}

id objc_msgSend_badDayEnablementForHangDurationMSec(void *a1, const char *a2, ...)
{
  return _[a1 badDayEnablementForHangDurationMSec];
}

id objc_msgSend_badDayEnablementForLogCount(void *a1, const char *a2, ...)
{
  return _[a1 badDayEnablementForLogCount];
}

id objc_msgSend_badDayEnablementForPreviousDays(void *a1, const char *a2, ...)
{
  return _[a1 badDayEnablementForPreviousDays];
}

id objc_msgSend_badDayEnablementMinimumBreakDurationDays(void *a1, const char *a2, ...)
{
  return _[a1 badDayEnablementMinimumBreakDurationDays];
}

id objc_msgSend_badDaySecondsBetweenLastEnablementAndReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 badDaySecondsBetweenLastEnablementAndReferenceDate];
}

id objc_msgSend_beginEvent(void *a1, const char *a2, ...)
{
  return _[a1 beginEvent];
}

id objc_msgSend_BOOLProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 BOOLProperty:contextPrefixOut:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_clientClasses(void *a1, const char *a2, ...)
{
  return _[a1 clientClasses];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [a1 containsString:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return [a1 countForObject:x0];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceNow:];
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeIntervalSinceReferenceDate:];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_desiredTailspinConfig(void *a1, const char *a2, ...)
{
  return _[a1 desiredTailspinConfig];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithContentsOfFile:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didDisableDiagnostics(void *a1, const char *a2, ...)
{
  return _[a1 didDisableDiagnostics];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_doubleProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 doubleProperty:x0 contextPrefixOut:&x1];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_durationSeconds(void *a1, const char *a2, ...)
{
  return _[a1 durationSeconds];
}

id objc_msgSend_earlyInitNecessaryPrefs(void *a1, const char *a2, ...)
{
  return _[a1 earlyInitNecessaryPrefs];
}

id objc_msgSend_enableLoggingForPoster(void *a1, const char *a2, ...)
{
  return _[a1 enableLoggingForPoster];
}

id objc_msgSend_enableLoggingForWidgetRenderer(void *a1, const char *a2, ...)
{
  return _[a1 enableLoggingForWidgetRenderer];
}

id objc_msgSend_evaluateSelfEnablement(void *a1, const char *a2, ...)
{
  return _[a1 evaluateSelfEnablement];
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return _[a1 extensionPointRecord];
}

id objc_msgSend_getKillSwitchSettingForPrefix_(void *a1, const char *a2, ...)
{
  return [a1 getKillSwitchSettingForPrefix:];
}

id objc_msgSend_getTimeoutForPrefix_(void *a1, const char *a2, ...)
{
  return [a1 getTimeoutForPrefix:];
}

id objc_msgSend_hangtracerDaemonEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hangtracerDaemonEnabled];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasTimeoutExpiredForPrefix_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "hasTimeoutExpiredForPrefix:");
}

id objc_msgSend_hudEnabled(void *a1, const char *a2, ...)
{
  return _[a1 hudEnabled];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithBundleIdentifier_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleIdentifier:error:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_intProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 intProperty:x0 contextPrefixOut:&x1];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToArray:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return _[a1 isInternal];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedLongLong:];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectProperty_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 objectProperty:x0 matchingSelector:x1 contextPrefixOut:x2];
}

id objc_msgSend_pdseAllowEnableTailspin(void *a1, const char *a2, ...)
{
  return _[a1 pdseAllowEnableTailspin];
}

id objc_msgSend_pdseAppLaunchKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseAppLaunchKillSwitch];
}

id objc_msgSend_pdseAppLaunchPeriodDays(void *a1, const char *a2, ...)
{
  return _[a1 pdseAppLaunchPeriodDays];
}

id objc_msgSend_pdseCATailspinKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseCATailspinKillSwitch];
}

id objc_msgSend_pdseCATailspinPeriodDays(void *a1, const char *a2, ...)
{
  return _[a1 pdseCATailspinPeriodDays];
}

id objc_msgSend_pdseHTBadDayKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseHTBadDayKillSwitch];
}

id objc_msgSend_pdseHTPeriodDays(void *a1, const char *a2, ...)
{
  return _[a1 pdseHTPeriodDays];
}

id objc_msgSend_pdseHTRateOnlyKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseHTRateOnlyKillSwitch];
}

id objc_msgSend_pdseHTRateOnlyPeriodDays(void *a1, const char *a2, ...)
{
  return _[a1 pdseHTRateOnlyPeriodDays];
}

id objc_msgSend_pdseHTThirdPartyKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseHTThirdPartyKillSwitch];
}

id objc_msgSend_pdseHTThirdPartyNoLogUploadPeriodDays(void *a1, const char *a2, ...)
{
  return _[a1 pdseHTThirdPartyNoLogUploadPeriodDays];
}

id objc_msgSend_pdseHTThirdPartyPeriodDays(void *a1, const char *a2, ...)
{
  return _[a1 pdseHTThirdPartyPeriodDays];
}

id objc_msgSend_pdseHangTracerKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseHangTracerKillSwitch];
}

id objc_msgSend_pdseSentryKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseSentryKillSwitch];
}

id objc_msgSend_pdseSentryPeriodDays(void *a1, const char *a2, ...)
{
  return _[a1 pdseSentryPeriodDays];
}

id objc_msgSend_pdseWorkflowResponsivenessKillSwitch(void *a1, const char *a2, ...)
{
  return _[a1 pdseWorkflowResponsivenessKillSwitch];
}

id objc_msgSend_pdseWorkflowResponsivenessPeriodDays(void *a1, const char *a2, ...)
{
  return _[a1 pdseWorkflowResponsivenessPeriodDays];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_prefContextPrefixPriorityOrder(void *a1, const char *a2, ...)
{
  return _[a1 prefContextPrefixPriorityOrder];
}

id objc_msgSend_prefInitList(void *a1, const char *a2, ...)
{
  return _[a1 prefInitList];
}

id objc_msgSend_prefNamed_domain_profile_matchingSelector_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 prefNamed:x0 domain:x1 profile:x2 matchingSelector:x3 contextPrefixOut:x4];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_prefixForDefaults(void *a1, const char *a2, ...)
{
  return _[a1 prefixForDefaults];
}

id objc_msgSend_processLogArchiveWithPath_startDate_endDate_errorOut_(void *a1, const char *a2, ...)
{
  return [a1 processLogArchiveWithPath:x0 startDate:x1 endDate:x2 errorOut:x3];
}

id objc_msgSend_refreshHTPrefs(void *a1, const char *a2, ...)
{
  return _[a1 refreshHTPrefs];
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return [a1 scanHexInt:];
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return [a1 scannerWithString:];
}

id objc_msgSend_setIntervalCompletionProcessingBlock_(void *a1, const char *a2, ...)
{
  return [a1 setIntervalCompletionProcessingBlock:];
}

id objc_msgSend_setMemoryLoggingIntervalSec_(void *a1, const char *a2, ...)
{
  return [a1 setMemoryLoggingIntervalSec:];
}

id objc_msgSend_setShouldPostHTPrefsChangedNotification_(void *a1, const char *a2, ...)
{
  return [a1 setShouldPostHTPrefsChangedNotification:];
}

id objc_msgSend_setSubsystemCategoryFilter_(void *a1, const char *a2, ...)
{
  return [a1 setSubsystemCategoryFilter:];
}

id objc_msgSend_setupPrefsWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 setupPrefsWithQueue:];
}

id objc_msgSend_setupPrefsWithQueue_profilePath_taskingDomainName_hangtracerDomain_setupInternalPrefs_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "setupPrefsWithQueue:profilePath:taskingDomainName:hangtracerDomain:setupInternalPrefs:");
}

id objc_msgSend_sharedPrefs(void *a1, const char *a2, ...)
{
  return _[a1 sharedPrefs];
}

id objc_msgSend_shouldPostHTPrefsChangedNotification(void *a1, const char *a2, ...)
{
  return _[a1 shouldPostHTPrefsChangedNotification];
}

id objc_msgSend_stringProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 stringProperty:x0 contextPrefixOut:x1];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeoutDurationSec(void *a1, const char *a2, ...)
{
  return _[a1 timeoutDurationSec];
}

id objc_msgSend_timeoutPrefNameForPrefix_(void *a1, const char *a2, ...)
{
  return [_objc_msgSend(a1, "timeoutPrefNameForPrefix:");
}

id objc_msgSend_unsignedIntProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntProperty:contextPrefixOut:];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongProperty_contextPrefixOut_(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongProperty:x0 contextPrefixOut:x1];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedLongValue];
}

id objc_msgSend_wantsEnablement(void *a1, const char *a2, ...)
{
  return _[a1 wantsEnablement];
}

id objc_msgSend_willEnableDiagnostics(void *a1, const char *a2, ...)
{
  return _[a1 willEnableDiagnostics];
}

id objc_msgSend_writeEnablementSettings(void *a1, const char *a2, ...)
{
  return _[a1 writeEnablementSettings];
}