void sub_376C(uint64_t a1, uint64_t a2, int a3, int a4)
{
  const char *v5;
  const char *v6;
  const char *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  __int16 v20;

  v20 = 0;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  DWORD1(v16) = -1;
  switch(a3)
  {
    case -469774324:
      v7 = (const char *)kMobileKeyBagPasscodeThresholdNotifyToken;
      notify_post(kMobileKeyBagPasscodeThresholdNotifyToken);
      aks_get_extended_device_state();
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      v8 = 136315906;
      v9 = "aksNotificationCallback";
      v10 = 2080;
      v11 = v7;
      v12 = 1024;
      v13 = a4;
      v14 = 1024;
      v15 = DWORD1(v16);
      v6 = " LockStateNotifier %s posting notification: %s (handle: %d, lock state: %d)\n";
      goto LABEL_10;
    case -469774321:
      notify_post("com.apple.mobile.keybagd.first_unlock");
      aks_get_extended_device_state();
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      v8 = 136315906;
      v9 = "aksNotificationCallback";
      v10 = 2080;
      v11 = "com.apple.mobile.keybagd.first_unlock";
      v12 = 1024;
      v13 = a4;
      v14 = 1024;
      v15 = DWORD1(v16);
      v6 = "MKBPLUGINSTART: LockStateNotifier %s posting notification: %s (handle: %d, lock state: %d)\n";
      goto LABEL_10;
    case -469774323:
      v5 = (const char *)kMobileKeyBagLockStatusNotifyToken;
      notify_post(kMobileKeyBagLockStatusNotifyToken);
      aks_get_extended_device_state();
      if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      v8 = 136315906;
      v9 = "aksNotificationCallback";
      v10 = 2080;
      v11 = v5;
      v12 = 1024;
      v13 = a4;
      v14 = 1024;
      v15 = DWORD1(v16);
      v6 = " LockStateNotifier %s posted notification: %s (handle: %d, lock state: %d)\n";
LABEL_10:
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0x22u);
      return;
  }
  aks_get_extended_device_state();
}

void start(NSObject *a1)
{
  kern_return_t v6;
  BOOL v7;
  const char *v8;
  io_object_t notification;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  uint64_t v13;

  notification = 0;
  CFDictionaryRef v2 = IOServiceMatching("AppleKeyStore");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v2);
  if (MatchingService)
  {
    io_service_t v4 = MatchingService;
    v5 = IONotificationPortCreate(kIOMainPortDefault);
    qword_40C0 = (uint64_t)v5;
    if (v5)
    {
      IONotificationPortSetDispatchQueue(v5, a1);
      v6 = IOServiceAddInterestNotification((IONotificationPortRef)qword_40C0, v4, "IOGeneralInterest", (IOServiceInterestCallback)sub_376C, 0, &notification);
      if (!v6)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MKBPLUGINSTART: LockStateNotifier Started", buf, 2u);
        }
        if (MKBDeviceUnlockedSinceBoot() == 1)
        {
          v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT);
          v8 = (const char *)kMobileKeyBagLockStatusNotifyToken;
          if (v7)
          {
            *(_DWORD *)buf = 136315394;
            v11 = "start";
            v12 = 2080;
            v13 = kMobileKeyBagLockStatusNotifyToken;
            _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "MKBPLUGINSTART: LockStateNotifier %s posting notification: %s\n", buf, 0x16u);
          }
          notify_post(v8);
        }
        return;
      }
      printf("Can't register for notification: %08x\n", v6);
      if (notification) {
        IOObjectRelease(notification);
      }
    }
    else
    {
      puts("Can't create notification port");
    }
  }
  else
  {
    printf("Can't find %s service\n", "AppleKeyStore");
  }
  if (qword_40C0) {
    IONotificationPortDestroy((IONotificationPortRef)qword_40C0);
  }
}

void init_mkb_watchstate()
{
  v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INTERACTIVE, 0);
  xpc_event_module_get_queue();
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t aks_get_extended_device_state()
{
  return _aks_get_extended_device_state();
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return _dispatch_queue_create_with_target_V2(label, attr, target);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int puts(const char *a1)
{
  return _puts(a1);
}

void xpc_event_module_get_queue()
{
  while (1)
    ;
}