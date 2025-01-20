void sub_100003558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100003718(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100008158)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10000386C;
    v4[4] = &unk_100004150;
    v4[5] = v4;
    long long v5 = off_100004138;
    uint64_t v6 = 0;
    qword_100008158 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_100008158)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("DEAttachmentItem");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_100008150 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000386C()
{
  uint64_t result = _sl_dlopen();
  qword_100008158 = result;
  return result;
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void free(void *a1)
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}
 v4;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "WiFiVelocity Diagnostic Mode DE, params=%@", (uint8_t *)&v10, 0xCu);
  }
  long long v5 = [v4 objectForKeyedSubscript:@"DEExtensionHostAppKey"];
  uint64_t v6 = [v5 lowercaseString];
  if ([v6 hasPrefix:@"com.apple.taptoradar"])
  {

LABEL_6:
    v8 = [(DiagnosticExtension *)self __attachmentsForDiagnosticsModeWithParameters:v4];
    goto LABEL_10;
  }
  unsigned __int8 v7 = [v5 isEqualToString:@"com.apple.diagnosticextensionsd"];

  if (v7) {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138412290;
    id v11 = v5;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "WiFiVelocity Diagnostic Mode DE, Unrecognized HostApp: %@", (uint8_t *)&v10, 0xCu);
  }
  v8 = &__NSArray0__struct;
LABEL_10:

  return v8;
}

@end