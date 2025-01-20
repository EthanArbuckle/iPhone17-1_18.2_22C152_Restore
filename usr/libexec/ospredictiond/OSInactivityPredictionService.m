@interface OSInactivityPredictionService
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)overriddenToUseTimeRestrictionFromHour:(int *)a3 toHour:(int *)a4;
- (BOOL)upgradePredictorIfNeeded;
- (NSDate)dateOfHistorySufficiency;
- (OSInactivityPredictionService)init;
- (OS_dispatch_queue)mainQueue;
- (TRIClient)trialClient;
- (_OSInactivityNotificationManager)notificationManager;
- (_OSInactivityPredictor)predictor;
- (double)readOverriddenWaitTime;
- (id)readOverriddenModelOutput;
- (unint64_t)evaluatePredictorTypeWithLookahead:(double)a3 withIncrement:(double)a4 withActivity:(id)a5;
- (void)backedUpDataWithHandler:(id)a3;
- (void)deviceUsageDiagnosisWithHandler:(id)a3;
- (void)fixModelOutput:(id)a3 withHandler:(id)a4;
- (void)hasEnoughInactivityHistoryWithHandler:(id)a3;
- (void)inactivityHistoryDiagnosisWithHandler:(id)a3;
- (void)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withHandler:(id)a6;
- (void)longInactivityPredictionResultWithHandler:(id)a3;
- (void)longInactivityPredictionResultWithOptions:(int64_t)a3 withHandler:(id)a4;
- (void)modelDescriptionWithHandler:(id)a3;
- (void)modelMetadataWithHandler:(id)a3;
- (void)overrideRecommendedWaitTimeTo:(double)a3 withHandler:(id)a4;
- (void)recommendedWaitTimeWithHandler:(id)a3;
- (void)registerBackupTask;
- (void)registerDeviceTypeEvalution:(BOOL)a3;
- (void)restoreInactivityModelWithHandler:(id)a3;
- (void)restoreRecommendedWaitTimeWithHandler:(id)a3;
- (void)scheduleModelUpgradeAfterInterval:(double)a3;
- (void)setDateOfHistorySufficiency:(id)a3;
- (void)setMainQueue:(id)a3;
- (void)setNotificationManager:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setTrialClient:(id)a3;
- (void)unfixModelOutputWithHandler:(id)a3;
- (void)writeEvaluatedPredictorTypeToDefaults:(unint64_t)a3;
- (void)writeOverriddenModelOutput:(id)a3;
- (void)writeOverriddenWaitTime:(double)a3;
@end

@implementation OSInactivityPredictionService

+ (id)sharedInstance
{
  if (qword_10007A808 != -1) {
    dispatch_once(&qword_10007A808, &stru_1000647B0);
  }
  v2 = (void *)qword_10007A800;

  return v2;
}

- (OSInactivityPredictionService)init
{
  v37.receiver = self;
  v37.super_class = (Class)OSInactivityPredictionService;
  v2 = [(OSInactivityPredictionService *)&v37 initWithMachServiceName:@"com.apple.OSIntelligence"];
  if (!v2)
  {
LABEL_20:
    [(OSInactivityPredictionService *)v2 resume];
    v20 = v2;
    goto LABEL_21;
  }
  os_log_t v3 = os_log_create("com.apple.osintelligence", "inactivity.predictionservice");
  v4 = (void *)qword_10007A7F8;
  qword_10007A7F8 = (uint64_t)v3;

  v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v6 = dispatch_queue_create("com.apple.osintelligence.inactivityprediction.mainqueue", v5);
  mainQueue = v2->_mainQueue;
  v2->_mainQueue = (OS_dispatch_queue *)v6;

  if (v2->_mainQueue)
  {
    v8 = qword_10007A7F8;
    if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Initializing inactivity predictor...", buf, 2u);
    }
    v9 = +[_OSInactivityPredictor predictor];
    objc_storeStrong((id *)&v2->_predictor, v9);
    id v10 = objc_alloc_init((Class)_OSDataProtectionStateMonitor);
    v11 = +[_OSDataProtectionStateMonitor dataProtectionClassC];
    unsigned __int8 v12 = [v10 isDataAvailableFor:v11];

    if ((v12 & 1) == 0)
    {
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1000056D4;
      v35[3] = &unk_1000647D8;
      v36 = v2;
      [v10 setChangeHandler:v35];
    }
    dateOfHistorySufficiency = v2->_dateOfHistorySufficiency;
    v2->_dateOfHistorySufficiency = 0;

    if (([v9 requireEnoughHistory] & 1) == 0)
    {
      v14 = qword_10007A7F8;
      if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Predictor needs upgrade. Calculating date of history sufficiency...", buf, 2u);
      }
      id v34 = 0;
      uint64_t v15 = +[_OSInactivityPredictor projectedDateOfHistorySufficiencyWithError:&v34];
      id v16 = v34;
      v17 = v2->_dateOfHistorySufficiency;
      v2->_dateOfHistorySufficiency = (NSDate *)v15;

      if (v16 || !v2->_dateOfHistorySufficiency)
      {
        if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_ERROR)) {
          sub_100040AF8();
        }
        uint64_t v18 = +[NSDate dateWithTimeIntervalSinceNow:604800.0];
        v19 = v2->_dateOfHistorySufficiency;
        v2->_dateOfHistorySufficiency = (NSDate *)v18;
      }
      v21 = qword_10007A7F8;
      if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_INFO))
      {
        v22 = v2->_dateOfHistorySufficiency;
        *(_DWORD *)buf = 138412290;
        v39 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Projected to reach history sufficienty by: %@", buf, 0xCu);
      }
      [(NSDate *)v2->_dateOfHistorySufficiency timeIntervalSinceNow];
      [(OSInactivityPredictionService *)v2 scheduleModelUpgradeAfterInterval:fmin(v23, 604800.0)];
    }
    uint64_t v24 = +[TRIClient clientWithIdentifier:293];
    trialClient = v2->_trialClient;
    v2->_trialClient = (TRIClient *)v24;

    v26 = [(TRIClient *)v2->_trialClient levelForFactor:@"onlyDefaultModel" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    unsigned int v27 = [v26 BOOLeanValue];

    [(OSInactivityPredictionService *)v2 registerDeviceTypeEvalution:+[_OSInactivityPredictor hasEnoughInactivityHistory] & (v27 ^ 1)];
    [(OSInactivityPredictionService *)v2 setDelegate:v2];
    [(OSInactivityPredictionService *)v2 registerBackupTask];
    v28 = objc_alloc_init(_OSInactivityNotificationManager);
    notificationManager = v2->_notificationManager;
    v2->_notificationManager = v28;

    *(_DWORD *)buf = 0;
    v30 = dispatch_get_global_queue(-32768, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100005804;
    handler[3] = &unk_100064800;
    v33 = v2;
    notify_register_dispatch("com.apple.osintelligence.defaultmodelchanged", (int *)buf, v30, handler);

    goto LABEL_20;
  }
  v20 = 0;
LABEL_21:

  return v20;
}

- (void)registerBackupTask
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
  xpc_dictionary_set_BOOL(v2, XPC_ACTIVITY_ALLOW_BATTERY, 0);
  xpc_dictionary_set_int64(v2, XPC_ACTIVITY_INTERVAL, 345600);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100005994;
  handler[3] = &unk_100064828;
  id v5 = v2;
  id v3 = v2;
  xpc_activity_register("com.apple.osintelligence.inactivitybackup", XPC_ACTIVITY_CHECK_IN, handler);
}

- (unint64_t)evaluatePredictorTypeWithLookahead:(double)a3 withIncrement:(double)a4 withActivity:(id)a5
{
  v7 = (_xpc_activity_s *)a5;
  v8 = +[_OSInactivityPredictorTwoStage evaluator];
  v9 = +[_OSLockHistory sharedInstance];
  id v10 = +[NSDate now];
  v11 = [v9 getAllLockIntervalsEndingBefore:v10];

  objc_super v37 = v11;
  if ([v11 count])
  {
    p_cache = &OBJC_METACLASS___longDurationModelOutput.cache;
    if (a3 >= 0.0)
    {
      uint64_t v38 = 0;
      double v15 = 0.0;
      while (!xpc_activity_should_defer(v7))
      {
        id v16 = +[NSDate dateWithTimeIntervalSinceNow:v15];
        if ([v9 didDateTakePlaceDuringRecentLongLocks:v16])
        {
          id v39 = 0;
          v17 = [v8 longInactivityPredictionResultAtDate:v16 withLockHistory:v9 withOptions:1 withError:&v39];
          uint64_t v18 = (__CFString *)v39;
          if (v18)
          {
            v19 = p_cache[255];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v41 = v16;
              __int16 v42 = 2112;
              v43 = v18;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Evaluating... Error: Date %@ with error %@", buf, 0x16u);
            }
          }
          else
          {
            v21 = v7;
            v22 = v8;
            id v23 = [v17 confidenceLevel];
            uint64_t v24 = p_cache;
            id v25 = v23;
            v26 = v24;
            unsigned int v27 = v24[255];
            BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
            if (v25 == (id)2)
            {
              if (v28)
              {
                v35 = v27;
                v36 = [v17 description];
                *(_DWORD *)buf = 138412546;
                CFStringRef v41 = v16;
                __int16 v42 = 2112;
                v43 = v36;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Evaluating... High confidence at %@ with output %@", buf, 0x16u);
              }
              uint64_t v38 = 1;
              p_cache = v26;
              v8 = v22;
              v7 = v21;
              goto LABEL_24;
            }
            if (v28)
            {
              v29 = v27;
              v30 = [v17 description];
              *(_DWORD *)buf = 138412546;
              CFStringRef v41 = v16;
              __int16 v42 = 2112;
              v43 = v30;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Evaluating... no engagement for date %@ with output %@", buf, 0x16u);
            }
            uint64_t v31 = v38;
            if (!v38) {
              uint64_t v31 = 2;
            }
            uint64_t v38 = v31;
            p_cache = v26;
            v8 = v22;
            v7 = v21;
          }
        }
        else
        {
          v20 = p_cache[255];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v41 = v16;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Evaluating... Date %@ not worth querying because didn't happen during recent long locks", buf, 0xCu);
          }
          uint64_t v18 = v16;
        }

        double v15 = v15 + a4;
        if (v15 > a3) {
          goto LABEL_24;
        }
      }
      if (os_log_type_enabled((os_log_t)p_cache[255], OS_LOG_TYPE_ERROR)) {
        sub_100040BA0();
      }
      if (!xpc_activity_set_state(v7, 5) && os_log_type_enabled((os_log_t)p_cache[255], OS_LOG_TYPE_ERROR)) {
        sub_100040B6C();
      }
    }
    uint64_t v38 = 0;
LABEL_24:
    v32 = p_cache[255];
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v33 = @"default";
      unint64_t v14 = v38;
      if (v38 == 2) {
        CFStringRef v33 = @"alternate";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v41 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Evaluated device to be %@ model", buf, 0xCu);
    }
    else
    {
      unint64_t v14 = v38;
    }
  }
  else
  {
    v13 = qword_10007A7F8;
    if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No lock interval found--type unknown", buf, 2u);
    }
    unint64_t v14 = 0;
  }

  return v14;
}

- (void)registerDeviceTypeEvalution:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[OSIntelligenceDefines inactivityUserDefaults];
  id v6 = [v5 integerForKey:@"modelType"];
  if (!v3 || v6 == (id)2)
  {
    xpc_activity_unregister("com.apple.osintelligence.evaluateModelType");
    v19 = qword_10007A7F8;
    if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Not registering xpc to evaluate model type", buf, 2u);
    }
  }
  else
  {
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    xpc_dictionary_set_BOOL(v7, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    v8 = +[TRIClient clientWithIdentifier:293];
    trialClient = self->_trialClient;
    self->_trialClient = v8;

    id v10 = [(TRIClient *)self->_trialClient levelForFactor:@"nextLongInactivityIncrements" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    [v10 doubleValue];
    double v12 = v11;

    if (v12 <= 0.0) {
      double v13 = 3600.0;
    }
    else {
      double v13 = v12;
    }
    unint64_t v14 = [(TRIClient *)self->_trialClient levelForFactor:@"nextLongInactivityLookAhead" withNamespaceName:@"COREOS_PREDICTION_INACTIVITY"];
    [v14 doubleValue];
    double v16 = v15;

    if (v16 <= 0.0) {
      double v16 = 86400.0;
    }
    xpc_dictionary_set_int64(v7, XPC_ACTIVITY_INTERVAL, 28800);
    v17 = qword_10007A7F8;
    if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      uint64_t v26 = 0x40DC200000000000;
      __int16 v27 = 2048;
      double v28 = v16;
      __int16 v29 = 2048;
      double v30 = v13;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Scheduling evaluation with interval %f, lookahead seconds %f, and increments seconds %f", buf, 0x20u);
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100006198;
    v20[3] = &unk_100064850;
    id v21 = v7;
    v22 = self;
    double v23 = v16;
    double v24 = v13;
    id v18 = v7;
    xpc_activity_register("com.apple.osintelligence.evaluateModelType", XPC_ACTIVITY_CHECK_IN, v20);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = [v5 valueForEntitlement:@"com.apple.osintelligence.inactivity"];
  if (v6
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v6 BOOLValue] & 1) != 0)
  {
    xpc_object_t v7 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____OSInactivityPredictionProtocol_Private];
    [v5 setExportedInterface:v7];

    v8 = [[OSInactivityPredictionServiceXPCProxy alloc] initWithObserver:self];
    [v5 setExportedObject:v8];

    [v5 resume];
    BOOL v9 = 1;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_ERROR)) {
      sub_100040C6C();
    }
    BOOL v9 = 0;
  }

  return v9;
}

- (void)modelDescriptionWithHandler:(id)a3
{
  id v5 = a3;
  id v7 = [(OSInactivityPredictionService *)self predictor];
  id v6 = [v7 description];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);
}

- (void)modelMetadataWithHandler:(id)a3
{
  id v5 = a3;
  id v7 = [(OSInactivityPredictionService *)self predictor];
  id v6 = [v7 metadata];
  (*((void (**)(id, void *))a3 + 2))(v5, v6);
}

- (void)hasEnoughInactivityHistoryWithHandler:(id)a3
{
  id v4 = a3;
  (*((void (**)(id, BOOL))a3 + 2))(v4, +[_OSInactivityPredictor hasEnoughInactivityHistory]);
}

- (void)recommendedWaitTimeWithHandler:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(OSInactivityPredictionService *)self readOverriddenWaitTime];
  double v6 = v5;
  if (v5 == -777.0)
  {
    id v15 = [(OSInactivityPredictionService *)self predictor];
    [v15 recommendedWaitTime];
    v4[2](v4);
  }
  else
  {
    id v7 = qword_10007A7F8;
    if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEBUG)) {
      sub_100040CA0(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    ((void (*)(void (**)(void), double))v4[2])(v4, v6);
  }
}

- (void)inactivityHistoryDiagnosisWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[_OSInactivityPredictor userHistoryDiagnosis];
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (void)deviceUsageDiagnosisWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = +[_OSInactivityPredictor deviceUsageDiagnosis];
  (*((void (**)(id, id))a3 + 2))(v4, v5);
}

- (void)longInactivityPredictionResultWithHandler:(id)a3
{
}

- (void)longInactivityPredictionResultWithOptions:(int64_t)a3 withHandler:(id)a4
{
  double v6 = (void (**)(id, id, void))a4;
  uint64_t v28 = 0;
  if (![(OSInactivityPredictionService *)self overriddenToUseTimeRestrictionFromHour:(char *)&v28 + 4 toHour:&v28])goto LABEL_5; {
  id v7 = qword_10007A7F8;
  }
  if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    int64_t v30 = a3;
    __int16 v31 = 1024;
    *(_DWORD *)v32 = HIDWORD(v28);
    *(_WORD *)&v32[4] = 1024;
    *(_DWORD *)&v32[6] = v28;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "(%ld) User has overridden to use time restriction during (%d, %d)", buf, 0x18u);
  }
  uint64_t v8 = +[NSDate now];
  unsigned __int8 v9 = +[OSIntelligenceUtilities isInputDateInTimeRange:v8 withEarlyTimeOfDay:(double)SHIDWORD(v28) andLateTimeOfDay:(double)(int)v28];

  if ((v9 & 1) == 0)
  {
    uint64_t v26 = (void *)qword_10007A7F8;
    if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEBUG)) {
      sub_100040D98(v26, a3);
    }
    id v12 = [objc_alloc((Class)_OSInactivityPredictorOutput) initWithConfidenceLevel:0 andConfidenceValue:5 andPredictedDuration:0.0 andReason:0.0];
    v6[2](v6, v12, 0);
  }
  else
  {
LABEL_5:
    uint64_t v10 = [(OSInactivityPredictionService *)self readOverriddenModelOutput];
    if (v10)
    {
      uint64_t v11 = qword_10007A7F8;
      if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEBUG)) {
        sub_100040D10((uint64_t)v10, a3, v11);
      }
      v6[2](v6, v10, 0);
      id v12 = 0;
    }
    else
    {
      uint64_t v13 = [(OSInactivityPredictionService *)self predictor];
      id v27 = 0;
      uint64_t v14 = [v13 longInactivityPredictionResultWithOptions:a3 withError:&v27];
      id v12 = v27;

      if ([v14 confidenceLevel] == (id)2)
      {
        [v14 predictedDuration];
        if (v15 > 0.0)
        {
          double v16 = +[OSIntelligenceDefines inactivityUserDefaults];
          if ([v16 BOOLForKey:@"showNotifications"])
          {
            if (a3 == 1 || !a3 && ([v14 predictedDuration], v17 > 7200.0))
            {
              notificationManager = self->_notificationManager;
              [v14 predictedDuration];
              v20 = +[NSDate dateWithTimeIntervalSinceNow:v19 * 3600.0];
              id v21 = [(_OSInactivityNotificationManager *)notificationManager postEngagedUntilDate:v20 inactivityOptions:a3];
            }
          }
          v22 = (void *)qword_10007A7F8;
          if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEFAULT))
          {
            double v23 = v22;
            double v24 = [(OSInactivityPredictionService *)self predictor];
            id v25 = [v24 predictorType];
            *(_DWORD *)buf = 134218498;
            int64_t v30 = a3;
            __int16 v31 = 2112;
            *(void *)v32 = v25;
            *(_WORD *)&v32[8] = 2112;
            CFStringRef v33 = v14;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "(%ld) %@ predicts %@", buf, 0x20u);
          }
        }
      }
      ((void (**)(id, id, id))v6)[2](v6, v14, v12);
    }
  }
}

- (void)longInactivityPredictionResultAtDate:(id)a3 withTimeSinceInactive:(double)a4 withOptions:(int64_t)a5 withHandler:(id)a6
{
  id v10 = a3;
  uint64_t v11 = (void (**)(id, id, void))a6;
  uint64_t v22 = 0;
  if (![(OSInactivityPredictionService *)self overriddenToUseTimeRestrictionFromHour:(char *)&v22 + 4 toHour:&v22])goto LABEL_5; {
  if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEBUG))
  }
    sub_100040FB0();
  if (!+[OSIntelligenceUtilities isInputDateInTimeRange:v10 withEarlyTimeOfDay:(double)SHIDWORD(v22) andLateTimeOfDay:(double)(int)v22])
  {
    if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEBUG)) {
      sub_100040F48();
    }
    id v13 = [objc_alloc((Class)_OSInactivityPredictorOutput) initWithConfidenceLevel:0 andConfidenceValue:5 andPredictedDuration:0.0 andReason:0.0];
    v11[2](v11, v13, 0);
  }
  else
  {
LABEL_5:
    id v12 = [(OSInactivityPredictionService *)self readOverriddenModelOutput];
    if (v12)
    {
      if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEBUG)) {
        sub_100040EE0();
      }
      v11[2](v11, v12, 0);
      id v13 = 0;
    }
    else
    {
      if (+[_OSInactivityPredictor isDeviceRarelyUsedRecently])
      {
        uint64_t v14 = (void *)qword_10007A7F8;
        if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_ERROR)) {
          sub_100040BD4(v14);
        }
      }
      double v15 = [(OSInactivityPredictionService *)self predictor];
      id v21 = 0;
      double v16 = [v15 longInactivityPredictionResultAtDate:v10 withTimeSinceInactive:a5 withOptions:&v21 withError:a4];
      id v13 = v21;

      double v17 = (void *)qword_10007A7F8;
      if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_INFO))
      {
        id v18 = v17;
        double v19 = [(OSInactivityPredictionService *)self predictor];
        v20 = [v19 predictorType];
        *(_DWORD *)buf = 138412802;
        id v24 = v10;
        __int16 v25 = 2112;
        uint64_t v26 = v20;
        __int16 v27 = 2112;
        uint64_t v28 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "(At %@) %@ predicts %@", buf, 0x20u);
      }
      if (v13 && os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_ERROR)) {
        sub_100040E5C();
      }
      ((void (**)(id, id, id))v11)[2](v11, v16, v13);
    }
  }
}

- (void)fixModelOutput:(id)a3 withHandler:(id)a4
{
  id v10 = a3;
  double v6 = (void (**)(id, void *))a4;
  id v7 = +[NSString stringWithFormat:@"Fixed model output = %@", v10];
  uint64_t v8 = [(OSInactivityPredictionService *)self readOverriddenModelOutput];
  if (v8)
  {
    uint64_t v9 = +[NSString stringWithFormat:@"Replaced fixed output %@ with %@", v8, v10];

    id v7 = (void *)v9;
  }
  [(OSInactivityPredictionService *)self writeOverriddenModelOutput:v10];
  v6[2](v6, v7);
}

- (void)unfixModelOutputWithHandler:(id)a3
{
  id v4 = (void (**)(id, __CFString *))a3;
  uint64_t v5 = [(OSInactivityPredictionService *)self readOverriddenModelOutput];
  id v7 = (id)v5;
  if (v5)
  {
    double v6 = +[NSString stringWithFormat:@"Unfixed model output (previously fixed to be %@)", v5];
  }
  else
  {
    double v6 = @"Nothing to be unfixed";
  }
  [(OSInactivityPredictionService *)self writeOverriddenModelOutput:0];
  v4[2](v4, v6);
}

- (void)overrideRecommendedWaitTimeTo:(double)a3 withHandler:(id)a4
{
  if (a3 <= 0.0)
  {
    (*((void (**)(id, void))a4 + 2))(a4, 0);
  }
  else
  {
    double v6 = (void (**)(id, uint64_t))a4;
    [(OSInactivityPredictionService *)self writeOverriddenWaitTime:a3];
    v6[2](v6, 1);
  }
}

- (void)restoreRecommendedWaitTimeWithHandler:(id)a3
{
  id v4 = (void (**)(id, uint64_t))a3;
  [(OSInactivityPredictionService *)self writeOverriddenWaitTime:-777.0];
  v4[2](v4, 1);
}

- (void)restoreInactivityModelWithHandler:(id)a3
{
  id v4 = (void (**)(id, BOOL))a3;
  uint64_t v5 = +[OSIntelligenceDefines inactivityUserDefaults];
  [v5 removeObjectForKey:@"modelType"];

  double v6 = +[_OSInactivityPredictor predictor];
  [(OSInactivityPredictionService *)self setPredictor:v6];

  id v7 = [(OSInactivityPredictionService *)self predictor];
  v4[2](v4, v7 != 0);
}

- (void)backedUpDataWithHandler:(id)a3
{
  BOOL v3 = (void (**)(id, void *))a3;
  id v4 = objc_alloc_init(_OSInactivityPredictionBackupManager);
  uint64_t v5 = (void *)qword_10007A7F8;
  if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = v5;
    id v7 = [(_OSInactivityPredictionBackupManager *)v4 hydrateBackup];
    int v9 = 138412290;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v8 = [(_OSInactivityPredictionBackupManager *)v4 hydrateBackup];
  v3[2](v3, v8);
}

- (void)writeEvaluatedPredictorTypeToDefaults:(unint64_t)a3
{
  id v4 = +[OSIntelligenceDefines inactivityUserDefaults];
  [v4 setInteger:a3 forKey:@"predictorType"];
}

- (id)readOverriddenModelOutput
{
  xpc_object_t v2 = +[OSIntelligenceDefines inactivityUserDefaults];
  BOOL v3 = [v2 objectForKey:@"overriddenModelOutput"];
  if (v3)
  {
    id v8 = 0;
    id v4 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v3 error:&v8];
    id v5 = v8;
    if (v5)
    {
      if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_ERROR)) {
        sub_100041030();
      }
      id v6 = 0;
    }
    else
    {
      id v6 = v4;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)writeOverriddenModelOutput:(id)a3
{
  id v3 = a3;
  id v4 = +[OSIntelligenceDefines inactivityUserDefaults];
  if (v3)
  {
    uint64_t v6 = 0;
    id v5 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v6];
    [v4 setObject:v5 forKey:@"overriddenModelOutput"];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_DEBUG)) {
      sub_1000410A4();
    }
    [v4 removeObjectForKey:@"overriddenModelOutput"];
  }
}

- (double)readOverriddenWaitTime
{
  xpc_object_t v2 = +[OSIntelligenceDefines inactivityUserDefaults];
  id v3 = [v2 objectForKey:@"overriddenWaitTime"];

  if (v3)
  {
    [v2 doubleForKey:@"overriddenWaitTime"];
    double v5 = v4;
  }
  else
  {
    double v5 = -777.0;
  }

  return v5;
}

- (void)writeOverriddenWaitTime:(double)a3
{
  double v4 = +[OSIntelligenceDefines inactivityUserDefaults];
  id v5 = v4;
  if (a3 == -777.0) {
    [v4 removeObjectForKey:@"overriddenWaitTime"];
  }
  else {
    [v4 setDouble:@"overriddenWaitTime" forKey:a3];
  }
}

- (BOOL)overriddenToUseTimeRestrictionFromHour:(int *)a3 toHour:(int *)a4
{
  uint64_t v6 = +[OSIntelligenceDefines inactivityUserDefaults];
  id v7 = [v6 objectForKey:@"overriddenBedtime"];

  if (!v7
    || ([v6 objectForKey:@"overriddenWakeupTime"],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        !v8))
  {
LABEL_9:
    BOOL v10 = 0;
    goto LABEL_10;
  }
  *a3 = [v6 integerForKey:@"overriddenBedtime"];
  int v9 = [v6 integerForKey:@"overriddenWakeupTime"];
  *a4 = v9;
  if (*a3 > 0x17 || v9 < 0 || v9 >= 24)
  {
    if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_ERROR)) {
      sub_1000410E4();
    }
    goto LABEL_9;
  }
  BOOL v10 = 1;
LABEL_10:

  return v10;
}

- (void)scheduleModelUpgradeAfterInterval:(double)a3
{
  if (a3 < 86400.0) {
    a3 = 86400.0;
  }
  if (a3 <= 604800.0) {
    double v3 = a3;
  }
  else {
    double v3 = 604800.0;
  }
  objc_initWeak(&location, self);
  dispatch_time_t v4 = dispatch_walltime(0, 1000000000 * vcvtpd_s64_f64(v3));
  id v5 = dispatch_get_global_queue(-2, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007720;
  v6[3] = &unk_100064878;
  objc_copyWeak(&v7, &location);
  dispatch_after(v4, v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (BOOL)upgradePredictorIfNeeded
{
  double v3 = [(OSInactivityPredictionService *)self predictor];
  unsigned int v4 = [v3 requireEnoughHistory];

  if (v4)
  {
    id v5 = (void *)qword_10007A7F8;
    BOOL v6 = 1;
    if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_INFO))
    {
      id v7 = v5;
      id v8 = [(OSInactivityPredictionService *)self predictor];
      int v9 = [v8 predictorType];
      int v33 = 138412290;
      id v34 = (NSDate *)v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Predictor type is already history-aware: %@", (uint8_t *)&v33, 0xCu);

      goto LABEL_4;
    }
  }
  else
  {
    dateOfHistorySufficiency = self->_dateOfHistorySufficiency;
    if (!dateOfHistorySufficiency)
    {
      uint64_t v11 = +[_OSInactivityPredictor projectedDateOfHistorySufficiencyWithError:0];
      id v12 = self->_dateOfHistorySufficiency;
      self->_dateOfHistorySufficiency = v11;

      dateOfHistorySufficiency = self->_dateOfHistorySufficiency;
    }
    [(NSDate *)dateOfHistorySufficiency timeIntervalSinceNow];
    double v14 = v13;
    double v15 = qword_10007A7F8;
    BOOL v16 = os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_INFO);
    if (v14 <= 0.0)
    {
      if (v16)
      {
        id v18 = self->_dateOfHistorySufficiency;
        int v33 = 138412290;
        id v34 = v18;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Reached date of sufficiency of %@. Upgrading to the ML models...", (uint8_t *)&v33, 0xCu);
      }
      double v19 = +[_OSInactivityPredictor predictor];
      id v7 = v19;
      if (!v19) {
        goto LABEL_15;
      }
      v20 = [v19 predictorType];
      id v21 = [(OSInactivityPredictionService *)self predictor];
      uint64_t v22 = [v21 predictorType];
      unsigned int v23 = [v20 isEqualToString:v22];

      if (!v23)
      {
        [(OSInactivityPredictionService *)self setPredictor:v7];
        __int16 v27 = [(OSInactivityPredictionService *)self predictor];
        unsigned __int8 v28 = [v27 requireEnoughHistory];

        __int16 v29 = (void *)qword_10007A7F8;
        if (v28)
        {
          BOOL v6 = 1;
          if (!os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_INFO)) {
            goto LABEL_23;
          }
          int v9 = v29;
          int64_t v30 = [(OSInactivityPredictionService *)self predictor];
          __int16 v31 = [v30 predictorType];
          int v33 = 138412290;
          id v34 = v31;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Successfully upgraded the model to: %@", (uint8_t *)&v33, 0xCu);

LABEL_4:
LABEL_23:

          return v6;
        }
        if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_ERROR)) {
          sub_100041164(v29, self);
        }
      }
      else
      {
LABEL_15:
        id v24 = (void *)qword_10007A7F8;
        if (os_log_type_enabled((os_log_t)qword_10007A7F8, OS_LOG_TYPE_INFO))
        {
          __int16 v25 = v24;
          uint64_t v26 = [v7 predictorType];
          int v33 = 138412290;
          id v34 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "New predictor is nil or type remains the same as old model: %@. Upgrade aborted.", (uint8_t *)&v33, 0xCu);
        }
      }
      BOOL v6 = 0;
      goto LABEL_23;
    }
    if (v16)
    {
      double v17 = self->_dateOfHistorySufficiency;
      int v33 = 138412290;
      id v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Still haven't reached history sufficient. New projected date: %@", (uint8_t *)&v33, 0xCu);
    }
    return 0;
  }
  return v6;
}

- (OS_dispatch_queue)mainQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMainQueue:(id)a3
{
}

- (_OSInactivityPredictor)predictor
{
  return (_OSInactivityPredictor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPredictor:(id)a3
{
}

- (NSDate)dateOfHistorySufficiency
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDateOfHistorySufficiency:(id)a3
{
}

- (_OSInactivityNotificationManager)notificationManager
{
  return (_OSInactivityNotificationManager *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNotificationManager:(id)a3
{
}

- (TRIClient)trialClient
{
  return self->_trialClient;
}

- (void)setTrialClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialClient, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_dateOfHistorySufficiency, 0);
  objc_storeStrong((id *)&self->_predictor, 0);

  objc_storeStrong((id *)&self->_mainQueue, 0);
}

@end