@interface MapsLightLevelController
+ (LightLevelProviding)sharedController;
- (BOOL)active;
- (BOOL)connectedToCarplay;
- (BOOL)shouldUseNightMode;
- (MapsAmbientLightMonitor)ambientLightMonitor;
- (MapsAstronomicalConditionMonitor)astronomicalConditionMonitor;
- (MapsExternalDeviceLightMonitor)externalLightMonitor;
- (MapsLightLevelController)initWithWindowScene:(id)a3;
- (UIWindowScene)windowScene;
- (int64_t)_computedLightLevel;
- (int64_t)currentLightLevel;
- (void)addObserver:(id)a3;
- (void)ambientLightMonitorDidUpdate:(id)a3;
- (void)astronomicalConditionMonitorDidUpdate:(id)a3;
- (void)didUpdateMitigationNamed:(id)a3;
- (void)externalLightMonitorDidUpdate:(id)a3;
- (void)lightMonitorDidUpdate:(id)a3;
- (void)reloadForChangedLightLevelTrackers;
- (void)removeObserver:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setAmbientLightMonitor:(id)a3;
- (void)setAstronomicalConditionMonitor:(id)a3;
- (void)setConnectedToCarplay:(BOOL)a3;
- (void)setCurrentLightLevel:(int64_t)a3;
- (void)setCurrentLightLevel:(int64_t)a3 forceUpdate:(BOOL)a4;
- (void)setExternalLightMonitor:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation MapsLightLevelController

- (void)lightMonitorDidUpdate:(id)a3
{
  id v7 = a3;
  id v4 = [(MapsLightLevelController *)self ambientLightMonitor];

  if (v4 == v7)
  {
    [(MapsLightLevelController *)self ambientLightMonitorDidUpdate:v7];
  }
  else
  {
    id v5 = [(MapsLightLevelController *)self astronomicalConditionMonitor];

    if (v5 == v7)
    {
      [(MapsLightLevelController *)self astronomicalConditionMonitorDidUpdate:v7];
    }
    else
    {
      id v6 = [(MapsLightLevelController *)self externalLightMonitor];

      if (v6 == v7) {
        [(MapsLightLevelController *)self externalLightMonitorDidUpdate:v7];
      }
    }
  }
}

- (void)setCurrentLightLevel:(int64_t)a3 forceUpdate:(BOOL)a4
{
  if (self->_currentLightLevel == a3)
  {
    if (!a4) {
      return;
    }
    id v6 = sub_10008FEAC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if ((unint64_t)a3 >= 3)
      {
        id v7 = +[NSString stringWithFormat:@"<Unknown: %ld>", a3];
      }
      else
      {
        id v7 = *(&off_1012F4098 + a3);
      }
      *(_DWORD *)buf = 138412290;
      id v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Force updating light level to %@", buf, 0xCu);
    }
  }
  else
  {
    v8 = sub_10008FEAC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unint64_t currentLightLevel = self->_currentLightLevel;
      if (currentLightLevel >= 3)
      {
        v10 = +[NSString stringWithFormat:@"<Unknown: %ld>", self->_currentLightLevel];
      }
      else
      {
        v10 = *(&off_1012F4098 + currentLightLevel);
      }
      id v11 = v10;
      if ((unint64_t)a3 >= 3)
      {
        v12 = +[NSString stringWithFormat:@"<Unknown: %ld>", a3];
      }
      else
      {
        v12 = *(&off_1012F4098 + a3);
      }
      *(_DWORD *)buf = 138412546;
      id v14 = v11;
      __int16 v15 = 2112;
      v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Changing light level from %@ to %@", buf, 0x16u);
    }
    self->_unint64_t currentLightLevel = a3;
  }
  [(GEOObserverHashTable *)self->_observers lightLevelController:self didUpdateLightLevel:a3];
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    id v5 = sub_10008FEAC();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Activated light level controller", buf, 2u);
      }

      id v7 = [(MapsLightLevelController *)self astronomicalConditionMonitor];
      [v7 startMonitoringWithObserver:self];

      v8 = [(MapsLightLevelController *)self externalLightMonitor];
      [v8 startMonitoringWithObserver:self];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Deactivated light level controller", v11, 2u);
      }

      v9 = [(MapsLightLevelController *)self ambientLightMonitor];
      [v9 stopMonitoringWithObserver:self];

      v10 = [(MapsLightLevelController *)self astronomicalConditionMonitor];
      [v10 stopMonitoringWithObserver:self];

      v8 = [(MapsLightLevelController *)self externalLightMonitor];
      [v8 stopMonitoringWithObserver:self];
    }

    self->_active = v3;
  }
}

- (void)astronomicalConditionMonitorDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [v4 astronomicalCondition];
  id v6 = [v4 isBeforeSolarTransit];

  id v7 = [(MapsLightLevelController *)self ambientLightMonitor];
  [v7 setIsBeforeSolarTransit:v6];

  v8 = sub_10008FEAC();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v5 == (id)2)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Astronomical conditions in transition period", buf, 2u);
    }

    v10 = [(MapsLightLevelController *)self ambientLightMonitor];
    [v10 startMonitoringWithObserver:self];

    id v11 = [(MapsLightLevelController *)self ambientLightMonitor];
    [v11 initializeWithLightLevel:[self currentLightLevel]];
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Astronomical conditions not in transition period", v12, 2u);
    }

    [(MapsLightLevelController *)self setCurrentLightLevel:[(MapsLightLevelController *)self _computedLightLevel]];
    id v11 = [(MapsLightLevelController *)self ambientLightMonitor];
    [v11 stopMonitoringWithObserver:self];
  }
}

- (MapsAmbientLightMonitor)ambientLightMonitor
{
  return self->_ambientLightMonitor;
}

- (MapsLightLevelController)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MapsLightLevelController;
  id v5 = [(MapsLightLevelController *)&v16 init];
  if (v5)
  {
    id v6 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___LightLevelObserver queue:&_dispatch_main_q];
    observers = v5->_observers;
    v5->_observers = v6;

    uint64_t v8 = objc_opt_new();
    ambientLightMonitor = v5->_ambientLightMonitor;
    v5->_ambientLightMonitor = (MapsAmbientLightMonitor *)v8;

    uint64_t v10 = objc_opt_new();
    astronomicalConditionMonitor = v5->_astronomicalConditionMonitor;
    v5->_astronomicalConditionMonitor = (MapsAstronomicalConditionMonitor *)v10;

    v12 = [[MapsExternalDeviceLightMonitor alloc] initWithWindowScene:v4];
    externalLightMonitor = v5->_externalLightMonitor;
    v5->_externalLightMonitor = v12;

    id v14 = +[MapsThermalPressureController sharedController];
    [v14 addObserver:v5 forMitigationNamed:@"NavigationForceNightModeMitigation"];
  }
  return v5;
}

- (int64_t)currentLightLevel
{
  return self->_currentLightLevel;
}

+ (LightLevelProviding)sharedController
{
  if (qword_10160F508 != -1) {
    dispatch_once(&qword_10160F508, &stru_1012F4078);
  }
  v2 = (void *)qword_10160F500;

  return (LightLevelProviding *)v2;
}

- (int64_t)_computedLightLevel
{
  BOOL v3 = +[MapsThermalPressureController sharedController];
  unsigned int v4 = [v3 shouldActivateMitigationNamed:@"NavigationForceNightModeMitigation"];

  if (v4)
  {
    id v5 = sub_10008FEAC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Thermal mitigation is forcing night mode!", buf, 2u);
    }

    return 2;
  }
  id v7 = [(MapsLightLevelController *)self externalLightMonitor];
  unsigned int v8 = [v7 isCarPlayConnected];

  if (v8)
  {
    BOOL v9 = sub_10008FEAC();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [(MapsLightLevelController *)self externalLightMonitor];
      id v11 = [v10 lightLevel];
      if ((unint64_t)v11 >= 3)
      {
        v12 = +[NSString stringWithFormat:@"<Unknown: %ld>", v11];
      }
      else
      {
        v12 = *(&off_1012F4098 + (void)v11);
      }
      *(_DWORD *)buf = 138412290;
      v28 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Connected to CarPlay and car provided light level: %@", buf, 0xCu);
    }
    v23 = [(MapsLightLevelController *)self externalLightMonitor];
    int64_t v6 = (int64_t)[v23 lightLevel];
LABEL_33:

    return v6;
  }
  v13 = [(MapsLightLevelController *)self astronomicalConditionMonitor];
  id v14 = [v13 astronomicalCondition];

  __int16 v15 = sub_10008FEAC();
  BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v14 != (id)2)
  {
    if (v16)
    {
      v20 = [(MapsLightLevelController *)self astronomicalConditionMonitor];
      id v21 = [v20 astronomicalCondition];
      if ((unint64_t)v21 >= 4)
      {
        v22 = +[NSString stringWithFormat:@"<Unknown: %ld>", v21];
      }
      else
      {
        v22 = *(&off_1012F40B0 + (void)v21);
      }
      *(_DWORD *)buf = 138412290;
      v28 = v22;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Astronomical condition is full Day or Night: %@", buf, 0xCu);
    }
    v23 = [(MapsLightLevelController *)self astronomicalConditionMonitor];
    if ([v23 astronomicalCondition] == (id)1) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = 1;
    }
    goto LABEL_33;
  }
  if (v16)
  {
    v17 = [(MapsLightLevelController *)self ambientLightMonitor];
    id v18 = [v17 ambientLightLevel];
    if ((unint64_t)v18 >= 3)
    {
      v19 = +[NSString stringWithFormat:@"<Unknown: %ld>", v18];
    }
    else
    {
      v19 = *(&off_1012F4098 + (void)v18);
    }
    *(_DWORD *)buf = 138412290;
    v28 = v19;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Astronomical condition is transitory, using light level: %@", buf, 0xCu);
  }
  v24 = [(MapsLightLevelController *)self ambientLightMonitor];
  int64_t v6 = (int64_t)[v24 ambientLightLevel];

  if (v6)
  {
    if (v6 == 1) {
      return v6;
    }
    return 2;
  }
  v25 = sub_10008FEAC();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Updated from ambient light at 'Unsupported' to 'Regular'", buf, 2u);
  }

  return 1;
}

- (MapsAstronomicalConditionMonitor)astronomicalConditionMonitor
{
  return self->_astronomicalConditionMonitor;
}

- (MapsExternalDeviceLightMonitor)externalLightMonitor
{
  return self->_externalLightMonitor;
}

- (void)setCurrentLightLevel:(int64_t)a3
{
}

- (void)reloadForChangedLightLevelTrackers
{
  int64_t v3 = [(MapsLightLevelController *)self _computedLightLevel];

  [(MapsLightLevelController *)self setCurrentLightLevel:v3 forceUpdate:1];
}

- (void)addObserver:(id)a3
{
  [(GEOObserverHashTable *)self->_observers registerObserver:a3];

  [(MapsLightLevelController *)self setActive:1];
}

- (void)setWindowScene:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  if (WeakRetained != obj)
  {
    id v5 = objc_storeWeak((id *)&self->_windowScene, obj);
    [(MapsExternalDeviceLightMonitor *)self->_externalLightMonitor setWindowScene:obj];
  }
}

- (BOOL)shouldUseNightMode
{
  return (id)[(MapsLightLevelController *)self currentLightLevel] == (id)2;
}

- (void)removeObserver:(id)a3
{
  [(GEOObserverHashTable *)self->_observers unregisterObserver:a3];
  id v4 = [(GEOObserverHashTable *)self->_observers hasObservers];

  [(MapsLightLevelController *)self setActive:v4];
}

- (void)didUpdateMitigationNamed:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100683634;
  block[3] = &unk_1012E5D08;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)ambientLightMonitorDidUpdate:(id)a3
{
  int64_t v4 = [(MapsLightLevelController *)self _computedLightLevel];

  [(MapsLightLevelController *)self setCurrentLightLevel:v4];
}

- (void)externalLightMonitorDidUpdate:(id)a3
{
  int64_t v4 = [(MapsLightLevelController *)self _computedLightLevel];

  [(MapsLightLevelController *)self setCurrentLightLevel:v4];
}

- (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);

  return (UIWindowScene *)WeakRetained;
}

- (BOOL)active
{
  return self->_active;
}

- (BOOL)connectedToCarplay
{
  return self->_connectedToCarplay;
}

- (void)setConnectedToCarplay:(BOOL)a3
{
  self->_connectedToCarplay = a3;
}

- (void)setAmbientLightMonitor:(id)a3
{
}

- (void)setAstronomicalConditionMonitor:(id)a3
{
}

- (void)setExternalLightMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalLightMonitor, 0);
  objc_storeStrong((id *)&self->_astronomicalConditionMonitor, 0);
  objc_storeStrong((id *)&self->_ambientLightMonitor, 0);
  objc_destroyWeak((id *)&self->_windowScene);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end