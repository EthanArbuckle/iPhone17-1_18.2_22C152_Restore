@interface MapsAppTestSearchHome
- (BOOL)runTest;
- (MapsAppTestSearchHome)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5;
- (NSMutableSet)updatedDataFetchers;
- (unint64_t)numberOfDataFetchers;
- (void)continueAfterCollectingDataFromDataFetchers;
- (void)didUpdateDataFetcher:(id)a3;
- (void)runScrollTest;
- (void)setNumberOfDataFetchers:(unint64_t)a3;
- (void)setUpdatedDataFetchers:(id)a3;
@end

@implementation MapsAppTestSearchHome

- (MapsAppTestSearchHome)initWithApplication:(id)a3 testName:(id)a4 options:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)MapsAppTestSearchHome;
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
  v10[2] = sub_100BD137C;
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
  id v5 = [(MapsAppTestSearchHome *)self updatedDataFetchers];
  v6 = [v4 object];

  [v5 addObject:v6];
  v7 = [(MapsAppTestSearchHome *)self updatedDataFetchers];
  id v8 = [v7 count];
  unint64_t v9 = [(MapsAppTestSearchHome *)self numberOfDataFetchers];

  if (v8 == (id)v9)
  {
    [(MapsAppTest *)self finishedSubTest:@"collectData"];
    v10 = +[NSNotificationCenter defaultCenter];
    [v10 removeObserver:self name:@"PPTTest_SearchHome_DidUpdateDataFetcher" object:0];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100BD1668;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)continueAfterCollectingDataFromDataFetchers
{
  v3 = [(MapsAppTest *)self options];
  id v4 = [v3 objectForKeyedSubscript:@"testName"];
  unsigned int v5 = [v4 containsString:@"Scroll"];

  if (v5)
  {
    [(MapsAppTestSearchHome *)self runScrollTest];
  }
  else
  {
    [(MapsAppTest *)self finishedTest];
  }
}

- (void)runScrollTest
{
  [(MapsAppTest *)self startedSubTest:@"content scroll"];
  objc_initWeak(&location, self);
  v3 = [(MapsAppTest *)self testCoordinator];
  id v4 = [v3 pptTestScrollView];

  RPTContentSizeInDirection();
  double v6 = v5;
  RPTGetBoundsForView();
  id v11 = [objc_alloc((Class)RPTScrollViewTestParameters) initWithTestName:@"content scroll" scrollBounds:1 scrollContentLength:&stru_10131AC28 direction:v7 completionHandler:v6];
  id v22 = v11;
  v12 = +[NSArray arrayWithObjects:&v22 count:1];
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100BD194C;
  v17 = &unk_1012E9340;
  objc_copyWeak(&v20, &location);
  v18 = self;
  v19 = @"content scroll";
  id v13 = +[RPTGroupScrollTestParameters newWithTestName:@"content scroll" parameters:v12 completionHandler:&v14];

  +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v13, v14, v15, v16, v17);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
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