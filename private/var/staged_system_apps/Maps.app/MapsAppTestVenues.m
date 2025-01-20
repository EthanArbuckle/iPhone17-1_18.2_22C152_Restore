@interface MapsAppTestVenues
- (BOOL)runTest;
- (void)displayCategoryResultsWithMapItem:(id)a3 searchCategory:(id)a4 completion:(id)a5;
- (void)displayPlacecardWithWillDisplayBlock:(id)a3 didDisplayBlock:(id)a4;
- (void)jumpToWestfieldSF:(id)a3;
- (void)performScrollTestOnScrollView:(id)a3;
- (void)runBrowseTest;
- (void)runScrollCategoryResultsTest;
- (void)runScrollSearchResultPlacecardTest;
- (void)selectSearchResult:(id)a3 completion:(id)a4;
- (void)selectSubCategory:(id)a3 venueCategoryViewController:(id)a4 completion:(id)a5;
@end

@implementation MapsAppTestVenues

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestResetForLaunchURL];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1008F52AC;
  v5[3] = &unk_1012E5D08;
  v5[4] = self;
  [(MapsAppTestVenues *)self jumpToWestfieldSF:v5];
  return 1;
}

- (void)jumpToWestfieldSF:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v6 = objc_alloc_init((Class)GEOMapRegion);
    [v6 setWestLng:-122.409078];
    [v6 setEastLng:-122.403764];
    [v6 setSouthLat:37.7806008];
    [v6 setNorthLat:37.7871745];
    v5 = [(MapsAppTest *)self mainVKMapView];
    [v5 setMapRegion:v6 pitch:0.0 yaw:0.0];

    [(MapsAppTest *)self addFullyDrawnCallback:v4];
  }
}

- (void)displayPlacecardWithWillDisplayBlock:(id)a3 didDisplayBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc((Class)MKMapItemIdentifier);
  id v9 = [v8 initWithMUID:0xCB37502B5BA58FCCLL resultProviderID:0 coordinate:MKCoordinateInvalid[0], MKCoordinateInvalid[1]];
  if (v9)
  {
    v10 = +[MKMapService sharedService];
    id v16 = v9;
    v11 = +[NSArray arrayWithObjects:&v16 count:1];
    v12 = [v10 ticketForIdentifiers:v11 traits:0];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1008F55E4;
    v13[3] = &unk_1013001A0;
    v13[4] = self;
    id v14 = v6;
    id v15 = v7;
    [v12 submitWithHandler:v13 networkActivity:0];
  }
  else
  {
    [(MapsAppTest *)self failedTest];
  }
}

- (void)displayCategoryResultsWithMapItem:(id)a3 searchCategory:(id)a4 completion:(id)a5
{
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_1008F5974;
  id v15 = &unk_1013001C8;
  id v16 = self;
  id v17 = a5;
  id v8 = v17;
  id v9 = a4;
  id v10 = a3;
  +[PPTNotificationCenter addOnceObserverForName:@"VenueBrowseDidDisplayCategoryResults" object:0 usingBlock:&v12];
  v11 = [(MapsAppTest *)self testCoordinator];
  [v11 pptTestPresentVenueForMapItem:v10 searchCategory:v9];
}

- (void)performScrollTestOnScrollView:(id)a3
{
  id v4 = a3;
  v5 = [(MapsAppTest *)self testName];
  id v6 = [v5 stringByAppendingString:@" - scroll"];

  [(MapsAppTest *)self startedSubTest:v6];
  objc_initWeak(&location, self);
  RPTContentSizeInDirection();
  double v8 = v7;
  RPTGetBoundsForView();
  id v13 = [objc_alloc((Class)RPTScrollViewTestParameters) initWithTestName:v6 scrollBounds:1 scrollContentLength:&stru_1013001E8 direction:v9 completionHandler:v10 v11 v12 v8];
  id v25 = v13;
  id v14 = +[NSArray arrayWithObjects:&v25 count:1];
  id v17 = _NSConcreteStackBlock;
  uint64_t v18 = 3221225472;
  v19 = sub_1008F5C44;
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

- (void)selectSearchResult:(id)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = MKPlaceViewControllerDidShowNotification;
  double v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_1008F5D8C;
  id v14 = &unk_1013001C8;
  id v15 = self;
  id v16 = v6;
  id v8 = v6;
  id v9 = a3;
  +[PPTNotificationCenter addOnceObserverForName:v7 object:0 usingBlock:&v11];
  double v10 = [(MapsAppTest *)self testCoordinator];
  [v10 pptTestSelectVenueSearchResult:v9];
}

- (void)selectSubCategory:(id)a3 venueCategoryViewController:(id)a4 completion:(id)a5
{
  id v8 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1008F5F60;
  v17[3] = &unk_1012E6668;
  v17[4] = self;
  id v9 = a4;
  id v10 = a3;
  +[PPTNotificationCenter addOnceObserverForName:@"VenueBrowseDidFailToSelectSubcategory" object:0 usingBlock:v17];
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_1008F5F68;
  id v15 = &unk_1012EEF90;
  id v16 = v8;
  id v11 = v8;
  +[PPTNotificationCenter addOnceObserverForName:@"VenueBrowseDidDisplayCategoryResults" object:0 usingBlock:&v12];
  [v9 selectSubcategory:v10, v12, v13, v14, v15];
}

- (void)runBrowseTest
{
  [(MapsAppTest *)self startedTest];
  v3[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008F6040;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1008F6050;
  v3[3] = &unk_101300260;
  [(MapsAppTestVenues *)self displayPlacecardWithWillDisplayBlock:v4 didDisplayBlock:v3];
}

- (void)runScrollCategoryResultsTest
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1008F64D0;
  v2[3] = &unk_101300260;
  v2[4] = self;
  [(MapsAppTestVenues *)self displayPlacecardWithWillDisplayBlock:0 didDisplayBlock:v2];
}

- (void)runScrollSearchResultPlacecardTest
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1008F6810;
  v2[3] = &unk_101300260;
  v2[4] = self;
  [(MapsAppTestVenues *)self displayPlacecardWithWillDisplayBlock:0 didDisplayBlock:v2];
}

@end