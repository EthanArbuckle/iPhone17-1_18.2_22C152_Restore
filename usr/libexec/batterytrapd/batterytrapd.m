void sub_100001684(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100001F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100001FA8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100001FB8(uint64_t a1)
{
}

void sub_100001FC0(uint64_t a1)
{
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 24), OS_LOG_TYPE_DEBUG)) {
    sub_100002658();
  }
  [*(id *)(a1 + 32) _updateLocaleChange];
  v2 = +[NSNotificationCenter defaultCenter];
  [v2 removeObserver:*(void *)(*(void *)(a1 + 32) + 32)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = 0;
}

void start()
{
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100004280);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000042A0);

  dispatch_main();
}

void sub_1000021C4(id a1, OS_xpc_object *a2)
{
  BOOL v2 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
  if (v2) {
    sub_10000268C(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  v10 = objc_alloc_init(CFDaemon);
  v11 = (void *)qword_100008550;
  qword_100008550 = (uint64_t)v10;

  byte_100008548 = 1;
}

void sub_10000221C(id a1, OS_xpc_object *a2)
{
  if (byte_100008548 == 1 && qword_100008550 != 0)
  {
    string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
    if (string)
    {
      uint64_t v4 = string;
      if (!strcmp("TimezoneNotification", string))
      {
        BOOL v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
        if (v13) {
          sub_1000026C8(v13, v14, v15, v16, v17, v18, v19, v20);
        }
        [(id)qword_100008550 _handleTimeZoneChange];
      }
      else if (!strcmp("AppleTimePreferencesChangedNotification", v4))
      {
        BOOL v5 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG);
        if (v5) {
          sub_100002704(v5, v6, v7, v8, v9, v10, v11, v12);
        }
        [(id)qword_100008550 _handleLocaleChange];
      }
    }
  }
}

void sub_1000022E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100002304()
{
  sub_1000016A0();
  sub_100001684((void *)&_mh_execute_header, v0, v1, "NVRAM variable name cannot be null", v2, v3, v4, v5, v6);
}

void sub_100002338(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Couldn't write nvram for variable: %@, error:0x%x", (uint8_t *)&v3, 0x12u);
}

void sub_1000023C0()
{
  sub_1000016A0();
  sub_100001684((void *)&_mh_execute_header, v0, v1, "Couldn't sync nvram to device", v2, v3, v4, v5, v6);
}

void sub_1000023F4()
{
  sub_1000016A0();
  sub_100001684((void *)&_mh_execute_header, v0, v1, "NVRAM is not supported on this system", v2, v3, v4, v5, v6);
}

void sub_100002428()
{
  sub_1000016A0();
  sub_100001684((void *)&_mh_execute_header, v0, v1, "Couldn't find entry IODeviceTree:/product", v2, v3, v4, v5, v6);
}

void sub_10000245C()
{
  sub_1000016A0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Did not find property lpm-clock", v1, 2u);
}

void sub_10000249C()
{
  sub_1000016A0();
  sub_100001684((void *)&_mh_execute_header, v0, v1, "lpm-clock isn't of type data", v2, v3, v4, v5, v6);
}

void sub_1000024D0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to change timezone", v1, 2u);
}

void sub_100002514(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 dateFormat];
  int v5 = 138412290;
  uint8_t v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Time format: %@", (uint8_t *)&v5, 0xCu);
}

void sub_1000025BC()
{
  sub_1000016A0();
  sub_1000022E8((void *)&_mh_execute_header, v0, v1, "Writing all variables\n", v2, v3, v4, v5, v6);
}

void sub_1000025F0()
{
  sub_1000016A0();
  sub_1000022E8((void *)&_mh_execute_header, v0, v1, "com.apple.notifyd.matching notification from com.apple.system.timezone", v2, v3, v4, v5, v6);
}

void sub_100002624()
{
  sub_1000016A0();
  sub_1000022E8((void *)&_mh_execute_header, v0, v1, "com.apple.notifyd.matching notification from AppleTimePreferencesChangedNotification", v2, v3, v4, v5, v6);
}

void sub_100002658()
{
  sub_1000016A0();
  sub_1000022E8((void *)&_mh_execute_header, v0, v1, "NSCurrentLocaleDidChangeNotification", v2, v3, v4, v5, v6);
}

void sub_10000268C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000026C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100002704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

uint64_t TMIsAutomaticTimeZoneEnabled()
{
  return _TMIsAutomaticTimeZoneEnabled();
}

uint64_t TMSetAutomaticTimeEnabled()
{
  return _TMSetAutomaticTimeEnabled();
}

uint64_t TMSetAutomaticTimeZoneEnabled()
{
  return _TMSetAutomaticTimeZoneEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_main(void)
{
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
  return [super a2];
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

uint64_t tzlink()
{
  return _tzlink();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__handleLocaleChange(void *a1, const char *a2, ...)
{
  return [a1 _handleLocaleChange];
}

id objc_msgSend__handleTimeZoneChange(void *a1, const char *a2, ...)
{
  return [a1 _handleTimeZoneChange];
}

id objc_msgSend__updateLocaleChange(void *a1, const char *a2, ...)
{
  return [a1 _updateLocaleChange];
}

id objc_msgSend_createOptionsRef(void *a1, const char *a2, ...)
{
  return [a1 createOptionsRef];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_dateFormat(void *a1, const char *a2, ...)
{
  return [a1 dateFormat];
}

id objc_msgSend_daylightSavingTimeOffset(void *a1, const char *a2, ...)
{
  return [a1 daylightSavingTimeOffset];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_isDaylightSavingTime(void *a1, const char *a2, ...)
{
  return [a1 isDaylightSavingTime];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextDaylightSavingTimeTransition(void *a1, const char *a2, ...)
{
  return [a1 nextDaylightSavingTimeTransition];
}

id objc_msgSend_read24HrMode(void *a1, const char *a2, ...)
{
  return [a1 read24HrMode];
}

id objc_msgSend_readUTCOffset(void *a1, const char *a2, ...)
{
  return [a1 readUTCOffset];
}

id objc_msgSend_resetSystemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 resetSystemTimeZone];
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return [a1 secondsFromGMT];
}

id objc_msgSend_set24hMode(void *a1, const char *a2, ...)
{
  return [a1 set24hMode];
}

id objc_msgSend_setDST(void *a1, const char *a2, ...)
{
  return [a1 setDST];
}

id objc_msgSend_setUTCOffset(void *a1, const char *a2, ...)
{
  return [a1 setUTCOffset];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_syncNVRAM(void *a1, const char *a2, ...)
{
  return [a1 syncNVRAM];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_writeAllVariables(void *a1, const char *a2, ...)
{
  return [a1 writeAllVariables];
}

id objc_msgSend_writeNVRAM::(void *a1, const char *a2, ...)
{
  return [a1 writeNVRAM::];
}