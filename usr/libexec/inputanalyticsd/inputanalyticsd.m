void start()
{
  void *v0;
  NSObject *v1;
  void *v2;
  id v3;
  void *v4;

  sub_1000033C8();
  NSLog(@"inputanalyticsd started!");
  +[IAServerStats logStart];
  v1 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler(v1, &stru_100004128);
  dispatch_resume(v1);
  signal(15, (void (__cdecl *)(int))1);
  setlinebuf(__stdoutp);
  v3 = objc_alloc_init((Class)IASStandaloneServer);
  v4 = (void *)qword_100008010;
  qword_100008010 = (uint64_t)v3;

  NSLog(@"inputanalyticsd dispatching main");
  dispatch_main();
}

void sub_1000033C8()
{
  bzero(v7, 0x400uLL);
  pw_dir = getenv("HOME");
  if (!pw_dir)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100003768();
    }
    uid_t v1 = getuid();
    v2 = getpwuid(v1);
    if (!v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000357C();
      }
LABEL_19:
      exit(1);
    }
    pw_dir = v2->pw_dir;
  }
  v3 = realpath_DARWIN_EXTSN(pw_dir, 0);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000035F4();
    }
    goto LABEL_19;
  }
  v4 = v3;
  if (!_set_user_dir_suffix() || !confstr(65537, v7, 0x400uLL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003670();
    }
    goto LABEL_19;
  }
  v5 = realpath_DARWIN_EXTSN(v7, 0);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000036EC();
    }
    goto LABEL_19;
  }
  v6 = v5;
  free(v4);
  free(v6);
}

void sub_100003534(id a1)
{
}

void sub_100003560(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_10000357C()
{
  getuid();
  sub_100003560((void *)&_mh_execute_header, &_os_log_default, v0, "failed to get passwd entry for uid %u", v1, v2, v3, v4, 0);
}

void sub_1000035F4()
{
  __error();
  sub_100003560((void *)&_mh_execute_header, &_os_log_default, v0, "failed to resolve user's home directory: %{darwin.errno}d", v1, v2, v3, v4, 0);
}

void sub_100003670()
{
  __error();
  sub_100003560((void *)&_mh_execute_header, &_os_log_default, v0, "failed to initialize temporary directory: %{darwin.errno}d", v1, v2, v3, v4, 0);
}

void sub_1000036EC()
{
  __error();
  sub_100003560((void *)&_mh_execute_header, &_os_log_default, v0, "failed to resolve temporary directory: %{darwin.errno}d", v1, v2, v3, v4, 0);
}

void sub_100003768()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "$HOME not set, falling back to using getpwuid", v0, 2u);
}

void NSLog(NSString *format, ...)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
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

void exit(int a1)
{
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return _getenv(a1);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return _getpwuid(a1);
}

uid_t getuid(void)
{
  return _getuid();
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int setlinebuf(FILE *a1)
{
  return _setlinebuf(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

id objc_msgSend_logShutdown(void *a1, const char *a2, ...)
{
  return [a1 logShutdown];
}

id objc_msgSend_logStart(void *a1, const char *a2, ...)
{
  return [a1 logStart];
}