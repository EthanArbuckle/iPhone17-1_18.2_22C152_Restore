uint64_t start()
{
  void *v0;
  dispatch_semaphore_t v1;
  id v2;
  NSObject *v3;
  dispatch_time_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  FILE *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v16;
  void v17[4];
  NSObject *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;

  v1 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = sub_100002204;
  v24 = sub_100002214;
  v25 = 0;
  v25 = +[NSMutableDictionary dictionary];
  v2 = objc_alloc_init((Class)TransparencyDaemon);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10000221C;
  v17[3] = &unk_100004208;
  v19 = &v20;
  v3 = v1;
  v18 = v3;
  [v2 transparencySysDiagnose:v17];
  v4 = dispatch_time(0, 2500000000);
  if (dispatch_semaphore_wait(v3, v4))
  {
    fwrite("tool timed out waiting for transparencyd, using fallback\n", 0x39uLL, 1uLL, __stderrp);
    v26 = 0;
    v5 = +[TransparencyFileSupport transparencyFilesPath:&v26];
    v6 = [v5 URLByAppendingPathComponent:@"transparency_start.log" isDirectory:0];

    v7 = [v6 relativePath];
    v8 = +[NSString stringWithContentsOfFile:v7 encoding:4 error:0];

    if (v8)
    {
      v9 = __stdoutp;
      v8 = v8;
      fprintf(v9, "%s\n", (const char *)[v8 UTF8String]);
      v10 = 0;
    }
    else
    {
      fwrite("Cant make JSON\n", 0xFuLL, 1uLL, __stderrp);
      v10 = 74;
    }
    goto LABEL_16;
  }
  v11 = (void *)v21[5];
  v16 = 0;
  v12 = v11;
  if (+[NSJSONSerialization isValidJSONObject:v12])
  {
    v13 = +[NSJSONSerialization dataWithJSONObject:v12 options:3 error:&v16];
    if (v13) {
      v14 = [objc_alloc((Class)NSString) initWithData:v13 encoding:4];
    }
    else {
      v14 = 0;
    }
    goto LABEL_11;
  }
  v14 = +[TransparencyError errorWithDomain:kTransparencyErrorInternal code:-26275 description:@"auditor report is not valid JSON"];
  NSLog(@"Bad report: %@", v12);
  if (v14)
  {
    v13 = v14;
    v14 = 0;
    v16 = v13;
LABEL_11:
  }
  v8 = v16;
  if (v14)
  {
    fprintf(__stdoutp, "%s\n", (const char *)[v14 UTF8String]);
    v10 = 0;
  }
  else
  {
    fwrite("Cant make JSON\n", 0xFuLL, 1uLL, __stderrp);
    v10 = 74;
  }

LABEL_16:
  _Block_object_dispose(&v20, 8);

  return v10;
}

void sub_1000021E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002204(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002214(uint64_t a1)
{
}

intptr_t sub_10000221C(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addEntriesFromDictionary:a2];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setObject:@"false" forKeyedSubscript:@"isFallback"];
  v3 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v3);
}

void sub_10000256C(id a1)
{
  qword_100008680 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_1000025B0(id a1)
{
  qword_100008680 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void sub_100002804(id a1)
{
  qword_100008680 = (uint64_t)os_log_create("com.apple.Transparency", "default");

  _objc_release_x1();
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_enumerationMutation(id obj)
{
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_relativePath(void *a1, const char *a2, ...)
{
  return [a1 relativePath];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:error:];
}