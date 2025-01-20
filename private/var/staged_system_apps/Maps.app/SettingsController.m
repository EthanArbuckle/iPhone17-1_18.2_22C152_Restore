@interface SettingsController
+ (BOOL)deviceSupportsGlobe;
- (BOOL)canToggleLabels;
- (BOOL)canToggleTraffic;
- (BOOL)in3DMode;
- (BOOL)shouldChangeViewModeForLabels;
- (BOOL)shouldChangeViewModeForTraffic;
- (BOOL)showsAirQualityIndex;
- (BOOL)showsEnvironments;
- (BOOL)showsLabels;
- (BOOL)showsRadarComposer;
- (BOOL)showsTraffic;
- (BOOL)showsWeather;
- (BOOL)userDesiresLabels;
- (BOOL)userDesiresTraffic;
- (BOOL)userRequestingViewModeChange;
- (IOSBasedChromeViewController)chrome;
- (MKMapAttribution)mapAttribution;
- (NSArray)selectableViewModes;
- (SettingsController)init;
- (SettingsTipController)settingsTipController;
- (int64_t)bestMapViewModeForViewMode:(int64_t)a3;
- (int64_t)bestMapViewModeForViewMode:(int64_t)a3 ignoringLabelPreference:(BOOL)a4;
- (int64_t)mapViewMode;
- (int64_t)selectedViewMode;
- (void)_offlineStateChanged;
- (void)_openURL:(id)a3;
- (void)_userDefaultsDidChange;
- (void)presentAttributions;
- (void)proceedToEnvironmentsSelector;
- (void)setChrome:(id)a3;
- (void)setMapViewMode:(int64_t)a3;
- (void)setMapViewMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setSelectedViewMode:(int64_t)a3;
- (void)setSelectedViewMode:(int64_t)a3 animated:(BOOL)a4;
- (void)setShouldChangeViewModeForLabels:(BOOL)a3;
- (void)setShouldChangeViewModeForTraffic:(BOOL)a3;
- (void)setShowsLabels:(BOOL)a3;
- (void)setShowsTraffic:(BOOL)a3;
- (void)setUserDesiresLabels:(BOOL)a3;
- (void)setUserDesiresLabels:(BOOL)a3 shouldForceUpdateMapViewDisplayOptions:(BOOL)a4;
- (void)setUserDesiresTraffic:(BOOL)a3;
- (void)setUserDesiresTraffic:(BOOL)a3 shouldForceUpdateMapViewDisplayOptions:(BOOL)a4;
- (void)setUserRequestingViewModeChange:(BOOL)a3;
- (void)toggleAirQualityIndex;
- (void)toggleLabels;
- (void)toggleTraffic;
- (void)toggleWeather;
@end

@implementation SettingsController

- (SettingsController)init
{
  v7.receiver = self;
  v7.super_class = (Class)SettingsController;
  v2 = [(SettingsController *)&v7 init];
  if (v2)
  {
    v3 = +[NSUserDefaults standardUserDefaults];
    v2->_showsEnvironments = [v3 BOOLForKey:@"ShowEnvironmentInfoInSettings"];

    v2->_showsRadarComposer = 1;
    v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"_userDefaultsDidChange" name:NSUserDefaultsDidChangeNotification object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"_offlineStateChanged" name:@"UsingOfflineMapsStateChangedNotification" object:0];
  }
  return v2;
}

- (SettingsTipController)settingsTipController
{
  if (!self->_settingsTipController)
  {
    v3 = [(SettingsController *)self chrome];
    uint64_t v4 = sub_1000BBB44(v3);

    if (v4 != 5)
    {
      v5 = [SettingsTipController alloc];
      v6 = [(SettingsController *)self chrome];
      objc_super v7 = [(SettingsTipController *)v5 initWithChromeViewController:v6];
      settingsTipController = self->_settingsTipController;
      self->_settingsTipController = v7;
    }
  }
  v9 = self->_settingsTipController;

  return v9;
}

- (IOSBasedChromeViewController)chrome
{
  p_chrome = &self->_chrome;

  id WeakRetained = objc_loadWeakRetained((id *)p_chrome);

  return (IOSBasedChromeViewController *)WeakRetained;
}

- (void)_userDefaultsDidChange
{
  v3 = +[NSUserDefaults standardUserDefaults];
  unsigned int v4 = [v3 BOOLForKey:@"ShowEnvironmentInfoInSettings"];

  int showsEnvironments = self->_showsEnvironments;
  self->_int showsEnvironments = v4;
  if (showsEnvironments != v4)
  {
    id v6 = +[NSNotificationCenter defaultCenter];
    [v6 postNotificationName:@"SettingsControllerDidChange" object:self];
  }
}

+ (BOOL)deviceSupportsGlobe
{
  return +[VKMapView _globeIsEnabled];
}

- (BOOL)userDesiresTraffic
{
  return +[MapsSettings userDesiresTraffic];
}

- (BOOL)userDesiresLabels
{
  return +[MapsSettings userDesiresLabels];
}

- (BOOL)shouldChangeViewModeForTraffic
{
  return self->_shouldChangeViewModeForTraffic;
}

- (BOOL)shouldChangeViewModeForLabels
{
  return self->_shouldChangeViewModeForLabels;
}

- (void)setChrome:(id)a3
{
}

- (void)_offlineStateChanged
{
  id v4 = +[MapsOfflineUIHelper sharedHelper];
  if ([v4 isUsingOfflineMaps])
  {
    int64_t v3 = [(SettingsController *)self selectedViewMode];

    if (v3 == 2)
    {
      [(SettingsController *)self setMapViewMode:0 animated:0];
    }
  }
  else
  {
  }
}

- (BOOL)showsLabels
{
  v2 = [(SettingsController *)self chrome];
  id v3 = [v2 displayedViewMode];

  return ((unint64_t)v3 + 1 < 9) & (0x157u >> ((_BYTE)v3 + 1));
}

- (BOOL)showsTraffic
{
  v2 = [(SettingsController *)self chrome];
  id v3 = [v2 mapView];
  unsigned __int8 v4 = [v3 showsTraffic];

  return v4;
}

- (void)toggleLabels
{
  if ([(SettingsController *)self canToggleLabels])
  {
    uint64_t v3 = [(SettingsController *)self showsLabels] ^ 1;
    [(SettingsController *)self setShouldChangeViewModeForLabels:1];
    [(SettingsController *)self setShowsLabels:v3];
    [(SettingsController *)self setShouldChangeViewModeForLabels:0];
  }
}

- (void)toggleTraffic
{
  if ([(SettingsController *)self canToggleTraffic])
  {
    unsigned __int8 v3 = [(SettingsController *)self showsLabels];
    unsigned int v4 = [(SettingsController *)self showsTraffic];
    char v5 = v4;
    uint64_t v6 = v4 ^ 1;
    [(SettingsController *)self setShouldChangeViewModeForTraffic:1];
    [(SettingsController *)self setShowsTraffic:v6];
    [(SettingsController *)self setShouldChangeViewModeForTraffic:0];
    if ((v5 & 1) == 0 && (v3 & 1) == 0)
    {
      [(SettingsController *)self setShowsLabels:1];
    }
  }
}

- (void)toggleWeather
{
  uint64_t v2 = [(SettingsController *)self showsWeather] ^ 1;

  +[MapsSettings setShowsWeather:v2];
}

- (void)toggleAirQualityIndex
{
  uint64_t v2 = [(SettingsController *)self showsAirQualityIndex] ^ 1;

  +[MapsSettings setShowsAirQualityIndex:v2];
}

- (BOOL)showsWeather
{
  return +[MapsSettings showsWeather];
}

- (BOOL)showsAirQualityIndex
{
  return +[MapsSettings showsAirQualityIndex];
}

- (MKMapAttribution)mapAttribution
{
  unsigned __int8 v3 = +[UITraitCollection _currentTraitCollection];
  unsigned int v4 = [(SettingsController *)self chrome];
  char v5 = [v4 traitCollection];
  +[UITraitCollection _setCurrentTraitCollection:v5];

  uint64_t v6 = [(SettingsController *)self chrome];
  objc_super v7 = [v6 mapView];
  v13[0] = NSFontAttributeName;
  v8 = +[UIFont system11];
  v14[0] = v8;
  v13[1] = NSForegroundColorAttributeName;
  v9 = +[UIColor labelColor];
  v14[1] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  v11 = [v7 mapAttributionWithStringAttributes:v10 underlineText:1];

  +[UITraitCollection _setCurrentTraitCollection:v3];

  return (MKMapAttribution *)v11;
}

- (BOOL)canToggleLabels
{
  uint64_t v2 = [(SettingsController *)self chrome];
  id v3 = [v2 displayedViewMode];

  return (((unint64_t)v3 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0;
}

- (BOOL)canToggleTraffic
{
  uint64_t v2 = [(SettingsController *)self chrome];
  id v3 = [v2 displayedViewMode];

  return (((unint64_t)v3 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0;
}

- (void)proceedToEnvironmentsSelector
{
  id v2 = objc_alloc((Class)UINavigationController);
  id v3 = [[EnvironmentsViewController alloc] initWithStyle:1];
  id v5 = [v2 initWithRootViewController:v3];

  unsigned int v4 = +[UIApplication sharedMapsDelegate];
  [v4 presentViewController:v5 animated:1];
}

- (void)_openURL:(id)a3
{
  id v4 = a3;
  id v5 = [(SettingsController *)self chrome];
  uint64_t v6 = [v5 appCoordinator];
  id v7 = [v6 baseActionCoordinator];

  [v7 viewController:0 openURL:v4];
}

- (void)presentAttributions
{
  id v3 = [(SettingsController *)self mapAttribution];
  id v4 = [v3 plainTextFileURL];
  if (GEOConfigGetBOOL()) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5
    || (+[GEONetworkObserver sharedNetworkObserver],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 isNetworkReachable],
        v6,
        (v7 & 1) != 0))
  {
    v8 = [v3 url];
    if (v8) {
      [(SettingsController *)self _openURL:v8];
    }
  }
  else
  {
    v9 = sub_10057624C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Attempting to present attribution details, but network is offline. Presenting cached plain-text version instead", v13, 2u);
    }

    v10 = [(SettingsController *)self chrome];
    v11 = [v10 appCoordinator];
    v12 = [v11 baseActionCoordinator];

    [v12 viewController:0 openPlainTextFileURL:v4];
  }
}

- (void)setShowsLabels:(BOOL)a3
{
}

- (void)setShowsTraffic:(BOOL)a3
{
}

- (void)setUserDesiresLabels:(BOOL)a3 shouldForceUpdateMapViewDisplayOptions:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(SettingsController *)self userDesiresLabels] == a3)
  {
    if (!v4) {
      return;
    }
  }
  else
  {
    +[MapsSettings setUserDesiresLabels:v5];
  }
  id v7 = [(SettingsController *)self chrome];
  [v7 updateMapViewDisplayOptions];
}

- (void)setUserDesiresLabels:(BOOL)a3
{
}

- (void)setUserDesiresTraffic:(BOOL)a3 shouldForceUpdateMapViewDisplayOptions:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(SettingsController *)self userDesiresTraffic] == a3)
  {
    if (!v4) {
      return;
    }
  }
  else
  {
    +[MapsSettings setUserDesiresTraffic:v5];
  }
  id v7 = [(SettingsController *)self chrome];
  [v7 updateMapViewDisplayOptions];
}

- (void)setUserDesiresTraffic:(BOOL)a3
{
}

- (BOOL)in3DMode
{
  id v3 = [(SettingsController *)self chrome];
  BOOL v4 = [v3 mapView];
  unsigned __int8 v5 = [v4 _isPitched];

  uint64_t v6 = [(SettingsController *)self chrome];
  id v7 = [v6 mapView];
  LOBYTE(v4) = [v7 _canEnter3DMode] & v5;

  return (char)v4;
}

- (int64_t)mapViewMode
{
  id v2 = [(SettingsController *)self chrome];
  id v3 = [v2 displayedViewMode];

  return (int64_t)v3;
}

- (void)setMapViewMode:(int64_t)a3
{
}

- (void)setMapViewMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_userRequestingViewModeChange = 1;
  id v7 = [(SettingsController *)self chrome];
  v8 = [v7 topIOSBasedContext];

  char v9 = objc_opt_respondsToSelector();
  v10 = sub_10057624C();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      int v14 = 138543362;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Updating view mode on context %{public}@", (uint8_t *)&v14, 0xCu);
    }

    [v8 updateViewMode:a3 animated:v4];
  }
  else
  {
    if (v11)
    {
      v12 = [(SettingsController *)self chrome];
      int v14 = 138543362;
      v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Updating view mode on chrome %{public}@", (uint8_t *)&v14, 0xCu);
    }
    v13 = [(SettingsController *)self chrome];
    [v13 updateViewMode:a3 animated:v4];
  }
  self->_userRequestingViewModeChange = 0;
}

- (NSArray)selectableViewModes
{
  return (NSArray *)&off_1013AE358;
}

- (int64_t)selectedViewMode
{
  unint64_t v2 = [(SettingsController *)self mapViewMode];
  if (v2 > 7) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = qword_100F72D30[v2];
  }
  if (((v3 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0) {
    return v3;
  }
  else {
    return 2;
  }
}

- (void)setSelectedViewMode:(int64_t)a3
{
}

- (void)setSelectedViewMode:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ((unint64_t)a3 > 7) {
    unint64_t v6 = 0;
  }
  else {
    unint64_t v6 = qword_100F72D30[a3];
  }
  if (((v6 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = 2;
  }
  +[MapsSettings setSelectedViewMode:v7];
  int64_t v8 = [(SettingsController *)self bestMapViewModeForViewMode:v7];
  char v9 = sub_10057624C();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v7 < 8 && ((0xEFu >> v7) & 1) != 0)
    {
      v10 = *(&off_101312708 + v7);
    }
    else
    {
      v10 = +[NSString stringWithFormat:@"<Unknown: %ld>", v7];
    }
    id v11 = v10;
    int64_t v12 = v8 + 1;
    if (unint64_t)(v8 + 1) < 9 && ((0x1DFu >> v12))
    {
      v13 = *(&off_101312748 + v12);
    }
    else
    {
      v13 = +[NSString stringWithFormat:@"<Unknown: %ld>", v8];
    }
    *(_DWORD *)buf = 138543618;
    id v15 = v11;
    __int16 v16 = 2114;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Selected view mode was %{public}@; setting best view mode %{public}@",
      buf,
      0x16u);
  }
  [(SettingsController *)self setMapViewMode:v8 animated:v4];
}

- (int64_t)bestMapViewModeForViewMode:(int64_t)a3
{
  return [(SettingsController *)self bestMapViewModeForViewMode:a3 ignoringLabelPreference:0];
}

- (int64_t)bestMapViewModeForViewMode:(int64_t)a3 ignoringLabelPreference:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v7 = [(SettingsController *)self userDesiresLabels];
  if (v4) {
    BOOL v8 = (a3 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  }
  else {
    BOOL v8 = v7;
  }
  if ([(id)objc_opt_class() deviceSupportsGlobe]) {
    unsigned int v9 = 1;
  }
  else {
    unsigned int v9 = [(SettingsController *)self in3DMode];
  }
  int64_t v10 = 0;
  if ((unint64_t)a3 <= 7 && a3 != 4)
  {
    int64_t v11 = 1;
    if (!v8) {
      int64_t v11 = 2;
    }
    uint64_t v12 = 5;
    if (!v8) {
      uint64_t v12 = 6;
    }
    if (v9) {
      int64_t v11 = v12;
    }
    if (((a3 - 1) & 0xFFFFFFFFFFFFFFFALL) != 0) {
      return a3;
    }
    else {
      return v11;
    }
  }
  return v10;
}

- (BOOL)showsEnvironments
{
  return self->_showsEnvironments;
}

- (BOOL)showsRadarComposer
{
  return self->_showsRadarComposer;
}

- (void)setShouldChangeViewModeForLabels:(BOOL)a3
{
  self->_shouldChangeViewModeForLabels = a3;
}

- (void)setShouldChangeViewModeForTraffic:(BOOL)a3
{
  self->_shouldChangeViewModeForTraffic = a3;
}

- (BOOL)userRequestingViewModeChange
{
  return self->_userRequestingViewModeChange;
}

- (void)setUserRequestingViewModeChange:(BOOL)a3
{
  self->_userRequestingViewModeChange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsTipController, 0);

  objc_destroyWeak((id *)&self->_chrome);
}

@end