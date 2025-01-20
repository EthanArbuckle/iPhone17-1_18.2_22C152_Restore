@interface Locator
- (BOOL)finished;
- (BOOL)locatorRunning;
- (CLLocation)lastLocation;
- (CLLocation)locationForPublish;
- (CLLocationManager)locManager;
- (Locator)initWithLocationManager:(id)a3;
- (NSTimer)finishedTimer;
- (NSTimer)publishTimer;
- (double)cachedLocValidityDuration;
- (double)currentThreshold;
- (double)decayFactor;
- (double)desiredAccuracy;
- (double)duration;
- (double)endThreshold;
- (double)lastPublishedAccuracy;
- (double)launchTime;
- (double)startThreshold;
- (id)powerAssertionName;
- (id)receivedLocationBlock;
- (id)stoppedLocatorBlock;
- (id)xpcTransactionName;
- (int)currentDecayMultiplier;
- (int)numPublished;
- (int64_t)lastPublishReason;
- (void)_discardLocationManager;
- (void)_processStopTimeout:(id)a3;
- (void)_publishResultLocation:(id)a3;
- (void)dealloc;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setCachedLocValidityDuration:(double)a3;
- (void)setCurrentDecayMultiplier:(int)a3;
- (void)setCurrentThreshold:(double)a3;
- (void)setDecayFactor:(double)a3;
- (void)setDesiredAccuracy:(double)a3;
- (void)setDuration:(double)a3;
- (void)setEndThreshold:(double)a3;
- (void)setFinished:(BOOL)a3;
- (void)setFinishedTimer:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)setLastPublishReason:(int64_t)a3;
- (void)setLastPublishedAccuracy:(double)a3;
- (void)setLaunchTime:(double)a3;
- (void)setLocManager:(id)a3;
- (void)setLocationForPublish:(id)a3;
- (void)setLocatorRunning:(BOOL)a3;
- (void)setNumPublished:(int)a3;
- (void)setPublishTimer:(id)a3;
- (void)setReceivedLocationBlock:(id)a3;
- (void)setStartThreshold:(double)a3;
- (void)setStoppedLocatorBlock:(id)a3;
- (void)startLocator;
- (void)stopLocator;
@end

@implementation Locator

- (void)dealloc
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100036B9C(self);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005E74;
  v10[3] = &unk_100059350;
  v10[4] = self;
  v4 = objc_retainBlock(v10);
  if (+[NSThread isMainThread])
  {
    ((void (*)(void *))v4[2])(v4);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005EE0;
    block[3] = &unk_100059378;
    v9 = v4;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
  v5 = [(Locator *)self finishedTimer];
  [v5 invalidate];

  v6 = [(Locator *)self publishTimer];
  [v6 invalidate];

  v7.receiver = self;
  v7.super_class = (Class)Locator;
  [(Locator *)&v7 dealloc];
}

- (Locator)initWithLocationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)Locator;
  v6 = [(Locator *)&v9 init];
  objc_super v7 = (Locator *)v6;
  if (v6)
  {
    *(_OWORD *)(v6 + 40) = xmmword_10004DB30;
    *(_OWORD *)(v6 + 24) = xmmword_10004DB40;
    *(_OWORD *)(v6 + 56) = xmmword_10004DB50;
    objc_storeStrong((id *)v6 + 12, a3);
    [(CLLocationManager *)v7->_locManager setDelegate:v7];
    [(CLLocationManager *)v7->_locManager setDesiredAccuracy:v7->_desiredAccuracy];
    [(CLLocationManager *)v7->_locManager setDistanceFilter:kCLDistanceFilterNone];
  }

  return v7;
}

- (id)powerAssertionName
{
  return +[NSString stringWithFormat:@"%@-%lX", @"Locating", self];
}

- (id)xpcTransactionName
{
  return +[NSString stringWithFormat:@"Locating-%lX", self];
}

- (void)startLocator
{
  if (![(Locator *)self locatorRunning])
  {
    v3 = +[PowerMgr sharedInstance];
    v4 = [(Locator *)self powerAssertionName];
    [v3 powerAssertionEnableWithReason:v4 timeout:(uint64_t)(self->_duration + 2.0)];

    id v5 = +[FMXPCTransactionManager sharedInstance];
    v6 = [(Locator *)self xpcTransactionName];
    [v5 beginTransaction:v6];

    [(Locator *)self setFinished:0];
    [(Locator *)self setLocatorRunning:1];
    self->_launchTime = CFAbsoluteTimeGetCurrent();
    self->_currentDecayMultiplier = 0;
    self->_numPublished = 0;
    self->_currentThreshold = self->_startThreshold;
    objc_super v7 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_processStopTimeout:" selector:0 userInfo:0 repeats:self->_duration];
    [(Locator *)self setFinishedTimer:v7];

    v8 = sub_10001B6D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v9 = [(Locator *)self fm_logID];
      int v10 = 138412290;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@ Starting location service now", (uint8_t *)&v10, 0xCu);
    }
    [(CLLocationManager *)self->_locManager startUpdatingLocation];
  }
}

- (void)stopLocator
{
  v3 = sub_10001B6D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(Locator *)self fm_logID];
    int v14 = 138412290;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ Stopping location service now", (uint8_t *)&v14, 0xCu);
  }
  [(Locator *)self setLocatorRunning:0];
  id v5 = [(Locator *)self locManager];

  if (v5) {
    [(Locator *)self _discardLocationManager];
  }
  v6 = [(Locator *)self finishedTimer];

  if (v6)
  {
    objc_super v7 = [(Locator *)self finishedTimer];
    [v7 invalidate];

    [(Locator *)self setFinishedTimer:0];
  }
  v8 = [(Locator *)self publishTimer];

  if (v8)
  {
    objc_super v9 = [(Locator *)self publishTimer];
    [v9 invalidate];

    [(Locator *)self setPublishTimer:0];
  }
  self->_numPublished = 0;
  [(Locator *)self setLastLocation:0];
  [(Locator *)self setLocationForPublish:0];
  if (self->_stoppedLocatorBlock) {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, self->_stoppedLocatorBlock);
  }
  int v10 = +[PowerMgr sharedInstance];
  v11 = [(Locator *)self powerAssertionName];
  [v10 powerAssertionDisableWithReason:v11];

  v12 = +[FMXPCTransactionManager sharedInstance];
  v13 = [(Locator *)self xpcTransactionName];
  [v12 endTransaction:v13];
}

- (void)_discardLocationManager
{
  v3 = [(Locator *)self locManager];

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006484;
    block[3] = &unk_100059350;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 count])
  {
    v8 = [v7 lastObject];
    objc_super v9 = v8;
    if (!v8)
    {
LABEL_39:

      goto LABEL_40;
    }
    int v10 = +[CommonUtil stringForLocationType:](CommonUtil, "stringForLocationType:", [v8 type]);
    v11 = sub_10001B76C();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = [(Locator *)self fm_logID];
      [v9 horizontalAccuracy];
      uint64_t v14 = v13;
      [v9 coordinate];
      double v16 = v15;
      [v9 coordinate];
      uint64_t v18 = v17;
      v19 = [v9 timestamp];
      *(_DWORD *)buf = 138413571;
      v95 = v12;
      __int16 v96 = 2112;
      uint64_t v97 = (uint64_t)v10;
      __int16 v98 = 2049;
      uint64_t v99 = v14;
      __int16 v100 = 2049;
      double v101 = v16;
      __int16 v102 = 2049;
      uint64_t v103 = v18;
      __int16 v104 = 2112;
      v105 = v19;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Received location with Position Type = %@, Accuracy = %{private}f, Latitude = %{private}f, Longitude = %{private}f, Timestamp = %@", buf, 0x3Eu);
    }
    if (![(Locator *)self locatorRunning])
    {
      v27 = sub_10001B6D4();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        sub_100036C24(self);
      }

      [v6 setDelegate:0];
      [v6 stopUpdatingLocation];
      id v28 = [(Locator *)self locManager];

      if (v28 == v6) {
        [(Locator *)self _discardLocationManager];
      }
      goto LABEL_38;
    }
    [v9 horizontalAccuracy];
    if (v20 < 0.0)
    {
      v21 = sub_10001B6D4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = [(Locator *)self fm_logID];
        [v9 horizontalAccuracy];
        *(_DWORD *)buf = 138412546;
        v95 = v22;
        __int16 v96 = 2048;
        uint64_t v97 = v23;
        v24 = "%@ Location has a -ve horizontalAccuracy (%.2f). Not using it";
LABEL_9:
        v25 = v21;
        uint32_t v26 = 22;
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v24, buf, v26);

        goto LABEL_37;
      }
      goto LABEL_37;
    }
    [v9 horizontalAccuracy];
    if (v29 > self->_startThreshold)
    {
      v21 = sub_10001B6D4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v30 = [(Locator *)self fm_logID];
        [v9 horizontalAccuracy];
        double startThreshold = self->_startThreshold;
        *(_DWORD *)buf = 138412802;
        v95 = v30;
        __int16 v96 = 2048;
        uint64_t v97 = v32;
        __int16 v98 = 2048;
        uint64_t v99 = *(void *)&startThreshold;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ Location has a horizontalAccuracy of %.2f > start threshold %.2f. Not using it", buf, 0x20u);
      }
      goto LABEL_37;
    }
    v33 = [v9 timestamp];
    [v33 timeIntervalSinceReferenceDate];
    double v35 = v34;
    double v36 = self->_launchTime - self->_cachedLocValidityDuration;

    if (v35 <= v36)
    {
      v21 = sub_10001B6D4();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      v22 = [(Locator *)self fm_logID];
      *(_DWORD *)buf = 138412290;
      v95 = v22;
      v24 = "%@ Location is really old. Discarding it & waiting for a newer one";
      goto LABEL_35;
    }
    v37 = [v9 timestamp];
    [v37 timeIntervalSinceReferenceDate];
    double v39 = v38;
    double launchTime = self->_launchTime;

    if (v39 < launchTime)
    {
      v41 = sub_10001B6D4();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = [(Locator *)self fm_logID];
        double cachedLocValidityDuration = self->_cachedLocValidityDuration;
        *(_DWORD *)buf = 138412546;
        v95 = v42;
        __int16 v96 = 2048;
        uint64_t v97 = *(void *)&cachedLocValidityDuration;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%@ Location is an old cached one but not older than %.0f seconds before the start of this cycle. Considering it for later use", buf, 0x16u);
      }
      uint64_t v44 = 0;
      int v45 = 1;
LABEL_22:

      goto LABEL_23;
    }
    [v9 horizontalAccuracy];
    if (v57 <= self->_endThreshold)
    {
      v69 = sub_10001B6D4();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        v70 = [(Locator *)self fm_logID];
        double endThreshold = self->_endThreshold;
        *(_DWORD *)buf = 138412546;
        v95 = v70;
        __int16 v96 = 2048;
        uint64_t v97 = *(void *)&endThreshold;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%@ Location has accuracy below the end threshold %f. Publishing it immediately & finishing the locate cycle", buf, 0x16u);
      }
      [(Locator *)self setLocationForPublish:v9];
      [(Locator *)self setLastPublishReason:3];
      v72 = [(Locator *)self publishTimer];

      if (v72)
      {
        v73 = [(Locator *)self publishTimer];
        [v73 invalidate];

        [(Locator *)self setPublishTimer:0];
      }
      [(Locator *)self setFinished:1];
      [(Locator *)self _publishResultLocation:0];
      [(Locator *)self performSelectorOnMainThread:"stopLocator" withObject:0 waitUntilDone:0];
      goto LABEL_38;
    }
    [v9 horizontalAccuracy];
    if (v58 >= self->_currentThreshold)
    {
      int v45 = 0;
      uint64_t v44 = 0;
    }
    else
    {
      v59 = sub_10001B6D4();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        v60 = [(Locator *)self fm_logID];
        double currentThreshold = self->_currentThreshold;
        *(_DWORD *)buf = 138412802;
        v95 = v60;
        __int16 v96 = 2048;
        uint64_t v97 = *(void *)&currentThreshold;
        __int16 v98 = 2048;
        uint64_t v99 = 0x4000000000000000;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "%@ Location has accuracy within current publish threshold of %.2f. Publishing it within the next %f seconds", buf, 0x20u);
      }
      do
      {
        int v62 = self->_currentDecayMultiplier + 1;
        self->_currentDecayMultiplier = v62;
        double v63 = self->_startThreshold;
        double v64 = v63 * exp(-(self->_decayFactor * (double)v62));
        self->_double currentThreshold = v64;
        [v9 horizontalAccuracy];
      }
      while (v64 >= v65);
      v66 = sub_10001B6D4();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
      {
        v67 = [(Locator *)self fm_logID];
        double v68 = self->_currentThreshold;
        *(_DWORD *)buf = 138412546;
        v95 = v67;
        __int16 v96 = 2048;
        uint64_t v97 = *(void *)&v68;
        _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "%@ New publish threshold is %.2f", buf, 0x16u);
      }
      int v45 = 1;
      uint64_t v44 = 2;
    }
    uint64_t v76 = [(Locator *)self lastLocation];
    if (v76)
    {
      v77 = v76;
    }
    else
    {
      [v9 horizontalAccuracy];
      if (v78 > self->_startThreshold)
      {
LABEL_68:
        v81 = [(Locator *)self lastLocation];

        if (!v81 || ![v9 type]) {
          goto LABEL_23;
        }
        uint64_t v93 = v44;
        unsigned int v82 = [v9 type];
        v83 = [(Locator *)self lastLocation];
        unsigned int v84 = [v83 type];

        if (v82 == v84)
        {
          uint64_t v44 = v93;
        }
        else
        {
          v86 = [(Locator *)self lastLocation];
          [v86 distanceFromLocation:v9];
          double v88 = v87;

          uint64_t v44 = v93;
          if (v88 >= 5.0)
          {
            v41 = sub_10001B6D4();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              v89 = [(Locator *)self fm_logID];
              v90 = [(Locator *)self lastLocation];
              v91 = +[CommonUtil stringForLocationType:](CommonUtil, "stringForLocationType:", [v90 type]);
              v92 = +[CommonUtil stringForLocationType:](CommonUtil, "stringForLocationType:", [v9 type]);
              *(_DWORD *)buf = 138413058;
              v95 = v89;
              __int16 v96 = 2112;
              uint64_t v97 = (uint64_t)v91;
              __int16 v98 = 2112;
              uint64_t v99 = (uint64_t)v92;
              __int16 v100 = 2048;
              double v101 = v88;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "%@ Location type changed from %@ to %@ with distance traveled %.2lf. Publishing it immediately", buf, 0x2Au);
            }
            int v45 = 2;
            uint64_t v44 = 4;
            goto LABEL_22;
          }
        }
LABEL_23:
        uint64_t v46 = [(Locator *)self lastLocation];
        if (!v46) {
          goto LABEL_25;
        }
        v47 = (void *)v46;
        [v9 horizontalAccuracy];
        double v49 = v48;
        v50 = [(Locator *)self lastLocation];
        [v50 horizontalAccuracy];
        double v52 = v51;

        if (v49 <= v52)
        {
LABEL_25:
          v53 = sub_10001B6D4();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            v54 = [(Locator *)self fm_logID];
            *(_DWORD *)buf = 138412290;
            v95 = v54;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%@ Storing this location as the best last known location in this locate cycle", buf, 0xCu);
          }
          [(Locator *)self setLastLocation:v9];
        }
        [(Locator *)self setLocationForPublish:v9];
        [(Locator *)self setLastPublishReason:v44];
        if (v45)
        {
          if (v45 != 1)
          {
            v55 = [(Locator *)self publishTimer];

            if (v55)
            {
              v56 = [(Locator *)self publishTimer];
              [v56 invalidate];

              [(Locator *)self setPublishTimer:0];
            }
            [(Locator *)self _publishResultLocation:0];
            goto LABEL_38;
          }
          v74 = [(Locator *)self publishTimer];

          v21 = sub_10001B6D4();
          BOOL v75 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          if (!v74)
          {
            if (v75)
            {
              v85 = [(Locator *)self fm_logID];
              *(_DWORD *)buf = 138412546;
              v95 = v85;
              __int16 v96 = 2048;
              uint64_t v97 = 0x4000000000000000;
              _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%@ Scheduling the location to be published in %f seconds", buf, 0x16u);
            }
            v21 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_publishResultLocation:" selector:0 userInfo:0 repeats:2.0];
            [(Locator *)self setPublishTimer:v21];
            goto LABEL_37;
          }
          if (v75)
          {
            v22 = [(Locator *)self fm_logID];
            *(_DWORD *)buf = 138412546;
            v95 = v22;
            __int16 v96 = 2048;
            uint64_t v97 = 0x4000000000000000;
            v24 = "%@ A timer is already running to publish the location within the next %f seconds";
            goto LABEL_9;
          }
LABEL_37:

LABEL_38:
          goto LABEL_39;
        }
        v21 = sub_10001B6D4();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_37;
        }
        v22 = [(Locator *)self fm_logID];
        *(_DWORD *)buf = 138412290;
        v95 = v22;
        v24 = "%@ Not publishing this location";
LABEL_35:
        v25 = v21;
        uint32_t v26 = 12;
        goto LABEL_36;
      }
      v77 = sub_10001B6D4();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        v79 = [(Locator *)self fm_logID];
        double v80 = self->_startThreshold;
        *(_DWORD *)buf = 138412546;
        v95 = v79;
        __int16 v96 = 2048;
        uint64_t v97 = *(void *)&v80;
        _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, "%@ This is the first location with accuracy below the start threshold %.2f. Publishing it immediately", buf, 0x16u);
      }
      int v45 = 2;
      uint64_t v44 = 1;
    }

    goto LABEL_68;
  }
LABEL_40:
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  id v6 = sub_10001B6D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(Locator *)self fm_logID];
    int v11 = 138412546;
    v12 = v7;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ Location updates failed with error: %@", (uint8_t *)&v11, 0x16u);
  }
  v8 = [v5 domain];
  if (![v8 isEqualToString:kCLErrorDomain])
  {

    goto LABEL_9;
  }
  id v9 = [v5 code];

  if (v9)
  {
LABEL_9:
    [(Locator *)self stopLocator];
    goto LABEL_10;
  }
  int v10 = sub_10001B6D4();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not stopping the locator service because the error is temporary.", (uint8_t *)&v11, 2u);
  }

LABEL_10:
}

- (void)_processStopTimeout:(id)a3
{
  v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(Locator *)self fm_logID];
    int v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Location Services ending now after timeout", (uint8_t *)&v7, 0xCu);
  }
  [(Locator *)self setLocatorRunning:0];
  id v6 = [(Locator *)self lastLocation];

  if (v6)
  {
    [(Locator *)self setFinished:1];
    [(Locator *)self setLastPublishReason:5];
    [(Locator *)self _publishResultLocation:0];
  }
  [(Locator *)self stopLocator];
}

- (void)_publishResultLocation:(id)a3
{
  v4 = sub_10001B6D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(Locator *)self fm_logID];
    int v17 = 138412546;
    uint64_t v18 = v5;
    __int16 v19 = 2048;
    int64_t v20 = [(Locator *)self lastPublishReason];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Publishing the location to the server for reason %ld", (uint8_t *)&v17, 0x16u);
  }
  id v6 = [(Locator *)self publishTimer];

  if (v6)
  {
    int v7 = [(Locator *)self publishTimer];
    [v7 invalidate];

    [(Locator *)self setPublishTimer:0];
  }
  [(Locator *)self lastPublishedAccuracy];
  double v8 = 0.0;
  if (v9 > 0.0)
  {
    [(Locator *)self lastPublishedAccuracy];
    double v11 = v10;
    v12 = [(Locator *)self locationForPublish];
    [v12 horizontalAccuracy];
    double v8 = v11 - v13;
  }
  receivedLocationBlock = (void (**)(id, void *, BOOL, int64_t, double))self->_receivedLocationBlock;
  if (receivedLocationBlock)
  {
    double v15 = [(Locator *)self locationForPublish];
    receivedLocationBlock[2](receivedLocationBlock, v15, [(Locator *)self finished], [(Locator *)self lastPublishReason], v8);
  }
  double v16 = [(Locator *)self locationForPublish];
  [v16 horizontalAccuracy];
  -[Locator setLastPublishedAccuracy:](self, "setLastPublishedAccuracy:");

  ++self->_numPublished;
}

- (double)desiredAccuracy
{
  return self->_desiredAccuracy;
}

- (void)setDesiredAccuracy:(double)a3
{
  self->_desiredAccuracy = a3;
}

- (double)startThreshold
{
  return self->_startThreshold;
}

- (void)setStartThreshold:(double)a3
{
  self->_double startThreshold = a3;
}

- (double)endThreshold
{
  return self->_endThreshold;
}

- (void)setEndThreshold:(double)a3
{
  self->_double endThreshold = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)cachedLocValidityDuration
{
  return self->_cachedLocValidityDuration;
}

- (void)setCachedLocValidityDuration:(double)a3
{
  self->_double cachedLocValidityDuration = a3;
}

- (double)decayFactor
{
  return self->_decayFactor;
}

- (void)setDecayFactor:(double)a3
{
  self->_decayFactor = a3;
}

- (id)receivedLocationBlock
{
  return self->_receivedLocationBlock;
}

- (void)setReceivedLocationBlock:(id)a3
{
}

- (id)stoppedLocatorBlock
{
  return self->_stoppedLocatorBlock;
}

- (void)setStoppedLocatorBlock:(id)a3
{
}

- (BOOL)locatorRunning
{
  return self->_locatorRunning;
}

- (void)setLocatorRunning:(BOOL)a3
{
  self->_locatorRunning = a3;
}

- (double)launchTime
{
  return self->_launchTime;
}

- (void)setLaunchTime:(double)a3
{
  self->_double launchTime = a3;
}

- (CLLocationManager)locManager
{
  return self->_locManager;
}

- (void)setLocManager:(id)a3
{
}

- (BOOL)finished
{
  return self->_finished;
}

- (void)setFinished:(BOOL)a3
{
  self->_finished = a3;
}

- (NSTimer)finishedTimer
{
  return self->_finishedTimer;
}

- (void)setFinishedTimer:(id)a3
{
}

- (NSTimer)publishTimer
{
  return self->_publishTimer;
}

- (void)setPublishTimer:(id)a3
{
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
}

- (CLLocation)locationForPublish
{
  return self->_locationForPublish;
}

- (void)setLocationForPublish:(id)a3
{
}

- (int64_t)lastPublishReason
{
  return self->_lastPublishReason;
}

- (void)setLastPublishReason:(int64_t)a3
{
  self->_lastPublishReason = a3;
}

- (double)lastPublishedAccuracy
{
  return self->_lastPublishedAccuracy;
}

- (void)setLastPublishedAccuracy:(double)a3
{
  self->_lastPublishedAccuracy = a3;
}

- (double)currentThreshold
{
  return self->_currentThreshold;
}

- (void)setCurrentThreshold:(double)a3
{
  self->_double currentThreshold = a3;
}

- (int)currentDecayMultiplier
{
  return self->_currentDecayMultiplier;
}

- (void)setCurrentDecayMultiplier:(int)a3
{
  self->_currentDecayMultiplier = a3;
}

- (int)numPublished
{
  return self->_numPublished;
}

- (void)setNumPublished:(int)a3
{
  self->_numPublished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationForPublish, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_publishTimer, 0);
  objc_storeStrong((id *)&self->_finishedTimer, 0);
  objc_storeStrong((id *)&self->_locManager, 0);
  objc_storeStrong(&self->_stoppedLocatorBlock, 0);

  objc_storeStrong(&self->_receivedLocationBlock, 0);
}

@end