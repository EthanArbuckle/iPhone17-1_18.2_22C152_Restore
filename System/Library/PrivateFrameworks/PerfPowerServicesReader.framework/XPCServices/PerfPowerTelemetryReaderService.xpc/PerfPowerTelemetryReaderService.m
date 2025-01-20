void sub_100002BCC(id a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = PPSLogReaderService();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "XPC connection interrupted", v2, 2u);
  }
}

void sub_100002C34(uint64_t a1)
{
  v2 = PPSLogReaderService();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 32);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "XPC connection with client pid: %d invalidated", (uint8_t *)v4, 8u);
  }
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];
  exit(1);
}

id PPSLogReaderService()
{
  if (qword_1000087A8 != -1) {
    dispatch_once(&qword_1000087A8, &stru_100004240);
  }
  v0 = (void *)qword_1000087A0;
  return v0;
}

void sub_100002D7C(id a1)
{
  qword_1000087A0 = (uint64_t)os_log_create("com.apple.PerfPowerServicesReaderService", "xpc");
  _objc_release_x1();
}

void sub_100003028(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Process %d has read entitlement!", (uint8_t *)v2, 8u);
}

void sub_1000030A0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Process %d does not have read entitlement!", (uint8_t *)v2, 8u);
}

void sub_100003118(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%{public}@: Connection attempt from %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_1000031A0(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Empty request", v1, 2u);
}

void sub_1000031E4(void *a1, uint64_t a2, void *a3, NSObject **a4)
{
  id v6 = objc_begin_catch(a1);
  *a3 = v6;
  id v7 = v6;
  v8 = PPSLogReaderService();
  *a4 = v8;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138543362;
    id v10 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Exception while executing request: %{public}@", (uint8_t *)&v9, 0xCu);
  }
}

void sub_1000032A8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Executing request: %{public}@", (uint8_t *)&v2, 0xCu);
}

NSUncaughtExceptionHandler *NSGetUncaughtExceptionHandler(void)
{
  return _NSGetUncaughtExceptionHandler();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void exit(int a1)
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return [a1 exportedInterface];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}