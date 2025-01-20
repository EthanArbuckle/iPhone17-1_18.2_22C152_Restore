@interface SettingsTipController
- (BOOL)shouldShowTip;
- (GEOObserverHashTable)observers;
- (IOSBasedChromeViewController)chromeViewController;
- (SettingsTipController)initWithChromeViewController:(id)a3;
- (id)_baseActionCoordinator;
- (id)_venuesManager;
- (int64_t)impressionState;
- (int64_t)sessionState;
- (void)_cancelImpressionTimer;
- (void)_incrementImpressionCount;
- (void)_incrementSessionCount;
- (void)_markAsSeenOrClosed;
- (void)_routePlanningPresentedDidChange:(id)a3;
- (void)_sceneDidEnterBackground:(id)a3;
- (void)_sceneWillEnterForeground:(id)a3;
- (void)_startImpressionTimer;
- (void)_transitionIfImpressionState:(int64_t)a3 toImpressionState:(int64_t)a4;
- (void)_transitionIfSessionState:(int64_t)a3 toSessionState:(int64_t)a4;
- (void)dealloc;
- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5;
- (void)settingsOpened;
- (void)settingsTipClosed;
- (void)settingsTipShown;
@end

@implementation SettingsTipController

- (void)_incrementSessionCount
{
  v2 = +[NSUserDefaults standardUserDefaults];
  v3 = (char *)[v2 integerForKey:@"SettingsTipLaunchCount"];

  if ((uint64_t)v3 < GEOConfigGetUInteger())
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setInteger:v3 + 1 forKey:@"SettingsTipLaunchCount"];
  }
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    id v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___SettingsTipControllerObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (id)_venuesManager
{
  v2 = [(SettingsTipController *)self _baseActionCoordinator];
  v3 = [v2 venuesManager];

  return v3;
}

- (id)_baseActionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v3 = [WeakRetained appCoordinator];
  id v4 = [v3 baseActionCoordinator];

  return v4;
}

- (SettingsTipController)initWithChromeViewController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SettingsTipController;
  v5 = [(SettingsTipController *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_chromeViewController, v4);
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v6 selector:"_sceneWillEnterForeground:" name:UISceneWillEnterForegroundNotification object:0];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v6 selector:"_sceneDidEnterBackground:" name:UISceneDidEnterBackgroundNotification object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v6 selector:"_routePlanningPresentedDidChange:" name:@"RoutePlanningPresentedDidChangeNotification" object:0];

    v10 = [(SettingsTipController *)v6 _venuesManager];
    [v10 addChangeObserver:v6];

    [(SettingsTipController *)v6 _transitionIfSessionState:0 toSessionState:1];
  }

  return v6;
}

- (BOOL)shouldShowTip
{
  if ([UIApp launchedToTest]) {
    return 0;
  }
  if (!self->_sessionState) {
    return 0;
  }
  if (self->_impressionState == 2) {
    return 0;
  }
  v3 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v4 = [v3 BOOLForKey:@"SettingsTipKey"];

  if (v4) {
    return 0;
  }
  v5 = +[NSUserDefaults standardUserDefaults];
  id v6 = [v5 integerForKey:@"SettingsTipLaunchCount"];

  uint64_t UInteger = GEOConfigGetUInteger();
  if ((uint64_t)v6 < UInteger && UInteger > 0) {
    return 0;
  }
  v9 = +[NSUserDefaults standardUserDefaults];
  id v10 = [v9 integerForKey:@"SettingsTipImpressionCount"];

  if ((uint64_t)v10 >= GEOConfigGetUInteger()) {
    return 0;
  }
  if (!+[MapsSettings userDesiresTraffic]) {
    return 0;
  }
  v11 = [(SettingsTipController *)self _baseActionCoordinator];
  unsigned __int8 v12 = [v11 isRoutePlanningPresented];

  if (v12) {
    return 0;
  }
  v15 = [(SettingsTipController *)self _venuesManager];
  v16 = [v15 venueWithFocus];
  BOOL v13 = v16 == 0;

  return v13;
}

- (void)_transitionIfSessionState:(int64_t)a3 toSessionState:(int64_t)a4
{
  int64_t sessionState = self->_sessionState;
  if (sessionState == a3 || sessionState == a4)
  {
    self->_int64_t sessionState = a4;
    if (a4 == 1)
    {
      [(SettingsTipController *)self _incrementSessionCount];
    }
    else if (!a4)
    {
      -[SettingsTipController _transitionIfImpressionState:toImpressionState:](self, "_transitionIfImpressionState:toImpressionState:", self->_impressionState);
    }
    observers = self->_observers;
    [(GEOObserverHashTable *)observers settingsTipControllerDidUpdate:self];
  }
}

- (void)dealloc
{
  [(SettingsTipController *)self _cancelImpressionTimer];
  v3.receiver = self;
  v3.super_class = (Class)SettingsTipController;
  [(SettingsTipController *)&v3 dealloc];
}

- (void)settingsTipShown
{
}

- (void)settingsOpened
{
}

- (void)settingsTipClosed
{
}

- (void)_markAsSeenOrClosed
{
  objc_super v3 = +[NSUserDefaults standardUserDefaults];
  [v3 setBool:1 forKey:@"SettingsTipKey"];

  [(SettingsTipController *)self _transitionIfImpressionState:1 toImpressionState:2];
}

- (void)_transitionIfImpressionState:(int64_t)a3 toImpressionState:(int64_t)a4
{
  int64_t impressionState = self->_impressionState;
  if (impressionState != a3 && impressionState != a4) {
    return;
  }
  self->_int64_t impressionState = a4;
  switch(a4)
  {
    case 2:
      goto LABEL_9;
    case 1:
      [(SettingsTipController *)self _incrementImpressionCount];
      [(SettingsTipController *)self _startImpressionTimer];
      break;
    case 0:
LABEL_9:
      [(SettingsTipController *)self _cancelImpressionTimer];
      break;
  }
  observers = self->_observers;

  [(GEOObserverHashTable *)observers settingsTipControllerDidUpdate:self];
}

- (void)_incrementImpressionCount
{
  v2 = +[NSUserDefaults standardUserDefaults];
  objc_super v3 = (char *)[v2 integerForKey:@"SettingsTipImpressionCount"];

  if ((uint64_t)v3 < GEOConfigGetUInteger())
  {
    id v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setInteger:v3 + 1 forKey:@"SettingsTipImpressionCount"];
  }
}

- (void)_startImpressionTimer
{
  if (!self->_impressionTimer)
  {
    GEOConfigGetDouble();
    double v4 = v3;
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10047131C;
    v7[3] = &unk_1012E73C8;
    objc_copyWeak(&v8, &location);
    v5 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v7 block:v4];
    impressionTimer = self->_impressionTimer;
    self->_impressionTimer = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

- (void)_cancelImpressionTimer
{
  [(NSTimer *)self->_impressionTimer invalidate];
  impressionTimer = self->_impressionTimer;
  self->_impressionTimer = 0;
}

- (void)_sceneWillEnterForeground:(id)a3
{
  double v4 = [a3 object];
  v5 = [(SettingsTipController *)self chromeViewController];
  id v6 = [v5 view];
  v7 = [v6 window];
  id v8 = [v7 windowScene];

  if (v4 == v8)
  {
    [(SettingsTipController *)self _transitionIfSessionState:0 toSessionState:1];
  }
}

- (void)_sceneDidEnterBackground:(id)a3
{
  double v4 = [a3 object];
  v5 = [(SettingsTipController *)self chromeViewController];
  id v6 = [v5 view];
  v7 = [v6 window];
  id v8 = [v7 windowScene];

  if (v4 == v8)
  {
    [(SettingsTipController *)self _transitionIfSessionState:1 toSessionState:0];
  }
}

- (void)_routePlanningPresentedDidChange:(id)a3
{
  double v4 = [a3 object];
  v5 = [(SettingsTipController *)self _baseActionCoordinator];

  if (v4 == v5)
  {
    id v6 = [(SettingsTipController *)self _baseActionCoordinator];
    unsigned int v7 = [v6 isRoutePlanningPresented];

    if (v7)
    {
      [(SettingsTipController *)self _transitionIfImpressionState:1 toImpressionState:2];
    }
  }
}

- (void)didChangeFocusedVenue:(id)a3 focusedBuilding:(id)a4 displayedFloorOrdinal:(signed __int16)a5
{
  if (a3) {
    -[SettingsTipController _transitionIfImpressionState:toImpressionState:](self, "_transitionIfImpressionState:toImpressionState:", 1, 2, a5);
  }
}

- (IOSBasedChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (IOSBasedChromeViewController *)WeakRetained;
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (int64_t)impressionState
{
  return self->_impressionState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_impressionTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_destroyWeak((id *)&self->_chromeViewController);
}

@end