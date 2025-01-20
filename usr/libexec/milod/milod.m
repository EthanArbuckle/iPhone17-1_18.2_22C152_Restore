void start()
{
  void *v0;
  NSObject *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint8_t v7[16];

  if (qword_100008038 != -1) {
    dispatch_once(&qword_100008038, &stru_100004110);
  }
  v1 = qword_100008040;
  if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "milod started", v7, 2u);
  }
  v2 = objc_alloc((Class)ULServer);
  v3 = +[ULEnvironment standardEnvironment];
  v4 = [v2 initWithEnvironment:v3];
  v5 = (void *)qword_100008048;
  qword_100008048 = (uint64_t)v4;

  v6 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.milod.xpc.service"];
  [v6 setDelegate:qword_100008048];
  [v6 resume];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000040D0);

  dispatch_main();
}

void sub_100003B34(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    v3 = string;
    if (!strcmp("RTLocationsOfInterestDidClearNotification", string))
    {
      v4 = (void *)qword_100008048;
      [v4 locationsOfInterestDidClearNotification];
    }
    else if (!strcmp("com.apple.Preferences.ResetPrivacyWarningsNotification", v3))
    {
      v5 = (void *)qword_100008048;
      [v5 resetPrivacyWarningsNotification];
    }
  }
}

void sub_100003BDC(id a1)
{
  qword_100008040 = (uint64_t)os_log_create("com.apple.MicroLocation", "MicroLocation");

  _objc_release_x1();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_standardEnvironment(void *a1, const char *a2, ...)
{
  return [a1 standardEnvironment];
}