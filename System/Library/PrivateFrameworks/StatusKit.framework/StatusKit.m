id sub_100002B6C()
{
  void *v0;
  uint64_t vars8;

  if (qword_100008068 != -1) {
    dispatch_once(&qword_100008068, &stru_100004198);
  }
  v0 = (void *)qword_100008060;
  return v0;
}

void sub_100002BC0(id a1)
{
  qword_100008060 = (uint64_t)os_log_create("com.apple.StatusKit", "StatusKitAgentMain");
  _objc_release_x1();
}

void sub_100002C04(int a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002C78;
  block[3] = &unk_1000041B8;
  int v2 = a1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100002C78(uint64_t a1)
{
  int v2 = (int *)(a1 + 32);
  int v1 = *(_DWORD *)(a1 + 32);
  if (v1 <= 12)
  {
    if (v1 != 1 && v1 != 3) {
      goto LABEL_5;
    }
LABEL_13:
    v5 = sub_100002B6C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Quit - shutting down daemon", buf, 2u);
    }

    v6 = +[SKAStatusServer sharedInstance];
    [v6 shutdown];

    [(id)qword_100008030 shutdown];
    v7 = sub_100002B6C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Quit - goodbye!", v9, 2u);
    }

    return;
  }
  switch(v1)
  {
    case 13:
      signal(2, (void (__cdecl *)(int))sub_100002C04);
      break;
    case 29:
      id v8 = +[SKAStatusServer sharedInstance];
      [v8 logState];

      break;
    case 15:
      goto LABEL_13;
    default:
LABEL_5:
      v3 = sub_100002B6C();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
        sub_1000031E4(v2, v3);
      }

      return;
  }
}

void sub_100002E20()
{
  if (qword_100008070 != -1) {
    dispatch_once(&qword_100008070, &stru_1000041D8);
  }
}

void sub_100002E48(id a1)
{
  int v1 = dispatch_get_global_queue(0, 0);
  for (uint64_t i = 0; i != 5; ++i)
  {
    int v3 = dword_100003718[i];
    v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v3, 0, v1);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100002F70;
    handler[3] = &unk_1000041B8;
    int v8 = v3;
    dispatch_source_set_event_handler(v4, handler);
    v5 = (void *)qword_100008038[i];
    qword_100008038[i] = v4;
    v6 = v4;

    dispatch_resume(v6);
    signal(v3, (void (__cdecl *)(int))1);
  }
}

void sub_100002F70(uint64_t a1)
{
}

uint64_t start()
{
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v11 = sub_100002B6C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      sub_100003320(v11);
    }

    exit(1);
  }
  nullsub_1();
  id v1 = NSTemporaryDirectory();
  if (qword_100008070 != -1) {
    dispatch_once(&qword_100008070, &stru_1000041D8);
  }
  int v2 = sub_100002B6C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "StatusKitAgent launched", v12, 2u);
  }

  NSLog(@"Hello, World!");
  uint64_t v4 = +[SKAStatusServer sharedInstance];
  if (_os_feature_enabled_impl())
  {
    id v5 = [objc_alloc((Class)SKALocalStatusServerObjC) initWithIDSDeviceProvider:v4];
    v6 = (void *)qword_100008030;
    qword_100008030 = (uint64_t)v5;
  }
  else
  {
    NSLog(@"LocalStatusKit not enabled");
  }
  if (v4 | qword_100008030)
  {
    v7 = +[NSRunLoop currentRunLoop];
    [v7 run];
  }
  id v8 = self;
  v9 = (void *)qword_100008030;
  qword_100008030 = 0;

  return 0;
}

id sub_10000314C()
{
  if (qword_100008080 != -1) {
    dispatch_once(&qword_100008080, &stru_1000041F8);
  }
  v0 = (void *)qword_100008078;
  return v0;
}

void sub_1000031A0(id a1)
{
  qword_100008078 = (uint64_t)os_log_create("com.apple.StatusKit", "StatusKitAgentSandbox");
  _objc_release_x1();
}

void sub_1000031E4(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unhandled signal: %d", (uint8_t *)v3, 8u);
}

void sub_100003260(void *a1)
{
  id v1 = objc_begin_catch(a1);
  int v2 = sub_100002B6C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
  {
    int v3 = 138412290;
    id v4 = v1;
    _os_log_fault_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_FAULT, "StatusKitAgent exception caught on main thread: %@", (uint8_t *)&v3, 0xCu);
  }

  objc_end_catch();
}

void sub_100003320(NSObject *a1)
{
  int v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_FAULT, "Failed to set user dir suffix: %{darwin.errno}d", (uint8_t *)v3, 8u);
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_logState(void *a1, const char *a2, ...)
{
  return [a1 logState];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return [a1 shutdown];
}