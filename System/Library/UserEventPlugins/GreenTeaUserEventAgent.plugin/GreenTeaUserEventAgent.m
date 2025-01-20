void init_greentea_logging()
{
  int v0;

  if (notify_register_dispatch("com.apple.ManagedConfiguration.profileListChanged", &dword_40A0, (dispatch_queue_t)&_dispatch_main_q, &stru_4080))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_3CEC();
    }
    dword_40A0 = -1;
  }
  v0 = ct_green_tea_logging_enabled();
  sub_3BF0(v0);
}

void sub_3B8C(id a1, int a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Handling mobile config installation", v3, 2u);
  }
  int v2 = ct_green_tea_logging_enabled();
  sub_3BF0(v2);
}

void sub_3BF0(int a1)
{
  int v3 = a1;
  int v1 = sysctlbyname("security.mac.platform_exec_logging", 0, 0, &v3, 4uLL);
  if (v1)
  {
    int v2 = v1;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_3D34(&v3, v2);
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "security.mac.platform_exec_logging";
    __int16 v6 = 1024;
    int v7 = v3;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "SET %s to %d", buf, 0x12u);
  }
}

void sub_3CEC()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Failed to register for the mobile config installation notification", v0, 2u);
}

void sub_3D34(int *a1, int a2)
{
  int v3 = *a1;
  v4 = __error();
  v5 = strerror(*v4);
  int v6 = 136315906;
  int v7 = "security.mac.platform_exec_logging";
  __int16 v8 = 1024;
  int v9 = v3;
  __int16 v10 = 1024;
  int v11 = a2;
  __int16 v12 = 2080;
  v13 = v5;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "FAILED to set %s to %d with error: %d  %s", (uint8_t *)&v6, 0x22u);
}

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t ct_green_tea_logging_enabled()
{
  return _ct_green_tea_logging_enabled();
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}