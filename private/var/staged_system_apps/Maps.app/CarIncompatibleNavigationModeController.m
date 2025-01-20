@interface CarIncompatibleNavigationModeController
- (BOOL)shouldAllowKnobFocusMovement;
- (BOOL)showsMapView;
- (BOOL)showsNavigationBar;
- (BOOL)usesDefaultTransitions;
- (CarIncompatibleNavigationModeController)init;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (id)fullscreenViewController;
- (id)fullscreenViewControllerDismissalTransition;
- (id)fullscreenViewControllerPresentationTransition;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)configureNavigationDisplay:(id)a3;
- (void)setChromeViewController:(id)a3;
@end

@implementation CarIncompatibleNavigationModeController

- (CarIncompatibleNavigationModeController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CarIncompatibleNavigationModeController;
  v2 = [(CarIncompatibleNavigationModeController *)&v7 init];
  if (v2)
  {
    v3 = objc_alloc_init(CarAlertViewController);
    viewController = v2->_viewController;
    v2->_viewController = v3;

    v5 = [(CarAlertViewController *)v2->_viewController navigationItem];
    [v5 setHidesBackButton:1];
  }
  return v2;
}

- (id)fullscreenViewController
{
  return self->_viewController;
}

- (BOOL)showsNavigationBar
{
  return 0;
}

- (BOOL)showsMapView
{
  return 0;
}

- (BOOL)shouldAllowKnobFocusMovement
{
  return 1;
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (id)fullscreenViewControllerPresentationTransition
{
  v2 = objc_opt_new();
  [v2 setOperation:1];

  return v2;
}

- (id)fullscreenViewControllerDismissalTransition
{
  v2 = objc_opt_new();
  [v2 setOperation:2];

  return v2;
}

- (void)configureNavigationDisplay:(id)a3
{
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  [(CarAlertViewController *)self->_viewController reset];
  v5 = +[MNNavigationService sharedService];
  if ([v5 desiredTransportType])
  {
    unsigned int v6 = [v5 desiredTransportType];
    if (v6 > 5) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = qword_100F73858[v6];
    }
    v10 = CarInterruptionUserInfoWithTransportType(v7);
    v14 = [v10 objectForKeyedSubscript:@"kMapsInterruptionTitle"];
    [(CarAlertViewController *)self->_viewController setAlertTitle:v14];

    v15 = [v10 objectForKeyedSubscript:@"kMapsInterruptionMessage"];
    [(CarAlertViewController *)self->_viewController setAlertMessage:v15];

    v13 = [v10 objectForKeyedSubscript:@"kMapsInterruptionActions"];
  }
  else
  {
    v8 = CarDisplayDirectionsNotAvailableErrorTitle();
    [(CarAlertViewController *)self->_viewController setAlertTitle:v8];

    v9 = CarDisplayTurnByTurnNotAvailableAdvisory();
    [(CarAlertViewController *)self->_viewController setAlertMessage:v9];

    v10 = +[NSBundle mainBundle];
    v11 = [v10 localizedStringForKey:@"End Navigation [CarPlay, Stepping]", @"localized string not found", 0 value table];
    v12 = +[MapsInterruptionAction actionWithTitle:v11 cancels:0 handler:&stru_10131ABA0];
    v21 = v12;
    v13 = +[NSArray arrayWithObjects:&v21 count:1];
  }
  [(CarAlertViewController *)self->_viewController setActions:v13];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100BCECA4;
  v19[3] = &unk_10131ABC8;
  id v20 = v13;
  viewController = self->_viewController;
  id v17 = v13;
  [(CarAlertViewController *)viewController setResultBlock:v19];
  v18 = [(CarIncompatibleNavigationModeController *)self chromeViewController];
  [v18 setHardwareBackButtonBehavior:2 forContext:self];
}

- (NSArray)carFocusOrderSequences
{
  if ([(CarAlertViewController *)self->_viewController isViewLoaded])
  {
    v3 = [(CarAlertViewController *)self->_viewController focusOrderSubItems];
    v4 = sub_100099700(v3, &stru_10131AC08);
    v5 = +[CarFocusOrderSequence sequenceWithItems:v4 options:5];
    v8 = v5;
    unsigned int v6 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    unsigned int v6 = &__NSArray0__struct;
  }

  return (NSArray *)v6;
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

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end