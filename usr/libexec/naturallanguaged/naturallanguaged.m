uint64_t start()
{
  char *pw_dir;
  uid_t v1;
  passwd *v2;
  char *v3;
  char *v4;
  void *v5;
  id v6;
  id v7;
  char v9[1024];

  bzero(v9, 0x400uLL);
  pw_dir = getenv("HOME");
  if (!pw_dir)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_100003598();
    }
    v1 = getuid();
    v2 = getpwuid(v1);
    if (!v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_10000339C();
      }
      exit(1);
    }
    pw_dir = v2->pw_dir;
  }
  v3 = realpath_DARWIN_EXTSN(pw_dir, 0);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003418();
    }
    exit(1);
  }
  if (!_set_user_dir_suffix() || !confstr(65537, v9, 0x400uLL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003498();
    }
    exit(1);
  }
  v4 = realpath_DARWIN_EXTSN(v9, 0);
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003518();
    }
    exit(1);
  }
  free(v4);
  free(v3);
  v6 = objc_alloc_init((Class)TCTextServer);
  v7 = [objc_alloc((Class)TCXPCServer) initWithTextServer:v6];
  [v7 run];

  return 0;
}

void sub_100003380(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_10000339C()
{
  getuid();
  sub_100003380((void *)&_mh_execute_header, &_os_log_default, v0, "failed to get passwd entry for uid %u", v1, v2, v3, v4, 0);
}

void sub_100003418()
{
  __error();
  sub_100003380((void *)&_mh_execute_header, &_os_log_default, v0, "failed to resolve user's home directory: %{darwin.errno}d", v1, v2, v3, v4, 0);
}

void sub_100003498()
{
  __error();
  sub_100003380((void *)&_mh_execute_header, &_os_log_default, v0, "failed to initialize temporary directory: %{darwin.errno}d", v1, v2, v3, v4, 0);
}

void sub_100003518()
{
  __error();
  sub_100003380((void *)&_mh_execute_header, &_os_log_default, v0, "failed to resolve temporary directory: %{darwin.errno}d", v1, v2, v3, v4, 0);
}

void sub_100003598()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "$HOME not set, falling back to using getpwuid", v0, 2u);
}

void NSLog(NSString *format, ...)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

void objc_end_catch(void)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}