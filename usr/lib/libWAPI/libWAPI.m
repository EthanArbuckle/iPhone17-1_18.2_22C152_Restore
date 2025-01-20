uint64_t isChinaRegion()
{
  mach_port_t v0;
  CFDictionaryRef v1;
  io_service_t MatchingService;
  CFAllocatorRef v3;
  CFDataRef CFProperty;
  CFDataRef v5;
  const char *BytePtr;
  CFStringRef v7;
  CFStringRef v8;
  CFArrayRef ArrayBySeparatingStrings;
  CFArrayRef v10;
  const void *ValueAtIndex;
  uint64_t v12;

  v0 = *MEMORY[0x263F0EC90];
  v1 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService
    && (v3 = (const __CFAllocator *)*MEMORY[0x263EFFB08],
        (CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(MatchingService, @"region-info", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0)) != 0))
  {
    v5 = CFProperty;
    BytePtr = (const char *)CFDataGetBytePtr(CFProperty);
    if (BytePtr && (v7 = CFStringCreateWithCString(v3, BytePtr, 0x8000100u)) != 0)
    {
      v8 = v7;
      ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(v3, v7, @"/");
      if (ArrayBySeparatingStrings)
      {
        v10 = ArrayBySeparatingStrings;
        if (CFArrayGetCount(ArrayBySeparatingStrings) < 2)
        {
          v12 = 0;
        }
        else
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v10, 0);
          v12 = CFEqual(ValueAtIndex, @"CH");
        }
        CFRelease(v10);
      }
      else
      {
        v12 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    v12 = 0;
  }
  printf("isChinaRegion() = %d\n", v12);
  return v12;
}

BOOL WAPIEnabled()
{
  v0 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], @"com.apple.wapilib", @"com.apple.wifi.plist");
  if (v0)
  {
    v1 = v0;
    CFNumberRef Value = (const __CFNumber *)SCPreferencesGetValue(v0, @"WAPIEnabled");
    int valuePtr = 0;
    if (Value)
    {
      CFNumberRef v3 = Value;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v3))
      {
        CFNumberGetValue(v3, kCFNumberIntType, &valuePtr);
        LODWORD(Value) = valuePtr;
      }
      else
      {
        CFTypeID v6 = CFBooleanGetTypeID();
        if (v6 == CFGetTypeID(v3))
        {
          LODWORD(Value) = CFEqual(v3, (CFTypeRef)*MEMORY[0x263EFFB40]);
        }
        else
        {
          CFTypeID v7 = CFStringGetTypeID();
          if (v7 != CFGetTypeID(v3))
          {
            LODWORD(Value) = 0;
            goto LABEL_12;
          }
          LODWORD(Value) = CFStringGetIntValue((CFStringRef)v3);
        }
        int valuePtr = (int)Value;
      }
    }
LABEL_12:
    BOOL v5 = Value != 0;
    CFRelease(v1);
    goto LABEL_13;
  }
  BOOL v5 = 0;
LABEL_13:
  printf("WAPIEnabled() = %d\n", v5);
  return v5;
}

uint64_t WAPIStart(char *a1, uint64_t a2)
{
  uint64_t v2 = 5;
  if (a1 && a2)
  {
    if (isChinaRegion() || WAPIEnabled())
    {
      mach_port_t special_port = 0;
      asl_log(0, 0, 5, "WAPIStart() = %s\n\n", a1);
      if (WAPIStatus((long long *)a1) != -1) {
        WAPIStop((long long *)a1);
      }
      mach_port_t sp = 0;
      uint64_t v2 = task_get_special_port(*MEMORY[0x263EF8960], 4, &special_port);
      if (!v2)
      {
        uint64_t v5 = bootstrap_look_up(special_port, "com.apple.wapi.client", &sp);
        uint64_t v2 = v5;
        if (v5) {
          asl_log(0, 0, 5, "error: bootstrap_look_up (%d)\n", v5);
        }
        if (sp)
        {
          if (_SCSerialize())
          {
            uint64_t v6 = _WCwapic_start(sp, (long long *)a1, 0, 0, 0x1B58u);
            uint64_t v2 = v6;
            if (v6) {
              asl_log(0, 0, 5, "wapic MIG failed (%d, port = %d)\n", v6, sp);
            }
          }
        }
      }
    }
    else
    {
      uint64_t v2 = 5;
    }
  }
  sStatus = v2;
  return v2;
}

uint64_t WAPIStatus(long long *a1)
{
  kern_return_t v2;
  unsigned int v4;
  mach_port_t sp;
  mach_port_t special_port;

  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  mach_port_t sp = 0;
  if (sStatus != -308)
  {
    mach_port_t special_port = 0;
    if (!task_get_special_port(*MEMORY[0x263EF8960], 4, &special_port))
    {
      uint64_t v2 = bootstrap_look_up(special_port, "com.apple.wapi.client", &sp);
      asl_log(0, 0, 5, "%s: bootstrap_look_up = %d\n\n", "WAPIStatus", v2);
      if (!v2)
      {
        v4 = 0;
        if (_WCwapic_status(sp, a1, &v4, 0x64u) != -308) {
          return v4;
        }
        asl_log(0, 0, 5, "error: bootstrap_look_up WAPI inactive(%d)\n", -308);
      }
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t WAPIStop(long long *a1)
{
  if (a1)
  {
    mach_port_t special_port = 0;
    mach_port_t sp = 0;
    uint64_t v2 = task_get_special_port(*MEMORY[0x263EF8960], 4, &special_port);
    if (!v2)
    {
      uint64_t v4 = bootstrap_look_up(special_port, "com.apple.wapi.client", &sp);
      uint64_t v2 = v4;
      if (v4) {
        asl_log(0, 0, 5, "error: bootstrap_look_up (%d)\n", v4);
      }
      if (sp)
      {
        uint64_t v5 = _WCwapic_stop(sp, a1, 0x64u);
        uint64_t v2 = v5;
        if (v5) {
          asl_log(0, 0, 5, "wapic MIG failed (%d, port = %d)\n", v5, sp);
        }
      }
    }
  }
  else
  {
    uint64_t v2 = 5;
  }
  sStatus = -308;
  return v2;
}

uint64_t _WCwapic_start(mach_port_t a1, long long *a2, vm_address_t a3, int a4, mach_msg_timeout_t a5)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  long long v8 = a2[1];
  long long v18 = *a2;
  int v14 = 1;
  vm_address_t v15 = a3;
  int v16 = 16777473;
  v17[0] = a4;
  *(void *)&v17[1] = *MEMORY[0x263EF80C8];
  long long v19 = v8;
  int v20 = a4;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&v13.msgh_bits = 2147489043;
  v13.msgh_remote_port = a1;
  v13.msgh_local_port = reply_port;
  *(void *)&v13.msgh_voucher_port = 0x36C158900000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&v13);
    mach_port_t reply_port = v13.msgh_local_port;
  }
  uint64_t v10 = mach_msg(&v13, 275, 0x58u, 0x2Cu, reply_port, a5, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v13.msgh_local_port);
  }
  else
  {
    if (!v10)
    {
      if (v13.msgh_id == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (v13.msgh_id == 57415149)
      {
        uint64_t v11 = 4294966996;
        if ((v13.msgh_bits & 0x80000000) == 0 && *(void *)&v13.msgh_size == 36)
        {
          uint64_t v11 = HIDWORD(v15);
          if (!HIDWORD(v15)) {
            return v11;
          }
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
      mach_msg_destroy(&v13);
      return v11;
    }
    mig_dealloc_reply_port(v13.msgh_local_port);
  }
  if (v11 == 268435460)
  {
    if (v15 != a3) {
      mig_deallocate(v15, v17[0]);
    }
    return 268435460;
  }
  return v11;
}

uint64_t _WCwapic_stop(mach_port_t a1, long long *a2, mach_msg_timeout_t timeout)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v7 = *MEMORY[0x263EF80C8];
  long long v4 = a2[1];
  long long v8 = *a2;
  long long v9 = v4;
  *(void *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 57415050;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x263EF8B00]) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 17, 0x40u, 0, 0, timeout, 0);
}

uint64_t _WCwapic_status(mach_port_t a1, long long *a2, _DWORD *a3, mach_msg_timeout_t a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v14 = *MEMORY[0x263EF80C8];
  long long v7 = a2[1];
  long long v15 = *a2;
  long long v16 = v7;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&msg.msgh_bits = 5395;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(void *)&msg.msgh_voucher_port = 0x36C158B00000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v9 = mach_msg(&msg, 275, 0x40u, 0x30u, reply_port, a4, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (v9)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v10;
    }
    if (msg.msgh_id == 71)
    {
      uint64_t v10 = 4294966988;
    }
    else if (msg.msgh_id == 57415151)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v10 = v15;
            if (!v15)
            {
              *a3 = DWORD1(v15);
              return v10;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v11 = 1;
          }
          else {
            BOOL v11 = v15 == 0;
          }
          if (v11) {
            uint64_t v10 = 4294966996;
          }
          else {
            uint64_t v10 = v15;
          }
          goto LABEL_23;
        }
      }
      uint64_t v10 = 4294966996;
    }
    else
    {
      uint64_t v10 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v10;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v10;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x270EE4C58]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x270EE4C70](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x270EE5088](alloc, theString, separatorString);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x270EE51C8](str);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x270F056F8](allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x270F05710](prefs, key);
}

uint64_t _SCSerialize()
{
  return MEMORY[0x270F057A8]();
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x270ED8648](client, msg, *(void *)&level, format);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8770](*(void *)&bp, service_name, sp);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x270EDA4E8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int printf(const char *a1, ...)
{
  return MEMORY[0x270EDAD20](a1);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x270EDB850](*(void *)&task, *(void *)&which_port, special_port);
}