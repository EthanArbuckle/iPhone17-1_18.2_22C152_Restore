@interface PedestrianARSessionThermalStateMonitor
+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey;
+ (id)friendlyName;
- (MapsThermalPressureController)thermalPressureController;
- (PedestrianARSessionThermalStateMonitor)initWithObserver:(id)a3 thermalPressureController:(id)a4;
- (id)debugDescription;
- (void)dealloc;
- (void)didUpdateThermalPressureLevel:(int)a3;
- (void)setThermalPressureController:(id)a3;
- (void)updateState;
@end

@implementation PedestrianARSessionThermalStateMonitor

- (PedestrianARSessionThermalStateMonitor)initWithObserver:(id)a3 thermalPressureController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    v11 = sub_1005762E4();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "-[PedestrianARSessionThermalStateMonitor initWithObserver:thermalPressureController:]";
      __int16 v17 = 2080;
      v18 = "PedestrianARSessionThermalStateMonitor.m";
      __int16 v19 = 1024;
      int v20 = 35;
      __int16 v21 = 2080;
      v22 = "thermalPressureController != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v12 = sub_1005762E4();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)PedestrianARSessionThermalStateMonitor;
  v8 = [(PedestrianARSessionMonitor *)&v14 initWithObserver:v6];
  if (v8)
  {
    v9 = sub_10000A214();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v16 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v8->_thermalPressureController, a4);
    [(MapsThermalPressureController *)v8->_thermalPressureController addThermalPressureObserver:v8];
    [(PedestrianARSessionThermalStateMonitor *)v8 updateState];
  }

  return v8;
}

- (void)updateState
{
  v3 = [(PedestrianARSessionThermalStateMonitor *)self thermalPressureController];
  unsigned int v4 = [v3 currentThermalPressureLevel];

  unsigned int Integer = GEOConfigGetInteger();
  id v6 = sub_10000A214();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v4 >= Integer)
  {
    if (v7)
    {
      v8 = [(PedestrianARSessionThermalStateMonitor *)self thermalPressureController];
      int v10 = 134349568;
      v11 = self;
      __int16 v12 = 1024;
      unsigned int v13 = [v8 currentThermalPressureLevel];
      __int16 v14 = 1024;
      unsigned int v15 = Integer;
      v9 = "[%{public}p] Detected thermal state is too high (%d >= %d); updating state";
      goto LABEL_6;
    }
  }
  else if (v7)
  {
    v8 = [(PedestrianARSessionThermalStateMonitor *)self thermalPressureController];
    int v10 = 134349568;
    v11 = self;
    __int16 v12 = 1024;
    unsigned int v13 = [v8 currentThermalPressureLevel];
    __int16 v14 = 1024;
    unsigned int v15 = Integer;
    v9 = "[%{public}p] Detected thermal state is sufficiently low (%d < %d); updating state";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v10, 0x18u);
  }
  [(PedestrianARSessionMonitor *)self setShouldShowPedestrianAR:v4 < Integer];
}

- (MapsThermalPressureController)thermalPressureController
{
  return self->_thermalPressureController;
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2 = MapsConfig_PedestrianARSessionThermalStateMonitorEnabled;
  v3 = off_1015EFED8;
  result.var0.var1 = v3;
  *(void *)&result.var0.var0 = v2;
  return result;
}

- (void)dealloc
{
  v3 = sub_10000A214();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  [(MapsThermalPressureController *)self->_thermalPressureController removeThermalPressureObserver:self];
  v4.receiver = self;
  v4.super_class = (Class)PedestrianARSessionThermalStateMonitor;
  [(PedestrianARSessionMonitor *)&v4 dealloc];
}

- (id)debugDescription
{
  v3 = [(id)objc_opt_class() friendlyName];
  objc_super v4 = [(PedestrianARSessionThermalStateMonitor *)self thermalPressureController];
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@\nthermal state: %d\n", v3, [v4 currentThermalPressureLevel]);

  return v5;
}

+ (id)friendlyName
{
  return @"Thermal State Monitor";
}

- (void)didUpdateThermalPressureLevel:(int)a3
{
  v5 = sub_10000A214();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v9 = self;
    __int16 v10 = 1024;
    int v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Got thermal pressure update: %d", buf, 0x12u);
  }

  objc_initWeak((id *)buf, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1006FC920;
  block[3] = &unk_1012E6708;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

- (void)setThermalPressureController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end