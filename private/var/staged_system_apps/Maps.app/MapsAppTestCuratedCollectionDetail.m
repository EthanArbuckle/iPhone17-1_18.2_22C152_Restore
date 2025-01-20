@interface MapsAppTestCuratedCollectionDetail
- (BOOL)runTest;
- (NSMutableSet)updatedDataFetchers;
- (unint64_t)numberOfDataFetchers;
- (void)_dispatchAfterShortDelay:(id)a3;
- (void)_enterSearchModeAndPerformCuratedCollectionDetailsScrollTest;
- (void)_performScrollTestOfScrollView:(id)a3 completion:(id)a4;
- (void)_scrollCuratedCollection;
- (void)_selectAndScrollCuratedCollection;
- (void)_selectAndScrollCuratedCollectionDetail;
- (void)_startTestAndPerformScrollTest;
- (void)didUpdateDataFetcher:(id)a3;
- (void)setNumberOfDataFetchers:(unint64_t)a3;
- (void)setUpdatedDataFetchers:(id)a3;
@end

@implementation MapsAppTestCuratedCollectionDetail

- (BOOL)runTest
{
  v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  updatedDataFetchers = self->_updatedDataFetchers;
  self->_updatedDataFetchers = v3;

  v5 = [(MapsAppTest *)self options];
  unsigned int v6 = [v5 _mapstest_isUsingSampleProactiveData];

  if (v6)
  {
    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100CA67C0;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(MapsAppTestCuratedCollectionDetail *)self _startTestAndPerformScrollTest];
  }
  return 1;
}

- (void)_startTestAndPerformScrollTest
{
  [(MapsAppTest *)self startedTest];

  [(MapsAppTestCuratedCollectionDetail *)self _enterSearchModeAndPerformCuratedCollectionDetailsScrollTest];
}

- (void)_enterSearchModeAndPerformCuratedCollectionDetailsScrollTest
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestResetForLaunchURL];

  v4 = [(MapsAppTest *)self options];
  id v5 = [v4 _mapstest_mapType];

  unsigned int v6 = [(MapsAppTest *)self options];
  dispatch_time_t v7 = [v6 _mapstest_mapRegion];

  [(MapsAppTest *)self switchToMapType:v5];
  v8 = [(MapsAppTest *)self mainVKMapView];
  [v8 setMapRegion:v7 pitch:0.0 yaw:0.0];

  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100CA694C;
  v9[3] = &unk_1012E6708;
  objc_copyWeak(&v10, &location);
  [(MapsAppTest *)self addFullyDrawnCallback:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)didUpdateDataFetcher:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsAppTestCuratedCollectionDetail *)self updatedDataFetchers];
  unsigned int v6 = [v4 object];

  [v5 addObject:v6];
  dispatch_time_t v7 = [(MapsAppTestCuratedCollectionDetail *)self updatedDataFetchers];
  id v8 = [v7 count];
  unint64_t v9 = [(MapsAppTestCuratedCollectionDetail *)self numberOfDataFetchers];

  if (v8 == (id)v9)
  {
    [(MapsAppTest *)self finishedSubTest:@"collectData"];
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 removeObserver:self name:@"PPTTest_SearchHome_DidUpdateDataFetcher" object:0];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100CA6C30;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_selectAndScrollCuratedCollectionDetail
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100CA6CA4;
  v2[3] = &unk_1012E5D08;
  v2[4] = self;
  [(MapsAppTestCuratedCollectionDetail *)self _dispatchAfterShortDelay:v2];
}

- (void)_selectAndScrollCuratedCollection
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptSelectFirstCuratedGuide];

  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100CA6D94;
  v4[3] = &unk_1012E6730;
  objc_copyWeak(&v5, &location);
  +[PPTNotificationCenter addOnceObserverForName:@"PPTTest_CuratedCollectionView_DidDisplayCollection" object:0 usingBlock:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_scrollCuratedCollection
{
  v3 = [(MapsAppTest *)self testCoordinator];
  id v4 = [v3 pptTestScrollView];

  id v5 = [(MapsAppTest *)self testName];
  unsigned int v6 = [v5 stringByAppendingString:@" - scroll"];

  [(MapsAppTest *)self startedSubTest:v6];
  objc_initWeak(&location, self);
  RPTContentSizeInDirection();
  double v8 = v7;
  RPTGetBoundsForView();
  id v13 = [objc_alloc((Class)RPTScrollViewTestParameters) initWithTestName:v6 scrollBounds:1 scrollContentLength:&stru_1013207E0 direction:v9 completionHandler:v10, v11, v12, v8];
  [v13 setPreventSheetDismissal:1];
  id v25 = v13;
  v14 = +[NSArray arrayWithObjects:&v25 count:1];
  v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_100CA70BC;
  v20 = &unk_1012E9340;
  objc_copyWeak(&v23, &location);
  v21 = self;
  id v15 = v6;
  id v22 = v15;
  id v16 = +[RPTGroupScrollTestParameters newWithTestName:v15 parameters:v14 completionHandler:&v17];

  +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v16, v17, v18, v19, v20, v21);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

- (void)_dispatchAfterShortDelay:(id)a3
{
  id v3 = a3;
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100CA71C8;
  block[3] = &unk_1012E6EA8;
  id v7 = v3;
  id v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_performScrollTestOfScrollView:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)UIScrollTestParameters);
  [v7 setIterations:1];
  [v7 setDelta:40.0];
  [v7 setLength:UIScrollTestParametersLengthAutomatic];
  [v7 setAxis:2];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100CA72E0;
  v9[3] = &unk_101312CE8;
  id v10 = v5;
  id v8 = v5;
  [v6 _performScrollTestWithParameters:v7 completionBlock:v9];
}

- (NSMutableSet)updatedDataFetchers
{
  return self->_updatedDataFetchers;
}

- (void)setUpdatedDataFetchers:(id)a3
{
}

- (unint64_t)numberOfDataFetchers
{
  return self->_numberOfDataFetchers;
}

- (void)setNumberOfDataFetchers:(unint64_t)a3
{
  self->_numberOfDataFetchers = a3;
}

- (void).cxx_destruct
{
}

@end