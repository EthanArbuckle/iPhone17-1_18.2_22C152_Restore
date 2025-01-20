void sub_100003324(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t start()
{
  os_log_t v1 = os_log_create("com.apple.usbctelemetryd", "Analytics");
  CFDictionaryRef v2 = IOServiceMatching("AppleHPMARM");
  io_iterator_t existing = 0;
  IOServiceGetMatchingServices(kIOMainPortDefault, v2, &existing);
  uint64_t v3 = IOIteratorNext(existing);
  if (v3)
  {
    uint64_t v4 = v3;
    do
    {
      v5 = +[AppleHPMManager create];
      if (![v5 initialize:v4 withLogger:v1])
      {
        [v5 collectAllAnalytics];
        v6 = [v5 _analyticsDict];
        AnalyticsSendEvent();
      }
      IOObjectRelease(v4);
      uint64_t v4 = IOIteratorNext(existing);
    }
    while (v4);
  }
  IOObjectRelease(existing);

  return 0;
}

void sub_100003468()
{
  sub_100003340();
  sub_100003324((void *)&_mh_execute_header, v0, v1, "Failed to read device ID!\n", v2, v3, v4, v5, v6);
}

void sub_10000349C()
{
  sub_100003340();
  sub_100003324((void *)&_mh_execute_header, v0, v1, "Failed to read FW Version data!\n", v2, v3, v4, v5, v6);
}

void sub_1000034D0()
{
  sub_100003340();
  sub_100003324((void *)&_mh_execute_header, v0, v1, "Failed to read Boot Flags\n", v2, v3, v4, v5, v6);
}

void sub_100003504()
{
  sub_100003340();
  sub_100003324((void *)&_mh_execute_header, v0, v1, "Failed to read HChk data!\n", v2, v3, v4, v5, v6);
}

void sub_100003538()
{
  sub_100003340();
  sub_100003324((void *)&_mh_execute_header, v0, v1, "Failed to read AppLoaded Count!\n", v2, v3, v4, v5, v6);
}

void sub_10000356C()
{
  sub_100003340();
  sub_100003324((void *)&_mh_execute_header, v0, v1, "Failed to read Ace Mode\n", v2, v3, v4, v5, v6);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetChildEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *child)
{
  return _IORegistryEntryGetChildEntry(entry, plane, child);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

kern_return_t IOServiceMatchPropertyTable(io_service_t service, CFDictionaryRef matching, BOOLean_t *matches)
{
  return _IOServiceMatchPropertyTable(service, matching, matches);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_msgSend__analyticsDict(void *a1, const char *a2, ...)
{
  return [a1 _analyticsDict];
}

id objc_msgSend_collectAllAnalytics(void *a1, const char *a2, ...)
{
  return [a1 collectAllAnalytics];
}

id objc_msgSend_create(void *a1, const char *a2, ...)
{
  return [a1 create];
}

id objc_msgSend_getAppLoaded(void *a1, const char *a2, ...)
{
  return [a1 getAppLoaded];
}

id objc_msgSend_getBootFlags(void *a1, const char *a2, ...)
{
  return [a1 getBootFlags];
}

id objc_msgSend_getFWVersion(void *a1, const char *a2, ...)
{
  return [a1 getFWVersion];
}

id objc_msgSend_getHealthCheck(void *a1, const char *a2, ...)
{
  return [a1 getHealthCheck];
}

id objc_msgSend_getMode(void *a1, const char *a2, ...)
{
  return [a1 getMode];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}