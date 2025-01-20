BOOL sub_1000014EC(mach_port_t *a1)
{
  mach_port_t v2;
  mach_port_t special_port[2];

  *(void *)special_port = 0;
  if (!a1)
  {
    if (!task_get_special_port(mach_task_self_, 4, special_port))
    {
      v2 = special_port[0];
      return bootstrap_look_up(v2, "com.apple.IOUPSPlugInServer", &special_port[1]) == 0;
    }
    return 0;
  }
  v2 = *a1;
  if (!v2)
  {
    if (!task_get_special_port(mach_task_self_, 4, special_port))
    {
      v2 = special_port[0];
      *a1 = special_port[0];
      return bootstrap_look_up(v2, "com.apple.IOUPSPlugInServer", &special_port[1]) == 0;
    }
    return 0;
  }
  special_port[0] = v2;
  return bootstrap_look_up(v2, "com.apple.IOUPSPlugInServer", &special_port[1]) == 0;
}

uint64_t sub_100001594(mach_port_t a1, int a2, CFTypeRef object)
{
  uint64_t result = 3758097090;
  if (a1 && object)
  {
    CFDataRef v6 = IOCFSerialize(object, 0);
    if (v6)
    {
      CFDataRef v7 = v6;
      BytePtr = CFDataGetBytePtr(v6);
      int Length = CFDataGetLength(v7);
      uint64_t v10 = sub_10000584C(a1, a2, (uint64_t)BytePtr, Length);
      CFRelease(v7);
      return v10;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t sub_100001628(mach_port_t a1, int a2, CFTypeRef *a3)
{
  buffer = 0;
  uint64_t v3 = 3758097090;
  if (a1)
  {
    if (a3)
    {
      vm_size_t v6 = 0;
      uint64_t v3 = sub_1000059C4(a1, a2, &buffer, &v6);
      if (!v3)
      {
        *a3 = IOCFUnserialize(buffer, kCFAllocatorDefault, 0, 0);
        vm_deallocate(mach_task_self_, (vm_address_t)buffer, v6);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t sub_1000016B8(mach_port_t a1, int a2, CFTypeRef *a3)
{
  buffer = 0;
  uint64_t v3 = 3758097090;
  if (a1)
  {
    if (a3)
    {
      vm_size_t v6 = 0;
      uint64_t v3 = sub_100005BA0(a1, a2, &buffer, &v6);
      if (!v3)
      {
        *a3 = IOCFUnserialize(buffer, kCFAllocatorDefault, 0, 0);
        vm_deallocate(mach_task_self_, (vm_address_t)buffer, v6);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t start()
{
  kern_return_t v16;
  int v17;
  NSObject *v18;
  __CFArray *v19;
  __CFRunLoopSource *RunLoopSource;
  long long v22;
  mach_port_t sp[6];

  signal(2, (void (__cdecl *)(int))sub_100001B00);
  sp[0] = 0;
  if (task_get_special_port(mach_task_self_, 4, &bootstrap_port)
    || (qword_10000C080 = (uint64_t)CFRunLoopGetCurrent()) == 0)
  {
LABEL_2:
    v0 = 0;
    goto LABEL_3;
  }
  v16 = bootstrap_check_in(bootstrap_port, "com.apple.IOUPSPlugInServer", sp);
  if (v16)
  {
    v17 = v16;
    v18 = qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
      sub_100006044(v17, v18);
    }
    goto LABEL_2;
  }
  v0 = CFMachPortCreateWithPort(kCFAllocatorDefault, sp[0], (CFMachPortCallBack)sub_100005754, 0, 0);
  RunLoopSource = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, v0, 0);
  qword_10000C088 = (uint64_t)RunLoopSource;
  if (!RunLoopSource) {
    goto LABEL_5;
  }
  CFRunLoopAddSource((CFRunLoopRef)qword_10000C080, RunLoopSource, kCFRunLoopDefaultMode);
LABEL_3:
  if (qword_10000C088) {
    CFRelease((CFTypeRef)qword_10000C088);
  }
LABEL_5:
  if (v0) {
    CFRelease(v0);
  }
  byte_10000C048 = 0;
  os_log_t v1 = os_log_create("com.apple.ioupsd", "upsd");
  v2 = (void *)qword_10000C050;
  qword_10000C050 = (uint64_t)v1;

  qword_10000C058 = (uint64_t)IONotificationPortCreate(kIOMainPortDefault);
  Current = CFRunLoopGetCurrent();
  v4 = IONotificationPortGetRunLoopSource((IONotificationPortRef)qword_10000C058);
  CFRunLoopAddSource(Current, v4, kCFRunLoopDefaultMode);
  v22 = xmmword_1000077A0;
  *(_OWORD *)sp = xmmword_100007790;
  CFMutableDictionaryRef v5 = IOServiceMatching("IOHIDDevice");
  if (v5)
  {
    CFMutableDictionaryRef v6 = v5;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 3, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      v8 = Mutable;
      for (uint64_t i = 0; i != 4; ++i)
      {
        CFMutableDictionaryRef v10 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (!v10 || (v11 = v10, (CFNumberRef v12 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &sp[i])) == 0))
        {
LABEL_22:
          CFRelease(v6);
          v19 = v8;
          goto LABEL_24;
        }
        CFNumberRef v13 = v12;
        CFDictionarySetValue(v11, @"DeviceUsagePage", v12);
        CFRelease(v13);
        if (sp[i - 4])
        {
          CFNumberRef v14 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &sp[i - 4]);
          if (!v14) {
            goto LABEL_22;
          }
          CFNumberRef v15 = v14;
          CFDictionarySetValue(v11, @"DeviceUsage", v14);
          CFRelease(v15);
        }
        CFArrayAppendValue(v8, v11);
        CFRelease(v11);
      }
      CFDictionarySetValue(v6, @"DeviceUsagePairs", v8);
      CFRelease(v8);
      if (!IOServiceAddMatchingNotification((IONotificationPortRef)qword_10000C058, "IOServiceFirstMatch", v6, (IOServiceMatchingCallback)sub_1000036D0, 0, (io_iterator_t *)&dword_10000C068))sub_1000036D0(0, dword_10000C068); {
    }
      }
    else
    {
      v19 = v6;
LABEL_24:
      CFRelease(v19);
    }
  }
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100008510);
  CFRunLoopRun();
  return 0;
}

void sub_100001B00()
{
  v0 = qword_10000C050;
  if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)os_log_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "upsd: exiting SIGINT\n", v1, 2u);
  }
  sub_100002560();
}

void sub_100001B58(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  uint64_t v3 = (IONotificationPort *)qword_10000C058;
  io_service_t v4 = sub_100001C34();
  uint64_t v5 = IOServiceAddInterestNotification(v3, v4, "IOGeneralInterest", (IOServiceInterestCallback)sub_100001CB0, 0, (io_object_t *)&dword_10000C060);
  if (v5)
  {
    uint64_t v6 = v5;
    CFDataRef v7 = qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
      sub_1000060D0(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  io_registry_entry_t v14 = sub_100001C34();
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v14, @"AccessoryDetails", kCFAllocatorDefault, 0);
  sub_100001D5C(CFProperty, 1);
  if (!dword_10000C064) {
    sub_100002560();
  }
}

uint64_t sub_100001C34()
{
  uint64_t result = dword_10000C0A8;
  if (!dword_10000C0A8)
  {
    CFDictionaryRef v1 = IOServiceMatching("IOPMPowerSource");
    uint64_t result = IOServiceGetMatchingService(kIOMainPortDefault, v1);
    dword_10000C0A8 = result;
    if (!result)
    {
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
        sub_10000613C();
      }
      return dword_10000C0A8;
    }
  }
  return result;
}

void sub_100001CB0()
{
  io_registry_entry_t v0 = sub_100001C34();
  id CFProperty = (id)IORegistryEntryCreateCFProperty(v0, @"AccessoryDetails", kCFAllocatorDefault, 0);
  io_registry_entry_t v1 = sub_100001C34();
  v2 = (void *)IORegistryEntryCreateCFProperty(v1, @"AppleRawExternalConnected", kCFAllocatorDefault, 0);
  unsigned __int8 v3 = [v2 BOOLValue];
  char v4 = v3;
  if (byte_10000C078) {
    char v5 = 0;
  }
  else {
    char v5 = v3;
  }
  sub_100001D5C(CFProperty, v5);
  byte_10000C078 = v4;
}

void sub_100001D5C(void *a1, char a2)
{
  id v3 = a1;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v3 count])
  {
    char v42 = a2;
    if ([v3 count])
    {
      uint64_t v5 = 0;
      uint64_t v6 = &selRef_BOOLValue;
      *(void *)&long long v4 = 67109376;
      long long v41 = v4;
      id v43 = v3;
      while (1)
      {
        CFDataRef v7 = [v3 objectAtIndex:v5, v41];
        uint64_t v8 = v6[10];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218242;
          *(void *)v54 = v5;
          *(_WORD *)&v54[8] = 2112;
          v55 = v7;
          _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "SMCAccessory[%zu]: %@\n", buf, 0x16u);
        }
        id v9 = v7;
        if (!v9) {
          goto LABEL_67;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_67;
        }
        unint64_t v50 = 0;
        uint64_t v51 = 0;
        int v52 = 0;
        id v10 = v9;
        uint64_t v11 = [v10 objectForKey:@"VID"];
        uint64_t v12 = [v10 objectForKey:@"PID"];
        uint64_t v13 = [v10 objectForKey:@"CurrentCapacity"];
        io_registry_entry_t v14 = [v10 objectForKey:@"MaxCapacity"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                break;
              }
            }
          }
        }

LABEL_66:
        id v3 = v43;
LABEL_67:

        if (++v5 >= (unint64_t)[v3 count]) {
          goto LABEL_77;
        }
      }
      v46 = v11;
      unsigned __int16 cf = (unsigned __int16)[v11 unsignedIntValue];
      v45 = v12;
      unsigned __int16 v47 = (unsigned __int16)[v12 unsignedIntValue];
      CFNumberRef v15 = v13;
      unsigned __int8 v16 = [v13 unsignedIntValue];
      v44 = v14;
      unsigned __int8 v17 = [v14 unsignedIntValue];
      v18 = [v10 objectForKey:@"IsCharging"];
      v19 = [v10 objectForKey:@"ExternalConnected"];
      v20 = v6[10];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109888;
        unsigned int v22 = v16;
        *(_DWORD *)v54 = cf;
        *(_WORD *)&v54[4] = 1024;
        *(_DWORD *)&v54[6] = v47;
        LOWORD(v55) = 1024;
        *(_DWORD *)((char *)&v55 + 2) = v16;
        HIWORD(v55) = 1024;
        int v56 = v17;
        v39 = v20;
        unsigned int v21 = v17;
        _os_log_debug_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "vid:%d, pid:%d, soc:%d/%d\n", buf, 0x1Au);
      }
      else
      {
        unsigned int v21 = v17;
        unsigned int v22 = v16;
      }
      if (v21 >= v22) {
        unsigned __int8 v17 = v16;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unsigned __int8 v23 = [v19 BOOLValue];
      }
      else {
        unsigned __int8 v23 = 0;
      }
      uint64_t v6 = &selRef_BOOLValue;
      LOBYTE(v52) = v23;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        unsigned __int8 v24 = [v18 BOOLValue];
      }
      else {
        unsigned __int8 v24 = 0;
      }
      BYTE1(v52) = v24;
      unint64_t v50 = __PAIR64__(v21, v17);
      LODWORD(v51) = cf;
      HIDWORD(v51) = v47;

      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 5, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (!Mutable) {
        goto LABEL_66;
      }
      v26 = Mutable;
      v27 = qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v41;
        *(_DWORD *)v54 = v17;
        *(_WORD *)&v54[4] = 1024;
        *(_DWORD *)&v54[6] = v21;
        _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "ProcessSmcAccessory: soc:%d/%d\n", buf, 0xEu);
      }
      CFNumberRef v28 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v51);
      CFNumberRef v29 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&v51 + 4);
      CFNumberRef v30 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v50);
      CFNumberRef v31 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, (char *)&v50 + 4);
      CFNumberRef v32 = v31;
      CFNumberRef cfa = v28;
      if (!v28 || !v29 || !v30 || !v31)
      {
        v33 = 0;
        if (!cfa) {
          goto LABEL_58;
        }
        goto LABEL_57;
      }
      v33 = CFSetCreateMutable(kCFAllocatorDefault, 1, &kCFTypeSetCallBacks);
      if (v33)
      {
        if (BYTE1(v52)) {
          CFBooleanRef v34 = kCFBooleanTrue;
        }
        else {
          CFBooleanRef v34 = kCFBooleanFalse;
        }
        CFDictionarySetValue(v26, @"Show Charging UI", v34);
        if ((byte_10000C048 & 2) == 0)
        {
          CFDictionarySetValue(v26, @"Is Present", kCFBooleanTrue);
          if (BYTE1(v52)) {
            CFBooleanRef v35 = kCFBooleanTrue;
          }
          else {
            CFBooleanRef v35 = kCFBooleanFalse;
          }
          CFDictionarySetValue(v26, @"Is Charging", v35);
          CFDictionarySetValue(v26, @"Vendor ID", cfa);
          CFDictionarySetValue(v26, @"Product ID", v29);
          CFDictionarySetValue(v26, @"Max Capacity", v32);
          CFDictionarySetValue(v26, @"Current Capacity", v30);
          CFDictionarySetValue(v26, @"Transport Type", @"Inductive In-Band");
          if (v51 == 0x1399000005ACLL) {
            CFDictionarySetValue(v26, @"Name", @"MagSafe Battery Pack");
          }
          CFSetAddValue(v33, @"Current Capacity");
        }
        if ((_BYTE)v52) {
          CFStringRef v36 = @"AC Power";
        }
        else {
          CFStringRef v36 = @"Battery Power";
        }
        CFDictionarySetValue(v26, @"Power Source State", v36);
        v37 = (UInt8 *)qword_10000C090;
        if (qword_10000C090)
        {
          *(_DWORD *)(qword_10000C090 + 56) = 3;
          v37[28] = 1;
          Value = CFDictionaryGetValue(*((CFDictionaryRef *)v37 + 4), @"Power Source State");
          if (sub_100003FE4((uint64_t)v37, *((const __CFDictionary **)v37 + 4), v26, v33)
            || IOPSSetPowerSourceDetails())
          {
            uint64_t v6 = &selRef_BOOLValue;
            goto LABEL_57;
          }
          if (Value && CFEqual(Value, v36))
          {
            uint64_t v6 = &selRef_BOOLValue;
            if ((v42 & 1) == 0)
            {
LABEL_56:
              qword_10000C090 = (uint64_t)v37;
              byte_10000C048 |= 1u;
              goto LABEL_57;
            }
          }
          else
          {
            uint64_t v6 = &selRef_BOOLValue;
          }
LABEL_55:
          sub_100004798((uint64_t)v37, v36);
          goto LABEL_56;
        }
        v37 = sub_100003EE0();
        *((_DWORD *)v37 + 14) = 3;
        v37[28] = 1;
        if (!sub_100004668((uint64_t)v37, v26, v33))
        {
          v37[60] = sub_100002860((uint64_t)v37);
          v37[61] = sub_100002938((uint64_t)v37);
          goto LABEL_55;
        }
      }
LABEL_57:
      CFRelease(cfa);
LABEL_58:
      if (v29) {
        CFRelease(v29);
      }
      if (v30) {
        CFRelease(v30);
      }
      if (v32) {
        CFRelease(v32);
      }
      CFRelease(v26);
      if (v33) {
        CFRelease(v33);
      }
      goto LABEL_66;
    }
  }
  else
  {
    BOOL v40 = (byte_10000C048 & 0xFE) == 0;
    byte_10000C048 &= ~1u;
    if (v40)
    {
      sub_100005134(qword_10000C090);
      qword_10000C090 = 0;
    }
  }
LABEL_77:
}

void sub_100002560()
{
  IONotificationPortDestroy((IONotificationPortRef)qword_10000C058);
  if (dword_10000C068)
  {
    IOObjectRelease(dword_10000C068);
    dword_10000C068 = 0;
  }
  if (dword_10000C060)
  {
    IOObjectRelease(dword_10000C060);
    dword_10000C060 = 0;
  }
  int valuePtr = 0;
  CFNumberRef v0 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  sub_1000025D0(v0);
  exit(0);
}

CFNumberRef sub_1000025D0(const __CFNumber *result)
{
  int valuePtr = 0;
  if (result)
  {
    io_registry_entry_t v1 = result;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    v2 = qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v7 = valuePtr;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "adapter family %x\n", buf, 8u);
    }
    CFDictionaryRef v3 = IOServiceMatching("AppleSmartBattery");
    uint64_t result = (const __CFNumber *)IOServiceGetMatchingService(kIOMainPortDefault, v3);
    if (result)
    {
      io_object_t v4 = result;
      IORegistryEntrySetCFProperty((io_registry_entry_t)result, @"DownstreamAdapterFamily", v1);
      return (const __CFNumber *)IOObjectRelease(v4);
    }
  }
  return result;
}

uint64_t sub_1000026CC(io_registry_entry_t a1, const __CFDictionary *a2)
{
  CFArrayRef v3 = (const __CFArray *)IORegistryEntrySearchCFProperty(a1, "IOService", @"DeviceUsagePairs", kCFAllocatorDefault, 0);
  if (!v3) {
    return 0;
  }
  CFArrayRef v4 = v3;
  CFIndex Count = CFArrayGetCount(v3);
  if (Count < 1)
  {
    uint64_t v8 = 1;
  }
  else
  {
    CFIndex v6 = Count;
    CFIndex v7 = 0;
    uint64_t v8 = 1;
    do
    {
      uint64_t valuePtr = 0;
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v7);
      if (ValueAtIndex)
      {
        CFDictionaryRef v10 = ValueAtIndex;
        CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, @"DeviceUsagePage");
        CFNumberRef v12 = (const __CFNumber *)CFDictionaryGetValue(v10, @"DeviceUsage");
        if (Value) {
          CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4);
        }
        if (v12) {
          CFNumberGetValue(v12, kCFNumberIntType, &valuePtr);
        }
        if (valuePtr == 0xFF0000000014 || valuePtr == 0x8400000006)
        {
          uint64_t v8 = 2;
        }
        else if (valuePtr == 46 && HIDWORD(valuePtr) == 133)
        {
          uint64_t v8 = 3;
        }
        else
        {
          uint64_t v8 = v8;
        }
      }
      ++v7;
    }
    while (v6 != v7);
  }
  CFRelease(v4);
  if (a2)
  {
    io_registry_entry_t v14 = CFDictionaryGetValue(a2, @"Accessory Category");
    if (v14)
    {
      if (CFEqual(v14, @"Game Controller")) {
        return 4;
      }
      else {
        return v8;
      }
    }
  }
  return v8;
}

BOOL sub_100002860(uint64_t a1)
{
  uint64_t valuePtr = 0;
  if (a1 && (CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 32)) != 0)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v2, @"Vendor ID");
    if (Value) {
      CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4);
    }
    CFNumberRef v4 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), @"Product ID");
    if (v4) {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
    }
    BOOL result = 0;
    if (*(_DWORD *)(a1 + 56) == 3) {
      return valuePtr == 0x5AC00001395;
    }
  }
  else
  {
    BOOL result = os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_100006170();
      return 0;
    }
  }
  return result;
}

BOOL sub_100002938(uint64_t a1)
{
  uint64_t valuePtr = 0;
  if (a1 && (CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 32)) != 0)
  {
    CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(v2, @"Vendor ID");
    if (Value) {
      CFNumberGetValue(Value, kCFNumberIntType, (char *)&valuePtr + 4);
    }
    CFNumberRef v4 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), @"Product ID");
    if (v4) {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
    }
    BOOL result = 0;
    if (*(_DWORD *)(a1 + 56) == 3) {
      return valuePtr == 0x5AC00001398;
    }
  }
  else
  {
    BOOL result = os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_1000061E8();
      return 0;
    }
  }
  return result;
}

uint64_t sub_100002A10(const void *a1)
{
  io_connect_t connect = 0;
  if (!a1) {
    return 4;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFNumberGetTypeID()) {
    return 4;
  }
  int valuePtr = 0;
  CFNumberGetValue((CFNumberRef)a1, kCFNumberSInt32Type, &valuePtr);
  if (valuePtr > 199)
  {
    io_service_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
    if (ServiceWithPrimaryPort)
    {
      uint64_t v7 = IOServiceOpen(ServiceWithPrimaryPort, mach_task_self_, 0, &connect);
      if (v7)
      {
        uint64_t USBCurrentLimitBase = v7;
        uint64_t v8 = (void *)qword_10000C050;
        if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
          sub_1000062D4(v8, USBCurrentLimitBase);
        }
      }
      else
      {
        *(_DWORD *)buf = 0;
        uint64_t USBCurrentLimitBase = IOAccessoryManagerGetUSBCurrentLimitBase();
        if (!USBCurrentLimitBase) {
          uint64_t USBCurrentLimitBase = IOAccessoryManagerSetUSBCurrentOffset();
        }
        IOServiceClose(connect);
      }
    }
    else
    {
      uint64_t USBCurrentLimitBase = 3758097088;
      id v9 = qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
        sub_100006260(v9, v10, v11, v12, v13, v14, v15, v16);
      }
    }
  }
  else
  {
    CFArrayRef v3 = qword_10000C050;
    uint64_t USBCurrentLimitBase = 0;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = valuePtr;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ignoring battery case current limit < 200 (limit=%d)\n", buf, 8u);
      return 0;
    }
  }
  return USBCurrentLimitBase;
}

uint64_t sub_100002BCC(uint64_t a1, void *a2, int a3)
{
  int valuePtr = a3;
  if (!a1) {
    return 29;
  }
  CFNumberRef v4 = *(void **)(a1 + 16);
  if (!v4) {
    return 29;
  }
  if (!*v4) {
    return 29;
  }
  CFNumberRef v6 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt32Type, &valuePtr);
  if (!v6) {
    return 29;
  }
  CFNumberRef v7 = v6;
  values = v6;
  keys = a2;
  CFDictionaryRef v8 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFRelease(v7);
  if (!v8) {
    return 29;
  }
  uint64_t v9 = (*(uint64_t (**)(void, CFDictionaryRef))(**(void **)(a1 + 16) + 64))(*(void *)(a1 + 16), v8);
  CFRelease(v8);
  return v9;
}

uint64_t sub_100002CCC(uint64_t a1)
{
  if (!a1) {
    return 29;
  }
  CFTypeID v2 = *(void **)(a1 + 16);
  if (!v2 || !*v2) {
    return 29;
  }
  unsigned int v3 = time(0);
  srand(v3);
  for (uint64_t i = 0; i != 6; ++i)
  {
    int v5 = rand();
    if (i) {
      int v6 = 255;
    }
    else {
      int v6 = 63;
    }
    int v7 = v5 & v6;
    bytes[i] = v7;
  }
  if (v7)
  {
    if (v7 != 255) {
      goto LABEL_14;
    }
    char v8 = rand();
    uint64_t v9 = (5 - ((char)(v8 % 46 + (((v8 % 46) >> 12) & 7)) >> 3));
    int v10 = bytes[v9] ^ (1 << ((v8 % 46) & 7));
  }
  else
  {
    char v11 = rand();
    uint64_t v9 = (5 - ((char)(v11 % 46 + (((v11 % 46) >> 12) & 7)) >> 3));
    int v10 = bytes[v9] | (1 << ((v11 % 46) & 7));
  }
  bytes[v9] = v10;
LABEL_14:
  uint64_t v12 = qword_10000C050;
  if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG)) {
    sub_100006394(a1, bytes, v12);
  }
  CFDataRef v13 = CFDataCreate(kCFAllocatorDefault, bytes, 6);
  if (!v13 && os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
    sub_100006360();
  }
  values = v13;
  keys = @"Set Address";
  CFDictionaryRef v14 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFRelease(v13);
  if (!v14) {
    return 29;
  }
  uint64_t v15 = (*(uint64_t (**)(void, CFDictionaryRef))(**(void **)(a1 + 16) + 64))(*(void *)(a1 + 16), v14);
  CFRelease(v14);
  return v15;
}

CFNumberRef sub_100002F28(const __CFNumber *result, io_registry_entry_t entry, int a3)
{
  if (a3 == -536723200)
  {
    uint64_t v4 = (uint64_t)result;
    uint64_t valuePtr = 0;
    unsigned int v15 = 0;
    CFNumberRef v5 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", @"AppleRawCurrentCapacity", kCFAllocatorDefault, 0);
    CFNumberRef v6 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", @"AppleRawMaxCapacity", kCFAllocatorDefault, 0);
    if (v5) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      CFNumberRef v8 = v6;
      CFNumberGetValue(v5, kCFNumberSInt32Type, (char *)&valuePtr + 4);
      CFNumberGetValue(v8, kCFNumberSInt32Type, &valuePtr);
      int v9 = valuePtr;
      int v10 = HIDWORD(valuePtr);
      CFRelease(v5);
      CFRelease(v8);
      if ((int)valuePtr >= 1)
      {
        char v11 = qword_10000C050;
        if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          int v18 = 100 * v10 / v9;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sending Current State of Charge: %d%%\n", buf, 8u);
        }
        sub_100002BCC(v4, @"Send Current State of Charge", 100 * v10 / v9);
      }
    }
    CFNumberRef v12 = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", @"VirtualTemperature", kCFAllocatorDefault, 0);
    if (v12
      || (BOOL result = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", @"Temperature", kCFAllocatorDefault, 0), (v12 = result) != 0))
    {
      CFNumberGetValue(v12, kCFNumberSInt32Type, &v15);
      CFRelease(v12);
      int v13 = v15 / 0xA + 2732;
      CFDictionaryRef v14 = qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v18 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Sending Current Temperature: %d dK\n", buf, 8u);
      }
      return (const __CFNumber *)sub_100002BCC(v4, @"Send Current Temperature", v13);
    }
  }
  return result;
}

void sub_100003198(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == -469794795)
  {
    if (IOAccessoryManagerGetUSBCurrentLimit())
    {
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
        sub_100006494();
      }
    }
    else if (sub_100002BCC(a1, @"Set Current Limit", 0) {
           && os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
    }
    {
      sub_100006460();
    }
  }
}

CFNumberRef sub_100003258(uint64_t a1, io_registry_entry_t entry)
{
  CFNumberRef result = (const __CFNumber *)IORegistryEntrySearchCFProperty(entry, "IOService", @"Voltage", kCFAllocatorDefault, 0);
  if (result)
  {
    CFNumberRef v4 = result;
    int valuePtr = 0;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v4);
    return (const __CFNumber *)sub_100002BCC(a1, @"Set Required Voltage", valuePtr + 150);
  }
  return result;
}

CFNumberRef sub_1000032E4(uint64_t a1, uint64_t a2)
{
  io_registry_entry_t v3 = sub_100001C34();
  CFNumberRef result = (const __CFNumber *)IORegistryEntryCreateCFProperty(v3, @"AverageChargingCurrent", kCFAllocatorDefault, 0);
  if (result)
  {
    CFNumberRef v5 = result;
    int valuePtr = 0;
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v5);
    CFNumberRef v6 = qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v9 = valuePtr;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Sending Average Charging Current: %d mA\n", buf, 8u);
    }
    return (const __CFNumber *)sub_100002BCC(a2, @"Send Average Charging Current", valuePtr);
  }
  return result;
}

uint64_t sub_1000033DC(int a1, unsigned __int16 a2, char *buffer)
{
  uint64_t v4 = 3758097084;
  CFTypeRef v5 = IOCFUnserialize(buffer, kCFAllocatorDefault, 0, 0);
  if (v5)
  {
    CFNumberRef v6 = v5;
    uint64_t v4 = 3758097090;
    if (qword_10000C070 && CFArrayGetCount((CFArrayRef)qword_10000C070) > a2)
    {
      CFDictionaryRef ValueAtIndex = (__CFData *)CFArrayGetValueAtIndex((CFArrayRef)qword_10000C070, a2);
      MutableBytePtr = CFDataGetMutableBytePtr(ValueAtIndex);
      if (MutableBytePtr)
      {
        uint64_t v9 = *((void *)MutableBytePtr + 2);
        uint64_t v4 = 3758097084;
        if (v9) {
          uint64_t v4 = (*(uint64_t (**)(uint64_t, const void *))(*(void *)v9 + 64))(v9, v6);
        }
      }
      else
      {
        uint64_t v4 = 3758097084;
      }
    }
    CFRelease(v6);
  }
  return v4;
}

uint64_t sub_1000034A0(uint64_t a1, unsigned __int16 a2, vm_address_t *a3, size_t *a4)
{
  uint64_t v4 = 3758097090;
  if (a3)
  {
    if (a4)
    {
      if (qword_10000C070)
      {
        CFIndex v7 = a2;
        if (CFArrayGetCount((CFArrayRef)qword_10000C070) > a2)
        {
          CFDictionaryRef ValueAtIndex = (__CFData *)CFArrayGetValueAtIndex((CFArrayRef)qword_10000C070, v7);
          MutableBytePtr = CFDataGetMutableBytePtr(ValueAtIndex);
          if (MutableBytePtr)
          {
            uint64_t v10 = *((void *)MutableBytePtr + 2);
            if (v10)
            {
              CFTypeRef object = 0;
              uint64_t v4 = 3758097084;
              if (!(*(unsigned int (**)(uint64_t, CFTypeRef *))(*(void *)v10 + 48))(v10, &object)
                && object != 0)
              {
                CFDataRef v12 = IOCFSerialize(object, 0);
                if (v12)
                {
                  CFDataRef v13 = v12;
                  vm_size_t Length = CFDataGetLength(v12);
                  *a4 = Length;
                  uint64_t v4 = vm_allocate(mach_task_self_, a3, Length, 1);
                  if (!v4)
                  {
                    unsigned int v15 = (void *)*a3;
                    if (v15)
                    {
                      BytePtr = CFDataGetBytePtr(v13);
                      memcpy(v15, BytePtr, *a4);
                    }
                  }
                  CFRelease(v13);
                }
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t sub_1000035B8(uint64_t a1, unsigned __int16 a2, vm_address_t *a3, size_t *a4)
{
  uint64_t v4 = 3758097090;
  if (a3)
  {
    if (a4)
    {
      if (qword_10000C070)
      {
        CFIndex v7 = a2;
        if (CFArrayGetCount((CFArrayRef)qword_10000C070) > a2)
        {
          CFDictionaryRef ValueAtIndex = (__CFData *)CFArrayGetValueAtIndex((CFArrayRef)qword_10000C070, v7);
          MutableBytePtr = CFDataGetMutableBytePtr(ValueAtIndex);
          if (MutableBytePtr)
          {
            uint64_t v10 = *((void *)MutableBytePtr + 2);
            if (v10)
            {
              CFTypeRef object = 0;
              uint64_t v4 = 3758097084;
              if (!(*(unsigned int (**)(uint64_t, CFTypeRef *))(*(void *)v10 + 40))(v10, &object)
                && object != 0)
              {
                CFDataRef v12 = IOCFSerialize(object, 0);
                if (v12)
                {
                  CFDataRef v13 = v12;
                  vm_size_t Length = CFDataGetLength(v12);
                  *a4 = Length;
                  uint64_t v4 = vm_allocate(mach_task_self_, a3, Length, 1);
                  if (!v4)
                  {
                    unsigned int v15 = (void *)*a3;
                    if (v15)
                    {
                      BytePtr = CFDataGetBytePtr(v13);
                      memcpy(v15, BytePtr, *a4);
                    }
                  }
                  CFRelease(v13);
                }
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

void sub_1000036D0(int a1, io_iterator_t iterator)
{
  kern_return_t v50;
  char v51;
  NSObject *v52;
  int v53;
  uint8_t v54;
  unsigned char v55[15];
  uint8_t v56;
  unsigned char v57[15];
  id v58;
  id v59;
  SInt32 theScore;
  uint64_t v61;
  IOCFPlugInInterface **theInterface;
  CFTypeRef cf;
  __CFRunLoopSource *v64;
  CFSetRef v65;
  CFDictionaryRef v66;
  CFDictionaryRef v67;
  uint8_t buf[4];
  int v69;
  __int16 v70;
  int v71;

  v66 = 0;
  v67 = 0;
  v65 = 0;
  unsigned __int16 cf = 0;
  v64 = 0;
  v61 = 0;
  theInterface = 0;
  theScore = 0;
  io_object_t v3 = IOIteratorNext(iterator);
  if (v3)
  {
    io_service_t v4 = v3;
    uint64_t v5 = 0;
    id v6 = 0;
    CFStringRef v7 = kCFRunLoopDefaultMode;
    while (1)
    {
      CFUUIDRef v8 = CFUUIDGetConstantUUIDWithBytes(0, 0x40u, 0xA5u, 0x7Au, 0x4Eu, 0x26u, 0xA0u, 0x11u, 0xD8u, 0x92u, 0x95u, 0, 0xAu, 0x95u, 0x8Au, 0x2Cu, 0x78u);
      CFUUIDRef v9 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
      if (!IOCreatePlugInInterfaceForService(v4, v8, v9, &theInterface, &theScore)) {
        break;
      }
LABEL_71:
      IOObjectRelease(v4);
      io_service_t v4 = IOIteratorNext(iterator);
      if (!v4)
      {

        return;
      }
    }
    uint64_t v10 = theInterface;
    QueryInterface = (*theInterface)->QueryInterface;
    CFUUIDRef v12 = CFUUIDGetConstantUUIDWithBytes(0, 0xE6u, 0xEu, 7u, 0x99u, 0x9Au, 0xA6u, 0x49u, 0xDFu, 0xB5u, 0x5Bu, 0xA5u, 0xC9u, 0x4Bu, 0xA0u, 0x7Au, 0x4Au);
    CFUUIDBytes v13 = CFUUIDGetUUIDBytes(v12);
    if (((unsigned int (*)(IOCFPlugInInterface **, void, void, uint64_t *))QueryInterface)(v10, *(void *)&v13.byte0, *(void *)&v13.byte8, &v61))
    {
      BOOL v14 = 1;
    }
    else
    {
      BOOL v14 = v61 == 0;
    }
    if (v14)
    {
      unsigned int v15 = theInterface;
      uint64_t v16 = (*theInterface)->QueryInterface;
      CFUUIDRef v17 = CFUUIDGetConstantUUIDWithBytes(0, 0x63u, 0xF8u, 0xBFu, 0xC4u, 0x26u, 0xA0u, 0x11u, 0xD8u, 0x88u, 0xB4u, 0, 0xAu, 0x95u, 0x8Au, 0x2Cu, 0x78u);
      CFUUIDBytes v18 = CFUUIDGetUUIDBytes(v17);
      if (((unsigned int (*)(IOCFPlugInInterface **, void, void, uint64_t *))v16)(v15, *(void *)&v18.byte0, *(void *)&v18.byte8, &v61))
      {
        goto LABEL_30;
      }
    }
    else
    {
      if ((*(unsigned int (**)(void))(*(void *)v61 + 72))()) {
        BOOL v20 = 1;
      }
      else {
        BOOL v20 = cf == 0;
      }
      if (v20)
      {
LABEL_30:
        if (!v5)
        {
LABEL_31:
          if (v61)
          {
            (*(void (**)(uint64_t))(*(void *)v61 + 24))(v61);
            v61 = 0;
          }
          v33 = v64;
          if (v64)
          {
            Current = CFRunLoopGetCurrent();
            CFRunLoopRemoveSource(Current, v33, v7);
            CFRelease(v33);
            v64 = 0;
          }
          if (v6)
          {
            CFBooleanRef v35 = CFRunLoopGetCurrent();
            CFRunLoopRemoveTimer(v35, (CFRunLoopTimerRef)v6, v7);

            id v6 = 0;
          }
          uint64_t v5 = 0;
          goto LABEL_70;
        }
LABEL_69:
        sub_100005134(v5);
        uint64_t v5 = 0;
        v61 = 0;
        goto LABEL_70;
      }
      CFTypeID v21 = CFGetTypeID(cf);
      CFTypeID TypeID = CFArrayGetTypeID();
      unsigned __int8 v23 = (void *)cf;
      if (v21 == TypeID)
      {
        uint64_t v24 = (uint64_t)[(id)cf count];
        if (v24 >= 1)
        {
          uint64_t v25 = v24;
          CFStringRef v26 = v7;
          for (uint64_t i = 0; i != v25; ++i)
          {
            CFNumberRef v28 = v6;
            id v29 = [v23 objectAtIndex:i];
            v59 = v6;
            sub_100003E70(v29, &v59, &v64);
            id v6 = v59;
          }
          CFStringRef v7 = v26;
        }
      }
      else
      {
        v58 = v6;
        sub_100003E70((void *)cf, &v58, &v64);
        unsigned __int8 v23 = v6;
        id v6 = v58;
      }

      CFNumberRef v30 = v64;
      if (v64)
      {
        CFNumberRef v31 = CFRunLoopGetCurrent();
        CFRunLoopAddSource(v31, v30, v7);
      }
      if (v6)
      {
        CFNumberRef v32 = CFRunLoopGetCurrent();
        CFRunLoopAddTimer(v32, (CFRunLoopTimerRef)v6, v7);
      }
    }
    if (!v61 || (*(unsigned int (**)(uint64_t, const __CFDictionary **))(*(void *)v61 + 32))(v61, &v67)) {
      goto LABEL_30;
    }
    CFNumberRef Value = CFDictionaryGetValue(v67, @"Transport Type");
    CFTypeID v37 = CFStringGetTypeID();
    if (Value && CFGetTypeID(Value) == v37 && CFEqual(Value, @"Inductive In-Band"))
    {
      v38 = qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG)) {
        sub_100006508(&v56, v57, v38);
      }
      uint64_t v5 = qword_10000C090;
      char v39 = 1;
      int v40 = 1;
      if (qword_10000C090) {
        goto LABEL_48;
      }
    }
    else
    {
      char v39 = 0;
    }
    long long v41 = sub_100003EE0();
    if (!v41) {
      goto LABEL_31;
    }
    uint64_t v5 = (uint64_t)v41;
    int v40 = 0;
LABEL_48:
    *(void *)(v5 + 16) = v61;
    *(void *)(v5 + 40) = v64;
    objc_storeStrong((id *)(v5 + 48), v6);
    *(unsigned char *)(v5 + 28) = 1;
    int v42 = sub_1000026CC(v4, v67);
    *(_DWORD *)(v5 + 56) = v42;
    if (v42 && !(*(unsigned int (**)(uint64_t, const __CFSet **))(*(void *)v61 + 40))(v61, &v65))
    {
      if (!v40)
      {
        int v43 = sub_100004668(v5, v67, v65);
LABEL_55:
        int v44 = v43;
        *(unsigned char *)(v5 + 60) = sub_100002860(v5);
        *(unsigned char *)(v5 + 61) = sub_100002938(v5);
        if (!v44)
        {
          if (*(_DWORD *)(v5 + 56) == 3)
          {
            if ((v40 & 1) == 0)
            {
              *(unsigned char *)(v5 + 72) = 0;
              sub_100004798(v5, @"Battery Power");
            }
            io_service_t v45 = sub_100001C34();
            if (v45) {
              IOServiceAddInterestNotification((IONotificationPortRef)qword_10000C058, v45, "IOGeneralInterest", (IOServiceInterestCallback)sub_100002F28, (void *)v5, (io_object_t *)(v5 + 80));
            }
            int v46 = sub_100002CCC(v5);
            if (v46)
            {
              int v47 = v46;
              v48 = qword_10000C050;
              if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
              {
                v53 = *(_DWORD *)(v5 + 24);
                *(_DWORD *)buf = 67109376;
                v69 = v53;
                v70 = 1024;
                v71 = v47;
                _os_log_error_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "failed to send address to power source %d (ret=0x%X)\n", buf, 0xEu);
              }
            }
          }
          if (!(*(unsigned int (**)(uint64_t, CFDictionaryRef *))(*(void *)v61 + 48))(v61, &v66))
          {
            sub_100004DD4(v5, v66);
            (*(void (**)(uint64_t, void (*)(int, int, uint64_t, int, CFDictionaryRef), void, uint64_t))(*(void *)v61 + 56))(v61, sub_10000503C, 0, v5);
            unint64_t v50 = IOServiceAddInterestNotification((IONotificationPortRef)qword_10000C058, v4, "IOGeneralInterest", (IOServiceInterestCallback)sub_100005048, (void *)v5, (io_object_t *)(v5 + 8));
            uint64_t v51 = v39 ^ 1;
            if (v50) {
              uint64_t v51 = 1;
            }
            if ((v51 & 1) == 0)
            {
              int v52 = qword_10000C050;
              if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG)) {
                sub_1000064C8(&v54, v55, v52);
              }
              qword_10000C090 = v5;
              byte_10000C048 |= 2u;
              goto LABEL_70;
            }
            if (!v50)
            {
LABEL_70:
              ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
              goto LABEL_71;
            }
          }
        }
        goto LABEL_65;
      }
      if (!sub_100003FE4(v5, *(const __CFDictionary **)(v5 + 32), v67, v65))
      {
        int v43 = IOPSSetPowerSourceDetails();
        goto LABEL_55;
      }
    }
LABEL_65:
    if (byte_10000C048) {
      char v49 = v39;
    }
    else {
      char v49 = 0;
    }
    if (v49) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
}

id sub_100003E70(void *a1, void *a2, void *a3)
{
  CFTypeID v6 = CFGetTypeID(a1);
  if (v6 == CFRunLoopTimerGetTypeID())
  {
    id result = a1;
    a3 = a2;
  }
  else
  {
    CFTypeID v8 = CFGetTypeID(a1);
    id result = (id)CFRunLoopSourceGetTypeID();
    if ((id)v8 != result) {
      return result;
    }
  }
  *a3 = a1;
  return result;
}

UInt8 *sub_100003EE0()
{
  CFArrayRef v0 = (const __CFArray *)qword_10000C070;
  if (qword_10000C070
    || (CFArrayRef v0 = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks), (qword_10000C070 = (uint64_t)v0) != 0))
  {
    CFIndex Count = CFArrayGetCount(v0);
    if (Count >= 1)
    {
      CFIndex v2 = Count;
      CFIndex v3 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = (__CFData *)CFArrayGetValueAtIndex((CFArrayRef)qword_10000C070, v3);
        if (ValueAtIndex)
        {
          MutableBytePtr = CFDataGetMutableBytePtr(ValueAtIndex);
          if (MutableBytePtr)
          {
            CFTypeID v6 = MutableBytePtr;
            if (!MutableBytePtr[28]) {
              break;
            }
          }
        }
        if (v2 == ++v3) {
          goto LABEL_11;
        }
      }
      LODWORD(v2) = v3;
LABEL_16:
      *((_DWORD *)v6 + 6) = v2;
      return v6;
    }
    LODWORD(v2) = 0;
LABEL_11:
    CFMutableDictionaryRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 96);
    if (Mutable)
    {
      CFTypeID v8 = Mutable;
      CFTypeID v6 = CFDataGetMutableBytePtr(Mutable);
      *(_OWORD *)CFTypeID v6 = 0u;
      *((_OWORD *)v6 + 1) = 0u;
      *((_OWORD *)v6 + 2) = 0u;
      *((_OWORD *)v6 + 3) = 0u;
      *((_OWORD *)v6 + 4) = 0u;
      *((_OWORD *)v6 + 5) = 0u;
      CFArrayAppendValue((CFMutableArrayRef)qword_10000C070, v8);
      CFRelease(v8);
      if (!v6) {
        return v6;
      }
      goto LABEL_16;
    }
  }
  return 0;
}

uint64_t sub_100003FE4(uint64_t a1, const __CFDictionary *a2, CFDictionaryRef theDict, const __CFSet *a4)
{
  int valuePtr = 0;
  value = 0;
  uint64_t result = 3758097084;
  if (!a2 || !theDict || !a4) {
    return result;
  }
  CFStringRef v9 = (const __CFString *)CFDictionaryGetValue(theDict, @"Name");
  if (!v9)
  {
    if (CFDictionaryContainsKey(a2, @"Name")) {
      goto LABEL_19;
    }
    CFStringRef v9 = @"Generic UPS";
  }
  if (sub_100005218() && sub_1000052E8())
  {
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG)) {
      sub_1000065F4();
    }
    uint64_t v10 = (uint64_t (*)(const __CFString *))sub_1000052E8();
    if (!v10) {
      sub_100006548();
    }
    char v11 = (const void *)v10(v9);
    if (v11)
    {
      CFUUIDRef v12 = v11;
      CFDictionarySetValue(a2, @"Name", v11);
      CFRelease(v12);
      goto LABEL_19;
    }
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
      sub_1000065C0();
    }
  }
  else
  {
    CFUUIDBytes v13 = qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "CoreAccessories.framework not loaded!!\n", buf, 2u);
    }
  }
  CFDictionarySetValue(a2, @"Name", v9);
LABEL_19:
  CFStringRef v14 = (const __CFString *)CFDictionaryGetValue(theDict, @"Transport Type");
  if (v14)
  {
LABEL_20:
    CFDictionarySetValue(a2, @"Transport Type", v14);
    goto LABEL_22;
  }
  if (!CFDictionaryContainsKey(a2, @"Transport Type"))
  {
    CFStringRef v14 = @"UNK";
    goto LABEL_20;
  }
LABEL_22:
  unsigned int v15 = CFDictionaryGetValue(theDict, @"Vendor ID");
  uint64_t v16 = CFDictionaryGetValue(theDict, @"Product ID");
  CFUUIDRef v17 = CFDictionaryGetValue(theDict, @"Model Number");
  CFDictionarySetValue(a2, @"Is Present", kCFBooleanTrue);
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    CFDictionarySetValue(a2, @"Is Charging", kCFBooleanTrue);
    CFStringRef v18 = @"AC Power";
LABEL_29:
    CFDictionarySetValue(a2, @"Power Source State", v18);
    goto LABEL_30;
  }
  CFBooleanRef v19 = (const __CFBoolean *)CFDictionaryGetValue(theDict, @"Is Charging");
  if (v19)
  {
    CFBooleanRef v20 = v19;
LABEL_26:
    CFDictionarySetValue(a2, @"Is Charging", v20);
    goto LABEL_28;
  }
  if (!CFDictionaryContainsKey(a2, @"Is Charging"))
  {
    CFBooleanRef v20 = kCFBooleanFalse;
    goto LABEL_26;
  }
LABEL_28:
  CFStringRef v18 = (const __CFString *)CFDictionaryGetValue(theDict, @"Power Source State");
  if (v18) {
    goto LABEL_29;
  }
  if (!CFDictionaryContainsKey(a2, @"Power Source State"))
  {
    CFStringRef v18 = @"Battery Power";
    goto LABEL_29;
  }
LABEL_30:
  if (v15) {
    CFDictionarySetValue(a2, @"Vendor ID", v15);
  }
  if (v16) {
    CFDictionarySetValue(a2, @"Product ID", v16);
  }
  if (v17) {
    CFDictionarySetValue(a2, @"Model Number", v17);
  }
  *(_DWORD *)buf = *(unsigned __int16 *)(a1 + 24) | (getpid() << 16);
  CFNumberRef v21 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, buf);
  CFDictionarySetValue(a2, @"Power Source ID", v21);
  CFRelease(v21);
  unsigned int v22 = CFDictionaryGetValue(theDict, @"Max Capacity");
  if (v22)
  {
    CFDictionarySetValue(a2, @"Max Capacity", v22);
  }
  else if (!CFDictionaryContainsKey(a2, @"Max Capacity"))
  {
    if ((*(_DWORD *)(a1 + 56) - 3) >= 2) {
      int v23 = 100;
    }
    else {
      int v23 = 0;
    }
    int valuePtr = v23;
    CFNumberRef v24 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(a2, @"Max Capacity", v24);
    CFRelease(v24);
  }
  uint64_t v25 = CFDictionaryGetValue(theDict, @"Show Charging UI");
  if (v25) {
    CFDictionarySetValue(a2, @"Show Charging UI", v25);
  }
  if (CFSetContainsValue(a4, @"Current Capacity"))
  {
    if (CFDictionaryContainsKey(theDict, @"Current Capacity"))
    {
      CFStringRef v26 = CFDictionaryGetValue(theDict, @"Current Capacity");
      CFDictionarySetValue(a2, @"Current Capacity", v26);
    }
    else if (!CFDictionaryContainsKey(a2, @"Current Capacity"))
    {
      int valuePtr = 0;
      CFNumberRef v27 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
      CFDictionarySetValue(a2, @"Current Capacity", v27);
      CFRelease(v27);
    }
  }
  if (CFSetContainsValue(a4, @"Time to Empty"))
  {
    int valuePtr = 100;
    CFNumberRef v28 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(a2, @"Time to Empty", v28);
    CFRelease(v28);
  }
  if (CFSetContainsValue(a4, @"Voltage"))
  {
    int valuePtr = 130;
    CFNumberRef v29 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(a2, @"Voltage", v29);
    CFRelease(v29);
  }
  if (CFSetContainsValue(a4, @"Current"))
  {
    int valuePtr = 1;
    CFNumberRef v30 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(a2, @"Current", v30);
    CFRelease(v30);
  }
  int v31 = *(_DWORD *)(a1 + 56);
  if (v31 == 4) {
    goto LABEL_59;
  }
  if (v31 != 3)
  {
    if (v31 != 2)
    {
      CFStringRef v32 = @"Type";
      CFStringRef v33 = @"UPS";
      goto LABEL_62;
    }
LABEL_59:
    CFStringRef v32 = @"Type";
    CFStringRef v33 = @"Accessory Source";
LABEL_62:
    CFBooleanRef v34 = a2;
    goto LABEL_63;
  }
  CFDictionarySetValue(a2, @"Type", @"Battery Case");
  CFStringRef v32 = @"Accessory Category";
  CFBooleanRef v34 = a2;
  CFStringRef v33 = @"Battery Case";
LABEL_63:
  CFDictionarySetValue(v34, v32, v33);
  if (CFDictionaryGetValueIfPresent(theDict, @"Accessory Identifier", (const void **)&value)) {
    CFDictionarySetValue(a2, @"Accessory Identifier", value);
  }
  uint64_t result = CFDictionaryGetValueIfPresent(theDict, @"Accessory Category", (const void **)&value);
  if (result)
  {
    CFDictionarySetValue(a2, @"Accessory Category", value);
    return 0;
  }
  return result;
}

uint64_t sub_100004668(uint64_t a1, const __CFDictionary *a2, const __CFSet *a3)
{
  uint64_t v3 = 3758097084;
  if (a1 && a2 && a3)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (Mutable) {
      sub_100003FE4(a1, Mutable, a2, a3);
    }
    snprintf(__str, 0x14uLL, "/UPS%d", *(_DWORD *)(a1 + 24));
    uint64_t v8 = IOPSCreatePowerSource();
    ++dword_10000C064;
    if (v8)
    {
      uint64_t v3 = v8;
      *(void *)a1 = 0;
    }
    else
    {
      uint64_t v3 = IOPSSetPowerSourceDetails();
      if (v3)
      {
        if (Mutable) {
          CFRelease(Mutable);
        }
      }
      else
      {
        *(void *)(a1 + 32) = Mutable;
      }
    }
  }
  return v3;
}

void sub_100004798(uint64_t a1, CFTypeRef cf1)
{
  int v3 = CFEqual(cf1, @"AC Power");
  int v31 = 0;
  if (*(unsigned char *)(a1 + 60))
  {
    LODWORD(values) = 0;
    LODWORD(cf) = 0;
    if (sub_1000054AC((io_service_t *)&values, (io_connect_t *)&cf)) {
      return;
    }
    if (v3)
    {
      IOPMAssertionID AssertionID = 0;
      IOPMAssertionCreateWithName(@"DisableInflow", 0xFFu, @"com.apple.ioupsd.battery_case_disable_inflow", &AssertionID);
      *(unsigned char *)(a1 + 72) = 1;
      io_connect_t v4 = cf;
      IOAccessoryManagerSetUSBPreventSourceDetection();
      IOAccessoryManagerRestoreUSBCurrentLimitBase();
      IOAccessoryManagerSetUSBCurrentOffset();
      int v5 = -21;
      io_object_t v6 = values;
      while (!__CFADD__(v5++, 1))
      {
        usleep(0x3D090u);
        IOAccessoryManagerGetUSBCurrentLimitBase();
        uint64_t v8 = qword_10000C050;
        if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.version) = 67109120;
          HIDWORD(buf.version) = v31;
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Battery Case AC Present: iLim = %d mA\n", (uint8_t *)&buf, 8u);
        }
        if (v31)
        {
          CFNumberRef v21 = qword_10000C050;
          if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf.version) = 67109120;
            HIDWORD(buf.version) = v31;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Initial downstream charger iLim: %d mA\n", (uint8_t *)&buf, 8u);
          }
          io_object_t v6 = values;
          goto LABEL_35;
        }
      }
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
        sub_10000677C();
      }
LABEL_35:
      IOAccessoryManagerSetUSBPowerIgnore();
      sub_100002BCC(a1, @"Set Current Limit", v31);
      IOPMAssertionRelease(AssertionID);
      IOPMAssertionID AssertionID = 0;
      IOObjectRetain(v6);
      IOServiceAddInterestNotification((IONotificationPortRef)qword_10000C058, v6, "IOGeneralInterest", (IOServiceInterestCallback)sub_100003198, (void *)a1, (io_object_t *)(a1 + 84));
      io_service_t v23 = sub_100001C34();
      IOServiceAddInterestNotification((IONotificationPortRef)qword_10000C058, v23, "IOGeneralInterest", (IOServiceInterestCallback)sub_100003258, (void *)a1, (io_object_t *)(a1 + 88));
    }
    else
    {
      io_connect_t v4 = cf;
      IOAccessoryManagerSetUSBPreventSourceDetection();
      IOAccessoryManagerSetUSBPowerIgnore();
      IOAccessoryManagerSetUSBCurrentLimitBase();
      *(unsigned char *)(a1 + 72) = 0;
      io_object_t v19 = *(_DWORD *)(a1 + 84);
      if (v19)
      {
        IOObjectRelease(v19);
        *(_DWORD *)(a1 + 84) = 0;
      }
      io_object_t v20 = *(_DWORD *)(a1 + 88);
      if (v20)
      {
        IOObjectRelease(v20);
        *(_DWORD *)(a1 + 88) = 0;
      }
    }
    IOServiceClose(v4);
    goto LABEL_37;
  }
  CFNumberRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), @"Transport Type");
  if (!CFEqual(Value, @"Inductive In-Band"))
  {
    LODWORD(values) = 0;
    if (sub_1000054AC((io_service_t *)&buf, (io_connect_t *)&values)) {
      return;
    }
    io_connect_t v18 = values;
    IOAccessoryManagerSetUSBPowerIgnore();
    IOServiceClose(v18);
    goto LABEL_51;
  }
  values = 0;
  CFBooleanRef v34 = 0;
  buf.version = (CFIndex)@"Dock";
  buf.info = @"Mask";
  IOPMAssertionID AssertionID = 2;
  CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &AssertionID);
  char v11 = &kCFBooleanFalse;
  if (!v3) {
    char v11 = &kCFBooleanTrue;
  }
  CFBooleanRef v12 = *v11;
  values = v10;
  CFBooleanRef v34 = v12;
  CFTypeRef cf = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&buf, (const void **)&values, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!cf)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
      sub_100006668();
    }
    goto LABEL_37;
  }
  CFArrayRef v13 = CFArrayCreate(kCFAllocatorDefault, &cf, 1, &kCFTypeArrayCallBacks);
  if (!v13)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
      sub_10000669C();
    }
    goto LABEL_37;
  }
  CFArrayRef v14 = v13;
  CFRelease(cf);
  CFRelease(values);
  buf.version = (CFIndex)@"DockMask";
  values = v14;
  CFTypeRef cf = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&buf, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!cf)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
      sub_100006668();
    }
    goto LABEL_37;
  }
  CFRelease(v14);
  io_registry_entry_t v15 = sub_100001C34();
  if (v15)
  {
    io_registry_entry_t v16 = v15;
    CFUUIDRef v17 = qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEBUG)) {
      sub_100006704(v3, v17);
    }
    if (IORegistryEntrySetCFProperties(v16, cf))
    {
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
        sub_1000066D0();
      }
      goto LABEL_37;
    }
    CFRelease(cf);
LABEL_51:
    *(unsigned char *)(a1 + 72) = v3;
    CFNumberRef v28 = qword_10000C050;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.version) = 67109120;
      HIDWORD(buf.version) = v3;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "AC present %d\n", (uint8_t *)&buf, 8u);
    }
  }
LABEL_37:
  if (*(unsigned char *)(a1 + 61))
  {
    if (v3)
    {
      buf.version = 0;
      memset(&buf.retain, 0, 24);
      buf.info = (void *)a1;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFRunLoopTimerRef v25 = CFRunLoopTimerCreate(kCFAllocatorDefault, Current + 5.0, 5.0, 0, 0, (CFRunLoopTimerCallBack)sub_1000032E4, &buf);
      *(void *)(a1 + 64) = v25;
      if (v25)
      {
        CFStringRef v26 = CFRunLoopGetCurrent();
        CFRunLoopAddTimer(v26, *(CFRunLoopTimerRef *)(a1 + 64), kCFRunLoopDefaultMode);
      }
      else if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR))
      {
        sub_100006634();
      }
    }
    else if (*(void *)(a1 + 64))
    {
      CFNumberRef v27 = CFRunLoopGetCurrent();
      CFRunLoopRemoveTimer(v27, *(CFRunLoopTimerRef *)(a1 + 64), kCFRunLoopDefaultMode);
      CFRelease(*(CFTypeRef *)(a1 + 64));
      *(void *)(a1 + 64) = 0;
    }
  }
}

void sub_100004DD4(uint64_t a1, CFDictionaryRef theDict)
{
  if (a1)
  {
    if (theDict)
    {
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, theDict);
      if (MutableCopy)
      {
        io_connect_t v4 = MutableCopy;
        if (*(_DWORD *)(a1 + 56) == 3
          && *(unsigned char *)(a1 + 60)
          && !*(unsigned char *)(a1 + 72)
          && !CFDictionaryGetValue(MutableCopy, @"Battery Case Available Current"))
        {
          CFNumberRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), @"Battery Case Available Current");
          CFDictionarySetValue(v4, @"Battery Case Available Current", Value);
        }
        CFIndex Count = CFDictionaryGetCount(v4);
        if (Count)
        {
          uint64_t v7 = Count;
          size_t v8 = 8 * Count;
          CFStringRef v9 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
          CFNumberRef v10 = (const void **)malloc_type_malloc(v8, 0xC0040B8AA526DuLL);
          CFDictionaryGetKeysAndValues(v4, v9, v10);
          if (v7 >= 1)
          {
            char v11 = v9;
            CFBooleanRef v12 = (const __CFNumber **)v10;
            do
            {
              if (CFEqual(*v11, @"FamilyCode") && *(_DWORD *)(a1 + 56) == 3)
              {
                CFArrayRef v13 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), *v11);
                if (!v13 || !CFEqual(v13, *v12)) {
                  sub_1000025D0(*v12);
                }
              }
              else if (CFEqual(*v11, @"Power Source State") && *(_DWORD *)(a1 + 56) == 3)
              {
                CFArrayRef v14 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), *v11);
                if (v14 && !CFEqual(v14, *v12)) {
                  sub_100004798(a1, *v12);
                }
              }
              else if (CFEqual(*v11, @"Battery Case Available Current") {
                     && *(_DWORD *)(a1 + 56) == 3
              }
                     && *(unsigned char *)(a1 + 60)
                     && !*(unsigned char *)(a1 + 72))
              {
                sub_100002A10(*v12);
              }
              io_registry_entry_t v16 = *v11++;
              io_registry_entry_t v15 = v16;
              CFNumberRef v17 = *v12++;
              CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), v15, v17);
              --v7;
            }
            while (v7);
          }
          free(v9);
          free(v10);
          if (IOPSSetPowerSourceDetails())
          {
            if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
              sub_1000067B0();
            }
          }
        }
        CFRelease(v4);
      }
    }
  }
}

void sub_10000503C(int a1, int a2, uint64_t a3, int a4, CFDictionaryRef theDict)
{
}

void sub_100005048(uint64_t a1, uint64_t a2, int a3)
{
  if (a1 && a3 == -536870896)
  {
    CFDictionaryRef v4 = *(const __CFDictionary **)(a1 + 32);
    if (v4
      && (CFNumberRef Value = CFDictionaryGetValue(v4, @"Transport Type"), TypeID = CFStringGetTypeID(), Value)
      && CFGetTypeID(Value) == TypeID
      && CFEqual(Value, @"Inductive In-Band"))
    {
      BOOL v7 = (byte_10000C048 & 0xFD) == 0;
      byte_10000C048 &= ~2u;
      if (v7)
      {
        sub_100005134(a1);
        qword_10000C090 = 0;
      }
      else
      {
        sub_100005590(a1);
      }
    }
    else
    {
      sub_100005134(a1);
    }
  }
}

void sub_100005134(uint64_t a1)
{
  if (a1)
  {
    *(unsigned char *)(a1 + 28) = 0;
    if (*(_DWORD *)(a1 + 56) == 3)
    {
      int valuePtr = 0;
      CFNumberRef v2 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
      sub_1000025D0(v2);
    }
    sub_100005590(a1);
    if (*(void *)a1)
    {
      uint64_t v3 = IOPSReleasePowerSource();
      --dword_10000C064;
      if (v3)
      {
        uint64_t v4 = v3;
        int v5 = qword_10000C050;
        if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
          sub_1000067E4(v4, v5, v6, v7, v8, v9, v10, v11);
        }
      }
      *(void *)a1 = 0;
    }
    CFBooleanRef v12 = *(const void **)(a1 + 32);
    if (v12)
    {
      CFRelease(v12);
      *(void *)(a1 + 32) = 0;
    }
    if (!dword_10000C064)
    {
      CFRelease((CFTypeRef)qword_10000C070);
      sub_100002560();
    }
  }
}

uint64_t sub_100005218()
{
  if (!qword_10000C098) {
    qword_10000C098 = _sl_dlopen();
  }
  return qword_10000C098;
}

uint64_t sub_1000052E8()
{
  uint64_t v3 = 0;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000;
  uint64_t v0 = qword_10000C0A0;
  uint64_t v6 = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_100005428;
    v2[3] = &unk_100008570;
    v2[4] = &v3;
    sub_100005428((uint64_t)v2);
    uint64_t v0 = v4[3];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_10000539C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000053B4()
{
  uint64_t result = _sl_dlopen();
  qword_10000C098 = result;
  return result;
}

void *sub_100005428(uint64_t a1)
{
  uint64_t v4 = 0;
  CFNumberRef v2 = (void *)sub_100005218();
  if (!v2) {
    sub_100006850(&v4);
  }
  uint64_t result = dlsym(v2, "ACCConnectionInfoCopyLocalizedAccessoryNameCF");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10000C0A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000054AC(io_service_t *a1, io_connect_t *a2)
{
  kern_return_t v6;
  mach_error_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  io_connect_t connect;

  io_connect_t connect = 0;
  io_service_t ServiceWithPrimaryPort = IOAccessoryManagerGetServiceWithPrimaryPort();
  if (ServiceWithPrimaryPort)
  {
    io_service_t v5 = ServiceWithPrimaryPort;
    uint64_t v6 = IOServiceOpen(ServiceWithPrimaryPort, mach_task_self_, 0, &connect);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 3758097101;
      uint64_t v9 = (void *)qword_10000C050;
      if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
        sub_1000062D4(v9, v7);
      }
    }
    else
    {
      uint64_t v8 = 0;
      *a1 = v5;
      *a2 = connect;
    }
  }
  else
  {
    uint64_t v10 = qword_10000C050;
    uint64_t v8 = 3758097136;
    if (os_log_type_enabled((os_log_t)qword_10000C050, OS_LOG_TYPE_ERROR)) {
      sub_100006260(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  return v8;
}

uint64_t sub_100005590(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    CFAbsoluteTime Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 40), kCFRunLoopDefaultMode);
    CFRelease(*(CFTypeRef *)(a1 + 40));
    *(void *)(a1 + 40) = 0;
  }
  if (*(void *)(a1 + 48))
  {
    uint64_t v3 = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(v3, *(CFRunLoopTimerRef *)(a1 + 48), kCFRunLoopDefaultMode);
    uint64_t v4 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;
  }
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5)
  {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
    *(void *)(a1 + 16) = 0;
  }
  io_object_t v6 = *(_DWORD *)(a1 + 80);
  if (v6)
  {
    IOObjectRelease(v6);
    *(_DWORD *)(a1 + 80) = 0;
  }
  io_object_t v7 = *(_DWORD *)(a1 + 84);
  if (v7)
  {
    IOObjectRelease(v7);
    *(_DWORD *)(a1 + 84) = 0;
  }
  io_object_t v8 = *(_DWORD *)(a1 + 88);
  if (v8)
  {
    IOObjectRelease(v8);
    *(_DWORD *)(a1 + 88) = 0;
  }
  uint64_t result = *(unsigned int *)(a1 + 8);
  if (result)
  {
    uint64_t result = IOObjectRelease(result);
    *(_DWORD *)(a1 + 8) = 0;
  }
  return result;
}

void sub_100005658(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005680(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1000056B4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000056D4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_1000056F4(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[5];
  if (v2 < 60000 || v2 >= 60003) {
    return 0;
  }
  uint64_t v5 = (_DWORD *)((char *)a1 + ((a1[1] + 3) & 0x1FFFFFFFCLL));
  if (*v5 || v5[1] < 0x14u) {
    int v6 = -1;
  }
  else {
    int v6 = v5[3];
  }
  dword_10000C040 = v6;
  return sub_100005FB0(a1, a2);
}

void sub_100005754(uint64_t a1, mach_msg_header_t *a2)
{
  uint64_t v3 = (mach_msg_header_t *)CFAllocatorAllocate(0, 56, 0);
  uint64_t v4 = v3;
  if (v3) {
    bzero(v3, 0x38uLL);
  }
  sub_1000056F4(a2, (uint64_t)v4);
  if ((v4->msgh_bits & 0x80000000) == 0)
  {
    mach_port_t msgh_remote_port = v4[1].msgh_remote_port;
    if (msgh_remote_port == -305) {
      goto LABEL_13;
    }
    if (msgh_remote_port)
    {
      a2->mach_port_t msgh_remote_port = 0;
      mach_msg_destroy(a2);
    }
  }
  if (v4->msgh_remote_port)
  {
    if ((v4->msgh_bits & 0x1F) == 0x12) {
      mach_msg_option_t v6 = 17;
    }
    else {
      mach_msg_option_t v6 = 1;
    }
    if ((mach_msg(v4, v6, v4->msgh_size, 0, 0, 0, 0) - 268435459) > 1) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if ((v4->msgh_bits & 0x80000000) != 0) {
LABEL_12:
  }
    mach_msg_destroy(v4);
LABEL_13:

  CFAllocatorDeallocate(0, v4);
}

uint64_t sub_10000584C(mach_port_t a1, int a2, uint64_t a3, int a4)
{
  int v10 = 1;
  uint64_t v11 = a3;
  int v12 = 16777472;
  int v13 = a4;
  NDR_record_t v14 = NDR_record;
  int v15 = a2;
  int v16 = a4;
  mach_port_t reply_port = mig_get_reply_port();
  *(void *)&msg.msgh_bits = 2147489043;
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  *(void *)&msg.msgh_voucher_port = 0xEA6000000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v6 = mach_msg(&msg, 3, 0x3Cu, 0x2Cu, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) <= 0xE && ((1 << (v6 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v7;
  }
  if (v6)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v7;
  }
  if (msg.msgh_id == 71)
  {
    uint64_t v7 = 4294966988;
LABEL_17:
    mach_msg_destroy(&msg);
    return v7;
  }
  if (msg.msgh_id != 60100)
  {
    uint64_t v7 = 4294966995;
    goto LABEL_17;
  }
  uint64_t v7 = 4294966996;
  if ((msg.msgh_bits & 0x80000000) != 0) {
    goto LABEL_17;
  }
  if (msg.msgh_size != 36) {
    goto LABEL_17;
  }
  if (msg.msgh_remote_port) {
    goto LABEL_17;
  }
  uint64_t v7 = HIDWORD(v11);
  if (HIDWORD(v11)) {
    goto LABEL_17;
  }
  return v7;
}

uint64_t sub_1000059C4(mach_port_t a1, int a2, void *a3, _DWORD *a4)
{
  memset((char *)&v13[1] + 4, 0, 28);
  msg.msgh_size = 0;
  v13[0] = NDR_record;
  LODWORD(v13[1]) = a2;
  mach_port_t reply_port = mig_get_reply_port();
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0xEA6100000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v8 = mach_msg(&msg, 3, 0x24u, 0x40u, reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (msg.msgh_id == 60101)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v9 = 4294966996;
          if (LODWORD(v13[0]) == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && HIBYTE(v13[1]) == 1)
          {
            int v10 = v13[2];
            if (LODWORD(v13[2]) == HIDWORD(v13[3]))
            {
              uint64_t v9 = 0;
              *a3 = *(void *)((char *)v13 + 4);
              *a4 = v10;
              return v9;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          uint64_t v9 = 4294966996;
          if (LODWORD(v13[1]))
          {
            if (msg.msgh_remote_port) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = LODWORD(v13[1]);
            }
          }
        }
        else
        {
          uint64_t v9 = 4294966996;
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v9;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v9;
}

uint64_t sub_100005BA0(mach_port_t a1, int a2, void *a3, _DWORD *a4)
{
  memset((char *)&v13[1] + 4, 0, 28);
  msg.msgh_size = 0;
  v13[0] = NDR_record;
  LODWORD(v13[1]) = a2;
  mach_port_t reply_port = mig_get_reply_port();
  msg.mach_port_t msgh_remote_port = a1;
  msg.msgh_local_port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_port = 0xEA6200000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    mach_port_t reply_port = msg.msgh_local_port;
  }
  uint64_t v8 = mach_msg(&msg, 3, 0x24u, 0x40u, reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) <= 0xE && ((1 << (v8 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!v8)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v9 = 4294966988;
      }
      else if (msg.msgh_id == 60102)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v9 = 4294966996;
          if (LODWORD(v13[0]) == 1 && msg.msgh_size == 56 && !msg.msgh_remote_port && HIBYTE(v13[1]) == 1)
          {
            int v10 = v13[2];
            if (LODWORD(v13[2]) == HIDWORD(v13[3]))
            {
              uint64_t v9 = 0;
              *a3 = *(void *)((char *)v13 + 4);
              *a4 = v10;
              return v9;
            }
          }
        }
        else if (msg.msgh_size == 36)
        {
          uint64_t v9 = 4294966996;
          if (LODWORD(v13[1]))
          {
            if (msg.msgh_remote_port) {
              uint64_t v9 = 4294966996;
            }
            else {
              uint64_t v9 = LODWORD(v13[1]);
            }
          }
        }
        else
        {
          uint64_t v9 = 4294966996;
        }
      }
      else
      {
        uint64_t v9 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v9;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v9;
}

uint64_t sub_100005D7C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 60003) >= 0xFFFFFFFD) {
    return (uint64_t)*(&off_100008590 + 5 * (v1 - 60000) + 5);
  }
  else {
    return 0;
  }
}

uint64_t sub_100005DB8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v3 = -304;
LABEL_8:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_9;
  }
  if (*(unsigned char *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 56))
  {
    int v3 = -300;
    goto LABEL_8;
  }
  uint64_t result = sub_1000033DC(*(_DWORD *)(result + 12), *(_DWORD *)(result + 52), *(char **)(result + 28));
  *(_DWORD *)(a2 + 32) = result;
LABEL_9:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_100005E50(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)sub_1000034A0(result[3], result[8], (vm_address_t *)(a2 + 28), (size_t *)(a2 + 52));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_100005F00(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)sub_1000035B8(result[3], result[8], (vm_address_t *)(a2 + 28), (size_t *)(a2 + 52));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_100005FB0(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 60003) >= 0xFFFFFFFD
    && (uint64_t v5 = (void (*)(void))*(&off_100008590 + 5 * (v4 - 60000) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

void sub_100006044(int a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "com.apple.IOUPSPlugInServer";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ioupsd: bootstrap_check_in \"%s\" error = %d\n", (uint8_t *)&v2, 0x12u);
}

void sub_1000060D0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000613C()
{
  sub_100005674();
  sub_100005658((void *)&_mh_execute_header, v0, v1, "failed to find IOPMPowerSource\n", v2, v3, v4, v5, v6);
}

void sub_100006170()
{
  sub_10000569C();
  sub_1000056B4((void *)&_mh_execute_header, v0, v1, "IsCurrentLimitControlRequired: invalid UPS struct upsData=%p, storeDict%p\n", v2, v3);
}

void sub_1000061E8()
{
  sub_10000569C();
  sub_1000056B4((void *)&_mh_execute_header, v0, v1, "AreAverageChargeCurrentUpdatesRequired: invalid UPS struct upsData=%p, storeDict%p\n", v2, v3);
}

void sub_100006260(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000062D4(void *a1, mach_error_t a2)
{
  id v3 = a1;
  mach_error_string(a2);
  sub_1000056D4((void *)&_mh_execute_header, v4, v5, "could not open IOAccessoryManager service: %s\n", v6, v7, v8, v9, 2u);
}

void sub_100006360()
{
  sub_100005674();
  sub_100005658((void *)&_mh_execute_header, v0, v1, "unable to create CFDataRef for assigned address\n", v2, v3, v4, v5, v6);
}

void sub_100006394(uint64_t a1, unsigned __int8 *a2, os_log_t log)
{
  int v3 = *(_DWORD *)(a1 + 24);
  int v4 = *a2;
  int v5 = a2[1];
  int v6 = a2[2];
  int v7 = a2[3];
  int v8 = a2[4];
  int v9 = a2[5];
  v10[0] = 67110656;
  v10[1] = v3;
  __int16 v11 = 1024;
  int v12 = v4;
  __int16 v13 = 1024;
  int v14 = v5;
  __int16 v15 = 1024;
  int v16 = v6;
  __int16 v17 = 1024;
  int v18 = v7;
  __int16 v19 = 1024;
  int v20 = v8;
  __int16 v21 = 1024;
  int v22 = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "assigning battery case (ID=%d) new address: %02x %02x %02x %0x %02x %02x\n", (uint8_t *)v10, 0x2Cu);
}

void sub_100006460()
{
  sub_100005674();
  sub_100005658((void *)&_mh_execute_header, v0, v1, "unable to send new current limit\n", v2, v3, v4, v5, v6);
}

void sub_100006494()
{
  sub_100005674();
  sub_100005658((void *)&_mh_execute_header, v0, v1, "unable to get new current limit\n", v2, v3, v4, v5, v6);
}

void sub_1000064C8(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *CFRunLoopTimerContext buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "UPSDeviceAdded: isInductive: Created\n", buf, 2u);
}

void sub_100006508(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *CFRunLoopTimerContext buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "UPSDeviceAdded: isInductive\n", buf, 2u);
}

void sub_100006548()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  uint64_t v1 = +[NSString stringWithUTF8String:"CFStringRef softACCConnectionInfoCopyLocalizedAccessoryNameCF(CFStringRef)"];
  [v0 handleFailureInFunction:v1 file:@"upsd.m" lineNumber:76 description:@"%s", dlerror()];

  __break(1u);
}

void sub_1000065C0()
{
  sub_100005674();
  sub_100005658((void *)&_mh_execute_header, v0, v1, "Localization failed, use original!!\n", v2, v3, v4, v5, v6);
}

void sub_1000065F4()
{
  sub_100005674();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Using CoreAccessories.framework\n", v1, 2u);
}

void sub_100006634()
{
  sub_100005674();
  sub_100005658((void *)&_mh_execute_header, v0, v1, "failed to create polling timer to send average charging current\n", v2, v3, v4, v5, v6);
}

void sub_100006668()
{
  sub_100005674();
  sub_100005658((void *)&_mh_execute_header, v0, v1, "failed to create dictionary\n", v2, v3, v4, v5, v6);
}

void sub_10000669C()
{
  sub_100005674();
  sub_100005658((void *)&_mh_execute_header, v0, v1, "failed to create array\n", v2, v3, v4, v5, v6);
}

void sub_1000066D0()
{
  sub_100005674();
  sub_100005658((void *)&_mh_execute_header, v0, v1, "failed to set properties on IOPMPS\n", v2, v3, v4, v5, v6);
}

void sub_100006704(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "HandleACStateChange: ACPowerValue:%d\n", (uint8_t *)v2, 8u);
}

void sub_10000677C()
{
  sub_100005674();
  sub_100005658((void *)&_mh_execute_header, v0, v1, "Timedout waiting for AC charger's current limit\n", v2, v3, v4, v5, v6);
}

void sub_1000067B0()
{
  sub_100005674();
  sub_100005658((void *)&_mh_execute_header, v0, v1, "updating power source details failed\n", v2, v3, v4, v5, v6);
}

void sub_1000067E4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100006850(void *a1)
{
  uint64_t v2 = +[NSAssertionHandler currentHandler];
  uint64_t v3 = +[NSString stringWithUTF8String:"void *CoreAccessoriesLibrary(void)"];
  [v2 handleFailureInFunction:v3 file:@"upsd.m" lineNumber:74 description:@"%s", *a1];

  __break(1u);
  CFAbsoluteTimeGetCurrent();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
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

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return _CFDataGetMutableBytePtr(theData);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return _CFDictionaryGetValueIfPresent(theDict, key, value);
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

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return _CFMachPortCreateRunLoopSource(allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return _CFMachPortCreateWithPort(allocator, portNum, callout, context, shouldFreeInfo);
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFTypeID CFRunLoopSourceGetTypeID(void)
{
  return _CFRunLoopSourceGetTypeID();
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return _CFRunLoopTimerCreate(allocator, fireDate, interval, flags, order, callout, context);
}

CFTypeID CFRunLoopTimerGetTypeID(void)
{
  return _CFRunLoopTimerGetTypeID();
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return _CFSetContainsValue(theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return _CFSetCreateMutable(allocator, capacity, callBacks);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t IOAccessoryManagerGetServiceWithPrimaryPort()
{
  return _IOAccessoryManagerGetServiceWithPrimaryPort();
}

uint64_t IOAccessoryManagerGetUSBCurrentLimit()
{
  return _IOAccessoryManagerGetUSBCurrentLimit();
}

uint64_t IOAccessoryManagerGetUSBCurrentLimitBase()
{
  return _IOAccessoryManagerGetUSBCurrentLimitBase();
}

uint64_t IOAccessoryManagerRestoreUSBCurrentLimitBase()
{
  return _IOAccessoryManagerRestoreUSBCurrentLimitBase();
}

uint64_t IOAccessoryManagerSetUSBCurrentLimitBase()
{
  return _IOAccessoryManagerSetUSBCurrentLimitBase();
}

uint64_t IOAccessoryManagerSetUSBCurrentOffset()
{
  return _IOAccessoryManagerSetUSBCurrentOffset();
}

uint64_t IOAccessoryManagerSetUSBPowerIgnore()
{
  return _IOAccessoryManagerSetUSBPowerIgnore();
}

uint64_t IOAccessoryManagerSetUSBPreventSourceDetection()
{
  return _IOAccessoryManagerSetUSBPreventSourceDetection();
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return _IOCFSerialize(object, options);
}

CFTypeRef IOCFUnserialize(const char *buffer, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return _IOCFUnserialize(buffer, allocator, options, errorString);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return _IOCreatePlugInInterfaceForService(service, pluginType, interfaceType, theInterface, theScore);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithName(AssertionType, AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

uint64_t IOPSCreatePowerSource()
{
  return _IOPSCreatePowerSource();
}

uint64_t IOPSReleasePowerSource()
{
  return _IOPSReleasePowerSource();
}

uint64_t IOPSSetPowerSourceDetails()
{
  return _IOPSSetPowerSourceDetails();
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return _IORegistryEntrySetCFProperties(entry, properties);
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

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_look_up(bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
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

int rand(void)
{
  return _rand();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

void srand(unsigned int a1)
{
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return _task_get_special_port(task, which_port, special_port);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}