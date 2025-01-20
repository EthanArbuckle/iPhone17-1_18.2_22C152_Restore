@interface DistanceUnitDataProvider
- (BOOL)active;
- (BOOL)hasInitialData;
- (DistanceUnitDataProvider)init;
- (GEOObserverHashTable)observers;
- (int64_t)distanceUnit;
- (void)_localeDidChange:(id)a3;
- (void)_updateAndNotifyObservers:(BOOL)a3;
- (void)setActive:(BOOL)a3;
@end

@implementation DistanceUnitDataProvider

- (DistanceUnitDataProvider)init
{
  v5.receiver = self;
  v5.super_class = (Class)DistanceUnitDataProvider;
  v2 = [(DistanceUnitDataProvider *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DistanceUnitDataProvider *)v2 _updateAndNotifyObservers:0];
  }
  return v3;
}

- (BOOL)hasInitialData
{
  return 1;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    BOOL v3 = a3;
    self->_active = a3;
    id v7 = +[NSNotificationCenter defaultCenter];
    if (v3)
    {
      objc_super v5 = MNLocaleDidChangeNotification();
      [v7 addObserver:self selector:"_localeDidChange:" name:v5 object:0];

      [(DistanceUnitDataProvider *)self _updateAndNotifyObservers:0];
    }
    else
    {
      v6 = MNLocaleDidChangeNotification();
      [v7 removeObserver:self name:v6 object:0];
    }
  }
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___HomeDataProvidingObserver queue:0];
    objc_super v5 = self->_observers;
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
    v6 = +[NSLocale currentLocale];
    unsigned int v7 = [v6 _navigation_distanceUsesMetricSystem];
    if (v7) {
      int64_t v8 = 1;
    }
    else {
      int64_t v8 = 2;
    }

    int64_t distanceUnit = self->_distanceUnit;
    v10 = sub_1000AA148();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      uint64_t v13 = NSStringFromSelector(a2);
      v14 = (void *)v13;
      CFStringRef v15 = @"Imperial";
      int v16 = 138412802;
      v17 = v12;
      __int16 v18 = 2112;
      if (v7) {
        CFStringRef v15 = @"Metric";
      }
      uint64_t v19 = v13;
      __int16 v20 = 2112;
      CFStringRef v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%@ %@, distance unit = %@", (uint8_t *)&v16, 0x20u);
    }
    if (v8 != distanceUnit)
    {
      self->_int64_t distanceUnit = v8;
      if (v3) {
        [(GEOObserverHashTable *)self->_observers homeDataProvidingObjectDidUpdate:self];
      }
    }
  }
}

- (void)_localeDidChange:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (int64_t)distanceUnit
{
  return self->_distanceUnit;
}

- (void).cxx_destruct
{
}

@end