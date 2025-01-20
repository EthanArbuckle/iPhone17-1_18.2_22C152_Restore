@interface CombinedHealthSequencePredictor
+ (id)sharedPredictor;
- (BITrialManager)trialManager;
- (BOOL)logToCoreAnalytics;
- (BOOL)logToPPS;
- (CombinedHealthSequencePredictor)init;
- (NSArray)predictedFeatureNames;
- (NSString)name;
- (NSString)version;
- (OS_os_log)logger;
- (id)getPastBatteryHealthModelPredictionsWithParams:(id)a3 forPredictionOutputName:(id)a4;
- (id)getPayloadForCoreAnalyticsWithParams:(id)a3 forModelOutput:(id)a4;
- (id)getPayloadForPPSWithParams:(id)a3 andFeatureValue:(id)a4 forModelOutput:(id)a5;
- (id)parseModelOutputName:(id)a3;
- (int64_t)outputFeatureType;
- (void)predictAndRecordWithParams:(id)a3;
- (void)setLogToCoreAnalytics:(BOOL)a3;
- (void)setLogToPPS:(BOOL)a3;
- (void)setLogger:(id)a3;
- (void)setName:(id)a3;
- (void)setOutputFeatureType:(int64_t)a3;
- (void)setPredictedFeatureNames:(id)a3;
- (void)setTrialManager:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation CombinedHealthSequencePredictor

+ (id)sharedPredictor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003440;
  block[3] = &unk_100030628;
  block[4] = a1;
  if (qword_1000395F0 != -1) {
    dispatch_once(&qword_1000395F0, block);
  }
  v2 = (void *)qword_1000395E8;

  return v2;
}

- (CombinedHealthSequencePredictor)init
{
  v3 = (void *)os_transaction_create();
  v37.receiver = self;
  v37.super_class = (Class)CombinedHealthSequencePredictor;
  v4 = [(CombinedHealthSequencePredictor *)&v37 init];
  if (v4)
  {
    uint64_t v5 = sub_100016A74("combinedseqpredictor");
    logger = v4->_logger;
    v4->_logger = (OS_os_log *)v5;

    [(CombinedHealthSequencePredictor *)v4 setLogToPPS:1];
    [(CombinedHealthSequencePredictor *)v4 setLogToCoreAnalytics:1];
    [(CombinedHealthSequencePredictor *)v4 setName:@"nccp_wra_qmaxp_seq_model"];
    [(CombinedHealthSequencePredictor *)v4 setOutputFeatureType:18];
    v7 = [[BITrialManager alloc] initWithNamespaceId:1910];
    [(CombinedHealthSequencePredictor *)v4 setTrialManager:v7];

    id v8 = objc_alloc_init((Class)MLModelConfiguration);
    [v8 setComputeUnits:1];
    trialManager = v4->_trialManager;
    if (!trialManager
      || ([(BITrialManager *)trialManager loadTrialMLModelForModelName:@"bhfModel" withConfiguration:v8], (v10 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v11 = v4->_logger;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = v11;
        v13 = [(CombinedHealthSequencePredictor *)v4 name];
        *(_DWORD *)buf = 138412290;
        v39 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Unable to load ML model from trial. Loading default model for %@.", buf, 0xCu);
      }
      v14 = +[NSBundle bundleForClass:objc_opt_class()];
      v15 = [(CombinedHealthSequencePredictor *)v4 name];
      v16 = [v14 pathForResource:v15 ofType:@"mlmodelc"];

      if (v16)
      {
        v17 = +[NSURL fileURLWithPath:v16];
        v10 = +[MLModel modelWithContentsOfURL:v17 configuration:v8 error:0];

        if (v10) {
          goto LABEL_8;
        }
        v34 = v4->_logger;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
          sub_10001EB14(v34);
        }
      }
      else
      {
        v33 = v4->_logger;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
          sub_10001EA84(v33);
        }
      }
      v23 = 0;
      goto LABEL_26;
    }
LABEL_8:
    v18 = [v10 modelDescription];
    v19 = [v18 metadata];

    if (v19)
    {
      v20 = [v10 modelDescription];
      v21 = [v20 metadata];
      v22 = [v21 objectForKeyedSubscript:MLModelVersionStringKey];
      [(CombinedHealthSequencePredictor *)v4 setVersion:v22];
    }
    else
    {
      v24 = v4->_logger;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_10001EC34(v24);
      }
    }
    v25 = [v10 modelDescription];
    v26 = [v25 predictedFeatureName];

    v27 = [v10 modelDescription];
    v28 = v27;
    if (v26)
    {
      v29 = [v27 predictedFeatureName];
      id v30 = [v29 copy];
    }
    else
    {
      v31 = [v27 outputDescriptionsByName];

      if (!v31)
      {
        v36 = v4->_logger;
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_10001EBA4(v36);
        }
        goto LABEL_20;
      }
      v28 = [v10 modelDescription];
      v29 = [v28 outputDescriptionsByName];
      id v30 = [v29 allKeys];
    }
    v32 = v30;
    [(CombinedHealthSequencePredictor *)v4 setPredictedFeatureNames:v30];

LABEL_20:
    v23 = v4;

LABEL_26:
    goto LABEL_27;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10001EA3C();
  }
  v23 = 0;
LABEL_27:

  return v23;
}

- (id)parseModelOutputName:(id)a3
{
  id v3 = a3;
  v4 = [v3 substringWithRange:1, 2];
  id v5 = [v4 intValue];

  v6 = [v3 componentsSeparatedByString:@"_"];

  v7 = [v6 objectAtIndex:1];
  v11[0] = @"health_metric";
  v11[1] = @"quantile";
  v12[0] = v7;
  id v8 = +[NSNumber numberWithInt:v5];
  v12[1] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (void)predictAndRecordWithParams:(id)a3
{
  id v4 = a3;
  v80 = (void *)os_transaction_create();
  id v5 = +[NSDate now];
  v6 = +[NSDate now];
  uint64_t v7 = [v5 dateByAddingTimeInterval:-86400.0];
  [&off_100033598 floatValue];
  [v6 dateByAddingTimeInterval:(float)((float)((float)(v8 / 365.0) * -31536000.0) + 86400.0)];
  v131[0] = @"PredictionDurationDays";
  v131[1] = @"HealthHistoryStartDate";
  v132[0] = &off_100033370;
  v132[1] = v7;
  v77 = (void *)v7;
  v131[2] = @"HealthHistoryEndDate";
  v131[3] = @"UsageHistoryStartDate";
  v131[4] = @"UsageHistoryEndDate";
  v131[5] = @"MaxHealthHistoryLenDays";
  v78 = v6;
  v79 = v5;
  uint64_t v133 = v132[2] = v5;
  v76 = (void *)v133;
  v134 = v6;
  v135 = &off_1000335C8;
  v131[6] = @"MaxUsageHistoryLenTimesteps";
  v136 = &off_1000335B0;
  v9 = +[NSDictionary dictionaryWithObjects:v132 forKeys:v131 count:7];
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_10001ED2C();
  }
  v75 = v9;
  if (v4)
  {
    id v10 = +[NSMutableDictionary dictionaryWithDictionary:v4];
    long long v115 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v11 = v9;
    id v12 = [v11 countByEnumeratingWithState:&v115 objects:v130 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v116;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v116 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v115 + 1) + 8 * i);
          v17 = [v10 objectForKey:v16];

          if (!v17)
          {
            v18 = [v11 objectForKeyedSubscript:v16];
            [v10 setObject:v18 forKeyedSubscript:v16];
          }
        }
        id v13 = [v11 countByEnumeratingWithState:&v115 objects:v130 count:16];
      }
      while (v13);
    }
  }
  else
  {
    id v10 = v9;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
    sub_10001ECC4();
  }
  v19 = +[BISeqPredictorCommon sharedInstance];
  v20 = [(CombinedHealthSequencePredictor *)self name];
  v94 = v10;
  v85 = [v19 runInferenceForModel:v20 withParams:v10 outputFeatureType:18];

  long long v113 = 0u;
  long long v114 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  v21 = [(CombinedHealthSequencePredictor *)self predictedFeatureNames];
  id v22 = [v21 countByEnumeratingWithState:&v111 objects:v129 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v112;
    do
    {
      for (j = 0; j != v23; j = (char *)j + 1)
      {
        if (*(void *)v112 != v24) {
          objc_enumerationMutation(v21);
        }
        v26 = *(void **)(*((void *)&v111 + 1) + 8 * (void)j);
        v27 = [v85 featureValueForName:v26];
        logger = self->_logger;
        if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v123 = (uint64_t)v26;
          __int16 v124 = 2112;
          v125 = v27;
          _os_log_debug_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_DEBUG, "Output %@ shape: %@", buf, 0x16u);
        }
      }
      id v23 = [v21 countByEnumeratingWithState:&v111 objects:v129 count:16];
    }
    while (v23);
  }

  v29 = +[BISeqPredictorCommon sharedInstance];
  id v30 = [(CombinedHealthSequencePredictor *)self name];
  v83 = [v29 getOutputNamesAndDimensionsForModel:v30];

  id v87 = objc_alloc_init((Class)NSMutableDictionary);
  long long v107 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  v31 = [v85 featureNames];
  id v32 = [v31 countByEnumeratingWithState:&v107 objects:v128 count:16];
  if (v32)
  {
    id v33 = v32;
    uint64_t v34 = *(void *)v108;
    do
    {
      for (k = 0; k != v33; k = (char *)k + 1)
      {
        if (*(void *)v108 != v34) {
          objc_enumerationMutation(v31);
        }
        uint64_t v36 = *(void *)(*((void *)&v107 + 1) + 8 * (void)k);
        objc_super v37 = [v85 featureValueForName:v36];
        v38 = [v37 multiArrayValue];
        v39 = [v83 objectForKey:v36];
        v40 = +[BITensor getValuesFrom3DMultiArray:v38 withFeatureNamesForDimensions:v39];

        [v87 addEntriesFromDictionary:v40];
      }
      id v33 = [v31 countByEnumeratingWithState:&v107 objects:v128 count:16];
    }
    while (v33);
  }

  v41 = self->_logger;
  v42 = v94;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    v43 = v41;
    v44 = [(CombinedHealthSequencePredictor *)self name];
    v45 = [v94 objectForKeyedSubscript:@"PredictionDurationDays"];
    *(_DWORD *)buf = 138412802;
    uint64_t v123 = (uint64_t)v44;
    __int16 v124 = 2112;
    v125 = v45;
    __int16 v126 = 2112;
    id v127 = v87;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "Model: %@ Days: %@ Predictions: %@\n", buf, 0x20u);
  }
  if (self->_logToPPS
    && (long long v105 = 0u,
        long long v106 = 0u,
        long long v103 = 0u,
        long long v104 = 0u,
        (id v82 = [&off_100033388 countByEnumeratingWithState:&v103 objects:v121 count:16]) != 0))
  {
    v46 = 0;
    uint64_t v81 = *(void *)v104;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v104 != v81) {
          objc_enumerationMutation(&off_100033388);
        }
        uint64_t v84 = v47;
        v92 = *(void **)(*((void *)&v103 + 1) + 8 * v47);
        long long v99 = 0u;
        long long v100 = 0u;
        long long v101 = 0u;
        long long v102 = 0u;
        id v88 = [&off_100033358 countByEnumeratingWithState:&v99 objects:v120 count:16];
        if (v88)
        {
          uint64_t v86 = *(void *)v100;
          do
          {
            for (m = 0; m != v88; m = (char *)m + 1)
            {
              if (*(void *)v100 != v86) {
                objc_enumerationMutation(&off_100033358);
              }
              v90 = *(void **)(*((void *)&v99 + 1) + 8 * (void)m);
              v49 = +[NSString stringWithFormat:@"q%@_%@_forecast", v92, v90, v75];
              v50 = [v87 objectForKey:v49];
              if ([v50 count])
              {
                unint64_t v51 = 0;
                v52 = v46;
                do
                {
                  v53 = [v42 objectForKeyedSubscript:@"PredictionDurationDays"];
                  v54 = [v53 objectAtIndex:v51];

                  v55 = self->_logger;
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412802;
                    uint64_t v123 = (uint64_t)v92;
                    __int16 v124 = 2112;
                    v125 = v90;
                    __int16 v126 = 2112;
                    id v127 = v54;
                    _os_log_debug_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEBUG, "Logging PPS data for Q=%@ %@ prediction at t=%@ days.", buf, 0x20u);
                  }
                  v56 = +[NSMutableDictionary dictionaryWithDictionary:v42];
                  [v56 setObject:v54 forKeyedSubscript:@"PredictionDurationDays"];
                  v57 = [v50 objectAtIndex:v51];
                  v46 = [(CombinedHealthSequencePredictor *)self getPayloadForPPSWithParams:v56 andFeatureValue:v57 forModelOutput:v49];

                  v58 = self->_logger;
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    uint64_t v123 = (uint64_t)v46;
                    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "PPS data to log %@", buf, 0xCu);
                  }
                  +[BIMetricRecorder sendToPPS:v46 forIdentifier:@"BatteryHealthDelta"];

                  ++v51;
                  v52 = v46;
                  v42 = v94;
                }
                while ((unint64_t)[v50 count] > v51);
              }
            }
            id v88 = [&off_100033358 countByEnumeratingWithState:&v99 objects:v120 count:16];
          }
          while (v88);
        }
        uint64_t v47 = v84 + 1;
      }
      while ((id)(v84 + 1) != v82);
      id v82 = [&off_100033388 countByEnumeratingWithState:&v103 objects:v121 count:16];
    }
    while (v82);
  }
  else
  {
    v46 = 0;
  }
  if (self->_logToCoreAnalytics)
  {
    long long v97 = 0u;
    long long v98 = 0u;
    long long v95 = 0u;
    long long v96 = 0u;
    id v59 = v87;
    id v60 = [v59 countByEnumeratingWithState:&v95 objects:v119 count:16];
    if (v60)
    {
      id v61 = v60;
      uint64_t v62 = *(void *)v96;
      id v91 = v59;
      uint64_t v89 = *(void *)v96;
      do
      {
        v63 = 0;
        id v93 = v61;
        do
        {
          if (*(void *)v96 != v62) {
            objc_enumerationMutation(v59);
          }
          v64 = *(void **)(*((void *)&v95 + 1) + 8 * (void)v63);
          v65 = [v64 substringWithRange:1, 2];
          unsigned int v66 = [v65 intValue];

          if (v66 == 50)
          {
            v67 = [v59 objectForKey:v64];
            if ([v67 count])
            {
              unint64_t v68 = 0;
              do
              {
                v69 = [v42 objectForKeyedSubscript:@"PredictionDurationDays"];
                v70 = [v69 objectAtIndex:v68];

                v71 = self->_logger;
                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v123 = (uint64_t)v70;
                  _os_log_debug_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "Searching for past prediction at t=%@ days for CA logging.", buf, 0xCu);
                }
                v72 = +[NSMutableDictionary dictionaryWithDictionary:v42];
                [v72 setObject:v70 forKeyedSubscript:@"PredictionDurationDays"];
                uint64_t v73 = [(CombinedHealthSequencePredictor *)self getPayloadForCoreAnalyticsWithParams:v72 forModelOutput:v64];

                v74 = self->_logger;
                if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v123 = v73;
                  _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "CA data to log %@", buf, 0xCu);
                }
                +[BIMetricRecorder sendToCoreAnalytics:v73 forEvent:@"com.apple.bi.batteryhealthdelta_predictions" withTrialManager:self->_trialManager];

                ++v68;
                v46 = (void *)v73;
                v42 = v94;
              }
              while ((unint64_t)[v67 count] > v68);
            }
            else
            {
              uint64_t v73 = (uint64_t)v46;
            }

            v46 = (void *)v73;
            id v59 = v91;
            id v61 = v93;
            uint64_t v62 = v89;
          }
          v63 = (char *)v63 + 1;
        }
        while (v63 != v61);
        id v61 = [v59 countByEnumeratingWithState:&v95 objects:v119 count:16];
      }
      while (v61);
    }
  }
}

- (id)getPayloadForPPSWithParams:(id)a3 andFeatureValue:(id)a4 forModelOutput:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[NSMutableDictionary dictionary];
  id v12 = [(CombinedHealthSequencePredictor *)self version];
  [v11 setObject:v12 forKeyedSubscript:@"model_id"];

  id v13 = [(CombinedHealthSequencePredictor *)self name];
  [v11 setObject:v13 forKeyedSubscript:@"model_name"];

  [v9 doubleValue];
  double v15 = v14;

  uint64_t v16 = +[NSNumber numberWithDouble:v15];
  [v11 setObject:v16 forKeyedSubscript:@"model_prediction"];

  v17 = [v10 objectForKeyedSubscript:@"PredictionDurationDays"];

  [v11 setObject:v17 forKeyedSubscript:@"prediction_duration"];
  [v11 setObject:v8 forKeyedSubscript:@"prediction_output_name"];

  return v11;
}

- (id)getPastBatteryHealthModelPredictionsWithParams:(id)a3 forPredictionOutputName:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[NSDate now];
  id v9 = [v7 objectForKeyedSubscript:@"PredictionDurationDays"];

  id v10 = [v8 dateByAddingTimeInterval:-86400 * [v9 intValue]];
  id v11 = [v10 dateByAddingTimeInterval:-86400.0];
  id v12 = v10;
  id v13 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v11 endDate:v12];
  double v14 = [(CombinedHealthSequencePredictor *)self name];
  double v15 = sub_10000B068(v14, v13, (uint64_t)v9, v6);

  if (v15 && [v15 count])
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
    {
      v20 = logger;
      int v21 = 134218498;
      id v22 = [v15 count];
      __int16 v23 = 2112;
      uint64_t v24 = v11;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_debug_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Found %lu past predictions logged to PPS from %@ to %@", (uint8_t *)&v21, 0x20u);
    }
    id v17 = v15;
  }
  else
  {
    v18 = self->_logger;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_10001ED94(v18, self, (uint64_t)v12);
    }
    id v17 = 0;
  }

  return v17;
}

- (id)getPayloadForCoreAnalyticsWithParams:(id)a3 forModelOutput:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
      sub_10001EE50(logger);
    }
    goto LABEL_14;
  }
  id v8 = [v6 objectForKey:@"PredictionDurationDays"];

  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_10001EE94();
    }
LABEL_14:
    id v29 = 0;
    goto LABEL_21;
  }
  id v9 = +[NSMutableDictionary dictionary];
  id v10 = [(CombinedHealthSequencePredictor *)self getPastBatteryHealthModelPredictionsWithParams:v6 forPredictionOutputName:v7];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 firstObject];
    id v13 = [v12 valueForKey:@"model_prediction"];

    double v14 = self->_logger;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      id v33 = v14;
      uint64_t v34 = [v6 objectForKeyedSubscript:@"PredictionDurationDays"];
      *(_DWORD *)buf = 138413058;
      v39 = v34;
      __int16 v40 = 2048;
      id v41 = [v11 count];
      __int16 v42 = 2112;
      v43 = v11;
      __int16 v44 = 2112;
      v45 = v13;
      _os_log_debug_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "For lookback days = %@, found %lu past model predictions: %@. \n Using first model prediction: %@.", buf, 0x2Au);
    }
    double v15 = [(CombinedHealthSequencePredictor *)self parseModelOutputName:v7];
    uint64_t v16 = [v15 objectForKey:@"health_metric"];
    id v17 = sub_100017990(v16);

    if (v17)
    {
      objc_super v37 = v13;
      [v13 floatValue];
      float v19 = v18;
      [v17 floatValue];
      *(float *)&double v21 = v19 - v20;
      id v22 = +[NSNumber numberWithFloat:v21];
      __int16 v23 = self->_logger;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v35 = v23;
        uint64_t v36 = [v6 objectForKeyedSubscript:@"PredictionDurationDays"];
        *(_DWORD *)buf = 138413058;
        v39 = v36;
        __int16 v40 = 2112;
        id v41 = v37;
        __int16 v42 = 2112;
        v43 = v17;
        __int16 v44 = 2112;
        v45 = v22;
        _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Lookback days = %@, predictedVal = %@, true currentVal = %@, error = %@", buf, 0x2Au);
      }
      [v9 setObject:v22 forKeyedSubscript:@"prediction_error" error:v36];
      [v22 doubleValue];
      __int16 v25 = +[NSNumber numberWithDouble:fabs(v24)];
      [v9 setObject:v25 forKeyedSubscript:@"prediction_error_absolute"];

      id v26 = [(CombinedHealthSequencePredictor *)self version];
      [v9 setObject:v26 forKeyedSubscript:@"model_id"];

      v27 = [(CombinedHealthSequencePredictor *)self name];
      [v9 setObject:v27 forKeyedSubscript:@"model_name"];

      v28 = [v6 objectForKeyedSubscript:@"PredictionDurationDays"];
      [v9 setObject:v28 forKeyedSubscript:@"prediction_duration"];

      [v9 setObject:v7 forKeyedSubscript:@"prediction_output_name"];
      id v29 = v9;

      id v13 = v37;
    }
    else
    {
      v31 = self->_logger;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        sub_10001EEFC(v31, v15);
      }
      id v29 = 0;
    }
  }
  else
  {
    id v29 = 0;
  }

LABEL_21:

  return v29;
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

- (BITrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
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
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_predictedFeatureNames, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_logger, 0);
}

@end