uint64_t start()
{
  uint64_t i;
  int v1;
  NSObject *v2;
  void v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000388C;
  v4[3] = &unk_100004090;
  v4[4] = &v5;
  v4[5] = CFRunLoopGetCurrent();
  _set_user_dir_suffix();
  for (i = 0; i != 3; ++i)
  {
    v1 = dword_100003988[i];
    signal(v1, (void (__cdecl *)(int))1);
    v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, v1, 0, (dispatch_queue_t)&_dispatch_main_q);
    qword_100008000[i] = v2;
    dispatch_source_set_event_handler(v2, v4);
    dispatch_activate(qword_100008000[i]);
  }
  FigCommonMediaProcessInitialization();
  FigCaptureDeferredPhotoProcessorServerStart();
  while (!*((unsigned char *)v6 + 24))
    CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, 0);
  _Block_object_dispose(&v5, 8);
  return 0;
}

void sub_10000386C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000388C(uint64_t a1)
{
  v2 = *(__CFRunLoop **)(a1 + 40);
  if (v2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    CFRunLoopStop(v2);
  }
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

uint64_t FigCaptureDeferredPhotoProcessorServerStart()
{
  return _FigCaptureDeferredPhotoProcessorServerStart();
}

uint64_t FigCommonMediaProcessInitialization()
{
  return _FigCommonMediaProcessInitialization();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}