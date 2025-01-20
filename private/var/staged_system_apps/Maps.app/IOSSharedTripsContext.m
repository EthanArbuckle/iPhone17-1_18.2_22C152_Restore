@interface IOSSharedTripsContext
- (ActionCoordination)delegate;
- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4;
- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5;
- (BOOL)provideAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4;
- (ChromeViewController)chromeViewController;
- (GEOMapServiceTraits)newTraits;
- (id)cameraController;
- (id)desiredCards;
- (id)mapView;
- (id)personalizedItemManager;
- (id)routeAnnotationsController;
- (id)searchPinsManager;
- (id)sharedTripsAnnotationsController;
- (id)windowScene;
- (int64_t)displayedViewMode;
- (void)_presentCardForSharedTrip:(id)a3;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)closeSharedTripDetail;
- (void)closeStopDetail;
- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4;
- (void)container:(id)a3 containee:(id)a4 didChangeLayout:(unint64_t)a5;
- (void)didRequestContactsCard;
- (void)didRequestDirectionsForSharedTrip:(id)a3;
- (void)didSelectStopWithMapItem:(id)a3;
- (void)dismiss;
- (void)dismissContactsViewController;
- (void)placeCardViewController:(id)a3 didSelectParent:(id)a4;
- (void)placeCardViewController:(id)a3 dismissAnimated:(BOOL)a4 completion:(id)a5;
- (void)placeCardViewController:(id)a3 doDirectionItem:(id)a4 userInfo:(id)a5;
- (void)placeCardViewController:(id)a3 openURL:(id)a4;
- (void)placeCardViewController:(id)a3 requestCopyLinkToClipboard:(id)a4;
- (void)placeCardViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6;
- (void)placeCardViewController:(id)a3 selectExploreGuidesWithGuideLocation:(id)a4;
- (void)placeCardViewController:(id)a3 showCollection:(id)a4;
- (void)placeCardViewController:(id)a3 showCuratedCollection:(id)a4;
- (void)placeCardViewController:(id)a3 showRelatedMapItems:(id)a4 withTitle:(id)a5 originalMapItem:(id)a6 analyticsDelegate:(id)a7;
- (void)presentDetailsForSelectedTrip;
- (void)presentErrorForChinaTrip:(id)a3;
- (void)presentErrorForUnsupportedProtocolOrTransportWithTrip:(id)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation IOSSharedTripsContext

- (int64_t)displayedViewMode
{
  v2 = [(IOSSharedTripsContext *)self iosBasedChromeViewController];
  id v3 = [v2 displayedViewMode];

  return (int64_t)v3;
}

- (GEOMapServiceTraits)newTraits
{
  v2 = [(IOSSharedTripsContext *)self chromeViewController];
  id v3 = [v2 currentTraits];

  return v3;
}

- (void)placeCardViewController:(id)a3 didSelectParent:(id)a4
{
  id v5 = a4;
  id v7 = [(IOSSharedTripsContext *)self iosBasedChromeViewController];
  v6 = [v7 appCoordinator];
  [v6 openParentMapItem:v5];
}

- (void)placeCardViewController:(id)a3 doDirectionItem:(id)a4 userInfo:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v10 = [(IOSSharedTripsContext *)self iosBasedChromeViewController];
  v9 = [v10 appCoordinator];
  [v9 enterRoutePlanningWithDirectionItem:v8 withUserInfo:v7];
}

- (BOOL)placeCardViewController:(id)a3 shouldShowTransitScheduleForMapItem:(id)a4 departureSequence:(id)a5
{
  return 0;
}

- (void)placeCardViewController:(id)a3 showCollection:(id)a4
{
  id v5 = a4;
  id v7 = [(IOSSharedTripsContext *)self iosBasedChromeViewController];
  v6 = [v7 appCoordinator];
  [v6 openCollection:v5];
}

- (void)placeCardViewController:(id)a3 showRelatedMapItems:(id)a4 withTitle:(id)a5 originalMapItem:(id)a6 analyticsDelegate:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v16 = [(IOSSharedTripsContext *)self iosBasedChromeViewController];
  v15 = [v16 appCoordinator];
  [v15 openRelatedMapItems:v14 withTitle:v13 originalMapItem:v12 analyticsDelegate:v11];
}

- (void)placeCardViewController:(id)a3 showCuratedCollection:(id)a4
{
  id v5 = a4;
  id v6 = objc_alloc((Class)MKMapItemIdentifier);
  id v7 = [v5 collectionIdentifier];

  id v10 = [v6 initWithGEOMapItemIdentifier:v7];
  id v8 = [(IOSSharedTripsContext *)self iosBasedChromeViewController];
  v9 = [v8 appCoordinator];
  [v9 openCuratedCollectionWithIdentifier:v10];
}

- (void)placeCardViewController:(id)a3 selectExploreGuidesWithGuideLocation:(id)a4
{
  id v5 = a4;
  id v7 = [(IOSSharedTripsContext *)self iosBasedChromeViewController];
  id v6 = [v7 appCoordinator];
  [v6 openGuidesHomeWithGuideLocation:v5];
}

- (void)placeCardViewController:(id)a3 seeAllCollections:(id)a4 usingTitle:(id)a5 usingCollectionIds:(id)a6
{
  id v8 = a5;
  id v9 = a4;
  id v11 = [(IOSSharedTripsContext *)self iosBasedChromeViewController];
  id v10 = [v11 appCoordinator];
  [v10 openCuratedCollectionsList:v9 usingTitle:v8];
}

- (void)placeCardViewController:(id)a3 dismissAnimated:(BOOL)a4 completion:(id)a5
{
}

- (void)placeCardViewController:(id)a3 requestCopyLinkToClipboard:(id)a4
{
  id v5 = a4;
  id v6 = [(IOSSharedTripsContext *)self chromeViewController];
  [v6 copy:v5];
}

- (void)placeCardViewController:(id)a3 openURL:(id)a4
{
  id v5 = a4;
  id v6 = [MapsWebLinkPresenter alloc];
  id v7 = [(IOSSharedTripsContext *)self chromeViewController];
  id v8 = [(MapsWebLinkPresenter *)v6 initWithPresentingViewController:v7];

  [(MapsWebLinkPresenter *)v8 presentWebURL:v5];
}

- (void)setChromeViewController:(id)a3
{
}

- (id)desiredCards
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  v4 = v3;
  if (self->_listContaineeController) {
    [v3 addObject:];
  }
  if (self->_sharedTripInfoController) {
    [v4 addObject:];
  }
  if (self->_placeCardViewController) {
    [v4 addObject:];
  }

  return v4;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5 = a4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1009783C8;
  v6[3] = &unk_1012E6300;
  unsigned __int8 v7 = [v5 isAnimated];
  v6[4] = self;
  [v5 addPreparation:v6];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5 = a4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100978510;
  v6[3] = &unk_1012E6300;
  unsigned __int8 v7 = [v5 isAnimated];
  v6[4] = self;
  [v5 addPreparation:v6];
}

- (id)windowScene
{
  v2 = [(IOSSharedTripsContext *)self chromeViewController];
  id v3 = [v2 view];
  v4 = [v3 window];
  id v5 = [v4 windowScene];

  return v5;
}

- (void)container:(id)a3 containee:(id)a4 didChangeLayout:(unint64_t)a5
{
}

- (void)containeeViewControllerGoToPreviousState:(id)a3 withSender:(id)a4
{
  if (self->_placeCardViewController == a3) {
    [(IOSSharedTripsContext *)self closeStopDetail];
  }
}

- (void)didSelectStopWithMapItem:(id)a3
{
  id v18 = a3;
  v4 = [[PlaceCardItem alloc] initWithMapItem:v18];
  placeCardViewController = self->_placeCardViewController;
  if (!placeCardViewController)
  {
    id v6 = objc_alloc_init(PlaceCardViewController);
    unsigned __int8 v7 = self->_placeCardViewController;
    self->_placeCardViewController = v6;

    [(PlaceCardViewController *)self->_placeCardViewController setExcludedContent:0x3FFFLL];
    [(PlaceCardViewController *)self->_placeCardViewController setPlaceCardDelegate:self];
    [(InfoCardViewController *)self->_placeCardViewController setContaineeDelegate:self];
    placeCardViewController = self->_placeCardViewController;
  }
  [(PlaceCardViewController *)placeCardViewController setPlaceCardItem:v4 withHistory:0];
  id v8 = [(IOSSharedTripsContext *)self chromeViewController];
  [v8 setNeedsUpdateComponent:@"cards" animated:1];

  id v9 = [v18 _displayMapRegion];
  GEOMapRectForMapRegion();
  MKCoordinateRegion v21 = MKCoordinateRegionForMapRect(v20);
  double latitude = v21.center.latitude;
  double longitude = v21.center.longitude;
  double latitudeDelta = v21.span.latitudeDelta;
  double longitudeDelta = v21.span.longitudeDelta;

  id v14 = [(IOSSharedTripsContext *)self chromeViewController];
  v15 = [v14 mapView];
  [v15 setRegion:1 latitude:latitude longitude:longitude latitudeDelta:latitudeDelta longitudeDelta:longitudeDelta];

  id v16 = [(IOSSharedTripsContext *)self chromeViewController];
  v17 = [v16 mapSelectionManager];
  [v17 selectMapItem:v18 animated:1];
}

- (void)closeStopDetail
{
  placeCardViewController = self->_placeCardViewController;
  if (placeCardViewController)
  {
    self->_placeCardViewController = 0;

    id v4 = [(IOSSharedTripsContext *)self chromeViewController];
    [v4 setNeedsUpdateComponent:@"cards" animated:1];
  }
}

- (void)closeSharedTripDetail
{
  id v3 = [(SharedTripsContext *)self sharedTrips];
  if ((unint64_t)[v3 count] < 2)
  {
  }
  else
  {
    listContaineeController = self->_listContaineeController;

    if (listContaineeController)
    {
      [(SharedTripsContext *)self setSelectedTrip:0];
      sharedTripInfoController = self->_sharedTripInfoController;
      self->_sharedTripInfoController = 0;

      id v6 = [(IOSSharedTripsContext *)self chromeViewController];
      [v6 setNeedsUpdateComponent:@"cards" animated:1];

      return;
    }
  }

  [(IOSSharedTripsContext *)self dismiss];
}

- (id)cameraController
{
  v2 = [(IOSSharedTripsContext *)self iosBasedChromeViewController];
  id v3 = [v2 mapCameraController];

  return v3;
}

- (id)mapView
{
  v2 = [(IOSSharedTripsContext *)self chromeViewController];
  id v3 = [v2 mapView];

  return v3;
}

- (id)personalizedItemManager
{
  v2 = [(IOSSharedTripsContext *)self iosBasedChromeViewController];
  id v3 = [v2 personalizedItemManager];

  return v3;
}

- (id)routeAnnotationsController
{
  v2 = [(IOSSharedTripsContext *)self iosBasedChromeViewController];
  id v3 = [v2 routeAnnotationsController];

  return v3;
}

- (id)searchPinsManager
{
  v2 = [(IOSSharedTripsContext *)self iosBasedChromeViewController];
  id v3 = [v2 searchPinsManager];

  return v3;
}

- (id)sharedTripsAnnotationsController
{
  v2 = [(IOSSharedTripsContext *)self iosBasedChromeViewController];
  id v3 = [v2 sharedTripsAnnotationsController];

  return v3;
}

- (void)presentDetailsForSelectedTrip
{
  id v3 = [(SharedTripsContext *)self selectedTrip];

  if (v3)
  {
    id v4 = [(SharedTripsContext *)self selectedTrip];
    -[IOSSharedTripsContext _presentCardForSharedTrip:](self, "_presentCardForSharedTrip:");
  }
  else
  {
    if (!self->_sharedTripInfoController) {
      return;
    }
    id v4 = [(IOSSharedTripsContext *)self chromeViewController];
    [v4 setNeedsUpdateComponent:@"cards" animated:1];
  }
}

- (void)presentErrorForChinaTrip:(id)a3
{
  id v4 = a3;
  id v5 = [(IOSSharedTripsContext *)self delegate];
  [v5 presentChinaAlertForSharedTrip:v4];
}

- (void)presentErrorForUnsupportedProtocolOrTransportWithTrip:(id)a3
{
  id v4 = a3;
  id v5 = [(IOSSharedTripsContext *)self delegate];
  [v5 presentUnsupportedTransportTypeOrProtocolAlertForSharedTrip:v4];
}

- (BOOL)provideAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SharedTripsContext *)self sharedTrips];
  id v9 = [v8 count];
  if (v9)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100978D28;
    block[3] = &unk_1012E80F0;
    id v12 = v6;
    id v13 = v8;
    id v14 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v9 != 0;
}

- (void)_presentCardForSharedTrip:(id)a3
{
  id v4 = a3;
  id v5 = [[SharedTripContaineeViewController alloc] initWithSharedTrip:v4];

  sharedTripInfoController = self->_sharedTripInfoController;
  self->_sharedTripInfoController = v5;

  [(SharedTripContaineeViewController *)self->_sharedTripInfoController setActionDelegate:self];
  id v7 = [(IOSSharedTripsContext *)self chromeViewController];
  [v7 setNeedsUpdateComponent:@"cards" animated:1];
}

- (void)didRequestDirectionsForSharedTrip:(id)a3
{
  id v4 = a3;
  id v5 = [(IOSSharedTripsContext *)self chromeViewController];
  [v5 popContextAnimated:1 completion:0];

  id v6 = [v4 destinationWaypointMapItem];

  id v7 = +[MKMapItem _itemWithGeoMapItem:v6];
  id v12 = v7;
  id v8 = +[NSArray arrayWithObjects:&v12 count:1];
  id v10 = MKLaunchOptionsDirectionsModeKey;
  id v11 = MKLaunchOptionsDirectionsModeDefault;
  id v9 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  +[MKMapItem openMapsWithItems:v8 launchOptions:v9 completionHandler:&stru_101312160];
}

- (void)didRequestContactsCard
{
  id v3 = +[AddressBookManager sharedManager];
  id v4 = [(SharedTripsContext *)self selectedTrip];
  id v5 = [v4 senderInfo];
  id v6 = [v5 localContactIdentifier];
  id v7 = [v3 contactForCNContactIdentifier:v6];

  if (v7)
  {
    id v8 = +[CNContactViewController viewControllerForContact:v7];
    [v8 setDelegate:self];
    id v9 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"dismissContactsViewController"];
    id v10 = [v8 navigationItem];
    [v10 setBackBarButtonItem:v9];

    [v8 setDisplayMode:1];
    id v11 = (UIViewController *)[objc_alloc((Class)UINavigationController) initWithRootViewController:v8];
    contactsViewController = self->_contactsViewController;
    self->_contactsViewController = v11;
    id v13 = v11;

    id v14 = [(IOSSharedTripsContext *)self chromeViewController];
    [v14 _maps_topMostPresentViewController:self->_contactsViewController animated:1 completion:0];
  }
  else
  {
    v15 = sub_100576A9C();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "didRequestContactsCard called with no contact present", v16, 2u);
    }
  }
}

- (void)dismissContactsViewController
{
}

- (BOOL)contactViewController:(id)a3 shouldPerformDefaultActionForContactProperty:(id)a4
{
  return 1;
}

- (void)dismiss
{
  id v3 = [(IOSSharedTripsContext *)self chromeViewController];
  unsigned int v4 = [v3 isCurrentContext:self];

  id v5 = [(IOSSharedTripsContext *)self chromeViewController];
  id v10 = v5;
  if (v4)
  {
    [v5 popContextAnimated:1 completion:0];
    id v6 = v10;
  }
  else
  {
    id v7 = [v5 contexts];
    id v8 = [v7 mutableCopy];

    [v8 removeObject:self];
    id v9 = [(IOSSharedTripsContext *)self chromeViewController];
    [v9 setContexts:v8 animated:0 completion:0];

    id v6 = v8;
  }
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (ActionCoordination)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ActionCoordination *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_contactsViewController, 0);
  objc_storeStrong((id *)&self->_placeCardViewController, 0);
  objc_storeStrong((id *)&self->_sharedTripInfoController, 0);

  objc_storeStrong((id *)&self->_listContaineeController, 0);
}

@end