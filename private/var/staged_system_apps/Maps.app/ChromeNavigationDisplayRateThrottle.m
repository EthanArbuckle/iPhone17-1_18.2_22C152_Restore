@interface ChromeNavigationDisplayRateThrottle
+ (BOOL)isAvailable;
+ (id)_defaultSettings;
+ (void)_clearAllSettings;
+ (void)initialize;
- ($0B703381901B85F5D0D61E0B9597699D)settings;
- (BOOL)_isLocationStationary:(id)a3;
- (BOOL)isEnabled;
- (BOOL)isIdle;
- (ChromeNavigationDisplayRateThrottle)init;
- (ChromeNavigationDisplayRateThrottleDelegate)delegate;
- (MKMapView)mapView;
- (NSString)description;
- (double)_scaleFactorWithValue:(double)a3 maximumValue:(double)a4 minimumValue:(double)a5;
- (id)_descriptionComponentsForSettings:(id *)a3;
- (int64_t)calculateThrottledDisplayRate;
- (void)_cancelWaitForNoMovement;
- (void)_checkForRecentMovement;
- (void)_notifyAfterChanges:(id)a3;
- (void)_notifyDelegateOfDisplayRate:(int64_t)a3;
- (void)_readFromDefaults;
- (void)_rememberNewDisplayRate:(int64_t)a3 reason:(id)a4;
- (void)_waitForNoMovement;
- (void)clearAllSettings;
- (void)dealloc;
- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIdle:(BOOL)a3;
- (void)setMapView:(id)a3;
- (void)setSettings:(id *)a3;
- (void)setTemporaryDisplayRate:(int64_t)a3 forDuration:(double)temporaryDisplayRateDuration;
@end

@implementation ChromeNavigationDisplayRateThrottle

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    v3 = [a1 _defaultSettings];
    [v4 registerDefaults:v3];
  }
}

+ (BOOL)isAvailable
{
  return GEOConfigGetBOOL();
}

+ (id)_defaultSettings
{
  return &off_1013AEA10;
}

- (void)dealloc
{
  self->_enabled = 0;
  objc_storeWeak((id *)&self->_delegate, 0);
  v3 = +[MNNavigationService sharedService];
  [v3 unregisterObserver:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimer);
  [WeakRetained invalidate];

  objc_storeWeak((id *)&self->_idleTimer, 0);
  id v5 = objc_loadWeakRetained((id *)&self->_temporaryDisplayRateTimer);
  [v5 invalidate];

  objc_storeWeak((id *)&self->_temporaryDisplayRateTimer, 0);
  v6.receiver = self;
  v6.super_class = (Class)ChromeNavigationDisplayRateThrottle;
  [(ChromeNavigationDisplayRateThrottle *)&v6 dealloc];
}

- (ChromeNavigationDisplayRateThrottle)init
{
  if ([(id)objc_opt_class() isAvailable])
  {
    v7.receiver = self;
    v7.super_class = (Class)ChromeNavigationDisplayRateThrottle;
    v3 = [(ChromeNavigationDisplayRateThrottle *)&v7 init];
    id v4 = v3;
    if (v3) {
      [(ChromeNavigationDisplayRateThrottle *)v3 _readFromDefaults];
    }
    self = v4;
    id v5 = self;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    id v5 = sub_1004A7478();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (a3)
    {
      if (v6)
      {
        *(_DWORD *)buf = 138412290;
        v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enabling throttle: %@", buf, 0xCu);
      }

      if (self->_settings.throttleWhenIdle)
      {
        objc_super v7 = +[MNNavigationService sharedService];
        [v7 registerObserver:self];

        [(ChromeNavigationDisplayRateThrottle *)self _waitForNoMovement];
      }
    }
    else
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Disabling throttle", buf, 2u);
      }

      latestMovingLocation = self->_latestMovingLocation;
      self->_latestMovingLocation = 0;

      v9 = +[MNNavigationService sharedService];
      [v9 unregisterObserver:self];

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1004A74CC;
      v10[3] = &unk_1012E5D08;
      v10[4] = self;
      [(ChromeNavigationDisplayRateThrottle *)self _notifyAfterChanges:v10];
    }
  }
}

- (void)setIdle:(BOOL)a3
{
  if (self->_idle != a3)
  {
    BOOL v3 = a3;
    self->_idle = a3;
    id v5 = sub_1004A7478();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Setting idle: %d", (uint8_t *)v6, 8u);
    }

    [(ChromeNavigationDisplayRateThrottle *)self _notifyDelegateOfDisplayRate:[(ChromeNavigationDisplayRateThrottle *)self calculateThrottledDisplayRate]];
  }
}

- (void)setSettings:(id *)a3
{
  *(_OWORD *)&self->_settings.type = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  long long v5 = *(_OWORD *)&a3->var4;
  long long v6 = *(_OWORD *)&a3->var6;
  *(_OWORD *)&self->_settings.maxMapSpan = *(_OWORD *)&a3->var8;
  *(_OWORD *)&self->_settings.maxZoomLevel = v6;
  *(_OWORD *)&self->_settings.maximumRate = v5;
  *(_OWORD *)&self->_settings.constantRate = v4;
  long long v7 = *(_OWORD *)&a3->var10;
  long long v8 = *(_OWORD *)&a3->var12;
  long long v9 = *(_OWORD *)&a3->var14;
  *(void *)&self->_settings.ignoreCameraStyle = *(void *)&a3->var16;
  *(_OWORD *)&self->_settings.idleTimeThreshold = v9;
  *(_OWORD *)&self->_settings.idleDisplayRate = v8;
  *(_OWORD *)&self->_settings.temporaryDisplayRateDuration = v7;
  if ([(ChromeNavigationDisplayRateThrottle *)self isEnabled])
  {
    int64_t v10 = [(ChromeNavigationDisplayRateThrottle *)self calculateThrottledDisplayRate];
    [(ChromeNavigationDisplayRateThrottle *)self _notifyDelegateOfDisplayRate:v10];
  }
}

- (int64_t)calculateThrottledDisplayRate
{
  BOOL v3 = sub_1004A7478();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v68 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Calculating throttled display rate", v68, 2u);
  }

  if ([(ChromeNavigationDisplayRateThrottle *)self isEnabled])
  {
    if (self->_temporaryDisplayRate >= 1)
    {
      -[ChromeNavigationDisplayRateThrottle _rememberNewDisplayRate:reason:](self, "_rememberNewDisplayRate:reason:");
      long long v4 = sub_1004A7478();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int64_t temporaryDisplayRate = self->_temporaryDisplayRate;
        *(_DWORD *)v68 = 134217984;
        *(void *)&v68[4] = temporaryDisplayRate;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Returning temporary display rate %ld", v68, 0xCu);
      }

      return self->_temporaryDisplayRate;
    }
    if ([(ChromeNavigationDisplayRateThrottle *)self isIdle] && self->_settings.throttleWhenIdle)
    {
      uint64_t idleDisplayRate = self->_settings.idleDisplayRate;
      if (idleDisplayRate <= 0) {
        uint64_t idleDisplayRate = self->_settings.minimumRate;
      }
      [(ChromeNavigationDisplayRateThrottle *)self _rememberNewDisplayRate:idleDisplayRate reason:@"idle"];
      long long v8 = sub_1004A7478();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v68 = 134217984;
        *(void *)&v68[4] = idleDisplayRate;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Returning idle display rate %ld", v68, 0xCu);
      }

      return idleDisplayRate;
    }
    unint64_t type = self->_settings.type;
    if (type != 3)
    {
      if (type != 2)
      {
        if (type == 1)
        {
          uint64_t idleDisplayRate = self->_settings.constantRate;
          int64_t v10 = sub_1004A7478();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
LABEL_60:

            goto LABEL_61;
          }
          *(_DWORD *)v68 = 134217984;
          *(void *)&v68[4] = idleDisplayRate;
          v11 = "Returning constant display rate %ld";
LABEL_59:
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, v68, 0xCu);
          goto LABEL_60;
        }
        uint64_t idleDisplayRate = 0;
LABEL_61:
        [(ChromeNavigationDisplayRateThrottle *)self _rememberNewDisplayRate:idleDisplayRate, @"calculated", *(_OWORD *)v68 reason];
        return idleDisplayRate;
      }
      v27 = [(ChromeNavigationDisplayRateThrottle *)self mapView];
      [v27 _minimumZoomLevel];
      double v29 = v28;

      double minZoomLevel = self->_settings.minZoomLevel;
      if (v29 <= minZoomLevel) {
        double v31 = self->_settings.minZoomLevel;
      }
      else {
        double v31 = v29;
      }
      if (minZoomLevel <= 0.0) {
        double v32 = v29;
      }
      else {
        double v32 = v31;
      }
      double v33 = ceil(v32);
      v34 = [(ChromeNavigationDisplayRateThrottle *)self mapView];
      [v34 _maximumZoomLevel];
      double v36 = v35;

      double maxZoomLevel = self->_settings.maxZoomLevel;
      if (v36 >= maxZoomLevel) {
        double v38 = self->_settings.maxZoomLevel;
      }
      else {
        double v38 = v36;
      }
      if (maxZoomLevel <= 0.0) {
        double v39 = v36;
      }
      else {
        double v39 = v38;
      }
      v40 = [(ChromeNavigationDisplayRateThrottle *)self mapView];
      [v40 _zoomLevel];
      double v42 = ceil(v41);

      if (v42 > v33)
      {
        if (v42 < ceil(v39))
        {
          -[ChromeNavigationDisplayRateThrottle _scaleFactorWithValue:maximumValue:minimumValue:](self, "_scaleFactorWithValue:maximumValue:minimumValue:", v42);
          int64_t v44 = vcvtpd_s64_f64(v43 * (double)self->_settings.maximumRate);
          if (self->_settings.minimumRate <= v44) {
            uint64_t idleDisplayRate = v44;
          }
          else {
            uint64_t idleDisplayRate = self->_settings.minimumRate;
          }
          int64_t v10 = sub_1004A7478();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
            goto LABEL_60;
          }
          *(_DWORD *)v68 = 134217984;
          *(void *)&v68[4] = idleDisplayRate;
          v11 = "Returning zoom level display rate %ld";
          goto LABEL_59;
        }
        goto LABEL_53;
      }
      goto LABEL_52;
    }
    mapSpanSubunint64_t type = self->_settings.mapSpanSubtype;
    if (mapSpanSubtype == 2)
    {
      v45 = [(ChromeNavigationDisplayRateThrottle *)self mapView];
      v46 = [v45 userLocation];
      v47 = [v46 location];
      [v47 coordinate];
      MKMapPoint v48 = MKMapPointForCoordinate(v69);

      v49 = +[MNNavigationService sharedService];
      v50 = [v49 route];

      v51 = [v50 destination];
      v52 = [v51 latLng];

      [v52 lat];
      CLLocationDegrees v54 = v53;
      [v52 lng];
      CLLocationCoordinate2D v70 = CLLocationCoordinate2DMake(v54, v55);
      MKMapPoint v71 = MKMapPointForCoordinate(v70);
      double v13 = MKMetersBetweenMapPoints(v48, v71);
    }
    else
    {
      if (mapSpanSubtype == 1)
      {
        v56 = [(ChromeNavigationDisplayRateThrottle *)self mapView];
        [v56 visibleMapRect];
        double v58 = v57;
        double v60 = v59;
        double v62 = v61;
        double v64 = v63;

        double v25 = v58 + v62 * 0.5;
        double v24 = v60 + v64;
        double v26 = v60;
        double v23 = v25;
        goto LABEL_49;
      }
      double v13 = 0.0;
      if (!mapSpanSubtype)
      {
        v14 = [(ChromeNavigationDisplayRateThrottle *)self mapView];
        [v14 visibleMapRect];
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;

        double v23 = v16 + v20;
        double v24 = v18 + v22;
        double v25 = v16;
        double v26 = v18;
LABEL_49:
        double v13 = MKMetersBetweenMapPoints(*(MKMapPoint *)&v25, *(MKMapPoint *)&v23);
      }
    }
    if (v13 <= self->_settings.minMapSpan)
    {
LABEL_53:
      uint64_t idleDisplayRate = self->_settings.maximumRate;
      goto LABEL_61;
    }
    if (v13 <= self->_settings.maxMapSpan)
    {
      -[ChromeNavigationDisplayRateThrottle _scaleFactorWithValue:maximumValue:minimumValue:](self, "_scaleFactorWithValue:maximumValue:minimumValue:", v13);
      int64_t v66 = vcvtpd_s64_f64((1.0 - v65) * (double)self->_settings.maximumRate);
      if (self->_settings.minimumRate <= v66) {
        uint64_t idleDisplayRate = v66;
      }
      else {
        uint64_t idleDisplayRate = self->_settings.minimumRate;
      }
      int64_t v10 = sub_1004A7478();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_60;
      }
      *(_DWORD *)v68 = 134217984;
      *(void *)&v68[4] = idleDisplayRate;
      v11 = "Returning map span level display rate %ld";
      goto LABEL_59;
    }
LABEL_52:
    uint64_t idleDisplayRate = self->_settings.minimumRate;
    goto LABEL_61;
  }
  [(ChromeNavigationDisplayRateThrottle *)self _rememberNewDisplayRate:0 reason:@"disabled"];
  long long v7 = sub_1004A7478();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v68 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "We are disabled; use 0 display rate", v68, 2u);
  }

  return 0;
}

- (double)_scaleFactorWithValue:(double)a3 maximumValue:(double)a4 minimumValue:(double)a5
{
  double v5 = 1.0;
  if (!self->_settings.scaling) {
    return (a3 - a5) / (a4 - a5);
  }
  return v5;
}

- (void)setTemporaryDisplayRate:(int64_t)a3 forDuration:(double)temporaryDisplayRateDuration
{
  long long v7 = sub_1004A7478();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    int64_t v14 = a3;
    __int16 v15 = 2048;
    double v16 = temporaryDisplayRateDuration;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Setting temporary display rate: %ld for duration: %f", buf, 0x16u);
  }

  if (temporaryDisplayRateDuration == -1.0) {
    temporaryDisplayRateDuration = self->_settings.temporaryDisplayRateDuration;
  }
  if (temporaryDisplayRateDuration < 0.0) {
    temporaryDisplayRateDuration = 0.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_temporaryDisplayRateTimer);
  [WeakRetained invalidate];

  objc_storeWeak((id *)&self->_temporaryDisplayRateTimer, 0);
  if (a3 >= 1 && temporaryDisplayRateDuration > 0.0)
  {
    objc_initWeak((id *)buf, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1004A7E54;
    v11[3] = &unk_1012E73C8;
    objc_copyWeak(&v12, (id *)buf);
    long long v9 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v11 block:temporaryDisplayRateDuration];
    objc_storeWeak((id *)&self->_temporaryDisplayRateTimer, v9);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  int64_t v10 = a3 & ~(a3 >> 63);
  if (self->_temporaryDisplayRate != v10)
  {
    self->_int64_t temporaryDisplayRate = v10;
    [(ChromeNavigationDisplayRateThrottle *)self _notifyDelegateOfDisplayRate:[(ChromeNavigationDisplayRateThrottle *)self calculateThrottledDisplayRate]];
  }
}

- (void)_rememberNewDisplayRate:(int64_t)a3 reason:(id)a4
{
  id v7 = a4;
  if (self->_lastCalculatedDisplayRate != a3)
  {
    long long v8 = sub_1004A7478();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v9 = +[NSNumber numberWithInteger:a3];
      int64_t v10 = +[NSNumber numberWithInteger:self->_lastCalculatedDisplayRate];
      int v11 = 138412802;
      id v12 = v9;
      __int16 v13 = 2112;
      int64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Navigation display rate change (new rate: %@, previous rate: %@, reason: %@)", (uint8_t *)&v11, 0x20u);
    }
    self->_lastCalculatedDisplayRate = a3;
    objc_storeStrong((id *)&self->_lastCalculatedDisplayRateReason, a4);
  }
}

- (void)_notifyDelegateOfDisplayRate:(int64_t)a3
{
  if (self->_batchingUpdates)
  {
    self->_finalBatchedDisplayRate = a3;
  }
  else
  {
    id v5 = [(ChromeNavigationDisplayRateThrottle *)self delegate];
    [v5 throttle:self calculatedNewDisplayRate:a3];
  }
}

- (void)_notifyAfterChanges:(id)a3
{
  long long v4 = (void (**)(void))a3;
  if (v4)
  {
    unint64_t batchingUpdates = self->_batchingUpdates;
    if (!batchingUpdates)
    {
      long long v6 = sub_1004A7478();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting batched rate changes", buf, 2u);
      }

      self->_initialBatchedDisplayRate = self->_lastCalculatedDisplayRate;
      unint64_t batchingUpdates = self->_batchingUpdates;
    }
    self->_unint64_t batchingUpdates = batchingUpdates + 1;
    v4[2](v4);
    unint64_t v7 = self->_batchingUpdates - 1;
    self->_unint64_t batchingUpdates = v7;
    if (!v7)
    {
      long long v8 = sub_1004A7478();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int64_t v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Ending batched rate changes", v10, 2u);
      }

      if (self->_initialBatchedDisplayRate != self->_finalBatchedDisplayRate)
      {
        -[ChromeNavigationDisplayRateThrottle _rememberNewDisplayRate:reason:](self, "_rememberNewDisplayRate:reason:");
        long long v9 = [(ChromeNavigationDisplayRateThrottle *)self delegate];
        [v9 throttle:self calculatedNewDisplayRate:self->_finalBatchedDisplayRate];
      }
      self->_initialBatchedDisplayRate = 0;
      self->_finalBatchedDisplayRate = 0;
    }
  }
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  id v6 = a4;
  if (!-[ChromeNavigationDisplayRateThrottle _isLocationStationary:](self, "_isLocationStationary:"))
  {
    objc_storeStrong((id *)&self->_latestMovingLocation, a4);
    [(ChromeNavigationDisplayRateThrottle *)self setIdle:0];
  }
  [(ChromeNavigationDisplayRateThrottle *)self _waitForNoMovement];
}

- (void)_waitForNoMovement
{
  p_idleTimer = &self->_idleTimer;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimer);
  if (WeakRetained)
  {
  }
  else if (self->_settings.throttleWhenIdle)
  {
    objc_initWeak(&location, self);
    double idleCheckInterval = self->_settings.idleCheckInterval;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1004A8380;
    v7[3] = &unk_1012E73C8;
    objc_copyWeak(&v8, &location);
    id v6 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v7 block:idleCheckInterval];
    objc_storeWeak((id *)p_idleTimer, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_cancelWaitForNoMovement
{
  [(ChromeNavigationDisplayRateThrottle *)self setIdle:0];
  p_idleTimer = &self->_idleTimer;
  id WeakRetained = objc_loadWeakRetained((id *)p_idleTimer);
  [WeakRetained invalidate];

  objc_storeWeak((id *)p_idleTimer, 0);
}

- (BOOL)_isLocationStationary:(id)a3
{
  [a3 speed];
  return v4 >= 0.0 && v4 <= self->_settings.idleSpeedThreshold;
}

- (void)_checkForRecentMovement
{
  BOOL v3 = +[MNNavigationService sharedService];
  id obj = [v3 lastLocation];

  if (![(ChromeNavigationDisplayRateThrottle *)self _isLocationStationary:obj]) {
    objc_storeStrong((id *)&self->_latestMovingLocation, obj);
  }
  if (![(ChromeNavigationDisplayRateThrottle *)self isEnabled]
    || (latestMovingLocation = self->_latestMovingLocation) == 0)
  {
    [(ChromeNavigationDisplayRateThrottle *)self setIdle:0];
LABEL_8:
    if ([(ChromeNavigationDisplayRateThrottle *)self isEnabled]) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  id v5 = [(MNLocation *)latestMovingLocation originalDate];
  [v5 timeIntervalSinceNow];
  double v7 = fabs(v6);
  double idleTimeThreshold = self->_settings.idleTimeThreshold;

  [(ChromeNavigationDisplayRateThrottle *)self setIdle:v7 >= idleTimeThreshold];
  if (v7 < idleTimeThreshold) {
    goto LABEL_8;
  }
LABEL_9:
  p_idleTimer = &self->_idleTimer;
  id WeakRetained = objc_loadWeakRetained((id *)p_idleTimer);
  [WeakRetained invalidate];

  objc_storeWeak((id *)p_idleTimer, 0);
LABEL_10:
}

- (void)clearAllSettings
{
  [(id)objc_opt_class() _clearAllSettings];

  [(ChromeNavigationDisplayRateThrottle *)self _readFromDefaults];
}

+ (void)_clearAllSettings
{
  v2 = sub_1004A7478();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Clearing throttle user defaults", buf, 2u);
  }

  BOOL v3 = [(id)objc_opt_class() _defaultSettings];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v4 = [v3 allKeys];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        int64_t v10 = +[NSUserDefaults standardUserDefaults];
        [v10 removeObjectForKey:v9];

        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }

  int v11 = +[NSUserDefaults standardUserDefaults];
  [v11 synchronize];
}

- (void)_readFromDefaults
{
  BOOL v3 = GEOConfigGetDictionary();
  double v4 = sub_1004A7478();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reading throttle GEO defaults", buf, 2u);
    }

    id v6 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleType"];
    self->_settings.unint64_t type = (unint64_t)[v6 integerValue];

    uint64_t v7 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleScaling"];
    self->_settings.scaling = (unint64_t)[v7 integerValue];

    id v8 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateIgnoreCameraStyle"];
    self->_settings.ignoreCameraStyle = [v8 BOOLValue];

    uint64_t v9 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateIgnoreConnectionType"];
    self->_settings.ignoreConnectionType = [v9 BOOLValue];

    int64_t v10 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleMinimum"];
    self->_settings.minimumRate = (int64_t)[v10 integerValue];

    int v11 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleMaximum"];
    self->_settings.maximumRate = (int64_t)[v11 integerValue];

    long long v12 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleConstant"];
    self->_settings.constantRate = (int64_t)[v12 integerValue];

    long long v13 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleZoomLevelMin"];
    [v13 doubleValue];
    self->_settings.double minZoomLevel = v14;

    long long v15 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleZoomLevelMax"];
    [v15 doubleValue];
    self->_settings.double maxZoomLevel = v16;

    double v17 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleMapSpanMin"];
    [v17 doubleValue];
    self->_settings.minMapSpan = v18;

    double v19 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleMapSpanMax"];
    [v19 doubleValue];
    self->_settings.maxMapSpan = v20;

    double v21 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleMapSpanSubtype"];
    self->_settings.mapSpanSubunint64_t type = (unint64_t)[v21 integerValue];

    double v22 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateTemporaryDuration"];
    [v22 doubleValue];
    self->_settings.temporaryDisplayRateDuration = v23;

    double v24 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleWhenIdle"];
    self->_settings.throttleWhenIdle = [v24 BOOLValue];

    double v25 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleIdleRate"];
    self->_settings.uint64_t idleDisplayRate = (int64_t)[v25 integerValue];

    double v26 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleIdleCheckInterval"];
    [v26 doubleValue];
    self->_settings.double idleCheckInterval = v27;

    double v28 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleIdleTimeThreshold"];
    [v28 doubleValue];
    self->_settings.double idleTimeThreshold = v29;

    v30 = [v3 objectForKeyedSubscript:@"ChromeNavigationDisplayRateThrottleIdleSpeedThreshold"];
    [v30 doubleValue];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)double v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Reading throttle user defaults", v39, 2u);
    }

    v30 = +[NSUserDefaults standardUserDefaults];
    self->_settings.unint64_t type = (unint64_t)[v30 integerForKey:@"ChromeNavigationDisplayRateThrottleType"];
    self->_settings.scaling = (unint64_t)[v30 integerForKey:@"ChromeNavigationDisplayRateThrottleScaling"];
    self->_settings.ignoreCameraStyle = [v30 BOOLForKey:@"ChromeNavigationDisplayRateIgnoreCameraStyle"];
    self->_settings.ignoreConnectionType = [v30 BOOLForKey:@"ChromeNavigationDisplayRateIgnoreConnectionType"];
    self->_settings.minimumRate = (int64_t)[v30 integerForKey:@"ChromeNavigationDisplayRateThrottleMinimum"];
    self->_settings.maximumRate = (int64_t)[v30 integerForKey:@"ChromeNavigationDisplayRateThrottleMaximum"];
    self->_settings.constantRate = (int64_t)[v30 integerForKey:@"ChromeNavigationDisplayRateThrottleConstant"];
    [v30 doubleForKey:@"ChromeNavigationDisplayRateThrottleZoomLevelMin"];
    self->_settings.double minZoomLevel = v32;
    [v30 doubleForKey:@"ChromeNavigationDisplayRateThrottleZoomLevelMax"];
    self->_settings.double maxZoomLevel = v33;
    [v30 doubleForKey:@"ChromeNavigationDisplayRateThrottleMapSpanMin"];
    self->_settings.minMapSpan = v34;
    [v30 doubleForKey:@"ChromeNavigationDisplayRateThrottleMapSpanMax"];
    self->_settings.maxMapSpan = v35;
    self->_settings.mapSpanSubunint64_t type = (unint64_t)[v30 integerForKey:@"ChromeNavigationDisplayRateThrottleMapSpanSubtype"];
    [v30 doubleForKey:@"ChromeNavigationDisplayRateTemporaryDuration"];
    self->_settings.temporaryDisplayRateDuration = v36;
    self->_settings.throttleWhenIdle = [v30 BOOLForKey:@"ChromeNavigationDisplayRateThrottleWhenIdle"];
    self->_settings.uint64_t idleDisplayRate = (int64_t)[v30 integerForKey:@"ChromeNavigationDisplayRateThrottleIdleRate"];
    [v30 doubleForKey:@"ChromeNavigationDisplayRateThrottleIdleCheckInterval"];
    self->_settings.double idleCheckInterval = v37;
    [v30 doubleForKey:@"ChromeNavigationDisplayRateThrottleIdleTimeThreshold"];
    self->_settings.double idleTimeThreshold = v38;
    [v30 doubleForKey:@"ChromeNavigationDisplayRateThrottleIdleSpeedThreshold"];
  }
  self->_settings.idleSpeedThreshold = v31;
}

- (NSString)description
{
  long long v3 = *(_OWORD *)&self->_settings.temporaryDisplayRateDuration;
  long long v4 = *(_OWORD *)&self->_settings.idleTimeThreshold;
  v13[6] = *(_OWORD *)&self->_settings.idleDisplayRate;
  v13[7] = v4;
  uint64_t v14 = *(void *)&self->_settings.ignoreCameraStyle;
  long long v5 = *(_OWORD *)&self->_settings.constantRate;
  long long v6 = *(_OWORD *)&self->_settings.maxZoomLevel;
  v13[2] = *(_OWORD *)&self->_settings.maximumRate;
  v13[3] = v6;
  v13[4] = *(_OWORD *)&self->_settings.maxMapSpan;
  v13[5] = v3;
  v13[0] = *(_OWORD *)&self->_settings.type;
  v13[1] = v5;
  uint64_t v7 = [(ChromeNavigationDisplayRateThrottle *)self _descriptionComponentsForSettings:v13];
  v12.receiver = self;
  v12.super_class = (Class)ChromeNavigationDisplayRateThrottle;
  id v8 = [(ChromeNavigationDisplayRateThrottle *)&v12 description];
  uint64_t v9 = [v7 componentsJoinedByString:@", "];
  int64_t v10 = +[NSString stringWithFormat:@"%@ (%@)", v8, v9];

  return (NSString *)v10;
}

- (id)_descriptionComponentsForSettings:(id *)a3
{
  long long v4 = +[NSMutableArray array];
  unint64_t var0 = a3->var0;
  long long v6 = sub_1004A92DC(a3->var0);
  uint64_t v7 = +[NSString stringWithFormat:@"type: %@", v6];
  [v4 addObject:v7];

  switch(var0)
  {
    case 3uLL:
      uint64_t v9 = sub_1004A93F4(a3->var9);
      int64_t v10 = +[NSString stringWithFormat:@"subtype: %@", v9];
      [v4 addObject:v10];

      int v11 = sub_1004A936C(a3->var1);
      objc_super v12 = +[NSString stringWithFormat:@"scaling: %@", v11];
      [v4 addObject:v12];

      long long v13 = +[NSNumber numberWithInteger:a3->var3];
      uint64_t v14 = +[NSString stringWithFormat:@"min rate: %@", v13];
      [v4 addObject:v14];

      long long v15 = +[NSNumber numberWithDouble:a3->var7];
      double v16 = +[NSString stringWithFormat:@"at min span: %@", v15];
      [v4 addObject:v16];

      double v17 = +[NSNumber numberWithInteger:a3->var4];
      double v18 = +[NSString stringWithFormat:@"max rate: %@", v17];
      [v4 addObject:v18];

      id v8 = +[NSNumber numberWithDouble:a3->var8];
      +[NSString stringWithFormat:@"at max span: %@", v8];
      break;
    case 2uLL:
      double v19 = sub_1004A936C(a3->var1);
      double v20 = +[NSString stringWithFormat:@"scaling: %@", v19];
      [v4 addObject:v20];

      double v21 = +[NSNumber numberWithInteger:a3->var4];
      double v22 = +[NSString stringWithFormat:@"max rate: %@", v21];
      [v4 addObject:v22];

      double v23 = +[NSNumber numberWithDouble:a3->var6];
      double v24 = +[NSString stringWithFormat:@"at max zoom: %@", v23];
      [v4 addObject:v24];

      double v25 = +[NSNumber numberWithInteger:a3->var3];
      double v26 = +[NSString stringWithFormat:@"min rate: %@", v25];
      [v4 addObject:v26];

      id v8 = +[NSNumber numberWithDouble:a3->var5];
      +[NSString stringWithFormat:@"at min zoom: %@", v8];
      break;
    case 1uLL:
      id v8 = +[NSNumber numberWithInteger:a3->var2];
      +[NSString stringWithFormat:@"constant rate: %@", v8];
      break;
    default:
      goto LABEL_8;
  double v27 = };
  [v4 addObject:v27];

LABEL_8:
  if (a3->var17) {
    CFStringRef v28 = @"YES";
  }
  else {
    CFStringRef v28 = @"NO";
  }
  double v29 = +[NSString stringWithFormat:@"ignore connection type: %@", v28];
  [v4 addObject:v29];

  if (a3->var16) {
    CFStringRef v30 = @"YES";
  }
  else {
    CFStringRef v30 = @"NO";
  }
  double v31 = +[NSString stringWithFormat:@"ignore camera style: %@", v30];
  [v4 addObject:v31];

  double v32 = +[NSNumber numberWithDouble:a3->var10];
  double v33 = +[NSString stringWithFormat:@"temporary rate duration: %@", v32];
  [v4 addObject:v33];

  if (a3->var11) {
    CFStringRef v34 = @"YES";
  }
  else {
    CFStringRef v34 = @"NO";
  }
  double v35 = +[NSString stringWithFormat:@"throttle when idle: %@", v34];
  [v4 addObject:v35];

  if (a3->var11)
  {
    double v36 = +[NSNumber numberWithDouble:a3->var13];
    double v37 = +[NSString stringWithFormat:@"idle check every: %@s", v36];
    [v4 addObject:v37];

    double v38 = +[NSNumber numberWithDouble:a3->var14];
    double v39 = +[NSString stringWithFormat:@"idle after: %@s", v38];
    [v4 addObject:v39];

    v40 = +[NSNumber numberWithDouble:a3->var15];
    double v41 = +[NSString stringWithFormat:@"idle speed threshold: %@m/s", v40];
    [v4 addObject:v41];
  }
  id v42 = [v4 copy];

  return v42;
}

- (ChromeNavigationDisplayRateThrottleDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ChromeNavigationDisplayRateThrottleDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isIdle
{
  return self->_idle;
}

- ($0B703381901B85F5D0D61E0B9597699D)settings
{
  long long v3 = *(_OWORD *)&self[1].var6;
  long long v4 = *(_OWORD *)&self[1].var10;
  *(_OWORD *)&retstr->var12 = *(_OWORD *)&self[1].var8;
  *(_OWORD *)&retstr->var14 = v4;
  *(void *)&retstr->var16 = self[1].var12;
  long long v5 = *(_OWORD *)&self->var15;
  long long v6 = *(_OWORD *)&self[1].var2;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var6 = v6;
  *(_OWORD *)&retstr->var8 = *(_OWORD *)&self[1].var4;
  *(_OWORD *)&retstr->var10 = v3;
  *(_OWORD *)&retstr->unint64_t var0 = *(_OWORD *)&self->var13;
  *(_OWORD *)&retstr->var2 = v5;
  return self;
}

- (MKMapView)mapView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);

  return (MKMapView *)WeakRetained;
}

- (void)setMapView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mapView);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_idleTimer);
  objc_destroyWeak((id *)&self->_temporaryDisplayRateTimer);
  objc_storeStrong((id *)&self->_latestMovingLocation, 0);

  objc_storeStrong((id *)&self->_lastCalculatedDisplayRateReason, 0);
}

@end