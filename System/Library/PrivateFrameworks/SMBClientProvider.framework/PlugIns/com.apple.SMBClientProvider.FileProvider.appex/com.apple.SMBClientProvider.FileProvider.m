void sub_10000331C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003338(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  v9 = livefs_std_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315650;
    v13 = "-[SMBFileProviderExtension clusterDomainItemsOrError:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v7;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s share (%@) scoped_share (%@) ", (uint8_t *)&v12, 0x20u);
  }

  if ([v7 hasPrefix:a1[4]] && (unint64_t)objc_msgSend(v7, "length") > a1[6])
  {
    v10 = (void *)a1[5];
    v11 = objc_msgSend(v8, "substringFromIndex:");
    [v10 addObject:v11];
  }
}

void sub_10000347C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003498(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_1000034B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003534(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000035AC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  v3 = "(passed to caller)";
  *(void *)&v4[4] = "-[SMBFileProviderExtension clusterDomainItemsOrError:]";
  *(_DWORD *)uint64_t v4 = 136315650;
  if (!a1) {
    v3 = "(ignored by caller)";
  }
  *(_WORD *)&v4[12] = 2080;
  *(void *)&v4[14] = v3;
  *(_WORD *)&v4[22] = 2112;
  sub_100003498((void *)&_mh_execute_header, a2, a3, "%s: %s error: %@", *(void *)v4, *(void *)&v4[8], *(void *)&v4[16], a2);
}

void sub_100003650(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)v3 = 136315650;
  *(void *)&v3[4] = "-[SMBFileProviderExtension clusterDomainItemsOrError:]";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2112;
  sub_100003498((void *)&_mh_execute_header, a2, a3, "%s: got vols %@ error %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void sub_1000036D8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100003744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t livefs_std_log()
{
  return _livefs_std_log();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_volumes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "volumes:");
}