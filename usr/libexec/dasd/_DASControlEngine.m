@interface _DASControlEngine
- (BOOL)dutyCyclingInitiated;
- (BOOL)encounteredTLC;
- (BOOL)initialMitigationInitiated;
- (BOOL)trialInitialActionAlways;
- (BOOL)trialdisableSFI;
- (NSDate)currentDutyCycleStartTime;
- (NSDate)encounteredTLCDate;
- (NSMutableDictionary)actionToAnalyzers;
- (NSMutableDictionary)actionToTimers;
- (NSMutableDictionary)controlEffortHistory;
- (NSString)trialExperimentID;
- (NSString)trialTreatmentID;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)executionQueue;
- (OS_dispatch_source)analyzerTimer;
- (OS_os_log)log;
- (TRITrackingId)trialTrackingID;
- (_CDContext)context;
- (_DASControlEngine)init;
- (_DASTrialManager)trialManager;
- (_DKKnowledgeSaving)store;
- (double)dutyCycleDuration;
- (double)trialSFIIdleWindowParameter;
- (id)currentStatus;
- (id)intializeAnalyzerTimerWithCadence:(double)a3 forAction:(id)a4;
- (id)startBatteryTemperatureLoop;
- (id)startChargeRateLoop;
- (id)status;
- (int)startToken;
- (int)timeToken;
- (int64_t)lastSavedEffort;
- (int64_t)lastSavedTLC;
- (int64_t)trialInitialAction;
- (int64_t)trialSFIWindow;
- (os_unfair_lock_s)lock;
- (unint64_t)SFITimeFromEffort:(unint64_t)a3;
- (unint64_t)dutyCycleTimeFromEffort:(unint64_t)a3;
- (unint64_t)dutyCyclingMethod;
- (void)checkControlAction:(id)a3;
- (void)executeDutyCyclingWithEffort:(unint64_t)a3;
- (void)executeSFIWithEffort:(unint64_t)a3;
- (void)intializeAnalyzers;
- (void)invokeInitialActionWithValue:(int64_t)a3;
- (void)loadTrialParameters;
- (void)loadTrialTreatmentAndExperimentIdentifiers;
- (void)recordSessionAnalytics;
- (void)registerTriggers;
- (void)resetAnalyticsState;
- (void)resetDutyCyclingEffort;
- (void)resetInitialAction;
- (void)resetSFIEffort;
- (void)resetState;
- (void)saveControlEffort:(int64_t)a3;
- (void)saveTLCState:(BOOL)a3;
- (void)setActionToAnalyzers:(id)a3;
- (void)setActionToTimers:(id)a3;
- (void)setAnalyzerTimer:(id)a3;
- (void)setContext:(id)a3;
- (void)setControlEffortHistory:(id)a3;
- (void)setCurrentDutyCycleStartTime:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setDutyCycleDuration:(double)a3;
- (void)setDutyCyclingInitiated:(BOOL)a3;
- (void)setDutyCyclingMethod:(unint64_t)a3;
- (void)setEncounteredTLC:(BOOL)a3;
- (void)setEncounteredTLCDate:(id)a3;
- (void)setExecutionQueue:(id)a3;
- (void)setInitialMitigationInitiated:(BOOL)a3;
- (void)setLastSavedEffort:(int64_t)a3;
- (void)setLastSavedTLC:(int64_t)a3;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setStartToken:(int)a3;
- (void)setStore:(id)a3;
- (void)setTimeToken:(int)a3;
- (void)setTrialExperimentID:(id)a3;
- (void)setTrialInitialAction:(int64_t)a3;
- (void)setTrialInitialActionAlways:(BOOL)a3;
- (void)setTrialManager:(id)a3;
- (void)setTrialSFIIdleWindowParameter:(double)a3;
- (void)setTrialSFIWindow:(int64_t)a3;
- (void)setTrialTrackingID:(id)a3;
- (void)setTrialTreatmentID:(id)a3;
- (void)setTrialdisableSFI:(BOOL)a3;
- (void)updateControlAction:(id)a3 withEffort:(int64_t)a4;
@end

@implementation _DASControlEngine

- (void)checkControlAction:(id)a3
{
  id v4 = a3;
  context = self->_context;
  v6 = +[_CDContextQueries keyPathForPluginStatus];
  v7 = [(_CDContext *)context objectForKeyedSubscript:v6];
  unsigned int v8 = [v7 BOOLValue];

  if (v8)
  {
    v9 = self->_context;
    v10 = +[_CDContextQueries keyPathForBatteryLevel];
    v11 = [(_CDContext *)v9 objectForKeyedSubscript:v10];
    uint64_t v12 = (uint64_t)[v11 integerValue];

    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Checking control action", buf, 2u);
    }
    id v42 = v4;
    v14 = [(NSMutableDictionary *)self->_actionToAnalyzers objectForKeyedSubscript:v4];
    v15 = +[NSMutableDictionary dictionary];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v14;
    id v16 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v45;
      uint64_t v19 = -1;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v45 != v18) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          if (v12 >= 96)
          {
            v22 = [*(id *)(*((void *)&v44 + 1) + 8 * i) analyzerName];
            v23 = off_1001C2A78;

            if (v22 == v23) {
              continue;
            }
          }
          v24 = self->_log;
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = v24;
            v26 = [v21 description];
            id v27 = [v21 controlEffortResult];
            *(_DWORD *)buf = 138412546;
            v49 = v26;
            __int16 v50 = 2048;
            id v51 = v27;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Analyzer %@, Control effort %lu", buf, 0x16u);
          }
          v28 = [v21 analyticsStatus];

          if (v28)
          {
            v29 = [v21 analyticsStatus];
            id v30 = [v29 copy];
            [v15 addEntriesFromDictionary:v30];
          }
          id v31 = [v21 controlEffortResult];
          if ((uint64_t)v31 > v19)
          {
            uint64_t v32 = (uint64_t)v31;
            v33 = +[NSNumber numberWithInteger:v31];
            [v15 setObject:v33 forKeyedSubscript:@"MaxControlEffort"];

            uint64_t v19 = v32;
          }
          v34 = [v21 analyzerName];
          v35 = off_1001C2A78;

          if (v34 == v35)
          {
            int encounteredTLC = self->_encounteredTLC;
            unsigned int v37 = [v21 encounteredTLC];
            self->_int encounteredTLC = v37;
            if (encounteredTLC != v37) {
              [(_DASControlEngine *)self saveTLCState:encounteredTLC != 0];
            }
          }
        }
        id v17 = [obj countByEnumeratingWithState:&v44 objects:v52 count:16];
      }
      while (v17);
    }
    else
    {
      uint64_t v19 = -1;
    }

    v38 = +[NSNumber numberWithInteger:v12];
    [v15 setObject:v38 forKeyedSubscript:@"BatteryLevel"];

    id v39 = v15;
    AnalyticsSendEventLazy();
    v40 = self->_log;
    if (os_log_type_enabled((os_log_t)v40, OS_LOG_TYPE_DEBUG)) {
      sub_1000F3EA4((uint64_t)v39, v40);
    }
    id v4 = v42;
    if (v19 >= 1)
    {
      v41 = +[NSDate date];
      [(NSMutableDictionary *)self->_controlEffortHistory setObject:v39 forKeyedSubscript:v41];
      [(NSUserDefaults *)self->_defaults setObject:self->_controlEffortHistory forKey:@"controlEffortHistory"];
      [(_DASControlEngine *)self saveControlEffort:v19];
    }
    [(_DASControlEngine *)self updateControlAction:v42 withEffort:v19];
  }
}

- (_DASControlEngine)init
{
  v17.receiver = self;
  v17.super_class = (Class)_DASControlEngine;
  v2 = [(_DASControlEngine *)&v17 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.dasd.clas.controlEngineQueue", v3);
    v5 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v4;

    uint64_t v6 = +[NSMutableDictionary dictionary];
    v7 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v6;

    os_log_t v8 = os_log_create("com.apple.clas", "control");
    v9 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v8;

    uint64_t v10 = +[_CDClientContext userContext];
    v11 = (void *)*((void *)v2 + 13);
    *((void *)v2 + 13) = v10;

    uint64_t v12 = +[_DASTrialManager sharedInstance];
    v13 = (void *)*((void *)v2 + 25);
    *((void *)v2 + 25) = v12;

    [*((id *)v2 + 25) addDelegate:v2];
    [v2 loadTrialTreatmentAndExperimentIdentifiers];
    *((void *)v2 + 20) = 50000;
    *((void *)v2 + 21) = 0x3FD3333333333333;
    *(_WORD *)(v2 + 11) = 256;
    uint64_t v14 = +[_DKKnowledgeStore knowledgeStoreWithDirectReadWriteAccess];
    v15 = (void *)*((void *)v2 + 22);
    *((void *)v2 + 22) = v14;

    *((void *)v2 + 19) = -1;
    *(int64x2_t *)(v2 + 72) = vdupq_n_s64(0x7FFFFFFFuLL);
    [v2 loadTrialParameters];
    [v2 intializeAnalyzers];
    [v2 registerTriggers];
    if (v2[11]) {
      [v2 invokeInitialActionWithValue:1];
    }
    if ((*((void *)v2 + 19) & 0x8000000000000000) == 0) {
      [v2 invokeInitialActionWithValue:];
    }
  }
  return (_DASControlEngine *)v2;
}

- (void)loadTrialTreatmentAndExperimentIdentifiers
{
  v3 = [(_DASTrialManager *)self->_trialManager treatmentID];
  trialTreatmentID = self->_trialTreatmentID;
  self->_trialTreatmentID = v3;

  v5 = [(_DASTrialManager *)self->_trialManager experimentID];
  trialExperimentID = self->_trialExperimentID;
  self->_trialExperimentID = v5;

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v8 = self->_trialTreatmentID;
    v9 = self->_trialExperimentID;
    int v10 = 138412546;
    v11 = v8;
    __int16 v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Trial: Treatment ID set to: %@, Experiment ID set to: %@", (uint8_t *)&v10, 0x16u);
  }
}

- (void)loadTrialParameters
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(_DASControlEngine *)self loadTrialTreatmentAndExperimentIdentifiers];
  dispatch_queue_t v4 = [(_DASTrialManager *)self->_trialManager factorWithName:@"CLAS_InitialActionAlwaysEnabled"];
  log = self->_log;
  BOOL v6 = os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      v7 = log;
      int v30 = 134217984;
      unint64_t v31 = [v4 BOOLeanValue];
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Trial: initialActionAlwaysEnabled action set to %ld", (uint8_t *)&v30, 0xCu);
    }
    self->_trialInitialActionAlways = [v4 BOOLeanValue];
  }
  else if (v6)
  {
    LOWORD(v30) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load initialActionAlwaysEnabled", (uint8_t *)&v30, 2u);
  }
  os_log_t v8 = [(_DASTrialManager *)self->_trialManager factorWithName:@"CLAS_DisableSFI"];
  v9 = self->_log;
  BOOL v10 = os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      v11 = v9;
      unsigned int v12 = [v8 BOOLeanValue];
      int v30 = 67109120;
      LODWORD(v31) = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Trial: disableSFI set to %d", (uint8_t *)&v30, 8u);
    }
    self->_trialdisableSFI = [v8 BOOLeanValue];
  }
  else if (v10)
  {
    LOWORD(v30) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load disableSFI", (uint8_t *)&v30, 2u);
  }
  v13 = [(_DASTrialManager *)self->_trialManager factorWithName:@"CLAS_WindowSFI"];
  uint64_t v14 = self->_log;
  BOOL v15 = os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      id v16 = v14;
      id v17 = [v13 longValue];
      int v30 = 134217984;
      unint64_t v31 = (unint64_t)v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Trial: windowSFI set to %ld", (uint8_t *)&v30, 0xCu);
    }
    self->_trialSFIWindow = (int64_t)[v13 longValue];
  }
  else if (v15)
  {
    LOWORD(v30) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v14, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load windowSFI", (uint8_t *)&v30, 2u);
  }
  uint64_t v18 = [(_DASTrialManager *)self->_trialManager factorWithName:@"CLAS_IdleWindowParameterSFI"];
  double trialSFIIdleWindowParameter = self->_trialSFIIdleWindowParameter;
  v20 = self->_log;
  BOOL v21 = os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT);
  if (trialSFIIdleWindowParameter == 0.0)
  {
    if (v21)
    {
      LOWORD(v30) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load idleWindowParameterSFI", (uint8_t *)&v30, 2u);
    }
  }
  else
  {
    if (v21)
    {
      v22 = v20;
      [v18 doubleValue];
      int v30 = 134217984;
      unint64_t v31 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Trial: idleWindowParameterSFI set to %lf", (uint8_t *)&v30, 0xCu);
    }
    [v18 doubleValue];
    self->_double trialSFIIdleWindowParameter = v24;
  }
  v25 = [(_DASTrialManager *)self->_trialManager factorWithName:@"CLAS_InitialAction"];
  v26 = self->_log;
  BOOL v27 = os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT);
  if (v25)
  {
    if (v27)
    {
      v28 = v26;
      id v29 = [v25 longValue];
      int v30 = 134217984;
      unint64_t v31 = (unint64_t)v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Trial: initialAction set to %ld", (uint8_t *)&v30, 0xCu);
    }
    self->_trialInitialAction = (int64_t)[v25 longValue];
  }
  else if (v27)
  {
    LOWORD(v30) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v26, OS_LOG_TYPE_DEFAULT, "Trial: Failed to load initialAction", (uint8_t *)&v30, 2u);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)intializeAnalyzers
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C2D8;
  block[3] = &unk_1001754F8;
  block[4] = self;
  if (qword_1001C3B88 != -1) {
    dispatch_once(&qword_1001C3B88, block);
  }
  v3 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.duetactivityscheduler"];
  defaults = self->_defaults;
  self->_defaults = v3;

  self->_unint64_t dutyCyclingMethod = 1;
  v5 = [(NSUserDefaults *)self->_defaults objectForKey:@"dutyCycling"];

  if (v5)
  {
    unint64_t dutyCyclingMethod = [(NSUserDefaults *)self->_defaults integerForKey:@"dutyCycling"];
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v32 = dutyCyclingMethod;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "DutyCycling method is %ld", buf, 0xCu);
    }
    self->_unint64_t dutyCyclingMethod = dutyCyclingMethod;
  }
  else
  {
    unint64_t dutyCyclingMethod = self->_dutyCyclingMethod;
  }
  if (dutyCyclingMethod >= 3) {
    self->_unint64_t dutyCyclingMethod = 1;
  }
  os_log_t v8 = [(NSUserDefaults *)self->_defaults objectForKey:@"initialActionInitiated"];
  self->_BOOL initialMitigationInitiated = [v8 BOOLValue];

  v9 = [(NSUserDefaults *)self->_defaults objectForKey:@"dutyCycleInitiated"];
  self->_BOOL dutyCyclingInitiated = [v9 BOOLValue];

  BOOL v10 = [(NSUserDefaults *)self->_defaults objectForKey:@"currentDutyCycleStartTime"];
  currentDutyCycleStartTime = self->_currentDutyCycleStartTime;
  self->_currentDutyCycleStartTime = v10;

  unsigned int v12 = [(NSUserDefaults *)self->_defaults objectForKey:@"dutyCycleDuration"];
  [v12 doubleValue];
  self->_double dutyCycleDuration = v13;

  uint64_t v14 = [(NSUserDefaults *)self->_defaults objectForKey:@"controlEffortHistory"];
  controlEffortHistory = self->_controlEffortHistory;
  self->_controlEffortHistory = v14;

  id v16 = [(NSUserDefaults *)self->_defaults objectForKey:@"encounteredTLC"];
  self->_BOOL encounteredTLC = [v16 BOOLValue];

  id v17 = [(NSUserDefaults *)self->_defaults objectForKey:@"encounteredTLCDate"];
  encounteredTLCDate = self->_encounteredTLCDate;
  self->_encounteredTLCDate = v17;

  uint64_t v19 = +[NSMutableArray array];
  v20 = self->_log;
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
  {
    BOOL dutyCyclingInitiated = self->_dutyCyclingInitiated;
    BOOL initialMitigationInitiated = self->_initialMitigationInitiated;
    double dutyCycleDuration = self->_dutyCycleDuration;
    BOOL encounteredTLC = self->_encounteredTLC;
    v25 = self->_encounteredTLCDate;
    *(_DWORD *)buf = 134219010;
    unint64_t v32 = dutyCyclingInitiated;
    __int16 v33 = 2048;
    BOOL v34 = initialMitigationInitiated;
    __int16 v35 = 2048;
    double v36 = dutyCycleDuration;
    __int16 v37 = 1024;
    BOOL v38 = encounteredTLC;
    __int16 v39 = 2112;
    v40 = v25;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "Defaults: DutyCyclingInitiated:%ld, InitialMitigationInitiated:%ld, DutyCycleDuration:%lf, Encountered TLC:%d, Encountered TLC Date:%@", buf, 0x30u);
  }
  v26 = self->_log;
  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v26, OS_LOG_TYPE_DEFAULT, "Initializing Analyzers", buf, 2u);
  }
  BOOL v27 = [(_DASControlEngine *)self startBatteryTemperatureLoop];
  v28 = [(_DASControlEngine *)self startChargeRateLoop];
  [v19 addObject:v27];
  [v19 addObject:v28];
  [(NSMutableDictionary *)self->_actionToAnalyzers setObject:v19 forKeyedSubscript:@"kCLASActionSFI"];
  id v29 = [(_DASControlEngine *)self intializeAnalyzerTimerWithCadence:@"kCLASActionSFI" forAction:15.0];
  [(NSMutableDictionary *)self->_actionToTimers setObject:v29 forKeyedSubscript:@"kCLASActionSFI"];
}

- (id)status
{
  v3 = [(_DASControlEngine *)self currentStatus];
  [v3 setObject:self->_controlEffortHistory forKeyedSubscript:@"ControlEffortHistory"];

  return v3;
}

- (void)registerTriggers
{
  v3 = +[_CDContextQueries keyPathForInUseStatus];
  dispatch_queue_t v4 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v3];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002C574;
  v10[3] = &unk_1001759F8;
  v10[4] = self;
  v5 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.das.clas.deviceActivity" contextualPredicate:v4 callback:v10];

  [(_CDContext *)self->_context registerCallback:v5];
  BOOL v6 = +[_CDContextQueries keyPathForPluginStatus];
  v7 = +[_CDContextualPredicate predicateForChangeAtKeyPath:v6];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002C5E8;
  v9[3] = &unk_1001759F8;
  v9[4] = self;
  os_log_t v8 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.das.clas.pluggedIn" contextualPredicate:v7 callback:v9];

  [(_CDContext *)self->_context registerCallback:v8];
}

- (id)intializeAnalyzerTimerWithCadence:(double)a3 forAction:(id)a4
{
  id v6 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Activating timer for Action %@", buf, 0xCu);
  }
  os_log_t v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_executionQueue);
  analyzerTimer = self->_analyzerTimer;
  self->_analyzerTimer = v8;

  dispatch_set_qos_class_fallback();
  dispatch_source_set_timer((dispatch_source_t)self->_analyzerTimer, 0, (unint64_t)(a3 * 1000000000.0), 0x3B9ACA00uLL);
  BOOL v10 = self->_analyzerTimer;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100011180;
  v14[3] = &unk_100175570;
  v14[4] = self;
  id v15 = v6;
  id v11 = v6;
  dispatch_source_set_event_handler(v10, v14);
  dispatch_activate((dispatch_object_t)self->_analyzerTimer);
  unsigned int v12 = self->_analyzerTimer;

  return v12;
}

- (void)saveTLCState:(BOOL)a3
{
  int64_t v4 = a3;
  int64_t lastSavedTLC = self->_lastSavedTLC;
  if (lastSavedTLC == 0x7FFFFFFF)
  {
    id v6 = +[_DKEventStream eventStreamWithName:@"/system/TLC"];
    v26 = v6;
    v7 = +[NSArray arrayWithObjects:&v26 count:1];
    os_log_t v8 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:0];
    v25 = v8;
    v9 = +[NSArray arrayWithObjects:&v25 count:1];
    BOOL v10 = +[_DKEventQuery eventQueryWithPredicate:0 eventStreams:v7 offset:0 limit:1 sortDescriptors:v9];

    id v11 = [(_DKKnowledgeSaving *)self->_store executeQuery:v10 error:0];
    if ([v11 count])
    {
      unsigned int v12 = [v11 lastObject];
      double v13 = [v12 value];

      if ([v13 integerValue]) {
        self->_int64_t lastSavedTLC = (int64_t)[v13 integerValue];
      }
    }
    int64_t lastSavedTLC = self->_lastSavedTLC;
  }
  if (lastSavedTLC != v4)
  {
    if (!self->_encounteredTLCDate)
    {
      uint64_t v14 = +[NSDate distantPast];
      encounteredTLCDate = self->_encounteredTLCDate;
      self->_encounteredTLCDate = v14;
    }
    id v16 = +[NSDate date];
    defaults = self->_defaults;
    uint64_t v18 = +[NSNumber numberWithBool:self->_encounteredTLC];
    [(NSUserDefaults *)defaults setObject:v18 forKey:@"encounteredTLC"];

    [(NSUserDefaults *)self->_defaults setObject:v16 forKey:@"encounteredTLCDate"];
    uint64_t v19 = +[_DKEventStream eventStreamWithName:@"/system/TLC"];
    v20 = +[_DKEvent eventWithStream:v19 startDate:self->_encounteredTLCDate endDate:v16 categoryIntegerValue:v4 metadata:0];

    if (v20)
    {
      store = self->_store;
      double v24 = v20;
      v22 = +[NSArray arrayWithObjects:&v24 count:1];
      LODWORD(store) = [(_DKKnowledgeSaving *)store saveObjects:v22 error:0];

      if (store) {
        self->_int64_t lastSavedTLC = v4;
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000F3E64();
    }
    unint64_t v23 = self->_encounteredTLCDate;
    self->_encounteredTLCDate = v16;
  }
}

- (void)saveControlEffort:(int64_t)a3
{
  v5 = +[NSDate date];
  if (self->_trialInitialActionAlways) {
    a3 += 200;
  }
  int64_t lastSavedEffort = self->_lastSavedEffort;
  if (lastSavedEffort == 0x7FFFFFFF)
  {
    v7 = +[_DKEventStream eventStreamWithName:@"/dasd/controlEffort"];
    BOOL v21 = v7;
    os_log_t v8 = +[NSArray arrayWithObjects:&v21 count:1];
    v9 = +[NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:0];
    v20 = v9;
    BOOL v10 = +[NSArray arrayWithObjects:&v20 count:1];
    id v11 = +[_DKEventQuery eventQueryWithPredicate:0 eventStreams:v8 offset:0 limit:1 sortDescriptors:v10];

    unsigned int v12 = [(_DKKnowledgeSaving *)self->_store executeQuery:v11 error:0];
    if ([v12 count])
    {
      double v13 = [v12 lastObject];
      uint64_t v14 = [v13 value];

      if ([v14 integerValue]) {
        self->_int64_t lastSavedEffort = (int64_t)[v14 integerValue];
      }
    }
    int64_t lastSavedEffort = self->_lastSavedEffort;
  }
  if (lastSavedEffort != a3)
  {
    id v15 = +[_DKEventStream eventStreamWithName:@"/dasd/controlEffort"];
    id v16 = +[_DKEvent eventWithStream:v15 startDate:v5 endDate:v5 categoryIntegerValue:a3 metadata:0];

    if (v16)
    {
      store = self->_store;
      uint64_t v19 = v16;
      uint64_t v18 = +[NSArray arrayWithObjects:&v19 count:1];
      LODWORD(store) = [(_DKKnowledgeSaving *)store saveObjects:v18 error:0];

      if (store) {
        self->_int64_t lastSavedEffort = a3;
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      sub_1000F3E64();
    }
  }
}

- (void)updateControlAction:(id)a3 withEffort:(int64_t)a4
{
  id v6 = a3;
  if (a4 < 0)
  {
    log = self->_log;
    if (!os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    int v16 = 134217984;
    int64_t v17 = a4;
    id v11 = "Effort less than 0 (%ld). Taking no action";
    unsigned int v12 = log;
    uint32_t v13 = 12;
LABEL_11:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, v13);
    goto LABEL_33;
  }
  unint64_t dutyCyclingMethod = self->_dutyCyclingMethod;
  if (!dutyCyclingMethod)
  {
    uint64_t v14 = self->_log;
    if (!os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_33;
    }
    LOWORD(v16) = 0;
    id v11 = "Duty cycling method is disabled";
    unsigned int v12 = v14;
    uint32_t v13 = 2;
    goto LABEL_11;
  }
  if ((unint64_t)a4 >= 0x1F && !self->_initialMitigationInitiated)
  {
    if (self->_trialInitialAction < 0)
    {
      os_log_t v8 = self;
      uint64_t v9 = 1;
LABEL_24:
      [(_DASControlEngine *)v8 invokeInitialActionWithValue:v9];
      goto LABEL_33;
    }
LABEL_26:
    if (dutyCyclingMethod == 1)
    {
      [(_DASControlEngine *)self executeSFIWithEffort:a4];
      if (a4)
      {
LABEL_30:
        self->_BOOL dutyCyclingInitiated = 1;
        goto LABEL_33;
      }
    }
    else
    {
      if (dutyCyclingMethod == 2) {
        [(_DASControlEngine *)self executeDutyCyclingWithEffort:a4];
      }
      if (a4) {
        goto LABEL_30;
      }
    }
    self->_BOOL dutyCyclingInitiated = 0;
    goto LABEL_33;
  }
  if (!a4 && self->_initialMitigationInitiated)
  {
    if (self->_trialInitialAction < 0)
    {
      os_log_t v8 = self;
      uint64_t v9 = 0;
      goto LABEL_24;
    }
    if (!self->_dutyCyclingInitiated) {
      goto LABEL_33;
    }
LABEL_20:
    id v15 = self->_log;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_DEFAULT, "Less than minimum effort. Setting effort to 0", (uint8_t *)&v16, 2u);
    }
    a4 = 0;
    unint64_t dutyCyclingMethod = self->_dutyCyclingMethod;
    goto LABEL_26;
  }
  if ((unint64_t)a4 > 0xA) {
    goto LABEL_26;
  }
  if (self->_dutyCyclingInitiated)
  {
    if ((unint64_t)a4 > 9)
    {
      a4 = 10;
      goto LABEL_26;
    }
    goto LABEL_20;
  }
LABEL_33:
}

- (void)invokeInitialActionWithValue:(int64_t)a3
{
  self->_BOOL initialMitigationInitiated = a3 != 0;
  if (notify_set_state(self->_startToken, a3) && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_1000F3F1C();
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Posting notifications for initial mitigation with value %ld", (uint8_t *)&v6, 0xCu);
  }
  notify_post((const char *)[@"com.apple.das.clas.startDutyCycling" UTF8String]);
}

- (void)resetInitialAction
{
  if (!self->_trialInitialActionAlways && self->_trialInitialAction < 0) {
    [(_DASControlEngine *)self invokeInitialActionWithValue:0];
  }
}

- (unint64_t)SFITimeFromEffort:(unint64_t)a3
{
  return (unint64_t)((double)a3 * 0.5 * self->_trialSFIIdleWindowParameter * 1000.0);
}

- (void)executeSFIWithEffort:(unint64_t)a3
{
  unsigned int v5 = +[_DASDeviceActivityPolicy isDeviceInUse:self->_context];
  unsigned int v6 = v5;
  if (!a3 || v5)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = @"Effort is 0";
      if (v6) {
        CFStringRef v9 = @"Device in use";
      }
      int v12 = 138412290;
      unint64_t v13 = (unint64_t)v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "No SFI action. (%@)", (uint8_t *)&v12, 0xCu);
    }
    [(_DASControlEngine *)self resetSFIEffort];
  }
  else if (self->_trialdisableSFI)
  {
    int64_t v7 = self->_log;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "SFI action disabled", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    unint64_t v10 = [(_DASControlEngine *)self SFITimeFromEffort:a3];
    id v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134217984;
      unint64_t v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_DEFAULT, "Setting SFI for %lu microseconds", (uint8_t *)&v12, 0xCu);
    }
    if (system_set_sfi_window() == -1 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000F4000();
    }
    if (sfi_set_class_offtime() == -1 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000F3F90();
    }
  }
}

- (void)resetSFIEffort
{
  if (system_set_sfi_window() == -1)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      sub_1000F40F4((os_log_t)log);
    }
  }
  if (sfi_set_class_offtime() == -1)
  {
    int64_t v4 = self->_log;
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      sub_1000F4074((os_log_t)v4);
    }
  }
}

- (unint64_t)dutyCycleTimeFromEffort:(unint64_t)a3
{
  return 2000 * a3;
}

- (void)executeDutyCyclingWithEffort:(unint64_t)a3
{
  uint64_t v4 = [(_DASControlEngine *)self dutyCycleTimeFromEffort:a3];
  if (notify_set_state(self->_timeToken, v4) && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_1000F4174();
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    uint64_t v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Posting dutycycling notification for %lu microseconds", (uint8_t *)&v6, 0xCu);
  }
  notify_post((const char *)[@"com.apple.das.clas.dutyCyclingMicroSeconds" UTF8String]);
}

- (void)resetDutyCyclingEffort
{
  if (notify_set_state(self->_timeToken, 0) && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_1000F4174();
  }
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Posting dutycycling notification for 0 microseconds", v4, 2u);
  }
  notify_post((const char *)[@"com.apple.das.clas.dutyCyclingMicroSeconds" UTF8String]);
}

- (id)startBatteryTemperatureLoop
{
  v3 = objc_opt_new();
  uint64_t v4 = [[_DASBatteryTemperatureAnalyzer alloc] initWithQueueLimit:10 reader:v3 monitoringInterval:30 analyzeToMonitorRatio:2];
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F41E8();
  }
  [(_DASBatteryTemperatureAnalyzer *)v4 start];

  return v4;
}

- (void)resetState
{
  *(_WORD *)&self->_BOOL initialMitigationInitiated = 0;
}

- (void)resetAnalyticsState
{
  currentDutyCycleStartTime = self->_currentDutyCycleStartTime;
  self->_currentDutyCycleStartTime = 0;

  self->_double dutyCycleDuration = 0.0;
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"dutyCycleDuration"];
  defaults = self->_defaults;

  [(NSUserDefaults *)defaults removeObjectForKey:@"controlEffortHistory"];
}

- (id)currentStatus
{
  v3 = +[NSMutableDictionary dictionary];
  uint64_t v4 = +[NSNumber numberWithDouble:self->_dutyCycleDuration];
  [v3 setObject:v4 forKeyedSubscript:@"DutyCycleDuration"];

  if (self->_dutyCycleDuration <= 0.0) {
    unsigned int v5 = &off_100186B50;
  }
  else {
    unsigned int v5 = &off_100186B38;
  }
  [v3 setObject:v5 forKeyedSubscript:@"EngagedDutyCycle"];
  [v3 setObject:self->_trialTreatmentID forKeyedSubscript:@"TreatmentID"];
  [v3 setObject:self->_trialExperimentID forKeyedSubscript:@"ExperimentID"];
  int v6 = +[NSNumber numberWithBool:self->_encounteredTLC];
  [v3 setObject:v6 forKeyedSubscript:@"EncounteredTLC"];

  return v3;
}

- (void)recordSessionAnalytics
{
  id v3 = [(_DASControlEngine *)self currentStatus];
  AnalyticsSendEventLazy();
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F3EA4((uint64_t)v3, log);
  }
}

- (void)setDutyCyclingInitiated:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    unsigned int v5 = +[NSDate date];
    currentDutyCycleStartTime = self->_currentDutyCycleStartTime;
    self->_currentDutyCycleStartTime = v5;

    [(NSUserDefaults *)self->_defaults setObject:self->_currentDutyCycleStartTime forKey:@"currentDutyCycleStartTime"];
  }
  else
  {
    [(NSDate *)self->_currentDutyCycleStartTime timeIntervalSinceNow];
    self->_double dutyCycleDuration = self->_dutyCycleDuration - v7;
    -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", @"dutyCycleDuration");
    os_log_t v8 = self->_currentDutyCycleStartTime;
    self->_currentDutyCycleStartTime = 0;

    [(NSUserDefaults *)self->_defaults removeObjectForKey:@"currentDutyCycleStartTime"];
  }
  defaults = self->_defaults;

  [(NSUserDefaults *)defaults setBool:v3 forKey:@"dutyCycleInitiated"];
}

- (void)setInitialMitigationInitiated:(BOOL)a3
{
}

- (id)startChargeRateLoop
{
  BOOL v3 = objc_opt_new();
  uint64_t v4 = [[_DASChargeRateAnalyzer alloc] initWithQueueLimit:10 reader:v3 monitoringInterval:30 analyzeToMonitorRatio:2];
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    sub_1000F4228();
  }
  [(_DASChargeRateAnalyzer *)v4 start];

  return v4;
}

- (OS_dispatch_queue)executionQueue
{
  return self->_executionQueue;
}

- (void)setExecutionQueue:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (NSMutableDictionary)actionToAnalyzers
{
  return self->_actionToAnalyzers;
}

- (void)setActionToAnalyzers:(id)a3
{
}

- (NSMutableDictionary)actionToTimers
{
  return self->_actionToTimers;
}

- (void)setActionToTimers:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (int)startToken
{
  return self->_startToken;
}

- (void)setStartToken:(int)a3
{
  self->_startToken = a3;
}

- (int)timeToken
{
  return self->_timeToken;
}

- (void)setTimeToken:(int)a3
{
  self->_timeToken = a3;
}

- (BOOL)initialMitigationInitiated
{
  return self->_initialMitigationInitiated;
}

- (BOOL)dutyCyclingInitiated
{
  return self->_dutyCyclingInitiated;
}

- (BOOL)encounteredTLC
{
  return self->_encounteredTLC;
}

- (void)setEncounteredTLC:(BOOL)a3
{
  self->_BOOL encounteredTLC = a3;
}

- (NSDate)encounteredTLCDate
{
  return self->_encounteredTLCDate;
}

- (void)setEncounteredTLCDate:(id)a3
{
}

- (int64_t)lastSavedTLC
{
  return self->_lastSavedTLC;
}

- (void)setLastSavedTLC:(int64_t)a3
{
  self->_int64_t lastSavedTLC = a3;
}

- (int64_t)lastSavedEffort
{
  return self->_lastSavedEffort;
}

- (void)setLastSavedEffort:(int64_t)a3
{
  self->_int64_t lastSavedEffort = a3;
}

- (OS_dispatch_source)analyzerTimer
{
  return self->_analyzerTimer;
}

- (void)setAnalyzerTimer:(id)a3
{
}

- (unint64_t)dutyCyclingMethod
{
  return self->_dutyCyclingMethod;
}

- (void)setDutyCyclingMethod:(unint64_t)a3
{
  self->_unint64_t dutyCyclingMethod = a3;
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSDate)currentDutyCycleStartTime
{
  return self->_currentDutyCycleStartTime;
}

- (void)setCurrentDutyCycleStartTime:(id)a3
{
}

- (double)dutyCycleDuration
{
  return self->_dutyCycleDuration;
}

- (void)setDutyCycleDuration:(double)a3
{
  self->_double dutyCycleDuration = a3;
}

- (TRITrackingId)trialTrackingID
{
  return (TRITrackingId *)objc_getProperty(self, a2, 128, 1);
}

- (void)setTrialTrackingID:(id)a3
{
}

- (NSString)trialTreatmentID
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setTrialTreatmentID:(id)a3
{
}

- (NSString)trialExperimentID
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setTrialExperimentID:(id)a3
{
}

- (int64_t)trialInitialAction
{
  return self->_trialInitialAction;
}

- (void)setTrialInitialAction:(int64_t)a3
{
  self->_trialInitialAction = a3;
}

- (BOOL)trialInitialActionAlways
{
  return self->_trialInitialActionAlways;
}

- (void)setTrialInitialActionAlways:(BOOL)a3
{
  self->_trialInitialActionAlways = a3;
}

- (BOOL)trialdisableSFI
{
  return self->_trialdisableSFI;
}

- (void)setTrialdisableSFI:(BOOL)a3
{
  self->_trialdisableSFI = a3;
}

- (int64_t)trialSFIWindow
{
  return self->_trialSFIWindow;
}

- (void)setTrialSFIWindow:(int64_t)a3
{
  self->_trialSFIWindow = a3;
}

- (double)trialSFIIdleWindowParameter
{
  return self->_trialSFIIdleWindowParameter;
}

- (void)setTrialSFIIdleWindowParameter:(double)a3
{
  self->_double trialSFIIdleWindowParameter = a3;
}

- (_DKKnowledgeSaving)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (NSMutableDictionary)controlEffortHistory
{
  return self->_controlEffortHistory;
}

- (void)setControlEffortHistory:(id)a3
{
}

- (_DASTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_controlEffortHistory, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_trialExperimentID, 0);
  objc_storeStrong((id *)&self->_trialTreatmentID, 0);
  objc_storeStrong((id *)&self->_trialTrackingID, 0);
  objc_storeStrong((id *)&self->_currentDutyCycleStartTime, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_analyzerTimer, 0);
  objc_storeStrong((id *)&self->_encounteredTLCDate, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_actionToTimers, 0);
  objc_storeStrong((id *)&self->_actionToAnalyzers, 0);

  objc_storeStrong((id *)&self->_executionQueue, 0);
}

@end