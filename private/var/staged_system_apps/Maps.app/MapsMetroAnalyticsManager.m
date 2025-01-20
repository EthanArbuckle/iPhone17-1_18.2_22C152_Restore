@interface MapsMetroAnalyticsManager
+ (id)sharedManager;
- (MapsMetroAnalyticsManager)init;
- (MeCardDataProvider)meCardProvider;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_locationManagerApprovalDidChange:(id)a3;
- (void)_startLocationUpdateTimerIfNeeded;
- (void)_stopLocationUpdateTimer;
- (void)homeDataProvidingObjectDidUpdate:(id)a3;
- (void)setMeCardProvider:(id)a3;
- (void)startMonitoring;
- (void)stopMonitoring;
@end

@implementation MapsMetroAnalyticsManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005FEF10;
  block[3] = &unk_1012E63F0;
  block[4] = a1;
  if (qword_10160F288 != -1) {
    dispatch_once(&qword_10160F288, block);
  }
  v2 = (void *)qword_10160F280;

  return v2;
}

- (MapsMetroAnalyticsManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)MapsMetroAnalyticsManager;
  v2 = [(MapsMetroAnalyticsManager *)&v12 init];
  if (v2)
  {
    uint64_t v3 = geo_dispatch_queue_create_with_qos();
    analyticsQueue = v2->_analyticsQueue;
    v2->_analyticsQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(MeCardDataProvider);
    meCardProvider = v2->_meCardProvider;
    v2->_meCardProvider = v5;

    v7 = [(MeCardDataProvider *)v2->_meCardProvider observers];
    [v7 registerObserver:v2];

    v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"_applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];

    v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:v2 selector:"_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];

    v10 = +[NSNotificationCenter defaultCenter];
    [v10 addObserver:v2 selector:"_locationManagerApprovalDidChange:" name:MKLocationManagerApprovalDidChangeNotification object:0];
  }
  return v2;
}

- (void)startMonitoring
{
  uint64_t v3 = [(MapsMetroAnalyticsManager *)self meCardProvider];
  [v3 setActive:1];

  [(MapsMetroAnalyticsManager *)self _startLocationUpdateTimerIfNeeded];
}

- (void)stopMonitoring
{
  uint64_t v3 = [(MapsMetroAnalyticsManager *)self meCardProvider];
  [v3 setActive:0];

  [(MapsMetroAnalyticsManager *)self _stopLocationUpdateTimer];
}

- (void)_applicationDidEnterBackground:(id)a3
{
}

- (void)_locationManagerApprovalDidChange:(id)a3
{
  v4 = +[MKLocationManager sharedLocationManager];
  unsigned int v5 = [v4 isAuthorizedForPreciseLocation];

  if (v5)
  {
    dispatch_async((dispatch_queue_t)self->_analyticsQueue, &stru_1012F20A8);
    [(MapsMetroAnalyticsManager *)self _startLocationUpdateTimerIfNeeded];
  }
  else
  {
    [(MapsMetroAnalyticsManager *)self _stopLocationUpdateTimer];
    id v6 = +[GEOAPSharedStateData sharedData];
    [v6 setCurrentMetro:0];
  }
}

- (void)_startLocationUpdateTimerIfNeeded
{
  if (!self->_currentLocationUpdateTimer)
  {
    uint64_t v3 = +[MKLocationManager sharedLocationManager];
    unsigned int v4 = [v3 isAuthorizedForPreciseLocation];

    if (v4)
    {
      GEOConfigGetDouble();
      unsigned int v5 = (OS_dispatch_source *)geo_dispatch_timer_create_on_queue();
      currentLocationUpdateTimer = self->_currentLocationUpdateTimer;
      self->_currentLocationUpdateTimer = v5;

      v7 = self->_currentLocationUpdateTimer;
      dispatch_resume(v7);
    }
  }
}

- (void)_stopLocationUpdateTimer
{
  currentLocationUpdateTimer = self->_currentLocationUpdateTimer;
  if (currentLocationUpdateTimer)
  {
    dispatch_source_cancel(currentLocationUpdateTimer);
    unsigned int v4 = self->_currentLocationUpdateTimer;
    self->_currentLocationUpdateTimer = 0;
  }
}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(MapsMetroAnalyticsManager *)self meCardProvider];

  if (v5 == v4)
  {
    id v6 = [(MapsMetroAnalyticsManager *)self meCardProvider];
    v7 = [v6 meCard];
    v8 = [v7 mapItemsForHome];
    v9 = [v8 firstObject];

    analyticsQueue = self->_analyticsQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1005FF530;
    block[3] = &unk_1012E5D08;
    id v13 = v9;
    id v11 = v9;
    dispatch_async(analyticsQueue, block);
  }
}

- (MeCardDataProvider)meCardProvider
{
  return self->_meCardProvider;
}

- (void)setMeCardProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_meCardProvider, 0);
  objc_storeStrong((id *)&self->_currentLocationUpdateTimer, 0);

  objc_storeStrong((id *)&self->_analyticsQueue, 0);
}

@end