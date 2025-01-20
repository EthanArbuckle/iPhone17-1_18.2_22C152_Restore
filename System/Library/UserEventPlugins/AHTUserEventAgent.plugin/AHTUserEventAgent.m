void sub_544C(void *a1, io_iterator_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void (**v6)(void, void);
  id v7;
  uint64_t vars8;

  v7 = a1;
  v3 = IOIteratorNext(a2);
  if (v3)
  {
    v4 = v3;
    do
    {
      v5 = [v7 action];

      if (v5)
      {
        v6 = [v7 action];
        v6[2](v6, v4);
      }
      IOObjectRelease(v4);
      v4 = IOIteratorNext(a2);
    }
    while (v4);
  }
}

void sub_5B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

void sub_5BC0(uint64_t a1, uint64_t a2)
{
  v3 = +[AHTDevice withService:a2];
  v4 = [v3 getBootLoader];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 name];
    v6 = [v4 type];
    unsigned int v7 = [v4 supportsMemoryDump];
    v8 = "NO";
    int v10 = 138412802;
    v11 = v5;
    if (v7) {
      v8 = "YES";
    }
    __int16 v12 = 2112;
    v13 = v6;
    __int16 v14 = 2080;
    v15 = v8;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Added Device %@ bootloader %@ memory dump support %s", (uint8_t *)&v10, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained registerNotification:v4 memoryDumpLevel:*(void *)(a1 + 32)];
}

void sub_5D18(uint64_t a1, uint64_t a2)
{
  v3 = +[AHTInterface withService:a2];
  v4 = [v3 getBootLoader];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 name];
    v6 = [v4 type];
    unsigned int v7 = [v4 supportsMemoryDump];
    v8 = "NO";
    int v10 = 138412802;
    v11 = v5;
    if (v7) {
      v8 = "YES";
    }
    __int16 v12 = 2112;
    v13 = v6;
    __int16 v14 = 2080;
    v15 = v8;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Added Interface %@ bootloader %@ memory dump support %s", (uint8_t *)&v10, 0x20u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained registerNotification:v4 memoryDumpLevel:*(void *)(a1 + 32)];
}

id *sub_61B4(id *result, uint64_t a2, int a3)
{
  if (a3 == 1) {
    return (id *)[result[4] getMemoryDumps:a2];
  }
  return result;
}

id sub_6570(uint64_t a1, void *a2)
{
  return [a2 writeData:*(void *)(a1 + 32)];
}

void sub_6704(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_6720(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_6D30(uint64_t a1)
{
  return [*(id *)(a1 + 32) agmStackChoiceStatsCollection];
}

void sub_6D38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[AHTDeviceStats startCriticalErrorCollectionTimer]_block_invoke_2";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s timer cancelled", (uint8_t *)&v3, 0xCu);
  }
}

BOOL sub_6FA4(uint64_t a1, io_registry_entry_t entry)
{
  memset(v4, 0, sizeof(v4));
  return !IORegistryEntryGetName(entry, (char *)v4)
      && strcmp((const char *)v4, (const char *)[*(id *)(a1 + 32) UTF8String]) == 0;
}

BOOL sub_7120(uint64_t a1, io_registry_entry_t entry)
{
  uint64_t entryID = 0;
  if (IORegistryEntryGetRegistryEntryID(entry, &entryID) || (CFMutableDictionaryRef v5 = IORegistryEntryIDMatching(entryID)) == 0)
  {
    BOOL v3 = 0;
    CFDictionaryRef v4 = 0;
  }
  else
  {
    CFDictionaryRef v4 = v5;
    io_service_t MatchingService = IOServiceGetMatchingService(0, v4);
    if (MatchingService) {
      BOOL v3 = IOObjectConformsTo(MatchingService, (const char *)[*(id *)(a1 + 32) UTF8String]) != 0;
    }
    else {
      BOOL v3 = 0;
    }
  }

  return v3;
}

id sub_76D0(uint64_t a1)
{
  v4[0] = @"AGMUltimateDecision";
  v4[1] = @"CalibrationSource";
  uint64_t v1 = *(void *)(a1 + 40);
  v5[0] = *(void *)(a1 + 32);
  v5[1] = v1;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

id sub_7760(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  CFDictionaryRef v4 = @"AGMConfirmedAuthStatus";
  uint64_t v5 = v1;
  v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_7CAC(int a1, io_registry_entry_t entry)
{
  v2 = (void *)IORegistryEntrySearchCFProperty(entry, "IOService", @"Calibration Source", kCFAllocatorDefault, 0);
  BOOL v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    unsigned int v7 = "-[AHTDeviceStats getCalibrationSource:]_block_invoke";
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s Interested enum not available yet", (uint8_t *)&v6, 0xCu);
  }

  return v3;
}

void AHTUserEventAgentInit()
{
  if (!qword_E740) {
    xpc_event_module_get_queue();
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Already initialized", buf, 2u);
  }
}

void sub_8C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_8C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_8C9C()
{
  sub_673C();
  sub_6704(&dword_0, &_os_log_default, v0, "Fail to set memory dump level (err=%@)", v1, v2, v3, v4, v5);
}

void sub_8D0C()
{
  sub_673C();
  sub_6704(&dword_0, &_os_log_default, v0, "Cannot create dispatch source on BOOLoader (err=%@)", v1, v2, v3, v4, v5);
}

void sub_8D7C()
{
  sub_673C();
  sub_6704(&dword_0, &_os_log_default, v0, "Fail to serialize memory dump dictionary to data (err=%@)", v1, v2, v3, v4, v5);
}

void sub_8DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_8E28()
{
  sub_673C();
  sub_6704(&dword_0, &_os_log_default, v0, "Fail to get memory dumps (err=%@)", v1, v2, v3, v4, v5);
}

void sub_8E98()
{
  sub_673C();
  sub_6704(&dword_0, &_os_log_default, v0, "Fail to clear memory dump (err=%@)", v1, v2, v3, v4, v5);
}

void sub_8F08()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to instantiate", v0, 2u);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

BOOLean_t IOIteratorIsValid(io_iterator_t iterator)
{
  return _IOIteratorIsValid(iterator);
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

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
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

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return _IOServiceNameMatching(name);
}

uint64_t OSAWriteLogForSubmission()
{
  return _OSAWriteLogForSubmission();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

void xpc_event_module_get_queue()
{
  while (1)
    ;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return [a1 action];
}

id objc_msgSend_allDevices(void *a1, const char *a2, ...)
{
  return [a1 allDevices];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_deviceNotification(void *a1, const char *a2, ...)
{
  return [a1 deviceNotification];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 dispatchQueue];
}

id objc_msgSend_getAGMEntry(void *a1, const char *a2, ...)
{
  return [a1 getAGMEntry];
}

id objc_msgSend_getBootLoader(void *a1, const char *a2, ...)
{
  return [a1 getBootLoader];
}

id objc_msgSend_getCFRunLoop(void *a1, const char *a2, ...)
{
  return [a1 getCFRunLoop];
}

id objc_msgSend_iterator(void *a1, const char *a2, ...)
{
  return [a1 iterator];
}

id objc_msgSend_matching(void *a1, const char *a2, ...)
{
  return [a1 matching];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_reporterResults(void *a1, const char *a2, ...)
{
  return [a1 reporterResults];
}

id objc_msgSend_runLoop(void *a1, const char *a2, ...)
{
  return [a1 runLoop];
}

id objc_msgSend_runLoopSource(void *a1, const char *a2, ...)
{
  return [a1 runLoopSource];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startCriticalErrorCollectionTimer(void *a1, const char *a2, ...)
{
  return [a1 startCriticalErrorCollectionTimer];
}

id objc_msgSend_supportsMemoryDump(void *a1, const char *a2, ...)
{
  return [a1 supportsMemoryDump];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_ultimateDecisionSet(void *a1, const char *a2, ...)
{
  return [a1 ultimateDecisionSet];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_withService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withService:");
}