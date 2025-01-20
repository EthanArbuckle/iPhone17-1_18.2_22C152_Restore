@interface CLWorkoutGeoFenceController
- (BOOL)isGeoFenceAuthorizedAndPossible;
- (CLRegion)installedRegion;
- (CLWorkoutGeoFenceController)initWithDelegate:(id)a3 withSilo:(id)a4;
- (CLWorkoutGeoFenceControllerDelegate)delegate;
- (NSString)fenceIdentifier;
- (void)cancelTimers;
- (void)dealloc;
- (void)installFenceWithCenter:(id)a3;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5;
- (void)onGeoFenceTimerFire;
- (void)onLocationUpdateTimerFire;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setFenceIdentifier:(id)a3;
- (void)setInstalledRegion:(id)a3;
- (void)startGeoFenceWithRadius:(double)a3;
- (void)stopGeoFence;
- (void)uninstallCurrentFence;
@end

@implementation CLWorkoutGeoFenceController

- (CLWorkoutGeoFenceController)initWithDelegate:(id)a3 withSilo:(id)a4
{
  [a4 assertInside];
  v12.receiver = self;
  v12.super_class = (Class)CLWorkoutGeoFenceController;
  v7 = [(CLWorkoutGeoFenceController *)&v12 init];
  v8 = v7;
  if (v7)
  {
    [(CLWorkoutGeoFenceController *)v7 setDelegate:a3];
    v8->_silo = (CLDispatchSilo *)a4;
    [(CLWorkoutGeoFenceController *)v8 setFenceIdentifier:@"com.apple.locationd.workout.geofence"];
    v8->_regionState = 0;
    v8->_authorizationStatus = 0;
    v8->_fenceRadius = 200.0;
    silo = v8->_silo;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10141E9DC;
    v11[3] = &unk_10229FEB0;
    v11[4] = v8;
    v11[5] = a4;
    [(CLDispatchSilo *)silo async:v11];
  }
  return v8;
}

- (void)dealloc
{
  if (self->_inWorkout) {
    sub_101AB45E8();
  }
  p_silo = &self->_silo;
  silo = self->_silo;
  v4 = p_silo[1];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10141EB70;
  v7[3] = &unk_10229FED8;
  v7[4] = v4;
  [(CLDispatchSilo *)silo async:v7];
  self->_locationManager = 0;
  self->_delegate = 0;

  self->_silo = 0;
  self->_fenceIdentifier = 0;

  self->_installedRegion = 0;
  v6.receiver = self;
  v6.super_class = (Class)CLWorkoutGeoFenceController;
  [(CLWorkoutGeoFenceController *)&v6 dealloc];
}

- (void)startGeoFenceWithRadius:(double)a3
{
  [(CLDispatchSilo *)self->_silo assertInside];
  self->_inWorkout = 1;
  self->_fenceRadius = a3;
  if (self->_locationManager
    && [(CLWorkoutGeoFenceController *)self isGeoFenceAuthorizedAndPossible])
  {
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    v5 = qword_1024191C8;
    if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#gfc Starting geofence", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191C0 != -1) {
        dispatch_once(&qword_1024191C0, &stru_1023251C0);
      }
      __int16 v11 = 0;
      v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController startGeoFenceWithRadius:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    [(CLWorkoutGeoFenceController *)self uninstallCurrentFence];
    [(CLLocationManager *)self->_locationManager startUpdatingLocation];
    silo = self->_silo;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10141F144;
    v10[3] = &unk_10229FED8;
    v10[4] = self;
    sub_10141EEE0((dispatch_source_t *)&self->_locationUpdateTimer, 60, silo, v10);
  }
  else
  {
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    v7 = qword_1024191C8;
    if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#gfc Could not start geofence, check authorizations", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191C0 != -1) {
        dispatch_once(&qword_1024191C0, &stru_1023251C0);
      }
      __int16 v11 = 0;
      v8 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController startGeoFenceWithRadius:]", "%s\n", v8);
      if (v8 != (char *)buf) {
        free(v8);
      }
    }
  }
}

- (void)stopGeoFence
{
  [(CLDispatchSilo *)self->_silo assertInside];
  if (qword_1024191C0 != -1) {
    dispatch_once(&qword_1024191C0, &stru_1023251C0);
  }
  v3 = qword_1024191C8;
  if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#gfc Stopping geofence", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController stopGeoFence]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  [(CLWorkoutGeoFenceController *)self uninstallCurrentFence];
  [(CLWorkoutGeoFenceController *)self cancelTimers];
  [(CLWorkoutGeoFenceController *)self reset];
}

- (void)reset
{
  self->_regionState = 0;
  *(_DWORD *)&self->_isFenceInstalled = 0;
  [(CLWorkoutGeoFenceController *)self setInstalledRegion:0];
}

- (BOOL)isGeoFenceAuthorizedAndPossible
{
  BOOL result = +[CLLocationManager isMonitoringAvailableForClass:objc_opt_class()];
  if (self->_authorizationStatus != 4) {
    return 0;
  }
  return result;
}

- (void)uninstallCurrentFence
{
  if ([(CLWorkoutGeoFenceController *)self installedRegion])
  {
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    v3 = qword_1024191C8;
    if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#gfc Installed region exists at stop workout, uninstalling", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191C0 != -1) {
        dispatch_once(&qword_1024191C0, &stru_1023251C0);
      }
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController uninstallCurrentFence]", "%s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
    [(CLLocationManager *)self->_locationManager stopMonitoringForRegion:[(CLWorkoutGeoFenceController *)self installedRegion]];
  }
  else
  {
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    v4 = qword_1024191C8;
    if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#gfc Generating temporary region to uninstall just in case", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191C0 != -1) {
        dispatch_once(&qword_1024191C0, &stru_1023251C0);
      }
      __int16 v11 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController uninstallCurrentFence]", "%s\n", v11);
      if (v11 != (char *)buf) {
        free(v11);
      }
    }
    id v5 = [objc_alloc((Class)CLLocation) initWithLatitude:0.0 longitude:0.0];
    id v6 = objc_alloc((Class)CLCircularRegion);
    [v5 coordinate];
    id v9 = [v6 initNearbyAllowedWithCenter:-[CLWorkoutGeoFenceController fenceIdentifier](self, "fenceIdentifier") radius:v7 identifier:v8];
    [(CLLocationManager *)self->_locationManager stopMonitoringForRegion:v9];
  }
  *(_WORD *)&self->_isFenceInstalled = 0;
  self->_isMonitoringRegion = 0;
}

- (void)installFenceWithCenter:(id)a3
{
  if (qword_1024191C0 != -1) {
    dispatch_once(&qword_1024191C0, &stru_1023251C0);
  }
  id v5 = qword_1024191C8;
  if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEBUG))
  {
    double fenceRadius = self->_fenceRadius;
    *(_DWORD *)buf = 134217984;
    double v13 = fenceRadius;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "#gfc Installing fence with radius %f", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    __int16 v11 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController installFenceWithCenter:]", "%s\n", v11);
    if (v11 != (char *)buf) {
      free(v11);
    }
  }
  id v7 = objc_alloc((Class)CLCircularRegion);
  [a3 coordinate];
  id v10 = [v7 initNearbyAllowedWithCenter:-[CLWorkoutGeoFenceController fenceIdentifier](self, "fenceIdentifier") radius:v8 identifier:self->_fenceRadius];
  [(CLLocationManager *)self->_locationManager startMonitoringForRegion:v10];
}

- (void)cancelTimers
{
  if (qword_1024191C0 != -1) {
    dispatch_once(&qword_1024191C0, &stru_1023251C0);
  }
  v3 = qword_1024191C8;
  if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#gfc Canceling all timers", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController cancelTimers]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  sub_10141FA8C((dispatch_source_t *)&self->_geoFenceTimer);
  sub_10141FA8C((dispatch_source_t *)&self->_locationUpdateTimer);
}

- (void)onGeoFenceTimerFire
{
  if (qword_1024191C0 != -1) {
    dispatch_once(&qword_1024191C0, &stru_1023251C0);
  }
  v3 = qword_1024191C8;
  if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#gfc Timed out fence monitoring", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController onGeoFenceTimerFire]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  sub_10141FA8C((dispatch_source_t *)&self->_geoFenceTimer);
  if (self->_inWorkout) {
    [(CLWorkoutGeoFenceControllerDelegate *)[(CLWorkoutGeoFenceController *)self delegate] didTimeoutGeoFence];
  }
}

- (void)onLocationUpdateTimerFire
{
  if (qword_1024191C0 != -1) {
    dispatch_once(&qword_1024191C0, &stru_1023251C0);
  }
  v3 = qword_1024191C8;
  if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#gfc Timed out location updates", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController onLocationUpdateTimerFire]", "%s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  sub_10141FA8C((dispatch_source_t *)&self->_locationUpdateTimer);
  [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  if (self->_inWorkout)
  {
    id v5 = [a4 lastObject:a3];
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    id v6 = qword_1024191C8;
    if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEBUG))
    {
      id v7 = [v5 timestamp];
      [objc_msgSend(v5, "timestamp") timeIntervalSinceNow];
      *(_DWORD *)buf = 138412546;
      id v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "#gfc Received new location, timestamp %@, time since now %f", buf, 0x16u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191C0 != -1) {
        dispatch_once(&qword_1024191C0, &stru_1023251C0);
      }
      [v5 timestamp];
      [objc_msgSend(v5, "timestamp") timeIntervalSinceNow];
      objc_super v12 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didUpdateLocations:]", "%s\n", v12);
      if (v12 != (char *)buf) {
        free(v12);
      }
    }
    if (!self->_isFenceInstalled && !self->_isAttemptingFenceInstall)
    {
      [objc_msgSend(v5, "timestamp") timeIntervalSinceNow];
      if (fabs(v9) < 15.0)
      {
        [v5 horizontalAccuracy];
        if (v10 < kCLLocationAccuracyHundredMeters)
        {
          if (qword_1024191C0 != -1) {
            dispatch_once(&qword_1024191C0, &stru_1023251C0);
          }
          __int16 v11 = qword_1024191C8;
          if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "#gfc Attempting to install fence", buf, 2u);
          }
          if (sub_10013D1A0(115, 2))
          {
            bzero(buf, 0x65CuLL);
            if (qword_1024191C0 != -1) {
              dispatch_once(&qword_1024191C0, &stru_1023251C0);
            }
            double v13 = (char *)_os_log_send_and_compose_impl();
            sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didUpdateLocations:]", "%s\n", v13);
            if (v13 != (char *)buf) {
              free(v13);
            }
          }
          self->_isAttemptingFenceInstall = 1;
          [(CLWorkoutGeoFenceController *)self installFenceWithCenter:v5];
          sub_10141FA8C((dispatch_source_t *)&self->_locationUpdateTimer);
          [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
        }
      }
    }
  }
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  if (qword_1024191C0 != -1) {
    dispatch_once(&qword_1024191C0, &stru_1023251C0);
  }
  id v5 = qword_1024191C8;
  if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#gfc Exited fence", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    id v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didExitRegion:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
  if (self->_inWorkout) {
    [(CLWorkoutGeoFenceControllerDelegate *)[(CLWorkoutGeoFenceController *)self delegate] didExitGeoFence];
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  if (qword_1024191C0 != -1) {
    dispatch_once(&qword_1024191C0, &stru_1023251C0);
  }
  id v5 = qword_1024191C8;
  if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#gfc Generic failure with error %@", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    id v6 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didFailWithError:]", "%s\n", v6);
    if (v6 != (char *)buf) {
      free(v6);
    }
  }
}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  if (qword_1024191C0 != -1) {
    dispatch_once(&qword_1024191C0, &stru_1023251C0);
  }
  id v7 = qword_1024191C8;
  if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = a5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#gfc Monitoring failed with error %@, stopping updates", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    id v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:monitoringDidFailForRegion:withError:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if (self->_inWorkout)
  {
    self->_isMonitoringRegion = 0;
    if (!self->_isFenceInstalled) {
      self->_isAttemptingFenceInstall = 0;
    }
    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
  }
}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  if (qword_1024191C0 != -1) {
    dispatch_once(&qword_1024191C0, &stru_1023251C0);
  }
  id v6 = qword_1024191C8;
  if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#gfc Started monitoring", buf, 2u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    __int16 v10 = 0;
    id v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didStartMonitoringForRegion:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if (self->_inWorkout)
  {
    [(CLWorkoutGeoFenceController *)self setInstalledRegion:a4];
    *(_WORD *)&self->_isFenceInstalled = 1;
    self->_isMonitoringRegion = 1;
    [(CLLocationManager *)self->_locationManager stopUpdatingLocation];
    silo = self->_silo;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_101420BA0;
    v9[3] = &unk_10229FED8;
    v9[4] = self;
    sub_10141EEE0((dispatch_source_t *)&self->_geoFenceTimer, 5400, silo, v9);
  }
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  if (qword_1024191C0 != -1) {
    dispatch_once(&qword_1024191C0, &stru_1023251C0);
  }
  id v7 = qword_1024191C8;
  if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v10 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "#gfc Determined state %ld", buf, 0xCu);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    id v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didDetermineState:forRegion:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  if (self->_inWorkout) {
    self->_regionState = a4;
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  if (qword_1024191C0 != -1) {
    dispatch_once(&qword_1024191C0, &stru_1023251C0);
  }
  id v6 = qword_1024191C8;
  if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#gfc Received auth update %d", buf, 8u);
  }
  if (sub_10013D1A0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    id v8 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didChangeAuthorizationStatus:]", "%s\n", v8);
    if (v8 != (char *)buf) {
      free(v8);
    }
  }
  self->_authorizationStatus = a4;
  if (a4 != 4)
  {
    if (qword_1024191C0 != -1) {
      dispatch_once(&qword_1024191C0, &stru_1023251C0);
    }
    id v7 = qword_1024191C8;
    if (os_log_type_enabled((os_log_t)qword_1024191C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "#gfc No longer authorized, stopping geofence", buf, 2u);
    }
    if (sub_10013D1A0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1024191C0 != -1) {
        dispatch_once(&qword_1024191C0, &stru_1023251C0);
      }
      double v9 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 2, "-[CLWorkoutGeoFenceController locationManager:didChangeAuthorizationStatus:]", "%s\n", v9);
      if (v9 != (char *)buf) {
        free(v9);
      }
    }
    [(CLWorkoutGeoFenceController *)self stopGeoFence];
  }
}

- (CLWorkoutGeoFenceControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLWorkoutGeoFenceControllerDelegate *)a3;
}

- (NSString)fenceIdentifier
{
  return self->_fenceIdentifier;
}

- (void)setFenceIdentifier:(id)a3
{
}

- (CLRegion)installedRegion
{
  return self->_installedRegion;
}

- (void)setInstalledRegion:(id)a3
{
}

@end