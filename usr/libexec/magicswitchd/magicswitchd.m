__CFString *sub_100003A04(unint64_t a1)
{
  __CFString *v1;
  uint64_t vars8;

  if (a1 >= 6)
  {
    v1 = +[NSString stringWithFormat:@"Missing string for CBManagerState: (%ld)", a1];
  }
  else
  {
    v1 = off_100018498[a1];
  }

  return v1;
}

void sub_100005108(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000512C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained highDutyCycleTimerFired];
}

void sub_100005A8C(uint64_t a1)
{
  v2 = objc_alloc_init(InitialSyncCompletionMonitor);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  [*(id *)(a1 + 32) registerNanoRegistryObservers];
  [*(id *)(a1 + 32) updateState];
  signal(15, (void (__cdecl *)(int))1);
  v5 = +[MagicSwitchEnabler sharedInstance];
  v6 = [v5 workQueue];
  dispatch_source_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v6);
  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  dispatch_source_set_event_handler(*(dispatch_source_t *)(*(void *)(a1 + 32) + 40), &stru_100018510);
  v10 = *(NSObject **)(*(void *)(a1 + 32) + 40);

  dispatch_activate(v10);
}

void sub_100005B78(id a1)
{
  v1 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Got SIGTERM; Exiting when clean.",
      v2,
      2u);
  }
  [(id)objc_opt_class() deleteMagicSwitchPathFile];
  xpc_transaction_exit_clean();
}

id sub_100005F0C(uint64_t a1)
{
  v2 = (void *)qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    v4 = v2;
    v5 = [v3 name];
    v6 = [*(id *)(a1 + 40) valueForProperty:NRDevicePropertyPairingID];
    int v8 = 138412546;
    v9 = v5;
    __int16 v10 = 2112;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Received notification (%@) for device: (%@)", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 48) updateState];
}

void sub_100006A6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006AA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = +[MagicSwitchEnabler sharedInstance];
    v6 = [v5 workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006BA0;
    block[3] = &unk_100018560;
    block[4] = WeakRetained;
    id v8 = *(id *)(a1 + 32);
    id v9 = v3;
    dispatch_async(v6, block);
  }
}

id sub_100006BA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) activePairedDeviceSwitchForDevice:*(void *)(a1 + 40) completedWithError:*(void *)(a1 + 48)];
}

id sub_100006D88(uint64_t a1)
{
  v2 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Received active device assertion state did change callback", v4, 2u);
  }
  return [*(id *)(a1 + 32) updateState];
}

void sub_100007704(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007728(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained activeWatchAssertionTimerFired];
}

void sub_1000081B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000081D8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_source_t v7 = +[MagicSwitchEnabler sharedInstance];
    id v8 = [v7 workQueue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000082D8;
    v9[3] = &unk_1000185B0;
    v9[4] = WeakRetained;
    id v10 = *(id *)(a1 + 32);
    char v12 = a2;
    id v11 = v5;
    dispatch_async(v8, v9);
  }
}

id sub_1000082D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleInitialSyncStateForPairingID:*(void *)(a1 + 40) hasCompleted:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

id sub_100008B18(uint64_t a1)
{
  return [*(id *)(a1 + 32) forgetPairingID:*(void *)(a1 + 40)];
}

void sub_100008C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100008C44(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "InitialSyncCompletionMonitor --- Initial sync completed for pairingID: (%@)", (uint8_t *)&v6, 0xCu);
    }
    id v5 = [WeakRetained cachedInitialSyncStateByPairingID];
    [v5 setObject:&__kCFBooleanTrue forKey:*(void *)(a1 + 32)];

    [WeakRetained notifyObserversInitialSyncDidCompleteForPairingID:*(void *)(a1 + 32)];
  }
}

void sub_100008E18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100008E2C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained retryPendingRequests];
}

id sub_100009300(uint64_t a1)
{
  v2 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Dispatch timer fired", v4, 2u);
  }
  return [*(id *)(a1 + 32) evaluateTimers];
}

id sub_100009374(uint64_t a1)
{
  v2 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Received time zone notification: (com.apple.system.timezone)", v4, 2u);
  }
  return [*(id *)(a1 + 32) handleTimeEvent];
}

id sub_1000093E8(uint64_t a1)
{
  v2 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Received clock set notification: (com.apple.system.clock_set)", v4, 2u);
  }
  return [*(id *)(a1 + 32) handleTimeEvent];
}

uint64_t sub_100009500(uint64_t a1)
{
  qword_100021A30 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100009BE4(uint64_t a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v12;
    *(void *)&long long v4 = 134217984;
    long long v10 = v4;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
        id v9 = qword_100021A50;
        if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v10;
          v16 = v8;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "WakingTimerScheduler --- Firing timer (%p)", buf, 0xCu);
        }
        [v8 fireTimer:v10];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v2 countByEnumeratingWithState:&v11 objects:v17 count:16];
    }
    while (v5);
  }

  sub_10000B9F0(*(_DWORD *)(a1 + 40));
}

void sub_10000A778(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fireTimer];
}

uint64_t start()
{
  return sub_10000A8D8(+[MagicSwitchEnabler run]);
}

void sub_10000A8D8()
{
  if (qword_100021A40 != -1) {
    dispatch_once(&qword_100021A40, &stru_1000186B8);
  }
}

void sub_10000A900(id a1)
{
  qword_100021A50 = (uint64_t)os_log_create("com.apple.NanoRegistry", "MagicSwitch");

  _objc_release_x1();
}

uint64_t sub_10000B82C(uint64_t a1)
{
  IOPMAssertionID AssertionID = 0;
  v12[0] = @"AssertName";
  id v2 = +[NSString stringWithUTF8String:a1];
  v13[0] = v2;
  v13[1] = @"com.apple.MagicSwitch";
  v12[1] = @"PlugInBundleID";
  v12[2] = @"AssertType";
  v12[3] = @"AssertLevel";
  v13[2] = @"PreventUserIdleSystemSleep";
  v13[3] = &off_100018BA8;
  CFDictionaryRef v3 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];

  IOReturn v4 = IOPMAssertionCreateWithProperties(v3, &AssertionID);
  id v5 = qword_100021A50;
  if (v4)
  {
    IOReturn v6 = v4;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)long long v11 = a1;
      *(_WORD *)&v11[8] = 1024;
      *(_DWORD *)&v11[10] = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PowerAssertion --- Failed to take power assertion for (%s) with error: (%d)", buf, 0x12u);
    }
    uint64_t v7 = 0;
    IOPMAssertionID AssertionID = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)long long v11 = AssertionID;
      *(_WORD *)&v11[4] = 2080;
      *(void *)&v11[6] = a1;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "PowerAssertion --- Taking power assertion (%u) for (%s)", buf, 0x12u);
    }
    uint64_t v7 = AssertionID;
  }

  return v7;
}

void sub_10000B9F0(IOPMAssertionID a1)
{
  id v2 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEBUG))
  {
    v3[0] = 67109120;
    v3[1] = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "PowerAssertion --- Releasing power assertion: (%u)", (uint8_t *)v3, 8u);
  }
  if (a1) {
    IOPMAssertionRelease(a1);
  }
}

id sub_10000BFB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateState];
}

void sub_10000BFBC(id a1, OS_xpc_object *a2)
{
  id v2 = a2;
  xpc_type_t type = xpc_get_type(v2);
  if (qword_100021A48)
  {
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      string = xpc_dictionary_get_string(v2, "Notification");
      IOReturn v6 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315138;
        id v9 = (void *)string;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Received notification: %s", (uint8_t *)&v8, 0xCu);
      }
      if (string)
      {
        uint64_t v7 = +[MagicSwitchEnabler sharedInstance];
        [v7 handleLaunchEventDarwinNotification:string];
      }
    }
    else
    {
      IOReturn v4 = qword_100021A50;
      if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        id v9 = v2;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MagicSwitchEnabler --- Received unexpected non-dictionary type event: (%@)", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

uint64_t sub_10000D59C(void *a1)
{
  id v1 = a1;
  id v2 = [v1 output];
  CFDataRef v3 = (const __CFData *)CFWriteStreamCopyProperty(v2, kCFStreamPropertySocketNativeHandle);

  if (!v3)
  {
    long long v11 = qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15[0] = v1;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "MessageManager --- Failed to extract socket from pipe: (%@)", buf, 0xCu);
    }
    goto LABEL_11;
  }
  *(_DWORD *)buffer = -1;
  v16.location = 0;
  v16.length = 4;
  CFDataGetBytes(v3, v16, buffer);
  CFRelease(v3);
  IOReturn v4 = qword_100021A50;
  if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    LODWORD(v15[0]) = *(_DWORD *)buffer;
    WORD2(v15[0]) = 2112;
    *(void *)((char *)v15 + 6) = v1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MessageManager --- Extracted socket (%d) from pipe: (%@)", buf, 0x12u);
  }
  int v5 = fcntl(*(int *)buffer, 3, 0);
  if (v5 == -1 || fcntl(*(int *)buffer, 4, v5 | 4u) == -1)
  {
    uint64_t v7 = (void *)qword_100021A50;
    if (os_log_type_enabled((os_log_t)qword_100021A50, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(_DWORD *)buffer;
      id v9 = v7;
      int v10 = *__error();
      *(_DWORD *)buf = 67109376;
      LODWORD(v15[0]) = v8;
      WORD2(v15[0]) = 1024;
      *(_DWORD *)((char *)v15 + 6) = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "MessageManager --- Failed to set socket (%d) as non-blocking: %d", buf, 0xEu);
    }
LABEL_11:
    uint64_t v6 = 0xFFFFFFFFLL;
    goto LABEL_12;
  }
  uint64_t v6 = *(unsigned int *)buffer;
LABEL_12:

  return v6;
}

unsigned char *sub_10000DCFC(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[8]) {
    return [result readIncomingMessages];
  }
  return result;
}

unsigned char *sub_10000DD10(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (!result[8]) {
    return [result writePendingMessages];
  }
  return result;
}

void sub_10000E914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E940(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained significantTimeChangeHandler];
}

void sub_10000EC50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000EC78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained rollingTimerFired];
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return _CFWriteStreamCopyProperty(stream, propertyName);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

IOReturn IOPMAssertionCreateWithProperties(CFDictionaryRef AssertionProperties, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithProperties(AssertionProperties, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

IOReturn IOPMCancelScheduledPowerEvent(CFDateRef time_to_wake, CFStringRef my_id, CFStringRef type)
{
  return _IOPMCancelScheduledPowerEvent(time_to_wake, my_id, type);
}

uint64_t IOPMRequestSysWake()
{
  return _IOPMRequestSysWake();
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
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

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
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

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
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

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_activeWatchAssertionTimerFired(void *a1, const char *a2, ...)
{
  return [a1 activeWatchAssertionTimerFired];
}

id objc_msgSend_activeWatchDidChangeConnectionState(void *a1, const char *a2, ...)
{
  return [a1 activeWatchDidChangeConnectionState];
}

id objc_msgSend_activeWatchWristState(void *a1, const char *a2, ...)
{
  return [a1 activeWatchWristState];
}

id objc_msgSend_advertisingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 advertisingIdentifier];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cachedInitialSyncStateByPairingID(void *a1, const char *a2, ...)
{
  return [a1 cachedInitialSyncStateByPairingID];
}

id objc_msgSend_cancelScheduledWake(void *a1, const char *a2, ...)
{
  return [a1 cancelScheduledWake];
}

id objc_msgSend_clearDispatchTimer(void *a1, const char *a2, ...)
{
  return [a1 clearDispatchTimer];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_companionSeed(void *a1, const char *a2, ...)
{
  return [a1 companionSeed];
}

id objc_msgSend_compatibilityState(void *a1, const char *a2, ...)
{
  return [a1 compatibilityState];
}

id objc_msgSend_computeCurrentTimeSlice(void *a1, const char *a2, ...)
{
  return [a1 computeCurrentTimeSlice];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createMagicSwitchPathFile(void *a1, const char *a2, ...)
{
  return [a1 createMagicSwitchPathFile];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_deadline(void *a1, const char *a2, ...)
{
  return [a1 deadline];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_delay(void *a1, const char *a2, ...)
{
  return [a1 delay];
}

id objc_msgSend_deleteMagicSwitchPathFile(void *a1, const char *a2, ...)
{
  return [a1 deleteMagicSwitchPathFile];
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return [a1 deviceID];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return [a1 disconnect];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_earliestFireTime(void *a1, const char *a2, ...)
{
  return [a1 earliestFireTime];
}

id objc_msgSend_evaluateTimers(void *a1, const char *a2, ...)
{
  return [a1 evaluateTimers];
}

id objc_msgSend_fireTimer(void *a1, const char *a2, ...)
{
  return [a1 fireTimer];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_getSetupCompletedDevices(void *a1, const char *a2, ...)
{
  return [a1 getSetupCompletedDevices];
}

id objc_msgSend_gracePeriod(void *a1, const char *a2, ...)
{
  return [a1 gracePeriod];
}

id objc_msgSend_handleTimeEvent(void *a1, const char *a2, ...)
{
  return [a1 handleTimeEvent];
}

id objc_msgSend_hasActiveAssertion(void *a1, const char *a2, ...)
{
  return [a1 hasActiveAssertion];
}

id objc_msgSend_highDutyCycleTimerFired(void *a1, const char *a2, ...)
{
  return [a1 highDutyCycleTimerFired];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inactiveWatches(void *a1, const char *a2, ...)
{
  return [a1 inactiveWatches];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isConnecting(void *a1, const char *a2, ...)
{
  return [a1 isConnecting];
}

id objc_msgSend_isPoweredOn(void *a1, const char *a2, ...)
{
  return [a1 isPoweredOn];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isScanning(void *a1, const char *a2, ...)
{
  return [a1 isScanning];
}

id objc_msgSend_isSettingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSettingEnabled];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_output(void *a1, const char *a2, ...)
{
  return [a1 output];
}

id objc_msgSend_peer(void *a1, const char *a2, ...)
{
  return [a1 peer];
}

id objc_msgSend_registerEndpoint(void *a1, const char *a2, ...)
{
  return [a1 registerEndpoint];
}

id objc_msgSend_registerNanoRegistryObservers(void *a1, const char *a2, ...)
{
  return [a1 registerNanoRegistryObservers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_retryPendingRequests(void *a1, const char *a2, ...)
{
  return [a1 retryPendingRequests];
}

id objc_msgSend_rollingTimerFired(void *a1, const char *a2, ...)
{
  return [a1 rollingTimerFired];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scheduleHighDutyCycleScanningTimer(void *a1, const char *a2, ...)
{
  return [a1 scheduleHighDutyCycleScanningTimer];
}

id objc_msgSend_scheduleRollingTimer(void *a1, const char *a2, ...)
{
  return [a1 scheduleRollingTimer];
}

id objc_msgSend_scheduleTimer(void *a1, const char *a2, ...)
{
  return [a1 scheduleTimer];
}

id objc_msgSend_setupReadWriteSources(void *a1, const char *a2, ...)
{
  return [a1 setupReadWriteSources];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldRollAdvertisingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 shouldRollAdvertisingIdentifier];
}

id objc_msgSend_significantTimeChangeHandler(void *a1, const char *a2, ...)
{
  return [a1 significantTimeChangeHandler];
}

id objc_msgSend_startTime(void *a1, const char *a2, ...)
{
  return [a1 startTime];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return [a1 stopRunning];
}

id objc_msgSend_stopScanning(void *a1, const char *a2, ...)
{
  return [a1 stopScanning];
}

id objc_msgSend_takeActiveWatchAssertion(void *a1, const char *a2, ...)
{
  return [a1 takeActiveWatchAssertion];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_updateAdvertisingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 updateAdvertisingIdentifier];
}

id objc_msgSend_updateScanningState(void *a1, const char *a2, ...)
{
  return [a1 updateScanningState];
}

id objc_msgSend_updateState(void *a1, const char *a2, ...)
{
  return [a1 updateState];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return [a1 weakObjectsHashTable];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_wiProxScannerChangedState(void *a1, const char *a2, ...)
{
  return [a1 wiProxScannerChangedState];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_wristState(void *a1, const char *a2, ...)
{
  return [a1 wristState];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 options:x1 error:x2];
}