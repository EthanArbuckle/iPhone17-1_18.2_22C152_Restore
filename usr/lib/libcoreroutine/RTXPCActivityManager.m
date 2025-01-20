@interface RTXPCActivityManager
+ (BOOL)xpcActivitySetStateActivity:(id)a3 state:(int64_t)a4;
+ (BOOL)xpcActivityShouldDeferActivity:(id)a3;
+ (id)criteriaDictionaryWithCriteria:(id)a3;
+ (id)lastAttemptDateKeyForIdentifier:(id)a3;
+ (id)lastCompleteDateKeyForIdentifier:(id)a3;
+ (id)xpcActivityCopyCriteriaActivity:(id)a3;
+ (int64_t)xpcActivityGetStateActivity:(id)a3;
+ (void)xpcActivityRegisterIdentifier:(const char *)a3 criteria:(id)a4 handler:(id)a5;
+ (void)xpcActivitySetCriteriaActivity:(id)a3 criteria:(id)a4;
+ (void)xpcActivityUnregisterIdentifier:(const char *)a3;
- (NSMutableArray)pendingTasks;
- (NSMutableDictionary)registrants;
- (NSString)identifier;
- (RTDefaultsManager)defaultsManager;
- (RTDiagnostics)diagnostics;
- (RTTimer)timer;
- (RTTimerManager)timerManager;
- (RTXPCActivityManager)init;
- (RTXPCActivityManager)initWithDefaultsManager:(id)a3 diagnostics:(id)a4 identifier:(id)a5;
- (RTXPCActivityManager)initWithDefaultsManager:(id)a3 diagnostics:(id)a4 timerManager:(id)a5 identifier:(id)a6;
- (RTXPCActivityTask)runningTask;
- (id)_lastAttemptDateForIdentifier:(id)a3;
- (id)_lastCompleteDateForIdentifier:(id)a3;
- (id)_registerRegistrant:(id)a3;
- (void)_onDeferCheckTimer;
- (void)_registerActivityWithIdentifier:(id)a3 criteria:(id)a4 handler:(id)a5;
- (void)_runRegistrantWithIdentifier:(id)a3 activity:(id)a4 handler:(id)a5;
- (void)_scheduleNextTask;
- (void)_setup;
- (void)_shutdownWithHandler:(id)a3;
- (void)_startDeferCheckTimer;
- (void)_stopDeferCheckTimer;
- (void)_unregisterActivityWithIdentifier:(id)a3 handler:(id)a4;
- (void)_updateLastAttemptDateForIdentifier:(id)a3;
- (void)_updateLastCompleteDateForIdentifier:(id)a3;
- (void)deleteDefaultsForIdentifier:(id)a3;
- (void)registerActivityWithIdentifier:(id)a3 criteria:(id)a4 handler:(id)a5;
- (void)runRegistrantWithIdentifier:(id)a3 activity:(id)a4 handler:(id)a5;
- (void)setDefaultsManager:(id)a3;
- (void)setDiagnostics:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setPendingTasks:(id)a3;
- (void)setRegistrants:(id)a3;
- (void)setRunningTask:(id)a3;
- (void)setTimer:(id)a3;
- (void)setTimerManager:(id)a3;
- (void)unregisterActivityWithIdentifier:(id)a3 handler:(id)a4;
@end

@implementation RTXPCActivityManager

- (RTXPCActivityManager)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_diagnostics_timerManager_identifier_);
}

- (RTXPCActivityManager)initWithDefaultsManager:(id)a3 diagnostics:(id)a4 identifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  v12 = [(RTXPCActivityManager *)self initWithDefaultsManager:v10 diagnostics:v9 timerManager:v11 identifier:v8];

  return v12;
}

- (RTXPCActivityManager)initWithDefaultsManager:(id)a3 diagnostics:(id)a4 timerManager:(id)a5 identifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = v14;
  if (!v11)
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: defaultsManager";
LABEL_16:
    _os_log_error_impl(&dword_1D9BFA000, v23, OS_LOG_TYPE_ERROR, v24, buf, 2u);
    goto LABEL_17;
  }
  if (!v12)
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: diagnostics";
    goto LABEL_16;
  }
  if (!v13)
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    v24 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_16;
  }
  if (!v14)
  {
    v23 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v24 = "Invalid parameter not satisfying: identifer";
      goto LABEL_16;
    }
LABEL_17:

    v22 = 0;
    goto LABEL_18;
  }
  v26.receiver = self;
  v26.super_class = (Class)RTXPCActivityManager;
  v16 = [(RTNotifier *)&v26 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_defaultsManager, a3);
    objc_storeStrong((id *)&v17->_diagnostics, a4);
    objc_storeStrong((id *)&v17->_timerManager, a5);
    uint64_t v18 = objc_opt_new();
    registrants = v17->_registrants;
    v17->_registrants = (NSMutableDictionary *)v18;

    uint64_t v20 = objc_opt_new();
    pendingTasks = v17->_pendingTasks;
    v17->_pendingTasks = (NSMutableArray *)v20;

    objc_storeStrong((id *)&v17->_identifier, a6);
    [(RTService *)v17 setup];
  }
  self = v17;
  v22 = self;
LABEL_18:

  return v22;
}

+ (id)lastAttemptDateKeyForIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = [@"XPCActivityLastAttemptDate" stringByAppendingPathExtension:];
  }
  else
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      v7 = "+[RTXPCActivityManager lastAttemptDateKeyForIdentifier:]";
      __int16 v8 = 1024;
      int v9 = 377;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }

    v3 = 0;
  }

  return v3;
}

+ (id)lastCompleteDateKeyForIdentifier:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = [@"XPCActivityLastCompleteDate" stringByAppendingPathExtension:];
  }
  else
  {
    v4 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      v7 = "+[RTXPCActivityManager lastCompleteDateKeyForIdentifier:]";
      __int16 v8 = 1024;
      int v9 = 388;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", (uint8_t *)&v6, 0x12u);
    }

    v3 = 0;
  }

  return v3;
}

- (void)deleteDefaultsForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(RTXPCActivityManager *)self defaultsManager];
    int v6 = +[RTXPCActivityManager lastAttemptDateKeyForIdentifier:v4];
    [v5 setObject:0 forKey:v6];

    v7 = [(RTXPCActivityManager *)self defaultsManager];
    __int16 v8 = +[RTXPCActivityManager lastCompleteDateKeyForIdentifier:v4];
    [v7 setObject:0 forKey:v8];
  }
  else
  {
    v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v9 = 0;
      _os_log_error_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", v9, 2u);
    }
  }
}

- (void)_setup
{
}

- (void)_shutdownWithHandler:(id)a3
{
  id v6 = a3;
  [(RTTimer *)self->_timer invalidate];
  timer = self->_timer;
  self->_timer = 0;

  v5 = v6;
  if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
    v5 = v6;
  }
}

- (id)_lastAttemptDateForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() lastAttemptDateKeyForIdentifier:v4];

  id v6 = [(RTXPCActivityManager *)self defaultsManager];
  v7 = [v6 objectForKey:v5];

  return v7;
}

- (void)_updateLastAttemptDateForIdentifier:(id)a3
{
  id v4 = a3;
  id v7 = [(id)objc_opt_class() lastAttemptDateKeyForIdentifier:v4];

  v5 = [(RTXPCActivityManager *)self defaultsManager];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v5 setObject:v6 forKey:v7];
}

- (id)_lastCompleteDateForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() lastCompleteDateKeyForIdentifier:v4];

  id v6 = [(RTXPCActivityManager *)self defaultsManager];
  id v7 = [v6 objectForKey:v5];

  return v7;
}

- (void)_updateLastCompleteDateForIdentifier:(id)a3
{
  id v4 = a3;
  id v7 = [(id)objc_opt_class() lastCompleteDateKeyForIdentifier:v4];

  v5 = [(RTXPCActivityManager *)self defaultsManager];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  [v5 setObject:v6 forKey:v7];
}

+ (id)criteriaDictionaryWithCriteria:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    [v3 interval];
    double v6 = v5;
    if (v5 > 0.0)
    {
      id v7 = (const char *)*MEMORY[0x1E4F141C8];
      [v3 interval];
      xpc_dictionary_set_int64(v4, v7, (uint64_t)v8);
    }
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F142F8], v6 > 0.0);
    int v9 = (const char *)*MEMORY[0x1E4F14170];
    [v3 delay];
    xpc_dictionary_set_int64(v4, v9, (uint64_t)v10);
    id v11 = (const char *)*MEMORY[0x1E4F141A8];
    [v3 gracePeriod];
    xpc_dictionary_set_int64(v4, v11, (uint64_t)v12);
    id v13 = (const char *)*MEMORY[0x1E4F142C8];
    id v14 = (const char *)[objc_opt_class() convertPriority:[v3 priority]];
    xpc_dictionary_set_string(v4, v13, v14);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14138], [v3 allowBattery]);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14338], [v3 requireNetworkConnectivity]);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14330], [v3 requireInexpensiveNetworkConnectivity]);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F142B0], [v3 powerNap]);
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F142A0], [v3 networkTransferUploadSize]);
    xpc_dictionary_set_int64(v4, (const char *)*MEMORY[0x1E4F14260], [v3 networkTransferDownloadSize]);
    v15 = [v3 requireBatteryLevel];

    if (v15)
    {
      v16 = (const char *)*MEMORY[0x1E4F14328];
      v17 = [v3 requireBatteryLevel];
      xpc_dictionary_set_int64(v4, v16, [v17 integerValue]);

      xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2020000000;
      v19 = (id *)_MergedGlobals_4;
      uint64_t v30 = _MergedGlobals_4;
      if (!_MergedGlobals_4)
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __get_DASCTSMinBatteryLevelKeySymbolLoc_block_invoke;
        v26[3] = &unk_1E6B928F8;
        v26[4] = &v27;
        __get_DASCTSMinBatteryLevelKeySymbolLoc_block_invoke((uint64_t)v26);
        v19 = (id *)v28[3];
      }
      _Block_object_dispose(&v27, 8);
      if (!v19)
      {
        dlerror();
        v25 = (_Unwind_Exception *)abort_report_np();
        _Block_object_dispose(&v27, 8);
        _Unwind_Resume(v25);
      }
      uint64_t v20 = (const char *)[*v19 cStringUsingEncoding:4];
      v21 = [v3 requireBatteryLevel];
      xpc_dictionary_set_int64(v18, v20, [v21 integerValue]);

      xpc_dictionary_set_value(v4, (const char *)*MEMORY[0x1E4F14190], v18);
    }
    [v3 expectedDuration];
    v22 = (const char *)*MEMORY[0x1E4F141A0];
    [v3 expectedDuration];
    xpc_dictionary_set_int64(v4, v22, (uint64_t)v23);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14360], [v3 userRequestedBackgroundTask]);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14168], [v3 cpuIntensive]);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F142A8], [v3 postInstall]);
    xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E4F14308], [v3 requiresBuddyComplete]);
  }
  else
  {
    xpc_object_t v4 = 0;
  }

  return v4;
}

- (void)_registerActivityWithIdentifier:(id)a3 criteria:(id)a4 handler:(id)a5
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  double v10 = (void (**)(id, void, void *))a5;
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
        id v11 = [[RTXPCActivityRegistrant alloc] initWithIdentifier:v8 criteria:v9 handler:v10];
        if (v11)
        {
          double v12 = v11;
          id v13 = [(RTXPCActivityManager *)self registrants];
          id v14 = [v12 identifier];
          [v13 setObject:v12 forKey:v14];

          v15 = [v12 identifier];
          v16 = [(RTXPCActivityManager *)self _lastAttemptDateForIdentifier:v15];

          v17 = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            xpc_object_t v18 = [(RTXPCActivityManager *)self identifier];
            v31 = [v16 stringFromDate];
            v19 = [MEMORY[0x1E4F1C9C8] date];
            uint64_t v20 = v16;
            if (!v16)
            {
              uint64_t v20 = [MEMORY[0x1E4F1C9C8] distantPast];
            }
            [v19 timeIntervalSinceDate:v20];
            *(_DWORD *)buf = 138413058;
            v33 = v18;
            __int16 v34 = 2112;
            v35 = v12;
            __int16 v36 = 2112;
            v37 = v31;
            __int16 v38 = 2048;
            uint64_t v39 = v21;
            _os_log_impl(&dword_1D9BFA000, v17, OS_LOG_TYPE_INFO, "manager, %@, register activity, registrant, %@, lastAttemptDate, %@, intervalSinceLastAttempt, %.2f", buf, 0x2Au);
            if (!v16) {
          }
            }
          id v22 = [(RTXPCActivityManager *)self _registerRegistrant:v12];
        }
        else
        {
          v28 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v29 = *MEMORY[0x1E4F5CFE8];
          uint64_t v40 = *MEMORY[0x1E4F28568];
          v41 = @"requires a valid registrant.";
          v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
          uint64_t v30 = [v28 errorWithDomain:v29 code:7 userInfo:v16];
          v10[2](v10, 0, v30);

          double v12 = 0;
        }
        goto LABEL_15;
      }
      double v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F5CFE8];
      uint64_t v42 = *MEMORY[0x1E4F28568];
      v43 = @"requires a valid criteria.";
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      objc_super v26 = &v43;
      uint64_t v27 = &v42;
    }
    else
    {
      double v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F5CFE8];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      v45[0] = @"requires a valid identifier range.";
      v25 = (void *)MEMORY[0x1E4F1C9E8];
      objc_super v26 = (__CFString **)v45;
      uint64_t v27 = &v44;
    }
    double v12 = [v25 dictionaryWithObjects:v26 forKeys:v27 count:1];
    v16 = [v23 errorWithDomain:v24 code:7 userInfo:v12];
    v10[2](v10, 0, v16);
LABEL_15:
  }
}

- (void)_runRegistrantWithIdentifier:(id)a3 activity:(id)a4 handler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  id v11 = [[RTXPCActivityTask alloc] initWithIdentifier:v8 activity:v10 handler:v9];

  if (v11)
  {
    double v12 = [(RTXPCActivityManager *)self pendingTasks];
    [v12 addObject:v11];

    [(RTXPCActivityManager *)self _startDeferCheckTimer];
    [(RTXPCActivityManager *)self _scheduleNextTask];
  }
  else
  {
    id v13 = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [(RTXPCActivityManager *)self identifier];
      int v15 = 138412546;
      v16 = v14;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_1D9BFA000, v13, OS_LOG_TYPE_INFO, "manager, %@, unable to create task for identifier, %@", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)runRegistrantWithIdentifier:(id)a3 activity:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __69__RTXPCActivityManager_runRegistrantWithIdentifier_activity_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __69__RTXPCActivityManager_runRegistrantWithIdentifier_activity_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runRegistrantWithIdentifier:*(void *)(a1 + 40) activity:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_startDeferCheckTimer
{
  if (!self->_timer)
  {
    id v3 = [(RTXPCActivityManager *)self runningTask];
    if (v3)
    {
    }
    else
    {
      xpc_object_t v4 = [(RTXPCActivityManager *)self pendingTasks];
      uint64_t v5 = [v4 count];

      if (!v5) {
        return;
      }
    }
    timerManager = self->_timerManager;
    id v7 = [(RTNotifier *)self queue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __45__RTXPCActivityManager__startDeferCheckTimer__block_invoke;
    v10[3] = &unk_1E6B90E70;
    v10[4] = self;
    id v8 = [(RTTimerManager *)timerManager timerWithIdentifier:@"deferTimer" queue:v7 handler:v10];
    timer = self->_timer;
    self->_timer = v8;

    [(RTTimer *)self->_timer fireAfterDelay:5.0 interval:5.0];
    [(RTTimer *)self->_timer resume];
  }
}

uint64_t __45__RTXPCActivityManager__startDeferCheckTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onDeferCheckTimer];
}

- (void)_stopDeferCheckTimer
{
  if (self->_timer)
  {
    timer = [(RTXPCActivityManager *)self runningTask];
    if (!timer)
    {
      xpc_object_t v4 = [(RTXPCActivityManager *)self pendingTasks];
      uint64_t v5 = [v4 count];

      if (v5) {
        return;
      }
      [(RTTimer *)self->_timer invalidate];
      timer = self->_timer;
      self->_timer = 0;
    }
  }
}

- (void)_onDeferCheckTimer
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    double v23 = [(RTXPCActivityManager *)self identifier];
    uint64_t v24 = NSStringFromSelector(a2);
    v25 = [(RTXPCActivityManager *)self runningTask];
    objc_super v26 = [v25 identifier];
    uint64_t v27 = [(RTXPCActivityManager *)self pendingTasks];
    v28 = [v27 valueForKeyPath:@"identifier"];
    uint64_t v29 = [v28 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138413058;
    __int16 v36 = v23;
    __int16 v37 = 2112;
    __int16 v38 = v24;
    __int16 v39 = 2112;
    uint64_t v40 = v26;
    __int16 v41 = 2112;
    uint64_t v42 = v29;
    _os_log_debug_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_DEBUG, "manager, %@, %@, running task, %@, pending tasks, %@", buf, 0x2Au);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = (void *)[(NSMutableArray *)self->_pendingTasks copy];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v11 = [v10 activity];
        BOOL v12 = +[RTXPCActivityManager xpcActivityShouldDeferActivity:v11];

        if (v12)
        {
          id v13 = [v10 handler];

          if (v13)
          {
            id v14 = [v10 handler];
            v14[2](v14, 3, 0);
          }
          [(NSMutableArray *)self->_pendingTasks removeObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }

  int v15 = [(RTXPCActivityManager *)self runningTask];

  if (v15)
  {
    id v16 = [(RTXPCActivityManager *)self runningTask];
    id v17 = [v16 activity];
    BOOL v18 = +[RTXPCActivityManager xpcActivityShouldDeferActivity:v17];

    if (v18)
    {
      uint64_t v19 = [(RTXPCActivityManager *)self runningTask];
      uint64_t v20 = [v19 handler];

      if (v20)
      {
        uint64_t v21 = [(RTXPCActivityManager *)self runningTask];
        id v22 = [v21 handler];
        v22[2](v22, 5, 0);
      }
      [(RTXPCActivityManager *)self setRunningTask:0];
    }
  }
  [(RTXPCActivityManager *)self _stopDeferCheckTimer];
}

- (void)_scheduleNextTask
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = [(RTXPCActivityManager *)self runningTask];

  if (!v4)
  {
    id v10 = [(RTXPCActivityManager *)self pendingTasks];
    uint64_t v5 = [v10 firstObject];

    if (!v5)
    {
      id v14 = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        long long v32 = [(RTXPCActivityManager *)self identifier];
        long long v33 = NSStringFromSelector(a2);
        *(_DWORD *)buf = 138412546;
        v61 = v32;
        __int16 v62 = 2112;
        v63 = v33;
        _os_log_debug_impl(&dword_1D9BFA000, v14, OS_LOG_TYPE_DEBUG, "manager, %@, %@, no more tasks to run", buf, 0x16u);
      }
      goto LABEL_20;
    }
    id v11 = [(RTXPCActivityManager *)self pendingTasks];
    [v11 removeObjectAtIndex:0];

    BOOL v12 = [(RTXPCActivityManager *)self registrants];
    id v13 = [v5 identifier];
    id v14 = [v12 objectForKey:v13];

    if (v14)
    {
      int v15 = [MEMORY[0x1E4F1C9C8] date];
      objc_initWeak(&location, self);
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __41__RTXPCActivityManager__scheduleNextTask__block_invoke;
      v51[3] = &unk_1E6B95820;
      objc_copyWeak(&v56, &location);
      id v16 = v15;
      id v52 = v16;
      v53 = self;
      id v17 = v5;
      v54 = v17;
      BOOL v18 = v14;
      v55 = v18;
      v50 = (void *)MEMORY[0x1E016DB00](v51);
      [(RTXPCActivityManager *)self setRunningTask:v17];
      uint64_t v19 = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = [(RTXPCActivityManager *)self identifier];
        uint64_t v21 = [v18 identifier];
        *(_DWORD *)buf = 138412546;
        v61 = v20;
        __int16 v62 = 2112;
        v63 = v21;
        _os_log_impl(&dword_1D9BFA000, v19, OS_LOG_TYPE_INFO, "manager, %@, run started, identifier, %@", buf, 0x16u);
      }
      diagnostics = self->_diagnostics;
      double v23 = NSString;
      uint64_t v24 = [v17 identifier];
      v25 = [v23 stringWithFormat:@"Before identifier, %@", v24];
      [(RTDiagnostics *)diagnostics logDiagnosticStateWithReason:v25];

      objc_super v26 = [v18 identifier];
      uint64_t v27 = [(RTXPCActivityManager *)self _lastAttemptDateForIdentifier:v26];

      v28 = [v18 identifier];
      uint64_t v29 = [(RTXPCActivityManager *)self _lastCompleteDateForIdentifier:v28];

      if (v29)
      {
        long long v30 = [v29 laterDate:v27];
        if ([v30 isEqualToDate:v29]) {
          uint64_t v31 = 1;
        }
        else {
          uint64_t v31 = 2;
        }
      }
      else
      {
        uint64_t v31 = 0;
      }
      __int16 v38 = [MEMORY[0x1E4F1C9C8] date];
      [v38 timeIntervalSinceDate:v27];
      double v40 = v39;

      __int16 v41 = objc_opt_new();
      uint64_t v42 = [v18 identifier];
      [v41 setObject:v42 forKeyedSubscript:@"identifier"];

      [v41 setObject:&unk_1F3450F48 forKeyedSubscript:@"state"];
      uint64_t v43 = [NSNumber numberWithUnsignedInteger:v31];
      [v41 setObject:v43 forKeyedSubscript:@"result"];

      uint64_t v44 = [NSNumber numberWithDouble:v40];
      [v41 setObject:v44 forKeyedSubscript:@"interval"];

      id v45 = [NSString alloc];
      v46 = (void *)[v45 initWithCString:RTAnalyticsEventXPCActivitySuccessRate encoding:1];
      log_analytics_submission(v46, v41);
      v47 = [NSString stringWithFormat:@"com.apple.%@", v46];
      AnalyticsSendEvent();

      v48 = [v18 identifier];
      [(RTXPCActivityManager *)self _updateLastAttemptDateForIdentifier:v48];

      v49 = [v18 handler];
      ((void (**)(void, void *, void))v49)[2](v49, v50, 0);

      objc_destroyWeak(&v56);
      objc_destroyWeak(&location);
    }
    else
    {
      __int16 v34 = [v5 handler];

      if (!v34)
      {
        id v14 = 0;
        goto LABEL_20;
      }
      id v16 = [v5 handler];
      v35 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v58 = *MEMORY[0x1E4F28568];
      v59 = @"no registrant with identifier";
      __int16 v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
      __int16 v37 = [v35 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v36];
      (*((void (**)(id, uint64_t, void *))v16 + 2))(v16, 5, v37);
    }
LABEL_20:

    goto LABEL_21;
  }
  uint64_t v5 = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [(RTXPCActivityManager *)self identifier];
    uint64_t v7 = NSStringFromSelector(a2);
    uint64_t v8 = [(RTXPCActivityManager *)self runningTask];
    id v9 = [v8 identifier];
    *(_DWORD *)buf = 138412802;
    v61 = v6;
    __int16 v62 = 2112;
    v63 = v7;
    __int16 v64 = 2112;
    v65 = v9;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "manager, %@, %@, defer next task until the current task is finished, %@", buf, 0x20u);
  }
LABEL_21:
}

void __41__RTXPCActivityManager__scheduleNextTask__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v5 = [WeakRetained queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__RTXPCActivityManager__scheduleNextTask__block_invoke_2;
  block[3] = &unk_1E6B957F8;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  uint64_t v8 = *(void **)(a1 + 48);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v8;
  id v14 = *(id *)(a1 + 56);
  id v15 = v3;
  id v9 = v3;
  dispatch_async(v5, block);
}

void __41__RTXPCActivityManager__scheduleNextTask__block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  [v2 timeIntervalSinceDate:*(void *)(a1 + 32)];
  double v4 = v3;

  uint64_t v5 = *(void **)(*(void *)(a1 + 40) + 40);
  id v6 = NSString;
  uint64_t v7 = [*(id *)(a1 + 48) identifier];
  uint64_t v8 = [v6 stringWithFormat:@"After identifier, %@", v7];
  [v5 logDiagnosticStateWithReason:v8];

  id v9 = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [*(id *)(a1 + 40) identifier];
    id v11 = [*(id *)(a1 + 56) identifier];
    uint64_t v12 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 138413058;
    objc_super v26 = v10;
    __int16 v27 = 2112;
    v28 = v11;
    __int16 v29 = 2112;
    uint64_t v30 = v12;
    __int16 v31 = 2048;
    double v32 = v4;
    _os_log_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_INFO, "manager, %@, run finished, identifier, %@, error, %@, latency, %.2f", buf, 0x2Au);
  }
  id v13 = objc_opt_new();
  id v14 = [*(id *)(a1 + 56) identifier];
  [v13 setObject:v14 forKeyedSubscript:@"identifier"];

  [v13 setObject:&unk_1F3450F30 forKeyedSubscript:@"state"];
  [v13 setObject:&unk_1F3450F48 forKeyedSubscript:@"result"];
  id v15 = [NSNumber numberWithDouble:v4];
  [v13 setObject:v15 forKeyedSubscript:@"interval"];

  id v16 = [NSString alloc];
  id v17 = (void *)[v16 initWithCString:RTAnalyticsEventXPCActivitySuccessRate encoding:1];
  log_analytics_submission(v17, v13);
  BOOL v18 = [NSString stringWithFormat:@"com.apple.%@", v17];
  AnalyticsSendEvent();

  uint64_t v19 = *(void **)(a1 + 40);
  uint64_t v20 = [*(id *)(a1 + 56) identifier];
  [v19 _updateLastCompleteDateForIdentifier:v20];

  uint64_t v21 = [*(id *)(a1 + 40) runningTask];
  id v22 = *(void **)(a1 + 48);

  if (v21 == v22)
  {
    double v23 = [*(id *)(a1 + 48) handler];

    if (v23)
    {
      uint64_t v24 = [*(id *)(a1 + 48) handler];
      v24[2](v24, 5, *(void *)(a1 + 64));
    }
    [*(id *)(a1 + 40) setRunningTask:0];
    [*(id *)(a1 + 40) _scheduleNextTask];
  }
}

- (id)_registerRegistrant:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_opt_class();
    id v6 = [v4 criteria];
    uint64_t v7 = [v5 criteriaDictionaryWithCriteria:v6];

    if (v7)
    {
      objc_initWeak(&location, self);
      id v8 = [v4 identifier];
      uint64_t v9 = [v8 UTF8String];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __44__RTXPCActivityManager__registerRegistrant___block_invoke;
      v16[3] = &unk_1E6B95870;
      id v10 = v7;
      id v17 = v10;
      BOOL v18 = self;
      id v19 = v4;
      objc_copyWeak(&v20, &location);
      +[RTXPCActivityManager xpcActivityRegisterIdentifier:v9 criteria:*MEMORY[0x1E4F14158] handler:v16];

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
      id v11 = 0;
    }
    else
    {
      id v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = *MEMORY[0x1E4F28568];
      double v23 = @"requires a valid criteria.";
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      id v11 = [v13 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v14];

      id v10 = 0;
    }
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    v25[0] = @"requires a valid registrant.";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v11 = [v12 errorWithDomain:*MEMORY[0x1E4F5CFE8] code:7 userInfo:v10];
  }

  return v11;
}

void __44__RTXPCActivityManager__registerRegistrant___block_invoke(xpc_object_t *a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int64_t v4 = +[RTXPCActivityManager xpcActivityGetStateActivity:v3];
  if (v4 == 2)
  {
    id v8 = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [a1[5] identifier];
      id v10 = [a1[6] identifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = v9;
      __int16 v31 = 2112;
      int64_t v32 = (int64_t)v10;
      _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "manager, %@, run, identifier, %@", buf, 0x16u);
    }
    id WeakRetained = objc_loadWeakRetained(a1 + 7);
    id v11 = [a1[6] identifier];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    void v25[2] = __44__RTXPCActivityManager__registerRegistrant___block_invoke_222;
    v25[3] = &unk_1E6B95848;
    id v12 = v3;
    xpc_object_t v13 = a1[5];
    xpc_object_t v14 = a1[6];
    id v26 = v12;
    xpc_object_t v27 = v13;
    id v28 = v14;
    [WeakRetained runRegistrantWithIdentifier:v11 activity:v12 handler:v25];

    if (!+[RTXPCActivityManager xpcActivitySetStateActivity:v12 state:4])
    {
      id v15 = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        double v23 = [a1[5] identifier];
        uint64_t v24 = [a1[6] identifier];
        *(_DWORD *)buf = 138412546;
        uint64_t v30 = v23;
        __int16 v31 = 2112;
        int64_t v32 = (int64_t)v24;
        _os_log_error_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_ERROR, "manager, %@, run, identifier, %@, failed to set activity to state, XPC_ACTIVITY_STATE_CONTINUE", buf, 0x16u);
      }
    }
  }
  else
  {
    int64_t v5 = v4;
    if (v4)
    {
      id WeakRetained = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
      {
        id v16 = [a1[5] identifier];
        id v17 = [a1[6] identifier];
        *(_DWORD *)buf = 138412802;
        uint64_t v30 = v16;
        __int16 v31 = 2048;
        int64_t v32 = v5;
        __int16 v33 = 2112;
        __int16 v34 = v17;
        _os_log_error_impl(&dword_1D9BFA000, WeakRetained, OS_LOG_TYPE_ERROR, "manager, %@, unhandled state, %lu, identifier, %@", buf, 0x20u);
      }
    }
    else
    {
      id WeakRetained = +[RTXPCActivityManager xpcActivityCopyCriteriaActivity:v3];
      if (WeakRetained && xpc_equal(a1[4], WeakRetained))
      {
        uint64_t v7 = @"NO";
      }
      else
      {
        +[RTXPCActivityManager xpcActivitySetCriteriaActivity:v3 criteria:a1[4]];
        uint64_t v7 = @"YES";
      }
      BOOL v18 = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = [a1[5] identifier];
        uint64_t v20 = [a1[6] identifier];
        uint64_t v21 = (void *)v20;
        *(_DWORD *)buf = 138413058;
        uint64_t v22 = @"YES";
        uint64_t v30 = v19;
        if (!WeakRetained) {
          uint64_t v22 = @"NO";
        }
        __int16 v31 = 2112;
        int64_t v32 = v20;
        __int16 v33 = 2112;
        __int16 v34 = v22;
        __int16 v35 = 2112;
        __int16 v36 = v7;
        _os_log_impl(&dword_1D9BFA000, v18, OS_LOG_TYPE_INFO, "manager, %@, check-in, identifier, %@, existingCriteria, %@, setCriteria, %@", buf, 0x2Au);
      }
    }
  }
}

void __44__RTXPCActivityManager__registerRegistrant___block_invoke_222(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (!+[RTXPCActivityManager xpcActivitySetStateActivity:*(void *)(a1 + 32) state:a2])
  {
    int64_t v4 = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int64_t v5 = [*(id *)(a1 + 40) identifier];
      id v6 = [*(id *)(a1 + 48) identifier];
      int v7 = 138412802;
      id v8 = v5;
      __int16 v9 = 2112;
      id v10 = v6;
      __int16 v11 = 2048;
      uint64_t v12 = a2;
      _os_log_error_impl(&dword_1D9BFA000, v4, OS_LOG_TYPE_ERROR, "manager, %@, run, identifier, %@, failed to set activity to state, %ld", (uint8_t *)&v7, 0x20u);
    }
  }
}

- (void)registerActivityWithIdentifier:(id)a3 criteria:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = [(RTNotifier *)self queue];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__RTXPCActivityManager_registerActivityWithIdentifier_criteria_handler___block_invoke;
  v15[3] = &unk_1E6B91490;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, v15);
}

uint64_t __72__RTXPCActivityManager_registerActivityWithIdentifier_criteria_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerActivityWithIdentifier:*(void *)(a1 + 40) criteria:*(void *)(a1 + 48) handler:*(void *)(a1 + 56)];
}

- (void)_unregisterActivityWithIdentifier:(id)a3 handler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, void))a4;
  if (!v6) {
    goto LABEL_11;
  }
  id v8 = [(RTXPCActivityManager *)self registrants];
  id v9 = [v8 objectForKey:v6];

  if (v9)
  {
    id v10 = [(RTXPCActivityManager *)self registrants];
    [v10 removeObjectForKey:v6];

    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [(RTXPCActivityManager *)self identifier];
      int v14 = 138412546;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v9;
      id v13 = "manager, %@, unregister activity, registrant, %@";
LABEL_7:
      _os_log_impl(&dword_1D9BFA000, v11, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    __int16 v11 = _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [(RTXPCActivityManager *)self identifier];
      int v14 = 138412546;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v6;
      id v13 = "manager, %@, unregister activity, identifier, %@. no existing registrant";
      goto LABEL_7;
    }
  }

  +[RTXPCActivityManager xpcActivityUnregisterIdentifier:](RTXPCActivityManager, "xpcActivityUnregisterIdentifier:", [v6 UTF8String]);
  if (v7) {
    v7[2](v7, 0);
  }

LABEL_11:
}

- (void)unregisterActivityWithIdentifier:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(RTNotifier *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__RTXPCActivityManager_unregisterActivityWithIdentifier_handler___block_invoke;
  block[3] = &unk_1E6B90660;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __65__RTXPCActivityManager_unregisterActivityWithIdentifier_handler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _unregisterActivityWithIdentifier:*(void *)(a1 + 40) handler:*(void *)(a1 + 48)];
}

+ (void)xpcActivityRegisterIdentifier:(const char *)a3 criteria:(id)a4 handler:(id)a5
{
}

+ (void)xpcActivityUnregisterIdentifier:(const char *)a3
{
}

+ (int64_t)xpcActivityGetStateActivity:(id)a3
{
  return xpc_activity_get_state((xpc_activity_t)a3);
}

+ (BOOL)xpcActivitySetStateActivity:(id)a3 state:(int64_t)a4
{
  return xpc_activity_set_state((xpc_activity_t)a3, a4);
}

+ (id)xpcActivityCopyCriteriaActivity:(id)a3
{
  xpc_object_t v3 = xpc_activity_copy_criteria((xpc_activity_t)a3);

  return v3;
}

+ (void)xpcActivitySetCriteriaActivity:(id)a3 criteria:(id)a4
{
}

+ (BOOL)xpcActivityShouldDeferActivity:(id)a3
{
  return xpc_activity_should_defer((xpc_activity_t)a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (void)setDiagnostics:(id)a3
{
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
}

- (RTTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSMutableDictionary)registrants
{
  return self->_registrants;
}

- (void)setRegistrants:(id)a3
{
}

- (RTXPCActivityTask)runningTask
{
  return self->_runningTask;
}

- (void)setRunningTask:(id)a3
{
}

- (NSMutableArray)pendingTasks
{
  return self->_pendingTasks;
}

- (void)setPendingTasks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTasks, 0);
  objc_storeStrong((id *)&self->_runningTask, 0);
  objc_storeStrong((id *)&self->_registrants, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);

  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end