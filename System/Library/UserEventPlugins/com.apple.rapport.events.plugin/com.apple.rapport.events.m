void RPUserEventPluginInit()
{
  if (dword_4170 <= 30 && (dword_4170 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  xpc_event_module_get_queue();
}

void sub_3A44(id a1, int a2)
{
  if (dword_4170 <= 30 && (dword_4170 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }

  sub_3AB8();
}

void sub_3AB8()
{
  CFPropertyListRef v0 = CFPreferencesCopyValue(@"clServerEnabled", @"com.apple.rapport", @"mobile", kCFPreferencesCurrentHost);
  uint64_t v1 = CFGetInt64();
  if (v0) {
    CFRelease(v0);
  }
  if (v1) {
    goto LABEL_7;
  }
  CFPropertyListRef v2 = CFPreferencesCopyValue(@"clClientEnabled", @"com.apple.rapport", @"mobile", kCFPreferencesCurrentHost);
  uint64_t v3 = CFGetInt64();
  if (v2) {
    CFRelease(v2);
  }
  if (v3)
  {
LABEL_7:
    if (!qword_41F0)
    {
      if (dword_4170 <= 30 && (dword_4170 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v4 = objc_alloc_init((Class)RPClient);
      v5 = (void *)qword_41F0;
      qword_41F0 = (uint64_t)v4;

      [(id)qword_41F0 setDispatchQueue:qword_41E8];
      [(id)qword_41F0 activateAssertionWithIdentifier:@"com.apple.rapport.KeepAlive"];
    }
  }
  else if (qword_41F0)
  {
    if (dword_4170 <= 30 && (dword_4170 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(id)qword_41F0 invalidate];
    v6 = (void *)qword_41F0;
    qword_41F0 = 0;
  }
}

uint64_t CFGetInt64()
{
  return _CFGetInt64();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t GestaltGetDeviceClass()
{
  return _GestaltGetDeviceClass();
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void xpc_event_module_get_queue()
{
  while (1)
    ;
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}