uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  long long v11;
  long long v12;
  long long v13;
  long long v14;
  unsigned char v15[128];

  v1 = +[NSProcessInfo processInfo];
  v2 = [v1 arguments];

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = v2;
  v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v4)
  {
LABEL_9:

    sub_1000022FC();
  }
  v5 = v4;
  v6 = *(void *)v12;
LABEL_3:
  v7 = 0;
  while (1)
  {
    if (*(void *)v12 != v6) {
      objc_enumerationMutation(v3);
    }
    if ([*(id *)(*((void *)&v11 + 1) + 8 * v7) containsString:@"LAUNCHED_BY_LAUNCHD"])break; {
    if (v5 == (id)++v7)
    }
    {
      v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (!v5) {
        goto LABEL_9;
      }
      goto LABEL_3;
    }
  }

  if (!getuid()) {
    sub_100002408();
  }
  v8 = objc_opt_new();
  [v8 start];

  v9 = +[NSRunLoop mainRunLoop];
  [v9 run];

  return 0;
}

void sub_1000022FC()
{
  v0 = sub_1000024A8(&qword_1000082A8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "routined was not launchd by launchd.", v7, 2u);
  }

  id v1 = +[NSString stringWithFormat:@"routined was not launchd by launchd.\n"];
  v2 = (const char *)[v1 UTF8String];
  fputs(v2, __stderrp);

  id v3 = +[NSString stringWithFormat:@"PERMISSION DENIED....and....\n"];
  v4 = (const char *)[v3 UTF8String];
  fputs(v4, __stderrp);

  while (1)
  {
    id v5 = +[NSString stringWithFormat:@"YOU DIDN'T SAY THE MAGIC WORD!\n"];
    v6 = (const char *)[v5 UTF8String];
    fputs(v6, __stderrp);

    usleep(0x7A120u);
  }
}

void sub_100002408()
{
  v0 = sub_1000024A8(&qword_1000082A8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "routined is not worthy of running as root.", v3, 2u);
  }

  id v1 = +[NSString stringWithFormat:@"routined is not worthy of running as root.\n"];
  v2 = (const char *)[v1 UTF8String];
  fputs(v2, __stderrp);

  exit(0);
}

id sub_1000024A8(dispatch_once_t *predicate)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)sub_100002508);
  }
  v2 = (void *)predicate[2];

  return v2;
}

os_log_t sub_100002508(uint64_t a1)
{
  os_log_t result = os_log_create("com.apple.CoreRoutine", *(const char **)(a1 + 8));
  *(void *)(a1 + 16) = result;
  return result;
}

void sub_1000026D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000026F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002700(uint64_t a1)
{
}

void sub_100002708(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = sub_1000024A8(&qword_1000082C0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "An error was encountered while fetching proximity events, %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    [*(id *)(a1 + 32) setProximityEvents:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [*(id *)(a1 + 32) queryPeopleCount];
  }
}

void sub_100002988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000029A4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = sub_1000024A8(&qword_1000082C0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "An error was encountered while fetching people counts, %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    [*(id *)(a1 + 32) setPeopleCounts:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

void sub_100002BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002BF4(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    v8 = sub_1000024A8(&qword_1000082C0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "An error was encountered while fetching density information, %@", (uint8_t *)&v9, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    [*(id *)(a1 + 32) setPeopleDensities:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

void exit(int a1)
{
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

uid_t getuid(void)
{
  return _getuid();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return [a1 arguments];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_entryDate(void *a1, const char *a2, ...)
{
  return [a1 entryDate];
}

id objc_msgSend_exitDate(void *a1, const char *a2, ...)
{
  return [a1 exitDate];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_proximityEvents(void *a1, const char *a2, ...)
{
  return [a1 proximityEvents];
}

id objc_msgSend_queryPeopleCount(void *a1, const char *a2, ...)
{
  return [a1 queryPeopleCount];
}

id objc_msgSend_routineManager(void *a1, const char *a2, ...)
{
  return [a1 routineManager];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}