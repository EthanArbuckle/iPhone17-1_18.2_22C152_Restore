@interface FMDTrackedLocationPublisher
- (BOOL)startedPublishing;
- (FMGeoLocatable)lastLocation;
- (FMGeoLocatable)lastPublishedLocation;
- (NSNumber)cachedLocationValidityTimeInterval;
- (NSNumber)decayFactor;
- (NSNumber)endThreshold;
- (NSNumber)minimumDistance;
- (NSNumber)publishTimeInterval;
- (NSNumber)startThreshold;
- (id)publishingBlock;
- (void)_publishResultLocation:(id)a3 reason:(int64_t)a4;
- (void)flushLocations;
- (void)setCachedLocationValidityTimeInterval:(id)a3;
- (void)setDecayFactor:(id)a3;
- (void)setEndThreshold:(id)a3;
- (void)setLastLocation:(id)a3;
- (void)setLastPublishedLocation:(id)a3;
- (void)setMinimumDistance:(id)a3;
- (void)setPublishTimeInterval:(id)a3;
- (void)setPublishingBlock:(id)a3;
- (void)setStartThreshold:(id)a3;
- (void)setStartedPublishing:(BOOL)a3;
- (void)startPublishingWithBlock:(id)a3;
- (void)updatedLocations:(id)a3;
- (void)updatedLocations:(id)a3 reason:(int64_t)a4;
@end

@implementation FMDTrackedLocationPublisher

- (void)startPublishingWithBlock:(id)a3
{
  [(FMDTrackedLocationPublisher *)self setPublishingBlock:a3];

  [(FMDTrackedLocationPublisher *)self setStartedPublishing:1];
}

- (void)updatedLocations:(id)a3
{
}

- (void)updatedLocations:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  if (![(FMDTrackedLocationPublisher *)self startedPublishing])
  {
    v7 = sub_100059618();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10023C780(v7);
    }
    goto LABEL_27;
  }
  if ([v6 count])
  {
    v7 = [v6 lastObject];
    v8 = [(FMDTrackedLocationPublisher *)self lastLocation];
    [(FMDTrackedLocationPublisher *)self setLastLocation:v7];
    if (!v8)
    {
      v50 = sub_100004238();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v51) = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "New location is the first recorded location. Recording this location...", (uint8_t *)&v51, 2u);
      }

      [(FMDTrackedLocationPublisher *)self _publishResultLocation:v7 reason:a4];
      goto LABEL_26;
    }
    v9 = [v7 latitude];
    [v9 doubleValue];
    double v11 = v10;

    v12 = [v7 longitude];
    [v12 doubleValue];
    double v14 = v13;

    v15 = [v7 horizontalAccuracy];
    [v15 doubleValue];
    double v17 = v16;

    v18 = [v7 verticalAccuracy];
    [v18 doubleValue];
    double v20 = v19;

    v21 = [v7 floor];
    id v22 = [v21 integerValue];

    id v23 = [objc_alloc((Class)CLLocation) initWithLatitude:v11 longitude:v14];
    v24 = [v8 latitude];
    [v24 doubleValue];
    double v26 = v25;

    v27 = [v8 longitude];
    [v27 doubleValue];
    double v29 = v28;

    v30 = [v8 horizontalAccuracy];
    [v30 doubleValue];
    double v32 = v31;

    v33 = [v8 verticalAccuracy];
    [v33 doubleValue];
    double v35 = v34;

    v36 = [v8 floor];
    id v37 = [v36 integerValue];

    id v38 = [objc_alloc((Class)CLLocation) initWithLatitude:v26 longitude:v29];
    [v23 distanceFromLocation:v38];
    double v40 = v39;
    v41 = [(FMDTrackedLocationPublisher *)self minimumDistance];
    [v41 doubleValue];
    double v43 = v42;

    v44 = sub_100004238();
    BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
    if (v40 < v43 && v37 == v22)
    {
      if (v45)
      {
        int v51 = 134217984;
        double v52 = v40;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "New location was %f metres away (not significant enough) from the previous recorded location.", (uint8_t *)&v51, 0xCu);
      }

      v46 = sub_100004238();
      BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      if (v17 >= v32 && v20 >= v35)
      {
        if (v47)
        {
          LOWORD(v51) = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "New location does not have a better accuracy.", (uint8_t *)&v51, 2u);
        }

        v48 = self;
        v49 = v8;
        goto LABEL_25;
      }
      if (v47)
      {
        LOWORD(v51) = 0;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "New location has a better accuracy. Replacing the previous recorded location...", (uint8_t *)&v51, 2u);
      }
    }
    else
    {
      if (v45)
      {
        int v51 = 134217984;
        double v52 = v40;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "New location was %f metres away (significant enough) from the previous recorded location. Recording this location anew...", (uint8_t *)&v51, 0xCu);
      }
    }
    v48 = self;
    v49 = v7;
LABEL_25:
    [(FMDTrackedLocationPublisher *)v48 _publishResultLocation:v49 reason:a4];

LABEL_26:
LABEL_27:
  }
}

- (void)_publishResultLocation:(id)a3 reason:(int64_t)a4
{
  id v6 = a3;
  v7 = sub_100004238();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    int64_t v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "FMDTrackedLocationPublisher _publishResultLocation %li", (uint8_t *)&v10, 0xCu);
  }

  [(FMDTrackedLocationPublisher *)self setLastPublishedLocation:v6];
  uint64_t v8 = [(FMDTrackedLocationPublisher *)self publishingBlock];
  v9 = (void *)v8;
  if (v8) {
    (*(void (**)(uint64_t, void, id, int64_t))(v8 + 16))(v8, 0, v6, a4);
  }
}

- (void)flushLocations
{
  [(FMDTrackedLocationPublisher *)self setLastLocation:0];
  uint64_t v3 = [(FMDTrackedLocationPublisher *)self lastLocation];
  if (v3)
  {
    v5 = (void *)v3;
    v4 = [(FMDTrackedLocationPublisher *)self lastPublishedLocation];

    if (v5 != v4)
    {
      [(FMDTrackedLocationPublisher *)self _publishResultLocation:v5 reason:5];
      [(FMDTrackedLocationPublisher *)self setLastLocation:0];
    }
  }

  _objc_release_x1();
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPublishedLocation, 0);
  objc_storeStrong((id *)&self->_lastLocation, 0);
  objc_storeStrong(&self->_publishingBlock, 0);
  objc_storeStrong((id *)&self->_cachedLocationValidityTimeInterval, 0);
  objc_storeStrong((id *)&self->_minimumDistance, 0);
  objc_storeStrong((id *)&self->_publishTimeInterval, 0);
  objc_storeStrong((id *)&self->_decayFactor, 0);
  objc_storeStrong((id *)&self->_endThreshold, 0);

  objc_storeStrong((id *)&self->_startThreshold, 0);
}

@end