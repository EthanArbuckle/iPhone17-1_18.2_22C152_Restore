@interface MapsAppTestJump
- ($1AB5FA073B851C12C2339EC22442E995)endPoint;
- (BOOL)altitudeIsRegionSize;
- (BOOL)runTest;
- (BOOL)savedDebugDrawContinuously;
- (MapsAppTestJump)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
- (double)pitch;
- (double)yaw;
- (unint64_t)waitSecondsForMapViewSetup;
- (void)didFinishJumping;
- (void)finishedFps;
- (void)jumpToBayArea;
- (void)jumpToCupertino;
- (void)setAltitudeIsRegionSize:(BOOL)a3;
- (void)setEndPoint:(id)a3;
- (void)setPitch:(double)a3;
- (void)setSavedDebugDrawContinuously:(BOOL)a3;
- (void)setWaitSecondsForMapViewSetup:(unint64_t)a3;
- (void)setYaw:(double)a3;
- (void)startTimingFps;
@end

@implementation MapsAppTestJump

- (MapsAppTestJump)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MapsAppTestJump;
  v9 = [(MapsAppTest *)&v24 initWithApplication:a3 testName:a4 options:v8];
  if (v9)
  {
    [v8 _mapstest_pitch];
    v9->_pitch = v10;
    [v8 _mapstest_yaw];
    v9->_yaw = v11;
    [v8 _mapstest_jumpPoint];
    v9->_endPoint.latitude = v12;
    v9->_endPoint.longitude = v13;
    v9->_endPoint.altitude = v14;
    v9->_altitudeIsRegionSize = 1;
    if (v8)
    {
      v15 = [v8 allKeys];
      unsigned int v16 = [v15 containsObject:@"requiresSubTest"];

      if (v16)
      {
        v17 = [v8 valueForKey:@"requiresSubTest"];
        v9->_requiresSubTest = [v17 BOOLValue];
      }
      else
      {
        v9->_requiresSubTest = 1;
      }
    }
    v18 = [(MapsAppTest *)v9 options];
    unsigned int v19 = [v18 _mapstest_hasAltitude];

    if (v19)
    {
      v20 = [(MapsAppTest *)v9 options];
      [v20 _mapstest_altitude];
      v9->_endPoint.altitude = v21;

      v9->_altitudeIsRegionSize = 0;
    }
    v22 = [(MapsAppTest *)v9 options];
    v9->_waitSecondsForMapViewSetup = [v22 _mapstest_waitSecondsForMapViewSetup];
  }
  return v9;
}

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self testName];
  v4 = [(MapsAppTest *)self options];
  NSLog(@"test is %@", v3);
  id v5 = [v3 rangeOfString:@"-"];
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL) {
    id v5 = [v3 length];
  }
  v6 = [v3 substringToIndex:v5];
  SEL v7 = NSSelectorFromString(v6);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v8 = [v4 objectForKeyedSubscript:@"latitude"];
    if (!v8
      || (v9 = (void *)v8,
          [v4 objectForKeyedSubscript:@"longitude"],
          double v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          !v10))
    {
      BOOL v14 = 0;
      goto LABEL_12;
    }
    SEL v7 = 0;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100ACB474;
  v16[3] = &unk_1012E69C0;
  v16[4] = self;
  v16[5] = v7;
  double v11 = objc_retainBlock(v16);
  [(MapsAppTest *)self setupForVKTest];
  unint64_t waitSecondsForMapViewSetup = self->_waitSecondsForMapViewSetup;
  if (waitSecondsForMapViewSetup)
  {
    dispatch_time_t v13 = dispatch_time(0, 1000000000 * waitSecondsForMapViewSetup);
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v11);
  }
  else
  {
    ((void (*)(void *))v11[2])(v11);
  }

  BOOL v14 = 1;
LABEL_12:

  return v14;
}

- (void)jumpToBayArea
{
  p_endPoint = &self->_endPoint;
  id v6 = [(MapsAppTest *)self mainVKMapView];
  [v6 _mapstest_jumpToBayArea];
  p_endPoint->latitude = v3;
  p_endPoint->longitude = v4;
  p_endPoint->altitude = v5;
}

- (void)jumpToCupertino
{
  p_endPoint = &self->_endPoint;
  id v6 = [(MapsAppTest *)self mainVKMapView];
  [v6 _mapstest_jumpToCupertino];
  p_endPoint->latitude = v3;
  p_endPoint->longitude = v4;
  p_endPoint->altitude = v5;
}

- (void)didFinishJumping
{
  [(MapsAppTest *)self finishedSubTest:@"loadingScene"];
  double v3 = [(MapsAppTest *)self mainVKMapView];
  [v3 disableTestStatistics];
  [v3 disableTileStatistics];
  unsigned int v16 = v3;
  double v4 = [v3 testStatistics];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        double v10 = [v4 objectForKey:v9];
        double v11 = [(MapsAppTest *)self results];
        double v12 = +[NSString stringWithFormat:@"sub:loadingScene:%@", v9];
        [v11 setObject:v10 forKey:v12];
      }
      id v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }
  [v16 resetTestStatistics];
  if ([v16 mapType] != 3 && objc_msgSend(v16, "mapType") != 4)
  {
    dispatch_time_t v13 = [v16 tileStatistics];
    if (v13)
    {
      BOOL v14 = [(MapsAppTest *)self results];
      [v14 addEntriesFromDictionary:v13];
    }
  }
  [v16 resetTileStatistics];
  dispatch_time_t v15 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100ACB934;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)startTimingFps
{
  [(MapsAppTest *)self startedSubTest:@"timingFPS"];
  double v3 = +[VKDebugSettings sharedSettings];
  self->_savedDebugDrawContinuously = [v3 layoutContinuously];

  double v4 = +[VKDebugSettings sharedSettings];
  [v4 setLayoutContinuously:1];

  id v5 = [(MapsAppTest *)self mainVKMapView];
  [v5 setNeedsDisplay];
  [v5 enableTestStatistics];
  [v5 enableTileStatistics];
  [(MapsAppTestJump *)self performSelector:"finishedFps" withObject:0 afterDelay:3.0];
}

- (void)finishedFps
{
  BOOL savedDebugDrawContinuously = self->_savedDebugDrawContinuously;
  double v4 = +[VKDebugSettings sharedSettings];
  [v4 setLayoutContinuously:savedDebugDrawContinuously];

  [(MapsAppTest *)self finishedSubTest:@"timingFPS"];
  long long v20 = [(MapsAppTest *)self mainVKMapView];
  [v20 disableTestStatistics];
  [v20 disableTileStatistics];
  [v20 testStatistics];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        double v10 = [v5 objectForKey:v9];
        double v11 = [(MapsAppTest *)self results];
        double v12 = +[NSString stringWithFormat:@"sub:timingFPS:%@", v9];
        [v11 setObject:v10 forKey:v12];
      }
      id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v6);
  }

  [v20 resetTestStatistics];
  [v20 resetTileStatistics];
  if (self->_requiresSubTest)
  {
    dispatch_time_t v13 = [MapsAppTestCirclePan alloc];
    BOOL v14 = [(MapsAppTest *)self app];
    dispatch_time_t v15 = [(MapsAppTest *)self testName];
    unsigned int v16 = [(MapsAppTestCirclePan *)v13 initWithApplication:v14 testName:v15 options:0];
    subTest = self->_subTest;
    self->_subTest = v16;

    -[MapsAppTestCirclePan setEndPoint:](self->_subTest, "setEndPoint:", self->_endPoint.latitude, self->_endPoint.longitude, self->_endPoint.altitude);
    [(MapsAppTestCirclePan *)self->_subTest setPitch:self->_pitch];
    [(MapsAppTestCirclePan *)self->_subTest setYaw:self->_yaw];
    [(MapsAppTestCirclePan *)self->_subTest setAltitudeIsRegionSize:self->_altitudeIsRegionSize];
    objc_initWeak(&location, self);
    long long v18 = self->_subTest;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100ACBDA0;
    v21[3] = &unk_1012E6708;
    objc_copyWeak(&v22, &location);
    [(MapsAppTestCirclePan *)v18 setTestFinshdCallback:v21];
    long long v19 = [(MapsAppTest *)self results];
    [(MapsAppTest *)self->_subTest setResults:v19];

    [(MapsAppTestCirclePan *)self->_subTest runTest];
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    [(MapsAppTest *)self finishedTest];
  }
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

- (unint64_t)waitSecondsForMapViewSetup
{
  return self->_waitSecondsForMapViewSetup;
}

- (void)setWaitSecondsForMapViewSetup:(unint64_t)a3
{
  self->_unint64_t waitSecondsForMapViewSetup = a3;
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

- (BOOL)savedDebugDrawContinuously
{
  return self->_savedDebugDrawContinuously;
}

- (void)setSavedDebugDrawContinuously:(BOOL)a3
{
  self->_BOOL savedDebugDrawContinuously = a3;
}

- (void).cxx_destruct
{
}

@end