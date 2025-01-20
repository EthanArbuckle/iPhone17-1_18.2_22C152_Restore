void sub_3AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_3ACC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_3ADC(uint64_t a1)
{
}

uint64_t sub_3AE4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v6 = +[NSString stringWithCString:a2 encoding:4];
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSNumber numberWithBool:xpc_BOOL_get_value(v5)];
LABEL_22:
    v15 = v11;
    [v10 setObject:v11 forKey:v6];

    uint64_t v9 = 1;
    goto LABEL_23;
  }
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSString stringWithCString:xpc_string_get_string_ptr(v5) encoding:4];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    v12 = *(void **)(a1 + 32);
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = [v12 initWithXPCDictionary:v5];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    size_t length = xpc_data_get_length(v5);
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSData dataWithBytes:bytes_ptr length:length];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_array)
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSArray arrayWithXPCArray:v5];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_double)
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSNumber numberWithDouble:xpc_double_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_date)
  {
    v10 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v11 = +[NSDate dateWithTimeIntervalSince1970:(double)xpc_date_get_value(v5)];
    goto LABEL_22;
  }
  v8 = sub_7CA4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_E2F0((uint64_t)v6, v8);
  }

  uint64_t v9 = 0;
LABEL_23:

  return v9;
}

void sub_46E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_46FC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_4770(id a1)
{
  qword_1E658 = objc_alloc_init(MSDAlarmManager);

  _objc_release_x1();
}

void sub_4BB0(id a1, BOOL a2, NSError *a3)
{
  v4 = a3;
  if (!a2)
  {
    id v5 = sub_7CA4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      v7 = "-[MSDAlarmManager disableSleepAlarm]_block_invoke";
      __int16 v8 = 2114;
      uint64_t v9 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "%s - SleepAlarm completion handler returned error : %{public}@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_5124(id a1)
{
  qword_1E668 = objc_alloc_init(MSDPreferencesFile);

  _objc_release_x1();
}

void sub_52C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_5390(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_559C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_5664(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_5724(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_5B78(id a1)
{
  v1 = [@"/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata" stringByAppendingPathComponent:@"com.apple.MobileStoreDemo"];
  id v4 = [v1 stringByAppendingPathExtension:@"plist"];

  uint64_t v2 = +[NSURL fileURLWithPath:v4 isDirectory:0];
  v3 = (void *)qword_1E678;
  qword_1E678 = v2;
}

void sub_5C68(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_5D64(id a1)
{
  qword_1E688 = objc_alloc_init(MSDStoreHoursManager);

  _objc_release_x1();
}

void sub_5F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5F54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained expirationTimer];
  [v1 fire];
}

void sub_7340(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained expirationTimer];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    int v6 = [v5 expirationTimer];
    [v6 invalidate];

    id v7 = objc_loadWeakRetained(v2);
    [v7 setExpirationTimer:0];
  }
  id v8 = objc_alloc((Class)NSTimer);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = objc_loadWeakRetained(v2);
  id v11 = [v8 initWithFireDate:v9 interval:v10 target:"storeHourSettingsExpirationHandler:" selector:0 userInfo:0 repeats:0.0];
  id v12 = objc_loadWeakRetained(v2);
  [v12 setExpirationTimer:v11];

  v13 = +[NSRunLoop currentRunLoop];
  id v14 = objc_loadWeakRetained(v2);
  v15 = [v14 expirationTimer];
  [v13 addTimer:v15 forMode:NSDefaultRunLoopMode];

  v16 = sub_7CA4();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = [*(id *)(a1 + 32) toString];
    int v18 = 138543362;
    v19 = v17;
    _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Store hour settings will expire on %{public}@", (uint8_t *)&v18, 0xCu);
  }
}

void sub_769C(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained storeOpenTimer];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    int v6 = [v5 storeOpenTimer];
    [v6 invalidate];

    id v7 = objc_loadWeakRetained(v2);
    [v7 setStoreOpenTimer:0];
  }
  id v8 = objc_alloc((Class)NSTimer);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = objc_loadWeakRetained(v2);
  id v11 = [v8 initWithFireDate:v9 interval:v10 target:"storeOpenHandler:" selector:0 userInfo:0 repeats:0.0];
  id v12 = objc_loadWeakRetained(v2);
  [v12 setStoreOpenTimer:v11];

  id v15 = +[NSRunLoop currentRunLoop];
  id v13 = objc_loadWeakRetained(v2);
  id v14 = [v13 storeOpenTimer];
  [v15 addTimer:v14 forMode:NSDefaultRunLoopMode];
}

void sub_7968(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained storeCloseTimer];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    int v6 = [v5 storeCloseTimer];
    [v6 invalidate];

    id v7 = objc_loadWeakRetained(v2);
    [v7 setStoreCloseTimer:0];
  }
  id v8 = objc_alloc((Class)NSTimer);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = objc_loadWeakRetained(v2);
  id v11 = [v8 initWithFireDate:v9 interval:v10 target:"storeCloseHandler:" selector:0 userInfo:0 repeats:0.0];
  id v12 = objc_loadWeakRetained(v2);
  [v12 setStoreCloseTimer:v11];

  id v15 = +[NSRunLoop currentRunLoop];
  id v13 = objc_loadWeakRetained(v2);
  id v14 = [v13 storeCloseTimer];
  [v15 addTimer:v14 forMode:NSDefaultRunLoopMode];
}

id sub_7CA4()
{
  if (qword_1E6A0 != -1) {
    dispatch_once(&qword_1E6A0, &stru_186F0);
  }
  v0 = (void *)qword_1E698;

  return v0;
}

void sub_7CF8(id a1)
{
  qword_1E698 = (uint64_t)os_log_create("com.apple.MobileStoreDemo", "Default");

  _objc_release_x1();
}

id sub_7D3C()
{
  if (qword_1E6B0 != -1) {
    dispatch_once(&qword_1E6B0, &stru_18710);
  }
  v0 = (void *)qword_1E6A8;

  return v0;
}

void sub_7D90(id a1)
{
  qword_1E6A8 = (uint64_t)os_log_create("com.apple.MobileStoreDemo", "ScreenSaver");

  _objc_release_x1();
}

id sub_7DD4()
{
  if (qword_1E6C0 != -1) {
    dispatch_once(&qword_1E6C0, &stru_18730);
  }
  v0 = (void *)qword_1E6B8;

  return v0;
}

void sub_7E28(id a1)
{
  qword_1E6B8 = (uint64_t)os_log_create("com.apple.MobileStoreDemo", "Message");

  _objc_release_x1();
}

id sub_7E6C()
{
  if (qword_1E6D0 != -1) {
    dispatch_once(&qword_1E6D0, &stru_18750);
  }
  v0 = (void *)qword_1E6C8;

  return v0;
}

void sub_7EC0(id a1)
{
  if (os_variant_has_internal_content())
  {
    os_log_t v1 = os_log_create("com.apple.MobileStoreDemo", "Signpost");
  }
  else
  {
    os_log_t v1 = (os_log_t)&_os_log_disabled;
    id v2 = &_os_log_disabled;
  }
  v3 = (void *)qword_1E6C8;
  qword_1E6C8 = (uint64_t)v1;
}

void sub_7F30(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v9 = a1;
  id v10 = +[MSDLogModel sharedInstance];
  [v10 logWithFormat:v9 andArgs:&a9];
}

void sub_7FE4(id a1)
{
  qword_1E6D8 = objc_alloc_init(MSDLogModel);

  _objc_release_x1();
}

void sub_81BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_857C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_8594(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_85A4(uint64_t a1)
{
}

void sub_85AC(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  id v14 = [*(id *)(a1 + 32) stringByAppendingFormat:@"/%@", a2];
  int v6 = [*(id *)(a1 + 40) description];
  NSLog(@"Checking existing log file (full path) %@ against %@", v14, v6);

  uint64_t v7 = [*(id *)(a1 + 48) attributesOfItemAtPath:v14 error:0];
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  id v10 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate];
  id v11 = [v10 compare:*(void *)(a1 + 40)];

  if (v11 == (id)-1)
  {
    id v12 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) fileCreationDate];
    id v13 = [v12 description];
    NSLog(@"Removing %@ whose creation date is %@.", v14, v13);

    [*(id *)(a1 + 48) removeItemAtPath:v14 error:0];
  }
  *a4 = 0;
}

void sub_8944(id a1)
{
  qword_1E6E8 = objc_alloc_init(MSDScreenSaverManager);

  _objc_release_x1();
}

void sub_91D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[RBSProcessStateDescriptor descriptor];
  [v4 setValues:1];
  [v4 setEndowmentNamespaces:&off_19550];
  [v3 setStateDescriptor:v4];
  id v5 = [*(id *)(a1 + 32) screenSaverAppID];
  int v6 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v5];
  id v9 = v6;
  uint64_t v7 = +[NSArray arrayWithObjects:&v9 count:1];
  [v3 setPredicates:v7];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_9340;
  v8[3] = &unk_187E0;
  v8[4] = *(void *)(a1 + 32);
  [v3 setUpdateHandler:v8];
}

id sub_9340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) handleApplicationStateChanged:a4];
}

id sub_952C(uint64_t a1)
{
  return [*(id *)(a1 + 32) launchScreenSaver];
}

id sub_95E8(uint64_t a1)
{
  id v2 = sub_7D3C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) displayBacklightLevel];
    *(_DWORD *)buf = 134217984;
    id v23 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Received display layout update; backlight level: %ld", buf, 0xCu);
  }

  id v4 = [*(id *)(a1 + 40) backlightLevel];
  if (v4 != [*(id *)(a1 + 32) displayBacklightLevel])
  {
    id v5 = sub_7D3C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [*(id *)(a1 + 40) backlightLevel];
      id v7 = [*(id *)(a1 + 32) displayBacklightLevel];
      *(_DWORD *)buf = 134218240;
      id v23 = v6;
      __int16 v24 = 2048;
      id v25 = v7;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Backlight changed from %td to %td.", buf, 0x16u);
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "setIsStandbyMode:", objc_msgSend(*(id *)(a1 + 40), "isInStandbyMode:", *(void *)(a1 + 32)));
  uint64_t v8 = sub_7D3C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v9 = [*(id *)(a1 + 40) isStandbyMode];
    *(_DWORD *)buf = 67109120;
    LODWORD(v23) = v9;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Device is in Standby Mode: %d", buf, 8u);
  }

  if ([*(id *)(a1 + 40) backlightLevel] != (id)-1 && objc_msgSend(*(id *)(a1 + 40), "backlightLevel")
    || (uint64_t)[*(id *)(a1 + 32) displayBacklightLevel] < 1)
  {
    if ((uint64_t)[*(id *)(a1 + 40) backlightLevel] >= 1
      && ![*(id *)(a1 + 32) displayBacklightLevel])
    {
      id v12 = [*(id *)(a1 + 40) storeHoursManager];
      [v12 evaluateStoreStatusAgainstCurrentTime];

      id v13 = [*(id *)(a1 + 40) storeHoursManager];
      unsigned int v14 = [v13 isStoreOpenNow];

      if (v14)
      {
        dispatch_time_t v15 = dispatch_time(0, 120000000000);
        v16 = [*(id *)(a1 + 40) workQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_9964;
        block[3] = &unk_185A0;
        block[4] = *(void *)(a1 + 40);
        dispatch_after(v15, v16, block);
      }
    }
  }
  else
  {
    unsigned int v10 = [*(id *)(a1 + 40) justBootUp];
    id v11 = *(void **)(a1 + 40);
    if (v10)
    {
      [v11 setJustBootUp:0];
      [*(id *)(a1 + 40) handleSpringBoardLaunch];
    }
    else if (([v11 screenSaverRunning] & 1) == 0)
    {
      v17 = [*(id *)(a1 + 40) timer];

      if (v17)
      {
        int v18 = sub_7D3C();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_DEFAULT, "Timer will be canceled because screen lights up.", buf, 2u);
        }

        v19 = [*(id *)(a1 + 40) timer];
        [v19 invalidate];

        [*(id *)(a1 + 40) setTimer:0];
      }
    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "setBacklightLevel:", objc_msgSend(*(id *)(a1 + 32), "displayBacklightLevel"));
}

void sub_9964(uint64_t a1)
{
  id v2 = sub_7D3C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) backlightLevel];
    unsigned int v4 = [*(id *)(a1 + 32) isStandbyMode];
    int v6 = 134218240;
    id v7 = v3;
    __int16 v8 = 1024;
    unsigned int v9 = v4;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Checking device state before screen saver launch; backlight level = %ld; Stanby Mode = %{BOOL}d",
      (uint8_t *)&v6,
      0x12u);
  }

  if ([*(id *)(a1 + 32) backlightLevel]
    && ![*(id *)(a1 + 32) isStandbyMode])
  {
    id v5 = sub_7D3C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Skip screen saver launch", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) launchScreenSaver];
  }
}

id sub_9DEC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) bundleIdentifier];
  [*(id *)(a1 + 32) setScreenSaverAppID:v2];

  id v3 = *(void **)(a1 + 32);

  return [v3 setupIdleTimerHandler];
}

void sub_A120(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  id v3 = [v2 taskState];

  unsigned int v4 = [*(id *)(a1 + 32) state];
  id v5 = [v4 endowmentNamespaces];

  id v6 = [v5 containsObject:@"com.apple.frontboard.visibility"];
  id v7 = sub_7D3C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v8 = [*(id *)(a1 + 40) applicationStateString:v3 withVisibility:v6];
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "App state change to %{public}@", (uint8_t *)&v10, 0xCu);
  }
  if (v3 == 1 || v3 == 3) {
    goto LABEL_7;
  }
  if (v3 != 4) {
    goto LABEL_13;
  }
  if ((v6 & 1) == 0) {
LABEL_7:
  }
    [*(id *)(a1 + 40) screenSaverStopped];
  if (v3 == 4) {
    int v9 = (int)v6;
  }
  else {
    int v9 = 0;
  }
  if (v9 == 1) {
    [*(id *)(a1 + 40) screenSaverStarted];
  }
LABEL_13:
}

void sub_A334(uint64_t a1)
{
  id v2 = sub_7D3C();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) name];
    int v12 = 136315394;
    *(void *)id v13 = "-[MSDScreenSaverManager handleStoreHourSettingsChanged:]_block_invoke";
    *(_WORD *)&v13[8] = 2114;
    unsigned int v14 = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "%s: Triggered by NSNotification - %{public}@", (uint8_t *)&v12, 0x16u);
  }
  unsigned int v4 = [*(id *)(a1 + 40) loadScreenSaverConfig];
  unsigned int v5 = +[MSDHubFeatureFlags disableScreenDarkHours];
  unsigned int v6 = v5 ^ [*(id *)(a1 + 40) turnOffDisplayAtNight];
  if ((v6 & 1) == 0) {
    [*(id *)(a1 + 40) setTurnOffDisplayAtNight:v5 ^ 1];
  }
  id v7 = sub_7D3C();
  int v8 = v6 ^ 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 67109376;
    *(_DWORD *)id v13 = v4;
    *(_WORD *)&v13[4] = 1024;
    *(_DWORD *)&v13[6] = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Screen saver config changed: %{BOOL}d, Feature flag changed: %{BOOL}d", (uint8_t *)&v12, 0xEu);
  }

  if ((v8 | v4) == 1)
  {
    if (SBSGetScreenLockStatus())
    {
      int v9 = +[MSDStoreHoursManager sharedInstance];
      if ([v9 isStoreOpenNow])
      {
      }
      else
      {
        unsigned __int8 v10 = [*(id *)(a1 + 40) turnOffDisplayAtNight];

        if (v10)
        {
          id v11 = sub_7D3C();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v12) = 0;
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Skip launching SpringBoard since store is closed.", (uint8_t *)&v12, 2u);
          }

          [*(id *)(a1 + 40) stopScreenSaver];
          goto LABEL_16;
        }
      }
    }
    [*(id *)(a1 + 40) launchSpringBoard];
LABEL_16:
    if ([*(id *)(a1 + 40) turnOffAlwaysOnTimeAtNight]) {
      [*(id *)(a1 + 40) setupAlwaysOnTimeToggleTimer];
    }
  }
}

void sub_A92C(id a1, BSProcessHandle *a2, NSError *a3)
{
  id v3 = a3;
  if (v3)
  {
    unsigned int v4 = sub_7D3C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = [(NSError *)v3 localizedDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "StoreDemo plugin: failed to launch SpringBoard - %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void sub_ACB0(id a1, BSProcessHandle *a2, NSError *a3)
{
  id v3 = a3;
  if (v3)
  {
    unsigned int v4 = sub_7D3C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v5 = [(NSError *)v3 localizedDescription];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "StoreDemo plugin: failed to launch app - %{public}@", (uint8_t *)&v6, 0xCu);
    }
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_188B0);
  }
}

void sub_AD90(id a1)
{
  SBUIGetUserAgent();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 lockAndDimDevice];
}

void sub_B328(uint64_t a1)
{
  if ([*(id *)(a1 + 32) screenSaverRunning])
  {
    if ([*(id *)(a1 + 32) deviceType] == (char *)&dword_4 + 2)
    {
      id v2 = +[MSDKManagedDevice sharedInstance];
      [v2 clearCurrentSafariHistory];

      id v3 = +[MSDAlarmManager sharedInstance];
      [v3 disableAlarms];

      unsigned int v4 = +[MSDAlarmManager sharedInstance];
      [v4 disableSleepAlarm];

      unsigned int v5 = +[MSDKManagedDevice sharedInstance];
      [v5 restoreWallpaperSettingsIfNeeded];

      int v6 = +[MSDKManagedDevice sharedInstance];
      id v7 = [*(id *)(a1 + 32) screenSaverAppID];
      v12[0] = v7;
      v12[1] = @"com.apple.ist.dast";
      int v8 = +[NSArray arrayWithObjects:v12 count:2];
      [v6 closeRunningAppsExcept:v8];

      int v9 = +[MSDKManagedDevice sharedInstance];
      [v9 refreshDeviceSettings];

      unsigned __int8 v10 = +[MSDKManagedDevice sharedInstance];
      id v11 = +[NSDate now];
      [v10 setLastShallowRefreshTime:v11];
    }
  }
}

void sub_B6F8(id a1)
{
  id v1 = sub_7D3C();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, "Lock and dim screen now...", v3, 2u);
  }

  id v2 = SBUIGetUserAgent();
  [v2 lockAndDimDevice];
}

void sub_CA64(id a1)
{
  qword_1E6F8 = objc_alloc_init(MSDTestPreferences);

  _objc_release_x1();
}

void sub_DB1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_DB38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_DB48(uint64_t a1)
{
}

uint64_t sub_DB50(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  xpc_type_t type = xpc_get_type(v5);
  if (type == (xpc_type_t)&_xpc_type_BOOL)
  {
    int v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSNumber numberWithBool:xpc_BOOL_get_value(v5)];
LABEL_22:
    unsigned int v14 = v10;
    [v9 addObject:v10];

    uint64_t v8 = 1;
    goto LABEL_23;
  }
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    int v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSString stringWithCString:xpc_string_get_string_ptr(v5) encoding:4];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_int64)
  {
    int v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSNumber numberWithLongLong:xpc_int64_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_uint64)
  {
    int v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_data)
  {
    bytes_ptr = xpc_data_get_bytes_ptr(v5);
    size_t length = xpc_data_get_length(v5);
    int v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSData dataWithBytes:bytes_ptr length:length];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_double)
  {
    int v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSNumber numberWithDouble:xpc_double_get_value(v5)];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    int v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSDictionary dictionaryWithXPCDictionary:v5];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_array)
  {
    id v13 = *(void **)(a1 + 32);
    int v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = [v13 initWithXPCArray:v5];
    goto LABEL_22;
  }
  if (type == (xpc_type_t)&_xpc_type_date)
  {
    int v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v10 = +[NSDate dateWithTimeIntervalSince1970:(double)xpc_date_get_value(v5)];
    goto LABEL_22;
  }
  id v7 = sub_7CA4();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_EFF4(a2, v7);
  }

  uint64_t v8 = 0;
LABEL_23:

  return v8;
}

void sub_DF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_DF18(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = xpc_string_create((const char *)[v6 UTF8String]);
LABEL_5:
    id v10 = v8;
    xpc_array_append_value(v7, v8);

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = *(void **)(a1 + 32);
    id v9 = v6;
    uint64_t v8 = xpc_data_create([v9 bytes], (size_t)objc_msgSend(v9, "length"));
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v6;
    if (!strcmp((const char *)[v11 objCType], "i")
      || (id v12 = v11, !strcmp((const char *)[v12 objCType], "s"))
      || (id v13 = v12, !strcmp((const char *)[v13 objCType], "q"))
      || (id v14 = v13, !strcmp((const char *)[v14 objCType], "q")))
    {
      v20 = *(void **)(a1 + 32);
      xpc_object_t v21 = xpc_int64_create((int64_t)[v11 longLongValue]);
    }
    else
    {
      id v15 = v14;
      if (!strcmp((const char *)[v15 objCType], "f")
        || (id v16 = v15, !strcmp((const char *)[v16 objCType], "d")))
      {
        v20 = *(void **)(a1 + 32);
        [v15 doubleValue];
        xpc_object_t v21 = xpc_double_create(v25);
      }
      else
      {
        id v17 = v16;
        if (strcmp((const char *)[v17 objCType], "B"))
        {
          id v18 = v17;
          if (strcmp((const char *)[v18 objCType], "c"))
          {
            v19 = sub_7CA4();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
              sub_E368(v18, v19);
            }

            *a4 = 1;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
            goto LABEL_23;
          }
        }
        v20 = *(void **)(a1 + 32);
        xpc_object_t v21 = xpc_BOOL_create((BOOL)[v17 BOOLValue]);
      }
    }
    v22 = v21;
    xpc_array_append_value(v20, v21);

LABEL_23:
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v6 xpcArrayFromArray];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = [v6 createXPCDictionary];
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = *(void **)(a1 + 32);
    [v6 timeIntervalSince1970];
    uint64_t v8 = xpc_date_create((uint64_t)v23);
    goto LABEL_5;
  }
  __int16 v24 = sub_7CA4();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
    sub_F06C(v24);
  }

  *a4 = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
LABEL_6:
}

void sub_E270(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Converted from xpc to NSDictionary: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_E2F0(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "The value for key %{public}@ has a type that is not supported yet", (uint8_t *)&v2, 0xCu);
}

void sub_E368(void *a1, NSObject *a2)
{
  int v3 = 136315138;
  id v4 = [a1 objCType];
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unsupported NSNumber type: %s for xpc dictionary encoding", (uint8_t *)&v3, 0xCu);
}

void sub_E3F8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_opt_class();
  int v7 = 138543618;
  uint64_t v8 = a1;
  sub_46D0();
  id v6 = v5;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "The value for key %{public}@ has unsupported type %{public}@", (uint8_t *)&v7, 0x16u);
}

void sub_E49C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_E520(void *a1)
{
  int v2 = [a1 localizedDescription];
  [a1 code];
  sub_46AC();
  sub_46FC(&dword_0, v3, v4, "Failed to deserialize JSON object with error - %{public}@(0x%tx). Target: %{public}@", v5, v6, v7, v8, v9);
}

void sub_E5BC()
{
  sub_46D0();
  sub_46E0(&dword_0, v0, v1, "%s: format not correct: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_E634(void *a1)
{
  uint64_t v2 = [a1 localizedDescription];
  [a1 code];
  sub_46AC();
  sub_46FC(&dword_0, v3, v4, "Failed to serialize JSON object - %{public}@(0x%tx). Target: %{public}@", v5, v6, v7, v8, v9);
}

void sub_E6D0()
{
  sub_46D0();
  sub_46E0(&dword_0, v0, v1, "%s: Not a valid JSON object: %{public}@", v2, v3, v4, v5, 2u);
}

void sub_E748(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to create an HKSPSleepStore for MSDAlarmManager", v1, 2u);
}

void sub_E78C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MSDAlarmManager getCurrentSleepAlarms]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%s - iPad does not support Sleep Alarms", (uint8_t *)&v1, 0xCu);
}

void sub_E810(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 136315394;
  uint64_t v5 = "-[MSDAlarmManager disableSleepAlarm]";
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "%s - Cannot get sleepSchedule - %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_E8BC(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MSDAlarmManager disableSleepAlarm]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%s - iPad does not support Sleep Alarms", (uint8_t *)&v1, 0xCu);
}

void sub_E940(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_E9B8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Setting preference %{public}@:%{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_EA40(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_EAB8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_EB30(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Fall back to default store hours.", v1, 2u);
}

void sub_EB74()
{
  sub_7C98();
  sub_5C68(&dword_0, v0, v1, "No or invalid last updated date for store hour settings: %{public}@", v2, v3, v4, v5, v6);
}

void sub_EBDC(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 toString];
  sub_7C98();
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Store hour settings have or will be expired on %{public}@", v4, 0xCu);
}

void sub_EC70()
{
  sub_7C98();
  sub_5C68(&dword_0, v0, v1, "Raw store hours not in right format: %{public}@", v2, v3, v4, v5, v6);
}

void sub_ECD8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to parse raw store hours.", v1, 2u);
}

void sub_ED1C()
{
  sub_7C98();
  sub_5C68(&dword_0, v0, v1, "Store hour not in right order - %{public}@", v2, v3, v4, v5, v6);
}

void sub_ED84()
{
  sub_7C98();
  sub_5C68(&dword_0, v0, v1, "Failed to parse store hour date string - %{public}@", v2, v3, v4, v5, v6);
}

void sub_EDEC()
{
  sub_7C98();
  sub_5C68(&dword_0, v0, v1, "Store hour not in right format - %{public}@", v2, v3, v4, v5, v6);
}

void sub_EE54(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Backlight assertion failed to acquire: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_EEEC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Received invalid next store open/close hours! Assume store is open and won't close soon.", v1, 2u);
}

void sub_EF30(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Failed to synchronize with CFPreferences.", v1, 2u);
}

void sub_EF74(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Converted from xpc to NSArray: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_EFF4(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "The value at index %lu in this xpcArray are of an unsupported type", (uint8_t *)&v2, 0xCu);
}

void sub_F06C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "The values in this NSArray are of an unsupported type", v1, 2u);
}

uint64_t BYSetupAssistantNeedsToRun()
{
  return _BYSetupAssistantNeedsToRun();
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return _CFPropertyListCreateDeepCopy(allocator, propertyList, mutabilityOption);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void NSLog(NSString *format, ...)
{
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

uint64_t SBUIGetUserAgent()
{
  return _SBUIGetUserAgent();
}

void _Block_object_dispose(const void *a1, const int a2)
{
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int fflush(FILE *a1)
{
  return _fflush(a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return _xpc_data_create(bytes, length);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return _xpc_data_create_with_dispatch_data(ddata);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return _xpc_data_get_bytes_ptr(xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return _xpc_data_get_length(xdata);
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return _xpc_date_create(interval);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return _xpc_date_get_value(xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return _xpc_dictionary_apply(xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_date(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_object_t xpc_double_create(double value)
{
  return _xpc_double_create(value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  return _xpc_double_get_value(xdouble);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return _xpc_int64_get_value(xint);
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return _xpc_string_get_string_ptr(xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return _xpc_uint64_get_value(xuint);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__createDispatchData(void *a1, const char *a2, ...)
{
  return [a1 _createDispatchData];
}

id objc_msgSend_acquireDisableAlwaysOnTimeAssertion(void *a1, const char *a2, ...)
{
  return [a1 acquireDisableAlwaysOnTimeAssertion];
}

id objc_msgSend_alarmConfiguration(void *a1, const char *a2, ...)
{
  return [a1 alarmConfiguration];
}

id objc_msgSend_alarmsSync(void *a1, const char *a2, ...)
{
  return [a1 alarmsSync];
}

id objc_msgSend_aotTimer(void *a1, const char *a2, ...)
{
  return [a1 aotTimer];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backlightAssertion(void *a1, const char *a2, ...)
{
  return [a1 backlightAssertion];
}

id objc_msgSend_backlightLevel(void *a1, const char *a2, ...)
{
  return [a1 backlightLevel];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cache(void *a1, const char *a2, ...)
{
  return [a1 cache];
}

id objc_msgSend_clearCurrentSafariHistory(void *a1, const char *a2, ...)
{
  return [a1 clearCurrentSafariHistory];
}

id objc_msgSend_closedDate(void *a1, const char *a2, ...)
{
  return [a1 closedDate];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_convertToNSData(void *a1, const char *a2, ...)
{
  return [a1 convertToNSData];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createXPCDictionary(void *a1, const char *a2, ...)
{
  return [a1 createXPCDictionary];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disableAlarms(void *a1, const char *a2, ...)
{
  return [a1 disableAlarms];
}

id objc_msgSend_disableAlwaysOn(void *a1, const char *a2, ...)
{
  return [a1 disableAlwaysOn];
}

id objc_msgSend_disableScreenDarkHours(void *a1, const char *a2, ...)
{
  return [a1 disableScreenDarkHours];
}

id objc_msgSend_disableSleepAlarm(void *a1, const char *a2, ...)
{
  return [a1 disableSleepAlarm];
}

id objc_msgSend_displayBacklightLevel(void *a1, const char *a2, ...)
{
  return [a1 displayBacklightLevel];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_endOfDay(void *a1, const char *a2, ...)
{
  return [a1 endOfDay];
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return [a1 endowmentNamespaces];
}

id objc_msgSend_evaluateStoreStatusAgainstCurrentTime(void *a1, const char *a2, ...)
{
  return [a1 evaluateStoreStatusAgainstCurrentTime];
}

id objc_msgSend_expirationTimer(void *a1, const char *a2, ...)
{
  return [a1 expirationTimer];
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return [a1 fileCreationDate];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_fire(void *a1, const char *a2, ...)
{
  return [a1 fire];
}

id objc_msgSend_getDemoInstallState(void *a1, const char *a2, ...)
{
  return [a1 getDemoInstallState];
}

id objc_msgSend_getDemoMode(void *a1, const char *a2, ...)
{
  return [a1 getDemoMode];
}

id objc_msgSend_getLastAutoRebootTime(void *a1, const char *a2, ...)
{
  return [a1 getLastAutoRebootTime];
}

id objc_msgSend_getLastSettingsUpdatedTime(void *a1, const char *a2, ...)
{
  return [a1 getLastSettingsUpdatedTime];
}

id objc_msgSend_getStoreHours(void *a1, const char *a2, ...)
{
  return [a1 getStoreHours];
}

id objc_msgSend_handleSpringBoardLaunch(void *a1, const char *a2, ...)
{
  return [a1 handleSpringBoardLaunch];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreWhenBacklightInactivates(void *a1, const char *a2, ...)
{
  return [a1 ignoreWhenBacklightInactivates];
}

id objc_msgSend_initializeAppSwitcherContent(void *a1, const char *a2, ...)
{
  return [a1 initializeAppSwitcherContent];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isRetailDeviceContentUpdating(void *a1, const char *a2, ...)
{
  return [a1 isRetailDeviceContentUpdating];
}

id objc_msgSend_isStandbyMode(void *a1, const char *a2, ...)
{
  return [a1 isStandbyMode];
}

id objc_msgSend_isStoreOpenNow(void *a1, const char *a2, ...)
{
  return [a1 isStoreOpenNow];
}

id objc_msgSend_justBootUp(void *a1, const char *a2, ...)
{
  return [a1 justBootUp];
}

id objc_msgSend_lastSettingsUpdated(void *a1, const char *a2, ...)
{
  return [a1 lastSettingsUpdated];
}

id objc_msgSend_launchScreenSaver(void *a1, const char *a2, ...)
{
  return [a1 launchScreenSaver];
}

id objc_msgSend_launchSpringBoard(void *a1, const char *a2, ...)
{
  return [a1 launchSpringBoard];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadScreenSaverConfig(void *a1, const char *a2, ...)
{
  return [a1 loadScreenSaverConfig];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_lockAndDimDevice(void *a1, const char *a2, ...)
{
  return [a1 lockAndDimDevice];
}

id objc_msgSend_logFP(void *a1, const char *a2, ...)
{
  return [a1 logFP];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return [a1 longLongValue];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return [a1 monitor];
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return [a1 month];
}

id objc_msgSend_mtAlarmManager(void *a1, const char *a2, ...)
{
  return [a1 mtAlarmManager];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newDateByAddingOneDay(void *a1, const char *a2, ...)
{
  return [a1 newDateByAddingOneDay];
}

id objc_msgSend_newDateByAddingOneWeek(void *a1, const char *a2, ...)
{
  return [a1 newDateByAddingOneWeek];
}

id objc_msgSend_nextContentRevertDate(void *a1, const char *a2, ...)
{
  return [a1 nextContentRevertDate];
}

id objc_msgSend_nextStoreClosedDate(void *a1, const char *a2, ...)
{
  return [a1 nextStoreClosedDate];
}

id objc_msgSend_nextStoreOpenDate(void *a1, const char *a2, ...)
{
  return [a1 nextStoreOpenDate];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_objCType(void *a1, const char *a2, ...)
{
  return [a1 objCType];
}

id objc_msgSend_occurrences(void *a1, const char *a2, ...)
{
  return [a1 occurrences];
}

id objc_msgSend_openDate(void *a1, const char *a2, ...)
{
  return [a1 openDate];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_populateCache(void *a1, const char *a2, ...)
{
  return [a1 populateCache];
}

id objc_msgSend_preferencesFileExists(void *a1, const char *a2, ...)
{
  return [a1 preferencesFileExists];
}

id objc_msgSend_preferencesFilePath(void *a1, const char *a2, ...)
{
  return [a1 preferencesFilePath];
}

id objc_msgSend_preferencesFileUrl(void *a1, const char *a2, ...)
{
  return [a1 preferencesFileUrl];
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return [a1 raise];
}

id objc_msgSend_readHubSuppliedSettings(void *a1, const char *a2, ...)
{
  return [a1 readHubSuppliedSettings];
}

id objc_msgSend_readLastAutoReboot(void *a1, const char *a2, ...)
{
  return [a1 readLastAutoReboot];
}

id objc_msgSend_readLastSettingsUpdated(void *a1, const char *a2, ...)
{
  return [a1 readLastSettingsUpdated];
}

id objc_msgSend_refreshDeviceSettings(void *a1, const char *a2, ...)
{
  return [a1 refreshDeviceSettings];
}

id objc_msgSend_releaseDisableAlwaysOnTimeAssertion(void *a1, const char *a2, ...)
{
  return [a1 releaseDisableAlwaysOnTimeAssertion];
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return [a1 reload];
}

id objc_msgSend_restoreWallpaperSettingsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 restoreWallpaperSettingsIfNeeded];
}

id objc_msgSend_revertDate(void *a1, const char *a2, ...)
{
  return [a1 revertDate];
}

id objc_msgSend_saveCache(void *a1, const char *a2, ...)
{
  return [a1 saveCache];
}

id objc_msgSend_screenSaverAppID(void *a1, const char *a2, ...)
{
  return [a1 screenSaverAppID];
}

id objc_msgSend_screenSaverIdleDelay(void *a1, const char *a2, ...)
{
  return [a1 screenSaverIdleDelay];
}

id objc_msgSend_screenSaverRunning(void *a1, const char *a2, ...)
{
  return [a1 screenSaverRunning];
}

id objc_msgSend_screenSaverShouldLaunchAt(void *a1, const char *a2, ...)
{
  return [a1 screenSaverShouldLaunchAt];
}

id objc_msgSend_screenSaverShouldRunUntil(void *a1, const char *a2, ...)
{
  return [a1 screenSaverShouldRunUntil];
}

id objc_msgSend_screenSaverStarted(void *a1, const char *a2, ...)
{
  return [a1 screenSaverStarted];
}

id objc_msgSend_screenSaverStopped(void *a1, const char *a2, ...)
{
  return [a1 screenSaverStopped];
}

id objc_msgSend_sessionStartTime(void *a1, const char *a2, ...)
{
  return [a1 sessionStartTime];
}

id objc_msgSend_setupAlwaysOnTimeToggleTimer(void *a1, const char *a2, ...)
{
  return [a1 setupAlwaysOnTimeToggleTimer];
}

id objc_msgSend_setupIdleTimerHandler(void *a1, const char *a2, ...)
{
  return [a1 setupIdleTimerHandler];
}

id objc_msgSend_setupStoreOpenCloseTimers(void *a1, const char *a2, ...)
{
  return [a1 setupStoreOpenCloseTimers];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldHandleIdleHandler(void *a1, const char *a2, ...)
{
  return [a1 shouldHandleIdleHandler];
}

id objc_msgSend_shouldSetupIdleHandler(void *a1, const char *a2, ...)
{
  return [a1 shouldSetupIdleHandler];
}

id objc_msgSend_sleepAlarmsSync(void *a1, const char *a2, ...)
{
  return [a1 sleepAlarmsSync];
}

id objc_msgSend_sleepStore(void *a1, const char *a2, ...)
{
  return [a1 sleepStore];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_stashCurrentWallpaperSettingsIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 stashCurrentWallpaperSettingsIfNeeded];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stopScreenSaver(void *a1, const char *a2, ...)
{
  return [a1 stopScreenSaver];
}

id objc_msgSend_storeCloseTimer(void *a1, const char *a2, ...)
{
  return [a1 storeCloseTimer];
}

id objc_msgSend_storeHourRecords(void *a1, const char *a2, ...)
{
  return [a1 storeHourRecords];
}

id objc_msgSend_storeHourSettings(void *a1, const char *a2, ...)
{
  return [a1 storeHourSettings];
}

id objc_msgSend_storeHoursManager(void *a1, const char *a2, ...)
{
  return [a1 storeHoursManager];
}

id objc_msgSend_storeOpenTimer(void *a1, const char *a2, ...)
{
  return [a1 storeOpenTimer];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringByExpandingTildeInPath(void *a1, const char *a2, ...)
{
  return [a1 stringByExpandingTildeInPath];
}

id objc_msgSend_supportedFeatureFlags(void *a1, const char *a2, ...)
{
  return [a1 supportedFeatureFlags];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return [a1 taskState];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return [a1 timer];
}

id objc_msgSend_toString(void *a1, const char *a2, ...)
{
  return [a1 toString];
}

id objc_msgSend_turnOffAlwaysOnTimeAtNight(void *a1, const char *a2, ...)
{
  return [a1 turnOffAlwaysOnTimeAtNight];
}

id objc_msgSend_turnOffDisplayAtNight(void *a1, const char *a2, ...)
{
  return [a1 turnOffDisplayAtNight];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_useDefaultStoreHours(void *a1, const char *a2, ...)
{
  return [a1 useDefaultStoreHours];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_xpcArrayFromArray(void *a1, const char *a2, ...)
{
  return [a1 xpcArrayFromArray];
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return [a1 year];
}