@interface FMDConservativeLocatorPublisher
- (BOOL)startedPublishing;
- (FMDConservativeLocatorPublisher)init;
- (FMDispatchTimer)publishTimer;
- (FMGeoLocatable)lastLocation;
- (FMGeoLocatable)lastPublishedLocation;
- (NSDate)launchDate;
- (NSDate)nextPublishTimerFireDate;
- (NSNumber)cachedLocationValidityTimeInterval;
- (NSNumber)currentThreshold;
- (NSNumber)decayFactor;
- (NSNumber)endThreshold;
- (NSNumber)minimumDistance;
- (NSNumber)publishTimeInterval;
- (NSNumber)startThreshold;
- (id)publishingBlock;
- (int)currentDecayMultiplier;
- (void)_cancelPublishTimer;
- (void)_publishResultLocation:(id)a3 reason:(int64_t)a4;
- (void)flushLocations;
- (void)setCachedLocationValidityTimeInterval:(id)a3;
- (void)setCurrentDecayMultiplier:(int)a3;
- (void)setCurrentThreshold:(id)a3;
- (void)setDecayFactor:(id)a3;
- (void)setEndThreshold:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)setLastPublishedLocation:(id)a3;
- (void)setLaunchDate:(id)a3;
- (void)setMinimumDistance:(id)a3;
- (void)setNextPublishTimerFireDate:(id)a3;
- (void)setPublishTimeInterval:(id)a3;
- (void)setPublishTimer:(id)a3;
- (void)setPublishingBlock:(id)a3;
- (void)setStartThreshold:(id)a3;
- (void)setStartedPublishing:(BOOL)a3;
- (void)startPublishingWithBlock:(id)a3;
- (void)updatedLocations:(id)a3;
- (void)updatedLocations:(id)a3 reason:(int64_t)a4;
@end

@implementation FMDConservativeLocatorPublisher

- (FMDConservativeLocatorPublisher)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDConservativeLocatorPublisher;
  v2 = [(FMDConservativeLocatorPublisher *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(FMDConservativeLocatorPublisher *)v2 setStartThreshold:&off_1002F26F0];
    [(FMDConservativeLocatorPublisher *)v3 setEndThreshold:&off_1002F2700];
    [(FMDConservativeLocatorPublisher *)v3 setDecayFactor:&off_1002F2710];
    [(FMDConservativeLocatorPublisher *)v3 setCachedLocationValidityTimeInterval:&off_1002F2720];
    [(FMDConservativeLocatorPublisher *)v3 setPublishTimeInterval:&off_1002F20B0];
    [(FMDConservativeLocatorPublisher *)v3 setMinimumDistance:&off_1002F2730];
  }
  return v3;
}

- (void)startPublishingWithBlock:(id)a3
{
  [(FMDConservativeLocatorPublisher *)self setPublishingBlock:a3];
  [(FMDConservativeLocatorPublisher *)self setStartedPublishing:1];
  v4 = [(FMDConservativeLocatorPublisher *)self startThreshold];
  [(FMDConservativeLocatorPublisher *)self setCurrentThreshold:v4];

  id v5 = +[NSDate date];
  [(FMDConservativeLocatorPublisher *)self setLaunchDate:v5];
}

- (void)updatedLocations:(id)a3
{
}

- (void)updatedLocations:(id)a3 reason:(int64_t)a4
{
  id v5 = a3;
  if (![(FMDConservativeLocatorPublisher *)self startedPublishing])
  {
    v6 = sub_100059618();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100243BE4(v6);
    }
    goto LABEL_12;
  }
  if ([v5 count])
  {
    v6 = [v5 lastObject];
    if (!v6)
    {
LABEL_12:

      goto LABEL_13;
    }
    v7 = sub_100059618();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100243A9C(self, v6, v7);
    }

    v8 = [v6 horizontalAccuracy];
    [v8 doubleValue];
    BOOL v10 = v9 < 0.0;

    if (v10)
    {
      v11 = sub_100059618();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = [(FMDConservativeLocatorPublisher *)self fm_logID];
        v13 = [v6 horizontalAccuracy];
        [v13 doubleValue];
        *(_DWORD *)buf = 138412546;
        v133 = v12;
        __int16 v134 = 2048;
        uint64_t v135 = v14;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Location has a -ve horizontalAccuracy (%.2f). Not using it", buf, 0x16u);
      }
LABEL_57:

      goto LABEL_12;
    }
    v15 = [v6 horizontalAccuracy];
    [v15 doubleValue];
    double v17 = v16;
    [(NSNumber *)self->_startThreshold doubleValue];
    BOOL v19 = v17 > v18;

    if (v19)
    {
      v11 = sub_100059618();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v20 = [(FMDConservativeLocatorPublisher *)self fm_logID];
        v21 = [v6 horizontalAccuracy];
        [v21 doubleValue];
        uint64_t v23 = v22;
        [(NSNumber *)self->_startThreshold doubleValue];
        *(_DWORD *)buf = 138412802;
        v133 = v20;
        __int16 v134 = 2048;
        uint64_t v135 = v23;
        __int16 v136 = 2048;
        id v137 = v24;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Location has a horizontalAccuracy of %.2f > start threshold %.2f. Not using it", buf, 0x20u);
      }
      goto LABEL_57;
    }
    v25 = [v6 timestamp];
    [v25 timeIntervalSinceReferenceDate];
    double v27 = v26;

    v28 = [(FMDConservativeLocatorPublisher *)self launchDate];
    [v28 timeIntervalSinceReferenceDate];
    double v30 = v29;

    v31 = [(FMDConservativeLocatorPublisher *)self cachedLocationValidityTimeInterval];
    [v31 doubleValue];
    double v33 = v32;

    if (v27 <= v30 - v33)
    {
      v11 = sub_100059618();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v49 = [(FMDConservativeLocatorPublisher *)self fm_logID];
        *(_DWORD *)buf = 138412290;
        v133 = v49;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Location is really old. Waiting for a newer one", buf, 0xCu);
      }
      goto LABEL_57;
    }
    if (v27 < v30)
    {
      v34 = sub_100059618();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        v35 = [(FMDConservativeLocatorPublisher *)self fm_logID];
        [(NSNumber *)self->_cachedLocationValidityTimeInterval doubleValue];
        *(_DWORD *)buf = 138412546;
        v133 = v35;
        __int16 v134 = 2048;
        uint64_t v135 = v36;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@ Location is an old cached one but not older than %.0f seconds before the start of this cycle. Considering it for later use", buf, 0x16u);
      }
      uint64_t v37 = 0;
      int v38 = 1;
      goto LABEL_23;
    }
    v50 = [v6 horizontalAccuracy];
    [v50 doubleValue];
    double v52 = v51;
    [(NSNumber *)self->_endThreshold doubleValue];
    BOOL v54 = v52 > v53;

    if (!v54)
    {
      v78 = sub_100059618();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        v79 = [(FMDConservativeLocatorPublisher *)self fm_logID];
        [(NSNumber *)self->_endThreshold doubleValue];
        *(_DWORD *)buf = 138412546;
        v133 = v79;
        __int16 v134 = 2048;
        uint64_t v135 = v80;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%@ Location has accuracy below the end threshold %f. Publishing it immediately & finishing the locate cycle", buf, 0x16u);
      }
      [(FMDConservativeLocatorPublisher *)self setStartedPublishing:0];
      [(FMDConservativeLocatorPublisher *)self _cancelPublishTimer];
      [(FMDConservativeLocatorPublisher *)self _publishResultLocation:v6 reason:3];
      goto LABEL_12;
    }
    v55 = [v6 horizontalAccuracy];
    [v55 doubleValue];
    double v57 = v56;
    [(NSNumber *)self->_currentThreshold doubleValue];
    BOOL v59 = v57 < v58;

    if (v59)
    {
      v60 = sub_100059618();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = [(FMDConservativeLocatorPublisher *)self fm_logID];
        [(NSNumber *)self->_currentThreshold doubleValue];
        uint64_t v63 = v62;
        v64 = [(FMDConservativeLocatorPublisher *)self publishTimeInterval];
        *(_DWORD *)buf = 138412802;
        v133 = v61;
        __int16 v134 = 2048;
        uint64_t v135 = v63;
        __int16 v136 = 2048;
        id v137 = [v64 longValue];
        _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "%@ Location has accuracy within current publish threshold of %.2f. Publishing it within the next %ld seconds", buf, 0x20u);
      }
      do
      {
        ++self->_currentDecayMultiplier;
        [(NSNumber *)self->_startThreshold doubleValue];
        double v66 = v65;
        [(NSNumber *)self->_decayFactor doubleValue];
        v68 = +[NSNumber numberWithDouble:(double)(v66 * exp(-(v67 * (double)self->_currentDecayMultiplier)))];
        currentThreshold = self->_currentThreshold;
        self->_currentThreshold = v68;

        [(NSNumber *)self->_currentThreshold doubleValue];
        double v71 = v70;
        v72 = [v6 horizontalAccuracy];
        [v72 doubleValue];
        BOOL v74 = v71 < v73;
      }
      while (!v74);
      v75 = sub_100059618();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
      {
        v76 = [(FMDConservativeLocatorPublisher *)self fm_logID];
        [(NSNumber *)self->_currentThreshold doubleValue];
        *(_DWORD *)buf = 138412546;
        v133 = v76;
        __int16 v134 = 2048;
        uint64_t v135 = v77;
        _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%@ New publish threshold is %.2f", buf, 0x16u);
      }
      int v38 = 1;
      uint64_t v37 = 2;
    }
    else
    {
      int v38 = 0;
      uint64_t v37 = 0;
    }
    v94 = [(FMDConservativeLocatorPublisher *)self lastLocation];
    if (!v94)
    {
      v95 = [v6 horizontalAccuracy];
      [v95 doubleValue];
      double v97 = v96;
      [(NSNumber *)self->_startThreshold doubleValue];
      BOOL v99 = v97 > v98;

      if (v99) {
        goto LABEL_65;
      }
      v94 = sub_100059618();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
      {
        v100 = [(FMDConservativeLocatorPublisher *)self fm_logID];
        [(NSNumber *)self->_startThreshold doubleValue];
        *(_DWORD *)buf = 138412546;
        v133 = v100;
        __int16 v134 = 2048;
        uint64_t v135 = v101;
        _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "%@ This is the first location with accuracy below the start threshold %.2f. Publishing it immediately", buf, 0x16u);
      }
      int v38 = 2;
      uint64_t v37 = 1;
    }

LABEL_65:
    v102 = [(FMDConservativeLocatorPublisher *)self lastLocation];

    if (!v102) {
      goto LABEL_24;
    }
    if (![v6 locationType]) {
      goto LABEL_24;
    }
    id v103 = [v6 locationType];
    v104 = [(FMDConservativeLocatorPublisher *)self lastLocation];
    LOBYTE(v103) = v103 == [v104 locationType];

    if (v103) {
      goto LABEL_24;
    }
    id v105 = objc_alloc((Class)CLLocation);
    v106 = [(FMDConservativeLocatorPublisher *)self lastLocation];
    v107 = [v106 latitude];
    [v107 doubleValue];
    double v109 = v108;
    v110 = [(FMDConservativeLocatorPublisher *)self lastLocation];
    v111 = [v110 longitude];
    [v111 doubleValue];
    v34 = [v105 initWithLatitude:v109 longitude:v112];

    id v113 = objc_alloc((Class)CLLocation);
    v114 = [v6 latitude];
    [v114 doubleValue];
    double v116 = v115;
    uint64_t v117 = [v6 longitude];
    [(id)v117 doubleValue];
    id v119 = [v113 initWithLatitude:v116 longitude:v118];

    [v34 distanceFromLocation:v119];
    double v121 = v120;
    v122 = [(FMDConservativeLocatorPublisher *)self minimumDistance];
    [v122 doubleValue];
    LOBYTE(v117) = v121 < v123;

    if ((v117 & 1) == 0)
    {
      v124 = sub_100059618();
      if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
      {
        v125 = [(FMDConservativeLocatorPublisher *)self fm_logID];
        v126 = [(FMDConservativeLocatorPublisher *)self lastLocation];
        id v127 = [v126 locationType];
        id v128 = [v6 locationType];
        *(_DWORD *)buf = 138413058;
        v133 = v125;
        __int16 v134 = 2048;
        uint64_t v135 = (uint64_t)v127;
        __int16 v136 = 2048;
        id v137 = v128;
        __int16 v138 = 2048;
        double v139 = v121;
        _os_log_impl((void *)&_mh_execute_header, v124, OS_LOG_TYPE_DEFAULT, "%@ Location type changed from %ld to %ld with distance traveled %.2lf. Publishing it immediately", buf, 0x2Au);
      }
      int v38 = 2;
      uint64_t v37 = 4;
    }

LABEL_23:
LABEL_24:
    v39 = [(FMDConservativeLocatorPublisher *)self lastLocation];
    if (!v39) {
      goto LABEL_26;
    }
    v40 = [v6 horizontalAccuracy];
    [v40 doubleValue];
    double v42 = v41;
    v43 = [(FMDConservativeLocatorPublisher *)self lastLocation];
    v44 = [v43 horizontalAccuracy];
    [v44 doubleValue];
    BOOL v46 = v42 > v45;

    if (!v46)
    {
LABEL_26:
      v47 = sub_100059618();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        v48 = [(FMDConservativeLocatorPublisher *)self fm_logID];
        *(_DWORD *)buf = 138412290;
        v133 = v48;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "%@ Storing this location as the best last known location in this locate cycle", buf, 0xCu);
      }
      [(FMDConservativeLocatorPublisher *)self setLastLocation:v6];
    }
    if (v38)
    {
      if (v38 == 1)
      {
        [(FMDConservativeLocatorPublisher *)self _cancelPublishTimer];
        v81 = [(FMDConservativeLocatorPublisher *)self nextPublishTimerFireDate];
        if (!v81)
        {
          v82 = [(FMDConservativeLocatorPublisher *)self publishTimeInterval];
          [v82 doubleValue];
          double v84 = v83;

          v81 = +[NSDate dateWithTimeIntervalSinceNow:v84];
          [(FMDConservativeLocatorPublisher *)self setNextPublishTimerFireDate:v81];
        }
        [v81 timeIntervalSinceNow];
        if (v85 >= 0.0) {
          double v86 = v85;
        }
        else {
          double v86 = 0.0;
        }
        v87 = sub_100059618();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          v88 = [(FMDConservativeLocatorPublisher *)self fm_logID];
          *(_DWORD *)buf = 138412546;
          v133 = v88;
          __int16 v134 = 2048;
          uint64_t v135 = (uint64_t)v86;
          _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "%@ Scheduling the location to be published in %ld seconds", buf, 0x16u);
        }
        objc_initWeak((id *)buf, self);
        id v89 = objc_alloc((Class)FMDispatchTimer);
        id v90 = &_dispatch_main_q;
        v129[0] = _NSConcreteStackBlock;
        v129[1] = 3221225472;
        v129[2] = sub_1000BD9A0;
        v129[3] = &unk_1002DCED0;
        objc_copyWeak(v131, (id *)buf);
        v6 = v6;
        v130 = v6;
        v131[1] = (id)v37;
        id v91 = [v89 initWithQueue:&_dispatch_main_q timeout:v129 completion:v86];
        [(FMDConservativeLocatorPublisher *)self setPublishTimer:v91];

        v92 = [(FMDConservativeLocatorPublisher *)self publishTimer];
        [v92 start];

        objc_destroyWeak(v131);
        objc_destroyWeak((id *)buf);
      }
      else
      {
        [(FMDConservativeLocatorPublisher *)self _cancelPublishTimer];
        [(FMDConservativeLocatorPublisher *)self _publishResultLocation:v6 reason:v37];
      }
      goto LABEL_12;
    }
    v11 = sub_100059618();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v93 = [(FMDConservativeLocatorPublisher *)self fm_logID];
      *(_DWORD *)buf = 138412290;
      v133 = v93;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Not publishing this location", buf, 0xCu);
    }
    goto LABEL_57;
  }
LABEL_13:
}

- (void)flushLocations
{
  [(FMDConservativeLocatorPublisher *)self _cancelPublishTimer];
  id v5 = [(FMDConservativeLocatorPublisher *)self lastLocation];
  if (v5)
  {
    id v3 = [(FMDConservativeLocatorPublisher *)self lastPublishedLocation];
    if (v5 == v3)
    {
    }
    else
    {
      unsigned int v4 = [(FMDConservativeLocatorPublisher *)self startedPublishing];

      if (v4)
      {
        [(FMDConservativeLocatorPublisher *)self _publishResultLocation:v5 reason:5];
        [(FMDConservativeLocatorPublisher *)self setLastLocation:0];
      }
    }
  }
  [(FMDConservativeLocatorPublisher *)self setStartedPublishing:0];
}

- (void)_publishResultLocation:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v7 = sub_100059618();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(FMDConservativeLocatorPublisher *)self fm_logID];
    int v11 = 138412546;
    v12 = v8;
    __int16 v13 = 2048;
    int64_t v14 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ Publishing the location to the server for reason %li", (uint8_t *)&v11, 0x16u);
  }
  [(FMDConservativeLocatorPublisher *)self _cancelPublishTimer];
  [(FMDConservativeLocatorPublisher *)self setLastPublishedLocation:v6];
  uint64_t v9 = [(FMDConservativeLocatorPublisher *)self publishingBlock];
  BOOL v10 = (void *)v9;
  if (v9) {
    (*(void (**)(uint64_t, void, id, int64_t))(v9 + 16))(v9, 0, v6, a4);
  }
}

- (void)_cancelPublishTimer
{
  id v3 = [(FMDConservativeLocatorPublisher *)self publishTimer];

  if (v3)
  {
    unsigned int v4 = [(FMDConservativeLocatorPublisher *)self publishTimer];
    [v4 cancel];

    [(FMDConservativeLocatorPublisher *)self setPublishTimer:0];
    [(FMDConservativeLocatorPublisher *)self setNextPublishTimerFireDate:0];
  }
}

- (NSNumber)startThreshold
{
  return self->_startThreshold;
}

- (void)setStartThreshold:(id)a3
{
}

- (NSNumber)endThreshold
{
  return self->_endThreshold;
}

- (void)setEndThreshold:(id)a3
{
}

- (NSNumber)decayFactor
{
  return self->_decayFactor;
}

- (void)setDecayFactor:(id)a3
{
}

- (NSNumber)publishTimeInterval
{
  return self->_publishTimeInterval;
}

- (void)setPublishTimeInterval:(id)a3
{
}

- (NSNumber)minimumDistance
{
  return self->_minimumDistance;
}

- (void)setMinimumDistance:(id)a3
{
}

- (NSNumber)cachedLocationValidityTimeInterval
{
  return self->_cachedLocationValidityTimeInterval;
}

- (void)setCachedLocationValidityTimeInterval:(id)a3
{
}

- (id)publishingBlock
{
  return self->_publishingBlock;
}

- (void)setPublishingBlock:(id)a3
{
}

- (BOOL)startedPublishing
{
  return self->_startedPublishing;
}

- (void)setStartedPublishing:(BOOL)a3
{
  self->_startedPublishing = a3;
}

- (NSDate)launchDate
{
  return self->_launchDate;
}

- (void)setLaunchDate:(id)a3
{
}

- (NSNumber)currentThreshold
{
  return self->_currentThreshold;
}

- (void)setCurrentThreshold:(id)a3
{
}

- (int)currentDecayMultiplier
{
  return self->_currentDecayMultiplier;
}

- (void)setCurrentDecayMultiplier:(int)a3
{
  self->_currentDecayMultiplier = a3;
}

- (FMGeoLocatable)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
}

- (FMGeoLocatable)lastPublishedLocation
{
  return self->_lastPublishedLocation;
}

- (void)setLastPublishedLocation:(id)a3
{
}

- (FMDispatchTimer)publishTimer
{
  return self->_publishTimer;
}

- (void)setPublishTimer:(id)a3
{
}

- (NSDate)nextPublishTimerFireDate
{
  return self->_nextPublishTimerFireDate;
}

- (void)setNextPublishTimerFireDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextPublishTimerFireDate, 0);
  objc_storeStrong((id *)&self->_publishTimer, 0);
  objc_storeStrong((id *)&self->_lastPublishedLocation, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong((id *)&self->_currentThreshold, 0);
  objc_storeStrong((id *)&self->_launchDate, 0);
  objc_storeStrong(&self->_publishingBlock, 0);
  objc_storeStrong((id *)&self->_cachedLocationValidityTimeInterval, 0);
  objc_storeStrong((id *)&self->_minimumDistance, 0);
  objc_storeStrong((id *)&self->_publishTimeInterval, 0);
  objc_storeStrong((id *)&self->_decayFactor, 0);
  objc_storeStrong((id *)&self->_endThreshold, 0);

  objc_storeStrong((id *)&self->_startThreshold, 0);
}

@end