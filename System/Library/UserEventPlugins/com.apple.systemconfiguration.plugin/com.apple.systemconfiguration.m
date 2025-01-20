void init_systemconfiguration()
{
  xpc_event_provider_create();
}

void sub_38B0(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1 == 1)
  {
    memset(&v18, 0, sizeof(v18));
    v8 = malloc_type_calloc(1uLL, 0x30uLL, 0x10E0040A9AA122CuLL);
    *((void *)v8 + 1) = a2;
    *((_DWORD *)v8 + 10) = 2;
    string = xpc_dictionary_get_string(a3, "KeyPath");
    if (string)
    {
      CFStringRef v10 = CFStringCreateWithCString(0, string, 0x8000100u);
      if (v10)
      {
        CFStringRef v11 = v10;
        *((void *)v8 + 3) = CFStringCreateArrayBySeparatingStrings(0, v10, @"/");
        CFRelease(v11);
      }
      else
      {
        _os_assumes_log();
      }
    }
    if (xpc_dictionary_get_value(a3, "Value")) {
      *((void *)v8 + 4) = _CFXPCCreateCFObjectFromXPCObject();
    }
    v12 = xpc_dictionary_get_string(a3, "Identifier");
    if (v12) {
      CFStringRef v13 = CFStringCreateWithCString(0, v12, 0x8000100u);
    }
    else {
      CFStringRef v13 = 0;
    }
    v16 = xpc_dictionary_get_string(a3, "NotificationType");
    if (v16 && !strcmp(v16, "Commit")) {
      *((_DWORD *)v8 + 10) = 1;
    }
    v17 = SCPreferencesCreate(0, @"SCUserEvents", v13);
    *((void *)v8 + 2) = v17;
    if (!v17)
    {
      _os_assumes_log();
      v17 = (const __SCPreferences *)*((void *)v8 + 2);
    }
    v18.version = 0;
    memset(&v18.retain, 0, 24);
    v18.info = v8;
    if (!SCPreferencesSetCallback(v17, (SCPreferencesCallBack)sub_3B94, &v18)) {
      _os_assumes_log();
    }
    xpc_event_provider_get_queue();
  }
  if (a1 == 2)
  {
    v4 = &qword_4130;
    v5 = &qword_4130;
    while (1)
    {
      v5 = (uint64_t *)*v5;
      if (!v5) {
        break;
      }
      if (v5[1] == a2)
      {
        for (i = (uint64_t *)qword_4130; i != v5; i = (uint64_t *)*i)
          v4 = i;
        uint64_t *v4 = *v5;
        SCPreferencesSetDispatchQueue((SCPreferencesRef)v5[2], 0);
        CFRelease((CFTypeRef)v5[2]);
        v14 = (const void *)v5[3];
        if (v14) {
          CFRelease(v14);
        }
        v15 = (const void *)v5[4];
        if (v15) {
          CFRelease(v15);
        }
        free(v5);
        return;
      }
    }
  }
}

void sub_3B50()
{
  if (qword_4130) {
    xpc_event_provider_token_fire();
  }
}

void sub_3B94(const __SCPreferences *a1, int a2, uint64_t a3)
{
  if (*(const __SCPreferences **)(a3 + 16) != a1) {
    sub_3CF4();
  }
  if ((*(_DWORD *)(a3 + 40) & a2) != 0)
  {
    CFArrayRef v4 = *(const __CFArray **)(a3 + 24);
    if (!v4) {
      goto LABEL_15;
    }
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a3 + 24));
    if (Count >= 1)
    {
      CFIndex v7 = Count;
      v8 = 0;
      for (CFIndex i = 0; i != v7; ++i)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v4, i);
        if (i)
        {
          CFTypeID v11 = CFGetTypeID(v8);
          if (v11 != CFDictionaryGetTypeID())
          {
            _os_assumes_log();
            goto LABEL_20;
          }
          Value = CFDictionaryGetValue((CFDictionaryRef)v8, ValueAtIndex);
        }
        else
        {
          Value = SCPreferencesGetValue(a1, ValueAtIndex);
        }
        v8 = Value;
        if (!Value) {
          goto LABEL_20;
        }
      }
      CFStringRef v13 = *(const void **)(a3 + 32);
      if (!v13 || CFEqual(Value, v13))
      {
        SCPreferencesSynchronize(a1);
LABEL_15:
        xpc_event_provider_token_fire();
      }
    }
LABEL_20:
    SCPreferencesSynchronize(a1);
  }
}

void sub_3CF4()
{
  _os_assert_log();
  CFArrayRef v0 = (const __CFArray *)_os_crash();
  __break(1u);
  CFArrayGetCount(v0);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
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

void CFRelease(CFTypeRef cf)
{
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

uint64_t SCDynamicStoreSetDisconnectCallBack()
{
  return _SCDynamicStoreSetDisconnectCallBack();
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return _SCDynamicStoreSetDispatchQueue(store, queue);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return _SCPreferencesSetCallback(prefs, callout, context);
}

Boolean SCPreferencesSetDispatchQueue(SCPreferencesRef prefs, dispatch_queue_t queue)
{
  return _SCPreferencesSetDispatchQueue(prefs, queue);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_assumes_log()
{
  return __os_assumes_log();
}

uint64_t _os_crash()
{
  return __os_crash();
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
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