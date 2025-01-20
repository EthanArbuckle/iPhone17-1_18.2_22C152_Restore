@interface MapsAppTestGuidesHome
- (BOOL)runTest;
- (MapsAppTestGuidesHome)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
- (NSMutableSet)updatedDataFetchers;
- (SearchHomeDataSource)searchHomeDataSource;
- (unint64_t)numberOfDataFetchers;
- (void)_dispatchAfterShortDelay:(id)a3;
- (void)continueAfterCollectingDataFromDataFetchers;
- (void)didUpdateDataFetcher:(id)a3;
- (void)runScrollTest;
- (void)setNumberOfDataFetchers:(unint64_t)a3;
- (void)setSearchHomeDataSource:(id)a3;
- (void)setUpdatedDataFetchers:(id)a3;
@end

@implementation MapsAppTestGuidesHome

- (MapsAppTestGuidesHome)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MapsAppTestGuidesHome;
  v5 = [(MapsAppTest *)&v9 initWithApplication:a3 testName:a4 options:a5];
  if (v5)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    updatedDataFetchers = v5->_updatedDataFetchers;
    v5->_updatedDataFetchers = v6;
  }
  return v5;
}

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestResetForLaunchURL];

  v4 = [(MapsAppTest *)self options];
  id v5 = [v4 _mapstest_mapType];

  v6 = [(MapsAppTest *)self options];
  v7 = [v6 _mapstest_mapRegion];

  [(MapsAppTest *)self switchToMapType:v5];
  v8 = [(MapsAppTest *)self mainVKMapView];
  [v8 setMapRegion:v7 pitch:0.0 yaw:0.0];

  objc_initWeak(&location, self);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1006D20B8;
  v10[3] = &unk_1012E6708;
  objc_copyWeak(&v11, &location);
  [(MapsAppTest *)self addFullyDrawnCallback:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return 1;
}

- (void)didUpdateDataFetcher:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsAppTestGuidesHome *)self updatedDataFetchers];
  v6 = [v4 object];

  [v5 addObject:v6];
  v7 = [(MapsAppTestGuidesHome *)self updatedDataFetchers];
  id v8 = [v7 count];
  unint64_t v9 = [(MapsAppTestGuidesHome *)self numberOfDataFetchers];

  if (v8 == (id)v9)
  {
    [(MapsAppTest *)self finishedSubTest:@"searchHomeCollectData"];
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 removeObserver:self name:@"PPTTest_SearchHome_DidUpdateDataFetcher" object:0];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1006D23C4;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)continueAfterCollectingDataFromDataFetchers
{
  objc_initWeak(&location, self);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1006D2500;
  v4[3] = &unk_1012E6730;
  objc_copyWeak(&v5, &location);
  +[PPTNotificationCenter addOnceObserverForName:@"PPTTest_GuidesHome_DidDisplaySections" object:0 usingBlock:v4];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1006D25A4;
  v3[3] = &unk_1012E5D08;
  v3[4] = self;
  [(MapsAppTestGuidesHome *)self _dispatchAfterShortDelay:v3];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)runScrollTest
{
  [(MapsAppTest *)self startedSubTest:@"scrollingGuidesHome"];
  objc_initWeak(&location, self);
  v3 = [(MapsAppTest *)self testCoordinator];
  id v4 = [v3 pptTestScrollView];

  RPTContentSizeInDirection();
  double v6 = v5;
  RPTGetBoundsForView();
  id v11 = [objc_alloc((Class)RPTScrollViewTestParameters) initWithTestName:@"scrollingGuidesHome" scrollBounds:1 scrollContentLength:&stru_1012F5428 scrollDirection:v7 completionHandler:v6];
  id v18 = v11;
  v12 = +[NSArray arrayWithObjects:&v18 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1006D2834;
  v14[3] = &unk_1012E6690;
  objc_copyWeak(&v16, &location);
  v15 = @"scrollingGuidesHome";
  id v13 = +[RPTGroupScrollTestParameters newWithTestName:@"scrollingGuidesHome" parameters:v12 completionHandler:v14];

  +[RPTTestRunner runTestWithParameters:v13];
  objc_destroyWeak(&v16);

  objc_destroyWeak(&location);
}

- (void)_dispatchAfterShortDelay:(id)a3
{
  id v3 = a3;
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006D2940;
  block[3] = &unk_1012E6EA8;
  id v7 = v3;
  id v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
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

- (SearchHomeDataSource)searchHomeDataSource
{
  return self->_searchHomeDataSource;
}

- (void)setSearchHomeDataSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchHomeDataSource, 0);

  objc_storeStrong((id *)&self->_updatedDataFetchers, 0);
}

@end