@interface LookAroundActionCoordinator
- (AppCoordinator)appCoordinator;
- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5;
- (BOOL)pptTestCanUpdateTrayLayout;
- (BOOL)pptTestIsTrayType:(int64_t)a3;
- (GEOMapServiceTraits)newTraits;
- (LookAroundActionCoordinator)initWithContainerViewController:(id)a3;
- (LookAroundContainerViewController)containerViewController;
- (LookAroundPIPDataCoordinator)dataCoordinator;
- (MKMapItem)currentMapItem;
- (UIScrollView)pptTestScrollView;
- (id)activityViewControllerForPlaceViewController:(id)a3;
- (id)mapView;
- (id)placeCardViewController;
- (id)trayContaineeViewControllerWithLookAroundView:(id)a3;
- (int64_t)displayedViewMode;
- (int64_t)overriddenInterfaceStyleForPlaceViewControllerSubviews:(id)a3;
- (void)_captureLookAroundUserAction:(int)a3 onTarget:(int)a4;
- (void)_handleEnterToBackgroundNotification:(id)a3;
- (void)_handleEnterToForegroundNotification:(id)a3;
- (void)_registerBackgroundNotifications;
- (void)collectionPickerClosed:(id)a3;
- (void)collectionPickerNewCollection:(id)a3;
- (void)didDismissViewController:(id)a3 mapItem:(id)a4;
- (void)exitLookAround;
- (void)placeCardViewController:(id)a3 didSelectParent:(id)a4;
- (void)placeCardViewController:(id)a3 doDirectionItem:(id)a4 userInfo:(id)a5;
- (void)placeCardViewController:(id)a3 presentPOIEnrichmentWithCoordinator:(id)a4;
- (void)placeCardViewController:(id)a3 requestCopyLinkToClipboard:(id)a4;
- (void)placeCardViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6;
- (void)placeCardViewController:(id)a3 selectExploreGuidesWithGuideLocation:(id)a4;
- (void)placeCardViewController:(id)a3 showCollection:(id)a4;
- (void)placeCardViewController:(id)a3 showCuratedCollection:(id)a4;
- (void)placeCardViewController:(id)a3 showRelatedMapItems:(id)a4 withTitle:(id)a5 originalMapItem:(id)a6 analyticsDelegate:(id)a7;
- (void)poiEnrichmentCoordinator:(id)a3 requestPresentingViewControllerWithBlock:(id)a4;
- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4;
- (void)presentFromContainerViewController:(id)a3 animated:(BOOL)a4;
- (void)setAppCoordinator:(id)a3;
- (void)viewController:(id)a3 createNewCollectionWithSession:(id)a4;
- (void)viewController:(id)a3 dismissAnimated:(BOOL)a4 completion:(id)a5;
- (void)viewController:(id)a3 openURL:(id)a4;
- (void)viewController:(id)a3 pickCollectionWithSession:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6;
- (void)viewController:(id)a3 presentPlaceCardForItem:(id)a4;
- (void)viewController:(id)a3 presentPlaceCardForItem:(id)a4 animated:(BOOL)a5;
- (void)viewControllerGoPreviousState:(id)a3 withSender:(id)a4;
- (void)viewControllerPresentLookAround:(id)a3 showsFullScreen:(BOOL)a4;
- (void)viewControllerPresentTTR:(id)a3;
- (void)viewControllerPresentTray:(id)a3 showsFullScreen:(BOOL)a4 usingLookAroundView:(id)a5;
@end

@implementation LookAroundActionCoordinator

- (LookAroundActionCoordinator)initWithContainerViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LookAroundActionCoordinator;
  v5 = [(LookAroundActionCoordinator *)&v8 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_containerViewController, v4);
    [(LookAroundActionCoordinator *)v6 _registerBackgroundNotifications];
  }

  return v6;
}

- (MKMapItem)currentMapItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v3 = [WeakRetained currentMapItem];

  return (MKMapItem *)v3;
}

- (id)mapView
{
  v2 = [(LookAroundActionCoordinator *)self appCoordinator];
  v3 = [v2 chromeViewController];
  id v4 = [v3 mapView];

  return v4;
}

- (id)placeCardViewController
{
  placeCardViewController = self->_placeCardViewController;
  if (!placeCardViewController)
  {
    id v4 = objc_alloc_init(PlaceCardViewController);
    v5 = self->_placeCardViewController;
    self->_placeCardViewController = v4;

    [(PlaceCardViewController *)self->_placeCardViewController setExcludedContent:13006];
    [(PlaceCardViewController *)self->_placeCardViewController setPlaceCardDelegate:self];
    [(InfoCardViewController *)self->_placeCardViewController setContaineeDelegate:self];
    [(PlaceCardViewController *)self->_placeCardViewController setPlaceCardDismissalDelegate:self];
    [(PlaceCardViewController *)self->_placeCardViewController setActionCoordinator:self];
    placeCardViewController = self->_placeCardViewController;
  }

  return placeCardViewController;
}

- (LookAroundPIPDataCoordinator)dataCoordinator
{
  if (!self->_dataCoordinator)
  {
    v3 = [LookAroundPIPDataCoordinatorImpl alloc];
    id v4 = [(LookAroundActionCoordinator *)self mapView];
    v5 = [(LookAroundPIPDataCoordinatorImpl *)v3 initWithMapView:v4];
    dataCoordinator = self->_dataCoordinator;
    self->_dataCoordinator = v5;
  }
  if (!self->_analyticsController)
  {
    v7 = [[LookAroundPIPAnalyticsController alloc] initWithDataCoordinator:self->_dataCoordinator];
    analyticsController = self->_analyticsController;
    self->_analyticsController = v7;
  }
  v9 = self->_dataCoordinator;

  return v9;
}

- (id)trayContaineeViewControllerWithLookAroundView:(id)a3
{
  trayContaineeViewController = self->_trayContaineeViewController;
  if (!trayContaineeViewController)
  {
    id v5 = a3;
    v6 = [[LookAroundTrayContaineeViewController alloc] initWithLookAroundView:v5];

    v7 = self->_trayContaineeViewController;
    self->_trayContaineeViewController = v6;

    [(LookAroundTrayContaineeViewController *)self->_trayContaineeViewController loadViewIfNeeded];
    [(LookAroundTrayContaineeViewController *)self->_trayContaineeViewController setActionCoordinator:self];
    [self->_trayContaineeViewController setContaineeDelegate:self];
    trayContaineeViewController = self->_trayContaineeViewController;
  }

  return trayContaineeViewController;
}

- (void)collectionPickerClosed:(id)a3
{
  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = 0;
}

- (void)collectionPickerNewCollection:(id)a3
{
  id v4 = a3;
  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = 0;

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100A43780;
  v11[3] = &unk_1012F5830;
  objc_copyWeak(&v13, &location);
  id v6 = v4;
  id v12 = v6;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A437FC;
  v8[3] = &unk_101315088;
  objc_copyWeak(&v10, &location);
  id v7 = v6;
  id v9 = v7;
  [v7 viewControllerToPresentIfContainee:v11 ifAlertController:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)viewController:(id)a3 createNewCollectionWithSession:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v6 collection];
  if ([v7 handlerType] == (id)3)
  {
    uint64_t v8 = 256;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = 251;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v8 = 201;
      }
      else {
        uint64_t v8 = 0;
      }
    }
  }

  id v9 = [[CollectionCreateViewController alloc] initWithEditSession:v6];
  [(ContaineeViewController *)v9 setContaineeDelegate:self];
  [(CollectionCreateViewController *)v9 setTarget:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v9 animated:1];
}

- (void)viewControllerGoPreviousState:(id)a3 withSender:(id)a4
{
  id v6 = (LookAroundTrayContaineeViewController *)a3;
  id v7 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_4:
    if ((LookAroundTrayContaineeViewController *)self->_placeCardViewController == v6)
    {
      [(LookAroundActionCoordinator *)self _captureLookAroundUserAction:4 onTarget:201];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
      [WeakRetained popLastViewControllerAnimated:1];

      dispatch_time_t v14 = dispatch_time(0, 250000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100A43B4C;
      block[3] = &unk_1012E5D08;
      block[4] = self;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);
    }
    else if (self->_trayContaineeViewController != v6)
    {
      id v12 = objc_loadWeakRetained((id *)&self->_containerViewController);
      [v12 popLastViewControllerAnimated:1];
    }
    goto LABEL_12;
  }
  id v9 = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v10 = [v9 _maps_mapsSceneDelegate];
  id v11 = [v10 topMostPresentedViewController];

  if ([(LookAroundTrayContaineeViewController *)v11 conformsToProtocol:&OBJC_PROTOCOL___ContaineeProtocol])
  {

    goto LABEL_4;
  }
  if (v11 != v6)
  {
    v15 = [(LookAroundTrayContaineeViewController *)v6 presentedViewController];

    if (v15 == v11) {
      [(LookAroundTrayContaineeViewController *)v11 dismissViewControllerAnimated:1 completion:0];
    }
  }

LABEL_12:
}

- (void)viewControllerPresentLookAround:(id)a3 showsFullScreen:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained animateTransitionToFullScreen:v4];
}

- (void)viewController:(id)a3 presentPlaceCardForItem:(id)a4
{
}

- (void)viewController:(id)a3 presentPlaceCardForItem:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v17 = a4;
  id v7 = [(LookAroundActionCoordinator *)self placeCardViewController];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v9 = [WeakRetained currentViewController];

  id v10 = [v7 placeCardItem];
  id v11 = [v10 mapItem];
  id v12 = [v11 _geoMapItem];

  id v13 = [v17 mapItem];
  dispatch_time_t v14 = [v13 _geoMapItem];

  char IsEqualToMapItemForPurpose = GEOMapItemIsEqualToMapItemForPurpose();
  if (v9 == v7 && (IsEqualToMapItemForPurpose & 1) != 0)
  {
    v16 = [v7 cardPresentationController];
    [v16 wantsLayout:2];
  }
  else
  {
    [(LookAroundActionCoordinator *)self _captureLookAroundUserAction:21 onTarget:201];
    [v7 setPlaceCardItem:v17 withHistory:0];
    v16 = objc_loadWeakRetained((id *)&self->_containerViewController);
    [v16 presentController:v7 animated:v5];
  }
}

- (void)presentFromContainerViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 setContaineeDelegate:self];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  [WeakRetained presentController:v6 animated:v4];
}

- (void)viewControllerPresentTray:(id)a3 showsFullScreen:(BOOL)a4 usingLookAroundView:(id)a5
{
  BOOL v5 = a4;
  p_containerViewController = &self->_containerViewController;
  id v9 = a5;
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_containerViewController);
  id v11 = [(LookAroundActionCoordinator *)self trayContaineeViewControllerWithLookAroundView:v9];

  [WeakRetained presentController:v11 animated:0];
  [(LookAroundActionCoordinator *)self viewControllerPresentLookAround:v12 showsFullScreen:v5];
}

- (void)viewControllerPresentTTR:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  BOOL v5 = [WeakRetained lookAroundView];
  id v6 = [v5 sharingURL];
  id v7 = [v6 absoluteString];
  uint64_t v8 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  id v9 = [v7 stringByAddingPercentEncodingWithAllowedCharacters:v8];

  id v10 = +[NSString stringWithFormat:@"Summary:\n\nSteps to Reproduce:\n\nResults:\n\nTest Environment:\n\nShare Link:\n%@", v9];
  id v11 = objc_opt_new();
  [v11 setTitle:@"[LookAround] "];
  [v11 setDescriptionText:v10];
  id v12 = +[MapsRadarComponent mapsComponent];
  [v11 setComponent:v12];

  if (qword_101610580 != -1) {
    dispatch_once(&qword_101610580, &stru_1013150D0);
  }
  id v13 = (id)qword_101610578;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v14 = self;
    if (!v14)
    {
      v19 = @"<nil>";
      goto LABEL_12;
    }
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      id v17 = [(LookAroundActionCoordinator *)v14 performSelector:"accessibilityIdentifier"];
      v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

        goto LABEL_10;
      }
    }
    v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_10:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    v22 = v19;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Launching TTR for lookaround", buf, 0xCu);
  }
  v20 = +[MapsRadarController sharedInstance];
  [v20 launchTTRWithRadar:v11];
}

- (void)viewController:(id)a3 pickCollectionWithSession:(id)a4 sourceView:(id)a5 sourceRect:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  id v12 = a5;
  id v13 = a4;
  dispatch_time_t v14 = -[CollectionPicker initWithCollectionEditSession:sourceView:sourceRect:]([CollectionPicker alloc], "initWithCollectionEditSession:sourceView:sourceRect:", v13, v12, x, y, width, height);

  collectionPicker = self->_collectionPicker;
  self->_collectionPicker = v14;

  [(CollectionPicker *)self->_collectionPicker setDelegate:self];
  v16 = self->_collectionPicker;
  v17[4] = self;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100A4429C;
  v18[3] = &unk_1013150B0;
  v18[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100A44314;
  v17[3] = &unk_1012E7480;
  [(CollectionPicker *)v16 viewControllerToPresentIfContainee:v18 ifAlertController:v17];
}

- (void)viewController:(id)a3 dismissAnimated:(BOOL)a4 completion:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = [v6 macPopoverPresentationController];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100A44458;
    v9[3] = &unk_1012E6EA8;
    id v10 = v7;
    [v8 dismissAnimated:1 completion:v9];
  }
}

- (void)viewController:(id)a3 openURL:(id)a4
{
  id v5 = a4;
  id v6 = [MapsWebLinkPresenter alloc];
  id v7 = [(LookAroundActionCoordinator *)self containerViewController];
  uint64_t v8 = [(MapsWebLinkPresenter *)v6 initWithPresentingViewController:v7];

  [(MapsWebLinkPresenter *)v8 presentWebURL:v5];
}

- (void)poiEnrichmentCoordinator:(id)a3 requestPresentingViewControllerWithBlock:(id)a4
{
  id v5 = a4;
  placeCardViewController = self->_placeCardViewController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A445AC;
  v8[3] = &unk_1012E5F78;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  [(LookAroundActionCoordinator *)self viewController:placeCardViewController dismissAnimated:1 completion:v8];
}

- (void)didDismissViewController:(id)a3 mapItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[PlaceCardItem alloc] initWithMapItem:v6];

  [(LookAroundActionCoordinator *)self viewController:v7 presentPlaceCardForItem:v8];
}

- (void)exitLookAround
{
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  uint64_t v4 = sub_1000BBB44(WeakRetained);

  id v5 = objc_loadWeakRetained((id *)&self->_containerViewController);
  unsigned int v6 = [v5 isDisplayingLookAroundPIP];
  double v7 = 0.26;
  if (v4 != 5) {
    double v7 = 0.0;
  }
  if (v6) {
    double v8 = 0.75;
  }
  else {
    double v8 = v7;
  }

  id v9 = objc_loadWeakRetained((id *)&self->_containerViewController);
  [v9 prepareForExit];

  id v10 = [(LookAroundActionCoordinator *)self dataCoordinator];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100A447EC;
  v11[3] = &unk_1012E6708;
  objc_copyWeak(&v12, &location);
  [v10 exitLookAroundPIPAfter:v11 withCompletion:v8];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)activityViewControllerForPlaceViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  uint64_t v4 = [WeakRetained createActivityViewControllerForCurrentContext];

  return v4;
}

- (int64_t)overriddenInterfaceStyleForPlaceViewControllerSubviews:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  unsigned __int8 v6 = [WeakRetained isDisplayingLookAroundFullScreen];

  if (v6) {
    int64_t v7 = 2;
  }
  else {
    int64_t v7 = (int64_t)[v4 preferredUserInterfaceStyle];
  }

  return v7;
}

- (void)_registerBackgroundNotifications
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleEnterToBackgroundNotification:" name:UISceneDidEnterBackgroundNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_handleEnterToForegroundNotification:" name:UISceneWillEnterForegroundNotification object:0];
}

- (void)_handleEnterToForegroundNotification:(id)a3
{
  id v4 = [a3 object];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  unsigned __int8 v6 = [WeakRetained _maps_uiScene];

  if (v4 == v6)
  {
    +[GEOAPPortal captureLookAroundUserAction:6058 onTarget:0 eventValue:0];
  }
}

- (void)_handleEnterToBackgroundNotification:(id)a3
{
  id v4 = [a3 object];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  unsigned __int8 v6 = [WeakRetained _maps_uiScene];

  if (v4 == v6)
  {
    +[GEOAPPortal captureLookAroundUserAction:6059 onTarget:0 eventValue:0];
  }
}

- (BOOL)pptTestCanUpdateTrayLayout
{
  return 0;
}

- (BOOL)pptTestIsTrayType:(int64_t)a3
{
  if (a3 != 3) {
    return 0;
  }
  v3 = [(LookAroundActionCoordinator *)self containerViewController];
  unsigned __int8 v4 = [v3 isDisplayingLookAroundFullScreen];

  return v4;
}

- (void)pptTestDismissTrayAnimated:(BOOL)a3 assertTrayType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 2)
  {
    BOOL v5 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained popLastViewControllerAnimated:v5];
  }
}

- (UIScrollView)pptTestScrollView
{
  return 0;
}

- (void)_captureLookAroundUserAction:(int)a3 onTarget:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  id v16 = [WeakRetained lookAroundView];

  [v16 centerCoordinate];
  id v9 = [objc_alloc((Class)GEOLocation) initWithLatitude:v7 longitude:v8];
  [v16 presentationYaw];
  double v11 = v10;
  id v12 = [v16 visiblePlaceMUIDs];
  id v13 = [v12 count];
  if ([v16 showsRoadLabels]) {
    unsigned __int8 v14 = 1;
  }
  else {
    unsigned __int8 v14 = [v16 showsPointLabels];
  }
  LOBYTE(v15) = v14;
  +[GEOAPPortal captureLookAroundUserAction:v5 onTarget:v4 eventValue:0 location:v9 heading:v11 zoom:v13 numberPoisInView:0.0 labelingShown:v15];
}

- (AppCoordinator)appCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);

  return (AppCoordinator *)WeakRetained;
}

- (void)setAppCoordinator:(id)a3
{
}

- (LookAroundContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (LookAroundContainerViewController *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_appCoordinator);
  objc_storeStrong((id *)&self->_collectionPicker, 0);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_dataCoordinator, 0);
  objc_storeStrong((id *)&self->_placeCardViewController, 0);

  objc_storeStrong((id *)&self->_trayContaineeViewController, 0);
}

- (int64_t)displayedViewMode
{
  v2 = [(LookAroundActionCoordinator *)self containerViewController];
  v3 = [v2 chromeViewController];
  id v4 = [v3 displayedViewMode];

  return (int64_t)v4;
}

- (GEOMapServiceTraits)newTraits
{
  v2 = [(LookAroundActionCoordinator *)self containerViewController];
  v3 = [v2 chromeViewController];
  id v4 = [v3 currentTraits];

  return v4;
}

- (void)placeCardViewController:(id)a3 didSelectParent:(id)a4
{
  id v5 = a4;
  id v6 = [(LookAroundActionCoordinator *)self appCoordinator];
  [v6 openParentMapItem:v5];
}

- (void)placeCardViewController:(id)a3 doDirectionItem:(id)a4 userInfo:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(LookAroundActionCoordinator *)self appCoordinator];
  [v9 enterRoutePlanningWithDirectionItem:v8 withUserInfo:v7];
}

- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  return 0;
}

- (void)placeCardViewController:(id)a3 showCollection:(id)a4
{
  id v5 = a4;
  id v6 = [(LookAroundActionCoordinator *)self appCoordinator];
  [v6 openCollection:v5];
}

- (void)placeCardViewController:(id)a3 showRelatedMapItems:(id)a4 withTitle:(id)a5 originalMapItem:(id)a6 analyticsDelegate:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = [(LookAroundActionCoordinator *)self appCoordinator];
  [v15 openRelatedMapItems:v14 withTitle:v13 originalMapItem:v12 analyticsDelegate:v11];
}

- (void)placeCardViewController:(id)a3 showCuratedCollection:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)MKMapItemIdentifier);
  id v7 = [v5 collectionIdentifier];

  id v9 = [v6 initWithGEOMapItemIdentifier:v7];
  id v8 = [(LookAroundActionCoordinator *)self appCoordinator];
  [v8 openCuratedCollectionWithIdentifier:v9];
}

- (void)placeCardViewController:(id)a3 selectExploreGuidesWithGuideLocation:(id)a4
{
  id v5 = a4;
  id v6 = [(LookAroundActionCoordinator *)self appCoordinator];
  [v6 openGuidesHomeWithGuideLocation:v5];
}

- (void)placeCardViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(LookAroundActionCoordinator *)self appCoordinator];
  [v10 openCuratedCollectionsList:v9 usingTitle:v8];
}

- (void)placeCardViewController:(id)a3 presentPOIEnrichmentWithCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(LookAroundActionCoordinator *)self containerViewController];
  [v6 setContainerViewController:v8];

  id v9 = [v7 containeeDelegate];

  [v6 setContaineeDelegate:v9];
  [v6 setPresentationDelegate:self];
  id v10 = [(LookAroundActionCoordinator *)self appCoordinator];
  [v10 presentPOIEnrichmentWithCoordinator:v6];
}

- (void)placeCardViewController:(id)a3 requestCopyLinkToClipboard:(id)a4
{
  id v5 = a4;
  id v7 = [(LookAroundActionCoordinator *)self containerViewController];
  id v6 = [v7 chromeViewController];
  [v6 copy:v5];
}

@end