uint64_t start()
{
  void *v0;
  NSObject *v1;
  SCLDDaemon *v2;
  void *v3;
  void *v4;

  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v1 = scl_framework_log();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_10000365C(v1);
    }
  }
  v2 = objc_alloc_init(SCLDDaemon);
  v3 = (void *)qword_100008190;
  qword_100008190 = (uint64_t)v2;

  [(id)qword_100008190 start];
  v4 = +[NSRunLoop mainRunLoop];
  [v4 run];

  return 0;
}

void sub_100003594(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, "Notification");
  v3 = scl_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = string;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received XPC event %s", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000365C(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to set user directory suffix", v1, 2u);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return _dispatch_workloop_create(label);
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

uint64_t scl_framework_log()
{
  return _scl_framework_log();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_registerForLaunchEvents(void *a1, const char *a2, ...)
{
  return [a1 registerForLaunchEvents];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}