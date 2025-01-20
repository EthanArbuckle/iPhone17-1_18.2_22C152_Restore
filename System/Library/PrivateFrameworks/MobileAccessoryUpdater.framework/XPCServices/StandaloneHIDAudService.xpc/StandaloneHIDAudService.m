void sub_1000037C8(void *a1)
{
  id v1;
  NSObject *v2;
  NSObject *v3;

  v1 = a1;
  v2 = [v1 logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100016AB8();
  }

  v3 = [v1 matchSemaphore];
  dispatch_semaphore_signal(v3);

  [v1 clearNotification];
}

void sub_100005084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak(v10);
  objc_destroyWeak(v9);
  objc_destroyWeak((id *)(v12 - 152));
  _Unwind_Resume(a1);
}

void sub_1000050DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained hostBatteryCapacity];
    v5 = [v3 minBatteryHost];
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Host has low battery of %d%% below minimum threshold %d%%", v4, [v5 intValue]);

    id v7 = objc_alloc((Class)NSError);
    v8 = [*(id *)(a1 + 32) errorDomain];
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    uint64_t v12 = v6;
    v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    id v10 = [v7 initWithDomain:v8 code:18 userInfo:v9];
    [v3 setError:v10];

    [v3 executeNextBootstrapAction];
  }
}

void sub_100005228(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [WeakRetained batteryTimer];

    if (v1)
    {
      v2 = [WeakRetained batteryTimer];
      dispatch_source_cancel(v2);

      [WeakRetained setBatteryTimer:0];
    }
    if ([WeakRetained batteryToken] != -1)
    {
      notify_cancel((int)[WeakRetained batteryToken]);
      [WeakRetained setBatteryToken:0xFFFFFFFFLL];
    }
  }
}

void sub_1000052D4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setHostPowerSource:0];
    id v4 = [v3 logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109376;
      v8[1] = [v3 hostBatteryCapacity];
      __int16 v9 = 1024;
      unsigned int v10 = [v3 hostBatteryOnACPower];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Host battery %d%% on AC power %d", (uint8_t *)v8, 0xEu);
    }

    signed int v5 = [v3 hostBatteryCapacity];
    v6 = [v3 minBatteryHost];
    signed int v7 = [v6 intValue];

    if (v5 >= v7)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      [v3 executeNextBootstrapAction];
    }
    else if (([v3 hostBatteryOnACPower] & 1) == 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
}

void sub_100005444(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [WeakRetained batteryToken]);
    int v3 = [v6 hostBatteryCapacity];
    id v4 = [v6 minBatteryHost];
    if (v3 >= (int)[v4 intValue])
    {
    }
    else
    {
      unsigned int v5 = [v6 hostBatteryOnACPower];

      id WeakRetained = v6;
      if (!v5) {
        goto LABEL_7;
      }
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    id WeakRetained = v6;
  }
LABEL_7:
}

void sub_1000059BC(uint64_t a1, int a2, int a3, void *a4)
{
  if (!(a3 | a2))
  {
    id v6 = a4;
    [v6 setBtSession:a1];
    [v6 btSessionArrived];
  }
}

void sub_100005D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100005D34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    WORD2(v8) = 0;
    LODWORD(v8) = 0;
    objc_msgSend(WeakRetained, "btAddress", v8, 0);
    id v3 = objc_claimAutoreleasedReturnValue();
    [v3 UTF8String];
    int v4 = BTDeviceAddressFromString();

    if (v4)
    {
      unsigned int v5 = [v2 logHandle];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100016D5C();
      }
LABEL_13:

      goto LABEL_14;
    }
    [v2 btSession];
    int v6 = BTDeviceFromAddress();
    signed int v7 = [v2 logHandle];
    unsigned int v5 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100016CF4();
      }
      goto LABEL_13;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100016CC0();
    }

    if (BTDeviceConnect())
    {
      unsigned int v5 = [v2 logHandle];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_100016C58();
      }
      goto LABEL_13;
    }
  }
LABEL_14:
}

void sub_100006128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000615C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100016DC4(v2);
    }

    int v4 = [v2 delayBootstrapSource];
    dispatch_source_cancel(v4);

    [v2 setDelayBootstrapSource:0];
    [v2 executeNextBootstrapAction];
  }
}

void sub_1000064B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1000064CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained executeNextBootstrapAction];
    id WeakRetained = v2;
  }
}

void sub_1000067F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006828(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = [v2 networkDelay];
      v7[0] = 67109120;
      v7[1] = [v4 intValue];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "No network connection after %d seconds", (uint8_t *)v7, 8u);
    }
    unsigned int v5 = [v2 networkStatus];

    if (v5)
    {
      int v6 = [v2 networkStatus];
      dispatch_source_cancel(v6);

      [v2 setNetworkStatus:0];
    }
    if ([v2 networkReachability])
    {
      SCNetworkReachabilitySetCallback((SCNetworkReachabilityRef)[v2 networkReachability], 0, 0);
      SCNetworkReachabilitySetDispatchQueue((SCNetworkReachabilityRef)[v2 networkReachability], 0);
      CFRelease([v2 networkReachability]);
      [v2 setNetworkReachability:0];
      [v2 executeNextBootstrapAction];
    }
  }
}

id sub_10000698C(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 checkNetworkReachability:a2];
}

void sub_10000713C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a16);
  objc_destroyWeak(a15);
  objc_destroyWeak(a14);
  objc_destroyWeak(a13);
  objc_destroyWeak(a12);
  objc_destroyWeak(a10);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)(v17 - 184));
  _Unwind_Resume(a1);
}

void sub_100007198(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained clearOldRegistryEntryIDs];
    id v3 = [v2 options];
    int v4 = [v3 objectForKeyedSubscript:@"IOMatchLaunchServiceID"];

    unsigned int v5 = [v2 abortUpdate];
    unsigned int v6 = [v5 BOOLValue];

    if (v6)
    {
      id v7 = objc_alloc((Class)NSError);
      uint64_t v8 = [v2 errorDomain];
      NSErrorUserInfoKey v15 = NSLocalizedDescriptionKey;
      CFStringRef v16 = @"Device not targeted by update/cycle scripts";
      __int16 v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
      id v10 = [v7 initWithDomain:v8 code:35 userInfo:v9];
      [v2 setError:v10];
    }
    else
    {
      if (![v2 abortRegistryEntryID:v4])
      {
LABEL_7:
        [v2 executeNextBootstrapAction];

        goto LABEL_8;
      }
      uint64_t v8 = +[NSString stringWithFormat:@"Abort update for previously seen registry entry ID %@", v4];
      id v11 = objc_alloc((Class)NSError);
      __int16 v9 = [v2 errorDomain];
      NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
      v14 = v8;
      id v10 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
      id v12 = [v11 initWithDomain:v9 code:57 userInfo:v10];
      [v2 setError:v12];
    }
    goto LABEL_7;
  }
LABEL_8:
}

void sub_10000739C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained delayBootstrap];
    id WeakRetained = v2;
  }
}

void sub_1000073E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained delegate];
    int v4 = [v2 batteryCheckDevice];
    id v5 = [v4 BOOLValue];
    unsigned int v6 = [v2 logHandle];
    id v7 = [v2 options];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"IOMatchLaunchServiceID"];
    __int16 v9 = [v2 errorDomain];
    id v25 = 0;
    id v10 = +[SHFUDevice getDevices:v3 hasPowerSource:v5 logHandle:v6 registryEntryID:v8 errorDomain:v9 error:&v25];
    id v11 = v25;

    if (v11)
    {
      [v2 setError:v11];
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      v20 = v10;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v21 objects:v28 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v22;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v22 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            v18 = [v2 logHandle];
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v17;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "checking updates for %@", buf, 0xCu);
            }

            v19 = [v2 loggingIdentifier];
            [v17 logVersions:v19];
          }
          id v14 = [v12 countByEnumeratingWithState:&v21 objects:v28 count:16];
        }
        while (v14);
      }

      id v10 = v20;
    }
    [v2 executeNextBootstrapAction];
  }
}

void sub_10000765C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained deviceNeedsBTReconnect];
    unsigned int v4 = [v3 BOOLValue];

    if (v4)
    {
      id v5 = [v2 delegate];
      unsigned int v6 = [v2 batteryCheckDevice];
      id v7 = [v6 BOOLValue];
      uint64_t v8 = [v2 logHandle];
      __int16 v9 = [v2 options];
      id v10 = [v9 objectForKeyedSubscript:@"IOMatchLaunchServiceID"];
      id v11 = [v2 errorDomain];
      id v27 = 0;
      id v12 = +[SHFUDevice getDevices:v5 hasPowerSource:v7 logHandle:v8 registryEntryID:v10 errorDomain:v11 error:&v27];
      id v13 = v27;

      if (v13)
      {
        [v2 setError:v13];
      }
      else
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v14 = v12;
        id v15 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v24;
          do
          {
            for (i = 0; i != v16; i = (char *)i + 1)
            {
              if (*(void *)v24 != v17) {
                objc_enumerationMutation(v14);
              }
              v19 = *(void **)(*((void *)&v23 + 1) + 8 * i);
              v20 = objc_msgSend(v19, "deviceAddress", (void)v23);
              id v21 = [v20 length];

              if (v21)
              {
                long long v22 = [v19 deviceAddress];
                [v2 setBtAddress:v22];
              }
            }
            id v16 = [v14 countByEnumeratingWithState:&v23 objects:v28 count:16];
          }
          while (v16);
        }
      }
    }
    objc_msgSend(v2, "executeNextBootstrapAction", (void)v23);
  }
}

void sub_1000078AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained verifyHostBattery];
    id WeakRetained = v2;
  }
}

void sub_1000078F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained verifyDeviceBattery];
    [v3 setError:v2];

    [v3 executeNextBootstrapAction];
    id WeakRetained = v3;
  }
}

void sub_10000795C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained networkDelay];
    if ((int)[v2 intValue] < 1)
    {
    }
    else
    {
      unsigned __int8 v3 = [v4 hostConnectedToNetwork];

      if ((v3 & 1) == 0)
      {
        [v4 waitForNetwork];
LABEL_7:
        id WeakRetained = v4;
        goto LABEL_8;
      }
    }
    [v4 executeNextBootstrapAction];
    goto LABEL_7;
  }
LABEL_8:
}

void sub_1000079E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    unsigned __int8 v3 = [WeakRetained delegate];
    id v4 = [v2 batteryCheckDevice];
    id v5 = [v4 BOOLValue];
    unsigned int v6 = [v2 logHandle];
    id v7 = [v2 options];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"IOMatchLaunchServiceID"];
    __int16 v9 = [v2 errorDomain];
    id v24 = 0;
    id v10 = +[SHFUDevice getDevices:v3 hasPowerSource:v5 logHandle:v6 registryEntryID:v8 errorDomain:v9 error:&v24];
    id v11 = v24;

    if (v11)
    {
      [v2 setError:v11];
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      id v12 = v10;
      id v13 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v21;
        do
        {
          id v16 = 0;
          do
          {
            if (*(void *)v21 != v15) {
              objc_enumerationMutation(v12);
            }
            if (objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * (void)v16), "GATTServicesDiscoveryNeeded", (void)v20))
            {
              id v17 = objc_alloc((Class)CBCentralManager);
              v18 = [v2 serialQueue];
              id v19 = [v17 initWithDelegate:v2 queue:v18];
              [v2 setCentralManager:v19];
            }
            id v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
        }
        while (v14);
      }
    }
    objc_msgSend(v2, "executeNextBootstrapAction", (void)v20);
  }
}

void sub_1000086C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak((id *)(v24 - 88));
  _Unwind_Resume(a1);
}

void sub_100008710(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    unsigned __int8 v3 = [WeakRetained logHandle];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [v2 inactivityDelay];
      v5[0] = 67109120;
      v5[1] = [v4 intValue];
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Waiting for %d seconds of user inactivity", (uint8_t *)v5, 8u);
    }
  }
}

id sub_1000087E8(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_100008814(uint64_t a1)
{
}

void sub_10000881C(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = [WeakRetained logHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_10001714C(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    id v13 = [v4 userInactivityStatus];

    if (v13)
    {
      id v14 = [v4 userInactivityStatus];
      dispatch_source_cancel(v14);

      [v4 setUserInactivityStatus:0];
    }
    int v15 = *(_DWORD *)(a1 + 48);
    if (v15 == 2)
    {
      id v16 = [v4 serialQueue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000089B8;
      block[3] = &unk_1000245D0;
      objc_copyWeak(&v25, v2);
      dispatch_async(v16, block);

      objc_destroyWeak(&v25);
    }
    else if (v15 == 1)
    {
      [v4 commitFirmwareWithOptions:*(void *)(a1 + 32)];
    }
    else if (v15)
    {
      id v17 = [v4 logHandle];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1000170DC(a1 + 48, v17, v18, v19, v20, v21, v22, v23);
      }
    }
    else
    {
      [v4 sendFirmwareToDeviceWithOptions:*(void *)(a1 + 32)];
    }
  }
}

void sub_1000089B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained sendPersonalizedManifestsToDevice];
    id WeakRetained = v2;
  }
}

void sub_1000089FC(uint64_t a1, uint64_t a2, char a3)
{
  id v5 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    uint64_t v9 = [WeakRetained logHandle];
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (!v8)
    {
      if (v10) {
        sub_1000171C4();
      }
      goto LABEL_11;
    }
    if (v10) {
      sub_1000171F8();
    }

    if ((a3 & 1) == 0)
    {
      uint64_t v11 = [v7 logHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [v7 inactivityDelay];
        *(_DWORD *)buf = 67109120;
        unsigned int v18 = [v12 intValue];
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "User has been inactive for %d seconds (or more)", buf, 8u);
      }
      uint64_t v9 = [v7 serialQueue];
      (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
      uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = 0;

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100008BF8;
      block[3] = &unk_1000245D0;
      objc_copyWeak(&v16, v5);
      dispatch_async(v9, block);
      objc_destroyWeak(&v16);
LABEL_11:
    }
  }
}

uint64_t sub_100008BF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unsigned __int8 v3 = WeakRetained;
    if ([WeakRetained pmNotificationHandle])
    {
      [v3 pmNotificationHandle];
      IOPMUnregisterNotification();
      [v3 setPmNotificationHandle:0];
    }
  }
  return _objc_release_x1();
}

id sub_10000ACA0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) error];

  if (!v2)
  {
    unsigned __int8 v3 = [*(id *)(a1 + 32) verifyLatestFWVersions];
    [*(id *)(a1 + 32) setError:v3];
  }
  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 progress:100.0];

  [*(id *)(a1 + 32) releasePowerAssertion];
  id v5 = [*(id *)(a1 + 32) error];

  uint64_t v6 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [*(id *)(a1 + 32) targetDevice];
    uint64_t v8 = [*(id *)(a1 + 32) error];
    int v13 = 138412802;
    id v14 = v7;
    __int16 v15 = 1024;
    BOOL v16 = v5 == 0;
    __int16 v17 = 2112;
    unsigned int v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "finish: target device %@ successful %d error %@", (uint8_t *)&v13, 0x1Cu);
  }
  uint64_t v9 = [*(id *)(a1 + 32) delegate];
  BOOL v10 = [*(id *)(a1 + 32) pluginInfo];
  uint64_t v11 = [*(id *)(a1 + 32) error];
  [v9 didFinish:v5 == 0 info:v10 error:v11];

  [*(id *)(a1 + 32) setTransaction:0];
  return [*(id *)(a1 + 32) setSerialQueue:0];
}

uint64_t sub_10000AE84(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) personalizationSemaphore];
  dispatch_semaphore_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

  unsigned __int8 v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

void sub_10000B7A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    CFStringRef v6 = @"Error";
    uint64_t v7 = v2;
    unsigned __int8 v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@.%llu", @"com.apple.StandaloneHIDFudPlugins.personalization", [*(id *)(a1 + 40) ecID]);
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:v4 object:*(void *)(a1 + 48) userInfo:v3];
}

void sub_10000BDC8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000BDE4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000BE00(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_10000BE34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000D6D0(_Unwind_Exception *a1)
{
}

uint64_t sub_10000D750(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000D760(uint64_t a1)
{
}

uint64_t sub_10000D768(uint64_t a1, int a2, id obj)
{
  return 0;
}

uint64_t sub_10000D794(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 getFirmwareType];
  if ([v7 isEqualToNumber:&off_1000269E8])
  {
    uint64_t v8 = [v6 getFirmwareType];
    unsigned __int8 v9 = [v8 isEqualToNumber:&off_1000269E8];

    if ((v9 & 1) == 0)
    {
      BOOL v10 = [*(id *)(a1 + 32) BOOLValue] == 0;
      uint64_t v11 = -1;
      goto LABEL_9;
    }
  }
  else
  {
  }
  uint64_t v12 = [v5 getFirmwareType];
  if ([v12 isEqualToNumber:&off_1000269E8])
  {

LABEL_12:
    uint64_t v15 = 0;
    goto LABEL_13;
  }
  int v13 = [v6 getFirmwareType];
  unsigned int v14 = [v13 isEqualToNumber:&off_1000269E8];

  if (!v14) {
    goto LABEL_12;
  }
  BOOL v10 = [*(id *)(a1 + 32) BOOLValue] == 0;
  uint64_t v11 = 1;
LABEL_9:
  if (v10) {
    uint64_t v15 = -v11;
  }
  else {
    uint64_t v15 = v11;
  }
LABEL_13:

  return v15;
}

uint64_t sub_10000ED1C(unsigned int a1, void *a2, _DWORD *a3, __IOHIDDevice *a4, void *a5)
{
  uint64_t v9 = 3758097090;
  id v10 = a5;
  CFIndex pReportLength = 513;
  if (a2 && a3)
  {
    if (*a3 <= 0x200u)
    {
      uint64_t v9 = IOHIDDeviceGetReport(a4, kIOHIDReportTypeFeature, a1, &report, &pReportLength);
      if (!v9)
      {
        int v13 = pReportLength;
        if (pReportLength >= 1)
        {
          memcpy(a2, &v16, pReportLength - 1);
          uint64_t v9 = 0;
          *a3 = v13 - 1;
          goto LABEL_9;
        }
        uint64_t v9 = 3758097127;
      }
    }
    else
    {
      uint64_t v9 = 3758097128;
    }
  }
  uint64_t v11 = v10;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    sub_100017740(a1, v9, v11);
  }

LABEL_9:
  return v9;
}

NSString *SHFUIOReturnString(uint64_t a1)
{
  if ((int)a1 > -536850433)
  {
    if (a1 == -536850432)
    {
      CFStringRef v3 = @"kUSBHostReturnPipeStalled (Pipe has issued a STALL handshake.  Use clearStall to clear this condition.)";
    }
    else if (a1 == -536850431)
    {
      CFStringRef v3 = @"kUSBHostReturnNoPower (A setConfiguration call was not able to succeed because all configurations require more power than is available.)";
    }
    else
    {
LABEL_9:
      CFStringRef v3 = @"Unknown Error";
    }
  }
  else
  {
    CFStringRef v3 = @"kIOReturnError (general error)";
    switch(a1)
    {
      case 0xE00002BC:
        return +[NSString stringWithFormat:@"0x%08X %@", a1, v3, v1, v2];
      case 0xE00002BD:
        CFStringRef v3 = @"kIOReturnNoMemory (can't allocate memory)";
        break;
      case 0xE00002BE:
        CFStringRef v3 = @"kIOReturnNoResources (resource shortage)";
        break;
      case 0xE00002BF:
        CFStringRef v3 = @"kIOReturnIPCError (error during IPC)";
        break;
      case 0xE00002C0:
        CFStringRef v3 = @"kIOReturnNoDevice (no such device)";
        break;
      case 0xE00002C1:
        CFStringRef v3 = @"kIOReturnNotPrivileged (privilege violation)";
        break;
      case 0xE00002C2:
        CFStringRef v3 = @"kIOReturnBadArgument (invalid argument)";
        break;
      case 0xE00002C3:
        CFStringRef v3 = @"kIOReturnLockedRead (device read locked)";
        break;
      case 0xE00002C4:
        CFStringRef v3 = @"kIOReturnLockedWrite (device write locked)";
        break;
      case 0xE00002C5:
        CFStringRef v3 = @"kIOReturnExclusiveAccess (exclusive access and device already open)";
        break;
      case 0xE00002C6:
        CFStringRef v3 = @"kIOReturnBadMessageID (sent/received messages had different msg_id)";
        break;
      case 0xE00002C7:
        CFStringRef v3 = @"kIOReturnUnsupported (unsupported function)";
        break;
      case 0xE00002C8:
        CFStringRef v3 = @"kIOReturnVMError (misc. VM failure)";
        break;
      case 0xE00002C9:
        CFStringRef v3 = @"kIOReturnInternalError (internal error)";
        break;
      case 0xE00002CA:
        CFStringRef v3 = @"kIOReturnIOError (General I/O error)";
        break;
      case 0xE00002CB:
      case 0xE00002DC:
        goto LABEL_9;
      case 0xE00002CC:
        CFStringRef v3 = @"kIOReturnCannotLock (can't acquire lock)";
        break;
      case 0xE00002CD:
        CFStringRef v3 = @"kIOReturnNotOpen (device not open)";
        break;
      case 0xE00002CE:
        CFStringRef v3 = @"kIOReturnNotReadable (read not supported)";
        break;
      case 0xE00002CF:
        CFStringRef v3 = @"kIOReturnNotWritable (write not supported)";
        break;
      case 0xE00002D0:
        CFStringRef v3 = @"kIOReturnNotAligned (alignment error)";
        break;
      case 0xE00002D1:
        CFStringRef v3 = @"kIOReturnBadMedia (Media Error)";
        break;
      case 0xE00002D2:
        CFStringRef v3 = @"kIOReturnStillOpen (device(s) still open)";
        break;
      case 0xE00002D3:
        CFStringRef v3 = @"kIOReturnRLDError (rld failure)";
        break;
      case 0xE00002D4:
        CFStringRef v3 = @"kIOReturnDMAError (DMA failure)";
        break;
      case 0xE00002D5:
        CFStringRef v3 = @"kIOReturnBusy (Device Busy)";
        break;
      case 0xE00002D6:
        CFStringRef v3 = @"kIOReturnTimeout (I/O Timeout)";
        break;
      case 0xE00002D7:
        CFStringRef v3 = @"kIOReturnOffline (device offline)";
        break;
      case 0xE00002D8:
        CFStringRef v3 = @"kIOReturnNotReady (not ready)";
        break;
      case 0xE00002D9:
        CFStringRef v3 = @"kIOReturnNotAttached (device not attached)";
        break;
      case 0xE00002DA:
        CFStringRef v3 = @"kIOReturnNoChannels (no DMA channels left)";
        break;
      case 0xE00002DB:
        CFStringRef v3 = @"kIOReturnNoSpace (no space for data)";
        break;
      case 0xE00002DD:
        CFStringRef v3 = @"kIOReturnPortExists (port already exists)";
        break;
      case 0xE00002DE:
        CFStringRef v3 = @"kIOReturnCannotWire (can't wire down physical memory)";
        break;
      case 0xE00002DF:
        CFStringRef v3 = @"kIOReturnNoInterrupt (no interrupt attached)";
        break;
      case 0xE00002E0:
        CFStringRef v3 = @"kIOReturnNoFrames (no DMA frames enqueued)";
        break;
      case 0xE00002E1:
        CFStringRef v3 = @"kIOReturnMessageTooLarge (oversized msg received on interrupt port)";
        break;
      case 0xE00002E2:
        CFStringRef v3 = @"kIOReturnNotPermitted (not permitted)";
        break;
      case 0xE00002E3:
        CFStringRef v3 = @"kIOReturnNoPower (no power to device)";
        break;
      case 0xE00002E4:
        CFStringRef v3 = @"kIOReturnNoMedia (media not present)";
        break;
      case 0xE00002E5:
        CFStringRef v3 = @"kIOReturnUnformattedMedia (media not formatted)";
        break;
      case 0xE00002E6:
        CFStringRef v3 = @"kIOReturnUnsupportedMode (no such mode)";
        break;
      case 0xE00002E7:
        CFStringRef v3 = @"kIOReturnUnderrun (data underrun)";
        break;
      case 0xE00002E8:
        CFStringRef v3 = @"kIOReturnOverrun (data overrun)";
        break;
      case 0xE00002E9:
        CFStringRef v3 = @"kIOReturnDeviceError (the device is not working properly!)";
        break;
      case 0xE00002EA:
        CFStringRef v3 = @"kIOReturnNoCompletion (a completion routine is required)";
        break;
      case 0xE00002EB:
        CFStringRef v3 = @"kIOReturnAborted (operation aborted)";
        break;
      case 0xE00002EC:
        CFStringRef v3 = @"kIOReturnNoBandwidth (bus bandwidth would be exceeded)";
        break;
      case 0xE00002ED:
        CFStringRef v3 = @"kIOReturnNotResponding (device not responding)";
        break;
      case 0xE00002EE:
        CFStringRef v3 = @"kIOReturnIsoTooOld (isochronous I/O request for distant past!)";
        break;
      case 0xE00002EF:
        CFStringRef v3 = @"kIOReturnIsoTooNew (isochronous I/O request for distant future)";
        break;
      case 0xE00002F0:
        CFStringRef v3 = @"kIOReturnNotFound (data was not found)";
        break;
      default:
        if (a1 != -536870911) {
          goto LABEL_9;
        }
        CFStringRef v3 = @"kIOReturnInvalid (should never be seen)";
        break;
    }
  }
  return +[NSString stringWithFormat:@"0x%08X %@", a1, v3, v1, v2];
}

id sub_100010190(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100010A94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [objc_alloc((Class)FudPersonalizationObjectInfo) initWithTag:v6];

  [v7 setDigest:v5];
  [v7 setTrusted:1];
  objc_msgSend(v7, "setEffectiveProductionMode:", objc_msgSend(*(id *)(a1 + 32), "productionMode"));
  objc_msgSend(v7, "setEffectiveSecurityMode:", objc_msgSend(*(id *)(a1 + 32), "securityMode"));
  [*(id *)(a1 + 40) addObject:v7];
}

void sub_1000113D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  objc_destroyWeak(location);
  _Block_object_dispose((const void *)(v33 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001143C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001144C(uint64_t a1)
{
}

void sub_100011454(uint64_t a1, uint64_t a2)
{
}

void sub_100011460(uint64_t a1)
{
}

void sub_100011468(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  id v5 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_19;
  }
  id v6 = [WeakRetained logHandle];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100017E04();
  }

  id v7 = +[NSNotificationCenter defaultCenter];
  uint64_t v8 = [v5 personalizationObserver];
  [v7 removeObserver:v8];

  [v5 setPersonalizationObserver:0];
  uint64_t v9 = [v3 object];
  if (v9)
  {
    id v10 = [*(id *)(a1 + 32) createAFUManifest:v9];
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v11 = NSHomeDirectory();
      uint64_t v12 = +[NSDate date];
      int v13 = +[NSString stringWithFormat:@"manifest %@.afu", v12];

      unsigned int v14 = [v11 stringByAppendingPathComponent:v13];
      unsigned int v15 = [v10 writeToFile:v14 atomically:1];
      uint64_t v16 = [v5 logHandle];
      __int16 v17 = v16;
      if (v15)
      {
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v31 = v14;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Personalized manifest written to %@", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        sub_100017D90();
      }
    }
    uint64_t v20 = [v5 sendSingleFirmwareToDevice:v10 totalPrepareBytes:0 bytesSent:0 featureReportDelay:*(void *)(a1 + 40)];
  }
  else
  {
    unsigned int v18 = [v3 userInfo];
    uint64_t v19 = [v18 objectForKeyedSubscript:@"Error"];

    if (!v19)
    {
      id v24 = objc_alloc((Class)NSError);
      id v10 = [v5 errorDomain];
      NSErrorUserInfoKey v28 = NSLocalizedDescriptionKey;
      CFStringRef v29 = @"No personalized manifest";
      uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
      id v25 = [v24 initWithDomain:v10 code:52 userInfo:v22];
      uint64_t v26 = *(void *)(*(void *)(a1 + 56) + 8);
      id v27 = *(void **)(v26 + 40);
      *(void *)(v26 + 40) = v25;

      goto LABEL_16;
    }
    id v10 = [v3 userInfo];
    uint64_t v20 = [v10 objectForKeyedSubscript:@"Error"];
  }
  uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;
LABEL_16:

  uint64_t v23 = *(NSObject **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v23) {
    dispatch_semaphore_signal(v23);
  }

LABEL_19:
}

intptr_t sub_1000121C8(NSObject *a1, io_iterator_t iterator)
{
  while (IOIteratorNext(iterator))
    ;
  +[NSThread sleepForTimeInterval:1.0];
  return dispatch_semaphore_signal(a1);
}

void sub_100014820(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 56)) {
    return;
  }
  uint64_t v2 = (const void *)IOPSCopyPowerSourcesByType();
  if (!v2) {
    goto LABEL_19;
  }
  id v3 = v2;
  CFArrayRef v4 = IOPSCopyPowerSourcesList(v2);
  if (!v4) {
    goto LABEL_18;
  }
  CFArrayRef v5 = v4;
  CFIndex Count = CFArrayGetCount(v4);
  if (Count < 1) {
    goto LABEL_17;
  }
  CFIndex v7 = Count;
  CFIndex v8 = 0;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v5, v8);
    if (!ValueAtIndex) {
      goto LABEL_14;
    }
    CFDictionaryRef v10 = IOPSGetPowerSourceDescription(v3, ValueAtIndex);
    if (!v10) {
      goto LABEL_14;
    }
    uint64_t v11 = +[NSDictionary dictionaryWithDictionary:v10];
    if (!*(unsigned char *)(a1 + 40)) {
      goto LABEL_25;
    }
    uint64_t v12 = [*(id *)(a1 + 32) serialNumber];
    int v13 = [v11 objectForKeyedSubscript:@"Accessory Identifier"];
    unsigned __int8 v14 = [v12 isEqualToString:v13];

    if (v14) {
      break;
    }
    if (!*(unsigned char *)(a1 + 40))
    {
LABEL_25:
      unsigned int v15 = [*(id *)(a1 + 32) productName];
      uint64_t v16 = [v11 objectForKeyedSubscript:@"Name"];
      unsigned __int8 v17 = [v15 isEqualToString:v16];

      if (v17) {
        break;
      }
    }

LABEL_14:
    if (v7 == ++v8) {
      goto LABEL_17;
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v11);

LABEL_17:
  CFRelease(v5);
LABEL_18:
  CFRelease(v3);
LABEL_19:
  unsigned int v18 = *(void **)(a1 + 32);
  if (v18[7])
  {
    uint64_t v19 = [v18 powerSemaphore];
    dispatch_semaphore_signal(v19);
  }
}

uint64_t sub_1000149FC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) logHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100018120();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100014CDC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_100014CFC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_100015554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a21, 8);
  objc_destroyWeak(location);
  _Block_object_dispose(&a33, 8);
  objc_destroyWeak((id *)(v33 - 160));
  _Block_object_dispose((const void *)(v33 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000155B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000155C4(uint64_t a1)
{
}

void sub_1000155CC(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  CFArrayRef v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained logHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 56);
      int v8 = 136315138;
      uint64_t v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received notification %s", (uint8_t *)&v8, 0xCu);
    }

    notify_cancel(a2);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = -1;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

intptr_t sub_1000156B8(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v7 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v14 = [*(id *)(a1 + 32) mobileAssetType];
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = (uint64_t)v14;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "MobileAsset catalog download succeeded for %@", buf, 0xCu);
    }
    goto LABEL_11;
  }
  if (a2 != 13)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    unsigned int v15 = [*(id *)(a1 + 32) mobileAssetType];
    uint64_t v7 = +[NSString stringWithFormat:@"Catalog download failed for %@ with MADownloadResult %ld", v15, a2];

    id v16 = objc_alloc((Class)NSError);
    unsigned __int8 v17 = [*(id *)(a1 + 32) errorDomain];
    NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
    id v24 = v7;
    unsigned int v18 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    id v19 = [v16 initWithDomain:v17 code:50 userInfo:v18];
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v21 = *(void **)(v20 + 40);
    *(void *)(v20 + 40) = v19;

    goto LABEL_11;
  }
  if (!*(_DWORD *)(a1 + 72))
  {
    uint64_t v4 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = 3600;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "MobileAsset daemon not ready. Wait up to %lld seconds.", buf, 0xCu);
    }

    dispatch_time_t v5 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), v5))
    {
      id v6 = [*(id *)(a1 + 32) mobileAssetType];
      uint64_t v7 = +[NSString stringWithFormat:@"Catalog download timed out for %@ with MADownloadResult %ld", v6, 13];

      id v8 = objc_alloc((Class)NSError);
      uint64_t v9 = [*(id *)(a1 + 32) errorDomain];
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      uint64_t v26 = v7;
      uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v11 = [v8 initWithDomain:v9 code:50 userInfo:v10];
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      int v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
LABEL_11:
    }
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_100016748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100016784(uint64_t a1, uint64_t a2)
{
  if (a2 != 10 && a2)
  {
    uint64_t v4 = +[NSString stringWithFormat:@"MobileAsset download failed with MADownloadResult %ld", a2];
    id v5 = objc_alloc((Class)NSError);
    id v6 = [*(id *)(a1 + 32) errorDomain];
    NSErrorUserInfoKey v12 = NSLocalizedDescriptionKey;
    int v13 = v4;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    id v8 = [v5 initWithDomain:v6 code:49 userInfo:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v3 = [*(id *)(a1 + 40) getLocalUrl];
    [*(id *)(a1 + 32) setFirmwareDirectory:v3];

    uint64_t v4 = [*(id *)(a1 + 32) logHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100018528((id *)(a1 + 32));
    }
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_100016938(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

int main(int argc, const char **argv, const char **envp)
{
  os_log_t v3 = os_log_create("com.apple.StandaloneHIDFudPlugins", "main");
  signal(15, (void (__cdecl *)(int))1);
  uint64_t v4 = dispatch_get_global_queue(33, 0);
  id v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v4);

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100016A60;
  handler[3] = &unk_100024698;
  os_log_t v9 = v3;
  id v6 = v3;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_activate(v5);
  +[AUServiceManager startService];

  return 0;
}

void sub_100016A60(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "FW update aborted due to SIGTERM", v2, 2u);
  }
  exit(1);
}

void sub_100016AB8()
{
  sub_10000BE1C();
  sub_10000BDE4((void *)&_mh_execute_header, v0, v1, "Device enumerated", v2, v3, v4, v5, v6);
}

void sub_100016AEC()
{
  sub_10000BE1C();
  sub_10000BDE4((void *)&_mh_execute_header, v0, v1, ".", v2, v3, v4, v5, v6);
}

void sub_100016B20()
{
  sub_10000BE28();
  sub_10000BDC8((void *)&_mh_execute_header, v0, v1, "%@", v2, v3, v4, v5, v6);
}

void sub_100016B88()
{
  sub_10000BE50();
  sub_10000BE00((void *)&_mh_execute_header, v0, v1, "BTSessionAttachWithQueue failed: %d\n", v2, v3, v4, v5, v6);
}

void sub_100016BF0()
{
  sub_10000BE1C();
  sub_10000BE34((void *)&_mh_execute_header, v0, v1, "Timed out while waiting for bt Session to arrive", v2, v3, v4, v5, v6);
}

void sub_100016C24()
{
  sub_10000BE1C();
  sub_10000BE34((void *)&_mh_execute_header, v0, v1, "No Bluetooth session", v2, v3, v4, v5, v6);
}

void sub_100016C58()
{
  sub_10000BE50();
  sub_10000BE00((void *)&_mh_execute_header, v0, v1, "BTDeviceConnect failed: %d", v2, v3, v4, v5, v6);
}

void sub_100016CC0()
{
  sub_10000BE1C();
  sub_10000BDE4((void *)&_mh_execute_header, v0, v1, "Attempt to reconnect device...", v2, v3, v4, v5, v6);
}

void sub_100016CF4()
{
  sub_10000BE50();
  sub_10000BE00((void *)&_mh_execute_header, v0, v1, "BTDeviceFromAddress failed: %d", v2, v3, v4, v5, v6);
}

void sub_100016D5C()
{
  sub_10000BE50();
  sub_10000BE00((void *)&_mh_execute_header, v0, v1, "BTDeviceAddressFromString failed: %d", v2, v3, v4, v5, v6);
}

void sub_100016DC4(void *a1)
{
  uint64_t v1 = [a1 bootstrapDelay];
  [v1 intValue];
  sub_10000BE50();
  sub_10000BE5C();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 8u);
}

void sub_100016E54()
{
  sub_10000BE28();
  sub_10000BDC8((void *)&_mh_execute_header, v0, v1, "options %@", v2, v3, v4, v5, v6);
}

void sub_100016EBC()
{
  sub_10000BE1C();
  sub_10000BDE4((void *)&_mh_execute_header, v0, v1, "CBCentralManager state powered on", v2, v3, v4, v5, v6);
}

void sub_100016EF0(void *a1)
{
  [a1 state];
  sub_10000BE28();
  sub_10000BE5C();
  _os_log_debug_impl(v1, v2, v3, v4, v5, 0xCu);
}

void sub_100016F70()
{
  sub_10000BE1C();
  sub_10000BE34((void *)&_mh_execute_header, v0, v1, "Device does not have a supported hardware version", v2, v3, v4, v5, v6);
}

void sub_100016FA4()
{
  sub_10000BE1C();
  sub_10000BDE4((void *)&_mh_execute_header, v0, v1, "Created power assertion to prevent idle system sleep", v2, v3, v4, v5, v6);
}

void sub_100016FD8()
{
  sub_10000BE50();
  sub_10000BE00((void *)&_mh_execute_header, v0, v1, "Failed to create power assertion: 0x%08X", v2, v3, v4, v5, v6);
}

void sub_100017040()
{
  sub_10000BE1C();
  sub_10000BDE4((void *)&_mh_execute_header, v0, v1, "Released power assertion", v2, v3, v4, v5, v6);
}

void sub_100017074()
{
  sub_10000BE50();
  sub_10000BE00((void *)&_mh_execute_header, v0, v1, "Failed to release sleep assertion: 0x%08X", v2, v3, v4, v5, v6);
}

void sub_1000170DC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001714C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000171C4()
{
  sub_10000BE1C();
  sub_10000BDE4((void *)&_mh_execute_header, v0, v1, "User inactivity task already performed.", v2, v3, v4, v5, v6);
}

void sub_1000171F8()
{
  sub_10000BE28();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "outUserActive 0x%llX mostSignificantActivity 0x%llX", v2, 0x16u);
}

void sub_10001727C()
{
  sub_10000BE28();
  sub_10000BDC8((void *)&_mh_execute_header, v0, v1, "Previously seen registry entry IDs %@", v2, v3, v4, v5, v6);
}

void sub_1000172E4()
{
  sub_10000BE28();
  sub_10000BDC8((void *)&_mh_execute_header, v0, v1, "Removing previously seen registry entry ID %@", v2, v3, v4, v5, v6);
}

void sub_10001734C(void *a1)
{
  uint64_t v1 = [a1 firmwareDirectory];
  sub_10000BE28();
  sub_10000BE5C();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0x16u);
}

void sub_1000173F0()
{
  sub_10000BE1C();
  sub_10000BE34((void *)&_mh_execute_header, v0, v1, "Received NULL FudPersonalizationRequest", v2, v3, v4, v5, v6);
}

void sub_100017424()
{
  sub_10000BE1C();
  sub_10000BDE4((void *)&_mh_execute_header, v0, v1, "Received personalization response (plugin)", v2, v3, v4, v5, v6);
}

void sub_100017458(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FTAB too short. Length (%lu bytes) < AFU header + ftab min length", (uint8_t *)&v2, 0xCu);
}

void sub_1000174D0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FTAB not long enough for file count : %u", (uint8_t *)v2, 8u);
}

void sub_100017548(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "FTAB not long enough to fit offset + length", v1, 2u);
}

void sub_10001758C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "loading firmware files from directory %@", (uint8_t *)&v2, 0xCu);
}

void sub_100017604(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "options %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001767C(int a1)
{
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unknown FW Source %d", (uint8_t *)v1, 8u);
}

void sub_1000176FC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, ".", v1, 2u);
}

void sub_100017740(unsigned __int8 a1, uint64_t a2, NSObject *a3)
{
  int v4 = a2;
  int v5 = a1;
  uint8_t v6 = SHFUIOReturnString(a2);
  v7[0] = 67109634;
  v7[1] = v5;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 2112;
  id v11 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "reportID 0x%02X error 0x%08X %@", (uint8_t *)v7, 0x18u);
}

void sub_100017804()
{
  sub_10000BE1C();
  sub_10000BDE4((void *)&_mh_execute_header, v0, v1, "Log FW versions to CoreAnalytics", v2, v3, v4, v5, v6);
}

void sub_100017838()
{
  sub_10000BE28();
  sub_10000BDC8((void *)&_mh_execute_header, v0, v1, "No CoreAnalytics timestamp for %@", v2, v3, v4, v5, v6);
}

void sub_1000178A0()
{
  sub_100014CC4();
  sub_100014CDC((void *)&_mh_execute_header, v0, v1, "CoreAnalytics timestamp %@ for %@ in the future");
}

void sub_100017908()
{
  sub_100014CC4();
  sub_100014CDC((void *)&_mh_execute_header, v0, v1, "CoreAnalytics timestamp %@ for %@ within past 24 hours");
}

void sub_100017970()
{
  sub_10000BE28();
  sub_10000BDC8((void *)&_mh_execute_header, v0, v1, "CoreAnalytics timestamps: %@", v2, v3, v4, v5, v6);
}

void sub_1000179D8()
{
  sub_10000BE28();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "%@ already has FW version 0x%X installed. Will not attempt to reinstall same FW version.", v2, 0x12u);
}

void sub_100017A5C()
{
  sub_10000BE1C();
  sub_10000BDE4((void *)&_mh_execute_header, v0, v1, "R1 FW has booted", v2, v3, v4, v5, v6);
}

void sub_100017A90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017B08(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 189;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Personalization info feature report ID 0x%02X failed.", buf, 8u);
}

void sub_100017B54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017BCC(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Reset R1 FW due to invalid R1 FW version 0x%02X", (uint8_t *)v1, 8u);
}

void sub_100017C4C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Reset R1 FW due to personalization failure %@", (uint8_t *)&v3, 0xCu);
}

void sub_100017CCC(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *a2 = 120;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Personalization request sent. Wait up to %lld seconds for response.", buf, 0xCu);
}

void sub_100017D18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100017D90()
{
  sub_10000BE28();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to write personalized manifest to %@", v1, 0xCu);
}

void sub_100017E04()
{
  sub_10000BE1C();
  sub_10000BDE4((void *)&_mh_execute_header, v0, v1, "Received personalization response (device)", v2, v3, v4, v5, v6);
}

void sub_100017E38(void *a1)
{
  [a1 initReportDelay];
  sub_100014CFC((void *)&_mh_execute_header, v1, v2, "waking from sleep of %d seconds", v3, v4, v5, v6, 0);
}

void sub_100017EB4(void *a1)
{
  [a1 initReportDelay];
  sub_100014CFC((void *)&_mh_execute_header, v1, v2, "sleeping for %d seconds", v3, v4, v5, v6, 0);
}

void sub_100017F30()
{
  sub_10000BE1C();
  sub_10000BDE4((void *)&_mh_execute_header, v0, v1, "all firmware types have up to date versions", v2, v3, v4, v5, v6);
}

void sub_100017F64()
{
  sub_10000BE1C();
  sub_10000BDE4((void *)&_mh_execute_header, v0, v1, "all firmware types do not have equal versions", v2, v3, v4, v5, v6);
}

void sub_100017F98(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100018010(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = +[AUFileParser auTypeString:1];
  sub_10000BE28();
  __int16 v6 = 1024;
  int v7 = 1;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 1024;
  int v11 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@ (%d) version 0x%x (%d)", v5, 0x1Eu);
}

void sub_1000180E0()
{
  sub_10000BE1C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Timed out waiting for the accessory's power source.", v1, 2u);
}

void sub_100018120()
{
  sub_10000BE1C();
  sub_10000BDE4((void *)&_mh_execute_header, v0, v1, "An accessory with power source was added/removed to/from the system", v2, v3, v4, v5, v6);
}

void sub_100018154(uint64_t a1, char a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "options %@ remote %d", (uint8_t *)&v3, 0x12u);
}

void sub_1000181E0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  uint64_t v3 = ASAttributeContentVersion;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Max %@: %@", (uint8_t *)&v2, 0x16u);
}

void sub_100018270(void *a1)
{
  uint64_t v1 = [a1 results];
  sub_10000BE28();
  sub_100016938((void *)&_mh_execute_header, v2, v3, "MAAssetQuery.results %@", v4, v5, v6, v7, v8);
}

void sub_1000182F4(void *a1)
{
  uint64_t v1 = [a1 mobileAssetType];
  sub_10000BE28();
  sub_100016938((void *)&_mh_execute_header, v2, v3, "MobileAsset query succeeded for %@", v4, v5, v6, v7, v8);
}

void sub_100018378(void *a1)
{
  uint64_t v1 = [a1 searchLocal];
  sub_10000BE28();
  sub_100016938((void *)&_mh_execute_header, v2, v3, "searchLocal %@", v4, v5, v6, v7, v8);
}

void sub_1000183FC(uint64_t a1, char a2, NSObject *a3)
{
  int v4 = 138412802;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = a2 & 1;
  __int16 v8 = 1024;
  unsigned int v9 = +[ASAsset nonUserInitiatedDownloadsAllowed];
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "options %@ remote %d nonUserInitiatedDownloadsAllowed %d", (uint8_t *)&v4, 0x18u);
}

void sub_1000184B4()
{
  sub_10000BE28();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "options %@", v1, 0xCu);
}

void sub_100018528(id *a1)
{
  uint64_t v1 = [*a1 firmwareDirectory];
  sub_10000BE28();
  sub_100016938((void *)&_mh_execute_header, v2, v3, "asset URL %@", v4, v5, v6, v7, v8);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BTDeviceAddressFromString()
{
  return _BTDeviceAddressFromString();
}

uint64_t BTDeviceConnect()
{
  return _BTDeviceConnect();
}

uint64_t BTDeviceFromAddress()
{
  return _BTDeviceFromAddress();
}

uint64_t BTSessionAttachWithQueue()
{
  return _BTSessionAttachWithQueue();
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return _CFAllocatorGetDefault();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return _IOHIDDeviceClose(device, options);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return _IOHIDDeviceCreate(allocator, service);
}

IOReturn IOHIDDeviceGetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength)
{
  return _IOHIDDeviceGetReport(device, reportType, reportID, report, pReportLength);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return _IOHIDDeviceOpen(device, options);
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return _IOHIDDeviceSetReport(device, reportType, reportID, report, reportLength);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
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

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithName(AssertionType, AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

uint64_t IOPMScheduleUserActivityLevelNotificationWithTimeout()
{
  return _IOPMScheduleUserActivityLevelNotificationWithTimeout();
}

uint64_t IOPMUnregisterNotification()
{
  return _IOPMUnregisterNotification();
}

uint64_t IOPSCopyPowerSourcesByType()
{
  return _IOPSCopyPowerSourcesByType();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return _IOPSCopyPowerSourcesList(blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return _IOPSGetPowerSourceDescription(blob, ps);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return _IORegistryEntryGetName(entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return _SCNetworkReachabilityCreateWithAddress(allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return _SCNetworkReachabilitySetCallback(target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return _SCNetworkReachabilitySetDispatchQueue(target, queue);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __memmove_chk()
{
  return ___memmove_chk();
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

uint64_t ccdigest()
{
  return _ccdigest();
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return _crc32(crc, buf, len);
}

void dispatch_activate(dispatch_object_t object)
{
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_moveWeak(id *to, id *from)
{
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

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

id objc_msgSend_GATTServicesDiscoveryNeeded(void *a1, const char *a2, ...)
{
  return [a1 GATTServicesDiscoveryNeeded];
}

id objc_msgSend_R1FWVersion(void *a1, const char *a2, ...)
{
  return [a1 R1FWVersion];
}

id objc_msgSend_STFWFirst(void *a1, const char *a2, ...)
{
  return [a1 STFWFirst];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_abortUpdate(void *a1, const char *a2, ...)
{
  return [a1 abortUpdate];
}

id objc_msgSend_allowDowngrade(void *a1, const char *a2, ...)
{
  return [a1 allowDowngrade];
}

id objc_msgSend_assetId(void *a1, const char *a2, ...)
{
  return [a1 assetId];
}

id objc_msgSend_assetServerUrl(void *a1, const char *a2, ...)
{
  return [a1 assetServerUrl];
}

id objc_msgSend_assetType(void *a1, const char *a2, ...)
{
  return [a1 assetType];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_batteryCapacity(void *a1, const char *a2, ...)
{
  return [a1 batteryCapacity];
}

id objc_msgSend_batteryCheckDevice(void *a1, const char *a2, ...)
{
  return [a1 batteryCheckDevice];
}

id objc_msgSend_batteryCheckHost(void *a1, const char *a2, ...)
{
  return [a1 batteryCheckHost];
}

id objc_msgSend_batteryTimer(void *a1, const char *a2, ...)
{
  return [a1 batteryTimer];
}

id objc_msgSend_batteryToken(void *a1, const char *a2, ...)
{
  return [a1 batteryToken];
}

id objc_msgSend_bluetoothPoweredOn(void *a1, const char *a2, ...)
{
  return [a1 bluetoothPoweredOn];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bootstrapDelay(void *a1, const char *a2, ...)
{
  return [a1 bootstrapDelay];
}

id objc_msgSend_btAddress(void *a1, const char *a2, ...)
{
  return [a1 btAddress];
}

id objc_msgSend_btReconnectDelay(void *a1, const char *a2, ...)
{
  return [a1 btReconnectDelay];
}

id objc_msgSend_btSession(void *a1, const char *a2, ...)
{
  return [a1 btSession];
}

id objc_msgSend_btSessionArrived(void *a1, const char *a2, ...)
{
  return [a1 btSessionArrived];
}

id objc_msgSend_btSessionSemaphore(void *a1, const char *a2, ...)
{
  return [a1 btSessionSemaphore];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_centralManager(void *a1, const char *a2, ...)
{
  return [a1 centralManager];
}

id objc_msgSend_className(void *a1, const char *a2, ...)
{
  return [a1 className];
}

id objc_msgSend_clearNotification(void *a1, const char *a2, ...)
{
  return [a1 clearNotification];
}

id objc_msgSend_clearOldRegistryEntryIDs(void *a1, const char *a2, ...)
{
  return [a1 clearOldRegistryEntryIDs];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commitAllFirmwares(void *a1, const char *a2, ...)
{
  return [a1 commitAllFirmwares];
}

id objc_msgSend_compatibilityVersion(void *a1, const char *a2, ...)
{
  return [a1 compatibilityVersion];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createPowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 createPowerAssertion];
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

id objc_msgSend_delayAfterInitReport(void *a1, const char *a2, ...)
{
  return [a1 delayAfterInitReport];
}

id objc_msgSend_delayBootstrap(void *a1, const char *a2, ...)
{
  return [a1 delayBootstrap];
}

id objc_msgSend_delayBootstrapSource(void *a1, const char *a2, ...)
{
  return [a1 delayBootstrapSource];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deviceAddress(void *a1, const char *a2, ...)
{
  return [a1 deviceAddress];
}

id objc_msgSend_deviceNeedsBTReconnect(void *a1, const char *a2, ...)
{
  return [a1 deviceNeedsBTReconnect];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downloadCatalog(void *a1, const char *a2, ...)
{
  return [a1 downloadCatalog];
}

id objc_msgSend_ecID(void *a1, const char *a2, ...)
{
  return [a1 ecID];
}

id objc_msgSend_equivalentPIDs(void *a1, const char *a2, ...)
{
  return [a1 equivalentPIDs];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_errorDomain(void *a1, const char *a2, ...)
{
  return [a1 errorDomain];
}

id objc_msgSend_executeNextBootstrapAction(void *a1, const char *a2, ...)
{
  return [a1 executeNextBootstrapAction];
}

id objc_msgSend_featureReportDelay(void *a1, const char *a2, ...)
{
  return [a1 featureReportDelay];
}

id objc_msgSend_firmwareDirectory(void *a1, const char *a2, ...)
{
  return [a1 firmwareDirectory];
}

id objc_msgSend_fwVersions(void *a1, const char *a2, ...)
{
  return [a1 fwVersions];
}

id objc_msgSend_getFTABDigests(void *a1, const char *a2, ...)
{
  return [a1 getFTABDigests];
}

id objc_msgSend_getFirmwareType(void *a1, const char *a2, ...)
{
  return [a1 getFirmwareType];
}

id objc_msgSend_getFirmwareVersion(void *a1, const char *a2, ...)
{
  return [a1 getFirmwareVersion];
}

id objc_msgSend_getHardwareRevisionID(void *a1, const char *a2, ...)
{
  return [a1 getHardwareRevisionID];
}

id objc_msgSend_getLocalFileUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalFileUrl];
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return [a1 getLocalUrl];
}

id objc_msgSend_getPID(void *a1, const char *a2, ...)
{
  return [a1 getPID];
}

id objc_msgSend_hardwareVersion(void *a1, const char *a2, ...)
{
  return [a1 hardwareVersion];
}

id objc_msgSend_hasPowerSource(void *a1, const char *a2, ...)
{
  return [a1 hasPowerSource];
}

id objc_msgSend_headerSignature(void *a1, const char *a2, ...)
{
  return [a1 headerSignature];
}

id objc_msgSend_hostBatteryCapacity(void *a1, const char *a2, ...)
{
  return [a1 hostBatteryCapacity];
}

id objc_msgSend_hostBatteryOnACPower(void *a1, const char *a2, ...)
{
  return [a1 hostBatteryOnACPower];
}

id objc_msgSend_hostConnectedToNetwork(void *a1, const char *a2, ...)
{
  return [a1 hostConnectedToNetwork];
}

id objc_msgSend_hostPowerSource(void *a1, const char *a2, ...)
{
  return [a1 hostPowerSource];
}

id objc_msgSend_ignoreVersionCheck(void *a1, const char *a2, ...)
{
  return [a1 ignoreVersionCheck];
}

id objc_msgSend_inactivityDelay(void *a1, const char *a2, ...)
{
  return [a1 inactivityDelay];
}

id objc_msgSend_inactivityDelayPreflight(void *a1, const char *a2, ...)
{
  return [a1 inactivityDelayPreflight];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_initReportDelay(void *a1, const char *a2, ...)
{
  return [a1 initReportDelay];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interfaceNum(void *a1, const char *a2, ...)
{
  return [a1 interfaceNum];
}

id objc_msgSend_latestFirmwareVersions(void *a1, const char *a2, ...)
{
  return [a1 latestFirmwareVersions];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_locationID(void *a1, const char *a2, ...)
{
  return [a1 locationID];
}

id objc_msgSend_logHandle(void *a1, const char *a2, ...)
{
  return [a1 logHandle];
}

id objc_msgSend_loggingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 loggingIdentifier];
}

id objc_msgSend_manifestCount(void *a1, const char *a2, ...)
{
  return [a1 manifestCount];
}

id objc_msgSend_matchSemaphore(void *a1, const char *a2, ...)
{
  return [a1 matchSemaphore];
}

id objc_msgSend_minBatteryDevice(void *a1, const char *a2, ...)
{
  return [a1 minBatteryDevice];
}

id objc_msgSend_minBatteryHost(void *a1, const char *a2, ...)
{
  return [a1 minBatteryHost];
}

id objc_msgSend_mobileAssetType(void *a1, const char *a2, ...)
{
  return [a1 mobileAssetType];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_networkDelay(void *a1, const char *a2, ...)
{
  return [a1 networkDelay];
}

id objc_msgSend_networkReachability(void *a1, const char *a2, ...)
{
  return [a1 networkReachability];
}

id objc_msgSend_networkStatus(void *a1, const char *a2, ...)
{
  return [a1 networkStatus];
}

id objc_msgSend_nonUserInitiatedDownloadsAllowed(void *a1, const char *a2, ...)
{
  return [a1 nonUserInitiatedDownloadsAllowed];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_parsers(void *a1, const char *a2, ...)
{
  return [a1 parsers];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_personalizationObserver(void *a1, const char *a2, ...)
{
  return [a1 personalizationObserver];
}

id objc_msgSend_personalizationParser(void *a1, const char *a2, ...)
{
  return [a1 personalizationParser];
}

id objc_msgSend_personalizationRequired(void *a1, const char *a2, ...)
{
  return [a1 personalizationRequired];
}

id objc_msgSend_personalizationSemaphore(void *a1, const char *a2, ...)
{
  return [a1 personalizationSemaphore];
}

id objc_msgSend_plugin(void *a1, const char *a2, ...)
{
  return [a1 plugin];
}

id objc_msgSend_pluginInfo(void *a1, const char *a2, ...)
{
  return [a1 pluginInfo];
}

id objc_msgSend_pmNotificationHandle(void *a1, const char *a2, ...)
{
  return [a1 pmNotificationHandle];
}

id objc_msgSend_powerAssertionID(void *a1, const char *a2, ...)
{
  return [a1 powerAssertionID];
}

id objc_msgSend_powerSemaphore(void *a1, const char *a2, ...)
{
  return [a1 powerSemaphore];
}

id objc_msgSend_powerSource(void *a1, const char *a2, ...)
{
  return [a1 powerSource];
}

id objc_msgSend_powerSourceTimedOut(void *a1, const char *a2, ...)
{
  return [a1 powerSourceTimedOut];
}

id objc_msgSend_primaryUsage(void *a1, const char *a2, ...)
{
  return [a1 primaryUsage];
}

id objc_msgSend_primaryUsagePage(void *a1, const char *a2, ...)
{
  return [a1 primaryUsagePage];
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return [a1 productID];
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return [a1 productName];
}

id objc_msgSend_productionMode(void *a1, const char *a2, ...)
{
  return [a1 productionMode];
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return [a1 queryMetaDataSync];
}

id objc_msgSend_reconnectDeviceToHost(void *a1, const char *a2, ...)
{
  return [a1 reconnectDeviceToHost];
}

id objc_msgSend_registerForMatchNotification(void *a1, const char *a2, ...)
{
  return [a1 registerForMatchNotification];
}

id objc_msgSend_registryEntryID(void *a1, const char *a2, ...)
{
  return [a1 registryEntryID];
}

id objc_msgSend_releasePowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 releasePowerAssertion];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetEveryFWPayload(void *a1, const char *a2, ...)
{
  return [a1 resetEveryFWPayload];
}

id objc_msgSend_resetSecureFW(void *a1, const char *a2, ...)
{
  return [a1 resetSecureFW];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_searchLocal(void *a1, const char *a2, ...)
{
  return [a1 searchLocal];
}

id objc_msgSend_securityMode(void *a1, const char *a2, ...)
{
  return [a1 securityMode];
}

id objc_msgSend_sendOffsets(void *a1, const char *a2, ...)
{
  return [a1 sendOffsets];
}

id objc_msgSend_sendPersonalizedFirmwareToDevice(void *a1, const char *a2, ...)
{
  return [a1 sendPersonalizedFirmwareToDevice];
}

id objc_msgSend_sendPersonalizedManifestsToDevice(void *a1, const char *a2, ...)
{
  return [a1 sendPersonalizedManifestsToDevice];
}

id objc_msgSend_sendSDPQueryNotification(void *a1, const char *a2, ...)
{
  return [a1 sendSDPQueryNotification];
}

id objc_msgSend_sendUberInitAndCommit(void *a1, const char *a2, ...)
{
  return [a1 sendUberInitAndCommit];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_setupBTSession(void *a1, const char *a2, ...)
{
  return [a1 setupBTSession];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startService(void *a1, const char *a2, ...)
{
  return [a1 startService];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return [a1 stringByStandardizingPath];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_tagForBluetoothGATTServicesDiscovery(void *a1, const char *a2, ...)
{
  return [a1 tagForBluetoothGATTServicesDiscovery];
}

id objc_msgSend_targetDevice(void *a1, const char *a2, ...)
{
  return [a1 targetDevice];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_transport(void *a1, const char *a2, ...)
{
  return [a1 transport];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_updateFlags(void *a1, const char *a2, ...)
{
  return [a1 updateFlags];
}

id objc_msgSend_useFWUpdateReportIDs(void *a1, const char *a2, ...)
{
  return [a1 useFWUpdateReportIDs];
}

id objc_msgSend_userInactivityStatus(void *a1, const char *a2, ...)
{
  return [a1 userInactivityStatus];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return [a1 vendorID];
}

id objc_msgSend_verifyDeviceBattery(void *a1, const char *a2, ...)
{
  return [a1 verifyDeviceBattery];
}

id objc_msgSend_verifyHostBattery(void *a1, const char *a2, ...)
{
  return [a1 verifyHostBattery];
}

id objc_msgSend_verifyLatestFWVersions(void *a1, const char *a2, ...)
{
  return [a1 verifyLatestFWVersions];
}

id objc_msgSend_versionCheckDelay(void *a1, const char *a2, ...)
{
  return [a1 versionCheckDelay];
}

id objc_msgSend_waitForBTSession(void *a1, const char *a2, ...)
{
  return [a1 waitForBTSession];
}

id objc_msgSend_waitForNetwork(void *a1, const char *a2, ...)
{
  return [a1 waitForNetwork];
}

id objc_msgSend_waitForSecureFWReenumeration(void *a1, const char *a2, ...)
{
  return [a1 waitForSecureFWReenumeration];
}

id objc_msgSend_writeBufferSize(void *a1, const char *a2, ...)
{
  return [a1 writeBufferSize];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}