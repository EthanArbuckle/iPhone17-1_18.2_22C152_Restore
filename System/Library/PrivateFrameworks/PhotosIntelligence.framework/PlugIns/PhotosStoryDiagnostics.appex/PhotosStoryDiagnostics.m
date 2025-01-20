void sub_100002AF8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t vars8;

  v5 = a2;
  if ([v5 hasDirectoryPath]
    && ([*(id *)(a1 + 32) repositoryIsEmpty:v5 fileManager:*(void *)(a1 + 40)] & 1) == 0)
  {
    v3 = *(void **)(a1 + 48);
    v4 = +[DEAttachmentItem attachmentWithPathURL:v5];
    [v3 addObject:v4];
  }
}

void sub_100003178(id a1)
{
  byte_1000081F0 = os_variant_has_internal_diagnostics();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_hasDirectoryPath(void *a1, const char *a2, ...)
{
  return [a1 hasDirectoryPath];
}

id objc_msgSend_internalFullDiagnostics(void *a1, const char *a2, ...)
{
  return [a1 internalFullDiagnostics];
}

id objc_msgSend_isAppleInternal(void *a1, const char *a2, ...)
{
  return [a1 isAppleInternal];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}