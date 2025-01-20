@interface FlyoverActionCoordinator
- (AppCoordinator)appCoordinator;
- (BOOL)isFlyoverRunning;
- (BOOL)isFlyoverUnificationEnabled;
- (FlyoverActionCoordinator)init;
- (FlyoverActionCoordinator)initWithContainerViewController:(id)a3;
- (FlyoverContainerViewController)containerViewController;
- (FlyoverTrayContaineeViewController)trayContaineeViewController;
- (int64_t)displayedViewMode;
- (unint64_t)originalLayoutForViewController:(id)a3;
- (void)flyoverTourCompleted;
- (void)flyoverTourPause;
- (void)flyoverTourPlay;
- (void)flyoverTourResume;
- (void)setAppCoordinator:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setFlyoverRunning:(BOOL)a3;
- (void)setTrayContaineeViewController:(id)a3;
- (void)updateViewMode:(int64_t)a3 animated:(BOOL)a4;
- (void)viewControllerDidEndFlyover:(id)a3;
- (void)viewControllerDidStartFlyover:(id)a3;
- (void)viewControllerEndFlyover:(id)a3;
- (void)viewControllerPresentTray:(id)a3;
@end

@implementation FlyoverActionCoordinator

- (FlyoverActionCoordinator)init
{
  return 0;
}

- (FlyoverActionCoordinator)initWithContainerViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FlyoverActionCoordinator;
  v5 = [(FlyoverActionCoordinator *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_containerViewController, v4);
  }

  return v6;
}

- (void)viewControllerDidStartFlyover:(id)a3
{
  self->_flyoverRunning = 1;
}

- (void)viewControllerDidEndFlyover:(id)a3
{
  self->_flyoverRunning = 0;
}

- (void)viewControllerEndFlyover:(id)a3
{
  id v4 = +[VKPlatform sharedPlatform];
  unsigned int v5 = [v4 supportsARMode];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = [WeakRetained chromeViewController];
  v7 = [v6 mapView];
  objc_super v8 = v7;
  if (v5) {
    [v7 _exitARMode];
  }
  else {
    [v7 setFlyoverMode:0xFFFFFFFFLL];
  }
}

- (void)viewControllerPresentTray:(id)a3
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v6 = [WeakRetained topMostPresentedViewController];
  v7 = [v6 transitionCoordinator];

  id v8 = objc_loadWeakRetained((id *)p_containerViewController);
  id v12 = v8;
  if (v7)
  {
    v9 = [v8 topMostPresentedViewController];
    v10 = [v9 transitionCoordinator];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100C25528;
    v13[3] = &unk_1012E81F8;
    v13[4] = self;
    [v10 animateAlongsideTransition:0 completion:v13];
  }
  else
  {
    v11 = [(FlyoverActionCoordinator *)self trayContaineeViewController];
    [v12 presentController:v11 animated:0];
  }
}

- (int64_t)displayedViewMode
{
  v2 = [(FlyoverActionCoordinator *)self containerViewController];
  v3 = [v2 chromeViewController];
  id v4 = [v3 displayedViewMode];

  return (int64_t)v4;
}

- (void)updateViewMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(FlyoverActionCoordinator *)self containerViewController];
  v6 = [v7 chromeViewController];
  [v6 updateViewMode:a3 animated:v4];
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  return 5;
}

- (BOOL)isFlyoverUnificationEnabled
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  v3 = [WeakRetained chromeViewController];
  BOOL v4 = [v3 mapView];
  unsigned int v5 = [v4 _mapLayer];
  unsigned __int8 v6 = [v5 isFlyoverUnificationEnabled];

  return v6;
}

- (void)flyoverTourPlay
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  BOOL v4 = [WeakRetained chromeViewController];
  unsigned int v5 = [v4 mapView];
  unsigned __int8 v6 = [v5 _mapLayer];
  [v6 setFlyoverMode:1];

  id v12 = objc_loadWeakRetained((id *)p_containerViewController);
  id v7 = [v12 chromeViewController];
  id v8 = [v7 mapView];
  id v9 = objc_loadWeakRetained((id *)p_containerViewController);
  v10 = [v9 mapItem];
  v11 = [v10 _flyover];
  [v8 _performFlyoverAnimation:v11];
}

- (void)flyoverTourPause
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  BOOL v4 = [WeakRetained chromeViewController];
  unsigned int v5 = [v4 mapView];
  [v5 _pauseFlyoverAnimation];

  id v6 = objc_loadWeakRetained((id *)p_containerViewController);
  uint64_t v7 = 2 * ([v6 sessionInterruptedReason] != 0);

  id v11 = objc_loadWeakRetained((id *)p_containerViewController);
  id v8 = [v11 chromeViewController];
  id v9 = [v8 mapView];
  v10 = [v9 _mapLayer];
  [v10 setFlyoverMode:v7];
}

- (void)flyoverTourResume
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  BOOL v4 = [WeakRetained chromeViewController];
  unsigned int v5 = [v4 mapView];
  id v6 = [v5 _mapLayer];
  [v6 setFlyoverMode:1];

  id v9 = objc_loadWeakRetained((id *)p_containerViewController);
  uint64_t v7 = [v9 chromeViewController];
  id v8 = [v7 mapView];
  [v8 _resumeFlyoverAnimation];
}

- (void)flyoverTourCompleted
{
  p_containerViewController = &self->_containerViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  unsigned int v5 = [WeakRetained chromeViewController];
  id v6 = [v5 mapView];
  [v6 _stopFlyoverAnimation];

  id v7 = objc_loadWeakRetained((id *)p_containerViewController);
  uint64_t v8 = 2 * ([v7 sessionInterruptedReason] != 0);

  id v9 = objc_loadWeakRetained((id *)p_containerViewController);
  v10 = [v9 chromeViewController];
  id v11 = [v10 mapView];
  id v12 = [v11 _mapLayer];
  [v12 setFlyoverMode:v8];

  trayContaineeViewController = self->_trayContaineeViewController;

  [(FlyoverTrayContaineeViewController *)trayContaineeViewController resetFlyoverTour];
}

- (FlyoverTrayContaineeViewController)trayContaineeViewController
{
  v3 = +[UIDevice currentDevice];
  if ([v3 userInterfaceIdiom] != (id)5)
  {
    trayContaineeViewController = self->_trayContaineeViewController;

    if (trayContaineeViewController) {
      goto LABEL_5;
    }
    unsigned int v5 = [FlyoverTrayContaineeViewController alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    id v7 = [WeakRetained mapItem];
    uint64_t v8 = [(FlyoverTrayContaineeViewController *)v5 initWithMapItem:v7];
    id v9 = self->_trayContaineeViewController;
    self->_trayContaineeViewController = v8;

    [(FlyoverTrayContaineeViewController *)self->_trayContaineeViewController setDelegate:self];
    v3 = [(FlyoverTrayContaineeViewController *)self->_trayContaineeViewController view];
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  }

LABEL_5:
  v10 = self->_trayContaineeViewController;

  return v10;
}

- (AppCoordinator)appCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appCoordinator);

  return (AppCoordinator *)WeakRetained;
}

- (void)setAppCoordinator:(id)a3
{
}

- (FlyoverContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (FlyoverContainerViewController *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (void)setTrayContaineeViewController:(id)a3
{
}

- (BOOL)isFlyoverRunning
{
  return self->_flyoverRunning;
}

- (void)setFlyoverRunning:(BOOL)a3
{
  self->_flyoverRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trayContaineeViewController, 0);
  objc_destroyWeak((id *)&self->_containerViewController);

  objc_destroyWeak((id *)&self->_appCoordinator);
}

@end