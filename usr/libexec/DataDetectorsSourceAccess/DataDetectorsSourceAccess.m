uint64_t start()
{
  void *v0;
  void *v1;
  id v2;

  stru_100008688.__sigaction_u.__sa_handler = (void (__cdecl *)(int))sub_10000305C;
  *(void *)&stru_100008688.sa_mask = 0;
  sigaction(15, &stru_100008688, 0);
  v1 = objc_opt_new();
  v2 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.DataDetectorsSourceAccess"];
  [v2 setDelegate:v1];
  [v2 resume];
  CFRunLoopRun();

  return 0;
}

void sub_10000305C(int a1)
{
  if (a1 == 15)
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
  }
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

int sigaction(int a1, const sigaction *a2, sigaction *a3)
{
  return _sigaction(a1, a2, a3);
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserIdentifier];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}