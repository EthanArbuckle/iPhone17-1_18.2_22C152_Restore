uint64_t start()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  dispatch_queue_t v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  v1 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "mdmd starting...", buf, 2u);
  }
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v3 = dispatch_queue_create("mdmd Catalyst Queue", v2);
  CATSetCatalystQueue();

  v4 = [objc_alloc((Class)DMCPowerAssertion) initWithReason:@"mdmd-Start"];
  v5 = [objc_alloc((Class)MDMServerCore) initWithChannelType:0];
  [v5 startOutError:0];
  v6 = [objc_alloc((Class)MDMServiceDelegate) initWithServer:v5];
  v7 = objc_alloc((Class)NSXPCListener);
  v8 = [v7 initWithMachServiceName:kMDMServiceBootstrapName];
  [v8 setDelegate:v6];
  [v8 resume];

  v9 = +[NSRunLoop currentRunLoop];
  [v9 run];

  v10 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "mdmd stopping.", v12, 2u);
  }

  return 0;
}

uint64_t CATSetCatalystQueue()
{
  return _CATSetCatalystQueue();
}

uint64_t DMCLogObjects()
{
  return _DMCLogObjects();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

id objc_msgSend_startOutError_(void *a1, const char *a2, ...)
{
  return [a1 startOutError:];
}