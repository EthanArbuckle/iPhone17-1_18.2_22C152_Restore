@interface CurrentLocationDataProvider
- (BOOL)active;
- (BOOL)hasInitialData;
- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3;
- (CurrentLocationDataProvider)init;
- (GEOLocation)currentLocation;
- (GEOObserverHashTable)observers;
- (void)_updateCurrentLocationAndNotifyObservers:(BOOL)a3;
- (void)locationManagerDidReset:(id)a3;
- (void)locationManagerUpdatedLocation:(id)a3;
- (void)setActive:(BOOL)a3;
@end

@implementation CurrentLocationDataProvider

- (CurrentLocationDataProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)CurrentLocationDataProvider;
  v2 = [(CurrentLocationDataProvider *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[MKLocationManager sharedLocationManager];
    locationManager = v2->_locationManager;
    v2->_locationManager = (MKLocationManager *)v3;
  }
  return v2;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    locationManager = self->_locationManager;
    if (a3)
    {
      [(MKLocationManager *)locationManager startLocationUpdateWithObserver:self];
      [(CurrentLocationDataProvider *)self _updateCurrentLocationAndNotifyObservers:0];
    }
    else
    {
      [(MKLocationManager *)locationManager stopLocationUpdateWithObserver:self];
    }
  }
}

- (BOOL)hasInitialData
{
  return 1;
}

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

- (void)_updateCurrentLocationAndNotifyObservers:(BOOL)a3
{
  if (self->_active)
  {
    BOOL v3 = a3;
    if ([(MKLocationManager *)self->_locationManager isAuthorizedForPreciseLocation])
    {
      objc_super v6 = [(MKLocationManager *)self->_locationManager currentLocation];
    }
    else
    {
      objc_super v6 = 0;
    }
    if (v6 == self->_currentLocation) {
      unsigned int v7 = 1;
    }
    else {
      unsigned int v7 = -[GEOLocation isEqual:](v6, "isEqual:");
    }
    v8 = sub_1000AA148();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      NSStringFromSelector(a2);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        [(GEOLocation *)v6 coordinate];
        v14 = +[NSString stringWithFormat:@"%+.8f, %+.8f", v12, v13];
      }
      else
      {
        v14 = 0;
      }
      v15 = sub_100097E28(v7 ^ 1);
      *(_DWORD *)buf = 138413058;
      v17 = v10;
      __int16 v18 = 2112;
      id v19 = v11;
      __int16 v20 = 2112;
      v21 = v14;
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@ %@, currentLocation = %@, currentLocationChanged = %@", buf, 0x2Au);
      if (v6) {
    }
      }
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_currentLocation, v6);
      if (v3) {
        [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
      }
    }
  }
}

- (void)locationManagerUpdatedLocation:(id)a3
{
}

- (void)locationManagerDidReset:(id)a3
{
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (BOOL)active
{
  return self->_active;
}

- (GEOLocation)currentLocation
{
  return self->_currentLocation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end