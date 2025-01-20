uint64_t start(uint64_t a1)
{
  NSObject *v1;
  void *v3;
  id v4;
  NSArray *v6;
  char *errorbuf;
  uint8_t buf[4];
  char *v9;

  v6 = [+[NSProcessInfo processInfo] arguments];
  _NSCoreDataLog();
  errorbuf = 0;
  if (sandbox_init("com.apple.coredatad", 1uLL, &errorbuf))
  {
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Failed to enter sandbox: %s", a1, v6);
    _NSCoreDataLog();
    v1 = qword_100008130;
    if (os_log_type_enabled((os_log_t)qword_100008130, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v9 = errorbuf;
      _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "CoreData: Failed to enter sandbox: %s", buf, 0xCu);
    }
    return 1;
  }
  else
  {
    _NSCoreDataLog();
    v4 = +[NSCloudKitMirroringDelegate createCloudKitServerWithMachServiceName:andStorageDirectoryPath:](NSCloudKitMirroringDelegate, "createCloudKitServerWithMachServiceName:andStorageDirectoryPath:", 0, 0, 0, 0);
    [v4 setUp];
    [+[NSRunLoop currentRunLoop] run];
    _NSCoreDataLog();
    _NSCoreDataLog();
    [v4 tearDown:v4];

    return 0;
  }
}

uint64_t _NSCoreDataLog()
{
  return __NSCoreDataLog();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

{
}

{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int sandbox_init(const char *profile, uint64_t flags, char **errorbuf)
{
  return _sandbox_init(profile, flags, errorbuf);
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return [a1 arguments];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_pflogFaultLog(void *a1, const char *a2, ...)
{
  return [a1 pflogFaultLog];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_setUp(void *a1, const char *a2, ...)
{
  return [a1 setUp];
}

id objc_msgSend_tearDown(void *a1, const char *a2, ...)
{
  return [a1 tearDown];
}