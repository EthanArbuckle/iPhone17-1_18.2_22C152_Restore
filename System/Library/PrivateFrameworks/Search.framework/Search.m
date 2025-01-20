uint64_t start()
{
  void *v0;
  NSObject *v1;
  SDController *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  pid_t v7;
  int v9;
  pid_t v10;

  unsetenv("CFFIXED_USER_HOME");
  SPLogInit();
  v1 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 67109120;
    v10 = getpid();
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "searchd starting, pid:%d", (uint8_t *)&v9, 8u);
  }

  v2 = objc_alloc_init(SDController);
  do
  {
    v4 = +[NSRunLoop mainRunLoop];
    v5 = +[NSDate distantFuture];
    [v4 runMode:NSDefaultRunLoopMode beforeDate:v5];
  }
  while ([(SDController *)v2 keepRunning]);
  v6 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = getpid();
    v9 = 67109120;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "searchd shutting down, pid:%d", (uint8_t *)&v9, 8u);
  }

  return 0;
}

uint64_t sub_100003948()
{
  qword_1000A8C80 = objc_alloc_init(SDBundleTracker);

  return _objc_release_x1();
}

void sub_100003EBC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000046EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,id a37)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a37);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000474C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000475C(uint64_t a1)
{
}

void sub_100004764(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = logForCSLogCategoryRecs();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100064C54();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

intptr_t sub_1000047D0(uint64_t a1)
{
  v2 = logForCSLogCategoryRecs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100064C88();
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100004820(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained storeCompletedSearch:*(void *)(a1 + 32) withSections:&__NSArray0__struct];
}

void sub_100004878(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v4 = +[NSArray arrayWithObjects:&v5 count:1];
  [WeakRetained storeCompletedSearch:v3 withSections:v4];
}

id sub_10000491C(uint64_t a1)
{
  return [*(id *)(a1 + 32) storeCompletedSearch:*(void *)(a1 + 40) withSections:&__NSArray0__struct];
}

id sub_100004930(uint64_t a1)
{
  return [*(id *)(a1 + 32) storeCompletedSearch:*(void *)(a1 + 40) withSections:&__NSArray0__struct];
}

void sub_100005350(id a1)
{
  qword_1000A8C90 = (uint64_t)dispatch_queue_create("Music Queue", 0);

  _objc_release_x1();
}

id sub_100005390(uint64_t a1)
{
  return [*(id *)(a1 + 32) begin:*(void *)(a1 + 40)];
}

void sub_1000053A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000544C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100005618()
{
  size_t v0 = strlen((const char *)qword_1000A8CC0);
  write(2, (const void *)qword_1000A8CC0, v0);
  signal(6, 0);
  abort();
}

void sub_100005754(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000066C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

__n128 sub_1000067B0(uint64_t a1)
{
  uint64_t v2 = si_tracing_current_span();
  si_tracing_log_span_end();
  __n128 result = *(__n128 *)a1;
  long long v4 = *(_OWORD *)(a1 + 16);
  *(void *)(v2 + 32) = *(void *)(a1 + 32);
  *(__n128 *)uint64_t v2 = result;
  *(_OWORD *)(v2 + 16) = v4;
  return result;
}

id sub_10000680C(uint64_t a1)
{
  CFStringRef v4 = @"keystrokes";
  v1 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unsigned char *)[*(id *)(a1 + 32) length] - (unsigned char *)objc_msgSend(*(id *)(a1 + 40), "length"));
  uint64_t v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_1000068E0(uint64_t a1)
{
  CFStringRef v4 = @"keystrokes";
  v1 = +[NSNumber numberWithInteger:*(void *)(a1 + 32)];
  uint64_t v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

double sub_100006994(uint64_t a1)
{
  uint64_t v2 = si_tracing_current_span();
  long long v13 = *(_OWORD *)v2;
  long long v14 = *(_OWORD *)(v2 + 16);
  uint64_t v15 = *(void *)(v2 + 32);
  uint64_t v3 = *(void *)v2;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v5 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + 8) = spanid;
  *(void *)(v2 + 16) = v5;
  *(unsigned char *)(v2 + 28) = 102;
  *(void *)(v2 + 32) = "SDClient:  Starting query";
  si_tracing_log_span_begin();
  id v6 = objc_msgSend(objc_alloc((Class)SFClientTimingFeedback), "initWithEvent:timeInterval:queryId:", @"com.apple.searchd.backend.stores.start", 0, objc_msgSend(*(id *)(a1 + 32), "queryIdent"));
  v7 = +[SPFeedbackProxy sharedProxy];
  objc_msgSend(v7, "sendFeedbackType:feedback:queryId:clientID:", 21, v6, objc_msgSend(*(id *)(a1 + 32), "queryIdent"), *(void *)(a1 + 40));

  if (*(double *)(a1 + 72) > 0.0) {
    objc_msgSend(*(id *)(a1 + 32), "setTimeout:");
  }
  [*(id *)(a1 + 48) count];
  id v9 = *(id *)(a1 + 48);
  id v10 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 64);
  tracing_dispatch_apply();

  si_tracing_log_span_end();
  double result = *(double *)&v13;
  *(_OWORD *)uint64_t v2 = v13;
  *(_OWORD *)(v2 + 16) = v14;
  *(void *)(v2 + 32) = v15;
  return result;
}

void sub_100006BD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

__n128 sub_100006C04(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = si_tracing_current_span();
  __n128 v17 = *(__n128 *)v4;
  long long v18 = *(_OWORD *)(v4 + 16);
  uint64_t v19 = *(void *)(v4 + 32);
  uint64_t v5 = *(void *)v4;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v7 = *(void *)(v4 + 8);
  *(void *)uint64_t v4 = v5;
  *(void *)(v4 + 8) = spanid;
  *(void *)(v4 + 16) = v7;
  *(unsigned char *)(v4 + 28) = 102;
  *(void *)(v4 + 32) = "SDClient:  Issuing query for store";
  si_tracing_log_span_begin();
  v8 = [*(id *)(a1 + 32) objectAtIndex:a2];
  id v9 = SPLogForSPLogCategoryDefault();
  os_log_type_t v10 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v9, v10))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = (id)objc_opt_class();
    id v11 = v21;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "#query Issue query for store %@", buf, 0xCu);
  }
  if (([*(id *)(a1 + 40) cancelled] & 1) == 0)
  {
    long long v13 = [v8 performQuery:*(void *)(a1 + 40)];
    if (v13)
    {
      pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 64));
      unsigned int v14 = [*(id *)(a1 + 48) containsObject:v8];
      uint64_t v15 = *(void **)(a1 + 40);
      if (v14) {
        [v15 addSlowQueryToken:v13];
      }
      else {
        [v15 addQueryToken:v13];
      }
      pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 64));
    }
  }

  si_tracing_log_span_end();
  __n128 result = v17;
  *(__n128 *)uint64_t v4 = v17;
  *(_OWORD *)(v4 + 16) = v18;
  *(void *)(v4 + 32) = v19;
  return result;
}

void sub_100006E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100006FB0(id a1)
{
  v1 = +[SDController datastores];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(void **)(*((void *)&v7 + 1) + 8 * (void)v5);
        if (objc_opt_respondsToSelector()) {
          [v6 clearInput];
        }
        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void sub_100007168(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  objc_sync_enter(v2);
  id v3 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v4 = +[NSNumber numberWithUnsignedLong:*(unsigned int *)(a1 + 40)];
  uint64_t v5 = [v3 objectForKey:v4];

  objc_sync_exit(v2);
  if (v5)
  {
    [v5 cancel];
    [*(id *)(a1 + 32) removeActiveQuery:v5];
  }
  id v6 = SPLogForSPLogCategoryDefault();
  os_log_type_t v7 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v6, v7))
  {
    int v8 = *(_DWORD *)(a1 + 40);
    v12[0] = 67109120;
    v12[1] = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Query cancelled %d", (uint8_t *)v12, 8u);
  }

  long long v9 = SPLogForSPLogCategoryTelemetry();
  long long v10 = v9;
  os_signpost_id_t v11 = *(unsigned int *)(a1 + 40);
  if (v11 && os_signpost_enabled(v9))
  {
    LOWORD(v12[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, v11, "cancelQuery", " enableTelemetry=YES ", (uint8_t *)v12, 2u);
  }
}

void sub_1000072FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007A24(id a1)
{
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  qword_1000A8CD0 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);

  _objc_release_x1();
}

void sub_100007AE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained deactivate];
}

void sub_100007B20(id a1)
{
  uint64_t v1 = +[SDMigrationMonitor sharedInstance];
  [v1 suspendMigrationQueue];

  +[SDController activated];
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v2 = +[SDController datastores];
    long long v7 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v8;
      do
      {
        id v6 = 0;
        do
        {
          if (*(void *)v8 != v5) {
            objc_enumerationMutation(v2);
          }
          [*(id *)(*((void *)&v7 + 1) + 8 * (void)v6) activate];
          id v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      }
      while (v4);
    }
  }
  +[SDSearchQuery prepareCacheForSearchContinuation];
  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0) {
    +[PRSRankingItemRanker preheat];
  }
}

void sub_100007CB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[82] = 1;
  }
  id v3 = WeakRetained;
  uint64_t v2 = +[SDMigrationMonitor sharedInstance];
  [v2 resumeMigrationQueue];

  +[SDController deactivated];
}

id sub_100007D28(uint64_t a1)
{
  v4[1] = @"parsec_enabled";
  v5[0] = &off_100098A68;
  v4[0] = @"activation_count";
  uint64_t v1 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 32)];
  v5[1] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

void sub_100007F30(id a1)
{
  uint64_t v1 = +[SDController datastores];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * (void)v5) deactivate];
        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void sub_100008024(id a1)
{
  uint64_t v1 = +[SDMigrationMonitor sharedInstance];
  [v1 resumeMigrationQueue];

  +[SDController deactivated];
}

void sub_100008074(id a1)
{
  +[SSRankingManager fetchDuetValues];

  +[SPCalculationDatastore refreshCurrencyCache];
}

void sub_100008258(id a1, SPXPCConnection *a2, SPXPCMessage *a3)
{
  uint64_t v4 = a2;
  v59 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v60 = *(_OWORD *)v5;
  long long v61 = *(_OWORD *)(v5 + 16);
  uint64_t v62 = *(void *)(v5 + 32);
  uint64_t v6 = si_tracing_calc_traceid();
  uint64_t spanid = si_tracing_calc_next_spanid();
  *(void *)uint64_t v5 = v6;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = 0;
  *(_DWORD *)(v5 + 24) = -1;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "kSPMessageOpenQuery";
  si_tracing_log_span_begin();
  long long v8 = SPLogForSPLogCategoryDefault();
  os_log_type_t v9 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v8, v9))
  {
    long long v10 = dispatch_get_current_queue();
    *(_DWORD *)buf = 136315138;
    label = dispatch_queue_get_label(v10);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "queue: %s", buf, 0xCu);
  }
  os_signpost_id_t v11 = SPLogForSPLogCategoryDefault();
  os_log_type_t v12 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v11, v12))
  {
    qos_class_t v13 = qos_class_self();
    *(_DWORD *)buf = 67109120;
    LODWORD(label) = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "QOS kSPMessageOpenQuery: %d", buf, 8u);
  }

  unsigned int v14 = +[SDClient clientForConnection:v4];
  [v14 activateForConnection:v4 message:0];
  uint64_t v15 = [(SPXPCMessage *)v59 info];
  id v16 = objc_alloc((Class)SPSearchQueryContext);
  __n128 v17 = [v15 objectForKey:@"QS"];
  id v18 = [v16 initWithSearchString:v17];

  uint64_t v19 = [v15 objectForKey:@"WHY"];
  objc_msgSend(v18, "setWhyQuery:", objc_msgSend(v19, "unsignedIntValue"));

  v20 = [v15 objectForKey:@"QK"];
  objc_msgSend(v18, "setQueryKind:", objc_msgSend(v20, "unsignedIntValue"));

  id v21 = [v15 objectForKey:@"QI"];
  objc_msgSend(v18, "setQueryIdent:", objc_msgSend(v21, "unsignedLongLongValue"));

  v22 = [v15 objectForKey:@"RPL"];
  objc_msgSend(v18, "setPromoteLocalResults:", objc_msgSend(v22, "BOOLValue"));

  v23 = [v15 objectForKey:@"RPP"];
  objc_msgSend(v18, "setPromoteParsecResults:", objc_msgSend(v23, "BOOLValue"));

  v24 = [v15 objectForKey:@"KL"];
  [v18 setKeyboardLanguage:v24];

  v25 = [v15 objectForKey:@"SCF"];
  [v25 floatValue];
  [v18 setScaleFactor:v26];

  v27 = [v15 objectForKey:@"KPL"];
  [v18 setKeyboardPrimaryLanguage:v27];

  v28 = [v15 objectForKey:@"DA"];
  [v18 setSearchDomains:v28];

  v29 = [v15 objectForKey:@"DDA"];
  [v18 setDisabledDomains:v29];

  v30 = [v15 objectForKey:@"BA"];
  [v18 setDisabledBundles:v30];

  v31 = [v15 objectForKey:@"AA"];
  [v18 setDisabledApps:v31];

  v32 = [v15 objectForKey:@"QSMRA"];
  [v18 setMarkedTextArray:v32];

  v33 = [v15 objectForKey:@"DAS"];
  objc_msgSend(v18, "setDeviceAuthenticationState:", objc_msgSend(v33, "unsignedIntValue"));

  v34 = [v15 objectForKey:@"InternalValidation"];
  objc_msgSend(v18, "setInternalValidation:", objc_msgSend(v34, "BOOLValue"));

  v35 = [v15 objectForKey:@"CT"];
  [v35 doubleValue];
  objc_msgSend(v18, "setCurrentTime:");

  v36 = [v15 objectForKey:@"DOCR"];
  objc_msgSend(v18, "setDisableOCR:", objc_msgSend(v36, "BOOLValue"));

  uint64_t v37 = [v15 objectForKey:@"FL2S"];
  objc_msgSend(v18, "setFetchL2Signals:", objc_msgSend(v37, "BOOLValue"));

  v38 = [v15 objectForKey:@"QU"];
  [v18 setQueryUnderstandingOutput:v38];

  v39 = [(SPXPCConnection *)v4 bundleID];
  [v18 setClientBundleID:v39];

  v40 = [v15 objectForKey:@"EA"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v40 length])
  {
    id v41 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v40 error:0];
    v63[0] = objc_opt_class();
    v63[1] = objc_opt_class();
    v42 = +[NSArray arrayWithObjects:v63 count:2];
    v43 = +[NSSet setWithArray:v42];
    v44 = [v41 decodeObjectOfClasses:v43 forKey:@"entities"];
    [v18 setSearchEntities:v44];
  }
  v45 = [SDSearchQuery alloc];
  v46 = [v15 objectForKey:@"QID"];
  v47 = -[SDSearchQuery initWithQueryContext:externalID:connection:](v45, "initWithQueryContext:externalID:connection:", v18, [v46 unsignedIntValue], v4);

  [(SDSearchQuery *)v47 externalID];
  kdebug_trace();
  v48 = [v15 objectForKey:@"InternalValidation"];
  -[SDSearchQuery setInternalValidation:](v47, "setInternalValidation:", [v48 BOOLValue]);

  v49 = [v15 objectForKey:@"InternalDebug"];
  unsigned int v50 = [v49 BOOLValue];
  if (byte_1000A8CA0) {
    uint64_t v51 = 1;
  }
  else {
    uint64_t v51 = v50;
  }
  [(SDSearchQuery *)v47 setInternalDebug:v51];

  v52 = [v15 objectForKey:@"IP"];
  unsigned int v53 = [v52 BOOLValue];
  if (byte_1000A8CA0) {
    uint64_t v54 = 1;
  }
  else {
    uint64_t v54 = v53;
  }
  [(SDSearchQuery *)v47 setInfinitePatience:v54];

  v55 = [v15 objectForKey:@"NT"];
  -[SDSearchQuery setNoTokenize:](v47, "setNoTokenize:", [v55 BOOLValue]);

  v56 = [v15 objectForKey:@"FC"];
  -[SDSearchQuery setContentFilters:](v47, "setContentFilters:", [v56 integerValue]);

  v57 = [v15 objectForKey:@"QC"];
  -[SDSearchQuery setMaxCount:](v47, "setMaxCount:", [v57 integerValue]);

  [(SDSearchQuery *)v47 setMessage:v59];
  v58 = [v15 objectForKey:@"WS"];
  -[SDSearchQuery setIsWideScreen:](v47, "setIsWideScreen:", [v58 integerValue] != 0);

  [v14 addAndStartQuery:v47];
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v5 = v60;
  *(_OWORD *)(v5 + 16) = v61;
  *(void *)(v5 + 32) = v62;
}

void sub_100008AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100008B24(id a1, SPXPCConnection *a2, SPXPCMessage *a3)
{
  os_signpost_id_t v11 = a2;
  uint64_t v4 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v12 = *(_OWORD *)v5;
  long long v13 = *(_OWORD *)(v5 + 16);
  uint64_t v14 = *(void *)(v5 + 32);
  uint64_t v6 = si_tracing_calc_traceid();
  uint64_t spanid = si_tracing_calc_next_spanid();
  *(void *)uint64_t v5 = v6;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = 0;
  *(_DWORD *)(v5 + 24) = -1;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "kSPMessageCloseQuery";
  si_tracing_log_span_begin();
  long long v8 = +[SDClient clientForConnection:v11];
  [v8 activateForConnection:v11 message:0];
  os_log_type_t v9 = [(SPXPCMessage *)v4 info];
  long long v10 = [v9 objectForKey:@"QID"];
  objc_msgSend(v8, "cancelQueryWithExternalID:", objc_msgSend(v10, "unsignedIntValue"));

  [(SPXPCMessage *)v4 sendReply:&__NSDictionary0__struct];
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v5 = v12;
  *(_OWORD *)(v5 + 16) = v13;
  *(void *)(v5 + 32) = v14;
}

void sub_100008C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100008CA8(id a1, SPXPCConnection *a2, SPXPCMessage *a3)
{
  os_log_type_t v9 = a2;
  uint64_t v4 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v10 = *(_OWORD *)v5;
  long long v11 = *(_OWORD *)(v5 + 16);
  uint64_t v12 = *(void *)(v5 + 32);
  uint64_t v6 = si_tracing_calc_traceid();
  uint64_t spanid = si_tracing_calc_next_spanid();
  *(void *)uint64_t v5 = v6;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = 0;
  *(_DWORD *)(v5 + 24) = -1;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "kSPMessageClearInput";
  si_tracing_log_span_begin();
  long long v8 = +[SDClient clientForConnection:v9];
  [v8 activateForConnection:v9 message:0];
  [v8 clearInputForConnection:v9];

  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v5 = v10;
  *(_OWORD *)(v5 + 16) = v11;
  *(void *)(v5 + 32) = v12;
}

void sub_100008DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100008DE4(id a1, SPXPCConnection *a2, SPXPCMessage *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  uint64_t v6 = si_tracing_current_span();
  long long v11 = *(_OWORD *)v6;
  long long v12 = *(_OWORD *)(v6 + 16);
  uint64_t v13 = *(void *)(v6 + 32);
  uint64_t v7 = si_tracing_calc_traceid();
  uint64_t spanid = si_tracing_calc_next_spanid();
  *(void *)uint64_t v6 = v7;
  *(void *)(v6 + 8) = spanid;
  *(void *)(v6 + 16) = 0;
  *(_DWORD *)(v6 + 24) = -1;
  *(unsigned char *)(v6 + 28) = 102;
  *(void *)(v6 + 32) = "kSPMessageRequestFirstTimeExperience";
  si_tracing_log_span_begin();
  os_log_type_t v9 = +[SDController workQueue];
  long long v10 = v5;
  tracing_dispatch_async();

  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v6 = v11;
  *(_OWORD *)(v6 + 16) = v12;
  *(void *)(v6 + 32) = v13;
}

void sub_100008F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100008F54(uint64_t a1)
{
  id v3 = +[SDController datastoreForDomain:2];
  if (!v3)
  {
    uint64_t v4 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100064D00(v4);
    }
  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_100009040;
  v5[3] = &unk_100092188;
  id v6 = *(id *)(a1 + 32);
  [v3 getFTEStringsWithReply:v5];
}

void sub_100009040(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = +[SDController workQueue];
  id v18 = v9;
  uint64_t v19 = v10;
  v20 = v11;
  id v21 = v12;
  id v22 = *(id *)(a1 + 32);
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v9;
  tracing_dispatch_async();
}

void sub_100009178(uint64_t a1)
{
  v13[0] = @"FTE_STRING";
  if ([*(id *)(a1 + 32) length]) {
    CFStringRef v2 = *(const __CFString **)(a1 + 32);
  }
  else {
    CFStringRef v2 = &stru_100094088;
  }
  v14[0] = v2;
  v13[1] = @"FTE_LEARN_MORE_LINK";
  if ([*(id *)(a1 + 40) length]) {
    CFStringRef v3 = *(const __CFString **)(a1 + 40);
  }
  else {
    CFStringRef v3 = &stru_100094088;
  }
  v14[1] = v3;
  v13[2] = @"FTE_CONTINUE_LINK";
  if ([*(id *)(a1 + 48) length]) {
    CFStringRef v4 = *(const __CFString **)(a1 + 48);
  }
  else {
    CFStringRef v4 = &stru_100094088;
  }
  v13[3] = @"FTE_DOMAINS";
  uint64_t v5 = *(void **)(a1 + 56);
  if (!v5) {
    uint64_t v5 = &__NSArray0__struct;
  }
  v14[2] = v4;
  v14[3] = v5;
  id v6 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  uint64_t v7 = SPLogForSPLogCategoryDefault();
  os_log_type_t v8 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v7, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[FTE] Received FTE dictionary in client: %@", buf, 0xCu);
  }

  id v9 = *(void **)(a1 + 64);
  id v10 = +[NSDictionary dictionaryWithObjectsAndKeys:v6, @"FTE", 0];
  [v9 sendReply:v10];
}

void sub_10000933C(id a1, SPXPCConnection *a2, SPXPCMessage *a3)
{
  id v9 = a2;
  CFStringRef v4 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v10 = *(_OWORD *)v5;
  long long v11 = *(_OWORD *)(v5 + 16);
  uint64_t v12 = *(void *)(v5 + 32);
  uint64_t v6 = si_tracing_calc_traceid();
  uint64_t spanid = si_tracing_calc_next_spanid();
  *(void *)uint64_t v5 = v6;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = 0;
  *(_DWORD *)(v5 + 24) = -1;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "kSPMessageActivate";
  si_tracing_log_span_begin();
  os_log_type_t v8 = +[SDClient clientForConnection:v9];
  [v8 activateForConnection:v9 message:v4];

  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v5 = v10;
  *(_OWORD *)(v5 + 16) = v11;
  *(void *)(v5 + 32) = v12;
}

void sub_100009450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10000946C(id a1, SPXPCConnection *a2, SPXPCMessage *a3)
{
  CFStringRef v4 = a2;
  uint64_t v5 = a3;
  uint64_t v6 = si_tracing_current_span();
  long long v13 = *(_OWORD *)v6;
  long long v14 = *(_OWORD *)(v6 + 16);
  uint64_t v15 = *(void *)(v6 + 32);
  uint64_t v7 = si_tracing_calc_traceid();
  uint64_t spanid = si_tracing_calc_next_spanid();
  *(void *)uint64_t v6 = v7;
  *(void *)(v6 + 8) = spanid;
  *(void *)(v6 + 16) = 0;
  *(_DWORD *)(v6 + 24) = -1;
  *(unsigned char *)(v6 + 28) = 102;
  *(void *)(v6 + 32) = "kSPMessageDeactivate";
  si_tracing_log_span_begin();
  kdebug_trace();
  id v9 = [(SPXPCConnection *)v4 context];
  [v9 deactivate];
  long long v10 = SPLogForSPLogCategoryDefault();
  os_log_type_t v11 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v10, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    uint64_t v12 = [(SPXPCConnection *)v4 bundleID];
    *(_DWORD *)buf = 138412290;
    id v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Deactivate from %@", buf, 0xCu);
  }
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v6 = v13;
  *(_OWORD *)(v6 + 16) = v14;
  *(void *)(v6 + 32) = v15;
}

void sub_10000962C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10000965C(id a1, SPXPCConnection *a2, SPXPCMessage *a3)
{
  os_log_type_t v8 = a2;
  CFStringRef v4 = a3;
  uint64_t v5 = si_tracing_current_span();
  long long v9 = *(_OWORD *)v5;
  long long v10 = *(_OWORD *)(v5 + 16);
  uint64_t v11 = *(void *)(v5 + 32);
  uint64_t v6 = si_tracing_calc_traceid();
  uint64_t spanid = si_tracing_calc_next_spanid();
  *(void *)uint64_t v5 = v6;
  *(void *)(v5 + 8) = spanid;
  *(void *)(v5 + 16) = 0;
  *(_DWORD *)(v5 + 24) = -1;
  *(unsigned char *)(v5 + 28) = 102;
  *(void *)(v5 + 32) = "kSPMessagePreheat";
  si_tracing_log_span_begin();
  kdebug_trace();
  if (qword_1000A8CE0 != -1) {
    dispatch_once(&qword_1000A8CE0, &stru_100092230);
  }
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v5 = v9;
  *(_OWORD *)(v5 + 16) = v10;
  *(void *)(v5 + 32) = v11;
}

void sub_10000978C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1000097A4(id a1)
{
  +[SPCoreSpotlightIndexer preheat];
  uint64_t v1 = +[SDController datastores];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void **)(*((void *)&v7 + 1) + 8 * (void)v5);
        if (objc_opt_respondsToSelector()) {
          [v6 preheat];
        }
        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

void sub_100009A40(id a1)
{
  byte_1000A8CE8 = _os_feature_enabled_impl();
  byte_1000A8CE9 = _os_feature_enabled_impl();
}

void sub_100009F50(id a1)
{
  id v1 = +[SPBackupRankingMetadataHandler sharedInstance];
  [v1 backUpFileProtectionClassCheck];
}

void *sub_10000A214(void *result)
{
  char v1 = byte_1000A8D10;
  if (byte_1000A8D10) {
    qword_1000A8D18 = result[5];
  }
  else {
    __n128 result = [(id)objc_opt_class() handleMemoryPressureWithStatus:result[5]];
  }
  byte_1000A8D11 = v1;
  return result;
}

void sub_10000A500(id a1, SPXPCConnection *a2, SPXPCMessage *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = [(SPXPCConnection *)a2 bundleID];
  uint64_t v6 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412290;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Got apps from %@", (uint8_t *)&v20, 0xCu);
  }

  if ([(SPXPCMessage *)v5 isEqualToString:@"com.apple.springboard"])
  {
    kdebug_trace();
    long long v7 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Accepting apps from %@", (uint8_t *)&v20, 0xCu);
    }

    if (qword_1000A8D30 != -1) {
      dispatch_once(&qword_1000A8D30, &stru_1000922D8);
    }
    long long v8 = [(SPXPCMessage *)v4 rootObjectOfClasses:qword_1000A8D28];
    long long v9 = SPLogForSPLogCategoryDefault();
    os_log_type_t v10 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = [v8 count];
      uint64_t v12 = [v8 objectForKey:@"apps"];
      id v13 = [v12 count];
      long long v14 = [v8 objectForKey:@"apps"];
      uint64_t v15 = [v8 objectForKey:@"hiddenApps"];
      int v20 = 138413314;
      id v21 = v4;
      __int16 v22 = 2048;
      id v23 = v11;
      __int16 v24 = 2048;
      id v25 = v13;
      __int16 v26 = 2112;
      v27 = v14;
      __int16 v28 = 2112;
      v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Received apps: %@ %ld %ld %@ %@", (uint8_t *)&v20, 0x34u);
    }
    if (v8)
    {
      id v16 = [v8 objectForKey:@"apps"];
      id v17 = [v8 objectForKey:@"hiddenApps"];
      SPFastApplicationsSet();
    }
    id v18 = +[SDAppUninstallMonitor sharedInstance];
    [v18 ready];
  }
  else
  {
    long long v8 = SPLogForSPLogCategoryDefault();
    os_log_type_t v19 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v8, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      int v20 = 138412290;
      id v21 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, v19, "Dropping apps from %@", (uint8_t *)&v20, 0xCu);
    }
  }
}

void sub_10000A868(id a1)
{
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  qword_1000A8D28 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);

  _objc_release_x1();
}

void sub_10000A924(id a1, SPXPCConnection *a2, SPXPCMessage *a3)
{
  id v13 = a2;
  uint64_t v4 = a3;
  +[SDController readyForQueries];
  uint64_t v5 = [(SPXPCMessage *)v4 feedbackData];
  if (v5)
  {
    uint64_t v6 = [(SPXPCMessage *)v4 info];
    long long v7 = [v6 objectForKeyedSubscript:@"FBT"];
    long long v8 = (char *)[v7 integerValue];

    if ((unint64_t)(v8 - 1) <= 0x19)
    {
      long long v9 = [v6 objectForKeyedSubscript:@"QID"];
      id v10 = [v9 unsignedLongLongValue];
      id v11 = +[SPFeedbackProxy sharedProxy];
      uint64_t v12 = [(SPXPCConnection *)v13 bundleID];
      [v11 sendFeedbackType:v8 feedbackData:v5 queryId:v10 clientID:v12];
    }
  }
}

void sub_10000AA58(id a1, SPXPCConnection *a2, SPXPCMessage *a3)
{
  uint64_t v4 = a3;
  uint64_t v5 = [(SPXPCConnection *)a2 bundleID];
  uint64_t v6 = SPLogForSPLogCategoryDefault();
  os_log_type_t v7 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v6, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    int v11 = 138412290;
    uint64_t v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Dropping message from %@", (uint8_t *)&v11, 0xCu);
  }

  long long v8 = SPLogForSPLogCategoryDefault();
  os_log_type_t v9 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v8, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    id v10 = [(SPXPCMessage *)v4 name];
    int v11 = 138412546;
    uint64_t v12 = v10;
    __int16 v13 = 2112;
    long long v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Dropping  %@ %@", (uint8_t *)&v11, 0x16u);
  }
}

void sub_10000AE10(id a1)
{
  id v1 = (id)SPFastApplicationsGet();
}

void sub_10000B040(uint64_t a1)
{
  tracing_dispatch_async();
  uint64_t v2 = +[NSMutableArray array];
  if (byte_1000A8738)
  {
    uint64_t v3 = +[SPCoreSpotlightDatastore sharedInstance];
    if (v3) {
      [v2 addObject:v3];
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  uint64_t v4 = +[NSUserDefaults standardUserDefaults];
  unsigned int v5 = [v4 BOOLForKey:@"ParsecSplitRequests"];

  if (v5)
  {
    uint64_t v6 = objc_alloc_init(SPParsecSuggestionsDatastore);

    if (v6)
    {
      [v2 addObject:v6];
      [(id)objc_opt_class() setParsecDatastore:v6];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000B4D4;
      v26[3] = &unk_1000921B0;
      v27 = v6;
      +[SPFeedbackSender synchronizedBlock:v26];
    }
    os_log_type_t v7 = objc_alloc_init(SPParsecResultsDatastore);

    if (v7) {
      [v2 addObject:v7];
    }
  }
  else
  {
    long long v8 = objc_alloc_init(SPParsecDatastore);

    if (v8)
    {
      [v2 addObject:v8];
      [(id)objc_opt_class() setParsecDatastore:v8];
      id v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      id v23 = sub_10000B4E4;
      __int16 v24 = &unk_1000921B0;
      os_log_type_t v7 = v8;
      id v25 = v7;
      +[SPFeedbackSender synchronizedBlock:&v21];
    }
    else
    {
      os_log_type_t v7 = 0;
    }
  }
  os_log_type_t v9 = objc_alloc_init(SPDefaultSearchDatastore);

  if (v9) {
    [v2 addObject:v9];
  }
  id v10 = objc_alloc_init(SPDictionaryDatastore);

  if (v10) {
    [v2 addObject:v10];
  }
  int v11 = objc_alloc_init(SPCalculationDatastore);

  if (v11) {
    [v2 addObject:v11];
  }
  uint64_t v12 = objc_alloc_init(SPBookmarkDatastore);

  if (v12) {
    [v2 addObject:v12];
  }
  if (_os_feature_enabled_impl())
  {
    __int16 v13 = objc_alloc_init(SPRecommendationDatastore);

    if (v13)
    {
      [v2 addObject:v13];
      uint64_t v12 = (SPBookmarkDatastore *)v13;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  if (_os_feature_enabled_impl())
  {
    long long v14 = objc_alloc_init(SPWorldClockDatastore);

    if (v14)
    {
      [v2 addObject:v14];
      uint64_t v12 = (SPBookmarkDatastore *)v14;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  if (_os_feature_enabled_impl())
  {
    uint64_t v15 = objc_alloc_init(SPDataDetectorsDataStore);

    if (v15)
    {
      [v2 addObject:v15];
      uint64_t v12 = (SPBookmarkDatastore *)v15;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "setDatastores:", v2, v21, v22, v23, v24);
  id v16 = +[SDLockHandler sharedLockHandler];
  unsigned int v17 = [v16 unlockedSinceBoot];

  if (v17) {
    dispatch_get_global_queue(25, 0);
  }
  else {
  id v18 = +[SDController workQueue];
  }
  tracing_dispatch_async();

  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      id v19 = +[PRSRankingItemRanker englishEmbedding];
      id v20 = +[PRSRankingItemRanker preferredEmbedding];
    }
    +[PRSRankingItemRanker languageModel];
  }
}

void sub_10000B4C8(id a1)
{
}

id sub_10000B4D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setParsecFeedbackAllowed:byte_1000A8D49];
}

id sub_10000B4E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setParsecFeedbackAllowed:byte_1000A8D49];
}

void sub_10000B4F4(id a1)
{
  id v1 = +[SRResourcesManager sharedResourcesManager];
  [v1 loadAllParametersForClient:@"Spotlight"];

  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    +[SSRankingManager reloadRankingParametersFromTrial];
    id v2 = +[PRSModelManager sharedModelManager];
  }
  id v3 = +[CSFileProviderContainerCache sharedInstance];
  [v3 refreshCache];
}

void sub_10000B5B8(id a1)
{
  id v1 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_100064D44();
  }

  id v2 = +[SPCoreSpotlightDatastore sharedInstance];
  [v2 loadTrialDataOnActivate];
}

void sub_10000B6F0(id a1)
{
  id v1 = +[SPApplicationMetadataUpdater sharedInstance];
  id v2 = +[SPBackupRankingMetadataHandler sharedInstance];
}

void sub_10000BF64(id a1)
{
}

void sub_10000BF70(id a1, SPXPCConnection *a2)
{
  id v3 = a2;
  id v2 = v3;
  tracing_dispatch_async();
}

id sub_10000C008(uint64_t a1)
{
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%@ Connection Disconnected", (uint8_t *)&v7, 0xCu);
  }

  unsigned int v5 = [*(id *)(a1 + 32) context];
  [v5 death];

  return [*(id *)(a1 + 32) setContext:0];
}

void sub_10000C0F0(id a1, SPXPCConnection *a2)
{
  os_log_type_t v3 = a2;
  id v2 = v3;
  tracing_dispatch_async();
}

void sub_10000C188(uint64_t a1)
{
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "%@ Background Connection Disconnected", (uint8_t *)&v5, 0xCu);
  }
}

void sub_10000C24C(id a1, SPXPCConnection *a2, SPXPCMessage *a3)
{
  os_log_type_t v3 = a3;
  uint64_t v4 = SPLogForSPLogCategoryDefault();
  os_log_type_t v5 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v4, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    int v6 = 138412290;
    int v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Background connection got unexpected message %@", (uint8_t *)&v6, 0xCu);
  }
}

void sub_10000C314(id a1, SPXPCConnection *a2, SPXPCMessage *a3)
{
  os_log_type_t v3 = a3;
  uint64_t v4 = SPLogForSPLogCategoryDefault();
  os_log_type_t v5 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v4, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    int v6 = 138412290;
    int v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Got unexpected message %@", (uint8_t *)&v6, 0xCu);
  }
}

id sub_10000C3DC(uint64_t a1)
{
  id v2 = SPLogForSPLogCategoryIndex();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "### migrationComplete", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 40) migrateForced:0];
}

void sub_10000C458(id a1)
{
  id v2 = +[PRSAnonymousPipelineManager sharedManager];
  id v1 = +[SPFeedbackProxy sharedProxy];
  [v2 setFeedbackDelegate:v1];
}

uint64_t sub_10000C4C8()
{
  pid_t v0 = getpid();

  return killpg(v0, 15);
}

void sub_10000C4F4(id a1)
{
  +[SPBackupRankingMetadataHandler clearDirtyState];

  +[SPBackupRankingMetadataHandler checkForRestoreFile];
}

void sub_10000C530(id a1)
{
  id v1 = dispatch_get_global_queue(17, 0);
  dispatch_async(v1, &stru_100092518);
}

void sub_10000C580(id a1)
{
  id v1 = NSHomeDirectory();
  id v2 = [v1 stringByAppendingString:@"/Library/Spotlight/Assets"];

  os_log_type_t v3 = +[NSFileManager defaultManager];
  unsigned __int8 v4 = [v3 fileExistsAtPath:v2];

  if ((v4 & 1) != 0
    || (+[NSFileManager defaultManager],
        os_log_type_t v5 = objc_claimAutoreleasedReturnValue(),
        id v9 = 0,
        [v5 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:&v9],
        id v6 = v9,
        v5,
        !v6))
  {
    id v6 = +[SRResourcesManager sharedResourcesManager];
    int v7 = +[NSLocale preferredLanguages];
    uint64_t v8 = +[NSSet setWithArray:v7];
    [v6 fetchAllParametersForLanguages:v8 resourcePath:v2];
  }
  else
  {
    int v7 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100064D78();
    }
  }
}

void sub_10000C928(id a1)
{
  id v1 = SPLogForSPLogCategoryDefault();
  os_log_type_t v2 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v1, v2))
  {
    v3[0] = 67109120;
    v3[1] = byte_1000A8D49;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "[FEEDBACK-DEBUG] (_userPrefsChanged) _permitParsecFeedback: %d", (uint8_t *)v3, 8u);
  }

  [(id)qword_1000A8D50 setParsecFeedbackAllowed:byte_1000A8D49];
}

void sub_10000CB24(id a1)
{
  id v1 = +[SPBackupRankingMetadataHandler sharedInstance];
  uint64_t v2 = [v1 getBackUpFilePath];
  os_log_type_t v3 = (void *)qword_1000A8D80;
  qword_1000A8D80 = v2;

  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.searchd"];
  byte_1000A8D78 = [v4 BOOLForKey:@"allowlistedOnly"];
}

void sub_10000CBBC(id a1)
{
  dispatch_get_global_queue(9, 0);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  tracing_dispatch_async();
}

void sub_10000CC0C(id a1)
{
  id v1 = +[SPBackupRankingMetadataHandler sharedInstance];
  [v1 tryRestoreFromBackUp];
}

id sub_10000D22C(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "bundleIdentifier", (void)v11);
        [v2 addObject:v8];
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  id v9 = [v2 copy];

  return v9;
}

void sub_10000D5D8()
{
  pid_t v0 = dispatch_get_global_queue(0, 0);
  tracing_dispatch_async();
}

void sub_10000D66C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)CSSearchQueryContext);
  NSFileProtectionType v78 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  id v3 = +[NSArray arrayWithObjects:&v78 count:1];
  [v2 setProtectionClasses:v3];

  [v2 setLowPriority:1];
  uint64_t v4 = MDItemUniqueIdentifier;
  uint64_t v5 = MDItemBundleID;
  v77[0] = MDItemUniqueIdentifier;
  v77[1] = MDItemBundleID;
  v77[2] = MDItemEmailAddresses;
  uint64_t v6 = +[NSArray arrayWithObjects:v77 count:3];
  [v2 setFetchAttributes:v6];

  int v7 = [v2 fetchAttributes];
  id v8 = [v7 count];

  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_10000DE44;
  v67[3] = &unk_100092610;
  id v69 = v8;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v68 = v9;
  id v10 = objc_retainBlock(v67);
  long long v11 = +[SPCoreSpotlightIndexer sharedInstance];
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_10000E140;
  v65[3] = &unk_100091E18;
  id v53 = v9;
  uint64_t v54 = v10;
  id v66 = v53;
  uint64_t v12 = [v11 taskForQueryWithQueryString:@"(_kMDItemBundleID = com.apple.MobileAddressBook) && (kMDItemEmailAddresses=*)" queryContext:v2 eventHandler:0 resultsHandler:v10 completionHandler:v65];

  long long v13 = +[SPCoreSpotlightIndexer sharedInstance];
  v55 = (void *)v12;
  [v13 startQueryTask:v12];

  id v14 = objc_alloc_init((Class)CSSearchQueryContext);
  NSFileProtectionType v76 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  uint64_t v15 = +[NSArray arrayWithObjects:&v76 count:1];
  [v14 setProtectionClasses:v15];

  [v14 setLowPriority:1];
  v75[0] = v4;
  v75[1] = v5;
  v75[2] = MDItemIncomingCounts;
  v75[3] = MDItemOutgoingCounts;
  v75[4] = MDItemIncomingMailCounts;
  v75[5] = MDItemOutgoingMailCounts;
  v75[6] = MDItemIncomingSMSCounts;
  v75[7] = MDItemOutgoingSMSCounts;
  v75[8] = MDItemIncomingCalendarCounts;
  v75[9] = MDItemOutgoingCalendarCounts;
  v75[10] = MDItemIncomingFileProviderCounts;
  v75[11] = MDItemOutgoingFileProviderCounts;
  id v16 = +[NSArray arrayWithObjects:v75 count:12];
  [v14 setFetchAttributes:v16];

  unsigned int v17 = [v14 fetchAttributes];
  id v18 = [v17 count];

  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_10000E210;
  v61[3] = &unk_100092660;
  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 40);
  id v63 = v18;
  uint64_t v64 = v20;
  v61[4] = v21;
  id v22 = v19;
  id v62 = v22;
  id v23 = objc_retainBlock(v61);
  __int16 v24 = +[SPCoreSpotlightIndexer sharedInstance];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10000F224;
  v59[3] = &unk_100091E18;
  id v25 = v22;
  id v60 = v25;
  __int16 v26 = [v24 taskForQueryWithQueryString:@"(_kMDItemBundleID = com.apple.MobileAddressBook) && (_kMDItemIncomingCounts=* || _kMDItemOutgoingCounts=* || _kMDItemIncomingMailCounts=* || _kMDItemOutgoingMailCounts=* || _kMDItemIncomingSMSCounts=* || _kMDItemOutgoingSMSCounts=* || _kMDItemIncomingCalendarCounts=* || _kMDItemOutgoingCalendarCounts=* || _kMDItemIncomingFileProviderCounts=* || _kMDItemOutgoingFileProviderCounts=*)" queryContext:v14 eventHandler:0 resultsHandler:v23 completionHandler:v59];

  v27 = +[SPCoreSpotlightIndexer sharedInstance];
  [v27 startQueryTask:v26];

  id v28 = objc_alloc((Class)CNContactStore);
  v29 = objc_opt_new();
  id v30 = [v28 initWithConfiguration:v29];

  v74[0] = CNContactIdentifierKey;
  v74[1] = CNContactGivenNameKey;
  v74[2] = CNContactMiddleNameKey;
  v74[3] = CNContactFamilyNameKey;
  v74[4] = CNContactEmailAddressesKey;
  v74[5] = CNContactPhoneNumbersKey;
  v31 = +[NSArray arrayWithObjects:v74 count:6];
  id v58 = 0;
  v32 = objc_msgSend(v30, "_ios_meContactWithKeysToFetch:error:", v31, &v58);
  id v33 = v58;

  if (v33)
  {
    v34 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_100064DAC(v33, v34);
    }
  }
  else
  {
    v35 = v26;
    v36 = objc_opt_new();
    uint64_t v37 = [v32 emailAddresses];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_10000F2F4;
    v56[3] = &unk_100092688;
    v34 = v36;
    v57 = v34;
    [v37 enumerateObjectsUsingBlock:v56];

    v38 = [v32 identifier];

    if (v38)
    {
      os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A8D20);
      uint64_t v39 = [v32 identifier];
      v40 = (void *)qword_1000A8CF8;
      qword_1000A8CF8 = v39;

      objc_storeStrong((id *)&qword_1000A8D00, v36);
      id v41 = objc_alloc((Class)NSSet);
      CFSetRef v42 = (const __CFSet *)[v41 initWithArray:qword_1000A8D00];
      CFSetRef Copy = CFSetCreateCopy(kCFAllocatorDefault, v42);

      os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A8D20);
      if (Copy)
      {
        _SISetMeEmailAddresses();
        CFRelease(Copy);
      }
    }

    __int16 v26 = v35;
    id v33 = 0;
  }

  v44 = SPLogForSPLogCategoryDefault();
  os_log_type_t v45 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v44, v45))
  {
    +[SPCoreSpotlightIndexer sharedInstance];
    id v52 = v33;
    id v46 = v14;
    v47 = v32;
    id v48 = v30;
    id v49 = v2;
    v51 = unsigned int v50 = v26;
    *(_DWORD *)buf = 138412546;
    v71 = v55;
    __int16 v72 = 2112;
    v73 = v51;
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "Contacts task:%@ indexer:%@", buf, 0x16u);

    __int16 v26 = v50;
    id v2 = v49;
    id v30 = v48;
    v32 = v47;
    id v14 = v46;
    id v33 = v52;
  }
}

void sub_10000DE44(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!a2)
  {
    uint64_t v11 = v5;
    uint64_t v12 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10000DEE4;
    v9[3] = &unk_1000925E8;
    uint64_t v8 = *(void *)(a1 + 40);
    id v10 = *(id *)(a1 + 32);
    [a5 enumerateQueryResults:v8 stringCache:0 usingBlock:v9];
  }
}

void sub_10000DEE4(uint64_t a1, CFNullRef *a2)
{
  CFNullRef v5 = a2[2];
  if (v5 == kCFNull) {
    CFNullRef v5 = 0;
  }
  CFNullRef v6 = v5;
  CFNullRef v7 = *a2;
  if (*a2 == kCFNull) {
    CFNullRef v7 = 0;
  }
  CFNullRef v8 = v7;
  id v9 = SPLogForSPLogCategoryDefault();
  os_log_type_t v10 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v9, v10))
  {
    CFNullRef v11 = *a2;
    CFNullRef v12 = a2[1];
    CFNullRef v13 = a2[2];
    *(_DWORD *)buf = 138412802;
    CFNullRef v21 = v11;
    __int16 v22 = 2112;
    CFNullRef v23 = v12;
    __int16 v24 = 2112;
    CFNullRef v25 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "result: %@ %@ %@", buf, 0x20u);
  }

  id v14 = SPLogForSPLogCategoryDefault();
  os_log_type_t v15 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v14, v15))
  {
    *(_DWORD *)buf = 138412546;
    CFNullRef v21 = v8;
    __int16 v22 = 2112;
    CFNullRef v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "contact: %@ %@", buf, 0x16u);
  }

  if (v8)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10000E130;
    v17[3] = &unk_1000925C0;
    id v18 = *(id *)(a1 + 32);
    CFNullRef v19 = v8;
    [(__CFNull *)v6 enumerateObjectsUsingBlock:v17];

    id v16 = v18;
  }
  else
  {
    id v16 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100064E38();
    }
  }
}

id sub_10000E130(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKey:a2];
}

uint64_t sub_10000E140(uint64_t a1)
{
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "contacts: %@", (uint8_t *)&v6, 0xCu);
  }

  return _SISetKnownContactEmailMapping();
}

void sub_10000E210(void *a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (!a2)
  {
    uint64_t v14 = v5;
    uint64_t v15 = v6;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000E2BC;
    v11[3] = &unk_100092638;
    uint64_t v8 = a1[6];
    uint64_t v9 = a1[4];
    os_log_type_t v10 = (void *)a1[5];
    uint64_t v13 = a1[7];
    v11[4] = v9;
    id v12 = v10;
    [a5 enumerateQueryResults:v8 stringCache:0 usingBlock:v11];
  }
}

void sub_10000E2BC(uint64_t a1, CFNullRef *a2)
{
  uint64_t v155 = a1;
  CFNullRef v3 = a2[2];
  if (v3 == kCFNull) {
    CFNullRef v3 = 0;
  }
  CFNullRef v167 = v3;
  CFNullRef v4 = a2[3];
  if (v4 == kCFNull) {
    CFNullRef v4 = 0;
  }
  CFNullRef v157 = v4;
  CFNullRef v5 = a2[4];
  if (v5 == kCFNull) {
    CFNullRef v5 = 0;
  }
  CFNullRef v165 = v5;
  CFNullRef v6 = a2[5];
  if (v6 == kCFNull) {
    CFNullRef v6 = 0;
  }
  CFNullRef v164 = v6;
  CFNullRef v7 = a2[6];
  if (v7 == kCFNull) {
    CFNullRef v7 = 0;
  }
  CFNullRef v163 = v7;
  CFNullRef v8 = a2[7];
  if (v8 == kCFNull) {
    CFNullRef v8 = 0;
  }
  CFNullRef v162 = v8;
  CFNullRef v9 = a2[8];
  if (v9 == kCFNull) {
    CFNullRef v9 = 0;
  }
  CFNullRef v161 = v9;
  CFNullRef v10 = a2[9];
  if (v10 == kCFNull) {
    CFNullRef v10 = 0;
  }
  CFNullRef v160 = v10;
  CFNullRef v11 = a2[10];
  if (v11 == kCFNull) {
    CFNullRef v11 = 0;
  }
  CFNullRef v159 = v11;
  CFNullRef v12 = a2[11];
  if (v12 == kCFNull) {
    CFNullRef v12 = 0;
  }
  CFNullRef v13 = v12;
  CFNullRef v14 = *a2;
  if (*a2 == kCFNull) {
    CFNullRef v14 = 0;
  }
  CFNullRef v158 = v14;
  uint64_t v15 = SPLogForSPLogCategoryDefault();
  os_log_type_t v16 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v15, v16))
  {
    CFNullRef v17 = *a2;
    CFNullRef v18 = a2[1];
    CFNullRef v19 = a2[2];
    CFNullRef v20 = a2[3];
    CFNullRef v21 = a2[4];
    CFNullRef v22 = a2[5];
    CFNullRef v23 = a2[6];
    CFNullRef v24 = a2[7];
    *(_DWORD *)buf = 138414082;
    CFNullRef v221 = v17;
    __int16 v222 = 2112;
    CFNullRef v223 = v18;
    __int16 v224 = 2112;
    CFNullRef v225 = v19;
    __int16 v226 = 2112;
    CFNullRef v227 = v20;
    __int16 v228 = 2112;
    CFNullRef v229 = v21;
    __int16 v230 = 2112;
    CFNullRef v231 = v22;
    __int16 v232 = 2112;
    CFNullRef v233 = v23;
    __int16 v234 = 2112;
    CFNullRef v235 = v24;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "result: %@ %@ %@ %@ %@ %@ %@ %@", buf, 0x52u);
  }

  CFNullRef v25 = SPLogForSPLogCategoryDefault();
  os_log_type_t v26 = 2 * (gSPLogDebugAsDefault == 0);
  CFNullRef v27 = v157;
  if (os_log_type_enabled(v25, v26))
  {
    *(_DWORD *)buf = 138414850;
    CFNullRef v221 = v158;
    __int16 v222 = 2112;
    CFNullRef v223 = v167;
    __int16 v224 = 2112;
    CFNullRef v225 = v157;
    __int16 v226 = 2112;
    CFNullRef v227 = v165;
    __int16 v228 = 2112;
    CFNullRef v229 = v164;
    __int16 v230 = 2112;
    CFNullRef v231 = v163;
    __int16 v232 = 2112;
    CFNullRef v233 = v162;
    __int16 v234 = 2112;
    CFNullRef v235 = v161;
    __int16 v236 = 2112;
    CFNullRef v237 = v160;
    __int16 v238 = 2112;
    CFNullRef v239 = v159;
    __int16 v240 = 2112;
    CFNullRef v241 = v13;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "contact: %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@", buf, 0x70u);
  }

  CFNullRef v28 = v167;
  CFNullRef v29 = v158;
  if (v158)
  {
    uint64_t v154 = (uint64_t)&v154;
    v168 = &v153;
    id v30 = -[__CFNull count](v167, "count", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0);
    CFNullRef v166 = v13;
    if (v30)
    {
      long long v208 = 0u;
      long long v209 = 0u;
      long long v206 = 0u;
      long long v207 = 0u;
      CFNullRef v31 = v28;
      id v32 = [(__CFNull *)v31 countByEnumeratingWithState:&v206 objects:v219 count:16];
      if (v32)
      {
        id v33 = v32;
        uint64_t v169 = 0;
        int v34 = 0;
        uint64_t v35 = *(void *)v207;
        uint64_t v36 = 1;
        int v37 = 4;
        while (2)
        {
          v38 = 0;
          int v39 = v37;
          int v40 = v34;
          do
          {
            if (*(void *)v207 != v35) {
              objc_enumerationMutation(v31);
            }
            if (v39 == v38)
            {
              int v43 = 0;
              int v42 = v40 + v38;
              goto LABEL_42;
            }
            CFNullRef v41 = *(const __CFNull **)(*((void *)&v206 + 1) + 8 * (void)v38);
            if (v41 != kCFNull
              && [*(id *)(*((void *)&v206 + 1) + 8 * (void)v38) intValue])
            {
              v168[(int)v36] = (uint64_t)v41;
              v169 |= 1 << (v40 + v38);
              uint64_t v36 = (v36 + 1);
            }
            v38 = (char *)v38 + 1;
          }
          while (v33 != v38);
          id v33 = [(__CFNull *)v31 countByEnumeratingWithState:&v206 objects:v219 count:16];
          int v34 = v40 + v38;
          int v37 = v39 - v38;
          if (v33) {
            continue;
          }
          break;
        }
        int v42 = v40 + v38;
        int v43 = v39 - v38;
LABEL_42:
        CFNullRef v13 = v166;
      }
      else
      {
        uint64_t v169 = 0;
        int v42 = 0;
        int v43 = 4;
        uint64_t v36 = 1;
      }

      int v44 = v43 + v42;
      CFNullRef v27 = v157;
      CFNullRef v28 = v167;
    }
    else
    {
      uint64_t v169 = 0;
      int v44 = 4;
      uint64_t v36 = 1;
    }
    if ([(__CFNull *)v27 count])
    {
      long long v204 = 0u;
      long long v205 = 0u;
      long long v202 = 0u;
      long long v203 = 0u;
      CFNullRef v45 = v27;
      id v46 = [(__CFNull *)v45 countByEnumeratingWithState:&v202 objects:v218 count:16];
      if (v46)
      {
        id v47 = v46;
        uint64_t v48 = *(void *)v203;
        int v49 = 4;
        while (2)
        {
          unsigned int v50 = 0;
          int v51 = v49;
          int v52 = v44;
          do
          {
            if (*(void *)v203 != v48) {
              objc_enumerationMutation(v45);
            }
            if (v51 == v50)
            {
              int v54 = 0;
              int v44 = v52 + v50;
              goto LABEL_60;
            }
            CFNullRef v53 = *(const __CFNull **)(*((void *)&v202 + 1) + 8 * (void)v50);
            if (v53 != kCFNull
              && [*(id *)(*((void *)&v202 + 1) + 8 * (void)v50) intValue])
            {
              v168[(int)v36] = (uint64_t)v53;
              v169 |= 1 << (v52 + v50);
              uint64_t v36 = (v36 + 1);
            }
            unsigned int v50 = (char *)v50 + 1;
          }
          while (v47 != v50);
          id v47 = [(__CFNull *)v45 countByEnumeratingWithState:&v202 objects:v218 count:16];
          int v44 = v52 + v50;
          int v49 = v51 - v50;
          if (v47) {
            continue;
          }
          break;
        }
        int v44 = v52 + v50;
        int v54 = v51 - v50;
LABEL_60:
        CFNullRef v13 = v166;
      }
      else
      {
        int v54 = 4;
      }

      CFNullRef v28 = v167;
    }
    else
    {
      int v54 = 4;
    }
    int v55 = v54 + v44;
    CFNullRef v56 = v165;
    if ([(__CFNull *)v165 count])
    {
      long long v200 = 0u;
      long long v201 = 0u;
      long long v198 = 0u;
      long long v199 = 0u;
      CFNullRef v57 = v56;
      id v58 = [(__CFNull *)v57 countByEnumeratingWithState:&v198 objects:v217 count:16];
      if (v58)
      {
        id v59 = v58;
        uint64_t v60 = *(void *)v199;
        int v61 = 4;
        while (2)
        {
          id v62 = 0;
          int v63 = v61;
          int v64 = v55;
          do
          {
            if (*(void *)v199 != v60) {
              objc_enumerationMutation(v57);
            }
            if (v63 == v62)
            {
              int v66 = 0;
              int v55 = v64 + v62;
              goto LABEL_78;
            }
            CFNullRef v65 = *(const __CFNull **)(*((void *)&v198 + 1) + 8 * (void)v62);
            if (v65 != kCFNull
              && [*(id *)(*((void *)&v198 + 1) + 8 * (void)v62) intValue])
            {
              v168[(int)v36] = (uint64_t)v65;
              v169 |= 1 << (v64 + v62);
              uint64_t v36 = (v36 + 1);
            }
            id v62 = (char *)v62 + 1;
          }
          while (v59 != v62);
          id v59 = [(__CFNull *)v57 countByEnumeratingWithState:&v198 objects:v217 count:16];
          int v55 = v64 + v62;
          int v61 = v63 - v62;
          if (v59) {
            continue;
          }
          break;
        }
        int v55 = v64 + v62;
        int v66 = v63 - v62;
LABEL_78:
        CFNullRef v13 = v166;
      }
      else
      {
        int v66 = 4;
      }

      CFNullRef v28 = v167;
    }
    else
    {
      int v66 = 4;
    }
    int v67 = v66 + v55;
    CFNullRef v68 = v164;
    if ([(__CFNull *)v164 count])
    {
      long long v196 = 0u;
      long long v197 = 0u;
      long long v194 = 0u;
      long long v195 = 0u;
      CFNullRef v69 = v68;
      id v70 = [(__CFNull *)v69 countByEnumeratingWithState:&v194 objects:v216 count:16];
      if (v70)
      {
        id v71 = v70;
        uint64_t v72 = *(void *)v195;
        int v73 = 4;
        while (2)
        {
          v74 = 0;
          int v75 = v73;
          int v76 = v67;
          do
          {
            if (*(void *)v195 != v72) {
              objc_enumerationMutation(v69);
            }
            if (v75 == v74)
            {
              int v78 = 0;
              int v67 = v76 + v74;
              goto LABEL_96;
            }
            CFNullRef v77 = *(const __CFNull **)(*((void *)&v194 + 1) + 8 * (void)v74);
            if (v77 != kCFNull
              && [*(id *)(*((void *)&v194 + 1) + 8 * (void)v74) intValue])
            {
              v168[(int)v36] = (uint64_t)v77;
              v169 |= 1 << (v76 + v74);
              uint64_t v36 = (v36 + 1);
            }
            v74 = (char *)v74 + 1;
          }
          while (v71 != v74);
          id v71 = [(__CFNull *)v69 countByEnumeratingWithState:&v194 objects:v216 count:16];
          int v67 = v76 + v74;
          int v73 = v75 - v74;
          if (v71) {
            continue;
          }
          break;
        }
        int v67 = v76 + v74;
        int v78 = v75 - v74;
LABEL_96:
        CFNullRef v13 = v166;
      }
      else
      {
        int v78 = 4;
      }

      CFNullRef v28 = v167;
    }
    else
    {
      int v78 = 4;
    }
    int v79 = v78 + v67;
    CFNullRef v80 = v163;
    if ([(__CFNull *)v163 count])
    {
      long long v192 = 0u;
      long long v193 = 0u;
      long long v190 = 0u;
      long long v191 = 0u;
      CFNullRef v81 = v80;
      id v82 = [(__CFNull *)v81 countByEnumeratingWithState:&v190 objects:v215 count:16];
      if (v82)
      {
        id v83 = v82;
        uint64_t v84 = *(void *)v191;
        int v85 = 4;
        while (2)
        {
          v86 = 0;
          int v87 = v85;
          int v88 = v79;
          do
          {
            if (*(void *)v191 != v84) {
              objc_enumerationMutation(v81);
            }
            if (v87 == v86)
            {
              int v90 = 0;
              int v79 = v88 + v86;
              goto LABEL_114;
            }
            CFNullRef v89 = *(const __CFNull **)(*((void *)&v190 + 1) + 8 * (void)v86);
            if (v89 != kCFNull
              && [*(id *)(*((void *)&v190 + 1) + 8 * (void)v86) intValue])
            {
              v168[(int)v36] = (uint64_t)v89;
              v169 |= 1 << (v88 + v86);
              uint64_t v36 = (v36 + 1);
            }
            v86 = (char *)v86 + 1;
          }
          while (v83 != v86);
          id v83 = [(__CFNull *)v81 countByEnumeratingWithState:&v190 objects:v215 count:16];
          int v79 = v88 + v86;
          int v85 = v87 - v86;
          if (v83) {
            continue;
          }
          break;
        }
        int v79 = v88 + v86;
        int v90 = v87 - v86;
LABEL_114:
        CFNullRef v13 = v166;
      }
      else
      {
        int v90 = 4;
      }

      CFNullRef v28 = v167;
    }
    else
    {
      int v90 = 4;
    }
    int v91 = v90 + v79;
    CFNullRef v92 = v162;
    if ([(__CFNull *)v162 count])
    {
      long long v188 = 0u;
      long long v189 = 0u;
      long long v186 = 0u;
      long long v187 = 0u;
      CFNullRef v93 = v92;
      id v94 = [(__CFNull *)v93 countByEnumeratingWithState:&v186 objects:v214 count:16];
      if (v94)
      {
        id v95 = v94;
        uint64_t v96 = *(void *)v187;
        int v97 = 4;
        while (2)
        {
          v98 = 0;
          int v99 = v97;
          int v100 = v91;
          do
          {
            if (*(void *)v187 != v96) {
              objc_enumerationMutation(v93);
            }
            if (v99 == v98)
            {
              int v102 = 0;
              int v91 = v100 + v98;
              goto LABEL_132;
            }
            CFNullRef v101 = *(const __CFNull **)(*((void *)&v186 + 1) + 8 * (void)v98);
            if (v101 != kCFNull
              && [*(id *)(*((void *)&v186 + 1) + 8 * (void)v98) intValue])
            {
              v168[(int)v36] = (uint64_t)v101;
              v169 |= 1 << (v100 + v98);
              uint64_t v36 = (v36 + 1);
            }
            v98 = (char *)v98 + 1;
          }
          while (v95 != v98);
          id v95 = [(__CFNull *)v93 countByEnumeratingWithState:&v186 objects:v214 count:16];
          int v91 = v100 + v98;
          int v97 = v99 - v98;
          if (v95) {
            continue;
          }
          break;
        }
        int v91 = v100 + v98;
        int v102 = v99 - v98;
LABEL_132:
        CFNullRef v13 = v166;
      }
      else
      {
        int v102 = 4;
      }

      CFNullRef v28 = v167;
    }
    else
    {
      int v102 = 4;
    }
    int v103 = v102 + v91;
    CFNullRef v104 = v161;
    if ([(__CFNull *)v161 count])
    {
      long long v184 = 0u;
      long long v185 = 0u;
      long long v182 = 0u;
      long long v183 = 0u;
      CFNullRef v105 = v104;
      id v106 = [(__CFNull *)v105 countByEnumeratingWithState:&v182 objects:v213 count:16];
      if (v106)
      {
        id v107 = v106;
        uint64_t v108 = *(void *)v183;
        int v109 = 4;
        while (2)
        {
          v110 = 0;
          int v111 = v109;
          int v112 = v103;
          do
          {
            if (*(void *)v183 != v108) {
              objc_enumerationMutation(v105);
            }
            if (v111 == v110)
            {
              int v114 = 0;
              int v103 = v112 + v110;
              goto LABEL_150;
            }
            CFNullRef v113 = *(const __CFNull **)(*((void *)&v182 + 1) + 8 * (void)v110);
            if (v113 != kCFNull
              && [*(id *)(*((void *)&v182 + 1) + 8 * (void)v110) intValue])
            {
              v168[(int)v36] = (uint64_t)v113;
              v169 |= 1 << (v112 + v110);
              uint64_t v36 = (v36 + 1);
            }
            v110 = (char *)v110 + 1;
          }
          while (v107 != v110);
          id v107 = [(__CFNull *)v105 countByEnumeratingWithState:&v182 objects:v213 count:16];
          int v103 = v112 + v110;
          int v109 = v111 - v110;
          if (v107) {
            continue;
          }
          break;
        }
        int v103 = v112 + v110;
        int v114 = v111 - v110;
LABEL_150:
        CFNullRef v13 = v166;
      }
      else
      {
        int v114 = 4;
      }

      CFNullRef v28 = v167;
    }
    else
    {
      int v114 = 4;
    }
    int v115 = v114 + v103;
    CFNullRef v116 = v160;
    if ([(__CFNull *)v160 count])
    {
      long long v180 = 0u;
      long long v181 = 0u;
      long long v178 = 0u;
      long long v179 = 0u;
      CFNullRef v117 = v116;
      id v118 = [(__CFNull *)v117 countByEnumeratingWithState:&v178 objects:v212 count:16];
      if (v118)
      {
        id v119 = v118;
        uint64_t v120 = *(void *)v179;
        int v121 = 4;
        while (2)
        {
          v122 = 0;
          int v123 = v121;
          int v124 = v115;
          do
          {
            if (*(void *)v179 != v120) {
              objc_enumerationMutation(v117);
            }
            if (v123 == v122)
            {
              int v126 = 0;
              int v115 = v124 + v122;
              goto LABEL_168;
            }
            CFNullRef v125 = *(const __CFNull **)(*((void *)&v178 + 1) + 8 * (void)v122);
            if (v125 != kCFNull
              && [*(id *)(*((void *)&v178 + 1) + 8 * (void)v122) intValue])
            {
              v168[(int)v36] = (uint64_t)v125;
              v169 |= 1 << (v124 + v122);
              uint64_t v36 = (v36 + 1);
            }
            v122 = (char *)v122 + 1;
          }
          while (v119 != v122);
          id v119 = [(__CFNull *)v117 countByEnumeratingWithState:&v178 objects:v212 count:16];
          int v115 = v124 + v122;
          int v121 = v123 - v122;
          if (v119) {
            continue;
          }
          break;
        }
        int v115 = v124 + v122;
        int v126 = v123 - v122;
LABEL_168:
        CFNullRef v13 = v166;
      }
      else
      {
        int v126 = 4;
      }

      CFNullRef v28 = v167;
    }
    else
    {
      int v126 = 4;
    }
    int v127 = v126 + v115;
    CFNullRef v128 = v159;
    if ([(__CFNull *)v159 count])
    {
      long long v176 = 0u;
      long long v177 = 0u;
      long long v174 = 0u;
      long long v175 = 0u;
      CFNullRef v129 = v128;
      id v130 = [(__CFNull *)v129 countByEnumeratingWithState:&v174 objects:v211 count:16];
      if (v130)
      {
        id v131 = v130;
        uint64_t v132 = *(void *)v175;
        int v133 = 4;
        while (2)
        {
          v134 = 0;
          int v135 = v133;
          int v136 = v127;
          do
          {
            if (*(void *)v175 != v132) {
              objc_enumerationMutation(v129);
            }
            if (v135 == v134)
            {
              int v138 = 0;
              int v127 = v136 + v134;
              goto LABEL_186;
            }
            CFNullRef v137 = *(const __CFNull **)(*((void *)&v174 + 1) + 8 * (void)v134);
            if (v137 != kCFNull
              && [*(id *)(*((void *)&v174 + 1) + 8 * (void)v134) intValue])
            {
              v168[(int)v36] = (uint64_t)v137;
              v169 |= 1 << (v136 + v134);
              uint64_t v36 = (v36 + 1);
            }
            v134 = (char *)v134 + 1;
          }
          while (v131 != v134);
          id v131 = [(__CFNull *)v129 countByEnumeratingWithState:&v174 objects:v211 count:16];
          int v127 = v136 + v134;
          int v133 = v135 - v134;
          if (v131) {
            continue;
          }
          break;
        }
        int v127 = v136 + v134;
        int v138 = v135 - v134;
LABEL_186:
        CFNullRef v13 = v166;
        CFNullRef v28 = v167;
      }
      else
      {
        int v138 = 4;
      }
    }
    else
    {
      int v138 = 4;
    }
    if ([(__CFNull *)v13 count])
    {
      long long v172 = 0u;
      long long v173 = 0u;
      long long v170 = 0u;
      long long v171 = 0u;
      CFNullRef v139 = v13;
      id v140 = [(__CFNull *)v139 countByEnumeratingWithState:&v170 objects:v210 count:16];
      if (v140)
      {
        id v141 = v140;
        int v142 = v138 + v127;
        uint64_t v143 = *(void *)v171;
        int v144 = 4;
LABEL_193:
        uint64_t v145 = 0;
        int v146 = v142;
        while (1)
        {
          if (*(void *)v171 != v143) {
            objc_enumerationMutation(v139);
          }
          if (v144 == v145) {
            break;
          }
          CFNullRef v147 = *(const __CFNull **)(*((void *)&v170 + 1) + 8 * v145);
          if (v147 != kCFNull && [*(id *)(*((void *)&v170 + 1) + 8 * v145) intValue])
          {
            v168[(int)v36] = (uint64_t)v147;
            v169 |= 1 << (v146 + v145);
            uint64_t v36 = (v36 + 1);
          }
          if (v141 == (id)++v145)
          {
            id v141 = [(__CFNull *)v139 countByEnumeratingWithState:&v170 objects:v210 count:16];
            int v142 = v146 + v145;
            v144 -= v145;
            if (v141) {
              goto LABEL_193;
            }
            break;
          }
        }
      }

      CFNullRef v28 = v167;
    }
    id v148 = +[NSNumber numberWithUnsignedLongLong:v169];
    v149 = v168;
    uint64_t *v168 = (uint64_t)v148;
    CFNullRef v27 = v157;
    uint64_t v150 = v155;
    if ((int)v36 >= 42)
    {
      v152 = +[NSAssertionHandler currentHandler];
      objc_msgSend(v152, "handleFailureInMethod:object:file:lineNumber:description:", *(void *)(v150 + 48), *(void *)(v150 + 32), @"SDController.m", 1065, @"count: %d size: %d", v36, 41);

      CFNullRef v28 = v167;
    }
    id v151 = [objc_alloc((Class)NSArray) initWithObjects:v149 count:(int)v36];
    CFNullRef v29 = v158;
    [*(id *)(v150 + 40) setObject:v151 forKey:v158];

    CFNullRef v13 = v166;
  }
}

uint64_t sub_10000F224(uint64_t a1)
{
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "contacts: %@", (uint8_t *)&v6, 0xCu);
  }

  return _SISetKnownContactCounts();
}

void sub_10000F2F4(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 value];
  [v2 addObject:v3];
}

void sub_10000F49C(uint64_t a1)
{
  id v2 = +[SRResourcesManager sharedResourcesManager];
  [v2 loadAllParameters];

  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0) {
    +[SSRankingManager reloadRankingParametersFromTrial];
  }
  id v3 = *(NSObject **)(a1 + 32);
  if (v3)
  {
    dispatch_group_leave(v3);
  }
}

void sub_10000F538(uint64_t a1)
{
  id v2 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100064E6C();
  }

  if (!_os_feature_enabled_impl() || (_os_feature_enabled_impl() & 1) == 0)
  {
    id v3 = +[SPCoreSpotlightDatastore sharedInstance];
    [v3 loadTrialDataOnActivate];
  }
  uint64_t v4 = *(NSObject **)(a1 + 32);
  if (v4) {
    dispatch_group_leave(v4);
  }
}

void sub_10000F6DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100010190(id a1)
{
  if (byte_1000A8DBC) {
    return;
  }
  if (!qword_1000A8DC0)
  {
    uint64_t v1 = objc_opt_new();
    id v2 = (void *)qword_1000A8DC0;
    qword_1000A8DC0 = v1;
  }
  id v3 = SPFastApplicationsGet();
  os_unfair_lock_lock(&stru_1000A8DB8);
  id v4 = [(id)qword_1000A8DA8 mutableCopy];
  id v5 = [(id)qword_1000A8DA0 mutableCopy];
  os_unfair_lock_unlock(&stru_1000A8DB8);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = [v3 allKeys];
  id v6 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (!v6)
  {
    id v29 = obj;
    goto LABEL_48;
  }
  id v7 = v6;
  CFNullRef v31 = v3;
  uint64_t v32 = 0;
  uint64_t v8 = *(void *)v37;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(void *)v37 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void *)(*((void *)&v36 + 1) + 8 * i);
      if (([v5 containsObject:v10] & 1) == 0
        && ([(id)qword_1000A8DC0 containsObject:v10] & 1) == 0)
      {
        id v11 = objc_alloc((Class)LSApplicationRecord);
        id v35 = 0;
        id v12 = [v11 initWithBundleIdentifier:v10 allowPlaceholder:1 error:&v35];
        id v13 = v35;
        if (v13)
        {
          CFNullRef v14 = v13;
          uint64_t v15 = SPLogForSPLogCategoryDefault();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            CFNullRef v41 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        if (v12)
        {
          unsigned __int8 v16 = [v12 supportsSpotlightQueryContinuation];
          CFNullRef v17 = [v12 iTunesMetadata];
          CFNullRef v18 = [v17 genre];

          if (v16)
          {
            LODWORD(v32) = 1;
            CFNullRef v19 = v5;
            goto LABEL_20;
          }
        }
        else
        {
          CFNullRef v18 = 0;
        }
        CFNullRef v19 = (void *)qword_1000A8DC0;
LABEL_20:
        [v19 addObject:v10];
        CFNullRef v20 = [v4 objectForKey:v10];

        if (!v20 && v18 && ([v18 isEqual:&stru_100094088] & 1) == 0)
        {
          [v4 setObject:v18 forKey:v10];
          HIDWORD(v32) = 1;
        }
      }
      CFNullRef v21 = [v4 objectForKey:v10];

      if (!v21)
      {
        id v22 = objc_alloc((Class)LSApplicationRecord);
        id v34 = 0;
        id v23 = [v22 initWithBundleIdentifier:v10 allowPlaceholder:1 error:&v34];
        id v24 = v34;
        if (v24)
        {
          CFNullRef v25 = v24;
          os_log_type_t v26 = SPLogForSPLogCategoryDefault();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            CFNullRef v41 = v25;
            _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }
        }
        CFNullRef v27 = [v23 iTunesMetadata];
        CFNullRef v28 = [v27 genre];

        if (v28 && ([v28 isEqual:&stru_100094088] & 1) == 0)
        {
          [v4 setObject:v28 forKey:v10];
          HIDWORD(v32) = 1;
        }
      }
    }
    id v7 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
  }
  while (v7);

  id v3 = v31;
  if ((v32 | HIDWORD(v32)))
  {
    if ((v32 & 0x100000000) != 0)
    {
      id v29 = [v4 copy];
      if ((v32 & 1) == 0)
      {
        id v30 = 0;
        goto LABEL_43;
      }
LABEL_42:
      id v30 = [v5 copy];
    }
    else
    {
      id v29 = 0;
      id v30 = 0;
      if (v32) {
        goto LABEL_42;
      }
    }
LABEL_43:
    os_unfair_lock_lock(&stru_1000A8DB8);
    if (v29) {
      objc_storeStrong((id *)&qword_1000A8DA8, v29);
    }
    if (v30) {
      objc_storeStrong((id *)&qword_1000A8DA0, v30);
    }
    os_unfair_lock_unlock(&stru_1000A8DB8);

LABEL_48:
  }
  byte_1000A8DBC = 1;
}

void sub_100010678(id a1)
{
  uint64_t v1 = SPFastApplicationsGet();
  os_unfair_lock_lock(&stru_1000A8DB8);
  id v2 = [(id)qword_1000A8DA8 mutableCopy];
  os_unfair_lock_unlock(&stru_1000A8DB8);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = [v1 allKeys];
  id v4 = [v3 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v4)
  {
    id v5 = v4;
    id v23 = v1;
    char v24 = 0;
    uint64_t v6 = *(void *)v29;
    id v7 = &MDItemInstantMessageAddresses_ptr;
    os_log_type_t v26 = v3;
    uint64_t v27 = *(void *)v29;
    id v25 = v2;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v29 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v2, "objectForKey:", v9, v23);

        if (!v10)
        {
          id v11 = [v7[139] applicationProxyForIdentifier:v9];
          id v12 = SPLogForSPLogCategoryDefault();
          uint64_t v13 = (2 * (gSPLogDebugAsDefault == 0));
          if (os_log_type_enabled(v12, (os_log_type_t)(2 * (gSPLogDebugAsDefault == 0))))
          {
            CFNullRef v14 = [v11 genre];
            [v11 subgenres];
            v16 = id v15 = v5;
            [v11 genreID];
            v18 = CFNullRef v17 = v7;
            *(_DWORD *)buf = 138413058;
            uint64_t v33 = v9;
            __int16 v34 = 2112;
            id v35 = v14;
            __int16 v36 = 2112;
            long long v37 = v16;
            __int16 v38 = 2112;
            long long v39 = v18;
            _os_log_impl((void *)&_mh_execute_header, v12, (os_log_type_t)v13, "%@ genre %@, subgenre %@, id %@", buf, 0x2Au);

            id v7 = v17;
            id v5 = v15;

            id v2 = v25;
            id v3 = v26;
            uint64_t v6 = v27;
          }

          CFNullRef v19 = [v11 genre];
          CFNullRef v20 = v19;
          if (v19 && ([v19 isEqual:&stru_100094088] & 1) == 0)
          {
            [v2 setObject:v20 forKey:v9];
            char v24 = 1;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v5);

    uint64_t v1 = v23;
    if (v24)
    {
      id v21 = [v2 copy];
      os_unfair_lock_lock(&stru_1000A8DB8);
      id v22 = (void *)qword_1000A8DA8;
      qword_1000A8DA8 = (uint64_t)v21;

      os_unfair_lock_unlock(&stru_1000A8DB8);
    }
  }
  else
  {
  }
  byte_1000A8DBC = 0;
}

uint64_t sub_100012A60(void *a1)
{
  id v1 = a1;
  if (SSPriorityIndexLimitBundles()) {
    uint64_t v2 = (uint64_t)[(id)qword_1000A8D98 containsObject:v1];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

void sub_100012AB0(void *a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v10 = a1;
  id v8 = a3;
  if (a5 != a2)
  {
    id v9 = a2;
    handleHiddenResult();
    [v9 removeResults:v10];
  }
}

id sub_1000160C0(void *a1)
{
  id v1 = a1;
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = v1;
  id v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        id v10 = objc_alloc((Class)SFMutableResultSection);
        if (isKindOfClass)
        {
          id v11 = [v10 initWithPrototype:v8];
          id v12 = [v8 resultSet];
          [v11 setResultSet:v12];
        }
        else
        {
          id v11 = objc_msgSend(v10, "initWithSection:", v8, (void)v14);
        }
        objc_msgSend(v2, "addObject:", v11, (void)v14);
      }
      id v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  return v2;
}

SFMutableResultSection *__cdecl sub_100016258(id a1, NSString *a2)
{
  id v2 = a2;
  id v3 = objc_opt_new();
  [v3 setDomain:1];
  [v3 setBundleIdentifier:v2];
  [v3 setMaxInitiallyVisibleResults:SPMaxVisibleResultsCountPerSection()];
  id v4 = +[SDLocUtilities displayNameForBundleIdentifer:v2];

  [v3 setTitle:v4];

  return (SFMutableResultSection *)v3;
}

void sub_1000162FC(id a1)
{
  dword_1000A8DC8 = get_thread_count();
}

void sub_10001631C(id a1)
{
  id v1 = objc_alloc_init((Class)CNContactStore);
  id v2 = (void *)qword_1000A8DD8;
  qword_1000A8DD8 = (uint64_t)v1;

  id v5 = CNContactIdentifierKey;
  uint64_t v3 = +[NSArray arrayWithObjects:&v5 count:1];
  id v4 = (void *)qword_1000A8DE8;
  qword_1000A8DE8 = v3;
}

void sub_1000163B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = v4 * a2;
  unint64_t v6 = v4 * a2 + v4;
  if (v6 >= *(void *)(a1 + 64)) {
    unint64_t v6 = *(void *)(a1 + 64);
  }
  id v7 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v5, v6 - v5);
  id v8 = objc_alloc((Class)SPResultSet);
  if (a2) {
    id v9 = [v8 initWithSections:v7];
  }
  else {
    id v9 = [v8 initWithSections:v7 stableSections:*(void *)(*(void *)(a1 + 40) + 136)];
  }
  id v10 = v9;
  [*(id *)(a1 + 48) setObject:v9 atIndex:a2];
}

id sub_1000168DC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) message];
  CFStringRef v7 = @"QID";
  uint64_t v3 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1 + 32) + 96)];
  id v8 = v3;
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  [v2 sendReply:v4];

  uint64_t v5 = +[SDClient clientForConnection:*(void *)(*(void *)(a1 + 32) + 88)];
  [v5 removeActiveQuery:*(void *)(a1 + 32)];

  [*(id *)(a1 + 32) externalID];
  kdebug_trace();
  return [*(id *)(a1 + 32) setMessage:0];
}

int64_t sub_100016EBC(id a1, id a2, id a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = [v4 integerValue];
  if ((uint64_t)v6 <= (uint64_t)[v5 integerValue])
  {
    id v8 = [v4 integerValue];
    if ((uint64_t)v8 >= (uint64_t)[v5 integerValue]) {
      int64_t v7 = 0;
    }
    else {
      int64_t v7 = -1;
    }
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

void sub_100017670(void *a1, const char *a2, uint64_t a3)
{
  id v7 = a1;
  clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  os_unfair_lock_lock(&stru_1000A8E00);
  empty = [v7 perfDictionary];
  if (!empty) {
    empty = xpc_dictionary_create_empty();
  }
  xpc_dictionary_set_string(empty, "label", a2);
  __uint64_t v6 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  xpc_dictionary_set_double(empty, "latency", (double)(v6 - a3) / 1000000000.0);
  analytics_send_event();
  [v7 setPerfDictionary:0];
  os_unfair_lock_unlock(&stru_1000A8E00);
}

void sub_1000177EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10001784C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100018EC4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:");
  id v1 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] [SearchTool] by-pass L3", v2, 2u);
  }
}

id sub_100018F34(uint64_t a1, unint64_t a2)
{
  id v4 = [objc_alloc((Class)NSMutableOrderedSet) initWithArray:*(void *)(a1 + 32)];
  [v4 addObjectsFromArray:*(void *)(a1 + 40)];
  id v5 = (char *)[v4 count];
  if (*(void *)(a1 + 32)) {
    BOOL v6 = (unint64_t)v5 > a2;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    objc_msgSend(v4, "removeObjectsInRange:", a2, &v5[-a2]);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = *(id *)(a1 + 40);
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          if ((objc_msgSend(v4, "containsObject:", v12, (void)v16) & 1) == 0) {
            [v4 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    *(unsigned char *)(*(void *)(a1 + 48) + 162) = 0;
  }
  uint64_t v13 = objc_msgSend(v4, "array", (void)v16);
  id v14 = [v13 mutableCopy];

  return v14;
}

unint64_t sub_1000190D4(void *a1, const char *a2, const char *a3, uint64_t a4)
{
  id v7 = a1;
  __uint64_t v8 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  key = 0;
  asprintf(&key, "%s_label", a3);
  uint64_t v12 = 0;
  asprintf(&v12, "%s_latency", a3);
  os_unfair_lock_lock(&stru_1000A8E00);
  empty = [v7 perfDictionary];
  if (!empty)
  {
    empty = xpc_dictionary_create_empty();
    [v7 setPerfDictionary:empty];
  }
  unint64_t v10 = v8 - a4;
  xpc_dictionary_set_string(empty, key, a2);
  xpc_dictionary_set_double(empty, v12, (double)v10 / 1000000000.0);
  os_unfair_lock_unlock(&stru_1000A8E00);
  free(key);
  free(v12);

  return v10;
}

uint64_t sub_1000191E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  __uint64_t v8 = [v5 preferredBundleIDs];
  id v9 = [v7 bundleIdentifier];

  id v10 = [v8 indexOfObject:v9];
  id v11 = [*(id *)(a1 + 32) preferredBundleIDs];
  uint64_t v12 = [v6 bundleIdentifier];

  id v13 = [v11 indexOfObject:v12];
  if (v10 >= v13) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = -1;
  }
  if (v10 > v13) {
    return 1;
  }
  else {
    return v14;
  }
}

void sub_10001B4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

int64_t sub_10001B520(id a1, id a2, id a3)
{
  id v4 = a3;
  id v5 = [a2 rankingItem];
  id v6 = [v4 rankingItem];

  if (!v5 || !v6)
  {
LABEL_8:
    int64_t v7 = 0;
    goto LABEL_9;
  }
  if (([v5 isServerAlternativeResult] & 1) != 0
    || ([v6 isServerAlternativeResult] & 1) == 0)
  {
    if ([v5 isServerAlternativeResult]
      && ![v6 isServerAlternativeResult])
    {
      int64_t v7 = 1;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  int64_t v7 = -1;
LABEL_9:

  return v7;
}

void sub_10001CDF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,id location)
{
  objc_destroyWeak(v48);
  objc_destroyWeak(&location);
  sub_1000067B0((uint64_t)&STACK[0x2C0]);
  _Unwind_Resume(a1);
}

int64_t sub_10001CF10(id a1, id a2, id a3)
{
  id v4 = a3;
  id v5 = [a2 rankingItem];
  id v6 = [v4 rankingItem];

  if (!v5 || !v6)
  {
LABEL_8:
    int64_t v7 = 0;
    goto LABEL_9;
  }
  if (([v5 isServerAlternativeResult] & 1) != 0
    || ([v6 isServerAlternativeResult] & 1) == 0)
  {
    if ([v5 isServerAlternativeResult]
      && ![v6 isServerAlternativeResult])
    {
      int64_t v7 = 1;
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  int64_t v7 = -1;
LABEL_9:

  return v7;
}

void sub_10001CFBC(uint64_t a1, char a2)
{
  uint64_t v4 = si_tracing_current_span();
  long long v5 = *(_OWORD *)(v4 + 16);
  long long v47 = *(_OWORD *)v4;
  long long v48 = v5;
  uint64_t v49 = *(void *)(v4 + 32);
  uint64_t v6 = *(void *)(a1 + 80);
  long long v7 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)uint64_t v4 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v4 + 16) = v7;
  uint64_t v38 = v4;
  *(void *)(v4 + 32) = v6;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained && ([WeakRetained cancelled] & 1) == 0)
  {
    long long v10 = *(_OWORD *)(v38 + 16);
    long long v44 = *(_OWORD *)v38;
    long long v45 = v10;
    uint64_t v46 = *(void *)(v38 + 32);
    uint64_t v11 = *(void *)v38;
    uint64_t spanid = si_tracing_calc_next_spanid();
    uint64_t v13 = *(void *)(v38 + 8);
    *(void *)uint64_t v38 = v11;
    *(void *)(v38 + 8) = spanid;
    *(void *)(v38 + 16) = v13;
    *(unsigned char *)(v38 + 28) = 102;
    *(void *)(v38 + 32) = "sendResultsBlock";
    si_tracing_log_span_begin();
    uint64_t v14 = SPLogForSPLogCategoryQuery();
    os_log_type_t v15 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v14, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Show local results while waiting for slow queries", buf, 2u);
    }

    if ((a2 & 1) == 0)
    {
      AnalyticsSendEventLazy();
      long long v16 = (dispatch_source_t *)(v9 + 120);
      if (!*((void *)v9 + 15))
      {
        char v23 = 0;
        goto LABEL_22;
      }
      goto LABEL_20;
    }
    long long v16 = (dispatch_source_t *)(v9 + 120);
    if (!*((void *)v9 + 15))
    {
      char v23 = 1;
      goto LABEL_22;
    }
    long long v17 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Timer fired for CoreSpotlight priority path", buf, 2u);
    }

    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v19 = *(void *)(a1 + 32);
    double v20 = Current - *(double *)(v19 + 104);
    if (v20 >= *(double *)(v19 + 112))
    {
      id v21 = SPLogForSPLogCategoryDefault();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

LABEL_20:
        dispatch_source_cancel(*v16);
        dispatch_source_set_event_handler(*v16, 0);
        char v23 = 0;
        char v24 = *v16;
        *long long v16 = 0;
LABEL_21:

LABEL_22:
        if (([v9 cancelled] & 1) == 0)
        {
          if ((v23 & 1) == 0 && ![*((id *)v9 + 38) count])
          {
            [v9 sendFinishedDomains:1 reason:1];
            v9[166] = 1;
            v9[171] = 1;
            goto LABEL_27;
          }
          [v9 sendFinishedDomains:4];
        }
        if (v23)
        {
LABEL_39:
          si_tracing_log_span_end();
          long long v33 = v45;
          *(_OWORD *)uint64_t v38 = v44;
          *(_OWORD *)(v38 + 16) = v33;
          *(void *)(v38 + 32) = v46;
          goto LABEL_40;
        }
LABEL_27:
        id v25 = v9;
        objc_sync_enter(v25);
        if ([v25[41] count])
        {
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          id v26 = v25[41];
          id v27 = [v26 countByEnumeratingWithState:&v39 objects:v50 count:16];
          if (v27)
          {
            uint64_t v28 = *(void *)v40;
            do
            {
              for (i = 0; i != v27; i = (char *)i + 1)
              {
                long long v30 = v9;
                if (*(void *)v40 != v28) {
                  objc_enumerationMutation(v26);
                }
                long long v31 = *(void **)(*((void *)&v39 + 1) + 8 * i);
                uint64_t v32 = [v31 performQuery:v25];
                if (v32) {
                  [v25[40] addObject:v32];
                }
                [v25[41] removeObject:v31];

                id v9 = v30;
              }
              id v27 = [v26 countByEnumeratingWithState:&v39 objects:v50 count:16];
            }
            while (v27);
          }
        }
        objc_sync_exit(v25);

        goto LABEL_39;
      }
      *(_WORD *)buf = 0;
      id v22 = "Don't reset timer for CoreParsec; past deadline";
    }
    else
    {
      if (![*(id *)(v19 + 304) count])
      {
        uint64_t v35 = *(void *)(a1 + 32);
        __int16 v36 = *(NSObject **)(v35 + 120);
        dispatch_time_t v37 = dispatch_time(0, (uint64_t)((*(double *)(v35 + 112) - v20) * 1000000000.0));
        dispatch_source_set_timer(v36, v37, 0xFFFFFFFFFFFFFFFFLL, 0);
        char v24 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Reset timer for CoreParsec", buf, 2u);
        }
        char v23 = 1;
        goto LABEL_21;
      }
      id v21 = SPLogForSPLogCategoryDefault();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      *(_WORD *)buf = 0;
      id v22 = "Don't reset timer for CoreParsec; other waiting stores exist";
    }
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 2u);
    goto LABEL_19;
  }
LABEL_40:

  long long v34 = v48;
  *(_OWORD *)uint64_t v38 = v47;
  *(_OWORD *)(v38 + 16) = v34;
  *(void *)(v38 + 32) = v49;
}

void sub_10001D4C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,long long a27,long long a28,uint64_t a29)
{
  sub_1000067B0((uint64_t)&a21);
  long long v30 = a28;
  *(_OWORD *)a10 = a27;
  *(_OWORD *)(a10 + 16) = v30;
  *(void *)(a10 + 32) = a29;
  _Unwind_Resume(a1);
}

NSDictionary *__cdecl sub_10001D548(id a1)
{
  return (NSDictionary *)&off_100099028;
}

uint64_t sub_10001D554(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_10001D624(id a1)
{
  id v1 = +[NSLocale preferredLanguages];
  id v2 = [v1 firstObject];
  id v3 = [v2 lowercaseString];

  if (([v3 hasPrefix:@"ja"] & 1) != 0
    || ([v3 hasPrefix:@"zh"] & 1) != 0
    || [v3 hasPrefix:@"ko"])
  {
    byte_1000A8DF0 = 1;
  }
}

void sub_10001DF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

__uint64_t sub_10001ED44(uint64_t a1, const char *a2, const char *a3, uint64_t a4)
{
  __uint64_t v7 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "label", a2);
  xpc_dictionary_set_string(empty, "datastore", a3);
  __uint64_t v9 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  xpc_dictionary_set_double(empty, "latency", (double)(v9 - a4) / 1000000000.0);
  analytics_send_event();

  return v7;
}

unint64_t sub_10001EDF8(void *a1, const char *a2, const char *a3, uint64_t a4, const char *a5, unint64_t a6, const char *a7, unint64_t a8, const char *a9, unint64_t a10)
{
  id v17 = a1;
  __uint64_t v18 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  key = 0;
  asprintf(&key, "%s_label", a3);
  id v25 = 0;
  asprintf(&v25, "%s_latency", a3);
  char v23 = 0;
  char v24 = 0;
  id v22 = 0;
  if (a5) {
    asprintf(&v24, "%s_%s", a3, a5);
  }
  if (a7) {
    asprintf(&v23, "%s_%s", a3, a7);
  }
  if (a9) {
    asprintf(&v22, "%s_%s", a3, a9);
  }
  unint64_t v19 = v18 - a4;
  os_unfair_lock_lock(&stru_1000A8E00);
  xpc_object_t empty = [v17 perfDictionary];
  if (!empty)
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    [v17 setPerfDictionary:empty];
  }
  xpc_dictionary_set_string(empty, key, a2);
  xpc_dictionary_set_double(empty, v25, (double)v19 / 1000000000.0);
  if (v24) {
    xpc_dictionary_set_double(empty, v24, (double)a6 / 1000000000.0);
  }
  if (v23) {
    xpc_dictionary_set_double(empty, v23, (double)a8 / 1000000000.0);
  }
  if (v22) {
    xpc_dictionary_set_double(empty, v22, (double)a10 / 1000000000.0);
  }
  os_unfair_lock_unlock(&stru_1000A8E00);
  free(key);
  free(v25);
  free(v24);
  free(v23);
  free(v22);

  return v19;
}

void sub_10001EFE8(id a1)
{
  byte_1000A8E04 = _os_feature_enabled_impl();
  byte_1000A8E05 = _os_feature_enabled_impl();
}

void sub_10001F090(id a1)
{
  id v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_UTILITY, 0);
  id v3 = dispatch_queue_attr_make_with_overcommit();
  uint64_t v4 = dispatch_queue_attr_make_initially_inactive(v3);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.searchd.application.updates", v4);
  uint64_t v6 = (void *)qword_1000A8E30;
  qword_1000A8E30 = (uint64_t)v5;

  __uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  __uint64_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
  __uint64_t v9 = dispatch_queue_attr_make_with_overcommit();
  dispatch_queue_t v10 = dispatch_queue_create("com.apple.searchd.application.localization.updates", v9);
  uint64_t v11 = (void *)qword_1000A8E38;
  qword_1000A8E38 = (uint64_t)v10;

  id v12 = objc_alloc((Class)CSCustomAttributeKey);
  id v13 = [v12 initWithKeyName:off_1000A8860[0] searchable:0 searchableByDefault:0 unique:1 multiValued:0];
  uint64_t v14 = (void *)qword_1000A8E18;
  qword_1000A8E18 = (uint64_t)v13;

  id v19 = (id)_CFCopySystemVersionDictionary();
  uint64_t v15 = [v19 objectForKeyedSubscript:_kCFSystemVersionBuildVersionKey];
  long long v16 = (void *)qword_1000A8E20;
  qword_1000A8E20 = v15;

  qword_1000A8E40 = SSExtraApplicationVersion();
  id v17 = objc_alloc_init(SPApplicationIndexer);
  __uint64_t v18 = (void *)qword_1000A8E10;
  qword_1000A8E10 = (uint64_t)v17;
}

void sub_10001F2C0(id a1)
{
  uint64_t v1 = si_tracing_current_span();
  long long v7 = *(_OWORD *)v1;
  long long v8 = *(_OWORD *)(v1 + 16);
  uint64_t v9 = *(void *)(v1 + 32);
  uint64_t v2 = si_tracing_calc_traceid();
  uint64_t spanid = si_tracing_calc_next_spanid();
  *(void *)uint64_t v1 = v2;
  *(void *)(v1 + 8) = spanid;
  *(void *)(v1 + 16) = 0;
  *(_DWORD *)(v1 + 24) = -1;
  *(unsigned char *)(v1 + 28) = 102;
  *(void *)(v1 + 32) = "defaultAppAttributes";
  si_tracing_log_span_begin();
  uint64_t v4 = (void *)_MDBundleUtilsCopyLocalizedDescriptionDictionary();
  if (v4)
  {
    id v5 = [objc_alloc((Class)CSLocalizedString) initWithLocalizedStrings:v4];
    uint64_t v6 = (void *)qword_1000A8E48;
    qword_1000A8E48 = (uint64_t)v5;
  }
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v1 = v7;
  *(_OWORD *)(v1 + 16) = v8;
  *(void *)(v1 + 32) = v9;
}

void sub_10001F3C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

id sub_10001F518(uint64_t a1)
{
  uint64_t v2 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Apps changed!", v4, 2u);
  }

  [*(id *)(a1 + 32) updateApplications:0 appBundleArray:0 clean:0 activity:0];
  [*(id *)(a1 + 32) updateShortcuts:0];
  return +[SDSearchQuery invalidateCacheForSearchContinuation];
}

void sub_10001F5B4(uint64_t a1, void *a2)
{
  id v3 = [a2 allKeys];
  uint64_t v4 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Apps changed: %@", buf, 0xCu);
  }

  id v6 = *(id *)(a1 + 32);
  long long v7 = v3;
  id v5 = v3;
  tracing_dispatch_async();
}

id sub_10001F6F0(uint64_t a1)
{
  [*(id *)(a1 + 32) updateApplications:0 appBundleArray:*(void *)(a1 + 40) clean:0 activity:0];
  [*(id *)(a1 + 32) updateShortcuts:0];

  return +[SDSearchQuery invalidateCacheForSearchContinuation];
}

void sub_1000207D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100020818(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100020828(uint64_t a1)
{
}

void sub_100020830(uint64_t a1, const char *a2, uint64_t a3)
{
  strcpy((char *)&a2[a3], "Info.plist");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  _DWORD v3[2] = sub_100020A1C;
  v3[3] = &unk_100092B90;
  id v5 = a2;
  long long v4 = *(_OWORD *)(a1 + 32);
  sub_1000208CC(a2, v3);
}

void sub_1000208CC(const char *a1, void *a2)
{
  id v3 = a2;
  int v4 = open(a1, 0);
  if (v4 != -1)
  {
    int v5 = v4;
    memset(&v12, 0, sizeof(v12));
    fstat(v4, &v12);
    size_t st_size = v12.st_size;
    long long v7 = mmap(0, v12.st_size, 1, 1, v5, 0);
    if (v7 != (void *)-1)
    {
      long long v8 = v7;
      CFDataRef v10 = +[NSData dataWithBytesNoCopy:v8 length:st_size freeWhenDone:0];
      uint64_t v11 = (void *)CFPropertyListCreateWithData(kCFAllocatorDefault, v10, 0, 0, 0);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v3[2](v3, v11);
      }

      munmap(v8, st_size);
    }
    close(v5);
  }
}

void sub_100020A1C(void *a1, void *a2)
{
  id v3 = a2;
  CFStringRef v4 = (const __CFString *)_kCFBundleDisplayNameKey;
  uint64_t v5 = [v3 objectForKeyedSubscript:_kCFBundleDisplayNameKey];
  uint64_t v6 = *(void *)(a1[4] + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      long long v8 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [(id)objc_opt_class() description];
        __uint64_t v18 = (void *)v17;
        uint64_t v19 = *(void *)(*(void *)(a1[4] + 8) + 40);
        double v20 = (const char *)a1[6];
        if (!v20) {
          double v20 = "";
        }
        int v25 = 138413058;
        CFStringRef v26 = v4;
        __int16 v27 = 2112;
        uint64_t v28 = v17;
        __int16 v29 = 2112;
        uint64_t v30 = v19;
        __int16 v31 = 2080;
        uint64_t v32 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@ invalid type %@ %@ %s", (uint8_t *)&v25, 0x2Au);
      }
      uint64_t v9 = *(void *)(a1[4] + 8);
      CFDataRef v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = 0;
    }
  }
  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    uint64_t v11 = [v3 objectForKeyedSubscript:kCFBundleNameKey];
    uint64_t v12 = *(void *)(a1[5] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v14 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = [(id)objc_opt_class() description];
          id v22 = (void *)v21;
          char v23 = (const char *)a1[6];
          uint64_t v24 = *(void *)(*(void *)(a1[5] + 8) + 40);
          if (!v23) {
            char v23 = "";
          }
          int v25 = 138413058;
          CFStringRef v26 = kCFBundleNameKey;
          __int16 v27 = 2112;
          uint64_t v28 = v21;
          __int16 v29 = 2112;
          uint64_t v30 = v24;
          __int16 v31 = 2080;
          uint64_t v32 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ invalid type %@ %@ %s", (uint8_t *)&v25, 0x2Au);
        }
        uint64_t v15 = *(void *)(a1[5] + 8);
        long long v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = 0;
      }
    }
  }
}

void sub_100022210(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x220], 8);
  _Unwind_Resume(a1);
}

void sub_1000222F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFStringRef v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 localizedSubtitle];
    [*(id *)(a1 + 40) setSubtitle:v5];
    [*(id *)(a1 + 32) setSubtitle:v5];

    uint64_t v6 = [v4 applicationBundleIdentifier];
    [*(id *)(a1 + 40) setRelatedAppBundleIdentifier:v6];

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    long long v7 = +[CPSWebClipStore sharedStore];
    uint64_t v8 = *(void *)(a1 + 56);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10002243C;
    v9[3] = &unk_100092BE0;
    id v10 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v12 = 0;
    id v13 = *(id *)(a1 + 48);
    [v7 getAppClipWithURLHash:v8 completionHandler:v9];
  }
}

void sub_10002243C(uint64_t a1, void *a2)
{
  id v3 = [a2 localizedSubtitle];
  [*(id *)(a1 + 40) setSubtitle:v3];
  [*(id *)(a1 + 32) setSubtitle:v3];

  CFStringRef v4 = [*(id *)(a1 + 48) applicationBundleIdentifier];
  [*(id *)(a1 + 40) setRelatedAppBundleIdentifier:v4];

  uint64_t v5 = *(NSObject **)(a1 + 56);

  dispatch_group_leave(v5);
}

void sub_1000224BC(uint64_t a1, const char *a2, uint64_t a3)
{
  strcpy((char *)&a2[a3], "Info.plist");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  _DWORD v3[2] = sub_100022558;
  v3[3] = &unk_100092B90;
  uint64_t v5 = a2;
  long long v4 = *(_OWORD *)(a1 + 32);
  sub_1000208CC(a2, v3);
}

void sub_100022558(void *a1, void *a2)
{
  id v3 = a2;
  CFStringRef v4 = (const __CFString *)_kCFBundleDisplayNameKey;
  uint64_t v5 = [v3 objectForKeyedSubscript:_kCFBundleDisplayNameKey];
  uint64_t v6 = *(void *)(a1[4] + 8);
  long long v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      uint64_t v8 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        uint64_t v17 = [(id)objc_opt_class() description];
        __uint64_t v18 = (void *)v17;
        uint64_t v19 = *(void *)(*(void *)(a1[4] + 8) + 40);
        double v20 = (const char *)a1[6];
        if (!v20) {
          double v20 = "";
        }
        int v25 = 138413058;
        CFStringRef v26 = v4;
        __int16 v27 = 2112;
        uint64_t v28 = v17;
        __int16 v29 = 2112;
        uint64_t v30 = v19;
        __int16 v31 = 2080;
        uint64_t v32 = v20;
        _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@ invalid type %@ %@ %s", (uint8_t *)&v25, 0x2Au);
      }
      uint64_t v9 = *(void *)(a1[4] + 8);
      id v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = 0;
    }
  }
  if (!*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    uint64_t v11 = [v3 objectForKeyedSubscript:kCFBundleNameKey];
    uint64_t v12 = *(void *)(a1[5] + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v14 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          uint64_t v21 = [(id)objc_opt_class() description];
          id v22 = (void *)v21;
          char v23 = (const char *)a1[6];
          uint64_t v24 = *(void *)(*(void *)(a1[5] + 8) + 40);
          if (!v23) {
            char v23 = "";
          }
          int v25 = 138413058;
          CFStringRef v26 = kCFBundleNameKey;
          __int16 v27 = 2112;
          uint64_t v28 = v21;
          __int16 v29 = 2112;
          uint64_t v30 = v24;
          __int16 v31 = 2080;
          uint64_t v32 = v23;
          _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ invalid type %@ %@ %s", (uint8_t *)&v25, 0x2Au);
        }
        uint64_t v15 = *(void *)(a1[5] + 8);
        long long v16 = *(void **)(v15 + 40);
        *(void *)(v15 + 40) = 0;
      }
    }
  }
}

void sub_100022824(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = +[NSCharacterSet whitespaceCharacterSet];
    CFStringRef v4 = [v5 stringByTrimmingCharactersInSet:v3];

    if ([v4 length]) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
}

void sub_1000228D4(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = +[NSCharacterSet whitespaceCharacterSet];
    CFStringRef v4 = [v5 stringByTrimmingCharactersInSet:v3];

    if ([v4 length]) {
      [*(id *)(a1 + 32) addObject:v4];
    }
  }
}

int64_t sub_100022984(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 compare:a3];
}

void sub_1000231EC(id a1)
{
  uint64_t v3 = _kCFURLLocalizedNameWithExtensionsHiddenDictionaryKey;
  uint64_t v1 = +[NSArray arrayWithObjects:&v3 count:1];
  uint64_t v2 = (void *)qword_1000A8E58;
  qword_1000A8E58 = v1;
}

void sub_10002326C(uint64_t a1)
{
  uint64_t v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Updating applications journal complete", buf, 2u);
  }

  id v7 = *(id *)(a1 + 32);
  tracing_dispatch_async();
  CFStringRef v4 = SPLogForSPLogCategoryDefault();
  os_log_type_t v5 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v4, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Leaving group %p", buf, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_1000233F8(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*(void *)(a1 + 40) + 16);
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v6), "uniqueIdentifier", (void)v9);
        [v7 removeObject:v8];

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void sub_100023510(uint64_t a1)
{
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Updating applications journal complete", buf, 2u);
  }

  id v7 = *(id *)(a1 + 32);
  tracing_dispatch_async();
  id v4 = SPLogForSPLogCategoryDefault();
  os_log_type_t v5 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v4, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    uint64_t v6 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    uint64_t v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Leaving group %p", buf, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10002369C(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*(void *)(a1 + 40) + 16);
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v6), "uniqueIdentifier", (void)v9);
        [v7 removeObject:v8];

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

id sub_1000238CC(uint64_t a1)
{
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    id v4 = objc_retainBlock(*(id *)(a1 + 64));
    int v6 = 134217984;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "2 call updateAppMetadata %p", (uint8_t *)&v6, 0xCu);
  }
  return [*(id *)(a1 + 32) _updateAppMetadata:*(void *)(a1 + 40) appsRequiringLocalization:*(void *)(a1 + 48) activity:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

void sub_100024E20(id a1)
{
  uint64_t v3 = _kCFURLLocalizedNameWithExtensionsHiddenDictionaryKey;
  uint64_t v1 = +[NSArray arrayWithObjects:&v3 count:1];
  id v2 = (void *)qword_1000A8E68;
  qword_1000A8E68 = v1;
}

void sub_100024EA0(uint64_t a1)
{
  id v2 = +[SPCoreSpotlightIndexer sharedInstance];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = SPApplicationBundleIdGeneralAppClips;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100024FD0;
  v9[3] = &unk_100092D00;
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v6 = *(id *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v8 = *(void **)(a1 + 72);
  id v14 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  [v2 indexSearchableItems:v3 deleteSearchableItemsWithIdentifiers:v4 clientState:0 protectionClass:NSFileProtectionCompleteUntilFirstUserAuthentication forBundleID:v5 options:0 completionHandler:v9];
}

id sub_100024FD0(uint64_t a1)
{
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Indexing applications journal complete", (uint8_t *)&v11, 2u);
  }

  if ([*(id *)(a1 + 32) count] || objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    uint64_t v4 = SPLogForSPLogCategoryDefault();
    os_log_type_t v5 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v4, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      id v6 = objc_retainBlock(*(id *)(a1 + 64));
      int v11 = 134217984;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "2.6 call updateApplicationMetadata completion %p", (uint8_t *)&v11, 0xCu);
    }
    return [*(id *)(a1 + 48) updateApplicationMetadata:*(void *)(a1 + 40) appsRequiringLocalization:*(void *)(a1 + 32) activity:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
  }
  else
  {
    uint64_t v8 = SPLogForSPLogCategoryDefault();
    os_log_type_t v9 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v8, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      id v10 = objc_retainBlock(*(id *)(a1 + 64));
      int v11 = 134217984;
      id v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "2.2 call completion %p", (uint8_t *)&v11, 0xCu);
    }
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_1000256E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_10002571C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if ([a2 isEqualToString:MDItemRelatedAppBundleIdentifier]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObjectsFromArray:v5];
  }
}

void sub_100025790(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100064EA0((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000257FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
        uint64_t v9 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) uniqueIdentifier];
        [v8 addObject:v9];

        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

void sub_100025914(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100064F0C((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100025980(uint64_t a1)
{
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) copy];
  id v3 = [v2 countByEnumeratingWithState:&v64 objects:v77 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v65;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v65 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v64 + 1) + 8 * i);
        if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) containsObject:v7]) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObject:v7];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v64 objects:v77 count:16];
    }
    while (v4);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v8 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copy];
  id v9 = [v8 countByEnumeratingWithState:&v60 objects:v76 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v61;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(void *)v61 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v60 + 1) + 8 * (void)j);
        if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) containsObject:v13] & 1) == 0)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "removeObject:", v13); {
      }
        }
      id v10 = [v8 countByEnumeratingWithState:&v60 objects:v76 count:16];
    }
    while (v10);
  }

  id v14 = &MDItemInstantMessageAddresses_ptr;
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count])
  {
    uint64_t v15 = SPLogForSPLogCategoryDefault();
    os_log_type_t v16 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v15, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      uint64_t v17 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v75 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[TopHitAppShortcuts] updateShortcuts add %@", buf, 0xCu);
    }

    __uint64_t v18 = objc_opt_new();
    CFStringRef v72 = @":EA:_kMDItemHasTopHitAppShortcuts";
    CFBooleanRef v73 = kCFBooleanTrue;
    uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v73 forKeys:&v72 count:1];
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id obj = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v20 = [obj countByEnumeratingWithState:&v56 objects:v71 count:16];
    if (v20)
    {
      id v21 = v20;
      uint64_t v22 = *(void *)v57;
      uint64_t v23 = SPApplicationBundleIdGeneralApplication;
      do
      {
        for (k = 0; k != v21; k = (char *)k + 1)
        {
          if (*(void *)v57 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v56 + 1) + 8 * (void)k);
          id v26 = [objc_alloc((Class)CSSearchableItemAttributeSet) initWithAttributes:v19];
          id v27 = [objc_alloc((Class)CSSearchableItem) initWithUniqueIdentifier:v25 domainIdentifier:0 attributeSet:v26];
          [v27 setBundleID:v23];
          [v27 setIsUpdate:1];
          [v18 addObject:v27];
        }
        id v21 = [obj countByEnumeratingWithState:&v56 objects:v71 count:16];
      }
      while (v21);
    }

    uint64_t v28 = v18;
    id v14 = &MDItemInstantMessageAddresses_ptr;
  }
  else
  {
    uint64_t v28 = 0;
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
    __int16 v29 = SPLogForSPLogCategoryDefault();
    os_log_type_t v30 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v29, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      uint64_t v31 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v75 = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "[TopHitAppShortcuts] updateShortcuts delete %@", buf, 0xCu);
    }

    if (!v28) {
      uint64_t v28 = objc_opt_new();
    }
    uint64_t v69 = MDItemHasTopHitAppShortcuts;
    CFNullRef v70 = kCFNull;
    uint64_t v32 = [v14[154] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id obja = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v33 = [obja countByEnumeratingWithState:&v52 objects:v68 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v53;
      uint64_t v36 = SPApplicationBundleIdGeneralApplication;
      do
      {
        for (m = 0; m != v34; m = (char *)m + 1)
        {
          if (*(void *)v53 != v35) {
            objc_enumerationMutation(obja);
          }
          uint64_t v38 = *(void *)(*((void *)&v52 + 1) + 8 * (void)m);
          id v39 = [objc_alloc((Class)CSSearchableItemAttributeSet) initWithAttributes:v32];
          id v40 = [objc_alloc((Class)CSSearchableItem) initWithUniqueIdentifier:v38 domainIdentifier:0 attributeSet:v39];
          [v40 setBundleID:v36];
          [v40 setIsUpdate:1];
          [v28 addObject:v40];
        }
        id v34 = [obja countByEnumeratingWithState:&v52 objects:v68 count:16];
      }
      while (v34);
    }
  }
  if ([v28 count])
  {
    id v41 = [v28 count];
    long long v42 = +[SPCoreSpotlightIndexer sharedInstance];
    uint64_t v43 = SPApplicationBundleIdGeneralApplication;
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100026070;
    v49[3] = &unk_100092D78;
    id v51 = v41;
    id v50 = *(id *)(a1 + 32);
    [v42 indexSearchableItems:v28 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:NSFileProtectionCompleteUntilFirstUserAuthentication forBundleID:v43 options:0 completionHandler:v49];
  }
  else
  {
    long long v44 = SPLogForSPLogCategoryDefault();
    os_log_type_t v45 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v44, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "[TopHitAppShortcuts] updateShortcuts complete (no updates)", buf, 2u);
    }

    uint64_t v46 = *(NSObject **)(a1 + 32);
    if (v46) {
      dispatch_group_leave(v46);
    }
  }
}

void sub_100026070(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SPLogForSPLogCategoryDefault();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100064F78((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  else
  {
    os_log_type_t v12 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v4, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      uint64_t v13 = *(void *)(a1 + 40);
      int v15 = 134217984;
      uint64_t v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v5, v12, "[TopHitAppShortcuts] updateShortcuts complete (%lu updates)", (uint8_t *)&v15, 0xCu);
    }
  }

  id v14 = *(NSObject **)(a1 + 32);
  if (v14) {
    dispatch_group_leave(v14);
  }
}

void sub_1000268F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
}

void sub_100026998(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
  id v9 = a6;
  if (a2 == 1)
  {
    uint64_t v17 = SPLogForSPLogCategoryDefault();
    os_log_type_t v18 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v17, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      uint64_t v19 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 134217984;
      *(void *)id v39 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "2 query finished %p", buf, 0xCu);
    }

    id v20 = SPLogForSPLogCategoryDefault();
    os_log_type_t v21 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v20, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      unsigned int v22 = [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) count];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)id v39 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Found %d existing applications", buf, 8u);
    }

    uint64_t v25 = *(id *)(a1 + 64);
    id v26 = *(id *)(a1 + 48);
    id v27 = *(id *)(a1 + 40);
    id v28 = *(id *)(a1 + 80);
    tracing_dispatch_async();

    uint64_t v16 = v25;
  }
  else if (a2)
  {
    uint64_t v16 = SPLogForSPLogCategoryDefault();
    os_log_type_t v23 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v16, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      uint64_t v24 = *(void *)(a1 + 64);
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)id v39 = a2;
      *(_WORD *)&v39[4] = 2048;
      *(void *)&v39[6] = v24;
      _os_log_impl((void *)&_mh_execute_header, v16, v23, "2 Unexpected message %d %p", buf, 0x12u);
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 120);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100026D00;
    v29[3] = &unk_100092DC8;
    long long v34 = *(_OWORD *)(a1 + 88);
    os_log_type_t v30 = *(id *)(a1 + 32);
    id v31 = *(id *)(a1 + 40);
    id v11 = *(id *)(a1 + 48);
    uint64_t v12 = *(void *)(a1 + 104);
    id v32 = v11;
    uint64_t v35 = v12;
    id v13 = *(id *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 128);
    uint64_t v15 = *(void *)(a1 + 112);
    id v33 = v13;
    uint64_t v36 = v15;
    uint64_t v37 = v14;
    [a5 enumerateQueryResults:v10 stringCache:0 usingBlock:v29];

    uint64_t v16 = v30;
  }
}

void sub_100026D00(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = *(id *)(a2 + 8);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_45:

      goto LABEL_46;
    }
    id v60 = v5;
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setValue:v5 forKey:v4];
    uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
    if (v6) {
      [v6 removeObject:v4];
    }
    uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    uint64_t v8 = [v7 objectAtIndexedSubscript:0];
    [v8 doubleValue];
    long long v61 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");

    id v9 = [v7 objectAtIndexedSubscript:1];
    [v9 doubleValue];
    double v11 = v10;

    [*(id *)(a2 + 48) doubleValue];
    double v13 = v12;
    uint64_t v14 = [v7 objectAtIndexedSubscript:2];
    [v14 doubleValue];
    double v16 = v15;

    [*(id *)(a2 + 56) doubleValue];
    double v18 = v17;
    uint64_t v19 = [v7 objectAtIndexedSubscript:3];
    [v19 doubleValue];
    double v21 = v20;

    [*(id *)(a2 + 64) doubleValue];
    double v23 = v22;
    uint64_t v24 = [v7 objectAtIndexedSubscript:4];
    [v24 doubleValue];
    double v26 = v25;

    [*(id *)(a2 + 72) doubleValue];
    double v28 = v27;
    uint64_t v62 = a1;
    if ([v7 count])
    {
      long long v58 = *(void **)(a1 + 40);
      __int16 v29 = [v7 objectAtIndexedSubscript:1];
      v68[0] = v29;
      os_log_type_t v30 = [v7 objectAtIndexedSubscript:2];
      v68[1] = v30;
      id v31 = [v7 objectAtIndexedSubscript:3];
      v68[2] = v31;
      id v32 = [v7 objectAtIndexedSubscript:4];
      v68[3] = v32;
      id v33 = [v7 objectAtIndexedSubscript:0];
      v68[4] = v33;
      long long v34 = +[NSArray arrayWithObjects:v68 count:5];
      [v58 setObject:v34 forKey:v4];

      a1 = v62;
    }
    if ([v7 count]
      && (![v61 isEqualToDate:*(void *)(a2 + 80)]
       || vabdd_f64(v11, v13) > 0.001
       || vabdd_f64(v16, v18) > 0.001
       || vabdd_f64(v21, v23) > 0.001
       || vabdd_f64(v26, v28) > 0.001))
    {
      uint64_t v35 = objc_msgSend(v7, "objectAtIndexedSubscript:", 1, *(void *)(a1 + 48));
      v67[0] = v35;
      uint64_t v36 = [v7 objectAtIndexedSubscript:2];
      v67[1] = v36;
      uint64_t v37 = [v7 objectAtIndexedSubscript:3];
      v67[2] = v37;
      uint64_t v38 = [v7 objectAtIndexedSubscript:4];
      v67[3] = v38;
      id v39 = [v7 objectAtIndexedSubscript:0];
      void v67[4] = v39;
      id v40 = +[NSArray arrayWithObjects:v67 count:5];
      [v59 setObject:v40 forKey:v4];

      a1 = v62;
    }
    id v41 = *(id *)(a2 + 32);
    long long v42 = +[SPCorrectionHandler sharedHandler];
    uint64_t v43 = [v42 versionForLanguage:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)];

    if (v43)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![v43 isEqualToString:v41])
      {
        int v48 = 1;
        goto LABEL_28;
      }
    }
    id v44 = v41;
    id v45 = *(id *)(a2 + 96);
    uint64_t v46 = v45;
    if (v45)
    {
      unsigned int v47 = [v45 BOOLValue];
      if (v47 == [*(id *)(a1 + 56) containsObject:v4])
      {
        int v48 = 0;
LABEL_27:

        id v41 = v44;
LABEL_28:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if ((v48 | [*(id *)(a2 + 40) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40)] ^ 1))goto LABEL_43; {
        }
          }
        else if (v48)
        {
          goto LABEL_43;
        }
        long long v52 = (_UNKNOWN **)*(id *)(a2 + 16);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        long long v54 = &off_100098B40;
        if (isKindOfClass) {
          long long v54 = v52;
        }
        long long v55 = v54;

        if ((uint64_t)[&off_100098B28 compare:v55] <= 0)
        {
          id v56 = *(id *)(a2 + 24);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v56 length])
          {
            if (!qword_1000A8E20 || ([v4 hasPrefix:@"com.apple."] & 1) == 0)
            {

              a1 = v62;
              goto LABEL_48;
            }
            unsigned int v57 = [v56 isEqualToString:qword_1000A8E20];

            a1 = v62;
            if (v57)
            {
LABEL_48:
              if ([*(id *)(a2 + 88) integerValue] == *(id *)(a1 + 96)) {
                goto LABEL_44;
              }
            }
LABEL_43:
            [*(id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) addObject:v4];
LABEL_44:

            id v5 = v60;
            goto LABEL_45;
          }

          a1 = v62;
        }

        goto LABEL_43;
      }
    }
    else
    {
      unsigned int v47 = 0;
      int v48 = 0;
      if (([*(id *)(a1 + 56) containsObject:v4] & 1) == 0) {
        goto LABEL_27;
      }
    }
    uint64_t v49 = SPLogForSPLogCategoryDefault();
    os_log_type_t v50 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v49, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      CFStringRef v51 = &stru_100094088;
      if (v47) {
        CFStringRef v51 = @"non-";
      }
      *(_DWORD *)buf = 138412546;
      id v64 = v4;
      __int16 v65 = 2112;
      CFStringRef v66 = v51;
      _os_log_impl((void *)&_mh_execute_header, v49, v50, "Updating %@ to %@placeholder", buf, 0x16u);
    }

    int v48 = 1;
    a1 = v62;
    goto LABEL_27;
  }
LABEL_46:
}

void sub_1000273DC(uint64_t a1)
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000275B0;
  v10[3] = &unk_1000921B0;
  id v11 = *(id *)(a1 + 32);
  id v2 = objc_retainBlock(v10);
  id v3 = SPLogForSPLogCategoryDefault();
  os_log_type_t v4 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v3, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = objc_retainBlock(v2);
    id v7 = [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) count];
    id v8 = [*(id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) count];
    id v9 = [*(id *)(a1 + 40) count];
    *(_DWORD *)buf = 134219008;
    uint64_t v13 = v5;
    __int16 v14 = 2048;
    double v15 = v6;
    __int16 v16 = 2048;
    id v17 = v7;
    __int16 v18 = 2048;
    id v19 = v8;
    __int16 v20 = 2048;
    id v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "2 call updateApplicationInformationForExistingItems %p -> completion %p (%ld %ld %ld)", buf, 0x34u);
  }
  [*(id *)(a1 + 48) updateApplicationInformationForExistingItems:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) reimportItems:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) newItems:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40) countItems:*(void *)(a1 + 56) updateCountItems:*(void *)(a1 + 40) clean:*(unsigned __int8 *)(a1 + 96) activity:*(void *)(a1 + 64) completion:v2];
}

void sub_1000275B0(uint64_t a1)
{
  id v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v2, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "2 Leave group %p", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(NSObject **)(a1 + 32);
  if (v5) {
    dispatch_group_leave(v5);
  }
}

void sub_1000276A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = SPLogForSPLogCategoryDefault();
  os_log_type_t v8 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 1024;
    unsigned int v12 = [v6 isPlaceholder];
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "app %@ isPlaceholder %d", (uint8_t *)&v9, 0x12u);
  }

  if ([v6 isPlaceholder]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
  }
}

void sub_1000277C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100027834(id a1)
{
  qword_1000A8E78 = objc_opt_new();

  _objc_release_x1();
}

void sub_100027AC0(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  if (xpc_activity_get_state(v2) == 2)
  {
    if (xpc_activity_should_defer(v2))
    {
      BOOL v4 = xpc_activity_set_state(v2, 3);
      id v5 = SPLogForSPLogCategoryDefault();
      id v6 = v5;
      if (v4)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          unsigned int v12 = "com.apple.searchd.updateRanking";
          __int16 v13 = 2048;
          uint64_t v14 = 2;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Deferring XPC activity:%s, state:%ld", buf, 0x16u);
        }
LABEL_12:

        goto LABEL_13;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100064FE4(v6);
      }
    }
    uint64_t v7 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      unsigned int v12 = "com.apple.searchd.updateRanking";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Performing XPC activity:%s", buf, 0xCu);
    }

    xpc_activity_set_state(v2, 4);
    os_log_type_t v8 = +[SPApplicationMetadataUpdater sharedInstance];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100027CCC;
    v9[3] = &unk_1000921B0;
    id v10 = v2;
    [v8 updateWithCompletionHandler:v9 clean:0 activity:v10];

    id v6 = v10;
    goto LABEL_12;
  }
LABEL_13:
}

void sub_100027CCC(uint64_t a1)
{
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  uint64_t v1 = SPLogForSPLogCategoryDefault();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315138;
    os_log_type_t v3 = "com.apple.searchd.updateRanking";
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Marked XPC activity:%s as done", (uint8_t *)&v2, 0xCu);
  }
}

void sub_100027F4C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000280AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100028310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_10002833C(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  if (([v7 isEqualToString:@"lastUpdated"] & 1) == 0)
  {
    uint64_t v9 = a1[6];
    uint64_t v10 = *(void *)(*(void *)(a1[4] + 8) + 24);
    uint64_t v11 = v9 + v10;
    uint64_t v12 = [v8 objectForKeyedSubscript:@"counts"];
    if ([v12 count])
    {
      unint64_t v13 = 0;
      uint64_t v14 = v10 + v9 - 16;
      do
      {
        double v15 = [v12 objectAtIndexedSubscript:v13];
        [v15 doubleValue];
        double v17 = v16;

        switch(v13)
        {
          case 0uLL:
            break;
          case 1uLL:
            *(double *)uint64_t v11 = v17;
            break;
          case 2uLL:
            *(double *)(v11 + 16) = v17;
            break;
          case 3uLL:
            *(double *)(v11 + 24) = v17;
            break;
          case 4uLL:
          case 5uLL:
            *(double *)(v11 + 32) = v17 + *(double *)(v11 + 32);
            break;
          default:
            *(double *)(v14 + 8 * v13) = v17;
            break;
        }
        ++v13;
      }
      while (v13 < (unint64_t)[v12 count]);
    }
    __int16 v18 = (const char *)[v7 UTF8String];
    size_t v19 = strlen(v18);
    if (v19 - 32766 >= 0xFFFFFFFFFFFF8003)
    {
      size_t v20 = v19;
      unsigned __int16 v21 = v19 + 1;
      *(_WORD *)(v11 + 144) = v19 + 1;
      strcpy((char *)(v11 + 146), v18);
      *(void *)(*(void *)(a1[4] + 8) + 24) += v20 + 147;
      if (*(void *)(*(void *)(a1[4] + 8) + 24) <= a1[7])
      {
LABEL_17:

        goto LABEL_18;
      }
      double v22 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = *(void *)(*(void *)(a1[4] + 8) + 24);
        uint64_t v24 = a1[7];
        int v25 = 134218496;
        uint64_t v26 = v23;
        __int16 v27 = 1024;
        int v28 = v21;
        __int16 v29 = 2048;
        uint64_t v30 = v24;
        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "encountered bad app data off:%zu size:%hd estimate:%lu", (uint8_t *)&v25, 0x1Cu);
      }
    }
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_17;
  }
LABEL_18:
}

void sub_100028938(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028F60(uint64_t a1, void *a2, void *a3)
{
  id v25 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) lookupDict];
  id v7 = [v6 objectForKeyedSubscript:v25];

  if (v7)
  {
    id v8 = [*(id *)(a1 + 40) mutableBytes];
    size_t v9 = 0;
    uint64_t v10 = (char *)[v7 longLongValue] + (void)v8;
  }
  else
  {
    uint64_t v11 = (const char *)[v25 UTF8String];
    size_t v12 = strlen(v11);
    if (v12 - 1 > 0x7FFC) {
      goto LABEL_9;
    }
    __int16 v13 = v12 + 1;
    size_t v9 = v12 + 147;
    uint64_t v10 = (char *)malloc_type_calloc(1uLL, v12 + 147, 0x693D954EuLL);
    strcpy(v10 + 146, v11);
    *((_WORD *)v10 + 72) = v13;
  }
  uint64_t v14 = [v5 objectAtIndexedSubscript:0];
  [v14 doubleValue];
  uint64_t v16 = v15;

  *((void *)v10 + 2) = v16;
  double v17 = [v5 objectAtIndexedSubscript:1];
  [v17 doubleValue];
  double v19 = v18;

  if (v19 > 0.0) {
    *((double *)v10 + 3) = v19;
  }
  size_t v20 = [v5 objectAtIndexedSubscript:2];
  [v20 doubleValue];
  uint64_t v22 = v21;

  *(void *)uint64_t v10 = v22;
  if (v9)
  {
    uint64_t v23 = *(void **)(a1 + 48);
    id v24 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v10 length:v9 freeWhenDone:1];
    [v23 appendData:v24];
  }
LABEL_9:
}

void sub_1000297E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100029850(id a1)
{
  uint64_t v1 = objc_alloc_init(SPBackupRankingMetadataHandler);
  int v2 = (void *)qword_1000A8EC8;
  qword_1000A8EC8 = (uint64_t)v1;

  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.searchd"];
  BOOL v4 = (void *)qword_1000A8E88;
  qword_1000A8E88 = (uint64_t)v3;

  id v5 = NSHomeDirectory();
  uint64_t v6 = [v5 stringByAppendingPathComponent:@"/Library/Spotlight/Backup/"];

  char v39 = 0;
  id v7 = +[NSFileManager defaultManager];
  unsigned __int8 v8 = [v7 fileExistsAtPath:v6 isDirectory:&v39];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = +[NSFileManager defaultManager];
    [v9 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];
  }
  uint64_t v10 = NSHomeDirectory();
  uint64_t v11 = [v10 stringByAppendingPathComponent:@"/Library/Spotlight/Backup/encrypted_ranking_metadata.temp"];
  size_t v12 = (void *)qword_1000A8E90;
  qword_1000A8E90 = v11;

  __int16 v13 = NSHomeDirectory();
  uint64_t v14 = [v13 stringByAppendingPathComponent:@"/Library/Spotlight/Backup/encrypted_ranking_metadata.dat"];
  uint64_t v15 = (void *)qword_1000A8E98;
  qword_1000A8E98 = v14;

  uint64_t v16 = NSHomeDirectory();
  uint64_t v17 = [v16 stringByAppendingPathComponent:@"/Library/Spotlight/Backup/DO_NOT_RESTORE_IF_THIS_EXISTS"];
  double v18 = (void *)qword_1000A8EA0;
  qword_1000A8EA0 = v17;

  double v19 = NSHomeDirectory();
  uint64_t v20 = [v19 stringByAppendingPathComponent:@"/Library/Spotlight/Backup/restore_encrypted_ranking_metadata.dat"];
  uint64_t v21 = (void *)qword_1000A8EA8;
  qword_1000A8EA8 = v20;

  v42[0] = @"_kMDItemExternalID";
  v42[1] = @"_kMDItemLaunchString";
  uint64_t v22 = MDItemIncomingCounts;
  uint64_t v23 = MDItemOutgoingCounts;
  v42[2] = MDItemIncomingCounts;
  v42[3] = MDItemOutgoingCounts;
  uint64_t v37 = MDItemIncomingVideoCallDates;
  uint64_t v24 = MDItemOutgoingVideoCallDates;
  v42[4] = MDItemIncomingVideoCallDates;
  v42[5] = MDItemOutgoingVideoCallDates;
  uint64_t v25 = MDItemIncomingAudioCallDates;
  uint64_t v38 = (void *)v6;
  uint64_t v26 = MDItemOutgoingAudioCallDates;
  v42[6] = MDItemIncomingAudioCallDates;
  v42[7] = MDItemOutgoingAudioCallDates;
  v42[8] = @"kMDItemUsedDates";
  v42[9] = @"kMDItemLastUsedDate_Ranking";
  uint64_t v27 = MDItemEmailAddresses;
  v42[10] = @"_kMDItemShortcutLastUsedDate";
  v42[11] = MDItemEmailAddresses;
  uint64_t v28 = MDItemDisplayName;
  uint64_t v29 = MDItemPhoneNumbers;
  v42[12] = MDItemDisplayName;
  v42[13] = MDItemPhoneNumbers;
  uint64_t v30 = MDItemInstantMessageAddresses;
  v42[14] = MDItemInstantMessageAddresses;
  uint64_t v31 = +[NSArray arrayWithObjects:v42 count:15];
  id v32 = (void *)qword_1000A8EB0;
  qword_1000A8EB0 = v31;

  v41[0] = @"_kMDItemExternalID";
  v41[1] = @"_kMDItemLaunchString";
  v41[2] = v22;
  v41[3] = v23;
  v41[4] = MDItemIncomingMailCounts;
  v41[5] = MDItemOutgoingMailCounts;
  v41[6] = MDItemIncomingSMSCounts;
  v41[7] = MDItemOutgoingSMSCounts;
  v41[8] = v37;
  v41[9] = v24;
  v41[10] = v25;
  v41[11] = v26;
  v41[12] = @"kMDItemUsedDates";
  v41[13] = @"kMDItemLastUsedDate_Ranking";
  v41[14] = @"_kMDItemShortcutLastUsedDate";
  v41[15] = v27;
  v41[16] = v28;
  v41[17] = v29;
  v41[18] = v30;
  uint64_t v33 = +[NSArray arrayWithObjects:v41 count:19];
  long long v34 = (void *)qword_1000A8EB8;
  qword_1000A8EB8 = v33;

  v40[0] = MDItemIncomingCalendarCounts;
  v40[1] = MDItemOutgoingCalendarCounts;
  v40[2] = MDItemIncomingFileProviderCounts;
  v40[3] = MDItemOutgoingFileProviderCounts;
  uint64_t v35 = +[NSArray arrayWithObjects:v40 count:4];
  uint64_t v36 = (void *)qword_1000A8EC0;
  qword_1000A8EC0 = v35;
}

void sub_100029C6C(id a1, OS_xpc_object *a2)
{
  activity = a2;
  xpc_object_t v3 = xpc_activity_copy_criteria(activity);
  if (v3 && (xpc_activity_get_state(activity) & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    xpc_activity_set_state(activity, 5);
    xpc_activity_unregister("com.apple.searchd.restoreBackup");
  }
}

void sub_100029DB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100029F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100029FC0(uint64_t a1, void *a2)
{
  xpc_object_t v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      uint64_t v6 = SPLogForSPLogCategoryDefault();
      os_log_type_t v7 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v6, v7))
      {
        *(_DWORD *)buf = 136315138;
        __int16 v13 = "com.apple.searchd.createEncryptedRankingBackup";
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Performing XPC activity:%s", buf, 0xCu);
      }

      xpc_activity_set_state(v3, 4);
      unsigned __int8 v8 = dispatch_group_create();
      [WeakRetained extractAndWriteEncryptedBackupMetadata:v8];
      uint64_t v9 = dispatch_get_global_queue(9, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002A184;
      block[3] = &unk_1000921B0;
      uint64_t v11 = v3;
      dispatch_group_notify(v8, v9, block);
    }
    else
    {
      xpc_activity_set_state(v3, 5);
    }
  }
}

void sub_10002A184(uint64_t a1)
{
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  uint64_t v1 = SPLogForSPLogCategoryDefault();
  os_log_type_t v2 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = 136315138;
    BOOL v4 = "com.apple.searchd.createEncryptedRankingBackup";
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Marked XPC activity:%s as done", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t sub_10002AAC8(off_t a1, uint64_t a2)
{
  v15[0] = 0x300000002;
  v15[1] = 0;
  v15[2] = a1;
  v15[3] = 0;
  BOOL v4 = NSHomeDirectory();
  id v5 = +[NSString stringWithFormat:@"/Library/Spotlight/Backup/temp_%lu.dat", a2];
  uint64_t v6 = [v4 stringByAppendingPathComponent:v5];

  id v7 = v6;
  uint64_t v8 = open((const char *)[v7 UTF8String], 514, 384);
  if ((v8 & 0x80000000) != 0)
  {
    __int16 v13 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100065470();
    }

    goto LABEL_13;
  }
  uint64_t v9 = v8;
  if (fcntl(v8, 42, v15) == -1)
  {
    uint64_t v10 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *__error();
      *(_DWORD *)buf = 67109120;
      int v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "*warn* preallocated temporary file failed. %d\n", buf, 8u);
    }
  }
  if (ftruncate(v9, a1) == -1)
  {
    size_t v12 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000654A4();
    }

    close(v9);
LABEL_13:
    uint64_t v9 = 0xFFFFFFFFLL;
  }

  return v9;
}

void *sub_10002AC98(int a1, size_t a2, void *a3, size_t a4)
{
  munmap(a3, a4);
  if (ftruncate(a1, a2) == -1)
  {
    id v7 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100065524();
    }
  }
  else
  {
    __n128 result = mmap(0, a2, 1, 1, a1, 0);
    if (result != (void *)-1) {
      return result;
    }
    id v7 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000655A4();
    }
  }

  return 0;
}

uint64_t sub_10002AD50(int a1)
{
  bzero(v3, 0x400uLL);
  uint64_t result = fcntl(a1, 50, v3);
  if ((result & 0x80000000) == 0)
  {
    if (v3[0]) {
      return unlink(v3);
    }
  }
  return result;
}

size_t sub_10002ADE0(const uint8_t *a1, size_t a2, uint8_t **a3, compression_algorithm a4)
{
  size_t v8 = a2 + 4096;
  uint64_t v9 = (uint8_t *)malloc_type_malloc(a2 + 4096, 0x1E0945E8uLL);
  *a3 = v9;

  return compression_encode_buffer(v9, v8, a1, a2, 0, a4);
}

size_t sub_10002AE58(const uint8_t *a1, size_t a2, size_t a3, uint8_t **a4, compression_algorithm a5, int *a6)
{
  *a6 = -1;
  int v12 = sub_10002AAC8(a3, 2);
  if ((v12 & 0x80000000) == 0)
  {
    int v13 = v12;
    uint64_t v14 = (uint8_t *)mmap(0, a3, 3, 1, v12, 0);
    *a4 = v14;
    if (v14 != (uint8_t *)-1)
    {
      size_t result = compression_decode_buffer(v14, a3, a1, a2, 0, a5);
      if (result)
      {
        *a6 = v13;
        return result;
      }
    }
    close(v13);
  }
  return 0;
}

void sub_10002B0B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002B0C8(uint64_t a1)
{
  int v3 = +[SPCoreSpotlightIndexer sharedInstance];
  BOOL v4 = objc_opt_new();
  [v4 setInternal:1];
  [v4 setLowPriority:0];
  CFStringRef v44 = @"com.apple.MobileAddressBook";
  id v5 = +[NSArray arrayWithObjects:&v44 count:1];
  [v4 setBundleIDs:v5];

  [v4 setRankingQueries:&off_100099170];
  [v4 setMaxCount:400];
  id v6 = objc_alloc((Class)NSMutableArray);
  id v7 = [v6 initWithArray:qword_1000A8EB8];
  [v7 addObjectsFromArray:qword_1000A8EC0];
  [v4 setFetchAttributes:v7];
  v43[0] = NSFileProtectionComplete;
  v43[1] = NSFileProtectionCompleteUnlessOpen;
  v43[2] = NSFileProtectionCompleteWhenUserInactive;
  v43[3] = NSFileProtectionCompleteUntilFirstUserAuthentication;
  size_t v8 = +[NSArray arrayWithObjects:v43 count:4];
  [v4 setProtectionClasses:v8];

  uint64_t v9 = [*(id *)(a1 + 32) fetchKeyFromKeychain];
  uint64_t v10 = v9;
  uint64_t v38 = 0;
  char v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  if (v9)
  {
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x2020000000;
    int v37 = -1;
    uint64_t v32 = 0;
    uint64_t v33 = &v32;
    uint64_t v34 = 0x2020000000;
    int v35 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = (CCCryptorRef *)&v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v31 = 0;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    long long iv = xmmword_1000749F0;
    id v11 = [v9 bytes];
    CCCryptorStatus v12 = CCCryptorCreate(0, 0, 1u, v11, 0x10uLL, &iv, v29 + 3);
    *((_DWORD *)v33 + 6) = v12;
    int v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002B514;
    v20[3] = &unk_100092FA8;
    uint64_t v23 = v27;
    uint64_t v24 = &v32;
    uint64_t v25 = &v28;
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v22 = v36;
    v20[4] = v14;
    uint64_t v15 = v13;
    uint64_t v21 = v15;
    uint64_t v26 = &v38;
    uint64_t v16 = [v3 startQuery:@"kMDItemLastUsedDate_Ranking == *" withContext:v4 handler:v20];
    if (!v16) {
      dispatch_group_leave(v15);
    }
    dispatch_group_wait(v15, 0xFFFFFFFFFFFFFFFFLL);

    _Block_object_dispose(v27, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
    _Block_object_dispose(v36, 8);
    if (*((unsigned char *)v39 + 24))
    {
      int v17 = +[NSFileManager defaultManager];
      unsigned __int8 v18 = [v17 createFileAtPath:qword_1000A8EA0 contents:0 attributes:0];

      if ((v18 & 1) == 0)
      {
        double v19 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1000655D8();
        }
      }
      [(id)qword_1000A8E88 setBool:1 forKey:@"didCreateLocalBackup"];
    }
  }
  _Block_object_dispose(&v38, 8);
}

void sub_10002B4B4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_10002B514(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8 = a6;
  if (a2 == 1)
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != -1)
    {
      *(void *)buf = 0;
      int ByteVectorCount = _MDPlistBytesGetByteVectorCount();
      unsigned __int8 v18 = malloc_type_calloc(1uLL, 0x10uLL, 0x165B1ED7uLL);
      *unsigned __int8 v18 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = CCCryptorUpdate(*(CCCryptorRef *)(*(void *)(*(void *)(a1 + 72)+ 8)+ 24), (const void *)(*(void *)(*(void *)(a1 + 56)+ 8)+ 24), 8uLL, v18, 0x10uLL, (size_t *)buf);
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        double v19 = SPLogForSPLogCategoryDefault();
        os_log_type_t v20 = 2 * (gSPLogDebugAsDefault == 0);
        if (os_log_type_enabled(v19, v20))
        {
          LOWORD(dataOutMoved.st_dev) = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, v20, "Couldn't encrypt data", (uint8_t *)&dataOutMoved, 2u);
        }
      }
      else
      {
        write(*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v18, *(size_t *)buf);
      }
      *(void *)buf = 0;
      __memset_chk();
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = CCCryptorFinal(*(CCCryptorRef *)(*(void *)(*(void *)(a1 + 72)+ 8)+ 24), v18, (ByteVectorCount + 16), (size_t *)buf);
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        uint64_t v21 = SPLogForSPLogCategoryDefault();
        os_log_type_t v22 = 2 * (gSPLogDebugAsDefault == 0);
        if (os_log_type_enabled(v21, v22))
        {
          LOWORD(dataOutMoved.st_dev) = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "Couldn't encrypt data", (uint8_t *)&dataOutMoved, 2u);
        }
      }
      else
      {
        write(*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v18, *(size_t *)buf);
      }
      [*(id *)(a1 + 32) backUpFileProtectionClassCheckWithFd:*(unsigned int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      memset(&dataOutMoved, 0, sizeof(dataOutMoved));
      fstat(*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), &dataOutMoved);
      close(*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
      free(v18);
      *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = -1;
      uint64_t v23 = *(_CCCryptor **)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
      if (v23)
      {
        CCCryptorRelease(v23);
        *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      }
      if (dataOutMoved.st_size > 0x40000uLL)
      {
        unlink((const char *)[(id)qword_1000A8E90 UTF8String]);
      }
      else
      {
        if (([(id)qword_1000A8E88 BOOLForKey:@"didCreateLocalBackup"] & 1) == 0) {
          [(id)objc_opt_class() checkForRestoreFile];
        }
        uint64_t v24 = (const std::__fs::filesystem::path *)[(id)qword_1000A8E90 UTF8String];
        uint64_t v25 = (const std::__fs::filesystem::path *)[(id)qword_1000A8E98 UTF8String];
        rename(v24, v25, v26);
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      }
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else if (!a2)
  {
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != -1
      || (*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = open((const char *)[(id)qword_1000A8E90 UTF8String], 1537, 384), write(*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), "SPOTLIGHT_RANKING_BACKUP_VERSION_00002", 0x26uLL), *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != -1))
    {
      *(void *)&dataOutMoved.st_dev = 0;
      unsigned int v9 = _MDPlistBytesGetByteVectorCount();
      size_t v10 = v9 + 16;
      id v11 = malloc_type_calloc(1uLL, v10, 0x5C44BB43uLL);
      ByteVector = (const uint8_t *)_MDPlistBytesGetByteVector();
      int v13 = (uint8_t *)malloc_type_malloc(v9 + 4096, 0x1E0945E8uLL);
      size_t v14 = compression_encode_buffer(v13, v9 + 4096, ByteVector, v9, 0, COMPRESSION_LZFSE);
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += v9;
      *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = CCCryptorUpdate(*(CCCryptorRef *)(*(void *)(*(void *)(a1 + 72)+ 8)+ 24), v13, v14, v11, v10, (size_t *)&dataOutMoved);
      if (*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
      {
        uint64_t v15 = SPLogForSPLogCategoryDefault();
        os_log_type_t v16 = 2 * (gSPLogDebugAsDefault == 0);
        if (os_log_type_enabled(v15, v16))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "Couldn't encrypt data", buf, 2u);
        }
      }
      else
      {
        write(*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v11, *(size_t *)&dataOutMoved.st_dev);
      }
      free(v11);
      free(v13);
    }
  }
}

void sub_10002BD08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, char a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a18, 8);
  objc_sync_exit(v18);
  _Unwind_Resume(a1);
}

void sub_10002BD58(uint64_t a1, void *a2)
{
  int v3 = a2;
  xpc_object_t v5 = xpc_activity_copy_criteria(v3);
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (v5 || (xpc_object_t v5 = *(id *)(a1 + 32), xpc_activity_set_criteria(v3, v5), state == 2))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      if ((state & 0xFFFFFFFFFFFFFFFBLL) != 0)
      {
        byte_1000A8ED8 = 1;
        xpc_activity_set_state(v3, 4);
        id v8 = dispatch_group_create();
        [WeakRetained restoreRankingSignalsFromEncryptedFile:v8];
        unsigned int v9 = dispatch_get_global_queue(9, 0);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002BF18;
        block[3] = &unk_1000921B0;
        id v11 = v3;
        dispatch_group_notify(v8, v9, block);

        [(id)qword_1000A8E88 setInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) + 1 forKey:@"backupRestoreAttemptCount"];
        [(id)qword_1000A8E88 setDouble:@"lastBackupRestoreAttemptTime" forKey:CFAbsoluteTimeGetCurrent()];
      }
    }
    else
    {
      xpc_activity_set_state(v3, 5);
      byte_1000A8ED8 = 0;
      byte_1000A8ED9 = 0;
    }
  }
}

void sub_10002BF18(uint64_t a1)
{
  byte_1000A8ED8 = 0;
  byte_1000A8ED9 = 0;
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  xpc_activity_unregister("com.apple.searchd.restoreBackup");
  uint64_t v1 = SPLogForSPLogCategoryDefault();
  os_log_type_t v2 = gSPLogInfoAsDefault ^ 1;
  if (os_log_type_enabled(v1, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
  {
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Marked XPC activity: restore from backup as done", v3, 2u);
  }
}

void sub_10002C260(uint64_t a1)
{
  id v99 = [*(id *)(a1 + 32) fetchKeyFromKeychain];
  if (v99)
  {
    uint64_t v150 = 0;
    id v151 = (int *)&v150;
    uint64_t v152 = 0x2020000000;
    unsigned int v153 = 0;
    unsigned int v153 = [*(id *)(a1 + 32) getBackupVersion:38];
    int v91 = +[SPCoreSpotlightIndexer sharedInstance];
    id v2 = objc_alloc((Class)NSMutableArray);
    id v95 = [v2 initWithArray:qword_1000A8EB8];
    if (v151[6] >= 2) {
      [v95 addObjectsFromArray:qword_1000A8EC0];
    }
    id v3 = objc_alloc((Class)NSMutableArray);
    id v4 = [v3 initWithArray:qword_1000A8EB8];
    [v4 addObjectsFromArray:qword_1000A8EC0];
    [v4 addObject:@"_kMDItemDidUpdateFromRestoredValues"];
    int v90 = v4;
    xpc_object_t v5 = objc_opt_new();
    [v5 setInternal:1];
    [v5 setLowPriority:0];
    CFStringRef v160 = @"com.apple.MobileAddressBook";
    id v6 = +[NSArray arrayWithObjects:&v160 count:1];
    [v5 setBundleIDs:v6];
    uint64_t v96 = v5;

    v159[0] = NSFileProtectionComplete;
    v159[1] = NSFileProtectionCompleteUnlessOpen;
    v159[2] = NSFileProtectionCompleteWhenUserInactive;
    v159[3] = NSFileProtectionCompleteUntilFirstUserAuthentication;
    id v7 = +[NSArray arrayWithObjects:v159 count:4];
    [v5 setProtectionClasses:v7];

    [v5 setFetchAttributes:v95];
    id v8 = [v5 fetchAttributes];
    id v9 = [v8 count];

    id v10 = objc_alloc((Class)NSData);
    id v149 = 0;
    id v93 = [v10 initWithContentsOfFile:qword_1000A8E98 options:8 error:&v149];
    id v89 = v149;
    if (v89)
    {
      id v11 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100065788();
      }

      goto LABEL_8;
    }
    dataOutAvailable = (char *)[v93 length];
    id v13 = v93;
    size_t v14 = (char *)[v13 bytes];
    id v15 = [v13 length];
    int v16 = v151[6];
    if (v16 == 1)
    {
      uint64_t v17 = 0;
    }
    else
    {
      dataOutAvailable -= 38;
      uint64_t v17 = 38;
    }
    if (v16 == 1) {
      size_t v18 = (size_t)v15;
    }
    else {
      size_t v18 = (size_t)v15 - 38;
    }
    int v148 = -1;
    dataOut = (char *)[*(id *)(a1 + 32) getDataOutWithSize:dataOutAvailable withFlag:1 fd:&v148];
    if (!dataOut)
    {
      uint64_t v21 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1000656EC();
      }

      goto LABEL_8;
    }
    size_t v147 = 0;
    long long iv = xmmword_1000749F0;
    if (CCCrypt(1u, 0, 1u, [v99 bytes], 0x10uLL, &iv, &v14[v17], v18, dataOut, (size_t)dataOutAvailable, &v147))
    {
      os_log_type_t v20 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100065754();
      }

      munmap(dataOut, (size_t)dataOutAvailable);
      close(v148);
      goto LABEL_8;
    }
    uint64_t v146 = -1;
    size_t v22 = v147 - 8;
    size_t v23 = *(void *)&dataOut[v147 - 8];
    uint64_t v24 = (const uint8_t *)sub_10002AC98(v148, v147 - 8, dataOut, (size_t)dataOutAvailable);
    uint64_t v25 = v24;
    if ((unint64_t)(v24 + 1) <= 1)
    {
      close(v148);
LABEL_8:

      _Block_object_dispose(&v150, 8);
      goto LABEL_9;
    }
    int v145 = -1;
    size_t v26 = sub_10002AE58(v24, v22, v23, (uint8_t **)&v146, COMPRESSION_LZFSE, &v145);
    v142[0] = _NSConcreteStackBlock;
    v142[1] = 3221225472;
    v142[2] = sub_10002D2AC;
    v142[3] = &unk_100092FF0;
    v142[4] = v25;
    v142[5] = v22;
    v142[6] = v146;
    v142[7] = v26;
    int v143 = v148;
    int v144 = v145;
    CFNullRef v81 = objc_retainBlock(v142);
    if (!v26)
    {
      ((void (*)(void))v81[2])();
      CFNullRef v70 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR)) {
        sub_100065720();
      }

LABEL_90:
      goto LABEL_8;
    }
    uint64_t v27 = (void *)_MDPlistBytesCreate();
    uint64_t v136 = 0;
    CFNullRef v137 = &v136;
    uint64_t v138 = 0x3032000000;
    CFNullRef v139 = sub_10002D328;
    id v140 = sub_10002D338;
    id v141 = 0;
    id v141 = (id)objc_opt_new();
    if (v151[6] == 1)
    {
      uint64_t v28 = 0;
      do
      {
        v135[0] = _NSConcreteStackBlock;
        v135[1] = 3221225472;
        v135[2] = sub_10002D340;
        v135[3] = &unk_100093018;
        v135[4] = &v150;
        unsigned __int8 v29 = [v27 enumerateQueryResults:v28++ attributeSize:v9 stringCache:0 usingBlock:v135];
      }
      while ((v29 & 1) != 0);
      if (!v151[6])
      {
        [v96 setFetchAttributes:qword_1000A8EB0];
        uint64_t v30 = [v96 fetchAttributes];
        id v9 = [v30 count];
      }
    }
    uint64_t v31 = 0;
    do
    {
      v134[0] = _NSConcreteStackBlock;
      v134[1] = 3221225472;
      v134[2] = sub_10002D784;
      v134[3] = &unk_100093040;
      v134[4] = &v150;
      v134[5] = &v136;
      unsigned __int8 v32 = [v27 enumerateQueryResults:v31++ attributeSize:v9 stringCache:0 usingBlock:v134];
    }
    while ((v32 & 1) != 0);
    ((void (*)(void))v81[2])();
    uint64_t v33 = dispatch_group_create();
    dispatch_group_enter(v33);
    uint64_t v34 = objc_opt_new();
    [v96 setFetchAttributes:&off_100099188];
    int v35 = [v96 fetchAttributes];
    id v36 = [v35 count];

    v129[0] = _NSConcreteStackBlock;
    v129[1] = 3221225472;
    v129[2] = sub_10002DDE4;
    v129[3] = &unk_100093090;
    id v133 = v36;
    uint64_t v132 = &v136;
    id v85 = v34;
    id v130 = v85;
    int v37 = v33;
    id v131 = v37;
    int v79 = [v91 startQuery:@"*==*" withContext:v96 handler:v129];
    if (!v79) {
      dispatch_group_leave(v37);
    }
    group = v37;
    dispatch_group_wait(v37, 0xFFFFFFFFFFFFFFFFLL);
    id v38 = objc_alloc((Class)CNContactStore);
    char v39 = objc_opt_new();
    id v98 = [v38 initWithConfiguration:v39];

    CFNullRef v157 = CNContactIdentifierKey;
    int v97 = +[NSArray arrayWithObjects:&v157 count:1];
    long long v127 = 0u;
    long long v128 = 0u;
    long long v125 = 0u;
    long long v126 = 0u;
    uint64_t v40 = [(id)v137[5] allKeys];
    id v41 = [v40 countByEnumeratingWithState:&v125 objects:v156 count:16];
    id obj = v40;
    if (!v41)
    {
      id v42 = 0;
      goto LABEL_87;
    }
    id v42 = 0;
    uint64_t v83 = *(void *)v126;
    id v84 = v41;
LABEL_38:
    uint64_t v92 = 0;
    while (1)
    {
      if (*(void *)v126 != v83) {
        objc_enumerationMutation(obj);
      }
      uint64_t v87 = *(void *)(*((void *)&v125 + 1) + 8 * v92);
      if ((objc_msgSend(v85, "containsObject:") & 1) == 0) {
        break;
      }
LABEL_78:
      if ((id)++v92 == v84)
      {
        id v69 = [obj countByEnumeratingWithState:&v125 objects:v156 count:16];
        id v84 = v69;
        if (!v69)
        {
LABEL_87:

          [v96 setFetchAttributes:v90];
          id v71 = [v96 fetchAttributes];
          id v72 = [v71 count];

          uint64_t v108 = 0;
          int v109 = &v108;
          uint64_t v110 = 0x3032000000;
          int v111 = sub_10002D328;
          int v112 = sub_10002D338;
          id v113 = 0;
          id v113 = (id)objc_opt_new();
          dispatch_group_enter(group);
          v103[0] = _NSConcreteStackBlock;
          v103[1] = 3221225472;
          v103[2] = sub_10002DF94;
          v103[3] = &unk_1000930B8;
          id v106 = &v108;
          id v107 = v72;
          CFNullRef v105 = &v136;
          CFBooleanRef v73 = group;
          CFNullRef v104 = v73;
          id v74 = [v91 startQuery:@"*==*" withContext:v96 handler:v103];
          dispatch_group_wait(v73, 0xFFFFFFFFFFFFFFFFLL);
          dispatch_group_enter(v73);
          uint64_t v75 = v109[5];
          v101[0] = _NSConcreteStackBlock;
          v101[1] = 3221225472;
          v101[2] = sub_10002E860;
          v101[3] = &unk_100091E18;
          int v76 = v73;
          int v102 = v76;
          [v91 indexSearchableItems:v75 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:0 forBundleID:@"com.apple.MobileAddressBook" options:0 completionHandler:v101];
          dispatch_group_wait(v76, 0xFFFFFFFFFFFFFFFFLL);
          CFNullRef v77 = SPLogForSPLogCategoryDefault();
          os_log_type_t v78 = gSPLogInfoAsDefault ^ 1;
          if (os_log_type_enabled(v77, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v77, v78, "Completed restoration of contacts metadata", buf, 2u);
          }

          _Block_object_dispose(&v108, 8);
          _Block_object_dispose(&v136, 8);

          goto LABEL_90;
        }
        goto LABEL_38;
      }
    }
    int v88 = [(id)v137[5] objectForKey:v87];
    uint64_t v43 = [v88 objectForKey:off_1000A8938];
    v86 = v43;
    if (v43)
    {
      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      id v44 = v43;
      id v45 = 0;
      id v46 = [v44 countByEnumeratingWithState:&v121 objects:v155 count:16];
      if (v46)
      {
        uint64_t v47 = *(void *)v122;
        int v48 = v42;
LABEL_45:
        uint64_t v49 = 0;
        os_log_type_t v50 = v45;
        while (1)
        {
          if (*(void *)v122 != v47) {
            objc_enumerationMutation(v44);
          }
          CFStringRef v51 = +[CNPhoneNumber phoneNumberWithStringValue:*(void *)(*((void *)&v121 + 1) + 8 * (void)v49)];
          long long v52 = +[CNContact predicateForContactsMatchingPhoneNumber:v51];
          id v120 = v48;
          id v45 = [v98 unifiedContactsMatchingPredicate:v52 keysToFetch:v97 error:&v120];
          id v42 = v120;

          if (v42)
          {
            long long v53 = 0;
            goto LABEL_56;
          }
          if ([v45 count] == (id)1) {
            break;
          }

          int v48 = 0;
          uint64_t v49 = (char *)v49 + 1;
          os_log_type_t v50 = v45;
          if (v46 == v49)
          {
            id v46 = [v44 countByEnumeratingWithState:&v121 objects:v155 count:16];
            int v48 = 0;
            id v42 = 0;
            if (v46) {
              goto LABEL_45;
            }
            goto LABEL_52;
          }
        }
        long long v53 = [v45 objectAtIndexedSubscript:0];
LABEL_56:

        if (v53) {
          goto LABEL_70;
        }
      }
      else
      {
LABEL_52:
      }
    }
    else
    {
      id v45 = 0;
    }
    long long v54 = [v88 objectForKey:off_1000A8920];
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v55 = v54;
    id v56 = [v55 countByEnumeratingWithState:&v116 objects:v154 count:16];
    if (v56)
    {
      uint64_t v57 = *(void *)v117;
      long long v58 = v42;
LABEL_59:
      id v59 = 0;
      id v60 = v45;
      while (1)
      {
        if (*(void *)v117 != v57) {
          objc_enumerationMutation(v55);
        }
        long long v61 = +[CNContact predicateForContactsMatchingEmailAddress:*(void *)(*((void *)&v116 + 1) + 8 * (void)v59)];
        id v115 = v58;
        id v45 = [v98 unifiedContactsMatchingPredicate:v61 keysToFetch:v97 error:&v115];
        id v42 = v115;

        if (v42)
        {
          long long v53 = 0;
          goto LABEL_69;
        }
        if ([v45 count] == (id)1) {
          break;
        }

        long long v58 = 0;
        id v59 = (char *)v59 + 1;
        id v60 = v45;
        if (v56 == v59)
        {
          id v56 = [v55 countByEnumeratingWithState:&v116 objects:v154 count:16];
          long long v58 = 0;
          id v42 = 0;
          if (v56) {
            goto LABEL_59;
          }
          goto LABEL_66;
        }
      }
      long long v53 = [v45 objectAtIndexedSubscript:0];
LABEL_69:

      if (!v53) {
        goto LABEL_71;
      }
      goto LABEL_70;
    }
LABEL_66:

LABEL_71:
    CFStringRef v66 = [v88 objectForKey:off_1000A8928];
    long long v67 = +[CNContact predicateForContactsMatchingName:v66 options:1];
    id v114 = v42;
    __int16 v65 = [v98 unifiedContactsMatchingPredicate:v67 keysToFetch:v97 error:&v114];
    id v68 = v114;

    BOOL v64 = v68 == 0;
    id v42 = v68;
    if (!v68)
    {
      if ([v65 count] == (id)1)
      {
        long long v53 = [v65 objectAtIndexedSubscript:0];

        id v42 = 0;
        if (v53)
        {
          id v45 = v65;
LABEL_70:
          uint64_t v62 = (void *)v137[5];
          long long v63 = [v53 identifier];
          [v62 setObject:v88 forKey:v63];

          [(id)v137[5] removeObjectForKey:v87];
          BOOL v64 = 1;
          __int16 v65 = v45;
          goto LABEL_77;
        }
        BOOL v64 = 1;
        long long v53 = 0;
LABEL_77:

        if (!v64) {
          goto LABEL_87;
        }
        goto LABEL_78;
      }
      id v42 = 0;
    }

    long long v53 = 0;
    goto LABEL_77;
  }
LABEL_9:
}

void sub_10002D1A8(_Unwind_Exception *a1)
{
}

uint64_t sub_10002D2AC(uint64_t a1)
{
  munmap(*(void **)(a1 + 32), *(void *)(a1 + 40));
  munmap(*(void **)(a1 + 48), *(void *)(a1 + 56));
  int v2 = *(_DWORD *)(a1 + 64);
  if (v2 != -1)
  {
    sub_10002AD50(v2);
    close(*(_DWORD *)(a1 + 64));
  }
  uint64_t result = *(unsigned int *)(a1 + 68);
  if (result != -1)
  {
    sub_10002AD50(result);
    int v4 = *(_DWORD *)(a1 + 68);
    return close(v4);
  }
  return result;
}

uint64_t sub_10002D328(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002D338(uint64_t a1)
{
}

void sub_10002D340(uint64_t a1, CFNullRef *a2, unsigned char *a3)
{
  CFNullRef v7 = *a2;
  if (*a2 == kCFNull) {
    CFNullRef v7 = 0;
  }
  CFNullRef v8 = v7;
  CFNullRef v9 = v8;
  if (v8) {
    BOOL v10 = v8 == kCFNull;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    CFNullRef v11 = a2[4];
    if (v11 == kCFNull) {
      CFNullRef v11 = 0;
    }
    CFNullRef v12 = v11;
    CFNullRef v13 = a2[5];
    if (v13 == kCFNull) {
      CFNullRef v13 = 0;
    }
    CFNullRef v14 = v13;
    CFNullRef v15 = a2[6];
    if (v15 == kCFNull) {
      CFNullRef v15 = 0;
    }
    CFNullRef v40 = v15;
    CFNullRef v16 = a2[7];
    if (v16 == kCFNull) {
      CFNullRef v16 = 0;
    }
    CFNullRef v39 = v16;
    CFNullRef v17 = a2[8];
    if (v17 == kCFNull) {
      CFNullRef v17 = 0;
    }
    CFNullRef v38 = v17;
    CFNullRef v18 = a2[9];
    if (v18 == kCFNull) {
      CFNullRef v18 = 0;
    }
    CFNullRef v37 = v18;
    CFNullRef v19 = a2[10];
    if (v19 == kCFNull) {
      CFNullRef v19 = 0;
    }
    CFNullRef v36 = v19;
    CFNullRef v20 = a2[11];
    if (v20 == kCFNull) {
      CFNullRef v20 = 0;
    }
    CFNullRef v35 = v20;
    CFNullRef v21 = a2[12];
    if (v21 == kCFNull) {
      CFNullRef v21 = 0;
    }
    CFNullRef v34 = v21;
    CFNullRef v22 = a2[13];
    if (v22 == kCFNull) {
      CFNullRef v22 = 0;
    }
    CFNullRef v33 = v22;
    CFNullRef v23 = a2[14];
    if (v23 == kCFNull) {
      CFNullRef v23 = 0;
    }
    CFNullRef v32 = v23;
    CFNullRef v24 = a2[15];
    if (v24 == kCFNull) {
      CFNullRef v24 = 0;
    }
    CFNullRef v31 = v24;
    CFNullRef v25 = a2[16];
    if (v25 == kCFNull) {
      CFNullRef v25 = 0;
    }
    CFNullRef v26 = v25;
    CFNullRef v27 = a2[17];
    if (v27 == kCFNull) {
      CFNullRef v27 = 0;
    }
    CFNullRef v28 = v27;
    CFNullRef v29 = a2[18];
    if (v29 == kCFNull) {
      CFNullRef v29 = 0;
    }
    CFNullRef v30 = v29;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_67;
      }
    }
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_67;
      }
    }
    if (v40)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_67;
      }
    }
    if (v39)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_67;
      }
    }
    if (v38)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_67;
      }
    }
    if (v37)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_67;
      }
    }
    if (v36)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_67;
      }
    }
    if (v35)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_67;
      }
    }
    if (v34 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v33 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v32 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v31 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v26 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v28 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
LABEL_67:
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      *a3 = 1;
    }
  }
}

void sub_10002D784(uint64_t a1, CFNullRef *a2)
{
  CFNullRef v5 = *a2;
  if (*a2 == kCFNull) {
    CFNullRef v5 = 0;
  }
  CFNullRef v6 = v5;
  CFNullRef v7 = v6;
  if (v6) {
    BOOL v8 = v6 == kCFNull;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    CFNullRef v9 = a2[1];
    if (v9 == kCFNull) {
      CFNullRef v9 = 0;
    }
    CFNullRef v70 = v9;
    CFNullRef v10 = a2[2];
    if (v10 == kCFNull) {
      CFNullRef v10 = 0;
    }
    CFNullRef v69 = v10;
    CFNullRef v11 = a2[3];
    if (v11 == kCFNull) {
      CFNullRef v11 = 0;
    }
    CFNullRef v68 = v11;
    int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    uint64_t v57 = v4;
    uint64_t v58 = a1;
    if (v12)
    {
      if (v12 < 1)
      {
        CFNullRef v41 = 0;
        CFNullRef v39 = 0;
        CFNullRef v37 = 0;
        CFNullRef v35 = 0;
        CFNullRef v59 = 0;
        CFNullRef v32 = 0;
        CFNullRef v62 = 0;
        CFNullRef v29 = 0;
        CFNullRef v65 = 0;
        CFNullRef v66 = 0;
        CFNullRef v67 = 0;
        CFNullRef v45 = 0;
        CFNullRef v44 = 0;
        CFNullRef v43 = 0;
        CFNullRef v42 = 0;
LABEL_49:
        CFNullRef v61 = v32;
        CFNullRef v64 = v29;
        CFNullRef v72 = v45;
        CFNullRef v74 = v44;
        CFNullRef v76 = v43;
        CFNullRef v78 = v42;
        if (*(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) <= 1)
        {
          CFNullRef v47 = 0;
          CFNullRef v49 = 0;
          CFNullRef v51 = 0;
          CFNullRef v53 = 0;
        }
        else
        {
          CFNullRef v46 = a2[19];
          if (v46 == kCFNull) {
            CFNullRef v46 = 0;
          }
          CFNullRef v47 = v46;
          CFNullRef v48 = a2[20];
          if (v48 == kCFNull) {
            CFNullRef v48 = 0;
          }
          CFNullRef v49 = v48;
          CFNullRef v50 = a2[21];
          if (v50 == kCFNull) {
            CFNullRef v50 = 0;
          }
          CFNullRef v51 = v50;
          CFNullRef v52 = a2[22];
          if (v52 == kCFNull) {
            CFNullRef v52 = 0;
          }
          CFNullRef v53 = v52;
        }
        long long v54 = objc_opt_new();
        id v55 = v54;
        if (v70) {
          [v54 setObject:v70 forKey:off_1000A88A0];
        }
        if (v65) {
          [v55 setObject:v65 forKey:off_1000A88A8];
        }
        if (v64) {
          [v55 setObject:v64 forKey:off_1000A88B0];
        }
        if (v67) {
          [v55 setObject:v67 forKey:off_1000A88B8];
        }
        if (v66) {
          [v55 setObject:v66 forKey:off_1000A88C0];
        }
        if (v62) {
          [v55 setObject:v62 forKey:off_1000A88C8];
        }
        if (v69) {
          [v55 setObject:v69 forKey:off_1000A88D0];
        }
        if (v68) {
          [v55 setObject:v68 forKey:off_1000A88D8];
        }
        if (v78) {
          [v55 setObject:v78 forKey:off_1000A88E0];
        }
        if (v76) {
          [v55 setObject:v76 forKey:off_1000A88E8];
        }
        if (v74) {
          [v55 setObject:v74 forKey:off_1000A88F0];
        }
        if (v72) {
          [v55 setObject:v72 forKey:off_1000A88F8];
        }
        if (v47) {
          [v55 setObject:v47 forKey:off_1000A8900];
        }
        if (v49) {
          [v55 setObject:v49 forKey:off_1000A8908];
        }
        if (v51) {
          [v55 setObject:v51 forKey:off_1000A8910];
        }
        if (v53) {
          [v55 setObject:v53 forKey:off_1000A8918];
        }
        if (v59) {
          [v55 setObject:v59 forKey:off_1000A8930];
        }
        if (v35) {
          [v55 setObject:v35 forKey:off_1000A8920];
        }
        if (v37) {
          [v55 setObject:v37 forKey:off_1000A8928];
        }
        if (v39) {
          [v55 setObject:v39 forKey:off_1000A8938];
        }
        if (v41) {
          [v55 setObject:v41 forKey:off_1000A8940];
        }
        if (v61) {
          [v55 setObject:v61 forKey:off_1000A8948];
        }
        if ([v55 count]) {
          [*(id *)(*(void *)(*(void *)(v58 + 40) + 8) + 40) setObject:v55 forKey:v7];
        }

        int v4 = v57;
        goto LABEL_107;
      }
      CFNullRef v13 = a2[4];
      if (v13 == kCFNull) {
        CFNullRef v13 = 0;
      }
      CFNullRef v77 = v13;
      CFNullRef v14 = a2[5];
      if (v14 == kCFNull) {
        CFNullRef v14 = 0;
      }
      CFNullRef v75 = v14;
      CFNullRef v15 = a2[6];
      if (v15 == kCFNull) {
        CFNullRef v15 = 0;
      }
      CFNullRef v73 = v15;
      CFNullRef v16 = a2[7];
      if (v16 == kCFNull) {
        CFNullRef v16 = 0;
      }
      CFNullRef v71 = v16;
      uint64_t v63 = 18;
      uint64_t v60 = 17;
      uint64_t v56 = 16;
      uint64_t v17 = 15;
      uint64_t v18 = 14;
      uint64_t v19 = 13;
      uint64_t v20 = 12;
      uint64_t v21 = 11;
      uint64_t v22 = 10;
      uint64_t v23 = 9;
      uint64_t v24 = 8;
    }
    else
    {
      CFNullRef v71 = 0;
      CFNullRef v73 = 0;
      CFNullRef v75 = 0;
      CFNullRef v77 = 0;
      uint64_t v63 = 14;
      uint64_t v60 = 13;
      uint64_t v56 = 12;
      uint64_t v17 = 11;
      uint64_t v18 = 10;
      uint64_t v19 = 9;
      uint64_t v20 = 8;
      uint64_t v21 = 7;
      uint64_t v22 = 6;
      uint64_t v23 = 5;
      uint64_t v24 = 4;
    }
    CFNullRef v25 = a2[v24];
    if (v25 == kCFNull) {
      CFNullRef v25 = 0;
    }
    CFNullRef v67 = v25;
    CFNullRef v26 = a2[v23];
    if (v26 == kCFNull) {
      CFNullRef v26 = 0;
    }
    CFNullRef v66 = v26;
    CFNullRef v27 = a2[v22];
    if (v27 == kCFNull) {
      CFNullRef v27 = 0;
    }
    CFNullRef v65 = v27;
    CFNullRef v28 = a2[v21];
    if (v28 == kCFNull) {
      CFNullRef v28 = 0;
    }
    CFNullRef v29 = v28;
    CFNullRef v30 = a2[v20];
    if (v30 == kCFNull) {
      CFNullRef v30 = 0;
    }
    CFNullRef v62 = v30;
    CFNullRef v31 = a2[v19];
    if (v31 == kCFNull) {
      CFNullRef v31 = 0;
    }
    CFNullRef v32 = v31;
    CFNullRef v33 = a2[v18];
    if (v33 == kCFNull) {
      CFNullRef v33 = 0;
    }
    CFNullRef v59 = v33;
    CFNullRef v34 = a2[v17];
    if (v34 == kCFNull) {
      CFNullRef v34 = 0;
    }
    CFNullRef v35 = v34;
    CFNullRef v36 = a2[v56];
    if (v36 == kCFNull) {
      CFNullRef v36 = 0;
    }
    CFNullRef v37 = v36;
    CFNullRef v38 = a2[v60];
    if (v38 == kCFNull) {
      CFNullRef v38 = 0;
    }
    CFNullRef v39 = v38;
    CFNullRef v40 = a2[v63];
    if (v40 == kCFNull) {
      CFNullRef v40 = 0;
    }
    CFNullRef v41 = v40;
    CFNullRef v43 = v75;
    CFNullRef v42 = v77;
    a1 = v58;
    CFNullRef v44 = v73;
    CFNullRef v45 = v71;
    goto LABEL_49;
  }
LABEL_107:
}

void sub_10002DDE4(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    CFNullRef v5 = *(NSObject **)(a1 + 40);
    dispatch_group_leave(v5);
  }
  else
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002DEA8;
    v8[3] = &unk_100093068;
    uint64_t v7 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 48);
    id v9 = *(id *)(a1 + 32);
    [a5 enumerateQueryResults:v7 stringCache:0 usingBlock:v8];
  }
}

void sub_10002DEA8(uint64_t a1, CFNullRef *a2)
{
  CFNullRef v5 = *a2;
  if (*a2 == kCFNull) {
    CFNullRef v5 = 0;
  }
  CFNullRef v6 = v5;
  CFNullRef v7 = a2[1];
  if (v7 == kCFNull) {
    CFNullRef v7 = 0;
  }
  CFNullRef v8 = v7;
  id v9 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKey:v6];
  if (v9) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10) {
    [*(id *)(a1 + 32) addObject:v6];
  }
  if ([(__CFNull *)v8 integerValue]) {
    BOOL v11 = v6 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeObjectForKey:v6];
  }
}

void sub_10002DF94(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (a2)
  {
    CFNullRef v6 = *(NSObject **)(a1 + 32);
    dispatch_group_leave(v6);
  }
  else
  {
    uint64_t v8 = 0;
    do
    {
      uint64_t v9 = v8 + 1;
      unsigned __int8 v10 = objc_msgSend(a5, "enumerateQueryResults:attributeSize:stringCache:usingBlock:", _NSConcreteStackBlock, 3221225472, sub_10002E084, &unk_100093040, *(_OWORD *)(a1 + 40));
      uint64_t v8 = v9;
    }
    while ((v10 & 1) != 0);
  }
}

void sub_10002E084(uint64_t a1, CFNullRef *a2)
{
  CFNullRef v3 = *a2;
  if (*a2 == kCFNull) {
    CFNullRef v3 = 0;
  }
  CFNullRef v71 = v3;
  CFNullRef v4 = a2[1];
  uint64_t v61 = (uint64_t)v4;
  if (v4 == kCFNull) {
    CFNullRef v4 = 0;
  }
  CFNullRef v5 = v4;
  CFNullRef v6 = a2[2];
  if (v6 == kCFNull) {
    CFNullRef v6 = 0;
  }
  CFNullRef v67 = v6;
  CFNullRef v7 = a2[3];
  if (v7 == kCFNull) {
    CFNullRef v7 = 0;
  }
  CFNullRef v66 = v7;
  CFNullRef v8 = a2[4];
  if (v8 == kCFNull) {
    CFNullRef v8 = 0;
  }
  CFNullRef v65 = v8;
  CFNullRef v9 = a2[5];
  if (v9 == kCFNull) {
    CFNullRef v9 = 0;
  }
  CFNullRef v64 = v9;
  CFNullRef v10 = a2[6];
  if (v10 == kCFNull) {
    CFNullRef v10 = 0;
  }
  CFNullRef v63 = v10;
  CFNullRef v11 = a2[7];
  if (v11 == kCFNull) {
    CFNullRef v11 = 0;
  }
  CFNullRef v62 = v11;
  CFNullRef v12 = a2[8];
  if (v12 == kCFNull) {
    CFNullRef v12 = 0;
  }
  CFNullRef v70 = v12;
  CFNullRef v13 = a2[9];
  if (v13 == kCFNull) {
    CFNullRef v13 = 0;
  }
  CFNullRef v74 = v13;
  CFNullRef v14 = a2[10];
  if (v14 == kCFNull) {
    CFNullRef v14 = 0;
  }
  CFNullRef v73 = v14;
  CFNullRef v15 = a2[11];
  if (v15 == kCFNull) {
    CFNullRef v15 = 0;
  }
  CFNullRef v72 = v15;
  CFNullRef v16 = a2[12];
  if (v16 == kCFNull) {
    CFNullRef v16 = 0;
  }
  CFNullRef v17 = v16;
  CFNullRef v18 = a2[13];
  if (v18 == kCFNull) {
    CFNullRef v19 = 0;
  }
  else {
    CFNullRef v19 = a2[13];
  }
  CFNullRef v69 = v19;
  CFNullRef v20 = a2[14];
  if (v20 == kCFNull) {
    CFNullRef v21 = 0;
  }
  else {
    CFNullRef v21 = a2[14];
  }
  CFNullRef v22 = v21;
  CFNullRef v23 = a2[19];
  if (v23 == kCFNull) {
    CFNullRef v23 = 0;
  }
  CFNullRef v24 = v23;
  CFNullRef v25 = a2[20];
  if (v25 == kCFNull) {
    CFNullRef v25 = 0;
  }
  CFNullRef v68 = v25;
  CFNullRef v26 = a2[21];
  if (v26 == kCFNull) {
    CFNullRef v26 = 0;
  }
  CFNullRef v27 = v26;
  CFNullRef v28 = a2[22];
  if (v28 == kCFNull) {
    CFNullRef v28 = 0;
  }
  CFNullRef v29 = v28;
  CFNullRef v30 = a2[23];
  if (v30 == kCFNull) {
    CFNullRef v30 = 0;
  }
  CFNullRef v31 = v30;
  CFNullRef v32 = v31;
  if (v31 && [(__CFNull *)v31 integerValue])
  {
    CFNullRef v33 = v27;
    CFNullRef v34 = v17;
    CFNullRef v36 = v65;
    CFNullRef v35 = v66;
    CFNullRef v37 = v64;
    goto LABEL_109;
  }
  CFNullRef v58 = v32;
  CFNullRef v38 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKey:v71];
  CFNullRef v39 = v38;
  if (v38)
  {
    CFNullRef v40 = [v38 objectForKey:off_1000A88B8];
    uint64_t v56 = v40;
    if (v40)
    {
      if (v70)
      {
        uint64_t v41 = [v40 arrayByAddingObjectsFromArray:v70];

        CFNullRef v70 = (const __CFNull *)v41;
      }
      else
      {
        CFNullRef v70 = v40;
      }
    }
    CFNullRef v42 = [v39 objectForKey:off_1000A88A8];
    id v55 = v42;
    if (v42)
    {
      if (v73)
      {
        uint64_t v43 = [v42 arrayByAddingObjectsFromArray:v73];

        CFNullRef v73 = (const __CFNull *)v43;
      }
      else
      {
        CFNullRef v73 = v42;
      }
    }
    CFNullRef v44 = [v39 objectForKey:off_1000A88C0];
    long long v54 = v44;
    if (v44)
    {
      if (v74)
      {
        uint64_t v45 = [v44 arrayByAddingObjectsFromArray:v74];

        CFNullRef v74 = (const __CFNull *)v45;
      }
      else
      {
        CFNullRef v74 = v44;
      }
    }
    CFNullRef v46 = [v39 objectForKey:off_1000A88B0];
    CFNullRef v53 = v46;
    if (v46)
    {
      if (v72)
      {
        uint64_t v47 = [v46 arrayByAddingObjectsFromArray:v72];

        CFNullRef v72 = (const __CFNull *)v47;
      }
      else
      {
        CFNullRef v72 = v46;
      }
    }
    CFNullRef v48 = [v39 objectForKey:off_1000A88C8];
    uint64_t v57 = v48;
    if (v48)
    {
      if (!v17)
      {
        CFNullRef v17 = v48;
        if (v5)
        {
LABEL_68:
          if (v22)
          {
LABEL_69:
            if (!v69)
            {
              CFNullRef v18 = [v39 objectForKey:off_1000A8948];
            }
            id v50 = objc_alloc_init((Class)CSSearchableItemAttributeSet);
            CFNullRef v51 = v50;
            if (v61) {
              [v50 setAttribute:v61 forKey:@"_kMDItemLaunchString"];
            }
            if (v20) {
              [v51 setAttribute:v20 forKey:@"_kMDItemShortcutLastUsedDate"];
            }
            if (v18) {
              [v51 setAttribute:v18 forKey:@"kMDItemLastUsedDate_Ranking"];
            }
            if ([(__CFNull *)v70 count]) {
              [v51 setAttribute:v70 forKey:MDItemIncomingVideoCallDates];
            }
            if ([(__CFNull *)v74 count]) {
              [v51 setAttribute:v74 forKey:MDItemOutgoingVideoCallDates];
            }
            if ([(__CFNull *)v73 count]) {
              [v51 setAttribute:v73 forKey:MDItemIncomingAudioCallDates];
            }
            if ([(__CFNull *)v72 count]) {
              [v51 setAttribute:v72 forKey:MDItemOutgoingAudioCallDates];
            }
            if (v67) {
              [v51 setAttribute:v67 forKey:MDItemIncomingCounts];
            }
            if (v66) {
              [v51 setAttribute:v66 forKey:MDItemOutgoingCounts];
            }
            if (v65) {
              [v51 setAttribute:v65 forKey:MDItemIncomingMailCounts];
            }
            if (v64) {
              [v51 setAttribute:v64 forKey:MDItemOutgoingMailCounts];
            }
            if (v63) {
              [v51 setAttribute:v63 forKey:MDItemIncomingSMSCounts];
            }
            if (v62) {
              [v51 setAttribute:v62 forKey:MDItemOutgoingSMSCounts];
            }
            if (v24) {
              [v51 setAttribute:v24 forKey:MDItemIncomingCalendarCounts];
            }
            if (v68) {
              [v51 setAttribute:v68 forKey:MDItemOutgoingCalendarCounts];
            }
            if (v27) {
              [v51 setAttribute:v27 forKey:MDItemIncomingFileProviderCounts];
            }
            CFNullRef v69 = v18;
            if (v29) {
              [v51 setAttribute:v29 forKey:MDItemOutgoingFileProviderCounts];
            }
            CFNullRef v22 = v20;
            CFNullRef v33 = v27;
            if ([(__CFNull *)v17 count]) {
              [v51 setAttribute:v17 forKey:@"kMDItemUsedDates"];
            }
            CFNullRef v34 = v17;
            [v51 setAttribute:&__kCFBooleanTrue forKey:@"_kMDItemDidUpdateFromRestoredValues"];
            id v52 = objc_alloc_init((Class)CSSearchableItem);
            [v52 setUniqueIdentifier:v71];
            [v52 setIsUpdate:1];
            [v52 setAttributeSet:v51];
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v52];

            CFNullRef v5 = (const __CFNull *)v61;
            goto LABEL_108;
          }
LABEL_114:
          CFNullRef v20 = [v39 objectForKey:off_1000A8930];
          goto LABEL_69;
        }
LABEL_113:
        uint64_t v61 = [v39 objectForKey:off_1000A88A0];
        if (v22) {
          goto LABEL_69;
        }
        goto LABEL_114;
      }
      uint64_t v49 = [v48 arrayByAddingObjectsFromArray:v17];

      CFNullRef v17 = (const __CFNull *)v49;
    }
    if (v5) {
      goto LABEL_68;
    }
    goto LABEL_113;
  }
  CFNullRef v33 = v27;
  CFNullRef v34 = v17;
LABEL_108:
  CFNullRef v36 = v65;
  CFNullRef v35 = v66;
  CFNullRef v37 = v64;

  CFNullRef v32 = v58;
LABEL_109:
}

void sub_10002E860(uint64_t a1)
{
}

void sub_10002E8F4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_10002F188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  sub_1000067B0(v35 - 192);
  _Unwind_Resume(a1);
}

void sub_10002F228(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained storeCompletedSearch:*(void *)(a1 + 32) withSections:&__NSArray0__struct];
}

void sub_10002F280(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained storeCompletedSearch:*(void *)(a1 + 32) withSections:&__NSArray0__struct];
}

void sub_10002F2D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  CFNullRef v4 = +[NSArray arrayWithObjects:&v5 count:1];
  [WeakRetained storeCompletedSearch:v3 withSections:v4];
}

void sub_10002F5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10002F73C(id a1)
{
}

void sub_10002FE88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose((const void *)(v53 - 176), 8);
  sub_1000067B0((uint64_t)&a53);
  _Unwind_Resume(a1);
}

uint64_t sub_10002FEF8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002FF08(uint64_t a1)
{
}

void sub_10002FF10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = si_tracing_current_span();
  long long v58 = *(_OWORD *)v7;
  long long v59 = *(_OWORD *)(v7 + 16);
  uint64_t v60 = *(void *)(v7 + 32);
  uint64_t v8 = *(void *)(a1 + 96);
  long long v9 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)uint64_t v7 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v7 + 16) = v9;
  *(void *)(v7 + 32) = v8;
  uint64_t v10 = *(void *)v7;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v12 = *(void *)(v7 + 8);
  *(void *)uint64_t v7 = v10;
  *(void *)(v7 + _Block_object_dispose(&STACK[0x378], 8) = spanid;
  *(void *)(v7 + 16) = v12;
  *(unsigned char *)(v7 + 2_Block_object_dispose(&STACK[0x378], 8) = 102;
  *(void *)(v7 + 32) = "SPCalculationDatastore replyBlock";
  si_tracing_log_span_begin();
  id v13 = objc_alloc_init((Class)NSNumberFormatter);
  CFNullRef v14 = +[NSLocale systemLocale];
  [v13 setLocale:v14];

  [v13 setNumberStyle:1];
  [v13 setMaximumFractionDigits:10];
  CFNullRef v15 = [v5 formattedResult];
  CFNullRef v16 = [v13 numberFromString:v15];

  CFNullRef v17 = [v13 numberFromString:*(void *)(a1 + 32)];
  CFNullRef v18 = [v5 formattedResult];
  if (([v18 isEqualToString:*(void *)(a1 + 32)] & 1) != 0
    || ([v16 isEqual:v17] & 1) != 0)
  {

    goto LABEL_4;
  }
  id v19 = [*(id *)(a1 + 32) length];

  if ((unint64_t)v19 < 2) {
    goto LABEL_4;
  }
  CFNullRef v20 = [v5 formattedResult];

  if (v20)
  {
    id v56 = v6;
    CFNullRef v21 = SPLogForSPLogCategoryDefault();
    os_log_type_t v22 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v21, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      CFStringRef v54 = *(const __CFString **)(a1 + 32);
      CFNullRef v23 = [v5 formattedResult];
      *(_DWORD *)buf = 138412546;
      CFStringRef v64 = v54;
      __int16 v65 = 2112;
      CFNullRef v66 = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "CalcSearch results for %@: %@", buf, 0x16u);
    }
    id v6 = v56;
  }
  id v24 = [v5 unitType];
  if (v5)
  {
    CFNullRef v25 = [v5 inputValueAndUnit];
    BOOL v53 = v25 == 0;
  }
  else
  {
    BOOL v53 = 0;
  }
  uint64_t v57 = [v5 formattedResult];
  if (![v57 length]) {
    goto LABEL_31;
  }
  unsigned __int8 v26 = [v5 isTrivial];

  if ((v26 & 1) == 0)
  {
    if (!v53)
    {
      CFNullRef v27 = objc_opt_new();
      [v27 setNumberStyle:1];
      [v27 setUsesGroupingSeparator:1];
      [v27 setMaximumFractionDigits:2];
      [v5 setNumberFormatter:v27];
    }
    uint64_t v57 = objc_opt_new();
    [v57 beginDictionary];
    CFNullRef v28 = [v5 formattedExpression];
    [v57 encodeObject:v28 withKey:@"SSAttributeCalculatorInput"];

    CFNullRef v29 = [v5 formattedResult];
    [v57 encodeObject:v29 withKey:@"SSAttributeCalculatorOutput"];

    if (v53)
    {
      CFNullRef v30 = +[NSNumber numberWithBool:1];
      [v57 encodeObject:v30 withKey:@"SSAttributeIsCalculation"];
    }
    if (v24 == (id)16)
    {
      CFNullRef v31 = +[NSNumber numberWithBool:1];
      [v57 encodeObject:v31 withKey:@"SSAttributeIsCurrencyConversion"];
    }
    [v57 endDictionary];
    id v55 = objc_alloc_init((Class)SFSearchResult_Compatibility);
    CFNullRef v32 = [*(id *)(a1 + 48) queryContext];
    CFNullRef v33 = [v32 getTrimmedSearchString];
    CFNullRef v34 = [@"calculation-" stringByAppendingString:v33];
    [v55 setIdentifier:v34];

    [v55 setQueryId:*(void *)(a1 + 104)];
    [v55 setUserInput:*(void *)(a1 + 32)];
    [v55 setPlacement:3];
    objc_msgSend(v55, "setScore:", 9, 0);
    uint64_t v35 = [v57 data];
    id v36 = [v35 copy];
    [v55 setAttributeData:v36];

    [v55 setSectionBundleIdentifier:PRSRankingCalculatorBundleString];
    CFNullRef v37 = +[NSBundle bundleForClass:objc_opt_class()];
    if (v53) {
      [v37 localizedStringForKey:@"CALCULATION_SECTION_TITLE" value:&stru_100094088 table:@"SpotlightServices"];
    }
    else {
    CFNullRef v38 = [v37 localizedStringForKey:@"CONVERSION_SECTION_TITLE" value:&stru_100094088 table:@"SpotlightServices"];
    }
    [v55 setSectionHeader:v38];
    if (v53) {
      CFStringRef v52 = @"SPCalculatorDatastore direct calculation";
    }
    else {
      CFStringRef v52 = @"SPCalculatorDatastore direct conversion";
    }

    [v55 setTopHit:SSSetTopHitWithReasonString()];
    id v39 = objc_alloc_init((Class)SFMutableResultSection);
    CFNullRef v40 = v39;
    if (v53) {
      CFStringRef v41 = @"com.apple.calculation";
    }
    else {
      CFStringRef v41 = @"com.apple.conversion";
    }
    objc_msgSend(v39, "setBundleIdentifier:", v41, v52);
    CFNullRef v42 = [v55 sectionHeader];
    [v40 setTitle:v42];

    id v62 = v55;
    uint64_t v43 = +[NSArray arrayWithObjects:&v62 count:1];
    [v40 setResults:v43];

    uint64_t v61 = v40;
    uint64_t v44 = +[NSArray arrayWithObjects:&v61 count:1];
    uint64_t v45 = *(void *)(*(void *)(a1 + 56) + 8);
    CFNullRef v46 = *(void **)(v45 + 40);
    *(void *)(v45 + 40) = v44;

LABEL_31:
  }
  uint64_t v47 = SPLogForSPLogCategoryDefault();
  os_log_type_t v48 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v47, v48))
  {
    CFStringRef v49 = @"unit converter";
    if (v53) {
      CFStringRef v49 = @"calculator";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v64 = v49;
    _os_log_impl((void *)&_mh_execute_header, v47, v48, "#query calculation finish %@", buf, 0xCu);
  }

  id v50 = SPLogForSPLogCategoryTelemetry();
  unsigned int v51 = [*(id *)(a1 + 48) externalID];
  if (v51 && os_signpost_enabled(v50))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_INTERVAL_END, v51, "calculationSpotlightLatency", " enableTelemetry=YES ", buf, 2u);
  }

LABEL_4:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v7 = v58;
  *(_OWORD *)(v7 + 16) = v59;
  *(void *)(v7 + 32) = v60;
}

void sub_1000306D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, long long a19, long long a20,uint64_t a21)
{
  sub_1000067B0((uint64_t)&a13);
  long long v23 = a20;
  *(_OWORD *)uint64_t v21 = a19;
  *(_OWORD *)(v21 + 16) = v23;
  *(void *)(v21 + 32) = a21;
  _Unwind_Resume(a1);
}

__n128 sub_100030748(uint64_t a1)
{
  uint64_t v2 = si_tracing_current_span();
  __n128 v26 = *(__n128 *)v2;
  long long v27 = *(_OWORD *)(v2 + 16);
  uint64_t v28 = *(void *)(v2 + 32);
  uint64_t v3 = *(void *)(a1 + 112);
  long long v4 = *(_OWORD *)(a1 + 96);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v2 + 16) = v4;
  *(void *)(v2 + 32) = v3;
  long long v23 = *(_OWORD *)(a1 + 80);
  long long v24 = *(_OWORD *)(a1 + 96);
  uint64_t v25 = *(void *)(a1 + 112);
  uint64_t v5 = *(void *)v2;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v7 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v5;
  *(void *)(v2 + _Block_object_dispose(&STACK[0x378], 8) = spanid;
  *(void *)(v2 + 16) = v7;
  *(unsigned char *)(v2 + 2_Block_object_dispose(&STACK[0x378], 8) = 102;
  *(void *)(v2 + 32) = "SPCalculationDatastore completion";
  si_tracing_log_span_begin();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  unint64_t v9 = sub_1000190D4(WeakRetained, "finished", "calculation", *(void *)(a1 + 120));
  uint64_t v10 = SPLogForSPLogCategoryDefault();
  os_log_type_t v11 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (id)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v30 = v12;
    __int16 v31 = 1024;
    LODWORD(v32) = qos_class_self();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "QOS %@ storeCompletedSearch: %d", buf, 0x12u);
  }
  objc_msgSend(WeakRetained, "storeCompletedSearch:withSections:", *(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v23, v24, v25);
  id v13 = SPLogForSPLogCategoryDefault();
  os_log_type_t v14 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v13, v14))
  {
    CFNullRef v15 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v30 = v15;
    __int16 v31 = 2048;
    double v32 = (double)v9 / 1000000000.0;
    id v16 = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "- Datastore %@ time %g canceled", buf, 0x16u);
  }
  ADClientAddValueForScalarKey();
  [WeakRetained externalID];
  kdebug_trace();
  id v17 = [objc_alloc((Class)SFEndLocalSearchFeedback) initWithStartSearch:*(void *)(a1 + 48)];
  CFNullRef v18 = +[SPFeedbackProxy sharedProxy];
  id v19 = [*(id *)(a1 + 56) queryIdent];
  CFNullRef v20 = [*(id *)(a1 + 56) connection];
  uint64_t v21 = [v20 bundleID];
  [v18 sendFeedbackType:6 feedback:v17 queryId:v19 clientID:v21];

  si_tracing_log_span_end();
  __n128 result = v26;
  *(__n128 *)uint64_t v2 = v26;
  *(_OWORD *)(v2 + 16) = v27;
  *(void *)(v2 + 32) = v28;
  return result;
}

void sub_100030A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long a15, long long a16, uint64_t a17)
{
  sub_1000067B0((uint64_t)&a9);
  long long v19 = a16;
  *(_OWORD *)uint64_t v17 = a15;
  *(_OWORD *)(v17 + 16) = v19;
  *(void *)(v17 + 32) = a17;
  _Unwind_Resume(a1);
}

void sub_100030EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

__n128 sub_100030EC0(uint64_t a1)
{
  uint64_t v2 = si_tracing_current_span();
  __n128 v28 = *(__n128 *)v2;
  long long v29 = *(_OWORD *)(v2 + 16);
  uint64_t v30 = *(void *)(v2 + 32);
  uint64_t v3 = *(void *)v2;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v5 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + _Block_object_dispose(&STACK[0x378], 8) = spanid;
  *(void *)(v2 + 16) = v5;
  *(unsigned char *)(v2 + 2_Block_object_dispose(&STACK[0x378], 8) = 102;
  *(void *)(v2 + 32) = "SPCoreSpotlightQueryTask do cancel";
  si_tracing_log_span_begin();
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 26) || *(unsigned char *)(v6 + 24)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)(v6 + 27))
  {
    uint64_t v7 = [(id)v6 timeoutTimer];
    uint64_t v8 = v7;
    if (v7)
    {
      dispatch_source_cancel(v7);
      [*(id *)(a1 + 32) setTimeoutTimer:0];
    }

    uint64_t v6 = *(void *)(a1 + 32);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v6 + 56));
  CFStringRef v37 = @"queryID";
  uint64_t v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [WeakRetained queryID]);
  CFNullRef v38 = v10;
  os_log_type_t v11 = +[NSDictionary dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  SSQueryParserCancelWithReferenceDict();

  id v12 = [WeakRetained queryContext];
  id v13 = [v12 queryKind];
  os_log_type_t v14 = [WeakRetained connection];
  id v15 = [v14 bundleID];
  if (qword_1000A9020 != -1) {
    dispatch_once(&qword_1000A9020, &stru_100093820);
  }
  if (byte_1000A9019) {
    goto LABEL_10;
  }
  if (!byte_1000A9018)
  {

LABEL_30:
    id v12 = +[SPFeedbackProxy sharedProxy];
    uint64_t v26 = *(void *)(a1 + 40);
    id v27 = [WeakRetained queryIdent];
    os_log_type_t v14 = [WeakRetained connection];
    id v15 = [v14 bundleID];
    [v12 sendFeedbackType:6 feedback:v26 queryId:v27 clientID:v15];
    goto LABEL_11;
  }
  if (([v15 hasPrefix:@"com.apple.omniSearch"] & 1) == 0
    && ([v15 hasPrefix:@"com.apple.intelligenceflow"] & 1) == 0)
  {
    unsigned __int8 v24 = [v15 hasPrefix:@"com.apple.ondeviceeval"];
    if (v13 == (id)12) {
      char v25 = 1;
    }
    else {
      char v25 = v24;
    }

    if (v25) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_10:

LABEL_11:
LABEL_12:
  *(unsigned char *)(*(void *)(a1 + 32) + 26) = 1;
  id v16 = SPLogForSPLogCategoryDefault();
  os_log_type_t v17 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v16, v17))
  {
    qos_class_t v18 = qos_class_self();
    id v19 = [*(id *)(*(void *)(a1 + 32) + 32) queryID];
    [*(id *)(*(void *)(a1 + 32) + 32) queryID];
    *(_DWORD *)buf = 67109632;
    qos_class_t v32 = v18;
    __int16 v33 = 2048;
    id v34 = v19;
    __int16 v35 = 2048;
    uint64_t v36 = v20;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Cancelling querytask at QoS:%d for job id:(%ld,%ld)", buf, 0x1Cu);
  }

  uint64_t v21 = SPLogForSPLogCategoryTelemetry();
  os_log_type_t v22 = (char *)[*(id *)(*(void *)(a1 + 32) + 32) queryID];
  if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, (os_signpost_id_t)v22, "coreSpotlightCancel", " enableTelemetry=YES ", buf, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 32) cancel];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 56), 0);
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 24)) {
    atomic_fetch_add(&dword_1000A8EE0, 0xFFFFFFFF);
  }

LABEL_20:
  si_tracing_log_span_end();
  __n128 result = v28;
  *(__n128 *)uint64_t v2 = v28;
  *(_OWORD *)(v2 + 16) = v29;
  *(void *)(v2 + 32) = v30;
  return result;
}

void sub_100031304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100031760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100031788(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  id v6 = +[SPFeedbackProxy sharedProxy];
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) queryIdent];
  long long v4 = [*(id *)(a1 + 48) connection];
  uint64_t v5 = [v4 bundleID];
  [v6 sendFeedbackType:5 feedback:v2 queryId:v3 clientID:v5];
}

void sub_100031A68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

__n128 sub_100031A90(uint64_t a1)
{
  uint64_t v2 = si_tracing_current_span();
  __n128 v10 = *(__n128 *)v2;
  long long v11 = *(_OWORD *)(v2 + 16);
  uint64_t v12 = *(void *)(v2 + 32);
  uint64_t v3 = *(void *)v2;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v5 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + _Block_object_dispose(&STACK[0x378], 8) = spanid;
  *(void *)(v2 + 16) = v5;
  *(unsigned char *)(v2 + 2_Block_object_dispose(&STACK[0x378], 8) = 102;
  *(void *)(v2 + 32) = "SPCoreSpotlightDatastore send completions";
  si_tracing_log_span_begin();
  id v6 = SPLogForSPLogCategoryDefault();
  os_log_type_t v7 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Sending completions on %@.", buf, 0xCu);
  }

  [*(id *)(a1 + 32) sendCompletions:*(void *)(a1 + 40)];
  si_tracing_log_span_end();
  __n128 result = v10;
  *(__n128 *)uint64_t v2 = v10;
  *(_OWORD *)(v2 + 16) = v11;
  *(void *)(v2 + 32) = v12;
  return result;
}

void sub_100031BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100031E88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

id sub_100031EB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) storeSearchProgress:*(void *)(a1 + 40) withSections:*(void *)(a1 + 48) suggestionResults:*(void *)(a1 + 56)];
}

void sub_10003235C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_100032390(uint64_t a1)
{
  uint64_t v2 = +[SPFeedbackProxy sharedProxy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) queryIdent];
  uint64_t v5 = [*(id *)(a1 + 40) connection];
  id v6 = [v5 bundleID];
  [v2 sendFeedbackType:6 feedback:v3 queryId:v4 clientID:v6];

  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void **)(v7 + 8);
  *(void *)(v7 + _Block_object_dispose(&STACK[0x378], 8) = 0;
}

double sub_10003243C(uint64_t a1)
{
  uint64_t v2 = si_tracing_current_span();
  long long v3 = *(_OWORD *)(v2 + 16);
  long long v16 = *(_OWORD *)v2;
  long long v17 = v3;
  uint64_t v18 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)v2;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v6 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v4;
  *(void *)(v2 + _Block_object_dispose(&STACK[0x378], 8) = spanid;
  *(void *)(v2 + 16) = v6;
  *(unsigned char *)(v2 + 2_Block_object_dispose(&STACK[0x378], 8) = 102;
  *(void *)(v2 + 32) = "SPCoreSpotlightDatastore finish query";
  si_tracing_log_span_begin();
  [*(id *)(a1 + 32) storeCompletedSearch:*(void *)(a1 + 40) withSections:*(void *)(a1 + 48) suggestionResults:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) externalID];
  kdebug_trace();
  uint64_t v7 = SPLogForSPLogCategoryTelemetry();
  unsigned int v8 = [*(id *)(a1 + 32) externalID];
  if (v8 && os_signpost_enabled(v7))
  {
    *(_WORD *)id v15 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, v8, "coreSpotlightLatency", " enableTelemetry=YES ", v15, 2u);
  }

  unint64_t v9 = SPLogForSPLogCategoryRanking();
  unsigned int v10 = [*(id *)(a1 + 32) externalID];
  if (v10 && os_signpost_enabled(v9))
  {
    *(_WORD *)id v15 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v10, "coreSpotlightRankingLatency", (const char *)&unk_10007BB1B, v15, 2u);
  }

  long long v11 = SPLogForSPLogCategoryTelemetry();
  unsigned int v12 = [*(id *)(a1 + 32) externalID];
  if (v12 && os_signpost_enabled(v11))
  {
    *(_WORD *)id v15 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, v12, "coreSpotlightFinish", " enableTelemetry=YES ", v15, 2u);
  }

  si_tracing_log_span_end();
  double result = *(double *)&v16;
  long long v14 = v17;
  *(_OWORD *)uint64_t v2 = v16;
  *(_OWORD *)(v2 + 16) = v14;
  *(void *)(v2 + 32) = v18;
  return result;
}

void sub_100032648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

int64_t sub_100032DE0(id a1, SPTopHitResult *a2, SPTopHitResult *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  uint64_t v6 = [(SPTopHitResult *)v4 bundleID];
  uint64_t v7 = [(SPTopHitResult *)v5 bundleID];
  id v8 = [v6 compare:v7];

  if (!v8)
  {
    unint64_t v9 = [(SPTopHitResult *)v4 dataclass];
    unsigned int v10 = [(SPTopHitResult *)v5 dataclass];
    id v8 = [v9 compare:v10];
  }
  return (int64_t)v8;
}

uint64_t sub_100033130(double *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = (unint64_t)[v5 score];
  unint64_t v9 = v8;
  unint64_t v10 = (unint64_t)[v6 score];
  uint64_t v12 = *((void *)a1 + 4);
  uint64_t v13 = *((void *)a1 + 5);
  if (v12 & v7 | v13 & v9)
  {
    v9 &= *((void *)a1 + 7);
    v7 &= *((void *)a1 + 6);
  }
  if (v12 & v10 | v13 & v11)
  {
    v11 &= *((void *)a1 + 7);
    v10 &= *((void *)a1 + 6);
  }
  if (__PAIR128__(v11, v10) < __PAIR128__(v9, v7)) {
    goto LABEL_8;
  }
  if (__PAIR128__(v9, v7) < __PAIR128__(v11, v10))
  {
LABEL_10:
    uint64_t v22 = 1;
    goto LABEL_11;
  }
  double v14 = a1[8];
  id v15 = [v5 interestingDate];
  [v15 timeIntervalSinceReferenceDate];
  double v17 = vabdd_f64(v14, v16);

  double v18 = a1[8];
  id v19 = [v6 interestingDate];
  [v19 timeIntervalSinceReferenceDate];
  double v21 = vabdd_f64(v18, v20);

  if (v17 >= v21)
  {
    if (v17 <= v21)
    {
      uint64_t v22 = 0;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_8:
  uint64_t v22 = -1;
LABEL_11:

  return v22;
}

uint64_t sub_1000339B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [v5 rankingItem];
  unint64_t v8 = [v6 rankingItem];
  uint64_t v9 = (uint64_t)[v7 compare:v8 currentTime:*(double *)(a1 + 32)];

  if (!v9)
  {
    id v10 = [v5 score];
    unint64_t v12 = v11;
    id v13 = [v6 score];
    if (__PAIR128__(v14, (unint64_t)v13) >= __PAIR128__(v12, (unint64_t)v10))
    {
      if (__PAIR128__(v12, (unint64_t)v10) >= __PAIR128__(v14, (unint64_t)v13))
      {
        double v15 = *(double *)(a1 + 40);
        double v16 = [v5 interestingDate];
        [v16 timeIntervalSinceReferenceDate];
        double v18 = vabdd_f64(v15, v17);

        double v19 = *(double *)(a1 + 40);
        double v20 = [v6 interestingDate];
        [v20 timeIntervalSinceReferenceDate];
        double v22 = vabdd_f64(v19, v21);

        if (v18 < v22) {
          goto LABEL_5;
        }
        if (v18 <= v22)
        {
          uint64_t v9 = 0;
          goto LABEL_8;
        }
      }
      uint64_t v9 = -1;
      goto LABEL_8;
    }
LABEL_5:
    uint64_t v9 = 1;
  }
LABEL_8:

  return -v9;
}

id sub_100034500(unsigned char *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1[40])
  {
    id v7 = +[SSPommesRanker MailL1Compare:v5 to:v6];
  }
  else if (a1[41])
  {
    id v7 = +[SSPommesPhotosRanker PhotosL1Compare:v5 to:v6];
  }
  else if (a1[42])
  {
    id v7 = +[SSPommesRanker BaseL1Compare:v5 to:v6];
  }
  else
  {
    id v7 = (id)SSSpotlightL1Compare();
  }
  id v8 = v7;

  return v8;
}

uint64_t sub_1000345BC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v5 embeddingSimilarity];
  float v8 = v7;
  [v6 embeddingSimilarity];
  if (v8 <= v9)
  {
    if (v8 < v9) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    uint64_t v10 = -1;
  }

  return v10;
}

uint64_t sub_100034658(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v5 pommesL1Score];
  float v8 = v7;
  float v9 = denseScoreWeight;
  [v5 embeddingSimilarity];
  float v11 = v8 + (float)(v9 * v10);
  [v6 pommesL1Score];
  float v13 = v12;
  [v6 embeddingSimilarity];
  float v15 = v13 + (float)(v9 * v14);
  if (v11 <= v15)
  {
    if (v11 < v15) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
  else
  {
    uint64_t v16 = -1;
  }

  return v16;
}

uint64_t sub_100034724(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:@"item"];
  float v7 = [v5 objectForKeyedSubscript:@"item"];

  uint64_t v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
  return v8;
}

uint64_t sub_1000347B4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:@"item"];
  float v7 = [v5 objectForKeyedSubscript:@"item"];

  uint64_t v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
  return v8;
}

uint64_t sub_100034844(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a3;
  id v6 = [a2 objectForKeyedSubscript:@"item"];
  float v7 = [v5 objectForKeyedSubscript:@"item"];

  uint64_t v8 = (*(uint64_t (**)(uint64_t, void *, void *))(v4 + 16))(v4, v6, v7);
  return v8;
}

void sub_1000348D4(uint64_t a1, void *a2)
{
  long long v3 = [a2 objectForKeyedSubscript:@"index"];
  uint64_t v4 = [v3 unsignedIntValue];

  id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v4];
  [*(id *)(a1 + 40) addObject:v5];
}

void sub_10003495C(uint64_t a1, void *a2)
{
  long long v3 = [a2 objectForKeyedSubscript:@"index"];
  uint64_t v4 = [v3 unsignedIntValue];

  id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v4];
  [*(id *)(a1 + 40) addObject:v5];
}

void sub_1000349E4(uint64_t a1, void *a2)
{
  long long v3 = [a2 objectForKeyedSubscript:@"index"];
  uint64_t v4 = [v3 unsignedIntValue];

  id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v4];
  [*(id *)(a1 + 40) addObject:v5];
}

void sub_100034DE8(id a1)
{
  qword_1000A8F00 = objc_alloc_init(SPCoreSpotlightDatastore);

  _objc_release_x1();
}

void sub_1000353AC()
{
  pid_t v0 = +[SDController getMeContactIdentifier];
  uint64_t v1 = +[SDController getMeEmailAddresses];
  if (v0)
  {
    if (([(id)qword_1000A8EE8 isEqualToString:v0] & 1) == 0)
    {
      objc_storeStrong((id *)&qword_1000A8EE8, v0);
      uint64_t v2 = +[NSArray arrayWithArray:v1];
      long long v3 = (void *)qword_1000A8EF0;
      qword_1000A8EF0 = v2;

      [(id)qword_1000A8F48 setObject:qword_1000A8EE8 forKey:@"meContactIdentifier"];
      [(id)qword_1000A8F48 setObject:qword_1000A8EF0 forKey:@"meEmailAddresses"];
    }
    id v4 = 0;
  }
  else
  {
    id v5 = objc_alloc((Class)CNContactStore);
    id v6 = objc_opt_new();
    id v4 = [v5 initWithConfiguration:v6];

    v30[0] = CNContactIdentifierKey;
    v30[1] = CNContactGivenNameKey;
    v30[2] = CNContactMiddleNameKey;
    v30[3] = CNContactFamilyNameKey;
    v30[4] = CNContactEmailAddressesKey;
    v30[5] = CNContactPhoneNumbersKey;
    float v7 = +[NSArray arrayWithObjects:v30 count:6];
    id v29 = 0;
    uint64_t v8 = objc_msgSend(v4, "_ios_meContactWithKeysToFetch:error:", v7, &v29);
    id v9 = v29;

    if (v9)
    {
      float v10 = SPLogForSPLogCategoryQuery();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000657BC(v9);
      }
    }
    else
    {
      float v11 = objc_opt_new();
      float v12 = [v8 emailAddresses];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10003579C;
      v27[3] = &unk_100092688;
      float v10 = v11;
      __n128 v28 = v10;
      [v12 enumerateObjectsUsingBlock:v27];

      float v13 = [v8 identifier];
      unsigned __int8 v14 = [v13 isEqualToString:qword_1000A8EE8];

      if ((v14 & 1) == 0)
      {
        uint64_t v15 = [v8 identifier];
        uint64_t v16 = (void *)qword_1000A8EE8;
        qword_1000A8EE8 = v15;

        id v17 = [v10 copy];
        double v18 = (void *)qword_1000A8EF0;
        qword_1000A8EF0 = (uint64_t)v17;

        [(id)qword_1000A8F48 setObject:qword_1000A8EE8 forKey:@"meContactIdentifier"];
        [(id)qword_1000A8F48 setObject:qword_1000A8EF0 forKey:@"meEmailAddresses"];
      }
    }
  }
  if (qword_1000A8EE8) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = -1;
  }
  [(id)qword_1000A8F48 setInteger:v19 forKey:@"meContactExists"];
  [(id)objc_opt_class() updatePhoneFavorites];
  if (!qword_1000A8F68)
  {
    uint64_t v20 = [(id)qword_1000A8F48 objectForKey:@"mailVips"];
    double v21 = (void *)qword_1000A8F68;
    qword_1000A8F68 = v20;
  }
  id v22 = objc_alloc((Class)STConversation);
  uint64_t v23 = PRSRankingMessagesBundleString;
  unsigned __int8 v24 = v4;
  if (!v4) {
    unsigned __int8 v24 = objc_opt_new();
  }
  id v25 = [v22 initWithBundleIdentifier:v23 contactStore:v24];
  uint64_t v26 = (void *)qword_1000A8F70;
  qword_1000A8F70 = (uint64_t)v25;

  if (!v4) {
}
  }

void sub_10003579C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 value];
  [v2 addObject:v3];
}

void sub_100035974(uint64_t a1, void *a2)
{
  id v2 = a2;
  [(id)objc_opt_class() _handleRemoteProxyError:v2];
}

void sub_1000359C8(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if (v5)
  {
    id v6 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000658B8();
    }
  }
  else
  {
    if ((unint64_t)[v4 count] >= 0x65)
    {
      uint64_t v7 = objc_msgSend(v4, "subarrayWithRange:", 0, 100);

      id v4 = (id)v7;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A8F80);
    objc_storeStrong((id *)&qword_1000A8F68, v4);
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A8F80);
    id v6 = SPLogForSPLogCategoryDefault();
    os_log_type_t v8 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v6, v8))
    {
      *(_WORD *)float v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v8, "Finish Fetching VIPs", v10, 2u);
    }
  }

  [(id)qword_1000A8F48 setObject:v4 forKey:@"mailVips"];
  id v9 = self;
}

void sub_100035E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100035E28(id a1)
{
  uint64_t v1 = si_tracing_current_span();
  long long v8 = *(_OWORD *)v1;
  long long v10 = *(_OWORD *)(v1 + 16);
  uint64_t v12 = *(void *)(v1 + 32);
  uint64_t v2 = *(void *)v1;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v4 = *(void *)(v1 + 8);
  *(void *)uint64_t v1 = v2;
  *(void *)(v1 + _Block_object_dispose(&STACK[0x378], 8) = spanid;
  *(void *)(v1 + 16) = v4;
  *(unsigned char *)(v1 + 2_Block_object_dispose(&STACK[0x378], 8) = 102;
  *(void *)(v1 + 32) = "SPCoreSpotlightDatastore do preheat";
  si_tracing_log_span_begin();
  CFStringRef v15 = @"ExtendedDeviceLockState";
  CFBooleanRef v16 = kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  if (MKBGetDeviceLockState() - 1 > 1)
  {
    id v6 = 0;
  }
  else
  {
    NSFileProtectionType v14 = NSFileProtectionCompleteUntilFirstUserAuthentication;
    id v6 = +[NSArray arrayWithObjects:&v14 count:1];
  }
  uint64_t v7 = +[SSRankingFeedbackHandler sharedInstance];
  [v7 fetchBundleRenderAndEngagementInfo:v6];

  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v1 = v9;
  *(_OWORD *)(v1 + 16) = v11;
  *(void *)(v1 + 32) = v13;
}

void sub_100035FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100036450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100036490(id a1)
{
  uint64_t v1 = +[SRResourcesManager sharedResourcesManager];
  [v1 loadAllParameters];

  if (!qword_1000A8F10)
  {
    uint64_t v2 = +[SRResourcesManager sharedResourcesManager];
    uint64_t v3 = [v2 resourcesForClient:@"Spotlight" options:&off_1000990A0];
    uint64_t v4 = (void *)qword_1000A8F10;
    qword_1000A8F10 = v3;

    SSDefaultsSetResources();
  }

  +[SSRankingManager reloadRankingParametersFromTrial];
}

void sub_100036534(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  id v6 = 0;
  uint64_t v3 = [v2 loadDockAppListWithError:&v6];
  id v4 = v6;
  if (v3) {
    +[PRSRankingItemRanker setDockApps:v3];
  }
  if (v4)
  {
    id v5 = SPLogForSPLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10006592C();
    }
  }
  if (_os_feature_enabled_impl()) {
    *(unsigned char *)(*(void *)(a1 + 32) + 56) = 1;
  }
}

id sub_100036610(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateMailVIPList];
}

void sub_1000368B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1000369C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100036D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_100036E30(id a1)
{
  v4[0] = PRSRankingSafariBundleString;
  v4[1] = PRSRankingAppsBundleString;
  void v4[2] = PRSRankingContactsBundleString;
  v4[3] = PRSRankingSettingsBundleString;
  v4[4] = PRSRankingNotesBundleString;
  v4[5] = PRSRankingFilesBundleString;
  v4[6] = PRSRankingLocalFilesBundleString;
  v4[7] = PRSRankingDocumentsAppBundleString;
  v4[8] = PRSRankingMailBundleString;
  v4[9] = PRSRankingCalendarBundleString;
  v4[10] = PRSRankingRemindersBundleString;
  v4[11] = PRSRankingShortcutsBundleString;
  v4[12] = PRSRankingDictionaryBundleString;
  v4[13] = PRSRankingTipsBundleString;
  v4[14] = PRSRankingBooksBundleString;
  v4[15] = PRSRankingMusicBundleString;
  uint8_t v4[16] = PRSRankingPodcastsBundleString;
  v4[17] = PRSRankingPeoplePurchaseRequestBundleString;
  v4[18] = PRSRankingPeopleScreenTimeRequestBundleString;
  v4[19] = PRSRankingEventsBundleString;
  uint64_t v1 = +[NSArray arrayWithObjects:v4 count:20];
  uint64_t v2 = +[NSSet setWithArray:v1];
  uint64_t v3 = (void *)qword_1000A8FA8;
  qword_1000A8FA8 = v2;
}

void sub_100037D94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void *__cdecl sub_100037E44(id a1, void *a2, __CFString *a3)
{
  id v4 = a3;
  if (([(__CFString *)v4 isEqualToString:@"_ModifiedHostName_"] & 1) != 0
    || [(__CFString *)v4 isEqualToString:@"kMDItemDisplayName"])
  {
    CFTypeRef v5 = CFRetain(a2);
  }
  else
  {
    CFTypeRef v5 = 0;
  }

  return (void *)v5;
}

void sub_100038224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_100038B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
}

void sub_100039480(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
}

void sub_100039674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10003AA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

uint64_t sub_10003AAE4(uint64_t a1)
{
  uint64_t v1 = (void *)qword_1000A8FB8;
  if (*(unsigned char *)(a1 + 32))
  {
    qword_1000A8FB8 = (uint64_t)&off_1000991B8;

    uint64_t v2 = (_UNKNOWN **)(id)qword_1000A8FB8;
  }
  else
  {
    qword_1000A8FB8 = (uint64_t)&off_1000991D0;

    uint64_t v2 = &off_1000991E8;
  }
  qword_1000A8FC0 = (uint64_t)v2;

  return _objc_release_x1();
}

uint64_t _checkMatch(char a1, void *a2, void *a3, void *a4, void *a5, int a6, id *a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  if ((a1 & 1) == 0
    && (([v13 isEqualToString:PRSRankingMessagesBundleString] & 1) != 0
     || [v13 isEqualToString:PRSRankingMailBundleString])
    && [v14 hasPrefix:@"en"])
  {
    id v17 = [v15 lowercaseString];
    double v18 = +[NSCharacterSet whitespaceCharacterSet];
    uint64_t v19 = [v17 stringByTrimmingCharactersInSet:v18];

    uint64_t v43 = v19;
    if (![v19 hasPrefix:@"from "]
      || (uint64_t v20 = (char *)[v17 rangeOfString:@"from "], v20 == (char *)0x7FFFFFFFFFFFFFFFLL)
      || (id v22 = &v20[v21], &v20[v21] >= [v15 length]))
    {
      id v29 = 0;
      __n128 v28 = @"false";
    }
    else
    {
      uint64_t v23 = [v15 substringFromIndex:v22];
      id v39 = [v23 componentsSeparatedByString:@" "];
      unsigned __int8 v24 = [v39 lastObject];
      CFStringRef v41 = v17;
      if ((unint64_t)[v24 length] <= 1) {
        CFStringRef v25 = &stru_100094088;
      }
      else {
        CFStringRef v25 = @"*";
      }
      if (a6) {
        CFStringRef v26 = @"(kMDItemAuthors=\"%@*\"cwdtf070 || kMDItemUserSharedReceivedSender=\"%@*\"cwdtf070) || kMDItemAuthorEmailAddresses=\"%@*\"cwdtf070");
      }
      else {
        CFStringRef v26 = @"(kMDItemAuthors=\"%@*\"cwd || kMDItemUserSharedReceivedSender=\"%@*\"cwd) || kMDItemAuthorEmailAddresses=\"%@*\"cwd");
      }
      if (a6) {
        CFStringRef v27 = @"(kMDItemAuthors=\"%@*\"cwdtf070 || kMDItemUserSharedReceivedSender=\"%@*\"cwdtf070 || kMDItemAuthorEmailAddresses=\"%@*\"cwdtf070 || kMDItemSubject=\"%@*\"cwdtf070 || kMDItemTextContent=\"%@%@\"cwdtf070)";
      }
      else {
        CFStringRef v27 = @"(kMDItemAuthors=\"%@*\"cwd || kMDItemUserSharedReceivedSender=\"%@*\"cwd || kMDItemAuthorEmailAddresses=\"%@*\"cwd || kMDItemSubject=\"%@*\"cwd || kMDItemTextContent=\"%@%@\"cwd)";
      }
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v26, v23, v23, v23);
      __n128 v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      CFStringRef v38 = v25;
      id v17 = v41;
      id v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v23, v23, v23, v15, v15, v38);
    }
    unsigned int v32 = [(__CFString *)v28 isEqualToString:@"false"];
    if ((v32 & 1) == 0)
    {
      CFNullRef v40 = +[NSString stringWithFormat:@"(%@ || %@)", v16, v28];
      CFNullRef v42 = v17;
      id v33 = *a7;
      CFNullRef v46 = v29;
      id v34 = +[NSArray arrayWithObjects:&v46 count:1];
      [v33 setObject:v34 forKey:@"queryTerms"];

      id v35 = *a7;
      uint64_t v44 = v29;
      uint64_t v45 = &off_100098B88;
      uint64_t v36 = +[NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      CFStringRef v37 = v35;
      id v17 = v42;
      [v37 setObject:v36 forKey:@"rankTerms"];

      [*a7 setObject:&__kCFBooleanTrue forKey:@"isNLQuery"];
      [*a7 setObject:&off_1000990F0 forKey:@"rankCategories"];
      [*a7 setObject:v40 forKey:@"query"];
    }
    uint64_t v30 = v32 ^ 1;
  }
  else
  {
    uint64_t v30 = 0;
  }

  return v30;
}

void sub_10003E214(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x530], 8);
  _Block_object_dispose(&STACK[0x590], 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose(&STACK[0x5B0], 8);
  _Block_object_dispose(&STACK[0x5D0], 8);
  _Block_object_dispose(&STACK[0x670], 8);
  _Block_object_dispose(&STACK[0x6A8], 8);
  sub_1000067B0((uint64_t)&STACK[0x6E0]);
  _Unwind_Resume(a1);
}

void sub_10003E4FC(id a1)
{
  PRSRankingQueryIndexDictionary();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v5 objectForKeyedSubscript:PRSRankingDisplayNameExactMatch];
  unsigned __int8 v2 = [v1 integerValue];
  uint64_t v3 = 1 << v2;
  if ((v2 & 0x40) != 0) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 1 << v2;
  }
  if ((v2 & 0x40) == 0) {
    uint64_t v3 = 0;
  }
  qword_1000A8FD0 |= v4;
  *(void *)algn_1000A8FD8 |= v3;
}

void sub_10003E58C(id a1)
{
  v3[0] = NSFileProtectionComplete;
  v3[1] = NSFileProtectionCompleteUnlessOpen;
  _DWORD v3[2] = NSFileProtectionCompleteWhenUserInactive;
  v3[3] = NSFileProtectionCompleteUntilFirstUserAuthentication;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:4];
  unsigned __int8 v2 = (void *)qword_1000A8FE8;
  qword_1000A8FE8 = v1;
}

uint64_t sub_10003E634(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003E644(uint64_t a1)
{
}

id sub_10003E650(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_10003E67C(uint64_t a1)
{
}

void sub_10003E684(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a6;
  uint64_t v10 = si_tracing_current_span();
  long long v11 = *(_OWORD *)(v10 + 16);
  long long v53 = *(_OWORD *)v10;
  long long v54 = v11;
  uint64_t v55 = *(void *)(v10 + 32);
  uint64_t v12 = *(void *)(a1 + 104);
  long long v13 = *(_OWORD *)(a1 + 88);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(v10 + 16) = v13;
  *(void *)(v10 + 32) = v12;
  id v14 = +[NSString stringWithFormat:@"SPCoreSpotlightDatastore results handler (%@)", v9];
  long long v15 = *(_OWORD *)(v10 + 16);
  long long v50 = *(_OWORD *)v10;
  long long v51 = v15;
  uint64_t v52 = *(void *)(v10 + 32);
  uint64_t v16 = *(void *)v10;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v18 = *(void *)(v10 + 8);
  int v19 = *(_DWORD *)(v10 + 24);
  id v20 = v14;
  id v21 = [v20 UTF8String];
  *(void *)uint64_t v10 = v16;
  *(void *)(v10 + _Block_object_dispose(&STACK[0x378], 8) = spanid;
  *(void *)(v10 + 16) = v18;
  *(_DWORD *)(v10 + 24) = v19;
  *(unsigned char *)(v10 + 2_Block_object_dispose(&STACK[0x378], 8) = 102;
  *(void *)(v10 + 32) = v21;
  si_tracing_log_span_begin();
  id v22 = SPLogForSPLogCategoryDefault();
  os_log_type_t v23 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v22, v23))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v57) = qos_class_self();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "QOS resultsHandler: %d", buf, 8u);
  }

  switch(a2)
  {
    case 0:
      if ([*(id *)(a1 + 32) cancelled])
      {
        unsigned int v32 = SPLogForSPLogCategoryQuery();
        os_log_type_t v33 = 2 * (gSPLogDebugAsDefault == 0);
        if (!os_log_type_enabled(v32, v33)) {
          goto LABEL_38;
        }
        *(_WORD *)buf = 0;
        id v34 = "#query corespotlight cancel 2";
        goto LABEL_37;
      }
      goto LABEL_39;
    case 1:
    case 2:
      if ([v9 isEqualToString:@"Priority"]
        && ([*(id *)(a1 + 32) isPhotosSearch] & 1) == 0)
      {
        uint64_t v24 = SSPriorityIndexDelayMilliseconds();
        double Current = CFAbsoluteTimeGetCurrent();
        [*(id *)(a1 + 32) storeStartTime];
        double v26 = (double)v24 / 1000.0;
        double v28 = Current - v27;
        if (v28 >= v26)
        {
          id v29 = [objc_alloc((Class)NSError) initWithDomain:@"MainCSIndexTimedOut" code:95208 userInfo:0];
          (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();
        }
        else
        {
          [*(id *)(a1 + 40) setPriorityIndexFinishedInTime:1];
          id v29 = [*(id *)(a1 + 40) timeoutTimer];
          double v30 = v26 - v28;
          if (v29)
          {
            dispatch_time_t v31 = dispatch_time(0, (uint64_t)(v30 * 1000000000.0));
            dispatch_source_set_timer(v29, v31, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(v26 / 5.0 * 1000000000.0));
          }
          else
          {
            CFNullRef v42 = +[SPCoreSpotlightIndexer sharedInstance];
            uint64_t v43 = [v42 indexQueue];

            if (v43)
            {
              id v29 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v43);
              [*(id *)(a1 + 40) setTimeoutTimer:v29];
              handler[0] = _NSConcreteStackBlock;
              handler[1] = 3221225472;
              handler[2] = sub_10003EE2C;
              handler[3] = &unk_100093470;
              handler[4] = *(void *)(a1 + 48);
              dispatch_source_set_event_handler(v29, handler);
              dispatch_time_t v44 = dispatch_time(0, (uint64_t)(v30 * 1000000000.0));
              dispatch_source_set_timer(v29, v44, 0xFFFFFFFFFFFFFFFFLL, (uint64_t)(v26 / 5.0 * 1000000000.0));
              dispatch_activate(v29);
            }
            else
            {
              uint64_t v45 = SPLogForSPLogCategoryDefault();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT)) {
                sub_100065A88(v45);
              }

              id v46 = [objc_alloc((Class)NSError) initWithDomain:@"MainCSIndexTimedOut" code:95208 userInfo:0];
              (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) + 16))();

              id v29 = 0;
            }
          }
        }
      }
      goto LABEL_34;
    case 8:
      if ([*(id *)(a1 + 32) cancelled])
      {
        unsigned int v32 = SPLogForSPLogCategoryQuery();
        os_log_type_t v33 = 2 * (gSPLogDebugAsDefault == 0);
        if (os_log_type_enabled(v32, v33))
        {
          *(_WORD *)buf = 0;
          id v34 = "#query corespotlight cancel completions";
LABEL_37:
          _os_log_impl((void *)&_mh_execute_header, v32, v33, v34, buf, 2u);
        }
LABEL_38:

        [*(id *)(a1 + 40) finish];
      }
      else
      {
        id v35 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int ByteVectorCount = _MDPlistBytesGetByteVectorCount();
          *(_DWORD *)buf = 134217984;
          uint64_t v57 = ByteVectorCount;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "CoreSpotlight got completions bytes %lu", buf, 0xCu);
        }

        if (a5)
        {
          uint64_t ByteVector = _MDPlistBytesGetByteVector();
          +[NSData dataWithBytes:ByteVector length:_MDPlistBytesGetByteVectorCount()];
        }
        else
        {
          +[NSData data];
        CFStringRef v38 = };
        os_unfair_lock_lock(&stru_1000A8FF8);
        BOOL v39 = *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
           || _MDPlistBytesGetByteVectorCount()
           || [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) count] != 0;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v39;
        CFNullRef v40 = [*(id *)(a1 + 32) queryContext];
        CFStringRef v41 = +[SSSuggestionResultBuilder buildResultsWithCompletionsData:v38 queryContext:v40];

        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObjectsFromArray:v41];
        os_unfair_lock_unlock(&stru_1000A8FF8);
      }
LABEL_39:
      si_tracing_log_span_end();
      long long v47 = v51;
      *(_OWORD *)uint64_t v10 = v50;
      *(_OWORD *)(v10 + 16) = v47;
      *(void *)(v10 + 32) = v52;

      long long v48 = v54;
      *(_OWORD *)uint64_t v10 = v53;
      *(_OWORD *)(v10 + 16) = v48;
      *(void *)(v10 + 32) = v55;

      return;
    case 9:
      [*(id *)(a1 + 32) addMatchInfo:a5];
      goto LABEL_39;
    default:
LABEL_34:
      if (![*(id *)(a1 + 32) cancelled]) {
        goto LABEL_39;
      }
      unsigned int v32 = SPLogForSPLogCategoryQuery();
      os_log_type_t v33 = 2 * (gSPLogDebugAsDefault == 0);
      if (!os_log_type_enabled(v32, v33)) {
        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      id v34 = "#query corespotlight cancel 1";
      goto LABEL_37;
  }
}

void sub_10003ED78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,long long a21,long long a22,uint64_t a23)
{
  sub_1000067B0((uint64_t)&a15);
  long long v25 = a22;
  *(_OWORD *)uint64_t v23 = a21;
  *(_OWORD *)(v23 + 16) = v25;
  *(void *)(v23 + 32) = a23;
  _Unwind_Resume(a1);
}

void sub_10003EE2C(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSError) initWithDomain:@"MainCSIndexTimedOut" code:95208 userInfo:0];
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
}

void *sub_10003EEAC(uint64_t a1, int a2, unint64_t a3, size_t a4, unint64_t a5, uint64_t a6)
{
  uint64_t v12 = si_tracing_current_span();
  long long v13 = *(_OWORD *)(v12 + 16);
  long long v122 = *(_OWORD *)v12;
  long long v123 = v13;
  uint64_t v124 = *(void *)(v12 + 32);
  uint64_t v14 = *(void *)(a1 + 96);
  long long v15 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)uint64_t v12 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v12 + 16) = v15;
  *(void *)(v12 + 32) = v14;
  unint64_t v17 = HIDWORD(a3);
  switch(a2)
  {
    case 0:
      uint64_t v18 = malloc_type_malloc(0x28uLL, 0x1020040C9F8C70BuLL);
      *uint64_t v18 = atomic_fetch_add(&qword_1000A9000, 1uLL);
      v18[1] = a6;
      *((_DWORD *)v18 + 4) = _SIProtectionClass();
      *((unsigned char *)v18 + 20) = _SIPriority();
      v18[3] = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
      v18[4] = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
      goto LABEL_94;
    case 1:
      CFRelease(*(CFTypeRef *)(a3 + 24));
      CFRelease(*(CFTypeRef *)(a3 + 32));
      goto LABEL_92;
    case 2:
      uint64_t v18 = malloc_type_malloc(0x58uLL, 0x10E00406EEDA840uLL);
      *uint64_t v18 = a6;
      v18[1] = a3;
      *((_WORD *)v18 + 32) = 8;
      *((_OWORD *)v18 + 1) = 0u;
      *((_OWORD *)v18 + 2) = 0u;
      *((_OWORD *)v18 + 3) = 0u;
      v18[9] = malloc_type_calloc(8uLL, 8uLL, 0x2004093837F09uLL);
      v18[10] = 0;
      goto LABEL_94;
    case 3:
      uint64_t v27 = 0;
      CFTypeRef cf = 0;
      long long v119 = 0u;
      *(_OWORD *)id v120 = 0u;
      long long v28 = *(_OWORD *)(a3 + 32);
      long long v29 = *(_OWORD *)(a3 + 64);
      long long v119 = *(_OWORD *)(a3 + 48);
      *(_OWORD *)id v120 = v29;
      long long v118 = 0u;
      CFTypeRef cf = *(CFTypeRef *)(a3 + 80);
      long long v118 = v28;
      *(_OWORD *)long long v117 = *(_OWORD *)(a3 + 16);
      *(void *)(a3 + 80) = 0;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 4_Block_object_dispose(&STACK[0x378], 8) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      if ((*(_WORD *)v117 & 0x400) == 0) {
        goto LABEL_22;
      }
      uint8x8_t v30 = (uint8x8_t)vcnt_s8((int8x8_t)(*(_WORD *)v117 & 0x3FF));
      v30.i16[0] = vaddlv_u8(v30);
      uint64_t v27 = *((void *)v120[1] + v30.u32[0]);
      if (!v27 || *(_DWORD *)(v27 + 20)) {
        goto LABEL_22;
      }
      int v64 = *(_DWORD *)(v27 + 24);
      if (v64 == 16)
      {
        id v65 = [*(id *)(v27 + 32) cStringUsingEncoding:4];
      }
      else
      {
        if (v64 != 1)
        {
LABEL_22:
          dispatch_time_t v31 = SPLogForSPLogCategoryDefault();
          os_log_type_t v32 = 2 * (gSPLogDebugAsDefault == 0);
          if (os_log_type_enabled(v31, v32))
          {
            *(_DWORD *)buf = 134217984;
            *(void *)&uint8_t buf[4] = v27;
            _os_log_impl((void *)&_mh_execute_header, v31, v32, "Prune no bundle id %p", buf, 0xCu);
          }

          goto LABEL_25;
        }
        id v65 = *(id *)(v27 + 32);
      }
      if (!v65) {
        goto LABEL_22;
      }
      CFNullRef v66 = SPLogForSPLogCategoryDefault();
      os_log_type_t v67 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v66, v67))
      {
        *(_DWORD *)buf = 136315138;
        *(void *)&uint8_t buf[4] = v65;
        _os_log_impl((void *)&_mh_execute_header, v66, v67, "Got result for bundle %s", buf, 0xCu);
      }

      if ((*(void *)v117 & 0x1000000000) != 0)
      {
        uint8x8_t v68 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)v117 & 0xFFFFFFFFFLL));
        v68.i16[0] = vaddlv_u8(v68);
        uint64_t v69 = *((void *)v120[1] + v68.u32[0]);
        if (v69)
        {
          if (*(double *)(v69 + 32) < *(double *)(a1 + 104)) {
            goto LABEL_25;
          }
        }
      }
      long long v116 = sub_10004DEA0(*(void *)(a3 + 8), v117);
      os_unfair_lock_lock(&stru_1000A8FFC);
      CFNullRef v70 = NSMapGet(*(NSMapTable **)(a1 + 32), v65);
      if (!v70)
      {
        CFNullRef v70 = CFBinaryHeapCreate(kCFAllocatorDefault, 0, (const CFBinaryHeapCallBacks *)&unk_1000A8A70, 0);
        NSMapInsert(*(NSMapTable **)(a1 + 32), v65, v70);
        CFRelease(v70);
      }
      heap = (__CFBinaryHeap *)v70;
      int v112 = strcmp((const char *)v65, "com.apple.MobileSMS");
      if (v112)
      {
        int v71 = strcmp((const char *)v65, "com.apple.mobilemail");
        CFNullRef v72 = (uint64_t *)(a1 + 112);
        CFIndex v73 = *(void *)(a1 + 112);
        if (v71)
        {
          int v74 = strcmp((const char *)v65, "com.apple.mobileslideshow");
          HIDWORD(v110) = v74 != 0;
          int v111 = 0;
          BOOL v109 = v74 == 0;
          LODWORD(v110) = v109;
        }
        else
        {
          uint64_t v110 = 0;
          BOOL v109 = 0;
          if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
            v73 *= 5;
          }
          int v111 = 1;
        }
      }
      else
      {
        int v111 = 0;
        CFNullRef v72 = (uint64_t *)(a1 + 112);
        CFIndex v73 = *(void *)(a1 + 112);
        BOOL v109 = 0;
        uint64_t v110 = 1;
      }
      if (v73 <= 300 && v73)
      {
        if (v73 < 1) {
          goto LABEL_124;
        }
      }
      else
      {
        CFNullRef v75 = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v76 = *v72;
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)&uint8_t buf[4] = v73;
          *(_WORD *)&uint8_t buf[8] = 1024;
          *(_DWORD *)&buf[10] = v76;
          __int16 v126 = 1024;
          int v127 = v73;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "checkCount is %d for query; fetchCount is %d, relaxedCheckCount is %d\n",
            buf,
            0x14u);
        }

        CFIndex v73 = 300;
      }
      if (CFBinaryHeapGetCount(heap) < v73)
      {
LABEL_124:
        char v77 = 0;
        goto LABEL_166;
      }
      Minimum = (char *)CFBinaryHeapGetMinimum(heap);
      if (sub_10004FD54((uint64_t)v116, (uint64_t)Minimum) == 1)
      {
        if (v112)
        {
          if (v109)
          {
            int v79 = (uint8_t *)(Minimum + 64);
            CFIndex v80 = 3;
          }
          else
          {
            if (v111) {
              CFIndex v80 = 81;
            }
            else {
              CFIndex v80 = 2;
            }
            if ((v111 | HIDWORD(v110)) != 1)
            {
              id v84 = 0;
LABEL_164:
              CFBinaryHeapRemoveMinimumValue(heap);
              char v77 = 0;
LABEL_165:

LABEL_166:
              if (qword_1000A8FE8)
              {
                int v95 = *(_DWORD *)(a6 + 16);
                if (v95 < (int)[(id)qword_1000A8FE8 count])
                {
                  int v96 = *(unsigned __int8 *)(a6 + 20);
                  if (*(unsigned char *)(a6 + 20))
                  {
                    int v97 = @"Priority";
                  }
                  else
                  {
                    int v97 = [(id)qword_1000A8FE8 objectAtIndexedSubscript:*(int *)(a6 + 16)];
                  }
                  sub_10004E4B4((uint64_t)v116, (uint64_t)v117, v97);
                  if (!v96) {

                  }
                  if ((v77 & 1) == 0) {
                    CFBinaryHeapAddValue(heap, v116);
                  }
                  sub_10004E6C0(0, (atomic_uint *)v116);
                  goto LABEL_176;
                }
                int v100 = "batch->protectionClass < (int)protectionClasses.count";
                int v101 = 3819;
              }
              else
              {
                int v100 = "protectionClasses";
                int v101 = 3818;
              }
              __assert_rtn("-[SPCoreSpotlightDatastore performQuery:isCorrectedQuery:reuseTask:needsFuzzy:pommesRewrite:embeddingsRequery:]_block_invoke", "SPCoreSpotlightDatastore.m", v101, v100);
            }
            int v79 = v117;
          }
        }
        else
        {
          int v79 = (uint8_t *)(Minimum + 64);
          CFIndex v80 = 50;
        }
        id v84 = sub_10004E20C((uint64_t)v79, v80);
        if (v84)
        {
          id v89 = NSMapGet(*(NSMapTable **)(a1 + 40), v65);
          if (!v89)
          {
            id v89 = sub_100063D04(v73);
            NSMapInsert(*(NSMapTable **)(a1 + 40), v65, v89);
          }
          *(void *)buf = 0;
          CFHashCode v90 = CFHash(v84);
          if (sub_100063DBC((unsigned int *)v89, v90, (uint64_t)Minimum, buf))
          {
            if (*(void *)buf)
            {
              int v91 = NSMapGet(*(NSMapTable **)(a1 + 48), v65);
              if (!v91)
              {
                int v91 = sub_100063D04(v73);
                NSMapInsert(*(NSMapTable **)(a1 + 48), v65, v91);
              }
              CFHashCode v92 = CFHash(v84);
              sub_100063E58((unsigned int *)v91, v92, *(uint64_t *)buf);
              sub_10004E6C0((uint64_t)kCFAllocatorDefault, *(atomic_uint **)buf);
            }
          }
          else
          {
            id v93 = NSMapGet(*(NSMapTable **)(a1 + 48), v65);
            if (!v93)
            {
              id v93 = sub_100063D04(v73);
              NSMapInsert(*(NSMapTable **)(a1 + 48), v65, v93);
            }
            CFHashCode v94 = CFHash(v84);
            sub_100063E58((unsigned int *)v93, v94, (uint64_t)Minimum);
          }
        }
        goto LABEL_164;
      }
      if (((v110 | v111 | HIDWORD(v110)) & 1) == 0) {
        goto LABEL_145;
      }
      uint64_t v81 = 3;
      if (!v112) {
        uint64_t v81 = 50;
      }
      uint64_t v82 = 2;
      if (v111) {
        uint64_t v82 = 81;
      }
      CFIndex v83 = v110 ? v81 : v82;
      id v84 = sub_10004E20C((uint64_t)v117, v83);
      if (v84)
      {
        id v85 = NSMapGet(*(NSMapTable **)(a1 + 40), v65);
        if (!v85)
        {
          id v85 = sub_100063D04(v73);
          NSMapInsert(*(NSMapTable **)(a1 + 40), v65, v85);
        }
        *(void *)buf = 0;
        CFHashCode v86 = CFHash(v84);
        if (sub_100063DBC((unsigned int *)v85, v86, (uint64_t)v116, buf))
        {
          if (*(void *)buf)
          {
            uint64_t v87 = NSMapGet(*(NSMapTable **)(a1 + 48), v65);
            if (!v87)
            {
              uint64_t v87 = sub_100063D04(v73);
              NSMapInsert(*(NSMapTable **)(a1 + 48), v65, v87);
            }
            CFHashCode v88 = CFHash(v84);
            sub_100063E58((unsigned int *)v87, v88, *(uint64_t *)buf);
            sub_10004E6C0((uint64_t)kCFAllocatorDefault, *(atomic_uint **)buf);
          }
LABEL_180:
          char v77 = 1;
          goto LABEL_165;
        }
        id v98 = NSMapGet(*(NSMapTable **)(a1 + 48), v65);
        if (!v98)
        {
          id v98 = sub_100063D04(v73);
          NSMapInsert(*(NSMapTable **)(a1 + 48), v65, v98);
        }
        CFHashCode v99 = CFHash(v84);
        if (sub_100063E58((unsigned int *)v98, v99, (uint64_t)v116)) {
          goto LABEL_180;
        }
        free(v116);
      }
      else
      {
LABEL_145:
        free(v116);
      }
LABEL_176:
      os_unfair_lock_unlock(&stru_1000A8FFC);
LABEL_25:
      os_log_type_t v33 = v120[1];
      if (v120[1])
      {
        uint64_t v34 = BYTE1(v120[0]);
        if (BYTE1(v120[0]))
        {
          id v35 = (uint64_t *)v120[1];
          do
          {
            sub_10004E564(*v35++);
            --v34;
          }
          while (v34);
        }
        free(v33);
      }
      if (cf)
      {
        CFRelease(cf);
        CFTypeRef cf = 0;
      }
LABEL_92:
      free((void *)a3);
LABEL_93:
      uint64_t v18 = 0;
LABEL_94:
      long long v62 = v123;
      *(_OWORD *)uint64_t v12 = v122;
      *(_OWORD *)(v12 + 16) = v62;
      *(void *)(v12 + 32) = v124;
      return v18;
    case 4:
      uint64_t v18 = malloc_type_calloc(1uLL, 0x40uLL, 0x10F20407A6C0F06uLL);
      v18[1] = *(void *)a6;
      *(_DWORD *)uint64_t v18 = 1;
      goto LABEL_94;
    case 5:
      if (*(_DWORD *)(a3 + 24)) {
        sub_1000403A8((void **)(a6 + 16), a5, a3);
      }
      else {
        sub_10004E564(a3);
      }
      goto LABEL_93;
    case 6:
      CFStringRef v37 = malloc_type_calloc(1uLL, 0x50uLL, 0x10F20409211DA8EuLL);
      uint64_t v18 = v37;
      *((void *)v37 + 1) = *(void *)(a6 + 8);
      int v38 = 3;
      goto LABEL_51;
    case 7:
      if (*(_DWORD *)a6 == 2)
      {
        uint64_t v18 = 0;
        *(void *)(a6 + 80) = a3;
        *(_DWORD *)(a6 + 112) = 19;
        goto LABEL_94;
      }
      if (*(_DWORD *)a6 != 1)
      {
        uint64_t v108 = SPLogForSPLogCategoryDefault();
        sub_100065ACC(v108);

        __assert_rtn("-[SPCoreSpotlightDatastore performQuery:isCorrectedQuery:reuseTask:needsFuzzy:pommesRewrite:embeddingsRequery:]_block_invoke", "SPCoreSpotlightDatastore.m", 3873, "0");
      }
      *(_DWORD *)(a6 + 20) = 3;
      *(_DWORD *)(a6 + 24) = *(_DWORD *)(a3 + 64);
      long long v36 = *(_OWORD *)(a3 + 48);
      *(_OWORD *)(a6 + 32) = *(_OWORD *)(a3 + 32);
      *(_OWORD *)(a6 + 4_Block_object_dispose(&STACK[0x378], 8) = v36;
      *(void *)(a6 + 32) = *(int *)(a3 + 16);
      goto LABEL_92;
    case 8:
      uint64_t v18 = malloc_type_calloc(1uLL, 0x18uLL, 0x1020040F89CB87BuLL);
      v18[1] = *(void *)(a6 + 8);
      *(_DWORD *)uint64_t v18 = 4;
      v18[2] = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      goto LABEL_94;
    case 9:
      if (*(_DWORD *)a6 == 2)
      {
        *(void *)(a6 + 80) = *(void *)(a3 + 16);
        *(_DWORD *)(a6 + 112) = 17;
      }
      else
      {
        if (*(_DWORD *)a6 != 1)
        {
          id v107 = SPLogForSPLogCategoryDefault();
          sub_100065B1C(v107);

          __assert_rtn("-[SPCoreSpotlightDatastore performQuery:isCorrectedQuery:reuseTask:needsFuzzy:pommesRewrite:embeddingsRequery:]_block_invoke", "SPCoreSpotlightDatastore.m", 3915, "0");
        }
        *(void *)(a6 + 20) = 0x1100000004;
        *(void *)(a6 + 32) = *(void *)(a3 + 16);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a3 + 8) + 32), (const void *)a4, *(const void **)(a3 + 16));
      }
      goto LABEL_92;
    case 10:
      int v102 = SPLogForSPLogCategoryDefault();
      os_log_type_t v105 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v102, v105))
      {
        *(_WORD *)long long v117 = 0;
        _os_log_impl((void *)&_mh_execute_header, v102, v105, "ERROR: In 'performQuery', Handling for a Dictonary Container has not yet been implemented", v117, 2u);
      }
      int v104 = 4026;
      goto LABEL_194;
    case 11:
      int v102 = SPLogForSPLogCategoryDefault();
      os_log_type_t v103 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v102, v103))
      {
        *(_WORD *)long long v117 = 0;
        _os_log_impl((void *)&_mh_execute_header, v102, v103, "ERROR: In 'performQuery', Handling for a Dictonary Container has not yet been implemented", v117, 2u);
      }
      int v104 = 4034;
      goto LABEL_194;
    case 12:
      CFStringRef v37 = malloc_type_calloc(1uLL, 0x80uLL, 0x10F204051DD1B44uLL);
      uint64_t v18 = v37;
      *((void *)v37 + 1) = *(void *)(a6 + 8);
      int v38 = 2;
LABEL_51:
      *CFStringRef v37 = v38;
      goto LABEL_94;
    case 13:
      uint64_t v18 = 0;
      *(void *)(a6 + 20) = 0x1500000002;
      *(void *)(a6 + 32) = a3;
      goto LABEL_94;
    case 14:
      int v102 = SPLogForSPLogCategoryDefault();
      os_log_type_t v106 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v102, v106))
      {
        *(_WORD *)long long v117 = 0;
        _os_log_impl((void *)&_mh_execute_header, v102, v106, "ERROR: In 'performQuery', Handling for a Event Key Container has not yet been implemented", v117, 2u);
      }
      int v104 = 4047;
LABEL_194:

      __assert_rtn("-[SPCoreSpotlightDatastore performQuery:isCorrectedQuery:reuseTask:needsFuzzy:pommesRewrite:embeddingsRequery:]_block_invoke", "SPCoreSpotlightDatastore.m", v104, "0");
    case 15:
      a4 = 0;
      unint64_t v17 = 0;
      LODWORD(v23) = 0;
      LOWORD(v20) = 0;
      uint64_t v18 = 0;
      LOBYTE(a3) = a3 & 1;
      int v21 = 14;
      goto LABEL_48;
    case 16:
      a4 = 0;
      unint64_t v17 = 0;
      LODWORD(v23) = 0;
      LOWORD(v20) = 0;
      uint64_t v18 = 0;
      int v21 = 5;
      goto LABEL_48;
    case 17:
      a4 = 0;
      unint64_t v17 = 0;
      LODWORD(v23) = 0;
      uint64_t v18 = 0;
      unint64_t v20 = a3 >> 8;
      int v21 = 4;
      goto LABEL_53;
    case 18:
      a4 = 0;
      unint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v23 = (void *)(a3 >> 16);
      unint64_t v20 = a3 >> 8;
      int v21 = 3;
      goto LABEL_42;
    case 19:
      a4 = 0;
      uint64_t v18 = 0;
      uint64_t v23 = (void *)(a3 >> 16);
      unint64_t v20 = a3 >> 8;
      int v21 = 2;
      goto LABEL_56;
    case 20:
      a4 = 0;
      unint64_t v17 = 0;
      LODWORD(v23) = 0;
      LOWORD(v20) = 0;
      uint64_t v18 = 0;
      int v21 = 10;
LABEL_48:
      uint64_t v22 = 1;
      goto LABEL_62;
    case 21:
      a4 = 0;
      unint64_t v17 = 0;
      LODWORD(v23) = 0;
      uint64_t v18 = 0;
      unint64_t v20 = a3 >> 8;
      int v21 = 9;
LABEL_53:
      uint64_t v22 = 2;
      goto LABEL_62;
    case 22:
      a4 = 0;
      unint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v23 = (void *)(a3 >> 16);
      unint64_t v20 = a3 >> 8;
      int v21 = 8;
      goto LABEL_42;
    case 23:
      a4 = 0;
      uint64_t v18 = 0;
      uint64_t v23 = (void *)(a3 >> 16);
      unint64_t v20 = a3 >> 8;
      int v21 = 7;
      goto LABEL_56;
    case 24:
      uint64_t v18 = 0;
      uint64_t v23 = (void *)(a3 >> 16);
      unint64_t v20 = a3 >> 8;
      int v21 = 6;
      uint64_t v22 = 16;
      goto LABEL_62;
    case 25:
      a4 = 0;
      uint64_t v18 = 0;
      uint64_t v23 = (void *)(a3 >> 16);
      unint64_t v20 = a3 >> 8;
      int v21 = 13;
      goto LABEL_56;
    case 26:
      a4 = 0;
      unint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v23 = (void *)(a3 >> 16);
      unint64_t v20 = a3 >> 8;
      int v21 = 11;
LABEL_42:
      uint64_t v22 = 4;
      goto LABEL_62;
    case 27:
      a4 = 0;
      uint64_t v18 = 0;
      uint64_t v23 = (void *)(a3 >> 16);
      unint64_t v20 = a3 >> 8;
      int v21 = 12;
LABEL_56:
      uint64_t v22 = 8;
      goto LABEL_62;
    case 28:
      unint64_t v26 = (unint64_t)strdup((const char *)a3);
      goto LABEL_36;
    case 29:
      unint64_t v26 = (unint64_t)strndup((const char *)a3, a4);
LABEL_36:
      a4 = 0;
      uint64_t v18 = 0;
      unint64_t v20 = v26 >> 8;
      uint64_t v23 = (void *)(v26 >> 16);
      unint64_t v17 = HIDWORD(v26);
      int v21 = 1;
      uint64_t v22 = 8;
      goto LABEL_61;
    case 30:
      CFDictionaryRef v24 = *(const __CFDictionary **)(*(void *)(a6 + 8) + 24);
      if (!v24) {
        goto LABEL_8;
      }
      Value = CFDictionaryGetValue(v24, (const void *)a4);
      uint64_t v18 = Value;
      if (!Value) {
        goto LABEL_94;
      }
      unint64_t v26 = (unint64_t)CFRetain(Value);
      uint64_t v22 = 0;
      a4 = 0;
      unint64_t v20 = v26 >> 8;
      uint64_t v23 = (void *)(v26 >> 16);
      unint64_t v17 = HIDWORD(v26);
      int v21 = 16;
LABEL_61:
      LOBYTE(a3) = v26;
LABEL_62:
      switch(*(_DWORD *)a6)
      {
        case 2:
          int v40 = a3 | (v20 << 8) | (v23 << 16);
          if (*(unsigned char *)(a6 + 20))
          {
            *(_DWORD *)(a6 + 80) = v40;
            *(_DWORD *)(a6 + 84) = v17;
            *(void *)(a6 + 96) = 0;
            *(void *)(a6 + 104) = 0;
            *(void *)(a6 + 8_Block_object_dispose(&STACK[0x378], 8) = a4;
            *(_DWORD *)(a6 + 112) = v21;
          }
          else
          {
            *(_DWORD *)(a6 + 32) = v40;
            *(_DWORD *)(a6 + 36) = v17;
            *(void *)(a6 + 4_Block_object_dispose(&STACK[0x378], 8) = 0;
            *(void *)(a6 + 56) = 0;
            *(void *)(a6 + 40) = a4;
            *(_DWORD *)(a6 + 64) = v21;
            *(unsigned char *)(a6 + 20) = 1;
          }
          break;
        case 3:
          uint64_t v45 = *(int *)(a6 + 16);
          if (*(void *)(a6 + 32) == v45)
          {
            if (v45)
            {
              uint64_t v46 = 2 * v45;
              *(void *)(a6 + 32) = v46;
              *(void *)(a6 + 40) = malloc_type_realloc(*(void **)(a6 + 40), v46 * v22, 0xCBBD4F2DuLL);
              if (*(_DWORD *)(a6 + 64) != v21)
              {
                long long v47 = "array->valtype == type";
                int v48 = 4095;
LABEL_77:
                __assert_rtn("-[SPCoreSpotlightDatastore performQuery:isCorrectedQuery:reuseTask:needsFuzzy:pommesRewrite:embeddingsRequery:]_block_invoke", "SPCoreSpotlightDatastore.m", v48, v47);
              }
            }
            else
            {
              *(void *)(a6 + 32) = 4;
              *(void *)(a6 + 40) = malloc_type_malloc(4 * v22, 0xD6878399uLL);
              *(_DWORD *)(a6 + 64) = v21;
            }
          }
          long long v47 = "0";
          int v48 = 4132;
          switch(v21)
          {
            case 1:
            case 12:
            case 13:
              goto LABEL_85;
            case 2:
            case 7:
              goto LABEL_88;
            case 3:
            case 8:
            case 11:
              goto LABEL_86;
            case 4:
            case 9:
              goto LABEL_89;
            case 5:
            case 10:
              goto LABEL_87;
            case 14:
              goto LABEL_90;
            case 15:
              goto LABEL_77;
            default:
              goto LABEL_94;
          }
        case 4:
          if (v21 == 16)
          {
            CFArrayAppendValue(*(CFMutableArrayRef *)(a6 + 16), (const void *)(a3 | (unint64_t)(unsigned __int16)(v20 << 8) | ((unint64_t)(unsigned __int16)v23 << 16) | (v17 << 32)));
            CFRelease((CFTypeRef)(a3 | (unint64_t)(unsigned __int16)(v20 << 8) | ((unint64_t)(unsigned __int16)v23 << 16) | (v17 << 32)));
          }
          else if (v21 == 15)
          {
            __assert_rtn("-[SPCoreSpotlightDatastore performQuery:isCorrectedQuery:reuseTask:needsFuzzy:pommesRewrite:embeddingsRequery:]_block_invoke", "SPCoreSpotlightDatastore.m", 4198, "0");
          }
          return result;
        case 5:
          uint64_t v41 = *(int *)(a6 + 16);
          if (*(void *)(a6 + 32) == v41)
          {
            if (v41)
            {
              uint64_t v42 = 2 * v41;
              *(void *)(a6 + 32) = v42;
              *(void *)(a6 + 40) = malloc_type_realloc(*(void **)(a6 + 40), v42 * v22, 0xFB6F942EuLL);
              if (*(_DWORD *)(a6 + 64) != v21)
              {
                uint64_t v43 = "array->valtype == type";
                int v44 = 4146;
LABEL_72:
                __assert_rtn("-[SPCoreSpotlightDatastore performQuery:isCorrectedQuery:reuseTask:needsFuzzy:pommesRewrite:embeddingsRequery:]_block_invoke", "SPCoreSpotlightDatastore.m", v44, v43);
              }
            }
            else
            {
              *(void *)(a6 + 32) = 4;
              *(void *)(a6 + 40) = malloc_type_malloc(4 * v22, 0xF0D2EF32uLL);
              *(_DWORD *)(a6 + 64) = v21;
            }
          }
          uint64_t v43 = "0";
          int v44 = 4183;
          switch(v21)
          {
            case 1:
            case 12:
            case 13:
LABEL_85:
              uint64_t v49 = *(void *)(a6 + 40);
              uint64_t v50 = *(int *)(a6 + 16);
              *(_DWORD *)(a6 + 16) = v50 + 1;
              *(void *)(v49 + 8 * v50) = a3 | (unint64_t)(unsigned __int16)(v20 << 8) | ((unint64_t)(unsigned __int16)v23 << 16) | (v17 << 32);
              goto LABEL_94;
            case 2:
            case 7:
LABEL_88:
              uint64_t v55 = *(void *)(a6 + 40);
              uint64_t v56 = *(int *)(a6 + 16);
              *(_DWORD *)(a6 + 16) = v56 + 1;
              uint64_t v57 = (int *)(v55 + 8 * v56);
              int *v57 = a3 | (v20 << 8) | (v23 << 16);
              v57[1] = v17;
              goto LABEL_94;
            case 3:
            case 8:
            case 11:
LABEL_86:
              uint64_t v51 = *(void *)(a6 + 40);
              uint64_t v52 = *(int *)(a6 + 16);
              *(_DWORD *)(a6 + 16) = v52 + 1;
              *(_DWORD *)(v51 + 4 * v52) = a3 | (v20 << 8) | (v23 << 16);
              goto LABEL_94;
            case 4:
            case 9:
LABEL_89:
              uint64_t v58 = *(void *)(a6 + 40);
              uint64_t v59 = *(int *)(a6 + 16);
              *(_DWORD *)(a6 + 16) = v59 + 1;
              *(_WORD *)(v58 + 2 * v59) = a3 | (unsigned __int16)((_WORD)v20 << 8);
              goto LABEL_94;
            case 5:
            case 10:
LABEL_87:
              uint64_t v53 = *(void *)(a6 + 40);
              uint64_t v54 = *(int *)(a6 + 16);
              *(_DWORD *)(a6 + 16) = v54 + 1;
              *(unsigned char *)(v53 + v54) = a3;
              goto LABEL_94;
            case 14:
LABEL_90:
              uint64_t v60 = *(void *)(a6 + 40);
              uint64_t v61 = *(int *)(a6 + 16);
              *(_DWORD *)(a6 + 16) = v61 + 1;
              *(unsigned char *)(v60 + v61) = a3 & 1;
              goto LABEL_94;
            case 15:
              goto LABEL_72;
            default:
              goto LABEL_94;
          }
        default:
          *(_DWORD *)(a6 + 32) = a3 | (v20 << 8) | (v23 << 16);
          *(_DWORD *)(a6 + 36) = v17;
          *(void *)(a6 + 4_Block_object_dispose(&STACK[0x378], 8) = 0;
          *(void *)(a6 + 56) = 0;
          *(void *)(a6 + 40) = a4;
          *(_DWORD *)(a6 + 24) = v21;
          break;
      }
      goto LABEL_94;
    case 31:
      a3 = (unint64_t)CFStringCreateWithCString(kCFAllocatorDefault, (const char *)a3, 0x8000100u);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a6 + 8) + 24), (const void *)a4, (const void *)a3);
      uint64_t v22 = 0;
      a4 = 0;
      uint64_t v18 = 0;
      unint64_t v20 = a3 >> 8;
      uint64_t v23 = (void *)(a3 >> 16);
      unint64_t v17 = HIDWORD(a3);
      int v21 = 16;
      goto LABEL_62;
    case 32:
      BOOL v39 = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a6 + 8) + 32), (const void *)a4);
      uint64_t v18 = v39;
      if (!v39) {
        goto LABEL_94;
      }
      unint64_t v26 = (unint64_t)CFRetain(v39);
      uint64_t v22 = 0;
      a4 = 0;
      unint64_t v20 = v26 >> 8;
      uint64_t v23 = (void *)(v26 >> 16);
      unint64_t v17 = HIDWORD(v26);
      int v21 = 17;
      goto LABEL_61;
    case 33:
      uint64_t v23 = malloc_type_malloc(a4, 0xF5E9067FuLL);
      unint64_t v17 = HIDWORD(a4);
      CFBinaryHeapRef heapa = (CFBinaryHeapRef)(a4 >> 16);
      id v115 = v16;
      char v19 = a4;
      unint64_t v20 = a4 >> 8;
      memcpy(v23, (const void *)a3, a4);
      uint64_t v18 = 0;
      int v21 = 15;
      uint64_t v22 = 8;
      a4 = (size_t)v23;
      LODWORD(v23) = heapa;
      LOBYTE(a3) = v19;
      uint64_t v16 = v115;
      goto LABEL_62;
    default:
LABEL_8:
      uint64_t v22 = 0;
      int v21 = 0;
      a4 = 0;
      unint64_t v17 = 0;
      LODWORD(v23) = 0;
      LOWORD(v20) = 0;
      LOBYTE(a3) = 0;
      uint64_t v18 = 0;
      goto LABEL_62;
  }
}

void sub_1000401D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,long long a25,long long a26,uint64_t a27)
{
  *(_OWORD *)uint64_t v27 = a25;
  *(_OWORD *)(v27 + 16) = a26;
  *(void *)(v27 + 32) = a27;
  _Unwind_Resume(a1);
}

void **sub_1000403A8(void **result, unint64_t a2, uint64_t a3)
{
  id v5 = result;
  uint64_t v6 = *((unsigned __int8 *)result + 49);
  if (v6 == *((unsigned __int8 *)result + 48))
  {
    *((unsigned char *)result + 4_Block_object_dispose(&STACK[0x378], 8) = 2 * v6;
    id result = (void **)reallocf(result[7], 16 * (v6 & 0x7F));
    v5[7] = result;
  }
  uint64_t v7 = 1 << a2;
  if ((uint64_t)a2 <= 63)
  {
    *id v5 = (void *)((unint64_t)*v5 | v7);
LABEL_11:
    long long v8 = v5[7];
    unsigned __int8 v9 = v6 + 1;
    goto LABEL_12;
  }
  if (a2 <= 0x7F)
  {
    v5[1] = (void *)((unint64_t)v5[1] | v7);
    goto LABEL_11;
  }
  if (a2 <= 0xBF)
  {
    void v5[2] = (void *)((unint64_t)v5[2] | v7);
    goto LABEL_11;
  }
  if (a2 <= 0xFF)
  {
    v5[3] = (void *)((unint64_t)v5[3] | v7);
    goto LABEL_11;
  }
  unsigned __int8 v9 = v6 + 1;
  if (a2 > 0x13F) {
    v5[5] = (void *)((unint64_t)v5[5] | v7);
  }
  else {
    void v5[4] = (void *)((unint64_t)v5[4] | v7);
  }
  long long v8 = v5[7];
LABEL_12:
  *((unsigned char *)v5 + 49) = v9;
  v8[v6] = a3;
  return result;
}

void sub_1000404B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 domain];
  if (v4)
  {
    id v5 = [v3 domain];
    unsigned int v6 = [v5 isEqualToString:@"MainCSIndexTimedOut"];
  }
  else
  {
    unsigned int v6 = 0;
  }

  uint64_t v7 = si_tracing_current_span();
  long long v8 = *(_OWORD *)(v7 + 16);
  long long v60 = *(_OWORD *)v7;
  long long v61 = v8;
  uint64_t v62 = *(void *)(v7 + 32);
  uint64_t v9 = *(void *)(a1 + 344);
  long long v10 = *(_OWORD *)(a1 + 328);
  *(_OWORD *)uint64_t v7 = *(_OWORD *)(a1 + 312);
  *(_OWORD *)(v7 + 16) = v10;
  *(void *)(v7 + 32) = v9;
  if (v6)
  {
    long long v11 = [@"SPCoreSpotlightDatastore rankAndSendResultsHandler" stringByAppendingString:@" (Priority)"];
  }
  else
  {
    long long v11 = @"SPCoreSpotlightDatastore rankAndSendResultsHandler";
  }
  long long v12 = *(_OWORD *)(v7 + 16);
  long long v57 = *(_OWORD *)v7;
  long long v58 = v12;
  uint64_t v59 = *(void *)(v7 + 32);
  uint64_t v13 = *(void *)v7;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v15 = *(void *)(v7 + 8);
  int v16 = *(_DWORD *)(v7 + 24);
  unint64_t v17 = v11;
  id v18 = [(__CFString *)v17 UTF8String];
  *(void *)uint64_t v7 = v13;
  *(void *)(v7 + _Block_object_dispose(&STACK[0x378], 8) = spanid;
  *(void *)(v7 + 16) = v15;
  *(_DWORD *)(v7 + 24) = v16;
  *(unsigned char *)(v7 + 2_Block_object_dispose(&STACK[0x378], 8) = 102;
  *(void *)(v7 + 32) = v18;
  si_tracing_log_span_begin();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 296));
  id v20 = objc_loadWeakRetained((id *)(a1 + 304));
  int v21 = v20;
  if (WeakRetained && v20)
  {
    objc_copyWeak(&v51, (id *)(a1 + 296));
    objc_copyWeak(v52, (id *)(a1 + 304));
    id v26 = v3;
    char v53 = v6;
    id v27 = *(id *)(a1 + 56);
    id v28 = *(id *)(a1 + 64);
    id v29 = *(id *)(a1 + 72);
    id v30 = *(id *)(a1 + 80);
    id v31 = *(id *)(a1 + 88);
    v52[1] = *(id *)(a1 + 352);
    id v32 = *(id *)(a1 + 96);
    id v33 = *(id *)(a1 + 104);
    id v34 = *(id *)(a1 + 112);
    id v35 = *(id *)(a1 + 120);
    id v36 = *(id *)(a1 + 128);
    id v37 = *(id *)(a1 + 136);
    id v38 = *(id *)(a1 + 144);
    id v39 = *(id *)(a1 + 152);
    id v40 = *(id *)(a1 + 160);
    id v22 = *(id *)(a1 + 168);
    v52[2] = *(id *)(a1 + 360);
    uint64_t v23 = *(void **)(a1 + 184);
    id v41 = v22;
    __int16 v54 = *(_WORD *)(a1 + 376);
    id v42 = v23;
    id v43 = *(id *)(a1 + 48);
    char v55 = *(unsigned char *)(a1 + 378);
    __int16 v56 = *(_WORD *)(a1 + 379);
    id v44 = *(id *)(a1 + 192);
    id v45 = *(id *)(a1 + 200);
    id v46 = *(id *)(a1 + 208);
    id v47 = *(id *)(a1 + 216);
    id v48 = *(id *)(a1 + 224);
    id v49 = *(id *)(a1 + 232);
    id v50 = *(id *)(a1 + 240);
    v52[3] = *(id *)(a1 + 368);
    tracing_dispatch_async();

    objc_destroyWeak(v52);
    objc_destroyWeak(&v51);
  }

  si_tracing_log_span_end();
  long long v24 = v58;
  *(_OWORD *)uint64_t v7 = v57;
  *(_OWORD *)(v7 + 16) = v24;
  *(void *)(v7 + 32) = v59;

  long long v25 = v61;
  *(_OWORD *)uint64_t v7 = v60;
  *(_OWORD *)(v7 + 16) = v25;
  *(void *)(v7 + 32) = v62;
}

void sub_100040964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  sub_1000067B0(v12 - 176);
  long long v14 = *(_OWORD *)(v12 - 112);
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(v12 - 128);
  *(_OWORD *)(v10 + 16) = v14;
  *(void *)(v10 + 32) = *(void *)(v12 - 96);
  _Unwind_Resume(a1);
}

void sub_1000409B0()
{
  uint64_t v0 = __chkstk_darwin();
  id WeakRetained = objc_loadWeakRetained((id *)(v0 + 304));
  id v198 = objc_loadWeakRetained((id *)(v0 + 312));
  id v202 = objc_alloc_init((Class)NSMutableSet);
  if (*(void *)(v0 + 48) && !*(unsigned char *)(v0 + 344) || ([WeakRetained cancelled] & 1) != 0) {
    goto LABEL_198;
  }
  os_unfair_lock_lock(&stru_1000A8FFC);
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, *(NSMapTable **)(v0 + 56));
  value = 0;
  key = 0;
  if (!NSNextMapEnumeratorPair(&enumerator, &key, &value))
  {
    BOOL v214 = 0;
    goto LABEL_183;
  }
  BOOL v214 = 0;
  long long v208 = (void *)SSEventBundleIdentifier;
  __s2 = (char *)SPApplicationBundleIdGeneralApplicationCStr;
  uint64_t v203 = PRSRankingSettingsBundleString;
  uint64_t v193 = PRSRankingPhotosAppBundleString;
  uint64_t v195 = SSMessagesBundleIdentifier;
  uint64_t v196 = PRSRankingMessagesBundleString;
  uint64_t v194 = PRSRankingNotesBundleString;
  uint64_t v192 = PRSRankingDocumentsAppBundleString;
  uint64_t v191 = PRSRankingLocalFilesBundleString;
  uint64_t v190 = PRSRankingFilesBundleString;
  uint64_t v197 = SSPhotosBundleIdentifier;
  uint64_t v189 = PRSRankingFileProviderFilesBundleString;
  do
  {
    uint64_t v1 = (unsigned int *)NSMapGet(*(NSMapTable **)(v0 + 64), key);
    id v2 = (unsigned int *)NSMapGet(*(NSMapTable **)(v0 + 72), key);
    id v3 = objc_alloc((Class)NSString);
    v217 = (__CFString *)[v3 initWithCString:key encoding:4];
    if (*(unsigned char *)(v0 + 344))
    {
      if ([(__CFString *)v217 isEqualToString:@"com.apple.searchd.engagement"])
      {
        id v4 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Found com.apple.searchd.engagement", buf, 2u);
        }

        CFIndex Count = CFBinaryHeapGetCount((CFBinaryHeapRef)value);
        unsigned int v6 = (const void **)buf;
        bzero(buf, 0x2000uLL);
        if (Count >= 1025) {
          unsigned int v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
        }
        CFBinaryHeapGetValues((CFBinaryHeapRef)value, v6);
        BOOL v7 = !v214;
        if (Count >= 1 && !v214)
        {
          CFIndex v8 = 0;
          do
          {
            uint64_t v9 = v6[v8];
            if (v9)
            {
              uint64_t v12 = (char *)(v9 + 2);
              uint64_t v11 = v9[2];
              uint64_t v10 = *((void *)v12 + 1);
              if (v11 | v10) {
                BOOL v214 = (qword_1000A8FD0 & v11 | *(void *)algn_1000A8FD8 & v10) != 0;
              }
            }
            ++v8;
            BOOL v7 = !v214;
          }
          while (v8 < Count && !v214);
        }
        if (v6 != (const void **)buf) {
          free(v6);
        }
        if (!v7)
        {

          break;
        }
        id v13 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v289 = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Found no exact-match on previous engagement", v289, 2u);
        }
      }
      [v202 addObject:v217];
    }
    CFIndex v14 = CFBinaryHeapGetCount((CFBinaryHeapRef)value);
    unsigned int v15 = sub_100063ED8((unint64_t)v1);
    uint64_t v16 = v14 + v15 + sub_100063ED8((unint64_t)v2);
    if (!v16) {
      goto LABEL_180;
    }
    unint64_t v17 = (const void **)buf;
    bzero(buf, 0x2000uLL);
    uint64_t v209 = v16;
    if (v16 >= 1025) {
      unint64_t v17 = (const void **)malloc_type_malloc(8 * v16, 0x80040B8603338uLL);
    }
    v211 = v17;
    CFBinaryHeapGetValues((CFBinaryHeapRef)value, v17);
    *(void *)v289 = 0;
    *(void *)&v289[8] = v289;
    *(void *)&v289[16] = 0x2020000000;
    *(void *)&v289[24] = 0;
    v281[0] = _NSConcreteStackBlock;
    v281[1] = 3221225472;
    v281[2] = sub_100042D78;
    v281[3] = &unk_1000934E8;
    v281[6] = v14;
    v281[5] = v17;
    v281[4] = v289;
    sub_100063F10(v1, v281);
    _Block_object_dispose(v289, 8);
    *(void *)v289 = 0;
    *(void *)&v289[8] = v289;
    *(void *)&v289[16] = 0x2020000000;
    *(void *)&v289[24] = 0;
    v280[0] = _NSConcreteStackBlock;
    v280[1] = 3221225472;
    v280[2] = sub_100042DA8;
    v280[3] = &unk_100093510;
    v280[6] = v15;
    v280[7] = v14;
    v280[5] = v17;
    v280[4] = v289;
    sub_100063F10(v2, v280);
    _Block_object_dispose(v289, 8);
    uint64_t v18 = SPL1Threshold();
    unint64_t v205 = v19;
    uint64_t v206 = v18;
    uint64_t v20 = v16;
    if (v16 < 1) {
      goto LABEL_177;
    }
    uint64_t v21 = 0;
    id v22 = v17;
    while (1)
    {
      uint64_t v23 = v22[v21];
      if (v23) {
        break;
      }
LABEL_155:
      if (++v21 == v20) {
        goto LABEL_178;
      }
    }
    uint64_t v24 = (uint64_t)v23 + 64;
    unsigned long long v213 = *((_OWORD *)v23 + 1);
    v218 = (double *)v22[v21];
    id v216 = *((id *)v23 + 4);
    if (!strcmp((const char *)key, "com.apple.spotlight.category"))
    {
      long long v25 = sub_10004E8BC(v24, 68);
      id v26 = sub_10004EC0C(v24, 67);
      id v27 = objc_opt_new();
      if (v25)
      {
        if ([v25 count])
        {
          if (v26)
          {
            id v28 = [v26 count];
            if (v28 == [v25 count])
            {
              if ([v25 count])
              {
                unint64_t v29 = 0;
                do
                {
                  id v30 = [v25 objectAtIndex:v29];
                  unsigned int v31 = [v30 isEqualToString:*(void *)(v0 + 80)];

                  if (v31)
                  {
                    id v32 = [v26 objectAtIndex:v29];
                    [v27 addObject:v32];
                  }
                  ++v29;
                }
                while ((unint64_t)[v25 count] > v29);
              }
              if ([v27 count])
              {
                id v33 = [v198 rankingInfo];
                id v34 = [v33 categoryEngagements];
                id v35 = sub_10004E20C(v24, 2);
                [v34 setValue:v27 forKey:v35];
              }
            }
          }
        }
      }
    }
    id v36 = SPLogForSPLogCategoryDefault();
    os_log_type_t v37 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v36, v37))
    {
      *(_WORD *)v289 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "2", v289, 2u);
    }

    if ([WeakRetained cancelled]) {
      goto LABEL_176;
    }
    CFNullRef v221 = sub_10004E20C(v24, 0);
    if (_os_feature_enabled_impl()
      && [(__CFString *)v217 isEqualToString:v208])
    {
      id v38 = v208;

      CFNullRef v221 = v38;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      oslog = SPLogForSPLogCategoryDefault();
      os_log_type_t v43 = gSPLogInfoAsDefault ^ 1;
      if (os_log_type_enabled(oslog, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
      {
        sub_10004E20C(v24, 2);
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v289 = 138412546;
        *(void *)&v289[4] = v44;
        *(_WORD *)&v289[12] = 2112;
        *(void *)&v289[14] = v217;
        _os_log_impl((void *)&_mh_execute_header, oslog, v43, "No UTI type for CoreSpotlight result, identifier:%@, bundleID:%@", v289, 0x16u);
      }
      goto LABEL_154;
    }
    id v39 = (const char *)key;
    if (!strcmp((const char *)key, __s2))
    {
      id v40 = *(void **)(v0 + 88);
      id v41 = sub_10004E20C(v24, 2);
      LOBYTE(v40) = [v40 containsObject:v41];

      if (v40)
      {
        oslog = SPLogForSPLogCategoryDefault();
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          sub_10004E20C(v24, 2);
          id v42 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v289 = 138412290;
          *(void *)&v289[4] = v42;
          _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Skipping disabled app %@", v289, 0xCu);
        }
        goto LABEL_154;
      }
      id v39 = (const char *)key;
    }
    if (!strcmp(v39, "com.apple.shortcuts"))
    {
      id v45 = *(void **)(v0 + 88);
      id v46 = sub_10004E20C(v24, 72);
      LODWORD(v45) = [v45 containsObject:v46];

      if (v45)
      {
        oslog = SPLogForSPLogCategoryDefault();
        os_log_type_t v47 = gSPLogInfoAsDefault ^ 1;
        if (os_log_type_enabled(oslog, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
        {
          sub_10004E20C(v24, 72);
          id v48 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v289 = 138412290;
          *(void *)&v289[4] = v48;
          _os_log_impl((void *)&_mh_execute_header, oslog, v47, "Skipping shortcut for disabled app %@", v289, 0xCu);
        }
        goto LABEL_154;
      }
    }
    oslog = sub_10004E20C(v24, 83);
    if (![oslog length]
      || (*(unsigned char *)(v24 + 1) & 8) != 0
      || ([(__CFString *)v217 isEqualToString:v195] & 1) != 0)
    {
      id v49 = sub_10004E20C(v24, 11);

      if (v49)
      {
        id v50 = sub_10004E20C(v24, 86);
        unsigned __int8 v51 = [v50 isEqualToString:off_1000A8A60[0]];

        if (v51) {
          goto LABEL_154;
        }
      }
    }
    else
    {
      uint64_t v52 = off_1000A8A58[0];

      v217 = v52;
    }
    if ([(__CFString *)v217 isEqualToString:v203])
    {
      if ([v221 isEqualToString:@"com.apple.Preferences.thirdPartyApp"])
      {
        char v53 = sub_10004E20C(v24, 92);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v54 = *(void **)(*(void *)(*(void *)(v0 + 256) + 8) + 40);
          if (!v54)
          {
            char v55 = SPFastApplicationsGetNoBuild();
            __int16 v56 = [v55 allKeys];
            uint64_t v57 = +[NSSet setWithArray:v56];
            uint64_t v58 = *(void *)(*(void *)(v0 + 256) + 8);
            uint64_t v59 = *(void **)(v58 + 40);
            *(void *)(v58 + 40) = v57;

            __int16 v54 = *(void **)(*(void *)(*(void *)(v0 + 256) + 8) + 40);
            if (!v54)
            {
              uint64_t v60 = SPCopyVisibleApps();
              uint64_t v61 = *(void *)(*(void *)(v0 + 256) + 8);
              uint64_t v62 = *(void **)(v61 + 40);
              *(void *)(v61 + 40) = v60;

              __int16 v54 = *(void **)(*(void *)(*(void *)(v0 + 256) + 8) + 40);
            }
          }
          if (([v54 containsObject:v53] & 1) == 0)
          {
            CFNullRef v63 = SPLogForSPLogCategoryDefault();
            os_log_type_t v64 = 2 * (gSPLogDebugAsDefault == 0);
            if (os_log_type_enabled(v63, v64))
            {
              *(_DWORD *)v289 = 138412290;
              *(void *)&v289[4] = v53;
              id v65 = v63;
              os_log_type_t v66 = v64;
              os_log_type_t v67 = "skipping for not installed app %@";
LABEL_162:
              _os_log_impl((void *)&_mh_execute_header, v65, v66, v67, v289, 0xCu);
              goto LABEL_163;
            }
            goto LABEL_163;
          }
        }
      }
      else
      {
        char v53 = sub_10004E20C(v24, 2);
        uint8x8_t v68 = *(void **)(*(void *)(*(void *)(v0 + 256) + 8) + 40);
        if (!v68)
        {
          uint64_t v69 = SPFastApplicationsGetNoBuild();
          CFNullRef v70 = [v69 allKeys];
          uint64_t v71 = +[NSSet setWithArray:v70];
          uint64_t v72 = *(void *)(*(void *)(v0 + 256) + 8);
          CFIndex v73 = *(void **)(v72 + 40);
          *(void *)(v72 + 40) = v71;

          uint8x8_t v68 = *(void **)(*(void *)(*(void *)(v0 + 256) + 8) + 40);
          if (!v68)
          {
            uint64_t v74 = SPCopyVisibleApps();
            uint64_t v75 = *(void *)(*(void *)(v0 + 256) + 8);
            uint64_t v76 = *(void **)(v75 + 40);
            *(void *)(v75 + 40) = v74;

            uint8x8_t v68 = *(void **)(*(void *)(*(void *)(v0 + 256) + 8) + 40);
          }
        }
        if (([v68 containsObject:@"com.apple.news"] & 1) == 0
          && (([v53 hasPrefix:@"prefs:root=NEWS"] & 1) != 0
           || ([v53 hasPrefix:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.News"] & 1) != 0|| objc_msgSend(v53, "hasPrefix:", @"prefs:root=DEVELOPER_SETTINGS#NEWS_TESTING")))
        {
          CFNullRef v63 = SPLogForSPLogCategoryDefault();
          os_log_type_t v113 = 2 * (gSPLogDebugAsDefault == 0);
          if (os_log_type_enabled(v63, v113))
          {
            *(_DWORD *)v289 = 136315138;
            *(void *)&v289[4] = "com.apple.news";
            id v65 = v63;
            os_log_type_t v66 = v113;
            os_log_type_t v67 = "skipping for not installed app %s";
            goto LABEL_162;
          }
LABEL_163:

LABEL_154:
          id v22 = v211;
          uint64_t v20 = v209;
          goto LABEL_155;
        }
      }
    }
    if (([WeakRetained cancelled] & 1) == 0)
    {
      if (*(void *)(v0 + 320))
      {
        unint64_t v77 = 0;
        int v78 = 0;
        do
        {
          if ([*(id *)(v0 + 96) containsIndex:v77])
          {
            if ((uint64_t)v77 > 63)
            {
              if (v77 > 0x7F)
              {
                if (v77 > 0xBF)
                {
                  if (v77 > 0xFF) {
                    uint64_t v79 = v77 > 0x13F ? *((void *)v218 + 13) : *((void *)v218 + 12);
                  }
                  else {
                    uint64_t v79 = *((void *)v218 + 11);
                  }
                }
                else
                {
                  uint64_t v79 = *((void *)v218 + 10);
                }
              }
              else
              {
                uint64_t v79 = *((void *)v218 + 9);
              }
            }
            else
            {
              uint64_t v79 = *(void *)v24;
            }
            if ((v79 & (1 << v77)) != 0) {
              ++v78;
            }
          }
          ++v77;
        }
        while (v77 < *(void *)(v0 + 320));
      }
      uint64_t v210 = SSCompactRankingAttrsAlloc();
      if (*(void *)(v0 + 320))
      {
        unint64_t v80 = 0;
        do
        {
          if ([*(id *)(v0 + 96) containsIndex:v80])
          {
            if ((uint64_t)v80 > 63)
            {
              if (v80 > 0x7F)
              {
                if (v80 > 0xBF)
                {
                  if (v80 > 0xFF) {
                    uint64_t v81 = v80 > 0x13F ? *((void *)v218 + 13) : *((void *)v218 + 12);
                  }
                  else {
                    uint64_t v81 = *((void *)v218 + 11);
                  }
                }
                else
                {
                  uint64_t v81 = *((void *)v218 + 10);
                }
              }
              else
              {
                uint64_t v81 = *((void *)v218 + 9);
              }
            }
            else
            {
              uint64_t v81 = *(void *)v24;
            }
            if ((v81 & (1 << v80)) != 0)
            {
              uint64_t v82 = sub_10004F638(v24, v80);
              if (v82) {
                SSCompactRankingAttrsInsertValue();
              }
            }
          }
          ++v80;
        }
        while (v80 < *(void *)(v0 + 320));
      }
      id v215 = [objc_alloc((Class)PRSRankingItem) initWithAttrs:v210];
      CFIndex v83 = SPLogForSPLogCategoryDefault();
      os_log_type_t v84 = gSPLogInfoAsDefault ^ 1;
      if (os_log_type_enabled(v83, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
      {
        int v200 = *(unsigned __int8 *)(v0 + 344);
        os_log_type_t v201 = v84;
        id v199 = [*(id *)(v0 + 104) queryID];
        long long v204 = [v215 sectionBundleIdentifier];
        id v85 = [v215 identifier];
        id v86 = [v215 bundleIDType];
        uint64_t v87 = [v215 L2FeatureVector];
        [v87 indexScore];
        uint64_t v89 = v88;
        CFHashCode v90 = [v215 L2FeatureVector];
        id v91 = [v90 indexScore];
        uint64_t v92 = SSCompactRankingAttrsGetCount();
        *(_DWORD *)v289 = 67111426;
        *(_DWORD *)&v289[4] = v200;
        *(_WORD *)&v289[8] = 2048;
        *(void *)&v289[10] = v199;
        *(_WORD *)&v289[18] = 2112;
        *(void *)&v289[20] = v204;
        *(_WORD *)&v289[28] = 2112;
        *(void *)&v289[30] = v85;
        __int16 v290 = 2048;
        id v291 = v86;
        __int16 v292 = 2048;
        uint64_t v293 = v89;
        __int16 v294 = 2048;
        id v295 = v91;
        __int16 v296 = 2048;
        id v297 = v215;
        __int16 v298 = 2048;
        uint64_t v299 = v210;
        __int16 v300 = 2048;
        uint64_t v301 = v92;
        _os_log_impl((void *)&_mh_execute_header, v83, v201, "### (%d) [%ld] rankingItem %@ %@ 0x%16.16llx 0x%16.16llx%16.16llx (%p, %p, %lu)", v289, 0x62u);
      }
      *(void *)v289 = 0;
      uint64_t v93 = sub_10004E6EC(v24, 87, v289);
      CFHashCode v94 = sub_10004E20C(v24, 10);
      int v95 = sub_10004F638(v24, 175);
      if (!v95
        || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
        || (uint64_t)[v95 integerValue] < 1
        || ([v94 isEqualToString:v193] & 1) != 0)
      {
        int v96 = 0;
        id v97 = 0;
        if (v93) {
          goto LABEL_129;
        }
        goto LABEL_133;
      }
      if ([v94 isEqualToString:v196])
      {
        uint64_t v114 = 0x4000000;
      }
      else if ([v94 isEqualToString:v194])
      {
        uint64_t v114 = 0x8000000;
      }
      else
      {
        if (([v94 isEqualToString:v192] & 1) == 0
          && ([v94 isEqualToString:v191] & 1) == 0
          && ![v94 isEqualToString:v190])
        {
LABEL_173:
          objc_msgSend(v215, "setBundleIDType:", (unint64_t)objc_msgSend(v215, "bundleIDType") | 0x2000000);
          id v97 = [objc_alloc((Class)PRSRankingItem) initWithAttrs:SSCompactRankingAttrsCopy()];
          objc_msgSend(v97, "setBundleIDType:", objc_msgSend(v215, "bundleIDType"));
          [v97 setSectionBundleIdentifier:v197];
          int v96 = 1;
          if (v93)
          {
LABEL_129:
            if (*(void *)v289 == 6)
            {
              if ([oslog length]) {
                [v215 setSectionBundleIdentifier:v94];
              }
              [*(id *)(v0 + 112) setRenderEngagementFeaturesForItemAsShorts:v215 counts:v93 isRender:1 bundleDict:*(void *)(v0 + 120)];
              [*(id *)(v0 + 112) setRenderEngagementFeaturesForItemAsShorts:v97 counts:v93 isRender:1 bundleDict:*(void *)(v0 + 120)];
            }
          }
LABEL_133:
          uint64_t v98 = sub_10004E6EC(v24, 88, v289);
          if (v98 && *(void *)v289 == 6)
          {
            if ([oslog length]) {
              [v215 setSectionBundleIdentifier:v94];
            }
            [*(id *)(v0 + 112) setRenderEngagementFeaturesForItemAsShorts:v215 counts:v98 isRender:0 bundleDict:*(void *)(v0 + 120)];
            [*(id *)(v0 + 112) setRenderEngagementFeaturesForItemAsShorts:v97 counts:v98 isRender:0 bundleDict:*(void *)(v0 + 120)];
          }
          CFHashCode v99 = [[SPSearchTopHitResult alloc] initWithRankingItem:v215 clientData:v218];
          [(SPTopHitResult *)v99 setScore:v213];
          int v100 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v218[5]];
          [(SPTopHitResult *)v99 setInterestingDate:v100];

          [(SPTopHitResult *)v99 setBundleID:v217];
          [(SPTopHitResult *)v99 setDataclass:v216];
          if (v213 < __PAIR128__(v205, v206)) {
            [v215 setEligibleForDemotion:1];
          }
          if ([v221 hasPrefix:@"com.apple.siri."])
          {
            int v101 = [(SPTopHitResult *)v99 rankingItem];
            int v102 = [v101 L2FeatureVector];
            [v102 setIsSiriAction:1];
          }
          os_log_type_t v103 = [*(id *)(v0 + 128) objectForKey:v217];
          if (!v103)
          {
            os_log_type_t v103 = objc_opt_new();
            [v103 setDomain:1];
            [v103 setBundleIdentifier:v217];
            [*(id *)(v0 + 128) setObject:v103 forKey:v217];
          }
          [v103 addResults:v99];
          [*(id *)(v0 + 136) addObject:v99];
          ++*(void *)(*(void *)(*(void *)(v0 + 264) + 8) + 24);
          if (v96)
          {
            int v104 = [[SPSearchTopHitResult alloc] initWithRankingItem:v97 clientData:v218];
            [(SPTopHitResult *)v104 setScore:v213];
            os_log_type_t v105 = [(SPTopHitResult *)v99 interestingDate];
            [(SPTopHitResult *)v104 setInterestingDate:v105];

            [(SPTopHitResult *)v104 setBundleID:v197];
            [(SPTopHitResult *)v104 setDataclass:v216];
            objc_msgSend(v97, "setEligibleForDemotion:", objc_msgSend(v215, "eligibleForDemotion"));
            unsigned __int8 v106 = [v94 isEqualToString:v196];
            id v107 = (id *)(v0 + 144);
            if ((v106 & 1) == 0)
            {
              unsigned __int8 v108 = [v94 isEqualToString:v194];
              id v107 = (id *)(v0 + 152);
              if ((v108 & 1) == 0)
              {
                unsigned __int8 v109 = [v94 isEqualToString:v192];
                id v107 = (id *)(v0 + 160);
                if ((v109 & 1) == 0)
                {
                  unsigned __int8 v110 = [v94 isEqualToString:v191];
                  id v107 = (id *)(v0 + 160);
                  if ((v110 & 1) == 0)
                  {
                    unsigned __int8 v111 = [v94 isEqualToString:v190];
                    id v107 = (id *)(v0 + 160);
                    if ((v111 & 1) == 0)
                    {
                      unsigned int v112 = [v94 isEqualToString:v189];
                      id v107 = (id *)(v0 + 168);
                      if (v112) {
                        id v107 = (id *)(v0 + 160);
                      }
                    }
                  }
                }
              }
            }
            [*v107 addResults:v104];
            [*(id *)(v0 + 136) addObject:v104];
            ++*(void *)(*(void *)(*(void *)(v0 + 264) + 8) + 24);
          }
          goto LABEL_154;
        }
        uint64_t v114 = 0x10000000;
      }
      [v215 setBundleIDType:v114];
      goto LABEL_173;
    }

LABEL_176:
LABEL_177:
    id v22 = v211;
LABEL_178:
    if (v22 != (const void **)buf) {
      free(v22);
    }
LABEL_180:
  }
  while (NSNextMapEnumeratorPair(&enumerator, &key, &value));
LABEL_183:
  NSEndMapTableEnumeration(&enumerator);
  if (*(unsigned char *)(v0 + 344) && !v214)
  {
    long long v279 = 0u;
    long long v278 = 0u;
    long long v277 = 0u;
    long long v276 = 0u;
    id v115 = v202;
    id v116 = [v115 countByEnumeratingWithState:&v276 objects:v288 count:16];
    if (v116)
    {
      uint64_t v117 = *(void *)v277;
      do
      {
        for (i = 0; i != v116; i = (char *)i + 1)
        {
          if (*(void *)v277 != v117) {
            objc_enumerationMutation(v115);
          }
          NSMapRemove(*(NSMapTable **)(v0 + 56), [*(id *)(*((void *)&v276 + 1) + 8 * i) cStringUsingEncoding:4]);
        }
        id v116 = [v115 countByEnumeratingWithState:&v276 objects:v288 count:16];
      }
      while (v116);
    }
  }
  os_unfair_lock_unlock(&stru_1000A8FFC);
  if (v214 && *(unsigned char *)(v0 + 344))
  {
    id v119 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Delay returning results; previous engagement of non-priority result found",
        buf,
        2u);
    }

    goto LABEL_260;
  }
LABEL_198:
  if ([WeakRetained cancelled]) {
    goto LABEL_260;
  }
  if ((*(void *)(v0 + 328) & 0xFFFFFFFFFFFFFFFELL) == 4) {
    goto LABEL_278;
  }
  if (!*(void *)(*(void *)(*(void *)(v0 + 264) + 8) + 24)
    && !*(unsigned char *)(*(void *)(*(void *)(v0 + 272) + 8) + 24)
    && ([WeakRetained isRewrite] & 1) == 0
    && ([WeakRetained cancelled] & 1) == 0
    && !*(unsigned char *)(v0 + 344))
  {
    id v120 = [WeakRetained waitForQueryCorrections];
    if ([v120 count] && objc_msgSend(WeakRetained, "previousQueryKind") != (id)10)
    {
      long long v170 = *(void **)(v0 + 176);
      long long v171 = [v120 firstObject];
      long long v172 = [v171 suggestion];
      [v170 performQueryRewriteForQuery:WeakRetained withCorrection:v172 task:v198];

      goto LABEL_260;
    }
  }
  if (*(unsigned char *)(v0 + 345)) {
    goto LABEL_278;
  }
  if (!*(void *)(*(void *)(*(void *)(v0 + 264) + 8) + 24)
    && !*(unsigned char *)(v0 + 346)
    && [WeakRetained needsReRunForFuzzy]
    && ([WeakRetained cancelled] & 1) == 0
    && ([WeakRetained isCJK] & 1) == 0
    && ([*(id *)(v0 + 104) pommes] & 1) == 0
    && *(void *)(v0 + 80)
    && !*(unsigned char *)(v0 + 344))
  {
    [WeakRetained setNeedsReRunForFuzzy:0];
    id v187 = [*(id *)(v0 + 176) performQuery:WeakRetained isCorrectedQuery:0 reuseTask:v198 needsFuzzy:0 pommesRewrite:0 embeddingsRequery:1];
    goto LABEL_260;
  }
  if (*(unsigned char *)(v0 + 345)
    || *(void *)(*(void *)(*(void *)(v0 + 264) + 8) + 24)
    || *(unsigned char *)(v0 + 346)
    || ([WeakRetained needsReRunForFuzzy] & 1) != 0
    || ([WeakRetained cancelled] & 1) != 0
    || ([WeakRetained isCJK] & 1) != 0
    || *(unsigned char *)(v0 + 344))
  {
LABEL_278:
    if (!*(unsigned char *)(v0 + 344))
    {
      long long v121 = *(void **)(v0 + 168);
      long long v122 = [*(id *)(v0 + 144) results];
      [v121 addResultsFromArray:v122];

      long long v123 = *(void **)(v0 + 168);
      uint64_t v124 = [*(id *)(v0 + 152) results];
      [v123 addResultsFromArray:v124];

      long long v125 = *(void **)(v0 + 168);
      __int16 v126 = [*(id *)(v0 + 160) results];
      [v125 addResultsFromArray:v126];

      [*(id *)(v0 + 144) setResults:0];
      [*(id *)(v0 + 152) setResults:0];
      [*(id *)(v0 + 160) setResults:0];
    }
    int v127 = [*(id *)(v0 + 128) allValues];
    id v128 = [WeakRetained queryIdent];
    CFNullRef v129 = [WeakRetained queryContext];
    id v130 = [v129 searchString];
    +[SSRankingManager logSections:v127 prefix:@"L1 performQuery" queryId:v128 query:v130];

    if ([WeakRetained cancelled])
    {
      id v131 = SPLogForSPLogCategoryTelemetry();
      unsigned int v132 = [WeakRetained externalID];
      if (v132 && os_signpost_enabled(v131))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v131, OS_SIGNPOST_EVENT, v132, "coreSpotlightCancel", " enableTelemetry=YES ", buf, 2u);
      }

      id v133 = [v198 resultPipe];
      sub_10001EDF8(v133, "canceled", "corespotlight", *(void *)(*(void *)(*(void *)(v0 + 296) + 8) + 32), "rankprep", *(void *)(*(void *)(*(void *)(v0 + 296) + 8) + 40), "resultprep", *(void *)(*(void *)(*(void *)(v0 + 296) + 8) + 48), 0, 0);
LABEL_256:

      int v143 = SPLogForSPLogCategoryQuery();
      os_log_type_t v168 = gSPLogInfoAsDefault ^ 1;
      if (os_log_type_enabled(v143, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
      {
        uint64_t v169 = *(void *)(*(void *)(*(void *)(v0 + 264) + 8) + 24);
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v169;
        _os_log_impl((void *)&_mh_execute_header, v143, v168, "CoreSpotlight query finished with %ld results", buf, 0xCu);
      }
LABEL_259:

      goto LABEL_260;
    }
    if (*(unsigned char *)(v0 + 344))
    {
      id v134 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v127, "count"));
      id v135 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v127, "count"));
      long long v257 = 0u;
      long long v258 = 0u;
      long long v255 = 0u;
      long long v256 = 0u;
      id v136 = v127;
      id v137 = [v136 countByEnumeratingWithState:&v255 objects:v286 count:16];
      if (v137)
      {
        uint64_t v138 = *(void *)v256;
        do
        {
          for (j = 0; j != v137; j = (char *)j + 1)
          {
            if (*(void *)v256 != v138) {
              objc_enumerationMutation(v136);
            }
            id v140 = *(void **)(*((void *)&v255 + 1) + 8 * (void)j);
            id v141 = [v140 bundleIdentifier];
            if (sub_1000431DC(v141))
            {
              int v142 = [v140 mutableDeepCopy];
              [v135 addObject:v142];

              [v134 addObject:v141];
            }
          }
          id v137 = [v136 countByEnumeratingWithState:&v255 objects:v286 count:16];
        }
        while (v137);
      }

      int v143 = v135;
      if (![v143 count])
      {

        goto LABEL_259;
      }
      long long v253 = 0u;
      long long v254 = 0u;
      long long v251 = 0u;
      long long v252 = 0u;
      id v144 = v134;
      id v145 = [v144 countByEnumeratingWithState:&v251 objects:v285 count:16];
      if (v145)
      {
        uint64_t v146 = *(void *)v252;
        do
        {
          for (k = 0; k != v145; k = (char *)k + 1)
          {
            if (*(void *)v252 != v146) {
              objc_enumerationMutation(v144);
            }
            int v148 = *(void **)(*((void *)&v251 + 1) + 8 * (void)k);
            if (sub_1000431DC(v148))
            {
              unsigned int v149 = [(id)qword_1000A8F28 containsObject:v148];
              uint64_t v150 = *(void **)(v0 + 128);
              if (v149)
              {
                id v151 = [v150 objectForKey:v148];
                uint64_t v152 = [v151 resultSet];
                [v152 removeAllObjects];
              }
              else
              {
                [v150 removeObjectForKey:v148];
              }
            }
          }
          id v145 = [v144 countByEnumeratingWithState:&v251 objects:v285 count:16];
        }
        while (v145);
      }
    }
    else
    {
      int v143 = v127;
    }
    id v153 = [*(id *)(v0 + 136) copy];
    dispatch_suspend(*(dispatch_object_t *)(v0 + 192));
    uint64_t v154 = +[SDController rankQueue];
    qos_class_t v155 = qos_class_self();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100043254;
    block[3] = &unk_100093588;
    id v156 = WeakRetained;
    uint64_t v157 = *(void *)(v0 + 176);
    id v224 = v156;
    uint64_t v225 = v157;
    id v226 = *(id *)(v0 + 80);
    id v227 = *(id *)(v0 + 184);
    char v248 = *(unsigned char *)(v0 + 347);
    __int16 v249 = *(_WORD *)(v0 + 348);
    char v250 = *(unsigned char *)(v0 + 344);
    uint64_t v158 = *(void *)(v0 + 40);
    void block[4] = *(void *)(v0 + 32);
    block[5] = v158;
    id v228 = *(id *)(v0 + 200);
    id v229 = *(id *)(v0 + 208);
    id v230 = *(id *)(v0 + 216);
    id v231 = *(id *)(v0 + 144);
    id v232 = *(id *)(v0 + 152);
    id v233 = *(id *)(v0 + 160);
    id v234 = *(id *)(v0 + 224);
    id v235 = *(id *)(v0 + 232);
    id v133 = v143;
    __int16 v236 = v133;
    id v159 = v153;
    uint64_t v160 = *(void *)(v0 + 280);
    id v237 = v159;
    uint64_t v244 = v160;
    id v238 = v198;
    id v161 = *(id *)(v0 + 112);
    uint64_t v162 = *(void *)(v0 + 288);
    id v239 = v161;
    uint64_t v245 = v162;
    id v163 = *(id *)(v0 + 104);
    uint64_t v164 = *(void *)(v0 + 296);
    id v240 = v163;
    uint64_t v246 = v164;
    id v241 = *(id *)(v0 + 240);
    id v242 = *(id *)(v0 + 248);
    uint64_t v247 = *(void *)(v0 + 336);
    id v243 = *(id *)(v0 + 192);
    dispatch_block_t v165 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v155, 0, block);
    tracing_dispatch_async();

    [v156 externalID];
    CFNullRef v166 = [(id)objc_opt_class() description];
    CFNullRef v167 = +[NSNumber numberWithLong:*(void *)(*(void *)(*(void *)(v0 + 264) + 8) + 24)];
    SDTraceAdd();

    goto LABEL_256;
  }
  [WeakRetained setNeedsReRunForFuzzy:1];
  if ([*(id *)(v0 + 104) pommes])
  {
    id v173 = [WeakRetained copyMatchInfo];
    __int16 v222 = +[NSMutableDictionary dictionary];
    long long v274 = 0u;
    long long v275 = 0u;
    long long v272 = 0u;
    long long v273 = 0u;
    os_log_t osloga = (os_log_t)v173;
    id v174 = [osloga countByEnumeratingWithState:&v272 objects:v287 count:16];
    if (v174)
    {
      uint64_t v175 = *(void *)v273;
      do
      {
        for (m = 0; m != v174; m = (char *)m + 1)
        {
          if (*(void *)v273 != v175) {
            objc_enumerationMutation(osloga);
          }
          id v177 = *(id *)(*((void *)&v272 + 1) + 8 * (void)m);

          _MDPlistGetRootPlistObjectFromPlist();
          v267 = _NSConcreteStackBlock;
          uint64_t v268 = 3221225472;
          v269 = sub_100042DDC;
          v270 = &unk_100093538;
          id v271 = v222;
          _MDPlistDictionaryIterate();
          CFRelease(v177);
        }
        id v174 = [osloga countByEnumeratingWithState:&v272 objects:v287 count:16];
      }
      while (v174);
    }

    long long v178 = SPLogForSPLogCategoryDefault();
    os_log_type_t v179 = gSPLogInfoAsDefault ^ 1;
    if (os_log_type_enabled(v178, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
    {
      id v180 = [*(id *)(v0 + 104) queryID];
      *(_DWORD *)buf = 134217984;
      *(void *)&uint8_t buf[4] = v180;
      _os_log_impl((void *)&_mh_execute_header, v178, v179, "[rewrite] qid=%ld Fetching Spotlight rewrite candidates.", buf, 0xCu);
    }

    uint64_t v181 = si_tracing_current_span();
    *(_OWORD *)buf = *(_OWORD *)v181;
    long long v303 = *(_OWORD *)(v181 + 16);
    uint64_t v304 = *(void *)(v181 + 32);
    long long v182 = +[SPCoreSpotlightIndexer sharedInstance];
    uint64_t v183 = *(void *)(v0 + 104);
    uint64_t v184 = *(void *)(v0 + 184);
    v259[0] = _NSConcreteStackBlock;
    v259[1] = 3221225472;
    v259[2] = sub_100042EBC;
    v259[3] = &unk_100093560;
    objc_copyWeak(&v262, (id *)(v0 + 304));
    objc_copyWeak(&v263, (id *)(v0 + 312));
    long long v264 = *(_OWORD *)buf;
    long long v265 = v303;
    uint64_t v266 = v304;
    id v185 = *(id *)(v0 + 104);
    uint64_t v186 = *(void *)(v0 + 176);
    id v260 = v185;
    uint64_t v261 = v186;
    [v182 rewriteQueryWithQueryString:v184 context:v183 matchInfo:v222 rewriteHandler:v259];

    objc_destroyWeak(&v263);
    objc_destroyWeak(&v262);
  }
  else
  {
    id v188 = [*(id *)(v0 + 176) performQuery:WeakRetained isCorrectedQuery:0 reuseTask:v198 needsFuzzy:1 pommesRewrite:0 embeddingsRequery:0];
  }
LABEL_260:
}

void sub_100042D3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void *sub_100042D78(void *result, uint64_t a2)
{
  *(void *)(result[5] + 8 * (*(void *)(*(void *)(result[4] + 8) + 24) + result[6])) = a2;
  ++*(void *)(*(void *)(result[4] + 8) + 24);
  return result;
}

void *sub_100042DA8(void *result, uint64_t a2)
{
  *(void *)(result[5] + 8 * (result[7] + result[6] + (*(void *)(*(void *)(result[4] + 8) + 24))++)) = a2;
  return result;
}

void sub_100042DDC(uint64_t a1, uint64_t a2, uint64_t a3, long long *a4)
{
  long long v14 = *a4;
  uint64_t v15 = *((void *)a4 + 2);
  uint64_t IntValue = _MDPlistNumberGetIntValue();
  BOOL v7 = *(void **)(a1 + 32);
  CFIndex v8 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2, v14, v15);
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = (char *)[v9 longLongValue] + IntValue;

  uint64_t v11 = +[NSNumber numberWithLongLong:v10];
  uint64_t v12 = *(void **)(a1 + 32);
  id v13 = +[NSString stringWithUTF8String:a2];
  [v12 setObject:v11 forKeyedSubscript:v13];
}

void sub_100042EBC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v9 = v8;
  if (WeakRetained && v8)
  {
    uint64_t v10 = si_tracing_current_span();
    long long v28 = *(_OWORD *)v10;
    long long v29 = *(_OWORD *)(v10 + 16);
    uint64_t v30 = *(void *)(v10 + 32);
    uint64_t v11 = *(void *)(a1 + 96);
    long long v12 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v10 + 16) = v12;
    *(void *)(v10 + 32) = v11;
    long long v25 = *(_OWORD *)(a1 + 64);
    long long v26 = *(_OWORD *)(a1 + 80);
    uint64_t v27 = *(void *)(a1 + 96);
    uint64_t v13 = *(void *)v10;
    uint64_t spanid = si_tracing_calc_next_spanid();
    uint64_t v15 = *(void *)(v10 + 8);
    *(void *)uint64_t v10 = v13;
    *(void *)(v10 + _Block_object_dispose(&STACK[0x378], 8) = spanid;
    *(void *)(v10 + 16) = v15;
    *(unsigned char *)(v10 + 2_Block_object_dispose(&STACK[0x378], 8) = 102;
    *(void *)(v10 + 32) = "SPCoreSpotlightIndexer rewriteHandler";
    si_tracing_log_span_begin();
    if (v6)
    {
      uint64_t v16 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100065B6C((uint64_t)v6, buf, (uint64_t)objc_msgSend(*(id *)(a1 + 32), "queryID", v25, v26, v27), v16);
      }
    }
    else
    {
      if (objc_msgSend(v5, "count", v25, v26, v27))
      {
        uint64_t v18 = SPLogForSPLogCategoryDefault();
        os_log_type_t v19 = gSPLogInfoAsDefault ^ 1;
        if (os_log_type_enabled(v18, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
        {
          id v20 = [*(id *)(a1 + 32) queryID];
          *(_DWORD *)buf = 134217984;
          id v32 = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "[rewrite] qid=%ld Fetching Spotlight rewrite candidates finished.", buf, 0xCu);
        }

        uint64_t v21 = *(void **)(a1 + 40);
        id v22 = [v5 firstObject];
        id v23 = [v21 performQuery:WeakRetained isCorrectedQuery:0 reuseTask:v9 needsFuzzy:1 pommesRewrite:v22 embeddingsRequery:0];

        goto LABEL_11;
      }
      uint64_t v16 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = [*(id *)(a1 + 32) queryID];
        *(_DWORD *)buf = 134217984;
        id v32 = v24;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[rewrite] qid=%ld No rewrite candidates for Spotlight query.", buf, 0xCu);
      }
    }

    id v17 = [*(id *)(a1 + 40) performQuery:WeakRetained isCorrectedQuery:0 reuseTask:v9 needsFuzzy:1 pommesRewrite:0 embeddingsRequery:0];
LABEL_11:
    si_tracing_log_span_end();
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
  }
}

void sub_100043188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, long long a15, long long a16, uint64_t a17)
{
  sub_1000067B0((uint64_t)&a9);
  long long v19 = a16;
  *(_OWORD *)uint64_t v17 = a15;
  *(_OWORD *)(v17 + 16) = v19;
  *(void *)(v17 + 32) = a17;
  _Unwind_Resume(a1);
}

uint64_t sub_1000431DC(void *a1)
{
  id v1 = a1;
  if (v1 && ([(id)qword_1000A8F30 containsObject:v1] & 1) == 0)
  {
    if (qword_1000A8F38 && SSPriorityIndexLimitBundles()) {
      uint64_t v2 = (uint64_t)[(id)qword_1000A8F38 containsObject:v1];
    }
    else {
      uint64_t v2 = 1;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__n128 sub_100043254(uint64_t a1)
{
  uint64_t v2 = si_tracing_current_span();
  __n128 v7 = *(__n128 *)v2;
  long long v8 = *(_OWORD *)(v2 + 16);
  uint64_t v9 = *(void *)(v2 + 32);
  uint64_t v3 = *(void *)v2;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v5 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + _Block_object_dispose(&STACK[0x378], 8) = spanid;
  *(void *)(v2 + 16) = v5;
  *(unsigned char *)(v2 + 2_Block_object_dispose(&STACK[0x378], 8) = 102;
  *(void *)(v2 + 32) = "SPCoreSpotlightDatastore ranking";
  si_tracing_log_span_begin();
  if (([*(id *)(a1 + 48) cancelled] & 1) == 0) {
    sub_1000433C0(*(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 72), *(unsigned __int8 *)(a1 + 240), *(unsigned __int8 *)(a1 + 241), *(unsigned __int8 *)(a1 + 242), *(unsigned __int8 *)(a1 + 243), *(double *)(a1 + 232), *(void *)(a1 + 176), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void **)(a1 + 80), *(void **)(a1 + 88), *(void **)(a1 + 96), *(void **)(a1 + 104), *(void **)(a1 + 112), *(void **)(a1 + 120), *(void **)(a1 + 128), *(void **)(a1 + 136),
  }
      *(void **)(a1 + 144),
      *(void **)(a1 + 152),
      *(void **)(*(void *)(*(void *)(a1 + 208) + 8) + 40),
      *(void **)(a1 + 160),
      *(void **)(a1 + 48),
      *(void **)(a1 + 168),
      (double *)(*(void *)(*(void *)(a1 + 216) + 8) + 24),
      *(void **)(a1 + 176),
      *(void *)(*(void *)(a1 + 224) + 8) + 32,
      *(void **)(a1 + 184),
      *(void **)(a1 + 192));
  dispatch_resume(*(dispatch_object_t *)(a1 + 200));
  si_tracing_log_span_end();
  __n128 result = v7;
  *(__n128 *)uint64_t v2 = v7;
  *(_OWORD *)(v2 + 16) = v8;
  *(void *)(v2 + 32) = v9;
  return result;
}

void sub_1000433A8(_Unwind_Exception *a1)
{
  sub_1000067B0(v1 - 96);
  _Unwind_Resume(a1);
}

void sub_1000433C0(void *a1, void *a2, void *a3, int a4, unsigned int a5, int a6, int a7, double a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,double *a26,void *a27,uint64_t a28,void *a29,void *a30)
{
  id v177 = a1;
  id v165 = a2;
  id v164 = a3;
  id v163 = a12;
  id v162 = a13;
  id v166 = a14;
  id v167 = a15;
  id v168 = a16;
  id v169 = a17;
  id v170 = a18;
  id v171 = a19;
  id v181 = a20;
  id v176 = a21;
  id v182 = a22;
  id v172 = a23;
  id v33 = a24;
  id v179 = a25;
  id v175 = a27;
  id v173 = a29;
  id v174 = a30;
  id v34 = [v33 queryIdent];
  uint64_t v183 = v33;
  id v35 = [v33 queryContext];
  id v36 = [v35 searchString];
  +[SSRankingManager logSections:v181 prefix:@"L1 rankLocalItems" queryId:v34 query:v36];

  os_log_type_t v37 = [v183 queryContext];
  id v38 = [v37 queryKind];
  id v39 = [v183 queryContext];
  id v40 = [v39 clientBundleID];
  if (qword_1000A9020 != -1) {
    dispatch_once(&qword_1000A9020, &stru_100093820);
  }
  if (byte_1000A9019) {
    goto LABEL_4;
  }
  if (!byte_1000A9018)
  {
    unsigned int obj = 0;
    goto LABEL_6;
  }
  if (([v40 hasPrefix:@"com.apple.omniSearch"] & 1) != 0
    || ([v40 hasPrefix:@"com.apple.intelligenceflow"] & 1) != 0)
  {
LABEL_4:
    int v41 = 1;
  }
  else
  {
    unsigned int v67 = [v40 hasPrefix:@"com.apple.ondeviceeval"];
    if (v38 == (id)12) {
      int v41 = 1;
    }
    else {
      int v41 = v67;
    }
  }
  unsigned int obj = v41;
LABEL_6:

  id v42 = [v183 queryContext];
  [v179 parseQUQuery:v42 isSearchToolClient:obj];

  os_log_type_t v43 = SPLogForSPLogCategoryRanking();
  unsigned int v44 = [v183 externalID];
  if (v44)
  {
    unsigned int v45 = v44;
    if (os_signpost_enabled(v43))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_BEGIN, v45, "coreSpotlightRankingLatency", (const char *)&unk_10007BB1B, buf, 2u);
    }
  }

  __uint64_t v46 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  *(void *)buf = 0;
  uint64_t v301 = buf;
  uint64_t v302 = 0x3032000000;
  long long v303 = sub_10003E634;
  uint64_t v304 = sub_10003E644;
  id v305 = 0;
  id v305 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v294 = 0;
  id v295 = &v294;
  uint64_t v296 = 0x3032000000;
  id v297 = sub_10003E634;
  __int16 v298 = sub_10003E644;
  id v299 = 0;
  id v299 = objc_alloc_init((Class)NSMutableDictionary);
  v292[0] = 0;
  v292[1] = v292;
  v292[2] = 0x3032000000;
  v292[3] = sub_10003E634;
  v292[4] = sub_10003E644;
  id v293 = 0;
  uint64_t v288 = 0;
  v289 = &v288;
  uint64_t v290 = 0x2020000000;
  id v291 = 0;
  id v291 = [v176 count];
  if (v289[3])
  {
    id v47 = objc_alloc((Class)NSMutableArray);
    id v184 = [v47 initWithCapacity:v289[3]];
    [v183 externalID];
    kdebug_trace();
    id v48 = (char *)[v181 count];
    uint64_t v287 = 0;
    uint64_t v286 = 0;
    uint64_t v285 = 0;
    [(id)objc_opt_class() modifyBatchSize:&v287 batchIncrement:&v286 batches:&v285 withSectionsCount:v48];
    id v49 = objc_alloc((Class)NSMutableArray);
    id v50 = [v49 initWithCapacity:v285];
    if (v48)
    {
      unsigned __int8 v51 = v48;
      do
      {
        [v50 addObject:kCFNull];
        --v51;
      }
      while (v51);
    }
    uint64_t v52 = dispatch_get_global_queue(33, 0);
    id v271 = _NSConcreteStackBlock;
    uint64_t v272 = 3221225472;
    long long v273 = sub_10004B130;
    long long v274 = &unk_100093870;
    id v53 = v183;
    id v275 = v53;
    uint64_t v282 = v287;
    v283 = v48;
    id v186 = v181;
    id v276 = v186;
    v280 = v292;
    id v54 = v179;
    id v277 = v54;
    v284 = a26;
    id v55 = v175;
    id v278 = v55;
    v281 = &v288;
    id v191 = v50;
    id v279 = v191;
    tracing_dispatch_apply();

    if (v48)
    {
      for (i = 0; i != v48; ++i)
      {
        CFNullRef v57 = [v191 objectAtIndexedSubscript:i];
        if (v57 != kCFNull)
        {
          uint64_t v58 = [v191 objectAtIndexedSubscript:i];
          [v184 addObjectsFromArray:v58];
        }
      }
    }
    [v53 externalID];
    kdebug_trace();
    *(void *)(a28 + _Block_object_dispose(&STACK[0x378], 8) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v46;
    if ([v53 cancelled]) {
      goto LABEL_126;
    }
    uint64_t v192 = objc_opt_new();
    long long v270 = 0u;
    long long v269 = 0u;
    long long v268 = 0u;
    long long v267 = 0u;
    id v59 = v184;
    id v60 = [v59 countByEnumeratingWithState:&v267 objects:v316 count:16];
    if (v60)
    {
      uint64_t v61 = 0;
      uint64_t v62 = *(void *)v268;
      do
      {
        for (j = 0; j != v60; j = (char *)j + 1)
        {
          if (*(void *)v268 != v62) {
            objc_enumerationMutation(v59);
          }
          if (*(const CFNullRef *)(*((void *)&v267 + 1) + 8 * (void)j) == kCFNull) {
            [v192 addIndex:(char *)j + v61];
          }
        }
        id v60 = [v59 countByEnumeratingWithState:&v267 objects:v316 count:16];
        v61 += (uint64_t)j;
      }
      while (v60);
    }

    [v59 removeObjectsAtIndexes:v192];
    [v53 externalID];
    kdebug_trace();
    __uint64_t v64 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    id v65 = [v55 fetchAttributes];
    if ([v65 containsObject:MDItemPhotosL2Signals]) {
      uint64_t v66 = 1;
    }
    else {
      uint64_t v66 = (uint64_t)[v55 fetchl2Signals];
    }

    unsigned int v70 = v177[8];
    SPL2Threshold();
    objc_msgSend(v54, "updateScoresForPreparedItems:isCJK:clientBundleID:thresholdValue:queryNodeMatchInfo:collectL2Signals:", v59, (v70 >> 1) & 1, 0, 0, v66);
    [v173 setNanosecondInterval:clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v64];
    [v174 setNanosecondInterval:(unint64_t)(*a26 * 1000000000.0)];
    uint64_t v71 = +[SPFeedbackProxy sharedProxy];
    id v72 = [v53 queryIdent];
    CFIndex v73 = [v53 connection];
    uint64_t v74 = [v73 bundleID];
    [v71 sendFeedbackType:21 feedback:v174 queryId:v72 clientID:v74];

    [v53 externalID];
    kdebug_trace();
    uint64_t v75 = +[SPFeedbackProxy sharedProxy];
    id v76 = [v53 queryIdent];
    unint64_t v77 = [v53 connection];
    int v78 = [v77 bundleID];
    [v75 sendFeedbackType:21 feedback:v173 queryId:v76 clientID:v78];

    if ([v53 cancelled])
    {
LABEL_125:

LABEL_126:
      uint64_t v69 = v184;
LABEL_127:

      goto LABEL_128;
    }
    __uint64_t v79 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
    v265[0] = 0;
    v265[1] = v265;
    v265[2] = 0x3032000000;
    v265[3] = sub_10003E634;
    v265[4] = sub_10003E644;
    id v266 = 0;
    long long v256 = _NSConcreteStackBlock;
    uint64_t v257 = 3221225472;
    long long v258 = sub_10004BE78;
    v259 = &unk_1000928E8;
    id v80 = v53;
    id v260 = v80;
    uint64_t v263 = v287;
    long long v264 = v48;
    id v81 = v186;
    id v261 = v81;
    uint64_t v82 = v177;
    id v262 = v82;
    tracing_dispatch_apply();
    if ([v80 cancelled])
    {
LABEL_124:

      _Block_object_dispose(v265, 8);
      goto LABEL_125;
    }
    id v232 = _NSConcreteStackBlock;
    uint64_t v233 = 3221225472;
    id v234 = sub_10004C798;
    id v235 = &unk_1000938E8;
    id v180 = v80;
    id v236 = v180;
    uint64_t v250 = v287;
    long long v251 = v48;
    id v83 = v81;
    id v237 = v83;
    double v252 = a8;
    id v238 = v165;
    char v253 = a4;
    char v254 = a7;
    id v84 = v172;
    id v239 = v84;
    id v240 = v166;
    id v241 = v167;
    id v242 = v168;
    id v243 = v169;
    id v244 = v171;
    char v255 = obj;
    id v245 = v170;
    uint64_t v246 = &v294;
    uint64_t v247 = buf;
    char v248 = v265;
    __int16 v249 = v292;
    tracing_dispatch_apply();
    if ([v180 cancelled])
    {
LABEL_123:

      goto LABEL_124;
    }
    uint64_t v157 = v84;
    if ([(id)v295[5] count])
    {
      id v154 = v83;
      qos_class_t v155 = v82;
      __uint64_t v156 = v79;
      id v85 = [(id)v295[5] keysSortedByValueUsingComparator:&stru_100093908];
      id v86 = [v85 mutableCopy];

      uint64_t v87 = [*((id *)v301 + 5) keysSortedByValueUsingComparator:&stru_100093928];
      id v88 = [v87 mutableCopy];

      id v89 = objc_alloc((Class)NSMutableArray);
      id v188 = objc_msgSend(v89, "initWithCapacity:", objc_msgSend(*((id *)v301 + 5), "count"));
      id v90 = objc_alloc((Class)NSMutableArray);
      id v178 = objc_msgSend(v90, "initWithCapacity:", objc_msgSend((id)v295[5], "count"));
      long long v230 = 0u;
      long long v231 = 0u;
      long long v228 = 0u;
      long long v229 = 0u;
      id obja = v88;
      id v91 = 0;
      id v92 = [obja countByEnumeratingWithState:&v228 objects:v315 count:16];
      if (v92)
      {
        uint64_t v93 = *(void *)v229;
        do
        {
          for (k = 0; k != v92; k = (char *)k + 1)
          {
            if (*(void *)v229 != v93) {
              objc_enumerationMutation(obja);
            }
            int v95 = [*((id *)v301 + 5) objectForKeyedSubscript:*(void *)(*((void *)&v228 + 1) + 8 * (void)k)];
            [v188 addObject:v95];
            if (!v91) {
              id v91 = objc_alloc_init((Class)NSMutableSet);
            }
            int v96 = [v95 title];
            id v97 = [v96 text];

            if (v97)
            {
              uint64_t v98 = [v95 title];
              CFHashCode v99 = [v98 text];
              int v100 = [v99 lowercaseString];
              [v91 addObject:v100];
            }
          }
          id v92 = [obja countByEnumeratingWithState:&v228 objects:v315 count:16];
        }
        while (v92);
      }

      [v163 setResults:v188];
      long long v226 = 0u;
      long long v227 = 0u;
      long long v224 = 0u;
      long long v225 = 0u;
      id v187 = v86;
      id v101 = [v187 countByEnumeratingWithState:&v224 objects:v314 count:16];
      if (v101)
      {
        uint64_t v102 = *(void *)v225;
        uint64_t v185 = SSSectionIdentifierPeopleSuggestions;
        do
        {
          for (m = 0; m != v101; m = (char *)m + 1)
          {
            if (*(void *)v225 != v102) {
              objc_enumerationMutation(v187);
            }
            int v104 = [(id)v295[5] objectForKeyedSubscript:*(void *)(*((void *)&v224 + 1) + 8 * (void)m)];
            os_log_type_t v105 = [v104 title];
            unsigned __int8 v106 = [v105 text];
            id v107 = [v106 lowercaseString];

            unsigned __int8 v108 = [v104 sectionBundleIdentifier];
            unsigned __int8 v109 = v108;
            if (v108) {
              unsigned int v110 = [v108 isEqual:v185];
            }
            else {
              unsigned int v110 = 0;
            }
            unsigned __int8 v111 = [v104 contactIdentifier];

            if (v111)
            {
              if ([obja count])
              {
                unsigned int v112 = (void *)*((void *)v301 + 5);
                os_log_type_t v113 = [v104 contactIdentifier];
                uint64_t v114 = [v112 objectForKeyedSubscript:v113];

                if (v114)
                {
                  id v115 = [v104 personIdentifier];
                  [v114 setPersonIdentifier:v115];

                  id v116 = [v104 personQueryIdentifier];
                  [v114 setPersonQueryIdentifier:v116];

                  id v117 = (v110 & 1) != 0 ? (id)1 : [v114 hasTextContentMatch];
                  [v114 setHasTextContentMatch:v117];
                  [v104 rankingScore];
                  objc_msgSend(v114, "setRankingScore:");
                  [v114 setType:37];
                  if ([v114 hasTextContentMatch])
                  {
                    long long v121 = [v180 queryContext];
                    long long v122 = +[SSSuggestionResultBuilder buildResultWithResult:v114 queryContext:v121];

                    os_unfair_lock_lock(&stru_1000A8FF8);
                    [v182 addObject:v122];
                    os_unfair_lock_unlock(&stru_1000A8FF8);
                  }
                }

                goto LABEL_78;
              }
            }
            else if ([v91 containsObject:v107])
            {
              goto LABEL_78;
            }
            [v104 rankingScore];
            if (v118 > 0.0)
            {
              if (v110)
              {
                id v119 = [v180 queryContext];
                id v120 = +[SSSuggestionResultBuilder buildResultWithResult:v104 queryContext:v119];

                os_unfair_lock_lock(&stru_1000A8FF8);
                [v182 addObject:v120];
                os_unfair_lock_unlock(&stru_1000A8FF8);
              }
              [v178 addObject:v104];
            }
LABEL_78:
          }
          id v101 = [v187 countByEnumeratingWithState:&v224 objects:v314 count:16];
        }
        while (v101);
      }

      [v162 setResults:v178];
    }
    else
    {
      if (![*((id *)v301 + 5) count])
      {
LABEL_92:
        if (a7)
        {
          id v129 = v83;
        }
        else
        {
          id v129 = [(id)objc_opt_class() removedDuplicatePhotosSectionsFromSections:v83 isPhotosScopedSearch:a5];
        }
        id v130 = v129;
        id v131 = [v129 count];
        [(id)objc_opt_class() modifyBatchSize:&v287 batchIncrement:&v286 batches:&v285 withSectionsCount:v131];
        long long v208 = _NSConcreteStackBlock;
        uint64_t v209 = 3221225472;
        uint64_t v210 = sub_10004D6CC;
        v211 = &unk_100093950;
        id v214 = v180;
        uint64_t v218 = v287;
        id v219 = v131;
        id v215 = v130;
        id v216 = v82;
        id v217 = v164;
        uint64_t v212 = a10;
        uint64_t v213 = a11;
        tracing_dispatch_apply();
        uint64_t v197 = _NSConcreteStackBlock;
        uint64_t v198 = 3221225472;
        id v199 = sub_10004D850;
        int v200 = &unk_100093978;
        id v132 = v214;
        id v201 = v132;
        uint64_t v206 = v287;
        id v207 = v131;
        id v133 = v215;
        id v202 = v133;
        id v134 = v157;
        id v203 = v134;
        long long v204 = v292;
        unint64_t v205 = v265;
        tracing_dispatch_apply();
        *(void *)(a28 + 16) = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW) - v79;
        id v135 = [v134 resultPipe];
        if ([v132 cancelled]) {
          id v136 = "canceled";
        }
        else {
          id v136 = "finished";
        }
        unint64_t v137 = sub_10001EDF8(v135, v136, "corespotlight", *(void *)a28, "rankprep", *(void *)(a28 + 8), "resultprep", *(void *)(a28 + 16), 0, 0);

        uint64_t v138 = SPLogForSPLogCategoryQuery();
        os_log_type_t v139 = gSPLogInfoAsDefault ^ 1;
        if (os_log_type_enabled(v138, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
        {
          id v140 = (id)objc_opt_class();
          unsigned int v141 = [v132 cancelled];
          int v142 = "";
          *(_DWORD *)v307 = 138412802;
          id v308 = v140;
          if (v141) {
            int v142 = " canceled";
          }
          __int16 v309 = 2048;
          double v310 = (double)v137 / 1000000000.0;
          __int16 v311 = 2080;
          v312 = v142;
          _os_log_impl((void *)&_mh_execute_header, v138, v139, "- Datastore %@ time %g%s", v307, 0x20u);
        }
        if ([v132 cancelled])
        {
          int v143 = SPLogForSPLogCategoryTelemetry();
          unsigned int v144 = [v132 externalID];
          if (v144 && os_signpost_enabled(v143))
          {
            *(_WORD *)v307 = 0;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v143, OS_SIGNPOST_EVENT, v144, "coreSpotlightCancel", " enableTelemetry=YES ", v307, 2u);
          }
        }
        else
        {
          if (v131) {
            [v132 setPrefersLocalUserTypedSuggestion:(a4 | a6) ^ 1u];
          }
          os_unfair_lock_lock(&stru_1000A8FF8);
          if (v182)
          {
            id v145 = [v182 copy];
            [v134 setSuggestionResults:v145];
          }
          os_unfair_lock_unlock(&stru_1000A8FF8);
          if (a7)
          {
            int v143 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v133, "count"));
            long long v195 = 0u;
            long long v196 = 0u;
            long long v193 = 0u;
            long long v194 = 0u;
            id v146 = v133;
            id v147 = [v146 countByEnumeratingWithState:&v193 objects:v306 count:16];
            if (v147)
            {
              uint64_t v148 = *(void *)v194;
              do
              {
                for (n = 0; n != v147; n = (char *)n + 1)
                {
                  if (*(void *)v194 != v148) {
                    objc_enumerationMutation(v146);
                  }
                  uint64_t v150 = *(void **)(*((void *)&v193 + 1) + 8 * (void)n);
                  id v151 = [v150 bundleIdentifier];
                  if (sub_1000431DC(v151))
                  {
                    uint64_t v152 = [v150 mutableDeepCopy];
                    [v143 addObject:v152];
                  }
                }
                id v147 = [v146 countByEnumeratingWithState:&v193 objects:v306 count:16];
              }
              while (v147);
            }

            id v153 = [v134 suggestionResults];
            [v134 progressWithSections:v143 suggestionResults:v153];
          }
          else
          {
            int v143 = [v134 suggestionResults];
            [v134 finishWithSections:v133 suggestionResults:v143];
          }
        }

        goto LABEL_123;
      }
      id v154 = v83;
      qos_class_t v155 = v82;
      __uint64_t v156 = v79;
      id v123 = objc_alloc((Class)NSMutableArray);
      id v187 = objc_msgSend(v123, "initWithCapacity:", objc_msgSend(*((id *)v301 + 5), "count"));
      long long v222 = 0u;
      long long v223 = 0u;
      long long v220 = 0u;
      long long v221 = 0u;
      id v124 = *((id *)v301 + 5);
      id v125 = [v124 countByEnumeratingWithState:&v220 objects:v313 count:16];
      if (v125)
      {
        uint64_t v126 = *(void *)v221;
        do
        {
          for (ii = 0; ii != v125; ii = (char *)ii + 1)
          {
            if (*(void *)v221 != v126) {
              objc_enumerationMutation(v124);
            }
            id v128 = [*((id *)v301 + 5) objectForKeyedSubscript:*(void *)(*((void *)&v220 + 1) + 8 * (void)ii)];
            [v187 addObject:v128];
          }
          id v125 = [v124 countByEnumeratingWithState:&v220 objects:v313 count:16];
        }
        while (v125);
      }

      [v163 setResults:v187];
    }

    uint64_t v82 = v155;
    __uint64_t v79 = v156;
    id v83 = v154;
    goto LABEL_92;
  }
  if ((a7 & 1) == 0)
  {
    os_unfair_lock_lock(&stru_1000A8FF8);
    if (v182)
    {
      id v68 = [v182 copy];
      [v172 setSuggestionResults:v68];
    }
    os_unfair_lock_unlock(&stru_1000A8FF8);
    uint64_t v69 = [v172 suggestionResults];
    [v172 finishWithSections:0 suggestionResults:v69];
    goto LABEL_127;
  }
LABEL_128:
  _Block_object_dispose(&v288, 8);
  _Block_object_dispose(v292, 8);

  _Block_object_dispose(&v294, 8);
  _Block_object_dispose(buf, 8);
}

void sub_100044C24(_Unwind_Exception *a1)
{
}

void sub_100044D58(uint64_t a1, void *a2)
{
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = si_tracing_current_span();
  long long v14 = *(_OWORD *)v5;
  long long v15 = *(_OWORD *)(v5 + 16);
  uint64_t v16 = *(void *)(v5 + 32);
  uint64_t v6 = *(void *)(a1 + 88);
  long long v7 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)uint64_t v5 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v5 + 16) = v7;
  *(void *)(v5 + 32) = v6;
  uint64_t v8 = *(void *)v5;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v10 = *(void *)(v5 + 8);
  *(void *)uint64_t v5 = v8;
  *(void *)(v5 + _Block_object_dispose(&STACK[0x570], 8) = spanid;
  *(void *)(v5 + 16) = v10;
  *(unsigned char *)(v5 + 2_Block_object_dispose(&STACK[0x570], 8) = 102;
  *(void *)(v5 + 32) = "SPCoreSpotlightDatastore completionHandler";
  si_tracing_log_span_begin();
  if (WeakRetained[56])
  {
    uint64_t v11 = [v4 timeoutTimer];
    long long v12 = v11;
    if (v11)
    {
      dispatch_source_cancel(v11);
      [v4 setTimeoutTimer:0];
    }
  }
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
  si_tracing_log_span_end();
  *(_OWORD *)uint64_t v5 = v14;
  *(_OWORD *)(v5 + 16) = v15;
  *(void *)(v5 + 32) = v16;
}

void sub_100044ECC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_100044FEC(id a1)
{
  dword_1000A9008 = get_thread_count();
}

void sub_100047688(_Unwind_Exception *a1)
{
}

void sub_1000478CC(void *a1, void *a2, void *a3)
{
  id v24 = a2;
  id v5 = a3;
  [v5 count];
  uint64_t Mutable = _MDStoreOIDArrayCreateMutable();
  long long v7 = (const void *)_MDPlistBytesCreateMutable();
  uint64_t v27 = (const void *)Mutable;
  _MDStoreOIDArrayBeginSequence();
  _MDPlistBytesBeginPlist();
  _MDPlistBytesBeginArray();
  _MDPlistBytesAddNull();
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v5;
  id v28 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v8;
        uint64_t v9 = *(void **)(*((void *)&v36 + 1) + 8 * v8);
        [v9 oid];
        _MDPlistBytesBeginArray();
        uint64_t v10 = [v9 bundleID];
        int v31 = SSPommesRankingForSectionBundle();

        uint64_t v30 = [v9 clientData];
        id v11 = [v30 count];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v12 = *(id *)(*(void *)(a1[5] + 8) + 40);
        id v13 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v33;
          do
          {
            uint64_t v16 = 0;
            do
            {
              if (*(void *)v33 != v15) {
                objc_enumerationMutation(v12);
              }
              unint64_t v17 = (unint64_t)[*(id *)(*((void *)&v32 + 1) + 8 * (void)v16) integerValue];
              if ((v17 & 0x8000000000000000) != 0 || v17 >= (unint64_t)v11)
              {
                CFNullRef v19 = kCFNull;
LABEL_17:
                id v20 = v19;
                goto LABEL_27;
              }
              if (v17 == *(void *)(*(void *)(a1[6] + 8) + 24))
              {
                if (!v31)
                {
                  objc_msgSend(v9, "scoreL1", v17);
                  +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
                  CFNullRef v19 = (const __CFNull *)objc_claimAutoreleasedReturnValue();
                  goto LABEL_17;
                }
                uint64_t v18 = objc_msgSend(v9, "rankingItem", v17);
                [v18 pommesL1Score];
                goto LABEL_25;
              }
              if (v17 == *(void *)(*(void *)(a1[7] + 8) + 24))
              {
                uint64_t v21 = objc_msgSend(v9, "rankingItem", v17);
                uint64_t v18 = v21;
                if (v31) {
                  [v21 l2Score];
                }
                else {
                  [v21 score];
                }
LABEL_25:
                uint64_t v22 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
                goto LABEL_26;
              }
              if (v17 != *(void *)(*(void *)(a1[8] + 8) + 24))
              {
                CFNullRef v19 = [v30 objectAtIndexedSubscript:v17];
                goto LABEL_17;
              }
              uint64_t v18 = objc_msgSend(v9, "rankingItem", v17);
              uint64_t v22 = [v18 l2Signals];
LABEL_26:
              id v20 = (void *)v22;

LABEL_27:
              __MDPlistBytesAddObject();

              uint64_t v16 = (char *)v16 + 1;
            }
            while (v14 != v16);
            id v23 = [v12 countByEnumeratingWithState:&v32 objects:v40 count:16];
            id v14 = v23;
          }
          while (v23);
        }

        _MDPlistBytesEndArray();
        _MDStoreOIDArrayAddOID();

        uint64_t v8 = v29 + 1;
      }
      while ((id)(v29 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v28);
  }

  _MDPlistBytesEndArray();
  _MDPlistBytesEndPlist();
  _MDStoreOIDArrayEndSequence();
  (*(void (**)(void))(a1[4] + 16))();
  CFRelease(v7);
  CFRelease(v27);
}

void sub_100047CD4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  kdebug_trace();
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100047E04;
  v8[3] = &unk_100093670;
  id v9 = *(id *)(a1 + 32);
  long long v7 = *(_OWORD *)(a1 + 80);
  int8x16_t v13 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
  long long v14 = v7;
  id v10 = *(id *)(a1 + 40);
  char v16 = *(unsigned char *)(a1 + 96);
  id v11 = *(id *)(a1 + 48);
  char v17 = *(unsigned char *)(a1 + 97);
  id v12 = *(id *)(a1 + 56);
  uint64_t v15 = a3;
  [v6 enumerateTopHitResultsByBundle:v5 addingToItems:0 withHandler:v8];
}

void sub_100047E04(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v38 = a2;
  id v7 = a3;
  id v35 = a4;
  objc_msgSend(*(id *)(a1 + 32), "prepareItemsForL1Ranking:inBundle:");
  long long v36 = v7;
  id v8 = [v7 mutableCopy];
  id obj = *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  objc_sync_enter(obj);
  id v9 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v38];
  id v10 = [v9 objectForKeyedSubscript:@"sparse"];
  [v8 addObjectsFromArray:v10];

  id v11 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v38];
  id v12 = [v11 objectForKeyedSubscript:@"dense"];
  [v8 addObjectsFromArray:v12];

  int8x16_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKeyedSubscript:v38];
  long long v14 = [v13 objectForKeyedSubscript:@"hybrid"];
  [v8 addObjectsFromArray:v14];

  uint64_t v15 = *(void *)(a1 + 80);
  char v16 = *(void **)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  uint64_t v17 = *(void *)(a1 + 88);
  uint64_t v18 = [*(id *)(a1 + 40) userQuery];
  id v19 = [*(id *)(a1 + 40) queryID];
  LODWORD(v7) = *(unsigned __int8 *)(a1 + 104);
  uint64_t v20 = *(void *)(a1 + 48);
  int v21 = *(unsigned __int8 *)(a1 + 105);
  [*(id *)(a1 + 32) currentTime];
  LOBYTE(v34) = v21 != 0;
  LOBYTE(v33) = v7 != 0;
  uint64_t v22 = objc_msgSend(v16, "selectFromBatch:withBundle:rankCount:maxCount:userQuery:queryID:isCJK:clientBundle:isKeyboardCJK:currentTime:", v8, v38, v15, v17, v18, v19, v33, v20, v34);

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v22 forKeyedSubscript:v38];
  objc_sync_exit(obj);

  id v23 = [v8 objectEnumerator];
  uint64_t v24 = [v23 nextObject];
  if (v24)
  {
    long long v25 = (void *)v24;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    id v28 = 0;
    BOOL v29 = 1;
    while (1)
    {
      uint64_t v30 = [v25 dataclass];

      if (!v29) {
        break;
      }
      if (v28 && ![v28 isEqualToString:v30]) {
        goto LABEL_8;
      }
      ++v26;
LABEL_10:

      id v32 = v30;
      long long v25 = [v23 nextObject];
      BOOL v29 = v25 != 0;
      id v28 = v32;
      if (!v25)
      {
        id v28 = v32;
        if (!v26)
        {

          goto LABEL_13;
        }
      }
    }
    if (!v28) {
      sub_100065BF0();
    }
LABEL_8:
    int v31 = objc_msgSend(v8, "subarrayWithRange:", v27, v26);
    if (![v31 count]) {
      sub_100065BC4();
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    v27 += v26;
    uint64_t v26 = v29;

    goto LABEL_10;
  }
LABEL_13:
}

void sub_100048148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
}

void sub_100048160(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  kdebug_trace();
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100048294;
  v13[3] = &unk_1000936C0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 80);
  id v14 = v7;
  uint64_t v20 = v8;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 64);
  id v15 = v9;
  uint64_t v18 = v10;
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 72);
  id v16 = v11;
  uint64_t v19 = v12;
  __int16 v22 = *(_WORD *)(a1 + 88);
  id v17 = *(id *)(a1 + 56);
  uint64_t v21 = a3;
  [v6 enumerateTopHitResultsByBundle:v5 addingToItems:0 withHandler:v13];
}

void sub_100048294(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v46 = a2;
  id v7 = a3;
  id v42 = a4;
  [*(id *)(a1 + 32) setTopHitMaxCount:*(void *)(a1 + 80)];
  uint64_t v8 = [*(id *)(a1 + 40) fetchAttributes];
  unsigned __int8 v44 = [v8 containsObject:MDItemPhotosL2Signals];

  os_log_type_t v43 = v7;
  id v9 = [v7 mutableCopy];
  uint64_t v10 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = [*(id *)(a1 + 40) userQuery];
  id v15 = [*(id *)(a1 + 40) queryID];
  uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  LOWORD(v7) = *(_WORD *)(a1 + 96);
  BYTE3(v41) = v44;
  BYTE2(v41) = [*(id *)(a1 + 40) privateQuery];
  LOWORD(v41) = (_WORD)v7;
  id v17 = objc_msgSend(v10, "rankBatch:withRanker:withBundle:clientBundle:maxCount:userQuery:queryID:rankingConfiguration:isCJK:isKeyboardCJK:privateQuery:collectL2Signals:", v9, v13, v46, v11, v12, v14, v15, v16, v41);

  [v9 addObjectsFromArray:v17];
  uint64_t v18 = [v9 objectEnumerator];
  uint64_t v19 = [v18 nextObject];
  unsigned int v45 = v17;
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    BOOL v24 = 1;
    while (1)
    {
      long long v25 = [v20 dataclass];

      if (!v24) {
        break;
      }
      if (v21 && ![v21 isEqualToString:v25]) {
        goto LABEL_8;
      }
      ++v22;
LABEL_10:

      id v27 = v25;
      uint64_t v20 = [v18 nextObject];
      BOOL v24 = v20 != 0;
      uint64_t v21 = v27;
      if (!v20)
      {
        uint64_t v21 = v27;
        if (!v22)
        {

          id v17 = v45;
          goto LABEL_13;
        }
      }
    }
    if (!v21) {
      sub_100065C48();
    }
LABEL_8:
    uint64_t v26 = objc_msgSend(v9, "subarrayWithRange:", v23, v22);
    if (![v26 count]) {
      sub_100065C1C();
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    v23 += v22;
    uint64_t v22 = v24;

    goto LABEL_10;
  }
LABEL_13:
  if (byte_1000A8F50 && [v17 count])
  {
    id v28 = objc_opt_new();
    BOOL v29 = objc_opt_new();
    [v28 setArrayOfRankingItems:v29];
    uint64_t v30 = [v17 objectAtIndexedSubscript:0];
    int v31 = [v30 bundleID];
    [v28 setBundleIdentifier:v31];

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v32 = v17;
    id v33 = [v32 countByEnumeratingWithState:&v47 objects:v52 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = *(void *)v48;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v48 != v35) {
            objc_enumerationMutation(v32);
          }
          long long v37 = [*(id *)(*((void *)&v47 + 1) + 8 * i) rankingItem];
          [v29 addObject:v37];
        }
        id v34 = [v32 countByEnumeratingWithState:&v47 objects:v52 count:16];
      }
      while (v34);
    }

    id v38 = +[SDTTRSupport getSharedInstance];
    long long v39 = [*(id *)(a1 + 40) userQuery];
    unsigned __int8 v51 = v28;
    id v40 = +[NSArray arrayWithObjects:&v51 count:1];
    [v38 dumpTTRDebugFilesForQuery:v39 sections:v40 enableKeyLogRanking:0];

    id v17 = v45;
  }
  kdebug_trace();
}

void sub_1000486C8(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v35 = a6;
  switch(a2)
  {
    case 0:
    case 6:
      if (([*(id *)(*(void *)(a1[10] + 8) + 40) canceled] & 1) == 0)
      {
        _MDStoreOIDArrayGetVectorCount();
        id v37 = v35;
        _MDStoreOIDArrayApplyBlock();
        id v8 = *(id *)(*(void *)(a1[9] + 8) + 40);
        uint64_t v9 = objc_opt_new();
        uint64_t v10 = *(void *)(a1[9] + 8);
        uint64_t v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;

        (*(void (**)(void))(a1[7] + 16))();
        *(void *)(*(void *)(a1[20] + 8) + 24) += [v8 count];
      }
      break;
    case 2:
      uint64_t v12 = *(void (**)(void))(a1[5] + 16);
      goto LABEL_22;
    case 7:
      _MDStoreOIDArrayGetVectorCount();
      _MDStoreOIDArrayApplyBlock();
      id v30 = *(id *)(*(void *)(a1[9] + 8) + 40);
      uint64_t v31 = objc_opt_new();
      uint64_t v32 = *(void *)(a1[9] + 8);
      id v33 = *(void **)(v32 + 40);
      *(void *)(v32 + 40) = v31;

      (*(void (**)(void))(a1[6] + 16))();
      break;
    case 8:
      uint64_t v12 = *(void (**)(void))(a1[5] + 16);
      goto LABEL_22;
    case 9:
      uint64_t v12 = *(void (**)(void))(a1[5] + 16);
LABEL_22:
      v12();
      break;
    default:
      id v34 = *(id *)(*(void *)(a1[8] + 8) + 40);
      objc_sync_enter(v34);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id obj = *(id *)(*(void *)(a1[8] + 8) + 40);
      id v13 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v39;
        do
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v39 != v14) {
              objc_enumerationMutation(obj);
            }
            uint64_t v16 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            id v17 = objc_alloc_init((Class)NSMutableArray);
            uint64_t v18 = [*(id *)(*(void *)(a1[8] + 8) + 40) objectForKeyedSubscript:v16];
            uint64_t v19 = [v18 objectForKeyedSubscript:@"sparse"];

            if (v19)
            {
              uint64_t v20 = [*(id *)(*(void *)(a1[8] + 8) + 40) objectForKeyedSubscript:v16];
              uint64_t v21 = [v20 objectForKeyedSubscript:@"sparse"];
              [v17 addObjectsFromArray:v21];
            }
            uint64_t v22 = objc_msgSend(*(id *)(*(void *)(a1[8] + 8) + 40), "objectForKeyedSubscript:", v16, v34);
            uint64_t v23 = [v22 objectForKeyedSubscript:@"dense"];

            if (v23)
            {
              BOOL v24 = [*(id *)(*(void *)(a1[8] + 8) + 40) objectForKeyedSubscript:v16];
              long long v25 = [v24 objectForKeyedSubscript:@"dense"];
              [v17 addObjectsFromArray:v25];
            }
            uint64_t v26 = [*(id *)(*(void *)(a1[8] + 8) + 40) objectForKeyedSubscript:v16];
            id v27 = [v26 objectForKeyedSubscript:@"hybrid"];

            if (v27)
            {
              id v28 = [*(id *)(*(void *)(a1[8] + 8) + 40) objectForKeyedSubscript:v16];
              BOOL v29 = [v28 objectForKeyedSubscript:@"hybrid"];
              [v17 addObjectsFromArray:v29];
            }
            (*(void (**)(void))(a1[4] + 16))();
          }
          id v13 = [obj countByEnumeratingWithState:&v38 objects:v42 count:16];
        }
        while (v13);
      }

      objc_sync_exit(v34);
      break;
  }
}

void sub_100048C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_100048CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  if (a5 >= 2)
  {
    uint64_t v6 = (uint64_t *)(a4 + 8);
    uint64_t v7 = a5 - 1;
    do
    {
      id v8 = objc_opt_new();
      uint64_t v9 = *v6++;
      [v8 setOid:v9];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v8];

      --v7;
    }
    while (v7);
  }
}

void sub_100048D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = (void *)_MDPlistBytesCopyChildPlistBytesAtIndex();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 1;
  v14[0] = _NSConcreteStackBlock;
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  v14[1] = 3221225472;
  v14[2] = sub_100048E74;
  v14[3] = &unk_100093738;
  uint64_t v16 = v24;
  long long v9 = *(_OWORD *)(a1 + 56);
  long long v17 = v7;
  long long v18 = v9;
  long long v10 = *(_OWORD *)(a1 + 88);
  long long v19 = *(_OWORD *)(a1 + 72);
  long long v20 = v10;
  uint64_t v11 = *(void *)(a1 + 104);
  uint64_t v23 = a4;
  uint64_t v21 = v11;
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 112);
  id v15 = v12;
  uint64_t v22 = v13;
  [v6 enumerateQueryResults:v8 stringCache:0 usingBlock:v14];
  if (v6) {
    CFRelease(v6);
  }

  _Block_object_dispose(v24, 8);
}

void sub_100048E5C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_100048E74(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[16];
  uint64_t v3 = *(void *)(a1[5] + 8);
  uint64_t v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  uint64_t v5 = *(void *)(v2 + 8 * v4);
  if (v5)
  {
    uint64_t v37 = v5;
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:384];
    unint64_t v9 = 0;
    int v10 = 0;
    CFNullRef v11 = 0;
    CFNullRef v38 = 0;
    CFNullRef v39 = 0;
    CFNullRef v12 = 0;
    int v13 = 0;
    do
    {
      if (v9 >= *(void *)(*(void *)(a1[6] + 8) + 24)) {
        goto LABEL_35;
      }
      CFNullRef v14 = (CFNullRef)*(id *)(a2 + 8 * v9);
      if (v9 == *(void *)(*(void *)(a1[7] + 8) + 24))
      {
        objc_opt_class();
        CFNullRef v15 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0;
        CFNullRef v16 = v15;

        CFNullRef v11 = v16;
      }
      else if (v9 == *(void *)(*(void *)(a1[8] + 8) + 24))
      {
        objc_opt_class();
        CFNullRef v17 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0;
        CFNullRef v18 = v17;

        CFNullRef v12 = v18;
      }
      else if (v9 == *(void *)(*(void *)(a1[9] + 8) + 24))
      {
        ranking_index_score_init();
      }
      else if (v9 == *(void *)(*(void *)(a1[10] + 8) + 24))
      {
        objc_opt_class();
        CFNullRef v19 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0;
        CFNullRef v20 = v19;

        CFNullRef v39 = v20;
      }
      else if (v9 == *(void *)(*(void *)(a1[11] + 8) + 24))
      {
        objc_opt_class();
        CFNullRef v21 = (objc_opt_isKindOfClass() & 1) != 0 ? v14 : 0;
        CFNullRef v22 = v21;

        CFNullRef v38 = v22;
      }
      else if (v9 == *(void *)(*(void *)(a1[12] + 8) + 24))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(__CFNull *)v14 floatValue];
          int v13 = v23;
        }
      }
      if (v14)
      {
        [v8 addObject:v14];
        if (v14 != kCFNull)
        {
          BOOL v24 = *(unint64_t **)(*(void *)(a1[13] + 8) + 24);
          if (*v24 > v9 && (v24[(v9 >> 6) + 1] & (1 << v9)) != 0) {
            ++v10;
          }
        }
      }
      else
      {
LABEL_35:
        CFNullRef v14 = kCFNull;
        [v8 addObject:v14];
      }

      ++v9;
    }
    while (v9 != 384);
    uint64_t v25 = SSCompactRankingAttrsAlloc();
    for (unint64_t i = 0; i != 384; ++i)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", i, v37);
      CFNullRef v27 = (const __CFNull *)objc_claimAutoreleasedReturnValue();
      if (v27 != kCFNull)
      {
        id v28 = *(unint64_t **)(*(void *)(a1[13] + 8) + 24);
        if (*v28 > i && ((v28[(i >> 6) + 1] >> i) & 1) != 0)
        {
          BOOL v29 = (void *)qword_1000A8F78;
          id v30 = [*(id *)(*(void *)(a1[14] + 8) + 40) objectAtIndexedSubscript:i];
          [v29 indexOfObject:v30];

          SSCompactRankingAttrsInsertValue();
        }
      }
    }
    if (v12)
    {
      uint64_t v31 = [SPCSTopHitResult alloc];
      id v32 = [objc_alloc((Class)PRSRankingItem) initWithAttrs:v25];
      id v33 = [(SPCSTopHitResult *)v31 initWithRankingItem:v32 clientData:v8];

      [v33 setOid:v37];
      CFNullRef v34 = v38;
      [v33 setThreadId:v38];
      [v33 setInterestingDate:v11];
      -[NSObject setScore:](v33, "setScore:", 0, 0);
      [v33 setBundleID:v12];
      [v33 setDataclass:a1[4]];
      [v33 setType:2];
      CFNullRef v35 = v39;
      [v33 setIdentifier:v39];
      LODWORD(v36) = v13;
      [v33 setScoreL1:v36];
      [*(id *)(*(void *)(a1[15] + 8) + 40) addObject:v33];
    }
    else
    {
      id v33 = SPLogForSPLogCategoryDefault();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v41 = v37;
        __int16 v42 = 2048;
        uint64_t v43 = v37;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "*warn* Missing bundleID for oid:0x%llx(%lld)", buf, 0x16u);
      }
      CFNullRef v34 = v38;
      CFNullRef v35 = v39;
    }
  }
}

void sub_100049378(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SPLogForSPLogCategoryQuery();
  os_log_type_t v5 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) count];
    *(_DWORD *)buf = 134218242;
    id v146 = v6;
    __int16 v147 = 2112;
    id v148 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Finished topHit query, resultsCount:%lu, error:%@", buf, 0x16u);
  }

  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    goto LABEL_12;
  }
  if (+[SDPommesFeature usingPommesRankingForClientBundle:*(void *)(a1 + 32)])
  {
    long long v7 = (void *)os_transaction_create();
    unint64_t v9 = SPLogForSPLogCategoryDefault();
    os_log_type_t v10 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v9, v10)) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) || !*(void *)(a1 + 48))
  {
    long long v7 = (void *)os_transaction_create();
    unint64_t v9 = SPLogForSPLogCategoryDefault();
    os_log_type_t v10 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v9, v10))
    {
LABEL_10:
      id v11 = objc_retainBlock(*(id *)(a1 + 88));
      *(_DWORD *)buf = 138412290;
      id v146 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Finished completing %@", buf, 0xCu);
    }
LABEL_11:

    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    [*(id *)(a1 + 40) deactivate];
    id v12 = self;

    goto LABEL_12;
  }
  [*(id *)(a1 + 56) setMaxCount:*(void *)(a1 + 256)];
  [*(id *)(a1 + 56) setGrouped:*(void *)(a1 + 256) != 0];
  int v13 = *(void **)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 32);
  char v15 = *(unsigned char *)(a1 + 272);
  uint64_t v16 = *(void *)(a1 + 48);
  *(_WORD *)((char *)&v109 + 1) = [*(id *)(a1 + 56) disableNLP];
  LOBYTE(v109) = v15;
  uint64_t v17 = objc_msgSend(v13, "_topHitQueryParametersForSearchString:searchEntities:contextIdentifier:queryKind:needsFuzzy:checkForMath:isCJK:disableNLP:disableOCR:previousQueryKind:clientBundle:keyboardLanguage:queryID:", v16, &__NSArray0__struct, v14, 11, 1, 0, v109, 11, *(void *)(a1 + 32), *(void *)(a1 + 72), objc_msgSend(*(id *)(a1 + 56), "queryID"));
  uint64_t v18 = *(void *)(*(void *)(a1 + 128) + 8);
  CFNullRef v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = v17;

  CFNullRef v20 = [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) objectForKeyedSubscript:@"query"];
  id v21 = [v20 mutableCopy];

  uint64_t v114 = v21;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 136) + 8) + 40), v21);
  [*(id *)(a1 + 40) setIsFuzzySearch:1];
  uint64_t v22 = *(void *)(*(void *)(a1 + 144) + 8);
  int v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = 0;

  if (*(unsigned char *)(a1 + 273))
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A8F80);
    BOOL v24 = (void *)qword_1000A8EF8;
    id v112 = (id)qword_1000A8F68;
    id v25 = v24;
    os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A8F80);
    uint64_t v26 = qword_1000A8EE8;
    uint64_t v27 = qword_1000A8EF0;
    uint64_t v29 = *(void *)(a1 + 32);
    id v28 = *(void **)(a1 + 40);
    uint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
    uint64_t v31 = *(void *)(a1 + 48);
    id v32 = [*(id *)(a1 + 56) keyboardLanguage];
    LOBYTE(v110) = 0;
    uint64_t v33 = [v28 rankingConfigurationWithMeContact:v26 emailAddresses:v27 phoneFavorites:v25 vipList:v112 clientBundle:v29 isScopedSearch:0 spotlightQuery:v30 userQuery:v31 tokenString:0 queryKind:11 isPeopleSearch:v110 keyboardLanguage:v32];
    uint64_t v34 = *(void *)(*(void *)(a1 + 144) + 8);
    CFNullRef v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = v33;
  }
  else
  {
    uint64_t v37 = *(void *)(a1 + 32);
    double v36 = *(void **)(a1 + 40);
    uint64_t v38 = *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
    uint64_t v39 = *(void *)(a1 + 48);
    id v25 = [*(id *)(a1 + 56) keyboardLanguage];
    LOBYTE(v110) = 0;
    uint64_t v40 = [v36 rankingConfigurationWithMeContact:0 emailAddresses:0 phoneFavorites:0 vipList:0 clientBundle:v37 isScopedSearch:0 spotlightQuery:v38 userQuery:v39 tokenString:0 queryKind:11 isPeopleSearch:v110 keyboardLanguage:v25];
    uint64_t v41 = *(void *)(*(void *)(a1 + 144) + 8);
    id v32 = *(void **)(v41 + 40);
    *(void *)(v41 + 40) = v40;
  }

  uint64_t v42 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) rankingQueries];
  uint64_t v43 = *(void *)(*(void *)(a1 + 152) + 8);
  unsigned __int8 v44 = *(void **)(v43 + 40);
  *(void *)(v43 + 40) = v42;

  [*(id *)(a1 + 56) setParseUserQuery:0];
  [*(id *)(a1 + 56) setRankingQueries:*(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40)];
  objc_msgSend(*(id *)(a1 + 56), "setStrongRankingQueryCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "strongRankingQueryCount"));
  objc_msgSend(*(id *)(a1 + 56), "setDominantRankingQueryCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "dominantRankingQueryCount"));
  objc_msgSend(*(id *)(a1 + 56), "setDominatedRankingQueryCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "dominatedRankingQueryCount"));
  objc_msgSend(*(id *)(a1 + 56), "setShortcutBit:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "shortcutBit"));
  objc_msgSend(*(id *)(a1 + 56), "setHighMatchBit:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "highMatchBit"));
  objc_msgSend(*(id *)(a1 + 56), "setLowMatchBit:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "lowMatchBit"));
  objc_msgSend(*(id *)(a1 + 56), "setHighRecencyBit:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "highRecencyBit"));
  objc_msgSend(*(id *)(a1 + 56), "setLowRecencyBit:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "lowRecencyBit"));
  unsigned int v45 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) requiredAttributes];
  uint64_t v46 = [v45 array];
  uint64_t v47 = *(void *)(*(void *)(a1 + 160) + 8);
  long long v48 = *(void **)(v47 + 40);
  *(void *)(v47 + 40) = v46;

  long long v49 = objc_opt_class();
  long long v50 = [*(id *)(a1 + 56) fetchAttributes];
  unsigned __int8 v51 = [v49 _makeUniqueFetchAttributesWithAttributes:v50 extraAttributes:*(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 40)];
  [*(id *)(a1 + 56) setFetchAttributes:v51];

  uint64_t v52 = [*(id *)(a1 + 56) fetchAttributes];
  uint64_t v53 = *(void *)(*(void *)(a1 + 168) + 8);
  id v54 = *(void **)(v53 + 40);
  *(void *)(v53 + 40) = v52;

  *(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8)+ 40) count];
  uint64_t v55 = objc_opt_new();
  uint64_t v56 = *(void *)(*(void *)(a1 + 112) + 8);
  CFNullRef v57 = *(void **)(v56 + 40);
  *(void *)(v56 + 40) = v55;

  id v58 = [objc_alloc((Class)NSMutableData) initWithLength:(unint64_t)(8 * *(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 24) + 504) >> 6];
  uint64_t v59 = *(void *)(*(void *)(a1 + 184) + 8);
  id v60 = *(void **)(v59 + 40);
  *(void *)(v59 + 40) = v58;

  *(void *)(*(void *)(*(void *)(a1 + 192) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 184) + 8)+ 40) mutableBytes];
  uint64_t v61 = *(void **)(*(void *)(*(void *)(a1 + 192) + 8) + 24);
  uint64_t v62 = *(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 24);
  *uint64_t v61 = v62;
  bzero(v61 + 1, (unint64_t)(8 * v62 + 504) >> 6);
  *(void *)(*(void *)(*(void *)(a1 + 200) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)(*(void *)(*(void *)(a1 + 208) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)(*(void *)(*(void *)(a1 + 216) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)(*(void *)(*(void *)(a1 + 224) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)(*(void *)(*(void *)(a1 + 232) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  *(void *)(*(void *)(*(void *)(a1 + 240) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  if (*(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 24))
  {
    unint64_t v63 = 0;
    uint64_t v64 = MDItemContentCreationDate;
    uint64_t v65 = MDItemBundleID;
    uint64_t v113 = MDMailConversationID;
    uint64_t v111 = MDQueryResultScoreL1;
    while (1)
    {
      uint64_t v66 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) requiredAttributes];
      unsigned int v67 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectAtIndexedSubscript:v63];
      unsigned int v68 = [v66 containsObject:v67];

      if (v68)
      {
        uint64_t v69 = *(unint64_t **)(*(void *)(*(void *)(a1 + 192) + 8) + 24);
        if (*v69 > v63) {
          v69[(v63 >> 6) + 1] |= 1 << v63;
        }
      }
      unsigned int v70 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectAtIndexedSubscript:v63];
      unsigned int v71 = [v70 isEqualToString:v64];

      if (v71) {
        break;
      }
      CFIndex v73 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectAtIndexedSubscript:v63];
      unsigned int v74 = [v73 isEqualToString:v65];

      if (v74)
      {
        uint64_t v72 = *(void *)(a1 + 208);
        goto LABEL_34;
      }
      uint64_t v75 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectAtIndexedSubscript:v63];
      unsigned int v76 = [v75 isEqualToString:@"kMDQueryResultNewMatchedExtraQueriesField"];

      if (v76)
      {
        uint64_t v72 = *(void *)(a1 + 216);
        goto LABEL_34;
      }
      unint64_t v77 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectAtIndexedSubscript:v63];
      unsigned int v78 = [v77 isEqualToString:@"_kMDItemExternalID"];

      if (v78)
      {
        uint64_t v72 = *(void *)(a1 + 224);
        goto LABEL_34;
      }
      __uint64_t v79 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectAtIndexedSubscript:v63];
      unsigned int v80 = [v79 isEqualToString:v113];

      if (v80)
      {
        uint64_t v72 = *(void *)(a1 + 232);
        goto LABEL_34;
      }
      id v81 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectAtIndexedSubscript:v63];
      unsigned int v82 = [v81 isEqualToString:v111];

      if (v82)
      {
        uint64_t v72 = *(void *)(a1 + 240);
        goto LABEL_34;
      }
LABEL_35:
      if (++v63 >= *(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 24)) {
        goto LABEL_36;
      }
    }
    uint64_t v72 = *(void *)(a1 + 200);
LABEL_34:
    *(void *)(*(void *)(v72 + 8) + 24) = v63;
    goto LABEL_35;
  }
LABEL_36:
  uint64_t v83 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 80) count]);
  uint64_t v84 = *(void *)(*(void *)(a1 + 248) + 8);
  id v85 = *(void **)(v84 + 40);
  *(void *)(v84 + 40) = v83;

  id v86 = +[NSOrderedSet orderedSetWithArray:*(void *)(*(void *)(*(void *)(a1 + 168) + 8) + 40)];
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v87 = *(id *)(a1 + 80);
  id v88 = [v87 countByEnumeratingWithState:&v140 objects:v144 count:16];
  if (v88)
  {
    id v89 = v88;
    uint64_t v90 = *(void *)v141;
    do
    {
      for (unint64_t i = 0; i != v89; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v141 != v90) {
          objc_enumerationMutation(v87);
        }
        id v92 = [v86 indexOfObject:*(void *)(*((void *)&v140 + 1) + 8 * i)];
        uint64_t v93 = *(void **)(*(void *)(*(void *)(a1 + 248) + 8) + 40);
        CFHashCode v94 = +[NSNumber numberWithInteger:v92];
        [v93 addObject:v94];
      }
      id v89 = [v87 countByEnumeratingWithState:&v140 objects:v144 count:16];
    }
    while (v89);
  }

  int v95 = +[SPCoreSpotlightIndexer sharedInstance];
  uint64_t v96 = *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
  uint64_t v97 = *(void *)(a1 + 56);
  v115[0] = _NSConcreteStackBlock;
  v115[1] = 3221225472;
  v115[2] = sub_10004A080;
  v115[3] = &unk_1000937D8;
  uint64_t v98 = *(void *)(a1 + 104);
  uint64_t v126 = *(void *)(a1 + 112);
  id v99 = *(id *)(a1 + 88);
  uint64_t v100 = *(void *)(a1 + 120);
  id v123 = v99;
  uint64_t v127 = v100;
  id v116 = *(id *)(a1 + 48);
  id v101 = *(id *)(a1 + 56);
  uint64_t v102 = *(void *)(a1 + 264);
  id v117 = v101;
  uint64_t v137 = v102;
  id v103 = *(id *)(a1 + 40);
  uint64_t v128 = *(void *)(a1 + 128);
  uint64_t v104 = *(void *)(a1 + 64);
  id v118 = v103;
  uint64_t v119 = v104;
  id v120 = *(id *)(a1 + 32);
  char v138 = *(unsigned char *)(a1 + 272);
  id v105 = *(id *)(a1 + 72);
  char v139 = *(unsigned char *)(a1 + 273);
  long long v129 = *(_OWORD *)(a1 + 136);
  long long v130 = *(_OWORD *)(a1 + 152);
  long long v131 = *(_OWORD *)(a1 + 168);
  long long v132 = *(_OWORD *)(a1 + 184);
  long long v133 = *(_OWORD *)(a1 + 200);
  long long v134 = *(_OWORD *)(a1 + 216);
  long long v135 = *(_OWORD *)(a1 + 232);
  uint64_t v106 = *(void *)(a1 + 248);
  id v121 = v105;
  uint64_t v136 = v106;
  id v122 = *(id *)(a1 + 80);
  id v124 = *(id *)(a1 + 104);
  id v125 = *(id *)(a1 + 96);
  id v107 = [v95 taskForTopHitQueryWithQueryString:v96 queryContext:v97 eventHandler:0 resultsHandler:v98 completionHandler:v115];

  unsigned __int8 v108 = +[SPCoreSpotlightIndexer sharedInstance];
  [v108 startQueryTask:v107];

LABEL_12:
}

void sub_10004A080(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SPLogForSPLogCategoryQuery();
  os_log_type_t v5 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 112) + 8) + 40) count];
    *(_DWORD *)buf = 134218242;
    id v134 = v6;
    __int16 v135 = 2112;
    id v136 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Finished topHit query, resultsCount:%lu, error:%@", buf, 0x16u);
  }

  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    goto LABEL_9;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 120) + 8) + 24))
  {
    if (*(void *)(a1 + 32))
    {
      int v13 = [*(id *)(a1 + 40) queryEmbedding];

      if (!v13)
      {
        [*(id *)(a1 + 40) setMaxCount:*(void *)(a1 + 256)];
        [*(id *)(a1 + 40) setGrouped:*(void *)(a1 + 256) != 0];
        id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:5];
        char v15 = *(void **)(a1 + 48);
        id v131 = v14;
        uint64_t v16 = [v15 requery:&v131];
        id v17 = v131;

        if (v16)
        {
          [*(id *)(a1 + 48) resetWithSearchString:v16];
          uint64_t v18 = *(void **)(a1 + 56);
          uint64_t v19 = *(void *)(a1 + 64);
          char v20 = *(unsigned char *)(a1 + 264);
          *(_WORD *)((char *)&v115 + 1) = [*(id *)(a1 + 40) disableNLP];
          LOBYTE(v115) = v20;
          uint64_t v21 = objc_msgSend(v18, "_topHitQueryParametersForSearchString:searchEntities:contextIdentifier:queryKind:needsFuzzy:checkForMath:isCJK:disableNLP:disableOCR:previousQueryKind:clientBundle:keyboardLanguage:queryID:", v16, &__NSArray0__struct, v19, 11, 0, 0, v115, 11, *(void *)(a1 + 64), *(void *)(a1 + 72), objc_msgSend(*(id *)(a1 + 40), "queryID"));
          uint64_t v22 = *(void *)(*(void *)(a1 + 128) + 8);
          int v23 = *(void **)(v22 + 40);
          *(void *)(v22 + 40) = v21;

          BOOL v24 = [*(id *)(*(void *)(*(void *)(a1 + 128) + 8) + 40) objectForKeyedSubscript:@"query"];
          id v25 = [v24 mutableCopy];

          if ([v17 count])
          {
            uint64_t v26 = [v17 componentsJoinedByString:@" || "];
            uint64_t v27 = +[NSString stringWithFormat:@"(%@ || %@)", v25, v26];
            uint64_t v28 = *(void *)(*(void *)(a1 + 136) + 8);
            uint64_t v29 = *(void **)(v28 + 40);
            *(void *)(v28 + 40) = v27;
          }
          else
          {
            uint64_t v36 = *(void *)(*(void *)(a1 + 136) + 8);
            id v37 = v25;
            uint64_t v26 = *(void **)(v36 + 40);
            *(void *)(v36 + 40) = v37;
          }
          id v120 = v25;
          id v121 = v17;

          uint64_t v38 = *(void *)(*(void *)(a1 + 144) + 8);
          uint64_t v39 = *(void **)(v38 + 40);
          *(void *)(v38 + 40) = 0;

          if (*(unsigned char *)(a1 + 265))
          {
            os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A8F80);
            uint64_t v40 = (void *)qword_1000A8EF8;
            id v118 = (id)qword_1000A8F68;
            id v41 = v40;
            os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A8F80);
            uint64_t v42 = qword_1000A8EE8;
            uint64_t v43 = qword_1000A8EF0;
            uint64_t v44 = *(void *)(a1 + 64);
            uint64_t v45 = *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
            uint64_t v46 = *(void **)(a1 + 48);
            uint64_t v47 = [*(id *)(a1 + 40) keyboardLanguage];
            LOBYTE(v116) = 0;
            uint64_t v48 = [v46 rankingConfigurationWithMeContact:v42 emailAddresses:v43 phoneFavorites:v41 vipList:v118 clientBundle:v44 isScopedSearch:0 spotlightQuery:v45 userQuery:v16 tokenString:0 queryKind:11 isPeopleSearch:v116 keyboardLanguage:v47];
            uint64_t v49 = *(void *)(*(void *)(a1 + 144) + 8);
            long long v50 = *(void **)(v49 + 40);
            *(void *)(v49 + 40) = v48;
          }
          else
          {
            uint64_t v51 = *(void *)(a1 + 64);
            uint64_t v52 = *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
            uint64_t v53 = *(void **)(a1 + 48);
            id v41 = [*(id *)(a1 + 40) keyboardLanguage];
            LOBYTE(v116) = 0;
            uint64_t v54 = [v53 rankingConfigurationWithMeContact:0 emailAddresses:0 phoneFavorites:0 vipList:0 clientBundle:v51 isScopedSearch:0 spotlightQuery:v52 userQuery:v16 tokenString:0 queryKind:11 isPeopleSearch:v116 keyboardLanguage:v41];
            uint64_t v55 = *(void *)(*(void *)(a1 + 144) + 8);
            uint64_t v47 = *(void **)(v55 + 40);
            *(void *)(v55 + 40) = v54;
          }

          uint64_t v56 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) rankingQueries];
          uint64_t v57 = *(void *)(*(void *)(a1 + 152) + 8);
          id v58 = *(void **)(v57 + 40);
          *(void *)(v57 + 40) = v56;

          [*(id *)(a1 + 40) setParseUserQuery:0];
          [*(id *)(a1 + 40) setRankingQueries:*(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40)];
          objc_msgSend(*(id *)(a1 + 40), "setStrongRankingQueryCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "strongRankingQueryCount"));
          objc_msgSend(*(id *)(a1 + 40), "setDominantRankingQueryCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "dominantRankingQueryCount"));
          objc_msgSend(*(id *)(a1 + 40), "setDominatedRankingQueryCount:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "dominatedRankingQueryCount"));
          objc_msgSend(*(id *)(a1 + 40), "setShortcutBit:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "shortcutBit"));
          objc_msgSend(*(id *)(a1 + 40), "setHighMatchBit:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "highMatchBit"));
          objc_msgSend(*(id *)(a1 + 40), "setLowMatchBit:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "lowMatchBit"));
          objc_msgSend(*(id *)(a1 + 40), "setHighRecencyBit:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "highRecencyBit"));
          objc_msgSend(*(id *)(a1 + 40), "setLowRecencyBit:", objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40), "lowRecencyBit"));
          uint64_t v59 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) requiredAttributes];
          uint64_t v60 = [v59 array];
          uint64_t v61 = *(void *)(*(void *)(a1 + 160) + 8);
          uint64_t v62 = *(void **)(v61 + 40);
          *(void *)(v61 + 40) = v60;

          unint64_t v63 = objc_opt_class();
          uint64_t v64 = [*(id *)(a1 + 40) fetchAttributes];
          uint64_t v65 = [v63 _makeUniqueFetchAttributesWithAttributes:v64 extraAttributes:*(void *)(*(void *)(*(void *)(a1 + 160) + 8) + 40)];
          [*(id *)(a1 + 40) setFetchAttributes:v65];

          uint64_t v66 = [*(id *)(a1 + 40) fetchAttributes];
          uint64_t v67 = *(void *)(*(void *)(a1 + 168) + 8);
          unsigned int v68 = *(void **)(v67 + 40);
          *(void *)(v67 + 40) = v66;

          *(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 168)+ 8)+ 40) count];
          uint64_t v69 = objc_opt_new();
          uint64_t v70 = *(void *)(*(void *)(a1 + 112) + 8);
          unsigned int v71 = *(void **)(v70 + 40);
          *(void *)(v70 + 40) = v69;

          id v72 = [objc_alloc((Class)NSMutableData) initWithLength:(unint64_t)(8 * *(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 24) + 504) >> 6];
          uint64_t v73 = *(void *)(*(void *)(a1 + 184) + 8);
          unsigned int v74 = *(void **)(v73 + 40);
          *(void *)(v73 + 40) = v72;

          *(void *)(*(void *)(*(void *)(a1 + 192) + 8) + 24) = [*(id *)(*(void *)(*(void *)(a1 + 184) + 8) + 40) mutableBytes];
          uint64_t v75 = *(void **)(*(void *)(*(void *)(a1 + 192) + 8) + 24);
          uint64_t v76 = *(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 24);
          *uint64_t v75 = v76;
          bzero(v75 + 1, (unint64_t)(8 * v76 + 504) >> 6);
          *(void *)(*(void *)(*(void *)(a1 + 200) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
          *(void *)(*(void *)(*(void *)(a1 + 208) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
          *(void *)(*(void *)(*(void *)(a1 + 216) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
          *(void *)(*(void *)(*(void *)(a1 + 224) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
          *(void *)(*(void *)(*(void *)(a1 + 232) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
          *(void *)(*(void *)(*(void *)(a1 + 240) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
          if (*(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 24))
          {
            unint64_t v77 = 0;
            uint64_t v78 = MDItemContentCreationDate;
            uint64_t v79 = MDItemBundleID;
            uint64_t v119 = MDMailConversationID;
            uint64_t v117 = MDQueryResultScoreL1;
            while (1)
            {
              unsigned int v80 = [*(id *)(*(void *)(*(void *)(a1 + 144) + 8) + 40) requiredAttributes];
              id v81 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectAtIndexedSubscript:v77];
              unsigned int v82 = [v80 containsObject:v81];

              if (v82)
              {
                uint64_t v83 = *(unint64_t **)(*(void *)(*(void *)(a1 + 192) + 8) + 24);
                if (*v83 > v77) {
                  v83[(v77 >> 6) + 1] |= 1 << v77;
                }
              }
              uint64_t v84 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectAtIndexedSubscript:v77];
              unsigned int v85 = [v84 isEqualToString:v78];

              if (v85) {
                break;
              }
              id v87 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectAtIndexedSubscript:v77];
              unsigned int v88 = [v87 isEqualToString:v79];

              if (v88)
              {
                uint64_t v86 = *(void *)(a1 + 208);
                goto LABEL_39;
              }
              id v89 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectAtIndexedSubscript:v77];
              unsigned int v90 = [v89 isEqualToString:@"kMDQueryResultNewMatchedExtraQueriesField"];

              if (v90)
              {
                uint64_t v86 = *(void *)(a1 + 216);
                goto LABEL_39;
              }
              id v91 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectAtIndexedSubscript:v77];
              unsigned int v92 = [v91 isEqualToString:@"_kMDItemExternalID"];

              if (v92)
              {
                uint64_t v86 = *(void *)(a1 + 224);
                goto LABEL_39;
              }
              uint64_t v93 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectAtIndexedSubscript:v77];
              unsigned int v94 = [v93 isEqualToString:v119];

              if (v94)
              {
                uint64_t v86 = *(void *)(a1 + 232);
                goto LABEL_39;
              }
              int v95 = [*(id *)(*(void *)(*(void *)(a1 + 168) + 8) + 40) objectAtIndexedSubscript:v77];
              unsigned int v96 = [v95 isEqualToString:v117];

              if (v96)
              {
                uint64_t v86 = *(void *)(a1 + 240);
                goto LABEL_39;
              }
LABEL_40:
              if (++v77 >= *(void *)(*(void *)(*(void *)(a1 + 176) + 8) + 24)) {
                goto LABEL_41;
              }
            }
            uint64_t v86 = *(void *)(a1 + 200);
LABEL_39:
            *(void *)(*(void *)(v86 + 8) + 24) = v77;
            goto LABEL_40;
          }
LABEL_41:
          uint64_t v97 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*(id *)(a1 + 80) count]);
          uint64_t v98 = *(void *)(*(void *)(a1 + 248) + 8);
          id v99 = *(void **)(v98 + 40);
          *(void *)(v98 + 40) = v97;

          uint64_t v100 = +[NSOrderedSet orderedSetWithArray:*(void *)(*(void *)(*(void *)(a1 + 168) + 8) + 40)];
          long long v127 = 0u;
          long long v128 = 0u;
          long long v129 = 0u;
          long long v130 = 0u;
          id v101 = *(id *)(a1 + 80);
          id v102 = [v101 countByEnumeratingWithState:&v127 objects:v132 count:16];
          if (v102)
          {
            id v103 = v102;
            uint64_t v104 = *(void *)v128;
            do
            {
              for (unint64_t i = 0; i != v103; unint64_t i = (char *)i + 1)
              {
                if (*(void *)v128 != v104) {
                  objc_enumerationMutation(v101);
                }
                id v106 = [v100 indexOfObject:*(void *)(*((void *)&v127 + 1) + 8 * i)];
                id v107 = *(void **)(*(void *)(*(void *)(a1 + 248) + 8) + 40);
                unsigned __int8 v108 = +[NSNumber numberWithInteger:v106];
                [v107 addObject:v108];
              }
              id v103 = [v101 countByEnumeratingWithState:&v127 objects:v132 count:16];
            }
            while (v103);
          }

          uint64_t v109 = +[SPCoreSpotlightIndexer sharedInstance];
          uint64_t v110 = *(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40);
          uint64_t v111 = *(void *)(a1 + 40);
          v122[0] = _NSConcreteStackBlock;
          v122[1] = 3221225472;
          v122[2] = sub_10004ADC4;
          v122[3] = &unk_1000937B0;
          uint64_t v126 = *(void *)(a1 + 112);
          uint64_t v112 = *(void *)(a1 + 96);
          id v124 = *(id *)(a1 + 88);
          id v125 = *(id *)(a1 + 104);
          id v123 = *(id *)(a1 + 48);
          uint64_t v113 = [v109 taskForTopHitQueryWithQueryString:v110 queryContext:v111 eventHandler:0 resultsHandler:v112 completionHandler:v122];

          uint64_t v114 = +[SPCoreSpotlightIndexer sharedInstance];
          [v114 startQueryTask:v113];

          id v17 = v121;
          uint64_t v30 = v120;
        }
        else
        {
          uint64_t v30 = (void *)os_transaction_create();
          id v32 = SPLogForSPLogCategoryDefault();
          os_log_type_t v33 = 2 * (gSPLogDebugAsDefault == 0);
          if (os_log_type_enabled(v32, v33))
          {
            id v34 = objc_retainBlock(*(id *)(a1 + 88));
            *(_DWORD *)buf = 138412290;
            id v134 = v34;
            _os_log_impl((void *)&_mh_execute_header, v32, v33, "Finished completing %@", buf, 0xCu);
          }
          (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
          (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
          [*(id *)(a1 + 48) deactivate];
          id v35 = self;
        }

        goto LABEL_9;
      }
    }
  }
  long long v7 = (void *)os_transaction_create();
  unint64_t v9 = SPLogForSPLogCategoryDefault();
  os_log_type_t v10 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v9, v10))
  {
    id v11 = objc_retainBlock(*(id *)(a1 + 88));
    *(_DWORD *)buf = 138412290;
    id v134 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Finished completing %@", buf, 0xCu);
  }
  (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
  (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  [*(id *)(a1 + 48) deactivate];
  id v12 = self;

LABEL_9:
}

void sub_10004ADC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = SPLogForSPLogCategoryQuery();
  os_log_type_t v5 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v4, v5))
  {
    id v6 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) count];
    int v13 = 134218242;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Finished topHit query, resultsCount:%lu, error:%@", (uint8_t *)&v13, 0x16u);
  }

  if (v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    long long v7 = (void *)os_transaction_create();
    unint64_t v9 = SPLogForSPLogCategoryDefault();
    os_log_type_t v10 = 2 * (gSPLogDebugAsDefault == 0);
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = objc_retainBlock(*(id *)(a1 + 40));
      int v13 = 138412290;
      id v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Finished completing %@", (uint8_t *)&v13, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    [*(id *)(a1 + 32) deactivate];
    id v12 = self;
  }
}

void sub_10004B0DC(id a1)
{
  byte_1000A9018 = _os_feature_enabled_impl();
  byte_1000A9019 = _os_feature_enabled_impl();
}

uint64_t sub_10004B130(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t result = (uint64_t)[*(id *)(a1 + 32) cancelled];
  if ((result & 1) == 0)
  {
    uint64_t v5 = si_tracing_current_span();
    long long v6 = *(_OWORD *)(v5 + 16);
    long long v118 = *(_OWORD *)v5;
    long long v119 = v6;
    uint64_t v120 = *(void *)(v5 + 32);
    uint64_t v7 = *(void *)v5;
    uint64_t spanid = si_tracing_calc_next_spanid();
    uint64_t v9 = *(void *)(v5 + 8);
    *(void *)uint64_t v5 = v7;
    *(void *)(v5 + _Block_object_dispose(&STACK[0x7B0], 8) = spanid;
    *(void *)(v5 + 16) = v9;
    *(unsigned char *)(v5 + 2_Block_object_dispose(&STACK[0x7B0], 8) = 102;
    *(void *)(v5 + 32) = "SPCoreSpotlightDatastore rank batch";
    si_tracing_log_span_begin();
    uint64_t v94 = v5;
    uint64_t v11 = *(void *)(v3 + 88);
    unint64_t v12 = v11 * a2;
    unint64_t v13 = v11 * a2 + v11;
    if (v13 >= *(void *)(v3 + 96)) {
      unint64_t v13 = *(void *)(v3 + 96);
    }
    unint64_t v96 = v13;
    if (v12 < v13)
    {
      uint64_t v95 = PRSRankingMailBundleString;
      unsigned int v92 = v113;
      uint64_t v93 = PRSRankingMessagesBundleString;
      *(void *)&long long v10 = 67109378;
      long long v90 = v10;
      uint64_t v109 = v3;
      while (1)
      {
        uint64_t v101 = v12;
        id v14 = objc_msgSend(*(id *)(v3 + 40), "objectAtIndexedSubscript:", v90, context, v92);
        __int16 v15 = [v14 bundleIdentifier];
        id obj = v14;
        int IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();
        id v17 = objc_opt_new();
        if ([v15 isEqualToString:off_1000A8A58[0]]) {
          objc_storeStrong((id *)(*(void *)(*(void *)(v109 + 72) + 8) + 40), obj);
        }
        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        uint64_t v18 = [obj results];
        id v19 = [v18 countByEnumeratingWithState:&v114 objects:v129 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v115;
          do
          {
            for (unint64_t i = 0; i != v19; unint64_t i = (char *)i + 1)
            {
              if (*(void *)v115 != v20) {
                objc_enumerationMutation(v18);
              }
              uint64_t v22 = *(void **)(*((void *)&v114 + 1) + 8 * i);
              int v23 = [v22 rankingItem];

              if (v23)
              {
                BOOL v24 = [v22 rankingItem];
                [v24 setSectionBundleIdentifier:v15];

                id v25 = [v22 rankingItem];
                [v17 addObject:v25];
              }
            }
            id v19 = [v18 countByEnumeratingWithState:&v114 objects:v129 count:16];
          }
          while (v19);
        }

        if ([*(id *)(v109 + 32) cancelled])
        {

          goto LABEL_90;
        }
        double Current = CFAbsoluteTimeGetCurrent();
        uint64_t v27 = *(void **)(v109 + 48);
        uint64_t v28 = [obj bundleIdentifier];
        [v27 prepareItems:v17 inBundle:v28];

        **(CFAbsoluteTime **)(v109 + 104) = CFAbsoluteTimeGetCurrent() - Current + **(double **)(v109 + 104);
        if (IsSyndicatedPhotos) {
          break;
        }
LABEL_51:
        uint64_t v60 = (char *)[obj resultsCount];
        if ([*(id *)(v109 + 32) isPeopleSearch])
        {
          if ([v15 isEqualToString:v95])
          {
            if ((unint64_t)v60 >= 0xC9) {
              goto LABEL_59;
            }
          }
          else
          {
            unsigned __int8 v61 = [v15 isEqualToString:v93];
            if ((unint64_t)v60 > 0xC8) {
              unsigned __int8 v62 = v61;
            }
            else {
              unsigned __int8 v62 = 0;
            }
            if (v62)
            {
LABEL_59:
              unsigned __int8 v108 = objc_opt_new();
              uint64_t v111 = objc_opt_new();
              unint64_t v63 = [obj resultSet];
              id v64 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v60];
              uint64_t v65 = 0;
              do
              {
                uint64_t v66 = [v63 objectAtIndex:v65];
                uint64_t v67 = [v66 rankingItem];
                if (v67) {
                  [v64 addObject:v67];
                }

                ++v65;
              }
              while (v60 != v65);
              *(void *)buf = 0;
              *(void *)&uint8_t buf[8] = buf;
              *(void *)&uint8_t buf[16] = 0x2020000000;
              *(void *)uint64_t v126 = 0;
              [*(id *)(v109 + 56) currentTime];
              *(void *)uint64_t v126 = v68;
              v112[0] = _NSConcreteStackBlock;
              v112[1] = 3221225472;
              v113[0] = sub_10004BDBC;
              v113[1] = &unk_100093848;
              v113[2] = buf;
              [v64 sortWithOptions:16 usingComparator:v112];
              id v69 = [v64 count];
              if ((unint64_t)v69 >= 0xC9)
              {
                for (uint64_t j = 200; (id)j != v69; ++j)
                {
                  unsigned int v71 = [v64 objectAtIndexedSubscript:j];
                  id v72 = [v71 L2FeatureVector];
                  LODWORD(v73) = -915135504;
                  [v72 setOriginalL2Score:v73];
                }
              }
              unsigned int v74 = 0;
              int v106 = 0;
              char v75 = 0;
LABEL_67:
              char v103 = v75;
              do
              {
                uint64_t v76 = [v63 objectAtIndex:v74];
                unint64_t v77 = [v76 rankingItem];
                uint64_t v78 = v77;
                if (v77)
                {
                  uint64_t v79 = [v77 L2FeatureVector];
                  [v79 originalL2Score];
                  BOOL v81 = v80 == -1000000.0;

                  if (v81)
                  {
                    id v82 = [v17 indexOfObject:v78];
                    if (v82 != (id)0x7FFFFFFFFFFFFFFFLL)
                    {
                      [v108 addIndex:v74];
                      [v111 addIndex:v82];

                      ++v106;
                      char v75 = 1;
                      if (v60 - 1 != v74++) {
                        goto LABEL_67;
                      }
                      goto LABEL_80;
                    }
                    uint64_t v83 = SPLogForSPLogCategoryDefault();
                    os_log_type_t v84 = gSPLogInfoAsDefault ^ 1;
                    if (os_log_type_enabled(v83, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
                    {
                      *(_WORD *)id v121 = 0;
                      _os_log_impl((void *)&_mh_execute_header, v83, v84, "Item to remove not found in array of ranking items", v121, 2u);
                    }
                  }
                }

                ++v74;
              }
              while (v60 != v74);
              if ((v103 & 1) == 0) {
                goto LABEL_83;
              }
LABEL_80:
              uint64_t v86 = SPLogForSPLogCategoryDefault();
              os_log_type_t v87 = gSPLogInfoAsDefault ^ 1;
              if (os_log_type_enabled(v86, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
              {
                *(_DWORD *)id v121 = v90;
                int v122 = v106;
                __int16 v123 = 2112;
                id v124 = v15;
                _os_log_impl((void *)&_mh_execute_header, v86, v87, "Removing %d items from %@", v121, 0x12u);
              }

              [v17 removeObjectsAtIndexes:v111];
              [v63 removeObjectsAtIndexes:v108];
              *(void *)(*(void *)(*(void *)(v109 + 80) + 8) + 24) -= v106;
LABEL_83:
              _Block_object_dispose(buf, 8);
            }
          }
        }
        if ([v17 count])
        {
          id v88 = [v17 copy];
          [*(id *)(v109 + 64) setObject:v88 atIndexedSubscript:v101];
        }
        [v17 removeAllObjects];

        unint64_t v12 = v101 + 1;
        uint64_t v3 = v109;
        if (v101 + 1 == v96) {
          goto LABEL_90;
        }
      }
      uint64_t v100 = objc_opt_new();
      id v99 = objc_opt_new();
      uint64_t v110 = (char *)[obj resultsCount];
      uint64_t v29 = [obj resultSet];
      unsigned int v105 = [*(id *)(v109 + 48) isNLSearch];
      if ([*(id *)(v109 + 48) queryTermCount])
      {
        if (!v110)
        {
LABEL_50:

          goto LABEL_51;
        }
        uint64_t v30 = 0;
        BOOL v107 = 1;
        while (1)
        {
          uint64_t v31 = [v29 objectAtIndex:v30];
          id v32 = [v31 rankingItem];
          os_log_type_t v33 = v32;
          if (v32)
          {
            id v34 = [v32 L2FeatureVector];
            [v34 scoreForFeature:1929];
            float v36 = v35;

            if (v36 == 1.0) {
              break;
            }
          }

          BOOL v107 = ++v30 < v110;
          if (v110 == v30) {
            goto LABEL_25;
          }
        }
      }
      else
      {
LABEL_25:
        BOOL v107 = 0;
      }
      if (v110)
      {
        id v37 = 0;
        uint64_t v102 = 0;
        char v98 = 0;
        uint64_t v38 = 0;
        uint64_t v97 = v29;
        do
        {
          uint64_t v39 = [v29 objectAtIndex:v37];
          uint64_t v40 = [v39 rankingItem];
          id v41 = [v40 L2FeatureVector];
          [v41 scoreForFeature:2392];
          float v43 = v42;

          if (v40)
          {
            uint64_t v44 = [v40 L2FeatureVector];
            [v44 scoreForFeature:1929];
            float v46 = v45;

            uint64_t v47 = [v40 L2FeatureVector];
            [v47 scoreForFeature:2380];
            float v49 = v48;

            if (v43 == 1.0) {
              unsigned int v50 = v105;
            }
            else {
              unsigned int v50 = 0;
            }
            if (v107 && v46 != 1.0 && (v50 & 1) == 0
              || !v107
              && v46 != 1.0
              && v49 != 1.0
              && ([v40 photosExactMatch] & 1) == 0
              && (([v40 photosMatch] | v50) & 1) == 0)
            {
              if ([*(id *)(v109 + 56) pommes])
              {
                uint64_t v51 = SPLogForSPLogCategoryDefault();
                os_log_type_t v52 = gSPLogInfoAsDefault ^ 1;
                if (os_log_type_enabled(v51, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
                {
                  uint64_t v53 = [v40 identifier];
                  unsigned int v54 = [v40 photosExactMatch];
                  unsigned int v55 = [v40 photosMatch];
                  *(_DWORD *)buf = 138413314;
                  *(void *)&uint8_t buf[4] = v53;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&unsigned char buf[14] = v54;
                  *(_WORD *)&buf[18] = 1024;
                  *(_DWORD *)&buf[20] = v55;
                  *(_WORD *)uint64_t v126 = 2048;
                  *(double *)&v126[2] = v43;
                  __int16 v127 = 1024;
                  unsigned int v128 = v105;
                  _os_log_impl((void *)&_mh_execute_header, v51, v52, "#####=== [Pommes Ranking] photo filtering ignored id:%@ exact:%d match:%d nl:%.0f isNL:%d", buf, 0x28u);

                  uint64_t v29 = v97;
                }
              }
              else
              {
                [v100 addIndex:v37];
                [v99 addIndex:v38];
                uint64_t v51 = SPLogForSPLogCategoryDefault();
                ++v102;
                os_log_type_t v56 = gSPLogInfoAsDefault ^ 1;
                if (os_log_type_enabled(v51, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
                {
                  uint64_t v57 = [v40 identifier];
                  unsigned int v58 = [v40 photosExactMatch];
                  unsigned int v59 = [v40 photosMatch];
                  *(_DWORD *)buf = 138413314;
                  *(void *)&uint8_t buf[4] = v57;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&unsigned char buf[14] = v58;
                  *(_WORD *)&buf[18] = 1024;
                  *(_DWORD *)&buf[20] = v59;
                  *(_WORD *)uint64_t v126 = 2048;
                  *(double *)&v126[2] = v43;
                  __int16 v127 = 1024;
                  unsigned int v128 = v105;
                  _os_log_impl((void *)&_mh_execute_header, v51, v56, "#####=== photo filtered id:%@ exact:%d match:%d nl:%.0f isNL:%d", buf, 0x28u);

                  uint64_t v29 = v97;
                }
                char v98 = 1;
              }
            }
            ++v38;
          }

          ++v37;
        }
        while (v110 != v37);
        if (v98)
        {
          [v17 removeObjectsAtIndexes:v99];
          [v29 removeObjectsAtIndexes:v100];
          *(void *)(*(void *)(*(void *)(v109 + 80) + 8) + 24) -= v102;
        }
      }
      goto LABEL_50;
    }
LABEL_90:
    uint64_t result = si_tracing_log_span_end();
    long long v89 = v119;
    *(_OWORD *)uint64_t v94 = v118;
    *(_OWORD *)(v94 + 16) = v89;
    *(void *)(v94 + 32) = v120;
  }
  return result;
}

void sub_10004BCD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

uint64_t sub_10004BDBC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  long long v6 = [a2 interestingDate];
  uint64_t v7 = [v5 interestingDate];

  [v6 timeIntervalSinceReferenceDate];
  double v9 = v8 - *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  [v7 timeIntervalSinceReferenceDate];
  double v11 = v10 - *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v9 <= v11) {
    uint64_t v12 = v9 < v11;
  }
  else {
    uint64_t v12 = -1;
  }

  return v12;
}

uint64_t sub_10004BE78(uint64_t a1, uint64_t a2)
{
  uint64_t result = (uint64_t)[*(id *)(a1 + 32) cancelled];
  if ((result & 1) == 0)
  {
    uint64_t v4 = si_tracing_current_span();
    long long v5 = *(_OWORD *)(v4 + 16);
    long long v82 = *(_OWORD *)v4;
    long long v83 = v5;
    uint64_t v84 = *(void *)(v4 + 32);
    uint64_t v6 = *(void *)v4;
    uint64_t spanid = si_tracing_calc_next_spanid();
    uint64_t v8 = *(void *)(v4 + 8);
    *(void *)uint64_t v4 = v6;
    *(void *)(v4 + _Block_object_dispose(&STACK[0x7B0], 8) = spanid;
    *(void *)(v4 + 16) = v8;
    *(unsigned char *)(v4 + 2_Block_object_dispose(&STACK[0x7B0], 8) = 102;
    *(void *)(v4 + 32) = "SPCoreSpotlightDatastore handle attachments";
    si_tracing_log_span_begin();
    uint64_t v54 = v4;
    uint64_t v9 = *(void *)(a1 + 56);
    unint64_t v10 = v9 * a2;
    unint64_t v11 = v9 * a2 + v9;
    if (v11 >= *(void *)(a1 + 64)) {
      unint64_t v11 = *(void *)(a1 + 64);
    }
    unint64_t v56 = v11;
    if (v10 < v11)
    {
      uint64_t v55 = SSMailBundleIdentifier;
      while (1)
      {
        unint64_t v57 = v10;
        unsigned int v59 = [*(id *)(a1 + 40) objectAtIndexedSubscript:context];
        uint64_t v12 = [v59 bundleIdentifier];
        unsigned __int8 v13 = [v12 isEqualToString:v55];

        if (v13) {
          break;
        }
LABEL_48:

        unint64_t v10 = v57 + 1;
        if (v57 + 1 == v56) {
          goto LABEL_49;
        }
      }
      id v14 = [v59 results];
      id v15 = [v14 copy];

      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      id obj = v15;
      id v16 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
      if (v16)
      {
        id v62 = 0;
        uint64_t v65 = 0;
        uint64_t v17 = *(void *)v79;
        do
        {
          for (unint64_t i = 0; i != v16; unint64_t i = (char *)i + 1)
          {
            if (*(void *)v79 != v17) {
              objc_enumerationMutation(obj);
            }
            id v19 = *(void **)(*((void *)&v78 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0 && [v19 clientData])
            {
              uint64_t v20 = sub_10004E20C((uint64_t)[v19 clientData] + 64, 15);
              if (v20)
              {
                if (!v62)
                {
                  id v62 = +[NSMutableDictionary dictionary];
                  uint64_t v21 = +[NSMutableDictionary dictionary];

                  uint64_t v65 = (void *)v21;
                }
                uint64_t v22 = [v19 dataclass];
                int v23 = [v62 objectForKeyedSubscript:v22];

                if (!v23)
                {
                  int v23 = +[NSMutableArray array];
                  BOOL v24 = [v19 dataclass];
                  [v62 setObject:v23 forKeyedSubscript:v24];
                }
                id v25 = [v65 objectForKeyedSubscript:v20];
                if (!v25
                  || (id v26 = [v19 score],
                      unint64_t v28 = v27,
                      id v29 = [v25 score],
                      __PAIR128__(v30, (unint64_t)v29) < __PAIR128__(v28, (unint64_t)v26)))
                {
                  [v65 setObject:v19 forKeyedSubscript:v20];
                  if (v25)
                  {
                    uint64_t v31 = SPLogForSPLogCategoryDefault();
                    os_log_type_t v32 = gSPLogInfoAsDefault ^ 1;
                    if (os_log_type_enabled(v31, (os_log_type_t)(gSPLogInfoAsDefault ^ 1)))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v31, v32, "===^^ RANKING 4 Mail higher ranked replaced", buf, 2u);
                    }
                  }
                  else
                  {
                    [v23 addObject:v20];
                  }
                }
              }
            }
          }
          id v16 = [obj countByEnumeratingWithState:&v78 objects:v86 count:16];
        }
        while (v16);

        if (!v62)
        {
          uint64_t v51 = 0;
          goto LABEL_47;
        }
        long long v76 = 0u;
        long long v77 = 0u;
        long long v74 = 0u;
        long long v75 = 0u;
        id v33 = v62;
        id v34 = [v33 countByEnumeratingWithState:&v74 objects:v85 count:16];
        if (v34)
        {
          uint64_t v58 = *(void *)v75;
          id v63 = v33;
          do
          {
            id v60 = v34;
            for (uint64_t j = 0; j != v60; uint64_t j = (char *)j + 1)
            {
              if (*(void *)v75 != v58) {
                objc_enumerationMutation(v63);
              }
              uint64_t v36 = *(void *)(*((void *)&v74 + 1) + 8 * (void)j);
              id v37 = [v63 objectForKeyedSubscript:v36];
              uint64_t v38 = rankingAttributeNameArray();
              uint64_t v39 = dispatch_group_create();
              dispatch_group_enter(v39);
              *(void *)buf = 0;
              objc_initWeak((id *)buf, *(id *)(a1 + 48));
              uint64_t v40 = +[NSMutableArray array];
              id v41 = +[NSMutableArray array];
              float v42 = +[SPCoreSpotlightIndexer sharedInstance];
              float v43 = [v59 bundleIdentifier];
              v66[0] = _NSConcreteStackBlock;
              v66[1] = 3221225472;
              v66[2] = sub_10004C604;
              v66[3] = &unk_100093898;
              objc_copyWeak(&v72, (id *)buf);
              id v67 = *(id *)(a1 + 32);
              id v68 = v65;
              id v44 = v40;
              id v69 = v44;
              id v45 = v41;
              id v70 = v45;
              float v46 = v39;
              unsigned int v71 = v46;
              [v42 fetchAttributesForProtectionClass:v36 attributes:v38 bundleID:v43 identifiers:v37 completion:v66];

              dispatch_time_t v47 = dispatch_time(0, 300000000);
              if (!dispatch_group_wait(v46, v47))
              {
                for (unint64_t k = 0; (unint64_t)[v44 count] > k; ++k)
                {
                  float v49 = [v44 objectAtIndexedSubscript:k];
                  unsigned int v50 = [v45 objectAtIndexedSubscript:k];
                  [v49 attachShadowArray:v50];
                }
              }

              objc_destroyWeak(&v72);
              objc_destroyWeak((id *)buf);
            }
            id v33 = v63;
            id v34 = [v63 countByEnumeratingWithState:&v74 objects:v85 count:16];
          }
          while (v34);
        }
        uint64_t v51 = v33;
      }
      else
      {
        uint64_t v65 = 0;
        uint64_t v51 = 0;
        id v33 = obj;
      }

LABEL_47:
      goto LABEL_48;
    }
LABEL_49:
    uint64_t result = si_tracing_log_span_end();
    long long v52 = v83;
    *(_OWORD *)uint64_t v54 = v82;
    *(_OWORD *)(v54 + 16) = v52;
    *(void *)(v54 + 32) = v84;
  }
  return result;
}

void sub_10004C568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id *location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,id a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

void sub_10004C604(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (!WeakRetained)
  {
LABEL_15:
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));
    goto LABEL_16;
  }
  if (([*(id *)(a1 + 32) cancelled] & 1) == 0)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          unint64_t v11 = objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v10, (void)v13);
          if (v11)
          {
            uint64_t v12 = [v5 objectForKeyedSubscript:v10];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [*(id *)(a1 + 48) addObject:v11];
              [*(id *)(a1 + 56) addObject:v12];
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    goto LABEL_15;
  }
LABEL_16:
}

uint64_t sub_10004C798(uint64_t a1, uint64_t a2)
{
  uint64_t result = (uint64_t)[*(id *)(a1 + 32) cancelled];
  if ((result & 1) == 0)
  {
    uint64_t v4 = si_tracing_current_span();
    long long v5 = *(_OWORD *)(v4 + 16);
    long long v113 = *(_OWORD *)v4;
    long long v114 = v5;
    uint64_t v115 = *(void *)(v4 + 32);
    uint64_t v6 = *(void *)v4;
    uint64_t spanid = si_tracing_calc_next_spanid();
    uint64_t v8 = *(void *)(v4 + 8);
    *(void *)uint64_t v4 = v6;
    *(void *)(v4 + _Block_object_dispose(&STACK[0x7B0], 8) = spanid;
    *(void *)(v4 + 16) = v8;
    *(unsigned char *)(v4 + 2_Block_object_dispose(&STACK[0x7B0], 8) = 102;
    *(void *)(v4 + 32) = "SPCoreSpotlightDatastore build results";
    si_tracing_log_span_begin();
    uint64_t v89 = v4;
    uint64_t v9 = *(void *)(a1 + 144);
    unint64_t v10 = v9 * a2;
    unint64_t v11 = v9 * a2 + v9;
    if (v11 >= *(void *)(a1 + 152)) {
      unint64_t v11 = *(void *)(a1 + 152);
    }
    unint64_t v95 = v11;
    if (v10 >= v11) {
      goto LABEL_105;
    }
    uint64_t v103 = SSSectionIdentifierSyndicatedLinks;
    uint64_t v97 = SSSectionIdentifierSyndicatedPhotos;
    uint64_t v90 = SSSectionIdentifierSyndicatedPhotosMessages;
    uint64_t v84 = SSSectionIdentifierSyndicatedPhotosNotes;
    uint64_t v78 = SSSectionIdentifierSyndicatedPhotosFiles;
    uint64_t v76 = SSSectionIdentifierSyndicatedPhotosFromPhotos;
    uint64_t v100 = SSSectionIdentifierUnsupportedSyndicatedContent;
    uint64_t v94 = SSPeopleBundleIdentifier;
    uint64_t v92 = SSSectionIdentifierPeopleSuggestions;
    uint64_t v88 = PRSRankingAppsBundleString;
    uint64_t v80 = SSContactsBundleIdentifier;
    uint64_t v79 = PRSRankingFindMyBundleString;
    uint64_t v77 = PRSRankingPeopleFindMyBundleString;
    uint64_t v93 = SSMessagesBundleIdentifier;
    uint64_t v91 = PRSRankingNotesBundleString;
    uint64_t v87 = PRSRankingLocalFilesBundleString;
    uint64_t v86 = PRSRankingFilesBundleString;
    uint64_t v85 = PRSRankingFileProviderFilesBundleString;
    uint64_t v96 = SSPhotosBundleIdentifier;
    while (1)
    {
      unint64_t v98 = v10;
      id v99 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:");
      uint64_t v101 = [v99 bundleIdentifier];
      if (([v101 isEqualToString:v103] & 1) != 0
        || ([v101 isEqualToString:v97] & 1) != 0
        || ([v101 isEqualToString:v90] & 1) != 0
        || ([v101 isEqualToString:v84] & 1) != 0
        || ([v101 isEqualToString:v78] & 1) != 0
        || ([v101 isEqualToString:v76] & 1) != 0)
      {
        goto LABEL_104;
      }
      uint64_t v12 = [v99 results];
      id v13 = [v12 copy];

      id v81 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v13, "count"));
      long long v83 = objc_opt_new();
      long long v111 = 0u;
      long long v112 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      id obj = v13;
      id v14 = [obj countByEnumeratingWithState:&v109 objects:v119 count:16];
      if (!v14) {
        goto LABEL_100;
      }
      uint64_t v104 = *(void *)v110;
      do
      {
        id v105 = v14;
        for (unint64_t i = 0; i != v105; unint64_t i = (char *)i + 1)
        {
          if (*(void *)v110 != v104) {
            objc_enumerationMutation(obj);
          }
          long long v16 = *(void **)(*((void *)&v109 + 1) + 8 * i);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (isKindOfClass)
          {
            double v18 = *(double *)(a1 + 160);
            uint64_t v19 = *(void *)(a1 + 48);
            int v20 = *(unsigned __int8 *)(a1 + 168);
            uint64_t v21 = [*(id *)(a1 + 32) queryContext];
            [v16 resultWithTime:v19 searchString:v20 != 0 isCorrectedQuery:v21 withQueryContext:v18];
            id v22 = (id)objc_claimAutoreleasedReturnValue();

            int v23 = [v16 rankingItem];
            BOOL v24 = [v23 L2FeatureVector];
            if (v24) {
              BOOL v25 = v16 == 0;
            }
            else {
              BOOL v25 = 1;
            }
            int v26 = !v25;

            if (v26)
            {
              v117[0] = @"score";
              [v23 score];
              unint64_t v27 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
              v118[0] = v27;
              v117[1] = @"raw score";
              [v23 rawScore];
              unint64_t v28 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
              v118[1] = v28;
              v117[2] = @"original score";
              id v29 = [v23 L2FeatureVector];
              [v29 originalL2Score];
              unint64_t v30 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
              v118[2] = v30;
              uint64_t v31 = +[NSDictionary dictionaryWithObjects:v118 forKeys:v117 count:3];
              [v22 setLocalFeatures:v31];
            }
            os_log_type_t v32 = [v16 rankingItem];
            [v32 score];
            objc_msgSend(v22, "setL2score:");

            if (!v22) {
              goto LABEL_44;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              int v23 = 0;
              id v22 = 0;
              goto LABEL_46;
            }
            id v22 = v16;
            int v23 = [v22 rankingItem];
            if (!v22) {
              goto LABEL_44;
            }
          }
          if (*(unsigned char *)(a1 + 169)
            && ([v22 protectionClass],
                id v33 = objc_claimAutoreleasedReturnValue(),
                unsigned int v34 = [v33 isEqualToString:@"Priority"],
                v33,
                v34))
          {
            [v22 setCoreSpotlightIndexUsed:2];
            if ([*(id *)(a1 + 56) priorityIndexFinishedInTime]) {
              uint64_t v35 = 2;
            }
            else {
              uint64_t v35 = 1;
            }
            [v22 setCoreSpotlightIndexUsedReason:v35];
          }
          else
          {
            [v22 setCoreSpotlightIndexUsed:1];
          }
          objc_msgSend(v22, "setIsFuzzyMatch:", objc_msgSend(*(id *)(a1 + 32), "needsReRunForFuzzy"));
          uint64_t v36 = [v22 sectionBundleIdentifier];
          id v37 = [v22 resultBundleId];
          if ([v36 isEqual:v103])
          {
            uint64_t v38 = (__CFString *)*(id *)(a1 + 64);
            objc_sync_enter(v38);
            [*(id *)(a1 + 64) addResults:v22];
            goto LABEL_39;
          }
          if ([v36 isEqual:v100]) {
            goto LABEL_43;
          }
          if ([v36 isEqual:v97])
          {
            if ([v37 isEqual:v93])
            {
              uint64_t v39 = [v23 sectionBundleIdentifier];
              unsigned int v40 = [v39 isEqualToString:v96];

              if (v40)
              {
                id v41 = *(id *)(a1 + 72);
                objc_sync_enter(v41);
                [*(id *)(a1 + 72) addResults:v22];
                goto LABEL_79;
              }
            }
            else
            {
              if ([v37 isEqual:v91])
              {
                float v46 = [v23 sectionBundleIdentifier];
                unsigned int v47 = [v46 isEqualToString:v96];

                if (!v47) {
                  goto LABEL_80;
                }
                id v41 = *(id *)(a1 + 80);
                objc_sync_enter(v41);
                [*(id *)(a1 + 80) addResults:v22];
              }
              else
              {
                v116[0] = v87;
                v116[1] = v86;
                v116[2] = v85;
                uint64_t v51 = +[NSArray arrayWithObjects:v116 count:3];
                unsigned int v52 = [v51 containsObject:v37];

                if (v52)
                {
                  uint64_t v53 = [v23 sectionBundleIdentifier];
                  unsigned int v54 = [v53 isEqualToString:v96];

                  if (!v54) {
                    goto LABEL_80;
                  }
                  id v41 = *(id *)(a1 + 88);
                  objc_sync_enter(v41);
                  [*(id *)(a1 + 88) addResults:v22];
                }
                else
                {
                  id v41 = *(id *)(a1 + 96);
                  objc_sync_enter(v41);
                  [*(id *)(a1 + 96) addResults:v22];
                }
              }
LABEL_79:
              objc_sync_exit(v41);
            }
LABEL_80:
            uint64_t v58 = [v23 sectionBundleIdentifier];
            unsigned int v59 = [v58 isEqualToString:v96];

            if (!v59) {
              goto LABEL_43;
            }
            uint64_t v38 = (__CFString *)*(id *)(a1 + 104);
            objc_sync_enter(v38);
            [*(id *)(a1 + 104) addResults:v22];
LABEL_39:
            objc_sync_exit(v38);
            goto LABEL_40;
          }
          if (([v36 isEqual:v94] & 1) == 0
            && ![v36 isEqual:v92])
          {
            if (([v36 isEqual:v88] & 1) != 0
              || ![v37 isEqual:v80])
            {
              uint64_t v55 = [v22 userActivityRequiredString];
              if ([v55 length])
              {
                if (([v101 isEqual:v79] & 1) != 0
                  || ([v101 isEqual:v77] & 1) != 0)
                {

LABEL_75:
                  goto LABEL_46;
                }
                char IsSyndicatedPhotos = SSSectionIsSyndicatedPhotos();

                if (IsSyndicatedPhotos) {
                  goto LABEL_75;
                }
              }
              else
              {
              }
              if ([v36 hasPrefix:@"com.apple"]) {
                goto LABEL_89;
              }
              if (!+[SSLocalCEP isLowEngagementBundle:v36])goto LABEL_89; {
              if (+[SSLocalCEP isAllowlistedBundle:v36])goto LABEL_89;
              }
              id v60 = [v22 rankingItem];
              if (v60)
              {
                unsigned __int8 v61 = [v22 rankingItem];
                [v61 mostRecentTimeToQueryInMinutesWithCurrentTime:CFAbsoluteTimeGetCurrent() topicality:0.0];
                BOOL v63 = v62 >= 129600.0;

                if (!v63) {
                  goto LABEL_89;
                }
              }
              if ([v22 hasTextContentMatch]) {
                goto LABEL_89;
              }
            }
            else if (([v22 hasTextContentMatch] & 1) != 0 || *(unsigned char *)(a1 + 170))
            {
              float v48 = [v22 contactIdentifier];

              if (v48)
              {
                float v49 = *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
                unsigned int v50 = [v22 contactIdentifier];
                [v49 setObject:v22 forKey:v50];
              }
LABEL_89:
              [v81 addObject:v22];
              goto LABEL_43;
            }
LABEL_90:
            id v64 = v36;
            if (v64) {
              uint64_t v38 = v64;
            }
            else {
              uint64_t v38 = @"empty_bundle";
            }
            uint64_t v65 = [v83 objectForKeyedSubscript:v38];
            uint64_t v66 = v65;
            if (v65)
            {
              id v67 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v65 unsignedIntValue] + 1);
              [v83 setObject:v67 forKeyedSubscript:v38];
            }
            else
            {
              [v83 setObject:&off_100098B88 forKeyedSubscript:v38];
            }

            goto LABEL_40;
          }
          float v42 = [v22 personIdentifier];
          if (!v42) {
            goto LABEL_43;
          }
          float v43 = [v22 personIdentifier];
          unsigned int v44 = [v43 hasPrefix:@"com.apple.spotlight"];

          if (!v44) {
            goto LABEL_43;
          }
          id v45 = [v22 personType];
          if (([v45 isEqual:@"ml"] & 1) != 0
            || ([v22 hasTextContentMatch] & 1) == 0)
          {
            BOOL v56 = *(unsigned char *)(a1 + 170) == 0;

            if (v56) {
              goto LABEL_90;
            }
          }
          else
          {
          }
          unint64_t v57 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
          uint64_t v38 = [v22 personIdentifier];
          [v57 setObject:v22 forKey:v38];
LABEL_40:

LABEL_43:
LABEL_44:
          if (isKindOfClass) {
            [v16 clearClientData];
          }
LABEL_46:
        }
        id v14 = [obj countByEnumeratingWithState:&v109 objects:v119 count:16];
      }
      while (v14);
LABEL_100:

      [v99 setResults:v81];
      v107[0] = _NSConcreteStackBlock;
      v107[1] = 3221225472;
      v107[2] = sub_10004D528;
      v107[3] = &unk_1000938C0;
      id v108 = *(id *)(a1 + 32);
      [v83 enumerateKeysAndObjectsUsingBlock:v107];
      if ([*(id *)(a1 + 32) cancelled])
      {

        goto LABEL_105;
      }
      id v69 = [v99 bundleIdentifier];
      unsigned int v70 = [v69 isEqualToString:off_1000A8A58[0]];

      if (v70)
      {
        unsigned int v71 = [*(id *)(a1 + 56) job];
        uint64_t v72 = [v71 _docIDsToResultsDictionaryForSection:*(void *)(*(void *)(*(void *)(a1 + 136) + 8) + 40)];
        uint64_t v73 = *(void *)(*(void *)(a1 + 128) + 8);
        long long v74 = *(void **)(v73 + 40);
        *(void *)(v73 + 40) = v72;
      }
LABEL_104:

      unint64_t v10 = v98 + 1;
      if (v98 + 1 == v95)
      {
LABEL_105:
        uint64_t result = si_tracing_log_span_end();
        long long v75 = v114;
        *(_OWORD *)uint64_t v89 = v113;
        *(_OWORD *)(v89 + 16) = v75;
        *(void *)(v89 + 32) = v115;
        return result;
      }
    }
  }
  return result;
}

void sub_10004D4A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
}

void sub_10004D528(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = SPLogForSPLogCategoryRanking();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) queryIdent];
    int v9 = 134218498;
    id v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 1024;
    unsigned int v14 = [v6 unsignedIntValue];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] Filtering qid=%llu section=%@: removed items count=%u", (uint8_t *)&v9, 0x1Cu);
  }
}

int64_t sub_10004D61C(id a1, id a2, id a3)
{
  id v4 = a3;
  [a2 rankingScore];
  double v6 = v5;
  [v4 rankingScore];
  double v8 = v7;

  if (v6 <= v8) {
    return 1;
  }
  else {
    return -1;
  }
}

int64_t sub_10004D674(id a1, id a2, id a3)
{
  id v4 = a3;
  [a2 rankingScore];
  double v6 = v5;
  [v4 rankingScore];
  double v8 = v7;

  if (v6 <= v8) {
    return 1;
  }
  else {
    return -1;
  }
}

__n128 sub_10004D6CC(uint64_t a1, uint64_t a2)
{
  if (([*(id *)(a1 + 48) cancelled] & 1) == 0)
  {
    uint64_t v5 = si_tracing_current_span();
    __n128 v17 = *(__n128 *)v5;
    long long v18 = *(_OWORD *)(v5 + 16);
    uint64_t v19 = *(void *)(v5 + 32);
    uint64_t v6 = *(void *)v5;
    uint64_t spanid = si_tracing_calc_next_spanid();
    uint64_t v8 = *(void *)(v5 + 8);
    *(void *)uint64_t v5 = v6;
    *(void *)(v5 + _Block_object_dispose(&STACK[0x7B0], 8) = spanid;
    *(void *)(v5 + 16) = v8;
    *(unsigned char *)(v5 + 2_Block_object_dispose(&STACK[0x7B0], 8) = 102;
    *(void *)(v5 + 32) = "SPCoreSpotlightDatastore process section";
    si_tracing_log_span_begin();
    uint64_t v10 = *(void *)(a1 + 80);
    unint64_t v11 = v10 * a2;
    unint64_t v12 = v11 + v10;
    if (v12 >= *(void *)(a1 + 88)) {
      unint64_t v13 = *(void *)(a1 + 88);
    }
    else {
      unint64_t v13 = v12;
    }
    if (v11 < v13)
    {
      do
      {
        if (objc_msgSend(*(id *)(a1 + 48), "cancelled", *(_OWORD *)&v17, v18, v19)) {
          break;
        }
        unsigned int v14 = [*(id *)(a1 + 56) objectAtIndexedSubscript:v11];
        long long v15 = [v14 results];
        id v16 = [v15 count];

        if (v16) {
          objc_msgSend(*(id *)(a1 + 64), "processSection:forQuery:rawQuery:usingTopHitThreshold:", v14, *(void *)(a1 + 48), *(void *)(a1 + 72), *(void *)(a1 + 32), *(void *)(a1 + 40));
        }

        ++v11;
      }
      while (v13 != v11);
    }
    si_tracing_log_span_end();
    __n128 result = v17;
    *(__n128 *)uint64_t v5 = v17;
    *(_OWORD *)(v5 + 16) = v18;
    *(void *)(v5 + 32) = v19;
  }
  return result;
}

void sub_10004D830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

__n128 sub_10004D850(uint64_t a1, uint64_t a2)
{
  if (([*(id *)(a1 + 32) cancelled] & 1) == 0)
  {
    uint64_t v5 = si_tracing_current_span();
    __n128 v16 = *(__n128 *)v5;
    long long v17 = *(_OWORD *)(v5 + 16);
    uint64_t v18 = *(void *)(v5 + 32);
    uint64_t v6 = *(void *)v5;
    uint64_t spanid = si_tracing_calc_next_spanid();
    uint64_t v8 = *(void *)(v5 + 8);
    *(void *)uint64_t v5 = v6;
    *(void *)(v5 + _Block_object_dispose(&STACK[0x7B0], 8) = spanid;
    *(void *)(v5 + 16) = v8;
    *(unsigned char *)(v5 + 2_Block_object_dispose(&STACK[0x7B0], 8) = 102;
    *(void *)(v5 + 32) = "SPCoreSpotlightDatastore filter iCloud dupes";
    si_tracing_log_span_begin();
    uint64_t v10 = *(void *)(a1 + 72);
    unint64_t v11 = v10 * a2;
    unint64_t v12 = v11 + v10;
    if (v12 >= *(void *)(a1 + 80)) {
      unint64_t v13 = *(void *)(a1 + 80);
    }
    else {
      unint64_t v13 = v12;
    }
    if (v11 < v13)
    {
      do
      {
        if (objc_msgSend(*(id *)(a1 + 32), "cancelled", *(_OWORD *)&v16, v17, v18)) {
          break;
        }
        unsigned int v14 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v11];
        long long v15 = [*(id *)(a1 + 48) job];
        [v15 _filterDuplicateiCloudDriveResultsForSection:v14 iCloudDriveSection:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) iCloudDriveResultsDictionary:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

        ++v11;
      }
      while (v13 != v11);
    }
    si_tracing_log_span_end();
    __n128 result = v16;
    *(__n128 *)uint64_t v5 = v16;
    *(_OWORD *)(v5 + 16) = v17;
    *(void *)(v5 + 32) = v18;
  }
  return result;
}

void sub_10004D9B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

BOOL sub_10004D9E0@<W0>(NSObject *a1@<X0>, unsigned char *a2@<X8>)
{
  BOOL v3 = *a2 == 0;
  return os_log_type_enabled(a1, (os_log_type_t)(2 * v3));
}

void sub_10004DA04(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_impl(a1, v9, v10, a4, &a9, 2u);
}

void sub_10004DA24(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_10004DA44()
{
  if (qword_1000A9030 != -1) {
    dispatch_once(&qword_1000A9030, &stru_100093998);
  }
  uint64_t v0 = (void *)qword_1000A9028;

  return v0;
}

void sub_10004DA98(id a1)
{
  qword_1000A9028 = rankingPrefetchedAttributesArray();

  _objc_release_x1();
}

BOOL sub_10004DD50(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 fileProviderIdentifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = [v1 fileProviderIdentifier];
    if ([v4 length])
    {
      uint64_t v5 = [v1 userActivityRequiredString];
      BOOL v6 = v5 == 0;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

unsigned int *sub_10004DEA0(uint64_t a1, void *a2)
{
  id v4 = (unsigned int *)malloc_type_calloc(1uLL, 0x90uLL, 0x10E004034F55327uLL);
  atomic_store(1u, v4);
  *((void *)v4 + 7) = a1;
  uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)*(unsigned __int8 *)a2);
  v5.i16[0] = vaddlv_u8(v5);
  uint64_t v6 = *(void *)(*(void *)(a2[7] + 8 * v5.u32[0]) + 40);
  *((void *)v4 + 2) = *(void *)(*(void *)(a2[7] + 8 * v5.u32[0]) + 32);
  *((void *)v4 + 3) = v6;
  double v7 = sub_10004E20C((uint64_t)a2, 10);
  if (([v7 isEqualToString:@"com.apple.mobilemail"] & 1) == 0)
  {
    uint64_t v12 = 0;
    while (1)
    {
      uint64_t v13 = sub_10004DFE0((uint64_t)a2, dword_100074A90[v12]);
      if (v13)
      {
        double v10 = *(double *)(v13 + 32);
        if (v10 != 0.0) {
          break;
        }
      }
      if (++v12 == 7) {
        goto LABEL_12;
      }
    }
    int v11 = 7 - v12;
    goto LABEL_11;
  }
  if ((*a2 & 0x100000000) != 0)
  {
    uint8x8_t v8 = (uint8x8_t)vcnt_s8((int8x8_t)*a2);
    v8.i16[0] = vaddlv_u8(v8);
    uint64_t v9 = *(void *)(a2[7] + 8 * v8.u32[0]);
    if (v9)
    {
      double v10 = *(double *)(v9 + 32);
      int v11 = 1;
LABEL_11:
      v4[12] = v11;
      *((double *)v4 + 5) = v10;
    }
  }
LABEL_12:
  float v14 = sub_10004E33C((uint64_t)a2, 144);
  *((float *)v4 + 13) = v14;

  return v4;
}

uint64_t sub_10004DFE0(uint64_t a1, uint64_t a2)
{
  if (a2 > 383) {
    return 0;
  }
  uint64_t v3 = 1 << a2;
  if (a2 > 63)
  {
    if ((unint64_t)a2 > 0x7F)
    {
      if ((unint64_t)a2 > 0xBF)
      {
        if ((unint64_t)a2 > 0xFF)
        {
          if ((unint64_t)a2 > 0x13F)
          {
            uint64_t v22 = *(void *)(a1 + 40);
            if ((v22 & v3) == 0) {
              return 0;
            }
            char v23 = vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)(v22 & (v3 - 1))));
            char v21 = vaddvq_s64((int64x2_t)vpadalq_u32(vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)a1)))), vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(a1 + 16))))));
            char v20 = v23 + vaddlv_u8((uint8x8_t)vcnt_s8(*(int8x8_t *)(a1 + 32)));
          }
          else
          {
            uint64_t v19 = *(void *)(a1 + 32);
            if ((v19 & v3) == 0) {
              return 0;
            }
            char v20 = vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)(v19 & (v3 - 1))));
            char v21 = vaddvq_s64((int64x2_t)vpadalq_u32(vpaddlq_u32(vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)a1)))), vpaddlq_u16(vpaddlq_u8((uint8x16_t)vcntq_s8(*(int8x16_t *)(a1 + 16))))));
          }
          unsigned __int8 v18 = v21 + v20;
        }
        else
        {
          uint64_t v17 = *(void *)(a1 + 24);
          if ((v17 & v3) == 0) {
            return 0;
          }
          unsigned __int8 v18 = vaddlv_u8((uint8x8_t)vcnt_s8(*(int8x8_t *)a1))
              + vaddlv_u8((uint8x8_t)vcnt_s8((int8x8_t)(v17 & (v3 - 1))))
              + vaddlv_u8((uint8x8_t)vcnt_s8(*(int8x8_t *)(a1 + 8)))
              + vaddlv_u8((uint8x8_t)vcnt_s8(*(int8x8_t *)(a1 + 16)));
        }
        uint64_t v5 = *(void *)(a1 + 56) + 8 * v18;
        return *(void *)v5;
      }
      uint64_t v11 = *(void *)(a1 + 16);
      if ((v11 & v3) == 0) {
        return 0;
      }
      uint8x8_t v12 = (uint8x8_t)vcnt_s8(*(int8x8_t *)a1);
      v12.i16[0] = vaddlv_u8(v12);
      uint64_t v13 = v12.u32[0];
      uint8x8_t v14 = (uint8x8_t)vcnt_s8(*(int8x8_t *)(a1 + 8));
      v14.i16[0] = vaddlv_u8(v14);
      uint64_t v15 = v14.u32[0];
      uint8x8_t v16 = (uint8x8_t)vcnt_s8((int8x8_t)(v11 & (v3 - 1)));
      v16.i16[0] = vaddlv_u8(v16);
      uint64_t v10 = v13 + v15 + v16.u32[0];
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 8);
      if ((v6 & v3) == 0) {
        return 0;
      }
      uint8x8_t v7 = (uint8x8_t)vcnt_s8(*(int8x8_t *)a1);
      v7.i16[0] = vaddlv_u8(v7);
      uint64_t v8 = v7.u32[0];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)(v6 & (v3 - 1)));
      v9.i16[0] = vaddlv_u8(v9);
      uint64_t v10 = v8 + v9.u32[0];
    }
    uint64_t v5 = *(void *)(a1 + 56) + 8 * v10;
    return *(void *)v5;
  }
  if ((*(void *)a1 & v3) == 0) {
    return 0;
  }
  uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)a1 & (v3 - 1)));
  v4.i16[0] = vaddlv_u8(v4);
  uint64_t v5 = *(void *)(a1 + 56) + 8 * v4.u32[0];
  return *(void *)v5;
}

_DWORD *sub_10004E20C(uint64_t a1, CFIndex a2)
{
  if (*(void *)(a1 + 64))
  {
    uint8x8_t v4 = sub_10004E794(a1, a2);
    objc_opt_class();
    uint64_t v5 = (objc_opt_isKindOfClass() & 1) != 0 ? v4 : 0;
    uint64_t v6 = v5;
    if (v6)
    {
      uint8x8_t v7 = v6;
      goto LABEL_21;
    }
  }
  uint64_t v8 = (_DWORD *)sub_10004DFE0(a1, a2);
  if (v8)
  {
    uint8x8_t v9 = v8;
    int v10 = v8[6];
    if (v10 == 18)
    {
      if (v8[5]) {
        goto LABEL_17;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v11 = 0;
LABEL_19:
        uint64_t v8 = v11;
        goto LABEL_20;
      }
    }
    else
    {
      if (v10 != 16)
      {
        if (v10 == 1 && !v8[5])
        {
          uint64_t v8 = [objc_alloc((Class)NSString) initWithCString:*((void *)v8 + 4) encoding:4];
          goto LABEL_20;
        }
LABEL_17:
        uint64_t v8 = 0;
        goto LABEL_20;
      }
      if (v8[5]) {
        goto LABEL_17;
      }
    }
    uint64_t v11 = (void *)*((void *)v9 + 4);
    goto LABEL_19;
  }
LABEL_20:
  uint8x8_t v4 = v8;
LABEL_21:

  return v4;
}

double sub_10004E33C(uint64_t a1, CFIndex a2)
{
  if (!*(void *)(a1 + 64)) {
    goto LABEL_9;
  }
  CFNumberRef v4 = (const __CFNumber *)sub_10004E794(a1, a2);
  if (!v4) {
    goto LABEL_9;
  }
  CFNumberRef v5 = v4;
  double valuePtr = 0.0;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFNumberGetTypeID())
  {
    CFNumberGetValue(v5, kCFNumberDoubleType, &valuePtr);
    return valuePtr;
  }
  CFTypeID v8 = CFGetTypeID(v5);
  if (v8 == CFBooleanGetTypeID())
  {
    int Value = CFBooleanGetValue(v5);
    double result = 1.0;
    if (!Value) {
      return 0.0;
    }
  }
  else
  {
LABEL_9:
    uint64_t v10 = sub_10004DFE0(a1, a2);
    double result = 0.0;
    if (v10)
    {
      switch(*(_DWORD *)(v10 + 24))
      {
        case 2:
        case 7:
          return (double)*(uint64_t *)(v10 + 32);
        case 3:
        case 8:
          int v11 = *(_DWORD *)(v10 + 32);
          goto LABEL_15;
        case 4:
        case 9:
          int v11 = *(__int16 *)(v10 + 32);
          goto LABEL_15;
        case 5:
        case 0xA:
          int v11 = *(char *)(v10 + 32);
LABEL_15:
          double result = (double)v11;
          break;
        case 0xB:
          double result = *(float *)(v10 + 32);
          break;
        case 0xC:
          double result = *(double *)(v10 + 32);
          break;
        case 0xE:
          if (*(unsigned char *)(v10 + 32)) {
            double result = 1.0;
          }
          break;
        default:
          return result;
      }
    }
  }
  return result;
}

CFTypeRef sub_10004E4B4(uint64_t a1, uint64_t a2, CFTypeRef cf)
{
  *(_OWORD *)(a1 + 64) = *(_OWORD *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  long long v5 = *(_OWORD *)(a2 + 48);
  *(void *)(a1 + 12_Block_object_dispose(&STACK[0x7B0], 8) = *(void *)(a2 + 64);
  *(_OWORD *)(a1 + 96) = v4;
  *(_OWORD *)(a1 + 112) = v5;
  *(_OWORD *)(a1 + 80) = v3;
  *(void *)(a2 + 56) = 0;
  *(void *)(a1 + 32) = cf;
  return CFRetain(cf);
}

void sub_10004E4E4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 120);
  if (v2)
  {
    uint64_t v3 = *(unsigned __int8 *)(a1 + 113);
    if (*(unsigned char *)(a1 + 113))
    {
      long long v4 = *(uint64_t **)(a1 + 120);
      do
      {
        uint64_t v5 = *v4++;
        sub_10004E564(v5);
        --v3;
      }
      while (v3);
    }
    free(v2);
  }
  CFTypeID v6 = *(const void **)(a1 + 128);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 12_Block_object_dispose(&STACK[0x7B0], 8) = 0;
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));

  free((void *)a1);
}

void sub_10004E564(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 16);
  if (v2)
  {
    *(_DWORD *)(a1 + 16) = v2 - 1;
    return;
  }
  int v3 = *(_DWORD *)(a1 + 20);
  if (v3 == 2)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = *(_DWORD *)(v5 + 64);
    long long v7 = *(_OWORD *)(v5 + 48);
    long long v12 = *(_OWORD *)(v5 + 32);
    long long v13 = v7;
    sub_10004F820((uint64_t *)&v12, v6);
    int v8 = *(_DWORD *)(v5 + 112);
    long long v9 = *(_OWORD *)(v5 + 96);
    long long v12 = *(_OWORD *)(v5 + 80);
    long long v13 = v9;
    sub_10004F820((uint64_t *)&v12, v8);
    uint64_t v10 = (void *)v5;
LABEL_17:
    free(v10);
    goto LABEL_18;
  }
  if (v3 == 3)
  {
    if (*(_DWORD *)(a1 + 24) == 1 && *(void *)(a1 + 32))
    {
      unint64_t v4 = 0;
      do
        free(*(void **)(*(void *)(a1 + 40) + 8 * v4++));
      while (*(void *)(a1 + 32) > v4);
    }
    goto LABEL_16;
  }
  int v11 = *(_DWORD *)(a1 + 24);
  if ((v11 - 16) < 3)
  {
    CFRelease(*(CFTypeRef *)(a1 + 32));
    goto LABEL_18;
  }
  if (v11 == 15)
  {
LABEL_16:
    uint64_t v10 = *(void **)(a1 + 40);
    goto LABEL_17;
  }
  if (v11 == 1)
  {
    uint64_t v10 = *(void **)(a1 + 32);
    goto LABEL_17;
  }
LABEL_18:

  free((void *)a1);
}

void sub_10004E6C0(uint64_t a1, atomic_uint *a2)
{
  if (atomic_fetch_add(a2, 0xFFFFFFFF) == 1) {
    sub_10004E4E4((uint64_t)a2);
  }
}

atomic_uint *sub_10004E6DC(uint64_t a1, atomic_uint *a2)
{
  double result = a2;
  atomic_fetch_add(a2, 1u);
  return result;
}

uint64_t sub_10004E6EC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = sub_10004DFE0(a1, a2);
  if (!v4 || *(_DWORD *)(v4 + 24) != 4 || *(_DWORD *)(v4 + 20) != 3) {
    return 0;
  }
  uint64_t v5 = *(void *)(v4 + 40);
  *a3 = *(void *)(v4 + 32);
  return v5;
}

uint64_t sub_10004E740(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = sub_10004DFE0(a1, a2);
  if (!v4 || *(_DWORD *)(v4 + 24) != 7 || *(_DWORD *)(v4 + 20) != 3) {
    return 0;
  }
  uint64_t v5 = *(void *)(v4 + 40);
  *a3 = *(void *)(v4 + 32);
  return v5;
}

const void *sub_10004E794(uint64_t a1, CFIndex a2)
{
  if (CFArrayGetCount(*(CFArrayRef *)(a1 + 64)) <= a2) {
    return 0;
  }
  CFArrayRef v4 = *(const __CFArray **)(a1 + 64);

  return CFArrayGetValueAtIndex(v4, a2);
}

id sub_10004E7F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_10004DFE0(a1, a2);
  if (v2 && *(_DWORD *)(v2 + 24) == 7 && *(_DWORD *)(v2 + 20) == 3)
  {
    uint64_t v3 = *(void *)(v2 + 32);
    CFArrayRef v4 = *(uint64_t **)(v2 + 40);
  }
  else
  {
    uint64_t v3 = 0;
    CFArrayRef v4 = 0;
  }
  for (id i = [objc_alloc((Class)NSMutableArray) initWithCapacity:v3]; v3; --v3)
  {
    id v6 = objc_alloc((Class)NSNumber);
    uint64_t v7 = *v4++;
    id v8 = [v6 initWithLongLong:v7];
    [i addObject:v8];
  }
  id v9 = [i copy];

  return v9;
}

void *sub_10004E8BC(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 64)
    && ((CFArrayRef v4 = sub_10004E794(a1, a2), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) ? (v5 = 0) : (v5 = v4),
        (id v6 = v5) != 0))
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = sub_10004DFE0(a1, a2);
    id v9 = (void *)v8;
    if (v8)
    {
      int v10 = *(_DWORD *)(v8 + 24);
      if (v10 == 17)
      {
        id v9 = *(id *)(v8 + 32);
      }
      else if (v10 == 1 && *(_DWORD *)(v8 + 20) == 3)
      {
        id v11 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*(void *)(v8 + 32)];
        if (v9[4])
        {
          unint64_t v12 = 0;
          do
          {
            id v13 = [objc_alloc((Class)NSString) initWithCString:*(void *)(v9[5] + 8 * v12) encoding:4];
            [v11 addObject:v13];

            ++v12;
          }
          while (v12 < v9[4]);
        }
        id v9 = [v11 copy];
      }
      else
      {
        id v9 = 0;
      }
    }
    CFArrayRef v4 = v9;
  }

  return v4;
}

double *sub_10004EA18(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 64)
    && ((CFArrayRef v4 = (double *)sub_10004E794(a1, a2), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      ? (uint64_t v5 = 0)
      : (uint64_t v5 = v4),
        (id v6 = v5) != 0))
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = (double *)sub_10004DFE0(a1, a2);
    if (v8)
    {
      if (*((_DWORD *)v8 + 6) == 13 && !*((_DWORD *)v8 + 5)) {
        uint64_t v8 = (double *)[objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:v8[4]];
      }
      else {
        uint64_t v8 = 0;
      }
    }
    CFArrayRef v4 = v8;
  }

  return v4;
}

_DWORD *sub_10004EAF0(uint64_t a1, CFIndex a2)
{
  if (*(void *)(a1 + 64))
  {
    CFArrayRef v4 = sub_10004E794(a1, a2);
    objc_opt_class();
    uint64_t v5 = (objc_opt_isKindOfClass() & 1) != 0 ? v4 : 0;
    id v6 = v5;
    if (v6)
    {
      id v7 = v6;
      goto LABEL_15;
    }
  }
  uint64_t v8 = (_DWORD *)sub_10004DFE0(a1, a2);
  if (v8)
  {
    id v9 = v8;
    int v10 = v8[6];
    if (v10 == 18)
    {
      if (!v8[5])
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          unint64_t v12 = (void *)*((void *)v9 + 4);
        }
        else {
          unint64_t v12 = 0;
        }
        uint64_t v8 = v12;
        goto LABEL_14;
      }
    }
    else if (v10 == 15 && !v8[5])
    {
      uint64_t v8 = +[NSData dataWithBytes:*((void *)v8 + 5) length:*((void *)v8 + 4)];
      goto LABEL_14;
    }
    uint64_t v8 = 0;
  }
LABEL_14:
  CFArrayRef v4 = v8;
LABEL_15:

  return v4;
}

void *sub_10004EC0C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 64)
    && ((CFArrayRef v4 = sub_10004E794(a1, a2), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) ? (v5 = 0) : (v5 = v4),
        (id v6 = v5) != 0))
  {
    id v7 = v6;
  }
  else
  {
    uint64_t v8 = sub_10004DFE0(a1, a2);
    id v9 = (void *)v8;
    if (v8)
    {
      if (*(_DWORD *)(v8 + 24) == 13 && *(_DWORD *)(v8 + 20) == 3)
      {
        id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*(void *)(v8 + 32)];
        if (v9[4])
        {
          unint64_t v11 = 0;
          do
          {
            id v12 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:*(double *)(v9[5] + 8 * v11)];
            [v10 addObject:v12];

            ++v11;
          }
          while (v11 < v9[4]);
        }
        id v9 = [v10 copy];
      }
      else
      {
        id v9 = 0;
      }
    }
    CFArrayRef v4 = v9;
  }

  return v4;
}

uint64_t sub_10004ED4C(uint64_t a1, CFIndex a2)
{
  if (!*(void *)(a1 + 64)) {
    goto LABEL_7;
  }
  CFNumberRef v4 = (const __CFNumber *)sub_10004E794(a1, a2);
  if (!v4) {
    goto LABEL_7;
  }
  CFNumberRef v5 = v4;
  uint64_t valuePtr = 0;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFNumberGetTypeID())
  {
    CFNumberGetValue(v5, kCFNumberLongLongType, &valuePtr);
    BOOL v7 = valuePtr == 0;
    return !v7;
  }
  CFTypeID v8 = CFGetTypeID(v5);
  if (v8 == CFBooleanGetTypeID())
  {
    BOOL v7 = CFBooleanGetValue(v5) == 0;
  }
  else
  {
LABEL_7:
    uint64_t result = sub_10004DFE0(a1, a2);
    if (!result) {
      return result;
    }
    if (*(_DWORD *)(result + 24) != 14 || *(_DWORD *)(result + 20)) {
      return 0;
    }
    BOOL v7 = *(unsigned char *)(result + 32) == 0;
  }
  return !v7;
}

uint64_t sub_10004EE30(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_10004DFE0(a1, a2);
  if (v2) {
    return *(unsigned int *)(v2 + 24);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

BOOL sub_10004EE58(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_10004DFE0(a1, a2);
  return *(_DWORD *)(v2 + 24) == 7 && *(_DWORD *)(v2 + 20) == 3;
}

void *sub_10004EE94(char *a1, double a2)
{
  uint64_t v2 = a1;
  if (a1)
  {
    switch(*((_DWORD *)a1 + 6))
    {
      case 1:
        if (*((_DWORD *)a1 + 5) != 3)
        {
          uint64_t v3 = [objc_alloc((Class)NSString) initWithCString:*((void *)a1 + 4) encoding:4];
          goto LABEL_84;
        }
        id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)a1 + 4)];
        if (v2[4])
        {
          unint64_t v5 = 0;
          do
          {
            id v6 = [objc_alloc((Class)NSString) initWithCString:*(void *)(v2[5] + 8 * v5) encoding:4];
            if (v6) {
              [v4 addObject:v6];
            }

            ++v5;
          }
          while (v5 < v2[4]);
        }
        goto LABEL_72;
      case 2:
        if (*((_DWORD *)a1 + 5) != 3) {
          goto LABEL_75;
        }
        id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)a1 + 4)];
        if (v2[4])
        {
          unint64_t v7 = 0;
          do
          {
            CFTypeID v8 = +[NSNumber numberWithLongLong:*(void *)(v2[5] + 8 * v7)];
            [v4 addObject:v8];

            ++v7;
          }
          while (v7 < v2[4]);
        }
        goto LABEL_72;
      case 3:
        if (*((_DWORD *)a1 + 5) != 3) {
          goto LABEL_76;
        }
        id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)a1 + 4)];
        if (v2[4])
        {
          unint64_t v9 = 0;
          do
          {
            id v10 = +[NSNumber numberWithInt:*(unsigned int *)(v2[5] + 4 * v9)];
            [v4 addObject:v10];

            ++v9;
          }
          while (v9 < v2[4]);
        }
        goto LABEL_72;
      case 4:
        if (*((_DWORD *)a1 + 5) != 3) {
          goto LABEL_77;
        }
        id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)a1 + 4)];
        if (v2[4])
        {
          unint64_t v11 = 0;
          do
          {
            id v12 = +[NSNumber numberWithShort:*(__int16 *)(v2[5] + 2 * v11)];
            [v4 addObject:v12];

            ++v11;
          }
          while (v11 < v2[4]);
        }
        goto LABEL_72;
      case 5:
        if (*((_DWORD *)a1 + 5) != 3) {
          goto LABEL_78;
        }
        id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)a1 + 4)];
        if (v2[4])
        {
          unint64_t v13 = 0;
          do
          {
            uint8x8_t v14 = +[NSNumber numberWithChar:*(char *)(v2[5] + v13)];
            [v4 addObject:v14];

            ++v13;
          }
          while (v13 < v2[4]);
        }
        goto LABEL_72;
      case 6:
        uint64_t v15 = a1 + 32;
        uint64_t v16 = 16;
        goto LABEL_74;
      case 7:
        if (*((_DWORD *)a1 + 5) != 3)
        {
LABEL_75:
          uint64_t v3 = +[NSNumber numberWithLongLong:*((void *)a1 + 4)];
          goto LABEL_84;
        }
        id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)a1 + 4)];
        if (v2[4])
        {
          unint64_t v17 = 0;
          do
          {
            unsigned __int8 v18 = +[NSNumber numberWithLongLong:*(void *)(v2[5] + 8 * v17)];
            [v4 addObject:v18];

            ++v17;
          }
          while (v17 < v2[4]);
        }
        goto LABEL_72;
      case 8:
        if (*((_DWORD *)a1 + 5) != 3)
        {
LABEL_76:
          uint64_t v3 = +[NSNumber numberWithInt:*((unsigned int *)a1 + 8)];
          goto LABEL_84;
        }
        id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)a1 + 4)];
        if (v2[4])
        {
          unint64_t v19 = 0;
          do
          {
            char v20 = +[NSNumber numberWithInt:*(unsigned int *)(v2[5] + 4 * v19)];
            [v4 addObject:v20];

            ++v19;
          }
          while (v19 < v2[4]);
        }
        goto LABEL_72;
      case 9:
        if (*((_DWORD *)a1 + 5) != 3)
        {
LABEL_77:
          uint64_t v3 = +[NSNumber numberWithShort:*((__int16 *)a1 + 16)];
          goto LABEL_84;
        }
        id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)a1 + 4)];
        if (v2[4])
        {
          unint64_t v21 = 0;
          do
          {
            uint64_t v22 = +[NSNumber numberWithShort:*(__int16 *)(v2[5] + 2 * v21)];
            [v4 addObject:v22];

            ++v21;
          }
          while (v21 < v2[4]);
        }
        goto LABEL_72;
      case 0xA:
        if (*((_DWORD *)a1 + 5) != 3)
        {
LABEL_78:
          uint64_t v3 = +[NSNumber numberWithChar:a1[32]];
          goto LABEL_84;
        }
        id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)a1 + 4)];
        if (v2[4])
        {
          unint64_t v23 = 0;
          do
          {
            BOOL v24 = +[NSNumber numberWithChar:*(char *)(v2[5] + v23)];
            [v4 addObject:v24];

            ++v23;
          }
          while (v23 < v2[4]);
        }
        goto LABEL_72;
      case 0xB:
        if (*((_DWORD *)a1 + 5) != 3)
        {
          LODWORD(a2) = *((_DWORD *)a1 + 8);
          uint64_t v3 = +[NSNumber numberWithFloat:a2];
          goto LABEL_84;
        }
        id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)a1 + 4)];
        if (v2[4])
        {
          unint64_t v26 = 0;
          do
          {
            LODWORD(v25) = *(_DWORD *)(v2[5] + 4 * v26);
            unint64_t v27 = +[NSNumber numberWithFloat:v25];
            [v4 addObject:v27];

            ++v26;
          }
          while (v26 < v2[4]);
        }
        goto LABEL_72;
      case 0xC:
        if (*((_DWORD *)a1 + 5) != 3)
        {
          uint64_t v3 = +[NSNumber numberWithDouble:*((double *)a1 + 4)];
          goto LABEL_84;
        }
        id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)a1 + 4)];
        if (v2[4])
        {
          unint64_t v28 = 0;
          do
          {
            id v29 = +[NSNumber numberWithDouble:*(double *)(v2[5] + 8 * v28)];
            [v4 addObject:v29];

            ++v28;
          }
          while (v28 < v2[4]);
        }
        goto LABEL_72;
      case 0xD:
        if (*((_DWORD *)a1 + 5) != 3)
        {
          uint64_t v3 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:*((double *)a1 + 4)];
          goto LABEL_84;
        }
        id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)a1 + 4)];
        if (v2[4])
        {
          unint64_t v30 = 0;
          do
          {
            id v31 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:*(double *)(v2[5] + 8 * v30)];
            [v4 addObject:v31];

            ++v30;
          }
          while (v30 < v2[4]);
        }
        goto LABEL_72;
      case 0xE:
        if (*((_DWORD *)a1 + 5) == 3)
        {
          id v4 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*((void *)a1 + 4)];
          if (v2[4])
          {
            unint64_t v32 = 0;
            do
            {
              id v33 = +[NSNumber numberWithBool:*(unsigned __int8 *)(v2[5] + v32)];
              [v4 addObject:v33];

              ++v32;
            }
            while (v32 < v2[4]);
          }
LABEL_72:
          uint64_t v2 = [v4 copy];
        }
        else
        {
          uint64_t v3 = +[NSNumber numberWithBool:a1[32]];
LABEL_84:
          uint64_t v2 = v3;
        }
        break;
      case 0xF:
        uint64_t v16 = *((void *)a1 + 4);
        uint64_t v15 = (char *)*((void *)a1 + 5);
LABEL_74:
        uint64_t v3 = +[NSData dataWithBytes:v15 length:v16];
        goto LABEL_84;
      case 0x10:
      case 0x11:
      case 0x12:
        uint64_t v3 = *((id *)a1 + 4);
        goto LABEL_84;
      default:
        uint64_t v2 = 0;
        break;
    }
  }

  return v2;
}

CFNullRef sub_10004F638(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 64) && (CFNullRef v4 = (CFNullRef)sub_10004E794(a1, a2)) != 0 && v4 != kCFNull)
  {
    CFNullRef v5 = v4;
  }
  else
  {
    id v6 = (char *)sub_10004DFE0(a1, a2);
    sub_10004EE94(v6, v7);
    CFNullRef v5 = (const __CFNull *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t sub_10004F6B4(uint64_t a1, CFIndex a2)
{
  if (!*(void *)(a1 + 64)) {
    goto LABEL_7;
  }
  CFNumberRef v4 = (const __CFNumber *)sub_10004E794(a1, a2);
  if (!v4) {
    goto LABEL_7;
  }
  CFNumberRef v5 = v4;
  uint64_t valuePtr = 0;
  CFTypeID v6 = CFGetTypeID(v4);
  if (v6 == CFNumberGetTypeID())
  {
    CFNumberGetValue(v5, kCFNumberLongLongType, &valuePtr);
    return valuePtr;
  }
  CFTypeID v8 = CFGetTypeID(v5);
  if (v8 == CFBooleanGetTypeID()) {
    return CFBooleanGetValue(v5) != 0;
  }
LABEL_7:
  uint64_t result = sub_10004DFE0(a1, a2);
  if (result)
  {
    uint64_t v9 = result;
    uint64_t result = 0;
    switch(*(_DWORD *)(v9 + 24))
    {
      case 2:
      case 7:
        uint64_t result = *(void *)(v9 + 32);
        break;
      case 3:
      case 8:
        uint64_t result = *(int *)(v9 + 32);
        break;
      case 4:
      case 9:
        uint64_t result = *(__int16 *)(v9 + 32);
        break;
      case 5:
      case 0xA:
        uint64_t result = *(char *)(v9 + 32);
        break;
      case 0xE:
        uint64_t result = *(unsigned __int8 *)(v9 + 32);
        break;
      default:
        return result;
    }
  }
  return result;
}

uint64_t sub_10004F800(uint64_t a1, uint64_t a2)
{
  return *(void *)(sub_10004DFE0(a1, a2) + 32);
}

void sub_10004F820(uint64_t *a1, int a2)
{
  if ((a2 - 16) >= 3)
  {
    if (a2 != 1)
    {
      if (a2 != 19) {
        return;
      }
      uint64_t v4 = *a1;
      if (*(_DWORD *)(*a1 + 64) == 1 && *(int *)(v4 + 16) >= 1)
      {
        uint64_t v5 = 0;
        do
          free(*(void **)(*(void *)(v4 + 40) + 8 * v5++));
        while (v5 < *(int *)(v4 + 16));
      }
      free(*(void **)(v4 + 40));
    }
    CFTypeID v6 = (void *)*a1;
    free(v6);
  }
  else
  {
    uint64_t v3 = (const void *)*a1;
    if (*a1)
    {
      CFRelease(v3);
    }
  }
}

CFNullRef sub_10004F8F4(uint64_t a1, int a2, uint64_t a3, double a4)
{
  switch(a2)
  {
    case 1:
      CFNullRef v4 = (const __CFNull *)[objc_alloc((Class)NSString) initWithCString:*(void *)(*(void *)(a1 + 40) + 8 * a3) encoding:4];
      break;
    case 2:
    case 7:
      CFNullRef v4 = +[NSNumber numberWithLongLong:*(void *)(*(void *)(a1 + 40) + 8 * a3)];
      break;
    case 3:
    case 8:
      CFNullRef v4 = +[NSNumber numberWithInt:*(unsigned int *)(*(void *)(a1 + 40) + 4 * a3)];
      break;
    case 4:
    case 9:
      CFNullRef v4 = +[NSNumber numberWithShort:*(__int16 *)(*(void *)(a1 + 40) + 2 * a3)];
      break;
    case 5:
    case 10:
      CFNullRef v4 = +[NSNumber numberWithChar:*(char *)(*(void *)(a1 + 40) + a3)];
      break;
    case 11:
      LODWORD(a4) = *(_DWORD *)(*(void *)(a1 + 40) + 4 * a3);
      CFNullRef v4 = +[NSNumber numberWithFloat:a4];
      break;
    case 12:
      CFNullRef v4 = +[NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 40) + 8 * a3)];
      break;
    case 13:
      CFNullRef v4 = (const __CFNull *)[objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:*(double *)(*(void *)(a1 + 40) + 8 * a3)];
      break;
    case 14:
      CFNullRef v4 = +[NSNumber numberWithBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + a3)];
      break;
    default:
      CFNullRef v4 = kCFNull;
      break;
  }

  return v4;
}

id sub_10004FA9C(uint64_t *a1)
{
  id v2 = [objc_alloc((Class)NSMutableArray) initWithCapacity:*(void *)(*a1 + 32)];
  uint64_t v4 = *a1;
  unsigned int v5 = *(_DWORD *)(*a1 + 64);
  BOOL v6 = v5 > 0xE;
  int v7 = (1 << v5) & 0x7FBE;
  if (v6 || v7 == 0)
  {
    id v11 = 0;
  }
  else
  {
    if (*(_DWORD *)(v4 + 16))
    {
      unint64_t v9 = 0;
      do
      {
        id v10 = sub_10004F8F4(v4, *(_DWORD *)(v4 + 64), v9, v3);
        if (v10) {
          [v2 addObject:v10];
        }

        ++v9;
        uint64_t v4 = *a1;
      }
      while (v9 < *(int *)(*a1 + 16));
    }
    id v11 = v2;
  }

  return v11;
}

double *sub_10004FB74(double *a1, int a2, double a3)
{
  if (a1)
  {
    switch(a2)
    {
      case 1:
        a1 = (double *)[objc_alloc((Class)NSString) initWithCString:*(void *)a1 encoding:4];
        break;
      case 2:
      case 7:
        a1 = +[NSNumber numberWithLongLong:*(void *)a1];
        break;
      case 3:
      case 8:
        a1 = +[NSNumber numberWithInt:*(unsigned int *)a1];
        break;
      case 4:
      case 9:
        a1 = +[NSNumber numberWithShort:*(__int16 *)a1];
        break;
      case 5:
      case 10:
        a1 = +[NSNumber numberWithChar:*(char *)a1];
        break;
      case 6:
        CFTypeID v8 = a1;
        uint64_t v9 = 16;
        goto LABEL_19;
      case 11:
        LODWORD(a3) = *(_DWORD *)a1;
        a1 = +[NSNumber numberWithFloat:a3];
        break;
      case 12:
        a1 = +[NSNumber numberWithDouble:*a1];
        break;
      case 13:
        a1 = (double *)[objc_alloc((Class)NSDate) initWithTimeIntervalSinceReferenceDate:*a1];
        break;
      case 14:
        a1 = +[NSNumber numberWithBool:*(unsigned __int8 *)a1];
        break;
      case 15:
        uint64_t v9 = *(void *)a1;
        CFTypeID v8 = (double *)*((void *)a1 + 1);
LABEL_19:
        +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v8, v9, v4, v3, v5);
        a1 = (double *)objc_claimAutoreleasedReturnValue();
        break;
      case 16:
      case 17:
      case 18:
        a1 = (double *)*(id *)a1;
        break;
      case 19:
        sub_10004FA9C((uint64_t *)a1);
        a1 = (double *)objc_claimAutoreleasedReturnValue();
        break;
      default:
        a1 = 0;
        goto LABEL_9;
    }
  }
  else
  {
LABEL_9:
  }
  return a1;
}

uint64_t sub_10004FD54(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void *)(a1 + 16);
  unint64_t v2 = *(void *)(a1 + 24);
  if (*(_OWORD *)(a2 + 16) < __PAIR128__(v2, v3)) {
    return 1;
  }
  if (__PAIR128__(v2, v3) < *(_OWORD *)(a2 + 16)) {
    return -1;
  }
  float v4 = *(float *)(a1 + 52);
  float v5 = *(float *)(a2 + 52);
  if (v4 > v5) {
    return 1;
  }
  if (v4 < v5) {
    return -1;
  }
  int v6 = *(_DWORD *)(a1 + 48);
  int v7 = *(_DWORD *)(a2 + 48);
  if (v6 > v7) {
    return 1;
  }
  if (v6 < v7) {
    return -1;
  }
  double v9 = *(double *)(a1 + 40);
  double v10 = *(double *)(a2 + 40);
  if (v9 > v10) {
    return 1;
  }
  if (v9 >= v10) {
    return 0;
  }
  else {
    return -1;
  }
}

uint64_t sub_10004FDC4(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a2 + 40);
  if (v2 >= v3) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = -1;
  }
  if (v2 > v3) {
    return 1;
  }
  else {
    return v4;
  }
}

void sub_100051610(_Unwind_Exception *a1)
{
}

void sub_100051648(id a1)
{
  PRSRankingQueryIndexDictionary();
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = [v17 objectForKeyedSubscript:PRSRankingDisplayNameTokenizedPrefixMatch];
  unsigned __int8 v2 = [v1 integerValue];
  uint64_t v3 = 1 << v2;
  if ((v2 & 0x40) != 0) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 1 << v2;
  }
  if ((v2 & 0x40) == 0) {
    uint64_t v3 = 0;
  }
  qword_1000A9040 |= v4;
  *(void *)algn_1000A9048 |= v3;

  float v5 = [v17 objectForKeyedSubscript:PRSRankingAlternateNameExactWordMatch];
  unsigned __int8 v6 = [v5 integerValue];
  uint64_t v7 = 1 << v6;
  if ((v6 & 0x40) != 0) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 1 << v6;
  }
  if ((v6 & 0x40) == 0) {
    uint64_t v7 = 0;
  }
  qword_1000A9040 |= v8;
  *(void *)algn_1000A9048 |= v7;

  double v9 = [v17 objectForKeyedSubscript:PRSRankingAlternateNameExactPrefixMatch];
  unsigned __int8 v10 = [v9 integerValue];
  uint64_t v11 = 1 << v10;
  if ((v10 & 0x40) != 0) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 1 << v10;
  }
  if ((v10 & 0x40) == 0) {
    uint64_t v11 = 0;
  }
  qword_1000A9040 |= v12;
  *(void *)algn_1000A9048 |= v11;

  unint64_t v13 = [v17 objectForKeyedSubscript:PRSRankingAlternateNameExactMatch];
  unsigned __int8 v14 = [v13 integerValue];
  uint64_t v15 = 1 << v14;
  if ((v14 & 0x40) != 0) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = 1 << v14;
  }
  if ((v14 & 0x40) == 0) {
    uint64_t v15 = 0;
  }
  qword_1000A9040 |= v16;
  *(void *)algn_1000A9048 |= v15;
}

void sub_1000517AC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v9 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = *(id *)(a1 + 32);
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (id i = 0; i != v12; id i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (((objc_msgSend(v9, "hasPrefix:", v15, (void)v16) & 1) != 0
           || [v9 isEqualToString:v15])
          && *(void *)(a1 + 56) == ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          *a7 = 1;
          goto LABEL_13;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

void sub_10005191C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v9 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = *(id *)(a1 + 32);
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    while (2)
    {
      for (id i = 0; i != v12; id i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        if (((objc_msgSend(v9, "hasPrefix:", v15, (void)v16) & 1) != 0
           || [v9 isEqualToString:v15])
          && *(void *)(a1 + 56) == ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
        {
          *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
          *a7 = 1;
          goto LABEL_13;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

void sub_100051F90(id a1)
{
  PRSRankingQueryIndexDictionary();
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = [v17 objectForKeyedSubscript:PRSRankingDisplayNameTokenizedPrefixMatch];
  unsigned __int8 v2 = [v1 integerValue];
  uint64_t v3 = 1 << v2;
  if ((v2 & 0x40) != 0) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 1 << v2;
  }
  if ((v2 & 0x40) == 0) {
    uint64_t v3 = 0;
  }
  *(void *)&xmmword_1000A9060 = v4 | xmmword_1000A9060;
  *((void *)&xmmword_1000A9060 + 1) |= v3;

  float v5 = [v17 objectForKeyedSubscript:PRSRankingAlternateNameExactWordMatch];
  unsigned __int8 v6 = [v5 integerValue];
  uint64_t v7 = 1 << v6;
  if ((v6 & 0x40) != 0) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 1 << v6;
  }
  if ((v6 & 0x40) == 0) {
    uint64_t v7 = 0;
  }
  *(void *)&xmmword_1000A9060 = v8 | xmmword_1000A9060;
  *((void *)&xmmword_1000A9060 + 1) |= v7;

  id v9 = [v17 objectForKeyedSubscript:PRSRankingAlternateNameExactPrefixMatch];
  unsigned __int8 v10 = [v9 integerValue];
  uint64_t v11 = 1 << v10;
  if ((v10 & 0x40) != 0) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 1 << v10;
  }
  if ((v10 & 0x40) == 0) {
    uint64_t v11 = 0;
  }
  *(void *)&xmmword_1000A9060 = v12 | xmmword_1000A9060;
  *((void *)&xmmword_1000A9060 + 1) |= v11;

  uint64_t v13 = [v17 objectForKeyedSubscript:PRSRankingAlternateNameExactMatch];
  unsigned __int8 v14 = [v13 integerValue];
  uint64_t v15 = 1 << v14;
  if ((v14 & 0x40) != 0) {
    uint64_t v16 = 0;
  }
  else {
    uint64_t v16 = 1 << v14;
  }
  if ((v14 & 0x40) == 0) {
    uint64_t v15 = 0;
  }
  *(void *)&xmmword_1000A9060 = v16 | xmmword_1000A9060;
  *((void *)&xmmword_1000A9060 + 1) |= v15;
}

void sub_10005379C(id a1)
{
  PRSRankingQueryIndexDictionary();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v1 = [v5 objectForKeyedSubscript:PRSRankingDisplayNameTokenizedPrefixMatch];
  unsigned __int8 v2 = [v1 integerValue];
  uint64_t v3 = 1 << v2;
  if ((v2 & 0x40) != 0) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = 1 << v2;
  }
  if ((v2 & 0x40) == 0) {
    uint64_t v3 = 0;
  }
  *(void *)&xmmword_1000A9080 = v4 | xmmword_1000A9080;
  *((void *)&xmmword_1000A9080 + 1) |= v3;
}

void sub_100054310(id a1)
{
  qword_1000A9098 = (uint64_t)objc_alloc_init((Class)NSMutableDictionary);

  _objc_release_x1();
}

void sub_100054B1C(id a1)
{
  uint64_t v1 = +[NSMutableCharacterSet whitespaceAndNewlineCharacterSet];
  unsigned __int8 v2 = (void *)qword_1000A90A8;
  qword_1000A90A8 = v1;

  uint64_t v3 = (void *)qword_1000A90A8;

  objc_msgSend(v3, "addCharactersInRange:", 65532, 0xFFFFLL);
}

void sub_10005833C(id a1)
{
  byte_1000A90B8 = _os_feature_enabled_impl();
  byte_1000A90B9 = _os_feature_enabled_impl();
}

void sub_100058718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  sub_1000067B0((uint64_t)&a27);
  _Unwind_Resume(a1);
}

void sub_100058764(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[SDController workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  long long v5 = *(_OWORD *)(a1 + 64);
  long long v16 = *(_OWORD *)(a1 + 48);
  _DWORD v12[2] = sub_1000588C8;
  v12[3] = &unk_100093AA8;
  long long v17 = v5;
  uint64_t v18 = *(void *)(a1 + 80);
  objc_copyWeak(&v15, (id *)(a1 + 40));
  id v13 = *(id *)(a1 + 32);
  id v6 = v3;
  id v14 = v6;
  uint64_t v7 = v12;
  uint64_t v8 = v4;
  qos_class_t v9 = qos_class_self();
  if (v9 < 0x1A) {
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, v7);
  }
  else {
    dispatch_block_t v10 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v9, 0, v7);
  }
  uint64_t v11 = v10;

  dispatch_async(v8, v11);
  objc_destroyWeak(&v15);
}

void sub_1000588B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

double sub_1000588C8(uint64_t a1)
{
  uint64_t v2 = si_tracing_current_span();
  long long v3 = *(_OWORD *)(v2 + 16);
  long long v20 = *(_OWORD *)v2;
  long long v21 = v3;
  uint64_t v22 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)(a1 + 88);
  long long v5 = *(_OWORD *)(a1 + 72);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v2 + 16) = v5;
  *(void *)(v2 + 32) = v4;
  long long v6 = *(_OWORD *)(a1 + 72);
  long long v17 = *(_OWORD *)(a1 + 56);
  long long v18 = v6;
  uint64_t v19 = *(void *)(a1 + 88);
  uint64_t v7 = *(void *)v2;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v9 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v7;
  *(void *)(v2 + _Block_object_dispose(&STACK[0x2E0], 8) = spanid;
  *(void *)(v2 + 16) = v9;
  *(unsigned char *)(v2 + 2_Block_object_dispose(&STACK[0x2E0], 8) = 102;
  *(void *)(v2 + 32) = "SPDataDetectorsDataStore completion";
  si_tracing_log_span_begin();
  dispatch_block_t v10 = SPLogForSPLogCategoryTelemetry();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned int v12 = [WeakRetained externalID];

  if (v12 && os_signpost_enabled(v10))
  {
    *(_WORD *)long long v16 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v12, "dataDetectorsLatency", " enableTelemetry=YES ", v16, 2u);
  }

  id v13 = objc_loadWeakRetained((id *)(a1 + 48));
  [v13 storeCompletedSearch:*(void *)(a1 + 32) withSections:*(void *)(a1 + 40)];

  si_tracing_log_span_end();
  double result = *(double *)&v20;
  long long v15 = v21;
  *(_OWORD *)uint64_t v2 = v20;
  *(_OWORD *)(v2 + 16) = v15;
  *(void *)(v2 + 32) = v22;
  return result;
}

void sub_100058A38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_100059250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  _Block_object_dispose((const void *)(v29 - 160), 8);
  sub_1000067B0(v29 - 128);
  _Unwind_Resume(a1);
}

void sub_1000592C4(id a1)
{
  uint64_t v1 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v2 = [v1 localizedStringForKey:@"DICTIONARY_DEFINITION_TRIGGER_1" value:&stru_100094088 table:@"Search"];
  long long v3 = (void *)qword_1000A90D0;
  qword_1000A90D0 = v2;

  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v4 = [v6 localizedStringForKey:@"DICTIONARY_DEFINITION_TRIGGER_2" value:&stru_100094088 table:@"Search"];
  long long v5 = (void *)qword_1000A90D8;
  qword_1000A90D8 = v4;
}

void sub_1000593B8(id a1)
{
  qword_1000A90E0 = (uint64_t)dispatch_queue_create("dictionary queue", 0);

  _objc_release_x1();
}

double sub_1000593F8(uint64_t a1)
{
  uint64_t v2 = si_tracing_current_span();
  long long v3 = *(_OWORD *)(v2 + 16);
  long long v60 = *(_OWORD *)v2;
  long long v61 = v3;
  uint64_t v62 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)v2;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v6 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v4;
  *(void *)(v2 + _Block_object_dispose(&STACK[0x2E0], 8) = spanid;
  *(void *)(v2 + 16) = v6;
  *(unsigned char *)(v2 + 2_Block_object_dispose(&STACK[0x2E0], 8) = 102;
  *(void *)(v2 + 32) = "SPDictionaryDataStore lookup";
  si_tracing_log_span_begin();
  uint64_t v46 = v2;
  uint64_t v7 = SPLogForSPLogCategoryDefault();
  uint64_t v52 = a1;
  os_log_type_t v8 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (id)objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v64 = v9;
    __int16 v65 = 1024;
    LODWORD(v66) = qos_class_self();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "QOS %@ begin: %d", buf, 0x12u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(v52 + 64));
  dispatch_block_t v10 = [*(id *)(v52 + 32) store];
  uint64_t v11 = [v10 dictionaries];
  unsigned int v12 = (objc_class *)objc_opt_class();
  NSStringFromClass(v12);
  unsigned int v47 = (void *)DCSSearchFoundationCopyResultsWithOptions();

  uint64_t v53 = objc_opt_new();
  float v49 = objc_opt_new();
  uint64_t v13 = v52;
  if ([v47 count])
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v47;
    id v14 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v57;
      uint64_t v48 = PRSRankingDictionaryBundleString;
      do
      {
        for (id i = 0; i != v14; id i = (char *)i + 1)
        {
          if (*(void *)v57 != v15) {
            objc_enumerationMutation(obj);
          }
          long long v17 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          long long v18 = objc_msgSend(v17, "footnote", v46);
          if (([v53 containsObject:v18] & 1) == 0)
          {
            [v53 addObject:v18];
            [v49 addObject:v17];
            uint64_t v19 = [WeakRetained queryContext];
            long long v20 = [v19 searchString];
            [v17 setUserInput:v20];

            objc_msgSend(v17, "setQueryId:", objc_msgSend(WeakRetained, "queryIdent"));
            if (*(unsigned char *)(v52 + 80)) {
              [v17 setTopHit:SSSetTopHitWithReasonString()];
            }
            [v17 setType:8];
            [v17 setResultBundleId:v48];
            long long v21 = [v17 title];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              unint64_t v23 = [v17 title];
              BOOL v24 = [v23 formattedTextPieces];
              if (v24)
              {
                double v25 = [v23 formattedTextPieces];
                unint64_t v26 = [v25 firstObject];
                unint64_t v27 = [v26 text];
              }
              else
              {
                unint64_t v27 = [v23 text];
              }
            }
            else
            {
              unint64_t v23 = [v17 title];
              unint64_t v27 = [v23 text];
            }

            [v17 setCompletion:v27];
            unint64_t v28 = objc_opt_new();
            [v28 setSymbolName:@"book.closed.fill"];
            [v28 setIsTemplate:1];
            uint64_t v29 = [v17 card];
            [v29 setTitleImage:v28];

            uint64_t v30 = *(void *)(v52 + 40);
            id v31 = [v17 card];
            [v31 setTitle:v30];
          }
        }
        id v14 = [obj countByEnumeratingWithState:&v56 objects:v67 count:16];
      }
      while (v14);
    }

    unint64_t v32 = objc_opt_new();
    [v32 setMaxInitiallyVisibleResults:1];
    [v32 setBundleIdentifier:PRSRankingDictionaryBundleString];
    id v33 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned int v34 = [v33 localizedStringForKey:@"DOMAIN_DICTIONARY" value:&stru_100094088 table:@"Search"];
    [v32 setTitle:v34];

    [v32 setResults:v49];
    uint64_t v13 = v52;
  }
  else
  {
    unint64_t v32 = 0;
  }
  if (*(unsigned char *)(*(void *)(v13 + 32) + 24)) {
    uint64_t v35 = "canceled";
  }
  else {
    uint64_t v35 = "finished";
  }
  unint64_t v36 = sub_1000190D4(WeakRetained, v35, "dictionary", *(void *)(v13 + 72));
  if (!*(unsigned char *)(*(void *)(v13 + 32) + 24))
  {
    id v37 = +[SDController workQueue];
    id v54 = WeakRetained;
    id v55 = v32;
    md_tracing_dispatch_async_propagating();
  }
  uint64_t v38 = SPLogForSPLogCategoryQuery();
  os_log_type_t v39 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v38, v39))
  {
    unsigned int v40 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    id v64 = v40;
    __int16 v65 = 2048;
    double v66 = (double)v36 / 1000000000.0;
    id v41 = v40;
    _os_log_impl((void *)&_mh_execute_header, v38, v39, "- Datastore %@ time %g", buf, 0x16u);
  }
  [*(id *)(v52 + 32) finishWithClientID:*(void *)(v52 + 48)];
  [WeakRetained externalID];
  kdebug_trace();
  float v42 = SPLogForSPLogCategoryTelemetry();
  unsigned int v43 = [WeakRetained externalID];
  if (v43 && os_signpost_enabled(v42))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v42, OS_SIGNPOST_INTERVAL_END, v43, "dictionaryLatency", " enableTelemetry=YES ", buf, 2u);
  }

  si_tracing_log_span_end();
  double result = *(double *)&v60;
  long long v45 = v61;
  *(_OWORD *)uint64_t v46 = v60;
  *(_OWORD *)(v46 + 16) = v45;
  *(void *)(v46 + 32) = v62;
  return result;
}

void sub_100059B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_100059C08(void *a1)
{
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = a1[5];
  if (a1[6])
  {
    uint64_t v5 = a1[6];
    long long v3 = +[NSArray arrayWithObjects:&v5 count:1];
    [v1 storeCompletedSearch:v2 withSections:v3];
  }
  else
  {
    uint64_t v4 = (void *)a1[4];
    [v4 storeCompletedSearch:v2 withSections:&__NSArray0__struct];
  }
}

__n128 sub_100059CFC(uint64_t a1)
{
  uint64_t v2 = si_tracing_current_span();
  __n128 v7 = *(__n128 *)v2;
  long long v8 = *(_OWORD *)(v2 + 16);
  uint64_t v9 = *(void *)(v2 + 32);
  uint64_t v3 = *(void *)v2;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v5 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v3;
  *(void *)(v2 + _Block_object_dispose(&STACK[0x2E0], 8) = spanid;
  *(void *)(v2 + 16) = v5;
  *(unsigned char *)(v2 + 2_Block_object_dispose(&STACK[0x2E0], 8) = 102;
  *(void *)(v2 + 32) = "SPDictionaryDataStore completion";
  si_tracing_log_span_begin();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  [*(id *)(a1 + 32) storeCompletedSearch:*(void *)(a1 + 40) withSections:&__NSArray0__struct];
  si_tracing_log_span_end();
  __n128 result = v7;
  *(__n128 *)uint64_t v2 = v7;
  *(_OWORD *)(v2 + 16) = v8;
  *(void *)(v2 + 32) = v9;
  return result;
}

void sub_100059DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100059FEC(uint64_t a1)
{
  id active = (id)DCSCopyActiveDictionaries();
  [*(id *)(a1 + 32) setDictionaries:active];
}

id sub_10005A0B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setDictionaries:0];
}

void sub_10005A240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10005A2C0()
{
  if (qword_1000A90F8 != -1) {
    dispatch_once(&qword_1000A90F8, &stru_100093BA8);
  }
}

void sub_10005A2E8(id a1)
{
  qword_1000A9100 = 0;
  *(void *)algn_1000A9108 = "didErrorOccur:";
  qword_1000A9110 = (uint64_t)"searchViewDidAppear:";
  unk_1000A9118 = "searchViewDidDisappear:";
  qword_1000A9120 = (uint64_t)"cardViewDidDisappear:";
  unk_1000A9128 = "didStartSearch:";
  qword_1000A9130 = (uint64_t)"didEndSearch:";
  unk_1000A9138 = "didRankSections:";
  qword_1000A9140 = (uint64_t)"didEngageResult:";
  unk_1000A9148 = "didEngageSuggestion:";
  qword_1000A9150 = (uint64_t)"didEngageCardSection:";
  unk_1000A9158 = "sendCustomFeedback:";
  qword_1000A9160 = (uint64_t)"resultsDidBecomeVisible:";
  unk_1000A9168 = "suggestionsDidBecomeVisible:";
  qword_1000A9170 = (uint64_t)"didReceiveResultsAfterTimeout:";
  unk_1000A9178 = "didAppendLateSections:";
  qword_1000A9180 = (uint64_t)"didClearInput:";
  unk_1000A9188 = "didEngageSection:";
  qword_1000A9190 = (uint64_t)"sectionHeaderDidBecomeVisible:";
  unk_1000A9198 = "didGradeResultRelevancy:";
  qword_1000A91A0 = (uint64_t)"cardViewDidAppear:";
  unk_1000A91A8 = "reportFeedback:queryId:";
  qword_1000A91B0 = (uint64_t)"didGoToSite:";
  unk_1000A91B8 = "didGoToSearch:";
  qword_1000A91C0 = (uint64_t)"didGradeLookupHintRelevancy:";
  unk_1000A91C8 = "didReportUserResponseFeedback:";
  qword_1000A91D0 = (uint64_t)"didPerformCommand:";
  unk_1000A91D8 = 0;
  qword_1000A91E0 = 0;
  qword_1000A91E8 = objc_opt_class();
  qword_1000A91F0 = objc_opt_class();
  qword_1000A91F8 = objc_opt_class();
  qword_1000A9200 = objc_opt_class();
  qword_1000A9208 = objc_opt_class();
  qword_1000A9210 = objc_opt_class();
  qword_1000A9218 = objc_opt_class();
  qword_1000A9220 = objc_opt_class();
  qword_1000A9228 = objc_opt_class();
  qword_1000A9230 = objc_opt_class();
  qword_1000A9238 = objc_opt_class();
  qword_1000A9240 = objc_opt_class();
  qword_1000A9248 = objc_opt_class();
  qword_1000A9250 = objc_opt_class();
  qword_1000A9258 = objc_opt_class();
  qword_1000A9260 = objc_opt_class();
  qword_1000A9268 = objc_opt_class();
  qword_1000A9270 = objc_opt_class();
  qword_1000A9280 = objc_opt_class();
  qword_1000A9278 = objc_opt_class();
  qword_1000A9288 = objc_opt_class();
  qword_1000A9290 = objc_opt_class();
  qword_1000A9298 = objc_opt_class();
  qword_1000A92A0 = objc_opt_class();
  qword_1000A92A8 = objc_opt_class();
  qword_1000A92B0 = objc_opt_class();
  unk_1000A92B8 = 0;
  qword_1000A92C0 = (uint64_t)"None";
  *(void *)algn_1000A92C8 = "Error";
  qword_1000A92D0 = (uint64_t)"ViewAppear";
  unk_1000A92D8 = "ViewDisappear";
  qword_1000A92E0 = (uint64_t)"CardViewDisappear";
  unk_1000A92E8 = "StartSearch";
  qword_1000A92F0 = (uint64_t)"EndSearch";
  unk_1000A92F8 = "RankSections";
  qword_1000A9300 = (uint64_t)"EngageResult";
  unk_1000A9308 = "EngageSuggestion";
  qword_1000A9310 = (uint64_t)"DidEngageCardSection";
  unk_1000A9318 = "SendCustomFeedback";
  qword_1000A9320 = (uint64_t)"ResultVisible";
  unk_1000A9328 = "SuggestionsVisible";
  qword_1000A9330 = (uint64_t)"ReceiveResultsAfterTimeout";
  unk_1000A9338 = "AppendLateSections";
  qword_1000A9340 = (uint64_t)"ClearInput";
  unk_1000A9348 = "EngageSection";
  qword_1000A9350 = (uint64_t)"SectionHeaderVisible";
  unk_1000A9358 = "GradeResult";
  qword_1000A9360 = (uint64_t)"CardViewAppear";
  unk_1000A9368 = "ReportFeedback";
  qword_1000A9370 = (uint64_t)"GoToSite";
  unk_1000A9378 = "GoToSearch";
  qword_1000A9380 = (uint64_t)"GradeLookup";
  unk_1000A9388 = "ReportUserResponse";
  qword_1000A9390 = (uint64_t)"Command";
  unk_1000A9398 = "Invalid";
}

void sub_10005AD20(id a1)
{
  qword_1000A93A8 = (uint64_t)objc_alloc_init((Class)SGSMFeedbackListener);

  _objc_release_x1();
}

id sub_10005AE40(uint64_t a1)
{
  return [*(id *)(a1 + 32) _gatherFeedbackListeners];
}

id sub_10005AEE8(uint64_t a1)
{
  id result = [(id)qword_1000A90F0 count];
  if (!result)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    return [v3 _gatherFeedbackListeners];
  }
  return result;
}

void sub_10005B184(uint64_t a1)
{
  uint64_t v2 = *(id *)(a1 + 32);
  if (v2)
  {
LABEL_2:
    BOOL v3 = *(void *)(a1 + 40) == 0;
    uint64_t v4 = SPLogForSPLogCategoryFeedback();
    os_log_type_t v5 = 2 * (gSPLogDebugAsDefault == 0);
    BOOL v6 = os_log_type_enabled(v4, v5);
    if (v3)
    {
      if (v6)
      {
        uint64_t v22 = qword_1000A92C0[*(void *)(a1 + 72)];
        *(_DWORD *)buf = 136315394;
        uint64_t v46 = v22;
        __int16 v47 = 2112;
        size_t v48 = (size_t)v2;
        dispatch_block_t v10 = "sending feedback (%s) %@";
        uint64_t v11 = v4;
        os_log_type_t v12 = v5;
        uint32_t v13 = 22;
        goto LABEL_15;
      }
    }
    else if (v6)
    {
      uint64_t v7 = qword_1000A92C0[*(void *)(a1 + 72)];
      size_t length = xpc_data_get_length(*(xpc_object_t *)(a1 + 40));
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 136315906;
      uint64_t v46 = v7;
      __int16 v47 = 2048;
      size_t v48 = length;
      __int16 v49 = 2048;
      uint64_t v50 = v9;
      __int16 v51 = 2112;
      uint64_t v52 = v2;
      dispatch_block_t v10 = "sending feedback (%s) size %ld %p %@";
      uint64_t v11 = v4;
      os_log_type_t v12 = v5;
      uint32_t v13 = 42;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v11, v12, v10, buf, v13);
    }

    if (*(void *)(a1 + 72) == 7
      && (+[SDFeedbackInterceptor sharedInstance],
          (unint64_t v23 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10005B9A8;
      v41[3] = &unk_100093BF0;
      uint64_t v24 = *(void *)(a1 + 48);
      uint64_t v25 = *(void *)(a1 + 72);
      float v42 = v2;
      uint64_t v43 = v25;
      v41[4] = v24;
      uint64_t v2 = v2;
      [v23 annotateRankingFeedback:v2 completion:v41];
    }
    else
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      unint64_t v26 = +[SPFeedbackSender feedbackListeners];
      id v27 = [v26 countByEnumeratingWithState:&v37 objects:v44 count:16];
      if (v27)
      {
        uint64_t v28 = *(void *)v38;
        do
        {
          for (id i = 0; i != v27; id i = (char *)i + 1)
          {
            if (*(void *)v38 != v28) {
              objc_enumerationMutation(v26);
            }
            uint64_t v30 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            id v31 = [v30 feedbackListener];
            if ([*(id *)(a1 + 48) clientID:*(void *)(a1 + 56) supportsFeedbackListener:v31])
            {
              unsigned int v32 = [v30 supportsFeedbackType:21];
              if (*(void *)(a1 + 72) == 11) {
                unsigned int v33 = 0;
              }
              else {
                unsigned int v33 = v32;
              }
              if (v33 == 1)
              {
LABEL_29:
                [v31 reportFeedback:v2 queryId:*(void *)(a1 + 80)];
              }
              else if (objc_msgSend(v30, "supportsFeedbackType:"))
              {
                switch(*(void *)(a1 + 72))
                {
                  case 1:
                    [v31 didErrorOccur:v2];
                    break;
                  case 2:
                    [v31 searchViewDidAppear:v2];
                    break;
                  case 3:
                    [v31 searchViewDidDisappear:v2];
                    break;
                  case 4:
                    [v31 cardViewDidDisappear:v2];
                    break;
                  case 5:
                    [v31 didStartSearch:v2];
                    break;
                  case 6:
                    [v31 didEndSearch:v2];
                    break;
                  case 7:
                    [v31 didRankSections:v2];
                    break;
                  case 8:
                    [v31 didEngageResult:v2];
                    break;
                  case 9:
                    [v31 didEngageSuggestion:v2];
                    break;
                  case 0xALL:
                    [v31 didEngageCardSection:v2];
                    break;
                  case 0xBLL:
                    [v31 sendCustomFeedback:v2];
                    break;
                  case 0xCLL:
                    [v31 resultsDidBecomeVisible:v2];
                    break;
                  case 0xDLL:
                    [v31 suggestionsDidBecomeVisible:v2];
                    break;
                  case 0xELL:
                    [v31 didReceiveResultsAfterTimeout:v2];
                    break;
                  case 0xFLL:
                    [v31 didAppendLateSections:v2];
                    break;
                  case 0x10:
                    [v31 didClearInput:v2];
                    break;
                  case 0x11:
                    [v31 didEngageSection:v2];
                    break;
                  case 0x12:
                    [v31 sectionHeaderDidBecomeVisible:v2];
                    break;
                  case 0x13:
                    [v31 didGradeResultRelevancy:v2];
                    break;
                  case 0x14:
                    [v31 cardViewDidAppear:v2];
                    break;
                  case 0x15:
                    goto LABEL_29;
                  case 0x16:
                    [v31 didGoToSite:v2];
                    break;
                  case 0x17:
                    [v31 didGoToSearch:v2];
                    break;
                  case 0x18:
                    [v31 didGradeLookupHintRelevancy:v2];
                    break;
                  case 0x19:
                    [v31 didReportUserResponseFeedback:v2];
                    break;
                  case 0x1ALL:
                    [v31 didPerformCommand:v2];
                    break;
                  default:
                    unsigned int v34 = SPLogForSPLogCategoryFeedback();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                    {
                      uint64_t v35 = *(void *)(a1 + 72);
                      *(_DWORD *)buf = 67109120;
                      LODWORD(v46) = v35;
                      _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "*** Error feedback type %d not handled", buf, 8u);
                    }

                    break;
                }
              }
            }
          }
          id v27 = [v26 countByEnumeratingWithState:&v37 objects:v44 count:16];
        }
        while (v27);
      }

      id v36 = self;
    }
    goto LABEL_63;
  }
  id v14 = *(void **)(a1 + 40);
  if (!v14)
  {
    uint64_t v2 = 0;
    goto LABEL_2;
  }
  bytes_ptr = xpc_data_get_bytes_ptr(v14);
  if (!bytes_ptr) {
    goto LABEL_64;
  }
  id v16 = [objc_alloc((Class)NSData) initWithBytesNoCopy:bytes_ptr length:xpc_data_get_length(*(xpc_object_t *)(a1 + 40)) freeWhenDone:0];
  if (!v16) {
    goto LABEL_64;
  }
  long long v17 = v16;
  long long v18 = +[NSSet setWithObject:objc_opt_class()];
  id v19 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v17 error:0];
  uint64_t v2 = [v19 decodeObjectOfClasses:v18 forKey:NSKeyedArchiveRootObjectKey];

  if (v2)
  {
    uint64_t v20 = a1 + 72;
    if (objc_opt_isKindOfClass()) {
      goto LABEL_2;
    }
    long long v21 = SPLogForSPLogCategoryFeedback();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100065D34(v20, v2, v21);
    }
  }
  else
  {
LABEL_64:
    uint64_t v2 = SPLogForSPLogCategoryFeedback();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100065CA0(a1, (uint64_t *)(a1 + 40), v2);
    }
  }
LABEL_63:
}

void sub_10005B8D0()
{
}

void sub_10005B9A8(void *a1)
{
  uint64_t v1 = *(NSObject **)(a1[4] + 8);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  _DWORD v3[2] = sub_10005BA3C;
  v3[3] = &unk_100092298;
  uint64_t v2 = (void *)a1[5];
  uint64_t v5 = a1[6];
  id v4 = v2;
  dispatch_async(v1, v3);
}

void sub_10005BA3C(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v2 = +[SPFeedbackSender feedbackListeners];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (id i = 0; i != v4; id i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v7 supportsFeedbackType:*(void *)(a1 + 40)])
        {
          long long v8 = [v7 feedbackListener];
          [v8 didRankSections:*(void *)(a1 + 32)];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void sub_10005BFBC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_10005BFD4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_10005D48C()
{
  if (v0) {
    objc_end_catch();
  }
  JUMPOUT(0x10005D388);
}

void sub_10005D4A4(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x10005D4B0);
}

void sub_10005D4B8(uint64_t a1)
{
  [*(id *)(a1 + 32) storeCompletedSearch:*(void *)(a1 + 40) withSections:*(void *)(*(void *)(a1 + 40) + 208)];
  uint64_t v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "#query parsec sending results", buf, 2u);
  }

  [*(id *)(a1 + 32) externalID];
  kdebug_trace();
  uint64_t v4 = SPLogForSPLogCategoryTelemetry();
  unsigned int v5 = [*(id *)(a1 + 32) externalID];
  if (v5)
  {
    unsigned int v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, v6, "parsecLatency", " enableTelemetry=YES ", v7, 2u);
    }
  }
}

void sub_10005D76C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10005D78C(uint64_t a1)
{
  sub_1000190D4(*(void **)(a1 + 32), "cancel", "parsec", *(void *)(*(void *)(a1 + 40) + 232));
  uint64_t v2 = *(void **)(*(void *)(a1 + 40) + 200);
  if (v2)
  {
    [v2 invalidateHandler];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void **)(v3 + 208);
    *(void *)(v3 + 20_Block_object_dispose(&STACK[0x2E0], 8) = 0;

    uint64_t v5 = *(void *)(a1 + 40);
    unsigned int v6 = *(void **)(v5 + 200);
    *(void *)(v5 + 200) = 0;
  }
  uint64_t v7 = +[SDController workQueue];
  qos_class_t v8 = qos_class_self();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  _DWORD v12[2] = sub_10005D8CC;
  v12[3] = &unk_100091E90;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v13 = v9;
  uint64_t v14 = v10;
  dispatch_block_t v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, v12);
  tracing_dispatch_async();

  if (!*(unsigned char *)(*(void *)(a1 + 40) + 122)) {
    atomic_fetch_add(dword_1000A93C8, 0xFFFFFFFF);
  }
}

void sub_10005D8CC(uint64_t a1)
{
  if (([*(id *)(a1 + 32) cancelled] & 1) == 0) {
    [*(id *)(a1 + 32) storeCompletedSearch:*(void *)(a1 + 40) withSections:0];
  }
  uint64_t v2 = SPLogForSPLogCategoryDefault();
  os_log_type_t v3 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v2, v3))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "#query parsec sending cancel", v4, 2u);
  }
}

void sub_10005DA98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10005DAB0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 121))
  {
    os_log_type_t v3 = *(void **)(a1 + 40);
    if (v3 == *(void **)(v1 + 200))
    {
      uint64_t v4 = objc_msgSend(v3, "category_stats");
      uint64_t v5 = *(void *)(a1 + 32);
      unsigned int v6 = *(void **)(v5 + 136);
      *(void *)(v5 + 136) = v4;

      uint64_t v7 = objc_msgSend(*(id *)(a1 + 40), "server_features");
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(void **)(v8 + 144);
      *(void *)(v8 + 144) = v7;

      *(unsigned char *)(*(void *)(a1 + 32) + 123) = 1;
      uint64_t v10 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_100065FE4(v10);
      }

      uint64_t v1 = *(void *)(a1 + 32);
    }
    if (*(unsigned char *)(v1 + 123))
    {
      dispatch_block_t v11 = +[SDController workQueue];
      tracing_dispatch_async();
    }
  }
}

void sub_10005DBD4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) resultPipe];
  [v2 storeWillComplete:*(void *)(a1 + 32)];
}

void sub_10005DE5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_10005ECE0(_Unwind_Exception *a1)
{
}

id sub_10005EDA8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v4 count])
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithFormat:", @"FieldMatch(%@, "), v3;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      char v10 = 1;
      do
      {
        for (id i = 0; i != v8; id i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          if (v10) {
            CFStringRef v12 = @"\"%@\"";
          }
          else {
            CFStringRef v12 = @", \"%@\"";
          }
          objc_msgSend(v5, "appendFormat:", v12, *(void *)(*((void *)&v14 + 1) + 8 * i));
          char v10 = 0;
        }
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        char v10 = 0;
      }
      while (v8);
    }

    [v5 appendString:@""]);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_10005EF3C(id a1)
{
  v3[0] = NSFileProtectionComplete;
  v3[1] = NSFileProtectionCompleteUnlessOpen;
  _DWORD v3[2] = NSFileProtectionCompleteWhenUserInactive;
  v3[3] = NSFileProtectionCompleteUntilFirstUserAuthentication;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:4];
  id v2 = (void *)qword_1000A93D0;
  qword_1000A93D0 = v1;
}

void *sub_10005EFE4(uint64_t a1, int a2, unint64_t a3, size_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v13 = HIDWORD(a3);
  switch(a2)
  {
    case 0:
      long long v14 = malloc_type_malloc(0x28uLL, 0x1020040C9F8C70BuLL);
      *long long v14 = atomic_fetch_add(&qword_1000A93E8, 1uLL);
      v14[1] = a6;
      *((_DWORD *)v14 + 4) = _SIProtectionClass();
      *((unsigned char *)v14 + 20) = _SIPriority();
      v14[3] = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
      void v14[4] = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
      goto LABEL_88;
    case 1:
      CFRelease(*(CFTypeRef *)(a3 + 24));
      CFTypeRef v21 = *(CFTypeRef *)(a3 + 32);
      goto LABEL_15;
    case 2:
      long long v14 = malloc_type_malloc(0x58uLL, 0x10E00406EEDA840uLL);
      *long long v14 = a6;
      v14[1] = a3;
      *((_WORD *)v14 + 32) = 8;
      *((_OWORD *)v14 + 1) = 0u;
      *((_OWORD *)v14 + 2) = 0u;
      *((_OWORD *)v14 + 3) = 0u;
      v14[9] = malloc_type_calloc(8uLL, 8uLL, 0x2004093837F09uLL);
      v14[10] = 0;
      goto LABEL_88;
    case 3:
      long long v22 = *(_OWORD *)(a3 + 32);
      long long v23 = *(_OWORD *)(a3 + 48);
      long long v24 = *(_OWORD *)(a3 + 64);
      CFTypeRef cf = *(CFTypeRef *)(a3 + 80);
      v66[2] = v23;
      *(_OWORD *)id v67 = v24;
      v66[1] = v22;
      v66[0] = *(_OWORD *)(a3 + 16);
      *(void *)(a3 + 80) = 0;
      *(_OWORD *)(a3 + 4_Block_object_dispose(&STACK[0x2E0], 8) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      if ((v66[0] & 0x400) == 0) {
        goto LABEL_9;
      }
      uint8x8_t v25 = (uint8x8_t)vcnt_s8((int8x8_t)(v66[0] & 0x3FF));
      v25.i16[0] = vaddlv_u8(v25);
      uint64_t v26 = *((void *)v67[1] + v25.u32[0]);
      if (!v26 || *(_DWORD *)(v26 + 20)) {
        goto LABEL_9;
      }
      int v57 = *(_DWORD *)(v26 + 24);
      if (v57 == 16)
      {
        id v58 = [*(id *)(v26 + 32) cStringUsingEncoding:4];
      }
      else
      {
        if (v57 != 1) {
          goto LABEL_9;
        }
        id v58 = *(id *)(v26 + 32);
      }
      if (v58)
      {
        if ((*(void *)&v66[0] & 0x1000000000) == 0
          || (uint8x8_t v59 = (uint8x8_t)vcnt_s8((int8x8_t)(*(void *)&v66[0] & 0xFFFFFFFFFLL)),
              v59.i16[0] = vaddlv_u8(v59),
              (uint64_t v60 = *((void *)v67[1] + v59.u32[0])) == 0)
          || *(double *)(v60 + 32) >= *(double *)(a1 + 40))
        {
          long long v61 = sub_10004DEA0(*(void *)(a3 + 8), v66);
          os_unfair_lock_lock((os_unfair_lock_t)&unk_1000A93E0);
          uint64_t v62 = NSMapGet(*(NSMapTable **)(a1 + 32), v58);
          if (!v62)
          {
            uint64_t v62 = CFBinaryHeapCreate(kCFAllocatorDefault, 0, (const CFBinaryHeapCallBacks *)&unk_1000A8A70, 0);
            NSMapInsert(*(NSMapTable **)(a1 + 32), v58, v62);
            CFRelease(v62);
          }
          if (!qword_1000A93D0) {
            sub_1000660AC();
          }
          int v63 = *(_DWORD *)(a6 + 16);
          if (v63 >= (int)[(id)qword_1000A93D0 count]) {
            sub_1000660D8();
          }
          if (*(unsigned char *)(a6 + 20))
          {
            sub_10004E4B4((uint64_t)v61, (uint64_t)v66, @"Priority");
          }
          else
          {
            id v64 = [(id)qword_1000A93D0 objectAtIndexedSubscript:*(int *)(a6 + 16)];
            sub_10004E4B4((uint64_t)v61, (uint64_t)v66, v64);
          }
          CFBinaryHeapAddValue((CFBinaryHeapRef)v62, v61);
          sub_10004E6C0(0, (atomic_uint *)v61);
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_1000A93E0);
        }
      }
LABEL_9:
      id v27 = v67[1];
      if (v67[1])
      {
        uint64_t v28 = BYTE1(v67[0]);
        if (BYTE1(v67[0]))
        {
          uint64_t v29 = (uint64_t *)v67[1];
          do
          {
            uint64_t v30 = *v29++;
            sub_10004E564(v30);
            --v28;
          }
          while (v28);
        }
        free(v27);
      }
      CFTypeRef v21 = cf;
      if (cf) {
LABEL_15:
      }
        CFRelease(v21);
      goto LABEL_86;
    case 4:
      long long v14 = malloc_type_calloc(1uLL, 0x40uLL, 0x10F20407A6C0F06uLL);
      v14[1] = *(void *)a6;
      *(_DWORD *)long long v14 = 1;
      goto LABEL_88;
    case 5:
      if (*(_DWORD *)(a3 + 24)) {
        sub_1000403A8((void **)(a6 + 16), a5, a3);
      }
      else {
        sub_10004E564(a3);
      }
      goto LABEL_87;
    case 6:
      id v31 = malloc_type_calloc(1uLL, 0x50uLL, 0x10F20409211DA8EuLL);
      long long v14 = v31;
      *((void *)v31 + 1) = *(void *)(a6 + 8);
      int v32 = 3;
      goto LABEL_28;
    case 7:
      if (*(_DWORD *)a6 == 2)
      {
        long long v14 = 0;
        *(void *)(a6 + 80) = a3;
        *(_DWORD *)(a6 + 112) = 19;
      }
      else
      {
        if (*(_DWORD *)a6 != 1) {
          sub_100066104();
        }
        *(_DWORD *)(a6 + 20) = 3;
        *(_DWORD *)(a6 + 24) = *(_DWORD *)(a3 + 64);
        long long v33 = *(_OWORD *)(a3 + 48);
        *(_OWORD *)(a6 + 32) = *(_OWORD *)(a3 + 32);
        *(_OWORD *)(a6 + 4_Block_object_dispose(&STACK[0x2E0], 8) = v33;
        *(void *)(a6 + 32) = *(int *)(a3 + 16);
LABEL_86:
        free((void *)a3);
LABEL_87:
        long long v14 = 0;
      }
LABEL_88:
      return v14;
    case 8:
      long long v14 = malloc_type_calloc(1uLL, 0x18uLL, 0x1020040F89CB87BuLL);
      v14[1] = *(void *)(a6 + 8);
      *(_DWORD *)long long v14 = 4;
      v14[2] = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      goto LABEL_88;
    case 9:
      if (*(_DWORD *)a6 == 2)
      {
        *(void *)(a6 + 80) = *(void *)(a3 + 16);
        *(_DWORD *)(a6 + 112) = 17;
      }
      else
      {
        if (*(_DWORD *)a6 != 1) {
          sub_100066130();
        }
        *(void *)(a6 + 20) = 0x1100000004;
        *(void *)(a6 + 32) = *(void *)(a3 + 16);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a3 + 8) + 32), (const void *)a4, *(const void **)(a3 + 16));
      }
      goto LABEL_86;
    case 10:
      sub_10006615C();
    case 11:
      sub_100066188();
    case 12:
      id v31 = malloc_type_calloc(1uLL, 0x80uLL, 0x10F204051DD1B44uLL);
      long long v14 = v31;
      *((void *)v31 + 1) = *(void *)(a6 + 8);
      int v32 = 2;
LABEL_28:
      _DWORD *v31 = v32;
      goto LABEL_88;
    case 13:
      long long v14 = 0;
      *(void *)(a6 + 20) = 0x1500000002;
      *(void *)(a6 + 32) = a3;
      goto LABEL_88;
    case 14:
      sub_1000661B4();
    case 15:
      int v17 = 0;
      a4 = 0;
      unint64_t v13 = 0;
      LODWORD(v20) = 0;
      LOWORD(v15) = 0;
      long long v14 = 0;
      LOBYTE(a3) = a3 & 1;
      int v18 = 14;
      goto LABEL_36;
    case 16:
      int v17 = 0;
      a4 = 0;
      unint64_t v13 = 0;
      LODWORD(v20) = 0;
      LOWORD(v15) = 0;
      long long v14 = 0;
      int v18 = 5;
      goto LABEL_36;
    case 17:
      int v17 = 0;
      a4 = 0;
      unint64_t v13 = 0;
      LODWORD(v20) = 0;
      long long v14 = 0;
      unint64_t v15 = a3 >> 8;
      int v18 = 4;
      goto LABEL_38;
    case 18:
      int v17 = 0;
      a4 = 0;
      unint64_t v13 = 0;
      long long v14 = 0;
      uint64_t v20 = (void *)(a3 >> 16);
      unint64_t v15 = a3 >> 8;
      int v18 = 3;
      goto LABEL_44;
    case 19:
      int v17 = 0;
      a4 = 0;
      long long v14 = 0;
      uint64_t v20 = (void *)(a3 >> 16);
      unint64_t v15 = a3 >> 8;
      int v18 = 2;
      goto LABEL_46;
    case 20:
      int v17 = 0;
      a4 = 0;
      unint64_t v13 = 0;
      LODWORD(v20) = 0;
      LOWORD(v15) = 0;
      long long v14 = 0;
      int v18 = 10;
LABEL_36:
      uint64_t v19 = 1;
      goto LABEL_58;
    case 21:
      int v17 = 0;
      a4 = 0;
      unint64_t v13 = 0;
      LODWORD(v20) = 0;
      long long v14 = 0;
      unint64_t v15 = a3 >> 8;
      int v18 = 9;
LABEL_38:
      uint64_t v19 = 2;
      goto LABEL_58;
    case 22:
      int v17 = 0;
      a4 = 0;
      unint64_t v13 = 0;
      long long v14 = 0;
      uint64_t v20 = (void *)(a3 >> 16);
      unint64_t v15 = a3 >> 8;
      int v18 = 8;
      goto LABEL_44;
    case 23:
      int v17 = 0;
      a4 = 0;
      long long v14 = 0;
      uint64_t v20 = (void *)(a3 >> 16);
      unint64_t v15 = a3 >> 8;
      int v18 = 7;
      goto LABEL_46;
    case 24:
      int v17 = 0;
      long long v14 = 0;
      uint64_t v20 = (void *)(a3 >> 16);
      unint64_t v15 = a3 >> 8;
      int v18 = 6;
      uint64_t v19 = 16;
      goto LABEL_58;
    case 25:
      int v17 = 0;
      a4 = 0;
      long long v14 = 0;
      uint64_t v20 = (void *)(a3 >> 16);
      unint64_t v15 = a3 >> 8;
      int v18 = 13;
      goto LABEL_46;
    case 26:
      int v17 = 0;
      a4 = 0;
      unint64_t v13 = 0;
      long long v14 = 0;
      uint64_t v20 = (void *)(a3 >> 16);
      unint64_t v15 = a3 >> 8;
      int v18 = 11;
LABEL_44:
      uint64_t v19 = 4;
      goto LABEL_58;
    case 27:
      int v17 = 0;
      a4 = 0;
      long long v14 = 0;
      uint64_t v20 = (void *)(a3 >> 16);
      unint64_t v15 = a3 >> 8;
      int v18 = 12;
LABEL_46:
      uint64_t v19 = 8;
      goto LABEL_58;
    case 28:
      unint64_t v34 = (unint64_t)strdup((const char *)a3);
      int v17 = 0;
      a4 = 0;
      long long v14 = 0;
      unint64_t v15 = v34 >> 8;
      uint64_t v20 = (void *)(v34 >> 16);
      unint64_t v13 = HIDWORD(v34);
      int v18 = 1;
      uint64_t v19 = 8;
      goto LABEL_57;
    case 29:
      unint64_t v34 = (unint64_t)strndup((const char *)a3, a4);
      int v17 = 0;
      a4 = 0;
      long long v14 = 0;
      unint64_t v15 = v34 >> 8;
      uint64_t v20 = (void *)(v34 >> 16);
      unint64_t v13 = HIDWORD(v34);
      int v18 = 1;
      uint64_t v19 = 8;
      goto LABEL_57;
    case 30:
      CFDictionaryRef v35 = *(const __CFDictionary **)(*(void *)(a6 + 8) + 24);
      if (!v35) {
        goto LABEL_53;
      }
      int Value = CFDictionaryGetValue(v35, (const void *)a4);
      long long v14 = Value;
      if (!Value) {
        goto LABEL_88;
      }
      unint64_t v34 = (unint64_t)CFRetain(Value);
      uint64_t v19 = 0;
      a4 = 0;
      unint64_t v15 = v34 >> 8;
      uint64_t v20 = (void *)(v34 >> 16);
      unint64_t v13 = HIDWORD(v34);
      int v18 = 16;
      int v17 = 1;
LABEL_57:
      LOBYTE(a3) = v34;
LABEL_58:
      switch(*(_DWORD *)a6)
      {
        case 2:
          int v38 = a3 | (v15 << 8) | (v20 << 16);
          if (*(unsigned char *)(a6 + 20))
          {
            *(_DWORD *)(a6 + 80) = v38;
            *(_DWORD *)(a6 + 84) = v13;
            *(void *)(a6 + 96) = 0;
            *(void *)(a6 + 104) = 0;
            *(void *)(a6 + 8_Block_object_dispose(&STACK[0x2E0], 8) = a4;
            *(_DWORD *)(a6 + 112) = v18;
          }
          else
          {
            *(_DWORD *)(a6 + 32) = v38;
            *(_DWORD *)(a6 + 36) = v13;
            *(void *)(a6 + 4_Block_object_dispose(&STACK[0x2E0], 8) = 0;
            *(void *)(a6 + 56) = 0;
            *(void *)(a6 + 40) = a4;
            *(_DWORD *)(a6 + 64) = v18;
            *(unsigned char *)(a6 + 20) = 1;
          }
          break;
        case 3:
          uint64_t v39 = *(int *)(a6 + 16);
          if (*(void *)(a6 + 32) == v39)
          {
            if (v39)
            {
              uint64_t v40 = 2 * v39;
              *(void *)(a6 + 32) = v40;
              *(void *)(a6 + 40) = malloc_type_realloc(*(void **)(a6 + 40), v40 * v19, 0x6A37A1F3uLL);
              if (*(_DWORD *)(a6 + 64) != v18) {
                sub_100066054();
              }
            }
            else
            {
              *(void *)(a6 + 32) = 4;
              *(void *)(a6 + 40) = malloc_type_malloc(4 * v19, 0x3AFCF9E4uLL);
              *(_DWORD *)(a6 + 64) = v18;
            }
          }
          switch(v18)
          {
            case 1:
            case 12:
            case 13:
              goto LABEL_78;
            case 2:
            case 7:
              goto LABEL_80;
            case 3:
            case 8:
            case 11:
              goto LABEL_79;
            case 4:
            case 9:
              goto LABEL_81;
            case 5:
            case 10:
              goto LABEL_82;
            case 14:
              goto LABEL_83;
            case 15:
              sub_100066028();
            default:
              goto LABEL_88;
          }
        case 4:
          if (v17)
          {
            CFArrayAppendValue(*(CFMutableArrayRef *)(a6 + 16), (const void *)(a3 | (unint64_t)(unsigned __int16)(v15 << 8) | ((unint64_t)(unsigned __int16)v20 << 16) | (v13 << 32)));
            CFRelease((CFTypeRef)(a3 | (unint64_t)(unsigned __int16)(v15 << 8) | ((unint64_t)(unsigned __int16)v20 << 16) | (v13 << 32)));
          }
          break;
        case 5:
          uint64_t v41 = *(int *)(a6 + 16);
          if (*(void *)(a6 + 32) == v41)
          {
            if (v41)
            {
              uint64_t v42 = 2 * v41;
              *(void *)(a6 + 32) = v42;
              *(void *)(a6 + 40) = malloc_type_realloc(*(void **)(a6 + 40), v42 * v19, 0x6C4BCC17uLL);
              if (*(_DWORD *)(a6 + 64) != v18) {
                sub_100066080();
              }
            }
            else
            {
              *(void *)(a6 + 32) = 4;
              *(void *)(a6 + 40) = malloc_type_malloc(4 * v19, 0x179E9FCEuLL);
              *(_DWORD *)(a6 + 64) = v18;
            }
          }
          switch(v18)
          {
            case 1:
            case 12:
            case 13:
LABEL_78:
              uint64_t v43 = *(void *)(a6 + 40);
              uint64_t v44 = *(int *)(a6 + 16);
              *(_DWORD *)(a6 + 16) = v44 + 1;
              *(void *)(v43 + 8 * v44) = a3 | (unint64_t)(unsigned __int16)(v15 << 8) | ((unint64_t)(unsigned __int16)v20 << 16) | (v13 << 32);
              break;
            case 2:
            case 7:
LABEL_80:
              uint64_t v47 = *(void *)(a6 + 40);
              uint64_t v48 = *(int *)(a6 + 16);
              *(_DWORD *)(a6 + 16) = v48 + 1;
              __int16 v49 = (int *)(v47 + 8 * v48);
              int *v49 = a3 | (v15 << 8) | (v20 << 16);
              v49[1] = v13;
              break;
            case 3:
            case 8:
            case 11:
LABEL_79:
              uint64_t v45 = *(void *)(a6 + 40);
              uint64_t v46 = *(int *)(a6 + 16);
              *(_DWORD *)(a6 + 16) = v46 + 1;
              *(_DWORD *)(v45 + 4 * v46) = a3 | (v15 << 8) | (v20 << 16);
              break;
            case 4:
            case 9:
LABEL_81:
              uint64_t v50 = *(void *)(a6 + 40);
              uint64_t v51 = *(int *)(a6 + 16);
              *(_DWORD *)(a6 + 16) = v51 + 1;
              *(_WORD *)(v50 + 2 * v51) = a3 | (unsigned __int16)((_WORD)v15 << 8);
              break;
            case 5:
            case 10:
LABEL_82:
              uint64_t v52 = *(void *)(a6 + 40);
              uint64_t v53 = *(int *)(a6 + 16);
              *(_DWORD *)(a6 + 16) = v53 + 1;
              *(unsigned char *)(v52 + v53) = a3;
              break;
            case 14:
LABEL_83:
              uint64_t v54 = *(void *)(a6 + 40);
              uint64_t v55 = *(int *)(a6 + 16);
              *(_DWORD *)(a6 + 16) = v55 + 1;
              *(unsigned char *)(v54 + v55) = a3 & 1;
              break;
            default:
              goto LABEL_88;
          }
          break;
        default:
          *(_DWORD *)(a6 + 32) = a3 | (v15 << 8) | (v20 << 16);
          *(_DWORD *)(a6 + 36) = v13;
          *(void *)(a6 + 4_Block_object_dispose(&STACK[0x2E0], 8) = 0;
          *(void *)(a6 + 56) = 0;
          *(void *)(a6 + 40) = a4;
          *(_DWORD *)(a6 + 24) = v18;
          break;
      }
      goto LABEL_88;
    case 31:
      a3 = (unint64_t)CFStringCreateWithCString(kCFAllocatorDefault, (const char *)a3, 0x8000100u);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(void *)(a6 + 8) + 24), (const void *)a4, (const void *)a3);
      uint64_t v19 = 0;
      a4 = 0;
      long long v14 = 0;
      unint64_t v15 = a3 >> 8;
      uint64_t v20 = (void *)(a3 >> 16);
      unint64_t v13 = HIDWORD(a3);
      int v18 = 16;
      int v17 = 1;
      goto LABEL_58;
    case 32:
      long long v37 = CFDictionaryGetValue(*(CFDictionaryRef *)(*(void *)(a6 + 8) + 32), (const void *)a4);
      long long v14 = v37;
      if (!v37) {
        goto LABEL_88;
      }
      unint64_t v34 = (unint64_t)CFRetain(v37);
      uint64_t v19 = 0;
      int v17 = 0;
      a4 = 0;
      unint64_t v15 = v34 >> 8;
      uint64_t v20 = (void *)(v34 >> 16);
      unint64_t v13 = HIDWORD(v34);
      int v18 = 17;
      goto LABEL_57;
    case 33:
      unint64_t v13 = HIDWORD(a4);
      char v65 = a4;
      unint64_t v15 = a4 >> 8;
      size_t v16 = a4 >> 16;
      uint64_t v20 = malloc_type_malloc(a4, 0xD422F4B5uLL);
      memcpy(v20, (const void *)a3, a4);
      int v17 = 0;
      long long v14 = 0;
      int v18 = 15;
      uint64_t v19 = 8;
      a4 = (size_t)v20;
      LODWORD(v20) = v16;
      LOBYTE(a3) = v65;
      goto LABEL_58;
    default:
LABEL_53:
      uint64_t v19 = 0;
      int v17 = 0;
      int v18 = 0;
      a4 = 0;
      unint64_t v13 = 0;
      LODWORD(v20) = 0;
      LOWORD(v15) = 0;
      LOBYTE(a3) = 0;
      long long v14 = 0;
      goto LABEL_58;
  }
}

void sub_10005FC78(uint64_t a1)
{
  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, *(NSMapTable **)(a1 + 32));
  key = 0;
  value = 0;
  if (NSNextMapEnumeratorPair(&enumerator, &key, &value))
  {
    int v47 = 0;
    id v2 = &MDItemInstantMessageAddresses_ptr;
    while (1)
    {
      CFIndex Count = CFBinaryHeapGetCount((CFBinaryHeapRef)value);
      id v4 = objc_alloc((Class)v2[176]);
      id v48 = [v4 initWithCString:key encoding:4];
      v42[1] = v42;
      __chkstk_darwin();
      id v6 = (char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v6, v5);
      CFBinaryHeapGetValues((CFBinaryHeapRef)value, (const void **)v6);
      uint64_t v7 = SPL1Threshold();
      unint64_t v43 = v8;
      uint64_t v44 = v7;
      if (Count >= 1) {
        break;
      }
LABEL_62:

      if (!NSNextMapEnumeratorPair(&enumerator, &key, &value)) {
        goto LABEL_65;
      }
    }
    uint64_t v9 = 0;
    uint64_t v45 = v6;
    CFIndex v46 = Count;
    while (1)
    {
      uint64_t v10 = *(void *)&v6[8 * v9];
      dispatch_block_t v11 = (uint64_t *)(v10 + 64);
      unint64_t v12 = *(void *)(v10 + 16);
      uint64_t v49 = *(void *)(v10 + 24);
      id v50 = *(id *)(v10 + 32);
      unint64_t v13 = sub_10004E20C(v10 + 64, 0);
      objc_opt_class();
      id v51 = v13;
      if (objc_opt_isKindOfClass()) {
        break;
      }
      int v17 = v50;
LABEL_61:

      if (++v9 == Count) {
        goto LABEL_62;
      }
    }
    if (*(void *)(a1 + 80))
    {
      unint64_t v14 = 0;
      int v15 = 0;
      do
      {
        if ([*(id *)(a1 + 40) containsIndex:v14])
        {
          if ((uint64_t)v14 > 63)
          {
            if (v14 > 0x7F)
            {
              if (v14 > 0xBF)
              {
                if (v14 > 0xFF) {
                  uint64_t v16 = v14 > 0x13F ? *(void *)(v10 + 104) : *(void *)(v10 + 96);
                }
                else {
                  uint64_t v16 = *(void *)(v10 + 88);
                }
              }
              else
              {
                uint64_t v16 = *(void *)(v10 + 80);
              }
            }
            else
            {
              uint64_t v16 = *(void *)(v10 + 72);
            }
          }
          else
          {
            uint64_t v16 = *v11;
          }
          if ((v16 & (1 << v14)) != 0) {
            ++v15;
          }
        }
        ++v14;
      }
      while (v14 < *(void *)(a1 + 80));
    }
    uint64_t v18 = SSCompactRankingAttrsAlloc();
    id v19 = v48;
    if (*(void *)(a1 + 80))
    {
      unint64_t v20 = 0;
      do
      {
        if ([*(id *)(a1 + 40) containsIndex:v20])
        {
          if (v20 > 0x3F)
          {
            if (v20 > 0x7F)
            {
              if (v20 > 0xBF)
              {
                if (v20 > 0xFF) {
                  uint64_t v21 = v20 > 0x13F ? *(void *)(v10 + 104) : *(void *)(v10 + 96);
                }
                else {
                  uint64_t v21 = *(void *)(v10 + 88);
                }
              }
              else
              {
                uint64_t v21 = *(void *)(v10 + 80);
              }
            }
            else
            {
              uint64_t v21 = *(void *)(v10 + 72);
            }
          }
          else
          {
            uint64_t v21 = *v11;
          }
          if ((v21 & (1 << v20)) != 0)
          {
            sub_10004EE30(v10 + 64, v20);
            long long v22 = sub_10004F638(v10 + 64, v20);
            if (v22) {
              SSCompactRankingAttrsInsertValue();
            }
          }
        }
        ++v20;
      }
      while (*(void *)(a1 + 80) > v20);
    }
    id v23 = [objc_alloc((Class)PRSRankingItem) initWithAttrs:v18 isServerAlternativeResult:1];
    if (([v19 isEqualToString:@"com.apple.application"] & 1) == 0) {
      goto LABEL_48;
    }
    long long v24 = *(void **)(a1 + 48);
    uint8x8_t v25 = [v23 identifier];
    if ([v24 containsObject:v25])
    {
      uint64_t v26 = *(void **)(a1 + 56);
      id v27 = [v23 identifier];
      LOBYTE(v26) = [v26 containsObject:v27];

      if ((v26 & 1) == 0)
      {
        uint64_t v28 = *(void **)(a1 + 56);
        uint64_t v29 = [v23 identifier];
        [v28 addObject:v29];

        id v19 = v48;
LABEL_48:
        *(void *)buf = 0;
        sub_10004E6EC(v10 + 64, 87, buf);
        uint64_t v30 = sub_10004E20C(v10 + 64, 10);
        sub_10004E6EC(v10 + 64, 88, buf);
        id v31 = [[SPSearchTopHitResult alloc] initWithRankingItem:v23 clientData:v10];
        unint64_t v32 = v49;
        -[SPTopHitResult setScore:](v31, "setScore:", v12, v49);
        long long v33 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*(double *)(v10 + 40)];
        [(SPTopHitResult *)v31 setInterestingDate:v33];

        [(SPTopHitResult *)v31 setBundleID:v19];
        int v17 = v50;
        [(SPTopHitResult *)v31 setDataclass:v50];
        if (__PAIR128__(v32, v12) < __PAIR128__(v43, v44)) {
          [v23 setEligibleForDemotion:1];
        }
        if ([v51 hasPrefix:@"com.apple.siri."])
        {
          unint64_t v34 = [(SPTopHitResult *)v31 rankingItem];
          CFDictionaryRef v35 = [v34 L2FeatureVector];
          [v35 setIsSiriAction:1];
        }
        id v36 = [*(id *)(a1 + 64) objectForKey:v19];
        if (!v36)
        {
          id v36 = objc_opt_new();
          [v36 setDomain:1];
          [v36 setBundleIdentifier:v19];
          if ([v19 isEqualToString:@"com.apple.application"])
          {
            long long v37 = +[NSBundle bundleForClass:objc_opt_class()];
            int v38 = [v37 localizedStringForKey:@"DOMAIN_APPLICATION" value:&stru_100094088 table:@"Search"];
            [v36 setTitle:v38];

            int v17 = v50;
          }
          else
          {
            long long v37 = +[SDLocUtilities displayNameForBundleIdentifer:v19];
            [v36 setTitle:v37];
          }

          [*(id *)(a1 + 64) setObject:v36 forKey:v19];
        }
        [v36 addResults:v31];
        ++v47;

        id v2 = &MDItemInstantMessageAddresses_ptr;
        CFIndex Count = v46;
        goto LABEL_60;
      }
    }
    else
    {
    }
    id v2 = &MDItemInstantMessageAddresses_ptr;
    CFIndex Count = v46;
    int v17 = v50;
LABEL_60:

    id v6 = v45;
    goto LABEL_61;
  }
  int v47 = 0;
LABEL_65:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
  double v39 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 88);
  uint64_t v40 = SPLogForSPLogCategoryDefault();
  uint64_t v41 = v40;
  if (v39 * 1000000000.0 <= 500000000.0)
  {
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = v39;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Local copy query took %lf seconds", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
  {
    sub_1000661E0(v47, v41, v39);
  }
}

void sub_100061050(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (id i = 0; i != v5; id i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "bundleIdentifier", (void)v15);
        if (!v9 || ([*(id *)(a1 + 40) containsObject:v9] & 1) == 0) {
          [v2 addObject:v8];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  uint64_t v10 = *(void *)(a1 + 48);
  if (!*(unsigned char *)(v10 + 121))
  {
    if (*(void *)(a1 + 56) == *(void *)(v10 + 200))
    {
      dispatch_block_t v11 = PRSLogCategoryDefault();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_1000662F8(v2);
      }

      uint64_t v12 = [*(id *)(a1 + 56) feedbackQueryIdentifier];
      uint64_t v13 = *(void *)(a1 + 48);
      unint64_t v14 = *(void **)(v13 + 152);
      *(void *)(v13 + 152) = v12;

      objc_storeStrong((id *)(*(void *)(a1 + 48) + 208), v2);
      uint64_t v10 = *(void *)(a1 + 48);
    }
    if (*(void *)(v10 + 208) || !*(void *)(v10 + 200)) {
      objc_msgSend((id)v10, "finished", (void)v15);
    }
  }
}

void sub_100061928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100061F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100062688(uint64_t a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  long long v15 = SPLogForSPLogCategoryDefault();
  os_log_type_t v16 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v15, v16))
  {
    int v19 = 138412546;
    id v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Got FTE reply - fteString %@, learnMore %@", (uint8_t *)&v19, 0x16u);
  }

  if (a6)
  {
    uint64_t v17 = *(void *)(a1 + 32);
    long long v18 = *(void **)(v17 + 72);
    *(void *)(v17 + 72) = 0;

    [*(id *)(a1 + 32) setupSearchSession];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000629E4(uint64_t a1)
{
  id v2 = objc_alloc_init(SPParsecFeedbackProxy);
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + _Block_object_dispose(&STACK[0x2E0], 8) = v2;

  id v5 = [*(id *)(*(void *)(a1 + 32) + 72) listener];
  [*(id *)(*(void *)(a1 + 32) + 8) setListener:v5];
}

id sub_100062A60(char *a1, void *a2)
{
  keys = a1;
  xpc_object_t v4 = a2;
  xpc_object_t v2 = xpc_dictionary_create((const char *const *)&keys, &v4, 1uLL);

  return v2;
}

void sub_100062D44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100063B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100063CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  sub_1000067B0((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_100063CE4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

unsigned int *sub_100063D04(unsigned int a1)
{
  xpc_object_t v2 = malloc_type_calloc(1uLL, (16 * a1) | 8, 0x11EAD1D1uLL);
  uint64_t v3 = v2;
  v7[1] = 0;
  _DWORD *v2 = a1;
  if (a1)
  {
    unint64_t v4 = 0;
    id v5 = v2 + 2;
    do
    {
      sub_1000640AC(v5, v7);
      ++v4;
      v5 += 2;
    }
    while (v4 < *v3);
  }
  return v3;
}

void sub_100063D8C(unsigned int *a1)
{
  if (a1)
  {
    uint64_t v1 = sub_100064038(a1);
    free(v1);
  }
}

uint64_t sub_100063DBC(unsigned int *a1, uint64_t a2, uint64_t a3, void *a4)
{
  v12[0] = a2;
  v12[1] = a3;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  unint64_t v4 = *a1;
  if (!v4) {
    return 0;
  }
  uint64_t v6 = &a1[4 * ((a2 - 1) % v4)];
  uint64_t v7 = v6 + 2;
  uint64_t v8 = *((void *)v6 + 2);
  if (v8)
  {
    if (sub_10004FD54(v8, a3) != -1 && *v7) {
      return 0;
    }
  }
  sub_1000640AC(&v10, v7);
  sub_1000640AC(v7, v12);
  *a4 = v11;
  return 1;
}

uint64_t sub_100063E58(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  v8[0] = a2;
  v8[1] = a3;
  unint64_t v3 = *a1;
  if (!v3) {
    return 0;
  }
  unint64_t v4 = &a1[4 * ((a2 - 1) % v3)];
  id v5 = v4 + 2;
  uint64_t v6 = *((void *)v4 + 2);
  if (v6)
  {
    if (sub_10004FDC4(v6, a3) != -1 && *v5) {
      return 0;
    }
  }
  sub_1000640AC(v5, v8);
  return 1;
}

unint64_t sub_100063ED8(unint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    uint64_t v2 = *(unsigned int *)result;
    if (v2)
    {
      LODWORD(result) = 0;
      unint64_t v3 = (uint64_t *)(v1 + 8);
      do
      {
        uint64_t v4 = *v3;
        v3 += 2;
        if (v4) {
          id result = (result + 1);
        }
        else {
          id result = result;
        }
        --v2;
      }
      while (v2);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void sub_100063F10(unsigned int *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    uint64_t v10 = sub_100064024;
    uint64_t v11 = &unk_100093D18;
    id v12 = v3;
    id v5 = v9;
    unint64_t v6 = *a1;
    if (v6)
    {
      unint64_t v7 = 0;
      uint64_t v8 = (uint64_t *)(a1 + 4);
      do
      {
        if (*(v8 - 1))
        {
          uint64_t v14 = *v8;
          ((void (*)(void *, unsigned char *))v10)(v5, v13);
          unint64_t v6 = *a1;
        }
        ++v7;
        v8 += 2;
      }
      while (v7 < v6);
    }
  }
}

void sub_100064008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100064024(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

unsigned int *sub_100064038(unsigned int *a1)
{
  unint64_t v2 = *a1;
  if (v2)
  {
    unint64_t v3 = 0;
    uint64_t v4 = (atomic_uint **)(a1 + 4);
    do
    {
      if (*(v4 - 1) && *v4)
      {
        sub_10004E6C0((uint64_t)kCFAllocatorDefault, *v4);
        unint64_t v2 = *a1;
      }
      ++v3;
      v4 += 2;
    }
    while (v3 < v2);
  }
  return a1;
}

void *sub_1000640AC(void *a1, void *a2)
{
  if (a1 != a2)
  {
    uint64_t v4 = (atomic_uint *)a2[1];
    if (v4) {
      sub_10004E6DC((uint64_t)kCFAllocatorDefault, v4);
    }
    id v5 = (atomic_uint *)a1[1];
    if (v5) {
      sub_10004E6C0((uint64_t)kCFAllocatorDefault, v5);
    }
    uint64_t v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
  }
  return a1;
}

void sub_100064460(_Unwind_Exception *a1)
{
  sub_1000067B0(v1 - 144);
  _Unwind_Resume(a1);
}

void sub_10006448C(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v4 = [v3 results];
  id v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)v8), "setQueryId:", objc_msgSend(*(id *)(a1 + 32), "queryIdent"));
        uint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }

  uint64_t v9 = +[SDController workQueue];
  qos_class_t v10 = qos_class_self();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100064684;
  v17[3] = &unk_100093D40;
  long long v11 = *(_OWORD *)(a1 + 72);
  long long v22 = *(_OWORD *)(a1 + 56);
  long long v23 = v11;
  uint64_t v24 = *(void *)(a1 + 88);
  int v25 = *(_DWORD *)(a1 + 96);
  id v12 = *(id *)(a1 + 32);
  uint64_t v13 = *(void *)(a1 + 40);
  uint64_t v14 = *(void **)(a1 + 48);
  id v18 = v12;
  uint64_t v19 = v13;
  id v20 = v3;
  id v21 = v14;
  id v15 = v3;
  dispatch_block_t v16 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v10, 0, v17);
  dispatch_async(v9, v16);
}

double sub_100064684(uint64_t a1)
{
  uint64_t v2 = si_tracing_current_span();
  long long v3 = *(_OWORD *)(v2 + 16);
  long long v28 = *(_OWORD *)v2;
  long long v29 = v3;
  uint64_t v30 = *(void *)(v2 + 32);
  uint64_t v4 = *(void *)(a1 + 96);
  long long v5 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)uint64_t v2 = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v2 + 16) = v5;
  *(void *)(v2 + 32) = v4;
  long long v6 = *(_OWORD *)(a1 + 80);
  long long v25 = *(_OWORD *)(a1 + 64);
  long long v26 = v6;
  uint64_t v27 = *(void *)(a1 + 96);
  uint64_t v7 = *(void *)v2;
  uint64_t spanid = si_tracing_calc_next_spanid();
  uint64_t v9 = *(void *)(v2 + 8);
  *(void *)uint64_t v2 = v7;
  *(void *)(v2 + _Block_object_dispose(&STACK[0x2E0], 8) = spanid;
  *(void *)(v2 + 16) = v9;
  *(unsigned char *)(v2 + 2_Block_object_dispose(&STACK[0x2E0], 8) = 102;
  *(void *)(v2 + 32) = "SPWorldClockDataStore completion";
  si_tracing_log_span_begin();
  qos_class_t v10 = SPLogForSPLogCategoryTelemetry();
  long long v11 = v10;
  os_signpost_id_t v12 = *(unsigned int *)(a1 + 104);
  if (v12 && os_signpost_enabled(v10))
  {
    *(_WORD *)uint64_t v24 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_END, v12, "worldClockLatency", " enableTelemetry=YES ", v24, 2u);
  }

  uint64_t v13 = *(void **)(a1 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  if (v15)
  {
    uint64_t v31 = *(void *)(a1 + 48);
    dispatch_block_t v16 = +[NSArray arrayWithObjects:&v31 count:1];
  }
  else
  {
    dispatch_block_t v16 = &__NSArray0__struct;
  }
  [v13 storeCompletedSearch:v14 withSections:v16];
  if (v15) {

  }
  id v17 = [objc_alloc((Class)SFEndLocalSearchFeedback) initWithStartSearch:*(void *)(a1 + 56)];
  id v18 = +[SPFeedbackProxy sharedProxy];
  id v19 = [*(id *)(a1 + 32) queryIdent];
  id v20 = [*(id *)(a1 + 32) connection];
  id v21 = [v20 bundleID];
  [v18 sendFeedbackType:6 feedback:v17 queryId:v19 clientID:v21];

  si_tracing_log_span_end();
  double result = *(double *)&v28;
  long long v23 = v29;
  *(_OWORD *)uint64_t v2 = v28;
  *(_OWORD *)(v2 + 16) = v23;
  *(void *)(v2 + 32) = v30;
  return result;
}

void sub_1000648B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, long long a17, long long a18, uint64_t a19)
{
  *(_OWORD *)uint64_t v19 = a17;
  *(_OWORD *)(v19 + 16) = a18;
  *(void *)(v19 + 32) = a19;
  _Unwind_Resume(exception_object);
}

void sub_100064A30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100064A54(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)long long v3 = 138412546;
  *(void *)&void v3[4] = *(void *)(a1 + 8);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_100003EBC((void *)&_mh_execute_header, a2, a3, "Error serializing property list for %@ %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_100064AD0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)long long v3 = 138412546;
  *(void *)&void v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_100003EBC((void *)&_mh_execute_header, a2, a3, "Error, can't load property list for %@ %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_100064B48(uint64_t a1, NSObject *a2)
{
  int v4 = 138412290;
  id v5 = (id)objc_opt_class();
  id v3 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error, property list is not expected class NSDictionary, instead %@", (uint8_t *)&v4, 0xCu);
}

void sub_100064BE0()
{
  sub_1000053C0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Music recommendation result droped due to data store being canceled.", v1, 2u);
}

void sub_100064C20()
{
  sub_1000053C0();
  sub_1000053A4((void *)&_mh_execute_header, v0, v1, "Waiting for Music recommendation retrieval.", v2, v3, v4, v5, v6);
}

void sub_100064C54()
{
  sub_1000053C0();
  sub_1000053A4((void *)&_mh_execute_header, v0, v1, "Music retrieval candidate got.", v2, v3, v4, v5, v6);
}

void sub_100064C88()
{
  sub_1000053C0();
  sub_1000053A4((void *)&_mh_execute_header, v0, v1, "Music retrieval complete. Before dispatch_semaphore_signal", v2, v3, v4, v5, v6);
}

void sub_100064CBC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#query No datastores found!", v1, 2u);
}

void sub_100064D00(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "===^^^ Could not obtain Parsec datastore!", v1, 2u);
}

void sub_100064D44()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Did not load Trial params during startup as device lock state is not unlocked", v2, v3, v4, v5, v6);
}

void sub_100064D78()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "[ResourceManager] could not create asset resources directory", v2, v3, v4, v5, v6);
}

void sub_100064DAC(void *a1, NSObject *a2)
{
  int v3 = 134217984;
  id v4 = [a1 code];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "got error fetching me card email addresses: %ld", (uint8_t *)&v3, 0xCu);
}

void sub_100064E38()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Got a null value for contactId", v2, v3, v4, v5, v6);
}

void sub_100064E6C()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Did not load Trial params during startup as device has not been unlocked", v2, v3, v4, v5, v6);
}

void sub_100064EA0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100064F0C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100064F78(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100064FE4(os_log_t log)
{
  int v1 = 136315394;
  uint64_t v2 = "com.apple.searchd.updateRanking";
  __int16 v3 = 2048;
  uint64_t v4 = 2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to defer XPC activity:%s, state:%ld", (uint8_t *)&v1, 0x16u);
}

void sub_100065078(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000650B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000650E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100065154(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000651C0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100065230(void *a1, uint64_t a2, NSObject *a3)
{
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  id v7 = [a1 length];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "bad app metadata offset:%lld dataLen:%lu", (uint8_t *)&v4, 0x16u);
}

void sub_1000652CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100065304()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Serious error in init keychain \n", v2, v3, v4, v5, v6);
}

void sub_100065338()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Couldn't create random key", v2, v3, v4, v5, v6);
}

void sub_10006536C()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Problem deleting current keychain item.", v2, v3, v4, v5, v6);
}

void sub_1000653A0()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Keychain Item update failed.", v2, v3, v4, v5, v6);
}

void sub_1000653D4()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Keychain Item add failed", v2, v3, v4, v5, v6);
}

void sub_100065408()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Serious error.\n", v2, v3, v4, v5, v6);
}

void sub_10006543C()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Nothing was found in the keychain.\n", v2, v3, v4, v5, v6);
}

void sub_100065470()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Error in opening temporary file.\n", v2, v3, v4, v5, v6);
}

void sub_1000654A4()
{
  __error();
  sub_10002E8F4((void *)&_mh_execute_header, v0, v1, "Serious error in writing temporary file. %d\n", v2, v3, v4, v5, 0);
}

void sub_100065524()
{
  __error();
  sub_10002E8F4((void *)&_mh_execute_header, v0, v1, "Serious error in truncateMapping %d\n", v2, v3, v4, v5, 0);
}

void sub_1000655A4()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Failed to remap", v2, v3, v4, v5, v6);
}

void sub_1000655D8()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Couldn't create blank flag file in backup module", v2, v3, v4, v5, v6);
}

void sub_10006560C()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Error opening encrypted file", v2, v3, v4, v5, v6);
}

void sub_100065640()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Error reading mmaped encrypted file", v2, v3, v4, v5, v6);
}

void sub_100065674(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to open backup file, err:%d", (uint8_t *)v2, 8u);
}

void sub_1000656EC()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Error getDataOutWithSize", v2, v3, v4, v5, v6);
}

void sub_100065720()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "returning unsuccessfully post decompression due to invalid destination size", v2, v3, v4, v5, v6);
}

void sub_100065754()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Couldn't decrypt data", v2, v3, v4, v5, v6);
}

void sub_100065788()
{
  sub_1000053C0();
  sub_10000F6DC((void *)&_mh_execute_header, v0, v1, "Error reading nsdata from encrypted file", v2, v3, v4, v5, v6);
}

void sub_1000657BC(void *a1)
{
  [a1 code];
  sub_10004D9D4();
  sub_10004DA24((void *)&_mh_execute_header, v1, v2, "got error fetching me card info: %ld", v3, v4, v5, v6, v7);
}

void sub_100065834(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_10004D9D4();
  sub_10004DA24((void *)&_mh_execute_header, v2, v3, "** Mail VIP Widget failed to connect to MailServices: %@", v4, v5, v6, v7, v8);
}

void sub_1000658B8()
{
  sub_10004D9D4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "There was an XPC error when fetching VIPs: %@", v1, 0xCu);
}

void sub_10006592C()
{
  sub_10004D9D4();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error loading home screen config cache: %@", v1, 0xCu);
}

void sub_1000659A0()
{
  sub_10004D9D4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[debug][personal answers][query] Modified queryString = %@", v1, 0xCu);
}

void sub_100065A14()
{
  sub_10004D9D4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[debug][personal answers][query] personalAnswersQueries = %@", v1, 0xCu);
}

void sub_100065A88(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "indexQueue is nil; can't set up priority fast path",
    v1,
    2u);
}

void sub_100065ACC(NSObject *a1)
{
  if (sub_10004D9E0(a1, &gSPLogDebugAsDefault)) {
    sub_10004DA04((void *)&_mh_execute_header, v1, v2, "ERROR: In 'performQuery', Unhandled container type for ending an array", v3, v4, v5, v6, 0);
  }
}

void sub_100065B1C(NSObject *a1)
{
  if (sub_10004D9E0(a1, &gSPLogDebugAsDefault)) {
    sub_10004DA04((void *)&_mh_execute_header, v1, v2, "ERROR: In 'performQuery', Unhandled container type for ending a uniqued array", v3, v4, v5, v6, 0);
  }
}

void sub_100065B6C(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[rewrite] qid=%ld Fetching Spotlight rewrite candidates failed: %@", buf, 0x16u);
}

void sub_100065BC4()
{
}

void sub_100065BF0()
{
}

void sub_100065C1C()
{
}

void sub_100065C48()
{
}

void sub_100065C74()
{
  __assert_rtn("-[SPCoreSpotlightDatastore taskForTopHitQueryWithQueryString:queryContext:eventHandler:resultsHandler:completionHandler:]", "SPCoreSpotlightDatastore.m", 5921, "eventHandler == nil");
}

void sub_100065CA0(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3 = qword_1000A92C0[*(void *)(a1 + 72)];
  uint64_t v4 = *a2;
  int v5 = 136315394;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  sub_10005BFBC((void *)&_mh_execute_header, a3, (uint64_t)a3, "no feedback (%s) feedbackData %p", (uint8_t *)&v5);
}

void sub_100065D34(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4 = [a2 description];
  sub_10005BF8C();
  sub_10005BFBC((void *)&_mh_execute_header, a3, v5, "*** invalid feedback class for (%s) %@", v6);
}

void sub_100065DE0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = qword_1000A92C0[*(void *)(a1 + 72)];
  int v4 = 136315394;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  sub_10005BFBC((void *)&_mh_execute_header, a3, (uint64_t)a3, "*** Error unarchiving feedback (%s) : %@", (uint8_t *)&v4);
}

void sub_100065E70(uint64_t a1, void *a2, NSObject *a3)
{
  int v4 = [a2 description];
  sub_10005BF8C();
  sub_10005BFBC((void *)&_mh_execute_header, a3, v5, "*** invalid feedback class for (%s) %@", v6);
}

void sub_100065F14()
{
  sub_10005BFA4();
  sub_10005BFD4((void *)&_mh_execute_header, v0, v1, "invalid information for type %d feedback %p", v2, v3);
}

void sub_100065F7C()
{
  sub_10005BFA4();
  sub_10005BFD4((void *)&_mh_execute_header, v0, v1, "invalid information for type %d feedbackData %p", v2, v3);
}

void sub_100065FE4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Got Parsec load", v1, 2u);
}

void sub_100066028()
{
}

void sub_100066054()
{
  __assert_rtn("-[SPParsecQueryTask findLocalCopies:alternativeResults:withQueryString:]_block_invoke_2", "SPParsecDatastore.m", 922, "array->valtype == type");
}

void sub_100066080()
{
  __assert_rtn("-[SPParsecQueryTask findLocalCopies:alternativeResults:withQueryString:]_block_invoke_2", "SPParsecDatastore.m", 973, "array->valtype == type");
}

void sub_1000660AC()
{
}

void sub_1000660D8()
{
}

void sub_100066104()
{
}

void sub_100066130()
{
}

void sub_10006615C()
{
}

void sub_100066188()
{
}

void sub_1000661B4()
{
}

void sub_1000661E0(int a1, NSObject *a2, double a3)
{
  v3[0] = 67109632;
  v3[1] = a1;
  __int16 v4 = 2048;
  double v5 = a3;
  __int16 v6 = 2048;
  uint64_t v7 = 0x3FE0000000000000;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Local copy query took longer than allowed timeout and missed %d results: took %lf seconds but was allowed %lf", (uint8_t *)v3, 0x1Cu);
}

void sub_100066270(void *a1)
{
  os_log_t v1 = objc_msgSend(a1, "category_stats");
  sub_100063CE4((void *)&_mh_execute_header, v2, v3, "Category stats: %@", v4, v5, v6, v7, 2u);
}

void sub_1000662F8(void *a1)
{
  os_log_t v1 = [a1 valueForKey:@"title"];
  sub_100063CE4((void *)&_mh_execute_header, v2, v3, "Got Parsec results: %@", v4, v5, v6, v7, 2u);
}

void sub_100066388(uint64_t a1, NSObject *a2)
{
  if (*(unsigned char *)(a1 + 48)) {
    uint64_t v2 = "enabled";
  }
  else {
    uint64_t v2 = "disabled";
  }
  int v3 = 136315138;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "activate parsec datastore (%s)", (uint8_t *)&v3, 0xCu);
}

void sub_10006641C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "===^^^ Could not create Parsec Session!", v1, 2u);
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

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCrypt(op, alg, options, key, keyLength, iv, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return _CCCryptorCreate(op, alg, options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCryptorFinal(cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return _CCCryptorRelease(cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return _CCCryptorUpdate(cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return _CFBinaryHeapCreate(allocator, capacity, callBacks, compareContext);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return _CFBinaryHeapGetCount(heap);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return _CFBinaryHeapGetMinimum(heap);
}

void CFBinaryHeapGetValues(CFBinaryHeapRef heap, const void **values)
{
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFBitVectorCreateMutable(allocator, capacity);
}

CFBit CFBitVectorGetBitAtIndex(CFBitVectorRef bv, CFIndex idx)
{
  return _CFBitVectorGetBitAtIndex(bv, idx);
}

CFIndex CFBitVectorGetCount(CFBitVectorRef bv)
{
  return _CFBitVectorGetCount(bv);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFArrayRef CFBundleCopyBundleLocalizations(CFBundleRef bundle)
{
  return _CFBundleCopyBundleLocalizations(bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return _CFBundleGetValueForInfoDictionaryKey(bundle, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return _CFHash(cf);
}

CFLocaleIdentifier CFLocaleCreateCanonicalLanguageIdentifierFromString(CFAllocatorRef allocator, CFStringRef localeIdentifier)
{
  return _CFLocaleCreateCanonicalLanguageIdentifierFromString(allocator, localeIdentifier);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return _CFNotificationCenterGetLocalCenter();
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithData(allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return _CFSetCreateCopy(allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return _CFSetGetCount(theSet);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

uint64_t CSRedactString()
{
  return _CSRedactString();
}

uint64_t DCSCopyActiveDictionaries()
{
  return _DCSCopyActiveDictionaries();
}

uint64_t DCSSearchFoundationCopyResultsWithOptions()
{
  return _DCSSearchFoundationCopyResultsWithOptions();
}

uint64_t MGGetProductType()
{
  return _MGGetProductType();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return _NSEnumerateMapTable(retstr, table);
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return _NSMapGet(table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
}

void NSMapRemove(NSMapTable *table, const void *key)
{
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return _NSNextMapEnumeratorPair(enumerator, key, value);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PRSLogCategoryDefault()
{
  return _PRSLogCategoryDefault();
}

uint64_t PRSRankingItemRankerAddJunkFilter()
{
  return _PRSRankingItemRankerAddJunkFilter();
}

uint64_t PRSRankingQueryIndexDictionary()
{
  return _PRSRankingQueryIndexDictionary();
}

uint64_t PRSRankingSDEnabledFlagState()
{
  return _PRSRankingSDEnabledFlagState();
}

uint64_t SDTraceAdd()
{
  return _SDTraceAdd();
}

uint64_t SIGetCompletionOptionsFromRankingWeights()
{
  return _SIGetCompletionOptionsFromRankingWeights();
}

uint64_t SISetCompletionRankingWeights()
{
  return _SISetCompletionRankingWeights();
}

uint64_t SPCopyVisibleApps()
{
  return _SPCopyVisibleApps();
}

uint64_t SPFastApplicationsGet()
{
  return _SPFastApplicationsGet();
}

uint64_t SPFastApplicationsGetNoBuild()
{
  return _SPFastApplicationsGetNoBuild();
}

uint64_t SPFastApplicationsNamesGetNoBuild()
{
  return _SPFastApplicationsNamesGetNoBuild();
}

uint64_t SPFastApplicationsSet()
{
  return _SPFastApplicationsSet();
}

uint64_t SPFastHiddenAppsGetNoBuild()
{
  return _SPFastHiddenAppsGetNoBuild();
}

uint64_t SPGenreGroupingEnabled()
{
  return _SPGenreGroupingEnabled();
}

uint64_t SPGetDisabledDomainSet()
{
  return _SPGetDisabledDomainSet();
}

uint64_t SPGetDisabledDomains()
{
  return _SPGetDisabledDomains();
}

uint64_t SPHideSearchThroughSuggestions()
{
  return _SPHideSearchThroughSuggestions();
}

uint64_t SPL1Threshold()
{
  return _SPL1Threshold();
}

uint64_t SPL2Threshold()
{
  return _SPL2Threshold();
}

uint64_t SPLogForSPLogCategoryDefault()
{
  return _SPLogForSPLogCategoryDefault();
}

uint64_t SPLogForSPLogCategoryFeedback()
{
  return _SPLogForSPLogCategoryFeedback();
}

uint64_t SPLogForSPLogCategoryIndex()
{
  return _SPLogForSPLogCategoryIndex();
}

uint64_t SPLogForSPLogCategoryQuery()
{
  return _SPLogForSPLogCategoryQuery();
}

uint64_t SPLogForSPLogCategoryRanking()
{
  return _SPLogForSPLogCategoryRanking();
}

uint64_t SPLogForSPLogCategoryTelemetry()
{
  return _SPLogForSPLogCategoryTelemetry();
}

uint64_t SPLogInit()
{
  return _SPLogInit();
}

uint64_t SPMaxCountTopHits()
{
  return _SPMaxCountTopHits();
}

uint64_t SPMaxSectionsBeforeShowMore()
{
  return _SPMaxSectionsBeforeShowMore();
}

uint64_t SPMaxSectionsBeforeShowMoreWithScopedSearch()
{
  return _SPMaxSectionsBeforeShowMoreWithScopedSearch();
}

uint64_t SPMaxVisibleResultsCountPerSection()
{
  return _SPMaxVisibleResultsCountPerSection();
}

uint64_t SPMinTopHitThresholdForBigResult()
{
  return _SPMinTopHitThresholdForBigResult();
}

uint64_t SPSetAppUpdateBlock()
{
  return _SPSetAppUpdateBlock();
}

uint64_t SPSetInternetDomainsAvailable()
{
  return _SPSetInternetDomainsAvailable();
}

uint64_t SPSpotlightSupportDirectoryPath()
{
  return _SPSpotlightSupportDirectoryPath();
}

uint64_t SSAllLocalizedExtraApplicationKeywords()
{
  return _SSAllLocalizedExtraApplicationKeywords();
}

uint64_t SSApplicationHasExtraInformation()
{
  return _SSApplicationHasExtraInformation();
}

uint64_t SSBuildExtraApplicationAlternateNames()
{
  return _SSBuildExtraApplicationAlternateNames();
}

uint64_t SSCompactRankingAttrsAlloc()
{
  return _SSCompactRankingAttrsAlloc();
}

uint64_t SSCompactRankingAttrsCopy()
{
  return _SSCompactRankingAttrsCopy();
}

uint64_t SSCompactRankingAttrsGetCount()
{
  return _SSCompactRankingAttrsGetCount();
}

uint64_t SSCompactRankingAttrsGetValue()
{
  return _SSCompactRankingAttrsGetValue();
}

uint64_t SSCompactRankingAttrsInsertValue()
{
  return _SSCompactRankingAttrsInsertValue();
}

uint64_t SSCompactRankingAttrsUpdateValue()
{
  return _SSCompactRankingAttrsUpdateValue();
}

uint64_t SSCreateAsTypedSuggestion()
{
  return _SSCreateAsTypedSuggestion();
}

uint64_t SSDefaultQueryParseResultsForQueryString()
{
  return _SSDefaultQueryParseResultsForQueryString();
}

uint64_t SSDefaultsGetResources()
{
  return _SSDefaultsGetResources();
}

uint64_t SSDefaultsLogForTrigger()
{
  return _SSDefaultsLogForTrigger();
}

uint64_t SSDefaultsSetResources()
{
  return _SSDefaultsSetResources();
}

uint64_t SSDisplayLateServerSuggestions()
{
  return _SSDisplayLateServerSuggestions();
}

uint64_t SSEnableAppSearchV2()
{
  return _SSEnableAppSearchV2();
}

uint64_t SSEnableLocalDetailText()
{
  return _SSEnableLocalDetailText();
}

uint64_t SSEnableSpotlightTopHitPersonalizedRanking()
{
  return _SSEnableSpotlightTopHitPersonalizedRanking();
}

uint64_t SSExtraApplicationVersion()
{
  return _SSExtraApplicationVersion();
}

uint64_t SSGetCurrentLocale()
{
  return _SSGetCurrentLocale();
}

uint64_t SSIsCounterFactual()
{
  return _SSIsCounterFactual();
}

uint64_t SSMaxSectionsBelowSuggestions()
{
  return _SSMaxSectionsBelowSuggestions();
}

uint64_t SSNormalizedQueryString()
{
  return _SSNormalizedQueryString();
}

uint64_t SSPhraseQueryEscapeString()
{
  return _SSPhraseQueryEscapeString();
}

uint64_t SSPommesRankingForSectionBundle()
{
  return _SSPommesRankingForSectionBundle();
}

uint64_t SSPreferLocalResultsOnLocalEngagment()
{
  return _SSPreferLocalResultsOnLocalEngagment();
}

uint64_t SSPriorityIndexDelayMilliseconds()
{
  return _SSPriorityIndexDelayMilliseconds();
}

uint64_t SSPriorityIndexFastPathEnabled()
{
  return _SSPriorityIndexFastPathEnabled();
}

uint64_t SSPriorityIndexLimitBundles()
{
  return _SSPriorityIndexLimitBundles();
}

uint64_t SSQueryParseResultsForQueryString()
{
  return _SSQueryParseResultsForQueryString();
}

uint64_t SSQueryParserCancelWithReferenceDict()
{
  return _SSQueryParserCancelWithReferenceDict();
}

uint64_t SSQueryParserStripKindFromString()
{
  return _SSQueryParserStripKindFromString();
}

uint64_t SSRearrangeDuplicatesInSection()
{
  return _SSRearrangeDuplicatesInSection();
}

uint64_t SSScreenTimeStatusClearCache()
{
  return _SSScreenTimeStatusClearCache();
}

uint64_t SSSectionIsMailOrPommesCTL()
{
  return _SSSectionIsMailOrPommesCTL();
}

uint64_t SSSectionIsSyndicatedPhotos()
{
  return _SSSectionIsSyndicatedPhotos();
}

uint64_t SSSetTopHitWithReasonString()
{
  return _SSSetTopHitWithReasonString();
}

uint64_t SSShowMusicRec()
{
  return _SSShowMusicRec();
}

uint64_t SSSnippetModernizationEnabled()
{
  return _SSSnippetModernizationEnabled();
}

uint64_t SSSpotlightL1Compare()
{
  return _SSSpotlightL1Compare();
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return _SecItemAdd(attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return _SecItemCopyMatching(query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return _SecItemDelete(query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return _SecItemUpdate(query, attributesToUpdate);
}

uint64_t SimulateCrash()
{
  return _SimulateCrash();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateFilteredLocalizedInfoPlist()
{
  return __CFBundleCreateFilteredLocalizedInfoPlist();
}

uint64_t _CFBundleCreateUnique()
{
  return __CFBundleCreateUnique();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

uint64_t _MDBundleUtilsCopyLocalizedApplicationCategories()
{
  return __MDBundleUtilsCopyLocalizedApplicationCategories();
}

uint64_t _MDBundleUtilsCopyLocalizedDescriptionDictionary()
{
  return __MDBundleUtilsCopyLocalizedDescriptionDictionary();
}

uint64_t _MDCreateSimpleQueryEvaluatorWithBlock()
{
  return __MDCreateSimpleQueryEvaluatorWithBlock();
}

uint64_t _MDPlistBytesAddNull()
{
  return __MDPlistBytesAddNull();
}

uint64_t _MDPlistBytesBeginArray()
{
  return __MDPlistBytesBeginArray();
}

uint64_t _MDPlistBytesBeginPlist()
{
  return __MDPlistBytesBeginPlist();
}

uint64_t _MDPlistBytesCopyChildPlistBytesAtIndex()
{
  return __MDPlistBytesCopyChildPlistBytesAtIndex();
}

uint64_t _MDPlistBytesCreate()
{
  return __MDPlistBytesCreate();
}

uint64_t _MDPlistBytesCreateMutable()
{
  return __MDPlistBytesCreateMutable();
}

uint64_t _MDPlistBytesEndArray()
{
  return __MDPlistBytesEndArray();
}

uint64_t _MDPlistBytesEndPlist()
{
  return __MDPlistBytesEndPlist();
}

uint64_t _MDPlistBytesGetByteVector()
{
  return __MDPlistBytesGetByteVector();
}

uint64_t _MDPlistBytesGetByteVectorCount()
{
  return __MDPlistBytesGetByteVectorCount();
}

uint64_t _MDPlistContainerCreateWithBytes()
{
  return __MDPlistContainerCreateWithBytes();
}

uint64_t _MDPlistContainerGetBytes()
{
  return __MDPlistContainerGetBytes();
}

uint64_t _MDPlistContainerGetLength()
{
  return __MDPlistContainerGetLength();
}

uint64_t _MDPlistDictionaryIterate()
{
  return __MDPlistDictionaryIterate();
}

uint64_t _MDPlistGetRootPlistObjectFromPlist()
{
  return __MDPlistGetRootPlistObjectFromPlist();
}

uint64_t _MDPlistNumberGetIntValue()
{
  return __MDPlistNumberGetIntValue();
}

uint64_t _MDSimpleQueryDeallocate()
{
  return __MDSimpleQueryDeallocate();
}

uint64_t _MDSimpleQueryObjectMatches()
{
  return __MDSimpleQueryObjectMatches();
}

uint64_t _MDSimpleQuerySetWidcardAttributes()
{
  return __MDSimpleQuerySetWidcardAttributes();
}

uint64_t _MDStoreOIDArrayAddOID()
{
  return __MDStoreOIDArrayAddOID();
}

uint64_t _MDStoreOIDArrayApplyBlock()
{
  return __MDStoreOIDArrayApplyBlock();
}

uint64_t _MDStoreOIDArrayBeginSequence()
{
  return __MDStoreOIDArrayBeginSequence();
}

uint64_t _MDStoreOIDArrayCreateMutable()
{
  return __MDStoreOIDArrayCreateMutable();
}

uint64_t _MDStoreOIDArrayEndSequence()
{
  return __MDStoreOIDArrayEndSequence();
}

uint64_t _MDStoreOIDArrayGetVectorCount()
{
  return __MDStoreOIDArrayGetVectorCount();
}

uint64_t _MDStringCopyAbbreviations()
{
  return __MDStringCopyAbbreviations();
}

uint64_t _MDStringPrefixOfString()
{
  return __MDStringPrefixOfString();
}

uint64_t _SIPriority()
{
  return __SIPriority();
}

uint64_t _SIProtectionClass()
{
  return __SIProtectionClass();
}

uint64_t _SISetKnownContactCounts()
{
  return __SISetKnownContactCounts();
}

uint64_t _SISetKnownContactEmailMapping()
{
  return __SISetKnownContactEmailMapping();
}

uint64_t _SISetMeEmailAddresses()
{
  return __SISetMeEmailAddresses();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __MDPlistBytesAddObject()
{
  return ___MDPlistBytesAddObject();
}

uint64_t __MDQueryParserCooldown()
{
  return ___MDQueryParserCooldown();
}

uint64_t __MDQueryParserPreheat()
{
  return ___MDQueryParserPreheat();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __memset_chk()
{
  return ___memset_chk();
}

uint64_t __strcpy_chk()
{
  return ___strcpy_chk();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint64_t analytics_send_event()
{
  return _analytics_send_event();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int close(int a1)
{
  return _close(a1);
}

int closedir(DIR *a1)
{
  return _closedir(a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_decode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_encode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

uint64_t createConsonantsStringForKorean()
{
  return _createConsonantsStringForKorean();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return _dispatch_get_current_queue();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return _dispatch_queue_attr_make_initially_inactive(attr);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

uint64_t dispatch_queue_attr_make_with_overcommit()
{
  return _dispatch_queue_attr_make_with_overcommit();
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

uint64_t getAppCorrectionIfAny()
{
  return _getAppCorrectionIfAny();
}

uint64_t get_thread_count()
{
  return _get_thread_count();
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t handleHiddenResult()
{
  return _handleHiddenResult();
}

uint64_t isImageOrVideoContentType()
{
  return _isImageOrVideoContentType();
}

uint64_t isMessagesAttachmentCoreSpotlightId()
{
  return _isMessagesAttachmentCoreSpotlightId();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

int killpg(pid_t a1, int a2)
{
  return _killpg(a1, a2);
}

uint64_t logForCSLogCategoryDefault()
{
  return _logForCSLogCategoryDefault();
}

uint64_t logForCSLogCategoryPersonalization()
{
  return _logForCSLogCategoryPersonalization();
}

uint64_t logForCSLogCategoryQuery()
{
  return _logForCSLogCategoryQuery();
}

uint64_t logForCSLogCategoryRecs()
{
  return _logForCSLogCategoryRecs();
}

uint64_t looksLikeURL()
{
  return _looksLikeURL();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_realloc(ptr, size, type_id);
}

uint64_t md_tracing_dispatch_async_propagating()
{
  return _md_tracing_dispatch_async_propagating();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
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

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return _opendir(a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return _pthread_mutex_destroy(a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return _pthread_mutex_init(a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return _pthread_mutex_lock(a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return _pthread_mutex_trylock(a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return _pthread_mutex_unlock(a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return _pthread_once(a1, a2);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

uint64_t rankingAttributeNameArray()
{
  return _rankingAttributeNameArray();
}

uint64_t rankingPrefetchedAttributesArray()
{
  return _rankingPrefetchedAttributesArray();
}

uint64_t ranking_index_score_init()
{
  return _ranking_index_score_init();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return _reallocf(__ptr, __size);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

uint64_t si_tracing_calc_next_spanid()
{
  return _si_tracing_calc_next_spanid();
}

uint64_t si_tracing_calc_traceid()
{
  return _si_tracing_calc_traceid();
}

uint64_t si_tracing_log_span_begin()
{
  return _si_tracing_log_span_begin();
}

uint64_t si_tracing_log_span_end()
{
  return _si_tracing_log_span_end();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return _strcpy(__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

uint64_t strippedURL()
{
  return _strippedURL();
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return _strndup(__s1, __n);
}

uint64_t tracing_dispatch_apply()
{
  return _tracing_dispatch_apply();
}

uint64_t tracing_dispatch_async()
{
  return _tracing_dispatch_async();
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
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

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

id objc_msgSend_L2FeatureVector(void *a1, const char *a2, ...)
{
  return [a1 L2FeatureVector];
}

id objc_msgSend_MCIsManaged(void *a1, const char *a2, ...)
{
  return [a1 MCIsManaged];
}

id objc_msgSend_PhotosRankingRequiredAttributes(void *a1, const char *a2, ...)
{
  return [a1 PhotosRankingRequiredAttributes];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__LSClearSchemaCaches(void *a1, const char *a2, ...)
{
  return [a1 _LSClearSchemaCaches];
}

id objc_msgSend__dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 _dictionaryRepresentation];
}

id objc_msgSend__filename(void *a1, const char *a2, ...)
{
  return [a1 _filename];
}

id objc_msgSend__loadFromPlist(void *a1, const char *a2, ...)
{
  return [a1 _loadFromPlist];
}

id objc_msgSend__trackingInfoDir(void *a1, const char *a2, ...)
{
  return [a1 _trackingInfoDir];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activated(void *a1, const char *a2, ...)
{
  return [a1 activated];
}

id objc_msgSend_additionalBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 additionalBundleIDs];
}

id objc_msgSend_allBundleIDsUsingPommesRanking(void *a1, const char *a2, ...)
{
  return [a1 allBundleIDsUsingPommesRanking];
}

id objc_msgSend_allBundleIDsUsingPommesRankingSearchTool(void *a1, const char *a2, ...)
{
  return [a1 allBundleIDsUsingPommesRankingSearchTool];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allLoadedAssets(void *a1, const char *a2, ...)
{
  return [a1 allLoadedAssets];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowAnonymousDataCollection(void *a1, const char *a2, ...)
{
  return [a1 allowAnonymousDataCollection];
}

id objc_msgSend_alternateNames(void *a1, const char *a2, ...)
{
  return [a1 alternateNames];
}

id objc_msgSend_alternativeURLs(void *a1, const char *a2, ...)
{
  return [a1 alternativeURLs];
}

id objc_msgSend_answerAttributes(void *a1, const char *a2, ...)
{
  return [a1 answerAttributes];
}

id objc_msgSend_appBlocklist(void *a1, const char *a2, ...)
{
  return [a1 appBlocklist];
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appBundleIdentifier];
}

id objc_msgSend_appGenreMap(void *a1, const char *a2, ...)
{
  return [a1 appGenreMap];
}

id objc_msgSend_appInFocusStream(void *a1, const char *a2, ...)
{
  return [a1 appInFocusStream];
}

id objc_msgSend_appMetadata(void *a1, const char *a2, ...)
{
  return [a1 appMetadata];
}

id objc_msgSend_applicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationBundleIdentifier];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_applicationsExcludedFromUninstall(void *a1, const char *a2, ...)
{
  return [a1 applicationsExcludedFromUninstall];
}

id objc_msgSend_applicationsWithContentHiddenFromSearch(void *a1, const char *a2, ...)
{
  return [a1 applicationsWithContentHiddenFromSearch];
}

id objc_msgSend_archiveBasePath(void *a1, const char *a2, ...)
{
  return [a1 archiveBasePath];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_artistName(void *a1, const char *a2, ...)
{
  return [a1 artistName];
}

id objc_msgSend_artworkURL(void *a1, const char *a2, ...)
{
  return [a1 artworkURL];
}

id objc_msgSend_attributeSetForApp(void *a1, const char *a2, ...)
{
  return [a1 attributeSetForApp];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return [a1 autoupdatingCurrentLocale];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_backUpFileProtectionClassCheck(void *a1, const char *a2, ...)
{
  return [a1 backUpFileProtectionClassCheck];
}

id objc_msgSend_backgroundWorkQueue(void *a1, const char *a2, ...)
{
  return [a1 backgroundWorkQueue];
}

id objc_msgSend_beginDictionary(void *a1, const char *a2, ...)
{
  return [a1 beginDictionary];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buddyScore(void *a1, const char *a2, ...)
{
  return [a1 buddyScore];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIDType(void *a1, const char *a2, ...)
{
  return [a1 bundleIDType];
}

id objc_msgSend_bundleIDs(void *a1, const char *a2, ...)
{
  return [a1 bundleIDs];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return [a1 canceled];
}

id objc_msgSend_cancelled(void *a1, const char *a2, ...)
{
  return [a1 cancelled];
}

id objc_msgSend_cannedCEPValues(void *a1, const char *a2, ...)
{
  return [a1 cannedCEPValues];
}

id objc_msgSend_card(void *a1, const char *a2, ...)
{
  return [a1 card];
}

id objc_msgSend_categoryEngagements(void *a1, const char *a2, ...)
{
  return [a1 categoryEngagements];
}

id objc_msgSend_cepDictionary(void *a1, const char *a2, ...)
{
  return [a1 cepDictionary];
}

id objc_msgSend_checkForRestoreFile(void *a1, const char *a2, ...)
{
  return [a1 checkForRestoreFile];
}

id objc_msgSend_checkMigrationComplete(void *a1, const char *a2, ...)
{
  return [a1 checkMigrationComplete];
}

id objc_msgSend_checkParsecState(void *a1, const char *a2, ...)
{
  return [a1 checkParsecState];
}

id objc_msgSend_cleanup(void *a1, const char *a2, ...)
{
  return [a1 cleanup];
}

id objc_msgSend_clearClientData(void *a1, const char *a2, ...)
{
  return [a1 clearClientData];
}

id objc_msgSend_clearDirtyState(void *a1, const char *a2, ...)
{
  return [a1 clearDirtyState];
}

id objc_msgSend_clearInput(void *a1, const char *a2, ...)
{
  return [a1 clearInput];
}

id objc_msgSend_clearResults(void *a1, const char *a2, ...)
{
  return [a1 clearResults];
}

id objc_msgSend_clearState(void *a1, const char *a2, ...)
{
  return [a1 clearState];
}

id objc_msgSend_clientBundleID(void *a1, const char *a2, ...)
{
  return [a1 clientBundleID];
}

id objc_msgSend_clientData(void *a1, const char *a2, ...)
{
  return [a1 clientData];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_collectionId(void *a1, const char *a2, ...)
{
  return [a1 collectionId];
}

id objc_msgSend_collectionName(void *a1, const char *a2, ...)
{
  return [a1 collectionName];
}

id objc_msgSend_command(void *a1, const char *a2, ...)
{
  return [a1 command];
}

id objc_msgSend_compactCard(void *a1, const char *a2, ...)
{
  return [a1 compactCard];
}

id objc_msgSend_compatibilityTitle(void *a1, const char *a2, ...)
{
  return [a1 compatibilityTitle];
}

id objc_msgSend_completedQuery(void *a1, const char *a2, ...)
{
  return [a1 completedQuery];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_completionString(void *a1, const char *a2, ...)
{
  return [a1 completionString];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return [a1 contact];
}

id objc_msgSend_contactIdentifier(void *a1, const char *a2, ...)
{
  return [a1 contactIdentifier];
}

id objc_msgSend_contactProperty(void *a1, const char *a2, ...)
{
  return [a1 contactProperty];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_contentCreationDate(void *a1, const char *a2, ...)
{
  return [a1 contentCreationDate];
}

id objc_msgSend_contentFilters(void *a1, const char *a2, ...)
{
  return [a1 contentFilters];
}

id objc_msgSend_contentType(void *a1, const char *a2, ...)
{
  return [a1 contentType];
}

id objc_msgSend_contentTypeTree(void *a1, const char *a2, ...)
{
  return [a1 contentTypeTree];
}

id objc_msgSend_contentURL(void *a1, const char *a2, ...)
{
  return [a1 contentURL];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyMatchInfo(void *a1, const char *a2, ...)
{
  return [a1 copyMatchInfo];
}

id objc_msgSend_copyRenderEngagementCounts(void *a1, const char *a2, ...)
{
  return [a1 copyRenderEngagementCounts];
}

id objc_msgSend_corrections(void *a1, const char *a2, ...)
{
  return [a1 corrections];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createRandomAESKey(void *a1, const char *a2, ...)
{
  return [a1 createRandomAESKey];
}

id objc_msgSend_currencyCacheLastRefreshDate(void *a1, const char *a2, ...)
{
  return [a1 currencyCacheLastRefreshDate];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentSearchString(void *a1, const char *a2, ...)
{
  return [a1 currentSearchString];
}

id objc_msgSend_currentTime(void *a1, const char *a2, ...)
{
  return [a1 currentTime];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataOwnerType(void *a1, const char *a2, ...)
{
  return [a1 dataOwnerType];
}

id objc_msgSend_dataclass(void *a1, const char *a2, ...)
{
  return [a1 dataclass];
}

id objc_msgSend_datastores(void *a1, const char *a2, ...)
{
  return [a1 datastores];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_deactivated(void *a1, const char *a2, ...)
{
  return [a1 deactivated];
}

id objc_msgSend_death(void *a1, const char *a2, ...)
{
  return [a1 death];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_defaultsCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultsCenter];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceAuthenticationState(void *a1, const char *a2, ...)
{
  return [a1 deviceAuthenticationState];
}

id objc_msgSend_dictionaries(void *a1, const char *a2, ...)
{
  return [a1 dictionaries];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didCreateKeychainItem(void *a1, const char *a2, ...)
{
  return [a1 didCreateKeychainItem];
}

id objc_msgSend_didReceiveCoreSpotlightProgress(void *a1, const char *a2, ...)
{
  return [a1 didReceiveCoreSpotlightProgress];
}

id objc_msgSend_disableAsTypedSuggestion(void *a1, const char *a2, ...)
{
  return [a1 disableAsTypedSuggestion];
}

id objc_msgSend_disableBundles(void *a1, const char *a2, ...)
{
  return [a1 disableBundles];
}

id objc_msgSend_disableNLP(void *a1, const char *a2, ...)
{
  return [a1 disableNLP];
}

id objc_msgSend_disableOCR(void *a1, const char *a2, ...)
{
  return [a1 disableOCR];
}

id objc_msgSend_disabledApps(void *a1, const char *a2, ...)
{
  return [a1 disabledApps];
}

id objc_msgSend_disabledBundles(void *a1, const char *a2, ...)
{
  return [a1 disabledBundles];
}

id objc_msgSend_disabledDomains(void *a1, const char *a2, ...)
{
  return [a1 disabledDomains];
}

id objc_msgSend_displayIdentifier(void *a1, const char *a2, ...)
{
  return [a1 displayIdentifier];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_documentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 documentIdentifier];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainIdentifier(void *a1, const char *a2, ...)
{
  return [a1 domainIdentifier];
}

id objc_msgSend_domainMap(void *a1, const char *a2, ...)
{
  return [a1 domainMap];
}

id objc_msgSend_dominantRankingQueryCount(void *a1, const char *a2, ...)
{
  return [a1 dominantRankingQueryCount];
}

id objc_msgSend_dominatedRankingQueryCount(void *a1, const char *a2, ...)
{
  return [a1 dominatedRankingQueryCount];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dumpTTRDebugFiles(void *a1, const char *a2, ...)
{
  return [a1 dumpTTRDebugFiles];
}

id objc_msgSend_eligibleForDemotion(void *a1, const char *a2, ...)
{
  return [a1 eligibleForDemotion];
}

id objc_msgSend_emailAddresses(void *a1, const char *a2, ...)
{
  return [a1 emailAddresses];
}

id objc_msgSend_embeddingSimilarity(void *a1, const char *a2, ...)
{
  return [a1 embeddingSimilarity];
}

id objc_msgSend_enableInstantAnswers(void *a1, const char *a2, ...)
{
  return [a1 enableInstantAnswers];
}

id objc_msgSend_enablePersonalAnswers(void *a1, const char *a2, ...)
{
  return [a1 enablePersonalAnswers];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_endDictionary(void *a1, const char *a2, ...)
{
  return [a1 endDictionary];
}

id objc_msgSend_engagementSignal(void *a1, const char *a2, ...)
{
  return [a1 engagementSignal];
}

id objc_msgSend_englishEmbedding(void *a1, const char *a2, ...)
{
  return [a1 englishEmbedding];
}

id objc_msgSend_entityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 entityIdentifier];
}

id objc_msgSend_entries(void *a1, const char *a2, ...)
{
  return [a1 entries];
}

id objc_msgSend_extensionContainingBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 extensionContainingBundleIdentifier];
}

id objc_msgSend_externalID(void *a1, const char *a2, ...)
{
  return [a1 externalID];
}

id objc_msgSend_externalIdentifier(void *a1, const char *a2, ...)
{
  return [a1 externalIdentifier];
}

id objc_msgSend_fbq(void *a1, const char *a2, ...)
{
  return [a1 fbq];
}

id objc_msgSend_feedbackData(void *a1, const char *a2, ...)
{
  return [a1 feedbackData];
}

id objc_msgSend_feedbackListener(void *a1, const char *a2, ...)
{
  return [a1 feedbackListener];
}

id objc_msgSend_feedbackListeners(void *a1, const char *a2, ...)
{
  return [a1 feedbackListeners];
}

id objc_msgSend_feedbackQueryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 feedbackQueryIdentifier];
}

id objc_msgSend_feedbackQueue(void *a1, const char *a2, ...)
{
  return [a1 feedbackQueue];
}

id objc_msgSend_fetchAttributes(void *a1, const char *a2, ...)
{
  return [a1 fetchAttributes];
}

id objc_msgSend_fetchDuetValues(void *a1, const char *a2, ...)
{
  return [a1 fetchDuetValues];
}

id objc_msgSend_fetchKeyFromKeychain(void *a1, const char *a2, ...)
{
  return [a1 fetchKeyFromKeychain];
}

id objc_msgSend_fetchL2Signals(void *a1, const char *a2, ...)
{
  return [a1 fetchL2Signals];
}

id objc_msgSend_fetchl2Signals(void *a1, const char *a2, ...)
{
  return [a1 fetchl2Signals];
}

id objc_msgSend_fileProviderDomainFilterQueries(void *a1, const char *a2, ...)
{
  return [a1 fileProviderDomainFilterQueries];
}

id objc_msgSend_fileProviderIdentifier(void *a1, const char *a2, ...)
{
  return [a1 fileProviderIdentifier];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_filterQueries(void *a1, const char *a2, ...)
{
  return [a1 filterQueries];
}

id objc_msgSend_filterTopHits(void *a1, const char *a2, ...)
{
  return [a1 filterTopHits];
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return [a1 finish];
}

id objc_msgSend_finished(void *a1, const char *a2, ...)
{
  return [a1 finished];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstUnlockQueue(void *a1, const char *a2, ...)
{
  return [a1 firstUnlockQueue];
}

id objc_msgSend_firstUnlockedInSB(void *a1, const char *a2, ...)
{
  return [a1 firstUnlockedInSB];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_footnote(void *a1, const char *a2, ...)
{
  return [a1 footnote];
}

id objc_msgSend_forceNoTopHit(void *a1, const char *a2, ...)
{
  return [a1 forceNoTopHit];
}

id objc_msgSend_formattedExpression(void *a1, const char *a2, ...)
{
  return [a1 formattedExpression];
}

id objc_msgSend_formattedResult(void *a1, const char *a2, ...)
{
  return [a1 formattedResult];
}

id objc_msgSend_formattedTextPieces(void *a1, const char *a2, ...)
{
  return [a1 formattedTextPieces];
}

id objc_msgSend_fuzzyMatchCheck(void *a1, const char *a2, ...)
{
  return [a1 fuzzyMatchCheck];
}

id objc_msgSend_fuzzyMatchMask(void *a1, const char *a2, ...)
{
  return [a1 fuzzyMatchMask];
}

id objc_msgSend_generateSuggestions(void *a1, const char *a2, ...)
{
  return [a1 generateSuggestions];
}

id objc_msgSend_genre(void *a1, const char *a2, ...)
{
  return [a1 genre];
}

id objc_msgSend_genreID(void *a1, const char *a2, ...)
{
  return [a1 genreID];
}

id objc_msgSend_geoUserSessionEntityString(void *a1, const char *a2, ...)
{
  return [a1 geoUserSessionEntityString];
}

id objc_msgSend_getBackUpFilePath(void *a1, const char *a2, ...)
{
  return [a1 getBackUpFilePath];
}

id objc_msgSend_getMeContactIdentifier(void *a1, const char *a2, ...)
{
  return [a1 getMeContactIdentifier];
}

id objc_msgSend_getMeEmailAddresses(void *a1, const char *a2, ...)
{
  return [a1 getMeEmailAddresses];
}

id objc_msgSend_getNetworkQuality(void *a1, const char *a2, ...)
{
  return [a1 getNetworkQuality];
}

id objc_msgSend_getSharedInstance(void *a1, const char *a2, ...)
{
  return [a1 getSharedInstance];
}

id objc_msgSend_getSuggestionsRankingThresholds(void *a1, const char *a2, ...)
{
  return [a1 getSuggestionsRankingThresholds];
}

id objc_msgSend_getTrimmedSearchString(void *a1, const char *a2, ...)
{
  return [a1 getTrimmedSearchString];
}

id objc_msgSend_hasAssociatedUserActivity(void *a1, const char *a2, ...)
{
  return [a1 hasAssociatedUserActivity];
}

id objc_msgSend_hasCommunicationContent(void *a1, const char *a2, ...)
{
  return [a1 hasCommunicationContent];
}

id objc_msgSend_hasDetail(void *a1, const char *a2, ...)
{
  return [a1 hasDetail];
}

id objc_msgSend_hasMarkedText(void *a1, const char *a2, ...)
{
  return [a1 hasMarkedText];
}

id objc_msgSend_hasTextContentMatch(void *a1, const char *a2, ...)
{
  return [a1 hasTextContentMatch];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hiddenApplications(void *a1, const char *a2, ...)
{
  return [a1 hiddenApplications];
}

id objc_msgSend_highMatchBit(void *a1, const char *a2, ...)
{
  return [a1 highMatchBit];
}

id objc_msgSend_highRecencyBit(void *a1, const char *a2, ...)
{
  return [a1 highRecencyBit];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_iTunesMetadata(void *a1, const char *a2, ...)
{
  return [a1 iTunesMetadata];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_incomingCount(void *a1, const char *a2, ...)
{
  return [a1 incomingCount];
}

id objc_msgSend_indexQueue(void *a1, const char *a2, ...)
{
  return [a1 indexQueue];
}

id objc_msgSend_indexScore(void *a1, const char *a2, ...)
{
  return [a1 indexScore];
}

id objc_msgSend_indexer(void *a1, const char *a2, ...)
{
  return [a1 indexer];
}

id objc_msgSend_infinitePatience(void *a1, const char *a2, ...)
{
  return [a1 infinitePatience];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return [a1 info];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_inlineCard(void *a1, const char *a2, ...)
{
  return [a1 inlineCard];
}

id objc_msgSend_inputValueAndUnit(void *a1, const char *a2, ...)
{
  return [a1 inputValueAndUnit];
}

id objc_msgSend_instantAnswersBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 instantAnswersBundleIDs];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interestingDate(void *a1, const char *a2, ...)
{
  return [a1 interestingDate];
}

id objc_msgSend_internal(void *a1, const char *a2, ...)
{
  return [a1 internal];
}

id objc_msgSend_internalDebug(void *a1, const char *a2, ...)
{
  return [a1 internalDebug];
}

id objc_msgSend_invalidateCacheForSearchContinuation(void *a1, const char *a2, ...)
{
  return [a1 invalidateCacheForSearchContinuation];
}

id objc_msgSend_invalidateHandler(void *a1, const char *a2, ...)
{
  return [a1 invalidateHandler];
}

id objc_msgSend_isAdvancedSyntax(void *a1, const char *a2, ...)
{
  return [a1 isAdvancedSyntax];
}

id objc_msgSend_isAppClip(void *a1, const char *a2, ...)
{
  return [a1 isAppClip];
}

id objc_msgSend_isAppEntitySearch(void *a1, const char *a2, ...)
{
  return [a1 isAppEntitySearch];
}

id objc_msgSend_isBookstoreEroticaAllowed(void *a1, const char *a2, ...)
{
  return [a1 isBookstoreEroticaAllowed];
}

id objc_msgSend_isBullseyeCommittedSearch(void *a1, const char *a2, ...)
{
  return [a1 isBullseyeCommittedSearch];
}

id objc_msgSend_isBullseyeNonCommittedSearch(void *a1, const char *a2, ...)
{
  return [a1 isBullseyeNonCommittedSearch];
}

id objc_msgSend_isCJK(void *a1, const char *a2, ...)
{
  return [a1 isCJK];
}

id objc_msgSend_isCommandEntitySearch(void *a1, const char *a2, ...)
{
  return [a1 isCommandEntitySearch];
}

id objc_msgSend_isContactEntitySearch(void *a1, const char *a2, ...)
{
  return [a1 isContactEntitySearch];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isEntitySearch(void *a1, const char *a2, ...)
{
  return [a1 isEntitySearch];
}

id objc_msgSend_isFuzzyMatch(void *a1, const char *a2, ...)
{
  return [a1 isFuzzyMatch];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isInternalDevice(void *a1, const char *a2, ...)
{
  return [a1 isInternalDevice];
}

id objc_msgSend_isLaunchProhibited(void *a1, const char *a2, ...)
{
  return [a1 isLaunchProhibited];
}

id objc_msgSend_isNLPEntitySearch(void *a1, const char *a2, ...)
{
  return [a1 isNLPEntitySearch];
}

id objc_msgSend_isNLPSearch(void *a1, const char *a2, ...)
{
  return [a1 isNLPSearch];
}

id objc_msgSend_isNLSearch(void *a1, const char *a2, ...)
{
  return [a1 isNLSearch];
}

id objc_msgSend_isPeopleSearch(void *a1, const char *a2, ...)
{
  return [a1 isPeopleSearch];
}

id objc_msgSend_isPhotosEntitySearch(void *a1, const char *a2, ...)
{
  return [a1 isPhotosEntitySearch];
}

id objc_msgSend_isPhotosSearch(void *a1, const char *a2, ...)
{
  return [a1 isPhotosSearch];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_isRewrite(void *a1, const char *a2, ...)
{
  return [a1 isRewrite];
}

id objc_msgSend_isScopedAppSearch(void *a1, const char *a2, ...)
{
  return [a1 isScopedAppSearch];
}

id objc_msgSend_isScopedSearch(void *a1, const char *a2, ...)
{
  return [a1 isScopedSearch];
}

id objc_msgSend_isServerAlternativeResult(void *a1, const char *a2, ...)
{
  return [a1 isServerAlternativeResult];
}

id objc_msgSend_isSpotlightInternetResultsAllowed(void *a1, const char *a2, ...)
{
  return [a1 isSpotlightInternetResultsAllowed];
}

id objc_msgSend_isTopHit(void *a1, const char *a2, ...)
{
  return [a1 isTopHit];
}

id objc_msgSend_isTrivial(void *a1, const char *a2, ...)
{
  return [a1 isTrivial];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isWebClip(void *a1, const char *a2, ...)
{
  return [a1 isWebClip];
}

id objc_msgSend_isWideScreen(void *a1, const char *a2, ...)
{
  return [a1 isWideScreen];
}

id objc_msgSend_itemIdentifier(void *a1, const char *a2, ...)
{
  return [a1 itemIdentifier];
}

id objc_msgSend_itemRanker(void *a1, const char *a2, ...)
{
  return [a1 itemRanker];
}

id objc_msgSend_job(void *a1, const char *a2, ...)
{
  return [a1 job];
}

id objc_msgSend_keepRunning(void *a1, const char *a2, ...)
{
  return [a1 keepRunning];
}

id objc_msgSend_keyboardLanguage(void *a1, const char *a2, ...)
{
  return [a1 keyboardLanguage];
}

id objc_msgSend_keyboardPrimaryLanguage(void *a1, const char *a2, ...)
{
  return [a1 keyboardPrimaryLanguage];
}

id objc_msgSend_keychainData(void *a1, const char *a2, ...)
{
  return [a1 keychainData];
}

id objc_msgSend_knowledgeStore(void *a1, const char *a2, ...)
{
  return [a1 knowledgeStore];
}

id objc_msgSend_l2Score(void *a1, const char *a2, ...)
{
  return [a1 l2Score];
}

id objc_msgSend_l2Signals(void *a1, const char *a2, ...)
{
  return [a1 l2Signals];
}

id objc_msgSend_l2score(void *a1, const char *a2, ...)
{
  return [a1 l2score];
}

id objc_msgSend_languageIdentifier(void *a1, const char *a2, ...)
{
  return [a1 languageIdentifier];
}

id objc_msgSend_languageModel(void *a1, const char *a2, ...)
{
  return [a1 languageModel];
}

id objc_msgSend_languages(void *a1, const char *a2, ...)
{
  return [a1 languages];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastUsedDate(void *a1, const char *a2, ...)
{
  return [a1 lastUsedDate];
}

id objc_msgSend_launchDates(void *a1, const char *a2, ...)
{
  return [a1 launchDates];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_likelihood(void *a1, const char *a2, ...)
{
  return [a1 likelihood];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_loadAllParameters(void *a1, const char *a2, ...)
{
  return [a1 loadAllParameters];
}

id objc_msgSend_loadTrialDataOnActivate(void *a1, const char *a2, ...)
{
  return [a1 loadTrialDataOnActivate];
}

id objc_msgSend_localResultQualityThreshold(void *a1, const char *a2, ...)
{
  return [a1 localResultQualityThreshold];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_localizedSubtitle(void *a1, const char *a2, ...)
{
  return [a1 localizedSubtitle];
}

id objc_msgSend_locked(void *a1, const char *a2, ...)
{
  return [a1 locked];
}

id objc_msgSend_lockedCx(void *a1, const char *a2, ...)
{
  return [a1 lockedCx];
}

id objc_msgSend_locking(void *a1, const char *a2, ...)
{
  return [a1 locking];
}

id objc_msgSend_lockingCx(void *a1, const char *a2, ...)
{
  return [a1 lockingCx];
}

id objc_msgSend_logValues(void *a1, const char *a2, ...)
{
  return [a1 logValues];
}

id objc_msgSend_longDisplayName(void *a1, const char *a2, ...)
{
  return [a1 longDisplayName];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_lookupDict(void *a1, const char *a2, ...)
{
  return [a1 lookupDict];
}

id objc_msgSend_lowMatchBit(void *a1, const char *a2, ...)
{
  return [a1 lowMatchBit];
}

id objc_msgSend_lowRecencyBit(void *a1, const char *a2, ...)
{
  return [a1 lowRecencyBit];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mapsParsecRanker(void *a1, const char *a2, ...)
{
  return [a1 mapsParsecRanker];
}

id objc_msgSend_markedTextArray(void *a1, const char *a2, ...)
{
  return [a1 markedTextArray];
}

id objc_msgSend_maxCount(void *a1, const char *a2, ...)
{
  return [a1 maxCount];
}

id objc_msgSend_maxInitiallyVisibleResults(void *a1, const char *a2, ...)
{
  return [a1 maxInitiallyVisibleResults];
}

id objc_msgSend_maxRankedResultCount(void *a1, const char *a2, ...)
{
  return [a1 maxRankedResultCount];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_metadataFilePath(void *a1, const char *a2, ...)
{
  return [a1 metadataFilePath];
}

id objc_msgSend_metadataFilePathOld(void *a1, const char *a2, ...)
{
  return [a1 metadataFilePathOld];
}

id objc_msgSend_metadataTokenPath(void *a1, const char *a2, ...)
{
  return [a1 metadataTokenPath];
}

id objc_msgSend_moreResultsPunchout(void *a1, const char *a2, ...)
{
  return [a1 moreResultsPunchout];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_mutableDeepCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableDeepCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_needsReRunForFuzzy(void *a1, const char *a2, ...)
{
  return [a1 needsReRunForFuzzy];
}

id objc_msgSend_needsReply(void *a1, const char *a2, ...)
{
  return [a1 needsReply];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_noTokenize(void *a1, const char *a2, ...)
{
  return [a1 noTokenize];
}

id objc_msgSend_normalizedSearchString(void *a1, const char *a2, ...)
{
  return [a1 normalizedSearchString];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_oid(void *a1, const char *a2, ...)
{
  return [a1 oid];
}

id objc_msgSend_originalL2Score(void *a1, const char *a2, ...)
{
  return [a1 originalL2Score];
}

id objc_msgSend_outgoingCount(void *a1, const char *a2, ...)
{
  return [a1 outgoingCount];
}

id objc_msgSend_parseUserQuery(void *a1, const char *a2, ...)
{
  return [a1 parseUserQuery];
}

id objc_msgSend_parsecAvailable(void *a1, const char *a2, ...)
{
  return [a1 parsecAvailable];
}

id objc_msgSend_parsecEnabled(void *a1, const char *a2, ...)
{
  return [a1 parsecEnabled];
}

id objc_msgSend_parsecQuery(void *a1, const char *a2, ...)
{
  return [a1 parsecQuery];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_perfDictionary(void *a1, const char *a2, ...)
{
  return [a1 perfDictionary];
}

id objc_msgSend_personIdentifier(void *a1, const char *a2, ...)
{
  return [a1 personIdentifier];
}

id objc_msgSend_personQueryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 personQueryIdentifier];
}

id objc_msgSend_personType(void *a1, const char *a2, ...)
{
  return [a1 personType];
}

id objc_msgSend_personalAnswerString(void *a1, const char *a2, ...)
{
  return [a1 personalAnswerString];
}

id objc_msgSend_photosExactMatch(void *a1, const char *a2, ...)
{
  return [a1 photosExactMatch];
}

id objc_msgSend_photosMatch(void *a1, const char *a2, ...)
{
  return [a1 photosMatch];
}

id objc_msgSend_placement(void *a1, const char *a2, ...)
{
  return [a1 placement];
}

id objc_msgSend_pommes(void *a1, const char *a2, ...)
{
  return [a1 pommes];
}

id objc_msgSend_pommesL1Score(void *a1, const char *a2, ...)
{
  return [a1 pommesL1Score];
}

id objc_msgSend_preferredBundleIDs(void *a1, const char *a2, ...)
{
  return [a1 preferredBundleIDs];
}

id objc_msgSend_preferredEmbedding(void *a1, const char *a2, ...)
{
  return [a1 preferredEmbedding];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_prefersLocalUserTypedSuggestion(void *a1, const char *a2, ...)
{
  return [a1 prefersLocalUserTypedSuggestion];
}

id objc_msgSend_preheat(void *a1, const char *a2, ...)
{
  return [a1 preheat];
}

id objc_msgSend_prepareCacheForSearchContinuation(void *a1, const char *a2, ...)
{
  return [a1 prepareCacheForSearchContinuation];
}

id objc_msgSend_previousQueryKind(void *a1, const char *a2, ...)
{
  return [a1 previousQueryKind];
}

id objc_msgSend_priorityIndexFinishedInTime(void *a1, const char *a2, ...)
{
  return [a1 priorityIndexFinishedInTime];
}

id objc_msgSend_privateKeyQuery(void *a1, const char *a2, ...)
{
  return [a1 privateKeyQuery];
}

id objc_msgSend_privateQuery(void *a1, const char *a2, ...)
{
  return [a1 privateQuery];
}

id objc_msgSend_promoteLocalResults(void *a1, const char *a2, ...)
{
  return [a1 promoteLocalResults];
}

id objc_msgSend_promoteParsecResults(void *a1, const char *a2, ...)
{
  return [a1 promoteParsecResults];
}

id objc_msgSend_protectionClass(void *a1, const char *a2, ...)
{
  return [a1 protectionClass];
}

id objc_msgSend_publiclyIndexable(void *a1, const char *a2, ...)
{
  return [a1 publiclyIndexable];
}

id objc_msgSend_punchout(void *a1, const char *a2, ...)
{
  return [a1 punchout];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_queryContext(void *a1, const char *a2, ...)
{
  return [a1 queryContext];
}

id objc_msgSend_queryEmbedding(void *a1, const char *a2, ...)
{
  return [a1 queryEmbedding];
}

id objc_msgSend_queryID(void *a1, const char *a2, ...)
{
  return [a1 queryID];
}

id objc_msgSend_queryId(void *a1, const char *a2, ...)
{
  return [a1 queryId];
}

id objc_msgSend_queryIdent(void *a1, const char *a2, ...)
{
  return [a1 queryIdent];
}

id objc_msgSend_queryKind(void *a1, const char *a2, ...)
{
  return [a1 queryKind];
}

id objc_msgSend_queryString(void *a1, const char *a2, ...)
{
  return [a1 queryString];
}

id objc_msgSend_querySuggestionResults(void *a1, const char *a2, ...)
{
  return [a1 querySuggestionResults];
}

id objc_msgSend_queryTermCount(void *a1, const char *a2, ...)
{
  return [a1 queryTermCount];
}

id objc_msgSend_queryTermLength(void *a1, const char *a2, ...)
{
  return [a1 queryTermLength];
}

id objc_msgSend_queryUnderstandingOutput(void *a1, const char *a2, ...)
{
  return [a1 queryUnderstandingOutput];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_rankQueue(void *a1, const char *a2, ...)
{
  return [a1 rankQueue];
}

id objc_msgSend_rankingBitCount(void *a1, const char *a2, ...)
{
  return [a1 rankingBitCount];
}

id objc_msgSend_rankingConfiguration(void *a1, const char *a2, ...)
{
  return [a1 rankingConfiguration];
}

id objc_msgSend_rankingInfo(void *a1, const char *a2, ...)
{
  return [a1 rankingInfo];
}

id objc_msgSend_rankingItem(void *a1, const char *a2, ...)
{
  return [a1 rankingItem];
}

id objc_msgSend_rankingQueries(void *a1, const char *a2, ...)
{
  return [a1 rankingQueries];
}

id objc_msgSend_rankingScore(void *a1, const char *a2, ...)
{
  return [a1 rankingScore];
}

id objc_msgSend_rawScore(void *a1, const char *a2, ...)
{
  return [a1 rawScore];
}

id objc_msgSend_ready(void *a1, const char *a2, ...)
{
  return [a1 ready];
}

id objc_msgSend_readyForQueries(void *a1, const char *a2, ...)
{
  return [a1 readyForQueries];
}

id objc_msgSend_refreshCache(void *a1, const char *a2, ...)
{
  return [a1 refreshCache];
}

id objc_msgSend_registerMessageHandlers(void *a1, const char *a2, ...)
{
  return [a1 registerMessageHandlers];
}

id objc_msgSend_registrationDate(void *a1, const char *a2, ...)
{
  return [a1 registrationDate];
}

id objc_msgSend_relatedBundleID(void *a1, const char *a2, ...)
{
  return [a1 relatedBundleID];
}

id objc_msgSend_relatedUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 relatedUniqueIdentifier];
}

id objc_msgSend_reloadRankingParametersFromTrial(void *a1, const char *a2, ...)
{
  return [a1 reloadRankingParametersFromTrial];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requiredAttributes(void *a1, const char *a2, ...)
{
  return [a1 requiredAttributes];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetVisibilityCounts(void *a1, const char *a2, ...)
{
  return [a1 resetVisibilityCounts];
}

id objc_msgSend_resultBundleId(void *a1, const char *a2, ...)
{
  return [a1 resultBundleId];
}

id objc_msgSend_resultPipe(void *a1, const char *a2, ...)
{
  return [a1 resultPipe];
}

id objc_msgSend_resultSet(void *a1, const char *a2, ...)
{
  return [a1 resultSet];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resultsCount(void *a1, const char *a2, ...)
{
  return [a1 resultsCount];
}

id objc_msgSend_resultsSections(void *a1, const char *a2, ...)
{
  return [a1 resultsSections];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeMigrationQueue(void *a1, const char *a2, ...)
{
  return [a1 resumeMigrationQueue];
}

id objc_msgSend_retrievalType(void *a1, const char *a2, ...)
{
  return [a1 retrievalType];
}

id objc_msgSend_rewriteContext(void *a1, const char *a2, ...)
{
  return [a1 rewriteContext];
}

id objc_msgSend_save(void *a1, const char *a2, ...)
{
  return [a1 save];
}

id objc_msgSend_scaleFactor(void *a1, const char *a2, ...)
{
  return [a1 scaleFactor];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_score(void *a1, const char *a2, ...)
{
  return [a1 score];
}

id objc_msgSend_scoreL1(void *a1, const char *a2, ...)
{
  return [a1 scoreL1];
}

id objc_msgSend_searchContinuationCompatibilitySet(void *a1, const char *a2, ...)
{
  return [a1 searchContinuationCompatibilitySet];
}

id objc_msgSend_searchDomains(void *a1, const char *a2, ...)
{
  return [a1 searchDomains];
}

id objc_msgSend_searchEntities(void *a1, const char *a2, ...)
{
  return [a1 searchEntities];
}

id objc_msgSend_searchQueryContext(void *a1, const char *a2, ...)
{
  return [a1 searchQueryContext];
}

id objc_msgSend_searchRenderTimeout(void *a1, const char *a2, ...)
{
  return [a1 searchRenderTimeout];
}

id objc_msgSend_searchString(void *a1, const char *a2, ...)
{
  return [a1 searchString];
}

id objc_msgSend_sectionBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sectionBundleIdentifier];
}

id objc_msgSend_sectionHeader(void *a1, const char *a2, ...)
{
  return [a1 sectionHeader];
}

id objc_msgSend_sendQueryCompleted(void *a1, const char *a2, ...)
{
  return [a1 sendQueryCompleted];
}

id objc_msgSend_serverRelevanceScoreThreshold(void *a1, const char *a2, ...)
{
  return [a1 serverRelevanceScoreThreshold];
}

id objc_msgSend_serverRelevanceScores(void *a1, const char *a2, ...)
{
  return [a1 serverRelevanceScores];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setupHandlers(void *a1, const char *a2, ...)
{
  return [a1 setupHandlers];
}

id objc_msgSend_setupSearchSession(void *a1, const char *a2, ...)
{
  return [a1 setupSearchSession];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedHandler(void *a1, const char *a2, ...)
{
  return [a1 sharedHandler];
}

id objc_msgSend_sharedIndexer(void *a1, const char *a2, ...)
{
  return [a1 sharedIndexer];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedLockHandler(void *a1, const char *a2, ...)
{
  return [a1 sharedLockHandler];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedModelManager(void *a1, const char *a2, ...)
{
  return [a1 sharedModelManager];
}

id objc_msgSend_sharedPommesRanker(void *a1, const char *a2, ...)
{
  return [a1 sharedPommesRanker];
}

id objc_msgSend_sharedProxy(void *a1, const char *a2, ...)
{
  return [a1 sharedProxy];
}

id objc_msgSend_sharedResourcesManager(void *a1, const char *a2, ...)
{
  return [a1 sharedResourcesManager];
}

id objc_msgSend_sharedStore(void *a1, const char *a2, ...)
{
  return [a1 sharedStore];
}

id objc_msgSend_sharedSuggestionsManager(void *a1, const char *a2, ...)
{
  return [a1 sharedSuggestionsManager];
}

id objc_msgSend_shortcutBit(void *a1, const char *a2, ...)
{
  return [a1 shortcutBit];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return [a1 shutdown];
}

id objc_msgSend_spotlightFilterQueries(void *a1, const char *a2, ...)
{
  return [a1 spotlightFilterQueries];
}

id objc_msgSend_spotlightQueryString(void *a1, const char *a2, ...)
{
  return [a1 spotlightQueryString];
}

id objc_msgSend_spotlightRankCategories(void *a1, const char *a2, ...)
{
  return [a1 spotlightRankCategories];
}

id objc_msgSend_spotlightRankTerms(void *a1, const char *a2, ...)
{
  return [a1 spotlightRankTerms];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startIndexer(void *a1, const char *a2, ...)
{
  return [a1 startIndexer];
}

id objc_msgSend_startListening(void *a1, const char *a2, ...)
{
  return [a1 startListening];
}

id objc_msgSend_startMonitoringEvents(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringEvents];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_storeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 storeIdentifier];
}

id objc_msgSend_storeStartTime(void *a1, const char *a2, ...)
{
  return [a1 storeStartTime];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringForDedupe(void *a1, const char *a2, ...)
{
  return [a1 stringForDedupe];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_strongRankingQueryCount(void *a1, const char *a2, ...)
{
  return [a1 strongRankingQueryCount];
}

id objc_msgSend_subgenres(void *a1, const char *a2, ...)
{
  return [a1 subgenres];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return [a1 subtitle];
}

id objc_msgSend_suggestion(void *a1, const char *a2, ...)
{
  return [a1 suggestion];
}

id objc_msgSend_suggestionResults(void *a1, const char *a2, ...)
{
  return [a1 suggestionResults];
}

id objc_msgSend_suggestions(void *a1, const char *a2, ...)
{
  return [a1 suggestions];
}

id objc_msgSend_suggestionsAreBlended(void *a1, const char *a2, ...)
{
  return [a1 suggestionsAreBlended];
}

id objc_msgSend_suggestionsRenderTimeout(void *a1, const char *a2, ...)
{
  return [a1 suggestionsRenderTimeout];
}

id objc_msgSend_supportedTypes(void *a1, const char *a2, ...)
{
  return [a1 supportedTypes];
}

id objc_msgSend_supportsSpotlightQueryContinuation(void *a1, const char *a2, ...)
{
  return [a1 supportsSpotlightQueryContinuation];
}

id objc_msgSend_suspendMigrationQueue(void *a1, const char *a2, ...)
{
  return [a1 suspendMigrationQueue];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemLocale(void *a1, const char *a2, ...)
{
  return [a1 systemLocale];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_threadId(void *a1, const char *a2, ...)
{
  return [a1 threadId];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeoutTimer(void *a1, const char *a2, ...)
{
  return [a1 timeoutTimer];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_tokenText(void *a1, const char *a2, ...)
{
  return [a1 tokenText];
}

id objc_msgSend_topHit(void *a1, const char *a2, ...)
{
  return [a1 topHit];
}

id objc_msgSend_trackExplicitness(void *a1, const char *a2, ...)
{
  return [a1 trackExplicitness];
}

id objc_msgSend_trackId(void *a1, const char *a2, ...)
{
  return [a1 trackId];
}

id objc_msgSend_trackName(void *a1, const char *a2, ...)
{
  return [a1 trackName];
}

id objc_msgSend_trackTimeMillis(void *a1, const char *a2, ...)
{
  return [a1 trackTimeMillis];
}

id objc_msgSend_triggerUpdate(void *a1, const char *a2, ...)
{
  return [a1 triggerUpdate];
}

id objc_msgSend_tryRestoreFromBackUp(void *a1, const char *a2, ...)
{
  return [a1 tryRestoreFromBackUp];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unitType(void *a1, const char *a2, ...)
{
  return [a1 unitType];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unlockAppUninstallMonitor(void *a1, const char *a2, ...)
{
  return [a1 unlockAppUninstallMonitor];
}

id objc_msgSend_unlockMigrationMonitor(void *a1, const char *a2, ...)
{
  return [a1 unlockMigrationMonitor];
}

id objc_msgSend_unlocked(void *a1, const char *a2, ...)
{
  return [a1 unlocked];
}

id objc_msgSend_unlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 unlockedSinceBoot];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_update(void *a1, const char *a2, ...)
{
  return [a1 update];
}

id objc_msgSend_updateFeedbackListeners(void *a1, const char *a2, ...)
{
  return [a1 updateFeedbackListeners];
}

id objc_msgSend_updateMailVIPList(void *a1, const char *a2, ...)
{
  return [a1 updateMailVIPList];
}

id objc_msgSend_updateParsecEnabled(void *a1, const char *a2, ...)
{
  return [a1 updateParsecEnabled];
}

id objc_msgSend_updatePhoneFavorites(void *a1, const char *a2, ...)
{
  return [a1 updatePhoneFavorites];
}

id objc_msgSend_upgradeCheck(void *a1, const char *a2, ...)
{
  return [a1 upgradeCheck];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_urls(void *a1, const char *a2, ...)
{
  return [a1 urls];
}

id objc_msgSend_userActivityRequiredString(void *a1, const char *a2, ...)
{
  return [a1 userActivityRequiredString];
}

id objc_msgSend_userActivityType(void *a1, const char *a2, ...)
{
  return [a1 userActivityType];
}

id objc_msgSend_userQuery(void *a1, const char *a2, ...)
{
  return [a1 userQuery];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_waitForQueryCorrections(void *a1, const char *a2, ...)
{
  return [a1 waitForQueryCorrections];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_whyQuery(void *a1, const char *a2, ...)
{
  return [a1 whyQuery];
}

id objc_msgSend_withinBundleScore(void *a1, const char *a2, ...)
{
  return [a1 withinBundleScore];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_writeToKeychain(void *a1, const char *a2, ...)
{
  return [a1 writeToKeychain];
}