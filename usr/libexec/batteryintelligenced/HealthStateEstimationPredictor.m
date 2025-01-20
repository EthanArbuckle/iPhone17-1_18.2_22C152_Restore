@interface HealthStateEstimationPredictor
+ (id)sharedPredictor;
- (BOOL)logToCoreAnalytics;
- (BOOL)logToPPS;
- (HealthStateEstimationPredictor)init;
- (NSArray)predictedFeatureNames;
- (NSString)name;
- (NSString)version;
- (OS_os_log)logger;
- (id)getPayloadForCoreAnalyticsWithParams:(id)a3 andModelPred:(id)a4 forModelOutput:(id)a5;
- (id)getPayloadForPPSWithParams:(id)a3 andFeatureValue:(id)a4 forModelOutput:(id)a5;
- (int64_t)outputFeatureType;
- (void)predictAndRecordWithParams:(id)a3;
- (void)setLogToCoreAnalytics:(BOOL)a3;
- (void)setLogToPPS:(BOOL)a3;
- (void)setLogger:(id)a3;
- (void)setName:(id)a3;
- (void)setOutputFeatureType:(int64_t)a3;
- (void)setPredictedFeatureNames:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation HealthStateEstimationPredictor

+ (id)sharedPredictor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000869C;
  block[3] = &unk_100030628;
  block[4] = a1;
  if (qword_100039628 != -1) {
    dispatch_once(&qword_100039628, block);
  }
  v2 = (void *)qword_100039620;

  return v2;
}

- (HealthStateEstimationPredictor)init
{
  v3 = (void *)os_transaction_create();
  v31.receiver = self;
  v31.super_class = (Class)HealthStateEstimationPredictor;
  v4 = [(HealthStateEstimationPredictor *)&v31 init];
  if (v4)
  {
    uint64_t v5 = sub_100016A74("stateestimationpredictor");
    logger = v4->_logger;
    v4->_logger = (OS_os_log *)v5;

    [(HealthStateEstimationPredictor *)v4 setLogToPPS:1];
    [(HealthStateEstimationPredictor *)v4 setLogToCoreAnalytics:1];
    [(HealthStateEstimationPredictor *)v4 setName:@"state_estimation_model"];
    [(HealthStateEstimationPredictor *)v4 setOutputFeatureType:19];
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [(HealthStateEstimationPredictor *)v4 name];
    v9 = [v7 pathForResource:v8 ofType:@"mlmodelc"];

    if (!v9)
    {
      v18 = v4->_logger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10001EA84(v18);
      }
      v17 = 0;
      goto LABEL_24;
    }
    v10 = +[NSURL fileURLWithPath:v9];
    v11 = +[MLModel modelWithContentsOfURL:v10 error:0];

    if (!v11)
    {
      v19 = v4->_logger;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_10001EB14(v19);
      }
      v17 = 0;
      goto LABEL_23;
    }
    v12 = [v11 modelDescription];
    v13 = [v12 metadata];

    if (v13)
    {
      v14 = [v11 modelDescription];
      v15 = [v14 metadata];
      v16 = [v15 objectForKeyedSubscript:MLModelVersionStringKey];
      [(HealthStateEstimationPredictor *)v4 setVersion:v16];
    }
    else
    {
      v20 = v4->_logger;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_10001EC34(v20);
      }
    }
    v21 = [v11 modelDescription];
    v22 = [v21 predictedFeatureName];

    v23 = [v11 modelDescription];
    v24 = v23;
    if (v22)
    {
      v25 = [v23 predictedFeatureName];
      id v26 = [v25 copy];
    }
    else
    {
      v27 = [v23 outputDescriptionsByName];

      if (!v27)
      {
        v30 = v4->_logger;
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
          sub_10001EBA4(v30);
        }
        goto LABEL_22;
      }
      v24 = [v11 modelDescription];
      v25 = [v24 outputDescriptionsByName];
      id v26 = [v25 allKeys];
    }
    v28 = v26;
    [(HealthStateEstimationPredictor *)v4 setPredictedFeatureNames:v26];

LABEL_22:
    v17 = v4;
LABEL_23:

LABEL_24:
    goto LABEL_25;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10001EA3C();
  }
  v17 = 0;
LABEL_25:

  return v17;
}

- (void)predictAndRecordWithParams:(id)a3
{
  id v4 = a3;
  v72 = (void *)os_transaction_create();
  uint64_t v5 = +[NSDate now];
  v6 = +[NSDate now];
  uint64_t v7 = [v5 dateByAddingTimeInterval:-86400.0];
  [&off_1000338E0 floatValue];
  [v6 dateByAddingTimeInterval:(float)((float)((float)(v8 / 365.0) * -31536000.0) + 86400.0)];
  v112[0] = @"PredictionDurationDays";
  v112[1] = @"HealthHistoryStartDate";
  v113[0] = &off_100033910;
  v113[1] = v7;
  v69 = (void *)v7;
  v112[2] = @"HealthHistoryEndDate";
  v112[3] = @"UsageHistoryStartDate";
  v112[4] = @"UsageHistoryEndDate";
  v112[5] = @"MaxHealthHistoryLenDays";
  v70 = v6;
  v71 = v5;
  uint64_t v114 = v113[2] = v5;
  v68 = (void *)v114;
  v115 = v6;
  v116 = &off_100033928;
  v112[6] = @"MaxUsageHistoryLenTimesteps";
  v117 = &off_1000338F8;
  v9 = +[NSDictionary dictionaryWithObjects:v113 forKeys:v112 count:7];
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_10001ED2C();
  }
  v67 = v9;
  if (v4)
  {
    id v76 = +[NSMutableDictionary dictionaryWithDictionary:v4];
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    long long v100 = 0u;
    id v10 = v9;
    id v11 = [v10 countByEnumeratingWithState:&v97 objects:v111 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v98;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v98 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v97 + 1) + 8 * i);
          v16 = [v76 objectForKey:v15];

          if (!v16)
          {
            v17 = [v10 objectForKeyedSubscript:v15];
            [v76 setObject:v17 forKeyedSubscript:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v97 objects:v111 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v76 = v9;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_10001ECC4();
  }
  v18 = +[BISeqPredictorCommon sharedInstance];
  v19 = [(HealthStateEstimationPredictor *)self name];
  v75 = [v18 runInferenceForModel:v19 withParams:v76 outputFeatureType:19];

  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  v20 = [(HealthStateEstimationPredictor *)self predictedFeatureNames];
  id v21 = [v20 countByEnumeratingWithState:&v93 objects:v110 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v94;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v94 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v93 + 1) + 8 * (void)j);
        id v26 = [v75 featureValueForName:v25];
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v104 = v25;
          __int16 v105 = 2112;
          v106 = v26;
          _os_log_debug_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEBUG, "Output %@ shape: %@", buf, 0x16u);
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v93 objects:v110 count:16];
    }
    while (v22);
  }

  v28 = +[BISeqPredictorCommon sharedInstance];
  v29 = [(HealthStateEstimationPredictor *)self name];
  v73 = [v28 getOutputNamesAndDimensionsForModel:v29];

  id v74 = objc_alloc_init((Class)NSMutableDictionary);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  v30 = [v75 featureNames];
  id v31 = [v30 countByEnumeratingWithState:&v89 objects:v109 count:16];
  if (v31)
  {
    id v32 = v31;
    uint64_t v33 = *(void *)v90;
    do
    {
      for (k = 0; k != v32; k = (char *)k + 1)
      {
        if (*(void *)v90 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void *)(*((void *)&v89 + 1) + 8 * (void)k);
        v36 = [v75 featureValueForName:v35];
        v37 = [v36 multiArrayValue];
        v38 = [v73 objectForKey:v35];
        v39 = +[BITensor getValuesFrom3DMultiArray:v37 withFeatureNamesForDimensions:v38];

        [v74 addEntriesFromDictionary:v39];
      }
      id v32 = [v30 countByEnumeratingWithState:&v89 objects:v109 count:16];
    }
    while (v32);
  }

  v40 = self->_logger;
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = v40;
    v42 = [(HealthStateEstimationPredictor *)self name];
    v43 = [v76 objectForKeyedSubscript:@"PredictionDurationDays"];
    *(_DWORD *)buf = 138412802;
    v104 = v42;
    __int16 v105 = 2112;
    v106 = v43;
    __int16 v107 = 2112;
    id v108 = v74;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Model: %@ Days: %@ Predictions: %@\n", buf, 0x20u);
  }
  if (self->_logToPPS)
  {
    long long v87 = 0u;
    long long v88 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    id v44 = v74;
    id v45 = [v44 countByEnumeratingWithState:&v85 objects:v102 count:16];
    if (v45)
    {
      id v46 = v45;
      v47 = 0;
      uint64_t v48 = *(void *)v86;
      do
      {
        v49 = 0;
        v50 = v47;
        do
        {
          if (*(void *)v86 != v48) {
            objc_enumerationMutation(v44);
          }
          uint64_t v51 = *(void *)(*((void *)&v85 + 1) + 8 * (void)v49);
          v52 = [v44 objectForKey:v51];
          v53 = [v52 objectAtIndex:0];
          v54 = self->_logger;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
            sub_10001F8B8(&v83, v84, v54);
          }
          v47 = [(HealthStateEstimationPredictor *)self getPayloadForPPSWithParams:v76 andFeatureValue:v53 forModelOutput:v51];

          v55 = self->_logger;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v104 = v47;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "PPS data to log %@", buf, 0xCu);
          }
          +[BIMetricRecorder sendToPPS:v47 forIdentifier:@"BatteryHealthDelta"];

          v49 = (char *)v49 + 1;
          v50 = v47;
        }
        while (v46 != v49);
        id v46 = [v44 countByEnumeratingWithState:&v85 objects:v102 count:16];
      }
      while (v46);
    }
    else
    {
      v47 = 0;
    }
  }
  else
  {
    v47 = 0;
  }
  if (self->_logToCoreAnalytics)
  {
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v56 = v74;
    id v57 = [v56 countByEnumeratingWithState:&v79 objects:v101 count:16];
    if (v57)
    {
      id v58 = v57;
      uint64_t v59 = *(void *)v80;
      do
      {
        v60 = 0;
        v61 = v47;
        do
        {
          if (*(void *)v80 != v59) {
            objc_enumerationMutation(v56);
          }
          uint64_t v62 = *(void *)(*((void *)&v79 + 1) + 8 * (void)v60);
          v63 = [v56 objectForKey:v62];
          v64 = [v63 objectAtIndex:0];
          v65 = self->_logger;
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG)) {
            sub_10001F878(&v77, v78, v65);
          }
          v47 = [(HealthStateEstimationPredictor *)self getPayloadForCoreAnalyticsWithParams:v76 andModelPred:v64 forModelOutput:v62];

          v66 = self->_logger;
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v104 = v47;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "CA data to log %@", buf, 0xCu);
          }
          +[BIMetricRecorder sendToCoreAnalytics:v47 forEvent:@"com.apple.bi.batteryhealthdelta_predictions" withTrialManager:0];

          v60 = (char *)v60 + 1;
          v61 = v47;
        }
        while (v58 != v60);
        id v58 = [v56 countByEnumeratingWithState:&v79 objects:v101 count:16];
      }
      while (v58);
    }
  }
}

- (id)getPayloadForPPSWithParams:(id)a3 andFeatureValue:(id)a4 forModelOutput:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[NSMutableDictionary dictionary];
  id v12 = [(HealthStateEstimationPredictor *)self version];
  [v11 setObject:v12 forKeyedSubscript:@"model_id"];

  uint64_t v13 = [(HealthStateEstimationPredictor *)self name];
  [v11 setObject:v13 forKeyedSubscript:@"model_name"];

  [v9 doubleValue];
  double v15 = v14;

  v16 = +[NSNumber numberWithDouble:v15];
  [v11 setObject:v16 forKeyedSubscript:@"model_prediction"];

  v17 = [v10 objectForKeyedSubscript:@"PredictionDurationDays"];

  [v11 setObject:v17 forKeyedSubscript:@"prediction_duration"];
  [v11 setObject:v8 forKeyedSubscript:@"prediction_output_name"];

  return v11;
}

- (id)getPayloadForCoreAnalyticsWithParams:(id)a3 andModelPred:(id)a4 forModelOutput:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
      sub_10001EE50(logger);
    }
    goto LABEL_11;
  }
  id v11 = [v8 objectForKey:@"PredictionDurationDays"];

  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_10001EE94();
    }
LABEL_11:
    id v25 = 0;
    goto LABEL_16;
  }
  id v12 = +[NSMutableDictionary dictionary];
  uint64_t v13 = sub_100017990(v10);
  if (v13)
  {
    [v9 floatValue];
    float v15 = v14;
    [v13 floatValue];
    *(float *)&double v17 = v15 - v16;
    v18 = +[NSNumber numberWithFloat:v17];
    v19 = self->_logger;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      int v28 = 138412802;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v13;
      __int16 v32 = 2112;
      uint64_t v33 = v18;
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Current state estimation error (t=0 days): predictedVal = %@, true currentVal = %@, error = %@", (uint8_t *)&v28, 0x20u);
    }
    [v12 setObject:v18 forKeyedSubscript:@"prediction_error"];
    [v18 doubleValue];
    id v21 = +[NSNumber numberWithDouble:fabs(v20)];
    [v12 setObject:v21 forKeyedSubscript:@"prediction_error_absolute"];

    id v22 = [(HealthStateEstimationPredictor *)self version];
    [v12 setObject:v22 forKeyedSubscript:@"model_id"];

    uint64_t v23 = [(HealthStateEstimationPredictor *)self name];
    [v12 setObject:v23 forKeyedSubscript:@"model_name"];

    v24 = [v8 objectForKeyedSubscript:@"PredictionDurationDays"];
    [v12 setObject:v24 forKeyedSubscript:@"prediction_duration"];

    [v12 setObject:v10 forKeyedSubscript:@"prediction_output_name"];
    id v25 = v12;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_10001F8F8();
    }
    id v25 = 0;
  }

LABEL_16:

  return v25;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
}

- (int64_t)outputFeatureType
{
  return self->_outputFeatureType;
}

- (void)setOutputFeatureType:(int64_t)a3
{
  self->_outputFeatureType = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSArray)predictedFeatureNames
{
  return self->_predictedFeatureNames;
}

- (void)setPredictedFeatureNames:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (BOOL)logToPPS
{
  return self->_logToPPS;
}

- (void)setLogToPPS:(BOOL)a3
{
  self->_logToPPS = a3;
}

- (BOOL)logToCoreAnalytics
{
  return self->_logToCoreAnalytics;
}

- (void)setLogToCoreAnalytics:(BOOL)a3
{
  self->_logToCoreAnalytics = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_predictedFeatureNames, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

@end