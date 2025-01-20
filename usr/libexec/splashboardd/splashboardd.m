void sub_10000208C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void block[4];
  id v6;

  v2 = [*(id *)(a1 + 32) _transactionWorkForClient:*(void *)(a1 + 40)];
  v3 = [v2 contextWrapper];
  v4 = v3;
  if (v3)
  {
    [v3 invalidate];
    [v2 setContextWrapper:0];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000243C;
  block[3] = &unk_10000C730;
  v6 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

intptr_t sub_10000243C(uint64_t a1)
{
  +[CATransaction flush];
  v2 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v2);
}

id sub_1000024CC()
{
  if (qword_100011520 != -1) {
    dispatch_once(&qword_100011520, &stru_10000C5A8);
  }
  v0 = (void *)qword_100011518;

  return v0;
}

void sub_100002520(id a1)
{
  qword_100011518 = (uint64_t)os_log_create("com.apple.SplashBoard", "Snapshot");

  _objc_release_x1();
}

id sub_100002564()
{
  if (qword_100011530 != -1) {
    dispatch_once(&qword_100011530, &stru_10000C5C8);
  }
  v0 = (void *)qword_100011528;

  return v0;
}

void sub_1000025B8(id a1)
{
  qword_100011528 = (uint64_t)os_log_create("com.apple.SplashBoard", "Memory");

  _objc_release_x1();
}

id sub_1000025FC()
{
  if (qword_100011540 != -1) {
    dispatch_once(&qword_100011540, &stru_10000C5E8);
  }
  v0 = (void *)qword_100011538;

  return v0;
}

void sub_100002650(id a1)
{
  qword_100011538 = (uint64_t)os_log_create("com.apple.SplashBoard", "FetchRequests");

  _objc_release_x1();
}

id sub_100002694()
{
  if (qword_100011550 != -1) {
    dispatch_once(&qword_100011550, &stru_10000C608);
  }
  v0 = (void *)qword_100011548;

  return v0;
}

void sub_1000026E8(id a1)
{
  qword_100011548 = (uint64_t)os_log_create("com.apple.SplashBoard", "SnapshotReaper");

  _objc_release_x1();
}

id sub_10000272C()
{
  if (qword_100011560 != -1) {
    dispatch_once(&qword_100011560, &stru_10000C628);
  }
  v0 = (void *)qword_100011558;

  return v0;
}

void sub_100002780(id a1)
{
  qword_100011558 = (uint64_t)os_log_create("com.apple.SplashBoard", "DaemonLifecycle");

  _objc_release_x1();
}

id sub_1000027C4()
{
  if (qword_100011570 != -1) {
    dispatch_once(&qword_100011570, &stru_10000C648);
  }
  v0 = (void *)qword_100011568;

  return v0;
}

void sub_100002818(id a1)
{
  qword_100011568 = (uint64_t)os_log_create("com.apple.SplashBoard", "Capture");

  _objc_release_x1();
}

id sub_10000285C()
{
  if (qword_100011580 != -1) {
    dispatch_once(&qword_100011580, &stru_10000C668);
  }
  v0 = (void *)qword_100011578;

  return v0;
}

void sub_1000028B0(id a1)
{
  qword_100011578 = (uint64_t)os_log_create("com.apple.SplashBoard", "FileManifest");

  _objc_release_x1();
}

id sub_1000028F4()
{
  if (qword_100011590 != -1) {
    dispatch_once(&qword_100011590, &stru_10000C688);
  }
  v0 = (void *)qword_100011588;

  return v0;
}

void sub_100002948(id a1)
{
  qword_100011588 = (uint64_t)os_log_create("com.apple.SplashBoard", "Purge");

  _objc_release_x1();
}

id sub_10000298C()
{
  if (qword_1000115A0 != -1) {
    dispatch_once(&qword_1000115A0, &stru_10000C6A8);
  }
  v0 = (void *)qword_100011598;

  return v0;
}

void sub_1000029E0(id a1)
{
  qword_100011598 = (uint64_t)os_log_create("com.apple.SplashBoard", "Common");

  _objc_release_x1();
}

uint64_t sub_100002B74(uint64_t result)
{
  if (result)
  {
    if (result == 2) {
      return __UIAppStatusBarDefaultDoubleHeight();
    }
    else {
      return __UIAppStatusBarDefaultHeight();
    }
  }
  return result;
}

void sub_1000032D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  if (a2 == 1)
  {
    id v15 = objc_begin_catch(exception_object);
    if (a14)
    {
      *a14 = [v14 _errorForParsingException:v15 bundleID:a13];
    }

    objc_end_catch();
    JUMPOUT(0x1000031F8);
  }
  _Unwind_Resume(exception_object);
}

void sub_100003920(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23)
{
  if (a2 == 1)
  {
    id v23 = objc_begin_catch(exception_object);
    if (a19)
    {
      id v24 = objc_alloc((Class)XBLaunchImageError);
      v26 = [v23 description];
      v25 = +[NSString stringWithFormat:@"Exception thrown during configuration load: %@"];
      *a19 = [v24 initWithCode:2 bundleID:a21 reason:v25 fatal:0];
    }
    objc_end_catch();
    JUMPOUT(0x1000038BCLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_100003DA8(void *a1)
{
  id v1 = a1;
  v2 = [v1 subviews];

  if (v2)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    v3 = [v1 subviews];
    id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          sub_100003DA8(*(void *)(*((void *)&v8 + 1) + 8 * (void)v7));
          v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
  [v1 setSemanticContentAttribute:4];
}

void sub_100004508(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    id v10 = objc_begin_catch(exception_object);
    id v11 = objc_alloc((Class)XBLaunchImageError);
    v12 = [*(id *)(v9 + 32) bundleIdentifier];
    id v15 = [v10 description];
    v13 = +[NSString stringWithFormat:@"Exception thrown during display: %@"];
    id v14 = [v11 initWithCode:7 bundleID:v12 reason:v13 fatal:1];

    objc_end_catch();
    if (!v14) {
      JUMPOUT(0x100004388);
    }
    JUMPOUT(0x100004334);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000054B4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t start()
{
  v2 = +[XBLaunchImageProviderServer sharedInstance];
  [v2 run];

  v3 = +[NSRunLoop mainRunLoop];
  [v3 run];

  return 0xFFFFFFFFLL;
}

void sub_1000055C8(id a1)
{
  id v1 = objc_alloc_init(XBLaunchImageProviderServer);
  qword_1000115A8 = (uint64_t)v1;

  _objc_release_x1(v1);
}

void sub_10000577C(id a1)
{
  if (!+[NSThread isMainThread])
  {
    id v1 = +[NSAssertionHandler currentHandler];
    v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[XBLaunchImageProviderServer run]_block_invoke");
    [v1 handleFailureInFunction:v2 file:@"XBLaunchImageProviderServer.m" lineNumber:96 description:@"this call must be made on the main thread"];
  }
  qword_1000115C0 = (uint64_t)pthread_self();
}

void sub_100005810(id a1)
{
  id v1 = +[NSDate date];
  v2 = sub_10000272C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Warming up", (uint8_t *)&v11, 2u);
  }

  id v3 = +[NSBundle mainBundle];
  id v4 = +[NSLocale currentLocale];
  id v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = +[UIScreen mainScreen];
  +[UIKeyboard usesInputSystemUI];
  objc_opt_class();
  id v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  UIAnimationDragCoefficient();
  +[UIWindow setShouldRestrictViewsForSplashboard:1];
  +[UIWindow setRestrictedSplashboardClasses:&off_10000CC08];

  id v8 = sub_1000027C4();
  _XBDebugCaptureIsEnabled();
  uint64_t v9 = sub_10000272C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [v1 timeIntervalSinceNow];
    int v11 = 134217984;
    double v12 = -v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Warm-up complete after %.3fs", (uint8_t *)&v11, 0xCu);
  }
}

void sub_100006028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 160), 8);
  _Block_object_dispose((const void *)(v37 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006084(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100006094(uint64_t a1)
{
}

void sub_10000609C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 96))
  {
    if (*(unsigned char *)(a1 + 97)) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  id v7 = *(void **)(v6 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v10 = *(void *)(*(void *)(a1 + 80) + 8);
  id v12 = *(id *)(v10 + 40);
  id obj = v7;
  unsigned int v11 = [v4 _onMain_createLaunchWindowForClient:v5 withLaunchRequest:v8 appInfo:v9 captureInfo:&obj captureOptions:v3 error:&v12];
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_storeStrong((id *)(v10 + 40), v12);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v11;
  pthread_dependency_fulfill_np();
}

void sub_100006164(uint64_t a1, void *a2)
{
  id v7 = a2;
  xpc_dictionary_set_int64(v7, XBLaunchImageProviderMessageKeyContextID, *(unsigned int *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v3)
  {
    id v4 = [v3 bs_secureEncoded];
    BSSerializeDataToXPCDictionaryWithKey();
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v5)
    {
      uint64_t v6 = [v5 bs_secureEncoded];
      BSSerializeDataToXPCDictionaryWithKey();
    }
  }
}

_DWORD *sub_1000068CC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 24);
  *(_DWORD *)(v2 + 24) = dispatch_source_get_data(*(dispatch_source_t *)(v2 + 16));
  result = *(_DWORD **)(a1 + 32);
  int v5 = result[6];
  if (v3 != v5)
  {
    if (v5 == 16)
    {
      CFStringRef v6 = @"ProcessMemoryWarning";
    }
    else
    {
      if (v5 != 32) {
        return result;
      }
      CFStringRef v6 = @"ProcessMemoryCritical";
    }
    return [result _publishMemoryReportForPressureType:v6];
  }
  return result;
}

void sub_100006B04(uint64_t a1, void *a2)
{
  uint64_t v3 = kSymptomDiagnosticReplySuccess;
  id v4 = a2;
  if (objc_msgSend(v4, "bs_BOOLForKey:", v3))
  {
    int v5 = [v4 objectForKeyedSubscript:kSymptomDiagnosticReplySessionID];

    CFStringRef v6 = sub_100002564();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100007044(a1, (uint64_t)v5, v6);
    }
  }
  else
  {
    id v7 = [v4 bs_safeNumberForKey:@"reason"];

    id v8 = [v7 longValue];
    int v5 = sub_100002564();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000070D0(a1, (uint64_t)v8, v5);
    }
  }
}

void sub_100006CF4(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "[%@] unsupported configuration found in xib - ignoring UIWindow", buf, 0xCu);
}

void sub_100006D50()
{
  sub_1000054D0();
  sub_1000054B4((void *)&_mh_execute_header, v0, v1, "launchInterface: no bundle", v2, v3, v4, v5, v6);
}

void sub_100006D84()
{
  sub_1000054D0();
  sub_1000054B4((void *)&_mh_execute_header, v0, v1, "launchInterface: isStoryboard", v2, v3, v4, v5, v6);
}

void sub_100006DB8()
{
  sub_1000054D0();
  sub_1000054B4((void *)&_mh_execute_header, v0, v1, "launchInterface: isXIB", v2, v3, v4, v5, v6);
}

void sub_100006DEC()
{
  sub_1000054D0();
  sub_1000054B4((void *)&_mh_execute_header, v0, v1, "launchInterface: isConfiguration", v2, v3, v4, v5, v6);
}

void sub_100006E20()
{
  sub_1000054D0();
  sub_1000054B4((void *)&_mh_execute_header, v0, v1, "launchInterface: unsupported", v2, v3, v4, v5, v6);
}

void sub_100006E54()
{
  sub_1000054DC();
  __int16 v3 = v0;
  uint64_t v4 = 25000000;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "[%@] estimated size (%zu) is over limit (%zu); proceeding to capture under set default",
    v2,
    0x20u);
}

void sub_100006EDC()
{
  sub_1000054DC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "[%@] calculated size: %zu", v1, 0x16u);
}

void sub_100006F54(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Not an allowed client %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100006FCC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error getting process memory while processing bundleID: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100007044(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Memory pressure event: %{public}@. Published with sessionID: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_1000070D0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  __int16 v6 = [*(id *)(a1 + 40) description];
  int v7 = 138543874;
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  __int16 v11 = 2114;
  id v12 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Memory pressure event: %{public}@. Not published for reason code: %ld. Memory history: %{public}@", (uint8_t *)&v7, 0x20u);
}

uint64_t BSAuditTokenRepresentsPlatformBinary()
{
  return _BSAuditTokenRepresentsPlatformBinary();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return _BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
}

uint64_t BSPIDForXPCConnection()
{
  return _BSPIDForXPCConnection();
}

uint64_t BSProcessDescriptionForPID()
{
  return _BSProcessDescriptionForPID();
}

uint64_t BSPthreadGetCurrentPriority()
{
  return _BSPthreadGetCurrentPriority();
}

uint64_t BSRectWithSize()
{
  return _BSRectWithSize();
}

uint64_t BSSerializeDataToXPCDictionaryWithKey()
{
  return _BSSerializeDataToXPCDictionaryWithKey();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return _CGImageGetAlphaInfo(image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return _CGImageGetBitsPerPixel(image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return _CGImageGetBytesPerRow(image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

uint64_t CGImageGetImageProvider()
{
  return _CGImageGetImageProvider();
}

CFTypeID CGImageGetTypeID(void)
{
  return _CGImageGetTypeID();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

uint64_t CGImageProviderCopyIOSurface()
{
  return _CGImageProviderCopyIOSurface();
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return _IOSurfaceGetTypeID();
}

uint64_t UIAnimationDragCoefficient()
{
  return _UIAnimationDragCoefficient();
}

uint64_t UIRectInset()
{
  return _UIRectInset();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSFullMethodName()
{
  return __NSFullMethodName();
}

uint64_t _UIAppSetStatusBarHeight()
{
  return __UIAppSetStatusBarHeight();
}

uint64_t _UIAppSetStatusBarOrientation()
{
  return __UIAppSetStatusBarOrientation();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _XBDebugCaptureIsEnabled()
{
  return __XBDebugCaptureIsEnabled();
}

uint64_t _XBPreparedLaunchInterfaceForCapture()
{
  return __XBPreparedLaunchInterfaceForCapture();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return _dispatch_source_get_data(source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t pthread_dependency_fulfill_np()
{
  return _pthread_dependency_fulfill_np();
}

uint64_t pthread_dependency_init_np()
{
  return _pthread_dependency_init_np();
}

uint64_t pthread_dependency_wait_np()
{
  return _pthread_dependency_wait_np();
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return _task_info(target_task, flavor, task_info_out, task_info_outCnt);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

id objc_msgSend__configureNewWindow(void *a1, const char *a2, ...)
{
  return [a1 _configureNewWindow];
}

id objc_msgSend__getProcessMemoryUsed(void *a1, const char *a2, ...)
{
  return [a1 _getProcessMemoryUsed];
}

id objc_msgSend__setupProcessMemoryPressureMonitor(void *a1, const char *a2, ...)
{
  return [a1 _setupProcessMemoryPressureMonitor];
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return [a1 _update];
}

id objc_msgSend__updateUserInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 _updateUserInterfaceIdiom];
}

id objc_msgSend__userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 _userInterfaceIdiom];
}

id objc_msgSend_allocationSize(void *a1, const char *a2, ...)
{
  return [a1 allocationSize];
}

id objc_msgSend_bars(void *a1, const char *a2, ...)
{
  return [a1 bars];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return [a1 bundlePath];
}

id objc_msgSend_capInsets(void *a1, const char *a2, ...)
{
  return [a1 capInsets];
}

id objc_msgSend_captureInformation(void *a1, const char *a2, ...)
{
  return [a1 captureInformation];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_colorName(void *a1, const char *a2, ...)
{
  return [a1 colorName];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_contents(void *a1, const char *a2, ...)
{
  return [a1 contents];
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return [a1 contextID];
}

id objc_msgSend_contextWrapper(void *a1, const char *a2, ...)
{
  return [a1 contextWrapper];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_customSafeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 customSafeAreaInsets];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageName(void *a1, const char *a2, ...)
{
  return [a1 imageName];
}

id objc_msgSend_imageRespectsSafeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 imageRespectsSafeAreaInsets];
}

id objc_msgSend_instantiateInitialViewController(void *a1, const char *a2, ...)
{
  return [a1 instantiateInitialViewController];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isConfiguration(void *a1, const char *a2, ...)
{
  return [a1 isConfiguration];
}

id objc_msgSend_isFatal(void *a1, const char *a2, ...)
{
  return [a1 isFatal];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isStoryboard(void *a1, const char *a2, ...)
{
  return [a1 isStoryboard];
}

id objc_msgSend_isXIB(void *a1, const char *a2, ...)
{
  return [a1 isXIB];
}

id objc_msgSend_launchInterfaceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 launchInterfaceIdentifier];
}

id objc_msgSend_launchesOpaque(void *a1, const char *a2, ...)
{
  return [a1 launchesOpaque];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_naturalSize(void *a1, const char *a2, ...)
{
  return [a1 naturalSize];
}

id objc_msgSend_navigationBarImageName(void *a1, const char *a2, ...)
{
  return [a1 navigationBarImageName];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_realToken(void *a1, const char *a2, ...)
{
  return [a1 realToken];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return [a1 setNeedsUpdateConstraints];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_statusBarState(void *a1, const char *a2, ...)
{
  return [a1 statusBarState];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_succinctDescription(void *a1, const char *a2, ...)
{
  return [a1 succinctDescription];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_tabBarImageName(void *a1, const char *a2, ...)
{
  return [a1 tabBarImageName];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_toolbarImageName(void *a1, const char *a2, ...)
{
  return [a1 toolbarImageName];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_unload(void *a1, const char *a2, ...)
{
  return [a1 unload];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_usesInputSystemUI(void *a1, const char *a2, ...)
{
  return [a1 usesInputSystemUI];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}