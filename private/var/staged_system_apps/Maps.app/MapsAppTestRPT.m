@interface MapsAppTestRPT
- ($1AB5FA073B851C12C2339EC22442E995)startPoint;
- (BOOL)isLookAroundTest;
- (BOOL)runTest;
- (BOOL)savedDebugDrawContinuously;
- (MapsAppTestRPT)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
- (NSArray)testActions;
- (double)actionDuration;
- (double)pitch;
- (double)yaw;
- (void)addFullyDrawnCallback:(id)a3;
- (void)enterLookAroundForTest:(id)a3;
- (void)expandLookAroundToFullscreen:(BOOL)a3 withLookAroundView:(id)a4 mapItem:(id)a5 completionBlock:(id)a6;
- (void)initialLoadComplete;
- (void)onFullyDrawn:(id)a3;
- (void)onLookAroundView:(id)a3 didBecomeAdequatelyDrawnCallback:(id)a4;
- (void)onLookAroundView:(id)a3 didCompletionPostTransitionAnimation:(id)a4;
- (void)rptTestCompleted;
- (void)setActionDuration:(double)a3;
- (void)setIsLookAroundTest:(BOOL)a3;
- (void)setPitch:(double)a3;
- (void)setSavedDebugDrawContinuously:(BOOL)a3;
- (void)setStartPoint:(id)a3;
- (void)setYaw:(double)a3;
@end

@implementation MapsAppTestRPT

- (MapsAppTestRPT)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)MapsAppTestRPT;
  v10 = [(MapsAppTest *)&v22 initWithApplication:a3 testName:v8 options:v9];
  v11 = v10;
  if (v10)
  {
    p_startPoint = &v10->_startPoint;
    [v9 _mapstest_startPoint];
    *(void *)&p_startPoint->latitude = v13;
    v11->_startPoint.longitude = v14;
    v11->_startPoint.altitude = v15;
    [v9 _mapstest_pitch];
    v11->_pitch = v16;
    [v9 _mapstest_yaw];
    v11->_yaw = v17;
    uint64_t v18 = [v9 _mapstest_rptTestActions];
    testActions = v11->_testActions;
    v11->_testActions = (NSArray *)v18;

    [v9 _mapstest_animationDurationWithDefault:2.0];
    v11->_actionDuration = v20;
    v11->_isLookAroundTest = [v8 rangeOfString:@"LookAround"] == (id)3;
  }

  return v11;
}

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self options];
  if (![(MapsAppTest *)self isRunningOnCarPlay]) {
    [self switchToMapType:[v3 _mapstest_mapType]];
  }
  [(MapsAppTest *)self setupForVKTest];
  v4 = [(MapsAppTest *)self mainMKMapView];
  [v4 _setLocationPulseEnabled:0];

  v5 = [(MapsAppTest *)self mainVKMapView];
  [v5 setDisableTransitLines:0];
  [(MapsAppTestRPT *)self startPoint];
  v6 = +[GEOMapRegion _mapstest_mapRegionAtCenterLocation:](GEOMapRegion, "_mapstest_mapRegionAtCenterLocation:");
  [(MapsAppTestRPT *)self pitch];
  double v8 = v7;
  [(MapsAppTestRPT *)self yaw];
  [v5 setMapRegion:v6 pitch:v8 yaw:v9];
  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1006685EC;
  v11[3] = &unk_1012E6708;
  objc_copyWeak(&v12, &location);
  [(MapsAppTestRPT *)self addFullyDrawnCallback:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return 1;
}

- (void)initialLoadComplete
{
  dispatch_time_t v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006686BC;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)rptTestCompleted
{
  dispatch_time_t v3 = [(MapsAppTest *)self mainVKMapView];
  if (self->_isLookAroundTest)
  {
    BOOL savedDebugDrawContinuously = self->_savedDebugDrawContinuously;
    v5 = +[VKDebugSettings sharedSettings];
    [v5 setLayoutContinuously:savedDebugDrawContinuously];
  }
  [v3 disableTestStatistics];
  [v3 disableTileStatistics];
  double v17 = v3;
  v6 = [v3 testStatistics];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v12 = [v6 objectForKey:v11];
        v13 = [(MapsAppTest *)self results];
        double v14 = +[NSString stringWithFormat:@"sub:rpt:%@", v11];
        [v13 setObject:v12 forKey:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }
  double v15 = [v17 tileStatistics];
  if (v15)
  {
    double v16 = [(MapsAppTest *)self results];
    [v16 addEntriesFromDictionary:v15];
  }
  [v17 resetTestStatistics];
  [v17 resetTileStatistics];
  [(MapsAppTest *)self finishedTest];
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
  block[2] = sub_100668C20;
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
  uint64_t v11 = +[NSNotificationCenter defaultCenter];
  [v11 removeObserver:self name:VKMapViewDidBecomeFullyDrawnNotification object:0];

  while (1)
  {
    id v12 = [(MapsAppTest *)self fullyDrawnCallbacks];
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

- (void)onLookAroundView:(id)a3 didBecomeAdequatelyDrawnCallback:(id)a4
{
  id v5 = a3;
  unsigned int v6 = (void (**)(void))a4;
  if ([v5 adequatelyDrawn])
  {
    id v7 = sub_1005764AC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      dispatch_time_t v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138412546;
      double v14 = v9;
      __int16 v15 = 2048;
      id v16 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "<%@:%p> is already adequately drawn", buf, 0x16u);
    }
    if (v6) {
      v6[2](v6);
    }
  }
  else
  {
    uint64_t v10 = MKLookAroundViewDidBecomeAdequatelyDrawnNotification;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100668FDC;
    v11[3] = &unk_1012EEF90;
    id v12 = v6;
    +[PPTNotificationCenter addOnceObserverForName:v10 object:v5 usingBlock:v11];
  }
}

- (void)onLookAroundView:(id)a3 didCompletionPostTransitionAnimation:(id)a4
{
  id v4 = a4;
  dispatch_time_t v5 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10066910C;
  block[3] = &unk_1012E6EA8;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)expandLookAroundToFullscreen:(BOOL)a3 withLookAroundView:(id)a4 mapItem:(id)a5 completionBlock:(id)a6
{
  BOOL v8 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100669260;
  v15[3] = &unk_1012EF058;
  v15[4] = self;
  id v16 = a4;
  id v17 = a6;
  id v10 = v17;
  id v11 = v16;
  id v12 = a5;
  +[PPTNotificationCenter addOnceObserverForName:@"PPTLookAroundContainerViewControllerDidTransitionToFullscreen" object:0 usingBlock:v15];
  id v13 = +[MKLookAroundEntryPoint entryPointWithMapItem:v12];

  double v14 = [(MapsAppTest *)self testCoordinator];
  [v14 pptTestEnterLookAroundWithEntryPoint:v13 lookAroundView:v11 showsFullScreen:v8];
}

- (void)enterLookAroundForTest:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = +[VKDebugSettings sharedSettings];
  self->_BOOL savedDebugDrawContinuously = [v5 layoutContinuously];

  id v6 = +[VKDebugSettings sharedSettings];
  [v6 setLayoutContinuously:1];

  [(MapsAppTest *)self startedSubTest:@"lookAroundEnter"];
  id v7 = [(MapsAppTest *)self mainMKMapView];
  id v8 = objc_alloc((Class)MKPlacemark);
  [v7 centerCoordinate];
  id v9 = [v8 initWithCoordinate:];
  id v10 = [objc_alloc((Class)MKMapItem) initWithPlacemark:v9];
  id v11 = +[MKLookAroundEntryPoint entryPointWithMapItem:v10];
  id v12 = [(MapsAppTest *)self testCoordinator];
  [v12 pptTestEnterLookAroundWithEntryPoint:v11 lookAroundView:0 showsFullScreen:0];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100669524;
  v15[3] = &unk_1012EF058;
  v15[4] = self;
  id v16 = v10;
  id v17 = v4;
  id v13 = v4;
  id v14 = v10;
  +[PPTNotificationCenter addOnceObserverForName:@"LookAroundTrayContaineeViewControllerDidAppear" object:0 usingBlock:v15];
}

- ($1AB5FA073B851C12C2339EC22442E995)startPoint
{
  double latitude = self->_startPoint.latitude;
  double longitude = self->_startPoint.longitude;
  double altitude = self->_startPoint.altitude;
  result.var2 = altitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setStartPoint:(id)a3
{
  self->_startPoint = ($5B2A0FEE2A1717E36A90D599307F83D1)a3;
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

- (NSArray)testActions
{
  return self->_testActions;
}

- (double)actionDuration
{
  return self->_actionDuration;
}

- (void)setActionDuration:(double)a3
{
  self->_actionDuration = a3;
}

- (BOOL)savedDebugDrawContinuously
{
  return self->_savedDebugDrawContinuously;
}

- (void)setSavedDebugDrawContinuously:(BOOL)a3
{
  self->_BOOL savedDebugDrawContinuously = a3;
}

- (BOOL)isLookAroundTest
{
  return self->_isLookAroundTest;
}

- (void)setIsLookAroundTest:(BOOL)a3
{
  self->_isLookAroundTest = a3;
}

- (void).cxx_destruct
{
}

@end