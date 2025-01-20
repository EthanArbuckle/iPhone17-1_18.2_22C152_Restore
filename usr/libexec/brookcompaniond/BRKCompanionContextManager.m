@interface BRKCompanionContextManager
- (BRKCompanionContextManager)initWithBRKIDSService:(id)a3;
- (id)_messageForRegion:(id)a3;
- (void)fetchLocationOfInterest;
- (void)locationManager:(id)a3 didEnter:(id)a4 completion:(id)a5;
- (void)locationManager:(id)a3 didExitRegion:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)monitorLocationOfInterest:(id)a3;
- (void)startMonitoring:(id)a3 forRegion:(id)a4;
- (void)stopMonitoring:(id)a3 forRegionIdentifier:(id)a4;
- (void)stopMonitoringHome;
- (void)stopMonitoringIdentifier:(id)a3;
@end

@implementation BRKCompanionContextManager

- (BRKCompanionContextManager)initWithBRKIDSService:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRKCompanionContextManager;
  v6 = [(BRKCompanionContextManager *)&v19 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_idsService, a3);
    [(BRKIDSService *)v7->_idsService setCompanionContextManagerDelegate:v7];
    id v8 = objc_alloc((Class)CLLocationManager);
    v9 = +[NSBundle bundleWithPath:@"/System/Library/LocationBundles/HandwashingLocation.bundle"];
    v10 = (CLLocationManager *)[v8 initWithEffectiveBundle:v9 delegate:v7 onQueue:&_dispatch_main_q];
    locationManager = v7->_locationManager;
    v7->_locationManager = v10;

    unsigned int v12 = [(CLLocationManager *)v7->_locationManager authorizationStatus];
    v13 = BRKLoggingObjectForDomain();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "authorizationStatus %d", buf, 8u);
    }

    uint64_t v14 = +[RTRoutineManager defaultManager];
    routineManager = v7->_routineManager;
    v7->_routineManager = (RTRoutineManager *)v14;

    v16 = +[BRKSettings settingsForActiveDevice];
    unsigned int v17 = [v16 isCachedLocationAuthFlowEnabled];

    if (v17) {
      [(BRKCompanionContextManager *)v7 stopMonitoringHome];
    }
  }

  return v7;
}

- (void)startMonitoring:(id)a3 forRegion:(id)a4
{
  id v5 = a4;
  v6 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[BRKCompanionContextManager startMonitoring:forRegion:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s DAEMON startMonitoringForRegion: %@", (uint8_t *)&v7, 0x16u);
  }

  [v5 setConservativeEntry:1];
  [(CLLocationManager *)self->_locationManager startMonitoringForRegion:v5];
}

- (void)stopMonitoring:(id)a3 forRegionIdentifier:(id)a4
{
  id v5 = a4;
  v6 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    id v8 = "-[BRKCompanionContextManager stopMonitoring:forRegionIdentifier:]";
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s DAEMON stopMonitoringForRegion: %@", (uint8_t *)&v7, 0x16u);
  }

  [(BRKCompanionContextManager *)self stopMonitoringIdentifier:v5];
}

- (id)_messageForRegion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)BRKIDSMessage);
  id v5 = [v3 identifier];
  [v4 setIdentifier:v5];

  [v3 center];
  [v4 setLongitude:v6];
  [v3 center];
  [v4 setLatitude:];
  [v3 radius];
  double v8 = v7;

  [v4 setRadius:v8];

  return v4;
}

- (void)stopMonitoringHome
{
  id v3 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[BRKCompanionContextManager stopMonitoringHome]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  [(BRKCompanionContextManager *)self stopMonitoringIdentifier:@"brook-home"];
}

- (void)stopMonitoringIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[BRKCompanionContextManager stopMonitoringIdentifier:]";
    __int16 v11 = 2112;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s _locationManager stopMonitoringForRegion: %@", (uint8_t *)&v9, 0x16u);
  }

  CLLocationCoordinate2D v6 = CLLocationCoordinate2DMake(0.0, 0.0);
  locationManager = self->_locationManager;
  id v8 = [objc_alloc((Class)CLCircularRegion) initWithCenter:v4 radius:v6.latitude identifier:0.0];
  [(CLLocationManager *)locationManager stopMonitoringForRegion:v8];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(CLLocationManager *)self->_locationManager authorizationStatus];
    int v8 = 136315394;
    int v9 = "-[BRKCompanionContextManager locationManagerDidChangeAuthorization:]";
    __int16 v10 = 1024;
    LODWORD(v11) = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v8, 0x12u);
  }

  if ([(CLLocationManager *)self->_locationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways)
  {
    [(BRKCompanionContextManager *)self fetchLocationOfInterest];
  }
  else
  {
    CLLocationCoordinate2D v6 = BRKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      int v9 = "-[BRKCompanionContextManager locationManagerDidChangeAuthorization:]";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s [_locationManager authorizationStatus] != kCLClientAuthorizationStatusAuthorizedAlways", (uint8_t *)&v8, 0xCu);
    }

    double v7 = BRKLoggingObjectForDomain();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      int v9 = "-[BRKCompanionContextManager locationManagerDidChangeAuthorization:]";
      __int16 v10 = 2112;
      CFStringRef v11 = @"brook-home";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s DAEMON stopMonitoringForRegion: %@", (uint8_t *)&v8, 0x16u);
    }

    [(BRKCompanionContextManager *)self stopMonitoringHome];
  }
}

- (void)fetchLocationOfInterest
{
  id v3 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v7 = "-[BRKCompanionContextManager fetchLocationOfInterest]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  routineManager = self->_routineManager;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100003EC8;
  v5[3] = &unk_100008298;
  v5[4] = self;
  +[BRKRoutineManager fetchLocationsOfInterestWithSingleRetryOfType:0 routineManager:routineManager withHandler:v5];
}

- (void)monitorLocationOfInterest:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 location];
  [v5 latitude];
  CLLocationDegrees v7 = v6;
  int v8 = [v4 location];

  [v8 longitude];
  CLLocationCoordinate2D v10 = CLLocationCoordinate2DMake(v7, v9);

  if (CLLocationCoordinate2DIsValid(v10))
  {
    id v11 = [objc_alloc((Class)CLCircularRegion) initWithCenter:@"brook-home" radius:v10.latitude radius:v10.longitude identifier:@"100.0"];
    id v12 = BRKLoggingObjectForDomain();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      uint64_t v14 = "-[BRKCompanionContextManager monitorLocationOfInterest:]";
      __int16 v15 = 2112;
      id v16 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s LOCAL startMonitoringForRegion: %@", (uint8_t *)&v13, 0x16u);
    }

    [v11 setConservativeEntry:1];
    [(CLLocationManager *)self->_locationManager startMonitoringForRegion:v11];
  }
}

- (void)locationManager:(id)a3 didEnter:(id)a4 completion:(id)a5
{
  CLLocationDegrees v7 = (void (**)(void))a5;
  id v8 = a4;
  CLLocationDegrees v9 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v18 = "-[BRKCompanionContextManager locationManager:didEnter:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  CLLocationCoordinate2D v10 = [(BRKCompanionContextManager *)self _messageForRegion:v8];

  id v11 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[BRKCompanionContextManager locationManager:didEnter:completion:]";
    __int16 v19 = 2112;
    v20 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s sending IDS message %@", buf, 0x16u);
  }

  idsService = self->_idsService;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000044BC;
  v15[3] = &unk_1000082C0;
  id v13 = v10;
  id v16 = v13;
  id v14 = [(BRKIDSService *)idsService sendProtobuf:v13 type:5 priority:300 completionHandler:v15 withTimeout:30.0];
  if (v7) {
    v7[2](v7);
  }
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  id v5 = a4;
  double v6 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[BRKCompanionContextManager locationManager:didExitRegion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  CLLocationDegrees v7 = [(BRKCompanionContextManager *)self _messageForRegion:v5];

  idsService = self->_idsService;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000046F4;
  v11[3] = &unk_1000082C0;
  id v12 = v7;
  id v9 = v7;
  id v10 = [(BRKIDSService *)idsService sendProtobuf:v9 type:6 priority:300 completionHandler:v11 withTimeout:30.0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routineManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_idsQueue, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

@end