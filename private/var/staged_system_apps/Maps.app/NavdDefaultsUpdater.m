@interface NavdDefaultsUpdater
+ (int64_t)creationPreference;
- (CarDisplayController)carDisplayController;
- (MNNavigationService)navigationService;
- (NSUserDefaults)userDefaults;
- (NavdDefaultsUpdater)initWithDefaults:(id)a3 navigationService:(id)a4 carDisplayController:(id)a5;
- (NavigationSession)navigationSession;
- (NavigationSettingsMonitor)settingsMonitor;
- (RoutePlanningSession)routePlanningSession;
- (int64_t)_currentTransportType;
- (void)_migrateDeprecatedSettings;
- (void)_startObserving;
- (void)_updateSettings;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)setNavigationSession:(id)a3;
- (void)setRoutePlanningSession:(id)a3;
@end

@implementation NavdDefaultsUpdater

- (void)_migrateDeprecatedSettings
{
  v3 = [(NavdDefaultsUpdater *)self userDefaults];
  id v13 = [v3 objectForKey:@"VoiceNavigationVolume"];

  v4 = v13;
  if (v13)
  {
    id v5 = v13;
    if (qword_10160F918 != -1) {
      dispatch_once(&qword_10160F918, &stru_1012F8C20);
    }
    id v6 = (id)qword_10160F910;
    id v7 = [v5 isEqualToString:@"Off Volume"];
    if ((v7 & 1) == 0)
    {
      v8 = [v6 path];
      _CFPreferencesSetAppValueWithContainer();
    }
    if (qword_10160F918 != -1) {
      dispatch_once(&qword_10160F918, &stru_1012F8C20);
    }
    id v9 = (id)qword_10160F910;
    +[NSNumber numberWithBool:v7];
    v10 = [v9 path];
    _CFPreferencesSetAppValueWithContainer();

    v11 = [v9 path];

    _CFPreferencesSynchronizeWithContainer();
    GSSendAppPreferencesChanged();
    GSSendAppPreferencesChanged();

    v12 = [(NavdDefaultsUpdater *)self userDefaults];
    [v12 removeObjectForKey:@"VoiceNavigationVolume"];

    v4 = v13;
  }
}

- (void)_startObserving
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_carPlayConnectionUpdated:" name:@"CarDisplayDidChangeConnectedNotification" object:0];

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_sceneDidActivateNotification:" name:UISceneDidActivateNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_navigationSettingsUpdated:" name:@"NavigationSettingsMonitorDidUpdateSettings" object:self->_settingsMonitor];
}

- (NavdDefaultsUpdater)initWithDefaults:(id)a3 navigationService:(id)a4 carDisplayController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NavdDefaultsUpdater;
  v12 = [(NavdDefaultsUpdater *)&v17 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_userDefaults, a3);
    objc_storeStrong((id *)&v13->_navigationService, a4);
    objc_storeStrong((id *)&v13->_carDisplayController, a5);
    v14 = [[NavigationSettingsMonitor alloc] initWithUserDefaults:v9];
    settingsMonitor = v13->_settingsMonitor;
    v13->_settingsMonitor = v14;

    [(NavdDefaultsUpdater *)v13 _migrateDeprecatedSettings];
    [(NavdDefaultsUpdater *)v13 _startObserving];
    [(NavdDefaultsUpdater *)v13 _updateSettings];
  }

  return v13;
}

- (void)_updateSettings
{
  v3 = [(NavdDefaultsUpdater *)self carDisplayController];
  id v4 = [v3 isCurrentlyConnectedToAnyCarScene];
  id v5 = [(NavdDefaultsUpdater *)self settingsMonitor];
  [v5 setIsCarPlay:v4];

  int64_t v6 = [(NavdDefaultsUpdater *)self _currentTransportType];
  id v7 = [(NavdDefaultsUpdater *)self settingsMonitor];
  [v7 setTransportType:v6];

  id v10 = [(NavdDefaultsUpdater *)self navigationService];
  v8 = [(NavdDefaultsUpdater *)self settingsMonitor];
  id v9 = [v8 userOptions];
  [v10 changeUserOptions:v9];
}

- (NavigationSettingsMonitor)settingsMonitor
{
  return self->_settingsMonitor;
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (CarDisplayController)carDisplayController
{
  return self->_carDisplayController;
}

- (int64_t)_currentTransportType
{
  v3 = [(NavdDefaultsUpdater *)self routePlanningSession];

  if (v3)
  {
    id v4 = [(NavdDefaultsUpdater *)self routePlanningSession];
LABEL_5:
    int64_t v6 = v4;
    id v7 = [v4 currentTransportType];

    return (int64_t)v7;
  }
  id v5 = [(NavdDefaultsUpdater *)self navigationSession];

  if (v5)
  {
    id v4 = [(NavdDefaultsUpdater *)self navigationSession];
    goto LABEL_5;
  }
  return 0;
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

+ (int64_t)creationPreference
{
  return 1;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;
  [(NavdDefaultsUpdater *)self setNavigationSession:v8];

  id v11 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v9 = v11;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  [(NavdDefaultsUpdater *)self setRoutePlanningSession:v10];
  [(NavdDefaultsUpdater *)self _updateSettings];
}

- (void)setRoutePlanningSession:(id)a3
{
  id v5 = (RoutePlanningSession *)a3;
  routePlanningSession = self->_routePlanningSession;
  if (routePlanningSession != v5)
  {
    id v7 = v5;
    [(RoutePlanningSession *)routePlanningSession removeObserver:self];
    objc_storeStrong((id *)&self->_routePlanningSession, a3);
    [(RoutePlanningSession *)self->_routePlanningSession addObserver:self];
    id v5 = v7;
  }
}

- (void)setNavigationSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsMonitor, 0);
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_storeStrong((id *)&self->_carDisplayController, 0);
  objc_storeStrong((id *)&self->_navigationService, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end