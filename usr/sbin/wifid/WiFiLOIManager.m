@interface WiFiLOIManager
+ (id)sharedWiFiLOIManager;
- (BOOL)deviceIsAssociated;
- (BOOL)ingestLocationUpdateWithLat:(double)a3 andLon:(double)a4 andAccuracy:(double)a5;
- (CLLocation)lastLocation;
- (OS_dispatch_queue)dispatchQueue;
- (WiFiLOIManager)init;
- (double)accuracyOfBestReading;
- (double)bestLatitudeReading;
- (double)bestLongitudeReading;
- (int)query:(id)a3 andMaximumDistanceInMeters:(double)a4;
- (int)queryLOITypeAtLastLocation;
- (int)queryLOITypeAtLatestLocation;
- (int)queryLOITypeAtLocationAndMaxDistance:(id)a3 andMaximumDistanceInMeters:(double)a4;
- (void)_locationUpdateNotificationHandler:(id)a3;
- (void)asyncQueryLOITypeAtLatestLocationWithCompletion:(id)a3;
- (void)dealloc;
- (void)setAccuracyOfBestReading:(double)a3;
- (void)setBestLatitudeReading:(double)a3;
- (void)setBestLongitudeReading:(double)a3;
- (void)setDeviceIsAssociated:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setLastLocation:(id)a3;
@end

@implementation WiFiLOIManager

- (void)_locationUpdateNotificationHandler:(id)a3
{
  if ([a3 object])
  {
    [a3 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [a3 object];
      id v6 = +[WiFiLOIManager sharedWiFiLOIManager];
      [v5 coordinate];
      double v8 = v7;
      [v5 coordinate];
      double v10 = v9;
      [v5 horizontalAccuracy];
      if ([v6 ingestLocationUpdateWithLat:v8 andLon:v10 andAccuracy:v11])
      {
        [(WiFiLOIManager *)self setLastLocation:v5];
      }
    }
  }
}

- (BOOL)ingestLocationUpdateWithLat:(double)a3 andLon:(double)a4 andAccuracy:(double)a5
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3052000000;
  v14[3] = sub_100022C98;
  v14[4] = sub_100022BBC;
  v14[5] = self;
  if ([(WiFiLOIManager *)self deviceIsAssociated]
    && (([(WiFiLOIManager *)self bestLatitudeReading], v9 == 0.0)
     || ([(WiFiLOIManager *)self bestLongitudeReading], v10 == 0.0)))
  {
    BOOL v11 = 0;
    if (a5 < 100.1 && a4 != 0.0 && a5 != 0.0)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100027C78;
      v13[3] = &unk_10023EBE8;
      v13[4] = v14;
      *(double *)&v13[5] = a5;
      *(double *)&v13[6] = a3;
      *(double *)&v13[7] = a4;
      dispatch_async((dispatch_queue_t)[(WiFiLOIManager *)self dispatchQueue], v13);
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }
  _Block_object_dispose(v14, 8);
  return v11;
}

- (BOOL)deviceIsAssociated
{
  return self->_deviceIsAssociated;
}

+ (id)sharedWiFiLOIManager
{
  if (!objc_opt_class()) {
    return 0;
  }
  v3 = objc_opt_class();
  objc_sync_enter(v3);
  id v4 = (id)qword_10027D598;
  if (!qword_10027D598)
  {
    id v4 = objc_alloc_init((Class)a1);
    qword_10027D598 = (uint64_t)v4;
  }
  objc_sync_exit(v3);
  return v4;
}

- (WiFiLOIManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)WiFiLOIManager;
  v2 = [(WiFiLOIManager *)&v7 init];
  if (!v2)
  {
LABEL_7:

    v2 = 0;
    goto LABEL_8;
  }
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.wifid.wifiloimanagerq", v3);
  v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  if (!v4)
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3 message:@"%s: null _dispatchQueue" arguments:("-[WiFiLOIManager init]")];
    }
    goto LABEL_7;
  }
  [+[NSNotificationCenter defaultCenter] addObserver:v2 selector:"_locationUpdateNotificationHandler:" name:@"com.apple.wifid.locationUpdateNotification" object:0];
LABEL_8:
  qword_10027D598 = (uint64_t)v2;
  return v2;
}

- (void)dealloc
{
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue) {
    dispatch_release(dispatchQueue);
  }

  self->_lastLocation = 0;
  v4.receiver = self;
  v4.super_class = (Class)WiFiLOIManager;
  [(WiFiLOIManager *)&v4 dealloc];
}

- (int)queryLOITypeAtLatestLocation
{
  id v4 = [[+[WiFiLocationManager sharedWiFiLocationManager](WiFiLocationManager, "sharedWiFiLocationManager") latestLocation] copy];
  if (v4)
  {
    id v5 = v4;
    if (+[WiFiLocationManager isLocationValid:v4 uptoSeconds:0 isHighAccuracy:300.0])
    {
      int v6 = [(WiFiLOIManager *)self query:v5 andMaximumDistanceInMeters:200.0];
    }
    else
    {
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3 message:@"%s Current location is stale" args:@"-[WiFiLOIManager queryLOITypeAtLatestLocation]"];
      }
      int v6 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s Location unavailable for LOI query", "-[WiFiLOIManager queryLOITypeAtLatestLocation]")
    }
    int v6 = 0;
  }
  return v6;
}

- (int)queryLOITypeAtLastLocation
{
  if ([(WiFiLOIManager *)self lastLocation])
  {
    int v4 = [(WiFiLOIManager *)self query:[(WiFiLOIManager *)self lastLocation] andMaximumDistanceInMeters:100.1];
  }
  else
  {
    if (qword_10027DD68) {
      [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s can't determine current location to query CR LOIs with", "-[WiFiLOIManager queryLOITypeAtLastLocation]");
    }
    int v4 = 0;
  }
  return v4;
}

- (int)queryLOITypeAtLocationAndMaxDistance:(id)a3 andMaximumDistanceInMeters:(double)a4
{
  if (a3)
  {
    int v8 = [(WiFiLOIManager *)self query:a3 andMaximumDistanceInMeters:a4];
  }
  else
  {
    if (qword_10027DD68) {
      [((id)qword_10027DD68) WFLog:3, @"%s Location NULL", @"-[WiFiLOIManager queryLOITypeAtLocationAndMaxDistance:andMaximumDistanceInMeters:]"];
    }
    int v8 = 0;
  }
  return v8;
}

- (void)asyncQueryLOITypeAtLatestLocationWithCompletion:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100027614;
  v6[3] = &unk_10023EB70;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async((dispatch_queue_t)[(WiFiLOIManager *)self dispatchQueue], v6);
}

- (int)query:(id)a3 andMaximumDistanceInMeters:(double)a4
{
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if (a3)
  {
    objc_super v7 = dispatch_semaphore_create(0);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000279FC;
    v18[3] = &unk_10023EB98;
    v18[6] = &v31;
    v18[7] = &v23;
    v18[4] = v7;
    v18[5] = &v35;
    [+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager") fetchLocationsOfInterestWithinDistance:a3 ofLocation:v18 withHandler:a4];
    dispatch_time_t v8 = dispatch_time(0, 6000000000);
    if (dispatch_semaphore_wait(v7, v8))
    {
      *((unsigned char *)v24 + 24) = 1;
      if (qword_10027DD68) {
        [objc_msgSend((id)qword_10027DD68, "WFLog:message:", 3, "%s gave up waiting for a CoreRoutine. Bailing to avoid a hang", "-[WiFiLOIManager query:andMaximumDistanceInMeters:]");
      }
    }
    dispatch_release(v7);
    double v10 = dispatch_semaphore_create(0);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100027B40;
    v17[3] = &unk_10023EBC0;
    v17[6] = &v19;
    v17[4] = v10;
    v17[5] = &v27;
    [+[RTRoutineManager defaultManager](RTRoutineManager, "defaultManager") fetchLocationsOfInterestVisitedSinceDate:[+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", 0.0)] withHandler:v17];
    dispatch_time_t v11 = dispatch_time(0, 6000000000);
    if (dispatch_semaphore_wait(v10, v11))
    {
      *((unsigned char *)v20 + 24) = 1;
      if (qword_10027DD68) {
        [((id)qword_10027DD68) WFLog:3, @"%s gave up waiting for a CoreRoutine. Bailing to avoid a hang", @"-[WiFiLOIManager query:andMaximumDistanceInMeters:]"];
      }
    }
    dispatch_release(v10);
  }
  else if (qword_10027DD68)
  {
    [((id)qword_10027DD68) WFLog:3, "%s location required to query CR LOIs with", "-[WiFiLOIManager query:andMaximumDistanceInMeters:]"];
  }
  if (*((unsigned char *)v28 + 24))
  {
    if (*((unsigned char *)v32 + 24)) {
      int v13 = 3;
    }
    else {
      int v13 = 1;
    }
    if (*((unsigned char *)v32 + 24)) {
      int v14 = 4;
    }
    else {
      int v14 = 2;
    }
    if (*((unsigned char *)v36 + 24)) {
      int v15 = v14;
    }
    else {
      int v15 = v13;
    }
  }
  else
  {
    int v15 = 0;
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);
  return v15;
}

- (CLLocation)lastLocation
{
  return self->_lastLocation;
}

- (void)setLastLocation:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (double)bestLatitudeReading
{
  return self->_bestLatitudeReading;
}

- (void)setBestLatitudeReading:(double)a3
{
  self->_bestLatitudeReading = a3;
}

- (double)bestLongitudeReading
{
  return self->_bestLongitudeReading;
}

- (void)setBestLongitudeReading:(double)a3
{
  self->_bestLongitudeReading = a3;
}

- (double)accuracyOfBestReading
{
  return self->_accuracyOfBestReading;
}

- (void)setAccuracyOfBestReading:(double)a3
{
  self->_accuracyOfBestReading = a3;
}

- (void)setDeviceIsAssociated:(BOOL)a3
{
  self->_deviceIsAssociated = a3;
}

@end