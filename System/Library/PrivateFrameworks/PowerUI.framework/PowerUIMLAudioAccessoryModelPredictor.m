@interface PowerUIMLAudioAccessoryModelPredictor
- (BOOL)deviceHasAtLeastOneLongConnection:(id)a3 forReferenceDate:(id)a4;
- (BOOL)isSufficientDataAvailableForEngagementForDevice:(id)a3;
- (MLModel)highUsageEngageModel;
- (MLModel)highUsageRegressionModel;
- (MLModel)lowUsageEngageModel;
- (MLModel)lowUsageRegressionModel;
- (OS_os_log)log;
- (OS_os_log)statusLog;
- (PowerUIMLAudioAccessoryModelPredictor)init;
- (double)historicalMeaningfulUnderchargeRate:(id)a3;
- (double)lastUsedLeeway;
- (id)chargingDecisionForDate:(id)a3 forAudioAccessory:(id)a4;
- (id)getBTConnectionEventsForPredictionUpTo:(id)a3 forDevice:(id)a4;
- (id)getBTConnectionEventsUpTo:(id)a3 withMinimumDuration:(double)a4 withLimit:(unsigned int)a5 forDevice:(id)a6;
- (id)getInputFeaturesForDate:(id)a3 withEventsInDescendingOrder:(id)a4 withLog:(id)a5;
- (int)minimumDaysOfHistory;
- (int)minimumNumberOfPreviousConnections;
- (os_unfair_lock_s)lock;
- (void)setLock:(os_unfair_lock_s)a3;
- (void)setLog:(id)a3;
- (void)setMinimumDaysOfHistory:(int)a3;
- (void)setMinimumNumberOfPreviousConnections:(int)a3;
- (void)setStatusLog:(id)a3;
@end

@implementation PowerUIMLAudioAccessoryModelPredictor

- (PowerUIMLAudioAccessoryModelPredictor)init
{
  v17.receiver = self;
  v17.super_class = (Class)PowerUIMLAudioAccessoryModelPredictor;
  v2 = [(PowerUIMLAudioAccessoryModelPredictor *)&v17 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    os_log_t v4 = os_log_create("com.apple.powerui.smartcharging.AudioAccessory", "mlaudioaccessorymodelpredictor");
    log = v3->_log;
    v3->_log = (OS_os_log *)v4;

    v6 = v3->_log;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 0;
      _os_log_impl(&dword_22135E000, v6, OS_LOG_TYPE_DEFAULT, "Initializing PowerUIMLAudioAccessoryModelPredictor...", (uint8_t *)v16, 2u);
    }
    os_log_t v7 = os_log_create("com.apple.powerui.smartcharging", "mlaudioaccessorymodelpredictorStatusLog");
    statusLog = v3->_statusLog;
    v3->_statusLog = (OS_os_log *)v7;

    v9 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"MinimumNumberOfDaysOfHistory" inDomain:@"com.apple.smartcharging.topoffprotection.audioaccessories"];
    v10 = v9;
    if (v9) {
      int v11 = [v9 intValue];
    }
    else {
      int v11 = 14;
    }
    v3->_minimumDaysOfHistory = v11;
    v12 = +[PowerUISmartChargeUtilities numberForPreferenceKey:@"MinimumNumberOfPreviousConnections" inDomain:@"com.apple.smartcharging.topoffprotection.audioaccessories"];
    v13 = v12;
    if (v12) {
      int v14 = [v12 intValue];
    }
    else {
      int v14 = 10;
    }
    v3->_minimumNumberOfPreviousConnections = v14;
    v3->_lastUsedLeeway = -1.0;
  }
  return v3;
}

- (MLModel)highUsageEngageModel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_highUsageEngageModel)
  {
    os_log_t v4 = (void *)os_transaction_create();
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 pathForResource:@"base_engage" ofType:@"mlmodelc"];

    os_log_t v7 = (void *)MEMORY[0x263F00D80];
    v8 = [NSURL fileURLWithPath:v6];
    v9 = [v7 modelWithContentsOfURL:v8 error:0];
    highUsageEngageModel = self->_highUsageEngageModel;
    self->_highUsageEngageModel = v9;

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v14 = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Created highUsageEngageModel object lazily.", v14, 2u);
    }
  }
  os_unfair_lock_unlock(p_lock);
  v12 = self->_highUsageEngageModel;
  return v12;
}

- (MLModel)highUsageRegressionModel
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_highUsageRegressionModel)
  {
    os_log_t v4 = (void *)os_transaction_create();
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 pathForResource:@"base_duration" ofType:@"mlmodelc"];

    os_log_t v7 = (void *)MEMORY[0x263F00D80];
    v8 = [NSURL fileURLWithPath:v6];
    v9 = [v7 modelWithContentsOfURL:v8 error:0];
    highUsageRegressionModel = self->_highUsageRegressionModel;
    self->_highUsageRegressionModel = v9;

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v14 = 0;
      _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Created highUsageRegressionModel object lazily.", v14, 2u);
    }
  }
  os_unfair_lock_unlock(p_lock);
  v12 = self->_highUsageRegressionModel;
  return v12;
}

- (MLModel)lowUsageEngageModel
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lowUsageEngageModel)
  {
    os_log_t v4 = (void *)os_transaction_create();
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 pathForResource:@"easy_engage" ofType:@"mlmodelc"];

    os_log_t v7 = (void *)MEMORY[0x263F00D80];
    v8 = [NSURL fileURLWithPath:v6];
    id v16 = 0;
    v9 = [v7 modelWithContentsOfURL:v8 error:&v16];
    id v10 = v16;
    lowUsageEngageModel = self->_lowUsageEngageModel;
    self->_lowUsageEngageModel = v9;

    if (v10)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Error loading low usage engagement model: %@", buf, 0xCu);
      }
    }
    v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v13, OS_LOG_TYPE_DEFAULT, "Created lowUsageEngageModel object lazily.", buf, 2u);
    }
  }
  os_unfair_lock_unlock(p_lock);
  int v14 = self->_lowUsageEngageModel;
  return v14;
}

- (MLModel)lowUsageRegressionModel
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lowUsageRegressionModel)
  {
    os_log_t v4 = (void *)os_transaction_create();
    v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 pathForResource:@"long_duration" ofType:@"mlmodelc"];

    os_log_t v7 = (void *)MEMORY[0x263F00D80];
    v8 = [NSURL fileURLWithPath:v6];
    id v16 = 0;
    v9 = [v7 modelWithContentsOfURL:v8 error:&v16];
    id v10 = v16;
    lowUsageRegressionModel = self->_lowUsageRegressionModel;
    self->_lowUsageRegressionModel = v9;

    if (v10)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v18 = v10;
        _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Error loading low usage regression model: %@", buf, 0xCu);
      }
    }
    v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22135E000, v13, OS_LOG_TYPE_DEFAULT, "Created lowUsageRegressionModel object lazily.", buf, 2u);
    }
  }
  os_unfair_lock_unlock(p_lock);
  int v14 = self->_lowUsageRegressionModel;
  return v14;
}

- (id)chargingDecisionForDate:(id)a3 forAudioAccessory:(id)a4
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v71 = *(double *)&v6;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "chargingDecisionForDate %@ was called", buf, 0xCu);
  }
  v9 = (void *)os_transaction_create();
  id v10 = [(PowerUIMLAudioAccessoryModelPredictor *)self getBTConnectionEventsForPredictionUpTo:v6 forDevice:v7];
  int v11 = +[PowerUISmartChargeUtilities concatenateChargeSessions:v10 withMaxDeltaSecondsBetweenEvents:10];

  v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = NSNumber;
    int v14 = v12;
    v15 = objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    *(_DWORD *)buf = 138412290;
    double v71 = *(double *)&v15;
    _os_log_impl(&dword_22135E000, v14, OS_LOG_TYPE_DEFAULT, "Found %@ events for featurization", buf, 0xCu);
  }
  if ([v11 count] >= (unint64_t)self->_minimumNumberOfPreviousConnections)
  {
    uint64_t v19 = [v11 reverseObjectEnumerator];
    id v18 = [v19 allObjects];

    +[PowerUIPredictorHelper meanEventDuration:v18];
    double v21 = v20;
    +[PowerUIPredictorHelper medianTimeBetweenDescendingEvents:v18];
    double v23 = v22;
    v24 = self->_log;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      double v71 = v21;
      __int16 v72 = 2048;
      double v73 = v23;
      _os_log_impl(&dword_22135E000, v24, OS_LOG_TYPE_DEFAULT, "meanEventDuration: %f - medianTimeBetweenEvents: %f", buf, 0x16u);
    }
    if (v21 >= 1400.0)
    {
      v25 = [(PowerUIMLAudioAccessoryModelPredictor *)self highUsageEngageModel];
      if (v23 >= 139200.0)
      {
        v67 = [(PowerUIMLAudioAccessoryModelPredictor *)self lowUsageRegressionModel];
        double v26 = 0.88;
      }
      else
      {
        v67 = [(PowerUIMLAudioAccessoryModelPredictor *)self highUsageRegressionModel];
        double v26 = 0.82;
      }
    }
    else
    {
      v25 = [(PowerUIMLAudioAccessoryModelPredictor *)self lowUsageEngageModel];
      if (v23 >= 139200.0)
      {
        v67 = [(PowerUIMLAudioAccessoryModelPredictor *)self lowUsageRegressionModel];
        double v26 = 0.84;
      }
      else
      {
        v67 = [(PowerUIMLAudioAccessoryModelPredictor *)self highUsageRegressionModel];
        double v26 = 0.75;
      }
    }
    id v65 = v7;
    self->_lastUsedLeeway = 9.375;
    v27 = objc_msgSend(v25, "modelDescription", v9);
    v28 = [v27 metadata];
    v29 = [v28 objectForKeyedSubscript:*MEMORY[0x263F00CF0]];
    v30 = [v29 objectForKeyedSubscript:@"model_version"];
    v31 = [v30 stringValue];

    v32 = self->_log;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = NSNumber;
      v34 = v32;
      v35 = [v33 numberWithDouble:v26];
      v36 = [NSNumber numberWithDouble:9.375];
      *(_DWORD *)buf = 138412802;
      double v71 = *(double *)&v35;
      __int16 v72 = 2112;
      double v73 = *(double *)&v36;
      __int16 v74 = 2112;
      v75 = v31;
      _os_log_impl(&dword_22135E000, v34, OS_LOG_TYPE_DEFAULT, "threshold: %@ - leeway: %@ - model version: %@", buf, 0x20u);
    }
    v37 = [(PowerUIMLAudioAccessoryModelPredictor *)self getInputFeaturesForDate:v6 withEventsInDescendingOrder:v18 withLog:self->_log];
    id v69 = 0;
    v66 = v25;
    v38 = [v25 predictionFromFeatures:v37 error:&v69];
    id v39 = v69;
    if (v39 && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
      -[PowerUIMLAudioAccessoryModelPredictor chargingDecisionForDate:forAudioAccessory:]();
    }
    v40 = [v38 featureValueForName:@"classProbability"];
    v41 = [v40 dictionaryValue];

    v42 = self->_log;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      v44 = [v41 description];
      *(_DWORD *)buf = 138412290;
      double v71 = *(double *)&v44;
      _os_log_impl(&dword_22135E000, v43, OS_LOG_TYPE_DEFAULT, "Engagement model raw output %@", buf, 0xCu);
    }
    v45 = [v41 objectForKeyedSubscript:&unk_26D3851E0];
    [v45 doubleValue];
    double v47 = v46;

    id v68 = v39;
    v48 = [v67 predictionFromFeatures:v37 error:&v68];
    id v49 = v68;

    if (v49)
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[PowerUIMLAudioAccessoryModelPredictor chargingDecisionForDate:forAudioAccessory:]();
      }
    }
    else if (!v39)
    {
      v56 = [v48 featureValueForName:@"duration_pred"];
      [v56 doubleValue];
      double v58 = v57;

      v59 = self->_log;
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        double v71 = v58;
        _os_log_impl(&dword_22135E000, v59, OS_LOG_TYPE_DEFAULT, "Unadjusted regression model output %lf", buf, 0xCu);
      }
      double v60 = v58 + -9.375;
      v61 = self->_log;
      BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
      if (v47 > v26)
      {
        if (v62)
        {
          *(_DWORD *)buf = 134218240;
          double v71 = v47;
          __int16 v72 = 2048;
          double v73 = v26;
          _os_log_impl(&dword_22135E000, v61, OS_LOG_TYPE_DEFAULT, "Engagement model says YES (Prob %lf > Threshold %lf)", buf, 0x16u);
        }
        if (v60 <= 0.0 || v60 > 4320.0)
        {
          v63 = self->_log;
          v9 = v64;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            double v71 = v60;
            _os_log_impl(&dword_22135E000, v63, OS_LOG_TYPE_DEFAULT, "... but smartChargeDuration out of bound (%lf)", buf, 0xCu);
          }
          objc_super v17 = [[PowerUIModelPredictionContainer alloc] initInvalidEntry:3 withEngagementConfidence:v31 withSmartChargeDuration:v47 withModelVersion:v60];
          goto LABEL_32;
        }
        v54 = [[PowerUIModelPredictionContainer alloc] initWithEngagementConfidence:v31 withSmartChargeDuration:v47 withModelVersion:v60];
LABEL_31:
        objc_super v17 = v54;
        v9 = v64;
LABEL_32:

        id v7 = v65;
        goto LABEL_33;
      }
      if (v62)
      {
        *(_DWORD *)buf = 134218240;
        double v71 = v47;
        __int16 v72 = 2048;
        double v73 = v26;
        _os_log_impl(&dword_22135E000, v61, OS_LOG_TYPE_DEFAULT, "... but engagement model says NO (Prob %lf < Threshold %lf)", buf, 0x16u);
      }
      v50 = [PowerUIModelPredictionContainer alloc];
      uint64_t v53 = 2;
      double v51 = v47;
      double v52 = v60;
LABEL_30:
      v54 = [(PowerUIModelPredictionContainer *)v50 initInvalidEntry:v53 withEngagementConfidence:v31 withSmartChargeDuration:v51 withModelVersion:v52];
      goto LABEL_31;
    }
    v50 = [PowerUIModelPredictionContainer alloc];
    double v51 = 0.0;
    double v52 = 0.0;
    uint64_t v53 = 5;
    goto LABEL_30;
  }
  id v16 = self->_log;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[PowerUIMLAudioAccessoryModelPredictor chargingDecisionForDate:forAudioAccessory:](v16, v11);
  }
  objc_super v17 = [[PowerUIModelPredictionContainer alloc] initInvalidEntry:1 withEngagementConfidence:@"Unknown" withSmartChargeDuration:0.0 withModelVersion:0.0];
  id v18 = v11;
LABEL_33:

  return v17;
}

- (id)getInputFeaturesForDate:(id)a3 withEventsInDescendingOrder:(id)a4 withLog:(id)a5
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x263EFF8F0] currentCalendar];
  int v11 = [v10 components:608 fromDate:v7];

  uint64_t v12 = [v11 hour];
  double v13 = (double)v12;
  double v14 = 0.0;
  if (+[PowerUISmartChargeUtilities isWeekend:v7]) {
    double v15 = 1.0;
  }
  else {
    double v15 = 0.0;
  }
  id v16 = +[PowerUIPredictorHelper timeBetweenUsesForSortedDescendingByAgeEvents:v8 forHourBin:1 atDate:v7 addAtDate:1];
  uint64_t v17 = +[PowerUIPredictorHelper timeBetweenUsesForSortedDescendingByAgeEvents:v8 forHourBin:2 atDate:v7 addAtDate:1];
  uint64_t v18 = +[PowerUIPredictorHelper timeBetweenUsesForSortedDescendingByAgeEvents:v8 forHourBin:4 atDate:v7 addAtDate:1];
  uint64_t v19 = +[PowerUIPredictorHelper timeBetweenUsesForSortedDescendingByAgeEvents:v8 forHourBin:24 atDate:v7 addAtDate:1];
  +[PowerUIPredictorHelper medianOf:v16];
  double v21 = v20;
  +[PowerUIPredictorHelper medianOf:v17];
  double v23 = v22;
  +[PowerUIPredictorHelper medianOf:v18];
  double v25 = v24;
  +[PowerUIPredictorHelper medianOf:v19];
  double v59 = v26;
  +[PowerUIPredictorHelper standardDeviationOf:v16];
  double v60 = v27;
  v67 = (void *)v17;
  +[PowerUIPredictorHelper standardDeviationOf:v17];
  double v61 = v28;
  v66 = (void *)v18;
  +[PowerUIPredictorHelper standardDeviationOf:v18];
  double v62 = v29;
  id v65 = (void *)v19;
  +[PowerUIPredictorHelper standardDeviationOf:v19];
  double v64 = v30;
  id v69 = v9;
  v31 = +[PowerUIPredictorHelper getUsageBucketsForEvents:v8 forDate:v7 withLog:v9];
  id v68 = v11;
  +[PowerUIPredictorHelper hoursUntilUseFromBucketedUsage:withCurrentHour:withComponentsMinutes:](PowerUIPredictorHelper, "hoursUntilUseFromBucketedUsage:withCurrentHour:withComponentsMinutes:", v31, v12, [v11 minute]);
  double v63 = v32;
  [(PowerUIMLAudioAccessoryModelPredictor *)self historicalMeaningfulUnderchargeRate:v8];
  double v34 = v33;
  v35 = [MEMORY[0x263EFF9A0] dictionary];
  v36 = [NSNumber numberWithDouble:v13];
  [v35 setObject:v36 forKeyedSubscript:@"hour"];

  v37 = [NSNumber numberWithDouble:v15];
  [v35 setObject:v37 forKeyedSubscript:@"is_weekend"];

  v38 = [NSNumber numberWithDouble:v34];
  [v35 setObject:v38 forKeyedSubscript:@"meaningful_undercharge_rolling_average"];

  id v39 = [NSNumber numberWithDouble:v21];
  [v35 setObject:v39 forKeyedSubscript:@"classic_time_between_uses_med_dur_1"];

  v40 = [NSNumber numberWithDouble:v23];
  [v35 setObject:v40 forKeyedSubscript:@"classic_time_between_uses_med_dur_2"];

  v41 = [NSNumber numberWithDouble:v25];
  [v35 setObject:v41 forKeyedSubscript:@"classic_time_between_uses_med_dur_4"];

  v42 = [NSNumber numberWithDouble:v59];
  [v35 setObject:v42 forKeyedSubscript:@"classic_time_between_uses_med_dur_24"];

  v43 = [NSNumber numberWithDouble:v60];
  [v35 setObject:v43 forKeyedSubscript:@"classic_time_between_uses_std_dur_1"];

  v44 = [NSNumber numberWithDouble:v61];
  [v35 setObject:v44 forKeyedSubscript:@"classic_time_between_uses_std_dur_2"];

  v45 = [NSNumber numberWithDouble:v62];
  [v35 setObject:v45 forKeyedSubscript:@"classic_time_between_uses_std_dur_4"];

  double v46 = [NSNumber numberWithDouble:v64];
  [v35 setObject:v46 forKeyedSubscript:@"classic_time_between_uses_std_dur_24"];

  double v47 = [NSNumber numberWithDouble:v63];
  [v35 setObject:v47 forKeyedSubscript:@"hours_until_use"];

  uint64_t v48 = 0;
  do
  {
    id v49 = objc_msgSend(NSString, "stringWithFormat:", @"hour_plus_%d", v48);
    int v50 = (int)(v13 + v14);
    if (v50 > 23) {
      v50 -= 24;
    }
    double v51 = NSNumber;
    double v52 = [v31 objectAtIndexedSubscript:v50];
    [v52 doubleValue];
    uint64_t v53 = objc_msgSend(v51, "numberWithDouble:");
    [v35 setObject:v53 forKeyedSubscript:v49];

    double v14 = v14 + 1.0;
    uint64_t v48 = (v48 + 1);
  }
  while (v48 != 6);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v73 = v35;
    _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "ml input dict: %@", buf, 0xCu);
  }
  id v71 = 0;
  v55 = (void *)[objc_alloc(MEMORY[0x263F00D38]) initWithDictionary:v35 error:&v71];
  id v56 = v71;
  if (v56)
  {
    double v57 = self->_log;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v73 = v56;
      _os_log_impl(&dword_22135E000, v57, OS_LOG_TYPE_DEFAULT, "Error creating input features: %@", buf, 0xCu);
    }
  }

  return v55;
}

- (BOOL)isSufficientDataAvailableForEngagementForDevice:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_minimumNumberOfPreviousConnections > 0)
  {
    v5 = [MEMORY[0x263EFF910] date];
    id v6 = [(PowerUIMLAudioAccessoryModelPredictor *)self getBTConnectionEventsForPredictionUpTo:v5 forDevice:v4];
    if ([v6 count] >= (unint64_t)self->_minimumNumberOfPreviousConnections)
    {
      uint64_t v18 = [v6 firstObject];
      uint64_t v19 = [v18 startDate];
      [v5 timeIntervalSinceDate:v19];
      double v21 = v20;

      if (v21 < (double)self->_minimumDaysOfHistory * 86400.0)
      {
        id v10 = objc_alloc_init(MEMORY[0x263F08790]);
        [v10 setDateFormat:@"yyyy-MM-dd 'at' HH:mm"];
        double v22 = self->_log;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          log = v22;
          double v30 = [v6 firstObject];
          double v23 = [v30 startDate];
          id v24 = [v10 stringFromDate:v23];
          uint64_t v25 = [v24 UTF8String];
          double v26 = [NSNumber numberWithDouble:v21 / 86400.0];
          double v27 = [NSNumber numberWithInt:self->_minimumDaysOfHistory];
          *(_DWORD *)buf = 136315650;
          uint64_t v32 = v25;
          __int16 v33 = 2112;
          double v34 = v26;
          __int16 v35 = 2112;
          v36 = v27;
          _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "Oldest connection event (%s) younger than %@ < %@ days. Disengage.", buf, 0x20u);
        }
        goto LABEL_12;
      }
      BOOL v8 = 1;
    }
    else
    {
      id v7 = self->_log;
      BOOL v8 = 0;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = NSNumber;
        id v10 = v7;
        int v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
        uint64_t v12 = [NSNumber numberWithInt:self->_minimumNumberOfPreviousConnections];
        *(_DWORD *)buf = 138412546;
        uint64_t v32 = (uint64_t)v11;
        __int16 v33 = 2112;
        double v34 = v12;
        _os_log_impl(&dword_22135E000, v10, OS_LOG_TYPE_DEFAULT, "Not enough connection events: %@ < %@. Disengage.", buf, 0x16u);

LABEL_12:
        BOOL v8 = 0;
      }
    }

    goto LABEL_14;
  }
  double v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = NSNumber;
    uint64_t minimumNumberOfPreviousConnections = self->_minimumNumberOfPreviousConnections;
    id v16 = v13;
    uint64_t v17 = [v14 numberWithInt:minimumNumberOfPreviousConnections];
    *(_DWORD *)buf = 138412290;
    uint64_t v32 = (uint64_t)v17;
    _os_log_impl(&dword_22135E000, v16, OS_LOG_TYPE_DEFAULT, "Minimum number of required connections is %@ < 1. Proceed.", buf, 0xCu);
  }
  BOOL v8 = 1;
LABEL_14:

  return v8;
}

- (id)getBTConnectionEventsForPredictionUpTo:(id)a3 forDevice:(id)a4
{
  return [(PowerUIMLAudioAccessoryModelPredictor *)self getBTConnectionEventsUpTo:a3 withMinimumDuration:1000 withLimit:a4 forDevice:300.0];
}

- (id)getBTConnectionEventsUpTo:(id)a3 withMinimumDuration:(double)a4 withLimit:(unsigned int)a5 forDevice:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  double v28 = (void *)os_transaction_create();
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  double v46 = __Block_byref_object_copy_;
  double v47 = __Block_byref_object_dispose_;
  id v48 = [MEMORY[0x263EFF980] array];
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy_;
  v41[4] = __Block_byref_object_dispose_;
  id v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy_;
  v39[4] = __Block_byref_object_dispose_;
  id v40 = 0;
  id v11 = objc_alloc(MEMORY[0x263F2A8B0]);
  uint64_t v12 = [v9 dateByAddingTimeInterval:-2592000.0];
  uint64_t v32 = (void *)[v11 initWithStartDate:v12 endDate:v9 maxEvents:a5 lastN:0 reversed:0];
  double v34 = v9;

  id v13 = objc_alloc(MEMORY[0x263F2A8B0]);
  double v14 = [v9 dateByAddingTimeInterval:-5184000.0];
  double v30 = (void *)[v13 initWithStartDate:v14 endDate:v9 maxEvents:0 lastN:0 reversed:0];

  __int16 v33 = BiomeLibrary();
  v31 = [v33 Device];
  double v15 = [v31 Wireless];
  id v16 = [v15 Bluetooth];
  uint64_t v17 = [v16 publisherWithOptions:v32];
  uint64_t v18 = BiomeLibrary();
  uint64_t v19 = [v18 Device];
  double v20 = [v19 TimeZone];
  double v21 = [v20 publisherWithOptions:v30];
  double v22 = [v17 orderedMergeWithOther:v21 comparator:&__block_literal_global];
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_2;
  v37[3] = &unk_2645A5C30;
  id v23 = v10;
  id v38 = v23;
  id v24 = [v22 filterWithIsIncluded:v37];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_3;
  v36[3] = &unk_2645A5C58;
  v36[4] = self;
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_179;
  v35[3] = &unk_2645A5C80;
  v35[4] = self;
  v35[5] = v41;
  *(double *)&v35[8] = a4;
  v35[6] = v39;
  v35[7] = &v43;
  id v25 = (id)[v24 sinkWithCompletion:v36 receiveInput:v35];

  double v26 = [MEMORY[0x263EFF8C0] arrayWithArray:v44[5]];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(&v43, 8);
  return v26;
}

uint64_t __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = NSNumber;
  id v5 = a3;
  [a2 timestamp];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  id v7 = NSNumber;
  [v5 timestamp];
  double v9 = v8;

  id v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

uint64_t __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v3 eventBody];
    id v7 = [v6 address];
    uint64_t v8 = [v7 isEqualToString:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

void __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 state])
  {
    id v4 = *(NSObject **)(*(void *)(a1 + 32) + 64);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_3_cold_1(v4, v3);
    }
  }
}

void __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_179(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v5 = (void *)MEMORY[0x223C80A30]();
  id v6 = [v4 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    id v8 = v4;
    double v9 = *(NSObject **)(*(void *)(a1 + 32) + 64);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_179_cold_1(v9, v8);
    }
    id v10 = [v8 eventBody];
    if ([v10 starting])
    {
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

      if (!v11)
      {
        uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
        id v13 = v8;
        double v14 = *(void **)(v12 + 40);
        *(void *)(v12 + 40) = v13;
        goto LABEL_16;
      }
    }
    else
    {
    }
    double v14 = [v8 eventBody];
    if (([v14 starting] & 1) == 0)
    {
      uint64_t v15 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);

      if (!v15)
      {
LABEL_17:

        goto LABEL_18;
      }
      id v16 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) eventBody];
      double v17 = 0.0;
      if ([v16 hasSecondsFromGMT])
      {
        uint64_t v18 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) eventBody];
        [v18 secondsFromGMT];
        double v17 = v19;
      }
      double v20 = (void *)MEMORY[0x263EFF910];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) timestamp];
      double v14 = [v20 dateWithTimeIntervalSinceReferenceDate:v17 + v21];
      double v22 = (void *)MEMORY[0x263EFF910];
      [v8 timestamp];
      id v24 = [v22 dateWithTimeIntervalSinceReferenceDate:v17 + v23];
      [v24 timeIntervalSinceDate:v14];
      if (v25 >= *(double *)(a1 + 64))
      {
        double v26 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        double v27 = [[PowerUIChargeSession alloc] initWithStartDate:v14 withEndDate:v24 withStartSoC:0 withEndSoC:0];
        [v26 addObject:v27];
      }
      uint64_t v28 = *(void *)(*(void *)(a1 + 48) + 8);
      double v29 = *(void **)(v28 + 40);
      *(void *)(v28 + 40) = 0;
    }
LABEL_16:

    goto LABEL_17;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
LABEL_18:
}

- (BOOL)deviceHasAtLeastOneLongConnection:(id)a3 forReferenceDate:(id)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF910] dateWithTimeInterval:a4 sinceDate:-2592000.0];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v26 + 1) + 8 * v12);
      double v14 = [v13 startDate];
      uint64_t v15 = [v7 earlierDate:v14];
      id v16 = [v13 startDate];

      if (v15 == v16) {
        break;
      }
      double v17 = [v13 endDate];
      uint64_t v18 = [v13 startDate];
      [v17 timeIntervalSinceDate:v18];
      double v20 = v19;

      if (v20 >= 10800.0)
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v25 = 0;
          _os_log_impl(&dword_22135E000, log, OS_LOG_TYPE_DEFAULT, "At least one long engagement was found.", v25, 2u);
        }

        BOOL v22 = 1;
        goto LABEL_15;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  double v21 = self->_log;
  BOOL v22 = 0;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v25 = 0;
    _os_log_impl(&dword_22135E000, v21, OS_LOG_TYPE_DEFAULT, "No long engagements were found.", v25, 2u);
    BOOL v22 = 0;
  }
LABEL_15:

  return v22;
}

- (double)historicalMeaningfulUnderchargeRate:(id)a3
{
  id v3 = a3;
  int v4 = [v3 count];
  if (v4 < 2)
  {
    int v6 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    int v6 = 0;
    uint64_t v7 = v4;
    uint64_t v32 = (v4 - 2) + 1;
    do
    {
      int v35 = v6;
      uint64_t v33 = v7;
      uint64_t v34 = v7 - 1;
      uint64_t v8 = (v7 - 1);
      uint64_t v9 = objc_msgSend(v3, "objectAtIndexedSubscript:", v8, v32);
      uint64_t v10 = [v9 endDate];
      uint64_t v11 = [v10 dateByAddingTimeInterval:9000.0];

      uint64_t v12 = [v3 objectAtIndexedSubscript:v8];
      id v13 = [v12 endDate];
      double v14 = [v3 objectAtIndexedSubscript:v8];
      uint64_t v15 = [v14 startDate];
      [v13 timeIntervalSinceDate:v15];
      double v17 = v16;

      uint64_t v18 = v32;
      do
      {
        double v19 = [v3 objectAtIndexedSubscript:v5 + v18 - 1];
        double v20 = [v19 startDate];
        double v21 = [v11 earlierDate:v20];
        BOOL v22 = [v3 objectAtIndexedSubscript:v5 + v18 - 1];
        double v23 = [v22 startDate];

        if (v21 != v23) {
          break;
        }
        id v24 = [v3 objectAtIndexedSubscript:v5 + v18 - 1];
        double v25 = [v24 endDate];
        long long v26 = [v25 earlierDate:v11];
        long long v27 = [v3 objectAtIndexedSubscript:v5 + v18 - 1];
        long long v28 = [v27 startDate];
        [v26 timeIntervalSinceDate:v28];
        double v17 = v17 + v29;

        --v18;
      }
      while ((int)v5 + (int)v18 > 0);
      int v6 = v35;
      if (v17 > 7200.0) {
        int v6 = v35 + 1;
      }

      --v5;
      uint64_t v7 = v34;
    }
    while (v33 > 2);
  }
  double v30 = 0.0;
  if ([v3 count] && v6) {
    double v30 = (double)v6 / (double)(unint64_t)[v3 count];
  }

  return v30;
}

- (double)lastUsedLeeway
{
  return self->_lastUsedLeeway;
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

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (int)minimumDaysOfHistory
{
  return self->_minimumDaysOfHistory;
}

- (void)setMinimumDaysOfHistory:(int)a3
{
  self->_minimumDaysOfHistory = a3;
}

- (int)minimumNumberOfPreviousConnections
{
  return self->_minimumNumberOfPreviousConnections;
}

- (void)setMinimumNumberOfPreviousConnections:(int)a3
{
  self->_uint64_t minimumNumberOfPreviousConnections = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusLog, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_lowUsageRegressionModel, 0);
  objc_storeStrong((id *)&self->_lowUsageEngageModel, 0);
  objc_storeStrong((id *)&self->_highUsageRegressionModel, 0);
  objc_storeStrong((id *)&self->_highUsageEngageModel, 0);
}

- (void)chargingDecisionForDate:(void *)a1 forAudioAccessory:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = NSNumber;
  int v4 = a1;
  uint64_t v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_22135E000, v4, v6, "Only %@ events were found, charging decision should not have been queried for device.", v7);
}

- (void)chargingDecisionForDate:forAudioAccessory:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_22135E000, v0, v1, "Error getting regression model predictions: %@", v2);
}

- (void)chargingDecisionForDate:forAudioAccessory:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_22135E000, v0, v1, "Error getting engagement model predictions: %@", v2);
}

void __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_3_cold_1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  int v4 = [a2 error];
  id v5 = [v4 description];
  [v5 UTF8String];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_22135E000, v3, v6, "Error getting bluetooth biome events: %s", v7);
}

void __107__PowerUIMLAudioAccessoryModelPredictor_getBTConnectionEventsUpTo_withMinimumDuration_withLimit_forDevice___block_invoke_179_cold_1(void *a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFF910];
  int v4 = a1;
  [a2 timestamp];
  id v5 = objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  uint64_t v6 = NSNumber;
  uint64_t v7 = [a2 eventBody];
  uint64_t v8 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "starting"));
  int v9 = 138412546;
  uint64_t v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v8;
  _os_log_debug_impl(&dword_22135E000, v4, OS_LOG_TYPE_DEBUG, "bluetooth event: %@ - starting :%@", (uint8_t *)&v9, 0x16u);
}

@end