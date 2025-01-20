@interface MapsAppTestScrollSearch
- (BOOL)runTest;
- (void)_scrollingTest;
- (void)addFullyDrawnCallback:(id)a3;
- (void)cleanup:(BOOL)a3;
- (void)searchForSearchString;
- (void)searchResultsDidAppear;
@end

@implementation MapsAppTestScrollSearch

- (BOOL)runTest
{
  [(MapsAppTest *)self setupForVKTest];
  v3 = [(MapsAppTest *)self options];
  [v3 _mapstest_jumpPoint];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;

  v10 = [(MapsAppTest *)self options];
  [v10 _mapstest_pitch];
  double v12 = v11;

  v13 = [(MapsAppTest *)self options];
  [v13 _mapstest_yaw];
  double v15 = v14;

  v16 = [(MapsAppTest *)self options];
  id v17 = [v16 _mapstest_mapType];

  [(MapsAppTest *)self switchToMapType:v17];
  v18 = [(MapsAppTest *)self mainVKMapView];
  [v18 _mapstest_jumpToCoords:1 pitch:v5 yaw:v7 altitudeIsRegionSize:v9 v12 v15];

  objc_initWeak(&location, self);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1005A4214;
  v20[3] = &unk_1012E6708;
  objc_copyWeak(&v21, &location);
  [(MapsAppTestScrollSearch *)self addFullyDrawnCallback:v20];
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  return 1;
}

- (void)cleanup:(BOOL)a3
{
  BOOL v3 = a3;
  [(MapsAppTest *)self dismissTrayWithAssertTrayType:2 completion:0];
  v5.receiver = self;
  v5.super_class = (Class)MapsAppTestScrollSearch;
  [(MapsAppTest *)&v5 cleanup:v3];
}

- (void)searchForSearchString
{
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_100103D2C;
  v9[4] = sub_100104720;
  id v10 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005A4470;
  v8[3] = &unk_1012E6640;
  v8[4] = self;
  v8[5] = v9;
  +[PPTNotificationCenter addOnceObserverForName:@"SearchSessionDidChangeSearchResultsNotification" object:0 usingBlock:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1005A453C;
  v7[3] = &unk_1012E6640;
  v7[4] = self;
  v7[5] = v9;
  +[PPTNotificationCenter addOnceObserverForName:@"MapsPinsDroppedForSearchResultsNotification" object:0 usingBlock:v7];
  BOOL v3 = [(MapsAppTest *)self options];
  double v4 = [v3 objectForKeyedSubscript:@"searchString"];

  objc_super v5 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v5 setSearchString:v4];

  double v6 = [(MapsAppTest *)self testCoordinator];
  [v6 pptTestSearchForFieldItem:v5];

  _Block_object_dispose(v9, 8);
}

- (void)searchResultsDidAppear
{
  if ([(MapsAppTest *)self canUpdateTrayLayout])
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1005A46EC;
    v3[3] = &unk_1012E5D08;
    v3[4] = self;
    [(MapsAppTest *)self updateTrayLayout:2 animated:1 completion:v3];
  }
  else
  {
    [(MapsAppTestScrollSearch *)self _scrollingTest];
  }
}

- (void)_scrollingTest
{
  BOOL v3 = [(MapsAppTest *)self testCoordinator];
  double v4 = [v3 pptTestScrollView];

  RPTContentSizeInDirection();
  double v6 = v5;
  RPTGetBoundsForView();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  id v15 = objc_alloc((Class)RPTScrollViewTestParameters);
  v16 = [(MapsAppTest *)self testName];
  id v17 = [v15 initWithTestName:v16 scrollBounds:1 scrollContentLength:&stru_1012F0940 scrollDirection:v8 completionHandler:v10];

  v18 = [(MapsAppTest *)self testName];
  id v22 = v17;
  v19 = +[NSArray arrayWithObjects:&v22 count:1];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1005A48C8;
  v21[3] = &unk_1012E5D08;
  v21[4] = self;
  id v20 = +[RPTGroupScrollTestParameters newWithTestName:v18 parameters:v19 completionHandler:v21];

  +[RPTTestRunner runTestWithParameters:v20];
}

- (void)addFullyDrawnCallback:(id)a3
{
  id v4 = a3;
  double v5 = [(MapsAppTest *)self fullyDrawnCallbacks];
  id v6 = [v4 copy];

  id v7 = objc_retainBlock(v6);
  [v5 addObject:v7];

  [(MapsAppTest *)self setupFullyDrawnNotification:"onFullyDrawn:"];
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005A49C4;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);
}

@end