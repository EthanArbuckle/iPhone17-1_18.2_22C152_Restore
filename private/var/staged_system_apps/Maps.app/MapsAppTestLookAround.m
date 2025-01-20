@interface MapsAppTestLookAround
- (BOOL)runTest;
- (BOOL)savedDebugDrawContinuously;
- (void)addObserverWithSearchString:(id)a3 forDidShowPreviewBlock:(id)a4;
- (void)cleanup:(BOOL)a3;
- (void)displayPlacecardPhotosWithSearchString:(id)a3 resultShortAddress:(id)a4 didShowPreviewBlock:(id)a5;
- (void)enterLookAroundWithLookAroundView:(id)a3 mapItem:(id)a4 showsFullScreen:(BOOL)a5 completionBlock:(id)a6;
- (void)expandLookAroundToFullscreen:(BOOL)a3 withLookAroundView:(id)a4 mapItem:(id)a5 completionBlock:(id)a6;
- (void)jumpToOptionsCoord:(id)a3;
- (void)onLookAroundView:(id)a3 didBecomeAdequatelyDrawnCallback:(id)a4;
- (void)onLookAroundView:(id)a3 didCompletionPostTransitionAnimation:(id)a4;
- (void)panLookAroundView:(id)a3 completion:(id)a4;
- (void)runBrowseTest;
- (void)runBrowseTestWithContinuationBlock:(id)a3;
- (void)runEnterExploreNavExitTest;
- (void)runEnterTest;
- (void)runEnterTestWithContinuationBlock:(id)a3;
- (void)runExploreTest;
- (void)runFullScreenNavTestWithMapItem:(id)a3;
- (void)runNavTest;
- (void)runNavTestWithMapItem:(id)a3 showsFullScreen:(BOOL)a4;
- (void)runZoomTest;
- (void)selectSearchResult:(id)a3;
- (void)setSavedDebugDrawContinuously:(BOOL)a3;
- (void)storefrontWillMoveBlock:(id)a3 didMoveBlock:(id)a4;
- (void)tap:(CGPoint)a3 countdown:(int)a4 mapView:(id)a5 totalTimeInMS:(double)a6 firstTap:(BOOL)a7;
- (void)zoom:(CGPoint)a3 countdown:(int)a4 oldFactor:(double)a5 mapView:(id)a6;
@end

@implementation MapsAppTestLookAround

- (void)cleanup:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = sub_1005764AC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[self.testCoordinator pptTestExitLookAround]", buf, 2u);
  }

  v6 = [(MapsAppTest *)self testCoordinator];
  [v6 pptTestExitLookAround];

  v7 = sub_1005764AC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[self popToRootTrayWithCompletion]", buf, 2u);
  }

  [(MapsAppTest *)self popToRootTrayWithCompletion:0];
  v8 = sub_1005764AC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[super cleanup:testCompleted]", buf, 2u);
  }

  v9.receiver = self;
  v9.super_class = (Class)MapsAppTestLookAround;
  [(MapsAppTest *)&v9 cleanup:v3];
}

- (BOOL)runTest
{
  BOOL v3 = sub_1005764AC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[self.testCoordinator pptTestResetForLaunchURL]", buf, 2u);
  }

  v4 = [(MapsAppTest *)self testCoordinator];
  [v4 pptTestResetForLaunchURL];

  v5 = sub_1005764AC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[self jumpToOptionsCoord:^{...}]", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100562974;
  v7[3] = &unk_1012E5D08;
  v7[4] = self;
  [(MapsAppTestLookAround *)self jumpToOptionsCoord:v7];
  return 1;
}

- (void)jumpToOptionsCoord:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(MapsAppTest *)self setupForVKTest];
    v5 = [(MapsAppTest *)self options];
    [v5 _mapstest_jumpPoint];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    v12 = [(MapsAppTest *)self options];
    [v12 _mapstest_pitch];
    double v14 = v13;

    v15 = [(MapsAppTest *)self options];
    [v15 _mapstest_yaw];
    double v17 = v16;

    v18 = [(MapsAppTest *)self options];
    id v19 = [v18 _mapstest_mapType];

    v20 = sub_1005764AC();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 134217984;
      double v24 = *(double *)&v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[self switchToMapType:%lu]", (uint8_t *)&v23, 0xCu);
    }

    [(MapsAppTest *)self switchToMapType:v19];
    v21 = sub_1005764AC();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 134218752;
      double v24 = v7;
      __int16 v25 = 2048;
      double v26 = v9;
      __int16 v27 = 2048;
      double v28 = v14;
      __int16 v29 = 2048;
      double v30 = v17;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[self.mainVKMapView _mapstest_jumpToCoords:(%g, %g) pitch:%g yaw:%g)]", (uint8_t *)&v23, 0x2Au);
    }

    v22 = [(MapsAppTest *)self mainVKMapView];
    [v22 _mapstest_jumpToCoords:1 pitch:v7 yaw:v9 altitudeIsRegionSize:v14 v17];

    [(MapsAppTest *)self addFullyDrawnCallback:v4];
  }
}

- (void)onLookAroundView:(id)a3 didBecomeAdequatelyDrawnCallback:(id)a4
{
  id v5 = a3;
  double v6 = (void (**)(void))a4;
  if ([v5 adequatelyDrawn])
  {
    double v7 = sub_1005764AC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      double v8 = (objc_class *)objc_opt_class();
      double v9 = NSStringFromClass(v8);
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
    v11[2] = sub_100563018;
    v11[3] = &unk_1012EEF90;
    v12 = v6;
    +[PPTNotificationCenter addOnceObserverForName:v10 object:v5 usingBlock:v11];
  }
}

- (void)onLookAroundView:(id)a3 didCompletionPostTransitionAnimation:(id)a4
{
  id v4 = a4;
  dispatch_time_t v5 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100563148;
  block[3] = &unk_1012E6EA8;
  id v8 = v4;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)addObserverWithSearchString:(id)a3 forDidShowPreviewBlock:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100563238;
  v9[3] = &unk_1012EEFB8;
  double v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v12;
  id v8 = v6;
  +[PPTNotificationCenter addOnceObserverForName:@"PPTLookAroundChromeOverlayDidShowLookAroundPreviewNotificationName" object:0 usingBlock:v9];
}

- (void)displayPlacecardPhotosWithSearchString:(id)a3 resultShortAddress:(id)a4 didShowPreviewBlock:(id)a5
{
  id v8 = a3;
  double v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  id v16 = sub_10056353C;
  double v17 = &unk_1012EEFE0;
  v18 = self;
  id v19 = a4;
  id v20 = v8;
  id v21 = a5;
  id v9 = v21;
  id v10 = v8;
  id v11 = v19;
  +[PPTNotificationCenter addOnceObserverForName:@"SearchSessionDidChangeSearchResultsNotification" object:0 usingBlock:&v14];
  id v12 = objc_alloc_init(SearchFieldItem);
  -[SearchFieldItem setSearchString:](v12, "setSearchString:", v10, v14, v15, v16, v17, v18);
  double v13 = [(MapsAppTest *)self testCoordinator];
  [v13 pptTestSearchForFieldItem:v12];
}

- (void)selectSearchResult:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100563824;
  v4[3] = &unk_1012EF008;
  v4[4] = self;
  id v5 = a3;
  id v3 = v5;
  +[PPTNotificationCenter addOnceObserverForName:@"MapsPinsDroppedForSearchResultsNotification" object:0 usingBlock:v4];
}

- (void)storefrontWillMoveBlock:(id)a3 didMoveBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = MKLookAroundViewWillMoveToStorefrontNotification;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100563984;
  v10[3] = &unk_1012EF030;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  +[PPTNotificationCenter addOnceObserverForName:v7 object:0 usingBlock:v10];
}

- (void)enterLookAroundWithLookAroundView:(id)a3 mapItem:(id)a4 showsFullScreen:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v7 = a5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100563C4C;
  v15[3] = &unk_1012EF058;
  v15[4] = self;
  id v16 = a3;
  id v17 = a6;
  id v10 = v17;
  id v11 = v16;
  id v12 = a4;
  +[PPTNotificationCenter addOnceObserverForName:@"LookAroundTrayContaineeViewControllerDidAppear" object:0 usingBlock:v15];
  double v13 = +[MKLookAroundEntryPoint entryPointWithMapItem:v12];

  double v14 = [(MapsAppTest *)self testCoordinator];
  [v14 pptTestEnterLookAroundWithEntryPoint:v13 lookAroundView:v11 showsFullScreen:v7];
}

- (void)expandLookAroundToFullscreen:(BOOL)a3 withLookAroundView:(id)a4 mapItem:(id)a5 completionBlock:(id)a6
{
  BOOL v8 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100563F28;
  v15[3] = &unk_1012EF058;
  v15[4] = self;
  id v16 = a4;
  id v17 = a6;
  id v10 = v17;
  id v11 = v16;
  id v12 = a5;
  +[PPTNotificationCenter addOnceObserverForName:@"PPTLookAroundContainerViewControllerDidTransitionToFullscreen" object:0 usingBlock:v15];
  double v13 = +[MKLookAroundEntryPoint entryPointWithMapItem:v12];

  double v14 = [(MapsAppTest *)self testCoordinator];
  [v14 pptTestEnterLookAroundWithEntryPoint:v13 lookAroundView:v11 showsFullScreen:v8];
}

- (void)runBrowseTest
{
}

- (void)runBrowseTestWithContinuationBlock:(id)a3
{
  id v4 = a3;
  id v5 = sub_1005764AC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[self startedTest]", buf, 2u);
  }

  [(MapsAppTest *)self startedTest];
  id v6 = [(MapsAppTest *)self options];
  BOOL v7 = [v6 objectForKeyedSubscript:@"searchString"];
  BOOL v8 = [(MapsAppTest *)self options];
  id v9 = [v8 objectForKeyedSubscript:@"resultShortAddress"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10056417C;
  v11[3] = &unk_1012EF0A8;
  void v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [(MapsAppTestLookAround *)self displayPlacecardPhotosWithSearchString:v7 resultShortAddress:v9 didShowPreviewBlock:v11];
}

- (void)runEnterTest
{
}

- (void)runEnterTestWithContinuationBlock:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1005646E0;
  v4[3] = &unk_1012EF0A8;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(MapsAppTestLookAround *)v5 runBrowseTestWithContinuationBlock:v4];
}

- (void)runExploreTest
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10056496C;
  v2[3] = &unk_1012EF0D0;
  v2[4] = self;
  [(MapsAppTestLookAround *)self runEnterTestWithContinuationBlock:v2];
}

- (void)runEnterExploreNavExitTest
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100564BA0;
  v2[3] = &unk_1012EF0D0;
  v2[4] = self;
  [(MapsAppTestLookAround *)self runEnterTestWithContinuationBlock:v2];
}

- (void)runNavTest
{
  id v6 = [(MapsAppTest *)self mainMKMapView];
  id v3 = objc_alloc((Class)MKPlacemark);
  [v6 centerCoordinate];
  id v4 = [v3 initWithCoordinate:];
  id v5 = [objc_alloc((Class)MKMapItem) initWithPlacemark:v4];
  [(MapsAppTestLookAround *)self runNavTestWithMapItem:v5 showsFullScreen:0];
}

- (void)runFullScreenNavTestWithMapItem:(id)a3
{
  id v4 = a3;
  id v5 = sub_1005764AC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[self startedTest]", buf, 2u);
  }

  [(MapsAppTest *)self startedTest];
  id v6 = sub_1005764AC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[self startedSubTest:@\"navLookAround\"]", buf, 2u);
  }

  BOOL v7 = +[VKDebugSettings sharedSettings];
  self->_savedDebugDrawContinuously = [v7 layoutContinuously];

  BOOL v8 = +[VKDebugSettings sharedSettings];
  [v8 setLayoutContinuously:1];

  [(MapsAppTest *)self startedSubTest:@"navFullScreenLookAroundEnter"];
  id v9 = +[MKLookAroundEntryPoint entryPointWithMapItem:v4];

  id v10 = [(MapsAppTest *)self testCoordinator];
  [v10 pptTestEnterLookAroundWithEntryPoint:v9 lookAroundView:0 showsFullScreen:1];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100564E94;
  v11[3] = &unk_1012E6668;
  void v11[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"PPTLookAroundContainerViewControllerDidTransitionToFullscreen" object:0 usingBlock:v11];
}

- (void)runNavTestWithMapItem:(id)a3 showsFullScreen:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = sub_1005764AC();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[self startedTest]", buf, 2u);
  }

  [(MapsAppTest *)self startedTest];
  BOOL v8 = sub_1005764AC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[self startedSubTest:@\"navLookAround\"]", buf, 2u);
  }

  id v9 = +[VKDebugSettings sharedSettings];
  self->_savedDebugDrawContinuously = [v9 layoutContinuously];

  id v10 = +[VKDebugSettings sharedSettings];
  [v10 setLayoutContinuously:1];

  [(MapsAppTest *)self startedSubTest:@"navLookAroundEnter"];
  id v11 = +[MKLookAroundEntryPoint entryPointWithMapItem:v6];
  id v12 = [(MapsAppTest *)self testCoordinator];
  [v12 pptTestEnterLookAroundWithEntryPoint:v11 lookAroundView:0 showsFullScreen:v4];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10056531C;
  v14[3] = &unk_1012EF008;
  v14[4] = self;
  id v15 = v6;
  id v13 = v6;
  +[PPTNotificationCenter addOnceObserverForName:@"LookAroundTrayContaineeViewControllerDidAppear" object:0 usingBlock:v14];
}

- (void)panLookAroundView:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(MapsAppTest *)self options];
  [v7 setPresentationYaw:1 animated:[v8 _maptest_lookAroundNavigationAmountToTurnInDegrees]];

  dispatch_time_t v9 = dispatch_time(0, 3000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100565A18;
  block[3] = &unk_1012E6EA8;
  id v12 = v6;
  id v10 = v6;
  dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)tap:(CGPoint)a3 countdown:(int)a4 mapView:(id)a5 totalTimeInMS:(double)a6 firstTap:(BOOL)a7
{
  BOOL v7 = a7;
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v13 = a5;
  uint64_t v14 = +[NSDate date];
  id v15 = (void *)v14;
  if (a4 <= 0)
  {
    v42 = (void *)v14;
    id v19 = sub_1005764AC();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[self finishedSubTest:@\"navLookAround\"]", buf, 2u);
    }

    id v20 = [(MapsAppTest *)self options];
    int v21 = [v20 _maptest_lookAroundNavigationTaps];

    if (v21 >= 1) {
      int v22 = v21;
    }
    else {
      int v22 = 5;
    }
    int v41 = v22;
    savedDebugDrawContinuouslCGFloat y = self->_savedDebugDrawContinuously;
    double v24 = +[VKDebugSettings sharedSettings];
    [v24 setLayoutContinuously:savedDebugDrawContinuously];

    __int16 v25 = [(MapsAppTest *)self mainMKMapView];
    double v26 = [v25 _mapLayer];
    [v26 setHidden:0];

    [(MapsAppTest *)self finishedSubTest:@"navLookAround"];
    [v13 disableTestStatistics];
    v43 = v13;
    v18 = [v13 testStatistics];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v27 = [v18 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v53;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v53 != v29) {
            objc_enumerationMutation(v18);
          }
          uint64_t v31 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          v32 = [v18 objectForKey:v31];
          v33 = [(MapsAppTest *)self results];
          v34 = +[NSString stringWithFormat:@"sub:loadingScene:%@", v31];
          [v33 setObject:v32 forKey:v34];
        }
        id v28 = [v18 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v28);
    }
    v35 = +[NSNumber numberWithDouble:a6 / (double)v41];
    v36 = [(MapsAppTest *)self results];
    v37 = +[NSString stringWithFormat:@"sub:navLookAround:average animation time"];
    [v36 setObject:v35 forKey:v37];

    id v13 = v43;
    [v43 resetTestStatistics];
    v38 = [v43 tileStatistics];
    if (v38)
    {
      v39 = [(MapsAppTest *)self results];
      [v39 addEntriesFromDictionary:v38];
    }
    v40 = sub_1005764AC();
    id v15 = v42;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEBUG, "[self finishedTest]", buf, 2u);
    }

    [(MapsAppTest *)self finishedTest];
  }
  else
  {
    if (v7) {
      int64_t v16 = 0;
    }
    else {
      int64_t v16 = 3500000000;
    }
    dispatch_time_t v17 = dispatch_time(0, v16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100565E58;
    block[3] = &unk_1012EF170;
    id v45 = v13;
    CGFloat v48 = x;
    CGFloat v49 = y;
    id v46 = v15;
    v47 = self;
    int v51 = a4;
    double v50 = a6;
    dispatch_after(v17, (dispatch_queue_t)&_dispatch_main_q, block);

    v18 = v45;
  }
}

- (void)runZoomTest
{
  id v3 = sub_1005764AC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[self startedTest]", buf, 2u);
  }

  [(MapsAppTest *)self startedTest];
  BOOL v4 = +[VKDebugSettings sharedSettings];
  self->_savedDebugDrawContinuouslCGFloat y = [v4 layoutContinuously];

  id v5 = +[VKDebugSettings sharedSettings];
  [v5 setLayoutContinuously:1];

  id v6 = sub_1005764AC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[self startedSubTest:@\"zoomLookAroundEnter\"]", buf, 2u);
  }

  [(MapsAppTest *)self startedSubTest:@"zoomLookAroundEnter"];
  BOOL v7 = [(MapsAppTest *)self mainMKMapView];
  id v8 = objc_alloc((Class)MKPlacemark);
  [v7 centerCoordinate];
  id v9 = [v8 initWithCoordinate:];
  id v10 = [objc_alloc((Class)MKMapItem) initWithPlacemark:v9];
  id v11 = +[MKLookAroundEntryPoint entryPointWithMapItem:v10];
  id v12 = [(MapsAppTest *)self testCoordinator];
  [v12 pptTestEnterLookAroundWithEntryPoint:v11 lookAroundView:0 showsFullScreen:1];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1005661C0;
  v13[3] = &unk_1012E6668;
  v13[4] = self;
  +[PPTNotificationCenter addOnceObserverForName:@"LookAroundTrayContaineeViewControllerDidAppear" object:0 usingBlock:v13];
}

- (void)zoom:(CGPoint)a3 countdown:(int)a4 oldFactor:(double)a5 mapView:(id)a6
{
  double y = a3.y;
  double x = a3.x;
  id v11 = a6;
  id v12 = v11;
  if (a4 <= 0)
  {
    dispatch_time_t v16 = dispatch_time(0, 50000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100566620;
    block[3] = &unk_1012EAA08;
    double v27 = x;
    double v28 = y;
    __int16 v25 = v12;
    double v26 = self;
    id v17 = v12;
    dispatch_after(v16, (dispatch_queue_t)&_dispatch_main_q, block);
    id v15 = v25;
  }
  else
  {
    [v11 updatePinchWithFocusPoint:x oldFactor:y newFactor:a5 + 0.1];
    dispatch_time_t v13 = dispatch_time(0, 50000000);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1005668B4;
    v18[3] = &unk_1012EF1C0;
    double v20 = x;
    double v21 = y;
    int v23 = a4;
    double v22 = a5 + 0.1;
    v18[4] = self;
    id v19 = v12;
    id v14 = v12;
    dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v18);
    id v15 = v19;
  }
}

- (BOOL)savedDebugDrawContinuously
{
  return self->_savedDebugDrawContinuously;
}

- (void)setSavedDebugDrawContinuously:(BOOL)a3
{
  self->_savedDebugDrawContinuousldouble y = a3;
}

@end