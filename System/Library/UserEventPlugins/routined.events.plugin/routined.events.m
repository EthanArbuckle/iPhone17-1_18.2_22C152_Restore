id sub_2748(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 onEventCallback:a1 token:a2 event:a3];
}

id sub_275C(uint64_t a1, void *a2)
{
  return [a2 onDaemonStart];
}

void sub_2B98(id a1, NSString *a2, NSNumber *a3, BOOL *a4)
{
  v5 = a2;
  v6 = a3;
  v7 = sub_30DC(&qword_4A78);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_debug_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "%@, %@", (uint8_t *)&v8, 0x16u);
  }
}

void sub_2F48(id a1, NSString *a2, NSNumber *a3, BOOL *a4)
{
  v5 = a2;
  v6 = a3;
  v7 = sub_30DC(&qword_4A78);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 138412546;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_debug_impl(&dword_0, v7, OS_LOG_TYPE_DEBUG, "restoration identifier, %@, token, %@", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t initRoutinedEventAgent()
{
  qword_4A90 = objc_opt_new();

  return _objc_release_x1();
}

id sub_30DC(dispatch_once_t *predicate)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)sub_313C);
  }
  v2 = (void *)predicate[2];

  return v2;
}

os_log_t sub_313C(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(void *)(a1 + 16) = result;
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFRelease(CFTypeRef cf)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_checkin(void *a1, const char *a2, ...)
{
  return [a1 checkin];
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return [a1 clients];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_createConnection(void *a1, const char *a2, ...)
{
  return [a1 createConnection];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return [a1 provider];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}