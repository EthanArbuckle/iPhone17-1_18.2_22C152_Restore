int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t vars8;

  v3 = objc_opt_class();

  return +[RMConfigurationSubscriberClient runConfigurationSubscriberClientWithApplicators:&__NSArray0__struct publisherClass:v3];
}

void sub_100002E90(id a1)
{
  qword_100008660 = (uint64_t)os_log_create("com.apple.remotemanagementd", "batteryHealthLog");

  _objc_release_x1();
}

void sub_1000033A8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Querying status for key paths: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100003420(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Battery health info was not returned", v1, 2u);
}

void sub_100003464(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching battery health state: %d", (uint8_t *)v2, 8u);
}

void sub_1000034DC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Device does not have a battery!", v1, 2u);
}

uint64_t IOPSGetBatteryHealthState()
{
  return _IOPSGetBatteryHealthState();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_msgSend_batteryHealthLog(void *a1, const char *a2, ...)
{
  return [a1 batteryHealthLog];
}

id objc_msgSend_batteryHealthState(void *a1, const char *a2, ...)
{
  return [a1 batteryHealthState];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_hasBattery(void *a1, const char *a2, ...)
{
  return [a1 hasBattery];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isAppleSiliconMac(void *a1, const char *a2, ...)
{
  return [a1 isAppleSiliconMac];
}

id objc_msgSend_isPhone(void *a1, const char *a2, ...)
{
  return [a1 isPhone];
}

id objc_msgSend_isSupportedPlatform(void *a1, const char *a2, ...)
{
  return [a1 isSupportedPlatform];
}

id objc_msgSend_rawBatteryHealthServiceState(void *a1, const char *a2, ...)
{
  return [a1 rawBatteryHealthServiceState];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}