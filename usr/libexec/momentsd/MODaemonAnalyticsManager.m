@interface MODaemonAnalyticsManager
- (MODaemonAnalyticsManager)initWithUniverse:(id)a3;
- (NSNumber)optInDNU;
- (NSNumber)optInIHA;
- (NSNumber)stateOnCharger;
- (NSNumber)stateUnlocked;
- (OS_dispatch_queue)queue;
- (id)calculateDeltaTime:(id)a3 fromPreviousTime:(id)a4 withBinArray:(id)a5;
- (id)checkTriggerSuccess:(id)a3;
- (id)getDaemonPlistFileURL;
- (id)readPersistenceTable:(id)a3;
- (void)getDaemonPlistFileURL;
- (void)persistDaemonMetrics:(id)a3 withData:(id)a4;
- (void)sendDataToCoreAnalytics:(id)a3;
- (void)setOptInDNU:(id)a3;
- (void)setOptInIHA:(id)a3;
- (void)setStateOnCharger:(id)a3;
- (void)setStateUnlocked:(id)a3;
@end

@implementation MODaemonAnalyticsManager

- (MODaemonAnalyticsManager)initWithUniverse:(id)a3
{
  id v5 = a3;
  v53.receiver = self;
  v53.super_class = (Class)MODaemonAnalyticsManager;
  v6 = [(MODaemonAnalyticsManager *)&v53 init];
  if (v6)
  {
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("MODaemonAnalyticsQueue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    uint64_t v47 = 0;
    v48 = &v47;
    uint64_t v49 = 0x3032000000;
    v50 = __Block_byref_object_copy__20;
    v51 = __Block_byref_object_dispose__20;
    id v52 = [(MODaemonAnalyticsManager *)v6 getDaemonPlistFileURL];
    v10 = [(MODaemonAnalyticsManager *)v6 readPersistenceTable:v48[5]];
    v11 = v10;
    if (v10) {
      id v12 = [v10 mutableCopy];
    }
    else {
      id v12 = objc_alloc_init((Class)NSMutableDictionary);
    }
    v14 = v12;
    v15 = +[NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
    [v14 setObject:v15 forKey:@"lastLaunch"];

    [(MODaemonAnalyticsManager *)v6 persistDaemonMetrics:v48[5] withData:v14];
    v16 = +[MOMetric binsFromStart:&off_1002F5900 toEnd:&off_1002F9880 gap:&off_1002F9890];
    uint64_t v17 = +[MOMetric binsFromStart:&off_1002F98A0 toEnd:&off_1002F98B0 gap:&off_1002F98C0];
    v39 = [v16 arrayByAddingObjectsFromArray:v17];
    v38 = (void *)v17;
    v18 = (objc_class *)objc_opt_class();
    v19 = NSStringFromClass(v18);
    v20 = [v5 getService:v19];

    v21 = [v5 getService:@"EventRefreshSchedulerNotifier"];
    v40 = [v5 getService:@"DaemonClientNotifier"];
    if (v20)
    {
      if (v21)
      {
        if (v40)
        {
          v22 = [[MODispatcher alloc] initWithNotifier:v20];
          v23 = [[MODispatcher alloc] initWithNotifier:v21];
          v36 = v16;
          v37 = v11;
          v24 = [[MODispatcher alloc] initWithNotifier:v40];
          v45[0] = _NSConcreteStackBlock;
          v45[1] = 3221225472;
          v45[2] = __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke;
          v45[3] = &unk_1002CE8B8;
          v25 = v6;
          v46 = v25;
          v26 = objc_retainBlock(v45);
          [(MODispatcher *)v22 registerForNotification:4 withHandler:v26];
          [(MODispatcher *)v22 registerForNotification:1 withHandler:v26];
          [(MODispatcher *)v22 registerForNotification:3 withHandler:v26];
          [(MODispatcher *)v22 registerForNotification:2 withHandler:v26];
          v35 = v21;
          v41[0] = _NSConcreteStackBlock;
          v41[1] = 3221225472;
          v41[2] = __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_84;
          v41[3] = &unk_1002CE928;
          v27 = v25;
          v42 = v27;
          v44 = &v47;
          id v43 = v39;
          v28 = objc_retainBlock(v41);
          [(MODispatcher *)v23 registerForNotification:2 withHandler:v28];
          [(MODispatcher *)v23 registerForNotification:3 withHandler:v28];
          [(MODispatcher *)v23 registerForNotification:5 withHandler:v28];
          [(MODispatcher *)v23 registerForNotification:4 withHandler:v28];
          [(MODispatcher *)v24 registerForNotification:0 withHandler:v28];
          [(MODispatcher *)v24 registerForNotification:1 withHandler:v28];
          [(MODispatcher *)v24 registerForNotification:2 withHandler:v28];
          [(MODispatcher *)v24 registerForNotification:3 withHandler:v28];
          [(MODispatcher *)v24 registerForNotification:4 withHandler:v28];
          [(MODispatcher *)v24 registerForNotification:5 withHandler:v28];
          v29 = v27;
          v30 = v23;
          v13 = v29;

          v16 = v36;
          v11 = v37;
          v21 = v35;
LABEL_20:

          _Block_object_dispose(&v47, 8);
          goto LABEL_21;
        }
        v33 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          -[MODaemonAnalyticsManager initWithUniverse:]();
        }

        v22 = +[NSAssertionHandler currentHandler];
        [(MODispatcher *)v22 handleFailureInMethod:a2 object:v6 file:@"MODaemonAnalyticsManager.m" lineNumber:82 description:@"Invalid parameter not satisfying: daemonClientNotifier"];
      }
      else
      {
        v32 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
          -[MODaemonAnalyticsManager initWithUniverse:]();
        }

        v22 = +[NSAssertionHandler currentHandler];
        [(MODispatcher *)v22 handleFailureInMethod:a2 object:v6 file:@"MODaemonAnalyticsManager.m" lineNumber:81 description:@"Invalid parameter not satisfying: eventRefreshSchedulerNotifier"];
      }
    }
    else
    {
      v31 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[MODaemonAnalyticsManager initWithUniverse:]();
      }

      v22 = +[NSAssertionHandler currentHandler];
      [(MODispatcher *)v22 handleFailureInMethod:a2 object:v6 file:@"MODaemonAnalyticsManager.m" lineNumber:80 description:@"Invalid parameter not satisfying: darwinNotifier"];
    }
    v13 = 0;
    goto LABEL_20;
  }
  v13 = 0;
LABEL_21:

  return v13;
}

void __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  v6 = (void *)os_transaction_create();
  switch(a2)
  {
    case 1:
      v7 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Managed configuration changed %@", (uint8_t *)&v12, 0xCu);
      }

      dispatch_queue_t v8 = [v5 objectForKey:@"optInDNU"];
      [*(id *)(a1 + 32) setOptInDNU:v8];

      v9 = [v5 objectForKey:@"optInIHA"];
      [*(id *)(a1 + 32) setOptInIHA:v9];
      goto LABEL_13;
    case 2:
      v10 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Locked status changed %@", (uint8_t *)&v12, 0xCu);
      }

      v9 = [v5 objectForKey:@"stateUnlocked"];
      [*(id *)(a1 + 32) setStateUnlocked:v9];
      goto LABEL_13;
    case 3:
      v9 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "First unlock triggered", (uint8_t *)&v12, 2u);
      }
      goto LABEL_13;
    case 4:
      v11 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Battery status changed %@", (uint8_t *)&v12, 0xCu);
      }

      v9 = [v5 objectForKey:@"stateOnCharger"];
      [*(id *)(a1 + 32) setStateOnCharger:v9];
LABEL_13:

      break;
    default:
      break;
  }
}

void __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_84(uint64_t a1, int a2, void *a3)
{
  id v109 = a3;
  v139[0] = 0;
  v139[1] = v139;
  v139[2] = 0x3032000000;
  v139[3] = __Block_byref_object_copy__20;
  v139[4] = __Block_byref_object_dispose__20;
  id v140 = (id)os_transaction_create();
  if (v109) {
    id v5 = [v109 mutableCopy];
  }
  else {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v6 = v5;
  v7 = [v5 allKeys:v109];
  v142[0] = @"stateDatabaseAvailable";
  v142[1] = @"resultWorkoutsSuccess";
  v142[2] = @"resultMindfulSessionsSuccess";
  v142[3] = @"resultPeopleDiscoverySuccess";
  v142[4] = @"resultPeopleCountSuccess";
  v142[5] = @"resultPeopleDensitySuccess";
  v142[6] = @"resultVisitsSuccess";
  v142[7] = @"resultVisitsTrainingSuccess";
  v142[8] = @"resultPhotosSuccess";
  v142[9] = @"resultSharedPhotosSuccess";
  v142[10] = @"resultTopicsSuccess";
  v142[11] = @"resultSharedSuccess";
  v142[12] = @"resultSuggestedSuccess";
  v142[13] = @"resultTripsSuccess";
  v142[14] = @"resultMusicSuccess";
  v142[15] = @"resultContactsSuccess";
  v142[16] = @"resultMotionSuccess";
  v142[17] = @"resultLifeEventsSuccess";
  +[NSArray arrayWithObjects:v142 count:18];
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = [v8 countByEnumeratingWithState:&v135 objects:v141 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v136;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v136 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void *)(*((void *)&v135 + 1) + 8 * i);
        if (([v7 containsObject:v12] & 1) == 0) {
          [v6 setObject:&__kCFBooleanTrue forKey:v12];
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v135 objects:v141 count:16];
    }
    while (v9);
  }

  if (([v7 containsObject:@"resultOverallSuccess"] & 1) == 0)
  {
    id v13 = [*(id *)(a1 + 32) checkTriggerSuccess:v6];
    [v6 setObject:v13 forKey:@"resultOverallSuccess"];
  }
  v14 = [v6 objectForKey:@"resultNumberOfEvents"];
  BOOL v15 = v14 == 0;

  if (v15) {
    [v6 setObject:&off_1002F5900 forKey:@"resultNumberOfEvents"];
  }
  v16 = [v6 objectForKey:@"resultNumberOfBundleEvents"];
  BOOL v17 = v16 == 0;

  if (v17) {
    [v6 setObject:&off_1002F5900 forKey:@"resultNumberOfBundleEvents"];
  }
  v18 = [*(id *)(a1 + 32) readPersistenceTable:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  id v111 = [v18 mutableCopy];
  double Current = CFAbsoluteTimeGetCurrent();
  v20 = [v6 objectForKey:@"resultOverallSuccess"];

  v21 = [v18 objectForKey:@"lastTrigger"];

  if (v21)
  {
    v22 = *(void **)(a1 + 32);
    v23 = +[NSNumber numberWithDouble:Current];
    v24 = [v18 objectForKey:@"lastTrigger"];
    v25 = [v22 calculateDeltaTime:v23 fromPreviousTime:v24 withBinArray:*(void *)(a1 + 40)];
    [v6 setObject:v25 forKey:@"triggerTimeSinceLastTrigger"];
  }
  else
  {
    [v6 setObject:&off_1002F5918 forKey:@"triggerTimeSinceLastTrigger"];
  }
  v26 = +[NSNumber numberWithDouble:Current];
  [v111 setObject:v26 forKey:@"lastTrigger"];

  if (v20)
  {
    v27 = [v18 objectForKey:@"lastSuccessfulTrigger"];

    if (v27)
    {
      v28 = *(void **)(a1 + 32);
      v29 = +[NSNumber numberWithDouble:Current];
      v30 = [v18 objectForKey:@"lastSuccessfulTrigger"];
      v31 = [v28 calculateDeltaTime:v29 fromPreviousTime:v30 withBinArray:*(void *)(a1 + 40)];
      [v6 setObject:v31 forKey:@"triggerTimeSinceLastSuccessfulTrigger"];
    }
    else
    {
      [v6 setObject:&off_1002F5918 forKey:@"triggerTimeSinceLastSuccessfulTrigger"];
    }
    v32 = +[NSNumber numberWithDouble:Current];
    [v111 setObject:v32 forKey:@"lastSuccessfulTrigger"];
  }
  v33 = [v18 objectForKey:@"lastLaunch"];

  if (v33)
  {
    v34 = *(void **)(a1 + 32);
    v35 = +[NSNumber numberWithDouble:Current];
    v36 = [v18 objectForKey:@"lastLaunch"];
    v37 = [v34 calculateDeltaTime:v35 fromPreviousTime:v36 withBinArray:*(void *)(a1 + 40)];
    [v6 setObject:v37 forKey:@"triggerTimeSinceLastLaunch"];
  }
  else
  {
    v35 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_84_cold_1();
    }
  }

  switch(a2)
  {
    case 0:
      [v6 setObject:@"fetch" forKey:@"triggerReason"];
      v38 = [v18 objectForKey:@"lastFetchTrigger"];

      if (v38)
      {
        v39 = *(void **)(a1 + 32);
        v40 = +[NSNumber numberWithDouble:Current];
        v41 = [v18 objectForKey:@"lastFetchTrigger"];
        v42 = [v39 calculateDeltaTime:v40 fromPreviousTime:v41 withBinArray:*(void *)(a1 + 40)];
        [v6 setObject:v42 forKey:@"triggerTimeSinceLastSimilarTrigger"];
      }
      else
      {
        [v6 setObject:&off_1002F5918 forKey:@"triggerTimeSinceLastSimilarTrigger"];
        [v6 setObject:&off_1002F5918 forKey:@"triggerTimeSinceLastSuccessfulSimilarTrigger"];
      }
      if (v20)
      {
        v68 = [v18 objectForKey:@"lastSuccessfulFetchTrigger"];

        if (v68)
        {
          v69 = *(void **)(a1 + 32);
          v70 = +[NSNumber numberWithDouble:Current];
          v71 = [v18 objectForKey:@"lastSuccessfulFetchTrigger"];
          v72 = [v69 calculateDeltaTime:v70 fromPreviousTime:v71 withBinArray:*(void *)(a1 + 40)];
          [v6 setObject:v72 forKey:@"triggerTimeSinceLastSuccessfulSimilarTrigger"];
        }
        v73 = +[NSNumber numberWithDouble:Current];
        [v111 setObject:v73 forKey:@"lastSuccessfulFetchTrigger"];
      }
      v74 = +[NSNumber numberWithDouble:Current];
      [v111 setObject:v74 forKey:@"lastFetchTrigger"];
      goto LABEL_80;
    case 1:
      [v6 setObject:@"fetchBundle" forKey:@"triggerReason"];
      v58 = [v18 objectForKey:@"lastFetchBundleTrigger"];

      if (v58)
      {
        v59 = *(void **)(a1 + 32);
        v60 = +[NSNumber numberWithDouble:Current];
        v61 = [v18 objectForKey:@"lastFetchBundleTrigger"];
        v62 = [v59 calculateDeltaTime:v60 fromPreviousTime:v61 withBinArray:*(void *)(a1 + 40)];
        [v6 setObject:v62 forKey:@"triggerTimeSinceLastSimilarTrigger"];
      }
      else
      {
        [v6 setObject:&off_1002F5918 forKey:@"triggerTimeSinceLastSimilarTrigger"];
        [v6 setObject:&off_1002F5918 forKey:@"triggerTimeSinceLastSuccessfulSimilarTrigger"];
      }
      if (v20)
      {
        v93 = [v18 objectForKey:@"lastSuccessfulFetchBundleTrigger"];

        if (v93)
        {
          v94 = *(void **)(a1 + 32);
          v95 = +[NSNumber numberWithDouble:Current];
          v96 = [v18 objectForKey:@"lastSuccessfulFetchBundleTrigger"];
          v97 = [v94 calculateDeltaTime:v95 fromPreviousTime:v96 withBinArray:*(void *)(a1 + 40)];
          [v6 setObject:v97 forKey:@"triggerTimeSinceLastSuccessfulSimilarTrigger"];
        }
        v98 = +[NSNumber numberWithDouble:Current];
        [v111 setObject:v98 forKey:@"lastSuccessfulFetchBundleTrigger"];
      }
      v74 = +[NSNumber numberWithDouble:Current];
      [v111 setObject:v74 forKey:@"lastFetchBundleTrigger"];
      goto LABEL_80;
    case 2:
      [v6 setObject:@"collect" forKey:@"triggerReason"];
      id v43 = [v18 objectForKey:@"lastCollectTrigger"];

      if (v43)
      {
        v44 = *(void **)(a1 + 32);
        v45 = +[NSNumber numberWithDouble:Current];
        v46 = [v18 objectForKey:@"lastCollectTrigger"];
        uint64_t v47 = [v44 calculateDeltaTime:v45 fromPreviousTime:v46 withBinArray:*(void *)(a1 + 40)];
        [v6 setObject:v47 forKey:@"triggerTimeSinceLastSimilarTrigger"];
      }
      else
      {
        [v6 setObject:&off_1002F5918 forKey:@"triggerTimeSinceLastSimilarTrigger"];
        [v6 setObject:&off_1002F5918 forKey:@"triggerTimeSinceLastSuccessfulSimilarTrigger"];
      }
      if (v20)
      {
        v75 = [v18 objectForKey:@"lastCollectSuccessfulTrigger"];

        if (v75)
        {
          v76 = *(void **)(a1 + 32);
          v77 = +[NSNumber numberWithDouble:Current];
          v78 = [v18 objectForKey:@"lastCollectSuccessfulTrigger"];
          v79 = [v76 calculateDeltaTime:v77 fromPreviousTime:v78 withBinArray:*(void *)(a1 + 40)];
          [v6 setObject:v79 forKey:@"triggerTimeSinceLastSuccessfulSimilarTrigger"];
        }
        v80 = +[NSNumber numberWithDouble:Current];
        [v111 setObject:v80 forKey:@"lastCollectSuccessfulTrigger"];
      }
      v74 = +[NSNumber numberWithDouble:Current];
      [v111 setObject:v74 forKey:@"lastCollectTrigger"];
      goto LABEL_80;
    case 3:
      [v6 setObject:@"compute" forKey:@"triggerReason"];
      v48 = [v18 objectForKey:@"lastComputeTrigger"];

      if (v48)
      {
        uint64_t v49 = *(void **)(a1 + 32);
        v50 = +[NSNumber numberWithDouble:Current];
        v51 = [v18 objectForKey:@"lastComputeTrigger"];
        id v52 = [v49 calculateDeltaTime:v50 fromPreviousTime:v51 withBinArray:*(void *)(a1 + 40)];
        [v6 setObject:v52 forKey:@"triggerTimeSinceLastSimilarTrigger"];
      }
      else
      {
        [v6 setObject:&off_1002F5918 forKey:@"triggerTimeSinceLastSimilarTrigger"];
        [v6 setObject:&off_1002F5918 forKey:@"triggerTimeSinceLastSuccessfulSimilarTrigger"];
      }
      if (v20)
      {
        v81 = [v18 objectForKey:@"lastComputeSuccessfulTrigger"];

        if (v81)
        {
          v82 = *(void **)(a1 + 32);
          v83 = +[NSNumber numberWithDouble:Current];
          v84 = [v18 objectForKey:@"lastComputeSuccessfulTrigger"];
          v85 = [v82 calculateDeltaTime:v83 fromPreviousTime:v84 withBinArray:*(void *)(a1 + 40)];
          [v6 setObject:v85 forKey:@"triggerTimeSinceLastSuccessfulSimilarTrigger"];
        }
        v86 = +[NSNumber numberWithDouble:Current];
        [v111 setObject:v86 forKey:@"lastComputeSuccessfulTrigger"];
      }
      v74 = +[NSNumber numberWithDouble:Current];
      [v111 setObject:v74 forKey:@"lastComputeTrigger"];
      goto LABEL_80;
    case 4:
      [v6 setObject:@"purge" forKey:@"triggerReason"];
      objc_super v53 = [v18 objectForKey:@"lastPurgeTrigger"];

      if (v53)
      {
        v54 = *(void **)(a1 + 32);
        v55 = +[NSNumber numberWithDouble:Current];
        v56 = [v18 objectForKey:@"lastPurgeTrigger"];
        v57 = [v54 calculateDeltaTime:v55 fromPreviousTime:v56 withBinArray:*(void *)(a1 + 40)];
        [v6 setObject:v57 forKey:@"triggerTimeSinceLastSimilarTrigger"];
      }
      else
      {
        [v6 setObject:&off_1002F5918 forKey:@"triggerTimeSinceLastSimilarTrigger"];
        [v6 setObject:&off_1002F5918 forKey:@"triggerTimeSinceLastSuccessfulSimilarTrigger"];
      }
      if (v20)
      {
        v87 = [v18 objectForKey:@"lastPurgeSuccessfulTrigger"];

        if (v87)
        {
          v88 = *(void **)(a1 + 32);
          v89 = +[NSNumber numberWithDouble:Current];
          v90 = [v18 objectForKey:@"lastPurgeSuccessfulTrigger"];
          v91 = [v88 calculateDeltaTime:v89 fromPreviousTime:v90 withBinArray:*(void *)(a1 + 40)];
          [v6 setObject:v91 forKey:@"triggerTimeSinceLastSuccessfulSimilarTrigger"];
        }
        v92 = +[NSNumber numberWithDouble:Current];
        [v111 setObject:v92 forKey:@"lastPurgeSuccessfulTrigger"];
      }
      v74 = +[NSNumber numberWithDouble:Current];
      [v111 setObject:v74 forKey:@"lastPurgeTrigger"];
      goto LABEL_80;
    case 5:
      [v6 setObject:@"trends" forKey:@"triggerReason"];
      v63 = [v18 objectForKey:@"lastTrendsTrigger"];

      if (v63)
      {
        v64 = *(void **)(a1 + 32);
        v65 = +[NSNumber numberWithDouble:Current];
        v66 = [v18 objectForKey:@"lastTrendsTrigger"];
        v67 = [v64 calculateDeltaTime:v65 fromPreviousTime:v66 withBinArray:*(void *)(a1 + 40)];
        [v6 setObject:v67 forKey:@"triggerTimeSinceLastSimilarTrigger"];
      }
      else
      {
        [v6 setObject:&off_1002F5918 forKey:@"triggerTimeSinceLastSimilarTrigger"];
        [v6 setObject:&off_1002F5918 forKey:@"triggerTimeSinceLastSuccessfulSimilarTrigger"];
      }
      if (v20)
      {
        v99 = [v18 objectForKey:@"lastTrendsSuccessfulTrigger"];

        if (v99)
        {
          v100 = *(void **)(a1 + 32);
          v101 = +[NSNumber numberWithDouble:Current];
          v102 = [v18 objectForKey:@"lastTrendsSuccessfulTrigger"];
          v103 = [v100 calculateDeltaTime:v101 fromPreviousTime:v102 withBinArray:*(void *)(a1 + 40)];
          [v6 setObject:v103 forKey:@"triggerTimeSinceLastSuccessfulSimilarTrigger"];
        }
        v104 = +[NSNumber numberWithDouble:Current];
        [v111 setObject:v104 forKey:@"lastTrendsSuccessfulTrigger"];
      }
      v74 = +[NSNumber numberWithDouble:Current];
      [v111 setObject:v74 forKey:@"lastTrendsTrigger"];
LABEL_80:

      [*(id *)(a1 + 32) persistDaemonMetrics:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) withData:v111];
      break;
    default:
      break;
  }
  v133[0] = 0;
  v133[1] = v133;
  v133[2] = 0x2020000000;
  int v134 = 0;
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x2020000000;
  int v132 = 5;
  v129[0] = 0;
  v129[1] = v129;
  v129[2] = 0x2020000000;
  int v130 = 3;
  uint64_t v123 = 0;
  v124 = &v123;
  uint64_t v125 = 0x3032000000;
  v126 = __Block_byref_object_copy__89;
  v127 = __Block_byref_object_dispose__90;
  v128 = &__block_literal_global_23;
  v121[0] = 0;
  v121[1] = v121;
  v121[2] = 0x2020000000;
  uint32_t v122 = 0;
  uint32_t v122 = arc4random_uniform(0x64u);
  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472;
  v112[2] = __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_2;
  v112[3] = &unk_1002CE900;
  v115 = v133;
  v116 = v131;
  id v113 = *(id *)(a1 + 32);
  v117 = v121;
  id v105 = v6;
  id v114 = v105;
  v118 = &v123;
  v119 = v139;
  v120 = v129;
  v106 = objc_retainBlock(v112);
  v107 = objc_retainBlock(v106);
  v108 = (void *)v124[5];
  v124[5] = (uint64_t)v107;

  if (v106) {
    ((void (*)(void *))v106[2])(v106);
  }

  _Block_object_dispose(v121, 8);
  _Block_object_dispose(&v123, 8);

  _Block_object_dispose(v129, 8);
  _Block_object_dispose(v131, 8);
  _Block_object_dispose(v133, 8);

  _Block_object_dispose(v139, 8);
}

void __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_2(uint64_t a1)
{
  if (*(int *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) > 4)
  {
    id v13 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_2_cold_1(a1, v13);
    }

    v14 = [*(id *)(a1 + 32) optInDNU];

    if (v14)
    {
      BOOL v15 = *(void **)(a1 + 40);
      v16 = [*(id *)(a1 + 32) optInDNU];
      [v15 setObject:v16 forKey:@"optInDNU"];
    }
    BOOL v17 = [*(id *)(a1 + 32) optInIHA];

    if (v17)
    {
      v18 = *(void **)(a1 + 40);
      v19 = [*(id *)(a1 + 32) optInIHA];
      [v18 setObject:v19 forKey:@"optInIHA"];
    }
    v20 = [*(id *)(a1 + 32) stateOnCharger];

    if (!v20) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  uint64_t v2 = [*(id *)(a1 + 32) optInDNU];
  if (v2)
  {
    v3 = (void *)v2;
    uint64_t v4 = [*(id *)(a1 + 32) optInIHA];
    if (v4)
    {
      id v5 = (void *)v4;
      v6 = [*(id *)(a1 + 32) stateOnCharger];

      if (v6)
      {
        v7 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
          *(_DWORD *)buf = 67109120;
          int v37 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Darwin properties are all set for block ID: %u. Sending payload to CoreAnalytics!", buf, 8u);
        }

        id v9 = *(void **)(a1 + 40);
        uint64_t v10 = [*(id *)(a1 + 32) optInDNU];
        [v9 setObject:v10 forKey:@"optInDNU"];

        v11 = *(void **)(a1 + 40);
        uint64_t v12 = [*(id *)(a1 + 32) optInIHA];
        [v11 setObject:v12 forKey:@"optInIHA"];

LABEL_15:
        v21 = *(void **)(a1 + 40);
        v22 = [*(id *)(a1 + 32) stateOnCharger];
        [v21 setObject:v22 forKey:@"stateOnCharger"];

LABEL_16:
        v23 = [*(id *)(a1 + 32) stateUnlocked];

        if (v23)
        {
          v24 = *(void **)(a1 + 40);
          v25 = [*(id *)(a1 + 32) stateUnlocked];
          [v24 setObject:v25 forKey:@"stateUnlocked"];
        }
        [*(id *)(a1 + 32) sendDataToCoreAnalytics:*(void *)(a1 + 40)];
        uint64_t v26 = *(void *)(*(void *)(a1 + 72) + 8);
        v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = 0;

        uint64_t v28 = *(void *)(*(void *)(a1 + 80) + 8);
        v29 = *(NSObject **)(v28 + 40);
        *(void *)(v28 + 40) = 0;
        goto LABEL_23;
      }
    }
    else
    {
    }
  }
  v30 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    int v31 = *(_DWORD *)(*(void *)(*(void *)(a1 + 88) + 8) + 24);
    int v32 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v33 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    *(_DWORD *)buf = 67109632;
    int v37 = v31;
    __int16 v38 = 1024;
    int v39 = v32;
    __int16 v40 = 1024;
    int v41 = v33;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Darwin properties are not all set, scheduling a delay for %i seconds. This happened %i time(s) before for block ID: %u.", buf, 0x14u);
  }

  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  dispatch_time_t v34 = dispatch_time(0, 1000000000 * *(int *)(*(void *)(*(void *)(a1 + 88) + 8) + 24));
  v29 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_93;
  block[3] = &unk_1002CB4F0;
  block[4] = *(void *)(a1 + 72);
  dispatch_after(v34, v29, block);
LABEL_23:
}

void __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_93(uint64_t a1)
{
  v1 = (void (**)(void))objc_retainBlock(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  if (v1)
  {
    uint64_t v2 = v1;
    v1[2]();
    v1 = v2;
  }
}

- (id)checkTriggerSuccess:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 objectForKey:@"resultWorkoutsSuccess"];
  if (![v4 BOOLValue]) {
    goto LABEL_24;
  }
  id v5 = [v3 objectForKey:@"resultMindfulSessionsSuccess"];
  if (![v5 BOOLValue])
  {
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  v6 = [v3 objectForKey:@"resultVisitsSuccess"];
  if (![v6 BOOLValue])
  {
LABEL_22:

    goto LABEL_23;
  }
  v7 = [v3 objectForKey:@"resultVisitsTrainingSuccess"];
  if (![v7 BOOLValue])
  {
LABEL_21:

    goto LABEL_22;
  }
  int v8 = [v3 objectForKey:@"resultPhotosSuccess"];
  if (![v8 BOOLValue])
  {
LABEL_20:

    goto LABEL_21;
  }
  id v9 = [v3 objectForKey:@"resultSharedPhotosSuccess"];
  if (![v9 BOOLValue])
  {
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v10 = [v3 objectForKey:@"resultTopicsSuccess"];
  if (![v10 BOOLValue])
  {
LABEL_18:

    goto LABEL_19;
  }
  v11 = [v3 objectForKey:@"resultSharedSuccess"];
  if (![v11 BOOLValue])
  {
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v12 = [v3 objectForKey:@"resultSuggestedSuccess"];
  if (![v12 BOOLValue])
  {
LABEL_16:

    goto LABEL_17;
  }
  v22 = v12;
  id v13 = [v3 objectForKey:@"resultTripsSuccess"];
  if (![v13 BOOLValue])
  {

    uint64_t v12 = v22;
    goto LABEL_16;
  }
  v21 = v13;
  v20 = [v3 objectForKey:@"resultMusicSuccess"];
  if ([v20 BOOLValue])
  {
    v19 = [v3 objectForKey:@"resultContactsSuccess"];
    if ([v19 BOOLValue])
    {
      v18 = [v3 objectForKey:@"stateDatabaseAvailable"];
      if ([v18 BOOLValue])
      {
        BOOL v17 = [v3 objectForKey:@"resultLifeEventsSuccess"];
        unsigned __int8 v14 = [v17 BOOLValue];
      }
      else
      {
        unsigned __int8 v14 = 0;
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  if (v14)
  {
    BOOL v15 = &__kCFBooleanTrue;
    goto LABEL_26;
  }
LABEL_25:
  BOOL v15 = &__kCFBooleanFalse;
LABEL_26:

  return v15;
}

- (id)calculateDeltaTime:(id)a3 fromPreviousTime:(id)a4 withBinArray:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v19 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MODaemonAnalyticsManager calculateDeltaTime:fromPreviousTime:withBinArray:]();
    }

    v20 = +[NSAssertionHandler currentHandler];
    BOOL v17 = v20;
    CFStringRef v21 = @"Invalid parameter not satisfying: currentTime != nil";
    SEL v22 = a2;
    v23 = self;
    uint64_t v24 = 400;
    goto LABEL_14;
  }
  if (!v10)
  {
    v25 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MODaemonAnalyticsManager calculateDeltaTime:fromPreviousTime:withBinArray:]();
    }

    v20 = +[NSAssertionHandler currentHandler];
    BOOL v17 = v20;
    CFStringRef v21 = @"Invalid parameter not satisfying: lastTime != nil";
    SEL v22 = a2;
    v23 = self;
    uint64_t v24 = 401;
LABEL_14:
    [v20 handleFailureInMethod:v22 object:v23 file:@"MODaemonAnalyticsManager.m" lineNumber:v24 description:v21];
    v18 = 0;
    goto LABEL_15;
  }
  [v9 doubleValue];
  double v13 = v12;
  [v10 doubleValue];
  double v15 = v13 - v14;
  if (v15 < 0.0)
  {
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Time of previous trigger is after the current time.", v27, 2u);
    }
  }
  BOOL v17 = +[NSNumber numberWithDouble:v15];
  v18 = +[MOMetric binForNumber:v17 bins:v11];
LABEL_15:

  return v18;
}

- (id)readPersistenceTable:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[NSFileManager defaultManager];
  id v5 = [v3 path];
  unsigned int v6 = [v4 fileExistsAtPath:v5];

  v7 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v19 = @"daemonTriggerPersistence.plist";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "File %@ found.", buf, 0xCu);
    }

    id v17 = 0;
    id v9 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v3 error:&v17];
    id v10 = v17;
    if (v10)
    {
      id v11 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MODaemonAnalyticsManager readPersistenceTable:]((uint64_t)v10, v11);
      }

      uint64_t v16 = 0;
      [v4 removeItemAtURL:v3 error:&v16];
      if (v16)
      {
        double v12 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          -[MODaemonAnalyticsManager readPersistenceTable:]();
        }
      }
      id v13 = objc_alloc_init((Class)NSDictionary);
    }
    else
    {
      id v13 = v9;
    }
    id v14 = v13;
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No plist found at path.", buf, 2u);
    }

    id v14 = objc_alloc_init((Class)NSDictionary);
  }

  return v14;
}

- (void)persistDaemonMetrics:(id)a3 withData:(id)a4
{
  if (a3)
  {
    id v9 = 0;
    unsigned __int8 v4 = [a4 writeToURL:a3 error:&v9];
    id v5 = v9;
    unsigned int v6 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
    v7 = v6;
    if (v5 || (v4 & 1) == 0)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[MODaemonAnalyticsManager persistDaemonMetrics:withData:]((uint64_t)v5, v7);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "daemon metrics were successfully written to plist.", v8, 2u);
    }
  }
  else
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MODaemonAnalyticsManager persistDaemonMetrics:withData:]();
    }
  }
}

- (id)getDaemonPlistFileURL
{
  uint64_t v2 = +[MOPersistenceManager userCacheDirectoryPath];
  if (v2)
  {
    id v3 = +[NSURL fileURLWithPath:v2 isDirectory:1];
    unsigned __int8 v4 = [v3 URLByAppendingPathComponent:@"daemonTriggerPersistence.plist"];
  }
  else
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityDaemonAnalyticsManager);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MODaemonAnalyticsManager getDaemonPlistFileURL]();
    }

    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)sendDataToCoreAnalytics:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

id __52__MODaemonAnalyticsManager_sendDataToCoreAnalytics___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSNumber)optInDNU
{
  return self->_optInDNU;
}

- (void)setOptInDNU:(id)a3
{
}

- (NSNumber)optInIHA
{
  return self->_optInIHA;
}

- (void)setOptInIHA:(id)a3
{
}

- (NSNumber)stateOnCharger
{
  return self->_stateOnCharger;
}

- (void)setStateOnCharger:(id)a3
{
}

- (NSNumber)stateUnlocked
{
  return self->_stateUnlocked;
}

- (void)setStateUnlocked:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateUnlocked, 0);
  objc_storeStrong((id *)&self->_stateOnCharger, 0);
  objc_storeStrong((id *)&self->_optInIHA, 0);
  objc_storeStrong((id *)&self->_optInDNU, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithUniverse:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: darwinNotifier", v2, v3, v4, v5, v6);
}

- (void)initWithUniverse:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: eventRefreshSchedulerNotifier", v2, v3, v4, v5, v6);
}

- (void)initWithUniverse:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: daemonClientNotifier", v2, v3, v4, v5, v6);
}

void __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_84_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Unexpected error: plist did not have last launch time.", v2, v3, v4, v5, v6);
}

void __45__MODaemonAnalyticsManager_initWithUniverse___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = *(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Giving up waiting - darwin property(s) not set for block ID: %u. Sending to CoreAnalytics with missing field(s)", (uint8_t *)v3, 8u);
}

- (void)calculateDeltaTime:fromPreviousTime:withBinArray:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: currentTime != nil", v2, v3, v4, v5, v6);
}

- (void)calculateDeltaTime:fromPreviousTime:withBinArray:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: lastTime != nil", v2, v3, v4, v5, v6);
}

- (void)readPersistenceTable:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "Could not delete plist file.", v2, v3, v4, v5, v6);
}

- (void)readPersistenceTable:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not read to the daemon analytics plist file, error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)persistDaemonMetrics:withData:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "invalid path for daemon plist file.", v2, v3, v4, v5, v6);
}

- (void)persistDaemonMetrics:(uint64_t)a1 withData:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "couldn't write to the daemon metrics plist file, %@", (uint8_t *)&v2, 0xCu);
}

- (void)getDaemonPlistFileURL
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4((void *)&_mh_execute_header, v0, v1, "failed to get cache directory to store collection date plist file, nil cache directory.", v2, v3, v4, v5, v6);
}

@end