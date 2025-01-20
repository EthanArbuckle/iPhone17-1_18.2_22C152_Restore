@interface WISCLLocationManager
+ (BOOL)sIsLocationAllowed:(int)a3;
+ (const)sAuthStatusAsString:(int)a3;
- (BOOL)locationAllowed;
- (BOOL)shouldUpdateLocation:(BOOL)a3;
- (BOOL)startLocationUpdates;
- (BOOL)stopLocationUpdates;
- (WISCLLocationManager)init;
- (id).cxx_construct;
- (void)callAuthStatusCallback:(int)a3;
- (void)callOnLocationFailedCallback;
- (void)callOnLocationUpdateCallback:(id)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)onAuthStatusUpdateCallback:(function<void)(BOOL;
- (void)onLocationFailureCallback:(function<void)(;
- (void)onLocationUpdateCallback:(function<void (CLLocation *);
- (void)prepareForShutdown;
- (void)setDesiredLocationAccuracy:(double)a3;
@end

@implementation WISCLLocationManager

- (WISCLLocationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)WISCLLocationManager;
  v2 = [(WISCLLocationManager *)&v8 init];
  if (v2)
  {
    v3 = (CLLocationManager *)[objc_alloc((Class)CLLocationManager) initWithEffectiveBundlePath:@"/System/Library/LocationBundles/WirelessDiagnostics.bundle" delegate:v2 onQueue:&_dispatch_main_q];
    manager = v2->_manager;
    v2->_manager = v3;

    [(CLLocationManager *)v2->_manager setDelegate:v2];
    [(CLLocationManager *)v2->_manager setDistanceFilter:kCLLocationAccuracyHundredMeters];
    [(CLLocationManager *)v2->_manager setDesiredAccuracy:kCLLocationAccuracyAggressivePrecisionReduction];
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.wirelessinsightsd.cllocationmanager", 0);
    fObj = v2->fQueue.fObj.fObj;
    v2->fQueue.fObj.fObj = (dispatch_object_s *)v5;
    if (fObj) {
      dispatch_release(fObj);
    }
  }
  return v2;
}

- (void)prepareForShutdown
{
  manager = self->_manager;
  if (manager) {
    [(CLLocationManager *)manager setDelegate:0];
  }
}

- (void)dealloc
{
  manager = self->_manager;
  if (manager)
  {
    [(CLLocationManager *)manager stopUpdatingLocation];
    dispatch_queue_t v5 = self->_manager;
    self->_manager = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)WISCLLocationManager;
  [(WISCLLocationManager *)&v6 dealloc];
}

- (BOOL)shouldUpdateLocation:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[CLLocationManager locationServicesEnabled];
  if (v5)
  {
    manager = self->_manager;
    if (v3)
    {
      [(CLLocationManager *)manager startUpdatingLocation];
      v7 = *(NSObject **)(qword_1001D8080 + 40);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        objc_super v8 = "loc.mgr:#N Started location update";
        v9 = (uint8_t *)&v12;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
      }
    }
    else
    {
      [(CLLocationManager *)manager stopUpdatingLocation];
      v7 = *(NSObject **)(qword_1001D8080 + 40);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        objc_super v8 = "loc.mgr:#N Stopped location update";
        v9 = (uint8_t *)&v11;
        goto LABEL_9;
      }
    }
  }
  else
  {
    v7 = *(NSObject **)(qword_1001D8080 + 40);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      objc_super v8 = "loc.mgr:#N Location services are disabled";
      v9 = (uint8_t *)&v13;
      goto LABEL_9;
    }
  }
  return v5;
}

- (BOOL)startLocationUpdates
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  fObj = self->fQueue.fObj.fObj;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C42FC;
  v5[3] = &unk_1001BB6E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(fObj, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)stopLocationUpdates
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  fObj = self->fQueue.fObj.fObj;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C43FC;
  v5[3] = &unk_1001BB6E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(fObj, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)locationAllowed
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  fObj = self->fQueue.fObj.fObj;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000C44FC;
  v5[3] = &unk_1001B78F8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(fObj, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (BOOL)sIsLocationAllowed:(int)a3
{
  return (a3 - 3) < 2;
}

- (void)setDesiredLocationAccuracy:(double)a3
{
  char v3 = self;
  operator new();
}

- (void)onAuthStatusUpdateCallback:(function<void)(BOOL
{
  self;
  sub_1000C4F20((uint64_t)&v4, (uint64_t)a3);
  operator new();
}

- (void)callAuthStatusCallback:(int)a3
{
  char v3 = self;
  operator new();
}

+ (const)sAuthStatusAsString:(int)a3
{
  if (a3 > 4) {
    return "Auth status is unknown";
  }
  else {
    return off_1001BB708[a3];
  }
}

- (void)onLocationUpdateCallback:(function<void (CLLocation *)
{
  self;
  sub_1000C526C((uint64_t)&v4, (uint64_t)a3);
  operator new();
}

- (void)callOnLocationUpdateCallback:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = self;
    id v6 = v4;
    operator new();
  }
}

- (void)onLocationFailureCallback:(function<void)(
{
  self;
  sub_1000C55D8((uint64_t)&v4, (uint64_t)a3);
  operator new();
}

- (void)callOnLocationFailedCallback
{
  v2 = self;
  operator new();
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  id v5 = [v4 authorizationStatus];
  id v6 = *(NSObject **)(qword_1001D8080 + 40);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = +[WISCLLocationManager sAuthStatusAsString:v5];
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "loc.mgr:#N Updated auth status from locationd %s", (uint8_t *)&v7, 0xCu);
  }
  [(WISCLLocationManager *)self callAuthStatusCallback:v5];
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(NSObject **)(qword_1001D8080 + 40);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "loc.mgr:#N Updated location from locationd", v10, 2u);
  }
  char v9 = [v7 lastObject];
  [(WISCLLocationManager *)self callOnLocationUpdateCallback:v9];
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(NSObject **)(qword_1001D8080 + 40);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "loc.mgr:#N Location failed", v10, 2u);
  }
  int v9 = dword_1001D7E70++;
  if (v6 && v9 >= 3) {
    [v6 stopUpdatingLocation];
  }
  [(WISCLLocationManager *)self callOnLocationFailedCallback];
}

- (void).cxx_destruct
{
  sub_10006FD58(self->fLocFailedCallback.__f_.__buf_.__lx);
  sub_10006DBA4(self->fLocChangedCallback.__f_.__buf_.__lx);
  sub_10006D524(self->fAuthChangedCallback.__f_.__buf_.__lx);
  fObj = self->fQueue.fObj.fObj;
  if (fObj) {
    dispatch_release(fObj);
  }

  objc_storeStrong((id *)&self->_manager, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 10) = 0;
  *((void *)self + 14) = 0;
  return self;
}

@end