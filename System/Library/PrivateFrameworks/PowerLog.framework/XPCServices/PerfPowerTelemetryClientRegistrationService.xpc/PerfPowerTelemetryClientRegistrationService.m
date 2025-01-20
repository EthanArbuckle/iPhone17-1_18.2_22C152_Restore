int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];
  exit(1);
}

void sub_1000023F8(id a1)
{
  qword_100008798 = (uint64_t)os_log_create("com.apple.PerfPowerServices", "ClientRegistrationService");
  _objc_release_x1();
}

id sub_10000266C()
{
  if (qword_1000087D0 != -1) {
    dispatch_once(&qword_1000087D0, &stru_1000041C8);
  }
  v0 = (void *)qword_1000087C8;
  return v0;
}

void sub_100002800(id a1)
{
  qword_1000087B0 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"PerfPowerServicesDataStream"];
  _objc_release_x1();
}

void sub_100002A5C(id a1)
{
}

void sub_100002CC0(id a1)
{
  qword_1000087C8 = (uint64_t)os_log_create("com.apple.PerfPowerServices", "ClientRegistrationService");
  _objc_release_x1();
}

void sub_100002D04(void *a1, NSObject *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 processIdentifier];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Process %d does not have write entitlements!", (uint8_t *)v3, 8u);
}

void sub_100002D90(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Current subCat %@  overridesubCat %@", (uint8_t *)&v3, 0x16u);
}

void sub_100002E18(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not read test allowlist with error: %@", (uint8_t *)&v2, 0xCu);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_containerPath(void *a1, const char *a2, ...)
{
  return [a1 containerPath];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_getClientPermissions(void *a1, const char *a2, ...)
{
  return [a1 getClientPermissions];
}

id objc_msgSend_getPrivacyClientPermissions(void *a1, const char *a2, ...)
{
  return [a1 getPrivacyClientPermissions];
}

id objc_msgSend_getTestClientPermissions(void *a1, const char *a2, ...)
{
  return [a1 getTestClientPermissions];
}

id objc_msgSend_hasWriteEntitlements(void *a1, const char *a2, ...)
{
  return [a1 hasWriteEntitlements];
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

id objc_msgSend_userDefaults(void *a1, const char *a2, ...)
{
  return [a1 userDefaults];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}