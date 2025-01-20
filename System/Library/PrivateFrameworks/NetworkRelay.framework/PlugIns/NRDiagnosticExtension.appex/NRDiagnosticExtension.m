void sub_100003CF8(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  uint64_t vars8;

  v2 = *(void **)(a1 + 32);
  v3 = +[DEAttachmentItem attachmentWithPath:a2];
  [v2 addObject:v3];
}

uint64_t NRDiagnosticSaveNetworkRelayStatusToTempDirectory()
{
  return _NRDiagnosticSaveNetworkRelayStatusToTempDirectory();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void NSLog(NSString *format, ...)
{
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

void objc_release(id a1)
{
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}