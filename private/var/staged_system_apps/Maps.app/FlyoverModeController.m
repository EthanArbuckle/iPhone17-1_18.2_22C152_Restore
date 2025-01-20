@interface FlyoverModeController
- (BOOL)permitsLookAroundShowing;
- (BOOL)permitsWeatherShowing;
- (BOOL)showsMapView;
- (BOOL)usesDefaultTransitions;
- (BOOL)wantsLookAroundShowing;
- (BOOL)wantsStatusBarControl;
- (BOOL)wantsWeatherShowing;
- (BOOL)wasShowingCompass;
- (BOOL)wasShowingScale;
- (BOOL)wasShowingUserLocation;
- (FlyoverActionCoordination)actionCoordinator;
- (FlyoverContainerViewController)containerViewController;
- (FlyoverModeController)initWithMapItem:(id)a3;
- (IOSBasedChromeViewController)chromeViewController;
- (MKMapItem)mapItem;
- (id)mapViewDelegate;
- (id)transitionControllerForPopToMode:(id)a3;
- (id)transitionControllerForPushFromMode:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)getCurrentSceneTitleWithCompletion:(id)a3;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setWasShowingCompass:(BOOL)a3;
- (void)setWasShowingScale:(BOOL)a3;
- (void)setWasShowingUserLocation:(BOOL)a3;
@end

@implementation FlyoverModeController

- (FlyoverModeController)initWithMapItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FlyoverModeController;
  v6 = [(FlyoverModeController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_mapItem, a3);
  }

  return v7;
}

- (FlyoverActionCoordination)actionCoordinator
{
  v2 = [(FlyoverModeController *)self containerViewController];
  v3 = [v2 flyoverActionCoordinator];

  return (FlyoverActionCoordination *)v3;
}

- (void)setChromeViewController:(id)a3
{
  p_chromeViewController = &self->_chromeViewController;
  id v5 = a3;
  objc_storeWeak((id *)p_chromeViewController, v5);
  [(ContainerViewController *)self->_containerViewController setChromeViewController:v5];
}

- (FlyoverContainerViewController)containerViewController
{
  containerViewController = self->_containerViewController;
  if (!containerViewController)
  {
    v4 = [FlyoverContainerViewController alloc];
    id v5 = [(FlyoverModeController *)self mapItem];
    v6 = [(FlyoverContainerViewController *)v4 initWithMapItem:v5];
    v7 = self->_containerViewController;
    self->_containerViewController = v6;

    v8 = [(FlyoverModeController *)self actionCoordinator];
    [(FlyoverContainerViewController *)self->_containerViewController setFlyoverDelegate:v8];

    [(ContainerViewController *)self->_containerViewController setChromeContext:self];
    objc_super v9 = [(FlyoverModeController *)self chromeViewController];
    [(ContainerViewController *)self->_containerViewController setChromeViewController:v9];

    containerViewController = self->_containerViewController;
  }

  return containerViewController;
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (id)transitionControllerForPushFromMode:(id)a3
{
  v3 = objc_opt_new();

  return v3;
}

- (id)transitionControllerForPopToMode:(id)a3
{
  v3 = objc_opt_new();

  return v3;
}

- (id)mapViewDelegate
{
  return self->_containerViewController;
}

- (BOOL)showsMapView
{
  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100AA4B5C;
  v7[3] = &unk_1012E6160;
  id v8 = a3;
  objc_super v9 = self;
  id v6 = v8;
  [a4 addCompletion:v7];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100AA4D6C;
  v6[3] = &unk_1012E5D58;
  v6[4] = self;
  id v7 = a3;
  id v5 = v7;
  [a4 addPreparation:v6];
}

- (void)getCurrentSceneTitleWithCompletion:(id)a3
{
  v4 = (void (**)(id, id))a3;
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"[App switcher title] Flyover — <location>" value:@"localized string not found" table:0];
  id v7 = [(FlyoverModeController *)self mapItem];
  id v8 = [v7 name];
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v9);
}

- (BOOL)wantsStatusBarControl
{
  return 1;
}

- (int64_t)preferredStatusBarStyle
{
  v2 = [(FlyoverModeController *)self containerViewController];
  id v3 = [v2 preferredStatusBarStyle];

  return (int64_t)v3;
}

- (BOOL)wantsWeatherShowing
{
  return 0;
}

- (BOOL)permitsWeatherShowing
{
  return 0;
}

- (BOOL)wantsLookAroundShowing
{
  return 0;
}

- (BOOL)permitsLookAroundShowing
{
  return 0;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (IOSBasedChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (IOSBasedChromeViewController *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (BOOL)wasShowingCompass
{
  return self->_wasShowingCompass;
}

- (void)setWasShowingCompass:(BOOL)a3
{
  self->_wasShowingCompass = a3;
}

- (BOOL)wasShowingScale
{
  return self->_wasShowingScale;
}

- (void)setWasShowingScale:(BOOL)a3
{
  self->_wasShowingScale = a3;
}

- (BOOL)wasShowingUserLocation
{
  return self->_wasShowingUserLocation;
}

- (void)setWasShowingUserLocation:(BOOL)a3
{
  self->_wasShowingUserLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);

  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end