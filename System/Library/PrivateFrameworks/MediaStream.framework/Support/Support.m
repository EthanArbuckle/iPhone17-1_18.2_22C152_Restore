void sub_100004960(id a1)
{
  uint8_t v1[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Checking for idle on main loop", v1, 2u);
  }
}

OS_xpc_object *__cdecl sub_1000049C0(id a1, NSDate *a2)
{
  v2 = a2;
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  v4 = (const char *)kBackgroundTaskAgentJobWindowStartTime;
  [(NSDate *)v2 timeIntervalSinceReferenceDate];
  xpc_dictionary_set_double(v3, v4, v5);
  v6 = (const char *)kBackgroundTaskAgentJobWindowEndTime;
  [(NSDate *)v2 timeIntervalSinceReferenceDate];
  double v8 = v7;

  xpc_dictionary_set_double(v3, v6, v8 + 86400.0);
  xpc_dictionary_set_BOOL(v3, kBackgroundTaskAgentNetworkRequired, 1);
  xpc_dictionary_set_BOOL(v3, kBackgroundTaskAgentCellularAllowed, 1);
  xpc_dictionary_set_BOOL(v3, kBackgroundTaskAgentAllowedDuringRoaming, 1);
  xpc_dictionary_set_double(v3, kBackgroundTaskAgentRequiredBatteryLevel, 20.0);

  return (OS_xpc_object *)v3;
}

void sub_10000558C(uint64_t a1)
{
  if (MKBDeviceUnlockedSinceBoot() == 1)
  {
    v2 = *(NSObject **)(a1 + 32);
    dispatch_semaphore_signal(v2);
  }
  else
  {
    NSLog(@"Device is locked - waiting\n");
  }
}

uint64_t sub_1000055E4(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) == a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_10000560C(uint64_t a1)
{
  uint64_t result = notify_cancel(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

void sub_100005648(id a1)
{
  byte_10001E381 = os_variant_has_internal_diagnostics();
}

BOOL sub_100005670(id a1, NSString *a2, unint64_t a3, BOOL *a4)
{
  v4 = a2;
  if ([(NSString *)v4 hasPrefix:@"-"]) {
    unsigned __int8 v5 = [(NSString *)v4 hasSuffix:@"com.apple.CoreData.ConcurrencyDebug"];
  }
  else {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

uint64_t start()
{
  _set_user_dir_suffix();
  if (MKBDeviceUnlockedSinceBoot() != 1)
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    int v34 = 0;
    dispatch_semaphore_t v1 = dispatch_semaphore_create(0);
    v2 = dispatch_queue_create("com.apple.mstreamd.wait-unlock", 0);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_10000558C;
    v38[3] = &unk_100018C28;
    xpc_object_t v3 = v1;
    v39 = v3;
    v4 = objc_retainBlock(v38);
    unsigned __int8 v5 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    v6 = (int *)(v32 + 3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000055E4;
    handler[3] = &unk_1000188F0;
    v37 = &v31;
    double v7 = v4;
    id v36 = v7;
    uint64_t v8 = notify_register_dispatch(v5, v6, v2, handler);
    if (v8)
    {
      NSLog(@"can't register notifications, status %d", v8);
      exit(0);
    }
    dispatch_async(v2, v7);
    dispatch_semaphore_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000560C;
    block[3] = &unk_100018918;
    block[4] = &v31;
    dispatch_sync(v2, block);

    _Block_object_dispose(&v31, 8);
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000189B8);
  MSAlbumSharingInitialize();
  MSPathCreateDirectories();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(handler[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "mstreamd starting up.", (uint8_t *)handler, 2u);
  }
  CFPreferencesAppSynchronize(@"com.apple.mediastream.mstreamd");
  CFPropertyListRef v9 = CFPreferencesCopyAppValue(@"forceProtocolVersion", @"com.apple.mediastream.mstreamd");
  if (v9) {
    _MSSPCForcedProtocolVersionString = v9;
  }
  XPCSetLogBlocks();
  v10 = objc_alloc_init(MSIOSAlbumSharingDaemon);
  _MSASSetDaemon();
  v11 = objc_alloc_init(MediaStreamMonitor);
  [(MediaStreamMonitor *)v11 setAlbumSharingDaemon:v10];
  [(MSIOSAlbumSharingDaemon *)v10 setDelegate:v11];
  [(MSIOSAlbumSharingDaemon *)v10 start];
  if (qword_10001E388 != -1) {
    dispatch_once(&qword_10001E388, &stru_100018938);
  }
  if (byte_10001E381)
  {
    v13 = +[NSProcessInfo processInfo];
    v14 = [v13 arguments];

    v15 = (char *)[v14 indexOfObjectPassingTest:&stru_100018978];
    if (v15 == (char *)0x7FFFFFFFFFFFFFFFLL || [v14 count] <= v15 + 1)
    {
      v19 = +[NSUserDefaults standardUserDefaults];
      [v19 removeObjectForKey:@"com.apple.CoreData.ConcurrencyDebug"];
    }
    else
    {
      v16 = objc_msgSend(v14, "objectAtIndexedSubscript:");
      BOOL v17 = [v16 intValue] == 0;

      v18 = +[NSUserDefaults standardUserDefaults];
      [v18 removeObjectForKey:@"com.apple.CoreData.ConcurrencyDebug"];

      if (v17) {
        goto LABEL_17;
      }
    }
    v20 = +[NSUserDefaults standardUserDefaults];
    v38[0] = @"com.apple.CoreData.ConcurrencyDebug";
    handler[0] = &__kCFBooleanTrue;
    v21 = +[NSDictionary dictionaryWithObjects:handler forKeys:v38 count:1];
    [v20 registerDefaults:v21];

LABEL_17:
  }
  v22 = v10;
  BackgroundTaskAgentInit();

  if ((byte_10001E380 & 1) == 0)
  {
    while (1)
    {
      v23 = +[NSRunLoop currentRunLoop];
      v24 = +[NSDate distantFuture];
      unsigned __int8 v25 = [v23 runMode:NSDefaultRunLoopMode beforeDate:v24];

      if ((v25 & 1) == 0) {
        break;
      }
      if (byte_10001E380 == 1) {
        goto LABEL_23;
      }
    }
    byte_10001E380 = 1;
  }
LABEL_23:
  [(MSIOSAlbumSharingDaemon *)v22 shutDownCompletionBlock:&stru_100018A80];
  v26 = +[NSTimer timerWithTimeInterval:v11 target:"doNothingTimer:" selector:0 userInfo:1 repeats:10.0];
  v27 = +[NSRunLoop currentRunLoop];
  [v27 addTimer:v26 forMode:NSRunLoopCommonModes];

  v28 = +[NSRunLoop currentRunLoop];
  [v28 run];

  return 0;
}

void sub_100005CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005D0C(uint64_t a1, const char *a2, void *a3)
{
  id v5 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v13 = 136315138;
    *(void *)&v13[4] = a2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Got notification for job %s", v13, 0xCu);
  }
  if (!strcmp(a2, "com.apple.mediastream.mstreamd.as.wakeup"))
  {
    int64_t int64 = xpc_dictionary_get_int64(v5, kBackgroundTaskAgentJobStatus);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v13 = 134217984;
      *(void *)&v13[4] = int64;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Background task agent sent Shared Photo Stream event status: %llu...", v13, 0xCu);
    }
    BOOL v11 = xpc_dictionary_get_BOOL(v5, kBackgroundTaskAgentJobExpired);
    if (int64 == 2 || v11)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        CFPropertyListRef v9 = "...checking for pending Shared Photo Stream activities.";
        goto LABEL_19;
      }
LABEL_20:
      objc_msgSend(*(id *)(a1 + 32), "retryOutstandingActivities", *(void *)v13);
      goto LABEL_26;
    }
    if (int64 == 1)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Background task agent could not schedule the next Shared Photo Stream task.", v13, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "...ignoring.", v13, 2u);
    }
  }
  else if (!strcmp(a2, "com.apple.mediastream.mstreamd.pluggedin"))
  {
    int64_t v6 = xpc_dictionary_get_int64(v5, kBackgroundTaskAgentJobStatus);
    BOOL v7 = xpc_dictionary_get_BOOL(v5, kBackgroundTaskAgentJobExpired);
    if (v6 == 2 || v7)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        CFPropertyListRef v9 = "Checking for pending activities because external power has been applied.";
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, v9, v13, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
  }
LABEL_26:
}

void sub_100005FAC(id a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_semaphore_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "mstreamd shutting down.", v1, 2u);
  }
  exit(0);
}

void sub_100006004(id a1, int a2, NSString *a3, char *a4)
{
  uint64_t v5 = *(void *)&a2;
  CFPropertyListRef v9 = a3;
  int64_t v6 = MSPlatform();
  unsigned int v7 = [v6 shouldLogAtLevel:v5];

  if (v7)
  {
    uint64_t v8 = MSPlatform();
    [v8 logFacility:0 level:v5 format:v9 args:a4];
  }
}

BOOL sub_100006098(id a1, int a2)
{
  uint64_t v2 = *(void *)&a2;
  xpc_object_t v3 = MSPlatform();
  LOBYTE(v2) = [v3 shouldLogAtLevel:v2];

  return v2;
}

void sub_1000060D8(id a1, OS_xpc_object *a2)
{
}

id sub_1000064DC(uint64_t a1)
{
  [*(id *)(a1 + 32) reenqueueQuarantinedActivitiesWithReason:@"Power budget got significant change"];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 retryOutstandingActivities];
}

id sub_1000067F0(void *a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000068AC;
  block[3] = &unk_100018C28;
  id v6 = a1;
  uint64_t v1 = qword_10001E398;
  id v2 = v6;
  if (v1 != -1) {
    dispatch_once(&qword_10001E398, block);
  }
  id v3 = (id)qword_10001E390;

  return v3;
}

void sub_1000068AC()
{
  MSPathSubscribeDirForPersonID();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"powerBudget.plist"];
  uint64_t v1 = (void *)qword_10001E390;
  qword_10001E390 = v0;
}

id sub_1000081D4(uint64_t a1)
{
  [*(id *)(a1 + 32) reenqueueQuarantinedActivitiesWithReason:@"Authentication changed"];
  id v2 = *(void **)(a1 + 32);

  return [v2 retryOutstandingActivities];
}

void sub_1000086DC(uint64_t a1)
{
  id v2 = +[MSBatteryPowerMonitor defaultMonitor];
  unsigned int v3 = [v2 isExternalPowerConnected];

  if (v3)
  {
    long long v24 = 0uLL;
    long long v25 = 0uLL;
    long long v22 = 0uLL;
    long long v23 = 0uLL;
    v4 = [*(id *)(a1 + 32) personIDToPowerBudgetMap];
    uint64_t v5 = [v4 allValues];

    id v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v23;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * i) didBeginExternalPower];
        }
        id v7 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v7);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008910;
    block[3] = &unk_100018C28;
    id v21 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v10 = v21;
  }
  else
  {
    long long v18 = 0uLL;
    long long v19 = 0uLL;
    long long v16 = 0uLL;
    long long v17 = 0uLL;
    BOOL v11 = objc_msgSend(*(id *)(a1 + 32), "personIDToPowerBudgetMap", 0);
    v10 = [v11 allValues];

    id v12 = [v10 countByEnumeratingWithState:&v16 objects:v26 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v17;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * (void)j) didEndExternalPower];
        }
        id v13 = [v10 countByEnumeratingWithState:&v16 objects:v26 count:16];
      }
      while (v13);
    }
  }
}

id sub_100008910(uint64_t a1)
{
  return [*(id *)(a1 + 32) retryOutstandingActivities];
}

void sub_10000913C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) powerBudgetPersistedParameters];
  if (!v2
    || (unsigned int v3 = (void *)v2,
        [*(id *)(a1 + 32) powerBudgetPersistedParameters],
        v4 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v5 = [v4 isEqualToDictionary:*(void *)(a1 + 40)],
        v4,
        v3,
        (v5 & 1) == 0))
  {
    [*(id *)(a1 + 32) setPowerBudgetPersistedParameters:*(void *)(a1 + 40)];
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v8 = [*(id *)(a1 + 48) personID];
    [v6 setPersistentObject:v7 forKey:@"MSIOSAlbumSharingDaemon.powerBudgetParams" personID:v8];
  }
}

void sub_100009EE0(id *a1)
{
  uint64_t v2 = [a1[4] objectForKey:@"albumData"];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v3 = objc_opt_class();
      uint64_t v4 = objc_opt_class();
      uint64_t v5 = objc_opt_class();
      uint64_t v6 = objc_opt_class();
      uint64_t v7 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v3, v4, v5, v6, objc_opt_class(), 0);
      id v16 = 0;
      id v8 = +[NSKeyedUnarchiver _strictlyUnarchivedObjectOfClasses:v7 fromData:v2 error:&v16];
      id v9 = v16;

      if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v9;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to decode album information in incoming message: %@", buf, 0xCu);
        }
        goto LABEL_22;
      }
      v10 = [a1[4] objectForKey:@"type"];
      if (!v10) {
        goto LABEL_8;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v10;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to decode album type in incoming message: %@", buf, 0xCu);
        }
        goto LABEL_21;
      }
      if (![v10 isEqualToString:@"new"])
      {
        unsigned int v11 = [v10 isEqualToString:@"delete"];
        BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
        if (v11)
        {
          if (v12)
          {
            *(_DWORD *)buf = 138412290;
            id v18 = v8;
            _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Removing album: %@", buf, 0xCu);
          }
          id v13 = a1[6];
          uint64_t v14 = [v8 GUID];
          [v13 deleteAlbumWithGUID:v14 inviterAddress:a1[5]];
        }
        else if (v12)
        {
          *(_DWORD *)buf = 138543618;
          id v18 = v10;
          __int16 v19 = 2112;
          v20 = v8;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Unknown operation %{public}@ for %@", buf, 0x16u);
        }
      }
      else
      {
LABEL_8:
        [v8 setRelationshipState:1];
        if ([a1[5] length])
        {
          [v8 setMetadataValue:a1[5] forKey:kMSASAlbumMetadataInviterAddressKey];
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          id v15 = a1[5];
          *(_DWORD *)buf = 138412290;
          id v18 = v15;
          _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to get inviter address from %@", buf, 0xCu);
        }
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v8;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "Adding new pending album: %@", buf, 0xCu);
        }
        [a1[6] addAlbum:v8];
      }
LABEL_21:

LABEL_22:
      goto LABEL_23;
    }
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to decode album data in incoming message: %@", buf, 0xCu);
  }
LABEL_23:
}

void sub_10000A530(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2114;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%{public}@: Client disconnected: %{public}@", (uint8_t *)&v4, 0x16u);
  }
}

void sub_10000A700(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v145 = v2;
    __int16 v146 = 2114;
    uint64_t v147 = v3;
    __int16 v148 = 2114;
    uint64_t v149 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%{public}@: Serving message %{public}@ from client %{public}@", buf, 0x20u);
  }
  uint64_t v5 = MSASPlatform();
  __int16 v6 = [v5 albumSharingDaemon];

  if ([*(id *)(a1 + 40) isEqualToString:kMSASNextActivityDateFn])
  {
    uint64_t v7 = [v6 nextActivityDate];
    id v8 = *(void **)(a1 + 56);
    id v9 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v7, kMSASRetvalKey, 0);
    v10 = v8;
LABEL_5:
    [v10 sendReply:v9];
LABEL_6:

LABEL_7:
    goto LABEL_27;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASIsInRetryStateFn])
  {
    id v11 = [v6 isInRetryState];
    BOOL v12 = *(void **)(a1 + 56);
    uint64_t v13 = +[NSNumber numberWithBool:v11];
LABEL_10:
    uint64_t v14 = (void *)v13;
    id v15 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v13, kMSASRetvalKey, 0);
    [v12 sendReply:v15];

    goto LABEL_27;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASRetryOutstandingActivitiesFn])
  {
    [v6 retryOutstandingActivities];
LABEL_26:
    [*(id *)(a1 + 56) sendReply:0];
    goto LABEL_27;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASRetryOutstandingActivitiesForPersonIDFn])
  {
    uint64_t v7 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      [v6 retryOutstandingActivitiesForPersonID:v7];
    }
    else
    {
      long long v17 = +[NSString stringWithFormat:@"%@: Failed to properly decode personID from incoming message in %@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v145 = v17;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }
      NSErrorUserInfoKey v142 = NSLocalizedDescriptionKey;
      v143 = v17;
      id v18 = +[NSDictionary dictionaryWithObjects:&v143 forKeys:&v142 count:1];
      __int16 v19 = +[NSError errorWithDomain:@"AlbumSharingDaemon" code:0 userInfo:v18];

      uint64_t v140 = kMSASErrorKey;
      v141 = v19;
      v20 = +[NSDictionary dictionaryWithObjects:&v141 forKeys:&v140 count:1];
      [*(id *)(a1 + 56) sendReply:v20];
    }
    [*(id *)(a1 + 56) sendReply:0];
    goto LABEL_7;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASCancelActivitiesFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    [v6 cancelActivitiesForPersonID:v16];
LABEL_25:

    goto LABEL_26;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASPushFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    [v6 pollForSubscriptionUpdatesTriggeredByPushNotificationForPersonID:v16];
    goto LABEL_25;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAlbumGUIDsFn])
  {
    id v21 = [*(id *)(a1 + 32) workQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000CA60;
    block[3] = &unk_100018B20;
    id v137 = v6;
    id v138 = *(id *)(a1 + 64);
    id v139 = *(id *)(a1 + 56);
    dispatch_async(v21, block);

    long long v22 = v137;
LABEL_48:

    goto LABEL_27;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAlbumWithGUIDFn])
  {
    long long v23 = [*(id *)(a1 + 32) workQueue];
    v132[0] = _NSConcreteStackBlock;
    v132[1] = 3221225472;
    v132[2] = sub_10000CBEC;
    v132[3] = &unk_100018B20;
    id v133 = v6;
    id v134 = *(id *)(a1 + 64);
    id v135 = *(id *)(a1 + 56);
    dispatch_async(v23, v132);

    long long v22 = v133;
    goto LABEL_48;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAccessControlGUIDsFn])
  {
    long long v24 = [*(id *)(a1 + 32) workQueue];
    v128[0] = _NSConcreteStackBlock;
    v128[1] = 3221225472;
    v128[2] = sub_10000CCD8;
    v128[3] = &unk_100018B20;
    id v129 = v6;
    id v130 = *(id *)(a1 + 64);
    id v131 = *(id *)(a1 + 56);
    dispatch_async(v24, v128);

    long long v22 = v129;
    goto LABEL_48;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAccessControlWithGUIDFn])
  {
    long long v25 = [*(id *)(a1 + 32) workQueue];
    v124[0] = _NSConcreteStackBlock;
    v124[1] = 3221225472;
    v124[2] = sub_10000CE8C;
    v124[3] = &unk_100018B20;
    id v125 = v6;
    id v126 = *(id *)(a1 + 64);
    id v127 = *(id *)(a1 + 56);
    dispatch_async(v25, v124);

    long long v22 = v125;
    goto LABEL_48;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelInvitationGUIDsFn])
  {
    v26 = [*(id *)(a1 + 32) workQueue];
    v120[0] = _NSConcreteStackBlock;
    v120[1] = 3221225472;
    v120[2] = sub_10000CF78;
    v120[3] = &unk_100018B20;
    id v121 = v6;
    id v122 = *(id *)(a1 + 64);
    id v123 = *(id *)(a1 + 56);
    dispatch_async(v26, v120);

    long long v22 = v121;
    goto LABEL_48;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelInvitationWithGUIDFn])
  {
    v27 = [*(id *)(a1 + 32) workQueue];
    v116[0] = _NSConcreteStackBlock;
    v116[1] = 3221225472;
    v116[2] = sub_10000D104;
    v116[3] = &unk_100018B20;
    id v117 = v6;
    id v118 = *(id *)(a1 + 64);
    id v119 = *(id *)(a1 + 56);
    dispatch_async(v27, v116);

    long long v22 = v117;
    goto LABEL_48;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAssetCollectionGUIDsFn])
  {
    v28 = [*(id *)(a1 + 32) workQueue];
    v112[0] = _NSConcreteStackBlock;
    v112[1] = 3221225472;
    v112[2] = sub_10000D1F0;
    v112[3] = &unk_100018B20;
    id v113 = v6;
    id v114 = *(id *)(a1 + 64);
    id v115 = *(id *)(a1 + 56);
    dispatch_async(v28, v112);

    long long v22 = v113;
    goto LABEL_48;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAssetCollectionWithGUIDFn])
  {
    v29 = [*(id *)(a1 + 32) workQueue];
    v108[0] = _NSConcreteStackBlock;
    v108[1] = 3221225472;
    v108[2] = sub_10000D3A4;
    v108[3] = &unk_100018B20;
    id v109 = v6;
    id v110 = *(id *)(a1 + 64);
    id v111 = *(id *)(a1 + 56);
    dispatch_async(v29, v108);

    long long v22 = v109;
    goto LABEL_48;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelVideoURLForAssetCollectionWithGUIDFn])
  {
    v30 = [*(id *)(a1 + 32) workQueue];
    v104[0] = _NSConcreteStackBlock;
    v104[1] = 3221225472;
    v104[2] = sub_10000D490;
    v104[3] = &unk_100018B20;
    id v105 = v6;
    id v106 = *(id *)(a1 + 64);
    id v107 = *(id *)(a1 + 56);
    dispatch_async(v30, v104);

    long long v22 = v105;
    goto LABEL_48;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelVideoURLsForAssetCollectionWithGUIDFn])
  {
    uint64_t v31 = [*(id *)(a1 + 32) workQueue];
    v100[0] = _NSConcreteStackBlock;
    v100[1] = 3221225472;
    v100[2] = sub_10000D580;
    v100[3] = &unk_100018B20;
    id v101 = v6;
    id v102 = *(id *)(a1 + 64);
    id v103 = *(id *)(a1 + 56);
    dispatch_async(v31, v100);

    long long v22 = v101;
    goto LABEL_48;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelIsAssetCollectionMarkedAsViewedFn])
  {
    v32 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    uint64_t v7 = [v6 modelForPersonID:v32];

    uint64_t v33 = [*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDKey];
    id v9 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v7 isAssetCollectionWithGUIDMarkedAsUnviewed:v33]);

    int v34 = *(void **)(a1 + 56);
    v35 = +[NSDictionary dictionaryWithObject:v9 forKey:kMSASRetvalKey];
    [v34 sendReply:v35];

    goto LABEL_6;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelCommentGUIDsFn])
  {
    id v36 = [*(id *)(a1 + 32) workQueue];
    v96[0] = _NSConcreteStackBlock;
    v96[1] = 3221225472;
    v96[2] = sub_10000D6A4;
    v96[3] = &unk_100018B20;
    id v97 = v6;
    id v98 = *(id *)(a1 + 64);
    id v99 = *(id *)(a1 + 56);
    dispatch_async(v36, v96);

    long long v22 = v97;
    goto LABEL_48;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelCommentWithGUIDFn])
  {
    v37 = [*(id *)(a1 + 32) workQueue];
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_10000D874;
    v92[3] = &unk_100018B20;
    id v93 = v6;
    id v94 = *(id *)(a1 + 64);
    id v95 = *(id *)(a1 + 56);
    dispatch_async(v37, v92);

    long long v22 = v93;
    goto LABEL_48;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelServerSideConfigFn])
  {
    v38 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    uint64_t v7 = [v6 serverSideConfigurationForPersonID:v38];

    v39 = +[NSMutableDictionary dictionaryWithCapacity:1];
    id v9 = v39;
    if (v7) {
      [v39 setObject:v7 forKey:kMSASRetvalKey];
    }
    v10 = *(void **)(a1 + 56);
    goto LABEL_5;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelFetchClientOrgKeyFn])
  {
    v40 = [*(id *)(a1 + 64) objectForKey:kMSASRecordID];
    v41 = [*(id *)(a1 + 64) objectForKey:kMSASZoneName];
    v42 = [*(id *)(a1 + 64) objectForKey:kMSASOwnerUserID];
    v43 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v44 = [v6 clientOrgKeyForRecordID:v40 zoneName:v41 ownerUserID:v42 personID:v43];

    v45 = *(void **)(a1 + 56);
    v46 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v44, kMSASRetvalKey, 0);
    [v45 sendReply:v46];

    goto LABEL_27;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRefreshFn])
  {
    dispatch_time_t v47 = dispatch_time(0, 1000000000);
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_10000D960;
    v89[3] = &unk_100018BD8;
    id v90 = v6;
    id v91 = *(id *)(a1 + 64);
    dispatch_after(v47, (dispatch_queue_t)&_dispatch_main_q, v89);
    [*(id *)(a1 + 56) sendReply:0];

    long long v22 = v90;
    goto LABEL_48;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRefreshContentOfAlbumWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASResetSyncKey];
    id v49 = [v48 BOOLValue];
    v50 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v51 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 refreshContentOfAlbumWithGUID:v16 resetSync:v49 personID:v50 info:v51];
LABEL_65:

LABEL_66:
LABEL_70:

    goto LABEL_25;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRefreshAccessControlListOfAlbumWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 refreshAccessControlListOfAlbumWithGUID:v16 personID:v48 info:v52];
LABEL_69:

    goto LABEL_70;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRefreshCommentsForAssetCollectionWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASResetSyncKey];
    id v53 = [v48 BOOLValue];
    v50 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v51 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 refreshCommentsForAssetCollectionWithGUID:v16 resetSync:v53 personID:v50 info:v51];
    goto LABEL_65;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAddAlbumFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 addAlbum:v16 personID:v48 info:v52];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelModifyAlbumMetadataFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 modifyAlbumMetadata:v16 personID:v48 info:v52];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelSetClientOrgKeyForAlbumWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASClientOrgKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v54 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 setClientOrgKey:v16 forAlbumWithGUID:v48 personID:v52 info:v54];
LABEL_79:

    goto LABEL_69;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelSetMigrationMarkerFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASPVMigrationMarkerKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    [v6 setMigrationMarker:v16 personID:v48];
    goto LABEL_70;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelDeleteAlbumWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 deleteAlbumWithGUID:v16 personID:v48 info:v52];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelMarkAlbumGUIDAsViewedFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASMoveLastViewedAssetCollectionKey];
    id v55 = [v52 BOOLValue];
    v56 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 markAlbumGUIDAsViewed:v16 personID:v48 moveLastViewedAssetCollectionMarker:v55 info:v56];

    goto LABEL_69;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelSubscribeToAlbumWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 subscribeToAlbumWithGUID:v16 personID:v48 info:v52];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelUnsubscribeFromAlbumWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 unsubscribeFromAlbumWithGUID:v16 personID:v48 info:v52];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelMarkAsSpamInvitationWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASInvitationGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    [v6 markAsSpamInvitationWithGUID:v16 personID:v48];
    goto LABEL_70;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelMarkAsSpamAlbumWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    [v6 markAsSpamAlbumWithGUID:v16 personID:v48];
    goto LABEL_70;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelMarkAsSpamInvitationWithTokenFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASInvitationTokenKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    [v6 markAsSpamInvitationWithToken:v16 personID:v48];
    goto LABEL_70;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAcceptInvitationWithTokenFn])
  {
    v57 = [*(id *)(a1 + 64) objectForKey:kMSASInvitationTokenKey];
    v58 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v59 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    v87[0] = _NSConcreteStackBlock;
    v87[1] = 3221225472;
    v87[2] = sub_10000DA1C;
    v87[3] = &unk_100018C00;
    id v88 = *(id *)(a1 + 56);
    [v6 acceptInvitationWithToken:v57 personID:v58 info:v59 completionBlock:v87];

    long long v22 = v88;
    goto LABEL_48;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAcceptInvitationWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASInvitationGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 acceptInvitationWithGUID:v16 personID:v48 info:v52];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRejectInvitationWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASInvitationGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 rejectInvitationWithGUID:v16 personID:v48 info:v52];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAddAccessControlsFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASSharingRelationshipsKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v54 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 addAccessControlEntries:v16 toAlbumWithGUID:v48 personID:v52 info:v54];
    goto LABEL_79;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRemoveAccessControlEntryWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASSharingRelationshipGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 removeAccessControlEntryWithGUID:v16 personID:v48 info:v52];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAddAssetCollectionsFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionsKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v54 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 addAssetCollections:v16 toAlbumWithGUID:v48 personID:v52 info:v54];
    goto LABEL_79;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelDeleteAssetCollectionWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 deleteAssetCollectionWithGUID:v16 personID:v48 info:v52];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelDeleteAssetCollectionsWithGUIDsFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDsKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    [v6 deleteAssetCollectionsWithGUIDs:v16 personID:v48];
    goto LABEL_70;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelMarkCommentsForAssetCollectionWithGUIDAsViewedFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASLastViewedDateKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v54 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 markCommentsForAssetCollectionWithGUID:v16 asViewedWithLastViewedDate:v48 personID:v52 info:v54];
    goto LABEL_79;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelAddCommentsToAssetCollectionWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASCommentsKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v54 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 addComments:v16 toAssetCollectionWithGUID:v48 personID:v52 info:v54];
    goto LABEL_79;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelDeleteCommentWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASCommentGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASInfoKey];
    [v6 deleteCommentWithGUID:v16 personID:v48 info:v52];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRetrieveAssetsInAlbumWithGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAssetsKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey];
    v52 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    [v6 retrieveAssets:v16 inAlbumWithGUID:v48 personID:v52];
    goto LABEL_69;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelRetrieveAssetsFromAssetCollectionsWithGUIDs])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDsKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASAssetTypeFlagsKey];
    id v60 = [v48 intValue];
    v50 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    [v6 retrieveAssetsInAssetCollectionsWithGUIDs:v16 assetTypeFlags:v60 personID:v50];
    goto LABEL_66;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelForgetEverythingFn])
  {
    uint64_t v61 = kMSASPersonIDKey;
    uint64_t v7 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    if (v7)
    {
      v62 = [*(id *)(a1 + 64) objectForKey:v61];
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472;
      v85[2] = sub_10000DAD8;
      v85[3] = &unk_100018C28;
      v63 = &v86;
      id v86 = *(id *)(a1 + 56);
      [v6 forgetEverythingAboutPersonID:v62 completionBlock:v85];
    }
    else
    {
      v83[0] = _NSConcreteStackBlock;
      v83[1] = 3221225472;
      v83[2] = sub_10000DAE4;
      v83[3] = &unk_100018C28;
      v63 = &v84;
      id v84 = *(id *)(a1 + 56);
      [v6 forgetEverythingCompletionBlock:v83];
    }

    goto LABEL_7;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASSetIsUIForegroundFn])
  {
    [*(id *)(a1 + 32) _handleForegroundPing:*(void *)(a1 + 64) request:*(void *)(a1 + 56)];
    goto LABEL_27;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelActivityIsThrottledByLackOfDiskSpaceFn])
  {
    v64 = MSASPlatform();
    if ([v64 deviceHasEnoughDiskSpaceRemainingToOperate])
    {
      id v65 = 0;
    }
    else
    {
      v66 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
      v67 = [v6 existingModelForPersonID:v66];
      id v65 = [v67 hasEnqueuedActivities];
    }
    BOOL v12 = *(void **)(a1 + 56);
    uint64_t v13 = +[NSNumber numberWithInt:v65];
    goto LABEL_10;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASSetFocusAlbumFn])
  {
    [*(id *)(a1 + 32) _handleFocusAlbum:*(void *)(a1 + 64)];
    goto LABEL_26;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelSetFocusAssetCollectionGUIDFn])
  {
    id v16 = [*(id *)(a1 + 64) objectForKey:kMSASAssetCollectionGUIDKey];
    v48 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    [v6 setFocusAssetCollectionGUID:v16 forPersonID:v48];
    goto LABEL_70;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelSetPublicAccessEnabledFn])
  {
    v68 = [*(id *)(a1 + 64) objectForKey:kMSASEnabledKey];
    id v69 = [v68 BOOLValue];
    v70 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey];
    v71 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v81[0] = _NSConcreteStackBlock;
    v81[1] = 3221225472;
    v81[2] = sub_10000DAF0;
    v81[3] = &unk_100018C50;
    id v82 = *(id *)(a1 + 56);
    [v6 setPublicAccessEnabled:v69 forAlbumWithGUID:v70 personID:v71 completionBlock:v81];

    long long v22 = v82;
    goto LABEL_48;
  }
  if ([*(id *)(a1 + 40) isEqualToString:kMSASModelSetMultipleContributorsEnabledFn])
  {
    v72 = [*(id *)(a1 + 64) objectForKey:kMSASEnabledKey];
    id v73 = [v72 BOOLValue];
    v74 = [*(id *)(a1 + 64) objectForKey:kMSASAlbumGUIDKey];
    v75 = [*(id *)(a1 + 64) objectForKey:kMSASPersonIDKey];
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_10000DB60;
    v79[3] = &unk_100018C50;
    id v80 = *(id *)(a1 + 56);
    [v6 setMultipleContributorsEnabled:v73 forAlbumWithGUID:v74 personID:v75 completionBlock:v79];

    long long v22 = v80;
    goto LABEL_48;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v76 = *(void **)(a1 + 32);
    uint64_t v77 = *(void *)(a1 + 40);
    uint64_t v78 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138543874;
    v145 = v76;
    __int16 v146 = 2114;
    uint64_t v147 = v77;
    __int16 v148 = 2114;
    uint64_t v149 = v78;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%{public}@: Unknown request %{public}@ from client %{public}@. Ignoring.", buf, 0x20u);
  }
LABEL_27:
}

void sub_10000CA60(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey];
  uint64_t v4 = [v2 modelForPersonID:v3];

  uint64_t v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  __int16 v6 = [v4 albumGUIDs];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addObject:*(void *)(*((void *)&v13 + 1) + 8 * (void)v10)];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  id v11 = *(void **)(a1 + 48);
  BOOL v12 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, kMSASRetvalKey, 0);
  [v11 sendReply:v12];
}

void sub_10000CBEC(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey];
  id v8 = [v2 modelForPersonID:v3];

  uint64_t v4 = [*(id *)(a1 + 40) objectForKey:kMSASAlbumGUIDKey];
  uint64_t v5 = [v8 albumWithGUID:v4];

  __int16 v6 = *(void **)(a1 + 48);
  id v7 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, kMSASRetvalKey, 0);
  [v6 sendReply:v7];
}

void sub_10000CCD8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey];
  uint64_t v4 = [v2 modelForPersonID:v3];

  uint64_t v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  __int16 v6 = [*(id *)(a1 + 40) objectForKey:kMSASAlbumGUIDKey];
  id v7 = [v4 accessControlGUIDsForAlbumWithGUID:v6];

  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        [v5 addObject:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  BOOL v12 = *(void **)(a1 + 48);
  long long v13 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, kMSASRetvalKey, 0);
  [v12 sendReply:v13];
}

void sub_10000CE8C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey];
  id v8 = [v2 modelForPersonID:v3];

  uint64_t v4 = [*(id *)(a1 + 40) objectForKey:kMSASAccessControlGUIDKey];
  uint64_t v5 = [v8 accessControlWithGUID:v4];

  __int16 v6 = *(void **)(a1 + 48);
  id v7 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, kMSASRetvalKey, 0);
  [v6 sendReply:v7];
}

void sub_10000CF78(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey];
  uint64_t v4 = [v2 modelForPersonID:v3];

  uint64_t v5 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  __int16 v6 = [v4 invitationGUIDs];
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addObject:*(void *)(*((void *)&v13 + 1) + 8 * (void)v10)];
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  id v11 = *(void **)(a1 + 48);
  BOOL v12 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, kMSASRetvalKey, 0);
  [v11 sendReply:v12];
}

void sub_10000D104(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey];
  id v8 = [v2 modelForPersonID:v3];

  uint64_t v4 = [*(id *)(a1 + 40) objectForKey:kMSASInvitationGUIDKey];
  uint64_t v5 = [v8 invitationWithGUID:v4];

  __int16 v6 = *(void **)(a1 + 48);
  id v7 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, kMSASRetvalKey, 0);
  [v6 sendReply:v7];
}

void sub_10000D1F0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey];
  uint64_t v4 = [v2 modelForPersonID:v3];

  uint64_t v5 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  __int16 v6 = [*(id *)(a1 + 40) objectForKey:kMSASAlbumGUIDKey];
  id v7 = [v4 assetCollectionGUIDsInAlbumWithGUID:v6];

  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        [v5 addObject:*(void *)(*((void *)&v14 + 1) + 8 * (void)v11)];
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  BOOL v12 = *(void **)(a1 + 48);
  long long v13 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, kMSASRetvalKey, 0);
  [v12 sendReply:v13];
}

void sub_10000D3A4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey];
  id v8 = [v2 modelForPersonID:v3];

  uint64_t v4 = [*(id *)(a1 + 40) objectForKey:kMSASAssetCollectionGUIDKey];
  uint64_t v5 = [v8 assetCollectionWithGUID:v4];

  __int16 v6 = *(void **)(a1 + 48);
  id v7 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, kMSASRetvalKey, 0);
  [v6 sendReply:v7];
}

void sub_10000D490(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey];
  uint64_t v4 = [v2 modelForPersonID:v3];

  uint64_t v5 = [*(id *)(a1 + 40) objectForKey:kMSASAssetCollectionGUIDKey];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000DCB8;
  v6[3] = &unk_100018B88;
  id v7 = *(id *)(a1 + 48);
  [v4 videoURLForAssetCollectionWithGUID:v5 completionBlock:v6];
}

void sub_10000D580(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey];
  uint64_t v4 = [v2 modelForPersonID:v3];

  uint64_t v5 = [*(id *)(a1 + 40) objectForKey:kMSASAssetCollectionGUIDKey];
  __int16 v6 = [*(id *)(a1 + 40) objectForKey:kMSAssetMediaAssetTypeKey];
  id v7 = [v6 unsignedIntegerValue];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000DBD0;
  v8[3] = &unk_100018BB0;
  id v9 = *(id *)(a1 + 48);
  [v4 videoURLsForAssetCollectionWithGUID:v5 forMediaAssetType:v7 completionBlock:v8];
}

void sub_10000D6A4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey];
  uint64_t v4 = [v2 modelForPersonID:v3];

  uint64_t v5 = +[NSMutableArray array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  __int16 v6 = [*(id *)(a1 + 40) objectForKey:kMSASAssetCollectionGUIDKey];
  id v7 = [v4 commentsForAssetCollectionWithGUID:v6];

  id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      id v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        BOOL v12 = [*(id *)(*((void *)&v15 + 1) + 8 * (void)v11) GUID];
        [v5 addObject:v12];

        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  long long v13 = *(void **)(a1 + 48);
  long long v14 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, kMSASRetvalKey, 0);
  [v13 sendReply:v14];
}

void sub_10000D874(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey];
  id v8 = [v2 modelForPersonID:v3];

  uint64_t v4 = [*(id *)(a1 + 40) objectForKey:kMSASCommentGUIDKey];
  uint64_t v5 = [v8 commentWithGUID:v4];

  __int16 v6 = *(void **)(a1 + 48);
  id v7 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, kMSASRetvalKey, 0);
  [v6 sendReply:v7];
}

void sub_10000D960(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) objectForKey:kMSASResetSyncKey];
  id v3 = [v6 BOOLValue];
  uint64_t v4 = [*(id *)(a1 + 40) objectForKey:kMSASPersonIDKey];
  uint64_t v5 = [*(id *)(a1 + 40) objectForKey:kMSASInfoKey];
  [v2 refreshResetSync:v3 personID:v4 info:v5];
}

void sub_10000DA1C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = +[NSMutableDictionary dictionary];
  if (v7) {
    [v6 setObject:v7 forKey:kMSASInfoKey];
  }
  if (v5) {
    [v6 setObject:v5 forKey:kMSASErrorKey];
  }
  [*(id *)(a1 + 32) sendReply:v6];
}

id sub_10000DAD8(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendReply:0];
}

id sub_10000DAE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendReply:0];
}

void sub_10000DAF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", a2, kMSASErrorKey, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 sendReply:v3];
}

void sub_10000DB60(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", a2, kMSASErrorKey, 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 sendReply:v3];
}

void sub_10000DBD0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSMutableDictionary dictionary];
  uint64_t v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKey:kMSASRetvalKey];
  }
  if (v8) {
    [v10 setObject:v8 forKey:kMSASURLExpirationKey];
  }
  if (v11) {
    [v10 setObject:v11 forKey:kMSASErrorKey];
  }
  [*(id *)(a1 + 32) sendReply:v10];
}

void sub_10000DCB8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id v9 = +[NSMutableDictionary dictionary];
  uint64_t v10 = v9;
  if (v7) {
    [v9 setObject:v7 forKey:kMSASRetvalKey];
  }
  if (v8) {
    [v10 setObject:v8 forKey:kMSASURLExpirationKey];
  }
  if (v11) {
    [v10 setObject:v11 forKey:kMSASErrorKey];
  }
  [*(id *)(a1 + 32) sendReply:v10];
}

void sub_10000E2D4(id a1)
{
  qword_10001E3A8 = (uint64_t)dispatch_queue_create("MSMSASServiceConnection work queue", 0);

  _objc_release_x1();
}

void sub_10000E6B4(uint64_t a1)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%{public}@: Shared Streams daemon shutting down.", buf, 0xCu);
  }
  id v3 = [*(id *)(a1 + 32) busyPingTimer];
  [v3 invalidate];

  [*(id *)(a1 + 32) setBusyPingTimer:0];
  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:*(void *)(a1 + 32)];

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E814;
  v7[3] = &unk_100018AF8;
  v7[4] = v5;
  id v8 = *(id *)(a1 + 40);
  [v6 shutDownCompletionBlock:v7];
}

void sub_10000E814(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000E8B8;
  v3[3] = &unk_100018AF8;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  v2.receiver = v1;
  v2.super_class = (Class)MSIOSAlbumSharingDaemon;
  objc_msgSendSuper2(&v2, "shutDownCompletionBlock:", v3);
}

void sub_10000E8B8(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000E940;
  v2[3] = &unk_100018AF8;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

void sub_10000E940(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  objc_super v2 = objc_msgSend(*(id *)(a1 + 32), "personIDToPowerBudgetMap", 0);
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * (void)v6);
        id v8 = [*(id *)(a1 + 32) personIDToPowerBudgetMap];
        id v9 = [v8 objectForKey:v7];

        [v9 shutDown];
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v19 count:16];
    }
    while (v4);
  }

  uint64_t v10 = [*(id *)(a1 + 32) personIDToPowerBudgetMap];
  [v10 removeAllObjects];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Shared Streams daemon has shut down.", buf, 0xCu);
  }
  BOOL v12 = *(void **)(a1 + 40);
  if (v12) {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
}

void sub_10000F384(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void sub_10000F3C0(uint64_t a1, void *a2)
{
  id v3 = [a2 userInfo];
  id v5 = [v3 objectForKey:kMSASServerSideConfigPersonIDKey];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _readPowerBudgetParametersForPersonID:v5];
}

void sub_10000F440(uint64_t a1)
{
  uint64_t v2 = +[MSBatteryPowerMonitor defaultMonitor];
  unsigned int v3 = [v2 isExternalPowerConnected];

  if (v3)
  {
    long long v21 = 0uLL;
    long long v22 = 0uLL;
    long long v19 = 0uLL;
    long long v20 = 0uLL;
    id v4 = [*(id *)(a1 + 32) personIDToPowerBudgetMap];
    id v5 = [v4 allValues];

    id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v20;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) didBeginExternalPower];
        }
        id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v7);
    }
  }
  else
  {
    long long v17 = 0uLL;
    long long v18 = 0uLL;
    long long v15 = 0uLL;
    long long v16 = 0uLL;
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "personIDToPowerBudgetMap", 0);
    id v5 = [v10 allValues];

    id v11 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * (void)j) didEndExternalPower];
        }
        id v12 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
      }
      while (v12);
    }
  }
}

id sub_10000F60C(uint64_t a1)
{
  return [*(id *)(a1 + 32) retryOutstandingActivities];
}

void sub_10000F614(uint64_t a1, void *a2)
{
  id v5 = [a2 object];
  unsigned int v3 = *(void **)(a1 + 32);
  id v4 = [v5 personID];
  [v3 stopAssetDownloadsForPersonID:v4];
}

id sub_10000F680(uint64_t a1)
{
  return [*(id *)(a1 + 32) retryOutstandingActivities];
}

uint64_t BackgroundTaskAgentAddJob()
{
  return _BackgroundTaskAgentAddJob();
}

uint64_t BackgroundTaskAgentCopyJob()
{
  return _BackgroundTaskAgentCopyJob();
}

uint64_t BackgroundTaskAgentInit()
{
  return _BackgroundTaskAgentInit();
}

uint64_t BackgroundTaskAgentRemoveJob()
{
  return _BackgroundTaskAgentRemoveJob();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t IDSCopyRawAddressForDestination()
{
  return _IDSCopyRawAddressForDestination();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

uint64_t MSASPlatform()
{
  return _MSASPlatform();
}

uint64_t MSAlbumSharingInitialize()
{
  return _MSAlbumSharingInitialize();
}

uint64_t MSMSLocalizedString()
{
  return _MSMSLocalizedString();
}

uint64_t MSPathCreateDirectories()
{
  return _MSPathCreateDirectories();
}

uint64_t MSPathSubscribeDirForPersonID()
{
  return _MSPathSubscribeDirForPersonID();
}

uint64_t MSPlatform()
{
  return _MSPlatform();
}

void NSLog(NSString *format, ...)
{
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t XPCSetLogBlocks()
{
  return _XPCSetLogBlocks();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _MSASSetDaemon()
{
  return __MSASSetDaemon();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

uint64_t xpc_connection_get_audit_token()
{
  return _xpc_connection_get_audit_token();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return _xpc_connection_get_pid(connection);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_double(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_GUID(void *a1, const char *a2, ...)
{
  return [a1 GUID];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_XPCForegroundRequestByPersonID(void *a1, const char *a2, ...)
{
  return [a1 XPCForegroundRequestByPersonID];
}

id objc_msgSend__didIdle(void *a1, const char *a2, ...)
{
  return [a1 _didIdle];
}

id objc_msgSend__stopIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 _stopIdleTimer];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_albumGUIDs(void *a1, const char *a2, ...)
{
  return [a1 albumGUIDs];
}

id objc_msgSend_albumSharingDaemon(void *a1, const char *a2, ...)
{
  return [a1 albumSharingDaemon];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_arguments(void *a1, const char *a2, ...)
{
  return [a1 arguments];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_busyPingTimer(void *a1, const char *a2, ...)
{
  return [a1 busyPingTimer];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultMonitor(void *a1, const char *a2, ...)
{
  return [a1 defaultMonitor];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceHasEnoughDiskSpaceRemainingToOperate(void *a1, const char *a2, ...)
{
  return [a1 deviceHasEnoughDiskSpaceRemainingToOperate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didBeginExternalPower(void *a1, const char *a2, ...)
{
  return [a1 didBeginExternalPower];
}

id objc_msgSend_didBeginForegroundFocus(void *a1, const char *a2, ...)
{
  return [a1 didBeginForegroundFocus];
}

id objc_msgSend_didEndExternalPower(void *a1, const char *a2, ...)
{
  return [a1 didEndExternalPower];
}

id objc_msgSend_didEndForegroundFocus(void *a1, const char *a2, ...)
{
  return [a1 didEndForegroundFocus];
}

id objc_msgSend_didReceiveGlobalResetSync(void *a1, const char *a2, ...)
{
  return [a1 didReceiveGlobalResetSync];
}

id objc_msgSend_didReceivePushNotification(void *a1, const char *a2, ...)
{
  return [a1 didReceivePushNotification];
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

id objc_msgSend_fireDate(void *a1, const char *a2, ...)
{
  return [a1 fireDate];
}

id objc_msgSend_foregroundPingTimerByPersonID(void *a1, const char *a2, ...)
{
  return [a1 foregroundPingTimerByPersonID];
}

id objc_msgSend_hasEnqueuedActivities(void *a1, const char *a2, ...)
{
  return [a1 hasEnqueuedActivities];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invitationGUIDs(void *a1, const char *a2, ...)
{
  return [a1 invitationGUIDs];
}

id objc_msgSend_isExternalPowerConnected(void *a1, const char *a2, ...)
{
  return [a1 isExternalPowerConnected];
}

id objc_msgSend_isFileTransferAllowed(void *a1, const char *a2, ...)
{
  return [a1 isFileTransferAllowed];
}

id objc_msgSend_isInRetryState(void *a1, const char *a2, ...)
{
  return [a1 isInRetryState];
}

id objc_msgSend_isPaused(void *a1, const char *a2, ...)
{
  return [a1 isPaused];
}

id objc_msgSend_isWaitingForAuth(void *a1, const char *a2, ...)
{
  return [a1 isWaitingForAuth];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainThread(void *a1, const char *a2, ...)
{
  return [a1 mainThread];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_nextActivityDate(void *a1, const char *a2, ...)
{
  return [a1 nextActivityDate];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_personID(void *a1, const char *a2, ...)
{
  return [a1 personID];
}

id objc_msgSend_personIDForPollingTriggeredByPushNotification(void *a1, const char *a2, ...)
{
  return [a1 personIDForPollingTriggeredByPushNotification];
}

id objc_msgSend_personIDListeningToPushNotification(void *a1, const char *a2, ...)
{
  return [a1 personIDListeningToPushNotification];
}

id objc_msgSend_personIDToPowerBudgetMap(void *a1, const char *a2, ...)
{
  return [a1 personIDToPowerBudgetMap];
}

id objc_msgSend_personIDToPowerBudgetPersistedValuesMap(void *a1, const char *a2, ...)
{
  return [a1 personIDToPowerBudgetPersistedValuesMap];
}

id objc_msgSend_powerBudgetPersistedParameters(void *a1, const char *a2, ...)
{
  return [a1 powerBudgetPersistedParameters];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_publicToken(void *a1, const char *a2, ...)
{
  return [a1 publicToken];
}

id objc_msgSend_pushToken(void *a1, const char *a2, ...)
{
  return [a1 pushToken];
}

id objc_msgSend_rearmAuthenticationAlert(void *a1, const char *a2, ...)
{
  return [a1 rearmAuthenticationAlert];
}

id objc_msgSend_releaseBusy(void *a1, const char *a2, ...)
{
  return [a1 releaseBusy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resetServer(void *a1, const char *a2, ...)
{
  return [a1 resetServer];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_retainBusy(void *a1, const char *a2, ...)
{
  return [a1 retainBusy];
}

id objc_msgSend_retryOutstandingActivities(void *a1, const char *a2, ...)
{
  return [a1 retryOutstandingActivities];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedAlertManager(void *a1, const char *a2, ...)
{
  return [a1 sharedAlertManager];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shutDown(void *a1, const char *a2, ...)
{
  return [a1 shutDown];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_stopAllActivities(void *a1, const char *a2, ...)
{
  return [a1 stopAllActivities];
}

id objc_msgSend_subscriberPluginClass(void *a1, const char *a2, ...)
{
  return [a1 subscriberPluginClass];
}

id objc_msgSend_thePlatform(void *a1, const char *a2, ...)
{
  return [a1 thePlatform];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_toggleAssertion(void *a1, const char *a2, ...)
{
  return [a1 toggleAssertion];
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return [a1 topic];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return [a1 workQueue];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}