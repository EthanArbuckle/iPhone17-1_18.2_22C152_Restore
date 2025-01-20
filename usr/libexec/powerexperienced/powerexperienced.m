id sub_100001B94(uint64_t a1)
{
  const char *string;
  id result;
  void *v4;
  void *v5;
  uint64_t vars8;

  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), _xpc_event_key_name);
  if (!strcmp(string, "com.apple.request.hipuncap"))
  {
    v4 = *(void **)(a1 + 40);
    return [v4 handleNFCSession];
  }
  else
  {
    result = (id)strcmp(string, "com.apple.coreaudio.IORunning");
    if (!result)
    {
      v5 = *(void **)(a1 + 40);
      return [v5 handleAudioSession];
    }
  }
  return result;
}

void sub_100001E24(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  id v4 = +[SignalMonitor sharedInstance];
  [v4 handleXPCEvent:v2];
  v3 = +[DeviceContext sharedInstance];
  [v3 handleXPCEvent:v2];
}

void sub_10000244C(uint64_t a1)
{
  v2 = (void *)os_transaction_create();
  [*(id *)(a1 + 32) setTransaction:v2];

  v3 = [*(id *)(a1 + 32) resourceHints];
  id v4 = [*(id *)(a1 + 40) description];
  uint64_t v5 = [v3 objectForKeyedSubscript:v4];

  v6 = (ResourceHintWithProperties *)v5;
  if (!v5)
  {
    id v7 = [objc_alloc((Class)NSNumber) initWithInteger:[*(id *)(a1 + 48) processIdentifier]];
    v6 = [[ResourceHintWithProperties alloc] initWithResourceHint:*(void *)(a1 + 40) andPid:v7];
    v8 = [*(id *)(a1 + 32) resourceHints];
    v9 = [(ResourceHintWithProperties *)v6 description];
    [v8 setObject:v6 forKeyedSubscript:v9];

    v10 = (void *)qword_10001BE48;
    if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_INFO))
    {
      v11 = *(void **)(a1 + 40);
      v12 = v10;
      v13 = [v11 description];
      v14 = [(ResourceHintWithProperties *)v6 uuid];
      v15 = [(ResourceHintWithProperties *)v6 pid];
      int v27 = 138413058;
      v28 = v13;
      __int16 v29 = 2112;
      v30 = v14;
      __int16 v31 = 2112;
      id v32 = v15;
      __int16 v33 = 2048;
      id v34 = [(ResourceHintWithProperties *)v6 state];
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "ResourceManager: updateResourceHint creating resource %@ with UUID %@ for pid %@ with state: %lu", (uint8_t *)&v27, 0x2Au);
    }
    v16 = *(void **)(a1 + 32);
    v17 = [(ResourceHintWithProperties *)v6 pid];
    [v16 monitorProcessExit:[v17 intValue]];
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  id v18 = [*(id *)(a1 + 40) state];
  id v19 = [(ResourceHintWithProperties *)v6 state];
  if (!v5 || v18 != v19)
  {
    v20 = (void *)qword_10001BE48;
    if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_DEFAULT))
    {
      v21 = *(void **)(a1 + 40);
      v22 = v20;
      v23 = [v21 uuid];
      v24 = [*(id *)(a1 + 40) description];
      id v25 = [(ResourceHintWithProperties *)v6 state];
      id v26 = [*(id *)(a1 + 40) state];
      int v27 = 138413058;
      v28 = v23;
      __int16 v29 = 2112;
      v30 = v24;
      __int16 v31 = 2048;
      id v32 = v25;
      __int16 v33 = 2048;
      id v34 = v26;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "updating resource state for %@:%@ from %lu to %lu", (uint8_t *)&v27, 0x2Au);
    }
    -[ResourceHintWithProperties setState:](v6, "setState:", [*(id *)(a1 + 40) state]);
    [*(id *)(a1 + 32) evaluatePowerModes];
    [*(id *)(a1 + 32) saveState:v6];
  }
  [*(id *)(a1 + 32) setTransaction:0];
}

id sub_100003E44()
{
  if (qword_10001BE98 != -1) {
    dispatch_once(&qword_10001BE98, &stru_100014718);
  }
  v0 = (void *)qword_10001BF20;

  return v0;
}

void sub_100004088(id a1)
{
  qword_10001BDE0 = objc_alloc_init(ChargeDurationPredictor);

  _objc_release_x1();
}

void sub_1000044D4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
    *(_DWORD *)buf = 138412290;
    id v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Querying model for scheme %@", buf, 0xCu);
  }
  id v4 = [*(id *)(a1 + 32) predictor];
  v6 = (void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 40);
  id v16 = 0;
  id v7 = [v4 chargePredictionOutputOfScheme:v5 withError:&v16];
  id v8 = v16;

  v9 = *(void **)(a1 + 32);
  if (v8)
  {
    v10 = [v9 log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10000CB48(v6, (uint64_t)v8, v10);
    }
  }
  else
  {
    v11 = [v9 mainQueue];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000046A4;
    v13[3] = &unk_1000143B8;
    uint64_t v12 = *(void *)(a1 + 40);
    v13[4] = *(void *)(a1 + 32);
    uint64_t v15 = v12;
    id v14 = v7;
    dispatch_async(v11, v13);
  }
}

id sub_1000046A4(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"predictorOutput"];
  uint64_t v2 = *(void *)(a1 + 40);
  v3 = [*(id *)(a1 + 32) predictorOutput];
  id v4 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  [v3 setObject:v2 forKeyedSubscript:v4];

  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 didChangeValueForKey:@"predictorOutput"];
}

void sub_100004D20(id a1)
{
  qword_10001BDF0 = objc_alloc_init(AnalyticsLogger);

  _objc_release_x1();
}

void sub_100004F54(id *a1)
{
  id v2 = a1[4];
  id v3 = a1[5];
  id v4 = a1[6];
  id v5 = a1[7];
  id v6 = a1[8];
  id v7 = a1[9];
  AnalyticsSendEventLazy();
}

id sub_100005048(uint64_t a1)
{
  [*(id *)(a1 + 32) timeIntervalSinceDate:*(void *)(a1 + 40)];
  v7[0] = @"Duration";
  id v3 = +[NSNumber numberWithLong:(uint64_t)v2];
  uint64_t v4 = *(void *)(a1 + 48);
  v8[0] = v3;
  v8[1] = v4;
  v7[1] = @"PowerMode";
  v7[2] = @"ExitReason";
  long long v9 = *(_OWORD *)(a1 + 56);
  v7[3] = @"StartingBatteryLevel";
  v7[4] = @"EndingBatteryLevel";
  uint64_t v10 = *(void *)(a1 + 72);
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:5];

  return v5;
}

void sub_1000052D0(id a1)
{
  qword_10001BE08 = objc_alloc_init(InUseChargingMode);

  _objc_release_x1();
}

void sub_100005578(id a1)
{
  qword_10001BE18 = objc_alloc_init(LongChargingMode);

  _objc_release_x1();
}

void sub_100005940(id a1)
{
  qword_10001BE30 = objc_alloc_init(RestrictedPerfMode);

  _objc_release_x1();
}

void sub_100005FA8(id a1)
{
  qword_10001BE40 = objc_alloc_init(AcceleratedChargingMode);

  _objc_release_x1();
}

CFStringRef sub_100006094(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4) {
    return @"Unknown";
  }
  else {
    return off_1000144F0[a1 - 1];
  }
}

void sub_100006D80(uint64_t a1)
{
  double v2 = (void *)os_transaction_create();
  [*(id *)(a1 + 32) setTransaction:v2];

  id v16 = +[NSXPCConnection currentConnection];
  id v3 = [objc_alloc((Class)NSNumber) initWithInteger:[v16 processIdentifier]];
  uint64_t v4 = qword_10001BE48;
  if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "restoring resources from %@", buf, 0xCu);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = *(id *)(a1 + 40);
  id v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * (void)v9);
        v11 = [ResourceHintWithProperties alloc];
        uint64_t v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:v10];
        v13 = [(ResourceHintWithProperties *)v11 initWithResourceHint:v12 andPid:v3];

        if (v13)
        {
          id v14 = [*(id *)(a1 + 32) resourceHints];
          uint64_t v15 = [(ResourceHintWithProperties *)v13 description];
          [v14 setObject:v13 forKeyedSubscript:v15];
        }
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  [*(id *)(a1 + 32) evaluatePowerModes];
  [*(id *)(a1 + 32) setTransaction:0];
}

void sub_100007128(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSNumber) initWithInteger:[*(id *)(a1 + 32) processIdentifier]];
  id v3 = [[ResourceHintWithProperties alloc] initWithResourceHint:*(void *)(a1 + 40) andPid:v2];
  uint64_t v4 = [*(id *)(a1 + 48) resourceHints];
  id v5 = [*(id *)(a1 + 40) description];
  [v4 setObject:v3 forKeyedSubscript:v5];

  id v6 = (void *)qword_10001BE48;
  if (os_log_type_enabled((os_log_t)qword_10001BE48, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = *(void **)(a1 + 40);
    uint64_t v8 = v6;
    long long v9 = [v7 description];
    uint64_t v10 = *(void *)(a1 + 56);
    v11 = [(ResourceHintWithProperties *)v3 pid];
    int v14 = 138413058;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    __int16 v18 = 2112;
    long long v19 = v11;
    __int16 v20 = 2048;
    id v21 = [(ResourceHintWithProperties *)v3 state];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "ResourceManager: creating resource %@ with UUID %@ for pid %@ with state: %lu", (uint8_t *)&v14, 0x2Au);
  }
  [*(id *)(a1 + 48) evaluatePowerModes];
  [*(id *)(a1 + 48) saveState:v3];
  uint64_t v12 = *(void **)(a1 + 48);
  v13 = [(ResourceHintWithProperties *)v3 pid];
  [v12 monitorProcessExit:[v13 intValue]];

  [*(id *)(a1 + 48) setTransaction:0];
}

void sub_1000074D8(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [objc_alloc((Class)NSNumber) initWithInteger:*(int *)(a1 + 40)];
  [v1 handleProcessExit:v2];
}

id sub_100007BEC(uint64_t a1)
{
  return [*(id *)(a1 + 32) evaluatePowerModes];
}

void sub_100007E60(id a1)
{
  qword_10001BE50 = objc_alloc_init(ResourceManager);

  _objc_release_x1();
}

id sub_100008668(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleBatteryLevelChange];
}

id sub_100008670(uint64_t a1)
{
  id v2 = +[NSNumber numberWithBool:IOPSDrawingUnlimitedPower()];
  id v3 = [*(id *)(a1 + 32) currentContext];
  [v3 setObject:v2 forKeyedSubscript:@"kPluggedInContext"];

  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 handleBatteryLevelChange];
}

void sub_1000087E0(id a1)
{
  qword_10001BE70 = objc_alloc_init(DeviceContext);

  _objc_release_x1();
}

void sub_100008934(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000089A4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.powerexperienced", "powermodesserice");
  id v2 = (void *)qword_10001BE90;
  qword_10001BE90 = (uint64_t)v1;

  qword_10001BE80 = objc_alloc_init(PowerModesService);

  _objc_release_x1();
}

void sub_100008D2C(uint64_t a1)
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v2 = [*(id *)(a1 + 32) clients];
  id v3 = [v2 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v22;
    *(void *)&long long v4 = 138412802;
    long long v19 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v9 = [v8 interestedModes:v19];
        unsigned int v10 = [v9 containsObject:*(void *)(a1 + 40)];

        if (v10)
        {
          v11 = (void *)qword_10001BE90;
          if (os_log_type_enabled((os_log_t)qword_10001BE90, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v12 = v11;
            v13 = [v8 identifer];
            uint64_t v14 = *(void *)(a1 + 40);
            int v15 = *(unsigned __int8 *)(a1 + 48);
            *(_DWORD *)buf = v19;
            id v26 = v13;
            __int16 v27 = 2112;
            uint64_t v28 = v14;
            __int16 v29 = 1024;
            int v30 = v15;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating client %@ for mode %@:%d", buf, 0x1Cu);
          }
          __int16 v16 = [v8 connection];

          if (v16)
          {
            uint64_t v17 = [v8 connection];
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_100008F84;
            v20[3] = &unk_100014670;
            v20[4] = v8;
            __int16 v18 = [v17 remoteObjectProxyWithErrorHandler:v20];
            [v18 updateState:*(unsigned __int8 *)(a1 + 48) forMode:*(void *)(a1 + 40)];
          }
        }
      }
      id v5 = [v2 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v5);
  }
}

void sub_100008F84(uint64_t a1)
{
  id v2 = qword_10001BE90;
  if (os_log_type_enabled((os_log_t)qword_10001BE90, OS_LOG_TYPE_ERROR)) {
    sub_10000CEA0(a1, v2);
  }
}

void sub_1000090D4(uint64_t a1)
{
  id v2 = qword_10001BE90;
  if (os_log_type_enabled((os_log_t)qword_10001BE90, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Registering client %@ for modes %@", (uint8_t *)&v7, 0x16u);
  }
  id v5 = [[PowerModesClient alloc] initWithConnection:*(void *)(a1 + 48) identifier:*(void *)(a1 + 32) interestedModes:*(void *)(a1 + 40)];
  uint64_t v6 = [*(id *)(a1 + 56) clients];
  [v6 addObject:v5];
}

void start()
{
  uint64_t v1 = sub_100003E44();
  id v2 = (void *)qword_10001BF20;
  qword_10001BF20 = v1;

  uint64_t v3 = sub_100003E44();
  dispatch_sync(v3, &stru_1000146B8);

  uint64_t v4 = sub_100003E44();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v4, &stru_1000146F8);

  dispatch_main();
}

void sub_100009404(id a1)
{
  id v5 = +[ResourceManager sharedInstance];
  [v5 start];
  uint64_t v1 = +[SignalMonitor sharedInstance];
  [v1 start];
  id v2 = +[DeviceContext sharedInstance];
  [v2 start];
  uint64_t v3 = +[PowerModesService sharedInstance];
  [v3 start];
  uint64_t v4 = +[PowerModesManager sharedInstance];
  [v4 start];
}

void sub_1000094CC(id a1)
{
  uint64_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.powerexperieced.mainQueue", v3);
  id v2 = (void *)qword_10001BF20;
  qword_10001BF20 = (uint64_t)v1;
}

void sub_100009584(id a1)
{
  qword_10001BEA8 = objc_alloc_init(SMCSensorExchangeHelper);

  _objc_release_x1();
}

uint64_t sub_100009760()
{
  CFDictionaryRef v0 = IOServiceMatching("AppleSMC");
  io_service_t MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v0);
  if (!MatchingService)
  {
    uint64_t v3 = 3758097136;
    goto LABEL_15;
  }
  io_object_t v2 = MatchingService;
  uint64_t v3 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_10001BEB8);
  IOObjectRelease(v2);
  if (v3) {
    goto LABEL_15;
  }
  if (!dword_10001BEB8)
  {
    uint64_t v3 = 0;
    goto LABEL_15;
  }
  uint64_t v3 = IOConnectCallScalarMethod(dword_10001BEB8, 0, 0, 0, 0, 0);
  if (v3)
  {
LABEL_15:
    dword_10001BEB8 = 0;
    goto LABEL_16;
  }
  if (dword_10001BEB8)
  {
    strcpy(v15, "zEPE");
    long long v36 = xmmword_10001BF28;
    long long v34 = 0u;
    memset(v35, 0, sizeof(v35));
    memset(outputStruct, 0, sizeof(outputStruct));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v41 = unk_10001BF78;
    long long v42 = xmmword_10001BF88;
    long long v37 = unk_10001BF38;
    long long v38 = xmmword_10001BF48;
    size_t outputStructCnt = 168;
    uint64_t v32 = 0;
    BYTE2(v35[5]) = 6;
    int inputStruct = 2051362885;
    v35[2] = 120;
    uint64_t v43 = qword_10001BF98;
    long long v39 = unk_10001BF58;
    long long v40 = xmmword_10001BF68;
    uint64_t v4 = IOConnectCallStructMethod(dword_10001BEB8, 2u, &inputStruct, 0xA8uLL, outputStruct, &outputStructCnt);
    if (v4 || (uint64_t v3 = 0, BYTE8(v24)))
    {
      id v5 = qword_10001BEB0;
      if (os_log_type_enabled((os_log_t)qword_10001BEB0, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v18 = v15;
        __int16 v19 = 1024;
        int v20 = v4;
        __int16 v21 = 1024;
        int v22 = BYTE8(v24);
        _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Write failed for key '%s' (0x%X, 0x%X)", buf, 0x18u);
      }
      if (BYTE8(v24) == 132)
      {
        uint64_t v6 = qword_10001BEB0;
        if (os_log_type_enabled((os_log_t)qword_10001BEB0, OS_LOG_TYPE_ERROR)) {
          sub_10000CFF4(v6);
        }
      }
      uint64_t v3 = v4;
    }
    goto LABEL_18;
  }
  uint64_t v3 = 0;
LABEL_16:
  int v7 = qword_10001BEB0;
  if (os_log_type_enabled((os_log_t)qword_10001BEB0, OS_LOG_TYPE_ERROR)) {
    sub_10000CF88(v3, v7, v8, v9, v10, v11, v12, v13);
  }
LABEL_18:
  if (dword_10001BEB8 && !IOConnectCallScalarMethod(dword_10001BEB8, 1u, 0, 0, 0, 0)) {
    IOServiceClose(dword_10001BEB8);
  }
  return v3;
}

void sub_100009B90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t sub_100009C68(uint64_t a1)
{
  qword_10001BEC8 = [[CameraMonitor alloc] initWithQueue:*(void *)(a1 + 32)];

  return _objc_release_x1();
}

void sub_100009FE0(id a1)
{
  qword_10001BED0 = objc_alloc_init(SignalMonitor);

  _objc_release_x1();
}

id sub_10000A228(uint64_t a1)
{
  io_object_t v2 = qword_10001BEE0;
  if (os_log_type_enabled((os_log_t)qword_10001BEE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "NFC session ended. Dropping the resource hint", v5, 2u);
  }
  [*(id *)(a1 + 32) setNfcActive:0];
  uint64_t v3 = [*(id *)(a1 + 32) nfcResourceHint];
  [v3 updateState:0];

  return [*(id *)(a1 + 32) setNfcTransaction:0];
}

void sub_10000A3B8(id a1)
{
  qword_10001BEF8 = objc_alloc_init(CLPCPolicyInterfaceHelper);

  _objc_release_x1();
}

void sub_10000A868(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = +[RestrictedPerfMode powerModeInstance];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v5 forKeyedSubscript:@"RestrictedPerfMode"];

  uint64_t v6 = +[InUseChargingMode powerModeInstance];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v6 forKeyedSubscript:@"InUseChargingMode"];

  int v7 = +[AcceleratedChargingMode powerModeInstance];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v7 forKeyedSubscript:@"AcceleratedChargingMode"];

  uint64_t v8 = +[LongChargingMode powerModeInstance];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v8 forKeyedSubscript:@"LongChargingMode"];

  uint64_t v9 = qword_10001BF08;
  if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8);
    int v11 = 138412290;
    uint64_t v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Initialized power modes %@", (uint8_t *)&v11, 0xCu);
  }
}

void sub_10000A9FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.powerexperienced", "powermodesmanager");
  id v2 = (void *)qword_10001BF08;
  qword_10001BF08 = (uint64_t)v1;

  qword_10001BF10 = objc_alloc_init(PowerModesManager);

  _objc_release_x1();
}

id sub_10000AC0C(uint64_t a1)
{
  int v2 = MKBDeviceUnlockedSinceBoot();
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2)
  {
    return [v3 restoreState];
  }
  else
  {
    return [v3 clearState];
  }
}

id sub_10000AF58(uint64_t a1)
{
  int v2 = qword_10001BF08;
  if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Evaluating power modes for device context change %@", (uint8_t *)&v5, 0xCu);
  }
  return [*(id *)(a1 + 40) evaluatePowerModes];
}

void sub_10000B004(uint64_t a1)
{
  [*(id *)(a1 + 32) setPendingDelayedEntryTimer:0];
  int v2 = [*(id *)(a1 + 40) overridePresent];

  if (!v2)
  {
    uint64_t v3 = (void *)qword_10001BF08;
    if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v3;
      int v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      uint64_t v7 = *(void *)(a1 + 56);
      int v15 = 138412546;
      __int16 v16 = v6;
      __int16 v17 = 2048;
      uint64_t v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Evaluating %@ after entry delay %f seconds", (uint8_t *)&v15, 0x16u);
    }
    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v9 = [*(id *)(a1 + 40) resourceManager];
    uint64_t v10 = [v9 resourceHints];
    int v11 = [*(id *)(a1 + 40) deviceContext];
    uint64_t v12 = [v11 currentContext];
    LODWORD(v8) = [v8 evaluatePowerModeWithResourceHints:v10 andContext:v12];

    uint64_t v13 = *(void **)(a1 + 40);
    uint64_t v14 = *(void *)(a1 + 48);
    if (v8) {
      [v13 enterMode:v14];
    }
    else {
      [v13 exitMode:v14];
    }
  }
}

id sub_10000B608(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) getState];
  if (result)
  {
    uint64_t v3 = (void *)qword_10001BF08;
    if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = v3;
      int v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      uint64_t v7 = *(void *)(a1 + 48);
      int v8 = 138412546;
      uint64_t v9 = v6;
      __int16 v10 = 2048;
      uint64_t v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Exiting mode %@ after max engagement duration %f", (uint8_t *)&v8, 0x16u);
    }
    [*(id *)(a1 + 32) updateExitReason:4];
    return [*(id *)(a1 + 40) exitMode:*(void *)(a1 + 32)];
  }
  return result;
}

void sub_10000BDF0(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  uint64_t v3 = [*(id *)(a1 + 32) getModeFromName:*(void *)(a1 + 40)];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 disablePowerMode];
    [*(id *)(a1 + 32) exitMode:v4];
    int v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    uint64_t v6 = qword_10001BF08;
    if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_ERROR)) {
      sub_10000D270(v2, v6, v7, v8, v9, v10, v11, v12);
    }
    int v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v5();
}

void sub_10000BF70(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  uint64_t v3 = [*(id *)(a1 + 32) getModeFromName:*(void *)(a1 + 40)];
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 enablePowerMode];
    int v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    uint64_t v6 = qword_10001BF08;
    if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_ERROR)) {
      sub_10000D270(v2, v6, v7, v8, v9, v10, v11, v12);
    }
    int v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v5();
}

void sub_10000C0F4(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) getModeFromName:*(void *)(a1 + 40)];
  if (v3)
  {
    int v4 = *(unsigned __int8 *)(a1 + 56);
    int v5 = qword_10001BF08;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        uint64_t v7 = *v2;
        int v19 = 138412290;
        uint64_t v20 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "OVERRIDE: Entering %@", (uint8_t *)&v19, 0xCu);
      }
      [*(id *)(a1 + 32) enterMode:v3];
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void *)(a1 + 40);
    }
    else
    {
      if (v6)
      {
        uint64_t v18 = *v2;
        int v19 = 138412290;
        uint64_t v20 = v18;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "OVERRIDE: Exiting %@", (uint8_t *)&v19, 0xCu);
      }
      [*(id *)(a1 + 32) exitMode:v3];
      uint64_t v8 = *(void **)(a1 + 32);
      uint64_t v9 = 0;
    }
    [v8 setOverridePresent:v9];
    __int16 v17 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    uint64_t v10 = qword_10001BF08;
    if (os_log_type_enabled((os_log_t)qword_10001BF08, OS_LOG_TYPE_ERROR)) {
      sub_10000D270((uint64_t)v2, v10, v11, v12, v13, v14, v15, v16);
    }
    __int16 v17 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v17();
}

void sub_10000C36C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) getModeFromName:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2) {
    [v2 allowOnCharger:*(unsigned __int8 *)(a1 + 56)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) evaluatePowerModes];
}

void sub_10000C4DC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) getModeFromName:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2) {
    [v2 updateEntryDelay:*(double *)(a1 + 56)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000C644(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) getModeFromName:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2) {
    [v2 updateMaxEngagementDuration:*(double *)(a1 + 56)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10000C83C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000CB04(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to initialize predictor", v1, 2u);
}

void sub_10000CB48(void *a1, uint64_t a2, NSObject *a3)
{
  int v5 = +[NSNumber numberWithUnsignedInteger:*a1];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Failed to fetch prediction for scheme %@: %@", (uint8_t *)&v6, 0x16u);
}

void sub_10000CC08(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error creating CLPC User Client %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000CC80(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No powerlog identifier found", v1, 2u);
}

void sub_10000CCC4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "removing resourcehint %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000CD3C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "savedResourcesMutable %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000CDB4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to init mach service", v1, 2u);
}

void sub_10000CDF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CE30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CE68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CEA0(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to update client %@", (uint8_t *)&v3, 0xCu);
}

void sub_10000CF1C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CF88(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000CFF4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Key not found", v1, 2u);
}

void sub_10000D038()
{
  sub_10000A358();
  sub_100008934((void *)&_mh_execute_header, v0, v1, "Failed to register for Audio notifications", v2, v3, v4, v5, v6);
}

void sub_10000D06C()
{
  sub_10000A358();
  sub_100008934((void *)&_mh_execute_header, v0, v1, "Failed to get current audio status", v2, v3, v4, v5, v6);
}

void sub_10000D0A0()
{
  sub_10000A358();
  sub_100008934((void *)&_mh_execute_header, v0, v1, "Failed to register for NFC notifications", v2, v3, v4, v5, v6);
}

void sub_10000D0D4()
{
  sub_10000A358();
  sub_100008934((void *)&_mh_execute_header, v0, v1, "Failed to get current nfc status", v2, v3, v4, v5, v6);
}

void sub_10000D108(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "CLPC client not initialized", v1, 2u);
}

void sub_10000D14C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to update CLPC with power target for mode %@. Error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10000D1D4(void *a1, void *a2)
{
  int v3 = a1;
  v4[0] = 67109120;
  v4[1] = [a2 processIdentifier];
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "PowerModesManager: rejected new connection from pid %d. Not entitled", (uint8_t *)v4, 8u);
}

void sub_10000D270(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return _IOConnectCallScalarMethod(connection, selector, input, inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

uint64_t IOPSDrawingUnlimitedPower()
{
  return _IOPSDrawingUnlimitedPower();
}

uint64_t IOPSGetPercentRemaining()
{
  return _IOPSGetPercentRemaining();
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return _PPSCreateTelemetryIdentifier();
}

uint64_t PPSSendTelemetry()
{
  return _PPSSendTelemetry();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allowOnCharger(void *a1, const char *a2, ...)
{
  return [a1 allowOnCharger];
}

id objc_msgSend_appliesChargingPolicy(void *a1, const char *a2, ...)
{
  return [a1 appliesChargingPolicy];
}

id objc_msgSend_appliesPowerTarget(void *a1, const char *a2, ...)
{
  return [a1 appliesPowerTarget];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_audioResourceHint(void *a1, const char *a2, ...)
{
  return [a1 audioResourceHint];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cameraResourceHint(void *a1, const char *a2, ...)
{
  return [a1 cameraResourceHint];
}

id objc_msgSend_cameraViewfinder(void *a1, const char *a2, ...)
{
  return [a1 cameraViewfinder];
}

id objc_msgSend_chargingPredictor(void *a1, const char *a2, ...)
{
  return [a1 chargingPredictor];
}

id objc_msgSend_clientResponsible(void *a1, const char *a2, ...)
{
  return [a1 clientResponsible];
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return [a1 clients];
}

id objc_msgSend_clpcClient(void *a1, const char *a2, ...)
{
  return [a1 clpcClient];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentContext(void *a1, const char *a2, ...)
{
  return [a1 currentContext];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaults(void *a1, const char *a2, ...)
{
  return [a1 defaults];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceContext(void *a1, const char *a2, ...)
{
  return [a1 deviceContext];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disablePowerMode(void *a1, const char *a2, ...)
{
  return [a1 disablePowerMode];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_enablePowerMode(void *a1, const char *a2, ...)
{
  return [a1 enablePowerMode];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_endingSOC(void *a1, const char *a2, ...)
{
  return [a1 endingSOC];
}

id objc_msgSend_enterPowerMode(void *a1, const char *a2, ...)
{
  return [a1 enterPowerMode];
}

id objc_msgSend_evaluatePowerModes(void *a1, const char *a2, ...)
{
  return [a1 evaluatePowerModes];
}

id objc_msgSend_exitPowerMode(void *a1, const char *a2, ...)
{
  return [a1 exitPowerMode];
}

id objc_msgSend_exitReason(void *a1, const char *a2, ...)
{
  return [a1 exitReason];
}

id objc_msgSend_getEntryDelay(void *a1, const char *a2, ...)
{
  return [a1 getEntryDelay];
}

id objc_msgSend_getMaxEngagementDuration(void *a1, const char *a2, ...)
{
  return [a1 getMaxEngagementDuration];
}

id objc_msgSend_getState(void *a1, const char *a2, ...)
{
  return [a1 getState];
}

id objc_msgSend_handleLockStateChange(void *a1, const char *a2, ...)
{
  return [a1 handleLockStateChange];
}

id objc_msgSend_identifer(void *a1, const char *a2, ...)
{
  return [a1 identifer];
}

id objc_msgSend_inTypicalUsageEnvironment(void *a1, const char *a2, ...)
{
  return [a1 inTypicalUsageEnvironment];
}

id objc_msgSend_initAudioHandling(void *a1, const char *a2, ...)
{
  return [a1 initAudioHandling];
}

id objc_msgSend_initNFCHandling(void *a1, const char *a2, ...)
{
  return [a1 initNFCHandling];
}

id objc_msgSend_initPowerSourceChange(void *a1, const char *a2, ...)
{
  return [a1 initPowerSourceChange];
}

id objc_msgSend_initializeAllModes(void *a1, const char *a2, ...)
{
  return [a1 initializeAllModes];
}

id objc_msgSend_initializeMonitors(void *a1, const char *a2, ...)
{
  return [a1 initializeMonitors];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interestedModes(void *a1, const char *a2, ...)
{
  return [a1 interestedModes];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isSupportedPlatform(void *a1, const char *a2, ...)
{
  return [a1 isSupportedPlatform];
}

id objc_msgSend_lastEntryTime(void *a1, const char *a2, ...)
{
  return [a1 lastEntryTime];
}

id objc_msgSend_lastExitTime(void *a1, const char *a2, ...)
{
  return [a1 lastExitTime];
}

id objc_msgSend_lastPluggedInState(void *a1, const char *a2, ...)
{
  return [a1 lastPluggedInState];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_logStatusToPowerLog(void *a1, const char *a2, ...)
{
  return [a1 logStatusToPowerLog];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return [a1 logger];
}

id objc_msgSend_longChargeExpected(void *a1, const char *a2, ...)
{
  return [a1 longChargeExpected];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_meetsSystemConfidenceThreshold(void *a1, const char *a2, ...)
{
  return [a1 meetsSystemConfidenceThreshold];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nfcActive(void *a1, const char *a2, ...)
{
  return [a1 nfcActive];
}

id objc_msgSend_nfcResourceHint(void *a1, const char *a2, ...)
{
  return [a1 nfcResourceHint];
}

id objc_msgSend_overridePresent(void *a1, const char *a2, ...)
{
  return [a1 overridePresent];
}

id objc_msgSend_pendingDelayedEntryTimer(void *a1, const char *a2, ...)
{
  return [a1 pendingDelayedEntryTimer];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_powerModeInstance(void *a1, const char *a2, ...)
{
  return [a1 powerModeInstance];
}

id objc_msgSend_powerModes(void *a1, const char *a2, ...)
{
  return [a1 powerModes];
}

id objc_msgSend_powerModesService(void *a1, const char *a2, ...)
{
  return [a1 powerModesService];
}

id objc_msgSend_powerlogIdentifier(void *a1, const char *a2, ...)
{
  return [a1 powerlogIdentifier];
}

id objc_msgSend_predictionQueryQueue(void *a1, const char *a2, ...)
{
  return [a1 predictionQueryQueue];
}

id objc_msgSend_predictor(void *a1, const char *a2, ...)
{
  return [a1 predictor];
}

id objc_msgSend_predictorOutput(void *a1, const char *a2, ...)
{
  return [a1 predictorOutput];
}

id objc_msgSend_predictorReady(void *a1, const char *a2, ...)
{
  return [a1 predictorReady];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processMonitors(void *a1, const char *a2, ...)
{
  return [a1 processMonitors];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resourceHints(void *a1, const char *a2, ...)
{
  return [a1 resourceHints];
}

id objc_msgSend_resourceManager(void *a1, const char *a2, ...)
{
  return [a1 resourceManager];
}

id objc_msgSend_resourceType(void *a1, const char *a2, ...)
{
  return [a1 resourceType];
}

id objc_msgSend_restoreState(void *a1, const char *a2, ...)
{
  return [a1 restoreState];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_saveState(void *a1, const char *a2, ...)
{
  return [a1 saveState];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shortChargeExpected(void *a1, const char *a2, ...)
{
  return [a1 shortChargeExpected];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startingSOC(void *a1, const char *a2, ...)
{
  return [a1 startingSOC];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_supportedPlatform(void *a1, const char *a2, ...)
{
  return [a1 supportedPlatform];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_updateChargingPolicy(void *a1, const char *a2, ...)
{
  return [a1 updateChargingPolicy];
}

id objc_msgSend_updatePowerTarget(void *a1, const char *a2, ...)
{
  return [a1 updatePowerTarget];
}

id objc_msgSend_updateSMCDebugKey(void *a1, const char *a2, ...)
{
  return [a1 updateSMCDebugKey];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 willChangeValueForKey:];
}