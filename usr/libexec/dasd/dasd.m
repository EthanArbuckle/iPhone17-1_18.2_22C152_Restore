void sub_100004680(id a1, NSArray *a2)
{
  NSArray *v2;
  id v3;
  uint64_t vars8;

  v2 = a2;
  v3 = +[_DASSystemConditionsRecorder sharedInstance];
  [v3 recordForKeyPaths:v2];
}

void sub_100004A44(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) groupName];
  if (v2) {
    [*(id *)(a1 + 40) addPendingActivity:*(void *)(a1 + 32) toGroupWithName:v2];
  }
  +[_DASConditionScore computeOptimalScoreAndDateForActivity:*(void *)(a1 + 32)];
  os_unfair_recursive_lock_lock_with_options();
  [*(id *)(*(void *)(a1 + 40) + 48) addObject:*(void *)(a1 + 32)];
  os_unfair_recursive_lock_unlock();
  [*(id *)(a1 + 40) addTriggersToActivity:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) shouldEvaluateTask:*(void *)(a1 + 32) atDate:*(void *)(a1 + 48)]&& objc_msgSend(*(id *)(a1 + 40), "shouldRunActivityNow:", *(void *)(a1 + 32))&& objc_msgSend(*(id *)(*(void *)(a1 + 40) + 376), "executeActivity:", *(void *)(a1 + 32)))
  {
    v3 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Running %@ immediately on submission", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 40) immediatelyBeginWorkForActivity:*(void *)(a1 + 32)];
  }
}

void sub_100004B94(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) currentValue];
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:v2];
}

void sub_100004C9C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dk_dedup];
  v3 = [*(id *)(*(void *)(a1 + 40) + 168) objectForKeyedSubscript:*(void *)(a1 + 32)];
  if (![*(id *)(*(void *)(a1 + 40) + 104) containsObject:*(void *)(a1 + 32)]) {
    goto LABEL_18;
  }
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 40) + 184);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    double v6 = *(double *)(a1 + 48);
    v7 = v4;
    v8 = +[NSNumber numberWithDouble:v6];
    int v23 = 138412546;
    uint64_t v24 = v5;
    __int16 v25 = 2112;
    v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ => %@", (uint8_t *)&v23, 0x16u);
  }
  double v9 = *(double *)(a1 + 48);
  if (v9 == 1.79769313e308)
  {
    if (!v3) {
      goto LABEL_18;
    }
    [*(id *)(*(void *)(a1 + 40) + 168) removeObjectForKey:*(void *)(a1 + 32)];
    v10 = *(void **)(a1 + 40);
    v11 = +[NSSet setWithObject:v2];
    [v10 queueCancelActivitiesForApps:v11];
    BOOL v12 = 0;
  }
  else
  {
    double v13 = fmax(v9, 450.0);
    BOOL v12 = v3 == 0;
    [v3 doubleValue];
    double v15 = v13 - v14;
    if (v15 < 0.0) {
      double v15 = -v15;
    }
    if (v15 <= 2.22044605e-16) {
      goto LABEL_13;
    }
    v11 = +[NSNumber numberWithDouble:v13];
    [*(id *)(*(void *)(a1 + 40) + 168) setObject:v11 forKeyedSubscript:v2];
  }

  [*(id *)(*(void *)(a1 + 40) + 80) setObject:*(void *)(*(void *)(a1 + 40) + 168) forKey:@"delays"];
  v16 = *(NSObject **)(*(void *)(a1 + 40) + 184);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    int v23 = 138412290;
    uint64_t v24 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Saved new value for %@", (uint8_t *)&v23, 0xCu);
  }
LABEL_13:
  uint64_t v18 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v18 + 8) && v12)
  {
    v19 = *(NSObject **)(v18 + 184);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = *(void *)(a1 + 32);
      int v23 = 138412290;
      uint64_t v24 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Scheduling update for %@", (uint8_t *)&v23, 0xCu);
    }
    v21 = *(void **)(a1 + 40);
    v22 = +[NSSet setWithObject:v2];
    [v21 queueScheduleActivitiesForEligibleApps:v22 withDelay:1];
  }
LABEL_18:
}

void sub_100005090(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) currentValue];
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:v2];
}

void sub_100005534(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006E64(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100006F88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000079CC(uint64_t a1)
{
  [*(id *)(a1 + 32) mean];
  double v3 = v2;
  [*(id *)(a1 + 40) getReferenceTemperatureForContext:*(void *)(a1 + 48) reader:*(void *)(*(void *)(a1 + 40) + 24)];
  double v5 = v4;
  double v6 = os_log_create("com.apple.clas", "signals");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000F4308(v6, v5, v3);
  }
  if (v3 - v5 <= 0.0)
  {
    unint64_t v8 = 0;
  }
  else
  {
    double v7 = (v3 - v5) / 5.0;
    if (v7 > 100.0) {
      double v7 = 100.0;
    }
    unint64_t v8 = (unint64_t)v7;
  }
  *(void *)(*(void *)(a1 + 40) + 16) = v8;
  double v9 = +[NSMutableDictionary dictionary];
  v10 = +[NSNumber numberWithDouble:v3];
  [v9 setObject:v10 forKeyedSubscript:@"BatteryTemperatureMean"];

  [*(id *)(a1 + 32) rate];
  v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v9 setObject:v11 forKeyedSubscript:@"BatteryTemperatureRate"];

  BOOL v12 = +[NSNumber numberWithUnsignedInteger:v8];
  [v9 setObject:v12 forKeyedSubscript:@"BatteryTemperatureControlEffort"];

  uint64_t v13 = *(void *)(a1 + 40);
  double v14 = *(void **)(v13 + 96);
  *(void *)(v13 + 96) = v9;
}

void sub_100007CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007EB4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000884C(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      double v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*(void *)(a1 + 40) + 56) activityCanceled:*(void *)(*((void *)&v7 + 1) + 8 * (void)v6), (void)v7];
        double v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_100008944(uint64_t a1, void *a2, void *a3)
{
  if (a3)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = a2;
    +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a3 pid]);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v4 setObject:v6 forKey:v5];
  }
}

void sub_100008A60(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v20 = [*(id *)(a1 + 40) startBefore];
  [v2 timeIntervalSinceDate:];
  if (v3 >= 0.0
    || ([*(id *)(*(void *)(a1 + 48) + 208) timeIntervalSinceDate:*(void *)(a1 + 32)], v4 <= 120.0))
  {
LABEL_14:
    _objc_release_x1();
    return;
  }
  id v5 = [*(id *)(a1 + 40) startBefore];
  [v5 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 48) + 208)];
  double v7 = v6;

  if (v7 >= 0.0) {
    return;
  }
  if ([*(id *)(a1 + 40) timewiseEligibleAtDate:*(void *)(a1 + 32)])
  {
    uint64_t v8 = [*(id *)(a1 + 40) groupName];
    if (v8)
    {
      long long v9 = (void *)v8;
      long long v10 = [*(id *)(a1 + 40) fastPass];
      if (v10)
      {
      }
      else
      {
        BOOL v12 = *(void **)(a1 + 40);
        v11 = *(void **)(a1 + 48);
        uint64_t v13 = [v12 groupName];
        uint64_t v14 = (uint64_t)[v11 additionalCapacityForActivity:v12 inGroupWithName:v13 shouldTryToSuspend:0];

        if (v14 < 1) {
          return;
        }
      }
    }
  }
  if (![*(id *)(a1 + 40) requiresNetwork]
    || [*(id *)(*(void *)(a1 + 48) + 216) isNetworkPathAvailableForActivity:*(void *)(a1 + 40)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 48) + 200));
    id v21 = [*(id *)(a1 + 40) predictedOptimalStartDate];
    [v21 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 48) + 200)];
    if (v15 > 0.0)
    {
      v16 = [*(id *)(a1 + 40) startBefore];
      uint64_t v17 = [*(id *)(a1 + 40) predictedOptimalStartDate];
      [v16 timeIntervalSinceDate:v17];
      double v19 = v18;

      if (v19 <= 60.0) {
        return;
      }
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = [*(id *)(a1 + 40) predictedOptimalStartDate];
    }
    goto LABEL_14;
  }
}

void sub_100009C8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100009CAC(uint64_t a1)
{
  id v2 = +[_DASBatteryTemperatureReader batteryProperties];
  double v3 = +[NSMutableDictionary dictionary];
  double v4 = [v2 objectForKeyedSubscript:@"ChargerData"];
  id v5 = [v4 objectForKeyedSubscript:@"NotChargingReason"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_23;
  }
  if (+[_DASRequiresPluggedInPolicy isIgnorableNotChargingReason:](_DASRequiresPluggedInPolicy, "isIgnorableNotChargingReason:", [v5 unsignedLongLongValue]))
  {
    *(void *)(*(void *)(a1 + 32) + 16) = 0;
    [v3 setObject:&off_100186B80 forKeyedSubscript:@"ChargeRate"];
    double v6 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 16)];
    [v3 setObject:v6 forKeyedSubscript:@"ChargeRateControlEffort"];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), v3);
    goto LABEL_23;
  }
  unsigned __int16 v7 = (unsigned __int16)[v5 unsignedLongLongValue];
  uint64_t v8 = *(void *)(a1 + 32);
  if ((v7 & 0x11E) != 0)
  {
    if (!*(unsigned char *)(v8 + 8))
    {
      char v9 = 1;
LABEL_9:
      *(unsigned char *)(v8 + 8) = v9;
    }
  }
  else if (*(unsigned char *)(v8 + 8))
  {
    char v9 = 0;
    goto LABEL_9;
  }
  [*(id *)(a1 + 40) rate];
  double v11 = v10;
  BOOL v12 = os_log_create("com.apple.clas", "signals");
  id v13 = [*(id *)(a1 + 40) count];
  if (v13 >= [*(id *)(a1 + 40) limit])
  {
    double v14 = v11 * 60.0;
  }
  else
  {
    double v14 = 2.0;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Not enough samples in the queue. Setting current rate to max rate", (uint8_t *)&v23, 2u);
    }
  }
  [*(id *)(a1 + 32) getReferenceChargeRateForContext:*(void *)(a1 + 48) reader:*(void *)(*(void *)(a1 + 32) + 24)];
  double v16 = v15;
  uint64_t v17 = v12;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v22 = [*(id *)(a1 + 40) allObjects];
    int v23 = 134218498;
    double v24 = v16;
    __int16 v25 = 2048;
    double v26 = v14;
    __int16 v27 = 2112;
    v28 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Charge Rate reference Value %lf Current value %lf, Signal values: %@", (uint8_t *)&v23, 0x20u);
  }
  if (v14 < 0.0 || v14 >= v16)
  {
    unint64_t v19 = 0;
  }
  else
  {
    double v18 = (v16 - v14) / v16 * 100.0;
    if (v18 > 100.0) {
      double v18 = 100.0;
    }
    unint64_t v19 = (unint64_t)v18;
  }
  *(void *)(*(void *)(a1 + 32) + 16) = v19;
  id v20 = +[NSNumber numberWithDouble:v14];
  [v3 setObject:v20 forKeyedSubscript:@"ChargeRate"];

  id v21 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 16)];
  [v3 setObject:v21 forKeyedSubscript:@"ChargeRateControlEffort"];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 96), v3);
LABEL_23:
}

void sub_10000A72C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained callback];
    v2[2]();

    id WeakRetained = v3;
  }
}

void sub_10000B448(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000C44C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000D43C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000D454(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 40) + 144) addObjectsFromArray:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 40) + 152) addObjectsFromArray:*(void *)(a1 + 48)];
  id v2 = [*(id *)(*(void *)(a1 + 40) + 160) mutableCopy];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v3 = *(id *)(a1 + 48);
  id v4 = [v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v37;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (([*(id *)(*(void *)(a1 + 40) + 160) containsObject:v8] & 1) == 0)
        {
          if ([v8 length])
          {
            [v2 removeObject:v8];
            if (([*(id *)(*(void *)(a1 + 40) + 112) containsObject:v8] & 1) != 0
              || ([*(id *)(*(void *)(a1 + 40) + 120) containsObject:v8] & 1) != 0
              || [*(id *)(*(void *)(a1 + 40) + 104) containsObject:v8]
              && ([*(id *)(*(void *)(a1 + 40) + 168) objectForKeyedSubscript:v8],
                  char v9 = objc_claimAutoreleasedReturnValue(),
                  v9,
                  v9))
            {
              double v10 = *(void **)(a1 + 56);
              double v11 = [v8 dk_dedup];
              [v10 addObject:v11];
            }
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v5);
  }

  BOOL v12 = +[NSMutableSet set];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v13 = *(id *)(a1 + 48);
  id v14 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v33;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)j) dk_dedup];
        [v12 addObject:v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v15);
  }

  [*(id *)(a1 + 40) queueHandleAppsRevived:v12];
  [*(id *)(a1 + 40) queueCancelActivitiesForApps:v12];
  id v19 = [v12 copy];
  uint64_t v20 = *(void *)(a1 + 40);
  id v21 = *(void **)(v20 + 160);
  *(void *)(v20 + 160) = v19;

  [*(id *)(a1 + 40) queueUpdateLastLaunchTimesToDate:*(void *)(a1 + 64) forApps:*(void *)(a1 + 56)];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v22 = *(id *)(*(void *)(a1 + 40) + 176);
  id v23 = [v22 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v29;
    do
    {
      for (k = 0; k != v24; k = (char *)k + 1)
      {
        if (*(void *)v29 != v25) {
          objc_enumerationMutation(v22);
        }
        [v2 removeObject:k];
      }
      id v24 = [v22 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v24);
  }

  uint64_t v27 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v27 + 8))
  {
    if (os_log_type_enabled(*(os_log_t *)(v27 + 184), OS_LOG_TYPE_DEBUG)) {
      sub_1000FB688();
    }
    [*(id *)(a1 + 40) queueScheduleActivitiesForEligibleApps:v2 withDelay:1, v28];
  }
}

id sub_10000D7F4(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  id v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v2 setObject:v3 forKeyedSubscript:@"rateLimited"];

  if (*(unsigned char *)(a1 + 40)) {
    id v4 = &off_100186AC0;
  }
  else {
    id v4 = &off_100186AD8;
  }
  [v2 setObject:v4 forKeyedSubscript:@"rateLimitedInt"];
  uint64_t v5 = [*(id *)(a1 + 32) rateLimitConfigurationName];
  uint64_t v6 = (void *)v5;
  if (v5) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = _DASDefaultConfigurationName;
  }
  [v2 setObject:v7 forKeyedSubscript:@"configurationName"];

  uint64_t v8 = +[_DASRateLimiterUtilities rateLimitIdentifierForActivity:*(void *)(a1 + 32)];
  [v2 setObject:v8 forKeyedSubscript:@"group"];

  return v2;
}

void sub_10000DA00(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  uint64_t v3 = *(void *)(a1 + 32);
  if ((unint64_t)v2 >= *(void *)(v3 + 16))
  {
    [(id)v3 unprotectedExecuteWorkItems];
  }
  else if (v2 == (id)1)
  {
    id v4 = *(NSObject **)(v3 + 56);
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(*(double *)(v3 + 8) * 1000000000.0));
    dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(*(double *)(*(void *)(a1 + 32) + 8) / 10.0 * 1000000000.0));
    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    dispatch_resume(v6);
  }
}

void sub_10000E2FC(uint64_t a1)
{
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v37 = [v2 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (!v37)
  {

    return;
  }
  uint64_t v32 = a1;
  char v3 = 0;
  char v4 = 0;
  char v5 = 0;
  char v6 = 0;
  id obj = v2;
  uint64_t v36 = *(void *)v41;
  uint64_t v7 = &AnalyticsSendEvent_ptr;
  uint64_t v8 = &AnalyticsSendEvent_ptr;
  do
  {
    for (i = 0; i != v37; i = (char *)i + 1)
    {
      if (*(void *)v41 != v36) {
        objc_enumerationMutation(obj);
      }
      double v10 = *(void **)(*((void *)&v40 + 1) + 8 * i);
      if (v6)
      {
        unsigned __int8 v39 = 0;
        if (v5) {
          goto LABEL_26;
        }
      }
      else
      {
        BOOL v12 = [v7[452] keyPathForBatteryLevel];
        if ([v10 isEqual:v12])
        {
          unsigned __int8 v39 = 1;
        }
        else
        {
          [v7[452] keyPathForLowPowerModeStatus];
          v15 = id v14 = v7;
          if ([v10 isEqual:v15])
          {
            unsigned __int8 v39 = 1;
          }
          else
          {
            uint64_t v17 = [v14[452] keyPathForPluginStatus];
            if ([v10 isEqual:v17])
            {
              unsigned __int8 v39 = 1;
            }
            else
            {
              double v18 = [v14[452] keyPathForBatteryStateDataDictionary];
              unsigned __int8 v39 = [v10 isEqual:v18];
            }
            uint64_t v8 = &AnalyticsSendEvent_ptr;
          }

          uint64_t v7 = &AnalyticsSendEvent_ptr;
        }

        if (v5)
        {
LABEL_26:
          unsigned __int8 v38 = 0;
          if (v4) {
            goto LABEL_49;
          }
          goto LABEL_27;
        }
      }
      double v11 = [v7[452] keyPathForMotionState:v32];
      if ([v10 isEqual:v11])
      {
        unsigned __int8 v38 = 1;
      }
      else
      {
        id v13 = [v7[452] keyPathForCallInProgressStatus];
        if ([v10 isEqual:v13])
        {
          unsigned __int8 v38 = 1;
        }
        else
        {
          uint64_t v16 = [v7[452] keyPathForCarplayConnectedStatus];
          if ([v10 isEqual:v16])
          {
            unsigned __int8 v38 = 1;
          }
          else
          {
            long long v33 = +[_CDContextualKeyPath ephemeralKeyPathWithKey:@"/car/isConnected"];
            if (objc_msgSend(v10, "isEqual:"))
            {
              unsigned __int8 v38 = 1;
            }
            else
            {
              long long v30 = +[_CDContextualKeyPath ephemeralKeyPathWithKey:@"/maps/navigationInProgress"];
              unsigned __int8 v38 = [v10 isEqual:v30];
            }
            uint64_t v8 = &AnalyticsSendEvent_ptr;
          }

          uint64_t v7 = &AnalyticsSendEvent_ptr;
        }
      }
      if (v4)
      {
LABEL_49:
        unsigned __int8 v20 = 0;
        if (v3) {
          goto LABEL_50;
        }
        goto LABEL_37;
      }
LABEL_27:
      id v19 = [v7[452] keyPathForThermalPressureLevel:v32];
      if ([v10 isEqual:v19])
      {
        unsigned __int8 v20 = 1;
      }
      else
      {
        id v21 = [v7[452] keyPathForInUseStatus];
        if ([v10 isEqual:v21])
        {
          unsigned __int8 v20 = 1;
        }
        else
        {
          id v22 = +[_CDContextualKeyPath ephemeralKeyPathWithKey:@"/system/peakPowerPressureLevel"];
          if ([v10 isEqual:v22])
          {
            unsigned __int8 v20 = 1;
          }
          else
          {
            long long v34 = +[_CDContextQueries keyPathForEnergyBudgetRemainingStatus];
            unsigned __int8 v20 = [v10 isEqual:v34];
          }
          uint64_t v8 = &AnalyticsSendEvent_ptr;
        }

        uint64_t v7 = &AnalyticsSendEvent_ptr;
      }

      if (v3)
      {
LABEL_50:
        unsigned __int8 v24 = 0;
        unsigned __int8 v25 = v39;
        goto LABEL_51;
      }
LABEL_37:
      id v23 = [v7[452] keyPathForNetworkingBudgetRemainingStatus:v32];
      if ([v10 isEqual:v23])
      {
        unsigned __int8 v24 = 1;
        unsigned __int8 v25 = v39;
      }
      else
      {
        double v26 = [v8[457] keyPathForWiFiConnectionStatus];
        if ([v10 isEqual:v26])
        {
          unsigned __int8 v24 = 1;
        }
        else
        {
          uint64_t v27 = [v8[457] keyPathForCellConnectionStatus];
          long long v28 = v10;
          long long v29 = (void *)v27;
          unsigned __int8 v24 = [v28 isEqual:x0];
        }
        unsigned __int8 v25 = v39;

        uint64_t v7 = &AnalyticsSendEvent_ptr;
      }

LABEL_51:
      v6 |= v25;
      v5 |= v38;
      v4 |= v20;
      v3 |= v24;
      uint64_t v8 = &AnalyticsSendEvent_ptr;
    }
    id v37 = [obj countByEnumeratingWithState:&v40 objects:v44 count:16];
  }
  while (v37);

  if ((v6 & 1) == 0)
  {
    uint64_t v31 = v32;
    if ((v4 & 1) == 0) {
      goto LABEL_59;
    }
    goto LABEL_58;
  }
  uint64_t v31 = v32;
  [*(id *)(v32 + 40) recordBatteryStatus];
  if (v4) {
LABEL_58:
  }
    [*(id *)(v31 + 40) recordPowerManagementStatus:v32];
LABEL_59:
  if (v3) {
    [*(id *)(v31 + 40) recordNetworkStatus];
  }
  if (v5) {
    [*(id *)(v31 + 40) recordMotionStatus];
  }
}

void sub_10000EA38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10000EC7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000104A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000104C8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100010514(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  char v3 = [*(id *)(a1 + 32) pluginTimeline];
  unsigned int v4 = +[_DASPredictionManager predictionNeedsUpdating:v3 atDate:v2[1] lastUpdatedAt:*((void *)*v2 + 9)];

  if (v4)
  {
    char v5 = [*(id *)(a1 + 32) predictionForDevicePluggedIn];
    [*(id *)(a1 + 32) setPluginTimeline:v5];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
    char v6 = [*(id *)(a1 + 32) pluginTimeline];
    +[_DASPredictionManager setPrediction:v6 forKey:@"plugin"];

    uint64_t v7 = +[_DASPLLogger sharedInstance];
    uint64_t v8 = [*(id *)(a1 + 32) pluginTimeline];
    [v7 recordPrediction:v8 key:@"powerPluggedInPrediction" valueMultiplier:100];

    char v9 = +[_DASDaemonLogger logForCategory:@"predictions"];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_1000F692C(v2, v9);
    }
  }
}

void sub_100010988(uint64_t a1, void *a2)
{
  id v21 = a2;
  [*(id *)(a1 + 32) keyPaths];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v28;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v28 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v8 = +[_DASDaemonLogger defaultCategory];
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          char v9 = [*(id *)(*(void *)(a1 + 40) + 680) objectForKeyedSubscript:v7];
          *(_DWORD *)buf = 138412546;
          long long v33 = v7;
          __int16 v34 = 2112;
          long long v35 = v9;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Trigger: %@ is now [%@]", buf, 0x16u);
        }
        [*(id *)(*(void *)(a1 + 40) + 344) addWorkItem:v7];
      }
      id v4 = [obj countByEnumeratingWithState:&v27 objects:v36 count:16];
    }
    while (v4);
  }
  [*(id *)(*(void *)(a1 + 40) + 336) addWorkItem:v21];
  if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.das.apppolicy.appchanged"])
  {
    double v10 = +[NSMutableArray array];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    double v11 = +[_DASApplicationPolicy focalApplicationsWithContext:*(void *)(*(void *)(a1 + 40) + 680)];
    id v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        for (j = 0; j != v13; j = (char *)j + 1)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
          if ([v16 length])
          {
            uint64_t v17 = [v16 dk_dedup];
            [v10 addObject:v17];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v13);
    }

    double v18 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Foreground apps changed—-%@", buf, 0xCu);
    }

    id v19 = *(void **)(*(void *)(a1 + 40) + 688);
    id v20 = [v10 copy];
    [v19 handleAppsForegrounded:v20];
  }
  if ([*(id *)(a1 + 48) isEqualToString:@"com.apple.das.userRequestedBackup"]) {
    [*(id *)(*(void *)(a1 + 40) + 160) syncRequested];
  }
}

void sub_100010D84(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) deviceActivityTimeline];
  unsigned int v4 = +[_DASPredictionManager predictionNeedsUpdating:v3 atDate:v2[1] lastUpdatedAt:*((void *)*v2 + 7)];

  if (v4)
  {
    uint64_t v5 = [*v2 predictionForDeviceActivity];
    [*v2 setDeviceActivityTimeline:v5];

    char v6 = +[_DASPLLogger sharedInstance];
    uint64_t v7 = [*v2 deviceActivityTimeline];
    [v6 recordPrediction:v7 key:@"deviceActivityPrediction" valueMultiplier:100];

    uint64_t v8 = +[_DASDaemonLogger logForCategory:@"predictions"];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F5A54(v2, v8);
    }

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), *(id *)(a1 + 40));
    char v9 = [*(id *)(a1 + 32) deviceActivityTimeline];
    +[_DASPredictionManager setPrediction:v9 forKey:@"deviceActivity"];
  }
}

unsigned char *sub_1000110D8(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[9])
  {
    [result recordValue];
    ++*(void *)(*(void *)(a1 + 32) + 80);
    id v3 = *(void **)(a1 + 32);
    if (!(v3[10] % v3[4]))
    {
      [v3 analyzeValues:v3[6] currentContext:v3[5]];
      id v3 = *(void **)(a1 + 32);
    }
    unsigned int v4 = (void *)v3[8];
    return [v4 scheduleOnBehalfOf:@"com.apple.das.monitor.chargeRate" between:0];
  }
  return result;
}

id sub_100011178(uint64_t a1)
{
  return [*(id *)(a1 + 32) unprotectedExecuteWorkItems];
}

id sub_100011180(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkControlAction:*(void *)(a1 + 40)];
}

id sub_10001118C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) startTrackingActivityWithParameters:*(void *)(a1 + 40)];
}

id sub_100011198(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleStateTransitionForProcess:withUpdate:];
}

uint64_t sub_1000111A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 40) + 40) + 16))();
}

id sub_1000111B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleStateTransitionForProcess:withUpdate:];
}

id sub_1000111BC(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) systemMemoryPressure];
  *(void *)(*(void *)(a1 + 32) + 48) = result;
  return result;
}

unsigned char *sub_1000111F0(uint64_t a1)
{
  id result = *(unsigned char **)(a1 + 32);
  if (result[8])
  {
    [result recordValue];
    ++*(void *)(*(void *)(a1 + 32) + 80);
    id v3 = *(void **)(a1 + 32);
    if (!(v3[10] % v3[4]))
    {
      [v3 analyzeValues:v3[6] currentContext:v3[5]];
      id v3 = *(void **)(a1 + 32);
    }
    unsigned int v4 = (void *)v3[8];
    return [v4 scheduleOnBehalfOf:@"com.apple.das.monitor.batteryTemperature" between:0];
  }
  return result;
}

void sub_100011B48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _callInvalidationHandler:0];
}

uint64_t sub_100012408()
{
  qword_1001C3A68 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

id sub_1000124E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) queue_handleMode:a3 updatedToState:a2];
}

uint64_t sub_100012820()
{
  qword_1001C3A78 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

uint64_t sub_100013110()
{
  qword_1001C3A88 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100014830(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100014864(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100014A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100014A74(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a3)
  {
    char v6 = +[_DASDataProtectionStateMonitor dataProtectionClassC];
    unsigned int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      objc_copyWeak(&to, (id *)(a1 + 32));
      id v8 = objc_loadWeakRetained(&to);

      if (v8)
      {
        id v9 = objc_loadWeakRetained(&to);
        uint64_t v10 = [v9 log];

        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Class C now available.", v13, 2u);
        }

        id v11 = objc_loadWeakRetained(&to);
        [v11 setClassCUnlocked:1];

        id v12 = objc_loadWeakRetained(&to);
        [v12 setDataProtectionStateMonitor:0];
      }
      objc_destroyWeak(&to);
    }
  }
}

void sub_100014B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_100014C00(id a1)
{
  qword_1001C3A90 = objc_opt_new();

  _objc_release_x1();
}

void sub_1000151C0(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = a2;
  uint64_t v6 = (uint64_t)[v10 integerValue];
  double v7 = 1.0;
  if (v6 <= 999)
  {
    [v10 doubleValue];
    double v7 = v8 / 1000.0;
  }
  id v9 = +[NSNumber numberWithDouble:v7];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v5];
}

void sub_100015328(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  [a3 doubleValue];
  if (v5 >= 0.25)
  {
    uint64_t v6 = *(void **)(a1 + 32);
    if (v5 >= 0.75) {
      double v7 = &off_100186AA8;
    }
    else {
      double v7 = &off_100186A90;
    }
    id v8 = v9;
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 32);
    double v7 = &off_100186A78;
    id v8 = v9;
  }
  [v6 setObject:v7 forKeyedSubscript:v8];
}

uint64_t sub_1000157AC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  [v7 doubleValue];
  double v9 = v8;

  id v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  [v10 doubleValue];
  double v12 = v11;

  if (v9 <= v12)
  {
    if (v12 <= v9)
    {
      uint64_t v14 = +[LSApplicationRecord bundleRecordWithApplicationIdentifier:v5 error:0];
      id v15 = [v14 bundleIdentifier];

      uint64_t v16 = +[LSApplicationRecord bundleRecordWithApplicationIdentifier:v6 error:0];
      uint64_t v17 = [v16 bundleIdentifier];

      double v18 = [*(id *)(a1 + 40) objectForKeyedSubscript:v15];
      signed int v19 = [v18 intValue];
      id v20 = [*(id *)(a1 + 40) objectForKeyedSubscript:v17];
      signed int v21 = [v20 intValue];

      if (v19 <= v21)
      {
        id v22 = [*(id *)(a1 + 40) objectForKeyedSubscript:v15];
        int v23 = [v22 intValue];
        long long v24 = [*(id *)(a1 + 40) objectForKeyedSubscript:v17];
        uint64_t v13 = v23 > (int)[v24 intValue];
      }
      else
      {
        uint64_t v13 = -1;
      }
    }
    else
    {
      uint64_t v13 = 1;
    }
  }
  else
  {
    uint64_t v13 = -1;
  }

  return v13;
}

void sub_100015D3C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id sub_100018870(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupTimerHandler];
}

uint64_t sub_100018918()
{
  qword_1001C3AA8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100018B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100018D84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100019060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_100019A78(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100019BF0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100019CCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001A5A0(uint64_t a1)
{
  [*(id *)(a1 + 32) locked_modulateBudgets];
}

id sub_10001A5E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) locked_modulateBudgets];
}

uint64_t sub_10001C9E0(uint64_t a1)
{
  qword_1001C3AC0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10001CAF0(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:@"budgets"];
  id v3 = [v2 mutableCopy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = *(id *)(a1 + 40);
  id v7 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v7)
  {
    id v9 = v7;
    uint64_t v10 = *(void *)v25;
    *(void *)&long long v8 = 138412290;
    long long v23 = v8;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v6);
        }
        double v12 = *(_DASWidgetRefreshBudget **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v13 = *(void **)(a1 + 32);
        uint64_t v14 = (void *)v13[2];
        id v15 = [v13 convertNameFromFullToCompact:v12 v23, (void)v24];
        uint64_t v16 = [v14 objectForKey:v15];
        id v17 = [v16 mutableCopy];

        if (v17)
        {
          [v17 setObject:v12 forKeyedSubscript:@"name"];
          double v18 = [v17 objectForKeyedSubscript:@"budgetID"];

          if (!v18)
          {
            signed int v19 = +[_DASWidgetRefreshBudgetManager widgetBudgetIDFromBudgetName:v12];
            [v17 setObject:v19 forKeyedSubscript:@"budgetID"];
          }
          id v20 = [[_DASWidgetRefreshBudget alloc] initWithDictionary:v17];
          if (v20) {
            [*(id *)(a1 + 48) addObject:v20];
          }
          signed int v21 = *(NSObject **)(*(void *)(a1 + 32) + 24);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v23;
            long long v29 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Found in store: %@", buf, 0xCu);
          }
        }
        else
        {
          id v22 = *(NSObject **)(*(void *)(a1 + 32) + 24);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v23;
            long long v29 = v12;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Budget for %@ not found in store", buf, 0xCu);
          }
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v9);
  }
}

id sub_10001CE2C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

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
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        double v11 = [v10 dictionaryRepresentation];
        double v12 = *(void **)(a1 + 32);
        uint64_t v13 = (void *)v12[2];
        uint64_t v14 = [v10 name];
        id v15 = [v12 convertNameFromFullToCompact:v14];
        [v13 setObject:v11 forKeyedSubscript:v15];
      }
      id v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }

  return [*(id *)(*(void *)(a1 + 32) + 8) setObject:*(void *)(*(void *)(a1 + 32) + 16) forKey:@"budgets"];
}

id sub_10001D048(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) dictionaryRepresentation];
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = (void *)v3[2];
  id v5 = [*(id *)(a1 + 40) name];
  id v6 = [v3 convertNameFromFullToCompact:v5];
  [v4 setObject:v2 forKeyedSubscript:v6];

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void **)(v7 + 8);
  uint64_t v9 = *(void *)(v7 + 16);

  return [v8 setObject:v9 forKey:@"budgets"];
}

id sub_10001D184(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 8);

  return [v3 setObject:v2 forKey:@"lastModulation"];
}

uint64_t sub_10001D2C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001D2D0(uint64_t a1)
{
}

void sub_10001D2D8(uint64_t a1)
{
}

uint64_t sub_10001D708()
{
  qword_1001C3AC8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

int64_t sub_10001D858(id a1, NSNumber *a2, NSNumber *a3)
{
  uint64_t v4 = a2;
  id v5 = a3;
  [(NSNumber *)v4 doubleValue];
  double v7 = v6;
  [(NSNumber *)v5 doubleValue];
  if (v7 <= v8)
  {
    [(NSNumber *)v4 doubleValue];
    double v11 = v10;
    [(NSNumber *)v5 doubleValue];
    int64_t v9 = v11 < v12;
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

void sub_10001DB94(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  double v6 = (void *)os_transaction_create();
  double v8 = +[NSMutableDictionary dictionary];
  int64_t v9 = +[_DASAppResumePLLogger applicationBundleIDForExecutableName:v12];

  if (v9)
  {
    double v10 = +[_DASAppResumePLLogger applicationBundleIDForExecutableName:v12];
    [v8 setObject:v10 forKeyedSubscript:@"BundleID"];
  }
  else
  {
    [v8 setObject:v12 forKeyedSubscript:@"BundleID"];
  }
  [v8 setObject:v5 forKeyedSubscript:@"PredictionScore"];
  double v11 = +[NSNumber numberWithInt:kAppResumePredictionTypeSwap];
  [v8 setObject:v11 forKeyedSubscript:@"PredictionType"];

  [*(id *)(a1 + 32) addObject:v8];
}

void sub_10001DCF4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = +[NSMutableDictionary dictionary];
  [v8 setObject:v6 forKeyedSubscript:@"BundleID"];

  [v8 setObject:v5 forKeyedSubscript:@"PredictionScore"];
  double v7 = +[NSNumber numberWithInt:kAppResumePredictionTypeProactive];
  [v8 setObject:v7 forKeyedSubscript:@"PredictionType"];

  [*(id *)(a1 + 32) addObject:v8];
}

void sub_10001E438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001E674(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 logUpdatedCarryStatus];
  [v3 setTaskCompleted];
}

Class sub_10001F0B4(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1001C3AE0)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10001F1F8;
    v4[4] = &unk_1001753E0;
    v4[5] = v4;
    long long v5 = off_100175648;
    uint64_t v6 = 0;
    qword_1001C3AE0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1001C3AE0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("ATXProactiveSuggestionClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_1000F3208();
LABEL_8:
    free(v2);
  }
  qword_1001C3AD8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10001F1F8()
{
  uint64_t result = _sl_dlopen();
  qword_1001C3AE0 = result;
  return result;
}

uint64_t sub_10001F408(uint64_t a1)
{
  qword_1001C3AF0 = [[_DASRemoteDeviceNearbyMonitor alloc] initWithDaemon:*(void *)(a1 + 32)];

  return _objc_release_x1();
}

id sub_10001F67C(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  uint64_t v2 = [*(id *)(a1 + 32) pendingWidgets];
  [v2 addObject:*(void *)(a1 + 40)];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v3 = *(void **)(a1 + 32);

  return [v3 protectedRegisterForRemoteDevices];
}

id sub_10001F7B0(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  uint64_t v2 = [*(id *)(a1 + 32) pendingWidgets];
  unsigned int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) pendingWidgets];
    [v4 removeObject:*(void *)(a1 + 40)];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  long long v5 = *(void **)(a1 + 32);

  return [v5 protectedRegisterForRemoteDevices];
}

void sub_10001FAC4(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  uint64_t v2 = +[NSMutableSet set];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  unsigned int v3 = [[*(id *)(a1 + 32) pendingWidgets];
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        if (*(void *)(a1 + 40))
        {
          id v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v9 = [v8 remoteDevice];
          if (v9)
          {
            double v10 = (void *)v9;
            double v11 = *(void **)(a1 + 40);
            id v12 = [v8 remoteDevice];
            LODWORD(v11) = [v11 isEqualToString:v12];

            if (v11) {
              [v2 addObject:v8];
            }
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v5);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  if ([v2 count])
  {
    uint64_t v13 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = v14;
      __int16 v22 = 2112;
      long long v23 = v2;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Remote device nearby: %@, Re-evaluating activities: %@", buf, 0x16u);
    }

    id v15 = [*(id *)(a1 + 32) daemon];
    [v15 evaluateScoreAndRunActivities:v2];
  }
}

void sub_10002053C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100020558(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  char changes = nw_browse_result_get_changes(v5, v6);
  if ((changes & 2) != 0)
  {
    nw_endpoint_t v8 = nw_browse_result_copy_endpoint(v6);
    if (v8)
    {
      uint64_t device_id = nw_endpoint_get_device_id();
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      double v11 = WeakRetained;
      if (!device_id || !WeakRetained) {
        goto LABEL_16;
      }
      id v12 = +[NSString stringWithUTF8String:device_id];
      [v11 updateDeviceNearby:v12];
LABEL_11:

LABEL_16:
      goto LABEL_17;
    }
    double v11 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
LABEL_15:
    sub_1000F3400();
    goto LABEL_16;
  }
  if ((changes & 4) != 0)
  {
    nw_endpoint_t v8 = nw_browse_result_copy_endpoint(v5);
    if (v8)
    {
      uint64_t v9 = nw_endpoint_get_device_id();
      double v10 = objc_loadWeakRetained((id *)(a1 + 32));
      double v11 = v10;
      if (!v9 || !v10) {
        goto LABEL_16;
      }
      id v12 = +[NSString stringWithUTF8String:v9];
      [v11 updateDeviceLost:v12];
      goto LABEL_11;
    }
    double v11 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_17:
}

void sub_1000206EC(id a1, int a2, OS_nw_error *a3)
{
  id v4 = a3;
  switch(a2)
  {
    case 0:
      id v5 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      __int16 v13 = 0;
      uint64_t v6 = "Browser entered invalid state";
      double v7 = (uint8_t *)&v13;
      break;
    case 1:
      id v5 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      __int16 v12 = 0;
      uint64_t v6 = "Browser entered ready state";
      double v7 = (uint8_t *)&v12;
      break;
    case 2:
      id v5 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      __int16 v11 = 0;
      uint64_t v6 = "Browser entered failed state";
      double v7 = (uint8_t *)&v11;
      break;
    case 3:
      id v5 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      __int16 v10 = 0;
      uint64_t v6 = "Browser entered cancelled state";
      double v7 = (uint8_t *)&v10;
      break;
    case 4:
      id v5 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      __int16 v9 = 0;
      uint64_t v6 = "Browser entered waiting state";
      double v7 = (uint8_t *)&v9;
      break;
    default:
      goto LABEL_14;
  }
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, v7, 2u);
LABEL_13:

LABEL_14:
  if (v4)
  {
    nw_endpoint_t v8 = +[_DASDaemonLogger logForCategory:@"NWBrowser"];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000F3434();
    }
  }
}

void sub_100020A30(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_100020BCC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) energyConsumptionHandler:a2];
}

void sub_100020C2C(id a1)
{
  qword_1001C3B00 = objc_opt_new();

  _objc_release_x1();
}

void sub_100020E50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100021020(uint64_t a1, void *a2, void *a3)
{
  id v28 = a2;
  id v29 = a3;
  id v5 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v6 = +[_CDContextQueries keyPathForPluginStatus];
  double v7 = [v5 objectForKeyedSubscript:v6];
  id v8 = [v7 BOOLValue];

  uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = v9;
    __int16 v11 = +[NSNumber numberWithBool:v8];
    *(_DWORD *)buf = 138412290;
    id v43 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Plugin status is now %@", buf, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 56) reportChargingStatus:v8];
  if (v8)
  {
    id obj = [*(id *)(a1 + 32) startedDASActivities];
    objc_sync_enter(obj);
    __int16 v12 = [*(id *)(a1 + 32) startedDASActivities];
    id v13 = [v12 mutableCopy];

    uint64_t v14 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Plugged in! Stop tracking activities %@", buf, 0xCu);
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v15 = v13;
    id v16 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v37;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v37 != v17) {
            objc_enumerationMutation(v15);
          }
          [*(id *)(a1 + 32) stopTrackingActivity:*(void *)(*((void *)&v36 + 1) + 8 * i)];
        }
        id v16 = [v15 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v16);
    }

    objc_sync_exit(obj);
    id obja = [*(id *)(a1 + 32) startedActivities];
    objc_sync_enter(obja);
    long long v19 = *(id *)(*(void *)(a1 + 32) + 16);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      long long v20 = [*(id *)(a1 + 32) startedActivities];
      *(_DWORD *)buf = 138412290;
      id v43 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Plugged in! Stop tracking activity names %@", buf, 0xCu);
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v21 = [*(id *)(a1 + 32) startedActivities];
    id v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v33;
      do
      {
        for (j = 0; j != v22; j = (char *)j + 1)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v21);
          }
          uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * (void)j);
          long long v26 = +[NSMutableDictionary dictionary];
          [v26 setObject:&__kCFBooleanTrue forKeyedSubscript:@"selfBudgeted"];
          [*(id *)(*(void *)(a1 + 32) + 56) reportStopEvent:v25 withInfo:v26];
        }
        id v22 = [v21 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v22);
    }

    long long v27 = [*(id *)(a1 + 32) startedActivities];
    [v27 removeAllObjects];

    objc_sync_exit(obja);
  }
}

void sub_100021430(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
}

void sub_100021DD8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002209C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_100022774(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002292C(id a1)
{
  qword_1001C3B08 = objc_alloc_init(_DASPolicyDataCollection);

  _objc_release_x1();
}

id sub_100022C34(uint64_t a1)
{
  [*(id *)(a1 + 32) evaluateAndReportBlockingReasonsForAllCriteria];
  [*(id *)(a1 + 32) reportPolicyBlockingReasonsForIntensiveTasksToPPS];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 reportPolicyBlockingReasonsForSpecificTasksToPPS];
}

id sub_10002367C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dictForCAWithBitmap:*(void *)(a1 + 56) policyName:*(void *)(a1 + 40) priority:*(void *)(a1 + 48)];
}

id sub_10002368C(uint64_t a1)
{
  return [*(id *)(a1 + 32) dictForCAWithBitmap:*(void *)(a1 + 48) policyName:*(void *)(a1 + 40) priority:0];
}

id sub_1000236A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) dictForCAWithBitmap:*(void *)(a1 + 48) policyName:0 priority:*(void *)(a1 + 40)];
}

id sub_1000236B4(uint64_t a1)
{
  return [*(id *)(a1 + 32) dictForCAWithBitmap:*(void *)(a1 + 40) policyName:0 priority:0];
}

uint64_t sub_100024D6C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

void sub_100025514(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100025880()
{
  qword_1001C3B28 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100025C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100025C44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) dailyDataBudgetFromPlan:a2 error:a3];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v4;
  id v5 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v5);
}

void sub_1000261D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 24), OS_LOG_TYPE_DEBUG)) {
    sub_1000F3758();
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v23;
    uint64_t v8 = kUsageNetworkCellInBytes;
    uint64_t v9 = kUsageNetworkCellOutBytes;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v4);
        }
        id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v14 = [v13 objectForKeyedSubscript:v8];
        [v14 doubleValue];
        double v11 = v11 + v15;

        id v16 = [v13 objectForKeyedSubscript:v9];
        [v16 doubleValue];
        double v10 = v10 + v17;
      }
      id v6 = [v4 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }
  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
  }

  long long v18 = +[NSNumber numberWithDouble:v11];
  [*(id *)(a1 + 40) setObject:v18 forKeyedSubscript:_DASUpdateActivityDownloadedOnCellKey];

  long long v19 = +[NSNumber numberWithDouble:v10];
  [*(id *)(a1 + 40) setObject:v19 forKeyedSubscript:_DASUpdateActivityUploadedOnCellKey];

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v20 = *(void *)(a1 + 40);
  uint64_t v21 = [*(id *)(a1 + 32) activityToDataMap];
  [v21 setObject:v20 forKeyedSubscript:*(void *)(a1 + 48)];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
}

void sub_100026A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100026A50(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 24), OS_LOG_TYPE_DEBUG)) {
    sub_1000F3874();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v29;
    uint64_t v8 = kUsageNetworkCellInBytes;
    uint64_t v9 = kUsageNetworkCellOutBytes;
    double v10 = 0.0;
    double v11 = 0.0;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(v4);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v14 = [v13 objectForKeyedSubscript:v8];
        [v14 doubleValue];
        double v11 = v11 + v15;

        id v16 = [v13 objectForKeyedSubscript:v9];
        [v16 doubleValue];
        double v10 = v10 + v17;
      }
      id v6 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }
  else
  {
    double v10 = 0.0;
    double v11 = 0.0;
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  long long v18 = [*(id *)(a1 + 32) activityToDataMap];
  long long v19 = [v18 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v20 = [*(id *)(a1 + 32) activityToDataMap];
  [v20 removeObjectForKey:*(void *)(a1 + 40)];

  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  uint64_t v21 = [v19 objectForKeyedSubscript:_DASUpdateActivityDownloadedOnCellKey];
  [v21 doubleValue];
  double v23 = v11 - v22;

  long long v24 = [v19 objectForKeyedSubscript:_DASUpdateActivityUploadedOnCellKey];
  [v24 doubleValue];
  double v26 = v10 - v25;

  [*(id *)(a1 + 32) getDataConsumedFromBytesOnCell:v23 + v26 bytesOnCellExpensive:0.0 bytesOnCellInexpensive:0.0 bytesOnWiFiExpensive:0.0];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v27;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_10002751C(id a1)
{
  qword_1001C3B40 = (uint64_t)os_log_create("com.apple.duetactivityscheduler", "budgetShMem");

  _objc_release_x1();
}

void sub_100027668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027680(uint64_t a1)
{
  int v2 = shm_open((const char *)[@"com.apple.dasd.budgets" UTF8String], 2, 384);
  if (v2 != -1) {
    goto LABEL_2;
  }
  id v3 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Creating shared memory for budgeting (likely after reboot)", buf, 2u);
  }
  int v4 = shm_open((const char *)[@"com.apple.dasd.budgets" UTF8String], 514, 384);
  if (v4 == -1)
  {
    uint64_t v7 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000F395C(v7);
    }
  }
  else
  {
    int v2 = v4;
    if (ftruncate(v4, 0x4000) != -1)
    {
LABEL_2:
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = mmap(0, 0x4000uLL, 3, 1, v2, 0);
      close(v2);
      if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == -1)
      {
        id v6 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          sub_1000F3A74(v6);
        }
      }
      else
      {
        qword_1001C3B48 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      }
      return;
    }
    close(v2);
    id v5 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000F39E8(v5);
    }
  }
}

uint64_t sub_1000279D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000279E4(uint64_t a1)
{
}

uint64_t sub_1000279EC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = objc_alloc_init(*(Class *)(a1 + 40));

  return _objc_release_x1();
}

void sub_100027B60(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) budgetToIndex];
  id v3 = [*(id *)(a1 + 40) name];
  id v14 = [v2 objectForKeyedSubscript:v3];

  int v4 = v14;
  if (v14)
  {
    unsigned __int8 v5 = [v14 unsignedIntValue];
    [*(id *)(a1 + 40) capacity];
    uint64_t v6 = v5;
    *(void *)(qword_1001C3B48 + ((unint64_t)v5 << 6) + 40) = v7;
    [*(id *)(a1 + 40) balance];
    *(void *)(qword_1001C3B48 + ((unint64_t)v5 << 6) + 48) = v8;
    unsigned __int8 v9 = [*(id *)(a1 + 40) allocationType];
    *(unsigned char *)(qword_1001C3B48 + ((unint64_t)v5 << 6) + 56) = v9;
    double v10 = [*(id *)(a1 + 40) lastModulatedDate];

    if (v10)
    {
      double v11 = [*(id *)(a1 + 40) lastModulatedDate];
      [v11 timeIntervalSinceReferenceDate];
      double v13 = v12;
    }
    else
    {
      double v13 = -1.0;
    }
    *(double *)(qword_1001C3B48 + (v6 << 6) + 64) = v13;
    int v4 = v14;
  }
}

void sub_100027D20(uint64_t a1)
{
  int v2 = malloc_type_malloc(0x810uLL, 0x1000040E865D2FFuLL);
  bzero(v2, 0x810uLL);
  id v3 = +[_DASSharedMemoryBudgetPersistence log];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = *(id *)(a1 + 32);
  unsigned __int8 v4 = 0;
  id v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v5)
  {
    uint64_t v24 = *(void *)v26;
    *(void *)&long long v6 = 138412290;
    long long v22 = v6;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v26 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v22;
          long long v30 = v8;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Saving budget: %@", buf, 0xCu);
        }
        [v8 name:v22];
        id v9 = objc_claimAutoreleasedReturnValue();
        [v9 UTF8String];
        __strcpy_chk();

        [v8 capacity];
        double v10 = &v2[64 * (unint64_t)v4];
        *((void *)v10 + 5) = v11;
        [v8 balance];
        *((void *)v10 + 6) = v12;
        v10[56] = [v8 allocationType];
        double v13 = [v8 lastModulatedDate];

        if (v13)
        {
          id v14 = [v8 lastModulatedDate];
          [v14 timeIntervalSinceReferenceDate];
          double v16 = v15;
        }
        else
        {
          double v16 = -1.0;
        }
        *(double *)&v2[64 * (unint64_t)v4 + 64] = v16;
        double v17 = [*(id *)(a1 + 40) budgetToIndex];
        objc_sync_enter(v17);
        long long v18 = +[NSNumber numberWithUnsignedChar:v4];
        long long v19 = [*(id *)(a1 + 40) budgetToIndex];
        uint64_t v20 = [v8 name];
        [v19 setObject:v18 forKeyedSubscript:v20];

        objc_sync_exit(v17);
        ++v4;
      }
      id v5 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }
    while (v5);
  }

  unsigned char *v2 = v4;
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = *v2;
    *(_DWORD *)buf = 67109120;
    LODWORD(v30) = v21;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Num Budgets: %u", buf, 8u);
  }
  memcpy((void *)qword_1001C3B48, v2, 0x810uLL);
  free(v2);
}

void sub_100028040(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000282C0(uint64_t a1)
{
  int v2 = malloc_type_malloc(0x810uLL, 0x1000040E865D2FFuLL);
  memcpy(v2, (const void *)qword_1001C3B48, 0x810uLL);
  id v3 = (id *)(a1 + 32);
  *(void *)(*(void *)(a1 + 32) + 8) = v2;
  uint64_t v28 = a1;
  id v5 = *(void **)(a1 + 40);
  unsigned __int8 v4 = (id *)(a1 + 40);
  if ([v5 count] == (id)**((unsigned __int8 **)*v3 + 1))
  {
    long long v29 = +[NSMutableArray array];
    long long v6 = *v3;
    if (**((unsigned char **)*v3 + 1))
    {
      unint64_t v7 = 0;
      uint64_t v8 = 8;
      while (1)
      {
        long long v31 = 0u;
        long long v32 = 0u;
        memset(buf, 0, sizeof(buf));
        id v9 = (long long *)(v6[1] + v8);
        long long v10 = *v9;
        long long v11 = v9[1];
        long long v12 = v9[3];
        long long v31 = v9[2];
        long long v32 = v12;
        *(_OWORD *)buf = v10;
        *(_OWORD *)&uint8_t buf[16] = v11;
        double v13 = [v6 validatedStringFromStoredValue:buf withAllowedNames:*v4];
        if (!v13) {
          break;
        }
        if (*((double *)&v32 + 1) == 0.0 || *((double *)&v32 + 1) == -1.0)
        {
          double v15 = 0;
        }
        else
        {
          double v15 = +[NSDate dateWithTimeIntervalSinceReferenceDate:*((double *)&v32 + 1)];
        }
        double v16 = +[_DASBudget budgetWithName:capacity:balance:allocationType:lastModulatedDate:](_DASBudget, "budgetWithName:capacity:balance:allocationType:lastModulatedDate:", v13, v32, v15, v31);
        [v29 addObject:v16];
        double v17 = [*v3 budgetToIndex];
        objc_sync_enter(v17);
        long long v18 = +[NSNumber numberWithInt:v7];
        long long v19 = [*v3 budgetToIndex];
        [v19 setObject:v18 forKeyedSubscript:v13];

        objc_sync_exit(v17);
        ++v7;
        long long v6 = *v3;
        v8 += 64;
        if (v7 >= **((unsigned __int8 **)*v3 + 1)) {
          goto LABEL_12;
        }
      }
      long long v27 = +[_DASSharedMemoryBudgetPersistence log];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000F3B00(v27);
      }
    }
    else
    {
LABEL_12:
      uint64_t v20 = +[_DASSharedMemoryBudgetPersistence log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = **((unsigned __int8 **)*v3 + 1);
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v21;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v29;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Stored Budgets: %u %@", buf, 0x12u);
      }

      id v22 = [v29 copy];
      uint64_t v23 = *(void *)(*(void *)(v28 + 48) + 8);
      uint64_t v24 = *(void **)(v23 + 40);
      *(void *)(v23 + 40) = v22;
    }
    long long v26 = v29;
  }
  else
  {
    long long v25 = +[_DASSharedMemoryBudgetPersistence log];
    long long v26 = v25;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      sub_1000F3B44((uint64_t)v3, v4, v25);
      long long v26 = v25;
    }
  }
}

void sub_1000285E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002869C(uint64_t a1)
{
  [*(id *)(a1 + 32) timeIntervalSinceReferenceDate];
  *(void *)(qword_1001C3B48 + 2056) = v2;
  id v3 = +[_DASSharedMemoryBudgetPersistence log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(qword_1001C3B48 + 2056);
    int v6 = 138412546;
    uint64_t v7 = v4;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Setting modulation date: %@ (%lf)", (uint8_t *)&v6, 0x16u);
  }
}

void sub_1000288E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double sub_100028908(uint64_t a1)
{
  double result = *(double *)(qword_1001C3B48 + 2056);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_100028944(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100028A04(uint64_t a1)
{
  qword_1001C3B60 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

uint64_t sub_100028E40(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100028E50(uint64_t a1)
{
}

void sub_100028E58(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 40);
  uint64_t v2 = +[_CDContextualKeyPath keyPathWithKey:kDASWidgetRefreshMaximumBudgetDailyKey];
  id v3 = [v1 objectForKeyedSubscript:v2];

  if (v3)
  {
    uint64_t v4 = [v3 objectForKeyedSubscript:kDASDailyBudgetForAllWidgetsKey];
    uint64_t v5 = (uint64_t)[v4 intValue];

    int v6 = [v3 objectForKeyedSubscript:kDASDailyBudgetMaxForSystemAddedIndividualWidgetKey];
    unsigned int v7 = [v6 intValue];

    __int16 v8 = [v3 objectForKeyedSubscript:kDASDailyBudgetMaxForIndividualWidgetKey];
    unsigned int v9 = [v8 intValue];

    if (v5) {
      goto LABEL_6;
    }
  }
  else
  {
    unsigned int v7 = 0;
    unsigned int v9 = 0;
  }
  uint64_t v5 = 750;
LABEL_6:
  long long v42 = v3;
  if (v9) {
    unsigned int v10 = v9;
  }
  else {
    unsigned int v10 = 50;
  }
  if (v7) {
    unsigned int v11 = v7;
  }
  else {
    unsigned int v11 = 50;
  }
  *(_DWORD *)(*(void *)(a1 + 32) + 12) = v10;
  *(_DWORD *)(*(void *)(a1 + 32) + 8) = v5;
  long long v41 = +[_DKKnowledgeStore knowledgeStore];
  long long v12 = [*(id *)(a1 + 32) getAverageWidgetViewsPerDayWithStore:];
  long long v40 = +[_CDContextualKeyPath keyPathWithKey:kDASWidgetSystemAddedKeyPath];
  double v13 = [[*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:];
  id v44 = objc_alloc_init((Class)NSMutableDictionary);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v12;
  id v14 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v51;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v51 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v50 + 1) + 8 * i);
        if ([v13 containsObject:v18]) {
          uint64_t v19 = v11;
        }
        else {
          uint64_t v19 = v10;
        }
        uint64_t v20 = +[NSNumber numberWithInt:v19];
        [v44 setObject:v20 forKeyedSubscript:v18];
      }
      id v15 = [obj countByEnumeratingWithState:&v50 objects:v61 count:16];
    }
    while (v15);
  }
  long long v39 = v13;

  int v21 = [*(id *)(a1 + 32) allocatedBudgetsWithAverageViews:obj groupTotalBudget:v5 individualMaxBudgets:v44 individualMinBudget:6];
  id v22 = [v21 mutableCopy];
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = v22;

  uint64_t v25 = a1;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v26 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) allKeys];
  id v27 = [v26 countByEnumeratingWithState:&v46 objects:v60 count:16];
  if (v27)
  {
    id v28 = v27;
    uint64_t v29 = *(void *)v47;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(void *)v47 != v29) {
          objc_enumerationMutation(v26);
        }
        long long v31 = *(NSObject **)(*(void *)(v25 + 32) + 48);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = *(void *)(*((void *)&v46 + 1) + 8 * (void)j);
          long long v33 = v31;
          long long v34 = [obj objectForKeyedSubscript:v32, v39];
          long long v35 = [*(id *)(*(void *)(*(void *)(v25 + 40) + 8) + 40) objectForKeyedSubscript:v32];
          *(_DWORD *)buf = 138412802;
          uint64_t v55 = v32;
          __int16 v56 = 2112;
          v57 = v34;
          __int16 v58 = 2112;
          v59 = v35;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "For widget %@, averageViewsPerDay: %@ and computedBudget: %@", buf, 0x20u);

          uint64_t v25 = a1;
        }
      }
      id v28 = [v26 countByEnumeratingWithState:&v46 objects:v60 count:16];
    }
    while (v28);
  }

  uint64_t v36 = +[NSDate now];
  uint64_t v37 = *(void *)(v25 + 32);
  long long v38 = *(void **)(v37 + 32);
  *(void *)(v37 + 32) = v36;
}

uint64_t sub_10002934C(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = +[NSDate distantPast];

  return _objc_release_x1();
}

uint64_t sub_10002940C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  *(void *)(*(void *)(a1 + 32) + 32) = +[NSDate distantPast];

  return _objc_release_x1();
}

void sub_10002A264(id a1)
{
  qword_1001C3B80 = [[_DASTrialManager alloc] initWithNamespaceName:@"COREOS_DAS"];

  _objc_release_x1();
}

void sub_10002A6E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002A708(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(&to);

  if (v4)
  {
    id v5 = objc_loadWeakRetained(&to);
    [v5 updateFactors];

    id v6 = objc_loadWeakRetained(&to);
    [v6 updateKernelWithDASIdentifiers];
  }
  objc_destroyWeak(&to);
}

void sub_10002A78C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

id sub_10002A7A0(uint64_t a1)
{
  [*(id *)(a1 + 32) updateFactors];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 updateKernelWithDASIdentifiers];
}

id sub_10002ABD8(uint64_t a1)
{
  return [*(id *)(a1 + 32) dasTrialManager:hasUpdatedParametersForNamespace:];
}

void sub_10002B538(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    uint64_t v2 = [WeakRetained readFromDefaults];
    [v3 sendToPowerLog:v2];

    id WeakRetained = v3;
  }
}

void sub_10002C2D8(uint64_t a1)
{
  if (notify_register_check((const char *)[@"com.apple.das.clas.startDutyCycling" UTF8String], (int *)(*(void *)(a1 + 32) + 20))&& os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 56), OS_LOG_TYPE_ERROR))
  {
    sub_1000F3DF0();
  }
  if (notify_register_check((const char *)[@"com.apple.das.clas.dutyCyclingMicroSeconds" UTF8String], (int *)(*(void *)(a1 + 32) + 24)))
  {
    if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 56), OS_LOG_TYPE_ERROR)) {
      sub_1000F3D7C();
    }
  }
}

uint64_t sub_10002C574(uint64_t a1)
{
  unsigned int v2 = +[_DASDeviceActivityPolicy isDeviceInUse:*(void *)(*(void *)(a1 + 32) + 104)];
  if ([*(id *)(a1 + 32) dutyCyclingInitiated])
  {
    if ([*(id *)(a1 + 32) dutyCyclingMethod] == (id)1) {
      unsigned int v3 = v2;
    }
    else {
      unsigned int v3 = 0;
    }
    if (v3 == 1)
    {
      [*(id *)(a1 + 32) resetSFIEffort];
      [*(id *)(a1 + 32) setDutyCyclingInitiated:0];
    }
  }
  return 1;
}

uint64_t sub_10002C5E8(uint64_t a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 104);
  unsigned int v3 = +[_CDContextQueries keyPathForPluginStatus];
  id v4 = [v2 objectForKeyedSubscript:v3];
  unsigned __int8 v5 = [v4 BOOLValue];

  id v6 = *(void **)(a1 + 32);
  if (v5)
  {
    unsigned int v7 = (void *)v6[13];
    __int16 v8 = +[_CDContextQueries keyPathForPluginStatus];
    unsigned int v9 = [v7 lastModifiedDateForContextualKeyPath:v8];

    [v9 timeIntervalSinceNow];
    if (v10 > -10.0) {
      [*(id *)(a1 + 32) resetState];
    }
  }
  else
  {
    [v6 resetState];
    [*(id *)(a1 + 32) recordSessionAnalytics];
    [*(id *)(a1 + 32) resetAnalyticsState];
  }
  return 1;
}

id sub_10002CDC8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10002D838(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_10002DC9C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_10002DE54(uint64_t a1, void *a2)
{
  id v6 = a2;
  unsigned int v3 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:];

  if (v3)
  {
    id v4 = *(void **)(a1 + 40);
    unsigned __int8 v5 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v6];
    [v4 addObject:v5];
  }
}

id sub_10002E218(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 64) scheduleOnBehalfOf:@"com.apple.das.monitor.batteryTemperature" between:0 and:(double)*(unint64_t *)(*(void *)(a1 + 32) + 72) waking:(double)*(unint64_t *)(*(void *)(a1 + 32) + 72)];
}

uint64_t sub_10002E2BC(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 0;
  *(void *)(*(void *)(result + 32) + 16) = 0;
  return result;
}

uint64_t sub_10002E3C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002E3D0(uint64_t a1)
{
}

uint64_t sub_10002E3D8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 96) copy];

  return _objc_release_x1();
}

uint64_t sub_10002E618()
{
  qword_1001C3B90 = objc_opt_new();

  return _objc_release_x1();
}

void sub_10002E93C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002EA48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002EB3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10002ECB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10002F054(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 9) = 1;
  return [*(id *)(*(void *)(a1 + 32) + 64) scheduleOnBehalfOf:@"com.apple.das.monitor.chargeRate" between:0 and:(double)*(unint64_t *)(*(void *)(a1 + 32) + 72) waking:(double)*(unint64_t *)(*(void *)(a1 + 32) + 72)];
}

uint64_t sub_10002F0F8(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 9) = 0;
  *(void *)(*(void *)(result + 32) + 16) = 0;
  return result;
}

uint64_t sub_10002F1FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002F20C(uint64_t a1)
{
}

uint64_t sub_10002F214(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 96) copy];

  return _objc_release_x1();
}

void sub_10002F78C(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 48) count]) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = [*(id *)(a1 + 40) count] != 0;
  }
  [*(id *)(*(void *)(a1 + 32) + 48) addObjectsFromArray:*(void *)(a1 + 40)];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 48) count];
  uint64_t v4 = *(void *)(a1 + 32);
  if ((unint64_t)v3 >= *(void *)(v4 + 16))
  {
    [(id)v4 unprotectedExecuteWorkItems];
  }
  else if (v2)
  {
    unsigned __int8 v5 = *(NSObject **)(v4 + 56);
    dispatch_time_t v6 = dispatch_time(0, (uint64_t)(*(double *)(v4 + 8) * 1000000000.0));
    dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(*(double *)(*(void *)(a1 + 32) + 8) / 10.0 * 1000000000.0));
    unsigned int v7 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    dispatch_resume(v7);
  }
}

void sub_10002F9D8(id a1)
{
  qword_1001C3BA8 = objc_alloc_init(_DASResultDependencyPolicy);

  _objc_release_x1();
}

void sub_10002FDC0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  id v2 = [*(id *)(a1 + 32) launchLikelihoodPredictionForApp:*(void *)(a1 + 40)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_10002FEC4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) pluginLikelihood];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_10002FFC0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) deviceActivityLikelihood];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void sub_100030878(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100030894(uint64_t a1)
{
  return [*(id *)(a1 + 32) locked_reinstantiateConfiguredBudgets];
}

void sub_10003089C(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    id v4 = a2;
    id v5 = +[_DASDataProtectionStateMonitor dataProtectionClassC];

    if (v5 == v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      unsigned int v7 = [WeakRetained log];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Class C protected data now available, re-instantiating configured budgets", buf, 2u);
      }

      __int16 v8 = [WeakRetained queue];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000309EC;
      block[3] = &unk_1001754F8;
      id v12 = WeakRetained;
      id v9 = WeakRetained;
      dispatch_sync(v8, block);

      double v10 = [v9 lockStateMonitor];
      [v10 setChangeHandler:0];
    }
  }
}

void sub_1000309EC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 managedBudgets];
  [v2 locked_instantiateBudgetsInto:v3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [*(id *)(a1 + 32) widgetBudgetModulator];
  [v4 locked_addBudgetsToBeModulated:v5];
}

void sub_100030A7C(uint64_t a1)
{
  [*(id *)(a1 + 32) locked_instantiateBudgetsInto:*(void *)(*(void *)(a1 + 32) + 24) withRemovals:0];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 32) locked_addBudgetsToBeModulated:v2];
}

uint64_t sub_100030B80()
{
  objc_opt_class();
  qword_1001C3BB8 = objc_opt_new();

  return _objc_release_x1();
}

void sub_100030D28(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedBudgets];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100030DC8;
  v3[3] = &unk_100175AE0;
  id v4 = *(id *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_100030DC8(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = *(void **)(a1 + 32);
  v11[0] = @"name";
  id v4 = a3;
  id v5 = [v4 name];
  v12[0] = v5;
  v11[1] = @"balance";
  [v4 balance];
  dispatch_time_t v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v12[1] = v6;
  v11[2] = @"capacity";
  [v4 capacity];
  double v8 = v7;

  id v9 = +[NSNumber numberWithDouble:v8];
  v12[2] = v9;
  double v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v3 addObject:v10];
}

id sub_100030F70(uint64_t a1)
{
  return [*(id *)(a1 + 32) locked_reinstantiateConfiguredBudgets];
}

void sub_100031E78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000F4644((uint64_t)v5, (uint64_t)v6, v7);
  }
}

void sub_100031EE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000F46CC((uint64_t)v3, v4);
  }
}

void sub_100031FB0(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Resetting budgets.", v7, 2u);
  }
  [*(id *)(*(void *)(a1 + 32) + 48) flushComputedBudgetCache];
  id v3 = [*(id *)(a1 + 32) locked_instantiateBudgetsInto:*(void *)(*(void *)(a1 + 32) + 24) withRemovals:0];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 32);
  id v6 = [*(id *)(v4 + 24) allValues];
  [v5 locked_replaceBudgetsToBeModulated:v6];
}

void sub_1000322AC(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) managedBudgets];
  id v2 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v2 balance];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

void sub_1000323F0(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) managedBudgets];
  id v2 = [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v2 capacity];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v3;
}

void sub_100032534(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedBudgets];
  uint64_t v3 = +[_DASWidgetRefreshBudgetManager budgetNameFromWidgetBudgetID:*(void *)(a1 + 40)];
  id v6 = [v2 objectForKeyedSubscript:v3];

  id v4 = v6;
  if (v6)
  {
    [v6 balance];
    id v4 = v6;
  }
  else
  {
    unint64_t v5 = 0xFFF0000000000000;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;
}

void sub_10003268C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedBudgets];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    [v3 setBalance:*(double *)(a1 + 48)];
    [*(id *)(a1 + 32) updateBudget:v3];
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      unint64_t v5 = v4;
      [v3 balance];
      uint64_t v6 = *(void *)(a1 + 40);
      int v11 = 134218242;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Set Balance: %.2lf for %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    double v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v11 = 134218242;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Failed to set Balance: %.2lf for %{public}@ ; budget not found",
        (uint8_t *)&v11,
        0x16u);
    }
  }
}

void sub_1000328A4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedBudgets];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    [v3 decrementBy:*(double *)(a1 + 48)];
    [*(id *)(a1 + 32) updateBudget:v3];
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v7 = v4;
      [v3 balance];
      int v12 = 134218498;
      uint64_t v13 = v5;
      __int16 v14 = 2114;
      uint64_t v15 = v6;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Decrement budget by: %.2lf for %{public}@, new balance: %.2lf", (uint8_t *)&v12, 0x20u);
    }
  }
  else
  {
    uint64_t v9 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      int v12 = 134218242;
      uint64_t v13 = v10;
      __int16 v14 = 2114;
      uint64_t v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Failed to decrement budget by: %.2lf for %{public}@ ; budget not found",
        (uint8_t *)&v12,
        0x16u);
    }
  }
}

void sub_100032AD0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) managedBudgets];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3)
  {
    [v3 setCapacity:*(double *)(a1 + 48)];
    [*(id *)(a1 + 32) updateBudget:v3];
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = v4;
      [v3 capacity];
      uint64_t v6 = *(void *)(a1 + 40);
      int v11 = 134218242;
      uint64_t v12 = v7;
      __int16 v13 = 2114;
      uint64_t v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Set capacity of budget to: %.2lf for %{public}@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      int v11 = 134218242;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Failed to set capacity of budget to: %.2lf for %{public}@ ; budget not found",
        (uint8_t *)&v11,
        0x16u);
    }
  }
}

id sub_100032E20(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) startTrackingActivity:*(void *)(a1 + 40)];
}

void sub_100032F58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10003336C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100033390(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained handleDataProtectionChangeFor:v5 willBeAvailable:a3];
}

void sub_1000334F8(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000335B0;
  v6[3] = &unk_100175548;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = v4;
  id v5 = v2;
  [v5 performWithOptions:4 andBlock:v6];
}

id sub_1000335B0(uint64_t a1)
{
  [*(id *)(a1 + 32) reset];
  [*(id *)(*(void *)(a1 + 40) + 56) removeObjectForKey:*(void *)(a1 + 48)];
  id v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 invalidatePersistentStoreCoordinatorFor:v3];
}

void sub_100033690(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = [v2 persistentStores];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 removePersistentStore:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8) error:0];
          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }

    [*(id *)(*(void *)(a1 + 32) + 64) removeObjectForKey:*(void *)(a1 + 40)];
  }
}

void sub_100033ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100033B00(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100033B10(uint64_t a1)
{
}

void sub_100033B18(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (*(unsigned char *)(a1 + 64))
  {
    if (!v5)
    {
      id v6 = objc_opt_class();
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 16);
      id v34 = 0;
      unsigned __int8 v8 = [v6 createDatabaseDirectory:v7 error:&v34];
      id v9 = v34;
      id v10 = v9;
      if ((v8 & 1) != 0 || [v9 code] == (id)516)
      {
        uint64_t v11 = [*(id *)(a1 + 32) managedObjectModel];
        if (v11)
        {
          long long v12 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
          __int16 v13 = +[NSURL fileURLWithPath:v12];

          uint64_t v14 = [(id)objc_opt_class() persistentStoreOptionsFor:*(void *)(a1 + 40) readOnly:*(unsigned __int8 *)(*(void *)(a1 + 32) + 8)];
          id v33 = v10;
          uint64_t v15 = +[NSPersistentStoreCoordinator metadataForPersistentStoreOfType:NSSQLiteStoreType URL:v13 options:v14 error:&v33];
          id v16 = v33;

          unsigned __int8 v17 = [v11 isConfiguration:0 compatibleWithStoreMetadata:v15];
          id v18 = [objc_alloc((Class)NSPersistentStoreCoordinator) initWithManagedObjectModel:v11];
          uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
          uint64_t v20 = *(void **)(v19 + 40);
          *(void *)(v19 + 40) = v18;

          if ((v17 & 1) == 0)
          {
            int v21 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
            id v32 = v16;
            [v21 destroyPersistentStoreAtURL:v13 withType:NSSQLiteStoreType options:v14 error:&v32];
            id v22 = v32;

            id v16 = v22;
          }
          uint64_t v23 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          id v31 = v16;
          uint64_t v24 = [v23 addPersistentStoreWithType:NSSQLiteStoreType configuration:0 URL:v13 options:v14 error:&v31];
          id v10 = v31;

          if (!v24)
          {
            NSLog(@"Failed to add persistent store: %@", v10);
            [*(id *)(a1 + 32) handleDatabaseErrors:v10 forPSC:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) protectionClass:*(void *)(a1 + 40)];
            uint64_t v25 = *(void *)(*(void *)(a1 + 48) + 8);
            long long v26 = *(void **)(v25 + 40);
            *(void *)(v25 + 40) = 0;
          }
          uint64_t v27 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          if (v27) {
            [*(id *)(*(void *)(a1 + 32) + 64) setObject:v27 forKeyedSubscript:*(void *)(a1 + 40)];
          }
        }
        else
        {
          NSLog(@"Failed to load Managed Object Model from %@", *(void *)(*(void *)(a1 + 32) + 32));
        }
      }
      else
      {
        NSLog(@"%@ : did not exist and could not be created: %@", *(void *)(*(void *)(a1 + 32) + 16), v10);
        uint64_t v30 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v11 = *(void **)(v30 + 40);
        *(void *)(v30 + 40) = 0;
      }
    }
  }
  else if (v5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v29 = *(void **)(v28 + 40);
    *(void *)(v28 + 40) = 0;
  }
}

void sub_100033FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100033FF4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (*(unsigned char *)(a1 + 64))
  {
    if (v5) {
      return;
    }
    id v6 = [*(id *)(a1 + 32) persistentStoreCoordinatorFor:*(void *)(a1 + 40)];
    if (v6)
    {
      uint64_t v11 = v6;
      id v7 = [objc_alloc((Class)NSManagedObjectContext) initWithConcurrencyType:1];
      uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
      id v9 = *(void **)(v8 + 40);
      *(void *)(v8 + 40) = v7;

      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setPersistentStoreCoordinator:v11];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setUndoManager:0];
      [*(id *)(*(void *)(a1 + 32) + 56) setObject:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 40)];
      id v6 = v11;
    }
  }
  else
  {
    if (!v5) {
      return;
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v6 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = 0;
  }
}

void sub_1000343EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100034404(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidateManagedObjectContextFor:*(void *)(a1 + 40)];
  id result = [*(id *)(a1 + 32) deleteDatabaseForPSC:*(void *)(a1 + 48) protectionClass:*(void *)(a1 + 40) obliterate:*(unsigned __int8 *)(a1 + 64)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_100034C18(id a1)
{
  qword_1001C3BC8 = objc_alloc_init(_APRSMetricRecorder);

  _objc_release_x1();
}

void sub_100034CA8(id a1)
{
  qword_1001C3BD8 = (uint64_t)os_log_create("com.apple.aprs", "appResume.caEvent");

  _objc_release_x1();
}

id sub_1000352E0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) commonAnalytics];
  id v3 = [v2 mutableCopy];

  [v3 addEntriesFromDictionary:*(void *)(a1 + 40)];
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    int v7 = 138412546;
    id v8 = v3;
    __int16 v9 = 2112;
    uint64_t v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reporting %@ for %@", (uint8_t *)&v7, 0x16u);
  }

  return v3;
}

void sub_100035AF0(id a1)
{
  qword_1001C3BE8 = objc_alloc_init(_DASLowPowerModePolicy);

  _objc_release_x1();
}

void sub_100036660(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  id v2 = [v3 createOrUpdateActivity:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) mocSaveAndReset:*(void *)(a1 + 40)];
}

void sub_1000367B0(uint64_t a1)
{
  id v2 = objc_opt_new();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      int v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [v2 createOrUpdateActivity:*(void *)(*((void *)&v9 + 1) + 8 * (void)v7) context:*(void *)(a1 + 40)];
        int v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 48) mocSaveAndReset:*(void *)(a1 + 40)];
}

id sub_1000369E4(uint64_t a1)
{
  [*(id *)(a1 + 32) createMOInMOC:*(void *)(a1 + 40) activity:*(void *)(a1 + 48) group:0 triggers:*(void *)(a1 + 56)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 mocSaveAndReset:v3];
}

void sub_100036BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100036BD4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100036BE4(uint64_t a1)
{
}

id sub_100036BEC(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) count];
  if (v2)
  {
    uint64_t v3 = v2;
    for (i = 0; i != v3; ++i)
    {
      id v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      uint64_t v6 = [v5 groupName];

      if (v6)
      {
        int v7 = *(void **)(a1 + 40);
        id v8 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
        long long v9 = [v8 name];
        uint64_t v10 = [v7 objectForKeyedSubscript:v9];
        uint64_t v11 = *(void *)(*(void *)(a1 + 72) + 8);
        long long v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;
      }
      __int16 v13 = *(void **)(a1 + 48);
      uint64_t v14 = *(void *)(a1 + 56);
      uint64_t v15 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      unsigned __int8 v17 = [*(id *)(a1 + 64) objectAtIndexedSubscript:i];
      [v13 createMOInMOC:v14 activity:v15 group:v16 triggers:v17];
    }
  }
  id v18 = *(void **)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);

  return [v18 mocSaveAndReset:v19];
}

void sub_100036FB4(uint64_t a1)
{
  id v3 = (id)objc_opt_new();
  id v2 = [v3 createOrUpdateGroup:*(void *)(a1 + 32) context:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) mocSaveAndReset:*(void *)(a1 + 40)];
}

id sub_100037128(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  [v2 createMOInMOC:v3 group:v4 activities:v5];

  return [*(id *)(a1 + 32) mocSaveAndReset:*(void *)(a1 + 40)];
}

id sub_1000372EC(uint64_t a1)
{
  id v2 = (char *)[*(id *)(a1 + 32) count];
  if (v2)
  {
    uint64_t v3 = v2;
    for (i = 0; i != v3; ++i)
    {
      uint64_t v6 = *(void **)(a1 + 40);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v7 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
      id v8 = [*(id *)(a1 + 56) objectAtIndexedSubscript:i];
      [v6 createMOInMOC:v5 group:v7 activities:v8];
    }
  }
  long long v9 = *(void **)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 48);

  return [v9 mocSaveAndReset:v10];
}

void sub_1000374D0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchAllActivities:*(void *)(a1 + 40)];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        id v8 = [*(id *)(a1 + 32) getActivityFromManagedObject:v7];
        [*(id *)(a1 + 48) addObject:v8];
        long long v9 = [v7 startDate];

        if (v9) {
          [*(id *)(a1 + 56) addObject:v8];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

id sub_10003775C(uint64_t a1)
{
  [*(id *)(a1 + 32) createMOInMOC:*(void *)(a1 + 40) activity:*(void *)(a1 + 48) group:*(void *)(a1 + 56) triggers:*(void *)(a1 + 64)];
  if (*(unsigned char *)(a1 + 72)) {
    [*(id *)(a1 + 32) updateActivityStarted:*(void *)(a1 + 48)];
  }
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 mocSaveAndReset:v3];
}

void sub_1000379BC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) fetchActivitiesUsingPredicate:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 64);
        id v8 = [*(id *)(a1 + 40) getActivityFromManagedObject:*(void *)(*((void *)&v9 + 1) + 8 * (void)v6)];
        [v7 addObject:v8];

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void sub_100037C18(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchActivitiesUsingPredicate:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 56);
        id v8 = [*(id *)(a1 + 32) getActivityFromManagedObject:*(void *)(*((void *)&v9 + 1) + 8 * (void)v6)];
        [v7 addObject:v8];

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

void sub_100037E48(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fetchAllGroups:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(void **)(a1 + 48);
          long long v9 = [*(id *)(a1 + 32) getGroupFromManagedObject:*(void *)(*((void *)&v10 + 1) + 8 * (void)v7)];
          [v8 addObject:v9];

          uint64_t v7 = (char *)v7 + 1;
        }
        while (v5 != v7);
        id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

id sub_100038080(uint64_t a1)
{
  [*(id *)(a1 + 32) updateActivityStarted:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 48);
  id v2 = *(void **)(a1 + 56);

  return [v2 mocSaveAndReset:v3];
}

id sub_1000381D0(uint64_t a1)
{
  [*(id *)(a1 + 32) updateActivityCompleted:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 48);
  id v2 = *(void **)(a1 + 56);

  return [v2 mocSaveAndReset:v3];
}

id sub_100038320(uint64_t a1)
{
  [*(id *)(a1 + 32) updateActivityCanceled:*(void *)(a1 + 40) context:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 48);
  id v2 = *(void **)(a1 + 56);

  return [v2 mocSaveAndReset:v3];
}

id sub_10003850C(uint64_t a1)
{
  [*(id *)(a1 + 40) deleteActivity:*(void *)(a1 + 48) context:*(void *)(a1 + 56)];
  uint64_t v3 = *(void *)(a1 + 56);
  id v2 = *(void **)(a1 + 64);

  return [v2 mocSaveAndReset:v3];
}

id sub_10003867C(uint64_t a1)
{
  [*(id *)(a1 + 40) deleteOldActivities:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 48);
  id v2 = *(void **)(a1 + 56);

  return [v2 mocSaveAndReset:v3];
}

id sub_1000387EC(uint64_t a1)
{
  [*(id *)(a1 + 40) deleteActivitiesIfRequired:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(a1 + 48);
  id v2 = *(void **)(a1 + 56);

  return [v2 mocSaveAndReset:v3];
}

void sub_100038BAC(uint64_t a1)
{
  uint64_t state64 = 0;
  notify_get_state(*(_DWORD *)(*(void *)(a1 + 32) + 12), &state64);
  uint64_t v2 = arc4random_uniform(0x1ABu);
  if (state64 == 2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = 2;
    goto LABEL_5;
  }
  if (state64 == 1)
  {
    [*(id *)(a1 + 32) logPrewarm:@"com.apple.mobilemail" pid:v2];
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = 1;
LABEL_5:
    [v3 logDock:@"com.apple.mobilemail" pid:v4 state:v5];
    return;
  }
  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Error with notification com.apple.das.logPrewarmDock (Wrong state)", v7, 2u);
  }
}

uint64_t sub_100038D38()
{
  qword_1001C3BF0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

int64_t sub_100038E88(id a1, NSNumber *a2, NSNumber *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  [(NSNumber *)v4 doubleValue];
  double v7 = v6;
  [(NSNumber *)v5 doubleValue];
  if (v7 <= v8)
  {
    [(NSNumber *)v4 doubleValue];
    double v11 = v10;
    [(NSNumber *)v5 doubleValue];
    int64_t v9 = v11 < v12;
  }
  else
  {
    int64_t v9 = -1;
  }

  return v9;
}

void sub_100039224(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = +[NSMutableDictionary dictionary];
  [v8 setObject:v6 forKeyedSubscript:@"BundleID"];

  [v8 setObject:v5 forKeyedSubscript:@"PredictionScore"];
  double v7 = +[NSNumber numberWithInt:kAPRSPredictionTypeSwap];
  [v8 setObject:v7 forKeyedSubscript:@"PredictionType"];

  [*(id *)(a1 + 32) addObject:v8];
}

void sub_100039300(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v8 = +[NSMutableDictionary dictionary];
  [v8 setObject:v6 forKeyedSubscript:@"BundleID"];

  [v8 setObject:v5 forKeyedSubscript:@"PredictionScore"];
  double v7 = +[NSNumber numberWithInt:kAPRSPredictionTypeProactive];
  [v8 setObject:v7 forKeyedSubscript:@"PredictionType"];

  [*(id *)(a1 + 32) addObject:v8];
}

void sub_1000397C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000397E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000397F8(uint64_t a1)
{
}

id sub_100039800(uint64_t a1)
{
  return *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
}

void sub_1000399D0(id a1, BPSCompletion *a2)
{
  uint64_t v4 = a2;
  if ([(BPSCompletion *)v4 state])
  {
    uint64_t v2 = [(BPSCompletion *)v4 error];
    id v3 = [v2 description];
    printf("Error: %s", (const char *)[v3 UTF8String]);
  }
  else
  {
    printf("Complete");
  }
}

void sub_100039A64(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = [v9 eventBody];
  [v3 absoluteTimestamp];
  double v5 = v4;
  double v6 = *(double *)(a1 + 40);

  if (v5 < v6)
  {
    double v7 = [v9 eventBody];
    id v8 = [v7 bundleID];

    [*(id *)(a1 + 32) addObject:v8];
  }
}

int64_t sub_100039DCC(id a1, NSMutableDictionary *a2, NSMutableDictionary *a3)
{
  double v4 = a3;
  double v5 = [(NSMutableDictionary *)a2 objectForKeyedSubscript:@"PredictionsScore"];
  int v6 = [v5 intValue];
  double v7 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:@"PredictionsScore"];

  LODWORD(v4) = [v7 intValue];
  if (v6 > (int)v4) {
    return -1;
  }
  else {
    return 1;
  }
}

void sub_100039E58(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v7 = [v3 objectForKeyedSubscript:@"BundleID"];
  double v4 = [v3 objectForKeyedSubscript:@"PredictionType"];

  LODWORD(v3) = [v4 intValue];
  int v5 = kAPRSPredictionTypeProactive;

  uint64_t v6 = 40;
  if (v3 == v5) {
    uint64_t v6 = 32;
  }
  [*(id *)(a1 + v6) addObject:v7];
}

BOOL sub_100039F08(id a1, id a2, id a3)
{
  return a2 == a3;
}

BOOL sub_100039F14(id a1, id a2, id a3)
{
  return a2 == a3;
}

void sub_10003A85C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003AAF8(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 logUpdatedCarryStatus];
  [v3 setTaskCompleted];
}

Class sub_10003B5A8(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1001C3C08)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10003B6EC;
    v4[4] = &unk_1001753E0;
    v4[5] = v4;
    long long v5 = off_100175E88;
    uint64_t v6 = 0;
    qword_1001C3C08 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1001C3C08)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("ATXProactiveSuggestionClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_1000F3208();
LABEL_8:
    free(v2);
  }
  qword_1001C3C00 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10003B6EC()
{
  uint64_t result = _sl_dlopen();
  qword_1001C3C08 = result;
  return result;
}

id sub_10003B898(uint64_t a1)
{
  return [*(id *)(a1 + 32) consoleModeNotificationHandler];
}

uint64_t sub_10003B940(uint64_t a1)
{
  qword_1001C3C18 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

uint64_t sub_10003BF38()
{
  qword_1001C3C20 = objc_opt_new();

  return _objc_release_x1();
}

void sub_10003C238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003C254(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained handleKeyBagLockNotification];
}

void sub_10003C5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t sub_10003C608(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10003C618(uint64_t a1)
{
}

uint64_t sub_10003C620(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  double v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  long long v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) isDataAvailableForClassA]);
  uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 32);
  id v7 = +[_DASDataProtectionStateMonitor dataProtectionClassA];
  [v6 setObject:v5 forKeyedSubscript:v7];

  id v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 32) isDataAvailableForClassC]);
  id v9 = *(void **)(*(void *)(a1 + 32) + 32);
  double v10 = +[_DASDataProtectionStateMonitor dataProtectionClassC];
  [v9 setObject:v8 forKeyedSubscript:v10];

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 24) allValues];

  return _objc_release_x1();
}

void sub_10003C748(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
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
        uint64_t v7 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v8 = [[*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) objectForKeyedSubscript:v7, v13];
        unsigned int v9 = [v8 BOOLValue];

        double v10 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v7];
        id v11 = [v10 BOOLValue];

        if (v9 != v11)
        {
          double v12 = +[NSNumber numberWithBool:v11];
          [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:v7];
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }
}

void sub_10003CAF0(void *a1)
{
  id v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    id v3 = v2;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 BOOLValue];
    id v2 = v3;
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

void sub_10003CC58(uint64_t a1)
{
  id v2 = objc_retainBlock(*(id *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

id sub_10003CD48(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
}

void sub_10003D3F8(id a1)
{
  qword_1001C3C38 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  _objc_release_x1();
}

uint64_t sub_10003D6E0()
{
  qword_1001C3C48 = objc_opt_new();

  return _objc_release_x1();
}

void sub_10003D954(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

id sub_10003D96C(uint64_t a1)
{
  [*(id *)(a1 + 32) resetState];
  [*(id *)(a1 + 32) updatePredictedInterval];
  id v2 = *(double **)(a1 + 32);
  double v3 = v2[10];

  return [v2 setupHighCarbonImpactWindow:v3];
}

void sub_10003DAA0(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 88);
  double v3 = +[_CDContextQueries keyPathForPluginStatus];
  id v4 = [v2 objectForKeyedSubscript:v3];
  id v5 = [v4 BOOLValue];

  uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = +[NSNumber numberWithBool:v5];
    int v14 = 138412290;
    long long v15 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Plugin status is now %@", (uint8_t *)&v14, 0xCu);
  }
  unsigned int v9 = *(void **)(a1 + 32);
  if (v5)
  {
    double v10 = (void *)v9[11];
    id v11 = +[_CDContextQueries keyPathForPluginStatus];
    double v12 = [v10 lastModifiedDateForContextualKeyPath:v11];

    [v12 timeIntervalSinceNow];
    if (v13 > -10.0)
    {
      [*(id *)(a1 + 32) resetState];
      [*(id *)(a1 + 32) updatePredictedInterval];
      [*(id *)(a1 + 32) setupHighCarbonImpactWindow:*(double *)(*(void *)(a1 + 32) + 80)];
    }
  }
  else
  {
    [v9 resetState];
  }
}

void sub_10003DCA4(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  if (v2 < 0.0)
  {
    double v3 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v4 = "No CarbonImpact window. Prediction < 0";
    goto LABEL_7;
  }
  if (v2 == 0.0)
  {
    uint64_t v5 = +[NSDate distantPast];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = a1 + 32;
    id v8 = *(void **)(v7 + 64);
    *(void *)(v7 + 64) = v5;

    uint64_t v9 = +[NSDate distantPast];
    double v10 = *(void **)(*(void *)v6 + 64);
    *(void *)(*(void *)v6 + 64) = v9;

    uint64_t v11 = +[NSDate date];
    double v12 = *(void **)(*(void *)v6 + 24);
    *(void *)(*(void *)v6 + 24) = v11;

    double v3 = *(NSObject **)(*(void *)v6 + 48);
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    id v4 = "No Carbon Impact window. Prediction is 0";
    goto LABEL_7;
  }
  double v13 = *(void **)(*(void *)(a1 + 32) + 24);
  if (!v13) {
    goto LABEL_13;
  }
  [v13 timeIntervalSinceNow];
  int v14 = *(double **)(a1 + 32);
  if (v15 <= -v14[7])
  {
    double v2 = *(double *)(a1 + 40);
LABEL_13:
    uint64_t v40 = 0;
    long long v41 = &v40;
    uint64_t v42 = 0x2050000000;
    long long v16 = (void *)qword_1001C3C60;
    uint64_t v43 = qword_1001C3C60;
    if (!qword_1001C3C60)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = sub_10003EEDC;
      v45 = &unk_100175628;
      v46[0] = &v40;
      sub_10003EEDC((uint64_t)buf);
      long long v16 = (void *)v41[3];
    }
    id v17 = v16;
    _Block_object_dispose(&v40, 8);
    id v18 = [v17 managerWithID:@"com.apple.dasd.gridDataManager" locationBundlePath:@"/System/Library/LocationBundles/SystemCustomization.bundle" v40];
    uint64_t v19 = [v18 latestMarginalEmissionForecast];
    uint64_t v20 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = v20;
      id v22 = [v19 forecastMap];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Emission Forecast: %@", buf, 0xCu);
    }
    [v19 refetchInterval];
    uint64_t v24 = a1 + 32;
    *(double *)(*(void *)(a1 + 32) + 56) = fmax(v23, 14400.0);
    uint64_t v25 = [*(id *)(a1 + 32) forecastForTimeInterval:v19 from:*(double *)(a1 + 40)];
    long long v26 = *(void **)(a1 + 32);
    uint64_t v27 = [v19 fetchDate];
    double v28 = v2 * 0.2;
    uint64_t v29 = [v26 carbonImpactWindowStartForForecast:v25 withStartDate:v27 windowSize:v28];

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), v29);
    uint64_t v30 = +[NSDate dateWithTimeInterval:*(void *)(*(void *)(a1 + 32) + 64) sinceDate:v28];
    id v31 = *(void **)(*(void *)(a1 + 32) + 72);
    *(void *)(*(void *)v24 + 72) = v30;

    uint64_t v32 = +[NSDate date];
    id v33 = *(void **)(*(void *)(a1 + 32) + 24);
    *(void *)(*(void *)v24 + 24) = v32;

    id v34 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      long long v35 = *(void **)(a1 + 32);
      uint64_t v37 = v35[8];
      uint64_t v36 = v35[9];
      long long v38 = (void *)v35[3];
      uint64_t v39 = v35[7];
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v37;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v36;
      *(_WORD *)&buf[22] = 2112;
      v45 = v38;
      LOWORD(v46[0]) = 2048;
      *(void *)((char *)v46 + 2) = v39;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "CarbonImpact Start: %@, CarbonImpact End %@, FetchTime %@, Forecast Cache internal %f", buf, 0x2Au);
    }
    [*(id *)(a1 + 32) saveCarbonImpactWindowState];

    return;
  }
  [v14 loadState];
  double v3 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    id v4 = "Emission Forecast fetched recently";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, buf, 2u);
  }
}

void sub_10003E0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

int64_t sub_10003E808(id a1, NSNumber *a2, NSNumber *a3)
{
  if ([(NSNumber *)a2 compare:a3] == NSOrderedAscending) {
    return -1;
  }
  else {
    return 1;
  }
}

Class sub_10003ED24(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1001C3C58)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10003EE68;
    v4[4] = &unk_1001753E0;
    v4[5] = v4;
    long long v5 = off_100175F80;
    uint64_t v6 = 0;
    qword_1001C3C58 = _sl_dlopen();
    double v2 = (void *)v4[0];
    if (!qword_1001C3C58)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("_OSChargingPredictor");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    double v2 = (void *)sub_1000F4AA8();
LABEL_8:
    free(v2);
  }
  qword_1001C3C50 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10003EE68()
{
  uint64_t result = _sl_dlopen();
  qword_1001C3C58 = result;
  return result;
}

Class sub_10003EEDC(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1001C3C68)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10003F020;
    v4[4] = &unk_1001753E0;
    v4[5] = v4;
    long long v5 = off_100175F98;
    uint64_t v6 = 0;
    qword_1001C3C68 = _sl_dlopen();
    double v2 = (void *)v4[0];
    if (!qword_1001C3C68)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("_GDSManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    double v2 = (void *)sub_1000F4AD0();
LABEL_8:
    free(v2);
  }
  qword_1001C3C60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10003F020()
{
  uint64_t result = _sl_dlopen();
  qword_1001C3C68 = result;
  return result;
}

void sub_100040FD4(uint64_t a1, double a2)
{
  if (a2 != 0.0)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:@"com.apple.dasd.systemEnergy"];
    long long v5 = v4;
    if (v4)
    {
      [v4 capacity];
      +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.dasd.energyBudgetConsumed" byCount:llround(a2 * 10000.0 / v6)];
      CFStringRef v16 = @"EnergyBudgetUsage";
      [v5 capacity];
      id v8 = +[NSNumber numberWithDouble:a2 * 10000.0 / v7];
      id v17 = v8;
      uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      AnalyticsSendEvent();

      [v5 decrementBy:a2];
      [*(id *)(*(void *)(a1 + 32) + 40) updateBudget:v5];
      double v10 = +[_DASDaemonLogger logForCategory:@"energybudgeting"];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:@"com.apple.dasd.systemEnergy"];
        int v12 = 134218242;
        double v13 = a2;
        __int16 v14 = 2112;
        double v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Decremented energy budget by %f, energyBudget now is %@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

id sub_1000411B0(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) onBudgetChange:a2];
}

id sub_1000411BC(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 registerSignificantBudgetChangeCallback:*(void *)(a1 + 32)];
}

void sub_1000411CC(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  double v3 = *(id **)(a1 + 32);
  id v4 = [v3[3] objectForKeyedSubscript:@"com.apple.dasd.systemEnergy"];
  [v3 postNotificationWithBudget:v4];

  long long v5 = *(id **)(a1 + 32);
  double v6 = [v5[3] objectForKeyedSubscript:@"com.apple.dasd.systemCellular"];
  [v5 postNotificationWithBudget:v6];
}

uint64_t sub_100041308()
{
  objc_opt_class();
  qword_1001C3C78 = objc_opt_new();

  return _objc_release_x1();
}

void sub_100041464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10004147C(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 56) dailyBudget];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void sub_1000415D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000415EC(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 48) dailyBudget];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

id sub_10004183C(uint64_t a1)
{
  return [*(id *)(a1 + 32) unlocked_instantiateConfiguredBudgets];
}

void sub_1000427A0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  v11[0] = @"name";
  id v4 = a3;
  long long v5 = [v4 name];
  v12[0] = v5;
  v11[1] = @"balance";
  [v4 balance];
  double v6 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v12[1] = v6;
  v11[2] = @"capacity";
  [v4 capacity];
  double v8 = v7;

  uint64_t v9 = +[NSNumber numberWithDouble:v8];
  v12[2] = v9;
  double v10 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:3];
  [v3 addObject:v10];
}

id sub_100042EA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopTrackingActivity:*(void *)(a1 + 40)];
}

id sub_100042FE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) startTrackingActivity:*(void *)(a1 + 40)];
}

id sub_100043088(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) stopTrackingActivityWithParameters:*(void *)(a1 + 40)];
}

void sub_10004315C(id *a1)
{
  double v2 = [a1[4] objectForKeyedSubscript:_DASUpdateActivityCellTransferKey];
  [v2 doubleValue];
  double v4 = v3;

  long long v5 = [a1[4] objectForKeyedSubscript:_DASUpdateActivityWifiTransferKey];
  [v5 doubleValue];
  double v7 = v6;

  double v8 = [a1[4] objectForKeyedSubscript:_DASUpdateActivityWiFiExpensiveTransferKey];
  [v8 doubleValue];
  double v10 = v9;

  uint64_t v11 = [a1[4] objectForKeyedSubscript:_DASUpdateActivityCellExpensiveTransferKey];
  [v11 doubleValue];
  double v13 = v12;

  __int16 v14 = [a1[4] objectForKeyedSubscript:_DASUpdateActivityWiFiInexpensiveTransferKey];
  [v14 doubleValue];
  double v16 = v15;

  id v17 = [a1[4] objectForKeyedSubscript:_DASUpdateActivityCellInexpensiveTransferKey];
  [v17 doubleValue];
  double v19 = v18;

  uint64_t v20 = a1 + 6;
  [*((id *)a1[5] + 6) updateDataForActivity:a1[6] bytesOnCell:v4 bytesOnCellExpensive:v13 bytesOnCellInexpensive:v19 bytesOnWiFiExpensive:v10 bytesOnWiFiInexpensive:v16];
  double v22 = v21;
  double v23 = *((void *)a1[5] + 2);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    sub_1000F4C60((uint64_t *)a1 + 6, v23, v22);
  }
  if (v22 != 0.0)
  {
    uint64_t v24 = [a1[5] dataBudgetForActivity:a1[6]];
    [v24 decrementBy:v22];
    [*((id *)a1[5] + 5) updateBudget:v24];
    uint64_t v25 = [a1[6] clientDataBudgetName];

    [v24 capacity];
    unint64_t v27 = llround(v22 * 10000.0 / v26);
    if (v25)
    {
      +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.dasd.customBudgetConsumed" byCount:v27];
    }
    else
    {
      +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.dasd.networkBudgetConsumed" byCount:v27];
      [a1[5] reportMetricsForNetworkUsage:v24 forDataBudget:a1[6] totalUsage:v22 usageInCell:v4 + v7 usageInInexpensive:v4 forActivity:v19];
    }
    double v28 = +[_DASDaemonLogger logForCategory:@"networkbudgeting"];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = *v20;
      uint64_t v30 = [v29 relatedApplications];
      int v31 = 134218754;
      double v32 = v22;
      __int16 v33 = 2114;
      id v34 = v29;
      __int16 v35 = 2114;
      uint64_t v36 = v30;
      __int16 v37 = 2114;
      long long v38 = v24;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Decremented data budget by %f for activity %{public}@ (%{public}@) data budget is now %{public}@", (uint8_t *)&v31, 0x2Au);
    }
  }
}

id sub_100043540(uint64_t a1)
{
  [*(id *)(a1 + 32) capacity];
  double v3 = v2;
  uint64_t v4 = +[_DASSystemBudgetManager identifierWithActivity:*(void *)(a1 + 40)];
  long long v5 = (void *)v4;
  if (v3 == 0.0 || v4 == 0)
  {
    double v9 = +[_DASDaemonLogger logForCategory:@"networkbudgeting"];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000F4DAC((id *)(a1 + 40), v9);
    }
    double v7 = 0;
  }
  else
  {
    double v7 = +[NSMutableDictionary dictionary];
    double v8 = +[NSNumber numberWithDouble:*(double *)(a1 + 48) * 10000.0 / v3];
    [v7 setObject:v8 forKeyedSubscript:@"NWBudgetUsage"];

    [v7 setObject:v5 forKeyedSubscript:@"ClientIdentifier"];
    double v9 = +[_DASSystemBudgetManager involvedProcessesForActivity:*(void *)(a1 + 40) withIdentifier:v5];
    double v10 = [v9 anyObject];
    [v7 setObject:v10 forKeyedSubscript:@"RelatedApplication"];

    uint64_t v11 = +[NSNumber numberWithDouble:v3];
    [v7 setObject:v11 forKeyedSubscript:@"BudgetCapacity"];

    float v12 = *(double *)(a1 + 56) / *(double *)(a1 + 64);
    double v13 = +[NSNumber numberWithDouble:*(double *)(a1 + 48) * (float)(v12 * 10000.0) / v3];
    [v7 setObject:v13 forKeyedSubscript:@"CellUsage"];

    __int16 v14 = +[NSNumber numberWithDouble:*(double *)(a1 + 48) * (float)((float)(1.0 - v12) * 10000.0) / v3];
    [v7 setObject:v14 forKeyedSubscript:@"WifiUsage"];

    float v15 = *(double *)(a1 + 72) / *(double *)(a1 + 64);
    double v16 = +[NSNumber numberWithDouble:*(double *)(a1 + 48) * (float)(v15 * 10000.0) / v3];
    [v7 setObject:v16 forKeyedSubscript:@"InexpensiveUsage"];

    id v17 = +[NSNumber numberWithDouble:*(double *)(a1 + 48) * (float)((float)(1.0 - v15) * 10000.0) / v3];
    [v7 setObject:v17 forKeyedSubscript:@"ExpensiveUsage"];

    double v18 = +[_DASDaemonLogger logForCategory:@"networkbudgeting"];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_1000F4D34((uint64_t)v7, v18);
    }
  }

  return v7;
}

void sub_100043974(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_100043B48(uint64_t a1)
{
  qword_1001C3C98 = [[_DASRemoteDeviceWakeMonitor alloc] initWithDaemon:*(void *)(a1 + 32)];

  return _objc_release_x1();
}

void sub_100043E24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100043F9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000441A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000448CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000448F8(uint64_t a1)
{
  double v2 = +[_DASDaemonLogger logForCategory:@"remoteScreenMonitor"];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = [*(id *)(a1 + 32) deviceIdentifier];
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412546;
    double v7 = v3;
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ is now awake, connected, and nearby, evaluate %@", (uint8_t *)&v6, 0x16u);
  }
  long long v5 = [*(id *)(a1 + 48) daemon];
  [v5 evaluateScoreAndRunActivities:*(void *)(a1 + 40)];
}

uint64_t sub_100044FD0(uint64_t a1)
{
  qword_1001C3CA8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100045114(uint64_t a1)
{
  double v2 = (void *)os_transaction_create();
  uint64_t v4 = +[_DASPredictionManager sharedKnowledgeStore];
  long long v5 = +[_DKSystemEventStreams appInFocusStream];
  id v6 = objc_alloc((Class)NSDateInterval);
  double v7 = +[NSDate dateWithTimeIntervalSinceNow:-1800.0];
  id v8 = [v6 initWithStartDate:v7 duration:1800.0];
  uint64_t v9 = +[_DKHistogramQuery histogramQueryForStream:v5 interval:v8];

  [v9 setIncludeRemoteResults:0];
  uint64_t v10 = +[_DASPredictionManager predictionGenerationQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000452B0;
  v13[3] = &unk_1001760A8;
  id v11 = v2;
  uint64_t v12 = *(void *)(a1 + 32);
  id v14 = v11;
  uint64_t v15 = v12;
  [v4 executeQuery:v9 responseQueue:v10 withCompletion:v13];
}

void sub_1000452B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v19 = a3;
  id v6 = *(id *)(*(void *)(a1 + 40) + 80);
  objc_sync_enter(v6);
  [*(id *)(*(void *)(a1 + 40) + 80) removeAllObjects];
  double v7 = [v5 countDictionary];
  if ((unint64_t)[v7 count] < 0x1A)
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100045658;
    v21[3] = &unk_100175498;
    v21[4] = *(void *)(a1 + 40);
    [v7 enumerateKeysAndObjectsUsingBlock:v21];
  }
  else
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000455D8;
    v26[3] = &unk_100176080;
    id v8 = v7;
    id v27 = v8;
    uint64_t v9 = [v8 keysSortedByValueUsingComparator:v26];
    id v10 = [v9 mutableCopy];

    [v10 removeObjectsInRange:25, (unint64_t)((double)(unint64_t)objc_msgSend(v8, "count") + -25.0)];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v10;
    id v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v23;
      do
      {
        id v14 = 0;
        do
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*(void *)(a1 + 40) + 80);
          double v16 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v14) dk_dedup];
          [v15 addObject:v16];

          id v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v12);
    }
  }
  id v17 = +[_DASDaemonLogger logForCategory:@"bar"];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(*(void *)(a1 + 40) + 80);
    *(_DWORD *)buf = 138412290;
    uint64_t v29 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Recent Applications: %@", buf, 0xCu);
  }

  objc_sync_exit(v6);
}

void sub_1000455A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000455D8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  double v7 = [v5 objectForKeyedSubscript:a3];
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  id v9 = [v7 compare:v8];
  return v9;
}

void sub_100045658(uint64_t a1, void *a2)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 80);
  [a2 dk_dedup];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void sub_1000457F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100045DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_100045E10(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100045E20(uint64_t a1)
{
}

void sub_100045E28(uint64_t a1)
{
  double v2 = (void *)os_transaction_create();
  uint64_t v4 = [*(id *)(a1 + 32) topNPrediction];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) topNPrediction];
    unsigned int v6 = +[_DASPredictionManager predictionNeedsUpdating:v5 atDate:*(void *)(a1 + 40) lastUpdatedAt:*(void *)(*(void *)(a1 + 32) + 56)];

    if (v6)
    {
      id v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472;
      uint64_t v13 = sub_100045F6C;
      id v14 = &unk_100175570;
      double v7 = *(void **)(a1 + 40);
      uint64_t v15 = *(void *)(a1 + 32);
      id v16 = v7;
      +[_DASPredictionManager asyncDo:&v11];
    }
  }
  else
  {
    [*(id *)(a1 + 32) updatePredictionsAtDate:*(void *)(a1 + 40)];
  }
  uint64_t v8 = [*(id *)(a1 + 32) topNPrediction:v11, v12, v13, v14, v15];
  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

id sub_100045F6C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePredictionsAtDate:*(void *)(a1 + 40)];
}

void sub_100046934(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000469AC(uint64_t a1, void *a2)
{
  id v4 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 80) + 8) + 32));
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 96) + 8) + 40), a2);
    [*(id *)(*(void *)(a1 + 40) + 40) setObject:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) forKeyedSubscript:*(void *)(a1 + 48)];
    [*(id *)(*(void *)(a1 + 40) + 64) setObject:*(void *)(a1 + 56) forKeyedSubscript:*(void *)(a1 + 48)];
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 80) + 8) + 32));
  if (([*(id *)(a1 + 64) bypassesPredictions] & 1) == 0)
  {
    id v5 = +[_DASPLLogger sharedInstance];
    [v5 recordAppPrediction:*(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40) app:*(void *)(a1 + 48)];
  }
  unsigned int v6 = +[_DASDaemonLogger logForCategory:@"predictions"];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v12 = v7;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Timeline for %@: %@", buf, 0x16u);
  }

  uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
  id v10 = +[NSString stringWithFormat:@"application.%@", *(void *)(a1 + 48)];
  +[_DASPredictionManager setPrediction:v9 forKey:v10];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 72));
}

void sub_100047600(id a1)
{
  qword_1001C3CD0 = objc_alloc_init(_DASBatteryLevelPolicy);

  _objc_release_x1();
}

id sub_100047D40(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSystemConstraintsWithContext:*(void *)(a1 + 40)];
}

void sub_100047F44(id a1)
{
  qword_1001C3CE8 = objc_alloc_init(_DASBootTimePolicy);

  _objc_release_x1();
}

uint64_t sub_10004857C()
{
  qword_1001C3D00 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100048B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

id sub_100048B28(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateCache];
}

void sub_100048B84(id a1)
{
  qword_1001C3D10 = objc_alloc_init(_DASRequiresBuddyCompletePolicy);

  _objc_release_x1();
}

void sub_100048CC0(uint64_t a1)
{
  double v2 = [*(id *)(*(void *)(a1 + 40) + 56) objectForKeyedSubscript:&off_100186C40];
  if (!v2)
  {
    [*(id *)(*(void *)(a1 + 40) + 56) setObject:&__kCFBooleanFalse forKeyedSubscript:&off_100186C40];
    [*(id *)(a1 + 40) _updateCache];
    double v2 = [*(id *)(*(void *)(a1 + 40) + 56) objectForKeyedSubscript:&off_100186C40];
  }
  id v3 = v2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 BOOLValue];
}

uint64_t sub_100048F8C()
{
  if (!qword_1001C3D18) {
    qword_1001C3D18 = _sl_dlopen();
  }
  return qword_1001C3D18;
}

uint64_t sub_10004905C()
{
  uint64_t result = _sl_dlopen();
  qword_1001C3D18 = result;
  return result;
}

void *sub_1000490D0(uint64_t a1)
{
  double v2 = (void *)sub_100048F8C();
  if (!v2)
  {
    id v4 = (void *)abort_report_np();
    free(v4);
  }
  uint64_t result = dlsym(v2, "BYSetupAssistantNeedsToRun");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1001C3D20 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10004995C(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = +[NSDate now];
  [v2 handleTimerFireAtDate:v3 withContext:*(void *)(*(void *)(a1 + 32) + 48)];
}

void sub_100049A18(id a1)
{
  qword_1001C3D30 = objc_alloc_init(_DASNetworkSynchronizationPolicy);

  _objc_release_x1();
}

void sub_100049C98(uint64_t a1)
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  unsigned int v3 = [v2 BOOLForKey:@"postNWAlignmentNotifications"];

  if (v3)
  {
    if (*(unsigned char *)(a1 + 32)) {
      id v4 = @"Denying tasks due to network alignment.";
    }
    else {
      id v4 = @"No longer denying tasks due to network alignment.";
    }
    id v5 = v4;
    id v7 = +[_DASNotificationManager sharedManager];
    unsigned int v6 = +[NSDate dateWithTimeIntervalSinceNow:10800.0];
    [v7 postNotificationAtDate:0 withTitle:@"Network Alignment" withTextContent:v5 icon:0 url:0 expirationDate:v6];
  }
}

id sub_10004A0CC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleSmartPowerNapNotification:a2];
}

uint64_t sub_10004A248(uint64_t a1)
{
  qword_1001C3D40 = (uint64_t)[objc_alloc((Class)objc_opt_class()) initWithDaemon:*(void *)(a1 + 32)];

  return _objc_release_x1();
}

void sub_10004A530(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004A7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10004AAB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_10004AB5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004AE38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004AF50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004B004(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004B0E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004B4D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_10004B504(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained assertionArbiter:v2 didIssueWarningFor:v3];
}

void sub_10004B574(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained assertionArbiter:v4 didIssueInvalidationFor:v5 serverInitiated:a2];
}

void sub_10004BEE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10004C434(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_10004C460(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

uint64_t sub_10004C6C8(uint64_t a1)
{
  qword_1001C3D50 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

uint64_t sub_10004CBE4(uint64_t a1)
{
  qword_1001C3D60 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10004D0A4(id a1)
{
  qword_1001C3D70 = objc_alloc_init(_DASCPUUsagePolicy);

  _objc_release_x1();
}

uint64_t sub_10004D5A0()
{
  qword_1001C3D80 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_10004D874(uint64_t a1)
{
  if (_NETRBClientCreate())
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    *(_OWORD *)cStr = 0u;
    long long v29 = 0u;
    if (_NETRBClientGetDynamicStoreKey())
    {
      *(void *)(*(void *)(a1 + 32) + 56) = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
      if (*(void *)(*(void *)(a1 + 32) + 56))
      {
LABEL_12:
        _NETRBClientDestroy();
        goto LABEL_13;
      }
      uint64_t v2 = +[_DASDaemonLogger logForCategory:@"InternetSharingPolicy"];
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        sub_1000F596C(v2, v3, v4, v5, v6, v7, v8, v9);
      }
    }
    else
    {
      uint64_t v2 = +[_DASDaemonLogger logForCategory:@"InternetSharingPolicy"];
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
        sub_1000F59A4(v2, v18, v19, v20, v21, v22, v23, v24);
      }
    }

    goto LABEL_12;
  }
  id v10 = +[_DASDaemonLogger logForCategory:@"InternetSharingPolicy"];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1000F5934(v10, v11, v12, v13, v14, v15, v16, v17);
  }

LABEL_13:
  if (*(void *)(*(void *)(a1 + 32) + 56))
  {
    *(void *)(*(void *)(a1 + 32) + 40) = SCDynamicStoreCreate(kCFAllocatorDefault, @"com.apple.dasd", (SCDynamicStoreCallBack)sub_10004DA84, 0);
    uint64_t v25 = *(void *)(a1 + 32);
    double v26 = *(const __SCDynamicStore **)(v25 + 40);
    uint64_t v27 = *(void *)(v25 + 56);
    SCDynamicStoreSetNotificationKeys(v26, (CFArrayRef)+[NSArray arrayWithObjects:&v27 count:1], 0);
    SCDynamicStoreSetDispatchQueue(*(SCDynamicStoreRef *)(*(void *)(a1 + 32) + 40), *(dispatch_queue_t *)(*(void *)(a1 + 32) + 48));
    [*(id *)(a1 + 32) handleWirelessModemDynamicStoreChanged];
  }
}

void sub_10004DA84()
{
  id v0 = +[_DASInternetSharingPolicy policyInstance];
  [v0 handleWirelessModemDynamicStoreChanged];
}

uint64_t sub_10004DB6C(uint64_t a1)
{
  qword_1001C3D90 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10004E288(id a1)
{
  qword_1001C3DA0 = objc_alloc_init(_DASDataBudgetPolicy);

  _objc_release_x1();
}

id sub_10004EC74(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSystemConstraintsWithContext:*(void *)(a1 + 40)];
}

uint64_t sub_10004F1C8(uint64_t a1)
{
  qword_1001C3DB8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10004F3AC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) deviceNearbyTimeline];
  unsigned int v3 = +[_DASPredictionManager predictionNeedsUpdating:v2 atDate:*(void *)(a1 + 40) lastUpdatedAt:*(void *)(*(void *)(a1 + 32) + 48)];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) predictionForDeviceNearby];
    [*(id *)(a1 + 32) setDeviceNearbyTimeline:v4];

    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = (id *)(*(void *)(a1 + 32) + 48);
    objc_storeStrong(v6, v5);
  }
}

void sub_10004FB64(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) predictionForDeviceActivity];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v2);
  +[_DASPredictionManager setPrediction:v2 forKey:@"deviceActivity"];
  unsigned int v3 = +[_DASDaemonLogger logForCategory:@"predictions"];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000F59DC((uint64_t)v2, v3);
  }

  uint64_t v4 = +[_DASPLLogger sharedInstance];
  [v4 recordPrediction:v2 key:@"deviceActivityPrediction" valueMultiplier:100];

  uint64_t v5 = +[NSDate date];
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v5;
}

uint64_t sub_10004FD68(uint64_t a1)
{
  qword_1001C3DC8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_1000505AC(id a1)
{
  qword_1001C3DD0 = objc_opt_new();

  _objc_release_x1();
}

uint64_t sub_100050748()
{
  qword_1001C3DE0 = objc_opt_new();

  return _objc_release_x1();
}

id sub_10005085C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)qword_1001C3DF0;
  uint64_t v7 = qword_1001C3DF0;
  if (!qword_1001C3DF0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100053310;
    v3[3] = &unk_100175628;
    void v3[4] = &v4;
    sub_100053310((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100050928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100051268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v11);
  _Unwind_Resume(a1);
}

id sub_100051448(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v8 = (void (*)(id, id, id))off_1001C3E10;
  uint64_t v16 = off_1001C3E10;
  if (!off_1001C3E10)
  {
    uint64_t v9 = (void *)sub_100053368();
    v14[3] = (uint64_t)dlsym(v9, "PPSCreateSubsystemCategoryPredicate");
    off_1001C3E10 = (_UNKNOWN *)v14[3];
    uint64_t v8 = (void (*)(id, id, id))v14[3];
  }
  _Block_object_dispose(&v13, 8);
  if (!v8)
  {
    uint64_t v12 = (_Unwind_Exception *)sub_1000F50F0();
    _Block_object_dispose(&v13, 8);
    _Unwind_Resume(v12);
  }
  id v10 = v8(v5, v6, v7);

  return v10;
}

id sub_1000515A4()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)qword_1001C3E18;
  uint64_t v7 = qword_1001C3E18;
  if (!qword_1001C3E18)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000535D4;
    v3[3] = &unk_100175628;
    void v3[4] = &v4;
    sub_1000535D4((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100051670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100051C94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100051EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100052B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

Class sub_100053310(uint64_t a1)
{
  sub_100053368();
  Class result = objc_getClass("PPSTimeSeries");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1001C3DF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_1000F5C88();
    return (Class)sub_100053368();
  }
  return result;
}

uint64_t sub_100053368()
{
  v3[0] = 0;
  if (!qword_1001C3DF8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100053468;
    void v3[4] = &unk_1001753E0;
    void v3[5] = v3;
    long long v4 = off_100176298;
    uint64_t v5 = 0;
    qword_1001C3DF8 = _sl_dlopen();
  }
  uint64_t v0 = qword_1001C3DF8;
  id v1 = (void *)v3[0];
  if (!qword_1001C3DF8)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100053468()
{
  uint64_t result = _sl_dlopen();
  qword_1001C3DF8 = result;
  return result;
}

Class sub_1000534DC(uint64_t a1)
{
  sub_100053368();
  Class result = objc_getClass("PPSRequestDispatcher");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1001C3E00 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_1000F5CB0();
    return (Class)sub_100053534(v3);
  }
  return result;
}

void *sub_100053534(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100053368();
  Class result = dlsym(v2, "PerfPowerServicesGetData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1001C3E08 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100053584(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100053368();
  Class result = dlsym(v2, "PPSCreateSubsystemCategoryPredicate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1001C3E10 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_1000535D4(uint64_t a1)
{
  sub_100053368();
  Class result = objc_getClass("PPSTimeSeriesRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1001C3E18 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_1000F5CD8();
    return (Class)sub_10005362C(v3);
  }
  return result;
}

Class sub_10005362C(uint64_t a1)
{
  sub_100053368();
  Class result = objc_getClass("PPSHistogramRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1001C3E20 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_1000F5D00();
    return (Class)sub_100053684(v3);
  }
  return result;
}

Class sub_100053684(uint64_t a1)
{
  sub_100053368();
  Class result = objc_getClass("PPSIntervalSetRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1001C3E28 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_1000F5D28();
    return (Class)sub_1000536DC(v3);
  }
  return result;
}

_APRSSignpostReader *sub_1000536DC(uint64_t a1)
{
  sub_100053368();
  Class result = (_APRSSignpostReader *)objc_getClass("PPSEvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1001C3E30 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (_APRSSignpostReader *)sub_1000F5D50();
    return [(_APRSSignpostReader *)v3 init];
  }
  return result;
}

void sub_1000538F4(uint64_t a1)
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  SEL v4 = *(void **)(v3 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100053AE4;
  v16[3] = &unk_1001762B8;
  v16[4] = v3;
  v16[5] = &v17;
  [v4 appLaunchResumeInfoWithStartDate:v2 withEndDate:v5 withReply:v16];
  if (*((unsigned char *)v18 + 24))
  {
    uint64_t v6 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Resumes %@", buf, 0xCu);
    }
    uint64_t v8 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Launches %@", buf, 0xCu);
    }
    [*(id *)(a1 + 32) recordResumesAndLaunches];
  }
  uint64_t v10 = +[NSMutableDictionary dictionary];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 24);
  *(void *)(v11 + 24) = v10;

  uint64_t v13 = +[NSMutableDictionary dictionary];
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void **)(v14 + 32);
  *(void *)(v14 + 32) = v13;

  _Block_object_dispose(&v17, 8);
}

void sub_100053AC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_100053AE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 8), OS_LOG_TYPE_ERROR)) {
      sub_1000F5DBC();
    }
LABEL_4:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_5;
  }
  if (!v5)
  {
    uint64_t v11 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_1000F5D78(v11);
    }
    goto LABEL_4;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(a1 + 32) processSignpostInterval:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      id v8 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
LABEL_5:
}

void sub_10005424C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[_APRSBiomeBase sourceForStream];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v14 = [_APRSBiomeAppLaunchTimeEvent eventWithAppBundleID:activationTime:launchReason:v5, [v13 unsignedIntValue], *(unsigned int *)(a1 + 40)];
        +[_APRSBiomeBase postEvent:v14 usingSource:v7];
        [*(id *)(a1 + 32) addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

void sub_1000543C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = +[_APRSBiomeBase sourceForStream];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v14 = [_APRSBiomeAppLaunchTimeEvent eventWithAppBundleID:v5 activationTime:objc_msgSend(v13, "unsignedIntValue", (void)v15) launchReason:*(unsigned int *)(a1 + 40)];
        +[_APRSBiomeBase postEvent:v14 usingSource:v7];
        [*(id *)(a1 + 32) addObject:v13];
      }
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

void sub_100054600(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_100054638(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000548B0(id a1)
{
  qword_1001C3E40 = objc_alloc_init(_DASEnergyBudgetPolicy);

  _objc_release_x1();
}

id sub_100054F0C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSystemConstraintsWithContext:*(void *)(a1 + 40)];
}

void sub_1000552D8(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + _Block_object_dispose(&a9, 8) = 0;
  notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 12));
  id v1 = +[_DASDaemonLogger logForCategory:@"fileProtection"];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Device is now ClassC unlocked", v2, 2u);
  }
}

uint64_t sub_100055404(uint64_t a1)
{
  qword_1001C3E58 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100055998(id a1)
{
  qword_1001C3E68 = objc_alloc_init(_DASFastPassPolicy);

  _objc_release_x1();
}

uint64_t sub_100055B50(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + _Block_object_dispose(&a9, 8) = 0;
  return result;
}

uint64_t sub_100055F7C(uint64_t a1)
{
  qword_1001C3E78 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_1000562D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[NSDate dateWithTimeIntervalSinceNow:-1900800.0];
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 8), OS_LOG_TYPE_DEBUG)) {
    sub_1000F6210();
  }
  +[_APRSBiomeBase pruneEventsOlderThanDate:v4];
  +[_APRSBiomeBase pruneEventsOlderThanDate:v4];
  +[_APRSBiomeBase pruneEventsOlderThanDate:v4];
  uint64_t v25 = 0;
  double v26 = (double *)&v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v21 = 0;
  uint64_t v22 = (double *)&v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = 0;
  uint64_t v17 = 0;
  long long v18 = (double *)&v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  id v5 = *(void **)(a1 + 32);
  id v6 = +[NSDate dateWithTimeIntervalSinceNow:-86400.0];
  id v7 = [v5 appActivationTimeInfoStartingAtDate:v6 withBookmarkKey:0];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005663C;
  v16[3] = &unk_100176360;
  v16[4] = &v25;
  v16[5] = &v21;
  void v16[6] = &v17;
  [v7 enumerateKeysAndObjectsUsingBlock:v16];
  double v8 = v18[3];
  double v9 = v22[3] + v8;
  if (v9 == 0.0)
  {
    double v10 = 0.0;
    double v11 = 0.0;
  }
  else
  {
    double v10 = v8 / v9 * 100.0;
    double v11 = v26[3] / v9;
  }
  v29[0] = @"resumeRate";
  long long v12 = +[NSNumber numberWithDouble:v10];
  v29[1] = @"avgActivationTime";
  v30[0] = v12;
  long long v13 = +[NSNumber numberWithDouble:v11];
  v30[1] = v13;
  long long v14 = +[NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];

  id v15 = v14;
  AnalyticsSendEventLazy();
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 8), OS_LOG_TYPE_DEBUG)) {
    sub_1000F61A8();
  }
  [v3 setTaskCompleted];

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
}

void sub_100056600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_10005663C(void *a1, uint64_t a2, void *a3)
{
  id v7 = a3;
  if ((int)[v7 launchCount] >= 1 && (int)objc_msgSend(v7, "resumeCount") >= 1)
  {
    [v7 totalLaunchActivationTime];
    double v5 = v4;
    [v7 totalResumeActivationTime];
    *(double *)(*(void *)(a1[4] + 8) + 24) = v5 + v6 + *(double *)(*(void *)(a1[4] + 8) + 24);
    *(double *)(*(void *)(a1[5] + 8) + 24) = *(double *)(*(void *)(a1[5] + 8) + 24)
                                                 + (double)(int)[v7 launchCount];
    *(double *)(*(void *)(a1[6] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 24)
                                                 + (double)(int)[v7 resumeCount];
  }
}

id sub_100056710(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_100056970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10005698C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10005699C(uint64_t a1)
{
}

void sub_1000569A4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appActivationPublisherForEventsFrom:*(void *)(a1 + 40)];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100056AC4;
  v8[3] = &unk_100176388;
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = *(id *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100056B30;
  v7[3] = &unk_1001763D8;
  v7[4] = *(void *)(a1 + 72);
  id v6 = [v2 sinkWithBookmark:v3 completion:v8 receiveInput:v7];
}

void sub_100056AC4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 32)) {
    [*(id *)(*(void *)(a1 + 40) + 16) setObject:a3 forKeyedSubscript:a3];
  }
  [*(id *)(a1 + 40) logCompletion:v5 forAnalysisName:*(void *)(a1 + 48)];
}

id sub_100056B30(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100056BA4;
  v3[3] = &unk_1001763B0;
  void v3[4] = *(void *)(a1 + 32);
  return [a2 enumerateKeysAndObjectsUsingBlock:v3];
}

void sub_100056BA4(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if ((int)[v5 launchCount] >= 1 && (int)objc_msgSend(v5, "resumeCount") >= 1)
  {
    [v5 totalLaunchActivationTime];
    double v7 = v6 / (double)(int)[v5 launchCount];
    [v5 totalResumeActivationTime];
    id v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v7 - v8 / (double)(int)[v5 resumeCount]);
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v9 forKeyedSubscript:v10];
  }
}

void sub_100056ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100056EF4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appActivationPublisherForEventsFrom:*(void *)(a1 + 40)];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100057014;
  v8[3] = &unk_100176388;
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = *(id *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100057080;
  v7[3] = &unk_1001763D8;
  v7[4] = *(void *)(a1 + 72);
  id v6 = [v2 sinkWithBookmark:v3 completion:v8 receiveInput:v7];
}

void sub_100057014(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 32)) {
    [*(id *)(*(void *)(a1 + 40) + 16) setObject:a3 forKeyedSubscript:a3];
  }
  [*(id *)(a1 + 40) logCompletion:v5 forAnalysisName:*(void *)(a1 + 48)];
}

void sub_100057080(uint64_t a1, void *a2)
{
}

BOOL sub_10005713C(id a1, BMStoreEvent *a2)
{
  uint64_t v2 = [(BMStoreEvent *)a2 eventBody];
  uint64_t v3 = [v2 bundleID];
  BOOL v4 = v3 != 0;

  return v4;
}

NSMutableDictionary *__cdecl sub_100057184(id a1, NSMutableDictionary *a2, BMStoreEvent *a3)
{
  BOOL v4 = a2;
  id v5 = a3;
  id v6 = [(BMStoreEvent *)v5 eventBody];
  double v7 = [v6 bundleID];

  double v8 = [(NSMutableDictionary *)v4 objectForKey:v7];
  if (!v8)
  {
    id v9 = objc_alloc_init(AppActivationTimeInfo);
    [(NSMutableDictionary *)v4 setObject:v9 forKeyedSubscript:v7];

    double v8 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:v7];
  }
  uint64_t v10 = [(BMStoreEvent *)v5 eventBody];
  unsigned int v11 = [v10 launchReason];

  if (v11)
  {
    [v8 setResumeCount:[v8 resumeCount] + 1];
    long long v12 = [(BMStoreEvent *)v5 eventBody];
    unsigned int v15 = [v12 activationTime];
    [v8 totalResumeActivationTime];
    [v8 setTotalResumeActivationTime:v16 + (double)v15];
  }
  else
  {
    [v8 setLaunchCount:[v8 launchCount] + 1];
    long long v12 = [(BMStoreEvent *)v5 eventBody];
    unsigned int v13 = [v12 activationTime];
    [v8 totalLaunchActivationTime];
    [v8 setTotalLaunchActivationTime:v14 + (double)v13];
  }

  return v4;
}

void sub_10005755C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100057578(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) appKillsInfoPublisherForEventsFrom:*(void *)(a1 + 40)];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100057698;
  v8[3] = &unk_100176388;
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  id v9 = v4;
  uint64_t v10 = v5;
  id v11 = *(id *)(a1 + 64);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100057704;
  v7[3] = &unk_1001763D8;
  v7[4] = *(void *)(a1 + 72);
  id v6 = [v2 sinkWithBookmark:v3 completion:v8 receiveInput:v7];
}

void sub_100057698(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(void *)(a1 + 32)) {
    [*(id *)(*(void *)(a1 + 40) + 16) setObject:a3 forKeyedSubscript:a3];
  }
  [*(id *)(a1 + 40) logCompletion:v5 forAnalysisName:*(void *)(a1 + 48)];
}

void sub_100057704(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 enumerateKeysAndObjectsUsingBlock:&stru_1001764C0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void sub_100057758(id a1, NSString *a2, AppKillsInfo *a3, BOOL *a4)
{
  id v11 = a3;
  uint64_t v4 = [(AppKillsInfo *)v11 firstKillEventDate];
  [v4 timeIntervalSinceNow];
  int v6 = vcvtpd_s64_f64(v5 / -86400.0);

  [(AppKillsInfo *)v11 meanSpringBoardKills];
  [(AppKillsInfo *)v11 setMeanSpringBoardKills:v7 / (double)v6];
  [(AppKillsInfo *)v11 meanRunningBoardKills];
  [(AppKillsInfo *)v11 setMeanRunningBoardKills:v8 / (double)v6];
  [(AppKillsInfo *)v11 meanJetsamKills];
  [(AppKillsInfo *)v11 setMeanJetsamKills:v9 / (double)v6];
  [(AppKillsInfo *)v11 meanOtherKills];
  [(AppKillsInfo *)v11 setMeanOtherKills:v10 / (double)v6];
}

BOOL sub_1000578B0(id a1, BMStoreEvent *a2)
{
  uint64_t v2 = [(BMStoreEvent *)a2 eventBody];
  id v3 = [v2 bundleID];
  BOOL v4 = v3 != 0;

  return v4;
}

NSMutableDictionary *__cdecl sub_1000578F8(id a1, NSMutableDictionary *a2, BMStoreEvent *a3)
{
  BOOL v4 = a2;
  double v5 = a3;
  int v6 = [(BMStoreEvent *)v5 eventBody];
  double v7 = [v6 bundleID];

  double v8 = [(NSMutableDictionary *)v4 objectForKey:v7];
  if (!v8)
  {
    double v9 = objc_alloc_init(AppKillsInfo);
    [(NSMutableDictionary *)v4 setObject:v9 forKeyedSubscript:v7];

    double v8 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:v7];
    [(BMStoreEvent *)v5 timestamp];
    double v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    [v8 setFirstKillEventDate:v10];
  }
  id v11 = [(BMStoreEvent *)v5 eventBody];
  unsigned int v12 = [v11 exitReason];

  if (v12 == 10)
  {
    [v8 meanSpringBoardKills];
    [v8 setMeanSpringBoardKills:v13 + 1.0];
  }
  else
  {
    double v14 = [(BMStoreEvent *)v5 eventBody];
    unsigned int v15 = [v14 exitReason];

    if (v15 == 15)
    {
      [v8 meanRunningBoardKills];
      [v8 setMeanRunningBoardKills:v16 + 1.0];
    }
    else
    {
      uint64_t v17 = [(BMStoreEvent *)v5 eventBody];
      unsigned int v18 = [v17 exitReason];

      if (v18 == 1)
      {
        [v8 meanJetsamKills];
        [v8 setMeanJetsamKills:v19 + 1.0];
      }
      else
      {
        [v8 meanOtherKills];
        [v8 setMeanOtherKills:v20 + 1.0];
      }
    }
  }

  return v4;
}

uint64_t sub_100057CAC(uint64_t a1)
{
  qword_1001C3E88 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

uint64_t sub_100058360(uint64_t a1)
{
  qword_1001C3E98 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

uint64_t sub_100058848()
{
  qword_1001C3EA8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100058E38(id a1)
{
  qword_1001C3EB8 = objc_alloc_init(_DASMemoryPressurePolicy);

  _objc_release_x1();
}

uint64_t sub_1000593D0(uint64_t a1)
{
  qword_1001C3EC8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_1000595FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100059738(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100059A1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100059CCC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100059DC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005A1E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10005A43C(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  id v3 = [*(id *)(a1 + 32) unCenter];
  BOOL v4 = [*(id *)(a1 + 32) defaultNotifcationRequest];
  [v3 addNotificationRequest:v4 withCompletionHandler:0];
}

uint64_t sub_10005A550()
{
  uint64_t result = +[_DASConfig isInternalBuild];
  if (result)
  {
    qword_1001C3EE0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
    return _objc_release_x1();
  }
  return result;
}

uint64_t sub_10005A94C()
{
  qword_1001C3EE8 = objc_opt_new();

  return _objc_release_x1();
}

uint64_t sub_10005B1B4()
{
  qword_1001C3EF8 = objc_opt_new();

  return _objc_release_x1();
}

void sub_10005B70C(id a1)
{
  qword_1001C3F18 = (uint64_t)dispatch_queue_create("com.apple.dasd.aprsBiomeEventQueue", 0);

  _objc_release_x1();
}

id sub_10005B8A8(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendEvent:*(void *)(a1 + 40)];
}

id sub_10005BA10(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10005BA88;
  v3[3] = &unk_100176590;
  void v3[4] = *(void *)(a1 + 40);
  return [v1 pruneWithPredicateBlock:v3];
}

BOOL sub_10005BA88(uint64_t a1, void *a2, unsigned char *a3)
{
  [a2 timestamp];
  double v6 = *(double *)(a1 + 32);
  if (v5 >= v6) {
    *a3 = 1;
  }
  return v5 < v6;
}

id sub_10005BC38(uint64_t a1)
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2050000000;
  uint64_t v2 = (void *)qword_1001C3F38;
  uint64_t v10 = qword_1001C3F38;
  if (!qword_1001C3F38)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10005C7B8;
    v6[3] = &unk_100175628;
    void v6[4] = &v7;
    sub_10005C7B8((uint64_t)v6);
    uint64_t v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  BOOL v4 = [v3 predictor];
  *(void *)(*(void *)(a1 + 32) + 32) = [v4 historicalClassification];

  return [*(id *)(a1 + 40) setInteger:*(void *)(*(void *)(a1 + 32) + 32) forKey:@"drainBehavior"];
}

void sub_10005BD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10005BD94(id a1)
{
  qword_1001C3F28 = objc_opt_new();

  _objc_release_x1();
}

id sub_10005C134(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidatePrewarmAssertionForApplication:*(void *)(a1 + 40)];
}

void sub_10005C684(uint64_t a1)
{
  id v4 = +[_APRSMetricRecorder sharedInstance];
  uint64_t v2 = [*(id *)(a1 + 32) bundle];
  id v3 = [v2 identifier];
  [v4 endEventForApp:v3 pid:[*(id *)(a1 + 32) pid] forEvent:0];
}

Class sub_10005C7B8(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1001C3F40)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10005C8FC;
    v4[4] = &unk_1001753E0;
    v4[5] = v4;
    long long v5 = off_1001765F8;
    uint64_t v6 = 0;
    qword_1001C3F40 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1001C3F40)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("_OSBatteryDrainPredictor");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_1000F6564();
LABEL_8:
    free(v2);
  }
  qword_1001C3F38 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10005C8FC()
{
  uint64_t result = _sl_dlopen();
  qword_1001C3F40 = result;
  return result;
}

uint64_t sub_10005CBBC(uint64_t a1)
{
  qword_1001C3F50 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

uint64_t sub_10005D4E4(uint64_t a1)
{
  uint64_t v2 = +[_CDClientContext userContext];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  long long v5 = *(void **)(a1 + 32);
  id v4 = (id *)(a1 + 32);
  [v5 setWifiPredictionTimeline:v3];

  uint64_t v6 = +[_DASDaemonLogger logForCategory:@"predictions"];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000F6664(v4, v6);
  }

  uint64_t v7 = [*v4 wifiPredictionTimeline];
  +[_DASPredictionManager setPrediction:v7 forKey:@"wifiPredictions"];

  double v8 = +[_DASPLLogger sharedInstance];
  uint64_t v9 = [*v4 wifiPredictionTimeline];
  [v8 recordPrediction:v9 key:@"wiFiAssociatedPrediction" valueMultiplier:1];

  return 1;
}

uint64_t sub_10005D5F8(uint64_t a1)
{
  uint64_t v2 = +[_CDClientContext userContext];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  long long v5 = *(void **)(a1 + 32);
  id v4 = (id *)(a1 + 32);
  [v5 setCellPredictionTimeline:v3];

  uint64_t v6 = +[_DASDaemonLogger logForCategory:@"predictions"];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000F66F4(v4, v6);
  }

  uint64_t v7 = [*v4 cellPredictionTimeline];
  +[_DASPredictionManager setPrediction:v7 forKey:@"cellPredictions"];

  double v8 = +[_DASPLLogger sharedInstance];
  uint64_t v9 = [*v4 cellPredictionTimeline];
  [v8 recordPrediction:v9 key:@"cellQualityPrediction" valueMultiplier:1];

  return 1;
}

id sub_10005D934(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadCTInformationWithSDM:0];
}

void sub_10005E570(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  uint64_t v7 = v6;
  if (v5 && !v6)
  {
    double v8 = [objc_alloc((Class)CTBundle) initWithBundleType:1];
    id v9 = v5;
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(v10 + 104);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10005E818;
    v17[3] = &unk_100176648;
    v17[4] = v10;
    [v11 copyCarrierBundleValue:v9 key:@"ManagedHours" bundleType:v8 completion:v17];
    if (!*(unsigned char *)(a1 + 40))
    {
LABEL_18:

      goto LABEL_19;
    }
    unsigned int v12 = +[CTServiceDescriptor descriptorWithSubscriptionContext:v9];
    if (v12)
    {
      *(unsigned char *)(*(void *)(a1 + 32) + 9) = [*(id *)(*(void *)(a1 + 32) + 104) smartDataMode:v12 error:0];
      double v13 = +[_DASDaemonLogger logForCategory:@"carrierBundle"];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(*(void *)(a1 + 32) + 9)) {
          CFStringRef v14 = @"enabled";
        }
        else {
          CFStringRef v14 = @"disabled";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v19 = v14;
        unsigned int v15 = "Smart data mode is %@";
        goto LABEL_16;
      }
    }
    else
    {
      double v13 = +[_DASDaemonLogger logForCategory:@"carrierBundle"];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v19 = @"Service Descriptor is nil.";
        unsigned int v15 = "Error getting service descriptor: %@";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      }
    }

    goto LABEL_18;
  }
  double v8 = +[_DASDaemonLogger logForCategory:@"carrierBundle"];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v16 = @"Context is nil.";
    if (v7) {
      CFStringRef v16 = v7;
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v19 = v16;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error getting preferred data subscription: %@", buf, 0xCu);
  }
LABEL_19:
}

void sub_10005E818(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5 && (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), !v6) && (isKindOfClass & 1) != 0)
  {
    double v8 = *(void **)(a1 + 32);
    id v9 = +[NSDate date];
    [v8 parseCTCongestionHoursDictionary:v5 atDate:v9];
  }
  else
  {
    uint64_t v10 = +[_DASDaemonLogger logForCategory:@"carrierBundle"];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error copying carrier bundle value: %@", (uint8_t *)&v11, 0xCu);
    }

    [*(id *)(a1 + 32) clearOffPeakDiscountedHours];
  }
}

void sub_10005EA04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10005EA20(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      double v8 = +[_DASDaemonLogger logForCategory:@"networkQuality"];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1000F6784();
      }

      [v7 setPrivateNetworkCellConnection:0];
    }
    else
    {
      [WeakRetained setPrivateNetworkCellConnection:a2];
      if (a2)
      {
        id v9 = +[_DASDaemonLogger logForCategory:@"networkQuality"];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10[0] = 67109120;
          v10[1] = 1;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PNW Status: %u", (uint8_t *)v10, 8u);
        }
      }
    }
  }
}

void sub_10005EFC0(id a1)
{
  id v1 = objc_alloc_init(_DASNetworkQualityPolicy);
  uint64_t v2 = (void *)qword_1001C3F68;
  qword_1001C3F68 = (uint64_t)v1;

  id v3 = (void *)qword_1001C3F68;

  [v3 registerForPredictionChanges];
}

id sub_10006039C(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSystemConstraintsWithContext:*(void *)(a1 + 40)];
}

void sub_100060960(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t sub_100060E2C()
{
  qword_1001C3FB0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100060FB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100061A50(uint64_t a1)
{
  qword_1001C3FC0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100062414(id a1)
{
  qword_1001C3FD8 = objc_alloc_init(_DASRequiresPluggedInPolicy);

  _objc_release_x1();
}

void sub_1000626C4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) && !*(unsigned char *)(a1 + 57))
  {
    if (dword_1001C2D50 != 1)
    {
      [*(id *)(*(void *)(a1 + 40) + 88) setObject:*(void *)(a1 + 48) forKey:@"limitationsInEffectStart"];
      dword_1001C2D50 = 1;
    }
  }
  else if (dword_1001C2D50)
  {
    dword_1001C2D50 = 0;
    uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 88) objectForKey:@"limitationsInEffectStart"];
    if (v2)
    {
      [*(id *)(a1 + 48) timeIntervalSinceDate:v2];
      uint64_t v4 = (uint64_t)fmax(round(v3), 0.0);
      +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.plugin.limitationDuration" byCount:v4];
      uint64_t v5 = +[_DASDaemonLogger logForCategory:@"stats"];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = +[NSNumber numberWithDouble:(double)v4 / 60.0];
        *(_DWORD *)buf = 138412290;
        long long v52 = v6;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Limitations were in effect for %@ mins", buf, 0xCu);
      }
      [*(id *)(*(void *)(a1 + 40) + 88) removeObjectForKey:@"limitationsInEffectStart"];
    }
  }
  if (*(unsigned char *)(a1 + 57)) {
    BOOL v7 = dword_1001C2D54 == 1;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    [*(id *)(*(void *)(a1 + 40) + 88) setObject:*(void *)(a1 + 48) forKey:@"allowableDurationStart"];
    dword_1001C2D54 = 1;
    return;
  }
  if (!*(unsigned char *)(a1 + 57) && dword_1001C2D54)
  {
    dword_1001C2D54 = 0;
    double v8 = [*(id *)(*(void *)(a1 + 40) + 88) objectForKey:@"allowableDurationStart"];
    if (!v8)
    {
LABEL_47:

      return;
    }
    [*(id *)(a1 + 48) timeIntervalSinceDate:v8];
    uint64_t v10 = (uint64_t)fmax(round(v9), 0.0);
    p_vtable = &OBJC_METACLASS____DASPolicyResponseRationale.vtable;
    +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.das.plugin.allowableDuration" byCount:v10];
    id v12 = &OBJC_METACLASS____DASPolicyResponseRationale.vtable;
    double v13 = +[_DASDaemonLogger logForCategory:@"stats"];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      CFStringRef v14 = +[NSNumber numberWithDouble:(double)v10 / 60.0];
      *(_DWORD *)buf = 138412290;
      long long v52 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Allowable duration: %@ mins", buf, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 40) + 88) removeObjectForKey:@"allowableDurationStart"];
    unsigned int v15 = [*(id *)(*(void *)(a1 + 40) + 88) arrayForKey:@"dailyAllowableDurationStarts"];
    id v16 = [v15 mutableCopy];

    uint64_t v17 = [*(id *)(*(void *)(a1 + 40) + 88) arrayForKey:@"dailyAllowableDurations"];
    id v18 = [v17 mutableCopy];

    if (![v16 count])
    {
      long long v50 = v8;
      uint64_t v23 = +[NSArray arrayWithObjects:&v50 count:1];
      id v24 = [v23 mutableCopy];

      uint64_t v25 = +[NSNumber numberWithLongLong:v10];
      long long v49 = v25;
      uint64_t v26 = +[NSArray arrayWithObjects:&v49 count:1];
      id v27 = [v26 mutableCopy];

      id v16 = v24;
      id v18 = v27;
LABEL_46:
      [*(id *)(*(void *)(a1 + 40) + 88) setObject:v16 forKey:@"dailyAllowableDurationStarts"];
      [*(id *)(*(void *)(a1 + 40) + 88) setObject:v18 forKey:@"dailyAllowableDurations"];

      goto LABEL_47;
    }
    CFStringRef v19 = [v16 lastObject];
    [v8 timeIntervalSinceDate:v19];
    double v21 = v20;

    if (v21 <= 86400.0)
    {
      uint64_t v22 = [v18 lastObject];
      uint64_t v28 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", (char *)[v22 integerValue] + v10);
      [v18 setObject:v28 atIndexedSubscript:[v18 count] - 1];
    }
    else
    {
      [v16 addObject:v8];
      uint64_t v22 = +[NSNumber numberWithLongLong:v10];
      [v18 addObject:v22];
    }

    long long v29 = [v16 objectAtIndexedSubscript:0];
    [v8 timeIntervalSinceDate:v29];
    double v31 = v30;

    if (v31 <= 604800.0)
    {
LABEL_44:
      if ((unint64_t)[v16 count] >= 8)
      {
        [v16 removeObjectAtIndex:0];
        [v18 removeObjectAtIndex:0];
      }
      goto LABEL_46;
    }
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v32 = v18;
    id v33 = [v32 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v33)
    {
      id v34 = v33;
      uint64_t v35 = 0;
      uint64_t v36 = *(void *)v45;
      do
      {
        for (i = 0; i != v34; i = (char *)i + 1)
        {
          if (*(void *)v45 != v36) {
            objc_enumerationMutation(v32);
          }
          v35 += (uint64_t)[*(id *)(*((void *)&v44 + 1) + 8 * i) integerValue:v44];
        }
        id v34 = [v32 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v34);

      p_vtable = (void **)(&OBJC_METACLASS____DASPolicyResponseRationale + 24);
      if (v35 > 53999)
      {
        uint64_t v41 = 0;
        id v12 = &OBJC_METACLASS____DASPolicyResponseRationale.vtable;
LABEL_41:
        [*(id *)(a1 + 40) setDeficitProcessing:v41];
        [*(id *)(*(void *)(a1 + 40) + 88) setBool:v41 forKey:@"deficitProcessing"];
        long long v42 = [v12 + 447 logForCategory:@"stats"];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          unsigned int v43 = [*(id *)(a1 + 40) deficitProcessing];
          *(_DWORD *)buf = 67109120;
          LODWORD(v52) = v43;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Deficit Processing=%u", buf, 8u);
        }

        goto LABEL_44;
      }
      double v38 = (double)v35;
      id v12 = (void **)(&OBJC_METACLASS____DASPolicyResponseRationale + 24);
    }
    else
    {

      double v38 = 0.0;
    }
    long long v39 = [v12 + 447 logForCategory:@"stats" v44];
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      long long v40 = +[NSNumber numberWithDouble:v38 / 3600.0];
      *(_DWORD *)buf = 138412290;
      long long v52 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Allowable duration for last 7 days was %@ hours; allowing deficit processing",
        buf,
        0xCu);
    }
    uint64_t v41 = 1;
    [p_vtable + 187 setValue:1 forKey:@"com.apple.das.plugin.usersInDeficitProcessing"];
    goto LABEL_41;
  }
}

void sub_100063990(void *a1)
{
  id v3 = a1;
  if ([v3 state])
  {
    id v1 = [v3 error];
    id v2 = [v1 description];
    printf("Error: %s\n", (const char *)[v2 UTF8String]);
  }
  else
  {
    puts("Complete");
  }
}

void sub_100063CE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100064130(id a1)
{
  qword_1001C3FE8 = objc_alloc_init(_DASRequiresRestartPolicy);

  _objc_release_x1();
}

id sub_100064624(uint64_t a1)
{
  id v3 = +[NSCalendar currentCalendar];
  uint64_t v4 = [v3 components:96 fromDate:*(void *)(a1 + 32)];

  v10[0] = @"Default";
  uint64_t v5 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  v11[0] = v5;
  v10[1] = @"StartHour";
  id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 hour]);
  v11[1] = v6;
  _DWORD v10[2] = @"StartMinute";
  BOOL v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 minute]);
  v11[2] = v7;
  double v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:3];

  return v8;
}

void sub_100065918(id a1)
{
  qword_1001C3FF8 = objc_alloc_init(_DASThermalPolicy);

  _objc_release_x1();
}

id sub_1000666BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSystemConstraintsWithContext:*(void *)(a1 + 40)];
}

void sub_100066A28(id a1)
{
  qword_1001C4010 = (uint64_t)os_log_create("com.apple.aprs", "appResume.AppKillWriter");

  _objc_release_x1();
}

void sub_100066BEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100066D4C(id a1)
{
  qword_1001C4020 = objc_alloc_init(_APRSBiomeAppKillEventWriter);

  _objc_release_x1();
}

void sub_100066E70(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[RBSProcessPredicate predicateMatchingProcessTypeApplication];
  double v8 = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:&v8 count:1];
  [v3 setPredicates:v5];

  [v3 setEvents:1];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100066F94;
  v6[3] = &unk_100176810;
  id v7 = *(id *)(a1 + 32);
  [v3 setUpdateHandler:v6];
}

void sub_100066F94(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = [a4 exitEvent];
  double v8 = [v7 context];
  double v9 = [v7 process];
  id v10 = [v9 pid];

  int v11 = [v6 bundle];

  id v12 = [v11 identifier];
  double v13 = [v8 status];
  CFStringRef v14 = +[_APRSBiomeAppKillEvent eventWithAppBundleID:pid:exitReason:](_APRSBiomeAppKillEvent, "eventWithAppBundleID:pid:exitReason:", v12, v10, [v13 domain]);

  +[_APRSBiomeBase postEvent:v14];
  unsigned int v15 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_1000F6B14((uint64_t)v14, v15);
  }
}

void sub_100067E08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_100067E34(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained scheduler_activity];
    unsigned __int8 v7 = [v3 isEqual:v6];

    double v8 = qword_1001C4028;
    if (v7)
    {
      if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_INFO))
      {
        int v10 = 138543362;
        int v11 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "DAS told us to run %{public}@", (uint8_t *)&v10, 0xCu);
      }
      double v9 = +[_DASBGSystemTaskHelper sharedInstance];
      [v9 runActivity:v5];
    }
    else if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR))
    {
      sub_1000F6BF4();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR))
  {
    sub_1000F6B8C();
  }
}

void sub_100067F8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained scheduler_activity];
    unsigned __int8 v7 = [v3 isEqual:v6];

    if (v7)
    {
      id v8 = [v5 state];
      double v9 = qword_1001C4028;
      BOOL v10 = os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_INFO);
      if (v8 == (id)3)
      {
        if (v10)
        {
          int v14 = 138543362;
          unsigned int v15 = v5;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "DAS told us to suspend %{public}@", (uint8_t *)&v14, 0xCu);
        }
        id v11 = [v3 lastDenialValue];
        id v12 = [v5 scheduler_activity];
        [v12 setLastDenialValue:v11];

        double v13 = +[_DASBGSystemTaskHelper sharedInstance];
        [v13 suspendActivity:v5];
      }
      else if (v10)
      {
        int v14 = 138543362;
        unsigned int v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "DAS told us to suspend %{public}@, but task isn't running", (uint8_t *)&v14, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR))
    {
      sub_1000F6CC4();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR))
  {
    sub_1000F6C5C();
  }
}

id sub_100068428(uint64_t a1)
{
  return [*(id *)(a1 + 32) garbageCollectActivityDates];
}

void sub_1000699B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000699D4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000699E4(uint64_t a1)
{
}

BOOL sub_1000699EC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    unsigned __int8 v7 = +[_DASActivityDependency dependencyFromDescriptor:v4 withUID:*(unsigned int *)(a1 + 48)];
    BOOL v6 = v7 != 0;
    if (v7)
    {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7];
    }
    else
    {
      id v8 = (void *)qword_1001C4028;
      if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
        sub_1000F7478(a1, v8);
      }
    }
  }
  else
  {
    uint64_t v5 = (void *)qword_1001C4028;
    if (os_log_type_enabled((os_log_t)qword_1001C4028, OS_LOG_TYPE_ERROR)) {
      sub_1000F7514(a1, v5, (uint64_t)v4);
    }
    BOOL v6 = 0;
  }

  return v6;
}

void sub_10006B8F0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10006B928(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&a9, 8) = a1;
}

id sub_10006BF00(uint64_t a1)
{
  return [*(id *)(a1 + 32) setRecentTriggerEvent:0];
}

id sub_10006BF0C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setWaitingForInactivity:0];
}

void sub_10006BF18(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  if (!notify_get_state(token, &state64))
  {
    id v3 = *(void **)(a1 + 32);
    if (state64)
    {
      [v3 setRecentTriggerEvent:0];
      [*(id *)(a1 + 32) setWaitingForInactivity:0];
      *(unsigned char *)(*(void *)(a1 + 32) + 10) = 1;
      id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
      [v4 setBool:*(unsigned __int8 *)(*(void *)(a1 + 32) + 10) forKey:@"ignoreTH"];
    }
    else
    {
      [v3 handleTriggerEvent];
      *(unsigned char *)(*(void *)(a1 + 32) + 10) = 0;
      id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
      [v4 removeObjectForKey:@"ignoreTH"];
    }
  }
}

void sub_10006C1BC(id a1)
{
  qword_1001C4068 = objc_alloc_init(_DASThunderingHerdPolicy);

  _objc_release_x1();
}

void sub_10006C97C(id a1)
{
  qword_1001C4078 = objc_alloc_init(_DASUserRequestedBackupPolicy);

  _objc_release_x1();
}

void sub_10006CD38(id a1)
{
  qword_1001C4088 = objc_alloc_init(_DASBackgroundAppKillDemo);

  _objc_release_x1();
}

id sub_10006CEF4(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleNotification];
}

void sub_10006D2AC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(NSObject **)(v10 + 32);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006D394;
  v15[3] = &unk_100175C78;
  v15[4] = v10;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_async(v11, v15);
}

id sub_10006D394(uint64_t a1)
{
  return [*(id *)(a1 + 32) processUpdateHandlerWithMonitor:*(void *)(a1 + 40) withHandle:*(void *)(a1 + 48) withUpdate:*(void *)(a1 + 56)];
}

void sub_10006D3A4(void *a1, void *a2)
{
  uint64_t v5 = a1[4];
  id v3 = a2;
  id v4 = +[NSArray arrayWithObjects:&v5 count:1];
  [v3 setPredicates:v4, v5];

  [v3 setStateDescriptor:a1[5]];
  [v3 setUpdateHandler:a1[6]];
}

uint64_t sub_10006DE90()
{
  qword_1001C40A0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

uint64_t sub_10006F15C()
{
  qword_1001C40B0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

uint64_t sub_10006F63C()
{
  qword_1001C40C0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_10006F974(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() obtainActiveComplications];
  id v3 = [v2 mutableCopy];
  if ([*(id *)(*(void *)(a1 + 32) + 8) count])
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 8);
    id v5 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v20;
      do
      {
        id v8 = 0;
        do
        {
          if (*(void *)v20 != v7) {
            objc_enumerationMutation(v4);
          }
          [v3 removeObject:*(void *)(*((void *)&v19 + 1) + 8 * (void)v8), (void)v19];
          id v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v6);
    }
  }
  id v9 = [v3 copy:v19];
  uint64_t v10 = *(void *)(a1 + 32);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), v2);
  id v12 = +[_DASDaemonLogger logForCategory:@"complications"];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = *(void *)(v13 + 8);
    uint64_t v15 = *(void *)(v13 + 40);
    *(_DWORD *)buf = 138412546;
    uint64_t v24 = v14;
    __int16 v25 = 2112;
    uint64_t v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Active complications are %@ (Added: %@)", buf, 0x16u);
  }

  uint64_t v16 = +[NSDate date];
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = *(void **)(v17 + 32);
  *(void *)(v17 + 32) = v16;
}

void sub_10006FB68(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  dispatch_time_t v2 = dispatch_walltime(0, 2000000000);

  dispatch_source_set_timer(v1, v2, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
}

void sub_10006FBC0(uint64_t a1)
{
  uint64_t v1 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  dispatch_time_t v2 = dispatch_walltime(0, 2000000000);

  dispatch_source_set_timer(v1, v2, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
}

void sub_10006FC18(uint64_t a1)
{
  uint64_t v2 = [(id)objc_opt_class() obtainActiveComplications];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 8);
  *(void *)(v3 + _Block_object_dispose(&a9, 8) = v2;

  id v5 = +[_DASDaemonLogger logForCategory:@"complications"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    int v7 = 138412290;
    uint64_t v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Active complications are %@", (uint8_t *)&v7, 0xCu);
  }
}

id sub_10006FDC0(void *a1)
{
  id result = [*(id *)(a1[4] + 8) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_10006FEC4(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*(void *)(a1 + 40) + 8) containsObject:*(void *)(*((void *)&v7 + 1) + 8 * (void)v6) (void)v7]) *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1; {
        uint64_t v6 = (char *)v6 + 1;
        }
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void sub_1000700A4(void *a1)
{
  id v2 = +[NSDate date];
  if (*(void *)(a1[4] + 32))
  {
    id v4 = v2;
    [v2 timeIntervalSinceDate:];
    id v2 = v4;
    if (v3 < 300.0)
    {
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [*(id *)(a1[4] + 40) containsObject:a1[5]];
      id v2 = v4;
    }
  }
}

id sub_100070478(uint64_t a1)
{
  return [*(id *)(a1 + 32) reportBlockingAnalyticsAndReset];
}

id sub_100070780(uint64_t a1)
{
  id v2 = objc_opt_new();
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"bucket"];
  double v3 = [*(id *)(a1 + 40) policyName];
  [v2 setObject:v3 forKeyedSubscript:@"policyName"];

  id v4 = *(void **)(a1 + 56);
  uint64_t v5 = [*(id *)(a1 + 40) policyName];
  uint64_t v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 containsObject:v5]);
  [v2 setObject:v6 forKeyedSubscript:*(void *)(a1 + 48)];

  long long v7 = [*(id *)(a1 + 64) treatmentID];
  [v2 setObject:v7 forKeyedSubscript:@"treatmentID"];

  long long v8 = [*(id *)(a1 + 64) experimentID];
  [v2 setObject:v8 forKeyedSubscript:@"experimentID"];

  long long v9 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 64) deploymentID]);
  [v2 setObject:v9 forKeyedSubscript:@"deploymentID"];

  return v2;
}

void sub_1000712BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000712F4(uint64_t a1)
{
  id v2 = (void *)qword_1001C40D0;
  double v3 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)(a1 + 32) schedulingPriority]);
  id v5 = [v2 objectForKeyedSubscript:v3];

  if (v5)
  {
    id v4 = [*(id *)(a1 + 40) policyName];
    [v5 addObject:v4];
  }
}

void sub_1000713A4(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)qword_1001C40F0;
  qword_1001C40F0 = v1;

  [(id)qword_1001C40F0 setDateStyle:1];
  [(id)qword_1001C40F0 setTimeStyle:1];
  double v3 = (void *)qword_1001C40F0;
  id v4 = +[NSTimeZone localTimeZone];
  [v3 setTimeZone:v4];
}

void sub_1000719C8(id a1)
{
  qword_1001C4100 = objc_alloc_init(_DASActivityDependencyManager);

  _objc_release_x1();
}

void sub_100071B58(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = *(void **)(*(void *)(a1 + 32) + 8);
    id v4 = v2;
    id v5 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 count]);
    uint64_t v6 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    long long v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Refreshing %@ dependency groups with updated file protection: %@", buf, 0x16u);
  }
  long long v7 = +[NSMutableDictionary dictionary];
  long long v8 = *(void **)(*(void *)(a1 + 32) + 8);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100071D00;
  v15[3] = &unk_100176A20;
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 32);
  id v16 = v9;
  uint64_t v17 = v10;
  id v11 = v7;
  id v18 = v11;
  [v8 enumerateKeysAndObjectsUsingBlock:v15];
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 8);
  *(void *)(v12 + _Block_object_dispose(&a9, 8) = v11;
  id v14 = v11;
}

void sub_100071D00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([v6 isPersistenceAvailableWithFileProtection:*(void *)(a1 + 32)])
  {
    long long v7 = &off_100174E90;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      || (long long v7 = &off_100174E60, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v8 = [(__objc2_class *)*v7 groupFromPersistence:v5];
      uint64_t v10 = *(void **)(a1 + 48);
      id v9 = (void **)(a1 + 48);
      [v10 setObject:v8 forKeyedSubscript:v5];

      id v11 = *((void *)*(v9 - 1) + 3);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        sub_1000F7840(v9, v11, (uint64_t)v5);
      }
    }
    else
    {
      uint64_t v12 = *(NSObject **)(*(void *)(a1 + 40) + 24);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1000F78F4(v12);
      }
    }
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 40) + 24), OS_LOG_TYPE_DEBUG)) {
      sub_1000F7994();
    }
    [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:v5];
  }
}

void sub_100071EE0(uint64_t a1)
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v2 = [*(id *)(a1 + 32) dependencies];
  id v3 = [v2 countByEnumeratingWithState:&v26 objects:v37 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v27;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(v2);
        }
        long long v7 = [*(id *)(a1 + 40) queue_dependencyGroupCreateIfDoesNotExist:*(void *)(*((void *)&v26 + 1) + 8 * i)];
        [v7 handleActivitySubmission:*(void *)(a1 + 32)];
      }
      id v4 = [v2 countByEnumeratingWithState:&v26 objects:v37 count:16];
    }
    while (v4);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v8 = [*(id *)(a1 + 32) producedResultIdentifiers];
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v36 count:16];
  if (v9)
  {
    id v11 = v9;
    uint64_t v12 = *(void *)v23;
    *(void *)&long long v10 = 136315650;
    long long v21 = v10;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(void **)(*((void *)&v22 + 1) + 8 * (void)j);
        uint64_t v15 = [*(id *)(a1 + 32) name:v21];
        unsigned __int8 v16 = [v14 isEqualToString:v15];

        if ((v16 & 1) == 0)
        {
          uint64_t v17 = [*(id *)(a1 + 40) queue_checkedResultDependencyGroupForIdentifier:v14];
          id v18 = v17;
          if (v17)
          {
            [v17 registerProducer:*(void *)(a1 + 32) error:0];
          }
          else
          {
            long long v19 = *(NSObject **)(*(void *)(a1 + 40) + 24);
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              uint64_t v20 = *(void *)(a1 + 32);
              *(_DWORD *)buf = v21;
              double v31 = "-[_DASActivityDependencyManager addActivityToDependencyGroups:]_block_invoke";
              __int16 v32 = 2112;
              uint64_t v33 = v20;
              __int16 v34 = 2112;
              uint64_t v35 = v14;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: Tried to add %@ to a result dependency group (%@) but we could not create the group (persistence type conflict)", buf, 0x20u);
            }
          }
        }
      }
      id v11 = [v8 countByEnumeratingWithState:&v22 objects:v36 count:16];
    }
    while (v11);
  }
}

void sub_100072288(uint64_t a1)
{
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v2 = [*(id *)(a1 + 32) dependencies];
  id v3 = [v2 countByEnumeratingWithState:&v36 objects:v47 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v37;
    *(void *)&long long v4 = 136315650;
    long long v30 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(v2);
        }
        long long v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        id v9 = *(void **)(*(void *)(a1 + 40) + 8);
        long long v10 = [v8 identifier:v30];
        id v11 = [v9 objectForKeyedSubscript:v10];

        if (v11)
        {
          [v11 deregisterDependent:*(void *)(a1 + 32)];
        }
        else
        {
          uint64_t v12 = *(NSObject **)(*(void *)(a1 + 40) + 24);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = *(void **)(a1 + 32);
            id v14 = v12;
            uint64_t v15 = [v13 description];
            unsigned __int8 v16 = [v8 identifier];
            *(_DWORD *)buf = v30;
            long long v42 = "-[_DASActivityDependencyManager removeActivityFromDependencyGroups:]_block_invoke";
            __int16 v43 = 2112;
            long long v44 = v15;
            __int16 v45 = 2112;
            long long v46 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s: Unable to deregister consuming activity %@ from dependency group for %@; group does not exist",
              buf,
              0x20u);
          }
        }
      }
      id v5 = [v2 countByEnumeratingWithState:&v36 objects:v47 count:16];
    }
    while (v5);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v17 = [*(id *)(a1 + 32) producedResultIdentifiers];
  id v18 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v18)
  {
    id v20 = v18;
    uint64_t v21 = *(void *)v33;
    *(void *)&long long v19 = 136315650;
    long long v31 = v19;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v17);
        }
        long long v23 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
        long long v24 = [*(id *)(a1 + 40) queue_checkedResultDependencyGroupForIdentifier:v23, v31];
        long long v25 = v24;
        if (v24)
        {
          [v24 deregisterProducer:*(void *)(a1 + 32) error:0];
        }
        else
        {
          long long v26 = *(NSObject **)(*(void *)(a1 + 40) + 24);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            long long v27 = *(void **)(a1 + 32);
            long long v28 = v26;
            long long v29 = [v27 description];
            *(_DWORD *)buf = v31;
            long long v42 = "-[_DASActivityDependencyManager removeActivityFromDependencyGroups:]_block_invoke";
            __int16 v43 = 2112;
            long long v44 = v29;
            __int16 v45 = 2112;
            long long v46 = v23;
            _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s: Unable to deregister producing activity %@ from dependency group for %@; group does not exist",
              buf,
              0x20u);
          }
        }
      }
      id v20 = [v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v20);
  }
}

uint64_t sub_100072834(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100072844(uint64_t a1)
{
}

void sub_10007284C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v44;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v44 != v5) {
            objc_enumerationMutation(v2);
          }
          long long v7 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          long long v8 = *(void **)(a1 + 40);
          id v9 = [v7 identifier];
          long long v10 = [v8 dependencyForIdentifier:v9];

          if (!v10)
          {
            v49[0] = @"dependencyIdentifier";
            long long v23 = [v7 identifier];
            v49[1] = @"activityName";
            v50[0] = v23;
            long long v24 = [*(id *)(a1 + 40) description];
            v50[1] = v24;
            long long v25 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
            uint64_t v26 = +[NSError errorWithDomain:@"_DASActivityDependencyManagerErrorDomain" code:1 userInfo:v25];
            uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
            long long v28 = *(void **)(v27 + 40);
            *(void *)(v27 + 40) = v26;

            *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
            goto LABEL_24;
          }
          id v11 = *(void **)(a1 + 48);
          uint64_t v12 = [v7 identifier];
          uint64_t v13 = [v11 queue_checkedResultDependencyGroupForIdentifier:v12];

          if (!v13)
          {
            long long v29 = *(NSObject **)(*(void *)(a1 + 48) + 24);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              sub_1000F7BB0(a1 + 40, v29);
            }
            v47[0] = @"dependencyIdentifier";
            uint64_t v41 = [v7 identifier];
            v48[0] = v41;
            v47[1] = @"activityName";
            long long v30 = [*(id *)(a1 + 40) description];
            v48[1] = v30;
            v47[2] = @"knownType";
            long long v31 = *(void **)(*(void *)(a1 + 48) + 8);
            long long v32 = [v7 identifier];
            long long v33 = [v31 objectForKeyedSubscript:v32];
            long long v34 = [(id)objc_opt_class() description];
            long long v35 = v34;
            if (!v34)
            {
              long long v35 = +[NSNull null];
            }
            v48[2] = v35;
            v47[3] = @"attemptedType";
            long long v36 = [(id)objc_opt_class() description];
            v48[3] = v36;
            long long v37 = +[NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:4];
            uint64_t v38 = +[NSError errorWithDomain:@"_DASActivityDependencyManagerErrorDomain" code:4 userInfo:v37];
            uint64_t v39 = *(void *)(*(void *)(a1 + 56) + 8);
            long long v40 = *(void **)(v39 + 40);
            *(void *)(v39 + 40) = v38;

            if (!v34) {
            uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
            }
LABEL_23:
            *(unsigned char *)(v17 + 24) = 0;

            goto LABEL_24;
          }
          uint64_t v14 = *(void *)(a1 + 40);
          uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
          id obj = *(id *)(v15 + 40);
          unsigned __int8 v16 = [v13 reportActivity:v14 consumedResult:v7 error:&obj];
          objc_storeStrong((id *)(v15 + 40), obj);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v16;
          uint64_t v17 = *(void *)(*(void *)(a1 + 64) + 8);
          if (!*(unsigned char *)(v17 + 24) || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
            goto LABEL_23;
          }
        }
        id v4 = [v2 countByEnumeratingWithState:&v43 objects:v51 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_24:
  }
  else
  {
    CFStringRef v52 = @"activityName";
    id v18 = [*(id *)(a1 + 40) description];
    long long v53 = v18;
    long long v19 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    uint64_t v20 = +[NSError errorWithDomain:@"_DASActivityDependencyManagerErrorDomain" code:3 userInfo:v19];
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

void sub_100072F44(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v34 objects:v40 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v35;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v35 != v5) {
            objc_enumerationMutation(v2);
          }
          long long v7 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          long long v8 = *(void **)(a1 + 48);
          id v9 = [v7 identifier];
          long long v10 = [v8 queue_checkedResultDependencyGroupForIdentifier:v9];

          if (!v10)
          {
            uint64_t v20 = *(NSObject **)(*(void *)(a1 + 48) + 24);
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
              sub_1000F7CC8(a1 + 40, v20);
            }
            v38[0] = @"dependencyIdentifier";
            long long v32 = [v7 identifier];
            v39[0] = v32;
            v38[1] = @"activityName";
            uint64_t v21 = [*(id *)(a1 + 40) description];
            v39[1] = v21;
            v38[2] = @"knownType";
            long long v22 = *(void **)(*(void *)(a1 + 48) + 8);
            long long v23 = [v7 identifier];
            long long v24 = [v22 objectForKeyedSubscript:v23];
            long long v25 = [(id)objc_opt_class() description];
            uint64_t v26 = v25;
            if (!v25)
            {
              uint64_t v26 = +[NSNull null];
            }
            v39[2] = v26;
            v38[3] = @"attemptedType";
            uint64_t v27 = [(id)objc_opt_class() description];
            v39[3] = v27;
            long long v28 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
            uint64_t v29 = +[NSError errorWithDomain:@"_DASActivityDependencyManagerErrorDomain" code:4 userInfo:v28];
            uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
            long long v31 = *(void **)(v30 + 40);
            *(void *)(v30 + 40) = v29;

            if (!v25) {
            uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
            }
LABEL_21:
            *(unsigned char *)(v14 + 24) = 0;

            goto LABEL_22;
          }
          uint64_t v11 = *(void *)(a1 + 40);
          uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
          id obj = *(id *)(v12 + 40);
          unsigned __int8 v13 = [v10 reportActivity:v11 producedResult:v7 error:&obj];
          objc_storeStrong((id *)(v12 + 40), obj);
          *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v13;
          uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
          if (!*(unsigned char *)(v14 + 24) || *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
            goto LABEL_21;
          }
        }
        id v4 = [v2 countByEnumeratingWithState:&v34 objects:v40 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
  else
  {
    CFStringRef v41 = @"activityName";
    uint64_t v15 = [*(id *)(a1 + 40) description];
    long long v42 = v15;
    unsigned __int8 v16 = +[NSDictionary dictionaryWithObjects:&v42 forKeys:&v41 count:1];
    uint64_t v17 = +[NSError errorWithDomain:@"_DASActivityDependencyManagerErrorDomain" code:3 userInfo:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

void sub_1000733E0(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    long long v24 = "-[_DASActivityDependencyManager reportActivityDidFinishRunning:]_block_invoke";
    __int16 v25 = 2112;
    uint64_t v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s: Reporting activity did finish running for %@", buf, 0x16u);
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = (void *)(a1 + 40);
  uint64_t v5 = [*(id *)(a1 + 40) dependencies];
  id v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([v10 isActivityCompletionBased])
        {
          uint64_t v11 = *(void **)(a1 + 32);
          uint64_t v12 = [v10 identifier];
          unsigned __int8 v13 = [v11 queue_checkedCompletionDependencyGroupForIdentifier:v12];

          [v13 reportDependentActivityDidRun:*(void *)(a1 + 40)];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }

  uint64_t v14 = *(void **)(a1 + 32);
  uint64_t v15 = [*(id *)(a1 + 40) name];
  unsigned __int8 v16 = [v14 queue_checkedCompletionDependencyGroupForIdentifier:v15];

  if (v16)
  {
    [v16 reportTrackedActivityDidRun:*v4];
  }
  else
  {
    uint64_t v17 = *(NSObject **)(*(void *)(a1 + 32) + 24);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000F7DCC((uint64_t)v4, v17);
    }
  }
}

void sub_100073770(uint64_t a1)
{
  __int16 v25 = +[NSMutableSet set];
  id v2 = +[NSMutableSet set];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v24 = (id *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 32) dependencies];
  id v4 = [v3 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v4)
  {
    id v6 = v4;
    char v7 = 0;
    uint64_t v8 = *(void *)v27;
    *(void *)&long long v5 = 136315650;
    long long v23 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v3);
        }
        long long v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v11 = [*(id *)(a1 + 40) queue_dependencyGroupCreateIfDoesNotExist:v10, v23];
        unsigned __int8 v12 = [v11 isDependencySatisfiedForActivity:*(void *)(a1 + 32)];
        unsigned int v13 = [v10 isActivityCompletionBased];
        if (v12)
        {
          if (v13)
          {
            uint64_t v14 = *(NSObject **)(*(void *)(a1 + 40) + 24);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            {
              id v16 = *v24;
              *(_DWORD *)buf = v23;
              long long v31 = "-[_DASActivityDependencyManager areDependenciesSatisfiedFor:]_block_invoke";
              __int16 v32 = 2112;
              id v33 = v11;
              __int16 v34 = 2112;
              id v35 = v16;
              _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "%s: %@ is satisfied; overriding all dependencies on %@",
                buf,
                0x20u);
            }
            char v7 = 1;
          }
        }
        else
        {
          if (v13) {
            uint64_t v15 = v2;
          }
          else {
            uint64_t v15 = v25;
          }
          [v15 addObject:v10];
        }
      }
      id v6 = [v3 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v6);

    if (v7) {
      goto LABEL_27;
    }
  }
  else
  {
  }
  id v17 = [v2 count];
  long long v18 = [*v24 dependencies];
  id v19 = [v18 count];

  if (v17 == v19)
  {
    long long v20 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      sub_1000F7F68((uint64_t *)v24, (uint64_t)v2, v20);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
  else
  {
    if (![v25 count])
    {
LABEL_27:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_28;
    }
    long long v21 = *(NSObject **)(*(void *)(a1 + 40) + 24);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      id v22 = *v24;
      *(_DWORD *)buf = 136315906;
      long long v31 = "-[_DASActivityDependencyManager areDependenciesSatisfiedFor:]_block_invoke";
      __int16 v32 = 2112;
      id v33 = v22;
      __int16 v34 = 2112;
      id v35 = v25;
      __int16 v36 = 2112;
      long long v37 = v2;
      _os_log_debug_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "%s: %@ has unsatisfied result dependencies: %@, Unsatisfied activity completion dependencies: %@", buf, 0x2Au);
    }
  }
LABEL_28:
}

void sub_100073BE0(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v1 resetAccumulation];
}

void sub_100074340(uint64_t a1)
{
  [*(id *)(a1 + 32) queue_dependencyGroup:*(void *)(a1 + 40)];
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 resetAccumulation];
}

void sub_100074498(uint64_t a1)
{
  [*(id *)(a1 + 32) queue_dependencyGroup:*(void *)(a1 + 40)];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 dictionary];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_100074518(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_100074554()
{
  return v0;
}

void sub_100074560(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_100074580(id a1)
{
  id obja = +[_DASApplicationPolicy policyInstance];
  v101[0] = obja;
  v88 = +[_DASBootTimePolicy policyInstance];
  v101[1] = v88;
  v87 = +[_DASCallInProgressPolicy policyInstance];
  v101[2] = v87;
  v86 = +[_DASCPUUsagePolicy policyInstance];
  v101[3] = v86;
  v85 = +[_DASDeviceActivityPolicy policyInstance];
  v101[4] = v85;
  v84 = +[_DASNetworkQualityPolicy policyInstance];
  v101[5] = v84;
  v83 = +[_DASPhotosPolicy policyInstance];
  v101[6] = v83;
  v82 = +[_DASFileProtectionPolicy policyInstance];
  v101[7] = v82;
  v81 = +[_DASGroupSchedulingPolicy policyInstance];
  v101[8] = v81;
  v80 = +[_DASRequiresBuddyCompletePolicy policyInstance];
  v101[9] = v80;
  v79 = +[_DASRequiresRestartPolicy policyInstance];
  v101[10] = v79;
  v78 = +[_DASThermalPolicy policyInstance];
  v101[11] = v78;
  v77 = +[_DASResultDependencyPolicy policyInstance];
  v101[12] = v77;
  v76 = +[_DASFastPassPolicy policyInstance];
  v101[13] = v76;
  v75 = +[_DASLowPowerModePolicy policyInstance];
  v101[14] = v75;
  v74 = +[_DASCarPlayPolicy policyInstance];
  v101[15] = v74;
  v73 = +[_DASBatteryLevelPolicy policyInstance];
  v101[16] = v73;
  v72 = +[_DASRequiresPluggedInPolicy policyInstance];
  v101[17] = v72;
  v71 = +[_DASWidgetRefreshBudgetPolicy policyInstance];
  v101[18] = v71;
  v70 = +[_DASDataBudgetPolicy policyInstance];
  v101[19] = v70;
  v69 = +[_DASConsoleModePolicy policyInstance];
  v101[20] = v69;
  v68 = +[_DASUrgencyOverridePolicy policyInstance];
  v101[21] = v68;
  v67 = +[_DASDiskSpacePolicy policyInstance];
  v101[22] = v67;
  v66 = +[_DASEnergyBudgetPolicy policyInstance];
  v101[23] = v66;
  v65 = +[_DASMemoryPressurePolicy policyInstance];
  v101[24] = v65;
  v64 = +[_DASMotionStatePolicy policyInstance];
  v101[25] = v64;
  v63 = +[_DASCustomSystemConstraintsPolicy policyInstance];
  v101[26] = v63;
  v62 = +[_DASPeakPowerPressurePolicy policyInstance];
  v101[27] = v62;
  v61 = +[_DASUserRequestedBackupPolicy policyInstance];
  v101[28] = v61;
  v60 = +[_DASThunderingHerdPolicy policyInstance];
  v101[29] = v60;
  id v1 = +[_DASSmartPowerNapPolicy policyInstance];
  v101[30] = v1;
  uint64_t v2 = +[_DASInCarPolicy policyInstance];
  v101[31] = v2;
  uint64_t v3 = +[_DASViewfinderPolicy policyInstance];
  v101[32] = v3;
  uint64_t v4 = +[_DASRemoteWidgetBudgetPolicy policyInstance];
  v101[33] = v4;
  id v5 = +[_DASNetworkSynchronizationPolicy policyInstance];
  v101[34] = v5;
  id v6 = +[_DASRemoteDeviceWakePolicy policyInstance];
  v101[35] = v6;
  char v7 = +[_DASInternetSharingPolicy policyInstance];
  v101[36] = v7;
  uint64_t v8 = +[_DASDefaultPairedPolicy policyInstance];
  v101[37] = v8;
  id v9 = +[_DASRemoteDeviceNearbyPolicy policyInstance];
  v101[38] = v9;
  uint64_t v10 = +[_DASActivityRateLimitPolicy policyInstance];
  v101[39] = v10;
  uint64_t v11 = +[NSArray arrayWithObjects:v101 count:40];
  unsigned __int8 v12 = (void *)qword_1001C4110;
  qword_1001C4110 = v11;

  if (+[_DASConfig isiPhone] && _os_feature_enabled_impl())
  {
    unsigned int v13 = +[NSLocale currentLocale];
    uint64_t v14 = [v13 countryCode];
    unsigned int v15 = [v14 isEqualToString:@"US"];

    if (v15)
    {
      id v16 = [(id)qword_1001C4110 mutableCopy];
      id v17 = +[_DASEnvironmentalPolicy policyInstance];
      [v16 addObject:v17];

      id v18 = [v16 copy];
      id v19 = (void *)qword_1001C4110;
      qword_1001C4110 = (uint64_t)v18;
    }
  }
  if (+[_DASConfig isiPhone])
  {
    id v20 = [(id)qword_1001C4110 mutableCopy];
    long long v21 = +[_DASCPMModePolicy policyInstance];
    [v20 addObject:v21];

    id v22 = [v20 copy];
    long long v23 = (void *)qword_1001C4110;
    qword_1001C4110 = (uint64_t)v22;
  }
  long long v24 = +[UMUserManager sharedManager];
  unsigned int v25 = [v24 isMultiUser];

  if (v25)
  {
    id v26 = [(id)qword_1001C4110 mutableCopy];
    long long v27 = +[_DASBatteryLevelPolicy policyInstance];
    [v26 removeObject:v27];

    long long v28 = +[_DASLowPowerModePolicy policyInstance];
    [v26 removeObject:v28];

    long long v29 = +[_DASBootTimePolicy policyInstance];
    [v26 removeObject:v29];

    uint64_t v30 = +[_DASCPUUsagePolicy policyInstance];
    [v26 removeObject:v30];

    long long v31 = +[_DASMemoryPressurePolicy policyInstance];
    [v26 removeObject:v31];

    __int16 v32 = +[_DASThunderingHerdPolicy policyInstance];
    [v26 removeObject:v32];

    id v33 = [v26 copy];
    __int16 v34 = (void *)qword_1001C4110;
    qword_1001C4110 = (uint64_t)v33;
  }
  uint64_t v35 = +[NSMutableDictionary dictionary];
  __int16 v36 = (void *)qword_1001C4118;
  qword_1001C4118 = v35;

  uint64_t v37 = +[NSMutableDictionary dictionary];
  uint64_t v38 = (void *)qword_1001C4120;
  qword_1001C4120 = v37;

  long long v97 = 0u;
  long long v98 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  id obj = (id)qword_1001C4110;
  id v39 = [obj countByEnumeratingWithState:&v95 objects:v100 count:16];
  if (v39)
  {
    id v40 = v39;
    uint64_t v41 = 0;
    uint64_t v42 = *(void *)v96;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v96 != v42) {
          objc_enumerationMutation(obj);
        }
        long long v44 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        long long v45 = [v44 policyName];
        long long v46 = (void *)qword_1001C4118;
        long long v47 = +[NSNumber numberWithInt:(char *)i + v41];
        [v46 setObject:v45 forKeyedSubscript:v47];

        long long v48 = +[NSNumber numberWithInt:(char *)i + v41];
        long long v49 = (void *)qword_1001C4120;
        long long v50 = [v44 policyName];
        [v49 setObject:v48 forKeyedSubscript:v50];
      }
      id v40 = [obj countByEnumeratingWithState:&v95 objects:v100 count:16];
      uint64_t v41 = (v41 + i);
    }
    while (v40);
  }

  [(id)qword_1001C4118 setObject:@"Limitations" forKeyedSubscript:&off_100186F40];
  [(id)qword_1001C4118 setObject:@"Incompatibility" forKeyedSubscript:&off_100186F58];
  [(id)qword_1001C4118 setObject:@"Sysdiagnose" forKeyedSubscript:&off_100186F70];
  [(id)qword_1001C4118 setObject:@"Preemption" forKeyedSubscript:&off_100186F88];
  [(id)qword_1001C4120 setObject:&off_100186F40 forKeyedSubscript:@"Limitations"];
  [(id)qword_1001C4120 setObject:&off_100186F58 forKeyedSubscript:@"Incompatibility"];
  [(id)qword_1001C4120 setObject:&off_100186F70 forKeyedSubscript:@"Sysdiagnose"];
  [(id)qword_1001C4120 setObject:&off_100186F88 forKeyedSubscript:@"Preemption"];
  long long v51 = +[NSMutableArray array];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  id v52 = (id)qword_1001C4110;
  id v53 = [v52 countByEnumeratingWithState:&v91 objects:v99 count:16];
  if (v53)
  {
    id v54 = v53;
    uint64_t v55 = *(void *)v92;
    do
    {
      for (j = 0; j != v54; j = (char *)j + 1)
      {
        if (*(void *)v92 != v55) {
          objc_enumerationMutation(v52);
        }
        v57 = *(void **)(*((void *)&v91 + 1) + 8 * (void)j);
        if ([v57 conformsToProtocol:&OBJC_PROTOCOL____DASActivityPolicyPredicting]) {
          [v51 addObject:v57];
        }
      }
      id v54 = [v52 countByEnumeratingWithState:&v91 objects:v99 count:16];
    }
    while (v54);
  }

  uint64_t v58 = +[NSArray arrayWithArray:v51];
  v59 = (void *)qword_1001C4128;
  qword_1001C4128 = v58;
}

id sub_1000752D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_loadHistograms];
}

void sub_10007532C(id a1)
{
  qword_1001C4130 = objc_opt_new();

  _objc_release_x1();
}

int64_t sub_100075598(id a1, NSNumber *a2, NSNumber *a3)
{
  return [(NSNumber *)a3 compare:a2];
}

void sub_100075AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100076CEC(uint64_t a1, void *a2, void *a3)
{
  id v12 = a3;
  id v5 = a2;
  double v6 = 1.0;
  if ((uint64_t)[v12 integerValue] <= 999)
  {
    [v12 doubleValue];
    double v6 = v7 / 1000.0;
  }
  id v8 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v5 allowPlaceholder:0 error:0];

  id v9 = [v8 compatibilityObject];

  uint64_t v10 = [v9 bundleExecutable];
  if (v10)
  {
    uint64_t v11 = +[NSNumber numberWithDouble:v6];
    [*(id *)(a1 + 32) setObject:v11 forKeyedSubscript:v10];
  }
}

void sub_100077388(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  [a3 doubleValue];
  double v6 = v5;
  double v7 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v11];
  [v7 doubleValue];
  double v9 = v8 * 0.5 + v6 * 0.5;

  if (v9 <= 0.1)
  {
    [*(id *)(a1 + 40) setObject:&off_100186FA0 forKeyedSubscript:v11];
  }
  else
  {
    uint64_t v10 = +[NSNumber numberWithDouble:v9];
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v11];
  }
}

void sub_100077464(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  double v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

void sub_1000774EC(uint64_t a1, void *a2)
{
  id v4 = a2;
  uint64_t v3 = [[*(id *)(a1 + 32) objectForKeyedSubscript:];

  if (!v3) {
    [*(id *)(a1 + 32) setObject:&off_100186FA0 forKeyedSubscript:v4];
  }
}

id sub_1000775D4(uint64_t a1)
{
  [*(id *)(a1 + 32) _queue_loadHistograms];
  uint64_t v2 = [*(id *)(a1 + 32) _queue_computeScores];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 88);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 64);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updated Kill Histogram: %@", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 56) removeAllObjects];
  return [*(id *)(a1 + 32) _queue_updateHistograms];
}

void sub_10007788C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 updateModel];
  [v3 setTaskCompleted];
}

void sub_100077954(id a1)
{
}

id sub_100077DDC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_100077FD0(uint64_t a1)
{
  int v2 = memorystatus_control();
  if (v2 <= 0)
  {
    __int16 v32 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_1000F813C(v32);
    }
  }
  else
  {
    id v3 = (char *)malloc_type_malloc(v2, 0xF4FA71DBuLL);
    if ((int)memorystatus_control() <= 0)
    {
      id v33 = *(NSObject **)(*(void *)(a1 + 32) + 88);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        sub_1000F81C4(v33);
      }
    }
    else
    {
      uint64_t v38 = +[NSMutableArray array];
      unint64_t v5 = *((void *)v3 + 24);
      if (v5)
      {
        uint64_t v36 = 0;
        int v37 = 0;
        unint64_t v6 = 0;
        uint64_t v7 = 0;
        char v35 = 0;
        int v8 = 0;
        uint64_t v9 = v3 + 200;
        double v10 = 0.0;
        id v11 = &AnalyticsSendEvent_ptr;
        *(void *)&long long v4 = 138412290;
        long long v34 = v4;
        do
        {
          memcpy(__dst, v9, sizeof(__dst));
          if (__dst[10] && (__dst[5] & 0x1800000000) == 0)
          {
            id v12 = [v11[408] stringWithUTF8String:(char *)__dst + 4];
            if (v12)
            {
              if (!v7)
              {
                uint64_t v7 = mach_absolute_time();
                unsigned int v13 = +[NSDate date];

                [v13 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 104)];
                double v10 = v14;
                int v8 = v13;
                id v11 = &AnalyticsSendEvent_ptr;
              }
              [*(id *)(a1 + 32) secondsFrom:v7 until:__dst[25] v34];
              if (v15 <= v10)
              {
                double v16 = v15;
                if ((__dst[5] & 0x200000000) != 0)
                {
                  if ((__dst[5] & 0x400000000) != 0)
                  {
                    char v17 = 0;
                    v36 += __dst[30];
                  }
                  else
                  {
                    ++v37;
                    char v17 = 1;
                  }
                }
                else
                {
                  char v17 = 0;
                }
                id v18 = *(NSObject **)(*(void *)(a1 + 32) + 88);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  id v19 = v18;
                  [v8 dateByAddingTimeInterval:-v16];
                  v21 = id v20 = v8;
                  *(_DWORD *)buf = 138412546;
                  id v40 = v12;
                  __int16 v41 = 2112;
                  uint64_t v42 = v21;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ killed at %@", buf, 0x16u);

                  int v8 = v20;
                }
                if (HIDWORD(__dst[6]))
                {
                  id v22 = v8;
                  long long v23 = +[NSMutableDictionary dictionary];
                  [v23 setObject:v12 forKeyedSubscript:@"BundleID"];
                  long long v24 = +[NSNumber numberWithInt:LODWORD(__dst[0])];
                  [v23 setObject:v24 forKeyedSubscript:@"PID"];

                  unsigned int v25 = +[NSNumber numberWithUnsignedInt:HIDWORD(__dst[6])];
                  [v23 setObject:v25 forKeyedSubscript:@"Reason"];

                  id v26 = *(NSObject **)(*(void *)(a1 + 32) + 88);
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v40 = v12;
                    __int16 v41 = 1024;
                    LODWORD(v42) = HIDWORD(__dst[6]);
                    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Skipped %@ (%d)", buf, 0x12u);
                  }
                  [v38 addObject:v23];

                  int v8 = v22;
                }
                if ([*(id *)(a1 + 32) process:v12 inSet:*(void *)(a1 + 40)])
                {
                  if ((v17 & 1) == 0)
                  {
                    long long v27 = v8;
                    long long v28 = *(NSObject **)(*(void *)(a1 + 32) + 88);
                    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = v34;
                      id v40 = v12;
                      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Adding %@ to today's kill dictionary", buf, 0xCu);
                    }
                    long long v29 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKeyedSubscript:v12];
                    [v29 doubleValue];
                    long long v31 = +[NSNumber numberWithDouble:v30 + 1.0];
                    [*(id *)(*(void *)(a1 + 32) + 56) setObject:v31 forKeyedSubscript:v12];

                    char v35 = 1;
                    int v8 = v27;
                  }
                }
                else
                {
                  [*(id *)(*(void *)(a1 + 32) + 72) addObject:v12];
                }
                id v11 = &AnalyticsSendEvent_ptr;
              }
            }

            unint64_t v5 = *((void *)v3 + 24);
          }
          ++v6;
          v9 += 280;
        }
        while (v6 < v5);
      }
      else
      {
        int v8 = 0;
        char v35 = 0;
        uint64_t v36 = 0;
        int v37 = 0;
      }
      free(v3);
      +[_DASMetricRecorder setValue:v36 forKey:@"com.apple.dasd.swap.goodfreezecount"];
      +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.dasd.swap.badfreezecount" byCount:v37];
      if (v35)
      {
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), v8);
        [*(id *)(a1 + 32) _queue_updateHistograms];
        [*(id *)(*(void *)(a1 + 32) + 80) logFreezerSkipReasons:v38];
      }
    }
  }
}

void sub_100078674(uint64_t a1)
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  int v2 = [*(id *)(a1 + 32) _queue_computeScores];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000787AC;
  v6[3] = &unk_100176B88;
  void v6[4] = v7;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000787E8;
  v3[3] = &unk_100176BB0;
  id v4 = *(id *)(a1 + 40);
  unint64_t v5 = v7;
  [v2 enumerateKeysAndObjectsUsingBlock:v3];

  _Block_object_dispose(v7, 8);
}

void sub_100078794(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

double sub_1000787AC(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 doubleValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

void sub_1000787E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 doubleValue];
  id v7 = +[NSNumber numberWithDouble:v6 / *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

Class sub_100078C88(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1001C4158)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100078DCC;
    v4[4] = &unk_1001753E0;
    v4[5] = v4;
    long long v5 = off_100176BD0;
    uint64_t v6 = 0;
    qword_1001C4158 = _sl_dlopen();
    int v2 = (void *)v4[0];
    if (!qword_1001C4158)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("ATXProactiveSuggestionConsumer");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    int v2 = (void *)sub_1000F824C();
LABEL_8:
    free(v2);
  }
  qword_1001C4150 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100078DCC()
{
  uint64_t result = _sl_dlopen();
  qword_1001C4158 = result;
  return result;
}

void sub_100078E94(id a1)
{
  qword_1001C4180 = +[_DKKnowledgeStore knowledgeStore];

  _objc_release_x1();
}

void sub_100078F74(uint64_t a1)
{
  if (!qword_1001C4170)
  {
    id v3 = [*(id *)(a1 + 32) sharedKnowledgeStore];
    uint64_t v1 = +[_DASPredictor predictorWithKnowledgeStore:v3 withQueue:0];
    int v2 = (void *)qword_1001C4170;
    qword_1001C4170 = v1;
  }
}

void sub_100079000(id a1)
{
  id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.duetactivityscheduler.predictionGenerationQueue", v3);
  int v2 = (void *)qword_1001C4198;
  qword_1001C4198 = (uint64_t)v1;
}

void sub_10007908C(id a1)
{
  uint64_t v1 = +[NSMutableDictionary dictionary];
  int v2 = (void *)qword_1001C4160;
  qword_1001C4160 = v1;

  qword_1001C4168 = +[NSMutableDictionary dictionary];

  _objc_release_x1();
}

void sub_10007914C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100079224(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000795B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000796C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000797C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100079864(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100079E2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id)os_transaction_create();
  [*(id *)(a1 + 32) storeProfileArrayToKnowledgeStore:v3];
}

void sub_100079F64(uint64_t a1)
{
  int v2 = qword_1001C41A8;
  if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
    sub_1000F8338(v2);
  }
  id v3 = objc_alloc_init(*(Class *)(a1 + 32));
  id v4 = (void *)qword_1001C41B8;
  qword_1001C41B8 = (uint64_t)v3;
}

void sub_10007C82C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10007C880(uint64_t a1, void *a2)
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = a2;
  id v3 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v29;
    uint64_t v6 = kUsageNetworkWiFiInBytes;
    uint64_t v7 = kUsageNetworkCellInBytes;
    uint64_t v8 = kUsageNetworkWiFiOutBytes;
    uint64_t v9 = kUsageNetworkCellOutBytes;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v12 = [v11 objectForKeyedSubscript:v6];
        [v12 doubleValue];
        *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                + 24);

        double v14 = [v11 objectForKeyedSubscript:v7];
        [v14 doubleValue];
        *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                + 24);

        double v16 = [v11 objectForKeyedSubscript:v8];
        [v16 doubleValue];
        *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v17
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                + 24);

        id v18 = [v11 objectForKeyedSubscript:v9];
        [v18 doubleValue];
        *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v19
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                + 24);
      }
      id v4 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v4);
  }
  id v20 = qword_1001C41A8;
  if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
    sub_1000F8C04(a1, v20, v21, v22, v23, v24, v25, v26);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10007CEF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_10007CF48(uint64_t a1, void *a2)
{
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = a2;
  id v3 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v29;
    uint64_t v6 = kUsageNetworkWiFiInBytes;
    uint64_t v7 = kUsageNetworkCellInBytes;
    uint64_t v8 = kUsageNetworkWiFiOutBytes;
    uint64_t v9 = kUsageNetworkCellOutBytes;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v29 != v5) {
          objc_enumerationMutation(obj);
        }
        id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v12 = [v11 objectForKeyedSubscript:v6];
        [v12 doubleValue];
        *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v13
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                + 24);

        double v14 = [v11 objectForKeyedSubscript:v7];
        [v14 doubleValue];
        *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 56) + 8)
                                                                                + 24);

        double v16 = [v11 objectForKeyedSubscript:v8];
        [v16 doubleValue];
        *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v17
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 64) + 8)
                                                                                + 24);

        id v18 = [v11 objectForKeyedSubscript:v9];
        [v18 doubleValue];
        *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v19
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 72) + 8)
                                                                                + 24);
      }
      id v4 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v4);
  }
  id v20 = qword_1001C41A8;
  if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_DEBUG)) {
    sub_1000F8E7C(a1, v20, v21, v22, v23, v24, v25, v26);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

unint64_t sub_10007D2EC()
{
  v4.tv_sec = 0;
  v4.tv_nsec = 0;
  int v0 = clock_gettime(_CLOCK_UPTIME_RAW, &v4);
  if (!v0) {
    return (v4.tv_nsec + 1000000000 * v4.tv_sec) / 0xF4240uLL;
  }
  int v1 = v0;
  int v2 = qword_1001C41A8;
  if (os_log_type_enabled((os_log_t)qword_1001C41A8, OS_LOG_TYPE_ERROR)) {
    sub_1000F908C(v1, v2);
  }
  return -1;
}

void sub_10007D4D8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_10007D510(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10007DBDC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = qword_1001C41D0;
  if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    CFStringRef v7 = @"com.apple.dasd.closureOnBoot";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Run task %@", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(a1 + 32) buildClosuresOnBootWithTask:v3];
}

void sub_10007DCB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = qword_1001C41D0;
  if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    CFStringRef v7 = @"com.apple.dasd.closureOpportunistic";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Run task %@", (uint8_t *)&v6, 0xCu);
  }
  [*(id *)(a1 + 32) buildClosuresOpportunisticWithTask:v3];
}

void sub_10007E3FC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10007E434(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

void sub_10007F120(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10007F180(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

uint64_t sub_10007F194(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  CFStringRef v7 = [v5 objectForKeyedSubscript:a2];
  [v7 doubleValue];
  double v9 = v8;
  uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  [v10 doubleValue];
  double v12 = v11;

  if (v9 <= v12) {
    return 1;
  }
  else {
    return -1;
  }
}

id sub_10007F228(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isDeletableApp:a2];
}

id sub_10007F234(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isUserInstalledApp:a2];
}

id sub_10007F518(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setWasDeferred:1];
}

void sub_10007F528(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  CFStringRef v7 = *(void **)(a1 + 32);
  [v5 signpostTimestamp];
  double v9 = v8;
  [v6 signpostTimestamp];
  double v11 = v10;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10007F614;
  v14[3] = &unk_100176D68;
  id v15 = v5;
  id v16 = v6;
  id v12 = v6;
  id v13 = v5;
  [v7 collectLaunchDataWithBootBatchTimestamp:v14 opportunisticBatchTimestamp:v9 completion:v11];
}

void sub_10007F614(uint64_t a1, void *a2, int a3, int a4, void *a5)
{
  id v9 = a2;
  uint64_t v43 = 0;
  long long v44 = &v43;
  uint64_t v45 = 0x2020000000;
  int v46 = 0;
  double v10 = &v39;
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  int v42 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x2020000000;
  int v38 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  void v29[2] = sub_10007FA74;
  v29[3] = &unk_100176D40;
  id v30 = *(id *)(a1 + 32);
  __int16 v32 = &v43;
  id v31 = *(id *)(a1 + 40);
  id v33 = &v39;
  long long v34 = &v35;
  [v9 enumerateKeysAndObjectsUsingBlock:v29];
  double v11 = (id)qword_1001C41D0;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    double v10 = [v9 allKeys];
    id v12 = [*(id *)(a1 + 32) bundleIDs];
    id v13 = [*(id *)(a1 + 40) bundleIDs];
    *(_DWORD *)buf = 138412802;
    *(void *)long long v48 = v10;
    *(_WORD *)&v48[8] = 2112;
    long long v49 = v12;
    __int16 v50 = 2112;
    long long v51 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Closures built: %@, onBoot: %@, batch2: %@", buf, 0x20u);
  }
  double v14 = (id)qword_1001C41C8;
  os_signpost_id_t v15 = os_signpost_id_generate((os_log_t)qword_1001C41C8);
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v10 = (uint64_t *)v15;
    if (os_signpost_enabled(v14))
    {
      if (a3) {
        int v16 = *((_DWORD *)v44 + 6);
      }
      else {
        int v16 = -1;
      }
      *(_DWORD *)buf = 67240192;
      *(_DWORD *)long long v48 = v16;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_EVENT, (os_signpost_id_t)v10, "DuetClosuresBeforeOnBoot", "appBundles=%{public, signpost.telemetry:number1}d enableTelemetry=YES ", buf, 8u);
    }
  }

  double v17 = (id)qword_1001C41C8;
  os_signpost_id_t v18 = os_signpost_id_generate((os_log_t)qword_1001C41C8);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v19 = v18;
    if (os_signpost_enabled(v17))
    {
      int v20 = a4 ? *((_DWORD *)v40 + 6) : -1;
      uint64_t v21 = *(void *)(a1 + 32);
      if (v21)
      {
        double v10 = [*(id *)(a1 + 32) bundleIDs];
        unsigned int v22 = [v10 count];
      }
      else
      {
        unsigned int v22 = -1;
      }
      *(_DWORD *)buf = 67240448;
      *(_DWORD *)long long v48 = v20;
      *(_WORD *)&void v48[4] = 1026;
      *(_DWORD *)&v48[6] = v22;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, v19, "DuetClosuresAfterOnBoot", "appBundles=%{public, signpost.telemetry:number1}d prewarmed=%{public, signpost.telemetry:number2}d enableTelemetry=YES ", buf, 0xEu);
      if (v21) {
    }
      }
  }

  uint64_t v23 = (id)qword_1001C41C8;
  os_signpost_id_t v24 = os_signpost_id_generate((os_log_t)qword_1001C41C8);
  if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v25 = v24;
    if (os_signpost_enabled(v23))
    {
      if (a5) {
        int v26 = *((_DWORD *)v36 + 6);
      }
      else {
        int v26 = -1;
      }
      long long v27 = *(void **)(a1 + 40);
      if (v27)
      {
        a5 = [v27 bundleIDs];
        unsigned int v28 = [a5 count];
      }
      else
      {
        unsigned int v28 = -1;
      }
      *(_DWORD *)buf = 67240448;
      *(_DWORD *)long long v48 = v26;
      *(_WORD *)&void v48[4] = 1026;
      *(_DWORD *)&v48[6] = v28;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, v25, "DuetClosuresAfterOpportunistic", "appBundles=%{public, signpost.telemetry:number1}d prewarmed=%{public, signpost.telemetry:number2}d enableTelemetry=YES ", buf, 0xEu);
      if (v27) {
    }
      }
  }

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v43, 8);
}

void sub_10007FA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_10007FA74(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 timeIntervalSince1970];
  double v7 = v6;
  [*(id *)(a1 + 32) signpostTimestamp];
  if (v7 >= v8 && *(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) signpostTimestamp];
    if (v7 >= v9 && *(void *)(a1 + 40))
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      double v10 = [*(id *)(a1 + 40) bundleIDs];
      unsigned int v11 = [v10 containsObject:v5];

      if (v11)
      {
        id v12 = qword_1001C41D0;
        if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          id v17 = v5;
          id v13 = "Closure built for %@, although prewarmed opportunistically";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, 0xCu);
        }
      }
    }
    else
    {
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      double v14 = [*(id *)(a1 + 32) bundleIDs];
      unsigned int v15 = [v14 containsObject:v5];

      if (v15)
      {
        id v12 = qword_1001C41D0;
        if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 138412290;
          id v17 = v5;
          id v13 = "Closure built for %@, although prewarmed on boot";
          goto LABEL_13;
        }
      }
    }
  }
  else
  {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  }
}

void sub_10007FECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 176), 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10007FF04(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 name];
  if (([v4 isEqualToString:@"ApplicationLaunchExtendedResponsive"] & 1) == 0)
  {
LABEL_19:

    goto LABEL_20;
  }
  id v5 = [v3 metadataSegments];
  id v6 = [v5 count];

  if ((unint64_t)v6 >= 2)
  {
    double v7 = (void *)qword_1001C41D0;
    if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_DEFAULT))
    {
      double v8 = v7;
      double v9 = [v3 processName];
      int v25 = 138412290;
      int v26 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Analyzing launch for %@", (uint8_t *)&v25, 0xCu);
    }
    double v10 = [v3 beginDate];
    [v10 timeIntervalSince1970];
    double v12 = v11;

    if (v12 >= *(double *)(a1 + 64)) {
      uint64_t v13 = v12 >= *(double *)(a1 + 72) ? *(void *)(a1 + 56) : *(void *)(a1 + 48);
    }
    else {
      uint64_t v13 = *(void *)(a1 + 40);
    }
    *(unsigned char *)(*(void *)(v13 + 8) + 24) = 1;
    double v14 = [v3 number2Value];
    unsigned __int8 v15 = [v14 intValue];

    if ((v15 & 4) != 0)
    {
      int v16 = [v3 processImagePath];

      if (v16)
      {
        id v17 = [v3 processImagePath];
        os_signpost_id_t v18 = [v17 stringByDeletingLastPathComponent];
        uint64_t v4 = +[NSURL fileURLWithPath:v18];

        id v19 = [objc_alloc((Class)LSApplicationRecord) initWithURL:v4 allowPlaceholder:0 error:0];
        int v20 = [v19 bundleIdentifier];
        if (v20)
        {
          uint64_t v21 = [v3 beginDate];
          [*(id *)(a1 + 32) setObject:v21 forKeyedSubscript:v20];
        }
        else
        {
          uint64_t v23 = (void *)qword_1001C41D0;
          if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_ERROR)) {
            sub_1000F92A8(v23, v3);
          }
        }

        goto LABEL_19;
      }
      unsigned int v22 = (void *)qword_1001C41D0;
      if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_ERROR)) {
        sub_1000F920C(v22, v3);
      }
    }
  }
LABEL_20:

  return 1;
}

void sub_1000801A8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v5 && os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_ERROR)) {
    sub_1000F9344();
  }
}

void sub_1000804C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000804EC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000804FC(uint64_t a1)
{
}

uint64_t sub_100080504(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 name];
  unsigned int v5 = [v4 isEqualToString:@"DuetClosuresPrewarm"];

  if (v5)
  {
    id v6 = [v3 metadataSegments];
    double v7 = [v6 firstObject];
    double v8 = [v7 argument];
    double v9 = [v8 argumentObject];

    if (objc_opt_respondsToSelector())
    {
      id v10 = [v9 performSelector:"BOOLValue"];
      double v11 = [v3 metadataSegments];
      double v12 = [v11 lastObject];
      uint64_t v13 = [v12 argument];
      double v14 = [v13 argumentObject];

      if (objc_opt_respondsToSelector())
      {
        unsigned __int8 v15 = [v14 performSelector:"componentsSeparatedByString:" withObject:@","];
        if ([v15 count] == (id)1)
        {
          int v16 = [v15 firstObject];
          unsigned int v17 = [&stru_100179948 isEqualToString:v16];

          if (v17)
          {

            unsigned __int8 v15 = 0;
          }
        }
        os_signpost_id_t v18 = objc_opt_new();
        [v18 setBundleIDs:v15];
        id v19 = [v3 beginDate];
        [v19 timeIntervalSince1970];
        [v18 setSignpostTimestamp:];

        if (v10) {
          uint64_t v20 = a1[5];
        }
        else {
          uint64_t v20 = a1[6];
        }
        uint64_t v21 = *(void *)(v20 + 8);
        unsigned int v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v18;
      }
    }
  }
  uint64_t v23 = [*(id *)(a1[4] + 8) wasDeferred] ^ 1;

  return v23;
}

void sub_100080700(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v5)
  {
    double v7 = qword_1001C41D0;
    if (os_log_type_enabled((os_log_t)qword_1001C41D0, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Error processing prewarming signposts: %@, %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

uint64_t sub_1000809D4(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

uint64_t sub_100080A8C()
{
  qword_1001C41D8 = objc_opt_new();

  return _objc_release_x1();
}

id sub_100080DB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) handlePLBackgroundProcessingNotification];
}

id sub_1000811B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) logFeatureAvailability:*(void *)(a1 + 40) forFeature:*(void *)(a1 + 48)];
}

id sub_10008171C(uint64_t a1)
{
  v13[0] = @"FeatureCode";
  int v2 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  v14[0] = v2;
  v13[1] = @"WorkloadSize";
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3;
  if (!v3)
  {
    uint64_t v4 = +[NSNull null];
  }
  v14[1] = v4;
  v13[2] = @"OSUpdateType";
  id v5 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 72)];
  v14[2] = v5;
  v13[3] = @"TimeSinceOSUpdate";
  double v6 = *(double *)(a1 + 48);
  if (v6 > 0.0) {
    +[NSNumber numberWithDouble:v6 / 3600.0];
  }
  else {
  double v7 = +[NSNull null];
  }
  v14[3] = v7;
  void v13[4] = @"FeatureState";
  int v8 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  void v14[4] = v8;
  v13[5] = @"InferredCarry";
  id v9 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 73)];
  v14[5] = v9;
  v13[6] = @"FeatureUsage";
  __int16 v10 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  v14[6] = v10;
  id v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:7];

  if (!v3) {

  }
  return v11;
}

void sub_100081B14(uint64_t a1)
{
  int v2 = +[_DASPostRestoreBUILogger sharedInstance];
  [v2 reportState:*(void *)(a1 + 48) forActivity:*(void *)(a1 + 32)];

  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = [*(id *)(a1 + 32) name];
  [v4 sendTaskCheckpoint:v3 forTask:v5 error:*(void *)(a1 + 56)];
}

void sub_100081D7C(void *a1)
{
  [*(id *)(a1[4] + 64) setObject:a1[6] forKeyedSubscript:a1[5]];
  id v2 = +[NSNumber numberWithInteger:a1[7]];
  [*(id *)(a1[4] + 72) setObject:v2 forKeyedSubscript:a1[5]];
}

void sub_100081F5C(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 64) allKeys];
  uint64_t v3 = +[NSMutableSet setWithArray:v2];

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 72) allKeys];
  id v5 = +[NSSet setWithArray:v4];
  [v3 unionSet:v5];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      __int16 v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v10);
        double v12 = +[NSMutableDictionary dictionary];
        [v12 setObject:v11 forKeyedSubscript:@"TaskName"];
        uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 64) objectForKeyedSubscript:v11];
        [v12 setObject:v13 forKeyedSubscript:@"FeatureCodes"];

        double v14 = [*(id *)(*(void *)(a1 + 32) + 72) objectForKeyedSubscript:v11];
        [v12 setObject:v14 forKeyedSubscript:@"Version"];

        if (([*(id *)(a1 + 32) sendDataToPPS:v12 subsystem:@"BackgroundProcessing" category:@"TaskFeatureCodes"] & 1) == 0)
        {
          unsigned __int8 v15 = *(NSObject **)(*(void *)(a1 + 32) + 48);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            sub_1000F944C(v15);
          }

          goto LABEL_13;
        }

        __int16 v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  [*(id *)(*(void *)(a1 + 32) + 64) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 72) removeAllObjects];
LABEL_13:
}

void sub_10008266C(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:@"availableStatus"];
  id v3 = [v2 mutableCopy];
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 80);
  *(void *)(v4 + 80) = v3;

  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(void *)(v6 + 80))
  {
    [(id)v6 populateFeatureStatusFromPast];
    uint64_t v6 = *(void *)(a1 + 32);
  }
  id v7 = [*(id *)(v6 + 56) objectForKey:@"availableStatus"];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v8 = [v7 allKeys];
  id v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v28;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        double v14 = [v7 objectForKeyedSubscript:v13];
        [*(id *)(a1 + 32) reportFeatureStatus:50 forFeature:[v13 integerValue] statusChangedDate:v14 error:0];
      }
      id v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v10);
  }

  unsigned __int8 v15 = [*(id *)(*(void *)(a1 + 32) + 56) objectForKey:@"previewAvailableStatus"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v16 = [v15 allKeys];
  id v17 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
        unsigned int v22 = [v15 objectForKeyedSubscript:v21];
        [*(id *)(a1 + 32) reportFeatureStatus:30 forFeature:[v21 integerValue] statusChangedDate:v22 error:0];
      }
      id v18 = [v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }
}

void sub_1000829DC(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2)
  {
    id v3 = v2;
  }
  else
  {
    id v3 = +[NSSet set];
  }
  uint64_t v4 = v3;
  id v5 = (void *)a1[5];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    id v6 = +[NSSet set];
  }
  id v7 = v6;
  v9[0] = v4;
  v9[1] = v6;
  id v8 = +[NSArray arrayWithObjects:v9 count:2];
  [*(id *)(a1[6] + 96) setObject:v8 forKeyedSubscript:a1[7]];
}

void sub_100082B58(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 reportFeatureStatus];
  [v3 setTaskCompleted];
}

void sub_100082C48(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 reportFeatureCodesForTasks];
  [*(id *)(a1 + 32) reportDependencyInfoForTasks];
  [v4 setTaskCompleted];
}

void sub_100082D1C(uint64_t a1)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 96);
  id v2 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v17;
    while (2)
    {
      id v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v5);
        id v7 = +[NSMutableDictionary dictionary];
        [v7 setObject:v6 forKeyedSubscript:@"TaskName"];
        id v8 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:v6];
        id v9 = [v8 objectAtIndexedSubscript:0];
        id v10 = [v9 allObjects];
        [v7 setObject:v10 forKeyedSubscript:@"ProducedResultIdentifiers"];

        uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 96) objectForKeyedSubscript:v6];
        double v12 = [v11 objectAtIndexedSubscript:1];
        uint64_t v13 = [v12 allObjects];
        [v7 setObject:v13 forKeyedSubscript:@"DependencyIdentifiers"];

        if (([*(id *)(a1 + 32) sendDataToPPS:v7 subsystem:@"BackgroundProcessing" category:@"TaskDependencies"] & 1) == 0)
        {
          double v14 = *(NSObject **)(*(void *)(a1 + 32) + 48);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            sub_1000F95C8(v14);
          }

          return;
        }

        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  [*(id *)(*(void *)(a1 + 32) + 96) removeAllObjects];
}

uint64_t sub_1000832C4()
{
  objc_opt_class();
  qword_1001C41F0 = objc_opt_new();

  return _objc_release_x1();
}

void sub_100083B74(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[RBSProcessPredicate predicateMatchingProcessTypeApplication];
  id v8 = v4;
  id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  [v3 setPredicates:v5];

  [v3 setStateDescriptor:*(void *)(a1 + 32)];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000111B4;
  v6[3] = &unk_100176810;
  id v7 = *(id *)(a1 + 40);
  [v3 setUpdateHandler:v6];
}

void sub_100083D08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100083D8C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100083DF4(id a1)
{
  qword_1001C4200 = objc_opt_new();

  _objc_release_x1();
}

uint64_t sub_1000843C4(uint64_t a1)
{
  qword_1001C4218 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_100084D38(uint64_t a1, void *a2)
{
  uint64_t v3 = kSymptomDiagnosticReplySuccess;
  id v4 = a2;
  id v5 = [v4 objectForKeyedSubscript:v3];
  unsigned int v6 = [v5 BOOLValue];

  if (v6)
  {
    id v7 = [v4 objectForKeyedSubscript:kSymptomDiagnosticReplySessionID];

    id v8 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000F9754((uint64_t)v7, a1, v8);
    }
  }
  else
  {
    id v9 = [v4 objectForKeyedSubscript:kSymptomDiagnosticReplyReason];

    int v10 = [v9 intValue];
    uint64_t v11 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000F97E0(v10, a1, v11);
    }
  }
}

void sub_10008522C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void sub_10008526C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v1 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Asked to defer significantly overdue check", v2, 2u);
  }
}

void sub_1000853CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG)) {
    sub_1000F994C();
  }
  [(id)objc_opt_class() checkAllTasksForBGSystemTask:v3];
}

void sub_100085430(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_1000864D8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100086574;
  v8[3] = &unk_100177010;
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v8];
}

void sub_100086574(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if ([*(id *)(a1 + 40) convertBiomeStream:a2 toKnowledgeStoreStream:v5])
  {
    uint64_t v6 = [(id)qword_1001C4240 objectForKeyedSubscript:*(void *)(a1 + 32)];
    id v7 = [v6 mutableCopy];

    id v8 = +[_DKEventStream eventStreamWithName:v5];
    [v7 addObject:v8];

    [(id)qword_1001C4240 setObject:v7 forKeyedSubscript:*(void *)(a1 + 32)];
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
      sub_1000F9B6C();
    }
  }
}

void sub_1000871A0(_Unwind_Exception *a1)
{
}

uint64_t sub_10008721C(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = (byte_1001C4250 & 1) == 0;
  return result;
}

id sub_10008723C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_10008898C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

_DKEvent *__cdecl sub_1000889BC(id a1, BMStoreEvent *a2)
{
  id v2 = [(BMStoreEvent *)a2 eventBody];
  id v3 = [v2 dkEvent];

  return (_DKEvent *)v3;
}

id sub_100088A0C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) evaluateWithObject:a2];
}

NSArray *__cdecl sub_100088A18(id a1, NSArray *a2, _DKEvent *a3)
{
  return [(NSArray *)a2 arrayByAddingObject:a3];
}

id sub_100088A20(id a1, BPSWindowerInput *a2)
{
  return [(BPSWindowerInput *)a2 aggregate];
}

void sub_100088A2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 mutableCopy];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v4 count];
  id v5 = [*(id *)(a1 + 64) processEvents:v4];
  id v13 = 0;
  uint64_t v6 = +[NSJSONSerialization dataWithJSONObject:v5 options:0 error:&v13];
  id v7 = v13;
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_ERROR)) {
      sub_1000FA574();
    }
  }
  else
  {
    [*(id *)(a1 + 64) extendJSONArrayWithAnotherArray:v6 toFileHandler:*(void *)(a1 + 32) isPreviouslyEmpty:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v5 count];
    id v8 = (id)qword_1001C4248;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = [*(id *)(a1 + 40) name];
      id v10 = [v4 count];
      id v11 = [v5 count];
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      *(_DWORD *)buf = 138413058;
      unsigned __int8 v15 = v9;
      __int16 v16 = 2048;
      id v17 = v10;
      __int16 v18 = 2048;
      id v19 = v11;
      __int16 v20 = 2048;
      uint64_t v21 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "writeStream: %@ : From %lu events, written %lu events, total written so far: %lu", buf, 0x2Au);
    }
  }
}

void sub_100088C30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, char a11)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(exception_object);
    id v13 = (id)qword_1001C4248;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      double v14 = [*(id *)(v11 + 40) name];
      sub_1000FA51C(v14, (uint64_t)v12, (uint64_t)&a11);
    }

    objc_end_catch();
    JUMPOUT(0x100088B60);
  }
  _Unwind_Resume(exception_object);
}

void sub_100089ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
}

int64_t sub_100089ADC(id a1, _DKEvent *a2, _DKEvent *a3)
{
  id v4 = a3;
  id v5 = [(_DKEvent *)a2 startDate];
  uint64_t v6 = [(_DKEvent *)v4 startDate];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_100089F80(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v5 = +[NSData dataWithBytesNoCopy:v2 length:v3 freeWhenDone:0];
  [v4 writeData:v5];
}

NSDate *sub_10008A000(void *a1)
{
  [a1 timeIntervalSince1970];
  double v2 = floor(v1 / 300.0) * 300.0;

  return +[NSDate dateWithTimeIntervalSince1970:v2];
}

void sub_10008A7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10008A7F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10008A808(uint64_t a1)
{
}

void sub_10008A810(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) saveObjects:*(void *)(a1 + 40) error:0];
  [*(id *)(a1 + 40) removeAllObjects];
  id v5 = qword_1001C4248;
  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
    sub_1000FAADC(a1, v5, v6);
  }
}

void sub_10008A890(uint64_t a1, void *a2)
{
  id v3 = a2;
  ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  id v18 = v3;
  id v5 = [v18 eventBody];
  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) eventBody];
  if ([v5 isStarting])
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
    id v8 = v18;
    id v9 = *(id *)(v7 + 40);
    *(void *)(v7 + 40) = v8;
    goto LABEL_10;
  }
  [v18 timestamp];
  id v10 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v11 = v10;
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    id v12 = [v5 modeSemanticType];
    if (v12 != [v6 modeSemanticType])
    {
      id v9 = v11;
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) timestamp];
      double v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      unsigned __int8 v15 = +[_DKEvent eventWithStream:startDate:endDate:categoryIntegerValue:metadata:](_DKEvent, "eventWithStream:startDate:endDate:categoryIntegerValue:metadata:", *(void *)(a1 + 32), v14, v14, [v6 modeSemanticType], 0);
      [*(id *)(a1 + 40) addObject:v15];

      goto LABEL_9;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) timestamp];
    +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = v10;
  }
  id v9 = v13;
LABEL_9:
  __int16 v16 = +[_DKEvent eventWithStream:startDate:endDate:categoryIntegerValue:metadata:](_DKEvent, "eventWithStream:startDate:endDate:categoryIntegerValue:metadata:", *(void *)(a1 + 32), v9, v11, [v5 modeSemanticType], 0);
  [*(id *)(a1 + 40) addObject:v16];

LABEL_10:
  if ((unint64_t)[*(id *)(a1 + 40) count] >= 0x21)
  {
    [*(id *)(a1 + 48) saveObjects:*(void *)(a1 + 40) error:0];
    [*(id *)(a1 + 40) removeAllObjects];
  }
}

id sub_10008ABE4(uint64_t a1, uint64_t a2, void *a3)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10008AC5C;
  v4[3] = &unk_100177230;
  v4[4] = *(void *)(a1 + 32);
  return [a3 enumerateKeysAndObjectsUsingBlock:v4];
}

id sub_10008AC5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteEventsFromStream:];
}

void sub_10008B040(uint64_t a1)
{
  double v2 = (void *)os_transaction_create();
  byte_1001C4250 = 1;
  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
    sub_1000FACE0();
  }
  [(id)objc_opt_class() loadParameters];
  id v4 = [(id)objc_opt_class() experimentsToWrite];
  if (os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG)) {
    sub_1000FAC78();
  }
  int v5 = [*(id *)(a1 + 32) writeExperiments:v4 atFileName:@"/var/mobile/Library/DuetActivityScheduler/dasd_data.json" withTask:0];
  BOOL v6 = os_log_type_enabled((os_log_t)qword_1001C4248, OS_LOG_TYPE_DEBUG);
  if (v5 < 1)
  {
    if (v6) {
      sub_1000FAC44();
    }
  }
  else if (v6)
  {
    sub_1000FABDC();
  }
  [*(id *)(a1 + 32) deleteConvertedStreams];

  byte_1001C4250 = 0;
}

void sub_10008B758(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 reportDataOnExperiments:v3];
  [v3 setTaskCompleted];
}

void sub_10008B7B0(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 reportWakeAnalytics:v3];
  [v3 setTaskCompleted];
}

void sub_10008B808(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 reportBackgroundAppRefreshAnalytics:v3];
  [v3 setTaskCompleted];
}

void sub_10008B860(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 identifier];
  [v2 reportAnalyticsForActivity:v3];

  [v4 setTaskCompleted];
}

void sub_10008B8C8(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 identifier];
  [v2 reportAnalyticsForActivity:v3];

  [v4 setTaskCompleted];
}

void sub_10008B930(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 identifier];
  [v2 reportAnalyticsForActivity:v3];

  [v4 setTaskCompleted];
}

void sub_10008B998(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 identifier];
  [v2 reportAnalyticsForActivity:v3];

  [v4 setTaskCompleted];
}

void sub_10008BA00(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 identifier];
  [v2 reportAnalyticsForActivity:v3];

  [v4 setTaskCompleted];
}

void sub_10008BA68(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 identifier];
  [v2 reportAnalyticsForActivity:v3];

  [v4 setTaskCompleted];
}

void sub_10008BAD0(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 identifier];
  [v2 reportAnalyticsForActivity:v3];

  [v4 setTaskCompleted];
}

void sub_10008BB38(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 identifier];
  [v2 reportAnalyticsForActivity:v3];

  [v4 setTaskCompleted];
}

void sub_10008BBA0(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 identifier];
  [v2 reportAnalyticsForActivity:v3];

  [v4 setTaskCompleted];
}

void sub_10008BC08(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 identifier];
  [v2 reportAnalyticsForActivity:v3];

  [v4 setTaskCompleted];
}

void sub_10008BC70(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 identifier];
  [v2 reportAnalyticsForActivity:v3];

  [v4 setTaskCompleted];
}

void sub_10008BCD8(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 identifier];
  [v2 reportAnalyticsForActivity:v3];

  [v4 setTaskCompleted];
}

void sub_10008BD40(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 identifier];
  [v2 reportAnalyticsForActivity:v3];

  [v4 setTaskCompleted];
}

void sub_10008BDA8(uint64_t a1, void *a2)
{
  double v2 = *(void **)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 identifier];
  [v2 reportAnalyticsForActivity:v3];

  [v4 setTaskCompleted];
}

id sub_10008C398(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10008C46C(uint64_t a1)
{
  CFStringRef v4 = @"backgroundKillEnabled";
  double v1 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 32)];
  int v5 = v1;
  double v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_10008CA18(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

Class sub_10008D6CC(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1001C4268)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10008D810;
    v4[4] = &unk_1001753E0;
    void v4[5] = v4;
    long long v5 = off_1001772B0;
    uint64_t v6 = 0;
    qword_1001C4268 = _sl_dlopen();
    double v2 = (void *)v4[0];
    if (!qword_1001C4268)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("OSIUtilities");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    double v2 = (void *)sub_1000FAF58();
LABEL_8:
    free(v2);
  }
  qword_1001C4260 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10008D810()
{
  uint64_t result = _sl_dlopen();
  qword_1001C4268 = result;
  return result;
}

void sub_10008D89C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_10008D8C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_10008D930(id a1)
{
  double v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_BACKGROUND, 0);

  dispatch_queue_t v2 = dispatch_queue_create("com.apple.dasscheduler.metricqueue", attr);
  id v3 = (void *)qword_1001C4278;
  qword_1001C4278 = (uint64_t)v2;
}

void sub_10008D9B4(uint64_t a1)
{
  dispatch_queue_t v2 = [*(id *)(a1 + 32) metricQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008DA84;
  v5[3] = &unk_1001773A8;
  v5[4] = *(void *)(a1 + 32);
  uint64_t v3 = +[_DASBatchingQueue queueWithName:@"metrics_recorder" maxBatchingDelay:50 maxQueueDepth:v2 queue:v5 workItemsHandler:1800.0];
  CFStringRef v4 = (void *)qword_1001C4288;
  qword_1001C4288 = v3;
}

id sub_10008DA84(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) aggregateAndPostCAEvents:a2];
}

id sub_10008DF74(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v5[1] = @"value";
  v6[0] = v1;
  v5[0] = @"key";
  dispatch_queue_t v2 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v6[1] = v2;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v6 forKeys:v5 count:2];

  return v3;
}

void sub_10008E564(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [*(id *)(a1 + 40) taskIdentifier];
  CFStringRef v4 = [v2 objectForKeyedSubscript:v3];

  if (!v4)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v7 = [v5 taskIdentifier];
    [v6 setObject:v5 forKeyedSubscript:v7];

    id v8 = +[NSMutableArray array];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

void sub_10008E70C(uint64_t a1)
{
  dispatch_queue_t v2 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [*(id *)(a1 + 40) taskIdentifier];
  CFStringRef v4 = [v2 objectForKeyedSubscript:v3];

  if (!v4)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = *(void **)(*(void *)(a1 + 32) + 16);
    uint64_t v7 = [v5 taskIdentifier];
    [v6 setObject:v5 forKeyedSubscript:v7];

    id v8 = +[NSMutableArray array];
    [*(id *)(*(void *)(a1 + 32) + 8) setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 16);
  id v10 = [*(id *)(a1 + 48) taskIdentifier];
  uint64_t v11 = [v9 objectForKeyedSubscript:v10];

  if (!v11)
  {
    id v12 = *(void **)(a1 + 48);
    id v13 = *(void **)(*(void *)(a1 + 32) + 16);
    double v14 = [v12 taskIdentifier];
    [v13 setObject:v12 forKeyedSubscript:v14];
  }
  id v15 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v15 addObject:*(void *)(a1 + 48)];
}

uint64_t sub_10008E96C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10008E97C(uint64_t a1)
{
}

uint64_t sub_10008E984(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];

  return _objc_release_x1();
}

uint64_t sub_10008F11C()
{
  qword_1001C4298 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_10008F7D4(id a1)
{
  uint64_t v1 = objc_opt_new();
  dispatch_queue_t v2 = (void *)qword_1001C42A8;
  qword_1001C42A8 = v1;

  uint64_t v3 = (void *)qword_1001C42A8;

  [v3 startRecording];
}

void sub_10008F924(void *a1, uint64_t a2, int a3)
{
  uint64_t v6 = (void *)os_transaction_create();
  if (a3 == -536723200) {
    [a1 handleBatteryNotification];
  }
}

id sub_100090888(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 objectForKeyedSubscript:a3];
  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  id v9 = [v7 compare:v8];
  return v9;
}

void sub_100090F58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  [a2 dk_dedup];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 integerValue];

  uint64_t v7 = 32;
  if (!v6) {
    uint64_t v7 = 40;
  }
  [*(id *)(a1 + v7) addObject:v8];
}

void sub_100091110(uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000911B8;
  void v11[3] = &unk_100175498;
  v11[4] = v1;
  [v3 enumerateKeysAndObjectsUsingBlock:v11];
  CFStringRef v4 = *(NSObject **)(*(void *)v2 + 184);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000FB41C(v2, v4, v5, v6, v7, v8, v9, v10);
  }
}

void sub_1000911B8(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  if (![a3 integerValue])
  {
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 128);
    uint64_t v6 = [v7 dk_dedup];
    [v5 addObject:v6];
  }
}

void sub_100091234(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = +[MCProfileConnection sharedConnection];
  [v1 queueHandleBARSettingsChangedNotification:[v2 isAutomaticAppUpdatesAllowed]];
}

void sub_100091330(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 96) arrayForKey:@"killed"];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*(void *)(a1 + 32) + 136);
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * (void)v6) dk_dedup];
        [v7 addObject:v8];

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 184), OS_LOG_TYPE_DEBUG)) {
    sub_1000FB490();
  }
}

id sub_1000915D8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) cancelAppRefreshTasksForApps:*(void *)(a1 + 40)];
}

id sub_100091988(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) cancelContactTracingTasksForApps:*(void *)(a1 + 40)];
}

void sub_100091A4C(uint64_t a1)
{
  id v2 = +[NSMutableSet set];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a1 + 32);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) bundleIdentifier:v9];
        [v2 addObject:v8];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 40) queueHandleAppsUninstalled:v2];
}

void sub_100091C4C(uint64_t a1)
{
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = *(id *)(a1 + 40);
  id v2 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v27;
    uint64_t v18 = *(void *)v27;
    do
    {
      id v5 = 0;
      id v19 = v3;
      do
      {
        if (*(void *)v27 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v26 + 1) + 8 * (void)v5);
        if ((objc_msgSend(v6, "isLaunchProhibited", v18) & 1) == 0)
        {
          uint64_t v21 = v5;
          id v7 = [v6 UIBackgroundModes];
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v8 = [v7 countByEnumeratingWithState:&v22 objects:v34 count:16];
          if (!v8) {
            goto LABEL_23;
          }
          id v9 = v8;
          uint64_t v10 = *(void *)v23;
          while (1)
          {
            for (i = 0; i != v9; i = (char *)i + 1)
            {
              if (*(void *)v23 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
              if ([v12 isEqualToString:@"fetch"]
                && ([*(id *)(a1 + 48) appUsesBackgroundTaskScheduler:v6] & 1) == 0)
              {
                id v13 = *(void **)(*(void *)(a1 + 48) + 104);
              }
              else if ([v12 isEqualToString:@"remote-notification"])
              {
                id v13 = *(void **)(*(void *)(a1 + 48) + 112);
              }
              else
              {
                if (![v12 isEqualToString:@"newsstand"]) {
                  continue;
                }
                id v13 = *(void **)(*(void *)(a1 + 48) + 120);
              }
              double v14 = [v6 bundleIdentifier];
              [v13 addObject:v14];

              id v15 = *(NSObject **)(*(void *)(a1 + 48) + 184);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              {
                __int16 v16 = v15;
                id v17 = [v6 bundleIdentifier];
                *(_DWORD *)buf = 138412546;
                id v31 = v17;
                __int16 v32 = 2112;
                id v33 = v12;
                _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "App %@ with mode %@ installed", buf, 0x16u);
              }
            }
            id v9 = [v7 countByEnumeratingWithState:&v22 objects:v34 count:16];
            if (!v9)
            {
LABEL_23:

              uint64_t v4 = v18;
              id v3 = v19;
              id v5 = v21;
              break;
            }
          }
        }
        id v5 = (char *)v5 + 1;
      }
      while (v5 != v3);
      id v3 = [obj countByEnumeratingWithState:&v26 objects:v35 count:16];
    }
    while (v3);
  }
}

BOOL sub_1000920F0(id a1, BMStoreEvent *a2)
{
  id v2 = [(BMStoreEvent *)a2 eventBody];
  unsigned __int8 v3 = [v2 isStarting];

  return v3;
}

void sub_10009212C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 error];

  if (v4)
  {
    id v5 = *(NSObject **)(*(void *)(a1 + 32) + 184);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000FB560(v5, v3);
    }
  }
}

void sub_10009219C(uint64_t a1, void *a2)
{
  id v13 = a2;
  id v3 = [v13 eventBody];
  uint64_t v4 = [v3 parentBundleID];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [v13 eventBody];
    id v6 = [v7 bundleID];
  }
  double v8 = *(double *)(a1 + 40);
  [v13 timestamp];
  LODWORD(v5) = vcvtpd_s64_f64((v8 - v9) / 86400.0);
  uint64_t v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];
  long long v11 = v10;
  if (!v10 || (int)[v10 intValue] > (int)v5)
  {
    long long v12 = +[NSNumber numberWithInt:v5];
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:v6];
  }
}

void sub_1000923D4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ((int)[a3 intValue] <= 3) {
    [*(id *)(*(void *)(a1 + 32) + 152) addObject:v5];
  }
  [*(id *)(*(void *)(a1 + 32) + 144) addObject:v5];
}

void sub_10009244C(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) allPendingBackgroundTasks];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_100092534;
  v5[3] = &unk_100177460;
  id v6 = *(id *)(a1 + 40);
  id v3 = +[NSPredicate predicateWithBlock:v5];
  uint64_t v4 = [v2 filteredSetUsingPredicate:v3];

  [*(id *)(*(void *)(a1 + 32) + 56) cancelActivities:v4];
}

BOOL sub_100092534(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 relatedApplications];
  id v5 = [(id)v4 firstObject];

  LOBYTE(v4) = [v3 allowsUnrestrictedBackgroundLaunches];
  BOOL v6 = 0;
  if ((v4 & 1) == 0 && v5)
  {
    id v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
    BOOL v6 = v7 == 0;
  }
  return v6;
}

void sub_1000926DC(uint64_t a1)
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      BOOL v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*(void *)(a1 + 40) + 56) activityCanceled:*(void *)(*((void *)&v7 + 1) + 8 * (void)v6), (void)v7];
        BOOL v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }

  NSLog(@"Done canceling activities!");
}

id sub_100092854(uint64_t a1)
{
  return [*(id *)(a1 + 32) queueCancelActivitiesForAllApps];
}

void sub_100092B40(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 56) activityCompleted:a2];
  [*(id *)(a1 + 32) minimumDelayBetweenLaunchesForApp:*(void *)(a1 + 40)];
  uint64_t v4 = v3;
  uint64_t v5 = +[NSDate date];
  uint64_t v6 = *(void *)(a1 + 32);
  long long v7 = *(NSObject **)(v6 + 32);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  void v9[2] = sub_100092C30;
  v9[3] = &unk_100176F40;
  v9[4] = v6;
  id v10 = v5;
  id v11 = *(id *)(a1 + 40);
  uint64_t v12 = v4;
  id v8 = v5;
  dispatch_sync(v7, v9);
}

void sub_100092C30(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = +[NSSet setWithObject:*(void *)(a1 + 48)];
  [v2 queueUpdateLastLaunchTimesToDate:v3 forApps:v4];

  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = +[NSDate dateWithTimeInterval:*(void *)(a1 + 40) sinceDate:*(double *)(a1 + 56)];
  [v6 queueScheduleActivityForApp:v5 startingAfter:v7];
}

id sub_100092CD4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) submitActivity:*(void *)(a1 + 40) inGroup:*(void *)(*(void *)(a1 + 32) + 64)];
}

id sub_100092D84(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) createActivityGroup:*(void *)(*(void *)(a1 + 32) + 64)];
}

void sub_100092F58(uint64_t a1)
{
  id v2 = (void *)os_transaction_create();
  if (byte_1001C42B0 == 1)
  {
    [*(id *)(a1 + 32) queueCancelActivitiesForAllApps];
    uint64_t v3 = [*(id *)(a1 + 32) queueObtainAppsEligibleForBackgroundFetch];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = *(void *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
          long long v9 = *(void **)(a1 + 32);
          id v10 = +[NSDate date];
          [v9 queueScheduleActivityForApp:v8 startingAfter:v10];
        }
        id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v5);
    }
  }
  [*(id *)(a1 + 32) queue_cancelBackgroundTasksForUnusedApps];
  byte_1001C42B0 = 1;
}

id sub_100093138(uint64_t a1)
{
  return [*(id *)(a1 + 32) queueStartIfBAREnabled];
}

uint64_t sub_100093354(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 8) && ([*(id *)(v2 + 128) containsObject:a1[5]] & 1) == 0)
  {
    if ([*(id *)(a1[4] + 136) containsObject:a1[5]]) {
      uint64_t result = (uint64_t)[*(id *)(a1[4] + 152) containsObject:a1[5]];
    }
    else {
      uint64_t result = 1;
    }
  }
  else
  {
    uint64_t result = 0;
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result;
  return result;
}

void sub_1000937A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000937C8(void *a1)
{
  if ([*(id *)(a1[4] + 112) containsObject:a1[5]]) {
    unsigned __int8 v2 = 1;
  }
  else {
    unsigned __int8 v2 = [*(id *)(a1[4] + 120) containsObject:a1[5]];
  }
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2;
  uint64_t v3 = a1[4];
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    if ([*(id *)(v3 + 160) containsObject:a1[5]])
    {
      id v4 = (unsigned char *)a1[7];
      if (v4) {
        *id v4 = 1;
      }
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      id v5 = *(NSObject **)(a1[4] + 184);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = a1[5];
        int v14 = 138412290;
        uint64_t v15 = v6;
        id v7 = "Remote Notification: %@ - Foreground";
LABEL_16:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      unsigned __int8 v9 = [*(id *)(a1[4] + 144) containsObject:a1[5]];
      uint64_t v10 = a1[4];
      if (v9)
      {
        if (([*(id *)(v10 + 128) containsObject:a1[5]] & 1) != 0
          || [*(id *)(a1[4] + 136) containsObject:a1[5]]
          && ([*(id *)(a1[4] + 152) containsObject:a1[5]] & 1) == 0)
        {
          *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
          id v5 = *(NSObject **)(a1[4] + 184);
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            uint64_t v11 = a1[5];
            int v14 = 138412290;
            uint64_t v15 = v11;
            id v7 = "Remote Notification: %@ - Disallowed/Killed";
            goto LABEL_16;
          }
        }
      }
      else
      {
        long long v12 = *(NSObject **)(v10 + 184);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = a1[5];
          int v14 = 138412290;
          uint64_t v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Remote Notification: %@ - Not launched", (uint8_t *)&v14, 0xCu);
        }
        *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
      }
    }
  }
  else
  {
    id v5 = *(NSObject **)(v3 + 184);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = a1[5];
      int v14 = 138412290;
      uint64_t v15 = v8;
      id v7 = "Remote Notification: %@ - Not eligible";
      goto LABEL_16;
    }
  }
}

id sub_100093AF8(void *a1)
{
  id result = [*(id *)(a1[4] + 120) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_100093BE4(uint64_t a1)
{
  return [*(id *)(a1 + 32) queueHandleAppKilled:*(void *)(a1 + 40)];
}

id sub_100093C64(uint64_t a1)
{
  return [*(id *)(a1 + 32) queueReloadRequestedDelays];
}

void sub_100093D80(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a3;
  [a2 dk_dedup];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setObject:v5 forKeyedSubscript:v6];
}

void sub_100093ECC(void *a1)
{
  unsigned __int8 v2 = [*(id *)(a1[4] + 168) objectForKeyedSubscript:a1[5]];
  if (v2)
  {
    id v4 = v2;
    [v2 doubleValue];
    unsigned __int8 v2 = v4;
    *(void *)(*(void *)(a1[6] + 8) + 24) = v3;
  }
}

void sub_10009484C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_10009486C()
{
  return v0;
}

uint64_t sub_100094924()
{
  qword_1001C42B8 = objc_opt_new();

  return _objc_release_x1();
}

void sub_100094AA0(id a1, BGRepeatingSystemTask *a2)
{
  unsigned __int8 v2 = a2;
  +[_DASConfig isInternalBuild];
  [(BGRepeatingSystemTask *)v2 setTaskCompleted];
}

uint64_t sub_100096948()
{
  qword_1001C42D0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_100096D50(uint64_t a1)
{
  unsigned __int8 v2 = +[_DASDaemonLogger logForCategory:@"remoteWidgetBudget"];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000FBD44(v2);
  }

  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (!v3[8])
  {
    [v3 logExhaustedDuration:1 withPluginConsideration:0.0];
    [*(id *)(a1 + 32) logExhaustedDuration:0 withPluginConsideration:0.0];
    uint64_t v3 = *(unsigned char **)(a1 + 32);
  }
  v3[8] = 0;
  id v4 = +[NSDate now];
  [v4 timeIntervalSinceReferenceDate];
  double v6 = v5;
  id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  uint64_t v8 = +[NSNumber numberWithDouble:v6 + 86400.0];
  [v7 setObject:v8 forKey:@"remoteWidgetLoggingInterval"];
}

id sub_100096F80(uint64_t a1)
{
  CFStringRef v4 = @"remoteWidgetActualUnavailableDuration";
  uint64_t v1 = +[NSNumber numberWithDouble:*(double *)(a1 + 32) / 3600.0];
  double v5 = v1;
  unsigned __int8 v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_100097040(uint64_t a1)
{
  CFStringRef v4 = @"remoteWidgetUnavailableDuration";
  uint64_t v1 = +[NSNumber numberWithDouble:*(double *)(a1 + 32) / 3600.0];
  double v5 = v1;
  unsigned __int8 v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

void sub_1000979D0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100097CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100097D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100097E90(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) updateBudgetsForNextSlot];
  objc_sync_exit(obj);
}

void sub_100097EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100097F90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t sub_10009853C(uint64_t a1, void *a2)
{
  id v3 = a2;
  CFStringRef v4 = +[_DASDaemonLogger logForCategory:@"bar"];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Blue List notification called (%@)", (uint8_t *)&v7, 0xCu);
  }

  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  [*(id *)(a1 + 32) updateBlueListStatus:[*(id *)(a1 + 32) shouldBlueListPushes]];
  objc_sync_exit(v5);

  return 1;
}

void sub_10009863C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100098658(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) updateBlueListStatus:[*(id *)(a1 + 32) shouldBlueListPushes]];
  objc_sync_exit(obj);
}

void sub_1000986C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t sub_1000989F4()
{
  qword_1001C42D8 = objc_opt_new();

  return _objc_release_x1();
}

void sub_100098F38(id a1)
{
  qword_1001C42E8 = objc_alloc_init(_DASBGSystemTaskHelper);

  _objc_release_x1();
}

void sub_100099204(uint64_t a1, int a2, id a3, void *a4)
{
  id v7 = a4;
  if (a2)
  {
    if (a2 != 1)
    {
      if (a2 == 2)
      {
        id v8 = qword_1001C4300;
        if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "BGST Received XPC BARRIER", buf, 2u);
        }
      }
      goto LABEL_45;
    }
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    [qword_1001C4308 allKeys];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v15 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v33;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v9);
          }
          uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          __int16 v20 = [(id)qword_1001C4308 objectForKeyedSubscript:v19];
          uint64_t v21 = v20;
          if (v20 && [v20 token] == a3)
          {
            long long v22 = [*(id *)(a1 + 32) serviceNameFromToken:a3];
            long long v23 = qword_1001C4300;
            if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              *(void *)&uint8_t buf[4] = v22;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v21;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Unregistered BGSystemTask on XPC remove event from service %{public}@: %{public}@", buf, 0x16u);
            }
            [*(id *)(a1 + 32) dasCancelActivity:v21];
            [(id)qword_1001C4308 removeObjectForKey:v19];

            goto LABEL_44;
          }
        }
        id v16 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
LABEL_44:

    goto LABEL_45;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  memset(buf, 0, sizeof(buf));
  if (xpc_get_event_name())
  {
    +[NSString stringWithUTF8String:buf];
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100099750;
    v37[3] = &unk_100175F40;
    id v39 = a3;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v38 = v9;
    uint64_t v10 = objc_retainBlock(v37);
    uint64_t service_uid_for_token = xpc_get_service_uid_for_token();
    long long v12 = +[_DASBGSystemTask taskNameWithIdentifier:v9 UID:service_uid_for_token];
    uint64_t v13 = [(id)qword_1001C4308 objectForKeyedSubscript:v12];

    if (v13)
    {
      int v14 = qword_1001C4300;
      if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v41 = 138543362;
        int v42 = v12;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Skipping XPC_EVENT_PUBLISHER_ACTION_ADD since %{public}@ already exists", v41, 0xCu);
      }
    }
    else
    {
      long long v24 = [*(id *)(a1 + 32) serviceNameFromToken:a3];
      if ([v24 length])
      {
        long long v25 = [[_DASBGSystemTask alloc] initWithDescriptor:v7 withToken:a3 withUID:service_uid_for_token withService:v24 staticSubmission:1];
        if (v25)
        {
          long long v26 = *(void **)(a1 + 32);
          id v36 = 0;
          unsigned __int8 v27 = [v26 dasSubmitActivity:v25 error:&v36];
          id v28 = v36;
          long long v29 = qword_1001C4300;
          if (v27)
          {
            if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v41 = 138543618;
              int v42 = v24;
              __int16 v43 = 2114;
              long long v44 = v25;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Created BGSystemTask on XPC add event from service %{public}@: %{public}@", v41, 0x16u);
            }
            long long v30 = (void *)qword_1001C4308;
            id v31 = [(_DASBGSystemTask *)v25 name];
            [v30 setObject:v25 forKeyedSubscript:v31];
          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
              sub_1000FC174();
            }
            ((void (*)(void *))v10[2])(v10);
          }
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
            sub_1000FC10C();
          }
          ((void (*)(void *))v10[2])(v10);
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
          sub_1000FC0A4();
        }
        ((void (*)(void *))v10[2])(v10);
      }
    }
    goto LABEL_44;
  }
  if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
    sub_1000FC1E4();
  }
LABEL_45:
}

void sub_100099750(uint64_t a1)
{
  int v2 = xpc_event_publisher_set_event();
  id v3 = qword_1001C4300;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
      sub_1000FC218(a1, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "XPC_EVENT_PUBLISHER_ACTION_ADD: Cleared subscription for %{public}@ due to error", buf, 0xCu);
  }
}

void sub_1000999AC(id a1)
{
  uint64_t v1 = qword_1001C4300;
  if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Soliciting running BGSTs", v2, 2u);
  }
  notify_post((const char *)[@"com.apple.bg.system.task.resubmission" UTF8String]);
}

void sub_10009A790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10009A7B4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10009A7C4(uint64_t a1)
{
}

void sub_10009A7CC(uint64_t a1)
{
  int v2 = +[_DASBGSystemTask taskNameWithIdentifier:*(void *)(a1 + 32) UID:*(unsigned int *)(a1 + 64)];
  id v3 = [(id)qword_1001C4308 objectForKeyedSubscript:v2];
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 state] == (id)2)
    {
      uint64_t v5 = qword_1001C4318;
      uint64_t v6 = [v4 scheduler_activity];
      LOBYTE(v5) = [(id)v5 wasActivityAllowedToRun:v6];

      if (v5)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        [v4 setState:3];
        [v4 setPid:*(unsigned int *)(a1 + 68)];
        id v7 = [v4 pid];
        uint64_t v8 = [v4 scheduler_activity];
        [v8 setPid:v7];

        uint64_t v9 = (void *)qword_1001C4300;
        if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = v9;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v47 = [v4 pid];
          *(_WORD *)&void v47[4] = 2114;
          *(void *)&v47[6] = v4;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Client (PID %d) confirmed run for %{public}@", buf, 0x12u);
        }
        uint64_t v11 = (void *)qword_1001C4318;
        uint64_t v12 = [v4 scheduler_activity];
        [v11 activityStarted:v12];

        uint64_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_proc, *(int *)(a1 + 68), 0x80000000uLL, (dispatch_queue_t)qword_1001C42F8);
        if (v13)
        {
          handler[0] = _NSConcreteStackBlock;
          handler[1] = 3221225472;
          handler[2] = sub_10009ACC0;
          handler[3] = &unk_1001775D0;
          id v14 = *(id *)(a1 + 32);
          int v41 = *(_DWORD *)(a1 + 64);
          uint64_t v15 = *(void *)(a1 + 40);
          id v39 = v14;
          uint64_t v40 = v15;
          dispatch_source_set_event_handler(v13, handler);
          dispatch_resume(v13);
          [v4 setDispatchSourceProcessExit:v13];
        }
      }
      else
      {
        uint64_t v32 = *(void *)(a1 + 32);
        CFStringRef v42 = @"taskIdentifier";
        uint64_t v43 = v32;
        long long v33 = +[NSDictionary dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        uint64_t v34 = +[NSError errorWithDomain:@"_DASBGSystemTaskHelperErrorDomain" code:5 userInfo:v33];
        uint64_t v35 = *(void *)(*(void *)(a1 + 48) + 8);
        id v36 = *(void **)(v35 + 40);
        *(void *)(v35 + 40) = v34;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        uint64_t v37 = (void *)qword_1001C4300;
        if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
          sub_1000FC47C(v37);
        }
      }
    }
    else
    {
      v44[0] = @"currentState";
      long long v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 state]);
      v44[1] = @"expectedState";
      v45[0] = v26;
      v45[1] = &off_100187270;
      unsigned __int8 v27 = +[NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
      uint64_t v28 = +[NSError errorWithDomain:@"_DASBGSystemTaskHelperErrorDomain" code:2 userInfo:v27];
      uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
      long long v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      id v31 = (void *)qword_1001C4300;
      if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
        sub_1000FC538(v31, v4);
      }
    }
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 32);
    CFStringRef v52 = @"taskIdentifier";
    uint64_t v53 = v16;
    uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    uint64_t v18 = +[NSError errorWithDomain:@"_DASBGSystemTaskHelperErrorDomain" code:1 userInfo:v17];
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    __int16 v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    uint64_t v21 = qword_1001C4300;
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      int v23 = *(_DWORD *)(a1 + 64);
      int v24 = *(_DWORD *)(a1 + 68);
      uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      *(_DWORD *)buf = 138544130;
      *(void *)long long v47 = v22;
      *(_WORD *)&v47[8] = 1024;
      *(_DWORD *)&v47[10] = v23;
      __int16 v48 = 1024;
      int v49 = v24;
      __int16 v50 = 2112;
      uint64_t v51 = v25;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "acknowledgeSystemTaskLaunchWithIdentifier: Task %{public}@ from UID %d, PID %d not found: %@", buf, 0x22u);
    }
  }
}

void sub_10009ACC0(uint64_t a1)
{
  int v2 = +[_DASBGSystemTask taskNameWithIdentifier:*(void *)(a1 + 32) UID:*(unsigned int *)(a1 + 48)];
  id v3 = [(id)qword_1001C4308 objectForKeyedSubscript:v2];
  uint64_t v4 = v3;
  if (v3 && ([v3 state] == (id)3 || objc_msgSend(v4, "state") == (id)4))
  {
    uint64_t v5 = (void *)qword_1001C4300;
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v5;
      LODWORD(v7) = 67109634;
      HIDWORD(v7) = [v4 pid];
      __int16 v8 = 2114;
      uint64_t v9 = v4;
      __int16 v10 = 1024;
      BOOL v11 = [v4 state] == (id)4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Client (PID %d) died while task %{public}@ was still running. Asked to suspend: %d", (uint8_t *)&v7, 0x18u);
    }
    [v4 setState:0, v7];
    [*(id *)(a1 + 40) dasCancelActivity:v4];
    [*(id *)(a1 + 40) dasSubmitActivity:v4 withClientOffset:0 error:300.0];
  }
}

void sub_10009AF58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10009AF70(uint64_t a1)
{
  int v2 = +[_DASBGSystemTask taskNameWithIdentifier:*(void *)(a1 + 32) UID:*(unsigned int *)(a1 + 64)];
  id v3 = [(id)qword_1001C4308 objectForKeyedSubscript:v2];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 state];
    uint64_t v6 = (void *)qword_1001C4300;
    if (v5 == (id)4)
    {
      if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = v6;
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)int v23 = [v4 pid];
        *(_WORD *)&v23[4] = 2114;
        *(void *)&v23[6] = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Client (PID %d) confirmed suspension for %{public}@", buf, 0x12u);
      }
      if ([v4 suspensionReason] == (id)1
        && *(double *)(a1 + 56) < 300.0
        && (uint64_t)[v4 priority] <= 2
        && [v4 type] != (id)3
        && ([v4 requestsApplicationLaunch] & 1) == 0
        && ([v4 beforeApplicationLaunch] & 1) == 0
        && ([v4 runOnAppForeground] & 1) == 0
        && (uint64_t)objc_msgSend(v4, "requires_protection_class") >= 3)
      {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0x4072C00000000000;
        __int16 v8 = (void *)qword_1001C4300;
        if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = (int)*(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
          __int16 v10 = v8;
          BOOL v11 = [v4 name];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)int v23 = v9;
          *(_WORD *)&v23[4] = 2114;
          *(void *)&v23[6] = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Imposing a %ds cool-off on %{public}@ upon suspension due to runtime limits", buf, 0x12u);
        }
      }
      [*(id *)(a1 + 40) dasCancelActivity:v4];
      uint64_t v12 = *(void **)(a1 + 40);
      double v13 = *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      id v21 = 0;
      unsigned int v14 = [v12 dasSubmitActivity:v4 withClientOffset:&v21 error:v13];
      id v15 = v21;
      if (v14) {
        uint64_t v16 = 5;
      }
      else {
        uint64_t v16 = 0;
      }
      [v4 setState:v16];
    }
    else if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
    {
      sub_1000FC610(v6);
    }
  }
  else
  {
    uint64_t v17 = qword_1001C4300;
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      int v19 = *(_DWORD *)(a1 + 64);
      int v20 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138543874;
      *(void *)int v23 = v18;
      *(_WORD *)&v23[8] = 1024;
      *(_DWORD *)&v23[10] = v19;
      __int16 v24 = 1024;
      int v25 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "acknowledgeSystemTaskSuspensionWithIdentifier: Task %{public}@ from UID %d, PID %d not found", buf, 0x18u);
    }
  }
}

void sub_10009B3A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10009B3C0(uint64_t a1)
{
  int v2 = +[_DASBGSystemTask taskNameWithIdentifier:*(void *)(a1 + 32) UID:*(unsigned int *)(a1 + 64)];
  id v3 = [(id)qword_1001C4308 objectForKeyedSubscript:v2];
  uint64_t v4 = v3;
  if (!v3)
  {
    double v13 = qword_1001C4300;
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = *(_DWORD *)(a1 + 64);
      int v16 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138543874;
      *(void *)int v19 = v14;
      *(_WORD *)&v19[8] = 1024;
      *(_DWORD *)&v19[10] = v15;
      __int16 v20 = 1024;
      int v21 = v16;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "handleClientLedSystemTaskExpirationWithIdentifier: Task %{public}@ from UID %d, PID %d not found", buf, 0x18u);
    }
    goto LABEL_13;
  }
  id v5 = [v3 state];
  uint64_t v6 = (void *)qword_1001C4300;
  if (v5 != (id)3)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
      sub_1000FC69C(v6);
    }
LABEL_13:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    goto LABEL_14;
  }
  if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)int v19 = [v4 pid];
    *(_WORD *)&v19[4] = 2114;
    *(void *)&v19[6] = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Client (PID %d) requested expiration for %{public}@", buf, 0x12u);
  }
  [*(id *)(a1 + 40) dasCancelActivity:v4];
  __int16 v8 = *(void **)(a1 + 40);
  double v9 = *(double *)(a1 + 56);
  id v17 = 0;
  unsigned __int8 v10 = [v8 dasSubmitActivity:v4 withClientOffset:&v17 error:v9];
  id v11 = v17;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
    uint64_t v12 = 7;
  }
  else {
    uint64_t v12 = 0;
  }
  [v4 setState:v12];

LABEL_14:
}

void sub_10009B724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10009B73C(uint64_t a1)
{
  int v2 = +[_DASBGSystemTask taskNameWithIdentifier:*(void *)(a1 + 32) UID:*(unsigned int *)(a1 + 64)];
  id v3 = [(id)qword_1001C4308 objectForKeyedSubscript:v2];
  if (!v3)
  {
    uint64_t v27 = 0;
    [*(id *)(a1 + 32) UTF8String];
    if (xpc_event_publisher_create_subscription())
    {
      if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
        sub_1000FC868();
      }
      uint64_t v4 = 0;
      goto LABEL_11;
    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10009BB40;
    v25[3] = &unk_100177648;
    v25[4] = *(void *)(a1 + 56);
    v25[5] = v27;
    int v26 = *(_DWORD *)(a1 + 68);
    unsigned __int8 v10 = objc_retainBlock(v25);
    id v11 = [*(id *)(a1 + 48) serviceNameFromToken:v27];
    if ([v11 length])
    {
      uint64_t v12 = [_DASBGSystemTask alloc];
      double v13 = [(_DASBGSystemTask *)v12 initWithDescriptor:*(void *)(a1 + 40) withToken:v27 withUID:*(unsigned int *)(a1 + 64) withService:v11 staticSubmission:0];
      if (v13)
      {
        uint64_t v4 = v13;
        uint64_t v14 = *(void **)(a1 + 48);
        id v24 = 0;
        unsigned __int8 v15 = [v14 dasSubmitActivity:v4 error:&v24];
        id v16 = v24;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15;
        int v17 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
        uint64_t v18 = qword_1001C4300;
        if (v17)
        {
          if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v29 = v4;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "submitTaskRequestWithIdentifier: Submitted BGSystemTask %{public}@", buf, 0xCu);
          }
          int v19 = (void *)qword_1001C4308;
          __int16 v20 = [(_DASBGSystemTask *)v4 name];
          [v19 setObject:v4 forKeyedSubscript:v20];
        }
        else
        {
          if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
            sub_1000FC7F8();
          }
          ((void (*)(void *))v10[2])(v10);
        }

        goto LABEL_27;
      }
      if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
        sub_1000FC790();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
    {
      sub_1000FC728();
    }
    ((void (*)(void *))v10[2])(v10);
    uint64_t v4 = 0;
LABEL_27:

    goto LABEL_28;
  }
  uint64_t v4 = v3;
  id v5 = [(_DASBGSystemTask *)v3 type];
  uint64_t v6 = qword_1001C4300;
  if (v5 != (id)3)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
    {
      int v21 = *(_DASBGSystemTask **)(a1 + 32);
      int v22 = *(_DWORD *)(a1 + 64);
      int v23 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138543874;
      uint64_t v29 = v21;
      __int16 v30 = 1024;
      int v31 = v22;
      __int16 v32 = 1024;
      int v33 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "submitTaskRequestWithIdentifier: Task %{public}@ from UID %d, PID %d already exists", buf, 0x18u);
    }
LABEL_11:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    goto LABEL_28;
  }
  if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(_DASBGSystemTask **)(a1 + 32);
    int v8 = *(_DWORD *)(a1 + 64);
    int v9 = *(_DWORD *)(a1 + 68);
    *(_DWORD *)buf = 138543874;
    uint64_t v29 = v7;
    __int16 v30 = 1024;
    int v31 = v8;
    __int16 v32 = 1024;
    int v33 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "submitTaskRequestWithIdentifier: Task %{public}@ from UID %d, PID %d already exists", buf, 0x18u);
  }
LABEL_28:
}

void sub_10009BB40(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  if (xpc_event_publisher_set_event())
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
      sub_1000FC89C();
    }
  }
}

void sub_10009BCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10009BD10(uint64_t a1)
{
  int v2 = +[_DASBGSystemTask taskNameWithIdentifier:*(void *)(a1 + 32) UID:*(unsigned int *)(a1 + 64)];
  id v3 = [(id)qword_1001C4308 objectForKeyedSubscript:v2];
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 state] == (id)1
      || [v4 state] == (id)4
      || [v4 state] == (id)7
      || [v4 state] == (id)5)
    {
      uint64_t v19 = 0;
      [v4 token];
      int v5 = xpc_event_publisher_set_event();
      uint64_t v6 = (void *)qword_1001C4300;
      if (v5)
      {
        if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
          sub_1000FC940();
        }
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = v6;
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)int v21 = [v4 pid];
          *(_WORD *)&v21[4] = 2114;
          *(void *)&v21[6] = v4;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client (PID %d) updated task request for %{public}@", buf, 0x12u);
        }
        uint64_t v12 = [*(id *)(a1 + 48) serviceNameFromToken:v19];
        if ([v12 length])
        {
          double v13 = [[_DASBGSystemTask alloc] initWithDescriptor:*(void *)(a1 + 40) withToken:v19 withUID:*(unsigned int *)(a1 + 64) withService:v12 staticSubmission:0 task:v4];
          if (v13)
          {
            [*(id *)(a1 + 48) dasCancelActivity:v4];
            [(id)qword_1001C4308 setObject:v13 forKeyedSubscript:v2];
            uint64_t v14 = *(void **)(a1 + 48);
            id v18 = 0;
            unsigned __int8 v15 = [v14 dasSubmitActivity:v13 error:&v18];
            id v16 = v18;
            *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v15;
            if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
            {
              if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
                sub_1000FC8D0();
              }
              [(id)qword_1001C4308 setObject:0 forKeyedSubscript:v2];
            }
          }
        }
        else if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
        {
          sub_1000FC0A4();
        }
      }
    }
    else
    {
      int v17 = (void *)qword_1001C4300;
      if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
        sub_1000FC974(v17);
      }
    }
  }
  else
  {
    uint64_t v7 = qword_1001C4300;
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = *(_DWORD *)(a1 + 64);
      int v10 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138543874;
      *(void *)int v21 = v8;
      *(_WORD *)&v21[8] = 1024;
      *(_DWORD *)&v21[10] = v9;
      __int16 v22 = 1024;
      int v23 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "updateTaskRequestWithIdentifier: Task %{public}@ from UID %d, PID %d not found", buf, 0x18u);
    }
  }
}

void sub_10009C138(uint64_t a1)
{
  int v2 = +[_DASBGSystemTask taskNameWithIdentifier:*(void *)(a1 + 32) UID:*(unsigned int *)(a1 + 48)];
  id v3 = [(id)qword_1001C4308 objectForKeyedSubscript:v2];
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 state] == (id)3 || objc_msgSend(v4, "state") == (id)2 || objc_msgSend(v4, "state") == (id)4)
    {
      int v5 = qword_1001C4300;
      if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
      {
        v13[0] = 138543362;
        *(void *)&v13[1] = v4;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Completed %{public}@", (uint8_t *)v13, 0xCu);
      }
      [*(id *)(a1 + 40) dasCompleteActivity:v4];
      [v4 advanceBaseTime];
      if (objc_msgSend(v4, "post_install")) {
        [v4 markInstallActivityDone];
      }
      if ([v4 type] == (id)2)
      {
        uint64_t v6 = qword_1001C4300;
        if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
        {
          v13[0] = 138543362;
          *(void *)&v13[1] = v4;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Rescheduling repeating task %{public}@", (uint8_t *)v13, 0xCu);
        }
        [*(id *)(a1 + 40) dasSubmitActivity:v4 error:0];
        goto LABEL_26;
      }
      if ([v4 type] == (id)3)
      {
        id v11 = [v4 name];
        +[_DASBGSystemTask markFastPassActivityDone:semanticVersion:](_DASBGSystemTask, "markFastPassActivityDone:semanticVersion:", v11, [v4 semanticVersion]);
      }
      [v4 token];
      if (xpc_event_publisher_set_event()
        && os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
      {
        sub_1000FCA00();
      }
    }
    else
    {
      uint64_t v12 = (void *)qword_1001C4300;
      if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
        sub_1000FCA34(v12);
      }
      [*(id *)(a1 + 40) dasCancelActivity:v4];
      [v4 token];
      if (xpc_event_publisher_set_event()
        && os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
      {
        sub_1000FCA00();
      }
    }
    [(id)qword_1001C4308 removeObjectForKey:v2];
    goto LABEL_26;
  }
  uint64_t v7 = qword_1001C4300;
  if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = *(_DWORD *)(a1 + 48);
    int v10 = *(_DWORD *)(a1 + 52);
    v13[0] = 138543874;
    *(void *)&v13[1] = v8;
    __int16 v14 = 1024;
    int v15 = v9;
    __int16 v16 = 1024;
    int v17 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "completeSystemTaskWithIdentifier: Task %{public}@ from UID %d, PID %d not found", (uint8_t *)v13, 0x18u);
  }
LABEL_26:
}

void sub_10009C58C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10009C5A4(uint64_t a1)
{
  int v2 = +[_DASBGSystemTask taskNameWithIdentifier:*(void *)(a1 + 32) UID:*(unsigned int *)(a1 + 56)];
  id v3 = [(id)qword_1001C4308 objectForKeyedSubscript:v2];
  id v4 = [v3 state];
  int v5 = qword_1001C4300;
  if (v4 == (id)7)
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138543362;
      uint64_t v7 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Resuming scheduling for %{public}@", (uint8_t *)&v6, 0xCu);
    }
    [*(id *)(a1 + 40) dasCancelActivity:v3];
    [*(id *)(a1 + 40) dasSubmitActivity:v3 error:0];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
      sub_1000FCAC0(v5);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_10009C7F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10009C810(uint64_t a1)
{
  int v2 = +[_DASBGSystemTask taskNameWithIdentifier:*(void *)(a1 + 32) UID:*(unsigned int *)(a1 + 56)];
  id v3 = [(id)qword_1001C4308 objectForKeyedSubscript:v2];
  if (v3)
  {
    [*(id *)(a1 + 40) dasCancelActivity:v3];
    id v4 = qword_1001C4300;
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 138543362;
      *(void *)&v9[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Unregistering %{public}@", (uint8_t *)v9, 0xCu);
    }
    [v3 token];
    if (xpc_event_publisher_set_event())
    {
      if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR)) {
        sub_1000FCB4C();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    [(id)qword_1001C4308 removeObjectForKey:v2];
  }
  else
  {
    int v5 = qword_1001C4300;
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = *(_DWORD *)(a1 + 56);
      int v8 = *(_DWORD *)(a1 + 60);
      v9[0] = 138543874;
      *(void *)&v9[1] = v6;
      __int16 v10 = 1024;
      int v11 = v7;
      __int16 v12 = 1024;
      int v13 = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "unregisterSystemTaskWithIdentifier: Task %{public}@ from UID %d, PID %d not found", (uint8_t *)v9, 0x18u);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

void sub_10009CB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10009CB48(uint64_t a1)
{
  if ([*(id *)(a1 + 32) count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = *(id *)(a1 + 32);
    id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v10;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          uint64_t v7 = *(void *)(*((void *)&v9 + 1) + 8 * i);
          if (v7)
          {
            if (!+[_DASBGSystemTask resetFastPass:resetAll:](_DASBGSystemTask, "resetFastPass:resetAll:", *(void *)(*((void *)&v9 + 1) + 8 * i), 0, (void)v9))[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v7]; {
          }
            }
        }
        id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v4);
    }
  }
  else
  {
    uint64_t v8 = *(unsigned __int8 *)(a1 + 48);
    +[_DASBGSystemTask resetFastPass:&stru_100179948 resetAll:v8];
  }
}

void sub_10009CE00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10009CE18(uint64_t a1)
{
  id v2 = [(id)qword_1001C4308 allKeys];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 containsString:*(void *)(a1 + 32)])
        {
          uint64_t v8 = [(id)qword_1001C4308 objectForKeyedSubscript:v7];
          long long v9 = [v8 aboutMe];

          if (v9) {
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v9];
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

id sub_10009D088(uint64_t a1)
{
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = *(id *)(a1 + 32);
  id v2 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  id v3 = &qword_1001C4000;
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = *(void *)v30;
    p_superclass = &OBJC_METACLASS____DASBootTimePolicy.superclass;
    uint64_t v7 = &qword_1001C4000;
    do
    {
      uint64_t v8 = 0;
      id v27 = v4;
      do
      {
        if (*(void *)v30 != v5) {
          objc_enumerationMutation(obj);
        }
        long long v9 = [p_superclass + 434 taskNameWithIdentifier:*(void *)(*((void *)&v29 + 1) + 8 * (void)v8) UID:*(unsigned int *)(a1 + 48)];
        long long v10 = [(id)v7[97] objectForKeyedSubscript:v9];
        long long v11 = v10;
        if (!v10)
        {
          __int16 v20 = v3[96];
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_14;
          }
          *(_DWORD *)buf = 138543362;
          uint64_t v34 = v9;
          int v21 = v20;
          __int16 v22 = "Resubmitted running BGST %{public}@ not found";
          goto LABEL_13;
        }
        if ([v10 state] == (id)1)
        {
          [v11 setPid:*(unsigned int *)(a1 + 52)];
          id v12 = [v11 pid];
          [v11 scheduler_activity];
          uint64_t v13 = v5;
          __int16 v14 = v7;
          int v15 = p_superclass;
          int v17 = v16 = v3;
          [v17 setPid:v12];

          [v11 setState:3];
          id v18 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v19 = [v11 scheduler_activity];
          [v18 addObject:v19];

          id v3 = v16;
          p_superclass = v15;
          uint64_t v7 = v14;
          uint64_t v5 = v13;
          id v4 = v27;
          goto LABEL_14;
        }
        int v23 = v3[96];
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v34 = v9;
          int v21 = v23;
          __int16 v22 = "Resubmitted running BGST %{public}@ has been scheduled after DAS came up, not restoring state to DAS";
LABEL_13:
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
        }
LABEL_14:

        uint64_t v8 = (char *)v8 + 1;
      }
      while (v4 != v8);
      id v4 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }
    while (v4);
  }

  id v24 = v3[96];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Resubmitting running BGSTs to DAS %{public}@", buf, 0xCu);
  }
  return [(id)qword_1001C4318 resubmitRunningActivities:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

void sub_10009D504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10009D528(uint64_t a1)
{
  id v2 = +[_DASBGSystemTask taskNameWithIdentifier:*(void *)(a1 + 32) UID:*(unsigned int *)(a1 + 64)];
  id v3 = [(id)qword_1001C4308 objectForKeyedSubscript:v2];
  if (!v3)
  {
    long long v9 = qword_1001C4300;
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = *(_DWORD *)(a1 + 64);
      int v18 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v16;
      __int16 v24 = 1024;
      int v25 = v17;
      __int16 v26 = 1024;
      int v27 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "reportSystemTaskWithIdentifier:producedResults: Task %{public}@ from (UID %d, PID %d) not found", buf, 0x18u);
    }
    uint64_t v10 = _DASActivitySchedulerErrorDomain;
    uint64_t v11 = *(void *)(a1 + 32);
    CFStringRef v20 = @"taskIdentifier";
    uint64_t v21 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v13 = +[NSError errorWithDomain:v10 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    int v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    goto LABEL_8;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) || !*(void *)(a1 + 40))
  {
LABEL_8:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    goto LABEL_9;
  }
  id v4 = +[_DASActivityDependencyManager sharedInstance];
  uint64_t v5 = [v3 scheduler_activity];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v7 + 40);
  unsigned __int8 v8 = [v4 reportActivity:v5 producedResults:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;

LABEL_9:
}

void sub_10009D8DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10009D900(uint64_t a1)
{
  id v2 = +[_DASBGSystemTask taskNameWithIdentifier:*(void *)(a1 + 32) UID:*(unsigned int *)(a1 + 64)];
  id v3 = [(id)qword_1001C4308 objectForKeyedSubscript:v2];
  if (!v3)
  {
    long long v9 = qword_1001C4300;
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = *(_DWORD *)(a1 + 64);
      int v18 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138543874;
      uint64_t v23 = v16;
      __int16 v24 = 1024;
      int v25 = v17;
      __int16 v26 = 1024;
      int v27 = v18;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "reportSystemTaskWithIdentifier:consumedResults: Task %{public}@ from (UID %d, PID %d) not found", buf, 0x18u);
    }
    uint64_t v10 = _DASActivitySchedulerErrorDomain;
    uint64_t v11 = *(void *)(a1 + 32);
    CFStringRef v20 = @"taskIdentifier";
    uint64_t v21 = v11;
    id v12 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    uint64_t v13 = +[NSError errorWithDomain:v10 code:3 userInfo:v12];
    uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
    int v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    goto LABEL_8;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) || !*(void *)(a1 + 40))
  {
LABEL_8:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    goto LABEL_9;
  }
  id v4 = +[_DASActivityDependencyManager sharedInstance];
  uint64_t v5 = [v3 scheduler_activity];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v7 + 40);
  unsigned __int8 v8 = [v4 reportActivity:v5 consumedResults:v6 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;

LABEL_9:
}

void sub_10009DCAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10009DCD0(uint64_t a1)
{
  id v2 = +[_DASBGSystemTask taskNameWithIdentifier:*(void *)(a1 + 32) UID:*(unsigned int *)(a1 + 64)];
  id v3 = [(id)qword_1001C4308 objectForKeyedSubscript:v2];
  if (v3)
  {
    id v4 = +[_DASActivityDependencyManager sharedInstance];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = [v3 scheduler_activity];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v7 + 40);
    LOBYTE(v5) = [v4 resetDependenciesForIdentifier:v5 byActivity:v6 error:&obj];
    objc_storeStrong((id *)(v7 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v5;
  }
  else
  {
    unsigned __int8 v8 = qword_1001C4300;
    if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = *(_DWORD *)(a1 + 64);
      int v17 = *(_DWORD *)(a1 + 68);
      *(_DWORD *)buf = 138543874;
      uint64_t v22 = v15;
      __int16 v23 = 1024;
      int v24 = v16;
      __int16 v25 = 1024;
      int v26 = v17;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "resetResultsForIdentifier:byTaskWithIdentifier: Task %{public}@ from UID %d, PID %d not found", buf, 0x18u);
    }
    uint64_t v9 = _DASActivitySchedulerErrorDomain;
    uint64_t v10 = *(void *)(a1 + 32);
    CFStringRef v19 = @"taskIdentifier";
    uint64_t v20 = v10;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v12 = +[NSError errorWithDomain:v9 code:3 userInfo:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

void sub_10009E028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10009E040(uint64_t a1)
{
  id v8 = +[NSMutableDictionary dictionary];
  [v8 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"TaskName"];
  id v2 = objc_opt_new();
  [v2 setNumberStyle:1];
  [v2 setUsesSignificantDigits:1];
  [v2 setMinimumSignificantDigits:1];
  [v2 setMaximumSignificantDigits:2];
  id v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 64)];
  id v4 = [v2 stringFromNumber:v3];
  uint64_t v5 = [v2 numberFromString:v4];
  [v8 setObject:v5 forKeyedSubscript:@"Target"];

  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 72)];
  [v8 setObject:v6 forKeyedSubscript:@"CompletedPercentage"];

  uint64_t v7 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 80)];
  [v8 setObject:v7 forKeyedSubscript:@"WorkloadCategory"];

  [v8 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"SubCategory"];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 48) sendToPPS:v8];
}

void sub_10009E4A8(uint64_t a1)
{
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v2 = [(id)qword_1001C4308 allValues];
  id v3 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v18;
    *(void *)&long long v4 = 138543362;
    long long v16 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v2);
        }
        id v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v8, "state", v16) == (id)1
          || [v8 state] == (id)7
          || [v8 state] == (id)5)
        {
          if ([v8 type] == (id)2
            && (double v9 = fabs(*(double *)(a1 + 40)), [v8 interval], v9 >= v10 * 0.01)
            || ([v8 type] == (id)1 || objc_msgSend(v8, "type") == (id)3)
            && (double v11 = fabs(*(double *)(a1 + 40)),
                [v8 trySchedulingBefore],
                double v13 = v12,
                [v8 startAfter],
                v11 >= (v13 - v14) * 0.01))
          {
            uint64_t v15 = qword_1001C4300;
            if (os_log_type_enabled((os_log_t)qword_1001C4300, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v16;
              uint64_t v22 = v8;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Time change: resubmitting activity %{public}@", buf, 0xCu);
            }
            [*(id *)(a1 + 32) dasCancelActivity:v8];
            [v8 adjustBaseTimeByOffset:*(double *)(a1 + 40)];
            [*(id *)(a1 + 32) dasSubmitActivity:v8 error:0];
          }
        }
      }
      id v5 = [v2 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }
}

void sub_10009E888(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

id sub_10009E8C8()
{
  return [v0 state];
}

id sub_10009E908()
{
  return [v0 pid];
}

void sub_10009E920(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id sub_10009EBB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) evaluateActivityOnTick];
}

id sub_10009F700(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10009F708(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10009F8F0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10009FAC0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10009FAC8(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10009FC3C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10009FC44(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10009FE14(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10009FE1C(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_1000A01CC(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_1000A01D4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_1000A03D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000A03E8()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_1001C4330;
  uint64_t v7 = qword_1001C4330;
  if (!qword_1001C4330)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000A1050;
    v3[3] = &unk_100175628;
    void v3[4] = &v4;
    sub_1000A1050((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1000A04B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A0614()
{
  qword_1001C4328 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_1000A06B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A09A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setName:@"ActivityProgressUISessionClient"];
  uint64_t v4 = +[BSServiceQuality utility];
  [v3 setServiceQuality:v4];

  [v3 setInterface:*(void *)(a1 + 32)];
  [v3 setInterfaceTarget:*(void *)(a1 + 40)];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1000A0AA4;
  v6[3] = &unk_100177788;
  void v6[4] = *(void *)(a1 + 40);
  [v3 setInvalidationHandler:v6];
  id v5 = [*(id *)(a1 + 40) queue];
  [v3 setTargetQueue:v5];
}

id sub_1000A0AA4(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000FD078(v2);
  }
  return [*(id *)(a1 + 32) invalidateConnection];
}

void sub_1000A1050(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("APKActivityProgress");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1001C4330 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_1000FD144();
    sub_1000A10A8();
  }
}

void sub_1000A10A8()
{
  v1[0] = 0;
  if (!qword_1001C4338)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_1000A11A4;
    v1[4] = &unk_1001753E0;
    v1[5] = v1;
    long long v2 = off_1001777D0;
    uint64_t v3 = 0;
    qword_1001C4338 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!qword_1001C4338)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_1000A11A4()
{
  uint64_t result = _sl_dlopen();
  qword_1001C4338 = result;
  return result;
}

Class sub_1000A1218(uint64_t a1)
{
  sub_1000A10A8();
  Class result = objc_getClass("APKActivityProgressTasksSpecifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1001C4340 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (_DASSwapModelAverageAggregator *)sub_1000FD16C();
    return (Class)[(_DASSwapModelAverageAggregator *)v3 scoresForAllApplicationsAtDate:v5];
  }
  return result;
}

id sub_1000A22C0(uint64_t a1)
{
  [*(id *)(a1 + 32) updateScores];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  uint64_t v4 = *(void *)(v2 + 48);

  return [v3 logAppResumePredictions:v4 durationCheck:1];
}

id sub_1000A2308(uint64_t a1)
{
  [*(id *)(a1 + 32) updateScores];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  uint64_t v4 = *(void *)(v2 + 48);

  return [v3 logAppResumePredictions:v4 durationCheck:0];
}

void sub_1000A2890()
{
  id v0 = objc_alloc((Class)objc_opt_class());
  id v1 = objc_opt_new();
  v6[0] = v1;
  uint64_t v2 = objc_opt_new();
  v6[1] = v2;
  uint64_t v3 = +[NSArray arrayWithObjects:v6 count:2];
  id v4 = [v0 initWithAlgorithms:v3];
  id v5 = (void *)qword_1001C4348;
  qword_1001C4348 = (uint64_t)v4;
}

id sub_1000A2CFC(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 eventBody];
  id v4 = [v3 resultIdentifier];
  id v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void sub_1000A2D58(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == (id)1)
  {
    id v4 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000FD20C(v4, v3);
    }
  }
}

void sub_1000A2DB4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  id v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 type];
    if (v6 == 2)
    {
      id v7 = [objc_alloc((Class)_DASActivityResult) initWithIdentifier:*(void *)(a1 + 48) count:objc_msgSend(v5, "resultCount")];
      double v9 = [*(id *)(a1 + 40) cumulativeResultConsumption];
      uint64_t v10 = [v5 activityIdentifier];
      [v9 setObject:v7 forKeyedSubscript:v10];

      goto LABEL_8;
    }
    if (v6 == 1)
    {
      id v7 = [objc_alloc((Class)_DASActivityResult) initWithIdentifier:*(void *)(a1 + 48) count:objc_msgSend(v5, "resultCount")];
      [*(id *)(a1 + 40) setCumulativelyProducedResult:v7];
LABEL_8:

      goto LABEL_11;
    }
    double v11 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000FD31C(v5, v11);
    }
  }
  else
  {
    id v8 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000FD2A4((uint64_t)v3, v8);
    }
  }
LABEL_11:
}

id sub_1000A31C8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

uint64_t sub_1000A3364(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000A3374(uint64_t a1)
{
}

void sub_1000A337C(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
    v19[0] = *(void *)(v2 + 8);
    v18[0] = @"resultIdentifier";
    v18[1] = @"registeredProducerIdentifier";
    id v3 = [*(id *)(v2 + 40) description];
    v19[1] = v3;
    v18[2] = @"attemptedProducerIdentifier";
    id v4 = [*(id *)(a1 + 40) description];
    v19[2] = v4;
    id v5 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
    uint64_t v6 = +[NSError errorWithDomain:@"_DASResultDependencyGroupErrorDomain" code:5 userInfo:v5];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    double v9 = [*(id *)(a1 + 40) producedResultIdentifiers];
    unsigned __int8 v10 = [v9 containsObject:*(void *)(*(void *)(a1 + 32) + 8)];

    if (v10)
    {
      objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
      uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8);
      CFStringRef v16 = @"resultIdentifier";
      uint64_t v17 = v11;
      double v12 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      uint64_t v13 = +[NSError errorWithDomain:@"_DASResultDependencyGroupErrorDomain" code:2 userInfo:v12];
      uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
  }
}

id sub_1000A3600(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
}

void sub_1000A379C(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 40) isEqual:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    v11[0] = @"registerdProducerIdentifier";
    id v4 = [*(id *)(*(void *)(a1 + 32) + 40) description];
    id v5 = v4;
    if (!v4)
    {
      id v5 = +[NSNull null];
    }
    v11[1] = @"attemptedProducerIdentifier";
    v12[0] = v5;
    uint64_t v6 = [*(id *)(a1 + 40) description];
    v12[1] = v6;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];
    uint64_t v8 = +[NSError errorWithDomain:@"_DASResultDependencyGroupErrorDomain" code:6 userInfo:v7];
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    unsigned __int8 v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    if (!v4) {
  }
    }
}

void sub_1000A3B68(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "queue_isConsumerActivity:", *(void *)(a1 + 40)))
  {
    uint64_t v2 = [*(id *)(a1 + 32) queue_aggregateResultConsumptionForActivity:*(void *)(a1 + 40)];
    id v3 = (char *)[v2 count];
    id v4 = &v3[(void)[*(id *)(a1 + 48) count]];
    if ((uint64_t)v4 <= (uint64_t)[*(id *)(*(void *)(a1 + 32) + 16) count])
    {
      [v2 setCount:((char *)[*(id *)(a1 + 48) count]) + [v2 count]];
      [*(id *)(a1 + 32) persistUpdatedResultConsumptionBy:*(void *)(a1 + 40) result:v2];
    }
    else
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 16);
      v22[0] = *(void *)(v5 + 8);
      v21[0] = @"dependencyIdentifier";
      v21[1] = @"cumulativelyProducedResults";
      uint64_t v7 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 count]);
      v22[1] = v7;
      v21[2] = @"previouslyConsumedResultCount";
      uint64_t v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v2 count]);
      v22[2] = v8;
      v21[3] = @"newlyConsumedResultCount";
      uint64_t v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 48) count]);
      v22[3] = v9;
      v21[4] = @"attemptedTotalConsumptionCount";
      unsigned __int8 v10 = +[NSNumber numberWithInteger:v4];
      v22[4] = v10;
      uint64_t v11 = +[NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:5];
      uint64_t v12 = +[NSError errorWithDomain:@"_DASResultDependencyGroupErrorDomain" code:4 userInfo:v11];
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    }
  }
  else
  {
    uint64_t v15 = *(void **)(a1 + 40);
    v24[0] = *(void *)(*(void *)(a1 + 32) + 8);
    v23[0] = @"dependencyIdentifier";
    v23[1] = @"activityIdentifier";
    CFStringRef v16 = [v15 description];
    v24[1] = v16;
    uint64_t v17 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:2];
    uint64_t v18 = +[NSError errorWithDomain:@"_DASResultDependencyGroupErrorDomain" code:1 userInfo:v17];
    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    long long v20 = *(void **)(v19 + 40);
    *(void *)(v19 + 40) = v18;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
  }
}

void sub_1000A3FE8(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "queue_isProducerActivity:", *(void *)(a1 + 40)) & 1) == 0)
  {
    v17[0] = @"resultIdentifier";
    uint64_t v6 = [*(id *)(a1 + 48) identifier];
    v17[1] = @"activityName";
    v18[0] = v6;
    uint64_t v7 = [*(id *)(a1 + 40) description];
    v18[1] = v7;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    uint64_t v9 = +[NSError errorWithDomain:@"_DASResultDependencyGroupErrorDomain" code:2 userInfo:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

LABEL_8:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    return;
  }
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = [*(id *)(a1 + 48) identifier];
  LOBYTE(v2) = [v2 isEqualToString:v3];

  if ((v2 & 1) == 0)
  {
    v15[0] = @"reportedProducedResultIdentifier";
    uint64_t v6 = [*(id *)(a1 + 48) identifier];
    v15[1] = @"dependencyGroupIdentifier";
    v16[0] = v6;
    v16[1] = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    uint64_t v12 = +[NSError errorWithDomain:@"_DASResultDependencyGroupErrorDomain" code:3 userInfo:v7];
    uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    goto LABEL_8;
  }
  [*(id *)(*(void *)(a1 + 32) + 16) setCount:[*(id *)(a1 + 48) count]];
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  [v4 persistUpdatedResultProductionBy:v5];
}

uint64_t sub_1000A431C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  uint64_t v5 = [v4 resultIdentifier];
  if ([v5 containsString:*(void *)(a1 + 32)])
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v7 = [v3 eventBody];
    uint64_t v8 = [v7 activityIdentifier];
    uint64_t v6 = (uint64_t)[v8 containsString:*(void *)(a1 + 32)];
  }
  return v6;
}

BOOL sub_1000A44F8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  uint64_t v5 = [v4 resultIdentifier];
  if ([v5 isEqualToString:*(void *)(*(void *)(a1 + 32) + 8)])
  {
    uint64_t v6 = [v3 eventBody];
    BOOL v7 = [v6 type] == 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

BOOL sub_1000A475C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  uint64_t v5 = [v4 activityIdentifier];
  if ([v5 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v6 = [v3 eventBody];
    BOOL v7 = [v6 resultIdentifier];
    if ([v7 isEqualToString:*(void *)(*(void *)(a1 + 40) + 8)])
    {
      uint64_t v8 = [v3 eventBody];
      BOOL v9 = [v8 type] == 2;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void sub_1000A4A2C(uint64_t a1)
{
  [*(id *)(a1 + 32) queue_aggregateResultConsumptionForActivity:*(void *)(a1 + 40)];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 - (unsigned char *)[v3 count];
}

void sub_1000A4C28(uint64_t a1)
{
  id v2 = objc_alloc((Class)_DASActivityResult);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = a1 + 32;
  id v5 = [v2 initWithIdentifier:*(void *)(v4 + 8)];
  uint64_t v6 = *(void **)(*(void *)v3 + 16);
  *(void *)(*(void *)v3 + 16) = v5;

  uint64_t v7 = +[NSMutableDictionary dictionary];
  uint64_t v8 = *(void **)(*(void *)v3 + 24);
  *(void *)(*(void *)v3 + 24) = v7;

  BOOL v9 = [*(id *)(*(void *)v3 + 48) pruner];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  void v11[2] = sub_1000A4D2C;
  void v11[3] = &unk_1001778E8;
  v11[4] = *(void *)v3;
  [v9 deleteEventsPassingTest:v11];

  uint64_t v10 = *(NSObject **)(*(void *)v3 + 64);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_1000FD5A4(v3, v10);
  }
}

id sub_1000A4D2C(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 eventBody];
  uint64_t v4 = [v3 resultIdentifier];
  id v5 = [v4 isEqualToString:*(void *)(*(void *)(a1 + 32) + 8)];

  return v5;
}

void sub_1000A4F78(uint64_t a1)
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) allKeys];
  id v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v22;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:v7];
        BOOL v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v8 count]);
        [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v7];
      }
      id v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v4);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = *(id *)(*(void *)(a1 + 32) + 32);
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(a1 + 48);
        CFStringRef v16 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)j) name:v17];
        [v15 addObject:v16];
      }
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }
}

id sub_1000A5318(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendFormat:@"\nCumulative Result Consumption: %@ ", *(void *)(*(void *)(a1 + 40) + 24)];
}

id sub_1000A544C(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendFormat:@"\nProducer: %@", *(void *)(*(void *)(a1 + 40) + 40)];
}

void sub_1000A5844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000A585C(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = [v3 resultIdentifier];
  id v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void sub_1000A58B8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == (id)1)
  {
    id v4 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000FD20C(v4, v3);
    }
  }
}

uint64_t sub_1000A5914(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

void sub_1000A5948(uint64_t a1@<X8>)
{
  *(void *)(v1 - _Block_object_dispose(&STACK[0x200], 8) = a1;
}

void sub_1000A595C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_1000A5A1C()
{
  qword_1001C4360 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_1000A6318(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A6484(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A675C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A6C24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A6F84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000A71B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A72CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A74C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A770C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000A7750(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000A7760(uint64_t a1)
{
}

void sub_1000A7768(void *a1, void *a2)
{
  uint64_t v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1[4] + 8) + 24) + *(void *)(*(void *)(a1[5] + 8) + 24));
  id v4 = a2;
  id v5 = +[NSNumber numberWithUnsignedChar:v3];
  [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:v5 forKey:v4];

  ++*(void *)(*(void *)(a1[5] + 8) + 24);
}

void sub_1000A7CA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000A7CCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleDeathForProcess:*(void *)(a1 + 40) withDockAssertion:*(void *)(a1 + 48)];
}

void sub_1000A7E30(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A7F98(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A8154(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A829C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A83D8(void *a1, void *a2)
{
  uint64_t v6 = a1[4];
  id v3 = a2;
  id v4 = +[NSArray arrayWithObjects:&v6 count:1];
  [v3 setPredicates:v4];

  [v3 setStateDescriptor:a1[5]];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_100011198;
  v5[3] = &unk_100176810;
  void v5[4] = a1[6];
  [v3 setUpdateHandler:v5];
}

void sub_1000A8A0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A8AC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000A8AD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = *(id **)(a1 + 32);
  if (a3)
  {
    return [v4 refreshLedgerInformationForProcess:];
  }
  else
  {
    [v4[5] removeObjectForKey:a2];
    id v5 = *(void **)(a1 + 32);
    return [v5 persistApplicationProcessHandles];
  }
}

void sub_1000A8EA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A8EB8(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) getProcessHandleFromRunningBoardForPid:[v5 intValue]];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 bundle];
    BOOL v9 = [v8 identifier];
    unsigned int v10 = [v9 isEqualToString:v12];

    if (v10)
    {
      id v11 = *(id *)(*(void *)(a1 + 32) + 40);
      objc_sync_enter(v11);
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:v7 forKey:v12];
      objc_sync_exit(v11);
    }
  }
}

void sub_1000A8FA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000A9070(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000A908C(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    id v4 = a2;
    id v5 = +[_DASDataProtectionStateMonitor dataProtectionClassC];

    if (v5 == v4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      uint64_t v7 = [WeakRetained logger];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Class C protected data now available, refreshing state and performing initial policy update.", v9, 2u);
      }

      [WeakRetained refreshLedgerInformationForApplicationProcesses];
      [WeakRetained updatePolicy];
      uint64_t v8 = [WeakRetained lockStateMonitor];
      [v8 setChangeHandler:0];
    }
  }
}

uint64_t sub_1000A9454()
{
  return v0;
}

void sub_1000A9E0C(uint64_t a1)
{
  id v4 = +[_APRSMetricRecorder sharedInstance];
  uint64_t v2 = [*(id *)(a1 + 32) bundle];
  id v3 = [v2 identifier];
  [v4 endEventForApp:v3 pid:[*(id *)(a1 + 32) pid] forEvent:0];
}

id sub_1000AA728(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = [v3 identifier];
  id v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void sub_1000AA784(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == (id)1)
  {
    id v4 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000FD20C(v4, v3);
    }
  }
}

void sub_1000AA7E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  id v5 = v4;
  if (v4)
  {
    unsigned int v6 = [v4 type];
    if (v6 == 2)
    {
      uint64_t v8 = [*(id *)(a1 + 40) haveRunActivities];
      BOOL v9 = [v5 consumerIdentifier];
      [v8 addObject:v9];
    }
    else if (v6 == 1)
    {
      [*(id *)(a1 + 40) setHasDependencyRun:1];
    }
    else
    {
      unsigned int v10 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1000FE2E8(v5, v10);
      }
    }
  }
  else
  {
    uint64_t v7 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000FD2A4((uint64_t)v3, v7);
    }
  }
}

id sub_1000AABF4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

id sub_1000AAD38(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

id sub_1000AADDC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + _Block_object_dispose(&STACK[0x200], 8) = 1;
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 updateStreamForTrackedActivityDidRun:v3];
}

id sub_1000AAEC0(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [*(id *)(a1 + 40) name];
  [v2 addObject:v3];

  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);

  return [v4 persistActivityDidConsume:v5];
}

void sub_1000AB00C(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  id v3 = [*(id *)(a1 + 40) name];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:v3];
}

id sub_1000AB0E8(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000FE390((uint64_t)v1, v2);
  }
  [*((id *)*v1 + 4) removeAllObjects];
  *((unsigned char *)*v1 + _Block_object_dispose(&STACK[0x200], 8) = 0;
  return [*v1 pruneStreamOfGroup];
}

void sub_1000AB2D4(uint64_t a1)
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 24);
  id v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      unsigned int v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(a1 + 40);
        uint64_t v8 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v6) name];
        [v7 addObject:v8];

        unsigned int v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *(id *)(*(void *)(a1 + 32) + 32);
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(a1 + 48) addObject:*(void *)(*((void *)&v14 + 1) + 8 * (void)v13), (void)v14];
        uint64_t v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v11);
  }
}

uint64_t sub_1000AB578(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  uint64_t v5 = [v4 identifier];
  if ([v5 containsString:*(void *)(a1 + 32)])
  {
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v7 = [v3 eventBody];
    uint64_t v8 = [v7 consumerIdentifier];
    uint64_t v6 = (uint64_t)[v8 containsString:*(void *)(a1 + 32)];
  }
  return v6;
}

id sub_1000AB700(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = [v3 identifier];
  id v5 = [v4 isEqualToString:*(void *)(*(void *)(a1 + 32) + 16)];

  return v5;
}

id sub_1000AB9FC(uint64_t a1)
{
  [*(id *)(a1 + 32) appendFormat:@"\nDependents: %@", *(void *)(*(void *)(a1 + 40) + 24)];
  if (*(unsigned char *)(*(void *)(a1 + 40) + 8)) {
    CFStringRef v2 = @"YES";
  }
  else {
    CFStringRef v2 = @"NO";
  }
  return [*(id *)(a1 + 32) appendFormat:@"\nHas the dependency run: %@", v2];
}

id sub_1000ABB48(uint64_t a1)
{
  [*(id *)(a1 + 32) appendFormat:@"\nDependents: %@", *(void *)(*(void *)(a1 + 40) + 24)];
  [*(id *)(a1 + 32) appendFormat:@"\nDependents that have run: %@", *(void *)(*(void *)(a1 + 40) + 32)];
  if (*(unsigned char *)(*(void *)(a1 + 40) + 8)) {
    CFStringRef v2 = @"YES";
  }
  else {
    CFStringRef v2 = @"NO";
  }
  return [*(id *)(a1 + 32) appendFormat:@"\nHas the dependency run: %@", v2];
}

void sub_1000ABF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000ABF28(uint64_t a1, void *a2)
{
  id v3 = [a2 eventBody];
  id v4 = [v3 identifier];
  id v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

void sub_1000ABF84(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state] == (id)1)
  {
    id v4 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000FD20C(v4, v3);
    }
  }
}

uint64_t sub_1000ABFE0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

id sub_1000AC16C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_loadHistograms];
}

void sub_1000AC700(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  [a3 doubleValue];
  double v6 = v5;
  uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v11];
  [v7 doubleValue];
  double v9 = v8 * 0.5 + v6 * 0.5;

  if (v9 <= 0.1)
  {
    [*(id *)(a1 + 40) setObject:&off_100187330 forKeyedSubscript:v11];
  }
  else
  {
    id v10 = +[NSNumber numberWithDouble:v9];
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:v11];
  }
}

void sub_1000AC7DC(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  double v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];

  if (!v6) {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

void sub_1000AC864(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:];

  if (!v3) {
    [*(id *)(a1 + 32) setObject:&off_100187330 forKeyedSubscript:v4];
  }
}

id sub_1000AC94C(uint64_t a1)
{
  [*(id *)(a1 + 32) _queue_loadHistograms];
  uint64_t v2 = [*(id *)(a1 + 32) _queue_computeScores];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  id v5 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 24);
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updated Kill Histogram: %@", (uint8_t *)&v8, 0xCu);
  }
  [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
  return [*(id *)(a1 + 32) _queue_updateHistograms];
}

void sub_1000ACC04(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 updateModel];
  [v3 setTaskCompleted];
}

void sub_1000ACCCC(id a1)
{
}

id sub_1000AD154(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void sub_1000AD348(uint64_t a1)
{
  int v2 = memorystatus_control();
  if (v2 <= 0)
  {
    long long v31 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_1000FE424(v31);
    }
  }
  else
  {
    id v3 = (char *)malloc_type_malloc(v2, 0x595F79B4uLL);
    if ((int)memorystatus_control() <= 0)
    {
      long long v32 = *(NSObject **)(*(void *)(a1 + 32) + 48);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
        sub_1000FE4B0(v32);
      }
    }
    else
    {
      id v38 = +[NSMutableArray array];
      unint64_t v5 = *((void *)v3 + 24);
      if (v5)
      {
        uint64_t v6 = 0;
        unint64_t v7 = 0;
        uint64_t v8 = 0;
        char v37 = 0;
        uint64_t v9 = 0;
        int v39 = 0;
        id v10 = v3 + 200;
        double v11 = 0.0;
        uint64_t v12 = &AnalyticsSendEvent_ptr;
        *(void *)&long long v4 = 138412290;
        long long v33 = v4;
        uint64_t v35 = a1;
        do
        {
          memcpy(__dst, v10, sizeof(__dst));
          if (__dst[10] && (__dst[5] & 0x1800000000) == 0)
          {
            uint64_t v13 = [v12[408] stringWithUTF8String:(char *)__dst + 4];
            if (v13)
            {
              if (!v8)
              {
                uint64_t v8 = mach_absolute_time();
                long long v14 = +[NSDate date];

                [v14 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 56)];
                double v11 = v15;
                uint64_t v9 = v14;
                uint64_t v12 = &AnalyticsSendEvent_ptr;
              }
              [*(id *)(a1 + 32) secondsFrom:v8 until:__dst[25] withLeeway:v33];
              if (v16 <= v11)
              {
                double v17 = v16;
                if ((__dst[5] & 0x200000000) != 0)
                {
                  if ((__dst[5] & 0x400000000) != 0)
                  {
                    char v36 = 0;
                    v6 += __dst[30];
                  }
                  else
                  {
                    ++v39;
                    char v36 = 1;
                  }
                }
                else
                {
                  char v36 = 0;
                }
                long long v18 = *(NSObject **)(*(void *)(a1 + 32) + 48);
                if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                {
                  long long v19 = v18;
                  [v9 dateByAddingTimeInterval:-v17];
                  v21 = long long v20 = v9;
                  *(_DWORD *)buf = 138412546;
                  int v41 = v13;
                  __int16 v42 = 2112;
                  uint64_t v43 = v21;
                  _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ killed at %@", buf, 0x16u);

                  uint64_t v9 = v20;
                  uint64_t v12 = &AnalyticsSendEvent_ptr;
                  a1 = v35;
                }
                if ([*(id *)(a1 + 32) process:v13 inSet:*(void *)(a1 + 40)])
                {
                  if (HIDWORD(__dst[6]))
                  {
                    uint64_t v34 = v9;
                    long long v22 = +[NSMutableDictionary dictionary];
                    [v22 setObject:v13 forKeyedSubscript:@"BundleID"];
                    long long v23 = +[NSNumber numberWithInt:LODWORD(__dst[0])];
                    [v22 setObject:v23 forKeyedSubscript:@"PID"];

                    long long v24 = +[NSNumber numberWithUnsignedInt:HIDWORD(__dst[6])];
                    [v22 setObject:v24 forKeyedSubscript:@"Reason"];

                    __int16 v25 = *(NSObject **)(*(void *)(a1 + 32) + 48);
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      int v41 = v13;
                      __int16 v42 = 1024;
                      LODWORD(v43) = HIDWORD(__dst[6]);
                      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Skipped %@ (%d)", buf, 0x12u);
                    }
                    [v38 addObject:v22];

                    uint64_t v9 = v34;
                  }
                  if ((v36 & 1) == 0)
                  {
                    int v26 = v9;
                    int v27 = *(NSObject **)(*(void *)(a1 + 32) + 48);
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = v33;
                      int v41 = v13;
                      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Adding %@ to today's kill dictionary", buf, 0xCu);
                    }
                    uint64_t v28 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:v13];
                    [v28 doubleValue];
                    long long v30 = +[NSNumber numberWithDouble:v29 + 1.0];
                    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v30 forKeyedSubscript:v13];

                    char v37 = 1;
                    uint64_t v9 = v26;
                    uint64_t v12 = &AnalyticsSendEvent_ptr;
                  }
                }
                else
                {
                  [*(id *)(*(void *)(a1 + 32) + 32) addObject:v13];
                }
              }
            }

            unint64_t v5 = *((void *)v3 + 24);
          }
          ++v7;
          v10 += 280;
        }
        while (v7 < v5);
      }
      else
      {
        uint64_t v9 = 0;
        char v37 = 0;
        int v39 = 0;
        uint64_t v6 = 0;
      }
      free(v3);
      +[_DASMetricRecorder setValue:v6 forKey:@"com.apple.dasd.swap.goodfreezecount"];
      +[_DASMetricRecorder incrementOccurrencesForKey:@"com.apple.dasd.swap.badfreezecount" byCount:v39];
      if (v37)
      {
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), v9);
        [*(id *)(a1 + 32) _queue_updateHistograms];
        [*(id *)(*(void *)(a1 + 32) + 40) logFreezerSkipReasons:v38];
      }
    }
  }
}

void sub_1000ADA70(uint64_t a1)
{
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  int v2 = [*(id *)(a1 + 32) _queue_computeScores];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  void v6[2] = sub_1000ADBA8;
  v6[3] = &unk_100176B88;
  void v6[4] = v7;
  [v2 enumerateKeysAndObjectsUsingBlock:v6];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000ADBE4;
  v3[3] = &unk_100176BB0;
  id v4 = *(id *)(a1 + 40);
  unint64_t v5 = v7;
  [v2 enumerateKeysAndObjectsUsingBlock:v3];

  _Block_object_dispose(v7, 8);
}

void sub_1000ADB90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

double sub_1000ADBA8(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 doubleValue];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

void sub_1000ADBE4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  [a3 doubleValue];
  id v7 = +[NSNumber numberWithDouble:v6 / *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v5];
}

id sub_1000ADEE8()
{
  id result = [(id)objc_opt_class() computeHasDeviceRecentlyUpdated];
  byte_1001C4388 = (char)result;
  return result;
}

void sub_1000AE110(id a1)
{
  id v1 = (id)MGGetStringAnswer();
  byte_1001C4389 = [v1 isEqualToString:@"iPad"];
}

void sub_1000AE1A8(id a1)
{
  id v1 = (id)MGGetStringAnswer();
  byte_1001C4398 = [v1 isEqualToString:@"iPhone"];
}

void sub_1000AE240(id a1)
{
  byte_1001C43A8 = MGGetBoolAnswer();
}

void sub_1000AE5B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000AE6EC()
{
  qword_1001C43C0 = (uint64_t)[objc_alloc((Class)objc_opt_class()) initAsAnonymous:0 withContext:0];

  return _objc_release_x1();
}

void sub_1000AF2DC(uint64_t a1)
{
  id obj = *(id *)(*(void *)(a1 + 32) + 416);
  objc_sync_enter(obj);
  [*(id *)(*(void *)(a1 + 32) + 416) removeAllObjects];
  [*(id *)(*(void *)(a1 + 32) + 424) removeAllObjects];
  objc_sync_exit(obj);
}

void sub_1000AF34C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id sub_1000AF360(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleTriggers:a2];
}

id sub_1000AF36C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleCompletedActivities:a2];
}

void sub_1000AF378(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "NW Evaluation: %@", (uint8_t *)&v7, 0xCu);
  }

  id v5 = *(void **)(a1 + 32);
  double v6 = +[NSMutableSet setWithArray:v3];
  [v5 unprotectedEvaluateScoreAndRunActivities:v6];
}

id sub_1000AF464(uint64_t a1)
{
  return [*(id *)(a1 + 32) schedulingTimerFired];
}

void sub_1000AF948(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000AFE50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000B004C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000B02D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000B0580(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000B0780(uint64_t a1)
{
  return [*(id *)(a1 + 32) periodicCalculationForOptimal];
}

void sub_1000B0788(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  int v2 = [*(id *)(*(void *)(a1 + 32) + 96) allKeys];
  uint64_t v43 = a1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  id v3 = +[NSDate date];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v2;
  id v37 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
  if (v37)
  {
    uint64_t v36 = *(void *)v49;
    *(void *)&long long v4 = 138412802;
    long long v34 = v4;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v49 != v36) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v48 + 1) + 8 * v5);
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(v43 + 32) + 12));
        int v7 = [*(id *)(*(void *)(v43 + 32) + 120) objectForKeyedSubscript:v6];
        id v8 = [v7 copy];
        uint64_t v9 = v8;
        if (v8)
        {
          id v10 = v8;
        }
        else
        {
          id v10 = +[NSSet set];
        }
        id v11 = v10;

        uint64_t v12 = [*(id *)(*(void *)(v43 + 32) + 112) objectForKeyedSubscript:v6];
        id v13 = [v12 copy];
        long long v14 = v13;
        uint64_t v42 = v5;
        if (v13)
        {
          id v15 = v13;
        }
        else
        {
          id v15 = +[NSSet set];
        }
        double v16 = v15;

        int v41 = v11;
        [v16 setByAddingObjectsFromSet:v11];
        v40 = uint64_t v39 = v6;
        id v38 = [[*(id *)(v43 + 32) currentLoadFromActivities:inGroupWithName:];
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v43 + 32) + 12));
        double v17 = +[NSMutableArray array];
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        id v18 = v16;
        id v19 = [v18 countByEnumeratingWithState:&v44 objects:v58 count:16];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = *(void *)v45;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(void *)v45 != v21) {
                objc_enumerationMutation(v18);
              }
              long long v23 = *(void **)(*((void *)&v44 + 1) + 8 * i);
              uint64_t v24 = [v23 startDate:v34];
              if (v24)
              {
                __int16 v25 = (void *)v24;
                int v26 = [v23 startDate];
                [v3 timeIntervalSinceDate:v26];
                double v28 = v27;

                if (v28 > 60.0)
                {
                  double v29 = [v23 name];
                  [v17 addObject:v29];

                  long long v30 = *(void **)(v43 + 32);
                  long long v31 = [v23 startDate];
                  long long v32 = +[NSDate now];
                  LODWORD(v30) = [v30 shouldSuspendLongRunningActivity:v23 withStartDate:v31 whileBlockingOtherTasks:0 atDate:v32];

                  if (v30)
                  {
                    [*(id *)(v43 + 32) updateSuspendRequestDate:v3 forActivity:v23 withReason:@"Limitations"];
                    [*(id *)(v43 + 32) suspendActivity:v23];
                  }
                }
              }
            }
            id v20 = [v18 countByEnumeratingWithState:&v44 objects:v58 count:16];
          }
          while (v20);
        }

        if ([v17 count])
        {
          long long v33 = +[_DASDaemonLogger logForCategory:@"lifecycle(activityGroup)"];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v34;
            uint64_t v53 = v39;
            __int16 v54 = 2048;
            id v55 = v38;
            __int16 v56 = 2112;
            v57 = v17;
            _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Current load for group %@ is %lld. Long running activities are %@", buf, 0x20u);
          }
        }
        uint64_t v5 = v42 + 1;
      }
      while ((id)(v42 + 1) != v37);
      id v37 = [obj countByEnumeratingWithState:&v48 objects:v59 count:16];
    }
    while (v37);
  }
}

void sub_1000B0DC0(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  if (*(double *)(a1 + 56) >= 120.0) {
    double v3 = *(double *)(a1 + 56);
  }
  else {
    double v3 = 120.0;
  }
  if (v2 > v3 + -60.0) {
    double v2 = v3 + -60.0;
  }
  if (v2 >= 60.0) {
    double v4 = v2;
  }
  else {
    double v4 = 60.0;
  }
  double v5 = (double)arc4random_uniform(0xB4u) + 510.0;
  uint32_t v6 = arc4random_uniform(0xB4u);
  if (v4 >= v5) {
    double v4 = v5;
  }
  if (v3 >= (double)v6 + 810.0) {
    double v3 = (double)v6 + 810.0;
  }
  unsigned int v7 = +[_DASSystemContext isPluggedIn:*(void *)(*(void *)(a1 + 32) + 680)];
  if (*(unsigned char *)(a1 + 64)) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v7;
  }
  if (!*(unsigned char *)(a1 + 64) && v7 && v3 < 60.0) {
    double v3 = (double)arc4random_uniform(0xAu) + 60.0;
  }
  uint64_t v9 = +[NSDate date];
  uint64_t v10 = [v9 dateByAddingTimeInterval:v3];
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 208);
  *(void *)(v11 + 20_Block_object_dispose(&STACK[0x200], 8) = v10;

  uint64_t v13 = [v9 dateByAddingTimeInterval:v4];
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = *(void **)(v14 + 200);
  *(void *)(v14 + 200) = v13;

  [*(id *)(*(void *)(a1 + 32) + 192) scheduleOnBehalfOf:*(void *)(a1 + 40) between:v8 and:v4 waking:v3];
  double v16 = +[NSLocale currentLocale];
  double v17 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = *(unsigned __int8 *)(a1 + 64);
    id v19 = [*(id *)(*(void *)(a1 + 32) + 200) descriptionWithLocale:v16];
    id v20 = [*(id *)(*(void *)(a1 + 32) + 208) descriptionWithLocale:v16];
    uint64_t v21 = *(void *)(a1 + 40);
    v22[0] = 67110146;
    v22[1] = v8;
    __int16 v23 = 1024;
    int v24 = v18;
    __int16 v25 = 2112;
    int v26 = v19;
    __int16 v27 = 2112;
    double v28 = v20;
    __int16 v29 = 2112;
    uint64_t v30 = v21;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Setting timer (isWaking=%u, activityRequiresWaking=%u) between %@ and %@ for %@", (uint8_t *)v22, 0x2Cu);
  }
}

id sub_1000B114C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 296) deleteOldActivities];
}

void sub_1000B168C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1000B16B4(uint64_t a1, void *a2, int a3)
{
  if (a3)
  {
    id v4 = a2;
    double v5 = +[_DASDataProtectionStateMonitor dataProtectionClassC];
    unsigned int v6 = [v4 isEqualToString:v5];

    if (v6)
    {
      unsigned int v7 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Class C now available. Loading activities.", v10, 2u);
      }

      os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
      if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
      {
        [*(id *)(a1 + 32) loadStateWhenAvailable];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 40) + 8) + 32));
      uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 504);
      uint64_t v9 = +[_DASFileProtection completeUntilFirstUserAuthentication];
      [v8 refreshGroupsWithFileProtection:v9];
    }
  }
}

void sub_1000B2ED8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 isBackgroundTaskActivity]
          && ([v9 isContactTracingBackgroundActivity] & 1) == 0)
        {
          [*(id *)(a1 + 32) addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

id sub_1000B3DF8(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleSysdiagnoseStartEvent];
}

void sub_1000B4150(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000B423C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    uint64_t v8 = _DASLaunchReasonBackgroundRemoteNotification;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v11 = [v10 launchReason];
        unsigned int v12 = [v11 isEqualToString:v8];

        if (v12) {
          [*(id *)(a1 + 32) addObject:v10];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

void sub_1000B4448(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v9 isBackgroundTaskActivity]) {
          [*(id *)(a1 + 32) addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

void sub_1000B4848(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000B4EAC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000B4FF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000B5138(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000B52F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000B540C(uint64_t a1)
{
  double v2 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000FE5A4();
  }

  double v3 = [*(id *)(a1 + 32) startHandler];
  v3[2](v3, *(void *)(a1 + 32));
}

void sub_1000B5F24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,id location)
{
  objc_destroyWeak(v57);
  objc_destroyWeak(v56);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1000B5F64(uint64_t a1, void *a2)
{
  return [a2 runActivities:*(void *)(a1 + 32)];
}

void sub_1000B5F70(uint64_t a1)
{
  double v2 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v6 = 138412290;
    id v7 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%@ about to expire, warning", (uint8_t *)&v6, 0xCu);
  }
  id v4 = *(void **)(a1 + 32);
  id v5 = +[NSSet setWithObject:*(void *)(a1 + 40)];
  [v4 warnBGTaskClientsForActivitiesAboutToExpire:v5];
}

void sub_1000B6064(uint64_t a1, int a2)
{
  id v4 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    int v6 = WeakRetained;
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    id v16 = WeakRetained;
    __int16 v17 = 2112;
    CFStringRef v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Assertion %@ invalidated, server-initiated: %@", buf, 0x16u);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000B629C;
  _DWORD v13[3] = &unk_100175570;
  long long v14 = *(_OWORD *)(a1 + 32);
  dispatch_async(*(dispatch_queue_t *)(v14 + 328), v13);
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 512) hostAssertionAssociatedWithActivity:*(void *)(a1 + 40) targetPID:[*(id *)(a1 + 40) pid]];
  uint64_t v9 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      long long v11 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      id v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Invalidating host assertion along with the extension assertion for %@", buf, 0xCu);
    }

    [*(id *)(*(void *)(a1 + 32) + 512) invalidateAssertionsForActivity:*(void *)(a1 + 40)];
  }
  else
  {
    if (v10)
    {
      long long v12 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      id v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No host assertion associated with %@, skipping invalidation", buf, 0xCu);
    }
  }
}

uint64_t sub_1000B629C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 496) reportActivityNoLongerRunning:*(void *)(a1 + 40)];
  os_unfair_recursive_lock_lock_with_options();
  [*(id *)(a1 + 40) setAssertion:0];

  return os_unfair_recursive_lock_unlock();
}

id sub_1000B62FC(uint64_t a1, void *a2)
{
  return [a2 runActivitiesWithDelayedStart:*(void *)(a1 + 32)];
}

void sub_1000B6AA0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000B7450(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = [v4 result];
  int v6 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = *(void **)(a1 + 40);
    CFStringRef v7 = *(void **)(a1 + 48);
    uint64_t v9 = v6;
    BOOL v10 = [v7 launchReason];
    long long v11 = +[NSNumber numberWithUnsignedInteger:v5];
    *(_DWORD *)buf = 138412802;
    __int16 v23 = v8;
    __int16 v24 = 2112;
    __int16 v25 = v10;
    __int16 v26 = 2112;
    __int16 v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Launch for %@ with reason %@ result: %@", buf, 0x20u);
  }
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 56), 0xFFFFFFFFFFFFFFFFLL);
  os_unfair_recursive_lock_lock_with_options();
  long long v12 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    long long v13 = *(void **)(a1 + 48);
    long long v14 = v12;
    long long v15 = [v13 assertion];
    id v16 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    __int16 v23 = v15;
    __int16 v24 = 2112;
    __int16 v25 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Invalidating assertion %@ for %@", buf, 0x16u);
  }
  __int16 v17 = [*(id *)(a1 + 48) assertion];
  id v21 = 0;
  unsigned __int8 v18 = [v17 invalidateWithError:&v21];
  id v19 = v21;

  if ((v18 & 1) == 0)
  {
    if (v19)
    {
      id v20 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_1000FE67C((void **)(a1 + 48), v20, (uint64_t)v19);
      }
    }
  }
  os_unfair_recursive_lock_unlock();
}

void sub_1000B76AC(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  double v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 72);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000B7808;
  v8[3] = &unk_100177C98;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 80);
  id v11 = *(id *)(a1 + 56);
  id v12 = *(id *)(a1 + 40);
  id v16 = *(id *)(a1 + 104);
  id v17 = *(id *)(a1 + 112);
  id v6 = *(id *)(a1 + 88);
  uint64_t v7 = *(void *)(a1 + 48);
  id v13 = v6;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 96);
  id v18 = *(id *)(a1 + 120);
  [v2 launchApplication:v3 applicationURL:v4 additionalOptions:v5 completion:v8];
}

void sub_1000B7808(uint64_t a1, unsigned int a2, void *a3)
{
  id v47 = a3;
  unsigned int v52 = a2;
  if (a2)
  {
    (*(void (**)(void))(*(void *)(a1 + 96) + 16))();
    uint64_t v5 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      v80 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Successful launch for %@", buf, 0xCu);
    }
    if (os_log_type_enabled(*(os_log_t *)(a1 + 40), OS_LOG_TYPE_DEBUG)) {
      sub_1000FE768();
    }
    long long v50 = +[NSMutableSet set];
    long long v48 = +[NSMutableSet set];
    long long v76 = 0u;
    long long v77 = 0u;
    long long v74 = 0u;
    long long v75 = 0u;
    id obj = *(id *)(a1 + 64);
    id v53 = [obj countByEnumeratingWithState:&v74 objects:v78 count:16];
    if (v53)
    {
      uint64_t v51 = *(void *)v75;
      do
      {
        for (i = 0; i != v53; i = (char *)i + 1)
        {
          if (*(void *)v75 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v8 = *(void **)(*((void *)&v74 + 1) + 8 * i);
          id v9 = *(NSObject **)(a1 + 40);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v80 = v8;
            _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Current activity %@", buf, 0xCu);
          }
          id v10 = [*(id *)(*(void *)(a1 + 72) + 512) createUnmanagedAssertionForActivity:v8 targetPID:v52];
          if (v10)
          {
            objc_initWeak(&location, v10);
            v67[0] = _NSConcreteStackBlock;
            v67[1] = 3221225472;
            v67[2] = sub_1000B8280;
            v67[3] = &unk_100177C20;
            id v68 = *(id *)(a1 + 40);
            objc_copyWeak(&v72, &location);
            id v11 = *(id *)(a1 + 48);
            uint64_t v12 = *(void *)(a1 + 72);
            id v69 = v11;
            uint64_t v70 = v12;
            v71 = v8;
            [v10 setWarningHandler:v67];
            if ([v8 isBackgroundTaskActivity])
            {
              id v13 = 0;
            }
            else
            {
              id v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 1uLL, *(dispatch_queue_t *)(*(void *)(a1 + 72) + 328));
              dispatch_time_t v15 = dispatch_time(0, 29000000000);
              dispatch_source_set_timer(v13, v15, 0xFFFFFFFFFFFFFFFFLL, 0x1DCD6500uLL);
              id v16 = *(void **)(a1 + 80);
              id v17 = [v8 uuid];
              id v18 = [v16 objectForKeyedSubscript:v17];

              handler[0] = _NSConcreteStackBlock;
              handler[1] = 3221225472;
              handler[2] = sub_1000B837C;
              handler[3] = &unk_1001754F8;
              id v66 = v18;
              id v19 = v18;
              dispatch_source_set_event_handler(v13, handler);
              dispatch_activate(v13);
            }
            v55[0] = _NSConcreteStackBlock;
            v55[1] = 3221225472;
            v55[2] = sub_1000B8384;
            v55[3] = &unk_100177C70;
            id v56 = *(id *)(a1 + 32);
            objc_copyWeak(&v64, &location);
            id v57 = *(id *)(a1 + 40);
            id v58 = *(id *)(a1 + 48);
            id v20 = v13;
            uint64_t v21 = *(void *)(a1 + 72);
            v59 = v20;
            uint64_t v60 = v21;
            v61 = v8;
            id v22 = v50;
            id v62 = v22;
            id v63 = *(id *)(a1 + 104);
            [v10 setInvalidationHandler:v55];
            os_unfair_recursive_lock_lock_with_options();
            __int16 v23 = [v8 assertion];
            unsigned int v24 = [v23 isValid];

            if (v24)
            {
              __int16 v25 = *(id *)(a1 + 40);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                long long v33 = [v8 assertion];
                *(_DWORD *)buf = 138412546;
                v80 = v8;
                __int16 v81 = 2112;
                id v82 = v33;
                _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Activity %@ was launched while it has an existing valid assertion: %@. Skipping this activity", buf, 0x16u);
              }
              os_unfair_recursive_lock_unlock();
              goto LABEL_32;
            }
            id v54 = 0;
            unsigned int v26 = [v10 acquireWithError:&v54];
            id v27 = v54;
            if (v26)
            {
              [v8 setAssertion:v10];
              [v22 addObject:v10];
              double v28 = *(NSObject **)(a1 + 40);
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v80 = v10;
                __int16 v81 = 2112;
                id v82 = v8;
                _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Assertion %@ acquired for task %@", buf, 0x16u);
              }
            }
            else
            {
              __int16 v29 = *(NSObject **)(a1 + 40);
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                long long v34 = *(void **)(a1 + 48);
                *(_DWORD *)buf = 138412546;
                v80 = v34;
                __int16 v81 = 2112;
                id v82 = v27;
                _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to acquire assertion for %@, error: %@", buf, 0x16u);
              }
            }

            os_unfair_recursive_lock_unlock();
            if (v26)
            {
              [*(id *)(*(void *)(a1 + 72) + 496) reportActivityRunning:v8];
              if ([v8 isBackgroundTaskActivity]) {
                [v48 addObject:v8];
              }
            }
            else
            {
LABEL_32:
              if (v20)
              {
                uint64_t v30 = *(void **)(a1 + 80);
                long long v31 = [v8 uuid];
                long long v32 = [v30 objectForKeyedSubscript:v31];
                [v32 invalidate];

                dispatch_source_cancel(v20);
              }
            }

            objc_destroyWeak(&v64);
            objc_destroyWeak(&v72);

            objc_destroyWeak(&location);
            goto LABEL_35;
          }
          uint64_t v14 = +[_DASDaemonLogger logForCategory:@"BackgroundTasks"];
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v80 = v8;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "No host assertion associated with %@, skipping continuing", buf, 0xCu);
          }

LABEL_35:
        }
        id v53 = [obj countByEnumeratingWithState:&v74 objects:v78 count:16];
      }
      while (v53);
    }

    if ([v50 count])
    {
      if ([v48 count])
      {
        uint64_t v35 = [*(id *)(a1 + 72) connectedBGTaskClients];
        objc_sync_enter(v35);
        uint64_t v36 = [*(id *)(a1 + 72) connectedBGTaskClients];
        id v37 = +[NSNumber numberWithInt:v52];
        id v38 = [v36 objectForKeyedSubscript:v37];

        if (v38)
        {
          [v38 handleLaunchFromDaemonForActivities:v48];
        }
        else
        {
          int v41 = [*(id *)(a1 + 72) activitiesWaitingForBGTaskClients];
          uint64_t v42 = +[NSNumber numberWithInt:v52];
          uint64_t v43 = [v41 objectForKeyedSubscript:v42];

          if (!v43)
          {
            uint64_t v43 = +[NSMutableSet set];
            long long v44 = [*(id *)(a1 + 72) activitiesWaitingForBGTaskClients];
            long long v45 = +[NSNumber numberWithInt:v52];
            [v44 setObject:v43 forKeyedSubscript:v45];
          }
          long long v46 = *(NSObject **)(a1 + 40);
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v80 = v48;
            __int16 v81 = 1024;
            LODWORD(v82) = v52;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Queueing activities %@ until app with pid %d launches", buf, 0x12u);
          }
          [v43 unionSet:v48];
          [*(id *)(a1 + 72) scheduleConnectionTimeoutForPid:v52];
        }
        objc_sync_exit(v35);
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(a1 + 40), OS_LOG_TYPE_ERROR)) {
        sub_1000FE734();
      }
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
      (*(void (**)(void))(*(void *)(a1 + 104) + 16))();
    }
  }
  else
  {
    uint64_t v39 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      uint64_t v40 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v80 = v40;
      __int16 v81 = 2112;
      id v82 = v47;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Error launching %@: %@", buf, 0x16u);
    }
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
  }
}

void sub_1000B8218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,id location)
{
  objc_sync_exit(v52);
  _Unwind_Resume(a1);
}

void sub_1000B8280(uint64_t a1)
{
  double v2 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = v2;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    uint64_t v5 = *(void *)(a1 + 40);
    int v8 = 138412546;
    id v9 = WeakRetained;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Assertion %@ for app %@ about to expire, warning", (uint8_t *)&v8, 0x16u);
  }
  id v6 = *(void **)(a1 + 48);
  uint64_t v7 = +[NSSet setWithObject:*(void *)(a1 + 56)];
  [v6 warnBGTaskClientsForActivitiesAboutToExpire:v7];
}

id sub_1000B837C(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_1000B8384(uint64_t a1, int a2)
{
  uint64_t v4 = (id *)(a1 + 96);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 96));
  id v6 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    id v8 = objc_loadWeakRetained(v4);
    uint64_t v9 = *(void *)(a1 + 48);
    CFStringRef v10 = @"NO";
    *(_DWORD *)buf = 138412802;
    id v22 = v8;
    if (a2) {
      CFStringRef v10 = @"YES";
    }
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    __int16 v25 = 2112;
    CFStringRef v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Assertion %@ for app %@ invalidated, server-initiated: %@", buf, 0x20u);
  }
  uint64_t v11 = *(NSObject **)(a1 + 56);
  if (v11) {
    dispatch_source_cancel(v11);
  }
  uint64_t v12 = *(NSObject **)(*(void *)(a1 + 64) + 328);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B8560;
  block[3] = &unk_100177C48;
  id v15 = *(id *)(a1 + 32);
  long long v16 = *(_OWORD *)(a1 + 64);
  id v17 = *(id *)(a1 + 80);
  id v18 = WeakRetained;
  id v19 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 88);
  id v13 = WeakRetained;
  dispatch_async(v12, block);
}

id sub_1000B8560(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 40) + 496) reportActivityNoLongerRunning:*(void *)(a1 + 48)];
  os_unfair_recursive_lock_lock_with_options();
  [*(id *)(a1 + 48) setAssertion:0];
  [*(id *)(a1 + 56) removeObject:*(void *)(a1 + 64)];
  os_unfair_recursive_lock_unlock();
  id result = [*(id *)(a1 + 56) count];
  if (!result)
  {
    uint64_t v3 = *(NSObject **)(a1 + 72);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Calling completion", v4, 2u);
    }
    return (id)(*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  return result;
}

void sub_1000B883C(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1[4];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v5;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Process: %@, Error: %@", (uint8_t *)&v12, 0x16u);
  }
  if ([v6 code] == (id)6 || objc_msgSend(v6, "code") == (id)7)
  {
    id v8 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)a1[5];
      int v12 = 138412546;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Error servicing launch request for %@: %@", (uint8_t *)&v12, 0x16u);
    }

    CFStringRef v10 = *(void (**)(void))(a1[6] + 16);
  }
  else
  {
    uint64_t v11 = a1[6];
    [v5 pid];
    CFStringRef v10 = *(void (**)(void))(v11 + 16);
  }
  v10();
}

id sub_1000B8DBC(uint64_t a1)
{
  double v2 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Suspending extension launch activity %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) suspendActivity:*(void *)(a1 + 32)];
}

void sub_1000B99AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000B99C8(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B9A60;
  block[3] = &unk_100175548;
  long long v3 = *(_OWORD *)(a1 + 32);
  id v1 = *(NSObject **)(v3 + 328);
  id v4 = *(id *)(a1 + 48);
  dispatch_async(v1, block);
}

void sub_1000B9A60(uint64_t a1)
{
  os_unfair_recursive_lock_lock_with_options();
  long long v3 = [*(id *)(*(void *)(a1 + 32) + 136) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v3 minusSet:*(void *)(a1 + 48)];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 144) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v4)
  {
    id v4 = +[NSMutableSet set];
    [*(id *)(*(void *)(a1 + 32) + 144) setObject:v4 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  [v4 unionSet:*(void *)(a1 + 48)];

  os_unfair_recursive_lock_unlock();
  id v5 = [*(id *)(a1 + 48) mutableCopy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = *(id *)(a1 + 48);
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        int v12 = [v11 startHandler];

        if (v12) {
          [v5 removeObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v13 = v5;
  id v14 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v19;
    do
    {
      for (j = 0; j != v15; j = (char *)j + 1)
      {
        if (*(void *)v19 != v16) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(a1 + 32) moveActivityToRunning:*(void *)(*((void *)&v18 + 1) + 8 * (void)j) (void)v18];
      }
      id v15 = [v13 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v15);
  }
}

void sub_1000B9CB4(void *a1)
{
  double v2 = *(NSObject **)(a1[5] + 328);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000B9D50;
  block[3] = &unk_100175548;
  long long v3 = (void *)a1[7];
  void block[4] = a1[6];
  id v4 = v3;
  uint64_t v5 = a1[5];
  id v7 = v4;
  uint64_t v8 = v5;
  dispatch_async(v2, block);
}

void sub_1000B9D50(uint64_t a1)
{
  double v2 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000FE7D4();
  }

  id v4 = [*(id *)(a1 + 40) mutableCopy];
  uint64_t v5 = +[NSMutableSet set];
  os_unfair_recursive_lock_lock_with_options();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = *(id *)(a1 + 40);
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v11 isBackgroundTaskActivity])
        {
          [v4 removeObject:v11];
          if ([*(id *)(*(void *)(a1 + 48) + 64) containsObject:v11]) {
            [v5 addObject:v11];
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v8);
  }

  os_unfair_recursive_lock_unlock();
  [*(id *)(a1 + 48) runActivitiesAndRemoveUnknown:v4];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(a1 + 48) activityCompleted:*(void *)(*((void *)&v18 + 1) + 8 * (void)j) (void)v18];
      }
      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  os_unfair_recursive_lock_lock_with_options();
  id v17 = [*(id *)(*(void *)(a1 + 48) + 144) objectForKeyedSubscript:*(void *)(a1 + 32)];
  [v17 minusSet:*(void *)(a1 + 40)];

  os_unfair_recursive_lock_unlock();
}

void sub_1000B9FEC(uint64_t a1)
{
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = *(id *)(a1 + 40);
  id v2 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v32;
    uint64_t v5 = (os_unfair_lock_s **)(a1 + 48);
    uint64_t v29 = kNWEndpointKey;
    p_vtable = &OBJC_METACLASS____DASPolicyResponseRationale.vtable;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v32 != v4) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v7);
        os_unfair_recursive_lock_lock_with_options();
        id v9 = [*(id *)&(*v5)[16]._os_unfair_lock_opaque count];
        [*(id *)&(*v5)[14]._os_unfair_lock_opaque removeObject:v8];
        [*(id *)&(*v5)[16]._os_unfair_lock_opaque removeObject:v8];
        [*(id *)&(*v5)[12]._os_unfair_lock_opaque addObject:v8];
        if (v9) {
          [*(id *)&(*v5)[16]._os_unfair_lock_opaque count];
        }
        CFStringRef v10 = [p_vtable + 447 logForCategory:@"runningTasks"];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_1000FE858(v41, a1 + 48, &v42, v10);
        }

        os_unfair_recursive_lock_unlock();
        os_unfair_recursive_lock_lock_with_options();
        uint64_t v11 = [*(id *)(*(void *)(a1 + 48) + 136) objectForKeyedSubscript:*(void *)(a1 + 56)];
        [v11 unionSet:*(void *)(a1 + 40)];

        id v12 = [*(id *)(*(void *)(a1 + 48) + 144) objectForKeyedSubscript:*(void *)(a1 + 56)];
        [v12 minusSet:*(void *)(a1 + 40)];

        os_unfair_recursive_lock_unlock();
        id v13 = [v8 groupName];

        if (v13)
        {
          id v14 = [v8 groupName];
          os_unfair_lock_lock(*v5 + 3);
          uint64_t v15 = [*(id *)&(*v5)[28]._os_unfair_lock_opaque objectForKeyedSubscript:v14];
          [v15 removeObject:v8];

          uint64_t v16 = [*(id *)&(*v5)[30]._os_unfair_lock_opaque objectForKeyedSubscript:v14];
          [v16 removeObject:v8];

          id v17 = [p_vtable + 447 logForCategory:@"lifecycle(activityGroup)"];
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            long long v18 = [v8 groupName];
            long long v19 = [*(id *)&(*v5)[28]._os_unfair_lock_opaque objectForKeyedSubscript:v14];
            id v20 = [v19 count];
            *(_DWORD *)buf = 138543874;
            uint64_t v36 = v8;
            __int16 v37 = 2112;
            id v38 = v18;
            __int16 v39 = 2048;
            id v40 = v20;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "NO LONGER RUNNING [Failed to activate] %{public}@ ...Tasks running in group [%@] are %ld!", buf, 0x20u);

            p_vtable = (void **)(&OBJC_METACLASS____DASPolicyResponseRationale + 24);
          }

          long long v21 = [*(id *)&(*v5)[26]._os_unfair_lock_opaque objectForKeyedSubscript:v14];
          if (v21)
          {
            long long v22 = v21;
            [v21 addObject:v8];
          }
          else
          {
            long long v22 = +[NSMutableSet setWithObject:v8];
            [*(id *)&(*v5)[26]._os_unfair_lock_opaque setObject:v22 forKeyedSubscript:v14];
          }
          os_unfair_lock_unlock(*v5 + 3);
        }
        if ([*(id *)&(*v5)[54]._os_unfair_lock_opaque requiresNetworkPathMonitoring:v8])
        {
          long long v23 = *(void **)&(*v5)[54]._os_unfair_lock_opaque;
          long long v24 = [v8 uuid];
          long long v25 = +[_DASNetworkEvaluationMonitor nwParametersForActivity:v8];
          CFStringRef v26 = [v8 userInfo];
          id v27 = [v26 objectForKeyedSubscript:v29];
          double v28 = v23;
          p_vtable = (void **)(&OBJC_METACLASS____DASPolicyResponseRationale + 24);
          [v28 startMonitoringActivity:v24 withNetworkParameters:v25 withEndpoint:v27];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v3 != v7);
      id v3 = [obj countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v3);
  }
}

id sub_1000BA5FC(uint64_t a1)
{
  if ((int)[*(id *)(a1 + 32) pid] >= 1)
  {
    id v2 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_1000FE940(a1, v2);
    }
  }
  return [*(id *)(a1 + 40) unload];
}

void sub_1000BA7B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000BB03C(uint64_t a1, void *a2)
{
  return [a2 suspendActivities:*(void *)(a1 + 32)];
}

uint64_t sub_1000BB048(uint64_t a1)
{
  os_unfair_recursive_lock_lock_with_options();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v2 = *(id *)(a1 + 40);
  id v3 = [v2 countByEnumeratingWithState:&v25 objects:v35 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v26;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if ([v7 isBackgroundTaskActivity])
        {
          id v8 = [v7 assertion];
          unsigned int v9 = [v8 isValid];

          if (v9)
          {
            CFStringRef v10 = +[_DASDaemonLogger logForCategory:@"bar"];
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v11 = [v7 assertion];
              signed int v12 = [v11 pid];
              *(_DWORD *)buf = 138412546;
              long long v32 = v7;
              __int16 v33 = 2048;
              uint64_t v34 = v12;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "BGTask activity %@ did not respond to suspension. Dropping assertion for app with pid: %ld", buf, 0x16u);
            }
            id v13 = [v7 assertion];
            id v24 = 0;
            unsigned __int8 v14 = [v13 invalidateWithError:&v24];
            id v15 = v24;

            if ((v14 & 1) == 0)
            {
              uint64_t v16 = +[_DASDaemonLogger logForCategory:@"bar"];
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
                sub_1000FE9D0(v29, v7, &v30, v16);
              }
            }
            id v17 = [v7 clientProvidedIdentifier];
            long long v18 = +[NSString stringWithFormat:@"setTaskCompleted was not called in time after the BGTask with identifier (%@)'s expiration handler was called.", v17];

            long long v19 = dispatch_get_global_queue(-32768, 0);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_1000BB378;
            block[3] = &unk_100175570;
            void block[4] = v7;
            id v23 = v18;
            id v20 = v18;
            dispatch_async(v19, block);
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v25 objects:v35 count:16];
    }
    while (v4);
  }

  return os_unfair_recursive_lock_unlock();
}

void sub_1000BB378(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) assertion];
  [v1 pid];
  char v2 = SimulateCrash();

  if ((v2 & 1) == 0)
  {
    id v3 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000FEA50();
    }
  }
}

uint64_t sub_1000BB3F8(uint64_t a1)
{
  os_unfair_recursive_lock_lock_with_options();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v2 = *(id *)(a1 + 40);
  id v3 = [v2 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v34;
    uint64_t v30 = _DASLaunchReasonBackgroundFetch;
    id v29 = v2;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v34 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        [*(id *)(a1 + 32) releaseAssertion:v7];
        id v8 = [v7 name];
        unsigned __int8 v9 = [v8 hasPrefix:@"com.apple.dasd"];

        if ((v9 & 1) == 0)
        {
          if (![v7 requestsApplicationLaunch]) {
            goto LABEL_24;
          }
          uint64_t v10 = [v7 startHandler];
          if (!v10
            || (uint64_t v11 = (void *)v10,
                [v7 launchReason],
                signed int v12 = objc_claimAutoreleasedReturnValue(),
                unsigned __int8 v13 = [v12 isEqualToString:v30],
                v12,
                v11,
                (v13 & 1) == 0))
          {
LABEL_24:
            if ((int)[v7 pid] >= 1)
            {
              uint64_t v14 = [v7 suspendRequestDate];
              if (v14)
              {
                id v15 = (void *)v14;
                unsigned int v16 = [*(id *)(*(void *)(a1 + 32) + 64) containsObject:v7];

                if (v16)
                {
                  id v17 = +[_DASDaemonLogger defaultCategory];
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                  {
                    long long v18 = [v7 name];
                    *(_DWORD *)buf = 138412290;
                    id v38 = v18;
                    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Activity %@ asked to suspend 10s ago but has not yet suspended. Generating crash report.", buf, 0xCu);
                  }
                  long long v19 = [v7 name];
                  id v20 = +[NSString stringWithFormat:@"XPC Activity %@ did not terminate in timely fashion when asked to suspend. The activity should be frequently checking xpc_activity_should_defer() and correspondingly setting the state to XPC_ACTIVITY_STATE_DEFER or XPC_ACTIVITY_STATE_DONE as appropriate.", v19];

                  long long v21 = dispatch_get_global_queue(-32768, 0);
                  block[0] = _NSConcreteStackBlock;
                  block[1] = 3221225472;
                  block[2] = sub_1000BB824;
                  block[3] = &unk_100175570;
                  void block[4] = v7;
                  id v32 = v20;
                  id v22 = v20;
                  dispatch_async(v21, block);

                  +[_DASMetricRecorder recordOccurrenceForKey:@"com.apple.dasd.xpc.notdeferred"];
                  id v23 = [v7 name];
                  id v24 = +[NSString stringWithFormat:@"com.apple.dasd.xpc.notdeferred.%@", v23];

                  +[_DASMetricRecorder recordOccurrenceForKey:@"com.apple.dasd.xpc.notdeferred"];
                  +[_DASMetricRecorder recordOccurrenceForKey:v24];

                  id v2 = v29;
                }
              }
            }
            uint64_t v25 = [v7 suspendRequestDate];
            if (v25)
            {
              long long v26 = (void *)v25;
              long long v27 = [v7 startDate];

              if (v27) {
                AnalyticsSendEventLazy();
              }
            }
          }
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v4);
  }

  return os_unfair_recursive_lock_unlock();
}

void sub_1000BB824(uint64_t a1)
{
  [*(id *)(a1 + 32) pid];
  if ((SimulateCrash() & 1) == 0)
  {
    id v1 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_1000FEA50();
    }
  }
}

id sub_1000BB890(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  if ([*(id *)(*(void *)(a1 + 32) + 64) containsObject:*(void *)(a1 + 40)]) {
    id v3 = &__kCFBooleanFalse;
  }
  else {
    id v3 = &__kCFBooleanTrue;
  }
  [v2 setObject:v3 forKeyedSubscript:@"suspended"];
  [v2 setObject:&off_100187360 forKeyedSubscript:@"limit"];
  id v4 = [*(id *)(a1 + 40) identifier];
  id v5 = [v4 copy];
  if ([v4 hasPrefix:@"com.apple."])
  {
    uint64_t v6 = [v4 substringFromIndex:[@"com.apple." length]];

    id v5 = (id)v6;
  }
  if ((unint64_t)[v5 length] >= 0x1E)
  {
    uint64_t v7 = [v5 substringToIndex:30];

    id v5 = (id)v7;
  }
  [v2 setObject:v5 forKeyedSubscript:@"identifier"];

  return v2;
}

id sub_1000BB9C8(uint64_t a1)
{
  return [*(id *)(a1 + 32) releaseAssertions:*(void *)(a1 + 40)];
}

id sub_1000BBBA0(uint64_t a1, void *a2)
{
  return [a2 cancelActivities:*(void *)(a1 + 32)];
}

id sub_1000BBC68(uint64_t a1, void *a2)
{
  return [a2 activity:*(void *)(a1 + 32) blockedOnPolicies:*(void *)(a1 + 40)];
}

id sub_1000BBD30(uint64_t a1, void *a2)
{
  return [a2 activity:*(void *)(a1 + 32) runWithoutHonoringPolicies:*(void *)(a1 + 40)];
}

void sub_1000BC790(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000BCE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1000BCEB0(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v66 = a2;
  [a3 score];
  if (+[_DASPolicyResponse isScoreBlocking:](_DASPolicyResponse, "isScoreBlocking:"))
  {
    uint64_t v7 = +[_DASLowPowerModePolicy policyInstance];
    id v8 = [v7 policyName];
    if ([v66 isEqualToString:v8])
    {
      int v9 = *(unsigned __int8 *)(a1 + 48);

      if (v9)
      {
LABEL_8:
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v14 = *(void *)(v13 + 24) | 0x20;
LABEL_48:
        *(void *)(v13 + 24) = v14;
        goto LABEL_49;
      }
    }
    else
    {
    }
    uint64_t v10 = +[_DASPhotosPolicy policyInstance];
    uint64_t v11 = [v10 policyName];
    if ([v66 isEqualToString:v11])
    {
      int v12 = *(unsigned __int8 *)(a1 + 49);

      if (v12) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    id v15 = +[_DASPhotosPolicy policyInstance];
    unsigned int v16 = [v15 policyName];
    if ([v66 isEqualToString:v16])
    {
      int v17 = *(unsigned __int8 *)(a1 + 50);

      if (v17)
      {
LABEL_12:
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v14 = *(void *)(v13 + 24) | 4;
        goto LABEL_48;
      }
    }
    else
    {
    }
    long long v18 = +[_DASBatteryLevelPolicy policyInstance];
    long long v19 = [v18 policyName];
    unsigned int v20 = [v66 isEqualToString:v19];

    if (v20)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void *)(v13 + 24) | 8;
      goto LABEL_48;
    }
    long long v21 = +[_DASEnergyBudgetPolicy policyInstance];
    id v22 = [v21 policyName];
    unsigned int v23 = [v66 isEqualToString:v22];

    if (v23)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void *)(v13 + 24) | 2;
      goto LABEL_48;
    }
    id v24 = +[_DASDataBudgetPolicy policyInstance];
    uint64_t v25 = [v24 policyName];
    unsigned int v26 = [v66 isEqualToString:v25];

    if (v26)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void *)(v13 + 24) | 1;
      goto LABEL_48;
    }
    long long v27 = +[_DASNetworkQualityPolicy policyInstance];
    long long v28 = [v27 policyName];
    if ([v66 isEqualToString:v28])
    {
      int v29 = *(unsigned __int8 *)(a1 + 51);

      if (v29)
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v14 = *(void *)(v13 + 24) | 0x10;
        goto LABEL_48;
      }
    }
    else
    {
    }
    uint64_t v30 = +[_DASNetworkQualityPolicy policyInstance];
    long long v31 = [v30 policyName];
    if ([v66 isEqualToString:v31])
    {
      int v32 = *(unsigned __int8 *)(a1 + 52);

      if (v32)
      {
LABEL_30:
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v14 = *(void *)(v13 + 24) | 0x100;
        goto LABEL_48;
      }
    }
    else
    {
    }
    long long v33 = +[_DASNetworkQualityPolicy policyInstance];
    long long v34 = [v33 policyName];
    if ([v66 isEqualToString:v34])
    {
      long long v35 = [*(id *)(a1 + 32) objectForKeyedSubscript:v66];
      id v36 = [v35 decision];

      if (v36 != (id)100) {
        goto LABEL_30;
      }
    }
    else
    {
    }
    __int16 v37 = +[_DASCPUUsagePolicy policyInstance];
    id v38 = [v37 policyName];
    unsigned int v39 = [v66 isEqualToString:v38];

    if (v39)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void *)(v13 + 24) | 0x40;
      goto LABEL_48;
    }
    id v40 = +[_DASMemoryPressurePolicy policyInstance];
    int v41 = [v40 policyName];
    unsigned int v42 = [v66 isEqualToString:v41];

    if (v42)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void *)(v13 + 24) | 0x80;
      goto LABEL_48;
    }
    uint64_t v43 = +[_DASSmartPowerNapPolicy policyInstance];
    long long v44 = [v43 policyName];
    unsigned int v45 = [v66 isEqualToString:v44];

    if (v45)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void *)(v13 + 24) | 0x200;
      goto LABEL_48;
    }
    long long v46 = +[_DASThermalPolicy policyInstance];
    id v47 = [v46 policyName];
    if ([v66 isEqualToString:v47])
    {
      int v48 = *(unsigned __int8 *)(a1 + 53);

      if (v48)
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v14 = *(void *)(v13 + 24) | 0x1000;
        goto LABEL_48;
      }
    }
    else
    {
    }
    long long v49 = +[_DASThermalPolicy policyInstance];
    long long v50 = [v49 policyName];
    unsigned int v51 = [v66 isEqualToString:v50];

    if (v51)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void *)(v13 + 24) | 0x800;
      goto LABEL_48;
    }
    unsigned int v52 = +[_DASThunderingHerdPolicy policyInstance];
    id v53 = [v52 policyName];
    unsigned int v54 = [v66 isEqualToString:v53];

    if (v54)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void *)(v13 + 24) | 0x400;
      goto LABEL_48;
    }
    id v55 = +[_DASGroupSchedulingPolicy policyInstance];
    id v56 = [v55 policyName];
    unsigned int v57 = [v66 isEqualToString:v56];

    if (v57)
    {
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v14 = *(void *)(v13 + 24) | 0x4000;
      goto LABEL_48;
    }
    id v58 = +[_DASRequiresPluggedInPolicy policyInstance];
    v59 = [v58 policyName];
    if ([v66 isEqualToString:v59])
    {
      int v60 = *(unsigned __int8 *)(a1 + 54);

      if (v60) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    v61 = +[_DASDeviceActivityPolicy policyInstance];
    id v62 = [v61 policyName];
    unsigned int v63 = [v66 isEqualToString:v62];

    if (v63)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 0x8000uLL;
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= 4 * *(unsigned __int8 *)(a1 + 55);
    }
    else
    {
      id v64 = [*(id *)(a1 + 32) objectForKeyedSubscript:v66];
      id v65 = [v64 decision];

      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      if (v65 != (id)100)
      {
        uint64_t v14 = *(void *)(v13 + 24) | 0x2000;
        goto LABEL_48;
      }
      *(void *)(v13 + 24) = 0;
      *a4 = 1;
    }
  }
LABEL_49:
}

void sub_1000BD570(uint64_t a1)
{
  unsigned __int8 v2 = +[_DASPhotosPolicy shouldOverrideForIntentSync:*(void *)(*(void *)(a1 + 32) + 520) activity:*(void *)(a1 + 40)];
  id v3 = *(void **)(*(void *)(a1 + 32) + 248);
  if (v2)
  {
    [v3 setPendingUnregistration:0];
    if ([*(id *)(*(void *)(a1 + 32) + 248) anyRemoteDeviceActive])
    {
      id v4 = *(void **)(a1 + 32);
      id v5 = [*(id *)(a1 + 40) name];
      id v15 = v5;
      uint64_t v6 = +[NSArray arrayWithObjects:&v15 count:1];
      [v4 runActivitiesWithUrgency:1 activities:v6];

      uint64_t v7 = +[_DASPhotosPolicy policyInstance];
      [v7 setIntentSyncIsEngaged:1];

      id v8 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        int v9 = "Remote device is active. We should sync Photos now.";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v9, v14, 2u);
      }
    }
    else
    {
      uint64_t v11 = +[_DASUrgencyOverridePolicy policyInstance];
      int v12 = [*(id *)(a1 + 40) name];
      [v11 removeActivity:v12];

      uint64_t v13 = +[_DASPhotosPolicy policyInstance];
      [v13 setIntentSyncIsEngaged:0];

      id v8 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v14 = 0;
        int v9 = "Remote device is not active.";
        goto LABEL_10;
      }
    }

    return;
  }
  [v3 setPendingUnregistration:1];
  uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 248);

  [v10 clearRemoteDeviceActiveSet];
}

void sub_1000BDD64(id *a1, void *a2, void *a3)
{
  id v7 = a2;
  [a3 doubleValue];
  if (v5 < 2.22507386e-308)
  {
    if ([a1[4] count] && !objc_msgSend(a1[4], "containsObject:", v7)) {
      uint64_t v6 = a1 + 6;
    }
    else {
      uint64_t v6 = a1 + 5;
    }
    [*v6 addObject:v7];
  }
}

void sub_1000BDF7C(uint64_t a1)
{
  os_unfair_recursive_lock_lock_with_options();
  unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 56) containsObject:*(void *)(a1 + 40)];
  os_unfair_recursive_lock_unlock();
  if (v2)
  {
    id v3 = +[_DASDaemonLogger logForCategory:@"lifecycle"];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000FEA84();
    }

    id v4 = *(void **)(a1 + 32);
    double v5 = +[NSSet setWithObject:*(void *)(a1 + 40)];
    [v4 cancelActivities:v5];
  }
}

uint64_t sub_1000BE040(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000BE050(uint64_t a1)
{
}

void sub_1000BE058(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  id v7 = [v6 name];
  id v8 = [*(id *)(a1 + 32) name];
  unsigned int v9 = [v7 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ was in pre-running. Removing due to submission of %@", (uint8_t *)&v12, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

void sub_1000BE90C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000BEB28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000BEB50(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 tasksNoLongerEligible];
  [v1 suspendActivities:v2];
}

void sub_1000BF5F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000C0244(uint64_t a1)
{
  return [*(id *)(a1 + 32) unprotectedEvaluateScoreAndRunActivities:*(void *)(a1 + 40)];
}

void sub_1000C0378(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000C038C(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeObject:*(void *)(a1 + 32)];
}

id sub_1000C0454(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeObject:*(void *)(a1 + 32)];
}

void sub_1000C0524(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000C0538(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeObject:*(void *)(a1 + 32)];
}

id sub_1000C0800(uint64_t a1, void *a2, unsigned char *a3)
{
  double v5 = [a2 uuid];
  id v6 = [*(id *)(a1 + 32) uuid];
  id v7 = [v5 isEqual:v6];

  if (v7) {
    *a3 = 1;
  }
  return v7;
}

void sub_1000C0874(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v2 = +[NSArray arrayWithObjects:&v4 count:1];
  id v3 = [v1 tasksNoLongerEligibleFromTasks:v2];
  [v1 suspendActivities:v3];
}

id sub_1000C0D2C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) limitationResponse];
  unsigned __int8 v3 = +[_DASLimiterResponse bitmaskFromResponses:v2];

  uint64_t v4 = +[NSMutableDictionary dictionary];
  double v5 = [*(id *)(a1 + 32) identifier];
  id v6 = [v5 copy];
  if ([v5 hasPrefix:@"com.apple."])
  {
    uint64_t v7 = [v5 substringFromIndex:[@"com.apple." length]];

    id v6 = (id)v7;
  }
  if ((unint64_t)[v6 length] >= 0x1E)
  {
    uint64_t v8 = [v6 substringToIndex:30];

    id v6 = (id)v8;
  }
  unsigned int v9 = [*(id *)(a1 + 32) limitationResponse];
  unsigned int v10 = +[_DASLimiterResponse queryActivityDecision:5 fromResponses:v9];

  if (v10)
  {
    uint64_t v11 = +[_DASRateLimiterUtilities rateLimitIdentifierForActivity:*(void *)(a1 + 32)];

    id v6 = (id)v11;
  }
  [v4 setObject:v6 forKeyedSubscript:@"name"];
  int v12 = +[NSNumber numberWithUnsignedChar:v3];
  [v4 setObject:v12 forKeyedSubscript:@"limitationsValue"];

  if (v3)
  {
    id v13 = +[_DASDaemonLogger logForCategory:@"limitations"];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = [*(id *)(a1 + 32) identifier];
      int v16 = 138412546;
      int v17 = v4;
      __int16 v18 = 2112;
      long long v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Logging limit distribution to CA %@ for activity %@", (uint8_t *)&v16, 0x16u);
    }
  }

  return v4;
}

id sub_1000C0F90(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  uint64_t v4 = *(void *)(a1 + 40);
  unsigned __int8 v3 = (id *)(a1 + 40);
  [*((id *)*(v3 - 1) + 49) maximumRuntimeForActivity:v4];
  double v6 = v5;
  unsigned int v7 = [*((id *)*(v3 - 1) + 49) hasDynamicOverrides:*v3];
  unsigned int v8 = [*((id *)*(v3 - 1) + 49) hasStaticOverrides:*v3];
  CFStringRef v9 = @"none";
  if (v8) {
    CFStringRef v9 = @"static";
  }
  if (v7) {
    CFStringRef v10 = @"dynamic";
  }
  else {
    CFStringRef v10 = v9;
  }
  [v2 setObject:v10 forKeyedSubscript:@"overrides"];
  uint64_t v11 = +[NSNumber numberWithDouble:v6];
  [v2 setObject:v11 forKeyedSubscript:@"durationLimit"];

  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"runtimeLimitApplies"];
  int v12 = [*v3 limitationResponse];
  LODWORD(v11) = +[_DASLimiterResponse queryActivityDecision:3 fromResponses:v12];

  if (v11)
  {
    [v2 setObject:&off_1001873F0 forKeyedSubscript:@"runtimeLimitCount"];
    [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:@"runtimeSuspended"];
  }
  else if ((v7 | v8) != 1)
  {
    goto LABEL_14;
  }
  id v13 = [*v3 identifier];
  id v14 = [v13 copy];
  if ([v13 hasPrefix:@"com.apple."])
  {
    uint64_t v15 = [v13 substringFromIndex:objc_msgSend(@"com.apple.", "length")];

    id v14 = (id)v15;
  }
  if ((unint64_t)[v14 length] >= 0x1E)
  {
    uint64_t v16 = [v14 substringToIndex:30];

    id v14 = (id)v16;
  }
  [v2 setObject:v14 forKeyedSubscript:@"name"];

LABEL_14:
  uint64_t v17 = [*v3 endTime];
  if (v17
    && (__int16 v18 = (void *)v17,
        [*v3 startDate],
        long long v19 = objc_claimAutoreleasedReturnValue(),
        v19,
        v18,
        v19))
  {
    unsigned int v20 = [*v3 endTime];
    long long v21 = [*v3 startDate];
    [v21 timeIntervalSinceDate:v20];
    double v23 = v22;
  }
  else
  {
    id v24 = [*v3 startDate];

    if (!v24) {
      goto LABEL_23;
    }
    uint64_t v25 = +[_DASDaemonLogger logForCategory:@"limitations"];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      sub_1000FEE94(v3, v25);
    }

    unsigned int v20 = [*v3 startDate];
    [v20 timeIntervalSinceNow];
    double v23 = -v26;
  }

  if (v23 > 0.0)
  {
    long long v27 = +[NSNumber numberWithDouble:v23];
    [v2 setObject:v27 forKeyedSubscript:@"runtimeDuration"];

    goto LABEL_26;
  }
LABEL_23:
  long long v28 = +[_DASDaemonLogger logForCategory:@"limitations"];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
    sub_1000FEDD8(v3, v28);
  }

  [v2 setObject:&off_1001873D8 forKeyedSubscript:@"runtimeDuration"];
LABEL_26:
  int v29 = +[_DASDaemonLogger logForCategory:@"limitations"];
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v30 = [*v3 identifier];
    int v32 = 138412546;
    long long v33 = v2;
    __int16 v34 = 2112;
    long long v35 = v30;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Logging runtime durations to CA %@ for activity %@", (uint8_t *)&v32, 0x16u);
  }

  return v2;
}

id sub_1000C245C(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityAnalyticsWithActivity:*(void *)(a1 + 40) didComplete:1];
}

id sub_1000C2B4C(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityAnalyticsWithActivity:*(void *)(a1 + 40) didComplete:0];
}

void sub_1000C334C(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  double v6 = [*(id *)(*(void *)(a1 + 32) + 104) objectForKeyedSubscript:v7];
  if (!v6)
  {
    double v6 = +[NSMutableSet set];
    [*(id *)(*(void *)(a1 + 32) + 104) setObject:v6 forKeyedSubscript:v7];
  }
  [v6 _DAS_unionSetOverridingExisting:v5];
}

void sub_1000C3730(void *a1)
{
  id v2 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    uint64_t v26 = v3;
    __int16 v27 = 2112;
    uint64_t v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "endLaunchWithReason: Requesting end launch for Application %@ with Reason %@", buf, 0x16u);
  }

  os_unfair_recursive_lock_lock_with_options();
  id v5 = [*(id *)(a1[6] + 144) objectForKeyedSubscript:a1[4]];
  double v6 = v5;
  if (v5)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = [v5 countByEnumeratingWithState:&v21 objects:v31 count:16];
    if (!v7) {
      goto LABEL_17;
    }
    id v9 = v7;
    uint64_t v10 = *(void *)v22;
    *(void *)&long long v8 = 138412802;
    long long v20 = v8;
    while (1)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v13 = [v12 launchReason:v20];
        if ([v13 isEqualToString:a1[5]])
        {
          id v14 = [v12 assertion];

          if (!v14) {
            continue;
          }
          uint64_t v15 = +[_DASDaemonLogger defaultCategory];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v16 = a1[4];
            uint64_t v17 = a1[5];
            *(_DWORD *)buf = v20;
            uint64_t v26 = v16;
            __int16 v27 = 2112;
            uint64_t v28 = v17;
            __int16 v29 = 2112;
            uint64_t v30 = v12;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "endLaunchWithReason: Ending launch for Application %@ with Reason %@ and Activity %@", buf, 0x20u);
          }

          id v13 = [v12 assertion];
          [v13 invalidateWithError:0];
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v21 objects:v31 count:16];
      if (!v9)
      {
LABEL_17:
        os_unfair_recursive_lock_unlock();
        goto LABEL_21;
      }
    }
  }
  os_unfair_recursive_lock_unlock();
  __int16 v18 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = a1[4];
    *(_DWORD *)buf = 138412290;
    uint64_t v26 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "endLaunchWithReason: No activities found for Application %@", buf, 0xCu);
  }

LABEL_21:
}

void sub_1000C4838(uint64_t a1)
{
  id v1 = +[_DASDaemonLogger logForCategory:@"bar"];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_1000FF1DC(a1, v1);
  }

  id obj = [*(id *)(a1 + 32) connectedBGTaskClients];
  objc_sync_enter(obj);
  id v2 = [*(id *)(a1 + 32) activitiesWaitingForBGTaskClients];
  __int16 v18 = (int *)(a1 + 40);
  uint64_t v3 = +[NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  long long v20 = [v2 objectForKeyedSubscript:v3];

  if ([v20 count])
  {
    uint64_t v4 = +[_DASDaemonLogger logForCategory:@"bar"];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000FF160(v18, v4);
    }

    os_unfair_recursive_lock_lock_with_options();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v5 = v20;
    id v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v24;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v10 = [v9 assertion];
          id v22 = 0;
          unsigned __int8 v11 = [v10 invalidateWithError:&v22];
          id v12 = v22;

          if (v12) {
            char v13 = v11;
          }
          else {
            char v13 = 1;
          }
          if ((v13 & 1) == 0)
          {
            id v14 = +[_DASDaemonLogger logForCategory:@"bar"];
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              uint64_t v15 = [v9 assertion];
              *(_DWORD *)buf = 138412546;
              uint64_t v28 = v15;
              __int16 v29 = 2112;
              id v30 = v12;
              _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Error invalidating assertion %@: %@", buf, 0x16u);
            }
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v6);
    }

    os_unfair_recursive_lock_unlock();
  }
  uint64_t v16 = [*(id *)(a1 + 32) activitiesWaitingForBGTaskClients];
  uint64_t v17 = +[NSNumber numberWithInt:*v18];
  [v16 removeObjectForKey:v17];

  objc_sync_exit(obj);
}

void sub_1000C4B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000C4F34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

int64_t sub_1000C544C(id a1, _DASActivity *a2, _DASActivity *a3)
{
  uint64_t v4 = a3;
  id v5 = [(_DASActivity *)a2 startBefore];
  id v6 = [(_DASActivity *)v4 startBefore];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

int64_t sub_1000C5574(id a1, _DASActivity *a2, _DASActivity *a3)
{
  uint64_t v4 = a3;
  id v5 = [(_DASActivity *)a2 startBefore];
  id v6 = [(_DASActivity *)v4 startBefore];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_1000C56DC(uint64_t a1, void *a2)
{
  id v7 = a2;
  uint64_t v3 = [v7 startedTasks];
  objc_sync_enter(v3);
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [v7 startedTasks];
  id v6 = [v5 allObjects];
  [v4 addObjectsFromArray:v6];

  objc_sync_exit(v3);
}

void sub_1000C5778(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

int64_t sub_1000C578C(id a1, _DASActivity *a2, _DASActivity *a3)
{
  uint64_t v4 = a3;
  id v5 = [(_DASActivity *)a2 startBefore];
  id v6 = [(_DASActivity *)v4 startBefore];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

id sub_1000C5E34(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) shouldRunActivityNow:*(void *)(a1 + 40)];
  if (result)
  {
    id result = [*(id *)(*(void *)(a1 + 32) + 376) executeActivity:*(void *)(a1 + 40)];
    if (result)
    {
      uint64_t v3 = +[_DASDaemonLogger defaultCategory];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 48);
        uint64_t v4 = *(void *)(a1 + 56);
        v6[0] = 67109378;
        v6[1] = v4;
        __int16 v7 = 2112;
        uint64_t v8 = v5;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "With %i urgency level, running %@ immediately on submission", (uint8_t *)v6, 0x12u);
      }

      return [*(id *)(a1 + 32) immediatelyBeginWorkForActivity:*(void *)(a1 + 40)];
    }
  }
  return result;
}

void sub_1000C6524(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)[v3 countForObject:v4]);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
}

uint64_t sub_1000C65B0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  __int16 v7 = [v5 objectForKeyedSubscript:a2];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  id v9 = [v7 compare:v8];
  if (v9 == (id)1) {
    return -1;
  }
  else {
    return 1;
  }
}

void sub_1000C6C34(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = a2;
  id v5 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)[v3 countForObject:v4]);
  [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];

  +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", (double)(unint64_t)[*(id *)(a1 + 56) countForObject:v4]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 48) setObject:v6 forKeyedSubscript:v4];
}

uint64_t sub_1000C6D00(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  __int16 v7 = [v5 objectForKeyedSubscript:a2];
  uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:v6];

  id v9 = [v7 compare:v8];
  if (v9 == (id)1) {
    return -1;
  }
  else {
    return 1;
  }
}

void sub_1000C7B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C7B9C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) evaluatePolicies:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

void sub_1000C7CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000C7D00(void *a1)
{
  os_unfair_recursive_lock_lock_with_options();
  id v2 = (void *)a1[4];
  uint64_t v3 = [v2 pendingTasks];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = [v2 evaluateAllActivitiesFor:v3 writingToFile:a1[5]];

  id v4 = (void *)a1[4];
  id v5 = [v4 prerunningTasks];
  unsigned int v6 = [v4 evaluateAllActivitiesFor:v5 writingToFile:a1[5]];
  BOOL v7 = 0;
  uint64_t v8 = *(void *)(a1[6] + 8);
  if (v6) {
    BOOL v7 = *(unsigned char *)(v8 + 24) != 0;
  }
  *(unsigned char *)(v8 + 24) = v7;

  id v9 = (void *)a1[4];
  uint64_t v10 = [v9 runningTasks];
  unsigned int v11 = [v9 evaluateAllActivitiesFor:v10 writingToFile:a1[5]];
  uint64_t v12 = *(void *)(a1[6] + 8);
  if (v11) {
    BOOL v13 = *(unsigned char *)(v12 + 24) != 0;
  }
  else {
    BOOL v13 = 0;
  }
  *(unsigned char *)(v12 + 24) = v13;

  return os_unfair_recursive_lock_unlock();
}

void sub_1000C7EBC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v8 = (void **)(a1 + 40);
  if (([*(v8 - 1) evaluatePoliciesForActivitiesChunk:v6 writingToFile:v9] & 1) == 0) {
    *a4 = 1;
  }
  uint64_t v10 = [@"\n" dataUsingEncoding:4];
  unsigned int v11 = *v8;
  id v17 = 0;
  unsigned int v12 = [v11 writeData:v10 error:&v17];
  id v13 = v17;
  id v14 = v13;
  if (v12) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 0;
  }
  if (!v15)
  {
    uint64_t v16 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_1000FF328();
    }

    *a4 = 1;
  }
}

void sub_1000C8768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t sub_1000C87B0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) evaluatePolicies:*(void *)(a1 + 40)];

  return _objc_release_x1();
}

void sub_1000CA884(uint64_t a1, void *a2)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = [*(id *)(a1 + 32) getActivityWithUUID:v8];
        uint64_t v10 = *(void *)(a1 + 32);
        if (!v9)
        {
          [*(id *)(v10 + 216) stopMonitoringActivity:v8];
          goto LABEL_11;
        }
        unsigned int v11 = (void *)v9;
        [*(id *)(v10 + 360) addWorkItem:v9];
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

void sub_1000CB380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id obj)
{
}

void sub_1000CB824(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000CCCD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
}

uint64_t sub_1000CCD00(uint64_t a1)
{
  uint64_t result = IOPMAssertionRelease(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  return result;
}

uint64_t sub_1000CCE78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v6;
  id v9 = [v7 schedulingPriority];
  if ((unint64_t)v9 >= _DASSchedulingPriorityUserInitiated)
  {
    id v10 = [v8 schedulingPriority];
    if ((unint64_t)v10 < _DASSchedulingPriorityUserInitiated) {
      goto LABEL_3;
    }
  }
  id v12 = [v8 schedulingPriority];
  if ((unint64_t)v12 >= _DASSchedulingPriorityUserInitiated)
  {
    id v13 = [v7 schedulingPriority];
    if ((unint64_t)v13 < _DASSchedulingPriorityUserInitiated)
    {
LABEL_6:
      uint64_t v11 = 1;
      goto LABEL_53;
    }
  }
  id v14 = [v7 schedulingPriority];
  if ((unint64_t)v14 >= _DASSchedulingPriorityUserInitiated)
  {
    id v15 = [v8 schedulingPriority];
    if ((unint64_t)v15 >= _DASSchedulingPriorityUserInitiated)
    {
      id v36 = [v7 name];
      if ([v36 hasPrefix:@"nsurl-av"])
      {
        __int16 v37 = [v8 name];
        unsigned __int8 v38 = [v37 hasPrefix:@"nsurl-av"];

        if (v38) {
          goto LABEL_9;
        }
      }
      else
      {
      }
      unsigned int v39 = [v8 submitDate];
      uint64_t v40 = [v7 submitDate];
      goto LABEL_52;
    }
  }
LABEL_9:
  if (!*(unsigned char *)(a1 + 40)) {
    goto LABEL_73;
  }
  unsigned int v16 = [v7 userRequestedBackupTask];
  unsigned int v17 = [v8 userRequestedBackupTask];
  int v18 = v16 ^ 1;
  uint64_t v11 = v17 | v16 ^ 1 ? 1 : -1;
  if (v17) {
    int v18 = v16;
  }
  if (v18 == 1)
  {
LABEL_73:
    if (*(unsigned char *)(a1 + 41))
    {
      if (+[_DASPhotosPolicy isiCPLActivity:v7]
        && !+[_DASPhotosPolicy isiCPLActivity:v8])
      {
        goto LABEL_3;
      }
      if (+[_DASPhotosPolicy isiCPLActivity:v8]
        && !+[_DASPhotosPolicy isiCPLActivity:v7])
      {
        goto LABEL_6;
      }
    }
    uint64_t v19 = [v7 fastPass];
    if (!v19
      || (long long v20 = (void *)v19,
          [v8 fastPass],
          long long v21 = objc_claimAutoreleasedReturnValue(),
          v21,
          v20,
          v21))
    {
      uint64_t v22 = [v8 fastPass];
      if (v22)
      {
        long long v23 = (void *)v22;
        long long v24 = [v7 fastPass];

        if (!v24) {
          goto LABEL_6;
        }
      }
      uint64_t v25 = [v7 fastPass];
      if (v25)
      {
        long long v26 = (void *)v25;
        __int16 v27 = [v8 fastPass];

        if (v27)
        {
          id v28 = [v7 staticPriority];
          if ((uint64_t)v28 < (uint64_t)[v8 staticPriority]) {
            goto LABEL_3;
          }
          id v29 = [v7 staticPriority];
          if ((uint64_t)v29 > (uint64_t)[v8 staticPriority]) {
            goto LABEL_6;
          }
        }
      }
      id v30 = [v7 fileProtection];
      long long v31 = +[_DASFileProtection completeUnlessOpen];
      unsigned int v32 = [v30 isEqual:v31];

      long long v33 = [v8 fileProtection];
      __int16 v34 = +[_DASFileProtection completeUnlessOpen];
      unsigned int v35 = [v33 isEqual:v34];

      if (!v32 || v35)
      {
        if ((v35 ^ 1 | v32) != 1) {
          goto LABEL_6;
        }
        if (![v7 triggersRestart] || objc_msgSend(v8, "triggersRestart"))
        {
          if ([v8 triggersRestart] && !objc_msgSend(v7, "triggersRestart")) {
            goto LABEL_6;
          }
          if (![v7 requiresSignificantUserInactivity]
            || [v8 requiresSignificantUserInactivity])
          {
            if ([v8 requiresSignificantUserInactivity]
              && ![v7 requiresSignificantUserInactivity])
            {
              goto LABEL_6;
            }
            if (![v7 isIntensive] || objc_msgSend(v8, "isIntensive"))
            {
              if ([v8 isIntensive] && !objc_msgSend(v7, "isIntensive")) {
                goto LABEL_6;
              }
              if ([v7 isIntensive] && objc_msgSend(v8, "isIntensive"))
              {
                uint64_t v11 = (uint64_t)[*(id *)(*(void *)(a1 + 32) + 368) compareActivity:v7 withActivity:v8];
                goto LABEL_53;
              }
              if ([v7 requiresNetwork])
              {
                if ([v8 requiresNetwork])
                {
                  unsigned int v43 = [v7 deferred];
                  if (v43 != [v8 deferred])
                  {
                    if ([v7 deferred]) {
                      uint64_t v11 = -1;
                    }
                    else {
                      uint64_t v11 = 1;
                    }
                    goto LABEL_53;
                  }
                }
              }
              id v44 = [v7 schedulingPriority];
              if (v44 <= [v8 schedulingPriority])
              {
                id v45 = [v7 schedulingPriority];
                if (v45 < [v8 schedulingPriority]) {
                  goto LABEL_6;
                }
                id v46 = [v7 staticPriority];
                if ((uint64_t)v46 >= (uint64_t)[v8 staticPriority])
                {
                  id v47 = [v7 staticPriority];
                  if ((uint64_t)v47 > (uint64_t)[v8 staticPriority]) {
                    goto LABEL_6;
                  }
                  id v48 = [v7 maximumRuntime];
                  if ((uint64_t)v48 >= (uint64_t)[v8 maximumRuntime])
                  {
                    id v49 = [v7 maximumRuntime];
                    if ((uint64_t)v49 > (uint64_t)[v8 maximumRuntime]) {
                      goto LABEL_6;
                    }
                    uint64_t v50 = [v7 rateLimitConfigurationName];
                    if (!v50
                      || (unsigned int v51 = (void *)v50,
                          [v8 rateLimitConfigurationName],
                          unsigned int v52 = objc_claimAutoreleasedReturnValue(),
                          v52,
                          v51,
                          v52))
                    {
                      uint64_t v53 = [v8 rateLimitConfigurationName];
                      if (v53)
                      {
                        unsigned int v54 = (void *)v53;
                        id v55 = [v7 rateLimitConfigurationName];

                        if (!v55) {
                          goto LABEL_6;
                        }
                      }
                      unsigned int v39 = [v7 startBefore];
                      uint64_t v40 = [v8 startBefore];
LABEL_52:
                      int v41 = (void *)v40;
                      uint64_t v11 = (uint64_t)[v39 compare:v40];

                      goto LABEL_53;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_3:
    uint64_t v11 = -1;
  }
LABEL_53:

  return v11;
}

id sub_1000CD4E8(uint64_t a1)
{
  return [*(id *)(a1 + 40) unprotectedEvaluateScoreAndRunActivities:*(void *)(a1 + 48)];
}

void sub_1000CDB80(uint64_t a1)
{
  os_unfair_recursive_lock_lock_with_options();
  id v2 = [*(id *)(*(void *)(a1 + 40) + 48) mutableCopy];
  os_unfair_recursive_lock_unlock();
  id v3 = +[_DASDaemonLogger defaultCategory];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 count];
    uint64_t v5 = *(void *)(a1 + 48);
    int v6 = 134218242;
    id v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Rescoring all %lu activities [%@]", (uint8_t *)&v6, 0x16u);
  }

  [*(id *)(a1 + 40) unprotectedEvaluateScoreAndRunActivities:v2];
}

void sub_1000CF078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1000CF0A8(void *a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if ([v7 isEqualToString:_DASUpdateActivityXPCActivityNameKey])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    uint64_t v6 = a1[4];
    goto LABEL_10;
  }
  if ([v7 isEqualToString:_DASUpdateActivityErrorKey])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_11;
    }
    uint64_t v6 = a1[5];
    goto LABEL_10;
  }
  if ([v7 isEqualToString:_DASUpdateActivityXPCActivityClientStringKey])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = a1[6];
LABEL_10:
      objc_storeStrong((id *)(*(void *)(v6 + 8) + 40), a3);
    }
  }
LABEL_11:
}

id sub_1000CF4E4(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  id v3 = objc_alloc((Class)NSString);
  [*(id *)(a1 + 32) timeIntervalSince1970];
  id v5 = [v3 initWithFormat:@"%f", v4];
  [v2 setObject:v5 forKeyedSubscript:@"startDate"];

  uint64_t v6 = [*(id *)(a1 + 40) name];
  [v2 setObject:v6 forKeyedSubscript:@"name"];

  id v7 = [*(id *)(a1 + 40) bundleId];
  [v2 setObject:v7 forKeyedSubscript:@"bundleID"];

  __int16 v8 = [*(id *)(a1 + 40) clientName];
  [v2 setObject:v8 forKeyedSubscript:@"clientName"];

  uint64_t v9 = [*(id *)(a1 + 40) clientProvidedStartDate];
  [v2 setObject:v9 forKeyedSubscript:@"clientProvidedStartDate"];

  id v10 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 40) delayedStart]);
  [v2 setObject:v10 forKeyedSubscript:@"delayedStart"];

  id v11 = [objc_alloc((Class)NSString) initWithFormat:@"%lu", [*(id *)(a1 + 40) downloadSize]];
  [v2 setObject:v11 forKeyedSubscript:@"downloadSize"];

  id v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 40) diskIntensive]);
  [v2 setObject:v12 forKeyedSubscript:@"diskIntensive"];

  uint64_t v13 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 40) darkWakeEligible]);
  [v2 setObject:v13 forKeyedSubscript:@"darkWakeEligible"];

  uint64_t v14 = [*(id *)(a1 + 40) groupName];
  [v2 setObject:v14 forKeyedSubscript:@"groupName"];

  [*(id *)(a1 + 40) interval];
  uint64_t v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v2 setObject:v15 forKeyedSubscript:@"interval"];

  uint64_t v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 40) memoryIntensive]);
  [v2 setObject:v16 forKeyedSubscript:@"memoryIntensive"];

  uint64_t v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 40) preventDeviceSleep]);
  [v2 setObject:v17 forKeyedSubscript:@"preventDeviceSleep"];

  id v18 = objc_alloc((Class)NSString);
  [*(id *)(a1 + 40) percentCompleted];
  id v20 = [v18 initWithFormat:@"%f", v19];
  [v2 setObject:v20 forKeyedSubscript:@"percentCompleted"];

  long long v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [*(id *)(a1 + 40) preClearedMode]);
  [v2 setObject:v21 forKeyedSubscript:@"preClearedMode"];

  id v22 = objc_alloc((Class)NSString);
  long long v23 = [*(id *)(a1 + 40) predictedOptimalStartDate];
  [v23 timeIntervalSince1970];
  id v25 = [v22 initWithFormat:@"%f", v24];
  [v2 setObject:v25 forKeyedSubscript:@"predictedOptimalStartDate"];

  long long v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 40) requiresNetwork]);
  [v2 setObject:v26 forKeyedSubscript:@"requiresNetwork"];

  __int16 v27 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 40) requiresDeviceInactivity]);
  [v2 setObject:v27 forKeyedSubscript:@"requiresDeviceInactivity"];

  id v28 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 40) requestsApplicationLaunch]);
  [v2 setObject:v28 forKeyedSubscript:@"requestsApplicationLaunch"];

  id v29 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 40) requiresInexpensiveNetworking]);
  [v2 setObject:v29 forKeyedSubscript:@"requiresInexpensiveNetworking"];

  id v30 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 40) requiresUnconstrainedNetworking]);
  [v2 setObject:v30 forKeyedSubscript:@"requiresUnconstrainedNetworking"];

  long long v31 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 40) runOnAppForeground]);
  [v2 setObject:v31 forKeyedSubscript:@"runOnAppForeground"];

  unsigned int v32 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 40) requiresSignificantUserInactivity]);
  [v2 setObject:v32 forKeyedSubscript:@"requiresSignificantUserInactivity"];

  id v33 = objc_alloc((Class)NSString);
  __int16 v34 = [*(id *)(a1 + 40) startAfter];
  [v34 timeIntervalSince1970];
  id v36 = [v33 initWithFormat:@"%f", v35];
  [v2 setObject:v36 forKeyedSubscript:@"startAfter"];

  id v37 = objc_alloc((Class)NSString);
  unsigned __int8 v38 = [*(id *)(a1 + 40) submitDate];
  [v38 timeIntervalSince1970];
  id v40 = [v37 initWithFormat:@"%f", v39];
  [v2 setObject:v40 forKeyedSubscript:@"submitDate"];

  id v41 = objc_alloc((Class)NSString);
  unsigned int v42 = [*(id *)(a1 + 40) startBefore];
  [v42 timeIntervalSince1970];
  id v44 = [v41 initWithFormat:@"%f", v43];
  [v2 setObject:v44 forKeyedSubscript:@"startBefore"];

  id v45 = [objc_alloc((Class)NSString) initWithFormat:@"%lu", [*(id *)(a1 + 40) uploadSize]];
  [v2 setObject:v45 forKeyedSubscript:@"uploadSize"];

  id v46 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 40) wasForceRun]);
  [v2 setObject:v46 forKeyedSubscript:@"wasForceRun"];

  return v2;
}

void sub_1000D0558(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_type_t type = xpc_get_type(v3);
  id v5 = *(os_unfair_lock_s **)(a1 + 32);
  if (type == (xpc_type_t)&_xpc_type_connection)
  {
    os_unfair_lock_lock(v5 + 6);
    [*(id *)(*(void *)(a1 + 32) + 656) addObject:v3];
    uint64_t v6 = dispatch_get_global_queue(25, 0);
    xpc_connection_set_target_queue((xpc_connection_t)v3, v6);

    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000D067C;
    v8[3] = &unk_100178070;
    void v8[4] = *(void *)(a1 + 32);
    id v7 = v3;
    id v9 = v7;
    xpc_connection_set_event_handler((xpc_connection_t)v7, v8);
    xpc_connection_activate((xpc_connection_t)v7);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
  }
  else
  {
    [(os_unfair_lock_s *)v5 _unexpectedXPCObject:v3 WithLog:@"Prewarm suspend listener received unexpected message"];
  }
}

id sub_1000D067C(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _prewarmSuspendHandleIncoming:a2 onConnection:*(void *)(a1 + 40)];
}

void sub_1000D113C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1000D118C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.duetactivityscheduler", "default");
  id v2 = (void *)qword_1001C43D8;
  qword_1001C43D8 = (uint64_t)v1;

  uint64_t v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = (void *)qword_1001C43E0;
  qword_1001C43E0 = v3;

  uint64_t v5 = +[NSMutableDictionary dictionary];
  uint64_t v6 = (void *)qword_1001C43E8;
  qword_1001C43E8 = v5;

  uint64_t v7 = +[NSMutableDictionary dictionary];
  __int16 v8 = (void *)qword_1001C43F0;
  qword_1001C43F0 = v7;

  dword_1001C43F8 = 0;
}

void sub_1000D16C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000D16E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained handleClientInterruption];
    id WeakRetained = v2;
  }
}

void sub_1000D18C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D19E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000D1A00(void *a1, void *a2, unsigned char *a3)
{
  uint64_t v5 = (void *)a1[4];
  uint64_t v6 = [a2 name];
  id v7 = [v5 containsObject:v6];

  if (v7)
  {
    if (++*(void *)(*(void *)(a1[5] + 8) + 24) == a1[6]) {
      *a3 = 1;
    }
  }
  return v7;
}

void sub_1000D1E1C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D1FF8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D21B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D244C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D2730(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D2878(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D297C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D2A68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D2C34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D2DD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D2EC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D3098(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D31EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D3290(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D387C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000D38C0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000D38D0(uint64_t a1)
{
}

void sub_1000D38D8(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void sub_1000D4B08(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D4D0C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D4FD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000D7CFC(id a1)
{
  uint64_t v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____DASActivitySchedulerClient];
  uint64_t v3 = (void *)qword_1001C4408;
  qword_1001C4408 = v2;

  uint64_t v4 = (void *)qword_1001C4408;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v5 = +[NSArray arrayWithObjects:&v7 count:3];
  uint64_t v6 = +[NSSet setWithArray:](NSSet, "setWithArray:", v5, v7, v8);
  [v4 setClasses:v6 forSelector:"handleLaunchFromDaemonForActivities:" argumentIndex:0 ofReply:0];
}

void sub_1000D7E18(id a1)
{
  uint64_t v2 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____DASActivityOmnibusScheduling];
  uint64_t v3 = (void *)qword_1001C4418;
  qword_1001C4418 = v2;

  uint64_t v4 = (void *)qword_1001C4418;
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  uint64_t v5 = +[NSArray arrayWithObjects:v27 count:2];
  uint64_t v6 = +[NSSet setWithArray:v5];
  [v4 setClasses:v6 forSelector:"submitActivities:" argumentIndex:0 ofReply:0];

  uint64_t v7 = (void *)qword_1001C4418;
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  uint64_t v8 = +[NSArray arrayWithObjects:v26 count:2];
  uint64_t v9 = +[NSSet setWithArray:v8];
  [v7 setClasses:v9 forSelector:"startedActivities:" argumentIndex:0 ofReply:0];

  id v10 = (void *)qword_1001C4418;
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  id v11 = +[NSArray arrayWithObjects:v25 count:2];
  id v12 = +[NSSet setWithArray:v11];
  [v10 setClasses:v12 forSelector:"delayedStartActivities:" argumentIndex:0 ofReply:0];

  uint64_t v13 = (void *)qword_1001C4418;
  v24[0] = objc_opt_class();
  v24[1] = objc_opt_class();
  uint64_t v14 = +[NSArray arrayWithObjects:v24 count:2];
  uint64_t v15 = +[NSSet setWithArray:v14];
  [v13 setClasses:v15 forSelector:"enableTaskRegistryMode:processes:handler:" argumentIndex:1 ofReply:0];

  [(id)qword_1001C4418 setXPCType:&_xpc_type_dictionary forSelector:"submitTaskRequestWithIdentifier:descriptor:completionHandler:" argumentIndex:1 ofReply:0];
  [(id)qword_1001C4418 setXPCType:&_xpc_type_dictionary forSelector:"updateTaskRequestWithIdentifier:descriptor:completionHandler:" argumentIndex:1 ofReply:0];
  uint64_t v16 = (void *)qword_1001C4418;
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  uint64_t v17 = +[NSArray arrayWithObjects:v23 count:2];
  id v18 = +[NSSet setWithArray:v17];
  [v16 setClasses:v18 forSelector:"reportSystemTaskWithIdentifier:consumedResults:completionHandler:" argumentIndex:1 ofReply:0];

  uint64_t v19 = (void *)qword_1001C4418;
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  id v20 = +[NSArray arrayWithObjects:v22 count:2];
  long long v21 = +[NSSet setWithArray:v20];
  [v19 setClasses:v21 forSelector:"reportSystemTaskWithIdentifier:producedResults:completionHandler:" argumentIndex:1 ofReply:0];
}

void sub_1000D81AC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

id sub_1000D82C8(uint64_t a1)
{
  uint64_t v2 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Active app changed", v4, 2u);
  }

  return [*(id *)(a1 + 32) handleActiveAppChanged];
}

void sub_1000D84D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000D84F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000D8500(uint64_t a1)
{
}

void sub_1000D8508(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 || ![*(id *)(a1 + 32) exposureNotificationEnabled])
  {
    uint64_t v6 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "EN is not active. Not performing block.", buf, 2u);
    }

    [*(id *)(a1 + 32) invalidate];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    uint64_t v4 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "EN is active", buf, 2u);
    }

    uint64_t v5 = *(void **)(a1 + 32);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000D869C;
    v7[3] = &unk_100178178;
    uint64_t v10 = *(void *)(a1 + 48);
    id v8 = v5;
    id v9 = *(id *)(a1 + 40);
    [v8 getInfoForKey:@"activeApp" completion:v7];
  }
}

void sub_1000D869C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_100100088((uint64_t)v5, (uint64_t)v6, v7);
  }

  if (v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v10 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error obtaining active EN app: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
    id v9 = v5;
    uint64_t v10 = *(NSObject **)(v8 + 40);
    *(void *)(v8 + 40) = v9;
  }

  [*(id *)(a1 + 32) invalidate];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1000D8FF0(uint64_t a1, void *a2)
{
  id v2 = a2;
  [(id)objc_opt_class() runPeriodicRelaunchTask];
  [v2 setTaskCompleted];
}

void sub_1000D90FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 || ![*(id *)(a1 + 32) exposureNotificationEnabled])
  {
    id v5 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "EN is not active. Not performing block.", v6, 2u);
    }
  }
  else
  {
    uint64_t v4 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "EN is active. Performing block.", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  [*(id *)(a1 + 32) invalidate];
}

void sub_1000D934C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000D9364(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  uint64_t v8 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138544130;
    uint64_t v12 = v10;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2048;
    uint64_t v16 = a3;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@ - Active? %u, Interval %llu, Error: %@", (uint8_t *)&v11, 0x26u);
  }

  if (v7)
  {
    id v9 = +[_DASDaemonLogger logForCategory:@"exposure-notification"];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100100188(a1, (uint64_t)v7, v9);
    }
  }
  else if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a3;
  }
  [*(id *)(a1 + 40) invalidate];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_1000DA004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000DA034(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  return result;
}

id sub_1000DA514(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) extractResumeLaunchSignposts:a2];
}

id sub_1000DA520(uint64_t a1)
{
  return [*(id *)(a1 + 32) extractResumeLaunchSignposts:0];
}

id sub_1000DA52C(uint64_t a1)
{
  return [*(id *)(a1 + 32) feedNewRecommendations];
}

void sub_1000DA588(id a1)
{
  qword_1001C4420 = objc_opt_new();

  _objc_release_x1();
}

void sub_1000DA868(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1000DA888(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000DA898(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a3)
  {
    id v6 = +[_DASDataProtectionStateMonitor dataProtectionClassC];
    unsigned int v7 = [v5 isEqualToString:v6];

    if (v7)
    {
      objc_copyWeak(&to, (id *)(a1 + 32));
      id v8 = objc_loadWeakRetained(&to);

      if (v8)
      {
        id v9 = objc_loadWeakRetained(&to);
        uint64_t v10 = [v9 log];

        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)__int16 v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Class C now available.", v15, 2u);
        }

        id v11 = objc_loadWeakRetained(&to);
        [v11 setClassCUnlocked:1];

        id v12 = objc_loadWeakRetained(&to);
        [v12 setDataProtectionStateMonitor:0];

        id v13 = objc_loadWeakRetained(&to);
        int v14 = [v13 timer];
        dispatch_activate(v14);
      }
      objc_destroyWeak(&to);
    }
  }
}

void sub_1000DA9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

uint64_t sub_1000DA9F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000DAE28(uint64_t a1)
{
  qword_1001C4438 = (uint64_t)[objc_alloc((Class)objc_opt_class()) initWithDaemon:*(void *)(a1 + 32)];

  return _objc_release_x1();
}

void sub_1000DAF6C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (!v2[4])
  {
    uint64_t v3 = +[NSMutableSet set];
    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v3;

    id v2 = *(void **)(a1 + 32);
  }
  id v6 = [v2 pendingActivities];
  [v6 addObject:*(void *)(a1 + 40)];

  unsigned int v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) diskVolume];
  [v7 registerForDiskVolumeMonitoring:v8];
}

void sub_1000DB100(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingActivities];
  [v2 removeObject:*(void *)(a1 + 40)];

  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) diskVolume];
  [v3 unregisterForDiskVolumeMonitoring:v4];
}

void sub_1000DB7B4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) daemon];
  [v2 evaluateScoreAndRunActivities:*(void *)(a1 + 40)];
}

id sub_1000DB8B8(uint64_t a1, int a2)
{
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100100508(a2, v4);
  }
  return [*(id *)(a1 + 32) handleCacheDeletePurgeableSpaceNotification];
}

void sub_1000DBC50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v3 = *(id *)(*(void *)(a1 + 32) + 8);
    objc_sync_enter(v3);
    [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
    objc_sync_exit(v3);

    [v4 clearPriorityQueue];
    id WeakRetained = v4;
  }
}

void sub_1000DBCD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000DBD48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000DBDC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000DBE3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1000DC0B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000DC2A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000DC45C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000DC738(uint64_t a1)
{
  qword_1001C4448 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_1000DCB0C(uint64_t a1)
{
  id v2 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Timer fired to reset workloads", (uint8_t *)&v17, 2u);
  }

  id v3 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState];

  if (v3)
  {
    id v4 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState];
    [v4 timeIntervalSinceNow];
    BOOL v6 = v5 < -600.0;
    if (v5 < -600.0)
    {
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:0 forKeyedSubscript:kDASSystemContextMCWorkloadRunningState];
      unsigned int v7 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Resetting MC, set at %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  id v8 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState];

  if (v8)
  {
    id v9 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState];
    [v9 timeIntervalSinceNow];
    if (v10 >= -600.0)
    {

      if (!v6) {
        return;
      }
    }
    else
    {
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:0 forKeyedSubscript:kDASSystemContextGPWorkloadRunningState];
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(v11 + 48);
      if (v12 <= 1) {
        uint64_t v12 = 1;
      }
      *(void *)(v11 + 4_Block_object_dispose(&STACK[0x200], 8) = v12 - 1;
      id v13 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 138412290;
        id v18 = v9;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Resetting GP, set at %@", (uint8_t *)&v17, 0xCu);
      }
    }
  }
  else if (!v6)
  {
    return;
  }
  int v14 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState];
  if (v14)
  {
  }
  else
  {
    __int16 v15 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState];

    if (!v15)
    {
      uint64_t v16 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Reevaluating activities due to system constraint reset", (uint8_t *)&v17, 2u);
      }

      [*(id *)(a1 + 32) reevaluateAllActivitiesWithDaemon:*(void *)(*(void *)(a1 + 32) + 72)];
      [*(id *)(a1 + 32) cancelResetTimer];
    }
  }
}

void sub_1000DD060(uint64_t a1)
{
  id v2 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Setting _heavyDiskUsage = 0", v3, 2u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + _Block_object_dispose(&STACK[0x200], 8) = 0;
}

void sub_1000DD374(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (*(unsigned char *)(a1 + 64)) {
      return;
    }
    [*(id *)(a1 + 40) cancelResetTimer];
    [*(id *)(*(void *)(a1 + 40) + 40) setObject:0 forKeyedSubscript:*(void *)(a1 + 48)];
    id v2 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState];

    if (v2)
    {
      id v3 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = 0;
        id v4 = "Not evaluating because GP is still blocking!";
        double v5 = (uint8_t *)&v10;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  else
  {
    if (!*(unsigned char *)(a1 + 64)) {
      return;
    }
    [*(id *)(a1 + 40) armResetTimer];
    BOOL v6 = +[NSDate now];
    [*(id *)(*(void *)(a1 + 40) + 40) setObject:v6 forKeyedSubscript:*(void *)(a1 + 48)];

    unsigned int v7 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:kDASSystemContextGPWorkloadRunningState];

    if (v7)
    {
      id v3 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v4 = "Not evaluating because GP is already blocking!";
        double v5 = buf;
        goto LABEL_10;
      }
LABEL_11:

      return;
    }
  }
  id v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 56);

  [v8 reevaluateAllActivitiesWithDaemon:v9];
}

void sub_1000DD508(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 56);
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = v3[6];
  if (v2)
  {
    if (v4)
    {
LABEL_7:
      void v3[6] = v4 + 1;
      return;
    }
    [v3 armResetTimer];
    double v5 = +[NSDate now];
    [*(id *)(*(void *)(a1 + 32) + 40) setObject:v5 forKeyedSubscript:*(void *)(a1 + 40)];

    BOOL v6 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState];

    if (v6)
    {
      unsigned int v7 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Not evaluating because MC is already blocking!", (uint8_t *)&v15, 2u);
      }

      id v3 = *(void **)(a1 + 32);
      uint64_t v4 = v3[6];
      goto LABEL_7;
    }
    ++*(void *)(*(void *)(a1 + 32) + 48);
    goto LABEL_21;
  }
  if (v4 != 1) {
    goto LABEL_13;
  }
  [v3 cancelResetTimer];
  [*(id *)(*(void *)(a1 + 32) + 40) setObject:0 forKeyedSubscript:kDASSystemContextGPWorkloadRunningState];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:kDASSystemContextMCWorkloadRunningState];

  if (v8)
  {
    uint64_t v9 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Not evaluating because MC is still blocking!", (uint8_t *)&v15, 2u);
    }

LABEL_13:
    int v10 = 0;
    goto LABEL_14;
  }
  int v10 = 1;
LABEL_14:
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(v11 + 48);
  if (v12 <= 1) {
    uint64_t v12 = 1;
  }
  *(void *)(v11 + 4_Block_object_dispose(&STACK[0x200], 8) = v12 - 1;
  id v13 = +[_DASDaemonLogger logForCategory:@"customsysconstraints"];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = +[NSNumber numberWithInteger:*(void *)(*(void *)(a1 + 32) + 48)];
    int v15 = 138412290;
    uint64_t v16 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "GP is now %@", (uint8_t *)&v15, 0xCu);
  }
  if (v10) {
LABEL_21:
  }
    [*(id *)(a1 + 32) reevaluateAllActivitiesWithDaemon:*(void *)(a1 + 48)];
}

void sub_1000DD970(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000DDCC0(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (nw_path_get_status(v3) != nw_path_status_unsatisfied)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    double v5 = (id *)(a1 + 32);
    if (*(void *)(a1 + 40))
    {
      BOOL v6 = [v4 activityIDs];
      objc_sync_enter(v6);
      unsigned int v7 = [*v5 activityIDs];
      id v8 = [v7 copy];

      objc_sync_exit(v6);
      uint64_t v9 = dispatch_get_global_queue(2, 0);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      void v12[2] = sub_1000DDE24;
      void v12[3] = &unk_100175AB8;
      id v10 = *(id *)(a1 + 40);
      id v13 = v8;
      id v14 = v10;
      uint64_t v11 = v8;
      dispatch_async(v9, v12);
    }
    else
    {
      uint64_t v11 = [v4 log];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1001006C0(v5, v11);
      }
    }
  }
}

void sub_1000DDE10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000DDE24(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1000DDEA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000DDF38(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000DDFB0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000DE208(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000DE2A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000DE34C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000DE3FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000DE5B4(id a1)
{
  qword_1001C4458 = objc_opt_new();

  _objc_release_x1();
}

void sub_1000DE644(id a1)
{
  qword_1001C4468 = +[NWPathEvaluator sharedDefaultEvaluator];

  _objc_release_x1();
}

void sub_1000DE6D8(id a1)
{
  id v2 = objc_alloc_init((Class)NWParameters);
  [v2 setProhibitExpensivePaths:1];
  id v3 = [objc_alloc((Class)NWPathEvaluator) initWithEndpoint:0 parameters:v2];
  uint64_t v4 = (void *)qword_1001C4478;
  qword_1001C4478 = (uint64_t)v3;
}

void sub_1000DE7A8(id a1)
{
  id v2 = objc_alloc_init((Class)NWParameters);
  [v2 setProhibitConstrainedPaths:1];
  id v3 = [objc_alloc((Class)NWPathEvaluator) initWithEndpoint:0 parameters:v2];
  uint64_t v4 = (void *)qword_1001C4488;
  qword_1001C4488 = (uint64_t)v3;
}

void sub_1000DE910(id a1)
{
  id v1 = objc_alloc_init((Class)NWParameters);
  id v2 = (void *)qword_1001C4498;
  qword_1001C4498 = (uint64_t)v1;

  id v3 = (void *)qword_1001C4498;

  [v3 setProhibitExpensivePaths:1];
}

void sub_1000DE960(id a1)
{
  id v1 = objc_alloc_init((Class)NWParameters);
  id v2 = (void *)qword_1001C44A8;
  qword_1001C44A8 = (uint64_t)v1;

  id v3 = (void *)qword_1001C44A8;

  [v3 setProhibitExpensivePaths:0];
}

uint64_t sub_1000DF384()
{
  qword_1001C44B8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

uint64_t sub_1000DF62C()
{
  qword_1001C44C8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_1000DF730(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = +[BLSBacklight sharedBacklight];
  [v2 addObserver:WeakRetained];

  id v3 = +[_DASDaemonLogger logForCategory:@"BacklightStateMonitor"];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registered for backlight updates.", v4, 2u);
  }
}

id sub_1000DFD5C()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_1001C44E0;
  uint64_t v7 = qword_1001C44E0;
  if (!qword_1001C44E0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000E6CC0;
    v3[3] = &unk_100175628;
    void v3[4] = &v4;
    sub_1000E6CC0((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1000DFE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000E0028()
{
  qword_1001C44D0 = objc_opt_new();

  return _objc_release_x1();
}

Class sub_1000E6CC0(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1001C44E8)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_1000E6E04;
    v4[4] = &unk_1001753E0;
    void v4[5] = v4;
    long long v5 = off_1001783E0;
    uint64_t v6 = 0;
    qword_1001C44E8 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!qword_1001C44E8)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("PPSEvent");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)sub_1000F5D50();
LABEL_8:
    free(v2);
  }
  qword_1001C44E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000E6E04()
{
  uint64_t result = _sl_dlopen();
  qword_1001C44E8 = result;
  return result;
}

void sub_1000E7030(id a1)
{
  qword_1001C44F8 = +[_CDContextualKeyPath keyPathWithKey:@"/backup/userRequested"];

  _objc_release_x1();
}

void sub_1000E7164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000E7874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000E78A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ has state %@", (uint8_t *)&v8, 0x16u);
  }
  if ([*(id *)(a1 + 32) isBackupStatusCompleted:[v6 unsignedIntegerValue]])++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24); {
}
  }

Class sub_1000E7EC0(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1001C4508)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_1000E8004;
    v4[4] = &unk_1001753E0;
    void v4[5] = v4;
    long long v5 = off_100178518;
    uint64_t v6 = 0;
    qword_1001C4508 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!qword_1001C4508)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("BYBuddyDaemonCloudSyncClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)sub_100100A98();
LABEL_8:
    free(v2);
  }
  qword_1001C4500 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000E8004()
{
  uint64_t result = _sl_dlopen();
  qword_1001C4508 = result;
  return result;
}

void sub_1000E8BFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1000E8C28(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v4);

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(v4);
    uint64_t v7 = [v6 queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    void v9[2] = sub_1000E8D10;
    _DWORD v9[3] = &unk_100175570;
    id v10 = v6;
    id v11 = v3;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

void sub_1000E8D10(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionID];
  unsigned int v3 = [v2 isEqual:*(void *)(a1 + 40)];

  if (v3)
  {
    uint64_t v4 = +[_DASDaemonLogger logForCategory:@"plugin"];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100100C8C(v4);
    }

    [*(id *)(a1 + 32) setSessionID:0];
    long long v5 = [*(id *)(a1 + 32) pluginDelegate];
    id v6 = [*(id *)(a1 + 32) currentActivity];
    uint64_t v7 = [*(id *)(a1 + 32) delegateQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    _DWORD v10[2] = sub_1000E8E58;
    void v10[3] = &unk_100175570;
    id v11 = v5;
    id v12 = v6;
    id v8 = v6;
    id v9 = v5;
    dispatch_async(v7, v10);
  }
}

uint64_t sub_1000E8E58(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    unsigned int v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    return (uint64_t)[v3 extensionActivity:v4 finishedWithStatus:3];
  }
  return result;
}

void sub_1000E8EB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = +[_DASDaemonLogger logForCategory:@"plugin"];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100100CD0();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = [WeakRetained extension];
  id v10 = [v9 requestInterruptionBlock];
  ((void (**)(void, id))v10)[2](v10, v6);
}

uint64_t sub_1000E9644(uint64_t a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    unsigned int v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 48);
    return (uint64_t)[v3 extensionActivity:v4 finishedWithStatus:v5];
  }
  return result;
}

void sub_1000E9724(uint64_t a1)
{
  id v2 = +[_DASDaemonLogger logForCategory:@"plugin"];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Killing plugin %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 32) sessionID];

  if (v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) extension];
    id v6 = [*(id *)(a1 + 32) sessionID];
    [v5 cancelExtensionRequestWithIdentifier:v6];

    [*(id *)(a1 + 32) setSessionID:0];
  }
  uint64_t v7 = [*(id *)(a1 + 32) extension];
  [v7 _kill:9];

  id v8 = [*(id *)(a1 + 32) currentActivity];
  [v8 setPid:0];

  [*(id *)(a1 + 32) setCurrentActivity:0];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1001C4510);
  id v9 = (void *)qword_1001C4518;
  id v10 = [*(id *)(a1 + 32) pluginMapKey];
  [v9 removeObjectForKey:v10];

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1001C4510);
}

void sub_1000E9C64(id a1)
{
  qword_1001C4528 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____DASHostExtensionContextProtocol];

  _objc_release_x1();
}

void sub_1000E9D00(id a1)
{
  qword_1001C4538 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____DASRemoteExtensionContextProtocol];

  _objc_release_x1();
}

void sub_1000E9E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000E9EA8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000E9EB8(uint64_t a1)
{
}

void sub_1000E9EC0(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  uint64_t v5 = +[_DASDaemonLogger logForCategory:@"plugin"];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_100100F4C((uint64_t)v4, v5);
  }
}

id sub_1000EA3E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) logActivities];
}

id sub_1000EA7D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) logActivities];
}

id sub_1000EA7E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) logPredictions];
}

id sub_1000EA7E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) logDailyActivities];
}

void sub_1000EAD48(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000EAD5C(uint64_t a1)
{
  id v2 = +[NSMutableDictionary dictionary];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = *(id *)(*(void *)(a1 + 32) + 88);
  id v35 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v35)
  {
    uint64_t v34 = *(void *)v44;
    do
    {
      for (i = 0; i != v35; i = (char *)i + 1)
      {
        if (*(void *)v44 != v34) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v5 = +[NSString stringWithFormat:@"%@AvailableCount", v4];
        uint64_t v6 = +[NSString stringWithFormat:@"%@UnavailableCount", v4];
        unsigned int v42 = +[NSString stringWithFormat:@"%@EstimatedUnavailableDuration", v4];
        id v41 = +[NSString stringWithFormat:@"%@EstimatedHoursUnavailable", v4];
        id v40 = +[NSString stringWithFormat:@"%@EstimatedUnavailableStartDates", v4];
        uint64_t v7 = +[NSString stringWithFormat:@"%@ActualUnavailableDuration", v4];
        unsigned __int8 v38 = +[NSString stringWithFormat:@"%@ActualHoursUnavailable", v4];
        id v37 = +[NSString stringWithFormat:@"%@ActualUnavailableStartDates", v4];
        id v8 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:v5];
        if (v8)
        {
          [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:v5];
          v10 = uint64_t v9 = v6;
          [v2 setObject:v10 forKeyedSubscript:v5];

          uint64_t v6 = v9;
        }
        else
        {
          [v2 setObject:&off_100187768 forKeyedSubscript:v5];
        }

        int v11 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:v6];
        uint64_t v39 = (void *)v5;
        id v36 = (void *)v6;
        if (v11)
        {
          uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:v6];
          uint64_t v13 = v6;
          id v14 = (void *)v12;
          [v2 setObject:v12 forKeyedSubscript:v13];
        }
        else
        {
          [v2 setObject:&off_100187768 forKeyedSubscript:v6];
        }
        int v15 = v2;

        uint64_t v16 = *(id **)(a1 + 32);
        int v17 = [v16[10] objectForKeyedSubscript:v40];
        id v18 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:v42];
        [v16 newDurationForStartDates:v17 withPreviousDurations:v18];
        double v20 = v19;

        long long v21 = *(id **)(a1 + 32);
        id v22 = [v21[10] objectForKeyedSubscript:v37];
        long long v23 = [*(id *)(*(void *)(a1 + 32) + 80) objectForKeyedSubscript:v7];
        [v21 newDurationForStartDates:v22 withPreviousDurations:v23];
        double v25 = v24;

        double v26 = v20 / 3600.0;
        __int16 v27 = +[NSNumber numberWithDouble:v26];
        [v15 setObject:v27 forKeyedSubscript:v41];

        unsigned int v28 = [v4 isEqualToString:off_1001C3970];
        double v29 = v25 / 3600.0;
        if (!v28) {
          double v29 = v26;
        }
        id v30 = +[NSNumber numberWithDouble:v29];
        [v15 setObject:v30 forKeyedSubscript:v38];

        id v2 = v15;
      }
      id v35 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v35);
  }

  long long v31 = +[_DASDaemonLogger logForCategory:@"PowerLog"];
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v48 = v2;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Logging daily CA trigger metrics %@", buf, 0xCu);
  }

  return v2;
}

void sub_1000EBB9C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000EBFC4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000EC1E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000EC1FC(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = (void *)v5[9];
  id v7 = a3;
  id v8 = [v6 objectForKeyedSubscript:v10];
  uint64_t v9 = [v5 getValuesFromTimeline:v7 valueMultiplier:v8];

  if (v9) {
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v10];
  }
}

void sub_1000EC2B0(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [*(id *)(a1 + 32) getValuesFromTimeline:a3 valueMultiplier:*(void *)(a1 + 40)];
  id v7 = (void *)v6;
  if (v6)
  {
    id v9 = v5;
    uint64_t v10 = v6;
    id v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    [*(id *)(a1 + 48) addObject:v8];
  }
}

void sub_1000EC3C0(id a1)
{
  qword_1001C4548 = objc_opt_new();

  _objc_release_x1();
}

void sub_1000EC4C8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000EC6F0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000EC96C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000ECA24(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000ED1BC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000ED1D4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v10 = +[NSString stringWithFormat:@"score%@", a2];
  uint64_t v6 = *(void **)(a1 + 40);
  [v5 score];
  double v8 = v7;

  id v9 = [v6 numberFromDouble:v8 * 100.0];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v10];
}

void sub_1000EE254(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_1000EE754(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)NSMutableDictionary);
  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 56) requiresPlugin]);
  [v2 setObject:v3 forKeyedSubscript:*(void *)(a1 + 48)];

  id v4 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 56) requiresNetwork]);
  [v2 setObject:v4 forKeyedSubscript:*(void *)(a1 + 64)];

  id v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 56) isIntensive]);
  [v2 setObject:v5 forKeyedSubscript:*(void *)(a1 + 72)];

  uint64_t v6 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(a1 + 56) requiresDeviceInactivity]);
  [v2 setObject:v6 forKeyedSubscript:*(void *)(a1 + 80)];

  [v2 setObject:*(void *)(a1 + 96) forKeyedSubscript:*(void *)(a1 + 88)];
  [v2 setObject:*(void *)(a1 + 112) forKeyedSubscript:*(void *)(a1 + 104)];
  double v7 = [*(id *)(a1 + 120) experimentID];

  if (v7)
  {
    double v8 = [*(id *)(a1 + 120) experimentID];
    [v2 setObject:v8 forKeyedSubscript:*(void *)(a1 + 128)];

    id v9 = [*(id *)(a1 + 120) treatmentID];
    [v2 setObject:v9 forKeyedSubscript:*(void *)(a1 + 136)];

    id v10 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [*(id *)(a1 + 120) deploymentID]);
    int v11 = [v10 stringValue];
    [v2 setObject:v11 forKeyedSubscript:*(void *)(a1 + 144)];
  }

  return v2;
}

void start()
{
  uint64_t v0 = os_log_create("com.apple.dasd", "main");
  getpid();
  int v1 = memorystatus_control();
  if (v1)
  {
    int v2 = v1;
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    {
      v5[0] = 67109120;
      v5[1] = v2;
      _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to elevate inactive jetsam priority, error: %d", (uint8_t *)v5, 8u);
    }
  }
  else if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEFAULT, "Succeeded to elevate inactive jetsam priority", (uint8_t *)v5, 2u);
  }
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1001786F0);
  id v4 = +[_DASDaemon sharedInstance];
  [v4 start];

  CFRunLoopRun();
  exit(1);
}

uint64_t sub_1000EEFAC()
{
  qword_1001C4558 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_1000EF700(id a1, BPSCompletion *a2)
{
  if ([(BPSCompletion *)a2 state])
  {
    int v2 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100101140(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

void sub_1000EF758(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 eventBody];
  uint64_t v5 = [v4 deviceUUID];

  if (v5)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v6 = [v3 eventBody];
    uint64_t v7 = [v6 deviceActivityState];

    id v8 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          if ([*(id *)(*((void *)&v22 + 1) + 8 * i) state] == 1)
          {
            os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
            [*(id *)(*(void *)(a1 + 32) + 72) addObject:v5];
            os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v9);
    }

    double v20 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      long long v21 = BMContextSyncDeviceActivityLevelActivityStateAsString();
      *(_DWORD *)buf = 138412546;
      __int16 v27 = v5;
      __int16 v28 = 2112;
      double v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "DASContext: Remote device with UUID %@ had activity level changed to %@", buf, 0x16u);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v12 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100101178(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

BOOL sub_1000EFF24(id a1, id a2, NSDictionary *a3)
{
  id v3 = a2;
  if ([v3 platform] == (id)1 || objc_msgSend(v3, "platform") == (id)2)
  {
    uint64_t v4 = [v3 model];
    uint64_t v5 = [v4 substringToIndex:2];
    int v6 = [v5 intValue];

    if (v6 <= 20)
    {
LABEL_9:
      BOOL v10 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    if ([v3 platform] != (id)3 && objc_msgSend(v3, "platform") != (id)4) {
      goto LABEL_9;
    }
    uint64_t v7 = [v3 model];
    id v8 = [v7 substringToIndex:2];
    int v9 = [v8 intValue];

    if (v9 <= 22) {
      goto LABEL_9;
    }
  }
  BOOL v10 = 1;
LABEL_10:

  return v10;
}

BPSPublisher *__cdecl sub_1000F001C(id a1, BMBookmarkablePublisher *a2)
{
  int v2 = a2;

  return v2;
}

void sub_1000F0044(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 filterWithIsIncluded:&stru_1001787F8];
  int v6 = [v5 last];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  _DWORD v10[2] = sub_1000F01F8;
  void v10[3] = &unk_100178840;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v11 = v7;
  uint64_t v12 = v8;
  uint64_t v13 = a3;
  id v9 = [v6 sinkWithCompletion:&stru_100178818 receiveInput:v10];
}

BOOL sub_1000F0120(id a1, BMStoreEvent *a2)
{
  int v2 = [(BMStoreEvent *)a2 eventBody];
  id v3 = [v2 bundleID];

  if ([v3 isEqualToString:@"com.apple.mobileslideshow"]) {
    unsigned __int8 v4 = 1;
  }
  else {
    unsigned __int8 v4 = [v3 isEqualToString:@"com.apple.Photos"];
  }

  return v4;
}

void sub_1000F0194(id a1, BPSCompletion *a2)
{
  int v2 = [(BPSCompletion *)a2 error];

  if (v2)
  {
    id v3 = +[_DASDaemonLogger defaultCategory];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100101228(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
}

void sub_1000F01F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(a1 + 48)];
  id v6 = [v4 idsDeviceIdentifier];

  if (a2)
  {
    if (v6)
    {
      uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 80) objectForKey:v6];

      if (!v5)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 40) + 12));
        [*(id *)(*(void *)(a1 + 40) + 80) setValue:&off_1001877C8 forKey:v6];
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 40) + 12));
      }
    }
  }
}

void sub_1000F0498(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = a2;
  [v2 runUpdateRecentlyUsedPhotosAppDevicesTask];
  [v3 setTaskCompleted];
}

uint64_t sub_1000F08A4(uint64_t a1)
{
  qword_1001C4568 = (uint64_t)[objc_alloc((Class)objc_opt_class()) initWithDaemon:*(void *)(a1 + 32)];

  return _objc_release_x1();
}

uint64_t sub_1000F0B60()
{
  qword_1001C4578 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

id sub_1000F1358(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteOldDurations];
}

id sub_1000F1360(uint64_t a1)
{
  return [*(id *)(a1 + 32) deleteOldDurations];
}

id sub_1000F1368(uint64_t a1)
{
  return [*(id *)(a1 + 32) loadState];
}

uint64_t sub_1000F17CC(uint64_t a1)
{
  qword_1001C4588 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_1000F1AD0(uint64_t a1)
{
  if (+[_DASActivityDurationTracker shouldTrackActivity:*(void *)(a1 + 32)])
  {
    int v2 = *(void **)(a1 + 40);
    id v4 = [*(id *)(a1 + 32) startDate];
    [v4 timeIntervalSinceNow];
    [v2 addTimeInterval:*(void *)(a1 + 32) forActivity:-v3];
  }
}

id sub_1000F1BEC(uint64_t a1)
{
  id result = (id)+[_DASActivityDurationTracker shouldTrackActivity:*(void *)(a1 + 32)];
  if (result)
  {
    double v3 = [*(id *)(a1 + 32) startDate];
    [v3 timeIntervalSinceNow];
    double v5 = -v4;

    double v6 = fmax(v5, 3600.0);
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(a1 + 40);
    return [v7 addTimeInterval:v8 forActivity:v6];
  }
  return result;
}

uint64_t sub_1000F2098()
{
  qword_1001C4598 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

void sub_1000F2774(void *a1, void *a2, uint64_t a3)
{
  double v5 = a1;
  int v6 = 134218242;
  uint64_t v7 = (int)[a2 pid];
  __int16 v8 = 2112;
  uint64_t v9 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Could not terminate app with pid %ld due to error: %@, invalidating instead", (uint8_t *)&v6, 0x16u);
}

void sub_1000F282C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "DASAssertion dealloced before being invalidated! %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000F28A4(uint64_t a1, char a2, NSObject *a3)
{
  double v5 = +[NSNumber numberWithBool:a2 & 1];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Mode %@ state updated to: %@", (uint8_t *)&v6, 0x16u);
}

void sub_1000F2960()
{
  uint64_t v0 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  sub_10001484C();
  sub_100014864((void *)&_mh_execute_header, v1, v2, "Dynamic limit for %@ set to be %@", v3, v4, v5, v6, v7);
}

void sub_1000F29F8()
{
  sub_100014884();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Dynamic limit for %@ set to infinite because large transfer size", v1, 0xCu);
}

void sub_1000F2A6C()
{
  os_log_t v0 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  sub_10001484C();
  sub_100014864((void *)&_mh_execute_header, v1, v2, "Static limit for %@ set to be %@", v3, v4, v5, v6, v7);
}

void sub_1000F2B04()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Activity %{public}@ is asked to suspend but hasn't started", v2, v3, v4, v5, v6);
}

void sub_1000F2B6C()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Activity %{public}@ should be suspending because of runtime limits", v2, v3, v4, v5, v6);
}

void sub_1000F2BD4()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Activity %{public}@ is asked to suspend but already suspended", v2, v3, v4, v5, v6);
}

void sub_1000F2C3C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F2CA8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F2D14(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to construct app usage timeline", v1, 2u);
}

void sub_1000F2D58()
{
  sub_100014884();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "'%{public}@' could not be marked completed because can't find rate limit configuration %@", v2, 0x16u);
}

void sub_1000F2DDC()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Failed to convert _DASActivityRateLimit to data because %@", v2, v3, v4, v5, v6);
}

void sub_1000F2E44()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Failed to unarchive _DASActivityRateLimit %@", v2, v3, v4, v5, v6);
}

void sub_1000F2EAC()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "No group name for %@", v2, v3, v4, v5, v6);
}

void sub_1000F2F14(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Prediction likelihood: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000F2F8C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Prediction timeline query %@ failed with error %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000F3014(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "ATX not present", v1, 2u);
}

void sub_1000F3058(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Registered infer carry status task", v1, 2u);
}

void sub_1000F309C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Wrote inferred carry status to powerLog %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000F3114(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Inferred carry status didn't change from %d, not writing to powerLog", (uint8_t *)v2, 8u);
}

void sub_1000F318C(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Inferred carry status is %d", (uint8_t *)v2, 8u);
}

uint64_t sub_1000F3208()
{
  uint64_t v0 = abort_report_np();
  return sub_1000F3230(v0);
}

void sub_1000F3230()
{
  sub_100014884();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Remote Device %@ is lost", v1, 0xCu);
}

void sub_1000F32A4()
{
  sub_100014884();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Remote Device %@ is nearby", v1, 0xCu);
}

void sub_1000F3318()
{
  sub_100020A4C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Registered device list didn't change", v1, 2u);
}

void sub_1000F3358()
{
  sub_100014884();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failure to create browser for devices %@", v1, 0xCu);
}

void sub_1000F33CC()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "Failed to create parameters for browser; parameters not valid",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1000F3400()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "Endpoint is nil", v2, v3, v4, v5, v6);
}

void sub_1000F3434()
{
  sub_100014884();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Browser failed with error '%@'", v1, 0xCu);
}

void sub_1000F34A8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "PLEnergyMonitor budget failure", v1, 2u);
}

void sub_1000F34EC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F3558(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F35C4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F3630(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  CFStringRef v3 = @"DASPoliciesBlockingCriteria";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@: %@", (uint8_t *)&v2, 0x16u);
}

void sub_1000F36BC()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "Error setting up symptom feed", v2, v3, v4, v5, v6);
}

void sub_1000F36F0()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "Error setting up symptom workspace", v2, v3, v4, v5, v6);
}

void sub_1000F3724()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "(Start) Unable to obtain data consumption", v2, v3, v4, v5, v6);
}

void sub_1000F3758()
{
  sub_100014884();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Pre-run: %@", v1, 0xCu);
}

void sub_1000F37CC()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "Error getting data consumption from Symptoms", v2, v3, v4, v5, v6);
}

void sub_1000F3800()
{
  sub_100014884();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Activity %@ not tracked as being started, ignoring it", v1, 0xCu);
}

void sub_1000F3874()
{
  sub_100014884();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Post-run: %@", v1, 0xCu);
}

void sub_1000F38E8()
{
  sub_100014884();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Activity %@ not tracked as being started, considering it started", v1, 0xCu);
}

void sub_1000F395C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100028944((void *)&_mh_execute_header, v3, v4, "Failed to open shared memory for budgeting: %s", v5, v6, v7, v8, 2u);
}

void sub_1000F39E8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100028944((void *)&_mh_execute_header, v3, v4, "Failed to truncate shared memory for budgeting: %s", v5, v6, v7, v8, 2u);
}

void sub_1000F3A74(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100028944((void *)&_mh_execute_header, v3, v4, "mmap failed for budgeting: %s", v5, v6, v7, v8, 2u);
}

void sub_1000F3B00(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid budget name encountered", v1, 2u);
}

void sub_1000F3B44(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v5 = +[NSNumber numberWithUnsignedChar:**(unsigned __int8 **)(*(void *)a1 + 8)];
  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*a2 count]);
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Stored budget count %@ != expected count %@", (uint8_t *)&v7, 0x16u);
}

void sub_1000F3C34(uint8_t *a1, void *a2, void *a3, void *a4)
{
  int v7 = a2;
  id v8 = [a3 count];
  *(_DWORD *)a1 = 134217984;
  *a4 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "read %lu views", a1, 0xCu);
}

void sub_1000F3CAC(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to log DAS Trial identifiers to Kernel", v1, 2u);
}

void sub_1000F3CF0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  CFStringRef v3 = @"DASTrial";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@: %@", (uint8_t *)&v2, 0x16u);
}

void sub_1000F3D7C()
{
  sub_10002DCB8();
  sub_10002DC9C((void *)&_mh_execute_header, v0, v1, "notify_register_check for %@ failed (%d)\n", v2, v3, v4, v5, 2u);
}

void sub_1000F3DF0()
{
  sub_10002DCB8();
  sub_10002DC9C((void *)&_mh_execute_header, v0, v1, "notify_register_check for %@ failed (%d)\n", v2, v3, v4, v5, 2u);
}

void sub_1000F3E64()
{
  sub_100020A4C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unable to create _DKEvent", v1, 2u);
}

void sub_1000F3EA4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Reported to CoreAnalytics %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000F3F1C()
{
  sub_10002DCB8();
  sub_10002DC9C((void *)&_mh_execute_header, v0, v1, "notify_set_state for %@ failed (%d)\n", v2, v3, v4, v5, 2u);
}

void sub_1000F3F90()
{
  sub_10002DCCC();
  sub_10002DC9C((void *)&_mh_execute_header, v0, v1, "sfi_set_class_offtime for %lu microseconds failed (%d)\n", v2, v3, v4, v5, 0);
}

void sub_1000F4000()
{
  sub_10002DCCC();
  sub_10002DC9C((void *)&_mh_execute_header, v0, v1, "system_set_sfi_window for %lu failed (%d)\n", v2, v3, v4, v5, 0);
}

void sub_1000F4074(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = -1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "sfi_set_class_offtime for 0 microseconds failed (%d)\n", (uint8_t *)v1, 8u);
}

void sub_1000F40F4(os_log_t log)
{
  v1[0] = 67109120;
  v1[1] = -1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "system_set_sfi_window for 0 failed (%d)\n", (uint8_t *)v1, 8u);
}

void sub_1000F4174()
{
  sub_10002DCB8();
  sub_10002DC9C((void *)&_mh_execute_header, v0, v1, "notify_set_state for %@ failed (%d)\n", v2, v3, v4, v5, 2u);
}

void sub_1000F41E8()
{
  sub_100020A4C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Starting battery temperature analyzer", v1, 2u);
}

void sub_1000F4228()
{
  sub_100020A4C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Starting charge rate analyzer", v1, 2u);
}

void sub_1000F4268(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 objectForKeyedSubscript:@"Temperature"];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "BatteryTemperatureReader returning value %@", (uint8_t *)&v4, 0xCu);
}

void sub_1000F4308(os_log_t log, double a2, double a3)
{
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Battery temperature reference Value %lf Current value %lf", (uint8_t *)&v3, 0x16u);
}

void sub_1000F4390(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Initializing _DASBARMetricRecorder!", v1, 2u);
}

void sub_1000F43D4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Loaded bar metric dict from defaults %@", (uint8_t *)&v3, 0xCu);
}

void sub_1000F4450(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Saved bar metric dict to defaults %@", buf, 0xCu);
}

void sub_1000F44A8(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Reset _barMetricDict data successfully %@", (uint8_t *)&v3, 0xCu);
}

void sub_1000F4524(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Wrong argument 'stage': %ld passed to recordBARMetric.", (uint8_t *)&v2, 0xCu);
}

void sub_1000F459C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F45D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F460C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F4644(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "key = %@, value = %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000F46CC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

void sub_1000F4744(int a1, NSObject *a2)
{
  int v2 = 138412546;
  CFStringRef v3 = @"com.apple.powerui.nudge.LPM";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "notify_register_check for %@ failed (%d)\n", (uint8_t *)&v2, 0x12u);
}

void sub_1000F47D0(os_log_t log)
{
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to load model path %@", (uint8_t *)&v1, 0xCu);
}

void sub_1000F484C()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Logging Freezer skipped reasons to PowerLog %@", v2, v3, v4, v5, v6);
}

void sub_1000F48B4()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Logging Prewarm to PowerLog %@", v2, v3, v4, v5, v6);
}

void sub_1000F491C()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Logging Dock to PowerLog %@", v2, v3, v4, v5, v6);
}

void sub_1000F4984()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Wrote inferred carry status to powerLog %@", v2, v3, v4, v5, v6);
}

void sub_1000F49EC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid notify token", v1, 2u);
}

void sub_1000F4A30(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "notify_get_state() failed with error %u", (uint8_t *)v2, 8u);
}

uint64_t sub_1000F4AA8()
{
  uint64_t v0 = abort_report_np();
  return sub_1000F4AD0(v0);
}

uint64_t sub_1000F4AD0()
{
  uint64_t v0 = abort_report_np();
  return sub_1000F4AF8(v0);
}

void sub_1000F4AF8(void *a1)
{
  int v7 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a1 pid]);
  sub_100043974((void *)&_mh_execute_header, v1, v2, "No identifier for activity %@ with PID %@", v3, v4, v5, v6, 2u);
}

void sub_1000F4BAC(void *a1)
{
  uint64_t v1 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [a1 pid]);
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100043974((void *)&_mh_execute_header, v3, v4, "Failed to obtain process name for PID %@: %s", v5, v6, v7, v8, 2u);
}

void sub_1000F4C60(uint64_t *a1, void *a2, double a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a2;
  uint64_t v6 = +[NSNumber numberWithDouble:a3];
  int v7 = 138412546;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Activity %@ consumed %@", (uint8_t *)&v7, 0x16u);
}

void sub_1000F4D34(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Reporting to CA network usage %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000F4DAC(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 name];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error reporting to CA with capacity or identifier for %@", (uint8_t *)&v4, 0xCu);
}

void sub_1000F4E48()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Did not monitor screen wake state for %@", v2, v3, v4, v5, v6);
}

void sub_1000F4EB0()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Failed to stop monitoring screen wake state for %@", v2, v3, v4, v5, v6);
}

void sub_1000F4F18()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "No longer tracking %@", v2, v3, v4, v5, v6);
}

void sub_1000F4F80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F4FF0()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Failed to start monitoring screen wake state with identifier %@", v2, v3, v4, v5, v6);
}

void sub_1000F5058(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 topNPrediction];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "TopN: %@", (uint8_t *)&v4, 0xCu);
}

uint64_t sub_1000F50F0()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_1000F5114(v0);
}

void sub_1000F5114(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Entering alignment window", v1, 2u);
}

void sub_1000F5158(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Found at index=%llu", (uint8_t *)&v2, 0xCu);
}

void sub_1000F51D0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Exiting alignment window", v1, 2u);
}

void sub_1000F5214()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Unable to create unmanaged assertion on behalf of %@", v2, v3, v4, v5, v6);
}

void sub_1000F527C()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Unable to create managed assertion on behalf of %@", v2, v3, v4, v5, v6);
}

void sub_1000F52E4()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Unable to find assertion association for %@, skipping acquisition", v2, v3, v4, v5, v6);
}

void sub_1000F534C()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Unable to find assertion association for %@, skipping invalidation", v2, v3, v4, v5, v6);
}

void sub_1000F53B4()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Not creating a RBS Assertion for an invalid activity: %@", v2, v3, v4, v5, v6);
}

void sub_1000F541C()
{
  sub_10004C41C();
  sub_10004C434((void *)&_mh_execute_header, v0, v1, "Creating BackgroundFetch assertion for %@ (target PID: %d)");
}

void sub_1000F5484()
{
  sub_10004C41C();
  sub_10004C434((void *)&_mh_execute_header, v0, v1, "Creating HealthKit assertion for %@ (target PID: %d)");
}

void sub_1000F54EC()
{
  sub_10004C41C();
  sub_10004C434((void *)&_mh_execute_header, v0, v1, "Creating BackgroundTask assertion for %@ (target PID: %d)");
}

void sub_1000F5554()
{
  sub_10004C454();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unable to get pid for host target for %d, continuing only with assertion for extension", v1, 8u);
}

void sub_1000F55C8()
{
  sub_10004C41C();
  sub_10004C460((void *)&_mh_execute_header, v0, v1, "%@ does not have the correct web browser entitlement on the host (%d)");
}

void sub_1000F5630()
{
  sub_10004C454();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unable to grab process handle for PID: %d", v1, 8u);
}

void sub_1000F56A4()
{
  sub_10004C454();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "dasd client not present for pid (%d); using RBSProcessHandle instead",
    v1,
    8u);
}

void sub_1000F5718()
{
  sub_10004C454();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Using dasd client connection info to grab the audit token for %d", v1, 8u);
}

void sub_1000F578C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to create SecTask with audit token", v1, 2u);
}

void sub_1000F57D0()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "SecTaskCopyValueForEntitlement failed with error %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000F5838()
{
  sub_100014884();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Received value of %@ for %@ entitlement", v2, 0x16u);
}

void sub_1000F58BC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2112;
  *(void *)((char *)&v4 + 2) = a1;
  sub_10004C460((void *)&_mh_execute_header, a2, a3, "Unable to grab RBS Process Handle for pid %d with error: %@", v3, (void)v4, WORD4(v4));
}

void sub_1000F5934(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F596C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F59A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F59DC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Device Activity: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000F5A54(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 deviceActivityTimeline];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Device Activity: %@", (uint8_t *)&v4, 0xCu);
}

void sub_1000F5AF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F5B28(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get PPS Data: %@!", (uint8_t *)&v2, 0xCu);
}

void sub_1000F5BA0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F5BD8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F5C10(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Reporting %@ to PPS", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_1000F5C88()
{
  uint64_t v0 = abort_report_np();
  return sub_1000F5CB0(v0);
}

uint64_t sub_1000F5CB0()
{
  uint64_t v0 = abort_report_np();
  return sub_1000F5CD8(v0);
}

uint64_t sub_1000F5CD8()
{
  uint64_t v0 = abort_report_np();
  return sub_1000F5D00(v0);
}

uint64_t sub_1000F5D00()
{
  uint64_t v0 = abort_report_np();
  return sub_1000F5D28(v0);
}

uint64_t sub_1000F5D28()
{
  uint64_t v0 = abort_report_np();
  return sub_1000F5D50(v0);
}

uint64_t sub_1000F5D50()
{
  uint64_t v0 = abort_report_np();
  return sub_1000F5D78(v0);
}

void sub_1000F5D78(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "No app resumes/launches found", v1, 2u);
}

void sub_1000F5DBC()
{
  sub_100014884();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unable to extract app resumes and launches due to %@", v1, 0xCu);
}

void sub_1000F5E30(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No value found for some signpostinterval dictionary entries", v1, 2u);
}

void sub_1000F5E74()
{
  sub_100014884();
  sub_100054600((void *)&_mh_execute_header, v0, v1, "Converted app name %@ to bundle id %@");
}

void sub_1000F5EE8()
{
  sub_100054620();
  sub_100054600((void *)&_mh_execute_header, v0, v1, "Duration for %@ too long (%lu)");
}

void sub_1000F5F50(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [a2 objectForKeyedSubscript:@"ProcessName"];
  sub_100014884();
  sub_100054638((void *)&_mh_execute_header, v5, v6, "Read %@ as an App Resume", v7, v8, v9, v10, v11);
}

void sub_1000F5FEC(void *a1, void *a2)
{
  id v3 = a1;
  int v4 = [a2 objectForKeyedSubscript:@"ProcessName"];
  sub_100014884();
  sub_100054638((void *)&_mh_execute_header, v5, v6, "Read %@ as an App Foreground Launch", v7, v8, v9, v10, v11);
}

void sub_1000F6088(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "fastpass_yield feature flag disabled", v1, 2u);
}

void sub_1000F60CC()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "successfully completed sink for analysis %@", v2, v3, v4, v5, v6);
}

void sub_1000F6134()
{
  sub_100014884();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Couldn't finish analysis for %@", v1, 0xCu);
}

void sub_1000F61A8()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Posting %@ to CA", v2, v3, v4, v5, v6);
}

void sub_1000F6210()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Pruning events older than %@ date", v2, v3, v4, v5, v6);
}

void sub_1000F6278(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Reset Feature Duration Complete.", v1, 2u);
}

void sub_1000F62BC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Initializing _DASFeatureDurationTracker!", v1, 2u);
}

void sub_1000F6300()
{
  sub_10005A318();
  sub_100054600((void *)&_mh_execute_header, v0, v1, "The current build %@ is the same as saved release version %@");
}

void sub_1000F6368()
{
  sub_10005A318();
  sub_100054600((void *)&_mh_execute_header, v0, v1, "The current build %@ is different from the saved release version %@");
}

void sub_1000F63D0(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error loading feature codes.", v1, 2u);
}

void sub_1000F6414(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Reset featureDurationDict data successfully %@", (uint8_t *)&v3, 0xCu);
}

void sub_1000F6490(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 48);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "_featureDurationDict is now %@", (uint8_t *)&v3, 0xCu);
}

void sub_1000F650C(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Activity %@ is not in activity plist", buf, 0xCu);
}

uint64_t sub_1000F6564()
{
  uint64_t v0 = abort_report_np();
  return sub_1000F658C(v0);
}

void sub_1000F658C()
{
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v0, v1, "Updating 'CellQualityPredictions' to %@", v2);
}

void sub_1000F65F8()
{
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v0, v1, "Updating 'WiFiQualityPredictions' to %@", v2);
}

void sub_1000F6664(id *a1, NSObject *a2)
{
  int v3 = [*a1 wifiPredictionTimeline];
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, a2, v4, "Updating 'WiFiQualityPredictions' to %@", v5);
}

void sub_1000F66F4(id *a1, NSObject *a2)
{
  int v3 = [*a1 cellPredictionTimeline];
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, a2, v4, "Updating 'CellQualityPredictions' to %@", v5);
}

void sub_1000F6784()
{
  sub_100014884();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unable to obtain PNW status: %@", v1, 0xCu);
}

void sub_1000F67F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Plugin Likelihood: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000F6870(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Fast pass activities are allowed to run on battery. Ignoring requiresExternalPower setting.", v1, 2u);
}

void sub_1000F68B4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Incorrect type %@ received for notChargingReason", (uint8_t *)&v2, 0xCu);
}

void sub_1000F692C(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 pluginTimeline];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Plugin Likelihood: %@", (uint8_t *)&v4, 0xCu);
}

void sub_1000F69C8(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to serialize bundleID: %@", (uint8_t *)&v3, 0xCu);
}

void sub_1000F6A44(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Truncating bundleID for serialization: %@ -> %@", (uint8_t *)&v4, 0x16u);
}

void sub_1000F6AD0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No Auto SU times returned--using default!", v1, 2u);
}

void sub_1000F6B14(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Writing app kill event: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000F6B8C()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "DAS told us to run %{public}@, but no corresponding task found in helper", v2, v3, v4, v5, v6);
}

void sub_1000F6BF4()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "DAS told us to run %{public}@, but activity mismatch detected in helper", v2, v3, v4, v5, v6);
}

void sub_1000F6C5C()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "DAS told us to suspend %{public}@, but no corresponding task found in helper", v2, v3, v4, v5, v6);
}

void sub_1000F6CC4()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "DAS told us to suspend %{public}@, but activity mismatch detected in helper", v2, v3, v4, v5, v6);
}

void sub_1000F6D2C()
{
  sub_10006B928(__stack_chk_guard);
  sub_10006B908();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "%{public}@: Feature codes are mandatory for FastPass", v2, v3, v4, v5, v6);
}

void sub_1000F6D94(void *a1, NSObject *a2)
{
  id v3 = [a1 name];
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, a2, v4, "%{public}@: Expected download size needs to be set when disk volume is set", v5);
}

void sub_1000F6E2C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 name];
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v3, v5, "%{public}@: relatedApplications cannot be empty when beforeApplicationLaunch is set to true", v6);
}

void sub_1000F6ECC(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 name];
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v3, v5, "%{public}@: relatedApplications cannot be empty when requestsApplicationLaunch is set to true", v6);
}

void sub_1000F6F6C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 name];
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v3, v5, "%{public}@: relatedApplications cannot be empty when runOnAppForeground is set to true", v6);
}

void sub_1000F700C(void *a1, uint64_t a2, NSObject *a3)
{
  id v5 = [a1 name];
  id v6 = +[NSString stringWithUTF8String:a2];
  int v7 = 138543874;
  id v8 = v5;
  __int16 v9 = 2112;
  id v10 = v6;
  __int16 v11 = 2080;
  uint64_t v12 = "Maintenance";
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@: Invalid priority value %@, Defaulting to %s", (uint8_t *)&v7, 0x20u);
}

void sub_1000F7100()
{
  sub_10006B928(__stack_chk_guard);
  sub_10006B908();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "%{public}@: Invalid FastPass submission", v2, v3, v4, v5, v6);
}

void sub_1000F7168()
{
  sub_10006B928(__stack_chk_guard);
  sub_10006B908();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "%{public}@: Feature codes, if present, must have entries", v2, v3, v4, v5, v6);
}

void sub_1000F71D0()
{
  sub_10006B928(__stack_chk_guard);
  sub_10006B908();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "%{public}@: Invalid Feature codes submitted", v2, v3, v4, v5, v6);
}

void sub_1000F7238(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 name];
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v3, v5, "FastPass %{public}@ should not ask to rerun via plist", v6);
}

void sub_1000F72D8(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 name];
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v3, v5, "%{public}@: Repeating activites must have an interval of more than 300 sec", v6);
}

void sub_1000F7378(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 name];
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v3, v5, "%{public}@: postinstall activites are not allowed to repeat", v6);
}

void sub_1000F7418(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "xpc_get_event_name failed", v1, 2u);
}

void sub_1000F745C()
{
}

void sub_1000F7478(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = a2;
  uint64_t v4 = [v2 name];
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v3, v5, "%{public}@: Dependencies require a valid identifier", v6);
}

void sub_1000F7514(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = a2;
  uint8_t v6 = [v4 name];
  sub_10006B914();
  uint64_t v8 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%{public}@: %{public}@ is an invalid dependency form, must be a dictionary", v7, 0x16u);
}

void sub_1000F75C8()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Client needs at least one feature code %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000F7630()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "FastPass dictionary not found for %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000F7698(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5 = a1;
  v6[0] = 67109378;
  v6[1] = [a2 intValue];
  __int16 v7 = 2114;
  uint64_t v8 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "FastPass feature code %d not found for task %{public}@", (uint8_t *)v6, 0x12u);
}

void sub_1000F774C()
{
  sub_10006B914();
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "FastPass service name mismatch for input service name %{public}@ for task %{public}@", v2, 0x16u);
}

void sub_1000F77C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%{public}@ bypasses predictions", (uint8_t *)&v2, 0xCu);
}

void sub_1000F7840(void **a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a2;
  uint8_t v6 = [v4 objectForKeyedSubscript:a3];
  sub_100014884();
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Refreshed %@ from Biome persistence", v7, 0xCu);
}

void sub_1000F78F4(void *a1)
{
  id v2 = a1;
  sub_100074554();
  objc_opt_class();
  sub_100014884();
  id v4 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Tried to refresh state of an invalid class type: %@. Dropping group", v5, 0xCu);
}

void sub_1000F7994()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Unable to refresh %@ due to insufficient file protection class", v2, v3, v4, v5, v6);
}

void sub_1000F79FC()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Ignoring dependency monitoring for %@; has not declared itself as involved in any chain",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1000F7A64()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Stopping dependencies monitoring for %@", v2, v3, v4, v5, v6);
}

void sub_1000F7ACC()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Cannot end dependency monitoring for %@; has not declared itself as involved in any chain",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1000F7B34()
{
  int v2 = 136315650;
  sub_100074538();
  sub_100074560((void *)&_mh_execute_header, v0, v1, "%s: Failed to report result consumption on behalf of %@ with error: %@", v2);
}

void sub_1000F7BB0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)sub_100074554() description];
  sub_100074504();
  sub_100074518((void *)&_mh_execute_header, v5, v6, "%s: Dependency group for (identifier: %@) is not of the correct type", v7, v8, v9, v10, 2u);
}

void sub_1000F7C4C()
{
  int v2 = 136315650;
  sub_100074538();
  sub_100074560((void *)&_mh_execute_header, v0, v1, "%s: Failed to report result production on behalf of %@ with error: %@", v2);
}

void sub_1000F7CC8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)sub_100074554() description];
  sub_100074504();
  sub_100074518((void *)&_mh_execute_header, v5, v6, "%s: Dependency group for (identifier: %@) is not of the correct type", v7, v8, v9, v10, 2u);
}

void sub_1000F7D64()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Ignoring activity running monitoring for %@", v2, v3, v4, v5, v6);
}

void sub_1000F7DCC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [(id)sub_100074554() description];
  sub_100074504();
  sub_100074518((void *)&_mh_execute_header, v5, v6, "%s: Dependency group for (identifier: %@) is not of the correct type", v7, v8, v9, v10, 2u);
}

void sub_1000F7E68()
{
  v1[0] = 136315394;
  sub_100074504();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: No dependencies specified on %@, reporting dependencies as satisfied", (uint8_t *)v1, 0x16u);
}

void sub_1000F7EE8()
{
  v1[0] = 136315394;
  sub_100074504();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: Dependencies on %@ are satisifed due to dependency pre-clearing", (uint8_t *)v1, 0x16u);
}

void sub_1000F7F68(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 136315650;
  uint64_t v5 = "-[_DASActivityDependencyManager areDependenciesSatisfiedFor:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: %@ has unsatisfied activity completion dependencies: %@", (uint8_t *)&v4, 0x20u);
}

void sub_1000F8004()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Next Timeline Value: %@", v2, v3, v4, v5, v6);
}

void sub_1000F806C()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Current Timeline Value: %@", v2, v3, v4, v5, v6);
}

void sub_1000F80D4()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Mean time Dict %@", v2, v3, v4, v5, v6);
}

void sub_1000F813C(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100014884();
  sub_100028944((void *)&_mh_execute_header, v3, v4, "Failed to obtain size for snapshot: %s", v5, v6, v7, v8, v9);
}

void sub_1000F81C4(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100014884();
  sub_100028944((void *)&_mh_execute_header, v3, v4, "Failed to obtain snapshot: %s", v5, v6, v7, v8, v9);
}

uint64_t sub_1000F824C()
{
  uint64_t v0 = abort_report_np();
  return sub_1000F8274(v0);
}

void sub_1000F8274()
{
  v1[0] = 138412546;
  sub_10002DCB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "notify_register_check for %@ failed (%d)\n", (uint8_t *)v1, 0x12u);
}

void sub_1000F82F4(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Init: Error setting up symptom feed", v1, 2u);
}

void sub_1000F8338(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "sharedProfiler: Profiler dispatched", v1, 2u);
}

void sub_1000F837C()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "startProfilingSnapshot: network pre snapshot failed: %@", v2, v3, v4, v5, v6);
}

void sub_1000F83E4()
{
  sub_10005A318();
  sub_100054600((void *)&_mh_execute_header, v0, v1, "startProfilingSnapshot: %@ network pre snapshot successful %@");
}

void sub_1000F844C()
{
  sub_10005A318();
  sub_100054600((void *)&_mh_execute_header, v0, v1, "startProfilingSnapshot: %@ rusage pre snapshot successful %@");
}

void sub_1000F84B4(uint64_t a1, void *a2, int a3)
{
  uint64_t v5 = a2;
  int v6 = *__error();
  int v7 = 138412802;
  uint64_t v8 = a1;
  __int16 v9 = 1024;
  int v10 = a3;
  __int16 v11 = 1024;
  int v12 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "startProfilingSnapshot: %@ rusage pre snapshot failed with retcode: %d err: %d ", (uint8_t *)&v7, 0x18u);
}

void sub_1000F8570()
{
  sub_10005A318();
  sub_100054600((void *)&_mh_execute_header, v0, v1, "startProfilingSnapshot: %@ : Created session with value %@");
}

void sub_1000F85D8(uint64_t a1, void *a2, int a3)
{
  id v4 = a2;
  strerror(a3);
  sub_10007D4F8();
  sub_10007D510((void *)&_mh_execute_header, v5, v6, "startProfilingSnapshot: %@ : failed at pc_session_begin with error %s", v7, v8, v9, v10, v11);
}

void sub_1000F866C(uint64_t a1, void *a2, int a3)
{
  id v4 = a2;
  strerror(a3);
  sub_10007D4F8();
  sub_10007D510((void *)&_mh_execute_header, v5, v6, "startProfilingSnapshot: %@ : failed at pc_session_set_procpid with error %s", v7, v8, v9, v10, v11);
}

void sub_1000F8700()
{
  v1[0] = 138412546;
  sub_10002DCB8();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "notify_get_state for %@ failed (%d)\n", (uint8_t *)v1, 0x12u);
}

void sub_1000F8780()
{
  sub_100014884();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to write profiles to store with error %@ ", v1, 0xCu);
}

void sub_1000F87F4()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "endProfiling: %@ : stopRecordingNetworkTransfer returned nil", v2, v3, v4, v5, v6);
}

void sub_1000F885C()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "endProfiling: %@ : network post snapshot after for activity", v2, v3, v4, v5, v6);
}

void sub_1000F88C4()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "endProfiling: %@ : Failed to retrieve rusage pre snapshot", v2, v3, v4, v5, v6);
}

void sub_1000F892C()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "endProfiling: %@ : rusage_post_snapshot failed for activity", v2, v3, v4, v5, v6);
}

void sub_1000F8994()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "endProfiling: %@ : Failed to retrieve saved session", v2, v3, v4, v5, v6);
}

void sub_1000F89FC()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "startRecordingNetwork: %@ : Invalid appPIDName, aborting", v2, v3, v4, v5, v6);
}

void sub_1000F8A64()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "startRecordingNetwork: %@ : Couldn't retrieve appNames, aborting", v2, v3, v4, v5, v6);
}

void sub_1000F8ACC()
{
  sub_10005A318();
  sub_100054600((void *)&_mh_execute_header, v0, v1, "startRecordingNetwork: %@ : successfully recorded network consumption %@");
}

void sub_1000F8B34()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "startRecordingNetwork: %@ : failed symptoms timedout, aborting.", v2, v3, v4, v5, v6);
}

void sub_1000F8B9C()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "startRecordingNetwork: %@ : failed to obtain network info for activity, aborting.", v2, v3, v4, v5, v6);
}

void sub_1000F8C04(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F8C74()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "stopRecordingNetwork: %@ : Invalid appPIDName, aborting", v2, v3, v4, v5, v6);
}

void sub_1000F8CDC()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "stopRecordingNetwork: %@ : Couldn't retrieve appNames, aborting", v2, v3, v4, v5, v6);
}

void sub_1000F8D44()
{
  sub_10005A318();
  sub_100054600((void *)&_mh_execute_header, v0, v1, "stopRecordingNetwork: %@ : successfully recorded network consumption %@");
}

void sub_1000F8DAC()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "stopRecordingNetwork: %@ : failed symptoms timedout, aborting.", v2, v3, v4, v5, v6);
}

void sub_1000F8E14()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "stopRecordingNetwork: %@ : failed to obtain network info for activity, aborting.", v2, v3, v4, v5, v6);
}

void sub_1000F8E7C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F8EEC()
{
  sub_10005A318();
  sub_10007D4D8((void *)&_mh_execute_header, v0, v1, "%s Error getting value, required parameters missing for session: %@");
}

void sub_1000F8F54()
{
  sub_10005A318();
  sub_10007D4D8((void *)&_mh_execute_header, v0, v1, "%s Error getting value, no measurements available for session: %@");
}

void sub_1000F8FBC()
{
  sub_10005A318();
  sub_10007D4D8((void *)&_mh_execute_header, v0, v1, "%s Error getting value, proc_idx out of range for session: %@");
}

void sub_1000F9024()
{
  sub_10005A318();
  sub_10007D4D8((void *)&_mh_execute_header, v0, v1, "%s Error getting value, specified measures unavailable for session: %@");
}

void sub_1000F908C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error retrieving current CPU uptime: %d", (uint8_t *)v2, 8u);
}

void sub_1000F9104(void *a1, uint64_t a2, uint64_t a3)
{
  sub_1000809D4((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_fault_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "Failed to expire task: %@ with error: %@", v4, 0x16u);
}

void sub_1000F915C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to find recent installs", v1, 2u);
}

void sub_1000F91A0()
{
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v0, v1, "Unable to enumerate over entire signpost observer: %@", v2);
}

void sub_1000F920C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 processName];
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v3, v5, "Binary path unavailable for %@", v6);
}

void sub_1000F92A8(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 processName];
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v3, v5, "bundleIdentifier unavailable for %@", v6);
}

void sub_1000F9344()
{
  sub_100014884();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Error processing signposts: %@, %@", v2, 0x16u);
}

void sub_1000F93C8()
{
  sub_100014884();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%@ %lu is an invalid feature code", v2, 0x16u);
}

void sub_1000F944C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error sending feature codes/version to PPS", v1, 2u);
}

void sub_1000F9490()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Past Preview available checkpoints %@", v2, v3, v4, v5, v6);
}

void sub_1000F94F8()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Past Available checkpoints %@", v2, v3, v4, v5, v6);
}

void sub_1000F9560()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Fetched %@", v2, v3, v4, v5, v6);
}

void sub_1000F95C8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error sending task dependency info to PPS", v1, 2u);
}

void sub_1000F960C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to gather application name from bundleIdentifier: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000F9684()
{
  sub_100020A4C();
  sub_100085430((void *)&_mh_execute_header, v0, v1, "Activity is nil", v2, v3, v4, v5, v6);
}

void sub_1000F96B8()
{
  sub_100020A4C();
  sub_100085430((void *)&_mh_execute_header, v0, v1, "Now is nil", v2, v3, v4, v5, v6);
}

void sub_1000F96EC()
{
  sub_100020A4C();
  sub_100085430((void *)&_mh_execute_header, v0, v1, "Activities is nil", v2, v3, v4, v5, v6);
}

void sub_1000F9720()
{
  sub_100020A4C();
  sub_100085430((void *)&_mh_execute_header, v0, v1, "Invalid paramters passed to snapshotWithSignature", v2, v3, v4, v5, v6);
}

void sub_1000F9754(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 40);
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Successfully reported ABC case with session ID %@ for activities %@", (uint8_t *)&v4, 0x16u);
}

void sub_1000F97E0(int a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a2 + 40);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "ABC case rejected for activities %@ with reason %lld", (uint8_t *)&v4, 0x16u);
}

void sub_1000F9870()
{
  sub_100020A4C();
  sub_100085430((void *)&_mh_execute_header, v0, v1, "Cannot check activities for overdue tasks without BG task", v2, v3, v4, v5, v6);
}

void sub_1000F98A4(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to expire task:%@ with error:%@", buf, 0x16u);
}

void sub_1000F990C()
{
  sub_100020A4C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Scheduling overdue check", v1, 2u);
}

void sub_1000F994C()
{
  sub_100020A4C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Running overdue check", v1, 2u);
}

void sub_1000F998C(void *a1, uint8_t *a2, void *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  sub_100060960((void *)&_mh_execute_header, a4, (uint64_t)a3, "experimentsToWrite: Skipping stream %@", a2);
}

void sub_1000F99E0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F9A4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F9AC4()
{
  sub_100020A4C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unknown state for submission decision", v1, 2u);
}

void sub_1000F9B04()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Device already chosen for submission, activity must not have completed so far", v2, v3, v4, v5, v6);
}

void sub_1000F9B38()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Device already chosen to not submit, activity must not have completed so far", v2, v3, v4, v5, v6);
}

void sub_1000F9B6C()
{
  sub_100014884();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  sub_10008D89C((void *)&_mh_execute_header, v1, (uint64_t)v1, "Adding %@ as stream for %@", v2);
}

void sub_1000F9BEC()
{
  sub_100020A4C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "writeExperiments: Couldn't obtain a file handler, aborting writing experiments", v1, 2u);
}

void sub_1000F9C2C()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Aborted writing to file, suspending self", v2, v3, v4, v5, v6);
}

void sub_1000F9C60(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100060960((void *)&_mh_execute_header, a3, (uint64_t)a3, "defaults updated to %@", (uint8_t *)a2);
}

void sub_1000F9CB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000F9D28()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "writeExperiments: completed writing to file!", v2, v3, v4, v5, v6);
}

void sub_1000F9D5C()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "writeExperiments: couldn't write to file, aborting!", v2, v3, v4, v5, v6);
}

void sub_1000F9D90()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Deferring datacollection activity", v2, v3, v4, v5, v6);
}

void sub_1000F9DC4()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "writeExperiment: %@ : wasn't written", v2, v3, v4, v5, v6);
}

void sub_1000F9E2C()
{
  sub_100014884();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  sub_10008D89C((void *)&_mh_execute_header, v1, (uint64_t)v1, "writeExperiment: %@ : Written %lu streams", v2);
}

void sub_1000F9EA8()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Forcing device has enough history", v2, v3, v4, v5, v6);
}

void sub_1000F9EDC(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 firstObject];
  uint64_t v5 = [v4 startDate];
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v3, v6, "writeExperiment: Data not old enough to be written. Oldest event logged at %@", v7);
}

void sub_1000F9F90()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "writeExperiement: %@ : experiment is being written the first time", v2, v3, v4, v5, v6);
}

void sub_1000F9FF8()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "writeExperiment: %@ : Force ignoring last written date", v2, v3, v4, v5, v6);
}

void sub_1000FA060()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Experiment too recent. Skipping", v2, v3, v4, v5, v6);
}

void sub_1000FA094()
{
  sub_10005A318();
  sub_10008D89C((void *)&_mh_execute_header, v0, (uint64_t)v0, "writeExperiment: %@ : experiment was previously written on %@, working on only delta", v1);
}

void sub_1000FA104(void *a1, void *a2, uint64_t a3)
{
  sub_1000809D4((uint64_t)a1, (uint64_t)a2, a3, 5.778e-34);
  sub_10008D89C((void *)&_mh_execute_header, v7, v5, "Ultimately wrote %@ events for %@", v6);
}

void sub_1000FA15C()
{
  sub_10008D8B4();
  id v2 = v1;
  uint64_t v3 = [v0 name];
  sub_10008D884();
  sub_100014864((void *)&_mh_execute_header, v4, v5, "writeStream: %@ : Adding extra predicate conditions, final predicate: %@", v6, v7, v8, v9, v10);
}

void sub_1000FA1FC()
{
  sub_10008D8B4();
  id v2 = v1;
  uint64_t v3 = [v0 name];
  sub_10008D884();
  sub_100014864((void *)&_mh_execute_header, v4, v5, "writeStream: %@ : Adding extra predicate conditions, final predicate: %@", v6, v7, v8, v9, v10);
}

void sub_1000FA29C()
{
  sub_10008D8B4();
  id v2 = v1;
  uint64_t v3 = [v0 name];
  sub_10008D884();
  sub_100014864((void *)&_mh_execute_header, v4, v5, "writeStream: %@ : Adding extra predicate conditions, final predicate: %@", v6, v7, v8, v9, v10);
}

void sub_1000FA33C()
{
  sub_10008D8B4();
  id v2 = v1;
  uint64_t v3 = [v0 name];
  sub_10008D884();
  sub_100014864((void *)&_mh_execute_header, v4, v5, "writeStream: %@ : Adding extra predicate conditions, final predicate: %@", v6, v7, v8, v9, v10);
}

void sub_1000FA3DC()
{
  sub_10008D8B4();
  id v2 = v1;
  uint64_t v3 = [v0 name];
  sub_10008D884();
  sub_100014864((void *)&_mh_execute_header, v4, v5, "writeStream: %@ : Adding extra predicate conditions, final predicate: %@", v6, v7, v8, v9, v10);
}

void sub_1000FA47C()
{
  sub_10008D8B4();
  id v2 = v1;
  uint64_t v3 = [v0 name];
  sub_10008D884();
  sub_100014864((void *)&_mh_execute_header, v4, v5, "writeStream: %@ : Adding extra predicate conditions, final predicate: %@", v6, v7, v8, v9, v10);
}

void sub_1000FA51C(void *a1, uint64_t a2, uint64_t a3)
{
  sub_1000809D4((uint64_t)a1, a2, a3, 5.778e-34);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "writeStream: %@ : Skipping query because JSON write failed with exception: %@", v4, 0x16u);
}

void sub_1000FA574()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Processed events are not valid JSON objects, skipping with error %@", v2, v3, v4, v5, v6);
}

void sub_1000FA5DC(void *a1, void *a2)
{
  uint64_t v3 = a1;
  [a2 count];
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v3, v4, "processEvents: Processed %lu events", v5);
}

void sub_1000FA670()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Submitting through Diagnostic Pipeline - successful", v2, v3, v4, v5, v6);
}

void sub_1000FA6A4(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v3, v5, "Submitting through Diagnostic Pipeline - failed with error %@", v6);
}

void sub_1000FA740()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Forcing DP route, but actually skipping submission", v2, v3, v4, v5, v6);
}

void sub_1000FA774()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Submitting through Crash Reporter - successful", v2, v3, v4, v5, v6);
}

void sub_1000FA7A8()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Submitting through Crash Reporter - failed", v2, v3, v4, v5, v6);
}

void sub_1000FA7DC()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Submitting through Crash Reporter Pipeline", v2, v3, v4, v5, v6);
}

void sub_1000FA810(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000FA884(int a1, NSObject *a2)
{
  v2[0] = 67109376;
  v2[1] = a1;
  __int16 v3 = 1024;
  int v4 = 10;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Trial diagnostic pipeline shunt percentage found: sampling 1 in %u instead of default 1 in %u", (uint8_t *)v2, 0xEu);
}

void sub_1000FA90C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000FA984(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000FA9FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000FAA74()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Invalid stream: %@", v2, v3, v4, v5, v6);
}

void sub_1000FAADC(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2048;
  uint64_t v8 = v4;
  sub_10008D89C((void *)&_mh_execute_header, a2, a3, "Convert stream: %@ Found %ld events", (uint8_t *)&v5);
}

void sub_1000FAB64()
{
  sub_10005A318();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Failed to submit task %@ with error: %@", v1, 0x16u);
}

void sub_1000FABDC()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "force: wrote %lld experiments", v2, v3, v4, v5, v6);
}

void sub_1000FAC44()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "force: didn't write any experiment to file", v2, v3, v4, v5, v6);
}

void sub_1000FAC78()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "force: attempting to write experiments: %@", v2, v3, v4, v5, v6);
}

void sub_1000FACE0()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "force: Running data collection", v2, v3, v4, v5, v6);
}

void sub_1000FAD14()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "schedule: Running background app refresh analytics background task", v2, v3, v4, v5, v6);
}

void sub_1000FAD48()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "schedule: Running analytics background task", v2, v3, v4, v5, v6);
}

void sub_1000FAD7C()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Insignificant usage; ignoring", v2, v3, v4, v5, v6);
}

void sub_1000FADB0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000FAE20()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "AirPods: %@", v2, v3, v4, v5, v6);
}

void sub_1000FAE88()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Error fetching data: %@", v2, v3, v4, v5, v6);
}

void sub_1000FAEF0()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Media playback: %@", v2, v3, v4, v5, v6);
}

uint64_t sub_1000FAF58()
{
  int v0 = abort_report_np();
  return sub_1000FAF80(v0, v1, v2);
}

void sub_1000FAF80(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Evaluating %@ for mode %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000FB008()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "Error in registering for IOService", v2, v3, v4, v5, v6);
}

void sub_1000FB03C()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "Unable to create notification port", v2, v3, v4, v5, v6);
}

void sub_1000FB070()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "Unable to register notification", v2, v3, v4, v5, v6);
}

void sub_1000FB0A4(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 134218496;
  uint64_t v5 = a2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  __int16 v8 = 2048;
  uint64_t v9 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Current temp %ld, recent temp %ld, change %ld", (uint8_t *)&v4, 0x20u);
}

void sub_1000FB138(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get valid battery temperature: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000FB1B0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get battery properties: %d", (uint8_t *)v2, 8u);
}

void sub_1000FB228()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "Couldn't create _DKEvent", v2, v3, v4, v5, v6);
}

void sub_1000FB25C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Couldn't write batteryTempEvent to store with error %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000FB2D4()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Rescheduling refreshes (if necessary) for %@", v2, v3, v4, v5, v6);
}

void sub_1000FB33C()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Canceling refreshes (if any) for %@", v2, v3, v4, v5, v6);
}

void sub_1000FB3A4(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "BAR WiFi Only => %u", (uint8_t *)v2, 8u);
}

void sub_1000FB41C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000FB490()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Killed are: %@", v2, v3, v4, v5, v6);
}

void sub_1000FB4F8()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "App killed: %@", v2, v3, v4, v5, v6);
}

void sub_1000FB560(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 error];
  sub_100014884();
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Error obtaining recently launched apps: %@", v5, 0xCu);
}

void sub_1000FB604(os_log_t log)
{
  int v1 = 138412290;
  CFStringRef v2 = @"We tried to launch Buddy for Background App Refresh. Please file a bug!";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

void sub_1000FB688()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Scheduling activities for %@", v2, v3, v4, v5, v6);
}

void sub_1000FB6F0()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Remote Notification: %@ - Debugging", v2, v3, v4, v5, v6);
}

void sub_1000FB758()
{
  sub_100014884();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error obtaining RBS process handle: %@", v1, 0xCu);
}

void sub_1000FB7CC()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Delays are %@", v2, v3, v4, v5, v6);
}

void sub_1000FB834()
{
  sub_100094878();
  id v2 = v1;
  uint64_t v3 = [(id)sub_10009486C() name];
  sub_100094834();
  sub_10009484C((void *)&_mh_execute_header, v4, v5, "No permitted identifiers found for activity %{public}@ app %{public}@", v6, v7, v8, v9, v10);
}

void sub_1000FB8CC()
{
  sub_100094878();
  id v2 = v1;
  uint64_t v3 = [(id)sub_10009486C() name];
  sub_100094834();
  sub_10009484C((void *)&_mh_execute_header, v4, v5, "No relevant background execution modes found for activity %{public}@ app %{public}@", v6, v7, v8, v9, v10);
}

void sub_1000FB964()
{
  sub_100094878();
  id v2 = v1;
  uint64_t v3 = [(id)sub_10009486C() name];
  sub_100094834();
  sub_10009484C((void *)&_mh_execute_header, v4, v5, "Activity %{public}@ background launch not allowed for app %{public}@", v6, v7, v8, v9, v10);
}

void sub_1000FB9FC()
{
  sub_100094878();
  id v2 = v1;
  uint64_t v3 = [(id)sub_10009486C() name];
  sub_100094834();
  sub_10009484C((void *)&_mh_execute_header, v4, v5, "Activity %{public}@: app %{public}@ is not installed", v6, v7, v8, v9, v10);
}

void sub_1000FBA94()
{
  sub_100094878();
  id v2 = v1;
  uint64_t v3 = [(id)sub_10009486C() name];
  sub_100094834();
  sub_10009484C((void *)&_mh_execute_header, v4, v5, "Activity %{public}@: app %{public}@ has invalid state", v6, v7, v8, v9, v10);
}

void sub_1000FBB2C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Fetched %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000FBBA4()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "No reference data for progress in last 48 hours; Skipping TTR",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1000FBBD8()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Triggering TTR MAD slow progress", v2, v3, v4, v5, v6);
}

void sub_1000FBC0C()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "MAD slow progress TTR was prompted in last 30 days; Skipping",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1000FBC40()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Small photo library; Skipping progress check", v2, v3, v4, v5, v6);
}

void sub_1000FBC74()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Spotlight slow progress TTR was prompted in last 3 days; Skipping",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1000FBCA8()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "No enough charging time to judge Spotlight's slow progress; Skipping",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1000FBCDC()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Spotlight not enough progress samples; Skipping TTR",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_1000FBD10()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Spotlight good progress; Skipping TTR", v2, v3, v4, v5, v6);
}

void sub_1000FBD44(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timer fired for CA remote widget budget duration", v1, 2u);
}

void sub_1000FBD88(double a1)
{
  uint64_t v1 = +[NSNumber numberWithDouble:a1 / 3600.0];
  sub_1000979D0((void *)&_mh_execute_header, v2, v3, "Logging remote widget actual duration to CA %@", v4, v5, v6, v7, 2u);
}

void sub_1000FBE24(double a1)
{
  uint64_t v1 = +[NSNumber numberWithDouble:a1 / 3600.0];
  sub_1000979D0((void *)&_mh_execute_header, v2, v3, "Logging remote widget duration to CA %@", v4, v5, v6, v7, 2u);
}

void sub_1000FBEC0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Duration is over a day %@", (uint8_t *)&v3, 0xCu);
}

void sub_1000FBF3C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No actual unavailable date was recorded", v1, 2u);
}

void sub_1000FBF80(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Actual Duration is over a day %@", (uint8_t *)&v3, 0xCu);
}

void sub_1000FBFFC(void *a1, void *a2)
{
  int v3 = a1;
  uint64_t v4 = [a2 identifier];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Missing service name for %@", (uint8_t *)&v5, 0xCu);
}

void sub_1000FC0A4()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Failed to fetch service name for %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000FC10C()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Failed to create BGSystemTask: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000FC174()
{
  sub_10009E8A8();
  sub_10007D4D8((void *)&_mh_execute_header, v0, v1, "Failed to submit BGSystemTask: %{public}@ with error %{public}@");
}

void sub_1000FC1E4()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "xpc_get_event_name failed", v2, v3, v4, v5, v6);
}

void sub_1000FC218(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000FC288(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [[(id)sub_10009486C() scheduler_activity];
  sub_100014884();
  sub_10009E8E0();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x20u);
}

void sub_1000FC344(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_10009486C() name];
  sub_10009E8F0();
  sub_10009E920((void *)&_mh_execute_header, v4, v5, "xpc_event_publisher_fire failed to run %{public}@ with error %d", v6, v7, v8, v9, v10);
}

void sub_1000FC3E0(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_10009486C() name];
  sub_10009E8F0();
  sub_10009E920((void *)&_mh_execute_header, v4, v5, "xpc_event_publisher_fire failed to suspend %{public}@ with error %d", v6, v7, v8, v9, v10);
}

void sub_1000FC47C(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [sub_10009486C() scheduler_activity];
  sub_100014884();
  sub_10009E8E0();
  _os_log_error_impl(v4, v5, v6, v7, v8, 0x16u);
}

void sub_1000FC538(void *a1, void *a2)
{
  id v4 = a1;
  [(id)sub_10009486C() state];
  [a2 pid];
  sub_10009E8E0();
  _os_log_error_impl(v5, v6, v7, v8, v9, 0x26u);
}

void sub_1000FC610(void *a1)
{
  id v2 = a1;
  sub_10009E8C8();
  sub_10009E908();
  sub_10009E864();
  sub_10009E888((void *)&_mh_execute_header, v3, v4, "Ack for suspension received in invalid state %ld from client (PID %d) for %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000FC69C(void *a1)
{
  id v2 = a1;
  sub_10009E8C8();
  sub_10009E908();
  sub_10009E864();
  sub_10009E888((void *)&_mh_execute_header, v3, v4, "Request for client-led expiration received in invalid state %ld from client (PID %d) for %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000FC728()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "submitTaskRequestWithIdentifier: Failed to fetch service name for %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000FC790()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "submitTaskRequestWithIdentifier: Failed to create BGSystemTask: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000FC7F8()
{
  sub_10009E8A8();
  sub_10007D4D8((void *)&_mh_execute_header, v0, v1, "submitTaskRequestWithIdentifier: Failed to submit BGSystemTask: %{public}@ with error %{public}@");
}

void sub_1000FC868()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "submitTaskRequestWithIdentifier: xpc_event_publisher_create_subscription failed", v2, v3, v4, v5, v6);
}

void sub_1000FC89C()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "submitTaskRequestWithIdentifier: Clearing registration via xpc_event_publisher_set_event failed", v2, v3, v4, v5, v6);
}

void sub_1000FC8D0()
{
  sub_10009E8A8();
  sub_10007D4D8((void *)&_mh_execute_header, v0, v1, "Failed to update BGSystemTask %{public}@ with error %{public}@");
}

void sub_1000FC940()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "updateTaskRequestWithIdentifier: xpc_event_publisher_set_event failed", v2, v3, v4, v5, v6);
}

void sub_1000FC974(void *a1)
{
  id v2 = a1;
  sub_10009E8C8();
  sub_10009E908();
  sub_10009E864();
  sub_10009E888((void *)&_mh_execute_header, v3, v4, "updateTaskRequest received in invalid state %ld from client (PID %d) for %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000FCA00()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "completeSystemTaskWithIdentifier: xpc_event_publisher_set_event failed", v2, v3, v4, v5, v6);
}

void sub_1000FCA34(void *a1)
{
  id v2 = a1;
  sub_10009E8C8();
  sub_10009E908();
  sub_10009E864();
  sub_10009E888((void *)&_mh_execute_header, v3, v4, "Completion received in invalid state %ld from client (PID %d) for %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000FCAC0(void *a1)
{
  id v2 = a1;
  sub_10009E8C8();
  sub_10009E908();
  sub_10009E864();
  sub_10009E888((void *)&_mh_execute_header, v3, v4, "Resume scheduling received in invalid state %ld from client (PID %d) for %{public}@", v5, v6, v7, v8, v9);
}

void sub_1000FCB4C()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "unregisterSystemTaskWithIdentifier: xpc_event_publisher_set_event failed", v2, v3, v4, v5, v6);
}

void sub_1000FCB80(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "SUTelemetryTask: In SmartPowerNap: %d", (uint8_t *)v2, 8u);
}

void sub_1000FCBFC()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "SUTelemetryTask: task expired without ever becoming eligible.", v2, v3, v4, v5, v6);
}

void sub_1000FCC30()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "SUTelemetryTask: executed task moved to not-yet-eligible again.", v2, v3, v4, v5, v6);
}

void sub_1000FCC64()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "SUTelemetryTask: expired task moved to not-yet-eligible again.", v2, v3, v4, v5, v6);
}

void sub_1000FCC98()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "SUTelemetryTask: task has expired.", v2, v3, v4, v5, v6);
}

void sub_1000FCCCC()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "SUTelemetryTask: task is now eligible.", v2, v3, v4, v5, v6);
}

void sub_1000FCD00()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "SUTelemetryTask: task is currently eligible.", v2, v3, v4, v5, v6);
}

void sub_1000FCD34()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "SUTelemetryTask: evaluating activity on tick.", v2, v3, v4, v5, v6);
}

void sub_1000FCD68()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "SUTelemetryTask: Evaluating policies.", v2, v3, v4, v5, v6);
}

void sub_1000FCD9C()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "SUTelemetryTask: Reporting task expirationNeverEligible to CoreAnalytics.", v2, v3, v4, v5, v6);
}

void sub_1000FCDD0(void *a1, void *a2)
{
  id v3 = a1;
  [a2 count];
  sub_100054638((void *)&_mh_execute_header, v4, v5, "SUTelemetryTask: Reporting %lu blockers to CoreAnalytics.", v6, v7, v8, v9, 0);
}

void sub_1000FCE5C()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "SUTelemetryTask: Reporting success to CoreAnalytics.", v2, v3, v4, v5, v6);
}

void sub_1000FCE90()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "SUTelemetryTask: Reporting eligibility to CoreAnalytics.", v2, v3, v4, v5, v6);
}

void sub_1000FCEC4()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "SUTelemetryTask: Reporting task expiration to CoreAnalytics.", v2, v3, v4, v5, v6);
}

void sub_1000FCEF8()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "SUTelemetryTask: Reporting BlockReasonsCardinality on expiration to CoreAnalytics.", v2, v3, v4, v5, v6);
}

void sub_1000FCF2C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 64);
  id v3 = a2;
  [v2 count];
  sub_100054638((void *)&_mh_execute_header, v4, v5, "SUTelemetryTask: Reporting %lu persistentBlockers to CoreAnalytics.", v6, v7, v8, v9, 0);
}

void sub_1000FCFB8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to establish connection to BoardServices; UI will be disabled until rectified",
    v1,
    2u);
}

void sub_1000FCFFC(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to establish server connection for %@; UI will be disabled until rectified",
    (uint8_t *)&v3,
    0xCu);
}

void sub_1000FD078(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Connection to BoardServices was invalidated!", v1, 2u);
}

void sub_1000FD0BC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Updating progress for %@ to %@", (uint8_t *)&v3, 0x16u);
}

uint64_t sub_1000FD144()
{
  uint64_t v0 = abort_report_np();
  return sub_1000FD16C(v0);
}

uint64_t sub_1000FD16C()
{
  uint64_t v0 = abort_report_np();
  return sub_1000FD194(v0);
}

void sub_1000FD194(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to update scores for error: %d", (uint8_t *)v2, 8u);
}

void sub_1000FD20C(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = [a2 error];
  sub_1000A595C((void *)&_mh_execute_header, v5, v6, "Unable to open sink with error: %@", v7, v8, v9, v10, 2u);
}

void sub_1000FD2A4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@ is missing the event body!", (uint8_t *)&v2, 0xCu);
}

void sub_1000FD31C(void *a1, void *a2)
{
  uint64_t v3 = a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  unsigned int v7 = [a1 type];
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Invalid type of result event for %@: %d", (uint8_t *)&v4, 0x12u);
}

void sub_1000FD3C4()
{
  sub_1000A5948(__stack_chk_guard);
  int v2 = 136315650;
  sub_1000A592C();
  sub_100074560((void *)&_mh_execute_header, v0, v1, "%s: Unable to register producing activity for %@ with error: %@", v2);
}

void sub_1000FD438()
{
  sub_1000A5948(__stack_chk_guard);
  int v2 = 136315650;
  sub_1000A592C();
  sub_100074560((void *)&_mh_execute_header, v0, v1, "%s: Unable to deregister producing activity for %@ with error: %@", v2);
}

void sub_1000FD4AC()
{
  int v2 = 136315650;
  sub_100074538();
  sub_100074560((void *)&_mh_execute_header, v0, v1, "%s: Unable to report %@ result consumption with error: %@", v2);
}

void sub_1000FD528()
{
  int v2 = 136315650;
  sub_100074538();
  sub_100074560((void *)&_mh_execute_header, v0, v1, "%s: Unable to report %@ result production with error: %@", v2);
}

void sub_1000FD5A4(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 8);
  int v3 = 136315394;
  int v4 = "-[_DASActivityResultDependencyGroup resetAccumulation]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Result dependencies have been reset for %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000FD638()
{
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v0, v1, "Exiting RBS handler with %@", v2);
}

void sub_1000FD6A4()
{
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v0, v1, "Entering RBS handler with %@", v2);
}

void sub_1000FD710()
{
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v0, v1, "%@ has frontboard visibility", v2);
}

void sub_1000FD77C()
{
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v0, v1, "Current dock policy: %@", v2);
}

void sub_1000FD7E8()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Policy update complete.", v2, v3, v4, v5, v6);
}

void sub_1000FD81C()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Performing a policy update.", v2, v3, v4, v5, v6);
}

void sub_1000FD850()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Solver input is too large, not computing a policy update.", v2, v3, v4, v5, v6);
}

void sub_1000FD884()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Solver error.", v2, v3, v4, v5, v6);
}

void sub_1000FD8B8()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Solver no feasible solution.", v2, v3, v4, v5, v6);
}

void sub_1000FD8EC(void *a1, uint64_t a2, unsigned int *a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = +[NSNumber numberWithUnsignedInt:a2];
  unsigned int v7 = +[NSNumber numberWithUnsignedInt:*a3];
  uint64_t v8 = +[NSNumber numberWithInt:*a3 - a2];
  int v9 = 138412802;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  int v12 = v7;
  __int16 v13 = 2112;
  uint64_t v14 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Policy footprint: %@, Capacity constraint: %@, Unused capacity: %@", (uint8_t *)&v9, 0x20u);
}

void sub_1000FD9FC()
{
  sub_100020A4C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error: Failed to allocate QVector for quantization.", v1, 2u);
}

void sub_1000FDA3C()
{
  sub_100020A4C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Error: Failed to allocate vector for quantization.", v1, 2u);
}

void sub_1000FDA7C(void *a1, uint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = +[NSNumber numberWithUnsignedInteger:a2];
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v3, v5, "Number of active dock assertions: %@", v6);
}

void sub_1000FDB30()
{
  sub_10005A318();
  sub_100054600((void *)&_mh_execute_header, v0, v1, "Acquired assertion %@ for process %@.");
}

void sub_1000FDB98()
{
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v0, v1, "Process %@ died. Invalidating its assertion...", v2);
}

void sub_1000FDC04()
{
  sub_10005A318();
  sub_100054600((void *)&_mh_execute_header, v0, v1, "Invalidating assertion %@ for process %@.");
}

void sub_1000FDC6C()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Created RBSProcessMonitor monitoring all applications.", v2, v3, v4, v5, v6);
}

void sub_1000FDCA0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = a1;
  uint8_t v6 = +[NSNumber numberWithInt:a2];
  int v7 = 138412546;
  uint64_t v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Could not get handle for process with pid %@. %@", (uint8_t *)&v7, 0x16u);
}

void sub_1000FDD6C(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [[(id)sub_1000A9454() numberWithInt:];
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v1, v4, "Could not get processIdentifier for process with pid %@.", v5);
}

void sub_1000FDE14()
{
  sub_100020A4C();
  sub_100032F58((void *)&_mh_execute_header, v0, v1, "Warning: Failed to get ledger template info.", v2, v3, v4, v5, v6);
}

void sub_1000FDE48(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [sub_1000A9454() numberWithInt:x0];
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v1, v4, "Warning: Could not get ledger info for pid %@.", v5);
}

void sub_1000FDEF0(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [[(id)sub_1000A9454() numberWithInt:];
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v1, v4, "Warning: Could not get ledger entry info for pid %@.", v5);
}

void sub_1000FDF98(void *a1, int a2)
{
  uint64_t v3 = a1;
  int v4 = *__error();
  uint64_t v5 = __error();
  uint8_t v6 = strerror(*v5);
  v7[0] = 67109634;
  v7[1] = a2;
  __int16 v8 = 1024;
  int v9 = v4;
  __int16 v10 = 2080;
  __int16 v11 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Error: sysctlbyname(\"hw.memsize\") failed (rc: %d, errno: %d, %s)", (uint8_t *)v7, 0x18u);
}

void sub_1000FE060(void *a1)
{
  uint64_t v1 = a1;
  LODWORD(v2) = 10.0;
  uint64_t v3 = +[NSNumber numberWithFloat:v2];
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v1, v4, "Using default capacity percentage: %@ percent", v5);
}

void sub_1000FE104(void *a1, float a2)
{
  uint64_t v3 = a1;
  *(float *)&double v4 = a2;
  uint64_t v5 = +[NSNumber numberWithFloat:v4];
  sub_100014884();
  sub_100060960((void *)&_mh_execute_header, v3, v6, "Overriding capacity with percentage provided via defaults: %@ percent", v7);
}

void sub_1000FE1B4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Next Timeline Value: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000FE22C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Current Timeline Value: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000FE2A4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "prewarm_app feature flag disabled", v1, 2u);
}

void sub_1000FE2E8(void *a1, void *a2)
{
  uint64_t v3 = a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  unsigned int v7 = [a1 type];
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Invalid type of completion event for %@: %d", (uint8_t *)&v4, 0x12u);
}

void sub_1000FE390(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 16);
  int v3 = 136315394;
  int v4 = "-[_DASActivityCompletionDependencyGroup resetAccumulation]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Resetting completion dependencies for %@", (uint8_t *)&v3, 0x16u);
}

void sub_1000FE424(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100028944((void *)&_mh_execute_header, v3, v4, "Failed to obtain size for snapshot: %s", v5, v6, v7, v8, 2u);
}

void sub_1000FE4B0(void *a1)
{
  id v1 = a1;
  uint64_t v2 = __error();
  strerror(*v2);
  sub_100028944((void *)&_mh_execute_header, v3, v4, "Failed to obtain snapshot: %s", v5, v6, v7, v8, 2u);
}

void sub_1000FE53C()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Deleting activities: %@", v2, v3, v4, v5, v6);
}

void sub_1000FE5A4()
{
  sub_10006B908();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "STARTING %@", v2, v3, v4, v5, v6);
}

void sub_1000FE610()
{
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v0, v1, "No launch reasons, calling completion and returning for %@", v2);
}

void sub_1000FE67C(void **a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *a1;
  uint64_t v5 = a2;
  uint8_t v6 = [v4 assertion];
  int v8 = 138412546;
  int v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = a3;
  sub_1000D113C((void *)&_mh_execute_header, v5, v7, "Error invalidating assertion %@: %@", (uint8_t *)&v8);
}

void sub_1000FE734()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "No assertions acquired, calling completion immediately", v2, v3, v4, v5, v6);
}

void sub_1000FE768()
{
  sub_10006B908();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Interested activities %@", v2, v3, v4, v5, v6);
}

void sub_1000FE7D4()
{
  sub_10006B908();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Running completion for app: %@ for activities: %@", v2, 0x16u);
}

void sub_1000FE858(uint8_t *buf, uint64_t a2, void *a3, os_log_t log)
{
  uint64_t v4 = *(void *)(*(void *)a2 + 64);
  *(_DWORD *)buf = 138543362;
  *a3 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%{public}@", buf, 0xCu);
}

void sub_1000FE8AC(void *a1, NSObject *a2)
{
  __int16 v3 = [a1 extensionName];
  sub_100014884();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Sending suspend signal to extension %{public}@", v4, 0xCu);
}

void sub_1000FE940(uint64_t a1, NSObject *a2)
{
  __int16 v3 = [*(id *)(a1 + 40) extensionName];
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, a2, v4, "Extension %{public}@ did not suspend in time. Forcefully unloading.", v5);
}

void sub_1000FE9D0(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  uint64_t v7 = [a2 assertion];
  signed int v8 = [v7 pid];
  *(_DWORD *)a1 = 134217984;
  *a3 = v8;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Failed to drop assertion for app with pid: %ld", a1, 0xCu);
}

void sub_1000FEA50()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "Failed to generate stackshot", v2, v3, v4, v5, v6);
}

void sub_1000FEA84()
{
  sub_10006B928(__stack_chk_guard);
  sub_10006B908();
  sub_10006B8F0((void *)&_mh_execute_header, v0, v1, "BUG IN CLIENT: %{public}@ was asked to run but never started. Please file a radar.", v2);
}

void sub_1000FEAF0()
{
  sub_10006B928(__stack_chk_guard);
  sub_10006B908();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

void sub_1000FEB58(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 name];
  uint64_t v5 = [a1 debugDescription];
  int v7 = 138412546;
  signed int v8 = v4;
  sub_1000D1154();
  sub_1000D113C((void *)&_mh_execute_header, a2, v6, "ERROR Submitting Activity: %@ due to configuration limits. Please contact das-core@group.apple.com to prevent this activity from getting rejected. Configuration: %@", (uint8_t *)&v7);
}

void sub_1000FEC0C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 debugDescription];
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, a2, v4, "WARNING Submitting Activity: %@ due to configuration limits", v5);
}

void sub_1000FEC98()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "WARNING: Test mode is ON so activity %{public}@ is not limited by configuration limits", v2, v3, v4, v5, v6);
}

void sub_1000FED00()
{
  sub_10005A318();
  sub_1000D113C((void *)&_mh_execute_header, v0, (uint64_t)v0, "Error invalidating assertion for activity %@: %@", v1);
}

void sub_1000FED70()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Invalidating assertions for %@", v2, v3, v4, v5, v6);
}

void sub_1000FEDD8(id *a1, NSObject *a2)
{
  uint64_t v4 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  uint64_t v5 = [*a1 debugDescription];
  int v7 = 138412546;
  signed int v8 = v4;
  sub_1000D1154();
  sub_1000D113C((void *)&_mh_execute_header, a2, v6, "Bad duration %@ for activity %@", (uint8_t *)&v7);
}

void sub_1000FEE94(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 identifier];
  uint64_t v4 = +[NSNumber numberWithDouble:0.0];
  int v5 = 138412546;
  uint64_t v6 = v3;
  sub_1000D1154();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "No endtime for activity %@, using now as end date. Duration is %@", (uint8_t *)&v5, 0x16u);
}

void sub_1000FEF58()
{
  sub_10005A318();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Recording %@ transition to %@ state to dastestd task execution registry", v1, 0x16u);
}

void sub_1000FEFD0()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Scheduling timer for %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000FF038(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_10006B8F0((void *)&_mh_execute_header, a3, (uint64_t)a3, "Identical launch request already scheduled for %@", (uint8_t *)a2);
}

void sub_1000FF090(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  sub_10006B8F0((void *)&_mh_execute_header, a3, (uint64_t)a3, "Not Supported: High-priority silent push. (App=%{public}@)", (uint8_t *)a2);
}

void sub_1000FF0E8(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Scheduling connection timeout for pid %d...", (uint8_t *)v2, 8u);
}

void sub_1000FF160(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to connect to app with pid %d after 10 seconds, dropping all assertions", (uint8_t *)v3, 8u);
}

void sub_1000FF1DC(uint64_t a1, NSObject *a2)
{
  int v2 = *(_DWORD *)(a1 + 40);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Checking whether the app with pid %d has connected...", (uint8_t *)v3, 8u);
}

void sub_1000FF258()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Manually clamping progress totalUnitCount to completionCount to spoof completion on Activity UI associated with %@", v2, v3, v4, v5, v6);
}

void sub_1000FF2C0()
{
  sub_100014884();
  sub_100015D3C((void *)&_mh_execute_header, v0, v1, "Manually cancelling Activity UI associated with %@", v2, v3, v4, v5, v6);
}

void sub_1000FF328()
{
  sub_10006B928(__stack_chk_guard);
  sub_10006B908();
  sub_10006B8F0((void *)&_mh_execute_header, v0, v1, "Unable to write newline to %@", v2);
}

void sub_1000FF394()
{
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v0, v1, "Unable to write data to file: %@", v2);
}

void sub_1000FF400()
{
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v0, v1, "Unable to serialize chunked dictionary to JSON: %@", v2);
}

void sub_1000FF46C(void *a1, NSObject *a2)
{
  id v3 = [a1 description];
  [v3 UTF8String];
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, a2, v4, "Unable to remove temporary file: %s", v5);
}

void sub_1000FF500(void *a1, NSObject *a2)
{
  id v3 = [a1 name];
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, a2, v4, "Error occurred sending symptoms %@", v5);
}

void sub_1000FF58C()
{
  sub_100014884();
  __int16 v3 = 2080;
  uint64_t v4 = v0;
  sub_1000D113C((void *)&_mh_execute_header, v1, (uint64_t)v1, "%@ (%s)", v2);
}

void sub_1000FF608()
{
  sub_100020A4C();
  sub_100020A30((void *)&_mh_execute_header, v0, v1, "_prewarmSuspendIncomingHandler reply skipped", v2, v3, v4, v5, v6);
}

void sub_1000FF63C(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  sub_100014884();
  sub_100028944((void *)&_mh_execute_header, v2, v3, "Illegal call to %@, invalidating", v4, v5, v6, v7, v8);
}

void sub_1000FF6C0(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  sub_100014884();
  sub_100028944((void *)&_mh_execute_header, v2, v3, "Illegal call to %@, invalidating", v4, v5, v6, v7, v8);
}

void sub_1000FF748(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  sub_100014884();
  sub_100028944((void *)&_mh_execute_header, v2, v3, "Illegal call to %@, invalidating", v4, v5, v6, v7, v8);
}

void sub_1000FF7D0(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  sub_100014884();
  sub_100028944((void *)&_mh_execute_header, v2, v3, "Illegal call to %@, invalidating", v4, v5, v6, v7, v8);
}

void sub_1000FF858(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  sub_100014884();
  sub_100028944((void *)&_mh_execute_header, v2, v3, "Illegal call to %@, invalidating", v4, v5, v6, v7, v8);
}

void sub_1000FF8E0(const char *a1)
{
  uint64_t v1 = NSStringFromSelector(a1);
  sub_100014884();
  sub_100028944((void *)&_mh_execute_header, v2, v3, "Illegal call to %@, invalidating", v4, v5, v6, v7, v8);
}

void sub_1000FF968()
{
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v0, v1, "can't extract application ID from '%@'", v2);
}

void sub_1000FF9D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000FFA0C()
{
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v0, v1, "team prefix must only contain characters in [0-9,A-Z] (%@)", v2);
}

void sub_1000FFA78()
{
  sub_100094878();
  [*v0 processIdentifier];
  sub_1000D81AC((void *)&_mh_execute_header, v1, v2, "Unable to grab RBS Process Handle for pid %d with error: %@", v3, v4, v5, v6, 2u);
}

void sub_1000FFB04()
{
  sub_100094878();
  uint64_t v2 = [v1 name];
  [*v0 processIdentifier];
  sub_1000D81CC();
  sub_1000D81AC((void *)&_mh_execute_header, v3, v4, "%{public}@: Process %d not entitled", v5, v6, v7, v8, v9);
}

void sub_1000FFB98()
{
  sub_10005A318();
  sub_100054600((void *)&_mh_execute_header, v0, v1, "Submitting task %@: %@");
}

void sub_1000FFC00()
{
  sub_10005A318();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Could not validate request %@ due to error %@", v1, 0x16u);
}

void sub_1000FFC78(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 clientProvidedIdentifier];
  int v6 = 138543874;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  CFStringRef v9 = @"com.apple.";
  __int16 v10 = 2114;
  uint64_t v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@ using %{public}@ prefix for task %{public}@ that is only reserved for Apple apps", (uint8_t *)&v6, 0x20u);
}

void sub_1000FFD3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000FFD74()
{
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v0, v1, "Foregrounded apps doesn't include expected identifier: %@", v2);
}

void sub_1000FFDE0()
{
  sub_10005A318();
  sub_100054600((void *)&_mh_execute_header, v0, v1, "Ensuring main application %@ is foregrounded (submitting bundle: %@)");
}

void sub_1000FFE48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000FFE80()
{
  sub_100014884();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "application-identifier is: %@", v1, 0xCu);
}

void sub_1000FFEF4()
{
  sub_100094878();
  uint64_t v2 = [v1 name];
  [*(id *)(v0 + 16) processIdentifier];
  sub_1000D81CC();
  sub_1000D81AC((void *)&_mh_execute_header, v3, v4, "%{public}@: Process %d not entitled for Icon Bundle Identifiers", v5, v6, v7, v8, v9);
}

void sub_1000FFF88()
{
  sub_100094878();
  uint64_t v2 = [v1 name];
  [*(id *)(v0 + 16) processIdentifier];
  sub_1000D81CC();
  sub_1000D81AC((void *)&_mh_execute_header, v3, v4, "%{public}@: Process %d not entitled for Continued Processing", v5, v6, v7, v8, v9);
}

void sub_10010001C()
{
  sub_100014884();
  sub_10006B8F0((void *)&_mh_execute_header, v0, v1, "Activity with identifier %@ not found", v2);
}

void sub_100100088(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "getInfoForKey: %@ %@", (uint8_t *)&v3, 0x16u);
}

void sub_100100110(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Active app: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100100188(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138543618;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error determining whether %{public}@ supports EN: %@", (uint8_t *)&v4, 0x16u);
}

void sub_100100214(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No submission date; using recent past.",
    buf,
    2u);
}

void sub_100100254(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  CFStringRef v3 = @"com.apple.appResume.signpostReader";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Failed to expire task:%@ with error:%@", (uint8_t *)&v2, 0x16u);
}

void sub_1001002E0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Registered for disk space monitoring: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100100358(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Unregistered for disk space monitoring: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1001003D0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Uninitialised purgeableSpaceMap!", v1, 2u);
}

void sub_100100414(void *a1, void *a2)
{
  uint64_t v3 = a1;
  __int16 v4 = [a2 objectForKeyedSubscript:@"CACHE_DELETE_ERROR"];
  int v5 = 138412290;
  __int16 v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to get purgable space: %@", (uint8_t *)&v5, 0xCu);
}

void sub_1001004C4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to register for CacheDelete purgeable space update notification", v1, 2u);
}

void sub_100100508(int a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "CACHE_DELETE_PURGEABLE_UPDATED";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Received %s notification, token: %d", (uint8_t *)&v2, 0x12u);
}

void sub_100100594(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "MC timer fired but can't evaluate all activities, no daemon!", v1, 2u);
}

void sub_1001005D8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Trying to cancel timer", v1, 2u);
}

void sub_10010061C(void *a1, void *a2)
{
  uint64_t v3 = a1;
  __int16 v4 = [a2 description];
  sub_100014884();
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Unable to setup network evaluation for %@", v5, 0xCu);
}

void sub_1001006C0(id *a1, NSObject *a2)
{
  uint64_t v3 = [*a1 description];
  sub_100014884();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Network evaluation callback is not currently registered for %@!", v4, 0xCu);
}

void sub_10010075C()
{
  sub_100014884();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Found an equivalent network evaluation group; coalescing activity ID %@",
    v1,
    0xCu);
}

void sub_1001007D0()
{
  sub_100014884();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Unable to find network evaluation group for activity ID '%@'", v1, 0xCu);
}

void sub_100100844(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Finding the last DASTaskCheckpoint event for %@", (uint8_t *)&v2, 0xCu);
}

void sub_1001008BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Searching for _DASActivity objects with names: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100100934(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Flushing PPS caches", v1, 2u);
}

void sub_100100978(void *a1, void *a2)
{
  uint64_t v3 = a1;
  __int16 v4 = [a2 name];
  int v5 = 138412290;
  __int16 v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Computing conditions penalty for activity name: %@", (uint8_t *)&v5, 0xCu);
}

void sub_100100A20(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%@ encountered an error while running, adding to errored activities", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_100100A98()
{
  uint64_t v0 = abort_report_np();
  return sub_100100AC0(v0);
}

void sub_100100AC0(NSObject *a1)
{
  int v2 = __error();
  uint64_t v3 = strerror(*v2);
  int v4 = 136315138;
  int v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Failed to obtain process name: %s", (uint8_t *)&v4, 0xCu);
}

void sub_100100B54()
{
  sub_10005A318();
  sub_10007D4D8((void *)&_mh_execute_header, v0, v1, "Found >1 extensions for identifier %@ extension point %@, using first");
}

void sub_100100BBC()
{
  sub_10005A318();
  sub_10007D4D8((void *)&_mh_execute_header, v0, v1, "Unable to get application record for %@ with error %@");
}

void sub_100100C24()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Ignoring disabled extension for '%@'", v2, v3, v4, v5, v6);
}

void sub_100100C8C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Plugin interrupted. Nilling out session ID.", v1, 2u);
}

void sub_100100CD0()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Plugin request cancelled with error: %@", v2, v3, v4, v5, v6);
}

void sub_100100D38()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Failed to begin extension request: %@", v2, v3, v4, v5, v6);
}

void sub_100100DA0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 sessionID];
  sub_100014884();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get context for session with ID %@", v4, 0xCu);
}

void sub_100100E34()
{
  sub_100014884();
  sub_100014830((void *)&_mh_execute_header, v0, v1, "Failed to get remote context: %@", v2, v3, v4, v5, v6);
}

void sub_100100E9C(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 currentActivity];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_FAULT, "Request for plugin to start activity while already running. Current: %@. New: %@", (uint8_t *)&v6, 0x16u);
}

void sub_100100F4C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error getting remote context %@", (uint8_t *)&v2, 0xCu);
}

void sub_100100FC4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed at recording trigger %@ to PowerLog", (uint8_t *)&v2, 0xCu);
}

void sub_10010103C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Logging %@", (uint8_t *)&v2, 0xCu);
}

void sub_1001010B4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  CFStringRef v3 = @"DASActivityLifecycle";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@: %@", (uint8_t *)&v2, 0x16u);
}

void sub_100101140(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100101178(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1001011B0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "DASContext: Biome couldn't fetch remote devices with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100101228(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100101260(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error loading dayToDurationsList data: %@", (uint8_t *)&v2, 0xCu);
}

void sub_1001012D8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error archiving day to durations data: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BMContextSyncDeviceActivityLevelActivityStateAsString()
{
  return _BMContextSyncDeviceActivityLevelActivityStateAsString();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

uint64_t CacheDeleteCopyPurgeableSpaceWithInfo()
{
  return _CacheDeleteCopyPurgeableSpaceWithInfo();
}

uint64_t DMIsMigrationNeeded()
{
  return _DMIsMigrationNeeded();
}

uint64_t DRSubmitLog()
{
  return _DRSubmitLog();
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

uint64_t IOPMAllowsBackgroundTask()
{
  return _IOPMAllowsBackgroundTask();
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

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return _IOServiceAddInterestNotification(notifyPort, service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return _MKBDeviceFormattedForContentProtection();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return _MKBDeviceUnlockedSinceBoot();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t OSAGetDATaskingValue()
{
  return _OSAGetDATaskingValue();
}

uint64_t OSAWriteLogForSubmission()
{
  return _OSAWriteLogForSubmission();
}

uint64_t PLLogRegisteredEvent()
{
  return _PLLogRegisteredEvent();
}

uint64_t PLQueryRegistered()
{
  return _PLQueryRegistered();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return _PPSCreateTelemetryIdentifier();
}

uint64_t PPSSendTelemetry()
{
  return _PPSSendTelemetry();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return _SBSCopyDisplayIdentifiers();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkInterfaceEntity(allocator, domain, ifname, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return _SCDynamicStoreSetDispatchQueue(store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t SimulateCrash()
{
  return _SimulateCrash();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CDDComplicationChangeNotificationString()
{
  return __CDDComplicationChangeNotificationString();
}

uint64_t _CDDComplicationChangeOverCloudNotificationString()
{
  return __CDDComplicationChangeOverCloudNotificationString();
}

uint64_t _CDDCurrentActiveComplications()
{
  return __CDDCurrentActiveComplications();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

uint64_t _NETRBClientCreate()
{
  return __NETRBClientCreate();
}

uint64_t _NETRBClientDestroy()
{
  return __NETRBClientDestroy();
}

uint64_t _NETRBClientGetDynamicStoreKey()
{
  return __NETRBClientGetDynamicStoreKey();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t __strcpy_chk()
{
  return ___strcpy_chk();
}

uint64_t __strncpy_chk()
{
  return ___strncpy_chk();
}

uint64_t _os_assert_log()
{
  return __os_assert_log();
}

uint64_t _os_crash()
{
  return __os_crash();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_activate(dispatch_object_t object)
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

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
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

void dispatch_resume(dispatch_object_t object)
{
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

uint64_t dispatch_set_qos_class_fallback()
{
  return _dispatch_set_qos_class_fallback();
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

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return _dispatch_source_testcancel(source);
}

void dispatch_suspend(dispatch_object_t object)
{
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

char *dlerror(void)
{
  return _dlerror();
}

BOOL dlopen_preflight(const char *__path)
{
  return _dlopen_preflight(__path);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  return _exp(__x);
}

void free(void *a1)
{
}

int ftruncate(int a1, off_t a2)
{
  return _ftruncate(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

uint64_t ledger()
{
  return _ledger();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

uint64_t memorystatus_control()
{
  return _memorystatus_control();
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
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

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

uint64_t nw_browse_descriptor_add_device_filter()
{
  return _nw_browse_descriptor_add_device_filter();
}

nw_browse_descriptor_t nw_browse_descriptor_create_application_service(const char *application_service_name)
{
  return _nw_browse_descriptor_create_application_service(application_service_name);
}

uint64_t nw_browse_descriptor_set_browse_scope()
{
  return _nw_browse_descriptor_set_browse_scope();
}

nw_endpoint_t nw_browse_result_copy_endpoint(nw_browse_result_t result)
{
  return _nw_browse_result_copy_endpoint(result);
}

nw_browse_result_change_t nw_browse_result_get_changes(nw_browse_result_t old_result, nw_browse_result_t new_result)
{
  return _nw_browse_result_get_changes(old_result, new_result);
}

void nw_browser_cancel(nw_browser_t browser)
{
}

nw_browser_t nw_browser_create(nw_browse_descriptor_t descriptor, nw_parameters_t parameters)
{
  return _nw_browser_create(descriptor, parameters);
}

void nw_browser_set_browse_results_changed_handler(nw_browser_t browser, nw_browser_browse_results_changed_handler_t handler)
{
}

void nw_browser_set_queue(nw_browser_t browser, dispatch_queue_t queue)
{
}

void nw_browser_set_state_changed_handler(nw_browser_t browser, nw_browser_state_changed_handler_t state_changed_handler)
{
}

void nw_browser_start(nw_browser_t browser)
{
}

uint64_t nw_endpoint_create_from_dictionary()
{
  return _nw_endpoint_create_from_dictionary();
}

uint64_t nw_endpoint_get_device_id()
{
  return _nw_endpoint_get_device_id();
}

uint64_t nw_parameters_are_equivalent_for_path_evaluation()
{
  return _nw_parameters_are_equivalent_for_path_evaluation();
}

nw_parameters_t nw_parameters_create_application_service(void)
{
  return _nw_parameters_create_application_service();
}

uint64_t nw_parameters_create_from_dictionary()
{
  return _nw_parameters_create_from_dictionary();
}

uint64_t nw_parameters_set_include_ble()
{
  return _nw_parameters_set_include_ble();
}

uint64_t nw_parameters_set_include_screen_off_devices()
{
  return _nw_parameters_set_include_screen_off_devices();
}

uint64_t nw_parameters_set_preferred_interface_subtypes()
{
  return _nw_parameters_set_preferred_interface_subtypes();
}

uint64_t nw_parameters_set_required_netagent_classes()
{
  return _nw_parameters_set_required_netagent_classes();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return _nw_path_create_evaluator_for_endpoint();
}

uint64_t nw_path_evaluator_cancel()
{
  return _nw_path_evaluator_cancel();
}

uint64_t nw_path_evaluator_copy_path()
{
  return _nw_path_evaluator_copy_path();
}

uint64_t nw_path_evaluator_set_update_handler()
{
  return _nw_path_evaluator_set_update_handler();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return _nw_path_get_status(path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return _nw_path_is_constrained(path);
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
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

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
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

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return _os_unfair_recursive_lock_lock_with_options();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return _os_unfair_recursive_lock_unlock();
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t pc_session_begin()
{
  return _pc_session_begin();
}

uint64_t pc_session_create()
{
  return _pc_session_create();
}

uint64_t pc_session_destroy()
{
  return _pc_session_destroy();
}

uint64_t pc_session_end()
{
  return _pc_session_end();
}

uint64_t pc_session_get_value()
{
  return _pc_session_get_value();
}

uint64_t pc_session_process()
{
  return _pc_session_process();
}

uint64_t pc_session_set_procpid()
{
  return _pc_session_set_procpid();
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return _proc_pid_rusage(pid, flavor, buffer);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return _proc_pidinfo(pid, flavor, arg, buffer, buffersize);
}

int puts(const char *a1)
{
  return _puts(a1);
}

uint64_t sfi_set_class_offtime()
{
  return _sfi_set_class_offtime();
}

int shm_open(const char *a1, int a2, ...)
{
  return _shm_open(a1, a2);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

uint64_t symptom_create()
{
  return _symptom_create();
}

uint64_t symptom_send()
{
  return _symptom_send();
}

uint64_t symptom_set_additional_qualifier()
{
  return _symptom_set_additional_qualifier();
}

uint64_t symptom_set_qualifier()
{
  return _symptom_set_qualifier();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

uint64_t sysctlbyname_get_data_np()
{
  return _sysctlbyname_get_data_np();
}

uint64_t system_set_sfi_window()
{
  return _system_set_sfi_window();
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return _xpc_array_apply(xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return _xpc_array_create(objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

uint64_t xpc_connection_is_extension()
{
  return _xpc_connection_is_extension();
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

uint64_t xpc_dictionary_copy_basic_description()
{
  return _xpc_dictionary_copy_basic_description();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_array(xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return _xpc_dictionary_get_audit_token();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_BOOL(xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_dictionary(xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_int64(xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
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

uint64_t xpc_event_publisher_activate()
{
  return _xpc_event_publisher_activate();
}

uint64_t xpc_event_publisher_create()
{
  return _xpc_event_publisher_create();
}

uint64_t xpc_event_publisher_create_subscription()
{
  return _xpc_event_publisher_create_subscription();
}

uint64_t xpc_event_publisher_fire()
{
  return _xpc_event_publisher_fire();
}

uint64_t xpc_event_publisher_set_event()
{
  return _xpc_event_publisher_set_event();
}

uint64_t xpc_event_publisher_set_handler()
{
  return _xpc_event_publisher_set_handler();
}

uint64_t xpc_get_event_name()
{
  return _xpc_get_event_name();
}

uint64_t xpc_get_service_identifier_for_token()
{
  return _xpc_get_service_identifier_for_token();
}

uint64_t xpc_get_service_uid_for_token()
{
  return _xpc_get_service_uid_for_token();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

id objc_msgSend_Activity(void *a1, const char *a2, ...)
{
  return [a1 Activity];
}

id objc_msgSend_ActivityScheduler(void *a1, const char *a2, ...)
{
  return [a1 ActivityScheduler];
}

id objc_msgSend_App(void *a1, const char *a2, ...)
{
  return [a1 App];
}

id objc_msgSend_Completion(void *a1, const char *a2, ...)
{
  return [a1 Completion];
}

id objc_msgSend_ContextSync(void *a1, const char *a2, ...)
{
  return [a1 ContextSync];
}

id objc_msgSend_DSLPublisher(void *a1, const char *a2, ...)
{
  return [a1 DSLPublisher];
}

id objc_msgSend_Dependency(void *a1, const char *a2, ...)
{
  return [a1 Dependency];
}

id objc_msgSend_DeviceActivityLevel(void *a1, const char *a2, ...)
{
  return [a1 DeviceActivityLevel];
}

id objc_msgSend_InFocus(void *a1, const char *a2, ...)
{
  return [a1 InFocus];
}

id objc_msgSend_Level(void *a1, const char *a2, ...)
{
  return [a1 Level];
}

id objc_msgSend_Result(void *a1, const char *a2, ...)
{
  return [a1 Result];
}

id objc_msgSend_UIBackgroundModes(void *a1, const char *a2, ...)
{
  return [a1 UIBackgroundModes];
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

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return [a1 _auxiliaryConnection];
}

id objc_msgSend__callWarningHandler(void *a1, const char *a2, ...)
{
  return [a1 _callWarningHandler];
}

id objc_msgSend__contextForSession(void *a1, const char *a2, ...)
{
  return [a1 _contextForSession];
}

id objc_msgSend__plugIn(void *a1, const char *a2, ...)
{
  return [a1 _plugIn];
}

id objc_msgSend__setupExtension(void *a1, const char *a2, ...)
{
  return [a1 _setupExtension];
}

id objc_msgSend__setupSessionIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _setupSessionIfNecessary];
}

id objc_msgSend__updateCache(void *a1, const char *a2, ...)
{
  return [a1 _updateCache];
}

id objc_msgSend__xpcConnection(void *a1, const char *a2, ...)
{
  return [a1 _xpcConnection];
}

id objc_msgSend_aboutMe(void *a1, const char *a2, ...)
{
  return [a1 aboutMe];
}

id objc_msgSend_absoluteTimestamp(void *a1, const char *a2, ...)
{
  return [a1 absoluteTimestamp];
}

id objc_msgSend_accuracyRate(void *a1, const char *a2, ...)
{
  return [a1 accuracyRate];
}

id objc_msgSend_acquireAssertions(void *a1, const char *a2, ...)
{
  return [a1 acquireAssertions];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activateConnection(void *a1, const char *a2, ...)
{
  return [a1 activateConnection];
}

id objc_msgSend_activationTime(void *a1, const char *a2, ...)
{
  return [a1 activationTime];
}

id objc_msgSend_activeENApplication(void *a1, const char *a2, ...)
{
  return [a1 activeENApplication];
}

id objc_msgSend_activities(void *a1, const char *a2, ...)
{
  return [a1 activities];
}

id objc_msgSend_activitiesWaitingForBGTaskClients(void *a1, const char *a2, ...)
{
  return [a1 activitiesWaitingForBGTaskClients];
}

id objc_msgSend_activityDurations(void *a1, const char *a2, ...)
{
  return [a1 activityDurations];
}

id objc_msgSend_activityIDs(void *a1, const char *a2, ...)
{
  return [a1 activityIDs];
}

id objc_msgSend_activityIdentifier(void *a1, const char *a2, ...)
{
  return [a1 activityIdentifier];
}

id objc_msgSend_activityQueue(void *a1, const char *a2, ...)
{
  return [a1 activityQueue];
}

id objc_msgSend_activityToDataMap(void *a1, const char *a2, ...)
{
  return [a1 activityToDataMap];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_admissibleApplications(void *a1, const char *a2, ...)
{
  return [a1 admissibleApplications];
}

id objc_msgSend_advanceBaseTime(void *a1, const char *a2, ...)
{
  return [a1 advanceBaseTime];
}

id objc_msgSend_alarmID(void *a1, const char *a2, ...)
{
  return [a1 alarmID];
}

id objc_msgSend_algorithms(void *a1, const char *a2, ...)
{
  return [a1 algorithms];
}

id objc_msgSend_allAppKillsInfo(void *a1, const char *a2, ...)
{
  return [a1 allAppKillsInfo];
}

id objc_msgSend_allBudgets(void *a1, const char *a2, ...)
{
  return [a1 allBudgets];
}

id objc_msgSend_allFastPassIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 allFastPassIdentifiers];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allPendingBackgroundTasks(void *a1, const char *a2, ...)
{
  return [a1 allPendingBackgroundTasks];
}

id objc_msgSend_allPendingPushLaunchTasks(void *a1, const char *a2, ...)
{
  return [a1 allPendingPushLaunchTasks];
}

id objc_msgSend_allPendingRestartTasks(void *a1, const char *a2, ...)
{
  return [a1 allPendingRestartTasks];
}

id objc_msgSend_allPendingSyncOnBackupTasks(void *a1, const char *a2, ...)
{
  return [a1 allPendingSyncOnBackupTasks];
}

id objc_msgSend_allPendingTasks(void *a1, const char *a2, ...)
{
  return [a1 allPendingTasks];
}

id objc_msgSend_allPoliciesForPlatform(void *a1, const char *a2, ...)
{
  return [a1 allPoliciesForPlatform];
}

id objc_msgSend_allSuggestionsInLayout(void *a1, const char *a2, ...)
{
  return [a1 allSuggestionsInLayout];
}

id objc_msgSend_allTasks(void *a1, const char *a2, ...)
{
  return [a1 allTasks];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_allocationType(void *a1, const char *a2, ...)
{
  return [a1 allocationType];
}

id objc_msgSend_allowsUnrestrictedBackgroundLaunches(void *a1, const char *a2, ...)
{
  return [a1 allowsUnrestrictedBackgroundLaunches];
}

id objc_msgSend_analyticsStatus(void *a1, const char *a2, ...)
{
  return [a1 analyticsStatus];
}

id objc_msgSend_analyzerName(void *a1, const char *a2, ...)
{
  return [a1 analyzerName];
}

id objc_msgSend_aneIntensive(void *a1, const char *a2, ...)
{
  return [a1 aneIntensive];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_anyAssertion(void *a1, const char *a2, ...)
{
  return [a1 anyAssertion];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_anyRemoteDeviceActive(void *a1, const char *a2, ...)
{
  return [a1 anyRemoteDeviceActive];
}

id objc_msgSend_appInFocusStream(void *a1, const char *a2, ...)
{
  return [a1 appInFocusStream];
}

id objc_msgSend_appInstallStream(void *a1, const char *a2, ...)
{
  return [a1 appInstallStream];
}

id objc_msgSend_appLaunch(void *a1, const char *a2, ...)
{
  return [a1 appLaunch];
}

id objc_msgSend_appPredictionTimeline(void *a1, const char *a2, ...)
{
  return [a1 appPredictionTimeline];
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return [a1 appState];
}

id objc_msgSend_appUsageBundleID(void *a1, const char *a2, ...)
{
  return [a1 appUsageBundleID];
}

id objc_msgSend_appUsageStream(void *a1, const char *a2, ...)
{
  return [a1 appUsageStream];
}

id objc_msgSend_applicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 applicationBundleIdentifier];
}

id objc_msgSend_applicationExtensionRecords(void *a1, const char *a2, ...)
{
  return [a1 applicationExtensionRecords];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_applicationType(void *a1, const char *a2, ...)
{
  return [a1 applicationType];
}

id objc_msgSend_appsFromProactiveSuggestions(void *a1, const char *a2, ...)
{
  return [a1 appsFromProactiveSuggestions];
}

id objc_msgSend_appsLaunchedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 appsLaunchedSinceBoot];
}

id objc_msgSend_appsRecentlyForegrounded(void *a1, const char *a2, ...)
{
  return [a1 appsRecentlyForegrounded];
}

id objc_msgSend_appsToExclude(void *a1, const char *a2, ...)
{
  return [a1 appsToExclude];
}

id objc_msgSend_argument(void *a1, const char *a2, ...)
{
  return [a1 argument];
}

id objc_msgSend_argumentObject(void *a1, const char *a2, ...)
{
  return [a1 argumentObject];
}

id objc_msgSend_armResetTimer(void *a1, const char *a2, ...)
{
  return [a1 armResetTimer];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asBiomeProtectionClass(void *a1, const char *a2, ...)
{
  return [a1 asBiomeProtectionClass];
}

id objc_msgSend_assertion(void *a1, const char *a2, ...)
{
  return [a1 assertion];
}

id objc_msgSend_assertionAssociations(void *a1, const char *a2, ...)
{
  return [a1 assertionAssociations];
}

id objc_msgSend_assertions(void *a1, const char *a2, ...)
{
  return [a1 assertions];
}

id objc_msgSend_assetsRateLimitConfiguration(void *a1, const char *a2, ...)
{
  return [a1 assetsRateLimitConfiguration];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_backgroundAppRefreshEnabled(void *a1, const char *a2, ...)
{
  return [a1 backgroundAppRefreshEnabled];
}

id objc_msgSend_backgroundTaskSchedulerPermittedIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 backgroundTaskSchedulerPermittedIdentifiers];
}

id objc_msgSend_backlightState(void *a1, const char *a2, ...)
{
  return [a1 backlightState];
}

id objc_msgSend_backlogged(void *a1, const char *a2, ...)
{
  return [a1 backlogged];
}

id objc_msgSend_backupTaskManager(void *a1, const char *a2, ...)
{
  return [a1 backupTaskManager];
}

id objc_msgSend_balance(void *a1, const char *a2, ...)
{
  return [a1 balance];
}

id objc_msgSend_barScheduler(void *a1, const char *a2, ...)
{
  return [a1 barScheduler];
}

id objc_msgSend_baseTime(void *a1, const char *a2, ...)
{
  return [a1 baseTime];
}

id objc_msgSend_batchingQueue(void *a1, const char *a2, ...)
{
  return [a1 batchingQueue];
}

id objc_msgSend_batteryAdapterIsWirelessKey(void *a1, const char *a2, ...)
{
  return [a1 batteryAdapterIsWirelessKey];
}

id objc_msgSend_batteryAdapterTypeKey(void *a1, const char *a2, ...)
{
  return [a1 batteryAdapterTypeKey];
}

id objc_msgSend_batteryExternalConnectedKey(void *a1, const char *a2, ...)
{
  return [a1 batteryExternalConnectedKey];
}

id objc_msgSend_batteryFullyChargedKey(void *a1, const char *a2, ...)
{
  return [a1 batteryFullyChargedKey];
}

id objc_msgSend_batteryIsChargingKey(void *a1, const char *a2, ...)
{
  return [a1 batteryIsChargingKey];
}

id objc_msgSend_batteryPercentageKey(void *a1, const char *a2, ...)
{
  return [a1 batteryPercentageKey];
}

id objc_msgSend_batteryProperties(void *a1, const char *a2, ...)
{
  return [a1 batteryProperties];
}

id objc_msgSend_batteryTemperatureKey(void *a1, const char *a2, ...)
{
  return [a1 batteryTemperatureKey];
}

id objc_msgSend_batteryVoltageKey(void *a1, const char *a2, ...)
{
  return [a1 batteryVoltageKey];
}

id objc_msgSend_beforeApplicationLaunch(void *a1, const char *a2, ...)
{
  return [a1 beforeApplicationLaunch];
}

id objc_msgSend_beforeDaysFirstActivity(void *a1, const char *a2, ...)
{
  return [a1 beforeDaysFirstActivity];
}

id objc_msgSend_beforeUserIsActive(void *a1, const char *a2, ...)
{
  return [a1 beforeUserIsActive];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_beginDate(void *a1, const char *a2, ...)
{
  return [a1 beginDate];
}

id objc_msgSend_blockRebootActivitiesForSU(void *a1, const char *a2, ...)
{
  return [a1 blockRebootActivitiesForSU];
}

id objc_msgSend_bluetoothIsConnectedStream(void *a1, const char *a2, ...)
{
  return [a1 bluetoothIsConnectedStream];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_BOOLeanValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLeanValue];
}

id objc_msgSend_bootupDate(void *a1, const char *a2, ...)
{
  return [a1 bootupDate];
}

id objc_msgSend_browser(void *a1, const char *a2, ...)
{
  return [a1 browser];
}

id objc_msgSend_budgetToIndex(void *a1, const char *a2, ...)
{
  return [a1 budgetToIndex];
}

id objc_msgSend_budgeted(void *a1, const char *a2, ...)
{
  return [a1 budgeted];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_bundleExecutable(void *a1, const char *a2, ...)
{
  return [a1 bundleExecutable];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bundleIDs(void *a1, const char *a2, ...)
{
  return [a1 bundleIDs];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bypassBatteryAging(void *a1, const char *a2, ...)
{
  return [a1 bypassBatteryAging];
}

id objc_msgSend_bypassPeakPower(void *a1, const char *a2, ...)
{
  return [a1 bypassPeakPower];
}

id objc_msgSend_bypassesPredictions(void *a1, const char *a2, ...)
{
  return [a1 bypassesPredictions];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_callback(void *a1, const char *a2, ...)
{
  return [a1 callback];
}

id objc_msgSend_cameraViewfinder(void *a1, const char *a2, ...)
{
  return [a1 cameraViewfinder];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAfterDeadline(void *a1, const char *a2, ...)
{
  return [a1 cancelAfterDeadline];
}

id objc_msgSend_cancelAllActivities(void *a1, const char *a2, ...)
{
  return [a1 cancelAllActivities];
}

id objc_msgSend_cancelAllBackgroundTasks(void *a1, const char *a2, ...)
{
  return [a1 cancelAllBackgroundTasks];
}

id objc_msgSend_cancelPreviousWakeRequest(void *a1, const char *a2, ...)
{
  return [a1 cancelPreviousWakeRequest];
}

id objc_msgSend_cancelResetTimer(void *a1, const char *a2, ...)
{
  return [a1 cancelResetTimer];
}

id objc_msgSend_capacity(void *a1, const char *a2, ...)
{
  return [a1 capacity];
}

id objc_msgSend_capacityBytes(void *a1, const char *a2, ...)
{
  return [a1 capacityBytes];
}

id objc_msgSend_cellPredictionTimeline(void *a1, const char *a2, ...)
{
  return [a1 cellPredictionTimeline];
}

id objc_msgSend_chargingDuration(void *a1, const char *a2, ...)
{
  return [a1 chargingDuration];
}

id objc_msgSend_ckRateLimitConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ckRateLimitConfiguration];
}

id objc_msgSend_classCUnlocked(void *a1, const char *a2, ...)
{
  return [a1 classCUnlocked];
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return [a1 clear];
}

id objc_msgSend_clearOffPeakDiscountedHours(void *a1, const char *a2, ...)
{
  return [a1 clearOffPeakDiscountedHours];
}

id objc_msgSend_clearPriorityQueue(void *a1, const char *a2, ...)
{
  return [a1 clearPriorityQueue];
}

id objc_msgSend_clearRecentlyLaunchedApps(void *a1, const char *a2, ...)
{
  return [a1 clearRecentlyLaunchedApps];
}

id objc_msgSend_clientDataBudgetName(void *a1, const char *a2, ...)
{
  return [a1 clientDataBudgetName];
}

id objc_msgSend_clientName(void *a1, const char *a2, ...)
{
  return [a1 clientName];
}

id objc_msgSend_clientProvidedIconBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientProvidedIconBundleIdentifier];
}

id objc_msgSend_clientProvidedIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientProvidedIdentifier];
}

id objc_msgSend_clientProvidedReason(void *a1, const char *a2, ...)
{
  return [a1 clientProvidedReason];
}

id objc_msgSend_clientProvidedStartDate(void *a1, const char *a2, ...)
{
  return [a1 clientProvidedStartDate];
}

id objc_msgSend_clientProvidedTitle(void *a1, const char *a2, ...)
{
  return [a1 clientProvidedTitle];
}

id objc_msgSend_closeFile(void *a1, const char *a2, ...)
{
  return [a1 closeFile];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commonAnalytics(void *a1, const char *a2, ...)
{
  return [a1 commonAnalytics];
}

id objc_msgSend_compatibilityObject(void *a1, const char *a2, ...)
{
  return [a1 compatibilityObject];
}

id objc_msgSend_complete(void *a1, const char *a2, ...)
{
  return [a1 complete];
}

id objc_msgSend_completeUnlessOpen(void *a1, const char *a2, ...)
{
  return [a1 completeUnlessOpen];
}

id objc_msgSend_completeUntilFirstUserAuthentication(void *a1, const char *a2, ...)
{
  return [a1 completeUntilFirstUserAuthentication];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return [a1 completedUnitCount];
}

id objc_msgSend_completionStatus(void *a1, const char *a2, ...)
{
  return [a1 completionStatus];
}

id objc_msgSend_computeBudgetFromHistoryForAllWidgets(void *a1, const char *a2, ...)
{
  return [a1 computeBudgetFromHistoryForAllWidgets];
}

id objc_msgSend_computeHasDeviceRecentlyUpdated(void *a1, const char *a2, ...)
{
  return [a1 computeHasDeviceRecentlyUpdated];
}

id objc_msgSend_computePolicyForCurrentState(void *a1, const char *a2, ...)
{
  return [a1 computePolicyForCurrentState];
}

id objc_msgSend_confidence(void *a1, const char *a2, ...)
{
  return [a1 confidence];
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return [a1 config];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurationName(void *a1, const char *a2, ...)
{
  return [a1 configurationName];
}

id objc_msgSend_configureMaximumDockCapacity(void *a1, const char *a2, ...)
{
  return [a1 configureMaximumDockCapacity];
}

id objc_msgSend_connectedBGTaskClients(void *a1, const char *a2, ...)
{
  return [a1 connectedBGTaskClients];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_consumerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 consumerIdentifier];
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return [a1 container];
}

id objc_msgSend_containingUrl(void *a1, const char *a2, ...)
{
  return [a1 containingUrl];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_contextPlugin(void *a1, const char *a2, ...)
{
  return [a1 contextPlugin];
}

id objc_msgSend_controlEffortResult(void *a1, const char *a2, ...)
{
  return [a1 controlEffortResult];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyCEndpoint(void *a1, const char *a2, ...)
{
  return [a1 copyCEndpoint];
}

id objc_msgSend_copyCParameters(void *a1, const char *a2, ...)
{
  return [a1 copyCParameters];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countDictionary(void *a1, const char *a2, ...)
{
  return [a1 countDictionary];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return [a1 countryCode];
}

id objc_msgSend_cpuIntensive(void *a1, const char *a2, ...)
{
  return [a1 cpuIntensive];
}

id objc_msgSend_createBARApplicationGroup(void *a1, const char *a2, ...)
{
  return [a1 createBARApplicationGroup];
}

id objc_msgSend_createDefaultActivityGroups(void *a1, const char *a2, ...)
{
  return [a1 createDefaultActivityGroups];
}

id objc_msgSend_createParameters(void *a1, const char *a2, ...)
{
  return [a1 createParameters];
}

id objc_msgSend_cumulativeResultConsumption(void *a1, const char *a2, ...)
{
  return [a1 cumulativeResultConsumption];
}

id objc_msgSend_currentActivity(void *a1, const char *a2, ...)
{
  return [a1 currentActivity];
}

id objc_msgSend_currentBatteryTemperature(void *a1, const char *a2, ...)
{
  return [a1 currentBatteryTemperature];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_currentClient(void *a1, const char *a2, ...)
{
  return [a1 currentClient];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentMode(void *a1, const char *a2, ...)
{
  return [a1 currentMode];
}

id objc_msgSend_currentPredictions(void *a1, const char *a2, ...)
{
  return [a1 currentPredictions];
}

id objc_msgSend_currentProbabilities(void *a1, const char *a2, ...)
{
  return [a1 currentProbabilities];
}

id objc_msgSend_currentReportingConditions(void *a1, const char *a2, ...)
{
  return [a1 currentReportingConditions];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_currentStatus(void *a1, const char *a2, ...)
{
  return [a1 currentStatus];
}

id objc_msgSend_currentValue(void *a1, const char *a2, ...)
{
  return [a1 currentValue];
}

id objc_msgSend_customBANetworkingBudget(void *a1, const char *a2, ...)
{
  return [a1 customBANetworkingBudget];
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return [a1 daemon];
}

id objc_msgSend_dailyBudget(void *a1, const char *a2, ...)
{
  return [a1 dailyBudget];
}

id objc_msgSend_dailyBudgetsForAllWidgets(void *a1, const char *a2, ...)
{
  return [a1 dailyBudgetsForAllWidgets];
}

id objc_msgSend_darkWakeEligible(void *a1, const char *a2, ...)
{
  return [a1 darkWakeEligible];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataBudgetName(void *a1, const char *a2, ...)
{
  return [a1 dataBudgetName];
}

id objc_msgSend_dataBudgeted(void *a1, const char *a2, ...)
{
  return [a1 dataBudgeted];
}

id objc_msgSend_dataProtectionClassA(void *a1, const char *a2, ...)
{
  return [a1 dataProtectionClassA];
}

id objc_msgSend_dataProtectionClassB(void *a1, const char *a2, ...)
{
  return [a1 dataProtectionClassB];
}

id objc_msgSend_dataProtectionClassC(void *a1, const char *a2, ...)
{
  return [a1 dataProtectionClassC];
}

id objc_msgSend_dataProtectionClassD(void *a1, const char *a2, ...)
{
  return [a1 dataProtectionClassD];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return [a1 day];
}

id objc_msgSend_deadlineTime(void *a1, const char *a2, ...)
{
  return [a1 deadlineTime];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_decision(void *a1, const char *a2, ...)
{
  return [a1 decision];
}

id objc_msgSend_decrementPushBudgetRemaining(void *a1, const char *a2, ...)
{
  return [a1 decrementPushBudgetRemaining];
}

id objc_msgSend_defaultCategory(void *a1, const char *a2, ...)
{
  return [a1 defaultCategory];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultInexpensivePathEvaluator(void *a1, const char *a2, ...)
{
  return [a1 defaultInexpensivePathEvaluator];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultNotifcationRequest(void *a1, const char *a2, ...)
{
  return [a1 defaultNotifcationRequest];
}

id objc_msgSend_defaultPairedDeviceNearbyStream(void *a1, const char *a2, ...)
{
  return [a1 defaultPairedDeviceNearbyStream];
}

id objc_msgSend_defaultPathEvaluator(void *a1, const char *a2, ...)
{
  return [a1 defaultPathEvaluator];
}

id objc_msgSend_defaultRateLimiterConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultRateLimiterConfiguration];
}

id objc_msgSend_defaultSystemCellularBudget(void *a1, const char *a2, ...)
{
  return [a1 defaultSystemCellularBudget];
}

id objc_msgSend_defaultSystemEnergyBudget(void *a1, const char *a2, ...)
{
  return [a1 defaultSystemEnergyBudget];
}

id objc_msgSend_defaultUnconstrainedPathEvaluator(void *a1, const char *a2, ...)
{
  return [a1 defaultUnconstrainedPathEvaluator];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_deferred(void *a1, const char *a2, ...)
{
  return [a1 deferred];
}

id objc_msgSend_deficitProcessing(void *a1, const char *a2, ...)
{
  return [a1 deficitProcessing];
}

id objc_msgSend_delayedStart(void *a1, const char *a2, ...)
{
  return [a1 delayedStart];
}

id objc_msgSend_delegateQueue(void *a1, const char *a2, ...)
{
  return [a1 delegateQueue];
}

id objc_msgSend_deleteActivitiesIfRequired(void *a1, const char *a2, ...)
{
  return [a1 deleteActivitiesIfRequired];
}

id objc_msgSend_deleteConvertedStreams(void *a1, const char *a2, ...)
{
  return [a1 deleteConvertedStreams];
}

id objc_msgSend_deleteOldDurations(void *a1, const char *a2, ...)
{
  return [a1 deleteOldDurations];
}

id objc_msgSend_dependencies(void *a1, const char *a2, ...)
{
  return [a1 dependencies];
}

id objc_msgSend_dependenciesPreCleared(void *a1, const char *a2, ...)
{
  return [a1 dependenciesPreCleared];
}

id objc_msgSend_dependencyIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 dependencyIdentifiers];
}

id objc_msgSend_deploymentID(void *a1, const char *a2, ...)
{
  return [a1 deploymentID];
}

id objc_msgSend_deploymentId(void *a1, const char *a2, ...)
{
  return [a1 deploymentId];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return [a1 descriptor];
}

id objc_msgSend_determineAppsWithBackgroundRunningModes(void *a1, const char *a2, ...)
{
  return [a1 determineAppsWithBackgroundRunningModes];
}

id objc_msgSend_determineNextTimerFireDateAndSchedule(void *a1, const char *a2, ...)
{
  return [a1 determineNextTimerFireDateAndSchedule];
}

id objc_msgSend_deviceActivityLevelStream(void *a1, const char *a2, ...)
{
  return [a1 deviceActivityLevelStream];
}

id objc_msgSend_deviceActivityLikelihood(void *a1, const char *a2, ...)
{
  return [a1 deviceActivityLikelihood];
}

id objc_msgSend_deviceActivityState(void *a1, const char *a2, ...)
{
  return [a1 deviceActivityState];
}

id objc_msgSend_deviceActivityTimeline(void *a1, const char *a2, ...)
{
  return [a1 deviceActivityTimeline];
}

id objc_msgSend_deviceBatteryPercentageStream(void *a1, const char *a2, ...)
{
  return [a1 deviceBatteryPercentageStream];
}

id objc_msgSend_deviceHasBeenUnlockedSinceBoot(void *a1, const char *a2, ...)
{
  return [a1 deviceHasBeenUnlockedSinceBoot];
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deviceIdentifier];
}

id objc_msgSend_deviceIsLocked(void *a1, const char *a2, ...)
{
  return [a1 deviceIsLocked];
}

id objc_msgSend_deviceIsLockedImputedStream(void *a1, const char *a2, ...)
{
  return [a1 deviceIsLockedImputedStream];
}

id objc_msgSend_deviceIsPasswordConfigured(void *a1, const char *a2, ...)
{
  return [a1 deviceIsPasswordConfigured];
}

id objc_msgSend_deviceIsPluggedInStream(void *a1, const char *a2, ...)
{
  return [a1 deviceIsPluggedInStream];
}

id objc_msgSend_deviceLowPowerModeStream(void *a1, const char *a2, ...)
{
  return [a1 deviceLowPowerModeStream];
}

id objc_msgSend_deviceNearbyTimeline(void *a1, const char *a2, ...)
{
  return [a1 deviceNearbyTimeline];
}

id objc_msgSend_deviceUUID(void *a1, const char *a2, ...)
{
  return [a1 deviceUUID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 dictionaryRepresentation];
}

id objc_msgSend_discountedHours(void *a1, const char *a2, ...)
{
  return [a1 discountedHours];
}

id objc_msgSend_diskIntensive(void *a1, const char *a2, ...)
{
  return [a1 diskIntensive];
}

id objc_msgSend_diskVolume(void *a1, const char *a2, ...)
{
  return [a1 diskVolume];
}

id objc_msgSend_dispatchSourceProcessExit(void *a1, const char *a2, ...)
{
  return [a1 dispatchSourceProcessExit];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return [a1 distantPast];
}

id objc_msgSend_dkEvent(void *a1, const char *a2, ...)
{
  return [a1 dkEvent];
}

id objc_msgSend_doNotDisturbStream(void *a1, const char *a2, ...)
{
  return [a1 doNotDisturbStream];
}

id objc_msgSend_dockManager(void *a1, const char *a2, ...)
{
  return [a1 dockManager];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_domestic(void *a1, const char *a2, ...)
{
  return [a1 domestic];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_downloadSize(void *a1, const char *a2, ...)
{
  return [a1 downloadSize];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_dutyCyclingInitiated(void *a1, const char *a2, ...)
{
  return [a1 dutyCyclingInitiated];
}

id objc_msgSend_dutyCyclingMethod(void *a1, const char *a2, ...)
{
  return [a1 dutyCyclingMethod];
}

id objc_msgSend_earlyToday(void *a1, const char *a2, ...)
{
  return [a1 earlyToday];
}

id objc_msgSend_effectiveUserIdentifier(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserIdentifier];
}

id objc_msgSend_eligibleTime(void *a1, const char *a2, ...)
{
  return [a1 eligibleTime];
}

id objc_msgSend_enManager(void *a1, const char *a2, ...)
{
  return [a1 enManager];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return [a1 enabled];
}

id objc_msgSend_encounteredTLC(void *a1, const char *a2, ...)
{
  return [a1 encounteredTLC];
}

id objc_msgSend_end(void *a1, const char *a2, ...)
{
  return [a1 end];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_endTime(void *a1, const char *a2, ...)
{
  return [a1 endTime];
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return [a1 endowmentNamespaces];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_entityName(void *a1, const char *a2, ...)
{
  return [a1 entityName];
}

id objc_msgSend_epochTimestamp(void *a1, const char *a2, ...)
{
  return [a1 epochTimestamp];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_evaluateAndReportBlockingReasonsForAllCriteria(void *a1, const char *a2, ...)
{
  return [a1 evaluateAndReportBlockingReasonsForAllCriteria];
}

id objc_msgSend_evaluateAssertions(void *a1, const char *a2, ...)
{
  return [a1 evaluateAssertions];
}

id objc_msgSend_evaluateFreezerRecommendations(void *a1, const char *a2, ...)
{
  return [a1 evaluateFreezerRecommendations];
}

id objc_msgSend_evaluatePolicies(void *a1, const char *a2, ...)
{
  return [a1 evaluatePolicies];
}

id objc_msgSend_evaluatePrewarmRecommendations(void *a1, const char *a2, ...)
{
  return [a1 evaluatePrewarmRecommendations];
}

id objc_msgSend_evaluationQueue(void *a1, const char *a2, ...)
{
  return [a1 evaluationQueue];
}

id objc_msgSend_evaluator(void *a1, const char *a2, ...)
{
  return [a1 evaluator];
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return [a1 eventBody];
}

id objc_msgSend_eventStream(void *a1, const char *a2, ...)
{
  return [a1 eventStream];
}

id objc_msgSend_executableObject(void *a1, const char *a2, ...)
{
  return [a1 executableObject];
}

id objc_msgSend_executableSpecification(void *a1, const char *a2, ...)
{
  return [a1 executableSpecification];
}

id objc_msgSend_exitEvent(void *a1, const char *a2, ...)
{
  return [a1 exitEvent];
}

id objc_msgSend_exitReason(void *a1, const char *a2, ...)
{
  return [a1 exitReason];
}

id objc_msgSend_experimentID(void *a1, const char *a2, ...)
{
  return [a1 experimentID];
}

id objc_msgSend_experimentId(void *a1, const char *a2, ...)
{
  return [a1 experimentId];
}

id objc_msgSend_experimentsToWrite(void *a1, const char *a2, ...)
{
  return [a1 experimentsToWrite];
}

id objc_msgSend_exposureNotificationEnabled(void *a1, const char *a2, ...)
{
  return [a1 exposureNotificationEnabled];
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return [a1 extension];
}

id objc_msgSend_extensionHostIdentifier(void *a1, const char *a2, ...)
{
  return [a1 extensionHostIdentifier];
}

id objc_msgSend_extensionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 extensionIdentifier];
}

id objc_msgSend_extensionName(void *a1, const char *a2, ...)
{
  return [a1 extensionName];
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return [a1 extensionPointRecord];
}

id objc_msgSend_fastPass(void *a1, const char *a2, ...)
{
  return [a1 fastPass];
}

id objc_msgSend_featureCodes(void *a1, const char *a2, ...)
{
  return [a1 featureCodes];
}

id objc_msgSend_fetchDate(void *a1, const char *a2, ...)
{
  return [a1 fetchDate];
}

id objc_msgSend_fetchLatestBARMetric(void *a1, const char *a2, ...)
{
  return [a1 fetchLatestBARMetric];
}

id objc_msgSend_fileProtection(void *a1, const char *a2, ...)
{
  return [a1 fileProtection];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return [a1 firstIndex];
}

id objc_msgSend_firstKillEventDate(void *a1, const char *a2, ...)
{
  return [a1 firstKillEventDate];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_flushComputedBudgetCache(void *a1, const char *a2, ...)
{
  return [a1 flushComputedBudgetCache];
}

id objc_msgSend_flushPPSCaches(void *a1, const char *a2, ...)
{
  return [a1 flushPPSCaches];
}

id objc_msgSend_forecastMap(void *a1, const char *a2, ...)
{
  return [a1 forecastMap];
}

id objc_msgSend_freezerRecommendations(void *a1, const char *a2, ...)
{
  return [a1 freezerRecommendations];
}

id objc_msgSend_frequentlyUserKilledApps(void *a1, const char *a2, ...)
{
  return [a1 frequentlyUserKilledApps];
}

id objc_msgSend_garbageCollectActivityDates(void *a1, const char *a2, ...)
{
  return [a1 garbageCollectActivityDates];
}

id objc_msgSend_generateAccuraciesCAEventDictionary(void *a1, const char *a2, ...)
{
  return [a1 generateAccuraciesCAEventDictionary];
}

id objc_msgSend_generateCRFile(void *a1, const char *a2, ...)
{
  return [a1 generateCRFile];
}

id objc_msgSend_getActivityBaseTime(void *a1, const char *a2, ...)
{
  return [a1 getActivityBaseTime];
}

id objc_msgSend_getBatteryStatus(void *a1, const char *a2, ...)
{
  return [a1 getBatteryStatus];
}

id objc_msgSend_getCurrentBootSessionUUID(void *a1, const char *a2, ...)
{
  return [a1 getCurrentBootSessionUUID];
}

id objc_msgSend_getDeviceBootTime(void *a1, const char *a2, ...)
{
  return [a1 getDeviceBootTime];
}

id objc_msgSend_getDeviceRestartForecast(void *a1, const char *a2, ...)
{
  return [a1 getDeviceRestartForecast];
}

id objc_msgSend_getDiscretionaryEnergyBudget(void *a1, const char *a2, ...)
{
  return [a1 getDiscretionaryEnergyBudget];
}

id objc_msgSend_getInferredCarryStatus(void *a1, const char *a2, ...)
{
  return [a1 getInferredCarryStatus];
}

id objc_msgSend_getPairedDevices(void *a1, const char *a2, ...)
{
  return [a1 getPairedDevices];
}

id objc_msgSend_getPhysMemSizeInBytes(void *a1, const char *a2, ...)
{
  return [a1 getPhysMemSizeInBytes];
}

id objc_msgSend_getSpotlightTimeSeries(void *a1, const char *a2, ...)
{
  return [a1 getSpotlightTimeSeries];
}

id objc_msgSend_getUnlockAndSoftwareUpdateTimes(void *a1, const char *a2, ...)
{
  return [a1 getUnlockAndSoftwareUpdateTimes];
}

id objc_msgSend_gpuIntensive(void *a1, const char *a2, ...)
{
  return [a1 gpuIntensive];
}

id objc_msgSend_groupName(void *a1, const char *a2, ...)
{
  return [a1 groupName];
}

id objc_msgSend_handleActiveAppChanged(void *a1, const char *a2, ...)
{
  return [a1 handleActiveAppChanged];
}

id objc_msgSend_handleBatteryNotification(void *a1, const char *a2, ...)
{
  return [a1 handleBatteryNotification];
}

id objc_msgSend_handleCacheDeletePurgeableSpaceNotification(void *a1, const char *a2, ...)
{
  return [a1 handleCacheDeletePurgeableSpaceNotification];
}

id objc_msgSend_handleClientInterruption(void *a1, const char *a2, ...)
{
  return [a1 handleClientInterruption];
}

id objc_msgSend_handleKeyBagLockNotification(void *a1, const char *a2, ...)
{
  return [a1 handleKeyBagLockNotification];
}

id objc_msgSend_handleNotification(void *a1, const char *a2, ...)
{
  return [a1 handleNotification];
}

id objc_msgSend_handleTaskExpiration(void *a1, const char *a2, ...)
{
  return [a1 handleTaskExpiration];
}

id objc_msgSend_handleTaskExpirationNeverEligible(void *a1, const char *a2, ...)
{
  return [a1 handleTaskExpirationNeverEligible];
}

id objc_msgSend_handleTriggerEvent(void *a1, const char *a2, ...)
{
  return [a1 handleTriggerEvent];
}

id objc_msgSend_handleWirelessModemDynamicStoreChanged(void *a1, const char *a2, ...)
{
  return [a1 handleWirelessModemDynamicStoreChanged];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_handlerQueue(void *a1, const char *a2, ...)
{
  return [a1 handlerQueue];
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return [a1 hasChanges];
}

id objc_msgSend_hasEntitlementForCustomIconBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 hasEntitlementForCustomIconBundleIdentifier];
}

id objc_msgSend_hasEntitlementForProgressTask(void *a1, const char *a2, ...)
{
  return [a1 hasEntitlementForProgressTask];
}

id objc_msgSend_hasInstallActivityRun(void *a1, const char *a2, ...)
{
  return [a1 hasInstallActivityRun];
}

id objc_msgSend_hasMagneticSensitivity(void *a1, const char *a2, ...)
{
  return [a1 hasMagneticSensitivity];
}

id objc_msgSend_hasManyConstraints(void *a1, const char *a2, ...)
{
  return [a1 hasManyConstraints];
}

id objc_msgSend_hasRecentlyUpdated(void *a1, const char *a2, ...)
{
  return [a1 hasRecentlyUpdated];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_haveRunActivities(void *a1, const char *a2, ...)
{
  return [a1 haveRunActivities];
}

id objc_msgSend_histogramEventStream(void *a1, const char *a2, ...)
{
  return [a1 histogramEventStream];
}

id objc_msgSend_historicalClassification(void *a1, const char *a2, ...)
{
  return [a1 historicalClassification];
}

id objc_msgSend_hostProcess(void *a1, const char *a2, ...)
{
  return [a1 hostProcess];
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return [a1 hour];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 idsDeviceIdentifier];
}

id objc_msgSend_inADarkWake(void *a1, const char *a2, ...)
{
  return [a1 inADarkWake];
}

id objc_msgSend_inSmartPowerNap(void *a1, const char *a2, ...)
{
  return [a1 inSmartPowerNap];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_indicatesProtection(void *a1, const char *a2, ...)
{
  return [a1 indicatesProtection];
}

id objc_msgSend_inexpensivePathAvailable(void *a1, const char *a2, ...)
{
  return [a1 inexpensivePathAvailable];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initProcessMonitorForDockedApplications(void *a1, const char *a2, ...)
{
  return [a1 initProcessMonitorForDockedApplications];
}

id objc_msgSend_initTaskGraph(void *a1, const char *a2, ...)
{
  return [a1 initTaskGraph];
}

id objc_msgSend_initialDelay(void *a1, const char *a2, ...)
{
  return [a1 initialDelay];
}

id objc_msgSend_initializeAllPolicies(void *a1, const char *a2, ...)
{
  return [a1 initializeAllPolicies];
}

id objc_msgSend_initializeCarryStatusLogging(void *a1, const char *a2, ...)
{
  return [a1 initializeCarryStatusLogging];
}

id objc_msgSend_initializeCoreTelephonyClient(void *a1, const char *a2, ...)
{
  return [a1 initializeCoreTelephonyClient];
}

id objc_msgSend_initializeLedgerIndices(void *a1, const char *a2, ...)
{
  return [a1 initializeLedgerIndices];
}

id objc_msgSend_initializeLogs(void *a1, const char *a2, ...)
{
  return [a1 initializeLogs];
}

id objc_msgSend_initializePluginTrigger(void *a1, const char *a2, ...)
{
  return [a1 initializePluginTrigger];
}

id objc_msgSend_initializeTimelines(void *a1, const char *a2, ...)
{
  return [a1 initializeTimelines];
}

id objc_msgSend_initializeTriggers(void *a1, const char *a2, ...)
{
  return [a1 initializeTriggers];
}

id objc_msgSend_instantiateConfiguredBudgets(void *a1, const char *a2, ...)
{
  return [a1 instantiateConfiguredBudgets];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intentSyncIsEngaged(void *a1, const char *a2, ...)
{
  return [a1 intentSyncIsEngaged];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_interfaceSubtype(void *a1, const char *a2, ...)
{
  return [a1 interfaceSubtype];
}

id objc_msgSend_interval(void *a1, const char *a2, ...)
{
  return [a1 interval];
}

id objc_msgSend_intializeAnalyzers(void *a1, const char *a2, ...)
{
  return [a1 intializeAnalyzers];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateAssertions(void *a1, const char *a2, ...)
{
  return [a1 invalidateAssertions];
}

id objc_msgSend_invalidateComputedBudgetCache(void *a1, const char *a2, ...)
{
  return [a1 invalidateComputedBudgetCache];
}

id objc_msgSend_invalidateConnection(void *a1, const char *a2, ...)
{
  return [a1 invalidateConnection];
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return [a1 invalidationHandler];
}

id objc_msgSend_involvedProcesses(void *a1, const char *a2, ...)
{
  return [a1 involvedProcesses];
}

id objc_msgSend_isActivityCompletionBased(void *a1, const char *a2, ...)
{
  return [a1 isActivityCompletionBased];
}

id objc_msgSend_isAppleAudioDevice(void *a1, const char *a2, ...)
{
  return [a1 isAppleAudioDevice];
}

id objc_msgSend_isAsleep(void *a1, const char *a2, ...)
{
  return [a1 isAsleep];
}

id objc_msgSend_isAutomaticAppUpdatesAllowed(void *a1, const char *a2, ...)
{
  return [a1 isAutomaticAppUpdatesAllowed];
}

id objc_msgSend_isBAREnabledOnWiFiOnly(void *a1, const char *a2, ...)
{
  return [a1 isBAREnabledOnWiFiOnly];
}

id objc_msgSend_isBackgroundTaskActivity(void *a1, const char *a2, ...)
{
  return [a1 isBackgroundTaskActivity];
}

id objc_msgSend_isBacklightOff(void *a1, const char *a2, ...)
{
  return [a1 isBacklightOff];
}

id objc_msgSend_isChallengedForBatteryLife(void *a1, const char *a2, ...)
{
  return [a1 isChallengedForBatteryLife];
}

id objc_msgSend_isClassCLocked(void *a1, const char *a2, ...)
{
  return [a1 isClassCLocked];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isContactTracingBackgroundActivity(void *a1, const char *a2, ...)
{
  return [a1 isContactTracingBackgroundActivity];
}

id objc_msgSend_isContinuedProcessingTask(void *a1, const char *a2, ...)
{
  return [a1 isContinuedProcessingTask];
}

id objc_msgSend_isDataAvailableForClassA(void *a1, const char *a2, ...)
{
  return [a1 isDataAvailableForClassA];
}

id objc_msgSend_isDataAvailableForClassC(void *a1, const char *a2, ...)
{
  return [a1 isDataAvailableForClassC];
}

id objc_msgSend_isDebugging(void *a1, const char *a2, ...)
{
  return [a1 isDebugging];
}

id objc_msgSend_isDeletable(void *a1, const char *a2, ...)
{
  return [a1 isDeletable];
}

id objc_msgSend_isEligibleNow(void *a1, const char *a2, ...)
{
  return [a1 isEligibleNow];
}

id objc_msgSend_isHighCarbonImpactWindow(void *a1, const char *a2, ...)
{
  return [a1 isHighCarbonImpactWindow];
}

id objc_msgSend_isInstall(void *a1, const char *a2, ...)
{
  return [a1 isInstall];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_isIntensive(void *a1, const char *a2, ...)
{
  return [a1 isIntensive];
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return [a1 isInternal];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isLaunchProhibited(void *a1, const char *a2, ...)
{
  return [a1 isLaunchProhibited];
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 isLowPowerModeEnabled];
}

id objc_msgSend_isMultiUser(void *a1, const char *a2, ...)
{
  return [a1 isMultiUser];
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return [a1 isNearby];
}

id objc_msgSend_isNetworkPathAvailable(void *a1, const char *a2, ...)
{
  return [a1 isNetworkPathAvailable];
}

id objc_msgSend_isPrewarmAllowed(void *a1, const char *a2, ...)
{
  return [a1 isPrewarmAllowed];
}

id objc_msgSend_isRegistered(void *a1, const char *a2, ...)
{
  return [a1 isRegistered];
}

id objc_msgSend_isRestricted(void *a1, const char *a2, ...)
{
  return [a1 isRestricted];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_isSilentPush(void *a1, const char *a2, ...)
{
  return [a1 isSilentPush];
}

id objc_msgSend_isSleep(void *a1, const char *a2, ...)
{
  return [a1 isSleep];
}

id objc_msgSend_isSoftwareUpdateActivity(void *a1, const char *a2, ...)
{
  return [a1 isSoftwareUpdateActivity];
}

id objc_msgSend_isStarting(void *a1, const char *a2, ...)
{
  return [a1 isStarting];
}

id objc_msgSend_isUnavailable(void *a1, const char *a2, ...)
{
  return [a1 isUnavailable];
}

id objc_msgSend_isUpload(void *a1, const char *a2, ...)
{
  return [a1 isUpload];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isiPad(void *a1, const char *a2, ...)
{
  return [a1 isiPad];
}

id objc_msgSend_isiPhone(void *a1, const char *a2, ...)
{
  return [a1 isiPhone];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return [a1 keyEnumerator];
}

id objc_msgSend_keyPathForAppUsageDataDictionaries(void *a1, const char *a2, ...)
{
  return [a1 keyPathForAppUsageDataDictionaries];
}

id objc_msgSend_keyPathForBacklightOnStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForBacklightOnStatus];
}

id objc_msgSend_keyPathForBatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 keyPathForBatteryLevel];
}

id objc_msgSend_keyPathForBatteryStateDataDictionary(void *a1, const char *a2, ...)
{
  return [a1 keyPathForBatteryStateDataDictionary];
}

id objc_msgSend_keyPathForBlockedStartDate(void *a1, const char *a2, ...)
{
  return [a1 keyPathForBlockedStartDate];
}

id objc_msgSend_keyPathForCPUUsageLevel(void *a1, const char *a2, ...)
{
  return [a1 keyPathForCPUUsageLevel];
}

id objc_msgSend_keyPathForCallInProgressStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForCallInProgressStatus];
}

id objc_msgSend_keyPathForCarplayConnectedStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForCarplayConnectedStatus];
}

id objc_msgSend_keyPathForCellConnectionQuality(void *a1, const char *a2, ...)
{
  return [a1 keyPathForCellConnectionQuality];
}

id objc_msgSend_keyPathForCellConnectionStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForCellConnectionStatus];
}

id objc_msgSend_keyPathForCellQualityPrediction(void *a1, const char *a2, ...)
{
  return [a1 keyPathForCellQualityPrediction];
}

id objc_msgSend_keyPathForDefaultPairedDeviceBatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 keyPathForDefaultPairedDeviceBatteryLevel];
}

id objc_msgSend_keyPathForDefaultPairedDeviceNearbyStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForDefaultPairedDeviceNearbyStatus];
}

id objc_msgSend_keyPathForDefaultPairedDevicePluginStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForDefaultPairedDevicePluginStatus];
}

id objc_msgSend_keyPathForDefaultPairedDeviceThermalPressureLevel(void *a1, const char *a2, ...)
{
  return [a1 keyPathForDefaultPairedDeviceThermalPressureLevel];
}

id objc_msgSend_keyPathForDeviceAssertionsHeldStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForDeviceAssertionsHeldStatus];
}

id objc_msgSend_keyPathForDeviceLockStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForDeviceLockStatus];
}

id objc_msgSend_keyPathForDoNotDisturbStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForDoNotDisturbStatus];
}

id objc_msgSend_keyPathForEnergyBudgetRemainingStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForEnergyBudgetRemainingStatus];
}

id objc_msgSend_keyPathForInUseStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForInUseStatus];
}

id objc_msgSend_keyPathForKeybagLockStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForKeybagLockStatus];
}

id objc_msgSend_keyPathForLastUseDate(void *a1, const char *a2, ...)
{
  return [a1 keyPathForLastUseDate];
}

id objc_msgSend_keyPathForLowPowerModeStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForLowPowerModeStatus];
}

id objc_msgSend_keyPathForMotionState(void *a1, const char *a2, ...)
{
  return [a1 keyPathForMotionState];
}

id objc_msgSend_keyPathForNetworkingBudgetRemainingStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForNetworkingBudgetRemainingStatus];
}

id objc_msgSend_keyPathForNextUserVisibleWakeDate(void *a1, const char *a2, ...)
{
  return [a1 keyPathForNextUserVisibleWakeDate];
}

id objc_msgSend_keyPathForPhotosBudgetOverride(void *a1, const char *a2, ...)
{
  return [a1 keyPathForPhotosBudgetOverride];
}

id objc_msgSend_keyPathForPhotosIsBlocked(void *a1, const char *a2, ...)
{
  return [a1 keyPathForPhotosIsBlocked];
}

id objc_msgSend_keyPathForPhotosIsUnBlocked(void *a1, const char *a2, ...)
{
  return [a1 keyPathForPhotosIsUnBlocked];
}

id objc_msgSend_keyPathForPluginStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForPluginStatus];
}

id objc_msgSend_keyPathForThermalPressureLevel(void *a1, const char *a2, ...)
{
  return [a1 keyPathForThermalPressureLevel];
}

id objc_msgSend_keyPathForWiFiConnectionQuality(void *a1, const char *a2, ...)
{
  return [a1 keyPathForWiFiConnectionQuality];
}

id objc_msgSend_keyPathForWiFiConnectionStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForWiFiConnectionStatus];
}

id objc_msgSend_keyPathForWiFiQualityPrediction(void *a1, const char *a2, ...)
{
  return [a1 keyPathForWiFiQualityPrediction];
}

id objc_msgSend_keyPathForWiredConnectionQuality(void *a1, const char *a2, ...)
{
  return [a1 keyPathForWiredConnectionQuality];
}

id objc_msgSend_keyPathForWiredConnectionStatus(void *a1, const char *a2, ...)
{
  return [a1 keyPathForWiredConnectionStatus];
}

id objc_msgSend_keyPaths(void *a1, const char *a2, ...)
{
  return [a1 keyPaths];
}

id objc_msgSend_knowledgeStore(void *a1, const char *a2, ...)
{
  return [a1 knowledgeStore];
}

id objc_msgSend_knowledgeStoreWithDirectReadWriteAccess(void *a1, const char *a2, ...)
{
  return [a1 knowledgeStoreWithDirectReadWriteAccess];
}

id objc_msgSend_last(void *a1, const char *a2, ...)
{
  return [a1 last];
}

id objc_msgSend_lastCacheDate(void *a1, const char *a2, ...)
{
  return [a1 lastCacheDate];
}

id objc_msgSend_lastDenialValue(void *a1, const char *a2, ...)
{
  return [a1 lastDenialValue];
}

id objc_msgSend_lastModulatedDate(void *a1, const char *a2, ...)
{
  return [a1 lastModulatedDate];
}

id objc_msgSend_lastModulationDate(void *a1, const char *a2, ...)
{
  return [a1 lastModulationDate];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastPPSFlush(void *a1, const char *a2, ...)
{
  return [a1 lastPPSFlush];
}

id objc_msgSend_lastScored(void *a1, const char *a2, ...)
{
  return [a1 lastScored];
}

id objc_msgSend_lastWakeDate(void *a1, const char *a2, ...)
{
  return [a1 lastWakeDate];
}

id objc_msgSend_latestMarginalEmissionForecast(void *a1, const char *a2, ...)
{
  return [a1 latestMarginalEmissionForecast];
}

id objc_msgSend_launchCount(void *a1, const char *a2, ...)
{
  return [a1 launchCount];
}

id objc_msgSend_launchDataCollectionStartDate(void *a1, const char *a2, ...)
{
  return [a1 launchDataCollectionStartDate];
}

id objc_msgSend_launchReason(void *a1, const char *a2, ...)
{
  return [a1 launchReason];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_limit(void *a1, const char *a2, ...)
{
  return [a1 limit];
}

id objc_msgSend_limitationName(void *a1, const char *a2, ...)
{
  return [a1 limitationName];
}

id objc_msgSend_limitationResponse(void *a1, const char *a2, ...)
{
  return [a1 limitationResponse];
}

id objc_msgSend_limiterName(void *a1, const char *a2, ...)
{
  return [a1 limiterName];
}

id objc_msgSend_linkQuality(void *a1, const char *a2, ...)
{
  return [a1 linkQuality];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}

id objc_msgSend_loadBaseTime(void *a1, const char *a2, ...)
{
  return [a1 loadBaseTime];
}

id objc_msgSend_loadCustomDurations(void *a1, const char *a2, ...)
{
  return [a1 loadCustomDurations];
}

id objc_msgSend_loadMaximumDurations(void *a1, const char *a2, ...)
{
  return [a1 loadMaximumDurations];
}

id objc_msgSend_loadOverrides(void *a1, const char *a2, ...)
{
  return [a1 loadOverrides];
}

id objc_msgSend_loadParameters(void *a1, const char *a2, ...)
{
  return [a1 loadParameters];
}

id objc_msgSend_loadPriorityQueue(void *a1, const char *a2, ...)
{
  return [a1 loadPriorityQueue];
}

id objc_msgSend_loadState(void *a1, const char *a2, ...)
{
  return [a1 loadState];
}

id objc_msgSend_loadStateWhenAvailable(void *a1, const char *a2, ...)
{
  return [a1 loadStateWhenAvailable];
}

id objc_msgSend_loadSubmittedRateLimitConfiguration(void *a1, const char *a2, ...)
{
  return [a1 loadSubmittedRateLimitConfiguration];
}

id objc_msgSend_loadTestingDefaults(void *a1, const char *a2, ...)
{
  return [a1 loadTestingDefaults];
}

id objc_msgSend_loadTrialParameters(void *a1, const char *a2, ...)
{
  return [a1 loadTrialParameters];
}

id objc_msgSend_loadTrialTreatmentAndExperimentIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 loadTrialTreatmentAndExperimentIdentifiers];
}

id objc_msgSend_loadUnavailable(void *a1, const char *a2, ...)
{
  return [a1 loadUnavailable];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_lockStateMonitor(void *a1, const char *a2, ...)
{
  return [a1 lockStateMonitor];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return [a1 log];
}

id objc_msgSend_logUpdatedCarryStatus(void *a1, const char *a2, ...)
{
  return [a1 logUpdatedCarryStatus];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return [a1 logger];
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return [a1 longValue];
}

id objc_msgSend_lowCongestionHours(void *a1, const char *a2, ...)
{
  return [a1 lowCongestionHours];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_magneticInterferenceSensitivity(void *a1, const char *a2, ...)
{
  return [a1 magneticInterferenceSensitivity];
}

id objc_msgSend_mailFetch(void *a1, const char *a2, ...)
{
  return [a1 mailFetch];
}

id objc_msgSend_mainApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 mainApplicationBundleIdentifier];
}

id objc_msgSend_makeDecisionBasedOnSystemConstraints(void *a1, const char *a2, ...)
{
  return [a1 makeDecisionBasedOnSystemConstraints];
}

id objc_msgSend_managedBudgets(void *a1, const char *a2, ...)
{
  return [a1 managedBudgets];
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return [a1 managedObjectContext];
}

id objc_msgSend_managedObjectModel(void *a1, const char *a2, ...)
{
  return [a1 managedObjectModel];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return [a1 manager];
}

id objc_msgSend_markAsCompleted(void *a1, const char *a2, ...)
{
  return [a1 markAsCompleted];
}

id objc_msgSend_markInstallActivityDone(void *a1, const char *a2, ...)
{
  return [a1 markInstallActivityDone];
}

id objc_msgSend_maxConcurrent(void *a1, const char *a2, ...)
{
  return [a1 maxConcurrent];
}

id objc_msgSend_maxWidgetRefreshBudgetForIndividualDaily(void *a1, const char *a2, ...)
{
  return [a1 maxWidgetRefreshBudgetForIndividualDaily];
}

id objc_msgSend_maxedRateLimits(void *a1, const char *a2, ...)
{
  return [a1 maxedRateLimits];
}

id objc_msgSend_maximum(void *a1, const char *a2, ...)
{
  return [a1 maximum];
}

id objc_msgSend_maximumRuntime(void *a1, const char *a2, ...)
{
  return [a1 maximumRuntime];
}

id objc_msgSend_mean(void *a1, const char *a2, ...)
{
  return [a1 mean];
}

id objc_msgSend_meanDeltaTimeBetweenColdLaunchAndResume(void *a1, const char *a2, ...)
{
  return [a1 meanDeltaTimeBetweenColdLaunchAndResume];
}

id objc_msgSend_meanJetsamKills(void *a1, const char *a2, ...)
{
  return [a1 meanJetsamKills];
}

id objc_msgSend_meanOtherKills(void *a1, const char *a2, ...)
{
  return [a1 meanOtherKills];
}

id objc_msgSend_meanRunningBoardKills(void *a1, const char *a2, ...)
{
  return [a1 meanRunningBoardKills];
}

id objc_msgSend_meanSpringBoardKills(void *a1, const char *a2, ...)
{
  return [a1 meanSpringBoardKills];
}

id objc_msgSend_mediaanalysisProgressMapping(void *a1, const char *a2, ...)
{
  return [a1 mediaanalysisProgressMapping];
}

id objc_msgSend_memoryIntensive(void *a1, const char *a2, ...)
{
  return [a1 memoryIntensive];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_metadataSegments(void *a1, const char *a2, ...)
{
  return [a1 metadataSegments];
}

id objc_msgSend_metricKeysAndValues(void *a1, const char *a2, ...)
{
  return [a1 metricKeysAndValues];
}

id objc_msgSend_metricQueue(void *a1, const char *a2, ...)
{
  return [a1 metricQueue];
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return [a1 minute];
}

id objc_msgSend_modeSemanticType(void *a1, const char *a2, ...)
{
  return [a1 modeSemanticType];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return [a1 model];
}

id objc_msgSend_monitorPluggedInState(void *a1, const char *a2, ...)
{
  return [a1 monitorPluggedInState];
}

id objc_msgSend_monotonicTimestamp(void *a1, const char *a2, ...)
{
  return [a1 monotonicTimestamp];
}

id objc_msgSend_mostRecentBootTime(void *a1, const char *a2, ...)
{
  return [a1 mostRecentBootTime];
}

id objc_msgSend_motionState(void *a1, const char *a2, ...)
{
  return [a1 motionState];
}

id objc_msgSend_motionStream(void *a1, const char *a2, ...)
{
  return [a1 motionStream];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_namespace(void *a1, const char *a2, ...)
{
  return [a1 namespace];
}

id objc_msgSend_nearbyDevices(void *a1, const char *a2, ...)
{
  return [a1 nearbyDevices];
}

id objc_msgSend_nextEvaluationDate(void *a1, const char *a2, ...)
{
  return [a1 nextEvaluationDate];
}

id objc_msgSend_nextEventForTopOffProtectionStream(void *a1, const char *a2, ...)
{
  return [a1 nextEventForTopOffProtectionStream];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_nextProbabilities(void *a1, const char *a2, ...)
{
  return [a1 nextProbabilities];
}

id objc_msgSend_noTransferSizeSpecified(void *a1, const char *a2, ...)
{
  return [a1 noTransferSizeSpecified];
}

id objc_msgSend_none(void *a1, const char *a2, ...)
{
  return [a1 none];
}

id objc_msgSend_notChargingReason(void *a1, const char *a2, ...)
{
  return [a1 notChargingReason];
}

id objc_msgSend_noteEvaluationTime(void *a1, const char *a2, ...)
{
  return [a1 noteEvaluationTime];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_nowPlayingStream(void *a1, const char *a2, ...)
{
  return [a1 nowPlayingStream];
}

id objc_msgSend_nrDeviceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 nrDeviceIdentifier];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_number2Value(void *a1, const char *a2, ...)
{
  return [a1 number2Value];
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 objectEnumerator];
}

id objc_msgSend_obtainActiveComplications(void *a1, const char *a2, ...)
{
  return [a1 obtainActiveComplications];
}

id objc_msgSend_occurrences(void *a1, const char *a2, ...)
{
  return [a1 occurrences];
}

id objc_msgSend_offsetInFile(void *a1, const char *a2, ...)
{
  return [a1 offsetInFile];
}

id objc_msgSend_onlyPreemptiveSuspend(void *a1, const char *a2, ...)
{
  return [a1 onlyPreemptiveSuspend];
}

id objc_msgSend_optedIn(void *a1, const char *a2, ...)
{
  return [a1 optedIn];
}

id objc_msgSend_overrideRateLimiting(void *a1, const char *a2, ...)
{
  return [a1 overrideRateLimiting];
}

id objc_msgSend_overwritesPrevious(void *a1, const char *a2, ...)
{
  return [a1 overwritesPrevious];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_parentBundleID(void *a1, const char *a2, ...)
{
  return [a1 parentBundleID];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pausedParameters(void *a1, const char *a2, ...)
{
  return [a1 pausedParameters];
}

id objc_msgSend_pecRateLimitConfiguration(void *a1, const char *a2, ...)
{
  return [a1 pecRateLimitConfiguration];
}

id objc_msgSend_pendingActivities(void *a1, const char *a2, ...)
{
  return [a1 pendingActivities];
}

id objc_msgSend_pendingTasks(void *a1, const char *a2, ...)
{
  return [a1 pendingTasks];
}

id objc_msgSend_pendingUnregistration(void *a1, const char *a2, ...)
{
  return [a1 pendingUnregistration];
}

id objc_msgSend_pendingWidgets(void *a1, const char *a2, ...)
{
  return [a1 pendingWidgets];
}

id objc_msgSend_percentCompleted(void *a1, const char *a2, ...)
{
  return [a1 percentCompleted];
}

id objc_msgSend_persistApplicationProcessHandles(void *a1, const char *a2, ...)
{
  return [a1 persistApplicationProcessHandles];
}

id objc_msgSend_persistence(void *a1, const char *a2, ...)
{
  return [a1 persistence];
}

id objc_msgSend_persistentStores(void *a1, const char *a2, ...)
{
  return [a1 persistentStores];
}

id objc_msgSend_photosFocalAppStateChangedPredicate(void *a1, const char *a2, ...)
{
  return [a1 photosFocalAppStateChangedPredicate];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return [a1 pid];
}

id objc_msgSend_platform(void *a1, const char *a2, ...)
{
  return [a1 platform];
}

id objc_msgSend_playing(void *a1, const char *a2, ...)
{
  return [a1 playing];
}

id objc_msgSend_pluginDelegate(void *a1, const char *a2, ...)
{
  return [a1 pluginDelegate];
}

id objc_msgSend_pluginLikelihood(void *a1, const char *a2, ...)
{
  return [a1 pluginLikelihood];
}

id objc_msgSend_pluginMapKey(void *a1, const char *a2, ...)
{
  return [a1 pluginMapKey];
}

id objc_msgSend_pluginTimeline(void *a1, const char *a2, ...)
{
  return [a1 pluginTimeline];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return [a1 pointerValue];
}

id objc_msgSend_policyDecision(void *a1, const char *a2, ...)
{
  return [a1 policyDecision];
}

id objc_msgSend_policyDescription(void *a1, const char *a2, ...)
{
  return [a1 policyDescription];
}

id objc_msgSend_policyInstance(void *a1, const char *a2, ...)
{
  return [a1 policyInstance];
}

id objc_msgSend_policyName(void *a1, const char *a2, ...)
{
  return [a1 policyName];
}

id objc_msgSend_policyResponseMetadata(void *a1, const char *a2, ...)
{
  return [a1 policyResponseMetadata];
}

id objc_msgSend_policyScores(void *a1, const char *a2, ...)
{
  return [a1 policyScores];
}

id objc_msgSend_populateFeatureStatusFromPast(void *a1, const char *a2, ...)
{
  return [a1 populateFeatureStatusFromPast];
}

id objc_msgSend_powerAssertions(void *a1, const char *a2, ...)
{
  return [a1 powerAssertions];
}

id objc_msgSend_ppsIDMapping(void *a1, const char *a2, ...)
{
  return [a1 ppsIDMapping];
}

id objc_msgSend_preClearedMode(void *a1, const char *a2, ...)
{
  return [a1 preClearedMode];
}

id objc_msgSend_predicateForLaunchActivities(void *a1, const char *a2, ...)
{
  return [a1 predicateForLaunchActivities];
}

id objc_msgSend_predicateForPendingActivities(void *a1, const char *a2, ...)
{
  return [a1 predicateForPendingActivities];
}

id objc_msgSend_predicateForStartedActivities(void *a1, const char *a2, ...)
{
  return [a1 predicateForStartedActivities];
}

id objc_msgSend_predicateMatchingLaunchServicesProcesses(void *a1, const char *a2, ...)
{
  return [a1 predicateMatchingLaunchServicesProcesses];
}

id objc_msgSend_predicateMatchingProcessTypeApplication(void *a1, const char *a2, ...)
{
  return [a1 predicateMatchingProcessTypeApplication];
}

id objc_msgSend_predictedOptimalScore(void *a1, const char *a2, ...)
{
  return [a1 predictedOptimalScore];
}

id objc_msgSend_predictedOptimalStartDate(void *a1, const char *a2, ...)
{
  return [a1 predictedOptimalStartDate];
}

id objc_msgSend_predictedPluggedInterval(void *a1, const char *a2, ...)
{
  return [a1 predictedPluggedInterval];
}

id objc_msgSend_predictionForDeviceActivity(void *a1, const char *a2, ...)
{
  return [a1 predictionForDeviceActivity];
}

id objc_msgSend_predictionForDeviceNearby(void *a1, const char *a2, ...)
{
  return [a1 predictionForDeviceNearby];
}

id objc_msgSend_predictionForDevicePluggedIn(void *a1, const char *a2, ...)
{
  return [a1 predictionForDevicePluggedIn];
}

id objc_msgSend_predictionGenerationQueue(void *a1, const char *a2, ...)
{
  return [a1 predictionGenerationQueue];
}

id objc_msgSend_predictionKey(void *a1, const char *a2, ...)
{
  return [a1 predictionKey];
}

id objc_msgSend_predictor(void *a1, const char *a2, ...)
{
  return [a1 predictor];
}

id objc_msgSend_prerunningTasks(void *a1, const char *a2, ...)
{
  return [a1 prerunningTasks];
}

id objc_msgSend_preventDeviceSleep(void *a1, const char *a2, ...)
{
  return [a1 preventDeviceSleep];
}

id objc_msgSend_prewarmCount(void *a1, const char *a2, ...)
{
  return [a1 prewarmCount];
}

id objc_msgSend_prewarmRecommendations(void *a1, const char *a2, ...)
{
  return [a1 prewarmRecommendations];
}

id objc_msgSend_prewarmingDataCollectionStartDate(void *a1, const char *a2, ...)
{
  return [a1 prewarmingDataCollectionStartDate];
}

id objc_msgSend_printLowLikelihoodRegions(void *a1, const char *a2, ...)
{
  return [a1 printLowLikelihoodRegions];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_privateNetworkCellConnection(void *a1, const char *a2, ...)
{
  return [a1 privateNetworkCellConnection];
}

id objc_msgSend_process(void *a1, const char *a2, ...)
{
  return [a1 process];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processImagePath(void *a1, const char *a2, ...)
{
  return [a1 processImagePath];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_processingTaskIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 processingTaskIdentifiers];
}

id objc_msgSend_producedResultIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 producedResultIdentifiers];
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return [a1 productID];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_protectionClass(void *a1, const char *a2, ...)
{
  return [a1 protectionClass];
}

id objc_msgSend_protectionType(void *a1, const char *a2, ...)
{
  return [a1 protectionType];
}

id objc_msgSend_pruneStreamOfGroup(void *a1, const char *a2, ...)
{
  return [a1 pruneStreamOfGroup];
}

id objc_msgSend_pruner(void *a1, const char *a2, ...)
{
  return [a1 pruner];
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return [a1 publisher];
}

id objc_msgSend_publishers(void *a1, const char *a2, ...)
{
  return [a1 publishers];
}

id objc_msgSend_purgeableSpaceMap(void *a1, const char *a2, ...)
{
  return [a1 purgeableSpaceMap];
}

id objc_msgSend_queryAndUpdateCurrentConsoleModeState(void *a1, const char *a2, ...)
{
  return [a1 queryAndUpdateCurrentConsoleModeState];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_queueCancelActivitiesForAllApps(void *a1, const char *a2, ...)
{
  return [a1 queueCancelActivitiesForAllApps];
}

id objc_msgSend_queueObtainAppsEligibleForBackgroundFetch(void *a1, const char *a2, ...)
{
  return [a1 queueObtainAppsEligibleForBackgroundFetch];
}

id objc_msgSend_queuePendingRefreshes(void *a1, const char *a2, ...)
{
  return [a1 queuePendingRefreshes];
}

id objc_msgSend_queueReloadRequestedDelays(void *a1, const char *a2, ...)
{
  return [a1 queueReloadRequestedDelays];
}

id objc_msgSend_queueStartIfBAREnabled(void *a1, const char *a2, ...)
{
  return [a1 queueStartIfBAREnabled];
}

id objc_msgSend_rate(void *a1, const char *a2, ...)
{
  return [a1 rate];
}

id objc_msgSend_rateLimitConfigurationName(void *a1, const char *a2, ...)
{
  return [a1 rateLimitConfigurationName];
}

id objc_msgSend_rateLimitConfigurations(void *a1, const char *a2, ...)
{
  return [a1 rateLimitConfigurations];
}

id objc_msgSend_rateLimits(void *a1, const char *a2, ...)
{
  return [a1 rateLimits];
}

id objc_msgSend_ratelimitTrackers(void *a1, const char *a2, ...)
{
  return [a1 ratelimitTrackers];
}

id objc_msgSend_rationale(void *a1, const char *a2, ...)
{
  return [a1 rationale];
}

id objc_msgSend_rationaleWithAllSystemConditions(void *a1, const char *a2, ...)
{
  return [a1 rationaleWithAllSystemConditions];
}

id objc_msgSend_rawScore(void *a1, const char *a2, ...)
{
  return [a1 rawScore];
}

id objc_msgSend_readFromDefaults(void *a1, const char *a2, ...)
{
  return [a1 readFromDefaults];
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return [a1 reason];
}

id objc_msgSend_recalculateStartDates(void *a1, const char *a2, ...)
{
  return [a1 recalculateStartDates];
}

id objc_msgSend_recommendations(void *a1, const char *a2, ...)
{
  return [a1 recommendations];
}

id objc_msgSend_recordBARState(void *a1, const char *a2, ...)
{
  return [a1 recordBARState];
}

id objc_msgSend_recordBatteryStatus(void *a1, const char *a2, ...)
{
  return [a1 recordBatteryStatus];
}

id objc_msgSend_recordMotionStatus(void *a1, const char *a2, ...)
{
  return [a1 recordMotionStatus];
}

id objc_msgSend_recordNetworkStatus(void *a1, const char *a2, ...)
{
  return [a1 recordNetworkStatus];
}

id objc_msgSend_recordPowerManagementStatus(void *a1, const char *a2, ...)
{
  return [a1 recordPowerManagementStatus];
}

id objc_msgSend_recordResumesAndLaunches(void *a1, const char *a2, ...)
{
  return [a1 recordResumesAndLaunches];
}

id objc_msgSend_recordSessionAnalytics(void *a1, const char *a2, ...)
{
  return [a1 recordSessionAnalytics];
}

id objc_msgSend_recordValue(void *a1, const char *a2, ...)
{
  return [a1 recordValue];
}

id objc_msgSend_refetchInterval(void *a1, const char *a2, ...)
{
  return [a1 refetchInterval];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_refreshApplicationActivationCounts(void *a1, const char *a2, ...)
{
  return [a1 refreshApplicationActivationCounts];
}

id objc_msgSend_refreshApplicationActivationInformation(void *a1, const char *a2, ...)
{
  return [a1 refreshApplicationActivationInformation];
}

id objc_msgSend_refreshApplicationSpringboardVisibility(void *a1, const char *a2, ...)
{
  return [a1 refreshApplicationSpringboardVisibility];
}

id objc_msgSend_refreshLedgerInformationForApplicationProcesses(void *a1, const char *a2, ...)
{
  return [a1 refreshLedgerInformationForApplicationProcesses];
}

id objc_msgSend_registerDailyModelUpdateTask(void *a1, const char *a2, ...)
{
  return [a1 registerDailyModelUpdateTask];
}

id objc_msgSend_registerDailyTimer(void *a1, const char *a2, ...)
{
  return [a1 registerDailyTimer];
}

id objc_msgSend_registerFeatureStatusTask(void *a1, const char *a2, ...)
{
  return [a1 registerFeatureStatusTask];
}

id objc_msgSend_registerForActivities(void *a1, const char *a2, ...)
{
  return [a1 registerForActivities];
}

id objc_msgSend_registerForAppKilledNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForAppKilledNotifications];
}

id objc_msgSend_registerForBARNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForBARNotifications];
}

id objc_msgSend_registerForBacklightUpdates(void *a1, const char *a2, ...)
{
  return [a1 registerForBacklightUpdates];
}

id objc_msgSend_registerForBlueListNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForBlueListNotifications];
}

id objc_msgSend_registerForCacheDeletePurgeableSpaceNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForCacheDeletePurgeableSpaceNotifications];
}

id objc_msgSend_registerForComplicationChangeNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForComplicationChangeNotifications];
}

id objc_msgSend_registerForModeChanges(void *a1, const char *a2, ...)
{
  return [a1 registerForModeChanges];
}

id objc_msgSend_registerForNetworkPathEvaluation(void *a1, const char *a2, ...)
{
  return [a1 registerForNetworkPathEvaluation];
}

id objc_msgSend_registerForSmartPowerNapNotifications(void *a1, const char *a2, ...)
{
  return [a1 registerForSmartPowerNapNotifications];
}

id objc_msgSend_registerForTrial(void *a1, const char *a2, ...)
{
  return [a1 registerForTrial];
}

id objc_msgSend_registerReportTaskInfoTask(void *a1, const char *a2, ...)
{
  return [a1 registerReportTaskInfoTask];
}

id objc_msgSend_registerTimeChangeNotification(void *a1, const char *a2, ...)
{
  return [a1 registerTimeChangeNotification];
}

id objc_msgSend_registerTriggers(void *a1, const char *a2, ...)
{
  return [a1 registerTriggers];
}

id objc_msgSend_reinstantiateConfiguredBudgets(void *a1, const char *a2, ...)
{
  return [a1 reinstantiateConfiguredBudgets];
}

id objc_msgSend_relatedApplications(void *a1, const char *a2, ...)
{
  return [a1 relatedApplications];
}

id objc_msgSend_relevancy(void *a1, const char *a2, ...)
{
  return [a1 relevancy];
}

id objc_msgSend_reloadRequestedDelays(void *a1, const char *a2, ...)
{
  return [a1 reloadRequestedDelays];
}

id objc_msgSend_remoteDevice(void *a1, const char *a2, ...)
{
  return [a1 remoteDevice];
}

id objc_msgSend_remoteDevices(void *a1, const char *a2, ...)
{
  return [a1 remoteDevices];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_remoteWidgetBudget(void *a1, const char *a2, ...)
{
  return [a1 remoteWidgetBudget];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeInactiveAssertions(void *a1, const char *a2, ...)
{
  return [a1 removeInactiveAssertions];
}

id objc_msgSend_reportAppResumePredictions(void *a1, const char *a2, ...)
{
  return [a1 reportAppResumePredictions];
}

id objc_msgSend_reportBlockersStatisticsOnExpiration(void *a1, const char *a2, ...)
{
  return [a1 reportBlockersStatisticsOnExpiration];
}

id objc_msgSend_reportDependencyInfoForTasks(void *a1, const char *a2, ...)
{
  return [a1 reportDependencyInfoForTasks];
}

id objc_msgSend_reportFeatureCodesForTasks(void *a1, const char *a2, ...)
{
  return [a1 reportFeatureCodesForTasks];
}

id objc_msgSend_reportFeatureStatus(void *a1, const char *a2, ...)
{
  return [a1 reportFeatureStatus];
}

id objc_msgSend_reportPolicyBlockingReasonsForIntensiveTasksToPPS(void *a1, const char *a2, ...)
{
  return [a1 reportPolicyBlockingReasonsForIntensiveTasksToPPS];
}

id objc_msgSend_reportSuccessOnEvaluation(void *a1, const char *a2, ...)
{
  return [a1 reportSuccessOnEvaluation];
}

id objc_msgSend_reportTaskBecomingEligible(void *a1, const char *a2, ...)
{
  return [a1 reportTaskBecomingEligible];
}

id objc_msgSend_reportTaskExpiration(void *a1, const char *a2, ...)
{
  return [a1 reportTaskExpiration];
}

id objc_msgSend_requestInterruptionBlock(void *a1, const char *a2, ...)
{
  return [a1 requestInterruptionBlock];
}

id objc_msgSend_requestsApplicationLaunch(void *a1, const char *a2, ...)
{
  return [a1 requestsApplicationLaunch];
}

id objc_msgSend_requestsExtensionLaunch(void *a1, const char *a2, ...)
{
  return [a1 requestsExtensionLaunch];
}

id objc_msgSend_requestsNewsstandLaunch(void *a1, const char *a2, ...)
{
  return [a1 requestsNewsstandLaunch];
}

id objc_msgSend_requiredBudgetNames(void *a1, const char *a2, ...)
{
  return [a1 requiredBudgetNames];
}

id objc_msgSend_requiredBudgetsInfo(void *a1, const char *a2, ...)
{
  return [a1 requiredBudgetsInfo];
}

id objc_msgSend_requiresBuddyComplete(void *a1, const char *a2, ...)
{
  return [a1 requiresBuddyComplete];
}

id objc_msgSend_requiresDeviceInactivity(void *a1, const char *a2, ...)
{
  return [a1 requiresDeviceInactivity];
}

id objc_msgSend_requiresExternalPower(void *a1, const char *a2, ...)
{
  return [a1 requiresExternalPower];
}

id objc_msgSend_requiresInexpensiveNetworking(void *a1, const char *a2, ...)
{
  return [a1 requiresInexpensiveNetworking];
}

id objc_msgSend_requiresMinimumBatteryLevel(void *a1, const char *a2, ...)
{
  return [a1 requiresMinimumBatteryLevel];
}

id objc_msgSend_requiresMinimumDataBudgetPercentage(void *a1, const char *a2, ...)
{
  return [a1 requiresMinimumDataBudgetPercentage];
}

id objc_msgSend_requiresNetwork(void *a1, const char *a2, ...)
{
  return [a1 requiresNetwork];
}

id objc_msgSend_requiresPlugin(void *a1, const char *a2, ...)
{
  return [a1 requiresPlugin];
}

id objc_msgSend_requiresRemoteDeviceWake(void *a1, const char *a2, ...)
{
  return [a1 requiresRemoteDeviceWake];
}

id objc_msgSend_requiresSignificantUserInactivity(void *a1, const char *a2, ...)
{
  return [a1 requiresSignificantUserInactivity];
}

id objc_msgSend_requiresStrictDarkBoot(void *a1, const char *a2, ...)
{
  return [a1 requiresStrictDarkBoot];
}

id objc_msgSend_requiresUnconstrainedNetworking(void *a1, const char *a2, ...)
{
  return [a1 requiresUnconstrainedNetworking];
}

id objc_msgSend_requiresUserInactivity(void *a1, const char *a2, ...)
{
  return [a1 requiresUserInactivity];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resetAccumulation(void *a1, const char *a2, ...)
{
  return [a1 resetAccumulation];
}

id objc_msgSend_resetAnalyticsState(void *a1, const char *a2, ...)
{
  return [a1 resetAnalyticsState];
}

id objc_msgSend_resetBARMetric(void *a1, const char *a2, ...)
{
  return [a1 resetBARMetric];
}

id objc_msgSend_resetBudgets(void *a1, const char *a2, ...)
{
  return [a1 resetBudgets];
}

id objc_msgSend_resetConnection(void *a1, const char *a2, ...)
{
  return [a1 resetConnection];
}

id objc_msgSend_resetCurrentEligibilityWindow(void *a1, const char *a2, ...)
{
  return [a1 resetCurrentEligibilityWindow];
}

id objc_msgSend_resetDutyCyclingEffort(void *a1, const char *a2, ...)
{
  return [a1 resetDutyCyclingEffort];
}

id objc_msgSend_resetFastPassDependencies(void *a1, const char *a2, ...)
{
  return [a1 resetFastPassDependencies];
}

id objc_msgSend_resetFeatureDurations(void *a1, const char *a2, ...)
{
  return [a1 resetFeatureDurations];
}

id objc_msgSend_resetInitialAction(void *a1, const char *a2, ...)
{
  return [a1 resetInitialAction];
}

id objc_msgSend_resetOnlyPreemptiveSuspend(void *a1, const char *a2, ...)
{
  return [a1 resetOnlyPreemptiveSuspend];
}

id objc_msgSend_resetSFIEffort(void *a1, const char *a2, ...)
{
  return [a1 resetSFIEffort];
}

id objc_msgSend_resetState(void *a1, const char *a2, ...)
{
  return [a1 resetState];
}

id objc_msgSend_resetTriggerReport(void *a1, const char *a2, ...)
{
  return [a1 resetTriggerReport];
}

id objc_msgSend_resources(void *a1, const char *a2, ...)
{
  return [a1 resources];
}

id objc_msgSend_resourcesDescription(void *a1, const char *a2, ...)
{
  return [a1 resourcesDescription];
}

id objc_msgSend_responseOptions(void *a1, const char *a2, ...)
{
  return [a1 responseOptions];
}

id objc_msgSend_restoreApplicationProcessHandles(void *a1, const char *a2, ...)
{
  return [a1 restoreApplicationProcessHandles];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resultCount(void *a1, const char *a2, ...)
{
  return [a1 resultCount];
}

id objc_msgSend_resultIdentifier(void *a1, const char *a2, ...)
{
  return [a1 resultIdentifier];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeCount(void *a1, const char *a2, ...)
{
  return [a1 resumeCount];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return [a1 reverseObjectEnumerator];
}

id objc_msgSend_runOnAppForeground(void *a1, const char *a2, ...)
{
  return [a1 runOnAppForeground];
}

id objc_msgSend_runPeriodicRelaunchTask(void *a1, const char *a2, ...)
{
  return [a1 runPeriodicRelaunchTask];
}

id objc_msgSend_runUpdateRecentlyUsedPhotosAppDevicesTask(void *a1, const char *a2, ...)
{
  return [a1 runUpdateRecentlyUsedPhotosAppDevicesTask];
}

id objc_msgSend_runningTasks(void *a1, const char *a2, ...)
{
  return [a1 runningTasks];
}

id objc_msgSend_saveCarbonImpactWindowState(void *a1, const char *a2, ...)
{
  return [a1 saveCarbonImpactWindowState];
}

id objc_msgSend_savePriorityQueue(void *a1, const char *a2, ...)
{
  return [a1 savePriorityQueue];
}

id objc_msgSend_saveState(void *a1, const char *a2, ...)
{
  return [a1 saveState];
}

id objc_msgSend_saveSubmittedRateLimitConfiguration(void *a1, const char *a2, ...)
{
  return [a1 saveSubmittedRateLimitConfiguration];
}

id objc_msgSend_schedule(void *a1, const char *a2, ...)
{
  return [a1 schedule];
}

id objc_msgSend_scheduleDASTelemetryActivities(void *a1, const char *a2, ...)
{
  return [a1 scheduleDASTelemetryActivities];
}

id objc_msgSend_schedulePeriodicRelaunchTask(void *a1, const char *a2, ...)
{
  return [a1 schedulePeriodicRelaunchTask];
}

id objc_msgSend_scheduleTelemetry(void *a1, const char *a2, ...)
{
  return [a1 scheduleTelemetry];
}

id objc_msgSend_scheduleUpdateRecentlyUsedPhotosAppDevices(void *a1, const char *a2, ...)
{
  return [a1 scheduleUpdateRecentlyUsedPhotosAppDevices];
}

id objc_msgSend_schedulerRecommendedApplications(void *a1, const char *a2, ...)
{
  return [a1 schedulerRecommendedApplications];
}

id objc_msgSend_schedulingPriority(void *a1, const char *a2, ...)
{
  return [a1 schedulingPriority];
}

id objc_msgSend_score(void *a1, const char *a2, ...)
{
  return [a1 score];
}

id objc_msgSend_scoreSpecification(void *a1, const char *a2, ...)
{
  return [a1 scoreSpecification];
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return [a1 second];
}

id objc_msgSend_secondsFromGMT(void *a1, const char *a2, ...)
{
  return [a1 secondsFromGMT];
}

id objc_msgSend_semanticVersion(void *a1, const char *a2, ...)
{
  return [a1 semanticVersion];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_serviceWithDefaultShellEndpoint(void *a1, const char *a2, ...)
{
  return [a1 serviceWithDefaultShellEndpoint];
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return [a1 sessionID];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setClassCUnlockMonitor(void *a1, const char *a2, ...)
{
  return [a1 setClassCUnlockMonitor];
}

id objc_msgSend_setCurrentEligibilityWindowEnd(void *a1, const char *a2, ...)
{
  return [a1 setCurrentEligibilityWindowEnd];
}

id objc_msgSend_setCurrentEligibilityWindowStart(void *a1, const char *a2, ...)
{
  return [a1 setCurrentEligibilityWindowStart];
}

id objc_msgSend_setDefaultExcludedApplications(void *a1, const char *a2, ...)
{
  return [a1 setDefaultExcludedApplications];
}

id objc_msgSend_setTaskCompleted(void *a1, const char *a2, ...)
{
  return [a1 setTaskCompleted];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return [a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_setupDailyTask(void *a1, const char *a2, ...)
{
  return [a1 setupDailyTask];
}

id objc_msgSend_setupDatabaseMaintenance(void *a1, const char *a2, ...)
{
  return [a1 setupDatabaseMaintenance];
}

id objc_msgSend_setupPrewarmSuspendListener(void *a1, const char *a2, ...)
{
  return [a1 setupPrewarmSuspendListener];
}

id objc_msgSend_setupPublisher(void *a1, const char *a2, ...)
{
  return [a1 setupPublisher];
}

id objc_msgSend_setupResetTimer(void *a1, const char *a2, ...)
{
  return [a1 setupResetTimer];
}

id objc_msgSend_setupTimers(void *a1, const char *a2, ...)
{
  return [a1 setupTimers];
}

id objc_msgSend_sharedBacklight(void *a1, const char *a2, ...)
{
  return [a1 sharedBacklight];
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return [a1 sharedClient];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedDefaultEvaluator(void *a1, const char *a2, ...)
{
  return [a1 sharedDefaultEvaluator];
}

id objc_msgSend_sharedEventQueue(void *a1, const char *a2, ...)
{
  return [a1 sharedEventQueue];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedKnowledgeStore(void *a1, const char *a2, ...)
{
  return [a1 sharedKnowledgeStore];
}

id objc_msgSend_sharedLimiter(void *a1, const char *a2, ...)
{
  return [a1 sharedLimiter];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_sharedPredictor(void *a1, const char *a2, ...)
{
  return [a1 sharedPredictor];
}

id objc_msgSend_sharedScheduler(void *a1, const char *a2, ...)
{
  return [a1 sharedScheduler];
}

id objc_msgSend_shortDescription(void *a1, const char *a2, ...)
{
  return [a1 shortDescription];
}

id objc_msgSend_shouldBePersisted(void *a1, const char *a2, ...)
{
  return [a1 shouldBePersisted];
}

id objc_msgSend_shouldBlueListPushes(void *a1, const char *a2, ...)
{
  return [a1 shouldBlueListPushes];
}

id objc_msgSend_shouldGenerateSpotlightProgressTTRForDevice(void *a1, const char *a2, ...)
{
  return [a1 shouldGenerateSpotlightProgressTTRForDevice];
}

id objc_msgSend_shouldResetDurations(void *a1, const char *a2, ...)
{
  return [a1 shouldResetDurations];
}

id objc_msgSend_shouldWakeDevice(void *a1, const char *a2, ...)
{
  return [a1 shouldWakeDevice];
}

id objc_msgSend_signpostTimestamp(void *a1, const char *a2, ...)
{
  return [a1 signpostTimestamp];
}

id objc_msgSend_skipEvaluationIfUnplugged(void *a1, const char *a2, ...)
{
  return [a1 skipEvaluationIfUnplugged];
}

id objc_msgSend_smartDataModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 smartDataModeEnabled];
}

id objc_msgSend_solicitActivityResubmission(void *a1, const char *a2, ...)
{
  return [a1 solicitActivityResubmission];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sourceForStream(void *a1, const char *a2, ...)
{
  return [a1 sourceForStream];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startAfter(void *a1, const char *a2, ...)
{
  return [a1 startAfter];
}

id objc_msgSend_startBatteryTemperatureLoop(void *a1, const char *a2, ...)
{
  return [a1 startBatteryTemperatureLoop];
}

id objc_msgSend_startBefore(void *a1, const char *a2, ...)
{
  return [a1 startBefore];
}

id objc_msgSend_startChargeRateLoop(void *a1, const char *a2, ...)
{
  return [a1 startChargeRateLoop];
}

id objc_msgSend_startConditions(void *a1, const char *a2, ...)
{
  return [a1 startConditions];
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return [a1 startDate];
}

id objc_msgSend_startEvent(void *a1, const char *a2, ...)
{
  return [a1 startEvent];
}

id objc_msgSend_startHandler(void *a1, const char *a2, ...)
{
  return [a1 startHandler];
}

id objc_msgSend_startIfBAREnabled(void *a1, const char *a2, ...)
{
  return [a1 startIfBAREnabled];
}

id objc_msgSend_startKilling(void *a1, const char *a2, ...)
{
  return [a1 startKilling];
}

id objc_msgSend_startTimer(void *a1, const char *a2, ...)
{
  return [a1 startTimer];
}

id objc_msgSend_startedActivities(void *a1, const char *a2, ...)
{
  return [a1 startedActivities];
}

id objc_msgSend_startedDASActivities(void *a1, const char *a2, ...)
{
  return [a1 startedDASActivities];
}

id objc_msgSend_startedTasks(void *a1, const char *a2, ...)
{
  return [a1 startedTasks];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stateString(void *a1, const char *a2, ...)
{
  return [a1 stateString];
}

id objc_msgSend_staticPriority(void *a1, const char *a2, ...)
{
  return [a1 staticPriority];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stopKilling(void *a1, const char *a2, ...)
{
  return [a1 stopKilling];
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return [a1 store];
}

id objc_msgSend_storeConfig(void *a1, const char *a2, ...)
{
  return [a1 storeConfig];
}

id objc_msgSend_stream(void *a1, const char *a2, ...)
{
  return [a1 stream];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_submitDate(void *a1, const char *a2, ...)
{
  return [a1 submitDate];
}

id objc_msgSend_submittedConfigurations(void *a1, const char *a2, ...)
{
  return [a1 submittedConfigurations];
}

id objc_msgSend_submittedTaskCount(void *a1, const char *a2, ...)
{
  return [a1 submittedTaskCount];
}

id objc_msgSend_suggestedConfidenceCategory(void *a1, const char *a2, ...)
{
  return [a1 suggestedConfidenceCategory];
}

id objc_msgSend_suggestionLayoutFromCache(void *a1, const char *a2, ...)
{
  return [a1 suggestionLayoutFromCache];
}

id objc_msgSend_suggestions(void *a1, const char *a2, ...)
{
  return [a1 suggestions];
}

id objc_msgSend_supportsAnyApplication(void *a1, const char *a2, ...)
{
  return [a1 supportsAnyApplication];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return [a1 suspend];
}

id objc_msgSend_suspendRequestDate(void *a1, const char *a2, ...)
{
  return [a1 suspendRequestDate];
}

id objc_msgSend_suspendable(void *a1, const char *a2, ...)
{
  return [a1 suspendable];
}

id objc_msgSend_suspensionReason(void *a1, const char *a2, ...)
{
  return [a1 suspensionReason];
}

id objc_msgSend_syncRequested(void *a1, const char *a2, ...)
{
  return [a1 syncRequested];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemMemoryPressure(void *a1, const char *a2, ...)
{
  return [a1 systemMemoryPressure];
}

id objc_msgSend_targetDevice(void *a1, const char *a2, ...)
{
  return [a1 targetDevice];
}

id objc_msgSend_taskIdentifier(void *a1, const char *a2, ...)
{
  return [a1 taskIdentifier];
}

id objc_msgSend_taskIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 taskIdentifiers];
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return [a1 taskState];
}

id objc_msgSend_tasksNoLongerEligible(void *a1, const char *a2, ...)
{
  return [a1 tasksNoLongerEligible];
}

id objc_msgSend_tempDelay(void *a1, const char *a2, ...)
{
  return [a1 tempDelay];
}

id objc_msgSend_terminalEvent(void *a1, const char *a2, ...)
{
  return [a1 terminalEvent];
}

id objc_msgSend_testModeParameters(void *a1, const char *a2, ...)
{
  return [a1 testModeParameters];
}

id objc_msgSend_testingOverride(void *a1, const char *a2, ...)
{
  return [a1 testingOverride];
}

id objc_msgSend_timeInMinutesSinceLastEvaluation(void *a1, const char *a2, ...)
{
  return [a1 timeInMinutesSinceLastEvaluation];
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

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return [a1 timer];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_top10Hits(void *a1, const char *a2, ...)
{
  return [a1 top10Hits];
}

id objc_msgSend_top1Hits(void *a1, const char *a2, ...)
{
  return [a1 top1Hits];
}

id objc_msgSend_top3Hits(void *a1, const char *a2, ...)
{
  return [a1 top3Hits];
}

id objc_msgSend_top5Hits(void *a1, const char *a2, ...)
{
  return [a1 top5Hits];
}

id objc_msgSend_topNPrediction(void *a1, const char *a2, ...)
{
  return [a1 topNPrediction];
}

id objc_msgSend_totalLaunchActivationTime(void *a1, const char *a2, ...)
{
  return [a1 totalLaunchActivationTime];
}

id objc_msgSend_totalPredictionIntervals(void *a1, const char *a2, ...)
{
  return [a1 totalPredictionIntervals];
}

id objc_msgSend_totalResumeActivationTime(void *a1, const char *a2, ...)
{
  return [a1 totalResumeActivationTime];
}

id objc_msgSend_transferSize(void *a1, const char *a2, ...)
{
  return [a1 transferSize];
}

id objc_msgSend_transferSizeType(void *a1, const char *a2, ...)
{
  return [a1 transferSizeType];
}

id objc_msgSend_transitionDate(void *a1, const char *a2, ...)
{
  return [a1 transitionDate];
}

id objc_msgSend_transitionDates(void *a1, const char *a2, ...)
{
  return [a1 transitionDates];
}

id objc_msgSend_treatmentID(void *a1, const char *a2, ...)
{
  return [a1 treatmentID];
}

id objc_msgSend_treatmentId(void *a1, const char *a2, ...)
{
  return [a1 treatmentId];
}

id objc_msgSend_triggers(void *a1, const char *a2, ...)
{
  return [a1 triggers];
}

id objc_msgSend_triggersRestart(void *a1, const char *a2, ...)
{
  return [a1 triggersRestart];
}

id objc_msgSend_trySchedulingBefore(void *a1, const char *a2, ...)
{
  return [a1 trySchedulingBefore];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unCenter(void *a1, const char *a2, ...)
{
  return [a1 unCenter];
}

id objc_msgSend_underlyingAssertion(void *a1, const char *a2, ...)
{
  return [a1 underlyingAssertion];
}

id objc_msgSend_uniqueGroupName(void *a1, const char *a2, ...)
{
  return [a1 uniqueGroupName];
}

id objc_msgSend_unload(void *a1, const char *a2, ...)
{
  return [a1 unload];
}

id objc_msgSend_unnotifiedIsDataAvailableForClassC(void *a1, const char *a2, ...)
{
  return [a1 unnotifiedIsDataAvailableForClassC];
}

id objc_msgSend_unregisterForRemoteDeviceActiveNotifications(void *a1, const char *a2, ...)
{
  return [a1 unregisterForRemoteDeviceActiveNotifications];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_updateBudgetsForNextSlot(void *a1, const char *a2, ...)
{
  return [a1 updateBudgetsForNextSlot];
}

id objc_msgSend_updateCurrentRecommendations(void *a1, const char *a2, ...)
{
  return [a1 updateCurrentRecommendations];
}

id objc_msgSend_updateFactors(void *a1, const char *a2, ...)
{
  return [a1 updateFactors];
}

id objc_msgSend_updateKernelWithDASIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 updateKernelWithDASIdentifiers];
}

id objc_msgSend_updateModel(void *a1, const char *a2, ...)
{
  return [a1 updateModel];
}

id objc_msgSend_updatePolicy(void *a1, const char *a2, ...)
{
  return [a1 updatePolicy];
}

id objc_msgSend_updatePredictedInterval(void *a1, const char *a2, ...)
{
  return [a1 updatePredictedInterval];
}

id objc_msgSend_updateRecentApplications(void *a1, const char *a2, ...)
{
  return [a1 updateRecentApplications];
}

id objc_msgSend_updateScores(void *a1, const char *a2, ...)
{
  return [a1 updateScores];
}

id objc_msgSend_updateTimeline(void *a1, const char *a2, ...)
{
  return [a1 updateTimeline];
}

id objc_msgSend_updateTrialParameters(void *a1, const char *a2, ...)
{
  return [a1 updateTrialParameters];
}

id objc_msgSend_uploadSize(void *a1, const char *a2, ...)
{
  return [a1 uploadSize];
}

id objc_msgSend_uptime(void *a1, const char *a2, ...)
{
  return [a1 uptime];
}

id objc_msgSend_uptimeSeconds(void *a1, const char *a2, ...)
{
  return [a1 uptimeSeconds];
}

id objc_msgSend_usageTimeline(void *a1, const char *a2, ...)
{
  return [a1 usageTimeline];
}

id objc_msgSend_useStatisticalModelForTriggersRestart(void *a1, const char *a2, ...)
{
  return [a1 useStatisticalModelForTriggersRestart];
}

id objc_msgSend_userContext(void *a1, const char *a2, ...)
{
  return [a1 userContext];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userRequestedBackupKeyPath(void *a1, const char *a2, ...)
{
  return [a1 userRequestedBackupKeyPath];
}

id objc_msgSend_userRequestedBackupTask(void *a1, const char *a2, ...)
{
  return [a1 userRequestedBackupTask];
}

id objc_msgSend_utility(void *a1, const char *a2, ...)
{
  return [a1 utility];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_validClassesForUserInfoSerialization(void *a1, const char *a2, ...)
{
  return [a1 validClassesForUserInfoSerialization];
}

id objc_msgSend_validityDuration(void *a1, const char *a2, ...)
{
  return [a1 validityDuration];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_wakeState(void *a1, const char *a2, ...)
{
  return [a1 wakeState];
}

id objc_msgSend_wakeStateDescription(void *a1, const char *a2, ...)
{
  return [a1 wakeStateDescription];
}

id objc_msgSend_warningHandler(void *a1, const char *a2, ...)
{
  return [a1 warningHandler];
}

id objc_msgSend_wasDeferred(void *a1, const char *a2, ...)
{
  return [a1 wasDeferred];
}

id objc_msgSend_wasForceRun(void *a1, const char *a2, ...)
{
  return [a1 wasForceRun];
}

id objc_msgSend_watchIsPaired(void *a1, const char *a2, ...)
{
  return [a1 watchIsPaired];
}

id objc_msgSend_weekday(void *a1, const char *a2, ...)
{
  return [a1 weekday];
}

id objc_msgSend_widgetBudgetID(void *a1, const char *a2, ...)
{
  return [a1 widgetBudgetID];
}

id objc_msgSend_widgetBudgetModulator(void *a1, const char *a2, ...)
{
  return [a1 widgetBudgetModulator];
}

id objc_msgSend_widgetID(void *a1, const char *a2, ...)
{
  return [a1 widgetID];
}

id objc_msgSend_widgetRefreshBudgetManager(void *a1, const char *a2, ...)
{
  return [a1 widgetRefreshBudgetManager];
}

id objc_msgSend_widgetRefreshUsageTracker(void *a1, const char *a2, ...)
{
  return [a1 widgetRefreshUsageTracker];
}

id objc_msgSend_wifiPredictionTimeline(void *a1, const char *a2, ...)
{
  return [a1 wifiPredictionTimeline];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_zNormalizeArray_intoQuantizedVector_withScaleFactor_(void *a1, const char *a2, ...)
{
  return [a1 zNormalizeArray:intoQuantizedVector:withScaleFactor:];
}