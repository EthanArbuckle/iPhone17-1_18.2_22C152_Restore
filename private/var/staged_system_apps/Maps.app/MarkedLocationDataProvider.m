@interface MarkedLocationDataProvider
- (BOOL)active;
- (BOOL)hasInitialData;
- (GEOObserverHashTable)observers;
- (SearchResult)markedLocation;
- (void)_updateAndNotifyObservers:(BOOL)a3;
- (void)customSearchManager:(id)a3 didModifyCustomSearchResult:(id)a4 coordinateChanged:(BOOL)a5;
- (void)customSearchManager:(id)a3 didReplaceCustomSearchResult:(id)a4 animated:(BOOL)a5 shouldSelectOnMap:(id)a6 context:(id)a7;
- (void)setActive:(BOOL)a3;
@end

@implementation MarkedLocationDataProvider

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    v5 = +[CustomSearchManager sharedManager];
    id v6 = v5;
    if (v3)
    {
      [v5 addObserver:self];

      [(MarkedLocationDataProvider *)self _updateAndNotifyObservers:0];
    }
    else
    {
      [v5 removeObserver:self];
    }
  }
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

- (void)_updateAndNotifyObservers:(BOOL)a3
{
  if (self->_active)
  {
    BOOL v3 = a3;
    id v6 = +[CustomSearchManager sharedManager];
    v7 = [v6 customSearchResult];

    if ([v7 type] == 3)
    {
      v8 = +[CustomSearchManager sharedManager];
      v9 = [v8 customSearchResult];
      markedLocation = self->_markedLocation;
      self->_markedLocation = v9;

      v11 = +[CustomLocationManager sharedManager];
      [v11 processSearchResult:self->_markedLocation traits:0];
    }
    else
    {
      v11 = self->_markedLocation;
      self->_markedLocation = 0;
    }

    v12 = sub_1000AA148();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      NSStringFromSelector(a2);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = self->_markedLocation;
      if (v16)
      {
        [(SearchResult *)self->_markedLocation coordinate];
        v19 = +[NSString stringWithFormat:@"%+.8f, %+.8f", v17, v18];
      }
      else
      {
        v19 = 0;
      }
      v20 = sub_100097E28(v3);
      *(_DWORD *)buf = 138413058;
      v22 = v14;
      __int16 v23 = 2112;
      id v24 = v15;
      __int16 v25 = 2112;
      v26 = v19;
      __int16 v27 = 2112;
      v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%@ %@, markedLocation = %@, notifyObservers = %@", buf, 0x2Au);
      if (v16) {
    }
      }
    if (v3) {
      [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
    }
  }
}

- (SearchResult)markedLocation
{
  return self->_markedLocation;
}

- (BOOL)hasInitialData
{
  return 1;
}

- (void)customSearchManager:(id)a3 didReplaceCustomSearchResult:(id)a4 animated:(BOOL)a5 shouldSelectOnMap:(id)a6 context:(id)a7
{
}

- (void)customSearchManager:(id)a3 didModifyCustomSearchResult:(id)a4 coordinateChanged:(BOOL)a5
{
}

- (BOOL)active
{
  return self->_active;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markedLocation, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end