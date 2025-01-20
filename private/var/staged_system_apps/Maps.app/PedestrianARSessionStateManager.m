@interface PedestrianARSessionStateManager
- (BOOL)didFinishCreatingMonitors;
- (BOOL)shouldCreateMonitor:(Class)a3;
- (BOOL)shouldShowPedestrianAR;
- (GEOObserverHashTable)observers;
- (NSMapTable)classMonitorMap;
- (NSMutableSet)monitors;
- (NSString)debugDescription;
- (PedestrianARSessionStateManager)initWithPlatformController:(id)a3;
- (PlatformController)platformController;
- (id)allMonitors;
- (void)addObserver:(id)a3;
- (void)calculateState;
- (void)createEnabledMonitors;
- (void)createMonitorIfNecessary:(Class)a3 configurationBlock:(id)a4;
- (void)dealloc;
- (void)listenForGEOConfigKeyChanges;
- (void)monitor:(id)a3 didChangeState:(BOOL)a4;
- (void)removeDisabledMonitors;
- (void)removeObserver:(id)a3;
- (void)setClassMonitorMap:(id)a3;
- (void)setDidFinishCreatingMonitors:(BOOL)a3;
- (void)setMonitors:(id)a3;
- (void)setObservers:(id)a3;
- (void)setPlatformController:(id)a3;
- (void)setShouldShowPedestrianAR:(BOOL)a3;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation PedestrianARSessionStateManager

- (PlatformController)platformController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);

  return (PlatformController *)WeakRetained;
}

- (PedestrianARSessionStateManager)initWithPlatformController:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[PedestrianARSessionStateManager initWithPlatformController:]";
      __int16 v20 = 2080;
      v21 = "PedestrianARSessionStateManager.m";
      __int16 v22 = 1024;
      int v23 = 59;
      __int16 v24 = 2080;
      v25 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)PedestrianARSessionStateManager;
  v5 = [(PedestrianARSessionStateManager *)&v17 init];
  if (v5)
  {
    v6 = sub_1000AFBCC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v19 = (const char *)v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeWeak((id *)&v5->_platformController, v4);
    v7 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___PedestrianARSessionStateManagerDelegate queue:0];
    observers = v5->_observers;
    v5->_observers = v7;

    uint64_t v9 = +[NSMutableSet set];
    monitors = v5->_monitors;
    v5->_monitors = (NSMutableSet *)v9;

    uint64_t v11 = +[NSMapTable strongToWeakObjectsMapTable];
    classMonitorMap = v5->_classMonitorMap;
    v5->_classMonitorMap = (NSMapTable *)v11;

    [(PedestrianARSessionStateManager *)v5 listenForGEOConfigKeyChanges];
    [(PedestrianARSessionStateManager *)v5 createEnabledMonitors];
    [(PedestrianARSessionStateManager *)v5 calculateState];
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = sub_1000AFBCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134349314;
      v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Adding observer: %@", (uint8_t *)&v7, 0x16u);
    }

    v6 = [(PedestrianARSessionStateManager *)self observers];
    [v6 registerObserver:v4];
  }
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)monitor:(id)a3 didChangeState:(BOOL)a4
{
  id v5 = a3;
  v6 = sub_1000AFBCC();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v9 = 134349314;
    id v10 = self;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Monitor (%@) changed state; recalculating global state",
      (uint8_t *)&v9,
      0x16u);
  }
  [(PedestrianARSessionStateManager *)self calculateState];
}

- (void)calculateState
{
  if ([(PedestrianARSessionStateManager *)self didFinishCreatingMonitors])
  {
    v3 = sub_1000AFBCC();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v16 = self;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Calculating state", buf, 0xCu);
    }

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(PedestrianARSessionStateManager *)self monitors];
    id v5 = [v4 countByEnumeratingWithState:&v11 objects:v19 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          int v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (([v9 shouldShowPedestrianAR] & 1) == 0)
          {
            id v10 = sub_1000AFBCC();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134349314;
              v16 = self;
              __int16 v17 = 2112;
              v18 = v9;
              _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Monitor is requesting to disable the feature: %@", buf, 0x16u);
            }

            [(PedestrianARSessionStateManager *)self setShouldShowPedestrianAR:0];
            return;
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v11 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    [(PedestrianARSessionStateManager *)self setShouldShowPedestrianAR:1];
  }
}

- (BOOL)didFinishCreatingMonitors
{
  return self->_didFinishCreatingMonitors;
}

- (void)createEnabledMonitors
{
  v3 = sub_1000AFBCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v19 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Creating newly enabled monitors", buf, 0xCu);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100028864;
  v17[3] = &unk_1012E8BC0;
  v17[4] = self;
  [(PedestrianARSessionStateManager *)self createMonitorIfNecessary:objc_opt_class() configurationBlock:v17];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1001084D4;
  v16[3] = &unk_1012E8BC0;
  v16[4] = self;
  [(PedestrianARSessionStateManager *)self createMonitorIfNecessary:objc_opt_class() configurationBlock:v16];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100008AB4;
  v15[3] = &unk_1012E8BC0;
  v15[4] = self;
  [(PedestrianARSessionStateManager *)self createMonitorIfNecessary:objc_opt_class() configurationBlock:v15];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100108490;
  v14[3] = &unk_1012E8BC0;
  v14[4] = self;
  [(PedestrianARSessionStateManager *)self createMonitorIfNecessary:objc_opt_class() configurationBlock:v14];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10010844C;
  v13[3] = &unk_1012E8BC0;
  v13[4] = self;
  [(PedestrianARSessionStateManager *)self createMonitorIfNecessary:objc_opt_class() configurationBlock:v13];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100108408;
  v12[3] = &unk_1012E8BC0;
  v12[4] = self;
  [(PedestrianARSessionStateManager *)self createMonitorIfNecessary:objc_opt_class() configurationBlock:v12];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100028CE0;
  v11[3] = &unk_1012E8BC0;
  v11[4] = self;
  [(PedestrianARSessionStateManager *)self createMonitorIfNecessary:objc_opt_class() configurationBlock:v11];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100019230;
  v10[3] = &unk_1012E8BC0;
  v10[4] = self;
  [(PedestrianARSessionStateManager *)self createMonitorIfNecessary:objc_opt_class() configurationBlock:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001C23C;
  v9[3] = &unk_1012E8BC0;
  v9[4] = self;
  [(PedestrianARSessionStateManager *)self createMonitorIfNecessary:objc_opt_class() configurationBlock:v9];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100023FD4;
  v8[3] = &unk_1012E8BC0;
  v8[4] = self;
  [(PedestrianARSessionStateManager *)self createMonitorIfNecessary:objc_opt_class() configurationBlock:v8];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001618C;
  v7[3] = &unk_1012E8BC0;
  v7[4] = self;
  [(PedestrianARSessionStateManager *)self createMonitorIfNecessary:objc_opt_class() configurationBlock:v7];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100034994;
  v6[3] = &unk_1012E8BC0;
  v6[4] = self;
  [(PedestrianARSessionStateManager *)self createMonitorIfNecessary:objc_opt_class() configurationBlock:v6];
  [(PedestrianARSessionStateManager *)self setDidFinishCreatingMonitors:1];
  id v4 = sub_1000AFBCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    id v5 = [(PedestrianARSessionStateManager *)self monitors];
    *(_DWORD *)buf = 134349314;
    v19 = self;
    __int16 v20 = 2112;
    v21 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Finished creating monitors: %@", buf, 0x16u);
  }
}

- (void)createMonitorIfNecessary:(Class)a3 configurationBlock:(id)a4
{
  id v6 = (void (**)(void))a4;
  unsigned int v7 = [(PedestrianARSessionStateManager *)self shouldCreateMonitor:a3];
  v8 = sub_1000AFBCC();
  int v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v10 = NSStringFromClass(a3);
      int v16 = 134349314;
      __int16 v17 = self;
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}p] Creating monitor: %@", (uint8_t *)&v16, 0x16u);
    }
    int v9 = v6[2](v6);
    long long v11 = [(PedestrianARSessionStateManager *)self monitors];
    [v11 addObject:v9];

    long long v12 = [(PedestrianARSessionStateManager *)self classMonitorMap];
    [v12 setObject:v9 forKey:a3];

    long long v13 = sub_1000AFBCC();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    int v16 = 134349314;
    __int16 v17 = self;
    __int16 v18 = 2112;
    v19 = v9;
    long long v14 = "[%{public}p] Created monitor: %@";
    v15 = v13;
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v16, 0x16u);
LABEL_9:

    goto LABEL_10;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    long long v13 = NSStringFromClass(a3);
    int v16 = 134349314;
    __int16 v17 = self;
    __int16 v18 = 2112;
    v19 = v13;
    long long v14 = "[%{public}p] NOT creating monitor: %@";
    v15 = v9;
    goto LABEL_8;
  }
LABEL_10:
}

- (BOOL)shouldCreateMonitor:(Class)a3
{
  if (([(objc_class *)a3 isEnabled] & 1) == 0)
  {
    unsigned int v7 = sub_1000AFBCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v9 = NSStringFromClass(a3);
      int v14 = 134349314;
      v15 = self;
      __int16 v16 = 2112;
      __int16 v17 = v9;
      id v10 = "[%{public}p] %@ is not enabled; should not create";
      goto LABEL_7;
    }
LABEL_8:
    BOOL v11 = 0;
    goto LABEL_9;
  }
  id v5 = [(PedestrianARSessionStateManager *)self classMonitorMap];
  id v6 = [v5 objectForKey:a3];

  unsigned int v7 = sub_1000AFBCC();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v8)
    {
      int v9 = NSStringFromClass(a3);
      int v14 = 134349314;
      v15 = self;
      __int16 v16 = 2112;
      __int16 v17 = v9;
      id v10 = "[%{public}p] %@ already exists; should not create";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v10, (uint8_t *)&v14, 0x16u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v8)
  {
    long long v13 = NSStringFromClass(a3);
    int v14 = 134349314;
    v15 = self;
    __int16 v16 = 2112;
    __int16 v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] %@ should be created", (uint8_t *)&v14, 0x16u);
  }
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

- (NSMapTable)classMonitorMap
{
  return self->_classMonitorMap;
}

- (NSMutableSet)monitors
{
  return self->_monitors;
}

- (void)listenForGEOConfigKeyChanges
{
  +[PedestrianARSessionCarPlayConnectionMonitor enablementGEOConfigKey];
  _GEOConfigAddDelegateListenerForKey();
  +[PedestrianARSessionCoarseLocationMonitor enablementGEOConfigKey];
  _GEOConfigAddDelegateListenerForKey();

  +[PedestrianARSessionNetworkReachabilityMonitor enablementGEOConfigKey];
  _GEOConfigAddDelegateListenerForKey();

  +[PedestrianARSessionOfflineMonitor enablementGEOConfigKey];
  _GEOConfigAddDelegateListenerForKey();

  +[PedestrianARSessionThermalStateMonitor enablementGEOConfigKey];
  _GEOConfigAddDelegateListenerForKey();

  +[PedestrianARSessionTileAvailabilityMonitor enablementGEOConfigKey];
  _GEOConfigAddDelegateListenerForKey();

  +[PedestrianARSessionTransportTypeMonitor enablementGEOConfigKey];
  _GEOConfigAddDelegateListenerForKey();

  +[PedestrianARSessionSunsetSunriseMonitor enablementGEOConfigKey];
  _GEOConfigAddDelegateListenerForKey();
}

- (BOOL)shouldShowPedestrianAR
{
  return self->_shouldShowPedestrianAR;
}

- (void)setShouldShowPedestrianAR:(BOOL)a3
{
  if (self->_shouldShowPedestrianAR != a3)
  {
    self->_shouldShowPedestrianAR = a3;
    id v4 = sub_1000AFBCC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      if (self->_shouldShowPedestrianAR) {
        id v5 = @"YES";
      }
      else {
        id v5 = @"NO";
      }
      id v6 = v5;
      int v8 = 134349314;
      int v9 = self;
      __int16 v10 = 2112;
      BOOL v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Updating global state: %@", (uint8_t *)&v8, 0x16u);
    }
    unsigned int v7 = [(PedestrianARSessionStateManager *)self observers];
    [v7 stateManager:self didChangeState:self->_shouldShowPedestrianAR];
  }
}

- (void)setDidFinishCreatingMonitors:(BOOL)a3
{
  self->_didFinishCreatingMonitors = a3;
}

- (void)dealloc
{
  v3 = sub_1000AFBCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocing", buf, 0xCu);
  }

  GEOConfigRemoveDelegateListenerForAllKeys();
  v4.receiver = self;
  v4.super_class = (Class)PedestrianARSessionStateManager;
  [(PedestrianARSessionStateManager *)&v4 dealloc];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = sub_1000AFBCC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 134349314;
      int v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}p] Removing observer: %@", (uint8_t *)&v7, 0x16u);
    }

    id v6 = [(PedestrianARSessionStateManager *)self observers];
    [v6 unregisterObserver:v4];
  }
}

- (void)removeDisabledMonitors
{
  v3 = sub_1000AFBCC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v29 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "[%{public}p] Removing newly disabled monitors", buf, 0xCu);
  }

  id v4 = +[NSMutableSet set];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = [(PedestrianARSessionStateManager *)self monitors];
  id v6 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (([(id)objc_opt_class() isEnabled] & 1) == 0) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v7);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * (void)j);
        __int16 v17 = sub_1000AFBCC();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349314;
          v29 = self;
          __int16 v30 = 2112;
          uint64_t v31 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%{public}p] Removing newly disabled monitor: %@", buf, 0x16u);
        }

        __int16 v18 = [(PedestrianARSessionStateManager *)self classMonitorMap];
        [v18 removeObjectForKey:objc_opt_class()];

        v19 = [(PedestrianARSessionStateManager *)self monitors];
        [v19 removeObject:v16];
      }
      id v13 = [v11 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v13);
  }
}

- (NSString)debugDescription
{
  v3 = [(PedestrianARSessionStateManager *)self allMonitors];
  id v4 = [v3 allObjects];
  id v5 = [v4 sortedArrayUsingComparator:&stru_1012E8C00];

  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  unsigned int v8 = [(PedestrianARSessionStateManager *)self shouldShowPedestrianAR];
  __int16 v9 = @"NO";
  if (v8) {
    __int16 v9 = @"YES";
  }
  uint64_t v10 = v9;
  id v11 = sub_100099700(v5, &stru_1012E8C40);
  id v12 = +[NSString stringWithFormat:@"<%@: %p\nshould show pedestrian AR: %@\nstate monitors: %@>", v7, self, v10, v11];

  return (NSString *)v12;
}

- (id)allMonitors
{
  v2 = [(PedestrianARSessionStateManager *)self monitors];
  id v3 = [v2 copy];

  return v3;
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  id v4 = sub_1000AFBCC();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] One of the monitors' enablement geo config key changed; updating monitors and global state",
      (uint8_t *)&v5,
      0xCu);
  }

  [(PedestrianARSessionStateManager *)self setDidFinishCreatingMonitors:0];
  [(PedestrianARSessionStateManager *)self removeDisabledMonitors];
  [(PedestrianARSessionStateManager *)self createEnabledMonitors];
  [(PedestrianARSessionStateManager *)self calculateState];
}

- (void)setMonitors:(id)a3
{
}

- (void)setPlatformController:(id)a3
{
}

- (void)setObservers:(id)a3
{
}

- (void)setClassMonitorMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classMonitorMap, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_platformController);

  objc_storeStrong((id *)&self->_monitors, 0);
}

@end