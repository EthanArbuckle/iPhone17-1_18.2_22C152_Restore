uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  unsigned __int8 v4;
  uint64_t v5;

  [@"com.apple.metrickitd" UTF8String];
  _set_user_dir_suffix();
  v1 = +[MXCore sharedCore];
  if (v1)
  {
    do
    {
      v2 = +[NSRunLoop currentRunLoop];
      v3 = +[NSDate distantFuture];
      v4 = [v2 runMode:NSDefaultRunLoopMode beforeDate:v3];
    }
    while ((v4 & 1) != 0);
    v5 = 0;
  }
  else
  {
    NSLog(@"Failed to start core");
    v5 = 1;
  }

  return v5;
}

void NSLog(NSString *format, ...)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_sharedCore(void *a1, const char *a2, ...)
{
  return [a1 sharedCore];
}