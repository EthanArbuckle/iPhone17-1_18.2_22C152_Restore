@interface PedestrianARSessionTransportTypeMonitor
+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey;
+ (id)friendlyName;
- (NSString)debugDescription;
- (NavigationSession)navigationSession;
- (PedestrianARSessionTransportTypeMonitor)initWithObserver:(id)a3 platformController:(id)a4;
- (PlatformController)platformController;
- (RoutePlanningSession)routePlanningSession;
- (void)dealloc;
- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4;
- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4;
- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5;
- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5;
- (void)setNavigationSession:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setRoutePlanningSession:(id)a3;
- (void)updateState;
@end

@implementation PedestrianARSessionTransportTypeMonitor

- (void)updateState
{
  v3 = sub_10001B830();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 134349056;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating state", (uint8_t *)&v12, 0xCu);
  }

  v4 = [(PedestrianARSessionTransportTypeMonitor *)self routePlanningSession];

  if (v4)
  {
    v5 = [(PedestrianARSessionTransportTypeMonitor *)self routePlanningSession];
    BOOL v6 = [v5 currentTransportType] == (id)2;
    v7 = self;
  }
  else
  {
    v8 = [(PedestrianARSessionTransportTypeMonitor *)self navigationSession];

    if (!v8)
    {
      [(PedestrianARSessionMonitor *)self setShouldShowPedestrianAR:0];
      return;
    }
    v5 = [(PedestrianARSessionTransportTypeMonitor *)self navigationSession];
    if ([v5 currentTransportType] == (id)2)
    {
      v9 = [(PedestrianARSessionTransportTypeMonitor *)self navigationSession];
      v10 = [v9 currentRouteCollection];
      v11 = [v10 currentRoute];
      -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", [v11 isWalkingOnlyTransitRoute] ^ 1);

      goto LABEL_6;
    }
    v7 = self;
    BOOL v6 = 0;
  }
  [(PedestrianARSessionMonitor *)v7 setShouldShowPedestrianAR:v6];
LABEL_6:
}

- (void)setRoutePlanningSession:(id)a3
{
  id v4 = a3;
  v5 = sub_10001B830();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134349314;
    v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating route planning session: %@", (uint8_t *)&v8, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_routePlanningSession);
  [WeakRetained removeObserver:self];

  id v7 = objc_storeWeak((id *)&self->_routePlanningSession, v4);
  [v4 addObserver:self];
}

- (void)setNavigationSession:(id)a3
{
  id v4 = a3;
  v5 = sub_10001B830();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 134349314;
    v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Updating navigation session: %@", (uint8_t *)&v8, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationSession);
  [WeakRetained removeObserver:self];

  id v7 = objc_storeWeak((id *)&self->_navigationSession, v4);
  [v4 addObserver:self];
}

- (PedestrianARSessionTransportTypeMonitor)initWithObserver:(id)a3 platformController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    v20 = sub_1005762E4();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v28 = "-[PedestrianARSessionTransportTypeMonitor initWithObserver:platformController:]";
      __int16 v29 = 2080;
      v30 = "PedestrianARSessionTransportTypeMonitor.m";
      __int16 v31 = 1024;
      int v32 = 39;
      __int16 v33 = 2080;
      v34 = "observer != nil";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v21 = sub_1005762E4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v28 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v7)
  {
    v23 = sub_1005762E4();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v28 = "-[PedestrianARSessionTransportTypeMonitor initWithObserver:platformController:]";
      __int16 v29 = 2080;
      v30 = "PedestrianARSessionTransportTypeMonitor.m";
      __int16 v31 = 1024;
      int v32 = 40;
      __int16 v33 = 2080;
      v34 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v24 = sub_1005762E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v28 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)PedestrianARSessionTransportTypeMonitor;
  int v8 = [(PedestrianARSessionMonitor *)&v26 initWithObserver:v6];
  if (v8)
  {
    v9 = sub_10001B830();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v28 = (const char *)v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    id v10 = objc_storeWeak((id *)&v8->_platformController, v7);
    [v7 addObserver:v8];

    id WeakRetained = objc_loadWeakRetained((id *)&v8->_platformController);
    int v12 = [WeakRetained currentSession];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
    id v14 = v13;

    [(PedestrianARSessionTransportTypeMonitor *)v8 setRoutePlanningSession:v14];
    id v15 = objc_loadWeakRetained((id *)&v8->_platformController);
    v16 = [v15 currentSession];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v18 = v17;

    [(PedestrianARSessionTransportTypeMonitor *)v8 setNavigationSession:v18];
    [(PedestrianARSessionTransportTypeMonitor *)v8 updateState];
  }

  return v8;
}

- (RoutePlanningSession)routePlanningSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routePlanningSession);

  return (RoutePlanningSession *)WeakRetained;
}

- (NavigationSession)navigationSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationSession);

  return (NavigationSession *)WeakRetained;
}

+ ($6E15C01CA1BE37A4936191A84F7075E2)enablementGEOConfigKey
{
  uint64_t v2 = MapsConfig_PedestrianARSessionTransportTypeMonitorEnabled;
  v3 = off_1015EFEA8;
  result.var0.var1 = v3;
  *(void *)&result.var0.var0 = v2;
  return result;
}

- (void)dealloc
{
  v3 = sub_10001B830();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  [WeakRetained removeObserver:self];

  id v5 = objc_loadWeakRetained((id *)&self->_routePlanningSession);
  [v5 removeObserver:self];

  id v6 = objc_loadWeakRetained((id *)&self->_navigationSession);
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)PedestrianARSessionTransportTypeMonitor;
  [(PedestrianARSessionMonitor *)&v7 dealloc];
}

- (NSString)debugDescription
{
  v3 = [(PedestrianARSessionTransportTypeMonitor *)self routePlanningSession];
  if (v3)
  {
    id v4 = [(PedestrianARSessionTransportTypeMonitor *)self routePlanningSession];
    id v5 = (char *)[v4 currentTransportType];
  }
  else
  {
    id v4 = [(PedestrianARSessionTransportTypeMonitor *)self navigationSession];
    if (v4)
    {
      id v6 = [(PedestrianARSessionTransportTypeMonitor *)self navigationSession];
      id v5 = (char *)[v6 currentTransportType];
    }
    else
    {
      id v5 = 0;
    }
  }

  uint64_t v7 = [(id)objc_opt_class() friendlyName];
  int v8 = (void *)v7;
  if ((unint64_t)(v5 - 1) > 4) {
    CFStringRef v9 = @"Undefined";
  }
  else {
    CFStringRef v9 = off_1013132F8[(void)(v5 - 1)];
  }
  id v10 = +[NSString stringWithFormat:@"%@\ntransport type: %@\n", v7, v9];

  return (NSString *)v10;
}

+ (id)friendlyName
{
  return @"Transport Type Monitor";
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  [(PedestrianARSessionTransportTypeMonitor *)self setRoutePlanningSession:v8];

  id v11 = v6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    CFStringRef v9 = v11;
  }
  else {
    CFStringRef v9 = 0;
  }
  id v10 = v9;

  [(PedestrianARSessionTransportTypeMonitor *)self setNavigationSession:v10];
  [(PedestrianARSessionTransportTypeMonitor *)self updateState];
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  id v6 = sub_10001B830();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134349056;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Route planning changed transport type", (uint8_t *)&v7, 0xCu);
  }

  [(PedestrianARSessionTransportTypeMonitor *)self updateState];
}

- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4
{
  id v5 = sub_10001B830();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v6 = 134349056;
    int v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Navigation changed transport type", (uint8_t *)&v6, 0xCu);
  }

  [(PedestrianARSessionTransportTypeMonitor *)self updateState];
}

- (void)navigationSession:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v5 = a4;
  int v6 = sub_10001B830();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = 134349314;
    id v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Navigation updated route collection: %@", (uint8_t *)&v7, 0x16u);
  }

  [(PedestrianARSessionTransportTypeMonitor *)self updateState];
}

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (void)setPlatformController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationSession);
  objc_destroyWeak((id *)&self->_routePlanningSession);

  objc_destroyWeak((id *)&self->_platformController);
}

@end