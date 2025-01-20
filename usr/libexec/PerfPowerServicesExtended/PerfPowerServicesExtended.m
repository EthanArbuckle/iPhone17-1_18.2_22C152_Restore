id sub_100003004()
{
  void *v0;
  uint64_t vars8;

  v0 = +[PowerlogCore sharedCore];
  [v0 stopCore];

  if (+[PLDefaults debugEnabled]) {
    NSLog(@"*** Powerlog Exit *** sleep to avoid bounce");
  }

  return +[PLUtilities exitWithReason:2];
}

uint64_t start()
{
  EnterSandbox();
  if (+[PowerlogCore allowRun])
  {
    if (+[PLDefaults debugEnabled])
    {
      v1 = +[PLUtilities fullModeDaemonName];
      v2 = +[NSString stringWithFormat:@"*** start %@ ***", v1];

      v3 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Executables/PerfPowerServicesExtended/PerfPowerServicesExtended.m"];
      v4 = [v3 lastPathComponent];
      v5 = +[NSString stringWithUTF8String:"main"];
      +[PLCoreStorage logMessage:v2 fromFile:v4 fromFunction:v5 fromLineNumber:59];

      v6 = PLLogCommon();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_100003728();
      }
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100003630, @"com.apple.powerlog.state_changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v8 = +[PowerlogCore sharedCore];
    [v8 startCore];

    do
    {
      v9 = +[NSRunLoop currentRunLoop];
      v10 = +[NSDate distantFuture];
      unsigned __int8 v11 = [v9 runMode:NSDefaultRunLoopMode beforeDate:v10];
    }
    while ((v11 & 1) != 0);
    v12 = +[PowerlogCore sharedCore];
    [v12 stopCore];
  }
  else
  {
    v13 = +[NSFileManager defaultManager];
    v14 = [@"/var/mobile/Library/Caches" stringByAppendingString:@"/powerlogd.launchd"];
    unsigned int v15 = [v13 fileExistsAtPath:v14];

    unsigned int v16 = +[PLDefaults debugEnabled];
    if (v15)
    {
      if (v16)
      {
        v17 = +[PLUtilities fullModeDaemonName];
        v18 = +[NSString stringWithFormat:@"*** kill %@ ***", v17];

        v19 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Executables/PerfPowerServicesExtended/PerfPowerServicesExtended.m"];
        v20 = [v19 lastPathComponent];
        v21 = +[NSString stringWithUTF8String:"main"];
        +[PLCoreStorage logMessage:v18 fromFile:v20 fromFunction:v21 fromLineNumber:64];

        v22 = PLLogCommon();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          sub_100003728();
        }
      }
      v23 = +[NSFileManager defaultManager];
      v24 = [@"/var/mobile/Library/Caches" stringByAppendingString:@"/powerlogd.launchd"];
      id v41 = 0;
      unsigned __int8 v25 = [v23 removeItemAtPath:v24 error:&v41];
      id v26 = v41;

      if (v25)
      {
        if (+[PLDefaults debugEnabled])
        {
          v27 = [@"/var/mobile/Library/Caches" stringByAppendingString:@"/powerlogd.launchd"];
          NSLog(@"%@ removed ", v27);
        }
      }
      else
      {
        NSLog(@"*** ERROR *** unable to remove launchd flag: %@", v26);
      }
      v34 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v34, @"com.apple.powerlog.state_changed", 0, 0, 0);
      if (+[PLDefaults debugEnabled])
      {
        v35 = +[NSString stringWithFormat:@"sleep to avoid bounce"];
        v36 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Executables/PerfPowerServicesExtended/PerfPowerServicesExtended.m"];
        v37 = [v36 lastPathComponent];
        v38 = +[NSString stringWithUTF8String:"main"];
        +[PLCoreStorage logMessage:v35 fromFile:v37 fromFunction:v38 fromLineNumber:73];

        v39 = PLLogCommon();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
          sub_100003728();
        }
      }
      sleep(0xAu);
    }
    else
    {
      if (v16)
      {
        v28 = +[PLUtilities fullModeDaemonName];
        v29 = +[NSString stringWithFormat:@"*** stop %@ *** sleep to avoid bounce", v28];

        v30 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Executables/PerfPowerServicesExtended/PerfPowerServicesExtended.m"];
        v31 = [v30 lastPathComponent];
        v32 = +[NSString stringWithUTF8String:"main"];
        +[PLCoreStorage logMessage:v29 fromFile:v31 fromFunction:v32 fromLineNumber:77];

        v33 = PLLogCommon();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          sub_100003728();
        }
      }
      sleep(0xAu);
    }
  }
  return 0;
}

void sub_100003630()
{
  if (+[PLDefaults debugEnabled]) {
    NSLog(@"*** PLStateChanged ***");
  }
  unsigned int v0 = +[PLDefaults taskMode];
  unsigned __int8 v1 = +[PowerlogCore allowRun];
  unsigned int v2 = +[PLDefaults liveModeQuery];
  if (v1)
  {
    if (v2 == 1) {
      unsigned int v3 = v0;
    }
    else {
      unsigned int v3 = 0;
    }
    if (v3 != 1)
    {
      if (+[PLDefaults debugEnabled]) {
        NSLog(@"*** Powerlog Continue ***");
      }
      return;
    }
    goto LABEL_12;
  }
  if (v0)
  {
LABEL_12:
    v4 = +[PLSubmissions sharedInstance];
    [v4 taskingCleanup];
  }

  sub_100003004();
}

void sub_100003700(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100003728()
{
  sub_10000371C();
  sub_100003700((void *)&_mh_execute_header, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

uint64_t EnterSandbox()
{
  return _EnterSandbox();
}

void NSLog(NSString *format, ...)
{
}

uint64_t PLLogCommon()
{
  return _PLLogCommon();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

id objc_msgSend_allowRun(void *a1, const char *a2, ...)
{
  return [a1 allowRun];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_debugEnabled(void *a1, const char *a2, ...)
{
  return [a1 debugEnabled];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_fullModeDaemonName(void *a1, const char *a2, ...)
{
  return [a1 fullModeDaemonName];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_liveModeQuery(void *a1, const char *a2, ...)
{
  return [a1 liveModeQuery];
}

id objc_msgSend_sharedCore(void *a1, const char *a2, ...)
{
  return [a1 sharedCore];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_startCore(void *a1, const char *a2, ...)
{
  return [a1 startCore];
}

id objc_msgSend_stopCore(void *a1, const char *a2, ...)
{
  return [a1 stopCore];
}

id objc_msgSend_taskMode(void *a1, const char *a2, ...)
{
  return [a1 taskMode];
}

id objc_msgSend_taskingCleanup(void *a1, const char *a2, ...)
{
  return [a1 taskingCleanup];
}