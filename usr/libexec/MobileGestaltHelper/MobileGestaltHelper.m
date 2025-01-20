void sub_1000018D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFStringRef v9;
  CFStringRef v10;
  CFIndex Length;
  CFIndex v12;
  char *v13;

  v9 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"libMobileGestalt %s:%d: %@", a1, a2, a3, 0);
  v10 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0, v9, &a9);
  Length = CFStringGetLength(v10);
  v12 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  v13 = (char *)malloc_type_calloc(1uLL, v12, 0xBF105376uLL);
  if (v13)
  {
    if (CFStringGetCString(v10, v13, v12, 0x8000100u) == 1 && off_100008788 != 0) {
      off_100008788(v13);
    }
  }
  if (v9) {
    CFRelease(v9);
  }
  if (v10) {
    CFRelease(v10);
  }
  free(v13);
}

uint64_t start()
{
  _MGSetServer();
  +[NSXPCListener enableTransactions];
  id v1 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.mobilegestalt.xpc"];
  v2 = objc_alloc_init(MobileGestaltHelperListener);
  uint64_t v3 = os_transaction_create();
  v4 = (void *)qword_100008790;
  qword_100008790 = v3;

  dispatch_time_t v5 = dispatch_time(0, 5000000000);
  v6 = dispatch_get_global_queue(0, 0);
  dispatch_after(v5, v6, &stru_100004298);

  [v1 setDelegate:v2];
  [v1 resume];
  v7 = (void *)os_transaction_create();
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100002690;
  v12[3] = &unk_1000042C0;
  v9 = v2;
  v13 = v9;
  id v14 = v7;
  id v10 = v7;
  dispatch_after(v8, v6, v12);

  CFRunLoopRun();

  return 0;
}

void sub_100002668(id a1)
{
  if (qword_100008798 != -1) {
    dispatch_once(&qword_100008798, &stru_1000042E0);
  }
}

id sub_100002690(uint64_t a1)
{
  char v2 = _MGCacheValid();
  id result = [*(id *)(a1 + 32) needsNewCachePostBoot];
  if (v2)
  {
    if (result)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Rebuild MGCache on boot was requested. Rebuilding cache.", v4, 2u);
      }
      return (id)_MGRebuildCache();
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MGCache was not valid. Writing new cache.", buf, 2u);
    }
    return (id)_MGWriteCache();
  }
  return result;
}

void sub_10000275C(id a1)
{
  id v1 = (void *)qword_100008790;
  qword_100008790 = 0;
}

void sub_10000276C(void *a1, uint64_t a2, uint64_t a3)
{
  v4 = [a1 processNameForConnection:a2];
  int v5 = 138412546;
  v6 = v4;
  __int16 v7 = 2112;
  uint64_t v8 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "asked question: p = %@, q = AppleTVMode, a = %@", (uint8_t *)&v5, 0x16u);
}

void sub_100002818()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to query boot uuid", v0, 2u);
}

void sub_100002860(uint64_t a1, uint64_t a2, void *a3)
{
  int v5 = [a3 localizedDescription];
  int v6 = 138412802;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  __int16 v10 = 2112;
  v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to write %@ to %@ with error %@", (uint8_t *)&v6, 0x20u);
}

void sub_100002920(void *a1)
{
  id v1 = [a1 localizedDescription];
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "File exists, but couldnt be read. Error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000029B8(void *a1)
{
  id v1 = [a1 localizedDescription];
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to remove sentinel %@", (uint8_t *)&v2, 0xCu);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
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

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t _MGCacheValid()
{
  return __MGCacheValid();
}

uint64_t _MGGetFastPathLog()
{
  return __MGGetFastPathLog();
}

uint64_t _MGRebuildCache()
{
  return __MGRebuildCache();
}

uint64_t _MGServerCopyAnswerWithError()
{
  return __MGServerCopyAnswerWithError();
}

uint64_t _MGServerQuestionIsPlatform()
{
  return __MGServerQuestionIsPlatform();
}

uint64_t _MGSetServer()
{
  return __MGSetServer();
}

uint64_t _MGWriteCache()
{
  return __MGWriteCache();
}

int *__error(void)
{
  return ___error();
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

char *__cdecl rindex(const char *a1, int a2)
{
  return _rindex(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentMode(void *a1, const char *a2, ...)
{
  return [a1 currentMode];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_enableTransactions(void *a1, const char *a2, ...)
{
  return [a1 enableTransactions];
}

id objc_msgSend_getSentinelPath(void *a1, const char *a2, ...)
{
  return [a1 getSentinelPath];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return [a1 height];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return [a1 mainDisplay];
}

id objc_msgSend_needsNewCachePostBoot(void *a1, const char *a2, ...)
{
  return [a1 needsNewCachePostBoot];
}

id objc_msgSend_queryBootUUID(void *a1, const char *a2, ...)
{
  return [a1 queryBootUUID];
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return [a1 regionCode];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_setCacheSentinel(void *a1, const char *a2, ...)
{
  return [a1 setCacheSentinel];
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return [a1 width];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 atomically:x1 encoding:x2 error:x3];
}