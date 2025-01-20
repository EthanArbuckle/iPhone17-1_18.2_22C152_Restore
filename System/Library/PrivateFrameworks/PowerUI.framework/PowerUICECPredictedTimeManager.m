@interface PowerUICECPredictedTimeManager
+ (PowerUICECPredictedTimeManager)managerWithContextStore:(id)a3 withHandler:(id)a4;
- (BOOL)hasSufficientTimeForFullCharge;
- (BOOL)tBypassSignals;
- (BOOL)testOverrideForSignalMonitors;
- (NSArray)monitors;
- (NSDate)deadline;
- (NSDate)modelDeadline;
- (NSDate)tModelPredition;
- (NSString)debugStatus;
- (NSUserDefaults)defaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (PowerUIBatteryMitigationManager)batteryMitigationManager;
- (PowerUICECPredictedTimeManager)initWithContextStore:(id)a3 withHandler:(id)a4;
- (PowerUITrialManager)trialManager;
- (_CDLocalContext)context;
- (_OSChargingPredictor)pluggedInPredictor;
- (double)leewayForConfidence:(double)a3;
- (double)predictionLeeway;
- (double)timeToFullChargeFromBatteryLevel:(unint64_t)a3;
- (id)deadlineFromMonitors;
- (id)handler;
- (id)predictedUnplugTime;
- (id)testingOverrideForPredictedUnplugTime;
- (void)debug;
- (void)monitor:(id)a3 maySuggestNewFullChargeDeadline:(id)a4;
- (void)resetState;
- (void)setBatteryMitigationManager:(id)a3;
- (void)setContext:(id)a3;
- (void)setDeadline:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setHandler:(id)a3;
- (void)setLog:(id)a3;
- (void)setModelDeadline:(id)a3;
- (void)setMonitors:(id)a3;
- (void)setPluggedInPredictor:(id)a3;
- (void)setPredictionLeeway:(double)a3;
- (void)setQueue:(id)a3;
- (void)setTBypassSignals:(BOOL)a3;
- (void)setTModelPredition:(id)a3;
- (void)setTrialManager:(id)a3;
- (void)startAllMonitoring;
- (void)stopAllMonitoring;
@end

@implementation PowerUICECPredictedTimeManager

- (PowerUICECPredictedTimeManager)initWithContextStore:(id)a3 withHandler:(id)a4
{
  v44[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v43.receiver = self;
  v43.super_class = (Class)PowerUICECPredictedTimeManager;
  v9 = [(PowerUICECPredictedTimeManager *)&v43 init];
  if (v9)
  {
    os_log_t v10 = os_log_create("com.apple.powerui.cec", "predictedTimeManager");
    log = v9->_log;
    v9->_log = (OS_os_log *)v10;

    objc_storeStrong((id *)&v9->_context, a3);
    debugStatus = v9->_debugStatus;
    v9->_debugStatus = (NSString *)&stru_26D3439E8;

    uint64_t v13 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.powerui.cec"];
    defaults = v9->_defaults;
    v9->_defaults = (NSUserDefaults *)v13;

    v9->_predictionLeeway = 18000.0;
    v15 = [[PowerUITrialManager alloc] initWithDefaultsDomain:@"com.apple.powerui.cec"];
    trialManager = v9->_trialManager;
    v9->_trialManager = v15;

    v9->_tBypassSignals = [(NSUserDefaults *)v9->_defaults BOOLForKey:@"testBypassSignals"];
    uint64_t v17 = +[PowerUIBatteryMitigationManager sharedManager];
    batteryMitigationManager = v9->_batteryMitigationManager;
    v9->_batteryMitigationManager = (PowerUIBatteryMitigationManager *)v17;

    v19 = [(NSUserDefaults *)v9->_defaults objectForKey:@"testModelDuration"];
    v20 = v19;
    if (v19)
    {
      v21 = (void *)MEMORY[0x263EFF910];
      [v19 doubleValue];
      uint64_t v22 = objc_msgSend(v21, "dateWithTimeIntervalSinceNow:");
      tModelPredition = v9->_tModelPredition;
      v9->_tModelPredition = (NSDate *)v22;
    }
    uint64_t v24 = [MEMORY[0x263F5B668] predictor];
    pluggedInPredictor = v9->_pluggedInPredictor;
    v9->_pluggedInPredictor = (_OSChargingPredictor *)v24;

    v26 = [(NSUserDefaults *)v9->_defaults objectForKey:@"predictedDeadline"];

    v27 = (void *)MEMORY[0x263EFF910];
    if (v26)
    {
      [v26 doubleValue];
      objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
    }
    else
    {
      [MEMORY[0x263EFF910] distantFuture];
    uint64_t v28 = };
    deadline = v9->_deadline;
    v9->_deadline = (NSDate *)v28;

    v30 = [(NSUserDefaults *)v9->_defaults objectForKey:@"predictedModelDeadline"];

    if (v30)
    {
      v31 = (void *)MEMORY[0x263EFF910];
      [v30 doubleValue];
      uint64_t v32 = objc_msgSend(v31, "dateWithTimeIntervalSinceReferenceDate:");
      modelDeadline = v9->_modelDeadline;
      v9->_modelDeadline = (NSDate *)v32;
    }
    v34 = +[PowerUIAlarmSignalMonitor monitorWithDelegate:v9 trialManager:v9->_trialManager withContext:v9->_context];
    v44[0] = v34;
    v35 = +[PowerUIWalletSignalMonitor monitorWithDelegate:v9];
    v44[1] = v35;
    v36 = +[PowerUICalendarSignalMonitor monitorWithDelegate:v9 trialManager:v9->_trialManager withContext:v9->_context];
    v44[2] = v36;
    v37 = +[PowerUILocationSignalMonitor monitorWithDelegate:v9 trialManager:v9->_trialManager withContext:v9->_context];
    v44[3] = v37;
    uint64_t v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v44 count:4];
    monitors = v9->_monitors;
    v9->_monitors = (NSArray *)v38;

    uint64_t v40 = MEMORY[0x223C80C20](v8);
    id handler = v9->_handler;
    v9->_id handler = (id)v40;
  }
  return v9;
}

+ (PowerUICECPredictedTimeManager)managerWithContextStore:(id)a3 withHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__PowerUICECPredictedTimeManager_managerWithContextStore_withHandler___block_invoke;
  v12[3] = &unk_2645A6E08;
  id v13 = v5;
  id v14 = v6;
  uint64_t v7 = managerWithContextStore_withHandler__onceToken;
  id v8 = v6;
  id v9 = v5;
  if (v7 != -1) {
    dispatch_once(&managerWithContextStore_withHandler__onceToken, v12);
  }
  os_log_t v10 = (PowerUICECPredictedTimeManager *)(id)managerWithContextStore_withHandler__manager;

  return v10;
}

uint64_t __70__PowerUICECPredictedTimeManager_managerWithContextStore_withHandler___block_invoke(uint64_t a1)
{
  managerWithContextStore_withHandler__manager = [[PowerUICECPredictedTimeManager alloc] initWithContextStore:*(void *)(a1 + 32) withHandler:*(void *)(a1 + 40)];
  return MEMORY[0x270F9A758]();
}

- (void)startAllMonitoring
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_monitors;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "startMonitoring", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)stopAllMonitoring
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_monitors;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "stopMonitoring", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (BOOL)testOverrideForSignalMonitors
{
  BOOL v3 = [(NSUserDefaults *)self->_defaults BOOLForKey:@"testBypassSignals"];
  if (v3)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "TestMode: Bypass Signals set", v6, 2u);
    }
  }
  return v3;
}

- (id)deadlineFromMonitors
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PowerUICECPredictedTimeManager *)self testOverrideForSignalMonitors];
  self->_tBypassSignals = v3;
  if (v3)
  {
    debugStatus = self->_debugStatus;
    uint64_t v5 = @"\n";
    if (!debugStatus) {
      uint64_t v5 = &stru_26D3439E8;
    }
    uint64_t v6 = NSString;
    long long v7 = v5;
    long long v8 = [v6 stringWithFormat:@"%@%@%@", debugStatus, v7, @"Signal monitors overriden"];
    long long v9 = self->_debugStatus;
    self->_debugStatus = v8;

    long long v10 = [MEMORY[0x263EFF910] distantFuture];
  }
  else
  {
    long long v10 = [MEMORY[0x263EFF910] distantFuture];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obj = self->_monitors;
    uint64_t v11 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      long long v7 = 0;
      uint64_t v13 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          v16 = [v15 requiredFullChargeDate];
          if (v16)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v32 = v15;
              __int16 v33 = 2112;
              v34 = v16;
              _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Monitor %@ suggested %@", buf, 0x16u);
            }
            v18 = [v10 earlierDate:v16];

            if ([v18 isEqualToDate:v16])
            {
              v19 = NSString;
              v20 = [MEMORY[0x263F08790] localizedStringFromDate:v16 dateStyle:1 timeStyle:1];
              uint64_t v21 = [v19 stringWithFormat:@"Monitor %@ suggested %@", v15, v20];

              long long v7 = (__CFString *)v21;
            }
            long long v10 = v18;
          }
        }
        uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v12);
    }
    else
    {
      long long v7 = 0;
    }

    uint64_t v22 = [NSString stringWithFormat:@"%@\n%@", self->_debugStatus, 0];
    v23 = self->_debugStatus;
    self->_debugStatus = v22;

    uint64_t v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v32 = v10;
      _os_log_impl(&dword_22135E000, v24, OS_LOG_TYPE_DEFAULT, "Monitors suggested: %@", buf, 0xCu);
    }
  }

  return v10;
}

- (BOOL)hasSufficientTimeForFullCharge
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  debugStatus = self->_debugStatus;
  self->_debugStatus = (NSString *)&stru_26D3439E8;

  uint64_t v4 = [(PowerUICECPredictedTimeManager *)self predictedUnplugTime];
  uint64_t v5 = [(PowerUICECPredictedTimeManager *)self deadlineFromMonitors];
  uint64_t v6 = [(NSDate *)v4 earlierDate:v5];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v4;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Model Deadline is %@", buf, 0xCu);
  }
  long long v8 = self->_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v5;
    _os_log_impl(&dword_22135E000, v8, OS_LOG_TYPE_DEFAULT, "Signal Deadline is %@", buf, 0xCu);
  }
  long long v9 = self->_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v6;
    _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "Deadline is %@", buf, 0xCu);
  }
  long long v10 = [(NSDate *)v6 dateByAddingTimeInterval:-1800.0];

  uint64_t v11 = self->_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v10;
    _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "Deadline post buffer is %@", buf, 0xCu);
  }
  if ([(PowerUIBatteryMitigationManager *)self->_batteryMitigationManager mitigationsCurrentlyEnabled])
  {
    uint64_t v12 = [MEMORY[0x263EFF910] distantPast];

    long long v10 = (NSDate *)v12;
  }
  uint64_t v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = v10;
    _os_log_impl(&dword_22135E000, v13, OS_LOG_TYPE_DEFAULT, "Deadline post battery mitigations is %@", buf, 0xCu);
  }
  [(PowerUICECPredictedTimeManager *)self timeToFullChargeFromBatteryLevel:+[PowerUISmartChargeUtilities currentBatteryLevelWithContext:self->_context]];
  double v15 = v14;
  v16 = self->_log;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = NSNumber;
    v18 = v16;
    v19 = [v17 numberWithDouble:v15];
    *(_DWORD *)buf = 138412290;
    v41 = v19;
    _os_log_impl(&dword_22135E000, v18, OS_LOG_TYPE_DEFAULT, "Time to full charge is %@", buf, 0xCu);
  }
  [(NSDate *)self->_deadline timeIntervalSinceReferenceDate];
  double v21 = v20;
  [(NSDate *)v10 timeIntervalSinceReferenceDate];
  if (!self->_deadline || v22 < v21)
  {
    v23 = self->_log;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v10;
      _os_log_impl(&dword_22135E000, v23, OS_LOG_TYPE_DEFAULT, "Setting new deadline %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&self->_deadline, v10);
    defaults = self->_defaults;
    [(NSDate *)self->_deadline timeIntervalSinceReferenceDate];
    -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", @"predictedDeadline");
  }
  v25 = self->_log;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    deadline = self->_deadline;
    *(_DWORD *)buf = 138412290;
    v41 = deadline;
    _os_log_impl(&dword_22135E000, v25, OS_LOG_TYPE_DEFAULT, "Final deadline is %@", buf, 0xCu);
  }
  long long v27 = NSString;
  long long v28 = [MEMORY[0x263F08790] localizedStringFromDate:self->_deadline dateStyle:1 timeStyle:1];
  long long v29 = [v27 stringWithFormat:@"Final deadline is %@", v28];

  long long v30 = [NSString stringWithFormat:@"%@\n%@", self->_debugStatus, v29];
  v31 = self->_debugStatus;
  self->_debugStatus = v30;

  uint64_t v32 = NSString;
  [(NSDate *)self->_deadline timeIntervalSinceNow];
  v34 = [v32 stringWithFormat:@"Time to full charge %d mins, Time from deadline %d mins", ((int)v15 / 60), ((int)v33 / 60)];

  v35 = [NSString stringWithFormat:@"%@\n%@", self->_debugStatus, v34];
  uint64_t v36 = self->_debugStatus;
  self->_debugStatus = v35;

  [(NSDate *)self->_deadline timeIntervalSinceNow];
  BOOL v38 = v37 > v15;

  return v38;
}

- (id)testingOverrideForPredictedUnplugTime
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v3 = [(NSUserDefaults *)self->_defaults objectForKey:@"testModelDuration"];
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)MEMORY[0x263EFF910];
    [v3 doubleValue];
    objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
    uint64_t v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    tModelPredition = self->_tModelPredition;
    self->_tModelPredition = v6;

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = self->_tModelPredition;
      int v12 = 138412290;
      uint64_t v13 = v9;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "TestMode: ModelPrediction set to %@", (uint8_t *)&v12, 0xCu);
    }
  }
  long long v10 = self->_tModelPredition;

  return v10;
}

- (double)leewayForConfidence:(double)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  [(PowerUITrialManager *)self->_trialManager doubleFactorForName:@"thresholdForCECWithPluginModel"];
  double v6 = v5;
  [(PowerUITrialManager *)self->_trialManager doubleFactorForName:@"leewayForCECWithPluginModel"];
  double v8 = v7;
  log = self->_log;
  BOOL v10 = os_log_type_enabled(log, OS_LOG_TYPE_INFO);
  if (v6 == 0.0 || v8 == 0.0)
  {
    double v8 = 18900.0;
    double v6 = 0.575;
    if (!v10) {
      goto LABEL_8;
    }
    LOWORD(v16) = 0;
    uint64_t v11 = "Trial parameter loading failed resorting to defaults";
    int v12 = log;
    uint32_t v13 = 2;
  }
  else
  {
    if (!v10) {
      goto LABEL_8;
    }
    int v16 = 134218240;
    double v17 = v6;
    __int16 v18 = 2048;
    double v19 = v8;
    uint64_t v11 = "Loaded threshold %f and leeway %f from trial ";
    int v12 = log;
    uint32_t v13 = 22;
  }
  _os_log_impl(&dword_22135E000, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v16, v13);
LABEL_8:
  uint64_t v14 = self->_log;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v16 = 134218496;
    double v17 = a3;
    __int16 v18 = 2048;
    double v19 = v6;
    __int16 v20 = 2048;
    double v21 = v8;
    _os_log_impl(&dword_22135E000, v14, OS_LOG_TYPE_INFO, "Evaluating confidence %f with threshold of %f and leeway of %f", (uint8_t *)&v16, 0x20u);
  }
  double result = INFINITY;
  if (v6 < a3) {
    return v8;
  }
  return result;
}

- (id)predictedUnplugTime
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PowerUICECPredictedTimeManager *)self testingOverrideForPredictedUnplugTime];
  if (v3)
  {
    uint64_t v4 = NSString;
    double v5 = [MEMORY[0x263F08790] localizedStringFromDate:v3 dateStyle:1 timeStyle:1];
    double v6 = [v4 stringWithFormat:@"ML model deadline is overriden to %@", v5];

    objc_storeStrong((id *)&self->_debugStatus, v6);
    double v7 = v3;
LABEL_5:
    uint64_t v11 = v7;
    goto LABEL_6;
  }
  modelDeadline = self->_modelDeadline;
  if (modelDeadline)
  {
    long long v9 = NSString;
    BOOL v10 = [MEMORY[0x263F08790] localizedStringFromDate:modelDeadline dateStyle:1 timeStyle:1];
    double v6 = [v9 stringWithFormat:@"Cached ML model predicted deadline %@", v10];

    objc_storeStrong((id *)&self->_debugStatus, v6);
    double v7 = self->_modelDeadline;
    goto LABEL_5;
  }
  pluggedInPredictor = self->_pluggedInPredictor;
  id v34 = 0;
  uint64_t v14 = [(_OSChargingPredictor *)pluggedInPredictor chargePredictionOutputOfScheme:1 withError:&v34];
  id v15 = v34;
  if (v15)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = log;
      __int16 v18 = [v15 localizedDescription];
      *(_DWORD *)buf = 138412290;
      double v36 = *(double *)&v18;
      _os_log_impl(&dword_22135E000, v17, OS_LOG_TYPE_DEFAULT, "Error querying the predictor through the client %@", buf, 0xCu);
    }
  }
  [v14 confidence];
  double v20 = v19;
  [v14 chargingDuration];
  double v22 = v21;
  [(PowerUICECPredictedTimeManager *)self leewayForConfidence:v20];
  self->_double predictionLeeway = v23;
  double v24 = fmin(fmax(v22 - v23, 0.0), 36000.0);
  v25 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v24];
  v26 = self->_log;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    double predictionLeeway = self->_predictionLeeway;
    *(_DWORD *)buf = 134218754;
    double v36 = v24;
    __int16 v37 = 2112;
    BOOL v38 = v25;
    __int16 v39 = 2048;
    double v40 = predictionLeeway;
    __int16 v41 = 2048;
    double v42 = v20;
    _os_log_impl(&dword_22135E000, v26, OS_LOG_TYPE_DEFAULT, "OSIntelligence predicts device to be plugged in for %lf until %@ after leeway of %lf with confidence %lf", buf, 0x2Au);
  }
  if (v20 <= 0.575)
  {
    long long v29 = self->_log;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v29, OS_LOG_TYPE_DEFAULT, "Prediction model not confident. Setting an earlier date", buf, 2u);
    }
    long long v28 = [MEMORY[0x263EFF910] date];
  }
  else
  {
    long long v28 = v25;
  }
  long long v30 = self->_modelDeadline;
  self->_modelDeadline = v28;

  defaults = self->_defaults;
  [(NSDate *)self->_modelDeadline timeIntervalSinceReferenceDate];
  -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", @"predictedModelDeadline");
  uint64_t v32 = NSString;
  double v33 = [MEMORY[0x263F08790] localizedStringFromDate:self->_modelDeadline dateStyle:1 timeStyle:1];
  double v6 = [v32 stringWithFormat:@"ML model predicted deadline %@ (confidence %lf)", v33, *(void *)&v20];

  objc_storeStrong((id *)&self->_debugStatus, v6);
  uint64_t v11 = self->_modelDeadline;

LABEL_6:
  return v11;
}

- (double)timeToFullChargeFromBatteryLevel:(unint64_t)a3
{
  if (a3 == 80)
  {
    BOOL v3 = +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:80 withMinimumPluginDuration:1200];
    if ((unint64_t)[v3 count] >= 3)
    {
      uint64_t v4 = [v3 sortedArrayUsingSelector:sel_compare_];
      uint64_t v5 = objc_msgSend(v4, "subarrayWithRange:", 1, objc_msgSend(v4, "count") - 2);

      BOOL v3 = (void *)v5;
    }
    [v3 percentile:0.95];
    double v7 = v6;
    if ((unint64_t)[v3 count] < 4)
    {
      double v9 = 5400.0;
    }
    else
    {
      double v8 = fmin(v7 / 60.0, 180.0);
      if (v8 <= 40.0) {
        double v9 = 2400.0;
      }
      else {
        double v9 = v8 * 60.0;
      }
    }
  }
  else if (a3 - 31 > 0x2B)
  {
    return 14400.0;
  }
  else
  {
    return (double)(60 * (170 - a3) + 15);
  }
  return v9;
}

- (void)debug
{
  id v2 = [(PowerUICECPredictedTimeManager *)self predictedUnplugTime];
}

- (void)monitor:(id)a3 maySuggestNewFullChargeDeadline:(id)a4
{
  [a4 timeIntervalSinceDate:self->_deadline];
  if (v5 < 0.0)
  {
    double v6 = (void (*)(void))*((void *)self->_handler + 2);
    v6();
  }
}

- (void)resetState
{
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"predictedDeadline"];
  [(NSUserDefaults *)self->_defaults removeObjectForKey:@"predictedModelDeadline"];
  deadline = self->_deadline;
  self->_deadline = 0;

  modelDeadline = self->_modelDeadline;
  self->_modelDeadline = 0;

  [(PowerUICECPredictedTimeManager *)self stopAllMonitoring];
}

- (NSDate)deadline
{
  return self->_deadline;
}

- (void)setDeadline:(id)a3
{
}

- (NSString)debugStatus
{
  return self->_debugStatus;
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

- (NSArray)monitors
{
  return self->_monitors;
}

- (void)setMonitors:(id)a3
{
}

- (PowerUITrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (_OSChargingPredictor)pluggedInPredictor
{
  return self->_pluggedInPredictor;
}

- (void)setPluggedInPredictor:(id)a3
{
}

- (NSDate)modelDeadline
{
  return self->_modelDeadline;
}

- (void)setModelDeadline:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSDate)tModelPredition
{
  return self->_tModelPredition;
}

- (void)setTModelPredition:(id)a3
{
}

- (BOOL)tBypassSignals
{
  return self->_tBypassSignals;
}

- (void)setTBypassSignals:(BOOL)a3
{
  self->_tBypassSignals = a3;
}

- (double)predictionLeeway
{
  return self->_predictionLeeway;
}

- (void)setPredictionLeeway:(double)a3
{
  self->_double predictionLeeway = a3;
}

- (PowerUIBatteryMitigationManager)batteryMitigationManager
{
  return self->_batteryMitigationManager;
}

- (void)setBatteryMitigationManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryMitigationManager, 0);
  objc_storeStrong((id *)&self->_tModelPredition, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_modelDeadline, 0);
  objc_storeStrong((id *)&self->_pluggedInPredictor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_monitors, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_debugStatus, 0);
  objc_storeStrong((id *)&self->_deadline, 0);
}

@end