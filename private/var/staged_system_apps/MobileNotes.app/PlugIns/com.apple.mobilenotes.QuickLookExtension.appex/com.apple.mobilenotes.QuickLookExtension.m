uint64_t ICDynamicCast()
{
  return _ICDynamicCast();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__appearState(void *a1, const char *a2, ...)
{
  return [a1 _appearState];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_note(void *a1, const char *a2, ...)
{
  return [a1 note];
}

id objc_msgSend_notePreviewControllerView(void *a1, const char *a2, ...)
{
  return [a1 notePreviewControllerView];
}

id objc_msgSend_sharedIndexer(void *a1, const char *a2, ...)
{
  return [a1 sharedIndexer];
}

id objc_msgSend_updateNotePreviewControllerFrame(void *a1, const char *a2, ...)
{
  return [a1 updateNotePreviewControllerFrame];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}