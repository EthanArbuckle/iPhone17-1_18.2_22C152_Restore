@interface RidesharingModeController
- (BOOL)showsMapView;
- (IOSChromeViewController)chromeViewController;
- (NSString)applicationIdentifier;
- (RideBookingRideOption)rideOption;
- (RidesharingModeController)init;
- (RidesharingModeController)initWithApplicationIdentifier:(id)a3;
- (RidesharingModeController)initWithRideOption:(id)a3;
- (UIView)passThroughView;
- (id)fullscreenViewController;
- (id)fullscreenViewControllerDismissalTransition;
- (id)fullscreenViewControllerPresentationTransition;
- (id)mapViewDelegate;
- (void)_setupMapView;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setApplicationIdentifier:(id)a3;
- (void)setChromeViewController:(id)a3;
- (void)setRideOption:(id)a3;
@end

@implementation RidesharingModeController

- (RidesharingModeController)init
{
  v8.receiver = self;
  v8.super_class = (Class)RidesharingModeController;
  v2 = [(RidesharingModeController *)&v8 init];
  if (v2)
  {
    v3 = objc_alloc_init(RidesharingContainerViewController);
    containerViewController = v2->_containerViewController;
    v2->_containerViewController = v3;

    [(ContainerViewController *)v2->_containerViewController setChromeContext:v2];
    [(ContainerViewController *)v2->_containerViewController setAllowOnlyStandardStyle:0];
    v5 = [[RidesharingCoordinator alloc] initWithContainerViewController:v2->_containerViewController];
    ridebookingCoordinator = v2->_ridebookingCoordinator;
    v2->_ridebookingCoordinator = (RidesharingCoordination *)v5;
  }
  return v2;
}

- (RidesharingModeController)initWithRideOption:(id)a3
{
  id v5 = a3;
  v6 = [(RidesharingModeController *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_rideOption, a3);
  }

  return v7;
}

- (RidesharingModeController)initWithApplicationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(RidesharingModeController *)self init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    applicationIdentifier = v5->_applicationIdentifier;
    v5->_applicationIdentifier = v6;
  }
  return v5;
}

- (id)fullscreenViewController
{
  return self->_containerViewController;
}

- (void)setChromeViewController:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_chromeViewController, obj);
    [(ContainerViewController *)self->_containerViewController setChromeViewController:obj];
  }
}

- (UIView)passThroughView
{
  v2 = [(RidesharingModeController *)self chromeViewController];
  v3 = [v2 passThroughView];

  return (UIView *)v3;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (self->_rideOption) {
    [(RidesharingCoordination *)self->_ridebookingCoordinator presentDetailsPicking];
  }
  if (self->_applicationIdentifier) {
    -[RidesharingCoordination presentConfirmedRideWithApplicationIdentifier:](self->_ridebookingCoordinator, "presentConfirmedRideWithApplicationIdentifier:");
  }
  [(RidesharingModeController *)self _setupMapView];
}

- (void)_setupMapView
{
  v3 = [(RidesharingModeController *)self chromeViewController];
  id v4 = [v3 displayedViewMode];

  if (v4)
  {
    id v5 = [(RidesharingModeController *)self chromeViewController];
    [v5 updateViewMode:0 animated:0];
  }
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingModeController.m");
    id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Resigning ridesharing mode"];
    int v11 = 136315394;
    v12 = v6;
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", (uint8_t *)&v11, 0x16u);
  }
  applicationIdentifier = self->_applicationIdentifier;
  self->_applicationIdentifier = 0;

  v9 = [(RidesharingModeController *)self chromeViewController];
  v10 = [v9 ridesharingAnnotationsManager];
  [v10 removeCurrentRide];
}

- (id)fullscreenViewControllerPresentationTransition
{
  v2 = objc_opt_new();

  return v2;
}

- (id)fullscreenViewControllerDismissalTransition
{
  v2 = objc_opt_new();

  return v2;
}

- (BOOL)showsMapView
{
  return 1;
}

- (id)mapViewDelegate
{
  v3 = [(ContainerViewController *)self->_containerViewController currentViewController];
  id v4 = [(RidesharingContainerViewController *)self->_containerViewController confirmedRideViewController];
  unsigned int v5 = [v3 isEqual:v4];

  if (v5)
  {
    id v6 = [(RidesharingModeController *)self chromeViewController];
    id v7 = [v6 ridesharingAnnotationsManager];
  }
  else
  {
    id v7 = self->_containerViewController;
  }

  return v7;
}

- (IOSChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (IOSChromeViewController *)WeakRetained;
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
}

- (RideBookingRideOption)rideOption
{
  return self->_rideOption;
}

- (void)setRideOption:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideOption, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_containerViewController, 0);

  objc_storeStrong((id *)&self->_ridebookingCoordinator, 0);
}

@end