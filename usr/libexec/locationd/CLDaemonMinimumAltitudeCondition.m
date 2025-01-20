@interface CLDaemonMinimumAltitudeCondition
- (BOOL)isAuthorized;
- (BOOL)valid;
- (id)initFromClientCondition:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 callbackHandler:(id)a8;
- (unint64_t)diagnosticMaskIfNonFunctional;
- (void)dealloc;
- (void)onElevationThresold:(float)a3 direction:(BOOL)a4;
- (void)setValid:(BOOL)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation CLDaemonMinimumAltitudeCondition

- (id)initFromClientCondition:(id)a3 clientKeyPath:(id)a4 authorizationContext:(id)a5 universe:(id)a6 identifier:(id)a7 callbackHandler:(id)a8
{
  [a3 altitude];
  v18.receiver = self;
  v18.super_class = (Class)CLDaemonMinimumAltitudeCondition;
  v13 = -[CLDaemonMinimumAltitudeCondition initWithAltitude:](&v18, "initWithAltitude:");
  if (v13)
  {
    if (qword_102419530 != -1) {
      dispatch_once(&qword_102419530, &stru_102323958);
    }
    v14 = qword_102419538;
    if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
    {
      [(CLDaemonMinimumAltitudeCondition *)v13 altitude];
      *(_DWORD *)buf = 68289539;
      int v20 = 0;
      __int16 v21 = 2082;
      v22 = "";
      __int16 v23 = 2049;
      uint64_t v24 = v15;
      __int16 v25 = 2050;
      v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#minimumAltitudeCondition created\", \"altitude\":\"%{private}f\", \"self\":\"%{public}p\"}", buf, 0x26u);
    }
    [(CLDaemonMinimumAltitudeCondition *)v13 setAuthorizationContext:a5];
    [(CLDaemonMinimumAltitudeCondition *)v13 setUniverse:a6];
    [(CLDaemonMinimumAltitudeCondition *)v13 setOnConditionUpdateCallbackHandler:a8];
    [(CLDaemonMinimumAltitudeCondition *)v13 setIdentifier:a7];
    v16 = (CLBarometerCalibrationProtocol *)[objc_msgSend(-[CLDaemonMinimumAltitudeCondition universe](v13, "universe"), "vendor") proxyForService:@"CLBarometerCalibration"];
    v13->_barometerCalibrationProxy = v16;
    -[CLBarometerCalibrationProtocol registerDelegate:inSilo:](v16, "registerDelegate:inSilo:", v13, [CLDaemonMinimumAltitudeCondition universe](v13, "universe") silo]);
    [(CLBarometerCalibrationProtocol *)v13->_barometerCalibrationProxy setDelegateEntityName:"CLDaemonMinimumAltitudeCondition"];
    [(CLDaemonMinimumAltitudeCondition *)v13 setValid:1];
    if ([(CLDaemonMinimumAltitudeCondition *)v13 isAuthorized]) {
      [(CLDaemonMinimumAltitudeCondition *)v13 startMonitoring];
    }
  }
  return v13;
}

- (void)dealloc
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323958);
  }
  v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    int v6 = 0;
    __int16 v7 = 2082;
    v8 = "";
    __int16 v9 = 2050;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#minimumAltitudeCondition dealloc\", \"self\":\"%{public}p\"}", buf, 0x1Cu);
  }
  [(CLDaemonMinimumAltitudeCondition *)self stopMonitoring];
  [(CLDaemonMinimumAltitudeCondition *)self setValid:0];

  self->_barometerCalibrationProxy = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLDaemonMinimumAltitudeCondition;
  [(CLDaemonMinimumAltitudeCondition *)&v4 dealloc];
}

- (BOOL)isAuthorized
{
  id v2 = [(CLDaemonMinimumAltitudeCondition *)self authorizationContext];

  return [v2 isAuthorizedForServiceTypeMask:524304];
}

- (void)startMonitoring
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323958);
  }
  v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    [(CLDaemonMinimumAltitudeCondition *)self altitude];
    int v8 = 68290051;
    int v9 = 0;
    __int16 v10 = 2082;
    v11 = "";
    __int16 v12 = 2049;
    v13 = v4;
    __int16 v14 = 2050;
    uint64_t v15 = self;
    __int16 v16 = 1026;
    unsigned int v17 = [(CLDaemonMinimumAltitudeCondition *)self isAuthorized];
    __int16 v18 = 1026;
    unsigned int v19 = [(CLDaemonMinimumAltitudeCondition *)self isMonitoring];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #minimumAltitudeCondition startMonitoring\", \"altitude\":\"%{private}f\", \"self\":\"%{public}p\", \"isAuthorized\":%{public}d, \"isMonitoring\":%{public}d}", (uint8_t *)&v8, 0x32u);
  }
  if (([(CLDaemonMinimumAltitudeCondition *)self isMonitoring] & 1) == 0)
  {
    if ([(CLDaemonMinimumAltitudeCondition *)self isAuthorized])
    {
      [(CLDaemonMinimumAltitudeCondition *)self setIsMonitoring:1];
      [(CLBarometerCalibrationProtocol *)self->_barometerCalibrationProxy registerClient:self forNotification:1];
      barometerCalibrationProxy = self->_barometerCalibrationProxy;
      [(CLDaemonMinimumAltitudeCondition *)self altitude];
      -[CLBarometerCalibrationProtocol registerClient:forElevationThreshold:](barometerCalibrationProxy, "registerClient:forElevationThreshold:", self, 1.79769313e308, v6);
    }
    else
    {
      if (qword_102419530 != -1) {
        dispatch_once(&qword_102419530, &stru_102323958);
      }
      __int16 v7 = qword_102419538;
      if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 68289282;
        int v9 = 0;
        __int16 v10 = 2082;
        v11 = "";
        __int16 v12 = 2050;
        v13 = self;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #minimumAltitudeCondition startMonitoring not authorized\", \"self\":\"%{public}p\"}", (uint8_t *)&v8, 0x1Cu);
      }
    }
  }
}

- (void)stopMonitoring
{
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323958);
  }
  v3 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    [(CLDaemonMinimumAltitudeCondition *)self altitude];
    v7[0] = 68290051;
    v7[1] = 0;
    __int16 v8 = 2082;
    int v9 = "";
    __int16 v10 = 2049;
    uint64_t v11 = v4;
    __int16 v12 = 2050;
    v13 = self;
    __int16 v14 = 1026;
    unsigned int v15 = [(CLDaemonMinimumAltitudeCondition *)self isAuthorized];
    __int16 v16 = 1026;
    unsigned int v17 = [(CLDaemonMinimumAltitudeCondition *)self isMonitoring];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#monitor #minimumAltitudeCondition stopMonitoring\", \"altitude\":\"%{private}f\", \"self\":\"%{public}p\", \"isAuthorized\":%{public}d, \"isMonitoring\":%{public}d}", (uint8_t *)v7, 0x32u);
  }
  if ([(CLDaemonMinimumAltitudeCondition *)self isMonitoring])
  {
    [(CLDaemonMinimumAltitudeCondition *)self setIsMonitoring:0];
    [(CLDaemonMinimumAltitudeCondition *)self setLastMonitoringState:0];
    [(CLDaemonMinimumAltitudeCondition *)self setRefinement:0];
    [(CLBarometerCalibrationProtocol *)self->_barometerCalibrationProxy unregisterClient:self forNotification:1];
    barometerCalibrationProxy = self->_barometerCalibrationProxy;
    [(CLDaemonMinimumAltitudeCondition *)self altitude];
    -[CLBarometerCalibrationProtocol unregisterClient:forElevationThreshold:](barometerCalibrationProxy, "unregisterClient:forElevationThreshold:", self, 1.79769313e308, v6);
  }
}

- (unint64_t)diagnosticMaskIfNonFunctional
{
  if ([(CLDaemonMinimumAltitudeCondition *)self isMonitoring]) {
    return 0;
  }
  if ((int)[self authorizationContext].inUseLevel <= 0)unint64_t v3 = 16* ([self authorizationContext].transientAwareRegistrationResult != 0); {
  else
  }
    unint64_t v3 = 0;
  unint64_t v4 = v3 | 0x1000;
  if ([-[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext") isAuthorizedForServiceTypeMask:16])v3 |= 0x1000uLL; {
  if ((objc_msgSend(-[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext"), "isAuthorizedForServiceTypeMask:", 0x100000) & 1) == 0&& objc_msgSend(-[CLDaemonMinimumAltitudeCondition authorizationContext](self, "authorizationContext"), "transientAwareRegistrationResult") == 4)
  }
  {
    return v4;
  }
  return v3;
}

- (void)onElevationThresold:(float)a3 direction:(BOOL)a4
{
  BOOL v4 = a4;
  if (qword_102419530 != -1) {
    dispatch_once(&qword_102419530, &stru_102323958);
  }
  __int16 v7 = qword_102419538;
  if (os_log_type_enabled((os_log_t)qword_102419538, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289795;
    int v11 = 0;
    __int16 v12 = 2082;
    v13 = "";
    __int16 v14 = 2049;
    double v15 = a3;
    __int16 v16 = 1026;
    BOOL v17 = v4;
    __int16 v18 = 2050;
    unsigned int v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#minimumAltitudeCondition elevation threshold alert\", \"threshold\":\"%{private}f\", \"above\":%{public}d, \"self\":\"%{public}p\"}", buf, 0x2Cu);
  }
  if ([(CLDaemonMinimumAltitudeCondition *)self onConditionUpdateCallbackHandler])
  {
    if (v4) {
      uint64_t v8 = 1;
    }
    else {
      uint64_t v8 = 2;
    }
    [(CLDaemonMinimumAltitudeCondition *)self setLastMonitoringState:v8];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1013CE4C4;
    v9[3] = &unk_1022DB1F0;
    v9[4] = self;
    v9[5] = v8;
    [objc_msgSend(-[CLDaemonMinimumAltitudeCondition universe](self, "universe"), "vendor") proxyForService:@"CLClientManager"] doAsync:v9;
  }
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

@end