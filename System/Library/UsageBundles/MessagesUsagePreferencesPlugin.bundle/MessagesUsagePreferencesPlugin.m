uint64_t IMLegacyCalculateFileSizeForPath()
{
  return _IMLegacyCalculateFileSizeForPath();
}

uint64_t IMRoundFileSize()
{
  return _IMRoundFileSize();
}

uint64_t IMSharedHelperMessagesRootFolderPath()
{
  return _IMSharedHelperMessagesRootFolderPath();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_usageBundleAppForBundleWithIdentifier_withTotalSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageBundleAppForBundleWithIdentifier:withTotalSize:");
}