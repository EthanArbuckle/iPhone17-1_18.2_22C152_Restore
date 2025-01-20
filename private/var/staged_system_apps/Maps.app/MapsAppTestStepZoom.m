@interface MapsAppTestStepZoom
- ($F24F406B2B787EFB06265DBA3D28CBD5)focusPoint;
- (BOOL)clearCacheOnZoom;
- (BOOL)runTest;
- (MapsAppTestStepZoom)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
- (double)_regionSizeForZoom:(double)a3;
- (double)stepAnimationDuration;
- (int64_t)_zoomAmount;
- (int64_t)zoomEnd;
- (int64_t)zoomStart;
- (void)addFullyDrawnCallback:(id)a3;
- (void)onFullyDrawn:(id)a3;
- (void)runStepZoomTest:(double)a3;
- (void)setClearCacheOnZoom:(BOOL)a3;
- (void)setFocusPoint:(id)a3;
- (void)setStepAnimationDuration:(double)a3;
- (void)setZoomEnd:(int64_t)a3;
- (void)setZoomStart:(int64_t)a3;
- (void)stepLoadCompleted:(id)a3;
@end

@implementation MapsAppTestStepZoom

- (MapsAppTestStepZoom)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  id v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MapsAppTestStepZoom;
  v9 = [(MapsAppTest *)&v19 initWithApplication:a3 testName:a4 options:v8];
  v10 = v9;
  if (v9)
  {
    p_focusPoint = &v9->_focusPoint;
    [v8 _mapstest_VKLocationCoordinate2D];
    *(void *)&p_focusPoint->latitude = v12;
    v10->_focusPoint.longitude = v13;
    v14 = [v8 objectForKeyedSubscript:@"zoomStart"];
    v10->_zoomStart = (int64_t)[v14 integerValue];

    v15 = [v8 objectForKeyedSubscript:@"zoomEnd"];
    v10->_zoomEnd = (int64_t)[v15 integerValue];

    [v8 _mapstest_animationDurationWithDefault:0.0];
    v10->_stepAnimationDuration = v16;
    v17 = [v8 objectForKeyedSubscript:@"clearCachesOnZoom"];
    v10->_clearCacheOnZoom = [v17 BOOLValue];
  }
  return v10;
}

- (double)_regionSizeForZoom:(double)a3
{
  return 1.0 / exp2(a3 + -9.0);
}

- (int64_t)_zoomAmount
{
  if (self->_zoomStart < self->_zoomEnd) {
    return 1;
  }
  else {
    return -1;
  }
}

- (BOOL)runTest
{
  [(MapsAppTest *)self setupForVKTest];
  v3 = [(MapsAppTest *)self mainMKMapView];
  [v3 _setLocationPulseEnabled:0];

  v4 = [(MapsAppTest *)self mainVKMapView];
  v5 = [(MapsAppTest *)self options];
  [self switchToMapType:[v5 _mapstest_mapType]];
  [(MapsAppTestStepZoom *)self _regionSizeForZoom:(double)self->_zoomStart];
  VKLocationCoordinate3DMake();
  v6 = +[GEOMapRegion _mapstest_mapRegionAtCenterLocation:](GEOMapRegion, "_mapstest_mapRegionAtCenterLocation:");
  [v4 setMapRegion:v6 pitch:0.0 yaw:0.0];
  objc_initWeak(&location, self);
  double zoomStart = (double)self->_zoomStart;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100AF8750;
  v9[3] = &unk_1012F0708;
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)&zoomStart;
  [(MapsAppTestStepZoom *)self addFullyDrawnCallback:v9];
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);

  return 1;
}

- (void)runStepZoomTest:(double)a3
{
  if ((double)self->_zoomEnd == a3)
  {
    [(MapsAppTest *)self finishedTest];
  }
  else
  {
    if ([(MapsAppTestStepZoom *)self clearCacheOnZoom])
    {
      v5 = +[GEOTileLoader modernLoader];
      [v5 shrinkDiskCacheToSize:0 callbackQ:&_dispatch_main_q finished:&stru_101317418];
    }
    dispatch_time_t v6 = dispatch_time(0, 500000000);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100AF8958;
    v7[3] = &unk_1012E69C0;
    *(double *)&v7[5] = a3;
    v7[4] = self;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

- (void)stepLoadCompleted:(id)a3
{
  id v4 = a3;
  v5 = [(MapsAppTest *)self mainVKMapView];
  [v5 disableTileStatistics];
  v15 = v5;
  dispatch_time_t v6 = [v5 tileStatistics];
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
        v12 = [v6 objectForKey:v11];
        double v13 = [(MapsAppTest *)self results];
        v14 = +[NSString stringWithFormat:@"%@:%@", v4, v11];
        [v13 setObject:v12 forKey:v14];
      }
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  [v15 resetTileStatistics];
  [(MapsAppTest *)self finishedSubTest:v4];
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
  block[2] = sub_100AF8EC0;
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
    v12 = [(MapsAppTest *)self fullyDrawnCallbacks];
    id v13 = [v12 count];

    if (!v13) {
      break;
    }
    v14 = [(MapsAppTest *)self fullyDrawnCallbacks];
    v15 = [v14 firstObject];

    long long v16 = [(MapsAppTest *)self fullyDrawnCallbacks];
    [v16 removeObjectAtIndex:0];

    v15[2](v15);
  }
LABEL_11:
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)focusPoint
{
  double latitude = self->_focusPoint.latitude;
  double longitude = self->_focusPoint.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (void)setFocusPoint:(id)a3
{
  self->_focusPoint = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (int64_t)zoomStart
{
  return self->_zoomStart;
}

- (void)setZoomStart:(int64_t)a3
{
  self->_double zoomStart = a3;
}

- (int64_t)zoomEnd
{
  return self->_zoomEnd;
}

- (void)setZoomEnd:(int64_t)a3
{
  self->_zoomEnd = a3;
}

- (double)stepAnimationDuration
{
  return self->_stepAnimationDuration;
}

- (void)setStepAnimationDuration:(double)a3
{
  self->_stepAnimationDuration = a3;
}

- (BOOL)clearCacheOnZoom
{
  return self->_clearCacheOnZoom;
}

- (void)setClearCacheOnZoom:(BOOL)a3
{
  self->_clearCacheOnZoom = a3;
}

- (void).cxx_destruct
{
}

@end