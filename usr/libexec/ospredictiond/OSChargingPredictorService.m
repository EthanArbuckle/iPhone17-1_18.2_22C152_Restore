@interface OSChargingPredictorService
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSString)defaultsDomain;
- (NSXPCListener)listener;
- (OSChargingPredictorService)init;
- (OSIntelligenceTrialManager)trialManager;
- (OS_os_log)log;
- (_CDLocalContext)context;
- (id)readOverriddenModelOutput;
- (unint64_t)readOverridenModelScheme;
- (void)chargeDurationPredictionOfScheme:(unint64_t)a3 withHandler:(id)a4;
- (void)dealloc;
- (void)fixModelOutput:(id)a3 withHandler:(id)a4;
- (void)setContext:(id)a3;
- (void)setDefaultsDomain:(id)a3;
- (void)setListener:(id)a3;
- (void)setLog:(id)a3;
- (void)setTrialManager:(id)a3;
- (void)unfixModelOutputWithHandler:(id)a3;
- (void)writeOverriddenModelOutput:(id)a3;
@end

@implementation OSChargingPredictorService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001914C;
  block[3] = &unk_100064720;
  block[4] = a1;
  if (qword_10007A878 != -1) {
    dispatch_once(&qword_10007A878, block);
  }
  v2 = (void *)qword_10007A870;

  return v2;
}

- (OSChargingPredictorService)init
{
  v15.receiver = self;
  v15.super_class = (Class)OSChargingPredictorService;
  v2 = [(OSChargingPredictorService *)&v15 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.osintelligence", "chargingprediction");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    defaultsDomain = v2->_defaultsDomain;
    v2->_defaultsDomain = (NSString *)@"com.apple.osintelligence.chargingpredictor";

    uint64_t v6 = +[OSIntelligenceTrialManager sharedChargePredictionInstance];
    trialManager = v2->_trialManager;
    v2->_trialManager = (OSIntelligenceTrialManager *)v6;

    uint64_t v8 = +[_CDClientContext userContext];
    context = v2->_context;
    v2->_context = (_CDLocalContext *)v8;

    v10 = v2->_log;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Initializing delegate", v14, 2u);
    }
    v11 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.OSIntelligence.charging"];
    listener = v2->_listener;
    v2->_listener = v11;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener invalidate];
  listener = self->_listener;
  self->_listener = 0;

  v4.receiver = self;
  v4.super_class = (Class)OSChargingPredictorService;
  [(OSChargingPredictorService *)&v4 dealloc];
}

- (void)chargeDurationPredictionOfScheme:(unint64_t)a3 withHandler:(id)a4
{
  uint64_t v6 = (void (**)(id, id, void))a4;
  v7 = [(OSChargingPredictorService *)self readOverriddenModelOutput];
  if (!v7)
  {
    unint64_t v9 = [(OSChargingPredictorService *)self readOverridenModelScheme];
    if (v9 != 0xFFFFFFFF)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        v11 = log;
        v12 = +[NSNumber numberWithUnsignedInteger:v9];
        *(_DWORD *)buf = 138412290;
        unint64_t v27 = (unint64_t)v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Model scheme overriden to %@", buf, 0xCu);
      }
      a3 = v9;
    }
    v13 = self->_log;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v27 = a3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v13, OS_LOG_TYPE_DEFAULT, "Querying prediction service for prediction scheme: %lu", buf, 0xCu);
    }
    if (a3)
    {
      if (a3 >= 3)
      {
        switch(a3)
        {
          case 3uLL:
            v14 = off_1000645E8;
            break;
          case 5uLL:
            v14 = off_1000645F0;
            break;
          case 4uLL:
            objc_super v15 = [[OSChargingPredictorSignalsOnly alloc] initWithDefaultsDomain:self->_defaultsDomain withContextStore:self->_context withTrialManager:self->_trialManager];
            id v17 = [(OSChargingPredictorSignalsOnly *)v15 chargingDecisionWithLog:self->_log];
            goto LABEL_19;
          default:
            objc_super v15 = 0;
LABEL_16:
            unsigned __int8 v16 = [(OSChargingPredictorSignalsOnly *)v15 isSufficientDataAvailable];
            if (v9 != 0xFFFFFFFF || (v16 & 1) != 0)
            {
              unint64_t v18 = +[OSIntelligenceUtilities currentBatteryLevelWithContext:self->_context];
              id v17 = +[OSIntelligenceUtilities lastPluggedInDate];
              v19 = +[NSDate date];
              if (v15) {
                [(OSChargingPredictorSignalsOnly *)v15 chargingDecision:v18 withPluginDate:v17 withPluginBatteryLevel:v19 forDate:self->_log withLog:(double)v18];
              }

              v20 = self->_log;
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                v21 = v20;
                v22 = +[NSNumber numberWithDouble:0.0];
                v23 = +[NSNumber numberWithDouble:0.0];
                v24 = +[NSNumber numberWithBool:0];
                *(_DWORD *)buf = 138412802;
                unint64_t v27 = (unint64_t)v22;
                __int16 v28 = 2112;
                v29 = v23;
                __int16 v30 = 2112;
                v31 = v24;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Predictions at plug-in: \n Confidence: %@,\n Duration: %@,\n Decision: %@", buf, 0x20u);
              }
              id v25 = objc_alloc_init((Class)_OSChargingPredictorOutput);
              [v25 setConfidence:0.0];
              [v25 setMeetsSystemConfidenceThreshold:0];
              [v25 setChargingDuration:0.0 * 3600.0];
              v6[2](v6, v25, 0);

              goto LABEL_29;
            }
            id v17 = objc_alloc_init((Class)_OSChargingPredictorOutput);
            [v17 setConfidence:0.0];
            [v17 setMeetsSystemConfidenceThreshold:0];
            [v17 setChargingDuration:0.0];
LABEL_19:
            v6[2](v6, v17, 0);
LABEL_29:

            goto LABEL_30;
        }
      }
      else
      {
        v14 = off_1000645E0;
      }
    }
    else
    {
      v14 = &off_1000645F8;
    }
    objc_super v15 = (OSChargingPredictorSignalsOnly *)[objc_alloc(*v14) initWithDefaultsDomain:self->_defaultsDomain withContextStore:self->_context withTrialManager:self->_trialManager];
    goto LABEL_16;
  }
  uint64_t v8 = self->_log;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG)) {
    sub_1000426D8((uint64_t)v7, v8);
  }
  v6[2](v6, v7, 0);
LABEL_30:
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Listener received connection!", v15, 2u);
  }
  unint64_t v9 = [v7 valueForEntitlement:@"com.apple.osintelligence.charging"];
  if (v9
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v9 BOOLValue] & 1) != 0)
  {
    v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____OSChargingPredictorProtocol];
    [v7 setExportedInterface:v10];

    v11 = [[OSChargingPredictorServiceXPCProxy alloc] initWithObserver:self];
    [v7 setExportedObject:v11];

    [v7 resume];
    BOOL v12 = 1;
  }
  else
  {
    v13 = [(OSChargingPredictorService *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100041D30(v13);
    }

    BOOL v12 = 0;
  }

  return v12;
}

- (id)readOverriddenModelOutput
{
  os_log_t v3 = +[OSIntelligenceDefines chargingUserDefaults];
  objc_super v4 = [v3 objectForKey:@"overriddenModelOutput"];
  if (v4)
  {
    id v10 = 0;
    v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v10];
    id v6 = v10;
    if (v6)
    {
      log = self->_log;
      if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
        sub_100042750((uint64_t)v6, log);
      }
      id v8 = 0;
    }
    else
    {
      id v8 = v5;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)writeOverriddenModelOutput:(id)a3
{
  id v4 = a3;
  v5 = +[OSIntelligenceDefines chargingUserDefaults];
  if (v4)
  {
    uint64_t v8 = 0;
    id v6 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v8];
    [v5 setObject:v6 forKey:@"overriddenModelOutput"];
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEBUG)) {
      sub_1000427C8((os_log_t)log);
    }
    [v5 removeObjectForKey:@"overriddenModelOutput"];
  }
}

- (void)fixModelOutput:(id)a3 withHandler:(id)a4
{
  id v10 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = +[NSString stringWithFormat:@"Fixed model output = %@", v10];
  uint64_t v8 = [(OSChargingPredictorService *)self readOverriddenModelOutput];
  if (v8)
  {
    uint64_t v9 = +[NSString stringWithFormat:@"Replaced fixed output %@ with %@", v8, v10];

    id v7 = (void *)v9;
  }
  [(OSChargingPredictorService *)self writeOverriddenModelOutput:v10];
  v6[2](v6, v7);
}

- (void)unfixModelOutputWithHandler:(id)a3
{
  id v4 = (void (**)(id, __CFString *))a3;
  uint64_t v5 = [(OSChargingPredictorService *)self readOverriddenModelOutput];
  id v7 = (id)v5;
  if (v5)
  {
    id v6 = +[NSString stringWithFormat:@"Unfixed model output (previously fixed to be %@)", v5];
  }
  else
  {
    id v6 = @"Nothing to be unfixed";
  }
  [(OSChargingPredictorService *)self writeOverriddenModelOutput:0];
  v4[2](v4, v6);
}

- (unint64_t)readOverridenModelScheme
{
  v2 = +[OSIntelligenceDefines chargingUserDefaults];
  os_log_t v3 = [v2 objectForKey:@"modelType"];

  if (v3) {
    unint64_t v4 = (unint64_t)[v2 integerForKey:@"modelType"];
  }
  else {
    unint64_t v4 = 0xFFFFFFFFLL;
  }

  return v4;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSString)defaultsDomain
{
  return self->_defaultsDomain;
}

- (void)setDefaultsDomain:(id)a3
{
}

- (OSIntelligenceTrialManager)trialManager
{
  return self->_trialManager;
}

- (void)setTrialManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trialManager, 0);
  objc_storeStrong((id *)&self->_defaultsDomain, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end