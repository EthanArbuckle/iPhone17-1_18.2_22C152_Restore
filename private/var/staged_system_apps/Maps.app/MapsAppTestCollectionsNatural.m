@interface MapsAppTestCollectionsNatural
- (BOOL)runTest;
- (void)_dismissCollection;
- (void)_dispatchAfterShortDelay:(id)a3;
- (void)_expandCollection;
- (void)_expandCollectionsList;
- (void)_openFirstCollection;
- (void)_performScrollTestOfScrollView:(id)a3 completion:(id)a4;
- (void)_setupTrayLayoutAndPerformScrollTest;
@end

@implementation MapsAppTestCollectionsNatural

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self options];
  unsigned int v4 = [v3 _mapstest_isUsingSampleProactiveData];

  if (v4)
  {
    dispatch_time_t v5 = dispatch_time(0, 6000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100825C90;
    block[3] = &unk_1012E5D08;
    block[4] = self;
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(MapsAppTestCollectionsNatural *)self _setupTrayLayoutAndPerformScrollTest];
  }
  return 1;
}

- (void)_setupTrayLayoutAndPerformScrollTest
{
  if ([(MapsAppTest *)self canUpdateTrayLayout])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100825D48;
    v3[3] = &unk_1012E5D08;
    v3[4] = self;
    [(MapsAppTest *)self updateTrayLayout:2 animated:1 completion:v3];
  }
  else
  {
    [(MapsAppTestCollectionsNatural *)self _expandCollectionsList];
  }
}

- (void)_expandCollectionsList
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestOpenCollections];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100825DE0;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [(MapsAppTestCollectionsNatural *)self _dispatchAfterShortDelay:v4];
}

- (void)_openFirstCollection
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestOpenFirstCollection];

  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100825E8C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_expandCollection
{
  if ([(MapsAppTest *)self canUpdateTrayLayout])
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100825F78;
    v4[3] = &unk_1012E5D08;
    v4[4] = self;
    [(MapsAppTest *)self updateTrayLayout:2 animated:1 completion:v4];
  }
  else
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100825FF0;
    v3[3] = &unk_1012E5D08;
    v3[4] = self;
    [(MapsAppTestCollectionsNatural *)self _dispatchAfterShortDelay:v3];
  }
}

- (void)_dismissCollection
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestDismissTrayAnimated:1 assertTrayType:0];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100826090;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [(MapsAppTestCollectionsNatural *)self _dispatchAfterShortDelay:v4];
}

- (void)_dispatchAfterShortDelay:(id)a3
{
  id v3 = a3;
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1008261F4;
  block[3] = &unk_1012E6EA8;
  id v7 = v3;
  id v5 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_performScrollTestOfScrollView:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)RPTScrollViewTestParameters);
  v9 = [(MapsAppTest *)self testName];
  id v10 = [v8 initWithTestName:v9 scrollView:v7 completionHandler:v6];

  [v10 setPreventSheetDismissal:1];
  +[RPTTestRunner runTestWithParameters:v10];
}

@end