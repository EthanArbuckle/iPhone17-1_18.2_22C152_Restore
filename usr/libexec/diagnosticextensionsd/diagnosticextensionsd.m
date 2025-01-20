uint64_t start()
{
  void *v0;
  void *v1;

  sub_10000306C();
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100004108);
  v1 = +[NSRunLoop currentRunLoop];
  [v1 run];

  return 0;
}

void sub_100002C68(id a1)
{
  id v1 = +[DEDDaemon sharedInstance];
  [v1 start];
}

void sub_100002CB0()
{
  bzero(v12, 0x400uLL);
  pw_dir = getenv("HOME");
  if (!pw_dir)
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    id v1 = qword_100008020;
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_DEBUG)) {
      sub_1000034E4(v1);
    }
    uid_t v2 = getuid();
    v3 = getpwuid(v2);
    if (!v3)
    {
      if (qword_100008028 != -1) {
        dispatch_once(&qword_100008028, &stru_100004148);
      }
      if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
        sub_100003180();
      }
LABEL_44:
      exit(1);
    }
    pw_dir = v3->pw_dir;
  }
  v4 = realpath_DARWIN_EXTSN(pw_dir, 0);
  if (!v4)
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
      sub_1000031FC();
    }
    goto LABEL_44;
  }
  v5 = v4;
  if (!_set_user_dir_suffix() || !confstr(65537, v12, 0x400uLL))
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
      sub_100003278();
    }
    goto LABEL_44;
  }
  v6 = realpath_DARWIN_EXTSN(v12, 0);
  if (!v6)
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
      sub_1000032F4();
    }
    goto LABEL_44;
  }
  v7 = v6;
  if (!confstr(65538, v12, 0x400uLL))
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
      sub_100003370();
    }
    goto LABEL_44;
  }
  v8 = realpath_DARWIN_EXTSN(v12, 0);
  if (!v8)
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
      sub_1000033EC();
    }
    goto LABEL_44;
  }
  v9 = v8;
  v11[1] = (uint64_t)"HOME";
  v11[2] = (uint64_t)v5;
  v11[3] = (uint64_t)"TMPDIR";
  v11[4] = (uint64_t)v7;
  v11[5] = (uint64_t)"DARWIN_CACHE_DIR";
  v11[6] = (uint64_t)v8;
  v11[7] = 0;
  v11[0] = 0;
  if (sandbox_init_with_parameters())
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    v10 = qword_100008020;
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
      sub_100003468(v11, v10);
    }
    goto LABEL_44;
  }
  free(v5);
  free(v7);
  free(v9);
}

void sub_10000306C()
{
  if (_set_user_dir_suffix())
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    v0 = qword_100008020;
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_DEBUG)) {
      sub_100003528(v0);
    }
  }
  else
  {
    if (qword_100008028 != -1) {
      dispatch_once(&qword_100008028, &stru_100004148);
    }
    id v1 = qword_100008020;
    if (os_log_type_enabled((os_log_t)qword_100008020, OS_LOG_TYPE_ERROR)) {
      sub_10000356C(v1);
    }
  }
}

void sub_100003124(id a1)
{
  qword_100008020 = (uint64_t)os_log_create("com.apple.diagnosticextensionsd", "sandbox");
}

void sub_100003154(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100003180()
{
  getuid();
  sub_100003154((void *)&_mh_execute_header, v0, v1, "failed to get passwd entry for uid %u", v2, v3, v4, v5, 0);
}

void sub_1000031FC()
{
  __error();
  sub_100003174();
  sub_100003154((void *)&_mh_execute_header, v0, v1, "failed to resolve user's home directory: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_100003278()
{
  __error();
  sub_100003174();
  sub_100003154((void *)&_mh_execute_header, v0, v1, "failed to initialize temporary directory: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_1000032F4()
{
  __error();
  sub_100003174();
  sub_100003154((void *)&_mh_execute_header, v0, v1, "failed to resolve temporary directory: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_100003370()
{
  __error();
  sub_100003174();
  sub_100003154((void *)&_mh_execute_header, v0, v1, "failed to initialize cache directory: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_1000033EC()
{
  __error();
  sub_100003174();
  sub_100003154((void *)&_mh_execute_header, v0, v1, "failed to resolve cache directory: %{darwin.errno}d", v2, v3, v4, v5, v6);
}

void sub_100003468(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136446210;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to enter sandbox: %{public}s", (uint8_t *)&v3, 0xCu);
}

void sub_1000034E4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "$HOME not set, falling back to using getpwuid", v1, 2u);
}

void sub_100003528(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Configured sandboxed temporary directory", v1, 2u);
}

void sub_10000356C(NSObject *a1)
{
  uint64_t v2 = __error();
  int v3 = strerror(*v2);
  int v4 = 136315138;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Failed to configure sandbox temporary directory, error %s", (uint8_t *)&v4, 0xCu);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
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

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

uint64_t sandbox_init_with_parameters()
{
  return _sandbox_init_with_parameters();
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}