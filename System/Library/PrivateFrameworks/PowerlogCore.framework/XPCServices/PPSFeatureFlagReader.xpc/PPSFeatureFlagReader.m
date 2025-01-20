id PPSFeatureFlagReaderLog()
{
  void *v0;
  uint64_t vars8;

  if (qword_1000089C0 != -1) {
    dispatch_once(&qword_1000089C0, &stru_100004238);
  }
  v0 = (void *)qword_1000089B8;
  return v0;
}

void sub_100001188(id a1)
{
  qword_1000089B8 = (uint64_t)os_log_create("com.apple.powerlog", "PPSFeatureFlagReader");
  _objc_release_x1();
}

void sub_10000127C(id a1)
{
  v1 = PPSFeatureFlagReaderLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100002270(v1);
  }

  dispatch_time_t v2 = dispatch_time(0, 60000000000);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, &stru_100004278);
}

void sub_1000012E8(id a1)
{
  v1 = PPSFeatureFlagReaderLog();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)dispatch_time_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Requesting exit in invalidation handler...", v2, 2u);
  }

  xpc_transaction_exit_clean();
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id logPPSFeatureFlagReader()
{
  if (qword_1000089D0 != -1) {
    dispatch_once(&qword_1000089D0, &stru_100004298);
  }
  v0 = (void *)qword_1000089C8;
  return v0;
}

void sub_100001404(id a1)
{
  qword_1000089C8 = (uint64_t)os_log_create("com.apple.powerlog", "PPSFeatureFlagReader");
  _objc_release_x1();
}

void sub_100001544(id a1)
{
  v1 = logPPSFeatureFlagReader();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGTERM handler invoked!", v2, 2u);
  }

  exit(0);
}

void sub_100001C08(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(a1);
    v3 = logPPSFeatureFlagReader();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      sub_1000024B0((uint64_t)v2, v3);
    }

    objc_end_catch();
    JUMPOUT(0x100001BD4);
  }
  _Unwind_Resume(a1);
}

id logPPSFeatureFlagReaderHelper()
{
  if (qword_1000089E0 != -1) {
    dispatch_once(&qword_1000089E0, &stru_1000042D8);
  }
  v0 = (void *)qword_1000089D8;
  return v0;
}

void sub_100001D24(id a1)
{
  qword_1000089D8 = (uint64_t)os_log_create("com.apple.powerlog", "PPSFeatureFlagReaderHelper");
  _objc_release_x1();
}

void sub_100001FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100001FC8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100001FD8(uint64_t a1)
{
}

void sub_100001FE0(uint64_t a1, void *a2)
{
}

void sub_1000020FC(id a1)
{
  v1 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_100002644();
  }
}

void sub_100002140(id a1)
{
  v1 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    sub_100002684();
  }
}

void sub_100002184(id a1, NSError *a2)
{
  id v2 = a2;
  v3 = logPPSFeatureFlagReaderHelper();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000026C4(v2, v3);
  }
}

void sub_100002248(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100002270(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 60;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Exit handler triggered for PPSFeatureFlagReader! Attempting to exit in %d seconds...", (uint8_t *)v1, 8u);
}

void sub_1000022F0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "[PPSFeatureFlagReader] exception occurred when getting Feature Flags: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100002368(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] Set of Feature Flag Domains: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000023E0(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] Domain set is empty", v1, 2u);
}

void sub_100002424(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Missing read entitlement", v1, 2u);
}

void sub_100002468(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Process %d does not have entitlement to launch XPC!", buf, 8u);
}

void sub_1000024B0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Exception occured when doing an Entitlement Check: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100002528(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "[PPSFeatureFlagReader] getFeatureFlags result: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1000025A8()
{
  sub_100002264();
  sub_100002248((void *)&_mh_execute_header, v0, v1, "[PPSFeatureFlagReader] getFeatureFlags called", v2, v3, v4, v5, v6);
}

void sub_1000025DC()
{
  sub_100002264();
  sub_100002248((void *)&_mh_execute_header, v0, v1, "[PPSFeatureFlagReader] Spinning up xpc svc", v2, v3, v4, v5, v6);
}

void sub_100002610()
{
  sub_100002264();
  sub_100002248((void *)&_mh_execute_header, v0, v1, "[PPSFeatureFlagReader] establishing a connection", v2, v3, v4, v5, v6);
}

void sub_100002644()
{
  sub_100002264();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[PPSFeatureFlagReader] Connection was interrupted.", v1, 2u);
}

void sub_100002684()
{
  sub_100002264();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "[PPSFeatureFlagReader] Invalid connection handler is happening.", v1, 2u);
}

void sub_1000026C4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "os_log_debug Connection error happened %@", (uint8_t *)&v4, 0xCu);
}

void sub_10000275C()
{
  sub_100002264();
  sub_100002248((void *)&_mh_execute_header, v0, v1, "[PPSFeatureFlagReader] getFeatureFlags Connection Closed", v2, v3, v4, v5, v6);
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_closeXPCConnection(void *a1, const char *a2, ...)
{
  return [a1 closeXPCConnection];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createXPCConnection(void *a1, const char *a2, ...)
{
  return [a1 createXPCConnection];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return [a1 domains];
}

id objc_msgSend_hasEntitlements(void *a1, const char *a2, ...)
{
  return [a1 hasEntitlements];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}