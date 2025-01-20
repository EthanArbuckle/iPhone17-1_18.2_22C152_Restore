@interface TrafficIncidentLayoutManager
+ (TrafficIncidentLayoutManager)sharedInstance;
+ (int64_t)creationPreference;
- (BOOL)_shouldInvalidateLayout;
- (BOOL)containsGEOTrafficIncidentType:(int)a3;
- (BOOL)containsVKTrafficIncidentType:(int64_t)a3;
- (BOOL)isIncidentReportingEnabled;
- (BOOL)isIncidentTypeDisplayedOnMap:(int)a3;
- (CARSessionStatus)carSessionStatus;
- (NSTimer)layoutRefreshTimer;
- (TrafficIncidentLayout)incidentLayout;
- (TrafficIncidentLayoutManager)initWithFormType:(int)a3;
- (id)currentIncidentsLayout;
- (id)observers;
- (int)formType;
- (void)_invalidateCachedLayoutIfNeeded;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)fetchTrafficIncidentsLayout:(id)a3;
- (void)offlineMapsStateChanged;
- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)removeObserver:(id)a3;
- (void)sessionDidConnect:(id)a3;
- (void)setCarSessionStatus:(id)a3;
- (void)setFormType:(int)a3;
- (void)setIncidentLayout:(id)a3;
- (void)setLayoutRefreshTimer:(id)a3;
- (void)startPeriodicRefresh;
- (void)stopPeriodicRefresh;
@end

@implementation TrafficIncidentLayoutManager

- (TrafficIncidentLayoutManager)initWithFormType:(int)a3
{
  v14.receiver = self;
  v14.super_class = (Class)TrafficIncidentLayoutManager;
  v4 = [(TrafficIncidentLayoutManager *)&v14 init];
  v5 = v4;
  if (v4)
  {
    v4->_formType = a3;
    if (a3 == 7)
    {
      v6 = +[TrafficIncidentLayoutStorage sharedInstance];
      uint64_t v7 = [v6 cachedIncidentLayout];
    }
    else
    {
      if (a3 != 9)
      {
LABEL_7:
        uint64_t v9 = objc_opt_new();
        carSessionStatus = v5->_carSessionStatus;
        v5->_carSessionStatus = (CARSessionStatus *)v9;

        [(CARSessionStatus *)v5->_carSessionStatus addSessionObserver:v5];
        id v11 = +[TrafficIncidentAuthenticationManager sharedInstance];
        v12 = +[NSNotificationCenter defaultCenter];
        [v12 addObserver:v5 selector:"offlineMapsStateChanged" name:@"UsingOfflineMapsStateChangedNotification" object:0];

        return v5;
      }
      v6 = +[TrafficIncidentLayoutStorage sharedInstance];
      uint64_t v7 = [v6 cachedIncidentVotingLayout];
    }
    incidentLayout = v5->_incidentLayout;
    v5->_incidentLayout = (TrafficIncidentLayout *)v7;

    goto LABEL_7;
  }
  return v5;
}

+ (int64_t)creationPreference
{
  return 1;
}

+ (TrafficIncidentLayoutManager)sharedInstance
{
  if (qword_1016103C8 != -1) {
    dispatch_once(&qword_1016103C8, &stru_101313730);
  }
  v2 = (void *)qword_1016103D0;

  return (TrafficIncidentLayoutManager *)v2;
}

- (void)dealloc
{
  [(TrafficIncidentLayoutManager *)self stopPeriodicRefresh];
  v3.receiver = self;
  v3.super_class = (Class)TrafficIncidentLayoutManager;
  [(TrafficIncidentLayoutManager *)&v3 dealloc];
}

- (BOOL)isIncidentReportingEnabled
{
  objc_super v3 = +[MapsOfflineUIHelper sharedHelper];
  unsigned __int8 v4 = [v3 isUsingOfflineMaps];

  if ((v4 & 1) != 0 || !MapsFeature_IsEnabled_Bakersfield()) {
    return 0;
  }
  v5 = +[TrafficIncidentAuthenticationManager sharedInstance];
  if ([v5 isSupported]) {
    BOOL v6 = [(TrafficIncidentLayout *)self->_incidentLayout isIncidentReportingEnabled];
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setIncidentLayout:(id)a3
{
  v5 = (TrafficIncidentLayout *)a3;
  incidentLayout = self->_incidentLayout;
  if (incidentLayout != v5)
  {
    unsigned int v7 = [(TrafficIncidentLayout *)incidentLayout isIncidentReportingEnabled];
    unsigned int v8 = v7 ^ [(TrafficIncidentLayout *)v5 isIncidentReportingEnabled];
    objc_storeStrong((id *)&self->_incidentLayout, a3);
    uint64_t v9 = sub_100576E2C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = self->_incidentLayout;
      int v12 = 138412290;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "TrafficIncidentLayoutManager: cached incidentLayout %@", (uint8_t *)&v12, 0xCu);
    }

    if (v8)
    {
      id v11 = [(TrafficIncidentLayoutManager *)self observers];
      [v11 incidentsReportingEnablementDidUpdate];
    }
  }
}

- (id)currentIncidentsLayout
{
  return [(TrafficIncidentLayout *)self->_incidentLayout layoutItems];
}

- (void)fetchTrafficIncidentsLayout:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, void *))a3;
  if (v4
    && (incidentLayout = self->_incidentLayout) != 0
    && ![(TrafficIncidentLayout *)incidentLayout shouldInvalidateLayout])
  {
    unsigned int v7 = [(TrafficIncidentLayout *)self->_incidentLayout layoutItems];
    v4[2](v4, v7);
  }
  else
  {
    BOOL v6 = +[MKLocationManager sharedLocationManager];
    unsigned int v7 = [v6 currentLocation];

    if (v7)
    {
      unsigned int v8 = objc_alloc_init(TrafficIncidentLayoutFetcher);
      objc_initWeak(&location, self);
      uint64_t v9 = [(TrafficIncidentLayoutManager *)self formType];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1009D9DF8;
      v10[3] = &unk_101313758;
      objc_copyWeak(&v12, &location);
      id v11 = v4;
      [(TrafficIncidentLayoutFetcher *)v8 fetchTrafficIncidentsLayoutForLocation:v7 formType:v9 completion:v10];

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }
    else if (v4)
    {
      v4[2](v4, &__NSArray0__struct);
    }
  }
}

- (BOOL)containsVKTrafficIncidentType:(int64_t)a3
{
  uint64_t v4 = +[TrafficIncidentLayoutItem geoTrafficIncidentTypeForVKType:a3];

  return [(TrafficIncidentLayoutManager *)self containsGEOTrafficIncidentType:v4];
}

- (BOOL)containsGEOTrafficIncidentType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(TrafficIncidentLayoutManager *)self incidentLayout];
  LOBYTE(v3) = [v4 isIncidentTypeSupported:v3];

  return v3;
}

- (BOOL)isIncidentTypeDisplayedOnMap:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v4 = [(TrafficIncidentLayoutManager *)self incidentLayout];
  LOBYTE(v3) = [v4 isIncidentTypeDisplayedOnMap:v3];

  return v3;
}

- (void)startPeriodicRefresh
{
  GEOConfigGetDouble();
  +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_invalidateCachedLayoutIfNeeded", 0, 1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(TrafficIncidentLayoutManager *)self setLayoutRefreshTimer:v3];
}

- (void)stopPeriodicRefresh
{
  id v3 = [(TrafficIncidentLayoutManager *)self layoutRefreshTimer];
  [v3 invalidate];

  [(TrafficIncidentLayoutManager *)self setLayoutRefreshTimer:0];
}

- (BOOL)_shouldInvalidateLayout
{
  incidentLayout = self->_incidentLayout;
  if (incidentLayout)
  {
    return [(TrafficIncidentLayout *)incidentLayout shouldInvalidateLayout];
  }
  else
  {
    uint64_t v4 = sub_100576E2C();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "TrafficIncidentLayoutManager: Initial fetching", v5, 2u);
    }

    return 1;
  }
}

- (void)_invalidateCachedLayoutIfNeeded
{
  if ([(TrafficIncidentLayoutManager *)self _shouldInvalidateLayout])
  {
    [(TrafficIncidentLayoutManager *)self fetchTrafficIncidentsLayout:&stru_101313798];
  }
  else
  {
    id v3 = sub_100576E2C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "TrafficIncidentLayoutManager: invalidateCachedLayout not needed", v4, 2u);
    }
  }
}

- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v8 = a4;
  id v7 = a5;
  if (MapsFeature_IsEnabled_Bakersfield())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(TrafficIncidentLayoutManager *)self _invalidateCachedLayoutIfNeeded];
        [(TrafficIncidentLayoutManager *)self startPeriodicRefresh];
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(TrafficIncidentLayoutManager *)self stopPeriodicRefresh];
    }
  }
}

- (id)observers
{
  observers = self->_observers;
  if (!observers)
  {
    uint64_t v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___TrafficIncidentLayoutManagerObserver queue:&_dispatch_main_q];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(TrafficIncidentLayoutManager *)self observers];
  [v5 registerObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(TrafficIncidentLayoutManager *)self observers];
  [v5 unregisterObserver:v4];
}

- (void)sessionDidConnect:(id)a3
{
  id v4 = sub_100576E2C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "TrafficIncidentLayoutManager: carSession didConnect", v5, 2u);
  }

  [(TrafficIncidentLayoutManager *)self _invalidateCachedLayoutIfNeeded];
}

- (void)offlineMapsStateChanged
{
  id v3 = sub_100576E2C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "TrafficIncidentLayoutManager: offlineMapsStateChanged", v5, 2u);
  }

  id v4 = [(TrafficIncidentLayoutManager *)self observers];
  [v4 incidentsReportingEnablementDidUpdate];
}

- (TrafficIncidentLayout)incidentLayout
{
  return self->_incidentLayout;
}

- (NSTimer)layoutRefreshTimer
{
  return self->_layoutRefreshTimer;
}

- (void)setLayoutRefreshTimer:(id)a3
{
}

- (int)formType
{
  return self->_formType;
}

- (void)setFormType:(int)a3
{
  self->_formType = a3;
}

- (CARSessionStatus)carSessionStatus
{
  return self->_carSessionStatus;
}

- (void)setCarSessionStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_layoutRefreshTimer, 0);
  objc_storeStrong((id *)&self->_incidentLayout, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end