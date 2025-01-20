void sub_1000031B4()
{
  char *pw_dir;
  uid_t v1;
  passwd *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9[8];
  char v10[1024];

  bzero(v10, 0x400uLL);
  pw_dir = getenv("HOME");
  if (!pw_dir)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
      sub_1000037A8();
    }
    v1 = getuid();
    v2 = getpwuid(v1);
    if (!v2)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_100003454();
      }
LABEL_28:
      exit(1);
    }
    pw_dir = v2->pw_dir;
  }
  v3 = realpath_DARWIN_EXTSN(pw_dir, 0);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000034CC();
    }
    goto LABEL_28;
  }
  v4 = v3;
  if (!_set_user_dir_suffix() || !confstr(65537, v10, 0x400uLL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003544();
    }
    goto LABEL_28;
  }
  v5 = realpath_DARWIN_EXTSN(v10, 0);
  if (!v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000035BC();
    }
    goto LABEL_28;
  }
  v6 = v5;
  if (!confstr(65538, v10, 0x400uLL))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003634();
    }
    goto LABEL_28;
  }
  v7 = realpath_DARWIN_EXTSN(v10, 0);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1000036AC();
    }
    goto LABEL_28;
  }
  v8 = v7;
  v9[1] = (uint64_t)"HOME";
  v9[2] = (uint64_t)v4;
  v9[3] = (uint64_t)"TMPDIR";
  v9[4] = (uint64_t)v6;
  v9[5] = (uint64_t)"DARWIN_CACHE_DIR";
  v9[6] = (uint64_t)v7;
  v9[7] = 0;
  v9[0] = 0;
  if (sandbox_init_with_parameters())
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100003724(v9);
    }
    goto LABEL_28;
  }
  free(v4);
  free(v6);
  free(v8);
}

void sub_1000033F8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void start()
{
  v1 = +[SDDaemon sharedInstance];
  [v1 start];

  dispatch_main();
}

void sub_100003454()
{
  getuid();
  sub_1000033F8((void *)&_mh_execute_header, &_os_log_default, v0, "failed to get passwd entry for uid %u", v1, v2, v3, v4, 0);
}

void sub_1000034CC()
{
  __error();
  sub_100003414();
  sub_1000033F8((void *)&_mh_execute_header, &_os_log_default, v0, "failed to resolve user's home directory: %{darwin.errno}d", v1, v2, v3, v4, v5);
}

void sub_100003544()
{
  __error();
  sub_100003414();
  sub_1000033F8((void *)&_mh_execute_header, &_os_log_default, v0, "failed to initialize temporary directory: %{darwin.errno}d", v1, v2, v3, v4, v5);
}

void sub_1000035BC()
{
  __error();
  sub_100003414();
  sub_1000033F8((void *)&_mh_execute_header, &_os_log_default, v0, "failed to resolve temporary directory: %{darwin.errno}d", v1, v2, v3, v4, v5);
}

void sub_100003634()
{
  __error();
  sub_100003414();
  sub_1000033F8((void *)&_mh_execute_header, &_os_log_default, v0, "failed to initialize cache directory: %{darwin.errno}d", v1, v2, v3, v4, v5);
}

void sub_1000036AC()
{
  __error();
  sub_100003414();
  sub_1000033F8((void *)&_mh_execute_header, &_os_log_default, v0, "failed to resolve cache directory: %{darwin.errno}d", v1, v2, v3, v4, v5);
}

void sub_100003724(uint64_t *a1)
{
  uint64_t v1 = *a1;
  int v2 = 136446210;
  uint64_t v3 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to enter sandbox: %{public}s", (uint8_t *)&v2, 0xCu);
}

void sub_1000037A8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "$HOME not set, falling back to using getpwuid", v0, 2u);
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

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t sandbox_init_with_parameters()
{
  return _sandbox_init_with_parameters();
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}