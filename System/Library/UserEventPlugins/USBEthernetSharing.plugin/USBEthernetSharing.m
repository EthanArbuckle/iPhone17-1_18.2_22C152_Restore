__CFString *usbeth_copy_active_services_entity(const __CFString *a1)
{
  __CFString *NetworkGlobalEntity;
  CFPropertyListRef v3;
  CFTypeID v4;
  CFArrayRef Value;
  CFArrayRef v6;
  uint64_t Count;
  CFIndex v8;
  CFStringRef ValueAtIndex;
  CFStringRef NetworkServiceEntity;
  CFStringRef v11;
  CFDictionaryRef v12;
  const void *v13;
  __CFString *v14;
  BOOL v15;
  CFIndex v17;
  const void *v18;
  const void *v19;

  NetworkGlobalEntity = (__CFString *)SCDynamicStoreKeyCreateNetworkGlobalEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, kSCEntNetIPv4);
  if (NetworkGlobalEntity)
  {
    v3 = SCDynamicStoreCopyValue((SCDynamicStoreRef)qword_4688, NetworkGlobalEntity);
    CFRelease(NetworkGlobalEntity);
    if (v3)
    {
      v4 = CFGetTypeID(v3);
      if (v4 == CFDictionaryGetTypeID())
      {
        Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v3, kSCPropNetServiceOrder);
        if (Value)
        {
          v6 = Value;
          CFRetain(Value);
          CFRelease(v3);
          if (CFArrayGetCount(v6))
          {
            Count = CFArrayGetCount(v6);
            NetworkGlobalEntity = (__CFString *)CFArrayCreateMutable(kCFAllocatorDefault, Count, &kCFTypeArrayCallBacks);
            if (NetworkGlobalEntity)
            {
              if (Count < 1)
              {
                v8 = 0;
              }
              else
              {
                v8 = 0;
                while (1)
                {
                  ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v6, v8);
                  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, ValueAtIndex, a1);
                  if (!NetworkServiceEntity) {
                    break;
                  }
                  v11 = NetworkServiceEntity;
                  CFArraySetValueAtIndex((CFMutableArrayRef)NetworkGlobalEntity, v8, NetworkServiceEntity);
                  CFRelease(v11);
                  if (Count == ++v8)
                  {
                    CFRelease(v6);
                    goto LABEL_17;
                  }
                }
              }
              CFRelease(v6);
              if (v8 == Count)
              {
LABEL_17:
                v12 = SCDynamicStoreCopyMultiple((SCDynamicStoreRef)qword_4688, (CFArrayRef)NetworkGlobalEntity, 0);
                if (v12) {
                  v13 = v12;
                }
                else {
                  v13 = NetworkGlobalEntity;
                }
                if (v12) {
                  v14 = NetworkGlobalEntity;
                }
                else {
                  v14 = 0;
                }
                if (v12) {
                  v15 = Count < 1;
                }
                else {
                  v15 = 1;
                }
                if (v15)
                {
                  v3 = v13;
                  NetworkGlobalEntity = v14;
                }
                else
                {
                  v3 = v12;
                  v17 = 0;
                  do
                  {
                    v18 = CFArrayGetValueAtIndex((CFArrayRef)NetworkGlobalEntity, v17);
                    v19 = CFDictionaryGetValue((CFDictionaryRef)v3, v18);
                    if (v19) {
                      CFArraySetValueAtIndex((CFMutableArrayRef)NetworkGlobalEntity, v17, v19);
                    }
                    ++v17;
                  }
                  while (Count != v17);
                }
                goto LABEL_31;
              }
              v3 = NetworkGlobalEntity;
              goto LABEL_30;
            }
          }
          else
          {
            NetworkGlobalEntity = 0;
          }
          v3 = v6;
LABEL_31:
          CFRelease(v3);
          return NetworkGlobalEntity;
        }
      }
LABEL_30:
      NetworkGlobalEntity = 0;
      goto LABEL_31;
    }
    return 0;
  }
  return NetworkGlobalEntity;
}

void *UserEventAgentFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 0xFCu, 0x86u, 0x41u, 0x6Du, 0x61u, 0x64u, 0x20u, 0x70u, 0x72u, 0x6Fu, 0x70u, 0x73u, 0x5Cu, 0x21u, 0x6Eu, 0xC0u);
  if (!CFEqual(a2, v3)) {
    return 0;
  }
  v4 = malloc_type_malloc(0x20uLL, 0x10E0040B810A3B3uLL);
  v4[2] = 0;
  v4[3] = 0;
  void *v4 = &unk_4658;
  v4[1] = 0;
  CFUUIDRef v5 = CFUUIDGetConstantUUIDWithBytes(0, 0xFBu, 0x86u, 0x41u, 0x6Du, 0x61u, 0x64u, 0x20u, 0x70u, 0x72u, 0x6Fu, 0x70u, 0x73u, 0x5Cu, 0x21u, 0x6Eu, 0xC0u);
  v4[1] = CFRetain(v5);
  CFUUIDRef v6 = CFUUIDGetConstantUUIDWithBytes(0, 0xFBu, 0x86u, 0x41u, 0x6Du, 0x61u, 0x64u, 0x20u, 0x70u, 0x72u, 0x6Fu, 0x70u, 0x73u, 0x5Cu, 0x21u, 0x6Eu, 0xC0u);
  CFPlugInAddInstanceForFactory(v6);
  *((_DWORD *)v4 + 4) = 1;
  return v4;
}

uint64_t sub_CE0(uint64_t a1, CFUUIDBytes a2, void *a3)
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

uint64_t sub_DF0(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_E04(void *a1)
{
  int v1 = *((_DWORD *)a1 + 4);
  uint64_t v2 = (v1 - 1);
  *((_DWORD *)a1 + 4) = v2;
  if (v1 == 1)
  {
    v4 = (const void *)*((void *)a1 + 1);
    if (v4)
    {
      CFPlugInRemoveInstanceForFactory(*((CFUUIDRef *)a1 + 1));
      CFRelease(v4);
    }
    free(a1);
  }
  return v2;
}

void sub_E60()
{
  qword_4690 = 0;
  v0 = dispatch_queue_create("USBEthernetSharing", 0);
  qword_4690 = (uint64_t)v0;
  if (v0)
  {
    dispatch_async(v0, &stru_43D8);
  }
  else
  {
    sub_ED8();
  }
}

uint64_t sub_ED8()
{
  uint64_t result = sub_13D4();
  if (result) {
    return os_log_with_args();
  }
  return result;
}

void sub_F40(id a1)
{
  if (!qword_46B0)
  {
    v11 = SCPreferencesCreate(kCFAllocatorDefault, @"com.apple.sc.networking.usbethernet", @"com.apple.USBEthernet.logging.plist");
    qword_46B0 = (uint64_t)v11;
    if (!v11)
    {
      int v12 = SCError();
      SCErrorString(v12);
LABEL_32:
      sub_ED8();
      return;
    }
    if (!SCPreferencesSetCallback(v11, (SCPreferencesCallBack)sub_1450, 0)
      || !SCPreferencesSetDispatchQueue((SCPreferencesRef)qword_46B0, (dispatch_queue_t)qword_4690))
    {
      int v13 = SCError();
      SCErrorString(v13);
      sub_ED8();
      CFRelease((CFTypeRef)qword_46B0);
      qword_46B0 = 0;
      return;
    }
    sub_1450((const __SCPreferences *)qword_46B0, 3);
  }
  if (_NETRBClientCreate())
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    *(_OWORD *)cStr = 0u;
    long long v15 = 0u;
    if ((_NETRBClientGetDynamicStoreKey() & 1) == 0
      || (qword_46A0 = (uint64_t)CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u)) == 0)
    {
      sub_ED8();
      _NETRBClientDestroy();
      return;
    }
    qword_46A8 = (uint64_t)SCDynamicStoreKeyCreateNetworkGlobalEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, kSCEntNetIPv4);
    if (!qword_46A8) {
      goto LABEL_32;
    }
    _NETRBClientDestroy();
    int v1 = getprogname();
    CFStringRef v2 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%s-%s", v1, "usbeth_setup_sc_notifications", *(void *)cStr, *(void *)&cStr[8], v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
           v27,
           v28,
           v29);
    CFUUIDRef v3 = SCDynamicStoreCreate(kCFAllocatorDefault, v2, (SCDynamicStoreCallBack)sub_1534, 0);
    qword_4688 = (uint64_t)v3;
    if (v2)
    {
      CFRelease(v2);
      CFUUIDRef v3 = (const __SCDynamicStore *)qword_4688;
    }
    if (v3)
    {
      SCDynamicStoreSetDispatchQueue(v3, (dispatch_queue_t)qword_4690);
      Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      qword_46B8 = (uint64_t)Mutable;
      if (Mutable)
      {
        CFArrayAppendValue(Mutable, (const void *)qword_46A0);
        CFArrayAppendValue((CFMutableArrayRef)qword_46B8, (const void *)qword_46A8);
        int v5 = SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)qword_4688, (CFArrayRef)qword_46B8, 0);
        sub_1534(v5, (CFArrayRef)qword_46B8);
      }
    }
    CFStringRef v6 = (const __CFString *)kLockdownNotificationTrustedHostAttached;
    CFUUIDRef v7 = sub_1870(kLockdownNotificationTrustedHostAttached);
    if (notify_register_dispatch(v7, &dword_56D4, (dispatch_queue_t)qword_4690, &stru_4438)
      || (CFStringRef v6 = (const __CFString *)kLockdownNotificationHostAttached,
          uint64_t v8 = sub_1870(kLockdownNotificationHostAttached),
          notify_register_dispatch(v8, &dword_56D4, (dispatch_queue_t)qword_4690, &stru_4478))
      || (CFStringRef v6 = (const __CFString *)kLockdownNotificationHostDetached,
          v9 = sub_1870(kLockdownNotificationHostDetached),
          notify_register_dispatch(v9, &dword_56D8, (dispatch_queue_t)qword_4690, &stru_44B8)))
    {
      sub_1870(v6);
      sub_ED8();
    }
    else
    {
      sub_22F0();
    }
    if (IOMasterPort(0, (mach_port_t *)&dword_56DC)) {
      goto LABEL_32;
    }
    if (!dword_56DC) {
      goto LABEL_32;
    }
    qword_56E0 = (uint64_t)IONotificationPortCreate(dword_56DC);
    IONotificationPortSetDispatchQueue((IONotificationPortRef)qword_56E0, (dispatch_queue_t)qword_4690);
    CFDictionaryRef v10 = IOServiceMatching("IOEthernetInterface");
    if (!v10
      || IOServiceAddMatchingNotification((IONotificationPortRef)qword_56E0, "IOServiceMatched", v10, (IOServiceMatchingCallback)sub_2424, 0, (io_iterator_t *)&dword_56E8))
    {
      goto LABEL_32;
    }
    sub_2424(0, dword_56E8);
  }
  else
  {
    sub_ED8();
  }
}

BOOL sub_13D4()
{
  os_log_t v0 = (os_log_t)qword_4698;
  if (!qword_4698)
  {
    os_log_t v0 = os_log_create("com.apple.MobileInternetSharing", "USBEthernetSharing");
    qword_4698 = (uint64_t)v0;
    if (!v0)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_2E60(&v2);
        os_log_t v0 = v2;
      }
      else
      {
        os_log_t v0 = 0;
      }
    }
  }
  return v0 != 0;
}

void sub_1450(const __SCPreferences *a1, char a2)
{
  if ((a2 & 2) != 0)
  {
    sub_ED8();
    CFBooleanRef Value = (const __CFBoolean *)SCPreferencesGetValue(a1, @"USBEthernetLogging");
    if (Value)
    {
      CFTypeID TypeID = CFBooleanGetTypeID();
      if (CFGetTypeID(Value) == TypeID) {
        LODWORD(Value) = CFBooleanGetValue(Value);
      }
      else {
        LODWORD(Value) = 0;
      }
    }
    if (usbethVerboseLogging != Value)
    {
      usbethVerboseLogging = (char)Value;
      sub_13D4();
      sub_ED8();
    }
    SCPreferencesSynchronize(a1);
  }
}

void sub_1534(int a1, CFArrayRef theArray)
{
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    CFIndex v4 = Count;
    CFIndex v5 = 0;
    CFStringRef v6 = "key=%s";
    CFUUIDRef v7 = &CFArrayAppendValue_ptr;
    do
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, v5);
      sub_1870(ValueAtIndex);
      sub_ED8();
      if (CFEqual(ValueAtIndex, (CFTypeRef)qword_46A0))
      {
        byte_56C4 = 0;
        CFDictionaryRef v9 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)qword_4688, (CFStringRef)qword_46A0);
        if (v9)
        {
          CFDictionaryRef v10 = v9;
          CFTypeID v11 = CFGetTypeID(v9);
          if (v11 == CFDictionaryGetTypeID())
          {
            int v12 = v6;
            CFBooleanRef Value = CFDictionaryGetValue(v10, @"State");
            CFTypeRef v21 = CFDictionaryGetValue(v10, @"Reason");
            uint64_t valuePtr = 0;
            if (Value)
            {
              v14 = v7;
              CFTypeID v15 = CFGetTypeID(Value);
              BOOL v16 = v15 == CFNumberGetTypeID();
              CFUUIDRef v7 = v14;
              if (v16)
              {
                if (CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, (char *)&valuePtr + 4))
                {
                  if (dword_4680 == 1022 && HIDWORD(valuePtr) == 1023)
                  {
                    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
                    if (Mutable)
                    {
                      long long v18 = Mutable;
                      CFDictionaryAddValue(Mutable, @"IgnoreUntrustedList", kCFBooleanTrue);
                      sub_ED8();
                      int is_host_trusted = lockdown_is_host_trusted();
                      CFRelease(v18);
                      if (byte_56C5 != is_host_trusted)
                      {
                        byte_56C5 = is_host_trusted;
                        sub_ED8();
                      }
                      CFUUIDRef v7 = v14;
                    }
                    else
                    {
                      sub_ED8();
                    }
                  }
                  if (v21)
                  {
                    CFTypeID v20 = CFGetTypeID(v21);
                    if (v20 == CFNumberGetTypeID()
                      && CFNumberGetValue((CFNumberRef)v21, kCFNumberSInt32Type, &valuePtr)
                      && HIDWORD(valuePtr) == 1023
                      && ((valuePtr & 0xFFFFFFFD) == 0 || dword_4680 == 1022))
                    {
                      byte_56C4 = 1;
                    }
                  }
                  dword_4680 = HIDWORD(valuePtr);
                }
              }
            }
            CFStringRef v6 = v12;
          }
          CFRelease(v10);
        }
        sub_ED8();
        sub_19E8();
      }
      else if (CFEqual(ValueAtIndex, v7[213]))
      {
        sub_2090();
      }
      ++v5;
    }
    while (v4 != v5);
  }
}

const char *sub_1870(const __CFString *a1)
{
  if (!a1) {
    return "<NULL>";
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFStringGetTypeID())
  {
    CFTypeID v7 = CFGetTypeID(a1);
    if (v7 == CFDataGetTypeID())
    {
      CFStringRef v8 = CFStringCreateFromExternalRepresentation(kCFAllocatorDefault, (CFDataRef)a1, 0x8000100u);
      if (!v8) {
        goto LABEL_15;
      }
    }
    else
    {
      CFStringRef v8 = CFCopyDescription(a1);
      if (!v8) {
        goto LABEL_15;
      }
    }
    CFStringRef v9 = v8;
    if (CFStringGetCString(v8, &byte_46C0[1024 * (uint64_t)dword_56C0], 1024, 0x8000100u))
    {
      CStringPtr = &byte_46C0[1024 * (uint64_t)dword_56C0];
      if (dword_56C0 <= 2) {
        int v10 = dword_56C0 + 1;
      }
      else {
        int v10 = 0;
      }
      dword_56C0 = v10;
    }
    else
    {
      CStringPtr = 0;
    }
    CFRelease(v9);
    goto LABEL_24;
  }
  CFStringEncoding FastestEncoding = CFStringGetFastestEncoding(a1);
  if (!FastestEncoding || FastestEncoding == 134217984 || FastestEncoding == 1536)
  {
    CStringPtr = CFStringGetCStringPtr(a1, FastestEncoding);
    if (CStringPtr) {
      goto LABEL_24;
    }
  }
  if (CFStringGetCString(a1, &byte_46C0[1024 * (uint64_t)dword_56C0], 1024, 0x8000100u))
  {
    CStringPtr = &byte_46C0[1024 * (uint64_t)dword_56C0];
    if (dword_56C0 <= 2) {
      int v5 = dword_56C0 + 1;
    }
    else {
      int v5 = 0;
    }
    dword_56C0 = v5;
    goto LABEL_24;
  }
LABEL_15:
  CStringPtr = 0;
LABEL_24:
  if (CStringPtr) {
    return CStringPtr;
  }
  else {
    return "???";
  }
}

void sub_19E8()
{
  sub_1CDC();
  uint64_t v0 = qword_56C8;
  if (qword_56C8)
  {
    while (1)
    {
      sub_1870(*(const __CFString **)(v0 + 24));
      sub_ED8();
      if (!*(unsigned char *)(v0 + 32))
      {
LABEL_18:
        sub_1E94(v0);
        goto LABEL_19;
      }
      if ((byte_56C4 & 1) == 0) {
        break;
      }
      if (!byte_56C5) {
        goto LABEL_18;
      }
      if (*(unsigned char *)(v0 + 33)) {
        goto LABEL_10;
      }
LABEL_11:
      if (!*(unsigned char *)(v0 + 34))
      {
        *(void *)buffer = 0;
        uint64_t v6 = 0;
        sub_1870(*(const __CFString **)(v0 + 24));
        sub_ED8();
        if (!CFStringGetCString(*(CFStringRef *)(v0 + 24), buffer, 16, 0x8000100u)
          || (uint64_t v1 = _NETRBClientCreate(), (*(void *)(v0 + 40) = v1) == 0))
        {
          sub_ED8();
          return;
        }
        sub_ED8();
        if ((_NETRBClientIsAllowedMoreHost() & 1) == 0
          || (xpc_object_t v2 = xpc_dictionary_create(0, 0, 0)) == 0
          || (CFUUIDRef v3 = v2,
              xpc_dictionary_set_uint64(v2, netrbClientDeviceType, 5uLL),
              xpc_dictionary_set_string(v3, netrbClientInterfaceName, buffer),
              char started = _NETRBClientStartService(),
              xpc_release(v3),
              (started & 1) == 0))
        {
          sub_ED8();
          _NETRBClientDestroy();
          *(void *)(v0 + 40) = 0;
          return;
        }
        *(unsigned char *)(v0 + 34) = 1;
      }
LABEL_19:
      uint64_t v0 = *(void *)v0;
      if (!v0) {
        return;
      }
    }
    if (dword_4680 != 1023 || !*(unsigned char *)(v0 + 33) || !byte_56C5) {
      goto LABEL_18;
    }
LABEL_10:
    *(unsigned char *)(v0 + 33) = 0;
    goto LABEL_11;
  }
}

void sub_1CDC()
{
  int v0 = (dword_4680 == 1023) | byte_56D1 & 1;
  if (byte_56D0 != v0)
  {
    sub_ED8();
    if (v0) {
      IOUSBDeviceConfigurationAddInterface("AppleUSBEthernet");
    }
    else {
      IOUSBDeviceConfigurationRemoveInterface("AppleUSBEthernet");
    }
    sub_ED8();
    byte_56D0 = v0;
  }
}

uint64_t sub_1DAC(uint64_t a1, int a2, xpc_object_t object)
{
  if (a2 == 1001)
  {
    if (object)
    {
      uint64_t v4 = *(void *)(a1 + 32);
      if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(object, netrbClientNotificationKey);
        sub_1870(*(const __CFString **)(v4 + 24));
        if (uint64 == 5002)
        {
          sub_ED8();
          if ((_NETRBClientAddHost() & 1) == 0) {
            sub_ED8();
          }
          sub_1F48(v4);
        }
        else
        {
          sub_ED8();
          sub_1E94(v4);
        }
      }
    }
  }
  return 0;
}

uint64_t sub_1E94(uint64_t result)
{
  if (*(unsigned char *)(result + 34))
  {
    uint64_t v1 = result;
    sub_1870(*(const __CFString **)(result + 24));
    sub_ED8();
    *(unsigned char *)(v1 + 34) = 0;
    sub_1F48(v1);
    _NETRBClientStopService();
    sub_1870(*(const __CFString **)(v1 + 24));
    sub_ED8();
    _NETRBClientDestroy();
    *(void *)(v1 + 40) = 0;
    return sub_ED8();
  }
  return result;
}

uint64_t sub_1F48(uint64_t result)
{
  kern_return_t v6;
  int valuePtr;

  uint64_t v1 = result;
  char v2 = *(unsigned char *)(result + 32);
  if (v2) {
    char v2 = (*(unsigned char *)(result + 34) != 0) | byte_56D1;
  }
  int v3 = v2 & 1;
  if (*(unsigned __int8 *)(result + 35) != v3)
  {
    sub_1870(*(const __CFString **)(result + 24));
    sub_ED8();
    uint64_t valuePtr = v3;
    CFNumberRef v4 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
    if (v4
      && (CFNumberRef v5 = v4, v6 = IORegistryEntrySetCFProperty(*(_DWORD *)(v1 + 8), @"LinkStatus", v4), CFRelease(v5), !v6))
    {
      *(unsigned char *)(v1 + 35) = v3;
      sub_1870(*(const __CFString **)(v1 + 24));
    }
    else
    {
      sub_1870(*(const __CFString **)(v1 + 24));
    }
    return sub_ED8();
  }
  return result;
}

void sub_2090()
{
  uint64_t v0 = qword_56C8;
  if (!qword_56C8) {
    return;
  }
  do
  {
    *(unsigned char *)(v0 + 36) = 0;
    uint64_t v0 = *(void *)v0;
  }
  while (v0);
  int v1 = open("/Library/Preferences/SystemConfiguration/rtether.plist", 0);
  if (v1 == -1)
  {
    sub_ED8();
    byte_56D1 = 0;
LABEL_23:
    sub_1CDC();
    return;
  }
  int v2 = v1;
  sub_ED8();
  close(v2);
  byte_56D1 = 0;
  int v3 = usbeth_copy_active_services_entity(kSCEntNetInterface);
  if (v3)
  {
    CFArrayRef v4 = (const __CFArray *)v3;
    CFIndex Count = CFArrayGetCount((CFArrayRef)v3);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      for (CFIndex i = 0; i != v6; ++i)
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, i);
        if (ValueAtIndex)
        {
          CFDictionaryRef v9 = ValueAtIndex;
          CFTypeID v10 = CFGetTypeID(ValueAtIndex);
          if (v10 == CFDictionaryGetTypeID())
          {
            CFBooleanRef Value = CFDictionaryGetValue(v9, kSCPropNetInterfaceDeviceName);
            if (Value)
            {
              int v12 = Value;
              CFTypeID v13 = CFGetTypeID(Value);
              if (v13 == CFStringGetTypeID())
              {
                for (uint64_t j = qword_56C8; j; uint64_t j = *(void *)j)
                {
                  if (CFEqual(*(CFTypeRef *)(j + 24), v12))
                  {
                    sub_1870(*(const __CFString **)(j + 24));
                    sub_ED8();
                    *(unsigned char *)(j + 36) = 1;
                  }
                }
              }
            }
          }
        }
      }
    }
    CFRelease(v4);
    for (uint64_t k = qword_56C8; k; uint64_t k = *(void *)k)
    {
      if (*(unsigned char *)(k + 36)) {
        byte_56D1 = 1;
      }
      sub_1F48(k);
    }
    goto LABEL_23;
  }

  sub_ED8();
}

void sub_22BC(id a1, int a2)
{
  sub_ED8();

  sub_22F0();
}

void sub_22F0()
{
  if (byte_56C4 == 1)
  {
    sub_ED8();
    int is_host_trusted = lockdown_is_host_trusted();
  }
  else
  {
    int is_host_trusted = 0;
  }
  if (byte_56C5 != is_host_trusted)
  {
    byte_56C5 = is_host_trusted;
    sub_ED8();
    sub_19E8();
  }
}

void sub_23C4(id a1, int a2)
{
  sub_ED8();

  sub_22F0();
}

void sub_23F8(id a1, int a2)
{
  byte_56C5 = 0;
}

uint64_t sub_2424(int a1, io_iterator_t iterator)
{
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_object_t v4 = result;
    do
    {
      sub_ED8();
      io_registry_entry_t parent = 0;
      if (IORegistryEntryGetParentEntry(v4, "IOService", &parent))
      {
        IOObjectRelease(v4);
      }
      else
      {
        if (!IOObjectConformsTo(parent, "AppleUSBEthernetDevice"))
        {
          IOObjectRelease(v4);
          IOObjectRelease(parent);
          goto LABEL_6;
        }
        CFStringRef v5 = (const __CFString *)IORegistryEntrySearchCFProperty(v4, "IOService", @"BSD Name", kCFAllocatorDefault, 0);
        if (v5)
        {
          CFStringRef v6 = v5;
          CFTypeID v7 = &qword_56C8;
          while (1)
          {
            CFTypeID v7 = (uint64_t *)*v7;
            if (!v7) {
              break;
            }
            if (IOObjectIsEqualTo(parent, *((_DWORD *)v7 + 2)))
            {
              IOObjectRelease(v4);
              IOObjectRelease(parent);
              CFRelease(v6);
              goto LABEL_6;
            }
          }
          sub_1870(v6);
          sub_ED8();
          CFStringRef v8 = (io_object_t *)malloc_type_malloc(0x30uLL, 0x10600409D779101uLL);
          if (v8)
          {
            CFDictionaryRef v9 = v8;
            *(_OWORD *)(v8 + 7) = 0u;
            v8[11] = 0;
            *(_OWORD *)(v8 + 3) = 0u;
            io_service_t v10 = parent;
            v8[2] = parent;
            v8[4] = v4;
            *((void *)v8 + 3) = v6;
            *(void *)CFStringRef v8 = qword_56C8;
            qword_56C8 = (uint64_t)v8;
            if (IOServiceAddInterestNotification((IONotificationPortRef)qword_56E0, v10, "IOGeneralInterest", (IOServiceInterestCallback)sub_2744, v8, v8 + 3))
            {
              sub_ED8();
              sub_27C0((uint64_t *)v9);
            }
            else
            {
              int valuePtr = 0;
              CFNumberRef v11 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v9[2], "IOService", @"HostAttached", kCFAllocatorDefault, 0);
              if (v11)
              {
                CFNumberRef v12 = v11;
                CFTypeID v13 = CFGetTypeID(v11);
                if (v13 == CFNumberGetTypeID())
                {
                  if (CFNumberGetValue(v12, kCFNumberSInt32Type, &valuePtr)) {
                    *((unsigned char *)v9 + 32) = valuePtr != 0;
                  }
                }
              }
              sub_1870(*((const __CFString **)v9 + 3));
              sub_ED8();
              sub_19E8();
              sub_2090();
            }
            goto LABEL_6;
          }
          IOObjectRelease(v4);
          IOObjectRelease(parent);
          CFRelease(v6);
        }
        else
        {
          IOObjectRelease(v4);
          IOObjectRelease(parent);
        }
      }
      sub_ED8();
LABEL_6:
      uint64_t result = IOIteratorNext(iterator);
      io_object_t v4 = result;
    }
    while (result);
  }
  return result;
}

void sub_2744(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_2858;
  block[3] = &unk_44D8;
  int v5 = a3;
  block[4] = a1;
  block[5] = a4;
  dispatch_async((dispatch_queue_t)qword_4690, block);
}

void sub_27C0(uint64_t *a1)
{
  int v2 = &qword_56C8;
  while (1)
  {
    int v3 = v2;
    int v2 = (uint64_t *)*v2;
    if (!v2) {
      break;
    }
    if (v2 == a1)
    {
      *int v3 = *a1;
      *a1 = 0;
      break;
    }
  }
  io_object_t v4 = *((_DWORD *)a1 + 3);
  if (v4)
  {
    IOObjectRelease(v4);
    *((_DWORD *)a1 + 3) = 0;
  }
  io_object_t v5 = *((_DWORD *)a1 + 2);
  if (v5)
  {
    IOObjectRelease(v5);
    *((_DWORD *)a1 + 2) = 0;
  }
  io_object_t v6 = *((_DWORD *)a1 + 4);
  if (v6)
  {
    IOObjectRelease(v6);
    *((_DWORD *)a1 + 4) = 0;
  }
  CFTypeID v7 = (const void *)a1[3];
  if (v7) {
    CFRelease(v7);
  }

  free(a1);
}

void sub_2858(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  sub_ED8();
  int v3 = *(_DWORD *)(a1 + 48);
  if (v3 == -536870896)
  {
    sub_1870(*(const __CFString **)(v2 + 24));
    sub_ED8();
    *(unsigned char *)(v2 + 32) = 0;
    sub_19E8();
    sub_27C0((uint64_t *)v2);
  }
  else
  {
    if (v3 != -469794303) {
      return;
    }
    *(unsigned char *)(v2 + 32) = *(void *)(a1 + 40) != 0;
    sub_ED8();
    *(unsigned char *)(v2 + 33) = 1;
    sub_19E8();
  }

  sub_2090();
}

const char *IOUSBDeviceConfigurationAddInterface(const char *result)
{
  int v1 = result;
  LODWORD(result) = dword_56EC;
  if (dword_56EC)
  {
    int v3 = -1431655766;
  }
  else
  {
    bootstrap_look_up(bootstrap_port, "com.apple.SystemConfiguration.USBDeviceConfig", (mach_port_t *)&dword_56EC);
    uint64_t result = (const char *)dword_56EC;
    int v3 = -1431655766;
    if (!dword_56EC) {
      return result;
    }
  }
  if (usb_device_configuration_add_interface((mach_port_t)result, v1, &v3)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = v3 == 0;
  }
  return (const char *)!v2;
}

const char *IOUSBDeviceConfigurationRemoveInterface(const char *result)
{
  int v1 = result;
  LODWORD(result) = dword_56EC;
  if (dword_56EC)
  {
    int v3 = -1431655766;
  }
  else
  {
    bootstrap_look_up(bootstrap_port, "com.apple.SystemConfiguration.USBDeviceConfig", (mach_port_t *)&dword_56EC);
    uint64_t result = (const char *)dword_56EC;
    int v3 = -1431655766;
    if (!dword_56EC) {
      return result;
    }
  }
  if (usb_device_configuration_remove_interface((mach_port_t)result, v1, &v3)) {
    BOOL v2 = 1;
  }
  else {
    BOOL v2 = v3 == 0;
  }
  return (const char *)!v2;
}

uint64_t usb_device_configuration_add_interface(mach_port_t a1, const char *a2, _DWORD *a3)
{
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v15[14] = v5;
  v15[15] = v5;
  v15[12] = v5;
  v15[13] = v5;
  v15[10] = v5;
  v15[11] = v5;
  v15[8] = v5;
  v15[9] = v5;
  v15[6] = v5;
  v15[7] = v5;
  v15[4] = v5;
  v15[5] = v5;
  v15[2] = v5;
  v15[3] = v5;
  v15[0] = v5;
  v15[1] = v5;
  *(_OWORD *)&rcv_name.msgh_bits = v5;
  *(void *)&rcv_name.msgh_voucher_port = 0xAAAAAAAAAAAAAAAALL;
  NDR_record_t v14 = NDR_record;
  if (&_mig_strncpy_zerofill) {
    int v6 = mig_strncpy_zerofill((char *)v15 + 8, a2, 256);
  }
  else {
    int v6 = mig_strncpy((char *)v15 + 8, a2, 256);
  }
  LODWORD(v15[0]) = 0;
  DWORD1(v15[0]) = v6;
  mach_msg_size_t v7 = ((v6 + 3) & 0xFFFFFFFC) + 40;
  mach_port_t reply_port = mig_get_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = reply_port;
  rcv_name.msgh_bits = 5395;
  *(void *)&rcv_name.msgh_voucher_port = 0x756200000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&rcv_name, 3, v7, 0x30u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
      return v10;
    }
    if (rcv_name.msgh_id == 71)
    {
      uint64_t v10 = 4294966988;
    }
    else if (rcv_name.msgh_id == 30150)
    {
      if ((rcv_name.msgh_bits & 0x80000000) == 0)
      {
        if (rcv_name.msgh_size == 40)
        {
          if (!rcv_name.msgh_remote_port)
          {
            uint64_t v10 = LODWORD(v15[0]);
            if (!LODWORD(v15[0]))
            {
              *a3 = DWORD1(v15[0]);
              return v10;
            }
            goto LABEL_26;
          }
        }
        else if (rcv_name.msgh_size == 36)
        {
          if (rcv_name.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = LODWORD(v15[0]) == 0;
          }
          if (v11) {
            uint64_t v10 = 4294966996;
          }
          else {
            uint64_t v10 = LODWORD(v15[0]);
          }
          goto LABEL_26;
        }
      }
      uint64_t v10 = 4294966996;
    }
    else
    {
      uint64_t v10 = 4294966995;
    }
LABEL_26:
    mach_msg_destroy(&rcv_name);
    return v10;
  }
  mig_put_reply_port(rcv_name.msgh_local_port);
  return v10;
}

uint64_t usb_device_configuration_remove_interface(mach_port_t a1, const char *a2, _DWORD *a3)
{
  unint64_t v16 = 0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v15[14] = v5;
  v15[15] = v5;
  v15[12] = v5;
  v15[13] = v5;
  v15[10] = v5;
  v15[11] = v5;
  v15[8] = v5;
  v15[9] = v5;
  v15[6] = v5;
  v15[7] = v5;
  v15[4] = v5;
  v15[5] = v5;
  v15[2] = v5;
  v15[3] = v5;
  v15[0] = v5;
  v15[1] = v5;
  *(_OWORD *)&rcv_name.msgh_bits = v5;
  *(void *)&rcv_name.msgh_voucher_port = 0xAAAAAAAAAAAAAAAALL;
  NDR_record_t v14 = NDR_record;
  if (&_mig_strncpy_zerofill) {
    int v6 = mig_strncpy_zerofill((char *)v15 + 8, a2, 256);
  }
  else {
    int v6 = mig_strncpy((char *)v15 + 8, a2, 256);
  }
  LODWORD(v15[0]) = 0;
  DWORD1(v15[0]) = v6;
  mach_msg_size_t v7 = ((v6 + 3) & 0xFFFFFFFC) + 40;
  mach_port_t reply_port = mig_get_reply_port();
  rcv_name.msgh_remote_port = a1;
  rcv_name.msgh_local_port = reply_port;
  rcv_name.msgh_bits = 5395;
  *(void *)&rcv_name.msgh_voucher_port = 0x756300000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&rcv_name);
    mach_port_t reply_port = rcv_name.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&rcv_name, 3, v7, 0x30u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
      return v10;
    }
    if (rcv_name.msgh_id == 71)
    {
      uint64_t v10 = 4294966988;
    }
    else if (rcv_name.msgh_id == 30151)
    {
      if ((rcv_name.msgh_bits & 0x80000000) == 0)
      {
        if (rcv_name.msgh_size == 40)
        {
          if (!rcv_name.msgh_remote_port)
          {
            uint64_t v10 = LODWORD(v15[0]);
            if (!LODWORD(v15[0]))
            {
              *a3 = DWORD1(v15[0]);
              return v10;
            }
            goto LABEL_26;
          }
        }
        else if (rcv_name.msgh_size == 36)
        {
          if (rcv_name.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = LODWORD(v15[0]) == 0;
          }
          if (v11) {
            uint64_t v10 = 4294966996;
          }
          else {
            uint64_t v10 = LODWORD(v15[0]);
          }
          goto LABEL_26;
        }
      }
      uint64_t v10 = 4294966996;
    }
    else
    {
      uint64_t v10 = 4294966995;
    }
LABEL_26:
    mach_msg_destroy(&rcv_name);
    return v10;
  }
  mig_put_reply_port(rcv_name.msgh_local_port);
  return v10;
}

void sub_2E60(void *a1)
{
  *(_WORD *)BOOL v2 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "USBEthernetSharing: Couldn't create os log object", v2, 2u);
  *a1 = qword_4698;
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

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
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

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return _CFCopyDescription(cf);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
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

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return _CFStringCreateFromExternalRepresentation(alloc, data, encoding);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return _CFStringGetFastestEncoding(theString);
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

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMasterPort(bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return _IOObjectIsEqualTo(object, anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreCopyMultiple(store, keys, patterns);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkGlobalEntity(allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkServiceEntity(allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return _SCDynamicStoreSetDispatchQueue(store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
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

uint64_t _NETRBClientAddHost()
{
  return __NETRBClientAddHost();
}

uint64_t _NETRBClientCreate()
{
  return __NETRBClientCreate();
}

uint64_t _NETRBClientDestroy()
{
  return __NETRBClientDestroy();
}

uint64_t _NETRBClientGetDynamicStoreKey()
{
  return __NETRBClientGetDynamicStoreKey();
}

uint64_t _NETRBClientIsAllowedMoreHost()
{
  return __NETRBClientIsAllowedMoreHost();
}

uint64_t _NETRBClientStartService()
{
  return __NETRBClientStartService();
}

uint64_t _NETRBClientStopService()
{
  return __NETRBClientStopService();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_look_up(bp, service_name, sp);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void free(void *a1)
{
}

const char *getprogname(void)
{
  return _getprogname();
}

uint64_t lockdown_is_host_trusted()
{
  return _lockdown_is_host_trusted();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return _mig_get_reply_port();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return _mig_strncpy(dest, src, len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return _mig_strncpy_zerofill(dest, src, len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_log_with_args()
{
  return _os_log_with_args();
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}