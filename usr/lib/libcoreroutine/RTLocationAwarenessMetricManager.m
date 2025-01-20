@interface RTLocationAwarenessMetricManager
- (NSArray)sensitiveLocations;
- (NSDate)boutStateCurrBoutEnd;
- (NSDate)boutStateCurrBoutStart;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDate)stateVariableCurrMotionStart;
- (NSDate)stateVariableLastSensitiveLocationCheckTimestamp;
- (NSDate)stateVariableLastSettledStateChangeTimestamp;
- (NSDate)stateVariableLastWifiStateChangeTimestamp;
- (NSDate)stateVariablePrevLocationTimestamp;
- (NSDate)stateVariablePrevWifiLocationTimestamp;
- (NSMutableDictionary)boutBufferMotionBoutCounts;
- (NSMutableDictionary)boutBufferMotionDwell;
- (NSMutableDictionary)boutBufferMotionLongestDwell;
- (NSMutableDictionary)boutBufferSignalEnvironmentDwell;
- (NSMutableDictionary)boutStateMotionDwell;
- (NSMutableDictionary)boutStateMotionLongestDwell;
- (NSMutableDictionary)boutStateMotionTypeNumBouts;
- (NSMutableDictionary)boutStateSignalEnvironmentDwell;
- (NSMutableDictionary)dailyStateBoutCounts;
- (NSMutableDictionary)dailyStateBoutDwell;
- (NSMutableDictionary)dailyStateBoutLongestDwell;
- (NSMutableDictionary)dailyStateMotionDwell;
- (NSMutableDictionary)dailyStateSignalEnvironmentDwell;
- (RTDistanceCalculator)distanceCalculator;
- (RTLearnedLocationStore)learnedLocationStore;
- (RTLocationAwarenessMetricManager)initWithLocationManager:(id)a3 motionManager:(id)a4 learnedLocationStore:(id)a5 startDate:(id)a6 endDate:(id)a7;
- (RTLocationManager)locationManager;
- (RTMotionActivityManager)motionManager;
- (double)boutBufferDistanceToSensitiveLocation;
- (double)boutBufferMotionEdgeDwell;
- (double)boutBufferNumAdditionalFixesPerHourRequired10mDutyCycle;
- (double)boutBufferNumAdditionalFixesPerHourRequired15mDutyCycle;
- (double)boutBufferNumAdditionalFixesPerHourRequired1mDutyCycle;
- (double)boutBufferNumAdditionalFixesPerHourRequired2mDutyCycle;
- (double)boutBufferNumAdditionalFixesPerHourRequired5mDutyCycle;
- (double)boutBufferNumGPSLocationsInBout;
- (double)boutBufferNumOtherLocationsInBout;
- (double)boutMetricDistanceToSensitiveLocation;
- (double)boutMetricDuration;
- (double)boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle;
- (double)boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle;
- (double)boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle;
- (double)boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle;
- (double)boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle;
- (double)boutMetricNumGPSLocationsInBout;
- (double)boutMetricNumOtherLocationsInBout;
- (double)boutMetricNumWifiLocationsInBout;
- (double)distanceToNearestSensitiveLocation:(id)a3;
- (double)stateVariableMostRecentDistanceToSensitiveLocation;
- (id)collectBoutMetrics;
- (id)collectDailyMetrics;
- (id)createBoutDictionary;
- (id)createMotionDictionary;
- (id)createSignalEnvironmentDictionary;
- (id)locationsAndMotionsForDateInterval:(id)a3;
- (id)sensitiveLocationsOfInterestWithError:(id *)a3;
- (id)sortLocationsAndMotions:(id)a3;
- (int)stateVariableCurrSignalEnvironmentType;
- (unint64_t)boutBufferMotionEdgeType;
- (unint64_t)boutMetricType;
- (unint64_t)boutStateMotion;
- (unint64_t)boutStateTypeForLastCompleteBout;
- (unint64_t)boutStateWifi;
- (unint64_t)stateVariableCurrMotionActivityType;
- (void)addDwellForMotionType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 motionDwellMetrics:(id)a6 longestDwell:(id)a7 boutCounts:(id)a8;
- (void)addDwellForSignalEnvironmentType:(int)a3 startDate:(id)a4 endDate:(id)a5 sigEnvMetrics:(id)a6;
- (void)flushBufferToCurrBoutMetrics;
- (void)monitorStateChange:(id)a3;
- (void)processLastBout;
- (void)processLastDailyMetrics;
- (void)processMetrics;
- (void)resetBoutMetrics;
- (void)resetBuffer;
- (void)setBoutBufferDistanceToSensitiveLocation:(double)a3;
- (void)setBoutBufferMotionBoutCounts:(id)a3;
- (void)setBoutBufferMotionDwell:(id)a3;
- (void)setBoutBufferMotionEdgeDwell:(double)a3;
- (void)setBoutBufferMotionEdgeType:(unint64_t)a3;
- (void)setBoutBufferMotionLongestDwell:(id)a3;
- (void)setBoutBufferNumAdditionalFixesPerHourRequired10mDutyCycle:(double)a3;
- (void)setBoutBufferNumAdditionalFixesPerHourRequired15mDutyCycle:(double)a3;
- (void)setBoutBufferNumAdditionalFixesPerHourRequired1mDutyCycle:(double)a3;
- (void)setBoutBufferNumAdditionalFixesPerHourRequired2mDutyCycle:(double)a3;
- (void)setBoutBufferNumAdditionalFixesPerHourRequired5mDutyCycle:(double)a3;
- (void)setBoutBufferNumGPSLocationsInBout:(double)a3;
- (void)setBoutBufferNumOtherLocationsInBout:(double)a3;
- (void)setBoutBufferSignalEnvironmentDwell:(id)a3;
- (void)setBoutMetricDistanceToSensitiveLocation:(double)a3;
- (void)setBoutMetricDuration:(double)a3;
- (void)setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:(double)a3;
- (void)setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:(double)a3;
- (void)setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:(double)a3;
- (void)setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:(double)a3;
- (void)setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:(double)a3;
- (void)setBoutMetricNumGPSLocationsInBout:(double)a3;
- (void)setBoutMetricNumOtherLocationsInBout:(double)a3;
- (void)setBoutMetricNumWifiLocationsInBout:(double)a3;
- (void)setBoutMetricType:(unint64_t)a3;
- (void)setBoutStateCurrBoutEnd:(id)a3;
- (void)setBoutStateCurrBoutStart:(id)a3;
- (void)setBoutStateMotion:(unint64_t)a3;
- (void)setBoutStateMotionDwell:(id)a3;
- (void)setBoutStateMotionLongestDwell:(id)a3;
- (void)setBoutStateMotionTypeNumBouts:(id)a3;
- (void)setBoutStateSignalEnvironmentDwell:(id)a3;
- (void)setBoutStateTypeForLastCompleteBout:(unint64_t)a3;
- (void)setBoutStateWifi:(unint64_t)a3;
- (void)setDailyStateBoutCounts:(id)a3;
- (void)setDailyStateBoutDwell:(id)a3;
- (void)setDailyStateBoutLongestDwell:(id)a3;
- (void)setDailyStateMotionDwell:(id)a3;
- (void)setDailyStateSignalEnvironmentDwell:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setSensitiveLocations:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStateVariableCurrMotionActivityType:(unint64_t)a3;
- (void)setStateVariableCurrMotionStart:(id)a3;
- (void)setStateVariableCurrSignalEnvironmentType:(int)a3;
- (void)setStateVariableLastSensitiveLocationCheckTimestamp:(id)a3;
- (void)setStateVariableLastSettledStateChangeTimestamp:(id)a3;
- (void)setStateVariableLastWifiStateChangeTimestamp:(id)a3;
- (void)setStateVariableMostRecentDistanceToSensitiveLocation:(double)a3;
- (void)setStateVariablePrevLocationTimestamp:(id)a3;
- (void)setStateVariablePrevWifiLocationTimestamp:(id)a3;
- (void)setup;
- (void)submitBoutMetricsToCoreAnalytics;
- (void)submitDailyMetricsToCoreAnalytics;
- (void)submitMetrics;
- (void)updateBoutMetricsForLocation:(id)a3;
- (void)updateBoutMetricsForMotion:(id)a3;
- (void)updateBoutMetricsStateChangeEdgeDwell;
- (void)updateDailyMetrics:(id)a3;
- (void)updateStateVariables:(id)a3;
@end

@implementation RTLocationAwarenessMetricManager

- (RTLocationAwarenessMetricManager)initWithLocationManager:(id)a3 motionManager:(id)a4 learnedLocationStore:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (!v13)
  {
    v23 = v17;
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: locationManager";
LABEL_17:
    _os_log_error_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
    goto LABEL_18;
  }
  if (!v14)
  {
    v23 = v17;
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: motionManager";
    goto LABEL_17;
  }
  if (!v15)
  {
    v23 = v17;
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_18;
    }
    *(_WORD *)buf = 0;
    v25 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_17;
  }
  if (!v16)
  {
    v23 = v17;
    v24 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: startDate";
      goto LABEL_17;
    }
LABEL_18:

    v22 = 0;
    goto LABEL_19;
  }
  id v28 = v17;
  if (v17)
  {
    v29.receiver = self;
    v29.super_class = (Class)RTLocationAwarenessMetricManager;
    v18 = [(RTLocationAwarenessMetricManager *)&v29 init];
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_locationManager, a3);
      objc_storeStrong((id *)&v19->_motionManager, a4);
      objc_storeStrong((id *)&v19->_learnedLocationStore, a5);
      objc_storeStrong((id *)&v19->_startDate, a6);
      objc_storeStrong((id *)&v19->_endDate, a7);
      uint64_t v20 = objc_opt_new();
      distanceCalculator = v19->_distanceCalculator;
      v19->_distanceCalculator = (RTDistanceCalculator *)v20;

      [(RTLocationAwarenessMetricManager *)v19 setup];
    }
    self = v19;
    v22 = self;
  }
  else
  {
    v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: endDate", buf, 2u);
    }

    v22 = 0;
  }
  v23 = v28;
LABEL_19:

  return v22;
}

- (void)setup
{
  v80[1] = *MEMORY[0x1E4F143B8];
  v4 = [(RTLocationAwarenessMetricManager *)self createSignalEnvironmentDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutStateSignalEnvironmentDwell:v4];

  v5 = [(RTLocationAwarenessMetricManager *)self createMotionDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutStateMotionDwell:v5];

  v6 = [(RTLocationAwarenessMetricManager *)self createMotionDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutStateMotionLongestDwell:v6];

  v7 = [(RTLocationAwarenessMetricManager *)self createMotionDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutStateMotionTypeNumBouts:v7];

  [(RTLocationAwarenessMetricManager *)self setBoutStateMotion:0];
  [(RTLocationAwarenessMetricManager *)self setBoutStateWifi:0];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricType:0];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumWifiLocationsInBout:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumGPSLocationsInBout:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumOtherLocationsInBout:0.0];
  v8 = [(RTLocationAwarenessMetricManager *)self startDate];
  [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutStart:v8];

  v9 = [MEMORY[0x1E4F1C9C8] distantFuture];
  [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutEnd:v9];

  [(RTLocationAwarenessMetricManager *)self setBoutMetricDistanceToSensitiveLocation:-1.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferDistanceToSensitiveLocation:-1.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferMotionEdgeDwell:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferMotionEdgeType:0];
  v10 = [(RTLocationAwarenessMetricManager *)self createMotionDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferMotionDwell:v10];

  v11 = [(RTLocationAwarenessMetricManager *)self createMotionDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferMotionLongestDwell:v11];

  v12 = [(RTLocationAwarenessMetricManager *)self createMotionDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferMotionBoutCounts:v12];

  id v13 = [(RTLocationAwarenessMetricManager *)self createSignalEnvironmentDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferSignalEnvironmentDwell:v13];

  [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired1mDutyCycle:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired2mDutyCycle:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired5mDutyCycle:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired10mDutyCycle:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired15mDutyCycle:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferNumGPSLocationsInBout:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferNumOtherLocationsInBout:0.0];
  id v14 = [(RTLocationAwarenessMetricManager *)self createSignalEnvironmentDictionary];
  [(RTLocationAwarenessMetricManager *)self setDailyStateSignalEnvironmentDwell:v14];

  id v15 = [(RTLocationAwarenessMetricManager *)self createMotionDictionary];
  [(RTLocationAwarenessMetricManager *)self setDailyStateMotionDwell:v15];

  id v16 = [(RTLocationAwarenessMetricManager *)self createBoutDictionary];
  [(RTLocationAwarenessMetricManager *)self setDailyStateBoutCounts:v16];

  id v17 = [(RTLocationAwarenessMetricManager *)self createBoutDictionary];
  [(RTLocationAwarenessMetricManager *)self setDailyStateBoutDwell:v17];

  v18 = [(RTLocationAwarenessMetricManager *)self createBoutDictionary];
  [(RTLocationAwarenessMetricManager *)self setDailyStateBoutLongestDwell:v18];

  dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
  uint64_t v69 = 0;
  v70 = (id *)&v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__94;
  v73 = __Block_byref_object_dispose__94;
  id v74 = 0;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x3032000000;
  v66 = __Block_byref_object_copy__94;
  v67 = __Block_byref_object_dispose__94;
  id v68 = 0;
  motionManager = self->_motionManager;
  v21 = [(NSDate *)self->_startDate dateByAddingTimeInterval:-0.001];
  v22 = [(NSDate *)self->_startDate dateByAddingTimeInterval:0.001];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = __41__RTLocationAwarenessMetricManager_setup__block_invoke;
  v59[3] = &unk_1E6B905F0;
  v61 = &v63;
  v62 = &v69;
  v23 = v19;
  v60 = v23;
  [(RTMotionActivityManager *)motionManager fetchMotionActivitiesFromStartDate:v21 endDate:v22 handler:v59];

  v24 = v23;
  v25 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v26 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v24, v26)) {
    goto LABEL_6;
  }
  v27 = [MEMORY[0x1E4F1C9C8] now];
  [v27 timeIntervalSinceDate:v25];
  double v29 = v28;
  v30 = objc_opt_new();
  v31 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_609];
  v32 = [MEMORY[0x1E4F29060] callStackSymbols];
  v33 = [v32 filteredArrayUsingPredicate:v31];
  v34 = [v33 firstObject];

  [v30 submitToCoreAnalytics:v34 type:1 duration:v29];
  v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v36 = (void *)MEMORY[0x1E4F28C58];
  v80[0] = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:v80 count:1];
  v38 = [v36 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v37];

  if (v38)
  {
    id v39 = v38;

    char v40 = 0;
  }
  else
  {
LABEL_6:
    id v39 = 0;
    char v40 = 1;
  }

  id v41 = v39;
  if ((v40 & 1) == 0) {
    objc_storeStrong(v70 + 5, v39);
  }
  if (v70[5] || ![(id)v64[5] count])
  {
    [(RTLocationAwarenessMetricManager *)self setStateVariableCurrMotionActivityType:0];
  }
  else
  {
    v42 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      v56 = [(id)v64[5] firstObject];
      id v57 = v70[5];
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v56;
      __int16 v76 = 2112;
      v77 = v57;
      _os_log_debug_impl(&dword_1D9BFA000, v42, OS_LOG_TYPE_DEBUG, "initializing motion activity to, %@, error, %@", buf, 0x16u);
    }
    v43 = [(id)v64[5] firstObject];
    -[RTLocationAwarenessMetricManager setStateVariableCurrMotionActivityType:](self, "setStateVariableCurrMotionActivityType:", [v43 type]);
  }
  v44 = [(RTLocationAwarenessMetricManager *)self startDate];
  [(RTLocationAwarenessMetricManager *)self setStateVariableCurrMotionStart:v44];

  [(RTLocationAwarenessMetricManager *)self setStateVariableCurrSignalEnvironmentType:0];
  v45 = [(RTLocationAwarenessMetricManager *)self startDate];
  [(RTLocationAwarenessMetricManager *)self setStateVariableLastSettledStateChangeTimestamp:v45];

  v46 = [(RTLocationAwarenessMetricManager *)self startDate];
  [(RTLocationAwarenessMetricManager *)self setStateVariableLastWifiStateChangeTimestamp:v46];

  v47 = [(RTLocationAwarenessMetricManager *)self startDate];
  [(RTLocationAwarenessMetricManager *)self setStateVariablePrevLocationTimestamp:v47];

  v48 = [(RTLocationAwarenessMetricManager *)self startDate];
  [(RTLocationAwarenessMetricManager *)self setStateVariablePrevWifiLocationTimestamp:v48];

  v49 = [(RTLocationAwarenessMetricManager *)self startDate];
  [(RTLocationAwarenessMetricManager *)self setStateVariableLastSensitiveLocationCheckTimestamp:v49];

  [(RTLocationAwarenessMetricManager *)self setStateVariableMostRecentDistanceToSensitiveLocation:-1.0];
  id v58 = 0;
  v50 = [(RTLocationAwarenessMetricManager *)self sensitiveLocationsOfInterestWithError:&v58];
  id v51 = v58;
  [(RTLocationAwarenessMetricManager *)self setSensitiveLocations:v50];

  v52 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
  {
    v53 = (objc_class *)objc_opt_class();
    NSStringFromClass(v53);
    id v54 = (id)objc_claimAutoreleasedReturnValue();
    v55 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v54;
    __int16 v76 = 2112;
    v77 = v55;
    __int16 v78 = 2112;
    id v79 = v51;
    _os_log_debug_impl(&dword_1D9BFA000, v52, OS_LOG_TYPE_DEBUG, "%@, %@, fetch sensitive locations error, %@", buf, 0x20u);
  }
  _Block_object_dispose(&v63, 8);

  _Block_object_dispose(&v69, 8);
}

void __41__RTLocationAwarenessMetricManager_setup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)createBoutDictionary
{
  v2 = objc_opt_new();
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F34515A8];
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F34515C0];
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F34515D8];
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F34515F0];

  return v2;
}

- (id)createMotionDictionary
{
  v2 = objc_opt_new();
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F34515A8];
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F34515C0];
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F34515D8];
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F34515F0];
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F3451608];
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F3451620];
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F3451638];

  return v2;
}

- (id)createSignalEnvironmentDictionary
{
  v2 = objc_opt_new();
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F3451590];
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F3451650];
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F3451668];
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F3451680];
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F3451698];
  [v2 setObject:&unk_1F3451590 forKeyedSubscript:&unk_1F34516B0];

  return v2;
}

- (void)resetBoutMetrics
{
  v3 = [(RTLocationAwarenessMetricManager *)self createSignalEnvironmentDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutStateSignalEnvironmentDwell:v3];

  v4 = [(RTLocationAwarenessMetricManager *)self createMotionDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutStateMotionLongestDwell:v4];

  id v5 = [(RTLocationAwarenessMetricManager *)self createMotionDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutStateMotionTypeNumBouts:v5];

  id v6 = [(RTLocationAwarenessMetricManager *)self createMotionDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutStateMotionDwell:v6];

  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumGPSLocationsInBout:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumWifiLocationsInBout:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumOtherLocationsInBout:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:0.0];

  [(RTLocationAwarenessMetricManager *)self setBoutMetricDistanceToSensitiveLocation:-1.0];
}

- (void)resetBuffer
{
  v3 = [(RTLocationAwarenessMetricManager *)self createSignalEnvironmentDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferSignalEnvironmentDwell:v3];

  v4 = [(RTLocationAwarenessMetricManager *)self createMotionDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferMotionDwell:v4];

  id v5 = [(RTLocationAwarenessMetricManager *)self createMotionDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferMotionLongestDwell:v5];

  id v6 = [(RTLocationAwarenessMetricManager *)self createMotionDictionary];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferMotionBoutCounts:v6];

  [(RTLocationAwarenessMetricManager *)self setBoutBufferMotionEdgeDwell:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferMotionEdgeType:[(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionActivityType]];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferNumGPSLocationsInBout:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferNumOtherLocationsInBout:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired1mDutyCycle:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired2mDutyCycle:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired5mDutyCycle:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired10mDutyCycle:0.0];
  [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired15mDutyCycle:0.0];

  [(RTLocationAwarenessMetricManager *)self setBoutBufferDistanceToSensitiveLocation:-1.0];
}

- (id)locationsAndMotionsForDateInterval:(id)a3
{
  v98[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v61 = [v4 startDate];
  v60 = [v4 endDate];
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  id v79 = __Block_byref_object_copy__94;
  v80 = __Block_byref_object_dispose__94;
  id v81 = (id)objc_opt_new();
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v6 = [objc_alloc(MEMORY[0x1E4F5CF40]) initWithDateInterval:v4 horizontalAccuracy:3600 batchSize:0 boundingBoxLocation:250.0];
  uint64_t v70 = 0;
  uint64_t v71 = (id *)&v70;
  uint64_t v72 = 0x3032000000;
  v73 = __Block_byref_object_copy__94;
  id v74 = __Block_byref_object_dispose__94;
  id v75 = 0;
  locationManager = self->_locationManager;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __71__RTLocationAwarenessMetricManager_locationsAndMotionsForDateInterval___block_invoke;
  v66[3] = &unk_1E6B905F0;
  id v68 = &v70;
  uint64_t v69 = &v76;
  v8 = v5;
  v67 = v8;
  v59 = (void *)v6;
  [(RTLocationManager *)locationManager fetchStoredLocationsWithOptions:v6 handler:v66];
  uint64_t v9 = v8;
  v10 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v11 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v9, v11)) {
    goto LABEL_6;
  }
  id v12 = [MEMORY[0x1E4F1C9C8] now];
  [v12 timeIntervalSinceDate:v10];
  double v14 = v13;
  id v15 = objc_opt_new();
  id v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_609];
  id v17 = [MEMORY[0x1E4F29060] callStackSymbols];
  v18 = [v17 filteredArrayUsingPredicate:v16];
  dispatch_semaphore_t v19 = [v18 firstObject];

  [v15 submitToCoreAnalytics:v19 type:1 duration:v14];
  uint64_t v20 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v20, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v21 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v89 = *MEMORY[0x1E4F28568];
  *(void *)buf = @"semaphore wait timeout";
  v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v89 count:1];
  v23 = [v21 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v22];

  if (v23)
  {
    id v24 = v23;

    char v25 = 0;
  }
  else
  {
LABEL_6:
    id v24 = 0;
    char v25 = 1;
  }

  id v26 = v24;
  if ((v25 & 1) == 0) {
    objc_storeStrong(v71 + 5, v24);
  }
  v27 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v51 = [(id)v77[5] count];
    id v52 = [v61 stringFromDate];
    v53 = [v60 stringFromDate];
    id v54 = v71[5];
    *(_DWORD *)buf = 134218754;
    *(void *)&buf[4] = v51;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v52;
    *(_WORD *)&buf[22] = 2112;
    v96 = v53;
    LOWORD(v97) = 2112;
    *(void *)((char *)&v97 + 2) = v54;
    _os_log_debug_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_DEBUG, "Fetched %lu locations, batch for metrics from, %@, to, %@, error, %@", buf, 0x2Au);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  v96 = __Block_byref_object_copy__94;
  *(void *)&long long v97 = __Block_byref_object_dispose__94;
  *((void *)&v97 + 1) = 0;
  uint64_t v89 = 0;
  v90 = &v89;
  uint64_t v91 = 0x3032000000;
  v92 = __Block_byref_object_copy__94;
  v93 = __Block_byref_object_dispose__94;
  id v94 = (id)objc_opt_new();
  motionManager = self->_motionManager;
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __71__RTLocationAwarenessMetricManager_locationsAndMotionsForDateInterval___block_invoke_31;
  v62[3] = &unk_1E6B905F0;
  v64 = &v89;
  uint64_t v65 = buf;
  double v29 = v9;
  uint64_t v63 = v29;
  [(RTMotionActivityManager *)motionManager fetchMotionActivitiesFromStartDate:v61 endDate:v60 handler:v62];
  v30 = v29;
  v31 = [MEMORY[0x1E4F1C9C8] now];
  dispatch_time_t v32 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v30, v32)) {
    goto LABEL_16;
  }
  v33 = [MEMORY[0x1E4F1C9C8] now];
  [v33 timeIntervalSinceDate:v31];
  double v35 = v34;
  v36 = objc_opt_new();
  v37 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_609];
  v38 = [MEMORY[0x1E4F29060] callStackSymbols];
  id v39 = [v38 filteredArrayUsingPredicate:v37];
  char v40 = [v39 firstObject];

  [v36 submitToCoreAnalytics:v40 type:1 duration:v35];
  id v41 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v82 = 0;
    _os_log_fault_impl(&dword_1D9BFA000, v41, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v82, 2u);
  }

  v42 = (void *)MEMORY[0x1E4F28C58];
  v98[0] = *MEMORY[0x1E4F28568];
  *(void *)v82 = @"semaphore wait timeout";
  v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v82 forKeys:v98 count:1];
  v44 = [v42 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:15 userInfo:v43];

  if (v44)
  {
    id v45 = v44;

    char v46 = 0;
  }
  else
  {
LABEL_16:
    char v46 = 1;
    id v45 = v26;
  }

  id v47 = v45;
  if ((v46 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)&buf[8] + 40), v45);
  }
  v48 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v55 = [(id)v90[5] count];
    id v56 = [v61 stringFromDate];
    id v57 = [v60 stringFromDate];
    uint64_t v58 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)v82 = 134218754;
    *(void *)&v82[4] = v55;
    __int16 v83 = 2112;
    id v84 = v56;
    __int16 v85 = 2112;
    v86 = v57;
    __int16 v87 = 2112;
    uint64_t v88 = v58;
    _os_log_debug_impl(&dword_1D9BFA000, v48, OS_LOG_TYPE_DEBUG, "Fetched %lu motion activities, batch for metrics from, %@, to, %@, error, %@", v82, 0x2Au);
  }
  if (*(void *)(*(void *)&buf[8] + 40))
  {
    v49 = 0;
  }
  else
  {
    v49 = objc_opt_new();
    [v49 addObjectsFromArray:v77[5]];
    [v49 addObjectsFromArray:v90[5]];
  }

  _Block_object_dispose(&v89, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v76, 8);

  return v49;
}

void __71__RTLocationAwarenessMetricManager_locationsAndMotionsForDateInterval___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  id v9 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
  id v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __71__RTLocationAwarenessMetricManager_locationsAndMotionsForDateInterval___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)sensitiveLocationsOfInterestWithError:(id *)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v32 = [MEMORY[0x1E4F1CA48] array];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v38 = [&unk_1F34530D8 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v38)
  {
    uint64_t v35 = *(void *)v57;
    uint64_t v33 = *MEMORY[0x1E4F5CFE8];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    while (2)
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v57 != v35) {
          objc_enumerationMutation(&unk_1F34530D8);
        }
        id v5 = *(void **)(*((void *)&v56 + 1) + 8 * v4);
        uint64_t v50 = 0;
        uint64_t v51 = (id *)&v50;
        uint64_t v52 = 0x3032000000;
        v53 = __Block_byref_object_copy__94;
        id v54 = __Block_byref_object_dispose__94;
        id v55 = 0;
        uint64_t v44 = 0;
        id v45 = &v44;
        uint64_t v46 = 0x3032000000;
        id v47 = __Block_byref_object_copy__94;
        v48 = __Block_byref_object_dispose__94;
        id v49 = 0;
        dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
        learnedLocationStore = self->_learnedLocationStore;
        uint64_t v8 = [v5 unsignedIntegerValue];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __74__RTLocationAwarenessMetricManager_sensitiveLocationsOfInterestWithError___block_invoke;
        v39[3] = &unk_1E6B98C40;
        v39[4] = self;
        v39[5] = v5;
        id v41 = &v50;
        v42 = &v44;
        SEL v43 = a2;
        uint64_t v9 = v6;
        char v40 = v9;
        [(RTLearnedLocationStore *)learnedLocationStore fetchLocationsOfInterestWithPlaceType:v8 handler:v39];
        v10 = v9;
        id v11 = [MEMORY[0x1E4F1C9C8] now];
        dispatch_time_t v12 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v10, v12)) {
          goto LABEL_11;
        }
        double v13 = [MEMORY[0x1E4F1C9C8] now];
        [v13 timeIntervalSinceDate:v11];
        double v15 = v14;
        id v16 = objc_opt_new();
        id v17 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_609];
        v18 = [MEMORY[0x1E4F29060] callStackSymbols];
        dispatch_semaphore_t v19 = [v18 filteredArrayUsingPredicate:v17];
        uint64_t v20 = [v19 firstObject];

        [v16 submitToCoreAnalytics:v20 type:1 duration:v15];
        v21 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1D9BFA000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
        }

        v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v61 = v34;
        *(void *)buf = @"semaphore wait timeout";
        v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v61 count:1];
        id v24 = [v22 errorWithDomain:v33 code:15 userInfo:v23];

        if (v24)
        {
          id v25 = v24;

          char v26 = 0;
        }
        else
        {
LABEL_11:
          id v25 = 0;
          char v26 = 1;
        }

        id v27 = v25;
        if ((v26 & 1) == 0) {
          objc_storeStrong(v51 + 5, v25);
        }
        id v28 = v51[5];
        if (v28)
        {
          if (a3) {
            *a3 = v28;
          }
        }
        else if (v45[5])
        {
          [v32 addObjectsFromArray:];
        }

        _Block_object_dispose(&v44, 8);
        _Block_object_dispose(&v50, 8);

        if (v28)
        {
          id v30 = 0;
          double v29 = v32;
          goto LABEL_24;
        }
        ++v4;
      }
      while (v38 != v4);
      uint64_t v38 = [&unk_1F34530D8 countByEnumeratingWithState:&v56 objects:v60 count:16];
      if (v38) {
        continue;
      }
      break;
    }
  }
  double v29 = v32;
  id v30 = v32;
LABEL_24:

  return v30;
}

void __74__RTLocationAwarenessMetricManager_sensitiveLocationsOfInterestWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = (objc_class *)objc_opt_class();
    uint64_t v9 = NSStringFromClass(v8);
    v10 = NSStringFromSelector(*(SEL *)(a1 + 72));
    uint64_t v11 = [v5 count];
    uint64_t v12 = [*(id *)(a1 + 40) unsignedIntegerValue];
    int v19 = 138413058;
    uint64_t v20 = v9;
    __int16 v21 = 2112;
    v22 = v10;
    __int16 v23 = 2048;
    uint64_t v24 = v11;
    __int16 v25 = 2048;
    uint64_t v26 = v12;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, %@, fetched %lu learned location of interest from learned location store, of placeType, %lu", (uint8_t *)&v19, 0x2Au);
  }
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
  double v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v6;
  id v15 = v6;

  uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
  id v17 = *(void **)(v16 + 40);
  *(void *)(v16 + 40) = v5;
  id v18 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

- (void)addDwellForMotionType:(unint64_t)a3 startDate:(id)a4 endDate:(id)a5 motionDwellMetrics:(id)a6 longestDwell:(id)a7 boutCounts:(id)a8
{
  id v48 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  [v14 timeIntervalSinceDate:v48];
  if (v18 < 0.0) {
    goto LABEL_17;
  }
  [v48 timeIntervalSinceDate:self->_endDate];
  if (v19 >= 0.0) {
    goto LABEL_17;
  }
  if ([(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionActivityType] == a3)
  {
    uint64_t v20 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
    if (([v48 isEqualToDate:v20] & 1) == 0)
    {
      __int16 v21 = [(RTLocationAwarenessMetricManager *)self startDate];
      if (([v48 isEqualToDate:v21] & 1) == 0)
      {
        v22 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutEnd];
        if (![v14 isEqualToDate:v22])
        {
          uint64_t v46 = [(RTLocationAwarenessMetricManager *)self endDate];
          char v47 = [v14 isEqualToDate:v46];

          if ((v47 & 1) == 0) {
            goto LABEL_17;
          }
          goto LABEL_10;
        }
      }
    }
  }
LABEL_10:
  __int16 v23 = [v14 earlierDate:self->_endDate];
  [v23 timeIntervalSinceDate:v48];
  double v25 = v24;

  uint64_t v26 = NSNumber;
  uint64_t v27 = [NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType")];
  id v28 = [v15 objectForKeyedSubscript:v27];
  [v28 doubleValue];
  id v30 = [v26 numberWithDouble:v25 + v29];
  v31 = [NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType")];
  [v15 setObject:v30 forKeyedSubscript:v31];

  if ([v16 count])
  {
    dispatch_time_t v32 = NSNumber;
    uint64_t v33 = [NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType")];
    uint64_t v34 = [v16 objectForKeyedSubscript:v33];
    [v34 doubleValue];
    double v36 = v35;

    if (v36 >= v25) {
      double v37 = v36;
    }
    else {
      double v37 = v25;
    }
    uint64_t v38 = [v32 numberWithDouble:v37];
    id v39 = [NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType")];
    [v16 setObject:v38 forKeyedSubscript:v39];
  }
  if ([v17 count])
  {
    char v40 = NSNumber;
    id v41 = [NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType")];
    v42 = [v17 objectForKeyedSubscript:v41];
    [v42 doubleValue];
    uint64_t v44 = [v40 numberWithDouble:v43 + 1.0];
    id v45 = [NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager stateVariableCurrMotionActivityType](self, "stateVariableCurrMotionActivityType")];
    [v17 setObject:v44 forKeyedSubscript:v45];
  }
LABEL_17:
}

- (void)addDwellForSignalEnvironmentType:(int)a3 startDate:(id)a4 endDate:(id)a5 sigEnvMetrics:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  id v42 = a4;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevLocationTimestamp];
  uint64_t v13 = [(RTLocationAwarenessMetricManager *)self startDate];
  int v14 = [v12 isEqualToDate:v13];

  if (v14) {
    [(RTLocationAwarenessMetricManager *)self setStateVariableCurrSignalEnvironmentType:v8];
  }
  if ([(RTLocationAwarenessMetricManager *)self stateVariableCurrSignalEnvironmentType] == v8)
  {
    [v10 timeIntervalSinceDate:v42];
    double v16 = v15;
    id v17 = NSNumber;
    double v18 = [NSNumber numberWithUnsignedInt:v8];
    double v19 = [v11 objectForKeyedSubscript:v18];
    [v19 doubleValue];
    __int16 v21 = [v17 numberWithDouble:v16 + v20];
    v22 = [NSNumber numberWithUnsignedInt:v8];
    [v11 setObject:v21 forKeyedSubscript:v22];
  }
  else
  {
    __int16 v23 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevLocationTimestamp];
    [v10 timeIntervalSinceDate:v23];
    double v25 = v24;

    uint64_t v26 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t v27 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevLocationTimestamp];
    double v18 = [v26 dateWithTimeInterval:v27 sinceDate:v25 * 0.5];

    id v28 = [v42 laterDate:v18];
    [v28 timeIntervalSinceDate:v42];
    double v30 = v29;

    [v10 timeIntervalSinceDate:v18];
    double v32 = v31;
    uint64_t v33 = NSNumber;
    uint64_t v34 = [NSNumber numberWithUnsignedInt:-[RTLocationAwarenessMetricManager stateVariableCurrSignalEnvironmentType](self, "stateVariableCurrSignalEnvironmentType")];
    double v35 = [v11 objectForKeyedSubscript:v34];
    [v35 doubleValue];
    double v37 = [v33 numberWithDouble:v30 + v36];
    uint64_t v38 = [NSNumber numberWithUnsignedInt:-[RTLocationAwarenessMetricManager stateVariableCurrSignalEnvironmentType](self, "stateVariableCurrSignalEnvironmentType")];
    [v11 setObject:v37 forKeyedSubscript:v38];

    id v39 = NSNumber;
    double v19 = [NSNumber numberWithUnsignedInt:v8];
    __int16 v21 = [v11 objectForKeyedSubscript:v19];
    [v21 doubleValue];
    v22 = [v39 numberWithDouble:v32 + v40];
    id v41 = [NSNumber numberWithUnsignedInt:v8];
    [v11 setObject:v22 forKeyedSubscript:v41];
  }
}

- (double)distanceToNearestSensitiveLocation:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  sensitiveLocations = self->_sensitiveLocations;
  double v6 = -1.0;
  if (sensitiveLocations && [(NSArray *)sensitiveLocations count])
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F5CE00]) initWithCLLocation:v4];
    uint64_t v23 = 0;
    double v24 = (double *)&v23;
    uint64_t v25 = 0x2020000000;
    uint64_t v26 = 0x41DFFFFFFFC00000;
    uint64_t v17 = 0;
    double v18 = &v17;
    uint64_t v19 = 0x3032000000;
    double v20 = __Block_byref_object_copy__94;
    __int16 v21 = __Block_byref_object_dispose__94;
    id v22 = 0;
    uint64_t v8 = self->_sensitiveLocations;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __71__RTLocationAwarenessMetricManager_distanceToNearestSensitiveLocation___block_invoke;
    v13[3] = &unk_1E6B98C68;
    v13[4] = self;
    id v9 = v7;
    id v14 = v9;
    double v15 = &v17;
    double v16 = &v23;
    [(NSArray *)v8 enumerateObjectsUsingBlock:v13];
    if (v18[5])
    {
      id v10 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = v18[5];
        *(_DWORD *)buf = 138412546;
        uint64_t v28 = v12;
        __int16 v29 = 2112;
        id v30 = v4;
        _os_log_debug_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_DEBUG, "error for near sensitive location check: error, %@, location, %@", buf, 0x16u);
      }
    }
    else
    {
      double v6 = v24[3];
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
  return v6;
}

void __71__RTLocationAwarenessMetricManager_distanceToNearestSensitiveLocation___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 440);
  id v5 = [a2 location];
  double v6 = [v5 location];
  id v12 = 0;
  [v4 distanceFromLocation:v3 toLocation:v6 error:&v12];
  double v8 = v7;
  id v9 = v12;
  id v10 = v12;

  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v9);
  uint64_t v11 = *(void *)(a1[7] + 8);
  if (v8 < *(double *)(v11 + 24)) {
    *(double *)(v11 + 24) = v8;
  }
}

- (id)sortLocationsAndMotions:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&__block_literal_global_75];
}

uint64_t __60__RTLocationAwarenessMetricManager_sortLocationsAndMotions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v5 timestamp];
  }
  else {
  double v6 = [v5 startDate];
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v4 startDate];
  }
  else {
  double v7 = [v4 timestamp];
  }
  uint64_t v8 = [v6 compare:v7];

  return v8;
}

- (void)flushBufferToCurrBoutMetrics
{
  uint64_t v138 = *MEMORY[0x1E4F143B8];
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id obj = [(RTLocationAwarenessMetricManager *)self boutBufferSignalEnvironmentDwell];
  uint64_t v3 = [obj countByEnumeratingWithState:&v130 objects:v137 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    id v114 = *(id *)v131;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(id *)v131 != v114) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v130 + 1) + 8 * v5);
        double v7 = NSNumber;
        uint64_t v8 = [(RTLocationAwarenessMetricManager *)self boutStateSignalEnvironmentDwell];
        id v9 = [v8 objectForKeyedSubscript:v6];
        [v9 doubleValue];
        double v11 = v10;
        id v12 = [(RTLocationAwarenessMetricManager *)self boutBufferSignalEnvironmentDwell];
        uint64_t v13 = [v12 objectForKeyedSubscript:v6];
        [v13 doubleValue];
        double v15 = [v7 numberWithDouble:v11 + v14];
        double v16 = [(RTLocationAwarenessMetricManager *)self boutStateSignalEnvironmentDwell];
        [v16 setObject:v15 forKeyedSubscript:v6];

        ++v5;
      }
      while (v4 != v5);
      uint64_t v4 = [obj countByEnumeratingWithState:&v130 objects:v137 count:16];
    }
    while (v4);
  }

  long long v128 = 0u;
  long long v129 = 0u;
  long long v126 = 0u;
  long long v127 = 0u;
  id v115 = [(RTLocationAwarenessMetricManager *)self boutBufferMotionLongestDwell];
  uint64_t v17 = [v115 countByEnumeratingWithState:&v126 objects:v136 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v127;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v127 != v19) {
          objc_enumerationMutation(v115);
        }
        __int16 v21 = *(void **)(*((void *)&v126 + 1) + 8 * v20);
        id v22 = [NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager boutBufferMotionEdgeType](self, "boutBufferMotionEdgeType")];
        if (([v21 isEqualToNumber:v22] & 1) == 0)
        {

LABEL_21:
          uint64_t v33 = NSNumber;
          double v40 = [(RTLocationAwarenessMetricManager *)self boutStateMotionLongestDwell];
          id v41 = [v40 objectForKeyedSubscript:v21];
          [v41 doubleValue];
          double v43 = v42;

          uint64_t v44 = [(RTLocationAwarenessMetricManager *)self boutBufferMotionLongestDwell];
          id v45 = [v44 objectForKeyedSubscript:v21];
          [v45 doubleValue];
          double v47 = v46;

          if (v43 >= v47) {
            double v39 = v43;
          }
          else {
            double v39 = v47;
          }
          goto LABEL_24;
        }
        uint64_t v23 = [(RTLocationAwarenessMetricManager *)self boutStateMotionDwell];
        double v24 = [v23 objectForKeyedSubscript:v21];
        char v25 = [v24 isEqualToNumber:&unk_1F3451590];

        if (v25) {
          goto LABEL_21;
        }
        [(RTLocationAwarenessMetricManager *)self boutBufferMotionEdgeDwell];
        double v27 = v26;
        uint64_t v28 = [(RTLocationAwarenessMetricManager *)self boutStateMotionLongestDwell];
        __int16 v29 = [NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager boutBufferMotionEdgeType](self, "boutBufferMotionEdgeType")];
        id v30 = [v28 objectForKeyedSubscript:v29];
        [v30 doubleValue];
        double v32 = v31;

        if (v27 >= v32) {
          double v32 = v27;
        }
        uint64_t v33 = NSNumber;
        uint64_t v34 = [(RTLocationAwarenessMetricManager *)self boutBufferMotionLongestDwell];
        double v35 = [[NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager boutBufferMotionEdgeType](self, "boutBufferMotionEdgeType")];
        double v36 = [v34 objectForKeyedSubscript:v35];
        [v36 doubleValue];
        double v38 = v37;

        if (v32 >= v38) {
          double v39 = v32;
        }
        else {
          double v39 = v38;
        }
LABEL_24:
        id v48 = [v33 numberWithDouble:v39];
        id v49 = [(RTLocationAwarenessMetricManager *)self boutStateMotionLongestDwell];
        [v49 setObject:v48 forKeyedSubscript:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [v115 countByEnumeratingWithState:&v126 objects:v136 count:16];
    }
    while (v18);
  }

  long long v124 = 0u;
  long long v125 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  id obja = [(RTLocationAwarenessMetricManager *)self boutBufferMotionBoutCounts];
  uint64_t v50 = [obja countByEnumeratingWithState:&v122 objects:v135 count:16];
  if (!v50) {
    goto LABEL_40;
  }
  uint64_t v51 = v50;
  id v116 = *(id *)v123;
  do
  {
    uint64_t v52 = 0;
    do
    {
      if (*(id *)v123 != v116) {
        objc_enumerationMutation(obja);
      }
      v53 = *(void **)(*((void *)&v122 + 1) + 8 * v52);
      id v54 = [NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager boutBufferMotionEdgeType](self, "boutBufferMotionEdgeType")];
      int v55 = [v53 isEqualToNumber:v54];

      if (!v55)
      {
        uint64_t v65 = NSNumber;
        long long v56 = [(RTLocationAwarenessMetricManager *)self boutStateMotionTypeNumBouts];
        long long v57 = [v56 objectForKeyedSubscript:v53];
        [v57 doubleValue];
        double v67 = v66;
        uint64_t v63 = [(RTLocationAwarenessMetricManager *)self boutBufferMotionBoutCounts];
        v64 = [v63 objectForKeyedSubscript:v53];
        [v64 doubleValue];
        uint64_t v69 = [v65 numberWithDouble:v67 + v68];
        uint64_t v70 = [(RTLocationAwarenessMetricManager *)self boutStateMotionTypeNumBouts];
        [v70 setObject:v69 forKeyedSubscript:v53];

LABEL_36:
        goto LABEL_37;
      }
      long long v56 = [(RTLocationAwarenessMetricManager *)self boutStateMotionTypeNumBouts];
      long long v57 = [v56 objectForKeyedSubscript:v53];
      if ([v57 isEqualToNumber:&unk_1F3451590])
      {
        long long v58 = [(RTLocationAwarenessMetricManager *)self stateVariableLastSettledStateChangeTimestamp];
        long long v59 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
        char v60 = [v58 isEqualToDate:v59];

        if (v60) {
          goto LABEL_38;
        }
        uint64_t v61 = NSNumber;
        long long v56 = [(RTLocationAwarenessMetricManager *)self boutStateMotionTypeNumBouts];
        long long v57 = [v56 objectForKeyedSubscript:v53];
        [v57 doubleValue];
        uint64_t v63 = [v61 numberWithDouble:v62 + 1.0];
        v64 = [(RTLocationAwarenessMetricManager *)self boutStateMotionTypeNumBouts];
        [v64 setObject:v63 forKeyedSubscript:v53];
        goto LABEL_36;
      }
LABEL_37:

LABEL_38:
      ++v52;
    }
    while (v51 != v52);
    uint64_t v51 = [obja countByEnumeratingWithState:&v122 objects:v135 count:16];
  }
  while (v51);
LABEL_40:

  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id objb = [(RTLocationAwarenessMetricManager *)self boutBufferMotionDwell];
  uint64_t v71 = [objb countByEnumeratingWithState:&v118 objects:v134 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    id v117 = *(id *)v119;
    do
    {
      uint64_t v73 = 0;
      do
      {
        if (*(id *)v119 != v117) {
          objc_enumerationMutation(objb);
        }
        id v74 = *(void **)(*((void *)&v118 + 1) + 8 * v73);
        id v75 = [NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager boutBufferMotionEdgeType](self, "boutBufferMotionEdgeType")];
        [v74 isEqualToNumber:v75];

        uint64_t v76 = NSNumber;
        v77 = [(RTLocationAwarenessMetricManager *)self boutStateMotionDwell];
        uint64_t v78 = [v77 objectForKeyedSubscript:v74];
        [v78 doubleValue];
        double v80 = v79;
        id v81 = [(RTLocationAwarenessMetricManager *)self boutBufferMotionDwell];
        v82 = [v81 objectForKeyedSubscript:v74];
        [v82 doubleValue];
        id v84 = [v76 numberWithDouble:v80 + v83];
        __int16 v85 = [(RTLocationAwarenessMetricManager *)self boutStateMotionDwell];
        [v85 setObject:v84 forKeyedSubscript:v74];

        ++v73;
      }
      while (v72 != v73);
      uint64_t v72 = [objb countByEnumeratingWithState:&v118 objects:v134 count:16];
    }
    while (v72);
  }

  [(RTLocationAwarenessMetricManager *)self boutBufferDistanceToSensitiveLocation];
  if (v86 >= 0.0)
  {
    [(RTLocationAwarenessMetricManager *)self boutMetricDistanceToSensitiveLocation];
    double v88 = v87;
    [(RTLocationAwarenessMetricManager *)self boutBufferDistanceToSensitiveLocation];
    if (v88 < v89) {
      double v89 = v88;
    }
    [(RTLocationAwarenessMetricManager *)self setBoutMetricDistanceToSensitiveLocation:v89];
  }
  [(RTLocationAwarenessMetricManager *)self boutBufferNumAdditionalFixesPerHourRequired1mDutyCycle];
  double v91 = v90;
  [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:v91 + v92];
  [(RTLocationAwarenessMetricManager *)self boutBufferNumAdditionalFixesPerHourRequired2mDutyCycle];
  double v94 = v93;
  [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:v94 + v95];
  [(RTLocationAwarenessMetricManager *)self boutBufferNumAdditionalFixesPerHourRequired5mDutyCycle];
  double v97 = v96;
  [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:v97 + v98];
  [(RTLocationAwarenessMetricManager *)self boutBufferNumAdditionalFixesPerHourRequired10mDutyCycle];
  double v100 = v99;
  [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:v100 + v101];
  [(RTLocationAwarenessMetricManager *)self boutBufferNumAdditionalFixesPerHourRequired15mDutyCycle];
  double v103 = v102;
  [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:v103 + v104];
  [(RTLocationAwarenessMetricManager *)self boutBufferNumGPSLocationsInBout];
  double v106 = v105;
  [(RTLocationAwarenessMetricManager *)self boutMetricNumGPSLocationsInBout];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumGPSLocationsInBout:v106 + v107];
  [(RTLocationAwarenessMetricManager *)self boutBufferNumOtherLocationsInBout];
  double v109 = v108;
  [(RTLocationAwarenessMetricManager *)self boutMetricNumOtherLocationsInBout];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumOtherLocationsInBout:v109 + v110];
  [(RTLocationAwarenessMetricManager *)self resetBuffer];
}

- (void)updateBoutMetricsForLocation:(id)a3
{
  id v61 = a3;
  uint64_t v4 = [v61 timestamp];
  uint64_t v5 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevLocationTimestamp];
  uint64_t v6 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
  double v7 = [v5 laterDate:v6];
  [v4 timeIntervalSinceDate:v7];
  double v9 = v8;

  double v10 = (v9 + -1.0) / 60.0;
  if (v10 < 0.0) {
    double v10 = 0.0;
  }
  int v11 = (int)v10;
  if ([v61 type] == 4 || objc_msgSend(v61, "type") == 11)
  {
    id v12 = [(RTLocationAwarenessMetricManager *)self boutStateSignalEnvironmentDwell];
    [(RTLocationAwarenessMetricManager *)self boutMetricNumWifiLocationsInBout];
    [(RTLocationAwarenessMetricManager *)self setBoutMetricNumWifiLocationsInBout:v13 + 1.0];
    [(RTLocationAwarenessMetricManager *)self flushBufferToCurrBoutMetrics];
    [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle];
    [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:v14 + (double)v11];
    if (v11 >= 0) {
      int v15 = v11;
    }
    else {
      int v15 = v11 + 1;
    }
    int v16 = v15 >> 1;
    [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle];
    [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:v17 + (double)v16];
    unint64_t v18 = 1717986919 * v11;
    unint64_t v19 = HIDWORD(v18);
    unint64_t v20 = v18 >> 63;
    [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle];
    [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:v21 + (double)(v11 / 5)];
    [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle];
    [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:v22 + (double)((int)v20 + ((int)v19 >> 2))];
    [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle];
    [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:v23 + (double)(v11 / 15)];
    double v24 = [v61 timestamp];
    char v25 = [(RTLocationAwarenessMetricManager *)self stateVariableLastSensitiveLocationCheckTimestamp];
    [v24 timeIntervalSinceDate:v25];
    if (v26 >= 600.0)
    {
    }
    else
    {
      [(RTLocationAwarenessMetricManager *)self boutMetricDistanceToSensitiveLocation];
      double v28 = v27;

      if (v28 >= 0.0) {
        goto LABEL_35;
      }
    }
    [(RTLocationAwarenessMetricManager *)self distanceToNearestSensitiveLocation:v61];
    double v30 = v29;
    [(RTLocationAwarenessMetricManager *)self boutMetricDistanceToSensitiveLocation];
    double v31 = self;
    if (v32 >= 0.0)
    {
      [(RTLocationAwarenessMetricManager *)self boutMetricDistanceToSensitiveLocation];
      if (v33 >= v30) {
        double v33 = v30;
      }
      double v31 = self;
    }
    else
    {
      double v33 = v30;
    }
    [(RTLocationAwarenessMetricManager *)v31 setBoutMetricDistanceToSensitiveLocation:v33];
  }
  else
  {
    id v12 = [(RTLocationAwarenessMetricManager *)self boutBufferSignalEnvironmentDwell];
    if ([v61 type] == 1 || objc_msgSend(v61, "type") == 9)
    {
      [(RTLocationAwarenessMetricManager *)self boutBufferNumGPSLocationsInBout];
      [(RTLocationAwarenessMetricManager *)self setBoutBufferNumGPSLocationsInBout:v34 + 1.0];
    }
    else
    {
      [(RTLocationAwarenessMetricManager *)self boutBufferNumOtherLocationsInBout];
      [(RTLocationAwarenessMetricManager *)self setBoutBufferNumOtherLocationsInBout:v35 + 1.0];
    }
    [(RTLocationAwarenessMetricManager *)self boutBufferNumAdditionalFixesPerHourRequired1mDutyCycle];
    [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired1mDutyCycle:v36 + (double)v11];
    if (v11 >= 0) {
      int v37 = v11;
    }
    else {
      int v37 = v11 + 1;
    }
    int v38 = v37 >> 1;
    [(RTLocationAwarenessMetricManager *)self boutBufferNumAdditionalFixesPerHourRequired2mDutyCycle];
    [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired2mDutyCycle:v39 + (double)v38];
    unint64_t v40 = 1717986919 * v11;
    unint64_t v41 = HIDWORD(v40);
    unint64_t v42 = v40 >> 63;
    [(RTLocationAwarenessMetricManager *)self boutBufferNumAdditionalFixesPerHourRequired5mDutyCycle];
    [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired5mDutyCycle:v43 + (double)(v11 / 5)];
    [(RTLocationAwarenessMetricManager *)self boutBufferNumAdditionalFixesPerHourRequired10mDutyCycle];
    [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired10mDutyCycle:v44 + (double)((int)v42 + ((int)v41 >> 2))];
    [(RTLocationAwarenessMetricManager *)self boutBufferNumAdditionalFixesPerHourRequired15mDutyCycle];
    [(RTLocationAwarenessMetricManager *)self setBoutBufferNumAdditionalFixesPerHourRequired15mDutyCycle:v45 + (double)(v11 / 15)];
    double v46 = [v61 timestamp];
    double v47 = [(RTLocationAwarenessMetricManager *)self stateVariableLastSensitiveLocationCheckTimestamp];
    [v46 timeIntervalSinceDate:v47];
    if (v48 >= 600.0)
    {
    }
    else
    {
      [(RTLocationAwarenessMetricManager *)self boutMetricDistanceToSensitiveLocation];
      double v50 = v49;

      if (v50 >= 0.0) {
        goto LABEL_35;
      }
    }
    [(RTLocationAwarenessMetricManager *)self distanceToNearestSensitiveLocation:v61];
    double v52 = v51;
    [(RTLocationAwarenessMetricManager *)self boutBufferDistanceToSensitiveLocation];
    v53 = self;
    if (v54 >= 0.0)
    {
      [(RTLocationAwarenessMetricManager *)self boutBufferDistanceToSensitiveLocation];
      if (v55 >= v52) {
        double v55 = v52;
      }
      v53 = self;
    }
    else
    {
      double v55 = v52;
    }
    [(RTLocationAwarenessMetricManager *)v53 setBoutBufferDistanceToSensitiveLocation:v55];
  }
LABEL_35:
  uint64_t v56 = [v61 signalEnvironmentType];
  long long v57 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevLocationTimestamp];
  long long v58 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
  long long v59 = [v57 laterDate:v58];
  char v60 = [v61 timestamp];
  [(RTLocationAwarenessMetricManager *)self addDwellForSignalEnvironmentType:v56 startDate:v59 endDate:v60 sigEnvMetrics:v12];
}

- (void)updateBoutMetricsForMotion:(id)a3
{
  id v28 = a3;
  uint64_t v4 = [v28 type];
  if (v4 != [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionActivityType])
  {
    uint64_t v5 = [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionStart];
    uint64_t v6 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    if (v8 >= 0.0)
    {
      uint64_t v20 = [v28 type];
      [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionStart];
    }
    else
    {
      double v9 = [v28 startDate];
      double v10 = [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionStart];
      int v11 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
      id v12 = [v10 laterDate:v11];
      [v9 timeIntervalSinceDate:v12];
      [(RTLocationAwarenessMetricManager *)self setBoutBufferMotionEdgeDwell:"setBoutBufferMotionEdgeDwell:"];

      [(RTLocationAwarenessMetricManager *)self setBoutBufferMotionEdgeType:[(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionActivityType]];
      uint64_t v13 = [v28 type];
      double v14 = [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionStart];
      int v15 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
      int v16 = [v14 laterDate:v15];
      double v17 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
      unint64_t v18 = [(RTLocationAwarenessMetricManager *)self boutStateMotionDwell];
      unint64_t v19 = [(RTLocationAwarenessMetricManager *)self boutStateMotionLongestDwell];
      [(RTLocationAwarenessMetricManager *)self addDwellForMotionType:v13 startDate:v16 endDate:v17 motionDwellMetrics:v18 longestDwell:v19 boutCounts:0];

      uint64_t v20 = [v28 type];
      [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
    double v21 = };
    double v22 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
    double v23 = [v21 laterDate:v22];
    double v24 = [v28 startDate];
    char v25 = [(RTLocationAwarenessMetricManager *)self boutBufferMotionDwell];
    double v26 = [(RTLocationAwarenessMetricManager *)self boutBufferMotionLongestDwell];
    double v27 = [(RTLocationAwarenessMetricManager *)self boutBufferMotionBoutCounts];
    [(RTLocationAwarenessMetricManager *)self addDwellForMotionType:v20 startDate:v23 endDate:v24 motionDwellMetrics:v25 longestDwell:v26 boutCounts:v27];
  }
}

- (void)updateBoutMetricsStateChangeEdgeDwell
{
  uint64_t v3 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutEnd];
  uint64_t v4 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
  [v3 timeIntervalSinceDate:v4];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricDuration:"setBoutMetricDuration:"];

  uint64_t v5 = NSNumber;
  uint64_t v6 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutCounts];
  double v7 = [[NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType")];
  double v8 = [v6 objectForKeyedSubscript:v7];
  [v8 doubleValue];
  double v10 = [v5 numberWithDouble:v9 + 1.0];
  int v11 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutCounts];
  id v12 = [NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType")];
  [v11 setObject:v10 forKeyedSubscript:v12];

  uint64_t v13 = NSNumber;
  double v14 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutDwell];
  int v15 = [[NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType")];
  int v16 = [v14 objectForKeyedSubscript:v15];
  [v16 doubleValue];
  double v18 = v17;
  [(RTLocationAwarenessMetricManager *)self boutMetricDuration];
  uint64_t v20 = [v13 numberWithDouble:v18 + v19];
  double v21 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutDwell];
  double v22 = [[NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType")];
  [v21 setObject:v20 forKeyedSubscript:v22];

  double v23 = NSNumber;
  double v24 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutLongestDwell];
  char v25 = [NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType")];
  double v26 = [v24 objectForKeyedSubscript:v25];
  [v26 doubleValue];
  double v28 = v27;

  [(RTLocationAwarenessMetricManager *)self boutMetricDuration];
  if (v28 >= v29) {
    double v29 = v28;
  }
  double v30 = [v23 numberWithDouble:v29];
  double v31 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutLongestDwell];
  double v32 = [[NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType")];
  [v31 setObject:v30 forKeyedSubscript:v32];

  double v33 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutEnd];
  double v34 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevLocationTimestamp];
  double v35 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
  double v36 = [v34 laterDate:v35];
  [v33 timeIntervalSinceDate:v36];
  double v38 = v37;

  double v39 = v38 / 60.0 + -1.0;
  if (v39 < 0.0) {
    double v39 = 0.0;
  }
  int v40 = (int)v39;
  [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:v41 + (double)v40];
  if (v40 >= 0) {
    int v42 = v40;
  }
  else {
    int v42 = v40 + 1;
  }
  int v43 = v42 >> 1;
  [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:v44 + (double)v43];
  unint64_t v45 = 1717986919 * v40;
  unint64_t v46 = HIDWORD(v45);
  unint64_t v47 = v45 >> 63;
  [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:v48 + (double)(v40 / 5)];
  [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:v49 + (double)((int)v47 + ((int)v46 >> 2))];
  [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle];
  [(RTLocationAwarenessMetricManager *)self setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:v50 + (double)(v40 / 15)];
  double v51 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutEnd];
  double v52 = [(RTLocationAwarenessMetricManager *)self stateVariableLastWifiStateChangeTimestamp];
  LODWORD(v47) = [v51 isEqualToDate:v52];

  if (v47)
  {
    unint64_t v53 = [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionActivityType];
    double v54 = [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionStart];
    double v55 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
    uint64_t v56 = [v54 laterDate:v55];
    long long v57 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutEnd];
    long long v58 = [(RTLocationAwarenessMetricManager *)self boutStateMotionDwell];
    long long v59 = [(RTLocationAwarenessMetricManager *)self boutStateMotionLongestDwell];
    char v60 = [(RTLocationAwarenessMetricManager *)self boutStateMotionTypeNumBouts];
    [(RTLocationAwarenessMetricManager *)self addDwellForMotionType:v53 startDate:v56 endDate:v57 motionDwellMetrics:v58 longestDwell:v59 boutCounts:v60];
  }
  id v61 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutEnd];
  double v62 = [(RTLocationAwarenessMetricManager *)self stateVariableLastSettledStateChangeTimestamp];
  int v63 = [v61 isEqualToDate:v62];

  if (v63)
  {
    v64 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutEnd];
    uint64_t v65 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevLocationTimestamp];
    double v66 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
    double v67 = [v65 laterDate:v66];
    [v64 timeIntervalSinceDate:v67];
    double v69 = v68;

    uint64_t v70 = NSNumber;
    id v77 = [(RTLocationAwarenessMetricManager *)self boutStateSignalEnvironmentDwell];
    uint64_t v71 = [NSNumber numberWithUnsignedInt:-[RTLocationAwarenessMetricManager stateVariableCurrSignalEnvironmentType](self, "stateVariableCurrSignalEnvironmentType")];
    uint64_t v72 = [v77 objectForKeyedSubscript:v71];
    [v72 doubleValue];
    id v74 = [v70 numberWithDouble:v69 + v73];
    id v75 = [(RTLocationAwarenessMetricManager *)self boutStateSignalEnvironmentDwell];
    uint64_t v76 = [[NSNumber numberWithUnsignedInt:-[RTLocationAwarenessMetricManager stateVariableCurrSignalEnvironmentType](self, "stateVariableCurrSignalEnvironmentType")];
    [v75 setObject:v74 forKeyedSubscript:v76];
  }
}

- (void)processLastBout
{
  if ([(RTLocationAwarenessMetricManager *)self boutStateWifi] == 2)
  {
    uint64_t v3 = [(RTLocationAwarenessMetricManager *)self endDate];
    uint64_t v4 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
    [v3 timeIntervalSinceDate:v4];
    double v6 = v5;

    if (v6 > 1200.0)
    {
      double v7 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
      [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutEnd:v7];

      unint64_t v8 = [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionActivityType];
      double v9 = [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionStart];
      double v10 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
      int v11 = [v9 laterDate:v10];
      id v12 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutEnd];
      uint64_t v13 = [(RTLocationAwarenessMetricManager *)self boutStateMotionDwell];
      double v14 = [(RTLocationAwarenessMetricManager *)self boutStateMotionLongestDwell];
      [(RTLocationAwarenessMetricManager *)self addDwellForMotionType:v8 startDate:v11 endDate:v12 motionDwellMetrics:v13 longestDwell:v14 boutCounts:0];

      [(RTLocationAwarenessMetricManager *)self submitBoutMetricsToCoreAnalytics];
      [(RTLocationAwarenessMetricManager *)self setBoutMetricType:2];
    }
  }
  [(RTLocationAwarenessMetricManager *)self flushBufferToCurrBoutMetrics];
  if ([(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionActivityType] == 1)
  {
    int v15 = [(RTLocationAwarenessMetricManager *)self stateVariableLastSettledStateChangeTimestamp];
    [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutStart:v15];
    uint64_t v16 = 1;
LABEL_10:

    goto LABEL_11;
  }
  double v17 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
  double v18 = [(RTLocationAwarenessMetricManager *)self stateVariableLastSettledStateChangeTimestamp];
  double v19 = [v17 laterDate:v18];
  [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutStart:v19];

  int v15 = [(RTLocationAwarenessMetricManager *)self endDate];
  uint64_t v20 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
  [v15 timeIntervalSinceDate:v20];
  if (v21 <= 1200.0)
  {
LABEL_9:

    uint64_t v16 = 3;
    goto LABEL_10;
  }
  double v22 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
  double v23 = [(RTLocationAwarenessMetricManager *)self stateVariableLastSettledStateChangeTimestamp];
  [v22 timeIntervalSinceDate:v23];
  if (v24 > 0.0)
  {

    goto LABEL_9;
  }
  unint64_t v39 = [(RTLocationAwarenessMetricManager *)self boutStateWifi];

  if (v39 == 2)
  {
    int v40 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
    [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutEnd:v40];

    [(RTLocationAwarenessMetricManager *)self submitBoutMetricsToCoreAnalytics];
    int v15 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
    [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutStart:v15];
    uint64_t v16 = 2;
    goto LABEL_10;
  }
  uint64_t v16 = 3;
LABEL_11:
  [(RTLocationAwarenessMetricManager *)self setBoutMetricType:v16];
  char v25 = [(RTLocationAwarenessMetricManager *)self endDate];
  [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutEnd:v25];

  uint64_t v26 = [(RTLocationAwarenessMetricManager *)self stateVariableCurrSignalEnvironmentType];
  double v27 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevLocationTimestamp];
  double v28 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
  double v29 = [v27 laterDate:v28];
  double v30 = [(RTLocationAwarenessMetricManager *)self endDate];
  double v31 = [(RTLocationAwarenessMetricManager *)self boutStateSignalEnvironmentDwell];
  [(RTLocationAwarenessMetricManager *)self addDwellForSignalEnvironmentType:v26 startDate:v29 endDate:v30 sigEnvMetrics:v31];

  unint64_t v32 = [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionActivityType];
  double v33 = [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionStart];
  double v34 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
  double v35 = [v33 laterDate:v34];
  double v36 = [(RTLocationAwarenessMetricManager *)self endDate];
  double v37 = [(RTLocationAwarenessMetricManager *)self boutStateMotionDwell];
  double v38 = [(RTLocationAwarenessMetricManager *)self boutStateMotionLongestDwell];
  [(RTLocationAwarenessMetricManager *)self addDwellForMotionType:v32 startDate:v35 endDate:v36 motionDwellMetrics:v37 longestDwell:v38 boutCounts:0];

  [(RTLocationAwarenessMetricManager *)self submitBoutMetricsToCoreAnalytics];
}

- (void)updateDailyMetrics:(id)a3
{
  id v14 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v14;
    uint64_t v5 = [v4 signalEnvironmentType];
    id v6 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevLocationTimestamp];
    double v7 = [v4 timestamp];

    unint64_t v8 = [(RTLocationAwarenessMetricManager *)self dailyStateSignalEnvironmentDwell];
    [(RTLocationAwarenessMetricManager *)self addDwellForSignalEnvironmentType:v5 startDate:v6 endDate:v7 sigEnvMetrics:v8];
LABEL_6:

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  id v6 = v14;
  uint64_t v9 = [v6 type];
  if (v9 != [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionActivityType])
  {
    uint64_t v10 = [v6 type];
    double v7 = [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionStart];
    unint64_t v8 = [(RTLocationAwarenessMetricManager *)self startDate];
    int v11 = [v7 laterDate:v8];
    id v12 = [v6 startDate];
    uint64_t v13 = [(RTLocationAwarenessMetricManager *)self dailyStateMotionDwell];
    [(RTLocationAwarenessMetricManager *)self addDwellForMotionType:v10 startDate:v11 endDate:v12 motionDwellMetrics:v13 longestDwell:0 boutCounts:0];

    goto LABEL_6;
  }
LABEL_7:

LABEL_8:

  MEMORY[0x1F41817F8]();
}

- (void)processLastDailyMetrics
{
  unint64_t v3 = [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionActivityType];
  id v4 = [(RTLocationAwarenessMetricManager *)self endDate];
  uint64_t v5 = [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionStart];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  unint64_t v8 = NSNumber;
  uint64_t v9 = [(RTLocationAwarenessMetricManager *)self dailyStateMotionDwell];
  uint64_t v10 = [NSNumber numberWithUnsignedInteger:v3];
  int v11 = [v9 objectForKeyedSubscript:v10];
  [v11 doubleValue];
  uint64_t v13 = [v8 numberWithDouble:v7 + v12];
  id v14 = [(RTLocationAwarenessMetricManager *)self dailyStateMotionDwell];
  int v15 = [NSNumber numberWithUnsignedInteger:v3];
  [v14 setObject:v13 forKeyedSubscript:v15];

  uint64_t v16 = [(RTLocationAwarenessMetricManager *)self endDate];
  double v17 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevLocationTimestamp];
  [v16 timeIntervalSinceDate:v17];
  double v19 = v18;

  uint64_t v20 = NSNumber;
  id v27 = [(RTLocationAwarenessMetricManager *)self dailyStateSignalEnvironmentDwell];
  double v21 = [[NSNumber numberWithUnsignedInt:-[RTLocationAwarenessMetricManager stateVariableCurrSignalEnvironmentType](self, "stateVariableCurrSignalEnvironmentType")];
  double v22 = [v27 objectForKeyedSubscript:v21];
  [v22 doubleValue];
  double v24 = [v20 numberWithDouble:v19 + v23];
  char v25 = [(RTLocationAwarenessMetricManager *)self dailyStateSignalEnvironmentDwell];
  uint64_t v26 = [[NSNumber numberWithUnsignedInt:-[RTLocationAwarenessMetricManager stateVariableCurrSignalEnvironmentType](self, "stateVariableCurrSignalEnvironmentType")];
  [v25 setObject:v24 forKeyedSubscript:v26];
}

- (void)processMetrics
{
  unint64_t v3 = [(RTLocationAwarenessMetricManager *)self startDate];
  id v4 = [(RTLocationAwarenessMetricManager *)self endDate];
  uint64_t v5 = [v3 earlierDate:v4];
  int v6 = [v5 isEqualToDate:v3];

  if (v6)
  {
    double v7 = 0;
    do
    {
      unint64_t v8 = v7;
      uint64_t v9 = v3;
      uint64_t v10 = (void *)MEMORY[0x1E016D870]();
      double v7 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v3 sinceDate:3600.0];

      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v3 endDate:v7];
      double v12 = [(RTLocationAwarenessMetricManager *)self locationsAndMotionsForDateInterval:v11];
      uint64_t v13 = [(RTLocationAwarenessMetricManager *)self sortLocationsAndMotions:v12];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __50__RTLocationAwarenessMetricManager_processMetrics__block_invoke;
      v16[3] = &unk_1E6B90B78;
      v16[4] = self;
      [v13 enumerateObjectsUsingBlock:v16];
      unint64_t v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeInterval:v7 sinceDate:1.0];

      id v14 = [(RTLocationAwarenessMetricManager *)self endDate];
      int v15 = [v3 earlierDate:v14];
      LOBYTE(v11) = [v15 isEqualToDate:v3];
    }
    while ((v11 & 1) != 0);
  }
}

void __50__RTLocationAwarenessMetricManager_processMetrics__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 updateDailyMetrics:v4];
  [*(id *)(a1 + 32) monitorStateChange:v4];
}

- (void)monitorStateChange:(id)a3
{
  id v37 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v37;
    uint64_t v5 = [v4 timestamp];
    int v6 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;

    if ([(RTLocationAwarenessMetricManager *)self boutStateMotion] == 1
      || ![(RTLocationAwarenessMetricManager *)self boutStateWifi]
      && ([(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart],
          double v21 = objc_claimAutoreleasedReturnValue(),
          [(RTLocationAwarenessMetricManager *)self startDate],
          double v22 = objc_claimAutoreleasedReturnValue(),
          int v23 = [v21 isEqualToDate:v22],
          v22,
          v21,
          v23))
    {
      if (v8 <= 1200.0) {
        uint64_t v9 = 2;
      }
      else {
        uint64_t v9 = 1;
      }
      [(RTLocationAwarenessMetricManager *)self setBoutStateWifi:v9];
      goto LABEL_31;
    }
    if (v8 <= 1200.0 && [(RTLocationAwarenessMetricManager *)self boutStateWifi] == 1)
    {
      uint64_t v24 = 2;
      uint64_t v25 = 2;
    }
    else
    {
      if (v8 <= 1200.0 || [(RTLocationAwarenessMetricManager *)self boutStateWifi] != 2) {
        goto LABEL_31;
      }
      uint64_t v25 = 1;
      uint64_t v24 = 3;
    }
    [(RTLocationAwarenessMetricManager *)self setBoutMetricType:v24];
    uint64_t v26 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
    [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutEnd:v26];

    [(RTLocationAwarenessMetricManager *)self setBoutStateWifi:v25];
    id v27 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
    [(RTLocationAwarenessMetricManager *)self setStateVariableLastWifiStateChangeTimestamp:v27];

    [(RTLocationAwarenessMetricManager *)self submitBoutMetricsToCoreAnalytics];
    double v28 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
    double v29 = [(RTLocationAwarenessMetricManager *)self stateVariableLastSettledStateChangeTimestamp];
    double v30 = [v28 laterDate:v29];
    [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutStart:v30];

LABEL_31:
    [(RTLocationAwarenessMetricManager *)self updateBoutMetricsForLocation:v4];
    goto LABEL_32;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_33;
  }
  id v10 = v37;
  uint64_t v11 = [v10 startDate];
  double v12 = [(RTLocationAwarenessMetricManager *)self startDate];
  [v11 timeIntervalSinceDate:v12];
  double v14 = v13;

  if (v14 <= 0.0)
  {
    if ([v10 type] == 1) {
      uint64_t v15 = 1;
    }
    else {
      uint64_t v15 = 2;
    }
    [(RTLocationAwarenessMetricManager *)self setBoutStateMotion:v15];
    -[RTLocationAwarenessMetricManager setBoutBufferMotionEdgeType:](self, "setBoutBufferMotionEdgeType:", [v10 type]);
  }
  if ([(RTLocationAwarenessMetricManager *)self boutStateMotion] == 1
    && [v10 type] != 1
    && [v10 type] != 6)
  {
    double v31 = [v10 startDate];
    [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutEnd:v31];

    uint64_t v32 = 2;
    uint64_t v33 = 1;
LABEL_43:
    [(RTLocationAwarenessMetricManager *)self setBoutMetricType:v33];
    [(RTLocationAwarenessMetricManager *)self setBoutStateMotion:v32];
    double v35 = [v10 startDate];
    [(RTLocationAwarenessMetricManager *)self setStateVariableLastSettledStateChangeTimestamp:v35];

    [(RTLocationAwarenessMetricManager *)self updateBoutMetricsForMotion:v10];
    [(RTLocationAwarenessMetricManager *)self flushBufferToCurrBoutMetrics];
    [(RTLocationAwarenessMetricManager *)self submitBoutMetricsToCoreAnalytics];
    double v36 = [v10 startDate];
    [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutStart:v36];

    goto LABEL_32;
  }
  if ([(RTLocationAwarenessMetricManager *)self boutStateMotion] == 2
    && [v10 type] == 1)
  {
    uint64_t v16 = [v10 startDate];
    double v17 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
    [v16 timeIntervalSinceDate:v17];
    if (v18 <= 1200.0)
    {
    }
    else
    {
      unint64_t v19 = [(RTLocationAwarenessMetricManager *)self boutMetricType];

      if (v19 != 3)
      {
LABEL_39:
        double v34 = [v10 startDate];
        [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutEnd:v34];

        if ([(RTLocationAwarenessMetricManager *)self boutStateWifi] == 2) {
          uint64_t v33 = 3;
        }
        else {
          uint64_t v33 = 2;
        }
        uint64_t v32 = 1;
        goto LABEL_43;
      }
      uint64_t v20 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
      [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutEnd:v20];

      [(RTLocationAwarenessMetricManager *)self submitBoutMetricsToCoreAnalytics];
      uint64_t v16 = [(RTLocationAwarenessMetricManager *)self stateVariablePrevWifiLocationTimestamp];
      [(RTLocationAwarenessMetricManager *)self setBoutStateCurrBoutStart:v16];
    }

    goto LABEL_39;
  }
  [(RTLocationAwarenessMetricManager *)self updateBoutMetricsForMotion:v10];
LABEL_32:

LABEL_33:
  [(RTLocationAwarenessMetricManager *)self updateStateVariables:v37];
}

- (void)updateStateVariables:(id)a3
{
  id v22 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v22;
    if ([v4 type] == 4 || objc_msgSend(v4, "type") == 11)
    {
      uint64_t v5 = [v4 timestamp];
      [(RTLocationAwarenessMetricManager *)self setStateVariablePrevWifiLocationTimestamp:v5];
    }
    int v6 = [v4 timestamp];
    double v7 = [(RTLocationAwarenessMetricManager *)self stateVariableLastSensitiveLocationCheckTimestamp];
    [v6 timeIntervalSinceDate:v7];
    if (v8 >= 600.0)
    {
    }
    else
    {
      [(RTLocationAwarenessMetricManager *)self boutMetricDistanceToSensitiveLocation];
      double v10 = v9;

      if (v10 >= 0.0) {
        goto LABEL_14;
      }
    }
    [(RTLocationAwarenessMetricManager *)self boutMetricDistanceToSensitiveLocation];
    -[RTLocationAwarenessMetricManager setStateVariableMostRecentDistanceToSensitiveLocation:](self, "setStateVariableMostRecentDistanceToSensitiveLocation:");
    uint64_t v20 = [v4 timestamp];
    [(RTLocationAwarenessMetricManager *)self setStateVariableLastSensitiveLocationCheckTimestamp:v20];

LABEL_14:
    double v21 = [v4 timestamp];
    [(RTLocationAwarenessMetricManager *)self setStateVariablePrevLocationTimestamp:v21];

    -[RTLocationAwarenessMetricManager setStateVariableCurrSignalEnvironmentType:](self, "setStateVariableCurrSignalEnvironmentType:", [v4 signalEnvironmentType]);
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  id v11 = v22;
  uint64_t v12 = [v11 type];
  if (v12 != [(RTLocationAwarenessMetricManager *)self stateVariableCurrMotionActivityType])goto LABEL_11; {
  double v13 = [v11 startDate];
  }
  double v14 = [(RTLocationAwarenessMetricManager *)self startDate];
  [v13 timeIntervalSinceDate:v14];
  double v16 = v15;

  if (v16 <= 0.0)
  {
LABEL_11:
    -[RTLocationAwarenessMetricManager setStateVariableCurrMotionActivityType:](self, "setStateVariableCurrMotionActivityType:", [v11 type]);
    double v17 = [v11 startDate];
    double v18 = [(RTLocationAwarenessMetricManager *)self startDate];
    unint64_t v19 = [v17 laterDate:v18];
    [(RTLocationAwarenessMetricManager *)self setStateVariableCurrMotionStart:v19];
  }
LABEL_15:

LABEL_16:
}

- (id)collectBoutMetrics
{
  unint64_t v3 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
  id v4 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutEnd];
  uint64_t v5 = [v3 laterDate:v4];
  int v6 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutEnd];
  char v7 = [v5 isEqualToDate:v6];

  if (v7)
  {
    v176 = objc_opt_new();
    uint64_t v186 = +[RTMetric binsFromStart:&unk_1F3451590 toEnd:&unk_1F3453968 gap:&unk_1F3453978];
    v171 = objc_opt_new();
    v175 = +[RTMetric binsFromStart:&unk_1F3451590 toEnd:&unk_1F3451710 gap:&unk_1F3451650];
    v174 = +[RTMetric binsFromStart:&unk_1F34517A0 toEnd:&unk_1F3451728 gap:&unk_1F34516C8];
    [v171 addObjectsFromArray:v175];
    [v171 addObjectsFromArray:v174];
    v170 = objc_opt_new();
    v173 = +[RTMetric binsFromStart:&unk_1F3451590 toEnd:&unk_1F3451728 gap:&unk_1F34516C8];
    [v170 addObjectsFromArray:v173];
    [v170 addObjectsFromArray:&unk_1F3453108];
    v177 = +[RTMetric binsFromStart:&unk_1F3453988 toEnd:&unk_1F3453998 gap:&unk_1F34539A8];
    v172 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    double v8 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
    v185 = [v172 components:32 fromDate:v8];

    double v9 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutEnd];
    double v10 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
    [v9 timeIntervalSinceDate:v10];
    double v12 = v11;

    double v13 = [(RTLocationAwarenessMetricManager *)self boutStateMotionDwell];
    double v14 = [v13 allKeys];
    v188[0] = MEMORY[0x1E4F143A8];
    v188[1] = 3221225472;
    v188[2] = __54__RTLocationAwarenessMetricManager_collectBoutMetrics__block_invoke;
    v188[3] = &unk_1E6B98C90;
    v188[4] = self;
    double v15 = [v14 sortedArrayUsingComparator:v188];

    double v16 = [(RTLocationAwarenessMetricManager *)self boutStateSignalEnvironmentDwell];
    double v17 = [v16 allKeys];
    v187[0] = MEMORY[0x1E4F143A8];
    v187[1] = 3221225472;
    v187[2] = __54__RTLocationAwarenessMetricManager_collectBoutMetrics__block_invoke_2;
    v187[3] = &unk_1E6B98C90;
    v187[4] = self;
    v169 = [v17 sortedArrayUsingComparator:v187];

    double v18 = v15;
    unint64_t v19 = [v15 objectAtIndexedSubscript:0];
    uint64_t v20 = [v19 intValue];

    v178 = v15;
    double v21 = [v15 objectAtIndexedSubscript:1];
    uint64_t v22 = [v21 intValue];

    int v23 = [v18 objectAtIndexedSubscript:2];
    uint64_t v24 = [v23 intValue];

    uint64_t v25 = [(RTLocationAwarenessMetricManager *)self boutStateMotionTypeNumBouts];
    uint64_t v26 = [NSNumber numberWithInt:v20];
    id v27 = [v25 objectForKeyedSubscript:v26];
    unsigned int v163 = [v27 intValue];

    double v28 = [(RTLocationAwarenessMetricManager *)self boutStateMotionTypeNumBouts];
    double v29 = [NSNumber numberWithInt:v22];
    double v30 = [v28 objectForKeyedSubscript:v29];
    unsigned int v165 = [v30 intValue];

    double v31 = [(RTLocationAwarenessMetricManager *)self boutStateMotionTypeNumBouts];
    uint64_t v32 = v24;
    uint64_t v33 = [NSNumber numberWithInt:v24];
    double v34 = [v31 objectForKeyedSubscript:v33];
    unsigned int v167 = [v34 intValue];

    double v35 = NSNumber;
    double v36 = [(RTLocationAwarenessMetricManager *)self boutStateMotionDwell];
    unsigned int v160 = v20;
    id v37 = [NSNumber numberWithInt:v20];
    double v38 = [v36 objectForKeyedSubscript:v37];
    [v38 doubleValue];
    v184 = [v35 numberWithDouble:v39 / v12];

    int v40 = NSNumber;
    double v41 = [(RTLocationAwarenessMetricManager *)self boutStateMotionDwell];
    int v42 = [NSNumber numberWithInt:v22];
    int v43 = [v41 objectForKeyedSubscript:v42];
    [v43 doubleValue];
    v183 = [v40 numberWithDouble:v44 / v12];

    unint64_t v45 = NSNumber;
    unint64_t v46 = [(RTLocationAwarenessMetricManager *)self boutStateMotionDwell];
    unint64_t v47 = [NSNumber numberWithInt:v32];
    double v48 = [v46 objectForKeyedSubscript:v47];
    [v48 doubleValue];
    v182 = [v45 numberWithDouble:v49 / v12];

    double v50 = NSNumber;
    double v51 = [(RTLocationAwarenessMetricManager *)self boutStateMotionLongestDwell];
    double v52 = [NSNumber numberWithInt:v20];
    unint64_t v53 = [v51 objectForKeyedSubscript:v52];
    [v53 doubleValue];
    v181 = [v50 numberWithDouble:v54 / v12];

    double v55 = NSNumber;
    uint64_t v56 = [(RTLocationAwarenessMetricManager *)self boutStateMotionLongestDwell];
    long long v57 = [NSNumber numberWithInt:v22];
    long long v58 = [v56 objectForKeyedSubscript:v57];
    [v58 doubleValue];
    v180 = [v55 numberWithDouble:v59 / v12];

    char v60 = NSNumber;
    id v61 = [(RTLocationAwarenessMetricManager *)self boutStateMotionLongestDwell];
    double v62 = [NSNumber numberWithInt:v32];
    int v63 = [v61 objectForKeyedSubscript:v62];
    [v63 doubleValue];
    v179 = [v60 numberWithDouble:v64 / v12];

    uint64_t v65 = [v169 objectAtIndexedSubscript:0];
    uint64_t v66 = [v65 intValue];

    double v67 = NSNumber;
    double v68 = [(RTLocationAwarenessMetricManager *)self boutStateSignalEnvironmentDwell];
    double v69 = [NSNumber numberWithUnsignedInt:v66];
    uint64_t v70 = [v68 objectForKeyedSubscript:v69];
    [v70 doubleValue];
    if (v71 <= 0.0) {
      uint64_t v72 = 0;
    }
    else {
      uint64_t v72 = v66;
    }
    double v73 = [v67 numberWithUnsignedInt:v72];
    [v176 setObject:v73 forKeyedSubscript:@"_primarySignalEnvironment"];

    id v74 = NSNumber;
    [(RTLocationAwarenessMetricManager *)self boutMetricDistanceToSensitiveLocation];
    id v75 = [v74 numberWithDouble:];
    uint64_t v76 = +[RTMetric binForNumber:v75 bins:&unk_1F3453120];
    [v176 setObject:v76 forKeyedSubscript:@"_boutMetricNearSensitiveLocation"];

    id v77 = NSNumber;
    [(RTLocationAwarenessMetricManager *)self boutMetricDuration];
    uint64_t v78 = [v77 numberWithDouble:];
    double v79 = +[RTMetric binForNumber:v78 bins:v186];
    [v176 setObject:v79 forKeyedSubscript:@"_duration"];

    double v80 = [NSNumber numberWithInteger:[v185 hour]];
    [v176 setObject:v80 forKeyedSubscript:@"_startDate"];

    id v81 = [NSNumber numberWithUnsignedInteger:-[RTLocationAwarenessMetricManager boutMetricType](self, "boutMetricType")];
    [v176 setObject:v81 forKeyedSubscript:@"_wifiMobilityType"];

    v82 = [NSNumber numberWithUnsignedInt:v66];
    [v176 setObject:v82 forKeyedSubscript:@"_primarySignalEnvironment"];

    double v83 = [NSNumber numberWithInt:v160];
    [v176 setObject:v83 forKeyedSubscript:@"_primaryMotion"];

    id v84 = +[RTMetric binForNumber:v184 bins:v177];
    [v176 setObject:v84 forKeyedSubscript:@"_primaryMotionDurationBucketed"];

    __int16 v85 = [NSNumber numberWithInt:v163];
    double v86 = +[RTMetric binForNumber:v85 bins:&unk_1F34530F0];
    [v176 setObject:v86 forKeyedSubscript:@"_numBoutsPrimaryMotionBucketed"];

    double v87 = +[RTMetric binForNumber:v181 bins:v177];
    [v176 setObject:v87 forKeyedSubscript:@"_longestBoutPrimaryMotionBucketed"];

    double v88 = NSNumber;
    double v89 = [(RTLocationAwarenessMetricManager *)self boutStateMotionDwell];
    double v90 = [NSNumber numberWithInt:v22];
    double v91 = [v89 objectForKeyedSubscript:v90];
    [v91 doubleValue];
    if (v92 <= 0.0) {
      uint64_t v93 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v93 = v22;
    }
    double v94 = [v88 numberWithInt:v93];
    [v176 setObject:v94 forKeyedSubscript:@"_secondaryMotion"];

    double v95 = +[RTMetric binForNumber:v183 bins:v177];
    [v176 setObject:v95 forKeyedSubscript:@"_secondaryMotionDurationBucketed"];

    double v96 = [NSNumber numberWithInt:v165];
    double v97 = +[RTMetric binForNumber:v96 bins:&unk_1F34530F0];
    [v176 setObject:v97 forKeyedSubscript:@"_numBoutsSecondaryMotionBucketed"];

    double v98 = +[RTMetric binForNumber:v180 bins:v177];
    [v176 setObject:v98 forKeyedSubscript:@"_longestBoutSecondaryMotionBucketed"];

    double v99 = NSNumber;
    double v100 = [(RTLocationAwarenessMetricManager *)self boutStateMotionDwell];
    double v101 = [NSNumber numberWithInt:v32];
    double v102 = [v100 objectForKeyedSubscript:v101];
    [v102 doubleValue];
    if (v103 <= 0.0) {
      uint64_t v104 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v104 = v32;
    }
    double v105 = [v99 numberWithInt:v104];
    [v176 setObject:v105 forKeyedSubscript:@"_tertiaryMotion"];

    double v106 = +[RTMetric binForNumber:v182 bins:v177];
    [v176 setObject:v106 forKeyedSubscript:@"_tertiaryMotionDurationBucketed"];

    double v107 = [NSNumber numberWithInt:v167];
    double v108 = +[RTMetric binForNumber:v107 bins:&unk_1F34530F0];
    [v176 setObject:v108 forKeyedSubscript:@"_numBoutsTertiaryMotionBucketed"];

    double v109 = +[RTMetric binForNumber:v179 bins:v177];
    [v176 setObject:v109 forKeyedSubscript:@"_longestBoutTertiaryMotionBucketed"];

    double v110 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutEnd];
    v111 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
    [v110 timeIntervalSinceDate:v111];
    double v113 = v112 / 3600.0;

    v168 = [(RTLocationAwarenessMetricManager *)self boutStateMotionTypeNumBouts];
    v166 = [v178 objectAtIndexedSubscript:3];
    v164 = [v168 objectForKeyedSubscript:v166];
    LODWORD(v111) = [v164 intValue];
    v162 = [(RTLocationAwarenessMetricManager *)self boutStateMotionTypeNumBouts];
    v161 = [v178 objectAtIndexedSubscript:4];
    id v114 = [v162 objectForKeyedSubscript:v161];
    int v115 = [v114 intValue] + v111;
    id v116 = [(RTLocationAwarenessMetricManager *)self boutStateMotionTypeNumBouts];
    id v117 = [v178 objectAtIndexedSubscript:5];
    long long v118 = [v116 objectForKeyedSubscript:v117];
    LODWORD(v110) = [v118 intValue];
    long long v119 = [(RTLocationAwarenessMetricManager *)self boutStateMotionTypeNumBouts];
    long long v120 = [v178 objectAtIndexedSubscript:6];
    long long v121 = [v119 objectForKeyedSubscript:v120];
    uint64_t v122 = v115 + v110 + [v121 intValue];

    long long v123 = v176;
    long long v124 = [NSNumber numberWithInt:v122];
    long long v125 = +[RTMetric binForNumber:v124 bins:&unk_1F34530F0];
    [v176 setObject:v125 forKeyedSubscript:@"_numBoutsOtherMotionBucketed"];

    long long v126 = NSNumber;
    [(RTLocationAwarenessMetricManager *)self boutMetricNumWifiLocationsInBout];
    long long v128 = [v126 numberWithDouble:v127 / v113];
    long long v129 = +[RTMetric binForNumber:v128 bins:v170];
    [v176 setObject:v129 forKeyedSubscript:@"_numWifiLocations"];

    long long v130 = NSNumber;
    [(RTLocationAwarenessMetricManager *)self boutMetricNumGPSLocationsInBout];
    long long v132 = [v130 numberWithDouble:v131 / v113];
    long long v133 = +[RTMetric binForNumber:v132 bins:v170];
    [v176 setObject:v133 forKeyedSubscript:@"_numGPSLocations"];

    v134 = NSNumber;
    [(RTLocationAwarenessMetricManager *)self boutMetricNumOtherLocationsInBout];
    v136 = [v134 numberWithDouble:v135 / v113];
    v137 = +[RTMetric binForNumber:v136 bins:v170];
    [v176 setObject:v137 forKeyedSubscript:@"_numOtherLocations"];

    uint64_t v138 = NSNumber;
    [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle];
    v140 = [v138 numberWithDouble:v139 / v113];
    v141 = +[RTMetric binForNumber:v140 bins:v171];
    [v176 setObject:v141 forKeyedSubscript:@"_numAdditionalFixesRequired_1mCycle"];

    v142 = NSNumber;
    [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle];
    v144 = [v142 numberWithDouble:v143 / v113];
    v145 = +[RTMetric binForNumber:v144 bins:v171];
    [v176 setObject:v145 forKeyedSubscript:@"_numAdditionalFixesRequired_2mCycle"];

    v146 = NSNumber;
    [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle];
    v148 = [v146 numberWithDouble:v147 / v113];
    v149 = +[RTMetric binForNumber:v148 bins:v171];
    [v176 setObject:v149 forKeyedSubscript:@"_numAdditionalFixesRequired_5mCycle"];

    v150 = NSNumber;
    [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle];
    v152 = [v150 numberWithDouble:v151 / v113];
    v153 = +[RTMetric binForNumber:v152 bins:v171];
    [v176 setObject:v153 forKeyedSubscript:@"_numAdditionalFixesRequired_10mCycle"];

    v154 = NSNumber;
    [(RTLocationAwarenessMetricManager *)self boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle];
    v156 = [v154 numberWithDouble:v155 / v113];
    v157 = +[RTMetric binForNumber:v156 bins:v171];
    [v176 setObject:v157 forKeyedSubscript:@"_numAdditionalFixesRequired_15mCycle"];

    v158 = v186;
  }
  else
  {
    v158 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v158, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [[self.boutStateCurrBoutStart laterDate:self.boutStateCurrBoutEnd] isEqualToDate:self.boutStateCurrBoutEnd]", buf, 2u);
    }
    long long v123 = 0;
  }

  return v123;
}

uint64_t __54__RTLocationAwarenessMetricManager_collectBoutMetrics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  double v8 = [v5 boutStateMotionDwell];
  double v9 = [v8 objectForKey:v7];

  double v10 = [*(id *)(a1 + 32) boutStateMotionDwell];
  double v11 = [v10 objectForKey:v6];

  uint64_t v12 = -[v9 compare:v11];
  return v12;
}

uint64_t __54__RTLocationAwarenessMetricManager_collectBoutMetrics__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  double v8 = [v5 boutStateSignalEnvironmentDwell];
  double v9 = [v8 objectForKey:v7];

  double v10 = [*(id *)(a1 + 32) boutStateSignalEnvironmentDwell];
  double v11 = [v10 objectForKey:v6];

  uint64_t v12 = -[v9 compare:v11];
  return v12;
}

- (id)collectDailyMetrics
{
  unint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = +[RTMetric binsFromStart:&unk_1F3451590 toEnd:&unk_1F34539B8 gap:&unk_1F34539C8];
  uint64_t v5 = [v3 arrayWithArray:v4];

  id v6 = +[RTMetric binsFromStart:&unk_1F34539D8 toEnd:&unk_1F34539E8 gap:&unk_1F34539F8];
  [v5 addObjectsFromArray:v6];

  id v7 = +[RTMetric binsFromStart:&unk_1F3453A08 toEnd:&unk_1F3453968 gap:&unk_1F3453A18];
  [v5 addObjectsFromArray:v7];

  double v8 = objc_opt_new();
  double v9 = NSNumber;
  double v10 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutCounts];
  double v11 = [v10 objectForKeyedSubscript:&unk_1F34515C0];
  uint64_t v12 = [v9 numberWithInteger:[v11 integerValue]];
  double v13 = +[RTMetric binForNumber:v12 bins:&unk_1F3453150];
  [v8 setObject:v13 forKeyedSubscript:@"_numBoutsInPastDayLowMobility"];

  double v14 = NSNumber;
  double v15 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutDwell];
  double v16 = [v15 objectForKeyedSubscript:&unk_1F34515C0];
  double v17 = [v14 numberWithInteger:[v16 integerValue]];
  double v18 = +[RTMetric binForNumber:v17 bins:v5];
  [v8 setObject:v18 forKeyedSubscript:@"_totalDailyDwellLowMobility"];

  unint64_t v19 = NSNumber;
  uint64_t v20 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutLongestDwell];
  double v21 = [v20 objectForKeyedSubscript:&unk_1F34515C0];
  uint64_t v22 = [v19 numberWithInteger:[v21 integerValue]];
  int v23 = +[RTMetric binForNumber:v22 bins:v5];
  [v8 setObject:v23 forKeyedSubscript:@"_durationOfLongestLowMobilityBout"];

  uint64_t v24 = NSNumber;
  uint64_t v25 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutCounts];
  uint64_t v26 = [v25 objectForKeyedSubscript:&unk_1F34515D8];
  id v27 = [v24 numberWithInteger:[v26 integerValue]];
  double v28 = +[RTMetric binForNumber:v27 bins:&unk_1F3453138];
  [v8 setObject:v28 forKeyedSubscript:@"_numBoutsInPastDayMobileNoWifi"];

  double v29 = NSNumber;
  double v30 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutDwell];
  double v31 = [v30 objectForKeyedSubscript:&unk_1F34515D8];
  uint64_t v32 = [v29 numberWithInteger:[v31 integerValue]];
  uint64_t v33 = +[RTMetric binForNumber:v32 bins:v5];
  [v8 setObject:v33 forKeyedSubscript:@"_totalDailyDwellMobileNoWifi"];

  double v34 = NSNumber;
  double v35 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutLongestDwell];
  double v36 = [v35 objectForKeyedSubscript:&unk_1F34515D8];
  id v37 = [v34 numberWithInteger:[v36 integerValue]];
  double v38 = +[RTMetric binForNumber:v37 bins:v5];
  [v8 setObject:v38 forKeyedSubscript:@"_durationOfLongestMobileNoWifiBout"];

  double v39 = NSNumber;
  int v40 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutCounts];
  double v41 = [v40 objectForKeyedSubscript:&unk_1F34515F0];
  int v42 = [v39 numberWithInteger:[v41 integerValue]];
  int v43 = +[RTMetric binForNumber:v42 bins:&unk_1F3453138];
  [v8 setObject:v43 forKeyedSubscript:@"_numBoutsInPastDayMobileWithWifi"];

  double v44 = NSNumber;
  unint64_t v45 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutDwell];
  unint64_t v46 = [v45 objectForKeyedSubscript:&unk_1F34515F0];
  unint64_t v47 = [v44 numberWithInteger:[v46 integerValue]];
  double v48 = +[RTMetric binForNumber:v47 bins:v5];
  [v8 setObject:v48 forKeyedSubscript:@"_totalDailyDwellMobileWithWifi"];

  double v49 = NSNumber;
  double v50 = [(RTLocationAwarenessMetricManager *)self dailyStateBoutLongestDwell];
  double v51 = [v50 objectForKeyedSubscript:&unk_1F34515F0];
  double v52 = [v49 numberWithInteger:[v51 integerValue]];
  unint64_t v53 = +[RTMetric binForNumber:v52 bins:v5];
  [v8 setObject:v53 forKeyedSubscript:@"_durationOfLongestMobileWithWifiBout"];

  double v54 = NSNumber;
  double v55 = [(RTLocationAwarenessMetricManager *)self dailyStateSignalEnvironmentDwell];
  uint64_t v56 = [v55 objectForKeyedSubscript:&unk_1F34516B0];
  [v56 doubleValue];
  long long v57 = [v54 numberWithDouble:];
  long long v58 = +[RTMetric binForNumber:v57 bins:v5];
  [v8 setObject:v58 forKeyedSubscript:@"_totalDailyDwellFoliage"];

  double v59 = NSNumber;
  char v60 = [(RTLocationAwarenessMetricManager *)self dailyStateSignalEnvironmentDwell];
  id v61 = [v60 objectForKeyedSubscript:&unk_1F3451590];
  [v61 doubleValue];
  double v62 = [v59 numberWithDouble:];
  int v63 = +[RTMetric binForNumber:v62 bins:v5];
  [v8 setObject:v63 forKeyedSubscript:@"_totalDailyDwellUnavailableSignalEnvironment"];

  double v64 = NSNumber;
  uint64_t v65 = [(RTLocationAwarenessMetricManager *)self dailyStateSignalEnvironmentDwell];
  uint64_t v66 = [v65 objectForKeyedSubscript:&unk_1F3451650];
  [v66 doubleValue];
  double v67 = [v64 numberWithDouble:];
  double v68 = +[RTMetric binForNumber:v67 bins:v5];
  [v8 setObject:v68 forKeyedSubscript:@"_totalDailyDwellRural"];

  double v69 = NSNumber;
  uint64_t v70 = [(RTLocationAwarenessMetricManager *)self dailyStateSignalEnvironmentDwell];
  double v71 = [v70 objectForKeyedSubscript:&unk_1F3451668];
  [v71 doubleValue];
  uint64_t v72 = [v69 numberWithDouble:];
  double v73 = +[RTMetric binForNumber:v72 bins:v5];
  [v8 setObject:v73 forKeyedSubscript:@"_totalDailyDwellUrban"];

  id v74 = NSNumber;
  id v75 = [(RTLocationAwarenessMetricManager *)self dailyStateSignalEnvironmentDwell];
  uint64_t v76 = [v75 objectForKeyedSubscript:&unk_1F3451680];
  [v76 doubleValue];
  id v77 = [v74 numberWithDouble:];
  uint64_t v78 = +[RTMetric binForNumber:v77 bins:v5];
  [v8 setObject:v78 forKeyedSubscript:@"_totalDailyDwellDenseUrban"];

  double v79 = NSNumber;
  double v80 = [(RTLocationAwarenessMetricManager *)self dailyStateSignalEnvironmentDwell];
  id v81 = [v80 objectForKeyedSubscript:&unk_1F3451698];
  [v81 doubleValue];
  v82 = [v79 numberWithDouble:x0];
  double v83 = +[RTMetric binForNumber:v82 bins:v5];
  [v8 setObject:v83 forKeyedSubscript:@"_totalDailyDwellDenseUrbanCanyon"];

  id v84 = NSNumber;
  __int16 v85 = [(RTLocationAwarenessMetricManager *)self dailyStateMotionDwell];
  double v86 = [v85 objectForKeyedSubscript:&unk_1F34515C0];
  [v86 doubleValue];
  double v87 = [v84 numberWithDouble:];
  double v88 = +[RTMetric binForNumber:v87 bins:v5];
  [v8 setObject:v88 forKeyedSubscript:@"_totalDailyDurationStationary"];

  double v89 = NSNumber;
  double v90 = [(RTLocationAwarenessMetricManager *)self dailyStateMotionDwell];
  double v91 = [v90 objectForKeyedSubscript:&unk_1F34515D8];
  [v91 doubleValue];
  double v92 = [v89 numberWithDouble:];
  uint64_t v93 = +[RTMetric binForNumber:v92 bins:v5];
  [v8 setObject:v93 forKeyedSubscript:@"_totalDailyDurationWalking"];

  double v94 = NSNumber;
  double v95 = [(RTLocationAwarenessMetricManager *)self dailyStateMotionDwell];
  double v96 = [v95 objectForKeyedSubscript:&unk_1F34515F0];
  [v96 doubleValue];
  double v97 = [v94 numberWithDouble:];
  double v98 = +[RTMetric binForNumber:v97 bins:v5];
  [v8 setObject:v98 forKeyedSubscript:@"_totalDailyDurationRunning"];

  double v99 = NSNumber;
  double v100 = [(RTLocationAwarenessMetricManager *)self dailyStateMotionDwell];
  double v101 = [v100 objectForKeyedSubscript:&unk_1F3451620];
  [v101 doubleValue];
  double v102 = [v99 numberWithDouble:];
  double v103 = +[RTMetric binForNumber:v102 bins:v5];
  [v8 setObject:v103 forKeyedSubscript:@"_totalDailyDurationCycling"];

  uint64_t v104 = NSNumber;
  double v105 = [(RTLocationAwarenessMetricManager *)self dailyStateMotionDwell];
  double v106 = [v105 objectForKeyedSubscript:&unk_1F3451608];
  [v106 doubleValue];
  double v107 = [v104 numberWithDouble:];
  double v108 = +[RTMetric binForNumber:v107 bins:v5];
  [v8 setObject:v108 forKeyedSubscript:@"_totalDailyDurationDriving"];

  double v109 = NSNumber;
  double v110 = [(RTLocationAwarenessMetricManager *)self dailyStateMotionDwell];
  v111 = [v110 objectForKeyedSubscript:&unk_1F3451638];
  [v111 doubleValue];
  double v112 = [v109 numberWithDouble:];
  double v113 = +[RTMetric binForNumber:v112 bins:v5];
  [v8 setObject:v113 forKeyedSubscript:@"_totalDailyDurationMoving"];

  id v114 = NSNumber;
  int v115 = [(RTLocationAwarenessMetricManager *)self dailyStateMotionDwell];
  id v116 = [v115 objectForKeyedSubscript:&unk_1F34515A8];
  [v116 doubleValue];
  id v117 = [v114 numberWithDouble:];
  long long v118 = +[RTMetric binForNumber:v117 bins:v5];
  [v8 setObject:v118 forKeyedSubscript:@"_totalDailyDurationUnknownMotionActivity"];

  return v8;
}

- (void)submitMetrics
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = NSStringFromSelector(a2);
    int v11 = 138412290;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_INFO, "%@, start", (uint8_t *)&v11, 0xCu);
  }
  id v6 = [MEMORY[0x1E4F1C9C8] now];
  [(RTLocationAwarenessMetricManager *)self processMetrics];
  [(RTLocationAwarenessMetricManager *)self processLastBout];
  [(RTLocationAwarenessMetricManager *)self processLastDailyMetrics];
  [(RTLocationAwarenessMetricManager *)self submitDailyMetricsToCoreAnalytics];
  [(RTLocationAwarenessMetricManager *)self submitBoutMetricsToCoreAnalytics];
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = NSStringFromSelector(a2);
    double v9 = [MEMORY[0x1E4F1C9C8] date];
    [v9 timeIntervalSinceDate:v6];
    int v11 = 138412546;
    uint64_t v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = v10;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%@, finished, latency, %.2f", (uint8_t *)&v11, 0x16u);
  }
}

- (void)submitBoutMetricsToCoreAnalytics
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if ([(RTLocationAwarenessMetricManager *)self boutMetricType] == 1) {
    goto LABEL_3;
  }
  id v4 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutEnd];
  uint64_t v5 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
  [v4 timeIntervalSinceDate:v5];
  double v7 = v6;

  if (v7 >= 1200.0)
  {
LABEL_3:
    [(RTLocationAwarenessMetricManager *)self updateBoutMetricsStateChangeEdgeDwell];
    double v8 = [(RTLocationAwarenessMetricManager *)self collectBoutMetrics];
    double v9 = _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = NSStringFromSelector(a2);
      int v11 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutStart];
      uint64_t v12 = [v11 stringFromDate];
      __int16 v13 = [(RTLocationAwarenessMetricManager *)self boutStateCurrBoutEnd];
      uint64_t v14 = [v13 stringFromDate];
      uint64_t v15 = [(RTLocationAwarenessMetricManager *)self boutStateMotionDwell];
      *(_DWORD *)buf = 138413058;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      __int16 v25 = 2112;
      uint64_t v26 = v15;
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%@, bout start, %@, bout end %@, motion dwell %@", buf, 0x2Au);
    }
    id v16 = [NSString alloc];
    double v17 = (void *)[v16 initWithCString:RTAnalyticsEventLocationAwarenessBoutMetrics encoding:1];
    log_analytics_submission(v17, v8);
    double v18 = [NSString stringWithFormat:@"com.apple.%@", v17];
    AnalyticsSendEvent();
  }
  [(RTLocationAwarenessMetricManager *)self resetBoutMetrics];
}

- (void)submitDailyMetricsToCoreAnalytics
{
  id v5 = [(RTLocationAwarenessMetricManager *)self collectDailyMetrics];
  id v2 = [NSString alloc];
  unint64_t v3 = (void *)[v2 initWithCString:RTAnalyticsEventLocationAwarenessDailyMetrics encoding:1];
  log_analytics_submission(v3, v5);
  id v4 = [NSString stringWithFormat:@"com.apple.%@", v3];
  AnalyticsSendEvent();
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMotionActivityManager)motionManager
{
  return self->_motionManager;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (double)boutMetricDistanceToSensitiveLocation
{
  return self->_boutMetricDistanceToSensitiveLocation;
}

- (void)setBoutMetricDistanceToSensitiveLocation:(double)a3
{
  self->_boutMetricDistanceToSensitiveLocation = a3;
}

- (unint64_t)boutMetricType
{
  return self->_boutMetricType;
}

- (void)setBoutMetricType:(unint64_t)a3
{
  self->_boutMetricType = a3;
}

- (double)boutMetricDuration
{
  return self->_boutMetricDuration;
}

- (void)setBoutMetricDuration:(double)a3
{
  self->_boutMetricDuration = a3;
}

- (double)boutMetricNumWifiLocationsInBout
{
  return self->_boutMetricNumWifiLocationsInBout;
}

- (void)setBoutMetricNumWifiLocationsInBout:(double)a3
{
  self->_boutMetricNumWifiLocationsInBout = a3;
}

- (double)boutMetricNumGPSLocationsInBout
{
  return self->_boutMetricNumGPSLocationsInBout;
}

- (void)setBoutMetricNumGPSLocationsInBout:(double)a3
{
  self->_boutMetricNumGPSLocationsInBout = a3;
}

- (double)boutMetricNumOtherLocationsInBout
{
  return self->_boutMetricNumOtherLocationsInBout;
}

- (void)setBoutMetricNumOtherLocationsInBout:(double)a3
{
  self->_boutMetricNumOtherLocationsInBout = a3;
}

- (double)boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle
{
  return self->_boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle;
}

- (void)setBoutMetricNumAdditionalFixesPerHourRequired1mDutyCycle:(double)a3
{
  self->_boutMetricNumAdditionalFixesPerHourRequired1mDutyCycle = a3;
}

- (double)boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle
{
  return self->_boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle;
}

- (void)setBoutMetricNumAdditionalFixesPerHourRequired2mDutyCycle:(double)a3
{
  self->_boutMetricNumAdditionalFixesPerHourRequired2mDutyCycle = a3;
}

- (double)boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle
{
  return self->_boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle;
}

- (void)setBoutMetricNumAdditionalFixesPerHourRequired5mDutyCycle:(double)a3
{
  self->_boutMetricNumAdditionalFixesPerHourRequired5mDutyCycle = a3;
}

- (double)boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle
{
  return self->_boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle;
}

- (void)setBoutMetricNumAdditionalFixesPerHourRequired10mDutyCycle:(double)a3
{
  self->_boutMetricNumAdditionalFixesPerHourRequired10mDutyCycle = a3;
}

- (double)boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle
{
  return self->_boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle;
}

- (void)setBoutMetricNumAdditionalFixesPerHourRequired15mDutyCycle:(double)a3
{
  self->_boutMetricNumAdditionalFixesPerHourRequired15mDutyCycle = a3;
}

- (unint64_t)stateVariableCurrMotionActivityType
{
  return self->_stateVariableCurrMotionActivityType;
}

- (void)setStateVariableCurrMotionActivityType:(unint64_t)a3
{
  self->_stateVariableCurrMotionActivityType = a3;
}

- (NSDate)stateVariableCurrMotionStart
{
  return self->_stateVariableCurrMotionStart;
}

- (void)setStateVariableCurrMotionStart:(id)a3
{
}

- (int)stateVariableCurrSignalEnvironmentType
{
  return self->_stateVariableCurrSignalEnvironmentType;
}

- (void)setStateVariableCurrSignalEnvironmentType:(int)a3
{
  self->_stateVariableCurrSignalEnvironmentType = a3;
}

- (NSDate)stateVariablePrevLocationTimestamp
{
  return self->_stateVariablePrevLocationTimestamp;
}

- (void)setStateVariablePrevLocationTimestamp:(id)a3
{
}

- (NSDate)stateVariablePrevWifiLocationTimestamp
{
  return self->_stateVariablePrevWifiLocationTimestamp;
}

- (void)setStateVariablePrevWifiLocationTimestamp:(id)a3
{
}

- (double)stateVariableMostRecentDistanceToSensitiveLocation
{
  return self->_stateVariableMostRecentDistanceToSensitiveLocation;
}

- (void)setStateVariableMostRecentDistanceToSensitiveLocation:(double)a3
{
  self->_stateVariableMostRecentDistanceToSensitiveLocation = a3;
}

- (NSDate)stateVariableLastSensitiveLocationCheckTimestamp
{
  return self->_stateVariableLastSensitiveLocationCheckTimestamp;
}

- (void)setStateVariableLastSensitiveLocationCheckTimestamp:(id)a3
{
}

- (NSDate)stateVariableLastSettledStateChangeTimestamp
{
  return self->_stateVariableLastSettledStateChangeTimestamp;
}

- (void)setStateVariableLastSettledStateChangeTimestamp:(id)a3
{
}

- (NSDate)stateVariableLastWifiStateChangeTimestamp
{
  return self->_stateVariableLastWifiStateChangeTimestamp;
}

- (void)setStateVariableLastWifiStateChangeTimestamp:(id)a3
{
}

- (NSMutableDictionary)boutStateMotionDwell
{
  return self->_boutStateMotionDwell;
}

- (void)setBoutStateMotionDwell:(id)a3
{
}

- (NSMutableDictionary)boutStateMotionLongestDwell
{
  return self->_boutStateMotionLongestDwell;
}

- (void)setBoutStateMotionLongestDwell:(id)a3
{
}

- (NSMutableDictionary)boutStateMotionTypeNumBouts
{
  return self->_boutStateMotionTypeNumBouts;
}

- (void)setBoutStateMotionTypeNumBouts:(id)a3
{
}

- (NSMutableDictionary)boutStateSignalEnvironmentDwell
{
  return self->_boutStateSignalEnvironmentDwell;
}

- (void)setBoutStateSignalEnvironmentDwell:(id)a3
{
}

- (unint64_t)boutStateMotion
{
  return self->_boutStateMotion;
}

- (void)setBoutStateMotion:(unint64_t)a3
{
  self->_boutStateMotion = a3;
}

- (unint64_t)boutStateWifi
{
  return self->_boutStateWifi;
}

- (void)setBoutStateWifi:(unint64_t)a3
{
  self->_boutStateWifi = a3;
}

- (unint64_t)boutStateTypeForLastCompleteBout
{
  return self->_boutStateTypeForLastCompleteBout;
}

- (void)setBoutStateTypeForLastCompleteBout:(unint64_t)a3
{
  self->_boutStateTypeForLastCompleteBout = a3;
}

- (NSDate)boutStateCurrBoutStart
{
  return self->_boutStateCurrBoutStart;
}

- (void)setBoutStateCurrBoutStart:(id)a3
{
}

- (NSDate)boutStateCurrBoutEnd
{
  return self->_boutStateCurrBoutEnd;
}

- (void)setBoutStateCurrBoutEnd:(id)a3
{
}

- (double)boutBufferNumAdditionalFixesPerHourRequired1mDutyCycle
{
  return self->_boutBufferNumAdditionalFixesPerHourRequired1mDutyCycle;
}

- (void)setBoutBufferNumAdditionalFixesPerHourRequired1mDutyCycle:(double)a3
{
  self->_boutBufferNumAdditionalFixesPerHourRequired1mDutyCycle = a3;
}

- (double)boutBufferNumAdditionalFixesPerHourRequired2mDutyCycle
{
  return self->_boutBufferNumAdditionalFixesPerHourRequired2mDutyCycle;
}

- (void)setBoutBufferNumAdditionalFixesPerHourRequired2mDutyCycle:(double)a3
{
  self->_boutBufferNumAdditionalFixesPerHourRequired2mDutyCycle = a3;
}

- (double)boutBufferNumAdditionalFixesPerHourRequired5mDutyCycle
{
  return self->_boutBufferNumAdditionalFixesPerHourRequired5mDutyCycle;
}

- (void)setBoutBufferNumAdditionalFixesPerHourRequired5mDutyCycle:(double)a3
{
  self->_boutBufferNumAdditionalFixesPerHourRequired5mDutyCycle = a3;
}

- (double)boutBufferNumAdditionalFixesPerHourRequired10mDutyCycle
{
  return self->_boutBufferNumAdditionalFixesPerHourRequired10mDutyCycle;
}

- (void)setBoutBufferNumAdditionalFixesPerHourRequired10mDutyCycle:(double)a3
{
  self->_boutBufferNumAdditionalFixesPerHourRequired10mDutyCycle = a3;
}

- (double)boutBufferNumAdditionalFixesPerHourRequired15mDutyCycle
{
  return self->_boutBufferNumAdditionalFixesPerHourRequired15mDutyCycle;
}

- (void)setBoutBufferNumAdditionalFixesPerHourRequired15mDutyCycle:(double)a3
{
  self->_boutBufferNumAdditionalFixesPerHourRequired15mDutyCycle = a3;
}

- (double)boutBufferNumGPSLocationsInBout
{
  return self->_boutBufferNumGPSLocationsInBout;
}

- (void)setBoutBufferNumGPSLocationsInBout:(double)a3
{
  self->_boutBufferNumGPSLocationsInBout = a3;
}

- (double)boutBufferNumOtherLocationsInBout
{
  return self->_boutBufferNumOtherLocationsInBout;
}

- (void)setBoutBufferNumOtherLocationsInBout:(double)a3
{
  self->_boutBufferNumOtherLocationsInBout = a3;
}

- (double)boutBufferDistanceToSensitiveLocation
{
  return self->_boutBufferDistanceToSensitiveLocation;
}

- (void)setBoutBufferDistanceToSensitiveLocation:(double)a3
{
  self->_boutBufferDistanceToSensitiveLocation = a3;
}

- (double)boutBufferMotionEdgeDwell
{
  return self->_boutBufferMotionEdgeDwell;
}

- (void)setBoutBufferMotionEdgeDwell:(double)a3
{
  self->_boutBufferMotionEdgeDwell = a3;
}

- (unint64_t)boutBufferMotionEdgeType
{
  return self->_boutBufferMotionEdgeType;
}

- (void)setBoutBufferMotionEdgeType:(unint64_t)a3
{
  self->_boutBufferMotionEdgeType = a3;
}

- (NSMutableDictionary)boutBufferMotionDwell
{
  return self->_boutBufferMotionDwell;
}

- (void)setBoutBufferMotionDwell:(id)a3
{
}

- (NSMutableDictionary)boutBufferMotionLongestDwell
{
  return self->_boutBufferMotionLongestDwell;
}

- (void)setBoutBufferMotionLongestDwell:(id)a3
{
}

- (NSMutableDictionary)boutBufferMotionBoutCounts
{
  return self->_boutBufferMotionBoutCounts;
}

- (void)setBoutBufferMotionBoutCounts:(id)a3
{
}

- (NSMutableDictionary)boutBufferSignalEnvironmentDwell
{
  return self->_boutBufferSignalEnvironmentDwell;
}

- (void)setBoutBufferSignalEnvironmentDwell:(id)a3
{
}

- (NSMutableDictionary)dailyStateSignalEnvironmentDwell
{
  return self->_dailyStateSignalEnvironmentDwell;
}

- (void)setDailyStateSignalEnvironmentDwell:(id)a3
{
}

- (NSMutableDictionary)dailyStateMotionDwell
{
  return self->_dailyStateMotionDwell;
}

- (void)setDailyStateMotionDwell:(id)a3
{
}

- (NSMutableDictionary)dailyStateBoutCounts
{
  return self->_dailyStateBoutCounts;
}

- (void)setDailyStateBoutCounts:(id)a3
{
}

- (NSMutableDictionary)dailyStateBoutDwell
{
  return self->_dailyStateBoutDwell;
}

- (void)setDailyStateBoutDwell:(id)a3
{
}

- (NSMutableDictionary)dailyStateBoutLongestDwell
{
  return self->_dailyStateBoutLongestDwell;
}

- (void)setDailyStateBoutLongestDwell:(id)a3
{
}

- (NSArray)sensitiveLocations
{
  return self->_sensitiveLocations;
}

- (void)setSensitiveLocations:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_sensitiveLocations, 0);
  objc_storeStrong((id *)&self->_dailyStateBoutLongestDwell, 0);
  objc_storeStrong((id *)&self->_dailyStateBoutDwell, 0);
  objc_storeStrong((id *)&self->_dailyStateBoutCounts, 0);
  objc_storeStrong((id *)&self->_dailyStateMotionDwell, 0);
  objc_storeStrong((id *)&self->_dailyStateSignalEnvironmentDwell, 0);
  objc_storeStrong((id *)&self->_boutBufferSignalEnvironmentDwell, 0);
  objc_storeStrong((id *)&self->_boutBufferMotionBoutCounts, 0);
  objc_storeStrong((id *)&self->_boutBufferMotionLongestDwell, 0);
  objc_storeStrong((id *)&self->_boutBufferMotionDwell, 0);
  objc_storeStrong((id *)&self->_boutStateCurrBoutEnd, 0);
  objc_storeStrong((id *)&self->_boutStateCurrBoutStart, 0);
  objc_storeStrong((id *)&self->_boutStateSignalEnvironmentDwell, 0);
  objc_storeStrong((id *)&self->_boutStateMotionTypeNumBouts, 0);
  objc_storeStrong((id *)&self->_boutStateMotionLongestDwell, 0);
  objc_storeStrong((id *)&self->_boutStateMotionDwell, 0);
  objc_storeStrong((id *)&self->_stateVariableLastWifiStateChangeTimestamp, 0);
  objc_storeStrong((id *)&self->_stateVariableLastSettledStateChangeTimestamp, 0);
  objc_storeStrong((id *)&self->_stateVariableLastSensitiveLocationCheckTimestamp, 0);
  objc_storeStrong((id *)&self->_stateVariablePrevWifiLocationTimestamp, 0);
  objc_storeStrong((id *)&self->_stateVariablePrevLocationTimestamp, 0);
  objc_storeStrong((id *)&self->_stateVariableCurrMotionStart, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end