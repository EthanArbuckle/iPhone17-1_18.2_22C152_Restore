@interface CarDisplayConfigAuxiliaryTask
+ (int64_t)creationPreference;
+ (unint64_t)_countScenesForInstrumentCluster:(BOOL)a3;
+ (unint64_t)centerConsoleSceneCount;
+ (unint64_t)instrumentClusterSceneCount;
- (CarDisplayConfigAuxiliaryTask)init;
- (void)_processChromeVCNotification:(id)a3;
- (void)_processSceneChange:(id)a3;
- (void)_updateCarDisplayConfig;
- (void)chromeDeactivationReasonsDidChangeNotification:(id)a3;
- (void)chromeViewControllerDidLoadMapViewNotification:(id)a3;
- (void)dealloc;
- (void)sceneDidActivateNotification:(id)a3;
- (void)sceneDidDisconnectNotification:(id)a3;
- (void)sceneDidEnterBackgroundNotification:(id)a3;
@end

@implementation CarDisplayConfigAuxiliaryTask

- (void)_processSceneChange:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = sub_1005762E4();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315906;
      v9 = "-[CarDisplayConfigAuxiliaryTask _processSceneChange:]";
      __int16 v10 = 2080;
      v11 = "CarDisplayConfigAuxiliaryTask.m";
      __int16 v12 = 1024;
      int v13 = 162;
      __int16 v14 = 2080;
      v15 = "scene != nil";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v8, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = +[NSThread callStackSymbols];
        int v8 = 138412290;
        v9 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  if ([v4 isCarScene]) {
    [(CarDisplayConfigAuxiliaryTask *)self _updateCarDisplayConfig];
  }
}

- (CarDisplayConfigAuxiliaryTask)init
{
  v10.receiver = self;
  v10.super_class = (Class)CarDisplayConfigAuxiliaryTask;
  v2 = [(CarDisplayConfigAuxiliaryTask *)&v10 init];
  if (v2)
  {
    v3 = sub_100059A70();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      __int16 v12 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:v2 selector:"sceneDidActivateNotification:" name:UISceneDidActivateNotification object:0];

    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v2 selector:"sceneDidEnterBackgroundNotification:" name:UISceneDidEnterBackgroundNotification object:0];

    v6 = +[NSNotificationCenter defaultCenter];
    [v6 addObserver:v2 selector:"sceneDidDisconnectNotification:" name:UISceneDidDisconnectNotification object:0];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"chromeViewControllerDidLoadMapViewNotification:" name:@"ChromeViewControllerDidLoadMapViewNotification" object:0];

    int v8 = +[NSNotificationCenter defaultCenter];
    [v8 addObserver:v2 selector:"chromeDeactivationReasonsDidChangeNotification:" name:@"ChromeViewControllerDidChangeDeactivationReasonsNotification" object:0];

    [(CarDisplayConfigAuxiliaryTask *)v2 _updateCarDisplayConfig];
  }
  return v2;
}

- (void)_updateCarDisplayConfig
{
  v3 = sub_100059A70();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v51 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Updating car display config", buf, 0xCu);
  }

  id v4 = +[UIApplication _maps_carPlayScenes];
  v39 = +[NSMutableArray array];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = v4;
  id v5 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v46;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        if ((unint64_t)[v9 activationState] < 2)
        {
          objc_super v10 = [v9 delegate];
          v11 = [v10 carChromeViewController];
          uint64_t v12 = [v11 mapView];
          if (v12
            && (int v13 = (void *)v12,
                unsigned __int8 v14 = [v11 isInactive],
                v13,
                (v14 & 1) == 0))
          {
            v20 = sub_100059A70();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134349314;
              v51 = self;
              __int16 v52 = 2112;
              v53 = v9;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%{public}p] Processing scene: %@", buf, 0x16u);
            }

            v16 = [v11 mapView];
            v21 = [v16 _mapLayer];
            [v39 addObject:v21];
          }
          else
          {
            v15 = [v11 mapView];

            v16 = sub_100059A70();
            BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
            if (v15)
            {
              if (v17)
              {
                *(_DWORD *)buf = 134349314;
                v51 = self;
                __int16 v52 = 2112;
                v53 = v9;
                v18 = v16;
                v19 = "[%{public}p] Skipping inactive scene: %@";
                goto LABEL_21;
              }
            }
            else if (v17)
            {
              *(_DWORD *)buf = 134349314;
              v51 = self;
              __int16 v52 = 2112;
              v53 = v9;
              v18 = v16;
              v19 = "[%{public}p] Skipping scene with no map view: %@";
LABEL_21:
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v19, buf, 0x16u);
            }
          }

          goto LABEL_23;
        }
        objc_super v10 = sub_100059A70();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349314;
          v51 = self;
          __int16 v52 = 2112;
          v53 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Skipping inactive scene: %@", buf, 0x16u);
        }
LABEL_23:
      }
      id v6 = [obj countByEnumeratingWithState:&v45 objects:v60 count:16];
    }
    while (v6);
  }

  id v22 = [v39 count];
  id v23 = v22;
  unint64_t v24 = (unint64_t)v22;
  if (v22)
  {
    if (v22 == (id)1 || (GEOConfigGetBOOL() & 1) == 0) {
      unint64_t v24 = 1;
    }
    else {
      unint64_t v24 = 2;
    }
  }
  v25 = +[NSUserDefaults standardUserDefaults];
  unsigned int v26 = [v25 BOOLForKey:@"CarDisplayConfigForceDualDisplayKey"];

  if (v26)
  {
    v27 = sub_100059A70();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v51 = self;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "[%{public}p] Forcing dual display config from user default", buf, 0xCu);
    }

    unint64_t v24 = 2;
  }
  v28 = sub_100059A70();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    int BOOL = GEOConfigGetBOOL();
    v30 = @"NO";
    if (BOOL) {
      v30 = @"YES";
    }
    if (v24 > 2) {
      CFStringRef v31 = @"unknown";
    }
    else {
      CFStringRef v31 = off_1012E79A0[v24];
    }
    *(_DWORD *)buf = 134350082;
    v51 = self;
    __int16 v52 = 2048;
    v53 = v23;
    __int16 v54 = 2112;
    v55 = v39;
    __int16 v56 = 2112;
    v57 = v30;
    __int16 v58 = 2112;
    CFStringRef v59 = v31;
    v32 = v30;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[%{public}p] Detected %lu map views: %@; InstrumentClusterConnectionCameraStyleToggleEnabled: %@; updating VKCarDi"
      "splayConfigs to %@",
      buf,
      0x34u);
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v33 = v39;
  id v34 = [v33 countByEnumeratingWithState:&v41 objects:v49 count:16];
  if (v34)
  {
    id v35 = v34;
    uint64_t v36 = *(void *)v42;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(void *)v42 != v36) {
          objc_enumerationMutation(v33);
        }
        [*(id *)(*((void *)&v41 + 1) + 8 * (void)j) setCarDisplayConfig:v24 animated:1];
      }
      id v35 = [v33 countByEnumeratingWithState:&v41 objects:v49 count:16];
    }
    while (v35);
  }

  v38 = +[NSNotificationCenter defaultCenter];
  [v38 postNotificationName:@"CarDisplayConfigDidChangeNotification" object:0];
}

- (void)sceneDidActivateNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_super v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315906;
      unsigned __int8 v14 = "-[CarDisplayConfigAuxiliaryTask sceneDidActivateNotification:]";
      __int16 v15 = 2080;
      v16 = "CarDisplayConfigAuxiliaryTask.m";
      __int16 v17 = 1024;
      int v18 = 95;
      __int16 v19 = 2080;
      v20 = "[notification.object isKindOfClass:UIScene.class]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v13, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = +[NSThread callStackSymbols];
        int v13 = 138412290;
        unsigned __int8 v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  uint64_t v7 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;

  [(CarDisplayConfigAuxiliaryTask *)self _processSceneChange:v9];
}

+ (int64_t)creationPreference
{
  return 1;
}

- (void)dealloc
{
  v3 = sub_100059A70();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    id v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)CarDisplayConfigAuxiliaryTask;
  [(CarDisplayConfigAuxiliaryTask *)&v4 dealloc];
}

+ (unint64_t)instrumentClusterSceneCount
{
  return (unint64_t)_[a1 _countScenesForInstrumentCluster:1];
}

+ (unint64_t)centerConsoleSceneCount
{
  return (unint64_t)_[a1 _countScenesForInstrumentCluster:0];
}

- (void)sceneDidEnterBackgroundNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_super v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315906;
      unsigned __int8 v14 = "-[CarDisplayConfigAuxiliaryTask sceneDidEnterBackgroundNotification:]";
      __int16 v15 = 2080;
      v16 = "CarDisplayConfigAuxiliaryTask.m";
      __int16 v17 = 1024;
      int v18 = 101;
      __int16 v19 = 2080;
      v20 = "[notification.object isKindOfClass:UIScene.class]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v13, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = +[NSThread callStackSymbols];
        int v13 = 138412290;
        unsigned __int8 v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  uint64_t v7 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;

  [(CarDisplayConfigAuxiliaryTask *)self _processSceneChange:v9];
}

- (void)sceneDidDisconnectNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_super v10 = sub_1005762E4();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315906;
      unsigned __int8 v14 = "-[CarDisplayConfigAuxiliaryTask sceneDidDisconnectNotification:]";
      __int16 v15 = 2080;
      v16 = "CarDisplayConfigAuxiliaryTask.m";
      __int16 v17 = 1024;
      int v18 = 107;
      __int16 v19 = 2080;
      v20 = "[notification.object isKindOfClass:UIScene.class]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v13, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v11 = sub_1005762E4();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = +[NSThread callStackSymbols];
        int v13 = 138412290;
        unsigned __int8 v14 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  uint64_t v7 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;

  [(CarDisplayConfigAuxiliaryTask *)self _processSceneChange:v9];
}

- (void)chromeViewControllerDidLoadMapViewNotification:(id)a3
{
}

- (void)chromeDeactivationReasonsDidChangeNotification:(id)a3
{
}

- (void)_processChromeVCNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    int v13 = sub_1005762E4();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315906;
      v20 = "-[CarDisplayConfigAuxiliaryTask _processChromeVCNotification:]";
      __int16 v21 = 2080;
      id v22 = "CarDisplayConfigAuxiliaryTask.m";
      __int16 v23 = 1024;
      int v24 = 123;
      __int16 v25 = 2080;
      unsigned int v26 = "[notification.object isKindOfClass:ChromeViewController.class]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v19, 0x26u);
    }

    if (sub_100BB36BC())
    {
      unsigned __int8 v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v15 = +[NSThread callStackSymbols];
        int v19 = 138412290;
        v20 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  uint64_t v7 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    int v8 = v7;
  }
  else {
    int v8 = 0;
  }
  id v9 = v8;

  if (([v9 isViewLoaded] & 1) == 0)
  {
    v16 = sub_1005762E4();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136315906;
      v20 = "-[CarDisplayConfigAuxiliaryTask _processChromeVCNotification:]";
      __int16 v21 = 2080;
      id v22 = "CarDisplayConfigAuxiliaryTask.m";
      __int16 v23 = 1024;
      int v24 = 125;
      __int16 v25 = 2080;
      unsigned int v26 = "chromeVC.isViewLoaded";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v19, 0x26u);
    }

    if (sub_100BB36BC())
    {
      __int16 v17 = sub_1005762E4();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        int v18 = +[NSThread callStackSymbols];
        int v19 = 138412290;
        v20 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v19, 0xCu);
      }
    }
  }
  objc_super v10 = [v9 viewIfLoaded];
  v11 = [v10 window];
  uint64_t v12 = [v11 windowScene];

  if (v12) {
    [(CarDisplayConfigAuxiliaryTask *)self _processSceneChange:v12];
  }
}

+ (unint64_t)_countScenesForInstrumentCluster:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[UIApplication _maps_carPlayScenes];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v4);
        }
        objc_super v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ((unint64_t)[v10 activationState] <= 1)
        {
          v11 = [v10 _FBSScene];
          uint64_t v12 = [v11 settings];
          objc_opt_class();
          int isKindOfClass = objc_opt_isKindOfClass();

          if (((isKindOfClass ^ v3) & 1) == 0)
          {
            unsigned __int8 v14 = [v10 delegate];
            __int16 v15 = [v14 carChromeViewController];
            uint64_t v16 = [v15 mapView];
            if (v16)
            {
              __int16 v17 = (void *)v16;
              unsigned int v18 = [v15 isInactive];

              v7 += v18 ^ 1;
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

@end