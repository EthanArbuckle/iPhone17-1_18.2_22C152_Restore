@interface _OSInactivityPredictorBackupBasedModel
+ (id)predictor;
- (BOOL)showsSignificantInactivity:(id)a3;
- (NSDictionary)hourToEntry;
- (OS_os_log)log;
- (TRIClient)trialClient;
- (_OSInactivityPredictorBackupBasedModel)init;
- (double)averageDurationMultiplier;
- (double)computeInactivityHoursFromBackupForDate:(id)a3;
- (double)maxPredictionDurationHours;
- (double)pctLongThreshold;
- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6;
- (int)numLongThreshold;
- (void)setAverageDurationMultiplier:(double)a3;
- (void)setHourToEntry:(id)a3;
- (void)setLog:(id)a3;
- (void)setMaxPredictionDurationHours:(double)a3;
- (void)setNumLongThreshold:(int)a3;
- (void)setPctLongThreshold:(double)a3;
- (void)setTrialClient:(id)a3;
- (void)updateTrialParameters;
@end

@implementation _OSInactivityPredictorBackupBasedModel

- (_OSInactivityPredictorBackupBasedModel)init
{
  v19.receiver = self;
  v19.super_class = (Class)_OSInactivityPredictorBackupBasedModel;
  v2 = [(_OSInactivityPredictor *)&v19 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.osintelligence", "inactivity.model.backup");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    [(_OSInactivityPredictor *)v2 setPredictorType:@"backup"];
    [(_OSInactivityPredictor *)v2 setQueryingMechanism:@"anytime"];
    uint64_t v5 = +[TRIClient clientWithIdentifier:293];
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v5;

    [(_OSInactivityPredictorBackupBasedModel *)v2 updateTrialParameters];
    objc_initWeak(&location, v2);
    v7 = v2->_trialClient;
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_10002C594;
    v16 = &unk_1000648F0;
    objc_copyWeak(&v17, &location);
    id v8 = [(TRIClient *)v7 addUpdateHandlerForNamespaceName:@"COREOS_PREDICTION_INACTIVITY" usingBlock:&v13];
    -[_OSInactivityPredictor setLongThreshold:](v2, "setLongThreshold:", 10800.0, v13, v14, v15, v16);
    [(_OSInactivityPredictor *)v2 setConfidenceThresholdStrict:0.9];
    [(_OSInactivityPredictor *)v2 setConfidenceThresholdRelaxed:0.4];
    [(_OSInactivityPredictor *)v2 setRequireEnoughHistory:0];
    v9 = objc_alloc_init(_OSInactivityPredictionBackupManager);
    uint64_t v10 = [(_OSInactivityPredictionBackupManager *)v9 hydrateBackup];
    hourToEntry = v2->_hourToEntry;
    v2->_hourToEntry = (NSDictionary *)v10;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  return v2;
}

+ (id)predictor
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (void)updateTrialParameters
{
  os_log_t v3 = [(TRIClient *)self->_trialClient levelForFactor:@"backupRecommendedWaitTime" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v3 doubleValue];
  -[_OSInactivityPredictor setRecommendedWaitTime:](self, "setRecommendedWaitTime:");

  v4 = [(TRIClient *)self->_trialClient levelForFactor:@"backupAverageDurationMultiplier" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v4 doubleValue];
  self->_averageDurationMultiplier = v5;

  v6 = [(TRIClient *)self->_trialClient levelForFactor:@"backupPCTLongThreshold" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v6 doubleValue];
  self->_pctLongThreshold = (double)(int)v7;

  id v8 = [(TRIClient *)self->_trialClient levelForFactor:@"backupNumLongThreshold" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  self->_numLongThreshold = [v8 longValue];

  id v10 = [(TRIClient *)self->_trialClient levelForFactor:@"backupMaxDurationHours" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v10 doubleValue];
  self->_maxPredictionDurationHours = v9;
}

- (BOOL)showsSignificantInactivity:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 pctLong];
    double v6 = v5;

    if (v6 > self->_pctLongThreshold) {
      return 1;
    }
  }
  else
  {
    [v4 count];
  }
  return 0;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  -[_OSInactivityPredictorBackupBasedModel computeInactivityHoursFromBackupForDate:](self, "computeInactivityHoursFromBackupForDate:", a3, a5, a6, a4);
  if (v7 >= self->_maxPredictionDurationHours) {
    double maxPredictionDurationHours = self->_maxPredictionDurationHours;
  }
  else {
    double maxPredictionDurationHours = v7;
  }
  id v9 = objc_alloc((Class)_OSInactivityPredictorOutput);
  id v10 = v9;
  if (maxPredictionDurationHours <= 0.0)
  {
    double v14 = kInvalidPredictedDuration;
    double v12 = 0.0;
    uint64_t v13 = 0;
    uint64_t v15 = 0;
  }
  else
  {
    [(_OSInactivityPredictor *)self confidenceThresholdStrict];
    double v12 = v11 + 0.01;
    id v9 = v10;
    uint64_t v13 = 2;
    double v14 = maxPredictionDurationHours;
    uint64_t v15 = 1;
  }
  id v16 = [v9 initWithConfidenceLevel:v13 andConfidenceValue:v15 andPredictedDuration:v12 andReason:v14];

  return v16;
}

- (double)computeInactivityHoursFromBackupForDate:(id)a3
{
  id v4 = a3;
  if ([(NSDictionary *)self->_hourToEntry count])
  {
    double v5 = +[NSCalendar currentCalendar];
    double v6 = [v5 components:60 fromDate:v4];
    double v7 = [v5 dateFromComponents:v6];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v34 = 0x2020000000;
    uint64_t v35 = 0;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    int v29 = 0;
    id v8 = self->_log;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG)) {
      sub_100043910(v32, (uint64_t)[v6 hour], (os_log_t)v8);
    }

    hourToEntry = self->_hourToEntry;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10002CBD0;
    v20[3] = &unk_1000651A0;
    v20[4] = self;
    id v10 = v6;
    id v21 = v10;
    id v11 = v5;
    id v22 = v11;
    id v12 = v7;
    id v23 = v12;
    p_long long buf = &buf;
    v25 = &v26;
    [(NSDictionary *)hourToEntry enumerateKeysAndObjectsUsingBlock:v20];
    int v13 = *((_DWORD *)v27 + 6);
    if (v13)
    {
      double v14 = *(double *)(*((void *)&buf + 1) + 24) / (double)v13 * self->_averageDurationMultiplier;
    }
    else
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR))
      {
        double v19 = kInvalidPredictedDuration;
        *(_DWORD *)v30 = 134217984;
        uint64_t v31 = kInvalidPredictedDuration;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_ERROR, "No backup entry was summed up; predicting %.1fh duration",
          v30,
          0xCu);
        double v14 = v19;
      }
      else
      {
        double v14 = kInvalidPredictedDuration;
      }
    }

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    uint64_t v15 = self->_log;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      double v18 = kInvalidPredictedDuration;
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = kInvalidPredictedDuration;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v15, OS_LOG_TYPE_ERROR, "No backup entry found at all; predicting %.1fh duration",
        (uint8_t *)&buf,
        0xCu);
      double v14 = v18;
    }
    else
    {
      double v14 = kInvalidPredictedDuration;
    }
  }

  return v14;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSDictionary)hourToEntry
{
  return self->_hourToEntry;
}

- (void)setHourToEntry:(id)a3
{
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (double)maxPredictionDurationHours
{
  return self->_maxPredictionDurationHours;
}

- (void)setMaxPredictionDurationHours:(double)a3
{
  self->_double maxPredictionDurationHours = a3;
}

- (double)averageDurationMultiplier
{
  return self->_averageDurationMultiplier;
}

- (void)setAverageDurationMultiplier:(double)a3
{
  self->_averageDurationMultiplier = a3;
}

- (double)pctLongThreshold
{
  return self->_pctLongThreshold;
}

- (void)setPctLongThreshold:(double)a3
{
  self->_pctLongThreshold = a3;
}

- (int)numLongThreshold
{
  return self->_numLongThreshold;
}

- (void)setNumLongThreshold:(int)a3
{
  self->_numLongThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_hourToEntry, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end