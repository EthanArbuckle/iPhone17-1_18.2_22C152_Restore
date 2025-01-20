@interface OSChargingTwoStagePredictor
- (BOOL)isSufficientDataAvailable;
- (MLModel)durationModel;
- (MLModel)engageModel;
- (NSDate)deadline;
- (NSDate)pluginDate;
- (NSNumber)modelUpdateIterations;
- (NSString)defaultsDomain;
- (NSURL)compiledClassifier;
- (NSURL)compiledRegressor;
- (OSChargingTwoStagePredictor)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5;
- (OSChargingTwoStagePredictorQueryResult)chargingDecision:(SEL)a3 withPluginDate:(unint64_t)a4 withPluginBatteryLevel:(id)a5 forDate:(double)a6 withLog:(id)a7;
- (OSIntelligenceTrialManager)trialManager;
- (OS_os_log)log;
- (OS_os_log)statusLog;
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
- (id)arrayWithShape:(id)a3 values:(id)a4 type:(int64_t)a5;
- (id)compileModel:(id)a3;
- (id)convertInputFeaturesToNeuralFeatures:(id)a3;
- (id)durationModelBoltID;
- (id)engagementModelBoltID;
- (id)getInputFeaturesWithPluginDate:(id)a3 withPluginBatteryLevel:(double)a4 forDate:(id)a5 withLog:(id)a6;
- (id)loadModelWithModelNameString:(id)a3;
- (id)predictFullChargeDateWithBatteryLevel:(unint64_t)a3;
- (id)timeStringFromDate:(id)a3;
- (int64_t)modelExecutionPath;
- (os_unfair_lock_s)loadModelLock;
- (unint64_t)durationModelVersion;
- (unint64_t)engagementModelVersion;
- (unint64_t)modelVersion;
- (void)deleteCompiledModels;
- (void)deleteUpdatedModels;
- (void)loadDurationModelFromURL:(id)a3;
- (void)loadEngagementModelFromURL:(id)a3;
- (void)loadTrial;
- (void)resetSavedDeadline;
- (void)setAdjustedDuration:(double)a3;
- (void)setCompiledClassifier:(id)a3;
- (void)setCompiledRegressor:(id)a3;
- (void)setContext:(id)a3;
- (void)setDeadline:(id)a3;
- (void)setDefaultsDomain:(id)a3;
- (void)setLastDurationResult:(double)a3;
- (void)setLastEngagementResult:(double)a3;
- (void)setLoadModelLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setMinInputChargeDuration:(double)a3;
- (void)setModelExecutionPath:(int64_t)a3;
- (void)setModelUpdateIterations:(id)a3;
- (void)setPluginBatteryLevel:(double)a3;
- (void)setPluginDate:(id)a3;
- (void)setStatusLog:(id)a3;
- (void)setThreshold:(double)a3;
- (void)setTrialManager:(id)a3;
@end

@implementation OSChargingTwoStagePredictor

- (MLModel)engageModel
{
  p_loadModelLock = &self->_loadModelLock;
  os_unfair_lock_lock(&self->_loadModelLock);
  if (self->_engageModel) {
    goto LABEL_38;
  }
  self->_int64_t modelExecutionPath = [(OSIntelligenceTrialManager *)self->_trialManager longFactorForName:@"modelExecutionPath"];
  v4 = +[OSIntelligenceUtilities numberForPreferenceKey:@"modelExecutionPathOverride" inDomain:self->_defaultsDomain];
  v5 = v4;
  if (v4)
  {
    self->_int64_t modelExecutionPath = (int)[v4 intValue];
    v6 = self->_log;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "_modelExecutionPath override loaded", buf, 2u);
    }
  }
  v7 = self->_log;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    int64_t modelExecutionPath = self->_modelExecutionPath;
    *(_DWORD *)buf = 134217984;
    CFStringRef v56 = (const __CFString *)modelExecutionPath;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "_modelExecutionPath: %ld", buf, 0xCu);
  }
  int64_t v9 = self->_modelExecutionPath;
  if (v9 == 2)
  {
    v12 = 0;
    id v14 = 0;
LABEL_15:
    v16 = self->_log;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Loading baseline updatable classifier model.", buf, 2u);
    }
    v17 = [(OSChargingTwoStagePredictor *)self compileModel:@"updatable_model_classifier"];

    objc_storeStrong((id *)&self->_compiledClassifier, v17);
    v18 = self->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      v20 = [v17 description];
      *(_DWORD *)buf = 138412290;
      CFStringRef v56 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Model asset path: %@", buf, 0xCu);
    }
    id v53 = 0;
    v21 = +[MLModel modelWithContentsOfURL:v17 error:&v53];
    id v14 = v53;
    engageModel = self->_engageModel;
    self->_engageModel = v21;

    if (v14 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100043958();
    }
    v12 = v17;
    goto LABEL_26;
  }
  if (v9 != 1)
  {
    v23 = self->_log;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v23, OS_LOG_TYPE_DEFAULT, "Loading non-updatable classifier model.", buf, 2u);
    }
    v24 = [(OSIntelligenceTrialManager *)self->_trialManager loadTrialEngageModelByDeletingExistingModel:0];
    v25 = self->_engageModel;
    self->_engageModel = v24;

    v12 = 0;
    id v14 = 0;
    goto LABEL_26;
  }
  v10 = self->_log;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Loading updated classifier model.", buf, 2u);
  }
  v63[0] = @"/var/mobile/Library/OSIntelligence";
  v63[1] = @"updatedClassifier.modelc";
  v11 = +[NSArray arrayWithObjects:v63 count:2];
  v12 = +[NSURL fileURLWithPathComponents:v11];

  objc_storeStrong((id *)&self->_compiledClassifier, v12);
  id v54 = 0;
  v13 = +[MLModel modelWithContentsOfURL:v12 error:&v54];
  id v14 = v54;
  v15 = self->_engageModel;
  self->_engageModel = v13;

  if (v14)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_1000439C0();
    }
    goto LABEL_15;
  }
LABEL_26:
  v26 = self->_engageModel;
  v27 = self->_log;
  BOOL v28 = os_log_type_enabled((os_log_t)v27, OS_LOG_TYPE_DEFAULT);
  if (v26)
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v27, OS_LOG_TYPE_DEFAULT, "Trial engage model found!", buf, 2u);
    }
  }
  else
  {
    if (v28)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v27, OS_LOG_TYPE_DEFAULT, "Trial engage model not found...falling back to default model", buf, 2u);
    }
    v29 = +[NSBundle bundleForClass:objc_opt_class()];
    v30 = [v29 pathForResource:@"engageModel" ofType:@"mlmodelc"];
    uint64_t v31 = +[NSURL fileURLWithPath:v30];

    id v52 = 0;
    v32 = +[MLModel modelWithContentsOfURL:v31 error:&v52];
    id v14 = v52;
    v33 = self->_engageModel;
    self->_engageModel = v32;

    if (v14 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100043958();
    }
    v12 = (void *)v31;
  }
  [(OSChargingTwoStagePredictor *)self loadThresholdForModel:self->_engageModel];
  self->_threshold = v34;
  v35 = self->_log;
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    v36 = self->_engageModel;
    log = v35;
    v51 = [(MLModel *)v36 modelDescription];
    v49 = [v51 metadata];
    v48 = [v49 objectForKeyedSubscript:MLModelCreatorDefinedKey];
    v37 = [v48 objectForKeyedSubscript:@"model_version"];
    v46 = [(MLModel *)self->_engageModel modelDescription];
    v38 = [v46 metadata];
    v39 = [v38 objectForKeyedSubscript:MLModelCreatorDefinedKey];
    [v39 objectForKeyedSubscript:@"bolt_id"];
    v40 = id v50 = v14;
    +[NSNumber numberWithDouble:self->_threshold];
    v41 = v5;
    v43 = v42 = p_loadModelLock;
    *(_DWORD *)buf = 138413058;
    CFStringRef v56 = @"engageModel";
    __int16 v57 = 2112;
    v58 = v37;
    __int16 v59 = 2112;
    v60 = v40;
    __int16 v61 = 2112;
    v62 = v43;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Engagement model: %@.%@ from bolt job = %@ (threshold = %@)", buf, 0x2Au);

    p_loadModelLock = v42;
    v5 = v41;

    id v14 = v50;
  }

LABEL_38:
  os_unfair_lock_unlock(p_loadModelLock);
  v44 = self->_engageModel;

  return v44;
}

- (MLModel)durationModel
{
  p_loadModelLock = &self->_loadModelLock;
  os_unfair_lock_lock(&self->_loadModelLock);
  if (self->_durationModel) {
    goto LABEL_38;
  }
  self->_int64_t modelExecutionPath = [(OSIntelligenceTrialManager *)self->_trialManager longFactorForName:@"modelExecutionPath"];
  v4 = +[OSIntelligenceUtilities numberForPreferenceKey:@"modelExecutionPathOverride" inDomain:self->_defaultsDomain];
  v5 = v4;
  if (v4)
  {
    self->_int64_t modelExecutionPath = (int)[v4 intValue];
    v6 = self->_log;
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "_modelExecutionPath override loaded", buf, 2u);
    }
  }
  v7 = self->_log;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    int64_t modelExecutionPath = self->_modelExecutionPath;
    *(_DWORD *)buf = 134217984;
    CFStringRef v61 = (const __CFString *)modelExecutionPath;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "_modelExecutionPath: %ld", buf, 0xCu);
  }
  int64_t v9 = self->_modelExecutionPath;
  if (v9 == 2)
  {
    v12 = 0;
    id v14 = 0;
LABEL_15:
    v16 = self->_log;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v16, OS_LOG_TYPE_DEFAULT, "Loading baseline updatable duration model.", buf, 2u);
    }
    v17 = [(OSChargingTwoStagePredictor *)self compileModel:@"updatable_model_regress"];

    objc_storeStrong((id *)&self->_compiledRegressor, v17);
    v18 = self->_log;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v18;
      v20 = [v17 description];
      *(_DWORD *)buf = 138412290;
      CFStringRef v61 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Model asset path: %@", buf, 0xCu);
    }
    id v58 = 0;
    v21 = +[MLModel modelWithContentsOfURL:v17 error:&v58];
    id v22 = v58;
    durationModel = self->_durationModel;
    self->_durationModel = v21;

    v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = self->_durationModel;
      v26 = v24;
      v27 = [(MLModel *)v25 modelDescription];
      *(_DWORD *)buf = 138412290;
      CFStringRef v61 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "duration model description: %@", buf, 0xCu);
    }
    if (v22 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100043958();
    }
    v12 = v17;
    goto LABEL_29;
  }
  if (v9 == 1)
  {
    v10 = self->_log;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Loading updated duration model.", buf, 2u);
    }
    v68[0] = @"/var/mobile/Library/OSIntelligence";
    v68[1] = @"updatedRegressor.modelc";
    v11 = +[NSArray arrayWithObjects:v68 count:2];
    v12 = +[NSURL fileURLWithPathComponents:v11];

    objc_storeStrong((id *)&self->_compiledRegressor, v12);
    id v59 = 0;
    v13 = +[MLModel modelWithContentsOfURL:v12 error:&v59];
    id v14 = v59;
    v15 = self->_durationModel;
    self->_durationModel = v13;

    if (v14)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        sub_1000439C0();
      }
      goto LABEL_15;
    }
  }
  else
  {
    BOOL v28 = self->_log;
    if (os_log_type_enabled((os_log_t)v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v28, OS_LOG_TYPE_DEFAULT, "Loading non-updatable duration model.", buf, 2u);
    }
    v29 = [(OSIntelligenceTrialManager *)self->_trialManager loadTrialDurationModelByDeletingExistingModel:0];
    v30 = self->_durationModel;
    self->_durationModel = v29;

    v12 = 0;
  }
  id v22 = 0;
LABEL_29:
  uint64_t v31 = self->_durationModel;
  v32 = self->_log;
  BOOL v33 = os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_DEFAULT);
  if (v31)
  {
    if (v33)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_DEFAULT, "Trial duration model found!", buf, 2u);
    }
  }
  else
  {
    if (v33)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v32, OS_LOG_TYPE_DEFAULT, "Trial duration model not found...falling back to default model", buf, 2u);
    }
    double v34 = +[NSBundle bundleForClass:objc_opt_class()];
    v35 = [v34 pathForResource:@"durationModel" ofType:@"mlmodelc"];
    uint64_t v36 = +[NSURL fileURLWithPath:v35];

    v37 = +[MLModel modelWithContentsOfURL:v36 error:0];
    v38 = self->_durationModel;
    self->_durationModel = v37;

    v12 = (void *)v36;
  }
  [(OSChargingTwoStagePredictor *)self loadAdjustedHoursForModel:self->_durationModel];
  self->_adjustedDuration = v39;
  v40 = self->_log;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    v41 = self->_durationModel;
    log = v40;
    CFStringRef v56 = [(MLModel *)v41 modelDescription];
    v55 = [v56 metadata];
    [v55 objectForKeyedSubscript:MLModelCreatorDefinedKey];
    id v54 = v57 = v22;
    v42 = [v54 objectForKeyedSubscript:@"model_version"];
    id v52 = [(MLModel *)self->_durationModel modelDescription];
    v43 = [v52 metadata];
    v44 = [v43 objectForKeyedSubscript:MLModelCreatorDefinedKey];
    v45 = [v44 objectForKeyedSubscript:@"bolt_id"];
    +[NSNumber numberWithDouble:self->_adjustedDuration];
    v46 = v12;
    v47 = v5;
    v49 = v48 = p_loadModelLock;
    *(_DWORD *)buf = 138413058;
    CFStringRef v61 = @"durationModel";
    __int16 v62 = 2112;
    v63 = v42;
    __int16 v64 = 2112;
    v65 = v45;
    __int16 v66 = 2112;
    v67 = v49;
    _os_log_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEFAULT, "Duration model: %@.%@ from bolt job = %@ (adjusted duration = %@)", buf, 0x2Au);

    p_loadModelLock = v48;
    v5 = v47;
    v12 = v46;

    id v22 = v57;
  }

LABEL_38:
  os_unfair_lock_unlock(p_loadModelLock);
  id v50 = self->_durationModel;

  return v50;
}

- (id)timeStringFromDate:(id)a3
{
  uint64_t v3 = qword_10007A8A8;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&qword_10007A8A8, &stru_1000651C0);
  }
  v5 = [(id)qword_10007A8B0 stringFromDate:v4];

  return v5;
}

- (OSChargingTwoStagePredictor)initWithDefaultsDomain:(id)a3 withContextStore:(id)a4 withTrialManager:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)OSChargingTwoStagePredictor;
  v12 = [(OSChargingTwoStagePredictor *)&v26 init];
  v13 = v12;
  if (v12)
  {
    v12->_loadModelLock._os_unfair_lock_opaque = 0;
    os_log_t v14 = os_log_create("com.apple.osintelligence.chargeprediction", "mltwostagemodelpredictor");
    log = v13->_log;
    v13->_log = (OS_os_log *)v14;

    os_log_t v16 = os_log_create("com.apple.osintelligence.chargeprediction", "mltwostagemodelpredictorStatusLog");
    statusLog = v13->_statusLog;
    v13->_statusLog = (OS_os_log *)v16;

    objc_storeStrong((id *)&v13->_defaultsDomain, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    uint64_t v18 = +[OSIntelligenceUtilities dateForPreferenceKey:@"twoStageModelOutput" inDomain:v13->_defaultsDomain];
    deadline = v13->_deadline;
    v13->_deadline = (NSDate *)v18;

    v20 = +[OSIntelligenceUtilities numberForPreferenceKey:@"twoStageModelEngagementResult" inDomain:v13->_defaultsDomain];
    [v20 doubleValue];
    v13->_lastEngagementResult = v21;

    id v22 = +[OSIntelligenceUtilities numberForPreferenceKey:@"twoStageModelDurationResult" inDomain:v13->_defaultsDomain];
    [v22 doubleValue];
    v13->_lastDurationResult = v23;

    objc_storeStrong((id *)&v13->_trialManager, a5);
    [(OSChargingTwoStagePredictor *)v13 loadMinInputChargeDuration];
    v13->_minInputChargeDuration = v24;
    v13->_threshold = 1.0;
  }

  return v13;
}

- (void)loadTrial
{
  uint64_t v3 = [(OSIntelligenceTrialManager *)self->_trialManager loadTrialEngageModelByDeletingExistingModel:1];
  engageModel = self->_engageModel;
  self->_engageModel = v3;

  v5 = [(OSIntelligenceTrialManager *)self->_trialManager loadTrialDurationModelByDeletingExistingModel:1];
  durationModel = self->_durationModel;
  self->_durationModel = v5;

  [(OSChargingTwoStagePredictor *)self loadThresholdForModel:self->_engageModel];
  self->_threshold = v7;
  [(OSChargingTwoStagePredictor *)self loadAdjustedHoursForModel:self->_durationModel];
  self->_adjustedDuration = v8;
  [(OSChargingTwoStagePredictor *)self loadMinInputChargeDuration];
  self->_minInputChargeDuration = v9;

  [(OSChargingTwoStagePredictor *)self resetSavedDeadline];
}

- (double)loadThresholdForModel:(id)a3
{
  id v4 = a3;
  [(OSIntelligenceTrialManager *)self->_trialManager loadTrialThreshold];
  double v6 = v5;
  if (v5 <= 0.0)
  {
    double v7 = [v4 modelDescription];
    double v8 = [v7 metadata];
    double v9 = [v8 objectForKeyedSubscript:MLModelCreatorDefinedKey];
    id v10 = [v9 objectForKeyedSubscript:@"threshold"];
    [v10 doubleValue];
    double v6 = v11;

    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      double v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Failed to load trial threshold. Falling back to default %lf", (uint8_t *)&v14, 0xCu);
    }
  }

  return v6;
}

- (double)loadAdjustedHoursForModel:(id)a3
{
  id v4 = a3;
  [(OSIntelligenceTrialManager *)self->_trialManager loadTrialAdjustedHours];
  double v6 = v5;
  if (v5 <= 0.0)
  {
    double v7 = [v4 modelDescription];
    double v8 = [v7 metadata];
    double v9 = [v8 objectForKeyedSubscript:MLModelCreatorDefinedKey];
    id v10 = [v9 objectForKeyedSubscript:@"leeway"];
    [v10 doubleValue];
    double v6 = v11;

    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134217984;
      double v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Failed to load trial adjusted hours. Falling back to default %lf", (uint8_t *)&v14, 0xCu);
    }
  }

  return v6;
}

- (double)loadMinInputChargeDuration
{
  [(OSIntelligenceTrialManager *)self->_trialManager loadTrialMinInputChargeDuration];
  double v4 = v3;
  if (v3 <= 0.0)
  {
    log = self->_log;
    double v4 = 600.0;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134217984;
      uint64_t v8 = 0x4082C00000000000;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Failed to load trial minimum duration for model input. Falling back to default %lf", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4;
}

- (id)arrayWithShape:(id)a3 values:(id)a4 type:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v9)
  {
    if (!v8)
    {
      double v11 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 count]);
      uint64_t v18 = v11;
      id v8 = +[NSArray arrayWithObjects:&v18 count:1];
    }
    id v12 = [objc_alloc((Class)MLMultiArray) initWithShape:v8 dataType:a5 error:0];
    if (v12 && [v10 count])
    {
      unint64_t v13 = 0;
      do
      {
        int v14 = [v10 objectAtIndexedSubscript:v13];
        [v12 setObject:v14 atIndexedSubscript:v13];

        ++v13;
      }
      while (v13 < (unint64_t)[v10 count]);
    }
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Values not present", v17, 2u);
    }
    id v12 = 0;
  }

  return v12;
}

- (unint64_t)engagementModelVersion
{
  return 3;
}

- (id)engagementModelBoltID
{
  double v3 = [(OSChargingTwoStagePredictor *)self engageModel];
  double v4 = [v3 modelDescription];
  double v5 = [v4 metadata];
  double v6 = [v5 objectForKeyedSubscript:MLModelCreatorDefinedKey];
  int v7 = [v6 objectForKeyedSubscript:@"model_version"];

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Engagement model bolt ID is %@", (uint8_t *)&v11, 0xCu);
  }
  if (v7) {
    id v9 = v7;
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
  double v3 = [(OSChargingTwoStagePredictor *)self durationModel];
  double v4 = [v3 modelDescription];
  double v5 = [v4 metadata];
  double v6 = [v5 objectForKeyedSubscript:MLModelCreatorDefinedKey];
  int v7 = [v6 objectForKeyedSubscript:@"model_version"];

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Duration model bolt ID is %@", (uint8_t *)&v11, 0xCu);
  }
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = @"Unknown";
  }

  return v9;
}

- (unint64_t)modelVersion
{
  return [(OSChargingTwoStagePredictor *)self durationModelVersion];
}

- (void)setPluginDate:(id)a3
{
  id v5 = a3;
  +[OSIntelligenceUtilities batteryLevelAtDate:v5];
  self->_pluginBatteryLevel = v6;
  objc_storeStrong((id *)&self->_pluginDate, a3);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    pluginDate = self->_pluginDate;
    id v9 = log;
    id v10 = [(OSChargingTwoStagePredictor *)self timeStringFromDate:pluginDate];
    int v11 = +[NSNumber numberWithDouble:self->_pluginBatteryLevel];
    int v12 = 138412546;
    unint64_t v13 = v10;
    __int16 v14 = 2112;
    double v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Plugin date set to %@, plugin battery level to %@", (uint8_t *)&v12, 0x16u);
  }
}

- (double)getHourBinID:(id)a3 forHourBin:(unint64_t)a4
{
  id v5 = a3;
  double v6 = +[NSCalendar currentCalendar];
  int v7 = [v6 components:32 fromDate:v5];

  double v8 = (double)(uint64_t)[v7 hour] / (double)a4;
  return v8;
}

- (BOOL)isSufficientDataAvailable
{
  double v3 = +[NSDate now];
  double v4 = +[OSIntelligenceUtilities pluginEventsBefore:v3 withMinimumDuration:self->_minInputChargeDuration withMinimumPlugoutBatteryLevel:80.0];
  if ((unint64_t)[v4 count] > 8)
  {
    double v8 = [v4 firstObject];
    id v9 = [v8 startDate];
    [v3 timeIntervalSinceDate:v9];
    double v11 = v10;

    if (v11 <= 1209600.0)
    {
      log = self->_log;
      BOOL v6 = 0;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v13 = log;
        __int16 v14 = [v4 firstObject];
        double v15 = [v14 startDate];
        [v3 timeIntervalSinceDate:v15];
        int v18 = 134217984;
        double v19 = v16 / 86400.0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Not enough days of history: %f", (uint8_t *)&v18, 0xCu);

        goto LABEL_8;
      }
    }
    else
    {
      BOOL v6 = 1;
    }
  }
  else
  {
    id v5 = self->_log;
    BOOL v6 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = v5;
      int v18 = 134218240;
      double v19 = COERCE_DOUBLE([v4 count]);
      __int16 v20 = 2048;
      uint64_t v21 = 9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not enough charging events: %lu < %lu", (uint8_t *)&v18, 0x16u);

LABEL_8:
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (id)predictFullChargeDateWithBatteryLevel:(unint64_t)a3
{
  if (self->_deadline)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      deadline = self->_deadline;
      int v16 = 138412290;
      v17 = deadline;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Returning saved deadline: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  else
  {
    pluginDate = self->_pluginDate;
    double pluginBatteryLevel = self->_pluginBatteryLevel;
    id v9 = +[NSDate date];
    [(OSChargingTwoStagePredictor *)self adjustedChargingDecision:a3 withPluginDate:pluginDate withPluginBatteryLevel:v9 forDate:0 forStatus:pluginBatteryLevel];
    double v11 = v10;

    int v12 = +[NSDate dateWithTimeIntervalSinceNow:v11];
    unint64_t v13 = self->_deadline;
    self->_deadline = v12;

    +[OSIntelligenceUtilities setDate:self->_deadline forPreferenceKey:@"twoStageModelOutput" inDomain:self->_defaultsDomain];
  }
  __int16 v14 = self->_deadline;

  return v14;
}

- (double)adjustedChargingDecision:(unint64_t)a3 withPluginDate:(id)a4 withPluginBatteryLevel:(double)a5 forDate:(id)a6 forStatus:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a6;
  uint64_t v13 = 88;
  if (v7) {
    uint64_t v13 = 96;
  }
  __int16 v14 = *(id *)((char *)&self->super.isa + v13);
  [(OSChargingTwoStagePredictor *)self chargingDecision:a3 withPluginDate:a4 withPluginBatteryLevel:v12 forDate:v14 withLog:a5];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MLTwoStageModel output %f hours", buf, 0xCu);
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
    id v22 = v17;
    __int16 v23 = 2048;
    double v24 = adjustedDuration;
    __int16 v25 = 2048;
    double v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SmartCharge: %@ duration post adjustment of %f hours, is %f hours", buf, 0x20u);
    if (v15 >= 0.0) {
  }
    }
  if (!v7)
  {
    self->_lastDurationResult = v15;
    double v19 = +[NSNumber numberWithDouble:v15];
    +[OSIntelligenceUtilities setNumber:v19 forPreferenceKey:@"twoStageModelDurationResult" inDomain:self->_defaultsDomain];
  }
  return v15 * 3600.0;
}

- (id)getInputFeaturesWithPluginDate:(id)a3 withPluginBatteryLevel:(double)a4 forDate:(id)a5 withLog:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  uint64_t v13 = +[NSCalendar currentCalendar];
  __int16 v14 = [v13 components:32 fromDate:v12];

  id v15 = [v14 hour];
  [v10 timeIntervalSinceDate:v12];
  double v17 = v16;

  int v18 = +[OSIntelligenceUtilities pluginEventsBefore:v10 withMinimumDuration:self->_minInputChargeDuration withMinimumPlugoutBatteryLevel:80.0];
  double v19 = v11;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v18 count]);
    int v23 = 138412290;
    double v24 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Found %@ events for featurization", (uint8_t *)&v23, 0xCu);
  }
  uint64_t v21 = [(OSChargingTwoStagePredictor *)self getInputFeatures:v18 events:(unint64_t)a4 pluginBatteryLevel:v10 timeFromPlugin:v19 pluginDate:(double)(uint64_t)v15 withLog:-v17];

  return v21;
}

- (OSChargingTwoStagePredictorQueryResult)chargingDecision:(SEL)a3 withPluginDate:(unint64_t)a4 withPluginBatteryLevel:(id)a5 forDate:(double)a6 withLog:(id)a7
{
  id v13 = a5;
  id v14 = a7;
  id v15 = a8;
  double v16 = (void *)os_transaction_create();
  double v17 = [(OSChargingTwoStagePredictor *)self getInputFeaturesWithPluginDate:v13 withPluginBatteryLevel:v14 forDate:v15 withLog:a6];
  *(void *)&retstr->var0 = 0;
  *(int64x2_t *)&retstr->var1 = vdupq_n_s64(0xC0F869F000000000);
  int v18 = [(OSChargingTwoStagePredictor *)self engageModel];
  double v19 = [v18 modelDescription];
  unsigned int v20 = [v19 isUpdatable];

  v94 = v17;
  if (v20)
  {
    uint64_t v21 = [(OSChargingTwoStagePredictor *)self convertInputFeaturesToNeuralFeatures:v17];
    if (!v21) {
      goto LABEL_46;
    }
    uint64_t v22 = v21;
    v84 = self;
    v86 = v16;
    id v90 = v14;
    id v92 = v13;
    int v23 = [(OSChargingTwoStagePredictor *)self engageModel];
    v83 = (void *)v22;
    double v24 = [v23 predictionFromFeatures:v22 error:0];

    v88 = v15;
    __int16 v25 = v15;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      double v26 = [v24 featureNames];
      *(_DWORD *)buf = 138412290;
      double v105 = v26;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "outfeature names: %@", buf, 0xCu);
    }
    long long v101 = 0u;
    long long v102 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    v27 = v24;
    BOOL v28 = [v24 featureNames];
    id v29 = [v28 countByEnumeratingWithState:&v99 objects:v108 count:16];
    if (v29)
    {
      id v30 = v29;
      uint64_t v31 = *(void *)v100;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v100 != v31) {
            objc_enumerationMutation(v28);
          }
          double v33 = *(double *)(*((void *)&v99 + 1) + 8 * i);
          double v34 = v25;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            double v35 = [v27 featureValueForName:*(void *)&v33];
            *(_DWORD *)buf = 138412546;
            double v105 = v33;
            __int16 v106 = 2112;
            double v107 = v35;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "  outfeatures: %@ - %@", buf, 0x16u);
          }
        }
        id v30 = [v28 countByEnumeratingWithState:&v99 objects:v108 count:16];
      }
      while (v30);
    }

    uint64_t v36 = v27;
    v37 = [v27 featureValueForName:@"Identity"];
    v38 = [v37 dictionaryValue];

    double v39 = v25;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      double v40 = [v38 description];
      *(_DWORD *)buf = 138412290;
      double v105 = v40;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Neural engagement model raw output %@", buf, 0xCu);

      uint64_t v36 = v27;
    }

    v41 = [v38 objectForKeyedSubscript:@"1"];
    [v41 doubleValue];
    double v43 = v42;

    id v13 = v92;
    id v15 = v88;
    id v14 = v90;
    self = v84;
    double v16 = v86;
    v44 = v83;
  }
  else
  {
    v45 = [(OSChargingTwoStagePredictor *)self engageModel];
    v44 = [v45 predictionFromFeatures:v17 error:0];

    v46 = [v44 featureValueForName:@"classProbability"];
    uint64_t v36 = [v46 dictionaryValue];

    v47 = v15;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      [v36 description];
      v48 = v36;
      double v49 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412290;
      double v105 = v49;
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Engagement model raw output %@", buf, 0xCu);

      uint64_t v36 = v48;
    }

    v38 = [v36 objectForKeyedSubscript:&off_100068E88];
    [v38 doubleValue];
    double v43 = v50;
  }

  if (self->_statusLog != v15)
  {
    self->_lastEngagementResult = v43;
    v51 = +[NSNumber numberWithDouble:v43];
    +[OSIntelligenceUtilities setNumber:v51 forPreferenceKey:@"twoStageModelEngagementResult" inDomain:self->_defaultsDomain];
  }
  retstr->var2 = v43;
  double threshold = self->_threshold;
  BOOL v53 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  double v17 = v94;
  if (v43 <= threshold)
  {
    if (v53)
    {
      double v56 = self->_threshold;
      *(_DWORD *)buf = 134218240;
      double v105 = v43;
      __int16 v106 = 2048;
      double v107 = v56;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Engagement model says NO (Prob %lf < Threshold %lf)", buf, 0x16u);
    }
    BOOL v55 = 0;
  }
  else
  {
    if (v53)
    {
      double v54 = self->_threshold;
      *(_DWORD *)buf = 134218240;
      double v105 = v43;
      __int16 v106 = 2048;
      double v107 = v54;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Engagement model says YES (Prob %lf > Threshold %lf)", buf, 0x16u);
    }
    BOOL v55 = 1;
  }
  retstr->var0 = v55;
  id v57 = [(OSChargingTwoStagePredictor *)self durationModel];
  id v58 = [v57 modelDescription];
  unsigned int v59 = [v58 isUpdatable];

  if (v59)
  {
    uint64_t v60 = [(OSChargingTwoStagePredictor *)self convertInputFeaturesToNeuralFeatures:v94];
    if (v60)
    {
      uint64_t v61 = v60;
      v87 = v16;
      id v91 = v14;
      id v93 = v13;
      __int16 v62 = [(OSChargingTwoStagePredictor *)self durationModel];
      v63 = [v62 predictionFromFeatures:v61 error:0];

      v89 = v15;
      __int16 v64 = v15;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        double v65 = [v63 featureNames];
        *(_DWORD *)buf = 138412290;
        double v105 = v65;
        _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "outfeature names: %@", buf, 0xCu);
      }
      v85 = (void *)v61;

      long long v97 = 0u;
      long long v98 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      __int16 v66 = [v63 featureNames];
      id v67 = [v66 countByEnumeratingWithState:&v95 objects:v103 count:16];
      if (v67)
      {
        id v68 = v67;
        uint64_t v69 = *(void *)v96;
        do
        {
          for (j = 0; j != v68; j = (char *)j + 1)
          {
            if (*(void *)v96 != v69) {
              objc_enumerationMutation(v66);
            }
            double v71 = *(double *)(*((void *)&v95 + 1) + 8 * (void)j);
            v72 = v64;
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              double v73 = [v63 featureValueForName:*(void *)&v71];
              *(_DWORD *)buf = 138412546;
              double v105 = v71;
              __int16 v106 = 2112;
              double v107 = v73;
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "  outfeatures: %@ - %@", buf, 0x16u);
            }
          }
          id v68 = [v66 countByEnumeratingWithState:&v95 objects:v103 count:16];
        }
        while (v68);
      }

      v74 = [v63 featureValueForName:@"Identity"];
      v75 = [v74 multiArrayValue];

      v76 = [v75 objectAtIndexedSubscript:0];
      [v76 doubleValue];
      double v78 = v77;

      id v13 = v93;
      id v15 = v89;
      id v14 = v91;
      v79 = v85;
      double v16 = v87;
      double v17 = v94;
      goto LABEL_44;
    }
LABEL_46:
    double v78 = -99999.0;
    goto LABEL_47;
  }
  v80 = [(OSChargingTwoStagePredictor *)self durationModel];
  v79 = [v80 predictionFromFeatures:v94 error:0];

  v63 = [v79 featureValueForName:@"duration_pred"];
  [v63 doubleValue];
  double v78 = v81;
LABEL_44:

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v105 = v78;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Regression model output: %lf", buf, 0xCu);
  }
LABEL_47:
  retstr->var1 = v78;

  return result;
}

- (id)convertInputFeaturesToNeuralFeatures:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Convert model input features for neural model", buf, 2u);
  }
  BOOL v6 = +[NSMutableDictionary dictionary];
  BOOL v7 = [v4 dictionary];
  double v8 = [(OSChargingTwoStagePredictor *)self getMultiArrayForFeatureDict:v7];

  [v6 setObject:v8 forKeyedSubscript:@"layer1_input"];
  id v13 = 0;
  id v9 = [objc_alloc((Class)MLDictionaryFeatureProvider) initWithDictionary:v6 error:&v13];
  id v10 = v13;
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100043A28();
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
  +[OSIntelligenceUtilities setDate:self->_deadline forPreferenceKey:@"twoStageModelOutput" inDomain:self->_defaultsDomain];
  id v9 = +[NSNumber numberWithDouble:self->_lastEngagementResult];
  +[OSIntelligenceUtilities setNumber:v9 forPreferenceKey:@"twoStageModelEngagementResult" inDomain:self->_defaultsDomain];

  id v10 = +[NSNumber numberWithDouble:self->_lastDurationResult];
  +[OSIntelligenceUtilities setNumber:v10 forPreferenceKey:@"twoStageModelDurationResult" inDomain:self->_defaultsDomain];
}

- (void)deleteCompiledModels
{
  double v3 = (void *)os_transaction_create();
  id v4 = [(OSIntelligenceTrialManager *)self->_trialManager loadTrialEngageModelByDeletingExistingModel:1];
  if (v4)
  {
    os_unfair_lock_lock(&self->_loadModelLock);
    objc_storeStrong((id *)&self->_engageModel, v4);
    [(OSChargingTwoStagePredictor *)self loadThresholdForModel:self->_engageModel];
    self->_double threshold = v5;
    os_unfair_lock_unlock(&self->_loadModelLock);
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      double threshold = self->_threshold;
      double v8 = log;
      id v9 = +[NSNumber numberWithDouble:threshold];
      int v16 = 138412290;
      double v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Trial engage model found! Threshold: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  id v10 = [(OSIntelligenceTrialManager *)self->_trialManager loadTrialDurationModelByDeletingExistingModel:1];

  if (v10)
  {
    os_unfair_lock_lock(&self->_loadModelLock);
    objc_storeStrong((id *)&self->_durationModel, v10);
    [(OSChargingTwoStagePredictor *)self loadAdjustedHoursForModel:self->_durationModel];
    self->_double adjustedDuration = v11;
    os_unfair_lock_unlock(&self->_loadModelLock);
    id v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      double adjustedDuration = self->_adjustedDuration;
      id v14 = v12;
      id v15 = +[NSNumber numberWithDouble:adjustedDuration];
      int v16 = 138412290;
      double v17 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Trial duration model found! double adjustedDuration = %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)deleteUpdatedModels
{
  double v3 = +[NSFileManager defaultManager];
  v27[0] = @"/var/mobile/Library/OSIntelligence";
  v27[1] = @"updatedClassifier.modelc";
  id v4 = +[NSArray arrayWithObjects:v27 count:2];
  double v5 = +[NSURL fileURLWithPathComponents:v4];

  BOOL v6 = [v5 path];
  id v21 = 0;
  unsigned __int8 v7 = [v3 removeItemAtPath:v6 error:&v21];
  id v8 = v21;

  if ((v7 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = log;
      double v11 = [v5 path];
      *(_DWORD *)buf = 138412546;
      double v24 = v11;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
    }
  }
  v22[0] = @"/var/mobile/Library/OSIntelligence";
  v22[1] = @"updatedRegressor.modelc";
  id v12 = +[NSArray arrayWithObjects:v22 count:2];
  id v13 = +[NSURL fileURLWithPathComponents:v12];

  id v14 = [v13 path];
  id v20 = v8;
  unsigned __int8 v15 = [v3 removeItemAtPath:v14 error:&v20];
  id v16 = v20;

  if ((v15 & 1) == 0)
  {
    double v17 = self->_log;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = v17;
      double v19 = [v13 path];
      *(_DWORD *)buf = 138412546;
      double v24 = v19;
      __int16 v25 = 2112;
      id v26 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Failed to clean up path: %@ -- %@", buf, 0x16u);
    }
  }
}

- (id)compileModel:(id)a3
{
  id v4 = a3;
  double v5 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v6 = [v5 URLForResource:v4 withExtension:@"ml"];

  id v21 = 0;
  [v6 checkResourceIsReachableAndReturnError:&v21];
  id v7 = v21;
  log = self->_log;
  if (v7)
  {
    id v9 = v7;
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100043BC8();
    }

LABEL_5:
    id v10 = 0;
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEFAULT))
  {
    double v11 = log;
    id v12 = [v6 description];
    *(_DWORD *)buf = 138412290;
    int v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "model url access success: %@", buf, 0xCu);
  }
  if (!v6)
  {
    id v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100043A90(v16);
    }
    goto LABEL_5;
  }
  id v20 = 0;
  id v13 = +[MLModel compileModelAtURL:v6 error:&v20];
  id v14 = v20;
  unsigned __int8 v15 = self->_log;
  if (v14)
  {
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      sub_100043B60();
    }
    id v10 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
    {
      double v17 = v15;
      int v18 = [v13 description];
      *(_DWORD *)buf = 138412290;
      int v23 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "compiled model URL: %@", buf, 0xCu);
    }
    id v10 = v13;
  }

LABEL_19:

  return v10;
}

- (void)loadEngagementModelFromURL:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_loadModelLock);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Reload engagement model: %@", buf, 0xCu);
  }
  id v11 = 0;
  id v7 = +[MLModel modelWithContentsOfURL:v5 error:&v11];
  id v8 = v11;
  engageModel = self->_engageModel;
  self->_engageModel = v7;

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100043958();
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_compiledClassifier, a3);
    [(OSChargingTwoStagePredictor *)self loadThresholdForModel:self->_engageModel];
    self->_double threshold = v10;
  }
  os_unfair_lock_unlock(&self->_loadModelLock);
}

- (void)loadDurationModelFromURL:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_loadModelLock);
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Reload duration model: %@", buf, 0xCu);
  }
  id v11 = 0;
  id v7 = +[MLModel modelWithContentsOfURL:v5 error:&v11];
  id v8 = v11;
  durationModel = self->_durationModel;
  self->_durationModel = v7;

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      sub_100043958();
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_compiledRegressor, a3);
    [(OSChargingTwoStagePredictor *)self loadAdjustedHoursForModel:self->_durationModel];
    self->_double adjustedDuration = v10;
  }
  os_unfair_lock_unlock(&self->_loadModelLock);
}

- (id)loadModelWithModelNameString:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_loadModelLock);
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  BOOL v6 = [v5 pathForResource:v4 ofType:@"mlmodelc"];
  id v7 = +[NSURL fileURLWithPath:v6];

  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v14 = v4;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Loading model %@ from disk at path %@", buf, 0x16u);
  }
  id v12 = 0;
  id v9 = +[MLModel modelWithContentsOfURL:v7 error:&v12];
  id v10 = v12;
  if (v10 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
    sub_100043958();
  }
  os_unfair_lock_unlock(&self->_loadModelLock);

  return v9;
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

- (OSIntelligenceTrialManager)trialManager
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

- (int64_t)modelExecutionPath
{
  return self->_modelExecutionPath;
}

- (void)setModelExecutionPath:(int64_t)a3
{
  self->_int64_t modelExecutionPath = a3;
}

- (NSNumber)modelUpdateIterations
{
  return self->_modelUpdateIterations;
}

- (void)setModelUpdateIterations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelUpdateIterations, 0);
  objc_storeStrong((id *)&self->_compiledRegressor, 0);
  objc_storeStrong((id *)&self->_compiledClassifier, 0);
  objc_storeStrong((id *)&self->_deadline, 0);
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_statusLog, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_pluginDate, 0);
  objc_storeStrong((id *)&self->_durationModel, 0);

  objc_storeStrong((id *)&self->_engageModel, 0);
}

@end