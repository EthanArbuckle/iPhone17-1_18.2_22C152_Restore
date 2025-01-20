int main(int argc, const char **argv, const char **envp)
{
  SBRendererServiceConnection *v3;
  PBUIRenderService *v4;
  void *v5;
  void *v6;
  SBRendererServiceConnection *v7;
  void *v8;
  void *v9;

  v3 = [SBRendererServiceConnection alloc];
  v4 = objc_alloc_init(PBUIRenderService);
  v5 = objc_opt_new();
  v6 = objc_opt_new();
  v7 = [(SBRendererServiceConnection *)v3 initWithRenderService:v4 snapshotServer:v5 analysisServer:v6];

  v8 = +[NSXPCListener serviceListener];
  v9 = [(SBRendererServiceConnection *)v7 activateWithListener:v8];

  return 0;
}

id SBRSLogCommon()
{
  if (qword_100012040 != -1) {
    dispatch_once(&qword_100012040, &stru_10000C3B8);
  }
  v0 = (void *)qword_100012038;
  return v0;
}

void sub_1000044F0(id a1)
{
  qword_100012038 = (uint64_t)os_log_create("com.apple.SBRendererService", "Common");
  _objc_release_x1();
}

id SBRSLogXPC()
{
  if (qword_100012050 != -1) {
    dispatch_once(&qword_100012050, &stru_10000C3D8);
  }
  v0 = (void *)qword_100012048;
  return v0;
}

void sub_100004588(id a1)
{
  qword_100012048 = (uint64_t)os_log_create("com.apple.SBRendererService", "XPC");
  _objc_release_x1();
}

id SBRSLogSnapshotting()
{
  if (qword_100012060 != -1) {
    dispatch_once(&qword_100012060, &stru_10000C3F8);
  }
  v0 = (void *)qword_100012058;
  return v0;
}

void sub_100004620(id a1)
{
  qword_100012058 = (uint64_t)os_log_create("com.apple.SBRendererService", "Snapshotting");
  _objc_release_x1();
}

id SBRSLogImageAnalysis()
{
  if (qword_100012070 != -1) {
    dispatch_once(&qword_100012070, &stru_10000C418);
  }
  v0 = (void *)qword_100012068;
  return v0;
}

void sub_1000046B8(id a1)
{
  qword_100012068 = (uint64_t)os_log_create("com.apple.SBRendererService", "ImageAnalysis");
  _objc_release_x1();
}

void sub_1000048BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000048D4(uint64_t a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "operations", 0);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        v8 = [v7 request];
        v9 = [v8 requestIdentifier];
        unsigned int v10 = [v9 isEqual:*(void *)(a1 + 40)];

        if (v10)
        {
          [v7 cancel];
          goto LABEL_11;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void sub_100004C20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_100004C60(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cancelRequest:*(void *)(a1 + 32)];
}

void sub_100004EF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10000502C(uint64_t a1)
{
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "operations", 0);
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
        [*(id *)(*((void *)&v6 + 1) + 8 * (void)v5) cancel];
        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void sub_100005344(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000054CC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1000054F8(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) UTF8String];
    uint64_t v4 = os_transaction_create();
    uint64_t v5 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = v4;

    long long v6 = [*((id *)WeakRetained + 9) requestedAnalyses];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v15;
      uint64_t v10 = PRUISAnalysisDetermineProminentColor;
      do
      {
        long long v11 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          if ([*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) isEqual:v10])
          {
            id v12 = objc_loadWeakRetained(v2);
            [v12 _determineProminentColor];
          }
          long long v11 = (char *)v11 + 1;
        }
        while (v8 != v11);
        id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    [WeakRetained _fireCompletionWithError:0];
    long long v13 = (void *)*((void *)WeakRetained + 3);
    *((void *)WeakRetained + 3) = 0;
  }
}

void sub_100005680(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fireCompletionWithError:0];
}

void sub_100005714(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005A40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005A64(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isEqualToString:PRUISAnalysisDetermineProminentColor])
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 40);
    if (v3) {
      [*(id *)(a1 + 40) setObject:v3 forKeyedSubscript:v4];
    }
  }
}

void sub_100005BFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100005C20(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = (id *)WeakRetained;
    objc_sync_enter(v9);
    if (v6) {
      [v9 _fireCompletionWithError:v6];
    }
    else {
      objc_storeStrong(v9 + 5, a2);
    }
    objc_sync_exit(v9);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100005CE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

CFStringRef SBSnapshotServiceErrorCodeToDebugDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"SBSnapshotServiceErrorCodeUnknown";
  }
  else {
    return off_10000C530[a1 - 1];
  }
}

id sub_100006428(uint64_t a1)
{
  return [*(id *)(a1 + 40) invalidate];
}

void sub_1000067E8(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) signal]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100006954(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) signal]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100006AFC(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v1 = SBRSLogXPC();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100008174();
  }
}

void sub_100006D84(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void sub_100006DB8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void RegisterForTemporaryFolder()
{
  _set_user_dir_suffix();
  v0 = NSTemporaryDirectory();
  v1 = +[NSFileManager defaultManager];
  id v25 = 0;
  unsigned int v2 = [v1 removeItemAtPath:v0 error:&v25];
  id v3 = v25;

  id v4 = SBRSLogSnapshotting();
  id v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully cleared temporary directory (%{public}@) contents on startup.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_1000084BC((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }

  id v12 = +[NSFileManager defaultManager];
  long long v13 = PFPosterPathFileAttributes();
  id v24 = v3;
  unsigned int v14 = [v12 createDirectoryAtPath:v0 withIntermediateDirectories:1 attributes:v13 error:&v24];
  id v15 = v24;

  long long v16 = SBRSLogSnapshotting();
  long long v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Successfully created temporary directory (%{public}@) contents on startup.", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    sub_100008450((uint64_t)v15, v17, v18, v19, v20, v21, v22, v23);
  }
}

void sub_100007464(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SBRSLogSnapshotting();
  uint64_t v9 = v8;
  if (v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_100008660(a1, v9);
    }

    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = [v6 snapshotBundle];
    uint64_t v12 = +[PRUISSnapshotServiceResponse snapshotResponseForRequest:v10 snapshotBundle:v11];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100008594((uint64_t)v7, a1, v9);
    }

    uint64_t v14 = *(void *)(a1 + 48);
    if (v7)
    {
      long long v13 = +[PRUISSnapshotServiceResponse errorResponseForRequest:*(void *)(a1 + 48) error:v7];
      goto LABEL_10;
    }
    uint64_t v11 = +[NSError sbSnapshotService_errorWithCode:0];
    uint64_t v12 = +[PRUISSnapshotServiceResponse errorResponseForRequest:v14 error:v11];
  }
  long long v13 = (void *)v12;

LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100007A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007A88(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007A98(uint64_t a1)
{
}

void sub_100007AA0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  id v10 = a4;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
  id v9 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100007D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007DB0(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = (id *)(a1 + 40);
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained(v6);
  [WeakRetained _posterCollectionUpdatedForRole:*(void *)(a1 + 32) previousCollection:v8 updatedCollection:v7];
}

void sub_100007E78(id a1, NSString *a2, PRSWallpaperObserver *a3, BOOL *a4)
{
}

void sub_100007FC4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100007FF4(const char *a1, uint64_t a2, uint64_t a3)
{
  id v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  uint64_t v9 = v5;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  CFStringRef v15 = @"SBRendererServiceConnection.m";
  __int16 v16 = 1024;
  int v17 = 39;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

void sub_1000080F4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008174()
{
  CFAbsoluteTimeGetCurrent();
  sub_100006DD4();
  sub_100006DA4();
  sub_100006D84((void *)&_mh_execute_header, v0, v1, "(%d) end %{public}s (serviced in %f s)", v2, v3, v4, v5, 2u);
}

void sub_100008218()
{
  CFAbsoluteTimeGetCurrent();
  sub_100006DD4();
  sub_100006DA4();
  sub_100006D84((void *)&_mh_execute_header, v0, v1, "(%d) end %{public}s (serviced in %f s)", v2, v3, v4, v5, 2u);
}

void sub_1000082B8()
{
  sub_100006DD4();
  sub_100006DB8((void *)&_mh_execute_header, v0, v1, "(%d) start %{public}s", v2, v3, v4, v5, 2u);
}

void sub_100008334()
{
  CFAbsoluteTimeGetCurrent();
  sub_100006DD4();
  sub_100006DA4();
  sub_100006D84((void *)&_mh_execute_header, v0, v1, "(%d) end %{public}s (serviced in %f s)", v2, v3, v4, v5, 2u);
}

void sub_1000083D4()
{
  sub_100006DD4();
  sub_100006DB8((void *)&_mh_execute_header, v0, v1, "(%d) start %{public}s", v2, v3, v4, v5, 2u);
}

void sub_100008450(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000084BC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008528(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100008594(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = *(void *)(a2 + 32);
  id v6 = [*(id *)(a2 + 40) path];
  int v7 = 136446978;
  int v8 = "-[SBSnapshotServer executeSnapshotRequest:reply:]_block_invoke";
  __int16 v9 = 2114;
  uint64_t v10 = a1;
  __int16 v11 = 2114;
  uint64_t v12 = v5;
  __int16 v13 = 2114;
  __int16 v14 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}s FAILED with error: %{public}@ uniqueIdentifier: %{public}@ path: %{public}@", (uint8_t *)&v7, 0x2Au);
}

void sub_100008660(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = [*(id *)(a1 + 40) path];
  int v5 = 136446722;
  id v6 = "-[SBSnapshotServer executeSnapshotRequest:reply:]_block_invoke";
  __int16 v7 = 2114;
  uint64_t v8 = v3;
  __int16 v9 = 2114;
  uint64_t v10 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}s COMPLETE for uniqueIdentifier: %{public}@ path: %{public}@", (uint8_t *)&v5, 0x20u);
}

void sub_100008720()
{
  v1[0] = 136446466;
  sub_100007FE0();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s failed with error: %{public}@", (uint8_t *)v1, 0x16u);
}

void sub_1000087A0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 path];
  v4[0] = 136446466;
  sub_100007FE0();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}s complete for path: %{public}@", (uint8_t *)v4, 0x16u);
}

uint64_t CABackingStoreCollectBlocking()
{
  return _CABackingStoreCollectBlocking();
}

uint64_t CARenderCollect()
{
  return _CARenderCollect();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PFPosterPathFileAttributes()
{
  return _PFPosterPathFileAttributes();
}

uint64_t PFPosterRolesSupportedForCurrentDeviceClass()
{
  return _PFPosterRolesSupportedForCurrentDeviceClass();
}

uint64_t PRUISExecuteProminentColorAnalysisOnImage()
{
  return _PRUISExecuteProminentColorAnalysisOnImage();
}

uint64_t PUIFeatureEnabled()
{
  return _PUIFeatureEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _bs_set_crash_log_message()
{
  return __bs_set_crash_log_message();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__determineProminentColor(void *a1, const char *a2, ...)
{
  return [a1 _determineProminentColor];
}

id objc_msgSend__hasError(void *a1, const char *a2, ...)
{
  return [a1 _hasError];
}

id objc_msgSend__setupAnalysisOperations(void *a1, const char *a2, ...)
{
  return [a1 _setupAnalysisOperations];
}

id objc_msgSend__setupRoleObservation(void *a1, const char *a2, ...)
{
  return [a1 _setupRoleObservation];
}

id objc_msgSend__teardownRoleObservation(void *a1, const char *a2, ...)
{
  return [a1 _teardownRoleObservation];
}

id objc_msgSend_absoluteURL(void *a1, const char *a2, ...)
{
  return [a1 absoluteURL];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
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

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return [a1 operations];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_posterSnapshotRequest(void *a1, const char *a2, ...)
{
  return [a1 posterSnapshotRequest];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_removals(void *a1, const char *a2, ...)
{
  return [a1 removals];
}

id objc_msgSend_renderer(void *a1, const char *a2, ...)
{
  return [a1 renderer];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return [a1 requestIdentifier];
}

id objc_msgSend_requestedAnalyses(void *a1, const char *a2, ...)
{
  return [a1 requestedAnalyses];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_secureCodableRequestClasses(void *a1, const char *a2, ...)
{
  return [a1 secureCodableRequestClasses];
}

id objc_msgSend_secureCodableResponseClasses(void *a1, const char *a2, ...)
{
  return [a1 secureCodableResponseClasses];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return [a1 signal];
}

id objc_msgSend_snapshotBundle(void *a1, const char *a2, ...)
{
  return [a1 snapshotBundle];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByExpandingTildeInPath];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}