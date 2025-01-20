void sub_100004360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004388(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004398(uint64_t a1)
{
}

intptr_t sub_1000043A0(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) backend];

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v4 = [v3 backend];
    [v4 runQuery];

    v5 = [*(id *)(a1 + 32) backend];
    [v5 queryResult];
  }
  else
  {
    v5 = [v3 functionName];
    PLBatteryUsageUIQuery();
  uint64_t v6 = };
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  v9 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v9);
}

uint64_t sub_100004450(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
}

void sub_1000045F8(id a1)
{
  qword_10000C6F0 = objc_alloc_init(BatteryUsageQueryModule);
  _objc_release_x1();
}

id PLLogDE()
{
  if (qword_10000C708 != -1) {
    dispatch_once(&qword_10000C708, &stru_1000082F8);
  }
  v0 = (void *)qword_10000C700;
  return v0;
}

void sub_100004AA8(id a1)
{
  qword_10000C700 = (uint64_t)os_log_create("com.apple.DiagnosticExtensions", "PowerlogEPL");
  _objc_release_x1();
}

void sub_100005D7C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100005DA4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005DC0()
{
  sub_100005D98();
  sub_100005DA4((void *)&_mh_execute_header, v0, v1, "Error retrieving Battery UI plists with result: %@", v2, v3, v4, v5, v6);
}

void sub_100005E28()
{
  sub_100005D98();
  sub_100005DA4((void *)&_mh_execute_header, v0, v1, "Error retrieving upgrade logs with result: %@", v2, v3, v4, v5, v6);
}

void sub_100005E90(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Query response for battery ui is null.", v1, 2u);
}

void sub_100005ED4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Query time value in dict is null", v1, 2u);
}

void sub_100005F18()
{
  sub_100005D98();
  sub_100005D7C((void *)&_mh_execute_header, v0, v1, "Wrote to file %@", v2, v3, v4, v5, v6);
}

void sub_100005F80()
{
  sub_100005D98();
  sub_100005DA4((void *)&_mh_execute_header, v0, v1, "Could not write to file %@", v2, v3, v4, v5, v6);
}

void sub_100005FE8()
{
  sub_100005D98();
  sub_100005DA4((void *)&_mh_execute_header, v0, v1, "Error retrieving archives with result: %@", v2, v3, v4, v5, v6);
}

void sub_100006050()
{
  sub_100005D98();
  sub_100005D7C((void *)&_mh_execute_header, v0, v1, "Attachments after upgrade logs: %@", v2, v3, v4, v5, v6);
}

void sub_1000060B8()
{
  sub_100005D98();
  sub_100005D7C((void *)&_mh_execute_header, v0, v1, "Attempting to attach upgrade logs: %@", v2, v3, v4, v5, v6);
}

void sub_100006120()
{
  sub_100005D98();
  sub_100005D7C((void *)&_mh_execute_header, v0, v1, "Attachments after existing BUI plists: %@", v2, v3, v4, v5, v6);
}

void sub_100006188()
{
  sub_100005D98();
  sub_100005D7C((void *)&_mh_execute_header, v0, v1, "Attempting to attach existing BUI plists: %@", v2, v3, v4, v5, v6);
}

void sub_1000061F0()
{
  sub_100005D98();
  sub_100005D7C((void *)&_mh_execute_header, v0, v1, "Attachments after new BUI plist: %@", v2, v3, v4, v5, v6);
}

void sub_100006258()
{
  sub_100005D98();
  sub_100005D7C((void *)&_mh_execute_header, v0, v1, "Attempting to attach new BUI plist: %@", v2, v3, v4, v5, v6);
}

void sub_1000062C0()
{
  sub_100005D98();
  sub_100005D7C((void *)&_mh_execute_header, v0, v1, "Attachments after archives: %@", v2, v3, v4, v5, v6);
}

void sub_100006328()
{
  sub_100005D98();
  sub_100005D7C((void *)&_mh_execute_header, v0, v1, "Attempting to attach archives: %@", v2, v3, v4, v5, v6);
}

void sub_100006390()
{
  sub_100005D98();
  sub_100005D7C((void *)&_mh_execute_header, v0, v1, "Attachments after quarantined Powerlogs: %@", v2, v3, v4, v5, v6);
}

void sub_1000063F8()
{
  sub_100005D98();
  sub_100005D7C((void *)&_mh_execute_header, v0, v1, "Attempting to attach quarantined Powerlogs: %@", v2, v3, v4, v5, v6);
}

void sub_100006460()
{
  sub_100005D98();
  sub_100005D7C((void *)&_mh_execute_header, v0, v1, "Attachments after current Powerlog: %@", v2, v3, v4, v5, v6);
}

void sub_1000064C8()
{
  sub_100005D98();
  sub_100005D7C((void *)&_mh_execute_header, v0, v1, "Attempting to attach current Powerlog: %@", v2, v3, v4, v5, v6);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t PLBatteryUsageUIQuery()
{
  return _PLBatteryUsageUIQuery();
}

uint64_t PLQueryRegistered()
{
  return _PLQueryRegistered();
}

uint64_t PLTalkToPowerlogHelper()
{
  return _PLTalkToPowerlogHelper();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backend(void *a1, const char *a2, ...)
{
  return [a1 backend];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_functionName(void *a1, const char *a2, ...)
{
  return [a1 functionName];
}

id objc_msgSend_generateBatteryUIPlistFile(void *a1, const char *a2, ...)
{
  return [a1 generateBatteryUIPlistFile];
}

id objc_msgSend_getArchives(void *a1, const char *a2, ...)
{
  return [a1 getArchives];
}

id objc_msgSend_getBatteryUIPlists(void *a1, const char *a2, ...)
{
  return [a1 getBatteryUIPlists];
}

id objc_msgSend_getPowerlog(void *a1, const char *a2, ...)
{
  return [a1 getPowerlog];
}

id objc_msgSend_getQuarantinedPowerlogs(void *a1, const char *a2, ...)
{
  return [a1 getQuarantinedPowerlogs];
}

id objc_msgSend_getUpgradeLogs(void *a1, const char *a2, ...)
{
  return [a1 getUpgradeLogs];
}

id objc_msgSend_graphArray(void *a1, const char *a2, ...)
{
  return [a1 graphArray];
}

id objc_msgSend_graphNames(void *a1, const char *a2, ...)
{
  return [a1 graphNames];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_manualFileName(void *a1, const char *a2, ...)
{
  return [a1 manualFileName];
}

id objc_msgSend_queryResult(void *a1, const char *a2, ...)
{
  return [a1 queryResult];
}

id objc_msgSend_queryType(void *a1, const char *a2, ...)
{
  return [a1 queryType];
}

id objc_msgSend_runQuery(void *a1, const char *a2, ...)
{
  return [a1 runQuery];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}