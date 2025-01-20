@interface MapsAppTestCuratedCollectionsPublisher
- (BOOL)runTest;
- (void)_dispatchAfterShortDelay:(id)a3;
- (void)_enterSearchModeAndPerformPublisherScrollTest;
- (void)_performScrollTestOfScrollView:(id)a3 completion:(id)a4;
- (void)_selectAndScrollPublisherCollections;
- (void)_startTestAndPerformScrollTest;
@end

@implementation MapsAppTestCuratedCollectionsPublisher

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self options];
  unsigned int v4 = [v3 _mapstest_isUsingSampleProactiveData];

  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10071A4F8;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(MapsAppTestCuratedCollectionsPublisher *)self _startTestAndPerformScrollTest];
  }
  return 1;
}

- (void)_startTestAndPerformScrollTest
{
  [(MapsAppTest *)self startedTest];

  [(MapsAppTestCuratedCollectionsPublisher *)self _enterSearchModeAndPerformPublisherScrollTest];
}

- (void)_enterSearchModeAndPerformPublisherScrollTest
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestEnterSearchMode];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10071A5C8;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [(MapsAppTestCuratedCollectionsPublisher *)self _dispatchAfterShortDelay:v4];
}

- (void)_selectAndScrollPublisherCollections
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptSelectFirstGuidePublisher];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10071A660;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [(MapsAppTestCuratedCollectionsPublisher *)self _dispatchAfterShortDelay:v4];
}

- (void)_dispatchAfterShortDelay:(id)a3
{
  id v3 = a3;
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10071A7C4;
  block[3] = &unk_1012E6EA8;
  id v7 = v3;
  id v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_performScrollTestOfScrollView:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(MapsAppTest *)self testName];
  v9 = [v8 stringByAppendingString:@" - scroll"];

  [(MapsAppTest *)self startedSubTest:v9];
  objc_initWeak(&location, self);
  RPTContentSizeInDirection();
  double v11 = v10;
  RPTGetBoundsForView();
  id v16 = [objc_alloc((Class)RPTScrollViewTestParameters) initWithTestName:v9 scrollBounds:1 scrollContentLength:&stru_1012F6830 direction:v12 completionHandler:v13 v14 v15 v11];
  [v16 setPreventSheetDismissal:1];
  id v26 = v16;
  v17 = +[NSArray arrayWithObjects:&v26 count:1];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10071AA60;
  v21[3] = &unk_1012EC980;
  objc_copyWeak(&v24, &location);
  v21[4] = self;
  id v18 = v9;
  id v22 = v18;
  id v19 = v7;
  id v23 = v19;
  id v20 = +[RPTGroupScrollTestParameters newWithTestName:v18 parameters:v17 completionHandler:v21];

  +[RPTTestRunner runTestWithParameters:v20];
  objc_destroyWeak(&v24);

  objc_destroyWeak(&location);
}

@end