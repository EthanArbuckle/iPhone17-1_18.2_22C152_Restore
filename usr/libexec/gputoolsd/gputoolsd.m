void sub_1000023EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_10000258C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000026A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1000027D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000280C(uint64_t a1)
{
  v1 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:a1];
  v2 = +[RBSProcessHandle handleForPredicate:v1 error:0];

  if (v2) {
    uint64_t v3 = (uint64_t)[v2 pid];
  }
  else {
    uint64_t v3 = 0xFFFFFFFFLL;
  }

  return v3;
}

void sub_10000288C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000028A8(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    id v7 = [v5 description];
    id v9 = [v7 UTF8String];
    DYLog();

    +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0, v9);
  }
  else
  {
    +[NSNumber numberWithBool:1];
  v8 = };
  [*(id *)(a1 + 32) setResult:v8];
}

void sub_100002994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100002F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, void *a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  _Unwind_Resume(a1);
}

void sub_1000030B4(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 32) error];
  v2 = [v5 domain];
  uint64_t v3 = v2;
  if (v2 == (void *)DYErrorDomain)
  {
    id v4 = [v5 code];

    if (v4 == (id)6) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  DYLog();
  [*(id *)(a1 + 32) terminate:1];
LABEL_5:
}

void sub_100003178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100003198(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(a1 + 32) setError:v6];
  id v7 = [v5 objectPayload];
  [*(id *)(a1 + 32) setResult:v7];

  return 0;
}

void sub_10000320C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000368C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, ...)
{
  va_start(va, a11);

  _Block_object_dispose(va, 8);
  sub_100003884();

  _Unwind_Resume(a1);
}

void sub_100003734(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 description];
    [v7 UTF8String];
    DYLog();
  }
  else if (v8)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v8 pid];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000037F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000381C(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.MobileReplayer"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = (uint64_t)[v1 isEqualToString:@"com.apple.MTLReplayer"];
  }

  return v2;
}

void sub_100003874(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003884()
{
  v0 = g_signpostLog;
  if (os_signpost_enabled(g_signpostLog))
  {
    *(_WORD *)id v1 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v0, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Agent-LaunchInferior", (const char *)&unk_10000BB0E, v1, 2u);
  }
}

void sub_100003C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003D00(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) error];
  uint64_t v3 = (void *)DYErrorDomain;
  id v4 = v2;
  id v5 = v3;
  if (!v5) {
    __assert_rtn("BOOL dy_error_eq(NSError *__strong, NSString *__strong, int)", "", 0, "domain");
  }
  if (v4 && [v4 code] == (id)6)
  {
    id v6 = [v4 domain];
    unsigned __int8 v7 = [v6 isEqualToString:v5];

    if (v7) {
      return;
    }
  }
  else
  {
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 32) error];
  id v9 = [v8 description];
  [v9 UTF8String];
  DYLog();

  id v10 = *(void **)(a1 + 32);

  [v10 terminate:1];
}

void sub_100003E64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003E9C(uint64_t a1)
{
  if (([*(id *)(a1 + 32) BOOLResult] & 1) == 0)
  {
    id v9 = [*(id *)(a1 + 32) error];
    id v2 = [v9 description];
    id v8 = [v2 UTF8String];
    DYLog();

    [*(id *)(a1 + 40) terminate:1, v8];
  }
  uint64_t v3 = kDYGuestAppLaunchEnvironmentKey;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = kDYGuestAppLaunchArgumentsKey;
  id v6 = [*(id *)(a1 + 56) objectForKey:kDYGuestAppLaunchArgumentsKey];
  +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v4, v3, v6, v5, 0);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  unsigned __int8 v7 = +[DYTransportMessage messageWithKind:1287 plistPayload:v10];
  if (!v7)
  {
    DYLog();
    [*(id *)(a1 + 40) terminate:1];
  }
  if (([*(id *)(*(void *)(a1 + 40) + 32) send:v7 error:0] & 1) == 0)
  {
    DYLog();
    [*(id *)(a1 + 40) terminate:1];
  }
}

void sub_100004030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  _Unwind_Resume(a1);
}

void sub_100004618(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_100004C5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004CDC(uint64_t a1, const void *a2)
{
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), a2);
  if (Value)
  {
    uint64_t v5 = Value;
    if (is_valid_plist_value(Value))
    {
      id v6 = *(__CFDictionary **)(a1 + 40);
      CFDictionarySetValue(v6, a2, v5);
    }
  }
}

void sub_100004ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

void sub_100004F24(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [*(id *)(a1 + 32) processApplication:v4];
    if (v3) {
      [*(id *)(a1 + 40) addObject:v3];
    }
  }
}

void sub_100004FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000575C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000058E4(uint64_t a1)
{
  if (CSIsNull())
  {
    [*(id *)(a1 + 32) inferiorPid];
    uint64_t v2 = CSSymbolicatorCreateWithPid();
    uint64_t v3 = (uint64_t *)(*(void *)(a1 + 32) + 8);
    uint64_t *v3 = v2;
    v3[1] = v4;
  }
  if (CSIsNull()) {
    id Signature = 0;
  }
  else {
    id Signature = (id)CSSymbolicatorCreateSignature();
  }
  uint64_t v5 = [*(id *)(a1 + 32) transport];
  id v6 = +[DYTransportMessage messageWithKind:1538 payload:Signature];
  [v5 send:v6 inReplyTo:*(void *)(a1 + 40) error:0];
}

void sub_1000059E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005B44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

NSObject *sub_100005BE8(uint64_t a1, NSObject *a2, void *a3)
{
  id v5 = a3;
  id v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, a2);
  if (v6)
  {
    uint64_t v7 = 1000000000 * a1;
    dispatch_time_t v8 = dispatch_time(0, v7);
    dispatch_source_set_timer(v6, v8, v7, 0x989680uLL);
    dispatch_source_set_event_handler(v6, v5);
    dispatch_resume(v6);
  }

  return v6;
}

void sub_100005D28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)DYGPUStatsReport;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_100005D54(void *a1)
{
}

CFComparisonResult sub_100005E44(uint64_t a1)
{
  CFStringRef Group = (const __CFString *)IOReportChannelGetGroup();
  if (CFStringCompare(Group, *(CFStringRef *)(a1 + 32), 1uLL)) {
    return 16;
  }
  SubCFStringRef Group = (const __CFString *)IOReportChannelGetSubGroup();
  CFComparisonResult result = CFStringCompare(SubGroup, *(CFStringRef *)(a1 + 40), 1uLL);
  if (result) {
    return 16;
  }
  return result;
}

void sub_100005F68(uint64_t a1)
{
  uint64_t Samples = IOReportCreateSamples();
  if (Samples)
  {
    uint64_t v3 = Samples;
    if (*(void *)(*(void *)(a1 + 32) + 32))
    {
      uint64_t SamplesDelta = IOReportCreateSamplesDelta();
      if (SamplesDelta)
      {
        id v5 = (const void *)SamplesDelta;
        uint64_t v8 = 0;
        id v9 = &v8;
        uint64_t v10 = 0x3032000000;
        v11 = sub_1000060D0;
        v12 = sub_1000060E0;
        id v13 = (id)objc_opt_new();
        IOReportIterate();
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), (id)v9[5]);
        CFRelease(v5);
        _Block_object_dispose(&v8, 8);
      }
    }
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = v3;
  }
}

void sub_1000060B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  _Unwind_Resume(a1);
}

uint64_t sub_1000060D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000060E0(uint64_t a1)
{
}

uint64_t sub_1000060E8(uint64_t a1)
{
  if (IOReportChannelGetFormat() != 2) {
    return 16;
  }
  int Count = IOReportStateGetCount();
  id v3 = objc_alloc_init((Class)NSNumberFormatter);
  [v3 setNumberStyle:1];
  if (Count >= 1)
  {
    int v4 = 0;
    double v5 = 0.0;
    double v6 = 0.0;
    do
    {
      NameForIndex = (void *)IOReportStateGetNameForIndex();
      IOReportStateGetDutyCycle();
      if (NameForIndex)
      {
        double v9 = v8;
        if ([NameForIndex length])
        {
          uint64_t v10 = +[NSNumber numberWithDouble:v9 * 100.0];
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v10 forKeyedSubscript:NameForIndex];

          if (([NameForIndex isEqualToString:@"OFF"] & 1) == 0)
          {
            if ([NameForIndex hasPrefix:@"P"])
            {
              v11 = [NameForIndex substringFromIndex:1];
              v12 = v11;
              if (v11 && [v11 length])
              {
                id v13 = v3;
                v14 = [v3 numberFromString:v12];
                v15 = v14;
                if (v14)
                {
                  [v14 doubleValue];
                  double v5 = v5 + v16 * v9;
                  double v6 = v6 + v9;
                }

                id v3 = v13;
              }
            }
          }
        }
      }

      ++v4;
    }
    while (Count != v4);
    if (v6 > 2.22044605e-16)
    {
      v17 = +[NSNumber numberWithDouble:v5 / v6];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v17 forKeyedSubscript:kDYXPState];
    }
  }

  return 0;
}

void sub_1000062E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000068E0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000690C(uint64_t a1)
{
  uint64_t result = SSLRead(*(SSLContextRef *)(*(void *)(a1 + 32) + 288), *(void **)(a1 + 56), *(void *)(a1 + 64), (size_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100006B10(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006B3C(uint64_t a1)
{
  uint64_t result = SSLWrite(*(SSLContextRef *)(*(void *)(a1 + 32) + 288), *(const void **)(a1 + 56), *(void *)(a1 + 64), (size_t *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_100006CDC(uint64_t a1)
{
  uint64_t v2 = *(unsigned char **)(a1 + 32);
  if (v2[OBJC_IVAR___DYTransport__invalid])
  {
    CFStringRef v3 = (const __CFString *)DYErrorDomain;
    uint64_t v4 = 32;
LABEL_3:
    double v5 = +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", v3, v4, 0, v15, v16);
    uint64_t v7 = *(void **)(a1 + 40);
    double v6 = (id *)(a1 + 40);
    [v7 setError:v5];

    uint64_t v8 = +[NSNumber numberWithBool:0];
    goto LABEL_7;
  }
  if (![v2 connected])
  {
    uint64_t v10 = secure_lockdown_checkin();
    if (v10)
    {
      uint64_t v11 = v10;
      if (v10 > 0xB) {
        v12 = "unknown";
      }
      else {
        v12 = (&off_10000C860)[(int)v10 - 1];
      }
      v15 = +[NSString stringWithUTF8String:v12];
      uint64_t v16 = v11;
      _DYOLog();

      uint64_t v4 = (int)v11;
      CFStringRef v3 = @"LockdownErrorDomain";
      goto LABEL_3;
    }
    *(_DWORD *)(*(void *)(a1 + 32) + 296) = lockdown_get_socket();
    if (*(_DWORD *)(*(void *)(a1 + 32) + 296) == -1)
    {
      _DYOLog();
      uint64_t v9 = 0;
      goto LABEL_6;
    }
    *(void *)(*(void *)(a1 + 32) + 288) = lockdown_get_securecontext();
    uint64_t v13 = *(void *)(a1 + 32);
    v14 = *(void **)(v13 + 288);
    if (v14 && *(_DWORD *)(v13 + 296) == *((_DWORD *)v14 + 8))
    {
      v14[2] = sub_100006F2C;
      v14[3] = sub_100006F38;
      v14[4] = *(void *)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 32);
    }
    [(id)v13 runWithSocket:*(unsigned int *)(v13 + 296)];
  }
  uint64_t v9 = 1;
LABEL_6:
  uint64_t v8 = +[NSNumber numberWithBool:v9];
  double v6 = (id *)(a1 + 40);
LABEL_7:
  id v17 = (id)v8;
  [*v6 setResult:v8];
}

id sub_100006F2C(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 _ssl_st_read:a2 size:a3];
}

id sub_100006F38(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 _ssl_st_write:a2 size:a3];
}

void start()
{
  sub_100007010();
  signal(15, (void (__cdecl *)(int))1);
  uint64_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler(v1, &stru_10000C8D8);
  dispatch_resume(v1);
  signal(20, (void (__cdecl *)(int))1);
  uint64_t v2 = objc_alloc_init(DYLockdownTransport);
  CFStringRef v3 = [[DYEmbeddedDaemon alloc] initWithTransport:v2 terminationHandler:&stru_10000C918];
  [(DYEmbeddedDaemon *)v3 run];

  dispatch_main();
}

uint64_t sub_100007010()
{
  size_t v1 = 8;
  uint64_t v2 = 0;
  uint64_t result = sysctlbyname("security.mac.amfi.developer_mode_status", &v2, &v1, 0, 0);
  if (result)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100007698();
    }
LABEL_8:
    exit(1);
  }
  if (v2 != 1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100007650();
    }
    goto LABEL_8;
  }
  return result;
}

void sub_10000709C(id a1)
{
}

void sub_1000070C8(id a1, int a2)
{
}

void sub_10000727C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007514(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007624(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100007650()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Service prohibited from running (developer mode not enabled)", v0, 2u);
}

void sub_100007698()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to read developer mode status: %{darwin.errno}d", (uint8_t *)v1, 8u);
}

CFDictionaryRef CFBundleCopyInfoDictionaryForURL(CFURLRef url)
{
  return _CFBundleCopyInfoDictionaryForURL(url);
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

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return _CFPropertyListCreateWithStream(allocator, stream, streamLength, options, format, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
}

CFReadStreamRef CFReadStreamCreateWithFile(CFAllocatorRef alloc, CFURLRef fileURL)
{
  return _CFReadStreamCreateWithFile(alloc, fileURL);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return _CFReadStreamOpen(stream);
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

Boolean CFStringGetFileSystemRepresentation(CFStringRef string, char *buffer, CFIndex maxBufLen)
{
  return _CFStringGetFileSystemRepresentation(string, buffer, maxBufLen);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return _CFURLCreateCopyAppendingPathComponent(allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return _CFURLCreateCopyDeletingLastPathComponent(allocator, url);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return _CFURLCreateFromFileSystemRepresentation(allocator, buffer, bufLen, isDirectory);
}

uint64_t CSIsNull()
{
  return _CSIsNull();
}

uint64_t CSSymbolicatorCreateSignature()
{
  return _CSSymbolicatorCreateSignature();
}

uint64_t CSSymbolicatorCreateWithPid()
{
  return _CSSymbolicatorCreateWithPid();
}

uint64_t DYCheckGLDispatchTableSize()
{
  return _DYCheckGLDispatchTableSize();
}

uint64_t DYGetGLInterposeDylibPath()
{
  return _DYGetGLInterposeDylibPath();
}

uint64_t DYGetMTLDiagnosticsDylibPath()
{
  return _DYGetMTLDiagnosticsDylibPath();
}

uint64_t DYGetMTLInterposeDylibPath()
{
  return _DYGetMTLInterposeDylibPath();
}

uint64_t DYLog()
{
  return _DYLog();
}

uint64_t DYMachOGetDylibCompatibilityVersion()
{
  return _DYMachOGetDylibCompatibilityVersion();
}

uint64_t DYMobileArchivesDirectory()
{
  return _DYMobileArchivesDirectory();
}

uint64_t DYModifyEnvironmentForDualCaptureSupport()
{
  return _DYModifyEnvironmentForDualCaptureSupport();
}

uint64_t DYSetGTMTLCaptureMode()
{
  return _DYSetGTMTLCaptureMode();
}

uint64_t GLCFrontDispatch()
{
  return _GLCFrontDispatch();
}

uint64_t GLIContextFromEAGLContext()
{
  return _GLIContextFromEAGLContext();
}

uint64_t IOReportChannelGetFormat()
{
  return _IOReportChannelGetFormat();
}

uint64_t IOReportChannelGetGroup()
{
  return _IOReportChannelGetGroup();
}

uint64_t IOReportChannelGetSubGroup()
{
  return _IOReportChannelGetSubGroup();
}

uint64_t IOReportCopyChannelsInCategories()
{
  return _IOReportCopyChannelsInCategories();
}

uint64_t IOReportCreateSamples()
{
  return _IOReportCreateSamples();
}

uint64_t IOReportCreateSamplesDelta()
{
  return _IOReportCreateSamplesDelta();
}

uint64_t IOReportCreateSubscription()
{
  return _IOReportCreateSubscription();
}

uint64_t IOReportIterate()
{
  return _IOReportIterate();
}

uint64_t IOReportPrune()
{
  return _IOReportPrune();
}

uint64_t IOReportStateGetCount()
{
  return _IOReportStateGetCount();
}

uint64_t IOReportStateGetDutyCycle()
{
  return _IOReportStateGetDutyCycle();
}

uint64_t IOReportStateGetNameForIndex()
{
  return _IOReportStateGetNameForIndex();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

id MTLCreateSystemDefaultDevice(void)
{
  return _MTLCreateSystemDefaultDevice();
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return _SSLRead(context, data, dataLength, processed);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return _SSLWrite(context, data, dataLength, processed);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _DYOLog()
{
  return __DYOLog();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t plist_filter(const void *a1)
{
  return plist_filter(a1);
}

uint64_t is_valid_plist_value(const void *a1)
{
  return is_valid_plist_value(a1);
}

void std::terminate(void)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t copy_metal_version()
{
  return _copy_metal_version();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t dy_abort()
{
  return _dy_abort();
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_get_securecontext()
{
  return _lockdown_get_securecontext();
}

uint64_t lockdown_get_socket()
{
  return _lockdown_get_socket();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
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

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

uint64_t secure_lockdown_checkin()
{
  return _secure_lockdown_checkin();
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return _send(a1, a2, a3, a4);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

kern_return_t task_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *t)
{
  return _task_for_pid(target_tport, pid, t);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLResult(void *a1, const char *a2, ...)
{
  return [a1 BOOLResult];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_cacheInferiorAppIdentifier(void *a1, const char *a2, ...)
{
  return [a1 cacheInferiorAppIdentifier];
}

id objc_msgSend_capturingInferior(void *a1, const char *a2, ...)
{
  return [a1 capturingInferior];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return [a1 connected];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_destroySharedMemoryTransport(void *a1, const char *a2, ...)
{
  return [a1 destroySharedMemoryTransport];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_future(void *a1, const char *a2, ...)
{
  return [a1 future];
}

id objc_msgSend_graphicsAPIInfo(void *a1, const char *a2, ...)
{
  return [a1 graphicsAPIInfo];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inferiorPid(void *a1, const char *a2, ...)
{
  return [a1 inferiorPid];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interposeDylibPath(void *a1, const char *a2, ...)
{
  return [a1 interposeDylibPath];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAppleInternal(void *a1, const char *a2, ...)
{
  return [a1 isAppleInternal];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return [a1 kind];
}

id objc_msgSend_lastStatsReport(void *a1, const char *a2, ...)
{
  return [a1 lastStatsReport];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_objectPayload(void *a1, const char *a2, ...)
{
  return [a1 objectPayload];
}

id objc_msgSend_observeInferior(void *a1, const char *a2, ...)
{
  return [a1 observeInferior];
}

id objc_msgSend_ownsInferior(void *a1, const char *a2, ...)
{
  return [a1 ownsInferior];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scheduleReadOnWritableSocket(void *a1, const char *a2, ...)
{
  return [a1 scheduleReadOnWritableSocket];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return [a1 setup];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_sharegroup(void *a1, const char *a2, ...)
{
  return [a1 sharegroup];
}

id objc_msgSend_shouldLoadCapture(void *a1, const char *a2, ...)
{
  return [a1 shouldLoadCapture];
}

id objc_msgSend_shouldLoadDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 shouldLoadDiagnostics];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startCollectingStats(void *a1, const char *a2, ...)
{
  return [a1 startCollectingStats];
}

id objc_msgSend_stopCollectingStats(void *a1, const char *a2, ...)
{
  return [a1 stopCollectingStats];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}