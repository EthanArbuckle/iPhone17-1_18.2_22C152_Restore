void *UserEventAgentFactory(uint64_t a1, void *a2)
{
  void *v2;
  CFUUIDRef v3;
  CFUUIDRef v4;

  v2 = a2;
  if (a2)
  {
    v3 = CFUUIDGetConstantUUIDWithBytes(0, 0xFCu, 0x86u, 0x41u, 0x6Du, 0x61u, 0x64u, 0x20u, 0x70u, 0x72u, 0x6Fu, 0x70u, 0x73u, 0x5Cu, 0x21u, 0x6Eu, 0xC0u);
    if (CFEqual(v2, v3))
    {
      v4 = CFUUIDGetConstantUUIDWithBytes(0, 0xFBu, 0x86u, 0x41u, 0x6Du, 0x61u, 0x64u, 0x20u, 0x70u, 0x72u, 0x6Fu, 0x70u, 0x73u, 0x5Cu, 0x21u, 0x6Eu, 0xC0u);
      v2 = malloc_type_malloc(0x40uLL, 0x10E00403558C7EAuLL);
      *v2 = &UserEventAgentInterfaceFtbl;
      v2[3] = 0;
      if (v4)
      {
        v2[1] = CFRetain(v4);
        CFPlugInAddInstanceForFactory(v4);
      }
      *((_DWORD *)v2 + 4) = 1;
      v2[4] = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, (const CFDictionaryValueCallBacks *)&kNetBrowserInfoDictionaryValueCallbacks);
      v2[5] = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&kNetBrowserInfoDictionaryKeyCallbacks, &kCFTypeDictionaryValueCallBacks);
      v2[6] = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&kNetBrowserInfoDictionaryKeyCallbacks, &kCFTypeDictionaryValueCallBacks);
      v2[7] = CFDictionaryCreateMutable(0, 0, (const CFDictionaryKeyCallBacks *)&kNetBrowserInfoDictionaryKeyCallbacks, &kCFTypeDictionaryValueCallBacks);
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t NetBrowserInfoHash(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

BOOL NetBrowserInfoEqual(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 8) == *(void *)(a2 + 8);
}

CFStringRef NetBrowserInfoCopyDescription()
{
  return CFStringCreateWithCString(0, "NetBrowserInfo: No useful description", 0x8000100u);
}

void NetBrowserInfoRelease(uint64_t a1, uint64_t *a2)
{
  if (a2)
  {
    uint64_t v3 = *a2 - 1;
    if (*a2 == 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        uint64_t v4 = a2[1];
        int v6 = 136315650;
        v7 = "com.apple.bonjour.events";
        __int16 v8 = 2080;
        v9 = "NetBrowserInfoRelease";
        __int16 v10 = 2048;
        uint64_t v11 = v4;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s: DNSServiceRefDeallocate %p", (uint8_t *)&v6, 0x20u);
      }
      DNSServiceRefDeallocate((DNSServiceRef)a2[1]);
      free(a2);
    }
    else
    {
      *a2 = v3;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        uint64_t v5 = a2[1];
        int v6 = 136315906;
        v7 = "com.apple.bonjour.events";
        __int16 v8 = 2080;
        v9 = "NetBrowserInfoRelease";
        __int16 v10 = 2048;
        uint64_t v11 = v5;
        __int16 v12 = 1024;
        int v13 = v3;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s: Decremented ref count on %p, count %d", (uint8_t *)&v6, 0x26u);
      }
    }
  }
}

uint64_t *NetBrowserInfoRetain(uint64_t a1, uint64_t *a2)
{
  if (a2)
  {
    uint64_t v3 = *a2 + 1;
    *a2 = v3;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = a2[1];
      int v6 = 136315906;
      v7 = "com.apple.bonjour.events";
      __int16 v8 = 2080;
      v9 = "NetBrowserInfoRetain";
      __int16 v10 = 2048;
      uint64_t v11 = v4;
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s: Incremented ref count on %p, count %d", (uint8_t *)&v6, 0x26u);
    }
  }
  return a2;
}

void Install()
{
}

void ManageEventsCallback(int a1, CFTypeRef cf, CFTypeRef a3, uint64_t a4)
{
  if (cf) {
    CFRetain(cf);
  }
  if (a3) {
    CFRetain(a3);
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000;
  v8[2] = __ManageEventsCallback_block_invoke;
  v8[3] = &__block_descriptor_tmp;
  int v9 = a1;
  v8[4] = cf;
  v8[5] = a3;
  v8[6] = a4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

void __ManageEventsCallback_block_invoke(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 56);
  uint64_t v3 = *(const void **)(a1 + 32);
  uint64_t v4 = *(CFDictionaryRef **)(a1 + 48);
  if (v2 == 2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v10 = "com.apple.bonjour.events";
      __int16 v11 = 2080;
      __int16 v12 = "LaunchdActionHandler";
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s calling RemoveEventToPlugin", buf, 0x16u);
    }
    RemoveEventFromPlugin(v4, v3);
  }
  else if (v2 == 1)
  {
    CFDictionaryRef v5 = *(const __CFDictionary **)(a1 + 40);
    if (v5)
    {
      CFTypeID v6 = CFGetTypeID(*(CFTypeRef *)(a1 + 40));
      if (v6 == CFDictionaryGetTypeID())
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          __int16 v10 = "com.apple.bonjour.events";
          __int16 v11 = 2080;
          __int16 v12 = "LaunchdActionHandler";
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s calling AddEventToPlugin", buf, 0x16u);
        }
        AddEventToPlugin(v4, v3, v5);
      }
      else
      {
        fprintf(__stderrp, "%s:%s given non-dict for event dictionary, action %d\n");
      }
    }
    else
    {
      fprintf(__stderrp, "%s:%s empty dictionary\n");
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v10 = "com.apple.bonjour.events";
    __int16 v11 = 2080;
    __int16 v12 = "LaunchdActionHandler";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s unknown callback event\n", buf, 0x16u);
  }
  v7 = *(const void **)(a1 + 32);
  if (v7) {
    CFRelease(v7);
  }
  __int16 v8 = *(const void **)(a1 + 40);
  if (v8) {
    CFRelease(v8);
  }
}

void AddEventToPlugin(CFDictionaryRef *a1, const void *a2, CFDictionaryRef theDict)
{
  Value = (__CFString *)CFDictionaryGetValue(theDict, @"ServiceDomain");
  CFStringRef v7 = (const __CFString *)CFDictionaryGetValue(theDict, @"ServiceType");
  __int16 v8 = CFDictionaryGetValue(theDict, @"ServiceName");
  CFBooleanRef v9 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"OnServiceAdd");
  __int16 v10 = CFDictionaryGetValue(theDict, @"OnServiceRemove");
  if (v9 && (CFTypeID v11 = CFGetTypeID(v9), v11 == CFBooleanGetTypeID()))
  {
    BOOL v12 = CFBooleanGetValue(v9) != 0;
    if (!v10) {
      goto LABEL_9;
    }
  }
  else
  {
    BOOL v12 = 0;
    if (!v10) {
      goto LABEL_9;
    }
  }
  CFTypeID v13 = CFGetTypeID(v10);
  if (v13 == CFBooleanGetTypeID())
  {
    BOOL v14 = CFBooleanGetValue((CFBooleanRef)v10) != 0;
    if (!v7) {
      goto LABEL_16;
    }
    goto LABEL_10;
  }
LABEL_9:
  BOOL v14 = 0;
  if (!v7)
  {
LABEL_16:
    fprintf(__stderrp, "%s:%s: a LaunchEvent is missing a service type.\n");
    return;
  }
LABEL_10:
  CFTypeID v15 = CFGetTypeID(v7);
  if (v15 != CFStringGetTypeID()) {
    goto LABEL_16;
  }
  if (!v12 && !v14)
  {
    fprintf(__stderrp, "%s:%s a LaunchEvent is missing both onAdd and onRemove events\n");
    return;
  }
  if (!Value)
  {
    Value = @"local";
    if (!v8) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  CFTypeID v16 = CFGetTypeID(Value);
  if (v16 != CFStringGetTypeID()) {
    goto LABEL_32;
  }
  if (v8)
  {
LABEL_19:
    CFTypeID v17 = CFGetTypeID(v8);
    if (v17 == CFStringGetTypeID()) {
      goto LABEL_20;
    }
LABEL_32:
    fprintf(__stderrp, "%s:%s a LaunchEvent has a domain that is not a string.\n");
    return;
  }
LABEL_20:
  Browser = CreateBrowser(a1, v7, Value);
  if (Browser)
  {
    v19 = Browser;
    Mutable = CFDictionaryCreateMutable(0, 4, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, @"LaunchdToken", a2);
    CFDictionarySetValue(Mutable, @"LaunchdDict", theDict);
    if (v8) {
      CFDictionarySetValue(Mutable, @"ServiceName", v8);
    }
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "com.apple.bonjour.events";
        __int16 v23 = 2080;
        v24 = "AddEventToPlugin";
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s: Adding browser to AddEvents", buf, 0x16u);
      }
      AddEventDictionary(Mutable, a1[6], v19);
    }
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "com.apple.bonjour.events";
        __int16 v23 = 2080;
        v24 = "AddEventToPlugin";
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s: Adding browser to RemoveEvents", buf, 0x16u);
      }
      AddEventDictionary(Mutable, a1[7], v19);
    }
    CFDictionarySetValue(a1[4], a2, v19);
    CFRelease(Mutable);
  }
  else
  {
    fprintf(__stderrp, "%s:%s cannot create browser\n");
  }
}

void RemoveEventFromPlugin(CFDictionaryRef *a1, const void *a2)
{
  Value = CFDictionaryGetValue(a1[4], a2);
  if (Value)
  {
    CFDictionaryRef v5 = Value;
    CFArrayRef v6 = (const __CFArray *)CFDictionaryGetValue(a1[6], Value);
    CFArrayRef v7 = (const __CFArray *)CFDictionaryGetValue(a1[7], v5);
    if (v6)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "com.apple.bonjour.events";
        __int16 v13 = 2080;
        BOOL v14 = "RemoveEventFromPlugin";
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s: Calling RemoveEventFromArray for OnAddEvents", buf, 0x16u);
      }
      RemoveEventFromArray(v6, a2);
      if (!CFArrayGetCount(v6))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "com.apple.bonjour.events";
          __int16 v13 = 2080;
          BOOL v14 = "RemoveEventFromPlugin";
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s: Removing the browser from AddEvents", buf, 0x16u);
        }
        CFDictionaryRemoveValue(a1[6], v5);
      }
    }
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "com.apple.bonjour.events";
        __int16 v13 = 2080;
        BOOL v14 = "RemoveEventFromPlugin";
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s: Calling RemoveEventFromArray for OnRemoveEvents", buf, 0x16u);
      }
      RemoveEventFromArray(v7, a2);
      if (!CFArrayGetCount(v7))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(void *)&uint8_t buf[4] = "com.apple.bonjour.events";
          __int16 v13 = 2080;
          BOOL v14 = "RemoveEventFromPlugin";
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s: Removing the browser from RemoveEvents", buf, 0x16u);
        }
        CFDictionaryRemoveValue(a1[7], v5);
      }
    }
    CFDictionaryRemoveValue(a1[4], a2);
    CFIndex Count = CFDictionaryGetCount(a1[4]);
    CFBooleanRef v9 = (const void **)malloc_type_malloc(8 * Count, 0x2004093837F09uLL);
    CFDictionaryGetKeysAndValues(a1[4], 0, v9);
    if (Count < 1)
    {
LABEL_20:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&uint8_t buf[4] = "com.apple.bonjour.events";
        __int16 v13 = 2080;
        BOOL v14 = "RemoveEventFromPlugin";
        __int16 v15 = 2048;
        CFTypeID v16 = v5;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s: Removing browser %p from _browsers", buf, 0x20u);
      }
      CFDictionaryRemoveValue(a1[5], v5);
    }
    else
    {
      __int16 v10 = v9;
      while (*((void *)*v10 + 1) != v5[1])
      {
        ++v10;
        if (!--Count) {
          goto LABEL_20;
        }
      }
    }
    BOOL v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (v11)
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "com.apple.bonjour.events";
      __int16 v13 = 2080;
      BOOL v14 = "RemoveEventFromPlugin";
      __int16 v15 = 2048;
      CFTypeID v16 = v5;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s: Decrementing browser %p count", buf, 0x20u);
    }
    NetBrowserInfoRelease(v11, v5);
    free(v9);
  }
  else
  {
    *(void *)buf = 0;
    CFNumberGetValue((CFNumberRef)a2, kCFNumberLongLongType, buf);
    fprintf(__stderrp, "%s:%s Launchd asked us to remove a token we did not register! ==Token:%lld== \n", "com.apple.bonjour.events", "RemoveEventFromPlugin", *(void *)buf);
  }
}

void RemoveEventFromArray(const __CFArray *a1, const void *a2)
{
  CFIndex Count = CFArrayGetCount(a1);
  if (Count < 1)
  {
    CFIndex v5 = 0;
  }
  else
  {
    CFIndex v5 = 0;
    while (1)
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v5);
      Value = CFDictionaryGetValue(ValueAtIndex, @"LaunchdToken");
      if (CFEqual(Value, a2)) {
        break;
      }
      if (Count == ++v5) {
        goto LABEL_11;
      }
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      CFBooleanRef v9 = "com.apple.bonjour.events";
      __int16 v10 = 2080;
      BOOL v11 = "RemoveEventFromArray";
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s found token", (uint8_t *)&v8, 0x16u);
    }
    CFArrayRemoveValueAtIndex(a1, v5);
  }
  if (v5 == Count)
  {
LABEL_11:
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      CFBooleanRef v9 = "com.apple.bonjour.events";
      __int16 v10 = 2080;
      BOOL v11 = "RemoveEventFromArray";
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s did not find token", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t *CreateBrowser(CFDictionaryRef *a1, const __CFString *a2, const __CFString *a3)
{
  CFIndex Count = CFDictionaryGetCount(a1[5]);
  CFArrayRef v7 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
  v22 = (const void **)malloc_type_malloc(8 * Count, 0x2004093837F09uLL);
  CFDictionaryGetKeysAndValues(a1[5], v22, v7);
  if (Count < 1) {
    goto LABEL_6;
  }
  uint64_t v8 = 0;
  while (1)
  {
    CFDictionaryRef v9 = (const __CFDictionary *)v7[v8];
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v9, @"ServiceType");
    CFStringRef v11 = (const __CFString *)CFDictionaryGetValue(v9, @"ServiceDomain");
    if (CFStringCompare(Value, a2, 1uLL) == kCFCompareEqualTo && CFStringCompare(v11, a3, 1uLL) == kCFCompareEqualTo) {
      break;
    }
    if (Count == ++v8) {
      goto LABEL_6;
    }
  }
  BOOL v20 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
  if (v20)
  {
    *(_DWORD *)buf = 136315394;
    v24 = "com.apple.bonjour.events";
    __int16 v25 = 2080;
    v26 = "CreateBrowser";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s: found a duplicate browser\n", buf, 0x16u);
  }
  __int16 v13 = (uint64_t *)v22[v8];
  NetBrowserInfoRetain(v20, v13);
  if (!v13)
  {
LABEL_6:
    BOOL v12 = NetBrowserInfoCreate(a2, a3, a1);
    if (v12)
    {
      __int16 v13 = v12;
      Mutable = CFDictionaryCreateMutable(0, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(Mutable, @"ServiceType", a2);
      CFDictionarySetValue(Mutable, @"ServiceDomain", a3);
      CFDictionarySetValue(a1[5], v13, Mutable);
      CFRelease(Mutable);
    }
    else
    {
      __int16 v15 = __stderrp;
      CFTypeID v16 = "??????";
      if (a2)
      {
        CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
        if (CStringPtr) {
          CFTypeID v16 = CStringPtr;
        }
      }
      v18 = "??????";
      if (a3)
      {
        v19 = CFStringGetCStringPtr(a3, 0x8000100u);
        if (v19) {
          v18 = v19;
        }
      }
      fprintf(v15, "%s:%s failed to search for %s.%s", "com.apple.bonjour.events", "CreateBrowser", v16, v18);
      __int16 v13 = 0;
    }
  }
  free(v7);
  free(v22);
  return v13;
}

void AddEventDictionary(const void *a1, CFDictionaryRef theDict, void *key)
{
  CFStringRef Value = (__CFArray *)CFDictionaryGetValue(theDict, key);
  if (Value)
  {
    CFMutableArrayRef Mutable = Value;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      CFDictionaryRef v9 = "com.apple.bonjour.events";
      __int16 v10 = 2080;
      CFStringRef v11 = "AddEventDictionary";
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s Incrementing refcount", (uint8_t *)&v8, 0x16u);
    }
    CFRetain(Mutable);
  }
  else
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    CFDictionarySetValue(theDict, key, Mutable);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315394;
      CFDictionaryRef v9 = "com.apple.bonjour.events";
      __int16 v10 = 2080;
      CFStringRef v11 = "AddEventDictionary";
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s creating a new array", (uint8_t *)&v8, 0x16u);
    }
  }
  CFArrayAppendValue(Mutable, a1);
  CFRelease(Mutable);
}

void *NetBrowserInfoCreate(const __CFString *a1, const __CFString *a2, void *a3)
{
  DNSServiceRef sdRef = 0;
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  int v8 = (char *)malloc_type_calloc(MaximumSizeForEncoding, 1uLL, 0x5FB170C3uLL);
  int CString = CFStringGetCString(a1, v8, MaximumSizeForEncoding, 0x8000100u);
  if (!a2 || (CFIndex v10 = CFStringGetLength(a2), (v11 = CFStringGetMaximumSizeForEncoding(v10, 0x8000100u)) == 0))
  {
    __int16 v13 = 0;
    if (CString) {
      goto LABEL_6;
    }
LABEL_9:
    fprintf(__stderrp, "%s:%s LaunchEvent has badly encoded service type or domain.\n");
    goto LABEL_10;
  }
  CFIndex v12 = v11;
  __int16 v13 = (char *)malloc_type_calloc(v11, 1uLL, 0xE12C753BuLL);
  if (CString) {
    int CString = CFStringGetCString(a2, v13, v12, 0x8000100u) != 0;
  }
  if (!CString) {
    goto LABEL_9;
  }
LABEL_6:
  if (DNSServiceBrowse(&sdRef, 0, 0, v8, v13, (DNSServiceBrowseReply)ServiceBrowserCallback, a3))
  {
    fprintf(__stderrp, "%s:%s Failed to create browser for %s, %s\n");
LABEL_10:
    free(v8);
    if (v13) {
      free(v13);
    }
    return 0;
  }
  DNSServiceSetDispatchQueue(sdRef, (dispatch_queue_t)&_dispatch_main_q);
  BOOL v14 = malloc_type_malloc(0x10uLL, 0x10200405730B0C9uLL);
  DNSServiceRef v16 = sdRef;
  *BOOL v14 = 1;
  v14[1] = v16;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "com.apple.bonjour.events";
    __int16 v20 = 2080;
    v21 = "NetBrowserInfoCreate";
    __int16 v22 = 2048;
    __int16 v23 = v14;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s: created new object %p", buf, 0x20u);
  }
  free(v8);
  if (v13) {
    free(v13);
  }
  return v14;
}

void ServiceBrowserCallback(uint64_t a1, char a2, uint64_t a3, int a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFIndex v12 = BrowserForSDRef(a8, a1);
  if (v12)
  {
    if (a4)
    {
      fprintf(__stderrp, "%s:%s ServiceBrowserCallback: errcode set %d\n");
    }
    else
    {
      __int16 v13 = v12;
      CFStringRef v14 = CFStringCreateWithCString(0, a5, 0x8000100u);
      if (v14)
      {
        CFStringRef v15 = v14;
        BOOL v16 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
        if ((a2 & 2) != 0)
        {
          if (v16)
          {
            *(_DWORD *)buf = 136315394;
            __int16 v20 = "com.apple.bonjour.events";
            __int16 v21 = 2080;
            __int16 v22 = "ServiceBrowserCallback";
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s calling HandleTemporaryEventsForService Add\n", buf, 0x16u);
          }
          CFTypeID v17 = (CFDictionaryRef *)(a8 + 48);
        }
        else
        {
          if (v16)
          {
            *(_DWORD *)buf = 136315394;
            __int16 v20 = "com.apple.bonjour.events";
            __int16 v21 = 2080;
            __int16 v22 = "ServiceBrowserCallback";
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s calling HandleTemporaryEventsForService Remove\n", buf, 0x16u);
          }
          CFTypeID v17 = (CFDictionaryRef *)(a8 + 56);
        }
        HandleTemporaryEventsForService(a8, v13, v15, *v17);
        CFRelease(v15);
      }
      else
      {
        int v18 = ServiceBrowserCallback_msgCount;
        if (ServiceBrowserCallback_msgCount <= 999)
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315650;
            __int16 v20 = "com.apple.bonjour.events";
            __int16 v21 = 2080;
            __int16 v22 = "ServiceBrowserCallback";
            __int16 v23 = 2080;
            v24 = a5;
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s Can not create CFString for serviceName %s", buf, 0x20u);
            int v18 = ServiceBrowserCallback_msgCount;
          }
          ServiceBrowserCallback_msgCFIndex Count = v18 + 1;
        }
      }
    }
  }
  else
  {
    fprintf(__stderrp, "%s:%s ServiceBrowserCallback: missing browser\n");
  }
}

const void *BrowserForSDRef(uint64_t a1, uint64_t a2)
{
  CFIndex Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 40));
  CFIndex v5 = (const void **)malloc_type_malloc(8 * Count, 0x2004093837F09uLL);
  CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 40), v5, 0);
  if (Count < 1)
  {
LABEL_5:
    CFArrayRef v7 = 0;
  }
  else
  {
    CFArrayRef v6 = v5;
    while (1)
    {
      CFArrayRef v7 = *v6;
      if (*((void *)*v6 + 1) == a2) {
        break;
      }
      ++v6;
      if (!--Count) {
        goto LABEL_5;
      }
    }
  }
  free(v5);
  return v7;
}

uint64_t HandleTemporaryEventsForService(int a1, const void *a2, const void *a3, CFDictionaryRef theDict)
{
  uint64_t result = (uint64_t)CFDictionaryGetValue(theDict, a2);
  if (result)
  {
    CFArrayRef v6 = (const __CFArray *)result;
    uint64_t result = CFArrayGetCount((CFArrayRef)result);
    if (result >= 1)
    {
      uint64_t v7 = result;
      for (CFIndex i = 0; i != v7; ++i)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v6, i);
        CFStringRef Value = CFDictionaryGetValue(ValueAtIndex, @"ServiceName");
        CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"LaunchdToken");
        CFDictionaryGetValue(ValueAtIndex, @"LaunchdDict");
        if (Value)
        {
          uint64_t result = CFEqual(a3, Value);
          if (!result) {
            continue;
          }
        }
        uint64_t valuePtr = 0;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          CFStringRef v14 = "com.apple.bonjour.events";
          __int16 v15 = 2080;
          BOOL v16 = "HandleTemporaryEventsForService";
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s:%s HandleTemporaryEventsForService signal\n", buf, 0x16u);
        }
        CFNumberGetValue(v11, kCFNumberLongLongType, &valuePtr);
        _CFXPCCreateXPCObjectFromCFObject();
        UserEventAgentFireEvent();
      }
    }
  }
  return result;
}

uint64_t Release(void *a1)
{
  int v2 = *((_DWORD *)a1 + 4);
  if (!v2 || (uint64_t result = (v2 - 1), *((_DWORD *)a1 + 4) = result, v2 == 1))
  {
    uint64_t v4 = (const void *)*((void *)a1 + 1);
    if (v4)
    {
      CFPlugInRemoveInstanceForFactory(*((CFUUIDRef *)a1 + 1));
      CFRelease(v4);
    }
    CFIndex v5 = (const void *)*((void *)a1 + 4);
    if (v5) {
      CFRelease(v5);
    }
    CFArrayRef v6 = (const void *)*((void *)a1 + 5);
    if (v6) {
      CFRelease(v6);
    }
    uint64_t v7 = (const void *)*((void *)a1 + 6);
    if (v7) {
      CFRelease(v7);
    }
    int v8 = (const void *)*((void *)a1 + 7);
    if (v8) {
      CFRelease(v8);
    }
    free(a1);
    return 0;
  }
  return result;
}

uint64_t AddRef(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t QueryInterface(uint64_t a1, CFUUIDBytes a2, void *a3)
{
  CFUUIDRef v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(0, 0xFDu, 0x86u, 0x41u, 0x6Du, 0x61u, 0x64u, 0x20u, 0x70u, 0x72u, 0x6Fu, 0x70u, 0x73u, 0x5Cu, 0x21u, 0x6Eu, 0xC0u);
  if (CFEqual(v5, v6)
    || (CFUUIDRef v7 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v5, v7)))
  {
    (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
    uint64_t v8 = 0;
  }
  else
  {
    a1 = 0;
    uint64_t v8 = 2147483652;
  }
  *a3 = a1;
  CFRelease(v5);
  return v8;
}

const char *CStringFromCFString(const __CFString *a1)
{
  uint64_t v1 = "??????";
  if (a1)
  {
    CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
    if (CStringPtr) {
      return CStringPtr;
    }
  }
  return v1;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
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

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return _CFStringGetMaximumSizeForEncoding(length, encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return _CFUUIDCreateFromUUIDBytes(alloc, bytes);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

DNSServiceErrorType DNSServiceBrowse(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *regtype, const char *domain, DNSServiceBrowseReply callBack, void *context)
{
  return _DNSServiceBrowse(sdRef, flags, interfaceIndex, regtype, domain, callBack, context);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return _DNSServiceSetDispatchQueue(service, queue);
}

void UserEventAgentFireEvent()
{
  while (1)
    ;
}

void UserEventAgentRegisterForLaunchEvents()
{
  while (1)
    ;
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return __CFXPCCreateXPCObjectFromCFObject();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
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

void xpc_release(xpc_object_t object)
{
}