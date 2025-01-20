BOOL start()
{
  void *v0;
  int *v1;
  void (*v2)(const char *);
  int v3;
  char v5[1024];

  if (dword_100008010 <= 50 && (dword_100008010 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  bzero(v5, 0x400uLL);
  _set_user_dir_suffix();
  if (confstr(65537, v5, 0x400uLL))
  {
    if (dword_100008010 <= 50 && (dword_100008010 != -1 || _LogCategory_Initialize()))
    {
      getprogname();
LABEL_12:
      LogPrintF();
    }
  }
  else if (dword_100008010 <= 90 && (dword_100008010 != -1 || _LogCategory_Initialize()))
  {
    getprogname();
    v1 = __error();
    strerror(*v1);
    goto LABEL_12;
  }
  FigCommonMediaProcessInitialization();
  FigServer_SetAllowProcName();
  LogSetAppID();
  if (IsAppleInternalBuild())
  {
    LogControl();
  }
  else
  {
    LogControl();
    v2 = (void (*)(const char *))dlsym((void *)0xFFFFFFFFFFFFFFFFLL, "MediaControlSenderLogControl");
    if (v2) {
      v2("?.*:output2=");
    }
  }
  LogControl();
  v3 = AirPlayXPCServicesStart();
  if (v3)
  {
    APSLogErrorAt();
    APSLogErrorAt();
    if (dword_100008010 <= 90 && (dword_100008010 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    [+[NSRunLoop currentRunLoop] run];
  }
  return v3 != 0;
}

uint64_t APSLogErrorAt()
{
  return _APSLogErrorAt();
}

uint64_t AirPlayXPCServicesStart()
{
  return _AirPlayXPCServicesStart();
}

uint64_t FigCommonMediaProcessInitialization()
{
  return _FigCommonMediaProcessInitialization();
}

uint64_t FigServer_SetAllowProcName()
{
  return _FigServer_SetAllowProcName();
}

uint64_t IsAppleInternalBuild()
{
  return _IsAppleInternalBuild();
}

uint64_t LogControl()
{
  return _LogControl();
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

uint64_t LogSetAppID()
{
  return _LogSetAppID();
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

int *__error(void)
{
  return ___error();
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

const char *getprogname(void)
{
  return _getprogname();
}

{
}

{
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