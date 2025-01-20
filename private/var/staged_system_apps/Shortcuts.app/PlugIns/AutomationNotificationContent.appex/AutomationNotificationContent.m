void sub_1000032C8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t vars8;

  v3 = a2;
  if ([v3 isEnabled]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t WFTriggerIDsToDisableFromNotificationUserInfo()
{
  return _WFTriggerIDsToDisableFromNotificationUserInfo();
}

uint64_t WFTriggerIDsToDisableNotificationUserInfoFromTriggers()
{
  return _WFTriggerIDsToDisableNotificationUserInfoFromTriggers();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t getWFTriggerNotificationsLogObject()
{
  return _getWFTriggerNotificationsLogObject();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

id objc_msgSend_allConfiguredTriggers(void *a1, const char *a2, ...)
{
  return [a1 allConfiguredTriggers];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifier];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultDatabase(void *a1, const char *a2, ...)
{
  return [a1 defaultDatabase];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_preferredSize(void *a1, const char *a2, ...)
{
  return [a1 preferredSize];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}