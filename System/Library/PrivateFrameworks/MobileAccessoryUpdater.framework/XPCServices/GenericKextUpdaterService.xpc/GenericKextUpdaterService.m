int main(int argc, const char **argv, const char **envp)
{
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
      sub_100002E00();
    }
  }
  else if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    sub_100002E80();
  }

  uint64_t v5 = 1;
LABEL_11:

  return v5;
}

void sub_100002DE0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100002E00()
{
  __error();
  sub_100002DE0((void *)&_mh_execute_header, v0, v1, "failed to initialize temporary directory: %d", v2, v3, v4, v5, 0);
}

void sub_100002E80()
{
  __error();
  sub_100002DE0((void *)&_mh_execute_header, v0, v1, "failed to set temporary directory suffix: %d", v2, v3, v4, v5, 0);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_createFWAssetInfo(void *a1, const char *a2, ...)
{
  return [a1 createFWAssetInfo];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return [a1 deviceClass];
}

id objc_msgSend_pluginInfo(void *a1, const char *a2, ...)
{
  return [a1 pluginInfo];
}

id objc_msgSend_updateFirmwareWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateFirmwareWithOptions:");
}