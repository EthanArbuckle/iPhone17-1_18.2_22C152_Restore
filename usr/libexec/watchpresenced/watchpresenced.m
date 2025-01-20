void sub_100004AC4(id a1)
{
  uint64_t vars8;

  qword_100016EB0 = objc_alloc_init(DPCDefaults);

  _objc_release_x1();
}

void sub_100005430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000544C(uint64_t a1)
{
  v2 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Fired Absence event", v9, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = [WeakRetained detectedNewEventBlock];
  v4[2](v4, 2);

  v5 = +[NSDate date];
  [v5 timeIntervalSince1970];
  double v7 = v6;
  v8 = [*(id *)(a1 + 32) stateMachine];
  [v8 setLastAbsenceEventTimestamp:v7];
}

void sub_1000064A0(id a1)
{
  qword_100016EC0 = objc_alloc_init(DPCTelemetry);

  _objc_release_x1();
}

id sub_100006A24(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006AC4;
  block[3] = &unk_100010560;
  block[4] = a1;
  if (qword_100016ED0 != -1) {
    dispatch_once(&qword_100016ED0, block);
  }
  v1 = (void *)qword_100016EC8;

  return v1;
}

uint64_t sub_100006AC4(uint64_t a1)
{
  qword_100016EC8 = (uint64_t)os_log_create("com.apple.devicepresence", *(const char **)(a1 + 32));

  return _objc_release_x1();
}

void sub_100006B58(id a1)
{
  qword_100016EE0 = objc_alloc_init(DPCDaemon);

  _objc_release_x1();
}

void sub_100007554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_1000075A4(uint64_t a1)
{
  v2 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v6 = 138412290;
    id v7 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "connection %@ invalid", (uint8_t *)&v6, 0xCu);
  }
  v4 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
  {
    [v4[6] lock];
    [v4[7] removeObject:v5];
    [v4[6] unlock];
    if ([v4 checkIfShouldShutdown]) {
      [v4 shutdownTheDetection];
    }
  }
}

void sub_1000076C0(uint64_t a1)
{
  v2 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    int v6 = 138412290;
    id v7 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "connection %@ interrupted", (uint8_t *)&v6, 0xCu);
  }
  v4 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = objc_loadWeakRetained((id *)(a1 + 32));
  if (v4)
  {
    [v4[6] lock];
    [v4[7] removeObject:v5];
    [v4[6] unlock];
    if ([v4 checkIfShouldShutdown]) {
      [v4 shutdownTheDetection];
    }
  }
}

void sub_100007934(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007A54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100007B48(uint64_t a1)
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007CE4;
  v7[3] = &unk_1000105D0;
  v2 = (id *)(a1 + 40);
  objc_copyWeak(&v8, (id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 8) setDetectedNewEventBlock:v7];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007D40;
  v5[3] = &unk_1000105D0;
  objc_copyWeak(&v6, v2);
  [*(id *)(*(void *)(a1 + 32) + 8) setDetectedNewErrorBlock:v5];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007E50;
  v3[3] = &unk_1000105D0;
  objc_copyWeak(&v4, v2);
  [*(id *)(*(void *)(a1 + 32) + 8) setDetectedNewWatchStatusEventBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
}

void sub_100007CB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100007CE4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WeakRetained[8] = a2;
  LODWORD(v3) = 1065185444;
  [WeakRetained notifyNewEvents:a2 probability:v3];
}

void sub_100007D40(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = WeakRetained[7];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [WeakRetained notifyConnection:a2 withError:v9];
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void sub_100007E50(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifyNewWatchStatusEvents:a2];
}

void sub_100008114()
{
  v0 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "capture sigterm, going to release daemon object...", buf, 2u);
  }

  v1 = (void *)qword_100016EF0;
  qword_100016EF0 = 0;

  v2 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "daemon object set to nil...", v3, 2u);
  }
}

uint64_t start()
{
  if (!qword_100016EF0)
  {
    uint64_t v1 = +[DPCDaemon sharedInstance];
    v2 = (void *)qword_100016EF0;
    qword_100016EF0 = v1;
  }
  signal(15, (void (__cdecl *)(int))sub_100008114);
  double v3 = +[NSRunLoop currentRunLoop];
  [v3 run];

  return 0;
}

void sub_10000826C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000084C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateActiveNRDevice];
}

void sub_100008B60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008D58(uint64_t a1)
{
  [*(id *)(a1 + 32) resetBT];
  [*(id *)(a1 + 32) _stopWristMonitoring];
  id v2 = [*(id *)(a1 + 32) stateMachine];
  [v2 reset];
}

void sub_1000090C8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_1000090E4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained detectWatchWristStateEvent:a2];
}

void sub_100009204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009228(uint64_t a1)
{
  uint64_t v2 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received switch watch notification...", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateActiveNRDevice];
}

void sub_1000093FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000A0EC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  unsigned __int8 v3 = [v2 isInRSSIStreamingMode];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) stateMachine];
    unsigned int v5 = [v4 isInRSSIMode];

    if (v5)
    {
      [*(id *)(a1 + 32) disableRSSIStatisticsDetection];
      id v6 = *(void **)(a1 + 32);
      uint64_t v8 = v6[1];
      uint64_t v7 = v6[2];
      id v12 = +[DPCDefaults sharedInstance];
      long long v9 = [v12 NSNumberForDefault:@"DPCDefaultsThresholdD1"];
      long long v10 = +[DPCDefaults sharedInstance];
      long long v11 = [v10 NSNumberForDefault:@"DPCDefaultsThresholdDMAX"];
      [v6 changeRSSIStatisticsDetection:v7 manager:v8 closer:v9 further:v11 maskDecision:1];
    }
  }
}

void sub_10000A290(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  unsigned __int8 v3 = [v2 isInRSSIStreamingMode];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) stateMachine];
    unsigned int v5 = [v4 isInRSSIMode];

    if (v5)
    {
      [*(id *)(a1 + 32) disableRSSIStatisticsDetection];
      id v6 = +[DPCDefaults sharedInstance];
      uint64_t v7 = [v6 NSNumberForDefault:@"DPCDefaultsThresholdD2"];
      unsigned int v8 = [v7 intValue];
      long long v9 = [*(id *)(a1 + 32) stateMachine];
      unsigned int v10 = v8 - [v9 D2ThresholdMargin];

      long long v11 = +[DPCDefaults sharedInstance];
      id v12 = [v11 NSNumberForDefault:@"DPCDefaultsSessionBasedAdaptiveRSSICapValue"];
      unsigned int v13 = [v12 intValue];

      if ((int)v10 <= (int)v13) {
        uint64_t v14 = v13;
      }
      else {
        uint64_t v14 = v10;
      }
      v15 = *(void **)(a1 + 32);
      uint64_t v17 = v15[1];
      uint64_t v16 = v15[2];
      id v20 = +[DPCDefaults sharedInstance];
      v18 = [v20 NSNumberForDefault:@"DPCDefaultsThresholdDMIN"];
      v19 = +[NSNumber numberWithInt:v14];
      [v15 changeRSSIStatisticsDetection:v16 manager:v17 closer:v18 further:v19 maskDecision:0];
    }
  }
}

void sub_10000A4C0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stateMachine];
  unsigned __int8 v3 = [v2 isInRSSIStreamingMode];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) stateMachine];
    unsigned int v5 = [v4 isInRSSIMode];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) stateMachine];
      [v6 setIsInDiscoveryMode:1];

      [*(id *)(a1 + 32) disableRSSIStatisticsDetection];
      uint64_t v7 = *(void *)(a1 + 32);
      if (*(void *)(v7 + 16))
      {
        if (*(void *)(v7 + 8))
        {
          unsigned int v8 = +[DPCDefaults sharedInstance];

          if (v8)
          {
            long long v9 = *(void **)(a1 + 32);
            uint64_t v11 = v9[1];
            uint64_t v10 = v9[2];
            id v15 = +[DPCDefaults sharedInstance];
            id v12 = [v15 NSNumberForDefault:@"DPCDefaultsThresholdDMIN"];
            unsigned int v13 = +[DPCDefaults sharedInstance];
            uint64_t v14 = [v13 NSNumberForDefault:@"DPCDefaultsThresholdDDiscovery"];
            [v9 changeRSSIStatisticsDetection:v10 manager:v11 closer:v12 further:v14 maskDecision:1];
          }
        }
      }
    }
  }
}

void sub_10000A7F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v3 = sub_100006A24((uint64_t)off_100016CB8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "deviceIsConnectedBluetooth isBluetoothConnected: %d", (uint8_t *)v5, 8u);
  }

  [WeakRetained watchConnectivityChanges];
}

void sub_10000B004(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Received BT disconnected during the start, going to ignore", v1, 2u);
}

void sub_10000B048(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "NRDevice vanished...", v1, 2u);
}

void sub_10000B08C(os_log_t log)
{
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "macAddress not available yet: %@", (uint8_t *)&v1, 0xCu);
}

void sub_10000B108(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "CBManager unable to retrieve peripheral at MAC: %@, the bluetooth might not be ready", (uint8_t *)&v2, 0xCu);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t createStringFromNRLinkType()
{
  return _createStringFromNRLinkType();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

id objc_msgSend_D2ThresholdMargin(void *a1, const char *a2, ...)
{
  return [a1 D2ThresholdMargin];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__registerSwitchWatchNotification(void *a1, const char *a2, ...)
{
  return [a1 _registerSwitchWatchNotification];
}

id objc_msgSend__setupOnWristMonitoring(void *a1, const char *a2, ...)
{
  return [a1 _setupOnWristMonitoring];
}

id objc_msgSend__setupXPCListener(void *a1, const char *a2, ...)
{
  return [a1 _setupXPCListener];
}

id objc_msgSend__stopWristMonitoring(void *a1, const char *a2, ...)
{
  return [a1 _stopWristMonitoring];
}

id objc_msgSend__updateActiveNRDevice(void *a1, const char *a2, ...)
{
  return [a1 _updateActiveNRDevice];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_checkAndStartRSSIDetection(void *a1, const char *a2, ...)
{
  return [a1 checkAndStartRSSIDetection];
}

id objc_msgSend_checkIfBluetoothPowerOff(void *a1, const char *a2, ...)
{
  return [a1 checkIfBluetoothPowerOff];
}

id objc_msgSend_checkIfShouldShutdown(void *a1, const char *a2, ...)
{
  return [a1 checkIfShouldShutdown];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_connectToWatch(void *a1, const char *a2, ...)
{
  return [a1 connectToWatch];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentWatchWristState(void *a1, const char *a2, ...)
{
  return [a1 currentWatchWristState];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_detectedNewErrorBlock(void *a1, const char *a2, ...)
{
  return [a1 detectedNewErrorBlock];
}

id objc_msgSend_detectedNewEventBlock(void *a1, const char *a2, ...)
{
  return [a1 detectedNewEventBlock];
}

id objc_msgSend_detectedNewWatchStatusEventBlock(void *a1, const char *a2, ...)
{
  return [a1 detectedNewWatchStatusEventBlock];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableRSSIStatisticsDetection(void *a1, const char *a2, ...)
{
  return [a1 disableRSSIStatisticsDetection];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_getCurrentWatchMACAddress(void *a1, const char *a2, ...)
{
  return [a1 getCurrentWatchMACAddress];
}

id objc_msgSend_hasBeenConnected(void *a1, const char *a2, ...)
{
  return [a1 hasBeenConnected];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidateAbsenceEvent(void *a1, const char *a2, ...)
{
  return [a1 invalidateAbsenceEvent];
}

id objc_msgSend_isCloudConnected(void *a1, const char *a2, ...)
{
  return [a1 isCloudConnected];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isInDiscoveryMode(void *a1, const char *a2, ...)
{
  return [a1 isInDiscoveryMode];
}

id objc_msgSend_isInRSSIMode(void *a1, const char *a2, ...)
{
  return [a1 isInRSSIMode];
}

id objc_msgSend_isInRSSIStreamingMode(void *a1, const char *a2, ...)
{
  return [a1 isInRSSIStreamingMode];
}

id objc_msgSend_isMonitoringAbsence(void *a1, const char *a2, ...)
{
  return [a1 isMonitoringAbsence];
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return [a1 isNearby];
}

id objc_msgSend_isRSSIModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isRSSIModeEnabled];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isRunningRSSIStatDetecion(void *a1, const char *a2, ...)
{
  return [a1 isRunningRSSIStatDetecion];
}

id objc_msgSend_isSwitchingWatch(void *a1, const char *a2, ...)
{
  return [a1 isSwitchingWatch];
}

id objc_msgSend_lastAbsenceEventTimestamp(void *a1, const char *a2, ...)
{
  return [a1 lastAbsenceEventTimestamp];
}

id objc_msgSend_lastPresenceEventTimestamp(void *a1, const char *a2, ...)
{
  return [a1 lastPresenceEventTimestamp];
}

id objc_msgSend_linkType(void *a1, const char *a2, ...)
{
  return [a1 linkType];
}

id objc_msgSend_loadPolicy(void *a1, const char *a2, ...)
{
  return [a1 loadPolicy];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_monitorRSSIAbsence(void *a1, const char *a2, ...)
{
  return [a1 monitorRSSIAbsence];
}

id objc_msgSend_monitorRSSIPresence(void *a1, const char *a2, ...)
{
  return [a1 monitorRSSIPresence];
}

id objc_msgSend_prestartCheck(void *a1, const char *a2, ...)
{
  return [a1 prestartCheck];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_registerWatchSwitch(void *a1, const char *a2, ...)
{
  return [a1 registerWatchSwitch];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_requireRSSI(void *a1, const char *a2, ...)
{
  return [a1 requireRSSI];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetAll(void *a1, const char *a2, ...)
{
  return [a1 resetAll];
}

id objc_msgSend_resetBT(void *a1, const char *a2, ...)
{
  return [a1 resetBT];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scheduleSendAbsenceEvent(void *a1, const char *a2, ...)
{
  return [a1 scheduleSendAbsenceEvent];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shutdownTheDetection(void *a1, const char *a2, ...)
{
  return [a1 shutdownTheDetection];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startTheDetection(void *a1, const char *a2, ...)
{
  return [a1 startTheDetection];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateMachine(void *a1, const char *a2, ...)
{
  return [a1 stateMachine];
}

id objc_msgSend_telemetry(void *a1, const char *a2, ...)
{
  return [a1 telemetry];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_watchConnectivityChanges(void *a1, const char *a2, ...)
{
  return [a1 watchConnectivityChanges];
}