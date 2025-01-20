@interface ChargeDurationPredictor
+ (id)sharedInstance;
- (BOOL)inTypicalUsageEnvironment;
- (BOOL)lastPluggedInState;
- (BOOL)longChargeExpected;
- (BOOL)predictionAvailableForScheme:(unint64_t)a3;
- (BOOL)predictorReady;
- (BOOL)shortChargeExpected;
- (ChargeDurationPredictor)init;
- (DeviceContext)deviceContext;
- (NSMutableDictionary)predictorOutput;
- (OS_dispatch_queue)mainQueue;
- (OS_dispatch_queue)predictionQueryQueue;
- (OS_os_log)log;
- (_OSChargingPredictor)predictor;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)queryModelForScheme:(unint64_t)a3;
- (void)setDeviceContext:(id)a3;
- (void)setLastPluggedInState:(BOOL)a3;
- (void)setLog:(id)a3;
- (void)setMainQueue:(id)a3;
- (void)setPredictionQueryQueue:(id)a3;
- (void)setPredictor:(id)a3;
- (void)setPredictorOutput:(id)a3;
@end

@implementation ChargeDurationPredictor

+ (id)sharedInstance
{
  if (qword_10001BDE8 != -1) {
    dispatch_once(&qword_10001BDE8, &stru_100014390);
  }
  v2 = (void *)qword_10001BDE0;

  return v2;
}

- (ChargeDurationPredictor)init
{
  v18.receiver = self;
  v18.super_class = (Class)ChargeDurationPredictor;
  v2 = [(ChargeDurationPredictor *)&v18 init];
  if (v2)
  {
    os_log_t v3 = os_log_create("com.apple.powerexperienced", "chargedurationpredictor");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.powerexperienced.chargedurationpredictorquery", v5);
    predictionQueryQueue = v2->_predictionQueryQueue;
    v2->_predictionQueryQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = sub_100003E44();
    mainQueue = v2->_mainQueue;
    v2->_mainQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = +[_OSChargingPredictor predictor];
    predictor = v2->_predictor;
    v2->_predictor = (_OSChargingPredictor *)v10;

    uint64_t v12 = +[NSMutableDictionary dictionary];
    predictorOutput = v2->_predictorOutput;
    v2->_predictorOutput = (NSMutableDictionary *)v12;

    v2->_lastPluggedInState = IOPSDrawingUnlimitedPower();
    uint64_t v14 = +[DeviceContext sharedInstance];
    deviceContext = v2->_deviceContext;
    v2->_deviceContext = (DeviceContext *)v14;

    [(DeviceContext *)v2->_deviceContext addObserver:v2 forKeyPath:@"currentContext" options:3 context:0];
    if (!v2->_predictor)
    {
      v16 = v2->_log;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_10000CB04(v16);
      }
    }
  }
  return v2;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  v7 = [(ChargeDurationPredictor *)self deviceContext];
  uint64_t v8 = [v7 currentContext];
  v9 = [v8 objectForKeyedSubscript:@"kPluggedInContext"];
  id v10 = [v9 BOOLValue];

  if (v10 != [(ChargeDurationPredictor *)self lastPluggedInState])
  {
    v11 = [(ChargeDurationPredictor *)self log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109120;
      v14[1] = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "plugin state changed to %d", (uint8_t *)v14, 8u);
    }

    [(ChargeDurationPredictor *)self setLastPluggedInState:v10];
    if (![(ChargeDurationPredictor *)self lastPluggedInState])
    {
      uint64_t v12 = [(ChargeDurationPredictor *)self log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v14[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Clearing cached predictor output", (uint8_t *)v14, 2u);
      }

      v13 = [(ChargeDurationPredictor *)self predictorOutput];
      [v13 removeAllObjects];
    }
  }
}

- (BOOL)predictorReady
{
  return MKBDeviceUnlockedSinceBoot() != 0;
}

- (BOOL)predictionAvailableForScheme:(unint64_t)a3
{
  v4 = [(ChargeDurationPredictor *)self predictorOutput];
  v5 = +[NSNumber numberWithUnsignedInteger:a3];
  dispatch_queue_t v6 = [v4 objectForKeyedSubscript:v5];

  return v6 != 0;
}

- (void)queryModelForScheme:(unint64_t)a3
{
  if (!-[ChargeDurationPredictor predictionAvailableForScheme:](self, "predictionAvailableForScheme:"))
  {
    if (self->_predictor)
    {
      v5 = [(ChargeDurationPredictor *)self predictionQueryQueue];
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000044D4;
      v6[3] = &unk_1000143E0;
      v6[4] = self;
      v6[5] = a3;
      dispatch_async(v5, v6);
    }
  }
}

- (BOOL)longChargeExpected
{
  if (![(ChargeDurationPredictor *)self predictorReady]) {
    return 0;
  }
  if (![(ChargeDurationPredictor *)self predictionAvailableForScheme:3])
  {
    uint64_t v8 = [(ChargeDurationPredictor *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "LongChargeExpected:prediction not available. kicking off query", (uint8_t *)&v10, 2u);
    }

    [(ChargeDurationPredictor *)self queryModelForScheme:3];
    return 0;
  }
  os_log_t v3 = [(ChargeDurationPredictor *)self predictorOutput];
  v4 = [v3 objectForKeyedSubscript:&off_1000150C8];

  if (!v4) {
    goto LABEL_12;
  }
  v5 = [(ChargeDurationPredictor *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v6 = [(ChargeDurationPredictor *)self predictorOutput];
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "LongChargeExpected: %@", (uint8_t *)&v10, 0xCu);
  }
  if ([v4 meetsSystemConfidenceThreshold]) {
    BOOL v7 = 1;
  }
  else {
LABEL_12:
  }
    BOOL v7 = 0;

  return v7;
}

- (BOOL)shortChargeExpected
{
  if (![(ChargeDurationPredictor *)self predictorReady]) {
    return 0;
  }
  if (![(ChargeDurationPredictor *)self predictionAvailableForScheme:5])
  {
    uint64_t v8 = [(ChargeDurationPredictor *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "shortchargePrediction:prediction not available. kicking off query", (uint8_t *)&v10, 2u);
    }

    [(ChargeDurationPredictor *)self queryModelForScheme:5];
    return 0;
  }
  os_log_t v3 = [(ChargeDurationPredictor *)self predictorOutput];
  v4 = [v3 objectForKeyedSubscript:&off_1000150E0];

  if (!v4) {
    goto LABEL_12;
  }
  v5 = [(ChargeDurationPredictor *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v6 = [(ChargeDurationPredictor *)self predictorOutput];
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "shortChargeExpected: %@", (uint8_t *)&v10, 0xCu);
  }
  if ([v4 meetsSystemConfidenceThreshold]) {
    BOOL v7 = 1;
  }
  else {
LABEL_12:
  }
    BOOL v7 = 0;

  return v7;
}

- (BOOL)inTypicalUsageEnvironment
{
  if (![(ChargeDurationPredictor *)self predictorReady]) {
    return 0;
  }
  if (![(ChargeDurationPredictor *)self predictionAvailableForScheme:4])
  {
    uint64_t v8 = [(ChargeDurationPredictor *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "inTypicalUsageEnvironment:prediction not available. kicking off query", (uint8_t *)&v10, 2u);
    }

    [(ChargeDurationPredictor *)self queryModelForScheme:4];
    return 0;
  }
  os_log_t v3 = [(ChargeDurationPredictor *)self predictorOutput];
  v4 = [v3 objectForKeyedSubscript:&off_1000150F8];

  if (!v4) {
    goto LABEL_12;
  }
  v5 = [(ChargeDurationPredictor *)self log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_queue_t v6 = [(ChargeDurationPredictor *)self predictorOutput];
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "inTypicalUsageEnvironment: %@", (uint8_t *)&v10, 0xCu);
  }
  if ([v4 meetsSystemConfidenceThreshold]) {
    BOOL v7 = 1;
  }
  else {
LABEL_12:
  }
    BOOL v7 = 0;

  return v7;
}

- (BOOL)lastPluggedInState
{
  return self->_lastPluggedInState;
}

- (void)setLastPluggedInState:(BOOL)a3
{
  self->_lastPluggedInState = a3;
}

- (DeviceContext)deviceContext
{
  return (DeviceContext *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDeviceContext:(id)a3
{
}

- (_OSChargingPredictor)predictor
{
  return (_OSChargingPredictor *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPredictor:(id)a3
{
}

- (NSMutableDictionary)predictorOutput
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPredictorOutput:(id)a3
{
}

- (OS_os_log)log
{
  return (OS_os_log *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLog:(id)a3
{
}

- (OS_dispatch_queue)predictionQueryQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPredictionQueryQueue:(id)a3
{
}

- (OS_dispatch_queue)mainQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMainQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainQueue, 0);
  objc_storeStrong((id *)&self->_predictionQueryQueue, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_predictorOutput, 0);
  objc_storeStrong((id *)&self->_predictor, 0);

  objc_storeStrong((id *)&self->_deviceContext, 0);
}

@end