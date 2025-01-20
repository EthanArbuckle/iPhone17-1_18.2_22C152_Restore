@interface SACoreLocationClient
- (BOOL)isMonitoringLocation;
- (BOOL)startMonitoring;
- (BOOL)stopMonitoring;
- (CLLocation)location;
- (SACoreLocation)clProxy;
- (SACoreLocationClient)initWithQueue:(id)a3;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)requestSingleShotLocation;
- (void)setClProxy:(SACoreLocation *)a3;
- (void)setLocation:(id)a3;
@end

@implementation SACoreLocationClient

- (SACoreLocationClient)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SACoreLocationClient;
  v6 = [(SACoreLocationClient *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/SafetyAlerts.bundle" delegate:v7 onQueue:v5];
    manager = v7->_manager;
    v7->_manager = v8;

    [(CLLocationManager *)v7->_manager setDesiredAccuracy:1000.0];
    *(_WORD *)&v7->_isLocationAuthorized = 0;
  }

  return v7;
}

- (BOOL)startMonitoring
{
  manager = self->_manager;
  v4 = SALogObjectGeneral;
  BOOL v5 = os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT);
  if (manager)
  {
    if (v5)
    {
      BOOL isMonitoringLocation = self->_isMonitoringLocation;
      *(_DWORD *)buf = 68289282;
      int v15 = 0;
      __int16 v16 = 2082;
      v17 = "";
      __int16 v18 = 1026;
      BOOL v19 = isMonitoringLocation;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,,startMonitoring,\", \"_isMonitoringLocation\":%{public}hhd}", buf, 0x18u);
    }
    if (self->_isMonitoringLocation)
    {
      uint64_t v7 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v15 = 0;
        __int16 v16 = 2082;
        v17 = "";
        v8 = "{\"msg%{public}.0s\":\"#lm,startMonitoring,skipped,reason,alreadyStarted\"}";
        v9 = v7;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, 0x12u);
      }
    }
    else
    {
      self->_BOOL isMonitoringLocation = 1;
      [(CLLocationManager *)self->_manager setDesiredAccuracy:1000.0];
      [(CLLocationManager *)self->_manager startMonitoringSignificantLocationChanges];
      v10 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68289026;
        int v15 = 0;
        __int16 v16 = 2082;
        v17 = "";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,startMonitoring,done\"}", buf, 0x12u);
      }
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000AA7E0;
      block[3] = &unk_1000FB388;
      block[4] = self;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
  else if (v5)
  {
    *(_DWORD *)buf = 68289026;
    int v15 = 0;
    __int16 v16 = 2082;
    v17 = "";
    v8 = "{\"msg%{public}.0s\":\"#lm,startMonitoring,skipped,reason,notInitialized\"}";
    v9 = v4;
    goto LABEL_9;
  }
  return manager != 0;
}

- (BOOL)stopMonitoring
{
  manager = self->_manager;
  if (manager)
  {
    if (self->_isMonitoringLocation)
    {
      self->_BOOL isMonitoringLocation = 0;
      [(CLLocationManager *)manager stopMonitoringSignificantLocationChanges];
      v3 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 68289026;
        int v7 = 0;
        __int16 v8 = 2082;
        v9 = "";
        v4 = "{\"msg%{public}.0s\":\"#lm,stopMonitoring,done.\"}";
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v6, 0x12u);
      }
    }
    else
    {
      v3 = SALogObjectGeneral;
      if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 68289026;
        int v7 = 0;
        __int16 v8 = 2082;
        v9 = "";
        v4 = "{\"msg%{public}.0s\":\"#lm,stopMonitoring,skipped,reason,alreadyStopped\"}";
        goto LABEL_9;
      }
    }
  }
  else
  {
    v3 = SALogObjectGeneral;
    if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 68289026;
      int v7 = 0;
      __int16 v8 = 2082;
      v9 = "";
      v4 = "{\"msg%{public}.0s\":\"#lm,stopMonitoring,skipped,reason,notInitialized\"}";
      goto LABEL_9;
    }
  }
  return manager != 0;
}

- (void)requestSingleShotLocation
{
  [(CLLocationManager *)self->_manager setDesiredAccuracy:100.0];
  [(CLLocationManager *)self->_manager requestLocation];
  v3 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    __int16 v5 = 2082;
    int v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,requestSingleShotLocation,done.\"}", (uint8_t *)v4, 0x12u);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v10 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEBUG))
  {
    v35[0] = 68289283;
    v35[1] = 0;
    __int16 v36 = 2082;
    v37 = "";
    __int16 v38 = 2113;
    id v39 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#lm,didUpdateLocations\", \"locations\":%{private, location:escape_only}@}", (uint8_t *)v35, 0x1Cu);
  }
  if (v8)
  {
    objc_super v11 = [v8 lastObject];
    [(SACoreLocationClient *)self setLocation:v11];

    v12 = [(SACoreLocationClient *)self location];
    if (v12)
    {
      v13 = [(SACoreLocationClient *)self location];
      [v13 coordinate];
      if (!CLLocationCoordinate2DIsValid(v40))
      {
LABEL_14:

        goto LABEL_15;
      }
      v14 = [(SACoreLocationClient *)self location];
      [v14 coordinate];
      double v16 = v15;
      if (v15 == 0.0)
      {
        v4 = [(SACoreLocationClient *)self location];
        [v4 coordinate];
        if (v17 == 0.0)
        {

          goto LABEL_14;
        }
      }
      __int16 v18 = [(SACoreLocationClient *)self location];
      [v18 horizontalAccuracy];
      double v20 = v19;

      if (v16 == 0.0)
      {

        if (v20 <= 0.0) {
          goto LABEL_15;
        }
        goto LABEL_13;
      }

      if (v20 > 0.0)
      {
LABEL_13:
        v21 = [(SACoreLocationClient *)self location];
        [v21 coordinate];
        double v23 = v22;

        v24 = [(SACoreLocationClient *)self location];
        [v24 coordinate];
        double v26 = v25;

        v27 = [(SACoreLocationClient *)self location];
        [v27 altitude];
        double v29 = v28;

        v30 = [(SACoreLocationClient *)self location];
        [v30 horizontalAccuracy];
        double v32 = v31;

        v33 = [(SACoreLocationClient *)self clProxy];
        v12 = [(SACoreLocationClient *)self location];
        v13 = [v12 timestamp];
        [v13 timeIntervalSinceReferenceDate];
        (*((void (**)(SACoreLocation *, void, double, double, double, double, double))v33->var0 + 4))(v33, 0, v23, v26, v29, v32, v34);
        goto LABEL_14;
      }
    }
  }
LABEL_15:
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  int v6 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 68289282;
    v7[1] = 0;
    __int16 v8 = 2082;
    v9 = "";
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,didFailWithError\", \"error\":%{public, location:escape_only}@}", (uint8_t *)v7, 0x1Cu);
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  id v6 = a3;
  self->_isLocationAuthorized = a4 == 3;
  __int16 v8 = SALogObjectGeneral;
  if (os_log_type_enabled((os_log_t)SALogObjectGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289538;
    v10[1] = 0;
    __int16 v11 = 2082;
    v12 = "";
    __int16 v13 = 1026;
    int v14 = a4;
    __int16 v15 = 1026;
    BOOL v16 = a4 == 3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#lm,didChangeAuthorizationStatus\", \"authStatus\":%{public}d, \"isAuthorized\":%{public}hhd}", (uint8_t *)v10, 0x1Eu);
  }
  v9 = [(SACoreLocationClient *)self clProxy];
  (*((void (**)(SACoreLocation *, BOOL))v9->var0 + 5))(v9, self->_isLocationAuthorized);
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocation:(id)a3
{
}

- (BOOL)isMonitoringLocation
{
  return self->_isMonitoringLocation;
}

- (SACoreLocation)clProxy
{
  return self->_clProxy;
}

- (void)setClProxy:(SACoreLocation *)a3
{
  self->_clProxy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end