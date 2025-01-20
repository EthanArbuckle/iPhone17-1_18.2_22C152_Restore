@interface CarDestinationsModeController
- (BOOL)shouldAllowKnobFocusMovement;
- (BOOL)shouldTimeoutAfterDisconnect;
- (BOOL)showsMapView;
- (CarDestinationsCardViewController)destinationsCard;
- (CarDestinationsModeController)init;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (NSArray)preferredCarFocusEnvironments;
- (UIScrollView)pptTestScrollView;
- (id)desiredCards;
- (id)mapView;
- (int)currentUsageTarget;
- (int64_t)autohideBehavior;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)destinationsCard:(id)a3 didSelectRecent:(id)a4;
- (void)destinationsCard:(id)a3 didSelectSuggestion:(id)a4;
- (void)destinationsCardDidSelectSavedPlaces:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setDestinationsCard:(id)a3;
@end

@implementation CarDestinationsModeController

- (CarDestinationsModeController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CarDestinationsModeController;
  v2 = [(CarDestinationsModeController *)&v6 init];
  if (v2)
  {
    v3 = [[CarDestinationsCardViewController alloc] initWithDelegate:v2];
    destinationsCard = v2->_destinationsCard;
    v2->_destinationsCard = v3;
  }
  return v2;
}

- (id)mapView
{
  v2 = [(CarDestinationsModeController *)self chromeViewController];
  v3 = [v2 mapView];

  return v3;
}

- (BOOL)showsMapView
{
  return 1;
}

- (int64_t)autohideBehavior
{
  return 1;
}

- (BOOL)shouldTimeoutAfterDisconnect
{
  return 1;
}

- (id)desiredCards
{
  CFStringRef v4 = @"primary";
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"primary"])
  {
    v7 = [(CarDestinationsModeController *)self destinationsCard];
    [v6 setContent:v7];

    v8 = +[NSBundle mainBundle];
    v9 = [v8 localizedStringForKey:@"CarDestinations_Destinations_Title" value:@"localized string not found" table:0];
    [v6 setTitle:v9];

    HIDWORD(v25) = 0;
    *(_DWORD *)((char *)&v25 + 1) = 0;
    long long v15 = xmmword_100F6F1C0;
    long long v16 = xmmword_100F67600;
    uint64_t v17 = 3;
    uint64_t v18 = 1148846080;
    uint64_t v19 = 2;
    LODWORD(v20) = 1148846080;
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    long long v23 = _Q0;
    long long v24 = _Q0;
    LOBYTE(v25) = 1;
    uint64_t v26 = 8;
    LOBYTE(v27) = 0;
    if (v6) {
      [v6 setLayout:&v15];
    }
    [v6 setAccessory:1 v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27];
  }
}

- (void)destinationsCardDidSelectSavedPlaces:(id)a3
{
  id v3 = +[CarChromeModeCoordinator sharedInstance];
  [v3 displayCollectionList];
}

- (void)destinationsCard:(id)a3 didSelectSuggestion:(id)a4
{
  id v4 = a4;
  id v5 = +[CarChromeModeCoordinator sharedInstance];
  [v5 displayRoutePlanningForDestination:v4];
}

- (void)destinationsCard:(id)a3 didSelectRecent:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = +[MSPSharedTripService sharedInstance];
    id v6 = [v5 receivedTrips];
    id v7 = [v6 count];

    if (v7 != (id)1)
    {
      uint64_t v17 = +[CarChromeModeCoordinator sharedInstance];
      [v17 displayAllSharedTrips];
      goto LABEL_10;
    }
    v8 = +[MSPSharedTripService sharedInstance];
    v9 = [v8 receivedTrips];
    uint64_t v10 = [v9 firstObject];

    id v4 = (id)v10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v4;
    id v4 = v11;
    if (v11)
    {
      if ([v11 disallowDetailsForChina])
      {
        v12 = +[CarDisplayController sharedInstance];
        v22[0] = @"kMapsInterruptionTitle";
        v13 = [v4 alertTitleForDisallowedDetails];
        v22[1] = @"kMapsInterruptionMessage";
        v23[0] = v13;
        v14 = [v4 alertMessageForChinaError];
        v23[1] = v14;
        long long v15 = v23;
        long long v16 = v22;
LABEL_14:
        uint64_t v18 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v16 count:2];
        id v19 = [v12 presentInterruptionOfKind:13 userInfo:v18 completionHandler:0];

LABEL_16:
        goto LABEL_17;
      }
      if (([v4 disallowDetailsForTransportType] & 1) != 0
        || [v4 disallowDetailsForProtocolVersion])
      {
        v12 = +[CarDisplayController sharedInstance];
        v20[0] = @"kMapsInterruptionTitle";
        v13 = [v4 alertTitleForDisallowedDetails];
        v20[1] = @"kMapsInterruptionMessage";
        v21[0] = v13;
        v14 = [v4 alertMessageForTransportOrProtocolError];
        v21[1] = v14;
        long long v15 = v21;
        long long v16 = v20;
        goto LABEL_14;
      }
    }
    v12 = +[CarChromeModeCoordinator sharedInstance];
    [v12 displaySharedTrip:v4];
    goto LABEL_16;
  }
  uint64_t v17 = +[CarChromeModeCoordinator sharedInstance];
  [v17 displayRoutePlanningForDestination:v4];
LABEL_10:

LABEL_17:
}

- (NSArray)preferredCarFocusEnvironments
{
  id v3 = [(CarDestinationsModeController *)self destinationsCard];

  if (v3)
  {
    id v4 = [(CarDestinationsModeController *)self destinationsCard];
    id v5 = +[CarFocusOrderEnvironment environmentWithFocusEnvironment:v4];
    v8 = v5;
    id v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return (NSArray *)v6;
}

- (NSArray)carFocusOrderSequences
{
  id v3 = [(CarDestinationsModeController *)self chromeViewController];
  id v4 = [v3 itemRepresentingStatusBanner];
  id v5 = [(CarDestinationsModeController *)self chromeViewController];
  id v6 = [v5 itemRepresentingOverlays];
  v11[1] = v6;
  id v7 = +[NSArray arrayWithObjects:v11 count:2];
  v8 = +[CarFocusOrderSequence sequenceWithItems:v7 options:5];
  v12 = v8;
  v9 = +[NSArray arrayWithObjects:&v12 count:1];

  return (NSArray *)v9;
}

- (BOOL)shouldAllowKnobFocusMovement
{
  return 1;
}

- (int)currentUsageTarget
{
  return 1006;
}

- (UIScrollView)pptTestScrollView
{
  v2 = [(CarDestinationsModeController *)self destinationsCard];
  id v3 = [v2 tableView];

  return (UIScrollView *)v3;
}

- (ChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (ChromeViewController *)WeakRetained;
}

- (void)setChromeViewController:(id)a3
{
}

- (CarDestinationsCardViewController)destinationsCard
{
  return self->_destinationsCard;
}

- (void)setDestinationsCard:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationsCard, 0);

  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end