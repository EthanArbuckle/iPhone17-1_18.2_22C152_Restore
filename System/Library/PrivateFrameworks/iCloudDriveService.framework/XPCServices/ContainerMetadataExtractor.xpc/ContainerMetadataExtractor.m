uint64_t start()
{
  char *v0;
  void *v1;
  ServiceDelegate *v2;
  char v4[1024];

  bzero(v4, 0x400uLL);
  if (!_set_user_dir_suffix() || !confstr(65537, v4, 0x400uLL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100002B80();
    }
LABEL_9:
    exit(1);
  }
  v0 = realpath_DARWIN_EXTSN(v4, 0);
  if (!v0)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100002C08();
    }
    goto LABEL_9;
  }
  free(v0);
  v1 = +[NSXPCListener serviceListener];
  v2 = objc_alloc_init(ServiceDelegate);
  [v1 setDelegate:v2];
  [v1 resume];

  return 0;
}

void sub_100001D28(char a1@<W0>, uint64_t a2@<X1>, int a3@<W2>, void *a4@<X8>)
{
  if (qword_100008790 != -1) {
    dispatch_once(&qword_100008790, &stru_100004268);
  }
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100001EA8;
  v8[3] = &unk_100004290;
  v8[4] = &v10;
  char v9 = a1;
  dispatch_sync((dispatch_queue_t)qword_100008788, v8);
  a4[1] = a2;
  a4[2] = 0;
  *a4 = v11[3];
  *((_DWORD *)a4 + 4) = a3;
  _Block_object_dispose(&v10, 8);
}

void sub_100001E20(id a1)
{
  v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("create-log-section", v1);

  v3 = (void *)qword_100008788;
  qword_100008788 = (uint64_t)v2;
}

uint64_t sub_100001EA8(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = qword_100008780 + 1;
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 8);
  uint64_t v2 = *(void *)(v1 + 24);
  if (*(unsigned char *)(result + 40) != ((v2 & 1) == 0))
  {
    *(void *)(v1 + 24) = v2 + 1;
    uint64_t v2 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  }
  qword_100008780 = v2;
  return result;
}

void sub_100001EFC(uint64_t *a1)
{
  if (a1)
  {
    uint64_t v1 = *a1;
    if (*a1)
    {
      uint64_t v2 = brc_bread_crumbs();
      v3 = brc_default_log();
      v4 = v3;
      if (v1)
      {
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
          sub_100002C90((uint64_t)v2, v1, v4);
        }
      }
      else if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v5 = 134218242;
        uint64_t v6 = v1;
        __int16 v7 = 2112;
        v8 = v2;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[INFO] ┗%llx %@", (uint8_t *)&v5, 0x16u);
      }
    }
  }
}

void sub_100002A8C(id a1)
{
  qword_1000087A0 = (uint64_t)dispatch_workloop_create("com.apple.clouddocs.extract-metadata");
  _objc_release_x1();
}

id sub_100002AC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _extractMetadataForContainerID:*(void *)(a1 + 40) bundleID:*(void *)(a1 + 48) minimumBundleVersion:*(void *)(a1 + 56) reply:*(void *)(a1 + 64)];
}

void sub_100002B60(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x34u);
}

void sub_100002B80()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failed to initialize temporary directory: %{darwin.errno}d", (uint8_t *)v1, 8u);
}

void sub_100002C08()
{
  int v0 = *__error();
  v1[0] = 67109120;
  v1[1] = v0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failed to resolve temporary directory: %{darwin.errno}d", (uint8_t *)v1, 8u);
}

void sub_100002C90(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┗%llx %@", (uint8_t *)&v3, 0x16u);
}

void sub_100002D18()
{
  int v0 = +[NSError brc_errorInvalidParameter:@"containerID" value:0];
  sub_100002B30();
  sub_100002B60((void *)&_mh_execute_header, v1, v2, "[DEBUG] %@: reply(%@, %@, %@)%@", v3, v4, v5, v6, v7);
}

void sub_100002DC0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138413314;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = &__NSDictionary0__struct;
  __int16 v7 = 2112;
  uint64_t v8 = 0;
  __int16 v9 = 2112;
  uint64_t v10 = 0;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: reply(%@, %@, %@)%@", (uint8_t *)&v3, 0x34u);
}

void sub_100002E68()
{
  int v0 = +[NSError brc_errorInvalidParameter:@"bundleID" value:0];
  sub_100002B30();
  sub_100002B60((void *)&_mh_execute_header, v1, v2, "[DEBUG] %@: reply(%@, %@, %@)%@", v3, v4, v5, v6, v7);
}

void CFRelease(CFTypeRef cf)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCreateUnique()
{
  return __CFBundleCreateUnique();
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

uint64_t brc_bread_crumbs()
{
  return _brc_bread_crumbs();
}

uint64_t brc_default_log()
{
  return _brc_default_log();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return _dispatch_workloop_create(label);
}

void exit(int a1)
{
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

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sdkVersion(void *a1, const char *a2, ...)
{
  return [a1 sdkVersion];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}