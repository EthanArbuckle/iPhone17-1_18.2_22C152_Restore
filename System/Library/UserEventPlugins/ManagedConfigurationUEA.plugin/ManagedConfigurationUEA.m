void sub_20FC()
{
  NSObject *v0;
  int v1;
  void *v2;
  unsigned int v3;
  dispatch_time_t v4;
  void block[4];
  BOOL v6;
  uint8_t buf[16];

  v0 = _MCLogObjects[3];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v0, OS_LOG_TYPE_DEFAULT, "Lock status changed.", buf, 2u);
  }
  v1 = MKBGetDeviceLockState();
  v2 = +[MCRestrictionManager sharedManager];
  v3 = [v2 effectiveRestrictedBoolForSetting:MCFeaturePasscodeRequired];

  if (v1 == 3 || !v1)
  {
    v4 = dispatch_time(0, 800000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_26C4;
    block[3] = &unk_41B0;
    v6 = v3 == 1;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void *UserEventAgentFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3 = CFUUIDGetConstantUUIDWithBytes(0, 0xFCu, 0x86u, 0x41u, 0x6Du, 0x61u, 0x64u, 0x20u, 0x70u, 0x72u, 0x6Fu, 0x70u, 0x73u, 0x5Cu, 0x21u, 0x6Eu, 0xC0u);
  if (!CFEqual(a2, v3)) {
    return 0;
  }
  CFUUIDRef v4 = CFUUIDGetConstantUUIDWithBytes(0, 0xFBu, 0x86u, 0x41u, 0x6Du, 0x61u, 0x64u, 0x20u, 0x70u, 0x72u, 0x6Fu, 0x70u, 0x73u, 0x5Cu, 0x21u, 0x6Eu, 0xC0u);
  v5 = malloc_type_malloc(0x20uLL, 0x10E0040E9A6435BuLL);
  void *v5 = &unk_4F18;
  v5[3] = objc_alloc_init(MCUEAPlugin);
  if (v4)
  {
    v5[1] = CFRetain(v4);
    CFPlugInAddInstanceForFactory(v4);
  }
  *((_DWORD *)v5 + 4) = 1;
  return v5;
}

void sub_26C4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    v1 = +[MCProfileConnection sharedConnection];
    [v1 notifyDeviceUnlockedAndPasscodeRequired];
  }
  id v2 = +[MCProfileConnection sharedConnection];
  [v2 notifyDeviceUnlocked];
}

uint64_t sub_2734(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v8 = _MCLogObjects[3];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "Querying interface", buf, 2u);
  }
  *(void *)&v15.byte0 = a2;
  *(void *)&v15.byte8 = a3;
  CFUUIDRef v9 = CFUUIDCreateFromUUIDBytes(0, v15);
  CFUUIDRef v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xFDu, 0x86u, 0x41u, 0x6Du, 0x61u, 0x64u, 0x20u, 0x70u, 0x72u, 0x6Fu, 0x70u, 0x73u, 0x5Cu, 0x21u, 0x6Eu, 0xC0u);
  if (CFEqual(v9, v10)
    || (CFUUIDRef v11 = CFUUIDGetConstantUUIDWithBytes(kCFAllocatorSystemDefault, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v9, v11)))
  {
    (*(void (**)(uint64_t))(*(void *)a1 + 16))(a1);
    uint64_t v12 = 0;
  }
  else
  {
    a1 = 0;
    uint64_t v12 = 2147483652;
  }
  *a4 = a1;
  CFRelease(v9);
  return v12;
}

uint64_t sub_28A0(uint64_t a1)
{
  uint64_t v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_28B4(_DWORD *a1)
{
  int v1 = a1[4];
  uint64_t v2 = (v1 - 1);
  a1[4] = v2;
  if (v1 == 1)
  {
    CFUUIDRef v4 = (const void *)*((void *)a1 + 3);
    if (v4) {
      CFRelease(v4);
    }
    CFUUIDRef v5 = (const __CFUUID *)*((void *)a1 + 1);
    free(a1);
    if (v5)
    {
      CFPlugInRemoveInstanceForFactory(v5);
      CFRelease(v5);
    }
  }
  return v2;
}

void sub_291C(uint64_t a1)
{
  [*(id *)(a1 + 24) install];
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
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

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return _CFUUIDCreateFromUUIDBytes(alloc, bytes);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

uint64_t MCLoggingInitialize()
{
  return _MCLoggingInitialize();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_MCVerboseDescription(void *a1, const char *a2, ...)
{
  return [a1 MCVerboseDescription];
}

id objc_msgSend_checkCarrierProfile(void *a1, const char *a2, ...)
{
  return [a1 checkCarrierProfile];
}

id objc_msgSend_coreTelephonyClient(void *a1, const char *a2, ...)
{
  return [a1 coreTelephonyClient];
}

id objc_msgSend_install(void *a1, const char *a2, ...)
{
  return [a1 install];
}

id objc_msgSend_notifyDeviceUnlocked(void *a1, const char *a2, ...)
{
  return [a1 notifyDeviceUnlocked];
}

id objc_msgSend_notifyDeviceUnlockedAndPasscodeRequired(void *a1, const char *a2, ...)
{
  return [a1 notifyDeviceUnlockedAndPasscodeRequired];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return [a1 slotID];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}