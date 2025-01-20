void add_binary_info_to_binary_dictionary(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t vars8;

  v21 = a1;
  v3 = a2;
  if (v21 && v3)
  {
    v4 = [v3 uuid];
    v20 = [v3 name];
    v19 = [v3 path];
    v5 = [v3 bundleIdentifier];
    v6 = [v3 bundleVersion];
    v7 = [v3 bundleShortVersion];
    v8 = [v3 binaryVersion];
    v9 = [v3 segmentWithName:@"__TEXT_EXEC"];
    v10 = v9;
    if (v9)
    {
      v11 = [v9 length];
    }
    else
    {
      v12 = [v3 segmentWithName:@"__TEXT"];
      v13 = v12;
      if (!v12) {
        v12 = v3;
      }
      v11 = [v12 length];
    }
    v14 = +[NSNumber numberWithUnsignedLongLong:v11];
    if (!v14) {
      sub_1000026C4();
    }
    v15 = (void *)v14;
    [v4 UUIDString];
    v16 = v18 = v4;
    [v21 setObject:v16 forKeyedSubscript:@"UUID_String"];

    [v21 setObject:v15 forKeyedSubscript:@"Size"];
    v17 = +[NSNumber numberWithBool:v10 != 0];
    [v21 setObject:v17 forKeyedSubscript:@"TEXT_EXEC"];

    [v21 setObject:v20 forKeyedSubscript:@"Name"];
    [v21 setObject:v19 forKeyedSubscript:@"Path"];
    [v21 setObject:v5 forKeyedSubscript:@"BundleID"];
    [v21 setObject:v6 forKeyedSubscript:@"BundleVersion"];
    [v21 setObject:v7 forKeyedSubscript:@"BundleShortVersion"];
    [v21 setObject:v8 forKeyedSubscript:@"BinaryVersion"];
  }
}

int main(int argc, const char **argv, const char **envp)
{
  v3 = objc_alloc_init(TailspinSymbolicationServer);
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

void sub_1000022B4(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_100002A04(a1, v7);
  }
  v9 = [*(id *)(a1 + 32) offsetIntoSegment];
  id v10 = v7;
  id v11 = v8;
  id v12 = v10;
  if (!v12) {
    sub_1000026C4();
  }
  v13 = v12;

  id v14 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:8];
  if (!v14) {
    sub_1000026C4();
  }
  v15 = v14;
  v16 = [v13 name];
  uint64_t v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9 - (unsigned char *)[v13 offsetIntoSegment]);
  if (!v17) {
    sub_1000026C4();
  }
  v18 = (void *)v17;
  uint64_t v34 = a4;
  uint64_t v19 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v13 length]);
  if (!v19) {
    sub_1000026C4();
  }
  v20 = (void *)v19;
  [v15 setObject:v16 forKeyedSubscript:@"Name"];
  [v15 setObject:v20 forKeyedSubscript:@"Length"];
  [v15 setObject:v18 forKeyedSubscript:@"Offset"];
  if (v11)
  {
    v33 = [v11 filePath];
    if (!v33) {
      sub_1000026C4();
    }
    v31 = v16;
    id v21 = [v11 lineNum];
    if (v21)
    {
      v22 = +[NSNumber numberWithUnsignedInt:v21];
    }
    else
    {
      v22 = 0;
    }
    id v23 = [v11 columnNum];
    uint64_t v32 = a1;
    if (v23)
    {
      v24 = +[NSNumber numberWithUnsignedInt:v23];
    }
    else
    {
      v24 = 0;
    }
    uint64_t v25 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9 - (unsigned char *)[v11 offsetIntoSegment]);
    if (!v25) {
      sub_1000026C4();
    }
    v26 = (void *)v25;
    uint64_t v27 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v11 length]);
    if (!v27) {
      sub_1000026C4();
    }
    v28 = (void *)v27;
    [v15 setObject:v33 forKeyedSubscript:@"FileName"];
    if (v22) {
      [v15 setObject:v22 forKeyedSubscript:@"LineNumber"];
    }
    if (v24) {
      [v15 setObject:v24 forKeyedSubscript:@"ColNumber"];
    }
    [v15 setObject:v26 forKeyedSubscript:@"SourceOffset"];
    [v15 setObject:v28 forKeyedSubscript:@"SourceLength"];

    v16 = v31;
    a1 = v32;
  }

  if (v34)
  {
    [*(id *)(a1 + 48) addObject:v15];
  }
  else
  {
    [v15 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"InlineSymbols"];
    v29 = *(void **)(a1 + 56);
    v30 = [*(id *)(a1 + 64) stringValue];
    [v29 setObject:v15 forKeyedSubscript:v30];
  }
}

void sub_100002624(void *a1, void *a2)
{
  v3 = [a1 UUIDString];
  [a2 count];
  sub_10000260C();
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "got request for %@ with num_offsets %zu", v4, 0x16u);
}

void sub_1000026C4()
{
}

void sub_1000026E0()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "sent reply dictionary data", v0, 2u);
}

void sub_100002728()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "couldn't serialize symbols dictionary", v0, 2u);
}

void sub_100002770(void *a1)
{
  id v1 = [a1 description];
  int v2 = 136315138;
  id v3 = [v1 UTF8String];
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "dict is:\n%s", (uint8_t *)&v2, 0xCu);
}

void sub_100002810(void *a1)
{
  id v1 = [a1 description];
  int v2 = 136315138;
  id v3 = [v1 UTF8String];
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "error: %s", (uint8_t *)&v2, 0xCu);
}

void sub_1000028B0(void *a1, void *a2)
{
  id v3 = [a1 UUIDString];
  [a2 count];
  sub_10000260C();
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "got request for %@ with num_offsets %zu", v4, 0x16u);
}

void sub_100002950(uint64_t a1, int a2)
{
  id v3 = +[NSString stringWithUTF8String:a1];
  int v4 = 138543618;
  v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Client %{public}@ [%d] is not entitled to use TailspinSymbolication.", (uint8_t *)&v4, 0x12u);
}

void sub_100002A04(uint64_t a1, void *a2)
{
  id v4 = [*(id *)(a1 + 32) offsetIntoSegment];
  id v5 = [*(id *)(a1 + 40) name];
  id v6 = [v5 UTF8String];
  id v7 = [a2 name];
  id v8 = [v7 UTF8String];
  v9 = [*(id *)(a1 + 32) offsetIntoSegment];
  int v10 = 134218754;
  id v11 = v4;
  __int16 v12 = 2080;
  id v13 = v6;
  __int16 v14 = 2080;
  id v15 = v8;
  __int16 v16 = 2048;
  int64_t v17 = v9 - (unsigned char *)[a2 offsetIntoSegment];
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%llx in %s -> %s + %llx", (uint8_t *)&v10, 0x2Au);
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_binary(void *a1, const char *a2, ...)
{
  return [a1 binary];
}

id objc_msgSend_binaryVersion(void *a1, const char *a2, ...)
{
  return [a1 binaryVersion];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleShortVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleShortVersion];
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return [a1 bundleVersion];
}

id objc_msgSend_clearCaches(void *a1, const char *a2, ...)
{
  return [a1 clearCaches];
}

id objc_msgSend_clearCoreSymbolicationCaches(void *a1, const char *a2, ...)
{
  return [a1 clearCoreSymbolicationCaches];
}

id objc_msgSend_columnNum(void *a1, const char *a2, ...)
{
  return [a1 columnNum];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_done(void *a1, const char *a2, ...)
{
  return [a1 done];
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return [a1 filePath];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineNum(void *a1, const char *a2, ...)
{
  return [a1 lineNum];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_numSymbols(void *a1, const char *a2, ...)
{
  return [a1 numSymbols];
}

id objc_msgSend_offsetIntoSegment(void *a1, const char *a2, ...)
{
  return [a1 offsetIntoSegment];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_sharedBinaryLocator(void *a1, const char *a2, ...)
{
  return [a1 sharedBinaryLocator];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}
 v9 = [v6 processIdentifier];
    proc_name(v9, buffer, 0x20u);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100002950((uint64_t)buffer, v9);
    }
  }

  return v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end