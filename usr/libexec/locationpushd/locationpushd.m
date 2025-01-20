id sub_100003DBC()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t vars8;

  v0 = _CFXPCCreateCFObjectFromXPCObject();
  v1 = v0;
  if (v0)
  {
    v2 = [v0 objectForKeyedSubscript:@"Name"];
    v3 = [v1 objectForKeyedSubscript:@"Object"];
    v4 = [v1 objectForKeyedSubscript:@"UserInfo"];
    v5 = [objc_alloc((Class)NSNotification) initWithName:v2 object:v3 userInfo:v4];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_1000040B4(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [*(id *)(a1 + 32) pendingReplies];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * (void)v6) + 16))();
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  v7 = [*(id *)(a1 + 32) pendingReplies];
  [v7 removeAllObjects];
}

void sub_100004284(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) pendingReplies];
  id v2 = objc_retainBlock(*(id *)(a1 + 40));
  [v3 addObject:v2];
}

void sub_1000043A0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bundleIdentifier];
  id v4 = +[NSString stringWithFormat:@"%@.location-query", v2];

  id v3 = (const void *)CPPowerAssertionCreate();
  [*(id *)(a1 + 32) _extensionQueue_deliverLocationPayloadToExtension:*(void *)(a1 + 40)];
  CFRelease(v3);
}

void sub_100004ED4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

id sub_100004F0C(uint64_t a1)
{
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C398);
  }
  id v2 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Extension will be killed because it used its runtime in starting up", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 40) _kill:9];
}

uint64_t sub_100004FE4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004FF4(uint64_t a1)
{
}

id sub_100004FFC(uint64_t a1)
{
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C398);
  }
  id v2 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Service extension exceeded allowed time: sessionUUID=%{public}@", (uint8_t *)&v6, 0x16u);
  }
  return [*(id *)(a1 + 48) cancelExtensionRequestWithIdentifier:*(void *)(a1 + 40)];
}

void sub_1000050DC(uint64_t a1)
{
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C398);
  }
  id v2 = (void *)qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    int v5 = [v3 identifier];
    uint64_t v6 = *(void *)(a1 + 40);
    int v9 = 138543618;
    long long v10 = v5;
    __int16 v11 = 2114;
    uint64_t v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Entering grace time: sessionUUID=%{public}@", (uint8_t *)&v9, 0x16u);
  }
  uint64_t v7 = [*(id *)(a1 + 48) _auxiliaryConnection];
  __int16 v8 = [v7 remoteObjectProxy];
  [v8 serviceExtensionWillTerminate];
}

void sub_100005208(void *a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C398);
  }
  int v5 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    int v8 = 138543874;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    __int16 v12 = 2114;
    id v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Service extension connection encountered an error: sessionUUID=%{public}@, error=%{public}@", (uint8_t *)&v8, 0x20u);
  }
}

void sub_100005314(uint64_t a1)
{
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C398);
  }
  id v2 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138543618;
    uint64_t v6 = v3;
    __int16 v7 = 2114;
    uint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Service extension finished: sessionUUID=%{public}@", (uint8_t *)&v5, 0x16u);
  }
}

void sub_1000055EC(id a1)
{
  qword_100010D18 = (uint64_t)os_log_create("com.apple.locationpushd", "PushDaemon");

  _objc_release_x1();
}

void sub_100005684(id a1)
{
  qword_100010EA8 = objc_alloc_init(LPPushRegistrar);

  _objc_release_x1();
}

void sub_1000058E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  if (!strcmp(string, "com.apple.locationpushd.app-uninstalled"))
  {
    if (qword_100010D10 != -1) {
      dispatch_once(&qword_100010D10, &stru_10000C450);
    }
    int v5 = qword_100010D18;
    if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Launched by application uninstalled notification", (uint8_t *)&v8, 2u);
    }
    uint64_t v6 = sub_100003DBC();
    if (v6)
    {
      [*(id *)(a1 + 32) handleApplicationUninstalledNotification:v6];
    }
    else
    {
      if (qword_100010D10 != -1) {
        dispatch_once(&qword_100010D10, &stru_10000C450);
      }
      __int16 v7 = qword_100010D18;
      if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138543362;
        id v9 = v3;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Could not create notification for XPC event %{public}@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

void sub_1000066BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000066D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000066E4(uint64_t a1)
{
}

void sub_1000066EC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bundleIdentifierToApplication];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v6 = [[LPApplication alloc] initWithAppBundleIdentifier:*(void *)(a1 + 40)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    int v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v9)
    {
      id v10 = [*(id *)(a1 + 32) bundleIdentifierToApplication];
      [v10 setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
    }
  }
}

id sub_100006D78(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setTopicEnabled:1 forConnection:*(void *)(a1 + 40) appBundleIdentifier:*(void *)(a1 + 48)];
}

uint64_t sub_100006ECC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [*(id *)(a1 + 40) _setTopicEnabled:*(unsigned __int8 *)(a1 + 64) forConnection:v2 appBundleIdentifier:*(void *)(a1 + 48)];
  }
  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v3();
}

void sub_100006FDC(uint64_t a1)
{
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C450);
  }
  uint64_t v2 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v16 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Handling app uninstall %{public}@", buf, 0xCu);
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [[*(id *)(a1 + 32) userInfo];
  int v5 = [v4 objectForKeyedSubscript:@"bundleIDs"];

  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 40) _unregisterLocationPushApplication:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

void sub_10000737C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) bundleIdentifierToApplication];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_100007F38(id a1)
{
  qword_100010D18 = (uint64_t)os_log_create("com.apple.locationpushd", "PushDaemon");

  _objc_release_x1();
}

uint64_t start()
{
  if (qword_100010D10 != -1) {
    dispatch_once(&qword_100010D10, &stru_10000C470);
  }
  uint64_t v1 = qword_100010D18;
  if (os_log_type_enabled((os_log_t)qword_100010D18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Starting locationpushd", v6, 2u);
  }
  id v2 = +[LPPushRegistrar sharedInstance];
  uint64_t v4 = +[NSRunLoop mainRunLoop];
  [v4 run];

  return 0;
}

void sub_10000805C(id a1)
{
  qword_100010D18 = (uint64_t)os_log_create("com.apple.locationpushd", "PushDaemon");

  _objc_release_x1();
}

uint64_t BSMachAbsoluteTime()
{
  return _BSMachAbsoluteTime();
}

uint64_t BSPIDIsBeingDebugged()
{
  return _BSPIDIsBeingDebugged();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CPPowerAssertionCreate()
{
  return _CPPowerAssertionCreate();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
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

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return [a1 _auxiliaryConnection];
}

id objc_msgSend__removeUnneededSandboxTopicsFromDevelopmentConnection(void *a1, const char *a2, ...)
{
  return [a1 _removeUnneededSandboxTopicsFromDevelopmentConnection];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_apsEnvironment(void *a1, const char *a2, ...)
{
  return [a1 apsEnvironment];
}

id objc_msgSend_apsdQueue(void *a1, const char *a2, ...)
{
  return [a1 apsdQueue];
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

id objc_msgSend_bundleIdentifierToApplication(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifierToApplication];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_developmentAPSConnection(void *a1, const char *a2, ...)
{
  return [a1 developmentAPSConnection];
}

id objc_msgSend_dictionaryMutationQueue(void *a1, const char *a2, ...)
{
  return [a1 dictionaryMutationQueue];
}

id objc_msgSend_entitlements(void *a1, const char *a2, ...)
{
  return [a1 entitlements];
}

id objc_msgSend_extensionQueue(void *a1, const char *a2, ...)
{
  return [a1 extensionQueue];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_hasLocationPushEntitlement(void *a1, const char *a2, ...)
{
  return [a1 hasLocationPushEntitlement];
}

id objc_msgSend_hasLocationPushServiceExtension(void *a1, const char *a2, ...)
{
  return [a1 hasLocationPushServiceExtension];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoredTopics(void *a1, const char *a2, ...)
{
  return [a1 ignoredTopics];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isPlaceholder];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_opportunisticTopics(void *a1, const char *a2, ...)
{
  return [a1 opportunisticTopics];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pendingReplies(void *a1, const char *a2, ...)
{
  return [a1 pendingReplies];
}

id objc_msgSend_pendingReplyQueue(void *a1, const char *a2, ...)
{
  return [a1 pendingReplyQueue];
}

id objc_msgSend_productionAPSConnection(void *a1, const char *a2, ...)
{
  return [a1 productionAPSConnection];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return [a1 schedule];
}

id objc_msgSend_serviceExtensionPerformCleanup(void *a1, const char *a2, ...)
{
  return [a1 serviceExtensionPerformCleanup];
}

id objc_msgSend_serviceExtensionWillTerminate(void *a1, const char *a2, ...)
{
  return [a1 serviceExtensionWillTerminate];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return [a1 topic];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}