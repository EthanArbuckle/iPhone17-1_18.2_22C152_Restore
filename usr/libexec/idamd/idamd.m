void sub_100002EB4()
{
  CFMutableDictionaryRef v0;
  __CFDictionary *v1;
  __CFDictionary *Mutable;
  __CFDictionary *v3;
  io_service_t MatchingService;
  NSObject *v5;
  CFUUIDRef v6;
  CFUUIDRef v7;
  kern_return_t v8;
  kern_return_t v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  NSObject *v15;
  IOCFPlugInInterface **v16;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  CFUUIDRef v18;
  CFUUIDBytes v19;
  int v20;
  uint64_t v21;
  kern_return_t v22;
  kern_return_t v23;
  NSObject *v24;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  uint64_t v27;
  uint8_t buf[4];
  kern_return_t v29;

  theInterface = 0;
  v27 = 0;
  theScore = 0;
  v0 = IOServiceMatching("IOUSBDeviceInterface");
  if (!v0)
  {
    v14 = qword_100008000;
    if (!os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    v11 = "Failed to create matchingDict";
    v12 = v14;
    v13 = 2;
    goto LABEL_11;
  }
  v1 = v0;
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    v3 = Mutable;
    CFDictionarySetValue(Mutable, @"USBDeviceFunction", @"IDAMInterface");
    CFDictionarySetValue(v1, @"IOPropertyMatch", v3);
    CFRelease(v3);
    MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v1);
    if (!MatchingService)
    {
      v5 = qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unable to find a matching service!", buf, 2u);
      }
    }
    v6 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Eu, 0x72u, 0x21u, 0x7Eu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0xBFu, 0x57u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
    v7 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    v8 = IOCreatePlugInInterfaceForService(MatchingService, v6, v7, &theInterface, &theScore);
    if (v8)
    {
      v9 = v8;
      v10 = qword_100008000;
      if (!os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      *(_DWORD *)buf = 67109120;
      v29 = v9;
      v11 = "IOCreatePlugInInterfaceForService failed: 0x%08x";
      v12 = v10;
      v13 = 8;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      return;
    }
    v16 = theInterface;
    QueryInterface = (*theInterface)->QueryInterface;
    v18 = CFUUIDGetConstantUUIDWithBytes(0, 0xEAu, 0x33u, 0xBAu, 0x4Fu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0x84u, 0xDBu, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
    v19 = CFUUIDGetUUIDBytes(v18);
    v20 = ((uint64_t (*)(IOCFPlugInInterface **, void, void, uint64_t *))QueryInterface)(v16, *(void *)&v19.byte0, *(void *)&v19.byte8, &v27);
    v21 = v27;
    if (!v20 && v27)
    {
      v22 = (*(uint64_t (**)(void))(*(void *)v27 + 248))();
      if (v22)
      {
        v23 = v22;
        v24 = qword_100008000;
        if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v29 = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "com.apple.idamd couldn't set the IDAM configuration due to error 0x%x", buf, 8u);
        }
      }
      else
      {
        syslog(5, "com.apple.idamd set IDAM configuration.");
      }
      v21 = v27;
    }
    if (v21) {
      (*(void (**)(uint64_t))(*(void *)v21 + 24))(v21);
    }
    if (theInterface) {
      IODestroyPlugInInterface(theInterface);
    }
  }
  else
  {
    v15 = qword_100008000;
    if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed CFDictionaryCreateMutable", buf, 2u);
    }
    CFRelease(v1);
  }
}

uint64_t sub_100003268()
{
  uint64_t v0 = IOUSBDeviceControllerCreate();
  v1 = qword_100008000;
  BOOL v2 = os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v2)
    {
      *(_DWORD *)buf = 67109120;
      int v5 = v0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "com.apple.idamd couldn't create an IOUSBDeviceControllerRef due to error 0x%x", buf, 8u);
    }
  }
  else
  {
    if (v2)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "com.apple.idamd set default USB configuration.", buf, 2u);
    }
    IOUSBDeviceControllerGoOffAndOnBus();
    CFRelease(0);
  }
  return v0;
}

BOOL sub_10000336C()
{
  CFDictionaryRef v0 = IOServiceMatching("AppleUSBDeviceAudioDevice");
  if (v0) {
    BOOL v1 = IOServiceGetMatchingService(kIOMasterPortDefault, v0) != 0;
  }
  else {
    BOOL v1 = 0;
  }
  BOOL v2 = qword_100008000;
  if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
  {
    v3 = "false";
    if (v1) {
      v3 = "true";
    }
    int v5 = 136315138;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "inIDAMConfiguration returning %s", (uint8_t *)&v5, 0xCu);
  }
  return v1;
}

void sub_100003458()
{
  while (1)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, 0);
    *(void *)cf = 0;
    int v1 = lockdown_receive_message();
    BOOL v2 = *(const void **)cf;
    if (!v1 && *(void *)cf)
    {
      CFTypeID v3 = CFGetTypeID(*(CFTypeRef *)cf);
      if (v3 == CFDictionaryGetTypeID())
      {
        v4 = qword_100008000;
        if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "lockdown_receive_message received a plist mesage.\n", buf, 2u);
        }
        CFDictionaryRef Copy = CFDictionaryCreateCopy(kCFAllocatorDefault, *(CFDictionaryRef *)cf);
LABEL_11:
        BOOL v2 = *(const void **)cf;
        if (!*(void *)cf) {
          goto LABEL_13;
        }
LABEL_12:
        CFRelease(v2);
        goto LABEL_13;
      }
LABEL_10:
      CFDictionaryRef Copy = 0;
      goto LABEL_11;
    }
    if (v1)
    {
      v6 = qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        int v25 = v1;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "lockdown_receive_message returned error %x\n", buf, 8u);
      }
      goto LABEL_10;
    }
    CFDictionaryRef Copy = 0;
    if (*(void *)cf) {
      goto LABEL_12;
    }
LABEL_13:
    if (!Copy) {
      break;
    }
    int v7 = CFDictionaryContainsKey(Copy, @"Configuration Inquiry");
    if (v7)
    {
      BOOL v8 = sub_10000336C();
      v9 = qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        v10 = "Default";
        if (v8) {
          v10 = "IDAM";
        }
        *(_DWORD *)cf = 136315138;
        *(void *)&cf[4] = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Configuration Inquiry -> %s configuration\n", cf, 0xCu);
      }
      if (v8) {
        CFBooleanRef v11 = kCFBooleanTrue;
      }
      else {
        CFBooleanRef v11 = kCFBooleanFalse;
      }
      CFDictionaryAddValue(Mutable, @"IDAM Configuration Active", v11);
      int v12 = MGGetSInt32Answer();
      if ((MGGetBoolAnswer() & 1) != 0
        || (CFBooleanRef v15 = kCFBooleanFalse, (v12 - 1) >= 4) && (CFBooleanRef v15 = kCFBooleanFalse, v12 != 7))
      {
        v13 = qword_100008000;
        BOOL v14 = os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT);
        CFBooleanRef v15 = kCFBooleanTrue;
        if (v14)
        {
          *(_WORD *)cf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Configuration Inquiry -> Low End Hardware", cf, 2u);
          CFBooleanRef v15 = kCFBooleanTrue;
        }
      }
      CFDictionaryAddValue(Mutable, @"Low End Hardware", v15);
    }
    if (!CFDictionaryContainsKey(Copy, @"Set IDAM Configuration")
      || (CFBooleanRef Value = (const __CFBoolean *)CFDictionaryGetValue(Copy, @"Set IDAM Configuration")) == 0)
    {
LABEL_37:
      if (!v7) {
        goto LABEL_41;
      }
LABEL_38:
      int v19 = lockdown_send_message();
      if (v19)
      {
        int v20 = v19;
        v21 = qword_100008000;
        if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)cf = 67109120;
          *(_DWORD *)&cf[4] = v20;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Got error %x from lockdown_send_message\n", cf, 8u);
        }
      }
      goto LABEL_41;
    }
    CFBooleanRef v17 = Value;
    if (CFBooleanGetValue(Value))
    {
      v18 = qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)cf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Set IDAM Configuration -> TRUE\n", cf, 2u);
      }
      sub_100002EB4();
      if (v7) {
        goto LABEL_38;
      }
    }
    else
    {
      if (CFBooleanGetValue(v17)) {
        goto LABEL_37;
      }
      v22 = qword_100008000;
      if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)cf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Set IDAM Configuration -> FALSE\n", cf, 2u);
      }
      sub_100003268();
      if (v7) {
        goto LABEL_38;
      }
    }
LABEL_41:
    CFRelease(Copy);
    CFRelease(Mutable);
  }
  CFRelease(Mutable);
}

void start()
{
  lockdown_checkin_xpc();
  CFDictionaryRef v0 = qword_100008000;
  if (os_log_type_enabled((os_log_t)qword_100008000, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "com.apple.idamd now checked in with lockdown.", v1, 2u);
  }
  dispatch_main();
}

void sub_100003900(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  sub_100003458();

  _lockdown_disconnect(a2);
}

os_log_t sub_10000393C()
{
  os_log_t result = os_log_create("com.apple.idamd", "idam");
  qword_100008000 = (uint64_t)result;
  return result;
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateCopy(allocator, theDict);
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

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
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

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return _IOCreatePlugInInterfaceForService(service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return _IODestroyPlugInInterface(interface);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t IOUSBDeviceControllerCreate()
{
  return _IOUSBDeviceControllerCreate();
}

uint64_t IOUSBDeviceControllerGoOffAndOnBus()
{
  return _IOUSBDeviceControllerGoOffAndOnBus();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_main(void)
{
}

uint64_t lockdown_checkin_xpc()
{
  return _lockdown_checkin_xpc();
}

uint64_t lockdown_receive_message()
{
  return _lockdown_receive_message();
}

uint64_t lockdown_send_message()
{
  return _lockdown_send_message();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void syslog(int a1, const char *a2, ...)
{
}