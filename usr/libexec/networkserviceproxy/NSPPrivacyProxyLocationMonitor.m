@interface NSPPrivacyProxyLocationMonitor
+ (id)sharedMonitor;
- (BOOL)checkSignificantLocationChange:(id)a3;
- (BOOL)isAuthorized;
- (BOOL)isCoreWLANAuthorized;
- (NSPPrivacyProxyLocationMonitor)init;
- (NSPPrivacyProxyLocationMonitorDelegate)delegate;
- (NSString)currentCountryPlusTimezone;
- (id)geohashFromLocation:(id)a3;
- (void)handleLocationUpdate:(id)a3;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)locationManagerDidChangeAuthorization:(id)a3;
- (void)refreshCountryPlusTimezone:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastCountryPlusTimezone:(id)a3;
- (void)setLastGeohash:(id)a3;
- (void)setMonitorTimeInterval:(double)a3;
- (void)setUserEventAgentTimer;
- (void)start;
- (void)startLocationMonitor;
- (void)stop;
- (void)stopLocationMonitor;
@end

@implementation NSPPrivacyProxyLocationMonitor

+ (id)sharedMonitor
{
  if (qword_100123168 != -1) {
    dispatch_once(&qword_100123168, &stru_1001053E8);
  }
  v2 = (void *)qword_100123160;

  return v2;
}

- (NSPPrivacyProxyLocationMonitor)init
{
  v14.receiver = self;
  v14.super_class = (Class)NSPPrivacyProxyLocationMonitor;
  v2 = [(NSPPrivacyProxyLocationMonitor *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_isMonitoringEnabled = 0;
    locationMonitorTimer = v2->_locationMonitorTimer;
    v2->_locationMonitorTimer = 0;

    objc_setProperty_atomic(v3, v5, 0, 32);
    [(NSPPrivacyProxyLocationMonitor *)v3 setDelegate:0];
    [(NSPPrivacyProxyLocationMonitor *)v3 setMonitorTimeInterval:1800.0];
    id v6 = objc_alloc((Class)CLLocationManager);
    v7 = NPGetInternalQueue();
    v8 = (CLLocationManager *)[v6 initWithEffectiveBundlePath:@"/System/Library/LocationBundles/NetworkServiceProxy.framework" delegate:v3 onQueue:v7];
    clLocationManager = v3->_clLocationManager;
    v3->_clLocationManager = v8;

    v10 = nplog_obj();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      unsigned int v11 = [(NSPPrivacyProxyLocationMonitor *)v3 isAuthorized];
      v12 = "is not";
      if (v11) {
        v12 = "is";
      }
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      __int16 v17 = 2080;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@: networkserviceproxy %s authorized to access location", buf, 0x16u);
    }

    [(CLLocationManager *)v3->_clLocationManager setDesiredAccuracy:kCLLocationAccuracyReduced];
  }
  return v3;
}

- (id)geohashFromLocation:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [v4 coordinate];
    [v4 coordinate];

    SEL v5 = latitudeLongitudeToGeohash();
  }
  else
  {
    SEL v5 = 0;
  }
  return v5;
}

- (void)refreshCountryPlusTimezone:(id)a3
{
  SEL v5 = (void (**)(void))a3;
  if (!v5)
  {
    v8 = nplog_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v14 = "-[NSPPrivacyProxyLocationMonitor refreshCountryPlusTimezone:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "%s called with null completion", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (self)
  {
    if (!objc_getProperty(self, v4, 40, 1))
    {
      v7 = objc_getProperty(self, v6, 32, 1);
      if (v7)
      {
        v8 = v7;
        id v9 = objc_alloc_init((Class)CLGeocoder);
        if (v9)
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472;
          v11[2] = sub_100009348;
          v11[3] = &unk_100105410;
          v11[4] = self;
          v12 = v5;
          [v9 reverseGeocodeLocation:v8 completionHandler:v11];
        }
        else
        {
          v10 = nplog_obj();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to initialize geocoder", buf, 2u);
          }

          v5[2](v5);
        }

LABEL_12:
        goto LABEL_13;
      }
    }
  }
  v5[2](v5);
LABEL_13:
}

- (NSString)currentCountryPlusTimezone
{
  if (self)
  {
    self = (NSPPrivacyProxyLocationMonitor *)objc_getProperty(self, a2, 40, 1);
    uint64_t v2 = vars8;
  }
  return (NSString *)self;
}

- (void)startLocationMonitor
{
  if (self
    && self->_isMonitoringEnabled
    && [(NSPPrivacyProxyLocationMonitor *)self isAuthorized]
    && !self->_locationMonitorTimer)
  {
    uint64_t v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: starting location monitoring", buf, 0xCu);
    }

    [(CLLocationManager *)self->_clLocationManager requestLocation];
    double monitorTimeInterval = self->_monitorTimeInterval;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000096F8;
    v7[3] = &unk_100105438;
    v7[4] = self;
    SEL v5 = +[NSTimer timerWithTimeInterval:1 repeats:v7 block:monitorTimeInterval];
    objc_storeStrong((id *)&self->_locationMonitorTimer, v5);

    id v6 = +[NSRunLoop mainRunLoop];
    [v6 addTimer:self->_locationMonitorTimer forMode:NSDefaultRunLoopMode];

    [(NSPPrivacyProxyLocationMonitor *)self setUserEventAgentTimer];
  }
}

- (void)start
{
  uint64_t v2 = self;
  if (self)
  {
    self->_isMonitoringEnabled = 1;
    self = (NSPPrivacyProxyLocationMonitor *)self->_clLocationManager;
  }
  [(NSPPrivacyProxyLocationMonitor *)self setDelegate:v2];
  self;
  uint64_t v3 = (void *)CFPreferencesCopyAppValue(@"NSPLastGeohash", kCFPreferencesCurrentApplication);
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  [(NSPPrivacyProxyLocationMonitor *)v2 setLastGeohash:v4];

  [(NSPPrivacyProxyLocationMonitor *)v2 startLocationMonitor];
}

- (void)stopLocationMonitor
{
  if (self && self->_locationMonitorTimer)
  {
    uint64_t v3 = nplog_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      SEL v5 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: stopping location monitoring", (uint8_t *)&v4, 0xCu);
    }

    [(NSTimer *)self->_locationMonitorTimer invalidate];
    sub_1000090C8((uint64_t)self, 0);
  }
}

- (void)stop
{
  [(NSPPrivacyProxyLocationMonitor *)self stopLocationMonitor];
  [(NSPPrivacyProxyLocationMonitor *)self setDelegate:0];
  if (self)
  {
    objc_setProperty_atomic(self, v3, 0, 32);
    [(NSPPrivacyProxyLocationMonitor *)self setLastGeohash:0];
    objc_setProperty_atomic(self, v4, 0, 40);
    [(CLLocationManager *)self->_clLocationManager setDelegate:0];
    self->_isMonitoringEnabled = 0;
  }
  else
  {
    [0 setLastGeohash:0];
    [0 setDelegate:0];
  }
}

- (BOOL)isCoreWLANAuthorized
{
  return 0;
}

- (BOOL)isAuthorized
{
  return +[CLLocationManager authorizationStatusForBundlePath:@"/System/Library/LocationBundles/NetworkServiceProxy.framework"]- 3 < 2;
}

- (void)setMonitorTimeInterval:(double)a3
{
  if (a3 >= 60.0 && a3 <= 1800.0)
  {
    SEL v5 = nplog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 138412546;
      v7 = self;
      __int16 v8 = 2048;
      double v9 = a3;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@: location monitoring interval changed to %lf", (uint8_t *)&v6, 0x16u);
    }

    self->_double monitorTimeInterval = a3;
    [(NSPPrivacyProxyLocationMonitor *)self stopLocationMonitor];
    [(NSPPrivacyProxyLocationMonitor *)self startLocationMonitor];
  }
}

- (void)setLastGeohash:(id)a3
{
}

- (void)setLastCountryPlusTimezone:(id)a3
{
}

- (void)setUserEventAgentTimer
{
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = sub_100005D3C;
  v5[4] = sub_100009C34;
  id v6 = (id)os_transaction_create();
  uint64_t v3 = NPGetInternalQueue();
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009C3C;
  v4[3] = &unk_100105460;
  v4[4] = self;
  v4[5] = v5;
  dispatch_async(v3, v4);

  _Block_object_dispose(v5, 8);
}

- (BOOL)checkSignificantLocationChange:(id)a3
{
  id v4 = a3;
  BOOL v9 = 0;
  if (self)
  {
    lastGeohash = self->_lastGeohash;
    if (lastGeohash)
    {
      id v6 = lastGeohash;
      v7 = [v4 substringWithRange:0, 2];
      unsigned int v8 = [(NSString *)v6 hasPrefix:v7];

      if (!v8) {
        BOOL v9 = 1;
      }
    }
  }

  return v9;
}

- (void)handleLocationUpdate:(id)a3
{
  id v5 = a3;
  if (self) {
    objc_setProperty_atomic(self, v4, v5, 32);
  }
  id v6 = [(NSPPrivacyProxyLocationMonitor *)self geohashFromLocation:v5];
  v7 = v6;
  if (v6 && ([v6 isEqualToString:self->_lastGeohash] & 1) == 0)
  {
    unsigned int v8 = [(NSPPrivacyProxyLocationMonitor *)self delegate];

    if (v8)
    {
      BOOL v9 = [(NSPPrivacyProxyLocationMonitor *)self delegate];
      [v9 didUpdateGeohash:v7];
    }
    id v10 = v7;
    self;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      CFPreferencesSetAppValue(@"NSPLastGeohash", v10, kCFPreferencesCurrentApplication);
      if (!CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication))
      {
        unsigned int v11 = nplog_obj();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to store Geohash to preferences", buf, 2u);
        }
      }
    }

    v12 = self->_lastGeohash;
    if (!v12
      || (v13 = v12,
          unsigned int v14 = [(NSPPrivacyProxyLocationMonitor *)self checkSignificantLocationChange:v10], v13, v14))
    {
      v15 = nplog_obj();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v19 = self;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%@: location changed significantly", buf, 0xCu);
      }

      objc_setProperty_atomic(self, v16, 0, 40);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100009FD0;
      v17[3] = &unk_100105488;
      v17[4] = self;
      [(NSPPrivacyProxyLocationMonitor *)self refreshCountryPlusTimezone:v17];
    }
    [(NSPPrivacyProxyLocationMonitor *)self setLastGeohash:v10];
  }
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = nplog_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unsigned int v5 = [(NSPPrivacyProxyLocationMonitor *)self isAuthorized];
    id v6 = "unauthorized";
    if (v5) {
      id v6 = "authorized";
    }
    int v7 = 138412546;
    unsigned int v8 = self;
    __int16 v9 = 2080;
    id v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@: received location authorization status update: [%s]", (uint8_t *)&v7, 0x16u);
  }

  if ([(NSPPrivacyProxyLocationMonitor *)self isAuthorized]) {
    [(NSPPrivacyProxyLocationMonitor *)self startLocationMonitor];
  }
  else {
    [(NSPPrivacyProxyLocationMonitor *)self stopLocationMonitor];
  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = nplog_obj();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = [v5 description];
    int v8 = 138412546;
    __int16 v9 = self;
    __int16 v10 = 2112;
    unsigned int v11 = v7;
    _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@: failed with error: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = nplog_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: received location update", (uint8_t *)&buf, 0xCu);
  }

  if (v7 && [v7 count])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x3032000000;
    SEL v16 = sub_100005D3C;
    __int16 v17 = sub_100009C34;
    id v18 = (id)os_transaction_create();
    __int16 v9 = NPGetInternalQueue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000A3F4;
    block[3] = &unk_100105358;
    id v11 = v7;
    v12 = self;
    p_long long buf = &buf;
    dispatch_async(v9, block);

    _Block_object_dispose(&buf, 8);
  }
}

- (NSPPrivacyProxyLocationMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NSPPrivacyProxyLocationMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGeohash, 0);
  objc_storeStrong((id *)&self->_locationMonitorTimer, 0);
  objc_storeStrong((id *)&self->_latestCountryPlusTimezone, 0);
  objc_storeStrong((id *)&self->_latestLocation, 0);
  objc_storeStrong((id *)&self->_clLocationManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end