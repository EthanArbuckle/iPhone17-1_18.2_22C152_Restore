uint64_t start()
{
  pthread_setname_np("com.apple.corecaptured.main");
  signal(2, (void (__cdecl *)(int))sub_100003C58);
  signal(3, (void (__cdecl *)(int))sub_100003C58);
  signal(15, (void (__cdecl *)(int))sub_100003C58);
  signal(1, (void (__cdecl *)(int))sub_100003C58);
  signal(10, (void (__cdecl *)(int))sub_100003C58);
  qword_100008000 = os_transaction_create();
  qword_100008008 = CoreCaptureStart();
  if (qword_100008008) {
    dispatch_main();
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100003C58(uint64_t result)
{
  if ((result - 2) < 2 || result == 15) {
    goto LABEL_14;
  }
  if (result == 10)
  {
    v2 = coreCaptureOsLog;
    if (coreCaptureOsLog)
    {
      if (!os_log_type_enabled(coreCaptureOsLog, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_WORD *)buf = 0;
      v3 = v2;
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_12;
      }
      *(_WORD *)buf = 0;
      v3 = &_os_log_default;
    }
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SIGBUS DEATH\n", buf, 2u);
LABEL_12:
    if (glog_fd)
    {
      *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v13 = v4;
      long long v14 = v4;
      long long v11 = v4;
      long long v12 = v4;
      long long v9 = v4;
      long long v10 = v4;
      *(_OWORD *)buf = v4;
      long long v8 = v4;
      memset(&v6, 0, sizeof(v6));
      time_t v5 = 0xAAAAAAAAAAAAAAAALL;
      time(&v5);
      localtime_r(&v5, &v6);
      strftime((char *)buf, 0x80uLL, "%b %d %H:%M:%S", &v6);
      dprintf(glog_fd, "%s ", (const char *)buf);
      dprintf(glog_fd, "SIGBUS DEATH\n");
    }
LABEL_14:
    if (qword_100008008)
    {
      qword_100008008 = 0;
      CoreCaptureStop();
      signal(2, (void (__cdecl *)(int))1);
      signal(3, (void (__cdecl *)(int))1);
      signal(15, (void (__cdecl *)(int))1);
      signal(1, (void (__cdecl *)(int))1);
      signal(10, (void (__cdecl *)(int))1);
      if (qword_100008000)
      {
        qword_100008000 = 0;
        os_release(0);
      }
    }
    exit(0);
  }
  return result;
}

uint64_t CoreCaptureStart()
{
  return _CoreCaptureStart();
}

uint64_t CoreCaptureStop()
{
  return _CoreCaptureStop();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_main(void)
{
}

int dprintf(int a1, const char *a2, ...)
{
  return _dprintf(a1, a2);
}

void exit(int a1)
{
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return _localtime_r(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_release(void *object)
{
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int pthread_setname_np(const char *a1)
{
  return _pthread_setname_np(a1);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return _strftime(a1, a2, a3, a4);
}

time_t time(time_t *a1)
{
  return _time(a1);
}