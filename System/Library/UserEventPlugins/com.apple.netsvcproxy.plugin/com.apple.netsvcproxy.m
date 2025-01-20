id nplog_obj()
{
  void *v0;
  uint64_t vars8;

  if (qword_17E40 != -1) {
    dispatch_once(&qword_17E40, &stru_149C0);
  }
  v0 = (void *)qword_17E38;

  return v0;
}

void sub_2E5C(id a1)
{
  id v3 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
  uint64_t v1 = +[NSURLSession sessionWithConfiguration:v3];
  v2 = (void *)qword_17DF0;
  qword_17DF0 = v1;
}

void enable_timestamps(char a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_5EA0;
  block[3] = &unk_14798;
  char v2 = a1;
  if (qword_17E00 != -1) {
    dispatch_once(&qword_17E00, block);
  }
}

void sub_5EA0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    if (mach_timebase_info((mach_timebase_info_t)&dword_17E08))
    {
      uint64_t v1 = nplog_obj();
      if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
        sub_B98C(v1);
      }
    }
    else
    {
      g_recordTimestamps = 1;
    }
  }
}

double get_interval_for_mach_times(unint64_t a1, unint64_t a2, double a3, double a4, double a5)
{
  double result = 0.0;
  if (a2 > a1)
  {
    if (g_recordTimestamps)
    {
      LODWORD(a4) = dword_17E08;
      LODWORD(a5) = *(_DWORD *)algn_17E0C;
      return (double)(a2 - a1) * (double)*(unint64_t *)&a4 / (double)*(unint64_t *)&a5 / 1000000.0;
    }
  }
  return result;
}

void *create_timestamps()
{
  if (!g_recordTimestamps) {
    return 0;
  }
  double result = malloc_type_malloc(0x78uLL, 0x100004000313F17uLL);
  if (result)
  {
    result[14] = 0;
    *((_OWORD *)result + 5) = 0u;
    *((_OWORD *)result + 6) = 0u;
    *((_OWORD *)result + 3) = 0u;
    *((_OWORD *)result + 4) = 0u;
    *((_OWORD *)result + 1) = 0u;
    *((_OWORD *)result + 2) = 0u;
    *(_OWORD *)double result = 0u;
  }
  return result;
}

id NPGetInternalQueue()
{
  if (qword_17E18 != -1) {
    dispatch_once(&qword_17E18, &stru_147B8);
  }
  v0 = (void *)qword_17E10;

  return v0;
}

void sub_6004(id a1)
{
  qword_17E10 = (uint64_t)dispatch_queue_create("NetworkServiceProxy internal queue", 0);

  _objc_release_x1();
}

id get_nsdata_from_xpc_object(void *a1, const char *a2)
{
  char v2 = xpc_dictionary_get_value(a1, a2);
  id v3 = v2;
  if (v2 && xpc_get_type(v2) == (xpc_type_t)&_xpc_type_data) {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    v4 = 0;
  }

  return v4;
}

id get_nsdictionary_from_xpc_object(void *a1, const char *a2)
{
  char v2 = xpc_dictionary_get_value(a1, a2);
  id v3 = v2;
  if (v2 && xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary) {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    v4 = 0;
  }

  return v4;
}

id get_nsarray_from_xpc_object(void *a1, const char *a2)
{
  char v2 = xpc_dictionary_get_value(a1, a2);
  id v3 = v2;
  if (v2 && xpc_get_type(v2) == (xpc_type_t)&_xpc_type_array) {
    v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    v4 = 0;
  }

  return v4;
}

id sub_6B48(uint64_t a1, const void *a2, unint64_t a3, uint64_t a4)
{
  self;
  if (!a2)
  {
    v8 = 0;
    goto LABEL_10;
  }
  if (a3 >= 4 && a4 == 2)
  {
    int v7 = 2;
LABEL_9:
    inet_ntop(v7, a2, v10, 0x40u);
    v8 = +[NSString stringWithUTF8String:v10];
    goto LABEL_10;
  }
  v8 = 0;
  if (a3 >= 0x10 && a4 == 30)
  {
    int v7 = 30;
    goto LABEL_9;
  }
LABEL_10:

  return v8;
}

id sub_6C20(uint64_t a1, unint64_t a2)
{
  self;
  if (a2 <= 0x20)
  {
    int __b = 0;
    if (a2 >= 8)
    {
      unint64_t v4 = a2 >> 3;
      memset(&__b, 255, a2 >> 3);
    }
    else
    {
      unint64_t v4 = 0;
    }
    if ((a2 & 7) != 0) {
      *((unsigned char *)&__b + v4) = 0xFF00u >> (a2 & 7);
    }
    id v3 = sub_6B48((uint64_t)NPUtilities, &__b, 4uLL, 2);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

id sub_6CC8(uint64_t a1, unint64_t a2)
{
  self;
  unint64_t v3 = 0;
  v6[0] = 0;
  v6[1] = 0;
  if (a2 >= 8)
  {
    unint64_t v3 = a2 >> 3;
    memset(v6, 255, a2 >> 3);
  }
  if ((a2 & 7) != 0) {
    *((unsigned char *)v6 + v3) = 0xFF00u >> (a2 & 7);
  }
  unint64_t v4 = sub_6B48((uint64_t)NPUtilities, v6, 0x10uLL, 30);

  return v4;
}

void sub_6F84(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_6FBC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_7064(uint64_t a1)
{
  if (MKBDeviceUnlockedSinceBoot())
  {
    if (([*(id *)(a1 + 32) didInitialLaunch] & 1) == 0)
    {
      [*(id *)(a1 + 32) setDidInitialLaunch:1];
      char v2 = *(void **)(a1 + 32);
      [v2 launchOwner];
    }
  }
  else
  {
    int out_token = -1;
    unint64_t v3 = dispatch_get_global_queue(0, 0);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    void v6[2] = sub_71C4;
    v6[3] = &unk_14908;
    v6[4] = *(void *)(a1 + 32);
    uint32_t v4 = notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v3, v6);

    if (v4)
    {
      v5 = nplog_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_BB40(v5);
      }
    }
    else if (MKBDeviceUnlockedSinceBoot())
    {
      notify_cancel(out_token);
      if (([*(id *)(a1 + 32) didInitialLaunch] & 1) == 0)
      {
        [*(id *)(a1 + 32) setDidInitialLaunch:1];
        [*(id *)(a1 + 32) launchOwner];
      }
    }
  }
}

id sub_71C4(uint64_t a1)
{
  char v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Received first unlock notification.", v4, 2u);
  }

  id result = [*(id *)(a1 + 32) didInitialLaunch];
  if ((result & 1) == 0)
  {
    [*(id *)(a1 + 32) setDidInitialLaunch:1];
    return [*(id *)(a1 + 32) launchOwner];
  }
  return result;
}

void sub_72A4(id a1)
{
  qword_17E28 = objc_alloc_init(NSPUserEventAgentFileHandleMaintainer);

  _objc_release_x1();
}

void sub_735C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v6 handleProviderAction:a1 token:a2 event:v5];
}

void sub_74D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_75F4(uint64_t a1)
{
  char v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%@ file handle reader setting timer fired", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 32) setFileHandleReaderSettingTimer:0];
  return [*(id *)(a1 + 32) setupReadabilityHandlers];
}

id sub_7998(uint64_t a1)
{
  kdebug_trace();
  char v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "File Handle Maintainer got a readable event on a file handle: %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) cancelFileHandleReaderSources];
  [*(id *)(a1 + 40) setDidInitialLaunch:1];
  [*(id *)(a1 + 40) launchOwner];
  return [*(id *)(a1 + 40) startFileHandleReaderSettingTimer];
}

void sub_7B10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_7B24(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 launchOwnerWhenReadable]) {
    [*(id *)(a1 + 32) startFileHandleReader:v3];
  }

  return 1;
}

void sub_7C14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_7D50(id a1)
{
  qword_17E38 = (uint64_t)os_log_create("com.apple.networkserviceproxy", "");

  _objc_release_x1();
}

id nplog_large_obj()
{
  if (qword_17E50 != -1) {
    dispatch_once(&qword_17E50, &stru_149E0);
  }
  v0 = (void *)qword_17E48;

  return v0;
}

void sub_7DE8(id a1)
{
  qword_17E48 = (uint64_t)os_log_create("com.apple.networkserviceproxy", "Large");

  _objc_release_x1();
}

void nsp_print_backtrace()
{
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  *(_OWORD *)v9 = 0u;
  long long v10 = 0u;
  int v0 = backtrace(v9, 128);
  uint64_t v1 = backtrace_symbols(v9, v0);
  char v2 = v1;
  if (v0 >= 1)
  {
    uint64_t v3 = v0;
    uint32_t v4 = v1;
    do
    {
      int v5 = nplog_obj();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v6 = *v4;
        *(_DWORD *)buf = 136315138;
        v8 = v6;
        _os_log_error_impl(&dword_0, v5, OS_LOG_TYPE_ERROR, "    %s", buf, 0xCu);
      }

      ++v4;
      --v3;
    }
    while (v3);
  }
  free(v2);
}

void sub_7FDC(id a1)
{
  qword_17E58 = objc_alloc_init(NPUserEventAgent);

  _objc_release_x1();
}

void sub_8210(id a1, NSTimer *a2)
{
  char v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Resurrection timer fired", v4, 2u);
  }

  uint64_t v3 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v3 launchOwner];
}

void sub_848C(id a1, NSTimer *a2)
{
  char v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Config Fetch timer fired", v4, 2u);
  }

  uint64_t v3 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v3 launchOwner];
}

void sub_8708(id a1, NSTimer *a2)
{
  char v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Token Fetch timer fired", v4, 2u);
  }

  uint64_t v3 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v3 launchOwner];
}

void sub_8984(id a1, NSTimer *a2)
{
  char v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Device identity fetch timer fired", v4, 2u);
  }

  uint64_t v3 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v3 launchOwner];
}

void sub_8C00(id a1, NSTimer *a2)
{
  char v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Subscription check timer fired", v4, 2u);
  }

  uint64_t v3 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v3 launchOwner];
}

void sub_8E7C(id a1, NSTimer *a2)
{
  char v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Proxy restore timer fired", v4, 2u);
  }

  uint64_t v3 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v3 launchOwner];
}

void sub_90F8(id a1, NSTimer *a2)
{
  char v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "odoh retore timer fired", v4, 2u);
  }

  uint64_t v3 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v3 launchOwner];
}

void sub_9374(id a1, NSTimer *a2)
{
  char v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "odoh auth outage restore fired", v4, 2u);
  }

  uint64_t v3 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v3 launchOwner];
}

void sub_95F0(id a1, NSTimer *a2)
{
  char v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "proxy path probe timer fired", v4, 2u);
  }

  uint64_t v3 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v3 launchOwner];
}

void sub_986C(id a1, NSTimer *a2)
{
  char v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "direct path probe timer fired", v4, 2u);
  }

  uint64_t v3 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v3 launchOwner];
}

void sub_9A6C(uint64_t a1)
{
  char v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "%@: location monitor timer fired", (uint8_t *)&v5, 0xCu);
  }

  uint32_t v4 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v4 launchOwner];
}

void sub_9C48(id a1)
{
  int out_token = -1;
  uint64_t v1 = dispatch_get_global_queue(0, 0);
  uint32_t v2 = notify_register_dispatch("com.apple.networking.captive.CNPluginListChanged", &out_token, v1, &stru_14BE8);

  if (v2)
  {
    uint64_t v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_BE88();
    }
  }
}

void sub_9CD8(id a1, int a2)
{
  uint32_t v2 = nplog_obj();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint32_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "received captive plugin list changed notification", v4, 2u);
  }

  uint64_t v3 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v3 launchOwner];
}

void sub_9DE4(uint64_t a1)
{
  uint32_t v2 = dispatch_get_global_queue(0, 0);
  [*(id *)(a1 + 32) setUserActivityNotificationHandle:IOPMScheduleUserActivityLevelNotification()];

  if (![*(id *)(a1 + 32) userActivityNotificationHandle])
  {
    uint64_t v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_BEBC();
    }
  }
}

void sub_9EB8(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0 && [*(id *)(a1 + 32) captiveOutageWaitingForUserActivity])
  {
    uint32_t v2 = nplog_obj();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint32_t v4 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "[active user] outage notification is pending, launching NSP", v4, 2u);
    }

    uint64_t v3 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
    [v3 launchOwner];
  }
}

void sub_A190()
{
  int v0 = nplog_obj();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint32_t v2 = 0;
    _os_log_impl(&dword_0, v0, OS_LOG_TYPE_INFO, "dynamic store changed", v2, 2u);
  }

  uint64_t v1 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v1 launchOwner];
}

void sub_AAC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_B1D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void NPUserEventAgentModuleInit()
{
  int v0 = +[NSPUserEventAgentFileHandleMaintainer sharedEventAgentMaintainer];
  [v0 startEventAgentModeWithEventName:@"com.apple.networkserviceproxy.file-descriptor-maintainer"];

  xpc_event_provider_create();
}

void sub_B6C4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = +[NPUserEventAgent sharedAgent];
  [v6 handleProviderAction:a1 token:a2 event:v5];
}

void sub_B740(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_B768(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_B794()
{
  sub_6F6C();
  sub_6F84(&dword_0, v0, v1, "SecItemCopyMatching returned %d for %@");
}

void sub_B7FC()
{
  sub_6FA4();
  sub_6FBC(&dword_0, v0, v1, "Failed to save %@ to the keychain: %d");
}

void sub_B864()
{
  sub_6FA4();
  sub_6FBC(&dword_0, v0, v1, "Failed to save key %@ to the keychain: %d");
}

void sub_B8CC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "SecRandomCopyBytes failed", v1, 2u);
}

void sub_B910(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Random ratio %f", (uint8_t *)&v2, 0xCu);
}

void sub_B98C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to get the timebase info", v1, 2u);
}

void sub_B9D0()
{
  sub_6F6C();
  sub_6F84(&dword_0, v0, v1, "Mach-O UUID for process PID=%d is %@");
}

void sub_BA38(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "+[NPUtilities createMaskedIPv4Address:prefix:]";
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "%s called with null address", (uint8_t *)&v1, 0xCu);
}

void sub_BABC(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "+[NPUtilities createMaskedIPv6Address:prefix:]";
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "%s called with null address", (uint8_t *)&v1, 0xCu);
}

void sub_BB40(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to register for first unlock notification.", v1, 2u);
}

void sub_BB84(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "File Handle Maintainer got a %ld action with token %llu", (uint8_t *)&v3, 0x16u);
}

void sub_BC0C()
{
  sub_B75C();
  sub_B740(&dword_0, v0, v1, "Failed to create the resurrection timer", v2, v3, v4, v5, v6);
}

void sub_BC40()
{
  sub_B75C();
  sub_B740(&dword_0, v0, v1, "Failed to create the config fetch timer", v2, v3, v4, v5, v6);
}

void sub_BC74()
{
  sub_B75C();
  sub_B740(&dword_0, v0, v1, "Failed to create the token fetch timer", v2, v3, v4, v5, v6);
}

void sub_BCA8()
{
  sub_B75C();
  sub_B740(&dword_0, v0, v1, "Failed to create token issuance retricted until timer", v2, v3, v4, v5, v6);
}

void sub_BCDC()
{
  sub_B75C();
  sub_B740(&dword_0, v0, v1, "Failed to create subscription check timer", v2, v3, v4, v5, v6);
}

void sub_BD10()
{
  sub_B75C();
  sub_B740(&dword_0, v0, v1, "Failed to create proxy restore timer", v2, v3, v4, v5, v6);
}

void sub_BD44()
{
  sub_B75C();
  sub_B740(&dword_0, v0, v1, "Failed to create odoh restore timer", v2, v3, v4, v5, v6);
}

void sub_BD78()
{
  sub_B75C();
  sub_B740(&dword_0, v0, v1, "Failed to create odoh auth outage restore timer", v2, v3, v4, v5, v6);
}

void sub_BDAC()
{
  sub_B75C();
  sub_B740(&dword_0, v0, v1, "Failed to create proxy path probe timer", v2, v3, v4, v5, v6);
}

void sub_BDE0()
{
  sub_B75C();
  sub_B740(&dword_0, v0, v1, "Failed to create direct path probe timer", v2, v3, v4, v5, v6);
}

void sub_BE14()
{
  sub_B788();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "%@ Failed to create the location monitor timer", v1, 0xCu);
}

void sub_BE88()
{
  sub_B75C();
  sub_B740(&dword_0, v0, v1, "failed to register for captive plugin list changed notification.", v2, v3, v4, v5, v6);
}

void sub_BEBC()
{
  sub_B75C();
  sub_B740(&dword_0, v0, v1, "Failed to register for user activity notifications", v2, v3, v4, v5, v6);
}

void sub_BEF0()
{
  CFErrorRef Error = SCCopyLastError();
  sub_B788();
  sub_B768(&dword_0, v1, v2, "Failed to create dynamic store: %@", v3, v4, v5, v6, v7);
}

void sub_BF70()
{
  CFErrorRef Error = SCCopyLastError();
  sub_B788();
  sub_B768(&dword_0, v1, v2, "Failed to set dynamic store dispatch queue: %@", v3, v4, v5, v6, v7);
}

void sub_BFF0()
{
  CFErrorRef Error = SCCopyLastError();
  sub_B788();
  sub_B768(&dword_0, v1, v2, "Failed to update the dynamic store notification keys: %@", v3, v4, v5, v6, v7);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return _CFCalendarCreateWithIdentifier(allocator, identifier);
}

Boolean CFCalendarDecomposeAbsoluteTime(CFCalendarRef calendar, CFAbsoluteTime at, const char *componentDesc, ...)
{
  va_start(va, componentDesc);
  uint64_t v3 = va_arg(va, const char *);
  return _CFCalendarDecomposeAbsoluteTime(calendar, at, v3);
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return _CFDateCompare(theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return _CFDateCreate(allocator, at);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t IOPMScheduleUserActivityLevelNotification()
{
  return _IOPMScheduleUserActivityLevelNotification();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

CFErrorRef SCCopyLastError(void)
{
  return _SCCopyLastError();
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkInterfaceEntity(allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkServiceEntity(allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return _SCDynamicStoreSetDispatchQueue(store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
}

uint64_t SecCertificateNotValidAfter()
{
  return _SecCertificateNotValidAfter();
}

uint64_t SecCertificateNotValidBefore()
{
  return _SecCertificateNotValidBefore();
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

CFTypeID SecKeyGetTypeID(void)
{
  return _SecKeyGetTypeID();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return _SecRandomCopyBytes(rnd, count, bytes);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

int backtrace(void **a1, int a2)
{
  return _backtrace(a1, a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return _backtrace_symbols(a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

uint64_t freemptcpinfo()
{
  return _freemptcpinfo();
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return _if_indextoname(a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return _nw_endpoint_copy_address_string(endpoint);
}

char *__cdecl nw_endpoint_copy_port_string(nw_endpoint_t endpoint)
{
  return _nw_endpoint_copy_port_string(endpoint);
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_address(endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_type(endpoint);
}

uint64_t nw_interface_create_with_index()
{
  return _nw_interface_create_with_index();
}

uint32_t nw_interface_get_index(nw_interface_t interface)
{
  return _nw_interface_get_index(interface);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return _nw_interface_get_name(interface);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return _nw_interface_get_type(interface);
}

nw_multipath_service_t nw_parameters_get_multipath_service(nw_parameters_t parameters)
{
  return _nw_parameters_get_multipath_service(parameters);
}

uint64_t nw_path_copy_interface()
{
  return _nw_path_copy_interface();
}

BOOL nw_path_has_ipv4(nw_path_t path)
{
  return _nw_path_has_ipv4(path);
}

BOOL nw_path_has_ipv6(nw_path_t path)
{
  return _nw_path_has_ipv6(path);
}

uint64_t nwi_ifstate_get_flags()
{
  return _nwi_ifstate_get_flags();
}

uint64_t nwi_ifstate_get_signature()
{
  return _nwi_ifstate_get_signature();
}

uint64_t nwi_state_copy()
{
  return _nwi_state_copy();
}

uint64_t nwi_state_get_ifstate()
{
  return _nwi_state_get_ifstate();
}

uint64_t nwi_state_release()
{
  return _nwi_state_release();
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_double(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_event_provider_create()
{
  while (1)
    ;
}

void xpc_event_provider_get_queue()
{
  while (1)
    ;
}

void xpc_event_provider_token_fire()
{
  while (1)
    ;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_IPType(void *a1, const char *a2, ...)
{
  return [a1 IPType];
}

id objc_msgSend_TCPInfo(void *a1, const char *a2, ...)
{
  return [a1 TCPInfo];
}

id objc_msgSend_TFOSucceeded(void *a1, const char *a2, ...)
{
  return [a1 TFOSucceeded];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancelFileHandleReaderSources(void *a1, const char *a2, ...)
{
  return [a1 cancelFileHandleReaderSources];
}

id objc_msgSend_captiveOutage(void *a1, const char *a2, ...)
{
  return [a1 captiveOutage];
}

id objc_msgSend_captiveOutageWaitingForUserActivity(void *a1, const char *a2, ...)
{
  return [a1 captiveOutageWaitingForUserActivity];
}

id objc_msgSend_checkDeviceFirstUnlock(void *a1, const char *a2, ...)
{
  return [a1 checkDeviceFirstUnlock];
}

id objc_msgSend_configFetchOnNetworkChange(void *a1, const char *a2, ...)
{
  return [a1 configFetchOnNetworkChange];
}

id objc_msgSend_configurationFetchDate(void *a1, const char *a2, ...)
{
  return [a1 configurationFetchDate];
}

id objc_msgSend_configurationFetchTimer(void *a1, const char *a2, ...)
{
  return [a1 configurationFetchTimer];
}

id objc_msgSend_connectionDelay(void *a1, const char *a2, ...)
{
  return [a1 connectionDelay];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createEvent(void *a1, const char *a2, ...)
{
  return [a1 createEvent];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_didInitialLaunch(void *a1, const char *a2, ...)
{
  return [a1 didInitialLaunch];
}

id objc_msgSend_directPathProbeDate(void *a1, const char *a2, ...)
{
  return [a1 directPathProbeDate];
}

id objc_msgSend_directPathProbeTimer(void *a1, const char *a2, ...)
{
  return [a1 directPathProbeTimer];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_dynamicStore(void *a1, const char *a2, ...)
{
  return [a1 dynamicStore];
}

id objc_msgSend_edgeAddress(void *a1, const char *a2, ...)
{
  return [a1 edgeAddress];
}

id objc_msgSend_edgeType(void *a1, const char *a2, ...)
{
  return [a1 edgeType];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_eventToken(void *a1, const char *a2, ...)
{
  return [a1 eventToken];
}

id objc_msgSend_fallbackDelay(void *a1, const char *a2, ...)
{
  return [a1 fallbackDelay];
}

id objc_msgSend_fallbackReason(void *a1, const char *a2, ...)
{
  return [a1 fallbackReason];
}

id objc_msgSend_fallbackReasonCategory(void *a1, const char *a2, ...)
{
  return [a1 fallbackReasonCategory];
}

id objc_msgSend_fileDescriptor(void *a1, const char *a2, ...)
{
  return [a1 fileDescriptor];
}

id objc_msgSend_fileHandleReaderSettingTimer(void *a1, const char *a2, ...)
{
  return [a1 fileHandleReaderSettingTimer];
}

id objc_msgSend_fileHandleReaderSources(void *a1, const char *a2, ...)
{
  return [a1 fileHandleReaderSources];
}

id objc_msgSend_firstTxByteDelay(void *a1, const char *a2, ...)
{
  return [a1 firstTxByteDelay];
}

id objc_msgSend_firstTxByteTimeStamp(void *a1, const char *a2, ...)
{
  return [a1 firstTxByteTimeStamp];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return [a1 handle];
}

id objc_msgSend_initialBytesLeftOver(void *a1, const char *a2, ...)
{
  return [a1 initialBytesLeftOver];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_interfaceName(void *a1, const char *a2, ...)
{
  return [a1 interfaceName];
}

id objc_msgSend_interfaceType(void *a1, const char *a2, ...)
{
  return [a1 interfaceType];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isMultipath(void *a1, const char *a2, ...)
{
  return [a1 isMultipath];
}

id objc_msgSend_isObservingPath(void *a1, const char *a2, ...)
{
  return [a1 isObservingPath];
}

id objc_msgSend_isTFOProbeSucceeded(void *a1, const char *a2, ...)
{
  return [a1 isTFOProbeSucceeded];
}

id objc_msgSend_launchOwner(void *a1, const char *a2, ...)
{
  return [a1 launchOwner];
}

id objc_msgSend_launchOwnerWhenReadable(void *a1, const char *a2, ...)
{
  return [a1 launchOwnerWhenReadable];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_locationMonitorTimer(void *a1, const char *a2, ...)
{
  return [a1 locationMonitorTimer];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_minimumRTT(void *a1, const char *a2, ...)
{
  return [a1 minimumRTT];
}

id objc_msgSend_multipathConnectedSubflowCount(void *a1, const char *a2, ...)
{
  return [a1 multipathConnectedSubflowCount];
}

id objc_msgSend_multipathPrimarySubflowInterfaceIndex(void *a1, const char *a2, ...)
{
  return [a1 multipathPrimarySubflowInterfaceIndex];
}

id objc_msgSend_multipathSubflowCount(void *a1, const char *a2, ...)
{
  return [a1 multipathSubflowCount];
}

id objc_msgSend_multipathSubflowSwitchCounts(void *a1, const char *a2, ...)
{
  return [a1 multipathSubflowSwitchCounts];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nonwifiNetworkSignature(void *a1, const char *a2, ...)
{
  return [a1 nonwifiNetworkSignature];
}

id objc_msgSend_odohAuthOutageRestoreDate(void *a1, const char *a2, ...)
{
  return [a1 odohAuthOutageRestoreDate];
}

id objc_msgSend_odohAuthOutageRestoreTimer(void *a1, const char *a2, ...)
{
  return [a1 odohAuthOutageRestoreTimer];
}

id objc_msgSend_odohRestoreDate(void *a1, const char *a2, ...)
{
  return [a1 odohRestoreDate];
}

id objc_msgSend_odohRestoreTimer(void *a1, const char *a2, ...)
{
  return [a1 odohRestoreTimer];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathType(void *a1, const char *a2, ...)
{
  return [a1 pathType];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return [a1 provider];
}

id objc_msgSend_proxyPathProbeDate(void *a1, const char *a2, ...)
{
  return [a1 proxyPathProbeDate];
}

id objc_msgSend_proxyPathProbeTimer(void *a1, const char *a2, ...)
{
  return [a1 proxyPathProbeTimer];
}

id objc_msgSend_proxyRestoreDate(void *a1, const char *a2, ...)
{
  return [a1 proxyRestoreDate];
}

id objc_msgSend_proxyRestoreTimer(void *a1, const char *a2, ...)
{
  return [a1 proxyRestoreTimer];
}

id objc_msgSend_receivedEventToken(void *a1, const char *a2, ...)
{
  return [a1 receivedEventToken];
}

id objc_msgSend_registerForCaptivePluginListChangedNotification(void *a1, const char *a2, ...)
{
  return [a1 registerForCaptivePluginListChangedNotification];
}

id objc_msgSend_registerForDynamicStoreChanges(void *a1, const char *a2, ...)
{
  return [a1 registerForDynamicStoreChanges];
}

id objc_msgSend_registerForUserActivityNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForUserActivityNotifications];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resurrectionDate(void *a1, const char *a2, ...)
{
  return [a1 resurrectionDate];
}

id objc_msgSend_resurrectionTimer(void *a1, const char *a2, ...)
{
  return [a1 resurrectionTimer];
}

id objc_msgSend_setupReadabilityHandlers(void *a1, const char *a2, ...)
{
  return [a1 setupReadabilityHandlers];
}

id objc_msgSend_sharedAgent(void *a1, const char *a2, ...)
{
  return [a1 sharedAgent];
}

id objc_msgSend_sharedDefaultEvaluator(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaultEvaluator];
}

id objc_msgSend_sharedEventAgentMaintainer(void *a1, const char *a2, ...)
{
  return [a1 sharedEventAgentMaintainer];
}

id objc_msgSend_startFileHandleReaderSettingTimer(void *a1, const char *a2, ...)
{
  return [a1 startFileHandleReaderSettingTimer];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stopFileHandleReaderSettingTimer(void *a1, const char *a2, ...)
{
  return [a1 stopFileHandleReaderSettingTimer];
}

id objc_msgSend_subscriptionCheckDate(void *a1, const char *a2, ...)
{
  return [a1 subscriptionCheckDate];
}

id objc_msgSend_subscriptionCheckOnNetworkChange(void *a1, const char *a2, ...)
{
  return [a1 subscriptionCheckOnNetworkChange];
}

id objc_msgSend_subscriptionCheckTimer(void *a1, const char *a2, ...)
{
  return [a1 subscriptionCheckTimer];
}

id objc_msgSend_timeIntervalSinceLastUsage(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceLastUsage];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeToFirstByte(void *a1, const char *a2, ...)
{
  return [a1 timeToFirstByte];
}

id objc_msgSend_timingIntervals(void *a1, const char *a2, ...)
{
  return [a1 timingIntervals];
}

id objc_msgSend_tokenFetchDate(void *a1, const char *a2, ...)
{
  return [a1 tokenFetchDate];
}

id objc_msgSend_tokenFetchOnNetworkChange(void *a1, const char *a2, ...)
{
  return [a1 tokenFetchOnNetworkChange];
}

id objc_msgSend_tokenFetchTimer(void *a1, const char *a2, ...)
{
  return [a1 tokenFetchTimer];
}

id objc_msgSend_tokenIssuanceRestrictedUntilDate(void *a1, const char *a2, ...)
{
  return [a1 tokenIssuanceRestrictedUntilDate];
}

id objc_msgSend_tokenIssuanceRestrictedUntilTimer(void *a1, const char *a2, ...)
{
  return [a1 tokenIssuanceRestrictedUntilTimer];
}

id objc_msgSend_tunnelConnectionError(void *a1, const char *a2, ...)
{
  return [a1 tunnelConnectionError];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_userActivityNotificationHandle(void *a1, const char *a2, ...)
{
  return [a1 userActivityNotificationHandle];
}

id objc_msgSend_watchForPathChanges(void *a1, const char *a2, ...)
{
  return [a1 watchForPathChanges];
}

id objc_msgSend_wifiNetworkSignature(void *a1, const char *a2, ...)
{
  return [a1 wifiNetworkSignature];
}