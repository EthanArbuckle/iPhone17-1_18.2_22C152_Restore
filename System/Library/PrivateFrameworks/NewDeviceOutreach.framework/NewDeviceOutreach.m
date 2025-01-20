BOOL sub_1000014A0(uint64_t a1, void *a2)
{
  void *v2;
  BOOL v3;

  v2 = [a2 valueForEntitlement:a1];
  v3 = 0;
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v2 BOOLValue]) {
      v3 = 1;
    }
  }

  return v3;
}

uint64_t start()
{
  v0 = _NDOLogSystem();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "launched", buf, 2u);
  }

  v1 = +[NSUserDefaults standardUserDefaults];
  objc_msgSend(v1, "ndo_registerDefaults");

  v2 = objc_opt_new();
  id v27 = +[NDOScheduler newSchedulerWithActivityDelegate:v2];

  [v27 monitorForScheduledActivity];
  v3 = objc_opt_new();
  id v26 = +[NDOScheduler newSchedulerWithActivityDelegate:v3];

  [v26 monitorForScheduledActivity];
  v4 = objc_opt_new();
  id v25 = +[NDOScheduler newSchedulerWithActivityDelegate:v4];

  [v25 monitorForScheduledActivity];
  v5 = objc_opt_new();
  id v24 = +[NDOScheduler newSchedulerWithActivityDelegate:v5];

  [v24 monitorForScheduledActivity];
  v6 = objc_opt_new();
  id v7 = +[NDOScheduler newSchedulerWithActivityDelegate:v6];

  [v7 monitorForScheduledActivity];
  v8 = objc_opt_new();
  id v9 = +[NDOScheduler newSchedulerWithActivityDelegate:v8];

  [v9 monitorForScheduledActivity];
  v10 = objc_opt_new();
  id v11 = +[NDOScheduler newSchedulerWithActivityDelegate:v10];

  [v11 monitorForScheduledActivity];
  v12 = objc_opt_new();
  id v13 = +[NDOScheduler newSchedulerWithActivityDelegate:v12];

  [v13 monitorForScheduledActivity];
  v14 = [[NDOAgent alloc] initWithCallingProcessBundleID:@"com.apple.Preferences"];
  [(NDOAgent *)v14 performMigrationIfNeeded];
  v15 = objc_opt_new();
  [v15 start];
  v16 = objc_opt_new();
  [v16 start];
  v17 = +[ACXPCEventSubscriber sharedSubscriber];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100001CA0;
  v30[3] = &unk_10001C4D8;
  v31 = v14;
  v18 = v14;
  [v17 registerAccountChangeEventHandler:v30];

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100001D7C;
  handler[3] = &unk_10001C528;
  id v29 = v16;
  id v19 = v16;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", 0, handler);
  v20 = objc_opt_new();
  id v21 = [objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.ndoagent"];
  [v21 setDelegate:v20];
  [v21 resume];
  v22 = +[NSRunLoop currentRunLoop];
  [v22 run];

  return 0;
}

id sub_100001CA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) appleAccountAddedWithReply:&stru_10001C4B0];
}

void sub_100001CB0(id a1, BOOL a2)
{
  BOOL v2 = a2;
  v3 = _NDOLogSystem();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446210;
      v6 = "int main(int, const char **)_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: Finished scheduling/downloading new warranty", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_10001158C(v4);
  }
}

void sub_100001D7C(uint64_t a1, xpc_object_t xdict)
{
  string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
  v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "entered stream for device pairing", buf, 2u);
  }

  if (string)
  {
    id v5 = [objc_alloc((Class)NSString) initWithCString:string encoding:4];
    v6 = _NDOLogSystem();
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "got launched with notificationName: %@", buf, 0xCu);
      }

      dispatch_time_t v8 = dispatch_time(0, 1000000000);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100001F5C;
      v9[3] = &unk_10001C500;
      v10 = v5;
      id v11 = *(id *)(a1 + 32);
      dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);

      id v7 = v10;
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sub_100011610(v7);
    }
  }
}

id sub_100001F5C(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isEqualToString:@"com.apple.nanoregistry.devicedidpair"] & 1) != 0
    || ([*(id *)(a1 + 32) isEqualToString:@"com.apple.nanoregistry.devicedidunpair"] & 1) != 0|| objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", @"com.apple.nanoregistry.watchdidbecomeactive"))
  {
    BOOL v2 = *(void **)(a1 + 40);
    return [v2 updatePairedWatchesFollowUp];
  }
  else
  {
    id result = [*(id *)(a1 + 32) isEqualToString:@"com.apple.bluetooth.pairing"];
    if (result)
    {
      v3 = *(void **)(a1 + 40);
      return [v3 fetchWarrantyForPairedBluetoothDevices];
    }
  }
  return result;
}

id sub_100002264(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairedOrActiveWatchesDidChange:0];
}

id sub_100002270(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pairedOrActiveWatchesDidChange:0];
}

void sub_10000240C(id a1, NSArray *a2)
{
  BOOL v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446210;
    v4 = "-[NDOPairedDevicesMonitor fetchWarrantyForPairedBluetoothDevices]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: Finished getting warranty for all bluetooth pioneer devices", (uint8_t *)&v3, 0xCu);
  }
}

void sub_10000269C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

void sub_1000026C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Devices followups to be posted, if required, after paired device change", (uint8_t *)&v9, 2u);
  }

  id v5 = +[NDOFollowUpPost nextFollowUpPostDateWithDevicesInfo:v3];

  v6 = _NDOLogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      int v9 = 138412290;
      v10 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found a new followup post date trigerred after a pairing event. Schedule followUp post for: %@", (uint8_t *)&v9, 0xCu);
    }

    v6 = objc_opt_new();
    +[NDOScheduler scheduleActivityWithDelegate:v6 forDate:v5];
  }
  else if (v7)
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No new followUp post date found after the pairing event.", (uint8_t *)&v9, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setIsExecuting:0];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
}

id sub_100003340(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) performScheduledOutreachWithBlock:a2];
}

void sub_1000037A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) identifier];
    v6 = +[NSDate date];
    int v7 = 138412546;
    dispatch_time_t v8 = v5;
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "XPC activity block occured '%@' at (%@)", (uint8_t *)&v7, 0x16u);
  }
  [*(id *)(a1 + 32) performScheduledOutreachWithBlock:v3];
}

void sub_100003D74(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) getScheduledActivityDateAndKey];
  v6 = v5;
  if (a2 == 1)
  {
    int v7 = +[NSDate date];
    id v8 = [v4 compare:v7];

    if (v8 != (id)1)
    {
      __int16 v9 = +[NSUserDefaults standardUserDefaults];
      [v9 removeObjectForKey:v6];
    }
  }
  dispatch_time_t v10 = dispatch_time(0, 1000000000);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003EB4;
  v11[3] = &unk_10001C608;
  id v12 = *(id *)(a1 + 40);
  uint64_t v13 = a2;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v11);
}

void sub_100003EA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_100003EB4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_100004110(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_100004140(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained outreachInProgress]
    && [*(id *)(a1 + 32) shouldDefer])
  {
    uint64_t v3 = _NDOLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136446210;
      v6 = "-[NDOIntervalCallActivity performActivityForScheduler:withCompletionHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}s: Warranty download activity deferred for interval call.", (uint8_t *)&v5, 0xCu);
    }

    id v4 = [WeakRetained outReachTimer];
    [v4 invalidate];

    [WeakRetained setOutReachTimer:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100004250(id *a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = +[NSUserDefaults standardUserDefaults];
    unsigned int v4 = [v3 BOOLForKey:@"lastStoredPairedDeviceCallAllowedValue"];

    int v5 = _NDOLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      *(void *)&uint8_t buf[4] = "-[NDOIntervalCallActivity performActivityForScheduler:withCompletionHandler:]_block_invoke";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: Initiating warranty download with paired devices allowed: %d", buf, 0x12u);
    }

    v6 = +[NDODeviceProvider sharedProvider];
    if (v4)
    {
      int v7 = [v6 primaryFUPEligibleDevices];
      [v7 allValues];
    }
    else
    {
      int v7 = [v6 defaultDevice];
      +[NSArray arrayWithObject:v7];
    __int16 v9 = };

    dispatch_group_t v10 = dispatch_group_create();
    id v11 = [NDOWarrantyDownloader alloc];
    id v12 = [a1[4] identifier];
    uint64_t v13 = [(NDOWarrantyDownloader *)v11 initWithCallingProcessBundleID:v12];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v31 = sub_1000046A0;
    v32 = sub_1000046B0;
    id v33 = (id)objc_opt_new();
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x3032000000;
    v28[3] = sub_1000046A0;
    v28[4] = sub_1000046B0;
    id v29 = 0;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000046B8;
    v23[3] = &unk_10001C6A8;
    v14 = v10;
    id v24 = v14;
    v15 = v13;
    id v25 = v15;
    id v26 = v28;
    id v27 = buf;
    [v9 enumerateObjectsUsingBlock:v23];
    v16 = dispatch_get_global_queue(21, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004A88;
    block[3] = &unk_10001C6D0;
    objc_copyWeak(&v22, a1 + 6);
    v20 = v28;
    id v21 = buf;
    id v19 = a1[5];
    dispatch_group_notify(v14, v16, block);

    objc_destroyWeak(&v22);
    _Block_object_dispose(v28, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 6);
    [WeakRetained setOutreachInProgress:0];
    id v8 = [WeakRetained outReachTimer];
    [v8 invalidate];

    [WeakRetained setOutReachTimer:0];
    (*((void (**)(void))a1[5] + 2))();
  }
}

void sub_100004674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000046A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000046B0(uint64_t a1)
{
}

void sub_1000046B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  unsigned int v4 = *(void **)(a1 + 40);
  int v5 = [v3 serialNumber];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000047A0;
  v7[3] = &unk_10001C680;
  id v8 = v3;
  long long v10 = *(_OWORD *)(a1 + 48);
  id v9 = *(id *)(a1 + 32);
  id v6 = v3;
  [v4 downloadWarrantyForSerialNumber:v5 sessionID:0 params:0 completionHandler:v7];
}

void sub_1000047A0(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  int v7 = _NDOLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 32) serialNumber];
    id v9 = [v8 sha256Hash];
    int v15 = 136446722;
    v16 = "-[NDOIntervalCallActivity performActivityForScheduler:withCompletionHandler:]_block_invoke_2";
    __int16 v17 = 2112;
    v18 = v9;
    __int16 v19 = 1024;
    int v20 = a2;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}s: serialNumber: %@ success: %d", (uint8_t *)&v15, 0x1Cu);
  }
  long long v10 = _NDOLogSystem();
  id v11 = v10;
  if (a2)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136446210;
      v16 = "-[NDOIntervalCallActivity performActivityForScheduler:withCompletionHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: Warranty downloaded successfully", (uint8_t *)&v15, 0xCu);
    }

    if (![*(id *)(a1 + 32) deviceType]) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    }
    unsigned int v12 = [v6 acOfferDisplay];
    id v11 = _NDOLogSystem();
    BOOL v13 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v12)
    {
      if (v13)
      {
        int v15 = 136446210;
        v16 = "-[NDOIntervalCallActivity performActivityForScheduler:withCompletionHandler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: Coverage check shows device should display AC offer, check on-device state", (uint8_t *)&v15, 0xCu);
      }

      if (+[NDOOutreachActivityUtilities currentDeviceShouldReceiveOutreachForWarranty:v6])
      {
        id v11 = +[NDODeviceInfo deviceInfoWithDevice:*(void *)(a1 + 32) warranty:v6];
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v11];
        goto LABEL_20;
      }
      id v11 = _NDOLogSystem();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v15 = 136446210;
      v16 = "-[NDOIntervalCallActivity performActivityForScheduler:withCompletionHandler:]_block_invoke";
      v14 = "%{public}s: Configuration does not support current device. Complete activity without scheduling followup";
    }
    else
    {
      if (!v13) {
        goto LABEL_20;
      }
      int v15 = 136446210;
      v16 = "-[NDOIntervalCallActivity performActivityForScheduler:withCompletionHandler:]_block_invoke";
      v14 = "%{public}s: Warranty shows device is ineligible, ignore device for scheduling followup";
    }
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v15, 0xCu);
    goto LABEL_20;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100011698(v11);
  }
LABEL_20:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void sub_100004A88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    unsigned int v4 = _NDOLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446210;
      id v9 = "-[NDOIntervalCallActivity performActivityForScheduler:withCompletionHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: Couldn't fetch warranty for default device", (uint8_t *)&v8, 0xCu);
    }
    goto LABEL_9;
  }
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v3 && [v3 count])
  {
    unsigned int v4 = objc_opt_new();
    int v5 = _NDOLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136446210;
      id v9 = "-[NDOIntervalCallActivity performActivityForScheduler:withCompletionHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: Trying to update/post the followup.", (uint8_t *)&v8, 0xCu);
    }

    id v6 = [v4 refreshFollowupWithDeviceInfos:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) andForcePostFollowup:0];
LABEL_9:
  }
  [WeakRetained setOutreachInProgress:0];
  int v7 = [WeakRetained outReachTimer];
  [v7 invalidate];

  [WeakRetained setOutReachTimer:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100004CDC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v2 = +[NDOIntervalCallActivity isDeviceCountryEligibleForIntervalEvent];
  id v3 = *(uint64_t (**)(uint64_t, BOOL))(v1 + 16);
  return v3(v1, v2);
}

void sub_1000050E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005100(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 5000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000051B8;
  block[3] = &unk_10001C748;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v4);
}

void sub_1000051B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained localeDidChange];
}

void sub_1000052B8(id a1, NSArray *a2)
{
  dispatch_time_t v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Device infos refreshed after locale change", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_100006128(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSUserDefaults standardUserDefaults];
  int v5 = [v3 stringByAppendingString:@".activationInterval"];
  [v4 doubleForKey:v5];
  double v7 = v6;

  id v10 = +[NSDate dateWithTimeIntervalSinceNow:v7];
  int v8 = +[NSString stringWithFormat:@"DEBUG:%@", v3];
  id v9 = +[NDODevice deviceWithName:v8 serialNumber:v3 activationDate:v10 deviceType:3 productID:@"Airpods1,3" productName:@"Airpods Pro Debug"];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v3];
}

void sub_1000066A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSUserDefaults standardUserDefaults];
  int v5 = [v3 stringByAppendingString:@".activationInterval"];
  [v4 doubleForKey:v5];
  double v7 = v6;

  id v10 = +[NSDate dateWithTimeIntervalSinceNow:v7];
  int v8 = +[NSString stringWithFormat:@"DEBUG:%@", v3];
  id v9 = +[NDODevice deviceWithName:v8 serialNumber:v3 activationDate:v10 deviceType:3 productID:@"Pencil1,3" productName:@"Pencil Debug"];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v3];
}

BOOL sub_100006C78(id a1, NDONanoDevice *a2)
{
  uint64_t v2 = NRDevicePropertyIsArchived;
  id v3 = a2;
  id v4 = [(NDONanoDevice *)v3 valueForProperty:v2];
  int v5 = [(NDONanoDevice *)v3 valueForProperty:NRDevicePropertyIsPaired];

  if ([v5 BOOLValue]) {
    unsigned int v6 = [v4 BOOLValue] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

void sub_100006D64(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100006D94(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1000070B8(id a1)
{
  uint64_t v1 = +[NSMutableArray arrayWithCapacity:0];
  uint64_t v2 = (void *)qword_100025990;
  qword_100025990 = v1;

  dispatch_queue_t v3 = dispatch_queue_create("Do not cache SN list queue", 0);
  id v4 = (void *)qword_100025998;
  qword_100025998 = (uint64_t)v3;
}

void sub_100007D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007D28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007D38(uint64_t a1)
{
}

void sub_100007D40(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    uint64_t v9 = "-[NDOWarrantyDownloader _downloadDeviceListForLocalDevices:sessionID:params:completionHandler:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s got response", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  unsigned int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100007E24(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"deviceList"];
  uint64_t v22 = a1;
  id v21 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) objectForKeyedSubscript:@"agsULUrl"];
  id v3 = +[NSMutableArray arrayWithCapacity:8];
  v23 = +[NSMutableArray arrayWithCapacity:16];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v2;
  id v4 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v30;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v30 != v6) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v9 = [v8 objectForKeyedSubscript:@"category"];
        uint64_t v10 = v9;
        if (v9)
        {
          v27[0] = _NSConcreteStackBlock;
          v27[1] = 3221225472;
          v27[2] = sub_100008288;
          v27[3] = &unk_10001C888;
          id v11 = v9;
          id v28 = v11;
          id v12 = [v3 indexOfObjectPassingTest:v27];
          if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            id v13 = objc_alloc((Class)NDODeviceSection);
            v14 = [v8 objectForKeyedSubscript:@"categoryLabel"];
            id v15 = [v13 initWithLabel:v14 identifier:v11];

            [v3 addObject:v15];
          }
          else
          {
            id v15 = [v3 objectAtIndexedSubscript:v12];
          }
          v16 = +[NDODevice deviceWithDeviceListDevice:v8];
          if (v16)
          {
            [v15 addDevice:v16];
            if ([v16 deviceType] == (id)2) {
              [v23 addObject:v16];
            }
          }
          else
          {
            __int16 v17 = _NDOLogSystem();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446467;
              v34 = "-[NDOWarrantyDownloader _downloadDeviceListForLocalDevices:sessionID:params:completionHandler:]_block_invoke";
              __int16 v35 = 2113;
              v36 = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}s Failed to create device (%{private}@)", buf, 0x16u);
            }
          }
          if (([v16 cachingPolicy] & 1) == 0)
          {
            v18 = _NDOLogSystem();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446467;
              v34 = "-[NDOWarrantyDownloader _downloadDeviceListForLocalDevices:sessionID:params:completionHandler:]_block_invoke";
              __int16 v35 = 2113;
              v36 = v16;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}s Disable cache for (%{private}@)", buf, 0x16u);
            }

            __int16 v19 = qword_100025998;
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000082CC;
            block[3] = &unk_10001C8B0;
            id v26 = v16;
            dispatch_sync(v19, block);
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v5);
  }

  int v20 = +[NDODeviceProvider sharedProvider];
  [v20 setAppleIDDeviceList:v23];

  (*(void (**)(void))(*(void *)(v22 + 32) + 16))();
}

id sub_100008288(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_1000082CC(uint64_t a1)
{
  uint64_t v1 = (void *)qword_100025990;
  id v2 = [*(id *)(a1 + 32) serialNumber];
  [v1 addObject:v2];
}

void sub_100008648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_100008668(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000086C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  id v3 = _NDOLogSystem();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v5;
      __int16 v17 = 2112;
      uint64_t v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "downloaded warranty: %@ for serialNum: %@", buf, 0x16u);
    }

    id v7 = +[NDOWarranty warrantyWithDictionary:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    int v8 = +[NDOWarranty cachedWarrantyForSerialNumber:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _scheduleConversionOutreachIfRequiredForWarranty:v7 serialNumber:*(void *)(a1 + 40) andCachedWarranty:v8];
    if (*(unsigned char *)(a1 + 64)) {
      [*(id *)(a1 + 32) _scheduleWeeklyOutreachIfRequiredForDefaultDeviceWarranty:v7];
    }
    uint64_t v9 = qword_100025998;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000088DC;
    block[3] = &unk_10001C900;
    id v12 = *(id *)(a1 + 40);
    id v13 = v7;
    id v14 = *(id *)(a1 + 48);
    id v10 = v7;
    dispatch_sync(v9, block);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100011D88(v4);
    }

    if (*(unsigned char *)(a1 + 64)) {
      [*(id *)(a1 + 32) _scheduleWeeklyOutreachIfRequiredForDefaultDeviceWarranty:0];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_1000088DC(uint64_t a1)
{
  unsigned int v2 = [(id)qword_100025990 containsObject:*(void *)(a1 + 32)];
  id v3 = _NDOLogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = +[NSLocale preferredLocale];
      uint64_t v6 = [v5 localeIdentifier];
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412803;
      long long v30 = v6;
      __int16 v31 = 2112;
      CFStringRef v32 = @"2";
      __int16 v33 = 2113;
      uint64_t v34 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NOT caching warranty for locale: '%@', version: %@ (sn: %{private}@)", buf, 0x20u);
    }
  }
  else
  {
    if (v4)
    {
      int v8 = +[NSLocale preferredLocale];
      uint64_t v9 = [v8 localeIdentifier];
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412803;
      long long v30 = v9;
      __int16 v31 = 2112;
      CFStringRef v32 = @"2";
      __int16 v33 = 2113;
      uint64_t v34 = v10;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "caching warranty for locale: '%@', version: %@ (sn: %{private}@)", buf, 0x20u);
    }
    [*(id *)(a1 + 40) cacheWarranty:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) cacheValidityDuration];
    if (v11 > 0.0)
    {
      id v12 = +[NSUserDefaults standardUserDefaults];
      [*(id *)(a1 + 40) cacheValidityDuration];
      double v14 = v13;
      id v15 = [*(id *)(a1 + 32) sha256Hash];
      uint64_t v16 = +[NSString stringWithFormat:@"%@_CachedWarrantyValidityDuration", v15];
      [v12 setDouble:v16 forKey:v14];
    }
    __int16 v17 = +[NSUserDefaults standardUserDefaults];
    uint64_t v18 = +[NSDate date];
    __int16 v19 = [*(id *)(a1 + 32) sha256Hash];
    int v20 = +[NSString stringWithFormat:@"%@_CachedWarrantyLastUpdatedDate", v19];
    [v17 setObject:v18 forKey:v20];

    id v21 = +[NSUserDefaults standardUserDefaults];
    uint64_t v22 = +[NSLocale preferredLocale];
    v23 = [v22 localeIdentifier];
    id v24 = [*(id *)(a1 + 32) sha256Hash];
    id v25 = +[NSString stringWithFormat:@"%@_CachedWarrantyLocale", v24];
    [v21 setObject:v23 forKey:v25];

    id v26 = +[NSUserDefaults standardUserDefaults];
    uint64_t v27 = [*(id *)(a1 + 32) sha256Hash];
    id v28 = +[NSString stringWithFormat:@"%@_CachedWarrantyVersion", v27];
    [v26 setObject:@"2" forKey:v28];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

id sub_100008E1C(void *a1, char a2)
{
  if (a2)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    uint64_t v7 = a1[8];
    return [v3 _downloadDeviceListForLocalDevices:v4 sessionID:v5 params:v6 completionHandler:v7];
  }
  else
  {
    int v8 = _NDOLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device list download skipped server due to server version", v10, 2u);
    }

    return (id)(*(uint64_t (**)(void))(a1[8] + 16))();
  }
}

id sub_1000090A0(void *a1, char a2)
{
  if (a2)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    uint64_t v6 = a1[7];
    uint64_t v7 = a1[8];
    return [v3 _downloadWarrantyForSerialNumber:v4 sessionID:v5 params:v6 withCompletion:v7];
  }
  else
  {
    int v8 = _NDOLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Warranty download skipped server due to server version", v10, 2u);
    }

    return (id)(*(uint64_t (**)(void))(a1[8] + 16))();
  }
}

void sub_100009420(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = a1[4];
  id v6 = v3;
  if (v4)
  {
    [v3 setValue:v4 forHTTPHeaderField:@"x-apple-universal"];
    id v3 = v6;
  }
  objc_msgSend(v3, "ndo_setDeviceListRequestBodyWithSerialNumber:localDevices:primaryAccount:", a1[5], a1[6], a1[7]);
  uint64_t v5 = [v6 HTTPBody];
  [v6 addBAAAuthenticationHeadersWithBody:v5];
}

uint64_t sub_1000094AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000096D4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    [v3 setValue:v5 forHTTPHeaderField:@"x-apple-universal"];
  }
  id v6 = +[NDODeviceProvider sharedProvider];
  uint64_t v7 = [v6 defaultDevice];
  int v8 = [v7 serialNumber];

  uint64_t v9 = *(void *)(a1 + 40);
  if (!v9 || !v8) {
    goto LABEL_10;
  }
  if ((objc_msgSend(v8, "isEqualToString:") & 1) == 0)
  {
    uint64_t v9 = *(void *)(a1 + 40);
LABEL_10:
    objc_msgSend(v4, "ndo_setCoverageRequestBodyWithSerialNumber:primarySerialNumber:displayedEvents:", v9, v8, 0);
    goto LABEL_11;
  }
  uint64_t v10 = +[NSUserDefaults standardUserDefaults];
  double v11 = [v10 dictionaryForKey:@"FollowupDisplayedSerialNumberHashesWithEvents"];

  id v12 = +[NDODeviceProvider sharedProvider];
  double v13 = [v12 allFUPEligibleDevices];
  double v14 = [v13 allValues];

  id v15 = objc_opt_new();
  if (v11)
  {
    __int16 v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472;
    __int16 v19 = sub_1000098C0;
    int v20 = &unk_10001C9C8;
    id v21 = v11;
    id v22 = v15;
    [v14 enumerateObjectsUsingBlock:&v17];
  }
  objc_msgSend(v4, "ndo_setCoverageRequestBodyWithSerialNumber:primarySerialNumber:displayedEvents:", *(void *)(a1 + 40), v8, v15, v17, v18, v19, v20);
  uint64_t v16 = [v4 HTTPBody];
  [v4 addBAAAuthenticationHeadersWithBody:v16];

LABEL_11:
}

void sub_1000098C0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v5 = [v4 serialNumber];
  id v6 = [v5 sha256Hash];
  uint64_t v7 = [v3 objectForKeyedSubscript:v6];
  int v8 = (void *)v7;
  uint64_t v9 = &__NSArray0__struct;
  if (v7) {
    uint64_t v9 = (void *)v7;
  }
  id v10 = v9;

  double v11 = *(void **)(a1 + 40);
  id v12 = [v4 serialNumber];

  [v11 setObject:v10 forKey:v12];
}

uint64_t sub_100009994(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009F80(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_100009FB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if ([WeakRetained followUpPostInProgress]
    && [*(id *)(a1 + 32) shouldDefer])
  {
    uint64_t v3 = _NDOLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "FollowUp Post activity deferred.", v5, 2u);
    }

    id v4 = [WeakRetained followUpPostTimer];
    [v4 invalidate];

    [WeakRetained setFollowUpPostTimer:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000A084(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = _NDOLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    id v15 = "-[NDOFollowUpPost performActivityForScheduler:withCompletionHandler:]_block_invoke";
    __int16 v16 = 2112;
    id v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s -> %@", (uint8_t *)&v14, 0x16u);
  }

  if (v3)
  {
    id v6 = objc_opt_new();
    unsigned int v7 = [v6 postFollowUpWithDevicesInfo:v3];
    int v8 = [(id)objc_opt_class() nextFollowUpPostDateWithDevicesInfo:v3];
    if (v8)
    {
      uint64_t v9 = _NDOLogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136446466;
        id v15 = "-[NDOFollowUpPost performActivityForScheduler:withCompletionHandler:]_block_invoke";
        __int16 v16 = 2112;
        id v17 = v8;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: Re-schedule followUp post for: %@", (uint8_t *)&v14, 0x16u);
      }

      +[NDOScheduler scheduleActivityWithDelegate:*(void *)(a1 + 32) forDate:v8];
    }
    if (v7)
    {
      id v10 = +[NDOFollowUpRefresh nextFollowUpRefreshDateWithDevicesInfo:v3 isInitialCall:1];
      double v11 = _NDOLogSystem();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 136446466;
        id v15 = "-[NDOFollowUpPost performActivityForScheduler:withCompletionHandler:]_block_invoke";
        __int16 v16 = 2112;
        id v17 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}s: Schedule refresh for: %@", (uint8_t *)&v14, 0x16u);
      }

      id v12 = objc_opt_new();
      +[NDOScheduler scheduleActivityWithDelegate:v12 forDate:v10];
    }
  }
  else
  {
    id v6 = _NDOLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unable to load devices info, defer", (uint8_t *)&v14, 2u);
    }
  }

  [WeakRetained setFollowUpPostInProgress:0];
  double v13 = [WeakRetained followUpPostTimer];
  [v13 invalidate];

  [WeakRetained setFollowUpPostTimer:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000A46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A484(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000A494(uint64_t a1)
{
}

void sub_10000A49C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  unsigned int v7 = [v6 warranty];
  int v8 = +[NSUserDefaults standardUserDefaults];
  uint64_t v9 = [v8 arrayForKey:@"FollowupPostedSerialNumberHashes"];

  id v10 = [v6 device];
  double v11 = [v10 serialNumber];
  id v12 = [v11 sha256Hash];
  unsigned __int8 v13 = [v9 containsObject:v12];

  if (v13)
  {
    int v14 = _NDOLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      sub_100011ED0(v6, v14);
    }
  }
  else
  {
    if ([v7 acOfferDisplay])
    {
      id v15 = [v7 acOfferEligibleUntil];
      [v15 timeIntervalSinceNow];
      double v17 = v16;

      if (v17 > 0.0)
      {
        uint64_t v18 = [v7 acOfferFollowupDisplayDate];
        __int16 v19 = [v6 device];
        int v20 = [v19 activationDate];

        id v21 = v20;
        if (v18)
        {
          [v20 timeIntervalSinceNow];
          double v23 = v22;
          [v18 timeIntervalSinceNow];
          if (v23 <= v24) {
            id v21 = v18;
          }
          else {
            id v21 = v20;
          }
        }
        double v25 = COERCE_DOUBLE(v21);
        id v26 = _NDOLogSystem();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v47 = +[NSDate date];
          v49 = [v6 device];
          v48 = [v49 serialNumber];
          [v48 sha256Hash];
          *(_DWORD *)buf = 136447490;
          v51 = "+[NDOFollowUpPost nextFollowUpPostDateWithDevicesInfo:]_block_invoke";
          __int16 v52 = 2112;
          double v53 = v25;
          __int16 v54 = 2112;
          v55 = v18;
          __int16 v56 = 2112;
          v57 = v20;
          __int16 v58 = 2112;
          v59 = v47;
          v61 = __int16 v60 = 2112;
          v46 = (void *)v61;
          _os_log_debug_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "%{public}s: deviceFollowUpPostDate: %@, serverSpecifiedDisplayDate: %@, localSpecifiedDisplayDate: %@ current date: %@ for device: %@", buf, 0x3Eu);
        }
        if (v25 != 0.0)
        {
          [*(id *)&v25 timeIntervalSinceNow];
          if (v27 > 0.0) {
            goto LABEL_21;
          }
        }
        id v28 = _NDOLogSystem();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          if (v25 == 0.0) {
            double v29 = -1.0;
          }
          else {
            [*(id *)&v25 timeIntervalSinceNow];
          }
          *(_DWORD *)buf = 136446466;
          v51 = "+[NDOFollowUpPost nextFollowUpPostDateWithDevicesInfo:]_block_invoke";
          __int16 v52 = 2048;
          double v53 = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "%{public}s: device followUpPostDate has passed : %f", buf, 0x16u);
        }

        if (v25 != 0.0)
        {
LABEL_21:
          [*(id *)&v25 timeIntervalSinceNow];
          double v31 = v30;
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) timeIntervalSinceNow];
          uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 8);
          if (v31 < v33 || !*(void *)(v32 + 40)) {
            objc_storeStrong((id *)(v32 + 40), *(id *)&v25);
          }
        }
        uint64_t v34 = _NDOLogSystem();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          sub_100011FA4(a1, v34);
        }

        __int16 v35 = [v7 acOfferEligibleUntil];
        [v35 timeIntervalSinceNow];
        double v37 = v36;
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) timeIntervalSinceNow];
        double v39 = v38;

        if (v37 < v39)
        {
          uint64_t v40 = [v7 acOfferEligibleUntil];
          uint64_t v41 = *(void *)(*(void *)(a1 + 32) + 8);
          v42 = *(void **)(v41 + 40);
          *(void *)(v41 + 40) = v40;
        }
        v43 = _NDOLogSystem();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          double v44 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
          *(_DWORD *)buf = 136446466;
          v51 = "+[NDOFollowUpPost nextFollowUpPostDateWithDevicesInfo:]_block_invoke";
          __int16 v52 = 2112;
          double v53 = v44;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%{public}s: result: %@", buf, 0x16u);
        }
      }
    }
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) timeIntervalSinceNow];
    if (v45 < 0.0) {
      *a4 = 1;
    }
  }
}

void sub_10000A9C8(id a1)
{
  id v3 = +[NRPairedDeviceRegistry sharedInstance];
  uint64_t v1 = [[NDODevicesManager alloc] initWithNanoRegistry:v3];
  unsigned int v2 = (void *)qword_1000259A0;
  qword_1000259A0 = (uint64_t)v1;
}

void sub_10000AF9C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = [a3 statusCode];
  if (v7)
  {
    id v10 = +[NSJSONSerialization JSONObjectWithData:v7 options:0 error:0];
  }
  else
  {
    id v10 = 0;
  }
  double v11 = _NDOLogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = v8;
    }
    int v15 = 134218242;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Request complete: %ld : %@", (uint8_t *)&v15, 0x16u);
  }

  if (v9 != (id)401)
  {
    if (v9 == (id)200)
    {
      unsigned __int8 v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_15:
      v13();
      goto LABEL_16;
    }
LABEL_14:
    unsigned __int8 v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_15;
  }
  int v14 = *(_DWORD *)(a1 + 56);
  if (v14 < 1) {
    goto LABEL_14;
  }
  [*(id *)(a1 + 32) downloadWithRetryCount:(v14 - 1) prepareBlock:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
LABEL_16:
}

uint64_t sub_10000C6D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000C6E0(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000C770;
  v2[3] = &unk_10001CAB0;
  uint64_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 getAllFUPEligibleDeviceInfosUsingPolicy:2 updateFollowUps:1 withReply:v2];
}

uint64_t sub_10000C770(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

uint64_t sub_10000CD90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000D288(uint64_t a1, uint64_t a2)
{
  id v3 = +[NDODeviceInfo deviceInfoWithDevice:*(void *)(a1 + 32) warranty:a2];
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getDefaultDeviceInfoUsingPolicy for device: '%@'", (uint8_t *)&v7, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v5 = [*(id *)(a1 + 40) warrantyProvider];
  id v6 = [v5 refreshFollowupWithDeviceInfo:v3 andForcePostFollowup:0];
}

uint64_t sub_10000D494(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000D6F0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NDODevice deviceWithName:@"<unknown-unknown>" serialNumber:*(void *)(a1 + 32) activationDate:0 deviceType:3];
  uint64_t v5 = [*(id *)(a1 + 40) deviceProvider];
  id v6 = [v5 primaryFUPEligibleDevices];
  int v7 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];

  id v8 = [*(id *)(a1 + 40) deviceProvider];
  id v9 = v8;
  if (v7)
  {
    uint64_t v10 = [v8 primaryFUPEligibleDevices];
LABEL_5:
    int v14 = (void *)v10;
    int v15 = 1;
LABEL_6:
    uint64_t v16 = [v14 objectForKeyedSubscript:*(void *)(a1 + 32)];

    id v4 = (void *)v16;
    goto LABEL_7;
  }
  double v11 = [v8 pairedBTDevices];
  id v12 = [v11 objectForKeyedSubscript:*(void *)(a1 + 32)];

  unsigned __int8 v13 = [*(id *)(a1 + 40) deviceProvider];
  id v9 = v13;
  if (v12)
  {
    uint64_t v10 = [v13 pairedBTDevices];
    goto LABEL_5;
  }
  id v21 = [v13 appleIDDevices];
  double v22 = [v21 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (v22)
  {
    id v9 = [*(id *)(a1 + 40) deviceProvider];
    int v14 = [v9 appleIDDevices];
    int v15 = 0;
    goto LABEL_6;
  }
  int v15 = 0;
LABEL_7:
  __int16 v17 = +[NDODeviceInfo deviceInfoWithDevice:v4 warranty:v3];
  id v18 = _NDOLogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    double v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "getDeviceInfoForSerialNumber for device: '%@'", (uint8_t *)&v23, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  if (v15
    && ([*(id *)(*(void *)(a1 + 40) + 24) isEqual:@"com.apple.NewDeviceOutreach.Extension"] & 1) == 0)
  {
    __int16 v19 = [*(id *)(a1 + 40) warrantyProvider];
    id v20 = [v19 refreshFollowupWithDeviceInfo:v17 andForcePostFollowup:*(unsigned __int8 *)(a1 + 56)];
  }
}

void sub_10000DB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000DB50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000DB60(uint64_t a1)
{
}

void sub_10000DB68(void *a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1[4] + 16));
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[6];
  id v6 = [v3 serialNumber];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000DC50;
  v10[3] = &unk_10001CBC8;
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  id v11 = v3;
  uint64_t v12 = v8;
  v10[4] = v7;
  id v9 = v3;
  [v4 getWarrantyUsingPolicy:v5 serialNumber:v6 sessionID:0 params:0 withReply:v10];
}

void sub_10000DC50(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1[4] + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000DD14;
  v7[3] = &unk_10001CBA0;
  uint64_t v5 = (void *)a1[5];
  uint64_t v11 = a1[6];
  id v8 = v5;
  id v9 = v3;
  uint64_t v10 = a1[4];
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_10000DD14(void *a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1[7] + 8) + 40);
  id v3 = +[NDODeviceInfo deviceInfoWithDevice:a1[4] warranty:a1[5]];
  [v2 addObject:v3];

  id v4 = *(NSObject **)(a1[6] + 16);
  dispatch_group_leave(v4);
}

uint64_t sub_10000DD88(uint64_t a1)
{
  unsigned int v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v7 = 136446466;
    id v8 = "-[NDOAgent getPrimaryFUPEligibleDeviceInfosUsingPolicy:updateFollowUps:withReply:]_block_invoke_4";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: '%@'", (uint8_t *)&v7, 0x16u);
  }

  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = [*(id *)(a1 + 32) warrantyProvider];
    id v5 = [v4 refreshFollowupWithDeviceInfos:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000E1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E200(void *a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1[4] + 16));
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[6];
  id v6 = [v3 serialNumber];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000E2E8;
  v10[3] = &unk_10001CBC8;
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  id v11 = v3;
  uint64_t v12 = v8;
  v10[4] = v7;
  id v9 = v3;
  [v4 getWarrantyUsingPolicy:v5 serialNumber:v6 sessionID:0 params:0 withReply:v10];
}

void sub_10000E2E8(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1[4] + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E3AC;
  v7[3] = &unk_10001CBA0;
  uint64_t v5 = (void *)a1[5];
  uint64_t v11 = a1[6];
  id v8 = v5;
  id v9 = v3;
  uint64_t v10 = a1[4];
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_10000E3AC(void *a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1[7] + 8) + 40);
  id v3 = +[NDODeviceInfo deviceInfoWithDevice:a1[4] warranty:a1[5]];
  [v2 addObject:v3];

  id v4 = *(NSObject **)(a1[6] + 16);
  dispatch_group_leave(v4);
}

uint64_t sub_10000E420(uint64_t a1)
{
  unsigned int v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v7 = 136446466;
    id v8 = "-[NDOAgent _getInfosForDevices:usingPolicy:updateFollowUps:withReply:]_block_invoke_4";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s: '%@'", (uint8_t *)&v7, 0x16u);
  }

  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = [*(id *)(a1 + 32) warrantyProvider];
    id v5 = [v4 refreshAllFollowupsWithDeviceInfos:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000E6EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000E704(void *a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1[4] + 16));
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[6];
  id v6 = [v3 serialNumber];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000E7EC;
  v10[3] = &unk_10001CBC8;
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  id v11 = v3;
  uint64_t v12 = v8;
  v10[4] = v7;
  id v9 = v3;
  [v4 getWarrantyUsingPolicy:v5 serialNumber:v6 sessionID:0 params:0 withReply:v10];
}

void sub_10000E7EC(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1[4] + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E8B0;
  v7[3] = &unk_10001CBA0;
  uint64_t v5 = (void *)a1[5];
  uint64_t v11 = a1[6];
  id v8 = v5;
  id v9 = v3;
  uint64_t v10 = a1[4];
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_10000E8B0(void *a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1[7] + 8) + 40);
  id v3 = +[NDODeviceInfo deviceInfoWithDevice:a1[4] warranty:a1[5]];
  [v2 addObject:v3];

  id v4 = *(NSObject **)(a1[6] + 16);
  dispatch_group_leave(v4);
}

uint64_t sub_10000E924(uint64_t a1)
{
  unsigned int v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "getBTDeviceInfosUsingPolicy: '%@'", (uint8_t *)&v7, 0xCu);
  }

  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = [*(id *)(a1 + 32) warrantyProvider];
    id v5 = [v4 refreshFollowupWithDeviceInfos:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000EBDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000EBF4(void *a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1[4] + 16));
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[6];
  id v6 = [v3 serialNumber];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000ECDC;
  v10[3] = &unk_10001CBC8;
  uint64_t v7 = a1[4];
  uint64_t v8 = a1[5];
  id v11 = v3;
  uint64_t v12 = v8;
  v10[4] = v7;
  id v9 = v3;
  [v4 getWarrantyUsingPolicy:v5 serialNumber:v6 sessionID:0 params:0 withReply:v10];
}

void sub_10000ECDC(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1[4] + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000EDA0;
  v7[3] = &unk_10001CBA0;
  uint64_t v5 = (void *)a1[5];
  uint64_t v11 = a1[6];
  id v8 = v5;
  id v9 = v3;
  uint64_t v10 = a1[4];
  id v6 = v3;
  dispatch_async(v4, v7);
}

void sub_10000EDA0(void *a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1[7] + 8) + 40);
  id v3 = +[NDODeviceInfo deviceInfoWithDevice:a1[4] warranty:a1[5]];
  [v2 addObject:v3];

  id v4 = *(NSObject **)(a1[6] + 16);
  dispatch_group_leave(v4);
}

uint64_t sub_10000EE14(uint64_t a1)
{
  unsigned int v2 = _NDOLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "getBTPioneerDeviceInfosUsingPolicy: '%@'", (uint8_t *)&v7, 0xCu);
  }

  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = [*(id *)(a1 + 32) warrantyProvider];
    id v5 = [v4 refreshFollowupWithDeviceInfos:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000F970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_10000F9EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _NDOLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138478083;
    uint64_t v7 = v5;
    __int16 v8 = 1024;
    BOOL v9 = v3 != 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getWarrantyUsingPolicy completionBlock %{private}@ : %d", (uint8_t *)&v6, 0x12u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10000FB08(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000FF58(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = objc_opt_new();
    uint64_t v5 = [v4 refreshALLFollowupsWithDeviceInfos:v3 andForcePostFollowup:0];
    id v6 = [v5 count];
    uint64_t v7 = _NDOLogSystem();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        int v14 = 138412290;
        int v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Followup present, schedule refresh for %@", (uint8_t *)&v14, 0xCu);
      }

      BOOL v9 = [(id)objc_opt_class() nextFollowUpRefreshDateWithDevicesInfo:v5 isInitialCall:1];
      uint64_t v7 = v9;
      if (v9 && ([v9 timeIntervalSinceNow], v10 > 0.0))
      {
        uint64_t v11 = _NDOLogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138412290;
          int v15 = v7;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Schedule next refresh for %@", (uint8_t *)&v14, 0xCu);
        }

        +[NDOScheduler scheduleActivityWithDelegate:*(void *)(a1 + 32) forDate:v7];
      }
      else
      {
        unsigned __int8 v13 = _NDOLogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1000121BC((uint64_t)v7, v13);
        }
      }
    }
    else if (v8)
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No followups present, don't schedule another refresh", (uint8_t *)&v14, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v12 = _NDOLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to load device info for followup refresh, defer", (uint8_t *)&v14, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10001032C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100010344(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100010354(uint64_t a1)
{
}

void sub_10001035C(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v36 = a2;
  id v6 = [v36 warranty];
  if ([v6 acOfferDisplay])
  {
    double v7 = *(double *)(a1 + 40) * (double)([v6 daysEligible] - 1);
    if (v7 > 0.0)
    {
      BOOL v8 = [v6 acOfferFollowupDisplayDate];
      BOOL v9 = [v36 device];
      double v10 = [v9 activationDate];

      uint64_t v11 = v10;
      if (v8)
      {
        [v10 timeIntervalSinceNow];
        double v13 = v12;
        [v8 timeIntervalSinceNow];
        if (v13 <= v14) {
          uint64_t v11 = v8;
        }
        else {
          uint64_t v11 = v10;
        }
      }
      id v15 = v11;
      uint64_t v16 = [v6 acOfferEligibleUntil];
      __int16 v17 = [v16 dateByAddingTimeInterval:-v7];

      [v17 timeIntervalSinceNow];
      double v19 = v18;
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) timeIntervalSinceNow];
      if (v19 < v20
        || !*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)
        && ([v15 timeIntervalSinceNow], v21 <= 0.0))
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v17);
      }
      if (v15)
      {
        [v15 timeIntervalSinceNow];
        if (v22 > 0.0)
        {
          [v15 timeIntervalSinceNow];
          double v24 = v23;
          [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) timeIntervalSinceNow];
          uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 8);
          if (v24 < v26 || !*(void *)(v25 + 40)) {
            objc_storeStrong((id *)(v25 + 40), v15);
          }
        }
      }
    }
    double v27 = [v6 acOfferEligibleUntil];
    [v27 timeIntervalSinceNow];
    double v29 = v28;
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) timeIntervalSinceNow];
    double v31 = v30;

    if (v29 < v31)
    {
      uint64_t v32 = [v6 acOfferEligibleUntil];
      uint64_t v33 = *(void *)(*(void *)(a1 + 32) + 8);
      uint64_t v34 = *(void **)(v33 + 40);
      *(void *)(v33 + 40) = v32;
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) timeIntervalSinceNow];
  if (v35 < 0.0) {
    *a4 = 1;
  }
}

void sub_1000109E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  _Block_object_dispose((const void *)(v9 - 176), 8);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v9 - 184));
  _Unwind_Resume(a1);
}

void sub_100010A30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if ([WeakRetained outreachInProgress]
    && [*(id *)(a1 + 32) shouldDefer])
  {
    id v3 = _NDOLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v6 = 138543362;
      uint64_t v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Warranty download activity deferred. Activity: %{public}@", (uint8_t *)&v6, 0xCu);
    }

    uint64_t v5 = [WeakRetained outReachTimer];
    [v5 invalidate];

    [WeakRetained setOutReachTimer:0];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t sub_100010B3C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100010B4C(uint64_t a1)
{
}

void sub_100010B54(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = [v3 serialNumber];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100010C50;
  v9[3] = &unk_10001CD08;
  id v10 = v3;
  id v6 = *(id *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v11 = v6;
  uint64_t v13 = v7;
  id v12 = *(id *)(a1 + 32);
  id v8 = v3;
  [v4 downloadWarrantyForSerialNumber:v5 sessionID:0 params:0 completionHandler:v9];
}

void sub_100010C50(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _NDOLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 32) serialNumber];
    uint64_t v8 = *(void *)(a1 + 40);
    int v22 = 141558786;
    uint64_t v23 = 1752392040;
    __int16 v24 = 2112;
    uint64_t v25 = v7;
    __int16 v26 = 1024;
    int v27 = a2;
    __int16 v28 = 2114;
    uint64_t v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "serialNumber: %{mask.hash}@ success: %d -- Activity: %{public}@", (uint8_t *)&v22, 0x26u);
  }
  uint64_t v9 = _NDOLogSystem();
  id v10 = v9;
  if (!a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100012234(v10);
    }
    goto LABEL_23;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Warranty downloaded successfully", (uint8_t *)&v22, 2u);
  }

  unsigned int v11 = [v5 acOfferDisplay];
  id v10 = _NDOLogSystem();
  BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v11)
  {
    if (!v12) {
      goto LABEL_23;
    }
    LOWORD(v22) = 0;
    double v21 = "Warranty shows device is ineligible, complete activity without scheduling followup";
LABEL_22:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v22, 2u);
    goto LABEL_23;
  }
  if (v12)
  {
    LOWORD(v22) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Coverage check shows device should display AC offer, check on-device state", (uint8_t *)&v22, 2u);
  }

  if (!+[NDOOutreachActivityUtilities currentDeviceShouldReceiveOutreachForWarranty:v5])
  {
    id v10 = _NDOLogSystem();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_23;
    }
    LOWORD(v22) = 0;
    double v21 = "Configuration does not support current device. Complete activity without scheduling followup";
    goto LABEL_22;
  }
  uint64_t v13 = [v5 acOfferEligibleUntil];
  [v5 acOfferDurationBeforeEndDate];
  id v10 = [v13 dateByAddingTimeInterval:-v14];

  id v15 = [v5 acOfferFollowupDisplayDate];

  if (v15)
  {
    uint64_t v16 = [v5 acOfferFollowupDisplayDate];

    id v10 = v16;
  }
  uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
  if (!*(void *)(v17 + 40)) {
    goto LABEL_15;
  }
  [v10 timeIntervalSinceNow];
  double v19 = v18;
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) timeIntervalSinceNow];
  if (v19 < v20)
  {
    uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
LABEL_15:
    objc_storeStrong((id *)(v17 + 40), v10);
  }
LABEL_23:

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_100010F3C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v4 = _NDOLogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activity: %{public}@ -- Complete activity and schedule followUp post for: %@", (uint8_t *)&v10, 0x16u);
    }

    uint64_t v4 = objc_opt_new();
    +[NDOScheduler scheduleActivityWithDelegate:v4 forDate:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
  else if (v5)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v10 = 138543362;
    uint64_t v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activity: %{public}@ -- No devices eligible for followUp posts", (uint8_t *)&v10, 0xCu);
  }

  [WeakRetained setOutreachInProgress:0];
  uint64_t v9 = [WeakRetained outReachTimer];
  [v9 invalidate];

  [WeakRetained setOutReachTimer:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100011508(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"com.apple.private.ndoagent";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Rejecting connection to ndoagent: missing entitlement '%@'", (uint8_t *)&v1, 0xCu);
}

void sub_10001158C(os_log_t log)
{
  int v1 = 136446210;
  CFStringRef v2 = "int main(int, const char **)_block_invoke";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}s: Failed to schedule/download new warranty", (uint8_t *)&v1, 0xCu);
}

void sub_100011610(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "notificationName is nil", v1, 2u);
}

void sub_100011654(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to get OS version", v1, 2u);
}

void sub_100011698(os_log_t log)
{
  int v1 = 136446210;
  CFStringRef v2 = "-[NDOIntervalCallActivity performActivityForScheduler:withCompletionHandler:]_block_invoke";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}s: Warranty failed to download", (uint8_t *)&v1, 0xCu);
}

void sub_10001171C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Checking if the country is excluded ...", v1, 2u);
}

void sub_100011760(void *a1)
{
  [a1 count];
  sub_100006D80();
  sub_100006D94((void *)&_mh_execute_header, v1, v2, "%{public}s: Printing devices: %lu", v3, v4, v5, v6, 2u);
}

void sub_1000117E4()
{
  v1[0] = 136446466;
  sub_100006D50();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s: CBDiscovery failed with error: %@\n", (uint8_t *)v1, 0x16u);
}

void sub_100011864()
{
  sub_100006D50();
  sub_100006D64((void *)&_mh_execute_header, v0, v1, "%s -> internal overriden pairedBTDevices: %@", v2, v3, v4, v5, 2u);
}

void sub_1000118D8()
{
  sub_100006D50();
  sub_100006D64((void *)&_mh_execute_header, v0, v1, "%s -> pairedBTDevicesSerialNumbers overrideDict: %@", v2, v3, v4, v5, 2u);
}

void sub_10001194C(void *a1)
{
  [a1 count];
  sub_100006D80();
  sub_100006D94((void *)&_mh_execute_header, v1, v2, "%{public}s: Printing devices: %lu", v3, v4, v5, v6, 2u);
}

void sub_1000119D0()
{
  v1[0] = 136446466;
  sub_100006D50();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}s: CBDiscovery failed with error: %@\n", (uint8_t *)v1, 0x16u);
}

void sub_100011A50()
{
  sub_100006D50();
  sub_100006D64((void *)&_mh_execute_header, v0, v1, "%s -> internal overriden pairedBTPioneerDevices: %@", v2, v3, v4, v5, 2u);
}

void sub_100011AC4()
{
  sub_100006D50();
  sub_100006D64((void *)&_mh_execute_header, v0, v1, "%s -> pairedBTPioneerDevicesSerialNumbers overrideDict: %@", v2, v3, v4, v5, 2u);
}

void sub_100011B38()
{
  v1[0] = 136446466;
  sub_100006D50();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%{public}s: callingProcess=%@", (uint8_t *)v1, 0x16u);
}

void sub_100011BB8(os_log_t log)
{
  int v1 = 136446210;
  uint64_t v2 = "-[NDOWarrantyDownloader _scheduleWeeklyOutreachIfRequiredForDefaultDeviceWarranty:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%{public}s: Not scheduling interval call", (uint8_t *)&v1, 0xCu);
}

void sub_100011C3C(void *a1, NSObject *a2, double a3)
{
  uint64_t v5 = [a1 scheduledActivityDate];
  int v6 = 136446722;
  uint64_t v7 = "-[NDOWarrantyDownloader _scheduleWeeklyOutreachIfRequiredForDefaultDeviceWarranty:]";
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  __int16 v10 = 2048;
  uint64_t v11 = (uint64_t)a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}s: Didn't schedule interval call for normal use case with already scheduled activity: %@ and last interval value: %ld", (uint8_t *)&v6, 0x20u);
}

void sub_100011D04(os_log_t log)
{
  int v1 = 136446210;
  uint64_t v2 = "-[NDOWarrantyDownloader _scheduleWeeklyOutreachIfRequiredForDefaultDeviceWarranty:]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%{public}s: country is excluded ...", (uint8_t *)&v1, 0xCu);
}

void sub_100011D88(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "ndoagent failed to load warranty", v1, 2u);
}

void sub_100011DCC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "URL '%@' contains no plist data", (uint8_t *)&v2, 0xCu);
}

void sub_100011E44()
{
  v3[0] = 136446722;
  sub_100006D50();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%{public}s: Error serializing plist file from URL '%@': %@", (uint8_t *)v3, 0x20u);
}

void sub_100011ED0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 device];
  __int16 v4 = [v3 serialNumber];
  uint64_t v5 = [v4 sha256Hash];
  int v6 = 136446466;
  uint64_t v7 = "+[NDOFollowUpPost nextFollowUpPostDateWithDevicesInfo:]_block_invoke";
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}s: Already posted followup for: %@", (uint8_t *)&v6, 0x16u);
}

void sub_100011FA4(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  int v3 = 136446466;
  __int16 v4 = "+[NDOFollowUpPost nextFollowUpPostDateWithDevicesInfo:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}s: mid result: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10001203C(uint64_t a1, NSObject *a2)
{
  int v2 = 136446466;
  int v3 = "-[NDOAgentDefaultWarrantyProvider initWithCallingProcessBundleID:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}s: callingProcess=%@", (uint8_t *)&v2, 0x16u);
}

void sub_1000120C8()
{
  sub_10000FE60();
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Override Serial Number: %@ found for SN: %@", v2, 0x16u);
}

void sub_100012140()
{
  sub_10000FE60();
  uint64_t v3 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "serialNumberOverride for Serial Number: %@ with serial: %@", v2, 0x16u);
}

void sub_1000121BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Not scheduling next refresh because refresh date is invalid: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100012234(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Warranty failed to download", v1, 2u);
}

void sub_100012278(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to determine active contexts with error: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return __CFBundleCopyBundleURLForExecutableURL();
}

uint64_t _NDOLogSystem()
{
  return __NDOLogSystem();
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_pidpath(pid, buffer, buffersize);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_HTTPBody(void *a1, const char *a2, ...)
{
  return [a1 HTTPBody];
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingPathExtension];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__pairedWatches(void *a1, const char *a2, ...)
{
  return [a1 _pairedWatches];
}

id objc_msgSend__updatePairedBTDevicesFollowUp(void *a1, const char *a2, ...)
{
  return [a1 _updatePairedBTDevicesFollowUp];
}

id objc_msgSend_acOfferConversionDate(void *a1, const char *a2, ...)
{
  return [a1 acOfferConversionDate];
}

id objc_msgSend_acOfferDisplay(void *a1, const char *a2, ...)
{
  return [a1 acOfferDisplay];
}

id objc_msgSend_acOfferDurationBeforeEndDate(void *a1, const char *a2, ...)
{
  return [a1 acOfferDurationBeforeEndDate];
}

id objc_msgSend_acOfferEligibleUntil(void *a1, const char *a2, ...)
{
  return [a1 acOfferEligibleUntil];
}

id objc_msgSend_acOfferFollowupDisplayDate(void *a1, const char *a2, ...)
{
  return [a1 acOfferFollowupDisplayDate];
}

id objc_msgSend_acOfferToggle(void *a1, const char *a2, ...)
{
  return [a1 acOfferToggle];
}

id objc_msgSend_activationDate(void *a1, const char *a2, ...)
{
  return [a1 activationDate];
}

id objc_msgSend_activityDelegate(void *a1, const char *a2, ...)
{
  return [a1 activityDelegate];
}

id objc_msgSend_agent(void *a1, const char *a2, ...)
{
  return [a1 agent];
}

id objc_msgSend_allFUPEligibleDevices(void *a1, const char *a2, ...)
{
  return [a1 allFUPEligibleDevices];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_appleIDDevices(void *a1, const char *a2, ...)
{
  return [a1 appleIDDevices];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bodyDescription(void *a1, const char *a2, ...)
{
  return [a1 bodyDescription];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cacheValidityDuration(void *a1, const char *a2, ...)
{
  return [a1 cacheValidityDuration];
}

id objc_msgSend_cachingPolicy(void *a1, const char *a2, ...)
{
  return [a1 cachingPolicy];
}

id objc_msgSend_callingProcessBundleID(void *a1, const char *a2, ...)
{
  return [a1 callingProcessBundleID];
}

id objc_msgSend_clearScheduledActivities(void *a1, const char *a2, ...)
{
  return [a1 clearScheduledActivities];
}

id objc_msgSend_clientConfig(void *a1, const char *a2, ...)
{
  return [a1 clientConfig];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
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

id objc_msgSend_daysEligible(void *a1, const char *a2, ...)
{
  return [a1 daysEligible];
}

id objc_msgSend_defaultDevice(void *a1, const char *a2, ...)
{
  return [a1 defaultDevice];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceFlags(void *a1, const char *a2, ...)
{
  return [a1 deviceFlags];
}

id objc_msgSend_deviceProvider(void *a1, const char *a2, ...)
{
  return [a1 deviceProvider];
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return [a1 deviceType];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_eraseAllFollowUpDismissals(void *a1, const char *a2, ...)
{
  return [a1 eraseAllFollowUpDismissals];
}

id objc_msgSend_followUpPostInProgress(void *a1, const char *a2, ...)
{
  return [a1 followUpPostInProgress];
}

id objc_msgSend_followUpPostTimer(void *a1, const char *a2, ...)
{
  return [a1 followUpPostTimer];
}

id objc_msgSend_getScheduledActivityDateAndKey(void *a1, const char *a2, ...)
{
  return [a1 getScheduledActivityDateAndKey];
}

id objc_msgSend_getValidServerVersionCache(void *a1, const char *a2, ...)
{
  return [a1 getValidServerVersionCache];
}

id objc_msgSend_headerDescription(void *a1, const char *a2, ...)
{
  return [a1 headerDescription];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isDeviceCountryEligibleForIntervalEvent(void *a1, const char *a2, ...)
{
  return [a1 isDeviceCountryEligibleForIntervalEvent];
}

id objc_msgSend_isExecuting(void *a1, const char *a2, ...)
{
  return [a1 isExecuting];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return [a1 isFileURL];
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return [a1 isInternal];
}

id objc_msgSend_isSignedInToiCloud(void *a1, const char *a2, ...)
{
  return [a1 isSignedInToiCloud];
}

id objc_msgSend_localeDidChange(void *a1, const char *a2, ...)
{
  return [a1 localeDidChange];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localeIdentifier];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_migrationVersion(void *a1, const char *a2, ...)
{
  return [a1 migrationVersion];
}

id objc_msgSend_monitorForScheduledActivity(void *a1, const char *a2, ...)
{
  return [a1 monitorForScheduledActivity];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_outReachTimer(void *a1, const char *a2, ...)
{
  return [a1 outReachTimer];
}

id objc_msgSend_outreachInProgress(void *a1, const char *a2, ...)
{
  return [a1 outreachInProgress];
}

id objc_msgSend_pairNotifyToken(void *a1, const char *a2, ...)
{
  return [a1 pairNotifyToken];
}

id objc_msgSend_pairedBTDevices(void *a1, const char *a2, ...)
{
  return [a1 pairedBTDevices];
}

id objc_msgSend_pairedBTPioneerDevices(void *a1, const char *a2, ...)
{
  return [a1 pairedBTPioneerDevices];
}

id objc_msgSend_pairedWatches(void *a1, const char *a2, ...)
{
  return [a1 pairedWatches];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return [a1 pathExtension];
}

id objc_msgSend_pendingFollowUpCount(void *a1, const char *a2, ...)
{
  return [a1 pendingFollowUpCount];
}

id objc_msgSend_performMigrationIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 performMigrationIfNeeded];
}

id objc_msgSend_preferredLocale(void *a1, const char *a2, ...)
{
  return [a1 preferredLocale];
}

id objc_msgSend_primaryFUPEligibleDevices(void *a1, const char *a2, ...)
{
  return [a1 primaryFUPEligibleDevices];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_proximityPairingSubType(void *a1, const char *a2, ...)
{
  return [a1 proximityPairingSubType];
}

id objc_msgSend_readAPSSupportedOverride(void *a1, const char *a2, ...)
{
  return [a1 readAPSSupportedOverride];
}

id objc_msgSend_readULWebURLOverride(void *a1, const char *a2, ...)
{
  return [a1 readULWebURLOverride];
}

id objc_msgSend_readWebURLOverride(void *a1, const char *a2, ...)
{
  return [a1 readWebURLOverride];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requiresNetwork(void *a1, const char *a2, ...)
{
  return [a1 requiresNetwork];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_scIntervalInDays(void *a1, const char *a2, ...)
{
  return [a1 scIntervalInDays];
}

id objc_msgSend_scIntervalPairedDeviceAllowed(void *a1, const char *a2, ...)
{
  return [a1 scIntervalPairedDeviceAllowed];
}

id objc_msgSend_scheduledActivityDate(void *a1, const char *a2, ...)
{
  return [a1 scheduledActivityDate];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return [a1 sessionID];
}

id objc_msgSend_sha256Hash(void *a1, const char *a2, ...)
{
  return [a1 sha256Hash];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return [a1 sharedProvider];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return [a1 sharedSession];
}

id objc_msgSend_sharedSubscriber(void *a1, const char *a2, ...)
{
  return [a1 sharedSubscriber];
}

id objc_msgSend_shouldDefer(void *a1, const char *a2, ...)
{
  return [a1 shouldDefer];
}

id objc_msgSend_shouldTriggerWarrantyDownload(void *a1, const char *a2, ...)
{
  return [a1 shouldTriggerWarrantyDownload];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return [a1 subscriptions];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_unpairNotifyToken(void *a1, const char *a2, ...)
{
  return [a1 unpairNotifyToken];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_warranty(void *a1, const char *a2, ...)
{
  return [a1 warranty];
}

id objc_msgSend_warrantyProvider(void *a1, const char *a2, ...)
{
  return [a1 warrantyProvider];
}

id objc_msgSend_watchDeviceWithName_serialNumber_activationDate_isActive_productID_productName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "watchDeviceWithName:serialNumber:activationDate:isActive:productID:productName:");
}