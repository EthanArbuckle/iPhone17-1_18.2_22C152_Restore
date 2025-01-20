id sub_100002174(uint64_t a1)
{
  void *v2;
  id v3;
  void v5[6];
  void block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;
  uint64_t vars8;

  if (qword_100011888 != -1) {
    dispatch_once(&qword_100011888, &stru_10000C410);
  }
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000023EC;
  v11 = sub_1000023FC;
  v12 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002404;
  block[3] = &unk_10000C438;
  block[4] = &v7;
  block[5] = a1;
  dispatch_sync((dispatch_queue_t)qword_100011880, block);
  v2 = (void *)v8[5];
  if (!v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100002484;
    v5[3] = &unk_10000C438;
    v5[4] = &v7;
    v5[5] = a1;
    dispatch_barrier_sync((dispatch_queue_t)qword_100011880, v5);
    v2 = (void *)v8[5];
  }
  v3 = v2;
  _Block_object_dispose(&v7, 8);

  return v3;
}

void sub_1000022F0(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.weather.watchapp.nwpdloggingqueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
  v2 = (void *)qword_100011880;
  qword_100011880 = (uint64_t)v1;

  v7[0] = &off_10000CB48;
  v7[1] = &off_10000CB60;
  v8[0] = @"general";
  v8[1] = @"app-workspace-observer";
  v7[2] = &off_10000CB78;
  v8[2] = @"preferences-monitor";
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  v4 = (void *)qword_100011870;
  qword_100011870 = v3;

  uint64_t v5 = +[NSMutableDictionary dictionaryWithCapacity:18];
  v6 = (void *)qword_100011878;
  qword_100011878 = v5;
}

uint64_t sub_1000023EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000023FC(uint64_t a1)
{
}

void sub_100002404(uint64_t a1)
{
  v2 = (void *)qword_100011878;
  id v6 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100002484(uint64_t a1)
{
  v2 = (void *)qword_100011870;
  uint64_t v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  id v13 = [v2 objectForKeyedSubscript:v3];

  if (v13)
  {
    os_log_t v4 = os_log_create("com.apple.weather.watchapp", (const char *)[v13 cStringUsingEncoding:4]);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  uint64_t v9 = v10;
  if (!v10)
  {
    objc_storeStrong(v8, &_os_log_default);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  v11 = (void *)qword_100011878;
  v12 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v11 setObject:v9 forKeyedSubscript:v12];
}

uint64_t sub_100002630()
{
  qword_100011890 = objc_opt_new();
  return _objc_release_x1();
}

BOOL sub_100002788(id a1, LSApplicationProxy *a2, unint64_t a3, BOOL *a4)
{
  os_log_t v4 = [(LSApplicationProxy *)a2 bundleIdentifier];
  unsigned __int8 v5 = [@"com.apple.weather" isEqualToString:v4];

  return v5;
}

BOOL sub_10000288C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _weatherApplicationProxyFromProxies:*(void *)(a1 + 40)];
  if (v2)
  {
    uint64_t v3 = sub_100002174(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 134217984;
      uint64_t v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "State changed to %lu for Weather App installation state.", buf, 0xCu);
    }

    unsigned __int8 v5 = [*(id *)(a1 + 32) delegate];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000029D4;
    void v8[3] = &unk_10000C4C0;
    uint64_t v6 = *(void *)(a1 + 48);
    v8[4] = *(void *)(a1 + 32);
    v8[5] = v6;
    [v5 performBlockOnOperationQueue:v8];
  }
  return v2 != 0;
}

void sub_1000029D4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 weatherAppInstallationStateDidChange:*(void *)(a1 + 40)];
}

void sub_100002D0C(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v3 = (unsigned int (*)(void))off_1000118B0;
  v12 = off_1000118B0;
  if (!off_1000118B0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100005F3C;
    void v7[3] = &unk_10000C700;
    v8 = &v9;
    uint64_t v4 = (void *)sub_100005B78();
    v10[3] = (uint64_t)dlsym(v4, "MKBGetDeviceLockState");
    off_1000118B0 = *(_UNKNOWN **)(v8[1] + 24);
    uint64_t v3 = (unsigned int (*)(void))v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v3)
  {
    uint64_t v6 = (_Unwind_Exception *)sub_100007500();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v6);
  }
  if (!v3(0))
  {
    unsigned __int8 v5 = sub_100002174(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Phone unlocked!", (uint8_t *)v7, 2u);
    }

    [v2 _notifyToRestartMonitoring];
  }
}

id sub_100002E70(uint64_t a1, void *a2)
{
  return [a2 _notifyToRestartMonitoring];
}

id sub_100002FBC(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopMonitoring];
  id v2 = *(void **)(a1 + 32);
  return [v2 _cleanupSharedManagers];
}

id sub_100003088(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 80);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000030FC;
  v4[3] = &unk_10000C5A8;
  v4[4] = v1;
  return [v2 addOperationWithBlock:v4];
}

void sub_1000030FC(uint64_t a1)
{
  uint64_t v1 = sub_100002174(2);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Start monitoring.", buf, 2u);
  }

  unsigned int v2 = [*(id *)(a1 + 32) monitoringStarted];
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 _endXPCTransactionIfOK];
    return;
  }
  [v3 setMonitoringDeferred:0];
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  uint64_t v4 = (unsigned int (*)(void))off_1000118A0;
  v54 = off_1000118A0;
  if (!off_1000118A0)
  {
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = sub_100005B28;
    v57 = &unk_10000C700;
    v58 = &v51;
    unsigned __int8 v5 = (void *)sub_100005B78();
    uint64_t v6 = dlsym(v5, "MKBDeviceUnlockedSinceBoot");
    *(void *)(v58[1] + 24) = v6;
    off_1000118A0 = *(_UNKNOWN **)(v58[1] + 24);
    uint64_t v4 = (unsigned int (*)(void))v52[3];
  }
  _Block_object_dispose(&v51, 8);
  if (!v4)
  {
    sub_100007500();
    __break(1u);
  }
  if (!v4())
  {
    uint64_t v7 = sub_100002174(2);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not unlocked after first boot; punting.",
        buf,
        2u);
    }

    [*(id *)(a1 + 32) setMonitoringDeferred:1];
  }
  if (([*(id *)(a1 + 32) monitoringDeferred] & 1) == 0)
  {
    v8 = [*(id *)(a1 + 32) syncCoordinator];
    BOOL v9 = [v8 syncRestriction] == (id)1;

    if (v9)
    {
      uint64_t v10 = sub_100002174(2);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Our PSYSyncCoordinator is PSYSyncRestrictionLimitPush; punting.",
          buf,
          2u);
      }

      [*(id *)(a1 + 32) setMonitoringDeferred:1];
    }
  }
  if ([*(id *)(a1 + 32) monitoringDeferred])
  {
    [*(id *)(a1 + 32) _endXPCTransactionIfOK];
    return;
  }
  v44 = +[NanoWeatherPreferences sharedPreferences];
  [*(id *)(a1 + 32) setWatchPreferences:v44];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v11 = [*(id *)(a1 + 32) companionCityList];
  id v41 = [v11 copy];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  v12 = [*(id *)(a1 + 32) companionWeatherPrefs];
  v42 = [v12 lastUpdated];

  v40 = [v44 cityList];
  v43 = [v44 lastUpdated];
  id v13 = sub_100002174(2);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = @"nil";
    CFStringRef v15 = v42;
    if (!v42) {
      CFStringRef v15 = @"nil";
    }
    if (v43) {
      CFStringRef v14 = v43;
    }
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Phone last updated? %{public}@, Watch last updated? %{public}@.", buf, 0x16u);
  }

  v16 = sub_100002174(2);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = NSStringFromSelector("name");
    v18 = [v41 valueForKeyPath:v17];
    v19 = [v18 componentsJoinedByString:@", "];
    v20 = [v40 valueForKeyPath:@"Name"];
    v21 = [v20 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v21;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Phone list? %@; Watch list? %@.", buf, 0x16u);
  }
  if (v43 && [(__CFString *)v42 compare:v43] != (id)1)
  {
    if (v42 && [(__CFString *)v43 compare:v42] != (id)1)
    {
      if (![v40 count])
      {
        v38 = sub_100002174(2);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Watch has zero cities in list; forcing sync of cloud preferences.",
            buf,
            2u);
        }

        v39 = +[WeatherPreferences sharedPreferences];
        [v39 forceSyncCloudPreferences];

        int v35 = 1;
        goto LABEL_53;
      }
    }
    else
    {
      v23 = sub_100002174(2);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Phone has outdated city list; overwrite phone's list with watch's list.",
          buf,
          2u);
      }

      id v24 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v40, "count"));
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v25 = v40;
      id v26 = [v25 countByEnumeratingWithState:&v47 objects:v55 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v48;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v48 != v27) {
              objc_enumerationMutation(v25);
            }
            v29 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            id v30 = [objc_alloc((Class)City) initWithDictionaryRepresentation:v29];
            if (v30)
            {
              [v24 addObject:v30];
            }
            else
            {
              v31 = sub_100002174(2);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                v32 = [v29 allKeys];
                v33 = [v32 componentsJoinedByString:@", "];
                *(_DWORD *)buf = 138543362;
                *(void *)&uint8_t buf[4] = v33;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Couldn't create a City object from the city dictionary. The dictionary may be missing required values. Keys present in the dictionary: %{public}@.", buf, 0xCu);
              }
            }
          }
          id v26 = [v25 countByEnumeratingWithState:&v47 objects:v55 count:16];
        }
        while (v26);
      }

      v34 = sub_100002174(2);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Not syncing list to phone because iOS version does not support watch to phone syncing. ", buf, 2u);
      }
    }
  }
  else
  {
    v22 = sub_100002174(2);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Watch has outdated city list; overwrite watch's list with phone's list.",
        buf,
        2u);
    }

    [v44 setCityListFromCityObjs:v41 lastUpdated:v42];
  }
  int v35 = 0;
LABEL_53:
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000039C8;
  v46[3] = &unk_10000C5A8;
  v46[4] = *(void *)(a1 + 32);
  v36 = objc_retainBlock(v46);
  if (v35)
  {
    v37 = sub_100002174(2);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Phone list was updated during setup; reload phone list.",
        buf,
        2u);
    }

    [*(id *)(a1 + 32) _loadCompanionCityListOnCompletion:v36];
  }
  else
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v36);
  }
}

void sub_1000039A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_1000039C8(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) companionWeatherPrefs];
  [v2 setSyncDelegate:*(void *)(a1 + 32)];

  uint64_t v3 = [*(id *)(a1 + 32) utilityQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100003A74;
  v4[3] = &unk_10000C5A8;
  v4[4] = *(void *)(a1 + 32);
  [v3 addOperationWithBlock:v4];
}

id sub_100003A74(uint64_t a1)
{
  return [*(id *)(a1 + 32) _completeMonitoringStartup];
}

void sub_100003B6C(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_100002174(2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Watch prefs updated.", (uint8_t *)buf, 2u);
  }

  id v4 = a2;
  objc_initWeak(buf, v4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005CEC;
  v6[3] = &unk_10000C620;
  objc_copyWeak(&v7, buf);
  unsigned __int8 v5 = objc_retainBlock(v6);
  [v4 _loadCompanionCityListOnCompletion:v5];

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void sub_100003C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100003C98(uint64_t a1)
{
  if (([*(id *)(a1 + 32) fullUpdateDone] & 1) == 0) {
    [*(id *)(a1 + 32) _doFullUpdateOfNanoPrefs:1];
  }
  if ([*(id *)(a1 + 32) syncCoordinatorWaitingForCompletion])
  {
    [*(id *)(a1 + 32) setSyncCoordinatorWaitingForCompletion:0];
    unsigned int v2 = [*(id *)(a1 + 32) syncCoordinator];
    uint64_t v3 = [v2 activeSyncSession];
    [v3 syncDidComplete];
  }
  id v4 = +[NanoWeatherAppWorkSpaceObserver sharedWorkspaceObserver];
  [v4 startObservingAppInstallation];

  unsigned __int8 v5 = +[NanoWeatherAppWorkSpaceObserver sharedWorkspaceObserver];
  [v5 setDelegate:*(void *)(a1 + 32)];

  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 _endXPCTransactionIfOK];
}

void sub_1000041B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000041D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    [WeakRetained _endXPCTransactionIfOK];
  }
}

void sub_1000043B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000043D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained monitoringDeferred])
  {
    [WeakRetained setSyncCoordinatorWaitingForCompletion:1];
    [WeakRetained _notifyToRestartMonitoring];
  }
  else if ([WeakRetained fullUpdateDone])
  {
    [*(id *)(a1 + 32) syncDidComplete];
  }
  else
  {
    [WeakRetained setSyncCoordinatorWaitingForCompletion:1];
  }
  [WeakRetained _endXPCTransactionIfOK];
}

void sub_10000452C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100004548(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained monitoringDeferred])
  {
    uint64_t v2 = [*(id *)(a1 + 32) syncCoordinator];
    id v3 = [v2 syncRestriction];

    if (!v3) {
      [WeakRetained _notifyToRestartMonitoring];
    }
  }
  [WeakRetained _endXPCTransactionIfOK];
}

void sub_100004714(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000047DC;
  v3[3] = &unk_10000C620;
  objc_copyWeak(&v4, &location);
  [v2 _addOperationWithQOS:25 usingBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void sub_1000047C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000047DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = +[WeatherPreferences sharedPreferences];
  [v1 synchronizeStateToDisk];

  [WeakRetained _doFullUpdateOfNanoPrefs:0];
  [WeakRetained _endXPCTransactionIfOK];
}

void sub_100004928(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000049F0;
  v3[3] = &unk_10000C620;
  objc_copyWeak(&v4, &location);
  [v2 _addOperationWithQOS:25 usingBlock:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void sub_1000049D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000049F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = +[WeatherPreferences sharedPreferences];
  [v1 synchronizeStateToDisk];

  [WeakRetained _beginDelayingNanoPreferencesSync];
  [WeakRetained _updateCityList];
  [WeakRetained _endDelayingNanoPreferencesSync];
  [WeakRetained _endXPCTransactionIfOK];
}

void sub_100004FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004FF4(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v11 = [v7 objectAtIndexedSubscript:a3];
  BOOL v9 = [v8 locationID];

  uint64_t v10 = [v11 locationID];
  LOBYTE(v8) = [v9 isEqualToString:v10];

  if ((v8 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

id sub_1000051B0(uint64_t a1, void *a2)
{
  id v3 = [a2 objectForKeyedSubscript:@"UUID"];
  id v4 = [*(id *)(a1 + 32) locationID];
  id v5 = [v3 isEqualToString:v4];

  return v5;
}

void sub_1000055DC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) companionWeatherPrefs];

  if (!v2)
  {
    id v3 = sub_100002174(2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting up companion WeatherPreferences.", (uint8_t *)&v20, 2u);
    }

    id v4 = +[WeatherPreferences sharedPreferences];
    id v5 = [*(id *)(a1 + 32) _defaultCities];
    [v4 setDefaultCities:v5];

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v4;
  }
  id v8 = [*(id *)(a1 + 32) companionWeatherPrefs];
  BOOL v9 = [v8 loadSavedCities];

  uint64_t v10 = sub_100002174(2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = NSStringFromSelector("name");
    v12 = [v9 valueForKeyPath:v11];
    id v13 = [v12 componentsJoinedByString:@", "];
    int v20 = 138412290;
    v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "City list from phone? %@.", (uint8_t *)&v20, 0xCu);
  }
  CFStringRef v14 = +[NSPredicate predicateWithBlock:&stru_10000C6B0];
  CFStringRef v15 = [v9 filteredArrayUsingPredicate:v14];

  v16 = sub_100002174(2);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = NSStringFromSelector("name");
    v18 = [v15 valueForKeyPath:v17];
    v19 = [v18 componentsJoinedByString:@", "];
    int v20 = 138412290;
    v21 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Static city list from phone? %@.", (uint8_t *)&v20, 0xCu);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  [*(id *)(a1 + 32) setCompanionCityList:v15];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

BOOL sub_1000058AC(id a1, City *a2, NSDictionary *a3)
{
  id v3 = a2;
  unsigned int v4 = [(City *)v3 isLocalWeatherCity];
  if (v4)
  {
    id v5 = sub_100002174(2);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(City *)v3 name];
      int v8 = 138412290;
      BOOL v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Filtering %@ as the phone thinks its a local city.", (uint8_t *)&v8, 0xCu);
    }
  }

  return v4 ^ 1;
}

void *sub_100005B28(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100005B78();
  result = dlsym(v2, "MKBDeviceUnlockedSinceBoot");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000118A0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100005B78()
{
  v3[0] = 0;
  if (!qword_1000118A8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100005C78;
    void v3[4] = &unk_10000C458;
    v3[5] = v3;
    long long v4 = off_10000C720;
    uint64_t v5 = 0;
    qword_1000118A8 = _sl_dlopen();
  }
  uint64_t v0 = qword_1000118A8;
  uint64_t v1 = (void *)v3[0];
  if (!qword_1000118A8)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100005C78()
{
  uint64_t result = _sl_dlopen();
  qword_1000118A8 = result;
  return result;
}

void sub_100005CEC(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005DAC;
  v3[3] = &unk_10000C620;
  objc_copyWeak(&v4, v1);
  [WeakRetained _addOperationWithQOS:25 usingBlock:v3];
  objc_destroyWeak(&v4);
}

void sub_100005D98(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100005DAC(uint64_t a1)
{
  uint64_t v2 = +[NanoWeatherPreferences sharedPreferences];
  [v2 syncPreferencesWithDisk];
  id v3 = [v2 cityObjectsListFromNanoPreferences];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = sub_100002174(2);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = NSStringFromSelector("name");
    id v7 = [v3 valueForKeyPath:v6];
    int v8 = [v7 componentsJoinedByString:@", "];
    int v10 = 138412290;
    id v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Loaded watch list to sync to phone: %@.", (uint8_t *)&v10, 0xCu);
  }
  BOOL v9 = sub_100002174(2);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not syncing list to phone because iOS version does not support watch to phone syncing. ", (uint8_t *)&v10, 2u);
  }
}

void *sub_100005F3C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100005B78();
  uint64_t result = dlsym(v2, "MKBGetDeviceLockState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000118B0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void start()
{
  uint64_t v1 = (void *)os_transaction_create();
  uint64_t v2 = objc_alloc_init(NanoWeatherPreferencesMonitor);
  [(NanoWeatherPreferencesMonitor *)v2 run];
  dispatch_queue_t v3 = dispatch_queue_create("com.apple.nanoweatherprefsd.notificationqueue", 0);
  id v4 = (void *)qword_1000118B8;
  qword_1000118B8 = (uint64_t)v3;

  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)qword_1000118B8, &stru_10000C738);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)qword_1000118B8, &stru_10000C738);
  uint64_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)qword_1000118B8);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000061D8;
  handler[3] = &unk_10000C5A8;
  BOOL v9 = v2;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);

  uint64_t v6 = +[NSRunLoop mainRunLoop];
  while (1)
  {
    id v7 = +[NSDate distantFuture];
    [v6 runMode:NSDefaultRunLoopMode beforeDate:v7];
  }
}

void sub_100006100(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = +[NSString stringWithCString:xpc_dictionary_get_string(a2, _xpc_event_key_name) encoding:1];
  dispatch_queue_t v3 = sub_100002174(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Processing notification for %{public}@.", (uint8_t *)&v4, 0xCu);
  }
}

void sub_1000061D8(uint64_t a1)
{
  uint64_t v2 = sub_100002174(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Got SIGTERM; Exiting...", v3, 2u);
  }

  [*(id *)(a1 + 32) terminate];
  exit(0);
}

void sub_10000629C(id a1)
{
  qword_1000118C0 = objc_alloc_init(NanoWeatherPreferences);
  _objc_release_x1();
}

void sub_100007440(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  if (a2 == 1)
  {
    id v7 = [sqlite3_user_data(a1) citySearchMatcher];
    if (sqlite3_value_text(*a3)) {
      BOOL v5 = v7 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5) {
      int v6 = 0;
    }
    else {
      int v6 = objc_msgSend(v7, "matchesUTF8String:");
    }
    sqlite3_result_int(a1, v6);
  }
  else
  {
    sqlite3_result_error(a1, "ALBasicDiacriticMatch: wrong number of arguments", -1);
  }
}

uint64_t sub_100007500()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_100007524(v0);
}

void sub_100007524(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Localized name database is not present", v1, 2u);
}

void sub_100007568(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Couldn't open localized name database: error %i", (uint8_t *)v2, 8u);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
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
  return _objc_msgSendSuper2(a1, a2);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return _sqlite3_create_function(db, zFunctionName, nArg, eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return _sqlite3_open_v2(filename, ppDb, flags, zVfs);
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return _sqlite3_user_data(a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return _sqlite3_value_text(a1);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_ISO3166CountryAbbreviation(void *a1, const char *a2, ...)
{
  return [a1 ISO3166CountryAbbreviation];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__beginDelayingNanoPreferencesSync(void *a1, const char *a2, ...)
{
  return [a1 _beginDelayingNanoPreferencesSync];
}

id objc_msgSend__beginXPCTransaction(void *a1, const char *a2, ...)
{
  return [a1 _beginXPCTransaction];
}

id objc_msgSend__checkForInitialState(void *a1, const char *a2, ...)
{
  return [a1 _checkForInitialState];
}

id objc_msgSend__clearXPCTransaction(void *a1, const char *a2, ...)
{
  return [a1 _clearXPCTransaction];
}

id objc_msgSend__defaultCities(void *a1, const char *a2, ...)
{
  return [a1 _defaultCities];
}

id objc_msgSend__deviceLangID(void *a1, const char *a2, ...)
{
  return [a1 _deviceLangID];
}

id objc_msgSend__endDelayingNanoPreferencesSync(void *a1, const char *a2, ...)
{
  return [a1 _endDelayingNanoPreferencesSync];
}

id objc_msgSend__endXPCTransactionIfOK(void *a1, const char *a2, ...)
{
  return [a1 _endXPCTransactionIfOK];
}

id objc_msgSend__notifyToRestartMonitoring(void *a1, const char *a2, ...)
{
  return [a1 _notifyToRestartMonitoring];
}

id objc_msgSend__stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 _stopMonitoring];
}

id objc_msgSend__updateCityList(void *a1, const char *a2, ...)
{
  return [a1 _updateCityList];
}

id objc_msgSend_activeSyncSession(void *a1, const char *a2, ...)
{
  return [a1 activeSyncSession];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cityList(void *a1, const char *a2, ...)
{
  return [a1 cityList];
}

id objc_msgSend_cityObjectsListFromNanoPreferences(void *a1, const char *a2, ...)
{
  return [a1 cityObjectsListFromNanoPreferences];
}

id objc_msgSend_citySearchMatcher(void *a1, const char *a2, ...)
{
  return [a1 citySearchMatcher];
}

id objc_msgSend_companionCityList(void *a1, const char *a2, ...)
{
  return [a1 companionCityList];
}

id objc_msgSend_companionWeatherPrefs(void *a1, const char *a2, ...)
{
  return [a1 companionWeatherPrefs];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countryAbbreviation(void *a1, const char *a2, ...)
{
  return [a1 countryAbbreviation];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultAppWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultAppWorkspace];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_forceSyncCloudPreferences(void *a1, const char *a2, ...)
{
  return [a1 forceSyncCloudPreferences];
}

id objc_msgSend_fullUpdateDone(void *a1, const char *a2, ...)
{
  return [a1 fullUpdateDone];
}

id objc_msgSend_isLocalWeatherCity(void *a1, const char *a2, ...)
{
  return [a1 isLocalWeatherCity];
}

id objc_msgSend_keysToSync(void *a1, const char *a2, ...)
{
  return [a1 keysToSync];
}

id objc_msgSend_lastUpdated(void *a1, const char *a2, ...)
{
  return [a1 lastUpdated];
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return [a1 latitude];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loadSavedCities(void *a1, const char *a2, ...)
{
  return [a1 loadSavedCities];
}

id objc_msgSend_locationID(void *a1, const char *a2, ...)
{
  return [a1 locationID];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return [a1 longitude];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_monitoringDeferred(void *a1, const char *a2, ...)
{
  return [a1 monitoringDeferred];
}

id objc_msgSend_monitoringStarted(void *a1, const char *a2, ...)
{
  return [a1 monitoringStarted];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_sharedDefaults(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaults];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_sharedWorkspaceObserver(void *a1, const char *a2, ...)
{
  return [a1 sharedWorkspaceObserver];
}

id objc_msgSend_startObservingAppInstallation(void *a1, const char *a2, ...)
{
  return [a1 startObservingAppInstallation];
}

id objc_msgSend_stopObservingAppInstallation(void *a1, const char *a2, ...)
{
  return [a1 stopObservingAppInstallation];
}

id objc_msgSend_syncCoordinator(void *a1, const char *a2, ...)
{
  return [a1 syncCoordinator];
}

id objc_msgSend_syncCoordinatorWaitingForCompletion(void *a1, const char *a2, ...)
{
  return [a1 syncCoordinatorWaitingForCompletion];
}

id objc_msgSend_syncDidComplete(void *a1, const char *a2, ...)
{
  return [a1 syncDidComplete];
}

id objc_msgSend_syncPreferencesToNano(void *a1, const char *a2, ...)
{
  return [a1 syncPreferencesToNano];
}

id objc_msgSend_syncPreferencesWithDisk(void *a1, const char *a2, ...)
{
  return [a1 syncPreferencesWithDisk];
}

id objc_msgSend_syncRestriction(void *a1, const char *a2, ...)
{
  return [a1 syncRestriction];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synchronizeStateToDisk(void *a1, const char *a2, ...)
{
  return [a1 synchronizeStateToDisk];
}

id objc_msgSend_terminate(void *a1, const char *a2, ...)
{
  return [a1 terminate];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_timeZoneUpdateDate(void *a1, const char *a2, ...)
{
  return [a1 timeZoneUpdateDate];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_utilityQueue(void *a1, const char *a2, ...)
{
  return [a1 utilityQueue];
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return [a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_watchPreferences(void *a1, const char *a2, ...)
{
  return [a1 watchPreferences];
}

id objc_msgSend_wfLocation(void *a1, const char *a2, ...)
{
  return [a1 wfLocation];
}

id objc_msgSend_xactionRefCountLock(void *a1, const char *a2, ...)
{
  return [a1 xactionRefCountLock];
}