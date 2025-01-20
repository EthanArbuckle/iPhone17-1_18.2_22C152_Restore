id sub_100003204(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  char *v7;
  char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t vars8;

  v5 = a2;
  if ([&off_1000043A8 containsObject:*(void *)(a1 + 32)])
  {
    v6 = objc_opt_new();
    [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:OSATransformOptionFullReport];
    v7 = getenv("QLIPS_SYMBOLICATE_URL");
    if (v7)
    {
      v8 = v7;
      [v6 setObject:&__kCFBooleanTrue forKeyedSubscript:OSATransformOptionSymbolicate];
      v9 = +[NSString stringWithUTF8String:v8];
      v10 = +[NSURL URLWithString:v9];
      [v6 setObject:v10 forKeyedSubscript:OSATransformOptionTracerURL];

      [v6 setObject:@"quicklook" forKeyedSubscript:OSATransformOptionTracerGroup];
    }
    v11 = +[OSALegacyXform transformURL:*(void *)(a1 + 40) options:v6];
    v12 = [v11 objectForKeyedSubscript:OSATransformResultError];
    v13 = v12;
    if (!v11 || v12)
    {
      v15 = 0;
      if (a3) {
        *a3 = v12;
      }
    }
    else
    {
      v14 = [v11 objectForKeyedSubscript:OSATransformResultReport];
      v15 = [v14 dataUsingEncoding:4];
    }
  }
  else
  {
    v15 = 0;
  }
  [v5 setStringEncoding:4];

  return v15;
}

void sub_1000033E0(uint64_t a1)
{
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error creating stream from %{public}@", (uint8_t *)&v1, 0xCu);
}

void sub_100003460(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Error decoding JSON report: %@", (uint8_t *)&v1, 0xCu);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_bugType(void *a1, const char *a2, ...)
{
  return [a1 bugType];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_metaData(void *a1, const char *a2, ...)
{
  return [a1 metaData];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_transformURL_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transformURL:options:");
}