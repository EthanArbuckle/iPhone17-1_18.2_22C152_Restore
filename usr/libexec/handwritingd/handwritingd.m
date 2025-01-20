void sub_1000028D0(id a1)
{
  void *v1;
  void *v2;
  id v3;
  uint64_t vars8;

  v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.UIKit"];
  v1 = [v3 objectForKey:@"PKUIPencilHoverPreviewEnabledKey"];

  if (v1)
  {
    v2 = v3;
  }
  else
  {
    [v3 setValue:&__kCFBooleanTrue forKey:@"PKUIPencilHoverPreviewEnabledKey"];
    [v3 setValue:&__kCFBooleanFalse forKey:@"PKHasUserChangedHoverPreviewEnabledSettingKey"];
    v2 = v3;
  }
}

void sub_100002A04(id a1)
{
  qword_10002B0A0 = objc_alloc_init(CHPKSettingsServer);

  _objc_release_x1();
}

void sub_100002DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003500(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100003514(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = [WeakRetained queuedTimestampDate];

  [WeakRetained setQueuedTimestampDate:*(void *)(a1 + 32)];
  if (v3)
  {
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, 5000000000);
    v5 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000035F8;
    block[3] = &unk_1000247A0;
    block[4] = WeakRetained;
    dispatch_after(v4, v5, block);
  }
}

id sub_1000035F8(uint64_t a1)
{
  [*(id *)(a1 + 32) _touchLastSessionTimestampIfNecessary];
  v2 = *(void **)(a1 + 32);

  return [v2 setQueuedTimestampDate:0];
}

Class sub_100003838(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_10002B0B8)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10000398C;
    v4[4] = &unk_100024828;
    v4[5] = v4;
    long long v5 = off_100024810;
    uint64_t v6 = 0;
    qword_10002B0B8 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_10002B0B8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("LSApplicationWorkspace");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_10002B0B0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000398C()
{
  uint64_t result = _sl_dlopen();
  qword_10002B0B8 = result;
  return result;
}

uint64_t sub_100003EB4()
{
  qword_10002B0C0 = objc_opt_new();

  return _objc_release_x1();
}

void sub_100004298(uint64_t a1, void *a2)
{
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v21 = 0x2020000000;
    BOOL v22 = 0;
    BOOL v22 = xpc_activity_set_state(v3, 4);
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    v7 = (id)qword_10002B158;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
      *(_DWORD *)v16 = 138412546;
      CFStringRef v17 = @"com.apple.handwritingd.analytics.scheduledEventsActivity";
      __int16 v18 = 1024;
      int v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Running activity %@, extended=%d", v16, 0x12u);
    }

    if (qword_10002B0D8 != -1) {
      dispatch_once(&qword_10002B0D8, &stru_100024848);
    }
    v9 = qword_10002B0D0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004654;
    block[3] = &unk_100024898;
    v10 = v3;
    uint64_t v11 = *(void *)(a1 + 32);
    v13 = v10;
    p_long long buf = &buf;
    uint64_t v15 = v11;
    dispatch_async(v9, block);

    _Block_object_dispose(&buf, 8);
  }
  else if (!state)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    long long v5 = (id)qword_10002B158;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = @"com.apple.handwritingd.analytics.scheduledEventsActivity";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Checking in activity %@", (uint8_t *)&buf, 0xCu);
    }

    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 1);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_1_DAY);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_15_MIN);
    xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GRACE_PERIOD, XPC_ACTIVITY_INTERVAL_1_HOUR);
    xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRE_SCREEN_SLEEP, 1);
    xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REQUIRES_CLASS_C, 1);
    xpc_activity_set_criteria(v3, v6);
  }
}

void sub_1000045F0(id a1)
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.handwritingd.analytics.scheduledEventsQueue", v3);
  v2 = (void *)qword_10002B0D0;
  qword_10002B0D0 = (uint64_t)v1;
}

void sub_100004654(uint64_t a1)
{
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3);
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    v2 = (id)qword_10002B158;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v9 = @"com.apple.handwritingd.analytics.scheduledEventsActivity";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "xpc activity should be defered, defering %@", buf, 0xCu);
    }
  }
  else
  {
    v3 = [*(id *)(a1 + 48) sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000047C8;
    v6[3] = &unk_100024870;
    long long v5 = *(_OWORD *)(a1 + 32);
    id v4 = (id)v5;
    long long v7 = v5;
    [v3 dispatchScheduledEventsWithCompletionBlock:v6];

    v2 = v7;
  }
}

void sub_1000047C8(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    v2 = (id)qword_10002B158;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v4 = 138412546;
      CFStringRef v5 = @"com.apple.handwritingd.analytics.scheduledEventsActivity";
      __int16 v6 = 1024;
      int v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Done running activity %@, extended=%d", (uint8_t *)&v4, 0x12u);
    }
  }
}

void sub_100004D08(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  CFStringRef v5 = [a3 objectForKey:];
  if (v5) {
    [*(id *)(a1 + 32) setObject:v5 forKey:v6];
  }
}

uint64_t sub_100004FA8(uint64_t a1)
{
  [*(id *)(a1 + 32) dispatchSettingsEvents];
  [*(id *)(a1 + 32) dispatchLifecycleEvents];
  [*(id *)(a1 + 32) dispatchDailyUsageEvents];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

id sub_1000050A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) settingsDictionary];
}

void sub_100005460(uint64_t a1, void *a2)
{
  id v11 = a2;
  uint64_t v3 = kCommonMetricQueryTimeFrame;
  int v4 = *(void **)(a1 + 32);
  CFStringRef v5 = [*(id *)(a1 + 40) loadedDate];
  id v6 = [v4 aggregatedCountFromTransientCounterWithName:v11 forNumberOfDays:v3 fromLoadedDate:v5];

  int v7 = [v6 intValue];
  int v8 = *(void **)(a1 + 48);
  if (v7 < 1)
  {
    CFStringRef v9 = [v8 objectForKeyedSubscript:v11];
    if ([v9 intValue] == 1) {
      v10 = &off_100025EB8;
    }
    else {
      v10 = &off_100025EA0;
    }
    [*(id *)(a1 + 48) setObject:v10 forKeyedSubscript:v11];
  }
  else
  {
    [v8 setObject:&off_100025EB8 forKeyedSubscript:v11];
  }
}

id sub_100005554(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100005808(void *a1, void *a2, void *a3)
{
  int v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  int v7 = (void *)a1[7];
  id v8 = a3;
  id v9 = a2;
  id v10 = [v7 loadedDate];
  [v4 dispatchLifecycleEventForFeature:v9 denominatorKey:v8 inputModeIdentifier:v5 values:v6 sinceDate:v10];
}

id sub_100005B44(uint64_t a1)
{
  v4[0] = @"inputMode";
  v4[1] = @"lifecycleValue";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

int main(int argc, const char **argv, const char **envp)
{
  bzero(v18, 0x400uLL);
  if (!_set_user_dir_suffix() || !confstr(65537, v18, 0x400uLL))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v13 = *__error();
    *(_DWORD *)long long buf = 67109120;
    int v17 = v13;
    v14 = "failed to initialize temporary directory: %{darwin.errno}d";
    goto LABEL_18;
  }
  if (!realpath_DARWIN_EXTSN(v18, 0))
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      goto LABEL_19;
    }
    int v15 = *__error();
    *(_DWORD *)long long buf = 67109120;
    int v17 = v15;
    v14 = "failed to resolve temporary directory: %{darwin.errno}d";
LABEL_18:
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v14, buf, 8u);
LABEL_19:
    exit(1);
  }
  int v5 = MGGetBoolAnswer();
  if (argc >= 2 && v5)
  {
    if (argc != 2)
    {
      puts("Usage: ./handwritingd");
      puts("\t--clear-inventory");
      return 0;
    }
    uint64_t v6 = +[NSString stringWithCString:argv[1] encoding:4];
    if ([v6 isEqualToString:@"--clear-inventory"])
    {
      printf("Clearing inventory status: %d\n", +[CHSynthesisStyleInventory clear]);
    }
    else
    {
      puts("Usage: ./handwritingd");
      puts("\t--clear-inventory");
    }
  }
  else
  {
    signal(15, (void (__cdecl *)(int))1);
    uint64_t v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
    dispatch_source_set_event_handler(v6, &stru_1000249C8);
    dispatch_resume(v6);
    id v8 = +[CHRemoteRecognitionServer sharedRemoteRecognitionServer];
    [v8 resumeConnectionIfIdle];
    id v9 = +[CHPKSettingsServer sharedSettingsServer];
    [v9 resumeConnectionIfIdle];
    id v10 = +[CHPKAnalyticsServer sharedAnalyticsServer];
    [v10 resumeConnectionIfIdle];
    +[CHPKPersistentAnalyticsController registerScheduledEventsActivity];

    id v11 = +[NSRunLoop mainRunLoop];
    [v11 run];
  }
  return 0;
}

void sub_100006354(id a1)
{
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  uint64_t v1 = (id)qword_10002B118;
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Received SIGTERM, terminating process immediately.", v2, 2u);
  }

  exit(0);
}

void sub_1000064B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000066B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000067D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000069EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100006A40(uint64_t a1)
{
  [*(id *)(a1 + 32) _cleanupCachedRecognizersTargetLifetime:0];
  uint64_t result = (uint64_t)[*(id *)(a1 + 32) _hasCachedRecognizers];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void sub_100006B2C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006B40(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006CA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000713C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_1000075B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  int v7 = *(void **)(a1 + 32);
  if (v7) {
    [v7 doubleValue];
  }
  else {
    [v6 targetIdleLifetime];
  }
  double v9 = v8;
  double v10 = *(double *)(a1 + 48);
  [v6 lastActiveTimestamp];
  double v12 = v11;
  if (![v6 activeRequestCount] && v10 - v12 >= v9 + -2.0)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    int v13 = (id)qword_10002B138;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      id v15 = v5;
      __int16 v16 = 2048;
      double v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Staging recognizer for eviction with key: %@, idle lifetime = %fs", (uint8_t *)&v14, 0x16u);
    }

    [*(id *)(a1 + 40) addObject:v5];
  }
}

void sub_10000771C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100007848(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  [v2 _cleanupCachedRecognizersTargetLifetime:v3];

  uint64_t result = (uint64_t)[*(id *)(a1 + 32) _hasCachedRecognizers];
  if ((result & 1) == 0)
  {
    id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v5();
  }
  return result;
}

void sub_1000078D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007B18(_Unwind_Exception *a1)
{
  id v6 = v5;

  _Unwind_Resume(a1);
}

void sub_100007B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id CHOSLogForCategory(int a1)
{
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  v2 = (void *)qword_10002B118[a1];

  return v2;
}

void sub_100007D30(id a1)
{
  os_log_t v1 = os_log_create("com.apple.corehandwriting", "General");
  v2 = (void *)qword_10002B118;
  qword_10002B118 = (uint64_t)v1;

  os_log_t v3 = os_log_create("com.apple.corehandwriting", "Recognizer");
  int v4 = (void *)qword_10002B120;
  qword_10002B120 = (uint64_t)v3;

  os_log_t v5 = os_log_create("com.apple.corehandwriting", "RecognitionSession");
  id v6 = (void *)qword_10002B128;
  qword_10002B128 = (uint64_t)v5;

  os_log_t v7 = os_log_create("com.apple.corehandwriting", "StrokeGrouping");
  double v8 = (void *)qword_10002B130;
  qword_10002B130 = (uint64_t)v7;

  os_log_t v9 = os_log_create("com.apple.corehandwriting", "ClutterFiltering");
  double v10 = (void *)qword_10002B140;
  qword_10002B140 = (uint64_t)v9;

  os_log_t v11 = os_log_create("com.apple.corehandwriting", "RemoteRecognizer");
  double v12 = (void *)qword_10002B138;
  qword_10002B138 = (uint64_t)v11;

  os_log_t v13 = os_log_create("com.apple.corehandwriting", "TextCorrectionRecognizer");
  int v14 = (void *)qword_10002B148;
  qword_10002B148 = (uint64_t)v13;

  os_log_t v15 = os_log_create("com.apple.corehandwriting", "CoreHandwritingSignPosts");
  __int16 v16 = (void *)qword_10002B150;
  qword_10002B150 = (uint64_t)v15;

  os_log_t v17 = os_log_create("com.apple.corehandwriting", "Synthesizer");
  __int16 v18 = (void *)qword_10002B160;
  qword_10002B160 = (uint64_t)v17;

  os_log_t v19 = os_log_create("com.apple.corehandwriting", "TextTransform");
  v20 = (void *)qword_10002B168;
  qword_10002B168 = (uint64_t)v19;

  os_log_t v21 = os_log_create("com.apple.corehandwriting", "LineWrapping");
  BOOL v22 = (void *)qword_10002B170;
  qword_10002B170 = (uint64_t)v21;

  os_log_t v23 = os_log_create("com.apple.corehandwriting", "StrokeClassification");
  v24 = (void *)qword_10002B178;
  qword_10002B178 = (uint64_t)v23;

  qword_10002B180 = (uint64_t)os_log_create("com.apple.corehandwriting", "SessionTracker");

  _objc_release_x1();
}

id sub_100007ED4(void *a1)
{
  id v1 = a1;
  v2 = +[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", [v1 processIdentifier]);
  os_log_t v3 = +[RBSProcessHandle handleForIdentifier:v2 error:0];

  int v4 = [v3 bundle];
  os_log_t v5 = [v4 identifier];

  return v5;
}

void sub_100007F80(_Unwind_Exception *a1)
{
  int v4 = v3;

  _Unwind_Resume(a1);
}

void sub_100007FA4(_Unwind_Exception *a1)
{
  os_log_t v3 = v2;

  _Unwind_Resume(a1);
}

void sub_100007FBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000808C()
{
  qword_10002B0E8 = objc_opt_new();

  return _objc_release_x1();
}

void sub_100008398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000083AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CHRemoteRecognitionServer;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100008480(void *a1)
{
}

void sub_100008598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000085AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008A18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  os_log_t v13 = v12;

  _Unwind_Resume(a1);
}

void sub_100008B6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100008B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100008CF8(_Unwind_Exception *a1)
{
  id v6 = v3;

  _Unwind_Resume(a1);
}

void sub_100008D1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008D30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008EC8(_Unwind_Exception *a1)
{
  os_log_t v7 = v4;

  _Unwind_Resume(a1);
}

void sub_100009188(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009444(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000948C(id a1)
{
  if (os_variant_has_internal_diagnostics()) {
    +[NSSet setWithObjects:@"com.apple.mobilenotes", @"com.apple.freeform", @"com.apple.LiveInk", 0];
  }
  else {
  qword_10002B0F8 = +[NSSet setWithObjects:@"com.apple.mobilenotes", @"com.apple.freeform", 0, v1];
  }

  _objc_release_x1();
}

void sub_1000096D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000096EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000096FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009870(_Unwind_Exception *a1)
{
  id v6 = v3;

  _Unwind_Resume(a1);
}

void sub_100009894(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000098A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009A20(_Unwind_Exception *a1)
{
  id v6 = v3;

  _Unwind_Resume(a1);
}

void sub_100009A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009A58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009B90(uint64_t a1)
{
  if ([*(id *)(a1 + 32) intValue] == 1)
  {
    [*(id *)(*(void *)(a1 + 40) + 56) increment];
  }
  else if ([*(id *)(a1 + 32) intValue])
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    v2 = (id)qword_10002B118;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    {
      id v3 = [*(id *)(a1 + 32) integerValue];
      int v6 = 134217984;
      id v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "handleSessionStateUpdate got unknown state=%li", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    [*(id *)(*(void *)(a1 + 40) + 56) decrement];
    if (([*(id *)(*(void *)(a1 + 40) + 56) hasActiveSessions] & 1) == 0) {
      [*(id *)(a1 + 40) optimizeResourceUsage];
    }
  }
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  int v4 = (id)qword_10002B180;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [*(id *)(*(void *)(a1 + 40) + 56) counter];
    int v6 = 67109120;
    LODWORD(v7) = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Number of active sessions: %i", (uint8_t *)&v6, 8u);
  }
}

void sub_100009D48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009E30(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009ED0(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(*(void *)(a1 + 32) + 56) hasActiveSessions];
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  id v3 = (id)qword_10002B180;
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      unsigned int v5 = [*(id *)(*(void *)(a1 + 32) + 56) counter];
      v8[0] = 67109120;
      v8[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Not triggering optimizeResourceUsage. There are %i active sessions.", (uint8_t *)v8, 8u);
    }
  }
  else
  {
    if (v4)
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Triggering optimizeResourceUsage", (uint8_t *)v8, 2u);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = a1 + 32;
    [*(id *)(v7 + 64) optimizeResourceUsage];
    [*(id *)(*(void *)v6 + 112) optimizeResourceUsage];
    [*(id *)(*(void *)v6 + 72) optimizeResourceUsage];
    [*(id *)(*(void *)v6 + 80) optimizeResourceUsage];
  }
}

void sub_10000A02C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A0FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A248(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A408(id a1)
{
  qword_10002B108 = objc_alloc_init(CHPKAnalyticsServer);

  _objc_release_x1();
}

void sub_10000A694(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000A838(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000A848(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000AA34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AB70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AD6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AF0C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B01C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B034(uint64_t a1)
{
  unsigned __int8 v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = 0;
  unsigned int v5 = [v2 isValidRemoteRequest:v3 bundleIdentifier:v4 error:&v7];
  id v6 = v7;
  if (v5) {
    [*(id *)(a1 + 32) _handleValidRecognitionRequest:*(void *)(a1 + 40) withReply:*(void *)(a1 + 56)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10000B0BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B2C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B6F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B720(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B738(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B750(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B764(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B788(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B7BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B7D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B7E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B7FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B80C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B8DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B8F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000B900(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000C7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,void *a37,void *a38)
{
  _Unwind_Resume(a1);
}

id sub_10000C934(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v18 = a4;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(*(void *)(a1 + 48) + 56) transientPhraseLexicon];
  id v11 = [*(id *)(*(void *)(a1 + 48) + 56) vocabulary];
  double v12 = [*(id *)(*(void *)(a1 + 48) + 56) textReplacements];
  os_log_t v13 = [*(id *)(*(void *)(a1 + 48) + 56) addressBookLexicon];
  +[CHCachedRecognizerManager configureRecognizer:v7 forRequest:v9 locale:v6 transientLexicon:v8 transientPhraseLexicon:v10 vocabulary:v11 textReplacements:v12 addressBookLexicon:v13];

  int v14 = [*(id *)(a1 + 40) options];
  os_log_t v15 = +[NSMutableDictionary dictionaryWithDictionary:v14];

  [v15 setObject:&__kCFBooleanFalse forKeyedSubscript:CHPostProcessingStepOptionAdjustColumns];
  __int16 v16 = [v7 _postprocessingMergedRecognitionResult:v18 options:v15];

  return v16;
}

void sub_10000CAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10000CAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

id sub_10000CB40(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v17 = a4;
  id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = [*(id *)(*(void *)(a1 + 48) + 56) transientPhraseLexicon];
  id v11 = [*(id *)(*(void *)(a1 + 48) + 56) vocabulary];
  double v12 = [*(id *)(*(void *)(a1 + 48) + 56) textReplacements];
  os_log_t v13 = [*(id *)(*(void *)(a1 + 48) + 56) addressBookLexicon];
  +[CHCachedRecognizerManager configureRecognizer:v7 forRequest:v9 locale:v6 transientLexicon:v8 transientPhraseLexicon:v10 vocabulary:v11 textReplacements:v12 addressBookLexicon:v13];

  int v14 = [*(id *)(a1 + 40) options];
  os_log_t v15 = [v7 _changeableColumnCountUpdatedResult:v17 options:v14];

  return v15;
}

void sub_10000CC88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10000CCA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10000CCD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10000CCEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10000CE4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D2C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10000D39C(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) _buildMultiLingualResultForRequest:*(void *)(a1 + 40) recognitionLocales:*(void *)(a1 + 48) recognizersByLocale:*(void *)(a1 + 56) statisticsByLocale:*(void *)(a1 + 64)];
  uint64_t v3 = [*(id *)(a1 + 32) serverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D4B0;
  block[3] = &unk_100024BF8;
  void block[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 72);
  id v9 = v2;
  id v10 = v4;
  id v5 = v2;
  dispatch_async(v3, block);
}

void sub_10000D4A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000D4B0(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 88);
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 88)) {
    [*(id *)(v2 + 72) clearCache];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id obj = *(id *)(a1 + 40);
  id v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v15;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 8 * (void)v5);
        id v7 = *(void **)(a1 + 32);
        id v8 = (void *)v7[6];
        uint64_t v9 = *(void *)(a1 + 48);
        id v10 = [v7 serverQueue];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_10000D6BC;
        v13[3] = &unk_100024B10;
        v13[4] = *(void *)(a1 + 32);
        [v8 checkInRecognizerForRequest:v9 locale:v6 onQueue:v10 idleCallbackBlock:v13];

        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_10000D68C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

id sub_10000D6BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIdle];
}

void sub_10000D868(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D884(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000D898(id *a1)
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v3 = v2;
  uint64_t v4 = [a1[5] declaredVariables];
  [a1[4] setDeclaredVariables:v4];

  id v5 = [a1[5] locales];
  [a1[4] setLocales:v5];

  id v6 = a1[4];
  id v7 = [a1[5] drawing];
  id v8 = [a1[5] options];
  uint64_t v9 = [v6 mathRecognitionResultForDrawing:v7 options:v8 shouldCancel:0];

  +[NSDate timeIntervalSinceReferenceDate];
  double v11 = v10;
  v27[0] = @"inputStrokeCount";
  double v12 = [a1[5] drawing];
  os_log_t v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 strokeCount]);
  v27[1] = @"outputStringLength";
  v28[0] = v13;
  long long v14 = [v9 topTranscription];
  long long v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 length]);
  v28[1] = v15;
  long long v16 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];

  long long v17 = [a1[6] modelPowerLogger];
  [v17 logModelInference:2 startTimestamp:v16 endTimestamp:v3 data:v11];

  id v18 = [a1[6] serverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DBF0;
  block[3] = &unk_100024BD0;
  int8x16_t v22 = *(int8x16_t *)(a1 + 5);
  id v19 = (id)v22.i64[0];
  int8x16_t v24 = vextq_s8(v22, v22, 8uLL);
  id v20 = a1[7];
  id v25 = v9;
  id v26 = v20;
  id v21 = v9;
  dispatch_async(v18, block);
}

void sub_10000DB44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000DBF0(void *a1)
{
  --*(void *)(a1[4] + 88);
  uint64_t v2 = a1[4];
  if (!*(void *)(v2 + 88))
  {
    [*(id *)(v2 + 72) clearCache];
    uint64_t v2 = a1[4];
  }
  double v3 = *(void **)(v2 + 48);
  uint64_t v4 = a1[5];
  id v5 = [(id)v2 serverQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DD04;
  v7[3] = &unk_100024B10;
  v7[4] = a1[4];
  [v3 checkInRecognizerForRequest:v4 locale:0 onQueue:v5 idleCallbackBlock:v7];

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void sub_10000DCF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000DD04(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIdle];
}

void sub_10000DFD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E410(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, _Unwind_Exception *exception_object, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_10000E6F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E73C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E75C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E778(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E790(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E7A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E7C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E7D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E7E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E9C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E9E0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000E9FC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v22 = 0;
  unsigned int v5 = [v2 isValidRemoteRequest:v3 bundleIdentifier:v4 error:&v22];
  id v6 = v22;
  if (v5)
  {
    id v7 = *(void **)(a1 + 40);
    id v8 = *(void **)(*(void *)(a1 + 32) + 48);
    uint64_t v9 = [v7 locales];
    double v10 = [v9 firstObject];
    double v11 = [v8 checkOutRecognizerForTextRequest:v7 locale:v10];

    [*(id *)(a1 + 32) setDirty];
    double v12 = *(NSObject **)(a1 + 56);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000EBE4;
    v16[3] = &unk_100024BF8;
    id v17 = v11;
    id v18 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 64);
    uint64_t v14 = *(void *)(a1 + 32);
    id v19 = v13;
    uint64_t v20 = v14;
    id v21 = *(id *)(a1 + 72);
    id v15 = v11;
    dispatch_async(v12, v16);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
}

void sub_10000EB84(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EB98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EBB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EBC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EBD4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EBE4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 locales];
  unsigned int v5 = [v4 firstObject];
  +[CHCachedRecognizerManager configureRecognizer:v2 forRequest:v3 locale:v5];

  id v6 = [*(id *)(a1 + 40) options];
  id v7 = [v6 objectForKey:CHRecognitionOptionTextBefore];

  id v8 = *(void **)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 48);
  id v21 = 0;
  double v10 = [v8 bestTranscriptionPathsForTokenizedResult:v9 scores:&v21 history:v7];
  id v11 = v21;
  double v12 = [*(id *)(a1 + 56) serverQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000EDD4;
  v16[3] = &unk_100024BF8;
  void v16[4] = *(void *)(a1 + 56);
  id v17 = *(id *)(a1 + 40);
  id v13 = *(id *)(a1 + 64);
  id v19 = v11;
  id v20 = v13;
  id v18 = v10;
  id v14 = v11;
  id v15 = v10;
  dispatch_async(v12, v16);
}

void sub_10000ED88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000ED98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EDAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EDBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000EDD4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v4 = [v2 locales];
  unsigned int v5 = [v4 firstObject];
  id v6 = [*(id *)(a1 + 32) serverQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_10000EF10;
  v8[3] = &unk_100024B10;
  v8[4] = *(void *)(a1 + 32);
  [v3 checkInRecognizerForRequest:v2 locale:v5 onQueue:v6 idleCallbackBlock:v8];

  return (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
}

void sub_10000EED4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EEEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EF00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000EF10(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIdle];
}

void sub_10000F018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F030(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v7 = 0;
  unsigned int v5 = [v2 isValidRemoteRequest:v3 bundleIdentifier:v4 error:&v7];
  id v6 = v7;
  if (v5) {
    [*(id *)(a1 + 32) _handleValidSketchRecognitionRequest:*(void *)(a1 + 40) withReply:*(void *)(a1 + 56)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10000F0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F258(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000F288(uint64_t a1)
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v3 = v2;
  uint64_t v4 = *(void **)(a1 + 32);
  unsigned int v5 = [*(id *)(a1 + 40) drawing];
  id v6 = [*(id *)(a1 + 40) options];
  id v7 = [v4 sketchRecognitionResultsForDrawing:v5 options:v6 shouldCancel:0];

  +[NSDate timeIntervalSinceReferenceDate];
  double v9 = v8;
  CFStringRef v23 = @"inputPointCount";
  double v10 = [*(id *)(a1 + 40) drawing];
  id v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 pointCount]);
  int8x16_t v24 = v11;
  double v12 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];

  id v13 = [*(id *)(a1 + 48) modelPowerLogger];
  [v13 logModelInference:12 startTimestamp:v12 endTimestamp:v3 data:v9];

  id v14 = [*(id *)(a1 + 48) serverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000F520;
  block[3] = &unk_100024BD0;
  int8x16_t v18 = *(int8x16_t *)(a1 + 40);
  id v15 = (id)v18.i64[0];
  int8x16_t v20 = vextq_s8(v18, v18, 8uLL);
  id v16 = *(id *)(a1 + 56);
  id v21 = v7;
  id v22 = v16;
  id v17 = v7;
  dispatch_async(v14, block);
}

void sub_10000F4AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000F520(void *a1)
{
  double v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  uint64_t v4 = (void *)v2[6];
  unsigned int v5 = [v2 serverQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000F600;
  v7[3] = &unk_100024B10;
  v7[4] = a1[4];
  [v4 checkInRecognizerForRequest:v3 locale:0 onQueue:v5 idleCallbackBlock:v7];

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void sub_10000F5F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000F600(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIdle];
}

void sub_10000F690(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[6];
  uint64_t v4 = [v2 serverQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_10000F750;
  v5[3] = &unk_100024B10;
  v5[4] = *(void *)(a1 + 32);
  [v3 optimizeResourceUsageWithTimeout:v4 onQueue:v5 idleCallbackBlock:5.0];
}

void sub_10000F740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000F750(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIdle];
}

uint64_t sub_10000F8E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000F8F8(uint64_t a1)
{
}

uint64_t sub_10000F900(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [*(id *)(a1 + 40) modelPowerLogger];
    id v2 = [v13 logModelLoaded:[*(id *)(a1 + 32) modelIdentifier]];
LABEL_5:
    id v3 = v13;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = [*(id *)(a1 + 40) modelPowerLogger];
    id v2 = [v13 logModelUnloaded:[*(id *)(a1 + 32) modelIdentifier]];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = *(id *)(a1 + 32);
    uint64_t v4 = [*(id *)(a1 + 40) modelPowerLogger];
    id v5 = [v14 modelIdentifier];
    [v14 start];
    double v7 = v6;
    [v14 end];
    double v9 = v8;
    double v10 = [v14 data];
    [v4 logModelInference:v5 startTimestamp:v10 endTimestamp:v7 data:v9];

    id v3 = v14;
  }
  else
  {
    id v2 = [(id)objc_opt_class() invalidInputErrorWithDescription:@"Invalid Power Logging request" failureReason:@"Unknown subclass" recoverySuggestion:0 errorCode:-1006];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v3 = *(id *)(v11 + 40);
    *(void *)(v11 + 40) = v2;
  }
LABEL_6:

  return _objc_release_x1(v2, v3);
}

void sub_10000FAB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FAE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FAF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FB0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000FC4C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FFB0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FFD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000FFEC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010130(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010160(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010194(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000107F0(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) hasIdleLifetimeElapsed:*(double *)(a1 + 40)];
  id v3 = *(uint64_t **)(a1 + 32);
  if (v3[8] > 0 || v2 == 0)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v5 = (id)qword_10002B160;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 64);
      int v7 = 134218240;
      uint64_t v8 = v6;
      __int16 v9 = 1024;
      unsigned int v10 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Did not evict synthesizer. activeRequestCount=%lu, hasIdleLifetimeElapsed=%i", (uint8_t *)&v7, 0x12u);
    }
  }
  else
  {
    [v3 evictTextSynthesizer];
  }
}

void sub_100010A44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100010E64(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)CHSynthesisStyleInventory);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 88);
  *(void *)(v3 + 88) = v2;

  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  id v5 = (id)qword_10002B160;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Loaded style inventory", v6, 2u);
  }
}

void sub_100011178(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) hasStyleInventoryIdleLifetimeElapsed:*(double *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(uint64_t *)(v3 + 96) > 0 || v2 == 0)
  {
    unsigned int v5 = v2;
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    uint64_t v6 = (id)qword_10002B160;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 96);
      int v11 = 134218240;
      uint64_t v12 = v7;
      __int16 v13 = 1024;
      unsigned int v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Did not evict style inventory. activeStyleInventoryRequestCount=%lu, hasIdleLifetimeElapsed=%i", (uint8_t *)&v11, 0x12u);
    }
  }
  else
  {
    *(void *)(v3 + 96) = 0;
    [*(id *)(a1 + 32) saveStyleInventoryIfNeeded];
    uint64_t v8 = *(void *)(a1 + 32);
    __int16 v9 = *(void **)(v8 + 88);
    if (v9)
    {
      if (qword_10002B188 != -1) {
        dispatch_once(&qword_10002B188, &stru_100024A60);
      }
      unsigned int v10 = (id)qword_10002B160;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Evicted style inventory", (uint8_t *)&v11, 2u);
      }

      uint64_t v8 = *(void *)(a1 + 32);
      __int16 v9 = *(void **)(v8 + 88);
    }
    *(void *)(v8 + 88) = 0;

    [*(id *)(a1 + 32) evictTextSynthesizer];
  }
}

void sub_1000113C4(uint64_t a1)
{
  unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 88) lastSavedDate];
  [v2 timeIntervalSinceNow];
  double v4 = v3;

  if (v4 <= -60.0)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    unsigned int v5 = (id)qword_10002B160;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Sending message to save the style inventory if needed", v6, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 88) saveIfNeeded];
  }
}

void sub_1000114B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100011548(uint64_t a1)
{
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  unsigned int v2 = (id)qword_10002B160;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Sending message to save the style inventory if needed", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 88) saveIfNeeded];
}

void sub_100011744(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011758(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25)
{
  _Unwind_Resume(a1);
}

void sub_100011D5C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  [*(id *)(a1 + 32) addObject:];
  if ((unint64_t)[*(id *)(a1 + 32) count] >= *(void *)(a1 + 40)) {
    *a4 = 1;
  }
}

void sub_100011DCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100011E7C(uint64_t a1)
{
  [*(id *)(a1 + 32) checkOutTextSynthesizer];
  [*(id *)(a1 + 32) checkOutStyleInventory];
  unsigned int v2 = [*(id *)(a1 + 32) lowPriorityQueue];
  if (!v2)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    double v3 = (id)qword_10002B118[0];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "A valid queue is required to run style inventory requests", buf, 2u);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011F9C;
  block[3] = &unk_100024B10;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void sub_100011F9C(uint64_t a1)
{
  unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 88) samplesWithoutStylePrediction];
  id v3 = [v2 count];

  uint64_t v4 = vcvtps_s32_f32((float)(uint64_t)v3 / 10.0);
  if (v4 >= 1)
  {
    do
    {
      [*(id *)(a1 + 32) _updateStylePredictionsSingleBatch:10];
      --v4;
    }
    while (v4);
  }
  unsigned int v5 = [*(id *)(a1 + 32) serverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012098;
  block[3] = &unk_100024B10;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v5, block);
}

void sub_100012088(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100012098(uint64_t a1)
{
  [*(id *)(a1 + 32) checkInTextSynthesizer];
  unsigned int v2 = *(void **)(a1 + 32);

  return [v2 checkInStyleInventory];
}

void sub_100012178(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012198(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,void *a32)
{
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);

  _Unwind_Resume(a1);
}

void sub_1000125FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100012614(uint64_t a1)
{
  [*(id *)(a1 + 32) checkOutStyleInventory];
  +[NSDate timeIntervalSinceReferenceDate];
  double v3 = v2;
  if (!*(void *)(*(void *)(a1 + 32) + 88))
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    uint64_t v7 = (id)qword_10002B160;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CHRemoteSynthesisRequestHandler: not triggering character synthesis. Inventory is not available.", (uint8_t *)&v16, 2u);
    }
LABEL_14:

    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
      return [*(id *)(a1 + 32) checkInStyleInventory];
    }
    goto LABEL_15;
  }
  uint64_t v4 = [*(id *)(a1 + 40) options];
  id v5 = [v4 synthesizeCharacterInventoryBehavior];

  uint64_t v6 = *(void *)(a1 + 32);
  if (v5 == (id)2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [(id)v6 _isReadyForCharacterInventorySynthesis];
    if (v3 - *(double *)(*(void *)(a1 + 32) + 112) <= 600.0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      if (qword_10002B188 != -1) {
        dispatch_once(&qword_10002B188, &stru_100024A60);
      }
      uint64_t v7 = (id)qword_10002B160;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        double v13 = v3 - *(double *)(*(void *)(a1 + 32) + 112);
        int v16 = 134217984;
        double v17 = v13;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "CHRemoteSynthesisRequestHandler: forced character synthesis is not triggering. We have in flight synthesis right now. Last run was triggered %f seconds ago", (uint8_t *)&v16, 0xCu);
      }
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      [*(id *)(*(void *)(a1 + 32) + 88) cleanupFastPathCharacters];
      if (qword_10002B188 != -1) {
        dispatch_once(&qword_10002B188, &stru_100024A60);
      }
      uint64_t v7 = (id)qword_10002B160;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
          *(double *)&CFStringRef v8 = COERCE_DOUBLE(@"triggering");
        }
        else {
          *(double *)&CFStringRef v8 = COERCE_DOUBLE(@"not triggering due to insufficent coverage in style inventory");
        }
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
          CFStringRef v9 = @"YES";
        }
        else {
          CFStringRef v9 = @"NO";
        }
        int v16 = 138412546;
        double v17 = *(double *)&v8;
        __int16 v18 = 2112;
        CFStringRef v19 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CHRemoteSynthesisRequestHandler: forced character synthesis is %@. Resynthesize all = %@. Cleanup character inventory.", (uint8_t *)&v16, 0x16u);
      }
    }
    goto LABEL_14;
  }
  if (v3 - *(double *)(v6 + 112) <= 600.0)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    uint64_t v7 = (id)qword_10002B160;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      double v14 = v3 - *(double *)(*(void *)(a1 + 32) + 112);
      int v16 = 134217984;
      double v17 = v14;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Not triggering character synthesis. Last run was triggered %f seconds ago", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_14;
  }
  [*(id *)(v6 + 88) getLastCharacterStyleTimestamp];
  if (v3 - v12 <= 600.0)
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    uint64_t v7 = (id)qword_10002B160;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(*(void *)(a1 + 32) + 88) getLastCharacterStyleTimestamp];
      int v16 = 134217984;
      double v17 = v3 - v15;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Not triggering character synthesis, last update was %f seconds ago", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_14;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(a1 + 32) _isReadyForCharacterInventorySynthesis];
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    return [*(id *)(a1 + 32) checkInStyleInventory];
  }
LABEL_15:
  *(double *)(*(void *)(a1 + 32) + 112) = v3;
  [*(id *)(a1 + 32) checkOutTextSynthesizer];
  [*(id *)(a1 + 32) checkOutStyleInventory];
  [*(id *)(*(void *)(a1 + 32) + 88) getLastCharacterStyleTimestamp];
  if (v3 - v10 > 604800.0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  return [*(id *)(a1 + 32) checkInStyleInventory];
}

void sub_100012AF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012B00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100012B14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v31 = a5;
  v28 = a6;
  v29 = [*(id *)(*(void *)(a1 + 32) + 88) styleSamplesForInputSample:0 prompt:a2 samplingAlgorithm:a3 maxNumOfSamples:a4];
  if (![v29 count])
  {
    int v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v11
      || ([*(id *)(*(void *)(a1 + 32) + 88) styleSampleForInputSample:0 prompt:@"qwertyuioplikjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM" samplingAlgorithm:a3], v12 = objc_claimAutoreleasedReturnValue(), v13 = *(void *)(*(void *)(a1 + 48) + 8), v14 = *(void **)(v13 + 40), *(void *)(v13 + 40) = v12, v14, (int v11 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) != 0))
    {
      id v15 = [v11 copy];
      id v43 = v15;
      uint64_t v16 = +[NSArray arrayWithObjects:&v43 count:1];

      v29 = (void *)v16;
    }
  }
  v28[2](v28, v29);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v17 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v33;
    do
    {
      CFStringRef v19 = 0;
      do
      {
        if (*(void *)v33 != v18) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(id *)(*((void *)&v32 + 1) + 8 * (void)v19);
        id v21 = [v20 options];
        [v21 setSynthesizeCharacterInventoryBehavior:0];

        if (qword_10002B188 != -1) {
          dispatch_once(&qword_10002B188, &stru_100024A60);
        }
        id v22 = (id)qword_10002B160;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v23 = [v20 string];
          int8x16_t v24 = [v20 options];
          id v25 = [v24 styleContent];
          id v26 = [v20 drawing];
          *(_DWORD *)long long buf = 138740483;
          v37 = v23;
          __int16 v38 = 2117;
          v39 = v25;
          __int16 v40 = 2112;
          v41 = v26;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "CHRemoteSynthesisRequestHandler: Synthesise content %{sensitive}@ with style %{sensitive}@ with initial drawing %@", buf, 0x20u);
        }
        [*(id *)(a1 + 32) handleRequest:v20 withReply:v31 bundleIdentifier:*(void *)(a1 + 40)];

        CFStringRef v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [obj countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v17);
  }

  return 0;
}

void sub_100012E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

id sub_100012F00(uint64_t a1)
{
  [*(id *)(a1 + 32) checkInTextSynthesizer];
  double v2 = *(void **)(a1 + 32);

  return [v2 checkInStyleInventory];
}

void sub_1000131E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v36 - 208), 8);
  _Block_object_dispose((const void *)(v36 - 176), 8);

  _Block_object_dispose((const void *)(v36 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100013268(void *a1, void *a2, int a3, double a4)
{
  id v7 = a2;
  id v22 = [v7 drawingScaledByFactor:a4];

  [v22 bounds];
  double v9 = v8;
  double v11 = *(double *)(*(void *)(a1[4] + 8) + 24) + 20.0 - v10;
  double v12 = 25.0;
  if (!a3) {
    goto LABEL_5;
  }
  uint64_t v13 = *(void *)(a1[5] + 8);
  double v14 = v22;
  if (*(double *)(v13 + 24) >= 0.0)
  {
    double v15 = *(double *)(*(void *)(a1[6] + 8) + 24);
    [v22 bounds];
    CGFloat Width = CGRectGetWidth(v24);
    uint64_t v13 = *(void *)(a1[5] + 8);
    if (v15 + 25.0 + Width < 300.0)
    {
      double v11 = *(double *)(v13 + 24);
      double v12 = *(double *)(*(void *)(a1[6] + 8) + 24) + 25.0;
LABEL_5:
      double v14 = v22;
      goto LABEL_8;
    }
    double v14 = v22;
  }
  *(double *)(v13 + 24) = v11;
LABEL_8:
  id v17 = [v14 drawingTransformedWithTranslation:v12 - v9 scaleFactor:v11];
  [v17 bounds];
  *(CGFloat *)(*(void *)(a1[4] + 8) + 24) = CGRectGetMaxY(v25);
  [v17 bounds];
  *(CGFloat *)(*(void *)(a1[6] + 8) + 24) = CGRectGetMaxX(v26);
  uint64_t v18 = *(void *)(a1[7] + 8);
  id v21 = *(void **)(v18 + 40);
  CFStringRef v19 = (id *)(v18 + 40);
  id v20 = v21;
  if (v21) {
    [v20 appendDrawing:v17];
  }
  else {
    objc_storeStrong(v19, v17);
  }
}

void sub_1000133F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001340C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  _Unwind_Resume(a1);
}

void sub_10001344C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100013464(uint64_t a1)
{
  [*(id *)(a1 + 32) checkOutStyleInventory];
  uint64_t v18 = [*(id *)(*(void *)(a1 + 32) + 88) fastPathCharacterStylesWithVariations];
  double v2 = [v18 allKeys];
  double v3 = [v2 sortedArrayUsingSelector:"compare:"];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  long long v27 = 0u;
  id obj = v3;
  id v4 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v28;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = [v18 objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v8 = v7;
        id v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v24;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v8);
              }
              uint64_t v12 = *(void *)(a1 + 40);
              uint64_t v13 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)j) drawing];
              (*(void (**)(uint64_t, void *, uint64_t, double))(v12 + 16))(v12, v13, 1, 15.0);
            }
            id v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v9);
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v4);
  }

  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                          + 24)
                                                              + 20.0;
  double v14 = *(void **)(*(void *)(a1 + 32) + 88);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000137AC;
  v19[3] = &unk_100024D10;
  uint64_t v21 = *(void *)(a1 + 56);
  id v15 = *(id *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 64);
  id v20 = v15;
  uint64_t v22 = v16;
  [v14 enumerateStyleSamplesUsingBlock:v19];
  [*(id *)(a1 + 32) checkInStyleInventory];
}

void sub_10001372C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_1000137AC(void *a1, void *a2)
{
  id v3 = a2;
  if (qword_10002B188 != -1) {
    dispatch_once(&qword_10002B188, &stru_100024A60);
  }
  id v4 = (id)qword_10002B160;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1[5] + 8);
    uint64_t v6 = *(void *)(v5 + 24);
    *(void *)(v5 + 24) = v6 + 1;
    id v7 = [v3 transcription];
    id v8 = [v3 drawing];
    *(_DWORD *)long long buf = 134218499;
    uint64_t v14 = v6;
    __int16 v15 = 2117;
    uint64_t v16 = v7;
    __int16 v17 = 2048;
    id v18 = [v8 strokeCount];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "Sample [%lu] \"%{sensitive}@\" numStrokes=%lu", buf, 0x20u);
  }
  uint64_t v9 = a1[4];
  uint64_t v10 = [v3 drawing];
  (*(void (**)(uint64_t, void *, void, double))(v9 + 16))(v9, v10, 0, 1.0);

  double v11 = *(void **)(*(void *)(a1[6] + 8) + 40);
  uint64_t v12 = [v3 transcription];
  [v11 appendFormat:@"%@\n", v12];
}

void sub_100013958(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

void sub_100013C38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013C50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013C70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013C88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

BOOL sub_100013CA4(id a1, NSString *a2, NSString *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  uint64_t v6 = [(NSString *)v4 lowercaseString];
  id v7 = [(NSString *)v5 lowercaseString];
  BOOL v8 = ([v6 isEqualToString:v7] & 1) != 0
    || [(NSString *)v4 isEqualToString:@"0"]
    && ([v7 isEqualToString:@"o"] & 1) != 0;

  return v8;
}

void sub_100013D5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013D74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013D88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013DA4(uint64_t a1)
{
  unint64_t v2 = 0;
  dispatch_semaphore_t v27 = dispatch_semaphore_create(0);
  while (1)
  {
    id v3 = [*(id *)(a1 + 32) segmentStrokeIndexes];
    BOOL v4 = v2 < (unint64_t)[v3 count];

    if (!v4) {
      break;
    }
    uint64_t v5 = [*(id *)(a1 + 32) segmentStrokeIndexes];
    uint64_t v6 = [v5 objectAtIndex:v2];

    id v7 = [*(id *)(a1 + 32) drawing];
    BOOL v8 = [v7 drawingWithStrokesFromIndexSet:v6];

    uint64_t v9 = [*(id *)(a1 + 32) segmentContents];
    uint64_t v10 = [v9 objectAtIndex:v2];

    if ((uint64_t)[v10 countCodepoints] <= 1)
    {
      double v11 = +[NSLocale localeWithLocaleIdentifier:@"en_US"];
      uint64_t v12 = +[NSDictionary dictionary];
      id v13 = objc_alloc((Class)CHRemoteRecognitionTextRequest);
      uint64_t v36 = v11;
      uint64_t v14 = +[NSArray arrayWithObjects:&v36 count:1];
      id v15 = [v13 initWithLocales:v14 recognitionMode:4 drawing:v8 options:v12 priority:2];

      [v15 setAutoCorrectionMode:2];
      [v15 setAutoCapitalizationMode:0];
      uint64_t v16 = *(void **)(*(void *)(a1 + 40) + 120);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      void v28[2] = sub_100014280;
      v28[3] = &unk_100024DA0;
      id v31 = *(id *)(a1 + 64);
      id v17 = v10;
      uint64_t v18 = *(void *)(a1 + 80);
      id v29 = v17;
      uint64_t v32 = v18;
      unint64_t v33 = v2;
      CFStringRef v19 = v27;
      long long v30 = v19;
      [v16 handleRequest:v15 withReply:v28 bundleIdentifier:*(void *)(a1 + 48)];
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    }
    ++v2;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count])
  {
    id v20 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) copy];
    [*(id *)(a1 + 32) setContractViolations:v20];

    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    uint64_t v21 = (id)qword_10002B160;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v22 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count];
      *(_DWORD *)long long buf = 67109120;
      unsigned int v35 = v22;
      long long v23 = "Synthesizer contract violations found, total %d";
      long long v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      uint32_t v26 = 8;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v24, v25, v23, buf, v26);
    }
  }
  else
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    uint64_t v21 = (id)qword_10002B160;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      long long v23 = "Synthesizer contract violations not found";
      long long v24 = v21;
      os_log_type_t v25 = OS_LOG_TYPE_DEBUG;
      uint32_t v26 = 2;
      goto LABEL_15;
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

void sub_10001419C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  _Unwind_Resume(a1);
}

void sub_100014280(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 topTranscription];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 topModelTranscription];

    BOOL v4 = (void *)v5;
  }
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) == 0)
  {
    id v6 = [objc_alloc((Class)CHSynthesisContractViolation) initWithLocationRange:*(void *)(a1 + 64) comment:1 kind:1];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v6];
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v7 = (id)qword_10002B160;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      [v3 score];
      uint64_t v10 = v9;
      unsigned int v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
      int v12 = 138740739;
      id v13 = v4;
      __int16 v14 = 2117;
      uint64_t v15 = v8;
      __int16 v16 = 2048;
      uint64_t v17 = v10;
      __int16 v18 = 1024;
      unsigned int v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Synthesizer contract violation found, result %{sensitive}@, expected %{sensitive}@ score %f totalViolations %d", (uint8_t *)&v12, 0x26u);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100014460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001447C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014494(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000144A8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000144BC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000147D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);

  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_100014818(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001486C(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v25 = 0;
  unsigned __int8 v5 = [v2 _isValidRemoteSynthesisRequest:v3 bundleIdentifier:v4 error:&v25];
  id v6 = v25;
  if (v5)
  {
    [*(id *)(a1 + 32) checkOutTextSynthesizer];
    [*(id *)(a1 + 32) checkOutStyleInventory];
    char v24 = 1;
    id v7 = [*(id *)(a1 + 32) _queueForRequest:*(void *)(a1 + 40) outIsSynchronizedSynthesisQueue:&v24];
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    uint64_t v8 = (id)qword_10002B160;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      if (v24) {
        CFStringRef v9 = @"YES";
      }
      else {
        CFStringRef v9 = @"NO";
      }
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v27 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Remote request handled on synchronized synthesis queue=%@", buf, 0xCu);
    }

    if (!v7)
    {
      if (qword_10002B188 != -1) {
        dispatch_once(&qword_10002B188, &stru_100024A60);
      }
      uint64_t v10 = (id)qword_10002B118[0];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "A valid queue is required to run synthesis", buf, 2u);
      }
    }
    unsigned int v11 = (void *)os_transaction_create();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100014B4C;
    block[3] = &unk_100024DF0;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 32);
    id v17 = v12;
    uint64_t v18 = v13;
    long long v22 = *(_OWORD *)(a1 + 64);
    char v23 = v24;
    id v19 = *(id *)(a1 + 48);
    id v14 = *(id *)(a1 + 56);
    id v20 = v11;
    id v21 = v14;
    id v15 = v11;
    dispatch_async(v7, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_100014B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100014B4C(uint64_t a1)
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v3 = v2;
  id v4 = [*(id *)(a1 + 32) requestType];
  if (!v4)
  {
    id v14 = [*(id *)(a1 + 32) options];
    unsigned int v15 = [v14 skipStyleInventoryLookup];

    if (v15)
    {
      if (qword_10002B188 != -1) {
        dispatch_once(&qword_10002B188, &stru_100024A60);
      }
      __int16 v16 = (id)qword_10002B160;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Skipping style inventory lookup", buf, 2u);
      }

      id v17 = [*(id *)(a1 + 32) options];
      uint64_t v18 = [v17 copy];
    }
    else
    {
      if (*(unsigned char *)(a1 + 88))
      {
        if ([*(id *)(*(void *)(a1 + 40) + 88) needsStylePredictionUpdate]) {
          [*(id *)(a1 + 40) _updateStylePredictionsSingleBatch:[*(id *)(*(void *)(a1 + 40) + 88) minimumNumberOfSamplesWithStylePrediction]];
        }
        id v29 = [*(id *)(a1 + 32) options];
        long long v30 = [v29 styleDrawing];
        if (v30)
        {
          id v31 = [*(id *)(a1 + 32) options];
          uint64_t v32 = [v31 styleContent];

          if (v32)
          {
            unint64_t v33 = *(void **)(*(void *)(a1 + 40) + 48);
            long long v34 = [*(id *)(a1 + 32) options];
            unsigned int v35 = [v34 styleContent];
            uint64_t v36 = [*(id *)(a1 + 32) options];
            v37 = [v36 styleDrawing];
            __int16 v38 = [v33 stylePredictionResultForTranscription:v35 drawing:v37 shouldCancel:0];

            if (!v38)
            {
              v39 = CHOSLogForCategory(0);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_FAULT, "CHRemoteSynthesisRequestTypeGeneration: style prediction from the textSynthesizer is nil for input style sample", buf, 2u);
              }
            }
            __int16 v40 = [*(id *)(a1 + 32) options];
            [v40 setStylePrediction:v38];
          }
        }
        else
        {
        }
        id v6 = [*(id *)(*(void *)(a1 + 40) + 88) styleSampleOptionsForRequest:*(void *)(a1 + 32)];
        goto LABEL_36;
      }
      v41 = [*(id *)(a1 + 32) options];
      unsigned __int8 v42 = [v41 isFastPath];

      if ((v42 & 1) == 0)
      {
        if (qword_10002B188 != -1) {
          dispatch_once(&qword_10002B188, &stru_100024A60);
        }
        id v43 = (id)qword_10002B118[0];
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_FAULT, "Only fast path queries should end up on non-synchronized synthesis queues", buf, 2u);
        }
      }
      id v17 = [*(id *)(a1 + 32) options];
      uint64_t v18 = [v17 copy];
    }
    id v6 = v18;

LABEL_36:
    v44 = *(void **)(*(void *)(a1 + 40) + 48);
    v45 = [*(id *)(a1 + 32) string];
    v46 = [v6 dictionary];
    uint64_t v47 = *(void *)(*(void *)(a1 + 80) + 8);
    id v64 = *(id *)(v47 + 40);
    uint64_t v48 = [v44 synthesizeDrawingForString:v45 options:v46 shouldCancel:0 error:&v64];
    objc_storeStrong((id *)(v47 + 40), v64);
    uint64_t v49 = *(void *)(*(void *)(a1 + 72) + 8);
    v50 = *(void **)(v49 + 40);
    *(void *)(v49 + 40) = v48;

    goto LABEL_37;
  }
  if (v4 == (id)2)
  {
    id v19 = *(void **)(*(void *)(a1 + 40) + 48);
    id v6 = [*(id *)(a1 + 32) drawing];
    id v20 = [*(id *)(a1 + 32) options];
    id v21 = [v20 styleContent];
    long long v22 = [*(id *)(a1 + 32) string];
    char v23 = [*(id *)(a1 + 32) options];
    char v24 = [v23 dictionary];
    uint64_t v25 = *(void *)(*(void *)(a1 + 80) + 8);
    id v66 = *(id *)(v25 + 40);
    uint64_t v26 = [v19 replaceDrawing:v6 originalTranscription:v21 replacementTranscription:v22 options:v24 shouldCancel:0 error:&v66];
    objc_storeStrong((id *)(v25 + 40), v66);
    uint64_t v27 = *(void *)(*(void *)(a1 + 72) + 8);
    long long v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
  }
  else if (v4 == (id)1)
  {
    unsigned __int8 v5 = *(void **)(*(void *)(a1 + 40) + 48);
    id v6 = [*(id *)(a1 + 32) drawing];
    id v7 = [*(id *)(a1 + 32) string];
    uint64_t v8 = [*(id *)(a1 + 32) options];
    CFStringRef v9 = [v8 dictionary];
    uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
    id obj = *(id *)(v10 + 40);
    uint64_t v11 = [v5 refineDrawing:v6 transcription:v7 options:v9 shouldCancel:0 error:&obj];
    objc_storeStrong((id *)(v10 + 40), obj);
    uint64_t v12 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v6 = (id)qword_10002B118[0];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Invalid synthesis request type specified", buf, 2u);
    }
  }
LABEL_37:

  +[NSDate timeIntervalSinceReferenceDate];
  double v52 = v51;
  v68[0] = @"inputStringLength";
  v53 = [*(id *)(a1 + 32) string];
  v54 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v53 length]);
  v68[1] = @"outputStrokeCount";
  v69[0] = v54;
  v55 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) drawing];
  v56 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v55 strokeCount]);
  v69[1] = v56;
  v57 = +[NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];

  v58 = [*(id *)(a1 + 40) modelPowerLogger];
  [v58 logModelInference:3 startTimestamp:v57 endTimestamp:v3 data:v52];

  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)
    || ([*(id *)(a1 + 32) options],
        v59 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v60 = [v59 validateSegments],
        v59,
        (v60 & 1) == 0))
  {
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
  else
  {
    [*(id *)(a1 + 40) checkSegmentsAndDrawingConsistencyForSynthesisResult:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) bundleIdentifier:*(void *)(a1 + 48) withReply:*(void *)(a1 + 64)];
  }
  v61 = [*(id *)(a1 + 40) serverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001551C;
  block[3] = &unk_100024AE8;
  void block[4] = *(void *)(a1 + 40);
  id v63 = *(id *)(a1 + 56);
  dispatch_async(v61, block);
}

void sub_100015348(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10001551C(uint64_t a1)
{
  [*(id *)(a1 + 32) checkInTextSynthesizer];
  double v2 = *(void **)(a1 + 32);

  return [v2 checkInStyleInventory];
}

void sub_100015644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  _Unwind_Resume(a1);
}

void sub_100015668(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001567C(id *a1)
{
  [a1[4] checkOutStyleInventory];
  double v2 = [a1[4] lowPriorityQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001573C;
  block[3] = &unk_100024E40;
  id v3 = a1[5];
  id v4 = a1[4];
  id v6 = v3;
  id v7 = v4;
  id v8 = a1[6];
  dispatch_async(v2, block);
}

void sub_10001573C(uint64_t a1)
{
  if (![*(id *)(a1 + 32) shouldResetInventory])
  {
    double v2 = [*(id *)(a1 + 32) removedStrokeIdentifiers];

    if (v2)
    {
      id v3 = *(void **)(*(void *)(a1 + 40) + 88);
      id v4 = [*(id *)(a1 + 32) removedStrokeIdentifiers];
      [v3 removeSamplesContainingStrokeIdentifiers:v4];

      unsigned __int8 v5 = [*(id *)(a1 + 32) tokenizedResult];

      if (!v5) {
        goto LABEL_20;
      }
      if (qword_10002B188 != -1) {
        dispatch_once(&qword_10002B188, &stru_100024A60);
      }
      id v6 = (id)qword_10002B118[0];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Inventory request can't have both removedStrokeIdentifiers and tokenizedResult non-nil", buf, 2u);
      }
LABEL_19:

      goto LABEL_20;
    }
    id v7 = [*(id *)(a1 + 32) tokenizedResult];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      CFStringRef v9 = *(void **)(*(void *)(a1 + 40) + 88);
      uint64_t v10 = [*(id *)(a1 + 32) tokenizedResult];
      uint64_t v11 = [*(id *)(a1 + 32) drawing];
      uint64_t v12 = [*(id *)(a1 + 32) strokeIdentifiers];
      [v9 addSamplesIfNeededWithTokenizedTextResult:v10 drawing:v11 strokeIdentifiers:v12];
    }
    else
    {
      uint64_t v13 = [*(id *)(a1 + 32) tokenizedResult];
      objc_opt_class();
      char v14 = objc_opt_isKindOfClass();

      if ((v14 & 1) == 0)
      {
        if (qword_10002B188 != -1) {
          dispatch_once(&qword_10002B188, &stru_100024A60);
        }
        id v6 = (id)qword_10002B118[0];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "Invalid tokenized result type provided", buf, 2u);
        }
        goto LABEL_19;
      }
      unsigned int v15 = *(void **)(*(void *)(a1 + 40) + 88);
      uint64_t v10 = [*(id *)(a1 + 32) tokenizedResult];
      uint64_t v11 = [*(id *)(a1 + 32) drawing];
      uint64_t v12 = [*(id *)(a1 + 32) strokeIdentifiers];
      [v15 addSamplesIfNeededWithTokenizedMathResult:v10 drawing:v11 strokeIdentifiers:v12];
    }

    goto LABEL_20;
  }
  [*(id *)(*(void *)(a1 + 40) + 88) reset];
LABEL_20:
  __int16 v16 = +[CHSynthesisStyleInventory statusWithInventory:*(void *)(*(void *)(a1 + 40) + 88)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v17 = [*(id *)(a1 + 40) serverQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015B54;
  block[3] = &unk_100024B10;
  void block[4] = *(void *)(a1 + 40);
  dispatch_async(v17, block);
}

void sub_100015A9C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015AC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015AD8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015AF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015B14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015B24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015B34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100015B54(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkInStyleInventory];
}

void sub_100015C10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015C20(uint64_t a1)
{
  [*(id *)(a1 + 32) checkOutStyleInventory];
  id v2 = +[CHSynthesisStyleInventory statusWithInventory:*(void *)(*(void *)(a1 + 32) + 88)];
  [*(id *)(a1 + 32) checkInStyleInventory];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100015CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100015E50(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015FCC(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) _hasIdleLifetimeElapsed:*(double *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(uint64_t *)(v3 + 56) > 0 || v2 == 0)
  {
    unsigned int v5 = v2;
    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v6 = (id)qword_10002B170;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 56);
      int v13 = 134218240;
      uint64_t v14 = v7;
      __int16 v15 = 1024;
      unsigned int v16 = v5;
      id v8 = "Did not evict line wrapper. activeRequestCount=%lu, hasIdleLifetimeElapsed=%i";
      CFStringRef v9 = v6;
      uint32_t v10 = 18;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, v8, (uint8_t *)&v13, v10);
    }
  }
  else
  {
    *(void *)(v3 + 56) = 0;
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 48);
    *(void *)(v11 + 48) = 0;

    if (qword_10002B188 != -1) {
      dispatch_once(&qword_10002B188, &stru_100024A60);
    }
    id v6 = (id)qword_10002B170;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v13) = 0;
      id v8 = "Evicted line wrapper";
      CFStringRef v9 = v6;
      uint32_t v10 = 2;
      goto LABEL_14;
    }
  }
}

void sub_100016564(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016580(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016598(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000165B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000165C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000165D8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000165E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016704(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001671C(uint64_t a1)
{
  unsigned int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  id v14 = 0;
  unsigned __int8 v5 = [v2 _isValidRemoteLineWrappingRequest:v3 bundleIdentifier:v4 error:&v14];
  id v6 = v14;
  if (v5)
  {
    [*(id *)(a1 + 32) _checkOutLineWrapper];
    uint64_t v7 = [*(id *)(a1 + 32) highPriorityQueue];
    if (!v7)
    {
      if (qword_10002B188 != -1) {
        dispatch_once(&qword_10002B188, &stru_100024A60);
      }
      id v8 = (id)qword_10002B118[0];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "A valid queue is required to run line wrapping", buf, 2u);
      }
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000168D8;
    block[3] = &unk_100024E40;
    CFStringRef v9 = *(void **)(a1 + 40);
    void block[4] = *(void *)(a1 + 32);
    id v11 = v9;
    id v12 = *(id *)(a1 + 56);
    dispatch_async(v7, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_1000168B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000168C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000168D8(uint64_t a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v3 = [*(id *)(a1 + 40) lineWrappableGroups];
  uint64_t v4 = [*(id *)(a1 + 40) options];
  id v9 = 0;
  unsigned __int8 v5 = [v2 lineWrappingResultForGroups:v3 options:v4 error:&v9];
  id v6 = v9;

  uint64_t v7 = [*(id *)(a1 + 32) serverQueue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  _DWORD v8[2] = sub_100016A3C;
  v8[3] = &unk_100024B10;
  v8[4] = *(void *)(a1 + 32);
  dispatch_async(v7, v8);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_1000169F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016A10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100016A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100016A3C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _checkInLineWrapper];
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t CHHasPersonalizedSynthesisSupport()
{
  return _CHHasPersonalizedSynthesisSupport();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t TIInputModeGetLanguage()
{
  return _TIInputModeGetLanguage();
}

uint64_t TIInputModeGetRegion()
{
  return _TIInputModeGetRegion();
}

uint64_t TI_USER_DIRECTORY()
{
  return _TI_USER_DIRECTORY();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return _dispatch_workloop_create(label);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__asyncUpdateInventoryStylePredictions(void *a1, const char *a2, ...)
{
  return [a1 _asyncUpdateInventoryStylePredictions];
}

id objc_msgSend__checkOutLineWrapper(void *a1, const char *a2, ...)
{
  return [a1 _checkOutLineWrapper];
}

id objc_msgSend__createDebugViewOfInventory(void *a1, const char *a2, ...)
{
  return [a1 _createDebugViewOfInventory];
}

id objc_msgSend__deviceLanguage(void *a1, const char *a2, ...)
{
  return [a1 _deviceLanguage];
}

id objc_msgSend__hasCachedRecognizers(void *a1, const char *a2, ...)
{
  return [a1 _hasCachedRecognizers];
}

id objc_msgSend__isReadyForCharacterInventorySynthesis(void *a1, const char *a2, ...)
{
  return [a1 _isReadyForCharacterInventorySynthesis];
}

id objc_msgSend__shouldFreezeCharacterInventory(void *a1, const char *a2, ...)
{
  return [a1 _shouldFreezeCharacterInventory];
}

id objc_msgSend__touchLastSessionTimestampIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _touchLastSessionTimestampIfNecessary];
}

id objc_msgSend_absoluteMaxStrokeCountPerRequest(void *a1, const char *a2, ...)
{
  return [a1 absoluteMaxStrokeCountPerRequest];
}

id objc_msgSend_activeCharacterSetPerLocale(void *a1, const char *a2, ...)
{
  return [a1 activeCharacterSetPerLocale];
}

id objc_msgSend_activeRequestCount(void *a1, const char *a2, ...)
{
  return [a1 activeRequestCount];
}

id objc_msgSend_addressBookLexicon(void *a1, const char *a2, ...)
{
  return [a1 addressBookLexicon];
}

id objc_msgSend_adjustColumns(void *a1, const char *a2, ...)
{
  return [a1 adjustColumns];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_autoCapitalizationMode(void *a1, const char *a2, ...)
{
  return [a1 autoCapitalizationMode];
}

id objc_msgSend_autoCorrectionMode(void *a1, const char *a2, ...)
{
  return [a1 autoCorrectionMode];
}

id objc_msgSend_baseWritingDirection(void *a1, const char *a2, ...)
{
  return [a1 baseWritingDirection];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_cachedSettingsDictionary(void *a1, const char *a2, ...)
{
  return [a1 cachedSettingsDictionary];
}

id objc_msgSend_checkInRecognizer(void *a1, const char *a2, ...)
{
  return [a1 checkInRecognizer];
}

id objc_msgSend_checkInStyleInventory(void *a1, const char *a2, ...)
{
  return [a1 checkInStyleInventory];
}

id objc_msgSend_checkInTextSynthesizer(void *a1, const char *a2, ...)
{
  return [a1 checkInTextSynthesizer];
}

id objc_msgSend_checkOutRecognizer(void *a1, const char *a2, ...)
{
  return [a1 checkOutRecognizer];
}

id objc_msgSend_checkOutStyleInventory(void *a1, const char *a2, ...)
{
  return [a1 checkOutStyleInventory];
}

id objc_msgSend_checkOutTextSynthesizer(void *a1, const char *a2, ...)
{
  return [a1 checkOutTextSynthesizer];
}

id objc_msgSend_cleanupFastPathCharacters(void *a1, const char *a2, ...)
{
  return [a1 cleanupFastPathCharacters];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return [a1 clear];
}

id objc_msgSend_clearCache(void *a1, const char *a2, ...)
{
  return [a1 clearCache];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return [a1 contentType];
}

id objc_msgSend_contexts(void *a1, const char *a2, ...)
{
  return [a1 contexts];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countCodepoints(void *a1, const char *a2, ...)
{
  return [a1 countCodepoints];
}

id objc_msgSend_counter(void *a1, const char *a2, ...)
{
  return [a1 counter];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_customLexiconEntries(void *a1, const char *a2, ...)
{
  return [a1 customLexiconEntries];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_declaredVariables(void *a1, const char *a2, ...)
{
  return [a1 declaredVariables];
}

id objc_msgSend_decrement(void *a1, const char *a2, ...)
{
  return [a1 decrement];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_diffusionModelHash(void *a1, const char *a2, ...)
{
  return [a1 diffusionModelHash];
}

id objc_msgSend_dispatchDailyUsageEvents(void *a1, const char *a2, ...)
{
  return [a1 dispatchDailyUsageEvents];
}

id objc_msgSend_dispatchLifecycleEvents(void *a1, const char *a2, ...)
{
  return [a1 dispatchLifecycleEvents];
}

id objc_msgSend_dispatchSettingsEvents(void *a1, const char *a2, ...)
{
  return [a1 dispatchSettingsEvents];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_drawing(void *a1, const char *a2, ...)
{
  return [a1 drawing];
}

id objc_msgSend_enableCachingIfAvailable(void *a1, const char *a2, ...)
{
  return [a1 enableCachingIfAvailable];
}

id objc_msgSend_enableGen2CharacterLMIfAvailable(void *a1, const char *a2, ...)
{
  return [a1 enableGen2CharacterLMIfAvailable];
}

id objc_msgSend_enableGen2ModelIfAvailable(void *a1, const char *a2, ...)
{
  return [a1 enableGen2ModelIfAvailable];
}

id objc_msgSend_enableStrokeReordering(void *a1, const char *a2, ...)
{
  return [a1 enableStrokeReordering];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return [a1 endowmentNamespaces];
}

id objc_msgSend_evictTextSynthesizer(void *a1, const char *a2, ...)
{
  return [a1 evictTextSynthesizer];
}

id objc_msgSend_fastPathCharacterStylesWithVariations(void *a1, const char *a2, ...)
{
  return [a1 fastPathCharacterStylesWithVariations];
}

id objc_msgSend_fingerDrawingEnabled(void *a1, const char *a2, ...)
{
  return [a1 fingerDrawingEnabled];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return [a1 firstIndex];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getAllKnownInputModes(void *a1, const char *a2, ...)
{
  return [a1 getAllKnownInputModes];
}

id objc_msgSend_getLastCharacterStyleTimestamp(void *a1, const char *a2, ...)
{
  return [a1 getLastCharacterStyleTimestamp];
}

id objc_msgSend_hasActiveSessions(void *a1, const char *a2, ...)
{
  return [a1 hasActiveSessions];
}

id objc_msgSend_hasAllDigits(void *a1, const char *a2, ...)
{
  return [a1 hasAllDigits];
}

id objc_msgSend_highPriorityQueue(void *a1, const char *a2, ...)
{
  return [a1 highPriorityQueue];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_increment(void *a1, const char *a2, ...)
{
  return [a1 increment];
}

id objc_msgSend_inputLanguage(void *a1, const char *a2, ...)
{
  return [a1 inputLanguage];
}

id objc_msgSend_inputRegion(void *a1, const char *a2, ...)
{
  return [a1 inputRegion];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isFastPath(void *a1, const char *a2, ...)
{
  return [a1 isFastPath];
}

id objc_msgSend_isListening(void *a1, const char *a2, ...)
{
  return [a1 isListening];
}

id objc_msgSend_isMinimalDrawingResult(void *a1, const char *a2, ...)
{
  return [a1 isMinimalDrawingResult];
}

id objc_msgSend_isPersonalizedSynthesisModelReady(void *a1, const char *a2, ...)
{
  return [a1 isPersonalizedSynthesisModelReady];
}

id objc_msgSend_isScribbleActive(void *a1, const char *a2, ...)
{
  return [a1 isScribbleActive];
}

id objc_msgSend_lastActiveTimestamp(void *a1, const char *a2, ...)
{
  return [a1 lastActiveTimestamp];
}

id objc_msgSend_lastIndex(void *a1, const char *a2, ...)
{
  return [a1 lastIndex];
}

id objc_msgSend_lastSavedDate(void *a1, const char *a2, ...)
{
  return [a1 lastSavedDate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineWrappableGroups(void *a1, const char *a2, ...)
{
  return [a1 lineWrappableGroups];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_liveTextSupportedByPrimaryLanguage(void *a1, const char *a2, ...)
{
  return [a1 liveTextSupportedByPrimaryLanguage];
}

id objc_msgSend_liveTextToggleEnabled(void *a1, const char *a2, ...)
{
  return [a1 liveTextToggleEnabled];
}

id objc_msgSend_loadedDate(void *a1, const char *a2, ...)
{
  return [a1 loadedDate];
}

id objc_msgSend_locales(void *a1, const char *a2, ...)
{
  return [a1 locales];
}

id objc_msgSend_lowPriorityQueue(void *a1, const char *a2, ...)
{
  return [a1 lowPriorityQueue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_maxRecognitionResultCount(void *a1, const char *a2, ...)
{
  return [a1 maxRecognitionResultCount];
}

id objc_msgSend_minimumDrawingSize(void *a1, const char *a2, ...)
{
  return [a1 minimumDrawingSize];
}

id objc_msgSend_minimumNumberOfSamplesWithStylePrediction(void *a1, const char *a2, ...)
{
  return [a1 minimumNumberOfSamplesWithStylePrediction];
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return [a1 modelIdentifier];
}

id objc_msgSend_modelPowerLogger(void *a1, const char *a2, ...)
{
  return [a1 modelPowerLogger];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_needsStylePredictionUpdate(void *a1, const char *a2, ...)
{
  return [a1 needsStylePredictionUpdate];
}

id objc_msgSend_optimizeResourceUsage(void *a1, const char *a2, ...)
{
  return [a1 optimizeResourceUsage];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_pointCount(void *a1, const char *a2, ...)
{
  return [a1 pointCount];
}

id objc_msgSend_precedingSeparatorForTopTranscriptionPath(void *a1, const char *a2, ...)
{
  return [a1 precedingSeparatorForTopTranscriptionPath];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_queuedTimestampDate(void *a1, const char *a2, ...)
{
  return [a1 queuedTimestampDate];
}

id objc_msgSend_recognitionEngineCachingKey(void *a1, const char *a2, ...)
{
  return [a1 recognitionEngineCachingKey];
}

id objc_msgSend_recognitionMode(void *a1, const char *a2, ...)
{
  return [a1 recognitionMode];
}

id objc_msgSend_registerScheduledEventsActivity(void *a1, const char *a2, ...)
{
  return [a1 registerScheduledEventsActivity];
}

id objc_msgSend_removedStrokeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 removedStrokeIdentifiers];
}

id objc_msgSend_requestType(void *a1, const char *a2, ...)
{
  return [a1 requestType];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeConnectionIfIdle(void *a1, const char *a2, ...)
{
  return [a1 resumeConnectionIfIdle];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_samplesWithoutStylePrediction(void *a1, const char *a2, ...)
{
  return [a1 samplesWithoutStylePrediction];
}

id objc_msgSend_saveIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 saveIfNeeded];
}

id objc_msgSend_saveStyleInventoryIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 saveStyleInventoryIfNeeded];
}

id objc_msgSend_score(void *a1, const char *a2, ...)
{
  return [a1 score];
}

id objc_msgSend_scribbleEnabled(void *a1, const char *a2, ...)
{
  return [a1 scribbleEnabled];
}

id objc_msgSend_segmentContents(void *a1, const char *a2, ...)
{
  return [a1 segmentContents];
}

id objc_msgSend_segmentStrokeIndexes(void *a1, const char *a2, ...)
{
  return [a1 segmentStrokeIndexes];
}

id objc_msgSend_serverQueue(void *a1, const char *a2, ...)
{
  return [a1 serverQueue];
}

id objc_msgSend_sessionDelegate(void *a1, const char *a2, ...)
{
  return [a1 sessionDelegate];
}

id objc_msgSend_sessionDidBegin(void *a1, const char *a2, ...)
{
  return [a1 sessionDidBegin];
}

id objc_msgSend_sessionDidEnd(void *a1, const char *a2, ...)
{
  return [a1 sessionDidEnd];
}

id objc_msgSend_setDirty(void *a1, const char *a2, ...)
{
  return [a1 setDirty];
}

id objc_msgSend_setIdle(void *a1, const char *a2, ...)
{
  return [a1 setIdle];
}

id objc_msgSend_setupDefaults(void *a1, const char *a2, ...)
{
  return [a1 setupDefaults];
}

id objc_msgSend_sharedAnalyticsServer(void *a1, const char *a2, ...)
{
  return [a1 sharedAnalyticsServer];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedRemoteRecognitionServer(void *a1, const char *a2, ...)
{
  return [a1 sharedRemoteRecognitionServer];
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return [a1 sharedSettings];
}

id objc_msgSend_sharedSettingsServer(void *a1, const char *a2, ...)
{
  return [a1 sharedSettingsServer];
}

id objc_msgSend_shouldResetInventory(void *a1, const char *a2, ...)
{
  return [a1 shouldResetInventory];
}

id objc_msgSend_shouldUseTextReplacements(void *a1, const char *a2, ...)
{
  return [a1 shouldUseTextReplacements];
}

id objc_msgSend_skipStyleInventoryLookup(void *a1, const char *a2, ...)
{
  return [a1 skipStyleInventoryLookup];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_strokeCount(void *a1, const char *a2, ...)
{
  return [a1 strokeCount];
}

id objc_msgSend_strokeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 strokeIdentifiers];
}

id objc_msgSend_strokeIndexes(void *a1, const char *a2, ...)
{
  return [a1 strokeIndexes];
}

id objc_msgSend_styleContent(void *a1, const char *a2, ...)
{
  return [a1 styleContent];
}

id objc_msgSend_styleDrawing(void *a1, const char *a2, ...)
{
  return [a1 styleDrawing];
}

id objc_msgSend_styleInventoryQuery(void *a1, const char *a2, ...)
{
  return [a1 styleInventoryQuery];
}

id objc_msgSend_supportedCharactersForPersonalizedSynthesis(void *a1, const char *a2, ...)
{
  return [a1 supportedCharactersForPersonalizedSynthesis];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synthesisModelHash(void *a1, const char *a2, ...)
{
  return [a1 synthesisModelHash];
}

id objc_msgSend_synthesizeCharacterInventoryBehavior(void *a1, const char *a2, ...)
{
  return [a1 synthesizeCharacterInventoryBehavior];
}

id objc_msgSend_targetIdleLifetime(void *a1, const char *a2, ...)
{
  return [a1 targetIdleLifetime];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return [a1 taskState];
}

id objc_msgSend_textReplacements(void *a1, const char *a2, ...)
{
  return [a1 textReplacements];
}

id objc_msgSend_throttledSaveStyleInventoryIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 throttledSaveStyleInventoryIfNeeded];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_tokenColumnCount(void *a1, const char *a2, ...)
{
  return [a1 tokenColumnCount];
}

id objc_msgSend_tokenColumns(void *a1, const char *a2, ...)
{
  return [a1 tokenColumns];
}

id objc_msgSend_tokenizedResult(void *a1, const char *a2, ...)
{
  return [a1 tokenizedResult];
}

id objc_msgSend_topModelTranscription(void *a1, const char *a2, ...)
{
  return [a1 topModelTranscription];
}

id objc_msgSend_topTranscription(void *a1, const char *a2, ...)
{
  return [a1 topTranscription];
}

id objc_msgSend_transcription(void *a1, const char *a2, ...)
{
  return [a1 transcription];
}

id objc_msgSend_transcriptionPaths(void *a1, const char *a2, ...)
{
  return [a1 transcriptionPaths];
}

id objc_msgSend_transientPhraseLexicon(void *a1, const char *a2, ...)
{
  return [a1 transientPhraseLexicon];
}

id objc_msgSend_unlikelyHasLatinContents(void *a1, const char *a2, ...)
{
  return [a1 unlikelyHasLatinContents];
}

id objc_msgSend_userModelDataStorePath(void *a1, const char *a2, ...)
{
  return [a1 userModelDataStorePath];
}

id objc_msgSend_validateSegments(void *a1, const char *a2, ...)
{
  return [a1 validateSegments];
}

id objc_msgSend_vocabulary(void *a1, const char *a2, ...)
{
  return [a1 vocabulary];
}

id objc_msgSend_writingStatsForRequest_locale_(void *a1, const char *a2, ...)
{
  return [a1 writingStatsForRequest:locale:];
}