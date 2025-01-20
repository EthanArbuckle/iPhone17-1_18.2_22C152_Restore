@interface MapsAppTestPanZoom
- (BOOL)runTest;
- (BOOL)shouldUseStyleZoom;
- (MapsAppTestPanZoom)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
- (NSArray)testPoints;
- (double)pitch;
- (double)yaw;
- (float)styleZoom;
- (void)addFullyDrawnCallback:(id)a3;
- (void)onFullyDrawn:(id)a3;
- (void)panLoadCompleted;
- (void)panLoadFinished;
- (void)panToTestPoint:(unsigned int)a3;
- (void)setPitch:(double)a3;
- (void)setShouldUseStyleZoom:(BOOL)a3;
- (void)setStyleZoom:(float)a3;
- (void)setTestPoints:(id)a3;
- (void)setYaw:(double)a3;
@end

@implementation MapsAppTestPanZoom

- (MapsAppTestPanZoom)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v31.receiver = self;
  v31.super_class = (Class)MapsAppTestPanZoom;
  id v10 = [(MapsAppTest *)&v31 initWithApplication:a3 testName:v8 options:v9];
  if (v10)
  {
    *((_WORD *)v10 + 32) = [v8 rangeOfString:@"pan"] != 0;
    if (v9)
    {
      v11 = [v9 allKeys];
      unsigned int v12 = [v11 containsObject:@"isSubTest"];

      if (v12)
      {
        v13 = [v9 valueForKey:@"isSubTest"];
        *((unsigned char *)v10 + 64) = [v13 BOOLValue];
      }
      v14 = [v9 allKeys];
      unsigned int v15 = [v14 containsObject:@"styleZoom"];

      if (v15)
      {
        v16 = [v9 valueForKey:@"styleZoom"];
        [v16 floatValue];
        *((_DWORD *)v10 + 17) = v17;
        *((unsigned char *)v10 + 65) = 1;
      }
    }
    v18 = objc_alloc_init(MapsPanTestPoint);
    v19 = objc_alloc_init(MapsPanTestPoint);
    [v9 _mapstest_startPoint];
    -[MapsPanTestPoint setTestPoint:](v18, "setTestPoint:");
    [v9 _mapstest_animationDurationWithDefault:1.0];
    -[MapsPanTestPoint setTimeToNextPoint:](v18, "setTimeToNextPoint:");
    [v9 _mapstest_endPoint];
    -[MapsPanTestPoint setTestPoint:](v19, "setTestPoint:");
    [v9 _mapstest_animationDurationWithDefault:1.0];
    -[MapsPanTestPoint setTimeToNextPoint:](v19, "setTimeToNextPoint:");
    if (objc_msgSend(v9, "_mapstest_hasMidPoint"))
    {
      v20 = objc_alloc_init(MapsPanTestPoint);
      [v9 _mapstest_midPoint];
      -[MapsPanTestPoint setTestPoint:](v20, "setTestPoint:");
      [v9 _mapstest_animationDurationWithDefault:1.0];
      -[MapsPanTestPoint setTimeToNextPoint:](v20, "setTimeToNextPoint:");
      id v21 = [objc_alloc((Class)NSArray) initWithObjects:v18, v20, v19, 0];
      v22 = (void *)*((void *)v10 + 9);
      *((void *)v10 + 9) = v21;
    }
    else
    {
      v23 = [v10 testName];
      id v24 = [v23 rangeOfString:@"zoom"];

      id v25 = objc_alloc((Class)NSArray);
      if (v24) {
        id v26 = [v25 initWithObjects:v18, v19, 0, v30];
      }
      else {
        id v26 = [v25 initWithObjects:v18, v19, v18, 0];
      }
      v20 = (MapsPanTestPoint *)*((void *)v10 + 9);
      *((void *)v10 + 9) = v26;
    }

    [v9 _mapstest_pitch];
    *((void *)v10 + 10) = v27;
    [v9 _mapstest_yaw];
    *((void *)v10 + 11) = v28;
  }
  return (MapsAppTestPanZoom *)v10;
}

- (BOOL)runTest
{
  if (!self->_isSubTest) {
    [(MapsAppTest *)self setupForVKTest];
  }
  v3 = [(MapsAppTest *)self mainMKMapView];
  [v3 _setLocationPulseEnabled:0];

  v4 = [(MapsAppTest *)self mainVKMapView];
  v5 = [(MapsAppTest *)self options];
  [self switchToMapType:[v5 _mapstest_mapType]];
  v6 = [(MapsAppTestPanZoom *)self testPoints];
  v7 = [v6 objectAtIndex:0];
  [v7 testPoint];
  id v8 = +[GEOMapRegion _mapstest_mapRegionAtCenterLocation:](GEOMapRegion, "_mapstest_mapRegionAtCenterLocation:");

  [(MapsAppTestPanZoom *)self pitch];
  double v10 = v9;
  [(MapsAppTestPanZoom *)self yaw];
  [v4 setMapRegion:v8 pitch:v10 yaw:v11];
  if (self->_shouldUseStyleZoom)
  {
    [v4 bounds];
    double MidX = CGRectGetMidX(v20);
    [v4 bounds];
    double MidY = CGRectGetMidY(v21);
    v14 = [v4 cameraDelegate];
    [v14 mapLayerWillChangeRegionAnimated:0];

    [v4 zoomToLevel:self->_styleZoom withFocusPoint:MidX, MidY];
    unsigned int v15 = [v4 cameraDelegate];
    [v15 mapLayerDidChangeRegionAnimated:0];
  }
  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100590498;
  v17[3] = &unk_1012E6708;
  objc_copyWeak(&v18, &location);
  [(MapsAppTestPanZoom *)self addFullyDrawnCallback:v17];
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return 1;
}

- (void)panToTestPoint:(unsigned int)a3
{
  v5 = [(MapsAppTestPanZoom *)self testPoints];
  id v6 = [v5 count];

  if ((unint64_t)v6 <= a3)
  {
    [(MapsAppTestPanZoom *)self panLoadCompleted];
  }
  else
  {
    v7 = [(MapsAppTest *)self mainVKMapView];
    id v8 = [(MapsAppTestPanZoom *)self testPoints];
    double v9 = [v8 objectAtIndex:a3];
    [v9 testPoint];
    double v10 = +[GEOMapRegion _mapstest_mapRegionAtCenterLocation:](GEOMapRegion, "_mapstest_mapRegionAtCenterLocation:");

    if (self->_shouldUseStyleZoom)
    {
      double v11 = [(MapsAppTest *)self mainVKMapView];
      unsigned int v12 = [(MapsAppTestPanZoom *)self testPoints];
      v34 = [v12 objectAtIndex:a3];
      [v34 testPoint];
      v13 = [(MapsAppTestPanZoom *)self testPoints];
      v14 = [v13 objectAtIndex:a3];
      [v14 testPoint];
      VKLocationCoordinate2DMake();
      double v16 = v15;
      double v18 = v17;
      [v7 altitude];
      double v20 = v19;
      [(MapsAppTestPanZoom *)self yaw];
      double v22 = v21;
      [(MapsAppTestPanZoom *)self pitch];
      double v24 = v23;
      id v25 = [(MapsAppTestPanZoom *)self testPoints];
      [v25 objectAtIndex:a3 - 1];
      v27 = id v26 = v10;
      [v27 timeToNextPoint];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100590804;
      v37[3] = &unk_1012F0620;
      v37[4] = self;
      unsigned int v38 = a3;
      [v11 setCenterCoordinate:0 altitude:v37 yaw:v16 pitch:v18 duration:v20 timingCurve:v22 completion:v24];

      double v10 = v26;
    }
    else
    {
      [(MapsAppTestPanZoom *)self pitch];
      double v30 = v29;
      [(MapsAppTestPanZoom *)self yaw];
      double v32 = v31;
      double v11 = [(MapsAppTestPanZoom *)self testPoints];
      unsigned int v12 = [v11 objectAtIndex:a3 - 1];
      [v12 timeToNextPoint];
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100590898;
      v35[3] = &unk_1012F0620;
      v35[4] = self;
      unsigned int v36 = a3;
      [v7 setMapRegion:v10 pitch:v35 yaw:v30 duration:v32 completion:v33];
    }
  }
}

- (void)panLoadFinished
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005909BC;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)panLoadCompleted
{
  dispatch_time_t v3 = [(MapsAppTest *)self mainVKMapView];
  [v3 disableTestStatistics];
  [v3 disableTileStatistics];
  double v15 = v3;
  v4 = [v3 testStatistics];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        double v10 = [v4 objectForKey:v9];
        double v11 = [(MapsAppTest *)self results];
        unsigned int v12 = +[NSString stringWithFormat:@"sub:pan/zoom:%@", v9];
        [v11 setObject:v10 forKey:v12];
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }
  v13 = [v15 tileStatistics];
  if (v13)
  {
    v14 = [(MapsAppTest *)self results];
    [v14 addEntriesFromDictionary:v13];
  }
  [v15 resetTestStatistics];
  [v15 resetTileStatistics];
  [(MapsAppTest *)self finishedTest];
}

- (void)addFullyDrawnCallback:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsAppTest *)self fullyDrawnCallbacks];
  id v6 = [v4 copy];

  id v7 = objc_retainBlock(v6);
  [v5 addObject:v7];

  dispatch_time_t v8 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100590CE0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)onFullyDrawn:(id)a3
{
  id v17 = a3;
  id v4 = [v17 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"hasFailedTiles"];
  unsigned int v6 = [v5 BOOLValue];

  id v7 = [v17 object];
  if (v7)
  {
    id v5 = [v17 object];
    dispatch_time_t v8 = [(MapsAppTest *)self mainVKMapView];
    if (v5 != v8)
    {

      goto LABEL_11;
    }
  }
  uint64_t v9 = [(MapsAppTest *)self mainVKMapView];
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
    unsigned int v12 = [(MapsAppTest *)self fullyDrawnCallbacks];
    id v13 = [v12 count];

    if (!v13) {
      break;
    }
    v14 = [(MapsAppTest *)self fullyDrawnCallbacks];
    double v15 = [v14 firstObject];

    long long v16 = [(MapsAppTest *)self fullyDrawnCallbacks];
    [v16 removeObjectAtIndex:0];

    v15[2](v15);
  }
LABEL_11:
}

- (NSArray)testPoints
{
  return self->_testPoints;
}

- (void)setTestPoints:(id)a3
{
}

- (float)styleZoom
{
  return self->_styleZoom;
}

- (void)setStyleZoom:(float)a3
{
  self->_styleZoom = a3;
}

- (BOOL)shouldUseStyleZoom
{
  return self->_shouldUseStyleZoom;
}

- (void)setShouldUseStyleZoom:(BOOL)a3
{
  self->_shouldUseStyleZoom = a3;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)yaw
{
  return self->_yaw;
}

- (void)setYaw:(double)a3
{
  self->_yaw = a3;
}

- (void).cxx_destruct
{
}

@end