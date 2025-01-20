void start()
{
  void *v0;
  os_log_t v1;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  PALServer *v6;
  PALAppUninstallObserver *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v1 = os_log_create("com.apple.PrivacyAccounting", "Daemon");
  v2 = (void *)qword_10001F218;
  qword_10001F218 = (uint64_t)v1;

  v3 = qword_10001F218;
  if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "privacyaccountingd launched", (uint8_t *)&v9, 2u);
  }
  v11 = 0;
  if (!vproc_swap_integer())
  {
    v4 = qword_10001F218;
    if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_INFO))
    {
      v9 = 134217984;
      v10 = v11;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "privacyaccountingd last exit status: %lld", (uint8_t *)&v9, 0xCu);
    }
  }
  sub_100001CB4();
  v5 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.privacyaccountingd"];
  v6 = [[PALServer alloc] initWithListener:v5 maxStoreSize:104857600];
  v7 = objc_alloc_init(PALAppUninstallObserver);
  [(PALServer *)v6 observeAppUninstallsWithAppUninstallObserver:v7];

  sub_100001D7C();
  sub_100001D94(v6);
  sub_100001E2C(v6);
  v8 = [(PALServer *)v6 listener];
  [v8 resume];

  sub_100001F44();
  dispatch_main();
}

size_t sub_100001CB4()
{
  bzero(v2, 0x400uLL);
  [@"com.apple.privacyaccountingd" UTF8String];
  if ((_set_user_dir_suffix() & 1) == 0) {
    sub_10000E420();
  }
  *__error() = 0;
  size_t result = confstr(65537, v2, 0x400uLL);
  if (result - 1025 <= 0xFFFFFFFFFFFFFBFFLL)
  {
    v1 = (void *)qword_10001F218;
    if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_ERROR)) {
      sub_10000E388(v1);
    }
    _os_crash();
    __break(1u);
  }
  return result;
}

void sub_100001D7C()
{
}

void sub_100001D94(void *a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000021D4;
  handler[3] = &unk_1000186C0;
  id v3 = a1;
  id v1 = v3;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, handler);
}

void sub_100001E2C(void *a1)
{
  id v1 = a1;
  v2 = off_10001EDE8;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100002444;
  handler[3] = &unk_1000186C0;
  id v3 = v1;
  id v9 = v3;
  xpc_activity_register(v2, XPC_ACTIVITY_CHECK_IN, handler);
  v4 = off_10001EDF0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000260C;
  v6[3] = &unk_1000186C0;
  id v7 = v3;
  id v5 = v3;
  xpc_activity_register(v4, XPC_ACTIVITY_CHECK_IN, v6);
}

void sub_100001F44()
{
  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  id v1 = (void *)qword_10001F220;
  qword_10001F220 = (uint64_t)v0;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10001F220, &stru_100018778);
  v2 = qword_10001F220;

  dispatch_activate(v2);
}

void sub_100001FBC(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
    if (string)
    {
      v4 = string;
      int v5 = strcmp(string, "com.apple.LaunchServices.applicationUnregistered");
      v6 = qword_10001F218;
      if (v5)
      {
        if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_ERROR)) {
          sub_10000E550();
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_INFO))
        {
          int v13 = 136446210;
          v14 = v4;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Received distributed notification via XPC event: %{public}s", (uint8_t *)&v13, 0xCu);
        }
        id v7 = xpc_dictionary_get_value(v2, "UserInfo");
        v8 = v7;
        if (v7 && xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary)
        {
          id v9 = (void *)_CFXPCCreateCFObjectFromXPCObject();
          if (v9)
          {
            v10 = +[NSNotificationCenter defaultCenter];
            v11 = +[NSString stringWithUTF8String:v4];
            [v10 postNotificationName:v11 object:0 userInfo:v9];
          }
          else
          {
            v12 = qword_10001F218;
            if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_ERROR)) {
              sub_10000E50C(v12);
            }
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_ERROR))
        {
          sub_10000E4A4();
        }
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_ERROR))
    {
      sub_10000E43C();
    }
  }
}

void sub_1000021D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
    if (string)
    {
      if (!strcmp(string, "com.apple.Preferences.ResetPrivacyWarningsNotification"))
      {
        if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_DEBUG)) {
          sub_10000E620();
        }
        v9[0] = 0;
        v9[1] = v9;
        v9[2] = 0x3032000000;
        v9[3] = sub_1000023D8;
        v9[4] = sub_1000023E8;
        id v10 = (id)os_transaction_create();
        objc_initWeak(&location, *(id *)(a1 + 32));
        int v5 = [*(id *)(a1 + 32) queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000023F0;
        block[3] = &unk_100018698;
        objc_copyWeak(&v7, &location);
        block[4] = v9;
        dispatch_async(v5, block);

        objc_destroyWeak(&v7);
        objc_destroyWeak(&location);
        _Block_object_dispose(v9, 8);
      }
      else if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_ERROR))
      {
        sub_10000E694();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_ERROR))
    {
      sub_10000E5B8();
    }
  }
}

void sub_1000023B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
}

uint64_t sub_1000023D8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000023E8(uint64_t a1)
{
}

void sub_1000023F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained disableLogging];

  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void sub_100002444(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  v6 = qword_10001F218;
  if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v13 = 136315394;
    *(void *)&v13[4] = off_10001EDE8;
    *(_WORD *)&v13[12] = 2048;
    *(void *)&v13[14] = state;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "XPC activity triggered: name=%s, state=%ld", v13, 0x16u);
  }
  if (state == 2)
  {
    id v7 = *(id *)(a1 + 32);
    v8 = v3;
    if (!xpc_activity_set_state(v8, 4))
    {
      id v9 = (void *)qword_10001F218;
      if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_ERROR)) {
        sub_10000E6FC((uint64_t)v8, v9);
      }
    }
    id v10 = [v7 queue];
    *(void *)int v13 = _NSConcreteStackBlock;
    *(void *)&v13[8] = 3221225472;
    *(void *)&v13[16] = sub_1000027D4;
    v14 = &unk_100018710;
    v15 = v8;
    id v16 = v7;
    v11 = v8;
    id v12 = v7;
    dispatch_async(v10, v13);
  }
}

void sub_10000260C(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  v6 = qword_10001F218;
  if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v13 = 136315394;
    *(void *)&v13[4] = off_10001EDF0;
    *(_WORD *)&v13[12] = 2048;
    *(void *)&v13[14] = state;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "XPC activity triggered: name=%s, state=%ld", v13, 0x16u);
  }
  if (state == 2)
  {
    id v7 = *(id *)(a1 + 32);
    v8 = v3;
    if (!xpc_activity_set_state(v8, 4))
    {
      id v9 = (void *)qword_10001F218;
      if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_ERROR)) {
        sub_10000E6FC((uint64_t)v8, v9);
      }
    }
    id v10 = [v7 queue];
    *(void *)int v13 = _NSConcreteStackBlock;
    *(void *)&v13[8] = 3221225472;
    *(void *)&v13[16] = sub_1000029F8;
    v14 = &unk_100018710;
    v15 = v8;
    id v16 = v7;
    v11 = v8;
    id v12 = v7;
    dispatch_async(v10, v13);
  }
}

void sub_1000027D4(uint64_t a1)
{
  CFAbsoluteTime v2 = CFAbsoluteTimeGetCurrent() + -604800.0;
  id v3 = [objc_alloc((Class)PAXPCActivityCancellationToken) initWithActivity:*(void *)(a1 + 32)];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000028A8;
  v5[3] = &unk_1000186E8;
  v4 = *(void **)(a1 + 40);
  id v6 = *(id *)(a1 + 32);
  [v4 pruneEventsFromStartTime:v3 toEndTime:v5 withCancellationToken:0.0 completion:v2];
}

void sub_1000028A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_ERROR)) {
      sub_10000E87C();
    }
    int v5 = *(_xpc_activity_s **)(a1 + 32);
    uint64_t v4 = a1 + 32;
    BOOL v6 = xpc_activity_set_state(v5, 3);
    id v7 = qword_10001F218;
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_INFO))
      {
        int v11 = 136315138;
        id v12 = off_10001EDE8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "XPC activity deferred: name=%s", (uint8_t *)&v11, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_ERROR))
    {
      sub_10000E7FC(v4, v7);
    }
  }
  else
  {
    id v9 = *(_xpc_activity_s **)(a1 + 32);
    uint64_t v8 = a1 + 32;
    if (!xpc_activity_set_state(v9, 5))
    {
      id v10 = (void *)qword_10001F218;
      if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_ERROR)) {
        sub_10000E77C(v8, v10);
      }
    }
  }
}

void sub_1000029F8(uint64_t a1)
{
  id v2 = [objc_alloc((Class)PAXPCActivityCancellationToken) initWithActivity:*(void *)(a1 + 32)];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100002AAC;
  v4[3] = &unk_100018738;
  id v3 = *(void **)(a1 + 40);
  id v5 = *(id *)(a1 + 32);
  [v3 gatherAndSendDailyAnalyticsWithCancellationToken:v2 completion:v4];
}

void sub_100002AAC(uint64_t a1, int a2)
{
  if (a2) {
    uint64_t v2 = 5;
  }
  else {
    uint64_t v2 = 3;
  }
  id v3 = (_xpc_activity_s **)(a1 + 32);
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), v2))
  {
    uint64_t v4 = (void *)qword_10001F218;
    if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_ERROR)) {
      sub_10000E8E4(v3, v4, v2);
    }
  }
}

void sub_100002B20(id a1)
{
  id v1 = qword_10001F218;
  if (os_log_type_enabled((os_log_t)qword_10001F218, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Received signal SIGTERM. Will terminate when clean.", v2, 2u);
  }
  xpc_transaction_exit_clean();
}

void sub_100002BA0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002BBC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

xpc_activity_state_t sub_100002BE8()
{
  return xpc_activity_get_state(v0);
}

id sub_100002E50()
{
  if (qword_10001F230 != -1) {
    dispatch_once(&qword_10001F230, &stru_100018798);
  }
  dispatch_source_t v0 = (void *)qword_10001F228;

  return v0;
}

void sub_100003014(id a1)
{
  qword_10001F228 = (uint64_t)os_log_create("com.apple.PrivacyAccounting", "PALApplicationMetadataResolver");

  _objc_release_x1();
}

void sub_100003070()
{
  sub_100003058();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Can't resolve accessor=%{public}@ using LS record=%@ without bundle ID", v1, 0x16u);
}

void sub_1000030E8(void *a1, uint64_t a2, NSObject *a3)
{
  id v5 = [a1 accessor];
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Resolved application metadata for accessor: %{public}@ -> %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_100003198()
{
  sub_100003058();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Dropping incoming access=%@ with LS record=%@", v1, 0x16u);
}

void sub_100003CC0(id a1)
{
  uint64_t v1 = +[NSMutableDictionary dictionary];
  uint64_t v2 = (void *)qword_10001F238;
  qword_10001F238 = v1;

  id v3 = +[PAApplication applicationWithPath:@"/System/Library/CoreServices/AegirProxyApp.app/AegirProxyApp"];
  uint64_t v4 = (void *)qword_10001F238;
  id v5 = sub_100003DB8(@"com.apple.NanoUniverse.AegirProxyApp");
  [v4 setObject:v3 forKeyedSubscript:v5];

  id v8 = +[PAApplication applicationWithPath:@"/Applications/Sidecar.app/Sidecar"];
  int v6 = (void *)qword_10001F238;
  id v7 = sub_100003DB8(@"com.apple.sidecar");
  [v6 setObject:v8 forKeyedSubscript:v7];
}

PALResolvedAccessorCacheKey *sub_100003DB8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [PALResolvedAccessorCacheKey alloc];
  id v3 = +[PAApplication applicationWithBundleID:v1];

  uint64_t v4 = [(PALResolvedAccessorCacheKey *)v2 initWithAccessor:v3 clientProvidedIdentity:0];

  return v4;
}

void sub_100003E40(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100003E60(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  int v6 = [a3 accessor];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Dropping incoming access=%@ with accessor=%{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_100003F20(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 accessor];
  sub_100002BDC();
  sub_100003E40((void *)&_mh_execute_header, v5, v6, "Got negative cache result for accessor: %{public}@", v7, v8, v9, v10, v11);
}

void sub_100003FB4()
{
  sub_100002BDC();
  sub_100002BA0((void *)&_mh_execute_header, v0, v1, "Failed to attribute %@", v2, v3, v4, v5, v6);
}

void sub_10000401C()
{
  sub_100002BDC();
  sub_100002BA0((void *)&_mh_execute_header, v0, v1, "Can't attribute audit token accessor for %@", v2, v3, v4, v5, v6);
}

void sub_100004084(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 accessor];
  sub_100002BDC();
  sub_100003E40((void *)&_mh_execute_header, v5, v6, "Got positive cache result for accessor: %{public}@", v7, v8, v9, v10, v11);
}

void sub_100004118(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 accessor];
  v5[0] = 67109378;
  v5[1] = [v4 insecureProcessIdentifier];
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Couldn't look up audit token for PID %d for microphone access %{public}@", (uint8_t *)v5, 0x12u);
}

void sub_1000041D8()
{
  sub_100002BDC();
  sub_100002BA0((void *)&_mh_execute_header, v0, v1, "Can't attribute PID accessor for non-microphone access %@", v2, v3, v4, v5, v6);
}

void sub_100004240()
{
  sub_100002BDC();
  sub_100002BA0((void *)&_mh_execute_header, v0, v1, "Can't attribute PID accessor for %@", v2, v3, v4, v5, v6);
}

BOOL PALMetricDataReductionTestString(void *a1, void *a2, unint64_t a3)
{
  id v5 = a1;
  uint8_t v6 = [a2 dataUsingEncoding:4];
  BOOL v7 = PALMetricDataReductionTestData(v5, v6, a3);

  return v7;
}

BOOL PALMetricDataReductionTestData(void *a1, void *a2, unint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (a3)
  {
    if (a3 <= 0x40)
    {
      memset(&v11, 0, sizeof(v11));
      CC_SHA256_Init(&v11);
      id v8 = v5;
      CC_SHA256_Update(&v11, [v8 bytes], (CC_LONG)objc_msgSend(v8, "length"));
      id v9 = v6;
      CC_SHA256_Update(&v11, [v9 bytes], (CC_LONG)objc_msgSend(v9, "length"));
      CC_SHA256_Final(md, &v11);
      BOOL v7 = bswap64(*(unint64_t *)md) >> -(char)a3 == 0;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

void sub_100004704(id a1)
{
  qword_10001F248 = objc_opt_new();

  _objc_release_x1();
}

id sub_100004A90()
{
  if (qword_10001F260 != -1) {
    dispatch_once(&qword_10001F260, &stru_1000187F8);
  }
  os_log_t v0 = (void *)qword_10001F258;

  return v0;
}

void sub_100004F60(id a1)
{
  qword_10001F258 = (uint64_t)os_log_create("com.apple.PrivacyAccounting", "PALSettings");

  _objc_release_x1();
}

void sub_100004FA4(id a1)
{
  uint64_t v1 = +[NSMutableSet set];
  uint64_t v2 = (void *)qword_10001F268;
  qword_10001F268 = v1;

  if ((_os_feature_enabled_impl() & 1) == 0) {
    [(id)qword_10001F268 addObject:PAAccessCategoryCalendar];
  }
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    uint64_t v3 = (void *)qword_10001F268;
    uint64_t v4 = PAAccessCategoryUserTracking;
    [v3 addObject:v4];
  }
}

void sub_100005068(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100005088()
{
  sub_100005050();
  sub_100005068((void *)&_mh_execute_header, v0, v1, "Failed to load settings from %{public}@ with error %{public}@");
}

void sub_1000050F0()
{
  sub_100005050();
  sub_100005068((void *)&_mh_execute_header, v0, v1, "Failed to remove migrated settings plist %{public}@: %{public}@");
}

void sub_100005158(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Settings plist not found at %{public}@, nothing to migrate.", (uint8_t *)&v2, 0xCu);
}

void sub_1000051D0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Failed to generate salt for metric collection.  Got return code %d", (uint8_t *)v2, 8u);
}

id sub_1000055C0()
{
  if (qword_10001F280 != -1) {
    dispatch_once(&qword_10001F280, &stru_100018838);
  }
  uint64_t v0 = (void *)qword_10001F278;

  return v0;
}

void sub_1000056E8(id a1)
{
  qword_10001F278 = (uint64_t)os_log_create("com.apple.PrivacyAccounting", "PALPaths");

  _objc_release_x1();
}

void sub_10000572C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create essential directory", v1, 2u);
}

void sub_100005770(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a2;
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Creating directory %{public}@ failed with error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_1000057FC(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 biomeDirectory];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Removing directory %{public}@ failed with error: %{public}@", (uint8_t *)&v6, 0x16u);
}

void sub_100005D54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, os_unfair_lock_t lock)
{
}

void sub_100005D80(uint64_t a1)
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
      int v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * (void)v6);
        __int16 v8 = objc_msgSend(*(id *)(a1 + 40), "delegate", (void)v9);
        [v8 applicationDidUninstall:v7];

        int v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void sub_100006120(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Didn't get bundleIDs in user info dictionary: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100006198()
{
}

void sub_1000065CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000065F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006600(uint64_t a1)
{
}

void sub_100006608(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 state])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    uint64_t v3 = [v6 error];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

uint64_t sub_100006680(uint64_t a1, void *a2)
{
  id v3 = a2;
  unsigned int v5 = [*(id *)(a1 + 32) cancelled];
  if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v6 = +[NSError errorWithDomain:@"PAErrorDomain" code:15 userInfo:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    __int16 v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    [*(id *)(a1 + 40) updateWithEvent:v3];
  }

  return v5 ^ 1;
}

void sub_100006908(id a1)
{
  os_log_t v1 = (void *)qword_10001F290;
  qword_10001F290 = (uint64_t)&off_1000198F0;
}

void sub_100006C58()
{
  sub_100003058();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to initialize application for access %@ with TCC subject identity: %@", v1, 0x16u);
}

void sub_100006CD0()
{
  sub_100003058();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Attributed access %@ to identity %@", v1, 0x16u);
}

void sub_100007538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007568(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finalizeAllAccessIntervalsAndRemoveSession:0];
}

void sub_1000075AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained finalizeAllAccessIntervalsAndRemoveSession:1];
}

void sub_100007BB4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007BD4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007BE4(uint64_t a1)
{
}

void sub_100007BEC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v12 = v4;
  unsigned int v5 = [v12 domain];
  unsigned int v6 = [v5 isEqualToString:@"PAErrorDomain"];

  uint64_t v7 = v12;
  if (!v6) {
    goto LABEL_8;
  }
  id v8 = [v12 code];
  if (v8 == (id)2) {
    goto LABEL_5;
  }
  if (v8 == (id)12)
  {
    int v9 = PAErrorBoolValueForUserInfoKey();

    if (!v9) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  uint64_t v7 = v12;
  if (v8 == (id)9)
  {
LABEL_5:

LABEL_7:
    uint64_t v7 = [*(id *)(a1 + 32) connection];
    [v7 invalidate];
  }
LABEL_8:

LABEL_9:
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = 0;
}

void sub_100007CF8(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v14 = 0;
  unsigned int v4 = [v2 logAccess:v3 error:&v14];
  id v5 = v14;
  if (v4)
  {
    unsigned int v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
LABEL_6:
    v6();
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 40) kind] != (id)2)
  {
    unsigned int v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_6;
  }
  uint64_t v7 = [*(id *)(a1 + 48) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007E44;
  block[3] = &unk_100018920;
  int8x16_t v9 = *(int8x16_t *)(a1 + 40);
  id v8 = (id)v9.i64[0];
  int8x16_t v11 = vextq_s8(v9, v9, 8uLL);
  id v13 = *(id *)(a1 + 56);
  id v12 = v5;
  dispatch_async(v7, block);

LABEL_7:
}

uint64_t sub_100007E44(uint64_t a1)
{
  [*(id *)(a1 + 32) stopTrackingIntervalForAccess:*(void *)(a1 + 40)];
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v2();
}

void sub_100008014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000802C(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 enableLogging];
  }
  else {
    [v3 disableLogging];
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

void sub_1000081B8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) settings];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, [v2 loggingEnabled]);
}

void sub_1000083F4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000840C(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) settings];
  unsigned __int8 v4 = [v3 loggingEnabled];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) storeConfig];
    id v6 = [v5 datastorePath];
    [v6 UTF8String];
    long long v7 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)buf = *(_OWORD *)(a1 + 64);
    long long v29 = v7;
    id v8 = (const char *)sandbox_extension_issue_file_to_process();

    int8x16_t v9 = [*(id *)(a1 + 40) log];
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int8x16_t v11 = [*v2 storeConfig];
        id v12 = [v11 datastorePath];
        *(_DWORD *)buf = 138543362;
        *(void *)&buf[4] = v12;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Issuing sandbox extension to reader for path %{public}@", buf, 0xCu);
      }
      id v13 = [objc_alloc((Class)NSData) initWithBytesNoCopy:v8 length:strlen(v8) + 1 freeWhenDone:1];
      uint64_t v14 = *(void *)(a1 + 48);
      uint64_t v15 = [*(id *)(a1 + 32) storeConfig];
      id v16 = [v15 datastorePath];
      (*(void (**)(uint64_t, void, id, void *))(v14 + 16))(v14, 0, v13, v16);

      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = 0;
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10000A510(v2, v10);
      }

      uint64_t v20 = *(void *)(a1 + 48);
      NSErrorUserInfoKey v26 = NSLocalizedDescriptionKey;
      v21 = __error();
      v22 = +[NSString stringWithUTF8String:strerror(*v21)];
      v27 = v22;
      v23 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      v24 = +[NSError errorWithDomain:@"PAErrorDomain" code:7 userInfo:v23];
      (*(void (**)(uint64_t, void *, void, void))(v20 + 16))(v20, v24, 0, 0);
    }
  }
  else
  {
    uint64_t v19 = *(void *)(a1 + 48);
    id v25 = +[NSError errorWithDomain:@"PAErrorDomain" code:2 userInfo:0];
    (*(void (**)(uint64_t))(v19 + 16))(v19);
  }
}

uint64_t sub_1000088A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  switch(v2)
  {
    case 3:
      uint64_t v3 = [*(id *)(a1 + 32) settings];
      unsigned __int8 v4 = v3;
      uint64_t v5 = 2;
      break;
    case 2:
      uint64_t v3 = [*(id *)(a1 + 32) settings];
      unsigned __int8 v4 = v3;
      uint64_t v5 = 1;
      break;
    case 1:
      uint64_t v3 = [*(id *)(a1 + 32) settings];
      unsigned __int8 v4 = v3;
      uint64_t v5 = 0;
      break;
    default:
      goto LABEL_8;
  }
  [v3 setAccessFilteringPolicy:v5];

LABEL_8:
  uint64_t v6 = *(void *)(a1 + 56);
  long long v7 = [*(id *)(a1 + 32) settings];
  [v7 setLoggingOptions:v6];

  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v8();
}

id sub_100008ACC(uint64_t a1)
{
  return [*(id *)(a1 + 32) exportToFileHandle:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

id sub_10000921C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) accessorResolver];
  uint64_t v3 = [v2 applicationMetadataResolver];
  unsigned __int8 v4 = [*(id *)(a1 + 40) accessor];
  uint64_t v5 = [v3 bundleRecordForApplication:v4];

  v23 = (void *)v5;
  uint64_t IsVisibleApplication = PABundleRecordIsVisibleApplication();
  v24[0] = @"duration";
  v22 = +[NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v25[0] = v22;
  v24[1] = @"category";
  v21 = [*(id *)(a1 + 40) category];
  v25[1] = v21;
  v24[2] = @"identityType";
  uint64_t v20 = [*(id *)(a1 + 40) accessor];
  [v20 identifierType];
  long long v7 = PAApplicationIdentifierTypeToString();
  v25[2] = v7;
  v24[3] = @"identity";
  id v8 = [*(id *)(a1 + 40) accessor];
  uint64_t v9 = [v8 descriptionForIdentifier];
  uint64_t v10 = (void *)v9;
  CFStringRef v11 = &stru_100019400;
  if (v9) {
    CFStringRef v11 = (const __CFString *)v9;
  }
  v25[3] = v11;
  v24[4] = @"isInstalled";
  id v12 = +[NSNumber numberWithBool:v5 != 0];
  v25[4] = v12;
  v24[5] = @"isVisible";
  id v13 = +[NSNumber numberWithBool:IsVisibleApplication];
  v25[5] = v13;
  v24[6] = @"unknownAssetCount";
  uint64_t v14 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  v25[6] = v14;
  v24[7] = @"backgroundAssetCount";
  uint64_t v15 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  v25[7] = v15;
  v24[8] = @"foregroundAssetCount";
  id v16 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  v25[8] = v16;
  v24[9] = @"usingEventCountProxy";
  uint64_t v17 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 80)];
  v25[9] = v17;
  v18 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:10];

  return v18;
}

void sub_10000967C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009694(uint64_t a1)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v15;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "access", (void)v14);
        id v8 = [v7 asIntervalEndEventWithTimestampAdjustment:0.0];

        if ((*(unsigned char *)(a1 + 64) & 1) != 0
          && [v8 supportsSameMinuteAccessCountLogging]
          && ![v8 accessCount])
        {
          [v8 setAccessCount:1];
        }
        [*(id *)(a1 + 40) logAccess:v8 error:0];
      }
      id v4 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v4);
  }

  if (*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 40) removeSession:*(void *)(a1 + 48)];
  }
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "delegate", (void)v14);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    CFStringRef v11 = [*(id *)(a1 + 40) delegate];
    [v11 server:*(void *)(a1 + 40) didFinalizeAllAccessIntervalsForSession:*(void *)(a1 + 48)];
  }
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
}

id sub_100009D6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) pruneEventsFromStartTime:0 toEndTime:*(void *)(a1 + 40) withCancellationToken:*(double *)(a1 + 48) completion:*(double *)(a1 + 56)];
}

void sub_10000A294(id a1)
{
  v3[0] = kTCCServiceMediaLibrary;
  v3[1] = kTCCServicePhotos;
  v3[2] = kTCCServiceAddressBook;
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:3];
  id v2 = (void *)qword_10001F2A0;
  qword_10001F2A0 = v1;
}

void sub_10000A330(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000A358()
{
  sub_100002BDC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Can't end interval for access=%@; not ongoing",
    v1,
    0xCu);
}

void sub_10000A3CC()
{
  sub_100002BDC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Can't begin interval for access=%@; already ongoing",
    v1,
    0xCu);
}

void sub_10000A440()
{
  sub_10000A34C();
  sub_10000A330((void *)&_mh_execute_header, v0, v1, "Sender doesn't hold write entitlement", v2, v3, v4, v5, v6);
}

void sub_10000A474()
{
  sub_10000A34C();
  sub_10000A330((void *)&_mh_execute_header, v0, v1, "Sender doesn't hold toggle entitlement", v2, v3, v4, v5, v6);
}

void sub_10000A4A8()
{
  sub_10000A34C();
  sub_10000A330((void *)&_mh_execute_header, v0, v1, "Missing toggle entitlement; telling sender logging is disabled",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10000A4DC()
{
  sub_10000A34C();
  sub_10000A330((void *)&_mh_execute_header, v0, v1, "Sender doesn't hold read entitlement", v2, v3, v4, v5, v6);
}

void sub_10000A510(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 storeConfig];
  uint64_t v4 = [v3 datastorePath];
  int v5 = *__error();
  int v6 = 138543618;
  long long v7 = v4;
  __int16 v8 = 1024;
  int v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to issue sandbox extension token for path %{public}@, error=%{darwin.errno}d", (uint8_t *)&v6, 0x12u);
}

void sub_10000A5D8()
{
  sub_10000A34C();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "Missing entitlement for changing testing settings", v1, 2u);
}

void sub_10000A618()
{
  sub_10000A34C();
  sub_10000A330((void *)&_mh_execute_header, v0, v1, "Can't request export from process without read entitlement", v2, v3, v4, v5, v6);
}

void sub_10000A64C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 accessor];
  [v4 identifierType];
  sub_100002BDC();
  __int16 v6 = 2112;
  long long v7 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Unexpected application type: %ld for access %@", v5, 0x16u);
}

void sub_10000A708(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 identifier];
  sub_100002BDC();
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Tracking access interval %{public}@", v5, 0xCu);
}

void sub_10000A7AC()
{
  sub_100002BDC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Stopping tracking access interval %{public}@", v1, 0xCu);
}

void sub_10000A820()
{
  sub_10000A34C();
  sub_10000A330((void *)&_mh_execute_header, v0, v1, "Sender doesn't hold prune entitlement", v2, v3, v4, v5, v6);
}

id sub_10000AC50(void *a1, uint64_t a2)
{
  uint64_t v2 = [a1 valueForEntitlement:a2];
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v3 = [v2 BOOLValue];
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void sub_10000B074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B090(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained preflight];
}

int64_t sub_10000B514(id a1, BMStoreEvent *a2, BMStoreEvent *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  [(BMStoreEvent *)v4 timestamp];
  double v7 = v6;
  [(BMStoreEvent *)v5 timestamp];
  if (v7 <= v8)
  {
    [(BMStoreEvent *)v4 timestamp];
    double v11 = v10;
    [(BMStoreEvent *)v5 timestamp];
    if (v11 >= v12) {
      int64_t v9 = 0;
    }
    else {
      int64_t v9 = -1;
    }
  }
  else
  {
    int64_t v9 = 1;
  }

  return v9;
}

void sub_10000B780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10000B7B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    uint64_t v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000DEE4(v3, v4);
    }
  }
}

void sub_10000B814(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000DFE4();
  }

  uint64_t v5 = [v3 access];
  double v6 = [v5 asIntervalEndEventWithTimestampAdjustment:0.0];

  double v7 = *(void **)(a1 + 32);
  id v12 = 0;
  unsigned int v8 = [v7 logAccess:v6 error:&v12];
  id v9 = v12;
  if (v8)
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  else
  {
    double v10 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000DF78();
    }
  }
  [v3 startTime];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v11;
}

id sub_10000BC90(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopTrackingAllAccessIntervals];
}

void sub_10000C504(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setPredicates:*(void *)(a1 + 32)];
  uint64_t v4 = +[RBSProcessStateDescriptor descriptor];
  [v4 setValues:1];
  [v3 setStateDescriptor:v4];
  objc_initWeak(&location, *(id *)(a1 + 40));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  _DWORD v5[2] = sub_10000C60C;
  v5[3] = &unk_100018B60;
  objc_copyWeak(&v6, &location);
  [v3 setUpdateHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void sub_10000C5F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C60C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  unsigned int v8 = [v6 previousState];
  id v9 = [v6 state];

  [WeakRetained process:v7 didUpdateFromPreviousState:v8 toState:v9];
}

void sub_10000C7B4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = +[NSMutableArray array];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v4 = WeakRetained[3];
    id v5 = [v4 countByEnumeratingWithState:&v36 objects:v45 count:16];
    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = *(void *)v37;
      *(void *)&long long v6 = 138412546;
      long long v27 = v6;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v37 != v8) {
            objc_enumerationMutation(v4);
          }
          double v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "connection", v27);
          id v12 = v11;
          if (v11)
          {
            [v11 auditToken];
          }
          else
          {
            long long v34 = 0u;
            long long v35 = 0u;
          }
          uint64_t v13 = *(void **)(a1 + 32);
          if (v13)
          {
            [v13 auditToken];
          }
          else
          {
            long long v32 = 0u;
            long long v33 = 0u;
          }
          BOOL v17 = (void)v34 != (void)v32
             || *((void *)&v34 + 1) != *((void *)&v32 + 1)
             || (void)v35 != (void)v33
             || *((void *)&v35 + 1) != *((void *)&v33 + 1);

          if (!v17)
          {
            v18 = [WeakRetained log];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              uint64_t v19 = [v10 connection];
              uint64_t v20 = *(void *)(a1 + 32);
              *(_DWORD *)buf = v27;
              v42 = v19;
              __int16 v43 = 2112;
              uint64_t v44 = v20;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Invalidating connection=%@ for suspended process=%@", buf, 0x16u);
            }
            [v3 addObject:v10];
          }
        }
        id v7 = [v4 countByEnumeratingWithState:&v36 objects:v45 count:16];
      }
      while (v7);
    }

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v21 = v3;
    id v22 = [v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(v21);
          }
          NSErrorUserInfoKey v26 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)j) connection];
          [v26 invalidate];
        }
        id v23 = [v21 countByEnumeratingWithState:&v28 objects:v40 count:16];
      }
      while (v23);
    }
  }
}

void sub_10000D05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
}

uint64_t sub_10000D0B8(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (![*(id *)(a1 + 32) cancelled])
  {
    if (![*(id *)(a1 + 40) evaluateWithObject:v5])
    {
      uint64_t v7 = 0;
      goto LABEL_11;
    }
    uint64_t v8 = [v5 eventBody];
    id v9 = [v8 kind];

    if (v9 == (id)3)
    {
      uint64_t v13 = *(void **)(a1 + 48);
      uint64_t v11 = [v5 eventBody];
      id v12 = [v11 identifier];
      [v13 removeObject:v12];
    }
    else
    {
      if (v9 != (id)2)
      {
LABEL_10:
        ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        uint64_t v7 = 1;
        goto LABEL_11;
      }
      double v10 = *(void **)(a1 + 48);
      uint64_t v11 = [v5 eventBody];
      id v12 = [v11 identifier];
      [v10 addObject:v12];
    }

    goto LABEL_10;
  }
  uint64_t v7 = 0;
  *a3 = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
LABEL_11:

  return v7;
}

id sub_10000D1F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopTrackingAccessIntervalsWithIdentifiers:*(void *)(a1 + 40)];
}

void sub_10000D474(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10000E184(a1);
    }
  }
}

void sub_10000D700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D720(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000D730(uint64_t a1)
{
}

id sub_10000D738(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) bundleRecordForApplication:a2];
}

void sub_10000D744(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 32);
  [*(id *)(a1 + 32) fileDescriptor];
  id v3 = (void *)_CFWriteStreamCreateFromFileDescriptor();
  id v4 = v3;
  if (v3)
  {
    [v3 open];
    uint64_t v5 = *(void *)(a1 + 48);
    id v19 = 0;
    unsigned __int8 v6 = +[PAAccessReader exportFromPublisher:v5 toStream:v4 error:&v19];
    id v7 = v19;
    [v4 close];
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      uint64_t v8 = *(void *)(*(void *)(a1 + 64) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = 0;
    }
    else
    {
      v18 = [*(id *)(a1 + 40) log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10000E268(v2);
      }

      (*(void (**)(void, id))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v7);
    }
  }
  else
  {
    double v10 = [*(id *)(a1 + 40) log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000E1F8((uint64_t)v2, v10, v11, v12, v13, v14, v15, v16);
    }

    uint64_t v17 = *(void *)(a1 + 56);
    id v7 = +[NSError errorWithDomain:NSCocoaErrorDomain code:512 userInfo:0];
    (*(void (**)(uint64_t, id))(v17 + 16))(v17, v7);
  }
}

void sub_10000DA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DA8C(uint64_t a1)
{
  uint64_t v2 = [PALAnalytics alloc];
  id v3 = [*(id *)(a1 + 32) settings];
  id v4 = [(PALAnalytics *)v2 initWithSettings:v3];

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v16 = 0;
  BOOL v7 = [(PALAnalytics *)v4 updateWithPublisher:v5 cancellationToken:v6 error:&v16];
  id v8 = v16;
  id v9 = [*(id *)(a1 + 32) log];
  double v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Gathered daily analytics=%{public}@", buf, 0xCu);
    }

    uint64_t v15 = v4;
    AnalyticsSendEventLazy();
    double v10 = v15;
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    sub_10000E320();
  }

  (*(void (**)(void, BOOL, uint64_t, uint64_t))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56), v7, v11, v12);
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;
}

id sub_10000DC54(uint64_t a1)
{
  return [*(id *)(a1 + 32) eventPayload];
}

void sub_10000DE50(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000DE6C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Device locked; failed to register for lock state change notifications with code=%u",
    (uint8_t *)v2,
    8u);
}

void sub_10000DEE4(void *a1, NSObject *a2)
{
  id v3 = [a1 error];
  sub_100002BDC();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to finalize incomplete accesses; error= %{public}@",
    v4,
    0xCu);
}

void sub_10000DF78()
{
  sub_100002BDC();
  sub_10000DE40();
  sub_100005068((void *)&_mh_execute_header, v0, v1, "Failed to finalize incomplete access; access=%@, error=%{public}@");
}

void sub_10000DFE4()
{
  sub_100002BDC();
  sub_10000DE50((void *)&_mh_execute_header, v0, v1, "Finalizing incomplete access interval; record=%@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10000E04C()
{
  sub_100002BDC();
  sub_10000DE50((void *)&_mh_execute_header, v0, v1, "Logged access event: event=%@", v2, v3, v4, v5, v6);
}

void sub_10000E0B4()
{
  sub_100002BDC();
  sub_100002BA0((void *)&_mh_execute_header, v0, v1, "Logging disabled, ignoring incoming access=%@", v2, v3, v4, v5, v6);
}

void sub_10000E11C()
{
  sub_100002BDC();
  sub_10000DE50((void *)&_mh_execute_header, v0, v1, "Couldn't run preflight yet; rejecting new connection=%@",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10000E184(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 40);
  sub_10000DE40();
  sub_100005068((void *)&_mh_execute_header, v1, v2, "Failed to prune events for uninstalled application %{public}@ with error: %{public}@", (void)v3, DWORD2(v3));
}

void sub_10000E1F8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002BA0((void *)&_mh_execute_header, a2, a3, "Failed to create export file stream=%@", a5, a6, a7, a8, 2u);
}

void sub_10000E268(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  sub_10000DE40();
  sub_100005068((void *)&_mh_execute_header, v1, v2, "Failed to export to file=%@ with error=%{public}@", (void)v3, DWORD2(v3));
}

void sub_10000E2DC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Not gathering analytics; event unused",
    v1,
    2u);
}

void sub_10000E320()
{
  sub_100002BDC();
  sub_100002BA0((void *)&_mh_execute_header, v0, v1, "Failed to collect daily analytics with error=%{public}@", v2, v3, v4, v5, v6);
}

void sub_10000E388(void *a1)
{
  uint64_t v1 = a1;
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Failed to initialize temp directory: %{darwin.errno}d", (uint8_t *)v3, 8u);
}

void sub_10000E420()
{
}

void sub_10000E43C()
{
  sub_100002BDC();
  sub_100002BA0((void *)&_mh_execute_header, v0, v1, "Didn't get distributed notification name for event: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000E4A4()
{
  sub_100002BDC();
  sub_100002BA0((void *)&_mh_execute_header, v0, v1, "Didn't get user info dictionary for event: %@", v2, v3, v4, v5, v6);
}

void sub_10000E50C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to convert user info XPC dictionary to CF dictionary", v1, 2u);
}

void sub_10000E550()
{
  sub_100002BDC();
  sub_100002BA0((void *)&_mh_execute_header, v0, v1, "Received unexpected distributed notification via XPC event: %{public}s", v2, v3, v4, v5, v6);
}

void sub_10000E5B8()
{
  sub_100002BDC();
  sub_100002BA0((void *)&_mh_execute_header, v0, v1, "Missing name for event: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000E620()
{
  sub_100002BDC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Received notifyd notification: %{public}s", v1, 0xCu);
}

void sub_10000E694()
{
  sub_100002BDC();
  sub_100002BA0((void *)&_mh_execute_header, v0, v1, "Received unexpected XPC event: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10000E6FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_100002BE8();
  sub_100002B88();
  sub_100002BBC((void *)&_mh_execute_header, v4, v5, "Failed to mark XPC activity %{public}@ as continue; current state: %lu",
    v6,
    v7,
    v8,
    v9,
    v10);
}

void sub_10000E77C(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_100002BE8();
  sub_100002B88();
  sub_100002BBC((void *)&_mh_execute_header, v4, v5, "Failed to mark XPC activity %{public}@ as done; current state: %lu",
    v6,
    v7,
    v8,
    v9,
    v10);
}

void sub_10000E7FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_100002BE8();
  sub_100002B88();
  sub_100002BBC((void *)&_mh_execute_header, v4, v5, "Failed to defer XPC activity for activity %{public}@; current state: %lu",
    v6,
    v7,
    v8,
    v9,
    v10);
}

void sub_10000E87C()
{
  sub_100002BDC();
  sub_100002BA0((void *)&_mh_execute_header, v0, v1, "Failed to prune events for XPC activity with error: %{public}@; deferring activity",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_10000E8E4(_xpc_activity_s **a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a2;
  int v6 = 138543874;
  uint64_t v7 = v4;
  __int16 v8 = 2048;
  uint64_t v9 = a3;
  __int16 v10 = 2048;
  xpc_activity_state_t state = xpc_activity_get_state(v4);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to mark XPC activity %{public}@ as %lu; current state: %lu",
    (uint8_t *)&v6,
    0x20u);
}

uint64_t AnalyticsIsEventUsed()
{
  return _AnalyticsIsEventUsed();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t PAApplicationIdentifierTypeToString()
{
  return _PAApplicationIdentifierTypeToString();
}

uint64_t PAAuthenticatedClientIdentity()
{
  return _PAAuthenticatedClientIdentity();
}

uint64_t PABundleRecordIsVisibleApplication()
{
  return _PABundleRecordIsVisibleApplication();
}

uint64_t PADefaultBundleRecordRetriever()
{
  return _PADefaultBundleRecordRetriever();
}

uint64_t PAErrorBoolValueForUserInfoKey()
{
  return _PAErrorBoolValueForUserInfoKey();
}

uint64_t PARegisterUserInfoValueProviderForPAErrorDomain()
{
  return _PARegisterUserInfoValueProviderForPAErrorDomain();
}

uint64_t PASharedProcessStateMonitor()
{
  return _PASharedProcessStateMonitor();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFPreferencesSetBackupDisabled()
{
  return __CFPreferencesSetBackupDisabled();
}

uint64_t _CFWriteStreamCreateFromFileDescriptor()
{
  return __CFWriteStreamCreateFromFileDescriptor();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _NSIsNSNumber()
{
  return __NSIsNSNumber();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_crash()
{
  return __os_crash();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return _sandbox_extension_issue_file_to_process();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return _task_name_for_pid(target_tport, pid, tn);
}

uint64_t tcc_object_copy_description()
{
  return _tcc_object_copy_description();
}

uint64_t vproc_swap_integer()
{
  return _vproc_swap_integer();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_access(void *a1, const char *a2, ...)
{
  return [a1 access];
}

id objc_msgSend_accessCount(void *a1, const char *a2, ...)
{
  return [a1 accessCount];
}

id objc_msgSend_accessFilteringPolicy(void *a1, const char *a2, ...)
{
  return [a1 accessFilteringPolicy];
}

id objc_msgSend_accessor(void *a1, const char *a2, ...)
{
  return [a1 accessor];
}

id objc_msgSend_accessorResolver(void *a1, const char *a2, ...)
{
  return [a1 accessorResolver];
}

id objc_msgSend_aggregateVisibilityStateMonitor(void *a1, const char *a2, ...)
{
  return [a1 aggregateVisibilityStateMonitor];
}

id objc_msgSend_allAccessClasses(void *a1, const char *a2, ...)
{
  return [a1 allAccessClasses];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allStreams(void *a1, const char *a2, ...)
{
  return [a1 allStreams];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_applicationForCurrentProcess(void *a1, const char *a2, ...)
{
  return [a1 applicationForCurrentProcess];
}

id objc_msgSend_applicationMetadataResolver(void *a1, const char *a2, ...)
{
  return [a1 applicationMetadataResolver];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetIdentifierHashesByVisibilityState(void *a1, const char *a2, ...)
{
  return [a1 assetIdentifierHashesByVisibilityState];
}

id objc_msgSend_assetIdentifierPool(void *a1, const char *a2, ...)
{
  return [a1 assetIdentifierPool];
}

id objc_msgSend_assetIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 assetIdentifiers];
}

id objc_msgSend_assetIdentifiersPersistenceEnabled(void *a1, const char *a2, ...)
{
  return [a1 assetIdentifiersPersistenceEnabled];
}

id objc_msgSend_assumedIdentity(void *a1, const char *a2, ...)
{
  return [a1 assumedIdentity];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_biomeDirectory(void *a1, const char *a2, ...)
{
  return [a1 biomeDirectory];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bridgedAssumedIdentity(void *a1, const char *a2, ...)
{
  return [a1 bridgedAssumedIdentity];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleRecordRetriever(void *a1, const char *a2, ...)
{
  return [a1 bundleRecordRetriever];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancelled(void *a1, const char *a2, ...)
{
  return [a1 cancelled];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_datastorePath(void *a1, const char *a2, ...)
{
  return [a1 datastorePath];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultLoggingOptions(void *a1, const char *a2, ...)
{
  return [a1 defaultLoggingOptions];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultRootDirectory(void *a1, const char *a2, ...)
{
  return [a1 defaultRootDirectory];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptionForIdentifier(void *a1, const char *a2, ...)
{
  return [a1 descriptionForIdentifier];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_developerType(void *a1, const char *a2, ...)
{
  return [a1 developerType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableLogging(void *a1, const char *a2, ...)
{
  return [a1 disableLogging];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_drainPool(void *a1, const char *a2, ...)
{
  return [a1 drainPool];
}

id objc_msgSend_eligibleForMetricCollection(void *a1, const char *a2, ...)
{
  return [a1 eligibleForMetricCollection];
}

id objc_msgSend_enableLogging(void *a1, const char *a2, ...)
{
  return [a1 enableLogging];
}

id objc_msgSend_enablementChangedNotificationName(void *a1, const char *a2, ...)
{
  return [a1 enablementChangedNotificationName];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return [a1 eventBody];
}

id objc_msgSend_eventBodyData(void *a1, const char *a2, ...)
{
  return [a1 eventBodyData];
}

id objc_msgSend_eventCount(void *a1, const char *a2, ...)
{
  return [a1 eventCount];
}

id objc_msgSend_eventCountByVisibilityState(void *a1, const char *a2, ...)
{
  return [a1 eventCountByVisibilityState];
}

id objc_msgSend_eventPayload(void *a1, const char *a2, ...)
{
  return [a1 eventPayload];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierType(void *a1, const char *a2, ...)
{
  return [a1 identifierType];
}

id objc_msgSend_identity(void *a1, const char *a2, ...)
{
  return [a1 identity];
}

id objc_msgSend_insecureProcessIdentifier(void *a1, const char *a2, ...)
{
  return [a1 insecureProcessIdentifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intervalMetricDifficulty(void *a1, const char *a2, ...)
{
  return [a1 intervalMetricDifficulty];
}

id objc_msgSend_intervalSinceStart(void *a1, const char *a2, ...)
{
  return [a1 intervalSinceStart];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isDeviceUnlocked(void *a1, const char *a2, ...)
{
  return [a1 isDeviceUnlocked];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_lastPreflightCheck(void *a1, const char *a2, ...)
{
  return [a1 lastPreflightCheck];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_loggingEnabled(void *a1, const char *a2, ...)
{
  return [a1 loggingEnabled];
}

id objc_msgSend_loggingOptions(void *a1, const char *a2, ...)
{
  return [a1 loggingOptions];
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return [a1 monitor];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_preflight(void *a1, const char *a2, ...)
{
  return [a1 preflight];
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return [a1 previousState];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_removeBiomeDirectory(void *a1, const char *a2, ...)
{
  return [a1 removeBiomeDirectory];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rootDirectory(void *a1, const char *a2, ...)
{
  return [a1 rootDirectory];
}

id objc_msgSend_saltForMetricsReduction(void *a1, const char *a2, ...)
{
  return [a1 saltForMetricsReduction];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_settingsFile(void *a1, const char *a2, ...)
{
  return [a1 settingsFile];
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return [a1 sharedSettings];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_startObserving(void *a1, const char *a2, ...)
{
  return [a1 startObserving];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stopObserving(void *a1, const char *a2, ...)
{
  return [a1 stopObserving];
}

id objc_msgSend_stopTrackingAllAccessIntervals(void *a1, const char *a2, ...)
{
  return [a1 stopTrackingAllAccessIntervals];
}

id objc_msgSend_storeConfig(void *a1, const char *a2, ...)
{
  return [a1 storeConfig];
}

id objc_msgSend_supportsSameMinuteAccessCountLogging(void *a1, const char *a2, ...)
{
  return [a1 supportsSameMinuteAccessCountLogging];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return [a1 taskState];
}

id objc_msgSend_tccService(void *a1, const char *a2, ...)
{
  return [a1 tccService];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_visibilityState(void *a1, const char *a2, ...)
{
  return [a1 visibilityState];
}