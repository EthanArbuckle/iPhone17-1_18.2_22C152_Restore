uint64_t sub_100003650(pthread_attr_t *a1, int a2, int a3)
{
  uint64_t v6;
  sched_param v8;

  v8 = 0;
  v6 = pthread_attr_init(a1);
  if (v6
    || (pthread_attr_setschedpolicy(a1, a3), v6 = pthread_attr_getschedparam(a1, &v8), v6)
    || (v8.sched_priority = a2, v6 = pthread_attr_setschedparam(a1, &v8), v6)
    || (v6 = pthread_attr_setdetachstate(a1, 1), v6))
  {
    pthread_attr_destroy(a1);
  }
  return v6;
}

uint64_t start()
{
  v1 = objc_opt_new();
  if (gLogCategory_CoreRC <= 40)
  {
    if (gLogCategory_CoreRC != -1 || _LogCategory_Initialize())
    {
      v5 = (const char *)&CoreRCVersionString;
      LogPrintF();
    }
    if (gLogCategory_CoreRC <= 40 && (gLogCategory_CoreRC != -1 || _LogCategory_Initialize()))
    {
      v5 = "@(#)PROGRAM:corercd  PROJECT:CoreRC-249.60.1\n";
      LogPrintF();
    }
  }
  dispatch_workloop_t inactive = dispatch_workloop_create_inactive("corercd - Workloop");
  if (inactive)
  {
    v3 = inactive;
    dispatch_workloop_set_scheduler_priority();
    dispatch_activate(v3);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000038D4;
    block[3] = &unk_1000040C0;
    block[4] = v1;
    block[5] = v3;
    dispatch_async(v3, block);

    dispatch_main();
  }
  if (gLogCategory_CoreRC <= 120 && (gLogCategory_CoreRC != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [v1 invalidate:v5];

  return 1;
}

id sub_1000038D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) startOnQueue:*(void *)(a1 + 40)];
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return _dispatch_workloop_create_inactive(label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return _dispatch_workloop_set_scheduler_priority();
}

{
}

{
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return _pthread_attr_getschedparam(a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return _pthread_attr_setschedparam(a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setschedpolicy(a1, a2);
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}