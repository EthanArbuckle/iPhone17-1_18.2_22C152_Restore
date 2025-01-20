@interface OcvDriftEstimator
+ (id)sharedPredictor;
- (BOOL)logToCoreAnalytics;
- (BOOL)logToPPS;
- (NSArray)predictedFeatureNames;
- (NSString)name;
- (NSString)version;
- (OS_os_log)logger;
- (OcvDriftEstimator)init;
- (id)_copyFeatures;
- (id)getPayloadForPPSWithParams:(id)a3 andPredictionValue:(id)a4;
- (void)predictAndRecordWithParams:(id)a3;
- (void)setLogToCoreAnalytics:(BOOL)a3;
- (void)setLogToPPS:(BOOL)a3;
- (void)setLogger:(id)a3;
- (void)setName:(id)a3;
- (void)setPredictedFeatureNames:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation OcvDriftEstimator

+ (id)sharedPredictor
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100015B40;
  block[3] = &unk_100030628;
  block[4] = a1;
  if (qword_1000396A8 != -1) {
    dispatch_once(&qword_1000396A8, block);
  }
  v2 = (void *)qword_1000396A0;

  return v2;
}

- (OcvDriftEstimator)init
{
  v3 = (void *)os_transaction_create();
  v30.receiver = self;
  v30.super_class = (Class)OcvDriftEstimator;
  v4 = [(OcvDriftEstimator *)&v30 init];
  if (v4)
  {
    uint64_t v5 = sub_100016A74("ocv-drift-predictor");
    logger = v4->_logger;
    v4->_logger = (OS_os_log *)v5;

    [(OcvDriftEstimator *)v4 setLogToCoreAnalytics:0];
    [(OcvDriftEstimator *)v4 setLogToPPS:1];
    [(OcvDriftEstimator *)v4 setName:@"ocv_drift_model"];
    v7 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [(OcvDriftEstimator *)v4 name];
    v9 = [v7 pathForResource:v8 ofType:@"mlmodelc"];

    if (v9)
    {
      v10 = +[NSURL fileURLWithPath:v9];
      v11 = +[MLModel modelWithContentsOfURL:v10 error:0];

      if (v11)
      {
        v12 = [v11 modelDescription];
        v13 = [v12 metadata];

        if (v13)
        {
          v14 = [v11 modelDescription];
          v15 = [v14 metadata];
          v16 = [v15 objectForKeyedSubscript:MLModelVersionStringKey];
          [(OcvDriftEstimator *)v4 setVersion:v16];
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

        if (v22)
        {
          id v23 = objc_alloc((Class)NSArray);
          v24 = [v11 modelDescription];
          v25 = [v24 predictedFeatureName];
          id v26 = [v25 copy];
          id v27 = [v23 initWithObjects:v26];
          [(OcvDriftEstimator *)v4 setPredictedFeatureNames:v27];
        }
        else
        {
          v28 = v4->_logger;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
            sub_10001EBA4(v28);
          }
        }
        v17 = v4;
      }
      else
      {
        v19 = v4->_logger;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_10001EB14(v19);
        }
        v17 = 0;
      }
    }
    else
    {
      v18 = v4->_logger;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_10001EA84(v18);
      }
      v17 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10001EA3C();
    }
    v17 = 0;
  }

  return v17;
}

- (id)_copyFeatures
{
  unsigned int v2 = sub_100017174();
  unsigned int v3 = sub_10001712C();
  unsigned int v4 = sub_100016F6C();
  unsigned int v5 = sub_100017398();
  unsigned int v6 = sub_100017450();
  unsigned int v7 = sub_1000173E4();
  unsigned int v8 = sub_100017310();
  *(float *)&double v9 = (float)v7;
  v10 = +[NSNumber numberWithFloat:v9];
  v38[0] = v10;
  *(float *)&double v11 = (float)v8 / 168.0;
  v12 = +[NSNumber numberWithFloat:v11];
  v38[1] = v12;
  *(float *)&double v13 = (float)v5;
  v14 = +[NSNumber numberWithFloat:v13];
  v38[2] = v14;
  *(float *)&double v15 = (float)v2;
  v16 = +[NSNumber numberWithFloat:v15];
  v38[3] = v16;
  *(float *)&double v17 = (float)v4 / 1000.0;
  v18 = +[NSNumber numberWithFloat:v17];
  v38[4] = v18;
  *(float *)&double v19 = (float)v3 / 1000.0;
  v20 = +[NSNumber numberWithFloat:v19];
  v38[5] = v20;
  *(float *)&double v21 = (float)v6 / 10.0;
  v22 = +[NSNumber numberWithFloat:v21];
  v38[6] = v22;
  id v23 = +[NSArray arrayWithObjects:v38 count:7];

  v37 = &off_100033A60;
  v24 = +[NSArray arrayWithObjects:&v37 count:1];
  id v33 = 0;
  id v25 = [objc_alloc((Class)MLMultiArray) initWithShape:v24 dataType:65568 error:&v33];
  id v32 = v33;
  if ([&off_100033A60 unsignedIntValue])
  {
    unint64_t v26 = 0;
    do
    {
      id v27 = [v23 objectAtIndexedSubscript:v26];
      v28 = +[NSNumber numberWithUnsignedInteger:v26];
      v36 = v28;
      v29 = +[NSArray arrayWithObjects:&v36 count:1];
      [v25 setObject:v27 forKeyedSubscript:v29];

      ++v26;
    }
    while (v26 < [&off_100033A60 unsignedIntValue]);
  }
  CFStringRef v34 = @"Input";
  id v35 = v25;
  objc_super v30 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];

  return v30;
}

- (void)predictAndRecordWithParams:(id)a3
{
  unsigned int v4 = (void *)os_transaction_create();
  id v5 = [(OcvDriftEstimator *)self _copyFeatures];
  logger = self->_logger;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEBUG)) {
      sub_100021724();
    }
    id v20 = 0;
    id v7 = [objc_alloc((Class)MLDictionaryFeatureProvider) initWithDictionary:v5 error:&v20];
    id v8 = v20;
    if (v7)
    {
      double v9 = +[NSBundle bundleForClass:objc_opt_class()];
      v10 = [(OcvDriftEstimator *)self name];
      double v11 = [v9 pathForResource:v10 ofType:@"mlmodelc"];

      v12 = +[NSURL fileURLWithPath:v11];
      double v13 = +[MLModel modelWithContentsOfURL:v12 error:0];

      id v19 = v8;
      v14 = [v13 predictionFromFeatures:v7 error:&v19];
      id v15 = v19;

      if (v15 && os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        sub_1000216B0();
      }
      v16 = [v14 featureValueForName:@"Prediction"];
      double v17 = self->_logger;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "OCV model ouput: %@", buf, 0xCu);
      }
      if (self->_logToPPS)
      {
        v18 = [(OcvDriftEstimator *)self getPayloadForPPSWithParams:0 andPredictionValue:v16];
        +[BIMetricRecorder sendToPPS:v18 forIdentifier:@"OCVDrift"];
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
        sub_10002163C();
      }
      id v15 = v8;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR)) {
      sub_1000215F8(logger);
    }
    id v15 = 0;
  }
}

- (id)getPayloadForPPSWithParams:(id)a3 andPredictionValue:(id)a4
{
  id v5 = a4;
  unsigned int v6 = +[NSMutableDictionary dictionary];
  id v7 = [(OcvDriftEstimator *)self version];
  [v6 setObject:v7 forKeyedSubscript:@"model_id"];

  id v8 = [(OcvDriftEstimator *)self name];
  [v6 setObject:v8 forKeyedSubscript:@"model_name"];

  double v9 = [v5 multiArrayValue];
  id v10 = objc_alloc_init((Class)NSMutableArray);
  if ([v9 count])
  {
    unint64_t v11 = 0;
    do
    {
      v12 = [v9 objectAtIndexedSubscript:v11];
      [v12 floatValue];
      *(float *)&double v14 = v13 * 10000.0;
      id v15 = +[NSNumber numberWithFloat:v14];

      [v10 addObject:v15];
      ++v11;
    }
    while (v11 < (unint64_t)[v9 count]);
  }
  [v6 setObject:v10 forKeyedSubscript:@"model_prediction"];
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412290;
    id v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, logger, OS_LOG_TYPE_INFO, "OCV model to log: %@", (uint8_t *)&v18, 0xCu);
  }

  return v6;
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
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