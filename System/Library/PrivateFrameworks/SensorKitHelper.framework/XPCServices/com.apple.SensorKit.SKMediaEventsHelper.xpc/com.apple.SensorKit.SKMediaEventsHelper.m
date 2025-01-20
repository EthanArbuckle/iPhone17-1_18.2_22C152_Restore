void start()
{
  SKMediaEventsHelper *v0;

  v0 = [[SKMediaEventsHelper alloc] initWithQueue:dispatch_queue_create("com.apple.SKMediaEventsHelper.main", 0)];
  if (v0) {
    [(SKMediaEventsHelper *)v0 resume];
  }
  dispatch_main();
}

void sub_1000024E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002520(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 40));
  uint64_t authorization_value = tcc_authorization_record_get_authorization_value();
  tcc_authorization_record_get_subject_identity();
  uint64_t identifier = tcc_identity_get_identifier();
  *(void *)(*(void *)(a1 + 32) + 24) = [Weak _mediaEventsStreamIsAuthorizedForBundles];
  v7 = qword_1000089A8;
  if (os_log_type_enabled((os_log_t)qword_1000089A8, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134218754;
    uint64_t v9 = authorization_value;
    __int16 v10 = 2048;
    uint64_t v11 = a2;
    __int16 v12 = 2080;
    uint64_t v13 = identifier;
    __int16 v14 = 2048;
    id v15 = [Weak numberOfAuthorizedBundles];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Number of authorized clients for media events stream has changed; auth_value:%llu, event_type:%llu, subject:%s, nu"
      "mber of authorized clients:%li",
      (uint8_t *)&v8,
      0x2Au);
  }
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return _TCCAccessCopyBundleIdentifiersForService();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_main(void)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
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

id objc_loadWeak(id *location)
{
  return _objc_loadWeak(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

uint64_t tcc_authorization_record_get_authorization_value()
{
  return _tcc_authorization_record_get_authorization_value();
}

uint64_t tcc_authorization_record_get_subject_identity()
{
  return _tcc_authorization_record_get_subject_identity();
}

uint64_t tcc_events_filter_create_with_criteria()
{
  return _tcc_events_filter_create_with_criteria();
}

uint64_t tcc_events_subscribe()
{
  return _tcc_events_subscribe();
}

uint64_t tcc_events_unsubscribe()
{
  return _tcc_events_unsubscribe();
}

uint64_t tcc_identity_get_identifier()
{
  return _tcc_identity_get_identifier();
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

id objc_msgSend_Media(void *a1, const char *a2, ...)
{
  return [a1 Media];
}

id objc_msgSend_Messages(void *a1, const char *a2, ...)
{
  return [a1 Messages];
}

id objc_msgSend_Rendered(void *a1, const char *a2, ...)
{
  return [a1 Rendered];
}

id objc_msgSend_TCCObserver(void *a1, const char *a2, ...)
{
  return [a1 TCCObserver];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__mediaEventsStreamIsAuthorizedForBundles(void *a1, const char *a2, ...)
{
  return [a1 _mediaEventsStreamIsAuthorizedForBundles];
}

id objc_msgSend__subscribeForTCCEvents(void *a1, const char *a2, ...)
{
  return [a1 _subscribeForTCCEvents];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isMediaEventsStreamAuthorized(void *a1, const char *a2, ...)
{
  return [a1 isMediaEventsStreamAuthorized];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_numberOfAuthorizedBundles(void *a1, const char *a2, ...)
{
  return [a1 numberOfAuthorizedBundles];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return [a1 stream];
}