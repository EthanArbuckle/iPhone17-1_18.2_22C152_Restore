uint64_t start()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t description;
  void *v17;
  NSObject *v18;
  uint8_t buf[8];
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void v28[5];
  id v29;
  uint8_t v30[4];
  uint64_t v31;

  v0 = (id)objc_opt_new();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_100002484;
  v28[4] = sub_100002494;
  v29 = 0;
  v2 = objc_opt_new();
  v3 = +[NSBundle mainBundle];
  v4 = [v3 bundleIdentifier];
  v5 = +[NSString stringWithFormat:@"%@:init", v4];

  v6 = v5;
  [v6 UTF8String];
  v7 = (void *)os_transaction_create();
  v8 = sub_10000249C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Spawned", buf, 2u);
  }

  if ([v0 supportsWatchdog]) {
    v9 = objc_opt_new();
  }
  else {
    v9 = 0;
  }
  v10 = &_dispatch_main_q;
  [v9 addQueue:&_dispatch_main_q hangPolicy:1];

  v11 = ARCreateFixedPriorityDispatchQueue();
  [v9 addQueue:v11 hangPolicy:0];
  *(void *)buf = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_1000024F0;
  v23 = &unk_100004248;
  v12 = v9;
  v24 = v12;
  v13 = v0;
  v25 = v13;
  v27 = v28;
  v14 = v2;
  v26 = v14;
  dispatch_async_and_wait(v11, buf);
  v15 = sub_10000249C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    description = os_transaction_get_description();
    *(_DWORD *)v30 = 136446210;
    v31 = description;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Releasing %{public}s transaction", v30, 0xCu);
  }

  v17 = +[NSRunLoop mainRunLoop];
  [v17 run];

  v18 = sub_10000249C();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v30 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Exiting unexpectedly", v30, 2u);
  }

  _Block_object_dispose(v28, 8);
  return 1;
}

void sub_100002458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002484(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002494(uint64_t a1)
{
}

id sub_10000249C()
{
  if (qword_1000080F0 != -1) {
    dispatch_once(&qword_1000080F0, &stru_100004288);
  }
  v0 = (void *)qword_1000080E8;

  return v0;
}

void sub_1000024F0(uint64_t a1)
{
  [*(id *)(a1 + 32) updateStatus:1];
  id v2 = *(id *)(a1 + 40);
  v3 = +[NSBundle mainBundle];
  v4 = [v3 bundleIdentifier];

  id v5 = v4;
  [v5 UTF8String];
  if (_set_user_dir_suffix())
  {
    v6 = NSTemporaryDirectory();
    v7 = sub_10000249C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138477827;
      *(void *)((char *)&buf + 4) = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sandbox temporary directory: %{private}@", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    v8 = sub_100002AC4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to setup sandbox temporary directory!", (uint8_t *)&buf, 2u);
    }

    if (qword_100008110 != -1) {
      dispatch_once(&qword_100008110, &stru_1000042C8);
    }
    if (!byte_100008108) {
      sub_100002D50();
    }
  }

  if ([v2 hasLibraryDirectoryReadWriteAccess])
  {
    v9 = ARLibraryDirectory();
    v10 = +[NSFileManager defaultManager];
    id location = 0;
    unsigned int v11 = [v10 createDirectoryAtPath:v9 withIntermediateDirectories:1 attributes:0 error:&location];
    id v12 = location;

    if (v11)
    {
      v13 = sub_10000249C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138477827;
        *(void *)((char *)&buf + 4) = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Sandbox library directory: %{private}@", (uint8_t *)&buf, 0xCu);
      }
    }
    else
    {
      v14 = sub_100002AC4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to setup sandbox library directory with error: %@", (uint8_t *)&buf, 0xCu);
      }

      if (qword_100008110 != -1) {
        dispatch_once(&qword_100008110, &stru_1000042C8);
      }
      if (!byte_100008108) {
        sub_100002CDC((uint64_t)v12);
      }
    }
  }
  id v15 = [objc_alloc((Class)ARDaemon) initWithConfiguration:*(void *)(a1 + 40) spawnTime:*(void *)(a1 + 48) watchdogMonitor:*(void *)(a1 + 32)];
  uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8);
  v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v15;

  objc_initWeak(&location, *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
  id v18 = &_dispatch_main_q;
  v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  v22 = sub_10000295C;
  v23 = &unk_100004220;
  objc_copyWeak(&v24, &location);
  v19 = &v20;
  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472;
  v27 = sub_100002B90;
  v28 = &unk_100004318;
  v29 = &off_100004440;
  id v30 = &_dispatch_main_q;
  v31 = v19;
  if (qword_100008120 != -1) {
    dispatch_once(&qword_100008120, &buf);
  }

  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) startup:v20, v21, v22, v23];
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void sub_100002938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000295C(uint64_t a1, int a2)
{
  v4 = sub_10000249C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = +[NSString stringWithUTF8String:sys_signame[a2]];
    v6 = [v5 uppercaseString];

    int v8 = 138543618;
    v9 = v6;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Signal received: %{public}@ (%i)", (uint8_t *)&v8, 0x12u);
  }
  if (a2 != 29)
  {
    if (a2 != 15) {
      return;
    }
    quick_exit();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained printInfo];
}

void sub_100002A80(id a1)
{
  qword_1000080E8 = (uint64_t)os_log_create("com.apple.ARKit", "Daemon");

  _objc_release_x1();
}

id sub_100002AC4()
{
  if (qword_100008100 != -1) {
    dispatch_once(&qword_100008100, &stru_1000042A8);
  }
  v0 = (void *)qword_1000080F8;

  return v0;
}

void sub_100002B18(id a1)
{
  qword_1000080F8 = (uint64_t)os_log_create("com.apple.ARKit", "General");

  _objc_release_x1();
}

void sub_100002B5C(id a1)
{
  byte_100008108 = +[ARKitUserDefaults BOOLForKey:ARSkipCrashOnARCrash];
}

void sub_100002B90(uint64_t a1)
{
  uint64_t v2 = objc_opt_new();
  v3 = (void *)qword_100008118;
  qword_100008118 = v2;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100002C4C;
  v5[3] = &unk_1000042F0;
  v4 = *(void **)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v4 enumerateObjectsUsingBlock:v5];
}

void sub_100002C4C(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = [v2 intValue];
  object = ARCreateDispatchSourceForSignalWithHandler();
  [(id)qword_100008118 setObject:object forKeyedSubscript:v2];

  dispatch_resume(object);
  signal(v3, (void (__cdecl *)(int))1);
}

void sub_100002CDC(uint64_t a1)
{
  v1 = +[NSString stringWithFormat:@"Failed to setup sandbox library directory with error: %@", a1];
  id v2 = +[NSString stringWithFormat:@"ARCrash: %@", v1];
  qword_1000080B0 = (uint64_t)strdup((const char *)[v2 UTF8String]);

  abort();
}

void sub_100002D50()
{
  v0 = +[NSString stringWithFormat:@"Failed to setup sandbox temporary directory!"];
  id v1 = +[NSString stringWithFormat:@"ARCrash: %@", v0];
  qword_1000080B0 = (uint64_t)strdup((const char *)[v1 UTF8String]);

  abort();
}

uint64_t ARCreateDispatchSourceForSignalWithHandler()
{
  return _ARCreateDispatchSourceForSignalWithHandler();
}

uint64_t ARCreateFixedPriorityDispatchQueue()
{
  return _ARCreateFixedPriorityDispatchQueue();
}

uint64_t ARLibraryDirectory()
{
  return _ARLibraryDirectory();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void abort(void)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_transaction_get_description()
{
  return _os_transaction_get_description();
}

uint64_t quick_exit()
{
  return _quick_exit();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return _strdup(__s1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_hasLibraryDirectoryReadWriteAccess(void *a1, const char *a2, ...)
{
  return [a1 hasLibraryDirectoryReadWriteAccess];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_printInfo(void *a1, const char *a2, ...)
{
  return [a1 printInfo];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_startup(void *a1, const char *a2, ...)
{
  return [a1 startup];
}

id objc_msgSend_supportsWatchdog(void *a1, const char *a2, ...)
{
  return [a1 supportsWatchdog];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}