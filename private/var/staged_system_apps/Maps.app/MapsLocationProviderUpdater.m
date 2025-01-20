@interface MapsLocationProviderUpdater
+ (int64_t)creationPreference;
- (MKLocationManager)locationManager;
- (MapsLocationProviderUpdater)initWithLocationManager:(id)a3;
- (NavigationSession)observedNavigationSession;
- (RoutePlanningSession)observedRoutePlanningSession;
- (unint64_t)locationProviderType;
- (void)_updateLocationProviderType;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)setLocationManager:(id)a3;
- (void)setLocationProviderType:(unint64_t)a3;
- (void)setObservedNavigationSession:(id)a3;
- (void)setObservedRoutePlanningSession:(id)a3;
@end

@implementation MapsLocationProviderUpdater

- (MapsLocationProviderUpdater)initWithLocationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MapsLocationProviderUpdater;
  v6 = [(MapsLocationProviderUpdater *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_locationManager, a3);
  }

  return v7;
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)setObservedNavigationSession:(id)a3
{
  id v5 = (NavigationSession *)a3;
  observedNavigationSession = self->_observedNavigationSession;
  if (observedNavigationSession != v5)
  {
    v7 = v5;
    [observedNavigationSession removeObserver:self];
    objc_storeStrong((id *)&self->_observedNavigationSession, a3);
    [self->_observedNavigationSession addObserver:self];
    id v5 = v7;
  }
}

- (void)setObservedRoutePlanningSession:(id)a3
{
  id v5 = (RoutePlanningSession *)a3;
  observedRoutePlanningSession = self->_observedRoutePlanningSession;
  if (observedRoutePlanningSession != v5)
  {
    v7 = v5;
    [observedRoutePlanningSession removeObserver:self];
    objc_storeStrong((id *)&self->_observedRoutePlanningSession, a3);
    [self->_observedRoutePlanningSession addObserver:self];
    id v5 = v7;
  }
}

- (void)_updateLocationProviderType
{
  v3 = [(MapsLocationProviderUpdater *)self observedNavigationSession];

  if (v3)
  {
    v4 = [(MapsLocationProviderUpdater *)self observedNavigationSession];
    id v5 = [v4 sessionState];

    uint64_t v6 = v5 == (id)1;
  }
  else
  {
    v7 = [(MapsLocationProviderUpdater *)self observedRoutePlanningSession];

    if (v7)
    {
      v8 = [(MapsLocationProviderUpdater *)self observedRoutePlanningSession];
      objc_super v9 = [v8 configuration];
      unsigned int v10 = [v9 isNavigationTracePlayback];

      if (v10) {
        uint64_t v6 = 2;
      }
      else {
        uint64_t v6 = 0;
      }
    }
    else
    {
      uint64_t v6 = 0;
    }
  }

  [(MapsLocationProviderUpdater *)self setLocationProviderType:v6];
}

- (void)setLocationProviderType:(unint64_t)a3
{
  if (self->_locationProviderType != a3)
  {
    self->_locationProviderType = a3;
    if (a3 - 1 >= 2)
    {
      if (a3) {
        return;
      }
      objc_super v9 = [(MapsLocationProviderUpdater *)self locationManager];
      [v9 setLocationCorrector:0];

      unsigned int v10 = [(MapsLocationProviderUpdater *)self locationManager];
      [v10 setLocationProvider:0];

      v7 = [(MapsLocationProviderUpdater *)self locationManager];
      id v11 = v7;
      uint64_t v8 = 0;
    }
    else
    {
      v4 = objc_alloc_init(NavigationLocationProvider);
      id v5 = [(MapsLocationProviderUpdater *)self locationManager];
      [v5 setLocationProvider:v4];

      uint64_t v6 = [(MapsLocationProviderUpdater *)self locationManager];
      [v6 setLocationCorrector:&stru_1012E7B60];

      v7 = [(MapsLocationProviderUpdater *)self locationManager];
      id v11 = v7;
      uint64_t v8 = 1;
    }
    [v7 setContinuesWhileInactive:v8];
  }
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  [(MapsLocationProviderUpdater *)self setObservedNavigationSession:v8];

  id v11 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v9 = v11;
  }
  else {
    objc_super v9 = 0;
  }
  id v10 = v9;

  [(MapsLocationProviderUpdater *)self setObservedRoutePlanningSession:v10];
  [(MapsLocationProviderUpdater *)self _updateLocationProviderType];
}

- (unint64_t)locationProviderType
{
  return self->_locationProviderType;
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
}

- (NavigationSession)observedNavigationSession
{
  return self->_observedNavigationSession;
}

- (RoutePlanningSession)observedRoutePlanningSession
{
  return self->_observedRoutePlanningSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedRoutePlanningSession, 0);
  objc_storeStrong((id *)&self->_observedNavigationSession, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end