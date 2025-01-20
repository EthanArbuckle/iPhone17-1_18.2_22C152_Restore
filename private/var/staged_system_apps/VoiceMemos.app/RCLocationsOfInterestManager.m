@interface RCLocationsOfInterestManager
+ (id)defaultManager;
- (CLLocation)currentLocation;
- (NSArray)locationsOfInterest;
- (RCLocationsOfInterestManager)init;
- (void)_didFetchPlaceInferences:(id)a3 location:(id)a4 error:(id)a5;
- (void)_requestPlaceInferences;
- (void)_startMonitoringLocation;
- (void)_stopMonitoringLocation;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)prepare;
- (void)start;
- (void)stop;
@end

@implementation RCLocationsOfInterestManager

+ (id)defaultManager
{
  if (qword_10026A828 != -1) {
    dispatch_once(&qword_10026A828, &stru_100222668);
  }
  v2 = (void *)qword_10026A820;

  return v2;
}

- (RCLocationsOfInterestManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)RCLocationsOfInterestManager;
  v2 = [(RCLocationsOfInterestManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.voicememod.RCLocationsOfInterestManager.serialQueue", 0);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)_didFetchPlaceInferences:(id)a3 location:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (self->_active)
  {
    if (v8)
    {
      objc_storeStrong((id *)&self->_currentLocation, a4);
      v12 = (NSArray *)[v8 copy];
      locationsOfInterest = self->_locationsOfInterest;
      self->_locationsOfInterest = v12;

      if (self->_placeInferencePolicy != 3)
      {
        self->_placeInferencePolicy = 3;
        [(RCLocationsOfInterestManager *)self _requestPlaceInferences];
      }
    }
    else if (v10)
    {
      v14 = OSLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_10016CC44();
      }
    }
  }
}

- (void)_requestPlaceInferences
{
  dispatch_queue_t v3 = [(CLLocationManager *)self->_locationManager location];
  if (v3 && !self->_isFetchingPlacesOfInterest && (objc_opt_respondsToSelector() & 1) != 0)
  {
    self->_isFetchingPlacesOfInterest = 1;
    locationManager = self->_locationManager;
    unint64_t placeInferencePolicy = self->_placeInferencePolicy;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000C0DC;
    v6[3] = &unk_100222248;
    v6[4] = self;
    id v7 = v3;
    [(CLLocationManager *)locationManager _fetchPlaceInferencesWithFidelityPolicy:placeInferencePolicy handler:v6];
  }
}

- (void)start
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100032178;
  block[3] = &unk_100221278;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)prepare
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008B74;
  block[3] = &unk_100221278;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  unsigned int v4 = [a3 authorizationStatus];
  int v5 = v4;
  if (v4 - 1 < 2)
  {
    [(RCLocationsOfInterestManager *)self _stopMonitoringLocation];
    currentLocation = self->_currentLocation;
    self->_currentLocation = 0;

    locationsOfInterest = self->_locationsOfInterest;
    self->_locationsOfInterest = 0;
  }
  else if (v4 - 3 >= 2)
  {
    if (!v4) {
      [(CLLocationManager *)self->_locationManager requestWhenInUseAuthorization];
    }
  }
  else if (self->_active && (self->_authorizationStatus - 3) >= 2)
  {
    [(RCLocationsOfInterestManager *)self _startMonitoringLocation];
  }
  self->_authorizationStatus = v5;
}

- (void)_startMonitoringLocation
{
  [(CLLocationManager *)self->_locationManager startMonitoringSignificantLocationChanges];
  [(CLLocationManager *)self->_locationManager requestLocation];
  self->_unint64_t placeInferencePolicy = 1;

  [(RCLocationsOfInterestManager *)self _requestPlaceInferences];
}

- (void)stop
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10008B7D0;
  block[3] = &unk_100221278;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)_stopMonitoringLocation
{
  if (self->_active)
  {
    if ((self->_authorizationStatus - 3) <= 1) {
      [(CLLocationManager *)self->_locationManager stopMonitoringSignificantLocationChanges];
    }
    self->_active = 0;
  }
}

- (CLLocation)currentLocation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10008B90C;
  id v10 = sub_10008B91C;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008B924;
  v5[3] = &unk_100222690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CLLocation *)v3;
}

- (NSArray)locationsOfInterest
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_10008B90C;
  id v10 = sub_10008B91C;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10008BA60;
  v5[3] = &unk_100222690;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 domain];
  if ([v6 isEqualToString:kCLErrorDomain])
  {
    id v7 = [v5 code];

    if (!v7)
    {
      [(CLLocationManager *)self->_locationManager requestLocation];
      goto LABEL_8;
    }
  }
  else
  {
  }
  uint64_t v8 = OSLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_10016CCC4();
  }

LABEL_8:
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (self->_active && (self->_authorizationStatus - 3) <= 1) {
    [(RCLocationsOfInterestManager *)self _requestPlaceInferences];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_locationsOfInterest, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end