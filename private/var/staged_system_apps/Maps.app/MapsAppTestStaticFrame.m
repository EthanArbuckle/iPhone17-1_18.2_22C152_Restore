@interface MapsAppTestStaticFrame
- ($1AB5FA073B851C12C2339EC22442E995)location;
- (BOOL)altitudeIsRegionSize;
- (BOOL)runTest;
- (BOOL)savedDebugDrawContinuously;
- (MapsAppTestStaticFrame)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
- (double)pitch;
- (double)yaw;
- (unint64_t)waitSecondsForMapViewSetup;
- (void)didFinishJumping;
- (void)finishedRendering;
- (void)setAltitudeIsRegionSize:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setPitch:(double)a3;
- (void)setSavedDebugDrawContinuously:(BOOL)a3;
- (void)setWaitSecondsForMapViewSetup:(unint64_t)a3;
- (void)setYaw:(double)a3;
- (void)startRendering;
@end

@implementation MapsAppTestStaticFrame

- (MapsAppTestStaticFrame)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8 = a5;
  v25.receiver = self;
  v25.super_class = (Class)MapsAppTestStaticFrame;
  v9 = [(MapsAppTest *)&v25 initWithApplication:a3 testName:a4 options:v8];
  if (v9)
  {
    [v8 _mapstest_pitch];
    v9->_pitch = v10;
    [v8 _mapstest_yaw];
    v9->_yaw = v11;
    [v8 _mapstest_jumpPoint];
    v9->_location.latitude = v12;
    v9->_location.longitude = v13;
    v9->_location.altitude = v14;
    v9->_altitudeIsRegionSize = 1;
    v9->_requiresViewSetup = 1;
    v15 = [(MapsAppTest *)v9 options];
    v16 = [v15 objectForKeyedSubscript:@"renderingDuration"];

    if (v16)
    {
      v17 = [(MapsAppTest *)v9 options];
      v18 = [v17 objectForKeyedSubscript:@"renderingDuration"];
      v9->_renderingDuration = [v18 intValue];
    }
    else
    {
      v9->_renderingDuration = 10;
    }
    v19 = [(MapsAppTest *)v9 options];
    unsigned int v20 = [v19 _mapstest_hasAltitude];

    if (v20)
    {
      v21 = [(MapsAppTest *)v9 options];
      [v21 _mapstest_altitude];
      v9->_location.altitude = v22;

      v9->_altitudeIsRegionSize = 0;
    }
    v23 = [(MapsAppTest *)v9 options];
    v9->_waitSecondsForMapViewSetup = [v23 _mapstest_waitSecondsForMapViewSetup];
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
      goto LABEL_14;
    }
    SEL v7 = 0;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1003BC568;
  v16[3] = &unk_1012E69C0;
  v16[4] = self;
  v16[5] = v7;
  double v11 = objc_retainBlock(v16);
  if (self->_requiresViewSetup) {
    [(MapsAppTest *)self setupForVKTest];
  }
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
LABEL_14:

  return v14;
}

- (void)didFinishJumping
{
  v3 = [(MapsAppTest *)self mainVKMapView];
  [v3 disableTestStatistics];
  [v3 disableTileStatistics];
  [v3 resetTestStatistics];
  [v3 resetTileStatistics];
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003BC7F0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)startRendering
{
  id v3 = [(MapsAppTest *)self mainVKMapView];
  [v3 setNeedsDisplay];
  [v3 enableTestStatistics];
  [v3 enableTileStatistics];
  [(MapsAppTest *)self startedTest];
  [(MapsAppTest *)self startedSubTest:@"staticFrame"];
  [(MapsAppTestStaticFrame *)self performSelector:"finishedRendering" withObject:0 afterDelay:(double)self->_renderingDuration];
}

- (void)finishedRendering
{
  [(MapsAppTest *)self finishedSubTest:@"staticFrame"];
  BOOL savedDebugDrawContinuously = self->_savedDebugDrawContinuously;
  dispatch_time_t v4 = +[VKDebugSettings sharedSettings];
  [v4 setLayoutContinuously:savedDebugDrawContinuously];

  id v5 = [(MapsAppTest *)self mainVKMapView];
  [v5 disableTestStatistics];
  [v5 disableTileStatistics];
  v15 = v5;
  v6 = [v5 testStatistics];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        double v12 = [v6 objectForKey:v11];
        dispatch_time_t v13 = [(MapsAppTest *)self results];
        BOOL v14 = +[NSString stringWithFormat:@"sub:staticFrame:%@", v11];
        [v13 setObject:v12 forKey:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  [v15 resetTestStatistics];
  [v15 resetTileStatistics];
  [(MapsAppTest *)self finishedTest];
}

- ($1AB5FA073B851C12C2339EC22442E995)location
{
  double latitude = self->_location.latitude;
  double longitude = self->_location.longitude;
  double altitude = self->_location.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setLocation:(id)a3
{
  self->_location = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
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

@end