uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  sqlite3_config(13, 96, 64);
  _ATXInitializeInOwnerProcess();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100004160);
  v1 = +[ATXDistributedNotificationHandler sharedInstance];
  [v1 registerXPCHandler];

  +[ATXAssets2 onUpdateRestartThisProcess];
  do
  {
    v3 = +[NSRunLoop currentRunLoop];
    v4 = +[NSDate distantFuture];
    v5 = [v3 runMode:NSDefaultRunLoopMode beforeDate:v4];
  }
  while ((v5 & 1) != 0);
  return 0;
}

void sub_100003354(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v3 = (void *)os_transaction_create();
    string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
    v6 = +[NSString stringWithUTF8String:string];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Received notifyd notification: %@", buf, 0xCu);
    }
    if (([v6 isEqualToString:@"com.apple.coreduetd.knowledgebase.launch.duetexpertd"] & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", @"com.apple.Preferences.ResetPrivacyWarningsNotification") & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", @"com.apple.spotlightui.prefschanged") & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", @"com.apple.duetexpertd.prefschanged") & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", @"dmf.policy.monitor.app") & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", @"com.apple.siri.cloud.storage.deleted") & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", @"com.apple.siri.cloud.synch.changed") & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", @"com.apple.duetexpertd.clientModelRefreshBlendingLayer") & 1) != 0|| (objc_msgSend(v6, "isEqualToString:", @"com.apple.managedconfiguration.restrictionchanged") & 1) != 0|| (objc_msgSend(v6,
                          "isEqualToString:",
                          @"com.apple.managedconfiguration.managedorginfochanged") & 1) != 0
      || ([v6 isEqualToString:@"com.apple.duetexpertd.updateDefaultsDueToRelevantHomeScreenConfigUpdate"] & 1) != 0|| objc_msgSend(v6, "isEqualToString:", @"com.apple.ManagedConfiguration.managedAppsChanged"))
    {
      v7 = +[NSNotificationCenter defaultCenter];
      v8 = +[NSString stringWithUTF8String:string];
      [v7 postNotificationName:v8 object:0];

      NSLog(@"--- handled event %s ---", string);
    }
    else if ([v6 isEqualToString:@"com.apple.duet.expertcenter.appRefresh"])
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Forced app predictions refresh notification", buf, 2u);
      }
      ATXUpdatePredictionsImmediately();
    }
    else if ([v6 isEqualToString:@"com.apple.duetexpertd.feedbackavailable"])
    {
      +[_PASDeviceState runBlockWhenDeviceIsClassCUnlockedWithQoS:17 block:&stru_1000041A0];
    }
    else if ([v6 isEqualToString:@"_CalDatabaseChangedNotification"])
    {
      v10 = +[NSNotificationCenter defaultCenter];
      [v10 postNotificationName:EKEventStoreChangedNotification object:0];
    }
    id v9 = self;
  }
}

void sub_1000036A8(id a1)
{
}

uint64_t ATXUpdatePredictionsImmediately()
{
  return _ATXUpdatePredictionsImmediately();
}

void NSLog(NSString *format, ...)
{
}

uint64_t _ATXInitializeInOwnerProcess()
{
  return __ATXInitializeInOwnerProcess();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

uint64_t self
{
  return _self;
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

int sqlite3_config(int a1, ...)
{
  return _sqlite3_config(a1);
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

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_onUpdateRestartThisProcess(void *a1, const char *a2, ...)
{
  return [a1 onUpdateRestartThisProcess];
}

id objc_msgSend_registerXPCHandler(void *a1, const char *a2, ...)
{
  return [a1 registerXPCHandler];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}