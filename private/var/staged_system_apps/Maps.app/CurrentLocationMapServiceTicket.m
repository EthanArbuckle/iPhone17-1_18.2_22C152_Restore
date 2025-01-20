@interface CurrentLocationMapServiceTicket
- (BOOL)isCancelled;
- (CLLocation)currentLocation;
- (CurrentLocationMapServiceTicket)initWithLocationManager:(id)a3;
- (GEOMapServiceCorrectableTicket)revGeoTicket;
- (MKLocationManager)locationManager;
- (MKLocationManagerOperation)locationFixOperation;
- (id)_revGeoTicketForCurrentLocation:(id)a3 traits:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6;
- (void)applyToCorrectedSearch:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)setLocationFixOperation:(id)a3;
- (void)setRevGeoTicket:(id)a3;
- (void)submitWithTraits:(id)a3 completionHandler:(id)a4 networkActivityHandler:(id)a5;
@end

@implementation CurrentLocationMapServiceTicket

- (CurrentLocationMapServiceTicket)initWithLocationManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CurrentLocationMapServiceTicket;
  v6 = [(CurrentLocationMapServiceTicket *)&v9 init];
  if (v6)
  {
    v7 = sub_100930324();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v11 = v6;
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] Initializing with location manager: %@", buf, 0x16u);
    }

    objc_storeStrong((id *)&v6->_locationManager, a3);
  }

  return v6;
}

- (void)dealloc
{
  v3 = sub_100930324();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)CurrentLocationMapServiceTicket;
  [(CurrentLocationMapServiceTicket *)&v4 dealloc];
}

- (void)submitWithTraits:(id)a3 completionHandler:(id)a4 networkActivityHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  self->_cancelled = 0;
  v11 = [(CurrentLocationMapServiceTicket *)self currentLocation];
  __int16 v12 = sub_100930324();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 134349315;
      v27 = self;
      __int16 v28 = 2113;
      v29 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Submitting rev geo for location: %{private}@", buf, 0x16u);
    }

    v14 = [(CurrentLocationMapServiceTicket *)self _revGeoTicketForCurrentLocation:v11 traits:v8 completionHandler:v9 networkActivityHandler:v10];
    [(CurrentLocationMapServiceTicket *)self setRevGeoTicket:v14];
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 134349056;
      v27 = self;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}p] Submitting single location update", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v15 = [(CurrentLocationMapServiceTicket *)self locationManager];
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_1009306E4;
    v21 = &unk_101302708;
    objc_copyWeak(&v25, (id *)buf);
    id v23 = v9;
    id v22 = v8;
    id v24 = v10;
    v16 = [v15 singleLocationUpdateWithHandler:&v18];
    -[CurrentLocationMapServiceTicket setLocationFixOperation:](self, "setLocationFixOperation:", v16, v18, v19, v20, v21);

    v17 = [(CurrentLocationMapServiceTicket *)self locationFixOperation];
    [v17 start];

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

- (id)_revGeoTicketForCurrentLocation:(id)a3 traits:(id)a4 completionHandler:(id)a5 networkActivityHandler:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v13 = [objc_alloc((Class)GEOLocation) initWithCLLocation:v12];

  v14 = sub_1009E12F4(v10);

  v15 = +[GEOComposedWaypoint composedWaypointForCurrentLocation:v13 traits:v11 completionHandler:v14 networkActivityHandler:v9];

  return v15;
}

- (void)cancel
{
  v3 = sub_100930324();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v5 = 134349056;
    v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Cancelling", (uint8_t *)&v5, 0xCu);
  }

  self->_cancelled = 1;
  [(CurrentLocationMapServiceTicket *)self setLocationFixOperation:0];
  objc_super v4 = [(CurrentLocationMapServiceTicket *)self revGeoTicket];
  [v4 cancel];
}

- (void)applyToCorrectedSearch:(id)a3
{
  id v4 = a3;
  id v5 = [(CurrentLocationMapServiceTicket *)self revGeoTicket];
  [v5 applyToCorrectedSearch:v4];
}

- (CLLocation)currentLocation
{
  v3 = [(MKLocationManager *)self->_locationManager lastGoodLocation];
  id v4 = sub_100930324();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 134349315;
    v18 = self;
    __int16 v19 = 2113;
    v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Attempting to use last 'good' location: %{private}@", (uint8_t *)&v17, 0x16u);
  }

  if (v3)
  {
    id v5 = +[NSDate date];
    v6 = [v3 timestamp];
    [v5 timeIntervalSinceDate:v6];
    double v8 = v7;
    +[CLLocation _mapkit_timeToExpire];
    double v10 = v9;

    if (v8 > v10)
    {
      id v11 = sub_100930324();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        +[CLLocation _mapkit_timeToExpire];
        int v17 = 134349312;
        v18 = self;
        __int16 v19 = 2048;
        v20 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}p] Last 'good' location is too old (> %f seconds); using last known location",
          (uint8_t *)&v17,
          0x16u);
      }

      uint64_t v13 = [(MKLocationManager *)self->_locationManager lastLocation];

      v3 = (void *)v13;
    }
  }
  else
  {
    v14 = sub_100930324();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v17 = 134349056;
      v18 = self;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%{public}p] We don't have a last 'good' location; using last known location",
        (uint8_t *)&v17,
        0xCu);
    }

    v3 = [(MKLocationManager *)self->_locationManager lastLocation];
  }
  v15 = sub_100930324();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 134349315;
    v18 = self;
    __int16 v19 = 2113;
    v20 = v3;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[%{public}p] Returning current location: %{private}@", (uint8_t *)&v17, 0x16u);
  }

  return (CLLocation *)v3;
}

- (void)setLocationFixOperation:(id)a3
{
  id v5 = (MKLocationManagerOperation *)a3;
  locationFixOperation = self->_locationFixOperation;
  p_locationFixOperation = &self->_locationFixOperation;
  v6 = locationFixOperation;
  if (locationFixOperation != v5)
  {
    double v9 = v5;
    [(MKLocationManagerOperation *)v6 cancel];
    objc_storeStrong((id *)p_locationFixOperation, a3);
    id v5 = v9;
  }
}

- (void)setRevGeoTicket:(id)a3
{
  id v5 = (GEOMapServiceCorrectableTicket *)a3;
  revGeoTicket = self->_revGeoTicket;
  p_revGeoTicket = &self->_revGeoTicket;
  v6 = revGeoTicket;
  if (revGeoTicket != v5)
  {
    double v9 = v5;
    [(GEOMapServiceCorrectableTicket *)v6 cancel];
    objc_storeStrong((id *)p_revGeoTicket, a3);
    id v5 = v9;
  }
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (MKLocationManagerOperation)locationFixOperation
{
  return self->_locationFixOperation;
}

- (GEOMapServiceCorrectableTicket)revGeoTicket
{
  return self->_revGeoTicket;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revGeoTicket, 0);
  objc_storeStrong((id *)&self->_locationFixOperation, 0);

  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end