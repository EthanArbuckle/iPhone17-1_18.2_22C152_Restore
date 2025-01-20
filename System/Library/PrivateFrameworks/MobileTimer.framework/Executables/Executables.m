uint64_t start()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  void *v3;
  CFRunLoopRunResult v4;
  NSObject *v5;
  uint8_t v7[16];

  v1 = MTLogForCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "mobiletimerd starting...", v7, 2u);
  }

  v2 = dispatch_get_global_queue(2, 0);
  dispatch_async(v2, &stru_100004098);

  do
  {
    v4 = CFRunLoopRunInMode(kCFRunLoopDefaultMode, 10.0, 0);
  }
  while ((v4 - 3) < 0xFFFFFFFE);
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10000385C(v5);
  }

  return 0;
}

void sub_100003834(id a1)
{
  id v1 = +[MTAgent agent];
}

void sub_10000385C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "mobiletimerd quit unexpectedly", v1, 2u);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

uint64_t MTLogForCategory()
{
  return _MTLogForCategory();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

{
}

{
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

id objc_msgSend_agent(void *a1, const char *a2, ...)
{
  return [a1 agent];
}