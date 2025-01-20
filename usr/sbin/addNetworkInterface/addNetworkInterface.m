int main(int argc, const char **argv, const char **envp)
{
  int v3;
  const char **v4;
  uint64_t i;
  const char *v6;
  CFStringEncoding v7;
  CFStringRef v8;
  CFStringRef v9;
  __CFArray *v10;
  CFStringEncoding SystemEncoding;
  CFStringRef v12;
  CFStringRef v13;
  __CFArray *Mutable;
  uint64_t v15;
  CFStringRef v16;
  CFStringRef v17;
  CFDictionaryRef v18;
  kern_return_t MatchingServices;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  int v22;

  if (argc >= 2)
  {
    v3 = 0;
    v4 = argv + 1;
    for (i = argc - 1; i; --i)
    {
      v6 = *v4;
      if (strcmp(*v4, "-i"))
      {
        if (!strcmp(v6, "-c")) {
          goto LABEL_37;
        }
        if (!strcmp(v6, "-p"))
        {
          if (byte_100008000 == 1) {
            syslog(1, "Will persist\n");
          }
          else {
            puts("Will persist");
          }
          byte_100008001 = 1;
          goto LABEL_38;
        }
        if (!strcmp(v6, "-x"))
        {
          if (byte_100008000 == 1) {
            syslog(1, "XPC support\n");
          }
          else {
            puts("XPC support");
          }
          byte_100008002 = 1;
          goto LABEL_38;
        }
        if (!strcmp(v6, "-s"))
        {
          puts("Routing debug output to syslog");
          if (byte_100008000 == 1) {
            syslog(1, "Routing debug output to syslog\n");
          }
          else {
            puts("Routing debug output to syslog");
          }
          byte_100008000 = 1;
          goto LABEL_38;
        }
        if (v3 == 2)
        {
          SystemEncoding = CFStringGetSystemEncoding();
          v12 = CFStringCreateWithCString(kCFAllocatorDefault, v6, SystemEncoding);
          if (v12)
          {
            v13 = v12;
            Mutable = (__CFArray *)qword_100008010;
            if (qword_100008010
              || (Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks),
                  (qword_100008010 = (uint64_t)Mutable) != 0))
            {
              CFArrayAppendValue(Mutable, v13);
              if (byte_100008000 == 1) {
                syslog(1, "Looking for controller %s\n", *v4);
              }
              else {
                printf("Looking for controller %s\n", *v4);
              }
            }
            CFRelease(v13);
          }
LABEL_37:
          v3 = 2;
          goto LABEL_38;
        }
        if (v3 != 1)
        {
          puts("options:\n");
          puts("\t[-i <interface>]");
          puts("\t[-c <controller>]");
          puts("\t[-p] persistent host detection");
          puts("\t[-s] route logging to syslog");
          puts("\t[-x] register xpc");
          goto LABEL_69;
        }
        v7 = CFStringGetSystemEncoding();
        v8 = CFStringCreateWithCString(kCFAllocatorDefault, v6, v7);
        if (v8)
        {
          v9 = v8;
          v10 = (__CFArray *)qword_100008008;
          if (qword_100008008
            || (v10 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks),
                (qword_100008008 = (uint64_t)v10) != 0))
          {
            CFArrayAppendValue(v10, v9);
            if (byte_100008000 == 1) {
              syslog(1, "Looking for interface %s\n", *v4);
            }
            else {
              printf("Looking for interface %s\n", *v4);
            }
          }
          CFRelease(v9);
        }
      }
      v3 = 1;
LABEL_38:
      ++v4;
    }
  }
  if (!qword_100008008)
  {
    if (byte_100008000 == 1) {
      syslog(1, "Looking for all interfaces\n", envp);
    }
    else {
      puts("Looking for all interfaces");
    }
  }
  if (!qword_100008010)
  {
    if (byte_100008000 == 1) {
      syslog(1, "Looking for all controllers\n", envp);
    }
    else {
      puts("Looking for all controllers");
    }
  }
  if (byte_100008002 == 1) {
    xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100004268);
  }
  v15 = getpid();
  v16 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"addNetworkInterface-%d", v15);
  if (v16)
  {
    v17 = v16;
    qword_100008018 = (uint64_t)SCPreferencesCreate(kCFAllocatorDefault, v16, 0);
    if (!qword_100008018) {
      goto LABEL_70;
    }
    if (byte_100008000 == 1) {
      syslog(1, "Looking for network interfaces...\n");
    }
    else {
      puts("Looking for network interfaces...");
    }
    v18 = IOServiceMatching("IONetworkInterface");
    if (!v18)
    {
      if (byte_100008000 == 1) {
        syslog(1, "Can't create a service matching dictionary\n");
      }
      else {
        puts("Can't create a service matching dictionary");
      }
      goto LABEL_61;
    }
    if (byte_100008001 == 1)
    {
      MatchingServices = IOServiceAddMatchingNotification((IONotificationPortRef)qword_100008020, "IOServiceMatched", v18, (IOServiceMatchingCallback)sub_100002888, 0, (io_iterator_t *)&dword_100008028);
      if (MatchingServices)
      {
        if (byte_100008000 == 1) {
          syslog(1, "IOServiceAddMatchingNotification failed: 0x%x\n");
        }
        else {
          printf("IOServiceAddMatchingNotification failed: 0x%x\n");
        }
        goto LABEL_61;
      }
    }
    else
    {
      MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v18, (io_iterator_t *)&dword_100008028);
      if (MatchingServices)
      {
        if (byte_100008000 == 1) {
          syslog(1, "IOServiceGetMatchingServices failed: 0x%x\n");
        }
        else {
          printf("IOServiceGetMatchingServices failed: 0x%x\n");
        }
        goto LABEL_61;
      }
    }
    sub_100002888(MatchingServices, dword_100008028);
LABEL_61:
    if (byte_100008001 != 1)
    {
LABEL_64:
      v22 = 0;
LABEL_65:
      CFRelease(v17);
      goto LABEL_66;
    }
    qword_100008020 = (uint64_t)IONotificationPortCreate(kIOMasterPortDefault);
    if (qword_100008020)
    {
      Current = CFRunLoopGetCurrent();
      RunLoopSource = IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_100008020);
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopDefaultMode);
      CFRunLoopRun();
      goto LABEL_64;
    }
LABEL_70:
    v22 = -1;
    goto LABEL_65;
  }
LABEL_69:
  v22 = -1;
LABEL_66:
  if (byte_100008002 == 1) {
    dispatch_main();
  }
  return v22;
}

void sub_100002808(id a1, void *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  uint64_t uint64 = xpc_dictionary_get_uint64(a2, "IOMatchLaunchServiceID");
  if (byte_100008000 == 1) {
    syslog(1, "Kicked on behalf of com.apple.iokit.matching: event=%s id=%lld\n", string, uint64);
  }
  else {
    printf("Kicked on behalf of com.apple.iokit.matching: event=%s id=%lld\n", string, uint64);
  }
  exit(0);
}

uint64_t sub_100002888(int a1, io_iterator_t iterator)
{
  io_iterator_t v2 = iterator;
  uint64_t result = IOIteratorNext(iterator);
  if (result)
  {
    io_registry_entry_t v4 = result;
    io_iterator_t v77 = v2;
    while (1)
    {
      *(void *)buffer = 0;
      uint64_t v90 = 0;
      memset(className, 0, sizeof(className));
      *(void *)parent = 0;
      memset(v87, 0, sizeof(v87));
      if (!IORegistryEntryGetParentEntry(v4, "IOService", &parent[1])
        && !IOObjectGetClass(parent[1], className)
        && !IORegistryEntryGetParentEntry(parent[1], "IOService", parent)
        && !IOObjectGetClass(parent[0], v87))
      {
        if (!qword_100008010) {
          goto LABEL_20;
        }
        if (CFArrayGetCount((CFArrayRef)qword_100008010) >= 1) {
          break;
        }
      }
LABEL_55:
      if (parent[1]) {
        IOObjectRelease(parent[1]);
      }
      if (parent[0]) {
        IOObjectRelease(parent[0]);
      }
      IOObjectRelease(v4);
      uint64_t result = IOIteratorNext(v2);
      io_registry_entry_t v4 = result;
      if (!result) {
        return result;
      }
    }
    CFIndex v5 = 0;
    while (1)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)qword_100008010, v5);
      if (ValueAtIndex)
      {
        CFStringRef v7 = ValueAtIndex;
        io_object_t v8 = parent[1];
        CFStringEncoding SystemEncoding = CFStringGetSystemEncoding();
        CStringPtr = CFStringGetCStringPtr(v7, SystemEncoding);
        BOOL v11 = IOObjectConformsTo(v8, CStringPtr) != 0;
        io_object_t v12 = parent[0];
        CFStringEncoding v13 = CFStringGetSystemEncoding();
        v14 = CFStringGetCStringPtr(v7, v13);
        int v15 = IOObjectConformsTo(v12, v14) | v11;
        BOOLean_t v16 = IOObjectConformsTo(parent[0], "IOUserNetworkWLAN");
        BOOL v17 = v15 && v16 == 0;
        if (v17) {
          break;
        }
      }
      if (CFArrayGetCount((CFArrayRef)qword_100008010) <= ++v5) {
        goto LABEL_55;
      }
    }
    int v18 = byte_100008000;
    CFStringEncoding v19 = CFStringGetSystemEncoding();
    v20 = CFStringGetCStringPtr(v7, v19);
    if (v18 == 1) {
      syslog(1, "found %s controller \n", v20);
    }
    else {
      printf("found %s controller \n", v20);
    }
LABEL_20:
    CFBooleanRef v21 = (const __CFBoolean *)IORegistryEntrySearchCFProperty(parent[1], "IOService", @"HiddenInterface", kCFAllocatorDefault, 3u);
    CFBooleanRef v22 = v21;
    if (v21 && CFBooleanGetValue(v21))
    {
      if (byte_100008000 == 1) {
        syslog(1, "Skipping configuration on HiddenInterface\n");
      }
      else {
        puts("Skipping configuration on HiddenInterface");
      }
      CFNumberRef v81 = 0;
      CFStringRef v29 = 0;
      CFStringRef v24 = 0;
      goto LABEL_48;
    }
    CFStringRef v23 = (const __CFString *)IORegistryEntrySearchCFProperty(parent[1], "IOService", @"InterfaceRole", kCFAllocatorDefault, 3u);
    CFStringRef v24 = v23;
    if (v23 && CFEqual(v23, @"CarPlay"))
    {
      if (byte_100008000 == 1) {
        syslog(1, "Skipping configuration on CarPlay interface\n");
      }
      else {
        puts("Skipping configuration on CarPlay interface");
      }
      CFStringRef v29 = 0;
      CFNumberRef v81 = 0;
      goto LABEL_47;
    }
    CFStringRef cf = v24;
    CFNumberRef v25 = (const __CFNumber *)IORegistryEntrySearchCFProperty(parent[1], "IOService", @"NetworkInterfaceFlags", kCFAllocatorDefault, 0);
    CFNumberRef v81 = v25;
    if (v25)
    {
      LODWORD(valuePtr) = 0;
      CFNumberGetValue(v25, kCFNumberIntType, &valuePtr);
      unsigned int v79 = (valuePtr & 0x20000000) >> 29;
      if ((valuePtr & 0x20000000) != 0) {
        int v26 = 3;
      }
      else {
        int v26 = 0;
      }
    }
    else
    {
      int v26 = 0;
      LOBYTE(v79) = 0;
    }
    int v27 = 0;
    while (1)
    {
      CFStringRef v28 = (const __CFString *)IORegistryEntrySearchCFProperty(v4, "IOService", @"BSD Name", kCFAllocatorDefault, 0);
      if (v28) {
        break;
      }
      usleep(0xC350u);
      if (++v27 == 50)
      {
        if (byte_100008000 == 1) {
          syslog(1, "%s didn't find a name after %d intervals\n", className, 50);
        }
        else {
          printf("%s didn't find a name after %d intervals\n", className, 50);
        }
        CFStringRef v29 = 0;
        goto LABEL_46;
      }
    }
    CFStringRef v29 = v28;
    CFStringEncoding v30 = CFStringGetSystemEncoding();
    CFStringGetCString(v29, buffer, 16, v30);
    if (byte_100008000 == 1) {
      syslog(1, "%s found name after %d intervals : %s\n", className, v27, buffer);
    }
    else {
      printf("%s found name after %d intervals : %s\n", className, v27, buffer);
    }
    if (qword_100008008)
    {
      if (CFArrayGetCount((CFArrayRef)qword_100008008) < 1)
      {
LABEL_46:
        CFStringRef v24 = cf;
        goto LABEL_47;
      }
      CFIndex v31 = 0;
      while (1)
      {
        CFStringRef v32 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)qword_100008008, v31);
        if (v32)
        {
          CFStringRef v33 = v32;
          if (CFEqual(v29, v32)) {
            break;
          }
        }
        if (CFArrayGetCount((CFArrayRef)qword_100008008) <= ++v31) {
          goto LABEL_46;
        }
      }
      int v34 = byte_100008000;
      CFStringEncoding v35 = CFStringGetSystemEncoding();
      v36 = CFStringGetCStringPtr(v33, v35);
      if (v34 == 1) {
        syslog(1, "found %s interface\n", v36);
      }
      else {
        printf("found %s interface\n", v36);
      }
    }
    CFBooleanRef v78 = v22;
    CFTypeRef cf2 = (CFTypeRef)_SCNetworkInterfaceCreateWithIONetworkInterfaceObject();
    if (!cf2)
    {
      CFArrayRef theArray = 0;
      CFArrayRef v38 = 0;
      int v74 = 1001;
LABEL_157:
      int v75 = byte_100008000;
      v76 = SCErrorString(v74);
      if (v75 == 1) {
        syslog(1, "%s\n", v76);
      }
      else {
        puts(v76);
      }
      CFBooleanRef v22 = v78;
      goto LABEL_161;
    }
    if (!SCPreferencesLock((SCPreferencesRef)qword_100008018, 1u))
    {
      SCPreferencesSynchronize((SCPreferencesRef)qword_100008018);
      if (!SCPreferencesLock((SCPreferencesRef)qword_100008018, 1u))
      {
        CFArrayRef v38 = 0;
        CFArrayRef theArray = 0;
        goto LABEL_170;
      }
    }
    CFArrayRef v37 = SCNetworkSetCopyAll((SCPreferencesRef)qword_100008018);
    CFArrayRef v38 = v37;
    if (v37 && CFArrayGetCount(v37))
    {
      BOOL v39 = 0;
    }
    else
    {
      uint64_t valuePtr = _SCNetworkSetCreateDefault();
      if (!valuePtr)
      {
        CFArrayRef theArray = v38;
        CFArrayRef v38 = 0;
        goto LABEL_154;
      }
      BOOL v39 = SCNetworkSetEstablishDefaultConfiguration() != 0;
      if (v38)
      {
        CFRelease(v38);
        CFArrayRef v40 = SCNetworkSetCopyAll((SCPreferencesRef)qword_100008018);
      }
      else
      {
        CFArrayRef v40 = CFArrayCreate(kCFAllocatorDefault, (const void **)&valuePtr, 1, &kCFTypeArrayCallBacks);
      }
      CFArrayRef v38 = v40;
      if (!v40)
      {
        CFArrayRef theArray = 0;
        goto LABEL_154;
      }
    }
    char v82 = v39;
    CFArrayRef theArray = v38;
    CFArrayRef v41 = SCNetworkServiceCopyAll((SCPreferencesRef)qword_100008018);
    if (v41)
    {
      CFArrayRef v42 = v41;
      CFIndex Count = CFArrayGetCount(v41);
      if (Count >= 1)
      {
        CFIndex v44 = Count;
        CFIndex v45 = 0;
        while (1)
        {
          v46 = (const __SCNetworkService *)CFArrayGetValueAtIndex(v42, v45);
          if (v46)
          {
            CFArrayRef v38 = v46;
            SCNetworkInterfaceRef Interface = SCNetworkServiceGetInterface(v46);
            if (Interface)
            {
              if (CFEqual(Interface, cf2)) {
                break;
              }
            }
          }
          if (v44 == ++v45) {
            goto LABEL_82;
          }
        }
        CFRetain(v38);
        CFRelease(v42);
        int PrimaryRank = SCNetworkServiceGetPrimaryRank();
        int v52 = byte_100008000;
        CFStringRef ServiceID = SCNetworkServiceGetServiceID(v38);
        if (v52 == 1)
        {
          char v50 = v79;
          if (ServiceID)
          {
            CFStringRef v54 = SCNetworkServiceGetServiceID(v38);
            CFStringEncoding v55 = CFStringGetSystemEncoding();
            v56 = CFStringGetCStringPtr(v54, v55);
          }
          else
          {
            v56 = "NULL";
          }
          syslog(1, "Found existing service %s rank = %d.\n", v56, PrimaryRank);
        }
        else
        {
          char v50 = v79;
          if (ServiceID)
          {
            CFStringRef v57 = SCNetworkServiceGetServiceID(v38);
            CFStringEncoding v58 = CFStringGetSystemEncoding();
            v59 = CFStringGetCStringPtr(v57, v58);
          }
          else
          {
            v59 = "NULL";
          }
          printf("Found existing service %s rank = %d.\n", v59, PrimaryRank);
        }
        BOOL v17 = PrimaryRank == v26;
        CFArrayRef v48 = theArray;
        if (v17) {
          goto LABEL_103;
        }
        goto LABEL_98;
      }
LABEL_82:
      CFRelease(v42);
      io_iterator_t v2 = v77;
    }
    if (byte_100008000 == 1) {
      syslog(1, "No existing service found. Creating new service.\n");
    }
    else {
      puts("No existing service found. Creating new service.");
    }
    CFArrayRef v48 = theArray;
    v49 = SCNetworkServiceCreate((SCPreferencesRef)qword_100008018, (SCNetworkInterfaceRef)cf2);
    CFArrayRef v38 = v49;
    if (v49)
    {
      SCNetworkServiceEstablishDefaultConfiguration(v49);
      char v50 = v79;
LABEL_98:
      if (byte_100008000 == 1) {
        syslog(1, "Setting Primary rank to %d.\n", v26);
      }
      else {
        printf("Setting Primary rank to %d.\n", v26);
      }
      if (!SCNetworkServiceSetPrimaryRank())
      {
        int v60 = SCError();
        int v61 = byte_100008000;
        if (v60)
        {
          v62 = SCErrorString(v60);
          if (v61) {
            syslog(1, "SCNetworkServiceSetPrimaryRank: %s\n");
          }
          else {
            printf("SCNetworkServiceSetPrimaryRank: %s\n", v62);
          }
        }
        else if (byte_100008000)
        {
          syslog(1, "SCNetworkServiceSetPrimaryRank: Failed but no error.\n");
        }
        else
        {
          puts("SCNetworkServiceSetPrimaryRank: Failed but no error.");
        }
        CFArrayRef v48 = theArray;
        if ((v50 & 1) == 0) {
          goto LABEL_121;
        }
        goto LABEL_113;
      }
      char v82 = 1;
LABEL_103:
      if ((v50 & 1) == 0)
      {
LABEL_121:
        CFIndex v63 = CFArrayGetCount(v48);
        if (v63 >= 1)
        {
          CFIndex v64 = v63;
          for (CFIndex i = 0; i != v64; ++i)
          {
            v66 = (const __SCNetworkSet *)CFArrayGetValueAtIndex(theArray, i);
            v67 = v66;
            if (v66)
            {
              CFArrayRef v68 = SCNetworkSetCopyServices(v66);
              if (v68)
              {
                CFArrayRef v69 = v68;
                v91.length = CFArrayGetCount(v68);
                v91.location = 0;
                int v70 = CFArrayContainsValue(v69, v91, v38);
                CFRelease(v69);
                if (v70) {
                  continue;
                }
              }
            }
            if (SCNetworkSetAddService(v67, v38))
            {
              char v82 = 1;
            }
            else
            {
              int v71 = SCError();
              int v72 = byte_100008000;
              if (v71)
              {
                v73 = SCErrorString(v71);
                if (v72) {
                  syslog(1, "SCNetworkSetAddService: %s\n");
                }
                else {
                  printf("SCNetworkSetAddService: %s\n", v73);
                }
              }
              else if (byte_100008000)
              {
                syslog(1, "SCNetworkSetAddService: Failed but no error.  Probably already in the set.\n");
              }
              else
              {
                puts("SCNetworkSetAddService: Failed but no error.  Probably already in the set.");
              }
            }
          }
        }
        if (v82)
        {
          io_iterator_t v2 = v77;
          if (SCPreferencesCommitChanges((SCPreferencesRef)qword_100008018)
            && SCPreferencesApplyChanges((SCPreferencesRef)qword_100008018))
          {
            int v74 = 0;
          }
          else
          {
            int v74 = SCError();
          }
        }
        else
        {
          int v74 = 0;
          io_iterator_t v2 = v77;
        }
LABEL_155:
        CFBooleanRef v22 = v78;
        if (SCPreferencesUnlock((SCPreferencesRef)qword_100008018))
        {
          if (v74) {
            goto LABEL_157;
          }
LABEL_161:
          if (v38) {
            CFRelease(v38);
          }
          CFStringRef v24 = cf;
          if (cf2) {
            CFRelease(cf2);
          }
          if (theArray) {
            CFRelease(theArray);
          }
          if (byte_100008000 == 1) {
            syslog(1, "%s: enabled %s\n", className, buffer);
          }
          else {
            printf("%s: enabled %s\n", className, buffer);
          }
LABEL_47:
          if (!v22)
          {
LABEL_49:
            if (v24) {
              CFRelease(v24);
            }
            if (v81) {
              CFRelease(v81);
            }
            if (v29) {
              CFRelease(v29);
            }
            goto LABEL_55;
          }
LABEL_48:
          CFRelease(v22);
          goto LABEL_49;
        }
LABEL_170:
        int v74 = SCError();
        if (v74) {
          goto LABEL_157;
        }
        goto LABEL_161;
      }
LABEL_113:
      if (!SCNetworkServiceGetEnabled(v38))
      {
        if (byte_100008000 == 1) {
          syslog(1, "Service should be enabled, but isn't! Force-enabling service.\n");
        }
        else {
          puts("Service should be enabled, but isn't! Force-enabling service.");
        }
        char v82 = 1;
        if (!SCNetworkServiceSetEnabled(v38, 1u))
        {
          if (byte_100008000 == 1)
          {
            char v82 = byte_100008000;
            syslog(1, "Failed to force enable service.\n");
          }
          else
          {
            puts("Failed to force enable service.");
            char v82 = 1;
          }
        }
      }
      goto LABEL_121;
    }
LABEL_154:
    int v74 = 1001;
    goto LABEL_155;
  }
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
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

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
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

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
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

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return _CFStringGetSystemEncoding();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectGetClass(io_object_t object, io_name_t className)
{
  return _IOObjectGetClass(object, className);
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

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

CFArrayRef SCNetworkServiceCopyAll(SCPreferencesRef prefs)
{
  return _SCNetworkServiceCopyAll(prefs);
}

SCNetworkServiceRef SCNetworkServiceCreate(SCPreferencesRef prefs, SCNetworkInterfaceRef interface)
{
  return _SCNetworkServiceCreate(prefs, interface);
}

Boolean SCNetworkServiceEstablishDefaultConfiguration(SCNetworkServiceRef service)
{
  return _SCNetworkServiceEstablishDefaultConfiguration(service);
}

Boolean SCNetworkServiceGetEnabled(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetEnabled(service);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetInterface(service);
}

uint64_t SCNetworkServiceGetPrimaryRank()
{
  return _SCNetworkServiceGetPrimaryRank();
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetServiceID(service);
}

Boolean SCNetworkServiceSetEnabled(SCNetworkServiceRef service, Boolean enabled)
{
  return _SCNetworkServiceSetEnabled(service, enabled);
}

uint64_t SCNetworkServiceSetPrimaryRank()
{
  return _SCNetworkServiceSetPrimaryRank();
}

Boolean SCNetworkSetAddService(SCNetworkSetRef set, SCNetworkServiceRef service)
{
  return _SCNetworkSetAddService(set, service);
}

CFArrayRef SCNetworkSetCopyAll(SCPreferencesRef prefs)
{
  return _SCNetworkSetCopyAll(prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return _SCNetworkSetCopyServices(set);
}

uint64_t SCNetworkSetEstablishDefaultConfiguration()
{
  return _SCNetworkSetEstablishDefaultConfiguration();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesApplyChanges(prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesCommitChanges(prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return _SCPreferencesLock(prefs, wait);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return _SCPreferencesUnlock(prefs);
}

uint64_t _SCNetworkInterfaceCreateWithIONetworkInterfaceObject()
{
  return __SCNetworkInterfaceCreateWithIONetworkInterfaceObject();
}

uint64_t _SCNetworkSetCreateDefault()
{
  return __SCNetworkSetCreateDefault();
}

void dispatch_main(void)
{
}

void exit(int a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

void syslog(int a1, const char *a2, ...)
{
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_uint64(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}