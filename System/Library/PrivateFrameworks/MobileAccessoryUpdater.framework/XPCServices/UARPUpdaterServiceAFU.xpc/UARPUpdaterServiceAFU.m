void sub_100001FE8(uint64_t a1)
{
  unsigned __int8 v2;
  NSObject *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;

  v2 = [*(id *)(a1 + 32) createFWAssetInfo];
  v3 = *(NSObject **)(*(void *)(a1 + 40) + 8);
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      v5 = *(void *)(a1 + 48);
      v10 = 136315394;
      v11 = "-[UARPUpdaterServiceAFU ioKitRuleMatched:]_block_invoke";
      v12 = 2112;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s: Updating Firmware for %@", (uint8_t *)&v10, 0x16u);
    }
    v6 = [*(id *)(a1 + 32) updateFirmwareWithOptions:0];
    if (v6)
    {
      v7 = *(NSObject **)(*(void *)(a1 + 40) + 8);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100002838(a1, (uint64_t)v6, v7);
      }
    }
    v8 = [*(id *)(a1 + 40) controllers];
    [v8 removeObject:*(void *)(a1 + 32)];
  }
  else if (v4)
  {
    v9 = *(void *)(a1 + 48);
    v10 = 136315394;
    v11 = "-[UARPUpdaterServiceAFU ioKitRuleMatched:]_block_invoke";
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s: Failed to get firmware asset Info for %@", (uint8_t *)&v10, 0x16u);
  }
}

uint64_t sub_10000234C(uint64_t a1)
{
  qword_100008B68 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = os_log_create("com.apple.accessoryupdater.UARPUpdaterServiceAFU", "main");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "UARP Updater Service AFU Started", v7, 2u);
  }
  if (!AUSandboxPlatformInit(v3, "com.apple.accessoryupdater.UARPUpdaterServiceAFU"))
  {
    v4 = objc_opt_new();
    v5 = +[NSXPCListener serviceListener];
    [v5 setDelegate:v4];
    [v5 resume];
  }
  return 0;
}

uint64_t AUSandboxPlatformInitWithBundleIdentifier(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v1 = &_os_log_default;
    id v2 = &_os_log_default;
  }
  id v3 = v1;
  bzero(v7, 0x400uLL);
  id v4 = v3;
  if (_set_user_dir_suffix())
  {
    if (confstr(65537, v7, 0x400uLL))
    {
      uint64_t v5 = 0;
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      sub_100002960();
    }
  }
  else if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    sub_1000029E0();
  }

  uint64_t v5 = 1;
LABEL_11:

  return v5;
}

void sub_10000278C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1000027AC(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  id v3 = "-[UARPUpdaterServiceAFU ioKitRuleMatched:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to init AFU Controller for %@", (uint8_t *)&v2, 0x16u);
}

void sub_100002838(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = 136315650;
  uint64_t v5 = "-[UARPUpdaterServiceAFU ioKitRuleMatched:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Failed to update %@ with error: %@", (uint8_t *)&v4, 0x20u);
}

void sub_1000028D4(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[UARPUpdaterServiceAFUPreferences overriddenFirmwareAssetDirectoryURL]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: read value %@", (uint8_t *)&v2, 0x16u);
}

void sub_100002960()
{
  __error();
  sub_10000278C((void *)&_mh_execute_header, v0, v1, "failed to initialize temporary directory: %d", v2, v3, v4, v5, 0);
}

void sub_1000029E0()
{
  __error();
  sub_10000278C((void *)&_mh_execute_header, v0, v1, "failed to set temporary directory suffix: %d", v2, v3, v4, v5, 0);
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_controllers(void *a1, const char *a2, ...)
{
  return [a1 controllers];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createFWAssetInfo(void *a1, const char *a2, ...)
{
  return [a1 createFWAssetInfo];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_overriddenFirmwareAssetDirectoryURL(void *a1, const char *a2, ...)
{
  return [a1 overriddenFirmwareAssetDirectoryURL];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_registryEntryID(void *a1, const char *a2, ...)
{
  return [a1 registryEntryID];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_updateFirmwareWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateFirmwareWithOptions:");
}