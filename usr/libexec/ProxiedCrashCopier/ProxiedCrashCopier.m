uint64_t start()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  uint8_t v7[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting companionLogRelay", v7, 2u);
  }
  v1 = objc_alloc((Class)PCCProxyingDevice);
  v2 = objc_alloc_init((Class)PCCIDSEndpoint);
  v3 = [v1 initWithEndpoint:v2];

  v4 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.OSASyncProxy.client"];
  [v4 setDelegate:v3];
  [v4 resume];

  if (v3)
  {
    v5 = +[NSRunLoop currentRunLoop];
    [v5 run];
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100003D28();
  }

  return 1;
}

void sub_100003D28()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to instantiate PCCProxyingDevice. Exiting..", v0, 2u);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}