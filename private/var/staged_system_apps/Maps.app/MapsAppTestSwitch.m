@interface MapsAppTestSwitch
- (BOOL)runTest;
- (void)addFullyDrawnCallback:(id)a3;
- (void)addFullyDrawnCallback:(id)a3 delayInSeconds:(double)a4;
- (void)didFinishJumping;
- (void)onFullyDrawn:(id)a3;
@end

@implementation MapsAppTestSwitch

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self testName];
  NSLog(@"test is %@", v3);

  v4 = [(MapsAppTest *)self options];
  id v5 = [v4 _mapstest_mapTypeWithDefaultType:0];
  self->_switchToType = (unint64_t)v5;
  uint64_t v6 = 1;
  if (!v5) {
    uint64_t v6 = 1;
  }
  if (v5 == 1) {
    uint64_t v6 = 0;
  }
  if (v5 == 104) {
    unint64_t v7 = 0;
  }
  else {
    unint64_t v7 = v6;
  }
  self->_switchFromType = v7;
  -[MapsAppTest switchToMapType:](self, "switchToMapType:");
  [(MapsAppTestJump *)self endPoint];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  v14 = [(MapsAppTest *)self mainVKMapView];
  [(MapsAppTestJump *)self pitch];
  double v16 = v15;
  [(MapsAppTestJump *)self yaw];
  [v14 _mapstest_jumpToCoords:[self altitudeIsRegionSize] pitch:v9 yaw:v11 altitudeIsRegionSize:v13 v16, v17];

  objc_initWeak(&location, self);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100ACC094;
  v19[3] = &unk_1012E6708;
  objc_copyWeak(&v20, &location);
  [(MapsAppTestSwitch *)self addFullyDrawnCallback:v19 delayInSeconds:0.1];
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return 1;
}

- (void)didFinishJumping
{
  [(MapsAppTest *)self startedTest];
  [(MapsAppTest *)self startedSubTest:@"switch"];
  [(MapsAppTest *)self startedSubTest:@"extendedSwitch"];
  [(MapsAppTest *)self switchToMapType:self->_switchToType];
  [(MapsAppTest *)self finishedSubTest:@"switch"];
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100ACC1E4;
  v3[3] = &unk_1012E6708;
  objc_copyWeak(&v4, &location);
  [(MapsAppTestSwitch *)self addFullyDrawnCallback:v3 delayInSeconds:0.1];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)addFullyDrawnCallback:(id)a3
{
}

- (void)addFullyDrawnCallback:(id)a3 delayInSeconds:(double)a4
{
  id v6 = a3;
  if (a4 <= 0.0)
  {
    double v8 = [(MapsAppTest *)self fullyDrawnCallbacks];
    id v9 = [v6 copy];
    id v10 = objc_retainBlock(v9);
    [v8 addObject:v10];

    [(MapsAppTest *)self setupFullyDrawnNotification:"onFullyDrawn:"];
  }
  else
  {
    dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100ACC36C;
    v11[3] = &unk_1012E76E8;
    v11[4] = self;
    id v12 = v6;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, v11);
  }
}

- (void)onFullyDrawn:(id)a3
{
  id v17 = a3;
  id v4 = [v17 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"hasFailedTiles"];
  unsigned int v6 = [v5 BOOLValue];

  dispatch_time_t v7 = [v17 object];
  if (v7)
  {
    id v5 = [v17 object];
    double v8 = [(MapsAppTest *)self mainVKMapView];
    if (v5 != v8)
    {

      goto LABEL_11;
    }
  }
  id v9 = [(MapsAppTest *)self mainVKMapView];
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
    id v12 = [(MapsAppTest *)self fullyDrawnCallbacks];
    id v13 = [v12 count];

    if (!v13) {
      break;
    }
    v14 = [(MapsAppTest *)self fullyDrawnCallbacks];
    double v15 = [v14 firstObject];

    double v16 = [(MapsAppTest *)self fullyDrawnCallbacks];
    [v16 removeObjectAtIndex:0];

    v15[2](v15);
  }
LABEL_11:
}

@end