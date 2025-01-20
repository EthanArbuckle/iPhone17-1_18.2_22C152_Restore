uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  unsigned __int8 v3;

  EnterSandbox();
  +[PowerlogCore setupCore];
  do
  {
    v1 = +[NSRunLoop currentRunLoop];
    v2 = +[NSDate distantFuture];
    v3 = [v1 runMode:NSDefaultRunLoopMode beforeDate:v2];
  }
  while ((v3 & 1) != 0);
  return 0;
}

uint64_t EnterSandbox()
{
  return _EnterSandbox();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_setupCore(void *a1, const char *a2, ...)
{
  return [a1 setupCore];
}