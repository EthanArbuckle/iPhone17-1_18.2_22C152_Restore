uint64_t start()
{
  void *v0;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;

  if (+[PLDefaults debugEnabled]) {
    NSLog(@"*** start powerlogHelperd ***");
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100003CE0, @"com.apple.powerlogHelperd.state_changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v2 = +[PowerlogCore sharedCore];
  [v2 startCore];

  do
  {
    v3 = +[NSRunLoop currentRunLoop];
    v4 = +[NSDate distantFuture];
    v5 = [v3 runMode:NSDefaultRunLoopMode beforeDate:v4];
  }
  while ((v5 & 1) != 0);
  v6 = +[PowerlogCore sharedCore];
  [v6 stopCore];

  if (+[PLDefaults debugEnabled]) {
    NSLog(@"*** stop powerlogHelperd ***");
  }
  return 0;
}

void sub_100003CE0()
{
  if (+[PLDefaults debugEnabled]) {
    NSLog(@"*** PLStateChanged ***");
  }
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void NSLog(NSString *format, ...)
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

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_debugEnabled(void *a1, const char *a2, ...)
{
  return [a1 debugEnabled];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_sharedCore(void *a1, const char *a2, ...)
{
  return [a1 sharedCore];
}

id objc_msgSend_startCore(void *a1, const char *a2, ...)
{
  return [a1 startCore];
}

id objc_msgSend_stopCore(void *a1, const char *a2, ...)
{
  return [a1 stopCore];
}