uint64_t start()
{
  void *v0;
  NSObject *v1;
  id v2;
  NSObject *v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  CFStringRef v14;

  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v1 = HKSPLogForCategory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Failed to set user directory suffix", (uint8_t *)&v11, 2u);
    }
  }
  v2 = NSTemporaryDirectory();
  if (+[_HKBehavior processHasLoadedUIKit])
  {
    v3 = HKSPLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v11) = 0;
      _os_log_fault_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "**** SLEEPD HAS UIKIT AS A DEPENDENCY ****", (uint8_t *)&v11, 2u);
    }
  }
  v4 = HKSPLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "sleepd initializing...", (uint8_t *)&v11, 2u);
  }

  v5 = objc_alloc_init((Class)HDSPSleepDaemon);
  v6 = HKSPLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sleepd starting...", (uint8_t *)&v11, 2u);
  }

  [v5 start];
  v7 = HKSPLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = +[_HKBehavior currentOSBuild];
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = &stru_1000040B0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "sleepd started on %{public}@ %{public}@", (uint8_t *)&v11, 0x16u);
  }
  v9 = +[NSRunLoop mainRunLoop];
  [v9 run];

  return 0;
}

uint64_t HKSPLogForCategory()
{
  return _HKSPLogForCategory();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_currentOSBuild(void *a1, const char *a2, ...)
{
  return [a1 currentOSBuild];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_processHasLoadedUIKit(void *a1, const char *a2, ...)
{
  return [a1 processHasLoadedUIKit];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}