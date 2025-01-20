@interface HomeResultDataProvider
- (BOOL)_isNoNetworkError:(id)a3;
- (BOOL)active;
- (BOOL)hasInitialData;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (GEOObserverHashTable)observers;
- (HomeResult)homeResult;
- (HomeResultDataProvider)initWithDelegate:(id)a3;
- (HomeResultDataProviderDelegate)delegate;
- (id)_currentCacheKey;
- (void)_cancelExpirationTimer;
- (void)_cancelTicket;
- (void)_createExpirationTimerIfNeeded;
- (void)_expirationTimerFired;
- (void)_handleResult:(id)a3 error:(id)a4 cacheKey:(id)a5;
- (void)_networkReachabilityDidChange;
- (void)_refreshCachedResultAndNotifyObservers:(BOOL)a3;
- (void)_startTicketWithCacheKey:(id)a3;
- (void)_updateWithResult:(id)a3 cacheKey:(id)a4 notifyObservers:(BOOL)a5;
- (void)countryConfigurationDidChange:(id)a3;
- (void)dealloc;
- (void)locationManagerDidReset:(id)a3;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)setActive:(BOOL)a3;
@end

@implementation HomeResultDataProvider

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (HomeResultDataProvider)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HomeResultDataProvider;
  v5 = [(HomeResultDataProvider *)&v14 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = +[MKLocationManager sharedLocationManager];
    locationManager = v6->_locationManager;
    v6->_locationManager = (MKLocationManager *)v7;

    uint64_t v9 = +[GEONetworkObserver sharedNetworkObserver];
    networkObserver = v6->_networkObserver;
    v6->_networkObserver = (GEONetworkObserver *)v9;

    v11 = objc_alloc_init(HomeResultCache);
    cache = v6->_cache;
    v6->_cache = v11;
  }
  return v6;
}

- (void)_handleResult:(id)a3 error:(id)a4 cacheKey:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (HomeResultCacheKey *)a5;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  ticketCacheKey = self->_ticketCacheKey;
  if (ticketCacheKey == v11 || [(HomeResultCacheKey *)ticketCacheKey isEqual:v11])
  {
    [(HomeResultDataProvider *)self _cancelTicket];
    if (v10)
    {
      if ([(HomeResultDataProvider *)self _isNoNetworkError:v10]) {
        goto LABEL_11;
      }
      uint64_t v13 = +[Result resultWithError:v10];
    }
    else
    {
      if (!v9)
      {
        v19 = +[NSError errorWithDomain:@"HomeResultDataProviderErrorDomain" code:1 userInfo:0];
        objc_super v14 = +[Result resultWithError:v19];

        if (v14) {
          goto LABEL_9;
        }
        goto LABEL_11;
      }
      uint64_t v13 = +[Result resultWithValue:v9];
    }
    objc_super v14 = (void *)v13;
    if (v13)
    {
LABEL_9:
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_10003660C;
      v36[3] = &unk_1013127F0;
      v36[4] = self;
      SEL v38 = a2;
      v37 = v11;
      v29 = _NSConcreteStackBlock;
      uint64_t v30 = 3221225472;
      v31 = sub_100998A28;
      v32 = &unk_101312818;
      v33 = self;
      SEL v35 = a2;
      v15 = v37;
      v34 = v15;
      [v14 withValue:v36 orError:&v29];

      v16 = [HomeResult alloc];
      v17 = +[NSDate date];
      v18 = [(HomeResult *)v16 initWithResponseResult:v14 responseDate:v17];

      [(HomeResultCache *)self->_cache setResult:v18 forKey:v15];
      goto LABEL_14;
    }
LABEL_11:
    v20 = sub_1000AA148();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v40 = v22;
      __int16 v41 = 2112;
      v42 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@ %@, network is offline", buf, 0x16u);
    }
    objc_super v14 = 0;
    v18 = 0;
LABEL_14:
    v24 = [(HomeResultDataProvider *)self _currentCacheKey];
    v25 = v24;
    if (v18)
    {
      if ([v24 isEqualivantToKey:v11])
      {
        v26 = self;
        v27 = v18;
        v28 = v11;
LABEL_19:
        [(HomeResultDataProvider *)v26 _updateWithResult:v27 cacheKey:v28 notifyObservers:1];
      }
    }
    else if (![(HomeResultCacheKey *)self->_resultCacheKey isEqualivantToKey:v11])
    {
      v26 = self;
      v27 = 0;
      v28 = 0;
      goto LABEL_19;
    }
  }
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    v6 = sub_1000AA148();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      v8 = NSStringFromClass(v7);
      id v9 = NSStringFromSelector(a2);
      id v10 = sub_100097E28(v3);
      int v16 = 138412802;
      v17 = v8;
      __int16 v18 = 2112;
      v19 = v9;
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@ %@%@", (uint8_t *)&v16, 0x20u);
    }
    locationManager = self->_locationManager;
    if (v3)
    {
      [(MKLocationManager *)locationManager startLocationUpdateWithObserver:self];
      [(GEONetworkObserver *)self->_networkObserver addNetworkReachableObserver:self selector:"_networkReachabilityDidChange"];
      v12 = +[NSNotificationCenter defaultCenter];
      [v12 addObserver:self selector:"countryConfigurationDidChange:" name:GEOCountryConfigurationCountryCodeDidChangeNotification object:0];

      uint64_t v13 = +[NSNotificationCenter defaultCenter];
      [v13 addObserver:self selector:"countryConfigurationDidChange:" name:GEOCountryConfigurationProvidersDidChangeNotification object:0];

      [(HomeResultDataProvider *)self _refreshCachedResultAndNotifyObservers:0];
      [(HomeResultDataProvider *)self _createExpirationTimerIfNeeded];
    }
    else
    {
      [(MKLocationManager *)locationManager stopLocationUpdateWithObserver:self];
      [(GEONetworkObserver *)self->_networkObserver removeNetworkReachableObserver:self];
      objc_super v14 = +[NSNotificationCenter defaultCenter];
      [v14 removeObserver:self name:GEOCountryConfigurationCountryCodeDidChangeNotification object:0];

      v15 = +[NSNotificationCenter defaultCenter];
      [v15 removeObserver:self name:GEOCountryConfigurationProvidersDidChangeNotification object:0];

      [(HomeResultDataProvider *)self _cancelTicket];
      [(HomeResultDataProvider *)self _cancelExpirationTimer];
    }
  }
}

- (void)_updateWithResult:(id)a3 cacheKey:(id)a4 notifyObservers:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = (HomeResult *)a3;
  v11 = (HomeResultCacheKey *)a4;
  if (!self->_active) {
    goto LABEL_19;
  }
  int v29 = v5;
  if (self->_result == v10) {
    unsigned int v12 = 1;
  }
  else {
    unsigned int v12 = -[HomeResult isEqual:](v10, "isEqual:");
  }
  unsigned int v30 = v12;
  aSelector = a2;
  if (self->_resultCacheKey == v11) {
    unsigned int v13 = 1;
  }
  else {
    unsigned int v13 = -[HomeResultCacheKey isEqual:](v11, "isEqual:");
  }
  v28 = v11;
  objc_super v14 = [(HomeResult *)v10 expirationDate];
  v15 = [(HomeResult *)self->_result expirationDate];
  if (v14 == v15) {
    unsigned int v16 = 1;
  }
  else {
    unsigned int v16 = [v14 isEqual:v15];
  }

  unsigned int v17 = v30;
  if (v30)
  {
    if (v13) {
      goto LABEL_13;
    }
LABEL_21:
    objc_storeStrong((id *)&self->_resultCacheKey, a4);
    if (v16) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  objc_storeStrong((id *)&self->_result, a3);
  if ((v13 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_13:
  if ((v16 & 1) == 0)
  {
LABEL_14:
    [(HomeResultDataProvider *)self _cancelExpirationTimer];
    [(HomeResultDataProvider *)self _createExpirationTimerIfNeeded];
  }
LABEL_15:
  __int16 v18 = sub_1000AA148();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v19 = v16 ^ 1;
    __int16 v20 = (objc_class *)objc_opt_class();
    v21 = NSStringFromClass(v20);
    v22 = NSStringFromSelector(aSelector);
    v23 = sub_100097E28(v30 ^ 1);
    v24 = sub_100097E28(v13 ^ 1);
    v25 = sub_100097E28(v19);
    v26 = sub_100097E28(v29);
    *(_DWORD *)buf = 138413826;
    v32 = v21;
    __int16 v33 = 2112;
    v34 = v22;
    __int16 v35 = 2112;
    v36 = v23;
    __int16 v37 = 2112;
    SEL v38 = v24;
    __int16 v39 = 2112;
    v40 = v25;
    __int16 v41 = 2112;
    v42 = v26;
    __int16 v43 = 2112;
    v44 = v28;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%@ %@, resultChanged = %@, cacheKeyChanged = %@, expirationDateChanged = %@, notifyObservers = %@, cacheKey = %@", buf, 0x48u);

    unsigned int v17 = v30;
  }

  v11 = v28;
  if (((v17 | v29 ^ 1) & 1) == 0) {
    [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
  }
LABEL_19:
}

- (void)_createExpirationTimerIfNeeded
{
  if (!self->_resultExpirationTimer)
  {
    BOOL v3 = [(HomeResult *)self->_result expirationDate];
    if (v3)
    {
      objc_initWeak(&location, self);
      v6 = _NSConcreteStackBlock;
      uint64_t v7 = 3221225472;
      v8 = sub_100998BF4;
      id v9 = &unk_1012E73C8;
      objc_copyWeak(&v10, &location);
      id v4 = +[NSTimer _maps_scheduledTimerWithFireDate:v3 block:&v6];
      resultExpirationTimer = self->_resultExpirationTimer;
      self->_resultExpirationTimer = v4;

      -[NSTimer setTolerance:](self->_resultExpirationTimer, "setTolerance:", 1.0, v6, v7, v8, v9);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

- (HomeResult)homeResult
{
  BOOL v3 = [(HomeResult *)self->_result responseResult];
  unsigned int v4 = [v3 isSuccess];

  if (v4) {
    BOOL v5 = self->_result;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_refreshCachedResultAndNotifyObservers:(BOOL)a3
{
  if (self->_active)
  {
    BOOL v3 = a3;
    id v9 = +[NSDate date];
    BOOL v5 = [(HomeResultDataProvider *)self _currentCacheKey];
    v6 = v5;
    if (!self->_resultCacheKey
      || !objc_msgSend(v5, "isEqualivantToKey:")
      || [(HomeResult *)self->_result isExpiredAtDate:v9])
    {
      uint64_t v7 = [(HomeResultCache *)self->_cache resultForKey:v6];
      v8 = v7;
      if (v7 && ([v7 isExpiredAtDate:v9] & 1) == 0)
      {
        [(HomeResultDataProvider *)self _updateWithResult:v8 cacheKey:v6 notifyObservers:v3];
      }
      else if (!self->_ticketCacheKey || (objc_msgSend(v6, "isEqualivantToKey:") & 1) == 0)
      {
        [(HomeResultDataProvider *)self _startTicketWithCacheKey:v6];
      }
    }
  }
}

- (void)_startTicketWithCacheKey:(id)a3
{
  id v6 = a3;
  uint64_t v7 = sub_1000AA148();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412802;
    v23 = v9;
    __int16 v24 = 2112;
    v25 = v10;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@ %@, cacheKey = %@", buf, 0x20u);
  }
  [(HomeResultDataProvider *)self _cancelTicket];
  objc_initWeak((id *)buf, self);
  objc_storeStrong((id *)&self->_ticketCacheKey, a3);
  v11 = +[GEOMapService sharedService];
  unsigned int v12 = [(HomeResultDataProvider *)self delegate];
  id v13 = [v12 newTraits];
  uint64_t v14 = [v11 ticketForMapsHomeWithTraits:v13];
  ticket = self->_ticket;
  p_ticket = &self->_ticket;
  *p_ticket = (GEOMapServiceMapsHomeTicket *)v14;

  unsigned int v17 = *p_ticket;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100037180;
  v19[3] = &unk_1013127C8;
  objc_copyWeak(&v21, (id *)buf);
  id v18 = v6;
  id v20 = v18;
  [(GEOMapServiceMapsHomeTicket *)v17 submitWithHandler:v19 networkActivity:0];

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
}

- (HomeResultDataProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HomeResultDataProviderDelegate *)WeakRetained;
}

- (id)_currentCacheKey
{
  BOOL v3 = +[GEOCountryConfiguration sharedConfiguration];
  unsigned int v4 = [v3 countryCode];

  BOOL v5 = [(MKLocationManager *)self->_locationManager currentLocation];
  id v6 = [[HomeResultCacheKey alloc] initWithCountryCode:v4 location:v5];

  return v6;
}

- (void)_cancelTicket
{
  [(GEOMapServiceMapsHomeTicket *)self->_ticket cancel];
  ticket = self->_ticket;
  self->_ticket = 0;

  ticketCacheKey = self->_ticketCacheKey;
  self->_ticketCacheKey = 0;
}

- (BOOL)hasInitialData
{
  return 1;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void)_cancelExpirationTimer
{
  [(NSTimer *)self->_resultExpirationTimer invalidate];
  resultExpirationTimer = self->_resultExpirationTimer;
  self->_resultExpirationTimer = 0;
}

- (void)dealloc
{
  [(HomeResultDataProvider *)self _cancelTicket];
  [(HomeResultDataProvider *)self _cancelExpirationTimer];
  v3.receiver = self;
  v3.super_class = (Class)HomeResultDataProvider;
  [(HomeResultDataProvider *)&v3 dealloc];
}

- (BOOL)_isNoNetworkError:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 domain];
  unsigned int v5 = [v4 isEqualToString:NSURLErrorDomain];

  if (v5)
  {
    if ([v3 code] != (id)-1009)
    {
LABEL_7:
      BOOL v9 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    id v6 = [v3 domain];
    uint64_t v7 = GEOErrorDomain();
    unsigned int v8 = [v6 isEqualToString:v7];

    if (!v8 || [v3 code] != (id)-9) {
      goto LABEL_7;
    }
  }
  BOOL v9 = 1;
LABEL_8:

  return v9;
}

- (void)_expirationTimerFired
{
  unsigned int v4 = sub_1000AA148();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unsigned int v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    uint64_t v7 = NSStringFromSelector(a2);
    int v8 = 138412546;
    BOOL v9 = v6;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v8, 0x16u);
  }
  [(HomeResultDataProvider *)self _cancelExpirationTimer];
  [(HomeResultDataProvider *)self _refreshCachedResultAndNotifyObservers:1];
}

- (void)locationManagerDidReset:(id)a3
{
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (void)_networkReachabilityDidChange
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);

  [(HomeResultDataProvider *)self _refreshCachedResultAndNotifyObservers:1];
}

- (void)countryConfigurationDidChange:(id)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);

  [(HomeResultDataProvider *)self _refreshCachedResultAndNotifyObservers:1];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ticket, 0);
  objc_storeStrong((id *)&self->_ticketCacheKey, 0);
  objc_storeStrong((id *)&self->_resultExpirationTimer, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_resultCacheKey, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_networkObserver, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end