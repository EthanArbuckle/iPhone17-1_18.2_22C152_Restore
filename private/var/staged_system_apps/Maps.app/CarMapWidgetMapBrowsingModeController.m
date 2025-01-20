@interface CarMapWidgetMapBrowsingModeController
- (BOOL)_mapViewCanChangeUserTrackingModeWhenRegionDidChange:(id)a3;
- (BOOL)allowMapZoomAndRecentering;
- (BOOL)hidesStatusBanner;
- (CarMapWidgetMapBrowsingModeController)init;
- (CarPreciseLocationOffButtonCardViewController)preciseLocationOffButtonCardController;
- (ChromeMapSettings)mapSettings;
- (id)carFocusOrderSequences;
- (id)desiredCards;
- (void)_sceneWillEnterForeground:(id)a3;
- (void)applyMapSettingsAndTrackingAnimated:(BOOL)a3;
- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)carDisplayConfigDidChangeNotification:(id)a3;
- (void)configureCard:(id)a3 forKey:(id)a4;
- (void)locationManagerApprovalDidChange:(id)a3;
- (void)preciseLocationOffButtonCard:(id)a3 visibilityUpdated:(BOOL)a4;
- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4;
- (void)setMapSettings:(id)a3;
- (void)setPreciseLocationOffButtonCardController:(id)a3;
@end

@implementation CarMapWidgetMapBrowsingModeController

- (CarMapWidgetMapBrowsingModeController)init
{
  v7.receiver = self;
  v7.super_class = (Class)CarMapWidgetMapBrowsingModeController;
  v2 = [(CarMapWidgetMapBrowsingModeController *)&v7 init];
  if (v2)
  {
    v3 = [[CarPreciseLocationOffButtonCardViewController alloc] initWithDelegate:v2];
    preciseLocationOffButtonCardController = v2->_preciseLocationOffButtonCardController;
    v2->_preciseLocationOffButtonCardController = v3;

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"carDisplayConfigDidChangeNotification:" name:@"CarDisplayConfigDidChangeNotification" object:0];
  }
  return v2;
}

- (id)desiredCards
{
  if ([(CarPreciseLocationOffButtonCardViewController *)self->_preciseLocationOffButtonCardController shouldBeVisible])
  {
    CFStringRef v4 = @"PreciseLocationOffButton";
    v2 = +[NSArray arrayWithObjects:&v4 count:1];
  }
  else
  {
    v2 = &__NSArray0__struct;
  }

  return v2;
}

- (void)configureCard:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  if ([a4 isEqualToString:@"PreciseLocationOffButton"])
  {
    objc_super v7 = [(CarMapWidgetMapBrowsingModeController *)self preciseLocationOffButtonCardController];
    [v6 setContent:v7];

    memset(v20, 0, sizeof(v20));
    v13[0] = 1;
    memset(&v13[1], 0, 24);
    v13[4] = 2;
    v13[5] = 1148846080;
    v13[6] = 0;
    int v14 = 1065353216;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    __asm { FMOV            V0.2D, #8.0 }
    long long v17 = _Q0;
    long long v18 = _Q0;
    char v19 = 1;
    uint64_t v21 = 4;
    char v22 = 0;
    if (v6) {
      [v6 setLayout:v13];
    }
    [v6 setAccessory:0];
  }
}

- (BOOL)hidesStatusBanner
{
  v2 = [(CarMapWidgetMapBrowsingModeController *)self carChromeViewController];
  v3 = (char *)[v2 sceneType];
  if ((unint64_t)(v3 - 4) < 4 || v3 == (char *)1)
  {

    return +[CarDisplayConfigAuxiliaryTask centerConsoleSceneCount] != 0;
  }
  else
  {

    return 0;
  }
}

- (void)preciseLocationOffButtonCard:(id)a3 visibilityUpdated:(BOOL)a4
{
  v5 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  unsigned __int8 v6 = [v5 isCurrentContext:self];

  if (v6)
  {
    id v8 = [(CarMapWidgetMapBrowsingModeController *)self carChromeViewController];
    [v8 updateCardsForContext:self animated:1];
  }
  else
  {
    objc_super v7 = sub_100015DB4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "mapBrowsing mode tried to update precise location off visibility, but it is not the current mode.", buf, 2u);
    }
  }
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CarMapWidgetMapBrowsingModeController;
  id v6 = a4;
  [(CarBasicMapBrowsingModeController *)&v12 becomeTopContextInChromeViewController:a3 withAnimation:v6];
  objc_super v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:self selector:"_sceneWillEnterForeground:" name:UISceneWillEnterForegroundNotification object:0];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"locationManagerApprovalDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100404440;
  v11[3] = &unk_1012E5D08;
  v11[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1004044C0;
  v9[3] = &unk_1012E8908;
  v9[4] = self;
  unsigned __int8 v10 = [v6 isAnimated];
  [v6 addPreparation:v11 animations:&stru_1012E9498 completion:v9];
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CarMapWidgetMapBrowsingModeController;
  id v7 = a4;
  [(CarBasicMapBrowsingModeController *)&v12 resignTopContextInChromeViewController:v6 withAnimation:v7];
  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1004045C8;
  v10[3] = &unk_1012E5D58;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 addPreparation:v10];
}

- (BOOL)allowMapZoomAndRecentering
{
  return 1;
}

- (BOOL)_mapViewCanChangeUserTrackingModeWhenRegionDidChange:(id)a3
{
  return 0;
}

- (void)_sceneWillEnterForeground:(id)a3
{
  CFStringRef v4 = [a3 object];
  v5 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  id v6 = [v5 _maps_uiScene];

  if (v4 == v6)
  {
    id v7 = [(CarMapWidgetMapBrowsingModeController *)self carChromeViewController];
    id v8 = [v7 defaultMapSettings];
    [v8 reload];

    [(CarMapWidgetMapBrowsingModeController *)self applyMapSettingsAndTrackingAnimated:0];
  }
}

- (void)locationManagerApprovalDidChange:(id)a3
{
}

- (void)applyMapSettingsAndTrackingAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
  unsigned int v6 = [v5 isCurrentContext:self];

  if (v6)
  {
    v13 = [[ChromeMapSettings alloc] initWithType:1 userInterfaceIdiom:3];
    if ([(ChromeMapSettings *)v13 trackingMode]) {
      uint64_t v7 = [(ChromeMapSettings *)v13 trackingMode];
    }
    else {
      uint64_t v7 = 2;
    }
    id v8 = [(CarBasicMapBrowsingModeController *)self trackingController];
    [v8 setForcedTrackingMode:v7];

    id v9 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
    [(ChromeMapSettings *)v13 setDelegate:v9];

    unsigned __int8 v10 = [(CarBasicMapBrowsingModeController *)self chromeViewController];
    id v11 = [v10 mapView];
    [(ChromeMapSettings *)v13 setMapView:v11];

    [(ChromeMapSettings *)v13 setTrackingMode:v7];
    [(CarMapWidgetMapBrowsingModeController *)self setMapSettings:v13];
    objc_super v12 = [(CarMapWidgetMapBrowsingModeController *)self mapSettings];
    [v12 applyToMapViewAnimated:v3 duration:0 completion:-1.0];
  }
}

- (id)carFocusOrderSequences
{
  return &__NSArray0__struct;
}

- (void)carDisplayConfigDidChangeNotification:(id)a3
{
  id v3 = [(CarMapWidgetMapBrowsingModeController *)self carChromeViewController];
  [v3 setNeedsUpdateComponent:@"statusBanner" animated:0];
}

- (ChromeMapSettings)mapSettings
{
  return self->_mapSettings;
}

- (void)setMapSettings:(id)a3
{
}

- (CarPreciseLocationOffButtonCardViewController)preciseLocationOffButtonCardController
{
  return self->_preciseLocationOffButtonCardController;
}

- (void)setPreciseLocationOffButtonCardController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preciseLocationOffButtonCardController, 0);

  objc_storeStrong((id *)&self->_mapSettings, 0);
}

@end