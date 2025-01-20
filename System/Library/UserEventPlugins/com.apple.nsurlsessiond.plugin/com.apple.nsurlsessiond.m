void init_nsurlsessiond_events()
{
  qword_41D8 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  qword_41E0 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  xpc_event_provider_create();
}

void sub_3710(uint64_t a1, uint64_t a2, xpc_object_t object)
{
  uint64_t valuePtr = a2;
  if (qword_41F0 != -1) {
    dispatch_once(&qword_41F0, &stru_4138);
  }
  if (a1 == 2)
  {
    syslog(5, "nsurlsessiond_events plugin: removing token %llu", a2);
    CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, &valuePtr);
    if (!v10) {
      goto LABEL_17;
    }
    CFStringRef v8 = (CFStringRef)v10;
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_41E0, v10);
    if (Value) {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_41D8, Value);
    }
    CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_41E0, v8);
LABEL_16:
    CFRelease(v8);
    goto LABEL_17;
  }
  if (a1 == 1)
  {
    if (object)
    {
      if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
      {
        string = xpc_dictionary_get_string(object, kNSURLSessionLaunchOnDemandClientIdentifierKey);
        if (string)
        {
          v7 = string;
          syslog(5, "nsurlsessiond_events plugin: adding token %llu for client %s", a2, string);
          CFStringRef v8 = CFStringCreateWithCString(kCFAllocatorDefault, v7, 0x8000100u);
          CFNumberRef v9 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, &valuePtr);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_41D8, v8, v9);
          CFDictionarySetValue((CFMutableDictionaryRef)qword_41E0, v9, v8);
          if (v9) {
            CFRelease(v9);
          }
          if (v8) {
            goto LABEL_16;
          }
        }
      }
    }
  }
LABEL_17:
  sub_38B4();
}

void sub_38B4()
{
  if (qword_41F8)
  {
    xpc_object_t v0 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v0, "com.apple.nsurlsessiond-events.message-type", 2);
    v1 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(v0, "com.apple.nsurlsessiond-events.registered-clients", v1);
    xpc_connection_send_message((xpc_connection_t)qword_41F8, v0);
    xpc_release(v1);
    xpc_release(v0);
  }
}

void sub_3964(id a1)
{
  int out_token = 0;
  xpc_event_provider_get_queue();
}

void sub_39B8()
{
  if (qword_41F8)
  {
    xpc_connection_cancel((xpc_connection_t)qword_41F8);
    xpc_release((xpc_object_t)qword_41F8);
    qword_41F8 = 0;
  }
  xpc_event_provider_get_queue();
}

void sub_3A2C(id a1, void *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_dictionary
    && xpc_dictionary_get_int64(a2, "com.apple.nsurlsessiond-events.message-type") == 1)
  {
    string = xpc_dictionary_get_string(a2, kNSURLSessionLaunchOnDemandClientIdentifierKey);
    v4 = xpc_dictionary_get_string(a2, kNSURLSessionLaunchOnDemandSessionIdentifierKey);
    if (string)
    {
      v5 = v4;
      CFStringRef v6 = CFStringCreateWithCString(kCFAllocatorDefault, string, 0x8000100u);
      CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)qword_41D8, v6);
      if (Value)
      {
        uint64_t valuePtr = 0;
        CFNumberGetValue(Value, kCFNumberLongType, &valuePtr);
        xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
        if (v5) {
          xpc_dictionary_set_string(v8, kNSURLSessionLaunchOnDemandSessionIdentifierKey, v5);
        }
        syslog(5, "calling xpc_event_provider_token_fire for client %s session %s", string, v5);
        xpc_event_provider_token_fire();
      }
      if (v6) {
        CFRelease(v6);
      }
    }
  }
}

void sub_3B70(id a1, int a2)
{
  if (!qword_41F8)
  {
    syslog(3, "nsurlsessiond launched and we didn't have an xpc connection-- creating a new one");
    sub_39B8();
  }

  sub_38B4();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

void syslog(int a1, const char *a2, ...)
{
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
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