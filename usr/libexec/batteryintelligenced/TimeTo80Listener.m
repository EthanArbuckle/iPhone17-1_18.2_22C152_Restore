@interface TimeTo80Listener
+ (id)sharedInstance;
- (BOOL)canComputeCoreAnalyticsMetrics;
- (OS_dispatch_queue)collectionQueue;
- (TimeTo80Listener)init;
- (_CDContext)context;
- (_CDContextualChangeRegistration)contextStoreRegistration;
- (id)getTT80EstimatesFromDate:(id)a3 toDate:(id)a4 limit:(unint64_t)a5;
- (void)computeAndSendCoreAnalyticsMetrics;
- (void)deregisterFromContextStoreNotification;
- (void)postNotificationForChargeTimeEstimateUpdate;
- (void)runTT80ModelwithParams:(id)a3 andSetupNextAlarm:(BOOL)a4;
- (void)setCollectionQueue:(id)a3;
- (void)setContext:(id)a3;
- (void)setContextStoreRegistration:(id)a3;
- (void)setUpContextStoreRegistration;
- (void)setupConnectionListenerForTT80;
@end

@implementation TimeTo80Listener

+ (id)sharedInstance
{
  if (qword_100039708 != -1) {
    dispatch_once(&qword_100039708, &stru_100030B88);
  }
  v2 = (void *)qword_100039700;

  return v2;
}

- (TimeTo80Listener)init
{
  v21.receiver = self;
  v21.super_class = (Class)TimeTo80Listener;
  v2 = [(TimeTo80Listener *)&v21 init];
  if (v2)
  {
    uint64_t v3 = sub_100016A74("TimeTo80Listener");
    v4 = (void *)qword_100039710;
    qword_100039710 = v3;

    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.batteryintelligence.timeto80listener"];
    v6 = (void *)qword_100039718;
    qword_100039718 = (uint64_t)v5;

    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.batteryintelligence.collectionqueue", v7);
    collectionQueue = v2->_collectionQueue;
    v2->_collectionQueue = (OS_dispatch_queue *)v8;

    v10 = +[BatteryIntelligenceNotificationManager sharedInstance];
    [(TimeTo80Listener *)v2 setUpContextStoreRegistration];
    v11 = v2;
  }
  else
  {
    BOOL v12 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v12) {
      sub_100022050(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }

  return v2;
}

- (void)setUpContextStoreRegistration
{
  uint64_t v3 = +[_CDClientContext userContext];
  [(TimeTo80Listener *)self setContext:v3];

  v4 = +[_CDContextQueries keyPathForBatteryLevel];
  id v5 = +[_CDContextQueries keyPathForBatteryStateDataDictionary];
  v6 = +[_CDContextualPredicate predicateForKeyPath:v4, @"SELF.%@.value.externalConnected = %@ AND SELF.%@.value = %@", v5, &__kCFBooleanTrue, v4, &off_100033B20 withFormat];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100018940;
  v13[3] = &unk_100030BD8;
  v13[4] = self;
  v7 = objc_retainBlock(v13);
  dispatch_queue_t v8 = +[_CDContextualChangeRegistration localWakingRegistrationWithIdentifier:@"com.apple.batteryintelligence.tt80-listener" contextualPredicate:v6 clientIdentifier:@"com.apple.batteryintelligenced.contextstore-registration" callback:v7];
  [(TimeTo80Listener *)self setContextStoreRegistration:v8];

  v9 = [(TimeTo80Listener *)self context];
  v10 = [(TimeTo80Listener *)self contextStoreRegistration];
  [v9 registerCallback:v10];

  v11 = qword_100039710;
  if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Registered to context store.", buf, 2u);
  }
}

- (BOOL)canComputeCoreAnalyticsMetrics
{
  id v2 = [(id)qword_100039718 integerForKey:@"monotonicPluginTimeInSeconds"];
  unsigned int v3 = [(id)qword_100039718 BOOLForKey:@"caMetricsComputed"];
  *(void *)v11 = 0;
  *(void *)&v11[8] = 0;
  clock_gettime(_CLOCK_MONOTONIC_RAW, (timespec *)v11);
  uint64_t v4 = *(void *)v11;
  if (!v2)
  {
    BOOL v7 = os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_ERROR);
    if (!v7) {
      return v7;
    }
    sub_100022114();
    goto LABEL_5;
  }
  if (v3)
  {
    id v5 = qword_100039710;
    BOOL v6 = os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v7) = 0;
    if (!v6) {
      return v7;
    }
    *(_WORD *)v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CA metrics have been computed once for the current charging session.\n", v11, 2u);
    goto LABEL_5;
  }
  unint64_t v8 = *(void *)v11 - (void)v2 - 1;
  v9 = qword_100039710;
  BOOL v7 = os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEBUG);
  if (v8 >> 6 > 0x2A2)
  {
    if (!v7) {
      return v7;
    }
    *(_DWORD *)v11 = 134218496;
    *(void *)&v11[4] = v4;
    *(_WORD *)&v11[12] = 2048;
    *(void *)&v11[14] = v2;
    __int16 v12 = 2048;
    double v13 = (double)(v4 - (uint64_t)v2);
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Cannot compute core analytics metrics:\ncurrentMonotonicTimeInSeconds - %llu\npluginMonotonicTimeInSeconds- %llu\ntimeDifferenceInSeconds- %0.2f", v11, 0x20u);
LABEL_5:
    LOBYTE(v7) = 0;
    return v7;
  }
  if (v7)
  {
    *(_DWORD *)v11 = 134218496;
    *(void *)&v11[4] = v2;
    *(_WORD *)&v11[12] = 2048;
    *(void *)&v11[14] = v4;
    __int16 v12 = 2048;
    double v13 = (double)(v4 - (uint64_t)v2);
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Can compute core analytics metrics between:\nplugInMonotonicTimeInSeconds - %llu\ncurrentMonotonicTimeInSeconds - %llu\ntimeDifferenceInSeconds - %0.0f", v11, 0x20u);
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (id)getTT80EstimatesFromDate:(id)a3 toDate:(id)a4 limit:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[NSPredicate predicateWithFormat:@"(subsystem == %@ AND category == %@)", @"BatteryIntelligence", @"TimeTo80"];
  v28[0] = @"model_id";
  v28[1] = @"start_soc";
  v28[2] = @"model_prediction";
  v10 = +[NSArray arrayWithObjects:v28 count:3];
  v11 = +[NSSet setWithArray:v10];

  id v12 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v7 endDate:v8];
  double v13 = qword_100039710;
  if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v7;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v12;
    _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Getting data from PPS for the following inputs:\ndateFrom - %@, dateTill - %@, interval - %@", buf, 0x20u);
  }
  sub_10001840C();
  id v14 = [objc_alloc((Class)PPSTimeSeriesRequest) initWithMetrics:v11 predicate:v9 timeFilter:v12 limitCount:a5 offsetCount:0 readDirection:1];
  if (v14)
  {
    uint64_t v15 = PerfPowerServicesGetData();
    id v16 = 0;
    uint64_t v17 = (void *)qword_100039710;
    if (v16)
    {
      if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_ERROR)) {
        sub_10001F610();
      }
      id v18 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = v17;
        id v20 = [v15 count];
        *(_DWORD *)buf = 134217984;
        id v23 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "PPS Response length: %lu", buf, 0xCu);
      }
      id v18 = v15;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_ERROR)) {
      sub_100022194();
    }
    id v18 = 0;
  }

  return v18;
}

- (void)computeAndSendCoreAnalyticsMetrics
{
  id v3 = [(id)qword_100039718 integerForKey:@"monotonicPluginTimeInSeconds"];
  *(void *)__tp = 0;
  *(void *)&__tp[8] = 0;
  clock_gettime(_CLOCK_MONOTONIC_RAW, (timespec *)__tp);
  uint64_t v4 = *(void *)__tp - (void)v3;
  double v5 = (double)(uint64_t)(*(void *)__tp - (void)v3);
  BOOL v6 = +[NSDate date];
  id v7 = +[NSDate dateWithTimeIntervalSinceNow:-v5];
  id v8 = [(TimeTo80Listener *)self getTT80EstimatesFromDate:v7 toDate:v6 limit:2];
  v9 = sub_100016ECC();
  v10 = v9;
  if (v9)
  {
    if (v8)
    {
      v50 = [v9 objectForKey:@"IsWireless"];

      v11 = +[TimeTo80Estimator sharedPredictor];
      id v12 = [v11 getModelID];

      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ([v12 length])
          {
            v47 = v10;
            v48 = v8;
            v49 = v6;
            long long v68 = 0u;
            long long v69 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            id obj = v8;
            id v13 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
            if (!v13) {
              goto LABEL_43;
            }
            id v14 = v13;
            uint64_t v59 = 1;
            uint64_t v15 = *(void *)v67;
            v64 = v7;
            while (1)
            {
              id v16 = 0;
              do
              {
                if (*(void *)v67 != v15) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v17 = *(void **)(*((void *)&v66 + 1) + 8 * (void)v16);
                id v18 = (void *)qword_100039710;
                if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEBUG))
                {
                  v28 = v18;
                  v29 = +[NSNumber numberWithUnsignedInteger:v59];
                  *(_DWORD *)__tp = 138412546;
                  *(void *)&__tp[4] = v29;
                  *(_WORD *)&__tp[12] = 2112;
                  *(void *)&__tp[14] = v17;
                  _os_log_debug_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Computing metrics for event #%@: %@", __tp, 0x16u);
                }
                uint64_t v19 = [v17 metricValueForKey:@"model_prediction"];
                id v20 = [v17 metricValueForKey:@"start_soc"];
                [v17 epochTimestamp];
                if (!v20
                  || (double v22 = v21, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                  || !v19
                  || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
                  || v22 == 0.0)
                {
                  __int16 v26 = (void *)qword_100039710;
                  if (!os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_39;
                  }
                  id v23 = v26;
                  id v27 = +[NSNumber numberWithUnsignedInteger:v59];
                  *(_DWORD *)__tp = 138412546;
                  *(void *)&__tp[4] = v27;
                  *(_WORD *)&__tp[12] = 2112;
                  *(void *)&__tp[14] = v17;
                  _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Found nil objects/incorrect timestamp within PPS Event. Not computing metrics for event #%@: %@", __tp, 0x16u);
                }
                else
                {
                  id v23 = +[NSDate dateWithTimeIntervalSince1970:v22];
                  if ([v23 compare:v7] != (id)-1)
                  {
                    v60 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v7 endDate:v23];
                    [v60 duration];
                    sub_100018554(5, v24);
                    os_log_t v62 = (os_log_t)objc_claimAutoreleasedReturnValue();
                    if (v62 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                    {
                      [v19 doubleValue];
                      double v32 = v31;
                      sub_100018454(v20);
                      os_log_t v57 = (os_log_t)objc_claimAutoreleasedReturnValue();
                      if (v57 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        double v35 = v32 * 3600.0;
                        uint64_t v36 = +[NSNumber numberWithDouble:(v5 - v35) / 60.0];
                        uint64_t v37 = +[NSNumber numberWithDouble:vabdd_f64(v5, v35) / 60.0];
                        v70[0] = @"prediction_error_in_mins";
                        v70[1] = @"prediction_error_absolute_in_mins";
                        v53 = (void *)v37;
                        v54 = (void *)v36;
                        v71[0] = v36;
                        v71[1] = v37;
                        v70[2] = @"is_wireless";
                        v52 = +[NSNumber numberWithBool:v50 != 0];
                        v71[2] = v52;
                        v71[3] = v12;
                        v70[3] = @"model_id";
                        v70[4] = @"short_charging_session";
                        v51 = +[NSNumber numberWithBool:v4 < 3601];
                        v71[4] = v51;
                        v70[5] = @"short_charging_session_predicted";
                        v38 = +[NSNumber numberWithBool:v35 <= 3600.0];
                        v71[5] = v38;
                        v71[6] = v57;
                        v70[6] = @"start_soc_bin";
                        v70[7] = @"time_of_prediction_offset_bin";
                        v71[7] = v62;
                        v70[8] = @"under_predicted";
                        v39 = +[NSNumber numberWithBool:v35 < v5];
                        v71[8] = v39;
                        os_log_t log = +[NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:9];

                        v40 = (void *)qword_100039710;
                        if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEBUG))
                        {
                          v44 = v40;
                          v45 = +[NSNumber numberWithUnsignedInteger:v59];
                          *(_DWORD *)__tp = 138412546;
                          *(void *)&__tp[4] = v45;
                          *(_WORD *)&__tp[12] = 2112;
                          *(void *)&__tp[14] = log;
                          _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "Dictionary sent to CA for event %@: %@", __tp, 0x16u);
                        }
                        +[BIMetricRecorder sendToCoreAnalytics:log forEvent:@"com.apple.bi.tt80_predictions" withTrialManager:0];
                        ++v59;
                      }
                      else
                      {
                        v33 = (void *)qword_100039710;
                        if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_ERROR))
                        {
                          loga = v33;
                          v34 = +[NSNumber numberWithUnsignedInteger:v59];
                          *(_DWORD *)__tp = 138412546;
                          *(void *)&__tp[4] = v34;
                          *(_WORD *)&__tp[12] = 2112;
                          *(void *)&__tp[14] = v17;
                          _os_log_error_impl((void *)&_mh_execute_header, loga, OS_LOG_TYPE_ERROR, "startSOCBin is nil. Not computing CA metrics for event #%@: %@", __tp, 0x16u);
                        }
                      }
                      id v7 = v64;
                    }
                    else
                    {
                      id v25 = (void *)qword_100039710;
                      if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_ERROR))
                      {
                        v58 = v25;
                        v43 = +[NSNumber numberWithUnsignedInteger:v59];
                        *(_DWORD *)__tp = 138412546;
                        *(void *)&__tp[4] = v43;
                        *(_WORD *)&__tp[12] = 2112;
                        *(void *)&__tp[14] = v17;
                        _os_log_error_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "timeOfPredictionOffsetBin is nil. Not computing CA metrics for event #%@: %@", __tp, 0x16u);
                      }
                      id v7 = v64;
                    }
                    v42 = v60;
                    v41 = v62;
                    goto LABEL_37;
                  }
                  v30 = (void *)qword_100039710;
                  if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_ERROR))
                  {
                    v63 = v30;
                    uint64_t v61 = +[NSNumber numberWithUnsignedInteger:v59];
                    *(_DWORD *)__tp = 138413058;
                    *(void *)&__tp[4] = v23;
                    *(_WORD *)&__tp[12] = 2112;
                    id v7 = v64;
                    *(void *)&__tp[14] = v64;
                    __int16 v73 = 2112;
                    uint64_t v74 = v61;
                    __int16 v75 = 2112;
                    v76 = v17;
                    v42 = v63;
                    _os_log_error_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "Event epoch timestamp(%@) is prior to recorded plugin timestamp(%@) within the listener. Not computing metrics for event #%@: %@", __tp, 0x2Au);
                    v41 = (void *)v61;
LABEL_37:

                    goto LABEL_38;
                  }
                }
                id v7 = v64;
LABEL_38:

LABEL_39:
                id v16 = (char *)v16 + 1;
              }
              while (v14 != v16);
              id v46 = [obj countByEnumeratingWithState:&v66 objects:v77 count:16];
              id v14 = v46;
              if (!v46)
              {
LABEL_43:

                id v8 = v48;
                BOOL v6 = v49;
                v10 = v47;
                goto LABEL_48;
              }
            }
          }
        }
      }
      if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_ERROR)) {
        sub_100022230();
      }
LABEL_48:
    }
    else if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_ERROR))
    {
      sub_1000221FC();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_ERROR))
  {
    sub_1000221C8();
  }
}

- (void)deregisterFromContextStoreNotification
{
  uint64_t v3 = [(TimeTo80Listener *)self contextStoreRegistration];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(TimeTo80Listener *)self context],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    BOOL v6 = qword_100039710;
    if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Deregistering from context store!", v9, 2u);
    }
    id v7 = [(TimeTo80Listener *)self context];
    id v8 = [(TimeTo80Listener *)self contextStoreRegistration];
    [v7 deregisterCallback:v8];
  }
  else if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_ERROR))
  {
    sub_100022264();
  }
}

- (void)setupConnectionListenerForTT80
{
  uint64_t v3 = (void *)os_transaction_create();
  uint64_t v21 = 0;
  double v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  char v24 = sub_100019CF0();
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100019DA4;
  v20[3] = &unk_100030C00;
  v20[4] = self;
  v20[5] = &v21;
  uint64_t v4 = objc_retainBlock(v20);
  double v5 = [(id)qword_100039718 objectForKey:@"LastConnectedState"];
  if (v5
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     || (unsigned int v6 = [v5 unsignedIntValue], v6 == *((unsigned __int8 *)v22 + 24))))
  {
    id v7 = qword_100039710;
    if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_INFO))
    {
      int v8 = *((unsigned __int8 *)v22 + 24);
      *(_DWORD *)buf = 67109120;
      int v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Connected state %u unchanged", buf, 8u);
    }
  }
  else
  {
    v9 = [(TimeTo80Listener *)self collectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A034;
    block[3] = &unk_100030C28;
    id v18 = v4;
    uint64_t v19 = &v21;
    dispatch_sync(v9, block);
  }
  *(_DWORD *)buf = 0;
  v10 = [(TimeTo80Listener *)self collectionQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10001A0AC;
  v14[3] = &unk_100030C50;
  id v16 = &v21;
  v11 = v4;
  id v15 = v11;
  uint32_t v12 = notify_register_dispatch("com.apple.system.powersources.source", (int *)buf, v10, v14);

  if (v12)
  {
    id v13 = qword_100039710;
    if (os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_ERROR)) {
      sub_100022298(v12, v13);
    }
  }

  _Block_object_dispose(&v21, 8);
}

- (void)runTT80ModelwithParams:(id)a3 andSetupNextAlarm:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(TimeTo80Listener *)self collectionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001A284;
  block[3] = &unk_100030C78;
  id v10 = v6;
  v11 = self;
  BOOL v12 = a4;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (void)postNotificationForChargeTimeEstimateUpdate
{
  if (sub_100016D78())
  {
    notify_post("com.apple.batteryintelligence.ChargeEstimateChanged");
    id v2 = qword_100039710;
    if (!os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v5 = 0;
    uint64_t v3 = "Posted notification for estimate changed";
    uint64_t v4 = (uint8_t *)&v5;
  }
  else
  {
    id v2 = qword_100039710;
    if (!os_log_type_enabled((os_log_t)qword_100039710, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_WORD *)buf = 0;
    uint64_t v3 = "Feature flag disabled: Not posting notification";
    uint64_t v4 = buf;
  }
  _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
}

- (OS_dispatch_queue)collectionQueue
{
  return self->_collectionQueue;
}

- (void)setCollectionQueue:(id)a3
{
}

- (_CDContextualChangeRegistration)contextStoreRegistration
{
  return self->_contextStoreRegistration;
}

- (void)setContextStoreRegistration:(id)a3
{
}

- (_CDContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contextStoreRegistration, 0);

  objc_storeStrong((id *)&self->_collectionQueue, 0);
}

@end