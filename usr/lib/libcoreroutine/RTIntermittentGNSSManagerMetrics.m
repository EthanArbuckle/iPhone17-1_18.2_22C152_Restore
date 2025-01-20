@interface RTIntermittentGNSSManagerMetrics
+ (id)signalCategoryToString:(unint64_t)a3;
- (BOOL)currentSessionOngoing;
- (BOOL)currentStreakOngoing;
- (NSMutableDictionary)powerLogEventDictionary;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTIntermittentGNSSManagerMetrics)initWithDefaultsManager:(id)a3 timerManager:(id)a4;
- (RTTimer)streakMetricsTimer;
- (RTTimerManager)timerManager;
- (double)_getCurrentSessionDuration;
- (double)currentSessionDuration;
- (double)currentSessionTimeSinceLastSession;
- (double)currentStreakDuration;
- (id)_collectDailyMetrics;
- (id)_collectSessionMetrics;
- (id)_collectStreakMetrics;
- (id)_getLastRegistrationDate;
- (id)getLastRegistrationDate;
- (int)currentStreakNumSessions;
- (unint64_t)currentSessionActivationCriteria;
- (unint64_t)currentSessionDeactivationCriteria;
- (unint64_t)currentSessionNumLocationsReceived;
- (unint64_t)currentStreakActivationCriteria;
- (unint64_t)currentStreakDeactivationCriteria;
- (unint64_t)mostRecentSignalSwitch;
- (void)_clearDailyMetrics;
- (void)_clearSessionMetrics;
- (void)_clearStreakMetrics;
- (void)_setup;
- (void)_submitDailyMetricsToCoreAnalytics;
- (void)_submitSessionMetricsToCoreAnalytics;
- (void)_submitStreakMetricsToCoreAnalytics;
- (void)_updateMetricsForKey:(id)a3;
- (void)processSignalSwitch:(unint64_t)a3;
- (void)setCurrentSessionActivationCriteria:(unint64_t)a3;
- (void)setCurrentSessionDeactivationCriteria:(unint64_t)a3;
- (void)setCurrentSessionDuration:(double)a3;
- (void)setCurrentSessionNumLocationsReceived:(unint64_t)a3;
- (void)setCurrentSessionOngoing:(BOOL)a3;
- (void)setCurrentSessionTimeSinceLastSession:(double)a3;
- (void)setCurrentStreakActivationCriteria:(unint64_t)a3;
- (void)setCurrentStreakDeactivationCriteria:(unint64_t)a3;
- (void)setCurrentStreakDuration:(double)a3;
- (void)setCurrentStreakNumSessions:(int)a3;
- (void)setCurrentStreakOngoing:(BOOL)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setMostRecentSignalSwitch:(unint64_t)a3;
- (void)setPowerLogEventDictionary:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStreakMetricsTimer:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setup;
- (void)shutdown;
- (void)submitDailyMetricsToCoreAnalytics;
- (void)updateMetricsForKey:(id)a3;
- (void)updateSessionLocationCount:(unint64_t)a3;
@end

@implementation RTIntermittentGNSSManagerMetrics

- (void)updateSessionLocationCount:(unint64_t)a3
{
  v5 = [(RTIntermittentGNSSManagerMetrics *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __63__RTIntermittentGNSSManagerMetrics_updateSessionLocationCount___block_invoke;
  v6[3] = &unk_1E6B91248;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

unsigned char *__63__RTIntermittentGNSSManagerMetrics_updateSessionLocationCount___block_invoke(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[8])
  {
    uint64_t v3 = *(int *)(a1 + 40);
    uint64_t v4 = v3 + [result currentSessionNumLocationsReceived];
    v5 = *(void **)(a1 + 32);
    return (unsigned char *)[v5 setCurrentSessionNumLocationsReceived:v4];
  }
  return result;
}

- (RTIntermittentGNSSManagerMetrics)initWithDefaultsManager:(id)a3 timerManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (!v7)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v17 = 0;
      goto LABEL_13;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: defaultsManager";
LABEL_15:
    _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, v16, buf, 2u);
    goto LABEL_9;
  }
  if (!v8)
  {
    v15 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v16 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_15;
  }
  v24.receiver = self;
  v24.super_class = (Class)RTIntermittentGNSSManagerMetrics;
  v10 = [(RTIntermittentGNSSManagerMetrics *)&v24 init];
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_defaultsManager, a3);
    objc_storeStrong(p_isa + 3, a4);
    v12 = p_isa;
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v14 = (const char *)[v12 UTF8String];
    }
    else
    {
      id v18 = [NSString stringWithFormat:@"%@-%p", objc_opt_class(), v12];
      v14 = (const char *)[v18 UTF8String];
    }
    dispatch_queue_t v19 = dispatch_queue_create(v14, v13);

    id v20 = v12[5];
    v12[5] = v19;

    uint64_t v21 = objc_opt_new();
    id v22 = v12[4];
    v12[4] = (id)v21;

    [v12 setup];
  }
  self = p_isa;
  v17 = self;
LABEL_13:

  return v17;
}

- (void)setup
{
  uint64_t v3 = [(RTIntermittentGNSSManagerMetrics *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__RTIntermittentGNSSManagerMetrics_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __41__RTIntermittentGNSSManagerMetrics_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_setup
{
  self->_mostRecentSignalSwitch = 0;
  [(NSMutableDictionary *)self->_powerLogEventDictionary setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"Enabled"];
  uint64_t v3 = +[RTIntermittentGNSSManagerMetrics signalCategoryToString:0];
  [(NSMutableDictionary *)self->_powerLogEventDictionary setObject:v3 forKeyedSubscript:@"Reason"];

  [(RTIntermittentGNSSManagerMetrics *)self _clearSessionMetrics];

  [(RTIntermittentGNSSManagerMetrics *)self _clearStreakMetrics];
}

- (void)shutdown
{
  uint64_t v3 = [(RTIntermittentGNSSManagerMetrics *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__RTIntermittentGNSSManagerMetrics_shutdown__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __44__RTIntermittentGNSSManagerMetrics_shutdown__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) streakMetricsTimer];
  [v2 invalidate];

  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setStreakMetricsTimer:0];
}

- (double)_getCurrentSessionDuration
{
  v2 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  uint64_t v3 = [v2 objectForKey:@"RTDefaultsIntermittentGNSSLastRegistrationDate"];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  v6 = v5;

  id v7 = [MEMORY[0x1E4F1C9C8] date];
  [v7 timeIntervalSinceDate:v6];
  double v9 = v8;

  return v9;
}

- (id)getLastRegistrationDate
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__44;
  v11 = __Block_byref_object_dispose__44;
  id v12 = 0;
  uint64_t v3 = [(RTIntermittentGNSSManagerMetrics *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__RTIntermittentGNSSManagerMetrics_getLastRegistrationDate__block_invoke;
  v6[3] = &unk_1E6B93860;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __59__RTIntermittentGNSSManagerMetrics_getLastRegistrationDate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) _getLastRegistrationDate];

  return MEMORY[0x1F41817F8]();
}

- (id)_getLastRegistrationDate
{
  v2 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  uint64_t v3 = [v2 objectForKey:@"RTDefaultsIntermittentGNSSLastRegistrationDate"];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1C9C8] date];
  }
  v6 = v5;

  return v6;
}

+ (id)signalCategoryToString:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"RTIntermittentGNSSManagerSignalCategoryUnknown";
  }
  else {
    return off_1E6B948D8[a3 - 1];
  }
}

- (void)updateMetricsForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(RTIntermittentGNSSManagerMetrics *)self queue];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __56__RTIntermittentGNSSManagerMetrics_updateMetricsForKey___block_invoke;
    v7[3] = &unk_1E6B90BF0;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(v5, v7);
  }
  else
  {
    v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key", buf, 2u);
    }
  }
}

uint64_t __56__RTIntermittentGNSSManagerMetrics_updateMetricsForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateMetricsForKey:*(void *)(a1 + 40)];
}

- (void)_updateMetricsForKey:(id)a3
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (!v4)
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: key", (uint8_t *)location, 2u);
    }
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"register"])
  {
    [(RTIntermittentGNSSManagerMetrics *)self setCurrentSessionOngoing:1];
    v6 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    [v6 setObject:v7 forKey:@"RTDefaultsIntermittentGNSSLastRegistrationDate"];

    id v8 = [(RTIntermittentGNSSManagerMetrics *)self powerLogEventDictionary];
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"Enabled"];

    uint64_t v9 = [[NSNumber numberWithUnsignedInteger:-[RTIntermittentGNSSManagerMetrics mostRecentSignalSwitch](self, "mostRecentSignalSwitch")];
    v10 = [(RTIntermittentGNSSManagerMetrics *)self powerLogEventDictionary];
    [v10 setObject:v9 forKeyedSubscript:@"Reason"];

    v11 = [(RTIntermittentGNSSManagerMetrics *)self powerLogEventDictionary];
    PLLogRegisteredEvent();

    [(RTIntermittentGNSSManagerMetrics *)self setCurrentSessionActivationCriteria:[(RTIntermittentGNSSManagerMetrics *)self mostRecentSignalSwitch]];
    id v12 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
    v13 = [v12 objectForKey:@"RTDefaultsIntermittentGNSSLastUnregistrationDate"];

    v14 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
    v15 = [v14 objectForKey:@"RTDefaultsIntermittentGNSSLastRegistrationDate"];

    if (v13
      && ([v15 timeIntervalSinceDate:v13],
          -[RTIntermittentGNSSManagerMetrics setCurrentSessionTimeSinceLastSession:](self, "setCurrentSessionTimeSinceLastSession:"), [(RTIntermittentGNSSManagerMetrics *)self currentSessionTimeSinceLastSession], v16 <= 1200.0))
    {
      [(RTIntermittentGNSSManagerMetrics *)self setCurrentStreakNumSessions:[(RTIntermittentGNSSManagerMetrics *)self currentStreakNumSessions] + 1];
    }
    else
    {
      if ([(RTIntermittentGNSSManagerMetrics *)self currentStreakOngoing]) {
        [(RTIntermittentGNSSManagerMetrics *)self _submitStreakMetricsToCoreAnalytics];
      }
      [(RTIntermittentGNSSManagerMetrics *)self setCurrentStreakOngoing:1];
      [(RTIntermittentGNSSManagerMetrics *)self setCurrentStreakNumSessions:[(RTIntermittentGNSSManagerMetrics *)self currentStreakNumSessions] + 1];
      [(RTIntermittentGNSSManagerMetrics *)self setCurrentStreakActivationCriteria:[(RTIntermittentGNSSManagerMetrics *)self currentSessionActivationCriteria]];
    }

    goto LABEL_32;
  }
  if (![v5 isEqualToString:@"unregister"])
  {
    v17 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 136315138;
      *(id *)((char *)location + 4) = "-[RTIntermittentGNSSManagerMetrics _updateMetricsForKey:]";
      _os_log_debug_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_DEBUG, "%s, command not recognized for metrics update", (uint8_t *)location, 0xCu);
    }
LABEL_10:

    goto LABEL_32;
  }
  [(RTIntermittentGNSSManagerMetrics *)self setCurrentSessionOngoing:0];
  id v18 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  dispatch_queue_t v19 = [MEMORY[0x1E4F1C9C8] date];
  [v18 setObject:v19 forKey:@"RTDefaultsIntermittentGNSSLastUnregistrationDate"];

  id v20 = [(RTIntermittentGNSSManagerMetrics *)self powerLogEventDictionary];
  [v20 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"Enabled"];

  uint64_t v21 = [[NSNumber numberWithUnsignedInteger:-[RTIntermittentGNSSManagerMetrics mostRecentSignalSwitch](self, "mostRecentSignalSwitch")];
  id v22 = [(RTIntermittentGNSSManagerMetrics *)self powerLogEventDictionary];
  [v22 setObject:v21 forKeyedSubscript:@"Reason"];

  v23 = [(RTIntermittentGNSSManagerMetrics *)self powerLogEventDictionary];
  PLLogRegisteredEvent();

  [(RTIntermittentGNSSManagerMetrics *)self _getCurrentSessionDuration];
  double v25 = v24;
  v26 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  v27 = [v26 objectForKey:@"RTDefaultsIntermittentGNSSDailySessionCount"];
  int v28 = [v27 intValue];

  v29 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  v30 = [v29 objectForKey:@"RTDefaultsIntermittentGNSSDailyDuration"];
  [v30 doubleValue];
  if (v31 == 0.0) {
    double v32 = 0.0;
  }
  else {
    double v32 = v31;
  }

  v33 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  v34 = [NSNumber numberWithDouble:v25 + v32];
  [v33 setObject:v34 forKey:@"RTDefaultsIntermittentGNSSDailyDuration"];

  v35 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  v36 = [NSNumber numberWithInt:(v28 + 1)];
  [v35 setObject:v36 forKey:@"RTDefaultsIntermittentGNSSDailySessionCount"];

  v37 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  v38 = [v37 objectForKey:@"RTDefaultsIntermittentGNSSDailyLongestSessionDuration"];
  [v38 doubleValue];
  if (v39 == 0.0) {
    double v40 = 0.0;
  }
  else {
    double v40 = v39;
  }

  if (v25 > v40)
  {
    v41 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
    v42 = [NSNumber numberWithDouble:v25];
    [v41 setObject:v42 forKey:@"RTDefaultsIntermittentGNSSDailyLongestSessionDuration"];
  }
  if (v25 >= 1200.0)
  {
    v43 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
    v44 = [v43 objectForKey:@"RTDefaultsIntermittentGNSSDailyLongSessionCount"];
    int v45 = [v44 intValue];

    v46 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
    v47 = [NSNumber numberWithInt:(v45 + 1)];
    [v46 setObject:v47 forKey:@"RTDefaultsIntermittentGNSSDailyLongSessionCount"];
  }
  [(RTIntermittentGNSSManagerMetrics *)self setCurrentSessionDuration:v25];
  [(RTIntermittentGNSSManagerMetrics *)self setCurrentSessionDeactivationCriteria:[(RTIntermittentGNSSManagerMetrics *)self mostRecentSignalSwitch]];
  [(RTIntermittentGNSSManagerMetrics *)self currentStreakDuration];
  double v49 = v48;
  [(RTIntermittentGNSSManagerMetrics *)self currentSessionDuration];
  [(RTIntermittentGNSSManagerMetrics *)self setCurrentStreakDuration:v49 + v50];
  [(RTIntermittentGNSSManagerMetrics *)self currentSessionTimeSinceLastSession];
  if (v51 <= 1200.0)
  {
    [(RTIntermittentGNSSManagerMetrics *)self currentStreakDuration];
    double v53 = v52;
    [(RTIntermittentGNSSManagerMetrics *)self currentSessionTimeSinceLastSession];
    [(RTIntermittentGNSSManagerMetrics *)self setCurrentStreakDuration:v53 + v54];
  }
  [(RTIntermittentGNSSManagerMetrics *)self setCurrentStreakDeactivationCriteria:[(RTIntermittentGNSSManagerMetrics *)self mostRecentSignalSwitch]];
  [(RTIntermittentGNSSManagerMetrics *)self _submitSessionMetricsToCoreAnalytics];
  v55 = [(RTIntermittentGNSSManagerMetrics *)self streakMetricsTimer];

  if (v55)
  {
    v56 = [(RTIntermittentGNSSManagerMetrics *)self streakMetricsTimer];
    [v56 invalidate];

    [(RTIntermittentGNSSManagerMetrics *)self setStreakMetricsTimer:0];
  }
  objc_initWeak(location, self);
  v57 = [(RTIntermittentGNSSManagerMetrics *)self timerManager];
  v58 = [(RTIntermittentGNSSManagerMetrics *)self queue];
  uint64_t v62 = MEMORY[0x1E4F143A8];
  uint64_t v63 = 3221225472;
  v64 = __57__RTIntermittentGNSSManagerMetrics__updateMetricsForKey___block_invoke;
  v65 = &unk_1E6B917C8;
  objc_copyWeak(&v67, location);
  v66 = self;
  v59 = [v57 timerWithIdentifier:@"RTIntermittentGNSSStreakMetricsTimer" queue:v58 handler:&v62];
  -[RTIntermittentGNSSManagerMetrics setStreakMetricsTimer:](self, "setStreakMetricsTimer:", v59, v62, v63, v64, v65);

  v60 = [(RTIntermittentGNSSManagerMetrics *)self streakMetricsTimer];
  [v60 fireAfterDelay:1200.0];

  v61 = [(RTIntermittentGNSSManagerMetrics *)self streakMetricsTimer];
  [v61 resume];

  objc_destroyWeak(&v67);
  objc_destroyWeak(location);
LABEL_32:
}

void __57__RTIntermittentGNSSManagerMetrics__updateMetricsForKey___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained streakMetricsTimer];

  if (v3)
  {
    id v4 = [WeakRetained streakMetricsTimer];
    [v4 invalidate];

    [WeakRetained setStreakMetricsTimer:0];
  }
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "-[RTIntermittentGNSSManagerMetrics _updateMetricsForKey:]_block_invoke";
    __int16 v8 = 2112;
    uint64_t v9 = @"RTIntermittentGNSSStreakMetricsTimer";
    __int16 v10 = 2048;
    uint64_t v11 = 0x4034000000000000;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, time between session threshold for streak metric has been exceeded, timerIdentifier, %@, threshold in minutes, %.2f", (uint8_t *)&v6, 0x20u);
  }

  if ([*(id *)(a1 + 32) currentStreakOngoing]) {
    [*(id *)(a1 + 32) _submitStreakMetricsToCoreAnalytics];
  }
}

- (void)processSignalSwitch:(unint64_t)a3
{
  id v5 = [(RTIntermittentGNSSManagerMetrics *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __56__RTIntermittentGNSSManagerMetrics_processSignalSwitch___block_invoke;
  v6[3] = &unk_1E6B91248;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __56__RTIntermittentGNSSManagerMetrics_processSignalSwitch___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setMostRecentSignalSwitch:*(void *)(a1 + 40)];
}

- (id)_collectDailyMetrics
{
  uint64_t v3 = objc_opt_new();
  id v4 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  id v5 = [v4 objectForKey:@"RTDefaultsIntermittentGNSSDailyDuration"];
  if (v5)
  {
    int v6 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
    uint64_t v7 = [v6 objectForKey:@"RTDefaultsIntermittentGNSSDailyDuration"];
    [v7 doubleValue];
    double v9 = v8;
  }
  else
  {
    double v9 = 0.0;
  }

  __int16 v10 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  uint64_t v11 = [v10 objectForKey:@"RTDefaultsIntermittentGNSSDailySessionCount"];
  if (v11)
  {
    uint64_t v12 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
    v13 = [v12 objectForKey:@"RTDefaultsIntermittentGNSSDailySessionCount"];
    uint64_t v14 = [v13 intValue];
  }
  else
  {
    uint64_t v14 = 0;
  }

  v15 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  double v16 = [v15 objectForKey:@"RTDefaultsIntermittentGNSSDailyLongSessionCount"];
  if (v16)
  {
    v17 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
    id v18 = [v17 objectForKey:@"RTDefaultsIntermittentGNSSDailyLongSessionCount"];
    uint64_t v19 = [v18 intValue];
  }
  else
  {
    uint64_t v19 = 0;
  }

  id v20 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  uint64_t v21 = [v20 objectForKey:@"RTDefaultsIntermittentGNSSDailyLongestSessionDuration"];
  if (v21)
  {
    id v22 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
    v23 = [v22 objectForKey:@"RTDefaultsIntermittentGNSSDailyLongestSessionDuration"];
    [v23 doubleValue];
    double v25 = v24;
  }
  else
  {
    double v25 = 0.0;
  }

  v26 = [NSNumber numberWithDouble:v9];
  v27 = +[RTMetric binForNumber:v26 bins:&unk_1F3452BB0];
  [v3 setObject:v27 forKeyedSubscript:@"_totalDailyDuration"];

  int v28 = [NSNumber numberWithInt:v14];
  v29 = +[RTMetric binForNumber:v28 bins:&unk_1F3452BC8];
  [v3 setObject:v29 forKeyedSubscript:@"_numDailyRequests"];

  v30 = [NSNumber numberWithInt:v19];
  double v31 = +[RTMetric binForNumber:v30 bins:&unk_1F3452BE0];
  [v3 setObject:v31 forKeyedSubscript:@"_numLongSessions"];

  double v32 = [NSNumber numberWithDouble:v25];
  v33 = +[RTMetric binForNumber:v32 bins:&unk_1F3452BF8];
  [v3 setObject:v33 forKeyedSubscript:@"_longestSessionDuration"];

  return v3;
}

- (id)_collectSessionMetrics
{
  uint64_t v3 = objc_opt_new();
  [(RTIntermittentGNSSManagerMetrics *)self currentSessionDuration];
  id v4 = NSNumber;
  double v6 = v5 / 60.0;
  [(RTIntermittentGNSSManagerMetrics *)self currentSessionDuration];
  uint64_t v7 = [v4 numberWithDouble:];
  double v8 = +[RTMetric binForNumber:v7 bins:&unk_1F3452C10];
  [v3 setObject:v8 forKeyedSubscript:@"_duration"];

  double v9 = [[NSNumber numberWithUnsignedInteger:-[RTIntermittentGNSSManagerMetrics currentSessionActivationCriteria](self, "currentSessionActivationCriteria")];
  [v3 setObject:v9 forKeyedSubscript:@"_activationCriteria"];

  __int16 v10 = [[NSNumber numberWithUnsignedInteger:-[RTIntermittentGNSSManagerMetrics currentSessionDeactivationCriteria](self, "currentSessionDeactivationCriteria")];
  [v3 setObject:v10 forKeyedSubscript:@"_deactivationCriteria"];

  uint64_t v11 = NSNumber;
  [(RTIntermittentGNSSManagerMetrics *)self currentSessionTimeSinceLastSession];
  uint64_t v12 = [v11 numberWithDouble:x0];
  v13 = +[RTMetric binForNumber:v12 bins:&unk_1F3452C28];
  [v3 setObject:v13 forKeyedSubscript:@"_timeSinceLastSession"];

  if (v6 > 1.0)
  {
    uint64_t v14 = [NSNumber numberWithDouble:-[RTIntermittentGNSSManagerMetrics currentSessionNumLocationsReceived](self, "currentSessionNumLocationsReceived")/ v6];
    v15 = +[RTMetric binForNumber:v14 bins:&unk_1F3452C40];
    [v3 setObject:v15 forKeyedSubscript:@"_numLocationsPerMin"];
  }
  else
  {
    uint64_t v14 = [NSNumber numberWithUnsignedInteger:-[RTIntermittentGNSSManagerMetrics currentSessionNumLocationsReceived](self, "currentSessionNumLocationsReceived")];
    [v3 setObject:v14 forKeyedSubscript:@"_numLocationsPerMin"];
  }

  return v3;
}

- (id)_collectStreakMetrics
{
  uint64_t v3 = objc_opt_new();
  id v4 = NSNumber;
  [(RTIntermittentGNSSManagerMetrics *)self currentStreakDuration];
  double v5 = [v4 numberWithDouble:];
  double v6 = +[RTMetric binForNumber:v5 bins:&unk_1F3452C58];
  [v3 setObject:v6 forKeyedSubscript:@"_duration"];

  uint64_t v7 = [[NSNumber numberWithUnsignedInteger:-[RTIntermittentGNSSManagerMetrics currentStreakActivationCriteria](self, "currentStreakActivationCriteria")];
  [v3 setObject:v7 forKeyedSubscript:@"_activationCriteria"];

  double v8 = [[NSNumber numberWithUnsignedInteger:-[RTIntermittentGNSSManagerMetrics currentStreakDeactivationCriteria](self, "currentStreakDeactivationCriteria")];
  [v3 setObject:v8 forKeyedSubscript:@"_deactivationCriteria"];

  double v9 = [[NSNumber numberWithInt:-[RTIntermittentGNSSManagerMetrics currentStreakNumSessions](self, "currentStreakNumSessions")];
  __int16 v10 = +[RTMetric binForNumber:v9 bins:&unk_1F3452C70];
  [v3 setObject:v10 forKeyedSubscript:@"_numSessions"];

  return v3;
}

- (void)_clearDailyMetrics
{
  uint64_t v3 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  [v3 setObject:&unk_1F3450480 forKey:@"RTDefaultsIntermittentGNSSDailyDuration"];

  id v4 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  [v4 setObject:&unk_1F3450480 forKey:@"RTDefaultsIntermittentGNSSDailySessionCount"];

  double v5 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  [v5 setObject:&unk_1F3450480 forKey:@"RTDefaultsIntermittentGNSSDailyLongSessionCount"];

  id v6 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  [v6 setObject:&unk_1F3450480 forKey:@"RTDefaultsIntermittentGNSSDailyLongestSessionDuration"];
}

- (void)_clearSessionMetrics
{
  [(RTIntermittentGNSSManagerMetrics *)self setCurrentSessionDuration:0.0];
  [(RTIntermittentGNSSManagerMetrics *)self setCurrentSessionActivationCriteria:0];
  [(RTIntermittentGNSSManagerMetrics *)self setCurrentSessionDeactivationCriteria:0];
  [(RTIntermittentGNSSManagerMetrics *)self setCurrentSessionTimeSinceLastSession:-1.0];

  [(RTIntermittentGNSSManagerMetrics *)self setCurrentSessionNumLocationsReceived:0];
}

- (void)_clearStreakMetrics
{
  [(RTIntermittentGNSSManagerMetrics *)self setCurrentStreakDuration:0.0];
  [(RTIntermittentGNSSManagerMetrics *)self setCurrentSessionActivationCriteria:0];
  [(RTIntermittentGNSSManagerMetrics *)self setCurrentSessionDeactivationCriteria:0];
  [(RTIntermittentGNSSManagerMetrics *)self setCurrentStreakNumSessions:0];

  [(RTIntermittentGNSSManagerMetrics *)self setCurrentStreakOngoing:0];
}

- (void)submitDailyMetricsToCoreAnalytics
{
  uint64_t v3 = [(RTIntermittentGNSSManagerMetrics *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__RTIntermittentGNSSManagerMetrics_submitDailyMetricsToCoreAnalytics__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __69__RTIntermittentGNSSManagerMetrics_submitDailyMetricsToCoreAnalytics__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _submitDailyMetricsToCoreAnalytics];
}

- (void)_submitDailyMetricsToCoreAnalytics
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(RTIntermittentGNSSManagerMetrics *)self _collectDailyMetrics];
  id v4 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  double v5 = [v4 objectForKey:@"RTDefaultsIntermittentGNSSDailyDuration"];
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  if (v5)
  {
    double v8 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
    double v9 = [v8 objectForKey:@"RTDefaultsIntermittentGNSSDailyDuration"];
    [v9 doubleValue];
    uint64_t v7 = v10;
  }
  uint64_t v11 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  uint64_t v12 = [v11 objectForKey:@"RTDefaultsIntermittentGNSSDailySessionCount"];
  if (v12)
  {
    v13 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
    uint64_t v14 = [v13 objectForKey:@"RTDefaultsIntermittentGNSSDailySessionCount"];
    [v14 doubleValue];
    uint64_t v6 = v15;
  }
  double v16 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  v17 = [v16 objectForKey:@"RTDefaultsIntermittentGNSSDailyLongSessionCount"];
  uint64_t v18 = 0;
  uint64_t v19 = 0;
  if (v17)
  {
    id v20 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
    uint64_t v21 = [v20 objectForKey:@"RTDefaultsIntermittentGNSSDailyLongSessionCount"];
    [v21 doubleValue];
    uint64_t v19 = v22;
  }
  v23 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
  double v24 = [v23 objectForKey:@"RTDefaultsIntermittentGNSSDailyLongestSessionDuration"];
  if (v24)
  {
    double v25 = [(RTIntermittentGNSSManagerMetrics *)self defaultsManager];
    v26 = [v25 objectForKey:@"RTDefaultsIntermittentGNSSDailyLongestSessionDuration"];
    [v26 doubleValue];
    uint64_t v18 = v27;
  }
  int v28 = _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134219010;
    uint64_t v33 = v7;
    __int16 v34 = 2048;
    uint64_t v35 = v6;
    __int16 v36 = 2048;
    uint64_t v37 = v19;
    __int16 v38 = 2048;
    uint64_t v39 = v18;
    __int16 v40 = 2112;
    v41 = v3;
    _os_log_impl(&dword_1D9BFA000, v28, OS_LOG_TYPE_INFO, "submitting daily metrics for intermittent gnss, totalDuration, %.2f, sessionCount, %.2f, longSessionCount, %.2f, longSessionDuration, %.2f, metrics, %@", buf, 0x34u);
  }

  id v29 = [NSString alloc];
  v30 = (void *)[v29 initWithCString:RTAnalyticsEventIntermittentGNSSDailyMetrics encoding:1];
  log_analytics_submission(v30, v3);
  double v31 = [NSString stringWithFormat:@"com.apple.%@", v30];
  AnalyticsSendEvent();

  [(RTIntermittentGNSSManagerMetrics *)self _clearDailyMetrics];
}

- (void)_submitSessionMetricsToCoreAnalytics
{
  id v6 = [(RTIntermittentGNSSManagerMetrics *)self _collectSessionMetrics];
  id v3 = [NSString alloc];
  id v4 = (void *)[v3 initWithCString:RTAnalyticsEventIntermittentGNSSSessionMetrics encoding:1];
  log_analytics_submission(v4, v6);
  double v5 = [NSString stringWithFormat:@"com.apple.%@", v4];
  AnalyticsSendEvent();

  [(RTIntermittentGNSSManagerMetrics *)self _clearSessionMetrics];
}

- (void)_submitStreakMetricsToCoreAnalytics
{
  id v6 = [(RTIntermittentGNSSManagerMetrics *)self _collectStreakMetrics];
  id v3 = [NSString alloc];
  id v4 = (void *)[v3 initWithCString:RTAnalyticsEventIntermittentGNSSStreakMetrics encoding:1];
  log_analytics_submission(v4, v6);
  double v5 = [NSString stringWithFormat:@"com.apple.%@", v4];
  AnalyticsSendEvent();

  [(RTIntermittentGNSSManagerMetrics *)self _clearStreakMetrics];
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (NSMutableDictionary)powerLogEventDictionary
{
  return self->_powerLogEventDictionary;
}

- (void)setPowerLogEventDictionary:(id)a3
{
}

- (void)setQueue:(id)a3
{
}

- (unint64_t)mostRecentSignalSwitch
{
  return self->_mostRecentSignalSwitch;
}

- (void)setMostRecentSignalSwitch:(unint64_t)a3
{
  self->_mostRecentSignalSwitch = a3;
}

- (BOOL)currentSessionOngoing
{
  return self->_currentSessionOngoing;
}

- (void)setCurrentSessionOngoing:(BOOL)a3
{
  self->_currentSessionOngoing = a3;
}

- (unint64_t)currentSessionNumLocationsReceived
{
  return self->_currentSessionNumLocationsReceived;
}

- (void)setCurrentSessionNumLocationsReceived:(unint64_t)a3
{
  self->_currentSessionNumLocationsReceived = a3;
}

- (double)currentSessionDuration
{
  return self->_currentSessionDuration;
}

- (void)setCurrentSessionDuration:(double)a3
{
  self->_currentSessionDuration = a3;
}

- (double)currentSessionTimeSinceLastSession
{
  return self->_currentSessionTimeSinceLastSession;
}

- (void)setCurrentSessionTimeSinceLastSession:(double)a3
{
  self->_currentSessionTimeSinceLastSession = a3;
}

- (unint64_t)currentSessionActivationCriteria
{
  return self->_currentSessionActivationCriteria;
}

- (void)setCurrentSessionActivationCriteria:(unint64_t)a3
{
  self->_currentSessionActivationCriteria = a3;
}

- (unint64_t)currentSessionDeactivationCriteria
{
  return self->_currentSessionDeactivationCriteria;
}

- (void)setCurrentSessionDeactivationCriteria:(unint64_t)a3
{
  self->_currentSessionDeactivationCriteria = a3;
}

- (BOOL)currentStreakOngoing
{
  return self->_currentStreakOngoing;
}

- (void)setCurrentStreakOngoing:(BOOL)a3
{
  self->_currentStreakOngoing = a3;
}

- (int)currentStreakNumSessions
{
  return self->_currentStreakNumSessions;
}

- (void)setCurrentStreakNumSessions:(int)a3
{
  self->_currentStreakNumSessions = a3;
}

- (double)currentStreakDuration
{
  return self->_currentStreakDuration;
}

- (void)setCurrentStreakDuration:(double)a3
{
  self->_currentStreakDuration = a3;
}

- (unint64_t)currentStreakActivationCriteria
{
  return self->_currentStreakActivationCriteria;
}

- (void)setCurrentStreakActivationCriteria:(unint64_t)a3
{
  self->_currentStreakActivationCriteria = a3;
}

- (unint64_t)currentStreakDeactivationCriteria
{
  return self->_currentStreakDeactivationCriteria;
}

- (void)setCurrentStreakDeactivationCriteria:(unint64_t)a3
{
  self->_currentStreakDeactivationCriteria = a3;
}

- (RTTimer)streakMetricsTimer
{
  return self->_streakMetricsTimer;
}

- (void)setStreakMetricsTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streakMetricsTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_powerLogEventDictionary, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end