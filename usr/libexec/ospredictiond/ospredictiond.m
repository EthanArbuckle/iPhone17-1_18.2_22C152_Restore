uint64_t sub_100003E38()
{
  uint64_t vars8;

  qword_10007A7E8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100004A64(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v6 count];
  if (v7)
  {
    uint64_t v8 = (uint64_t)v7;
    double v9 = (double)(uint64_t)v7;
    v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    [v10 doubleValue];
    double v12 = v9 / v11;

    if (v12 >= 0.02)
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v13 = v6;
      id v14 = [v13 countByEnumeratingWithState:&v34 objects:v44 count:16];
      double v15 = 0.0;
      double v16 = 0.0;
      double v17 = 0.0;
      if (v14)
      {
        id v18 = v14;
        uint64_t v19 = *(void *)v35;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v35 != v19) {
              objc_enumerationMutation(v13);
            }
            v21 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            v22 = [v21 endDate];
            v23 = [v21 startDate];
            [v22 timeIntervalSinceDate:v23];
            double v25 = v24;

            double v16 = v16 + v25;
            double v17 = v17 + v25 * v25;
          }
          id v18 = [v13 countByEnumeratingWithState:&v34 objects:v44 count:16];
        }
        while (v18);
      }

      if (v8 >= 2) {
        double v15 = sqrt((v17 - v16 * v16 / v9) / (double)(v8 - 1));
      }
      v42[0] = @"pctLong";
      v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12, (void)v34);
      v43[0] = v26;
      v42[1] = @"average";
      v27 = +[NSNumber numberWithDouble:v16 / v9];
      v43[1] = v27;
      v42[2] = @"stdDev";
      v28 = +[NSNumber numberWithDouble:v15];
      v43[2] = v28;
      v29 = +[NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:3];
      [*(id *)(a1 + 40) setObject:v29 forKeyedSubscript:v5];

      v30 = *(NSObject **)(*(void *)(a1 + 48) + 8);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = *(void **)(a1 + 40);
        v32 = v30;
        v33 = [v31 objectForKeyedSubscript:v5];
        *(_DWORD *)buf = 138412546;
        id v39 = v5;
        __int16 v40 = 2112;
        v41 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "Backup hour (%@) is %@", buf, 0x16u);
      }
    }
  }
}

void sub_100004F60(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  int v6 = *(_DWORD *)(a1 + 40);
  if (v6 == 1)
  {
    id v7 = objc_alloc_init((Class)_OSInactivityPredictorBackupHourEntry_v1);
    uint64_t v8 = [v5 objectForKeyedSubscript:@"count"];
    [v7 setCount:[v8 intValue]];
    goto LABEL_5;
  }
  if (v6 == 2)
  {
    id v7 = objc_alloc_init((Class)_OSInactivityPredictorBackupHourEntry_v2);
    uint64_t v8 = [v5 objectForKeyedSubscript:@"pctLong"];
    [v8 doubleValue];
    [v7 setPctLong:];
LABEL_5:

    double v9 = [v5 objectForKeyedSubscript:@"average"];
    [v9 doubleValue];
    [v7 setAverageDuration:v10 / 3600.0];

    double v11 = [v5 objectForKeyedSubscript:@"stdDev"];
    [v11 doubleValue];
    [v7 setStdDev:];

    goto LABEL_7;
  }
  id v7 = 0;
LABEL_7:
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v12];
}

void sub_100005200(id a1)
{
  qword_10007A800 = objc_alloc_init(OSInactivityPredictionService);

  _objc_release_x1();
}

void sub_1000056D4(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    id v4 = a2;
    id v5 = +[_OSDataProtectionStateMonitor dataProtectionClassC];
    unsigned int v6 = [v4 isEqualToString:v5];

    if (v6)
    {
      id v7 = qword_10007A7F8;
      if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Re-attempting to load lock history from underlying data source...", buf, 2u);
      }
      uint64_t v8 = +[_OSLockHistory sharedInstance];
      [v8 loadHistoryFromUnderlyingDataSource];

      double v9 = qword_10007A7F8;
      if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)double v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Re-attempting to initialize predictor...", v11, 2u);
      }
      double v10 = +[_OSInactivityPredictor predictor];
      [*(id *)(a1 + 32) setPredictor:v10];
    }
  }
}

void sub_100005804(uint64_t a1)
{
  v2 = qword_10007A7F8;
  if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Re-initializing predictor", v4, 2u);
  }
  v3 = +[_OSInactivityPredictor predictor];
  [*(id *)(a1 + 32) setPredictor:v3];
}

uint64_t sub_100005994(uint64_t a1, void *a2)
{
  activity = a2;
  xpc_activity_state_t state = xpc_activity_get_state(activity);
  if (state == 2)
  {
    id v4 = objc_alloc_init(_OSInactivityPredictionBackupManager);
    [(_OSInactivityPredictionBackupManager *)v4 backupData];
  }
  else
  {
    if (state) {
      goto LABEL_7;
    }
    id v4 = (_OSInactivityPredictionBackupManager *)xpc_activity_copy_criteria(activity);
    if (!xpc_equal(v4, *(xpc_object_t *)(a1 + 32))) {
      xpc_activity_set_criteria(activity, *(xpc_object_t *)(a1 + 32));
    }
  }

LABEL_7:

  return _objc_release_x1();
}

void sub_100006198(uint64_t a1, void *a2)
{
  v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    [*(id *)(a1 + 40) writeEvaluatedPredictorTypeToDefaults:[*(id *)(a1 + 40) evaluatePredictorTypeWithLookahead:v3 withIncrement:*(double *)(a1 + 48) withActivity:*(double *)(a1 + 56)]];
    if (+[_OSInactivityPredictor isDeviceRarelyUsedRecently])
    {
      unsigned int v6 = (void *)qword_10007A7F8;
      if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_ERROR)) {
        sub_100040BD4(v6);
      }
    }
  }
  else if (!state)
  {
    xpc_object_t v5 = xpc_activity_copy_criteria(v3);
    if (!xpc_equal(v5, *(xpc_object_t *)(a1 + 32))) {
      xpc_activity_set_criteria(v3, *(xpc_object_t *)(a1 + 32));
    }
  }
}

void sub_100007720(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (([WeakRetained upgradePredictorIfNeeded] & 1) == 0)
    {
      [v2 scheduleModelUpgradeAfterInterval:604800.0];
      v3 = qword_10007A7F8;
      if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Model upgrade failed. Will try again in 7 days.", v4, 2u);
      }
    }
  }
}

void sub_100007C70(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100007C90(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100007CAC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000080A8(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  v3 = *(void **)(a1 + 32);
  id v4 = +[NSDate dateWithTimeIntervalSinceNow:21600.0];
  id v5 = [v3 postEngagedUntilDate:v4 inactivityOptions:state64];
}

void sub_100008CE0(uint64_t a1, void *a2)
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a2;
  id v3 = [obj countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (*(void *)(a1 + 40) != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v8 = [*(id *)(*((void *)&v21 + 1) + 8 * i) request];
          uint64_t v9 = [v8 identifier];
          uint64_t v10 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
          double v11 = +[NSString stringWithFormat:@"%@-", v10];
          unsigned int v12 = [v9 hasPrefix:v11];

          if (!v12) {
            continue;
          }
          id v13 = [*(id *)(a1 + 32) unCenter];
          id v14 = [v7 request];
          double v15 = [v14 identifier];
          v27 = v15;
          double v16 = +[NSArray arrayWithObjects:&v27 count:1];
          [v13 removeDeliveredNotificationsWithIdentifiers:v16];
        }
        double v17 = [*(id *)(a1 + 32) log];
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          id v18 = [v7 request];
          uint64_t v19 = [v18 identifier];
          *(_DWORD *)buf = 138412290;
          v26 = v19;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Removing notification %@", buf, 0xCu);
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v4);
  }
}

void sub_100008F54(uint64_t a1, void *a2)
{
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = a2;
  id v3 = [obj countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v8 = [*(id *)(a1 + 32) log];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v9 = [v7 identifier];
          *(_DWORD *)buf = 138412290;
          long long v24 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Removing pending notification %@", buf, 0xCu);
        }
        uint64_t v10 = [v7 identifier];
        double v11 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
        unsigned int v12 = +[NSString stringWithFormat:@"%@-", v11];
        unsigned int v13 = [v10 hasPrefix:v12];

        if (v13)
        {
          id v14 = [*(id *)(a1 + 32) unCenter];
          double v15 = [v7 identifier];
          long long v22 = v15;
          double v16 = +[NSArray arrayWithObjects:&v22 count:1];
          [v14 removeDeliveredNotificationsWithIdentifiers:v16];
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v18 objects:v25 count:16];
    }
    while (v4);
  }
}

void sub_100009284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000929C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000092AC(uint64_t a1)
{
}

void sub_1000092B4(uint64_t a1, void *a2)
{
  id v2 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v8 = [v7 request];
        uint64_t v9 = [v8 content];
        uint64_t v10 = [v9 categoryIdentifier];
        unsigned int v11 = [v10 isEqual:@"fullChargeCategory"];

        if (v11) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v7);
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

void sub_100009630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000964C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained loadTrialFactors];
    id WeakRetained = v2;
  }
}

BOOL sub_10000B5BC(uint64_t a1, uint64_t a2)
{
  return +[OSIntelligenceUtilities pastEventInQuestion:a2 containsTimeOfReferenceDate:*(void *)(a1 + 32)];
}

id sub_10000B5D4(uint64_t a1, uint64_t a2)
{
  return (id)+[OSIntelligenceUtilities pastEventInQuestion:a2 startsAfterTimeOfReferenceDate:*(void *)(a1 + 32)];
}

void sub_10000BD94(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void start()
{
  os_log_t v0 = os_log_create("com.apple.osintelligence", "");
  v1 = (void *)qword_10007A830;
  qword_10007A830 = (uint64_t)v0;

  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100064958);
  id v3 = qword_10007A830;
  if (os_log_type_enabled((os_log_t)qword_10007A830, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initializing OSInactivityPredictionService\n", buf, 2u);
  }
  uint64_t v4 = +[OSInactivityPredictionService sharedInstance];
  uint64_t v5 = (void *)qword_10007A818;
  qword_10007A818 = v4;

  unsigned int v6 = qword_10007A830;
  if (os_log_type_enabled((os_log_t)qword_10007A830, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Init Charge prediction", v13, 2u);
  }
  uint64_t v7 = +[OSChargingPredictorService sharedInstance];
  uint64_t v8 = (void *)qword_10007A820;
  qword_10007A820 = v7;

  uint64_t v9 = qword_10007A830;
  if (os_log_type_enabled((os_log_t)qword_10007A830, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unsigned int v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Init Battery prediction", v12, 2u);
  }
  uint64_t v10 = +[OSBatteryPredictorService sharedInstance];
  unsigned int v11 = (void *)qword_10007A828;
  qword_10007A828 = v10;

  dispatch_main();
}

void sub_10000BF30(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  id v3 = qword_10007A830;
  if (os_log_type_enabled((os_log_t)qword_10007A830, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = string;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received notification: %s", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t sub_10000C2E8()
{
  qword_10007A838 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_10000C860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

int64_t sub_10000C89C(id a1, BMStoreEvent *a2, BMStoreEvent *a3)
{
  int v4 = a3;
  [(BMStoreEvent *)a2 timestamp];
  uint64_t v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(BMStoreEvent *)v4 timestamp];
  double v7 = v6;

  uint64_t v8 = +[NSNumber numberWithDouble:v7];
  id v9 = [v5 compare:v8];

  return (int64_t)v9;
}

BOOL sub_10000C938(id a1, BMStoreEvent *a2)
{
  id v2 = [(BMStoreEvent *)a2 eventBody];
  BOOL v3 = v2 != 0;

  return v3;
}

BPSTuple *__cdecl sub_10000C970(id a1, BPSTuple *a2, BMStoreEvent *a3)
{
  int v4 = a2;
  uint64_t v5 = a3;
  double v6 = [(BMStoreEvent *)v5 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v8 = objc_alloc((Class)BPSTuple);
  id v9 = v8;
  if (isKindOfClass)
  {
    id v10 = [v8 initWithFirst:v5 second:0];
  }
  else
  {
    uint64_t v11 = [(BPSTuple *)v4 first];
    id v10 = [v9 initWithFirst:v11 second:v5];

    uint64_t v5 = (BMStoreEvent *)v11;
  }

  return (BPSTuple *)v10;
}

BOOL sub_10000CA48(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 second];

  if (!v3)
  {
    int v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10004187C(v4);
    }
  }
  return v3 != 0;
}

uint64_t sub_10000CAB4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000CAC4(uint64_t a1)
{
}

BOOL sub_10000CACC(id a1, BPSTuple *a2)
{
  id v2 = [(BPSTuple *)a2 second];
  BOOL v3 = [v2 eventBody];
  unsigned __int8 v4 = [v3 hasInUseStatus];

  return v4;
}

void sub_10000CB20(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    unsigned __int8 v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000418C0(v3, v4);
    }
  }
}

void sub_10000CB84(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v9 = *(void **)(v6 + 40);
  double v7 = (id *)(v6 + 40);
  id v8 = v9;
  if (v9)
  {
    id v10 = [v8 second];
    uint64_t v11 = [v5 second];
    unsigned int v34 = +[OSIntelligenceUtilities isActiveBiomeActivityLevelEvent:v10];
    unsigned int v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) first];
    long long v13 = [v5 first];
    long long v14 = +[NSTimeZone systemTimeZone];
    id v15 = [v14 secondsFromGMT];
    if (v12)
    {
      id v2 = [v12 eventBody];
      [v2 secondsFromGMT];
      if (v16 != (double)(uint64_t)v15)
      {

LABEL_12:
        long long v22 = [*(id *)(a1 + 32) log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Interval might be in different timezone; dropping interval",
            buf,
            2u);
        }

        uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
        id v24 = v5;
        double v25 = *(_OSActivityInterval **)(v23 + 40);
        *(void *)(v23 + 40) = v24;
LABEL_25:

        goto LABEL_26;
      }
      if (!v13)
      {

        goto LABEL_16;
      }
    }
    else if (!v13)
    {
      goto LABEL_16;
    }
    v32 = v14;
    double v17 = v10;
    long long v18 = v11;
    long long v19 = [v13 eventBody:v32];
    [v19 secondsFromGMT];
    double v21 = v20;

    if (v12) {
    uint64_t v11 = v18;
    }
    id v10 = v17;
    long long v14 = v33;
    if (v21 != (double)(uint64_t)v15) {
      goto LABEL_12;
    }
LABEL_16:
    v26 = [_OSActivityInterval alloc];
    [v10 timestamp];
    double v28 = v27;
    [v11 timestamp];
    v30 = [(_OSActivityInterval *)v26 initWithStartTime:v34 andEndTime:v28 andActiveStatus:v29];
    double v25 = v30;
    if (v30 && [(_OSIInterval *)v30 isValidInterval])
    {
      if ([(_OSActivityInterval *)v25 hasReasonableDuration] && v34) {
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v25];
      }
    }
    else
    {
      v31 = [*(id *)(a1 + 32) log];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_100041958(v25, v31);
      }
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    goto LABEL_25;
  }
  objc_storeStrong(v7, a2);
LABEL_26:
}

BOOL sub_10000D14C(uint64_t a1, void *a2)
{
  id v3 = [a2 startDate];
  [v3 timeIntervalSinceDate:*(void *)(a1 + 32)];
  BOOL v5 = v4 > 0.0;

  return v5;
}

id sub_10000DBB8(uint64_t a1, uint64_t a2)
{
  return (id)+[OSIntelligenceUtilities isIntervalTouchingTimewiseSlice:a2 definedByReferenceDate:*(void *)(a1 + 32) leftBoundary:*(double *)(a1 + 40) rightBoundary:*(double *)(a1 + 48)];
}

void sub_10000E030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E04C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateTrialParameters];
    id WeakRetained = v2;
  }
}

id sub_10000EE7C(uint64_t a1)
{
  return [*(id *)(a1 + 32) relevantEventDeadline];
}

void sub_10000F2E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F2FC(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t state64 = 0;
    notify_get_state(a2, &state64);
    double v4 = (double)state64;
    if (!state64) {
      double v4 = 300.0;
    }
    [WeakRetained percentStationaryOverDuration:v4];
    uint64_t v6 = v5;
    double v7 = [WeakRetained log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = state64;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Recent stationary duration: %.2f (%llu seconds)", buf, 0x16u);
    }
  }
}

void sub_10000FA88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_10000FAA4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) percentageStationaryWithActivity:a2 untilDate:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v3;
  double v4 = *(NSObject **)(a1 + 48);

  return dispatch_semaphore_signal(v4);
}

void sub_10000FEF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000FF10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000FF20(uint64_t a1)
{
}

void sub_10000FF28(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    if (!a3)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v6 = v5;
        id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v7)
        {
          id v8 = v7;
          uint64_t v9 = *(void *)v20;
          do
          {
            for (i = 0; i != v8; i = (char *)i + 1)
            {
              if (*(void *)v20 != v9) {
                objc_enumerationMutation(v6);
              }
              __int16 v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
              uint64_t v12 = [*(id *)(*((void *)&v19 + 1) + 8 * i) nextFireDate:v19];
              long long v13 = (void *)v12;
              if (v11)
              {
                uint64_t v14 = [v11 earlierDate:v12];
                uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
                double v16 = *(void **)(v15 + 40);
                *(void *)(v15 + 40) = v14;
              }
              else
              {
                uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
                long long v18 = *(void **)(v17 + 40);
                *(void *)(v17 + 40) = v12;
                long long v13 = v18;
              }
            }
            id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v8);
        }
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_100010248()
{
  qword_10007A850 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100010A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010A30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    uint64_t v3 = [WeakRetained updateHandlers];
    id v4 = [v3 copy];

    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    [WeakRetained loadTrialUpdates];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9) + 16))(*(void *)(*((void *)&v10 + 1) + 8 * (void)v9));
          uint64_t v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

uint64_t sub_100010C18()
{
  qword_10007A868 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100011F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011F98(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateTrialParameters];
    id WeakRetained = v2;
  }
}

id sub_100013B14(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100015C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100015C30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained updateTrialParameters:*(unsigned __int8 *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void sub_100016330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016350(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100016360(uint64_t a1)
{
}

void sub_100016368(uint64_t a1)
{
  [*(id *)(a1 + 32) timeIntervalSinceDate:*(void *)(*(void *)(a1 + 40) + 128)];
  if (v2 < 900.0 && v2 > 0.0)
  {
    id v3 = *(NSObject **)(*(void *)(a1 + 40) + 112);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 56);
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 128);
      int v14 = 134218754;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      uint64_t v17 = v5;
      __int16 v18 = 2048;
      uint64_t v19 = 0x408C200000000000;
      __int16 v20 = 2112;
      uint64_t v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%ld) Input query for time %@ is within %f seconds for last query for %@", (uint8_t *)&v14, 0x2Au);
    }
    [*(id *)(*(void *)(a1 + 40) + 136) timeIntervalSinceNow];
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v9 = *(void *)(v8 + 136);
    if (v9 && v7 > -180.0)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(v8 + 144));
    }
    else if (v9 && v7 > -1200.0)
    {
      long long v10 = +[OSIntelligenceUtilities lastLockDate];
      long long v11 = v10;
      if (*(void *)(*(void *)(a1 + 40) + 136)) {
        BOOL v12 = v10 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (!v12)
      {
        [v10 timeIntervalSinceDate:];
        if (v13 < 0.0) {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 40) + 144));
        }
      }
    }
  }
}

void sub_1000166E4(uint64_t a1)
{
  double v2 = (void *)os_transaction_create();
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 72);
  if (v4 && *(void *)(v3 + 80))
  {
    v64 = v2;
    uint64_t v5 = [v4 modelDescription];
    uint64_t v6 = [v5 inputDescriptionsByName];
    uint64_t v7 = [v6 allKeys];

    v63 = (void *)v7;
    uint64_t v8 = +[_OSInactivityFeatureFactory inputFeaturesWithNames:v7 atDate:*(void *)(a1 + 40) withIntervalHistory:*(void *)(a1 + 48) withContext:0];
    uint64_t v9 = [v8 dictionary];
    long long v10 = *(NSObject **)(*(void *)(a1 + 32) + 112);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 72);
      BOOL v12 = v10;
      double v13 = [v9 description];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v72 = v11;
      *(_WORD *)&v72[4] = 2112;
      *(void *)&v72[6] = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Engage features (%u), %@", buf, 0x12u);
    }
    [*(id *)(a1 + 40) timeIntervalSinceNow];
    if (v14 <= 0.0)
    {
      +[NSMutableDictionary dictionary];
      v67[0] = _NSConcreteStackBlock;
      v67[1] = 3221225472;
      v67[2] = sub_100016D38;
      v67[3] = &unk_100064C88;
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v68 = v15;
      [v9 enumerateKeysAndObjectsUsingBlock:v67];
      __int16 v16 = *(NSObject **)(*(void *)(a1 + 32) + 112);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = *(void *)(a1 + 72);
        *(_DWORD *)buf = 134218242;
        *(void *)v72 = v17;
        *(_WORD *)&v72[8] = 2112;
        *(void *)&v72[10] = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "(%ld) Logging to Power Log: %@", buf, 0x16u);
      }
      id v18 = [v15 copy];
      PLLogRegisteredEvent();
    }
    uint64_t v19 = *(void **)(*(void *)(a1 + 32) + 72);
    uint64_t v20 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v20 + 40);
    v62 = v8;
    uint64_t v21 = [v19 predictionFromFeatures:v8 error:&obj];
    objc_storeStrong((id *)(v20 + 40), obj);
    long long v22 = [v21 featureValueForName:@"classProbability"];
    uint64_t v23 = [v22 dictionaryValue];

    id v24 = [v23 objectForKeyedSubscript:&off_100068D50];
    [v24 doubleValue];
    double v26 = v25;

    double v27 = [*(id *)(*(void *)(a1 + 32) + 80) modelDescription];
    double v28 = [v27 inputDescriptionsByName];
    double v29 = [v28 allKeys];

    v61 = v9;
    if ([v29 containsObject:@"engage_prob"])
    {
      CFStringRef v69 = @"engage_prob";
      v30 = +[NSNumber numberWithDouble:v26];
      v70 = v30;
      v31 = +[NSDictionary dictionaryWithObjects:&v70 forKeys:&v69 count:1];
    }
    else
    {
      v31 = 0;
    }
    v38 = +[_OSInactivityFeatureFactory inputFeaturesWithNames:v29 atDate:*(void *)(a1 + 40) withIntervalHistory:*(void *)(a1 + 48) withContext:v31];
    id v39 = *(NSObject **)(*(void *)(a1 + 32) + 112);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      v60 = v29;
      __int16 v40 = v23;
      v41 = v21;
      uint64_t v42 = *(void *)(a1 + 72);
      v43 = v39;
      v44 = [v38 dictionary];
      v45 = [v44 description];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v72 = v42;
      uint64_t v21 = v41;
      uint64_t v23 = v40;
      *(_WORD *)&v72[4] = 2112;
      *(void *)&v72[6] = v45;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Duration features (%u): %@", buf, 0x12u);
    }
    v46 = *(void **)(*(void *)(a1 + 32) + 80);
    uint64_t v47 = *(void *)(*(void *)(a1 + 56) + 8);
    id v65 = *(id *)(v47 + 40);
    v48 = [v46 predictionFromFeatures:v38 error:&v65];
    objc_storeStrong((id *)(v47 + 40), v65);
    v49 = [v48 featureValueForName:@"predicted_duration"];
    [v49 doubleValue];
    double v51 = v50;

    id v52 = objc_alloc((Class)_OSInactivityPredictorOutput);
    [*(id *)(a1 + 32) confidenceThresholdRelaxed];
    double v54 = v53;
    [*(id *)(a1 + 32) confidenceThresholdStrict];
    id v56 = [v52 initWithConfidenceValue:1 andRelaxedThreshold:v26 andStrictThreshold:v54 andPredictedDuration:v55 andReason:v51];
    uint64_t v57 = *(void *)(*(void *)(a1 + 64) + 8);
    v58 = *(void **)(v57 + 40);
    *(void *)(v57 + 40) = v56;

    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) adjustedPredictedDurationWithStrictLeeway:*(double *)(*(void *)(a1 + 32) + 88) andRelaxedLeeway:*(double *)(*(void *)(a1 + 32) + 96) andMaxPredictionCap:10.0];
    [*(id *)(a1 + 32) setLastInputDate:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setPredictionOutput:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
    v59 = +[NSDate date];
    [*(id *)(a1 + 32) setLastPredictedDate:v59];

    double v2 = v64;
  }
  else
  {
    uint64_t v32 = +[NSError errorWithDomain:@"com.apple.OSIntelligence.InactivityPredictorTwoStage" code:404 userInfo:&off_100069888];
    uint64_t v33 = *(void *)(*(void *)(a1 + 56) + 8);
    unsigned int v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;

    id v35 = [objc_alloc((Class)_OSInactivityPredictorOutput) initInvalidOutput];
    uint64_t v36 = *(void *)(*(void *)(a1 + 64) + 8);
    long long v37 = *(void **)(v36 + 40);
    *(void *)(v36 + 40) = v35;
  }
}

void sub_100016D38(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (([v9 isEqualToString:@"recent_q95_1"] & 1) != 0
    || ([v9 isEqualToString:@"recent_q95_2"] & 1) != 0
    || ([v9 isEqualToString:@"recent_q75_1"] & 1) != 0
    || ([v9 isEqualToString:@"recent_q75_2"] & 1) != 0
    || ([v9 isEqualToString:@"recent_dur_med_1"] & 1) != 0
    || ([v9 isEqualToString:@"woo_q95_1"] & 1) != 0
    || ([v9 isEqualToString:@"woo_q95_2"] & 1) != 0
    || [v9 isEqualToString:@"woo_q50_1"])
  {
    [v5 doubleValue];
    LODWORD(v7) = llround(v6 * 10.0);
    uint64_t v8 = +[NSNumber numberWithInt:v7];
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v9];
  }
}

void sub_1000173FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

uint64_t sub_100017434(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100017444(uint64_t a1)
{
}

void sub_100017450(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v5 = [v3 eventBody];
  double v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) eventBody];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v5 playbackState] == (id)1;
  int v7 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v8 = *(NSObject **)(a1 + 32);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v7)
  {
    if (v9) {
      sub_10004219C(v8, v3, v5);
    }
  }
  else if (v9)
  {
    sub_1000420D8(v8, v3, v5);
  }
  [v3 timestamp];
  if (v10 >= *(double *)(a1 + 64))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
      && !*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
      && [v6 playbackState] == (id)1)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timestamp];
      double v15 = v14;
      double v16 = *(double *)(a1 + 64);
      [v3 timestamp];
      double v18 = v17;
      if (v15 >= v16) {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timestamp];
      }
      else {
        double v19 = *(double *)(a1 + 64);
      }
      *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v18
                                                                  - v19
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                              + 24);
    }
    uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
    goto LABEL_17;
  }
  int v11 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  if (v11)
  {
LABEL_17:
    id v20 = v3;
    double v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v20;
    goto LABEL_18;
  }
  double v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;
LABEL_18:
}

void sub_1000178F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100017920(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 eventBody];
  unsigned int v4 = [*(id *)(a1 + 32) isEventNextSongPlaying:v3 fromPreviousEvent:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void *)(v5 + 24);
  if (v4) {
    uint64_t v7 = v6 - 1;
  }
  else {
    uint64_t v7 = v6 + 1;
  }
  *(void *)(v5 + 24) = v7;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
}

void sub_100017A5C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t sub_10001914C()
{
  qword_10007A870 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_10001A014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001A034(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateTrialParameters];
    id WeakRetained = v2;
  }
}

void sub_10001B0AC(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) location];
  [*(id *)(a1 + 32) setCurrentLocation:v2];

  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  [*(id *)(a1 + 32) setRequestLocationSemaphore:v3];
}

id sub_10001B124(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentLocation:0];
  id v2 = *(void **)(a1 + 32);

  return [v2 setRequestLocationSemaphore:0];
}

void sub_10001B544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001B57C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001B58C(uint64_t a1)
{
}

void sub_10001B594(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  uint64_t v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (v7 || ![v6 count])
  {
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 72);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = @"No nearby LOI";
      if (v7) {
        CFStringRef v9 = v7;
      }
      int v13 = 138412290;
      CFStringRef v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No LOIs nearby: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 72);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = v10;
      +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 count]);
      uint64_t v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v13 = 138412290;
      CFStringRef v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ nearby LOIs", (uint8_t *)&v13, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10001B738(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 count];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 72);
  if (v4)
  {
    if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v6;
      int v9 = 134217984;
      id v10 = [v3 count];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "No LoIs, but did see visits in the past. (%lu)", (uint8_t *)&v9, 0xCu);
    }
    char v8 = 1;
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(v5 + 72), OS_LOG_TYPE_FAULT)) {
      sub_1000428B4();
    }
    char v8 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v8;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10001BD8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10001BDB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000428F4(v3);
    }
  }
}

void sub_10001BE14(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  double v4 = *(double *)(a1 + 56);
  [v3 timestamp];
  double v6 = v4 - v5;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    double v10 = *(double *)(a1 + 56);
    int v11 = v7;
    uint64_t v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v10];
    [v3 timestamp];
    int v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    int v14 = 138412802;
    id v15 = v12;
    __int16 v16 = 2112;
    double v17 = v13;
    __int16 v18 = 2048;
    double v19 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "working on event - plugin: %@ - event timestamp: %@ - diff: %f", (uint8_t *)&v14, 0x20u);
  }
  if (v6 > -60.0 && v6 < 60.0)
  {
    int v9 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Microlocation event near pluggedIn time %@", (uint8_t *)&v14, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void sub_10001C518(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

void sub_10001C58C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    double v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100042A10(v3);
    }
  }
}

uint64_t sub_10001C5F0(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 eventBody];

  return _objc_release_x1();
}

int64_t sub_10001C63C(id a1, BMStoreEvent *a2, BMStoreEvent *a3)
{
  double v4 = a3;
  [(BMStoreEvent *)a2 timestamp];
  double v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(BMStoreEvent *)v4 timestamp];
  double v7 = v6;

  char v8 = +[NSNumber numberWithDouble:v7];
  id v9 = [v5 compare:v8];

  return (int64_t)v9;
}

uint64_t sub_10001C6D8(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v5 = [v4 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  double v7 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (isKindOfClass)
  {
    objc_storeStrong(v7, a2);
LABEL_11:
    uint64_t v15 = 0;
    goto LABEL_12;
  }
  if (!*v7) {
    goto LABEL_11;
  }
  char v8 = [v4 eventBody];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_11;
  }
  id v9 = [v4 eventBody];
  unsigned int v10 = [v9 hasStarting];

  if (!v10) {
    goto LABEL_11;
  }
  int v11 = [v4 eventBody];
  unsigned int v12 = [v11 starting];

  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  int v14 = *(_DWORD *)(v13 + 24);
  if (v14 != -1 && v14 == v12) {
    goto LABEL_11;
  }
  *(_DWORD *)(v13 + 24) = v12;
  if ((v12 & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v15 = 1;
LABEL_12:

  return v15;
}

void sub_10001C80C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 state];
  double v5 = *(void **)(a1 + 32);
  if (v4)
  {
    double v6 = [v5 log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100042AB4(v3);
    }
  }
  else
  {
    double v7 = v5[9];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)char v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "sink completed", v8, 2u);
    }
  }
}

void sub_10001C8BC(void *a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  id v4 = [*(id *)(*(void *)(a1[6] + 8) + 40) eventBody];
  double v5 = [v4 timeZone];

  double v6 = *(NSObject **)(a1[4] + 72);
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      double v7 = *(void **)(*(void *)(a1[6] + 8) + 40);
      char v8 = v6;
      [v7 timestamp];
      id v9 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      [v3 timestamp];
      unsigned int v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      int v15 = 138412546;
      __int16 v16 = v9;
      __int16 v17 = 2112;
      __int16 v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "working on event with timezone timestamp: %@ - plugin timestamp: %@", (uint8_t *)&v15, 0x16u);
    }
    int v11 = [*(id *)(*(void *)(a1[7] + 8) + 40) timeZone];
    unsigned int v12 = [*(id *)(*(void *)(a1[6] + 8) + 40) eventBody];
    uint64_t v13 = [v12 timeZone];

    if (v11 == v13) {
      uint64_t v14 = a1[8];
    }
    else {
      uint64_t v14 = a1[9];
    }
    ++*(_DWORD *)(*(void *)(v14 + 8) + 24);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    sub_100042B58();
  }
}

void sub_10001CC90(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) lastObject];
  [*(id *)(a1 + 32) setCurrentLocation:v2];

  id v3 = [*(id *)(a1 + 32) requestLocationSemaphore];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) requestLocationSemaphore];
    dispatch_semaphore_signal(v4);
  }
}

void sub_10001CF0C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10001D0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001D104(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  if ([a2 isEqualToString:@"TrustedLux"])
  {
    unsigned int v5 = [v6 intValue];
    if ((v5 & 0x80000000) == 0)
    {
      *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
  }
}

void sub_10001DC3C(id a1)
{
  qword_10007A888 = objc_alloc_init(OSChargingSignals);

  _objc_release_x1();
}

void sub_100020670(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) dictionaryForKey:@"currentData"];
  id v3 = [v2 mutableCopy];
  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v3;

  id v6 = [*(id *)(*(void *)(a1 + 32) + 8) dictionaryForKey:@"analytics"];
  id v7 = [v6 mutableCopy];
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(v8 + 16);
  *(void *)(v8 + 16) = v7;

  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v10 = +[NSMutableDictionary dictionary];
      uint64_t v11 = *(void *)(a1 + 32);
      unsigned int v12 = *(void **)(v11 + 24);
      *(void *)(v11 + 24) = v10;

      [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:@"currentData"];
    }
  }
  else
  {
    uint64_t v13 = +[NSMutableDictionary dictionary];
    uint64_t v14 = *(void *)(a1 + 32);
    int v15 = *(void **)(v14 + 24);
    *(void *)(v14 + 24) = v13;
  }
  __int16 v16 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v16)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      uint64_t v17 = [v16 objectForKeyedSubscript:@"enabledDate"];
      if (v17)
      {
        __int16 v18 = (void *)v17;
        double v19 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"disabledDate"];

        if (!v19)
        {
          id v20 = +[NSDate now];
          [v20 timeIntervalSinceReferenceDate];
          uint64_t v21 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
          [*(id *)(*(void *)(a1 + 32) + 16) setObject:v21 forKeyedSubscript:@"disabledDate"];

          [*(id *)(*(void *)(a1 + 32) + 8) setObject:*(void *)(*(void *)(a1 + 32) + 16) forKey:@"analytics"];
        }
      }
    }
  }
  else
  {
    uint64_t v22 = +[NSMutableDictionary dictionary];
    uint64_t v23 = *(void *)(a1 + 32);
    id v24 = *(void **)(v23 + 16);
    *(void *)(v23 + 16) = v22;
  }
  double v25 = +[OSIntelligenceAnalyticsManager log];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    double v26 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    uint64_t v27 = *(void *)(a1 + 32);
    uint64_t v29 = *(void *)(v27 + 16);
    uint64_t v28 = *(void *)(v27 + 24);
    int v30 = 138412802;
    v31 = v26;
    __int16 v32 = 2112;
    uint64_t v33 = v29;
    __int16 v34 = 2112;
    uint64_t v35 = v28;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Restart = %@, Analytics is %@, Current Data is %@", (uint8_t *)&v30, 0x20u);
  }
}

void sub_10002090C(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  id v3 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020A64;
  block[3] = &unk_100064F30;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = state64;
  dispatch_sync(v3, block);

  uint64_t v4 = +[OSIntelligenceAnalyticsManager log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = +[NSNumber numberWithUnsignedLongLong:state64];
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SPN State Change %@", buf, 0xCu);
  }
}

id sub_100020A64(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNewSPNState:*(void *)(a1 + 40)];
}

void sub_100020A70(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  BOOL v3 = state64 != 0;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100020BDC;
  block[3] = &unk_100064F08;
  id v8 = *(id *)(a1 + 32);
  BOOL v9 = v3;
  dispatch_sync(v4, block);

  unsigned int v5 = +[OSIntelligenceAnalyticsManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithUnsignedLongLong:state64];
    *(_DWORD *)buf = 138412290;
    unsigned int v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Interrupt State Change %@", buf, 0xCu);
  }
}

id sub_100020BDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNewInterruptNotificationStart:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t sub_100020CD8(uint64_t a1)
{
  qword_10007A898 = (uint64_t)[objc_alloc(*(Class *)(a1 + 48)) initWithTrialClient:*(void *)(a1 + 32) withNamespace:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

id sub_100022674(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_100022E1C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100023D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100023D1C(id a1, BMStoreEvent *a2)
{
  return 1;
}

void sub_100023D24(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    uint64_t v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100042E80(v3);
    }
  }
}

uint64_t sub_100023D88(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  [v3 batteryPercentage];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;

  return 0;
}

void sub_100024050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100024080(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100024090(uint64_t a1)
{
}

void sub_100024098(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    uint64_t v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100042F74(v3);
    }
  }
}

void sub_1000240FC(uint64_t a1, void *a2)
{
  id v4 = a2;
  unsigned int v5 = v4;
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!*(void *)(v6 + 40)) {
    goto LABEL_4;
  }
  [v4 timestamp];
  double v8 = v7;
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) timestamp];
  double v10 = v9;
  uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
  [v11 batteryPercentage];
  unint64_t v13 = (uint64_t)v12;

  if (v13 < 0x65)
  {
    *(double *)(*(void *)(a1 + 48) + 8 * v13) = v8 - v10 + *(double *)(*(void *)(a1 + 48) + 8 * v13);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v6 + 40), a2);
    goto LABEL_8;
  }
  uint64_t v14 = [*(id *)(a1 + 40) log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    sub_100043018(v13);
  }

LABEL_8:
}

void sub_100024A7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100024AAC(id a1, BMStoreEvent *a2)
{
  return 1;
}

void sub_100024AB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100043184(v3);
    }
  }
}

BOOL sub_100024B18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  unsigned __int8 v5 = [v4 starting];

  if (v5)
  {
    [v3 timestamp];
    uint64_t v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
    double v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) == 0;
  }

  return v9;
}

void sub_100024E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100024E50(id a1, BMStoreEvent *a2)
{
  id v2 = [(BMStoreEvent *)a2 eventBody];
  unsigned __int8 v3 = [v2 hasInUseStatus];

  return v3;
}

void sub_100024E8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100043220(v3);
    }
  }
}

BOOL sub_100024EF0(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  int v4 = [v3 inUseStatus] & 5;

  if (v4) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return v4 == 0;
}

void sub_1000254EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 216), 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Unwind_Resume(a1);
}

int64_t sub_100025528(id a1, BMStoreEvent *a2, BMStoreEvent *a3)
{
  int v4 = a3;
  [(BMStoreEvent *)a2 timestamp];
  unsigned __int8 v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(BMStoreEvent *)v4 timestamp];
  double v7 = v6;

  double v8 = +[NSNumber numberWithDouble:v7];
  id v9 = [v5 compare:v8];

  return (int64_t)v9;
}

void sub_1000255C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    int v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000432C4(v3);
    }
  }
}

void sub_100025628(uint64_t a1, void *a2)
{
  id v34 = a2;
  int v4 = [v34 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    id v7 = v34;
    id v8 = *(id *)(v6 + 40);
    *(void *)(v6 + 40) = v7;
    goto LABEL_18;
  }
  id v8 = v34;
  id v9 = [v8 eventBody];
  if ([v9 starting])
  {
    uint64_t v10 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

    if (!v10)
    {
      uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
      id v12 = v8;
      unint64_t v13 = *(void **)(v11 + 40);
      *(void *)(v11 + 40) = v12;
      goto LABEL_17;
    }
  }
  else
  {
  }
  unint64_t v13 = [v8 eventBody];
  if (([v13 starting] & 1) == 0)
  {
    uint64_t v14 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

    if (!v14) {
      goto LABEL_18;
    }
    int v15 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
    double v16 = 0.0;
    if ([v15 hasSecondsFromGMT])
    {
      uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
      [v17 secondsFromGMT];
      double v16 = v18;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timestamp];
    unint64_t v13 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v16 + v19];
    [v8 timestamp];
    uint64_t v21 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v16 + v20];
    uint64_t v22 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    if (v22)
    {
      uint64_t v23 = [v22 endDate];
      [v13 timeIntervalSinceDate:v23];
      double v25 = v24;
      double v26 = *(double *)(a1 + 64);

      if (v25 < v26)
      {
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
        uint64_t v27 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) startDate];

        unint64_t v13 = (void *)v27;
      }
    }
    uint64_t v28 = [[_OSIntelligenceChargeSession alloc] initWithStartDate:v13 withEndDate:v21 withStartSoC:0 withEndSoC:0];
    uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
    int v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;

    [v21 timeIntervalSinceDate:v13];
    if (v31 >= *(double *)(a1 + 72)) {
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    }
    uint64_t v32 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v33 = *(void **)(v32 + 40);
    *(void *)(v32 + 40) = 0;
  }
LABEL_17:

LABEL_18:
}

void sub_100025E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose((const void *)(v55 - 240), 8);
  _Block_object_dispose((const void *)(v55 - 192), 8);
  _Unwind_Resume(a1);
}

int64_t sub_100025E64(id a1, BMStoreEvent *a2, BMStoreEvent *a3)
{
  int v4 = a3;
  [(BMStoreEvent *)a2 timestamp];
  unsigned __int8 v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(BMStoreEvent *)v4 timestamp];
  double v7 = v6;

  id v8 = +[NSNumber numberWithDouble:v7];
  id v9 = [v5 compare:v8];

  return (int64_t)v9;
}

void sub_100025F00(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    int v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000432C4(v3);
    }
  }
}

void sub_100025F64(uint64_t a1, void *a2)
{
  id v4 = a2;
  double v6 = [v4 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v9 = [v4 eventBody];
    objc_opt_class();
    char v10 = objc_opt_isKindOfClass();

    if (v10)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      goto LABEL_5;
    }
    id v11 = v4;
    id v12 = [v11 eventBody];
    if ([v12 starting])
    {
      uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

      if (!v13)
      {
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
        uint64_t v14 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
        [v14 batteryPercentage];
        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (int)v15;
        goto LABEL_11;
      }
    }
    else
    {
    }
    uint64_t v14 = [v11 eventBody];
    if (([v14 starting] & 1) == 0)
    {
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

      if (v16)
      {
        uint64_t v17 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) eventBody];
        double v18 = 0.0;
        if ([v17 hasSecondsFromGMT])
        {
          double v19 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) eventBody];
          [v19 secondsFromGMT];
          double v18 = v20;
        }
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) timestamp];
        uint64_t v22 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v18 + v21];
        [v11 timestamp];
        double v24 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v18 + v23];
        double v25 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        if (v25)
        {
          double v26 = [v25 endDate];
          [v22 timeIntervalSinceDate:v26];
          double v28 = v27;
          double v29 = *(double *)(a1 + 80);

          if (v28 < v29)
          {
            [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) removeObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
            uint64_t v30 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) startDate];

            double v31 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) startSoC];
            *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [v31 intValue];

            uint64_t v22 = (void *)v30;
          }
        }
        uint64_t v32 = [_OSIntelligenceChargeSession alloc];
        uint64_t v33 = +[NSNumber numberWithInt:*(unsigned int *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
        id v34 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
        [v34 batteryPercentage];
        uint64_t v35 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        uint64_t v36 = [(_OSIntelligenceChargeSession *)v32 initWithStartDate:v22 withEndDate:v24 withStartSoC:v33 withEndSoC:v35];
        uint64_t v37 = *(void *)(*(void *)(a1 + 64) + 8);
        v38 = *(void **)(v37 + 40);
        *(void *)(v37 + 40) = v36;

        [v24 timeIntervalSinceDate:v22];
        if (v39 >= *(double *)(a1 + 88))
        {
          __int16 v40 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) eventBody];
          [v40 batteryPercentage];
          double v42 = v41;
          double v43 = *(double *)(a1 + 96);

          if (v42 >= v43)
          {
            [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) addObject:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
            v44 = [*(id *)(a1 + 104) log];
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
              sub_100043368(a1 + 64, v44);
            }
          }
        }
        uint64_t v45 = *(void *)(*(void *)(a1 + 48) + 8);
        v46 = *(void **)(v45 + 40);
        *(void *)(v45 + 40) = 0;

        *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = -1;
      }
      goto LABEL_24;
    }
LABEL_11:

LABEL_24:
    goto LABEL_25;
  }
  uint64_t v8 = *(void *)(a1 + 32);
LABEL_5:
  objc_storeStrong((id *)(*(void *)(v8 + 8) + 40), a2);
LABEL_25:
}

int64_t sub_100027E00(id a1, _OSIIntervalProtocol *a2, _OSIIntervalProtocol *a3)
{
  id v4 = a3;
  unsigned __int8 v5 = a2;
  double v6 = [(_OSIIntervalProtocol *)v5 endDate];
  double v7 = [(_OSIIntervalProtocol *)v5 startDate];

  [v6 timeIntervalSinceDate:v7];
  double v9 = v8;

  char v10 = [(_OSIIntervalProtocol *)v4 endDate];
  id v11 = [(_OSIIntervalProtocol *)v4 startDate];

  [v10 timeIntervalSinceDate:v11];
  double v13 = v12;

  if (v9 > v13) {
    return -1;
  }
  else {
    return v9 < v13;
  }
}

void sub_1000284CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_1000284FC(id a1, BMStoreEvent *a2)
{
  id v2 = [(BMStoreEvent *)a2 eventBody];
  unsigned __int8 v3 = [v2 starting];

  return v3;
}

uint64_t sub_10002853C(uint64_t a1, void *a2)
{
  [a2 timestamp];
  uint64_t v3 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  unsigned __int8 v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 0;
}

void sub_10002895C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_10002899C(id a1, BMStoreEvent *a2)
{
  id v2 = [(BMStoreEvent *)a2 eventBody];
  unsigned __int8 v3 = [v2 hasInUseStatus];

  return v3;
}

uint64_t sub_1000289DC(uint64_t a1, void *a2)
{
  return 0;
}

void sub_10002C0E0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

double sub_10002C0FC@<D0>(uint64_t a1@<X1>, uint64_t a2@<X8>, double a3@<D0>, float a4@<S1>)
{
  double result = -a3;
  *(float *)a1 = a4;
  *(double *)(a1 + 4) = result;
  *(_WORD *)(a1 + 12) = 2112;
  *(void *)(a1 + 14) = a2;
  return result;
}

void sub_10002C130(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_10002C150(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10002C574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002C594(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained updateTrialParameters];
    id WeakRetained = v2;
  }
}

void sub_10002CBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_10002CBD0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([*(id *)(a1 + 32) showsSignificantInactivity:v6])
  {
    [*(id *)(a1 + 40) setHour:[v5 intValue]];
    double v7 = [*(id *)(a1 + 48) dateFromComponents:*(void *)(a1 + 40)];
    [v7 timeIntervalSinceDate:*(void *)(a1 + 56)];
    if (v8 == 0.0)
    {
      [v6 averageDuration];
      *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v20
                                                                  + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                              + 24);
      double v21 = *(NSObject **)(*(void *)(a1 + 32) + 80);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v22 = v21;
        [v6 averageDuration];
        int v24 = 134218242;
        double v25 = v23;
        __int16 v26 = 2112;
        id v27 = v5;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, " Using %.1fh from hour %@", (uint8_t *)&v24, 0x16u);
      }
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    }
    else
    {
      [v7 timeIntervalSinceDate:*(void *)(a1 + 56)];
      if (v9 > 0.0)
      {
        uint64_t v10 = [v7 dateByAddingTimeInterval:-86400.0];

        double v7 = (void *)v10;
      }
      [v6 averageDuration];
      double v12 = v11 * 3600.0;
      BOOL v13 = v11 < 8.0;
      double v14 = 28800.0;
      if (v13) {
        double v14 = v12;
      }
      double v15 = [v7 dateByAddingTimeInterval:v14];
      [v15 timeIntervalSinceDate:*(void *)(a1 + 56)];
      double v17 = v16;

      if (v17 > 0.0)
      {
        double v18 = v17 / 3600.0;
        *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v18
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                + 24);
        ++*(_DWORD *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
        double v19 = *(NSObject **)(*(void *)(a1 + 32) + 80);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 134218242;
          double v25 = v18;
          __int16 v26 = 2112;
          id v27 = v5;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, " Using %.1fh from hour %@", (uint8_t *)&v24, 0x16u);
        }
      }
    }
  }
}

void sub_10002DE40(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  id v2 = (void *)qword_10007A8B0;
  qword_10007A8B0 = (uint64_t)v1;

  [(id)qword_10007A8B0 setDateStyle:1];
  unsigned __int8 v3 = (void *)qword_10007A8B0;

  [v3 setTimeStyle:1];
}

uint64_t sub_100030C7C()
{
  qword_10007A8B8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100031284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
}

int64_t sub_1000312D4(id a1, BMStoreEvent *a2, BMStoreEvent *a3)
{
  uint64_t v4 = a3;
  [(BMStoreEvent *)a2 timestamp];
  id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(BMStoreEvent *)v4 timestamp];
  double v7 = v6;

  double v8 = +[NSNumber numberWithDouble:v7];
  id v9 = [v5 compare:v8];

  return (int64_t)v9;
}

BOOL sub_100031370(id a1, BMStoreEvent *a2)
{
  id v2 = [(BMStoreEvent *)a2 eventBody];
  BOOL v3 = v2 != 0;

  return v3;
}

BPSTuple *__cdecl sub_1000313A8(id a1, BPSTuple *a2, BMStoreEvent *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  double v6 = [(BMStoreEvent *)v5 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v8 = objc_alloc((Class)BPSTuple);
  id v9 = v8;
  if (isKindOfClass)
  {
    id v10 = [v8 initWithFirst:v5 second:0];
  }
  else
  {
    uint64_t v11 = [(BPSTuple *)v4 first];
    id v10 = [v9 initWithFirst:v11 second:v5];

    id v5 = (BMStoreEvent *)v11;
  }

  return (BPSTuple *)v10;
}

BOOL sub_100031480(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 second];

  if (!v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10004187C(v4);
    }
  }
  return v3 != 0;
}

uint64_t sub_1000314EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000314FC(uint64_t a1)
{
}

BOOL sub_100031504(id a1, BPSTuple *a2)
{
  id v2 = [(BPSTuple *)a2 second];
  BOOL v3 = [v2 eventBody];
  unsigned __int8 v4 = [v3 hasStarting];

  return v4;
}

void sub_100031558(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    unsigned __int8 v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100043C30(v3, v4);
    }
  }
}

void sub_1000315BC(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v5 + 40);
  double v6 = (id *)(v5 + 40);
  double v7 = v8;
  if (v8)
  {
    id v9 = [v7 second];
    id v10 = [v4 second];
    id v11 = [(id)objc_opt_class() isLockedBiomeScreenLockedEvent:v9];
    if (v11 == [(id)objc_opt_class() isLockedBiomeScreenLockedEvent:v10])
    {
      double v12 = [*(id *)(a1 + 32) log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Duplicate lock state; stitching by caching last state",
          buf,
          2u);
      }
      goto LABEL_29;
    }
    double v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) first];
    BOOL v13 = [v4 first];
    double v14 = +[NSTimeZone systemTimeZone];
    id v15 = [v14 secondsFromGMT];
    double v31 = v14;
    if (v12)
    {
      double v14 = [v12 eventBody];
      [v14 secondsFromGMT];
      if (v16 != (double)(uint64_t)v15)
      {

LABEL_15:
        double v21 = [*(id *)(a1 + 32) log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v32 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Interval might be in different timezone; dropping interval",
            v32,
            2u);
        }

        uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
        id v23 = v4;
        int v24 = *(void **)(v22 + 40);
        *(void *)(v22 + 40) = v23;
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      if (!v13)
      {

        goto LABEL_19;
      }
    }
    else if (!v13)
    {
      goto LABEL_19;
    }
    double v29 = v9;
    double v17 = v13;
    double v18 = [v13 eventBody];
    [v18 secondsFromGMT];
    double v20 = v19;

    if (v12) {
    BOOL v13 = v17;
    }
    id v9 = v29;
    if (v20 != (double)(uint64_t)v15) {
      goto LABEL_15;
    }
LABEL_19:
    [v9 timestamp];
    int v24 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v10 timestamp];
    uint64_t v30 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    double v25 = [[_OSLockInterval alloc] initWithStartDate:v24 andEndDate:v30 andIsLocked:v11];
    __int16 v26 = v25;
    if (v25 && [(_OSIInterval *)v25 isValidInterval])
    {
      if ([(_OSLockInterval *)v26 hasReasonableDuration])
      {
        if (v11) {
          uint64_t v27 = *(void *)(a1 + 48);
        }
        else {
          uint64_t v27 = *(void *)(a1 + 56);
        }
        [*(id *)(*(void *)(v27 + 8) + 40) addObject:v26];
      }
    }
    else
    {
      double v28 = [*(id *)(a1 + 32) log];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        sub_100041958(v26, v28);
      }
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);

    goto LABEL_28;
  }
  objc_storeStrong(v6, a2);
LABEL_30:
}

void sub_100032914(id a1)
{
  qword_10007A8C8 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.osintelligence.inactivity"];

  _objc_release_x1();
}

void sub_1000329B0(id a1)
{
  qword_10007A8D8 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.osintelligence.chargingpredictor"];

  _objc_release_x1();
}

void sub_100033AA4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[_OSHighBatteryDrainHighChargeDurationModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100033D9C(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    double v6 = [_OSHighBatteryDrainHighChargeDurationModelOutput alloc];
    double v7 = [v14 featureValueForName:@"label"];
    id v8 = [v7 int64Value];
    id v9 = [v14 featureValueForName:@"classProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(_OSHighBatteryDrainHighChargeDurationModelOutput *)v6 initWithLabel:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    BOOL v13 = *(void (**)(uint64_t, void, _OSHighBatteryDrainHighChargeDurationModelOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_100033FA4(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    double v6 = [_OSHighBatteryDrainHighChargeDurationModelOutput alloc];
    double v7 = [v14 featureValueForName:@"label"];
    id v8 = [v7 int64Value];
    id v9 = [v14 featureValueForName:@"classProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(_OSHighBatteryDrainHighChargeDurationModelOutput *)v6 initWithLabel:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    BOOL v13 = *(void (**)(uint64_t, void, _OSHighBatteryDrainHighChargeDurationModelOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_100034DBC(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[_OSHighBatteryDrainLowChargeDurationModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1000350B4(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    double v6 = [_OSHighBatteryDrainLowChargeDurationModelOutput alloc];
    double v7 = [v14 featureValueForName:@"label"];
    id v8 = [v7 int64Value];
    id v9 = [v14 featureValueForName:@"classProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(_OSHighBatteryDrainLowChargeDurationModelOutput *)v6 initWithLabel:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    BOOL v13 = *(void (**)(uint64_t, void, _OSHighBatteryDrainLowChargeDurationModelOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_1000352BC(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    double v6 = [_OSHighBatteryDrainLowChargeDurationModelOutput alloc];
    double v7 = [v14 featureValueForName:@"label"];
    id v8 = [v7 int64Value];
    id v9 = [v14 featureValueForName:@"classProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(_OSHighBatteryDrainLowChargeDurationModelOutput *)v6 initWithLabel:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    BOOL v13 = *(void (**)(uint64_t, void, _OSHighBatteryDrainLowChargeDurationModelOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_1000360D0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[base_duration alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100036388(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    double v6 = [base_durationOutput alloc];
    double v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    id v8 = -[base_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void (**)(uint64_t, void, base_durationOutput *))(v9 + 16);
    id v8 = a3;
    v10(v9, 0, v8);
  }
}

void sub_100036548(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    double v6 = [base_durationOutput alloc];
    double v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    id v8 = -[base_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void (**)(uint64_t, void, base_durationOutput *))(v9 + 16);
    id v8 = a3;
    v10(v9, 0, v8);
  }
}

void sub_100037390(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[base_engage alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100037688(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    double v6 = [base_engageOutput alloc];
    double v7 = [v14 featureValueForName:@"engage"];
    id v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(base_engageOutput *)v6 initWithEngage:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    BOOL v13 = *(void (**)(uint64_t, void, base_engageOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_100037890(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    double v6 = [base_engageOutput alloc];
    double v7 = [v14 featureValueForName:@"engage"];
    id v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(base_engageOutput *)v6 initWithEngage:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    BOOL v13 = *(void (**)(uint64_t, void, base_engageOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_10003888C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[durationModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100038B44(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    double v6 = [durationModelOutput alloc];
    double v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    id v8 = -[durationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void (**)(uint64_t, void, durationModelOutput *))(v9 + 16);
    id v8 = a3;
    v10(v9, 0, v8);
  }
}

void sub_100038D04(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    double v6 = [durationModelOutput alloc];
    double v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    id v8 = -[durationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void (**)(uint64_t, void, durationModelOutput *))(v9 + 16);
    id v8 = a3;
    v10(v9, 0, v8);
  }
}

void sub_100039D6C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[engageOnPlugin alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10003A064(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    double v6 = [engageOnPluginOutput alloc];
    double v7 = [v14 featureValueForName:@"engage"];
    id v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(engageOnPluginOutput *)v6 initWithEngage:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    BOOL v13 = *(void (**)(uint64_t, void, engageOnPluginOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_10003A26C(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    double v6 = [engageOnPluginOutput alloc];
    double v7 = [v14 featureValueForName:@"engage"];
    id v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(engageOnPluginOutput *)v6 initWithEngage:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    BOOL v13 = *(void (**)(uint64_t, void, engageOnPluginOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_10003B17C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[easy_engage alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10003B474(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    double v6 = [easy_engageOutput alloc];
    double v7 = [v14 featureValueForName:@"engage"];
    id v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(easy_engageOutput *)v6 initWithEngage:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    BOOL v13 = *(void (**)(uint64_t, void, easy_engageOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_10003B67C(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    double v6 = [easy_engageOutput alloc];
    double v7 = [v14 featureValueForName:@"engage"];
    id v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(easy_engageOutput *)v6 initWithEngage:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    BOOL v13 = *(void (**)(uint64_t, void, easy_engageOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_10003C498(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[long_duration alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10003C750(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    double v6 = [long_durationOutput alloc];
    double v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    id v8 = -[long_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void (**)(uint64_t, void, long_durationOutput *))(v9 + 16);
    id v8 = a3;
    v10(v9, 0, v8);
  }
}

void sub_10003C910(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    double v6 = [long_durationOutput alloc];
    double v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    id v8 = -[long_durationOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void (**)(uint64_t, void, long_durationOutput *))(v9 + 16);
    id v8 = a3;
    v10(v9, 0, v8);
  }
}

void sub_10003D884(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[longDurationModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10003DB3C(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    double v6 = [longDurationModelOutput alloc];
    double v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    id v8 = -[longDurationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void (**)(uint64_t, void, longDurationModelOutput *))(v9 + 16);
    id v8 = a3;
    v10(v9, 0, v8);
  }
}

void sub_10003DCFC(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    double v6 = [longDurationModelOutput alloc];
    double v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    id v8 = -[longDurationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void (**)(uint64_t, void, longDurationModelOutput *))(v9 + 16);
    id v8 = a3;
    v10(v9, 0, v8);
  }
}

void sub_10003ECB0(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[shortDurationModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10003EF68(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    double v6 = [shortDurationModelOutput alloc];
    double v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    id v8 = -[shortDurationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void (**)(uint64_t, void, shortDurationModelOutput *))(v9 + 16);
    id v8 = a3;
    v10(v9, 0, v8);
  }
}

void sub_10003F128(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  if (v11)
  {
    id v5 = a3;
    double v6 = [shortDurationModelOutput alloc];
    double v7 = [v11 featureValueForName:@"duration_pred"];
    [v7 doubleValue];
    id v8 = -[shortDurationModelOutput initWithDuration_pred:](v6, "initWithDuration_pred:");

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v10 = *(void (**)(uint64_t, void, shortDurationModelOutput *))(v9 + 16);
    id v8 = a3;
    v10(v9, 0, v8);
  }
}

void sub_100040190(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = [[engageModel alloc] initWithMLModel:v4];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_100040488(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    double v6 = [engageModelOutput alloc];
    double v7 = [v14 featureValueForName:@"engage"];
    id v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(engageModelOutput *)v6 initWithEngage:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    BOOL v13 = *(void (**)(uint64_t, void, engageModelOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_100040690(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  if (v14)
  {
    id v5 = a3;
    double v6 = [engageModelOutput alloc];
    double v7 = [v14 featureValueForName:@"engage"];
    id v8 = [v7 int64Value];
    uint64_t v9 = [v14 featureValueForName:@"classProbability"];
    id v10 = [v9 dictionaryValue];
    id v11 = [(engageModelOutput *)v6 initWithEngage:v8 classProbability:v10];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    BOOL v13 = *(void (**)(uint64_t, void, engageModelOutput *))(v12 + 16);
    id v11 = a3;
    v13(v12, 0, v11);
  }
}

void sub_100040AF8()
{
  sub_100007C64();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error projecting date of history sufficiency: %@. Default to 7 days since now", v1, 0xCu);
}

void sub_100040B6C()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Failed to set activity state to done", v2, v3, v4, v5, v6);
}

void sub_100040BA0()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Asked to defer activity. Ending evaluation task. Model type unknown", v2, v3, v4, v5, v6);
}

void sub_100040BD4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[_OSInactivityPredictor deviceUsageDiagnosis];
  sub_100007C64();
  sub_100007C70((void *)&_mh_execute_header, v3, v4, "[WARNING] DEVICE RARELY USED\n%@", v5, v6, v7, v8, v9);
}

void sub_100040C6C()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Client is not entitled for query.", v2, v3, v4, v5, v6);
}

void sub_100040CA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100040D10(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "(%ld) Model output overridden to %@", (uint8_t *)&v3, 0x16u);
}

void sub_100040D98(void *a1, uint64_t a2)
{
  int v3 = a1;
  uint64_t v4 = +[NSDate now];
  int v5 = 134218242;
  uint64_t v6 = a2;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "(%ld) %@ is out of time range; returning low confidence prediction",
    (uint8_t *)&v5,
    0x16u);
}

void sub_100040E5C()
{
  sub_100007C64();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Error querying model at date %@: %@", v2, 0x16u);
}

void sub_100040EE0()
{
  sub_100007C64();
  sub_100007CAC((void *)&_mh_execute_header, v0, v1, "Model output overridden to %@", v2, v3, v4, v5, v6);
}

void sub_100040F48()
{
  sub_100007C64();
  sub_100007CAC((void *)&_mh_execute_header, v0, v1, "%@ is out of time range; returning low confidence prediction",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100040FB0()
{
  sub_100007CC8();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "User has overridden to use time restriction during (%d, %d)", v1, 0xEu);
}

void sub_100041030()
{
  sub_100007C64();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error unarchiving overridden output: %@", v1, 0xCu);
}

void sub_1000410A4()
{
  sub_100007CE0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Desired Output is nil; deleting overriden model output from user defaults...",
    v1,
    2u);
}

void sub_1000410E4()
{
  sub_100007CC8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid input range (%d,%d).\nBedtime and wakeup time cannot be the same and must be in range [0, 23]", v1, 0xEu);
}

void sub_100041164(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 predictor];
  uint64_t v5 = [v4 predictorType];
  sub_100007C64();
  sub_100007C70((void *)&_mh_execute_header, v6, v7, "Upgraded model but model is still model-independent: %@. Upgrade failed.", v8, v9, v10, v11, v12);
}

void sub_100041210(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = 293;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating Trial Client for Project %d", (uint8_t *)v1, 8u);
}

void sub_100041290(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Loading primative factors", v1, 2u);
}

void sub_1000412D4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Loading compiled model from %@", (uint8_t *)&v2, 0xCu);
}

void sub_10004134C(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"COREOS_PREDICTION_INACTIVITY";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Extracting model paths from Namespace %@", (uint8_t *)&v1, 0xCu);
}

void sub_1000413D0()
{
  sub_100007C64();
  sub_10000BD94((void *)&_mh_execute_header, v0, v1, "Error creating MLDictionaryFeatureProvider: %@", v2, v3, v4, v5, v6);
}

void sub_100041438()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Empty feature name!", v2, v3, v4, v5, v6);
}

void sub_10004146C()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Empty query date!", v2, v3, v4, v5, v6);
}

void sub_1000414A0()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Empty historical events!", v2, v3, v4, v5, v6);
}

void sub_1000414D4()
{
  sub_100007C64();
  sub_10000BD94((void *)&_mh_execute_header, v0, v1, "Feature name %@ is not recognized.", v2, v3, v4, v5, v6);
}

void sub_10004153C()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Empty inactivity history!", v2, v3, v4, v5, v6);
}

void sub_100041570()
{
  sub_100007C64();
  sub_10000BD94((void *)&_mh_execute_header, v0, v1, "Requested history subset \"%@\" is not recognized", v2, v3, v4, v5, v6);
}

void sub_1000415D8()
{
  sub_100007C64();
  sub_10000BD94((void *)&_mh_execute_header, v0, v1, "Unknown strata type from feature %@. Defaulting to ALL.", v2, v3, v4, v5, v6);
}

void sub_100041640()
{
  sub_100007C64();
  sub_10000BD94((void *)&_mh_execute_header, v0, v1, "Error building regex to extract prefix string: %@", v2, v3, v4, v5, v6);
}

void sub_1000416A8()
{
  sub_100007C64();
  sub_10000BD94((void *)&_mh_execute_header, v0, v1, "Error building regex to extract suffix number: %@", v2, v3, v4, v5, v6);
}

void sub_100041710()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Trying to extract percentile number from empty feature name; returning nil",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100041744()
{
  sub_100007C64();
  sub_10000BD94((void *)&_mh_execute_header, v0, v1, "Error building regex to extract percentile number: %@", v2, v3, v4, v5, v6);
}

void sub_1000417AC()
{
  sub_100007C64();
  sub_10000BD94((void *)&_mh_execute_header, v0, v1, "Error building regex to extract quantile number: %@", v2, v3, v4, v5, v6);
}

void sub_100041814()
{
  sub_100007C64();
  sub_10000BD94((void *)&_mh_execute_header, v0, v1, "Error building regex to extract watershed tuple: %@", v2, v3, v4, v5, v6);
}

void sub_10004187C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "<tz event, nil> occurs because timezone updated; ignoring tuple...",
    v1,
    2u);
}

void sub_1000418C0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error reading activity levels from Biome: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100041958(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Dropping nil or invalid interval: %@", (uint8_t *)&v4, 0xCu);
}

void sub_1000419F0(uint64_t a1, void *a2, NSObject *a3)
{
  uint8_t v6 = [a2 allIntervalsSortByStartAsc];
  id v7 = [v6 count];
  uint64_t v8 = [a2 intervalsSameDayOfWeekAsQuery];
  id v9 = [v8 count];
  uint64_t v10 = [a2 intervalsSameWorkOrOffAsQuery];
  id v11 = [v10 count];
  uint8_t v12 = [a2 intervalsRecentFromQuery];
  int v13 = 138413314;
  uint64_t v14 = a1;
  __int16 v15 = 2048;
  id v16 = v7;
  __int16 v17 = 2048;
  id v18 = v9;
  __int16 v19 = 2048;
  id v20 = v11;
  __int16 v21 = 2048;
  id v22 = [v12 count];
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Updated strata sizes with date %@: all=%lu | dow=%lu | woo=%lu | recent=%lu", (uint8_t *)&v13, 0x34u);
}

void sub_100041B30(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unknown strata type %lu; default to all",
    (uint8_t *)&v2,
    0xCu);
}

void sub_100041BA8(os_log_t log, double a2, double a3)
{
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid boundary arguments: (%.2f, %.2f)", (uint8_t *)&v3, 0x16u);
}

void sub_100041C30(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Activities: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100041CA8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timeout! Took too long to query motion activity. Return 100%% stationary.", v1, 2u);
}

void sub_100041CEC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Low SOC prediction is currently not supported!", v1, 2u);
}

void sub_100041D30(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Client is not entitled for query.", v1, 2u);
}

void sub_100041D74(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Reporting sleep suppression query event to CA: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100041DEC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, " In schedule but next sleep event not found -> in sleep window", v1, 2u);
}

void sub_100041E30(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Is %@ in sleep window?", (uint8_t *)&v2, 0xCu);
}

void sub_100041EA8(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "User chose model type %lu which is not supported; instantiating normally...",
    (uint8_t *)&v2,
    0xCu);
}

void sub_100041F20(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100041FA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10004201C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Reading metadata from models", v1, 2u);
}

void sub_100042060(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000420D8(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [a2 timestamp];
  double v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v7 = [a3 title];
  sub_100017A44();
  sub_100017A5C((void *)&_mh_execute_header, v8, v9, "Playback ended at %@ (%@)", v10, v11, v12, v13, v14);
}

void sub_10004219C(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  [a2 timestamp];
  double v6 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v7 = [a3 title];
  sub_100017A44();
  sub_100017A5C((void *)&_mh_execute_header, v8, v9, "Playback started at %@ (%@)", v10, v11, v12, v13, v14);
}

void sub_100042260()
{
  sub_100007C64();
  sub_100007CAC((void *)&_mh_execute_header, v0, v1, "weekday24 events: %@", v2, v3, v4, v5, v6);
}

void sub_1000422C8()
{
  sub_100007C64();
  sub_100007CAC((void *)&_mh_execute_header, v0, v1, "weekday8 events: %@", v2, v3, v4, v5, v6);
}

void sub_100042330()
{
  sub_100007C64();
  sub_100007CAC((void *)&_mh_execute_header, v0, v1, "weekday4 events: %@", v2, v3, v4, v5, v6);
}

void sub_100042398()
{
  sub_100007C64();
  sub_100007CAC((void *)&_mh_execute_header, v0, v1, "weekday2 events: %@", v2, v3, v4, v5, v6);
}

void sub_100042400()
{
  sub_100007C64();
  sub_100007CAC((void *)&_mh_execute_header, v0, v1, "weekday1 events: %@", v2, v3, v4, v5, v6);
}

void sub_100042468()
{
  sub_100007C64();
  sub_100007CAC((void *)&_mh_execute_header, v0, v1, "hourBin24 events: %@", v2, v3, v4, v5, v6);
}

void sub_1000424D0()
{
  sub_100007C64();
  sub_100007CAC((void *)&_mh_execute_header, v0, v1, "hourBin16 events: %@", v2, v3, v4, v5, v6);
}

void sub_100042538()
{
  sub_100007C64();
  sub_100007CAC((void *)&_mh_execute_header, v0, v1, "hourBin8 events: %@", v2, v3, v4, v5, v6);
}

void sub_1000425A0()
{
  sub_100007C64();
  sub_100007CAC((void *)&_mh_execute_header, v0, v1, "hourBin4 events: %@", v2, v3, v4, v5, v6);
}

void sub_100042608()
{
  sub_100007C64();
  sub_100007CAC((void *)&_mh_execute_header, v0, v1, "hourBin2 events: %@", v2, v3, v4, v5, v6);
}

void sub_100042670()
{
  sub_100007C64();
  sub_100007CAC((void *)&_mh_execute_header, v0, v1, "hourBin1 events: %@", v2, v3, v4, v5, v6);
}

void sub_1000426D8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Model output overridden to %@", (uint8_t *)&v2, 0xCu);
}

void sub_100042750(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error unarchiving overridden output: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000427C8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Desired Output is nil; deleting overriden model output from user defaults...",
    v1,
    2u);
}

void sub_10004280C()
{
  sub_100007C64();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "likelyToBeInKnownArea result %@", v1, 0xCu);
}

void sub_100042880()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Error: Timeout occurred to obtain LsOI", v2, v3, v4, v5, v6);
}

void sub_1000428B4()
{
  sub_100007CE0();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "No LoI visists in three days", v1, 2u);
}

void sub_1000428F4(void *a1)
{
  uint64_t v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  sub_100007C64();
  sub_10001CF0C((void *)&_mh_execute_header, v3, v4, "Error getting KML in signalMonitor: %s", v5, v6, v7, v8, v9);
}

void sub_100042998()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "ERROR: Couldn't get current time zone in signal monitor", v2, v3, v4, v5, v6);
}

void sub_1000429CC(uint8_t *buf, NSObject *a2, double a3)
{
  *(_DWORD *)buf = 134217984;
  *(double *)(buf + 4) = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "current time zone: %f", buf, 0xCu);
}

void sub_100042A10(void *a1)
{
  uint64_t v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  sub_100007C64();
  sub_10001CF0C((void *)&_mh_execute_header, v3, v4, "Error getting TimeZone biome events in signal monitor: %s", v5, v6, v7, v8, v9);
}

void sub_100042AB4(void *a1)
{
  uint64_t v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  sub_100007C64();
  sub_10001CF0C((void *)&_mh_execute_header, v3, v4, "Error getting Timezone/plugin biome events in signal monitor: %s", v5, v6, v7, v8, v9);
}

void sub_100042B58()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "No timezone in event!", v2, v3, v4, v5, v6);
}

void sub_100042B8C()
{
  sub_100007CE0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Location manager: didUpdateLocations", v1, 2u);
}

void sub_100042BCC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error saving latest features: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100042C44()
{
  sub_100007C64();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error saving latest features: %@", v1, 0xCu);
}

void sub_100042CB8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error! End interrupt without start", v1, 2u);
}

void sub_100042CFC(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Negative progress for interrupt with %@", (uint8_t *)&v3, 0xCu);
}

void sub_100042D78(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error: Can't log overpredict without start date!", v1, 2u);
}

void sub_100042DBC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "loadHistoryFromUnderlyingDataSource() must be overridden in a subclass!", v1, 2u);
}

void sub_100042E00()
{
  sub_100007C64();
  __int16 v4 = 2048;
  uint64_t v5 = v0;
  sub_10002C0E0((void *)&_mh_execute_header, v1, v2, "Battery level at %@ is %lf", v3);
}

void sub_100042E80(void *a1)
{
  int v1 = [a1 error];
  os_log_t v2 = [v1 description];
  sub_100007C64();
  sub_10001CF0C((void *)&_mh_execute_header, v3, v4, "Error getting battery level biome events in batteryLevelAtDate %@", v5, v6, v7, v8, v9);
}

void sub_100042F1C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Skipping battery level %@", buf, 0xCu);
}

void sub_100042F74(void *a1)
{
  int v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  sub_100007C64();
  sub_10001CF0C((void *)&_mh_execute_header, v3, v4, "Error getting battery stream in batteryLevelDurations: %s", v5, v6, v7, v8, v9);
}

void sub_100043018(uint64_t a1)
{
  int v1 = +[NSNumber numberWithInteger:a1];
  sub_100007C64();
  sub_10001CF0C((void *)&_mh_execute_header, v2, v3, "Skipping battery level %@", v4, v5, v6, v7, v8);
}

void sub_1000430A8()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "ERROR: No battery events!", v2, v3, v4, v5, v6);
}

void sub_1000430DC()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Error getting Biome plugged-in events. Returning current time.", v2, v3, v4, v5, v6);
}

void sub_100043110()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Last plugged-in date is in the future. Returning current time.", v2, v3, v4, v5, v6);
}

void sub_100043144(uint64_t a1, uint64_t a2, double a3)
{
  sub_10002C0FC(a2, *(void *)(*(void *)a1 + 40), a3, 3.8521e-34);
  sub_10002C0E0((void *)&_mh_execute_header, v3, v4, "Last plug-in was %.2f seconds ago at %@", v5);
}

void sub_100043184(void *a1)
{
  uint64_t v1 = [a1 error];
  uint64_t v2 = [v1 description];
  sub_100007C64();
  sub_10001CF0C((void *)&_mh_execute_header, v3, v4, "Error getting plugged in biome events in lastPluggedInDate %@", v5, v6, v7, v8, v9);
}

void sub_100043220(void *a1)
{
  uint64_t v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  sub_100007C64();
  sub_10001CF0C((void *)&_mh_execute_header, v3, v4, "Error getting plugin biome events in deviceWasActive - %s", v5, v6, v7, v8, v9);
}

void sub_1000432C4(void *a1)
{
  uint64_t v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  sub_100007C64();
  sub_10001CF0C((void *)&_mh_execute_header, v3, v4, "Error getting plugin biome events in pluginEventsBefore - %s", v5, v6, v7, v8, v9);
}

void sub_100043368(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "  %@", (uint8_t *)&v3, 0xCu);
}

void sub_1000433EC()
{
  sub_10002C0C8();
  sub_10002C0E0((void *)&_mh_execute_header, v0, v1, "Timeline event '%@' exists %@", v2);
}

void sub_100043458()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Input interval is nil", v2, v3, v4, v5, v6);
}

void sub_10004348C()
{
  sub_10002C118();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid arguments: (%.2f, %.2f)", v1, 0x16u);
}

void sub_100043504()
{
  sub_10002C0C8();
  sub_10002C150((void *)&_mh_execute_header, v0, v1, "Bad input point(s): Points should be arrays of length 2. PointA = %@. PointB = %@");
}

void sub_10004356C(void *a1)
{
  uint64_t v2 = [a1 startDate];
  uint64_t v3 = [a1 endDate];
  sub_10002C170();
  sub_10002C130((void *)&_mh_execute_header, v4, v5, "Invalid event in question (%@, %@) has negative duration of %.2f sec", v6, v7, v8, v9, v10);
}

void sub_10004362C(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 startDate];
  uint64_t v4 = [a2 endDate];
  sub_10002C170();
  sub_10002C130((void *)&_mh_execute_header, v5, v6, "Error calculating intersected duration for a date %@ out of bounds of event(%@, %@)", v7, v8, v9, v10, v11);
}

void sub_1000436E4()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Error getting Biome lock events. Returning nil.", v2, v3, v4, v5, v6);
}

void sub_100043718()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Last lock date is in the future. Returning nil.", v2, v3, v4, v5, v6);
}

void sub_10004374C(uint64_t a1, uint64_t a2, double a3)
{
  sub_10002C0FC(a2, *(void *)(*(void *)a1 + 40), a3, 3.8521e-34);
  sub_10002C0E0((void *)&_mh_execute_header, v3, v4, "Last lock was %.2f seconds ago at %@", v5);
}

void sub_10004378C()
{
  sub_100007C64();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Cannot find any activity event with endDate %@!", v1, 0xCu);
}

void sub_100043800()
{
  sub_100007CE0();
  sub_100007C90((void *)&_mh_execute_header, v0, v1, "Found event in the future. Returning 0 second.", v2, v3, v4, v5, v6);
}

void sub_100043834()
{
  sub_10002C0C8();
  sub_10002C150((void *)&_mh_execute_header, v0, v1, "Error loading model content from %@: %@");
}

void sub_10004389C()
{
  sub_100007C64();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Loading compiled model from %@", v1, 0xCu);
}

void sub_100043910(uint8_t *buf, uint64_t a2, os_log_t log)
{
  *(_DWORD *)buf = 134217984;
  *(void *)(buf + 4) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Computing for hour %ld", buf, 0xCu);
}

void sub_100043958()
{
  sub_100007C64();
  sub_10000BD94((void *)&_mh_execute_header, v0, v1, "Error loading model from path: %@", v2, v3, v4, v5, v6);
}

void sub_1000439C0()
{
  sub_10002C0C8();
  sub_10002C150((void *)&_mh_execute_header, v0, v1, "Error loading updated model from path (%@): %@");
}

void sub_100043A28()
{
  sub_100007C64();
  sub_10000BD94((void *)&_mh_execute_header, v0, v1, "Error while creating feature provider: %@", v2, v3, v4, v5, v6);
}

void sub_100043A90(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 description];
  sub_100007C64();
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "nil model for class: %@", v4, 0xCu);
}

void sub_100043B60()
{
  sub_100007C64();
  sub_10000BD94((void *)&_mh_execute_header, v0, v1, "Compile model error: %@", v2, v3, v4, v5, v6);
}

void sub_100043BC8()
{
  sub_100007C64();
  sub_10000BD94((void *)&_mh_execute_header, v0, v1, "model url reachability error: %@", v2, v3, v4, v5, v6);
}

void sub_100043C30(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error reading screen tz-lock tuples from Biome: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100043CC8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load _OSHighBatteryDrainHighChargeDurationModel.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100043D10()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load _OSHighBatteryDrainLowChargeDurationModel.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100043D58()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load base_duration.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100043DA0()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load base_engage.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100043DE8()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load durationModel.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100043E30()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load engageOnPlugin.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100043E78()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load easy_engage.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100043EC0()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load long_duration.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100043F08()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load longDurationModel.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100043F50()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load shortDurationModel.mlmodelc in the bundle resource", v0, 2u);
}

void sub_100043F98()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not load engageModel.mlmodelc in the bundle resource", v0, 2u);
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
}

void bzero(void *a1, size_t a2)
{
}

long double cos(long double __x)
{
  return _cos(__x);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

long double exp(long double __x)
{
  return _exp(__x);
}

long double fmod(long double __x, long double __y)
{
  return _fmod(__x, __y);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
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

void objc_exception_throw(id exception)
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

long double sin(long double __x)
{
  return _sin(__x);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

void xpc_activity_unregister(const char *identifier)
{
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

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return _xpc_equal(object1, object2);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_Activity(void *a1, const char *a2, ...)
{
  return [a1 Activity];
}

id objc_msgSend_BatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 BatteryLevel];
}

id objc_msgSend_Device(void *a1, const char *a2, ...)
{
  return [a1 Device];
}

id objc_msgSend_Level(void *a1, const char *a2, ...)
{
  return [a1 Level];
}

id objc_msgSend_Location(void *a1, const char *a2, ...)
{
  return [a1 Location];
}

id objc_msgSend_Media(void *a1, const char *a2, ...)
{
  return [a1 Media];
}

id objc_msgSend_MicroLocationVisit(void *a1, const char *a2, ...)
{
  return [a1 MicroLocationVisit];
}

id objc_msgSend_NowPlaying(void *a1, const char *a2, ...)
{
  return [a1 NowPlaying];
}

id objc_msgSend_PluggedIn(void *a1, const char *a2, ...)
{
  return [a1 PluggedIn];
}

id objc_msgSend_Power(void *a1, const char *a2, ...)
{
  return [a1 Power];
}

id objc_msgSend_ScreenLocked(void *a1, const char *a2, ...)
{
  return [a1 ScreenLocked];
}

id objc_msgSend_TimeZone(void *a1, const char *a2, ...)
{
  return [a1 TimeZone];
}

id objc_msgSend_URLOfModelInThisBundle(void *a1, const char *a2, ...)
{
  return [a1 URLOfModelInThisBundle];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend_absoluteTimestamp(void *a1, const char *a2, ...)
{
  return [a1 absoluteTimestamp];
}

id objc_msgSend_activeModeConfiguration(void *a1, const char *a2, ...)
{
  return [a1 activeModeConfiguration];
}

id objc_msgSend_activity(void *a1, const char *a2, ...)
{
  return [a1 activity];
}

id objc_msgSend_allIntervalsSortByStartAsc(void *a1, const char *a2, ...)
{
  return [a1 allIntervalsSortByStartAsc];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allUnlocks(void *a1, const char *a2, ...)
{
  return [a1 allUnlocks];
}

id objc_msgSend_alternatePredictor(void *a1, const char *a2, ...)
{
  return [a1 alternatePredictor];
}

id objc_msgSend_aodOffOrSuppressed(void *a1, const char *a2, ...)
{
  return [a1 aodOffOrSuppressed];
}

id objc_msgSend_areSleepHeuristicsMet(void *a1, const char *a2, ...)
{
  return [a1 areSleepHeuristicsMet];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return [a1 authorizationStatus];
}

id objc_msgSend_averageDuration(void *a1, const char *a2, ...)
{
  return [a1 averageDuration];
}

id objc_msgSend_backlightState(void *a1, const char *a2, ...)
{
  return [a1 backlightState];
}

id objc_msgSend_backupData(void *a1, const char *a2, ...)
{
  return [a1 backupData];
}

id objc_msgSend_baseModel(void *a1, const char *a2, ...)
{
  return [a1 baseModel];
}

id objc_msgSend_batteryAdapterIsWirelessKey(void *a1, const char *a2, ...)
{
  return [a1 batteryAdapterIsWirelessKey];
}

id objc_msgSend_batteryExternalConnectedChangeDateKey(void *a1, const char *a2, ...)
{
  return [a1 batteryExternalConnectedChangeDateKey];
}

id objc_msgSend_batteryExternalConnectedKey(void *a1, const char *a2, ...)
{
  return [a1 batteryExternalConnectedKey];
}

id objc_msgSend_batteryPercentage(void *a1, const char *a2, ...)
{
  return [a1 batteryPercentage];
}

id objc_msgSend_batteryPercentageKey(void *a1, const char *a2, ...)
{
  return [a1 batteryPercentageKey];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_BOOLeanValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLeanValue];
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return [a1 calendar];
}

id objc_msgSend_calendarMonitor(void *a1, const char *a2, ...)
{
  return [a1 calendarMonitor];
}

id objc_msgSend_categoryDescription(void *a1, const char *a2, ...)
{
  return [a1 categoryDescription];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifier];
}

id objc_msgSend_chargingSignals(void *a1, const char *a2, ...)
{
  return [a1 chargingSignals];
}

id objc_msgSend_chargingUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 chargingUserDefaults];
}

id objc_msgSend_classProbability(void *a1, const char *a2, ...)
{
  return [a1 classProbability];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return [a1 confidence];
}

id objc_msgSend_confidenceLevel(void *a1, const char *a2, ...)
{
  return [a1 confidenceLevel];
}

id objc_msgSend_confidenceThresholdRelaxed(void *a1, const char *a2, ...)
{
  return [a1 confidenceThresholdRelaxed];
}

id objc_msgSend_confidenceThresholdStrict(void *a1, const char *a2, ...)
{
  return [a1 confidenceThresholdStrict];
}

id objc_msgSend_confidenceValue(void *a1, const char *a2, ...)
{
  return [a1 confidenceValue];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentAmbientLightLevel(void *a1, const char *a2, ...)
{
  return [a1 currentAmbientLightLevel];
}

id objc_msgSend_currentBootSessionUUID(void *a1, const char *a2, ...)
{
  return [a1 currentBootSessionUUID];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentLocation(void *a1, const char *a2, ...)
{
  return [a1 currentLocation];
}

id objc_msgSend_currentlyInCar(void *a1, const char *a2, ...)
{
  return [a1 currentlyInCar];
}

id objc_msgSend_dataProtectionClassC(void *a1, const char *a2, ...)
{
  return [a1 dataProtectionClassC];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_deadlineSetter(void *a1, const char *a2, ...)
{
  return [a1 deadlineSetter];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultOptions(void *a1, const char *a2, ...)
{
  return [a1 defaultOptions];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_determineNextEvent(void *a1, const char *a2, ...)
{
  return [a1 determineNextEvent];
}

id objc_msgSend_deviceUsageDiagnosis(void *a1, const char *a2, ...)
{
  return [a1 deviceUsageDiagnosis];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryValue(void *a1, const char *a2, ...)
{
  return [a1 dictionaryValue];
}

id objc_msgSend_dimsLockScreen(void *a1, const char *a2, ...)
{
  return [a1 dimsLockScreen];
}

id objc_msgSend_directoryValue(void *a1, const char *a2, ...)
{
  return [a1 directoryValue];
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

id objc_msgSend_dueDate(void *a1, const char *a2, ...)
{
  return [a1 dueDate];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_durationModel(void *a1, const char *a2, ...)
{
  return [a1 durationModel];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_endSoC(void *a1, const char *a2, ...)
{
  return [a1 endSoC];
}

id objc_msgSend_engage(void *a1, const char *a2, ...)
{
  return [a1 engage];
}

id objc_msgSend_engageModel(void *a1, const char *a2, ...)
{
  return [a1 engageModel];
}

id objc_msgSend_engageOnPluginModel(void *a1, const char *a2, ...)
{
  return [a1 engageOnPluginModel];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_evaluator(void *a1, const char *a2, ...)
{
  return [a1 evaluator];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return [a1 eventBody];
}

id objc_msgSend_featureNames(void *a1, const char *a2, ...)
{
  return [a1 featureNames];
}

id objc_msgSend_fileValue(void *a1, const char *a2, ...)
{
  return [a1 fileValue];
}

id objc_msgSend_first(void *a1, const char *a2, ...)
{
  return [a1 first];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_handleNewExitState(void *a1, const char *a2, ...)
{
  return [a1 handleNewExitState];
}

id objc_msgSend_hasBackup(void *a1, const char *a2, ...)
{
  return [a1 hasBackup];
}

id objc_msgSend_hasEnoughHistoryForInactivityPrediction(void *a1, const char *a2, ...)
{
  return [a1 hasEnoughHistoryForInactivityPrediction];
}

id objc_msgSend_hasEnoughInactivityHistory(void *a1, const char *a2, ...)
{
  return [a1 hasEnoughInactivityHistory];
}

id objc_msgSend_hasInUseStatus(void *a1, const char *a2, ...)
{
  return [a1 hasInUseStatus];
}

id objc_msgSend_hasReasonableDuration(void *a1, const char *a2, ...)
{
  return [a1 hasReasonableDuration];
}

id objc_msgSend_hasRecentPlaybackChange(void *a1, const char *a2, ...)
{
  return [a1 hasRecentPlaybackChange];
}

id objc_msgSend_hasSecondsFromGMT(void *a1, const char *a2, ...)
{
  return [a1 hasSecondsFromGMT];
}

id objc_msgSend_hasStarting(void *a1, const char *a2, ...)
{
  return [a1 hasStarting];
}

id objc_msgSend_horizontalAccuracy(void *a1, const char *a2, ...)
{
  return [a1 horizontalAccuracy];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_hourBinsOfLongestLocks(void *a1, const char *a2, ...)
{
  return [a1 hourBinsOfLongestLocks];
}

id objc_msgSend_hydrateBackup(void *a1, const char *a2, ...)
{
  return [a1 hydrateBackup];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_immediateMaxDarkLuxThreshold(void *a1, const char *a2, ...)
{
  return [a1 immediateMaxDarkLuxThreshold];
}

id objc_msgSend_inKnownMicrolocation(void *a1, const char *a2, ...)
{
  return [a1 inKnownMicrolocation];
}

id objc_msgSend_inTypicalLocation(void *a1, const char *a2, ...)
{
  return [a1 inTypicalLocation];
}

id objc_msgSend_inUseStatus(void *a1, const char *a2, ...)
{
  return [a1 inUseStatus];
}

id objc_msgSend_inactivityUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 inactivityUserDefaults];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initInvalidOutput(void *a1, const char *a2, ...)
{
  return [a1 initInvalidOutput];
}

id objc_msgSend_inputDescriptionsByName(void *a1, const char *a2, ...)
{
  return [a1 inputDescriptionsByName];
}

id objc_msgSend_int64Value(void *a1, const char *a2, ...)
{
  return [a1 int64Value];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intervalsRecentFromQuery(void *a1, const char *a2, ...)
{
  return [a1 intervalsRecentFromQuery];
}

id objc_msgSend_intervalsSameDayOfWeekAsQuery(void *a1, const char *a2, ...)
{
  return [a1 intervalsSameDayOfWeekAsQuery];
}

id objc_msgSend_intervalsSameWorkOrOffAsQuery(void *a1, const char *a2, ...)
{
  return [a1 intervalsSameWorkOrOffAsQuery];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAbsolutePath(void *a1, const char *a2, ...)
{
  return [a1 isAbsolutePath];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isActivityAvailable(void *a1, const char *a2, ...)
{
  return [a1 isActivityAvailable];
}

id objc_msgSend_isAllDay(void *a1, const char *a2, ...)
{
  return [a1 isAllDay];
}

id objc_msgSend_isDeviceRarelyUsedRecently(void *a1, const char *a2, ...)
{
  return [a1 isDeviceRarelyUsedRecently];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isInSameTimeZone(void *a1, const char *a2, ...)
{
  return [a1 isInSameTimeZone];
}

id objc_msgSend_isLocked(void *a1, const char *a2, ...)
{
  return [a1 isLocked];
}

id objc_msgSend_isSufficientDataAvailable(void *a1, const char *a2, ...)
{
  return [a1 isSufficientDataAvailable];
}

id objc_msgSend_isUpdatable(void *a1, const char *a2, ...)
{
  return [a1 isUpdatable];
}

id objc_msgSend_isValidInterval(void *a1, const char *a2, ...)
{
  return [a1 isValidInterval];
}

id objc_msgSend_keyPathForBatteryStateDataDictionary(void *a1, const char *a2, ...)
{
  return [a1 keyPathForBatteryStateDataDictionary];
}

id objc_msgSend_keyPathForCarConnectedStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForCarConnectedStatus];
}

id objc_msgSend_keyPathForInUseStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForInUseStatus];
}

id objc_msgSend_keyPathForNavigationStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForNavigationStatus];
}

id objc_msgSend_keyPathForPluginStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForPluginStatus];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_last(void *a1, const char *a2, ...)
{
  return [a1 last];
}

id objc_msgSend_lastLockDate(void *a1, const char *a2, ...)
{
  return [a1 lastLockDate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_lastPluggedInDate(void *a1, const char *a2, ...)
{
  return [a1 lastPluggedInDate];
}

id objc_msgSend_lastQueryDate(void *a1, const char *a2, ...)
{
  return [a1 lastQueryDate];
}

id objc_msgSend_lastRefreshDate(void *a1, const char *a2, ...)
{
  return [a1 lastRefreshDate];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_likelyToBeInKnownArea(void *a1, const char *a2, ...)
{
  return [a1 likelyToBeInKnownArea];
}

id objc_msgSend_loadHistoryFromUnderlyingDataSource(void *a1, const char *a2, ...)
{
  return [a1 loadHistoryFromUnderlyingDataSource];
}

id objc_msgSend_loadMinInputChargeDuration(void *a1, const char *a2, ...)
{
  return [a1 loadMinInputChargeDuration];
}

id objc_msgSend_loadTrialAdjustedHours(void *a1, const char *a2, ...)
{
  return [a1 loadTrialAdjustedHours];
}

id objc_msgSend_loadTrialFactors(void *a1, const char *a2, ...)
{
  return [a1 loadTrialFactors];
}

id objc_msgSend_loadTrialMinInputChargeDuration(void *a1, const char *a2, ...)
{
  return [a1 loadTrialMinInputChargeDuration];
}

id objc_msgSend_loadTrialThreshold(void *a1, const char *a2, ...)
{
  return [a1 loadTrialThreshold];
}

id objc_msgSend_loadTrialUpdates(void *a1, const char *a2, ...)
{
  return [a1 loadTrialUpdates];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationMonitor(void *a1, const char *a2, ...)
{
  return [a1 locationMonitor];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_longDurationModel(void *a1, const char *a2, ...)
{
  return [a1 longDurationModel];
}

id objc_msgSend_longThreshold(void *a1, const char *a2, ...)
{
  return [a1 longThreshold];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_lux(void *a1, const char *a2, ...)
{
  return [a1 lux];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_modelDescription(void *a1, const char *a2, ...)
{
  return [a1 modelDescription];
}

id objc_msgSend_modelVersion(void *a1, const char *a2, ...)
{
  return [a1 modelVersion];
}

id objc_msgSend_multiArrayValue(void *a1, const char *a2, ...)
{
  return [a1 multiArrayValue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_newTrackingId(void *a1, const char *a2, ...)
{
  return [a1 newTrackingId];
}

id objc_msgSend_newestIntervalInHistory(void *a1, const char *a2, ...)
{
  return [a1 newestIntervalInHistory];
}

id objc_msgSend_nextFireDate(void *a1, const char *a2, ...)
{
  return [a1 nextFireDate];
}

id objc_msgSend_notAuthorizedForLocation(void *a1, const char *a2, ...)
{
  return [a1 notAuthorizedForLocation];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfRanges(void *a1, const char *a2, ...)
{
  return [a1 numberOfRanges];
}

id objc_msgSend_oldestIntervalInHistory(void *a1, const char *a2, ...)
{
  return [a1 oldestIntervalInHistory];
}

id objc_msgSend_outputReason(void *a1, const char *a2, ...)
{
  return [a1 outputReason];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pctLong(void *a1, const char *a2, ...)
{
  return [a1 pctLong];
}

id objc_msgSend_pctStationary(void *a1, const char *a2, ...)
{
  return [a1 pctStationary];
}

id objc_msgSend_playbackState(void *a1, const char *a2, ...)
{
  return [a1 playbackState];
}

id objc_msgSend_predictedDuration(void *a1, const char *a2, ...)
{
  return [a1 predictedDuration];
}

id objc_msgSend_predictor(void *a1, const char *a2, ...)
{
  return [a1 predictor];
}

id objc_msgSend_predictorType(void *a1, const char *a2, ...)
{
  return [a1 predictorType];
}

id objc_msgSend_projectedDateOfHistorySufficiency(void *a1, const char *a2, ...)
{
  return [a1 projectedDateOfHistorySufficiency];
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return [a1 publisher];
}

id objc_msgSend_queryHistoricalInactivityState(void *a1, const char *a2, ...)
{
  return [a1 queryHistoricalInactivityState];
}

id objc_msgSend_queryingMechanism(void *a1, const char *a2, ...)
{
  return [a1 queryingMechanism];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_readEvaluatedPredictorTypeFromDefaults(void *a1, const char *a2, ...)
{
  return [a1 readEvaluatedPredictorTypeFromDefaults];
}

id objc_msgSend_readOverriddenModelOutput(void *a1, const char *a2, ...)
{
  return [a1 readOverriddenModelOutput];
}

id objc_msgSend_readOverriddenWaitTime(void *a1, const char *a2, ...)
{
  return [a1 readOverriddenWaitTime];
}

id objc_msgSend_readOverridenModelScheme(void *a1, const char *a2, ...)
{
  return [a1 readOverridenModelScheme];
}

id objc_msgSend_recommendedDecayDegree(void *a1, const char *a2, ...)
{
  return [a1 recommendedDecayDegree];
}

id objc_msgSend_recommendedWaitTime(void *a1, const char *a2, ...)
{
  return [a1 recommendedWaitTime];
}

id objc_msgSend_registerBackupTask(void *a1, const char *a2, ...)
{
  return [a1 registerBackupTask];
}

id objc_msgSend_relevantDate(void *a1, const char *a2, ...)
{
  return [a1 relevantDate];
}

id objc_msgSend_relevantEventDeadline(void *a1, const char *a2, ...)
{
  return [a1 relevantEventDeadline];
}

id objc_msgSend_removeAllDeliveredNotifications(void *a1, const char *a2, ...)
{
  return [a1 removeAllDeliveredNotifications];
}

id objc_msgSend_removeAllPendingNotificationRequests(void *a1, const char *a2, ...)
{
  return [a1 removeAllPendingNotificationRequests];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestLocationSemaphore(void *a1, const char *a2, ...)
{
  return [a1 requestLocationSemaphore];
}

id objc_msgSend_requireEnoughHistory(void *a1, const char *a2, ...)
{
  return [a1 requireEnoughHistory];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_scheduledDNDEndDate(void *a1, const char *a2, ...)
{
  return [a1 scheduledDNDEndDate];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return [a1 secondsFromGMT];
}

id objc_msgSend_secondsSinceWait(void *a1, const char *a2, ...)
{
  return [a1 secondsSinceWait];
}

id objc_msgSend_semanticType(void *a1, const char *a2, ...)
{
  return [a1 semanticType];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return [a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_sharedBacklight(void *a1, const char *a2, ...)
{
  return [a1 sharedBacklight];
}

id objc_msgSend_sharedChargePredictionInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedChargePredictionInstance];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shortDurationModel(void *a1, const char *a2, ...)
{
  return [a1 shortDurationModel];
}

id objc_msgSend_signals(void *a1, const char *a2, ...)
{
  return [a1 signals];
}

id objc_msgSend_sleepLog(void *a1, const char *a2, ...)
{
  return [a1 sleepLog];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startSoC(void *a1, const char *a2, ...)
{
  return [a1 startSoC];
}

id objc_msgSend_startUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 startUpdatingLocation];
}

id objc_msgSend_starting(void *a1, const char *a2, ...)
{
  return [a1 starting];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stationary(void *a1, const char *a2, ...)
{
  return [a1 stationary];
}

id objc_msgSend_stopUpdatingLocation(void *a1, const char *a2, ...)
{
  return [a1 stopUpdatingLocation];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return [a1 style];
}

id objc_msgSend_suggestionInfo(void *a1, const char *a2, ...)
{
  return [a1 suggestionInfo];
}

id objc_msgSend_systemLocale(void *a1, const char *a2, ...)
{
  return [a1 systemLocale];
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return [a1 systemTimeZone];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return [a1 temporaryDirectory];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return [a1 timeZone];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_trackingId(void *a1, const char *a2, ...)
{
  return [a1 trackingId];
}

id objc_msgSend_unCenter(void *a1, const char *a2, ...)
{
  return [a1 unCenter];
}

id objc_msgSend_unknown(void *a1, const char *a2, ...)
{
  return [a1 unknown];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_upcomingEventIDs(void *a1, const char *a2, ...)
{
  return [a1 upcomingEventIDs];
}

id objc_msgSend_updateHandlers(void *a1, const char *a2, ...)
{
  return [a1 updateHandlers];
}

id objc_msgSend_updateTrialParameters(void *a1, const char *a2, ...)
{
  return [a1 updateTrialParameters];
}

id objc_msgSend_upgradePredictorIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 upgradePredictorIfNeeded];
}

id objc_msgSend_userContext(void *a1, const char *a2, ...)
{
  return [a1 userContext];
}

id objc_msgSend_userHistoryDiagnosis(void *a1, const char *a2, ...)
{
  return [a1 userHistoryDiagnosis];
}

id objc_msgSend_userVisibleTransitionDate(void *a1, const char *a2, ...)
{
  return [a1 userVisibleTransitionDate];
}

id objc_msgSend_userVisibleTransitionLifetimeType(void *a1, const char *a2, ...)
{
  return [a1 userVisibleTransitionLifetimeType];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_waitedDuration(void *a1, const char *a2, ...)
{
  return [a1 waitedDuration];
}

id objc_msgSend_wallet(void *a1, const char *a2, ...)
{
  return [a1 wallet];
}

id objc_msgSend_walletMonitor(void *a1, const char *a2, ...)
{
  return [a1 walletMonitor];
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return [a1 weekday];
}

id objc_msgSend_weekdaysWithOccurrences(void *a1, const char *a2, ...)
{
  return [a1 weekdaysWithOccurrences];
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:x0 error:x1];
}