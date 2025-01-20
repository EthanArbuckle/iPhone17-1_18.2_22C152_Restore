@interface MapsBaseLightMonitor
- (BOOL)_isMonitoring;
- (MapsBaseLightMonitor)init;
- (void)_notifyDidChange;
- (void)_setMonitoring:(BOOL)a3;
- (void)dealloc;
- (void)startMonitoringWithObserver:(id)a3;
- (void)stopMonitoringWithObserver:(id)a3;
@end

@implementation MapsBaseLightMonitor

- (void)_notifyDidChange
{
  v3 = sub_10008FEAC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    v5 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: notifying observers", (uint8_t *)&v4, 0xCu);
  }

  [(GEOObserverHashTable *)self->_observers lightMonitorDidUpdate:self];
}

- (void)startMonitoringWithObserver:(id)a3
{
  [(GEOObserverHashTable *)self->_observers registerObserver:a3];

  [(MapsBaseLightMonitor *)self _setMonitoring:1];
}

- (MapsBaseLightMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)MapsBaseLightMonitor;
  v2 = [(MapsBaseLightMonitor *)&v6 init];
  if (v2)
  {
    v3 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___MapsLightMonitorObserver queue:&_dispatch_main_q];
    observers = v2->_observers;
    v2->_observers = v3;
  }
  return v2;
}

- (void)_setMonitoring:(BOOL)a3
{
  if (self->_monitoring != a3)
  {
    BOOL v3 = a3;
    self->_monitoring = a3;
    v5 = sub_10008FEAC();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        int v8 = 138412290;
        v9 = self;
        v7 = "%@: started monitoring";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v7, (uint8_t *)&v8, 0xCu);
      }
    }
    else if (v6)
    {
      int v8 = 138412290;
      v9 = self;
      v7 = "%@: stopped monitoring";
      goto LABEL_7;
    }
  }
}

- (void)stopMonitoringWithObserver:(id)a3
{
  [(GEOObserverHashTable *)self->_observers unregisterObserver:a3];
  id v4 = [(GEOObserverHashTable *)self->_observers hasObservers];

  [(MapsBaseLightMonitor *)self _setMonitoring:v4];
}

- (BOOL)_isMonitoring
{
  return self->_monitoring;
}

- (void)dealloc
{
  [(MapsBaseLightMonitor *)self _setMonitoring:0];
  v3.receiver = self;
  v3.super_class = (Class)MapsBaseLightMonitor;
  [(MapsBaseLightMonitor *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end