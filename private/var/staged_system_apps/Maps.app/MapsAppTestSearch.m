@interface MapsAppTestSearch
- (BOOL)runTest;
- (void)_prewarmingKeyboardCompleted;
- (void)_runTestNow;
- (void)_startPrewarmingKeyboard;
- (void)annotationPinDroppedForAResult:(id)a3;
- (void)annotationPinDroppedForResults:(id)a3;
- (void)continueDirectionIntentTest;
- (void)continueToAnnotationsTestsWithSearchSession:(id)a3;
- (void)continueToNearbyScrollTests;
- (void)didDisplayCarplayBrowseCategories;
- (void)didEndGEOPPTTest_PlaceRequestTicket_PlaceDataRequest:(id)a3;
- (void)didEndMSGPPTTest_Insights_ACRanking_Contacts:(id)a3;
- (void)didEndMSGPPTTest_Insights_ACRanking_MapItems:(id)a3;
- (void)didEndMSGPPTTest_Insights_ACRanking_PortraitCall:(id)a3;
- (void)didEndMSGPPTTest_Insights_ACRanking_PreLoad:(id)a3;
- (void)didEndMSGPPTTest_Insights_ACRanking_RoutineCall:(id)a3;
- (void)didEndMSGPPTTest_Insights_ACRanking_Tourist:(id)a3;
- (void)endNearbyTestCategory:(id)a3;
- (void)finishSearchTest:(id)a3;
- (void)finishedSubTest:(id)a3;
- (void)performOnMainQueue:(id)a3;
- (void)refreshSearchAnnotationPinDroppedForResults:(id)a3;
- (void)refreshSearchRequestSent:(id)a3;
- (void)refreshSearchSessionDidChangeSearchResults:(id)a3;
- (void)runScrollBrowseCategoriesInCarPlay;
- (void)searchAutoCompleteTestDidFinish;
- (void)searchAutoCompleteTestReceiveHandlesOrAddresses:(id)a3;
- (void)searchAutoCompleteTestReceiveResponse:(id)a3;
- (void)searchAutoCompleteTestSendQuery;
- (void)searchKeyboardDidHide;
- (void)searchKeyboardDidShow;
- (void)searchKeyboardWillShow;
- (void)searchRequestSent:(id)a3;
- (void)searchSessionDidChangeSearchResults:(id)a3;
- (void)searchUILayoutDone;
- (void)sendSearchRequest;
- (void)startAutocompleteOrNearbySearchTest;
- (void)startNearbyTest;
- (void)startNearbyTestCategory;
- (void)startRefreshSearchTestIfNeeded;
- (void)startScrollNearbyTestCategory;
- (void)startSearchAutoCompleteTest;
- (void)startedSubTest:(id)a3;
- (void)startedSubTest:(id)a3 withMetrics:(id)a4;
- (void)willBeginGEOPPTTest_PlaceRequestTicket_PlaceDataRequest:(id)a3;
- (void)willBeginMSGPPTTest_Insights_ACRanking_Contacts:(id)a3;
- (void)willBeginMSGPPTTest_Insights_ACRanking_MapItems:(id)a3;
- (void)willBeginMSGPPTTest_Insights_ACRanking_PortraitCall:(id)a3;
- (void)willBeginMSGPPTTest_Insights_ACRanking_PreLoad:(id)a3;
- (void)willBeginMSGPPTTest_Insights_ACRanking_RoutineCall:(id)a3;
- (void)willBeginMSGPPTTest_Insights_ACRanking_Tourist:(id)a3;
@end

@implementation MapsAppTestSearch

- (void)willBeginMSGPPTTest_Insights_ACRanking_MapItems:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005A0050;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMSGPPTTest_Insights_ACRanking_MapItems:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005A00DC;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMSGPPTTest_Insights_ACRanking_Contacts:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005A0160;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMSGPPTTest_Insights_ACRanking_Contacts:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005A01EC;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMSGPPTTest_Insights_ACRanking_Tourist:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005A0270;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMSGPPTTest_Insights_ACRanking_Tourist:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005A02FC;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMSGPPTTest_Insights_ACRanking_PortraitCall:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005A0380;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMSGPPTTest_Insights_ACRanking_PortraitCall:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005A040C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMSGPPTTest_Insights_ACRanking_RoutineCall:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005A0490;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMSGPPTTest_Insights_ACRanking_RoutineCall:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005A051C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)willBeginMSGPPTTest_Insights_ACRanking_PreLoad:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005A05A0;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)didEndMSGPPTTest_Insights_ACRanking_PreLoad:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005A062C;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)startedSubTest:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1005A06D0;
  v5[3] = &unk_1012E5D58;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [(MapsAppTestSearch *)self performOnMainQueue:v5];
}

- (void)finishedSubTest:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1005A07A0;
  v5[3] = &unk_1012E5D58;
  id v6 = a3;
  v7 = self;
  id v4 = v6;
  [(MapsAppTestSearch *)self performOnMainQueue:v5];
}

- (void)startedSubTest:(id)a3 withMetrics:(id)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005A089C;
  v8[3] = &unk_1012E66E0;
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  id v6 = v10;
  id v7 = v9;
  [(MapsAppTestSearch *)self performOnMainQueue:v8];
}

- (void)performOnMainQueue:(id)a3
{
  v3 = (void (**)(void))a3;
  if (+[NSThread isMainThread])
  {
    v3[2](v3);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005A0994;
    block[3] = &unk_1012E6EA8;
    v5 = v3;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (BOOL)runTest
{
  v3 = +[UIDevice currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  if (v4 == (id)5)
  {
    [(MapsAppTestSearch *)self _runTestNow];
  }
  else
  {
    if ([(MapsAppTest *)self isRunningOnCarPlay])
    {
      v5 = [(MapsAppTest *)self options];
      id v6 = [v5 objectForKeyedSubscript:@"testName"];
      if (([v6 isEqualToString:@"searchScrollBrowseCategoriesInCarPlay"] & 1) != 0
        || ([v6 isEqualToString:@"searchScrollBrowseCategoryResultsInCarPlay"] & 1) != 0
        || [v6 isEqualToString:@"searchEmbarcadero"])
      {
        [(MapsAppTestSearch *)self runScrollBrowseCategoriesInCarPlay];
      }
    }
    else
    {
      v5 = +[NSNotificationCenter defaultCenter];
      [v5 addObserver:self selector:"searchKeyboardWillShow" name:UIKeyboardWillShowNotification object:0];
      [v5 addObserver:self selector:"searchKeyboardDidShow" name:UIKeyboardDidShowNotification object:0];
      [v5 addObserver:self selector:"searchKeyboardDidHide" name:UIKeyboardDidHideNotification object:0];
      [(MapsAppTestSearch *)self _startPrewarmingKeyboard];
    }
  }
  return 1;
}

- (void)runScrollBrowseCategoriesInCarPlay
{
  [(MapsAppTest *)self startedTest];
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1005A0BC8;
  v3[3] = &unk_1012E6708;
  objc_copyWeak(&v4, &location);
  [(MapsAppTest *)self addFullyDrawnCallback:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)_runTestNow
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"willBeginMSGPPTTest_Insights_ACRanking_PortraitCall:" name:@"MSGPPTTest_Insights_ACRanking_PortraitCallBEGIN" object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"didEndMSGPPTTest_Insights_ACRanking_PortraitCall:" name:@"MSGPPTTest_Insights_ACRanking_PortraitCallEND" object:0];

  v5 = +[GEONotificationPreferenceManager sharedManager];
  [v5 setEnabled:1 forSubTestWithName:@"MSGPPTTest_Insights_ACRanking_PortraitCall"];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"willBeginMSGPPTTest_Insights_ACRanking_RoutineCall:" name:@"MSGPPTTest_Insights_ACRanking_RoutineCallBEGIN" object:0];

  id v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"didEndMSGPPTTest_Insights_ACRanking_RoutineCall:" name:@"MSGPPTTest_Insights_ACRanking_RoutineCallEND" object:0];

  v8 = +[GEONotificationPreferenceManager sharedManager];
  [v8 setEnabled:1 forSubTestWithName:@"MSGPPTTest_Insights_ACRanking_RoutineCall"];

  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"willBeginMSGPPTTest_Insights_ACRanking_PreLoad:" name:@"MSGPPTTest_Insights_ACRanking_PreLoadBEGIN" object:0];

  id v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"didEndMSGPPTTest_Insights_ACRanking_PreLoad:" name:@"MSGPPTTest_Insights_ACRanking_PreLoadEND" object:0];

  v11 = +[GEONotificationPreferenceManager sharedManager];
  [v11 setEnabled:1 forSubTestWithName:@"MSGPPTTest_Insights_ACRanking_PreLoad"];

  v12 = [(MapsAppTest *)self options];
  v13 = [v12 objectForKeyedSubscript:@"testName"];
  if ([v13 containsString:@"Nearby"])
  {
    self->_isNearbyTest = 1;
    v14 = [v12 objectForKeyedSubscript:@"categoryIndex"];
    v15 = v14;
    if (v14) {
      unint64_t v16 = (unint64_t)[v14 integerValue];
    }
    else {
      unint64_t v16 = arc4random() & 7;
    }
    self->_nearbyCategoryIndex = v16;
  }
  else
  {
    self->_searchTestACMode = [v12 _mapstest_searchTestACMode];
    self->_directionIntentTestType = (int64_t)[v12 _mapstest_directionIntentType];
    v15 = [v12 objectForKeyedSubscript:@"searchQuery"];
    v17 = [v12 objectForKeyedSubscript:@"searchQueryPrefix"];
    v18 = (char *)[v17 length];
    id v19 = [v15 length];
    uint64_t v20 = 5;
    if (&v18[(void)v19] < (char *)5) {
      uint64_t v20 = (uint64_t)&v18[(void)v19];
    }
    if (self->_directionIntentTestType) {
      unint64_t v21 = (unint64_t)&v18[(void)v19];
    }
    else {
      unint64_t v21 = v20;
    }
    self->_maxACSearchQueryLength = v21;
    if (self->_searchTestACMode != 2)
    {
      v22 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      if ([v15 length])
      {
        unint64_t v23 = 0;
        do
        {
          v24 = [v15 substringToIndex:++v23];
          if ([v17 length])
          {
            uint64_t v25 = [v17 stringByAppendingString:v24];

            v24 = (void *)v25;
          }
          [(NSMutableArray *)v22 addObject:v24];
        }
        while (v23 < (unint64_t)[v15 length]);
      }
      autoCompleteQueries = self->_autoCompleteQueries;
      self->_autoCompleteQueries = v22;
    }
    if ([v17 length])
    {
      v27 = [v17 stringByAppendingString:v15];
    }
    else
    {
      v27 = v15;
    }
    query = self->_query;
    self->_query = v27;
  }
  v29 = [v12 objectForKeyedSubscript:@"isShowcase"];
  unsigned int v30 = [v29 BOOLValue];

  if (v30)
  {
    self->_isShowcaseTest = 1;
    v31 = [v12 objectForKeyedSubscript:@"selectACSuggestionMatchingAddress"];
    selectACSuggestionMatchingAddress = self->_selectACSuggestionMatchingAddress;
    self->_selectACSuggestionMatchingAddress = v31;
  }
  if ([(MapsAppTest *)self isRunningOnCarPlay])
  {
    [(MapsAppTestSearch *)self startSearchAutoCompleteTest];
  }
  else
  {
    v33 = [(MapsAppTest *)self testCoordinator];
    [v33 pptTestResetForLaunchURL];

    id v34 = [v12 _mapstest_mapType];
    v35 = [v12 _mapstest_mapRegion];
    [(MapsAppTest *)self switchToMapType:v34];
    v36 = [(MapsAppTest *)self mainVKMapView];
    [v36 setMapRegion:v35 pitch:0.0 yaw:0.0];

    objc_initWeak(&location, self);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1005A127C;
    v37[3] = &unk_1012E6708;
    objc_copyWeak(&v38, &location);
    [(MapsAppTest *)self addFullyDrawnCallback:v37];
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
}

- (void)_startPrewarmingKeyboard
{
  self->_isPrewarmingKeyboard = 1;
  id v2 = [(MapsAppTest *)self testCoordinator];
  [v2 pptTestEnterSearchMode];
}

- (void)_prewarmingKeyboardCompleted
{
  self->_isPrewarmingKeyboard = 0;
  [(MapsAppTestSearch *)self _runTestNow];
}

- (void)didDisplayCarplayBrowseCategories
{
  v3 = [(MapsAppTest *)self options];
  id v4 = [v3 objectForKeyedSubscript:@"testName"];
  v5 = [(MapsAppTest *)self testCoordinator];
  id v6 = [v5 pptTestScrollView];

  if (v6)
  {
    if ([v4 isEqualToString:@"searchScrollBrowseCategoryResultsInCarPlay"])
    {
      [(MapsAppTestSearch *)self finishedSubTest:@"enterSearchMode"];
      objc_initWeak(&location, self);
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_1005A17AC;
      v15[3] = &unk_1012F08D8;
      v15[4] = self;
      unint64_t v16 = @"scrollBrowseCategoryResultsInCarPlay";
      id v17 = v6;
      objc_copyWeak(&v18, &location);
      +[PPTNotificationCenter addOnceObserverForName:@"PPTTest_CarSearchResultsModeController_DidDisplaySearchResults" object:0 usingBlock:v15];
      id v7 = [(MapsAppTest *)self testCoordinator];
      [v7 pptTestSearchNearbyCategoryWithIndex:0];

      objc_destroyWeak(&v18);
    }
    else
    {
      unsigned int v8 = [v4 isEqualToString:@"searchEmbarcadero"];
      [(MapsAppTestSearch *)self finishedSubTest:@"enterSearchMode"];
      if (!v8)
      {
        [(MapsAppTestSearch *)self startedSubTest:@"scrollBrowseCategoriesInCarPlay"];
        [v6 contentSize];
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1005A19A8;
        v11[3] = &unk_1012F0900;
        v11[4] = self;
        v12 = @"scrollBrowseCategoriesInCarPlay";
        [v6 _performScrollTest:0 iterations:10 delta:20 length:(int)v10 scrollAxis:2 extraResultsBlock:0 completionBlock:v11];

        goto LABEL_9;
      }
      [(MapsAppTestSearch *)self startedSubTest:@"displayCarPlayKeyboard"];
      objc_initWeak(&location, self);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1005A1940;
      v13[3] = &unk_1012E6730;
      objc_copyWeak(&v14, &location);
      +[PPTNotificationCenter addOnceObserverForName:@"PPTTest_CarKeyboardModeController_DidDisplayKeyboard" object:0 usingBlock:v13];
      id v9 = [(MapsAppTest *)self testCoordinator];
      [v9 pptSelectKeyboardInteractionModel];

      objc_destroyWeak(&v14);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    [(MapsAppTest *)self failedTest];
  }
LABEL_9:
}

- (void)searchUILayoutDone
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"PPTTestTrayLayoutDidUpdateNotification" object:0];

  [(MapsAppTestSearch *)self finishedSubTest:@"presentSearchUI"];
}

- (void)searchKeyboardWillShow
{
  if (!self->_isPrewarmingKeyboard) {
    [(MapsAppTestSearch *)self startedSubTest:@"showSearchKeyboard"];
  }
}

- (void)searchKeyboardDidShow
{
  if (self->_isPrewarmingKeyboard)
  {
    id v3 = [(MapsAppTest *)self testCoordinator];
    [v3 pptTestSearchCancel];
  }
  else
  {
    [(MapsAppTestSearch *)self finishedSubTest:@"showSearchKeyboard"];
    [(MapsAppTestSearch *)self finishedSubTest:@"enterSearchMode"];
    [(MapsAppTestSearch *)self startAutocompleteOrNearbySearchTest];
  }
}

- (void)searchKeyboardDidHide
{
  if (self->_isPrewarmingKeyboard) {
    [(MapsAppTestSearch *)self _prewarmingKeyboardCompleted];
  }
}

- (void)startAutocompleteOrNearbySearchTest
{
  if (self->_isNearbyTest) {
    [(MapsAppTestSearch *)self startNearbyTest];
  }
  else {
    [(MapsAppTestSearch *)self startSearchAutoCompleteTest];
  }
}

- (void)startNearbyTest
{
  [(MapsAppTestSearch *)self startedSubTest:@"nearby"];

  [(MapsAppTestSearch *)self startNearbyTestCategory];
}

- (void)startNearbyTestCategory
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"endNearbyTestCategory:" name:@"SearchSessionDidChangeSearchResultsNotification" object:0];

  [(MapsAppTestSearch *)self startedSubTest:@"nearby - category"];
  id v4 = [(MapsAppTest *)self testCoordinator];
  [v4 pptTestSearchNearbyCategoryWithIndex:self->_nearbyCategoryIndex];
}

- (void)endNearbyTestCategory:(id)a3
{
  id v4 = a3;
  [(MapsAppTestSearch *)self finishedSubTest:@"nearby - category"];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"SearchSessionDidChangeSearchResultsNotification" object:0];

  id v6 = [v4 object];

  if (v6) {
    [(MapsAppTestSearch *)self continueToAnnotationsTestsWithSearchSession:v6];
  }
  else {
    [(MapsAppTest *)self failedTest];
  }
}

- (void)startScrollNearbyTestCategory
{
  [(MapsAppTestSearch *)self startedSubTest:@"nearby search results list - scroll"];
  objc_initWeak(&location, self);
  id v3 = [(MapsAppTest *)self testCoordinator];
  id v4 = [v3 pptTestScrollView];

  RPTContentSizeInDirection();
  double v6 = v5;
  RPTGetBoundsForView();
  id v11 = [objc_alloc((Class)RPTScrollViewTestParameters) initWithTestName:@"nearby search results list - scroll" scrollBounds:1 scrollContentLength:&stru_1012F0920 scrollDirection:v7 completionHandler:v6];
  id v22 = v11;
  v12 = +[NSArray arrayWithObjects:&v22 count:1];
  id v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  unint64_t v16 = sub_1005A1F24;
  id v17 = &unk_1012E9340;
  objc_copyWeak(&v20, &location);
  id v18 = self;
  id v19 = @"nearby search results list - scroll";
  id v13 = +[RPTGroupScrollTestParameters newWithTestName:@"nearby search results list - scroll" parameters:v12 completionHandler:&v14];

  +[RPTTestRunner runTestWithParameters:](RPTTestRunner, "runTestWithParameters:", v13, v14, v15, v16, v17);
  objc_destroyWeak(&v20);

  objc_destroyWeak(&location);
}

- (void)startSearchAutoCompleteTest
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"willBeginMSGPPTTest_Insights_ACRanking_MapItems:" name:@"MSGPPTTest_Insights_ACRanking_MapItemsBEGIN" object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"didEndMSGPPTTest_Insights_ACRanking_MapItems:" name:@"MSGPPTTest_Insights_ACRanking_MapItemsEND" object:0];

  double v5 = +[GEONotificationPreferenceManager sharedManager];
  [v5 setEnabled:1 forSubTestWithName:@"MSGPPTTest_Insights_ACRanking_MapItems"];

  double v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"willBeginMSGPPTTest_Insights_ACRanking_Contacts:" name:@"MSGPPTTest_Insights_ACRanking_ContactsBEGIN" object:0];

  double v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"didEndMSGPPTTest_Insights_ACRanking_Contacts:" name:@"MSGPPTTest_Insights_ACRanking_ContactsEND" object:0];

  double v8 = +[GEONotificationPreferenceManager sharedManager];
  [v8 setEnabled:1 forSubTestWithName:@"MSGPPTTest_Insights_ACRanking_Contacts"];

  double v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"willBeginMSGPPTTest_Insights_ACRanking_Tourist:" name:@"MSGPPTTest_Insights_ACRanking_TouristBEGIN" object:0];

  double v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"didEndMSGPPTTest_Insights_ACRanking_Tourist:" name:@"MSGPPTTest_Insights_ACRanking_TouristEND" object:0];

  id v11 = +[GEONotificationPreferenceManager sharedManager];
  [v11 setEnabled:1 forSubTestWithName:@"MSGPPTTest_Insights_ACRanking_Tourist"];

  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"searchAutoCompleteTestReceiveHandlesOrAddresses:" name:@"SearchDidFinishFetchingFindMyHandlesOrAddressBookAddresses" object:0];

  if (self->_searchTestACMode != 2) {
    [(MapsAppTestSearch *)self startedSubTest:@"autoComplete"];
  }

  [(MapsAppTestSearch *)self searchAutoCompleteTestSendQuery];
}

- (void)searchAutoCompleteTestReceiveHandlesOrAddresses:(id)a3
{
  id v5 = [(NSMutableArray *)self->_autoCompleteQueries firstObject];
  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"collecting handles or contacts - Letter number %lu", [v5 length]);
  [(MapsAppTestSearch *)self finishedSubTest:v4];
}

- (void)searchAutoCompleteTestSendQuery
{
  id v3 = [(NSMutableArray *)self->_autoCompleteQueries firstObject];
  if (!v3) {
    [(MapsAppTestSearch *)self searchAutoCompleteTestDidFinish];
  }
  id v4 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v4 setSearchString:v3];
  id v5 = [v3 length];
  unint64_t v6 = (unint64_t)v5;
  if (self->_searchTestACMode != 1 || v5 == self->_maxACSearchQueryLength)
  {
    double v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:self selector:"searchAutoCompleteTestReceiveResponse:" name:@"SearchDataProviderDidChangeDataNotification" object:0];

    if (v6 < 6 || self->_directionIntentTestType)
    {
      double v8 = +[NSString stringWithFormat:@"autoCompleteSubTest - Letter number %lu", v6];
      [(MapsAppTestSearch *)self startedSubTest:v8];

      double v9 = +[NSString stringWithFormat:@"collecting handles or contacts - Letter number %lu", v6];
      [(MapsAppTestSearch *)self startedSubTest:v9];
    }
  }
  double v10 = [(MapsAppTest *)self testCoordinator];
  [v10 pptTestAutocompleteSearchForFieldItem:v4];

  if ([(NSMutableArray *)self->_autoCompleteQueries count]
    && self->_searchTestACMode == 1
    && v6 != self->_maxACSearchQueryLength)
  {
    dispatch_time_t v11 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005A2458;
    block[3] = &unk_1012E5D08;
    void block[4] = self;
    dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)searchAutoCompleteTestReceiveResponse:(id)a3
{
  id v4 = a3;
  id v5 = [(NSMutableArray *)self->_autoCompleteQueries firstObject];
  unint64_t v6 = [v4 userInfo];
  double v7 = [v6 objectForKeyedSubscript:@"SearchDataProviderQueryKey"];

  double v8 = [v4 userInfo];
  double v9 = [v8 objectForKeyedSubscript:@"SearchDataProviderQueryResultGroupsKey"];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v22;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v14) items];
        v12 += (uint64_t)[v15 count];

        id v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
    LODWORD(v11) = v12 != 0;
  }

  if ([v7 isEqualToString:v5]) {
    BOOL v16 = v11 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    id v17 = [v5 length];
    if ((unint64_t)v17 < 6 || self->_directionIntentTestType)
    {
      id v18 = +[NSString stringWithFormat:@"autoCompleteSubTest - Letter number %lu", v17];
      [(MapsAppTestSearch *)self finishedSubTest:v18];
    }
    id v19 = +[NSNotificationCenter defaultCenter];
    [v19 removeObserver:self name:@"SearchDataProviderDidChangeDataNotification" object:0];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005A273C;
    block[3] = &unk_1012E5D08;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)searchAutoCompleteTestDidFinish
{
  if (self->_searchTestACMode != 2) {
    [(MapsAppTestSearch *)self finishedSubTest:@"autoComplete"];
  }
  if (self->_isShowcaseTest)
  {
    if (self->_selectACSuggestionMatchingAddress)
    {
      id v3 = [(MapsAppTest *)self testCoordinator];
      [v3 pptSelectACSuggestionMatchingAddress:self->_selectACSuggestionMatchingAddress];

      [(MapsAppTestSearch *)self startedSubTest:@"displayPlacecard"];
      [(MapsAppTestSearch *)self startedSubTest:@"fetchPlaceEnrichment"];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1005A2A6C;
      v10[3] = &unk_1012E6668;
      v10[4] = self;
      +[PPTNotificationCenter addOnceObserverForName:MKPlaceViewControllerDidShowNotification object:0 usingBlock:v10];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1005A2A7C;
      v9[3] = &unk_1012E6668;
      v9[4] = self;
      +[PPTNotificationCenter addOnceObserverForName:MUPlaceEnrichmentSectionControllerDidFetchEnrichmentNotification object:0 usingBlock:v9];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1005A2A8C;
      v8[3] = &unk_1012E6668;
      void v8[4] = self;
      +[PPTNotificationCenter addOnceObserverForName:MUPlaceEnrichmentSectionControllerDidStartLoadingNotification object:0 usingBlock:v8];
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1005A2A9C;
      v7[3] = &unk_1012E6668;
      v7[4] = self;
      +[PPTNotificationCenter addOnceObserverForName:MUPlaceEnrichmentSectionControllerDidFinishLoadingNotification object:0 usingBlock:v7];
    }
    else
    {
      id v5 = +[NSString stringWithFormat:@"Does not know which AC suggestions to select. Add selectACSuggestionMatchingAddress key value in the testDefinitions.plist."];
      [(MapsAppTest *)self failedTestWithReason:v5];
    }
  }
  else
  {
    id v4 = [(MapsAppTest *)self testCoordinator];
    [v4 pptTestSearchEndEditing];

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005A2AE0;
    block[3] = &unk_1012E5D08;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)willBeginGEOPPTTest_PlaceRequestTicket_PlaceDataRequest:(id)a3
{
  id v10 = a3;
  id v4 = [v10 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unint64_t v6 = [v10 object];
    double v7 = [v6 data];
    double v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 length]);
    double v9 = [(MapsAppTest *)self results];
    [v9 setObject:v8 forKeyedSubscript:@"extras:searchRequestSize:bytes"];
  }
}

- (void)didEndGEOPPTTest_PlaceRequestTicket_PlaceDataRequest:(id)a3
{
  id v14 = a3;
  id v4 = [v14 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  unint64_t v6 = v14;
  if (isKindOfClass)
  {
    double v7 = [v14 object];
    double v8 = [v7 data];
    double v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v8 length]);
    id v10 = [(MapsAppTest *)self results];
    [v10 setObject:v9 forKeyedSubscript:@"extras:searchResponseSize:bytes"];

    if ([v7 hasDebugLatencyMs])
    {
      *(float *)&double v11 = (float)(unint64_t)[v7 debugLatencyMs] / 1000.0;
      uint64_t v12 = +[NSNumber numberWithFloat:v11];
      uint64_t v13 = [(MapsAppTest *)self results];
      [v13 setObject:v12 forKeyedSubscript:@"extras:searchResponseServerLatency:time"];
    }
    unint64_t v6 = v14;
  }
}

- (void)sendSearchRequest
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"searchRequestSent:" name:@"SearchManagerSearchForStringRequestSentNotification" object:0];

  unint64_t v6 = objc_alloc_init(SearchFieldItem);
  [(SearchFieldItem *)v6 setSearchString:self->_query];
  [(MapsAppTestSearch *)self startedSubTest:@"searchRequestSent"];
  unint64_t v4 = self->_directionIntentTestType - 1;
  if (v4 <= 2) {
    [(MapsAppTestSearch *)self startedSubTest:off_1012F0960[v4]];
  }
  id v5 = [(MapsAppTest *)self testCoordinator];
  [v5 pptTestSearchForFieldItem:v6];
}

- (void)searchRequestSent:(id)a3
{
  unint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"SearchManagerSearchForStringRequestSentNotification" object:0];

  [(MapsAppTestSearch *)self finishedSubTest:@"searchRequestSent"];
  [(MapsAppTestSearch *)self startedSubTest:@"searchResultReceived"];
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"searchSessionDidChangeSearchResults:" name:@"SearchSessionDidChangeSearchResultsNotification" object:0];
}

- (void)searchSessionDidChangeSearchResults:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (!self->_isNearbyTest)
  {
    id v5 = +[GEONotificationPreferenceManager sharedManager];
    [v5 setEnabled:0 forSubTestWithName:@"GEOPPTTest_PlaceRequestTicket_PlaceDataRequest"];

    unint64_t v6 = +[NSNotificationCenter defaultCenter];
    [v6 removeObserver:self name:@"GEOPPTTest_PlaceRequestTicket_PlaceDataRequestBEGIN" object:0];

    double v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self name:@"GEOPPTTest_PlaceRequestTicket_PlaceDataRequestEND" object:0];

    double v8 = +[NSNotificationCenter defaultCenter];
    [v8 removeObserver:self name:@"SearchSessionDidChangeSearchResultsNotification" object:0];

    id v4 = v10;
  }
  double v9 = [v4 object];
  if (v9)
  {
    if (!self->_isNearbyTest) {
      [(MapsAppTestSearch *)self finishedSubTest:@"searchResultReceived"];
    }
    [(MapsAppTestSearch *)self continueToAnnotationsTestsWithSearchSession:v9];
  }
  else
  {
    [(MapsAppTest *)self failedTest];
  }
}

- (void)continueToAnnotationsTestsWithSearchSession:(id)a3
{
  id v4 = a3;
  id v5 = [v4 searchInfo];
  unint64_t v6 = [v5 results];
  id v7 = [v6 count];

  double v8 = [v4 searchInfo];

  double v9 = [v8 directionIntent];

  if (v9)
  {
    [(MapsAppTestSearch *)self continueDirectionIntentTest];
  }
  else if (v7)
  {
    +[NSNotificationCenter defaultCenter];
    if (v7 == (id)1) {
      id v10 = {;
    }
      [v10 addObserver:self selector:"annotationPinDroppedForAResult:" name:@"MapsPinsDroppedForSearchResultsNotification" object:0];

      CFStringRef v11 = @"annotationsDroppedAndSelected";
    }
    else {
      uint64_t v12 = {;
    }
      [v12 addObserver:self selector:"annotationPinDroppedForResults:" name:@"MapsPinsDroppedForSearchResultsNotification" object:0];

      CFStringRef v11 = @"annotationsDropped";
    }
    [(MapsAppTestSearch *)self startedSubTest:v11];
  }
  else
  {
    if (self->_isNearbyTest) {
      [(MapsAppTestSearch *)self finishedSubTest:@"nearby"];
    }
    [(MapsAppTest *)self finishedTest];
  }
}

- (void)annotationPinDroppedForAResult:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"MapsPinsDroppedForSearchResultsNotification" object:0];
  [(MapsAppTestSearch *)self finishedSubTest:@"annotationsDroppedAndSelected"];
  [(MapsAppTestSearch *)self startedSubTest:@"mapViewFullyDrawn"];
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1005A339C;
  v6[3] = &unk_1012E6708;
  objc_copyWeak(&v7, &location);
  [(MapsAppTest *)self addFullyDrawnCallback:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)annotationPinDroppedForResults:(id)a3
{
  id v4 = a3;
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"MapsPinsDroppedForSearchResultsNotification" object:0];
  [(MapsAppTestSearch *)self finishedSubTest:@"annotationsDropped"];
  [(MapsAppTestSearch *)self startedSubTest:@"mapViewFullyDrawn"];
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1005A3500;
  v6[3] = &unk_1012E6708;
  objc_copyWeak(&v7, &location);
  [(MapsAppTest *)self addFullyDrawnCallback:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)continueToNearbyScrollTests
{
  id v3 = [(MapsAppTest *)self options];
  id v4 = [v3 objectForKeyedSubscript:@"testName"];

  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1005A3644;
  v7[3] = &unk_1012E5D58;
  id v8 = v4;
  double v9 = self;
  id v6 = v4;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, v7);
}

- (void)finishSearchTest:(id)a3
{
  [(MapsAppTestSearch *)self finishedSubTest:@"mapViewFullyDrawn"];
  if (self->_isNearbyTest)
  {
    dispatch_time_t v4 = dispatch_time(0, 2000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005A3818;
    block[3] = &unk_1012E5D08;
    void block[4] = self;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    [(MapsAppTest *)self finishedTest];
  }
}

- (void)startRefreshSearchTestIfNeeded
{
  id v3 = [(MapsAppTest *)self options];
  uint64_t v4 = [v3 valueForKey:@"refreshWestLng"];
  if (!v4) {
    goto LABEL_8;
  }
  dispatch_time_t v5 = (void *)v4;
  uint64_t v6 = [v3 valueForKey:@"refreshEastLng"];
  if (!v6) {
    goto LABEL_7;
  }
  id v7 = (void *)v6;
  uint64_t v8 = [v3 valueForKey:@"refreshSouthLat"];
  if (!v8)
  {

LABEL_7:
    goto LABEL_8;
  }
  double v9 = (void *)v8;
  id v10 = [v3 valueForKey:@"refreshNorthLat"];

  if (!v10)
  {
LABEL_8:
    [(MapsAppTest *)self finishedTest];
    goto LABEL_9;
  }
  CFStringRef v11 = +[NSNotificationCenter defaultCenter];
  [v11 removeObserver:self name:@"SearchSessionDidChangeSearchResultsNotification" object:0];

  uint64_t v12 = objc_opt_new();
  uint64_t v13 = [v3 valueForKey:@"refreshWestLng"];
  [v13 doubleValue];
  [v12 setWestLng:];

  id v14 = [v3 valueForKey:@"refreshEastLng"];
  [v14 doubleValue];
  [v12 setEastLng:];

  uint64_t v15 = [v3 valueForKey:@"refreshSouthLat"];
  [v15 doubleValue];
  [v12 setSouthLat:];

  BOOL v16 = [v3 valueForKey:@"refreshNorthLat"];
  [v16 doubleValue];
  [v12 setNorthLat:];

  id v17 = [(MapsAppTest *)self mainVKMapView];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1005A3A4C;
  v18[3] = &unk_1012E7D28;
  v18[4] = self;
  [v17 setMapRegion:v12 pitch:v18 yaw:0.0 duration:0.0 completion:2.0];

LABEL_9:
}

- (void)refreshSearchRequestSent:(id)a3
{
  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"SearchManagerSearchForStringRequestSentNotification" object:0];

  dispatch_time_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"refreshSearchAnnotationPinDroppedForResults:" name:@"MapsPinsDroppedForSearchResultsNotification" object:0];

  uint64_t v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"refreshSearchSessionDidChangeSearchResults:" name:@"SearchSessionDidChangeSearchResultsNotification" object:0];

  [(MapsAppTestSearch *)self finishedSubTest:@"refreshSearch - searchRequestSent"];

  [(MapsAppTestSearch *)self startedSubTest:@"refreshSearch - searchResultReceived"];
}

- (void)refreshSearchSessionDidChangeSearchResults:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"SearchSessionDidChangeSearchResultsNotification" object:0];

  id v10 = [v4 object];

  if (v10)
  {
    [(MapsAppTestSearch *)self finishedSubTest:@"refreshSearch - searchResultReceived"];
    uint64_t v6 = [v10 searchInfo];
    id v7 = [v6 results];
    id v8 = [v7 count];

    if ((unint64_t)v8 < 2)
    {
      double v9 = +[NSNotificationCenter defaultCenter];
      [v9 removeObserver:self name:@"MapsPinsDroppedForSearchResultsNotification" object:0];

      [(MapsAppTest *)self finishedTest];
    }
    else
    {
      [(MapsAppTestSearch *)self startedSubTest:@"refreshSearch - annotationsDropped"];
    }
  }
  else
  {
    [(MapsAppTest *)self failedTest];
  }
}

- (void)refreshSearchAnnotationPinDroppedForResults:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:@"MapsPinsDroppedForSearchResultsNotification" object:0];
  [(MapsAppTestSearch *)self finishedSubTest:@"refreshSearch - annotationsDropped"];
  [(MapsAppTestSearch *)self startedSubTest:@"refreshSearch - mapViewFullyDrawn"];
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1005A3E1C;
  v6[3] = &unk_1012E6708;
  objc_copyWeak(&v7, &location);
  [(MapsAppTest *)self addFullyDrawnCallback:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)continueDirectionIntentTest
{
  int64_t directionIntentTestType = self->_directionIntentTestType;
  if ((unint64_t)(directionIntentTestType - 2) >= 2)
  {
    if (directionIntentTestType != 1) {
      return;
    }
    CFStringRef v3 = @"RouteSearchViewControllerDidAppear";
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    uint64_t v12 = sub_1005A3F8C;
    uint64_t v13 = &unk_1012E6668;
    id v14 = self;
    id v4 = &v10;
  }
  else
  {
    CFStringRef v3 = @"MapsRoutePlanningShowingRoutesNotification";
    dispatch_time_t v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    id v7 = sub_1005A3FD0;
    id v8 = &unk_1012E6668;
    double v9 = self;
    id v4 = &v5;
  }
  +[PPTNotificationCenter addOnceObserverForName:object:usingBlock:](PPTNotificationCenter, "addOnceObserverForName:object:usingBlock:", v3, 0, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectACSuggestionMatchingAddress, 0);
  objc_storeStrong((id *)&self->_autoCompleteQueries, 0);

  objc_storeStrong((id *)&self->_query, 0);
}

@end