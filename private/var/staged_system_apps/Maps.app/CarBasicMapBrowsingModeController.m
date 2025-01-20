@interface CarBasicMapBrowsingModeController
- (BOOL)showsMapView;
- (CarMapTrackingController)trackingController;
- (ChromeViewController)chromeViewController;
- (NSArray)carFocusOrderSequences;
- (id)mapView;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)configureNavigationDisplay:(id)a3;
- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setChromeViewController:(id)a3;
- (void)setInitialTrackingIfNeededAndPossible;
- (void)setMapCamera:(id)a3 animated:(BOOL)a4;
- (void)setVisibleMapRegion:(id *)a3 animated:(BOOL)a4;
@end

@implementation CarBasicMapBrowsingModeController

- (void)mapView:(id)a3 didUpdateUserLocation:(id)a4
{
  v5 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  unsigned int v6 = [v5 isCurrentContext:self];

  if (v6)
  {
    [(CarBasicMapBrowsingModeController *)self setInitialTrackingIfNeededAndPossible];
  }
}

- (id)mapView
{
  v2 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  v3 = [v2 mapView];

  return v3;
}

- (CarMapTrackingController)trackingController
{
  trackingController = self->_trackingController;
  if (!trackingController)
  {
    v4 = objc_alloc_init(CarMapTrackingController);
    v5 = self->_trackingController;
    self->_trackingController = v4;

    trackingController = self->_trackingController;
  }

  return trackingController;
}

- (void)setInitialTrackingIfNeededAndPossible
{
  v3 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  v4 = [v3 _maps_mapsSceneDelegate];
  v5 = [v4 entryPointsCoordinator];
  unsigned __int8 v6 = [v5 didLaunchWithExplicitIntent];

  if (!self->_didSetInitialTracking && (v6 & 1) == 0)
  {
    v7 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
    id v12 = [v7 mapView];

    v8 = [v12 userLocation];
    v9 = [v8 location];

    if (v9)
    {
      self->_didSetInitialTracking = 1;
      v10 = [(CarBasicMapBrowsingModeController *)self carChromeViewController];
      v11 = [v10 defaultMapSettings];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_100BA1040;
      v13[3] = &unk_1012E7D28;
      v13[4] = self;
      [v11 applyToMapViewAnimated:0 duration:v13 completion:0.0];
    }
    else
    {
    }
  }
}

- (void)setVisibleMapRegion:(id *)a3 animated:(BOOL)a4
{
  char v8 = (char)a3;
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v5;
  uint64_t v12 = v4;
  self->_didSetInitialTracking = 1;
  v14 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100BA1120;
  v15[3] = &unk_10131A408;
  v15[4] = self;
  v15[5] = v12;
  v15[6] = v11;
  v15[7] = v10;
  v15[8] = v9;
  char v16 = v8;
  [v14 whenContextNextBecomesCurrent:self performAction:@"SetMapRegion" withBlock:v15];
}

- (void)setMapCamera:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  if (v6)
  {
    self->_didSetInitialTracking = 1;
    uint64_t v7 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100BA12A8;
    v8[3] = &unk_1012ED4B8;
    v8[4] = self;
    id v9 = v6;
    BOOL v10 = a4;
    [v7 whenContextNextBecomesCurrent:self performAction:@"SetMapRegion" withBlock:v8];
  }
}

- (BOOL)showsMapView
{
  return 1;
}

- (void)configureNavigationDisplay:(id)a3
{
  id v3 = a3;
  [v3 setCameraStyle:4];
  [v3 setRouteGeniusEntry:0];
  [v3 setCameraPaused:0];
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100BA13E8;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [a4 addPreparation:v4];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100BA15A0;
  v4[3] = &unk_1012E5D08;
  v4[4] = self;
  [a4 addPreparation:v4];
}

- (NSArray)carFocusOrderSequences
{
  return (NSArray *)&__NSArray0__struct;
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
  objc_storeStrong((id *)&self->_trackingController, 0);

  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end