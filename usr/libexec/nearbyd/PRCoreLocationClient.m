@interface PRCoreLocationClient
- (BOOL)dowgradeToBystanderMonitoring;
- (BOOL)isMonitoringLocation;
- (BOOL)startMonitoring;
- (BOOL)stopMonitoring;
- (BOOL)upgradeToBestAccuracyMonitoring;
- (CLLocation)location;
- (PRCoreLocationClient)initWithQueue:(id)a3;
- (id)regulatoryLocationAuthorized;
- (id)regulatoryLocationHandler;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setLocation:(id)a3;
- (void)setRegulatoryLocationAuthorized:(id)a3;
- (void)setRegulatoryLocationHandler:(id)a3;
- (void)updateLocationAuthorized;
@end

@implementation PRCoreLocationClient

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v22 = v5;
    v6 = [v5 lastObject];
    [(PRCoreLocationClient *)self setLocation:v6];
    if (self->_regulatoryLocationHandler)
    {
      v7 = [(PRCoreLocationClient *)self location];
      [v7 coordinate];
      double v9 = v8;

      v10 = [(PRCoreLocationClient *)self location];
      [v10 coordinate];
      double v12 = v11;

      v13 = [(PRCoreLocationClient *)self location];
      [v13 altitude];
      double v15 = v14;

      v16 = [(PRCoreLocationClient *)self location];
      [v16 horizontalAccuracy];
      double v18 = v17;

      regulatoryLocationHandler = (void (**)(id, void, double, double, double, double, double))self->_regulatoryLocationHandler;
      v20 = [v6 timestamp];
      [v20 timeIntervalSinceReferenceDate];
      regulatoryLocationHandler[2](regulatoryLocationHandler, 0, v9, v12, v15, v18, v21);
    }
    id v5 = v22;
  }
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocation:(id)a3
{
}

- (PRCoreLocationClient)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PRCoreLocationClient;
  v6 = [(PRCoreLocationClient *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    double v8 = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/UWBRegulatory.bundle" delegate:v7 onQueue:v5];
    manager = v7->_manager;
    v7->_manager = v8;

    [(CLLocationManager *)v7->_manager setDesiredAccuracy:2147483650.0];
    *(_WORD *)&v7->_isMonitoringLocation = 0;
  }

  return v7;
}

- (BOOL)startMonitoring
{
  manager = self->_manager;
  v4 = qword_1008A7E88;
  BOOL v5 = os_log_type_enabled((os_log_t)qword_1008A7E88, OS_LOG_TYPE_DEBUG);
  if (manager)
  {
    if (v5) {
      sub_10042BDB4((uint64_t)self, v4, v6, v7, v8, v9, v10, v11);
    }
    if (self->_isMonitoringLocation)
    {
      if (os_log_type_enabled((os_log_t)qword_1008A7E88, OS_LOG_TYPE_DEBUG)) {
        sub_10042BD80();
      }
    }
    else
    {
      self->_isMonitoringLocation = 1;
      [(CLLocationManager *)self->_manager startUpdatingLocation];
      if (os_log_type_enabled((os_log_t)qword_1008A7E88, OS_LOG_TYPE_DEBUG)) {
        sub_10042BD4C();
      }
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002CEDF8;
      block[3] = &unk_1008473B0;
      block[4] = self;
      dispatch_async((dispatch_queue_t)queue, block);
    }
  }
  else if (v5)
  {
    sub_10042BE24();
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
      self->_isMonitoringLocation = 0;
      [(CLLocationManager *)manager stopUpdatingLocation];
      if (os_log_type_enabled((os_log_t)qword_1008A7E88, OS_LOG_TYPE_DEBUG)) {
        sub_10042BE8C();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_1008A7E88, OS_LOG_TYPE_DEBUG))
    {
      sub_10042BE58();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008A7E88, OS_LOG_TYPE_DEBUG))
  {
    sub_10042BEC0();
  }
  return manager != 0;
}

- (BOOL)upgradeToBestAccuracyMonitoring
{
  manager = self->_manager;
  if (manager)
  {
    [(CLLocationManager *)self->_manager setDesiredAccuracy:-1.0];
    if (self->_isMonitoringLocation)
    {
      [(PRCoreLocationClient *)self stopMonitoring];
      [(PRCoreLocationClient *)self startMonitoring];
    }
    else if (os_log_type_enabled((os_log_t)qword_1008A7E88, OS_LOG_TYPE_DEBUG))
    {
      sub_10042BEF4();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008A7E88, OS_LOG_TYPE_DEBUG))
  {
    sub_10042BF28();
  }
  return manager != 0;
}

- (BOOL)dowgradeToBystanderMonitoring
{
  manager = self->_manager;
  if (manager)
  {
    [(CLLocationManager *)self->_manager setDesiredAccuracy:2147483650.0];
    if (self->_isMonitoringLocation)
    {
      [(PRCoreLocationClient *)self stopMonitoring];
      [(PRCoreLocationClient *)self startMonitoring];
    }
    else if (os_log_type_enabled((os_log_t)qword_1008A7E88, OS_LOG_TYPE_DEBUG))
    {
      sub_10042BF5C();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_1008A7E88, OS_LOG_TYPE_DEBUG))
  {
    sub_10042BF90();
  }
  return manager != 0;
}

- (void)updateLocationAuthorized
{
  regulatoryLocationAuthorized = (void (**)(id, BOOL))self->_regulatoryLocationAuthorized;
  if (regulatoryLocationAuthorized) {
    regulatoryLocationAuthorized[2](regulatoryLocationAuthorized, self->_isLocationAuthorized);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  BOOL v5 = qword_1008A7E88;
  if (os_log_type_enabled((os_log_t)qword_1008A7E88, OS_LOG_TYPE_DEBUG)) {
    sub_10042BFC4((uint64_t)v4, v5);
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = qword_1008A7E88;
  if (os_log_type_enabled((os_log_t)qword_1008A7E88, OS_LOG_TYPE_DEBUG)) {
    sub_10042C070(v4, v7, v8, v9, v10, v11, v12, v13);
  }
  BOOL v15 = v4 == 3 || v4 == 0;
  self->_isLocationAuthorized = v15;
  if (self->_isMonitoringLocation)
  {
    [(PRCoreLocationClient *)self updateLocationAuthorized];
  }
  else if (os_log_type_enabled((os_log_t)qword_1008A7E88, OS_LOG_TYPE_DEBUG))
  {
    sub_10042C03C();
  }
}

- (BOOL)isMonitoringLocation
{
  return self->_isMonitoringLocation;
}

- (id)regulatoryLocationHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setRegulatoryLocationHandler:(id)a3
{
}

- (id)regulatoryLocationAuthorized
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setRegulatoryLocationAuthorized:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_regulatoryLocationAuthorized, 0);
  objc_storeStrong(&self->_regulatoryLocationHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_location, 0);

  objc_storeStrong((id *)&self->_manager, 0);
}

@end