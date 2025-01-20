uint64_t start(int a1, uint64_t a2)
{
  xpc_object_t v2;
  void *v3;
  void *TargetingWorkloopWithPriority;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v10;
  const char *v11;

  if (a1 >= 2 && !strcmp(*(const char **)(a2 + 8), "server"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 136315138;
      v11 = "200.0.1";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cca start, log version:%s", (uint8_t *)&v10, 0xCu);
    }
    if (!FigGetCFPreferenceBooleanWithDefault())
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cca force exiting, because the platform doesn't support it running as server", (uint8_t *)&v10, 2u);
      }
      [@"com.apple.cmio.registerassistantservice.system-extensions.matching" UTF8String];
      [@"com.apple.cmio.ContinuityCaptureAgent.extension.discovery" UTF8String];
      xpc_set_event();
      exit(0);
    }
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "CMIOExtensionBundleIdentifier", "com.apple.cmio.ContinuityCaptureAgent");
    [@"com.apple.cmio.registerassistantservice.system-extensions.matching" UTF8String];
    [@"com.apple.cmio.ContinuityCaptureAgent.extension.discovery" UTF8String];
    xpc_set_event();

    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    TargetingWorkloopWithPriority = (void *)FigDispatchQueueCreateTargetingWorkloopWithPriority();

    v5 = +[NSFileManager defaultManager];
    v6 = [v5 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.portrait.BackgroundReplacement"];

    v7 = [objc_alloc((Class)CMContinuityCaptureProvider) initWithQueue:TargetingWorkloopWithPriority];
    v8 = (void *)qword_100008028;
    qword_100008028 = (uint64_t)v7;

    if (qword_100008028)
    {
      [(id)qword_100008028 activate];
      CFRunLoopRun();
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ContinuityCaptureAgent, exit", (uint8_t *)&v10, 2u);
  }
  return 0;
}

void CFRunLoopRun(void)
{
}

uint64_t FigDispatchQueueCreateTargetingWorkloopWithPriority()
{
  return _FigDispatchQueueCreateTargetingWorkloopWithPriority();
}

uint64_t FigGetCFPreferenceBooleanWithDefault()
{
  return _FigGetCFPreferenceBooleanWithDefault();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

void exit(int a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

uint64_t xpc_set_event()
{
  return _xpc_set_event();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithQueue:];
}