void sub_19C4(id a1)
{
  NSObject *v1;
  uint8_t v2[16];

  off_8A98 = (uint64_t (*)(void))IMWeakLinkSymbol();
  if (!off_8A98)
  {
    v1 = _ATLogCategorySyncBundle();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Failed to weak link PCSRestoreCKBackup from ProtectedCloudStorage", v2, 2u);
    }
  }
}

id sub_1F04(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prioritizeRecentAttachments];
}

id sub_256C()
{
  v0 = objc_opt_class();

  return [v0 restoreProtectedCloudStorageMobileBackup];
}

uint64_t IMDAttachmentRecordCopyRecentFilenames()
{
  return _IMDAttachmentRecordCopyRecentFilenames();
}

uint64_t IMGetDomainBoolForKey()
{
  return _IMGetDomainBoolForKey();
}

uint64_t IMGetDomainValueForKey()
{
  return _IMGetDomainValueForKey();
}

uint64_t IMSetDomainBoolForKey()
{
  return _IMSetDomainBoolForKey();
}

uint64_t IMSetDomainValueForKey()
{
  return _IMSetDomainValueForKey();
}

uint64_t IMWeakLinkSymbol()
{
  return _IMWeakLinkSymbol();
}

uint64_t _ATLogCategorySyncBundle()
{
  return __ATLogCategorySyncBundle();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return [a1 blockUntilConnected];
}

id objc_msgSend_cleanupAttachments(void *a1, const char *a2, ...)
{
  return [a1 cleanupAttachments];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_disconnectFromDaemon(void *a1, const char *a2, ...)
{
  return [a1 disconnectFromDaemon];
}

id objc_msgSend_isDirectory(void *a1, const char *a2, ...)
{
  return [a1 isDirectory];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stringGUID(void *a1, const char *a2, ...)
{
  return [a1 stringGUID];
}