@interface _OSInactivityPredictorTwoStage
+ (id)alternatePredictor;
+ (id)evaluator;
+ (id)predictor;
- (MLModel)durationModel;
- (MLModel)engageModel;
- (NSDate)lastInputDate;
- (NSDate)lastPredictedDate;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (TRIClient)trialClient;
- (_OSInactivityPredictorOutput)predictionOutput;
- (_OSInactivityPredictorTwoStage)init;
- (_OSInactivityPredictorTwoStage)initWithAlternateModel:(BOOL)a3 inEvaluationMode:(BOOL)a4;
- (double)multiplicativeLeewayRelaxed;
- (double)multiplicativeLeewayStrict;
- (id)longInactivityPredictionResultAtDate:(id)a3 withLockHistory:(id)a4 withOptions:(int64_t)a5 withError:(id *)a6;
- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6;
- (void)setLastInputDate:(id)a3;
- (void)setLastPredictedDate:(id)a3;
- (void)setLog:(id)a3;
- (void)setMultiplicativeLeewayRelaxed:(double)a3;
- (void)setMultiplicativeLeewayStrict:(double)a3;
- (void)setPredictionOutput:(id)a3;
- (void)setQueue:(id)a3;
- (void)updateTrialParameters:(BOOL)a3;
@end

@implementation _OSInactivityPredictorTwoStage

- (_OSInactivityPredictorTwoStage)init
{
  return [(_OSInactivityPredictorTwoStage *)self initWithAlternateModel:0 inEvaluationMode:0];
}

- (_OSInactivityPredictorTwoStage)initWithAlternateModel:(BOOL)a3 inEvaluationMode:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)_OSInactivityPredictorTwoStage;
  v6 = [(_OSInactivityPredictor *)&v33 init];
  if (v6)
  {
    if (v4) {
      v7 = "inactivity.twoStageEvaluator";
    }
    else {
      v7 = "inactivity.twoStagePredictor";
    }
    os_log_t v8 = os_log_create("com.apple.osintelligence", v7);
    log = v6->_log;
    v6->_log = (OS_os_log *)v8;

    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.osintelligence.queue", v10);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v11;

    uint64_t v13 = +[NSDate distantPast];
    lastInputDate = v6->_lastInputDate;
    v6->_lastInputDate = (NSDate *)v13;

    v15 = v6->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_100041F20(v5, v15, v16, v17, v18, v19, v20, v21);
    }
    if (v5) {
      CFStringRef v22 = @"twoStageXGB_v3_alt";
    }
    else {
      CFStringRef v22 = @"twoStageXGB_v3";
    }
    [(_OSInactivityPredictor *)v6 setPredictorType:v22];
    [(_OSInactivityPredictor *)v6 setQueryingMechanism:@"single"];
    [(_OSInactivityPredictor *)v6 setRequireEnoughHistory:1];
    v23 = v6->_log;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      sub_100041210(v23);
    }
    uint64_t v24 = +[TRIClient clientWithIdentifier:293];
    trialClient = v6->_trialClient;
    v6->_trialClient = (TRIClient *)v24;

    [(_OSInactivityPredictorTwoStage *)v6 updateTrialParameters:v5];
    objc_initWeak(&location, v6);
    v26 = v6->_trialClient;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100015C30;
    v29[3] = &unk_100064C38;
    objc_copyWeak(&v30, &location);
    BOOL v31 = v5;
    id v27 = [(TRIClient *)v26 addUpdateHandlerForNamespaceName:@"COREOS_PREDICTION_INACTIVITY" usingBlock:v29];
    [(_OSInactivityPredictor *)v6 setConfidenceThresholdRelaxed:0.5];
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }
  return v6;
}

- (void)updateTrialParameters:(BOOL)a3
{
  BOOL v3 = a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
    sub_100042060(log, v6, v7, v8, v9, v10, v11, v12);
  }
  BOOL v57 = v3;
  if (v3) {
    CFStringRef v13 = @"alternateInactivityEngageModel";
  }
  else {
    CFStringRef v13 = @"defaultInactivityEngageModel";
  }
  v14 = [(TRIClient *)self->_trialClient levelForFactor:v13 withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  v15 = [v14 directoryValue];
  uint64_t v16 = [v15 path];

  uint64_t v17 = [(TRIClient *)self->_trialClient levelForFactor:@"inactivityDurationModel" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  uint64_t v18 = [v17 directoryValue];
  uint64_t v19 = [v18 path];

  uint64_t v20 = self->_log;
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "Loading compiled models", buf, 2u);
  }
  uint64_t v21 = +[OSIntelligenceUtilities loadCompiledModelFromPath:v16];
  engageModel = self->_engageModel;
  self->_engageModel = v21;

  v23 = +[OSIntelligenceUtilities loadCompiledModelFromPath:v19];
  durationModel = self->_durationModel;
  self->_durationModel = v23;

  v25 = self->_log;
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEBUG)) {
    sub_10004201C((os_log_t)v25);
  }
  v26 = [(MLModel *)self->_engageModel modelDescription];
  id v27 = [v26 metadata];
  v28 = [v27 objectForKeyedSubscript:MLModelCreatorDefinedKey];
  v29 = [v28 objectForKeyedSubscript:@"recommended_wait_time"];
  [v29 doubleValue];
  double v31 = v30;

  [(_OSInactivityPredictor *)self setRecommendedWaitTime:fmax(v31, 1800.0)];
  v32 = [(MLModel *)self->_engageModel modelDescription];
  objc_super v33 = [v32 metadata];
  v34 = [v33 objectForKeyedSubscript:MLModelCreatorDefinedKey];
  v35 = [v34 objectForKeyedSubscript:@"long_threshold"];
  [v35 doubleValue];
  -[_OSInactivityPredictor setLongThreshold:](self, "setLongThreshold:");

  v36 = [(MLModel *)self->_engageModel modelDescription];
  v37 = [v36 metadata];
  v38 = [v37 objectForKeyedSubscript:MLModelCreatorDefinedKey];
  v39 = [v38 objectForKeyedSubscript:@"model_version"];
  uint64_t v40 = [v39 description];
  v41 = (void *)v40;
  if (v40) {
    CFStringRef v42 = (const __CFString *)v40;
  }
  else {
    CFStringRef v42 = @"None";
  }
  [(_OSInactivityPredictor *)self setModelVersion:v42];

  v43 = self->_log;
  if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_DEBUG)) {
    sub_100041FA4(v43, v44, v45, v46, v47, v48, v49, v50);
  }
  if (v57) {
    CFStringRef v51 = @"alternateConfidenceThreshold";
  }
  else {
    CFStringRef v51 = @"defaultConfidenceThreshold";
  }
  v52 = [(TRIClient *)self->_trialClient levelForFactor:v51 withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v52 doubleValue];
  -[_OSInactivityPredictor setConfidenceThresholdStrict:](self, "setConfidenceThresholdStrict:");

  v53 = [(TRIClient *)self->_trialClient levelForFactor:@"multiplicativeLeewayStrict" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v53 doubleValue];
  self->_multiplicativeLeewayStrict = v54;

  v55 = [(TRIClient *)self->_trialClient levelForFactor:@"multiplicativeLeewayRelaxed" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
  [v55 doubleValue];
  self->_multiplicativeLeewayRelaxed = v56;
}

+ (id)predictor
{
  id v2 = [objc_alloc((Class)objc_opt_class()) initWithAlternateModel:0 inEvaluationMode:0];

  return v2;
}

+ (id)alternatePredictor
{
  id v2 = [objc_alloc((Class)objc_opt_class()) initWithAlternateModel:1 inEvaluationMode:0];

  return v2;
}

+ (id)evaluator
{
  id v2 = [objc_alloc((Class)objc_opt_class()) initWithAlternateModel:0 inEvaluationMode:1];

  return v2;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  id v9 = a3;
  uint64_t v10 = (void *)os_transaction_create();
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  double v30 = sub_100016350;
  double v31 = sub_100016360;
  id v32 = 0;
  queue = self->_queue;
  uint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  uint64_t v21 = sub_100016368;
  CFStringRef v22 = &unk_100064C60;
  id v12 = v9;
  id v23 = v12;
  uint64_t v24 = self;
  v25 = &v27;
  int64_t v26 = a5;
  dispatch_sync(queue, &v19);
  if (v28[5])
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v34 = a5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "(%ld) Returning Cached output", buf, 0xCu);
    }
  }
  else
  {
    v14 = +[_OSLockHistory sharedInstance];
    uint64_t v15 = [(_OSInactivityPredictorTwoStage *)self longInactivityPredictionResultAtDate:v12 withLockHistory:v14 withOptions:a5 withError:a6];
    uint64_t v16 = (void *)v28[5];
    v28[5] = v15;
  }
  id v17 = (id)v28[5];

  _Block_object_dispose(&v27, 8);

  return v17;
}

- (id)longInactivityPredictionResultAtDate:(id)a3 withLockHistory:(id)a4 withOptions:(int64_t)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v29 = 0;
  double v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_100016350;
  objc_super v33 = sub_100016360;
  id v34 = 0;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  int64_t v26 = sub_100016350;
  uint64_t v27 = sub_100016360;
  id v28 = 0;
  queue = self->_queue;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000166E4;
  v17[3] = &unk_100064CB0;
  v17[4] = self;
  id v18 = v10;
  id v19 = v11;
  uint64_t v20 = &v23;
  uint64_t v21 = &v29;
  int64_t v22 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_sync(queue, v17);
  *a6 = (id) v24[5];
  id v15 = (id)v30[5];

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

  return v15;
}

- (MLModel)engageModel
{
  return self->_engageModel;
}

- (MLModel)durationModel
{
  return self->_durationModel;
}

- (double)multiplicativeLeewayStrict
{
  return self->_multiplicativeLeewayStrict;
}

- (void)setMultiplicativeLeewayStrict:(double)a3
{
  self->_multiplicativeLeewayStrict = a3;
}

- (double)multiplicativeLeewayRelaxed
{
  return self->_multiplicativeLeewayRelaxed;
}

- (void)setMultiplicativeLeewayRelaxed:(double)a3
{
  self->_multiplicativeLeewayRelaxed = a3;
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDate)lastInputDate
{
  return self->_lastInputDate;
}

- (void)setLastInputDate:(id)a3
{
}

- (NSDate)lastPredictedDate
{
  return self->_lastPredictedDate;
}

- (void)setLastPredictedDate:(id)a3
{
}

- (_OSInactivityPredictorOutput)predictionOutput
{
  return self->_predictionOutput;
}

- (void)setPredictionOutput:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionOutput, 0);
  objc_storeStrong((id *)&self->_lastPredictedDate, 0);
  objc_storeStrong((id *)&self->_lastInputDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_durationModel, 0);

  objc_storeStrong((id *)&self->_engageModel, 0);
}

@end