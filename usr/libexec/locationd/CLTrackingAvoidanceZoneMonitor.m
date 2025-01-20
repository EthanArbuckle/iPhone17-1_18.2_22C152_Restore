@interface CLTrackingAvoidanceZoneMonitor
- (BOOL)_updateLocation:(id)a3;
- (BOOL)isInZone;
- (BOOL)locationIsInZoneWithLatitude:(double)a3 longitude:(double)a4 horizontalAccuracy:(double)a5;
- (BOOL)onLocationUpdate:(id)a3;
- (CLLocation)location;
- (CLTrackingAvoidanceZoneMonitor)init;
- (CLTrackingAvoidanceZoneMonitor)initWithTimeZone:(id)a3 zoneBoundary:(CLZoneBoundary_)a4;
- (NSString)timeZone;
- (void)dealloc;
@end

@implementation CLTrackingAvoidanceZoneMonitor

- (BOOL)onLocationUpdate:(id)a3
{
  BOOL v5 = -[CLTrackingAvoidanceZoneMonitor _updateLocation:](self, "_updateLocation:");
  if (v5)
  {
    wrappedAvengerZoneMonitor = self->wrappedAvengerZoneMonitor;
    [a3 coordinate];
    *(void *)buf = v7;
    *(void *)v22 = v8;
    [a3 coordinate];
    v19[1] = v9;
    uint64_t v20 = v10;
    [a3 horizontalAccuracy];
    v19[0] = v11;
    char v18 = 1;
    int v12 = sub_1001A5C3C((uint64_t)wrappedAvengerZoneMonitor, (double *)buf, (double *)&v20, v19, &v18);
    if (self->_isInZone == v12)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      BOOL v13 = v12;
      if (qword_102419490 != -1) {
        dispatch_once(&qword_102419490, &stru_102327EE0);
      }
      v14 = qword_102419498;
      if (os_log_type_enabled((os_log_t)qword_102419498, OS_LOG_TYPE_DEBUG))
      {
        v15 = [(NSString *)self->_timeZone UTF8String];
        BOOL isInZone = self->_isInZone;
        *(_DWORD *)buf = 68289794;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v22 = 2082;
        *(void *)&v22[2] = "";
        __int16 v23 = 2082;
        v24 = v15;
        __int16 v25 = 1026;
        BOOL v26 = isInZone;
        __int16 v27 = 1026;
        BOOL v28 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#ZoneMonitor changed classfication\", \"timeZone\":%{public, location:escape_only}s, \"oldIsInZone\":%{public}hhd, \"newIsInZone\":%{public}hhd}", buf, 0x28u);
      }
      self->_BOOL isInZone = v13;
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)_updateLocation:(id)a3
{
  if (!a3) {
    return 0;
  }
  location = self->_location;
  if (location)
  {
    if (location == a3
      || (id)-[NSDate compare:](-[CLLocation timestamp](location, "timestamp"), "compare:", [a3 timestamp]) == (id)1)
    {
      return 0;
    }
  }
  self->_location = (CLLocation *)a3;
  return 1;
}

- (CLTrackingAvoidanceZoneMonitor)init
{
  return 0;
}

- (CLTrackingAvoidanceZoneMonitor)initWithTimeZone:(id)a3 zoneBoundary:(CLZoneBoundary_)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CLTrackingAvoidanceZoneMonitor;
  if ([(CLTrackingAvoidanceZoneMonitor *)&v7 init])
  {
    sub_100134750(&__p, (char *)[a3 UTF8String]);
    operator new();
  }
  return 0;
}

- (BOOL)locationIsInZoneWithLatitude:(double)a3 longitude:(double)a4 horizontalAccuracy:(double)a5
{
  double v10 = a3;
  double v8 = a5;
  double v9 = a4;
  wrappedAvengerZoneMonitor = self->wrappedAvengerZoneMonitor;
  char v7 = 1;
  return sub_1001A5C3C((uint64_t)wrappedAvengerZoneMonitor, &v10, &v9, &v8, &v7);
}

- (void)dealloc
{
  self->_timeZone = 0;
  self->_location = 0;
  wrappedAvengerZoneMonitor = self->wrappedAvengerZoneMonitor;
  if (wrappedAvengerZoneMonitor) {
    (*(void (**)(void *))(*(void *)wrappedAvengerZoneMonitor + 8))(wrappedAvengerZoneMonitor);
  }
  v4.receiver = self;
  v4.super_class = (Class)CLTrackingAvoidanceZoneMonitor;
  [(CLTrackingAvoidanceZoneMonitor *)&v4 dealloc];
}

- (CLLocation)location
{
  return self->_location;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (BOOL)isInZone
{
  return self->_isInZone;
}

@end