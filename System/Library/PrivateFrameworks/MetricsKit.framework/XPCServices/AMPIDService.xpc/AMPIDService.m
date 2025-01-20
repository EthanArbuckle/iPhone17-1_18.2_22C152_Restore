void sub_100003668(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003A60(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003A70(uint64_t a1)
{
}

void sub_100003A78(uint64_t a1)
{
  v2 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "MetricsKit: AMPIDService XPC connection invalidated", buf, 2u);
  }

  dispatch_time_t v3 = dispatch_time(0, 30000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003B54;
  block[3] = &unk_1000204A0;
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100003B54(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  dispatch_time_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  id v4 = objc_loadWeakRetained(&location);
  if (!v4)
  {
    v5 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "MetricsKit: AMPIDService shared secret store released", v6, 2u);
    }
  }
  objc_destroyWeak(&location);
}

void sub_100003C04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_100003C18(id a1)
{
  v1 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "MetricsKit: AMPIDService XPC connection from client interrupted!", v2, 2u);
  }
}

void setupSandbox()
{
  v0 = +[NSBundle bundleForClass:objc_opt_class()];
  v1 = [v0 bundleIdentifier];

  id v2 = v1;
  [v2 UTF8String];
  if (_set_user_dir_suffix())
  {
    id v3 = NSTemporaryDirectory();
  }
  else
  {
    id v4 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = *__error();
      v6[0] = 67109120;
      v6[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to setup dir suffix for sandbox environment (error code: %d)", (uint8_t *)v6, 8u);
    }
  }
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "MetricsKit: AMPIDService XPC Service started", v7, 2u);
  }

  setupSandbox();
  id v4 = objc_opt_new();
  int v5 = +[NSXPCListener serviceListener];
  [v5 setDelegate:v4];
  [v5 resume];

  return 0;
}

uint64_t sub_100003FC0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000040C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000042B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004614(uint64_t a1)
{
  id v2 = +[NSFileManager defaultManager];
  id v9 = 0;
  id v3 = [v2 URLForDirectory:5 inDomain:1 appropriateForURL:0 create:1 error:&v9];
  id v4 = v9;
  int v5 = [*(id *)(a1 + 32) metricsKitBundleIdentifier];
  v6 = [v3 URLByAppendingPathComponent:v5];

  uint64_t v7 = [v6 path];
  v8 = (void *)qword_1000284A8;
  qword_1000284A8 = v7;
}

void sub_1000048E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000541C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id MTMetricsKitOSLog()
{
  if (qword_1000284B8 != -1) {
    dispatch_once(&qword_1000284B8, &stru_1000205A8);
  }
  v0 = (void *)qword_1000284B0;

  return v0;
}

void sub_1000055D4(id a1)
{
  qword_1000284B0 = (uint64_t)os_log_create("com.apple.amp-ae-eng.MetricsKit", "general");

  _objc_release_x1();
}

uint64_t MTSetExceptionsEnabled(uint64_t result)
{
  byte_1000284C0 = result;
  return result;
}

id MTError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2) {
    id v9 = &a9;
  }
  else {
    id v9 = 0;
  }
  v10 = sub_100005670(a1, a2, (uint64_t)v9);

  return v10;
}

id sub_100005670(uint64_t a1, void *a2, uint64_t a3)
{
  if (a2)
  {
    id v5 = a2;
    v6 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:v5 arguments:a3];
  }
  else
  {
    v6 = @"MetricsKit error";
  }
  id v7 = objc_alloc((Class)NSError);
  NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
  v12 = v6;
  v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  id v9 = [v7 initWithDomain:@"MTError" code:a1 userInfo:v8];

  return v9;
}

id MTConfigurationError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2)
  {
    id v9 = sub_100005670(a1, a2, (uint64_t)&a9);
    v10 = v9;
    if (byte_1000284C0)
    {
      NSErrorUserInfoKey v11 = [v9 localizedDescription];
      +[NSException raise:@"MTException", @"%@", v11, &a9 format];
LABEL_4:

      goto LABEL_9;
    }
    int v12 = atomic_load((unsigned int *)&dword_1000284C4);
    if (v12 <= 199)
    {
      atomic_fetch_add_explicit(&dword_1000284C4, 1u, memory_order_relaxed);
      NSErrorUserInfoKey v11 = MTMetricsKitOSLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v13 = [v10 code];
        v14 = [v10 localizedDescription];
        *(_DWORD *)buf = 134218242;
        id v17 = v13;
        __int16 v18 = 2112;
        v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "MetricsKit: Error occurred with code %ld: %@", buf, 0x16u);
      }
      goto LABEL_4;
    }
  }
  else
  {
    v10 = sub_100005670(a1, 0, 0);
  }
LABEL_9:

  return v10;
}

id MTWrappedError(void *a1, uint64_t a2, void *a3)
{
  id v5 = a1;
  id v6 = [a3 mutableCopy];
  id v7 = v6;
  if (v5)
  {
    v8 = [v6 objectForKeyedSubscript:NSLocalizedDescriptionKey];

    if (!v8)
    {
      id v9 = [v5 localizedDescription];
      [v7 setObject:v9 forKeyedSubscript:NSLocalizedDescriptionKey];
    }
    [v7 setObject:v5 forKeyedSubscript:NSUnderlyingErrorKey];
  }
  id v10 = [objc_alloc((Class)NSError) initWithDomain:@"MTError" code:a2 userInfo:v7];

  return v10;
}

id MTUndelegatedMethodError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return MTConfigurationError(101, @"The method /%s/ must be overridden with a platform-specific delegate method. If you have no data for this field, have your delegate return nil.", a3, a4, a5, a6, a7, a8, a1);
}

void sub_100005B94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005CB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005DD4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005F08(uint64_t a1)
{
  id v2 = +[MTPromise _globalPromiseStorage];
  [v2 addObject:*(void *)(a1 + 32)];
}

id sub_10000633C(uint64_t a1)
{
  return [*(id *)(a1 + 32) addErrorBlock:*(void *)(a1 + 40)];
}

id sub_100006348(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callErrorBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

id sub_100006484(uint64_t a1)
{
  return [*(id *)(a1 + 32) addCompletionBlock:*(void *)(a1 + 40)];
}

id sub_100006490(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callCompletionBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

id sub_1000065CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) addSuccessBlock:*(void *)(a1 + 40)];
}

id sub_1000065D8(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) callSuccessBlock:*(void *)(a1 + 40) withPromiseResult:a2];
}

void sub_100006940(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000695C(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
  id v7 = +[MTPromise promiseWithResult:v8];
  }
  [(id)objc_opt_class() _finishPromise:*(void *)(a1 + 32) withPromise:v7];
}

void sub_100006B28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100006B44(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v8) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
  id v7 = +[MTPromise promiseWithError:v5];
  }
  [(id)objc_opt_class() _finishPromise:*(void *)(a1 + 32) withPromise:v7];
}

void sub_100006FB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100006FCC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = +[MTPromise _globalPromiseStorage];
  [v1 removeObject:WeakRetained];
}

void sub_1000070F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007114(uint64_t a1, char a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v6 = WeakRetained;
  if (a2)
  {
    id v7 = +[NSNumber numberWithBool:1];
    [v6 finishWithResult:v7 error:v8];
  }
  else
  {
    [WeakRetained finishWithResult:0 error:v8];
  }
}

void sub_100007278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007294(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained finishWithResult:v6 error:v5];
}

void sub_1000073D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000073F0(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (v5) {
    [WeakRetained finishWithError:v5];
  }
  else {
    [WeakRetained finishWithResult:&__kCFBooleanTrue];
  }
}

void sub_100007534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007550(uint64_t a1, void *a2, void *a3)
{
  unint64_t v9 = a2;
  unint64_t v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (v9 | v5)
  {
    if (v9) {
      objc_msgSend(WeakRetained, "finishWithResult:");
    }
    else {
      [WeakRetained finishWithError:v5];
    }
  }
  else
  {
    id v8 = +[NSNull null];
    [v7 finishWithResult:v8];
  }
}

void sub_1000078A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1000078C8(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 56);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [*(id *)(a1 + 32) addObject:v4];

  unint64_t v5 = *(unsigned char **)(a1 + 64);
  if (v5 == (char *)[*(id *)(a1 + 40) count] - 1) {
    [*(id *)(a1 + 48) finishWithResult:*(void *)(a1 + 32)];
  }
  else {
    [WeakRetained _configureAllPromise:*(void *)(a1 + 48) withResults:*(void *)(a1 + 32) promises:*(void *)(a1 + 40) currentPromiseIndex:*(void *)(a1 + 64) + 1];
  }
}

void sub_100007978(uint64_t a1, void *a2)
{
  id v5 = a2;
  for (unint64_t i = *(void *)(a1 + 48) + 1; i < (unint64_t)[*(id *)(a1 + 32) count]; ++i)
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
    [v4 cancel];
  }
  [*(id *)(a1 + 40) finishWithError:v5];
}

void sub_100007B9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_100007BC0(uint64_t a1, void *a2)
{
  id v5 = a2;
  for (unint64_t i = *(void *)(a1 + 48) + 1; i < (unint64_t)[*(id *)(a1 + 32) count]; ++i)
  {
    id v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
    [v4 cancel];
  }
  [*(id *)(a1 + 40) finishWithResult:v5];
}

void sub_100007C54(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = *(unsigned char **)(a1 + 56);
  if (v4 == (char *)[*(id *)(a1 + 32) count] - 1) {
    [*(id *)(a1 + 40) finishWithError:v5];
  }
  else {
    [WeakRetained _configureAnyPromise:*(void *)(a1 + 40) withPromises:*(void *)(a1 + 32) currentPromiseIndex:*(void *)(a1 + 56) + 1];
  }
}

id sub_100007E60(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithResult:a2];
}

id sub_100007E6C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishWithError:a2];
}

void sub_100007ECC(id a1)
{
  qword_1000284C8 = (uint64_t)objc_alloc_init((Class)NSMutableSet);

  _objc_release_x1();
}

void sub_100007F5C(id a1)
{
  qword_1000284D8 = (uint64_t)dispatch_queue_create("com.apple.MetricsKit.globalPromiseStorageAccessQueue", 0);

  _objc_release_x1();
}

void sub_1000083A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008450(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000857C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_destroyWeak(v10);
  objc_destroyWeak((id *)(v11 - 24));
  _Unwind_Resume(a1);
}

void sub_1000085B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (!v6)
  {
    uint64_t v11 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained handleUserRecordID:v5];

    id v13 = objc_loadWeakRetained(v11);
    v14 = [v13 container];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100008730;
    v15[3] = &unk_100020878;
    objc_copyWeak(&v16, v11);
    [v14 accountInfoWithCompletionHandler:v15];

    objc_destroyWeak(&v16);
    goto LABEL_8;
  }
  id v8 = [v6 domain];
  if (![v8 isEqual:CKErrorDomain]) {
    goto LABEL_5;
  }
  id v9 = [v7 code];

  if (v9 == (id)9)
  {
    id v8 = objc_loadWeakRetained((id *)(a1 + 32));
    [v8 handleUserRecordID:0];
LABEL_5:
  }
  id v10 = objc_loadWeakRetained((id *)(a1 + 32));
  [v10 handleEngineStartedWithError:v7];

LABEL_8:
}

void sub_10000871C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100008730(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
LABEL_8:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained handleEngineStartedWithError:v8];

    goto LABEL_9;
  }
  if ([v5 accountStatus] == (id)1)
  {
    if (([v5 supportsDeviceToDeviceEncryption] & 1) == 0)
    {
      id v9 = objc_loadWeakRetained((id *)(a1 + 32));
      id v10 = [v9 container];
      uint64_t v11 = [v10 containerIdentifier];
      MTError(702, @"iCloud account for container %@ doesn't support device to device encryption", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
      id v8 = (id)objc_claimAutoreleasedReturnValue();

      if (v8) {
        goto LABEL_8;
      }
    }
  }
  else
  {
    id v24 = [v5 accountStatus];
    MTError(701, @"iCloud account is not available. Account status: %ld", v25, v26, v27, v28, v29, v30, (uint64_t)v24);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v8) {
      goto LABEL_8;
    }
  }
  __int16 v18 = (id *)(a1 + 32);
  id v19 = objc_loadWeakRetained((id *)(a1 + 32));
  v20 = [v19 zoneID];

  id v21 = objc_loadWeakRetained(v18);
  v22 = [v21 container];
  v23 = [v22 privateCloudDatabase];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100008934;
  v32[3] = &unk_100020850;
  id v8 = v20;
  id v33 = v8;
  objc_copyWeak(&v34, v18);
  [v23 fetchRecordZoneWithID:v8 completionHandler:v32];

  objc_destroyWeak(&v34);
LABEL_9:
}

void sub_100008920(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100008934(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 domain];
  if (![v7 isEqual:CKErrorDomain])
  {

    goto LABEL_7;
  }
  id v8 = [v6 code];

  if (v8 != (id)26)
  {
LABEL_7:
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained handleEngineStartedWithError:v6];

    goto LABEL_8;
  }
  id v9 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "MetricsKit: Creating new zone with ID %@", buf, 0xCu);
  }

  id v11 = [objc_alloc((Class)CKRecordZone) initWithZoneID:*(void *)(a1 + 32)];
  uint64_t v12 = (id *)(a1 + 40);
  id v13 = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v14 = [v13 container];
  uint64_t v15 = [v14 privateCloudDatabase];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100008B40;
  v17[3] = &unk_100020828;
  objc_copyWeak(&v18, v12);
  [v15 saveRecordZone:v11 completionHandler:v17];

  objc_destroyWeak(&v18);
LABEL_8:
}

void sub_100008B24(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100008B40(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained handleEngineStartedWithError:v4];
}

void sub_100008D28(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  if (v6)
  {
    id v8 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to fetch records with ID. error %@", (uint8_t *)&v9, 0xCu);
    }

    id v7 = 0;
  }
  [*(id *)(a1 + 32) finishWithResult:v7 error:v6];
}

void sub_100009058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009090(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = a3;
  id v7 = [a2 objectForKeyedSubscript:v5];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v9 = WeakRetained;
  if (v7)
  {
    uint64_t v12 = v7;
    id v10 = +[NSArray arrayWithObjects:&v12 count:1];
    [v9 handleFetchedRecords:v10 error:v6];
  }
  else
  {
    [WeakRetained handleFetchedRecords:0 error:v6];
  }
  id v11 = objc_loadWeakRetained((id *)(a1 + 40));
  [v11 removePendingRecordID:*(void *)(a1 + 32)];
}

void sub_100009534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000958C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v6 = v3;
  uint64_t v5 = +[NSArray arrayWithObjects:&v6 count:1];

  [WeakRetained handleFetchedRecords:v5 error:0];
}

void sub_100009638(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleDeletedRecordID:v3 error:0];
}

void sub_100009698(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained pendingRecordIDs];
  id v4 = [v3 count];

  if (!v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    [v5 _endTransaction];
  }
}

void sub_1000098A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000098B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) commit];
}

void sub_100009A08(_Unwind_Exception *exception_object)
{
}

void sub_100009D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_sync_exit(v22);
  _Unwind_Resume(a1);
}

void sub_100009E04(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleSavedRecord:v6 error:v5];
}

void sub_100009E7C(uint64_t a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    id v6 = (id *)(a1 + 40);
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
        id WeakRetained = objc_loadWeakRetained(v6);
        id v10 = objc_msgSend(v8, "recordID", (void)v11);
        [WeakRetained removePendingRecordID:v10];

        id v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

void sub_10000A024(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A0E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A2A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000A2B4(uint64_t a1)
{
}

void sub_10000A2BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_10000A3C4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 accountDidChangeWithUserRecordID:*(void *)(a1 + 40)];
}

void sub_10000A4F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A50C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 syncEngineDidStartWithError:*(void *)(a1 + 40)];
}

void sub_10000A7E4(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      id v3 = [*(id *)(a1 + 48) recordID];
      id v4 = [v3 recordName];
      uint64_t v5 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      int v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to save record with ID %@ error %@", buf, 0x16u);
    }
    id v6 = [*(id *)(a1 + 40) delegate];
    [v6 recordWasFailedToSave:*(void *)(a1 + 48)];
  }
  else
  {
    id v7 = [*(id *)(a1 + 40) delegate];
    [v7 recordWasSaved:*(void *)(a1 + 48)];
  }
}

void sub_10000AA80(uint64_t a1)
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
      id v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * (void)v6);
        id v8 = objc_msgSend(*(id *)(a1 + 40), "delegate", (void)v9);
        [v8 recordWasFetched:v7];

        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void sub_10000ACF8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 recordWasDeleted:*(void *)(a1 + 40)];
}

void sub_10000B260(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000B274(id a1)
{
  qword_1000284F8 = (uint64_t)objc_alloc_init((Class)NSObject);

  _objc_release_x1();
}

id sub_10000BA04(uint64_t a1)
{
  return [*(id *)(a1 + 48) _setupCompositePromise:*(void *)(a1 + 32) composition:*(void *)(a1 + 40)];
}

void sub_10000BE54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BEFC(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_10000BFAC(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_10000C0FC(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_10000C1BC(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void sub_10000C348(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C520(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C53C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    id v3 = [WeakRetained startDate];
    [v3 timeIntervalSinceNow];
    double v5 = v4 + -0.01;
    double v6 = -*(double *)(a1 + 48);

    id WeakRetained = v7;
    if (v5 < v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id WeakRetained = v7;
    }
  }
}

void sub_10000C8B0(id a1)
{
  v3[0] = @"date";
  v3[1] = @"syncWaitTime";
  v3[2] = @"idType";
  v3[3] = @"cachePolicy";
  v3[4] = @"reset";
  v3[5] = @"dsId";
  v3[6] = @"iTunesUserRequired";
  v3[7] = @"appBundleID";
  v3[8] = @"existingOnly";
  uint64_t v1 = +[NSArray arrayWithObjects:v3 count:9];
  id v2 = (void *)qword_100028500;
  qword_100028500 = v1;
}

void sub_10000E734(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_10000E748(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _generateFutureRecordsForScheme:*(void *)(a1 + 32) referenceRecord:*(void *)(a1 + 40)];
}

BOOL sub_10000EADC(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  id v5 = a2;
  double v6 = +[MTIDCloudKitStore spanRecordKeyWithReferenceRecord:v3 serialNumber:v4];
  BOOL v7 = +[MTIDCloudKitStore updateRecord:v5 isSpanRecord:1 scheme:a1[5] expectedKey:v6 expiration:0 reset:0];

  return v7;
}

void sub_10000EEBC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v16 = 0;
  double v6 = [v2 recordWithID:v3 qualityOfService:v4 updateRecordMaybe:v5 error:&v16];
  id v7 = v16;
  if (v7)
  {
    [*(id *)(a1 + 48) finishWithError:v7];
  }
  else if ((objc_msgSend(v6, "mt_isSynchronized") & 1) != 0 {
         || ![*(id *)(a1 + 32) canSyncBetweenDevices]
  }
         || *(double *)(a1 + 72) <= 0.0
         || *(unsigned char *)(a1 + 80))
  {
    [*(id *)(a1 + 48) finishWithResult:v6];
  }
  else
  {
    id v8 = [v6 objectForKeyedSubscript:@"secretKey"];
    long long v9 = [*(id *)(a1 + 32) promiseManager];
    long long v10 = [v9 waitForRecordToSync:v6 timeout:*(double *)(a1 + 72)];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000F04C;
    v12[3] = &unk_100020BB8;
    id v13 = v8;
    id v14 = *(id *)(a1 + 48);
    id v15 = v6;
    id v11 = v8;
    [v10 addFinishBlock:v12];
  }
}

void sub_10000F04C(void *a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  double v6 = (void *)a1[4];
  id v7 = [v9 objectForKeyedSubscript:@"secretKey"];
  LODWORD(v6) = [v6 isEqualToString:v7];

  id v8 = (void *)a1[5];
  if (v6) {
    [v8 finishWithResult:v9 error:v5];
  }
  else {
    [v8 finishWithResult:a1[6]];
  }
}

BOOL sub_10000F8A4(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 48)) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = a2;
  double v6 = +[MTIDCloudKitStore keyOfReferenceDate:v4];
  BOOL v7 = +[MTIDCloudKitStore updateRecord:v5 isSpanRecord:0 scheme:*(void *)(a1 + 40) expectedKey:v6 expiration:0 reset:*(unsigned __int8 *)(a1 + 49)];

  return v7;
}

BOOL sub_10000FAB4(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 56)) {
    return 0;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = a2;
  BOOL v7 = +[MTIDCloudKitStore spanRecordKeyWithReferenceRecord:serialNumber:](MTIDCloudKitStore, "spanRecordKeyWithReferenceRecord:serialNumber:", v4, [v5 serialNumber]);
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [*(id *)(a1 + 40) endDate];
  BOOL v10 = +[MTIDCloudKitStore updateRecord:v6 isSpanRecord:1 scheme:v8 expectedKey:v7 expiration:v9 reset:0];

  return v10;
}

id sub_10000FE44(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v5 = [v3 countByEnumeratingWithState:&v29 objects:v38 count:16];
    if (!v5) {
      goto LABEL_19;
    }
    id v7 = v5;
    uint64_t v8 = *(void *)v30;
    *(void *)&long long v6 = 138412546;
    long long v27 = v6;
    while (1)
    {
      for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v30 != v8) {
          objc_enumerationMutation(v4);
        }
        BOOL v10 = objc_msgSend(v4, "objectForKeyedSubscript:", *(void *)(*((void *)&v29 + 1) + 8 * i), v27);
        id v11 = v10;
        if (v10)
        {
          long long v12 = [v10 recordType];
          unsigned int v13 = [v12 isEqualToString:@"MT_IDSecret"];

          if (v13)
          {
            id v14 = [v11 recordID];
            id v15 = [v14 recordName];
            unsigned int v16 = [v15 hasPrefix:@"MT_ID"];

            if (v16)
            {
              objc_msgSend(v11, "mt_setSynchronized:", 1);
              uint64_t v17 = [*(id *)(a1 + 32) localDB];
              id v28 = 0;
              unsigned __int8 v18 = [v17 writeRecord:v11 error:&v28];
              id v19 = v28;

              if ((v18 & 1) == 0)
              {
                uint64_t v20 = MTMetricsKitOSLog();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                {
                  id v21 = [v11 recordID];
                  [v21 recordName];
                  v23 = uint64_t v22 = a1;
                  *(_DWORD *)buf = v27;
                  v35 = v23;
                  __int16 v36 = 2112;
                  id v37 = v19;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "MetricsKit: Failed to save local record data with ID %@ error %@", buf, 0x16u);

                  a1 = v22;
                  goto LABEL_14;
                }
                goto LABEL_15;
              }
            }
            else
            {
              id v19 = [*(id *)(a1 + 32) syncEngine];
              uint64_t v20 = [v11 recordID];
              id v33 = v20;
              id v21 = +[NSArray arrayWithObjects:&v33 count:1];
              [v19 deleteRecordsWithIDs:v21];
LABEL_14:

LABEL_15:
            }
          }
        }
      }
      id v7 = [v4 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (!v7)
      {
LABEL_19:
        id v24 = &__kCFBooleanTrue;
        goto LABEL_21;
      }
    }
  }
  id v24 = &__kCFBooleanFalse;
LABEL_21:
  uint64_t v25 = +[MTPromise promiseWithResult:v24];

  return v25;
}

void sub_100011000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100011020(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100011030(uint64_t a1)
{
}

id sub_100011038(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [*(id *)(a1 + 32) idNamespace];
    long long v6 = [v3 recordID];
    unsigned int v7 = objc_msgSend(v3, "mt_isSynchronized");
    CFStringRef v8 = @"unsynchronized";
    *(_DWORD *)buf = 138412802;
    id v33 = v5;
    __int16 v34 = 2112;
    if (v7) {
      CFStringRef v8 = @"synchronized";
    }
    v35 = v6;
    __int16 v36 = 2112;
    CFStringRef v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "MetricsKit: Loaded reference record for scheme %@ with id %@, synchronized: %@", buf, 0x20u);
  }
  if ((uint64_t)[*(id *)(a1 + 32) lifespan] < 1)
  {
    objc_msgSend(v3, "mt_secretValue");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    unsigned int v13 = -[MTIDSecret initWithValue:effectiveDate:expirationDate:isSynchronize:]([MTIDSecret alloc], "initWithValue:effectiveDate:expirationDate:isSynchronize:", v9, 0, 0, objc_msgSend(v3, "mt_isSynchronized"));
    if ([*(id *)(a1 + 48) canSyncBetweenDevices])
    {
      id v15 = [*(id *)(a1 + 48) localDB];
      unsigned int v16 = [v15 syncStatusCode];
      [(MTIDSecret *)v13 setSyncStatusCode:v16];
    }
    uint64_t v17 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      unsigned __int8 v18 = [*(id *)(a1 + 32) idNamespace];
      *(_DWORD *)buf = 138412290;
      id v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "MetricsKit: Returning secret for scheme %@", buf, 0xCu);
    }
    id v14 = +[MTPromise promiseWithResult:v13];
    goto LABEL_14;
  }
  id v9 = +[MTIDCloudKitStore referenceDateOfRecord:v3];
  if (v9 || (id v9 = *(id *)(a1 + 40)) != 0)
  {
    uint64_t v10 = +[MTIDSpan spanForScheme:*(void *)(a1 + 32) date:*(void *)(a1 + 40) referenceDate:v9];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    [*(id *)(a1 + 48) generateFutureRecordsForScheme:*(void *)(a1 + 32) referenceRecord:v3];
    unsigned int v13 = [*(id *)(a1 + 48) spanRecordForScheme:*(void *)(a1 + 32) span:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeout:*(unsigned __int8 *)(a1 + 72) existingOnly:25 qualityOfService:v3 referenceRecord:*(double *)(a1 + 64)];
    v28[0] = (uint64_t)_NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = (uint64_t)sub_100011434;
    v28[3] = (uint64_t)&unk_100020C80;
    id v29 = *(id *)(a1 + 32);
    id v30 = v3;
    long long v31 = *(_OWORD *)(a1 + 48);
    id v14 = [(MTIDSecret *)v13 thenWithBlock:v28];

LABEL_14:
    goto LABEL_15;
  }
  uint64_t v20 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    id v21 = [*(id *)(a1 + 32) idNamespace];
    *(_DWORD *)buf = 138412290;
    id v33 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "MetricsKit: Reference date is null, returning error. Scheme: %@", buf, 0xCu);
  }
  MTError(703, @"Namespace date is null, are you sending multiple reset requests too quickly?", v22, v23, v24, v25, v26, v27, v28[0]);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = +[MTPromise promiseWithError:v9];
LABEL_15:

  return v14;
}

id sub_100011434(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [*(id *)(a1 + 32) idNamespace];
    *(_DWORD *)buf = 138412290;
    id v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "MetricsKit: Span record obtained for scheme %@", buf, 0xCu);
  }
  long long v6 = objc_msgSend(*(id *)(a1 + 40), "mt_secretValue");
  unsigned int v7 = objc_msgSend(v3, "mt_secretValue");
  CFStringRef v8 = +[NSString stringWithFormat:@"%@%@", v6, v7];

  id v9 = [MTIDSecret alloc];
  uint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) startDate];
  uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) endDate];
  if (objc_msgSend(*(id *)(a1 + 40), "mt_isSynchronized")) {
    id v12 = objc_msgSend(v3, "mt_isSynchronized");
  }
  else {
    id v12 = 0;
  }
  unsigned int v13 = [(MTIDSecret *)v9 initWithValue:v8 effectiveDate:v10 expirationDate:v11 isSynchronize:v12];

  if ([*(id *)(a1 + 48) canSyncBetweenDevices])
  {
    id v14 = [*(id *)(a1 + 48) localDB];
    id v15 = [v14 syncStatusCode];
    [(MTIDSecret *)v13 setSyncStatusCode:v15];
  }
  unsigned int v16 = MTMetricsKitOSLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    uint64_t v17 = [*(id *)(a1 + 32) idNamespace];
    *(_DWORD *)buf = 138412290;
    id v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "MetricsKit: Returning secret for scheme %@", buf, 0xCu);
  }
  unsigned __int8 v18 = +[MTPromise promiseWithResult:v13];

  return v18;
}

MTPromise *__cdecl sub_1000118BC(id a1, id a2)
{
  return +[MTPromise promiseWithResult:&__kCFBooleanTrue];
}

void sub_100011AD8(id *a1)
{
  id v2 = [a1[4] generatedDates];
  [v2 removeAllObjects];

  id v3 = +[NSMutableArray array];
  id v15 = [a1[5] objectForKeyedSubscript:@"dsId"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a1[6];
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (unint64_t i = 0; i != v5; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        id v9 = [a1[4] referenceRecordForScheme:v8 dsId:v15 date:0 reset:0 timeout:0 existingOnly:-1 qualityOfService:0.0];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100011DAC;
        v18[3] = &unk_100020D10;
        v18[4] = a1[4];
        v18[5] = v8;
        [v9 addSuccessBlock:v18];
        [v3 addObject:v9];
      }
      id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }

  uint64_t v10 = [a1[4] syncEngine];
  uint64_t v11 = [a1[4] localDB];
  id v12 = [v11 pendingRecordIDs];
  [v10 saveRecordsWithIDs:v12 qualityOfService:-1];

  if ([v3 count])
  {
    unsigned int v13 = +[MTPromise promiseWithAll:v3];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100011E40;
    v16[3] = &unk_100020D38;
    id v17 = a1[7];
    [v13 addFinishBlock:v16];
  }
  else
  {
    [a1[7] finishWithResult:&__kCFBooleanTrue];
  }
}

void sub_100011DAC(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(v5, "mt_isSynchronized"))
  {
    id v3 = [*(id *)(a1 + 32) syncEngine];
    id v4 = [v5 recordID];
    [v3 fetchRecordWithID:v4];
  }
  [*(id *)(a1 + 32) generateFutureRecordsForScheme:*(void *)(a1 + 40) referenceRecord:v5];
}

id sub_100011E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  if (a3) {
    id v5 = 0;
  }
  else {
    id v5 = &__kCFBooleanTrue;
  }
  return [v4 finishWithResult:v5 error:a3];
}

id sub_100011FA8(id a1, CKRecord *a2)
{
  id v2 = a2;
  id v3 = +[NSMutableDictionary dictionary];
  id v4 = [(CKRecord *)v2 objectForKeyedSubscript:@"secretKey"];
  [v3 setObject:v4 forKeyedSubscript:@"key"];

  id v5 = [(CKRecord *)v2 mt_secretValue];
  [v3 setObject:v5 forKeyedSubscript:@"value"];

  BOOL v6 = [(CKRecord *)v2 mt_isSynchronized];
  unsigned int v7 = +[NSNumber numberWithBool:v6];
  [v3 setObject:v7 forKeyedSubscript:@"isSynchronized"];

  id v8 = [v3 copy];

  return v8;
}

void sub_100012458(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012494(uint64_t a1, void *a2)
{
  id v8 = a2;
  [v8 finishWithResult:*(void *)(a1 + 32)];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    objc_sync_enter(v5);
    BOOL v6 = [v5 dict];
    unsigned int v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];

    [v7 removeObject:v8];
    objc_sync_exit(v5);
  }
}

void sub_100012548(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000126B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000126CC(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      BOOL v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "finishWithResult:", *(void *)(a1 + 40), (void)v7);
        BOOL v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_100013BF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100013DDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100013EC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001405C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100014268(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000149AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

MTPromise *__cdecl sub_100014E0C(id a1, id a2)
{
  return +[MTPromise promiseWithResult:&__kCFBooleanTrue];
}

MTPromise *__cdecl sub_10001504C(id a1, id a2)
{
  return +[MTPromise promiseWithResult:&__kCFBooleanTrue];
}

void sub_1000150DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000150F0(id a1, id a2, MTIDSecretStore *a3, BOOL *a4)
{
}

void sub_100015254(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100015270(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v6 debugInfo];
    [v4 addObject:v5];
  }
}

MTPromise *__cdecl sub_1000154FC(id a1, id a2)
{
  return +[MTPromise promiseWithResult:&__kCFBooleanTrue];
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA1(data, len, md);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return _SecTaskCreateFromSelf(allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

BOOL notify_is_valid_token(int val)
{
  return _notify_is_valid_token(val);
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

id objc_msgSend__beginTransaction(void *a1, const char *a2, ...)
{
  return [a1 _beginTransaction];
}

id objc_msgSend__endTransaction(void *a1, const char *a2, ...)
{
  return [a1 _endTransaction];
}

id objc_msgSend__globalPromiseStorage(void *a1, const char *a2, ...)
{
  return [a1 _globalPromiseStorage];
}

id objc_msgSend__globalPromiseStorageAccessQueue(void *a1, const char *a2, ...)
{
  return [a1 _globalPromiseStorageAccessQueue];
}

id objc_msgSend__isFinished(void *a1, const char *a2, ...)
{
  return [a1 _isFinished];
}

id objc_msgSend_accessQueue(void *a1, const char *a2, ...)
{
  return [a1 accessQueue];
}

id objc_msgSend_accountStatus(void *a1, const char *a2, ...)
{
  return [a1 accountStatus];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allRecords(void *a1, const char *a2, ...)
{
  return [a1 allRecords];
}

id objc_msgSend_applicationBundleIdentifierOverrideForNetworkAttribution(void *a1, const char *a2, ...)
{
  return [a1 applicationBundleIdentifierOverrideForNetworkAttribution];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return [a1 cache];
}

id objc_msgSend_calculateHash(void *a1, const char *a2, ...)
{
  return [a1 calculateHash];
}

id objc_msgSend_callbackQueue(void *a1, const char *a2, ...)
{
  return [a1 callbackQueue];
}

id objc_msgSend_canSyncBetweenDevices(void *a1, const char *a2, ...)
{
  return [a1 canSyncBetweenDevices];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_clearData(void *a1, const char *a2, ...)
{
  return [a1 clearData];
}

id objc_msgSend_clearLocalData(void *a1, const char *a2, ...)
{
  return [a1 clearLocalData];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completionBlocks(void *a1, const char *a2, ...)
{
  return [a1 completionBlocks];
}

id objc_msgSend_condition(void *a1, const char *a2, ...)
{
  return [a1 condition];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
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

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_correlationHash(void *a1, const char *a2, ...)
{
  return [a1 correlationHash];
}

id objc_msgSend_correlations(void *a1, const char *a2, ...)
{
  return [a1 correlations];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_debugInfo(void *a1, const char *a2, ...)
{
  return [a1 debugInfo];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dict(void *a1, const char *a2, ...)
{
  return [a1 dict];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dispatchSourceTimer(void *a1, const char *a2, ...)
{
  return [a1 dispatchSourceTimer];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_effectiveDate(void *a1, const char *a2, ...)
{
  return [a1 effectiveDate];
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return [a1 encodedData];
}

id objc_msgSend_encryptedValuesByKey(void *a1, const char *a2, ...)
{
  return [a1 encryptedValuesByKey];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_environment(void *a1, const char *a2, ...)
{
  return [a1 environment];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return [a1 expirationDate];
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return [a1 exportedInterface];
}

id objc_msgSend_fetchAllRecords(void *a1, const char *a2, ...)
{
  return [a1 fetchAllRecords];
}

id objc_msgSend_fetchChangesIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 fetchChangesIfNeeded];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_generatedDates(void *a1, const char *a2, ...)
{
  return [a1 generatedDates];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hostProcessBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hostProcessBundleIdentifier];
}

id objc_msgSend_idNamespace(void *a1, const char *a2, ...)
{
  return [a1 idNamespace];
}

id objc_msgSend_idType(void *a1, const char *a2, ...)
{
  return [a1 idType];
}

id objc_msgSend_isDefault(void *a1, const char *a2, ...)
{
  return [a1 isDefault];
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return [a1 isFinished];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isSynchronized(void *a1, const char *a2, ...)
{
  return [a1 isSynchronized];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lifespan(void *a1, const char *a2, ...)
{
  return [a1 lifespan];
}

id objc_msgSend_localCalendar(void *a1, const char *a2, ...)
{
  return [a1 localCalendar];
}

id objc_msgSend_localDB(void *a1, const char *a2, ...)
{
  return [a1 localDB];
}

id objc_msgSend_localDataPath(void *a1, const char *a2, ...)
{
  return [a1 localDataPath];
}

id objc_msgSend_localHash(void *a1, const char *a2, ...)
{
  return [a1 localHash];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_maxFutureTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 maxFutureTimeInterval];
}

id objc_msgSend_maxPastTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 maxPastTimeInterval];
}

id objc_msgSend_metricsKitBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 metricsKitBundleIdentifier];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_needsFetchRecords(void *a1, const char *a2, ...)
{
  return [a1 needsFetchRecords];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_overrideLifespanMaybe(void *a1, const char *a2, ...)
{
  return [a1 overrideLifespanMaybe];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathURL(void *a1, const char *a2, ...)
{
  return [a1 pathURL];
}

id objc_msgSend_pendingRecordIDs(void *a1, const char *a2, ...)
{
  return [a1 pendingRecordIDs];
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

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_promise(void *a1, const char *a2, ...)
{
  return [a1 promise];
}

id objc_msgSend_promiseManager(void *a1, const char *a2, ...)
{
  return [a1 promiseManager];
}

id objc_msgSend_promiseResult(void *a1, const char *a2, ...)
{
  return [a1 promiseResult];
}

id objc_msgSend_qualityOfService(void *a1, const char *a2, ...)
{
  return [a1 qualityOfService];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_queuedRecordIDs(void *a1, const char *a2, ...)
{
  return [a1 queuedRecordIDs];
}

id objc_msgSend_recordID(void *a1, const char *a2, ...)
{
  return [a1 recordID];
}

id objc_msgSend_recordName(void *a1, const char *a2, ...)
{
  return [a1 recordName];
}

id objc_msgSend_recordType(void *a1, const char *a2, ...)
{
  return [a1 recordType];
}

id objc_msgSend_recordZoneID(void *a1, const char *a2, ...)
{
  return [a1 recordZoneID];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_rotationSchedule(void *a1, const char *a2, ...)
{
  return [a1 rotationSchedule];
}

id objc_msgSend_secretStore(void *a1, const char *a2, ...)
{
  return [a1 secretStore];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedEnvironment(void *a1, const char *a2, ...)
{
  return [a1 sharedEnvironment];
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

id objc_msgSend_startEngine(void *a1, const char *a2, ...)
{
  return [a1 startEngine];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateLock(void *a1, const char *a2, ...)
{
  return [a1 stateLock];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_storagePoolSize(void *a1, const char *a2, ...)
{
  return [a1 storagePoolSize];
}

id objc_msgSend_stores(void *a1, const char *a2, ...)
{
  return [a1 stores];
}

id objc_msgSend_supportsDeviceToDeviceEncryption(void *a1, const char *a2, ...)
{
  return [a1 supportsDeviceToDeviceEncryption];
}

id objc_msgSend_syncEngine(void *a1, const char *a2, ...)
{
  return [a1 syncEngine];
}

id objc_msgSend_syncStatusCode(void *a1, const char *a2, ...)
{
  return [a1 syncStatusCode];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_topics(void *a1, const char *a2, ...)
{
  return [a1 topics];
}

id objc_msgSend_transactionTimeout(void *a1, const char *a2, ...)
{
  return [a1 transactionTimeout];
}

id objc_msgSend_transactions(void *a1, const char *a2, ...)
{
  return [a1 transactions];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_useCloudKitSandbox(void *a1, const char *a2, ...)
{
  return [a1 useCloudKitSandbox];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userRecordIDName(void *a1, const char *a2, ...)
{
  return [a1 userRecordIDName];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return [a1 zoneID];
}