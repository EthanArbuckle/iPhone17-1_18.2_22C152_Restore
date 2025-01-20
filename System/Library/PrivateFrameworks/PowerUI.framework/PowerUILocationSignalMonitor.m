@interface PowerUILocationSignalMonitor
+ (PowerUILocationSignalMonitor)monitorWithDelegate:(id)a3;
+ (PowerUILocationSignalMonitor)monitorWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5;
+ (id)stringFromRTType:(int64_t)a3;
- (BOOL)inTypicalChargingLocationWithError:(id *)a3;
- (BOOL)isInSameTimeZone;
- (BOOL)locationIsUncertain:(id)a3;
- (BOOL)longChargesOccurredInLocationsNear:(id)a3 withError:(id *)a4;
- (BOOL)notAuthorizedForLocation;
- (CLLocation)currentLocation;
- (CLLocationManager)locationManager;
- (NSDictionary)analyticsData;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)fullChargeDateQueue;
- (OS_dispatch_queue)queue;
- (OS_dispatch_semaphore)authorizationSemaphore;
- (OS_dispatch_semaphore)requestLocationSemaphore;
- (OS_os_log)log;
- (PowerUILocationSignalMonitor)initWithDelegate:(id)a3 trialManager:(id)a4 withContextStore:(id)a5;
- (PowerUISignalMonitorDelegate)delegate;
- (RTRoutineManager)routine;
- (_CDLocalContext)context;
- (double)empiricalDurationAtRemoteLocation:(int64_t)a3 withPotentialLOIs:(id)a4;
- (double)empiricalDurationAwayFromLocations:(id)a3;
- (id)LOIsWithinMeters:(int)a3;
- (id)coreRoutinePredictedEntryDateFromNearbyLOIs:(id)a3;
- (id)empiricalPredictedDateAwayFromNearbyLocations:(id)a3;
- (id)empiricalPredictedDateStayingAtNearbyLOIs:(id)a3 withRemoteLocation:(int64_t)a4;
- (id)lastAcquiredLocation;
- (id)likelyToBeInKnownArea;
- (id)longChargesAroundDate:(id)a3 withinSeconds:(double)a4 withinDays:(int)a5 withMinimumDuration:(double)a6 checkWhetherNearDate:(BOOL)a7;
- (id)requiredFullChargeDate;
- (int)authorizationStatus;
- (int64_t)inKnownMicrolocation;
- (unint64_t)signalID;
- (void)isInSameTimeZone;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)logPredictionsWithDuration:(id)a3 withConfidence:(id)a4 withLOIString:(id)a5 withPredictionMethod:(id)a6 withSkipString:(id)a7;
- (void)setAnalyticsData:(id)a3;
- (void)setAuthorizationSemaphore:(id)a3;
- (void)setAuthorizationStatus:(int)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setContext:(id)a3;
- (void)setCurrentLocation:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFullChargeDateQueue:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setLog:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestLocationSemaphore:(id)a3;
- (void)setRoutine:(id)a3;
@end

@implementation PowerUILocationSignalMonitor

- (PowerUILocationSignalMonitor)initWithDelegate:(id)a3 trialManager:(id)a4 withContextStore:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)PowerUILocationSignalMonitor;
  v10 = [(PowerUILocationSignalMonitor *)&v29 init];
  if (v10)
  {
    os_log_t v11 = os_log_create("com.apple.powerui.smartcharging", "signals");
    log = v10->_log;
    v10->_log = (OS_os_log *)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.powerui.locsignalmonitor.queue", v13);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v14;

    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.powerui.locsignalmonitor.callbackqueue", v16);
    callbackQueue = v10->_callbackQueue;
    v10->_callbackQueue = (OS_dispatch_queue *)v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.powerui.locsignalmonitor.fullchargedatequeue", v19);
    fullChargeDateQueue = v10->_fullChargeDateQueue;
    v10->_fullChargeDateQueue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v10->_delegate, a3);
    objc_storeStrong((id *)&v10->_context, a5);
    uint64_t v22 = [MEMORY[0x263F37F08] defaultManager];
    routine = v10->_routine;
    v10->_routine = (RTRoutineManager *)v22;

    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    authorizationSemaphore = v10->_authorizationSemaphore;
    v10->_authorizationSemaphore = (OS_dispatch_semaphore *)v24;

    uint64_t v26 = [objc_alloc(MEMORY[0x263F00A60]) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/SystemCustomization.bundle" delegate:v10 onQueue:v10->_callbackQueue];
    locationManager = v10->_locationManager;
    v10->_locationManager = (CLLocationManager *)v26;

    [(CLLocationManager *)v10->_locationManager setDesiredAccuracy:100.0];
  }

  return v10;
}

+ (PowerUILocationSignalMonitor)monitorWithDelegate:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = [MEMORY[0x263F351B8] userContext];
  v6 = [v4 monitorWithDelegate:v3 trialManager:0 withContext:v5];

  return (PowerUILocationSignalMonitor *)v6;
}

+ (PowerUILocationSignalMonitor)monitorWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDelegate:v9 trialManager:v8 withContextStore:v7];

  return (PowerUILocationSignalMonitor *)v10;
}

- (unint64_t)signalID
{
  return 4;
}

- (id)longChargesAroundDate:(id)a3 withinSeconds:(double)a4 withinDays:(int)a5 withMinimumDuration:(double)a6 checkWhetherNearDate:(BOOL)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v10 = a3;
  os_log_t v11 = +[PowerUISmartChargeUtilities pluginEventsBefore:v10 withMinimumDuration:a6 ignoringDisconnectsShorterThan:300.0];
  v12 = [MEMORY[0x263EFF980] array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v13 = v11;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v29;
    double v17 = (double)a5;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v29 != v16) {
          objc_enumerationMutation(v13);
        }
        v19 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        dispatch_queue_t v20 = objc_msgSend(v19, "startDate", (void)v28);
        [v20 timeIntervalSinceReferenceDate];
        double v22 = v21;
        [v10 timeIntervalSinceReferenceDate];
        double v24 = v23 + v17 * -86400.0;

        if (v22 > v24) {
          [v12 addObject:v19];
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v15);
  }

  v25 = +[PowerUISmartChargeUtilities filterChargeSessions:v12 startsBefore:v10 dynamicallyAroundDate:v10 withinSeconds:(unint64_t)a4];

  uint64_t v26 = +[PowerUISmartChargeUtilities concatenateChargeSessions:v25 withMaxDeltaSecondsBetweenEvents:10];

  return v26;
}

- (BOOL)locationIsUncertain:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    [v4 horizontalAccuracy];
    if (v6 <= 200.0)
    {
      BOOL v12 = 0;
      goto LABEL_9;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = NSNumber;
      id v9 = log;
      [v5 horizontalAccuracy];
      id v10 = objc_msgSend(v8, "numberWithDouble:");
      int v14 = 138412290;
      uint64_t v15 = v10;
      _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "Horizontal accuracy: %@. Returning uncertain", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    os_log_t v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "No location: Returning uncertain", (uint8_t *)&v14, 2u);
    }
  }
  BOOL v12 = 1;
LABEL_9:

  return v12;
}

- (void)logPredictionsWithDuration:(id)a3 withConfidence:(id)a4 withLOIString:(id)a5 withPredictionMethod:(id)a6 withSkipString:(id)a7
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v11 = v20;
  id v12 = v19;
  id v13 = v18;
  id v14 = v17;
  id v15 = v16;
  AnalyticsSendEventLazy();
}

id __124__PowerUILocationSignalMonitor_logPredictionsWithDuration_withConfidence_withLOIString_withPredictionMethod_withSkipString___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"homeEntryDurationPrediction"];
  [v2 setObject:*(void *)(a1 + 40) forKeyedSubscript:@"confidence"];
  [v2 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"loi"];
  [v2 setObject:*(void *)(a1 + 56) forKeyedSubscript:@"predictionMethod"];
  if (*(void *)(a1 + 64)) {
    id v3 = *(__CFString **)(a1 + 64);
  }
  else {
    id v3 = @"No Skip";
  }
  [v2 setObject:v3 forKeyedSubscript:@"skip"];
  id v4 = [*(id *)(a1 + 72) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Logging to CA: %@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (id)coreRoutinePredictedEntryDateFromNearbyLOIs:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v54 = a3;
  v53 = (void *)os_transaction_create();
  uint64_t v79 = 0;
  v80 = &v79;
  uint64_t v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__9;
  v83 = __Block_byref_object_dispose__9;
  id v84 = 0;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x3032000000;
  v77[3] = __Block_byref_object_copy__9;
  v77[4] = __Block_byref_object_dispose__9;
  id v78 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  v57 = [MEMORY[0x263EFF910] now];
  routine = self->_routine;
  int v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:36000.0];
  v73[0] = MEMORY[0x263EF8330];
  v73[1] = 3221225472;
  v73[2] = __76__PowerUILocationSignalMonitor_coreRoutinePredictedEntryDateFromNearbyLOIs___block_invoke;
  v73[3] = &unk_2645A6E60;
  v75 = v77;
  v73[4] = self;
  dispatch_semaphore_t dsema = v4;
  dispatch_semaphore_t v74 = dsema;
  v76 = &v79;
  [(RTRoutineManager *)routine fetchPredictedLocationsOfInterestBetweenStartDate:v57 endDate:v6 withHandler:v73];
  v62 = self;

  dispatch_time_t v7 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(dsema, v7))
  {
    v61 = [(PowerUILocationSignalMonitor *)self log];
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      -[PowerUILocationSignalMonitor coreRoutinePredictedEntryDateFromNearbyLOIs:]();
    }
    id v63 = 0;
    goto LABEL_62;
  }
  v61 = [MEMORY[0x263EFF980] array];
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v8 = v54;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v69 objects:v90 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v70;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v70 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = [*(id *)(*((void *)&v69 + 1) + 8 * i) identifier];
        [v61 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v69 objects:v90 count:16];
    }
    while (v9);
  }

  v60 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:28800.0];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  obuint64_t j = (id)v80[5];
  uint64_t v13 = [obj countByEnumeratingWithState:&v65 objects:v89 count:16];
  if (!v13)
  {
    id v63 = 0;
    goto LABEL_59;
  }
  id v63 = 0;
  uint64_t v58 = *(void *)v66;
  do
  {
    uint64_t v59 = v13;
    for (uint64_t j = 0; j != v59; ++j)
    {
      if (*(void *)v66 != v58) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(void **)(*((void *)&v65 + 1) + 8 * j);
      v64 = [v15 nextEntryTime];
      id v16 = [v15 locationOfInterest];
      id v17 = [v16 identifier];
      if (!v17)
      {

LABEL_24:
        double v22 = [(PowerUILocationSignalMonitor *)v62 log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v15;
          _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_INFO, "CR Skipping loi %@ because it's not nearby", buf, 0xCu);
        }
        v25 = @"Far Location";
LABEL_27:

        int v26 = 0;
        if (v63) {
          goto LABEL_28;
        }
        double v27 = 0.0;
        int v28 = 1;
        goto LABEL_30;
      }
      id v18 = [v15 locationOfInterest];
      id v19 = [v18 identifier];
      char v20 = [v61 containsObject:v19];

      if ((v20 & 1) == 0) {
        goto LABEL_24;
      }
      [v15 confidence];
      if (v21 < 0.9)
      {
        double v22 = [(PowerUILocationSignalMonitor *)v62 log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          double v23 = NSNumber;
          [v15 confidence];
          double v24 = objc_msgSend(v23, "numberWithDouble:");
          *(_DWORD *)buf = 138412290;
          v86 = v24;
          _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_INFO, "CR LOI prediction is not confident %@", buf, 0xCu);
        }
        v25 = @"Low Confidence";
        goto LABEL_27;
      }
      if (!v64 || ([v64 timeIntervalSinceNow], v43 <= 0.0))
      {
        double v22 = [(PowerUILocationSignalMonitor *)v62 log];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v46 = NSNumber;
          v47 = [v15 locationOfInterest];
          v48 = objc_msgSend(v46, "numberWithInteger:", objc_msgSend(v47, "type"));
          *(_DWORD *)buf = 138412546;
          v86 = v48;
          __int16 v87 = 2112;
          id v88 = v64;
          _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_INFO, "CR nextEntryTime to loi %@ is now, NULL, or in the past %@", buf, 0x16u);
        }
        v25 = @"No Duration";
        goto LABEL_27;
      }
      if (v63)
      {
        id v44 = [v63 earlierDate:v64];
        BOOL v45 = v44 == v63;

        if (v45)
        {
          v49 = [(PowerUILocationSignalMonitor *)v62 log];
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v86 = v64;
            __int16 v87 = 2112;
            id v88 = v63;
            _os_log_impl(&dword_22135E000, v49, OS_LOG_TYPE_INFO, "CR prediction %@ is later than current prediction %@", buf, 0x16u);
          }

          int v26 = 0;
          v25 = @"Later Prediction";
        }
        else
        {
          v25 = 0;
          int v26 = 1;
        }
LABEL_28:
        [v63 timeIntervalSinceDate:v57];
        int v28 = 0;
        goto LABEL_30;
      }
      v25 = 0;
      double v27 = 0.0;
      int v28 = 1;
      int v26 = 1;
LABEL_30:
      long long v29 = [NSNumber numberWithDouble:v27];
      long long v30 = NSNumber;
      long long v31 = [v15 locationOfInterest];
      [v31 confidence];
      v32 = objc_msgSend(v30, "numberWithDouble:");
      uint64_t v33 = [v15 locationOfInterest];
      v34 = +[PowerUILocationSignalMonitor stringFromRTType:](PowerUILocationSignalMonitor, "stringFromRTType:", [v33 type]);
      [(PowerUILocationSignalMonitor *)v62 logPredictionsWithDuration:v29 withConfidence:v32 withLOIString:v34 withPredictionMethod:@"CoreRoutine" withSkipString:v25];

      if (v26)
      {
        if (v28)
        {
          id v35 = v64;
        }
        else
        {
          id v35 = [v63 earlierDate:v64];
        }
        v36 = v35;

        v37 = [v36 earlierDate:v60];
        BOOL v38 = v60 == v37;

        if (v38)
        {
          id v63 = v60;

          v39 = [(PowerUILocationSignalMonitor *)v62 log];
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_22135E000, v39, OS_LOG_TYPE_DEFAULT, "CR predicted longer than 8 hours. Using 8 hour default", buf, 2u);
          }
        }
        else
        {
          id v63 = v36;
        }
        v40 = [(PowerUILocationSignalMonitor *)v62 log];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          v41 = [v15 locationOfInterest];
          v42 = +[PowerUILocationSignalMonitor stringFromRTType:](PowerUILocationSignalMonitor, "stringFromRTType:", [v41 type]);
          *(_DWORD *)buf = 138412546;
          v86 = v64;
          __int16 v87 = 2112;
          id v88 = v42;
          _os_log_impl(&dword_22135E000, v40, OS_LOG_TYPE_DEFAULT, "CR predicts %@ for %@", buf, 0x16u);
        }
      }
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v65 objects:v89 count:16];
  }
  while (v13);
LABEL_59:

  v50 = [(PowerUILocationSignalMonitor *)v62 log];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = (void *)v80[5];
    *(_DWORD *)buf = 138412290;
    v86 = v51;
    _os_log_impl(&dword_22135E000, v50, OS_LOG_TYPE_DEFAULT, "CR Prediction with predicted next LOIs %@", buf, 0xCu);
  }

LABEL_62:
  _Block_object_dispose(v77, 8);

  _Block_object_dispose(&v79, 8);
  return v63;
}

void __76__PowerUILocationSignalMonitor_coreRoutinePredictedEntryDateFromNearbyLOIs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v6 = a2;
  dispatch_time_t v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (!v6 || v7)
  {
    id v8 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = @"No predicted LOI";
      if (v7) {
        uint64_t v9 = v7;
      }
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "CR: No predicted location: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (double)empiricalDurationAwayFromLocations:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [MEMORY[0x263EFF8F0] currentCalendar];
  id v6 = [MEMORY[0x263EFF910] now];
  dispatch_time_t v7 = [v5 components:32 fromDate:v6];

  v36 = v7;
  uint64_t v8 = [v7 hour];
  double v41 = [MEMORY[0x263EFF980] array];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  obuint64_t j = v4;
  uint64_t v40 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
  if (v40)
  {
    uint64_t v38 = *(void *)v43;
    v39 = self;
    do
    {
      for (uint64_t i = 0; i != v40; ++i)
      {
        if (*(void *)v43 != v38) {
          objc_enumerationMutation(obj);
        }
        int v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        id v11 = [v10 visits];
        uint64_t v12 = (void *)[v11 mutableCopy];

        uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"exitDate" ascending:1];
        id v14 = [MEMORY[0x263EFF8C0] arrayWithObject:v13];
        [v12 sortUsingDescriptors:v14];

        id v15 = [(PowerUILocationSignalMonitor *)self log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          double v16 = [v10 location];
          *(_DWORD *)buf = 138412546;
          double v47 = v16;
          __int16 v48 = 2112;
          v49 = v12;
          _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_INFO, "Sorted by exit date visits to %@: %@", buf, 0x16u);
        }
        if ([v12 count] >= 2)
        {
          uint64_t v17 = 0;
          do
          {
            id v18 = [v12 objectAtIndexedSubscript:v17];
            id v19 = [v18 exitDate];

            char v20 = [v5 components:32 fromDate:v19];
            uint64_t v21 = [v20 hour];
            unint64_t v22 = v8 - v21;
            if (v8 - v21 < 0) {
              unint64_t v22 = v21 - v8;
            }
            ++v17;
            if (v22 <= 1)
            {
              double v23 = [v12 objectAtIndexedSubscript:v17];
              double v24 = [v23 entryDate];

              [v24 timeIntervalSinceDate:v19];
              if (v25 > 0.0)
              {
                int v26 = objc_msgSend(NSNumber, "numberWithDouble:");
                [*(id *)&v41 addObject:v26];
              }
            }
          }
          while ([v12 count] - 1 > v17);
        }
        self = v39;
        double v27 = [(PowerUILocationSignalMonitor *)v39 log];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          double v47 = v41;
          _os_log_impl(&dword_22135E000, v27, OS_LOG_TYPE_INFO, "Empirical Away durations: %@", buf, 0xCu);
        }
      }
      uint64_t v40 = [obj countByEnumeratingWithState:&v42 objects:v50 count:16];
    }
    while (v40);
  }

  if ([*(id *)&v41 count])
  {
    int v28 = 0;
  }
  else
  {
    long long v29 = [(PowerUILocationSignalMonitor *)self log];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v29, OS_LOG_TYPE_DEFAULT, "Empirical Away cannot predict because there's not enough visits", buf, 2u);
    }

    int v28 = @"No Duration";
  }
  [*(id *)&v41 percentile:0.5];
  double v31 = v30;
  v32 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v33 = +[PowerUILocationSignalMonitor stringFromRTType:0];
  [(PowerUILocationSignalMonitor *)self logPredictionsWithDuration:v32 withConfidence:&unk_26D385A50 withLOIString:v33 withPredictionMethod:@"EmpiricalAway" withSkipString:v28];

  if (v31 > 28800.0) {
    double v31 = 28800.0;
  }
  if (v31 == 28800.0)
  {
    v34 = [(PowerUILocationSignalMonitor *)self log];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v47 = 28800.0 / 60.0 / 60.0;
      _os_log_impl(&dword_22135E000, v34, OS_LOG_TYPE_DEFAULT, "Empirical Away predicts %f hours > 8 hours. Using 8 hour default", buf, 0xCu);
    }
  }
  return v31;
}

- (id)empiricalPredictedDateAwayFromNearbyLocations:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  [(PowerUILocationSignalMonitor *)self empiricalDurationAwayFromLocations:a3];
  if (v4 <= 0.0)
  {
    dispatch_time_t v7 = [(PowerUILocationSignalMonitor *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_22135E000, v7, OS_LOG_TYPE_DEFAULT, "Empirical Away cannot predict because duration = 0", (uint8_t *)&v10, 2u);
    }
    id v6 = 0;
  }
  else
  {
    double v5 = v4;
    id v6 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceNow:");
    dispatch_time_t v7 = [(PowerUILocationSignalMonitor *)self log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [NSNumber numberWithDouble:v5];
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_22135E000, v7, OS_LOG_TYPE_DEFAULT, "Empirical Away Prediction %@ from empirical duration %@", (uint8_t *)&v10, 0x16u);
    }
  }

  return v6;
}

- (double)empiricalDurationAtRemoteLocation:(int64_t)a3 withPotentialLOIs:(id)a4
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v51 = [MEMORY[0x263EFF980] array];
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v56 objects:v69 count:16];
  unint64_t v8 = 0x263F08000uLL;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v57;
    uint64_t v46 = *(void *)v57;
    id v47 = v6;
    do
    {
      uint64_t v11 = 0;
      uint64_t v49 = v9;
      do
      {
        if (*(void *)v57 != v10) {
          objc_enumerationMutation(v6);
        }
        __int16 v12 = *(void **)(*((void *)&v56 + 1) + 8 * v11);
        uint64_t v13 = [v12 visits];
        uint64_t v14 = v13;
        if (v13 && (double)(unint64_t)[v13 count] >= 5.0)
        {
          long long v54 = 0u;
          long long v55 = 0u;
          long long v52 = 0u;
          long long v53 = 0u;
          v50 = v14;
          id v15 = v14;
          uint64_t v22 = [v15 countByEnumeratingWithState:&v52 objects:v62 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v48 = v11;
            uint64_t v24 = *(void *)v53;
            do
            {
              for (uint64_t i = 0; i != v23; ++i)
              {
                if (*(void *)v53 != v24) {
                  objc_enumerationMutation(v15);
                }
                int v26 = *(void **)(*((void *)&v52 + 1) + 8 * i);
                [v26 locationOfInterestConfidence];
                if (v27 >= 0.9)
                {
                  int v28 = [v26 exitDate];
                  long long v29 = [v26 entryDate];
                  [v28 timeIntervalSinceDate:v29];
                  double v31 = v30;

                  v32 = [(PowerUILocationSignalMonitor *)self log];
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                  {
                    +[PowerUILocationSignalMonitor stringFromRTType:](PowerUILocationSignalMonitor, "stringFromRTType:", [v12 type]);
                    double v33 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                    [*(id *)(v8 + 2584) numberWithDouble:v31];
                    id v35 = v34 = v8;
                    *(_DWORD *)buf = 138412546;
                    double v64 = v33;
                    __int16 v65 = 2112;
                    long long v66 = v35;
                    _os_log_impl(&dword_22135E000, v32, OS_LOG_TYPE_INFO, "Empirical Prediction: %@ Visit Duration : %@", buf, 0x16u);

                    unint64_t v8 = v34;
                  }

                  if (v31 >= 0.0)
                  {
                    v36 = [*(id *)(v8 + 2584) numberWithDouble:v31];
                    [v51 addObject:v36];
                  }
                  else
                  {
                    v36 = [(PowerUILocationSignalMonitor *)self log];
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
                      -[PowerUILocationSignalMonitor empiricalDurationAtRemoteLocation:withPotentialLOIs:](v60, &v61, v36);
                    }
                  }
                }
              }
              uint64_t v23 = [v15 countByEnumeratingWithState:&v52 objects:v62 count:16];
            }
            while (v23);
            uint64_t v10 = v46;
            id v6 = v47;
            uint64_t v11 = v48;
            uint64_t v9 = v49;
          }
          uint64_t v14 = v50;
        }
        else
        {
          id v15 = [(PowerUILocationSignalMonitor *)self log];
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            +[PowerUILocationSignalMonitor stringFromRTType:](PowerUILocationSignalMonitor, "stringFromRTType:", [v12 type]);
            double v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            uint64_t v17 = v10;
            id v18 = v6;
            uint64_t v19 = v11;
            char v20 = objc_msgSend(*(id *)(v8 + 2584), "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
            uint64_t v21 = [*(id *)(v8 + 2584) numberWithDouble:5.0];
            *(_DWORD *)buf = 138412802;
            double v64 = v16;
            __int16 v65 = 2112;
            long long v66 = v20;
            __int16 v67 = 2112;
            long long v68 = v21;
            _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_INFO, "Empirical Prediction: %@ has not enough visits %@ < %@", buf, 0x20u);

            uint64_t v11 = v19;
            id v6 = v18;
            uint64_t v10 = v17;
            uint64_t v9 = v49;
          }
        }

        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v56 objects:v69 count:16];
    }
    while (v9);
  }

  if ([v51 count])
  {
    v37 = 0;
  }
  else
  {
    uint64_t v38 = [(PowerUILocationSignalMonitor *)self log];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v38, OS_LOG_TYPE_DEFAULT, "Empirical Stay cannot predict because there's not enough visits", buf, 2u);
    }

    v37 = @"No Duration";
  }
  [v51 percentile:0.5];
  double v40 = v39;
  double v41 = objc_msgSend(*(id *)(v8 + 2584), "numberWithDouble:");
  long long v42 = +[PowerUILocationSignalMonitor stringFromRTType:a3];
  [(PowerUILocationSignalMonitor *)self logPredictionsWithDuration:v41 withConfidence:&unk_26D385A50 withLOIString:v42 withPredictionMethod:@"Empirical" withSkipString:v37];

  if (v40 > 28800.0) {
    double v40 = 28800.0;
  }
  if (v40 == 28800.0)
  {
    long long v43 = [(PowerUILocationSignalMonitor *)self log];
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      double v64 = 28800.0 / 60.0 / 60.0;
      _os_log_impl(&dword_22135E000, v43, OS_LOG_TYPE_INFO, "Empirical Stay predicts %f hours > 8 hours. Using 8 hour default", buf, 0xCu);
    }
  }
  return v40;
}

- (id)empiricalPredictedDateStayingAtNearbyLOIs:(id)a3 withRemoteLocation:(int64_t)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v36 = (void *)os_transaction_create();
  uint64_t v35 = [MEMORY[0x263EFF910] now];
  uint64_t v7 = [(PowerUILocationSignalMonitor *)self LOIsWithinMeters:100000];
  unint64_t v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = (void *)[v8 mutableCopy];
  uint64_t v10 = [MEMORY[0x263EFF9C0] set];
  v37 = self;
  uint64_t v11 = [(PowerUILocationSignalMonitor *)self log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v47 = v8;
    _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "Empirical Stay Prediction: All LOIs within 100000 meters %@", buf, 0xCu);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v12 = v6;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v43 != v15) {
          objc_enumerationMutation(v12);
        }
        [v10 addObject:*(void *)(*((void *)&v42 + 1) + 8 * i)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v42 objects:v51 count:16];
    }
    while (v14);
  }
  id v34 = v12;

  uint64_t v17 = [(PowerUILocationSignalMonitor *)self log];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v47 = v10;
    _os_log_impl(&dword_22135E000, v17, OS_LOG_TYPE_DEFAULT, "Empirical Prediction: Removing nearby LOIs with identifiers %@", buf, 0xCu);
  }

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v18 = v8;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v50 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v39;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v39 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void **)(*((void *)&v38 + 1) + 8 * j);
        uint64_t v24 = objc_msgSend(v23, "identifier", v34);
        int v25 = [v10 containsObject:v24];

        if (v25) {
          [v9 removeObject:v23];
        }
        if ([v23 type] != a4) {
          [v9 removeObject:v23];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v38 objects:v50 count:16];
    }
    while (v20);
  }

  [(PowerUILocationSignalMonitor *)v37 empiricalDurationAtRemoteLocation:a4 withPotentialLOIs:v9];
  if (v26 <= 0.0)
  {
    double v30 = [(PowerUILocationSignalMonitor *)v37 log];
    double v31 = v34;
    int v28 = (void *)v35;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v30, OS_LOG_TYPE_DEFAULT, "Empirical Stay cannot predict because duration = 0", buf, 2u);
    }
    long long v29 = 0;
  }
  else
  {
    double v27 = v26;
    int v28 = (void *)v35;
    long long v29 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeInterval:sinceDate:", v35);
    double v30 = [(PowerUILocationSignalMonitor *)v37 log];
    double v31 = v34;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v32 = [NSNumber numberWithDouble:v27];
      *(_DWORD *)buf = 138412546;
      id v47 = v29;
      __int16 v48 = 2112;
      uint64_t v49 = v32;
      _os_log_impl(&dword_22135E000, v30, OS_LOG_TYPE_DEFAULT, "Empirical Stay Prediction %@ from empirical duration %@", buf, 0x16u);
    }
  }

  return v29;
}

- (BOOL)longChargesOccurredInLocationsNear:(id)a3 withError:(id *)a4
{
  uint64_t v87 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v49 = v6;
  if ([(PowerUILocationSignalMonitor *)self locationIsUncertain:v6])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Location is uncertain; assuming conservatively we are not in typical location.",
        buf,
        2u);
    }
    [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.PowerUIAgent" code:1 userInfo:&unk_26D3860B8];
    BOOL v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(void *)buf = 0;
    id v78 = buf;
    uint64_t v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__9;
    uint64_t v81 = __Block_byref_object_dispose__9;
    id v82 = 0;
    uint64_t v71 = 0;
    long long v72 = &v71;
    uint64_t v73 = 0x3032000000;
    dispatch_semaphore_t v74 = __Block_byref_object_copy__9;
    v75 = __Block_byref_object_dispose__9;
    id v76 = 0;
    dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
    routine = self->_routine;
    v67[0] = MEMORY[0x263EF8330];
    v67[1] = 3221225472;
    v67[2] = __77__PowerUILocationSignalMonitor_longChargesOccurredInLocationsNear_withError___block_invoke;
    v67[3] = &unk_2645A6E60;
    long long v69 = &v71;
    v67[4] = self;
    uint64_t v11 = v9;
    long long v68 = v11;
    uint64_t v70 = buf;
    [(RTRoutineManager *)routine fetchLocationsOfInterestWithinDistance:v6 ofLocation:v67 withHandler:200.0];
    dispatch_time_t v12 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v11, v12))
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[PowerUILocationSignalMonitor longChargesOccurredInLocationsNear:withError:]();
      }
      ADClientAddValueForScalarKey();
      [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.PowerUIAgent" code:2 userInfo:&unk_26D3860E0];
      dispatch_semaphore_t dsema = v11;
      BOOL v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v54 = self;
      if ([*((id *)v78 + 5) count])
      {
        dispatch_semaphore_t dsema = v11;
        *a4 = (id) v72[5];
        uint64_t v13 = [MEMORY[0x263EFF980] array];
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v14 = *((id *)v78 + 5);
        uint64_t v15 = [v14 countByEnumeratingWithState:&v60 objects:v84 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v61;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v61 != v16) {
                objc_enumerationMutation(v14);
              }
              id v18 = objc_msgSend(*(id *)(*((void *)&v60 + 1) + 8 * i), "visits", dsema, v49);
              [v13 addObjectsFromArray:v18];
            }
            uint64_t v15 = [v14 countByEnumeratingWithState:&v60 objects:v84 count:16];
          }
          while (v15);
        }

        [v13 sortUsingComparator:&__block_literal_global_18];
        id v19 = objc_alloc_init(MEMORY[0x263F08790]);
        [v19 setDateFormat:@"yyyy-MM-dd HH:mm"];
        uint64_t v20 = +[PowerUISmartChargeUtilities lastPluggedInDate];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        obuint64_t j = v13;
        uint64_t v21 = [obj countByEnumeratingWithState:&v56 objects:v83 count:16];
        uint64_t v52 = v19;
        if (v21)
        {
          unsigned int v53 = 0;
          int v22 = 0;
          uint64_t v23 = *(void *)v57;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v57 != v23) {
                objc_enumerationMutation(obj);
              }
              int v25 = *(void **)(*((void *)&v56 + 1) + 8 * j);
              double v26 = objc_msgSend(v25, "entryDate", dsema);
              [v20 timeIntervalSinceDate:v26];
              BOOL v28 = v27 > 2592000.0;

              if (!v28)
              {
                long long v29 = [v25 entryDate];
                double v30 = [v25 exitDate];
                BOOL v31 = +[PowerUISmartChargeUtilities doesTimeOfDayForDate:v20 fallBetweenDate:v29 andDate:v30];

                ++v22;
                v32 = v54->_log;
                BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);
                if (v31)
                {
                  if (v33)
                  {
                    v50 = [v25 entryDate];
                    id v34 = [v52 stringFromDate:v50];
                    uint64_t v35 = [v25 exitDate];
                    id v36 = [v52 stringFromDate:v35];
                    v37 = [v52 stringFromDate:v20];
                    *(_DWORD *)v85 = 138412802;
                    *(void *)&v85[4] = v34;
                    *(_WORD *)&v85[12] = 2112;
                    *(void *)&v85[14] = v36;
                    *(_WORD *)&v85[22] = 2112;
                    v86 = v37;
                    _os_log_debug_impl(&dword_22135E000, v32, OS_LOG_TYPE_DEBUG, "Match! visit start: %@  ---  visit end: %@  ---  plugin date: %@", v85, 0x20u);
                  }
                  ++v53;
                }
                else
                {
                  if (v33)
                  {
                    uint64_t v51 = [v25 entryDate];
                    id v38 = [v52 stringFromDate:v51];
                    long long v39 = [v25 exitDate];
                    id v40 = [v52 stringFromDate:v39];
                    long long v41 = [v52 stringFromDate:v20];
                    *(_DWORD *)v85 = 138412802;
                    *(void *)&v85[4] = v38;
                    *(_WORD *)&v85[12] = 2112;
                    *(void *)&v85[14] = v40;
                    *(_WORD *)&v85[22] = 2112;
                    v86 = v41;
                    _os_log_debug_impl(&dword_22135E000, v32, OS_LOG_TYPE_DEBUG, "NO Match! visit start: %@  ---  visit end: %@  ---  plugin date: %@", v85, 0x20u);
                  }
                }
              }
            }
            uint64_t v21 = [obj countByEnumeratingWithState:&v56 objects:v83 count:16];
          }
          while (v21);
        }
        else
        {
          unsigned int v53 = 0;
          int v22 = 0;
        }

        uint64_t v46 = v54->_log;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v85 = 67109376;
          *(_DWORD *)&v85[4] = v53;
          *(_WORD *)&v85[8] = 1024;
          *(_DWORD *)&v85[10] = v22;
          _os_log_impl(&dword_22135E000, v46, OS_LOG_TYPE_DEFAULT, "%u out of %u LoI visits match current time", v85, 0xEu);
        }
        BOOL v8 = v53 > 4;
      }
      else
      {
        *(void *)v85 = 0;
        *(void *)&v85[8] = v85;
        *(void *)&v85[16] = 0x2020000000;
        LOBYTE(v86) = 0;
        dispatch_semaphore_t v42 = dispatch_semaphore_create(0);

        long long v43 = self->_routine;
        long long v44 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-259200.0];
        v64[0] = MEMORY[0x263EF8330];
        v64[1] = 3221225472;
        v64[2] = __77__PowerUILocationSignalMonitor_longChargesOccurredInLocationsNear_withError___block_invoke_155;
        v64[3] = &unk_2645A6E88;
        v64[4] = self;
        long long v66 = v85;
        dispatch_semaphore_t dsema = v42;
        dispatch_semaphore_t v65 = dsema;
        [(RTRoutineManager *)v43 fetchLocationsOfInterestVisitedSinceDate:v44 withHandler:v64];

        dispatch_time_t v45 = dispatch_time(0, 30000000000);
        if (dispatch_semaphore_wait(dsema, v45))
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
            -[PowerUILocationSignalMonitor longChargesOccurredInLocationsNear:withError:]();
          }
          ADClientAddValueForScalarKey();
          [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.PowerUIAgent" code:2 userInfo:&unk_26D386108];
          BOOL v8 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          BOOL v8 = *(unsigned char *)(*(void *)&v85[8] + 24) == 0;
        }

        _Block_object_dispose(v85, 8);
      }
    }

    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(buf, 8);
  }
  return v8;
}

void __77__PowerUILocationSignalMonitor_longChargesOccurredInLocationsNear_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (v7 || ![v6 count])
  {
    BOOL v8 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_semaphore_t v9 = @"No nearby LOI";
      if (v7) {
        dispatch_semaphore_t v9 = v7;
      }
      int v14 = 138412290;
      uint64_t v15 = v9;
      _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "No LOIs nearby: %@", (uint8_t *)&v14, 0xCu);
    }
    ADClientSetValueForScalarKey();
  }
  else
  {
    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 96);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = NSNumber;
      dispatch_time_t v12 = v10;
      objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "%@ nearby LOIs", (uint8_t *)&v14, 0xCu);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __77__PowerUILocationSignalMonitor_longChargesOccurredInLocationsNear_withError___block_invoke_155(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    ADClientSetValueForScalarKey();
  }
  else
  {
    uint64_t v7 = [v5 count];
    uint64_t v8 = *(void *)(a1 + 32);
    dispatch_semaphore_t v9 = *(void **)(v8 + 96);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(v8 + 96), OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = v9;
        int v11 = 134217984;
        uint64_t v12 = [v6 count];
        _os_log_impl(&dword_22135E000, v10, OS_LOG_TYPE_DEFAULT, "No LoIs, but did see visits in the past. (%lu)", (uint8_t *)&v11, 0xCu);
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(v8 + 96), OS_LOG_TYPE_FAULT)) {
        __77__PowerUILocationSignalMonitor_longChargesOccurredInLocationsNear_withError___block_invoke_155_cold_1();
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t __77__PowerUILocationSignalMonitor_longChargesOccurredInLocationsNear_withError___block_invoke_160(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 entryDate];
  id v6 = [v4 entryDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (BOOL)inTypicalChargingLocationWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__PowerUILocationSignalMonitor_inTypicalChargingLocationWithError___block_invoke;
  block[3] = &unk_2645A5CF0;
  block[4] = self;
  dispatch_sync(queue, block);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    -[PowerUILocationSignalMonitor inTypicalChargingLocationWithError:]((uint64_t)self, log);
  }
  uint64_t v7 = [(PowerUILocationSignalMonitor *)self currentLocation];
  BOOL v8 = [(PowerUILocationSignalMonitor *)self locationIsUncertain:v7];

  if (v8) {
    [(CLLocationManager *)self->_locationManager startUpdatingLocation];
  }
  dispatch_semaphore_t v9 = [(PowerUILocationSignalMonitor *)self currentLocation];
  BOOL v10 = [(PowerUILocationSignalMonitor *)self locationIsUncertain:v9];

  if (v10)
  {
    int v11 = [(PowerUILocationSignalMonitor *)self requestLocationSemaphore];
    if (v11)
    {
      dispatch_time_t v12 = dispatch_time(0, 30000000000);
      dispatch_semaphore_wait(v11, v12);
    }
    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  }
  uint64_t v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = v13;
    uint64_t v15 = [(PowerUILocationSignalMonitor *)self currentLocation];
    if (v15) {
      uint64_t v16 = @"Have Location";
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v17 = [(CLLocationManager *)self->_locationManager location];
    if (v17) {
      id v18 = @"Have Location";
    }
    else {
      id v18 = 0;
    }
    *(_DWORD *)buf = 138412546;
    long long v29 = v16;
    __int16 v30 = 2112;
    BOOL v31 = v18;
    _os_log_impl(&dword_22135E000, v14, OS_LOG_TYPE_DEFAULT, "Current location %@, Location manager location: %@", buf, 0x16u);
  }
  id v19 = [(PowerUILocationSignalMonitor *)self currentLocation];
  uint64_t v20 = v19;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [(CLLocationManager *)self->_locationManager location];
  }
  int v22 = v21;

  BOOL v23 = [(PowerUILocationSignalMonitor *)self longChargesOccurredInLocationsNear:v22 withError:a3];
  uint64_t v24 = self->_queue;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __67__PowerUILocationSignalMonitor_inTypicalChargingLocationWithError___block_invoke_170;
  v26[3] = &unk_2645A5CF0;
  v26[4] = self;
  dispatch_sync(v24, v26);

  return v23;
}

void __67__PowerUILocationSignalMonitor_inTypicalChargingLocationWithError___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 40) location];
  [*(id *)(a1 + 32) setCurrentLocation:v2];

  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  [*(id *)(a1 + 32) setRequestLocationSemaphore:v3];
}

uint64_t __67__PowerUILocationSignalMonitor_inTypicalChargingLocationWithError___block_invoke_170(uint64_t a1)
{
  [*(id *)(a1 + 32) setCurrentLocation:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setRequestLocationSemaphore:0];
}

- (BOOL)isInSameTimeZone
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  uint64_t v41 = 0;
  dispatch_semaphore_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  long long v44 = __Block_byref_object_copy__9;
  dispatch_time_t v45 = __Block_byref_object_dispose__9;
  id v46 = 0;
  dispatch_semaphore_t v3 = BiomeLibrary();
  id v4 = [v3 Device];
  id v5 = [v4 TimeZone];

  id v6 = [v5 publisher];
  uint64_t v7 = [v6 last];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke;
  v40[3] = &unk_2645A5C58;
  v40[4] = self;
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_172;
  v39[3] = &unk_2645A6ED0;
  v39[4] = &v41;
  id v8 = (id)[v7 sinkWithCompletion:v40 receiveInput:v39];

  if (v42[5])
  {
    dispatch_semaphore_t v9 = self->_log;
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
    {
      [(id)v42[5] secondsFromGMT];
      [(PowerUILocationSignalMonitor *)buf isInSameTimeZone];
    }

    uint64_t v36 = 0;
    v37[0] = &v36;
    v37[1] = 0x2020000000;
    int v38 = 0;
    uint64_t v33 = 0;
    v34[0] = &v33;
    v34[1] = 0x2020000000;
    int v35 = 0;
    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x3032000000;
    v31[3] = __Block_byref_object_copy__9;
    v31[4] = __Block_byref_object_dispose__9;
    id v32 = 0;
    int v11 = BiomeLibrary();
    dispatch_time_t v12 = [v11 Device];
    uint64_t v13 = [v12 Power];
    int v14 = [v13 PluggedIn];

    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    int v30 = -1;
    uint64_t v15 = [v5 publisher];
    uint64_t v16 = [v14 publisher];
    uint64_t v17 = [v15 orderedMergeWithOther:v16 comparator:&__block_literal_global_177];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_2;
    v28[3] = &unk_2645A6EF8;
    v28[4] = v31;
    v28[5] = v29;
    id v18 = [v17 filterWithIsIncluded:v28];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_3;
    v27[3] = &unk_2645A5C58;
    v27[4] = self;
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_181;
    v26[3] = &unk_2645A6F20;
    v26[4] = self;
    void v26[5] = v31;
    v26[6] = &v41;
    v26[7] = &v36;
    v26[8] = &v33;
    id v19 = (id)[v18 sinkWithCompletion:v27 receiveInput:v26];

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
      [(PowerUILocationSignalMonitor *)(uint64_t)v34 isInSameTimeZone];
    }
    int v21 = *(_DWORD *)(v34[0] + 24);
    if (v21)
    {
      int v22 = *(_DWORD *)(v37[0] + 24);
      BOOL v23 = v22 >= 11 && v22 / v21 > 3;
    }
    else
    {
      BOOL v23 = 1;
    }
    _Block_object_dispose(v29, 8);

    _Block_object_dispose(v31, 8);
    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v36, 8);
  }
  else
  {
    uint64_t v24 = [(PowerUILocationSignalMonitor *)self log];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[PowerUILocationSignalMonitor isInSameTimeZone]();
    }

    BOOL v23 = 0;
  }

  _Block_object_dispose(&v41, 8);
  return v23;
}

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_cold_1(v3);
    }
  }
}

uint64_t __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_172(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 eventBody];
  return MEMORY[0x270F9A758]();
}

uint64_t __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_174(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  uint64_t v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  double v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = [v4 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v7 = (id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
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
  double v8 = [v4 eventBody];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_11;
  }
  double v9 = [v4 eventBody];
  int v10 = [v9 hasStarting];

  if (!v10) {
    goto LABEL_11;
  }
  uint64_t v11 = [v4 eventBody];
  int v12 = [v11 starting];

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

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_3_cold_1(v3);
    }
  }
}

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_181(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1[5] + 8) + 40) eventBody];
  id v5 = [v4 timeZone];

  id v6 = *(NSObject **)(a1[4] + 96);
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_181_cold_2((uint64_t)(a1 + 5), v6, v3);
    }
    uint64_t v7 = [*(id *)(*(void *)(a1[6] + 8) + 40) timeZone];
    double v8 = [*(id *)(*(void *)(a1[5] + 8) + 40) eventBody];
    double v9 = [v8 timeZone];

    if (v7 == v9) {
      uint64_t v10 = a1[7];
    }
    else {
      uint64_t v10 = a1[8];
    }
    ++*(_DWORD *)(*(void *)(v10 + 8) + 24);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_181_cold_1();
  }
}

- (int64_t)inKnownMicrolocation
{
  id v3 = +[PowerUISmartChargeUtilities lastPluggedInDate];
  [v3 timeIntervalSinceReferenceDate];
  uint64_t v5 = v4;

  uint64_t v24 = 0;
  int v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v20 = 0;
  int v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  id v6 = BiomeLibrary();
  uint64_t v7 = [v6 Location];
  double v8 = [v7 MicroLocationVisit];

  double v9 = [v8 publisher];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __52__PowerUILocationSignalMonitor_inKnownMicrolocation__block_invoke;
  v19[3] = &unk_2645A5C58;
  v19[4] = self;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __52__PowerUILocationSignalMonitor_inKnownMicrolocation__block_invoke_182;
  v18[3] = &unk_2645A6F48;
  v18[7] = v5;
  v18[4] = self;
  v18[5] = &v24;
  v18[6] = &v20;
  id v10 = (id)[v9 sinkWithCompletion:v19 receiveInput:v18];

  if (*((unsigned char *)v25 + 24))
  {
    int v11 = *((unsigned __int8 *)v21 + 24);
    log = self->_log;
    BOOL v13 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Microlocation event near pluggedIn time", v17, 2u);
      }
      int64_t v14 = 1;
    }
    else
    {
      if (v13)
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "No matching microlocation found", v17, 2u);
      }
      int64_t v14 = 0;
    }
  }
  else
  {
    uint64_t v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_22135E000, v15, OS_LOG_TYPE_DEFAULT, "No microlocations found. Falling back to TimeZone check", v17, 2u);
    }
    int64_t v14 = -1;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v14;
}

void __52__PowerUILocationSignalMonitor_inKnownMicrolocation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    uint64_t v4 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __52__PowerUILocationSignalMonitor_inKnownMicrolocation__block_invoke_cold_1(v3);
    }
  }
}

void __52__PowerUILocationSignalMonitor_inKnownMicrolocation__block_invoke_182(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  double v4 = *(double *)(a1 + 56);
  [v3 timestamp];
  double v6 = v4 - v5;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 96);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    id v10 = (void *)MEMORY[0x263EFF910];
    double v11 = *(double *)(a1 + 56);
    int v12 = v7;
    BOOL v13 = [v10 dateWithTimeIntervalSinceReferenceDate:v11];
    int64_t v14 = (void *)MEMORY[0x263EFF910];
    [v3 timestamp];
    uint64_t v15 = objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
    int v16 = 138412802;
    id v17 = v13;
    __int16 v18 = 2112;
    id v19 = v15;
    __int16 v20 = 2048;
    double v21 = v6;
    _os_log_debug_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEBUG, "working on event - plugin: %@ - event timestamp: %@ - diff: %f", (uint8_t *)&v16, 0x20u);
  }
  if (v6 > -60.0 && v6 < 60.0)
  {
    double v9 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v3;
      _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "Microlocation event near pluggedIn time %@", (uint8_t *)&v16, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (BOOL)notAuthorizedForLocation
{
  int authorizationStatus = self->_authorizationStatus;
  if (authorizationStatus) {
    BOOL v3 = authorizationStatus == 3;
  }
  else {
    BOOL v3 = 1;
  }
  return !v3;
}

- (id)likelyToBeInKnownArea
{
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  int64_t v4 = [(PowerUILocationSignalMonitor *)self inKnownMicrolocation];
  if (v4 == -1)
  {
    [v3 setObject:@"TimeZone" forKeyedSubscript:@"reason"];
    BOOL v10 = [(PowerUILocationSignalMonitor *)self isInSameTimeZone];
    log = self->_log;
    BOOL v11 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        double v8 = "Device has has been in consistent timezones; Not opting out of feature";
        double v9 = buf;
        goto LABEL_8;
      }
LABEL_9:
      uint64_t v12 = MEMORY[0x263EFFA88];
      goto LABEL_16;
    }
    if (v11)
    {
      *(_WORD *)__int16 v18 = 0;
      BOOL v13 = "Device has been through multiple timezones; Opting out of feature";
      int64_t v14 = v18;
      goto LABEL_14;
    }
  }
  else
  {
    int64_t v5 = v4;
    [v3 setObject:@"Microlocation" forKeyedSubscript:@"reason"];
    log = self->_log;
    BOOL v7 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        __int16 v17 = 0;
        double v8 = "In a known micro-location; Not opting out of the feature";
        double v9 = (uint8_t *)&v17;
LABEL_8:
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    if (v7)
    {
      LOWORD(v16) = 0;
      BOOL v13 = "Not In a known micro-location; Opting out of the feature";
      int64_t v14 = (uint8_t *)&v16;
LABEL_14:
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
    }
  }
  uint64_t v12 = MEMORY[0x263EFFA80];
LABEL_16:
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, @"value", v16);
  return v3;
}

- (id)requiredFullChargeDate
{
  BOOL v3 = (void *)os_transaction_create();
  int64_t v4 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"locIgnored" inDomain:@"com.apple.smartcharging.topoffprotection"];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Location Ignored; Returning distant future", buf, 2u);
    }
    id v7 = [MEMORY[0x263EFF910] distantFuture];
  }
  else
  {
    *(void *)buf = 0;
    uint64_t v12 = buf;
    uint64_t v13 = 0x3032000000;
    int64_t v14 = __Block_byref_object_copy__9;
    uint64_t v15 = __Block_byref_object_dispose__9;
    id v16 = [MEMORY[0x263EFF910] distantPast];
    fullChargeDateQueue = self->_fullChargeDateQueue;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __54__PowerUILocationSignalMonitor_requiredFullChargeDate__block_invoke;
    v10[3] = &unk_2645A6848;
    v10[4] = self;
    v10[5] = buf;
    dispatch_sync(fullChargeDateQueue, v10);
    id v7 = *((id *)v12 + 5);
    _Block_object_dispose(buf, 8);
  }
  return v7;
}

void __54__PowerUILocationSignalMonitor_requiredFullChargeDate__block_invoke(uint64_t a1)
{
  v36[2] = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) notAuthorizedForLocation];
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v2)
  {
    double v6 = *(NSObject **)(v3 + 64);
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v6, v7);
    double v8 = *(void **)(a1 + 32);
    id v33 = 0;
    int v9 = [v8 inTypicalChargingLocationWithError:&v33];
    id v10 = v33;
    BOOL v11 = v10;
    if (v9)
    {
      uint64_t v12 = *(NSObject **)(*(void *)(a1 + 32) + 96);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_DEFAULT, "In typical charging location; No need to advance full charge deadline",
          buf,
          2u);
      }
      uint64_t v13 = [MEMORY[0x263EFF910] distantFuture];
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      uint64_t v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;
    }
    else
    {
      if (v10)
      {
        __int16 v17 = *(NSObject **)(*(void *)(a1 + 32) + 96);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_22135E000, v17, OS_LOG_TYPE_DEFAULT, "Error while determining LoI; Fallback to Microlocation or TimeZone",
            buf,
            2u);
        }

        int v5 = @"LoIError";
        goto LABEL_14;
      }
      uint64_t v29 = [MEMORY[0x263EFF910] distantPast];
      uint64_t v30 = *(void *)(*(void *)(a1 + 40) + 8);
      BOOL v31 = *(void **)(v30 + 40);
      *(void *)(v30 + 40) = v29;

      id v32 = *(NSObject **)(*(void *)(a1 + 32) + 96);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v32, OS_LOG_TYPE_DEFAULT, "Not in typical charging location; Opting out of feature",
          buf,
          2u);
      }
    }
    id v16 = @"LocationOfInterest";
    goto LABEL_18;
  }
  int64_t v4 = *(NSObject **)(v3 + 96);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEFAULT, "Not authorized for location; Fallback to Microlocation or TimeZone",
      buf,
      2u);
  }
  int v5 = @"NotAuthorized";
LABEL_14:
  BOOL v11 = [*(id *)(a1 + 32) likelyToBeInKnownArea];
  __int16 v18 = [v11 objectForKeyedSubscript:@"value"];
  int v19 = [v18 BOOLValue];

  __int16 v20 = [v11 objectForKeyedSubscript:@"reason"];
  id v16 = [NSString stringWithFormat:@"%@-%@", v5, v20];

  if (v19) {
    [MEMORY[0x263EFF910] distantFuture];
  }
  else {
  uint64_t v21 = [MEMORY[0x263EFF910] distantPast];
  }
  uint64_t v22 = *(void *)(*(void *)(a1 + 40) + 8);
  char v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;

LABEL_18:
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) timeIntervalSinceNow];
  v35[0] = @"Reason";
  v35[1] = @"locationMonitorDecision";
  v36[0] = v16;
  int v25 = [NSNumber numberWithBool:v24 > 0.0];
  v36[1] = v25;
  uint64_t v26 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
  uint64_t v27 = *(void *)(a1 + 32);
  BOOL v28 = *(void **)(v27 + 16);
  *(void *)(v27 + 16) = v26;
}

- (id)lastAcquiredLocation
{
  return [(CLLocationManager *)self->_locationManager location];
}

- (id)LOIsWithinMeters:(int)a3
{
  int v5 = [(PowerUILocationSignalMonitor *)self lastAcquiredLocation];
  uint64_t v17 = 0;
  __int16 v18 = &v17;
  uint64_t v19 = 0x3032000000;
  __int16 v20 = __Block_byref_object_copy__9;
  uint64_t v21 = __Block_byref_object_dispose__9;
  id v22 = [MEMORY[0x263EFF980] array];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  routine = self->_routine;
  double v8 = (double)a3;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__PowerUILocationSignalMonitor_LOIsWithinMeters___block_invoke;
  v14[3] = &unk_2645A6E88;
  v14[4] = self;
  id v16 = &v17;
  int v9 = v6;
  uint64_t v15 = v9;
  [(RTRoutineManager *)routine fetchLocationsOfInterestWithinDistance:v5 ofLocation:v14 withHandler:v8];
  dispatch_time_t v10 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    BOOL v11 = [(PowerUILocationSignalMonitor *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PowerUILocationSignalMonitor LOIsWithinMeters:]();
    }

    id v12 = 0;
  }
  else
  {
    id v12 = (id)v18[5];
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __49__PowerUILocationSignalMonitor_LOIsWithinMeters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    double v8 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __49__PowerUILocationSignalMonitor_LOIsWithinMeters___block_invoke_cold_1();
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)stringFromRTType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4) {
    return @"Error";
  }
  else {
    return off_2645A6F68[a3 + 1];
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 authorizationStatus];
  ADClientSetValueForScalarKey();
  log = self->_log;
  BOOL v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (v4 == 3)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Authorized for Protective Top-Off", (uint8_t *)&v10, 2u);
    }
  }
  else if (v6)
  {
    id v7 = NSNumber;
    double v8 = log;
    int v9 = [v7 numberWithInt:v4];
    int v10 = 138412290;
    BOOL v11 = v9;
    _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "Authorization status: %@", (uint8_t *)&v10, 0xCu);
  }
  self->_int authorizationStatus = v4;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_authorizationSemaphore);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  BOOL v6 = [v5 lastObject];
  BOOL v7 = [(PowerUILocationSignalMonitor *)self locationIsUncertain:v6];

  if (!v7)
  {
    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
    queue = self->_queue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __67__PowerUILocationSignalMonitor_locationManager_didUpdateLocations___block_invoke;
    v9[3] = &unk_2645A6878;
    v9[4] = self;
    id v10 = v5;
    dispatch_sync(queue, v9);
  }
}

void __67__PowerUILocationSignalMonitor_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 40) lastObject];
  [*(id *)(a1 + 32) setCurrentLocation:v2];

  uint64_t v3 = [*(id *)(a1 + 32) requestLocationSemaphore];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) requestLocationSemaphore];
    dispatch_semaphore_signal(v4);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Location Manager failed with error: %@", (uint8_t *)&v7, 0xCu);
  }
}

- (NSDictionary)analyticsData
{
  return self->_analyticsData;
}

- (void)setAnalyticsData:(id)a3
{
}

- (PowerUISignalMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (RTRoutineManager)routine
{
  return self->_routine;
}

- (void)setRoutine:(id)a3
{
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (int)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setAuthorizationStatus:(int)a3
{
  self->_int authorizationStatus = a3;
}

- (CLLocation)currentLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentLocation:(id)a3
{
}

- (OS_dispatch_semaphore)requestLocationSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequestLocationSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)authorizationSemaphore
{
  return self->_authorizationSemaphore;
}

- (void)setAuthorizationSemaphore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (OS_dispatch_queue)fullChargeDateQueue
{
  return self->_fullChargeDateQueue;
}

- (void)setFullChargeDateQueue:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_fullChargeDateQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_authorizationSemaphore, 0);
  objc_storeStrong((id *)&self->_requestLocationSemaphore, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_routine, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_analyticsData, 0);
}

- (void)coreRoutinePredictedEntryDateFromNearbyLOIs:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "CR Error: Timeout occurred to obtain predicted LOIs", v2, v3, v4, v5, v6);
}

- (void)empiricalDurationAtRemoteLocation:(NSObject *)a3 withPotentialLOIs:.cold.1(uint8_t *a1, void *a2, NSObject *a3)
{
  uint8_t v6 = objc_msgSend(NSNumber, "numberWithDouble:");
  *(_DWORD *)a1 = 138412290;
  *a2 = v6;
  _os_log_error_impl(&dword_22135E000, a3, OS_LOG_TYPE_ERROR, "Empirical Prediction: Ignoring negative duration %@", a1, 0xCu);
}

- (void)longChargesOccurredInLocationsNear:withError:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "Error: Timeout occurred to obtain LsOI", v2, v3, v4, v5, v6);
}

void __77__PowerUILocationSignalMonitor_longChargesOccurredInLocationsNear_withError___block_invoke_155_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_22135E000, v0, OS_LOG_TYPE_FAULT, "No LoI visits in three days", v1, 2u);
}

- (void)inTypicalChargingLocationWithError:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 48)) {
    uint64_t v2 = @"Have Location";
  }
  else {
    uint64_t v2 = 0;
  }
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_22135E000, a2, OS_LOG_TYPE_DEBUG, "Current location: %@", (uint8_t *)&v3, 0xCu);
}

- (void)isInSameTimeZone
{
  *(_DWORD *)buf = 134217984;
  *(double *)(buf + 4) = a3;
  _os_log_debug_impl(&dword_22135E000, a2, OS_LOG_TYPE_DEBUG, "current time zone offset: %f", buf, 0xCu);
}

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Error getting TimeZone biome events in signal monitor: %s", v5, v6, v7, v8, v9);
}

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_3_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Error getting TimeZone/Plugin biome events in signal monitor: %s", v5, v6, v7, v8, v9);
}

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_181_cold_1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "No timezone in event!", v2, v3, v4, v5, v6);
}

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_181_cold_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)MEMORY[0x263EFF910];
  uint64_t v5 = *(void **)(*(void *)(*(void *)a1 + 8) + 40);
  uint8_t v6 = a2;
  [v5 timestamp];
  uint64_t v7 = objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v8 = (void *)MEMORY[0x263EFF910];
  [a3 timestamp];
  uint8_t v9 = objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  int v10 = 138412546;
  BOOL v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = v9;
  _os_log_debug_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEBUG, "working on event with TZ timestamp: %@ - plugin timestamp: %@", (uint8_t *)&v10, 0x16u);
}

void __52__PowerUILocationSignalMonitor_inKnownMicrolocation__block_invoke_cold_1(void *a1)
{
  uint64_t v1 = [a1 error];
  id v2 = [v1 description];
  [v2 UTF8String];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_22135E000, v3, v4, "Error getting KML in signalMonitor: %s", v5, v6, v7, v8, v9);
}

- (void)LOIsWithinMeters:.cold.1()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_22135E000, v0, v1, "Error: Timeout occurred getting nearby LOIs", v2, v3, v4, v5, v6);
}

void __49__PowerUILocationSignalMonitor_LOIsWithinMeters___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_22135E000, v0, OS_LOG_TYPE_ERROR, "Fetch LOIs error: %@", v1, 0xCu);
}

@end