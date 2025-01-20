uint64_t start()
{
  id v0;
  CFRunLoopRef Current;
  void *v2;
  dispatch_source_t v3;
  void *v4;
  dispatch_source_t v5;
  void *v6;
  dispatch_source_t v7;
  void *v8;
  void *v9;
  void (*v10)(void);
  char *v11;
  char *v12;
  uint8_t v14[16];
  void v15[6];
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  char v19;
  uint8_t v20[24];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "visionhwserverd is launching...", buf, 2u);
  }
  kdebug_trace();
  _set_user_dir_suffix();
  v0 = NSTemporaryDirectory();
  Current = CFRunLoopGetCurrent();
  *(void *)buf = 0;
  v17 = buf;
  v18 = 0x2020000000;
  v19 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007984;
  v15[3] = &unk_100008110;
  v15[4] = buf;
  v15[5] = Current;
  v2 = objc_retainBlock(v15);
  signal(1, (void (__cdecl *)(int))1);
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 1uLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  v4 = (void *)qword_10000C000;
  qword_10000C000 = (uint64_t)v3;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10000C000, v2);
  dispatch_activate((dispatch_object_t)qword_10000C000);
  signal(13, (void (__cdecl *)(int))1);
  v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xDuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  v6 = (void *)qword_10000C008;
  qword_10000C008 = (uint64_t)v5;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10000C008, v2);
  dispatch_activate((dispatch_object_t)qword_10000C008);
  signal(15, (void (__cdecl *)(int))1);
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  v8 = (void *)qword_10000C010;
  qword_10000C010 = (uint64_t)v7;

  dispatch_source_set_event_handler((dispatch_source_t)qword_10000C010, v2);
  dispatch_activate((dispatch_object_t)qword_10000C010);
  if (_os_feature_enabled_impl())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "VisionHWA XPCService", v20, 2u);
    }
    v9 = dlopen("/System/Library/PrivateFrameworks/VisionHWAccelerationServices.framework/VisionHWAccelerationServices", 4);
    if (v9)
    {
      v10 = (void (*)(void))dlsym(v9, "VisionHWServerStart");
      if (v10)
      {
        v10();
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v12 = dlerror();
        sub_100007A08((uint64_t)v12, v20);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v11 = dlerror();
      sub_1000079BC((uint64_t)v11, v20);
    }
  }
  while (!v17[24])
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, 0);
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "visionhwserverd exiting...", v14, 2u);
  }

  _Block_object_dispose(buf, 8);
  return 0;
}

void sub_100007944(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a2) {
    sub_1000079A8(exception_object);
  }
  _Unwind_Resume(exception_object);
}

void sub_100007984(uint64_t a1)
{
  v2 = *(__CFRunLoop **)(a1 + 40);
  if (v2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    CFRunLoopStop(v2);
  }
}

void sub_1000079A8(void *a1)
{
}

void sub_1000079BC(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315138;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load VisionHWAccelerationServices framework: %s", buf, 0xCu);
}

void sub_100007A08(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 136315394;
  *(void *)(buf + 4) = "VisionHWServerStart";
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not find '%s': %s", buf, 0x16u);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return _CFRunLoopRunInMode(mode, seconds, returnAfterSourceHandled);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
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

void std::terminate(void)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void dispatch_activate(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}