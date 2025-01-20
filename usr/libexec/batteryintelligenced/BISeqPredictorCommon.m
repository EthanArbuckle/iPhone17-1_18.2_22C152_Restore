@interface BISeqPredictorCommon
+ (id)sharedInstance;
- (BIFeatures)featureGen;
- (BISeqPredictorCommon)init;
- (OS_os_log)logger;
- (id)_copyFeaturesWithParams:(id)a3 modelName:(id)a4 error:(id *)a5;
- (id)getInputNamesAndDimensionsForModel:(id)a3;
- (id)getOutputNamesAndDimensionsForModel:(id)a3;
- (id)runInferenceForModel:(id)a3 withParams:(id)a4 outputFeatureType:(int64_t)a5;
- (int64_t)outputFeatureType;
- (void)setFeatureGen:(id)a3;
- (void)setLogger:(id)a3;
- (void)setOutputFeatureType:(int64_t)a3;
@end

@implementation BISeqPredictorCommon

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005014;
  block[3] = &unk_100030628;
  block[4] = a1;
  if (qword_100039600 != -1) {
    dispatch_once(&qword_100039600, block);
  }
  v2 = (void *)qword_1000395F8;

  return v2;
}

- (BISeqPredictorCommon)init
{
  v17.receiver = self;
  v17.super_class = (Class)BISeqPredictorCommon;
  id v2 = [(BISeqPredictorCommon *)&v17 init];
  if (!v2)
  {
    BOOL v8 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v8) {
      sub_10001EF98(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    goto LABEL_8;
  }
  uint64_t v3 = sub_100016A74("bimodelseqpredictorcommon");
  v4 = (void *)*((void *)v2 + 2);
  *((void *)v2 + 2) = v3;

  v5 = +[BIFeatures sharedInstance];
  [v2 setFeatureGen:v5];

  v6 = [v2 featureGen];

  if (!v6)
  {
    if (os_log_type_enabled(*((os_log_t *)v2 + 2), OS_LOG_TYPE_ERROR)) {
      sub_10001EFD4();
    }
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v7 = (BISeqPredictorCommon *)v2;
LABEL_9:

  return v7;
}

- (id)_copyFeaturesWithParams:(id)a3 modelName:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  if (![&off_1000333A0 containsObject:v8])
  {
    id v17 = 0;
LABEL_39:
    id v17 = v17;
    v30 = v17;
    goto LABEL_40;
  }
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v10 = v9;
  if (v7) {
    [v9 addEntriesFromDictionary:v7];
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG)) {
    sub_10001F0D8(logger);
  }
  if (qword_100039608
    && (+[NSDate now],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        [v12 timeIntervalSinceDate:qword_100039608],
        double v14 = v13,
        v12,
        v14 < 86400.0))
  {
    [v10 setObject:&__kCFBooleanTrue forKeyedSubscript:@"UseCachedFeatures"];
    uint64_t v15 = self->_logger;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)v32 = 0;
    v16 = "Using cached feature set";
  }
  else
  {
    [v10 setObject:&__kCFBooleanFalse forKeyedSubscript:@"UseCachedFeatures"];
    uint64_t v15 = self->_logger;
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    *(_WORD *)v32 = 0;
    v16 = "Regenerating new feature set";
  }
  _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, v32, 2u);
LABEL_14:
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  if ([v8 isEqualToString:@"nccp_wra_qmaxp_seq_model"])
  {
    v19 = &off_1000333B8;
    goto LABEL_18;
  }
  if ([v8 isEqualToString:@"state_estimation_model"])
  {
    v19 = &off_1000333D0;
LABEL_18:
    v20 = -[BISeqPredictorCommon getInputNamesAndDimensionsForModel:](self, "getInputNamesAndDimensionsForModel:", v8, *(void *)v32);
    id v21 = [(BIFeatures *)self->_featureGen copyDailyHealthHistoryForFeatures:v19 withFeatureDimensions:v20 withParams:v10];
    if (v21)
    {
      [v18 addEntriesFromDictionary:v21];
      if (([v8 isEqualToString:@"nccp_wra_qmaxp_seq_model"] & 1) == 0
        && ![v8 isEqualToString:@"state_estimation_model"])
      {
        goto LABEL_23;
      }
      id v22 = [(BIFeatures *)self->_featureGen copyUsageHistory:&off_1000333E8 withFeatureDimensions:v20 withParams:v10];
      if (v22)
      {
        v23 = v22;
        [v18 addEntriesFromDictionary:v22];

LABEL_23:
        v24 = [v10 objectForKeyedSubscript:@"UseCachedFeatures"];
        unsigned __int8 v25 = [v24 BOOLValue];

        if ((v25 & 1) == 0)
        {
          uint64_t v26 = +[NSDate now];
          v27 = (void *)qword_100039608;
          qword_100039608 = v26;
        }
        v28 = self->_logger;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v32 = 138412290;
          *(void *)&v32[4] = v18;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "ML model input dict: %@", v32, 0xCu);
        }
        id v17 = [v18 copy];
        int v29 = 0;
        goto LABEL_36;
      }
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        sub_10001F03C();
      }
    }
    else if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    {
      sub_10001F008();
    }
    id v17 = 0;
    int v29 = 1;
LABEL_36:

    goto LABEL_37;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
    sub_10001F070();
  }
  id v17 = 0;
  int v29 = 1;
LABEL_37:

  if (!v29) {
    goto LABEL_39;
  }
  v30 = 0;
LABEL_40:

  return v30;
}

- (id)getInputNamesAndDimensionsForModel:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"qmaxp_seq_model"])
  {
    CFStringRef v25 = @"daily_history_input";
    v23[0] = &off_100033778;
    v23[1] = &off_100033790;
    v24[0] = @"qmaxpHistory";
    v24[1] = @"cycleCountHistory";
    v23[2] = &off_1000337A8;
    v24[2] = @"ageHistory";
    v5 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:3];
    uint64_t v26 = v5;
    v6 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
LABEL_8:

    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"nccp_wra_qmaxp_seq_model"])
  {
    v21[0] = @"daily_history_input";
    v19[0] = &off_100033778;
    v19[1] = &off_100033790;
    v20[0] = @"nccpHistory";
    v20[1] = @"wraHistory";
    v19[2] = &off_1000337A8;
    v19[3] = &off_1000337C0;
    v20[2] = @"qmaxpHistory";
    v20[3] = @"cycleCountHistory";
    v19[4] = &off_1000337D8;
    v19[5] = &off_1000337F0;
    v20[4] = @"ageHistory";
    v20[5] = @"timeSinceLastReadingDays";
    v5 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:6];
    v21[1] = @"usage_history_input";
    v22[0] = v5;
    v17[0] = &off_100033778;
    v17[1] = &off_100033790;
    v18[0] = @"voltageHistory";
    v18[1] = @"currentHistory";
    v17[2] = &off_1000337A8;
    v17[3] = &off_1000337C0;
    v18[2] = @"tempHistory";
    v18[3] = @"qHistory";
    v17[4] = &off_1000337D8;
    v18[4] = @"timeSinceLastReadingMins";
    id v7 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];
    v22[1] = v7;
    id v8 = v22;
    id v9 = v21;
LABEL_7:
    v6 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v9 count:2];

    goto LABEL_8;
  }
  if ([v4 isEqualToString:@"state_estimation_model"])
  {
    v15[0] = @"daily_history_input";
    v13[0] = &off_100033778;
    v13[1] = &off_100033790;
    v14[0] = @"cycleCountHistory";
    v14[1] = @"ageHistory";
    v13[2] = &off_1000337A8;
    v14[2] = @"timeSinceLastReadingDays";
    v5 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
    v15[1] = @"usage_history_input";
    v16[0] = v5;
    v11[0] = &off_100033778;
    v11[1] = &off_100033790;
    v12[0] = @"voltageHistory";
    v12[1] = @"currentHistory";
    v11[2] = &off_1000337A8;
    v11[3] = &off_1000337C0;
    v12[2] = @"tempHistory";
    v12[3] = @"qHistory";
    v11[4] = &off_1000337D8;
    v12[4] = @"timeSinceLastReadingMins";
    id v7 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:5];
    v16[1] = v7;
    id v8 = v16;
    id v9 = v15;
    goto LABEL_7;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
    sub_10001F15C();
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (id)getOutputNamesAndDimensionsForModel:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"nccp_wra_qmaxp_seq_model"])
  {
    v24[0] = &off_100033778;
    v24[1] = &off_100033790;
    v25[0] = @"q10_nccp_forecast";
    v25[1] = @"q10_wra_forecast";
    v24[2] = &off_1000337A8;
    v25[2] = @"q10_qmaxp_forecast";
    v26[0] = @"nccp_wra_qmaxp_q10_forecast";
    v5 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];
    v27[0] = v5;
    v26[1] = @"nccp_wra_qmaxp_q25_forecast";
    v22[0] = &off_100033778;
    v22[1] = &off_100033790;
    v23[0] = @"q25_nccp_forecast";
    v23[1] = @"q25_wra_forecast";
    void v22[2] = &off_1000337A8;
    v23[2] = @"q25_qmaxp_forecast";
    v6 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:3];
    v27[1] = v6;
    v26[2] = @"nccp_wra_qmaxp_q50_forecast";
    v20[0] = &off_100033778;
    v20[1] = &off_100033790;
    v21[0] = @"q50_nccp_forecast";
    v21[1] = @"q50_wra_forecast";
    v20[2] = &off_1000337A8;
    void v21[2] = @"q50_qmaxp_forecast";
    id v7 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:3];
    v27[2] = v7;
    v26[3] = @"nccp_wra_qmaxp_q75_forecast";
    v18[0] = &off_100033778;
    v18[1] = &off_100033790;
    v19[0] = @"q75_nccp_forecast";
    v19[1] = @"q75_wra_forecast";
    v18[2] = &off_1000337A8;
    v19[2] = @"q75_qmaxp_forecast";
    id v8 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];
    v27[3] = v8;
    v26[4] = @"nccp_wra_qmaxp_q90_forecast";
    v16[0] = &off_100033778;
    v16[1] = &off_100033790;
    v17[0] = @"q90_nccp_forecast";
    v17[1] = @"q90_wra_forecast";
    void v16[2] = &off_1000337A8;
    v17[2] = @"q90_qmaxp_forecast";
    id v9 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:3];
    v27[4] = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:5];

LABEL_5:
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"state_estimation_model"])
  {
    v12[0] = &off_100033778;
    v12[1] = &off_100033790;
    v13[0] = @"nccp";
    v13[1] = @"wra";
    v12[2] = &off_1000337A8;
    v13[2] = @"qmaxp";
    CFStringRef v14 = @"health_state_estimation";
    v5 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:3];
    uint64_t v15 = v5;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
    sub_10001F15C();
  }
  uint64_t v10 = 0;
LABEL_9:

  return v10;
}

- (id)runInferenceForModel:(id)a3 withParams:(id)a4 outputFeatureType:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = logger;
    uint64_t v12 = [v9 objectForKeyedSubscript:@"PredictionDurationDays"];
    *(_DWORD *)buf = 138412546;
    id v79 = v8;
    __int16 v80 = 2112;
    v81 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Running inference for model %@ for prediction duration = %@ days", buf, 0x16u);
  }
  double v13 = +[NSBundle bundleForClass:objc_opt_class()];
  CFStringRef v14 = [v13 pathForResource:v8 ofType:@"mlmodelc"];

  id v15 = objc_alloc_init((Class)MLModelConfiguration);
  [v15 setComputeUnits:1];
  v16 = +[NSURL fileURLWithPath:v14];
  id v17 = +[MLModel modelWithContentsOfURL:v16 configuration:v15 error:0];

  id v75 = 0;
  id v18 = [(BISeqPredictorCommon *)self _copyFeaturesWithParams:v9 modelName:v8 error:&v75];
  id v19 = v75;
  v20 = v19;
  if (!v18)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_10001F1C4();
    }
    goto LABEL_9;
  }
  if (v19)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_10001F294();
    }
LABEL_9:
    id v21 = 0;
    goto LABEL_10;
  }
  id v74 = 0;
  id v23 = [objc_alloc((Class)MLDictionaryFeatureProvider) initWithDictionary:v18 error:&v74];
  id v24 = v74;
  v20 = v24;
  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_10001F1F8();
    }
    goto LABEL_9;
  }
  unint64_t v58 = a5;
  id v73 = v24;
  [v17 predictionFromFeatures:v23 error:&v73];
  v26 = id v25 = v23;
  id v59 = v73;

  v63 = v25;
  v64 = (void *)v26;
  if (v26)
  {
    v27 = v25;
    id v52 = v18;
    v53 = v17;
    id v54 = v15;
    v55 = v14;
    id v56 = v9;
    id v28 = objc_alloc_init((Class)NSMutableDictionary);
    v62 = [(BISeqPredictorCommon *)self getInputNamesAndDimensionsForModel:v8];
    id v57 = v8;
    v61 = [(BISeqPredictorCommon *)self getOutputNamesAndDimensionsForModel:v8];
    long long v69 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id obj = [v27 featureNames];
    id v29 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
    if (v29)
    {
      id v30 = v29;
      v31 = v27;
      uint64_t v32 = *(void *)v70;
      do
      {
        for (i = 0; i != v30; i = (char *)i + 1)
        {
          if (*(void *)v70 != v32) {
            objc_enumerationMutation(obj);
          }
          v34 = *(void **)(*((void *)&v69 + 1) + 8 * i);
          unsigned int v35 = [v34 isEqualToString:@"scalar_input"];
          v36 = [v31 featureValueForName:v34];
          v37 = [v36 multiArrayValue];
          v38 = [v62 objectForKey:v34];
          if (v35) {
            +[BITensor getValuesFrom2DMultiArray:v37 withFeatureNamesForDimensions:v38];
          }
          else {
          v39 = +[BITensor getValuesFrom3DMultiArray:v37 withFeatureNamesForDimensions:v38];
          }

          [v28 addEntriesFromDictionary:v39];
          v31 = v63;
        }
        id v30 = [obj countByEnumeratingWithState:&v69 objects:v77 count:16];
      }
      while (v30);
    }

    long long v67 = 0u;
    long long v68 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    v40 = [v64 featureNames];
    id v41 = [v40 countByEnumeratingWithState:&v65 objects:v76 count:16];
    if (v41)
    {
      id v42 = v41;
      uint64_t v43 = *(void *)v66;
      do
      {
        for (j = 0; j != v42; j = (char *)j + 1)
        {
          if (*(void *)v66 != v43) {
            objc_enumerationMutation(v40);
          }
          uint64_t v45 = *(void *)(*((void *)&v65 + 1) + 8 * (void)j);
          v46 = [v64 featureValueForName:v45];
          v47 = [v46 multiArrayValue];
          v48 = [v61 objectForKey:v45];
          v49 = +[BITensor getValuesFrom3DMultiArray:v47 withFeatureNamesForDimensions:v48];

          [v28 addEntriesFromDictionary:v49];
        }
        id v42 = [v40 countByEnumeratingWithState:&v65 objects:v76 count:16];
      }
      while (v42);
    }

    sub_100016CF0(v28, v58);
    id v21 = v64;
    id v50 = v64;

    id v9 = v56;
    id v8 = v57;
    id v15 = v54;
    CFStringRef v14 = v55;
    id v18 = v52;
    id v17 = v53;
  }
  else
  {
    BOOL v51 = os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR);
    id v21 = 0;
    if (v51) {
      sub_10001F260();
    }
  }

  v20 = v59;
LABEL_10:

  return v21;
}

- (BIFeatures)featureGen
{
  return self->_featureGen;
}

- (void)setFeatureGen:(id)a3
{
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);

  objc_storeStrong((id *)&self->_featureGen, 0);
}

@end