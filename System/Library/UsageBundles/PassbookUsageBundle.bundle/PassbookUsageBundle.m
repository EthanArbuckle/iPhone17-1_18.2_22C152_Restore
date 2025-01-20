BOOL sub_3474(id a1, NSURL *a2, NSError *a3)
{
  return 1;
}

uint64_t PKHomeDirectoryPath()
{
  return _PKHomeDirectoryPath();
}

uint64_t PKLocalizedString(NSString *a1)
{
  return PKLocalizedString(a1);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__populateUsageBundleApps(void *a1, const char *a2, ...)
{
  return [a1 _populateUsageBundleApps];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_usageBundleAppForBundleWithIdentifier_withTotalSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usageBundleAppForBundleWithIdentifier:withTotalSize:");
}