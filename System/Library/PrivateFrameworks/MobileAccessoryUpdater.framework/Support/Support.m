uint64_t sub_100002510(NSObject *a1)
{
  NSObject *v1;
  char v3[1024];

  if (a1) {
    v1 = a1;
  }
  else {
    v1 = &_os_log_default;
  }
  bzero(v3, 0x400uLL);
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100002CE0();
    }
    return 1;
  }
  if (!confstr(65537, v3, 0x400uLL))
  {
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100002C60();
    }
    return 1;
  }
  return 0;
}

void sub_1000025FC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t start()
{
  FudLog();
  FudLogSetMode();
  if (sub_1000025F8(0) || (v2 = objc_alloc_init(FudEarlyBoot)) == 0)
  {
    FudLog();
    uint64_t v1 = 1;
  }
  else
  {
    v3 = v2;
    uint64_t v1 = [(FudEarlyBoot *)v2 doFUDEarlyBoot:0];

    FudLog();
  }
  return v1;
}

void sub_100002C60()
{
  __error();
  sub_1000025FC((void *)&_mh_execute_header, v0, v1, "failed to initialize temporary directory: %d", v2, v3, v4, v5, 0);
}

void sub_100002CE0()
{
  __error();
  sub_1000025FC((void *)&_mh_execute_header, v0, v1, "failed to set temporary directory suffix: %d", v2, v3, v4, v5, 0);
}

uint64_t FudLog()
{
  return _FudLog();
}

uint64_t FudLogSetMode()
{
  return _FudLogSetMode();
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

void dispatch_release(dispatch_object_t object)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_calculateTimeTakenForEarlyBootEntries(void *a1, const char *a2, ...)
{
  return [a1 calculateTimeTakenForEarlyBootEntries];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createFWAssetInfo(void *a1, const char *a2, ...)
{
  return [a1 createFWAssetInfo];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_enableEarlyBootLoggingMode(void *a1, const char *a2, ...)
{
  return [a1 enableEarlyBootLoggingMode];
}

id objc_msgSend_getPendingEarlyBootAccessories(void *a1, const char *a2, ...)
{
  return [a1 getPendingEarlyBootAccessories];
}

id objc_msgSend_registerForPendingEarlyBootAccessories(void *a1, const char *a2, ...)
{
  return [a1 registerForPendingEarlyBootAccessories];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_updateFirmwareWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateFirmwareWithOptions:");
}