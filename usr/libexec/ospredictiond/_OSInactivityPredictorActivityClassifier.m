@interface _OSInactivityPredictorActivityClassifier
+ (id)predictor;
- (MLModel)classifier;
- (OS_os_log)log;
- (TRIClient)trialClient;
- (_OSInactivityPredictorActivityClassifier)init;
- (double)chunkEngageDuration;
- (double)cooldownDuration;
- (double)determineTimeSinceInactiveWithInputDate:(id)a3 andInputTimeSinceInactive:(double)a4;
- (double)extrapolatedWaitdDurationsAtDate:(id)a3;
- (double)requeryInterval;
- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6;
- (id)longInactivityPredictionResultWithOptions:(int64_t)a3 withError:(id *)a4;
- (unint64_t)maxChunksPerSession;
- (void)loadTrialFactors;
- (void)setChunkEngageDuration:(double)a3;
- (void)setClassifier:(id)a3;
- (void)setCooldownDuration:(double)a3;
- (void)setLog:(id)a3;
- (void)setMaxChunksPerSession:(unint64_t)a3;
- (void)setRequeryInterval:(double)a3;
- (void)setTrialClient:(id)a3;
@end

@implementation _OSInactivityPredictorActivityClassifier

+ (id)predictor
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (_OSInactivityPredictorActivityClassifier)init
{
  v14.receiver = self;
  v14.super_class = (Class)_OSInactivityPredictorActivityClassifier;
  id v2 = [(_OSInactivityPredictor *)&v14 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.osintelligence", "inactivity.activityClassifier");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    [(_OSInactivityPredictor *)v2 setPredictorType:@"XGBClassifier_v1"];
    [(_OSInactivityPredictor *)v2 setQueryingMechanism:@"inchworm"];
    [(_OSInactivityPredictor *)v2 setRequireEnoughHistory:1];
    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100041210(v5);
    }
    uint64_t v6 = +[TRIClient clientWithIdentifier:293];
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v6;

    [(_OSInactivityPredictorActivityClassifier *)v2 loadTrialFactors];
    objc_initWeak(&location, v2);
    v8 = v2->_trialClient;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000964C;
    v11[3] = &unk_1000648F0;
    objc_copyWeak(&v12, &location);
    id v9 = [(TRIClient *)v8 addUpdateHandlerForNamespaceName:@"COREOS_PREDICTION_INACTIVITY" usingBlock:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void)loadTrialFactors
{
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_10004134C((os_log_t)log);
  }
  v4 = [(TRIClient *)self->_trialClient levelForFactor:@"macInactivityClassifier" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  v5 = [v4 directoryValue];
  uint64_t v6 = [v5 path];

  v7 = self->_log;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000412D4((uint64_t)v6, v7);
  }
  v8 = +[OSIntelligenceUtilities loadCompiledModelFromPath:v6];
  [(_OSInactivityPredictorActivityClassifier *)self setClassifier:v8];

  [(_OSInactivityPredictor *)self setModelVersion:@"y9eiznriuc"];
  id v9 = self->_log;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG)) {
    sub_100041290((os_log_t)v9);
  }
  trialClient = self->_trialClient;
  if (trialClient)
  {
    v11 = [(TRIClient *)trialClient levelForFactor:@"macRecommendedWaitTime" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    [v11 doubleValue];
    -[_OSInactivityPredictor setRecommendedWaitTime:](self, "setRecommendedWaitTime:");
  }
  else
  {
    [(_OSInactivityPredictor *)self setRecommendedWaitTime:7200.0];
  }
  id v12 = self->_trialClient;
  if (v12)
  {
    v13 = [(TRIClient *)v12 levelForFactor:@"macChunkEngageDuration" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    [v13 doubleValue];
    -[_OSInactivityPredictor setLongThreshold:](self, "setLongThreshold:");
  }
  else
  {
    [(_OSInactivityPredictor *)self setLongThreshold:14400.0];
  }
  objc_super v14 = self->_trialClient;
  if (v14)
  {
    v15 = [(TRIClient *)v14 levelForFactor:@"macChunkEngageDuration" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    [v15 doubleValue];
    -[_OSInactivityPredictorActivityClassifier setChunkEngageDuration:](self, "setChunkEngageDuration:");
  }
  else
  {
    [(_OSInactivityPredictorActivityClassifier *)self setChunkEngageDuration:14400.0];
  }
  v16 = self->_trialClient;
  if (v16)
  {
    v17 = [(TRIClient *)v16 levelForFactor:@"macConfidenceThreshold" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    [v17 doubleValue];
    -[_OSInactivityPredictor setConfidenceThresholdStrict:](self, "setConfidenceThresholdStrict:");
  }
  else
  {
    [(_OSInactivityPredictor *)self setConfidenceThresholdStrict:0.95];
  }
  [(_OSInactivityPredictor *)self setConfidenceThresholdRelaxed:0.5];
  [(_OSInactivityPredictor *)self confidenceThresholdStrict];
  double v19 = v18;
  [(_OSInactivityPredictor *)self confidenceThresholdRelaxed];
  if (v19 <= v20) {
    [(_OSInactivityPredictor *)self setConfidenceThresholdStrict:0.95];
  }
  v21 = self->_trialClient;
  if (v21)
  {
    v22 = [(TRIClient *)v21 levelForFactor:@"macMaxChunksPerSession" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    -[_OSInactivityPredictorActivityClassifier setMaxChunksPerSession:](self, "setMaxChunksPerSession:", [v22 longValue]);
  }
  else
  {
    [(_OSInactivityPredictorActivityClassifier *)self setMaxChunksPerSession:3];
  }
  v23 = self->_trialClient;
  if (v23)
  {
    v24 = [(TRIClient *)v23 levelForFactor:@"macRequeryInterval" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    [v24 doubleValue];
    -[_OSInactivityPredictorActivityClassifier setRequeryInterval:](self, "setRequeryInterval:");
  }
  else
  {
    [(_OSInactivityPredictorActivityClassifier *)self setRequeryInterval:7200.0];
  }
  v25 = self->_trialClient;
  if (v25)
  {
    v26 = [(TRIClient *)v25 levelForFactor:@"macCooldownDuration" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    [v26 doubleValue];
    -[_OSInactivityPredictorActivityClassifier setCooldownDuration:](self, "setCooldownDuration:");
  }
  else
  {
    [(_OSInactivityPredictorActivityClassifier *)self setCooldownDuration:7200.0];
  }
}

- (id)longInactivityPredictionResultWithOptions:(int64_t)a3 withError:(id *)a4
{
  v7 = +[NSDate now];
  [(_OSInactivityPredictor *)self waitedDuration];
  if (self->_maxChunksPerSession)
  {
    double v9 = v8;
    unint64_t v10 = 0;
    id v11 = 0;
    id v12 = v7;
    while (1)
    {
      v13 = [(_OSInactivityPredictorActivityClassifier *)self longInactivityPredictionResultAtDate:v12 withTimeSinceInactive:a3 withOptions:a4 withError:v9];
      objc_super v14 = v13;
      if (!v11)
      {
        id v11 = v13;
        [v11 setPredictedDuration:0.0];
      }
      if ((uint64_t)[v14 confidenceLevel] <= 1) {
        break;
      }
      [v14 predictedDuration];
      double v16 = v15;
      [v11 predictedDuration];
      [v11 setPredictedDuration:v16 + v17];
      [v14 predictedDuration];
      double v19 = v18 * 3600.0;
      v7 = [v12 dateByAddingTimeInterval:v18 * 3600.0];

      double v9 = v9 + v19;
      ++v10;
      id v12 = v7;
      if (v10 >= self->_maxChunksPerSession) {
        goto LABEL_10;
      }
    }

    v7 = v12;
  }
  else
  {
    id v11 = 0;
  }
LABEL_10:

  return v11;
}

- (double)extrapolatedWaitdDurationsAtDate:(id)a3
{
  id v3 = a3;
  v4 = +[_OSActivityHistory sharedInstance];
  v5 = [v4 historicalSecondsSinceInactiveAtDate:v3 whichStrata:3];
  uint64_t v6 = [v4 historicalSecondsSinceInactiveAtDate:v3 whichStrata:1];
  v7 = [v4 historicalSecondsSinceInactiveAtDate:v3 whichStrata:2];

  +[OSIntelligenceUtilities medianOf:v5];
  double v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  +[OSIntelligenceUtilities medianOf:v6];
  double v9 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  +[OSIntelligenceUtilities medianOf:v7];
  unint64_t v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  v15[0] = v8;
  v15[1] = v9;
  v15[2] = v10;
  id v11 = +[NSArray arrayWithObjects:v15 count:3];
  +[OSIntelligenceUtilities medianOf:v11];
  double v13 = v12;

  return v13;
}

- (double)determineTimeSinceInactiveWithInputDate:(id)a3 andInputTimeSinceInactive:(double)a4
{
  id v6 = a3;
  double v7 = *(double *)&v6;
  if (a4 >= 0.0)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 134217984;
      double v19 = a4 / 60.0;
      id v11 = "Input timeSinceInactive is explicitly set to %.2f min";
      double v13 = log;
      uint32_t v14 = 12;
LABEL_15:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, v14);
    }
  }
  else
  {
    if (!v6)
    {
      double v7 = +[NSDate now];
    }
    [*(id *)&v7 timeIntervalSinceNow];
    if (v8 <= 900.0)
    {
      if (v8 >= -900.0)
      {
        [(_OSInactivityPredictor *)self waitedDuration];
        a4 = v16;
        unint64_t v10 = self->_log;
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412546;
          double v19 = v7;
          __int16 v20 = 2048;
          double v21 = a4 / 60.0;
          id v11 = "Querying near now at %@. Real-time timeSinceInactive = %.2f min";
          goto LABEL_14;
        }
      }
      else
      {
        +[OSIntelligenceUtilities secondsSinceBecomingInactiveAtDate:*(void *)&v7];
        a4 = v15;
        unint64_t v10 = self->_log;
        if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 138412546;
          double v19 = v7;
          __int16 v20 = 2048;
          double v21 = a4 / 60.0;
          id v11 = "Querying into the past at %@. Historical timeSinceInactive = %.2f min";
          goto LABEL_14;
        }
      }
    }
    else
    {
      [(_OSInactivityPredictorActivityClassifier *)self extrapolatedWaitdDurationsAtDate:*(void *)&v7];
      a4 = v9;
      unint64_t v10 = self->_log;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412546;
        double v19 = v7;
        __int16 v20 = 2048;
        double v21 = a4 / 60.0;
        id v11 = "Querying into the future at %@. Extrapolated timeSinceInactive = %.2f min";
LABEL_14:
        double v13 = v10;
        uint32_t v14 = 22;
        goto LABEL_15;
      }
    }
  }

  return a4;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  id v9 = a3;
  unint64_t v10 = (void *)os_transaction_create();
  if (!self->_classifier)
  {
    *a6 = +[NSError errorWithDomain:@"com.apple.OSIntelligence.InactivityPredictorActivityClassifier" code:404 userInfo:&off_100069860];
    id v19 = [objc_alloc((Class)_OSInactivityPredictorOutput) initInvalidOutput];
LABEL_7:
    id v20 = v19;
    goto LABEL_13;
  }
  [v9 timeIntervalSinceNow];
  if (v11 > 43260.0)
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Querying way too far into the future. Returning medium confidence by default.", buf, 2u);
    }
    id v13 = objc_alloc((Class)_OSInactivityPredictorOutput);
    [(_OSInactivityPredictor *)self confidenceThresholdRelaxed];
    double v15 = v14 + 0.01;
    [(_OSInactivityPredictor *)self confidenceThresholdRelaxed];
    double v17 = v16;
    [(_OSInactivityPredictor *)self confidenceThresholdStrict];
    id v19 = [v13 initWithConfidenceValue:1 andRelaxedThreshold:v15 andStrictThreshold:v17 andPredictedDuration:v18 andReason:2.0];
    goto LABEL_7;
  }
  [(_OSInactivityPredictorActivityClassifier *)self determineTimeSinceInactiveWithInputDate:v9 andInputTimeSinceInactive:a4];
  double v22 = v21;
  v23 = [(MLModel *)self->_classifier modelDescription];
  v24 = [v23 inputDescriptionsByName];
  v25 = [v24 allKeys];

  v26 = +[_OSActivityHistory sharedInstance];
  CFStringRef v52 = @"time_since_inactive";
  v27 = +[NSNumber numberWithDouble:v22 / 3600.0];
  v53 = v27;
  v28 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  v29 = +[_OSInactivityFeatureFactory inputFeaturesWithNames:v25 atDate:v9 withIntervalHistory:v26 withContext:v28];

  v30 = self->_log;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v31 = v30;
    v32 = [v29 dictionary];
    [v32 description];
    v49 = v29;
    v33 = v10;
    v34 = v26;
    v36 = v35 = v25;
    *(_DWORD *)buf = 138412290;
    v51 = v36;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Features: %@", buf, 0xCu);

    v25 = v35;
    v26 = v34;
    unint64_t v10 = v33;
    v29 = v49;
  }
  v37 = [(MLModel *)self->_classifier predictionFromFeatures:v29 error:a6];
  v38 = [v37 featureValueForName:@"classProbability"];
  v39 = [v38 dictionaryValue];

  v40 = [v39 objectForKeyedSubscript:&off_100068D20];
  [v40 doubleValue];
  double v42 = v41;

  double v43 = v42 * self->_chunkEngageDuration / 3600.0;
  id v44 = objc_alloc((Class)_OSInactivityPredictorOutput);
  [(_OSInactivityPredictor *)self confidenceThresholdRelaxed];
  double v46 = v45;
  [(_OSInactivityPredictor *)self confidenceThresholdStrict];
  id v20 = [v44 initWithConfidenceValue:1 andRelaxedThreshold:v42 andStrictThreshold:v46 andPredictedDuration:v47 andReason:v43];
  if (![v20 confidenceLevel]) {
    [v20 setPredictedDuration:0.0];
  }

LABEL_13:

  return v20;
}

- (MLModel)classifier
{
  return self->_classifier;
}

- (void)setClassifier:(id)a3
{
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (double)requeryInterval
{
  return self->_requeryInterval;
}

- (void)setRequeryInterval:(double)a3
{
  self->_requeryInterval = a3;
}

- (double)chunkEngageDuration
{
  return self->_chunkEngageDuration;
}

- (void)setChunkEngageDuration:(double)a3
{
  self->_chunkEngageDuration = a3;
}

- (double)cooldownDuration
{
  return self->_cooldownDuration;
}

- (void)setCooldownDuration:(double)a3
{
  self->_cooldownDuration = a3;
}

- (unint64_t)maxChunksPerSession
{
  return self->_maxChunksPerSession;
}

- (void)setMaxChunksPerSession:(unint64_t)a3
{
  self->_maxChunksPerSession = a3;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);

  objc_storeStrong((id *)&self->_classifier, 0);
}

@end