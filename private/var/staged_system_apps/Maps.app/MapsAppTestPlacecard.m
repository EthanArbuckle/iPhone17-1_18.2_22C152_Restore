@interface MapsAppTestPlacecard
- (BOOL)runTest;
- (void)_maxiumizePlaceCard;
- (void)_mediumizePlaceCard;
- (void)_mediumizePlaceCardFromBig;
- (void)_minimizePlaceCard;
- (void)_performNextTestAfterShowingPlacecard;
- (void)_placeCardDidUpdatePosition:(id)a3;
- (void)_repositionTestDidFinish;
- (void)_repositionTestWillStart;
- (void)_runScrollTest;
- (void)_scrollTest:(id)a3;
- (void)_searchResultDidShow:(id)a3;
- (void)_showCallout:(id)a3;
- (void)_showPlaceCard:(id)a3;
- (void)cleanup:(BOOL)a3;
- (void)finishedSubTest:(id)a3 checkAllFinished:(BOOL)a4;
- (void)searchSessionDidChangeSearchResults:(id)a3;
- (void)startPlacecardTest;
- (void)startedSubTest:(id)a3;
@end

@implementation MapsAppTestPlacecard

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self testName];
  self->_BOOL isScrollTest = [v3 containsString:@"Scroll_"];

  v4 = [(MapsAppTest *)self testName];
  if ([v4 hasPrefix:@"placecardThruCallout"]) {
    goto LABEL_4;
  }
  v5 = [(MapsAppTest *)self testName];
  if ([v5 hasPrefix:@"placecardThruSearchResultsList"])
  {

LABEL_4:
LABEL_5:
    [(MapsAppTest *)self setupForVKTest];
    v6 = [(MapsAppTest *)self options];
    [v6 _mapstest_jumpPoint];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;

    v13 = [(MapsAppTest *)self options];
    [v13 _mapstest_pitch];
    double v15 = v14;

    v16 = [(MapsAppTest *)self options];
    [v16 _mapstest_yaw];
    double v18 = v17;

    v19 = [(MapsAppTest *)self options];
    id v20 = [v19 _mapstest_mapType];

    [(MapsAppTest *)self switchToMapType:v20];
    v21 = [(MapsAppTest *)self mainVKMapView];
    [v21 _mapstest_jumpToCoords:1 pitch:v8 yaw:v10 altitudeIsRegionSize:v15 v18];

    objc_initWeak(&location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1007B98A0;
    v24[3] = &unk_1012E6708;
    objc_copyWeak(&v25, &location);
    [(MapsAppTest *)self addFullyDrawnCallback:v24];
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    return 1;
  }
  BOOL isScrollTest = self->_isScrollTest;

  if (isScrollTest) {
    goto LABEL_5;
  }
  return 0;
}

- (void)cleanup:(BOOL)a3
{
  BOOL v3 = a3;
  [(MapsAppTest *)self dismissTrayWithAssertTrayType:1 completion:0];
  v5.receiver = self;
  v5.super_class = (Class)MapsAppTestPlacecard;
  [(MapsAppTest *)&v5 cleanup:v3];
}

- (void)startPlacecardTest
{
  self->_waitingTests = 0;
  BOOL v3 = [(MapsAppTest *)self testName];
  self->_thruSearchResultsList = [v3 hasPrefix:@"placecardThruSearchResultsList"];

  searchInfo = self->_searchInfo;
  self->_searchInfo = 0;

  id v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"_showCallout:" name:MKBalloonCalloutDidShowNotification object:0];
  [v10 addObserver:self selector:"_showPlaceCard:" name:MKPlaceViewControllerDidShowNotification object:0];
  [v10 addObserver:self selector:"_searchResultDidShow:" name:@"MapsPinsDroppedForSearchResultsNotification" object:0];
  objc_super v5 = [(MapsAppTest *)self options];
  v6 = [v5 objectForKeyedSubscript:@"searchString"];

  [(MapsAppTest *)self startedTest];
  double v7 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v7 setSearchString:v6];
  double v8 = [(MapsAppTest *)self testCoordinator];
  [v8 pptTestSearchForFieldItem:v7];

  double v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"searchSessionDidChangeSearchResults:" name:@"SearchSessionDidChangeSearchResultsNotification" object:0];

  [(MapsAppTestPlacecard *)self startedSubTest:@"searchResultReceived"];
}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"SearchSessionDidChangeSearchResultsNotification" object:0];

  id v12 = [v4 object];

  if (!v12)
  {
    [(MapsAppTest *)self failedTest];
    goto LABEL_9;
  }
  v6 = [v12 searchInfo];
  searchInfo = self->_searchInfo;
  self->_searchInfo = v6;

  [(MapsAppTestPlacecard *)self finishedSubTest:@"searchResultReceived" checkAllFinished:0];
  double v8 = [v12 searchInfo];
  double v9 = [v8 results];
  id v10 = [v9 count];

  if ((unint64_t)v10 >= 2)
  {
    CFStringRef v11 = @"showSearchResults";
LABEL_7:
    [(MapsAppTestPlacecard *)self startedSubTest:v11];
    goto LABEL_9;
  }
  if (v10 == (id)1)
  {
    [(MapsAppTestPlacecard *)self startedSubTest:@"showCallout"];
    CFStringRef v11 = @"showPlaceCard";
    goto LABEL_7;
  }
  [(MapsAppTest *)self finishedTest];
LABEL_9:
}

- (void)_searchResultDidShow:(id)a3
{
  [(MapsAppTestPlacecard *)self finishedSubTest:@"showSearchResults" checkAllFinished:0];
  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:@"MapsPinsDroppedForSearchResultsNotification" object:0];
  id v4 = [(SearchInfo *)self->_searchInfo results];
  objc_super v5 = [v4 firstObject];

  if (v5)
  {
    [v7 addObserver:self selector:"_showPlaceCard:" name:MKPlaceViewControllerDidShowNotification object:0];
    [(MapsAppTestPlacecard *)self startedSubTest:@"showPlaceCard"];
    v6 = [(MapsAppTest *)self testCoordinator];
    [v6 pptTestPresentPlaceCardForSearchResult:v5 animated:!self->_isScrollTest];
  }
  else
  {
    [(MapsAppTest *)self failedTest];
  }
}

- (void)_showCallout:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:MKBalloonCalloutDidShowNotification object:0];
  [(MapsAppTestPlacecard *)self finishedSubTest:@"showCallout" checkAllFinished:0];
  [(MapsAppTestPlacecard *)self _performNextTestAfterShowingPlacecard];
}

- (void)_showPlaceCard:(id)a3
{
  id v4 = a3;
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:MKPlaceViewControllerDidShowNotification object:0];
  [(MapsAppTestPlacecard *)self finishedSubTest:@"showPlaceCard" checkAllFinished:0];
  objc_super v5 = [v4 object];

  objc_storeWeak((id *)&self->_placeViewController, v5);
  [(MapsAppTestPlacecard *)self _performNextTestAfterShowingPlacecard];
}

- (void)_performNextTestAfterShowingPlacecard
{
  BOOL v3 = [(MapsAppTest *)self testCoordinator];
  self->_canResizePlacecard = [v3 pptTestCanResizePlacecard];

  if (self->_canResizePlacecard)
  {
    [(MapsAppTestPlacecard *)self _repositionTestWillStart];
  }
  else
  {
    [(MapsAppTestPlacecard *)self _runScrollTest];
  }
}

- (void)_repositionTestWillStart
{
  if (!self->_waitingTests)
  {
    objc_initWeak(&location, self);
    BOOL v3 = +[NSNotificationCenter defaultCenter];
    id v4 = +[NSOperationQueue mainQueue];
    id v7 = _NSConcreteStackBlock;
    uint64_t v8 = 3221225472;
    double v9 = sub_1007BA084;
    id v10 = &unk_1012E6730;
    objc_copyWeak(&v11, &location);
    objc_super v5 = [v3 addObserverForName:@"PPTTestTrayLayoutDidUpdateNotification" object:0 queue:v4 usingBlock:&v7];
    id notifcationToken = self->_notifcationToken;
    self->_id notifcationToken = v5;

    [(MapsAppTestPlacecard *)self startedSubTest:@"PlaceCardReposition", v7, v8, v9, v10];
    [(MapsAppTestPlacecard *)self _minimizePlaceCard];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_minimizePlaceCard
{
  [(MapsAppTestPlacecard *)self startedSubTest:@"PlaceCardReposition medium to small"];
  id v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestMinimizePlaceCardAnimated:1];
}

- (void)_mediumizePlaceCard
{
  if (self->_notifcationToken)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_notifcationToken];
  }
  objc_initWeak(&location, self);
  id v4 = +[NSNotificationCenter defaultCenter];
  objc_super v5 = +[NSOperationQueue mainQueue];
  double v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_1007BA2D4;
  id v12 = &unk_1012E6730;
  objc_copyWeak(&v13, &location);
  id v6 = [v4 addObserverForName:@"PPTTestTrayLayoutDidUpdateNotification" object:0 queue:v5 usingBlock:&v9];
  id notifcationToken = self->_notifcationToken;
  self->_id notifcationToken = v6;

  [(MapsAppTestPlacecard *)self startedSubTest:@"PlaceCardReposition small to medium", v9, v10, v11, v12];
  uint64_t v8 = [(MapsAppTest *)self testCoordinator];
  [v8 pptTestMediumizePlaceCardAnimated:1];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_maxiumizePlaceCard
{
  if (self->_notifcationToken)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_notifcationToken];
  }
  objc_initWeak(&location, self);
  id v4 = +[NSNotificationCenter defaultCenter];
  objc_super v5 = +[NSOperationQueue mainQueue];
  double v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_1007BA4C4;
  id v12 = &unk_1012E6730;
  objc_copyWeak(&v13, &location);
  id v6 = [v4 addObserverForName:@"PPTTestTrayLayoutDidUpdateNotification" object:0 queue:v5 usingBlock:&v9];
  id notifcationToken = self->_notifcationToken;
  self->_id notifcationToken = v6;

  [(MapsAppTestPlacecard *)self startedSubTest:@"PlaceCardReposition medium to big", v9, v10, v11, v12];
  uint64_t v8 = [(MapsAppTest *)self testCoordinator];
  [v8 pptTestMaximizePlaceCardAnimated:1];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_mediumizePlaceCardFromBig
{
  if (self->_notifcationToken)
  {
    id v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_notifcationToken];
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_placeCardDidUpdatePosition:" name:@"PPTTestTrayLayoutDidUpdateNotification" object:0];

  [(MapsAppTestPlacecard *)self startedSubTest:@"PlaceCardReposition big to medium"];
  id v5 = [(MapsAppTest *)self testCoordinator];
  [v5 pptTestMediumizePlaceCardAnimated:1];
}

- (void)_placeCardDidUpdatePosition:(id)a3
{
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"PPTTestTrayLayoutDidUpdateNotification" object:0];

  [(MapsAppTestPlacecard *)self finishedSubTest:@"PlaceCardReposition big to medium" checkAllFinished:0];

  [(MapsAppTestPlacecard *)self _repositionTestDidFinish];
}

- (void)_repositionTestDidFinish
{
  [(MapsAppTestPlacecard *)self finishedSubTest:@"PlaceCardReposition" checkAllFinished:!self->_isScrollTest];

  [(MapsAppTestPlacecard *)self _runScrollTest];
}

- (void)_runScrollTest
{
  if (self->_isScrollTest && !self->_waitingTests)
  {
    if (self->_canResizePlacecard)
    {
      id v4 = +[NSNotificationCenter defaultCenter];
      [v4 addObserver:self selector:"_scrollTest:" name:@"PPTTestTrayLayoutDidUpdateNotification" object:0];
      self->_scrollTestState = 0;
      [(MapsAppTestPlacecard *)self startedSubTest:@"expand"];
      id v3 = [(MapsAppTest *)self testCoordinator];
      [v3 pptTestMaximizePlaceCardAnimated:1];
    }
    else
    {
      self->_scrollTestState = 0;
      [(MapsAppTestPlacecard *)self _scrollTest:0];
    }
  }
}

- (void)_scrollTest:(id)a3
{
  id v4 = a3;
  unint64_t scrollTestState = self->_scrollTestState;
  switch(scrollTestState)
  {
    case 2uLL:
      id v20 = v4;
      double v15 = +[NSNotificationCenter defaultCenter];
      v16 = [v20 object];
      [v15 removeObserver:self name:@"ScrollingFinishedNotification" object:v16];
      double v17 = [(ScrollViewDelegateForwarder *)self->_scrollViewDelegate originalDelegate];
      [v16 setDelegate:v17];

      scrollViewDelegate = self->_scrollViewDelegate;
      self->_scrollViewDelegate = 0;

      [(MapsAppTestPlacecard *)self finishedSubTest:@"scrolling" checkAllFinished:1];
      id v4 = v20;
      goto LABEL_11;
    case 1uLL:
      id v19 = v4;
      id v6 = [v4 object];
      [v6 setContentOffset:CGPointZero animated:1];
LABEL_9:

      unint64_t scrollTestState = self->_scrollTestState;
      id v4 = v19;
      break;
    case 0uLL:
      id v19 = v4;
      if (self->_canResizePlacecard) {
        [(MapsAppTestPlacecard *)self finishedSubTest:@"expand" checkAllFinished:0];
      }
      id v6 = +[NSNotificationCenter defaultCenter];
      [v6 removeObserver:self name:@"PPTTestTrayLayoutDidUpdateNotification" object:0];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_placeViewController);
      uint64_t v8 = [WeakRetained view];
      objc_opt_class();
      double v9 = sub_1007B8E1C(v8);

      [v6 addObserver:self selector:"_scrollTest:" name:@"ScrollingFinishedNotification" object:v9];
      uint64_t v10 = objc_alloc_init(ScrollViewDelegateForwarder);
      id v11 = self->_scrollViewDelegate;
      self->_scrollViewDelegate = v10;

      id v12 = [v9 delegate];
      [(ScrollViewDelegateForwarder *)self->_scrollViewDelegate setOriginalDelegate:v12];

      [v9 setDelegate:self->_scrollViewDelegate];
      [(MapsAppTestPlacecard *)self startedSubTest:@"scrolling"];
      [v9 contentSize];
      double v14 = v13;
      [v9 frame];
      [v9 setContentOffset:CGPointZero.x, v14 - CGRectGetHeight(v22)];

      goto LABEL_9;
  }
  self->_unint64_t scrollTestState = scrollTestState + 1;
LABEL_11:
}

- (void)startedSubTest:(id)a3
{
  ++self->_waitingTests;
  v3.receiver = self;
  v3.super_class = (Class)MapsAppTestPlacecard;
  [(MapsAppTest *)&v3 startedSubTest:a3];
}

- (void)finishedSubTest:(id)a3 checkAllFinished:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)MapsAppTestPlacecard;
  [(MapsAppTest *)&v7 finishedSubTest:a3];
  unint64_t v6 = self->_waitingTests - 1;
  self->_waitingTests = v6;
  if (v4 && !v6) {
    [(MapsAppTest *)self finishedTest];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notifcationToken, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_scrollViewDelegate, 0);

  objc_destroyWeak((id *)&self->_placeViewController);
}

@end