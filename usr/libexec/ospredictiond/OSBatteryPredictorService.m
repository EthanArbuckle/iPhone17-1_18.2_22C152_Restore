@interface OSBatteryPredictorService
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (OSBatteryPredictorService)init;
- (OS_os_log)log;
- (_OSLowSOCEventPredictor)highDrainPredictor;
- (void)dealloc;
- (void)predictLowSOCWithHandler:(id)a3;
- (void)setHighDrainPredictor:(id)a3;
- (void)setListener:(id)a3;
- (void)setLog:(id)a3;
@end

@implementation OSBatteryPredictorService

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010248;
  block[3] = &unk_100064720;
  block[4] = a1;
  if (qword_10007A858 != -1) {
    dispatch_once(&qword_10007A858, block);
  }
  v2 = (void *)qword_10007A850;

  return v2;
}

- (OSBatteryPredictorService)init
{
  v12.receiver = self;
  v12.super_class = (Class)OSBatteryPredictorService;
  v2 = [(OSBatteryPredictorService *)&v12 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.osintelligence", "battery");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    uint64_t v5 = +[_OSLowSOCEventPredictor sharedInstance];
    highDrainPredictor = v2->_highDrainPredictor;
    v2->_highDrainPredictor = (_OSLowSOCEventPredictor *)v5;

    v7 = v2->_log;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Initializing delegate", v11, 2u);
    }
    v8 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.OSIntelligence.battery"];
    listener = v2->_listener;
    v2->_listener = v8;

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
  v4.super_class = (Class)OSBatteryPredictorService;
  [(OSBatteryPredictorService *)&v4 dealloc];
}

- (void)predictLowSOCWithHandler:(id)a3
{
  objc_super v4 = (void (**)(id, id, void))a3;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_INFO, "Request for low SOC prediction", (uint8_t *)&v9, 2u);
  }
  id v6 = [_OSBatteryLowSOCPredictorOutput init];
  [v6 setConfidence:0.0];
  [v6 setLowSOCPredicted:0];
  [v6 setConfidence:0.0];
  [v6 setConfidenceThreshold:0.0];
  [v6 setModelName:@"NoOpModel"];
  [v6 setModelVersion:@"0.0"];
  v7 = self->_log;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v7, OS_LOG_TYPE_INFO, "Low SOC prediction output %@", (uint8_t *)&v9, 0xCu);
  }
  v8 = self->_log;
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
    sub_100041CEC((os_log_t)v8);
  }
  v4[2](v4, v6, 0);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)log, OS_LOG_TYPE_DEFAULT, "Listener received connection!", v15, 2u);
  }
  int v9 = [v7 valueForEntitlement:@"com.apple.osintelligence.battery"];
  if (v9
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v9 BOOLValue] & 1) != 0)
  {
    id v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____OSBatteryPredictorProtocol];
    [v7 setExportedInterface:v10];

    v11 = [[OSBatteryPredictorServiceXPCProxy alloc] initWithObserver:self];
    [v7 setExportedObject:v11];

    [v7 resume];
    BOOL v12 = 1;
  }
  else
  {
    v13 = [(OSBatteryPredictorService *)self log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100041D30(v13);
    }

    BOOL v12 = 0;
  }

  return v12;
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

- (_OSLowSOCEventPredictor)highDrainPredictor
{
  return self->_highDrainPredictor;
}

- (void)setHighDrainPredictor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highDrainPredictor, 0);
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_log, 0);
}

@end