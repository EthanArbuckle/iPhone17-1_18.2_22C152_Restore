uint64_t start()
{
  CFRunLoopRef Current;
  uint64_t i;
  int v2;
  NSObject *v3;
  int v4;
  _opaque_pthread_t *v5;
  BOOL v6;
  void *v7;
  uint8_t v9[8];
  void v10[5];
  int out_token;
  int __relative_priority[2];
  void handler[6];
  uint8_t buf[8];
  uint8_t *v15;
  uint64_t v16;
  char v17;

  +[NSError _setFileNameLocalizationEnabled:0];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cameracaptured is launching...", buf, 2u);
  }
  Current = CFRunLoopGetCurrent();
  *(void *)buf = 0;
  v15 = buf;
  v16 = 0x2020000000;
  v17 = 0;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10000343C;
  handler[3] = &unk_100004198;
  handler[4] = buf;
  handler[5] = Current;
  _set_user_dir_suffix();
  for (i = 0; i != 3; ++i)
  {
    v2 = dword_1000037D8[i];
    signal(v2, (void (__cdecl *)(int))1);
    v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v2, 0, (dispatch_queue_t)&_dispatch_main_q);
    qword_100008008[i] = v3;
    dispatch_source_set_event_handler(v3, handler);
    dispatch_activate(qword_100008008[i]);
  }
  if (_os_feature_enabled_impl())
  {
    FigCommonMediaProcessInitialization();
    FigSandboxRegistrationServerStart();
    setiopolicy_np(9, 0, 1);
    v4 = pthread_set_fixedpriority_self();
    *(void *)__relative_priority = 0;
    v5 = pthread_self();
    if (pthread_get_qos_class_np(v5, (qos_class_t *)&__relative_priority[1], __relative_priority)) {
      v6 = 0;
    }
    else {
      v6 = pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0) == 0;
    }
    getpid();
    proc_disable_wakemon();
    getpid();
    proc_disable_cpumon();
    out_token = 0;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100003460;
    v10[3] = &unk_1000041C0;
    v10[4] = handler;
    notify_register_dispatch("AppleLanguagePreferencesChangedNotification", &out_token, (dispatch_queue_t)&_dispatch_main_q, v10);
    if (&_MSNMonitorStartCam) {
      MSNMonitorStartCam();
    }
    if (gGMFigKTraceEnabled == 1) {
      kdebug_trace();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cameracaptured servers starting", v9, 2u);
    }
    FigCaptureMemoryReporterStart();
    FigExternalStorageDeviceManagerServerStart();
    FigCapturePreloadShaders();
    FigCaptureSourceServerStart();
    FigCameraViewfinderServerStart();
    FigCaptureSessionServerStart();
    FigFlashlightServerStart();
    FigCaptureDeferredContainerManagerServerStart();
    FigVirtualCaptureCardServerStart();
    FigCaptureTempFileManagerStart();
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cameracaptured servers have finished starting", v9, 2u);
    }
    if (gGMFigKTraceEnabled == 1) {
      kdebug_trace();
    }
    if (v6) {
      pthread_set_qos_class_self_np((qos_class_t)__relative_priority[1], __relative_priority[0]);
    }
    if (!v4) {
      pthread_set_timeshare_self();
    }
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cameracaptured has finished launching", v9, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_1000034D8();
  }
  while (!v15[24])
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, 0);
  _Block_object_dispose(buf, 8);
  return 0;
}

void sub_100003410(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000343C(uint64_t a1)
{
  v2 = *(__CFRunLoop **)(a1 + 40);
  if (v2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    CFRunLoopStop(v2);
  }
}

uint64_t sub_100003460(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "User's preferred language has changed.  Exiting...", v3, 2u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000034D8()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "cameracaptured is not enabled.  Running idle in the background.", v0, 2u);
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

uint64_t FigCameraViewfinderServerStart()
{
  return _FigCameraViewfinderServerStart();
}

uint64_t FigCaptureDeferredContainerManagerServerStart()
{
  return _FigCaptureDeferredContainerManagerServerStart();
}

uint64_t FigCaptureMemoryReporterStart()
{
  return _FigCaptureMemoryReporterStart();
}

uint64_t FigCapturePreloadShaders()
{
  return _FigCapturePreloadShaders();
}

uint64_t FigCaptureSessionServerStart()
{
  return _FigCaptureSessionServerStart();
}

uint64_t FigCaptureSourceServerStart()
{
  return _FigCaptureSourceServerStart();
}

uint64_t FigCaptureTempFileManagerStart()
{
  return _FigCaptureTempFileManagerStart();
}

uint64_t FigCommonMediaProcessInitialization()
{
  return _FigCommonMediaProcessInitialization();
}

uint64_t FigExternalStorageDeviceManagerServerStart()
{
  return _FigExternalStorageDeviceManagerServerStart();
}

uint64_t FigFlashlightServerStart()
{
  return _FigFlashlightServerStart();
}

uint64_t FigSandboxRegistrationServerStart()
{
  return _FigSandboxRegistrationServerStart();
}

uint64_t FigVirtualCaptureCardServerStart()
{
  return _FigVirtualCaptureCardServerStart();
}

uint64_t MSNMonitorStartCam()
{
  return _MSNMonitorStartCam();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

pid_t getpid(void)
{
  return _getpid();
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

{
}

{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t proc_disable_cpumon()
{
  return _proc_disable_cpumon();
}

uint64_t proc_disable_wakemon()
{
  return _proc_disable_wakemon();
}

int pthread_get_qos_class_np(pthread_t __pthread, qos_class_t *__qos_class, int *__relative_priority)
{
  return _pthread_get_qos_class_np(__pthread, __qos_class, __relative_priority);
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

uint64_t pthread_set_fixedpriority_self()
{
  return _pthread_set_fixedpriority_self();
}

int pthread_set_qos_class_self_np(qos_class_t __qos_class, int __relative_priority)
{
  return _pthread_set_qos_class_self_np(__qos_class, __relative_priority);
}

uint64_t pthread_set_timeshare_self()
{
  return _pthread_set_timeshare_self();
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return _setiopolicy_np(a1, a2, a3);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

id objc_msgSend__setFileNameLocalizationEnabled_(void *a1, const char *a2, ...)
{
  return [a1 _setFileNameLocalizationEnabled:];
}