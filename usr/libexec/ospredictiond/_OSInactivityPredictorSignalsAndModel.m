@interface _OSInactivityPredictorSignalsAndModel
+ (id)predictorWithPredictor:(id)a3;
- (BOOL)accelerateSuppression;
- (BOOL)isRarelyUsed;
- (BOOL)rarelyUsedTimeRestriction;
- (BOOL)requireEnoughHistory;
- (BOOL)useAlarm;
- (BOOL)useDND;
- (NSString)deadlineSetter;
- (OSIAlarmMonitor)alarmMonitor;
- (OSIDNDMonitor)dndMonitor;
- (OSIntelligenceAnalyticsManager)analyticsManager;
- (OS_os_log)log;
- (TRIClient)trialClient;
- (_OSInactivityPredictor)baseModel;
- (_OSInactivityPredictorSignalsAndModel)init;
- (_OSInactivityPredictorSignalsAndModel)initWithPredictor:(id)a3;
- (double)accelerateLookahead;
- (double)alarmLeeway;
- (double)alarmOffset;
- (double)confidenceThresholdRelaxed;
- (double)confidenceThresholdStrict;
- (double)dndOffset;
- (double)longThreshold;
- (double)rarelyUsedMaxPredictionDuration;
- (double)recommendedWaitTime;
- (id)inferInputDateAndWaitTimeToQueryModelWithOptions:(int64_t)a3 withError:(id *)a4;
- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6;
- (id)longInactivityPredictionResultWithOptions:(int64_t)a3 withError:(id *)a4;
- (id)predictorType;
- (id)queryingMechanism;
- (id)sleepSuppresionPredictionResultWithError:(id *)a3;
- (int)rarelyUsedTimeRestrictionEarlyHour;
- (int)rarelyUsedTimeRestrictionLateHour;
- (int)requeryDelta;
- (void)setAccelerateLookahead:(double)a3;
- (void)setAccelerateSuppression:(BOOL)a3;
- (void)setAlarmLeeway:(double)a3;
- (void)setAlarmMonitor:(id)a3;
- (void)setAlarmOffset:(double)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setBaseModel:(id)a3;
- (void)setDeadlineSetter:(id)a3;
- (void)setDndMonitor:(id)a3;
- (void)setDndOffset:(double)a3;
- (void)setIsRarelyUsed:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setRarelyUsedMaxPredictionDuration:(double)a3;
- (void)setRarelyUsedTimeRestriction:(BOOL)a3;
- (void)setRarelyUsedTimeRestrictionEarlyHour:(int)a3;
- (void)setRarelyUsedTimeRestrictionLateHour:(int)a3;
- (void)setRequeryDelta:(int)a3;
- (void)setTrialClient:(id)a3;
- (void)setUseAlarm:(BOOL)a3;
- (void)setUseDND:(BOOL)a3;
- (void)updateTrialParameters;
@end

@implementation _OSInactivityPredictorSignalsAndModel

- (_OSInactivityPredictorSignalsAndModel)init
{
  id v3 = objc_alloc((Class)objc_opt_class());
  v4 = +[_OSInactivityPredictorTwoStage predictor];
  v5 = (_OSInactivityPredictorSignalsAndModel *)[v3 initWithPredictor:v4];

  return v5;
}

- (_OSInactivityPredictorSignalsAndModel)initWithPredictor:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)_OSInactivityPredictorSignalsAndModel;
  v6 = [(_OSInactivityPredictor *)&v26 init];
  if (v6)
  {
    v7 = objc_alloc_init(OSIDNDMonitor);
    dndMonitor = v6->_dndMonitor;
    v6->_dndMonitor = v7;

    v9 = objc_alloc_init(OSIAlarmMonitor);
    alarmMonitor = v6->_alarmMonitor;
    v6->_alarmMonitor = v9;

    objc_storeStrong((id *)&v6->_baseModel, a3);
    uint64_t v11 = +[TRIClient clientWithIdentifier:293];
    trialClient = v6->_trialClient;
    v6->_trialClient = (TRIClient *)v11;

    [(_OSInactivityPredictorSignalsAndModel *)v6 updateTrialParameters];
    objc_initWeak(&location, v6);
    v13 = v6->_trialClient;
    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472;
    v22 = sub_100011F98;
    v23 = &unk_1000648F0;
    objc_copyWeak(&v24, &location);
    id v14 = [(TRIClient *)v13 addUpdateHandlerForNamespaceName:@"COREOS_PREDICTION_INACTIVITY" usingBlock:&v20];
    uint64_t v15 = +[OSIntelligenceAnalyticsManager sharedInstanceWithTrialClient:v6->_trialClient, @"COREOS_PREDICTION_INACTIVITY", v20, v21, v22, v23 withNamespace];
    analyticsManager = v6->_analyticsManager;
    v6->_analyticsManager = (OSIntelligenceAnalyticsManager *)v15;

    os_log_t v17 = os_log_create("com.apple.osintelligence", "inactivity.model.signals");
    log = v6->_log;
    v6->_log = (OS_os_log *)v17;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)updateTrialParameters
{
  id v3 = [(TRIClient *)self->_trialClient levelForFactor:@"requeryDelta" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  self->_requeryDelta = [v3 longValue];

  v4 = [(TRIClient *)self->_trialClient levelForFactor:@"snapDND" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  self->_useDND = [v4 BOOLeanValue];

  id v5 = [(TRIClient *)self->_trialClient levelForFactor:@"snapAlarm" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  self->_useAlarm = [v5 BOOLeanValue];

  v6 = [(TRIClient *)self->_trialClient levelForFactor:@"alarmLeeway" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v6 doubleValue];
  self->_alarmLeeway = v7;

  v8 = [(TRIClient *)self->_trialClient levelForFactor:@"signalsAlarmOffset" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v8 doubleValue];
  self->_alarmOffset = v9;

  v10 = [(TRIClient *)self->_trialClient levelForFactor:@"signalsDNDOffset" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v10 doubleValue];
  self->_dndOffset = v11;

  v12 = [(TRIClient *)self->_trialClient levelForFactor:@"accelerateLookahead" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v12 doubleValue];
  self->_accelerateLookahead = v13;

  id v14 = [(TRIClient *)self->_trialClient levelForFactor:@"signalsUseTimeRestriction" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  self->_rarelyUsedTimeRestriction = [v14 BOOLeanValue];

  uint64_t v15 = [(TRIClient *)self->_trialClient levelForFactor:@"signalsTimeRestrictionEarlyHour" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  self->_rarelyUsedTimeRestrictionEarlyHour = [v15 longValue];

  v16 = [(TRIClient *)self->_trialClient levelForFactor:@"signalsTimeRestrictionLateHour" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  self->_rarelyUsedTimeRestrictionLateHour = [v16 longValue];

  id v18 = [(TRIClient *)self->_trialClient levelForFactor:@"signalsRarelyUsedMaxDuration" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v18 doubleValue];
  self->_rarelyUsedMaxPredictionDuration = v17;
}

+ (id)predictorWithPredictor:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)objc_opt_class()) initWithPredictor:v3];

  return v4;
}

- (id)predictorType
{
  v2 = [(_OSInactivityPredictor *)self->_baseModel predictorType];
  id v3 = +[NSString stringWithFormat:@"%@ (with heuristics)", v2];

  return v3;
}

- (id)queryingMechanism
{
  return [(_OSInactivityPredictor *)self->_baseModel queryingMechanism];
}

- (double)recommendedWaitTime
{
  [(_OSInactivityPredictor *)self->_baseModel recommendedWaitTime];
  return result;
}

- (double)longThreshold
{
  [(_OSInactivityPredictor *)self->_baseModel longThreshold];
  return result;
}

- (double)confidenceThresholdStrict
{
  [(_OSInactivityPredictor *)self->_baseModel confidenceThresholdStrict];
  return result;
}

- (double)confidenceThresholdRelaxed
{
  [(_OSInactivityPredictor *)self->_baseModel confidenceThresholdRelaxed];
  return result;
}

- (BOOL)requireEnoughHistory
{
  return [(_OSInactivityPredictor *)self->_baseModel requireEnoughHistory];
}

- (id)inferInputDateAndWaitTimeToQueryModelWithOptions:(int64_t)a3 withError:(id *)a4
{
  double v7 = +[_CDClientContext userContext];
  unsigned int v8 = +[OSIntelligenceUtilities isPluggedInWithContext:v7];

  double v9 = 0.0;
  if (v8)
  {
    [(_OSInactivityPredictor *)self waitedDuration];
    double v9 = v10;
    [(_OSInactivityPredictorSignalsAndModel *)self recommendedWaitTime];
    if (v9 >= v11) {
      double v9 = v11;
    }
  }
  v12 = +[NSDate dateWithTimeIntervalSinceNow:-v9];
  double v13 = [(_OSInactivityPredictorSignalsAndModel *)self longInactivityPredictionResultAtDate:v12 withTimeSinceInactive:a3 withOptions:a4 withError:v9];
  [v13 safeSubtractWaitTimeFromPredictedDuration:v9];

  return v13;
}

- (id)longInactivityPredictionResultWithOptions:(int64_t)a3 withError:(id *)a4
{
  if (a3 == 2)
  {
    unsigned int v8 = objc_alloc_init(_OSIInactivityEntrySignals);
    [(_OSInactivityPredictor *)self waitedDuration];
    double v10 = v9;
    double v11 = [(_OSInactivityPredictorSignalsAndModel *)self baseModel];
    v12 = [v11 predictorType];
    [(_OSIInactivityEntrySignals *)v8 checkSleepSignalsWithTimeSinceInactive:v12 andPredictorType:v10];

    id v13 = objc_alloc((Class)_OSInactivityPredictorOutput);
    if ([(_OSIInactivityEntrySignals *)v8 areSleepHeuristicsMet]) {
      uint64_t v14 = 2;
    }
    else {
      uint64_t v14 = 0;
    }
    double v15 = (double)[(_OSIInactivityEntrySignals *)v8 areSleepHeuristicsMet];
    if ([(_OSIInactivityEntrySignals *)v8 areSleepHeuristicsMet]) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = 4;
    }
    id v7 = [v13 initWithConfidenceLevel:v14 andConfidenceValue:v16 andPredictedDuration:v15 andReason:0.0];
  }
  else if (a3 == 1)
  {
    id v7 = [(_OSInactivityPredictorSignalsAndModel *)self sleepSuppresionPredictionResultWithError:a4];
  }
  else
  {
    self->_accelerateSuppression = 0;
    id v17 = objc_alloc((Class)_OSInactivityPredictorOutput);
    [(_OSInactivityPredictor *)self->_baseModel confidenceThresholdRelaxed];
    id v19 = [v17 initWithConfidenceLevel:0 andConfidenceValue:4 andPredictedDuration:v18 + -0.01 andReason:0.0];
    v20 = objc_alloc_init(_OSIInactivityEntrySignals);
    [(_OSInactivityPredictor *)self waitedDuration];
    if (-[_OSIInactivityEntrySignals checkInactivitySignalsWithTimeSinceInactive:](v20, "checkInactivitySignalsWithTimeSinceInactive:"))
    {
      id v7 = [(_OSInactivityPredictorSignalsAndModel *)self inferInputDateAndWaitTimeToQueryModelWithOptions:a3 withError:a4];

      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v44 = v7;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Model queried: %@", buf, 0xCu);
      }
    }
    else
    {
      id v7 = v19;
    }
    v42[0] = &off_100068D38;
    v41[0] = @"AmbientLightLevel";
    v41[1] = @"StationaryLevel";
    [(_OSIInactivityEntrySignals *)v20 pctStationary];
    v40 = +[NSNumber numberWithInt:(int)(v22 * 100.0)];
    v42[1] = v40;
    v41[2] = @"CurrentPlayback";
    v39 = +[NSNumber numberWithBool:[(_OSIInactivityEntrySignals *)v20 hasRecentPlaybackChange]];
    v42[2] = v39;
    v41[3] = @"DeadlineSetter";
    v38 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 outputReason]);
    v42[3] = v38;
    v41[4] = @"ModelType";
    v37 = [(_OSInactivityPredictor *)self->_baseModel predictorType];
    v23 = +[NSString stringWithFormat:@"cpn_%@", v37];
    v42[4] = v23;
    v41[5] = @"ModelConfidence";
    [v7 confidenceValue];
    v25 = +[NSNumber numberWithInt:(int)(v24 * 100.0)];
    v42[5] = v25;
    v41[6] = @"ModelConfidenceLevel";
    objc_super v26 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v7 confidenceLevel]);
    v42[6] = v26;
    v41[7] = @"PredictedDuration";
    [v7 predictedDuration];
    v27 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v42[7] = v27;
    v41[8] = @"TreatmentID";
    uint64_t v28 = [(TRIClient *)self->_trialClient treatmentIdWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    v29 = (void *)v28;
    if (v28) {
      CFStringRef v30 = (const __CFString *)v28;
    }
    else {
      CFStringRef v30 = &stru_100066558;
    }
    v42[8] = v30;
    v41[9] = @"RolloutID";
    uint64_t v31 = [(TRIClient *)self->_trialClient rolloutIdentifiersWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    v32 = (void *)v31;
    if (v31) {
      CFStringRef v33 = (const __CFString *)v31;
    }
    else {
      CFStringRef v33 = &stru_100066558;
    }
    v42[9] = v33;
    v34 = +[NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:10];

    v35 = self->_log;
    if (os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v34;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v35, OS_LOG_TYPE_DEFAULT, "Logging sleep suppression query event to PL: %@", buf, 0xCu);
    }
    PLLogRegisteredEvent();
  }

  return v7;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  id v10 = a3;
  double v11 = +[OSIntelligenceDefines inactivityUserDefaults];
  unsigned int v12 = [v11 BOOLForKey:@"heuristicsOnly"];
  v79 = v11;
  if (v12)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Using heuristics only.", buf, 2u);
    }
    id v14 = [objc_alloc((Class)_OSInactivityPredictorOutput) initWithConfidenceLevel:2 andConfidenceValue:1 andPredictedDuration:1.0 andReason:12.0];
  }
  else
  {
    id v15 = v10;
    if (a5 == 1 && self->_accelerateSuppression)
    {
      uint64_t v16 = +[NSDate dateWithTimeIntervalSinceNow:self->_accelerateLookahead];

      id v17 = self->_log;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        double accelerateLookahead = self->_accelerateLookahead;
        *(_DWORD *)buf = 134217984;
        int64_t v81 = *(void *)&accelerateLookahead;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_DEFAULT, "Advancing query date to %.2f seconds from now to accelerate sleep suppression", buf, 0xCu);
      }
      id v15 = (id)v16;
    }
    id v19 = self->_log;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      int64_t v81 = a5;
      __int16 v82 = 2112;
      id v83 = v15;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v19, OS_LOG_TYPE_DEFAULT, "(%ld) Querying model with input date: %@", buf, 0x16u);
    }
    id v14 = [(_OSInactivityPredictor *)self->_baseModel longInactivityPredictionResultAtDate:v15 withTimeSinceInactive:a5 withOptions:a6 withError:a4];
    self->_accelerateSuppression = 0;

    double v11 = v79;
  }
  if ([v14 confidenceLevel] != (id)2)
  {
    id v14 = v14;
    id v35 = v14;
    goto LABEL_62;
  }
  [v14 predictedDuration];
  uint64_t v21 = [v10 dateByAddingTimeInterval:v20 * 3600.0];
  v76 = +[NSDate now];
  uint64_t v22 = [v10 laterDate:];
  v23 = self->_log;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    double v24 = v23;
    [v14 predictedDuration];
    *(_DWORD *)buf = 134218498;
    int64_t v81 = v25;
    __int16 v82 = 2112;
    id v83 = v10;
    __int16 v84 = 2112;
    v85 = v21;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Raw model confidently predicted %.2f hours of inactivity from %@ until %@", buf, 0x20u);
  }
  if (self->_rarelyUsedTimeRestriction) {
    char v26 = v12;
  }
  else {
    char v26 = 1;
  }
  v77 = (void *)v22;
  if ((v26 & 1) != 0
    || !+[_OSInactivityPredictor isDeviceRarelyUsedRecently])
  {
    v78 = 0;
  }
  else
  {
    [(_OSInactivityPredictorSignalsAndModel *)self setIsRarelyUsed:1];
    v78 = +[NSCalendar currentCalendar];
    v27 = [v78 components:60 fromDate:v22];
    id v28 = [v27 hour];
    uint64_t v29 = (uint64_t)v28;
    uint64_t rarelyUsedTimeRestrictionEarlyHour = self->_rarelyUsedTimeRestrictionEarlyHour;
    if ((uint64_t)v28 < self->_rarelyUsedTimeRestrictionLateHour && (uint64_t)v28 >= rarelyUsedTimeRestrictionEarlyHour)
    {
      id v31 = objc_alloc((Class)_OSInactivityPredictorOutput);
      [(_OSInactivityPredictor *)self->_baseModel confidenceThresholdStrict];
      id v33 = [v31 initWithConfidenceLevel:1 andConfidenceValue:0 andPredictedDuration:v32 + -0.01 andReason:0.0];

      v34 = self->_log;
      if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v34, OS_LOG_TYPE_DEFAULT, "Restricting entry: Rarely-used device not in time range", buf, 2u);
      }
      id v14 = v33;
      id v35 = v14;
      goto LABEL_61;
    }
    [v27 setHour:self->_rarelyUsedTimeRestrictionEarlyHour];
    [v27 setMinute:0];
    [v27 setSecond:0];
    v60 = [v78 dateFromComponents:v27];
    v61 = v60;
    if (v29 > rarelyUsedTimeRestrictionEarlyHour)
    {
      uint64_t v62 = [v60 dateByAddingTimeInterval:86400.0];

      v61 = (void *)v62;
    }
    double rarelyUsedMaxPredictionDuration = self->_rarelyUsedMaxPredictionDuration;
    [v61 timeIntervalSinceDate:v77];
    if (rarelyUsedMaxPredictionDuration * 3600.0 < v64) {
      double v64 = rarelyUsedMaxPredictionDuration * 3600.0;
    }
    v65 = [v77 dateByAddingTimeInterval:v64];
    [v65 timeIntervalSinceDate:v21];
    if (v66 <= 0.0)
    {
      id v67 = v65;
      v65 = v21;
      uint64_t v21 = v67;
    }
    else
    {
      id v67 = 0;
    }

    v78 = v67;
    uint64_t v22 = (uint64_t)v77;
  }
  if (self->_useDND)
  {
    v36 = [(OSIDNDMonitor *)self->_dndMonitor scheduledDNDEndDate];
    v37 = v36;
    if (v36 && ([v36 timeIntervalSinceDate:v22], v38 > 0.0))
    {
      v27 = [v37 dateByAddingTimeInterval:-self->_dndOffset];
    }
    else
    {
      v27 = 0;
    }
  }
  else
  {
    v27 = 0;
  }
  alarmMonitor = self->_alarmMonitor;
  v40 = [v21 dateByAddingTimeInterval:self->_alarmLeeway];
  v41 = [(OSIAlarmMonitor *)alarmMonitor nextAlarmFireDateBetweenDate:v22 andDate:v40];

  v75 = v21;
  if (!self->_useAlarm || !v41)
  {

LABEL_42:
    if (v27)
    {
      v52 = self->_log;
      if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v81 = (int64_t)v27;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v52, OS_LOG_TYPE_DEFAULT, "Using DND date: %@", buf, 0xCu);
      }
      id v51 = v27;
      deadlineSetter = self->_deadlineSetter;
      self->_deadlineSetter = (NSString *)@"DND";

      analyticsManager = self->_analyticsManager;
      [v51 timeIntervalSinceReferenceDate];
      v47 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v51 timeIntervalSinceReferenceDate];
      v48 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(_OSInactivityPredictorSignalsAndModel *)self recommendedWaitTime];
      v55 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      -[OSIntelligenceAnalyticsManager saveNextAlarmInterval:nextDNDInterval:predictionInterval:recommendedWait:deadlineSetter:modelConfidenceLevel:withPredictor:](analyticsManager, "saveNextAlarmInterval:nextDNDInterval:predictionInterval:recommendedWait:deadlineSetter:modelConfidenceLevel:withPredictor:", 0, v47, v48, v55, self->_deadlineSetter, [v14 confidenceLevel], self);

      id v44 = 0;
      uint64_t v50 = 3;
    }
    else
    {
      v56 = self->_log;
      BOOL v57 = os_log_type_enabled((os_log_t)v56, OS_LOG_TYPE_DEFAULT);
      if (v78)
      {
        if (v57)
        {
          *(_DWORD *)buf = 138412290;
          int64_t v81 = (int64_t)v78;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v56, OS_LOG_TYPE_DEFAULT, "Using 'rarely-used' date: %@", buf, 0xCu);
        }
        id v51 = v78;
        v58 = self->_deadlineSetter;
        v59 = @"RarelyUsed";
      }
      else
      {
        if (v57)
        {
          *(_DWORD *)buf = 138412290;
          int64_t v81 = (int64_t)v21;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)v56, OS_LOG_TYPE_DEFAULT, "Using model output: %@", buf, 0xCu);
        }
        id v51 = v21;
        v58 = self->_deadlineSetter;
        v59 = @"Model";
      }
      self->_deadlineSetter = &v59->isa;

      v68 = self->_analyticsManager;
      [v51 timeIntervalSinceReferenceDate];
      v47 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [(_OSInactivityPredictorSignalsAndModel *)self recommendedWaitTime];
      v48 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      -[OSIntelligenceAnalyticsManager saveNextAlarmInterval:nextDNDInterval:predictionInterval:recommendedWait:deadlineSetter:modelConfidenceLevel:withPredictor:](v68, "saveNextAlarmInterval:nextDNDInterval:predictionInterval:recommendedWait:deadlineSetter:modelConfidenceLevel:withPredictor:", 0, 0, v47, v48, self->_deadlineSetter, [v14 confidenceLevel], self);
      id v44 = 0;
      uint64_t v50 = 1;
    }
    goto LABEL_60;
  }
  v42 = [v41 dateByAddingTimeInterval:-self->_alarmOffset];

  if (!v42) {
    goto LABEL_42;
  }
  v43 = self->_log;
  if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    int64_t v81 = (int64_t)v42;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v43, OS_LOG_TYPE_DEFAULT, "Using alarm date: %@", buf, 0xCu);
  }
  id v44 = v42;
  v45 = self->_deadlineSetter;
  self->_deadlineSetter = (NSString *)@"Alarm";

  v46 = self->_analyticsManager;
  [v44 timeIntervalSinceReferenceDate];
  v47 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v44 timeIntervalSinceReferenceDate];
  v48 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [(_OSInactivityPredictorSignalsAndModel *)self recommendedWaitTime];
  v49 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  -[OSIntelligenceAnalyticsManager saveNextAlarmInterval:nextDNDInterval:predictionInterval:recommendedWait:deadlineSetter:modelConfidenceLevel:withPredictor:](v46, "saveNextAlarmInterval:nextDNDInterval:predictionInterval:recommendedWait:deadlineSetter:modelConfidenceLevel:withPredictor:", v47, 0, v48, v49, self->_deadlineSetter, [v14 confidenceLevel], self);

  uint64_t v50 = 2;
  id v51 = v44;
LABEL_60:

  id v69 = objc_alloc((Class)_OSInactivityPredictorOutput);
  id v70 = [v14 confidenceLevel];
  [v14 confidenceValue];
  double v72 = v71;
  [v51 timeIntervalSinceDate:v10];
  id v35 = [v69 initWithConfidenceLevel:v70 andConfidenceValue:v50 andPredictedDuration:v72 andReason:v73 / 3600.0];

  double v11 = v79;
  uint64_t v21 = v75;
LABEL_61:

LABEL_62:

  return v35;
}

- (id)sleepSuppresionPredictionResultWithError:(id *)a3
{
  self->_accelerateSuppression = 0;
  id v5 = objc_alloc_init(_OSIInactivityEntrySignals);
  [(_OSInactivityPredictor *)self waitedDuration];
  double v7 = v6;
  unsigned int v8 = [(_OSInactivityPredictorSignalsAndModel *)self baseModel];
  double v9 = [v8 predictorType];
  [(_OSIInactivityEntrySignals *)v5 checkSleepSignalsWithTimeSinceInactive:v9 andPredictorType:v7];

  id v10 = objc_alloc((Class)_OSInactivityPredictorOutput);
  [(_OSInactivityPredictor *)self->_baseModel confidenceThresholdRelaxed];
  id v12 = [v10 initWithConfidenceLevel:0 andConfidenceValue:4 andPredictedDuration:v11 + -0.01 andReason:0.0];
  if ([(_OSIInactivityEntrySignals *)v5 areSleepHeuristicsMet])
  {
    [(_OSIInactivityEntrySignals *)v5 secondsSinceWait];
    if (v13 < (double)self->_requeryDelta)
    {
      int v14 = [(_OSIInactivityEntrySignals *)v5 lux];
      if (v14 < [(_OSIInactivityEntrySignals *)v5 immediateMaxDarkLuxThreshold])
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = log;
          [(_OSIInactivityEntrySignals *)v5 secondsSinceWait];
          int requeryDelta = self->_requeryDelta;
          *(_DWORD *)buf = 134218240;
          v58 = v18;
          __int16 v59 = 1024;
          int v60 = requeryDelta;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Accelerating queries because waited %.2f seconds (<%d) in the dark", buf, 0x12u);
        }
        self->_accelerateSuppression = 1;
      }
    }
    id v19 = [(_OSInactivityPredictorSignalsAndModel *)self inferInputDateAndWaitTimeToQueryModelWithOptions:1 withError:a3];

    double v20 = self->_log;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v19;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "Model queried for sleep suppression: %@", buf, 0xCu);
    }
  }
  else
  {
    id v19 = v12;
  }
  if (!self->_deadlineSetter)
  {
    self->_deadlineSetter = (NSString *)&stru_100066558;
  }
  v55[0] = @"modelConfidenceLevel";
  uint64_t v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v19 confidenceLevel]);
  v56[0] = v21;
  v55[1] = @"entryAmbientLightLevelBucketed";
  uint64_t v22 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", +[OSIntelligenceAnalyticsManager bucketLuxValue:[(_OSIInactivityEntrySignals *)v5 lux]]);
  v56[1] = v22;
  v55[2] = @"entryStationaryLevel";
  [(_OSIInactivityEntrySignals *)v5 pctStationary];
  double v24 = +[NSNumber numberWithDouble:round(v23 * 10.0)];
  v56[2] = v24;
  v55[3] = @"currentPlayback";
  int64_t v25 = +[NSNumber numberWithBool:[(_OSIInactivityEntrySignals *)v5 hasRecentPlaybackChange]];
  v56[3] = v25;
  v55[4] = @"deadlineSetter";
  [(_OSInactivityPredictorSignalsAndModel *)self deadlineSetter];
  v27 = char v26 = v5;
  v56[4] = v27;
  id v28 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:5];

  uint64_t v29 = self->_log;
  if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_DEBUG)) {
    sub_100041D74((uint64_t)v28, v29);
  }
  id v50 = v28;
  AnalyticsSendEventLazy();
  v53[0] = @"AmbientLightLevel";
  v49 = +[NSNumber numberWithInt:[(_OSIInactivityEntrySignals *)v26 lux]];
  v54[0] = v49;
  v53[1] = @"StationaryLevel";
  [(_OSIInactivityEntrySignals *)v26 pctStationary];
  v48 = +[NSNumber numberWithInt:(int)(v30 * 100.0)];
  v54[1] = v48;
  v53[2] = @"CurrentPlayback";
  v52 = v26;
  v47 = +[NSNumber numberWithBool:[(_OSIInactivityEntrySignals *)v26 hasRecentPlaybackChange]];
  v54[2] = v47;
  v53[3] = @"DeadlineSetter";
  id v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v19 outputReason]);
  v54[3] = v31;
  v53[4] = @"ModelType";
  double v32 = [(_OSInactivityPredictor *)self->_baseModel predictorType];
  v54[4] = v32;
  v53[5] = @"ModelConfidence";
  [v19 confidenceValue];
  v34 = +[NSNumber numberWithInt:(int)(v33 * 100.0)];
  v54[5] = v34;
  v53[6] = @"ModelConfidenceLevel";
  id v35 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v19 confidenceLevel]);
  v54[6] = v35;
  v53[7] = @"PredictedDuration";
  id v51 = v19;
  [v19 predictedDuration];
  v36 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v54[7] = v36;
  v53[8] = @"TreatmentID";
  uint64_t v37 = [(TRIClient *)self->_trialClient treatmentIdWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  double v38 = (void *)v37;
  if (v37) {
    CFStringRef v39 = (const __CFString *)v37;
  }
  else {
    CFStringRef v39 = &stru_100066558;
  }
  v54[8] = v39;
  v53[9] = @"RolloutID";
  uint64_t v40 = [(TRIClient *)self->_trialClient rolloutIdentifiersWithNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  v41 = (void *)v40;
  if (v40) {
    CFStringRef v42 = (const __CFString *)v40;
  }
  else {
    CFStringRef v42 = &stru_100066558;
  }
  v54[9] = v42;
  v43 = +[NSDictionary dictionaryWithObjects:v54 forKeys:v53 count:10];

  id v44 = self->_log;
  if (os_log_type_enabled((os_log_t)v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v58 = v43;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v44, OS_LOG_TYPE_DEFAULT, "Logging sleep suppression query event to PL: %@", buf, 0xCu);
  }
  PLLogRegisteredEvent();
  id v45 = v51;

  return v45;
}

- (OSIAlarmMonitor)alarmMonitor
{
  return self->_alarmMonitor;
}

- (void)setAlarmMonitor:(id)a3
{
}

- (OSIDNDMonitor)dndMonitor
{
  return self->_dndMonitor;
}

- (void)setDndMonitor:(id)a3
{
}

- (_OSInactivityPredictor)baseModel
{
  return self->_baseModel;
}

- (void)setBaseModel:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (NSString)deadlineSetter
{
  return self->_deadlineSetter;
}

- (void)setDeadlineSetter:(id)a3
{
}

- (int)requeryDelta
{
  return self->_requeryDelta;
}

- (void)setRequeryDelta:(int)a3
{
  self->_int requeryDelta = a3;
}

- (BOOL)useDND
{
  return self->_useDND;
}

- (void)setUseDND:(BOOL)a3
{
  self->_useDND = a3;
}

- (BOOL)useAlarm
{
  return self->_useAlarm;
}

- (void)setUseAlarm:(BOOL)a3
{
  self->_useAlarm = a3;
}

- (double)alarmLeeway
{
  return self->_alarmLeeway;
}

- (void)setAlarmLeeway:(double)a3
{
  self->_alarmLeeway = a3;
}

- (double)alarmOffset
{
  return self->_alarmOffset;
}

- (void)setAlarmOffset:(double)a3
{
  self->_alarmOffset = a3;
}

- (double)dndOffset
{
  return self->_dndOffset;
}

- (void)setDndOffset:(double)a3
{
  self->_dndOffset = a3;
}

- (double)accelerateLookahead
{
  return self->_accelerateLookahead;
}

- (void)setAccelerateLookahead:(double)a3
{
  self->_double accelerateLookahead = a3;
}

- (BOOL)isRarelyUsed
{
  return self->_isRarelyUsed;
}

- (void)setIsRarelyUsed:(BOOL)a3
{
  self->_isRarelyUsed = a3;
}

- (BOOL)rarelyUsedTimeRestriction
{
  return self->_rarelyUsedTimeRestriction;
}

- (void)setRarelyUsedTimeRestriction:(BOOL)a3
{
  self->_rarelyUsedTimeRestriction = a3;
}

- (int)rarelyUsedTimeRestrictionEarlyHour
{
  return self->_rarelyUsedTimeRestrictionEarlyHour;
}

- (void)setRarelyUsedTimeRestrictionEarlyHour:(int)a3
{
  self->_uint64_t rarelyUsedTimeRestrictionEarlyHour = a3;
}

- (int)rarelyUsedTimeRestrictionLateHour
{
  return self->_rarelyUsedTimeRestrictionLateHour;
}

- (void)setRarelyUsedTimeRestrictionLateHour:(int)a3
{
  self->_rarelyUsedTimeRestrictionLateHour = a3;
}

- (double)rarelyUsedMaxPredictionDuration
{
  return self->_rarelyUsedMaxPredictionDuration;
}

- (void)setRarelyUsedMaxPredictionDuration:(double)a3
{
  self->_double rarelyUsedMaxPredictionDuration = a3;
}

- (BOOL)accelerateSuppression
{
  return self->_accelerateSuppression;
}

- (void)setAccelerateSuppression:(BOOL)a3
{
  self->_accelerateSuppression = a3;
}

- (OSIntelligenceAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_deadlineSetter, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
  objc_storeStrong((id *)&self->_dndMonitor, 0);

  objc_storeStrong((id *)&self->_alarmMonitor, 0);
}

@end