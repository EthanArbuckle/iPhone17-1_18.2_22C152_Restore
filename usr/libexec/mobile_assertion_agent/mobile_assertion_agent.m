void start()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *v2;
  _xpc_connection_s *mach_service;
  uint8_t v4[16];

  v0 = sub_10000322C();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Starting up", v4, 2u);
  }

  v1 = dispatch_get_global_queue(0, 0);
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v1);

  dispatch_source_set_event_handler(v2, &stru_100004278);
  dispatch_resume(v2);
  xpc_track_activity();
  mach_service = xpc_connection_create_mach_service("com.apple.mobile.assertion_agent", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_1000042B8);
  xpc_connection_resume(mach_service);
  dispatch_main();
}

void sub_100002380(id a1)
{
  v1 = sub_10000322C();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v2 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Got SIGTERM, exiting now.", v2, 2u);
  }

  exit(0);
}

void sub_1000023E0(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    v6 = v2;
    xpc_connection_set_target_queue(v6, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000024F0;
    handler[3] = &unk_1000042E0;
    v9 = v6;
    v7 = v6;
    xpc_connection_set_event_handler(v7, handler);
    xpc_connection_resume(v7);
  }
  else
  {
    v3 = xpc_copy_description(v2);
    if (v3)
    {
      v4 = v3;
      v5 = sub_10000322C();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_1000033D8((uint64_t)v4, v5);
      }

      free(v4);
    }
  }
}

void sub_1000024F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 == &_xpc_error_connection_invalid) {
    goto LABEL_23;
  }
  v4 = (void *)os_transaction_create();
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  uint64_t v17 = 0;
  value = 0;
  CFDictionaryRef theDict = 0;
  int v6 = lockdown_copy_checkin_info();
  if (v6)
  {
    int v7 = v6;
    v8 = sub_10000322C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = v7;
      v9 = "Unable to copy lockdown checkin info: %d";
      v10 = v8;
      uint32_t v11 = 8;
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(0, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      v12 = Mutable;
      CFDictionaryAddValue(Mutable, kLockdownCheckinConnectionInfoKey, value);
      int v14 = secure_lockdown_checkin();
      v15 = sub_10000322C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Lockdown checkin did not provide connection info: %d", buf, 8u);
      }

      goto LABEL_14;
    }
    v8 = sub_10000322C();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v9 = "Could not create dictionary.";
      v10 = v8;
      uint32_t v11 = 2;
      goto LABEL_5;
    }
  }

  v12 = 0;
LABEL_14:
  if (theDict) {
    CFRelease(theDict);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v17) {
    lockdown_disconnect();
  }
  if (value) {
    CFRelease(value);
  }

LABEL_23:
}

id sub_10000322C()
{
  if (qword_100008008 != -1) {
    dispatch_once(&qword_100008008, &stru_100004300);
  }
  v0 = (void *)qword_100008000;

  return v0;
}

void sub_100003280(id a1)
{
  qword_100008000 = (uint64_t)os_log_create("com.apple.mobile.assertion_agent", "main");

  _objc_release_x1();
}

void sub_1000032C4(uint64_t a1, const void *a2)
{
  int v7 = a2;
  keys = @"ErrorKey";
  if (a1)
  {
    if (a2)
    {
      CFDictionaryRef v2 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, &v7, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v2)
      {
        CFDictionaryRef v3 = v2;
        int v4 = lockdown_send_message();
        if (v4)
        {
          int v5 = v4;
          int v6 = sub_10000322C();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v10 = v5;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "lockdown_send_message() failed: %d", buf, 8u);
          }
        }
        CFRelease(v3);
      }
    }
  }
}

void sub_1000033D8(uint64_t a1, NSObject *a2)
{
  int v2 = 136315138;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Got a '%s'. Returning", (uint8_t *)&v2, 0xCu);
}

void sub_100003450(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "select() timed out.", v1, 2u);
}

void sub_100003494(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Connection closed for client %@.", (uint8_t *)&v2, 0xCu);
}

void sub_10000350C(CFDictionaryRef *a1, NSObject *a2)
{
  Value = CFDictionaryGetValue(*a1, kLockdownCheckinPath);
  int v4 = 138412290;
  int v5 = Value;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Checked in at path '%@'", (uint8_t *)&v4, 0xCu);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
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

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithDescription(AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, Timeout, TimeoutAction, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return ___darwin_check_fd_set_overflow(a1, a2, a3);
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uint64_t lockdown_copy_checkin_info()
{
  return _lockdown_copy_checkin_info();
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_get_socket()
{
  return _lockdown_get_socket();
}

uint64_t lockdown_receive_message()
{
  return _lockdown_receive_message();
}

uint64_t lockdown_recv()
{
  return _lockdown_recv();
}

uint64_t lockdown_send_message()
{
  return _lockdown_send_message();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

uint64_t secure_lockdown_checkin()
{
  return _secure_lockdown_checkin();
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return _select(a1, a2, a3, a4, a5);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return _xpc_copy_description(object);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

uint64_t xpc_track_activity()
{
  return _xpc_track_activity();
}