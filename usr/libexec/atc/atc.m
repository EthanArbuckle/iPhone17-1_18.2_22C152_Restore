uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  pid_t v11;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  pid_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v1 = (void *)MGCopyAnswer();
  v2 = (void *)MGCopyAnswer();
  v3 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v20 = getpid();
    v21 = 2114;
    v22 = v2;
    v23 = 2114;
    v24 = v1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ATC starting up. PID:%d, deviceModel=%{public}@, buildVersion=%{public}@", buf, 0x1Cu);
  }

  NSSetUncaughtExceptionHandler((NSUncaughtExceptionHandler *)sub_10000356C);
  v4 = +[ATDeviceService sharedInstance];
  v5 = [objc_alloc((Class)MSVXPCTransaction) initWithName:@"com.apple.atc.startup"];
  [v5 beginTransaction];
  +[ATSession setSessionHost:1];
  v6 = dispatch_get_global_queue(0, 0);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_100003464;
  v16 = &unk_100004108;
  v7 = v4;
  v17 = v7;
  v18 = v5;
  v8 = v5;
  dispatch_async(v6, &v13);

  v9 = +[NSRunLoop mainRunLoop];
  [v9 run];

  v10 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = getpid();
    *(_DWORD *)buf = 67109120;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ATC shutting down, PID:%d", buf, 8u);
  }

  [v7 stop];
  return 0;
}

void sub_100003464(uint64_t a1)
{
  v2 = +[NSDate date];
  ATWaitForSpringBoard();
  v3 = +[NSDate date];
  [v3 timeIntervalSinceDate:v2];
  uint64_t v5 = v4;

  v6 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    uint64_t v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "---Waited for SB: %.1fs---", (uint8_t *)&v7, 0xCu);
  }

  [*(id *)(a1 + 32) run];
  [*(id *)(a1 + 40) endTransaction];
}

void sub_10000356C(void *a1)
{
  id v1 = a1;
  v2 = _ATLogCategoryFramework();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    v3 = [v1 callStackSymbols];
    int v4 = 138543618;
    id v5 = v1;
    __int16 v6 = 2114;
    int v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "Uncaught exception in ATC, crashing: %{public}@, %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t ATWaitForSpringBoard()
{
  return _ATWaitForSpringBoard();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void NSSetUncaughtExceptionHandler(NSUncaughtExceptionHandler *a1)
{
}

uint64_t _ATLogCategoryFramework()
{
  return __ATLogCategoryFramework();
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

pid_t getpid(void)
{
  return _getpid();
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return [a1 beginTransaction];
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return [a1 callStackSymbols];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_endTransaction(void *a1, const char *a2, ...)
{
  return [a1 endTransaction];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:x0];
}