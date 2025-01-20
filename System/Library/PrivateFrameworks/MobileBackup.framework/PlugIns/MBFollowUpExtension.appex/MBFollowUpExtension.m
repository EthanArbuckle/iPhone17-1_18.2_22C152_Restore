void sub_100002B88(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;

  v3 = a2;
  v4 = MBGetDefaultLog();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v6 = *(void *)(a1 + 32);
      v7 = [v3 localizedDescription];
      *(_DWORD *)buf = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Error saving the background cellular access to %@: %@", buf, 0x16u);

      v9 = [v3 localizedDescription];
      _MBLog();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Successfully saved the background restore cellular access to %@", buf, 0xCu);
    _MBLog();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t MBGetDefaultLog()
{
  return _MBGetDefaultLog();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _MBLog()
{
  return __MBLog();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__openThermalKbase(void *a1, const char *a2, ...)
{
  return [a1 _openThermalKbase];
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accountIdentifier];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inexpensiveCellularAccess(void *a1, const char *a2, ...)
{
  return [a1 inexpensiveCellularAccess];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_personaIdentifier(void *a1, const char *a2, ...)
{
  return [a1 personaIdentifier];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}