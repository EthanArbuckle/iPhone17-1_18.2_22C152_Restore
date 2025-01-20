@interface MapsAppTestCuratedCollectionsList
- (BOOL)runTest;
- (void)_dispatchAfterShortDelay:(id)a3;
- (void)_enterSearchModeAndPerformAllCuratedCollectionsScrollTest;
- (void)_performScrollTestOfScrollView:(id)a3 completion:(id)a4;
- (void)_selectAndScrollAllCuratedCollections;
- (void)_startTestAndPerformScrollTest;
@end

@implementation MapsAppTestCuratedCollectionsList

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self options];
  unsigned int v4 = [v3 _mapstest_isUsingSampleProactiveData];

  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A31548;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(MapsAppTestCuratedCollectionsList *)self _startTestAndPerformScrollTest];
  }
  return 1;
}

- (void)_startTestAndPerformScrollTest
{
  [(MapsAppTest *)self startedTest];

  [(MapsAppTestCuratedCollectionsList *)self _enterSearchModeAndPerformAllCuratedCollectionsScrollTest];
}

- (void)_enterSearchModeAndPerformAllCuratedCollectionsScrollTest
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestEnterSearchMode];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A31618;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [(MapsAppTestCuratedCollectionsList *)self _dispatchAfterShortDelay:v4];
}

- (void)_selectAndScrollAllCuratedCollections
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptSelectSeeAllCuratedCollections];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A316B0;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [(MapsAppTestCuratedCollectionsList *)self _dispatchAfterShortDelay:v4];
}

- (void)_dispatchAfterShortDelay:(id)a3
{
  id v3 = a3;
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A31874;
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
  [v7 setDelta:20.0];
  [v7 setLength:UIScrollTestParametersLengthAutomatic];
  [v7 setAxis:2];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100A31988;
  v9[3] = &unk_101312CE8;
  id v10 = v5;
  id v8 = v5;
  [v6 _performScrollTestWithParameters:v7 completionBlock:v9];
}

@end