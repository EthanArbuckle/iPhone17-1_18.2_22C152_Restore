@interface SMReplayManager
- (BOOL)muteTriggers;
- (BOOL)noProgressTriggered;
- (BOOL)predominantMotionActivitySet;
- (BOOL)routeDeviationTriggered;
- (CLLocation)destinationLocation;
- (NSDate)currentDate;
- (NSMutableArray)mockLocations;
- (NSMutableArray)mockMotionActivities;
- (NSMutableArray)replayEvents;
- (NSMutableArray)timerStack;
- (NSMutableDictionary)defaults;
- (NSMutableDictionary)locationToEtaDictionary;
- (NSMutableDictionary)results;
- (NSString)resultsPath;
- (OS_dispatch_queue)queue;
- (RTLocationSmoother)locationSmoother;
- (SMReplayManager)initWithQueue:(id)a3;
- (double)crowFliesWalkingSpeed;
- (double)currentMapsExpectedETA;
- (double)etaScaleFactor;
- (double)minDistanceETAUpdateThreshold;
- (double)mockedMapsExpectedETA;
- (double)muteMapsExpectedETA;
- (double)muteRouteDeviationTriggerWithinThreshold;
- (id)_createDefaultsDict;
- (id)_createEvaluatorDict;
- (id)_timerStackToString:(id)a3;
- (id)mockedCurrentDate;
- (id)objectForKey:(id)a3 value:(id)a4;
- (unint64_t)currentPredominantMotionActivityType;
- (unint64_t)mockedCurrentPredominantMotionActivityType;
- (void)_addLocation:(id)a3 eta:(double)a4;
- (void)_cacheTimer:(id)a3;
- (void)_fetchCurrentLocationWithOptions:(id)a3 handler:(id)a4;
- (void)_fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5;
- (void)_fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)_fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5;
- (void)_fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4;
- (void)_invalidateTimerWithIdentifier:(id)a3;
- (void)_setup;
- (void)_updateTimerStackForDate:(id)a3;
- (void)addMotionActivity:(id)a3;
- (void)cacheTimer:(id)a3;
- (void)evaluateResults;
- (void)fetchCurrentLocationWithOptions:(id)a3 handler:(id)a4;
- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5;
- (void)fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5;
- (void)fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5;
- (void)fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4;
- (void)invalidateTimerWithIdentifier:(id)a3;
- (void)onTriggerNotification:(id)a3;
- (void)setCrowFliesWalkingSpeed:(double)a3;
- (void)setCurrentDate:(id)a3;
- (void)setCurrentMapsExpectedETA:(double)a3;
- (void)setCurrentPredominantMotionActivityType:(unint64_t)a3;
- (void)setDefaults:(id)a3;
- (void)setDestinationLocation:(id)a3;
- (void)setEtaScaleFactor:(double)a3;
- (void)setLocationSmoother:(id)a3;
- (void)setLocationToEtaDictionary:(id)a3;
- (void)setMinDistanceETAUpdateThreshold:(double)a3;
- (void)setMockLocations:(id)a3;
- (void)setMockMotionActivities:(id)a3;
- (void)setMuteMapsExpectedETA:(double)a3;
- (void)setMuteRouteDeviationTriggerWithinThreshold:(double)a3;
- (void)setMuteTriggers:(BOOL)a3;
- (void)setNoProgressTriggered:(BOOL)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setPredominantMotionActivitySet:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setReplayEvents:(id)a3;
- (void)setResults:(id)a3;
- (void)setResultsPath:(id)a3;
- (void)setRouteDeviationTriggered:(BOOL)a3;
- (void)setTimerStack:(id)a3;
@end

@implementation SMReplayManager

- (SMReplayManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SMReplayManager;
  v6 = [(SMReplayManager *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    uint64_t v8 = objc_opt_new();
    mockLocations = v7->_mockLocations;
    v7->_mockLocations = (NSMutableArray *)v8;

    uint64_t v10 = objc_opt_new();
    locationToEtaDictionary = v7->_locationToEtaDictionary;
    v7->_locationToEtaDictionary = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    locationSmoother = v7->_locationSmoother;
    v7->_locationSmoother = (RTLocationSmoother *)v12;

    uint64_t v14 = objc_opt_new();
    mockMotionActivities = v7->_mockMotionActivities;
    v7->_mockMotionActivities = (NSMutableArray *)v14;

    uint64_t v16 = objc_opt_new();
    timerStack = v7->_timerStack;
    v7->_timerStack = (NSMutableArray *)v16;

    [(SMReplayManager *)v7 _setup];
  }

  return v7;
}

- (void)_setup
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    v9 = "-[SMReplayManager _setup]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
  }

  v4 = [(SMReplayManager *)self _createEvaluatorDict];
  results = self->_results;
  self->_results = v4;

  v6 = [(SMReplayManager *)self _createDefaultsDict];
  defaults = self->_defaults;
  self->_defaults = v6;

  *(_WORD *)&self->_predominantMotionActivitySet = 0;
}

- (id)mockedCurrentDate
{
  return self->_currentDate;
}

- (unint64_t)mockedCurrentPredominantMotionActivityType
{
  return self->_currentPredominantMotionActivityType;
}

- (double)mockedMapsExpectedETA
{
  return self->_currentMapsExpectedETA;
}

- (id)_createEvaluatorDict
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  uint64_t v3 = MEMORY[0x1E4F1CC28];
  v20[0] = MEMORY[0x1E4F1CC28];
  v19[0] = @"value";
  v19[1] = @"date";
  v4 = objc_opt_new();
  v20[1] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  [v2 setObject:v5 forKeyedSubscript:@"_triggered"];

  v17[1] = @"date";
  v18[0] = v3;
  v17[0] = @"value";
  v6 = objc_opt_new();
  v18[1] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  [v2 setObject:v7 forKeyedSubscript:@"_noProgress"];

  v15[1] = @"date";
  v16[0] = v3;
  v15[0] = @"value";
  int v8 = objc_opt_new();
  v16[1] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:2];
  [v2 setObject:v9 forKeyedSubscript:@"_etaTriggered"];

  v13[1] = @"date";
  v14[0] = v3;
  v13[0] = @"value";
  uint64_t v10 = objc_opt_new();
  v14[1] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  [v2 setObject:v11 forKeyedSubscript:@"_routeDeviationTriggered"];

  return v2;
}

- (id)_createDefaultsDict
{
  v2 = objc_opt_new();
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationLastLockDateKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationLastUnlockDateKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationModeOfTransportKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationNominalMapsExpectedTravelTimeKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationNoProgressTimeoutThresholdKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationRemainingDistanceKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationRoundTripReminderDateKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationTimeToUpdateStatusKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationStatusKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationUpperBoundCrowFliesEtaKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationUpperBoundMapsEtaKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationScaleFactorInternalKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationAverageWalkingSpeedKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationAverageDrivingSpeedKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationMinDistanceThresholdToUpdateEtaKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationMuteMapsExpectedEtaKey"];
  [v2 setObject:0 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationMuteRouteDeviationTriggerWithinThresholdKey"];

  return v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136315394;
      v13 = "-[SMReplayManager setObject:forKey:]";
      __int16 v14 = 1024;
      int v15 = 125;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key (in %s:%d)", (uint8_t *)&v12, 0x12u);
    }
  }
  v9 = [(SMReplayManager *)self defaults];
  uint64_t v10 = v9;
  if (v6) {
    id v11 = v6;
  }
  else {
    id v11 = 0;
  }
  [v9 setObject:v11 forKeyedSubscript:v7];
}

- (id)objectForKey:(id)a3 value:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      int v15 = "-[SMReplayManager objectForKey:value:]";
      __int16 v16 = 1024;
      int v17 = 135;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }
  }
  v9 = [(SMReplayManager *)self defaults];
  uint64_t v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    id v11 = [(SMReplayManager *)self defaults];
    id v12 = [v11 objectForKeyedSubscript:v6];
  }
  else
  {
    [(SMReplayManager *)self setObject:v7 forKey:v6];
    id v12 = v7;
  }

  return v12;
}

- (void)setCurrentPredominantMotionActivityType:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    v13 = "-[SMReplayManager setCurrentPredominantMotionActivityType:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v12, 0xCu);
  }

  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a3) {
      id v7 = @"YES";
    }
    else {
      id v7 = @"NO";
    }
    int v12 = 136315394;
    v13 = "-[SMReplayManager setCurrentPredominantMotionActivityType:]";
    __int16 v14 = 2112;
    uint64_t v15 = (uint64_t)v7;
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, setting currentPredominantMotionActivityType to, %@", (uint8_t *)&v12, 0x16u);
  }

  self->_currentPredominantMotionActivityType = a3;
  self->_predominantMotionActivitySet = 1;
  int v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [(SMReplayManager *)self results];
    uint64_t v10 = (void *)v9;
    if (self->_currentPredominantMotionActivityType) {
      id v11 = @"YES";
    }
    else {
      id v11 = @"NO";
    }
    int v12 = 136315650;
    v13 = "-[SMReplayManager setCurrentPredominantMotionActivityType:]";
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    int v17 = v11;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s, results, %@, noProgressTriggered, %@", (uint8_t *)&v12, 0x20u);
  }
}

- (void)setNoProgressTriggered:(BOOL)a3
{
  BOOL v3 = a3;
  v35[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SMReplayManager *)self muteTriggers];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v26 = 136315138;
      v27 = "-[SMReplayManager setNoProgressTriggered:]";
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, triggers muted", (uint8_t *)&v26, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      if (v3) {
        int v8 = @"YES";
      }
      else {
        int v8 = @"NO";
      }
      int v26 = 136315394;
      v27 = "-[SMReplayManager setNoProgressTriggered:]";
      __int16 v28 = 2112;
      uint64_t v29 = (uint64_t)v8;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, setting noProgressTriggered to, %@", (uint8_t *)&v26, 0x16u);
    }

    if (v3)
    {
      uint64_t v9 = [(SMReplayManager *)self results];
      uint64_t v10 = [v9 objectForKey:@"_triggered"];
      id v11 = [v10 objectForKey:@"date"];

      int v12 = NSNumber;
      v13 = [(SMReplayManager *)self mockedCurrentDate];
      [v13 timeIntervalSince1970];
      __int16 v14 = [v12 numberWithDouble:];
      [v11 addObject:v14];

      uint64_t v15 = MEMORY[0x1E4F1CC38];
      v34[0] = @"value";
      v34[1] = @"date";
      v35[0] = MEMORY[0x1E4F1CC38];
      v35[1] = v11;
      __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
      int v17 = [(SMReplayManager *)self results];
      [v17 setObject:v16 forKeyedSubscript:@"_triggered"];

      v32[1] = @"date";
      v33[0] = v15;
      v32[0] = @"value";
      uint64_t v18 = NSNumber;
      objc_super v19 = [(SMReplayManager *)self mockedCurrentDate];
      [v19 timeIntervalSince1970];
      v20 = [v18 numberWithDouble:x0];
      v33[1] = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
      v22 = [(SMReplayManager *)self results];
      [v22 setObject:v21 forKeyedSubscript:@"_noProgress"];

      [(SMReplayManager *)self evaluateResults];
    }
    self->_noProgressTriggered = v3;
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = [(SMReplayManager *)self results];
      v24 = (void *)v23;
      if (self->_noProgressTriggered) {
        v25 = @"YES";
      }
      else {
        v25 = @"NO";
      }
      int v26 = 136315650;
      v27 = "-[SMReplayManager setNoProgressTriggered:]";
      __int16 v28 = 2112;
      uint64_t v29 = v23;
      __int16 v30 = 2112;
      v31 = v25;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, results, %@, noProgressTriggered, %@", (uint8_t *)&v26, 0x20u);
    }
  }
}

- (void)setRouteDeviationTriggered:(BOOL)a3
{
  BOOL v3 = a3;
  v35[2] = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(SMReplayManager *)self muteTriggers];
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v26 = 136315138;
      v27 = "-[SMReplayManager setRouteDeviationTriggered:]";
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, triggers muted", (uint8_t *)&v26, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      if (v3) {
        int v8 = @"YES";
      }
      else {
        int v8 = @"NO";
      }
      int v26 = 136315394;
      v27 = "-[SMReplayManager setRouteDeviationTriggered:]";
      __int16 v28 = 2112;
      uint64_t v29 = (uint64_t)v8;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, setting routeDeviationTriggered to, %@", (uint8_t *)&v26, 0x16u);
    }

    if (v3)
    {
      uint64_t v9 = [(SMReplayManager *)self results];
      uint64_t v10 = [v9 objectForKey:@"_triggered"];
      id v11 = [v10 objectForKey:@"date"];

      int v12 = NSNumber;
      v13 = [(SMReplayManager *)self mockedCurrentDate];
      [v13 timeIntervalSince1970];
      __int16 v14 = [v12 numberWithDouble:];
      [v11 addObject:v14];

      uint64_t v15 = MEMORY[0x1E4F1CC38];
      v34[0] = @"value";
      v34[1] = @"date";
      v35[0] = MEMORY[0x1E4F1CC38];
      v35[1] = v11;
      __int16 v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
      int v17 = [(SMReplayManager *)self results];
      [v17 setObject:v16 forKeyedSubscript:@"_triggered"];

      v32[1] = @"date";
      v33[0] = v15;
      v32[0] = @"value";
      uint64_t v18 = NSNumber;
      objc_super v19 = [(SMReplayManager *)self mockedCurrentDate];
      [v19 timeIntervalSince1970];
      v20 = [v18 numberWithDouble:x0];
      v33[1] = v20;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
      v22 = [(SMReplayManager *)self results];
      [v22 setObject:v21 forKeyedSubscript:@"_routeDeviationTriggered"];

      [(SMReplayManager *)self evaluateResults];
    }
    self->_routeDeviationTriggered = v3;
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = [(SMReplayManager *)self results];
      v24 = (void *)v23;
      if (self->_routeDeviationTriggered) {
        v25 = @"YES";
      }
      else {
        v25 = @"NO";
      }
      int v26 = 136315650;
      v27 = "-[SMReplayManager setRouteDeviationTriggered:]";
      __int16 v28 = 2112;
      uint64_t v29 = v23;
      __int16 v30 = 2112;
      v31 = v25;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s, results, %@, routeDeviationTriggered, %@", (uint8_t *)&v26, 0x20u);
    }
  }
}

- (void)setCurrentDate:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v4 = (NSDate *)a3;
  BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(NSDate *)v4 stringFromDate];
    int v8 = 136315394;
    uint64_t v9 = "-[SMReplayManager setCurrentDate:]";
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s currentDate, %@", (uint8_t *)&v8, 0x16u);
  }
  [(SMReplayManager *)self _updateTimerStackForDate:v4];
  currentDate = self->_currentDate;
  self->_currentDate = v4;
}

- (void)setCrowFliesWalkingSpeed:(double)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[SMReplayManager setCrowFliesWalkingSpeed:]";
    __int16 v9 = 2048;
    double v10 = a3;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s crowFliesWalkingSpeed, %.2f", (uint8_t *)&v7, 0x16u);
  }

  if (a3 <= 0.0)
  {
    id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      int v8 = "-[SMReplayManager setCrowFliesWalkingSpeed:]";
      __int16 v9 = 2048;
      double v10 = a3;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s invalid crowFliesWalkingSpeed, %.2f", (uint8_t *)&v7, 0x16u);
    }
  }
  else
  {
    self->_crowFliesWalkingSpeed = a3;
    id v6 = [NSNumber numberWithDouble:a3];
    [(NSMutableDictionary *)self->_defaults setObject:v6 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationAverageWalkingSpeedKey"];
  }
}

- (void)setDestinationLocation:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = (CLLocation *)a3;
  BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[SMReplayManager setDestinationLocation:]";
    __int16 v9 = 2112;
    double v10 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s destinationLocation, %@", (uint8_t *)&v7, 0x16u);
  }

  destinationLocation = self->_destinationLocation;
  self->_destinationLocation = v4;
}

- (void)setResultsPath:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = (NSString *)a3;
  BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[SMReplayManager setResultsPath:]";
    __int16 v9 = 2112;
    double v10 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s resultsPath, %@", (uint8_t *)&v7, 0x16u);
  }

  resultsPath = self->_resultsPath;
  self->_resultsPath = v4;
}

- (void)setEtaScaleFactor:(double)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    int v8 = "-[SMReplayManager setEtaScaleFactor:]";
    __int16 v9 = 2048;
    double v10 = a3;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s etaScaleFactor, %.2f", (uint8_t *)&v7, 0x16u);
  }

  self->_etaScaleFactor = a3;
  id v6 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)self->_defaults setObject:v6 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationScaleFactorInternalKey"];
}

- (void)setMuteMapsExpectedETA:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = @"NO";
    if (a3 > 0.0) {
      id v6 = @"YES";
    }
    int v8 = 136315394;
    __int16 v9 = "-[SMReplayManager setMuteMapsExpectedETA:]";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s muteMapsExpectedETA, %@", (uint8_t *)&v8, 0x16u);
  }

  if (a3 > 0.0)
  {
    self->_muteMapsExpectedETA = a3;
    int v7 = [NSNumber numberWithDouble:a3];
    [(NSMutableDictionary *)self->_defaults setObject:v7 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationMuteMapsExpectedEtaKey"];
  }
}

- (void)setMuteRouteDeviationTriggerWithinThreshold:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = @"NO";
    if (a3 > 0.0) {
      id v6 = @"YES";
    }
    int v8 = 136315394;
    __int16 v9 = "-[SMReplayManager setMuteRouteDeviationTriggerWithinThreshold:]";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s muteRouteDeviationTriggerWithinThreshold, %@", (uint8_t *)&v8, 0x16u);
  }

  if (a3 > 0.0)
  {
    self->_muteRouteDeviationTriggerWithinThreshold = a3;
    int v7 = [NSNumber numberWithDouble:a3];
    [(NSMutableDictionary *)self->_defaults setObject:v7 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationMuteRouteDeviationTriggerWithinThresholdKey"];
  }
}

- (void)setMinDistanceETAUpdateThreshold:(double)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = @"NO";
    if (a3 != 0.0) {
      id v6 = @"YES";
    }
    int v8 = 136315394;
    __int16 v9 = "-[SMReplayManager setMinDistanceETAUpdateThreshold:]";
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s minDistanceETAUptdateThreshold, %@", (uint8_t *)&v8, 0x16u);
  }

  self->_minDistanceETAUpdateThreshold = a3;
  int v7 = [NSNumber numberWithDouble:a3];
  [(NSMutableDictionary *)self->_defaults setObject:v7 forKeyedSubscript:@"RTDefaultsSMTriggerDestinationMinDistanceThresholdToUpdateEtaKey"];
}

- (void)addMotionActivity:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 136315138;
    int v8 = "-[SMReplayManager addMotionActivity:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(SMReplayManager *)self mockMotionActivities];
  [v6 addObject:v4];
}

- (void)fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    id v8 = a5;
    id v9 = a4;
    id v10 = a3;
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 136315138;
      v13 = "-[SMReplayManager fetchMotionActivitiesFromStartDate:endDate:handler:]";
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v12, 0xCu);
    }

    [(SMReplayManager *)self _fetchMotionActivitiesFromStartDate:v10 endDate:v9 handler:v8];
  }
}

- (void)_fetchMotionActivitiesFromStartDate:(id)a3 endDate:(id)a4 handler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    id v8 = (void (**)(id, void *, void))a5;
    id v9 = a4;
    id v10 = a3;
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[SMReplayManager _fetchMotionActivitiesFromStartDate:endDate:handler:]";
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }

    int v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@ AND %K <= %@", @"startDate", v10, @"startDate", v9];

    v13 = [(NSMutableArray *)self->_mockMotionActivities filteredArrayUsingPredicate:v12];
    v8[2](v8, v13, 0);
  }
}

- (void)fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    v13 = "-[SMReplayManager fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:]";
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v12, 0xCu);
  }

  [(SMReplayManager *)self _fetchPredominantMotionActivityTypeFromStartDate:v10 toEndDate:v9 withHandler:v8];
}

- (void)_fetchPredominantMotionActivityTypeFromStartDate:(id)a3 toEndDate:(id)a4 withHandler:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, unint64_t, void))a5;
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SMReplayManager _fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:]";
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (!v9)
  {
    uint64_t v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMReplayManager _fetchPredominantMotionActivityTypeFromStartDate:toEndDate:withHandler:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 388;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  if ([(SMReplayManager *)self predominantMotionActivitySet]) {
    v9[2](v9, [(SMReplayManager *)self currentPredominantMotionActivityType], 0);
  }
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v49 = __Block_byref_object_copy__43;
  v50 = __Block_byref_object_dispose__43;
  id v51 = 0;
  uint64_t v42 = 0;
  v43 = (id *)&v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__43;
  v46 = __Block_byref_object_dispose__43;
  id v47 = 0;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __90__SMReplayManager__fetchPredominantMotionActivityTypeFromStartDate_toEndDate_withHandler___block_invoke;
  v38[3] = &unk_1E6B905F0;
  v40 = buf;
  v41 = &v42;
  v13 = v12;
  v39 = v13;
  [(SMReplayManager *)self _fetchMotionActivitiesFromStartDate:v37 endDate:v8 handler:v38];
  uint64_t v14 = v13;
  uint64_t v15 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v14, v16)) {
    goto LABEL_14;
  }
  int v17 = [MEMORY[0x1E4F1C9C8] now];
  [v17 timeIntervalSinceDate:v15];
  double v19 = v18;
  v20 = objc_opt_new();
  v21 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_368];
  v22 = [MEMORY[0x1E4F29060] callStackSymbols];
  uint64_t v23 = [v22 filteredArrayUsingPredicate:v21];
  v24 = [v23 firstObject];

  [v20 submitToCoreAnalytics:v24 type:1 duration:v19];
  v25 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v53 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v53, 2u);
  }

  int v26 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v52 = *MEMORY[0x1E4F28568];
  *(void *)v53 = @"semaphore wait timeout";
  v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
  __int16 v28 = [v26 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v27];

  if (v28)
  {
    id v29 = v28;

    char v30 = 0;
  }
  else
  {
LABEL_14:
    id v29 = 0;
    char v30 = 1;
  }

  id v31 = v29;
  if ((v30 & 1) == 0) {
    objc_storeStrong(v43 + 5, v29);
  }
  if (v43[5])
  {
    v9[2](v9, 0, 0);
  }
  else
  {
    v32 = [RTMotionActivityHistogram alloc];
    v33 = [(RTMotionActivityHistogram *)v32 initWithActivites:*(void *)(*(void *)&buf[8] + 40) betweenDate:v37 andDate:v8];
    v34 = [(RTMotionActivityHistogram *)v33 binsSortedByInterval];
    v35 = [v34 firstObject];
    v9[2](v9, [v35 type], 0);
  }
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(buf, 8);
}

void __90__SMReplayManager__fetchPredominantMotionActivityTypeFromStartDate_toEndDate_withHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_addLocation:(id)a3 eta:(double)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(SMReplayManager *)self destinationLocation];
  [v6 distanceFromLocation:v7];
  double v9 = v8;

  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9 >= 100.0)
  {
    if (v11)
    {
      id v12 = [(SMReplayManager *)self destinationLocation];
      int v17 = 136315906;
      double v18 = "-[SMReplayManager _addLocation:eta:]";
      __int16 v19 = 2048;
      double v20 = v9;
      __int16 v21 = 2112;
      id v22 = v6;
      __int16 v23 = 2112;
      v24 = v12;
      v13 = "%s, triggers unmuted with distance, %.2f, location, %@, destination, %@";
      goto LABEL_6;
    }
  }
  else if (v11)
  {
    id v12 = [(SMReplayManager *)self destinationLocation];
    int v17 = 136315906;
    double v18 = "-[SMReplayManager _addLocation:eta:]";
    __int16 v19 = 2048;
    double v20 = v9;
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    v24 = v12;
    v13 = "%s, triggers muted with distance, %.2f, location, %@, destination, %@";
LABEL_6:
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v17, 0x2Au);
  }
  [(SMReplayManager *)self setMuteTriggers:v9 < 100.0];
  uint64_t v14 = [NSNumber numberWithDouble:a4];
  uint64_t v15 = [(SMReplayManager *)self locationToEtaDictionary];
  [v15 setObject:v14 forKeyedSubscript:v6];

  [(SMReplayManager *)self setCurrentMapsExpectedETA:a4];
  dispatch_time_t v16 = [(SMReplayManager *)self mockLocations];
  [v16 addObject:v6];
}

- (void)fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  double v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[SMReplayManager fetchStoredLocationsWithOptions:handler:]";
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v9, 0xCu);
  }

  [(SMReplayManager *)self _fetchStoredLocationsWithOptions:v7 handler:v6];
}

- (void)_fetchStoredLocationsWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void (**)(void, void, void))v6;
  if (v5)
  {
    if (v6) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  double v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SMReplayManager _fetchStoredLocationsWithOptions:handler:]";
    __int16 v64 = 1024;
    int v65 = 456;
    _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
  }

  if (!v7)
  {
LABEL_7:
    int v9 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMReplayManager _fetchStoredLocationsWithOptions:handler:]";
      __int16 v64 = 1024;
      int v65 = 457;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
LABEL_10:
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SMReplayManager _fetchStoredLocationsWithOptions:handler:]";
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  uint64_t v11 = [v5 dateInterval];
  id v12 = [v11 startDate];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [MEMORY[0x1E4F1C9C8] distantPast];
  }
  id v15 = v14;

  dispatch_time_t v16 = [v5 dateInterval];
  int v17 = [v16 endDate];
  double v18 = v17;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [MEMORY[0x1E4F1C9C8] distantFuture];
  }
  id v20 = v19;

  [v5 horizontalAccuracy];
  v60 = v7;
  if (v21 == 0.0)
  {
    double v23 = 1.79769313e308;
  }
  else
  {
    [v5 horizontalAccuracy];
    double v23 = v22;
  }
  v24 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v25 = (void *)MEMORY[0x1E4F28BA0];
  v58 = v15;
  int v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%@ <= %K", v15, @"timestamp"];
  v62[0] = v26;
  v57 = v20;
  v27 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@", @"timestamp", v20];
  v62[1] = v27;
  __int16 v28 = (void *)MEMORY[0x1E4F28F60];
  id v29 = [NSNumber numberWithDouble:v23];
  char v30 = [v28 predicateWithFormat:@"%K <= %@", @"horizontalAccuracy", v29];
  v62[2] = v30;
  id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:3];
  v32 = [v25 andPredicateWithSubpredicates:v31];

  [v24 addObject:v32];
  v33 = [v5 boundingBoxLocation];

  if (v33)
  {
    *(void *)buf = 0;
    v34 = [v5 boundingBoxLocation];
    [v34 coordinate];
    v35 = [v5 boundingBoxLocation];
    [v35 coordinate];
    [v5 boundingBoxLocation];
    id v36 = v56 = v24;
    [v36 horizontalAccuracy];
    RTCommonCalculateBoundingBox();

    v53 = (void *)MEMORY[0x1E4F28BA0];
    v37 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v54 = [NSNumber numberWithDouble:0.0];
    uint64_t v52 = [v37 predicateWithFormat:@"%@ <= %K", v54, @"coordinate.latitude"];
    v61[0] = v52;
    v38 = (void *)MEMORY[0x1E4F28F60];
    v39 = [NSNumber numberWithDouble:0.0];
    v55 = v32;
    v40 = [v38 predicateWithFormat:@"%K <= %@", @"coordinate.longitude", v39];
    v61[1] = v40;
    v41 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v42 = [NSNumber numberWithDouble:*(double *)buf];
    v43 = [v41 predicateWithFormat:@"%@ <= %K", v42, @"coordinate.latitude"];
    v61[2] = v43;
    uint64_t v44 = (void *)MEMORY[0x1E4F28F60];
    v45 = [NSNumber numberWithDouble:0.0];
    v46 = [v44 predicateWithFormat:@"%K <= %@", @"coordinate.latitude", v45];
    v61[3] = v46;
    id v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:4];
    v48 = [v53 andPredicateWithSubpredicates:v47];

    v32 = v55;
    v24 = v56;

    [v56 addObject:v48];
  }
  v49 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v24];
  v50 = [(SMReplayManager *)self mockLocations];
  id v51 = [v50 filteredArrayUsingPredicate:v49];

  ((void (**)(void, void *, void))v60)[2](v60, v51, 0);
}

- (void)fetchCurrentLocationWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  double v8 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    id v10 = "-[SMReplayManager fetchCurrentLocationWithOptions:handler:]";
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v9, 0xCu);
  }

  [(SMReplayManager *)self _fetchCurrentLocationWithOptions:v7 handler:v6];
}

- (void)_fetchCurrentLocationWithOptions:(id)a3 handler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void *, void))a4;
  id v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315138;
    id v12 = "-[SMReplayManager _fetchCurrentLocationWithOptions:handler:]";
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v11, 0xCu);
  }

  id v7 = [(SMReplayManager *)self mockLocations];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    int v9 = [(SMReplayManager *)self mockLocations];
    id v10 = [v9 lastObject];
    v5[2](v5, v10, 0);
  }
  else
  {
    v5[2](v5, 0, 0);
  }
}

- (void)fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    id v15 = "-[SMReplayManager fetchEstimatedLocationAtDate:options:handler:]";
    _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v14, 0xCu);
  }

  id v12 = v9;
  id v13 = v12;
  if (!v12) {
    id v13 = objc_alloc_init(MEMORY[0x1E4F5CDD0]);
  }
  [(SMReplayManager *)self _fetchEstimatedLocationAtDate:v8 options:v12 handler:v10];
}

- (void)_fetchEstimatedLocationAtDate:(id)a3 options:(id)a4 handler:(id)a5
{
  v91[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void *, void))a5;
  v63 = v7;
  if (!v7)
  {
    id v10 = v8;
    int v11 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMReplayManager _fetchEstimatedLocationAtDate:options:handler:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 568;
      _os_log_error_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: date (in %s:%d)", buf, 0x12u);
    }

    id v8 = v10;
  }
  v62 = v8;
  if (!v8)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMReplayManager _fetchEstimatedLocationAtDate:options:handler:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 569;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options (in %s:%d)", buf, 0x12u);
    }
  }
  if (!v9)
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[SMReplayManager _fetchEstimatedLocationAtDate:options:handler:]";
      *(_WORD *)&unsigned char buf[12] = 1024;
      *(_DWORD *)&buf[14] = 570;
      _os_log_error_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
  }
  int v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&uint8_t buf[4] = "-[SMReplayManager _fetchEstimatedLocationAtDate:options:handler:]";
    _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (v9)
  {
    [v62 timeInterval];
    if (v15 >= 0.0) {
      double v16 = v15;
    }
    else {
      double v16 = 30.0;
    }
    id v17 = objc_alloc(MEMORY[0x1E4F28C18]);
    double v18 = [v63 dateByAddingTimeInterval:-v16];
    id v19 = [v63 dateByAddingTimeInterval:v16];
    v61 = (void *)[v17 initWithStartDate:v18 endDate:v19];

    id v20 = objc_alloc(MEMORY[0x1E4F5CF40]);
    v60 = (void *)[v20 initWithDateInterval:v61 horizontalAccuracy:100 batchSize:0 boundingBoxLocation:*MEMORY[0x1E4F1E6E8]];
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v86 = __Block_byref_object_copy__43;
    v87 = __Block_byref_object_dispose__43;
    id v88 = 0;
    uint64_t v71 = 0;
    v72 = &v71;
    uint64_t v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__43;
    v75 = __Block_byref_object_dispose__43;
    id v76 = 0;
    dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
    v67[0] = MEMORY[0x1E4F143A8];
    v67[1] = 3221225472;
    v67[2] = __65__SMReplayManager__fetchEstimatedLocationAtDate_options_handler___block_invoke;
    v67[3] = &unk_1E6B905F0;
    v69 = &v71;
    v70 = buf;
    double v22 = v21;
    v68 = v22;
    [(SMReplayManager *)self _fetchStoredLocationsWithOptions:v60 handler:v67];
    double v23 = (id *)(*(void *)&buf[8] + 40);
    id obj = *(id *)(*(void *)&buf[8] + 40);
    v24 = v22;
    uint64_t v25 = [MEMORY[0x1E4F1C9C8] now];
    dispatch_time_t v26 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v24, v26)) {
      goto LABEL_26;
    }
    v27 = [MEMORY[0x1E4F1C9C8] now:obj];
    [v27 timeIntervalSinceDate:v25];
    double v29 = v28;
    char v30 = objc_opt_new();
    id v31 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_368];
    v32 = [MEMORY[0x1E4F29060] callStackSymbols];
    v33 = [v32 filteredArrayUsingPredicate:v31];
    v34 = [v33 firstObject];

    [v30 submitToCoreAnalytics:v34 type:1 duration:v29];
    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v77 = 0;
      _os_log_fault_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v77, 2u);
    }

    id v36 = (void *)MEMORY[0x1E4F28C58];
    v91[0] = *MEMORY[0x1E4F28568];
    *(void *)v80 = @"semaphore wait timeout";
    v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v80 forKeys:v91 count:1];
    v38 = [v36 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v37];

    if (v38)
    {
      id v39 = v38;

      objc_storeStrong(v23, v39);
      v40 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v56 = *(void **)(*(void *)&buf[8] + 40);
        *(_DWORD *)v80 = 136315394;
        *(void *)&v80[4] = "-[SMReplayManager _fetchEstimatedLocationAtDate:options:handler:]";
        __int16 v81 = 2112;
        v82 = v56;
        _os_log_error_impl(&dword_1D9BFA000, v40, OS_LOG_TYPE_ERROR, "%s, error, %@", v80, 0x16u);
      }
    }
    else
    {
LABEL_26:

      objc_storeStrong(v23, obj);
      if ([(id)v72[5] count])
      {
        v41 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:[v72[5] count]];
        uint64_t v42 = (void *)v72[5];
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __65__SMReplayManager__fetchEstimatedLocationAtDate_options_handler___block_invoke_129;
        v64[3] = &unk_1E6B94810;
        id v43 = v41;
        id v65 = v43;
        SEL v66 = a2;
        [v42 enumerateObjectsUsingBlock:v64];
        uint64_t v44 = [MEMORY[0x1E4F1CA60] dictionary];
        [v62 averageSpeed];
        if (v45 >= 0.0)
        {
          v46 = NSNumber;
          [v62 averageSpeed];
          id v47 = [v46 numberWithDouble:];
          [v44 setObject:v47 forKey:@"kRTLocationSmootherAverageMovingSpeed"];
        }
        if (objc_msgSend(v62, "enableFallbackModel", obj)) {
          [v44 setObject:MEMORY[0x1E4F1CC38] forKey:@"kRTLocationSmootherEnableFallbackModel"];
        }
        v48 = [(SMReplayManager *)self locationSmoother];
        [v63 timeIntervalSinceReferenceDate];
        v49 = [v48 estimateLocationWithLocations:v43 timestamp:v44 parameters:0 meta:0];

        v50 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          id v51 = [v63 stringFromDate];
          *(_DWORD *)v80 = 136315650;
          *(void *)&v80[4] = "-[SMReplayManager _fetchEstimatedLocationAtDate:options:handler:]";
          __int16 v81 = 2112;
          v82 = v49;
          __int16 v83 = 2112;
          v84 = v51;
          _os_log_impl(&dword_1D9BFA000, v50, OS_LOG_TYPE_INFO, "%s, estimated location, %@, on date, %@", v80, 0x20u);
        }
        if (v49 && ([v49 horizontalAccuracy], v52 > 0.0))
        {
          v9[2](v9, v49, 0);
        }
        else
        {
          uint64_t v78 = *MEMORY[0x1E4F28568];
          v79 = @"Failed to estimate a location.";
          uint64_t v54 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v79 forKeys:&v78 count:1];
          v55 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:6 userInfo:v54];
          ((void (**)(id, void *, void *))v9)[2](v9, 0, v55);
        }
        goto LABEL_42;
      }
    }
    v9[2](v9, 0, *(void *)(*(void *)&buf[8] + 40));
LABEL_42:

    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(buf, 8);

    goto LABEL_43;
  }
  uint64_t v89 = *MEMORY[0x1E4F28568];
  v90 = @"A completion handler is a required parameter.";
  v61 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
  v60 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v61];
  v53 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&uint8_t buf[4] = v60;
    _os_log_error_impl(&dword_1D9BFA000, v53, OS_LOG_TYPE_ERROR, "A completion handler is a required parameter, %@", buf, 0xCu);
  }

LABEL_43:
}

void __65__SMReplayManager__fetchEstimatedLocationAtDate_options_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__SMReplayManager__fetchEstimatedLocationAtDate_options_handler___block_invoke_129(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  [v5 horizontalAccuracy];
  if (v6 <= 30.0)
  {
    int v8 = 1;
  }
  else
  {
    [v5 horizontalAccuracy];
    if (v7 <= 165.0) {
      int v8 = 4;
    }
    else {
      int v8 = 0;
    }
  }
  memset(v14, 0, 28);
  long long v13 = 0u;
  if (v5) {
    [v5 clientLocation];
  }
  LODWORD(v13) = v8;
  id v9 = objc_alloc(MEMORY[0x1E4F1E5F0]);
  long long v20 = v13;
  long long v21 = 0u;
  v22[0] = v14[0];
  *(_OWORD *)((char *)v22 + 12) = *(_OWORD *)((char *)v14 + 12);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  memset(buf, 0, sizeof(buf));
  id v10 = (void *)[v9 initWithClientLocation:buf];
  [*(id *)(a1 + 32) addObject:v10];
  id v11 = _rt_log_facility_get_os_log(RTLogFacilityLocation);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = NSStringFromSelector(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v12;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2048;
    *(void *)&unsigned char buf[24] = a3;
    _os_log_debug_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_DEBUG, "%@, input location, %@, idx, %ld", buf, 0x20u);
  }
}

- (void)cacheTimer:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    double v7 = "-[SMReplayManager cacheTimer:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(SMReplayManager *)self _cacheTimer:v4];
}

- (void)_cacheTimer:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315138;
    long long v19 = "-[SMReplayManager _cacheTimer:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v18, 0xCu);
  }

  int v6 = [(SMReplayManager *)self timerStack];
  double v7 = [(SMReplayManager *)self timerStack];
  uint64_t v8 = [v6 indexOfObject:v4 inSortedRange:0 options:1024 usingComparator:&__block_literal_global_31];

  id v9 = [(SMReplayManager *)self timerStack];
  [v9 insertObject:v4 atIndex:v8];

  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = [v4 identifier];
    id v12 = [v4 endDate];
    long long v13 = [v12 stringFromDate];
    int v14 = [(SMReplayManager *)self mockedCurrentDate];
    double v15 = [v14 stringFromDate];
    long long v16 = [(SMReplayManager *)self timerStack];
    long long v17 = [(SMReplayManager *)self _timerStackToString:v16];
    int v18 = 136316162;
    long long v19 = "-[SMReplayManager _cacheTimer:]";
    __int16 v20 = 2112;
    long long v21 = v11;
    __int16 v22 = 2112;
    uint64_t v23 = v13;
    __int16 v24 = 2112;
    uint64_t v25 = v15;
    __int16 v26 = 2112;
    v27 = v17;
    _os_log_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_INFO, "%s, cached timer with identifier, %@, endDate, %@, currentDate, %@, timerStack, %@", (uint8_t *)&v18, 0x34u);
  }
}

uint64_t __31__SMReplayManager__cacheTimer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 endDate];
  int v6 = [v4 endDate];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (void)invalidateTimerWithIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[SMReplayManager invalidateTimerWithIdentifier:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  [(SMReplayManager *)self _invalidateTimerWithIdentifier:v4];
}

- (void)_invalidateTimerWithIdentifier:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v5 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      double v29 = "-[SMReplayManager _invalidateTimerWithIdentifier:]";
      __int16 v30 = 1024;
      LODWORD(v31) = 717;
      _os_log_error_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }
  }
  int v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    double v29 = "-[SMReplayManager _invalidateTimerWithIdentifier:]";
    _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [(SMReplayManager *)self timerStack];
    uint64_t v9 = [v8 count];
    id v10 = [(SMReplayManager *)self timerStack];
    id v11 = [(SMReplayManager *)self _timerStackToString:v10];
    *(_DWORD *)buf = 136315906;
    double v29 = "-[SMReplayManager _invalidateTimerWithIdentifier:]";
    __int16 v30 = 2112;
    id v31 = v4;
    __int16 v32 = 2048;
    uint64_t v33 = v9;
    __int16 v34 = 2112;
    v35 = v11;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, invalidating timer with identifier, %@, timerStackCount, %lu, timerStack, %@", buf, 0x2Au);
  }
  id v12 = [(SMReplayManager *)self timerStack];
  long long v13 = (void *)MEMORY[0x1E4F28F60];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __50__SMReplayManager__invalidateTimerWithIdentifier___block_invoke;
  v26[3] = &unk_1E6B94858;
  id v14 = v4;
  id v27 = v14;
  double v15 = [v13 predicateWithBlock:v26];
  long long v16 = [v12 filteredArrayUsingPredicate:v15];

  long long v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    double v29 = "-[SMReplayManager _invalidateTimerWithIdentifier:]";
    __int16 v30 = 2112;
    id v31 = v16;
    _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "%s, timersToRemove FIRST, %@", buf, 0x16u);
  }

  int v18 = [(SMReplayManager *)self timerStack];
  [v18 removeObjectsInArray:v16];

  long long v19 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    __int16 v20 = [(SMReplayManager *)self timerStack];
    uint64_t v21 = [v20 count];
    __int16 v22 = [(SMReplayManager *)self timerStack];
    uint64_t v23 = [(SMReplayManager *)self _timerStackToString:v22];
    __int16 v24 = [(SMReplayManager *)self _timerStackToString:v16];
    uint64_t v25 = [v16 count];
    *(_DWORD *)buf = 136316418;
    double v29 = "-[SMReplayManager _invalidateTimerWithIdentifier:]";
    __int16 v30 = 2112;
    id v31 = v14;
    __int16 v32 = 2048;
    uint64_t v33 = v21;
    __int16 v34 = 2112;
    v35 = v23;
    __int16 v36 = 2112;
    v37 = v24;
    __int16 v38 = 2048;
    uint64_t v39 = v25;
    _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "%s, finished invalidating timer with identifier, %@, timerStackCount, %lu, timerStack, %@, timersToRemove, %@, count, %lu", buf, 0x3Eu);
  }
}

uint64_t __50__SMReplayManager__invalidateTimerWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)_updateTimerStackForDate:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  id v45 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = [v4 stringFromDate];
    uint64_t v7 = [(SMReplayManager *)self timerStack];
    uint64_t v8 = [(SMReplayManager *)self _timerStackToString:v7];
    *(_DWORD *)buf = 136315650;
    v49 = "-[SMReplayManager _updateTimerStackForDate:]";
    __int16 v50 = 2112;
    id v51 = v6;
    __int16 v52 = 2112;
    v53 = v8;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, ENTERING WITH DATE, %@, TIMER STACK, %@ ", buf, 0x20u);

    id v4 = v45;
  }

  uint64_t v9 = [(SMReplayManager *)self timerStack];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    *(void *)&long long v11 = 136315906;
    long long v44 = v11;
    while (1)
    {
      id v12 = [(SMReplayManager *)self timerStack];
      long long v13 = [v12 firstObject];

      id v14 = [v13 endDate];
      int v15 = [v14 isAfterDate:v4];

      long long v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
      if (v15) {
        break;
      }
      if (v17)
      {
        int v18 = [v13 identifier];
        long long v19 = [v13 endDate];
        __int16 v20 = [v19 stringFromDate];
        uint64_t v21 = [v4 stringFromDate];
        __int16 v22 = [v13 endDate];
        uint64_t v23 = [v22 stringFromDate];
        *(_DWORD *)buf = 136316162;
        v49 = "-[SMReplayManager _updateTimerStackForDate:]";
        __int16 v50 = 2112;
        id v51 = v18;
        __int16 v52 = 2112;
        v53 = v20;
        __int16 v54 = 2112;
        uint64_t v55 = (uint64_t)v21;
        __int16 v56 = 2112;
        v57 = v23;
        _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%s, firing timer with identifier, %@, endDate, %@, old currentDate, %@, newCurrentDate, %@", buf, 0x34u);

        id v4 = v45;
      }

      __int16 v24 = [v13 endDate];
      currentDate = self->_currentDate;
      self->_currentDate = v24;

      __int16 v26 = [v13 queue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __44__SMReplayManager__updateTimerStackForDate___block_invoke;
      block[3] = &unk_1E6B90E70;
      id v27 = v13;
      id v47 = v27;
      dispatch_async(v26, block);

      uint64_t v28 = [(SMReplayManager *)self timerStack];
      uint64_t v29 = [v28 count];

      if (v29)
      {
        __int16 v30 = [(SMReplayManager *)self timerStack];
        [v30 removeObjectAtIndex:0];

        id v31 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          __int16 v32 = [v27 identifier];
          uint64_t v33 = [v27 endDate];
          __int16 v34 = [v33 stringFromDate];
          v35 = [(SMReplayManager *)self timerStack];
          uint64_t v36 = [v35 count];
          *(_DWORD *)buf = v44;
          v49 = "-[SMReplayManager _updateTimerStackForDate:]";
          __int16 v50 = 2112;
          id v51 = v32;
          __int16 v52 = 2112;
          v53 = v34;
          __int16 v54 = 2048;
          uint64_t v55 = v36;
          _os_log_impl(&dword_1D9BFA000, v31, OS_LOG_TYPE_INFO, "%s, removing timer with identifier, %@, endDate, %@, remaining timer count after removal, %lu", buf, 0x2Au);

          id v4 = v45;
        }
      }
      v37 = [(SMReplayManager *)self timerStack];
      uint64_t v38 = [v37 count];

      if (!v38) {
        goto LABEL_17;
      }
    }
    if (v17)
    {
      uint64_t v39 = [v13 identifier];
      uint64_t v40 = [v13 endDate];
      v41 = [v40 stringFromDate];
      uint64_t v42 = [v4 stringFromDate];
      *(_DWORD *)buf = v44;
      v49 = "-[SMReplayManager _updateTimerStackForDate:]";
      __int16 v50 = 2112;
      id v51 = v39;
      __int16 v52 = 2112;
      v53 = v41;
      __int16 v54 = 2112;
      uint64_t v55 = (uint64_t)v42;
      _os_log_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_INFO, "%s, timer with identifier, %@, endDate, %@, has later fire date than new current date, %@", buf, 0x2Au);

      id v4 = v45;
    }
  }
LABEL_17:
  id v43 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v49 = "-[SMReplayManager _updateTimerStackForDate:]";
    _os_log_impl(&dword_1D9BFA000, v43, OS_LOG_TYPE_INFO, "%s, exit", buf, 0xCu);
  }
}

void __44__SMReplayManager__updateTimerStackForDate___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) handler];
  v1[2]();
}

- (void)onTriggerNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315394;
    long long v11 = "-[SMReplayManager onTriggerNotification:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, notification, %@", (uint8_t *)&v10, 0x16u);
  }

  int v6 = [v4 name];
  uint64_t v7 = +[RTNotification notificationName];
  int v8 = [v6 isEqualToString:v7];

  if (v8)
  {
    id v9 = v4;
    if ([v9 triggerCategory] == 3)
    {
      [(SMReplayManager *)self setNoProgressTriggered:1];
    }
    else if ([v9 triggerCategory] == 4)
    {
      [(SMReplayManager *)self setRouteDeviationTriggered:1];
    }
  }
}

- (void)evaluateResults
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(SMReplayManager *)self results];
    int v12 = 136315394;
    id v13 = "-[SMReplayManager evaluateResults]";
    __int16 v14 = 2112;
    int v15 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, evaluating results, %@", (uint8_t *)&v12, 0x16u);
  }
  id v5 = (void *)MEMORY[0x1E4F28D90];
  int v6 = [(SMReplayManager *)self results];
  uint64_t v7 = [v5 dataWithJSONObject:v6 options:1 error:0];

  int v8 = [(SMReplayManager *)self resultsPath];

  id v9 = (void *)MEMORY[0x1E4F1CB10];
  if (v8)
  {
    int v10 = [(SMReplayManager *)self resultsPath];
    long long v11 = [v9 fileURLWithPath:v10];
  }
  else
  {
    long long v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/tmp/results_json.json"];
  }
  [v7 writeToURL:v11 atomically:1];
}

- (id)_timerStackToString:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = (id)[a3 copy];
  uint64_t v3 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v18;
    int v6 = @"TimerStack:";
    do
    {
      uint64_t v7 = 0;
      int v8 = v6;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        int v10 = NSString;
        long long v11 = [v9 identifier];
        int v12 = [v9 endDate];
        id v13 = [v12 stringFromDate];
        __int16 v14 = [v10 stringWithFormat:@" [timerIdentifier, %@, timer fire date, %@] ", v11, v13];
        int v6 = [(__CFString *)v8 stringByAppendingString:v14];

        ++v7;
        int v8 = v6;
      }
      while (v4 != v7);
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }
  else
  {
    int v6 = @"TimerStack:";
  }

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDate)currentDate
{
  return self->_currentDate;
}

- (double)currentMapsExpectedETA
{
  return self->_currentMapsExpectedETA;
}

- (void)setCurrentMapsExpectedETA:(double)a3
{
  self->_currentMapsExpectedETA = a3;
}

- (unint64_t)currentPredominantMotionActivityType
{
  return self->_currentPredominantMotionActivityType;
}

- (NSMutableArray)replayEvents
{
  return self->_replayEvents;
}

- (void)setReplayEvents:(id)a3
{
}

- (NSMutableArray)mockLocations
{
  return self->_mockLocations;
}

- (void)setMockLocations:(id)a3
{
}

- (NSMutableDictionary)locationToEtaDictionary
{
  return self->_locationToEtaDictionary;
}

- (void)setLocationToEtaDictionary:(id)a3
{
}

- (NSMutableArray)mockMotionActivities
{
  return self->_mockMotionActivities;
}

- (void)setMockMotionActivities:(id)a3
{
}

- (NSMutableArray)timerStack
{
  return self->_timerStack;
}

- (void)setTimerStack:(id)a3
{
}

- (NSMutableDictionary)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
}

- (NSString)resultsPath
{
  return self->_resultsPath;
}

- (double)etaScaleFactor
{
  return self->_etaScaleFactor;
}

- (double)muteMapsExpectedETA
{
  return self->_muteMapsExpectedETA;
}

- (double)muteRouteDeviationTriggerWithinThreshold
{
  return self->_muteRouteDeviationTriggerWithinThreshold;
}

- (double)minDistanceETAUpdateThreshold
{
  return self->_minDistanceETAUpdateThreshold;
}

- (double)crowFliesWalkingSpeed
{
  return self->_crowFliesWalkingSpeed;
}

- (CLLocation)destinationLocation
{
  return self->_destinationLocation;
}

- (BOOL)noProgressTriggered
{
  return self->_noProgressTriggered;
}

- (BOOL)routeDeviationTriggered
{
  return self->_routeDeviationTriggered;
}

- (BOOL)predominantMotionActivitySet
{
  return self->_predominantMotionActivitySet;
}

- (void)setPredominantMotionActivitySet:(BOOL)a3
{
  self->_predominantMotionActivitySet = a3;
}

- (BOOL)muteTriggers
{
  return self->_muteTriggers;
}

- (void)setMuteTriggers:(BOOL)a3
{
  self->_muteTriggers = a3;
}

- (RTLocationSmoother)locationSmoother
{
  return self->_locationSmoother;
}

- (void)setLocationSmoother:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationSmoother, 0);
  objc_storeStrong((id *)&self->_destinationLocation, 0);
  objc_storeStrong((id *)&self->_resultsPath, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_timerStack, 0);
  objc_storeStrong((id *)&self->_mockMotionActivities, 0);
  objc_storeStrong((id *)&self->_locationToEtaDictionary, 0);
  objc_storeStrong((id *)&self->_mockLocations, 0);
  objc_storeStrong((id *)&self->_replayEvents, 0);
  objc_storeStrong((id *)&self->_currentDate, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end