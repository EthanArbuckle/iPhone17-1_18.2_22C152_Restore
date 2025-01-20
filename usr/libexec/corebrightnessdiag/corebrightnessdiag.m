os_log_t sub_1000034AC()
{
  os_log_t v0;

  v0 = os_log_create("com.apple.CoreBrightness", "default");
  qword_100008040 = (uint64_t)v0;
  if (!v0)
  {
    v0 = (os_log_t)&_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000039F8();
    }
    qword_100008040 = (uint64_t)&_os_log_default;
  }
  return v0;
}

uint64_t sub_100003514()
{
  return puts("corebrightnessdiag [nightshift] [sunschedule] [nightshift-internal] [status-info]");
}

void sub_100003520(int a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = dispatch_queue_create("parseArgQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000035E0;
  block[3] = &unk_100004128;
  int v11 = a1;
  id v9 = v5;
  uint64_t v10 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

intptr_t sub_1000035E0(uint64_t a1)
{
  if (*(int *)(a1 + 48) >= 2)
  {
    v2 = *(const char **)(*(void *)(a1 + 40) + 8);
    if (strcmp(v2, "-h"))
    {
      if (strcmp(v2, "--help"))
      {
        v3 = "Night Shift Status";
        CFStringRef v4 = @"CBBlueReductionStatus";
        id v5 = "%s \n";
        v6 = "sunschedule";
        id v7 = "Night Shift Sunset/Sunrise";
        uint64_t v8 = 1;
        while (1)
        {
          id v9 = *(const char **)(*(void *)(a1 + 40) + 8 * v8);
          if (!strcmp(v9, "nightshift"))
          {
            puts(v3);
            id v10 = [*(id *)(a1 + 32) copyPropertyForKey:v4];
            id v11 = [v10 description];
            printf(v5, [v11 UTF8String]);
          }
          else
          {
            if (strcmp(v9, v6))
            {
              if (strcmp(v9, "nightshift-internal"))
              {
                if (!strcmp(v9, "status-info"))
                {
                  v16 = v5;
                  v17 = v6;
                  CFStringRef v18 = v4;
                  v19 = v3;
                  v20 = v7;
                  id v21 = [*(id *)(a1 + 32) copyPropertyForKey:@"StatusInfo"];
                  v22 = +[NSURL fileURLWithPath:@"/dev/stdout"];
                  unsigned __int8 v23 = [v21 writeToURL:v22 atomically:0];

                  if ((v23 & 1) == 0)
                  {
                    puts("Unable to dump a property list.");
                    id v24 = [v21 description];
                    puts((const char *)[v24 UTF8String]);
                  }
                  id v7 = v20;
                  v3 = v19;
                  CFStringRef v4 = v18;
                  v6 = v17;
                  id v5 = v16;
                }
                else
                {
                  printf("Unrecognized identifier %s\n", v9);
                }
                goto LABEL_13;
              }
              puts(v3);
              id v12 = [*(id *)(a1 + 32) copyPropertyForKey:v4];
              id v13 = [v12 description];
              printf(v5, [v13 UTF8String]);
            }
            puts(v7);
            id v14 = [*(id *)(a1 + 32) copyPropertyForKey:@"BlueLightSunSchedule"];
            id v15 = [v14 description];
            printf(v5, [v15 UTF8String]);
          }
LABEL_13:
          if (++v8 >= *(int *)(a1 + 48)) {
            goto LABEL_19;
          }
        }
      }
    }
  }
  puts("corebrightnessdiag [nightshift] [sunschedule] [nightshift-internal] [status-info]");
LABEL_19:
  v25 = qword_100008058;

  return dispatch_semaphore_signal(v25);
}

void sub_1000038AC()
{
  byte_100008048 = 0;
}

uint64_t start(int a1, uint64_t a2)
{
  signal(2, (void (__cdecl *)(int))sub_1000038AC);
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  id v5 = (void *)qword_100008058;
  qword_100008058 = (uint64_t)v4;

  id v7 = objc_alloc_init((Class)BrightnessSystemClient);
  sub_100003520(a1, a2, v7);
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_100008058, 0xFFFFFFFFFFFFFFFFLL);
  do
  {
    uint64_t v8 = +[NSRunLoop currentRunLoop];
    id v9 = objc_alloc((Class)NSDate);
    id v10 = [v9 initWithTimeIntervalSinceNow:*(double *)&qword_100008050];
    unsigned int v11 = [v8 runMode:NSDefaultRunLoopMode beforeDate:v10];

    if (v11) {
      BOOL v12 = byte_100008048 == 0;
    }
    else {
      BOOL v12 = 1;
    }
  }
  while (!v12);

  return 0;
}

void sub_1000039F8()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to create CoreBrightness default log", v0, 2u);
}

void NSLog(NSString *format, ...)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_writeToURL_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:atomically:];
}