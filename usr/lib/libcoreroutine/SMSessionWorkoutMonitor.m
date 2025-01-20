@interface SMSessionWorkoutMonitor
- (BOOL)_shouldPromptEndWorkoutReminderTriggerWithReason:(unint64_t)a3;
- (BOOL)_shouldPromptNoMovementTrigger:(id)a3;
- (BOOL)endWorkoutReminderSettingEnabled;
- (BOOL)isWorkoutPaused;
- (NSDate)endWorkoutReminderDate;
- (NSDate)latestWorkoutManualPauseDate;
- (NSMutableDictionary)timerIdentifierToTimers;
- (OS_dispatch_queue)queue;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTHealthKitManager)healthKitManager;
- (RTLocationManager)locationManager;
- (RTPlatform)platform;
- (RTTimerManager)timerManager;
- (SMCMNoMovementMonitor)noMovementMonitor;
- (SMSessionConfiguration)sessionConfiguration;
- (SMSessionMetricManager)sessionMetricManager;
- (SMSessionStore)sessionStore;
- (SMSessionWorkoutMonitor)initWithQueue:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 locationManager:(id)a6 healthKitManager:(id)a7 platform:(id)a8 sessionMetricManager:(id)a9 sessionStore:(id)a10 timerManager:(id)a11 noMovementMonitor:(id)a12;
- (SMTriggerManagerProtocol)sessionMonitorDelegate;
- (double)_workoutEndReminderTimeout;
- (double)endWorkoutReminderTimeoutSettingDisabled;
- (double)endWorkoutReminderTimeoutSettingEnabled;
- (double)workoutManualPauseTimeout;
- (void)_addObservers;
- (void)_bootstrap;
- (void)_initializeTimerWithIdentifier:(id)a3 fireAfterDelay:(double)a4;
- (void)_modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4;
- (void)_onTimerExpiryForTimerIdentifier:(id)a3;
- (void)_onWorkoutTriggerControlUpdate:(unint64_t)a3;
- (void)_removeObservers;
- (void)_removeTimers;
- (void)_setup;
- (void)_startMonitoringWithConfiguration:(id)a3 handler:(id)a4;
- (void)_stopMonitoringWithHandler:(id)a3;
- (void)_tearDownTimerWithIdentifier:(id)a3;
- (void)modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4;
- (void)onHealthKitNotification:(id)a3;
- (void)onNoMovementMonitorNotification:(id)a3;
- (void)onWorkoutTriggerControlUpdate:(unint64_t)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setEndWorkoutReminderDate:(id)a3;
- (void)setEndWorkoutReminderSettingEnabled:(BOOL)a3;
- (void)setEndWorkoutReminderTimeoutSettingDisabled:(double)a3;
- (void)setEndWorkoutReminderTimeoutSettingEnabled:(double)a3;
- (void)setHealthKitManager:(id)a3;
- (void)setIsWorkoutPaused:(BOOL)a3;
- (void)setLatestWorkoutManualPauseDate:(id)a3;
- (void)setLocationManager:(id)a3;
- (void)setNoMovementMonitor:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSessionConfiguration:(id)a3;
- (void)setSessionMetricManager:(id)a3;
- (void)setSessionMonitorDelegate:(id)a3;
- (void)setSessionStore:(id)a3;
- (void)setTimerIdentifierToTimers:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)setWorkoutManualPauseTimeout:(double)a3;
- (void)setup;
- (void)startMonitoringWithConfiguration:(id)a3 handler:(id)a4;
- (void)stopMonitoringWithHandler:(id)a3;
@end

@implementation SMSessionWorkoutMonitor

- (SMSessionWorkoutMonitor)initWithQueue:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 locationManager:(id)a6 healthKitManager:(id)a7 platform:(id)a8 sessionMetricManager:(id)a9 sessionStore:(id)a10 timerManager:(id)a11 noMovementMonitor:(id)a12
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v39 = a4;
  id v18 = a4;
  id v40 = a5;
  id v46 = a5;
  id v42 = a6;
  id v19 = a6;
  id v41 = a7;
  id v20 = a7;
  id v43 = a8;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  id v44 = v17;
  v45 = v25;
  if (v17)
  {
    if (v18)
    {
      v26 = v46;
      if (v46)
      {
        if (v19)
        {
          if (v20)
          {
            if (v21)
            {
              if (v22)
              {
                if (v23)
                {
                  if (v24)
                  {
                    if (v25)
                    {
                      v27 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
                      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 136315138;
                        v50 = "-[SMSessionWorkoutMonitor initWithQueue:defaultsManager:distanceCalculator:locationManager"
                              ":healthKitManager:platform:sessionMetricManager:sessionStore:timerManager:noMovementMonitor:]";
                        _os_log_impl(&dword_1D9BFA000, v27, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
                      }

                      v48.receiver = self;
                      v48.super_class = (Class)SMSessionWorkoutMonitor;
                      v28 = [(SMSessionWorkoutMonitor *)&v48 init];
                      v29 = v28;
                      if (v28)
                      {
                        objc_storeStrong((id *)&v28->_queue, a3);
                        objc_storeStrong((id *)&v29->_defaultsManager, v39);
                        objc_storeStrong((id *)&v29->_distanceCalculator, v40);
                        objc_storeStrong((id *)&v29->_healthKitManager, v41);
                        objc_storeStrong((id *)&v29->_locationManager, v42);
                        objc_storeStrong((id *)&v29->_platform, v43);
                        objc_storeStrong((id *)&v29->_sessionMetricManager, a9);
                        objc_storeStrong((id *)&v29->_sessionStore, a10);
                        objc_storeStrong((id *)&v29->_timerManager, a11);
                        uint64_t v30 = objc_opt_new();
                        timerIdentifierToTimers = v29->_timerIdentifierToTimers;
                        v29->_timerIdentifierToTimers = (NSMutableDictionary *)v30;

                        objc_storeStrong((id *)&v29->_noMovementMonitor, a12);
                        [(SMSessionWorkoutMonitor *)v29 setup];
                      }
                      v32 = v29;
                      self = v32;
                      goto LABEL_39;
                    }
                    v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    {
                      *(_WORD *)buf = 0;
                      v36 = "Invalid parameter not satisfying: noMovementMonitor";
                      goto LABEL_37;
                    }
LABEL_38:

                    v32 = 0;
LABEL_39:
                    v34 = v44;
                    goto LABEL_40;
                  }
                  v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_38;
                  }
                  *(_WORD *)buf = 0;
                  v36 = "Invalid parameter not satisfying: timerManager";
                }
                else
                {
                  v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_38;
                  }
                  *(_WORD *)buf = 0;
                  v36 = "Invalid parameter not satisfying: sessionStore";
                }
              }
              else
              {
                v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_38;
                }
                *(_WORD *)buf = 0;
                v36 = "Invalid parameter not satisfying: sessionMetricManager";
              }
            }
            else
            {
              v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
                goto LABEL_38;
              }
              *(_WORD *)buf = 0;
              v36 = "Invalid parameter not satisfying: platform";
            }
          }
          else
          {
            v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
              goto LABEL_38;
            }
            *(_WORD *)buf = 0;
            v36 = "Invalid parameter not satisfying: healthKitManager";
          }
        }
        else
        {
          v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
            goto LABEL_38;
          }
          *(_WORD *)buf = 0;
          v36 = "Invalid parameter not satisfying: locationManager";
        }
      }
      else
      {
        v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          goto LABEL_38;
        }
        *(_WORD *)buf = 0;
        v36 = "Invalid parameter not satisfying: distanceCalculator";
      }
    }
    else
    {
      v35 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v26 = v46;
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
        goto LABEL_38;
      }
      *(_WORD *)buf = 0;
      v36 = "Invalid parameter not satisfying: defaultsManager";
    }
LABEL_37:
    _os_log_error_impl(&dword_1D9BFA000, v35, OS_LOG_TYPE_ERROR, v36, buf, 2u);
    goto LABEL_38;
  }
  v33 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D9BFA000, v33, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
  }

  v32 = 0;
  v34 = 0;
  v26 = v46;
LABEL_40:

  return v32;
}

- (void)setup
{
  v3 = [(SMSessionWorkoutMonitor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__SMSessionWorkoutMonitor_setup__block_invoke;
  block[3] = &unk_1E6B90E70;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __32__SMSessionWorkoutMonitor_setup__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setup];
}

- (void)_setup
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v3 = [(SMSessionWorkoutMonitor *)self defaultsManager];
  v4 = [v3 objectForKey:@"SMDefaultsSessionWorkoutMonitorEndWorkoutReminderDate"];
  endWorkoutReminderDate = self->_endWorkoutReminderDate;
  self->_endWorkoutReminderDate = v4;

  v6 = [(SMSessionWorkoutMonitor *)self defaultsManager];
  v7 = [v6 objectForKey:@"SMDefaultsSessionWorkoutMonitorEndWorkoutReminderTimeoutSettingEnabled" value:&unk_1F3453A68];
  [v7 doubleValue];
  self->_double endWorkoutReminderTimeoutSettingEnabled = v8;

  if (self->_endWorkoutReminderTimeoutSettingEnabled != 900.0)
  {
    v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      double endWorkoutReminderTimeoutSettingEnabled = self->_endWorkoutReminderTimeoutSettingEnabled;
      int v28 = 136316162;
      v29 = "-[SMSessionWorkoutMonitor _setup]";
      __int16 v30 = 2080;
      v31 = "overriding end workout reminder timeout - setting enabled";
      __int16 v32 = 2048;
      uint64_t v33 = 0x408C200000000000;
      __int16 v34 = 2048;
      double v35 = endWorkoutReminderTimeoutSettingEnabled;
      __int16 v36 = 2112;
      v37 = @"SMDefaultsSessionWorkoutMonitorEndWorkoutReminderTimeoutSettingEnabled";
      _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v28, 0x34u);
    }
  }
  v11 = [(SMSessionWorkoutMonitor *)self defaultsManager];
  v12 = [v11 objectForKey:@"SMDefaultsSessionWorkoutMonitorEndWorkoutReminderTimeoutSettingDisabled" value:&unk_1F3453A78];
  [v12 doubleValue];
  self->_double endWorkoutReminderTimeoutSettingDisabled = v13;

  if (self->_endWorkoutReminderTimeoutSettingDisabled != 3600.0)
  {
    v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      double endWorkoutReminderTimeoutSettingDisabled = self->_endWorkoutReminderTimeoutSettingDisabled;
      int v28 = 136316162;
      v29 = "-[SMSessionWorkoutMonitor _setup]";
      __int16 v30 = 2080;
      v31 = "overriding end workout reminder timeout - setting disabled";
      __int16 v32 = 2048;
      uint64_t v33 = 0x40AC200000000000;
      __int16 v34 = 2048;
      double v35 = endWorkoutReminderTimeoutSettingDisabled;
      __int16 v36 = 2112;
      v37 = @"SMDefaultsSessionWorkoutMonitorEndWorkoutReminderTimeoutSettingDisabled";
      _os_log_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v28, 0x34u);
    }
  }
  v16 = [(SMSessionWorkoutMonitor *)self defaultsManager];
  id v17 = [v16 objectForKey:@"SMDefaultsSessionWorkoutMonitorLatestWorkoutManualPauseDateKey"];
  latestWorkoutManualPauseDate = self->_latestWorkoutManualPauseDate;
  self->_latestWorkoutManualPauseDate = v17;

  id v19 = [(SMSessionWorkoutMonitor *)self defaultsManager];
  id v20 = [v19 objectForKey:@"SMDefaultsSessionWorkoutMonitorWorkoutManualPauseTimeout" value:&unk_1F3453A88];
  [v20 doubleValue];
  self->_double workoutManualPauseTimeout = v21;

  if (self->_workoutManualPauseTimeout != 7200.0)
  {
    id v22 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      double workoutManualPauseTimeout = self->_workoutManualPauseTimeout;
      int v28 = 136316162;
      v29 = "-[SMSessionWorkoutMonitor _setup]";
      __int16 v30 = 2080;
      v31 = "overriding workout manual pause timeout";
      __int16 v32 = 2048;
      uint64_t v33 = 0x40BC200000000000;
      __int16 v34 = 2048;
      double v35 = workoutManualPauseTimeout;
      __int16 v36 = 2112;
      v37 = @"SMDefaultsSessionWorkoutMonitorWorkoutManualPauseTimeout";
      _os_log_impl(&dword_1D9BFA000, v22, OS_LOG_TYPE_INFO, "%s, %s, original value, %.2f, overridden value, %.2f, by defaultsKey, %@", (uint8_t *)&v28, 0x34u);
    }
  }
  id v24 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    if (self->_endWorkoutReminderSettingEnabled) {
      id v25 = @"YES";
    }
    else {
      id v25 = @"NO";
    }
    v26 = [(NSDate *)self->_endWorkoutReminderDate stringFromDate];
    v27 = [(NSDate *)self->_latestWorkoutManualPauseDate stringFromDate];
    int v28 = 136315906;
    v29 = "-[SMSessionWorkoutMonitor _setup]";
    __int16 v30 = 2112;
    v31 = (const char *)v25;
    __int16 v32 = 2112;
    uint64_t v33 = (uint64_t)v26;
    __int16 v34 = 2112;
    double v35 = *(double *)&v27;
    _os_log_impl(&dword_1D9BFA000, v24, OS_LOG_TYPE_INFO, "%s, endWorkoutReminderSettingEnabled, %@, endWorkoutReminderDate, %@, latestWorkoutManualPauseDate, %@", (uint8_t *)&v28, 0x2Au);
  }
}

- (void)_addObservers
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[SMSessionWorkoutMonitor _addObservers]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  v4 = [(SMSessionWorkoutMonitor *)self noMovementMonitor];
  v5 = +[RTNotification notificationName];
  [v4 addObserver:self selector:sel_onNoMovementMonitorNotification_ name:v5];
}

- (void)_removeObservers
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[SMSessionWorkoutMonitor _removeObservers]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  v4 = [(SMSessionWorkoutMonitor *)self healthKitManager];
  [v4 removeObserver:self];

  v5 = [(SMSessionWorkoutMonitor *)self noMovementMonitor];
  [v5 removeObserver:self];
}

- (void)_bootstrap
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(SMSessionWorkoutMonitor *)self sessionConfiguration];
    int v5 = 136315394;
    int v6 = "-[SMSessionWorkoutMonitor _bootstrap]";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, bootstrapping not yet supported, called with configuration, %@", (uint8_t *)&v5, 0x16u);
  }
}

- (void)startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SMSessionWorkoutMonitor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__SMSessionWorkoutMonitor_startMonitoringWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __68__SMSessionWorkoutMonitor_startMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startMonitoringWithConfiguration:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_startMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if ([v6 sessionType] != 4)
  {
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v46 = "-[SMSessionWorkoutMonitor _startMonitoringWithConfiguration:handler:]";
      __int16 v47 = 1024;
      LODWORD(v48) = 209;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration.sessionType == SMSessionTypeWorkoutBound (in %s:%d)", buf, 0x12u);
    }
  }
  [(SMSessionWorkoutMonitor *)self _addObservers];
  [(SMSessionWorkoutMonitor *)self setSessionConfiguration:v6];
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v46 = "-[SMSessionWorkoutMonitor _startMonitoringWithConfiguration:handler:]";
    __int16 v47 = 2112;
    id v48 = v6;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, configuration, %@", buf, 0x16u);
  }

  if (v7)
  {
    id v10 = +[SMDateUtility date];
    v11 = [(SMSessionWorkoutMonitor *)self sessionConfiguration];
    id v12 = [v11 sessionStartDate];
    int v13 = [v12 isAfterDate:v10];

    if (v13)
    {
      v14 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v39 = [(SMSessionWorkoutMonitor *)self sessionConfiguration];
        id v40 = [v39 sessionStartDate];
        id v41 = [v40 stringFromDate];
        id v42 = [v10 stringFromDate];
        *(_DWORD *)buf = 136315650;
        id v46 = "-[SMSessionWorkoutMonitor _startMonitoringWithConfiguration:handler:]";
        __int16 v47 = 2112;
        id v48 = v41;
        __int16 v49 = 2112;
        v50 = v42;
        _os_log_error_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_ERROR, "%s, sessionStartDate, %@, larger than currentDate, %@", buf, 0x20u);
      }
      v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v16 = *MEMORY[0x1E4F5CFE8];
      uint64_t v43 = *MEMORY[0x1E4F28568];
      id v44 = @"sessionStartDate is larger than currentDate";
      id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
      id v18 = [v15 errorWithDomain:v16 code:7 userInfo:v17];

      v7[2](v7, v18);
      goto LABEL_27;
    }
    uint64_t v19 = [(SMSessionWorkoutMonitor *)self endWorkoutReminderDate];
    if (v19)
    {
      id v20 = (void *)v19;
      double v21 = [(SMSessionWorkoutMonitor *)self endWorkoutReminderDate];
      id v22 = [(SMSessionWorkoutMonitor *)self sessionConfiguration];
      id v23 = [v22 sessionStartDate];
      if ([v21 isAfterDate:v23])
      {
        id v24 = [(SMSessionWorkoutMonitor *)self endWorkoutReminderDate];
        int v25 = [v24 isBeforeDate:v10];

        if (!v25) {
          goto LABEL_20;
        }
        [(SMSessionWorkoutMonitor *)self _workoutEndReminderTimeout];
        double v27 = v26;
        id v20 = [(SMSessionWorkoutMonitor *)self endWorkoutReminderDate];
        [v10 timeIntervalSinceDate:v20];
        [(SMSessionWorkoutMonitor *)self _initializeTimerWithIdentifier:@"com.apple.routined.SMSessionWorkoutMonitor.workoutEndReminderTimerIdentifier" fireAfterDelay:v27 - v28];
      }
      else
      {
      }
    }
LABEL_20:
    uint64_t v29 = [(SMSessionWorkoutMonitor *)self latestWorkoutManualPauseDate];
    if (v29)
    {
      __int16 v30 = (void *)v29;
      v31 = [(SMSessionWorkoutMonitor *)self latestWorkoutManualPauseDate];
      __int16 v32 = [(SMSessionWorkoutMonitor *)self sessionConfiguration];
      uint64_t v33 = [v32 sessionStartDate];
      if (![v31 isAfterDate:v33])
      {

        goto LABEL_25;
      }
      __int16 v34 = [(SMSessionWorkoutMonitor *)self latestWorkoutManualPauseDate];
      int v35 = [v34 isBeforeDate:v10];

      if (v35)
      {
        [(SMSessionWorkoutMonitor *)self workoutManualPauseTimeout];
        double v37 = v36;
        __int16 v30 = [(SMSessionWorkoutMonitor *)self latestWorkoutManualPauseDate];
        [v10 timeIntervalSinceDate:v30];
        [(SMSessionWorkoutMonitor *)self _initializeTimerWithIdentifier:@"com.apple.routined.SMSessionWorkoutMonitor.workoutManualPauseTimerIdentifier" fireAfterDelay:v37 - v38];
LABEL_25:
      }
    }
    [(SMSessionWorkoutMonitor *)self setSessionConfiguration:v6];
    v7[2](v7, 0);
    goto LABEL_27;
  }
  id v10 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v46 = "-[SMSessionWorkoutMonitor _startMonitoringWithConfiguration:handler:]";
    _os_log_error_impl(&dword_1D9BFA000, v10, OS_LOG_TYPE_ERROR, "%s, invalid handler", buf, 0xCu);
  }
LABEL_27:
}

- (void)stopMonitoringWithHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(SMSessionWorkoutMonitor *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__SMSessionWorkoutMonitor_stopMonitoringWithHandler___block_invoke;
  v7[3] = &unk_1E6B90CE0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __53__SMSessionWorkoutMonitor_stopMonitoringWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopMonitoringWithHandler:*(void *)(a1 + 40)];
}

- (void)_stopMonitoringWithHandler:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  int v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315138;
    id v9 = "-[SMSessionWorkoutMonitor _stopMonitoringWithHandler:]";
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
  }

  [(SMSessionWorkoutMonitor *)self _removeObservers];
  [(SMSessionWorkoutMonitor *)self _removeTimers];
  id v6 = [(SMSessionWorkoutMonitor *)self defaultsManager];
  [v6 setObject:0 forKey:@"SMDefaultsSessionWorkoutMonitorEndWorkoutReminderDate"];

  id v7 = [(SMSessionWorkoutMonitor *)self defaultsManager];
  [v7 setObject:0 forKey:@"SMDefaultsSessionWorkoutMonitorLatestWorkoutManualPauseDateKey"];

  if (v4) {
    v4[2](v4, 0);
  }
}

- (void)onWorkoutTriggerControlUpdate:(unint64_t)a3
{
  int v5 = [(SMSessionWorkoutMonitor *)self queue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__SMSessionWorkoutMonitor_onWorkoutTriggerControlUpdate___block_invoke;
  v6[3] = &unk_1E6B91248;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);
}

uint64_t __57__SMSessionWorkoutMonitor_onWorkoutTriggerControlUpdate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onWorkoutTriggerControlUpdate:*(void *)(a1 + 40)];
}

- (void)_onWorkoutTriggerControlUpdate:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    id v17 = "-[SMSessionWorkoutMonitor _onWorkoutTriggerControlUpdate:]";
    __int16 v18 = 2048;
    unint64_t v19 = a3;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, control, %lu", (uint8_t *)&v16, 0x16u);
  }

  if (a3 == 2)
  {
    [(SMSessionWorkoutMonitor *)self setIsWorkoutPaused:0];
    v15 = [(SMSessionWorkoutMonitor *)self defaultsManager];
    [v15 setObject:0 forKey:@"SMDefaultsSessionWorkoutMonitorLatestWorkoutManualPauseDateKey"];

    v14 = @"com.apple.routined.SMSessionWorkoutMonitor.workoutManualPauseTimerIdentifier";
  }
  else
  {
    if (a3 != 1) {
      return;
    }
    [(SMSessionWorkoutMonitor *)self setIsWorkoutPaused:1];
    uint64_t v6 = [(SMSessionWorkoutMonitor *)self latestWorkoutManualPauseDate];
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = (void *)v6;
    int v8 = [(SMSessionWorkoutMonitor *)self latestWorkoutManualPauseDate];
    id v9 = [(SMSessionWorkoutMonitor *)self sessionConfiguration];
    uint64_t v10 = [v9 sessionStartDate];
    int v11 = [v8 isBeforeDate:v10];

    if (v11)
    {
LABEL_7:
      id v12 = [(SMSessionWorkoutMonitor *)self defaultsManager];
      int v13 = [MEMORY[0x1E4F1C9C8] date];
      [v12 setObject:v13 forKey:@"SMDefaultsSessionWorkoutMonitorLatestWorkoutManualPauseDateKey"];

      [(SMSessionWorkoutMonitor *)self _initializeTimerWithIdentifier:@"com.apple.routined.SMSessionWorkoutMonitor.workoutManualPauseTimerIdentifier" fireAfterDelay:self->_workoutManualPauseTimeout];
    }
    v14 = @"com.apple.routined.SMSessionWorkoutMonitor.workoutEndReminderTimerIdentifier";
  }
  [(SMSessionWorkoutMonitor *)self _tearDownTimerWithIdentifier:v14];
}

- (void)modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(SMSessionWorkoutMonitor *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__SMSessionWorkoutMonitor_modifyMonitoringWithConfiguration_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __69__SMSessionWorkoutMonitor_modifyMonitoringWithConfiguration_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _modifyMonitoringWithConfiguration:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

- (void)_modifyMonitoringWithConfiguration:(id)a3 handler:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 sessionType] != 4)
  {
    int v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      id v24 = "-[SMSessionWorkoutMonitor _modifyMonitoringWithConfiguration:handler:]";
      __int16 v25 = 1024;
      LODWORD(v26) = 342;
      _os_log_error_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: configuration.sessionType == SMSessionTypeWorkoutBound (in %s:%d)", buf, 0x12u);
    }
  }
  id v9 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v24 = "-[SMSessionWorkoutMonitor _modifyMonitoringWithConfiguration:handler:]";
    __int16 v25 = 2112;
    id v26 = v6;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "%s, configuration, %@", buf, 0x16u);
  }

  id v10 = [(SMSessionWorkoutMonitor *)self sessionConfiguration];
  int v11 = [v10 isEqual:v6];

  if (v11)
  {
    id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v24 = "-[SMSessionWorkoutMonitor _modifyMonitoringWithConfiguration:handler:]";
      _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%s, Configuration did not change", buf, 0xCu);
    }
  }
  else
  {
    id v13 = [(SMSessionWorkoutMonitor *)self sessionConfiguration];
    v14 = [v13 sessionID];
    v15 = [v6 sessionID];
    char v16 = [v14 isEqual:v15];

    if (v16)
    {
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __70__SMSessionWorkoutMonitor__modifyMonitoringWithConfiguration_handler___block_invoke;
      v21[3] = &unk_1E6B90C18;
      id v17 = v7;
      id v22 = v17;
      [(SMSessionWorkoutMonitor *)self _stopMonitoringWithHandler:v21];
      [(SMSessionWorkoutMonitor *)self _startMonitoringWithConfiguration:v6 handler:v17];
      id v12 = v22;
    }
    else
    {
      id v12 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __int16 v18 = [(SMSessionWorkoutMonitor *)self sessionConfiguration];
        unint64_t v19 = [v18 sessionID];
        uint64_t v20 = [v6 sessionID];
        *(_DWORD *)buf = 136315650;
        id v24 = "-[SMSessionWorkoutMonitor _modifyMonitoringWithConfiguration:handler:]";
        __int16 v25 = 2112;
        id v26 = v19;
        __int16 v27 = 2112;
        double v28 = v20;
        _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "%s, Configuartion modified for wrong session, current config sessionID, %@, modified config sessionID, %@", buf, 0x20u);
      }
    }
  }
}

void __70__SMSessionWorkoutMonitor__modifyMonitoringWithConfiguration_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[SMSessionWorkoutMonitor _modifyMonitoringWithConfiguration:handler:]_block_invoke";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "%s, modify workout bound session with configuration failed in stop monitoring with error, %@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)onHealthKitNotification:(id)a3
{
  id v4 = a3;
  int v5 = [(SMSessionWorkoutMonitor *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__SMSessionWorkoutMonitor_onHealthKitNotification___block_invoke;
  v7[3] = &unk_1E6B90BF0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __51__SMSessionWorkoutMonitor_onHealthKitNotification___block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v2 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v25 = 136315394;
    id v26 = "-[SMSessionWorkoutMonitor onHealthKitNotification:]_block_invoke";
    __int16 v27 = 2112;
    uint64_t v28 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "%s, processing, %@", (uint8_t *)&v25, 0x16u);
  }

  id v4 = [*(id *)(a1 + 32) name];
  int v5 = +[RTNotification notificationName];
  int v6 = [v4 isEqualToString:v5];

  if (v6) {
    goto LABEL_4;
  }
  id v10 = [*(id *)(a1 + 32) name];
  int v11 = +[RTNotification notificationName];
  int v12 = [v10 isEqualToString:v11];

  id v13 = *(void **)(a1 + 32);
  if (v12)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "_shouldPromptEndWorkoutReminderTriggerWithReason:", objc_msgSend(v13, "reason")))
    {
      v14 = [SMTriggerNotification alloc];
      v15 = +[SMDateUtility date];
      char v16 = [(SMTriggerNotification *)v14 initWithTriggerCategory:20 SOSState:1 triggerName:@"SMTriggerWorkout" date:v15 details:MEMORY[0x1E4F1CC08]];

      id v17 = [*(id *)(a1 + 40) sessionMonitorDelegate];
      [v17 onTriggerNotification:v16];
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  __int16 v18 = [v13 name];
  unint64_t v19 = +[RTNotification notificationName];
  int v20 = [v18 isEqualToString:v19];

  if (!v20)
  {
    double v21 = [*(id *)(a1 + 32) name];
    id v22 = +[RTNotification notificationName];
    int v23 = [v21 isEqualToString:v22];

    if (!v23)
    {
      char v16 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        goto LABEL_15;
      }
      id v17 = [*(id *)(a1 + 32) name];
      int v25 = 138412290;
      id v26 = (const char *)v17;
      _os_log_error_impl(&dword_1D9BFA000, v16, OS_LOG_TYPE_ERROR, "unhandled notification, %@", (uint8_t *)&v25, 0xCu);
LABEL_8:

LABEL_15:
      return;
    }
LABEL_13:
    id v24 = [*(id *)(a1 + 40) defaultsManager];
    [v24 setObject:0 forKey:@"SMDefaultsSessionWorkoutMonitorEndWorkoutReminderDate"];

    [*(id *)(a1 + 40) _tearDownTimerWithIdentifier:@"com.apple.routined.SMSessionWorkoutMonitor.workoutEndReminderTimerIdentifier"];
    return;
  }
  if (([*(id *)(a1 + 40) endWorkoutReminderSettingEnabled] & 1) == 0)
  {
LABEL_4:
    __int16 v7 = [*(id *)(a1 + 40) defaultsManager];
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    [v7 setObject:v8 forKey:@"SMDefaultsSessionWorkoutMonitorEndWorkoutReminderDate"];

    uint64_t v9 = *(void **)(a1 + 40);
    [v9 _workoutEndReminderTimeout];
    [v9 _initializeTimerWithIdentifier:@"com.apple.routined.SMSessionWorkoutMonitor.workoutEndReminderTimerIdentifier" fireAfterDelay:0];
  }
}

- (void)onNoMovementMonitorNotification:(id)a3
{
  id v4 = a3;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  id v10 = __59__SMSessionWorkoutMonitor_onNoMovementMonitorNotification___block_invoke;
  int v11 = &unk_1E6B90BF0;
  id v12 = v4;
  id v13 = self;
  id v5 = v4;
  int v6 = (void *)MEMORY[0x1E016DB00](&v8);
  __int16 v7 = [(SMSessionWorkoutMonitor *)self queue];
  dispatch_async(v7, v6);
}

void __59__SMSessionWorkoutMonitor_onNoMovementMonitorNotification___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) name];
  uint64_t v3 = +[RTNotification notificationName];
  int v4 = [v2 isEqualToString:v3];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) state];
    int v6 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315394;
      id v12 = "-[SMSessionWorkoutMonitor onNoMovementMonitorNotification:]_block_invoke";
      __int16 v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_DEFAULT, "%s, onNoMovementMonitorNotification, %@", (uint8_t *)&v11, 0x16u);
    }

    if ([*(id *)(a1 + 40) _shouldPromptNoMovementTrigger:v5])
    {
      __int16 v7 = [SMTriggerNotification alloc];
      uint64_t v8 = +[SMDateUtility date];
      uint64_t v9 = [(SMTriggerNotification *)v7 initWithTriggerCategory:21 SOSState:1 triggerName:@"SMTriggerWorkout" date:v8 details:MEMORY[0x1E4F1CC08]];

      id v10 = [*(id *)(a1 + 40) sessionMonitorDelegate];
      [v10 onTriggerNotification:v9];
    }
  }
}

- (BOOL)_shouldPromptNoMovementTrigger:(id)a3
{
  id v4 = a3;
  BOOL v5 = !-[SMSessionWorkoutMonitor isWorkoutPaused](self, "isWorkoutPaused") && [v4 state] == 2;

  return v5;
}

- (BOOL)_shouldPromptEndWorkoutReminderTriggerWithReason:(unint64_t)a3
{
  return a3 == 5;
}

- (void)_initializeTimerWithIdentifier:(id)a3 fireAfterDelay:(double)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  __int16 v7 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    int v25 = "-[SMSessionWorkoutMonitor _initializeTimerWithIdentifier:fireAfterDelay:]";
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2048;
    double v29 = a4;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "%s, timerIdentifier, %@, delay, %.1f", buf, 0x20u);
  }

  objc_initWeak(&location, self);
  uint64_t v8 = +[SMDateUtility date];
  timerManager = self->_timerManager;
  id v10 = [(SMSessionWorkoutMonitor *)self queue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__SMSessionWorkoutMonitor__initializeTimerWithIdentifier_fireAfterDelay___block_invoke;
  v19[3] = &unk_1E6B9A160;
  id v11 = v6;
  id v20 = v11;
  id v12 = v8;
  id v21 = v12;
  objc_copyWeak(&v22, &location);
  __int16 v13 = [(RTTimerManager *)timerManager xpcTimerAlarmWithIdentifier:v11 queue:v10 handler:v19];

  v14 = [(SMSessionWorkoutMonitor *)self timerIdentifierToTimers];
  [v14 setObject:v13 forKey:v11];

  uint64_t v15 = [v12 dateByAddingTimeInterval:a4];
  id v18 = 0;
  [v13 fireWithDate:v15 error:&v18];
  id v16 = v18;

  if (v16)
  {
    id v17 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      int v25 = "-[SMSessionWorkoutMonitor _initializeTimerWithIdentifier:fireAfterDelay:]";
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_error_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_ERROR, "%s, error in fire timer, %@", buf, 0x16u);
    }
  }
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

void __73__SMSessionWorkoutMonitor__initializeTimerWithIdentifier_fireAfterDelay___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = +[SMDateUtility date];
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    [v2 timeIntervalSinceDate:*(void *)(a1 + 40)];
    int v7 = 136315650;
    uint64_t v8 = "-[SMSessionWorkoutMonitor _initializeTimerWithIdentifier:fireAfterDelay:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s, timer fired, timerIdentifier, %@, %.2f since created", (uint8_t *)&v7, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _onTimerExpiryForTimerIdentifier:*(void *)(a1 + 32)];
}

- (void)_onTimerExpiryForTimerIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (__CFString *)a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315394;
    uint64_t v15 = "-[SMSessionWorkoutMonitor _onTimerExpiryForTimerIdentifier:]";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, %@", (uint8_t *)&v14, 0x16u);
  }

  id v6 = [(SMSessionWorkoutMonitor *)self sessionMonitorDelegate];
  if (v4 == @"com.apple.routined.SMSessionWorkoutMonitor.workoutEndReminderTimerIdentifier")
  {
    uint64_t v12 = [SMTriggerNotification alloc];
    uint64_t v8 = +[SMDateUtility date];
    uint64_t v9 = MEMORY[0x1E4F1CC08];
    uint64_t v10 = v12;
    uint64_t v11 = 20;
    goto LABEL_7;
  }
  if (v4 == @"com.apple.routined.SMSessionWorkoutMonitor.workoutManualPauseTimerIdentifier")
  {
    int v7 = [SMTriggerNotification alloc];
    uint64_t v8 = +[SMDateUtility date];
    uint64_t v9 = MEMORY[0x1E4F1CC08];
    uint64_t v10 = v7;
    uint64_t v11 = 22;
LABEL_7:
    uint64_t v13 = [(SMTriggerNotification *)v10 initWithTriggerCategory:v11 SOSState:1 triggerName:@"SMTriggerWorkout" date:v8 details:v9];

    [v6 onTriggerNotification:v13];
  }
  [(SMSessionWorkoutMonitor *)self _tearDownTimerWithIdentifier:v4];
}

- (void)_tearDownTimerWithIdentifier:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    uint64_t v12 = "-[SMSessionWorkoutMonitor _tearDownTimerWithIdentifier:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "%s, %@", (uint8_t *)&v11, 0x16u);
  }

  id v6 = [(SMSessionWorkoutMonitor *)self timerIdentifierToTimers];
  int v7 = [v6 objectForKey:v4];

  if (v7)
  {
    uint64_t v8 = [(SMSessionWorkoutMonitor *)self timerIdentifierToTimers];
    uint64_t v9 = [v8 objectForKey:v4];
    [v9 invalidate];

    uint64_t v10 = [(SMSessionWorkoutMonitor *)self timerIdentifierToTimers];
    [v10 removeObjectForKey:v4];
  }
}

- (void)_removeTimers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "-[SMSessionWorkoutMonitor _removeTimers]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(SMSessionWorkoutMonitor *)self timerIdentifierToTimers];
  uint64_t v5 = [v4 allKeys];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        int v11 = [(SMSessionWorkoutMonitor *)self timerIdentifierToTimers];
        uint64_t v12 = [v11 objectForKeyedSubscript:v10];
        [v12 invalidate];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  __int16 v13 = [(SMSessionWorkoutMonitor *)self timerIdentifierToTimers];
  [v13 removeAllObjects];

  [(SMSessionWorkoutMonitor *)self setTimerIdentifierToTimers:0];
}

- (double)_workoutEndReminderTimeout
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _rt_log_facility_get_os_log(RTLogFacilitySafetyMonitor);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[SMSessionWorkoutMonitor _workoutEndReminderTimeout]";
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v5, 0xCu);
  }

  if ([(SMSessionWorkoutMonitor *)self endWorkoutReminderSettingEnabled]) {
    [(SMSessionWorkoutMonitor *)self endWorkoutReminderTimeoutSettingEnabled];
  }
  else {
    [(SMSessionWorkoutMonitor *)self endWorkoutReminderTimeoutSettingDisabled];
  }
  return result;
}

- (SMTriggerManagerProtocol)sessionMonitorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->sessionMonitorDelegate);

  return (SMTriggerManagerProtocol *)WeakRetained;
}

- (void)setSessionMonitorDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTHealthKitManager)healthKitManager
{
  return self->_healthKitManager;
}

- (void)setHealthKitManager:(id)a3
{
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (SMSessionMetricManager)sessionMetricManager
{
  return self->_sessionMetricManager;
}

- (void)setSessionMetricManager:(id)a3
{
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
}

- (SMSessionConfiguration)sessionConfiguration
{
  return self->_sessionConfiguration;
}

- (void)setSessionConfiguration:(id)a3
{
}

- (NSDate)endWorkoutReminderDate
{
  return self->_endWorkoutReminderDate;
}

- (void)setEndWorkoutReminderDate:(id)a3
{
}

- (NSDate)latestWorkoutManualPauseDate
{
  return self->_latestWorkoutManualPauseDate;
}

- (void)setLatestWorkoutManualPauseDate:(id)a3
{
}

- (NSMutableDictionary)timerIdentifierToTimers
{
  return self->_timerIdentifierToTimers;
}

- (void)setTimerIdentifierToTimers:(id)a3
{
}

- (BOOL)isWorkoutPaused
{
  return self->_isWorkoutPaused;
}

- (void)setIsWorkoutPaused:(BOOL)a3
{
  self->_isWorkoutPaused = a3;
}

- (BOOL)endWorkoutReminderSettingEnabled
{
  return self->_endWorkoutReminderSettingEnabled;
}

- (void)setEndWorkoutReminderSettingEnabled:(BOOL)a3
{
  self->_endWorkoutReminderSettingEnabled = a3;
}

- (double)endWorkoutReminderTimeoutSettingEnabled
{
  return self->_endWorkoutReminderTimeoutSettingEnabled;
}

- (void)setEndWorkoutReminderTimeoutSettingEnabled:(double)a3
{
  self->_double endWorkoutReminderTimeoutSettingEnabled = a3;
}

- (double)endWorkoutReminderTimeoutSettingDisabled
{
  return self->_endWorkoutReminderTimeoutSettingDisabled;
}

- (void)setEndWorkoutReminderTimeoutSettingDisabled:(double)a3
{
  self->_double endWorkoutReminderTimeoutSettingDisabled = a3;
}

- (double)workoutManualPauseTimeout
{
  return self->_workoutManualPauseTimeout;
}

- (void)setWorkoutManualPauseTimeout:(double)a3
{
  self->_double workoutManualPauseTimeout = a3;
}

- (SMCMNoMovementMonitor)noMovementMonitor
{
  return self->_noMovementMonitor;
}

- (void)setNoMovementMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noMovementMonitor, 0);
  objc_storeStrong((id *)&self->_timerIdentifierToTimers, 0);
  objc_storeStrong((id *)&self->_latestWorkoutManualPauseDate, 0);
  objc_storeStrong((id *)&self->_endWorkoutReminderDate, 0);
  objc_storeStrong((id *)&self->_sessionConfiguration, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_sessionMetricManager, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_healthKitManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->sessionMonitorDelegate);
}

@end