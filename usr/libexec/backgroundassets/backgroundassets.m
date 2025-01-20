id sub_1000055C4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t vars8;

  v2 = a2;
  self;
  v3 = objc_opt_new();
  v4 = sub_100005A3C();
  v5 = [v4 objectForKey:v2];

  if (v5)
  {
    v6 = [v5 objectForKey:@"BAEssentialMaxInstallSize"];
    [v3 setEssentialMaxInstallSize:v6];

    v7 = [v5 objectForKey:@"BAMaxInstallSize"];
    [v3 setMaxInstallSize:v7];

    v8 = [v5 objectForKey:@"BAEssentialDownloadAllowance"];
    [v3 setEssentialDownloadAllowance:v8];

    v9 = [v5 objectForKey:@"BADownloadAllowance"];
    [v3 setDownloadAllowance:v9];

    v10 = [v5 objectForKey:@"BAManifestURL"];
    [v3 setManifestURL:v10];

    v11 = [v5 objectForKey:@"BADownloadDomainAllowList"];
    [v3 setDomainAllowlist:v11];
  }

  return v3;
}

BOOL sub_100005768(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  self;
  v6 = sub_100005A3C();
  v7 = v6;
  if (v4)
  {
    v8 = +[NSMutableDictionary dictionary];
    v9 = [v4 manifestURL];

    if (v9)
    {
      v10 = [v4 manifestURL];
      [v8 setValue:v10 forKey:@"BAManifestURL"];
    }
    v11 = [v4 domainAllowlist];

    if (v11)
    {
      v12 = [v4 domainAllowlist];
      [v8 setValue:v12 forKey:@"BADownloadDomainAllowList"];
    }
    v13 = [v4 essentialMaxInstallSize];

    if (v13)
    {
      v14 = [v4 essentialMaxInstallSize];
      [v8 setValue:v14 forKey:@"BAEssentialMaxInstallSize"];
    }
    v15 = [v4 maxInstallSize];

    if (v15)
    {
      v16 = [v4 maxInstallSize];
      [v8 setValue:v16 forKey:@"BAMaxInstallSize"];
    }
    v17 = [v4 essentialDownloadAllowance];

    if (v17)
    {
      v18 = [v4 essentialDownloadAllowance];
      [v8 setValue:v18 forKey:@"BAEssentialDownloadAllowance"];
    }
    v19 = [v4 downloadAllowance];

    if (v19)
    {
      v20 = [v4 downloadAllowance];
      [v8 setValue:v20 forKey:@"BADownloadAllowance"];
    }
    [v7 setValue:v8 forKey:v5];
  }
  else
  {
    [v6 removeObjectForKey:v5];
  }
  CFPreferencesSetAppValue(@"InternalAppOverrides", v7, @"com.apple.backgroundassets");
  BOOL v21 = CFPreferencesAppSynchronize(@"com.apple.backgroundassets") != 0;

  return v21;
}

id sub_100005A3C()
{
  self;
  v0 = (void *)CFPreferencesCopyAppValue(@"InternalAppOverrides", @"com.apple.backgroundassets");
  v1 = v0;
  if (v0)
  {
    id v2 = [v0 mutableCopy];
  }
  else
  {
    id v2 = +[NSMutableDictionary dictionary];
  }
  v3 = v2;

  return v3;
}

void sub_100005B64(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_100005BE0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100005C5C(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_10000672C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_10000677C(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleChallenge:v6 authenticationHandler:v5];
}

void sub_1000067F4(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _handleChallenge:v6 authenticationHandler:v5];
}

void sub_10000686C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 downloadDidBegin:*(void *)(a1 + 32)];
}

void sub_1000068C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleProgressWithBytesReceived:a2 totalBytesRecieved:a3 totalDownloadSize:a4 resuming:a5];
}

void sub_100006930(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = v15;
  if (v11)
  {
    os_unfair_lock_lock((os_unfair_lock_t)[*(id *)(a1 + 32) downloadLock]);
    if (!sub_1000333AC(*(void **)(a1 + 32))
      && (*(unsigned char *)(a1 + 40) || [*(id *)(a1 + 32) necessity] != (id)1)
      || (id v17 = [*(id *)(a1 + 32) amountDownloaded], v17 == (id)sub_1000333AC(*(void **)(a1 + 32))))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)[*(id *)(a1 + 32) downloadLock]);
      [*(id *)(a1 + 32) _handleDownloadCompletionWithFileLocation:v11 response:v13];
    }
    else
    {
      [*(id *)(a1 + 32) setStopRequest:0];
      os_unfair_lock_unlock((os_unfair_lock_t)[*(id *)(a1 + 32) downloadLock]);
      v18 = +[NSFileManager defaultManager];
      [v18 removeItemAtURL:v11 error:0];

      v19 = sub_100029CFC(@"BAURLDownloadErrorDomain", 101);
      [*(id *)(a1 + 32) _handleDownloadFailureWithError:v19 resumeData:0 response:0];
    }
LABEL_15:

    return;
  }
  if (!v12)
  {
    v20 = [v15 domain];
    unsigned int v21 = [v20 isEqualToString:@"BAURLSessionErrorDomain"];

    if (v21)
    {
      if ([v16 code] == (id)100)
      {
        v29[0] = @"HTTPResponseStatusCode";
        v28 = [v16 userInfo];
        v22 = [v28 objectForKey:@"ResponseStatusCode"];
        v29[1] = @"HTTPResponseHeaders";
        v30[0] = v22;
        v23 = [v16 userInfo];
        v24 = [v23 objectForKey:@"ResponseHTTPHeaders"];
        v30[1] = v24;
        v25 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];

        uint64_t v26 = sub_100029D04(@"BAURLDownloadErrorDomain", 100, v25);

        v16 = (void *)v26;
      }
      else if ([v16 code] == (id)108)
      {
        [*(id *)(a1 + 32) setStopRequest:6];
      }
    }
    [*(id *)(a1 + 32) _handleDownloadFailureWithError:v16 resumeData:v14 response:v13];
    goto LABEL_15;
  }
  v27 = sub_100013C84();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
    sub_100038658(a1, (uint64_t)v12, v27);
  }

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_1000385D0();
  }
  qword_1000694C8 = (uint64_t)"BUG IN BackgroundAssets: BAURLDownload returned an NSData, which is highly unexpected.";
  qword_1000694F8 = 6;
  __break(1u);
}

void sub_100006F04(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100007608(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 downloadDidPause:*(void *)(a1 + 32)];
}

void sub_10000777C(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  id v2 = *(void **)(a1 + 32);
  v3 = [v2 downloadError];
  [v4 download:v2 failedWithError:v3];
}

void sub_1000078E8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100007990(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100007A40(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100007AF0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100009604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

id sub_100009630(uint64_t a1)
{
  id v2 = sub_100013B54();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000387E4(a1, v2);
  }

  return [*(id *)(a1 + 40) invalidate];
}

void sub_100009684(uint64_t a1)
{
  id v2 = sub_100013B54();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Extension invalidated for identifier: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  if (*(void *)(a1 + 40))
  {
    id v4 = +[BAAgentCore sharedCore];
    [v4 extensionDisconnectedWithIdentifier:*(void *)(a1 + 32) connectionProxy:*(void *)(a1 + 40)];
  }
}

void sub_100009754(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100013B54();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100038860((uint64_t)v3, v4);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_1000097BC(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000099CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100013B54();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100038980();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = +[NSSet set];
  (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v6);

  [*(id *)(a1 + 32) _checkForExit];
}

id sub_100009A6C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 _checkForExit];
}

void sub_100009C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009C48(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  id v4 = sub_100013B54();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100038A28();
  }

  [*(id *)(a1 + 32) _checkForExit];
}

id sub_100009CC0(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 _checkForExit];
}

void sub_100009D9C(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = sub_100013B54();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100038AD0();
  }
}

void sub_100009F60(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100013B54();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100038B78();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _checkForExit];
}

id sub_100009FE0(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 _checkForExit];
}

void sub_10000A184(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_100013B54();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100038C20();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) _checkForExit];
}

id sub_10000A204(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = *(void **)(a1 + 32);

  return [v2 _checkForExit];
}

id sub_10000A52C(uint64_t a1)
{
  [*(id *)(a1 + 32) setSentWillTerminateMessage:0];
  id v2 = *(void **)(a1 + 32);
  id v3 = (char *)[v2 extensionActiveCalls] + 1;

  return [v2 setExtensionActiveCalls:v3];
}

id sub_10000A604(uint64_t a1)
{
  if ([*(id *)(a1 + 32) extensionActiveCalls]) {
    [*(id *)(a1 + 32) setExtensionActiveCalls:((char *)[*(id *)(a1 + 32) extensionActiveCalls]) - 1];
  }
  id result = [*(id *)(a1 + 32) extensionActiveCalls];
  if (!result)
  {
    id v3 = *(void **)(a1 + 32);
    return [v3 _startExitTimer];
  }
  return result;
}

void sub_10000A734(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) extensionActiveCalls];
  id v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    if ([v3 sentWillTerminateMessage]) {
      return;
    }
LABEL_9:
    [*(id *)(a1 + 32) setSentWillTerminateMessage:1];
    [*(id *)(a1 + 32) extensionWillTerminate];
    dispatch_time_t v6 = dispatch_time(0, 5000000000);
    v7 = [*(id *)(a1 + 32) shutdownQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A884;
    block[3] = &unk_10005C998;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v6, v7, block);

    return;
  }
  id v8 = [v3 applicationInfo];
  [v8 extensionRuntime];
  if (v4 >= 600.0)
  {
    unsigned __int8 v5 = [*(id *)(a1 + 32) sentWillTerminateMessage];

    if (v5) {
      return;
    }
    goto LABEL_9;
  }
}

void sub_10000A884(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) extensionActiveCalls];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    id v7 = [v3 applicationInfo];
    [v7 extensionRuntime];
    if (v4 < 600.0)
    {

      return;
    }
    unsigned __int8 v6 = [*(id *)(a1 + 32) sentTerminatonMessage];

    if (v6) {
      return;
    }
  }
  else if ([v3 sentTerminatonMessage])
  {
    return;
  }
  [*(id *)(a1 + 32) setSentTerminatonMessage:1];
  unsigned __int8 v5 = *(void **)(a1 + 32);

  [v5 invalidate];
}

void sub_10000AD90(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) extensionWakeAssertions])
  {
    id v2 = *v1;
    id v3 = (char *)[v2 extensionWakeAssertions] - 1;
    [v2 setExtensionWakeAssertions:v3];
  }
  else
  {
    double v4 = sub_100013B54();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100038CC8(v1, v4);
    }
  }
}

id sub_10000AEC8(uint64_t a1)
{
  [*(id *)(a1 + 32) setSentWillTerminateMessage:0];
  [*(id *)(a1 + 32) setExtensionActiveCalls:((char *)[*(id *)(a1 + 32) extensionActiveCalls] + 1)];
  id v2 = *(void **)(a1 + 32);
  id v3 = (char *)[v2 extensionWakeAssertions] + 1;

  return [v2 setExtensionWakeAssertions:v3];
}

void sub_10000B080(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t sub_10000B0AC()
{
  return v0;
}

uint64_t sub_10000B0B8(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

void sub_10000B4B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_10000B4D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained terminationAssertion];
  [v3 removeObserver:*(void *)(a1 + 32)];

  double v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

void start()
{
  v1 = +[NSRunLoop mainRunLoop];
  id v2 = +[NSPort port];
  [v1 addPort:v2 forMode:NSRunLoopCommonModes];

  +[BAAgentCore sharedCore];
  objc_claimAutoreleasedReturnValue();
  while (1)
  {
    [v1 run];
  }
}

void sub_10000BB84(id a1)
{
  uint64_t v1 = sub_100019AD4();
  id v2 = (void *)qword_100069500;
  qword_100069500 = v1;

  id v3 = (void *)qword_100069500;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  double v4 = +[NSArray arrayWithObjects:&v7 count:7];
  uint64_t v5 = [v3 setByAddingObjectsFromArray:v4, v7, v8, v9, v10, v11, v12];
  unsigned __int8 v6 = (void *)qword_100069500;
  qword_100069500 = v5;
}

void *sub_10000BDD8(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  if (!a1) {
    return 0;
  }
  id v9 = a5;
  id v10 = a4;
  uint64_t v11 = +[NSURLRequest requestWithURL:a2 cachePolicy:4 timeoutInterval:60.0];
  uint64_t v12 = [v9 applicationIdentifier];

  uint64_t v13 = +[NSUUID UUID];
  id v14 = [v13 UUIDString];
  id v15 = +[NSString stringWithFormat:@"%@.Manifest-%@", v12, v14];
  v19.receiver = a1;
  v19.super_class = (Class)BAManifestDownload;
  v16 = [super initWithIdentifier:v15 request:v11 essential:1 fileSize:0 applicationGroupIdentifier:v10 priority:1001];

  if (v16)
  {
    v16[24] = a3;
    if ((unint64_t)(a3 - 1) <= 1)
    {
      os_unfair_lock_lock((os_unfair_lock_t)[v16 downloadLock]);
      [v16 setIsForegroundDownload:1];
      os_unfair_lock_unlock((os_unfair_lock_t)[v16 downloadLock]);
    }
  }
  id v17 = v16;

  return v17;
}

uint64_t sub_10000C064(uint64_t result)
{
  if (result) {
    return *(void *)(result + 192);
  }
  return result;
}

id *sub_10000C53C(os_unfair_lock_s *a1)
{
  uint64_t v1 = (id *)a1;
  if (a1)
  {
    id v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    uint64_t v1 = (id *)v1[4];
    os_unfair_lock_unlock(v2);
  }

  return v1;
}

void *sub_10000C64C(void *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    v7.receiver = result;
    v7.super_class = (Class)BAAppStoreProgressInfoDescriptor;
    id result = [super init];
    if (result)
    {
      result[2] = a4;
      result[3] = a3;
      result[1] = a2;
    }
  }
  return result;
}

void sub_10000CC58(id a1)
{
  id v2 = +[LSApplicationWorkspace defaultWorkspace];
  uint64_t v1 = [v2 deviceIdentifierForVendor];
  [v1 getUUIDBytes:&unk_100069510];
}

CFStringRef sub_10000D158(unint64_t a1)
{
  if (a1 > 2) {
    return @"Unknown";
  }
  else {
    return *(&off_10005CBD0 + a1);
  }
}

void sub_10000ECE0(id a1, NSError *a2)
{
  id v2 = a2;
  id v3 = sub_100013B54();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100038F9C(v2, v3);
  }
}

void sub_10000EDD4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_10000F280(id a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v34 = a8;
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v36 = a5;
  id v18 = a6;
  id v19 = a7;
  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v15 length])
    {
      v20 = +[NSException exceptionWithName:NSInvalidArgumentException, @"NSString *  must be a valid unique string.", 0, v34 reason userInfo];
      [v20 raise];
    }
    if (([v16 isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      unsigned int v21 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Provided query must be a valid CKQuery." userInfo:0];
      [v21 raise];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v17 length])
    {
      v22 = +[NSException exceptionWithName:NSInvalidArgumentException, @"Provided assetKey must be a valid string.", 0, v34 reason userInfo];
      [v22 raise];
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || ![v18 length])
    {
      v23 = +[NSException exceptionWithName:NSInvalidArgumentException, @"Provided containerIdentifier must be a valid string.", 0, v34 reason userInfo];
      [v23 raise];
    }
    if (([v19 isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      v24 = +[NSException exceptionWithName:NSInvalidArgumentException reason:@"Provided CKRecordZoneID must be a valid object." userInfo:0];
      [v24 raise];
    }
    v37.receiver = a1;
    v37.super_class = (Class)BACloudKitDownload;
    v25 = v36;
    a1 = [super initPrivatelyWithApplicationGroupIdentifier:v36, v34];
    if (a1)
    {
      uint64_t v26 = SecTaskCreateFromSelf(kCFAllocatorDefault);
      if (v26)
      {
        v27 = v26;
        CFStringRef v28 = (const __CFString *)SecTaskCopyValueForEntitlement(v26, @"com.apple.developer.icloud-container-environment", 0);
        if (v28)
        {
          CFStringRef v29 = v28;
          CFTypeID v30 = CFGetTypeID(v28);
          if (v30 == CFStringGetTypeID())
          {
            uint64_t v31 = 1;
            if (CFStringCompare(v29, @"production", 1uLL)) {
              uint64_t v31 = 2;
            }
          }
          else
          {
            uint64_t v31 = 2;
          }
          CFRelease(v29);
        }
        else
        {
          uint64_t v31 = 2;
        }
        CFRelease(v27);
        v25 = v36;
      }
      else
      {
        uint64_t v31 = 2;
      }
      [a1 setIdentifier:v15];
      [a1 setPriority:a9];
      id v32 = [objc_alloc((Class)CKContainerID) initWithContainerIdentifier:v18 environment:v31];
      [a1 setContainerID:v32];

      [a1 setQuery:v16];
      [a1 setAssetKey:v17];
      [a1 setZoneID:v19];
      [a1 setDatabaseScope:v35];
    }
  }
  else
  {
    v25 = v36;
  }

  return a1;
}

void sub_10000FCD8(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_10000FD90(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_10000FF44(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
  id v2 = [*(id *)(a1 + 32) awaitingConnectivityTimer];
  id v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    double v4 = sub_100013C84();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v6 = *(void *)(a1 + 56);
      int v8 = 138543618;
      uint64_t v9 = v5;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "BAURLSession: Task %{public}@ timed out waiting for connectivity after %.1f seconds.", (uint8_t *)&v8, 0x16u);
    }

    objc_super v7 = +[NSError errorWithDomain:@"BAURLSessionErrorDomain" code:108 userInfo:0];
    [*(id *)(a1 + 32) setMostRecentError:v7];

    [*(id *)(a1 + 48) cancel];
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  [*(id *)(a1 + 32) setAwaitingConnectivityTimer:0];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 16));
}

void sub_10001049C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock)
{
}

void sub_1000104C8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = 0;
}

void sub_1000112C0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1000114B0(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 56) + 16))();
}

void sub_100011600(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 56) + 16))();
}

void sub_1000116DC(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 56) + 16))();
}

void sub_100011A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011A88(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = *(id *)(a1 + 32);
  if (v5) {
    BOOL v6 = WeakRetained == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    objc_super v7 = [(os_unfair_lock_s *)WeakRetained awaitingConnectivityTimer];

    if (!v7)
    {
      dispatch_time_t v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
      dispatch_source_set_timer(v5, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      [(os_unfair_lock_s *)WeakRetained setAwaitingConnectivityTimer:v5];
      dispatch_resume(v5);

      uint64_t v5 = 0;
    }
    os_unfair_lock_unlock(WeakRetained + 4);
  }
  if (v5)
  {
    dispatch_source_set_event_handler(v5, 0);
    dispatch_resume(v5);
    dispatch_source_cancel(v5);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100011D04(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 56);
  double v4 = (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 48) + 16))();
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
}

void sub_100012428(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 baURLSessionDelegate];
  [v4 cancelWithResumeData:v3];
}

void sub_1000129A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000129C0(uint64_t a1)
{
  uint64_t v11 = NSURLErrorFailingURLErrorKey;
  id v2 = [*(id *)(a1 + 32) URL];
  uint64_t v12 = v2;
  id v3 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    uint64_t v4 = 107;
  }
  else {
    uint64_t v4 = 106;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012AF8;
  v7[3] = &unk_10005CD60;
  uint64_t v5 = *(NSObject **)(a1 + 40);
  id v9 = *(id *)(a1 + 48);
  uint64_t v10 = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void sub_100012AF8(void *a1)
{
  uint64_t v3 = a1[5];
  uint64_t v4 = +[NSError errorWithDomain:@"BAURLSessionErrorDomain" code:a1[6] userInfo:a1[4]];
  (*(void (**)(uint64_t, void, void, void, void, void *))(v3 + 16))(v3, 0, 0, 0, 0, v4);
}

id *sub_100012D0C(id *a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)BAAppStorePrepareDescriptor;
    uint64_t v10 = (id *)[super init];
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      a1[4] = a4;
    }
  }

  return a1;
}

id *sub_1000130C8(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10 = a2;
  id v11 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)BAAppStoreEventDescriptor;
    objc_super v12 = (id *)[v14 init];
    a1 = v12;
    if (v12)
    {
      objc_storeStrong(v12 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      a1[4] = a4;
      a1[5] = a5;
      *((_WORD *)a1 + 4) = 0;
    }
  }

  return a1;
}

id sub_100013ABC()
{
  if (qword_100069530 != -1) {
    dispatch_once(&qword_100069530, &stru_10005CDA8);
  }
  uint64_t v0 = (void *)qword_100069528;

  return v0;
}

void sub_100013B10(id a1)
{
  qword_100069528 = (uint64_t)os_log_create("com.apple.backgroundassets", "system");

  _objc_release_x1();
}

id sub_100013B54()
{
  if (qword_100069540 != -1) {
    dispatch_once(&qword_100069540, &stru_10005CDC8);
  }
  uint64_t v0 = (void *)qword_100069538;

  return v0;
}

void sub_100013BA8(id a1)
{
  qword_100069538 = (uint64_t)os_log_create("com.apple.backgroundassets", "client");

  _objc_release_x1();
}

id sub_100013BEC()
{
  if (qword_100069550 != -1) {
    dispatch_once(&qword_100069550, &stru_10005CDE8);
  }
  uint64_t v0 = (void *)qword_100069548;

  return v0;
}

void sub_100013C40(id a1)
{
  qword_100069548 = (uint64_t)os_log_create("com.apple.backgroundassets", "client_connection");

  _objc_release_x1();
}

id sub_100013C84()
{
  if (qword_100069560 != -1) {
    dispatch_once(&qword_100069560, &stru_10005CE08);
  }
  uint64_t v0 = (void *)qword_100069558;

  return v0;
}

void sub_100013CD8(id a1)
{
  qword_100069558 = (uint64_t)os_log_create("com.apple.backgroundassets", "download");

  _objc_release_x1();
}

void sub_100013F7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001446C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) token];
  [v2 drainSpecificWithToken:v3];

  uint64_t v4 = *(NSObject **)(a1 + 48);

  dispatch_source_cancel(v4);
}

void sub_1000145DC(_Unwind_Exception *a1)
{
}

void sub_1000145FC(void *a1)
{
}

void sub_1000147CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000147E4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000147F4(uint64_t a1)
{
}

void sub_1000147FC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  objc_super v7 = [v9 token];
  unsigned int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_100014A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100014A84(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  objc_super v7 = [v9 token];
  unsigned int v8 = [v7 isEqual:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_100014BC4(id a1, BABlock *a2, unint64_t a3, BOOL *a4)
{
}

void sub_100014E00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100014F1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100014FA0(id a1)
{
  uint64_t v1 = +[NSMutableSet set];
  id v2 = (void *)qword_100069568;
  qword_100069568 = v1;

  uint64_t v3 = (void *)qword_100069568;
  uint64_t v4 = sub_100019AD4();
  [v3 unionSet:v4];

  uint64_t v5 = (void *)qword_100069568;
  id v6 = +[BADownload classesForSerialization];
  [v5 unionSet:v6];

  objc_super v7 = (void *)qword_100069568;
  uint64_t v9 = objc_opt_class();
  unsigned int v8 = +[NSArray arrayWithObjects:&v9 count:1];
  [v7 addObjectsFromArray:v8];
}

int64_t sub_100016064(id a1, BADownload *a2, BADownload *a3)
{
  return [(BADownload *)a2 compare:a3];
}

uint64_t sub_100016C14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100016C28(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t sub_100016C3C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1000174D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) download:*(void *)(a1 + 40) failedWithError:*(void *)(a1 + 48)];
}

id sub_1000174E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) download:*(void *)(a1 + 40) failedWithError:*(void *)(a1 + 48)];
}

id sub_1000174F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) download:*(void *)(a1 + 40) failedWithError:*(void *)(a1 + 48)];
}

uint64_t sub_100017504(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000179EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_100029C00(101);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_100017A4C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_100029C00(109);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_100017AAC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  sub_100029C00(-110);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

uint64_t sub_100017B0C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100018364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001839C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000183AC(uint64_t a1)
{
}

void sub_1000183B4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  id v7 = [v12 state];
  id v8 = [v12 necessity];
  id v9 = [v12 necessity];
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v10 = v8 == (id)1;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10) {
    goto LABEL_9;
  }
  if (!*(unsigned char *)(a1 + 41) || v9) {
    goto LABEL_13;
  }
  if (v8 == (id)1) {
LABEL_9:
  }
    BOOL v11 = 0;
  else {
    BOOL v11 = *(unsigned char *)(a1 + 42) != 0;
  }
  if ((unint64_t)v7 <= 1 && !v11)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
LABEL_13:
}

id sub_10001848C(uint64_t a1)
{
  return [*(id *)(a1 + 32) download:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) failedWithError:*(void *)(a1 + 40)];
}

void sub_1000196B4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_1000196F4()
{
  [@"/var/mobile/tmp" stringByAppendingPathComponent:@"com.apple.backgroundassets"];
  memset(&v8, 0, sizeof(v8));
  id v0 = objc_claimAutoreleasedReturnValue();
  if (stat((const char *)objc_msgSend(v0, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0),
         &v8))
  {
    if (*__error() != 2)
    {
      uint64_t v1 = __error();
      strerror(*v1);
      id v2 = sub_100013ABC();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        sub_100039594();
      }

      goto LABEL_15;
    }
  }
  else
  {
    if ((v8.st_mode & 0xF000) == 0x4000) {
      goto LABEL_15;
    }
    uint64_t v3 = sub_100013ABC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100039508((uint64_t)v0, &v8.st_mode, v3);
    }
  }
  id v4 = v0;
  if (mkdir((const char *)[v4 fileSystemRepresentation], 0x1FDu))
  {
    uint64_t v5 = __error();
    strerror(*v5);
    id v6 = sub_100013ABC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000394A0();
    }
  }
  else
  {
    chmod((const char *)[v4 fileSystemRepresentation], 0x1FDu);
  }
LABEL_15:

  return v0;
}

uint64_t sub_100019888()
{
  if (qword_100069580 != -1) {
    dispatch_once(&qword_100069580, &stru_10005CFB8);
  }
  return byte_100069578;
}

void sub_1000198D0(id a1)
{
  size_t v2 = 8;
  uint64_t v3 = 0;
  if (sysctlbyname("security.mac.amfi.developer_mode_status", &v3, &v2, 0, 0))
  {
    uint64_t v1 = sub_100013ABC();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_1000395FC(v1);
    }
  }
  else
  {
    byte_100069578 = v3 == 1;
  }
}

BOOL sub_10001995C()
{
  self;
  if (!CFPreferencesAppSynchronize(@"com.apple.appstored"))
  {
    id v0 = sub_100013ABC();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
      sub_10003968C(v0);
    }
  }
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"BackgroundAssetDownloadsEnabled", @"com.apple.appstored", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v2 = AppBooleanValue == 0;
  }
  else {
    BOOL v2 = 0;
  }
  return !v2;
}

void sub_100019A00(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

NSSet *sub_100019A20()
{
  self;
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v0, v1, v2, v3, v4, objc_opt_class(), 0);
}

id sub_100019AD4()
{
  self;
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  uint64_t v0 = +[NSArray arrayWithObjects:v3 count:10];
  uint64_t v1 = +[NSSet setWithArray:v0];

  return v1;
}

void sub_10001A10C(id a1)
{
  qword_100069588 = objc_alloc_init(BAAgentCore);

  _objc_release_x1();
}

id sub_10001A70C(uint64_t a1)
{
  [*(id *)(a1 + 32) _deserializeState];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _pokeScheduler];
}

void sub_10001A748()
{
  id v0 = +[BAAgentCore sharedCore];
  [v0 _backgroundActivityStateDidChange];
}

void sub_10001A790(uint64_t a1, uint64_t a2)
{
  if (sub_100019888())
  {
    id v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.backgroundassets.agentcore.lockdown.client", v6);
    [*(id *)(a1 + 32) _asyncAwaitLockdownClientMessage:a2 waitQueue:v4];
  }
  else
  {
    uint64_t v5 = sub_100013ABC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Rejecting lockdown connection as developer mode is not enabled.", buf, 2u);
    }

    lockdown_disconnect();
  }
}

void sub_10001AA90(uint64_t a1)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001AB4C;
  v6[3] = &unk_10005D028;
  uint64_t v2 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v3 = *(id *)(a1 + 32);
  dispatch_queue_t v4 = *(void **)(a1 + 48);
  id v8 = v3;
  id v9 = v4;
  uint64_t v5 = [v4 workQueue];
  [v2 callBlockWhenConnectionReady:v6 onQueue:v5];
}

void sub_10001AB4C(id *a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v12 = sub_100013BEC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v13 = [a1[4] processIdentifier];
      int v16 = 67240192;
      unsigned int v17 = v13;
      objc_super v14 = "Client connection rejected (could not validate on connection setup) from pid:%{public}d";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 8u);
    }
LABEL_13:

    [a1[5] invalidate];
    return;
  }
  id v3 = a1[5];
  if (!v3) {
    goto LABEL_10;
  }
  id v4 = a1[6];
  id v5 = a1[4];
  id v6 = [v3 applicationBundleIdentifier];
  LODWORD(v4) = [v4 _checkConnection:v5 hasAllowedTeamIDForIdentifier:v6];

  if (!v4
    || (id v7 = a1[6],
        [a1[5] applicationBundleIdentifier],
        id v8 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v7) = [v7 _checkIdentifierHasExtension:v8],
        v8,
        !v7))
  {
LABEL_10:
    id v12 = sub_100013BEC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v15 = [a1[4] processIdentifier];
      int v16 = 67240192;
      unsigned int v17 = v15;
      objc_super v14 = "Client connection rejected (no extension, signing error or team-id mismatch) from pid:%{public}d";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  id v9 = [a1[6] connections];
  [v9 addObject:a1[5]];

  [a1[5] resume];
  uint64_t v10 = sub_100013BEC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [a1[4] processIdentifier];
    int v16 = 67240192;
    unsigned int v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client connection accepted from pid:%{public}d", (uint8_t *)&v16, 8u);
  }
}

id sub_10001AF54(id *a1)
{
  if (a1[4])
  {
    uint64_t v2 = [a1[5] connections];
    [v2 addObject:a1[4]];

    id v3 = sub_100013BEC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v4 = [a1[6] processIdentifier];
      v7[0] = 67240192;
      v7[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "System connection accepted from pid:%{public}d", (uint8_t *)v7, 8u);
    }

    return [a1[4] resume];
  }
  else
  {
    id v6 = sub_100013BEC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000398EC((uint64_t)a1);
    }

    return [a1[4] invalidate];
  }
}

id sub_10001B11C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) connections];
  [v2 removeObject:*(void *)(a1 + 40)];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(id *)(a1 + 40);
    unsigned int v4 = [v3 applicationBundleIdentifier];
    if (v4)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v5 = [*(id *)(a1 + 32) connections];
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v15;
LABEL_5:
        uint64_t v9 = 0;
        while (1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            unsigned int v11 = [v10 applicationBundleIdentifier];
            unsigned __int8 v12 = [v11 isEqual:v4];

            if (v12) {
              break;
            }
          }
          if (v7 == (id)++v9)
          {
            id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
            if (v7) {
              goto LABEL_5;
            }
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:

        id v5 = [*(id *)(a1 + 32) connectionReplyQueue];
        [v5 removeObjectForKey:v4];
      }
    }
  }
  return [*(id *)(a1 + 40) connectionInvalidated];
}

void sub_10001B3D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10001B51C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001B52C(uint64_t a1)
{
}

uint64_t sub_10001B534(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _downloaderExtensionForApplicationIdentifier:*(void *)(a1 + 40) cacheOnly:*(unsigned __int8 *)(a1 + 56)];

  return _objc_release_x1();
}

void sub_10001B920(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10001BA50(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serializeApplicationState];
}

void sub_10001BDA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001BF3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001C014(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) appBundleIdentifier];
  id v6 = [v2 applicationInfoForIdentifier:v3];

  [v6 applicationPrepareWithDescriptor:*(void *)(a1 + 40)];
  unsigned int v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) appBundleIdentifier];
  [v4 _deleteDownloadQueueForIdentifier:v5];

  [*(id *)(a1 + 32) _serializeApplicationState];
  [*(id *)(a1 + 32) _serializeDownloadQueues];
}

void sub_10001C1A4(uint64_t a1)
{
  uint64_t v2 = sub_100013B54();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(unsigned char *)(a1 + 56)) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) path];
    int v9 = 138543874;
    uint64_t v10 = v4;
    __int16 v11 = 2114;
    CFStringRef v12 = v3;
    __int16 v13 = 2114;
    long long v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Placeholder ready for identifier: %{public}@ (UserInitiated: %{public}@, URL: %{public}@)", (uint8_t *)&v9, 0x20u);
  }
  if (_os_feature_enabled_impl())
  {
    id v6 = [*(id *)(a1 + 48) applicationInfoForIdentifier:*(void *)(a1 + 32)];
    id v7 = sub_100013B54();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543362;
      uint64_t v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "GreenTeaPlaceholder Enabled: Potentially presenting network consent during placeholder install for identifier: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [*(id *)(a1 + 48) _requestNetworkConsentWithApplication:v6 userInitiated:*(unsigned __int8 *)(a1 + 56)];
  }
}

id sub_10001C524(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serializeDownloadQueues];
}

void sub_10001C624(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v10 = sub_100013B54();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 138543874;
      uint64_t v16 = v14;
      __int16 v17 = 2114;
      CFStringRef v18 = v5;
      __int16 v19 = 2114;
      CFStringRef v20 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Requesting consent for network access failed for identifier: %{public}@ (Policies: %{public}@, Error: %{public}@)", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    id v8 = [(__CFString *)v5 wifi];
    id v9 = [(__CFString *)v5 cellular];
    uint64_t v10 = sub_100013B54();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = @"NO";
      uint64_t v12 = *(void *)(a1 + 32);
      if (v8 == (id)1) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      int v15 = 138543874;
      uint64_t v16 = v12;
      __int16 v17 = 2114;
      if (v9 == (id)1) {
        CFStringRef v11 = @"YES";
      }
      CFStringRef v18 = v13;
      __int16 v19 = 2114;
      CFStringRef v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Network consent received for identifier: %{public}@. (Wi-Fi: %{public}@, Cellular: %{public}@)", (uint8_t *)&v15, 0x20u);
    }
  }

  [*(id *)(a1 + 40) setAwaitingNetworkConsent:0];
}

void sub_10001D4E8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = sub_100013B54();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003A274();
    }
  }
}

void sub_10001D550(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = sub_100013B54();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003A2F4();
    }
  }
}

void sub_10001D5B8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _downloadQueueForIdentifier:*(void *)(a1 + 40) create:1 error:0];
  [v2 thaw];
  [*(id *)(a1 + 48) applicationInstalled];
  [*(id *)(a1 + 32) _pokeScheduler];
  [*(id *)(a1 + 32) _serializeApplicationState];
}

void sub_10001D62C(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = sub_100013B54();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003A374();
    }
  }
}

id sub_10001D694(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleDownloads];
}

void sub_10001D8DC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v25 = 0;
  id v26 = 0;
  id v24 = 0;
  unsigned __int8 v4 = [v2 __schedulingPermittedWithIdentifier:v3 downloadQueue:&v26 appInfo:&v25 error:&v24];
  id v5 = v26;
  id v6 = v25;
  id v7 = v24;
  if (v4)
  {
    if ([v6 initialRestrictionsAreEnforced])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      os_unfair_lock_lock((os_unfair_lock_t)[*(id *)(a1 + 56) downloadLock]);
      [*(id *)(a1 + 56) setApplicationInformationForRestrictedDownload:v6];
      if (isKindOfClass)
      {
        if ([v6 initialBackgroundCellularPolicy]) {
          [*(id *)(a1 + 56) setPermitInitialCellularDownload:1];
        }
      }
      else
      {
        [*(id *)(a1 + 56) setIsForegroundDownload:0];
      }
      os_unfair_lock_unlock((os_unfair_lock_t)[*(id *)(a1 + 56) downloadLock]);
    }
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001DB28;
    v15[3] = &unk_10005D140;
    uint64_t v10 = &v16;
    uint64_t v12 = *(void *)(a1 + 56);
    id v16 = *(id *)(a1 + 48);
    CFStringRef v11 = &v20;
    id v20 = *(id *)(a1 + 64);
    id v17 = *(id *)(a1 + 56);
    id v13 = *(id *)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 32);
    id v18 = v13;
    uint64_t v19 = v14;
    [v5 scheduleDownload:v12 completionHandler:v15];
  }
  else
  {
    id v9 = *(NSObject **)(a1 + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001DB14;
    block[3] = &unk_10005CF20;
    uint64_t v10 = &v23;
    id v23 = *(id *)(a1 + 64);
    CFStringRef v11 = &v22;
    id v22 = v7;
    dispatch_async(v9, block);
  }
}

uint64_t sub_10001DB14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10001DB28(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    unsigned __int8 v4 = *(NSObject **)(a1 + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001DD5C;
    block[3] = &unk_10005CF20;
    id v16 = *(id *)(a1 + 64);
    id v15 = v3;
    dispatch_async(v4, block);

    id v5 = v16;
  }
  else
  {
    id v6 = sub_100013ABC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 40) identifier];
      uint64_t v8 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      id v18 = v7;
      __int16 v19 = 2114;
      uint64_t v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Scheduled download identifier: %{public}@ for client: %{public}@", buf, 0x16u);
    }
    id v9 = [*(id *)(a1 + 56) workQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001DD70;
    v13[3] = &unk_10005C998;
    v13[4] = *(void *)(a1 + 56);
    dispatch_async(v9, v13);

    uint64_t v10 = *(NSObject **)(a1 + 32);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001DDAC;
    v11[3] = &unk_10005CF48;
    id v12 = *(id *)(a1 + 64);
    dispatch_async(v10, v11);
    id v5 = v12;
  }
}

uint64_t sub_10001DD5C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

id sub_10001DD70(uint64_t a1)
{
  [*(id *)(a1 + 32) _pokeScheduler];
  id v2 = *(void **)(a1 + 32);

  return [v2 _serializeDownloadQueues];
}

uint64_t sub_10001DDAC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001DEC0(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v30 = 0;
  unsigned __int8 v4 = [v2 _downloadQueueForIdentifier:v3 create:1 error:&v30];
  id v5 = v30;
  if (v4)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v6 = [v4 allDownloads];
    id v7 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v27;
      while (2)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          CFStringRef v11 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v10);
          id v12 = [*(id *)(a1 + 48) uniqueIdentifier];
          id v13 = [v11 uniqueIdentifier];
          unsigned __int8 v14 = [v12 isEqual:v13];

          if (v14)
          {

            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_10001E2F4;
            v20[3] = &unk_10005D190;
            uint64_t v19 = *(void *)(a1 + 48);
            id v21 = *(id *)(a1 + 56);
            [v4 startForegroundDownload:v19 completionHandler:v20];
            id v18 = v21;
            goto LABEL_12;
          }
          uint64_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    [*(id *)(a1 + 48) setApplicationIdentifier:*(void *)(a1 + 40)];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001E15C;
    v22[3] = &unk_10005D1E0;
    uint64_t v15 = *(void *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    uint64_t v17 = *(void *)(a1 + 32);
    id v25 = v16;
    v22[4] = v17;
    id v23 = v4;
    id v24 = *(id *)(a1 + 48);
    [v23 scheduleDownload:v15 completionHandler:v22];

    id v18 = v25;
LABEL_12:
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_10001E15C(id *a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = (void (*)(void))*((void *)a1[7] + 2);
    v3();
  }
  else
  {
    unsigned __int8 v4 = [a1[4] workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001E254;
    block[3] = &unk_10005D1B8;
    id v6 = a1[5];
    id v7 = a1[6];
    id v8 = a1[7];
    dispatch_async(v4, block);
  }
}

void sub_10001E254(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001E2E4;
  v3[3] = &unk_10005D190;
  id v4 = *(id *)(a1 + 48);
  [v1 startForegroundDownload:v2 completionHandler:v3];
}

uint64_t sub_10001E2E4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001E2F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001E3DC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  id v4 = [v2 _downloadQueueForIdentifier:v3 create:0 error:&v6];
  id v5 = v6;
  if (v4)
  {
    [v4 freeze];
    [*(id *)(a1 + 32) _serializeDownloadQueues];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10001E55C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v6 = 0;
  id v4 = [v2 _downloadQueueForIdentifier:v3 create:0 error:&v6];
  id v5 = v6;
  if (v4)
  {
    [v4 thaw];
    [*(id *)(a1 + 32) _pokeScheduler];
    [*(id *)(a1 + 32) _serializeDownloadQueues];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10001E788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10001E7AC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) applicationIdentifier];
  uint64_t v3 = *(void **)(a1 + 40);
  id v25 = 0;
  id v4 = [v3 _downloadQueueForIdentifier:v2 create:0 error:&v25];
  id v5 = v25;
  id v6 = v25;
  id v7 = v6;
  if (v4)
  {
    id v19 = v6;
    id v8 = sub_100013B54();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v28 = v2;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "App (%{public}@) was canceled and removed by the App Store, all in-flight downloads will be canceled silently.", buf, 0xCu);
    }

    [v4 cancelAllDownloadsSilently];
    uint64_t v20 = v4;
    [v4 thaw];
    uint64_t v9 = +[NSMutableArray array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v10 = [*(id *)(a1 + 40) unhandledDownloadEvents];
    id v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          id v16 = [v15 download:v19];
          uint64_t v17 = [v16 applicationIdentifier];
          if ([v17 isEqualToString:v2]) {
            [v9 addObject:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v12);
    }

    id v18 = [*(id *)(a1 + 40) unhandledDownloadEvents];
    [v18 removeObjectsInArray:v9];

    [*(id *)(a1 + 40) _serializeUndeliveredEvents];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;

    id v7 = v19;
    id v4 = v20;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

void sub_10001EB10(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v9 = 0;
  id v4 = [v2 _downloadQueueForIdentifier:v3 create:0 error:&v9];
  id v5 = v9;
  if (v4)
  {
    uint64_t v6 = a1[6];
    id v8 = 0;
    [v4 cancelDownload:v6 error:&v8];
    id v7 = v8;
    (*(void (**)(void))(a1[7] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }
}

void sub_10001ED48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001ED60(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _downloadQueueForIdentifier:*(void *)(a1 + 40) create:0 error:0];

  return _objc_release_x1();
}

void sub_10001EEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001EF04(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _downloadQueueForIdentifier:*(void *)(a1 + 40) create:0 error:0];
  id v7 = v2;
  if (v2)
  {
    uint64_t v3 = [v2 allDownloads];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v5 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = &__NSArray0__struct;
  }
}

void sub_10001F414(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001F438(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001F4C8;
  v3[3] = &unk_10005D2D0;
  void v3[4] = *(void *)(a1 + 32);
  uint64_t v1 = +[RBSProcessMonitor monitorWithConfiguration:v3];
  uint64_t v2 = (void *)qword_100069598;
  qword_100069598 = v1;
}

void sub_10001F4C8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[RBSProcessStateDescriptor descriptor];
  [v4 setValues:1];
  [v4 setEndowmentNamespaces:&off_10005FEF8];
  [v3 setStateDescriptor:v4];
  [v3 setEvents:1];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001F5A8;
  v5[3] = &unk_10005D2A8;
  v5[4] = *(void *)(a1 + 32);
  [v3 setUpdateHandler:v5];
}

id sub_10001F5A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _processRunningBoardStateUpdate:a4 forProcess:a3];
}

id sub_10001F5BC(uint64_t a1, void *a2)
{
  return [a2 setPredicates:*(void *)(a1 + 32)];
}

void sub_10001F93C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) identifier];
  id v3 = [*(id *)(a1 + 48) bundleIdentifier];
  [v2 _updateStateForAppExtensionBundleIdentifier:v4 appBundleIdentifier:v3 state:*(void *)(a1 + 56)];
}

void sub_10001F9B8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) identifier];
  [v2 _updateStateForAppBundleIdentifier:v3 state:*(void *)(a1 + 48)];
}

void sub_10001FEE8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) applicationInfoForIdentifier:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) __handleApplicationLaunchedWithInfo:v2];
}

int64_t sub_1000206EC(id a1, BADownloadQueue *a2, BADownloadQueue *a3)
{
  id v4 = a2;
  id v5 = a3;
  int64_t v6 = [(BADownloadQueue *)v4 numberOfActiveDownloads];
  if (v6 >= [(BADownloadQueue *)v5 numberOfActiveDownloads])
  {
    int64_t v8 = [(BADownloadQueue *)v4 numberOfActiveDownloads];
    if (v8 <= [(BADownloadQueue *)v5 numberOfActiveDownloads])
    {
      id v9 = [(BADownloadQueue *)v4 lastDownloadStartDate];
      uint64_t v10 = [(BADownloadQueue *)v5 lastDownloadStartDate];
      int64_t v7 = (int64_t)[v9 compare:v10];
    }
    else
    {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = -1;
  }

  return v7;
}

void sub_1000208B4(uint64_t a1)
{
  id v2 = sub_100013C84();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Download did begin: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_10001B51C;
  id v32 = sub_10001B52C;
  id v33 = 0;
  id v4 = [*(id *)(a1 + 40) workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020C28;
  block[3] = &unk_10005D258;
  uint64_t v5 = *(void *)(a1 + 40);
  int64_t v6 = *(void **)(a1 + 48);
  p_long long buf = &buf;
  void block[4] = v5;
  id v23 = v6;
  dispatch_sync(v4, block);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = *(id *)(*((void *)&buf + 1) + 40);
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v11 isActive])
        {
          uint64_t v27 = *(void *)(a1 + 32);
          id v12 = +[NSArray arrayWithObjects:&v27 count:1];
          [v11 syncDownloads:v12];

          uint64_t v13 = [*(id *)(a1 + 32) uniqueIdentifier];
          [v11 downloadIdentifierDidBegin:v13];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v8);
  }

  unsigned __int8 v14 = sub_100013C84();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)id v25 = 138543362;
    uint64_t v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Download did begin finished: %{public}@", v25, 0xCu);
  }

  id v16 = [*(id *)(a1 + 40) workQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100020C78;
  v17[3] = &unk_10005C998;
  v17[4] = *(void *)(a1 + 40);
  dispatch_sync(v16, v17);

  _Block_object_dispose(&buf, 8);
}

void sub_100020BF8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100020C28(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _connectionsForApplicationIdentifier:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

id sub_100020C78(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serializeDownloadQueues];
}

void sub_100020D7C(uint64_t a1)
{
  id v2 = sub_100013C84();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Download did pause: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = sub_10001B51C;
  id v32 = sub_10001B52C;
  id v33 = 0;
  id v4 = [*(id *)(a1 + 40) workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000210F0;
  block[3] = &unk_10005D258;
  uint64_t v5 = *(void *)(a1 + 40);
  int64_t v6 = *(void **)(a1 + 48);
  p_long long buf = &buf;
  void block[4] = v5;
  id v23 = v6;
  dispatch_sync(v4, block);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = *(id *)(*((void *)&buf + 1) + 40);
  id v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v11 isActive])
        {
          uint64_t v27 = *(void *)(a1 + 32);
          id v12 = +[NSArray arrayWithObjects:&v27 count:1];
          [v11 syncDownloads:v12];

          uint64_t v13 = [*(id *)(a1 + 32) uniqueIdentifier];
          [v11 downloadIdentifierDidPause:v13];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v18 objects:v28 count:16];
    }
    while (v8);
  }

  unsigned __int8 v14 = sub_100013C84();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(a1 + 32);
    *(_DWORD *)id v25 = 138543362;
    uint64_t v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Download did pause finished: %{public}@", v25, 0xCu);
  }

  id v16 = [*(id *)(a1 + 40) workQueue];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100021140;
  v17[3] = &unk_10005C998;
  v17[4] = *(void *)(a1 + 40);
  dispatch_sync(v16, v17);

  _Block_object_dispose(&buf, 8);
}

void sub_1000210C0(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000210F0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _connectionsForApplicationIdentifier:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

id sub_100021140(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serializeDownloadQueues];
}

void sub_1000212A0(uint64_t a1)
{
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x3032000000;
  v69 = sub_10001B51C;
  v70 = sub_10001B52C;
  id v71 = 0;
  id v2 = [*(id *)(a1 + 32) workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000219C4;
  block[3] = &unk_10005D258;
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v33 = a1 + 40;
  uint64_t v4 = *(void *)(a1 + 32);
  v65 = &v66;
  void block[4] = v4;
  id v64 = v3;
  dispatch_sync(v2, block);

  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  uint64_t v62 = 2;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = sub_10001B51C;
  v57 = sub_10001B52C;
  id v58 = 0;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x2020000000;
  char v52 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = sub_10001B51C;
  v47 = sub_10001B52C;
  id v48 = (id)objc_opt_new();
  group = dispatch_group_create();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = (id)v67[5];
  id v6 = [v5 countByEnumeratingWithState:&v39 objects:v77 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v40;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if (objc_msgSend(v9, "isActive", v33))
        {
          uint64_t v76 = *(void *)(a1 + 48);
          uint64_t v10 = +[NSArray arrayWithObjects:&v76 count:1];
          [v9 syncDownloads:v10];

          dispatch_group_enter(group);
          id v11 = [*(id *)(a1 + 48) uniqueIdentifier];
          uint64_t v12 = *(void *)(a1 + 56);
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_100021A14;
          v38[3] = &unk_10005D360;
          v38[4] = &v43;
          v38[5] = &v49;
          v38[6] = &v59;
          v38[7] = &v53;
          v35[0] = _NSConcreteStackBlock;
          v35[1] = 3221225472;
          v35[2] = sub_100021AC0;
          v35[3] = &unk_10005D388;
          id v36 = group;
          id v37 = *(id *)(a1 + 64);
          [v9 downloadIdentifier:v11 didReceiveChallenge:v12 authChallengeHandler:v38 withCompletion:v35];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v39 objects:v77 count:16];
    }
    while (v6);
  }

  dispatch_time_t v13 = dispatch_time(0, 30000000000);
  intptr_t v14 = dispatch_group_wait(group, v13);
  [(id)v44[5] lock];
  uint64_t v15 = v50;
  if (v14 && !*((unsigned char *)v50 + 24))
  {
    id v16 = sub_100013B54();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_10003A650();
    }

    uint64_t v15 = v50;
  }
  if (!*((unsigned char *)v15 + 24))
  {
    *((unsigned char *)v15 + 24) = 1;
    [(id)v44[5] unlock];
    long long v18 = [*(id *)(a1 + 32) _downloaderExtensionForApplicationIdentifier:*(void *)(a1 + 40) cacheOnly:0];
    long long v19 = v18;
    if (v18)
    {
      if ([v18 sendAuthenticationChallenge:*(void *)(a1 + 56) download:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 72)])
      {
LABEL_35:

        goto LABEL_36;
      }
      long long v20 = sub_100013B54();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10003A5D8();
      }

      uint64_t v21 = *(void *)(a1 + 72);
      uint64_t v22 = 2;
LABEL_32:
      (*(void (**)(uint64_t, uint64_t, void))(v21 + 16))(v21, v22, 0);
      goto LABEL_35;
    }
    id v23 = sub_100013B54();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v73 = v24;
      __int16 v74 = 2114;
      uint64_t v75 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Cannot message extension for '%{public}@' to answer auth challenge, performing default handling for download: %{public}@", buf, 0x16u);
    }

    uint64_t v26 = [*(id *)(a1 + 56) protectionSpace];
    uint64_t v27 = [v26 authenticationMethod];
    if ([v27 isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
      BOOL v28 = [*(id *)(a1 + 56) previousFailureCount] == 0;

      if (v28)
      {
        uint64_t v29 = *(void *)(a1 + 72);
        uint64_t v30 = [*(id *)(a1 + 56) protectionSpace];
        uint64_t v31 = +[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", [v30 serverTrust]);
        (*(void (**)(uint64_t, void, void *))(v29 + 16))(v29, 0, v31);

        goto LABEL_34;
      }
    }
    else
    {
    }
    id v32 = [*(id *)(a1 + 56) previousFailureCount:v33];
    uint64_t v21 = *(void *)(a1 + 72);
    if (v32)
    {
      uint64_t v22 = 1;
      goto LABEL_32;
    }
    uint64_t v30 = [*(id *)(a1 + 56) proposedCredential];
    (*(void (**)(uint64_t, void, void *))(v21 + 16))(v21, 0, v30);
LABEL_34:

    goto LABEL_35;
  }
  uint64_t v17 = *(void *)(a1 + 72);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v17, v60[3], v54[5]);
  }
  [v44[5] unlock:v33];
LABEL_36:

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v66, 8);
}

void sub_100021948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
}

uint64_t sub_1000219C4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _connectionsForApplicationIdentifier:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

void sub_100021A14(void *a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  [*(id *)(*(void *)(a1[4] + 8) + 40) lock];
  uint64_t v6 = *(void *)(a1[5] + 8);
  if (!*(unsigned char *)(v6 + 24))
  {
    *(unsigned char *)(v6 + 24) = 1;
    *(void *)(*(void *)(a1[6] + 8) + 24) = a2;
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a3);
  }
  [*(id *)(*(void *)(a1[4] + 8) + 40) unlock];
}

void sub_100021AC0(uint64_t a1)
{
}

void sub_100021CB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_100021CD4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _connectionsForApplicationIdentifier:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

void sub_100021D24(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isActive", (void)v9))
        {
          id v8 = [*(id *)(a1 + 32) uniqueIdentifier];
          [v7 downloadIdentifier:v8 didWriteBytes:*(void *)(a1 + 56) totalBytesWritten:*(void *)(a1 + 64) totalBytesExpectedToWrite:*(void *)(a1 + 72)];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

id sub_100022108(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateContentRequestTelemetryForCompletedDownload:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

id sub_100022118(uint64_t a1)
{
  id v2 = sub_100013B54();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Awaiting app install for %{public}@. Deferring failure delivery for %{public}@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = [*(id *)(a1 + 48) unhandledDownloadEvents];
  [v5 addObject:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) _serializeUndeliveredEvents];
  return [*(id *)(a1 + 48) _pokeScheduler];
}

void sub_1000221F8(uint64_t a1)
{
  id v2 = sub_100013C84();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10003A700();
  }

  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x3032000000;
  v65 = sub_10001B51C;
  uint64_t v66 = sub_10001B52C;
  id v67 = 0;
  uint64_t v58 = 0;
  uint64_t v59 = &v58;
  uint64_t v60 = 0x2020000000;
  char v61 = 0;
  uint64_t v3 = [*(id *)(a1 + 48) workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000227F4;
  block[3] = &unk_10005D258;
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 56);
  v57 = &v62;
  void block[4] = v4;
  id v56 = v5;
  dispatch_sync(v3, block);

  group = dispatch_group_create();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v6 = (id)v63[5];
  id v7 = [v6 countByEnumeratingWithState:&v51 objects:v72 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v52;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v52 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        if ([v10 isActive])
        {
          long long v11 = [*(id *)(a1 + 48) asyncClientNotificationQueue];
          v46[0] = _NSConcreteStackBlock;
          v46[1] = 3221225472;
          v46[2] = sub_100022844;
          v46[3] = &unk_10005D400;
          v46[4] = v10;
          id v47 = *(id *)(a1 + 32);
          long long v12 = group;
          id v48 = v12;
          id v49 = *(id *)(a1 + 40);
          v50 = &v58;
          dispatch_group_async(v12, v11, v46);
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v51 objects:v72 count:16];
    }
    while (v7);
  }

  dispatch_time_t v13 = dispatch_time(0, 120000000000);
  dispatch_group_wait(group, v13);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_100022980;
  v41[3] = &unk_10005D050;
  id v42 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 48);
  id v43 = v14;
  uint64_t v44 = v15;
  id v45 = *(id *)(a1 + 64);
  id v16 = objc_retainBlock(v41);
  if (!*((unsigned char *)v59 + 24))
  {
    if ([*(id *)(a1 + 72) allowsBackgroundActivity])
    {
      uint64_t v17 = [*(id *)(a1 + 48) _downloaderExtensionForApplicationIdentifier:*(void *)(a1 + 56) cacheOnly:0];
      if (v17)
      {
        long long v18 = [*(id *)(a1 + 48) asyncClientNotificationQueue];
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_100022A70;
        v34[3] = &unk_10005D450;
        uint64_t v17 = v17;
        uint64_t v35 = v17;
        id v36 = *(id *)(a1 + 32);
        id v19 = *(id *)(a1 + 40);
        uint64_t v20 = *(void *)(a1 + 48);
        id v37 = v19;
        uint64_t v38 = v20;
        long long v40 = v16;
        id v39 = *(id *)(a1 + 64);
        dispatch_async(v18, v34);
      }
    }
    else
    {
      uint64_t v21 = sub_100013B54();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = *(void *)(a1 + 56);
        *(_DWORD *)long long buf = 136315394;
        v69 = "-[BAAgentCore download:failedWithError:]_block_invoke";
        __int16 v70 = 2114;
        uint64_t v71 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s, Will not message extension for %{public}@ because background activity is disabled.", buf, 0x16u);
      }

      uint64_t v17 = [*(id *)(a1 + 48) workQueue];
      dispatch_async(v17, v16);
    }
  }
  id v23 = sub_100013C84();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    sub_10003A6C8(v23, v24, v25, v26, v27, v28, v29, v30);
  }

  uint64_t v31 = [*(id *)(a1 + 48) workQueue];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100022BB0;
  v33[3] = &unk_10005C998;
  v33[4] = *(void *)(a1 + 48);
  dispatch_sync(v31, v33);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);
}

void sub_1000227AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
}

uint64_t sub_1000227F4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) _connectionsForApplicationIdentifier:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

void sub_100022844(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v3 = +[NSArray arrayWithObjects:&v10 count:1];
  [v2 syncDownloads:v3];

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) uniqueIdentifier];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_100022964;
  v7[3] = &unk_10005CA60;
  uint64_t v6 = *(void *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 48);
  [v4 downloadIdentifier:v5 didFailWithError:v6 wasHandled:v7];
}

void sub_100022964(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100022980(uint64_t a1)
{
  id v2 = [[BAUnhandledDownloadEvent alloc] initWithEventType:2 download:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 48) unhandledDownloadEvents];
  [v3 addObject:v2];

  [*(id *)(a1 + 48) _serializeUndeliveredEvents];
  uint64_t v4 = sub_100013B54();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    uint64_t v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Added undelivered event: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_100022A70(uint64_t a1)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_100022B40;
  v7[3] = &unk_10005D428;
  id v5 = v2;
  uint64_t v6 = *(void *)(a1 + 56);
  id v8 = v5;
  uint64_t v9 = v6;
  id v11 = *(id *)(a1 + 72);
  id v10 = *(id *)(a1 + 64);
  [v3 backgroundDownload:v5 failedWithError:v4 completionHandler:v7];
}

void sub_100022B40(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = sub_100013ABC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003A770();
    }

    uint64_t v4 = [*(id *)(a1 + 40) workQueue];
    dispatch_async(v4, *(dispatch_block_t *)(a1 + 56));
  }
}

id sub_100022BB0(uint64_t a1)
{
  [*(id *)(a1 + 32) _serializeDownloadQueues];
  id v2 = *(void **)(a1 + 32);

  return [v2 _pokeScheduler];
}

id sub_100022ED4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateContentRequestTelemetryForCompletedDownload:*(void *)(a1 + 40) error:0];
}

id sub_100022EE4(uint64_t a1)
{
  id v2 = sub_100013B54();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) applicationIdentifier];
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138543618;
    id v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Awaiting app install for %{public}@. Deferring success delivery for %{public}@", (uint8_t *)&v7, 0x16u);
  }
  id v5 = [*(id *)(a1 + 48) unhandledDownloadEvents];
  [v5 addObject:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) _serializeUndeliveredEvents];
  return [*(id *)(a1 + 48) _pokeScheduler];
}

void sub_100022FE0(id *a1)
{
  id v2 = sub_100013C84();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Download did finish: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v75 = 0x3032000000;
  uint64_t v76 = sub_10001B51C;
  v77 = sub_10001B52C;
  id v78 = 0;
  uint64_t v65 = 0;
  uint64_t v66 = (unsigned __int8 *)&v65;
  uint64_t v67 = 0x2020000000;
  char v68 = 0;
  uint64_t v4 = [a1[5] workQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002374C;
  block[3] = &unk_10005D258;
  id v5 = a1[5];
  id v6 = a1[6];
  p_long long buf = &buf;
  void block[4] = v5;
  id v63 = v6;
  dispatch_sync(v4, block);

  group = dispatch_group_create();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v7 = *(id *)(*((void *)&buf + 1) + 40);
  id v8 = [v7 countByEnumeratingWithState:&v58 objects:v73 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v59;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v58 + 1) + 8 * i);
        if ([v11 isActive])
        {
          long long v12 = [a1[5] asyncClientNotificationQueue];
          v52[0] = _NSConcreteStackBlock;
          v52[1] = 3221225472;
          v52[2] = sub_1000237BC;
          v52[3] = &unk_10005D4A0;
          v52[4] = v11;
          id v13 = a1[4];
          id v14 = a1[5];
          id v53 = v13;
          id v54 = v14;
          id v55 = a1[7];
          id v56 = group;
          v57 = &v65;
          dispatch_group_async(v56, v12, v52);
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v58 objects:v73 count:16];
    }
    while (v8);
  }

  dispatch_time_t v15 = dispatch_time(0, 120000000000);
  dispatch_group_wait(group, v15);
  unsigned __int8 v16 = atomic_load(v66 + 24);
  if (v16)
  {
    uint64_t v27 = sub_100013B54();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      uint64_t v28 = (const char *)a1[4];
      *(_DWORD *)v69 = 138543362;
      __int16 v70 = v28;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Result was handled by a client of BADownloadManager, removing download. %{public}@", v69, 0xCu);
    }

    uint64_t v29 = +[NSFileManager defaultManager];
    uint64_t v31 = sub_1000333F4(a1[4], v30);
    [v29 removeItemAtURL:v31 error:0];
  }
  else
  {
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_100023A64;
    v48[3] = &unk_10005CE30;
    id v17 = a1[4];
    id v18 = a1[5];
    id v49 = v17;
    id v50 = v18;
    id v51 = a1[7];
    id v19 = objc_retainBlock(v48);
    if ([a1[6] allowsBackgroundActivity])
    {
      id v20 = a1[5];
      uint64_t v21 = [a1[6] applicationIdentifier];
      uint64_t v22 = [v20 _downloaderExtensionForApplicationIdentifier:v21 cacheOnly:0];

      if (v22)
      {
        id v23 = [a1[5] asyncClientNotificationQueue];
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100023B58;
        v42[3] = &unk_10005D168;
        id v43 = v22;
        id v24 = a1[4];
        id v25 = a1[5];
        id v44 = v24;
        id v45 = v25;
        id v47 = v19;
        id v46 = a1[7];
        dispatch_async(v23, v42);

        uint64_t v26 = v43;
      }
      else
      {
        uint64_t v34 = sub_100013ABC();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_10003A860();
        }

        uint64_t v26 = +[NSFileManager defaultManager];
        id v36 = sub_1000333F4(a1[4], v35);
        [v26 removeItemAtURL:v36 error:0];
      }
    }
    else
    {
      id v32 = sub_100013B54();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = [a1[6] applicationIdentifier];
        *(_DWORD *)v69 = 136315394;
        __int16 v70 = "-[BAAgentCore download:finishedWithFileURL:]_block_invoke";
        __int16 v71 = 2114;
        v72 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%s, Will not message extension for %{public}@ because background activity is disabled.", v69, 0x16u);
      }
      uint64_t v22 = [a1[5] workQueue];
      dispatch_async(v22, v19);
    }

    uint64_t v29 = v49;
  }

  id v37 = sub_100013C84();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v69 = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Download did finish done.", v69, 2u);
  }

  uint64_t v38 = [a1[5] workQueue];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_100023F8C;
  v40[3] = &unk_10005CA10;
  v40[4] = a1[5];
  id v41 = a1[7];
  dispatch_sync(v38, v40);

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&buf, 8);
}

void sub_1000236F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose((const void *)(v59 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10002374C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) applicationIdentifier];
  uint64_t v3 = [v2 _connectionsForApplicationIdentifier:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_1000237BC(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = sub_1000333F4(*(id *)(a1 + 40), a2);
  id v5 = [v3 extendClientSandboxForStagedURL:v4 allowWrites:0];

  if (v5)
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v26 = *(void *)(a1 + 40);
    id v7 = +[NSArray arrayWithObjects:&v26 count:1];
    [v6 syncDownloads:v7];

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 64));
    id v8 = *(void **)(a1 + 32);
    uint64_t v9 = [*(id *)(a1 + 40) uniqueIdentifier];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100023A44;
    v22[3] = &unk_10005D478;
    uint64_t v10 = *(void **)(a1 + 64);
    uint64_t v25 = *(void *)(a1 + 72);
    id v23 = v10;
    id v24 = *(id *)(a1 + 56);
    [v8 downloadIdentifierDidFinish:v9 sandboxExtensionToken:v5 wasHandled:v22];

    id v11 = v23;
  }
  else
  {
    long long v12 = sub_100013ABC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = *(void **)(a1 + 40);
      dispatch_time_t v15 = sub_1000333F4(v14, v13);
      unsigned __int8 v16 = [*(id *)(a1 + 32) applicationBundleIdentifier];
      id v17 = __error();
      id v18 = strerror(*v17);
      *(_DWORD *)long long buf = 138544130;
      uint64_t v29 = v14;
      __int16 v30 = 2114;
      uint64_t v31 = v15;
      __int16 v32 = 2114;
      uint64_t v33 = v16;
      __int16 v34 = 2082;
      uint64_t v35 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Warning: No sandbox token issued for finished download: %{public}@ URL: %{public}@ for client: %{public}@. -- %{public}s", buf, 0x2Au);
    }
    id v11 = [*(id *)(a1 + 40) copy];
    id v19 = sub_100029C00(-107);
    sub_100032D34(v11, -1);
    id v20 = *(void **)(a1 + 32);
    id v27 = v11;
    uint64_t v21 = +[NSArray arrayWithObjects:&v27 count:1];
    [v20 syncDownloads:v21];

    [*(id *)(a1 + 48) download:v11 failedWithError:v19];
  }
}

void sub_100023A44(uint64_t a1, int a2)
{
  if (a2) {
    atomic_store(1u, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100023A64(uint64_t a1)
{
  id v2 = [[BAUnhandledDownloadEvent alloc] initWithEventType:1 download:*(void *)(a1 + 32) error:0];
  uint64_t v3 = [*(id *)(a1 + 40) unhandledDownloadEvents];
  [v3 addObject:v2];

  [*(id *)(a1 + 40) _serializeUndeliveredEvents];
  uint64_t v4 = sub_100013B54();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Added undelivered event: %{public}@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_100023B58(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = sub_1000333F4(*(id *)(a1 + 40), a2);
  int v5 = [v3 extendClientSandboxForStagedURL:v4 allowWrites:0];

  if (v5)
  {
    id v7 = *(void **)(a1 + 32);
    id v6 = *(void **)(a1 + 40);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100023E5C;
    v19[3] = &unk_10005D428;
    id v8 = v6;
    uint64_t v9 = *(void *)(a1 + 48);
    id v20 = v8;
    uint64_t v21 = v9;
    id v23 = *(id *)(a1 + 64);
    id v22 = *(id *)(a1 + 56);
    [v7 backgroundDownload:v8 finishedWithSandboxToken:v5 completionHandler:v19];

    id v10 = v20;
  }
  else
  {
    id v10 = [*(id *)(a1 + 40) copy];
    id v11 = sub_100013ABC();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = sub_1000333F4(v10, v12);
      id v14 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)long long buf = 138543874;
      id v30 = v10;
      __int16 v31 = 2114;
      __int16 v32 = v13;
      __int16 v33 = 2114;
      __int16 v34 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Warning: No sandbox token issued for extension for finished download: %{public}@ URL: %{public}@ for client: %{public}@", buf, 0x20u);
    }
    dispatch_time_t v15 = sub_100029C00(-107);
    sub_100032D34(v10, -1);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100023DEC;
    v24[3] = &unk_10005D428;
    unsigned __int8 v16 = *(void **)(a1 + 32);
    id v17 = *(id *)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 48);
    id v25 = v17;
    uint64_t v26 = v18;
    id v28 = *(id *)(a1 + 64);
    id v27 = *(id *)(a1 + 56);
    [v16 backgroundDownload:v10 failedWithError:v15 completionHandler:v24];
  }
}

void sub_100023DEC(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = sub_100013ABC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003A8CC();
    }

    uint64_t v4 = [*(id *)(a1 + 40) workQueue];
    dispatch_async(v4, *(dispatch_block_t *)(a1 + 56));
  }
}

void sub_100023E5C(id *a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = sub_100013B54();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = a1[4];
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Extension handled the background download, removing download. %{public}@", (uint8_t *)&v9, 0xCu);
    }

    int v5 = +[NSFileManager defaultManager];
    id v7 = sub_1000333F4(a1[4], v6);
    [v5 removeItemAtURL:v7 error:0];
  }
  else
  {
    id v8 = sub_100013ABC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003A934();
    }

    int v5 = [a1[5] workQueue];
    dispatch_async(v5, a1[7]);
  }
}

id sub_100023F8C(uint64_t a1)
{
  [*(id *)(a1 + 32) _serializeDownloadQueues];
  id v2 = *(void **)(a1 + 32);

  return [v2 _pokeScheduler];
}

void sub_1000241FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100024214(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) applicationInfoIfExistsForIdentifier:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) _downloadQueueForIdentifier:*(void *)(a1 + 40) create:0 error:0];
    id v4 = v3;
    if (v3)
    {
      uint64_t v12 = 0;
      uint64_t v13 = 0;
      id v5 = [v3 essentialAssetsStateWithSizeDownloaded:&v13 totalDownloadSize:&v12];
      uint64_t v6 = [*(id *)(a1 + 32) _essentialAssetsProgressDescriptorWithAppInfo:v2 essentialAssetState:v5 sizeDownloaded:v13 totalDownloadSize:v12];
    }
    else
    {
      uint64_t v6 = (uint64_t)sub_10000C64C([BAAppStoreProgressInfoDescriptor alloc], 1, -1, -1);
    }
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v6;
  }
  else
  {
    id v7 = sub_10000C64C([BAAppStoreProgressInfoDescriptor alloc], 0, -1, -1);
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    int v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
}

void sub_100024480(id *a1)
{
  id v2 = sub_100013C84();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = (const char *)a1[4];
    *(_DWORD *)long long buf = 138543362;
    id v36 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Download manifest did finish: %{public}@", buf, 0xCu);
  }

  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  void v30[2] = sub_1000248BC;
  v30[3] = &unk_10005D4C8;
  id v31 = a1[4];
  id v4 = a1[5];
  id v5 = a1[6];
  id v6 = a1[7];
  id v32 = v4;
  id v33 = v5;
  id v34 = v6;
  id v7 = objc_retainBlock(v30);
  uint64_t v8 = a1 + 8;
  if ([a1[8] allowsBackgroundActivity])
  {
    if (([*v8 hasLaunchedApplication] & 1) != 0
      || ([*v8 permittedForInitialBackgroundActivity] & 1) != 0)
    {
      id v9 = a1[6];
      uint64_t v10 = [a1[8] applicationIdentifier];
      id v11 = [v9 _downloaderExtensionForApplicationIdentifier:v10 cacheOnly:0];

      if (v11)
      {
        uint64_t v12 = sub_10000C064((uint64_t)a1[4]);
        uint64_t v13 = v12;
        if (v12 != 1)
        {
          if (v12 == 7)
          {
            uint64_t v13 = 3;
          }
          else if (v12 != 2)
          {
            id v14 = sub_100013ABC();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              sub_10003AA3C();
            }
LABEL_16:

            ((void (*)(void *, void))v7[2])(v7, 0);
LABEL_23:

            goto LABEL_24;
          }
        }
        uint64_t v18 = [a1[6] asyncClientNotificationQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100024A60;
        block[3] = &unk_10005D568;
        id v22 = v11;
        id v23 = a1[4];
        id v28 = v7;
        id v24 = a1[8];
        uint64_t v29 = v13;
        id v25 = a1[9];
        int8x16_t v20 = *(int8x16_t *)(a1 + 5);
        id v19 = (id)v20.i64[0];
        int8x16_t v26 = vextq_s8(v20, v20, 8uLL);
        id v27 = a1[7];
        dispatch_async(v18, block);

        goto LABEL_23;
      }
      id v14 = sub_100013ABC();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10003A99C(v8);
      }
      goto LABEL_16;
    }
    dispatch_time_t v15 = sub_100013B54();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v16 = [*v8 applicationIdentifier];
      *(_DWORD *)long long buf = 136315394;
      id v36 = "-[BAAgentCore downloadQueue:manifest:finishedWithFileURL:]_block_invoke";
      __int16 v37 = 2114;
      uint64_t v38 = v16;
      id v17 = "%s, Will not message extension for %{public}@. App not permitted for initial background activity.";
      goto LABEL_19;
    }
  }
  else
  {
    dispatch_time_t v15 = sub_100013B54();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v16 = [*v8 applicationIdentifier];
      *(_DWORD *)long long buf = 136315394;
      id v36 = "-[BAAgentCore downloadQueue:manifest:finishedWithFileURL:]_block_invoke_2";
      __int16 v37 = 2114;
      uint64_t v38 = v16;
      id v17 = "%s, Will not message extension for %{public}@ because background activity is disabled.";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v17, buf, 0x16u);
    }
  }

  ((void (*)(void *, void))v7[2])(v7, 0);
LABEL_24:
}

void sub_1000248BC(uint64_t a1, char a2)
{
  id v4 = sub_100013B54();
  id v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing manifest as extension processed the manifest. %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10003AAFC();
    }

    [*(id *)(a1 + 40) scheduleContentRequestAborted];
  }
  id v7 = +[NSFileManager defaultManager];
  id v9 = sub_1000333F4(*(id *)(a1 + 32), v8);
  [v7 removeItemAtURL:v9 error:0];

  uint64_t v10 = [*(id *)(a1 + 48) workQueue];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100024A58;
  v12[3] = &unk_10005CA10;
  id v11 = *(void **)(a1 + 56);
  v12[4] = *(void *)(a1 + 48);
  id v13 = v11;
  dispatch_async(v10, v12);
}

id sub_100024A58(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serializeDownloadQueues];
}

void sub_100024A60(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = sub_1000333F4(*(id *)(a1 + 40), a2);
  id v5 = [v3 extendClientSandboxForStagedURL:v4 allowWrites:0];

  if (v5)
  {
    uint64_t v6 = [[BAAppExtensionInfo alloc] initWithApplicationInfo:*(void *)(a1 + 48)];
    uint64_t v7 = *(void *)(a1 + 96);
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v10 = sub_1000333F4(*(id *)(a1 + 40), v9);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100024DB4;
    v23[3] = &unk_10005D540;
    id v30 = *(id *)(a1 + 88);
    id v24 = *(id *)(a1 + 56);
    id v11 = *(id *)(a1 + 40);
    uint64_t v12 = *(void *)(a1 + 96);
    id v25 = v11;
    uint64_t v31 = v12;
    id v13 = *(id *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 64);
    uint64_t v15 = *(void **)(a1 + 72);
    id v26 = v13;
    uint64_t v27 = v14;
    id v28 = v15;
    id v29 = *(id *)(a1 + 80);
    [v8 requestDownloadsWithContentRequest:v7 manifestURL:v10 extensionInfo:v6 completion:v23];

    id v16 = v30;
  }
  else
  {
    id v17 = [*(id *)(a1 + 40) copy];
    uint64_t v18 = sub_100013ABC();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int8x16_t v20 = sub_1000333F4(v17, v19);
      uint64_t v21 = [*(id *)(a1 + 32) identifier];
      *(_DWORD *)long long buf = 138543874;
      id v36 = v17;
      __int16 v37 = 2114;
      uint64_t v38 = v20;
      __int16 v39 = 2114;
      long long v40 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Warning: No sandbox token issued for extension for finished download: %{public}@ URL: %{public}@ for client: %{public}@", buf, 0x20u);
    }
    sub_100029C00(-107);
    uint64_t v6 = (BAAppExtensionInfo *)objc_claimAutoreleasedReturnValue();
    sub_100032D34(v17, -1);
    id v22 = *(void **)(a1 + 32);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100024D50;
    v32[3] = &unk_10005D4F0;
    id v33 = v17;
    id v34 = *(id *)(a1 + 88);
    id v16 = v17;
    [v22 backgroundDownload:v16 failedWithError:v6 completionHandler:v32];
  }
}

uint64_t sub_100024D50(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v3 = sub_100013ABC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_10003AB64();
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100024DB4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100024EC8;
  v11[3] = &unk_10005D518;
  char v19 = a2;
  uint64_t v6 = *(NSObject **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 88);
  id v12 = v7;
  uint64_t v18 = v8;
  id v13 = *(id *)(a1 + 48);
  id v14 = v5;
  id v9 = *(void **)(a1 + 64);
  uint64_t v15 = *(void *)(a1 + 56);
  id v16 = v9;
  id v17 = *(id *)(a1 + 72);
  id v10 = v5;
  dispatch_async(v6, v11);
}

void sub_100024EC8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 88))
  {
    if ([*(id *)(a1 + 40) initialRestrictionsAreEnforced])
    {
      unsigned __int8 v2 = [*(id *)(a1 + 40) initialBackgroundCellularPolicy];
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v3 = *(id *)(a1 + 48);
      id v4 = [v3 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v4)
      {
        id v5 = v4;
        uint64_t v6 = *(void *)v34;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v34 != v6) {
              objc_enumerationMutation(v3);
            }
            uint64_t v8 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            os_unfair_lock_lock((os_unfair_lock_t)[v8 downloadLock]);
            [v8 setApplicationInformationForRestrictedDownload:*(void *)(a1 + 40)];
            id v9 = [v8 necessity];
            id v10 = [v8 necessity];
            if (v9 == (id)1)
            {
              if ((v2 & 2) != 0) {
                [v8 setPermitInitialCellularDownload:1];
              }
              [v8 setIsForegroundDownload:1];
            }
            if (!v10)
            {
              if (v2) {
                [v8 setPermitInitialCellularDownload:1];
              }
              [v8 setIsForegroundDownload:0];
            }
            os_unfair_lock_unlock((os_unfair_lock_t)[v8 downloadLock]);
          }
          id v5 = [v3 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v5);
      }
    }
    id v11 = [*(id *)(a1 + 56) telemetryQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002520C;
    block[3] = &unk_10005CC48;
    uint64_t v32 = *(void *)(a1 + 80);
    id v29 = *(id *)(a1 + 40);
    id v12 = *(id *)(a1 + 48);
    uint64_t v13 = *(void *)(a1 + 56);
    id v30 = v12;
    uint64_t v31 = v13;
    dispatch_async(v11, block);

    id v14 = *(void **)(a1 + 64);
    uint64_t v15 = *(void *)(a1 + 80);
    uint64_t v17 = *(void *)(a1 + 40);
    id v16 = *(void **)(a1 + 48);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000252A8;
    v23[3] = &unk_10005D050;
    id v24 = v16;
    id v18 = *(id *)(a1 + 40);
    uint64_t v19 = *(void *)(a1 + 56);
    id v25 = v18;
    uint64_t v26 = v19;
    id v27 = *(id *)(a1 + 72);
    [v14 scheduleContentRequest:v15 downloads:v24 applicationInfo:v17 completionHandler:v23];

    int8x16_t v20 = v29;
  }
  else
  {
    int8x16_t v20 = sub_100013B54();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v21 = *(void *)(a1 + 32);
      uint64_t v22 = *(void *)(a1 + 80);
      *(_DWORD *)long long buf = 138543618;
      uint64_t v39 = v21;
      __int16 v40 = 2048;
      uint64_t v41 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Client failed to enqueue requested downloads for manifest: %{public}@ with content request: %ld", buf, 0x16u);
    }
  }
}

void sub_10002520C(uint64_t a1)
{
  unsigned __int8 v2 = [BAContentRequestTelemetry alloc];
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = [*(id *)(a1 + 32) applicationIdentifier];
  id v5 = -[BAContentRequestTelemetry initWithContentRequest:applicationIdentifier:installSource:downloads:](v2, "initWithContentRequest:applicationIdentifier:installSource:downloads:", v3, v4, [*(id *)(a1 + 32) installSource], *(void *)(a1 + 40));

  [*(id *)(a1 + 48) setContentRequestTelemetry:v5 forDownloads:*(void *)(a1 + 40)];
}

void sub_1000252A8(uint64_t a1)
{
  unsigned __int8 v2 = sub_100013ABC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) count];
    id v4 = [*(id *)(a1 + 40) applicationIdentifier];
    *(_DWORD *)long long buf = 134349314;
    id v10 = v3;
    __int16 v11 = 2114;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Scheduled content request downloads count: %{public}lu for client: %{public}@", buf, 0x16u);
  }
  id v5 = [*(id *)(a1 + 48) workQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_1000253FC;
  v7[3] = &unk_10005CA10;
  uint64_t v6 = *(void **)(a1 + 56);
  void v7[4] = *(void *)(a1 + 48);
  id v8 = v6;
  dispatch_async(v5, v7);
}

id sub_1000253FC(uint64_t a1)
{
  [*(id *)(a1 + 32) _pokeScheduler];
  unsigned __int8 v2 = *(void **)(a1 + 32);

  return [v2 _serializeDownloadQueues];
}

void sub_100025534(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) _systemConnections];
  if ([v2 count])
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) identifier];
    id v5 = [v3 applicationInfoIfExistsForIdentifier:v4];

    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) _essentialAssetsProgressDescriptorWithAppInfo:v5 essentialAssetState:*(void *)(a1 + 56) sizeDownloaded:*(void *)(a1 + 64) totalDownloadSize:*(void *)(a1 + 72)];
    }
    else
    {
      uint64_t v6 = (uint64_t)sub_10000C64C([BAAppStoreProgressInfoDescriptor alloc], 0, -1, -1);
    }
    id v7 = (void *)v6;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = v2;
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        id v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v12);
          id v14 = [[*(id *)(a1 + 40) identifier:v15];
          [v13 reportProgressForIdentifier:v14 progressInfo:v7];

          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
}

void sub_100025A9C(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) rulesEngine];
  unsigned int v3 = [v2 isValidTimeForDownloads];

  id v4 = [*(id *)(a1 + 32) workQueue];
  id v5 = v4;
  if (v3)
  {
    uint64_t v6 = v9;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    id v7 = sub_100025B90;
  }
  else
  {
    uint64_t v6 = v8;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    id v7 = sub_100025B98;
  }
  v6[2] = v7;
  v6[3] = &unk_10005C998;
  void v6[4] = *(void *)(a1 + 32);
  dispatch_async(v4, v6);
}

id sub_100025B90(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleDownloads];
}

id sub_100025B98(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pauseDownloads];
}

void sub_100025D04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100026400(uint64_t a1)
{
  unsigned __int8 v2 = sub_100013ABC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Dumping debug agent state:", buf, 2u);
  }

  unsigned int v3 = sub_100013ABC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [*(id *)(a1 + 32) rulesEngine];
    unsigned int v5 = [v4 isValidTimeForDownloads];
    CFStringRef v6 = @"NO";
    if (v5) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)long long buf = 138543362;
    CFStringRef v81 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Allowed time for downloads: %{public}@", buf, 0xCu);
  }
  id obj = [*(id *)(a1 + 32) applicationState];
  objc_sync_enter(obj);
  id v7 = sub_100013ABC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "**** Application State Info ****", buf, 2u);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v8 = [*(id *)(a1 + 32) applicationState];
  id v9 = [v8 countByEnumeratingWithState:&v72 objects:v79 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v73;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v73 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        uint64_t v13 = sub_100013ABC();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "**** ---------------------- ****", buf, 2u);
        }

        long long v15 = [v12 debugDescription];
        long long v16 = sub_100013ABC();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          CFStringRef v17 = (const __CFString *)[v15 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          CFStringRef v81 = v17;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v72 objects:v79 count:16];
    }
    while (v9);
  }

  long long v18 = sub_100013ABC();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "**** ---------------------- ****", buf, 2u);
  }

  objc_sync_exit(obj);
  id obja = [*(id *)(a1 + 32) connections];
  objc_sync_enter(obja);
  uint64_t v19 = sub_100013ABC();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "**** Connection State Info  ****", buf, 2u);
  }

  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  int8x16_t v20 = [*(id *)(a1 + 32) connections];
  id v21 = [v20 countByEnumeratingWithState:&v68 objects:v78 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v69;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v69 != v22) {
          objc_enumerationMutation(v20);
        }
        id v24 = *(void **)(*((void *)&v68 + 1) + 8 * (void)j);
        id v25 = sub_100013ABC();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "**** ---------------------- ****", buf, 2u);
        }

        uint64_t v26 = [v24 debugDescription];
        id v27 = sub_100013ABC();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          CFStringRef v28 = (const __CFString *)[v26 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          CFStringRef v81 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
        }
      }
      id v21 = [v20 countByEnumeratingWithState:&v68 objects:v78 count:16];
    }
    while (v21);
  }

  id v29 = sub_100013ABC();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "**** ---------------------- ****", buf, 2u);
  }

  objc_sync_exit(obja);
  id objb = [*(id *)(a1 + 32) extensionConnections];
  objc_sync_enter(objb);
  id v30 = sub_100013ABC();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "**** Extension Connection State Info ****", buf, 2u);
  }

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v31 = [*(id *)(a1 + 32) extensionConnections];
  id v32 = [v31 countByEnumeratingWithState:&v64 objects:v77 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v65;
    do
    {
      for (k = 0; k != v32; k = (char *)k + 1)
      {
        if (*(void *)v65 != v33) {
          objc_enumerationMutation(v31);
        }
        uint64_t v35 = *(void *)(*((void *)&v64 + 1) + 8 * (void)k);
        long long v36 = sub_100013ABC();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "**** ---------------------- ****", buf, 2u);
        }

        __int16 v37 = [*(id *)(a1 + 32) extensionConnections];
        uint64_t v38 = [v37 objectForKey:v35];

        uint64_t v39 = [v38 debugDescription];
        __int16 v40 = sub_100013ABC();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          CFStringRef v41 = (const __CFString *)[v39 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          CFStringRef v81 = v41;
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
        }
      }
      id v32 = [v31 countByEnumeratingWithState:&v64 objects:v77 count:16];
    }
    while (v32);
  }

  id v42 = sub_100013ABC();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "**** ------------------------------- ****", buf, 2u);
  }

  objc_sync_exit(objb);
  id objc = [*(id *)(a1 + 32) downloadQueuesByClientIdentifier];
  objc_sync_enter(objc);
  id v43 = sub_100013ABC();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "**** Download Queue State Info ****", buf, 2u);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v44 = [*(id *)(a1 + 32) downloadQueuesByClientIdentifier];
  id v45 = [v44 countByEnumeratingWithState:&v60 objects:v76 count:16];
  if (v45)
  {
    uint64_t v46 = *(void *)v61;
    do
    {
      for (m = 0; m != v45; m = (char *)m + 1)
      {
        if (*(void *)v61 != v46) {
          objc_enumerationMutation(v44);
        }
        uint64_t v48 = *(void *)(*((void *)&v60 + 1) + 8 * (void)m);
        id v49 = sub_100013ABC();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "**** ---------------------- ****", buf, 2u);
        }

        id v50 = [*(id *)(a1 + 32) downloadQueuesByClientIdentifier];
        id v51 = [v50 objectForKey:v48];
        long long v52 = [v51 debugDescription];

        id v53 = sub_100013ABC();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          CFStringRef v54 = (const __CFString *)[v52 UTF8String];
          *(_DWORD *)long long buf = 136315138;
          CFStringRef v81 = v54;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
        }
      }
      id v45 = [v44 countByEnumeratingWithState:&v60 objects:v76 count:16];
    }
    while (v45);
  }

  id v55 = sub_100013ABC();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "**** ------------------------------- ****", buf, 2u);
  }

  objc_sync_exit(objc);
}

void sub_100026D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

intptr_t sub_1000272CC(uint64_t a1, int a2)
{
  if (a2 != 3)
  {
    if (a2)
    {
      unsigned int v3 = sub_100013ABC();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
        sub_10003AC6C();
      }
    }
    else
    {
      unsigned int v3 = sub_100013ABC();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 32);
        int v6 = 138543362;
        uint64_t v7 = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Extension removed with launchd: %{public}@", (uint8_t *)&v6, 0xCu);
      }
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1000273B4(uint64_t a1)
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned __int8 v2 = [*(id *)(a1 + 32) _connectionsForApplicationIdentifier:*(void *)(a1 + 40)];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (([v7 isApplication] & 1) == 0)
        {
          [v7 invalidate];
          id v8 = [*(id *)(a1 + 32) connections];
          [v8 removeObject:v7];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

int64_t sub_10002768C(id a1, BAAgentClientConnection *a2, BAAgentClientConnection *a3)
{
  id v4 = a2;
  uint64_t v5 = a3;
  if ([(BAAgentClientConnection *)v4 isApplication]
    && ![(BAAgentClientConnection *)v5 isApplication])
  {
    int64_t v6 = -1;
  }
  else
  {
    int64_t v6 = ![(BAAgentClientConnection *)v4 isApplication]
      && [(BAAgentClientConnection *)v5 isApplication];
  }

  return v6;
}

void sub_100027DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
}

void sub_1000287E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100028AD0(uint64_t a1)
{
  CFTypeRef cf = 0;
  if (lockdown_receive_message() || (CFTypeID v2 = CFGetTypeID(cf), v2 != CFDataGetTypeID()))
  {
    lockdown_disconnect();
  }
  else
  {
    id v3 = (void *)cf;
    id v6 = 0;
    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:cf error:&v6];
    id v5 = v6;
    if (v4) {
      [*(id *)(a1 + 32) _processLockdownClientMessage:v4 withConnection:*(void *)(a1 + 48) withQueue:*(void *)(a1 + 40)];
    }
    else {
      lockdown_disconnect();
    }
  }
}

id sub_1000290CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _serializeState];
}

void sub_1000291BC(uint64_t a1)
{
  CFTypeID v2 = sub_100013ABC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "NSProcessInfoPowerStateDidChangeNotification received.", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) applicationState];
  objc_sync_enter(v3);
  id v4 = [*(id *)(a1 + 32) applicationState];
  id v5 = [v4 copy];

  objc_sync_exit(v3);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v11 = [v10 applicationIdentifier:v17];
        if ([v10 allowsBackgroundActivity])
        {

          goto LABEL_17;
        }
        long long v12 = [*(id *)(a1 + 32) extensionConnections];
        objc_sync_enter(v12);
        uint64_t v13 = [*(id *)(a1 + 32) extensionConnections];
        id v14 = [v13 objectForKey:v11];

        objc_sync_exit(v12);
        if (v14) {
          [v14 invalidate];
        }
        long long v15 = [*(id *)(a1 + 32) _downloadQueueForIdentifier:v11 create:0 error:0];
        long long v16 = v15;
        if (v15) {
          [v15 cancelAllDownloads];
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v17 objects:v22 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_17:
}

void sub_1000293E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100029500(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000296B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100029B04(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100029B20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100029B44(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_100029BCC(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

id sub_100029C00(uint64_t a1)
{
  return sub_100029C14(@"BAErrorDomain", a1, 0);
}

id sub_100029C14(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  if (a3)
  {
    NSErrorUserInfoKey v9 = NSUnderlyingErrorKey;
    long long v10 = a3;
    id v6 = a3;
    a3 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  id v7 = sub_100029D04(v5, a2, a3);

  return v7;
}

id sub_100029CFC(void *a1, uint64_t a2)
{
  return sub_100029C14(a1, a2, 0);
}

void sub_100029D04(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = +[NSURL fileURLWithPath:@"/System/Library/Frameworks/BackgroundAssets.framework" isDirectory:1];
  uint64_t v8 = +[NSBundle bundleWithURL:v7];

  NSErrorUserInfoKey v9 = +[NSString stringWithFormat:@"%ld", a2];
  if ([v5 isEqualToString:@"BAErrorDomain"])
  {
    CFStringRef v10 = @"BAError";
LABEL_5:
    long long v11 = [v8 localizedStringForKey:v9 value:0 table:v10];
    if (v6)
    {
      id v12 = [v6 mutableCopy];
    }
    else
    {
      id v12 = +[NSMutableDictionary dictionary];
    }
    uint64_t v13 = v12;
    [v12 setObject:v11 forKey:NSLocalizedFailureReasonErrorKey];
    id v14 = [v13 copy];
    long long v15 = +[NSError errorWithDomain:v5 code:a2 userInfo:v14];

    id v16 = v15;
    return;
  }
  if ([v5 isEqualToString:@"BAURLDownloadErrorDomain"])
  {
    CFStringRef v10 = @"BAURLDownloadError";
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
    sub_10003B24C();
  }
  qword_1000694C8 = (uint64_t)"BUG IN BackgroundAssets: NSErrorWithBAErrorDomainCodeUserInfo() called with unsupported NSErrorDomain.";
  qword_1000694F8 = 6;
  __break(1u);
}

void sub_10002A204(uint64_t a1)
{
  [*(id *)(a1 + 32) setDebugRuleValidity:*(unsigned int *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 downloadTimeValidityDidChange];
    }
  }
}

void sub_10002A424(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_10002A5B4(_Unwind_Exception *a1)
{
  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_10002A858(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10002A878(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    if (xpc_activity_should_defer(v3) && xpc_activity_set_state(v3, 3))
    {
      id v4 = sub_100013ABC();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Periodic check fired, but activity was deferred.", v13, 2u);
      }
      goto LABEL_9;
    }
    char v5 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v5);
    uint64_t v7 = [WeakRetained delegate];
    if (!v7)
    {

      goto LABEL_11;
    }
    uint64_t v8 = (void *)v7;
    id v9 = objc_loadWeakRetained(v5);
    CFStringRef v10 = [v9 delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v4 = objc_loadWeakRetained(v5);
      id v12 = [v4 delegate];
      [v12 doPeriodicUpdateCheck];

LABEL_9:
    }
  }
LABEL_11:
}

void sub_10002A9B8(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  id v3 = sub_100013ABC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    char v5 = string;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received distnoted event: %s", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10002AB14(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    id v3 = (void *)v2;
    int v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 downloadTimeValidityDidChange];
    }
  }
}

void sub_10002B0EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_10002B11C(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    [WeakRetained _downloadFailedWithError:v6];
LABEL_3:

    goto LABEL_17;
  }
  if (v5)
  {
    uint64_t v8 = sub_100013ABC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003B2D4(v8);
    }

    id v9 = [objc_alloc((Class)CKQueryOperation) initWithCursor:v5];
    [a1[4] addOperation:v9];
  }
  else
  {
    CFStringRef v10 = [a1[5] stateLock];
    [v10 lock];

    if ([a1[5] recordFound])
    {
      unsigned __int8 v11 = [a1[5] assetFound];
      id v12 = [a1[5] stateLock];
      [v12 unlock];

      uint64_t v13 = a1 + 6;
      id v14 = objc_loadWeakRetained(a1 + 6);
      id WeakRetained = v14;
      if (v11)
      {
        unsigned __int8 v15 = [v14 _consumeAvailableDownloadSize];

        id v16 = objc_loadWeakRetained(v13);
        id WeakRetained = v16;
        if (v15)
        {
          [v16 _downloadActualAsset];
          goto LABEL_3;
        }
        uint64_t v22 = 204;
      }
      else
      {
        uint64_t v22 = -301;
      }
      id v24 = sub_100029C00(v22);
      [WeakRetained _downloadFailedWithError:v24];

      goto LABEL_3;
    }
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    id v29 = sub_10002B3D0;
    id v30 = sub_10002B3E0;
    id v31 = 0;
    long long v17 = [a1[5] recordErrors];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10002B3E8;
    v25[3] = &unk_10005D6D0;
    uint8_t v25[4] = &v26;
    [v17 enumerateKeysAndObjectsUsingBlock:v25];

    long long v18 = [a1[5] stateLock];
    [v18 unlock];

    uint64_t v19 = v27[5];
    id v20 = objc_loadWeakRetained(a1 + 6);
    id v21 = v20;
    if (v19)
    {
      [v20 _downloadFailedWithError:v27[5]];
    }
    else
    {
      id v23 = sub_100029C00(-300);
      [v21 _downloadFailedWithError:v23];
    }
    _Block_object_dispose(&v26, 8);
  }
LABEL_17:
}

void sub_10002B3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002B3D0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002B3E0(uint64_t a1)
{
}

void sub_10002B3E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  uint64_t v8 = (id *)(v7 + 40);
  if (!v9) {
    objc_storeStrong(v8, a3);
  }
  CFStringRef v10 = sub_100013B54();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10003B318();
  }
}

void sub_10002B474(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v16 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) stateLock];
  [v9 lock];

  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    unsigned __int8 v11 = [WeakRetained recordErrors];
    [v11 setObject:v8 forKey:v16];
  }
  else
  {
    [*(id *)(a1 + 32) setRecordFound:1];
    id v12 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v13 = [v12 download];
    id v14 = [v13 assetKey];
    id WeakRetained = [v7 objectForKey:v14];

    if (WeakRetained)
    {
      [*(id *)(a1 + 32) setAssetFound:1];
      [*(id *)(a1 + 32) setAssetSize:[WeakRetained size]];
    }
  }

  unsigned __int8 v15 = [*(id *)(a1 + 32) stateLock];
  [v15 unlock];
}

void sub_10002B688(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 downloadDidPause];
}

void sub_10002B7C0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    int v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 downloadFailedWithError:*(void *)(a1 + 40)];
    }
  }
}

void sub_10002B924(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    int v4 = [*(id *)(a1 + 32) delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) delegate];
      [v6 downloadSucceededWithURL:*(void *)(a1 + 40)];
    }
  }
}

void sub_10002BB30(_Unwind_Exception *a1)
{
}

void sub_10002BB50(void *a1)
{
}

void sub_10002BD34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_10002BD64(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    [WeakRetained _downloadFailedWithError:v6];
LABEL_3:

    goto LABEL_17;
  }
  if (v5)
  {
    id v8 = sub_100013ABC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003B2D4(v8);
    }

    id v9 = [objc_alloc((Class)CKQueryOperation) initWithCursor:v5];
    [a1[4] addOperation:v9];
  }
  else
  {
    CFStringRef v10 = [a1[5] stateLock];
    [v10 lock];

    if ([a1[5] recordFound])
    {
      unsigned __int8 v11 = [a1[5] assetFound];
      id v12 = a1[5];
      if (v11)
      {
        uint64_t v13 = [v12 assetURL];

        id v14 = a1[5];
        if (v13)
        {
          unsigned __int8 v15 = [v14 assetURL];
          id v16 = [v15 copy];

          long long v17 = [a1[5] stateLock];
          [v17 unlock];

          id v18 = objc_loadWeakRetained(a1 + 6);
          [v18 _downloadSucceededWithURL:v16];

          goto LABEL_17;
        }
        id v27 = [v14 stateLock];
        [v27 unlock];

        id WeakRetained = objc_loadWeakRetained(a1 + 6);
        uint64_t v25 = -302;
      }
      else
      {
        id v24 = [v12 stateLock];
        [v24 unlock];

        id WeakRetained = objc_loadWeakRetained(a1 + 6);
        uint64_t v25 = -301;
      }
      uint64_t v28 = sub_100029C00(v25);
      [WeakRetained _downloadFailedWithError:v28];

      goto LABEL_3;
    }
    uint64_t v30 = 0;
    id v31 = &v30;
    uint64_t v32 = 0x3032000000;
    uint64_t v33 = sub_10002B3D0;
    long long v34 = sub_10002B3E0;
    id v35 = 0;
    uint64_t v19 = [a1[5] recordErrors];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    void v29[2] = sub_10002C070;
    v29[3] = &unk_10005D6D0;
    v29[4] = &v30;
    [v19 enumerateKeysAndObjectsUsingBlock:v29];

    id v20 = [a1[5] stateLock];
    [v20 unlock];

    uint64_t v21 = v31[5];
    id v22 = objc_loadWeakRetained(a1 + 6);
    id v23 = v22;
    if (v21)
    {
      [v22 _downloadFailedWithError:v31[5]];
    }
    else
    {
      uint64_t v26 = sub_100029C00(-300);
      [v23 _downloadFailedWithError:v26];
    }
    _Block_object_dispose(&v30, 8);
  }
LABEL_17:
}

void sub_10002C058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10002C070(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = *(void *)(v7 + 40);
  id v8 = (id *)(v7 + 40);
  if (!v9) {
    objc_storeStrong(v8, a3);
  }
  CFStringRef v10 = sub_100013B54();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_10003B318();
  }
}

void sub_10002C0FC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v16 = a2;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [*(id *)(a1 + 32) stateLock];
  [v9 lock];

  if (v8)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    unsigned __int8 v11 = [WeakRetained recordErrors];
    [v11 setObject:v8 forKey:v16];
  }
  else
  {
    [*(id *)(a1 + 32) setRecordFound:1];
    id v12 = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v13 = [v12 download];
    id v14 = [v13 assetKey];
    id WeakRetained = [v7 objectForKey:v14];

    if (!WeakRetained) {
      goto LABEL_6;
    }
    [*(id *)(a1 + 32) setAssetFound:1];
    unsigned __int8 v11 = [WeakRetained fileURL];
    [*(id *)(a1 + 32) setAssetURL:v11];
  }

LABEL_6:
  unsigned __int8 v15 = [*(id *)(a1 + 32) stateLock];
  [v15 unlock];
}

void sub_10002C878(id a1)
{
  id v1 = +[NSMutableSet set];
  uint64_t v2 = sub_100019AD4();
  [v1 unionSet:v2];

  uint64_t v3 = +[BADownload classesForSerialization];
  [v1 unionSet:v3];

  uint64_t v7 = objc_opt_class();
  int v4 = +[NSArray arrayWithObjects:&v7 count:1];
  [v1 addObjectsFromArray:v4];

  id v5 = [v1 copy];
  id v6 = (void *)qword_1000695A8;
  qword_1000695A8 = (uint64_t)v5;
}

CFStringRef sub_10002CE90(uint64_t a1)
{
  CFStringRef v1 = @"<Unknown>";
  if (a1 == 1) {
    CFStringRef v1 = @"Essential";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Optional";
  }
}

CFStringRef sub_10002CEBC(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2) {
    return @"<Unknown>";
  }
  else {
    return *(&off_10005D760 + a1 - 1);
  }
}

void sub_10002D108(id a1)
{
  qword_1000695B8 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.mt"];

  _objc_release_x1();
}

void sub_10002D1AC(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableSet);
  uint64_t v2 = (void *)qword_1000695C8;
  qword_1000695C8 = (uint64_t)v1;

  uint64_t v3 = (void *)qword_1000695C8;
  int v4 = sub_100019AD4();
  [v3 unionSet:v4];

  [(id)qword_1000695C8 addObject:objc_opt_class()];
  [(id)qword_1000695C8 addObject:objc_opt_class()];
  id v5 = (void *)qword_1000695C8;
  uint64_t v6 = objc_opt_class();

  [v5 addObject:v6];
}

void sub_10002EF08(id a1, id a2)
{
  uint64_t v3 = v2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002EF9C;
  block[3] = &unk_10005CF48;
  id v6 = a2;
  id v4 = v6;
  dispatch_async(v3, block);
}

uint64_t sub_10002EF9C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003033C(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x100030244);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100030C94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100031630(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100031658(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 downloadDidBegin:*(void *)(a1 + 32)];
}

void sub_100031984(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 download:*(void *)(a1 + 32) failedWithError:*(void *)(a1 + 40)];
}

void sub_100031AC8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 downloadDidPause:*(void *)(a1 + 32)];
}

void sub_100031D0C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 download:*(void *)(a1 + 32) finishedWithFileURL:*(void *)(a1 + 40)];
}

void sub_100032140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100032288(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1000322C0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void sub_100032300(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void sub_1000323EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100032D34(void *a1, uint64_t a2)
{
  if (a1)
  {
    id obj = a1;
    objc_sync_enter(obj);
    obj[4] = a2;
    objc_sync_exit(obj);
  }
}

void sub_100032D90(void *a1, char *newValue)
{
  if (a1) {
    objc_setProperty_atomic(a1, newValue, newValue, 80);
  }
}

void sub_100032DA4(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v4 = [a1 necessity];
    if (a2 || v4 != (id)1 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id obj = a1;
      objc_sync_enter(obj);
      obj[6] = a2;
      objc_sync_exit(obj);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT)) {
        sub_10003B7C8();
      }
      qword_1000694C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: The provided fileSize for BADownload must be a posit"
                                 "ive number that matches the actual file size on the server.";
      __break(1u);
    }
  }
}

void sub_100033350(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100033364(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = a1;
  objc_sync_enter(v1);
  uint64_t v2 = v1[4];
  objc_sync_exit(v1);

  return v2;
}

uint64_t sub_1000333AC(void *a1)
{
  if (!a1) {
    return 0;
  }
  id v1 = a1;
  objc_sync_enter(v1);
  uint64_t v2 = v1[6];
  objc_sync_exit(v1);

  return v2;
}

id sub_1000333F4(id result, const char *a2)
{
  if (result) {
    return objc_getProperty(result, a2, 80, 1);
  }
  return result;
}

void sub_100033634(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100034AA0(id a1)
{
  qword_1000695E0 = objc_opt_new();

  _objc_release_x1();
}

void sub_100034ADC(uint64_t a1)
{
  [*(id *)(a1 + 32) _validateAndSetClientIdentifier];
  uint64_t v2 = [*(id *)(a1 + 32) applicationBundleIdentifier];

  if (v2)
  {
    uint64_t v3 = (void *)qword_1000695E0;
    id v5 = [*(id *)(a1 + 32) applicationBundleIdentifier];
    id v4 = [v3 blockQueueWithIdentifier:v5];
    [*(id *)(a1 + 32) setExclusiveAccessBlockQueue:v4];
  }
}

void sub_100034C2C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) lastExclusiveAccessBlockToken];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) exclusiveAccessBlockQueue];
    uint64_t v3 = [*(id *)(a1 + 32) lastExclusiveAccessBlockToken];
    [v4 drainSpecificWithToken:v3];
  }
}

uint64_t sub_100034DFC(uint64_t a1)
{
  uint64_t result = (uint64_t)[*(id *)(a1 + 32) connectionIsValid];
  if (result)
  {
    uint64_t v3 = +[BAAgentCore sharedCore];
    id v4 = [*(id *)(a1 + 32) applicationBundleIdentifier];
    [v3 downloadsForIdentifier:v4];
    objc_claimAutoreleasedReturnValue();

    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t))(v5 + 16))(v5);
    }
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (!v6) {
      return result;
    }
    sub_100029C00(56);
    objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }

  return _objc_release_x1();
}

void sub_100034FD8(id *a1)
{
  if ([a1[4] connectionIsValid])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v2 = a1[4];
      id v3 = a1[5];
      id v20 = 0;
      unsigned __int8 v4 = [v2 _entitledForCloudKitWithDownload:v3 outError:&v20];
      id v5 = v20;
      uint64_t v6 = v5;
      if ((v4 & 1) == 0)
      {
LABEL_16:
        id v16 = (void (**)(id, void, void *))a1[6];
        if (v16) {
          v16[2](v16, 0, v6);
        }

        return;
      }
    }
    if (([a1[4] isApplication] & 1) != 0
      || ([a1[4] applicationBundleIdentifier],
          uint64_t v7 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v8 = +[BAApplicationInfo applicationForIdentifierAllowsBackgroundActivity:v7], v7, (v8 & 1) != 0))
    {
      if ([a1[4] isApplication])
      {
        if ([a1[4] isActive])
        {
          os_unfair_lock_lock((os_unfair_lock_t)[a1[5] downloadLock]);
          [a1[5] setIsForegroundDownload:1];
          os_unfair_lock_unlock((os_unfair_lock_t)[a1[5] downloadLock]);
        }
      }
      id v9 = a1[5];
      CFStringRef v10 = [a1[4] applicationBundleIdentifier];
      [v9 setApplicationIdentifier:v10];

      unsigned __int8 v11 = +[BAAgentCore sharedCore];
      id v12 = a1[5];
      uint64_t v13 = [a1[4] applicationBundleIdentifier];
      id v14 = [a1[4] clientWorkQueue];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10003523C;
      v18[3] = &unk_10005D190;
      id v19 = a1[6];
      [v11 scheduleDownload:v12 forClientIdentifier:v13 notifyQueue:v14 completionBlock:v18];

      return;
    }
    uint64_t v6 = sub_100029C00(111);
    goto LABEL_16;
  }
  unsigned __int8 v15 = (void (**)(id, void, id))a1[6];
  if (v15)
  {
    sub_100029C00(55);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v17);
  }
}

uint64_t sub_10003523C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100035314(uint64_t a1)
{
  if ([*(id *)(a1 + 32) connectionIsValid])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v2 = [*(id *)(a1 + 32) exclusiveAccessBlockQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100035470;
    v5[3] = &unk_10005D950;
    objc_copyWeak(&v7, &location);
    id v6 = *(id *)(a1 + 40);
    [v2 enqueue:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 40);
    sub_100029C00(55);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id, void))(v3 + 16))(v3, 0, v4, 0);
  }
}

void sub_10003544C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100035470(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setLastExclusiveAccessBlockToken:v8];

  uint64_t v6 = *(void *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, uint64_t, void, id))(v6 + 16))(v6, 1, 0, v8);
  }
  else
  {
    id v7 = sub_100029C00(-400);
    (*(void (**)(uint64_t, void, void *, id))(v6 + 16))(v6, 0, v7, v8);
  }
}

void sub_100035604(uint64_t a1)
{
  if ([*(id *)(a1 + 32) connectionIsValid])
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    uint64_t v2 = [*(id *)(a1 + 32) exclusiveAccessBlockQueue];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100035764;
    v5[3] = &unk_10005D950;
    objc_copyWeak(&v7, &location);
    id v6 = *(id *)(a1 + 48);
    [v2 enqueue:v5 waitLimitDate:*(void *)(a1 + 40)];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    sub_100029C00(55);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void, id, void))(v3 + 16))(v3, 0, v4, 0);
  }
}

void sub_100035740(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100035764(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setLastExclusiveAccessBlockToken:v8];

  uint64_t v6 = *(void *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, uint64_t, void, id))(v6 + 16))(v6, 1, 0, v8);
  }
  else
  {
    id v7 = sub_100029C00(-400);
    (*(void (**)(uint64_t, void, void *, id))(v6 + 16))(v6, 0, v7, v8);
  }
}

void sub_1000358D4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  if ([*(id *)(a1 + 32) connectionIsValid])
  {
    uint64_t v3 = [*(id *)(a1 + 32) exclusiveAccessBlockQueue];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v4 = a1 + 40;
    unsigned __int8 v6 = [v3 consumeToken:v5];

    if ((v6 & 1) == 0)
    {
      id v7 = sub_100013B54();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_10003B8D8(v4, v2);
      }
    }
  }
}

void sub_1000367F4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) connectionIsValid])
  {
    if ([*(id *)(a1 + 32) isApplication])
    {
      if ([*(id *)(a1 + 32) isActive])
      {
        uint64_t v2 = *(void **)(a1 + 40);
        uint64_t v3 = [*(id *)(a1 + 32) applicationBundleIdentifier];
        [v2 setApplicationIdentifier:v3];

        uint64_t v4 = +[BAAgentCore sharedCore];
        uint64_t v5 = *(void *)(a1 + 40);
        unsigned __int8 v6 = [*(id *)(a1 + 32) applicationBundleIdentifier];
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_10003696C;
        v10[3] = &unk_10005D190;
        id v11 = *(id *)(a1 + 48);
        [v4 startForegroundDownload:v5 forClientIdentifier:v6 completionBlock:v10];

        return;
      }
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = 51;
    }
    else
    {
      uint64_t v7 = *(void *)(a1 + 48);
      uint64_t v8 = 50;
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = 55;
  }
  sub_100029C00(v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v7 + 16))(v7, 0, v9);
}

uint64_t sub_10003696C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100036A68(uint64_t a1)
{
  uint64_t v2 = +[BAAgentCore sharedCore];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) applicationBundleIdentifier];
  uint64_t v5 = [v2 downloadForIdentifier:v3 forClientIdentifier:v4];

  if ([*(id *)(a1 + 40) connectionIsValid])
  {
    unsigned __int8 v6 = +[BAAgentCore sharedCore];
    uint64_t v7 = [*(id *)(a1 + 40) applicationBundleIdentifier];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100036BB0;
    v9[3] = &unk_10005D978;
    id v10 = *(id *)(a1 + 48);
    [v6 cancelDownload:v5 forClientIdentifier:v7 completionBlock:v9];
  }
  else
  {
    uint64_t v8 = sub_100029C00(55);
    [v2 download:v5 failedWithError:v8];
  }
}

uint64_t sub_100036BB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100036CC0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) connectionIsValid])
  {
    [*(id *)(a1 + 40) UTF8String];
    if (sandbox_extension_consume() == -1)
    {
      uint64_t v10 = *__error();
      CFStringRef v21 = @"FileURL";
      id v11 = *(void **)(a1 + 48);
      id v12 = v11;
      if (!v11)
      {
        id v12 = +[NSNull null];
      }
      id v22 = v12;
      uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      id v14 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v10 userInfo:v13];

      if (!v11) {
      uint64_t v15 = *(void *)(a1 + 56);
      }
      id v16 = sub_100029C14(@"BAErrorDomain", -108, v14);
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
    }
    else
    {
      uint64_t v18 = 66564;
      if (fsctl((const char *)[*(id *)(a1 + 48) fileSystemRepresentation], 0xC0084A44uLL, &v18, 0))
      {
        uint64_t v2 = *__error();
        CFStringRef v19 = @"FileURL";
        uint64_t v3 = *(void **)(a1 + 48);
        uint64_t v4 = v3;
        if (!v3)
        {
          uint64_t v4 = +[NSNull null];
        }
        id v20 = v4;
        uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
        unsigned __int8 v6 = +[NSError errorWithDomain:NSPOSIXErrorDomain code:v2 userInfo:v5];

        if (!v3) {
        sandbox_extension_release();
        }
        uint64_t v7 = *(void *)(a1 + 56);
        uint64_t v8 = sub_100029C14(@"BAErrorDomain", -57, v6);
        (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
      }
      else
      {
        sandbox_extension_release();
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      }
    }
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 56);
    sub_100029C00(55);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void))(v9 + 16))(v9, 0);
  }
}

void sub_100037050(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = sub_100013B54();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10003C114(v2);
  }
}

void sub_10003717C(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) connectionIsValid];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100037220;
  v4[3] = &unk_10005D9E8;
  uint64_t v3 = *(NSObject **)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  unsigned __int8 v6 = v2;
  dispatch_async(v3, v4);
}

uint64_t sub_100037220(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_100037300(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100013B54();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003C1A8(a1, (uint64_t)v3);
  }
}

void sub_10003742C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100013B54();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003C240(a1, (uint64_t)v3);
  }
}

void sub_100037558(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100013B54();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003C2D8(a1, (uint64_t)v3);
  }
}

void sub_1000376A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100013B54();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003C370(a1, (uint64_t)v3);
  }
}

void sub_100037830(uint64_t a1)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  unsigned __int8 v2 = [*(id *)(a1 + 32) connection];
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  uint64_t v7 = sub_100037950;
  uint64_t v8 = &unk_10005CAD8;
  uint64_t v10 = &v11;
  id v9 = *(id *)(a1 + 40);
  id v3 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&v5];
  [v3 downloadIdentifier:*(void *)(a1 + 40) didReceiveChallenge:*(void *)(a1 + 48) authChallengeHandler:*(void *)(a1 + 56) v5, v6, v7, v8];

  uint64_t v4 = *(void *)(a1 + 64);
  if (v4) {
    (*(void (**)(uint64_t, void))(v4 + 16))(v4, *((unsigned __int8 *)v12 + 24));
  }

  _Block_object_dispose(&v11, 8);
}

void sub_100037938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100037950(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  uint64_t v4 = sub_100013B54();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003C408(a1, (uint64_t)v3);
  }
}

void sub_100037B28(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100013B54();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003C4A0(a1, (uint64_t)v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100037BA0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100037D18(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100013B54();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10003C538(a1, (uint64_t)v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100037D90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10003813C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_10003815C(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_10003817C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000381F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038274(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000382F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003836C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000383E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100038464(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000384E0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Download %{public}@ rejected based on download allowance check.", (uint8_t *)&v2, 0xCu);
}

void sub_100038558(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Download %{public}@ rejected based on domain check.", (uint8_t *)&v2, 0xCu);
}

void sub_1000385D0()
{
  int v0 = 136315138;
  id v1 = "BAURLDownload returned an NSData, which is highly unexpected.";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN BackgroundAssets: %s", (uint8_t *)&v0, 0xCu);
}

void sub_100038658(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "BAURLDownload+Agent: File data was returned, which is invalid. Daemon will crash. Download: %{public}@. Data: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_1000386E4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Download %{public}@ has no final size.", (uint8_t *)&v2, 0xCu);
}

void sub_10003875C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fatal: Wakeup extension errored out.\n", v1, 2u);
}

void sub_1000387A0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fatal: Wakeup extension timed out.\n", v1, 2u);
}

void sub_1000387E4(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Extension interrupted for identifier: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_100038860(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Fatal: Extension failed to send wakeup message. %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000388D8()
{
  sub_10000B0A0();
  [v1 identifier];
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_10000B0AC() description];
  sub_10000B064();
  sub_10000B080((void *)&_mh_execute_header, v3, v4, "Failed in %s for: %{public}@. Unable to extend sandbox for manifest URL: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_100038980()
{
  sub_10000B0A0();
  [(id)sub_10000B0B8(v1) identifier];
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_10000B0AC() description];
  sub_10000B064();
  sub_10000B080((void *)&_mh_execute_header, v3, v4, "Failed to send %s for: %{public}@ error: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_100038A28()
{
  sub_10000B0A0();
  [(id)sub_10000B0B8(v1) identifier];
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_10000B0AC() description];
  sub_10000B064();
  sub_10000B080((void *)&_mh_execute_header, v3, v4, "Failed to send %s for: %{public}@ error: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_100038AD0()
{
  sub_10000B0A0();
  [(id)sub_10000B0B8(v1) identifier];
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_10000B0AC() description];
  sub_10000B064();
  sub_10000B080((void *)&_mh_execute_header, v3, v4, "Failed to send %s for: %{public}@ error: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_100038B78()
{
  sub_10000B0A0();
  [(id)sub_10000B0B8(v1) identifier];
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_10000B0AC() description];
  sub_10000B064();
  sub_10000B080((void *)&_mh_execute_header, v3, v4, "Failed to send %s for: %{public}@ error: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_100038C20()
{
  sub_10000B0A0();
  [(id)sub_10000B0B8(v1) identifier];
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_10000B0AC() description];
  sub_10000B064();
  sub_10000B080((void *)&_mh_execute_header, v3, v4, "Failed to send %s for: %{public}@ error: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_100038CC8(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 identifier];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Warning: Inbalanced decrement of extension wake assertion detected for identifier (%{public}@). File a radar.", (uint8_t *)&v4, 0xCu);
}

void sub_100038D64(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to take power assertion for rules engine.", v1, 2u);
}

void sub_100038DA8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to look up LS app proxy for %{public}@, cannot determine installation source.", (uint8_t *)&v2, 0xCu);
}

void sub_100038E20(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Determining installation source for %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100038E98()
{
  sub_10000EDF0();
  sub_10000EDD4((void *)&_mh_execute_header, v0, v1, "consume-extension-time was called without the required 2 arguments, ignoring.", v2, v3, v4, v5, v6);
}

void sub_100038ECC()
{
  sub_10000EDF0();
  sub_10000EDD4((void *)&_mh_execute_header, v0, v1, "reset-extension-time requires an identifier, ignoring.", v2, v3, v4, v5, v6);
}

void sub_100038F00()
{
  sub_10000EDF0();
  sub_10000EDD4((void *)&_mh_execute_header, v0, v1, "reset-extension-time was called without the required singular identifier argument, ignoring.", v2, v3, v4, v5, v6);
}

void sub_100038F34()
{
  sub_10000EDF0();
  sub_10000EDD4((void *)&_mh_execute_header, v0, v1, "send-telemetry-event requires a valid identifier, ignoring.", v2, v3, v4, v5, v6);
}

void sub_100038F68()
{
  sub_10000EDF0();
  sub_10000EDD4((void *)&_mh_execute_header, v0, v1, "send-telemetry-event was called without specifying an application identifier.", v2, v3, v4, v5, v6);
}

void sub_100038F9C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  int v4 = 136446466;
  uint64_t v5 = "-[BAAgentSystemConnection reportProgressForIdentifier:progressInfo:]_block_invoke";
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Message failed: %{public}s error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_100039048(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "BAURLSession: Unable to create destination directory due to error: %@ - Falling back to BATemporaryDirectory()", (uint8_t *)&v2, 0xCu);
}

void sub_1000390C0(void *a1)
{
  int v2 = [a1 identifier];
  [a1 uniqueIdentifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)sub_10000B0AC() identifier];
  sub_1000196D4();
  sub_10000B080((void *)&_mh_execute_header, v4, v5, "Rejecting download (%{public}@ , %{public}@) because it is already scheduled in (%{public}@).", v6, v7, v8, v9, v10);
}

void sub_100039178(void *a1)
{
  int v2 = [a1 identifier];
  [a1 uniqueIdentifier];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [(id)sub_10000B0AC() identifier];
  sub_1000196D4();
  sub_10000B080((void *)&_mh_execute_header, v4, v5, "Rejecting download (%{public}@ , %{public}@) because [necessity==Essential]. App:(%{public}@).", v6, v7, v8, v9, v10);
}

void sub_100039230()
{
  sub_10000B0A0();
  [v1 identifier];
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_10000B0AC() identifier];
  sub_10001969C();
  sub_1000196B4((void *)&_mh_execute_header, v3, v4, "Requested foreground on download that does not appear to be scheduled.\nDownload: %{public}@\nClient: %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000392CC()
{
  sub_10000B0A0();
  [v1 identifier];
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_10000B0AC() identifier];
  sub_10001969C();
  sub_1000196B4((void *)&_mh_execute_header, v3, v4, "Requested foreground on download that is marked as essential.\nDownload: %{public}@\nClient: %{public}@", v5, v6, v7, v8, v9);
}

void sub_100039368()
{
  sub_10000B0A0();
  [v1 identifier];
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_10000B0AC() identifier];
  sub_10001969C();
  sub_1000196B4((void *)&_mh_execute_header, v3, v4, "Requested foreground on frozen queue for download: %{public}@\nClient: %{public}@", v5, v6, v7, v8, v9);
}

void sub_100039404()
{
  sub_10000B0A0();
  [v1 identifier];
  objc_claimAutoreleasedReturnValue();
  int v2 = [(id)sub_10000B0AC() identifier];
  sub_10001969C();
  sub_1000196B4((void *)&_mh_execute_header, v3, v4, "Requested foreground on an optional download representing an existing essential download. This will be ignored.\nDownload: %{public}@\nClient: %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000394A0()
{
  sub_1000199E8();
  sub_100019A00((void *)&_mh_execute_header, v0, v1, "Failed to create BATemporaryDirectory() = '%@': %s");
}

void sub_100039508(uint64_t a1, unsigned __int16 *a2, os_log_t log)
{
  int v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "The BATemporaryDirectory() = '%@' is not a directory [mode:%o]. Recreating...", (uint8_t *)&v4, 0x12u);
}

void sub_100039594()
{
  sub_1000199E8();
  sub_100019A00((void *)&_mh_execute_header, v0, v1, "Unable to stat BATemporaryDirectory() = '%@': %s");
}

void sub_1000395FC(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Failed to read developer mode status: %{darwin.errno}d", (uint8_t *)v3, 8u);
}

void sub_10003968C(os_log_t log)
{
  int v1 = 138543362;
  CFStringRef v2 = @"com.apple.appstored";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to synchronized CFPreferencesApp for %{public}@", (uint8_t *)&v1, 0xCu);
}

void sub_100039710(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to checkin to begin listening for lockdown clients. Error: %d", (uint8_t *)v2, 8u);
}

void sub_100039788(void *a1, NSObject *a2)
{
  int v4 = [a1 serviceName];
  if (v4)
  {
    uint64_t v5 = [a1 serviceName];
  }
  else
  {
    uint64_t v5 = @"???";
  }
  int v6 = 138543618;
  int v7 = v5;
  __int16 v8 = 1026;
  unsigned int v9 = [a1 processIdentifier];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Connection to service: %{public}@ from pid:%{public}d has invalid service name.", (uint8_t *)&v6, 0x12u);
  if (v4) {
}
  }

void sub_100039868(void *a1)
{
  [a1 processIdentifier];
  sub_100029BD8();
  _os_log_error_impl(v1, v2, v3, v4, v5, 8u);
}

void sub_1000398EC(uint64_t a1)
{
  [*(id *)(a1 + 48) processIdentifier];
  int v7 = [*(id *)(a1 + 56) description];
  sub_100029BD8();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);
}

void sub_1000399A4()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Rejecting launch of extension for %{public}@ because an extension identity could not be created.", v2, v3, v4, v5, v6);
}

void sub_100039A0C(void *a1, NSObject *a2)
{
  id v3 = [a1 description];
  [v3 UTF8String];
  sub_100029B38();
  sub_100029B20((void *)&_mh_execute_header, a2, v4, "Failed to get extension process: %{public}s", v5);
}

void sub_100039AA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100039ADC(void *a1, NSObject *a2)
{
  id v3 = [a1 description];
  [v3 UTF8String];
  sub_100029B38();
  sub_100029B20((void *)&_mh_execute_header, a2, v4, "Extension representation failed to generate XPC connection: %{public}s", v5);
}

void sub_100039B74(void *a1, NSObject *a2)
{
  id v3 = [a1 description];
  sub_100029B38();
  sub_100029B20((void *)&_mh_execute_header, a2, v4, "Rejected extension connection (%{public}@) for mismatched team id", v5);
}

void sub_100039C04(void *a1, NSObject *a2)
{
  id v3 = [a1 description];
  sub_100029B38();
  sub_100029B20((void *)&_mh_execute_header, a2, v4, "failed to establish connection for extension (%{public}@)", v5);
}

void sub_100039C94()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Rejecting launching extension for %{public}@ because it has already run too long.", v2, v3, v4, v5, v6);
}

void sub_100039CFC()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Rejecting talking to extension %{public}@ because the background activity is not allowed.", v2, v3, v4, v5, v6);
}

void sub_100039D64()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Event (Canceled) dropped for client (%{public}@) failed because there is no app-info matching the identifier.", v2, v3, v4, v5, v6);
}

void sub_100039DCC()
{
  sub_10000B0A0();
  [v0 UTF8String];
  sub_100029B5C();
  sub_1000196B4((void *)&_mh_execute_header, v1, v2, "Event (Canceled) failed for client (%{public}s) because an error occured. %{public}@", v3, v4, v5, v6, v7);
}

void sub_100039E48()
{
  sub_100029B8C();
  sub_100029B44((void *)&_mh_execute_header, v0, (uint64_t)v0, "Unable to update application info. LSBundleRecord from identifier failed (bundle identifier: %{public}@) %{public}@", v1);
}

void sub_100039EB8()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Unable to update application info, no info dictionary could be found from LSBundleRecord. (bundle identifier: %{public}@)", v2, v3, v4, v5, v6);
}

void sub_100039F20()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Unable to update application info, bundle record returned is not an LSApplicationRecord. (bundle identifier: %{public}@)", v2, v3, v4, v5, v6);
}

void sub_100039F88()
{
  sub_100029B8C();
  sub_100029B44((void *)&_mh_execute_header, v0, (uint64_t)v0, "Unable to update application info, cannot create NSBundle from path. (bundle identifier: %{public}@, url: %{public}@)", v1);
}

void sub_100039FF8()
{
  sub_100029B8C();
  sub_100029B44((void *)&_mh_execute_header, v0, (uint64_t)v0, "Unable to update application info, no info dictionary could be found. (bundle identifier: %{public}@, path: %{public}@)", v1);
}

void sub_10003A068()
{
  sub_10000B0A0();
  [v0 UTF8String];
  sub_100029BE8();
  sub_1000196B4((void *)&_mh_execute_header, v1, v2, "Event (%ld) dropped for client (%{public}s) failed because client Info dictionary is not accessible or valid.", v3, v4, v5, v6, v7);
}

void sub_10003A0E4()
{
  sub_10000B0A0();
  [v0 UTF8String];
  sub_100029BB0();
  sub_10000B080((void *)&_mh_execute_header, v1, v2, "Event (%ld) dropped for client (%{public}s) failed because client Info dictionary is missing its '%{public}@' key.", v3, v4, v5, v6, 2u);
}

void sub_10003A174()
{
  sub_10000B0A0();
  [v0 UTF8String];
  sub_100029BE8();
  sub_1000196B4((void *)&_mh_execute_header, v1, v2, "Event (%ld) dropped for client (%{public}s) failed because the app and extension do not share any application groups.", v3, v4, v5, v6, v7);
}

void sub_10003A1F0(void *a1, NSObject *a2)
{
  [a1 UTF8String];
  sub_100029B38();
  sub_100029B20((void *)&_mh_execute_header, a2, v3, "Duplicate Event (Installed) received for client (%{public}s), ignoring.", v4);
}

void sub_10003A274()
{
  sub_10000B0A0();
  [*(id *)(v0 + 32) UTF8String];
  sub_100029B5C();
  sub_1000196B4((void *)&_mh_execute_header, v1, v2, "Event (Paused) failed for client (%{public}s) because an error occured. %{public}@", v3, v4, v5, v6, v7);
}

void sub_10003A2F4()
{
  sub_10000B0A0();
  [*(id *)(v0 + 32) UTF8String];
  sub_100029B5C();
  sub_1000196B4((void *)&_mh_execute_header, v1, v2, "Event (Resumed) failed for client (%{public}s) because an error occured. %{public}@", v3, v4, v5, v6, v7);
}

void sub_10003A374()
{
  sub_10000B0A0();
  [*(id *)(v0 + 32) UTF8String];
  sub_100029BB0();
  sub_100029BD8();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x2Au);
}

void sub_10003A420(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint8_t v7 = [a2 applicationIdentifier];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Unable to observe extension for (%{public}@), the BAApplicationInfo is missing an extensionIdentity.", a1, 0xCu);
}

void sub_10003A498()
{
  sub_10000B0A0();
  uint64_t v1 = [v0 identifier];
  sub_100029B5C();
  sub_1000196B4((void *)&_mh_execute_header, v2, v3, "Unable to get RBS state because fetching a LSBundleRecord for (%{public}@) failed. %{public}@", v4, v5, v6, v7, v8);
}

void sub_10003A524()
{
  sub_10000B0A0();
  uint64_t v1 = [v0 identifier];
  uint64_t v2 = (objc_class *)objc_opt_class();
  unsigned int v9 = NSStringFromClass(v2);
  sub_1000196B4((void *)&_mh_execute_header, v3, v4, "Unable to get RBS state for extension (%{public}@). Containing bundle record is not an application record. (Class:%{public}@)", v5, v6, v7, v8, 2u);
}

void sub_10003A5D8()
{
  sub_100029B74();
  sub_100029B44((void *)&_mh_execute_header, v0, (uint64_t)v0, "Cannot message extension for '%{public}@' to answer auth challenge, canceling challenge for download: %{public}@", v1);
}

void sub_10003A650()
{
  sub_100029B74();
  sub_100029B44((void *)&_mh_execute_header, v0, (uint64_t)v0, "Timed out messaging client for '%{public}@' to answer auth challenge for download: %{public}@", v1);
}

void sub_10003A6C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003A700()
{
  sub_100029B74();
  sub_100029B44((void *)&_mh_execute_header, v0, v1, "Download did fail: %{public}@ with error: %{public}@", v2);
}

void sub_10003A770()
{
  sub_100029BCC(__stack_chk_guard);
  sub_100029BA4();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Failed to notify anyone about failed download: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003A7D8()
{
  int v0 = 136315138;
  uint64_t v1 = "BAAgentCore received a finished file that was a BAManifestDownload. This is invalid.";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN BackgroundAssets: %s", (uint8_t *)&v0, 0xCu);
}

void sub_10003A860()
{
  sub_100029BA4();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Failed to find extension for installed application, removing download. %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003A8CC()
{
  sub_100029BCC(__stack_chk_guard);
  sub_100029BA4();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Failed to notify extension about failed manifest download: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003A934()
{
  sub_100029BCC(__stack_chk_guard);
  sub_100029BA4();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Failed to notify extension about finished download: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003A99C(id *a1)
{
  uint64_t v7 = [*a1 applicationIdentifier];
  sub_1000196B4((void *)&_mh_execute_header, v1, v2, "%s, Failed to access extension for %{public}@.", v3, v4, v5, v6, 2u);
}

void sub_10003AA3C()
{
  sub_10000B0A0();
  sub_10000C064(*v1);
  uint64_t v8 = [*v0 applicationIdentifier];
  sub_10000B080((void *)&_mh_execute_header, v2, v3, "%s, Manifest received with unsupported application event %{public}ld for %{public}@.", v4, v5, v6, v7, 2u);
}

void sub_10003AAFC()
{
  sub_100029BCC(__stack_chk_guard);
  sub_100029BA4();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Removing manifest download as extension did not handle manifest. %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003AB64()
{
  sub_100029BCC(__stack_chk_guard);
  sub_100029BA4();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Failed to notify extension about failed manifest download due to sandbox extension issue: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003ABCC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10003AC04()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Failed to acquire termination assertion for extension: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003AC6C()
{
  sub_100029BCC(__stack_chk_guard);
  sub_100029BA4();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Extension failed to be removed with launchd: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003ACD4()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Failed to deserialize application state: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003AD3C()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "failed to open application state URL: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003ADA4(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_100029B20((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to load serialized application state with error: %{public}@", (uint8_t *)a2);
}

void sub_10003ADF4()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Failed to deserialize download queues: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003AE5C()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "failed to open download queue URL: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003AEC4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 error];
  sub_100029B38();
  sub_100029B20((void *)&_mh_execute_header, a2, v4, "Failed to load serialized downloads with error: %{public}@", v5);
}

void sub_10003AF50()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Failed to deserialize events file: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003AFB8()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "failed to open deserialize events URL: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003B020(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 error];
  sub_100029B38();
  sub_100029B20((void *)&_mh_execute_header, a2, v4, "Failed to load deserialize events with error: %{public}@", v5);
}

void sub_10003B0AC()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Failed to serialize download queues: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003B114()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Failed to serialize application state: %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003B17C()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Unable to generate archived representation of BADeveloperDebugServerMessage. %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003B1E4()
{
  sub_100029B38();
  sub_100029B04((void *)&_mh_execute_header, v0, v1, "Requested background activity for application identifier that is not known to BAAgentCore. %{public}@", v2, v3, v4, v5, v6);
}

void sub_10003B24C()
{
  int v0 = 136315138;
  uint64_t v1 = "NSErrorWithBAErrorDomainCodeUserInfo() called with unsupported NSErrorDomain.";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN BackgroundAssets: %s", (uint8_t *)&v0, 0xCu);
}

void sub_10003B2D4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "A cursor was returned, this is unexpected for 1 result; is the operation hung? This is why.",
    v1,
    2u);
}

void sub_10003B318()
{
  sub_100029B8C();
  sub_100019A00((void *)&_mh_execute_header, v0, v1, "CKRecordID: %{public}@ returned an error: %{public}@");
}

void sub_10003B380()
{
  int v0 = 136315138;
  os_log_t v1 = "BAUnhandledDownloadEvent initialized with a failure event but a nil error.";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN BackgroundAssets: %s", (uint8_t *)&v0, 0xCu);
}

void sub_10003B408()
{
  int v0 = 136315138;
  os_log_t v1 = "BAUnhandledDownloadEvent initialized from coder as a failure event but with a nil error.";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN BackgroundAssets: %s", (uint8_t *)&v0, 0xCu);
}

void sub_10003B490()
{
  sub_100029B38();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Application identifier (%{public}@) is not valid Universal Type Identifier. Failing.", v1, 0xCu);
}

void sub_10003B504()
{
  sub_100029B38();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to find represented extension point. (ID:%{public}@", v1, 0xCu);
}

void sub_10003B578(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 bundleIdentifier];
  sub_100029B38();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Extension (%{public}@) is not part of a application bundle. Failing.", v4, 0xCu);
}

void sub_10003B60C(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 bundleIdentifier];
  sub_100029B38();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Application bundle (%{public}@) is not the same as the bundle id (%{public}@). Failing.", v6, 0x16u);
}

void sub_10003B6B8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Download %{public}@ rejected as we are out of download allowance.", (uint8_t *)&v2, 0xCu);
}

void sub_10003B730(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 applicationIdentifier];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Dropping download because application identifier is invalid: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_10003B7C8()
{
  int v0 = 136315138;
  os_log_t v1 = "The provided fileSize for BADownload must be a positive number that matches the actual file size on the server.";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v0, 0xCu);
}

void sub_10003B850()
{
  int v0 = 136315138;
  os_log_t v1 = "Cannot provide an unsupported BADownloadNecessity.";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN CLIENT OF BackgroundAssets: %s", (uint8_t *)&v0, 0xCu);
}

void sub_10003B8D8(uint64_t a1, id *a2)
{
  int v2 = [*a2 applicationBundleIdentifier];
  sub_10003816C();
  sub_1000196B4((void *)&_mh_execute_header, v3, v4, "Failed to consume token: %@ for client: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_10003B974()
{
  sub_10000EDF0();
  sub_10000EDD4((void *)&_mh_execute_header, v0, v1, "Failed to get executable path from audit token.", v2, v3, v4, v5, v6);
}

void sub_10003B9A8()
{
  sub_10000EDF0();
  sub_10000EDD4((void *)&_mh_execute_header, v0, v1, "Executable path from audit token is invalid or is of an empty length.", v2, v3, v4, v5, v6);
}

void sub_10003B9DC()
{
  sub_10000EDF0();
  sub_10000EDD4((void *)&_mh_execute_header, v0, v1, "Unable to construct a SecTaskRef from client audit token.", v2, v3, v4, v5, v6);
}

void sub_10003BA10()
{
  sub_10000EDF0();
  sub_10000EDD4((void *)&_mh_execute_header, v0, v1, "Code signed Info.plist is nil", v2, v3, v4, v5, v6);
}

void sub_10003BA44()
{
  sub_100029B38();
  sub_100029B20((void *)&_mh_execute_header, v0, v1, "Failed to lookup LSBundleRecord for audit token. %{public}@", v2);
}

void sub_10003BAB0()
{
  sub_100029B38();
  sub_100029B20((void *)&_mh_execute_header, v0, v1, "Bundle identifier from LSApplicationRecord is nil. %{public}@", v2);
}

void sub_10003BB1C(void *a1)
{
  uint64_t v1 = [a1 applicationBundleIdentifier];
  sub_100029B38();
  sub_10003813C((void *)&_mh_execute_header, v2, v3, "Application (%{public}@) is not found in the LaunchServices database and cannot be used with BackgroundAssets.", v4, v5, v6, v7, v8);
}

void sub_10003BBA0(void *a1)
{
  uint64_t v1 = [a1 applicationBundleIdentifier];
  sub_100029B38();
  sub_10003813C((void *)&_mh_execute_header, v2, v3, "Application (%{public}@) is not registered with FrontBoardServices and cannot be used with BackgroundAssets.", v4, v5, v6, v7, v8);
}

void sub_10003BC24()
{
  sub_100029B38();
  sub_100029B20((void *)&_mh_execute_header, v0, v1, "Client is missing signing identifier, client must be signed with an identifier to use BackgroundAssets. %{public}@", v2);
}

void sub_10003BC90(void *a1)
{
  uint64_t v1 = [a1 clientBundleIdentifier];
  sub_100029B38();
  sub_10003813C((void *)&_mh_execute_header, v2, v3, "Client bundle identifier (%{public}@) is not valid Universal Type Identifier. Disconnecting.", v4, v5, v6, v7, v8);
}

void sub_10003BD14(void *a1)
{
  uint64_t v1 = [a1 applicationBundleIdentifier];
  sub_100029B38();
  sub_10003813C((void *)&_mh_execute_header, v2, v3, "App bundle identifier (%{public}@) is not valid Universal Type Identifier. Disconnecting.", v4, v5, v6, v7, v8);
}

void sub_10003BD98(void *a1)
{
  uint64_t v1 = [a1 applicationBundleIdentifier];
  uint64_t v2 = NSStringFromFBSApplicationTrustState();
  sub_10003816C();
  sub_1000196B4((void *)&_mh_execute_header, v3, v4, "Application (%{public}@) is not trusted on this iOS device and cannot be used with BackgroundAssets. Trust State: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_10003BE44()
{
  int v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  sub_100029B38();
  sub_10003813C((void *)&_mh_execute_header, v2, v3, "LSBundleRecord returned is not an expected LSApplicationRecord. Class:%{public}@", v4, v5, v6, v7, v8);
}

void sub_10003BECC()
{
  sub_10000EDF0();
  sub_10000EDD4((void *)&_mh_execute_header, v0, v1, "Code signed bundle identifier is nil", v2, v3, v4, v5, v6);
}

void sub_10003BF00()
{
  sub_10000EDF0();
  sub_10000EDD4((void *)&_mh_execute_header, v0, v1, "LSBundleRecord.bundleRecordForAuditToken returned a record without a bundle identifier.", v2, v3, v4, v5, v6);
}

void sub_10003BF34()
{
  sub_10000EDF0();
  sub_10000EDD4((void *)&_mh_execute_header, v0, v1, "App identifier is nil or 0 length", v2, v3, v4, v5, v6);
}

void sub_10003BF68()
{
  sub_10000EDF0();
  sub_10000EDD4((void *)&_mh_execute_header, v0, v1, "Failed to get application record. Falling back to last component removal.", v2, v3, v4, v5, v6);
}

void sub_10003BF9C()
{
  int v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  sub_100029B38();
  sub_10003813C((void *)&_mh_execute_header, v2, v3, "LSBundleRecord returned is not an expected LSApplicationExtensionRecord. Class:%{public}@", v4, v5, v6, v7, v8);
}

void sub_10003C024(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to get client application code signing information, error OSStatus: %d", (uint8_t *)v2, 8u);
}

void sub_10003C09C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to get client application static code object, error OSStatus: %d", (uint8_t *)v2, 8u);
}

void sub_10003C114(void *a1)
{
  uint64_t v1 = [a1 description];
  sub_10003816C();
  sub_1000196B4((void *)&_mh_execute_header, v2, v3, "Failed to send %s. error: %{public}@", v4, v5, v6, v7, 2u);
}

void sub_10003C1A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [sub_10003815C(a1, a2) description];
  sub_10000B064();
  sub_10000B080((void *)&_mh_execute_header, v3, v4, "Failed to send %s for: %{public}@ error: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_10003C240(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [[(id)sub_10003815C(a1, a2) description];
  sub_10000B064();
  sub_10000B080((void *)&_mh_execute_header, v3, v4, "Failed to send %s for: %{public}@ error: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_10003C2D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [[(id)sub_10003815C(a1, a2) description];
  sub_10000B064();
  sub_10000B080((void *)&_mh_execute_header, v3, v4, "Failed to send %s for: %{public}@ error: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_10003C370(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [[(id)sub_10003815C(a1, a2) description];
  sub_10000B064();
  sub_10000B080((void *)&_mh_execute_header, v3, v4, "Failed to send %s for: %{public}@ error: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_10003C408(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [[(id)sub_10003815C(a1, a2) description];
  sub_10000B064();
  sub_10000B080((void *)&_mh_execute_header, v3, v4, "Failed to send %s for: %{public}@ error: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_10003C4A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [[(id)sub_10003815C(a1, a2) description];
  sub_10000B064();
  sub_10000B080((void *)&_mh_execute_header, v3, v4, "Failed to send %s for: %{public}@ error: %{public}@", v5, v6, v7, v8, 2u);
}

void sub_10003C538(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = [[sub_10003815C(a1, a2) description];
  sub_10000B064();
  sub_10000B080((void *)&_mh_execute_header, v3, v4, "Failed to send %s for: %{public}@ error: %{public}@", v5, v6, v7, v8, 2u);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
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

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
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

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithName(AssertionType, AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

CFTypeRef IOPSCopyPowerSourcesInfo(void)
{
  return _IOPSCopyPowerSourcesInfo();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return _IOPSCopyPowerSourcesList(blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return _IOPSGetPowerSourceDescription(blob, ps);
}

CFRunLoopSourceRef IOPSNotificationCreateRunLoopSource(IOPowerSourceCallbackType callback, void *context)
{
  return _IOPSNotificationCreateRunLoopSource(callback, context);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringFromFBSApplicationTrustState()
{
  return _NSStringFromFBSApplicationTrustState();
}

OSStatus SecCodeCopySigningInformation(SecStaticCodeRef code, SecCSFlags flags, CFDictionaryRef *information)
{
  return _SecCodeCopySigningInformation(code, flags, information);
}

OSStatus SecStaticCodeCreateWithPath(CFURLRef path, SecCSFlags flags, SecStaticCodeRef *staticCode)
{
  return _SecStaticCodeCreateWithPath(path, flags, staticCode);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return _SecTaskCreateFromSelf(allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _LSPersistentIdentifierCompare()
{
  return __LSPersistentIdentifierCompare();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

uint64_t launch_remove_external_service()
{
  return _launch_remove_external_service();
}

uint64_t lockdown_checkin_xpc()
{
  return _lockdown_checkin_xpc();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_receive_message()
{
  return _lockdown_receive_message();
}

uint64_t lockdown_send_message()
{
  return _lockdown_send_message();
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
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

void objc_exception_throw(id exception)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return _os_unfair_recursive_lock_lock_with_options();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return _os_unfair_recursive_lock_unlock();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath_audittoken(audittoken, buffer, buffersize);
}

qos_class_t qos_class_self(void)
{
  return _qos_class_self();
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return _renamex_np(a1, a2, a3);
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return _sandbox_extension_issue_file_to_process();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
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

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
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

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
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

id objc_msgSend__backgroundActivityStateDidChange(void *a1, const char *a2, ...)
{
  return [a1 _backgroundActivityStateDidChange];
}

id objc_msgSend__checkForExit(void *a1, const char *a2, ...)
{
  return [a1 _checkForExit];
}

id objc_msgSend__clearState(void *a1, const char *a2, ...)
{
  return [a1 _clearState];
}

id objc_msgSend__consumeAvailableDownloadSize(void *a1, const char *a2, ...)
{
  return [a1 _consumeAvailableDownloadSize];
}

id objc_msgSend__debugShutdown(void *a1, const char *a2, ...)
{
  return [a1 _debugShutdown];
}

id objc_msgSend__decrement(void *a1, const char *a2, ...)
{
  return [a1 _decrement];
}

id objc_msgSend__dequeueNext(void *a1, const char *a2, ...)
{
  return [a1 _dequeueNext];
}

id objc_msgSend__deserializeApplicationList(void *a1, const char *a2, ...)
{
  return [a1 _deserializeApplicationList];
}

id objc_msgSend__deserializeDownloadQueues(void *a1, const char *a2, ...)
{
  return [a1 _deserializeDownloadQueues];
}

id objc_msgSend__deserializeState(void *a1, const char *a2, ...)
{
  return [a1 _deserializeState];
}

id objc_msgSend__deserializeUndeliveredEvents(void *a1, const char *a2, ...)
{
  return [a1 _deserializeUndeliveredEvents];
}

id objc_msgSend__downloadActualAsset(void *a1, const char *a2, ...)
{
  return [a1 _downloadActualAsset];
}

id objc_msgSend__downloadDidPause(void *a1, const char *a2, ...)
{
  return [a1 _downloadDidPause];
}

id objc_msgSend__downloadsInProgress(void *a1, const char *a2, ...)
{
  return [a1 _downloadsInProgress];
}

id objc_msgSend__essentialAssetState(void *a1, const char *a2, ...)
{
  return [a1 _essentialAssetState];
}

id objc_msgSend__formatMostFrequentError(void *a1, const char *a2, ...)
{
  return [a1 _formatMostFrequentError];
}

id objc_msgSend__increment(void *a1, const char *a2, ...)
{
  return [a1 _increment];
}

id objc_msgSend__newOperationQuery(void *a1, const char *a2, ...)
{
  return [a1 _newOperationQuery];
}

id objc_msgSend__pokeScheduler(void *a1, const char *a2, ...)
{
  return [a1 _pokeScheduler];
}

id objc_msgSend__powerSourceHasChanged(void *a1, const char *a2, ...)
{
  return [a1 _powerSourceHasChanged];
}

id objc_msgSend__printDebugState(void *a1, const char *a2, ...)
{
  return [a1 _printDebugState];
}

id objc_msgSend__removeActivityAndPowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 _removeActivityAndPowerAssertion];
}

id objc_msgSend__reportEssentialAssetStateAndProgress(void *a1, const char *a2, ...)
{
  return [a1 _reportEssentialAssetStateAndProgress];
}

id objc_msgSend__scheduleDownloads(void *a1, const char *a2, ...)
{
  return [a1 _scheduleDownloads];
}

id objc_msgSend__sendingMessage(void *a1, const char *a2, ...)
{
  return [a1 _sendingMessage];
}

id objc_msgSend__serializableAllowedDomainInfo(void *a1, const char *a2, ...)
{
  return [a1 _serializableAllowedDomainInfo];
}

id objc_msgSend__serializeApplicationState(void *a1, const char *a2, ...)
{
  return [a1 _serializeApplicationState];
}

id objc_msgSend__serializeDownloadQueues(void *a1, const char *a2, ...)
{
  return [a1 _serializeDownloadQueues];
}

id objc_msgSend__serializeUndeliveredEvents(void *a1, const char *a2, ...)
{
  return [a1 _serializeUndeliveredEvents];
}

id objc_msgSend__setClearBeforeShutdown(void *a1, const char *a2, ...)
{
  return [a1 _setClearBeforeShutdown];
}

id objc_msgSend__setupConnection(void *a1, const char *a2, ...)
{
  return [a1 _setupConnection];
}

id objc_msgSend__setupXPCActivity(void *a1, const char *a2, ...)
{
  return [a1 _setupXPCActivity];
}

id objc_msgSend__shutdownAgent(void *a1, const char *a2, ...)
{
  return [a1 _shutdownAgent];
}

id objc_msgSend__startExitTimer(void *a1, const char *a2, ...)
{
  return [a1 _startExitTimer];
}

id objc_msgSend__systemConnections(void *a1, const char *a2, ...)
{
  return [a1 _systemConnections];
}

id objc_msgSend__updateProcessMonitor(void *a1, const char *a2, ...)
{
  return [a1 _updateProcessMonitor];
}

id objc_msgSend__validateAndSetClientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _validateAndSetClientIdentifier];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activeDownloads(void *a1, const char *a2, ...)
{
  return [a1 activeDownloads];
}

id objc_msgSend_activeManifestDownload(void *a1, const char *a2, ...)
{
  return [a1 activeManifestDownload];
}

id objc_msgSend_agentCore(void *a1, const char *a2, ...)
{
  return [a1 agentCore];
}

id objc_msgSend_allDownloads(void *a1, const char *a2, ...)
{
  return [a1 allDownloads];
}

id objc_msgSend_allDownloadsCompleted(void *a1, const char *a2, ...)
{
  return [a1 allDownloadsCompleted];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHeaderFields];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allowedDownloadDomainWildcards(void *a1, const char *a2, ...)
{
  return [a1 allowedDownloadDomainWildcards];
}

id objc_msgSend_allowedDownloadDomains(void *a1, const char *a2, ...)
{
  return [a1 allowedDownloadDomains];
}

id objc_msgSend_allowsBackgroundActivity(void *a1, const char *a2, ...)
{
  return [a1 allowsBackgroundActivity];
}

id objc_msgSend_allowsCellularAccess(void *a1, const char *a2, ...)
{
  return [a1 allowsCellularAccess];
}

id objc_msgSend_allowsExpensiveNetworkAccess(void *a1, const char *a2, ...)
{
  return [a1 allowsExpensiveNetworkAccess];
}

id objc_msgSend_amountDownloaded(void *a1, const char *a2, ...)
{
  return [a1 amountDownloaded];
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appBundleIdentifier];
}

id objc_msgSend_appBundleURL(void *a1, const char *a2, ...)
{
  return [a1 appBundleURL];
}

id objc_msgSend_appInfoRecursiveLock(void *a1, const char *a2, ...)
{
  return [a1 appInfoRecursiveLock];
}

id objc_msgSend_appStoreMetadata(void *a1, const char *a2, ...)
{
  return [a1 appStoreMetadata];
}

id objc_msgSend_applicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationBundleIdentifier];
}

id objc_msgSend_applicationExtensionRecords(void *a1, const char *a2, ...)
{
  return [a1 applicationExtensionRecords];
}

id objc_msgSend_applicationExtensionState(void *a1, const char *a2, ...)
{
  return [a1 applicationExtensionState];
}

id objc_msgSend_applicationGroupIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationGroupIdentifier];
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationIdentifier];
}

id objc_msgSend_applicationInfo(void *a1, const char *a2, ...)
{
  return [a1 applicationInfo];
}

id objc_msgSend_applicationInstalled(void *a1, const char *a2, ...)
{
  return [a1 applicationInstalled];
}

id objc_msgSend_applicationLaunched(void *a1, const char *a2, ...)
{
  return [a1 applicationLaunched];
}

id objc_msgSend_applicationSecurityGroups(void *a1, const char *a2, ...)
{
  return [a1 applicationSecurityGroups];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_applicationTeamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationTeamIdentifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetFound(void *a1, const char *a2, ...)
{
  return [a1 assetFound];
}

id objc_msgSend_assetKey(void *a1, const char *a2, ...)
{
  return [a1 assetKey];
}

id objc_msgSend_assetSize(void *a1, const char *a2, ...)
{
  return [a1 assetSize];
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return [a1 assetURL];
}

id objc_msgSend_asyncClientBlock(void *a1, const char *a2, ...)
{
  return [a1 asyncClientBlock];
}

id objc_msgSend_asyncClientNotificationQueue(void *a1, const char *a2, ...)
{
  return [a1 asyncClientNotificationQueue];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return [a1 authenticationMethod];
}

id objc_msgSend_automaticInstall(void *a1, const char *a2, ...)
{
  return [a1 automaticInstall];
}

id objc_msgSend_awaitingBlockCompletion(void *a1, const char *a2, ...)
{
  return [a1 awaitingBlockCompletion];
}

id objc_msgSend_awaitingConnectivityTimeout(void *a1, const char *a2, ...)
{
  return [a1 awaitingConnectivityTimeout];
}

id objc_msgSend_awaitingConnectivityTimer(void *a1, const char *a2, ...)
{
  return [a1 awaitingConnectivityTimer];
}

id objc_msgSend_awaitingNetworkConsent(void *a1, const char *a2, ...)
{
  return [a1 awaitingNetworkConsent];
}

id objc_msgSend_baURLSessionDelegate(void *a1, const char *a2, ...)
{
  return [a1 baURLSessionDelegate];
}

id objc_msgSend_bailError(void *a1, const char *a2, ...)
{
  return [a1 bailError];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return [a1 block];
}

id objc_msgSend_blockFired(void *a1, const char *a2, ...)
{
  return [a1 blockFired];
}

id objc_msgSend_blockQueue(void *a1, const char *a2, ...)
{
  return [a1 blockQueue];
}

id objc_msgSend_blockQueueLock(void *a1, const char *a2, ...)
{
  return [a1 blockQueueLock];
}

id objc_msgSend_blocksAwaitingNetworkConsent(void *a1, const char *a2, ...)
{
  return [a1 blocksAwaitingNetworkConsent];
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

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllDownloads(void *a1, const char *a2, ...)
{
  return [a1 cancelAllDownloads];
}

id objc_msgSend_cancelAllDownloadsSilently(void *a1, const char *a2, ...)
{
  return [a1 cancelAllDownloadsSilently];
}

id objc_msgSend_cancelDownload(void *a1, const char *a2, ...)
{
  return [a1 cancelDownload];
}

id objc_msgSend_cancelDownloadSilently(void *a1, const char *a2, ...)
{
  return [a1 cancelDownloadSilently];
}

id objc_msgSend_cellular(void *a1, const char *a2, ...)
{
  return [a1 cellular];
}

id objc_msgSend_cellularPolicy(void *a1, const char *a2, ...)
{
  return [a1 cellularPolicy];
}

id objc_msgSend_classesForSerialization(void *a1, const char *a2, ...)
{
  return [a1 classesForSerialization];
}

id objc_msgSend_clearAllOverrides(void *a1, const char *a2, ...)
{
  return [a1 clearAllOverrides];
}

id objc_msgSend_clientBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientBundleIdentifier];
}

id objc_msgSend_clientHandlerQueue(void *a1, const char *a2, ...)
{
  return [a1 clientHandlerQueue];
}

id objc_msgSend_clientProgressConfiguration(void *a1, const char *a2, ...)
{
  return [a1 clientProgressConfiguration];
}

id objc_msgSend_clientType(void *a1, const char *a2, ...)
{
  return [a1 clientType];
}

id objc_msgSend_clientWorkQueue(void *a1, const char *a2, ...)
{
  return [a1 clientWorkQueue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_connectionInvalidated(void *a1, const char *a2, ...)
{
  return [a1 connectionInvalidated];
}

id objc_msgSend_connectionIsValid(void *a1, const char *a2, ...)
{
  return [a1 connectionIsValid];
}

id objc_msgSend_connectionLock(void *a1, const char *a2, ...)
{
  return [a1 connectionLock];
}

id objc_msgSend_connectionQueue(void *a1, const char *a2, ...)
{
  return [a1 connectionQueue];
}

id objc_msgSend_connectionReplyQueue(void *a1, const char *a2, ...)
{
  return [a1 connectionReplyQueue];
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return [a1 connections];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return [a1 containerID];
}

id objc_msgSend_containerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 containerIdentifier];
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return [a1 containingBundleRecord];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countOfBytesExpectedToReceive(void *a1, const char *a2, ...)
{
  return [a1 countOfBytesExpectedToReceive];
}

id objc_msgSend_countOfBytesReceived(void *a1, const char *a2, ...)
{
  return [a1 countOfBytesReceived];
}

id objc_msgSend_currentOperation(void *a1, const char *a2, ...)
{
  return [a1 currentOperation];
}

id objc_msgSend_currentRequest(void *a1, const char *a2, ...)
{
  return [a1 currentRequest];
}

id objc_msgSend_currentRuntime(void *a1, const char *a2, ...)
{
  return [a1 currentRuntime];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return [a1 database];
}

id objc_msgSend_databaseScope(void *a1, const char *a2, ...)
{
  return [a1 databaseScope];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugClearState(void *a1, const char *a2, ...)
{
  return [a1 debugClearState];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_debugRuleValidity(void *a1, const char *a2, ...)
{
  return [a1 debugRuleValidity];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultContainer(void *a1, const char *a2, ...)
{
  return [a1 defaultContainer];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultRecordZone(void *a1, const char *a2, ...)
{
  return [a1 defaultRecordZone];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_demoteAllForegroundDownloads(void *a1, const char *a2, ...)
{
  return [a1 demoteAllForegroundDownloads];
}

id objc_msgSend_demoteToBackground(void *a1, const char *a2, ...)
{
  return [a1 demoteToBackground];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_destinationDirectory(void *a1, const char *a2, ...)
{
  return [a1 destinationDirectory];
}

id objc_msgSend_deviceIdentifierForVendor(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifierForVendor];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_doPeriodicUpdateCheck(void *a1, const char *a2, ...)
{
  return [a1 doPeriodicUpdateCheck];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domainAllowlist(void *a1, const char *a2, ...)
{
  return [a1 domainAllowlist];
}

id objc_msgSend_download(void *a1, const char *a2, ...)
{
  return [a1 download];
}

id objc_msgSend_downloadAllowance(void *a1, const char *a2, ...)
{
  return [a1 downloadAllowance];
}

id objc_msgSend_downloadCachePath(void *a1, const char *a2, ...)
{
  return [a1 downloadCachePath];
}

id objc_msgSend_downloadDidPause(void *a1, const char *a2, ...)
{
  return [a1 downloadDidPause];
}

id objc_msgSend_downloadError(void *a1, const char *a2, ...)
{
  return [a1 downloadError];
}

id objc_msgSend_downloadLock(void *a1, const char *a2, ...)
{
  return [a1 downloadLock];
}

id objc_msgSend_downloadManager(void *a1, const char *a2, ...)
{
  return [a1 downloadManager];
}

id objc_msgSend_downloadQueuesByClientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 downloadQueuesByClientIdentifier];
}

id objc_msgSend_downloadStartDate(void *a1, const char *a2, ...)
{
  return [a1 downloadStartDate];
}

id objc_msgSend_downloadTask(void *a1, const char *a2, ...)
{
  return [a1 downloadTask];
}

id objc_msgSend_downloadTimeValidityDidChange(void *a1, const char *a2, ...)
{
  return [a1 downloadTimeValidityDidChange];
}

id objc_msgSend_downloadedFileSize(void *a1, const char *a2, ...)
{
  return [a1 downloadedFileSize];
}

id objc_msgSend_downloads(void *a1, const char *a2, ...)
{
  return [a1 downloads];
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return [a1 drain];
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return [a1 elapsedTime];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return [a1 endowmentNamespaces];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_essentialAmountDownloaded(void *a1, const char *a2, ...)
{
  return [a1 essentialAmountDownloaded];
}

id objc_msgSend_essentialAssetDownloadAllowance(void *a1, const char *a2, ...)
{
  return [a1 essentialAssetDownloadAllowance];
}

id objc_msgSend_essentialAssetIdentifiersMonitored(void *a1, const char *a2, ...)
{
  return [a1 essentialAssetIdentifiersMonitored];
}

id objc_msgSend_essentialAssetsBytesDownloaded(void *a1, const char *a2, ...)
{
  return [a1 essentialAssetsBytesDownloaded];
}

id objc_msgSend_essentialAssetsBytesTotal(void *a1, const char *a2, ...)
{
  return [a1 essentialAssetsBytesTotal];
}

id objc_msgSend_essentialAssetsWaitingOnContentRequest(void *a1, const char *a2, ...)
{
  return [a1 essentialAssetsWaitingOnContentRequest];
}

id objc_msgSend_essentialDownloadAllowance(void *a1, const char *a2, ...)
{
  return [a1 essentialDownloadAllowance];
}

id objc_msgSend_essentialMaxInstallSize(void *a1, const char *a2, ...)
{
  return [a1 essentialMaxInstallSize];
}

id objc_msgSend_eventError(void *a1, const char *a2, ...)
{
  return [a1 eventError];
}

id objc_msgSend_eventName(void *a1, const char *a2, ...)
{
  return [a1 eventName];
}

id objc_msgSend_eventPayload(void *a1, const char *a2, ...)
{
  return [a1 eventPayload];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_exclusiveAccessBlockQueue(void *a1, const char *a2, ...)
{
  return [a1 exclusiveAccessBlockQueue];
}

id objc_msgSend_exitEvent(void *a1, const char *a2, ...)
{
  return [a1 exitEvent];
}

id objc_msgSend_exitTimer(void *a1, const char *a2, ...)
{
  return [a1 exitTimer];
}

id objc_msgSend_expectedContentLength(void *a1, const char *a2, ...)
{
  return [a1 expectedContentLength];
}

id objc_msgSend_extensionActiveCalls(void *a1, const char *a2, ...)
{
  return [a1 extensionActiveCalls];
}

id objc_msgSend_extensionConnection(void *a1, const char *a2, ...)
{
  return [a1 extensionConnection];
}

id objc_msgSend_extensionConnections(void *a1, const char *a2, ...)
{
  return [a1 extensionConnections];
}

id objc_msgSend_extensionContainingApplicationList(void *a1, const char *a2, ...)
{
  return [a1 extensionContainingApplicationList];
}

id objc_msgSend_extensionExited(void *a1, const char *a2, ...)
{
  return [a1 extensionExited];
}

id objc_msgSend_extensionIdentity(void *a1, const char *a2, ...)
{
  return [a1 extensionIdentity];
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return [a1 extensionPointRecord];
}

id objc_msgSend_extensionProcess(void *a1, const char *a2, ...)
{
  return [a1 extensionProcess];
}

id objc_msgSend_extensionRuntime(void *a1, const char *a2, ...)
{
  return [a1 extensionRuntime];
}

id objc_msgSend_extensionRuntimeEvents(void *a1, const char *a2, ...)
{
  return [a1 extensionRuntimeEvents];
}

id objc_msgSend_extensionWakeAssertions(void *a1, const char *a2, ...)
{
  return [a1 extensionWakeAssertions];
}

id objc_msgSend_extensionWillTerminate(void *a1, const char *a2, ...)
{
  return [a1 extensionWillTerminate];
}

id objc_msgSend_failureReason(void *a1, const char *a2, ...)
{
  return [a1 failureReason];
}

id objc_msgSend_fileHandle(void *a1, const char *a2, ...)
{
  return [a1 fileHandle];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return [a1 filePath];
}

id objc_msgSend_fileSizes(void *a1, const char *a2, ...)
{
  return [a1 fileSizes];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return [a1 finishTasksAndInvalidate];
}

id objc_msgSend_fireByTimer(void *a1, const char *a2, ...)
{
  return [a1 fireByTimer];
}

id objc_msgSend_fireDate(void *a1, const char *a2, ...)
{
  return [a1 fireDate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_freeze(void *a1, const char *a2, ...)
{
  return [a1 freeze];
}

id objc_msgSend_frozen(void *a1, const char *a2, ...)
{
  return [a1 frozen];
}

id objc_msgSend_fullDownloadSize(void *a1, const char *a2, ...)
{
  return [a1 fullDownloadSize];
}

id objc_msgSend_groupContainerURLs(void *a1, const char *a2, ...)
{
  return [a1 groupContainerURLs];
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return [a1 handle];
}

id objc_msgSend_hasLaunchedApplication(void *a1, const char *a2, ...)
{
  return [a1 hasLaunchedApplication];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifiersToBlockQueues(void *a1, const char *a2, ...)
{
  return [a1 identifiersToBlockQueues];
}

id objc_msgSend_identifiersToDownloads(void *a1, const char *a2, ...)
{
  return [a1 identifiersToDownloads];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_initialBackgroundCellularPolicy(void *a1, const char *a2, ...)
{
  return [a1 initialBackgroundCellularPolicy];
}

id objc_msgSend_initialConnectivityTimeout(void *a1, const char *a2, ...)
{
  return [a1 initialConnectivityTimeout];
}

id objc_msgSend_initialRestrictionsAreEnforced(void *a1, const char *a2, ...)
{
  return [a1 initialRestrictionsAreEnforced];
}

id objc_msgSend_installSource(void *a1, const char *a2, ...)
{
  return [a1 installSource];
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

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return [a1 invalidateAndCancel];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return [a1 invertedSet];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isApplication(void *a1, const char *a2, ...)
{
  return [a1 isApplication];
}

id objc_msgSend_isAutomaticAppUpdatesAllowed(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticAppUpdatesAllowed];
}

id objc_msgSend_isConnectedToPower(void *a1, const char *a2, ...)
{
  return [a1 isConnectedToPower];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isForegroundDownload(void *a1, const char *a2, ...)
{
  return [a1 isForegroundDownload];
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isLowPowerModeEnabled];
}

id objc_msgSend_isMoreThan24HoursAgo(void *a1, const char *a2, ...)
{
  return [a1 isMoreThan24HoursAgo];
}

id objc_msgSend_isValidTimeForDownloads(void *a1, const char *a2, ...)
{
  return [a1 isValidTimeForDownloads];
}

id objc_msgSend_lastApplicationLaunchTime(void *a1, const char *a2, ...)
{
  return [a1 lastApplicationLaunchTime];
}

id objc_msgSend_lastDownloadIsValidValue(void *a1, const char *a2, ...)
{
  return [a1 lastDownloadIsValidValue];
}

id objc_msgSend_lastDownloadStartDate(void *a1, const char *a2, ...)
{
  return [a1 lastDownloadStartDate];
}

id objc_msgSend_lastExclusiveAccessBlockToken(void *a1, const char *a2, ...)
{
  return [a1 lastExclusiveAccessBlockToken];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastPeriodicCheckTime(void *a1, const char *a2, ...)
{
  return [a1 lastPeriodicCheckTime];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lockDownQueue(void *a1, const char *a2, ...)
{
  return [a1 lockDownQueue];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_manifestURL(void *a1, const char *a2, ...)
{
  return [a1 manifestURL];
}

id objc_msgSend_masqueradeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 masqueradeIdentifier];
}

id objc_msgSend_maxInstallSize(void *a1, const char *a2, ...)
{
  return [a1 maxInstallSize];
}

id objc_msgSend_messageOperation(void *a1, const char *a2, ...)
{
  return [a1 messageOperation];
}

id objc_msgSend_messageVersion(void *a1, const char *a2, ...)
{
  return [a1 messageVersion];
}

id objc_msgSend_mostRecentError(void *a1, const char *a2, ...)
{
  return [a1 mostRecentError];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_necessity(void *a1, const char *a2, ...)
{
  return [a1 necessity];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfActiveDownloads(void *a1, const char *a2, ...)
{
  return [a1 numberOfActiveDownloads];
}

id objc_msgSend_numberOfWaitingDownloads(void *a1, const char *a2, ...)
{
  return [a1 numberOfWaitingDownloads];
}

id objc_msgSend_offsetInFile(void *a1, const char *a2, ...)
{
  return [a1 offsetInFile];
}

id objc_msgSend_operationConfiguration(void *a1, const char *a2, ...)
{
  return [a1 operationConfiguration];
}

id objc_msgSend_optionalAmountDownloaded(void *a1, const char *a2, ...)
{
  return [a1 optionalAmountDownloaded];
}

id objc_msgSend_optionalAssetDownloadAllowance(void *a1, const char *a2, ...)
{
  return [a1 optionalAssetDownloadAllowance];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pauseAllDownloads(void *a1, const char *a2, ...)
{
  return [a1 pauseAllDownloads];
}

id objc_msgSend_pauseDownload(void *a1, const char *a2, ...)
{
  return [a1 pauseDownload];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_permitInitialCellularDownload(void *a1, const char *a2, ...)
{
  return [a1 permitInitialCellularDownload];
}

id objc_msgSend_permittedForInitialBackgroundActivity(void *a1, const char *a2, ...)
{
  return [a1 permittedForInitialBackgroundActivity];
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 persistentIdentifier];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_powerAssertionID(void *a1, const char *a2, ...)
{
  return [a1 powerAssertionID];
}

id objc_msgSend_powerRunLoopSource(void *a1, const char *a2, ...)
{
  return [a1 powerRunLoopSource];
}

id objc_msgSend_previousFailureCount(void *a1, const char *a2, ...)
{
  return [a1 previousFailureCount];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 privateCloudDatabase];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_profileValidated(void *a1, const char *a2, ...)
{
  return [a1 profileValidated];
}

id objc_msgSend_progressState(void *a1, const char *a2, ...)
{
  return [a1 progressState];
}

id objc_msgSend_promoteToForeground(void *a1, const char *a2, ...)
{
  return [a1 promoteToForeground];
}

id objc_msgSend_proposedCredential(void *a1, const char *a2, ...)
{
  return [a1 proposedCredential];
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return [a1 protectionSpace];
}

id objc_msgSend_publicCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 publicCloudDatabase];
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return [a1 query];
}

id objc_msgSend_queueRetainCount(void *a1, const char *a2, ...)
{
  return [a1 queueRetainCount];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_receivedInstalledNotification(void *a1, const char *a2, ...)
{
  return [a1 receivedInstalledNotification];
}

id objc_msgSend_receivedInstallingNotification(void *a1, const char *a2, ...)
{
  return [a1 receivedInstallingNotification];
}

id objc_msgSend_recordErrors(void *a1, const char *a2, ...)
{
  return [a1 recordErrors];
}

id objc_msgSend_recordFound(void *a1, const char *a2, ...)
{
  return [a1 recordFound];
}

id objc_msgSend_remainingDownloadUniqueIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 remainingDownloadUniqueIdentifiers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resetExtensionRuntime(void *a1, const char *a2, ...)
{
  return [a1 resetExtensionRuntime];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_responseQueue(void *a1, const char *a2, ...)
{
  return [a1 responseQueue];
}

id objc_msgSend_restrictedDownloadSizeRemaining(void *a1, const char *a2, ...)
{
  return [a1 restrictedDownloadSizeRemaining];
}

id objc_msgSend_restrictedEssentialDownloadSizeRemaining(void *a1, const char *a2, ...)
{
  return [a1 restrictedEssentialDownloadSizeRemaining];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeData(void *a1, const char *a2, ...)
{
  return [a1 resumeData];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_rulesEngine(void *a1, const char *a2, ...)
{
  return [a1 rulesEngine];
}

id objc_msgSend_rulesEngineWorkQueue(void *a1, const char *a2, ...)
{
  return [a1 rulesEngineWorkQueue];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_saveApplicationState(void *a1, const char *a2, ...)
{
  return [a1 saveApplicationState];
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return [a1 scanLocation];
}

id objc_msgSend_scheduleContentRequestAborted(void *a1, const char *a2, ...)
{
  return [a1 scheduleContentRequestAborted];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_sentTerminatonMessage(void *a1, const char *a2, ...)
{
  return [a1 sentTerminatonMessage];
}

id objc_msgSend_sentWillTerminateMessage(void *a1, const char *a2, ...)
{
  return [a1 sentWillTerminateMessage];
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return [a1 serverTrust];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedCloudDatabase(void *a1, const char *a2, ...)
{
  return [a1 sharedCloudDatabase];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedCore(void *a1, const char *a2, ...)
{
  return [a1 sharedCore];
}

id objc_msgSend_shouldDoPeriodicCheck(void *a1, const char *a2, ...)
{
  return [a1 shouldDoPeriodicCheck];
}

id objc_msgSend_shouldLaunchExtension(void *a1, const char *a2, ...)
{
  return [a1 shouldLaunchExtension];
}

id objc_msgSend_shutdownQueue(void *a1, const char *a2, ...)
{
  return [a1 shutdownQueue];
}

id objc_msgSend_signingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 signingIdentifier];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_spiListener(void *a1, const char *a2, ...)
{
  return [a1 spiListener];
}

id objc_msgSend_stagingDirectory(void *a1, const char *a2, ...)
{
  return [a1 stagingDirectory];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startNextDownload(void *a1, const char *a2, ...)
{
  return [a1 startNextDownload];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateLock(void *a1, const char *a2, ...)
{
  return [a1 stateLock];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopRequest(void *a1, const char *a2, ...)
{
  return [a1 stopRequest];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_supportsSecureCoding(void *a1, const char *a2, ...)
{
  return [a1 supportsSecureCoding];
}

id objc_msgSend_syncSema(void *a1, const char *a2, ...)
{
  return [a1 syncSema];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return [a1 taskState];
}

id objc_msgSend_telemetryByDownloadUniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 telemetryByDownloadUniqueIdentifier];
}

id objc_msgSend_telemetryQueue(void *a1, const char *a2, ...)
{
  return [a1 telemetryQueue];
}

id objc_msgSend_telephonyClient(void *a1, const char *a2, ...)
{
  return [a1 telephonyClient];
}

id objc_msgSend_terminationAssertion(void *a1, const char *a2, ...)
{
  return [a1 terminationAssertion];
}

id objc_msgSend_thaw(void *a1, const char *a2, ...)
{
  return [a1 thaw];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typeString(void *a1, const char *a2, ...)
{
  return [a1 typeString];
}

id objc_msgSend_unauthoritativeTrustState(void *a1, const char *a2, ...)
{
  return [a1 unauthoritativeTrustState];
}

id objc_msgSend_unhandledDownloadEvents(void *a1, const char *a2, ...)
{
  return [a1 unhandledDownloadEvents];
}

id objc_msgSend_uniqueErrorCounts(void *a1, const char *a2, ...)
{
  return [a1 uniqueErrorCounts];
}

id objc_msgSend_uniqueFileName(void *a1, const char *a2, ...)
{
  return [a1 uniqueFileName];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_uniqueIdentifiersToDownloads(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifiersToDownloads];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_urlRequest(void *a1, const char *a2, ...)
{
  return [a1 urlRequest];
}

id objc_msgSend_urlSession(void *a1, const char *a2, ...)
{
  return [a1 urlSession];
}

id objc_msgSend_useUniqueFileName(void *a1, const char *a2, ...)
{
  return [a1 useUniqueFileName];
}

id objc_msgSend_userForceQuitApp(void *a1, const char *a2, ...)
{
  return [a1 userForceQuitApp];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return [a1 userInitiated];
}

id objc_msgSend_versionAllowed(void *a1, const char *a2, ...)
{
  return [a1 versionAllowed];
}

id objc_msgSend_waitsForConnectivity(void *a1, const char *a2, ...)
{
  return [a1 waitsForConnectivity];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_wifi(void *a1, const char *a2, ...)
{
  return [a1 wifi];
}

id objc_msgSend_willLaunchExtension(void *a1, const char *a2, ...)
{
  return [a1 willLaunchExtension];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return [a1 zoneID];
}