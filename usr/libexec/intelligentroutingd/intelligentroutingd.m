void start()
{
  void *v0;
  void *v1;
  NSObject *v2;
  id v3;
  void *v4;
  uint8_t v5[16];

  IRSetupLogging();
  v2 = IRLogObject;
  if (os_log_type_enabled(IRLogObject, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "starting daemon", v5, 2u);
  }
  v3 = objc_alloc_init((Class)IRDaemon);
  v4 = (void *)qword_100008008;
  qword_100008008 = (uint64_t)v3;

  [(id)qword_100008008 run];
  dispatch_main();
}

uint64_t IRSetupLogging()
{
  return _IRSetupLogging();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_main(void)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}