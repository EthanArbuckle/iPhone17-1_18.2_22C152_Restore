uint64_t start()
{
  void *v0;
  WLDaemonListener *v1;

  v1 = objc_alloc_init(WLDaemonListener);
  [(WLDaemonListener *)v1 start];
  CFRunLoopRun();

  return 1;
}

void sub_1000036F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003718(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  if (xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
    if (string)
    {
      v4 = string;
      if (!strcasecmp((const char *)[BYSetupAssistantExitedDarwinNotification UTF8String], string)|| !strcasecmp("com.apple.welcomekitinternalsettings.dismissed", v4))
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
        [WeakRetained _buddyDidFinish];
      }
    }
  }
}

void sub_1000038C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003A68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003A84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained stop:*(void *)(a1 + 32)];
}

void sub_100003C74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_sync_exit(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003CA4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003CB4(uint64_t a1)
{
}

void sub_100003CBC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = +[WLDeviceDiscoveryController sharedInstance];
  v4 = [WeakRetained code];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100003DB4;
  v8[3] = &unk_1000082E8;
  id v9 = WeakRetained;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = WeakRetained;
  [v3 startWiFiAndDeviceDiscoveryWithPreGeneratedCode:v4 completion:v8];

  [v7 setPairingBlock:0];
}

void sub_100003DB4(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, void *a7)
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v16 = [*(id *)(a1 + 32) server];
  [v16 setPreferredChannel:a6];

  uint64_t v17 = *(void *)(a1 + 40);
  if (v17) {
    (*(void (**)(uint64_t, uint64_t, id, id, id, uint64_t, id))(v17 + 16))(v17, a2, v20, v13, v14, a6, v15);
  }
  uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
  v19 = *(void **)(v18 + 40);
  *(void *)(v18 + 40) = 0;
}

void sub_100003FA8(uint64_t a1)
{
  v2 = +[WLDeviceDiscoveryController sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004050;
  v5[3] = &unk_100008338;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 stopDeviceDiscoveryWithCompletion:v5];
}

void sub_100004050(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void sub_1000041A8(uint64_t a1)
{
  uint64_t v2 = +[WLDeviceDiscoveryController sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004250;
  v5[3] = &unk_100008338;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 stopWiFiAndDeviceDiscoveryWithCompletion:v5];
}

void sub_100004250(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void sub_1000043A8(uint64_t a1)
{
  uint64_t v2 = +[WLDeviceDiscoveryController sharedInstance];
  id v5 = [v2 sourceDevice];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void sub_1000044CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = +[WLDeviceDiscoveryController sharedInstance];
    (*(void (**)(uint64_t, id, id, void))(v1 + 16))(v1, [v2 supportsLocalImport], +[WLMigrator stashDataLocally](WLMigrator, "stashDataLocally"), 0);
  }
}

void sub_100004570(id a1)
{
  id v1 = +[WLDeviceDiscoveryController sharedInstance];
  [v1 importLocalContent];
}

id sub_100004628(uint64_t a1)
{
  return +[WLMigrator setStashDataLocally:*(unsigned __int8 *)(a1 + 32)];
}

void sub_1000046D4(uint64_t a1)
{
  id v2 = +[WLDeviceDiscoveryController sharedInstance];
  [v2 attemptDirectConnectionToAddress:*(void *)(a1 + 32)];
}

void sub_100004970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100004998(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004A14;
  v6[3] = &unk_100008438;
  uint64_t v4 = *(void *)(a1 + 48);
  v6[4] = *(void *)(a1 + 56);
  return [v2 startMigrationWithSourceDevice:v1 usingRetryPolicies:v3 delegate:v4 completion:v6];
}

uint64_t sub_100004A14(uint64_t a1)
{
  _WLLog();
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  _WLLog();

  return xpc_transaction_exit_clean();
}

void sub_100004B74(uint64_t a1)
{
  +[MKAPIServer clean];
  id v2 = objc_alloc_init((Class)WLMigrator);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100004C10;
  v3[3] = &unk_100008438;
  v3[4] = *(void *)(a1 + 32);
  [v2 close:v3];
}

uint64_t sub_100004C10(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;

  _WLLog();

  return xpc_transaction_exit_clean();
}

void sub_100004D48(uint64_t a1)
{
  id v4 = objc_alloc_init((Class)WLMigrator);
  [v4 deleteMessages];
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  _WLLog();
  xpc_transaction_exit_clean();
}

void sub_100004EFC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _run:*(void *)(a1 + 32) transaction:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void sub_1000050D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancel];
}

void sub_10000519C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005320(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CFRunLoopRun(void)
{
}

uint64_t WLDaemonExportedInterface()
{
  return _WLDaemonExportedInterface();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _WLLog()
{
  return __WLLog();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
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

id objc_msgSend__buddyDidFinish(void *a1, const char *a2, ...)
{
  return [a1 _buddyDidFinish];
}

id objc_msgSend__cancel(void *a1, const char *a2, ...)
{
  return [a1 _cancel];
}

id objc_msgSend_accessibilitySetting(void *a1, const char *a2, ...)
{
  return [a1 accessibilitySetting];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_album(void *a1, const char *a2, ...)
{
  return [a1 album];
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return [a1 application];
}

id objc_msgSend_bookmark(void *a1, const char *a2, ...)
{
  return [a1 bookmark];
}

id objc_msgSend_brand(void *a1, const char *a2, ...)
{
  return [a1 brand];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_callHistory(void *a1, const char *a2, ...)
{
  return [a1 callHistory];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_clean(void *a1, const char *a2, ...)
{
  return [a1 clean];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connectionDidEnd(void *a1, const char *a2, ...)
{
  return [a1 connectionDidEnd];
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return [a1 contact];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_deleteMessages(void *a1, const char *a2, ...)
{
  return [a1 deleteMessages];
}

id objc_msgSend_displaySetting(void *a1, const char *a2, ...)
{
  return [a1 displaySetting];
}

id objc_msgSend_file(void *a1, const char *a2, ...)
{
  return [a1 file];
}

id objc_msgSend_hostname(void *a1, const char *a2, ...)
{
  return [a1 hostname];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_importCount(void *a1, const char *a2, ...)
{
  return [a1 importCount];
}

id objc_msgSend_importErrorCount(void *a1, const char *a2, ...)
{
  return [a1 importErrorCount];
}

id objc_msgSend_importLocalContent(void *a1, const char *a2, ...)
{
  return [a1 importLocalContent];
}

id objc_msgSend_initWithTestBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 initWithTestBundleIdentifier];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_placeholder(void *a1, const char *a2, ...)
{
  return [a1 placeholder];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sim(void *a1, const char *a2, ...)
{
  return [a1 sim];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sourceDevice(void *a1, const char *a2, ...)
{
  return [a1 sourceDevice];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stashDataLocally(void *a1, const char *a2, ...)
{
  return [a1 stashDataLocally];
}

id objc_msgSend_supportsLocalImport(void *a1, const char *a2, ...)
{
  return [a1 supportsLocalImport];
}

id objc_msgSend_video(void *a1, const char *a2, ...)
{
  return [a1 video];
}

id objc_msgSend_voiceMemo(void *a1, const char *a2, ...)
{
  return [a1 voiceMemo];
}