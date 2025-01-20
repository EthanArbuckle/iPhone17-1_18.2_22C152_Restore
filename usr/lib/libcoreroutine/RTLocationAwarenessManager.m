@interface RTLocationAwarenessManager
+ (id)powerAssertion;
+ (int64_t)localHourFromTimestamp:(id)a3;
- (BOOL)activeRequestCoarseLocationReceived;
- (BOOL)activeRequestFulfilled;
- (BOOL)activeRequestInterrupted;
- (BOOL)activeRequestInterruptedCheck;
- (BOOL)activeRequestLocationServiceOn;
- (BOOL)activeRequestRoutineOn;
- (BOOL)activeRequestWifiOn;
- (BOOL)addFixedRateLocationRequester:(id)a3 error:(id *)a4;
- (BOOL)addHighAccuracyLocationRequester:(id)a3 error:(id *)a4;
- (BOOL)addLocationHeartbeatRequester:(id)a3 interval:(double)a4 error:(id *)a5;
- (BOOL)coarseLocation:(id)a3;
- (BOOL)removeHighAccuracyLocationRequester:(id)a3 error:(id *)a4;
- (BOOL)requestedFixedRateLocation;
- (BOOL)requestedHighAccuracyLocation;
- (BOOL)validInterval:(double)a3;
- (BOOL)validLocation:(id)a3;
- (CLLocation)lastLocationAnyPositive;
- (CLLocation)lastLocationLessThan10m;
- (CLLocation)lastLocationLessThan200m;
- (CLLocation)lastLocationLessThan20m;
- (CLLocation)lastLocationLessThan55m;
- (CLLocation)lastValidLocation;
- (NSDate)activeOnset;
- (NSDate)scheduledHeartbeatFiringTime;
- (NSDate)scheduledRestTimerFiringTime;
- (NSDate)stationaryStartTimestamp;
- (NSMapTable)heartbeatBucketToRequesters;
- (NSMapTable)requesterToHeartbeatBucket;
- (NSMutableSet)fixedRateLocationRequesters;
- (NSMutableSet)highAccuracyLocationRequesters;
- (NSNumber)minHeartbeatBucket;
- (RTAuthorizationManager)authorizationManager;
- (RTInvocationDispatcher)heartbeatBuffer;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLocationAwarenessManager)init;
- (RTLocationAwarenessManager)initWithLocationManager:(id)a3 config:(id)a4 metricManager:(id)a5 motionActivityManager:(id)a6 authorizationManager:(id)a7 wifiManager:(id)a8 xpcActivityManager:(id)a9 timerManager:(id)a10 learnedLocationStore:(id)a11;
- (RTLocationAwarenessManagerConfig)config;
- (RTLocationAwarenessMetrics)metrics;
- (RTLocationManager)locationManager;
- (RTMetricManager)metricManager;
- (RTMotionActivityManager)motionActivityManager;
- (RTPowerAssertion)xpcActivityPowerAssertion;
- (RTTimer)heartbeatTimer;
- (RTTimer)restTimer;
- (RTTimerManager)timerManager;
- (RTWiFiManager)wifiManager;
- (RTXPCActivityManager)xpcActivityManager;
- (double)intervalForHeartbeatBucket:(id)a3;
- (double)metricAge;
- (double)nextFiringDelayWithHeartbeatInterval:(double)result starvingDuration:(double)a4;
- (double)starvingDurationTillNow;
- (id)heartbeatBucketForInterval:(double)a3;
- (id)updateWithLocation:(id)a3 oneIntervalHistogram:(id)a4 lastLocation:(id)a5;
- (void)_addFixedRateLocationRequester:(id)a3;
- (void)_addHighAccuracyLocationRequester:(id)a3;
- (void)_onDailyMetricsNotification:(id)a3;
- (void)_removeFixedRateLocationRequester:(id)a3;
- (void)_removeHighAccuracyLocationRequester:(id)a3;
- (void)_requestForFixedRateLocation;
- (void)_requestForHighAccuracyLocation;
- (void)_setup;
- (void)_shutdownWithHandler:(id)a3;
- (void)_updateXPCActivityForHighAccuracyLocationRequest;
- (void)_updateXPCActivityForObserverCount:(unint64_t)a3;
- (void)adjustHeartbeatTimer;
- (void)considerRequestingForLocation;
- (void)considerUpdateActiveRequestMetrics;
- (void)considerUpdatingHeartbeatDelayMetrics;
- (void)heartbeatTasks;
- (void)hourlySingleShotWithHandler:(id)a3;
- (void)incrementBasicHistogram:(id)a3 forTimestamp:(id)a4;
- (void)onDailyMetricsNotification:(id)a3;
- (void)onHeartbeat;
- (void)onLeechedLocationNotification:(id)a3;
- (void)onMotionActivityManagerNotificationActivityNotification:(id)a3;
- (void)onRest;
- (void)removeFixedRateLocationRequester:(id)a3;
- (void)removeLocationHeartbeatRequester:(id)a3;
- (void)requestForFixedRateLocation;
- (void)requestForHighAccuracyLocation;
- (void)resetActiveRequestSummaryVariables;
- (void)setActiveOnset:(id)a3;
- (void)setActiveRequestCoarseLocationReceived:(BOOL)a3;
- (void)setActiveRequestFulfilled:(BOOL)a3;
- (void)setActiveRequestInterrupted:(BOOL)a3;
- (void)setActiveRequestLocationServiceOn:(BOOL)a3;
- (void)setActiveRequestRoutineOn:(BOOL)a3;
- (void)setActiveRequestWifiOn:(BOOL)a3;
- (void)setAuthorizationManager:(id)a3;
- (void)setFixedRateLocationRequesters:(id)a3;
- (void)setHeartbeatBucketToRequesters:(id)a3;
- (void)setHeartbeatBuffer:(id)a3;
- (void)setHeartbeatTimer:(id)a3;
- (void)setHighAccuracyLocationRequesters:(id)a3;
- (void)setLastLocationAnyPositive:(id)a3;
- (void)setLastLocationLessThan10m:(id)a3;
- (void)setLastLocationLessThan200m:(id)a3;
- (void)setLastLocationLessThan20m:(id)a3;
- (void)setLastLocationLessThan55m:(id)a3;
- (void)setLastValidLocation:(id)a3;
- (void)setLearnedLocationStore:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setMetricManager:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setMinHeartbeatBucket:(id)a3;
- (void)setMotionActivityManager:(id)a3;
- (void)setRequestedFixedRateLocation:(BOOL)a3;
- (void)setRequestedHighAccuracyLocation:(BOOL)a3;
- (void)setRequesterToHeartbeatBucket:(id)a3;
- (void)setRestTimer:(id)a3;
- (void)setScheduledHeartbeatFiringTime:(id)a3;
- (void)setScheduledRestTimerFiringTime:(id)a3;
- (void)setStationaryStartTimestamp:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setWifiManager:(id)a3;
- (void)setXpcActivityManager:(id)a3;
- (void)setXpcActivityPowerAssertion:(id)a3;
- (void)updateHeartbeatTimerDelayForTimestamp:(id)a3 withDelay:(double)a4;
- (void)updateLocationAwarenessHistogramsWithLocations:(id)a3;
- (void)updateMinHeartbeatBucket;
@end

@implementation RTLocationAwarenessManager

- (void)onLeechedLocationNotification:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __60__RTLocationAwarenessManager_onLeechedLocationNotification___block_invoke;
  v11 = &unk_1E6B90BF0;
  id v12 = v4;
  v13 = self;
  id v5 = v4;
  v6 = (void *)MEMORY[0x1E016DB00](&v8);
  v7 = [(RTNotifier *)self queue];
  dispatch_async(v7, v6);
}

- (void)updateLocationAwarenessHistogramsWithLocations:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v60 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v62 != v60) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        uint64_t v8 = [v7 timestamp];

        if (v8)
        {
          uint64_t v9 = objc_opt_class();
          v10 = [v7 timestamp];
          uint64_t v11 = [v9 localHourFromTimestamp:v10];

          [v7 horizontalAccuracy];
          if (v12 > 0.0)
          {
            double v13 = v12;
            v14 = [(RTLocationAwarenessManager *)self metrics];
            v15 = [v14 timeHistograms];
            v16 = [v15 anyPositiveHistogram];
            uint64_t v17 = [v16 counts];
            ++*(_DWORD *)(v17 + 4 * v11);

            v18 = [(RTLocationAwarenessManager *)self metrics];
            v19 = [v18 intervalHistogram];
            v20 = [v19 anyPositiveIntervalHistograms];
            v21 = [(RTLocationAwarenessManager *)self lastLocationAnyPositive];
            v22 = [(RTLocationAwarenessManager *)self updateWithLocation:v7 oneIntervalHistogram:v20 lastLocation:v21];
            [(RTLocationAwarenessManager *)self setLastLocationAnyPositive:v22];

            if (v13 < 200.0)
            {
              v23 = [(RTLocationAwarenessManager *)self metrics];
              v24 = [v23 timeHistograms];
              v25 = [v24 lessThan200mHistogram];
              uint64_t v26 = [v25 counts];
              ++*(_DWORD *)(v26 + 4 * v11);

              v27 = [(RTLocationAwarenessManager *)self metrics];
              v28 = [v27 intervalHistogram];
              v29 = [v28 lessThan200mIntervalHistograms];
              v30 = [(RTLocationAwarenessManager *)self lastLocationLessThan200m];
              v31 = [(RTLocationAwarenessManager *)self updateWithLocation:v7 oneIntervalHistogram:v29 lastLocation:v30];
              [(RTLocationAwarenessManager *)self setLastLocationLessThan200m:v31];

              if (v13 < 55.0)
              {
                v32 = [(RTLocationAwarenessManager *)self metrics];
                v33 = [v32 timeHistograms];
                v34 = [v33 lessThan55mHistogram];
                uint64_t v35 = [v34 counts];
                ++*(_DWORD *)(v35 + 4 * v11);

                v36 = [(RTLocationAwarenessManager *)self metrics];
                v37 = [v36 intervalHistogram];
                v38 = [v37 lessThan55mIntervalHistograms];
                v39 = [(RTLocationAwarenessManager *)self lastLocationLessThan55m];
                v40 = [(RTLocationAwarenessManager *)self updateWithLocation:v7 oneIntervalHistogram:v38 lastLocation:v39];
                [(RTLocationAwarenessManager *)self setLastLocationLessThan55m:v40];

                if (v13 < 20.0)
                {
                  v41 = [(RTLocationAwarenessManager *)self metrics];
                  v42 = [v41 timeHistograms];
                  v43 = [v42 lessThan20mHistogram];
                  uint64_t v44 = [v43 counts];
                  ++*(_DWORD *)(v44 + 4 * v11);

                  v45 = [(RTLocationAwarenessManager *)self metrics];
                  v46 = [v45 intervalHistogram];
                  v47 = [v46 lessThan25mIntervalHistograms];
                  v48 = [(RTLocationAwarenessManager *)self lastLocationLessThan20m];
                  v49 = [(RTLocationAwarenessManager *)self updateWithLocation:v7 oneIntervalHistogram:v47 lastLocation:v48];
                  [(RTLocationAwarenessManager *)self setLastLocationLessThan20m:v49];

                  if (v13 < 10.0)
                  {
                    v50 = [(RTLocationAwarenessManager *)self metrics];
                    v51 = [v50 timeHistograms];
                    v52 = [v51 lessThan10mHistogram];
                    uint64_t v53 = [v52 counts];
                    ++*(_DWORD *)(v53 + 4 * v11);

                    v54 = [(RTLocationAwarenessManager *)self metrics];
                    v55 = [v54 intervalHistogram];
                    v56 = [v55 lessThan10mIntervalHistograms];
                    v57 = [(RTLocationAwarenessManager *)self lastLocationLessThan10m];
                    v58 = [(RTLocationAwarenessManager *)self updateWithLocation:v7 oneIntervalHistogram:v56 lastLocation:v57];
                    [(RTLocationAwarenessManager *)self setLastLocationLessThan10m:v58];
                  }
                }
              }
            }
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v5);
  }
}

- (RTLocationAwarenessMetrics)metrics
{
  return self->_metrics;
}

- (id)updateWithLocation:(id)a3 oneIntervalHistogram:(id)a4 lastLocation:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!v7)
  {
    uint64_t v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      int v38 = 136315394;
      v39 = "-[RTLocationAwarenessManager(metric) updateWithLocation:oneIntervalHistogram:lastLocation:]";
      __int16 v40 = 1024;
      int v41 = 89;
      _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", (uint8_t *)&v38, 0x12u);
    }

    id v36 = v9;
    goto LABEL_18;
  }
  if (!v9)
  {
    id v36 = (id)[v7 copy];
LABEL_18:
    id v17 = v36;
    goto LABEL_19;
  }
  v10 = [v7 timestamp];
  uint64_t v11 = [v9 timestamp];
  [v10 timeIntervalSinceDate:v11];
  double v13 = v12;

  v14 = objc_opt_class();
  v15 = [v9 timestamp];
  uint64_t v16 = [v14 localHourFromTimestamp:v15];

  id v17 = v9;
  if (v13 > 0.0)
  {
    uint64_t v18 = [v7 copy];

    id v17 = (id)v18;
  }
  if (v13 > 8.0)
  {
    v19 = [v8 objectAtIndex:0];
    uint64_t v20 = [v19 counts];
    ++*(_DWORD *)(v20 + 4 * v16);

    if (v13 > 60.0)
    {
      v21 = [v8 objectAtIndex:1];
      uint64_t v22 = [v21 counts];
      ++*(_DWORD *)(v22 + 4 * v16);

      if (v13 > 120.0)
      {
        v23 = [v8 objectAtIndex:2];
        uint64_t v24 = [v23 counts];
        ++*(_DWORD *)(v24 + 4 * v16);

        if (v13 > 900.0)
        {
          v25 = [v8 objectAtIndex:3];
          uint64_t v26 = [v25 counts];
          ++*(_DWORD *)(v26 + 4 * v16);

          if (v13 > 3600.0)
          {
            v27 = [v8 objectAtIndex:4];
            uint64_t v28 = [v27 counts];
            ++*(_DWORD *)(v28 + 4 * v16);

            if (v13 > 7200.0)
            {
              v29 = [v8 objectAtIndex:5];
              uint64_t v30 = [v29 counts];
              ++*(_DWORD *)(v30 + 4 * v16);

              if (v13 > 14400.0)
              {
                v31 = [v8 objectAtIndex:6];
                uint64_t v32 = [v31 counts];
                ++*(_DWORD *)(v32 + 4 * v16);

                if (v13 > 28800.0)
                {
                  v33 = [v8 objectAtIndex:7];
                  uint64_t v34 = [v33 counts];
                  ++*(_DWORD *)(v34 + 4 * v16);
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_19:

  return v17;
}

+ (int64_t)localHourFromTimestamp:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  uint64_t v5 = [v3 currentCalendar];
  v6 = [v5 components:32 fromDate:v4];

  int64_t v7 = [v6 hour];
  return v7;
}

- (void)setLastLocationLessThan55m:(id)a3
{
}

- (void)setLastLocationLessThan200m:(id)a3
{
}

- (void)setLastLocationAnyPositive:(id)a3
{
}

- (CLLocation)lastLocationLessThan55m
{
  return self->_lastLocationLessThan55m;
}

- (CLLocation)lastLocationLessThan200m
{
  return self->_lastLocationLessThan200m;
}

- (CLLocation)lastLocationAnyPositive
{
  return self->_lastLocationAnyPositive;
}

- (void)setLastLocationLessThan20m:(id)a3
{
}

- (CLLocation)lastLocationLessThan20m
{
  return self->_lastLocationLessThan20m;
}

- (void)setLastLocationLessThan10m:(id)a3
{
}

- (CLLocation)lastLocationLessThan10m
{
  return self->_lastLocationLessThan10m;
}

void __60__RTLocationAwarenessManager_onLeechedLocationNotification___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = [*(id *)(a1 + 32) leechedLocations];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = 0;
      uint64_t v6 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v22 != v6) {
            objc_enumerationMutation(v2);
          }
          id v8 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if ([*(id *)(a1 + 40) validLocation:v8]
            && (!v5
             || ([v5 timestamp],
                 id v9 = objc_claimAutoreleasedReturnValue(),
                 [v8 timestamp],
                 v10 = objc_claimAutoreleasedReturnValue(),
                 uint64_t v11 = [v9 compare:v10],
                 v10,
                 v9,
                 v11 == -1)))
          {
            id v13 = v8;

            uint64_t v5 = v13;
          }
          else
          {
            double v12 = [*(id *)(a1 + 40) activeOnset];
            if (v12 && ([*(id *)(a1 + 40) activeRequestCoarseLocationReceived] & 1) == 0)
            {
              int v14 = [*(id *)(a1 + 40) coarseLocation:v8];

              if (v14) {
                [*(id *)(a1 + 40) setActiveRequestCoarseLocationReceived:1];
              }
            }
            else
            {
            }
          }
        }
        uint64_t v4 = [v2 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v4);
      [*(id *)(a1 + 40) updateLocationAwarenessHistogramsWithLocations:v2];
      if (v5)
      {
        uint64_t v15 = [*(id *)(a1 + 40) lastValidLocation];
        if (!v15) {
          goto LABEL_21;
        }
        uint64_t v16 = (void *)v15;
        id v17 = [v5 timestamp];
        uint64_t v18 = [*(id *)(a1 + 40) lastValidLocation];
        v19 = [v18 timestamp];
        uint64_t v20 = [v17 compare:v19];

        if (v20 == 1) {
LABEL_21:
        }
          [*(id *)(a1 + 40) setLastValidLocation:v5];
      }
    }
    else
    {
      [*(id *)(a1 + 40) updateLocationAwarenessHistogramsWithLocations:v2];
      uint64_t v5 = 0;
    }
  }
  else
  {
    v2 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [notification isKindOfClass:[RTLocationManagerNotificationLocationsLeeched class]]", buf, 2u);
    }
  }
}

- (CLLocation)lastValidLocation
{
  return self->_lastValidLocation;
}

- (BOOL)validLocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4 && ([v4 horizontalAccuracy], v6 >= 0.0))
  {
    [v5 horizontalAccuracy];
    double v9 = v8;
    v10 = [(RTLocationAwarenessManager *)self config];
    [v10 requiredHorizontalAccuracy];
    BOOL v7 = v9 <= v11;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (RTLocationAwarenessManagerConfig)config
{
  return self->_config;
}

- (void)setLastValidLocation:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v21 = 136315394;
      long long v22 = "-[RTLocationAwarenessManager setLastValidLocation:]";
      __int16 v23 = 1024;
      int v24 = 257;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: latestValidLocation (in %s:%d)", (uint8_t *)&v21, 0x12u);
    }
  }
  lastValidLocation = self->_lastValidLocation;
  if (lastValidLocation)
  {
    BOOL v7 = [(CLLocation *)lastValidLocation timestamp];
    double v8 = [v4 timestamp];
    uint64_t v9 = [v7 compare:v8];

    if (v9 != -1)
    {
      v10 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v21 = 136315394;
        long long v22 = "-[RTLocationAwarenessManager setLastValidLocation:]";
        __int16 v23 = 1024;
        int v24 = 260;
        _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "If lastValidLocation is not nil, it should have an earlier timestamp than latestValidLocation's. (in %s:%d)", (uint8_t *)&v21, 0x12u);
      }
    }
  }
  double v11 = (CLLocation *)[v4 copy];
  double v12 = self->_lastValidLocation;
  self->_lastValidLocation = v11;

  if (self->_activeOnset)
  {
    if (![(RTLocationAwarenessManager *)self requestedHighAccuracyLocation])
    {
      id v13 = [(CLLocation *)self->_lastValidLocation timestamp];
      [v13 timeIntervalSinceDate:self->_activeOnset];
      double v15 = v14;
      uint64_t v16 = [(RTLocationAwarenessManager *)self config];
      [v16 dispatchTimerLeeway];
      double v18 = -v17;

      if (v15 > v18)
      {
        [(RTLocationAwarenessManager *)self setActiveRequestFulfilled:1];
        v19 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          restTimer = self->_restTimer;
          int v21 = 134217984;
          long long v22 = (const char *)restTimer;
          _os_log_debug_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_DEBUG, "Pause rest timer %p.", (uint8_t *)&v21, 0xCu);
        }

        [(RTLocationAwarenessManager *)self onRest];
      }
    }
  }
}

void __50__RTLocationAwarenessManager_adjustHeartbeatTimer__block_invoke_73(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained onHeartbeat];
}

- (void)onHeartbeat
{
  uint64_t v3 = [(RTLocationAwarenessManager *)self activeOnset];

  if (v3)
  {
    id v4 = [(RTLocationAwarenessManager *)self heartbeatBuffer];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__RTLocationAwarenessManager_onHeartbeat__block_invoke;
    v7[3] = &unk_1E6B90E70;
    v7[4] = self;
    uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
    double v6 = [v5 stringFromDate];
    [v4 enqueueBlock:v7, @"Heartbeat tasks buffered at %@", v6 description];
  }
  else
  {
    [(RTLocationAwarenessManager *)self heartbeatTasks];
  }
}

- (void)heartbeatTasks
{
  [(RTLocationAwarenessManager *)self considerUpdatingHeartbeatDelayMetrics];
  [(RTLocationAwarenessManager *)self considerRequestingForLocation];

  [(RTLocationAwarenessManager *)self adjustHeartbeatTimer];
}

- (void)considerUpdatingHeartbeatDelayMetrics
{
  uint64_t v3 = [(RTLocationAwarenessManager *)self scheduledHeartbeatFiringTime];

  if (v3)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    id v4 = [(RTLocationAwarenessManager *)self scheduledHeartbeatFiringTime];
    [v8 timeIntervalSinceDate:v4];
    double v6 = v5;

    [(RTLocationAwarenessManager *)self updateHeartbeatTimerDelayForTimestamp:v8 withDelay:v6];
    [(RTLocationAwarenessManager *)self setScheduledHeartbeatFiringTime:0];
  }
  else
  {
    BOOL v7 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Unable to calculate heartbeat delay: nil scheduled time.", buf, 2u);
    }
  }
}

- (NSDate)scheduledHeartbeatFiringTime
{
  return self->_scheduledHeartbeatFiringTime;
}

- (void)considerRequestingForLocation
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RTLocationAwarenessManager *)self minHeartbeatBucket];
  if (v3)
  {
    restTimer = self->_restTimer;

    if (!restTimer)
    {
      double v5 = [MEMORY[0x1E4F1C9C8] date];
      double v6 = [(RTLocationAwarenessManager *)self metrics];
      BOOL v7 = [v6 heartbeatStats];
      id v8 = [v7 timerFiringCount];
      [(RTLocationAwarenessManager *)self incrementBasicHistogram:v8 forTimestamp:v5];

      uint64_t v9 = [(RTLocationAwarenessManager *)self lastValidLocation];
      if (!v9) {
        goto LABEL_5;
      }
      v10 = (void *)v9;
      double v11 = [(RTLocationAwarenessManager *)self stationaryStartTimestamp];
      double v12 = [(RTLocationAwarenessManager *)self lastValidLocation];
      id v13 = [v12 timestamp];
      [v11 timeIntervalSinceDate:v13];
      double v15 = v14;

      if (v15 <= 0.0)
      {
        v59 = [(RTLocationAwarenessManager *)self metrics];
        uint64_t v60 = [v59 heartbeatStats];
        long long v61 = [v60 skippedRequestDueToStationary];
        [(RTLocationAwarenessManager *)self incrementBasicHistogram:v61 forTimestamp:v5];

        v52 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          uint64_t v53 = [(RTLocationAwarenessManager *)self lastValidLocation];
          v54 = [v53 timestamp];
          v55 = [v54 stringFromDate];
          v56 = [(RTLocationAwarenessManager *)self stationaryStartTimestamp];
          v57 = [v56 stringFromDate];
          *(_DWORD *)buf = 138412546;
          long long v64 = v55;
          __int16 v65 = 2112;
          uint64_t v66 = v57;
          v58 = "Skip active location request, [stationary]. Last valid location timestamp, %@, stationary since, %@.";
          goto LABEL_13;
        }
      }
      else
      {
LABEL_5:
        [(RTLocationAwarenessManager *)self starvingDurationTillNow];
        double v17 = v16;
        double v18 = [(RTLocationAwarenessManager *)self config];
        [v18 dispatchTimerLeeway];
        double v20 = v17 + v19;
        int v21 = [(RTLocationAwarenessManager *)self minHeartbeatBucket];
        [(RTLocationAwarenessManager *)self intervalForHeartbeatBucket:v21];
        double v23 = v22;

        int v24 = [(RTLocationAwarenessManager *)self metrics];
        uint64_t v25 = [v24 heartbeatStats];
        uint64_t v26 = v25;
        if (v20 > v23)
        {
          uint64_t v27 = [v25 activeRequestCount];
          [(RTLocationAwarenessManager *)self incrementBasicHistogram:v27 forTimestamp:v5];

          [(RTLocationAwarenessManager *)self resetActiveRequestSummaryVariables];
          objc_storeStrong((id *)&self->_activeOnset, v5);
          uint64_t v28 = [(RTLocationAwarenessManager *)self locationManager];
          v29 = +[RTNotification notificationName];
          [v28 addObserver:self selector:sel_onNoOpLocationNotification_ name:v29];

          uint64_t v30 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            v31 = [(RTLocationAwarenessManager *)self restTimer];
            uint64_t v32 = [(RTLocationAwarenessManager *)self config];
            [v32 activeDuration];
            *(_DWORD *)buf = 134218240;
            long long v64 = v31;
            __int16 v65 = 2048;
            uint64_t v66 = v33;
            _os_log_impl(&dword_1D9BFA000, v30, OS_LOG_TYPE_INFO, "Reset rest timer, %p, firing delay, %f secs.", buf, 0x16u);
          }
          timerManager = self->_timerManager;
          uint64_t v35 = NSString;
          id v36 = (objc_class *)objc_opt_class();
          v37 = NSStringFromClass(v36);
          int v38 = [v35 stringWithFormat:@"%@.restTimer", v37];
          v39 = [(RTNotifier *)self queue];
          v62[0] = MEMORY[0x1E4F143A8];
          v62[1] = 3221225472;
          v62[2] = __59__RTLocationAwarenessManager_considerRequestingForLocation__block_invoke;
          v62[3] = &unk_1E6B90E70;
          v62[4] = self;
          __int16 v40 = [(RTTimerManager *)timerManager timerWithIdentifier:v38 queue:v39 handler:v62];
          int v41 = self->_restTimer;
          self->_restTimer = v40;

          uint64_t v42 = self->_restTimer;
          v43 = [(RTLocationAwarenessManager *)self config];
          [v43 activeDuration];
          double v45 = v44;
          v46 = [(RTLocationAwarenessManager *)self config];
          [v46 dispatchTimerLeeway];
          [(RTTimer *)v42 fireAfterDelay:v45 interval:INFINITY leeway:v47];

          [(RTTimer *)self->_restTimer resume];
          v48 = (void *)MEMORY[0x1E4F1C9C8];
          v49 = [(RTLocationAwarenessManager *)self config];
          [v49 activeDuration];
          v50 = [v48 dateWithTimeIntervalSinceNow:x0];
          [(RTLocationAwarenessManager *)self setScheduledRestTimerFiringTime:v50];

          goto LABEL_15;
        }
        v51 = [v25 skippedRequestDueToRecentFix];
        [(RTLocationAwarenessManager *)self incrementBasicHistogram:v51 forTimestamp:v5];

        v52 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          uint64_t v53 = [(RTLocationAwarenessManager *)self lastValidLocation];
          v54 = [v53 timestamp];
          v55 = [v54 stringFromDate];
          v56 = [(RTLocationAwarenessManager *)self stationaryStartTimestamp];
          v57 = [v56 stringFromDate];
          *(_DWORD *)buf = 138412546;
          long long v64 = v55;
          __int16 v65 = 2112;
          uint64_t v66 = v57;
          v58 = "Skip active location request, [recent fix]. Last valid location timestamp, %@, stationary since, %@.";
LABEL_13:
          _os_log_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_INFO, v58, buf, 0x16u);
        }
      }

LABEL_15:
    }
  }
}

- (void)incrementBasicHistogram:(id)a3 forTimestamp:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 counts];
  uint64_t v7 = [(id)objc_opt_class() localHourFromTimestamp:v5];

  ++*(_DWORD *)(v6 + 4 * v7);
}

- (NSDate)stationaryStartTimestamp
{
  return self->_stationaryStartTimestamp;
}

- (NSDate)activeOnset
{
  return self->_activeOnset;
}

- (void)adjustHeartbeatTimer
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RTLocationAwarenessManager *)self minHeartbeatBucket];

  if (v3)
  {
    id v4 = [(RTLocationAwarenessManager *)self minHeartbeatBucket];
    [(RTLocationAwarenessManager *)self intervalForHeartbeatBucket:v4];
    double v6 = v5;

    [(RTLocationAwarenessManager *)self starvingDurationTillNow];
    [(RTLocationAwarenessManager *)self nextFiringDelayWithHeartbeatInterval:v6 starvingDuration:v7];
    double v9 = v8;
    objc_initWeak(&location, self);
    v10 = [MEMORY[0x1E4F1C9C8] date];
    double v11 = [(RTLocationAwarenessManager *)self config];
    [v11 dispatchTimerLeeway];
    BOOL v13 = v9 > v12;

    if (!v13)
    {
      double v14 = [(RTLocationAwarenessManager *)self activeOnset];
      BOOL v15 = v14 == 0;

      if (v15)
      {
        double v16 = [(RTNotifier *)self queue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __50__RTLocationAwarenessManager_adjustHeartbeatTimer__block_invoke;
        block[3] = &unk_1E6B917C8;
        objc_copyWeak(&v36, &location);
        id v35 = v10;
        dispatch_async(v16, block);

        objc_destroyWeak(&v36);
      }
      double v9 = v6;
    }
    double v17 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      double v18 = [(RTLocationAwarenessManager *)self heartbeatTimer];
      *(_DWORD *)buf = 134218240;
      v39 = v18;
      __int16 v40 = 2048;
      double v41 = v9;
      _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "Reset heartbeat timer, %p, firing delay, %f secs.", buf, 0x16u);
    }
    timerManager = self->_timerManager;
    double v20 = NSString;
    int v21 = (objc_class *)objc_opt_class();
    double v22 = NSStringFromClass(v21);
    double v23 = [v20 stringWithFormat:@"%@.heartbeatTimer", v22];
    int v24 = [(RTNotifier *)self queue];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __50__RTLocationAwarenessManager_adjustHeartbeatTimer__block_invoke_73;
    v32[3] = &unk_1E6B91900;
    objc_copyWeak(&v33, &location);
    uint64_t v25 = [(RTTimerManager *)timerManager timerWithIdentifier:v23 queue:v24 handler:v32];
    heartbeatTimer = self->_heartbeatTimer;
    self->_heartbeatTimer = v25;

    uint64_t v27 = self->_heartbeatTimer;
    uint64_t v28 = [(RTLocationAwarenessManager *)self config];
    [v28 dispatchTimerLeeway];
    [(RTTimer *)v27 fireAfterDelay:v9 interval:INFINITY leeway:v29];

    [(RTTimer *)self->_heartbeatTimer resume];
    uint64_t v30 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v9];
    [(RTLocationAwarenessManager *)self setScheduledHeartbeatFiringTime:v30];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
  else
  {
    [(RTTimer *)self->_heartbeatTimer invalidate];
    v31 = self->_heartbeatTimer;
    self->_heartbeatTimer = 0;
  }
}

- (NSNumber)minHeartbeatBucket
{
  return self->_minHeartbeatBucket;
}

- (void)setScheduledHeartbeatFiringTime:(id)a3
{
}

- (double)starvingDurationTillNow
{
  uint64_t v3 = [(RTLocationAwarenessManager *)self lastValidLocation];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    double v5 = [(RTLocationAwarenessManager *)self lastValidLocation];
    double v6 = [v5 timestamp];
    [v4 timeIntervalSinceDate:v6];
    double v8 = v7;
  }
  else
  {
    id v4 = [(RTLocationAwarenessManager *)self config];
    [v4 maxHeartbeatInterval];
    double v8 = v9;
  }

  return v8;
}

- (double)nextFiringDelayWithHeartbeatInterval:(double)result starvingDuration:(double)a4
{
  double v4 = result - a4;
  if (v4 < result) {
    result = v4;
  }
  if (result < 0.0) {
    return 0.0;
  }
  return result;
}

- (double)intervalForHeartbeatBucket:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    double v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      double v12 = "-[RTLocationAwarenessManager intervalForHeartbeatBucket:]";
      __int16 v13 = 1024;
      int v14 = 1057;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bucket (in %s:%d)", (uint8_t *)&v11, 0x12u);
    }
  }
  double v6 = [(RTLocationAwarenessManager *)self config];
  [v6 heartbeatIntervalResolution];
  double v8 = v7;
  uint64_t v9 = [v4 integerValue];

  return v8 * (double)v9;
}

- (void)updateHeartbeatTimerDelayForTimestamp:(id)a3 withDelay:(double)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = [(RTLocationAwarenessManager *)self config];
  [v7 heartbeatIntervalResolution];
  double v9 = v8 * 0.5;

  if (v9 < a4)
  {
    v10 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v28 = 134217984;
      double v29 = a4;
      _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "Significant heartbeat delay, %0.1f seconds", (uint8_t *)&v28, 0xCu);
    }

    uint64_t v11 = [(id)objc_opt_class() localHourFromTimestamp:v6];
    double v12 = [(RTLocationAwarenessManager *)self metrics];
    __int16 v13 = [v12 heartbeatStats];
    int v14 = [v13 timerFiringDelayedCount];
    uint64_t v15 = [v14 counts];
    ++*(_DWORD *)(v15 + 4 * v11);

    signed int v16 = llround(a4);
    double v17 = [(RTLocationAwarenessManager *)self metrics];
    double v18 = [v17 heartbeatStats];
    double v19 = [v18 timerFiringDelayedTotalSeconds];
    uint64_t v20 = [v19 counts];
    *(_DWORD *)(v20 + 4 * v11) += v16;

    int v21 = [(RTLocationAwarenessManager *)self metrics];
    double v22 = [v21 heartbeatStats];
    double v23 = [v22 timerFiringDelayedMaxSeconds];
    signed int v24 = *(_DWORD *)([v23 counts] + 4 * v11);

    if (v24 < v16)
    {
      uint64_t v25 = [(RTLocationAwarenessManager *)self metrics];
      uint64_t v26 = [v25 heartbeatStats];
      uint64_t v27 = [v26 timerFiringDelayedMaxSeconds];
      *(_DWORD *)([v27 counts] + 4 * v11) = v16;
    }
  }
}

- (RTTimer)heartbeatTimer
{
  return self->_heartbeatTimer;
}

- (double)metricAge
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [(RTLocationAwarenessManager *)self metrics];
  double v5 = [v4 startTimestamp];
  [v3 timeIntervalSinceDate:v5];
  double v7 = v6;

  return v7;
}

- (void)considerUpdateActiveRequestMetrics
{
  [(RTLocationAwarenessManager *)self setActiveRequestInterrupted:[(RTLocationAwarenessManager *)self activeRequestInterruptedCheck]];
  uint64_t v3 = dispatch_group_create();
  id v4 = [(RTLocationAwarenessManager *)self authorizationManager];

  if (v4)
  {
    dispatch_group_enter(v3);
    double v5 = [(RTLocationAwarenessManager *)self authorizationManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke;
    v15[3] = &unk_1E6B91350;
    v15[4] = self;
    signed int v16 = v3;
    [v5 fetchRoutineEnabledWithHandler:v15];
  }
  double v6 = [(RTLocationAwarenessManager *)self wifiManager];

  if (v6)
  {
    dispatch_group_enter(v3);
    double v7 = [(RTLocationAwarenessManager *)self wifiManager];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_3;
    v13[3] = &unk_1E6B97198;
    v13[4] = self;
    int v14 = v3;
    [v7 fetchPowerStatus:v13];
  }
  -[RTLocationAwarenessManager setActiveRequestLocationServiceOn:](self, "setActiveRequestLocationServiceOn:", [MEMORY[0x1E4F1E600] locationServicesEnabled]);
  double v8 = [MEMORY[0x1E4F1C9C8] date];
  double v9 = [(RTNotifier *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_5;
  v11[3] = &unk_1E6B90BF0;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_group_notify(v3, v9, v11);
}

void __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke(uint64_t a1, char a2)
{
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_2;
  block[3] = &unk_1E6B91328;
  double v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  char v8 = a2;
  id v7 = v5;
  dispatch_async(v4, block);
}

void __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setActiveRequestRoutineOn:*(unsigned __int8 *)(a1 + 48)];
  v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_4;
  block[3] = &unk_1E6B91220;
  double v5 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  uint64_t v8 = a2;
  id v7 = v5;
  dispatch_async(v4, block);
}

void __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setActiveRequestWifiOn:*(void *)(a1 + 48) == 2];
  v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_5(uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v22 = [*(id *)(a1 + 32) activeRequestInterrupted];
    int v23 = [*(id *)(a1 + 32) activeRequestFulfilled];
    int v24 = [*(id *)(a1 + 32) activeRequestCoarseLocationReceived];
    int v25 = [*(id *)(a1 + 32) activeRequestLocationServiceOn];
    int v26 = [*(id *)(a1 + 32) activeRequestRoutineOn];
    int v27 = [*(id *)(a1 + 32) activeRequestWifiOn];
    v28[0] = 67110400;
    v28[1] = v22;
    __int16 v29 = 1024;
    int v30 = v23;
    __int16 v31 = 1024;
    int v32 = v24;
    __int16 v33 = 1024;
    int v34 = v25;
    __int16 v35 = 1024;
    int v36 = v26;
    __int16 v37 = 1024;
    int v38 = v27;
    _os_log_debug_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_DEBUG, "active request status, interrupted, %d, fulfilled, %d, coarseLocationReceived, %d, locationServiceOn, %d, routineOn, %d, wifiOn, %d", (uint8_t *)v28, 0x26u);
  }

  if ([*(id *)(a1 + 32) activeRequestInterrupted])
  {
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = [v3 metrics];
    double v5 = [v4 heartbeatStats];
    double v6 = [v5 activeRequestInterrupted];
    [v3 incrementBasicHistogram:v6 forTimestamp:*(void *)(a1 + 40)];
  }
  int v7 = [*(id *)(a1 + 32) activeRequestFulfilled];
  uint64_t v8 = *(void **)(a1 + 32);
  if (v7)
  {
    double v9 = [*(id *)(a1 + 32) metrics];
    id v10 = [v9 heartbeatStats];
    uint64_t v11 = [v10 validLocationCount];
  }
  else
  {
    if ([*(id *)(a1 + 32) activeRequestCoarseLocationReceived])
    {
      id v12 = *(void **)(a1 + 32);
      __int16 v13 = [v12 metrics];
      int v14 = [v13 heartbeatStats];
      uint64_t v15 = [v14 activeRequestTimeoutWithCoarseLocation];
      [v12 incrementBasicHistogram:v15 forTimestamp:*(void *)(a1 + 40)];
    }
    char v16 = [*(id *)(a1 + 32) activeRequestLocationServiceOn];
    uint64_t v8 = *(void **)(a1 + 32);
    if (v16)
    {
      char v17 = [*(id *)(a1 + 32) activeRequestRoutineOn];
      uint64_t v8 = *(void **)(a1 + 32);
      if (v17)
      {
        char v18 = [*(id *)(a1 + 32) activeRequestWifiOn];
        uint64_t v8 = *(void **)(a1 + 32);
        double v9 = [v8 metrics];
        double v19 = [v9 heartbeatStats];
        id v10 = v19;
        if (v18) {
          [v19 activeRequestTimeoutWithOtherReasons];
        }
        else {
        uint64_t v11 = [v19 activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff];
        }
      }
      else
      {
        double v9 = [*(id *)(a1 + 32) metrics];
        id v10 = [v9 heartbeatStats];
        uint64_t v11 = [v10 activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled];
      }
    }
    else
    {
      double v9 = [*(id *)(a1 + 32) metrics];
      id v10 = [v9 heartbeatStats];
      uint64_t v11 = [v10 activeRequestTimeoutWithLocationServiceDisabled];
    }
  }
  uint64_t v20 = (void *)v11;
  [v8 incrementBasicHistogram:v11 forTimestamp:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) resetActiveRequestSummaryVariables];
  [*(id *)(a1 + 32) setActiveOnset:0];
  int v21 = [*(id *)(a1 + 32) heartbeatBuffer];
  [v21 dispatchPendingInvocations];
}

- (BOOL)activeRequestInterruptedCheck
{
  uint64_t v3 = [(RTLocationAwarenessManager *)self scheduledRestTimerFiringTime];

  if (v3)
  {
    id v4 = [MEMORY[0x1E4F1C9C8] date];
    double v5 = [(RTLocationAwarenessManager *)self scheduledRestTimerFiringTime];
    [v4 timeIntervalSinceDate:v5];
    double v7 = v6;
    uint64_t v8 = [(RTLocationAwarenessManager *)self config];
    [v8 heartbeatIntervalResolution];
    BOOL v10 = v7 > v9 * 0.5;
  }
  else
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v13 = 0;
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "Unable to check for active request interruption: nil scheduledRestTimerFiringTime.", v13, 2u);
    }

    return 0;
  }
  return v10;
}

- (void)resetActiveRequestSummaryVariables
{
  [(RTLocationAwarenessManager *)self setActiveRequestInterrupted:0];
  [(RTLocationAwarenessManager *)self setActiveRequestFulfilled:0];
  [(RTLocationAwarenessManager *)self setActiveRequestCoarseLocationReceived:0];
  [(RTLocationAwarenessManager *)self setActiveRequestLocationServiceOn:1];
  [(RTLocationAwarenessManager *)self setActiveRequestRoutineOn:1];

  [(RTLocationAwarenessManager *)self setActiveRequestWifiOn:1];
}

- (RTLocationAwarenessManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocationManager_config_metricManager_motionActivityManager_authorizationManager_wifiManager_xpcActivityManager_timerManager_learnedLocationStore_);
}

- (RTLocationAwarenessManager)initWithLocationManager:(id)a3 config:(id)a4 metricManager:(id)a5 motionActivityManager:(id)a6 authorizationManager:(id)a7 wifiManager:(id)a8 xpcActivityManager:(id)a9 timerManager:(id)a10 learnedLocationStore:(id)a11
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v56 = a5;
  id v19 = a5;
  id v62 = a6;
  id v57 = a7;
  id v61 = a7;
  id v58 = a8;
  id v60 = a8;
  id v20 = a9;
  id v21 = a10;
  id v59 = a11;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    int v22 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v65 = "-[RTLocationAwarenessManager initWithLocationManager:config:metricManager:motionActivityManager:authorizatio"
            "nManager:wifiManager:xpcActivityManager:timerManager:learnedLocationStore:]";
      __int16 v66 = 1024;
      int v67 = 85;
      _os_log_error_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager (in %s:%d)", buf, 0x12u);
    }

    if (v18)
    {
LABEL_3:
      if (v20) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  int v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v65 = "-[RTLocationAwarenessManager initWithLocationManager:config:metricManager:motionActivityManager:authorizationM"
          "anager:wifiManager:xpcActivityManager:timerManager:learnedLocationStore:]";
    __int16 v66 = 1024;
    int v67 = 86;
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: config (in %s:%d)", buf, 0x12u);
  }

  if (v20)
  {
LABEL_4:
    if (v21) {
      goto LABEL_18;
    }
    goto LABEL_15;
  }
LABEL_12:
  int v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v65 = "-[RTLocationAwarenessManager initWithLocationManager:config:metricManager:motionActivityManager:authorizationM"
          "anager:wifiManager:xpcActivityManager:timerManager:learnedLocationStore:]";
    __int16 v66 = 1024;
    int v67 = 91;
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: xpcActivityManager (in %s:%d)", buf, 0x12u);
  }

  if (!v21)
  {
LABEL_15:
    int v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v65 = "-[RTLocationAwarenessManager initWithLocationManager:config:metricManager:motionActivityManager:authorizatio"
            "nManager:wifiManager:xpcActivityManager:timerManager:learnedLocationStore:]";
      __int16 v66 = 1024;
      int v67 = 92;
      _os_log_error_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: timerManager (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_18:
  int v26 = 0;
  if (v17 && v18 && v20)
  {
    v63.receiver = self;
    v63.super_class = (Class)RTLocationAwarenessManager;
    int v27 = [(RTNotifier *)&v63 init];
    if (v27)
    {
      uint64_t v28 = [v18 copy];
      config = v27->_config;
      v27->_config = (RTLocationAwarenessManagerConfig *)v28;

      uint64_t v30 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:5 valueOptions:0x10000];
      requesterToHeartbeatBucket = v27->_requesterToHeartbeatBucket;
      v27->_requesterToHeartbeatBucket = (NSMapTable *)v30;

      uint64_t v32 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0x10000 valueOptions:0];
      heartbeatBucketToRequesters = v27->_heartbeatBucketToRequesters;
      v27->_heartbeatBucketToRequesters = (NSMapTable *)v32;

      objc_storeStrong((id *)&v27->_timerManager, a10);
      objc_storeStrong((id *)&v27->_locationManager, a3);
      activeOnset = v27->_activeOnset;
      v27->_activeOnset = 0;

      minHeartbeatBucket = v27->_minHeartbeatBucket;
      v27->_minHeartbeatBucket = 0;

      lastValidLocation = v27->_lastValidLocation;
      v27->_lastValidLocation = 0;

      objc_storeStrong((id *)&v27->_motionActivityManager, a6);
      uint64_t v37 = [MEMORY[0x1E4F1C9C8] distantFuture];
      stationaryStartTimestamp = v27->_stationaryStartTimestamp;
      v27->_stationaryStartTimestamp = (NSDate *)v37;

      uint64_t v39 = [RTInvocationDispatcher alloc];
      __int16 v40 = [(RTNotifier *)v27 queue];
      uint64_t v41 = [(RTInvocationDispatcher *)v39 initWithQueue:v40];
      heartbeatBuffer = v27->_heartbeatBuffer;
      v27->_heartbeatBuffer = (RTInvocationDispatcher *)v41;

      uint64_t v43 = objc_opt_new();
      metrics = v27->_metrics;
      v27->_metrics = (RTLocationAwarenessMetrics *)v43;

      objc_storeStrong((id *)&v27->_metricManager, v56);
      objc_storeStrong((id *)&v27->_learnedLocationStore, a11);
      lastLocationAnyPositive = v27->_lastLocationAnyPositive;
      v27->_lastLocationAnyPositive = 0;

      lastLocationLessThan200m = v27->_lastLocationLessThan200m;
      v27->_lastLocationLessThan200m = 0;

      lastLocationLessThan55m = v27->_lastLocationLessThan55m;
      v27->_lastLocationLessThan55m = 0;

      lastLocationLessThan20m = v27->_lastLocationLessThan20m;
      v27->_lastLocationLessThan20m = 0;

      lastLocationLessThan10m = v27->_lastLocationLessThan10m;
      v27->_lastLocationLessThan10m = 0;

      objc_storeStrong((id *)&v27->_authorizationManager, v57);
      objc_storeStrong((id *)&v27->_wifiManager, v58);
      objc_storeStrong((id *)&v27->_xpcActivityManager, a9);
      uint64_t v50 = objc_opt_new();
      highAccuracyLocationRequesters = v27->_highAccuracyLocationRequesters;
      v27->_highAccuracyLocationRequesters = (NSMutableSet *)v50;

      uint64_t v52 = objc_opt_new();
      fixedRateLocationRequesters = v27->_fixedRateLocationRequesters;
      v27->_fixedRateLocationRequesters = (NSMutableSet *)v52;

      v27->_requestedHighAccuracyLocation = 0;
      [(RTService *)v27 setup];
    }
    self = v27;
    int v26 = self;
  }

  return v26;
}

- (void)_setup
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      double v5 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      id v18 = v5;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, all day GNSS feature enabled", buf, 0xCu);
    }
    double v6 = [MEMORY[0x1E4F1C9C8] date];
    activeOnset = self->_activeOnset;
    self->_activeOnset = v6;

    [(RTLocationAwarenessManager *)self setRequestedHighAccuracyLocation:1];
    uint64_t v8 = [(RTLocationAwarenessManager *)self locationManager];
    double v9 = +[RTNotification notificationName];
    [v8 addObserver:self selector:sel_onNoOpLocationNotification_ name:v9];
  }
  else
  {
    BOOL v10 = [(RTLocationAwarenessManager *)self locationManager];
    uint64_t v11 = +[RTNotification notificationName];
    [v10 addObserver:self selector:sel_onLeechedLocationNotification_ name:v11];

    id v12 = [(RTLocationAwarenessManager *)self motionActivityManager];
    __int16 v13 = +[RTNotification notificationName];
    [v12 addObserver:self selector:sel_onMotionActivityManagerNotificationActivityNotification_ name:v13];

    int v14 = [(RTLocationAwarenessManager *)self motionActivityManager];
    uint64_t v15 = +[RTNotification notificationName];
    [v14 addObserver:self selector:sel_onMotionActivityManagerNotificationActivityNotification_ name:v15];

    id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:self selector:sel_onDailyMetricsNotification_ name:@"RTMetricManagerDailyMetricNotification" object:0];
  }
}

- (void)_shutdownWithHandler:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  uint64_t v52 = (void (**)(id, id))a3;
  [(RTTimer *)self->_heartbeatTimer invalidate];
  heartbeatTimer = self->_heartbeatTimer;
  self->_heartbeatTimer = 0;

  [(RTLocationAwarenessManager *)self onRest];
  double v5 = [(RTLocationAwarenessManager *)self locationManager];
  [v5 removeObserver:self];

  double v6 = [(RTLocationAwarenessManager *)self motionActivityManager];
  [v6 removeObserver:self];

  double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 removeObserver:self];

  uint64_t v8 = [(RTLocationAwarenessManager *)self heartbeatBuffer];
  [v8 shutdown];

  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  BOOL v10 = [(RTLocationAwarenessManager *)self xpcActivityManager];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __51__RTLocationAwarenessManager__shutdownWithHandler___block_invoke;
  v55[3] = &unk_1E6B90840;
  uint64_t v11 = v9;
  id v56 = v11;
  [v10 unregisterActivityWithIdentifier:@"com.apple.routined.locationAwareness.heartbeat" handler:v55];

  id v12 = v11;
  __int16 v13 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v14 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v12, v14))
  {
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
    [v15 timeIntervalSinceDate:v13];
    double v17 = v16;
    id v18 = objc_opt_new();
    uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_107];
    id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
    id v21 = [v20 filteredArrayUsingPredicate:v19];
    int v22 = [v21 firstObject];

    [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
    int v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    int v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F5CFE8];
    uint64_t v57 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    int v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v57 count:1];
    int v27 = [v24 errorWithDomain:v25 code:15 userInfo:v26];

    if (v27)
    {
      id v28 = v27;
    }
    else
    {
      id v28 = 0;
    }
  }
  else
  {
    id v28 = 0;
  }

  id v29 = v28;
  dispatch_semaphore_t v30 = dispatch_semaphore_create(0);

  __int16 v31 = [(RTLocationAwarenessManager *)self xpcActivityManager];
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __51__RTLocationAwarenessManager__shutdownWithHandler___block_invoke_2;
  v53[3] = &unk_1E6B90840;
  uint64_t v32 = v30;
  v54 = v32;
  [v31 unregisterActivityWithIdentifier:@"com.apple.routined.locationAwareness.highAccuracyLocationRequest" handler:v53];

  __int16 v33 = v32;
  int v34 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v35 = dispatch_time(0, 3600000000000);
  id v36 = v29;
  if (dispatch_semaphore_wait(v33, v35))
  {
    v51 = [MEMORY[0x1E4F1C9C8] now];
    [v51 timeIntervalSinceDate:v34];
    double v38 = v37;
    uint64_t v39 = objc_opt_new();
    __int16 v40 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_107];
    uint64_t v41 = [MEMORY[0x1E4F29060] callStackSymbols];
    uint64_t v42 = [v41 filteredArrayUsingPredicate:v40];
    uint64_t v43 = [v42 firstObject];

    [v39 submitToCoreAnalytics:v43 type:1 duration:v38];
    double v44 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v44, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    double v45 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F5CFE8];
    uint64_t v57 = *MEMORY[0x1E4F28568];
    *(void *)buf = @"semaphore wait timeout";
    double v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v57 count:1];
    v48 = [v45 errorWithDomain:v46 code:15 userInfo:v47];

    id v36 = v29;
    if (v48)
    {
      id v36 = v48;
    }
  }

  id v49 = v36;
  xpcActivityPowerAssertion = self->_xpcActivityPowerAssertion;
  self->_xpcActivityPowerAssertion = 0;

  if (v52) {
    v52[2](v52, v49);
  }
}

intptr_t __51__RTLocationAwarenessManager__shutdownWithHandler___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __51__RTLocationAwarenessManager__shutdownWithHandler___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_onDailyMetricsNotification:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    double v7 = NSStringFromSelector(a2);
    int v11 = 138412546;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%@, received notification, %@", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_semaphore_t v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v8 sinceDate:-86400.0];
  BOOL v10 = [[RTLocationAwarenessMetricManager alloc] initWithLocationManager:self->_locationManager motionManager:self->_motionActivityManager learnedLocationStore:self->_learnedLocationStore startDate:v9 endDate:v8];
  [(RTLocationAwarenessMetricManager *)v10 submitMetrics];
}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4 = a3;
  id v5 = [(RTNotifier *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__RTLocationAwarenessManager_onDailyMetricsNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __57__RTLocationAwarenessManager_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDailyMetricsNotification:*(void *)(a1 + 40)];
}

- (void)setMinHeartbeatBucket:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (unint64_t)a3;
  minHeartbeatBucket = self->_minHeartbeatBucket;
  if (v5 | (unint64_t)minHeartbeatBucket
    && (!v5 || !minHeartbeatBucket || [(NSNumber *)minHeartbeatBucket compare:v5]))
  {
    objc_storeStrong((id *)&self->_minHeartbeatBucket, a3);
    double v7 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      unint64_t v9 = v5;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "Set minHeartbeatBucket to %@.", (uint8_t *)&v8, 0xCu);
    }

    [(RTLocationAwarenessManager *)self adjustHeartbeatTimer];
  }
}

- (BOOL)addLocationHeartbeatRequester:(id)a3 interval:(double)a4 error:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (!v8)
  {
    if (!a5) {
      goto LABEL_11;
    }
    int v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v12 = *MEMORY[0x1E4F5CFE8];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    v28[0] = @"Requester should not be nil.";
    __int16 v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:&v27 count:1];
    *a5 = [v11 errorWithDomain:v12 code:0 userInfo:v13];

LABEL_10:
    LOBYTE(a5) = 0;
    goto LABEL_11;
  }
  if (![(RTLocationAwarenessManager *)self validInterval:a4])
  {
    if (!a5) {
      goto LABEL_11;
    }
    id v14 = NSString;
    uint64_t v15 = [(RTLocationAwarenessManager *)self config];
    [v15 maxHeartbeatInterval];
    double v17 = [[v14 stringWithFormat:@"Interval should be between 0 and %f.", v16];

    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = *MEMORY[0x1E4F5CFE8];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    int v26 = v17;
    id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    *a5 = [v18 errorWithDomain:v19 code:1 userInfo:v20];

    goto LABEL_10;
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__RTLocationAwarenessManager_addLocationHeartbeatRequester_interval_error___block_invoke;
  v22[3] = &unk_1E6B91220;
  v22[4] = self;
  double v24 = a4;
  id v23 = v8;
  unint64_t v9 = (void *)MEMORY[0x1E016DB00](v22);
  uint64_t v10 = [(RTNotifier *)self queue];
  dispatch_async(v10, v9);

  if (a5) {
    *a5 = 0;
  }

  LOBYTE(a5) = 1;
LABEL_11:

  return (char)a5;
}

void __75__RTLocationAwarenessManager_addLocationHeartbeatRequester_interval_error___block_invoke(uint64_t a1)
{
  id v12 = [*(id *)(a1 + 32) heartbeatBucketForInterval:*(double *)(a1 + 48)];
  uint64_t v2 = [*(id *)(a1 + 32) requesterToHeartbeatBucket];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (!v3 || [v12 compare:v3])
  {
    id v4 = [*(id *)(a1 + 32) heartbeatBucketToRequesters];
    unint64_t v5 = [v4 objectForKey:v3];
    [v5 removeObject:*(void *)(a1 + 40)];

    id v6 = [*(id *)(a1 + 32) requesterToHeartbeatBucket];
    [v6 setObject:v12 forKey:*(void *)(a1 + 40)];

    double v7 = [*(id *)(a1 + 32) heartbeatBucketToRequesters];
    id v8 = [v7 objectForKey:v12];

    if (!v8)
    {
      id v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
      unint64_t v9 = [*(id *)(a1 + 32) heartbeatBucketToRequesters];
      [v9 setObject:v8 forKey:v12];
    }
    [v8 addObject:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) updateMinHeartbeatBucket];
    uint64_t v10 = *(void **)(a1 + 32);
    int v11 = [v10 requesterToHeartbeatBucket];
    [v10 _updateXPCActivityForObserverCount:[v11 count]];
  }
}

- (void)removeLocationHeartbeatRequester:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __63__RTLocationAwarenessManager_removeLocationHeartbeatRequester___block_invoke;
  int v11 = &unk_1E6B90BF0;
  id v12 = v4;
  __int16 v13 = self;
  id v5 = v4;
  id v6 = (void *)MEMORY[0x1E016DB00](&v8);
  double v7 = [(RTNotifier *)self queue];
  dispatch_async(v7, v6);
}

void __63__RTLocationAwarenessManager_removeLocationHeartbeatRequester___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) requesterToHeartbeatBucket];
    id v8 = [v2 objectForKey:*(void *)(a1 + 32)];

    if (v8)
    {
      uint64_t v3 = [*(id *)(a1 + 40) requesterToHeartbeatBucket];
      [v3 removeObjectForKey:*(void *)(a1 + 32)];

      id v4 = [*(id *)(a1 + 40) heartbeatBucketToRequesters];
      id v5 = [v4 objectForKey:v8];
      [v5 removeObject:*(void *)(a1 + 32)];

      [*(id *)(a1 + 40) updateMinHeartbeatBucket];
      id v6 = *(void **)(a1 + 40);
      double v7 = [v6 requesterToHeartbeatBucket];
      [v6 _updateXPCActivityForObserverCount:[v7 count]];
    }
  }
}

- (void)_addHighAccuracyLocationRequester:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLocationAwarenessManager *)self highAccuracyLocationRequesters];
  uint64_t v6 = [v5 count];

  double v7 = [(RTLocationAwarenessManager *)self highAccuracyLocationRequesters];
  [v7 addObject:v4];

  if (!v6)
  {
    [(RTLocationAwarenessManager *)self _updateXPCActivityForHighAccuracyLocationRequest];
  }
}

- (void)_removeHighAccuracyLocationRequester:(id)a3
{
  id v11 = a3;
  id v4 = [(RTLocationAwarenessManager *)self highAccuracyLocationRequesters];
  uint64_t v5 = [v4 count];

  uint64_t v6 = [(RTLocationAwarenessManager *)self highAccuracyLocationRequesters];
  int v7 = [v6 containsObject:v11];

  if (v7)
  {
    id v8 = [(RTLocationAwarenessManager *)self highAccuracyLocationRequesters];
    [v8 removeObject:v11];

    if (v5 == 1)
    {
      uint64_t v9 = [(RTLocationAwarenessManager *)self highAccuracyLocationRequesters];
      uint64_t v10 = [v9 count];

      if (!v10) {
        [(RTLocationAwarenessManager *)self _updateXPCActivityForHighAccuracyLocationRequest];
      }
    }
  }
}

- (BOOL)addHighAccuracyLocationRequester:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, Add high accuracy location requester, %@", buf, 0x16u);
    }
    uint64_t v10 = [(RTNotifier *)self queue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__RTLocationAwarenessManager_addHighAccuracyLocationRequester_error___block_invoke;
    v13[3] = &unk_1E6B90BF0;
    v13[4] = self;
    id v14 = v7;
    dispatch_async(v10, v13);

    if (a4) {
      *a4 = 0;
    }
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: requester", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"requester");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7 != 0;
}

uint64_t __69__RTLocationAwarenessManager_addHighAccuracyLocationRequester_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addHighAccuracyLocationRequester:*(void *)(a1 + 40)];
}

- (BOOL)removeHighAccuracyLocationRequester:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, Remove high accuracy location requester, %@", buf, 0x16u);
    }
    uint64_t v10 = [(RTNotifier *)self queue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__RTLocationAwarenessManager_removeHighAccuracyLocationRequester_error___block_invoke;
    v13[3] = &unk_1E6B90BF0;
    v13[4] = self;
    id v14 = v7;
    dispatch_async(v10, v13);
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: requester", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"requester");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7 != 0;
}

uint64_t __72__RTLocationAwarenessManager_removeHighAccuracyLocationRequester_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeHighAccuracyLocationRequester:*(void *)(a1 + 40)];
}

- (BOOL)addFixedRateLocationRequester:(id)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (v7)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v9;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%@, Add fixed rate location requester, %@", buf, 0x16u);
    }
    uint64_t v10 = [(RTNotifier *)self queue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __66__RTLocationAwarenessManager_addFixedRateLocationRequester_error___block_invoke;
    v13[3] = &unk_1E6B90BF0;
    v13[4] = self;
    id v14 = v7;
    dispatch_async(v10, v13);

    if (a4) {
      *a4 = 0;
    }
  }
  else
  {
    id v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: requester", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate(@"requester");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7 != 0;
}

uint64_t __66__RTLocationAwarenessManager_addFixedRateLocationRequester_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addFixedRateLocationRequester:*(void *)(a1 + 40)];
}

- (void)removeFixedRateLocationRequester:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    uint64_t v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v14 = "-[RTLocationAwarenessManager removeFixedRateLocationRequester:]";
      __int16 v15 = 1024;
      LODWORD(v16) = 427;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: requester (in %s:%d)", buf, 0x12u);
    }
  }
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    id v8 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, Remove fixed rate location requester, %@", buf, 0x16u);
  }
  uint64_t v9 = [(RTNotifier *)self queue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __63__RTLocationAwarenessManager_removeFixedRateLocationRequester___block_invoke;
  v11[3] = &unk_1E6B90BF0;
  v11[4] = self;
  id v12 = v5;
  id v10 = v5;
  dispatch_async(v9, v11);
}

uint64_t __63__RTLocationAwarenessManager_removeFixedRateLocationRequester___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeFixedRateLocationRequester:*(void *)(a1 + 40)];
}

- (void)_addFixedRateLocationRequester:(id)a3
{
  id v4 = a3;
  id v5 = [(RTLocationAwarenessManager *)self fixedRateLocationRequesters];
  uint64_t v6 = [v5 count];

  id v7 = [(RTLocationAwarenessManager *)self fixedRateLocationRequesters];
  [v7 addObject:v4];

  if (!v6)
  {
    [(RTLocationAwarenessManager *)self _requestForFixedRateLocation];
  }
}

- (void)_removeFixedRateLocationRequester:(id)a3
{
  id v13 = a3;
  id v4 = [(RTLocationAwarenessManager *)self fixedRateLocationRequesters];
  uint64_t v5 = [v4 count];

  uint64_t v6 = [(RTLocationAwarenessManager *)self fixedRateLocationRequesters];
  int v7 = [v6 containsObject:v13];

  if (v7)
  {
    id v8 = [(RTLocationAwarenessManager *)self fixedRateLocationRequesters];
    [v8 removeObject:v13];

    if (v5 == 1)
    {
      uint64_t v9 = [(RTLocationAwarenessManager *)self fixedRateLocationRequesters];
      uint64_t v10 = [v9 count];

      if (!v10)
      {
        id v11 = [(RTLocationAwarenessManager *)self locationManager];
        id v12 = +[RTNotification notificationName];
        [v11 removeObserver:self fromNotification:v12];
      }
    }
  }
}

- (void)_updateXPCActivityForHighAccuracyLocationRequest
{
  location[1] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = [(RTLocationAwarenessManager *)self highAccuracyLocationRequesters];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v6 = [(RTLocationAwarenessManager *)self highAccuracyLocationRequesters];
    uint64_t v7 = [v6 count];

    if (v7 != 1) {
      return;
    }
    id v8 = [[RTXPCActivityCriteria alloc] initWithInterval:1 gracePeriod:0 priority:0 requireNetworkConnectivity:0 requireInexpensiveNetworkConnectivity:0 networkTransferDirection:1 allowBattery:1800.0 powerNap:900.0];
    objc_initWeak(location, self);
    uint64_t v9 = [(RTLocationAwarenessManager *)self xpcActivityManager];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __78__RTLocationAwarenessManager__updateXPCActivityForHighAccuracyLocationRequest__block_invoke_2;
    v27[3] = &unk_1E6B928D0;
    v28[1] = (id)a2;
    objc_copyWeak(v28, location);
    [v9 registerActivityWithIdentifier:@"com.apple.routined.locationAwareness.highAccuracyLocationRequest" criteria:v8 handler:v27];

    objc_destroyWeak(v28);
    objc_destroyWeak(location);
  }
  else
  {
    if ([(RTLocationAwarenessManager *)self requestedHighAccuracyLocation]) {
      [(RTLocationAwarenessManager *)self onRest];
    }
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
    id v11 = [(RTLocationAwarenessManager *)self xpcActivityManager];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __78__RTLocationAwarenessManager__updateXPCActivityForHighAccuracyLocationRequest__block_invoke;
    v29[3] = &unk_1E6B90840;
    id v12 = v10;
    dispatch_semaphore_t v30 = v12;
    [v11 unregisterActivityWithIdentifier:@"com.apple.routined.locationAwareness.highAccuracyLocationRequest" handler:v29];

    id v8 = v12;
    id v13 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v14 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(&v8->super, v14))
    {
      __int16 v15 = [MEMORY[0x1E4F1C9C8] now];
      [v15 timeIntervalSinceDate:v13];
      double v17 = v16;
      id v18 = objc_opt_new();
      uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_107];
      id v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v21 = [v20 filteredArrayUsingPredicate:v19];
      int v22 = [v21 firstObject];

      [v18 submitToCoreAnalytics:v22 type:1 duration:v17];
      id v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)location, 2u);
      }

      double v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      location[0] = @"semaphore wait timeout";
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:location forKeys:&v31 count:1];
      int v26 = [v24 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v25];

      if (v26) {
    }
      }
  }
}

intptr_t __78__RTLocationAwarenessManager__updateXPCActivityForHighAccuracyLocationRequest__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __78__RTLocationAwarenessManager__updateXPCActivityForHighAccuracyLocationRequest__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v11 = 138412546;
      id v12 = v8;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", (uint8_t *)&v11, 0x16u);
    }
    if (v5) {
      v5[2](v5, v6);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    dispatch_semaphore_t v10 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained requestForHighAccuracyLocation];
    }
    if (v5) {
      v5[2](v5, 0);
    }
  }
}

- (void)_updateXPCActivityForObserverCount:(unint64_t)a3
{
  location[1] = *(id *)MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    id v8 = [[RTXPCActivityCriteria alloc] initWithInterval:1 gracePeriod:0 priority:0 requireNetworkConnectivity:0 requireInexpensiveNetworkConnectivity:1 networkTransferDirection:0 allowBattery:3600.0 powerNap:1800.0];
    objc_initWeak(location, self);
    double v24 = [(RTLocationAwarenessManager *)self xpcActivityManager];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __65__RTLocationAwarenessManager__updateXPCActivityForObserverCount___block_invoke_2;
    v25[3] = &unk_1E6B928D0;
    v26[1] = (id)a2;
    objc_copyWeak(v26, location);
    [v24 registerActivityWithIdentifier:@"com.apple.routined.locationAwareness.heartbeat" criteria:v8 handler:v25];

    objc_destroyWeak(v26);
    objc_destroyWeak(location);
  }
  else
  {
    if (a3) {
      return;
    }
    xpcActivityPowerAssertion = self->_xpcActivityPowerAssertion;
    self->_xpcActivityPowerAssertion = 0;

    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    id v6 = [(RTLocationAwarenessManager *)self xpcActivityManager];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __65__RTLocationAwarenessManager__updateXPCActivityForObserverCount___block_invoke;
    v27[3] = &unk_1E6B90840;
    uint64_t v7 = v5;
    id v28 = v7;
    [v6 unregisterActivityWithIdentifier:@"com.apple.routined.locationAwareness.heartbeat" handler:v27];

    id v8 = v7;
    uint64_t v9 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v10 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(&v8->super, v10))
    {
      int v11 = [MEMORY[0x1E4F1C9C8] now];
      [v11 timeIntervalSinceDate:v9];
      double v13 = v12;
      id v14 = objc_opt_new();
      uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_107];
      double v16 = [MEMORY[0x1E4F29060] callStackSymbols];
      double v17 = [v16 filteredArrayUsingPredicate:v15];
      id v18 = [v17 firstObject];

      [v14 submitToCoreAnalytics:v18 type:1 duration:v13];
      uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_fault_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)location, 2u);
      }

      id v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v29 = *MEMORY[0x1E4F28568];
      location[0] = @"semaphore wait timeout";
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:location forKeys:&v29 count:1];
      int v22 = [v20 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v21];

      if (v22) {
    }
      }
  }
}

intptr_t __65__RTLocationAwarenessManager__updateXPCActivityForObserverCount___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__RTLocationAwarenessManager__updateXPCActivityForObserverCount___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412546;
      id v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);
    }
    if (v5) {
      v5[2](v5, v6);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __65__RTLocationAwarenessManager__updateXPCActivityForObserverCount___block_invoke_59;
      v10[3] = &unk_1E6B90890;
      uint64_t v12 = *(void *)(a1 + 40);
      int v11 = v5;
      [WeakRetained hourlySingleShotWithHandler:v10];
    }
    else if (v5)
    {
      v5[2](v5, 0);
    }
  }
}

void __65__RTLocationAwarenessManager__updateXPCActivityForObserverCount___block_invoke_59(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      dispatch_semaphore_t v5 = NSStringFromSelector(*(SEL *)(a1 + 40));
      int v7 = 138412546;
      id v8 = v5;
      __int16 v9 = 2112;
      id v10 = v3;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, failed hourly single shot, error, %@", (uint8_t *)&v7, 0x16u);
    }
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
}

uint64_t __59__RTLocationAwarenessManager_considerRequestingForLocation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) onRest];
}

- (void)hourlySingleShotWithHandler:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke;
  block[3] = &unk_1E6B921E0;
  id v9 = v5;
  SEL v10 = a2;
  void block[4] = self;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) wifiManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_2;
  v5[3] = &unk_1E6B9B438;
  v5[4] = *(void *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  id v3 = (id)v4;
  long long v6 = v4;
  [v2 fetchPowerStatus:v5];
}

void __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  long long v4 = [*(id *)(a1 + 32) queue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_3;
  v8[3] = &unk_1E6B9B410;
  long long v6 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v10 = a2;
  uint64_t v11 = v5;
  id v7 = v6;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  dispatch_async(v4, v8);
}

void __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 48) == 2)
  {
    uint64_t v2 = [(id)objc_opt_class() powerAssertion];
    [*(id *)(a1 + 32) setXpcActivityPowerAssertion:v2];

    id v3 = [*(id *)(a1 + 32) locationManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_64;
    v7[3] = &unk_1E6B93AD0;
    long long v4 = *(void **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v4;
    [v3 fetchCurrentLocationWithHandler:v7];
  }
  else
  {
    uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      long long v6 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412290;
      uint64_t v10 = v6;
      _os_log_debug_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_DEBUG, "%@, wifi requirement not satisfied, defer hourly single shot", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_64(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_2_65;
  block[3] = &unk_1E6B92668;
  long long v6 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v9 = v4;
  id v10 = v6;
  id v7 = v4;
  dispatch_async(v5, block);
}

uint64_t __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_2_65(uint64_t a1)
{
  [*(id *)(a1 + 32) setXpcActivityPowerAssertion:0];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)requestForHighAccuracyLocation
{
  id v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__RTLocationAwarenessManager_requestForHighAccuracyLocation__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __60__RTLocationAwarenessManager_requestForHighAccuracyLocation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestForHighAccuracyLocation];
}

- (void)_requestForHighAccuracyLocation
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (self->_restTimer
    && ![(RTLocationAwarenessManager *)self requestedHighAccuracyLocation])
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      id v28 = NSStringFromSelector(a2);
      restTimer = self->_restTimer;
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v28;
      __int16 v33 = 2048;
      int v34 = restTimer;
      _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "%@, Stop rest timer %p to start high accuracy location request.", buf, 0x16u);
    }
    [(RTLocationAwarenessManager *)self onRest];
  }
  uint64_t v5 = [MEMORY[0x1E4F1C9C8] date];
  activeOnset = self->_activeOnset;
  self->_activeOnset = v5;

  [(RTLocationAwarenessManager *)self setRequestedHighAccuracyLocation:1];
  id v7 = [(RTLocationAwarenessManager *)self locationManager];
  id v8 = +[RTNotification notificationName];
  [v7 addObserver:self selector:sel_onNoOpLocationNotification_ name:v8];

  timerManager = self->_timerManager;
  id v10 = NSString;
  uint64_t v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  double v13 = [v10 stringWithFormat:@"%@.restTimer", v12];
  id v14 = [(RTNotifier *)self queue];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __61__RTLocationAwarenessManager__requestForHighAccuracyLocation__block_invoke;
  v30[3] = &unk_1E6B90E70;
  v30[4] = self;
  __int16 v15 = [(RTTimerManager *)timerManager timerWithIdentifier:v13 queue:v14 handler:v30];
  id v16 = self->_restTimer;
  self->_restTimer = v15;

  uint64_t v17 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = NSStringFromSelector(a2);
    uint64_t v19 = [(RTLocationAwarenessManager *)self restTimer];
    id v20 = [(RTLocationAwarenessManager *)self config];
    [v20 highAccuracyLocationRequestDuration];
    *(_DWORD *)buf = 138412802;
    uint64_t v32 = v18;
    __int16 v33 = 2048;
    int v34 = v19;
    __int16 v35 = 2048;
    uint64_t v36 = v21;
    _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%@, Start rest timer, %p, firing delay, %f secs.", buf, 0x20u);
  }
  int v22 = self->_restTimer;
  id v23 = [(RTLocationAwarenessManager *)self config];
  [v23 highAccuracyLocationRequestDuration];
  double v25 = v24;
  int v26 = [(RTLocationAwarenessManager *)self config];
  [v26 dispatchTimerLeeway];
  [(RTTimer *)v22 fireAfterDelay:v25 interval:INFINITY leeway:v27];

  [(RTTimer *)self->_restTimer resume];
}

uint64_t __61__RTLocationAwarenessManager__requestForHighAccuracyLocation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) onRest];
}

- (void)requestForFixedRateLocation
{
  id v3 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__RTLocationAwarenessManager_requestForFixedRateLocation__block_invoke;
  block[3] = &unk_1E6B90E70;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __57__RTLocationAwarenessManager_requestForFixedRateLocation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _requestForFixedRateLocation];
}

- (void)_requestForFixedRateLocation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(RTLocationAwarenessManager *)self requestedFixedRateLocation])
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v7 = "-[RTLocationAwarenessManager _requestForFixedRateLocation]";
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, Rhythmic request ongoing, do nothing", buf, 0xCu);
    }
  }
  else
  {
    id v5 = [(RTLocationAwarenessManager *)self locationManager];
    id v4 = +[RTNotification notificationName];
    [v5 addObserver:self selector:sel_onNoOpLocationNotification_ name:v4];
  }
}

- (void)onMotionActivityManagerNotificationActivityNotification:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v6 = [v5 name];
  id v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __86__RTLocationAwarenessManager_onMotionActivityManagerNotificationActivityNotification___block_invoke;
    v22[3] = &unk_1E6B90BF0;
    id v23 = v5;
    double v24 = self;
    id v9 = (void *)MEMORY[0x1E016DB00](v22);
    id v10 = [(RTNotifier *)self queue];
    dispatch_async(v10, v9);

    uint64_t v11 = v23;
  }
  else
  {
    uint64_t v12 = [v5 name];
    double v13 = +[RTNotification notificationName];
    int v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __86__RTLocationAwarenessManager_onMotionActivityManagerNotificationActivityNotification___block_invoke_2;
      v18[3] = &unk_1E6B91220;
      uint64_t v19 = v5;
      id v20 = self;
      SEL v21 = a2;
      __int16 v15 = (void *)MEMORY[0x1E016DB00](v18);
      id v16 = [(RTNotifier *)self queue];
      dispatch_async(v16, v15);

      uint64_t v11 = v19;
    }
    else
    {
      uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = [v5 name];
        *(_DWORD *)buf = 138412290;
        int v26 = v17;
        _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "unsupported notification, %@", buf, 0xCu);
      }
    }
  }
}

void __86__RTLocationAwarenessManager_onMotionActivityManagerNotificationActivityNotification___block_invoke(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) activity];
  if (v11
    && [v11 type] == 1
    && ((v2 = [v11 confidence] == 2, id v3 = v11, v2)
     || (v2 = [v11 confidence] == 3, id v3 = v11, v2)))
  {
    id v4 = [v3 startDate];
    long long v6 = *(void **)(a1 + 40);
    id v5 = (id *)(a1 + 40);
    id v7 = [v6 stationaryStartTimestamp];
    [v4 timeIntervalSinceDate:v7];
    double v9 = v8;

    if (v9 >= 0.0) {
      goto LABEL_10;
    }
    id v10 = [v11 startDate];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1C9C8] distantFuture];
    id v5 = (id *)(a1 + 40);
  }
  [*v5 setStationaryStartTimestamp:v10];

LABEL_10:
}

void __86__RTLocationAwarenessManager_onMotionActivityManagerNotificationActivityNotification___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  if ([v2 settledState] == 1
    && [*(id *)(a1 + 40) requestedHighAccuracyLocation])
  {
    id v3 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
      int v5 = 138412290;
      long long v6 = v4;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%@, received unsettled notification, stop requesting high accuracy location", (uint8_t *)&v5, 0xCu);
    }
    [*(id *)(a1 + 40) onRest];
  }
}

+ (id)powerAssertion
{
  id v2 = [RTPowerAssertion alloc];
  id v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  int v5 = [(RTPowerAssertion *)v2 initWithIdentifier:v4 timeout:15.0];

  return v5;
}

- (void)updateMinHeartbeatBucket
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  int v26 = objc_opt_new();
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = [(RTLocationAwarenessManager *)self heartbeatBucketToRequesters];
  uint64_t v3 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (!v3)
  {
    int v5 = 0;
    goto LABEL_17;
  }
  uint64_t v4 = v3;
  int v5 = 0;
  uint64_t v6 = *(void *)v32;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v32 != v6) {
        objc_enumerationMutation(obj);
      }
      double v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      double v9 = [(RTLocationAwarenessManager *)self heartbeatBucketToRequesters];
      id v10 = [v9 objectForKey:v8];
      id v11 = v10;
      if (!v10)
      {

LABEL_12:
        [v26 addObject:v8];
        goto LABEL_13;
      }
      uint64_t v12 = [v10 allObjects];
      uint64_t v13 = [v12 count];

      if (!v13) {
        goto LABEL_12;
      }
      if (!v5 || [v5 compare:v8] == 1)
      {
        id v14 = v8;

        int v5 = v14;
      }
LABEL_13:
    }
    uint64_t v4 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  }
  while (v4);
LABEL_17:

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v26;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * j);
        SEL v21 = [(RTLocationAwarenessManager *)self heartbeatBucketToRequesters];
        [v21 removeObjectForKey:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v17);
  }

  if (!v5)
  {
    int v22 = [(RTLocationAwarenessManager *)self heartbeatBucketToRequesters];
    uint64_t v23 = [v22 count];

    if (v23)
    {
      double v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v36 = "-[RTLocationAwarenessManager updateMinHeartbeatBucket]";
        __int16 v37 = 1024;
        int v38 = 866;
        _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, "If minBucket is nil, heartbeatBucketToRequesters should be empty. (in %s:%d)", buf, 0x12u);
      }
    }
  }
  [(RTLocationAwarenessManager *)self setMinHeartbeatBucket:v5];
}

void __50__RTLocationAwarenessManager_adjustHeartbeatTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained updateHeartbeatTimerDelayForTimestamp:*(void *)(a1 + 32) withDelay:0.0];
    [v3 considerRequestingForLocation];
    id WeakRetained = v3;
  }
}

uint64_t __41__RTLocationAwarenessManager_onHeartbeat__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) heartbeatTasks];
}

- (void)onRest
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_restTimer)
  {
    uint64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = NSStringFromSelector(a2);
      uint64_t v6 = [(RTLocationAwarenessManager *)self restTimer];
      int v13 = 138412546;
      id v14 = v5;
      __int16 v15 = 2048;
      uint64_t v16 = v6;
      _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, Invalidate rest timer, %p.", (uint8_t *)&v13, 0x16u);
    }
    [(RTTimer *)self->_restTimer invalidate];
    restTimer = self->_restTimer;
    self->_restTimer = 0;
  }
  double v8 = [(RTLocationAwarenessManager *)self activeOnset];

  if (v8)
  {
    BOOL v9 = [(RTLocationAwarenessManager *)self requestedHighAccuracyLocation];
    id v10 = [(RTLocationAwarenessManager *)self locationManager];
    if (v9)
    {
      id v11 = +[RTNotification notificationName];
      [v10 removeObserver:self fromNotification:v11];

      [(RTLocationAwarenessManager *)self setRequestedHighAccuracyLocation:0];
    }
    else
    {
      uint64_t v12 = +[RTNotification notificationName];
      [v10 removeObserver:self fromNotification:v12];
    }
    [(RTLocationAwarenessManager *)self considerUpdateActiveRequestMetrics];
  }
}

- (BOOL)validInterval:(double)a3
{
  if (a3 <= 0.0) {
    return 0;
  }
  uint64_t v4 = [(RTLocationAwarenessManager *)self config];
  [v4 maxHeartbeatInterval];
  BOOL v6 = v5 >= a3;

  return v6;
}

- (BOOL)coarseLocation:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    [v4 horizontalAccuracy];
    double v7 = v6;
    double v8 = [(RTLocationAwarenessManager *)self config];
    [v8 requiredHorizontalAccuracy];
    if (v7 <= v9)
    {
      BOOL v14 = 0;
    }
    else
    {
      [v5 horizontalAccuracy];
      double v11 = v10;
      uint64_t v12 = [(RTLocationAwarenessManager *)self config];
      [v12 maxHorizontalAccuracyForCoarseLocation];
      BOOL v14 = v11 <= v13;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)heartbeatBucketForInterval:(double)a3
{
  id v4 = [(RTLocationAwarenessManager *)self config];
  [v4 heartbeatIntervalResolution];
  unint64_t v6 = vcvtpd_u64_f64(a3 / v5);

  double v7 = NSNumber;

  return (id)[v7 numberWithUnsignedInteger:v6];
}

- (void)setMetrics:(id)a3
{
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
}

- (NSDate)scheduledRestTimerFiringTime
{
  return self->_scheduledRestTimerFiringTime;
}

- (void)setScheduledRestTimerFiringTime:(id)a3
{
}

- (BOOL)activeRequestInterrupted
{
  return self->_activeRequestInterrupted;
}

- (void)setActiveRequestInterrupted:(BOOL)a3
{
  self->_activeRequestInterrupted = a3;
}

- (BOOL)activeRequestFulfilled
{
  return self->_activeRequestFulfilled;
}

- (void)setActiveRequestFulfilled:(BOOL)a3
{
  self->_activeRequestFulfilled = a3;
}

- (BOOL)activeRequestCoarseLocationReceived
{
  return self->_activeRequestCoarseLocationReceived;
}

- (void)setActiveRequestCoarseLocationReceived:(BOOL)a3
{
  self->_activeRequestCoarseLocationReceived = a3;
}

- (BOOL)activeRequestLocationServiceOn
{
  return self->_activeRequestLocationServiceOn;
}

- (void)setActiveRequestLocationServiceOn:(BOOL)a3
{
  self->_activeRequestLocationServiceOn = a3;
}

- (BOOL)activeRequestRoutineOn
{
  return self->_activeRequestRoutineOn;
}

- (void)setActiveRequestRoutineOn:(BOOL)a3
{
  self->_activeRequestRoutineOn = a3;
}

- (BOOL)activeRequestWifiOn
{
  return self->_activeRequestWifiOn;
}

- (void)setActiveRequestWifiOn:(BOOL)a3
{
  self->_activeRequestWifiOn = a3;
}

- (NSMapTable)requesterToHeartbeatBucket
{
  return self->_requesterToHeartbeatBucket;
}

- (void)setRequesterToHeartbeatBucket:(id)a3
{
}

- (NSMapTable)heartbeatBucketToRequesters
{
  return self->_heartbeatBucketToRequesters;
}

- (void)setHeartbeatBucketToRequesters:(id)a3
{
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (void)setHeartbeatTimer:(id)a3
{
}

- (RTTimer)restTimer
{
  return self->_restTimer;
}

- (void)setRestTimer:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (void)setActiveOnset:(id)a3
{
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
}

- (RTPowerAssertion)xpcActivityPowerAssertion
{
  return self->_xpcActivityPowerAssertion;
}

- (void)setXpcActivityPowerAssertion:(id)a3
{
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
}

- (void)setStationaryStartTimestamp:(id)a3
{
}

- (RTInvocationDispatcher)heartbeatBuffer
{
  return self->_heartbeatBuffer;
}

- (void)setHeartbeatBuffer:(id)a3
{
}

- (NSMutableSet)highAccuracyLocationRequesters
{
  return self->_highAccuracyLocationRequesters;
}

- (void)setHighAccuracyLocationRequesters:(id)a3
{
}

- (NSMutableSet)fixedRateLocationRequesters
{
  return self->_fixedRateLocationRequesters;
}

- (void)setFixedRateLocationRequesters:(id)a3
{
}

- (BOOL)requestedHighAccuracyLocation
{
  return self->_requestedHighAccuracyLocation;
}

- (void)setRequestedHighAccuracyLocation:(BOOL)a3
{
  self->_requestedHighAccuracyLocation = a3;
}

- (BOOL)requestedFixedRateLocation
{
  return self->_requestedFixedRateLocation;
}

- (void)setRequestedFixedRateLocation:(BOOL)a3
{
  self->_requestedFixedRateLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedRateLocationRequesters, 0);
  objc_storeStrong((id *)&self->_highAccuracyLocationRequesters, 0);
  objc_storeStrong((id *)&self->_heartbeatBuffer, 0);
  objc_storeStrong((id *)&self->_stationaryStartTimestamp, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_xpcActivityPowerAssertion, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_lastValidLocation, 0);
  objc_storeStrong((id *)&self->_minHeartbeatBucket, 0);
  objc_storeStrong((id *)&self->_activeOnset, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_restTimer, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_heartbeatBucketToRequesters, 0);
  objc_storeStrong((id *)&self->_requesterToHeartbeatBucket, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_scheduledRestTimerFiringTime, 0);
  objc_storeStrong((id *)&self->_scheduledHeartbeatFiringTime, 0);
  objc_storeStrong((id *)&self->_lastLocationLessThan10m, 0);
  objc_storeStrong((id *)&self->_lastLocationLessThan20m, 0);
  objc_storeStrong((id *)&self->_lastLocationLessThan55m, 0);
  objc_storeStrong((id *)&self->_lastLocationLessThan200m, 0);
  objc_storeStrong((id *)&self->_lastLocationAnyPositive, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);

  objc_storeStrong((id *)&self->_metrics, 0);
}

@end