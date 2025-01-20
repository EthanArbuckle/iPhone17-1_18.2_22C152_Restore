uint64_t start()
{
  void *v0;
  id v1;
  int v3;
  _DWORD v4[2];

  if ((_set_user_dir_suffix() & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v3 = *__error();
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to set private sandbox for com.apple.triald, errno: %d", (uint8_t *)v4, 8u);
  }
  v1 = NSTemporaryDirectory();
  TRIDServerRun();
  return 0;
}

void sub_10000316C(uint64_t a1)
{
  v3 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v3, "descriptionWithLocale:");
  if (!InstanceMethod)
  {
    v6 = +[NSAssertionHandler currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"TRIDaemonScopedSwizzling.m" lineNumber:28 description:@"failed to lookup -[NSDate descriptionWithLocale:]"];
  }
  v5 = class_getInstanceMethod(v3, "tri_memoryFriendlyDescriptionWithLocale:");
  if (!v5)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"TRIDaemonScopedSwizzling.m" lineNumber:30 description:@"failed to lookup -[NSDate tri_memoryFriendlyDescriptionWithLocale:]"];
  }
  method_exchangeImplementations(InstanceMethod, v5);
}

id sub_10000342C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tri_memoryFriendlyDescriptionWithLocale:*(void *)(a1 + 40)];
  if (!v2)
  {
    v4 = +[NSAssertionHandler currentHandler];
    [v4 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"TRIDaemonScopedSwizzling.m", 53, @"Expression was unexpectedly nil/false: %@", @"[self tri_memoryFriendlyDescriptionWithLocale:locale]" object file lineNumber description];
  }

  return v2;
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t TRIDServerRun()
{
  return _TRIDServerRun();
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return _class_getInstanceMethod(cls, name);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return _gmtime_r(a1, a2);
}

void method_exchangeImplementations(Method m1, Method m2)
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_tri_memoryFriendlyDescriptionWithLocale_(void *a1, const char *a2, ...)
{
  return [a1 tri_memoryFriendlyDescriptionWithLocale:];
}