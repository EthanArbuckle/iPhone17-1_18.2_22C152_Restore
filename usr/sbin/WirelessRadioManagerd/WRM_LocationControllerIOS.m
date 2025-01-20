@interface WRM_LocationControllerIOS
- (BOOL)isLocationAuthorized;
- (BOOL)isMonitoringLocation;
- (CLLocation)location;
- (WRM_LocationControllerIOS)initWithDesiredAccuracy:(double)a3 distanceFilter:(double)a4;
- (id)clientLocationAuthorized;
- (id)clientLocationHandler;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setClientLocationAuthorized:(id)a3;
- (void)setClientLocationHandler:(id)a3;
- (void)setLocation:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
- (void)updateLocationAuthorized_sync;
@end

@implementation WRM_LocationControllerIOS

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v28 = a3;
  id v6 = a4;
  if (self->_isMonitoringLocation)
  {
    if (v6)
    {
      +[WCM_Logging logLevel:22, @"LocationController: didUpdateLocations %@", v6 message];
      v7 = [v6 lastObject];
      [(WRM_LocationControllerIOS *)self setLocation:v7];
      v8 = [(WRM_LocationControllerIOS *)self clientLocationHandler];

      if (v8)
      {
        v9 = [(WRM_LocationControllerIOS *)self location];
        [v9 coordinate];
        double v11 = v10;

        v12 = [(WRM_LocationControllerIOS *)self location];
        [v12 coordinate];
        double v14 = v13;

        v15 = [(WRM_LocationControllerIOS *)self location];
        [v15 altitude];
        double v17 = v16;

        v18 = [(WRM_LocationControllerIOS *)self location];
        [v18 horizontalAccuracy];
        double v20 = v19;

        +[WCM_Logging logLevel:22 message:@"LocationController: invoke clientLocationHandler"];
        v21 = [(WRM_LocationControllerIOS *)self clientLocationHandler];
        v22 = [v7 timestamp];
        [v22 timeIntervalSinceReferenceDate];
        double v24 = v23;
        v25 = [(WRM_LocationControllerIOS *)self location];
        [v25 speed];
        v21[2](v21, 0, v11, v14, v17, v20, v24, v26);
      }
    }
    else
    {
      +[WCM_Logging logLevel:22, @"LocationController: nil location", v27 message];
    }
  }
  else
  {
    +[WCM_Logging logLevel:22, @"LocationController: location received while stopped %@", v6 message];
  }
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 32, 1);
}

- (id)clientLocationHandler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setLocation:(id)a3
{
}

- (WRM_LocationControllerIOS)initWithDesiredAccuracy:(double)a3 distanceFilter:(double)a4
{
  v15.receiver = self;
  v15.super_class = (Class)WRM_LocationControllerIOS;
  id v6 = [(WRM_LocationControllerIOS *)&v15 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.WirelessRadioManager.Location", 0);
    v8 = (void *)*((void *)v6 + 1);
    *((void *)v6 + 1) = v7;

    *((_WORD *)v6 + 12) = 0;
    +[WCM_Logging logLevel:22 message:@"LocationController: init\n"];
    v9 = *((void *)v6 + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000DB2DC;
    block[3] = &unk_100211B28;
    id v12 = v6;
    double v13 = a3;
    double v14 = a4;
    dispatch_async(v9, block);
  }
  return (WRM_LocationControllerIOS *)v6;
}

- (void)startMonitoring
{
  mAlarmQueue = self->_mAlarmQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DB454;
  block[3] = &unk_100211B50;
  void block[4] = self;
  dispatch_async(mAlarmQueue, block);
}

- (void)stopMonitoring
{
  mAlarmQueue = self->_mAlarmQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000DB578;
  block[3] = &unk_100211B50;
  void block[4] = self;
  dispatch_async(mAlarmQueue, block);
}

- (void)updateLocationAuthorized_sync
{
  v3 = [(WRM_LocationControllerIOS *)self clientLocationAuthorized];

  if (v3)
  {
    +[WCM_Logging logLevel:22 message:@"LocationController: updateLocationAuthorized"];
    v4 = [(WRM_LocationControllerIOS *)self clientLocationAuthorized];
    v4[2](v4, self->_isLocationAuthorized);
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (a4) {
    +[WCM_Logging logLevel:22, @"LocationController: didFailWithError,%@", a4 message];
  }
}

- (BOOL)isLocationAuthorized
{
  return self->_isLocationAuthorized;
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  +[WCM_Logging logLevel:22, @"LocationController: didChangeAuthorizationStatus,%d", *(void *)&a4 message];
  BOOL v7 = a4 == 3 || a4 == 0;
  self->_isLocationAuthorized = v7;

  [(WRM_LocationControllerIOS *)self updateLocationAuthorized_sync];
}

- (BOOL)isMonitoringLocation
{
  return self->_isMonitoringLocation;
}

- (void)setClientLocationHandler:(id)a3
{
}

- (id)clientLocationAuthorized
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setClientLocationAuthorized:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientLocationAuthorized, 0);
  objc_storeStrong(&self->_clientLocationHandler, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_manager, 0);

  objc_storeStrong((id *)&self->_mAlarmQueue, 0);
}

@end