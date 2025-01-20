void sub_100002118(id a1)
{
  uint64_t vars8;

  qword_1000082B0 = objc_alloc_init(PowerUIBrightnessController);

  _objc_release_x1();
}

void *sub_1000022AC(void *result)
{
  uint64_t v1 = result[4];
  if (*(unsigned char *)(v1 + 8))
  {
    v2 = result;
    [*(id *)(v1 + 32) setProperty:&off_100004410 forKey:@"EcoModeFactorUpdate"];
    result = [*(id *)(v2[4] + 32) setProperty:&__kCFBooleanFalse forKey:@"EcoMode"];
    uint64_t v1 = v2[4];
  }
  *(unsigned char *)(v1 + 8) = 0;
  return result;
}

void sub_100002388(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) copyPropertyForKey:@"DisplayBrightness"];
  v3 = [v2 objectForKeyedSubscript:@"Brightness"];

  uint64_t v4 = *(void *)(a1 + 32);
  if (!v3)
  {
    v9 = [(id)v4 log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100002D5C(v9);
    }
    goto LABEL_18;
  }
  if (!*(unsigned char *)(v4 + 8))
  {
    *(unsigned char *)(v4 + 8) = 1;
    uint64_t v4 = *(void *)(a1 + 32);
  }
  unsigned int v5 = [*(id *)(v4 + 32) setProperty:&off_100004420 forKey:@"EcoModeFactorUpdate"];
  v6 = [*(id *)(a1 + 32) log];
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (!v7) {
      goto LABEL_12;
    }
    int v13 = 138412290;
    v14 = &off_100004420;
    v8 = "Success: Setting brightness reduction factor to %@";
  }
  else
  {
    if (!v7) {
      goto LABEL_12;
    }
    int v13 = 138412290;
    v14 = &off_100004420;
    v8 = "Failed: Setting brightness reduction factor to %@";
  }
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v13, 0xCu);
LABEL_12:

  unsigned int v10 = [*(id *)(*(void *)(a1 + 32) + 32) setProperty:&__kCFBooleanTrue forKey:@"EcoMode"];
  v9 = [*(id *)(a1 + 32) log];
  BOOL v11 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v11)
    {
      int v13 = 138412290;
      v14 = (_UNKNOWN **)&__kCFBooleanTrue;
      v12 = "Success: Setting EcodMode to %@";
LABEL_17:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);
    }
  }
  else if (v11)
  {
    int v13 = 138412290;
    v14 = (_UNKNOWN **)&__kCFBooleanTrue;
    v12 = "Failed: Setting EcodMode to %@";
    goto LABEL_17;
  }
LABEL_18:
}

void start()
{
  mach_service = xpc_connection_create_mach_service("com.apple.thermalMonitor.displayMitigationsEnabledNote", 0, 1uLL);
  uint64_t v1 = +[PowerUIChargeAwarenessNotifier sharedInstance];
  id v2 = (void *)qword_1000082D8;
  qword_1000082D8 = v1;

  os_log_t v4 = os_log_create("com.apple.PowerUIAgent", "main");
  unsigned int v5 = +[PowerUISmartChargeUtilities isiPhone];
  v6 = dispatch_get_global_queue(2, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000029C0;
  handler[3] = &unk_100004270;
  char v32 = v5;
  BOOL v7 = v4;
  v31 = v7;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v6, handler);

  if ((+[PowerUISmartChargeUtilities isOBCSupported] & 1) != 0|| MGGetBoolAnswer())
  {
    uint64_t v8 = +[PowerUISmartChargeManager manager];
    v9 = (void *)qword_1000082E0;
    qword_1000082E0 = v8;
  }
  else if (+[PowerUISmartChargeUtilities isInternalBuild])
  {
    v22 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"allowMCLOverride" inDomain:@"com.apple.smartcharging.topoffprotection"];
    v9 = v22;
    if (v22 && ([v22 BOOLValue] & 1) != 0)
    {
      v23 = &qword_1000082E0;
      v24 = (id *)PowerUISmartChargeManager_ptr;
    }
    else
    {
      v23 = &qword_1000082F8;
      v24 = (id *)PowerUISmartChargeManagerUnsupported_ptr;
    }
    uint64_t v26 = [*v24 manager];
    v27 = (void *)*v23;
    uint64_t *v23 = v26;
  }
  else
  {
    uint64_t v25 = +[PowerUISmartChargeManagerUnsupported manager];
    v9 = (void *)qword_100008300;
    qword_100008300 = v25;
  }

  xpc_set_event_stream_handler("com.apple.alarm", 0, &stru_1000042B0);
  uint64_t v10 = +[PowerUICECManager manager];
  BOOL v11 = (void *)qword_1000082E8;
  qword_1000082E8 = v10;

  v12 = dispatch_get_global_queue(0, 0);
  xpc_set_idle_handler();

  if (v5)
  {
    uint64_t v13 = +[PowerUIUPOManager sharedInstance];
    v14 = (void *)qword_1000082D0;
    qword_1000082D0 = v13;

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100002B54;
    v28[3] = &unk_1000042F8;
    v29 = v7;
    xpc_connection_set_event_handler(mach_service, v28);
    xpc_connection_activate(mach_service);
    uint64_t v15 = +[PowerUILPMNotifier sharedInstance];
    v16 = (void *)qword_1000082C0;
    qword_1000082C0 = v15;

    uint64_t v17 = +[PowerUIDrainAnalyzer sharedInstance];
    v18 = (void *)qword_1000082C8;
    qword_1000082C8 = v17;

    if (_os_feature_enabled_impl())
    {
      if (+[PowerUISmartChargeUtilities isInternalBuild])
      {
        v19 = +[PowerUIDrainMonitor sharedInstance];
        [v19 start];
      }
    }
  }
  id v20 = objc_alloc_init((Class)PowerUIAudioAccessorySmartChargeManager);
  v21 = (void *)qword_1000082F0;
  qword_1000082F0 = (uint64_t)v20;

  CFRunLoopRun();
  exit(1);
}

void sub_1000029C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = v3;
  if (*(unsigned char *)(a1 + 40))
  {
    string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
    v6 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      uint64_t v8 = string;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received notification: %s", (uint8_t *)&v7, 0xCu);
    }
    if (!strcmp(string, "com.apple.system.lowpowermode.auto_disabled"))
    {
      [(id)qword_1000082C0 displayAutoDisabledNotification];
    }
    else if (!strcmp(string, "com.apple.system.lowpowermode.first_time"))
    {
      [(id)qword_1000082C0 displayFirstUseNotification];
    }
    else if (!strcmp(string, "com.apple.system.lowpowermode"))
    {
      [(id)qword_1000082C0 removeAutoDisabledNotification];
    }
    else if (!strcmp(string, "com.apple.thermalmonitor.ageAwareMitigationsEnabled"))
    {
      [(id)qword_1000082D0 displayMitigationsEnabledNotification];
    }
    else if (!strcmp(string, "com.apple.powerlog.batteryServiceNotification"))
    {
      [(id)qword_1000082D0 displayBatteryServiceNotification];
    }
  }
}

void sub_100002B40(id a1, OS_xpc_object *a2)
{
}

void sub_100002B54(uint64_t a1, void *a2)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100002BF4;
  handler[3] = &unk_1000042F8;
  id v5 = *(id *)(a1 + 32);
  id v3 = a2;
  xpc_connection_set_event_handler(v3, handler);
  xpc_connection_activate(v3);
}

void sub_100002BF4(uint64_t a1, void *a2)
{
  id v3 = a2;
  os_log_t v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received message on thermal monitor connection", buf, 2u);
  }
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_dictionary_get_BOOL(v3, "postNotification"))
    {
      int v7 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Going to post a notification", v10, 2u);
      }
      [(id)qword_1000082D0 requestBulletin];
      xpc_object_t reply = xpc_dictionary_create_reply(v3);
      xpc_dictionary_get_remote_connection(v3);
      v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      xpc_connection_send_message(v9, reply);
    }
  }
  else
  {
    v6 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Invalid message type!", v11, 2u);
    }
  }
}

void sub_100002D5C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Brightness string is null", v1, 2u);
}

void CFRunLoopRun(void)
{
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
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

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_set_idle_handler()
{
  return _xpc_set_idle_handler();
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_displayAutoDisabledNotification(void *a1, const char *a2, ...)
{
  return [a1 displayAutoDisabledNotification];
}

id objc_msgSend_displayBatteryServiceNotification(void *a1, const char *a2, ...)
{
  return [a1 displayBatteryServiceNotification];
}

id objc_msgSend_displayFirstUseNotification(void *a1, const char *a2, ...)
{
  return [a1 displayFirstUseNotification];
}

id objc_msgSend_displayMitigationsEnabledNotification(void *a1, const char *a2, ...)
{
  return [a1 displayMitigationsEnabledNotification];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isOBCSupported(void *a1, const char *a2, ...)
{
  return [a1 isOBCSupported];
}

id objc_msgSend_isiPhone(void *a1, const char *a2, ...)
{
  return [a1 isiPhone];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_removeAutoDisabledNotification(void *a1, const char *a2, ...)
{
  return [a1 removeAutoDisabledNotification];
}

id objc_msgSend_requestBulletin(void *a1, const char *a2, ...)
{
  return [a1 requestBulletin];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}