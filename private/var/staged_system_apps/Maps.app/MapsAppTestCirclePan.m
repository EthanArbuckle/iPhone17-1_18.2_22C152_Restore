@interface MapsAppTestCirclePan
- ($1AB5FA073B851C12C2339EC22442E995)endPoint;
- (BOOL)altitudeIsRegionSize;
- (BOOL)runTest;
- (BOOL)useTestNameInResults;
- (MapsAppTestCirclePan)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
- (double)animationDuration;
- (double)circleRadius;
- (double)pitch;
- (double)yaw;
- (id)testFinshdCallback;
- (int64_t)iterations;
- (void)addFullyDrawnCallback:(id)a3;
- (void)animateCircle:(int64_t)a3 completion:(id)a4;
- (void)circlePanLoadFinished;
- (void)onFullyDrawn:(id)a3;
- (void)setAltitudeIsRegionSize:(BOOL)a3;
- (void)setAnimationDuration:(double)a3;
- (void)setCircleRadius:(double)a3;
- (void)setEndPoint:(id)a3;
- (void)setIterations:(int64_t)a3;
- (void)setPitch:(double)a3;
- (void)setTestFinshdCallback:(id)a3;
- (void)setUseTestNameInResults:(BOOL)a3;
- (void)setYaw:(double)a3;
@end

@implementation MapsAppTestCirclePan

- (MapsAppTestCirclePan)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v37.receiver = self;
  v37.super_class = (Class)MapsAppTestCirclePan;
  v10 = [(MapsAppTest *)&v37 initWithApplication:a3 testName:v8 options:v9];
  v11 = v10;
  if (v10)
  {
    v10->_requiresPreLoadAnimation = 1;
    BOOL isSubTest = [v8 rangeOfString:@"circle"] != 0;
    v11->_BOOL isSubTest = isSubTest;
    if (v9)
    {
      v13 = [v9 allKeys];
      unsigned int v14 = [v13 containsObject:@"isSubTest"];

      if (v14)
      {
        v15 = [v9 valueForKey:@"isSubTest"];
        v11->_BOOL isSubTest = [v15 BOOLValue];
        v11->_requiresPreLoadAnimation = 0;
      }
      BOOL isSubTest = v11->_isSubTest;
    }
    else
    {
      unsigned int v14 = 0;
    }
    v11->_circleRadius = 4.0;
    if (!isSubTest)
    {
      v16 = [(MapsAppTest *)v11 options];
      v17 = [v16 objectForKeyedSubscript:@"circleDistance"];

      if (v17)
      {
        v18 = [(MapsAppTest *)v11 options];
        v19 = [v18 objectForKeyedSubscript:@"circleDistance"];
        [v19 doubleValue];
        v11->_circleRadius = v20 * 0.5;
      }
    }
    v11->_iterations = 10;
    v11->_animationDuration = 0.0500000007;
    if (v11->_isSubTest)
    {
      if (v14)
      {
        [v9 _mapstest_pointWithKeys:&off_1013AD7D0];
        v11->_endPoint.latitude = v21;
        v11->_endPoint.longitude = v22;
        v11->_endPoint.altitude = v23;
        v11->_iterations = (int64_t)[v9 _mapstest_integerValueForKey:@"iterations" defaultValue:10];
        [v9 _mapstest_animationDurationWithDefault:0.0500000007];
        v11->_animationDuration = v24 * 0.25;
        v11->_altitudeIsRegionSize = 1;
        [v9 _mapstest_pitch];
        v11->_pitch = v25;
        [v9 _mapstest_yaw];
        v11->_yaw = v26;
        v27 = [(MapsAppTest *)v11 options];
        v28 = [v27 objectForKeyedSubscript:@"circleDistance"];

        if (v28)
        {
          v29 = [(MapsAppTest *)v11 options];
          v30 = [v29 objectForKeyedSubscript:@"circleDistance"];
          [v30 doubleValue];
          v11->_circleRadius = v31 * 0.5;
        }
      }
    }
    else
    {
      [v9 _mapstest_pointWithKeys:&off_1013AD7B8];
      v11->_endPoint.latitude = v32;
      v11->_endPoint.longitude = v33;
      v11->_endPoint.altitude = v34;
      v11->_iterations = (int64_t)[v9 _mapstest_integerValueForKey:@"iterations" defaultValue:10];
      [v9 _mapstest_animationDurationWithDefault:0.0500000007];
      v11->_animationDuration = v35 * 0.25;
      v11->_pitch = 0.0;
      v11->_yaw = 0.0;
    }
  }

  return v11;
}

- (BOOL)runTest
{
  if (!self->_isSubTest) {
    [(MapsAppTest *)self setupForVKTest];
  }
  v3 = [(MapsAppTest *)self mainMKMapView];
  [v3 _setLocationPulseEnabled:0];

  v4 = [(MapsAppTest *)self mainVKMapView];
  if (self->_altitudeIsRegionSize)
  {
    v5 = +[GEOMapRegion _mapstest_mapRegionAtCenterLocation:](GEOMapRegion, "_mapstest_mapRegionAtCenterLocation:", self->_endPoint.latitude, self->_endPoint.longitude, self->_endPoint.altitude);
    [v4 setMapRegion:v5 pitch:self->_pitch yaw:self->_yaw];
  }
  else
  {
    VKLocationCoordinate2DMake();
    [v4 setCenterCoordinate:0, 0];
  }
  if (!self->_isSubTest)
  {
    v6 = [(MapsAppTest *)self options];
    v7 = [v6 objectForKeyedSubscript:@"circleDistance"];

    if (v7)
    {
      id v8 = [(MapsAppTest *)self options];
      id v9 = [v8 objectForKeyedSubscript:@"circleDistance"];
      [v9 doubleValue];
      self->_circleRadius = v10 * 0.5;
    }
  }
  [v4 convertPoint:v4 toCoordinateFromLayer:1.0, 0.0];
  [v4 convertPoint:v4 toCoordinateFromLayer:0.0, 0.0];
  VKLocationCoordinate3DMake();
  self->_circlePoints[0].latitude = v11;
  self->_circlePoints[0].longitude = v12;
  self->_circlePoints[0].altitude = v13;
  VKLocationCoordinate3DMake();
  self->_circlePoints[1].latitude = v14;
  self->_circlePoints[1].longitude = v15;
  self->_circlePoints[1].altitude = v16;
  VKLocationCoordinate3DMake();
  self->_circlePoints[2].latitude = v17;
  self->_circlePoints[2].longitude = v18;
  self->_circlePoints[2].altitude = v19;
  VKLocationCoordinate3DMake();
  self->_circlePoints[3].latitude = v20;
  self->_circlePoints[3].longitude = v21;
  self->_circlePoints[3].altitude = v22;
  objc_initWeak(&location, self);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10059161C;
  v24[3] = &unk_1012E6708;
  objc_copyWeak(&v25, &location);
  [(MapsAppTestCirclePan *)self addFullyDrawnCallback:v24];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return 1;
}

- (void)circlePanLoadFinished
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1005916CC;
  v2[3] = &unk_1012E5D08;
  v2[4] = self;
  [(MapsAppTestCirclePan *)self animateCircle:4 completion:v2];
}

- (void)animateCircle:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (self->_requiresPreLoadAnimation)
  {
    if (a3 < 0)
    {
      if (!self->_isSubTest) {
        [(MapsAppTest *)self failedTest];
      }
      testFinshdCallback = (void (**)(void))self->_testFinshdCallback;
      if (testFinshdCallback) {
        testFinshdCallback[2]();
      }
    }
    if (a3 <= 0) {
      int64_t v9 = -(-a3 & 3);
    }
    else {
      int64_t v9 = a3 & 3;
    }
    if (self->_altitudeIsRegionSize)
    {
      double v10 = +[GEOMapRegion _mapstest_mapRegionAtCenterLocation:](GEOMapRegion, "_mapstest_mapRegionAtCenterLocation:", self->_circlePoints[v9].latitude, self->_circlePoints[v9].longitude, self->_circlePoints[v9].altitude);
      double v11 = [(MapsAppTest *)self mainVKMapView];
      double pitch = self->_pitch;
      double yaw = self->_yaw;
      double animationDuration = self->_animationDuration;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100591EF4;
      v27[3] = &unk_1012F0698;
      int64_t v29 = a3;
      v27[4] = self;
      id v28 = v7;
      [v11 setMapRegion:v10 pitch:v27 yaw:pitch duration:yaw completion:animationDuration];
    }
    else
    {
      double v15 = [(MapsAppTest *)self mainVKMapView];
      VKLocationCoordinate2DMake();
      double v17 = v16;
      double v19 = v18;
      double altitude = self->_circlePoints[v9].altitude;
      double v21 = self->_yaw;
      double v22 = self->_pitch;
      double v23 = self->_animationDuration;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_100591FC8;
      v24[3] = &unk_1012F0698;
      int64_t v26 = a3;
      void v24[4] = self;
      id v25 = v7;
      [v15 setCenterCoordinate:0, v24, v17, v19, altitude, v21, v22, v23];
    }
  }
  else
  {
    (*((void (**)(id))v6 + 2))(v6);
  }
}

- (void)addFullyDrawnCallback:(id)a3
{
  id v4 = a3;
  v5 = [(MapsAppTest *)self fullyDrawnCallbacks];
  id v6 = [v4 copy];

  id v7 = objc_retainBlock(v6);
  [v5 addObject:v7];

  dispatch_time_t v8 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100592180;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)onFullyDrawn:(id)a3
{
  id v17 = a3;
  id v4 = [v17 userInfo];
  v5 = [v4 objectForKeyedSubscript:@"hasFailedTiles"];
  unsigned int v6 = [v5 BOOLValue];

  id v7 = [v17 object];
  if (v7)
  {
    v5 = [v17 object];
    dispatch_time_t v8 = [(MapsAppTest *)self mainVKMapView];
    if (v5 != v8)
    {

      goto LABEL_11;
    }
  }
  int64_t v9 = [(MapsAppTest *)self mainVKMapView];
  unsigned int v10 = [v9 isFullyDrawn] & (v6 ^ 1);

  if (v7)
  {

    if ((v10 & 1) == 0) {
      goto LABEL_11;
    }
  }
  else if (!v10)
  {
    goto LABEL_11;
  }
  double v11 = +[NSNotificationCenter defaultCenter];
  [v11 removeObserver:self name:VKMapViewDidBecomeFullyDrawnNotification object:0];

  while (1)
  {
    double v12 = [(MapsAppTest *)self fullyDrawnCallbacks];
    id v13 = [v12 count];

    if (!v13) {
      break;
    }
    double v14 = [(MapsAppTest *)self fullyDrawnCallbacks];
    double v15 = [v14 firstObject];

    double v16 = [(MapsAppTest *)self fullyDrawnCallbacks];
    [v16 removeObjectAtIndex:0];

    v15[2](v15);
  }
LABEL_11:
}

- ($1AB5FA073B851C12C2339EC22442E995)endPoint
{
  double latitude = self->_endPoint.latitude;
  double longitude = self->_endPoint.longitude;
  double altitude = self->_endPoint.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setEndPoint:(id)a3
{
  self->_endPoint = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
}

- (BOOL)altitudeIsRegionSize
{
  return self->_altitudeIsRegionSize;
}

- (void)setAltitudeIsRegionSize:(BOOL)a3
{
  self->_altitudeIsRegionSize = a3;
}

- (BOOL)useTestNameInResults
{
  return self->_useTestNameInResults;
}

- (void)setUseTestNameInResults:(BOOL)a3
{
  self->_useTestNameInResults = a3;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  self->_double pitch = a3;
}

- (double)yaw
{
  return self->_yaw;
}

- (void)setYaw:(double)a3
{
  self->_double yaw = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_double animationDuration = a3;
}

- (int64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(int64_t)a3
{
  self->_iterations = a3;
}

- (double)circleRadius
{
  return self->_circleRadius;
}

- (void)setCircleRadius:(double)a3
{
  self->_circleRadius = a3;
}

- (id)testFinshdCallback
{
  return self->_testFinshdCallback;
}

- (void)setTestFinshdCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

@end