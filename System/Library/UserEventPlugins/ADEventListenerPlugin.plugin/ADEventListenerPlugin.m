void sub_1DE0(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t vars8;

  v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v3)
  {
    v3 = [[ADBundleSession alloc] initBundle:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v3 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  [v3 updateState:*(unsigned int *)(a1 + 56) at:*(unsigned int *)(a1 + 60) fromPid:*(double *)(a1 + 48)];
}

id sub_1E74(uint64_t a1, uint64_t a2)
{
  v4 = gADEventListenerLogObject;
  if (os_log_type_enabled((os_log_t)gADEventListenerLogObject, OS_LOG_TYPE_DEBUG)) {
    sub_2D48(a2, v4);
  }
  return [*(id *)(a1 + 32) applicationStateChanged:a2];
}

void ADEventModuleInitializer()
{
  if (!qword_5060)
  {
    v1 = [ADEventListener alloc];
    xpc_event_module_get_queue();
  }
}

void sub_27CC(uint64_t a1)
{
  v2 = gADEventListenerLogObject;
  if (os_log_type_enabled((os_log_t)gADEventListenerLogObject, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 16);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "dumping session data:\nActive:\n%@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_2D48(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "appStateMonitor's handler was called with %@", (uint8_t *)&v2, 0xCu);
}

uint64_t ADClientAddValueForScalarKey()
{
  return _ADClientAddValueForScalarKey();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
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

{
}

{
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return _proc_pid_rusage(pid, flavor, buffer);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
}

void xpc_event_module_get_queue()
{
  while (1)
    ;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return [a1 adamID];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleVers(void *a1, const char *a2, ...)
{
  return [a1 bundleVers];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleVersion];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_itemID(void *a1, const char *a2, ...)
{
  return [a1 itemID];
}

id objc_msgSend_shortVers(void *a1, const char *a2, ...)
{
  return [a1 shortVers];
}

id objc_msgSend_shortVersionString(void *a1, const char *a2, ...)
{
  return [a1 shortVersionString];
}

id objc_msgSend_updateState_at_fromPid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateState:at:fromPid:");
}