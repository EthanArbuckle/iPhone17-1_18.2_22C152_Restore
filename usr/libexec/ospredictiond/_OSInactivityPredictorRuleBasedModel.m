@interface _OSInactivityPredictorRuleBasedModel
+ (id)log;
+ (id)predictor;
+ (id)sleepLog;
- (BOOL)excludeNegativeLux;
- (BOOL)useTimeRestriction;
- (OSIAmbientLightMonitor)lightMonitor;
- (TRIClient)trialClient;
- (_OSInactivityPredictorRuleBasedModel)init;
- (double)maxPredictionDurationHours;
- (double)recommendedWaitTime;
- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6;
- (id)sleepSuppressionPredictionResultAtDate:(id)a3 withError:(id *)a4;
- (int)coreTimeRestrictionBedtimeHour;
- (int)coreTimeRestrictionWakeupHour;
- (int)initialTimeRestrictionEarlyHour;
- (int)initialTimeRestrictionLateHour;
- (int)requeryDelta;
- (int)timeRestrictionEarlyHour;
- (int)timeRestrictionLateHour;
- (void)setCoreTimeRestrictionBedtimeHour:(int)a3;
- (void)setCoreTimeRestrictionWakeupHour:(int)a3;
- (void)setExcludeNegativeLux:(BOOL)a3;
- (void)setInitialTimeRestrictionEarlyHour:(int)a3;
- (void)setInitialTimeRestrictionLateHour:(int)a3;
- (void)setLightMonitor:(id)a3;
- (void)setMaxPredictionDurationHours:(double)a3;
- (void)setRecommendedWaitTime:(double)a3;
- (void)setRequeryDelta:(int)a3;
- (void)setTimeRestrictionEarlyHour:(int)a3;
- (void)setTimeRestrictionLateHour:(int)a3;
- (void)setTrialClient:(id)a3;
- (void)setUseTimeRestriction:(BOOL)a3;
- (void)updateTrialParameters;
@end

@implementation _OSInactivityPredictorRuleBasedModel

- (_OSInactivityPredictorRuleBasedModel)init
{
  v17.receiver = self;
  v17.super_class = (Class)_OSInactivityPredictorRuleBasedModel;
  v2 = [(_OSInactivityPredictor *)&v17 init];
  v3 = v2;
  if (v2)
  {
    [(_OSInactivityPredictor *)v2 setPredictorType:@"ruleBased"];
    [(_OSInactivityPredictor *)v3 setQueryingMechanism:@"anytime"];
    v4 = objc_alloc_init(OSIAmbientLightMonitor);
    lightMonitor = v3->_lightMonitor;
    v3->_lightMonitor = v4;

    uint64_t v6 = +[TRIClient clientWithIdentifier:293];
    trialClient = v3->_trialClient;
    v3->_trialClient = (TRIClient *)v6;

    [(_OSInactivityPredictorRuleBasedModel *)v3 updateTrialParameters];
    objc_initWeak(&location, v3);
    v8 = v3->_trialClient;
    v11 = _NSConcreteStackBlock;
    uint64_t v12 = 3221225472;
    v13 = sub_10001A034;
    v14 = &unk_1000648F0;
    objc_copyWeak(&v15, &location);
    id v9 = [(TRIClient *)v8 addUpdateHandlerForNamespaceName:@"COREOS_PREDICTION_INACTIVITY" usingBlock:&v11];
    -[_OSInactivityPredictor setLongThreshold:](v3, "setLongThreshold:", 10800.0, v11, v12, v13, v14);
    [(_OSInactivityPredictor *)v3 setConfidenceThresholdStrict:0.8];
    [(_OSInactivityPredictor *)v3 setConfidenceThresholdRelaxed:0.5];
    [(_OSInactivityPredictor *)v3 setRequireEnoughHistory:0];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

+ (id)predictor
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (void)updateTrialParameters
{
  trialClient = self->_trialClient;
  if (trialClient)
  {
    v4 = [(TRIClient *)trialClient levelForFactor:@"ruleBasedRecommendedWaitTime" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    [v4 doubleValue];
    self->recommendedWaitTime = v5;
  }
  else
  {
    self->recommendedWaitTime = 1800.0;
  }
  uint64_t v6 = self->_trialClient;
  if (v6)
  {
    v7 = [(TRIClient *)v6 levelForFactor:@"ruleBasedUseTimeRestriction" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    self->_useTimeRestriction = [v7 BOOLeanValue];
  }
  else
  {
    self->_useTimeRestriction = 1;
  }
  v8 = self->_trialClient;
  if (v8)
  {
    id v9 = [(TRIClient *)v8 levelForFactor:@"ruleBasedEarlyHour" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    self->_timeRestrictionEarlyHour = [v9 longValue];
  }
  else
  {
    self->_timeRestrictionEarlyHour = 11;
  }
  v10 = self->_trialClient;
  if (v10)
  {
    v11 = [(TRIClient *)v10 levelForFactor:@"ruleBasedLateHour" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    self->_timeRestrictionLateHour = [v11 longValue];
  }
  else
  {
    self->_timeRestrictionLateHour = 18;
  }
  uint64_t v12 = self->_trialClient;
  if (v12)
  {
    v13 = [(TRIClient *)v12 levelForFactor:@"initialRuleBasedEarlyHour" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    self->_initialTimeRestrictionEarlyHour = [v13 longValue];
  }
  else
  {
    self->_initialTimeRestrictionEarlyHour = 7;
  }
  v14 = self->_trialClient;
  if (v14)
  {
    id v15 = [(TRIClient *)v14 levelForFactor:@"initialRuleBasedLateHour" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    self->_initialTimeRestrictionLateHour = [v15 longValue];
  }
  else
  {
    self->_initialTimeRestrictionLateHour = 21;
  }
  v16 = self->_trialClient;
  if (v16)
  {
    objc_super v17 = [(TRIClient *)v16 levelForFactor:@"coreRuleBasedBedtimeHour" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    self->_coreTimeRestrictionBedtimeHour = [v17 longValue];
  }
  else
  {
    self->_coreTimeRestrictionBedtimeHour = 1;
  }
  v18 = self->_trialClient;
  if (v18)
  {
    v19 = [(TRIClient *)v18 levelForFactor:@"coreRuleBasedWakeupHour" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    self->_coreTimeRestrictionWakeupHour = [v19 longValue];
  }
  else
  {
    self->_coreTimeRestrictionWakeupHour = 6;
  }
  v20 = self->_trialClient;
  if (v20)
  {
    v21 = [(TRIClient *)v20 levelForFactor:@"ruleBasedMaxDurationHours" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    [v21 doubleValue];
    self->_maxPredictionDurationHours = v22;
  }
  else
  {
    self->_maxPredictionDurationHours = 6.0;
  }
  v23 = self->_trialClient;
  if (v23)
  {
    v24 = [(TRIClient *)v23 levelForFactor:@"ruleBasedNegativeLuxPreventsEngagement" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    self->_excludeNegativeLux = [v24 BOOLeanValue];
  }
  else
  {
    self->_excludeNegativeLux = 0;
  }
  v25 = self->_trialClient;
  if (v25)
  {
    id v26 = [(TRIClient *)v25 levelForFactor:@"requeryDelta" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    self->_requeryDelta = [v26 longValue];
  }
  else
  {
    self->_requeryDelta = 900;
  }
}

+ (id)log
{
  return [a1 logWithCategory:@"ruleBasedPredictor"];
}

+ (id)sleepLog
{
  return [a1 logWithCategory:@"ruleBasedSleepPredictor"];
}

- (id)sleepSuppressionPredictionResultAtDate:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  if (!self->_useTimeRestriction)
  {
    double maxPredictionDurationHours = self->_maxPredictionDurationHours;
LABEL_13:
    [(_OSInactivityPredictor *)self confidenceThresholdStrict];
    double v16 = v18 + 0.01;
    goto LABEL_14;
  }
  int timeRestrictionLateHour = self->_timeRestrictionLateHour;
  int timeRestrictionEarlyHour = self->_timeRestrictionEarlyHour;
  [(_OSInactivityPredictor *)self waitedDuration];
  double v9 = v8;
  if (v8 < (double)self->_requeryDelta)
  {
    int timeRestrictionLateHour = self->_initialTimeRestrictionLateHour;
    int timeRestrictionEarlyHour = self->_initialTimeRestrictionEarlyHour;
    v10 = [(id)objc_opt_class() sleepLog];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int requeryDelta = self->_requeryDelta;
      int v25 = 134218240;
      *(double *)id v26 = v9;
      *(_WORD *)&v26[8] = 1024;
      int v27 = requeryDelta;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Only waited %.2f seconds (<%d). Tighten time restrictions.", (uint8_t *)&v25, 0x12u);
    }
  }
  uint64_t v12 = [(id)objc_opt_class() sleepLog];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 67109376;
    *(_DWORD *)id v26 = timeRestrictionLateHour;
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = timeRestrictionEarlyHour;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Restricting entry between %d to %d", (uint8_t *)&v25, 0xEu);
  }

  unsigned int v13 = +[OSIntelligenceUtilities isInputDateInTimeRange:v5 withEarlyTimeOfDay:(double)timeRestrictionLateHour andLateTimeOfDay:(double)timeRestrictionEarlyHour];
  +[OSIntelligenceUtilities secondsUntilHour:timeRestrictionEarlyHour fromDate:v5];
  double maxPredictionDurationHours = 0.0;
  double v16 = 0.0;
  if (v13)
  {
    double v17 = v14 / 3600.0;
    if (self->_maxPredictionDurationHours >= v17) {
      double maxPredictionDurationHours = v17;
    }
    else {
      double maxPredictionDurationHours = self->_maxPredictionDurationHours;
    }
    goto LABEL_13;
  }
LABEL_14:
  id v19 = objc_alloc((Class)_OSInactivityPredictorOutput);
  [(_OSInactivityPredictor *)self confidenceThresholdRelaxed];
  double v21 = v20;
  [(_OSInactivityPredictor *)self confidenceThresholdStrict];
  id v23 = [v19 initWithConfidenceValue:1 andRelaxedThreshold:v16 andStrictThreshold:v21 andPredictedDuration:v22 andReason:maxPredictionDurationHours];

  return v23;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  id v9 = a3;
  if (a5 == 1)
  {
    id v10 = [(_OSInactivityPredictorRuleBasedModel *)self sleepSuppressionPredictionResultAtDate:v9 withError:a6];
    goto LABEL_13;
  }
  if (self->_useTimeRestriction)
  {
    int coreTimeRestrictionBedtimeHour = self->_coreTimeRestrictionBedtimeHour;
    int coreTimeRestrictionWakeupHour = self->_coreTimeRestrictionWakeupHour;
    unsigned int v13 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 134218496;
      int64_t v27 = a5;
      __int16 v28 = 1024;
      int v29 = coreTimeRestrictionBedtimeHour;
      __int16 v30 = 1024;
      int v31 = coreTimeRestrictionWakeupHour;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "(%ld) Restricting entry between %d to %d", (uint8_t *)&v26, 0x18u);
    }

    unsigned int v14 = +[OSIntelligenceUtilities isInputDateInTimeRange:v9 withEarlyTimeOfDay:(double)coreTimeRestrictionBedtimeHour andLateTimeOfDay:(double)coreTimeRestrictionWakeupHour];
    +[OSIntelligenceUtilities secondsUntilHour:coreTimeRestrictionWakeupHour fromDate:v9];
    double maxPredictionDurationHours = 0.0;
    double v17 = 0.0;
    if (!v14) {
      goto LABEL_12;
    }
    double v18 = v15 / 3600.0;
    if (self->_maxPredictionDurationHours >= v18) {
      double maxPredictionDurationHours = v18;
    }
    else {
      double maxPredictionDurationHours = self->_maxPredictionDurationHours;
    }
  }
  else
  {
    double maxPredictionDurationHours = self->_maxPredictionDurationHours;
  }
  [(_OSInactivityPredictor *)self confidenceThresholdStrict];
  double v17 = v19 + 0.01;
LABEL_12:
  id v20 = objc_alloc((Class)_OSInactivityPredictorOutput);
  [(_OSInactivityPredictor *)self confidenceThresholdRelaxed];
  double v22 = v21;
  [(_OSInactivityPredictor *)self confidenceThresholdStrict];
  id v10 = [v20 initWithConfidenceValue:1 andRelaxedThreshold:v17 andStrictThreshold:v22 andPredictedDuration:v23 andReason:maxPredictionDurationHours];
LABEL_13:
  v24 = v10;

  return v24;
}

- (double)recommendedWaitTime
{
  return self->recommendedWaitTime;
}

- (void)setRecommendedWaitTime:(double)a3
{
  self->recommendedWaitTime = a3;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (OSIAmbientLightMonitor)lightMonitor
{
  return self->_lightMonitor;
}

- (void)setLightMonitor:(id)a3
{
}

- (BOOL)useTimeRestriction
{
  return self->_useTimeRestriction;
}

- (void)setUseTimeRestriction:(BOOL)a3
{
  self->_useTimeRestriction = a3;
}

- (int)timeRestrictionLateHour
{
  return self->_timeRestrictionLateHour;
}

- (void)setTimeRestrictionLateHour:(int)a3
{
  self->_int timeRestrictionLateHour = a3;
}

- (int)timeRestrictionEarlyHour
{
  return self->_timeRestrictionEarlyHour;
}

- (void)setTimeRestrictionEarlyHour:(int)a3
{
  self->_int timeRestrictionEarlyHour = a3;
}

- (int)initialTimeRestrictionLateHour
{
  return self->_initialTimeRestrictionLateHour;
}

- (void)setInitialTimeRestrictionLateHour:(int)a3
{
  self->_initialTimeRestrictionLateHour = a3;
}

- (int)initialTimeRestrictionEarlyHour
{
  return self->_initialTimeRestrictionEarlyHour;
}

- (void)setInitialTimeRestrictionEarlyHour:(int)a3
{
  self->_initialTimeRestrictionEarlyHour = a3;
}

- (int)coreTimeRestrictionBedtimeHour
{
  return self->_coreTimeRestrictionBedtimeHour;
}

- (void)setCoreTimeRestrictionBedtimeHour:(int)a3
{
  self->_int coreTimeRestrictionBedtimeHour = a3;
}

- (int)coreTimeRestrictionWakeupHour
{
  return self->_coreTimeRestrictionWakeupHour;
}

- (void)setCoreTimeRestrictionWakeupHour:(int)a3
{
  self->_int coreTimeRestrictionWakeupHour = a3;
}

- (double)maxPredictionDurationHours
{
  return self->_maxPredictionDurationHours;
}

- (void)setMaxPredictionDurationHours:(double)a3
{
  self->_double maxPredictionDurationHours = a3;
}

- (BOOL)excludeNegativeLux
{
  return self->_excludeNegativeLux;
}

- (void)setExcludeNegativeLux:(BOOL)a3
{
  self->_excludeNegativeLux = a3;
}

- (int)requeryDelta
{
  return self->_requeryDelta;
}

- (void)setRequeryDelta:(int)a3
{
  self->_int requeryDelta = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightMonitor, 0);

  objc_storeStrong((id *)&self->_trialClient, 0);
}

@end