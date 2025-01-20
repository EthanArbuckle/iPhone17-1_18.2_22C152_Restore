void init_notification_matching(uint64_t a1)
{
  if (qword_41C8 != -1) {
    dispatch_once(&qword_41C8, &stru_4118);
  }
  *(void *)malloc_type_calloc(1uLL, 0x20uLL, 0xE0040EC2F7C6DuLL) = a1;
  xpc_event_provider_create();
}

void sub_36EC(id a1)
{
  long long v1 = off_4138;
  qword_41D0 = (uint64_t)CFSetCreate(0, (const void **)&v1, 2, &kCFTypeSetCallBacks);
  if (!qword_41D0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_3C20();
  }
}

void sub_3784(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  if (a1 == 2)
  {
    v13 = a4 + 3;
    v14 = a4 + 3;
    while (1)
    {
      v14 = (void *)*v14;
      if (!v14) {
        break;
      }
      if (v14[2] == a2)
      {
        uint64_t v15 = a4[2];
        v16 = *(void (**)(uint64_t, void *))(v15 + 24);
        uint64_t v17 = (*(uint64_t (**)(void))(v15 + 8))();
        v16(v17, v14);
        for (i = (void *)a4[3]; i != v14; i = (void *)*i)
          v13 = i;
        void *v13 = *v14;
        free(v14);
        return;
      }
    }
  }
  else
  {
    if (a1 != 1) {
      return;
    }
    v7 = malloc_type_calloc(1uLL, 0x18uLL, 0x10A00404E934A1DuLL);
    v7[1] = a4[1];
    v7[2] = a2;
    void *v7 = a4[3];
    a4[3] = v7;
    CFStringRef v8 = sub_399C(a3, "Name");
    CFStringRef v9 = sub_399C(a3, "Object");
    if (!v8)
    {
      _os_assumes_log();
      if (!v9) {
        return;
      }
      goto LABEL_8;
    }
    if (CFSetContainsValue((CFSetRef)qword_41D0, v8))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        CFStringRef v20 = v8;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Subscribed for disnoted notification: %@", (uint8_t *)&v19, 0xCu);
      }
    }
    v10 = *(uint64_t (**)(void))(a4[2] + 8);
    v11 = *(void (**)(uint64_t, void *, void (*)(uint64_t, uint64_t, const __CFString *, uint64_t, uint64_t), CFStringRef, CFStringRef, uint64_t))(a4[2] + 16);
    uint64_t v12 = v10();
    v11(v12, v7, sub_3A1C, v8, v9, 4);
    CFRelease(v8);
    if (v9) {
LABEL_8:
    }
      CFRelease(v9);
  }
}

CFStringRef sub_399C(void *a1, const char *a2)
{
  xpc_object_t value = xpc_dictionary_get_value(a1, a2);
  if (!value) {
    return 0;
  }
  v3 = value;
  if (xpc_get_type(value) != (xpc_type_t)&_xpc_type_string) {
    return 0;
  }
  string_ptr = xpc_string_get_string_ptr(v3);

  return CFStringCreateWithCString(kCFAllocatorDefault, string_ptr, 0x8000100u);
}

void sub_3A1C(uint64_t a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5)
{
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  CFIndex Length = CFStringGetLength(a3);
  CFIndex v10 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v11 = (char *)malloc_type_malloc(v10, 0xD3B3F93BuLL);
  if (v11)
  {
    uint64_t v12 = v11;
    if (CFStringGetCString(a3, v11, v10, 0x8000100u)) {
      xpc_dictionary_set_string(v8, "Name", v12);
    }
    free(v12);
  }
  sub_3BAC(v8, "Object", a4);
  sub_3BAC(v8, "UserInfo", a5);
  xpc_event_provider_token_fire();
}

void sub_3BAC(void *a1, const char *a2, uint64_t a3)
{
  if (a3)
  {
    v5 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    if (v5)
    {
      v6 = v5;
      xpc_dictionary_set_value(a1, a2, v5);
      xpc_release(v6);
    }
  }
}

void sub_3C20()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create a CF set.", v0, 2u);
}

void CFRelease(CFTypeRef cf)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return _CFSetContainsValue(theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return _CFSetCreate(allocator, values, numValues, callBacks);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
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

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
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

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}