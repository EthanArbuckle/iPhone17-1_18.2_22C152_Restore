id sub_3A98()
{
  void *v0;
  uint64_t vars8;

  if (qword_16F90 != -1) {
    dispatch_once(&qword_16F90, &stru_10310);
  }
  v0 = (void *)qword_16F98;

  return v0;
}

void sub_54A8(id a1)
{
  qword_16F98 = (uint64_t)os_log_create("com.apple.adplatforms", "WebProcessPlugin");

  _objc_release_x1();
}

void sub_54EC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_550C(id a1)
{
  return a1;
}

id sub_58F4()
{
  if (qword_16FA0 != -1) {
    dispatch_once(&qword_16FA0, &stru_10388);
  }
  v0 = (void *)qword_16FA8;

  return v0;
}

void sub_5998(id a1)
{
  qword_16FA8 = (uint64_t)os_log_create("com.apple.adplatforms", "WebProcessPlugin");

  _objc_release_x1();
}

id sub_5D38()
{
  if (qword_16FB0 != -1) {
    dispatch_once(&qword_16FB0, &stru_103A8);
  }
  v0 = (void *)qword_16FB8;

  return v0;
}

void sub_6E34(id a1)
{
  qword_16FB8 = (uint64_t)os_log_create("com.apple.adplatforms", "WebProcessPlugin");

  _objc_release_x1();
}

void sub_72D0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v31 = a2;
  id v7 = a4;
  if (v31)
  {
    v8 = objc_alloc_init(APWebProcessVideoAdJSO);
    [*(id *)(a1 + 32) setWebProcessVideoAdJSO:v8];

    v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v9 webProcessVideoAdJSO];
    [v10 setDelegate:v9];

    v11 = [*(id *)(a1 + 32) webProcessVideoAdJSO];
    [v11 setVideoAssetURLString:v31];

    v12 = [*(id *)(a1 + 32) webProcessVideoAdJSO];
    [v12 setHasDestination:a3];

    v13 = [v7 valueForKey:@"AdMarkerHeight"];
    v14 = [*(id *)(a1 + 32) webProcessVideoAdJSO];
    [v14 setAdMarkerHeight:v13];

    v15 = [v7 valueForKey:@"AdMarkerWidth"];
    v16 = [*(id *)(a1 + 32) webProcessVideoAdJSO];
    [v16 setAdMarkerWidth:v15];

    v17 = [v7 valueForKey:@"FontSize"];
    v18 = [*(id *)(a1 + 32) webProcessVideoAdJSO];
    [v18 setFontSize:v17];

    v19 = [v7 valueForKey:@"DeviceLanguage"];
    v20 = [*(id *)(a1 + 32) webProcessVideoAdJSO];
    [v20 setDeviceLanguage:v19];

    v21 = [v7 valueForKey:@"DeviceContentSize"];
    v22 = [*(id *)(a1 + 32) webProcessVideoAdJSO];
    [v22 setDeviceContentSize:v21];

    v23 = [v7 valueForKey:@"CornerRadius"];
    v24 = [*(id *)(a1 + 32) webProcessVideoAdJSO];
    [v24 setCornerRadius:v23];

    v25 = [v7 valueForKey:@"LocalizedAdMarkerText"];
    v26 = [*(id *)(a1 + 32) webProcessVideoAdJSO];
    [v26 setLocalizedAdMarkerText:v25];

    v27 = [v7 valueForKey:@"LocalizedLearnMoreText"];
    v28 = [*(id *)(a1 + 32) webProcessVideoAdJSO];
    [v28 setLocalizedLearnMoreText:v27];

    v29 = [*(id *)(a1 + 32) webProcessVideoAdJSO];
    v30 = [*(id *)(a1 + 32) currentJSContext];
    [v30 setObject:v29 forKeyedSubscript:@"videoAd"];
  }
  else
  {
    [*(id *)(a1 + 32) setWebProcessVideoAdJSO:0];
  }
}

void sub_8348(id a1)
{
  qword_16FC8 = (uint64_t)os_log_create("com.apple.adplatforms", "WebProcessPlugin");

  _objc_release_x1();
}

id sub_841C()
{
  if (qword_16FD0 != -1) {
    dispatch_once(&qword_16FD0, &stru_10410);
  }
  v0 = (void *)qword_16FD8;

  return v0;
}

void sub_875C(id a1)
{
  qword_16FD8 = (uint64_t)os_log_create("com.apple.adplatforms", "WebProcessPlugin");

  _objc_release_x1();
}

void sub_9304()
{
  sub_5544();
  id v0 = (id)objc_opt_class();
  sub_54EC(&dword_0, v1, v2, "[%{private}@] The following URL was not valid: %{private}@", v3, v4, v5, v6, 3u);
}

void sub_9398()
{
  sub_5544();
  id v0 = objc_opt_class();
  id v1 = sub_550C(v0);
  sub_54EC(&dword_0, v2, v3, "[%{private}@] Action failed with error: %{public}@", v4, v5, v6, v7, v8);
}

void sub_9418()
{
  sub_5544();
  id v0 = objc_opt_class();
  id v1 = sub_550C(v0);
  sub_54EC(&dword_0, v2, v3, "[%{private}@] %{public}@", v4, v5, v6, v7, v8);
}

void sub_9498()
{
  sub_5544();
  id v0 = objc_opt_class();
  id v1 = sub_550C(v0);
  sub_54EC(&dword_0, v2, v3, "[%{private}@] MRAID.expand URL was not valid: %{public}@", v4, v5, v6, v7, v8);
}

void sub_9518()
{
  sub_5544();
  id v0 = objc_opt_class();
  id v1 = sub_550C(v0);
  sub_54EC(&dword_0, v2, v3, "[%{private}@] MRAID.open URL was not valid: %{public}@", v4, v5, v6, v7, v8);
}

void sub_9598()
{
  objc_opt_class();
  sub_5530();
  id v1 = v0;
  sub_54EC(&dword_0, v2, v3, "[%{private}@] No expand properties provided: %{public}@", v4, v5, v6, v7, v8);
}

void sub_9620()
{
  objc_opt_class();
  sub_5530();
  id v1 = v0;
  sub_54EC(&dword_0, v2, v3, "[%{private}@] %{public}@", v4, v5, v6, v7, v8);
}

void sub_96B0()
{
  objc_opt_class();
  sub_5530();
  id v1 = v0;
  sub_54EC(&dword_0, v2, v3, "[%{private}@] %{public}@", v4, v5, v6, v7, v8);
}

void sub_9740()
{
  objc_opt_class();
  sub_59DC();
  sub_54EC(&dword_0, v0, v1, "[%{private}@] %{public}@", v2, v3, v4, v5, v6);
}

void sub_97BC(uint64_t a1, NSObject *a2)
{
  int v3 = 138478083;
  uint64_t v4 = objc_opt_class();
  __int16 v5 = 2114;
  CFStringRef v6 = @"Max play failed request limit is reached.";
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "[%{private}@] %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_985C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "[APWebProcessPlugIn] Failed to find load delegate.", v1, 2u);
}

BOOL UIAccessibilityIsVideoAutoplayEnabled(void)
{
  return _UIAccessibilityIsVideoAutoplayEnabled();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend__remoteObjectRegistry(void *a1, const char *a2, ...)
{
  return [a1 _remoteObjectRegistry];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_adIdentifier(void *a1, const char *a2, ...)
{
  return [a1 adIdentifier];
}

id objc_msgSend_advertisingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 advertisingIdentifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_browserContextControllersToLoadDelegates(void *a1, const char *a2, ...)
{
  return [a1 browserContextControllersToLoadDelegates];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentJSContext(void *a1, const char *a2, ...)
{
  return [a1 currentJSContext];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_expandedSize(void *a1, const char *a2, ...)
{
  return [a1 expandedSize];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getState(void *a1, const char *a2, ...)
{
  return [a1 getState];
}

id objc_msgSend_hasFiredReadyEvent(void *a1, const char *a2, ...)
{
  return [a1 hasFiredReadyEvent];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isAppleInternalInstall(void *a1, const char *a2, ...)
{
  return [a1 isAppleInternalInstall];
}

id objc_msgSend_isHTTP(void *a1, const char *a2, ...)
{
  return [a1 isHTTP];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listenersDictionary(void *a1, const char *a2, ...)
{
  return [a1 listenersDictionary];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_maximumExpandedSize(void *a1, const char *a2, ...)
{
  return [a1 maximumExpandedSize];
}

id objc_msgSend_maximumRequestCount(void *a1, const char *a2, ...)
{
  return [a1 maximumRequestCount];
}

id objc_msgSend_playFailedRequestCount(void *a1, const char *a2, ...)
{
  return [a1 playFailedRequestCount];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_requestCount(void *a1, const char *a2, ...)
{
  return [a1 requestCount];
}

id objc_msgSend_resetSession(void *a1, const char *a2, ...)
{
  return [a1 resetSession];
}

id objc_msgSend_resetVideoTagPlaytime(void *a1, const char *a2, ...)
{
  return [a1 resetVideoTagPlaytime];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_videoAdIdentifier(void *a1, const char *a2, ...)
{
  return [a1 videoAdIdentifier];
}

id objc_msgSend_viewable(void *a1, const char *a2, ...)
{
  return [a1 viewable];
}

id objc_msgSend_webProcessDelegate(void *a1, const char *a2, ...)
{
  return [a1 webProcessDelegate];
}

id objc_msgSend_webProcessDiagnosticJSO(void *a1, const char *a2, ...)
{
  return [a1 webProcessDiagnosticJSO];
}

id objc_msgSend_webProcessMRAIDJSO(void *a1, const char *a2, ...)
{
  return [a1 webProcessMRAIDJSO];
}

id objc_msgSend_webProcessMRAIDJSODidCallClose(void *a1, const char *a2, ...)
{
  return [a1 webProcessMRAIDJSODidCallClose];
}

id objc_msgSend_webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame(void *a1, const char *a2, ...)
{
  return [a1 webProcessPlugInBrowserContextControllerGlobalObjectIsAvailableForFrame];
}

id objc_msgSend_webProcessPlugInDidCreateBrowserContextController(void *a1, const char *a2, ...)
{
  return [a1 webProcessPlugInDidCreateBrowserContextController];
}

id objc_msgSend_webProcessPlugInWillDestroyBrowserContextController(void *a1, const char *a2, ...)
{
  return [a1 webProcessPlugInWillDestroyBrowserContextController];
}

id objc_msgSend_webProcessVideoAdJSO(void *a1, const char *a2, ...)
{
  return [a1 webProcessVideoAdJSO];
}

id objc_msgSend_webProcessVideoAdJSOCreativeViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 webProcessVideoAdJSOCreativeViewLoaded];
}

id objc_msgSend_webViewProcessAdIdentifier(void *a1, const char *a2, ...)
{
  return [a1 webViewProcessAdIdentifier];
}

id objc_msgSend_webViewProcessMaxRequestCount(void *a1, const char *a2, ...)
{
  return [a1 webViewProcessMaxRequestCount];
}