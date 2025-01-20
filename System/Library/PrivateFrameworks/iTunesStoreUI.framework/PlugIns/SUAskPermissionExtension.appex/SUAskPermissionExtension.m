uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t SSFileLog()
{
  return _SSFileLog();
}

uint64_t _os_log_send_and_compose_impl()
{
  return __os_log_send_and_compose_impl();
}

void free(void *a1)
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return [a1 OSLogObject];
}

id objc_msgSend_allStoreDownloadKinds(void *a1, const char *a2, ...)
{
  return [a1 allStoreDownloadKinds];
}

id objc_msgSend_buyParams(void *a1, const char *a2, ...)
{
  return [a1 buyParams];
}

id objc_msgSend_compile(void *a1, const char *a2, ...)
{
  return [a1 compile];
}

id objc_msgSend_reloadFromServer(void *a1, const char *a2, ...)
{
  return [a1 reloadFromServer];
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return [a1 sharedConfig];
}

id objc_msgSend_shouldLog(void *a1, const char *a2, ...)
{
  return [a1 shouldLog];
}

id objc_msgSend_shouldLogToDisk(void *a1, const char *a2, ...)
{
  return [a1 shouldLogToDisk];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}