uint64_t start(int a1, uint64_t a2)
{
  __CFRunLoopSource *v2;
  __CFRunLoop *Main;
  void v5[5];
  int v6;
  CFRunLoopSourceContext context;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000035F0;
  v5[3] = &unk_100004120;
  v6 = a1;
  v5[4] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  v2 = (__CFRunLoopSource *)qword_100008008;
  if (!qword_100008008)
  {
    memset(&context, 0, 72);
    context.perform = (void (__cdecl *)(void *))nullsub_3;
    v2 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
    qword_100008008 = (uint64_t)v2;
    if (!v2) {
      dispatch_main();
    }
  }
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v2, kCFRunLoopCommonModes);
  CFRunLoopRun();
  return 0;
}

void sub_1000035F0(uint64_t a1)
{
  if (*(int *)(a1 + 40) >= 1) {
    strncmp(**(const char ***)(a1 + 32), "/usr/libexec/symptomsd-helper", 0x1DuLL);
  }
  configure_symptom_logging();
}

uint64_t sub_1000036AC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 32))
  {
    configure_analytics_launchpad_for_helper();
  }
  else
  {
    xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100004160);
    xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100004180);

    configure_symptom_evaluator_handling();
    activate_symptom_evaluator_handling();
    init_managed_event_listening();
    init_symptom_evaluator_listening();
    init_analytics_portal_listening();
  }
  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  v2 = (void *)qword_100008000;
  qword_100008000 = (uint64_t)v1;

  if (qword_100008000)
  {
    dispatch_source_set_event_handler((dispatch_source_t)qword_100008000, &stru_1000041C0);
    dispatch_resume((dispatch_object_t)qword_100008000);
  }

  return atexit_b(&stru_1000041E0);
}

void sub_1000037B0(id a1)
{
  uint64_t v1 = client_transactions_release();

  _xpc_transaction_exit_clean(v1);
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

uint64_t activate_symptom_evaluator_handling()
{
  return _activate_symptom_evaluator_handling();
}

int atexit_b(void *a1)
{
  return _atexit_b(a1);
}

uint64_t client_transactions_release()
{
  return _client_transactions_release();
}

uint64_t configure_analytics_launchpad_for_helper()
{
  return _configure_analytics_launchpad_for_helper();
}

uint64_t configure_symptom_evaluator_handling()
{
  return _configure_symptom_evaluator_handling();
}

uint64_t configure_symptom_logging()
{
  return _configure_symptom_logging();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
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

uint64_t init_analytics_portal_listening()
{
  return _init_analytics_portal_listening();
}

uint64_t init_managed_event_listening()
{
  return _init_managed_event_listening();
}

uint64_t init_symptom_evaluator_listening()
{
  return _init_symptom_evaluator_listening();
}

{
}

{
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t symptom_evaluator_shutdown()
{
  return _symptom_evaluator_shutdown();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}