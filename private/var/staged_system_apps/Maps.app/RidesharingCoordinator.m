@interface RidesharingCoordinator
- (AppCoordinator)appCoordinator;
- (BOOL)_ridesharingIsCurrentMode;
- (BOOL)_wasPresentedFromProactiveTray;
- (RidesharingContainerViewController)containerViewController;
- (RidesharingCoordinator)initWithContainerViewController:(id)a3;
- (void)presentConfirmedRideWithApplicationIdentifier:(id)a3;
- (void)presentDetailsPicking;
- (void)presentExpirationAlertControllerWithRequestRideStatus:(id)a3;
- (void)setAppCoordinator:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)viewController:(id)a3 minimizeConfirmation:(id)a4;
- (void)viewController:(id)a3 presentErrorAlertIfNeeded:(id)a4;
- (void)viewControllerRideCompletionAction:(id)a3;
- (void)viewControllerSendFeedbackAction;
@end

@implementation RidesharingCoordinator

- (RidesharingCoordinator)initWithContainerViewController:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RidesharingCoordinator;
  v6 = [(RidesharingCoordinator *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_containerViewController, a3);
    v8 = +[UIApplication sharedMapsDelegate];
    v9 = [v8 appCoordinator];
    objc_storeWeak((id *)&v7->_appCoordinator, v9);
  }
  return v7;
}

- (BOOL)_wasPresentedFromProactiveTray
{
  v2 = [(RidesharingCoordinator *)self appCoordinator];
  v3 = [v2 baseActionCoordinator];
  v4 = [v3 currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)presentDetailsPicking
{
  id v5 = objc_alloc_init(RidesharingDetailsPickingViewController);
  v3 = [(RidesharingCoordinator *)self containerViewController];
  [v3 setDetailsPickingViewController:v5];

  [(RidesharingDetailsPickingViewController *)v5 setCoordinator:self];
  v4 = [(RidesharingCoordinator *)self containerViewController];
  [v4 presentController:v5 animated:1 useDefaultContaineeLayout:1];
}

- (void)presentExpirationAlertControllerWithRequestRideStatus:(id)a3
{
  id v4 = a3;
  if ([(RidesharingCoordinator *)self _ridesharingIsCurrentMode])
  {
    id v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingCoordinator.m");
      id v7 = [objc_alloc((Class)NSString) initWithFormat:@"Ride option expired, showing expiration alert"];
      *(_DWORD *)buf = 136315394;
      v18 = v6;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{RBError}{%s}: %@", buf, 0x16u);
    }
    v8 = [v4 expirationAlertTitle];
    v9 = [v4 expirationAlertMessage];
    v10 = +[UIAlertController alertControllerWithTitle:v8 message:v9 preferredStyle:1];

    objc_initWeak((id *)buf, self);
    objc_super v11 = +[NSBundle mainBundle];
    v12 = [v11 localizedStringForKey:@"OK" value:@"localized string not found" table:0];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10099F608;
    v15[3] = &unk_1012E8EB8;
    objc_copyWeak(&v16, (id *)buf);
    v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:v15];
    [v10 addAction:v13];

    v14 = [(RidesharingCoordinator *)self containerViewController];
    [v14 presentViewController:v10 animated:1 completion:0];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

- (void)presentConfirmedRideWithApplicationIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v11 = [[RidesharingConfirmedRideViewController alloc] initWithApplicationIdentifier:v4];
  id v5 = [(RidesharingCoordinator *)self containerViewController];
  [v5 setDetailsPickingViewController:0];

  v6 = [(RidesharingCoordinator *)self containerViewController];
  [v6 setConfirmedRideViewController:v11];

  [(RidesharingConfirmedRideViewController *)v11 setCoordinator:self];
  id v7 = [(RidesharingCoordinator *)self containerViewController];
  [v7 presentController:v11 animated:1 useDefaultContaineeLayout:1];

  v8 = [(RidesharingCoordinator *)self containerViewController];
  v9 = [v8 chromeViewController];
  v10 = [v9 ridesharingAnnotationsManager];
  [v10 addCurrentRideWithApplicationIdentifier:v4];
}

- (void)viewController:(id)a3 minimizeConfirmation:(id)a4
{
  id v12 = a3;
  id v5 = [(RidesharingCoordinator *)self containerViewController];
  v6 = [v5 chromeViewController];
  id v7 = [v6 ridesharingAnnotationsManager];
  [v7 removeCurrentRide];

  if ([(RidesharingCoordinator *)self _wasPresentedFromProactiveTray])
  {
    id v8 = 0;
  }
  else
  {
    v9 = [v12 rideStatus];
    id v8 = [v9 shouldShowFeedbackControls];
  }
  v10 = [(RidesharingCoordinator *)self appCoordinator];
  [v10 dismissRidesharingSessionAndReturnToRoutePlanning:v8];

  objc_super v11 = sub_100018584();
  [v11 hintRefreshOfType:9];
}

- (void)viewControllerRideCompletionAction:(id)a3
{
  id v3 = [(RidesharingCoordinator *)self appCoordinator];
  [v3 dismissRidesharingSessionAndReturnToRoutePlanning:0];
}

- (void)viewControllerSendFeedbackAction
{
  id v3 = [(RidesharingCoordinator *)self appCoordinator];
  [v3 dismissRidesharingSessionAndReturnToRoutePlanning:[self _wasPresentedFromProactiveTray] ? 1 : 0];

  id v4 = [(RidesharingCoordinator *)self appCoordinator];
  id v5 = [v4 baseActionCoordinator];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    id v8 = [v7 routePlanningDataCoordinator];
    [v8 refreshRidesharingOptionsIfVisible];
  }
  else
  {
    id v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingCoordinator.m");
      id v10 = [objc_alloc((Class)NSString) initWithFormat:@"Could not trigger a refresh of ride options after finishing sending feedback. Ride options list may have stale data"];
      int v11 = 136315394;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

- (void)viewController:(id)a3 presentErrorAlertIfNeeded:(id)a4
{
  id v6 = a3;
  id v7 = (RidesharingErrorAlertProvider *)a4;
  id v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Shared/RidesharingCoordinator.m");
    id v10 = (char *)[objc_alloc((Class)NSString) initWithFormat:@"Presenting error alert: %@ on: %@", v7, v6];
    *(_DWORD *)buf = 136315394;
    v23 = v9;
    __int16 v24 = 2112;
    v25 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);
  }
  if (!v6)
  {
    id v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v23 = "-[RidesharingCoordinator viewController:presentErrorAlertIfNeeded:]";
      __int16 v24 = 2080;
      v25 = "RidesharingCoordinator.m";
      __int16 v26 = 1024;
      int v27 = 118;
      __int16 v28 = 2080;
      v29 = "viewController";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v16 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (self->_errorAlertProvider != v7)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10099FD58;
    v19[3] = &unk_1012E66E0;
    v19[4] = self;
    id v20 = v7;
    id v21 = v6;
    int v11 = objc_retainBlock(v19);
    id v12 = v11;
    errorAlert = self->_errorAlert;
    if (errorAlert)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1009A01F0;
      v17[3] = &unk_1012E6EA8;
      v18 = v11;
      [(UIAlertController *)errorAlert dismissViewControllerAnimated:1 completion:v17];
    }
    else
    {
      ((void (*)(void *))v11[2])(v11);
    }
  }
}

- (BOOL)_ridesharingIsCurrentMode
{
  id v3 = [(RidesharingCoordinator *)self containerViewController];
  id v4 = [v3 chromeContext];
  id v5 = [(RidesharingCoordinator *)self containerViewController];
  id v6 = [v5 chromeViewController];
  id v7 = [v6 currentIOSBasedContext];
  unsigned __int8 v8 = [v4 isEqual:v7];

  return v8;
}

- (AppCoordinator)appCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);

  return (AppCoordinator *)WeakRetained;
}

- (void)setAppCoordinator:(id)a3
{
}

- (RidesharingContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (void)setContainerViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_destroyWeak((id *)&self->_appCoordinator);
  objc_storeStrong((id *)&self->_errorAlert, 0);

  objc_storeStrong((id *)&self->_errorAlertProvider, 0);
}

@end