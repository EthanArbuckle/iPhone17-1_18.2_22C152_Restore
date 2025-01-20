@interface PowerUIMLTwoStageModelPredictor
- (MLModel)durationModel;
- (MLModel)engageModel;
- (NSDate)deadline;
- (NSDate)pluginDate;
- (NSNumber)confidenceOverride;
- (NSNumber)durationOverride;
- (NSString)defaultsDomain;
- (NSURL)compiledClassifier;
- (NSURL)compiledRegressor;
- (OS_os_log)log;
- (OS_os_log)statusLog;
- (PowerUIMLTwoStageModelPredictor)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5;
- (PowerUIModelQueryResult)chargingDecision:(SEL)a3 withPluginDate:(unint64_t)a4 withPluginBatteryLevel:(id)a5 forDate:(double)a6 withLog:(id)a7;
- (PowerUITrialManager)trialManager;
- (_CDLocalContext)context;
- (double)adjustedChargingDecision:(unint64_t)a3 withPluginDate:(id)a4 withPluginBatteryLevel:(double)a5 forDate:(id)a6 forStatus:(BOOL)a7;
- (double)adjustedDuration;
- (double)getHourBinID:(id)a3 forHourBin:(unint64_t)a4;
- (double)lastDurationResult;
- (double)lastEngagementResult;
- (double)loadAdjustedHoursForModel:(id)a3;
- (double)loadMinInputChargeDuration;
- (double)loadThresholdForModel:(id)a3;
- (double)minInputChargeDuration;
- (double)pluginBatteryLevel;
- (double)threshold;
- (id)adjustDeadlineForReengagement;
- (id)arrayWithShape:(id)a3 values:(id)a4 type:(int64_t)a5;
- (id)convertInputFeaturesToNeuralFeatures:(id)a3;
- (id)durationModelBoltID;
- (id)engagementModelBoltID;
- (id)getInputFeaturesWithPluginDate:(id)a3 withPluginBatteryLevel:(double)a4 forDate:(id)a5 withLog:(id)a6;
- (id)predictFullChargeDateWithBatteryLevel:(unint64_t)a3;
- (id)timeStringFromDate:(id)a3;
- (os_unfair_lock_s)loadModelLock;
- (unint64_t)durationModelVersion;
- (unint64_t)engagementModelVersion;
- (unint64_t)predictorType;
- (void)deleteCompiledModels;
- (void)deleteUpdatedModels;
- (void)engageModel;
- (void)loadDurationModelFromURL:(id)a3;
- (void)loadEngagementModelFromURL:(id)a3;
- (void)loadTrial;
- (void)resetSavedDeadline;
- (void)setAdjustedDuration:(double)a3;
- (void)setCompiledClassifier:(id)a3;
- (void)setCompiledRegressor:(id)a3;
- (void)setConfidenceOverride:(id)a3;
- (void)setContext:(id)a3;
- (void)setDeadline:(id)a3;
- (void)setDefaultsDomain:(id)a3;
- (void)setDurationOverride:(id)a3;
- (void)setLastDurationResult:(double)a3;
- (void)setLastEngagementResult:(double)a3;
- (void)setLoadModelLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setMinInputChargeDuration:(double)a3;
- (void)setPluginBatteryLevel:(double)a3;
- (void)setPluginDate:(id)a3;
- (void)setStatusLog:(id)a3;
- (void)setThreshold:(double)a3;
- (void)setTrialManager:(id)a3;
@end

@implementation PowerUIMLTwoStageModelPredictor

- (MLModel)engageModel
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  unint64_t v3 = 0x2645A5000uLL;
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"Beginning of engageModel"];
  os_unfair_lock_lock(&self->_loadModelLock);
  if (!self->_engageModel)
  {
    v4 = [(PowerUITrialManager *)self->_trialManager loadTrialEngageModelByDeletingExistingModel:0];
    engageModel = self->_engageModel;
    self->_engageModel = v4;

    v6 = self->_engageModel;
    v7 = self->_log;
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v7, OS_LOG_TYPE_DEFAULT, "Trial engage model found!", buf, 2u);
      }
      v9 = 0;
      id v10 = 0;
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, v7, OS_LOG_TYPE_DEFAULT, "Trial engage model not found...falling back to default model", buf, 2u);
      }
      v11 = NSURL;
      v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v12 pathForResource:@"engageModel" ofType:@"mlmodelc"];
      v9 = [v11 fileURLWithPath:v13];

      id v38 = 0;
      v14 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v9 error:&v38];
      id v10 = v38;
      v15 = self->_engageModel;
      self->_engageModel = v14;

      if (v10 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[PowerUIMLTwoStageModelPredictor engageModel]();
      }
    }
    [(PowerUIMLTwoStageModelPredictor *)self loadThresholdForModel:self->_engageModel];
    self->_threshold = v16;
    v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_engageModel;
      log = v17;
      v36 = [(MLModel *)v18 modelDescription];
      v35 = [v36 metadata];
      uint64_t v19 = *MEMORY[0x263F00CF0];
      v34 = [v35 objectForKeyedSubscript:*MEMORY[0x263F00CF0]];
      [v34 objectForKeyedSubscript:@"model_version"];
      v20 = id v37 = v10;
      v21 = [(MLModel *)self->_engageModel modelDescription];
      v22 = [v21 metadata];
      v23 = [v22 objectForKeyedSubscript:v19];
      v24 = [v23 objectForKeyedSubscript:@"bolt_id"];
      v25 = [NSNumber numberWithDouble:self->_threshold];
      *(_DWORD *)buf = 138413058;
      v40 = @"engageModel";
      __int16 v41 = 2112;
      v42 = v20;
      __int16 v43 = 2112;
      v44 = v24;
      __int16 v45 = 2112;
      v46 = v25;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Engagement model: %@.%@ from bolt job = %@ (threshold = %@)", buf, 0x2Au);

      unint64_t v3 = 0x2645A5000;
      id v10 = v37;
    }
    else
    {
      uint64_t v19 = *MEMORY[0x263F00CF0];
    }
    v26 = *(void **)(v3 + 2584);
    v27 = [(MLModel *)self->_engageModel modelDescription];
    v28 = [v27 metadata];
    v29 = [v28 objectForKeyedSubscript:v19];
    v30 = [v29 objectForKeyedSubscript:@"model_version"];
    [v26 setString:v30 forPreferenceKey:@"engageBoltID" inDomain:self->_defaultsDomain];
  }
  os_unfair_lock_unlock(&self->_loadModelLock);
  [*(id *)(v3 + 2584) logMemoryUsageInternalForEvent:@"End of loadModelFromPath"];
  v31 = self->_engageModel;
  return v31;
}

- (MLModel)durationModel
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  unint64_t v3 = 0x2645A5000uLL;
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"Beginning of durationModel"];
  os_unfair_lock_lock(&self->_loadModelLock);
  if (!self->_durationModel)
  {
    v4 = [(PowerUITrialManager *)self->_trialManager loadTrialDurationModelByDeletingExistingModel:0];
    durationModel = self->_durationModel;
    self->_durationModel = v4;

    v6 = self->_durationModel;
    log = self->_log;
    BOOL v8 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Trial duration model found!", buf, 2u);
      }
    }
    else
    {
      if (v8)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Trial duration model not found...falling back to default model", buf, 2u);
      }
      v9 = NSURL;
      id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v11 = [v10 pathForResource:@"durationModel" ofType:@"mlmodelc"];
      v12 = [v9 fileURLWithPath:v11];

      v13 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v12 error:0];
      v14 = self->_durationModel;
      self->_durationModel = v13;
    }
    [(PowerUIMLTwoStageModelPredictor *)self loadAdjustedHoursForModel:self->_durationModel];
    self->_adjustedDuration = v15;
    double v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_durationModel;
      v18 = v16;
      v35 = [(MLModel *)v17 modelDescription];
      v34 = [v35 metadata];
      uint64_t v19 = *MEMORY[0x263F00CF0];
      v33 = [v34 objectForKeyedSubscript:*MEMORY[0x263F00CF0]];
      v20 = [v33 objectForKeyedSubscript:@"model_version"];
      v21 = [(MLModel *)self->_durationModel modelDescription];
      v22 = [v21 metadata];
      v23 = [v22 objectForKeyedSubscript:v19];
      v24 = [v23 objectForKeyedSubscript:@"bolt_id"];
      v25 = [NSNumber numberWithDouble:self->_adjustedDuration];
      *(_DWORD *)buf = 138413058;
      id v37 = @"durationModel";
      __int16 v38 = 2112;
      v39 = v20;
      __int16 v40 = 2112;
      __int16 v41 = v24;
      __int16 v42 = 2112;
      __int16 v43 = v25;
      _os_log_impl(&dword_22135E000, v18, OS_LOG_TYPE_DEFAULT, "Duration model: %@.%@ from bolt job = %@ (adjusted duration = %@)", buf, 0x2Au);

      unint64_t v3 = 0x2645A5000;
    }
    else
    {
      uint64_t v19 = *MEMORY[0x263F00CF0];
    }
    v26 = *(void **)(v3 + 2584);
    v27 = [(MLModel *)self->_durationModel modelDescription];
    v28 = [v27 metadata];
    v29 = [v28 objectForKeyedSubscript:v19];
    v30 = [v29 objectForKeyedSubscript:@"model_version"];
    [v26 setString:v30 forPreferenceKey:@"durationBoltID" inDomain:self->_defaultsDomain];
  }
  os_unfair_lock_unlock(&self->_loadModelLock);
  [*(id *)(v3 + 2584) logMemoryUsageInternalForEvent:@"End of durationModel"];
  v31 = self->_durationModel;
  return v31;
}

- (id)timeStringFromDate:(id)a3
{
  uint64_t v3 = timeStringFromDate__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&timeStringFromDate__onceToken, &__block_literal_global_1);
  }
  v5 = [(id)timeStringFromDate__formatter stringFromDate:v4];

  return v5;
}

uint64_t __54__PowerUIMLTwoStageModelPredictor_timeStringFromDate___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  v1 = (void *)timeStringFromDate__formatter;
  timeStringFromDate__formatter = (uint64_t)v0;

  [(id)timeStringFromDate__formatter setDateStyle:1];
  v2 = (void *)timeStringFromDate__formatter;
  return [v2 setTimeStyle:1];
}

- (PowerUIMLTwoStageModelPredictor)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)PowerUIMLTwoStageModelPredictor;
  v12 = [(PowerUIMLTwoStageModelPredictor *)&v30 init];
  v13 = v12;
  if (v12)
  {
    v12->_loadModelLock._os_unfair_lock_opaque = 0;
    os_log_t v14 = os_log_create("com.apple.powerui.smartcharging", "mltwostagemodelpredictor");
    log = v13->_log;
    v13->_log = (OS_os_log *)v14;

    os_log_t v16 = os_log_create("com.apple.powerui.smartcharging", "mltwostagemodelpredictorStatusLog");
    statusLog = v13->_statusLog;
    v13->_statusLog = (OS_os_log *)v16;

    objc_storeStrong((id *)&v13->_defaultsDomain, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    uint64_t v18 = +[PowerUISmartChargeUtilities dateForPreferenceKey:@"twoStageModelOutput" inDomain:v13->_defaultsDomain];
    deadline = v13->_deadline;
    v13->_deadline = (NSDate *)v18;

    v20 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"twoStageModelEngagementResult" inDomain:v13->_defaultsDomain];
    [v20 doubleValue];
    v13->_lastEngagementResult = v21;

    v22 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"twoStageModelDurationResult" inDomain:v13->_defaultsDomain];
    [v22 doubleValue];
    v13->_lastDurationResult = v23;

    objc_storeStrong((id *)&v13->_trialManager, a5);
    [(PowerUIMLTwoStageModelPredictor *)v13 loadMinInputChargeDuration];
    v13->_minInputChargeDuration = v24;
    v13->_threshold = 1.0;
    uint64_t v25 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"twoStageModelConfidenceOverride" inDomain:v13->_defaultsDomain];
    confidenceOverride = v13->_confidenceOverride;
    v13->_confidenceOverride = (NSNumber *)v25;

    uint64_t v27 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"twoStageModelDurationOverride" inDomain:v13->_defaultsDomain];
    durationOverride = v13->_durationOverride;
    v13->_durationOverride = (NSNumber *)v27;
  }
  return v13;
}

- (unint64_t)predictorType
{
  return 2;
}

- (void)loadTrial
{
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"Beginning of loadTrial"];
  uint64_t v3 = [(PowerUITrialManager *)self->_trialManager loadTrialEngageModelByDeletingExistingModel:1];
  engageModel = self->_engageModel;
  self->_engageModel = v3;

  v5 = [(PowerUITrialManager *)self->_trialManager loadTrialDurationModelByDeletingExistingModel:1];
  durationModel = self->_durationModel;
  self->_durationModel = v5;

  [(PowerUIMLTwoStageModelPredictor *)self loadThresholdForModel:self->_engageModel];
  self->_threshold = v7;
  [(PowerUIMLTwoStageModelPredictor *)self loadAdjustedHoursForModel:self->_durationModel];
  self->_adjustedDuration = v8;
  [(PowerUIMLTwoStageModelPredictor *)self loadMinInputChargeDuration];
  self->_minInputChargeDuration = v9;
  [(PowerUIMLTwoStageModelPredictor *)self resetSavedDeadline];
  +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:@"End of loadTrial"];
}

- (double)loadThresholdForModel:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PowerUITrialManager *)self->_trialManager loadTrialThreshold];
  double v6 = v5;
  if (v5 <= 0.0)
  {
    double v7 = [v4 modelDescription];
    double v8 = [v7 metadata];
    double v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F00CF0]];
    id v10 = [v9 objectForKeyedSubscript:@"threshold"];
    [v10 doubleValue];
    double v6 = v11;

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      double v15 = v6;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Failed to load trial threshold. Falling back to default %lf", (uint8_t *)&v14, 0xCu);
    }
  }

  return v6;
}

- (double)loadAdjustedHoursForModel:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(PowerUITrialManager *)self->_trialManager loadTrialAdjustedHours];
  double v6 = v5;
  if (v5 <= 0.0)
  {
    double v7 = [v4 modelDescription];
    double v8 = [v7 metadata];
    double v9 = [v8 objectForKeyedSubscript:*MEMORY[0x263F00CF0]];
    id v10 = [v9 objectForKeyedSubscript:@"leeway"];
    [v10 doubleValue];
    double v6 = v11;

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      double v15 = v6;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Failed to load trial adjusted hours. Falling back to default %lf", (uint8_t *)&v14, 0xCu);
    }
  }

  return v6;
}

- (double)loadMinInputChargeDuration
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [(PowerUITrialManager *)self->_trialManager loadTrialMinInputChargeDuration];
  double v4 = v3;
  if (v3 <= 0.0)
  {
    log = self->_log;
    double v4 = 600.0;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = 0x4082C00000000000;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Failed to load trial minimum duration for model input. Falling back to default %lf", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4;
}

- (id)arrayWithShape:(id)a3 values:(id)a4 type:(int64_t)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    if (!v8)
    {
      double v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
      v18[0] = v11;
      id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    }
    v12 = (void *)[objc_alloc(MEMORY[0x263F00DA8]) initWithShape:v8 dataType:a5 error:0];
    if (v12 && [v10 count])
    {
      unint64_t v13 = 0;
      do
      {
        int v14 = [v10 objectAtIndexedSubscript:v13];
        [v12 setObject:v14 atIndexedSubscript:v13];

        ++v13;
      }
      while (v13 < [v10 count]);
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Values not present", v17, 2u);
    }
    v12 = 0;
  }

  return v12;
}

- (unint64_t)engagementModelVersion
{
  return 3;
}

- (id)engagementModelBoltID
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v3 = +[PowerUISmartChargeUtilities readStringForPreferenceKey:@"engageBoltID" inDomain:self->_defaultsDomain];
  if (!v3)
  {
    double v4 = [(PowerUIMLTwoStageModelPredictor *)self engageModel];
    double v5 = [v4 modelDescription];
    double v6 = [v5 metadata];
    int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F00CF0]];
    double v3 = [v7 objectForKeyedSubscript:@"model_version"];
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Engagement model bolt ID is %@", (uint8_t *)&v11, 0xCu);
  }
  if (v3) {
    id v9 = v3;
  }
  else {
    id v9 = @"Unknown";
  }

  return v9;
}

- (unint64_t)durationModelVersion
{
  return 3;
}

- (id)durationModelBoltID
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  double v3 = +[PowerUISmartChargeUtilities readStringForPreferenceKey:@"durationBoltID" inDomain:self->_defaultsDomain];
  if (!v3)
  {
    double v4 = [(PowerUIMLTwoStageModelPredictor *)self durationModel];
    double v5 = [v4 modelDescription];
    double v6 = [v5 metadata];
    int v7 = [v6 objectForKeyedSubscript:*MEMORY[0x263F00CF0]];
    double v3 = [v7 objectForKeyedSubscript:@"model_version"];
  }
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Duration model bolt ID is %@", (uint8_t *)&v11, 0xCu);
  }
  if (v3) {
    id v9 = v3;
  }
  else {
    id v9 = @"Unknown";
  }

  return v9;
}

- (void)setPluginDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  +[PowerUISmartChargeUtilities batteryLevelAtDate:v5];
  self->_pluginBatteryLevel = v6;
  objc_storeStrong((id *)&self->_pluginDate, a3);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    pluginDate = self->_pluginDate;
    id v9 = log;
    id v10 = [(PowerUIMLTwoStageModelPredictor *)self timeStringFromDate:pluginDate];
    int v11 = [NSNumber numberWithDouble:self->_pluginBatteryLevel];
    int v12 = 138412546;
    uint64_t v13 = v10;
    __int16 v14 = 2112;
    double v15 = v11;
    _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "Plugin date set to %@, plugin battery level to %@", (uint8_t *)&v12, 0x16u);
  }
}

- (double)getHourBinID:(id)a3 forHourBin:(unint64_t)a4
{
  id v5 = (void *)MEMORY[0x263EFF8F0];
  id v6 = a3;
  int v7 = [v5 currentCalendar];
  id v8 = [v7 components:32 fromDate:v6];

  double v9 = (double)[v8 hour] / (double)a4;
  return v9;
}

- (id)predictFullChargeDateWithBatteryLevel:(unint64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (self->_deadline)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      deadline = self->_deadline;
      int v16 = 138412290;
      v17 = deadline;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Returning saved deadline: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    pluginDate = self->_pluginDate;
    double pluginBatteryLevel = self->_pluginBatteryLevel;
    double v9 = [MEMORY[0x263EFF910] date];
    [(PowerUIMLTwoStageModelPredictor *)self adjustedChargingDecision:a3 withPluginDate:pluginDate withPluginBatteryLevel:v9 forDate:0 forStatus:pluginBatteryLevel];
    double v11 = v10;

    int v12 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v11];
    uint64_t v13 = self->_deadline;
    self->_deadline = v12;

    +[PowerUISmartChargeUtilities setDate:self->_deadline forPreferenceKey:@"twoStageModelOutput" inDomain:self->_defaultsDomain];
  }
  __int16 v14 = self->_deadline;
  return v14;
}

- (double)adjustedChargingDecision:(unint64_t)a3 withPluginDate:(id)a4 withPluginBatteryLevel:(double)a5 forDate:(id)a6 forStatus:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v12 = a6;
  uint64_t v13 = 88;
  if (v7) {
    uint64_t v13 = 96;
  }
  __int16 v14 = *(id *)((char *)&self->super.isa + v13);
  [(PowerUIMLTwoStageModelPredictor *)self chargingDecision:a3 withPluginDate:a4 withPluginBatteryLevel:v12 forDate:v14 withLog:a5];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v22 = 0;
    _os_log_impl(&dword_22135E000, v14, OS_LOG_TYPE_DEFAULT, "MLTwoStageModel output %f hours", buf, 0xCu);
  }
  double v15 = 0.0 - self->_adjustedDuration;
  int v16 = v14;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    if (v15 < 0.0)
    {
      v17 = @"Distant Past";
    }
    else
    {
      v17 = [v12 dateByAddingTimeInterval:v15 * 3600.0];
    }
    double adjustedDuration = self->_adjustedDuration;
    *(_DWORD *)buf = 138412802;
    v22 = v17;
    __int16 v23 = 2048;
    double v24 = adjustedDuration;
    __int16 v25 = 2048;
    double v26 = v15;
    _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "SmartCharge: %@ duration post adjustment of %f hours, is %f hours", buf, 0x20u);
    if (v15 >= 0.0) {
  }
    }
  if (!v7)
  {
    self->_lastDurationResult = v15;
    uint64_t v19 = [NSNumber numberWithDouble:v15];
    +[PowerUISmartChargeUtilities setNumber:v19 forPreferenceKey:@"twoStageModelDurationResult" inDomain:self->_defaultsDomain];
  }
  return v15 * 3600.0;
}

- (id)getInputFeaturesWithPluginDate:(id)a3 withPluginBatteryLevel:(double)a4 forDate:(id)a5 withLog:(id)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x263EFF8F0];
  id v13 = a5;
  __int16 v14 = [v12 currentCalendar];
  double v15 = [v14 components:32 fromDate:v13];

  uint64_t v16 = [v15 hour];
  [v10 timeIntervalSinceDate:v13];
  double v18 = v17;

  uint64_t v19 = +[PowerUISmartChargeUtilities pluginEventsBefore:v10 withMinimumDuration:self->_minInputChargeDuration withMinimumPlugoutBatteryLevel:75.0 ignoringDisconnectsShorterThan:300.0];
  v20 = v11;
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    double v21 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "count"));
    int v24 = 138412290;
    __int16 v25 = v21;
    _os_log_impl(&dword_22135E000, v20, OS_LOG_TYPE_DEFAULT, "Found %@ events for featurization", (uint8_t *)&v24, 0xCu);
  }
  if ([v19 count])
  {
    v22 = [(PowerUIMLTwoStageModelPredictor *)self getInputFeatures:v19 events:(unint64_t)a4 pluginBatteryLevel:v10 timeFromPlugin:v20 pluginDate:(double)v16 withLog:-v18];
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (PowerUIModelQueryResult)chargingDecision:(SEL)a3 withPluginDate:(unint64_t)a4 withPluginBatteryLevel:(id)a5 forDate:(double)a6 withLog:(id)a7
{
  uint64_t v59 = *MEMORY[0x263EF8340];
  id v13 = a8;
  id v14 = a7;
  id v15 = a5;
  uint64_t v16 = (void *)os_transaction_create();
  double v17 = [(PowerUIMLTwoStageModelPredictor *)self getInputFeaturesWithPluginDate:v15 withPluginBatteryLevel:v14 forDate:v13 withLog:a6];

  *(void *)&retstr->var0 = 0;
  *(int64x2_t *)&retstr->var1 = vdupq_n_s64(0xC0F869F000000000);
  if (v17 || self->_durationOverride && self->_confidenceOverride)
  {
    double v18 = [(PowerUIMLTwoStageModelPredictor *)self engageModel];
    uint64_t v19 = [v18 predictionFromFeatures:v17 error:0];

    v20 = [v19 featureValueForName:@"classProbability"];
    double v21 = [v20 dictionaryValue];

    v22 = v13;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      double v23 = [v21 description];
      *(_DWORD *)buf = 138412290;
      double v56 = v23;
      _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_DEFAULT, "Engagement model raw output %@", buf, 0xCu);
    }
    int v24 = [v21 objectForKeyedSubscript:&unk_26D3851F8];
    [v24 doubleValue];
    double v26 = v25;

    if (self->_confidenceOverride
      && +[PowerUISmartChargeUtilities isInternalBuild])
    {
      uint64_t v27 = v22;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        [(NSNumber *)self->_confidenceOverride doubleValue];
        *(_DWORD *)buf = 134217984;
        double v56 = v28;
        _os_log_impl(&dword_22135E000, v27, OS_LOG_TYPE_DEFAULT, "Confidence override exists: %f", buf, 0xCu);
      }

      [(NSNumber *)self->_confidenceOverride doubleValue];
      double v26 = v29;
    }
    if (self->_statusLog != v22)
    {
      self->_lastEngagementResult = v26;
      objc_super v30 = [NSNumber numberWithDouble:v26];
      +[PowerUISmartChargeUtilities setNumber:v30 forPreferenceKey:@"twoStageModelEngagementResult" inDomain:self->_defaultsDomain];
    }
    double threshold = self->_threshold;
    BOOL v32 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v26 <= threshold)
    {
      if (v32)
      {
        double v48 = self->_threshold;
        *(_DWORD *)buf = 134218240;
        double v56 = v26;
        __int16 v57 = 2048;
        double v58 = v48;
        _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_DEFAULT, "Engagement model says NO (Prob %lf < Threshold %lf)", buf, 0x16u);
      }
      retstr->var1 = -99999.0;
      retstr->var2 = v26;
    }
    else
    {
      if (v32)
      {
        double v33 = self->_threshold;
        *(_DWORD *)buf = 134218240;
        double v56 = v26;
        __int16 v57 = 2048;
        double v58 = v33;
        _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_DEFAULT, "Engagement model says YES (Prob %lf > Threshold %lf)", buf, 0x16u);
      }
      v51 = v21;
      v52 = v19;
      v53 = v16;
      v54 = v13;
      retstr->var0 = 1;
      retstr->var2 = v26;
      v34 = [(PowerUIMLTwoStageModelPredictor *)self durationModel];
      v35 = [v34 predictionFromFeatures:v17 error:0];

      v50 = v35;
      v36 = [v35 featureValueForName:@"duration_pred"];
      [v36 doubleValue];
      double v38 = v37;

      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v56 = v38;
        _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_DEFAULT, "Regression model output: %lf", buf, 0xCu);
      }
      v39 = [(PowerUIMLTwoStageModelPredictor *)self durationModel];
      __int16 v40 = [v39 modelDescription];
      __int16 v41 = [v40 metadata];
      __int16 v42 = [v41 objectForKeyedSubscript:*MEMORY[0x263F00CF0]];
      __int16 v43 = [v42 objectForKeyedSubscript:@"adjust_duration_by_confidence"];
      int v44 = [v43 BOOLValue];

      uint64_t v19 = v52;
      uint64_t v16 = v53;
      double v21 = v51;
      if (v44)
      {
        double v38 = v26 * v38;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          double v56 = v38;
          _os_log_impl(&dword_22135E000, v22, OS_LOG_TYPE_DEFAULT, "Duration adjusted by confidence: %lf", buf, 0xCu);
        }
      }
      if (self->_durationOverride)
      {
        id v13 = v54;
        if (+[PowerUISmartChargeUtilities isInternalBuild])
        {
          __int16 v45 = v22;
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            [(NSNumber *)self->_durationOverride doubleValue];
            *(_DWORD *)buf = 134217984;
            double v56 = v46;
            _os_log_impl(&dword_22135E000, v45, OS_LOG_TYPE_DEFAULT, "Duration override exists: %f", buf, 0xCu);
          }

          [(NSNumber *)self->_durationOverride doubleValue];
          double v38 = v47;
        }
      }
      else
      {
        id v13 = v54;
      }
      retstr->var1 = v38;
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    -[PowerUIMLTwoStageModelPredictor chargingDecision:withPluginDate:withPluginBatteryLevel:forDate:withLog:](v13);
  }

  return result;
}

- (id)convertInputFeaturesToNeuralFeatures:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Convert model input features for neural model", buf, 2u);
  }
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v7 = [v4 dictionary];
  id v8 = [(PowerUIMLTwoStageModelPredictor *)self getMultiArrayForFeatureDict:v7];

  [v6 setObject:v8 forKeyedSubscript:@"layer1_input"];
  id v13 = 0;
  double v9 = (void *)[objc_alloc(MEMORY[0x263F00D38]) initWithDictionary:v6 error:&v13];
  id v10 = v13;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[PowerUIMLTwoStageModelPredictor convertInputFeaturesToNeuralFeatures:]();
    }
    id v11 = 0;
  }
  else
  {
    id v11 = v9;
  }

  return v11;
}

- (void)resetSavedDeadline
{
  deadline = self->_deadline;
  self->_deadline = 0;

  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)&self->_lastEngagementResult = _Q0;
  +[PowerUISmartChargeUtilities setDate:self->_deadline forPreferenceKey:@"twoStageModelOutput" inDomain:self->_defaultsDomain];
  double v9 = [NSNumber numberWithDouble:self->_lastEngagementResult];
  +[PowerUISmartChargeUtilities setNumber:v9 forPreferenceKey:@"twoStageModelEngagementResult" inDomain:self->_defaultsDomain];

  id v10 = [NSNumber numberWithDouble:self->_lastDurationResult];
  +[PowerUISmartChargeUtilities setNumber:v10 forPreferenceKey:@"twoStageModelDurationResult" inDomain:self->_defaultsDomain];
}

- (void)deleteCompiledModels
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v3 = (void *)os_transaction_create();
  id v4 = [(PowerUITrialManager *)self->_trialManager loadTrialEngageModelByDeletingExistingModel:1];
  if (v4)
  {
    os_unfair_lock_lock(&self->_loadModelLock);
    objc_storeStrong((id *)&self->_engageModel, v4);
    [(PowerUIMLTwoStageModelPredictor *)self loadThresholdForModel:self->_engageModel];
    self->_double threshold = v5;
    os_unfair_lock_unlock(&self->_loadModelLock);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = NSNumber;
      double threshold = self->_threshold;
      double v9 = log;
      id v10 = [v7 numberWithDouble:threshold];
      int v18 = 138412290;
      uint64_t v19 = v10;
      _os_log_impl(&dword_22135E000, v9, OS_LOG_TYPE_DEFAULT, "Trial engage model found! Threshold: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  id v11 = [(PowerUITrialManager *)self->_trialManager loadTrialDurationModelByDeletingExistingModel:1];

  if (v11)
  {
    os_unfair_lock_lock(&self->_loadModelLock);
    objc_storeStrong((id *)&self->_durationModel, v11);
    [(PowerUIMLTwoStageModelPredictor *)self loadAdjustedHoursForModel:self->_durationModel];
    self->_double adjustedDuration = v12;
    os_unfair_lock_unlock(&self->_loadModelLock);
    id v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = NSNumber;
      double adjustedDuration = self->_adjustedDuration;
      uint64_t v16 = v13;
      double v17 = [v14 numberWithDouble:adjustedDuration];
      int v18 = 138412290;
      uint64_t v19 = v17;
      _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "Trial duration model found! double adjustedDuration = %@", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)deleteUpdatedModels
{
  v29[2] = *MEMORY[0x263EF8340];
  double v3 = [MEMORY[0x263F08850] defaultManager];
  id v4 = NSURL;
  v29[0] = @"/var/mobile/Library/PowerUI";
  v29[1] = @"updatedClassifier.modelc";
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v29 count:2];
  id v6 = [v4 fileURLWithPathComponents:v5];

  BOOL v7 = [v6 path];
  id v23 = 0;
  char v8 = [v3 removeItemAtPath:v7 error:&v23];
  id v9 = v23;

  if ((v8 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = log;
      double v12 = [v6 path];
      *(_DWORD *)buf = 138412546;
      double v26 = v12;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_impl(&dword_22135E000, v11, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
    }
  }
  id v13 = NSURL;
  v24[0] = @"/var/mobile/Library/PowerUI";
  v24[1] = @"updatedRegressor.modelc";
  id v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:2];
  id v15 = [v13 fileURLWithPathComponents:v14];

  uint64_t v16 = [v15 path];
  id v22 = v9;
  char v17 = [v3 removeItemAtPath:v16 error:&v22];
  id v18 = v22;

  if ((v17 & 1) == 0)
  {
    uint64_t v19 = self->_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = v19;
      double v21 = [v15 path];
      *(_DWORD *)buf = 138412546;
      double v26 = v21;
      __int16 v27 = 2112;
      id v28 = v18;
      _os_log_impl(&dword_22135E000, v20, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
    }
  }
}

- (void)loadEngagementModelFromURL:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  os_unfair_lock_lock(&self->_loadModelLock);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Reload engagement model: %@", buf, 0xCu);
  }
  id v11 = 0;
  BOOL v7 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v5 error:&v11];
  id v8 = v11;
  engageModel = self->_engageModel;
  self->_engageModel = v7;

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[PowerUIMLTwoStageModelPredictor engageModel]();
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_compiledClassifier, a3);
    [(PowerUIMLTwoStageModelPredictor *)self loadThresholdForModel:self->_engageModel];
    self->_double threshold = v10;
  }
  os_unfair_lock_unlock(&self->_loadModelLock);
}

- (void)loadDurationModelFromURL:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  os_unfair_lock_lock(&self->_loadModelLock);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Reload duration model: %@", buf, 0xCu);
  }
  id v11 = 0;
  BOOL v7 = [MEMORY[0x263F00D80] modelWithContentsOfURL:v5 error:&v11];
  id v8 = v11;
  durationModel = self->_durationModel;
  self->_durationModel = v7;

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[PowerUIMLTwoStageModelPredictor engageModel]();
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_compiledRegressor, a3);
    [(PowerUIMLTwoStageModelPredictor *)self loadAdjustedHoursForModel:self->_durationModel];
    self->_double adjustedDuration = v10;
  }
  os_unfair_lock_unlock(&self->_loadModelLock);
}

- (id)adjustDeadlineForReengagement
{
  if (self->_deadline)
  {
    double v3 = [MEMORY[0x263EFF910] date];
    id v4 = [v3 earlierDate:self->_deadline];
    deadline = self->_deadline;

    if (v4 == deadline)
    {
      id v6 = [(NSDate *)self->_deadline dateByAddingTimeInterval:86400.0];
      BOOL v7 = self->_deadline;
      self->_deadline = v6;

      +[PowerUISmartChargeUtilities setDate:self->_deadline forPreferenceKey:@"twoStageModelOutput" inDomain:self->_defaultsDomain];
    }
    id v8 = self->_deadline;
  }
  else
  {
    id v8 = [MEMORY[0x263EFF910] distantPast];
  }
  return v8;
}

- (NSDate)pluginDate
{
  return self->_pluginDate;
}

- (double)pluginBatteryLevel
{
  return self->_pluginBatteryLevel;
}

- (void)setPluginBatteryLevel:(double)a3
{
  self->_double pluginBatteryLevel = a3;
}

- (double)lastEngagementResult
{
  return self->_lastEngagementResult;
}

- (void)setLastEngagementResult:(double)a3
{
  self->_lastEngagementResult = a3;
}

- (double)lastDurationResult
{
  return self->_lastDurationResult;
}

- (void)setLastDurationResult:(double)a3
{
  self->_lastDurationResult = a3;
}

- (double)adjustedDuration
{
  return self->_adjustedDuration;
}

- (void)setAdjustedDuration:(double)a3
{
  self->_double adjustedDuration = a3;
}

- (double)threshold
{
  return self->_threshold;
}

- (void)setThreshold:(double)a3
{
  self->_double threshold = a3;
}

- (double)minInputChargeDuration
{
  return self->_minInputChargeDuration;
}

- (void)setMinInputChargeDuration:(double)a3
{
  self->_minInputChargeDuration = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_os_log)statusLog
{
  return self->_statusLog;
}

- (void)setStatusLog:(id)a3
{
}

- (NSNumber)confidenceOverride
{
  return self->_confidenceOverride;
}

- (void)setConfidenceOverride:(id)a3
{
}

- (NSNumber)durationOverride
{
  return self->_durationOverride;
}

- (void)setDurationOverride:(id)a3
{
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (PowerUITrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (NSDate)deadline
{
  return self->_deadline;
}

- (void)setDeadline:(id)a3
{
}

- (os_unfair_lock_s)loadModelLock
{
  return self->_loadModelLock;
}

- (void)setLoadModelLock:(os_unfair_lock_s)a3
{
  self->_loadModelLock = a3;
}

- (NSURL)compiledClassifier
{
  return self->_compiledClassifier;
}

- (void)setCompiledClassifier:(id)a3
{
}

- (NSURL)compiledRegressor
{
  return self->_compiledRegressor;
}

- (void)setCompiledRegressor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compiledRegressor, 0);
  objc_storeStrong((id *)&self->_compiledClassifier, 0);
  objc_storeStrong((id *)&self->_deadline, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_durationOverride, 0);
  objc_storeStrong((id *)&self->_confidenceOverride, 0);
  objc_storeStrong((id *)&self->_statusLog, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_pluginDate, 0);
  objc_storeStrong((id *)&self->_durationModel, 0);
  objc_storeStrong((id *)&self->_engageModel, 0);
}

- (void)engageModel
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22135E000, v0, v1, "Error loading model from path: %@", v2, v3, v4, v5, v6);
}

- (void)chargingDecision:(os_log_t)log withPluginDate:withPluginBatteryLevel:forDate:withLog:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_22135E000, log, OS_LOG_TYPE_ERROR, "input features invalid, return default query result", v1, 2u);
}

- (void)convertInputFeaturesToNeuralFeatures:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_22135E000, v0, v1, "Error while creating feature provider: %@", v2, v3, v4, v5, v6);
}

@end