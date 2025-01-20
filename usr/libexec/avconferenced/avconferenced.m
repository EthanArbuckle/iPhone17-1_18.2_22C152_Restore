int main(int argc, const char **argv, const char **envp)
{
  int v3;
  BOOL v4;
  uint8_t v6[16];
  uint8_t v7[16];
  uint8_t buf[8];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "avconferenced started.", buf, 2u);
  }
  v3 = VCFeatureFlagManager_UseAvconferenced();
  v4 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "avconferenced started.", v7, 2u);
    }
    AVConferenceServerStartInternal();
    [+[NSRunLoop mainRunLoop] run];
  }
  else if (v4)
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "avconferenced main() is disabled.", v6, 2u);
  }
  return 0;
}

uint64_t AVConferenceServerStartInternal()
{
  return _AVConferenceServerStartInternal();
}

uint64_t VCFeatureFlagManager_UseAvconferenced()
{
  return _VCFeatureFlagManager_UseAvconferenced();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}