id sub_1000032C8()
{
  void *v0;
  uint64_t vars8;

  if (qword_100008028 != -1) {
    dispatch_once(&qword_100008028, &stru_100004148);
  }
  v0 = (void *)qword_100008030;

  return v0;
}

void sub_10000331C(id a1)
{
  qword_100008030 = (uint64_t)os_log_create("com.apple.symptomsd-diag", "daemon");

  _objc_release_x1();
}

uint64_t start()
{
  if ((_set_user_dir_suffix() & 1) == 0)
  {
    v5 = sub_1000032C8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v6.version) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to fixup temporary directory to conform to sandbox", (uint8_t *)&v6, 2u);
    }

    exit(1);
  }
  v0 = NSTemporaryDirectory();
  v1 = sub_1000032C8();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v6.version) = 138412290;
    *(CFIndex *)((char *)&v6.version + 4) = (CFIndex)v0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Updated temporary directory to: %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100004168);
  v2 = (__CFRunLoopSource *)qword_100008040;
  if (!qword_100008040)
  {
    memset(&v6, 0, 72);
    v6.perform = (void (__cdecl *)(void *))nullsub_1;
    v2 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &v6);
    qword_100008040 = (uint64_t)v2;
    if (!v2) {
      dispatch_main();
    }
  }
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v2, kCFRunLoopCommonModes);
  CFRunLoopRun();
  return 0;
}

void sub_1000034F0(id a1)
{
  v2 = sub_1000032C8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Initializing signal handlers.", v8, 2u);
  }

  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  v4 = (void *)qword_100008038;
  qword_100008038 = (uint64_t)v3;

  if (qword_100008038)
  {
    dispatch_source_set_event_handler((dispatch_source_t)qword_100008038, &stru_100004188);
    dispatch_resume((dispatch_object_t)qword_100008038);
  }
  atexit_b(&stru_1000041A8);
  v5 = +[ABCAdministrator sharedInstance];
  [v5 startup];

  CFRunLoopSourceContext v6 = +[DRSService sharedInstance];
  [v6 activateService];

  v7 = +[DRSTaskingService sharedInstance];
  [v7 activateService];
}

void sub_100003620(id a1)
{
  v1 = sub_1000032C8();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "symptomsd-diag is terminating", v5, 2u);
  }

  v2 = +[ABCAdministrator sharedInstance];
  [v2 shutdown];

  dispatch_source_t v3 = +[DRSService sharedInstance];
  [v3 deactivateService];

  v4 = +[DRSTaskingService sharedInstance];
  [v4 deactivateService];
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRun(void)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return _CFRunLoopSourceCreate(allocator, order, context);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

int atexit_b(void *a1)
{
  return _atexit_b(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
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

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_activateService(void *a1, const char *a2, ...)
{
  return [a1 activateService];
}

id objc_msgSend_deactivateService(void *a1, const char *a2, ...)
{
  return [a1 deactivateService];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return [a1 shutdown];
}

id objc_msgSend_startup(void *a1, const char *a2, ...)
{
  return [a1 startup];
}