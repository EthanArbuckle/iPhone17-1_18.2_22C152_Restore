int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  int v4;
  uint64_t v6;

  v6 = objc_opt_class();
  v3 = +[NSArray arrayWithObjects:&v6 count:1];
  v4 = +[RMConfigurationSubscriberClient runConfigurationSubscriberClientWithApplicators:v3 publisherClass:objc_opt_class()];

  return v4;
}

void sub_100004110(id a1)
{
  qword_10000CF18 = (uint64_t)os_log_create("com.apple.remotemanagementd", "managementTestAdapter");

  _objc_release_x1();
}

void sub_1000043C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10000451C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _applyConfiguration:*(void *)(a1 + 40) replaceKey:*(void *)(a1 + 48) scope:*(void *)(a1 + 64) reasonDescription:a2 completionHandler:*(void *)(a1 + 56)];
}

void sub_1000045FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004D50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004F44(uint64_t a1, int a2, void *a3)
{
  id v7 = a3;
  if (a2)
  {
    v5 = +[NSString stringWithContentsOfURL:*(void *)(a1 + 32) encoding:4 error:0];
  }
  else
  {
    v5 = 0;
  }
  v6 = +[NSFileManager defaultManager];
  [v6 removeItemAtURL:*(void *)(a1 + 32) error:0];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000509C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000055E0(id a1)
{
  qword_10000CF28 = (uint64_t)os_log_create("com.apple.remotemanagementd", "managementTestStatus");

  _objc_release_x1();
}

void sub_100005CDC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Adapter begin", v1, 2u);
}

void sub_100005D20(char a1, NSObject *a2)
{
  CFStringRef v2 = @"failure";
  if (a1) {
    CFStringRef v2 = @"success";
  }
  int v3 = 138412290;
  CFStringRef v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Adapter end: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100005DB0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Download asset URL: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100005E28(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Querying management test status for key paths: %{public}@", (uint8_t *)&v2, 0xCu);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createInternalError(void *a1, const char *a2, ...)
{
  return [a1 createInternalError];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_declaration(void *a1, const char *a2, ...)
{
  return [a1 declaration];
}

id objc_msgSend_declarationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 declarationIdentifier];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_locked(void *a1, const char *a2, ...)
{
  return [a1 locked];
}

id objc_msgSend_managementTestAdapter(void *a1, const char *a2, ...)
{
  return [a1 managementTestAdapter];
}

id objc_msgSend_managementTestStatus(void *a1, const char *a2, ...)
{
  return [a1 managementTestStatus];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_payloadEcho(void *a1, const char *a2, ...)
{
  return [a1 payloadEcho];
}

id objc_msgSend_payloadEchoDataAssetReference(void *a1, const char *a2, ...)
{
  return [a1 payloadEchoDataAssetReference];
}

id objc_msgSend_payloadReturnStatus(void *a1, const char *a2, ...)
{
  return [a1 payloadReturnStatus];
}

id objc_msgSend_registeredIdentifier(void *a1, const char *a2, ...)
{
  return [a1 registeredIdentifier];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}