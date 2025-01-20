@interface MapsExternalDeviceLightMonitor
- (BOOL)isCarPlayConnected;
- (MapsExternalDeviceLightMonitor)init;
- (MapsExternalDeviceLightMonitor)initWithWindowScene:(id)a3;
- (NSMutableDictionary)scenesByType;
- (UIWindowScene)windowScene;
- (id)_sceneWithHighestPriority;
- (int64_t)lightLevel;
- (void)_carPlayWindowMapTraitDidChange:(id)a3;
- (void)_processWindowScene:(id)a3 willConnect:(BOOL)a4;
- (void)_reloadConnectedScenes;
- (void)_sceneDidDisconnect:(id)a3;
- (void)_sceneWillConnnect:(id)a3;
- (void)_setMonitoring:(BOOL)a3;
- (void)_updateForCurrentMonitoringState;
- (void)_updateLightLevel;
- (void)setLightLevel:(int64_t)a3;
- (void)setScenesByType:(id)a3;
- (void)setWindowScene:(id)a3;
@end

@implementation MapsExternalDeviceLightMonitor

- (MapsExternalDeviceLightMonitor)initWithWindowScene:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapsExternalDeviceLightMonitor;
  v5 = [(MapsBaseLightMonitor *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)(v5 + 25), v4);
    uint64_t v7 = +[NSMutableDictionary dictionary];
    v8 = *(void **)(v6 + 33);
    *(void *)(v6 + 33) = v7;
  }
  return (MapsExternalDeviceLightMonitor *)v6;
}

- (void)_updateLightLevel
{
  v3 = [(MapsExternalDeviceLightMonitor *)self _sceneWithHighestPriority];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 _maps_interfaceStyle];
    id v6 = v5;
    if (v5 == (id)2) {
      uint64_t v7 = 2;
    }
    else {
      uint64_t v7 = v5 == (id)1;
    }
    v8 = sub_10008FEAC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = off_1012E6C80[v7];
      unint64_t v10 = [(MapsExternalDeviceLightMonitor *)self lightLevel];
      if (v10 >= 3)
      {
        v11 = +[NSString stringWithFormat:@"<Unknown: %ld>", v10];
      }
      else
      {
        v11 = off_1012E6C80[v10];
      }
      unint64_t v12 = (unint64_t)[v4 carSceneType];
      if (v12 > 7) {
        CFStringRef v13 = @".Unknown";
      }
      else {
        CFStringRef v13 = off_1012E6C98[v12];
      }
      *(_DWORD *)buf = 138413314;
      v15 = self;
      __int16 v16 = 2048;
      id v17 = v6;
      __int16 v18 = 2112;
      v19 = v9;
      __int16 v20 = 2112;
      v21 = v11;
      __int16 v22 = 2112;
      CFStringRef v23 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: _updateLightLevel. mapStyle is: %ld, using lightLevel: %@ (was: %@), dictated by scene of type: %@", buf, 0x34u);
    }
  }
  else
  {
    v8 = sub_10008FEAC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@: _updateLightLevel. There is no connected CarPlay scene. Setting lightLevel to unsupported", buf, 0xCu);
    }
    uint64_t v7 = 0;
  }

  [(MapsExternalDeviceLightMonitor *)self setLightLevel:v7];
}

- (id)_sceneWithHighestPriority
{
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v3 = [(MapsExternalDeviceLightMonitor *)self scenesByType];
  id v4 = [v3 objectEnumerator];

  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    id v8 = 0;
    uint64_t v9 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(id *)(*((void *)&v20 + 1) + 8 * i);
        id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lightLevel + 1));

        if (v11 == WeakRetained)
        {
          id v16 = v11;

          id v8 = [v16 _maps_lightLevelPriority];
          uint64_t v7 = v16;
          goto LABEL_14;
        }
        id v13 = [v11 _maps_lightLevelPriority];
        if ((uint64_t)v13 > (uint64_t)v8)
        {
          id v14 = v13;
          id v15 = v11;

          uint64_t v7 = v15;
          id v8 = v14;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v32 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v7 = 0;
    id v8 = 0;
  }
LABEL_14:

  id v17 = sub_10008FEAC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = objc_loadWeakRetained((id *)((char *)&self->_lightLevel + 1));
    *(_DWORD *)buf = 138413058;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v7;
    __int16 v28 = 2048;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@: _sceneWithHighestPriority, scene: %@ priority: %ld windowScene: %@", buf, 0x2Au);
  }

  return v7;
}

- (void)_sceneWillConnnect:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  unsigned int v7 = [(__CFString *)v6 isCarScene];
  id v8 = sub_10008FEAC();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      unint64_t v10 = (unint64_t)[(__CFString *)v6 carSceneType];
      if (v10 > 7) {
        CFStringRef v11 = @".Unknown";
      }
      else {
        CFStringRef v11 = off_1012E6C98[v10];
      }
      unint64_t v12 = (unint64_t)[(__CFString *)v6 _maps_interfaceStyle];
      if (v12 >= 3)
      {
        id v13 = +[NSString stringWithFormat:@"<Unknown %ld>", v12];
      }
      else
      {
        id v13 = off_1012E6C68[v12];
      }
      *(_DWORD *)buf = 138412802;
      id v15 = self;
      __int16 v16 = 2112;
      CFStringRef v17 = v11;
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: _sceneWillConnnect: sceneType: %@ interfaceStyle: %@", buf, 0x20u);
    }
    [(MapsExternalDeviceLightMonitor *)self _processWindowScene:v6 willConnect:1];
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      id v15 = self;
      __int16 v16 = 2112;
      CFStringRef v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: _sceneWillConnnect: received non-CarPlay scene: %@", buf, 0x16u);
    }
  }
}

- (void)_updateForCurrentMonitoringState
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  if ([(MapsBaseLightMonitor *)self _isMonitoring])
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lightLevel + 1));
    [v4 addObserver:self selector:"_sceneWillConnnect:" name:UISceneWillConnectNotification object:WeakRetained];

    id v6 = +[NSNotificationCenter defaultCenter];
    id v7 = objc_loadWeakRetained((id *)((char *)&self->_lightLevel + 1));
    [v6 addObserver:self selector:"_sceneDidDisconnect:" name:UISceneDidDisconnectNotification object:v7];

    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:self selector:"_carPlayWindowMapTraitDidChange:" name:CRSUIWindowMapStyleChangedNotification object:0];

    [(MapsExternalDeviceLightMonitor *)self _reloadConnectedScenes];
    [(MapsExternalDeviceLightMonitor *)self _updateLightLevel];
  }
  else
  {
    [*(id *)((char *)&self->_windowScene + 1) removeAllObjects];
    [(MapsExternalDeviceLightMonitor *)self setLightLevel:0];
  }
}

- (void)_reloadConnectedScenes
{
  v3 = [(MapsExternalDeviceLightMonitor *)self scenesByType];
  [v3 removeAllObjects];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = +[UIApplication sharedApplication];
  id v5 = [v4 connectedScenes];

  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          CFStringRef v11 = v10;
        }
        else {
          CFStringRef v11 = 0;
        }
        id v12 = v11;

        if (v12 && [v12 isCarScene])
        {
          id v13 = [v12 carSceneType];
          if (v13)
          {
            id v14 = v13;
            id v15 = [(MapsExternalDeviceLightMonitor *)self scenesByType];
            __int16 v16 = +[NSNumber numberWithInteger:v14];
            [v15 setObject:v12 forKeyedSubscript:v16];
          }
          else
          {
            id v15 = sub_10008FEAC();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v24 = self;
              __int16 v25 = 2112;
              id v26 = v12;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@: received a scene with type unspecified. scene: %@", buf, 0x16u);
            }
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v7);
  }

  CFStringRef v17 = sub_10008FEAC();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    __int16 v18 = [(MapsExternalDeviceLightMonitor *)self scenesByType];
    *(_DWORD *)buf = 138412546;
    v24 = self;
    __int16 v25 = 2112;
    id v26 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@: finished reloading connected scenes: %@", buf, 0x16u);
  }
}

- (BOOL)isCarPlayConnected
{
  v2 = [(MapsExternalDeviceLightMonitor *)self scenesByType];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (NSMutableDictionary)scenesByType
{
  return *(NSMutableDictionary **)((char *)&self->_windowScene + 1);
}

- (void)setLightLevel:(int64_t)a3
{
  if (*(void *)(&self->super._monitoring + 1) != a3)
  {
    id v5 = sub_10008FEAC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t v6 = *(void *)(&self->super._monitoring + 1);
      if (v6 >= 3)
      {
        id v7 = +[NSString stringWithFormat:@"<Unknown: %ld>", *(void *)(&self->super._monitoring + 1)];
      }
      else
      {
        id v7 = off_1012E6C80[v6];
      }
      uint64_t v8 = v7;
      if ((unint64_t)a3 >= 3)
      {
        BOOL v9 = +[NSString stringWithFormat:@"<Unknown: %ld>", a3];
      }
      else
      {
        BOOL v9 = off_1012E6C80[a3];
      }
      *(_DWORD *)buf = 138412802;
      CFStringRef v11 = self;
      __int16 v12 = 2112;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@: Changing light level from %@ to %@", buf, 0x20u);
    }
    *(void *)(&self->super._monitoring + 1) = a3;
    [(MapsBaseLightMonitor *)self _notifyDidChange];
  }
}

- (void)_setMonitoring:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(MapsBaseLightMonitor *)self _isMonitoring];
  v6.receiver = self;
  v6.super_class = (Class)MapsExternalDeviceLightMonitor;
  [(MapsBaseLightMonitor *)&v6 _setMonitoring:v3];
  if (v5 != v3) {
    [(MapsExternalDeviceLightMonitor *)self _updateForCurrentMonitoringState];
  }
}

- (MapsExternalDeviceLightMonitor)init
{
  return [(MapsExternalDeviceLightMonitor *)self initWithWindowScene:0];
}

- (void)setWindowScene:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lightLevel + 1));

  unsigned int v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)((char *)&self->_lightLevel + 1), obj);
    [(MapsExternalDeviceLightMonitor *)self _updateForCurrentMonitoringState];
    unsigned int v5 = obj;
  }
}

- (int64_t)lightLevel
{
  BOOL v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 objectForKey:@"MapsDebugCarPlayLightLevelKey"];

  if (objc_opt_respondsToSelector())
  {
    unint64_t v5 = (unint64_t)[v4 integerValue];
    objc_super v6 = sub_10008FEAC();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (v5 >= 3)
      {
        id v7 = +[NSString stringWithFormat:@"<Unknown: %ld>", v5];
      }
      else
      {
        id v7 = off_1012E6C80[v5];
      }
      *(_DWORD *)buf = 138412546;
      id v10 = self;
      __int16 v11 = 2112;
      __int16 v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@: Using override CarPlay light level: %@", buf, 0x16u);
    }
  }
  else
  {
    unint64_t v5 = *(void *)(&self->super._monitoring + 1);
  }

  return v5;
}

- (void)_carPlayWindowMapTraitDidChange:(id)a3
{
  id v4 = (__CFString *)a3;
  unint64_t v5 = [(__CFString *)v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v6 = v5;
  }
  else {
    objc_super v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = sub_10008FEAC();
  BOOL v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v10 = [v7 windowScene];
      unint64_t v11 = (unint64_t)[v10 carSceneType];
      if (v11 > 7) {
        CFStringRef v12 = @".Unknown";
      }
      else {
        CFStringRef v12 = off_1012E6C98[v11];
      }
      int v21 = 138412546;
      long long v22 = self;
      __int16 v23 = 2112;
      CFStringRef v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: _carPlayWindowMapTraitDidChange: carSceneType: %@", (uint8_t *)&v21, 0x16u);
    }
    BOOL v9 = [(MapsExternalDeviceLightMonitor *)self _sceneWithHighestPriority];
    id v13 = [v7 windowScene];
    unsigned __int8 v14 = [v9 isEqual:v13];

    if (v14)
    {
      [(MapsExternalDeviceLightMonitor *)self _updateLightLevel];
    }
    else
    {
      id v15 = sub_10008FEAC();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = [v7 windowScene];
        unint64_t v17 = (unint64_t)[v16 carSceneType];
        if (v17 > 7) {
          CFStringRef v18 = @".Unknown";
        }
        else {
          CFStringRef v18 = off_1012E6C98[v17];
        }
        unint64_t v19 = (unint64_t)[v9 carSceneType];
        if (v19 > 7) {
          CFStringRef v20 = @".Unknown";
        }
        else {
          CFStringRef v20 = off_1012E6C98[v19];
        }
        int v21 = 138413058;
        long long v22 = self;
        __int16 v23 = 2112;
        CFStringRef v24 = v4;
        __int16 v25 = 2112;
        CFStringRef v26 = v18;
        __int16 v27 = 2112;
        CFStringRef v28 = v20;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@: got notified by a scene with lower priority.: %@. SceneType from notification: %@, current highest priority sceneType: %@", (uint8_t *)&v21, 0x2Au);
      }
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
  {
    int v21 = 138412546;
    long long v22 = self;
    __int16 v23 = 2112;
    CFStringRef v24 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%@: was notified from an unsupported window scene.: %@", (uint8_t *)&v21, 0x16u);
  }
}

- (void)_sceneDidDisconnect:(id)a3
{
  id v4 = [a3 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v5 = v4;
  }
  else {
    unint64_t v5 = 0;
  }
  objc_super v6 = v5;

  unsigned int v7 = [(__CFString *)v6 isCarScene];
  uint64_t v8 = sub_10008FEAC();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v9)
    {
      unint64_t v10 = (unint64_t)[(__CFString *)v6 carSceneType];
      if (v10 > 7) {
        CFStringRef v11 = @".Unknown";
      }
      else {
        CFStringRef v11 = off_1012E6C98[v10];
      }
      unint64_t v12 = (unint64_t)[(__CFString *)v6 _maps_interfaceStyle];
      if (v12 >= 3)
      {
        id v13 = +[NSString stringWithFormat:@"<Unknown %ld>", v12];
      }
      else
      {
        id v13 = off_1012E6C68[v12];
      }
      *(_DWORD *)buf = 138412802;
      id v15 = self;
      __int16 v16 = 2112;
      CFStringRef v17 = v11;
      __int16 v18 = 2112;
      unint64_t v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: _sceneDidDisconnect: sceneType: %@ interfaceStyle: %@", buf, 0x20u);
    }
    [(MapsExternalDeviceLightMonitor *)self _processWindowScene:v6 willConnect:0];
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138412546;
      id v15 = self;
      __int16 v16 = 2112;
      CFStringRef v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%@: _sceneDidDisconnect: received non-CarPlay scene: %@", buf, 0x16u);
    }
  }
}

- (void)_processWindowScene:(id)a3 willConnect:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 carSceneType];
  if (v7)
  {
    id v8 = v7;
    if (v4) {
      id v9 = v6;
    }
    else {
      id v9 = 0;
    }
    unint64_t v10 = [(MapsExternalDeviceLightMonitor *)self scenesByType];
    CFStringRef v11 = +[NSNumber numberWithInteger:v8];
    [v10 setObject:v9 forKeyedSubscript:v11];

    [(MapsExternalDeviceLightMonitor *)self _updateLightLevel];
  }
  else
  {
    unint64_t v12 = sub_10008FEAC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412802;
      unsigned __int8 v14 = self;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 1024;
      BOOL v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@: received invalid scene type for windowScene: %@ willConnect: %d", (uint8_t *)&v13, 0x1Cu);
    }
  }
}

- (UIWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->_lightLevel + 1));

  return (UIWindowScene *)WeakRetained;
}

- (void)setScenesByType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_windowScene + 1), 0);

  objc_destroyWeak((id *)((char *)&self->_lightLevel + 1));
}

@end