int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  int v4;
  void v6[2];

  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  v3 = +[NSArray arrayWithObjects:v6 count:2];
  v4 = +[RMConfigurationSubscriberClient runConfigurationSubscriberClientWithApplicators:v3 publisherClass:objc_opt_class()];

  return v4;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return [a1 controller];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentManagedDevice(void *a1, const char *a2, ...)
{
  return [a1 currentManagedDevice];
}

id objc_msgSend_currentProductType(void *a1, const char *a2, ...)
{
  return [a1 currentProductType];
}

id objc_msgSend_declaration(void *a1, const char *a2, ...)
{
  return [a1 declaration];
}

id objc_msgSend_declarationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 declarationIdentifier];
}

id objc_msgSend_declarationKey(void *a1, const char *a2, ...)
{
  return [a1 declarationKey];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_enrolledBetaProgramForCurrentDevice(void *a1, const char *a2, ...)
{
  return [a1 enrolledBetaProgramForCurrentDevice];
}

id objc_msgSend_isSupervised(void *a1, const char *a2, ...)
{
  return [a1 isSupervised];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_oslog(void *a1, const char *a2, ...)
{
  return [a1 oslog];
}

id objc_msgSend_payloadAutomaticActions(void *a1, const char *a2, ...)
{
  return [a1 payloadAutomaticActions];
}

id objc_msgSend_payloadBeta(void *a1, const char *a2, ...)
{
  return [a1 payloadBeta];
}

id objc_msgSend_payloadCombinedPeriodInDays(void *a1, const char *a2, ...)
{
  return [a1 payloadCombinedPeriodInDays];
}

id objc_msgSend_payloadDeferrals(void *a1, const char *a2, ...)
{
  return [a1 payloadDeferrals];
}

id objc_msgSend_payloadDescription(void *a1, const char *a2, ...)
{
  return [a1 payloadDescription];
}

id objc_msgSend_payloadDetailsURL(void *a1, const char *a2, ...)
{
  return [a1 payloadDetailsURL];
}

id objc_msgSend_payloadDownload(void *a1, const char *a2, ...)
{
  return [a1 payloadDownload];
}

id objc_msgSend_payloadEnable(void *a1, const char *a2, ...)
{
  return [a1 payloadEnable];
}

id objc_msgSend_payloadEnableRollback(void *a1, const char *a2, ...)
{
  return [a1 payloadEnableRollback];
}

id objc_msgSend_payloadInstallOSUpdates(void *a1, const char *a2, ...)
{
  return [a1 payloadInstallOSUpdates];
}

id objc_msgSend_payloadInstallSecurityUpdate(void *a1, const char *a2, ...)
{
  return [a1 payloadInstallSecurityUpdate];
}

id objc_msgSend_payloadNotifications(void *a1, const char *a2, ...)
{
  return [a1 payloadNotifications];
}

id objc_msgSend_payloadOfferPrograms(void *a1, const char *a2, ...)
{
  return [a1 payloadOfferPrograms];
}

id objc_msgSend_payloadProgramEnrollment(void *a1, const char *a2, ...)
{
  return [a1 payloadProgramEnrollment];
}

id objc_msgSend_payloadRapidSecurityResponse(void *a1, const char *a2, ...)
{
  return [a1 payloadRapidSecurityResponse];
}

id objc_msgSend_payloadRecommendedCadence(void *a1, const char *a2, ...)
{
  return [a1 payloadRecommendedCadence];
}

id objc_msgSend_payloadRequireProgram(void *a1, const char *a2, ...)
{
  return [a1 payloadRequireProgram];
}

id objc_msgSend_payloadTargetBuildVersion(void *a1, const char *a2, ...)
{
  return [a1 payloadTargetBuildVersion];
}

id objc_msgSend_payloadTargetLocalDateTime(void *a1, const char *a2, ...)
{
  return [a1 payloadTargetLocalDateTime];
}

id objc_msgSend_payloadTargetOSVersion(void *a1, const char *a2, ...)
{
  return [a1 payloadTargetOSVersion];
}

id objc_msgSend_payloadToken(void *a1, const char *a2, ...)
{
  return [a1 payloadToken];
}

id objc_msgSend_registeredIdentifier(void *a1, const char *a2, ...)
{
  return [a1 registeredIdentifier];
}

id objc_msgSend_serializedKeys(void *a1, const char *a2, ...)
{
  return [a1 serializedKeys];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedCore(void *a1, const char *a2, ...)
{
  return [a1 sharedCore];
}

id objc_msgSend_sharedLogger(void *a1, const char *a2, ...)
{
  return [a1 sharedLogger];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}