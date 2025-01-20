@interface CLElevationProfileEstimator
- (BOOL)_forwardProcessingWithLocationArray:(id)a3 andElevationArray:(id)a4 andKFEstimatesBuffer:(id)a5 andKeepAllLocations:(BOOL)a6 andTaskType:(unint64_t)a7;
- (BOOL)_queryVisitStateByTimestamp:(double)a3 withHistoricalVisits:(id)a4 andVisitSearchStartIndex:(int)a5;
- (BOOL)_rejectOutlyingLocation:(id)a3 withKFEstimates:(id)a4;
- (CLContextManagerElevationProfile)elevationProfileContextManager;
- (CLElevationProfileEstimator)initWithContextManager:(id)a3;
- (double)_getTimestampWithElevationArray:(id)a3 atIndex:(unsigned int)a4;
- (double)_getTimestampWithLocationArray:(id)a3 atIndex:(unsigned int)a4;
- (int)_getLastPredictionIndexWithKFEstimatesBuffer:(id)a3 fromIndex:(int)a4;
- (void)_alignElevationArray:(id)a3 andLocationArray:(id)a4;
- (void)_backwardProcessingWithKFEstimatesBuffer:(id)a3 andKSEstimatesBuffer:(id)a4;
- (void)_decimateElevationsWithStartTime:(double)a3 andEndTime:(double)a4 andLocationArray:(id)a5 andElevationArray:(id)a6 andAggregatedLocationArray:(id)a7 andRawElevationArray:(id)a8;
- (void)_decimateLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andLocationArray:(id)a5 andElevationArray:(id)a6 andRawLocationArray:(id)a7 andRawElevationArray:(id)a8 andTaskType:(unint64_t)a9 andVisitArray:(id)a10 andVisitSearchStartIndex:(int)a11;
- (void)_elevationBatchProcessingWithStartTime:(double)a3 andEndTime:(double)a4 andLocationBuffer:(id)a5 andKSEstimatesBuffer:(id)a6 andTaskType:(unint64_t)a7 andCompletionBlock:(id)a8;
- (void)_gatherLocationArray:(id)a3 andElevationArray:(id)a4 andTaskType:(unint64_t)a5 withStartTime:(double)a6 andEndTime:(double)a7 andVisitArray:(id)a8 andVisitSearchStartIndex:(int)a9 andCompletionBlock:(id)a10;
- (void)_initKalmanFilter:(id)a3 withLocationArray:(id)a4 andElevationArray:(id)a5 andTaskType:(unint64_t)a6;
- (void)_kalmanSmootherUpdateWithKFEstimatesBuffer:(id)a3 andKSEstimatesBuffer:(id)a4 andCurrPredictionIndex:(int)a5 andNextPredictionIndex:(int)a6;
- (void)_logValuesOfFilteredLocations:(id)a3 andTaskType:(unint64_t)a4;
- (void)_logValuesOfLocationArray:(id)a3 andElevationArray:(id)a4 andTaskType:(unint64_t)a5;
- (void)_measurementUpdate:(id)a3 withLocation:(id)a4;
- (void)_predictionUpdate:(id)a3 withElevation:(id)a4 withNextElevation:(id)a5 withTravelVelocity:(double)a6;
- (void)_removeInVisitLocation:(id)a3 withVisitArray:(id)a4 andVisitSearchStartIndex:(int)a5;
- (void)_sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:(id)a3 andCompletionBlock:(id)a4;
- (void)_setXPCCriteriaForActivity:(id)a3 withDescription:(id)a4;
- (void)computeElevationProfileWithStartTime:(double)a3 andEndTime:(double)a4;
- (void)computeHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4 andCompletionBlock:(id)a5;
- (void)getTravelVelocity:(double *)a3 withCurrLocation:(id)a4 andNextLocation:(id)a5;
- (void)registerAndRunXPCActivity:(id)a3 withActivityIdentifier:(id)a4 andDescription:(id)a5;
- (void)sendAnalyticsEventWithXpcTaskWaitingTime:(double)a3;
- (void)setElevationProfileContextManager:(id)a3;
@end

@implementation CLElevationProfileEstimator

- (CLElevationProfileEstimator)initWithContextManager:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLElevationProfileEstimator;
  v4 = [(CLElevationProfileEstimator *)&v9 init];
  if (v4)
  {
    sub_101A1F180(buf, "ElevationProfileMeanSeaLevelPressureSamplingPeriod", &qword_101D2B370, 0);
    v4->_meanSeaLevelPressureSamplingPeriod = v12;
    sub_101A1F180(buf, "ElevationProfileDataDecimationPeriod", &qword_101D2B378, 0);
    v4->_decimationPeriod = v12;
    sub_101A1F180(buf, "ElevationLocationFilterWindowSize", &qword_101D2B380, 0);
    v4->_windowSize = v12;
    v8[0] = 0;
    sub_10006ACBC(buf, "ElevationVerbose", v8, 0);
    v4->_isVerboseLogging = buf[1];
    sub_101A22680(buf, "ElevationProfileElevationInitialVar", &dword_101D2B388, 0);
    v4->_elevationInitialVar = v11;
    sub_101A22680(buf, "ElevationProfileElevationProcessNoiseVar", &dword_101D2B38C, 0);
    v4->_elevationProcessNoiseVar = v11;
    sub_101A22680(buf, "ElevationProfileMeanSeaLevelPressureInitialVar", &dword_101D2B390, 0);
    v4->_meanSeaLevelPressureInitialVar = v11;
    sub_101A22680(buf, "ElevationProfileMeanSeaLevelPressureProcessNoiseVar", &dword_101D2B394, 0);
    v4->_meanSeaLevelPressureProcessNoiseVar = v11;
    *(_DWORD *)v8 = 1101004800;
    sub_101A22680(buf, "ElevationProfileLocationMaxVerticalAccuracy", v8, 0);
    v4->_locationMaxVerticalAccuracy = v11;
    sub_101A1F180(buf, "ElevationProfileMaxOutlierRatio", &qword_101D2B398, 0);
    v4->_maxOutlierRatio = v12;
    v4->_elevationBatchSize = vcvtad_u64_f64((v4->_meanSeaLevelPressureSamplingPeriod + v4->_meanSeaLevelPressureSamplingPeriod)/ 2.56);
    sub_101A21DA8(buf, "ElevationProfileLocationBatchSize", dword_101D2B3A0, 0);
    *(float *)&v4->_locationBatchSize = v11;
    v4->_refreshMslpXpcTaskScheduleTimestamp = 1.79769313e308;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4->_elevationProfileContextManager = (CLContextManagerElevationProfile *)a3;
    }
    else
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C6180);
      }
      v5 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "initWithContextManager,elevation profile context manager does not exist!", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C6180);
        }
        *(_WORD *)v8 = 0;
        v7 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLElevationProfileEstimator initWithContextManager:]", "%s\n", v7);
        if (v7 != (char *)buf) {
          free(v7);
        }
      }
    }
  }
  return v4;
}

- (void)_setXPCCriteriaForActivity:(id)a3 withDescription:(id)a4
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, XPC_ACTIVITY_GROUP_NAME, (const char *)[a4 UTF8String]);
  xpc_dictionary_set_int64(v6, XPC_ACTIVITY_GROUP_CONCURRENCY_LIMIT, 1);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_REPEATING, 0);
  xpc_dictionary_set_string(v6, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_CPU_INTENSIVE, 1);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_MEMORY_INTENSIVE, 1);
  xpc_dictionary_set_BOOL(v6, XPC_ACTIVITY_ALLOW_BATTERY, 1);
  xpc_activity_set_criteria((xpc_activity_t)a3, v6);

  xpc_release(v6);
}

- (void)_sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:(id)a3 andCompletionBlock:(id)a4
{
  id v82 = objc_alloc_init((Class)NSMutableArray);
  if (![a3 count])
  {
    (*((void (**)(id, id))a4 + 2))(a4, v82);

    return;
  }
  int v7 = [a3 count];
  uint64_t v8 = (v7 - 1);
  if (v7 - 1 < 0) {
    goto LABEL_49;
  }
  unint64_t v9 = 0;
  double v10 = 0.0;
  float v11 = &qword_102419000;
  double v12 = 0.0;
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = 0.0;
  do
  {
    id v16 = [a3 objectAtIndex:v8];
    if (self->_isVerboseLogging)
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C6180);
      }
      v17 = v11[61];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        [v16 timestamp];
        uint64_t v85 = v18;
        [v16 fState];
        double v84 = v19;
        [v16 fState];
        double v83 = v20;
        [v16 fCovariance];
        double v22 = v21;
        [v16 fCovariance];
        double v23 = v14;
        double v25 = v24;
        [v16 fCovariance];
        double v26 = v13;
        double v27 = v12;
        double v28 = v10;
        double v30 = v29;
        [v16 fCovariance];
        *(_DWORD *)buf = 134219520;
        uint64_t v87 = v85;
        __int16 v88 = 2048;
        double v89 = v84;
        __int16 v90 = 2048;
        double v91 = v83;
        __int16 v92 = 2048;
        double v93 = v22;
        __int16 v94 = 2048;
        double v95 = v25;
        double v14 = v23;
        __int16 v96 = 2048;
        double v97 = v30;
        double v10 = v28;
        double v12 = v27;
        double v13 = v26;
        __int16 v98 = 2048;
        double v99 = v31;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "historical mslp estimation,timestamp,%f,elevation,%f,mslp,%f,P00,%f,P01,%f,P10,%f,P11,%f", buf, 0x48u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C6180);
        }
        [v16 timestamp];
        [v16 fState];
        [v16 fState];
        [v16 fCovariance];
        [v16 fCovariance];
        [v16 fCovariance];
        [v16 fCovariance];
        v67 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:andCompletionBlock:]", "%s\n", v67);
        if (v67 != (char *)buf) {
          free(v67);
        }
        float v11 = &qword_102419000;
      }
    }
    [v16 fCovariance];
    if (v32 < 0.0)
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C6180);
      }
      v33 = v11[61];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        [v16 timestamp];
        uint64_t v35 = v34;
        [v16 fState];
        double v37 = v36;
        [v16 fCovariance];
        *(_DWORD *)buf = 134218496;
        uint64_t v87 = v35;
        __int16 v88 = 2048;
        double v89 = v37;
        __int16 v90 = 2048;
        double v91 = v38;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "warning: negative mslp variance,timestamp,%f,mslp,%f,var,%f", buf, 0x20u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C6180);
        }
        [v16 timestamp];
        [v16 fState];
        [v16 fCovariance];
        v39 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:andCompletionBlock:]", "%s\n", v39);
        if (v39 != (char *)buf) {
          free(v39);
        }
      }
LABEL_29:
      float v11 = &qword_102419000;
      goto LABEL_30;
    }
    [v16 timestamp];
    double v41 = v40;
    if (v9)
    {
      double v42 = v10 - v40;
      if (v10 - v41 < self->_meanSeaLevelPressureSamplingPeriod)
      {
        [v16 timestamp:v42];
        double v12 = v12 + v43;
        [v16 fState];
        double v13 = v13 + v44;
        [v16 fCovariance];
        double v14 = v14 + sqrtf(v45);
        [v16 fState];
        double v15 = v15 + v46;
        ++v9;
        goto LABEL_30;
      }
      v47 = objc_alloc_init(CLMeanSeaLevelPressureData);
      [(CLMeanSeaLevelPressureData *)v47 setTimestamp:v12 / (double)v9];
      [(CLMeanSeaLevelPressureData *)v47 setMeanSeaLevelPressure:v13 / (double)v9];
      [(CLMeanSeaLevelPressureData *)v47 setUncertainty:v14 / (double)v9];
      float v48 = v15 / (double)v9;
      float v49 = v13 / (double)v9;
      [(CLMeanSeaLevelPressureData *)v47 setPressureMeasurement:sub_1014BE58C(v48, v49)];
      [v82 addObject:v47];
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C6180);
      }
      v50 = v11[61];
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
      {
        [(CLMeanSeaLevelPressureData *)v47 timestamp];
        uint64_t v52 = v51;
        [(CLMeanSeaLevelPressureData *)v47 meanSeaLevelPressure];
        double v54 = v53;
        [(CLMeanSeaLevelPressureData *)v47 uncertainty];
        double v56 = v55;
        [(CLMeanSeaLevelPressureData *)v47 pressureMeasurement];
        *(_DWORD *)buf = 134218752;
        uint64_t v87 = v52;
        __int16 v88 = 2048;
        double v89 = v54;
        __int16 v90 = 2048;
        double v91 = v56;
        __int16 v92 = 2048;
        double v93 = v57;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEBUG, "historical mslp array element,timestamp,%f,meanSeaLevelPressure,%f,uncertainty,%f,pressureMeasurement,%f", buf, 0x2Au);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C6180);
        }
        [(CLMeanSeaLevelPressureData *)v47 timestamp];
        [(CLMeanSeaLevelPressureData *)v47 meanSeaLevelPressure];
        [(CLMeanSeaLevelPressureData *)v47 uncertainty];
        [(CLMeanSeaLevelPressureData *)v47 pressureMeasurement];
        v68 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:andCompletionBlock:]", "%s\n", v68);
        if (v68 != (char *)buf) {
          free(v68);
        }
      }

      [v16 timestamp];
      double v10 = v58;
      [v16 timestamp];
      double v12 = v59;
      [v16 fState];
      double v13 = v60;
      [v16 fCovariance];
      double v14 = sqrtf(v61);
      [v16 fState];
      double v15 = v62;
      unint64_t v9 = 1;
      goto LABEL_29;
    }
    [v16 timestamp];
    double v12 = v63;
    [v16 fState];
    double v13 = v64;
    [v16 fCovariance];
    double v14 = sqrtf(v65);
    [v16 fState];
    double v15 = v66;
    unint64_t v9 = 1;
    double v10 = v41;
LABEL_30:
    --v7;
    --v8;
  }
  while (v7 > 0);
  if (v9)
  {
    v69 = objc_alloc_init(CLMeanSeaLevelPressureData);
    [(CLMeanSeaLevelPressureData *)v69 setTimestamp:v12 / (double)v9];
    [(CLMeanSeaLevelPressureData *)v69 setMeanSeaLevelPressure:v13 / (double)v9];
    [(CLMeanSeaLevelPressureData *)v69 setUncertainty:v14 / (double)v9];
    float v70 = v15 / (double)v9;
    float v71 = v13 / (double)v9;
    [(CLMeanSeaLevelPressureData *)v69 setPressureMeasurement:sub_1014BE58C(v70, v71)];
    [v82 addObject:v69];
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C6180);
    }
    v72 = v11[61];
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
    {
      [(CLMeanSeaLevelPressureData *)v69 timestamp];
      uint64_t v74 = v73;
      [(CLMeanSeaLevelPressureData *)v69 meanSeaLevelPressure];
      double v76 = v75;
      [(CLMeanSeaLevelPressureData *)v69 uncertainty];
      double v78 = v77;
      [(CLMeanSeaLevelPressureData *)v69 pressureMeasurement];
      *(_DWORD *)buf = 134218752;
      uint64_t v87 = v74;
      __int16 v88 = 2048;
      double v89 = v76;
      __int16 v90 = 2048;
      double v91 = v78;
      __int16 v92 = 2048;
      double v93 = v79;
      _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEBUG, "historical mslp array element,timestamp,%f,meanSeaLevelPressure,%f,uncertainty,%f,pressureMeasurement,%f", buf, 0x2Au);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C6180);
      }
      [(CLMeanSeaLevelPressureData *)v69 timestamp];
      [(CLMeanSeaLevelPressureData *)v69 meanSeaLevelPressure];
      [(CLMeanSeaLevelPressureData *)v69 uncertainty];
      [(CLMeanSeaLevelPressureData *)v69 pressureMeasurement];
      v81 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _sendHistoricalMeanSeaLevelPressureWithKSEstimatesBuffer:andCompletionBlock:]", "%s\n", v81);
      if (v81 != (char *)buf) {
        free(v81);
      }
    }
  }
LABEL_49:
  id v80 = [[[objc_msgSend(objc_msgSend(v82, "reverseObjectEnumerator"), "allObjects") mutableCopy];
  [v82 removeAllObjects];
  [v82 addObjectsFromArray:v80];
  (*((void (**)(id, id))a4 + 2))(a4, v82);
}

- (void)registerAndRunXPCActivity:(id)a3 withActivityIdentifier:(id)a4 andDescription:(id)a5
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100728CCC;
  handler[3] = &unk_1022C6048;
  handler[4] = self;
  handler[5] = a5;
  handler[6] = a3;
  xpc_activity_register((const char *)[a4 UTF8String], XPC_ACTIVITY_CHECK_IN, handler);
}

- (void)sendAnalyticsEventWithXpcTaskWaitingTime:(double)a3
{
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C6180);
  }
  v4 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v7 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "sent refresh mslp xpc task waiting time to CoreAnalytics,waitingTime,%f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C6180);
    }
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator sendAnalyticsEventWithXpcTaskWaitingTime:]", "%s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  AnalyticsSendEventLazy();
}

- (void)computeHistoricalMeanSeaLevelPressureWithStartTime:(double)a3 andEndTime:(double)a4 andCompletionBlock:(id)a5
{
  self->_refreshMslpXpcTaskScheduleTimestamp = CFAbsoluteTimeGetCurrent();
  -[CLContextManagerElevationProfileBase setRegisteredXPCTaskMSLP:](self->_elevationProfileContextManager, "setRegisteredXPCTaskMSLP:", 1, _NSConcreteStackBlock, 3221225472, sub_100729354, &unk_1022C6098, self, a5, *(void *)&a3, *(void *)&a4);
  [(CLElevationProfileEstimator *)self registerAndRunXPCActivity:&v9 withActivityIdentifier:+[NSString stringWithUTF8String:"com.apple.altimeter.historicalmslp"] andDescription:@"mslp estimation"];
}

- (BOOL)_queryVisitStateByTimestamp:(double)a3 withHistoricalVisits:(id)a4 andVisitSearchStartIndex:(int)a5
{
  if (a5 < 0) {
    return 0;
  }
  uint64_t v7 = a5;
  while (1)
  {
    [objc_msgSend(a4, "objectAtIndexedSubscript:", v7) startTime];
    if (v8 <= a3)
    {
      [objc_msgSend(a4, "objectAtIndexedSubscript:", v7) endTime];
      if (v9 >= a3) {
        break;
      }
    }
    [objc_msgSend(a4, "objectAtIndexedSubscript:", v7) startTime];
    if (v10 <= a3)
    {
      [objc_msgSend(a4, "objectAtIndexedSubscript:", v7) endTime];
      if (v11 == 0.0) {
        break;
      }
    }
    [objc_msgSend(a4, "objectAtIndexedSubscript:", v7) startTime];
    BOOL result = 0;
    if (v13 <= a3 && v7-- > 0) {
      continue;
    }
    return result;
  }
  return 1;
}

- (void)_gatherLocationArray:(id)a3 andElevationArray:(id)a4 andTaskType:(unint64_t)a5 withStartTime:(double)a6 andEndTime:(double)a7 andVisitArray:(id)a8 andVisitSearchStartIndex:(int)a9 andCompletionBlock:(id)a10
{
  if (+[CLContextManagerElevationProfileBase isQueryValidWithStartTime:andEndTime:](CLContextManagerElevationProfileBase, "isQueryValidWithStartTime:andEndTime:"))
  {
    if (self->_meanSeaLevelPressureSamplingPeriod + a6 >= a7) {
      double v16 = a7;
    }
    else {
      double v16 = self->_meanSeaLevelPressureSamplingPeriod + a6;
    }
    if ((a9 & 0x80000000) == 0)
    {
      [objc_msgSend(a8, "objectAtIndexedSubscript:", a9) endTime];
      if (v17 != 0.0) {
        [objc_msgSend(a8, "objectAtIndexedSubscript:", a9) endTime];
      }
    }
    objc_alloc_init((Class)NSMutableArray);
    -[CLContextManagerElevationProfile fetchLocationsWithStartTime:andEndTime:andBatchSize:andLocationArray:andVisitSearchStartIndex:andCompletionBlock:](self->_elevationProfileContextManager, "fetchLocationsWithStartTime:andEndTime:andBatchSize:andLocationArray:andVisitSearchStartIndex:andCompletionBlock:", self->_locationBatchSize, a6, v16);
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C6180);
    }
    uint64_t v18 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      double v21 = a6;
      __int16 v22 = 2048;
      double v23 = a7;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "query location and elevation with false startTime,%f,endTime,%f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 0))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C6180);
      }
      float v19 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLElevationProfileEstimator _gatherLocationArray:andElevationArray:andTaskType:withStartTime:andEndTime:andVisitArray:andVisitSearchStartIndex:andCompletionBlock:]", "%s\n", v19);
      if (v19 != (char *)buf) {
        free(v19);
      }
    }
    (*((void (**)(id))a10 + 2))(a10);
  }
}

- (void)_removeInVisitLocation:(id)a3 withVisitArray:(id)a4 andVisitSearchStartIndex:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = [a4 count];
  if ((v5 & 0x80000000) == 0 && v9)
  {
    id v11 = objc_alloc_init((Class)NSMutableIndexSet);
    if ((int)[a3 count] >= 1)
    {
      uint64_t v10 = 0;
      do
      {
        [objc_msgSend(a3, "objectAtIndexedSubscript:", v10) timestamp];
        if (-[CLElevationProfileEstimator _queryVisitStateByTimestamp:withHistoricalVisits:andVisitSearchStartIndex:](self, "_queryVisitStateByTimestamp:withHistoricalVisits:andVisitSearchStartIndex:", a4, v5))
        {
          [v11 addIndex:v10];
        }
        ++v10;
      }
      while (v10 < (int)[a3 count]);
    }
    if ([v11 count]) {
      [a3 removeObjectsAtIndexes:v11];
    }
  }
}

- (void)_decimateLocationsWithStartTime:(double)a3 andEndTime:(double)a4 andLocationArray:(id)a5 andElevationArray:(id)a6 andRawLocationArray:(id)a7 andRawElevationArray:(id)a8 andTaskType:(unint64_t)a9 andVisitArray:(id)a10 andVisitSearchStartIndex:(int)a11
{
  [objc_msgSend(a8, "firstObject") timestamp];
  double v17 = v16;
  id v18 = a8;
  [objc_msgSend(a8, "lastObject") timestamp];
  double v20 = v19;
  id v21 = objc_alloc_init((Class)NSMutableArray);
  id v22 = objc_alloc_init((Class)NSMutableArray);
  double v23 = [[CLElevationLocationFilter alloc] initWithWindowSize:self->_windowSize];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v24 = [a7 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v38;
    do
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(a7);
        }
        double v28 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v28 timestamp];
        if (v29 >= v17)
        {
          [v28 timestamp];
          if (v30 <= v20)
          {
            [v28 verticalAccuracy];
            if (v31 >= 0.0)
            {
              [v28 verticalAccuracy];
              if (v32 <= self->_locationMaxVerticalAccuracy)
              {
                [(CLElevationLocationFilter *)v23 append:v28];
                if ([(CLElevationLocationFilter *)v23 readyToFilter])
                {
                  [(CLElevationLocationFilter *)v23 fetchFilteredLocations:v22 withElevationArray:v18];
                  [(CLElevationProfileEstimator *)self _removeInVisitLocation:v22 withVisitArray:a10 andVisitSearchStartIndex:a11];
                  [(CLElevationProfileEstimator *)self _logValuesOfFilteredLocations:v22 andTaskType:a9];
                  [(CLElevationLocationFilter *)v23 aggregateFilteredLocations:v22 andAddTo:v21];
                  [v22 removeAllObjects];
                }
              }
            }
          }
        }
      }
      id v25 = [a7 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v25);
  }
  [(CLElevationLocationFilter *)v23 fetchFilteredLocations:v22 withElevationArray:v18];
  [(CLElevationProfileEstimator *)self _removeInVisitLocation:v22 withVisitArray:a10 andVisitSearchStartIndex:a11];
  [(CLElevationProfileEstimator *)self _logValuesOfFilteredLocations:v22 andTaskType:a9];
  [(CLElevationLocationFilter *)v23 aggregateFilteredLocations:v22 andAddTo:v21];
  [v22 removeAllObjects];
  [(CLElevationProfileEstimator *)self _decimateElevationsWithStartTime:a5 andEndTime:a6 andLocationArray:v21 andElevationArray:v18 andAggregatedLocationArray:a3 andRawElevationArray:a4];
}

- (void)_decimateElevationsWithStartTime:(double)a3 andEndTime:(double)a4 andLocationArray:(id)a5 andElevationArray:(id)a6 andAggregatedLocationArray:(id)a7 andRawElevationArray:(id)a8
{
  if ([a7 count])
  {
    [objc_msgSend(a7, "objectAtIndex:", 0) timestamp];
    double v14 = v13;
  }
  else
  {
    double v14 = 1.79769313e308;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v15 = [a8 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = 0;
    uint64_t v18 = *(void *)v35;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(a8);
        }
        double v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [v20 timestamp];
        if (v21 >= a3)
        {
          [v20 timestamp];
          if (v22 <= a4)
          {
            while (1)
            {
              [v20 timestamp];
              if (v14 >= v23) {
                break;
              }
              [objc_msgSend(a5, "lastObject") timestamp];
              if (v14 > v24)
              {
                [objc_msgSend(a6, "lastObject") timestamp];
                if (v14 > v25)
                {
                  uint64_t v26 = objc_alloc_init(CLElevationDBEntry);
                  id v27 = [a7 objectAtIndex:v17];
                  [v27 timestamp];
                  -[CLElevationDBEntry setTimestamp:](v26, "setTimestamp:");
                  [v27 interpPressure];
                  -[CLElevationDBEntry setPressure:](v26, "setPressure:");
                  [a5 addObject:v27];
                  [a6 addObject:v26];
                }
              }
              if (++v17 >= (unint64_t)[a7 count])
              {
                double v14 = 1.79769313e308;
              }
              else
              {
                [objc_msgSend(a7, "objectAtIndex:", v17) timestamp];
                double v14 = v28;
              }
            }
            [v20 timestamp];
            double v30 = v29;
            [objc_msgSend(a6, "lastObject") timestamp];
            if (v30 - v31 > self->_decimationPeriod) {
              [a6 addObject:v20];
            }
          }
        }
      }
      id v16 = [a8 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v16);
  }
}

- (void)_alignElevationArray:(id)a3 andLocationArray:(id)a4
{
  if ([a3 count] && objc_msgSend(a4, "count"))
  {
    [objc_msgSend(a3, "firstObject") timestamp];
    double v7 = v6 + -0.000001;
    [objc_msgSend(a3, "lastObject") timestamp];
    double v9 = v8 + 0.000001;
    [objc_msgSend(a4, "firstObject") timestamp];
    if (v7 >= v10 || (objc_msgSend(objc_msgSend(a4, "lastObject"), "timestamp"), v11 >= v9))
    {
      id v12 = objc_alloc_init((Class)NSMutableArray);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v13 = [a4 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(a4);
            }
            uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            [v17 timestamp];
            if (v18 > v7)
            {
              [v17 timestamp];
              if (v19 < v9) {
                [v12 addObject:v17];
              }
            }
          }
          id v14 = [a4 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v14);
      }
      [a4 removeAllObjects];
      [a4 addObjectsFromArray:v12];
    }
  }
  else
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C6180);
    }
    double v20 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      unsigned int v32 = [a3 count];
      __int16 v33 = 1024;
      unsigned int v34 = [a4 count];
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "zero elevation or location for kalman smoother,elevationCount,%d,locationCount,%d", buf, 0xEu);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C6180);
      }
      int v27 = 67109376;
      unsigned int v28 = [a3 count];
      __int16 v29 = 1024;
      unsigned int v30 = [a4 count];
      double v21 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _alignElevationArray:andLocationArray:]", "%s\n", v21);
      if (v21 != (char *)buf) {
        free(v21);
      }
    }
  }
}

- (void)_initKalmanFilter:(id)a3 withLocationArray:(id)a4 andElevationArray:(id)a5 andTaskType:(unint64_t)a6
{
  id v10 = [a4 firstObject];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v11 = [a5 countByEnumeratingWithState:&v41 objects:v57 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v42;
    float v14 = 0.0;
    double v15 = 1.79769313e308;
LABEL_3:
    id v16 = 0;
    double v17 = v15;
    while (1)
    {
      if (*(void *)v42 != v13) {
        objc_enumerationMutation(a5);
      }
      double v18 = *(void **)(*((void *)&v41 + 1) + 8 * (void)v16);
      [v18 timestamp];
      double v20 = v19;
      [v10 timestamp];
      double v15 = vabdd_f64(v20, v21);
      if (v15 > v17) {
        break;
      }
      [v18 pressure];
      float v14 = v22;
      id v16 = (char *)v16 + 1;
      double v17 = v15;
      if (v12 == v16)
      {
        id v12 = [a5 countByEnumeratingWithState:&v41 objects:v57 count:16];
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    float v14 = 0.0;
  }
  [v10 elevation];
  *(float *)&double v23 = v23;
  float v24 = sub_1014BE5D0(*(float *)&v23, v14);
  [objc_msgSend(a5, "firstObject") pressure];
  *(float *)&double v25 = v25;
  float v26 = sub_1001C1F30(*(float *)&v25, v24);
  uint64_t v39 = 0;
  float elevationInitialVar = self->_elevationInitialVar;
  float meanSeaLevelPressureInitialVar = self->_meanSeaLevelPressureInitialVar;
  sub_10072B6A0((uint64_t)&v36, (uint64_t)&elevationInitialVar);
  *(float *)&double v27 = v26;
  *(float *)&double v28 = v24;
  [a3 setFState:v27, v28];
  uint64_t v34 = v36;
  int v35 = v37;
  [a3 setFP:&v34];
  *(float *)&double v29 = self->_elevationProcessNoiseVar;
  *(float *)&double v30 = self->_meanSeaLevelPressureProcessNoiseVar;
  [a3 setFQ:v29, v30];
  LODWORD(v31) = 1.0;
  [a3 setFH:v31];
  if (self->_isVerboseLogging)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C6180);
    }
    unsigned int v32 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      unint64_t v52 = a6;
      __int16 v53 = 2048;
      double v54 = v26;
      __int16 v55 = 2048;
      double v56 = v24;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "initialize Kalman filter,taskType,%lu,elevation,%f,mslp,%f", buf, 0x20u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C6180);
      }
      int v45 = 134218496;
      unint64_t v46 = a6;
      __int16 v47 = 2048;
      double v48 = v26;
      __int16 v49 = 2048;
      double v50 = v24;
      __int16 v33 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _initKalmanFilter:withLocationArray:andElevationArray:andTaskType:]", "%s\n", v33);
      if (v33 != (char *)buf) {
        free(v33);
      }
    }
  }
}

- (double)_getTimestampWithLocationArray:(id)a3 atIndex:(unsigned int)a4
{
  if ((unint64_t)[a3 count] <= a4) {
    return 1.79769313e308;
  }
  id v6 = [a3 objectAtIndex:a4];

  [v6 timestamp];
  return result;
}

- (double)_getTimestampWithElevationArray:(id)a3 atIndex:(unsigned int)a4
{
  if ((unint64_t)[a3 count] <= a4) {
    return 1.79769313e308;
  }
  id v6 = [a3 objectAtIndex:a4];

  [v6 timestamp];
  return result;
}

- (void)_predictionUpdate:(id)a3 withElevation:(id)a4 withNextElevation:(id)a5 withTravelVelocity:(double)a6
{
  [a4 pressure];
  float v12 = v11;
  [a5 pressure];
  float v14 = v13;
  [a3 fState];
  float v16 = v15;
  if (a3)
  {
    [a3 fP];
  }
  else
  {
    int v47 = 0;
    uint64_t v46 = 0;
  }
  [a3 fQ];
  v45[0] = v17;
  [a5 timestamp];
  double v19 = v18;
  [a4 timestamp];
  double v21 = vabdd_f64(v19, v20);
  if (v12 == 0.0) {
    float v22 = 1.0;
  }
  else {
    float v22 = 101320.0 / v12;
  }
  float v23 = v21 * 100.0 / 3600.0 + v21 * 0.00200000009 * a6;
  float v24 = vabds_f32(v14, v12);
  float v25 = v24 * sub_10006CC8C(v12);
  sub_1014BE614(v12, v16);
  float v27 = v25 / v26;
  if (self->_isVerboseLogging)
  {
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C6180);
    }
    double v28 = qword_1024191E8;
    if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
    {
      double v39 = sub_10006CC8C(v12);
      sub_1014BE614(v12, v16);
      *(_DWORD *)buf = 134219776;
      *(double *)&uint8_t buf[4] = v23;
      *(_WORD *)float v65 = 2048;
      *(double *)&v65[2] = v22;
      __int16 v66 = 2048;
      double v67 = v27;
      __int16 v68 = 2048;
      double v69 = v24;
      __int16 v70 = 2048;
      double v71 = a6;
      __int16 v72 = 2048;
      double v73 = v21;
      __int16 v74 = 2048;
      double v75 = v39;
      __int16 v76 = 2048;
      double v77 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "mslp uncertainty model,deltaMslpDue2TimeAndDistance,%f,pressure2MslpFactor,%f,estBaroModelUncReflectedInMslp,%f,deltaPressure,%f,travelVelocity,%f,timeDifference,%f,slopeDiffDElevationDPressure,%f,dHdMslp,%f", buf, 0x52u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      double v42 = a6;
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C6180);
      }
      float v41 = v21 * 100.0 / 3600.0 + v21 * 0.00200000009 * a6;
      double v33 = v23;
      float v40 = v27;
      double v34 = v27;
      double v35 = v24;
      double v36 = sub_10006CC8C(v12);
      sub_1014BE614(v12, v16);
      int v48 = 134219776;
      double v49 = v33;
      __int16 v50 = 2048;
      double v51 = v22;
      __int16 v52 = 2048;
      double v53 = v34;
      __int16 v54 = 2048;
      double v55 = v35;
      __int16 v56 = 2048;
      double v57 = v42;
      __int16 v58 = 2048;
      double v59 = v21;
      __int16 v60 = 2048;
      double v61 = v36;
      __int16 v62 = 2048;
      double v63 = v37;
      long long v38 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _predictionUpdate:withElevation:withNextElevation:withTravelVelocity:]", "%s\n", v38);
      if (v38 != buf) {
        free(v38);
      }
      float v23 = v41;
      float v27 = v40;
    }
  }
  *(float *)&v45[1] = (float)(v27 + (float)(v22 * v23)) * (float)(v27 + (float)(v22 * v23));
  float v30 = sub_1001C1F30(v12, v16);
  [a3 fState];
  *(float *)&double v31 = v30;
  [a3 setFState:v31];
  sub_1014BE614(v12, v16);
  *(void *)buf = 0;
  *(_DWORD *)&buf[8] = v32;
  *(_DWORD *)float v65 = 1065353216;
  [a3 setF01:];
  sub_10072BE74((uint64_t)&v46, (uint64_t)buf, (uint64_t)v45);
  uint64_t v43 = v46;
  int v44 = v47;
  [a3 setFP:&v43];
}

- (void)_measurementUpdate:(id)a3 withLocation:(id)a4
{
  if (a3)
  {
    [a3 fP];
  }
  else
  {
    int v29 = 0;
    uint64_t v28 = 0;
  }
  [a3 fH];
  float v7 = v6;
  float v9 = v8;
  *(float *)float v27 = v6;
  *(float *)&v27[1] = v8;
  [a4 verticalAccuracy];
  double v11 = v10;
  [a4 verticalAccuracy];
  *(float *)&double v12 = v11 * v12;
  int v31 = LODWORD(v12);
  [a4 elevation];
  *(float *)&double v11 = v13;
  [a3 fState];
  float v30 = *(float *)&v11 - (float)((float)(v7 * v14) + (float)(v9 * v15));
  LODWORD(v16) = 2139095039;
  [a3 setF01:v16];
  sub_10072C434((float *)&v28, (uint64_t)v27, (float *)&v31, &v30);
  float v18 = v17;
  float v20 = v19;
  uint64_t v25 = v28;
  int v26 = v29;
  [a3 setFP:&v25];
  [a3 fState];
  *(float *)&double v22 = v18 + v21;
  *(float *)&double v24 = v20 + v23;
  [a3 setFState:v22, v24];
}

- (BOOL)_rejectOutlyingLocation:(id)a3 withKFEstimates:(id)a4
{
  [a4 fState];
  double v6 = v5;
  [a3 elevation];
  double v8 = vabdd_f64(v6, v7);
  [a3 verticalAccuracy];
  return v8 > v9 * 5.0;
}

- (BOOL)_forwardProcessingWithLocationArray:(id)a3 andElevationArray:(id)a4 andKFEstimatesBuffer:(id)a5 andKeepAllLocations:(BOOL)a6 andTaskType:(unint64_t)a7
{
  double v80 = 0.0;
  double v11 = objc_alloc_init(CLKFRunningEstimates);
  unint64_t v77 = a7;
  [(CLElevationProfileEstimator *)self _initKalmanFilter:v11 withLocationArray:a3 andElevationArray:a4 andTaskType:a7];
  unsigned int v76 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
LABEL_2:
  uint64_t v14 = v13;
  while ((unint64_t)[a3 count] > v14
       || (unint64_t)[a4 count] > v12)
  {
    [(CLElevationProfileEstimator *)self _getTimestampWithLocationArray:a3 atIndex:v14];
    double v16 = v15;
    [(CLElevationProfileEstimator *)self _getTimestampWithElevationArray:a4 atIndex:v12];
    double v18 = v17 + -0.000001;
    if (v16 >= v17 + -0.000001) {
      double v19 = v17;
    }
    else {
      double v19 = v16;
    }
    if (v16 >= v17 + -0.000001)
    {
      if ((char *)[a4 count] - 1 == (unsigned char *)v12) {
        uint64_t v23 = v12;
      }
      else {
        uint64_t v23 = (v12 + 1);
      }
      id v24 = [a4 objectAtIndex:v12];
      id v25 = [a4 objectAtIndex:v23];
      [(CLElevationProfileEstimator *)self _predictionUpdate:v11 withElevation:v24 withNextElevation:v25 withTravelVelocity:v80];
      uint64_t v12 = (v12 + 1);
    }
    else
    {
      uint64_t v13 = (v14 + 1);
      if ((char *)[a3 count] - 1 == (unsigned char *)v14) {
        unint64_t v20 = v14;
      }
      else {
        unint64_t v20 = (v14 + 1);
      }
      id v21 = [a3 objectAtIndex:v14];
      id v22 = [a3 objectAtIndex:v20];
      if (!a6
        && [(CLElevationProfileEstimator *)self _rejectOutlyingLocation:v21 withKFEstimates:v11])
      {
        if (self->_isVerboseLogging)
        {
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C6180);
          }
          double v57 = qword_1024191E8;
          if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
          {
            [v21 timestamp];
            uint64_t v59 = v58;
            [v21 elevation];
            uint64_t v61 = v60;
            [v21 verticalAccuracy];
            *(_DWORD *)buf = 134218752;
            *(void *)&uint8_t buf[4] = v77;
            __int16 v94 = 2048;
            *(void *)double v95 = v59;
            *(_WORD *)&v95[8] = 2048;
            *(void *)&v95[10] = v61;
            *(_WORD *)&v95[18] = 2048;
            *(void *)&v95[20] = v62;
            _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "reject location outlier,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f", buf, 0x2Au);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C6180);
            }
            [v21 timestamp];
            uint64_t v64 = v63;
            [v21 elevation];
            uint64_t v66 = v65;
            [v21 verticalAccuracy];
            int v81 = 134218752;
            unint64_t v82 = v77;
            __int16 v83 = 2048;
            *(void *)double v84 = v64;
            *(_WORD *)&v84[8] = 2048;
            *(void *)&v84[10] = v66;
            *(_WORD *)&v84[18] = 2048;
            *(void *)&v84[20] = v67;
            __int16 v68 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _forwardProcessingWithLocationArray:andElevationArray:andKFEstimatesBuffer:andKeepAllLocations:andTaskType:]", "%s\n", v68);
            if (v68 != (char *)buf) {
              free(v68);
            }
          }
        }
        ++v76;
        goto LABEL_2;
      }
      if ((unint64_t)[a3 count] <= v20) {
        double v80 = 0.0;
      }
      else {
        [(CLElevationProfileEstimator *)self getTravelVelocity:&v80 withCurrLocation:v21 andNextLocation:v22];
      }
      [(CLElevationProfileEstimator *)self _measurementUpdate:v11 withLocation:v21];
      uint64_t v14 = v13;
    }
    int v26 = objc_alloc_init(CLKalmanFilterEstimates);
    [(CLKFRunningEstimates *)v11 fState];
    -[CLKalmanFilterEstimates setFState:](v26, "setFState:");
    if (v11) {
      [(CLKFRunningEstimates *)v11 fP];
    }
    else {
      memset(buf, 0, sizeof(buf));
    }
    sub_100730560((uint64_t)buf, 0, 0);
    -[CLKalmanFilterEstimates setFCovariance:](v26, "setFCovariance:");
    [(CLKalmanFilterEstimates *)v26 setIsMeasurement:v16 < v18];
    [(CLKalmanFilterEstimates *)v26 setTimestamp:v19];
    [(CLKFRunningEstimates *)v11 F01];
    -[CLKalmanFilterEstimates setF01:](v26, "setF01:");
    [a5 addObject:v26];
    if (self->_isVerboseLogging)
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C6180);
      }
      float v27 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
      {
        unsigned int v28 = [(CLKalmanFilterEstimates *)v26 isMeasurement];
        [(CLKalmanFilterEstimates *)v26 timestamp];
        uint64_t v30 = v29;
        [(CLKalmanFilterEstimates *)v26 fState];
        double v32 = v31;
        [(CLKalmanFilterEstimates *)v26 fState];
        double v34 = v33;
        [(CLKalmanFilterEstimates *)v26 fCovariance];
        double v36 = v35;
        [(CLKalmanFilterEstimates *)v26 fCovariance];
        double v38 = v37;
        [(CLKalmanFilterEstimates *)v26 fCovariance];
        double v40 = v39;
        [(CLKalmanFilterEstimates *)v26 fCovariance];
        *(_DWORD *)buf = 134220032;
        *(void *)&uint8_t buf[4] = v77;
        __int16 v94 = 1024;
        *(_DWORD *)double v95 = v28;
        *(_WORD *)&v95[4] = 2048;
        *(void *)&v95[6] = v30;
        *(_WORD *)&v95[14] = 2048;
        *(double *)&v95[16] = v32;
        *(_WORD *)&v95[24] = 2048;
        *(double *)&v95[26] = v34;
        __int16 v96 = 2048;
        double v97 = v36;
        __int16 v98 = 2048;
        double v99 = v38;
        __int16 v100 = 2048;
        double v101 = v40;
        __int16 v102 = 2048;
        double v103 = v41;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "enumerate KF estimates,taskType,%lu,isMeasurement,%d,timestamp,%f,elevation,%f,mslp,%f,P00,%f,P01,%f,P10,%f,P11,%f", buf, 0x58u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C6180);
        }
        unsigned int v42 = [(CLKalmanFilterEstimates *)v26 isMeasurement];
        [(CLKalmanFilterEstimates *)v26 timestamp];
        uint64_t v44 = v43;
        [(CLKalmanFilterEstimates *)v26 fState];
        double v46 = v45;
        [(CLKalmanFilterEstimates *)v26 fState];
        double v48 = v47;
        [(CLKalmanFilterEstimates *)v26 fCovariance];
        double v50 = v49;
        [(CLKalmanFilterEstimates *)v26 fCovariance];
        double v52 = v51;
        [(CLKalmanFilterEstimates *)v26 fCovariance];
        double v54 = v53;
        [(CLKalmanFilterEstimates *)v26 fCovariance];
        int v81 = 134220032;
        unint64_t v82 = v77;
        __int16 v83 = 1024;
        *(_DWORD *)double v84 = v42;
        *(_WORD *)&v84[4] = 2048;
        *(void *)&v84[6] = v44;
        *(_WORD *)&v84[14] = 2048;
        *(double *)&v84[16] = v46;
        *(_WORD *)&v84[24] = 2048;
        *(double *)&v84[26] = v48;
        __int16 v85 = 2048;
        double v86 = v50;
        __int16 v87 = 2048;
        double v88 = v52;
        __int16 v89 = 2048;
        double v90 = v54;
        __int16 v91 = 2048;
        double v92 = v55;
        __int16 v56 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _forwardProcessingWithLocationArray:andElevationArray:andKFEstimatesBuffer:andKeepAllLocations:andTaskType:]", "%s\n", v56);
        if (v56 != (char *)buf) {
          free(v56);
        }
      }
    }
  }
  double v69 = (double)v76 / (double)(unint64_t)[a3 count];
  double maxOutlierRatio = self->_maxOutlierRatio;
  if (!a6)
  {
    if (qword_1024190D0 != -1) {
      dispatch_once(&qword_1024190D0, &stru_1022C61A0);
    }
    double v71 = qword_1024190D8;
    if (os_log_type_enabled((os_log_t)qword_1024190D8, OS_LOG_TYPE_DEBUG))
    {
      id v72 = [a3 count];
      *(_DWORD *)buf = 134219008;
      *(void *)&uint8_t buf[4] = v77;
      __int16 v94 = 2048;
      *(void *)double v95 = v76;
      *(_WORD *)&v95[8] = 2048;
      *(void *)&v95[10] = v72;
      *(_WORD *)&v95[18] = 2048;
      *(double *)&v95[20] = v69;
      *(_WORD *)&v95[28] = 1024;
      *(_DWORD *)&v95[30] = v69 > maxOutlierRatio;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEBUG, "outlier rejection summary,taskType,%lu,outlierCount,%lu,totalCount,%lu,outlierRatio,%f,isRepeatKF,%d", buf, 0x30u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024190D0 != -1) {
        dispatch_once(&qword_1024190D0, &stru_1022C61A0);
      }
      id v74 = [a3 count];
      int v81 = 134219008;
      unint64_t v82 = v77;
      __int16 v83 = 2048;
      *(void *)double v84 = v76;
      *(_WORD *)&v84[8] = 2048;
      *(void *)&v84[10] = v74;
      *(_WORD *)&v84[18] = 2048;
      *(double *)&v84[20] = v69;
      *(_WORD *)&v84[28] = 1024;
      *(_DWORD *)&v84[30] = v69 > maxOutlierRatio;
      double v75 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _forwardProcessingWithLocationArray:andElevationArray:andKFEstimatesBuffer:andKeepAllLocations:andTaskType:]", "%s\n", v75);
      if (v75 != (char *)buf) {
        free(v75);
      }
    }
  }
  return v69 > maxOutlierRatio;
}

- (void)getTravelVelocity:(double *)a3 withCurrLocation:(id)a4 andNextLocation:(id)a5
{
  [a5 timestamp];
  double v9 = v8;
  [a4 timestamp];
  double v11 = v9 - v10;
  double v12 = 0.0;
  if (v11 != 0.0)
  {
    [a4 latitude];
    double v14 = v13;
    [a4 longitude];
    double v16 = v15;
    [a5 latitude];
    double v18 = v17;
    [a5 longitude];
    double v12 = fabs(fabs(sub_1000A3D9C(v14, v16, v18, v19)) / v11);
  }
  *a3 = v12;
}

- (int)_getLastPredictionIndexWithKFEstimatesBuffer:(id)a3 fromIndex:(int)a4
{
  do
  {
    int v6 = a4;
    if (a4 < 1) {
      break;
    }
    --a4;
  }
  while ([[objc_msgSend(objc_msgSend(a3, "objectAtIndex:", (v6 - 1)), "isMeasurement") isMeasurement];
  return v6 - 1;
}

- (void)_kalmanSmootherUpdateWithKFEstimatesBuffer:(id)a3 andKSEstimatesBuffer:(id)a4 andCurrPredictionIndex:(int)a5 andNextPredictionIndex:(int)a6
{
  uint64_t v10 = a6 - 1;
  [objc_msgSend(a3, "objectAtIndex:", v10) fState];
  float v83 = v12;
  float v84 = v11;
  [objc_msgSend(a3, "objectAtIndex:", v10) fCovariance];
  float v94 = v13;
  float v95 = v14;
  float v96 = v15;
  float v97 = v16;
  [objc_msgSend(a3, "objectAtIndex:", a6) fState];
  float v81 = v18;
  float v82 = v17;
  [objc_msgSend(a3, "objectAtIndex:", a6) fCovariance];
  float v20 = v19;
  float v22 = v21;
  float v24 = v23;
  float v26 = v25;
  *(float *)double v92 = v19;
  *(float *)&v92[1] = v21;
  *(float *)&v92[2] = v23;
  *(float *)&v92[3] = v25;
  v93[0] = 0;
  v93[2] = 0;
  [objc_msgSend(a3, "objectAtIndex:", a6) F01];
  v93[1] = v27;
  v93[3] = 1065353216;
  [objc_msgSend(a4, "lastObject") fState];
  float v29 = v28;
  float v31 = v30;
  [objc_msgSend(a4, "lastObject") fCovariance];
  float v79 = v33;
  float v80 = v32;
  float v35 = v34;
  float v37 = v36;
  float v38 = sub_10072D7DC((uint64_t)&v94, (uint64_t)v93);
  sub_10072D8D8((uint64_t)v89, v38, v39, v40, v41);
  sub_10072D8D8((uint64_t)v91, v20, v22, v24, v26);
  sub_10072B6A0((uint64_t)v86, (uint64_t)v91);
  unint64_t v42 = 0;
  char v43 = 1;
  do
  {
    char v44 = v43;
    int v45 = *(_DWORD *)sub_1007288D0((uint64_t)v89, 0, v42);
    *(_DWORD *)sub_1007286F4((uint64_t)v90, 0) = v45;
    int v46 = *(_DWORD *)sub_1007288D0((uint64_t)v89, 1uLL, v42);
    *(_DWORD *)sub_1007286F4((uint64_t)v90, 1uLL) = v46;
    sub_10072D9B0((uint64_t)v86, (uint64_t)v90);
    int v47 = *(_DWORD *)sub_1007286F4((uint64_t)v90, 0);
    *(_DWORD *)sub_1007288D0((uint64_t)v87, 0, v42) = v47;
    int v48 = *(_DWORD *)sub_1007286F4((uint64_t)v90, 1uLL);
    float v49 = (_DWORD *)sub_1007288D0((uint64_t)v87, 1uLL, v42);
    char v43 = 0;
    *float v49 = v48;
    unint64_t v42 = 1;
  }
  while ((v44 & 1) != 0);
  sub_10072D8D8((uint64_t)v88, v87[0], v87[1], v87[2], v87[3]);
  double v50 = objc_alloc_init(CLKalmanSmootherEstimates);
  [objc_msgSend(a3, "objectAtIndex:", a5) timestamp];
  -[CLKalmanSmootherEstimates setTimestamp:](v50, "setTimestamp:");
  *(float *)buf = v29 - v82;
  *(float *)&unint64_t v102 = v31 - v81;
  *(float *)&double v51 = v84 + sub_10072DC68((uint64_t)v88, (float *)buf);
  *(float *)&double v53 = v83 + v52;
  -[CLKalmanSmootherEstimates setFState:](v50, "setFState:", v51, v53);
  float v54 = v94;
  float v55 = v95;
  float v56 = v96;
  float v57 = v97;
  v85[0] = sub_10072DD84((uint64_t)v92, v80, v79, v35, v37);
  v85[1] = v58;
  v85[2] = v59;
  v85[3] = v60;
  float v98 = sub_10072D7DC((uint64_t)v88, (uint64_t)v85);
  unint64_t v99 = __PAIR64__(v62, v61);
  v100[0] = v63;
  *(float *)buf = sub_10072D7DC((uint64_t)&v98, (uint64_t)v87);
  unint64_t v102 = __PAIR64__(v65, v64);
  v103[0] = v66;
  *(float *)&double v67 = sub_10072DD18((uint64_t)buf, v54, v55, v56, v57);
  [(CLKalmanSmootherEstimates *)v50 setFCovariance:v67];
  if ([a4 count])
  {
    [objc_msgSend(a4, "lastObject") timestamp];
    double v69 = v68;
    [(CLKalmanSmootherEstimates *)v50 timestamp];
    if (v69 < v70)
    {
      if (qword_1024191E0 != -1) {
        dispatch_once(&qword_1024191E0, &stru_1022C6180);
      }
      double v71 = qword_1024191E8;
      if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_INFO))
      {
        [(CLKalmanSmootherEstimates *)v50 timestamp];
        unint64_t v73 = v72;
        [objc_msgSend(a4, "lastObject") timestamp];
        *(float *)buf = 3.9123e-34;
        unint64_t v102 = v73;
        LOWORD(v103[0]) = 2050;
        *(void *)((char *)v103 + 2) = v74;
        _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_INFO, "Time order error in Kalman smoother estimate,currEntryTimestamp,%{public}f,prevEntryTimestamp,%{public}f", buf, 0x16u);
      }
      if (sub_10013D1A0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_1024191E0 != -1) {
          dispatch_once(&qword_1024191E0, &stru_1022C6180);
        }
        [(CLKalmanSmootherEstimates *)v50 timestamp];
        unint64_t v76 = v75;
        [objc_msgSend(a4, "lastObject") timestamp];
        float v98 = 3.9123e-34;
        unint64_t v99 = v76;
        LOWORD(v100[0]) = 2050;
        *(void *)((char *)v100 + 2) = v77;
        double v78 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _kalmanSmootherUpdateWithKFEstimatesBuffer:andKSEstimatesBuffer:andCurrPredictionIndex:andNextPredictionIndex:]", "%s\n", v78);
        if (v78 != (char *)buf) {
          free(v78);
        }
      }
    }
  }
  [a4 addObject:v50];
}

- (void)_backwardProcessingWithKFEstimatesBuffer:(id)a3 andKSEstimatesBuffer:(id)a4
{
  id v7 = [a3 count];
  if (v7)
  {
    double v8 = objc_alloc_init(CLKalmanSmootherEstimates);
    id v9 = [a3 lastObject];
    [v9 timestamp];
    -[CLKalmanSmootherEstimates setTimestamp:](v8, "setTimestamp:");
    [v9 fState];
    -[CLKalmanSmootherEstimates setFState:](v8, "setFState:");
    [v9 fCovariance];
    -[CLKalmanSmootherEstimates setFCovariance:](v8, "setFCovariance:");
    [a4 addObject:v8];

    uint64_t v10 = [(CLElevationProfileEstimator *)self _getLastPredictionIndexWithKFEstimatesBuffer:a3 fromIndex:v7];
    for (i = [(CLElevationProfileEstimator *)self _getLastPredictionIndexWithKFEstimatesBuffer:a3 fromIndex:v10]; (i & 0x80000000) == 0; uint64_t v10 = v12)
    {
      uint64_t v12 = i;
      [(CLElevationProfileEstimator *)self _kalmanSmootherUpdateWithKFEstimatesBuffer:a3 andKSEstimatesBuffer:a4 andCurrPredictionIndex:i andNextPredictionIndex:v10];
      uint64_t i = [(CLElevationProfileEstimator *)self _getLastPredictionIndexWithKFEstimatesBuffer:a3 fromIndex:v12];
    }
    [a3 removeAllObjects];
    id v13 = [[[objc_msgSend(objc_msgSend(objc_msgSend(a4, "reverseObjectEnumerator"), "allObjects"), "mutableCopy");
    [a4 removeAllObjects];
    [a4 addObjectsFromArray:v13];
  }
}

- (void)_elevationBatchProcessingWithStartTime:(double)a3 andEndTime:(double)a4 andLocationBuffer:(id)a5 andKSEstimatesBuffer:(id)a6 andTaskType:(unint64_t)a7 andCompletionBlock:(id)a8
{
  if (qword_1024191E0 != -1) {
    dispatch_once(&qword_1024191E0, &stru_1022C6180);
  }
  uint64_t v12 = qword_1024191E8;
  if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    unint64_t v15 = a7;
    __int16 v16 = 2048;
    double v17 = a3;
    __int16 v18 = 2048;
    double v19 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "start elevation batch processing,taskType,%lu,startTime,%f,endTime,%f", buf, 0x20u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191E0 != -1) {
      dispatch_once(&qword_1024191E0, &stru_1022C6180);
    }
    id v13 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _elevationBatchProcessingWithStartTime:andEndTime:andLocationBuffer:andKSEstimatesBuffer:andTaskType:andCompletionBlock:]", "%s\n", v13);
    if (v13 != (char *)buf) {
      free(v13);
    }
  }
  objc_alloc_init((Class)NSMutableArray);
  -[CLContextManagerElevationProfile getStoredVisit:betweenStartTime:andEndTime:withCompletionBlock:](self->_elevationProfileContextManager, "getStoredVisit:betweenStartTime:andEndTime:withCompletionBlock:", a3, a4);
}

- (void)computeElevationProfileWithStartTime:(double)a3 andEndTime:(double)a4
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10072E974;
  v5[3] = &unk_1022C6160;
  *(double *)&v5[5] = a3;
  *(double *)&v5[6] = a4;
  v5[4] = self;
  [(CLContextManagerElevationProfileBase *)self->_elevationProfileContextManager setRegisteredXPCTaskElevationProfile:1];
  [(CLElevationProfileEstimator *)self registerAndRunXPCActivity:v5 withActivityIdentifier:+[NSString stringWithUTF8String:"com.apple.altimeter.historicalelevation"] andDescription:@"elevation profile calculation"];
}

- (void)_logValuesOfLocationArray:(id)a3 andElevationArray:(id)a4 andTaskType:(unint64_t)a5
{
  if (self->_isVerboseLogging)
  {
    if ([a3 count])
    {
      long long v46 = 0u;
      long long v47 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      id v6 = [a3 countByEnumeratingWithState:&v44 objects:v65 count:16];
      if (v6)
      {
        id v7 = v6;
        uint64_t v8 = *(void *)v45;
        do
        {
          id v9 = 0;
          do
          {
            if (*(void *)v45 != v8) {
              objc_enumerationMutation(a3);
            }
            uint64_t v10 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v9);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C6180);
            }
            float v11 = qword_1024191E8;
            if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
            {
              [v10 timestamp];
              uint64_t v13 = v12;
              [v10 elevation];
              uint64_t v15 = v14;
              [v10 verticalAccuracy];
              *(_DWORD *)buf = 134218752;
              unint64_t v58 = a5;
              __int16 v59 = 2048;
              uint64_t v60 = v13;
              __int16 v61 = 2048;
              uint64_t v62 = v15;
              __int16 v63 = 2048;
              uint64_t v64 = v16;
              _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "enumerate locations,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f", buf, 0x2Au);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1024191E0 != -1) {
                dispatch_once(&qword_1024191E0, &stru_1022C6180);
              }
              [v10 timestamp];
              uint64_t v18 = v17;
              [v10 elevation];
              uint64_t v20 = v19;
              [v10 verticalAccuracy];
              int v49 = 134218752;
              unint64_t v50 = a5;
              __int16 v51 = 2048;
              uint64_t v52 = v18;
              __int16 v53 = 2048;
              uint64_t v54 = v20;
              __int16 v55 = 2048;
              uint64_t v56 = v21;
              float v22 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _logValuesOfLocationArray:andElevationArray:andTaskType:]", "%s\n", v22);
              if (v22 != (char *)buf) {
                free(v22);
              }
            }
            id v9 = (char *)v9 + 1;
          }
          while (v7 != v9);
          id v23 = [a3 countByEnumeratingWithState:&v44 objects:v65 count:16];
          id v7 = v23;
        }
        while (v23);
      }
    }
    if ([a4 count])
    {
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v24 = [a4 countByEnumeratingWithState:&v40 objects:v48 count:16];
      if (v24)
      {
        id v25 = v24;
        uint64_t v26 = *(void *)v41;
        do
        {
          int v27 = 0;
          do
          {
            if (*(void *)v41 != v26) {
              objc_enumerationMutation(a4);
            }
            float v28 = *(void **)(*((void *)&v40 + 1) + 8 * (void)v27);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C6180);
            }
            float v29 = qword_1024191E8;
            if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
            {
              [v28 timestamp];
              uint64_t v31 = v30;
              [v28 pressure];
              *(_DWORD *)buf = 134218496;
              unint64_t v58 = a5;
              __int16 v59 = 2048;
              uint64_t v60 = v31;
              __int16 v61 = 2048;
              uint64_t v62 = v32;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "enumerate elevations,taskType,%lu,timestamp,%f,pressure,%f", buf, 0x20u);
            }
            if (sub_10013D1A0(115, 2))
            {
              bzero(buf, 0x65CuLL);
              if (qword_1024191E0 != -1) {
                dispatch_once(&qword_1024191E0, &stru_1022C6180);
              }
              [v28 timestamp];
              uint64_t v34 = v33;
              [v28 pressure];
              int v49 = 134218496;
              unint64_t v50 = a5;
              __int16 v51 = 2048;
              uint64_t v52 = v34;
              __int16 v53 = 2048;
              uint64_t v54 = v35;
              float v36 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _logValuesOfLocationArray:andElevationArray:andTaskType:]", "%s\n", v36);
              if (v36 != (char *)buf) {
                free(v36);
              }
            }
            int v27 = (char *)v27 + 1;
          }
          while (v25 != v27);
          id v37 = [a4 countByEnumeratingWithState:&v40 objects:v48 count:16];
          id v25 = v37;
        }
        while (v37);
      }
    }
  }
}

- (void)_logValuesOfFilteredLocations:(id)a3 andTaskType:(unint64_t)a4
{
  if (self->_isVerboseLogging)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v5 = [a3 countByEnumeratingWithState:&v28 objects:v52 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v29;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(a3);
          }
          id v9 = *(void **)(*((void *)&v28 + 1) + 8 * (void)v8);
          if (qword_1024191E0 != -1) {
            dispatch_once(&qword_1024191E0, &stru_1022C6180);
          }
          uint64_t v10 = qword_1024191E8;
          if (os_log_type_enabled((os_log_t)qword_1024191E8, OS_LOG_TYPE_DEBUG))
          {
            [v9 timestamp];
            uint64_t v12 = v11;
            [v9 elevation];
            uint64_t v14 = v13;
            [v9 verticalAccuracy];
            uint64_t v16 = v15;
            [v9 interpPressure];
            *(_DWORD *)buf = 134219008;
            unint64_t v43 = a4;
            __int16 v44 = 2048;
            uint64_t v45 = v12;
            __int16 v46 = 2048;
            uint64_t v47 = v14;
            __int16 v48 = 2048;
            uint64_t v49 = v16;
            __int16 v50 = 2048;
            uint64_t v51 = v17;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "enumerate filtered locations,taskType,%lu,timestamp,%f,elevation,%f,verticalAccuracy,%f,interpPressure,%f", buf, 0x34u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191E0 != -1) {
              dispatch_once(&qword_1024191E0, &stru_1022C6180);
            }
            [v9 timestamp];
            uint64_t v19 = v18;
            [v9 elevation];
            uint64_t v21 = v20;
            [v9 verticalAccuracy];
            uint64_t v23 = v22;
            [v9 interpPressure];
            int v32 = 134219008;
            unint64_t v33 = a4;
            __int16 v34 = 2048;
            uint64_t v35 = v19;
            __int16 v36 = 2048;
            uint64_t v37 = v21;
            __int16 v38 = 2048;
            uint64_t v39 = v23;
            __int16 v40 = 2048;
            uint64_t v41 = v24;
            id v25 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLElevationProfileEstimator _logValuesOfFilteredLocations:andTaskType:]", "%s\n", v25);
            if (v25 != (char *)buf) {
              free(v25);
            }
          }
          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v26 = [a3 countByEnumeratingWithState:&v28 objects:v52 count:16];
        id v6 = v26;
      }
      while (v26);
    }
  }
}

- (CLContextManagerElevationProfile)elevationProfileContextManager
{
  return self->_elevationProfileContextManager;
}

- (void)setElevationProfileContextManager:(id)a3
{
  self->_elevationProfileContextManager = (CLContextManagerElevationProfile *)a3;
}

@end