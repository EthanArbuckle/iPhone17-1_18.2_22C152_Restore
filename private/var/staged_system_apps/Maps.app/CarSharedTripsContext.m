@interface CarSharedTripsContext
- (BOOL)provideAttachmentsForRadarDraft:(id)a3 withCompletion:(id)a4;
- (BOOL)usesDefaultTransitions;
- (CarSharedTripsContext)init;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (id)_transportTypeStringForAnalytics;
- (id)cameraController;
- (id)desiredCards;
- (id)mapView;
- (id)personalizedItemSources;
- (id)routeAnnotationsController;
- (id)searchPinsManager;
- (id)sharedTripsAnnotationsController;
- (int)backButtonUsageActionToContext:(id)a3;
- (int)currentUsageTarget;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)carCardViewCloseButtonTapped:(id)a3;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)dismiss;
- (void)layoutForUnobscuredBoundsChange;
- (void)presentDetailsForSelectedTrip;
- (void)presentErrorForChinaTrip:(id)a3;
- (void)presentErrorForUnsupportedProtocolOrTransportWithTrip:(id)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)sharedTripDetailCard:(id)a3 didSelectAction:(unint64_t)a4;
@end

@implementation CarSharedTripsContext

- (CarSharedTripsContext)init
{
  v20.receiver = self;
  v20.super_class = (Class)CarSharedTripsContext;
  v2 = [(SharedTripsContext *)&v20 init];
  v3 = v2;
  if (v2)
  {
    v4 = [(SharedTripsContext *)v2 sharedTrips];
    id v5 = [v4 count];

    if ((unint64_t)v5 < 2)
    {
      v9 = [(SharedTripsContext *)v3 sharedTrips];
      id v10 = [v9 count];

      if (v10 == (id)1)
      {
        v11 = [CarSharedTripDetailCardViewController alloc];
        v12 = [(SharedTripsContext *)v3 sharedTrips];
        v13 = [v12 firstObject];
        v14 = [(CarSharedTripDetailCardViewController *)v11 initWithSharedTrip:v13 delegate:v3];
        selectedSharedTripCardViewController = v3->_selectedSharedTripCardViewController;
        v3->_selectedSharedTripCardViewController = v14;
      }
    }
    else
    {
      objc_initWeak(&location, v3);
      v6 = [CarSharedTripsCardViewController alloc];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_100C27918;
      v17[3] = &unk_10131BB08;
      objc_copyWeak(&v18, &location);
      v7 = [(CarSharedTripsCardViewController *)v6 initWithSelectionHandler:v17];
      listCardViewController = v3->_listCardViewController;
      v3->_listCardViewController = v7;

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
  return v3;
}

- (void)dismiss
{
  id v3 = +[CarChromeModeCoordinator sharedInstance];
  [v3 popFromContext:self];
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100C27B3C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Becoming top context", buf, 0xCu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100C27B90;
  v10[3] = &unk_1012E5CE0;
  unsigned __int8 v12 = [v7 isAnimated];
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 addPreparation:v10];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5 = a4;
  id v6 = sub_100C27B3C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Resigning top context", buf, 0xCu);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100C27DB8;
  v7[3] = &unk_1012E6300;
  unsigned __int8 v8 = [v5 isAnimated];
  v7[4] = self;
  [v5 addPreparation:v7];
}

- (id)desiredCards
{
  selectedSharedTripCardViewController = self->_selectedSharedTripCardViewController;
  if (self->_listCardViewController)
  {
    if (selectedSharedTripCardViewController)
    {
      v9[0] = @"SharedTrip.List";
      v9[1] = @"SharedTrip.Selected";
      id v3 = (const __CFString **)v9;
      uint64_t v4 = 2;
LABEL_8:
      id v5 = +[NSArray arrayWithObjects:v3 count:v4];
      goto LABEL_9;
    }
    CFStringRef v8 = @"SharedTrip.List";
    id v3 = &v8;
LABEL_7:
    uint64_t v4 = 1;
    goto LABEL_8;
  }
  if (selectedSharedTripCardViewController)
  {
    CFStringRef v7 = @"SharedTrip.Selected";
    id v3 = &v7;
    goto LABEL_7;
  }
  id v5 = &__NSArray0__struct;
LABEL_9:

  return v5;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = sub_100C27B3C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349314;
    v52 = self;
    __int16 v53 = 2112;
    id v54 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Configuring card for key: %@", buf, 0x16u);
  }

  if ([v7 isEqualToString:@"SharedTrip.List"])
  {
    [v6 setContent:self->_listCardViewController];
    id v9 = +[NSBundle mainBundle];
    id v10 = [v9 localizedStringForKey:@"CarPlay_SharedTrips_List_Title" value:@"localized string not found" table:0];
    [v6 setTitle:v10];

    [v6 setAccessory:1];
    v38[0] = xmmword_100F6F1C0;
    v38[1] = xmmword_100F67600;
    uint64_t v39 = 3;
    uint64_t v40 = 1148846080;
    uint64_t v41 = 2;
    int v42 = 1148846080;
    uint64_t v43 = 0;
    uint64_t v44 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    long long v45 = _Q0;
    long long v46 = _Q0;
    char v47 = 1;
    memset(v48, 0, sizeof(v48));
    uint64_t v49 = 8;
    char v50 = 0;
    if (v6)
    {
      v16 = v38;
LABEL_9:
      [v6 setLayout:v16];
    }
  }
  else if ([v7 isEqualToString:@"SharedTrip.Selected"])
  {
    p_selectedSharedTripCardViewController = &self->_selectedSharedTripCardViewController;
    [v6 setContent:self->_selectedSharedTripCardViewController];
    id v18 = +[NSBundle mainBundle];
    v19 = [v18 localizedStringForKey:@"CarPlay_SharedTrip_Detail_Title" value:@"localized string not found" table:0];
    objc_super v20 = [(CarSharedTripDetailCardViewController *)*p_selectedSharedTripCardViewController sharedTrip];
    v21 = [v20 senderInfo];
    v22 = [v21 localName];
    v23 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v22);
    [v6 setTitle:v23];

    [v6 setAccessory:1];
    v25[0] = xmmword_100F6F1C0;
    v25[1] = xmmword_100F67600;
    uint64_t v26 = 3;
    uint64_t v27 = 1148846080;
    uint64_t v28 = 2;
    int v29 = 1148846080;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    long long v32 = _Q0;
    long long v33 = _Q0;
    char v34 = 1;
    memset(v35, 0, sizeof(v35));
    uint64_t v36 = 8;
    char v37 = 0;
    if (v6)
    {
      v16 = v25;
      goto LABEL_9;
    }
  }
}

- (void)carCardViewCloseButtonTapped:(id)a3
{
  uint64_t v4 = sub_100C27B3C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v11 = 134349056;
    unsigned __int8 v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Close button tapped", (uint8_t *)&v11, 0xCu);
  }

  if (self->_selectedSharedTripCardViewController && self->_listCardViewController)
  {
    id v5 = sub_100C27B3C();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v11 = 134349056;
      unsigned __int8 v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Clearing selected trip", (uint8_t *)&v11, 0xCu);
    }

    [(SharedTripsContext *)self setSelectedTrip:0];
  }
  else
  {
    id v6 = [(CarSharedTripsContext *)self chromeViewController];
    unsigned int v7 = [v6 isTopContext:self];

    if (v7)
    {
      CFStringRef v8 = sub_100C27B3C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 134349056;
        unsigned __int8 v12 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}p] Popping context", (uint8_t *)&v11, 0xCu);
      }

      id v9 = +[CarChromeModeCoordinator sharedInstance];
      [v9 popFromContext:self];
    }
  }
  id v10 = [(CarSharedTripsContext *)self chromeViewController];
  [v10 captureUserAction:4];
}

- (void)layoutForUnobscuredBoundsChange
{
}

- (id)personalizedItemSources
{
  annotationsController = self->_annotationsController;
  if (annotationsController)
  {
    id v3 = [(SharedTripsAnnotationsController *)annotationsController itemSource];
    id v6 = v3;
    uint64_t v4 = +[NSArray arrayWithObjects:&v6 count:1];
  }
  else
  {
    uint64_t v4 = &__NSArray0__struct;
  }

  return v4;
}

- (id)cameraController
{
  v2 = [(CarSharedTripsContext *)self chromeViewController];
  id v3 = [v2 mapCameraController];

  return v3;
}

- (id)mapView
{
  v2 = [(CarSharedTripsContext *)self chromeViewController];
  id v3 = [v2 mapView];

  return v3;
}

- (id)routeAnnotationsController
{
  v2 = [(CarSharedTripsContext *)self chromeViewController];
  id v3 = [v2 routeAnnotationsController];

  return v3;
}

- (id)searchPinsManager
{
  v2 = [(CarSharedTripsContext *)self chromeViewController];
  id v3 = [v2 searchPinsManager];

  return v3;
}

- (id)sharedTripsAnnotationsController
{
  annotationsController = self->_annotationsController;
  if (!annotationsController)
  {
    uint64_t v4 = objc_alloc_init(SharedTripsAnnotationsController);
    id v5 = self->_annotationsController;
    self->_annotationsController = v4;

    annotationsController = self->_annotationsController;
  }

  return annotationsController;
}

- (void)presentDetailsForSelectedTrip
{
  id v3 = [(SharedTripsContext *)self selectedTrip];

  if (v3)
  {
    uint64_t v4 = [CarSharedTripDetailCardViewController alloc];
    id v5 = [(SharedTripsContext *)self selectedTrip];
    id v6 = [(CarSharedTripDetailCardViewController *)v4 initWithSharedTrip:v5 delegate:self];
    selectedSharedTripCardViewController = self->_selectedSharedTripCardViewController;
    self->_selectedSharedTripCardViewController = v6;
  }
  else
  {
    CFStringRef v8 = self->_selectedSharedTripCardViewController;
    if (!v8) {
      return;
    }
    self->_selectedSharedTripCardViewController = 0;

    [(CarSharedTripsCardViewController *)self->_listCardViewController clearSelection];
  }
  id v9 = [(CarSharedTripsContext *)self chromeViewController];
  [v9 updateCardsForContext:self animated:1];
}

- (void)presentErrorForChinaTrip:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[CarDisplayController sharedInstance];
  v9[0] = @"kMapsInterruptionTitle";
  id v5 = [v3 alertTitleForDisallowedDetails];
  v9[1] = @"kMapsInterruptionMessage";
  v10[0] = v5;
  id v6 = [v3 alertMessageForChinaError];

  v10[1] = v6;
  unsigned int v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v8 = [v4 presentInterruptionOfKind:13 userInfo:v7 completionHandler:0];
}

- (void)presentErrorForUnsupportedProtocolOrTransportWithTrip:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[CarDisplayController sharedInstance];
  v9[0] = @"kMapsInterruptionTitle";
  id v5 = [v3 alertTitleForDisallowedDetails];
  v9[1] = @"kMapsInterruptionMessage";
  v10[0] = v5;
  id v6 = [v3 alertMessageForTransportOrProtocolError];

  v10[1] = v6;
  unsigned int v7 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v8 = [v4 presentInterruptionOfKind:13 userInfo:v7 completionHandler:0];
}

- (BOOL)usesDefaultTransitions
{
  return 1;
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
    block[2] = sub_100C28A44;
    block[3] = &unk_1012E80F0;
    id v12 = v6;
    id v13 = v8;
    id v14 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  return v9 != 0;
}

- (void)sharedTripDetailCard:(id)a3 didSelectAction:(unint64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    id v14 = v6;
    id v12 = [(CarSharedTripsContext *)self chromeViewController];
    id v13 = [(CarSharedTripsContext *)self _transportTypeStringForAnalytics];
    [v12 captureUserAction:9028 eventValue:v13];

    id v9 = +[MSPSharedTripService sharedInstance];
    id v10 = [(SharedTripsContext *)self selectedTrip];
    int v11 = [v10 groupIdentifier];
    [v9 blockSharedTripWithIdentifier:v11];
  }
  else
  {
    if (a4) {
      goto LABEL_6;
    }
    id v14 = v6;
    id v7 = [(CarSharedTripsContext *)self chromeViewController];
    id v8 = [(CarSharedTripsContext *)self _transportTypeStringForAnalytics];
    [v7 captureUserAction:6003 eventValue:v8];

    id v9 = +[CarChromeModeCoordinator sharedInstance];
    id v10 = [(SharedTripsContext *)self selectedTrip];
    int v11 = [v10 destinationWaypointMapItem];
    [v9 displayRoutePlanningForDestination:v11];
  }

  id v6 = v14;
LABEL_6:
}

- (int)backButtonUsageActionToContext:(id)a3
{
  return 4;
}

- (int)currentUsageTarget
{
  if (self->_selectedSharedTripCardViewController) {
    return 1020;
  }
  else {
    return 268;
  }
}

- (id)_transportTypeStringForAnalytics
{
  v2 = [(CarSharedTripDetailCardViewController *)self->_selectedSharedTripCardViewController sharedTrip];
  id v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 _transportTypeStringForAnalytics];
  }
  else
  {
    id v5 = +[MSPSharedTripService sharedInstance];
    id v6 = [v5 receivedTrips];
    id v7 = sub_100099700(v6, &stru_10131BB28);

    uint64_t v4 = [v7 componentsJoinedByString:@","];
  }

  return v4;
}

- (NSArray)carFocusOrderSequences
{
  id v3 = [(CarSharedTripsContext *)self chromeViewController];
  uint64_t v4 = [v3 itemRepresentingStatusBanner];
  id v5 = [(CarSharedTripsContext *)self chromeViewController];
  id v6 = [v5 itemRepresentingOverlays];
  v11[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v11 count:2];
  id v8 = +[CarFocusOrderSequence sequenceWithItems:v7 options:5];
  id v12 = v8;
  id v9 = +[NSArray arrayWithObjects:&v12 count:1];

  return (NSArray *)v9;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_selectedSharedTripCardViewController, 0);
  objc_storeStrong((id *)&self->_listCardViewController, 0);

  objc_storeStrong((id *)&self->_annotationsController, 0);
}

@end