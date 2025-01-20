void sub_100001C18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100001C64(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setUserDismissed:0];

  v5 = [v3 userInfo];
  v6 = [v5 objectForKey:WFNetworkListControllerAssociationNetworkKey];

  v7 = WFLogForCategory();
  os_log_type_t v8 = OSLogForWFLogLevel();
  if (WFCurrentLogLevel()) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  int v10 = !v9;
  if (v6)
  {
    if (v10 && os_log_type_enabled(v7, v8))
    {
      int v15 = 136315394;
      v16 = "-[WiFiPickerExtensionViewController loadView]_block_invoke";
      __int16 v17 = 2112;
      v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s: association finished to %@", (uint8_t *)&v15, 0x16u);
    }

    id v11 = objc_loadWeakRetained((id *)(a1 + 40));
    v12 = [v11 viewController];
    [v12 setDismissed:1];

    v7 = objc_loadWeakRetained((id *)(a1 + 40));
    v13 = [v7 wifiClient];
    -[NSObject dispatchAskToJoinAction:notificationId:network:](v13, "dispatchAskToJoinAction:notificationId:network:", 1, [*(id *)(a1 + 32) notificationId], v6);
LABEL_16:

    goto LABEL_17;
  }
  if (v10)
  {
    v13 = v7;
    if (os_log_type_enabled(v13, v8))
    {
      v14 = [v3 userInfo];
      int v15 = 136315394;
      v16 = "-[WiFiPickerExtensionViewController loadView]_block_invoke";
      __int16 v17 = 2112;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, v8, "%s: association failed (userInfo: %@)", (uint8_t *)&v15, 0x16u);
    }
    v7 = v13;
    goto LABEL_16;
  }
LABEL_17:
}

void sub_100001E90(uint64_t a1, void *a2)
{
  id v3 = [a2 userInfo];
  v4 = [v3 objectForKey:WFNetworkListControllerScanResultCountKey];
  int v5 = [v4 intValue];

  v6 = WFLogForCategory();
  os_log_type_t v7 = OSLogForWFLogLevel();
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    int v15 = 136315394;
    v16 = "-[WiFiPickerExtensionViewController loadView]_block_invoke";
    __int16 v17 = 1024;
    BOOL v18 = v5 > 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s: shouldDisplayPicker %d", (uint8_t *)&v15, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v9 = [WeakRetained completionBlock];

  if (v9 && v5 >= 1)
  {
    int v10 = [WeakRetained completionBlock];
    v10[2]();
  }
  else
  {
    id v11 = WFLogForCategory();
    os_log_type_t v12 = OSLogForWFLogLevel();
    if (WFCurrentLogLevel() && v11 && os_log_type_enabled(v11, v12))
    {
      int v15 = 136315138;
      v16 = "-[WiFiPickerExtensionViewController loadView]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s: scan results finished with 0 results, dismissing picker", (uint8_t *)&v15, 0xCu);
    }

    id v13 = objc_loadWeakRetained((id *)(a1 + 40));
    v14 = [v13 viewController];
    [v14 setDismissed:1];

    int v10 = [WeakRetained wifiClient];
    objc_msgSend(v10, "dispatchAskToJoinAction:notificationId:network:", 0, objc_msgSend(*(id *)(a1 + 32), "notificationId"), 0);
  }
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t OSLogForWFLogLevel()
{
  return _OSLogForWFLogLevel();
}

uint64_t WFCurrentLogLevel()
{
  return _WFCurrentLogLevel();
}

uint64_t WFLogForCategory()
{
  return _WFLogForCategory();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_release(id a1)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_airportController(void *a1, const char *a2, ...)
{
  return [a1 airportController];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_notificationId(void *a1, const char *a2, ...)
{
  return [a1 notificationId];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_startScanning(void *a1, const char *a2, ...)
{
  return [a1 startScanning];
}

id objc_msgSend_stopScanning(void *a1, const char *a2, ...)
{
  return [a1 stopScanning];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_userDismissed(void *a1, const char *a2, ...)
{
  return [a1 userDismissed];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return [a1 viewController];
}

id objc_msgSend_viewProvider(void *a1, const char *a2, ...)
{
  return [a1 viewProvider];
}

id objc_msgSend_wifiClient(void *a1, const char *a2, ...)
{
  return [a1 wifiClient];
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willMoveToParentViewController:");
}