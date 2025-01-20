void sub_100003858(uint64_t a1, __CFDictionary *a2)
{
  __CFDictionary *Mutable;
  __CFString *v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  __CFDictionary *v7;
  CFDictionaryRef v8;
  io_service_t MatchingService;
  CFStringRef v10;
  CFStringRef v11;
  __CFDictionary *v12;
  __CFArray *v13;
  __CFArray *v14;
  __CFDictionary *v15;
  CFDictionaryRef v16;
  CFIndex Count;
  CFIndex v18;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v21;
  const void *Value;
  const void *v23;
  const void *v24;
  const void *v25;
  uint64_t v26;
  CFDictionaryRef theDict;
  CFMutableDictionaryRef properties;
  uint64_t vars8;

  properties = 0;
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v4 = (__CFString *)Mutable;
    CFDictionarySetValue(Mutable, @"Status", @"Failure");
    v5 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v6 = v5;
    if (!v5)
    {
      sub_100003CE8((uint64_t)"gather_gas_gauge_info", @"Could not create service matching properties");
      LODWORD(v8) = 0;
LABEL_15:
      if (properties) {
        CFRelease(properties);
      }
      if (v8) {
        IOObjectRelease((io_object_t)v8);
      }
      if (v6) {
        CFRelease(v6);
      }
      CFRelease(v4);
      return;
    }
    CFDictionarySetValue(v5, @"built-in", kCFBooleanTrue);
    v7 = IOServiceMatching("IOPMPowerSource");
    v8 = v7;
    if (v7)
    {
      CFDictionarySetValue(v7, @"IOPropertyMatch", v6);
      MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v8);
      LODWORD(v8) = MatchingService;
      if (MatchingService)
      {
        if (!IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0))
        {
          theDict = properties;
          v13 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
          if (v13)
          {
            v14 = v13;
            CFArrayAppendValue(v13, @"CycleCount");
            CFArrayAppendValue(v14, @"DesignCapacity");
            CFArrayAppendValue(v14, @"MaxCapacity");
            v15 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            if (v15)
            {
              v16 = v15;
              CFDictionarySetValue(v15, @"MaxCapacity", @"FullChargeCapacity");
              Count = CFArrayGetCount(v14);
              if (Count >= 1)
              {
                v18 = Count;
                for (i = 0; i != v18; ++i)
                {
                  ValueAtIndex = CFArrayGetValueAtIndex(v14, i);
                  if (ValueAtIndex)
                  {
                    v21 = ValueAtIndex;
                    Value = CFDictionaryGetValue(theDict, ValueAtIndex);
                    if (Value)
                    {
                      v23 = Value;
                      v24 = CFDictionaryGetValue(v16, v21);
                      if (v24) {
                        v25 = v24;
                      }
                      else {
                        v25 = v21;
                      }
                      CFDictionarySetValue((CFMutableDictionaryRef)v4, v25, v23);
                    }
                    else
                    {
                      sub_100003CE8((uint64_t)"filter_properties", @"Could not lookup value for %@", v21, v26);
                    }
                  }
                  else
                  {
                    sub_100003CE8((uint64_t)"filter_properties", @"Could not extract key %d of %d", i, v18);
                  }
                }
              }
              CFRelease(v16);
            }
            else
            {
              sub_100003CE8((uint64_t)"filter_properties", @"Could not create empty dictionary for key map");
            }
            CFRelease(v14);
          }
          else
          {
            sub_100003CE8((uint64_t)"filter_properties", @"Could not create empty array for desired keys");
          }
          CFDictionarySetValue((CFMutableDictionaryRef)v4, @"Status", @"Success");
          v10 = @"GasGauge";
          v12 = a2;
          v11 = v4;
          goto LABEL_14;
        }
        sub_100003CE8((uint64_t)"gather_gas_gauge_info", @"Could not create properties\n");
        v10 = @"Status";
        v11 = @"CreatePropertiesFailed";
      }
      else
      {
        sub_100003CE8((uint64_t)"gather_gas_gauge_info", @"Could not find the %s service", "IOPMPowerSource");
        v10 = @"Status";
        v11 = @"ServiceLookupFailed";
      }
    }
    else
    {
      sub_100003CE8((uint64_t)"gather_gas_gauge_info", @"Could not create matching dictionary");
      v10 = @"Status";
      v11 = @"ServiceMatchingFailed";
    }
    v12 = (__CFDictionary *)v4;
LABEL_14:
    CFDictionarySetValue(v12, v10, v11);
    goto LABEL_15;
  }

  sub_100003CE8((uint64_t)"gather_gas_gauge_info", @"Could not create empty dictionary");
}

void sub_100003C24(uint64_t a1, __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v4 = Mutable;
    sub_100003CE8((uint64_t)"gather_nand_info", @"Could not gather the NAND information as this function has been deprecated");
    CFDictionarySetValue(v4, @"Status", @"NANDInfoDeprecated");
    CFDictionarySetValue(a2, @"NAND", v4);
    CFRelease(v4);
  }
  else
  {
    sub_100003CE8((uint64_t)"gather_nand_info", @"Could not create dictionary to contain NAND information");
  }
}

void sub_100003CE8(uint64_t a1, CFStringRef format, ...)
{
  va_start(va, format);
  CFStringRef v3 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, format, va);
  if (v3)
  {
    CFStringRef v4 = v3;
    CFStringGetCString(v3, buffer, 1024, 0x8000100u);
    CFRelease(v4);
  }
  if (a1) {
    syslog(3, "%s: %s");
  }
  else {
    syslog(3, "%s");
  }
}

char *sub_100003DBC(const __CFString *a1)
{
  if (!a1) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v3 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  CFStringRef v4 = (char *)malloc_type_malloc(v3, 0xABC16384uLL);
  CFStringGetCString(a1, v4, v3, 0x8000100u);
  return v4;
}

void sub_100003E34(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

uint64_t start()
{
  return 0;
}

uint64_t sub_100004720(const __CFDictionary *a1)
{
  syslog(7, "entering cfUserNotificationThread");
  if (a1)
  {
    Value = CFDictionaryGetValue(a1, @"Request");
    if (Value
      && (int v3 = CFEqual(Value, @"Shutdown"),
          SInt32 error = 0,
          CFStringRef v4 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &error, a1),
          syslog(7, "creating notification returned %d", error),
          v4)
      && (v3 ? (v5 = sub_100004880) : (v5 = sub_1000048B4),
          RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v4, (CFUserNotificationCallBack)v5, 0), CFRelease(v4), RunLoopSource))
    {
      syslog(7, "about to put up CFUserNotification now");
      Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopCommonModes);
      CFRelease(RunLoopSource);
      CFRelease(a1);
      syslog(7, "running runloop");
      CFRunLoopRun();
      syslog(7, "exiting cfUserNotificationThread");
    }
    else
    {
      CFRelease(a1);
    }
  }
  return 0;
}

uint64_t sub_100004880()
{
  syslog(7, "CFUserNotificationCallback for SHUTDOWN was called");

  return sub_100004CD4();
}

uint64_t sub_1000048B4()
{
  syslog(7, "CFUserNotificationCallback for REBOOT was called");

  return sub_100004990();
}

uint64_t sub_1000048E8()
{
  mach_port_t mainPort = 0;
  uint64_t v0 = IOMasterPort(bootstrap_port, &mainPort);
  if (!v0)
  {
    io_connect_t v2 = IOPMFindPowerManagement(mainPort);
    if (v2)
    {
      uint64_t v0 = IOPMSleepSystem(v2);
      if (v0) {
        fprintf(__stderrp, "sleep failed (0x%08x)\n", v0);
      }
    }
    else
    {
      uint64_t v0 = 3758097136;
      fprintf(__stderrp, "sleep failed - cannot find power management (0x%08x)\n", -536870160);
    }
  }
  return v0;
}

uint64_t sub_100004990()
{
  if (!access("/sbin/reboot", 0))
  {
    v2[0] = "/sbin/reboot";
    v2[1] = 0;
    int v0 = sub_100004A40(v2);
    if (!v0) {
      return 0;
    }
LABEL_5:
    fprintf(__stderrp, "unable to restart, error code: %d - exiting\n", v0);
    exit(1);
  }
  int v0 = reboot3();
  if (v0) {
    goto LABEL_5;
  }
  return 0;
}

uint64_t sub_100004A40(const char **a1)
{
  fprintf(__stderrp, "executing %s\n", *a1);
  if (pipe((int *)v25) != -1)
  {
    pid_t v2 = fork();
    if (v2 == -1)
    {
      v12 = __stderrp;
      v13 = *a1;
      v14 = __error();
      v15 = strerror(*v14);
      fprintf(v12, "fork %s failed: %s\n", v13, v15);
      close(*(int *)v25);
LABEL_11:
      close(*(int *)&v25[4]);
      return 0xFFFFFFFFLL;
    }
    pid_t v3 = v2;
    if (!v2)
    {
      if (dup2(*(int *)&v25[4], 1) == -1) {
        goto LABEL_8;
      }
      if (dup2(*(int *)&v25[4], 2) == -1) {
        _exit(2);
      }
      close(*(int *)v25);
      if (execv(*a1, (char *const *)a1) == -1)
      {
        CFStringRef v4 = __stderrp;
        v5 = *a1;
        v6 = __error();
        v7 = strerror(*v6);
        fprintf(v4, "execv: %s: %s", v5, v7);
LABEL_8:
        _exit(1);
      }
      goto LABEL_11;
    }
    int v18 = *(_DWORD *)v25;
    close(*(int *)&v25[4]);
    if (v18 == -1) {
      return 0xFFFFFFFFLL;
    }
    ssize_t v19 = read(v18, v25, 0x3FFuLL);
    if (v19 >= 1)
    {
      do
      {
        v25[v19] = 0;
        fputs(v25, __stderrp);
        ssize_t v19 = read(v18, v25, 0x3FFuLL);
      }
      while (v19 > 0);
    }
    int v24 = 0;
    if (waitpid(v3, &v24, 0) != -1)
    {
      if ((v24 & 0x7F) == 0x7F)
      {
        fprintf(__stderrp, "%s was stopped by signal %d\n");
      }
      else
      {
        if ((v24 & 0x7F) == 0)
        {
          uint64_t v16 = BYTE1(v24);
LABEL_25:
          close(v18);
          return v16;
        }
        fprintf(__stderrp, "%s was terminated by signal %d\n");
      }
      uint64_t v16 = 0xFFFFFFFFLL;
      goto LABEL_25;
    }
    uint64_t v16 = *__error();
    v20 = __stderrp;
    v21 = *a1;
    v22 = __error();
    v23 = strerror(*v22);
    fprintf(v20, "waitpid failed for %s: %s\n", v21, v23);
    goto LABEL_25;
  }
  v8 = __stderrp;
  v9 = *a1;
  v10 = __error();
  v11 = strerror(*v10);
  fprintf(v8, "pipe failed while preparing to execute %s: %s\n", v9, v11);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100004CD4()
{
  if (!access("/sbin/halt", 0))
  {
    long long v2 = off_1000083B0;
    int v0 = sub_100004A40((const char **)&v2);
    if (!v0) {
      return 0;
    }
LABEL_5:
    fprintf(__stderrp, "unable to shutdown, return code:%d - exiting\n", v0);
    exit(1);
  }
  int v0 = reboot3();
  if (v0) {
    goto LABEL_5;
  }
  return 0;
}

void sub_100004D84(const __CFDictionary *a1, __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return;
  }
  v5 = Mutable;
  CFDictionarySetValue(Mutable, @"Status", @"Success");
  if (a2)
  {
    if (a1)
    {
      Value = CFDictionaryGetValue(a1, @"MobileGestaltKeys");
      if (!Value)
      {
        sub_100003CE8((uint64_t)"gather_mobile_gestalt_info", @"Did not find any keys to lookup");
        goto LABEL_16;
      }
      v7 = Value;
      CFTypeID TypeID = CFArrayGetTypeID();
      if (TypeID != CFGetTypeID(v7))
      {
        sub_100003CE8((uint64_t)"gather_mobile_gestalt_info", @"Keys passed in are not an array");
        goto LABEL_16;
      }
      CFIndex Count = CFArrayGetCount((CFArrayRef)v7);
      if (Count >= 1)
      {
        CFIndex v10 = Count;
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v7, 0);
        CFTypeID v12 = CFStringGetTypeID();
        if (v12 != CFGetTypeID(ValueAtIndex))
        {
LABEL_12:
          sub_100003CE8((uint64_t)"gather_mobile_gestalt_info", @"Keys passed in are not all strings");
          goto LABEL_16;
        }
        CFIndex v13 = 1;
        while (v10 != v13)
        {
          v14 = CFArrayGetValueAtIndex((CFArrayRef)v7, v13);
          CFTypeID v15 = CFStringGetTypeID();
          ++v13;
          if (v15 != CFGetTypeID(v14))
          {
            if (v13 - 1 >= v10) {
              break;
            }
            goto LABEL_12;
          }
        }
      }
      uint64_t v17 = MGCopyAnswer();
      if (!v17
        || (int v18 = (const void *)v17, v19 = CFBooleanGetTypeID(), v19 != CFGetTypeID(v18))
        || !CFBooleanGetValue((CFBooleanRef)v18))
      {
        sub_100003CE8((uint64_t)"gather_mobile_gestalt_info", @"MobileGestalt query function has been deprecated");
        CFStringRef v16 = @"MobileGestaltDeprecated";
        goto LABEL_17;
      }
      CFRelease(v18);
      CFDictionaryRef v20 = (const __CFDictionary *)MGCopyMultipleAnswers();
      if (v20)
      {
        CFDictionaryRef v21 = v20;
        CFDictionaryApplyFunction(v20, (CFDictionaryApplierFunction)sub_100004FFC, v5);
        CFRelease(v21);
        goto LABEL_18;
      }
      sub_100003CE8((uint64_t)"gather_mobile_gestalt_info", @"MobileGestalt didn't return anything");
    }
LABEL_16:
    CFStringRef v16 = @"MobileGestaltFailed";
LABEL_17:
    CFDictionarySetValue(v5, @"Status", v16);
  }
LABEL_18:
  CFDictionarySetValue(a2, @"MobileGestalt", v5);

  CFRelease(v5);
}

void sub_100004FFC(void *key, void *value, CFMutableDictionaryRef theDict)
{
}

void sub_100005010(const __CFDictionary *a1, __CFDictionary *a2)
{
  mach_port_t mainPort = 0;
  if (a1)
  {
    if (!a2)
    {
      sub_100003CE8((uint64_t)"gather_ioreg_info", @"%s, Bad parameter.", "gather_ioreg_info");
      return;
    }
    if (IOMasterPort(bootstrap_port, &mainPort)) {
      sub_100003CE8((uint64_t)"gather_ioreg_info", @"can't obtain I/O Kit's master port");
    }
    io_registry_entry_t RootEntry = IORegistryGetRootEntry(mainPort);
    if (RootEntry)
    {
      io_registry_entry_t v5 = RootEntry;
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, @"CurrentPlane");
      CFStringRef v7 = (const __CFString *)CFDictionaryGetValue(a1, @"EntryName");
      CFStringRef v8 = (const __CFString *)CFDictionaryGetValue(a1, @"EntryClass");
      if (Value)
      {
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        *(_OWORD *)buffer = 0u;
        long long v14 = 0u;
        if (!CFStringGetCString(Value, buffer, 128, 0x8000100u))
        {
          sub_100003CE8((uint64_t)"gather_ioreg_info", @"Can't convert plane name to io_name_t");
          goto LABEL_23;
        }
        sub_100003CE8((uint64_t)"gather_ioreg_info", @"IOReg query plane %s", buffer);
        v9 = sub_100005258(v5, buffer);
      }
      else
      {
        if (v7)
        {
          CFStringRef v8 = v7;
          int v10 = 0;
        }
        else
        {
          if (!v8) {
            goto LABEL_23;
          }
          int v10 = 1;
        }
        v9 = sub_100005790(v8, v10);
      }
      v11 = v9;
      if (v9)
      {
        CFDictionarySetValue(a2, @"IORegistry", v9);
        CFRelease(v11);
LABEL_24:
        IOObjectRelease(v5);
        return;
      }
LABEL_23:
      sub_100003CE8((uint64_t)"gather_ioreg_info", @"Can't create ioreg dict.");
      goto LABEL_24;
    }
    sub_100003CE8((uint64_t)"gather_ioreg_info", @"Can't get root entry.");
  }
  else
  {
    sub_100003CE8((uint64_t)"gather_ioreg_info", @"Request message is not valid.");
  }
}

__CFDictionary *sub_100005258(io_registry_entry_t a1, const char *a2)
{
  busyuint64_t State = 0;
  io_registry_entry_t valuePtr = a1;
  memset(name, 0, 128);
  memset(className, 0, sizeof(className));
  uint64_t v36 = 0;
  io_iterator_t iterator = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  io_registry_entry_t v5 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  uint64_t NameInPlane = IORegistryEntryGetNameInPlane(a1, a2, name);
  if (NameInPlane)
  {
    sub_100003CE8((uint64_t)"create_ioreg_dict", @"IORegistryEntryGetNameInPlane has failed with error %d.", NameInPlane);
    goto LABEL_8;
  }
  CFStringRef v7 = CFStringCreateWithCString(kCFAllocatorDefault, name, 0x8000100u);
  if (v7)
  {
    CFStringRef v8 = v7;
    CFDictionarySetValue(Mutable, @"name", v7);
    CFRelease(v8);
  }
  else
  {
    sub_100003CE8((uint64_t)"create_ioreg_dict", @"Can't create CFString for entry name.");
  }
  uint64_t Class = IOObjectGetClass(a1, className);
  if (Class)
  {
    sub_100003CE8((uint64_t)"create_ioreg_dict", @"IOObjectGetClass has failed with error %d.", Class);
    goto LABEL_8;
  }
  CFStringRef v12 = CFStringCreateWithCString(kCFAllocatorDefault, className, 0x8000100u);
  if (v12)
  {
    CFStringRef v13 = v12;
    CFDictionarySetValue(Mutable, @"className", v12);
    long long v14 = CFStringCreateMutable(kCFAllocatorDefault, 512);
    CFStringRef Copy = CFStringCreateCopy(0, v13);
    CFStringInsert(v14, 0, Copy);
    CFStringRef v16 = IOObjectCopySuperclassForClass(Copy);
    CFRelease(Copy);
    if (v16)
    {
      do
      {
        CFStringInsert(v14, 0, @" : ");
        CFStringInsert(v14, 0, v16);
        CFStringRef v17 = IOObjectCopySuperclassForClass(v16);
        CFRelease(v16);
        CFStringRef v16 = v17;
      }
      while (v17);
    }
    CFRelease(v13);
    if (v14)
    {
      CFDictionarySetValue(Mutable, @"inheritance", v14);
      CFRelease(v14);
    }
    else
    {
      sub_100003CE8((uint64_t)"create_ioreg_dict", @"Can't create inheritance string.");
    }
  }
  else
  {
    sub_100003CE8((uint64_t)"create_ioreg_dict", @"Can't create CFString for className.");
  }
  long long v18 = (char *)malloc_type_malloc(0xC800uLL, 0x6F3783B8uLL);
  int v10 = v18;
  if (!v18)
  {
    sub_100003CE8((uint64_t)"create_ioreg_dict", @"Failed to get space for state string.");
    goto LABEL_25;
  }
  *long long v18 = 0;
  long long v19 = v18;
  if (!IOObjectConformsTo(a1, "IOService"))
  {
LABEL_38:
    RetainCFIndex Count = IOObjectGetRetainCount(a1);
    sprintf(v19, "retain %d", RetainCount);
    CFStringRef v27 = CFStringCreateWithCString(kCFAllocatorDefault, v10, 0x8000100u);
    if (v27)
    {
      CFStringRef v28 = v27;
      CFDictionarySetValue(Mutable, @"state", v27);
      CFRelease(v28);
    }
    else
    {
      sub_100003CE8((uint64_t)"create_ioreg_dict", @"Can't create CFString for state.");
    }
    free(v10);
    CFNumberRef v29 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v29)
    {
      CFNumberRef v30 = v29;
      CFDictionarySetValue(Mutable, @"regEntry", v29);
      CFRelease(v30);
    }
    else
    {
      sub_100003CE8((uint64_t)"create_ioreg_dict", @"Can't create CFNumber for regEntry");
    }
    uint64_t ChildIterator = IORegistryEntryGetChildIterator(valuePtr, a2, &iterator);
    if (ChildIterator)
    {
      sub_100003CE8((uint64_t)"create_ioreg_dict", @"IORegistryEntryGetChildIterator has failed with error %d.", ChildIterator);
    }
    else
    {
      uint64_t v32 = IOIteratorNext(iterator);
      if (v32)
      {
        uint64_t v33 = v32;
        do
        {
          v34 = (const void *)sub_100005258(v33, a2);
          CFArrayAppendValue(v5, v34);
          IOObjectRelease(v33);
          uint64_t v33 = IOIteratorNext(iterator);
        }
        while (v33);
      }
      IOObjectRelease(iterator);
      if (CFArrayGetCount(v5)) {
        CFDictionarySetValue(Mutable, @"children", v5);
      }
    }
LABEL_8:
    int v10 = 0;
    if (!v5) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  uint64_t State = IOServiceGetState();
  if (State)
  {
    sub_100003CE8((uint64_t)"create_ioreg_dict", @"IOServiceGetState has failed with error %d.", State);
    goto LABEL_25;
  }
  CFDictionaryRef v21 = "!";
  if ((v36 & 2) != 0) {
    v22 = (const char *)&unk_1000078B3;
  }
  else {
    v22 = "!";
  }
  if ((v36 & 4) != 0) {
    CFDictionaryRef v21 = (const char *)&unk_1000078B3;
  }
  if (v36) {
    v23 = "in";
  }
  else {
    v23 = (const char *)&unk_1000078B3;
  }
  int v24 = __sprintf_chk(v10, 0, 0xC800uLL, "%sregistered, %smatched, %sactive, ", v22, v21, v23);
  uint64_t v25 = IOServiceGetBusyState(a1, &busyState);
  if (!v25)
  {
    long long v19 = &v10[v24 + sprintf(&v10[v24], "busy %d, ", busyState)];
    goto LABEL_38;
  }
  sub_100003CE8((uint64_t)"create_ioreg_dict", @"IOServiceGetBusyState has failed with error %d.", v25);
LABEL_25:
  if (v5) {
LABEL_9:
  }
    CFRelease(v5);
LABEL_10:
  if (v10) {
    free(v10);
  }
  return Mutable;
}

CFMutableDictionaryRef sub_100005790(const __CFString *a1, int a2)
{
  CFStringRef v4 = (char *)malloc_type_malloc(0x80uLL, 0x9194D540uLL);
  CFMutableDictionaryRef properties = 0;
  CFStringGetCString(a1, v4, 128, 0x8000100u);
  if (v4)
  {
    if (a2)
    {
      sub_100003CE8((uint64_t)"copy_prop_matches_name", @"IOReg query class %s", v4);
      CFDictionaryRef v5 = IOServiceMatching(v4);
    }
    else
    {
      sub_100003CE8((uint64_t)"copy_prop_matches_name", @"IOReg query entry %s", v4);
      CFDictionaryRef v5 = IOServiceNameMatching(v4);
    }
    if (v5)
    {
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
      if (MatchingService)
      {
        io_object_t v8 = MatchingService;
        if (IORegistryEntryCreateCFProperties(MatchingService, &properties, kCFAllocatorDefault, 0)) {
          sub_100003CE8((uint64_t)"copy_prop_matches_name", @"Could not create property.");
        }
        IOObjectRelease(v8);
        CFMutableDictionaryRef v6 = properties;
        goto LABEL_14;
      }
      sub_100003CE8((uint64_t)"copy_prop_matches_name", @"Could not get service.");
    }
    else
    {
      sub_100003CE8((uint64_t)"copy_prop_matches_name", @"Could not get name matching dictionary.");
    }
    CFMutableDictionaryRef v6 = 0;
LABEL_14:
    free(v4);
    return v6;
  }
  sub_100003CE8((uint64_t)"copy_prop_matches_name", @"Could not get ioreg entry name.");
  return 0;
}

void sub_1000058F4(const __CFDictionary *a1)
{
  v1[0] = 0;
  v1[1] = "\t";
  v1[2] = __stderrp;
  sub_1000059CC(a1, v1);
}

void sub_100005934(const __CFDictionary *a1, uint64_t a2)
{
  v2[0] = 0;
  v2[1] = "\t";
  v2[2] = a2;
  sub_1000059CC(a1, v2);
}

void sub_100005968(const __CFDictionary *a1, uint64_t a2)
{
  v2[1] = a2;
  v2[2] = __stderrp;
  v2[0] = 0;
  sub_1000059CC(a1, v2);
}

void sub_1000059A0(const __CFDictionary *a1, uint64_t a2, uint64_t a3)
{
  v3[1] = a3;
  v3[2] = a2;
  v3[0] = 0;
  sub_1000059CC(a1, v3);
}

void sub_1000059CC(const __CFDictionary *a1, void *a2)
{
  if (a1)
  {
    CFDictionaryRef v3 = a1;
    CFTypeID v4 = CFGetTypeID(a1);
    if (v4 == CFDictionaryGetTypeID())
    {
      CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)sub_100005BA8, a2);
      return;
    }
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFArrayGetTypeID())
    {
      v6.length = CFArrayGetCount(v3);
      v6.location = 0;
      CFArrayApplyFunction(v3, v6, (CFArrayApplierFunction)sub_100005C10, a2);
      return;
    }
    CFTypeID v7 = CFGetTypeID(v3);
    if (v7 == CFTreeGetTypeID())
    {
      sub_100005CA4(v3, (uint64_t)a2);
      return;
    }
    CFTypeID v8 = CFGetTypeID(v3);
    if (v8 == CFBagGetTypeID())
    {
      CFBagApplyFunction(v3, (CFBagApplierFunction)sub_100005D28, a2);
      return;
    }
    a1 = v3;
  }

  sub_100005B50(a1, (uint64_t)a2);
}

void sub_100005B50(const void *a1, uint64_t a2)
{
  CFDictionaryRef v3 = (char *)sub_100005D3C(a1);
  sub_100005EBC(v3, 0, a2);
  if (v3)
  {
    free(v3);
  }
}

void sub_100005BA8(const void *a1, const void *a2, uint64_t a3)
{
  CFTypeID v5 = (char *)sub_100005D3C(a1);
  sub_100005EBC(v5, a2, a3);
  if (v5)
  {
    free(v5);
  }
}

void sub_100005C10(const void *a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a2 + 4);
  *(_DWORD *)(a2 + 4) = v4 + 1;
  snprintf(__str, 0x100uLL, "%d", v4);
  sub_100005EBC(__str, a1, a2);
}

void sub_100005CA4(__CFTree *a1, uint64_t a2)
{
  memset(&context, 0, sizeof(context));
  int v4 = *(_DWORD *)a2 + 1;
  long long v6 = *(_OWORD *)(a2 + 8);
  v5[0] = v4;
  v5[1] = 0;
  CFTreeGetContext(a1, &context);
  sub_100005EBC((char *)&unk_1000078B3, context.info, a2);
  CFTreeApplyFunctionToChildren(a1, (CFTreeApplierFunction)sub_100005CA4, v5);
}

void sub_100005D28(const void *a1, uint64_t a2)
{
}

_WORD *sub_100005D3C(const void *a1)
{
  if (a1
    && (CFTypeID TypeID = CFDataGetTypeID(), TypeID == CFGetTypeID(a1))
    && (CFIndex v3 = CFDataGetLength((CFDataRef)a1),
        BytePtr = CFDataGetBytePtr((CFDataRef)a1),
        size_t v5 = 2 * (int)v3 + 3,
        (long long v6 = (char *)malloc_type_malloc(v5, 0xF2CFBC54uLL)) != 0))
  {
    CFTypeID v7 = v6;
    strlcpy(v6, "0x", v5);
    CFTypeID v8 = v7 + 1;
    if (v3 >= 1)
    {
      do
      {
        int v9 = *BytePtr++;
        snprintf(__str, 3uLL, "%02hX", v9);
        *v8++ = *(_WORD *)__str;
        --v3;
      }
      while (v3);
    }
    *(unsigned char *)CFTypeID v8 = 0;
  }
  else
  {
    CFStringRef v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%@", a1);
    if (v10) {
      BOOL v11 = 1;
    }
    else {
      BOOL v11 = a1 == 0;
    }
    if (v11) {
      CFStringRef v12 = v10;
    }
    else {
      CFStringRef v12 = @"<error getting string representation>";
    }
    CFIndex Length = CFStringGetLength(v12);
    CFIndex v14 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
    CFTypeID v7 = malloc_type_malloc(v14, 0x61CBD066uLL);
    if (v7 && !CFStringGetCString(v12, (char *)v7, v14, 0x8000100u))
    {
      free(v7);
      CFTypeID v7 = 0;
    }
    if (v12) {
      CFRelease(v12);
    }
  }
  return v7;
}

void sub_100005EBC(char *a1, const void *a2, uint64_t a3)
{
  if (*(int *)a3 >= 1)
  {
    int v6 = 0;
    do
    {
      fputs(*(const char **)(a3 + 8), *(FILE **)(a3 + 16));
      ++v6;
    }
    while (v6 < *(_DWORD *)a3);
  }
  fputs(a1, *(FILE **)(a3 + 16));
  if (a2)
  {
    if (a1 && *a1) {
      fputc(58, *(FILE **)(a3 + 16));
    }
    CFTypeID v7 = CFGetTypeID(a2);
    if (v7 == CFDictionaryGetTypeID()
      || (CFTypeID v8 = CFGetTypeID(a2), v8 == CFArrayGetTypeID())
      || (CFTypeID v9 = CFGetTypeID(a2), v9 == CFTreeGetTypeID())
      || (CFTypeID v10 = CFGetTypeID(a2), v10 == CFBagGetTypeID()))
    {
      fputc(10, *(FILE **)(a3 + 16));
      v14[0] = *(_DWORD *)a3 + 1;
      v14[1] = 0;
      long long v15 = *(_OWORD *)(a3 + 8);
      sub_1000059CC(a2, v14);
    }
    else
    {
      CFStringRef v12 = (char *)sub_100005D3C(a2);
      if (a1 && *a1) {
        fputc(32, *(FILE **)(a3 + 16));
      }
      CFStringRef v13 = *(FILE **)(a3 + 16);
      if (v12)
      {
        fprintf(v13, "%s\n", v12);
        free(v12);
      }
      else
      {
        fwrite("(NULL)\n", 7uLL, 1uLL, v13);
      }
    }
  }
  else
  {
    BOOL v11 = *(FILE **)(a3 + 16);
    fputc(10, v11);
  }
}

void sub_100006098(uint64_t a1, __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    int v4 = Mutable;
    sub_100003CE8((uint64_t)"gather_wifi_info", @"Could not gather the Wifi information as this function has been deprecated");
    CFDictionarySetValue(v4, @"Status", @"WifiInfoDeprecated");
    CFDictionarySetValue(a2, @"WiFi", v4);
    CFRelease(v4);
  }
  else
  {
    sub_100003CE8((uint64_t)"gather_wifi_info", @"Could not create empty dictionary");
  }
}

uint64_t sub_10000615C(const __CFDictionary *a1)
{
  uint64_t v2 = MGCopyAnswer();
  if (!v2)
  {
    sub_100003CE8((uint64_t)"do_obliterate", @"obliteration denied: not running internal build.");
    return 1;
  }
  CFIndex v3 = (const void *)v2;
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (TypeID == CFGetTypeID(v3) && CFBooleanGetValue((CFBooleanRef)v3))
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable)
    {
      int v6 = Mutable;
      if (a1)
      {
        CFStringRef Value = CFDictionaryGetValue(a1, @"DataPartitionOnly");
        if (!Value) {
          goto LABEL_18;
        }
      }
      else
      {
        CFStringRef Value = kCFBooleanFalse;
        if (!kCFBooleanFalse) {
          goto LABEL_18;
        }
      }
      CFTypeID v10 = CFBooleanGetTypeID();
      if (v10 == CFGetTypeID(Value) && CFBooleanGetValue((CFBooleanRef)Value))
      {
        BOOL v11 = (const void **)&kObliterateDataPartition;
LABEL_19:
        CFDictionarySetValue(v6, kObliterationTypeKey, *v11);
        CFDictionarySetValue(v6, kDisplayProgressBarKey, kCFBooleanTrue);
        int valuePtr = 3;
        sub_100003CE8((uint64_t)"do_obliterate", @"REPLY REQUESTED and delay set for %d secs\n", 3);
        CFNumberRef v12 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
        if (v12) {
          CFDictionarySetValue(v6, kObliterationDelayAfterReplyKey, v12);
        }
        else {
          sub_100003CE8((uint64_t)"do_obliterate", @"Can't set obliteration delay ");
        }
        CFRelease(v12);
        CFDictionarySetValue(v6, kObliterationMessageKey, @"MobileDiagnosticsRelay executed SIOP.");
        sub_100003CE8((uint64_t)"do_obliterate", @"obliteration starting: SIOP orders being transmitted.");
        uint64_t v13 = Mobile_Obliterate();
        uint64_t v8 = v13;
        if (v13) {
          sub_100003CE8((uint64_t)"do_obliterate", @"SIOP orders failed (%d): how did we end up here?", v13);
        }
        else {
          sub_100003CE8((uint64_t)"do_obliterate", @"SIOP orders accepted: welcome to the Stone Age.", v14);
        }
        CFRelease(v6);
        goto LABEL_10;
      }
LABEL_18:
      BOOL v11 = (const void **)&kObliterationTypeWipeAndBrick;
      goto LABEL_19;
    }
    sub_100003CE8((uint64_t)"do_obliterate", @"Could not create CFDictionary.");
  }
  else
  {
    sub_100003CE8((uint64_t)"do_obliterate", @"obliteration denied: not running internal build.");
  }
  uint64_t v8 = 1;
LABEL_10:
  CFRelease(v3);
  return v8;
}

void sub_1000063DC(uint64_t a1, __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    int v4 = Mutable;
    CFDictionarySetValue(Mutable, @"Status", @"Failure");
    CFDictionarySetValue(v4, @"Connection", @"Unplugged");
    CFDictionaryRef v5 = IOServiceMatching("IOHDMIService");
    if (v5)
    {
      io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v5);
      if (MatchingService)
      {
        io_object_t v7 = MatchingService;
        CFDictionarySetValue(v4, @"Connection", @"Plugged");
        CFBooleanRef v8 = 0;
        CFStringRef v9 = @"Success";
LABEL_5:
        CFDictionarySetValue(v4, @"Status", v9);
        CFDictionarySetValue(a2, @"HDMI", v4);
        goto LABEL_6;
      }
      CFDictionaryRef v10 = IOServiceMatching("AppleANX9836");
      if (v10)
      {
        io_service_t v11 = IOServiceGetMatchingService(kIOMasterPortDefault, v10);
        io_object_t v7 = v11;
        if (v11)
        {
          CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v11, @"ds_plugged", kCFAllocatorDefault, 0);
          CFBooleanRef v8 = CFProperty;
          if (!CFProperty)
          {
            CFStringRef v9 = @"CreatePropertiesFailed";
            goto LABEL_5;
          }
          CFTypeID v13 = CFGetTypeID(CFProperty);
          if (v13 != CFBooleanGetTypeID())
          {
            CFStringRef v9 = @"GetPlugStatusTypeMismatch";
            goto LABEL_5;
          }
          int Value = CFBooleanGetValue(v8);
          long long v15 = "PLUGGED";
          if (!Value) {
            long long v15 = "UNPLUGGED";
          }
          sub_100003CE8((uint64_t)"gather_hdmi_info", @"downstream %s\n", v15);
          if (!CFBooleanGetValue(v8))
          {
            CFStringRef v9 = @"GetPlugStatusValueFailred";
            goto LABEL_5;
          }
          CFDictionarySetValue(v4, @"Connection", @"Plugged");
        }
        else
        {
          sub_100003CE8((uint64_t)"gather_hdmi_info", @"Could not find the AppleANX9836 service");
          CFBooleanRef v8 = 0;
        }
        CFDictionarySetValue(v4, @"Status", @"Success");
        CFDictionarySetValue(a2, @"HDMI", v4);
        if (!v7)
        {
LABEL_7:
          if (v8) {
            CFRelease(v8);
          }
          goto LABEL_21;
        }
LABEL_6:
        IOObjectRelease(v7);
        goto LABEL_7;
      }
    }
    sub_100003CE8((uint64_t)"gather_hdmi_info", @"Could not create matching dictionary");
    CFDictionarySetValue(v4, @"Status", @"ServiceMatchingFailed");
    CFDictionarySetValue(a2, @"HDMI", v4);
LABEL_21:
    CFRelease(v4);
    return;
  }

  sub_100003CE8((uint64_t)"gather_hdmi_info", @"Could not create empty dictionary");
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
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

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFBagApplyFunction(CFBagRef theBag, CFBagApplierFunction applier, void *context)
{
}

CFTypeID CFBagGetTypeID(void)
{
  return _CFBagGetTypeID();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
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

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return _CFPropertyListCreateData(allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRun(void)
{
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return _CFStringCreateWithFormatAndArguments(alloc, formatOptions, format, arguments);
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

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
}

void CFTreeApplyFunctionToChildren(CFTreeRef tree, CFTreeApplierFunction applier, void *context)
{
}

void CFTreeGetContext(CFTreeRef tree, CFTreeContext *context)
{
}

CFTypeID CFTreeGetTypeID(void)
{
  return _CFTreeGetTypeID();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return _IOMasterPort(bootstrapPort, mainPort);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

CFStringRef IOObjectCopySuperclassForClass(CFStringRef classname)
{
  return _IOObjectCopySuperclassForClass(classname);
}

kern_return_t IOObjectGetClass(io_object_t object, io_name_t className)
{
  return _IOObjectGetClass(object, className);
}

uint32_t IOObjectGetRetainCount(io_object_t object)
{
  return _IOObjectGetRetainCount(object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_connect_t IOPMFindPowerManagement(mach_port_t master_device_port)
{
  return _IOPMFindPowerManagement(master_device_port);
}

IOReturn IOPMSleepSystem(io_connect_t fb)
{
  return _IOPMSleepSystem(fb);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetNameInPlane(io_registry_entry_t entry, const io_name_t plane, io_name_t name)
{
  return _IORegistryEntryGetNameInPlane(entry, plane, name);
}

io_registry_entry_t IORegistryGetRootEntry(mach_port_t mainPort)
{
  return _IORegistryGetRootEntry(mainPort);
}

kern_return_t IOServiceGetBusyState(io_service_t service, uint32_t *busyState)
{
  return _IOServiceGetBusyState(service, busyState);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

uint64_t IOServiceGetState()
{
  return _IOServiceGetState();
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGCopyMultipleAnswers()
{
  return _MGCopyMultipleAnswers();
}

uint64_t Mobile_Obliterate()
{
  return _Mobile_Obliterate();
}

int *__error(void)
{
  return ___error();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return ___sprintf_chk(a1, a2, a3, a4);
}

void _exit(int a1)
{
}

int access(const char *a1, int a2)
{
  return _access(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

int dup2(int a1, int a2)
{
  return _dup2(a1, a2);
}

int execv(const char *__path, char *const *__argv)
{
  return _execv(__path, __argv);
}

void exit(int a1)
{
}

pid_t fork(void)
{
  return _fork();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return _fputc(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

uint64_t lockdown_disconnect()
{
  return _lockdown_disconnect();
}

uint64_t lockdown_receive_message()
{
  return _lockdown_receive_message();
}

uint64_t lockdown_recv()
{
  return _lockdown_recv();
}

uint64_t lockdown_send()
{
  return _lockdown_send();
}

uint64_t lockdown_send_message()
{
  return _lockdown_send_message();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void openlog(const char *a1, int a2, int a3)
{
}

int pipe(int a1[2])
{
  return _pipe(a1);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

uint64_t reboot3()
{
  return _reboot3();
}

uint64_t secure_lockdown_checkin()
{
  return _secure_lockdown_checkin();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

void syslog(int a1, const char *a2, ...)
{
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return _waitpid(a1, a2, a3);
}