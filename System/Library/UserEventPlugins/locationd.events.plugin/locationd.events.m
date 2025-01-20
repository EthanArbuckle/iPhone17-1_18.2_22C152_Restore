id sub_1E98(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;
  NSSet *v4;
  id v5;

  if (a1) {
    v2 = [objc_alloc((Class)NSData) initWithBytes:a1 length:a2];
  }
  else {
    v2 = 0;
  }
  v3 = objc_opt_class();
  v4 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, objc_opt_class(), 0);
  if (!v2)
  {
LABEL_11:
    v5 = 0;
    goto LABEL_12;
  }
  v5 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v4 fromData:v2 error:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (qword_4410 != -1) {
      dispatch_once(&qword_4410, &stru_4280);
    }
    if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_FAULT)) {
      sub_331C();
    }

    goto LABEL_11;
  }
LABEL_12:

  return v5;
}

void sub_1FD8(_Unwind_Exception *a1)
{
}

void sub_1FF8(void *a1, int a2)
{
  if (a2 == 2)
  {
    if (qword_4410 != -1) {
      dispatch_once(&qword_4410, &stru_4280);
    }
    if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_FAULT)) {
      sub_32E8();
    }
    objc_end_catch();
    JUMPOUT(0x1F84);
  }
  JUMPOUT(0x1F8CLL);
}

void sub_206C(id a1, OS_xpc_object *a2)
{
  xpc_type_t type = xpc_get_type(a2);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (a2 == (OS_xpc_object *)&_xpc_error_connection_invalid)
    {
      if (qword_4410 != -1) {
        dispatch_once(&qword_4410, &stru_4280);
      }
      v19 = qword_4408;
      if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "#Warning event was XPC_ERROR_CONNECTION_INVALID", buf, 2u);
      }
      if (qword_4420)
      {
        xpc_connection_cancel((xpc_connection_t)qword_4420);
        xpc_release((xpc_object_t)qword_4420);
        qword_4420 = 0;
      }
    }
    else if (a2 == (OS_xpc_object *)&_xpc_error_connection_interrupted)
    {
      if (qword_4410 != -1) {
        dispatch_once(&qword_4410, &stru_4280);
      }
      v18 = qword_4408;
      if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "event was XPC_ERROR_CONNECTION_INTERRUPTED", buf, 2u);
      }
      sub_2D28();
    }
    return;
  }
  if (type != (xpc_type_t)&_xpc_type_dictionary) {
    return;
  }
  string = xpc_dictionary_get_string(a2, "kCLConnectionMessageNameKey");
  if (!string)
  {
    if (qword_4410 != -1) {
      dispatch_once(&qword_4410, &stru_4280);
    }
    v20 = qword_4408;
    if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "Received a XPC_TYPE_DICTIONARY with out a 'kCLConnectionMessageNameKey' key", buf, 2u);
    }
    return;
  }
  v5 = string;
  if (qword_4410 != -1) {
    dispatch_once(&qword_4410, &stru_4280);
  }
  v6 = qword_4408;
  if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v40 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "xpc_object_t event was XPC_TYPE_DICTIONARY with kCLConnectionMessageNameKey: %{public}s", buf, 0xCu);
  }
  if (!strcmp(v5, "kCLConnectionMessageWakeClient"))
  {
    xpc_object_t v21 = xpc_dictionary_get_value(a2, "kCLConnectionMessageInfoKey");
    if (!v21 || (v22 = v21, xpc_get_type(v21) != (xpc_type_t)&_xpc_type_data))
    {
      if (qword_4410 != -1) {
        dispatch_once(&qword_4410, &stru_4280);
      }
      if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_ERROR)) {
        sub_30FC();
      }
      return;
    }
    bytes_ptr = xpc_data_get_bytes_ptr(v22);
    size_t length = xpc_data_get_length(v22);
    CFDictionaryRef v25 = (const __CFDictionary *)sub_1E98((uint64_t)bytes_ptr, length);
    CFStringRef v8 = (const __CFString *)v25;
    value = 0;
    if (v25
      && CFDictionaryGetValueIfPresent(v25, @"kCLConnectionMessageClientNameKey", (const void **)&value) == 1)
    {
      if (value && (CFTypeID v26 = CFGetTypeID(value), v26 == CFStringGetTypeID()))
      {
        CFTypeRef cf = 0;
        if (CFDictionaryGetValueIfPresent((CFDictionaryRef)qword_4428, value, &cf) == 1)
        {
          CFTypeID v27 = CFGetTypeID(cf);
          if (v27 == CFNumberGetTypeID())
          {
            uint64_t valuePtr = 0;
            CFNumberGetValue((CFNumberRef)cf, kCFNumberLongType, &valuePtr);
            xpc_event_provider_token_fire();
          }
          if (qword_4410 != -1) {
            dispatch_once(&qword_4410, &stru_4280);
          }
          if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_ERROR)) {
            sub_3248();
          }
        }
        else
        {
          if (qword_4410 != -1) {
            dispatch_once(&qword_4410, &stru_4280);
          }
          if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_ERROR)) {
            sub_26D8();
          }
        }
      }
      else
      {
        if (qword_4410 != -1) {
          dispatch_once(&qword_4410, &stru_4280);
        }
        if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_ERROR)) {
          sub_31A8();
        }
      }
    }
    else
    {
      if (qword_4410 != -1) {
        dispatch_once(&qword_4410, &stru_4280);
      }
      v28 = qword_4408;
      if (!os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_FAULT))
      {
        if (!v8) {
          return;
        }
        goto LABEL_58;
      }
      sub_3130(v28, v29, v30, v31, v32, v33, v34, v35);
      if (!v8) {
        return;
      }
    }
LABEL_58:
    CFRelease(v8);
    return;
  }
  CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, v5, 0x8000100u);
  if (v7)
  {
    CFStringRef v8 = v7;
    if (CFArrayGetCount((CFArrayRef)qword_4438) >= 1)
    {
      CFIndex v9 = 0;
      do
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)qword_4438, v9);
        if (CFStringCompare(ValueAtIndex, v8, 0)) {
          goto LABEL_58;
        }
      }
      while (++v9 < CFArrayGetCount((CFArrayRef)qword_4438));
    }
    CFRelease(v8);
  }
  if (qword_4410 != -1) {
    dispatch_once(&qword_4410, &stru_4280);
  }
  v11 = qword_4408;
  if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_FAULT)) {
    sub_327C((uint64_t)v5, v11, v12, v13, v14, v15, v16, v17);
  }
}

void sub_26D8()
{
  sub_2728();
  sub_270C(&dword_0, v0, v1, "locationd-events failed to find client within registered daemons", v2, v3, v4, v5, v6);
}

void sub_270C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void init_locationd_events()
{
}

void sub_2828(uint64_t a1, uint64_t a2)
{
  uint64_t valuePtr = a2;
  xpc_event_provider_get_queue();
}

void sub_2B40(id a1)
{
  qword_4408 = (uint64_t)os_log_create("com.apple.locationd.Core", "Core");
}

void sub_2B70()
{
  int out_token = 0;
  sub_2CD0();
}

void sub_2CD0()
{
}

void sub_2D28()
{
  if (qword_4420)
  {
    xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
    xpc_object_t v1 = xpc_string_create("LaunchdManagedClients/kCLConnectionMessageRegister");
    xpc_dictionary_set_value(v0, "kCLConnectionMessageNameKey", v1);
    uint64_t v2 = [+[NSUUID UUID] UUIDString];
    CFStringRef v8 = @"UUID";
    uint64_t v9 = v2;
    uint64_t v3 = +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1], 1, 0);
    if (qword_4410 != -1) {
      dispatch_once(&qword_4410, &stru_4280);
    }
    uint64_t v4 = qword_4408;
    if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_INFO))
    {
      int v6 = 136446210;
      CFStringRef v7 = [(NSString *)v2 UTF8String];
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Sending registration message to locationd with UUID %{public}s", (uint8_t *)&v6, 0xCu);
    }
    xpc_object_t v5 = xpc_data_create([(NSData *)v3 bytes], [(NSData *)v3 length]);
    xpc_dictionary_set_value(v0, "kCLConnectionMessageInfoKey", v5);
    xpc_connection_send_message((xpc_connection_t)qword_4420, v0);
    if (v5) {
      xpc_release(v5);
    }
    if (v1) {
      xpc_release(v1);
    }
    if (v0) {
      xpc_release(v0);
    }
  }
}

void sub_2F04(id a1, int a2)
{
  if (qword_4410 != -1) {
    dispatch_once(&qword_4410, &stru_4280);
  }
  uint64_t v2 = qword_4408;
  if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "locationd started", buf, 2u);
  }
  if (!qword_4420)
  {
    if (qword_4410 != -1) {
      dispatch_once(&qword_4410, &stru_4280);
    }
    uint64_t v3 = qword_4408;
    if (os_log_type_enabled((os_log_t)qword_4408, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "establish connection", v4, 2u);
    }
    sub_2CD0();
  }
}

void sub_305C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_3078(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_3094()
{
  sub_2728();
  sub_305C(&dword_0, v0, v1, "received an unknown event from daemon", v2, v3, v4, v5, v6);
}

void sub_30C8()
{
  sub_2728();
  sub_305C(&dword_0, v0, v1, "failed to establish connection", v2, v3, v4, v5, v6);
}

void sub_30FC()
{
  sub_2728();
  sub_270C(&dword_0, v0, v1, "locationd-events got a message without data?", v2, v3, v4, v5, v6);
}

void sub_3130(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_31A8()
{
  sub_2728();
  sub_270C(&dword_0, v0, v1, "locationd-events got a client name that wasn't a string", v2, v3, v4, v5, v6);
}

void sub_31DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_3248()
{
  sub_2728();
  sub_270C(&dword_0, v0, v1, "locationd-events cfToken was not a number", v2, v3, v4, v5, v6);
}

void sub_327C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_32E8()
{
  sub_2728();
  sub_305C(&dword_0, v0, v1, "the received data object is invalid.", v2, v3, v4, v5, v6);
}

void sub_331C()
{
  sub_2728();
  sub_305C(&dword_0, v0, v1, "the received data object did not unarchive to type NSDictionary", v2, v3, v4, v5, v6);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_end_catch(void)
{
}

void objc_exception_rethrow(void)
{
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

void objc_terminate(void)
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

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
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

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
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

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
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

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}