@interface CarInstrumentClusterWindow
- (CRSUIInstrumentClusterSceneSettings)currentSceneSettings;
- (CarInstrumentClusterChromeConfiguration)chromeConfiguration;
- (CarInstrumentClusterConfigurationDelegate)configurationDelegate;
- (CarInstrumentClusterWindow)initWithWindowScene:(id)a3;
- (CarInstrumentClusterWindowZoomDelegate)zoomDelegate;
- (void)_updateChromeConfiguration;
- (void)_windowWantsToZoomInDirection:(int64_t)a3;
- (void)clusterWindow:(id)a3 didChangeCompassSetting:(unint64_t)a4;
- (void)clusterWindow:(id)a3 didChangeETASetting:(unint64_t)a4;
- (void)clusterWindow:(id)a3 didChangeSpeedLimitSetting:(unint64_t)a4;
- (void)clusterWindow:(id)a3 didZoomInDirection:(int64_t)a4;
- (void)notificationLayoutGuideDidChange;
- (void)setChromeConfiguration:(id)a3;
- (void)setConfigurationDelegate:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setRootViewController:(id)a3;
- (void)setZoomDelegate:(id)a3;
@end

@implementation CarInstrumentClusterWindow

- (CarInstrumentClusterWindow)initWithWindowScene:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarInstrumentClusterWindow;
  v3 = [(CarInstrumentClusterWindow *)&v6 initWithWindowScene:a3];
  v4 = v3;
  if (v3)
  {
    [(CarInstrumentClusterWindow *)v3 addClusterSettingsObserver:v3];
    [(CarInstrumentClusterWindow *)v4 _updateChromeConfiguration];
  }
  return v4;
}

- (void)setRootViewController:(id)a3
{
  id v4 = a3;
  v5 = [(CarInstrumentClusterWindow *)self rootViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      goto LABEL_5;
    }
    v5 = [(CarInstrumentClusterWindow *)self rootViewController];
    [v5 setNotificationLayoutGuide:0];
  }

LABEL_5:
  v13.receiver = self;
  v13.super_class = (Class)CarInstrumentClusterWindow;
  [(CarInstrumentClusterWindow *)&v13 setRootViewController:v4];
  id v7 = v4;
  if ([v7 conformsToProtocol:&OBJC_PROTOCOL___CarInstrumentClusterConfigurationDelegate]) {
    v8 = v7;
  }
  else {
    v8 = 0;
  }
  id v9 = v8;

  [(CarInstrumentClusterWindow *)self setConfigurationDelegate:v9];
  id v10 = v7;
  if ([v10 conformsToProtocol:&OBJC_PROTOCOL___CarInstrumentClusterWindowZoomDelegate]) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }
  id v12 = v11;

  [(CarInstrumentClusterWindow *)self setZoomDelegate:v12];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CarInstrumentClusterWindow;
  -[CarInstrumentClusterWindow setHidden:](&v6, "setHidden:");
  v5 = sub_100577C6C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349312;
    v8 = self;
    __int16 v9 = 2048;
    BOOL v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] setHidden:%ld", buf, 0x16u);
  }
}

- (void)notificationLayoutGuideDidChange
{
  BOOL v3 = sub_100577C6C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v8 = 134349056;
    __int16 v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%{public}p] notificationLayoutGuideDidChange", (uint8_t *)&v8, 0xCu);
  }

  id v4 = [(CarInstrumentClusterWindow *)self rootViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    objc_super v6 = [(CarInstrumentClusterWindow *)self notificationLayoutGuide];
    id v7 = [(CarInstrumentClusterWindow *)self rootViewController];
    [v7 setNotificationLayoutGuide:v6];
  }
}

- (void)setConfigurationDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configurationDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_configurationDelegate, v4);
    objc_super v6 = sub_100577C6C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = objc_opt_class();
      int v8 = [(CarInstrumentClusterWindow *)self chromeConfiguration];
      int v11 = 134350082;
      id v12 = self;
      __int16 v13 = 2048;
      v14 = self;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      __int16 v17 = 2048;
      id v18 = v4;
      __int16 v19 = 2112;
      v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] configurationDelegate of window: %p changed to: <%@:%p>. current configuration: %@", (uint8_t *)&v11, 0x34u);
    }
    id v9 = objc_loadWeakRetained((id *)&self->_configurationDelegate);
    BOOL v10 = [(CarInstrumentClusterWindow *)self chromeConfiguration];
    [v9 sceneConfigurationDidChange:v10];
  }
}

- (void)setChromeConfiguration:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_chromeConfiguration] & 1) == 0)
  {
    objc_super v6 = sub_100577C6C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v9 = 134349570;
      BOOL v10 = self;
      __int16 v11 = 2048;
      id v12 = self;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}p] Will update chrome configuration on window: %p with configuration: %@", (uint8_t *)&v9, 0x20u);
    }

    objc_storeStrong((id *)&self->_chromeConfiguration, a3);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_configurationDelegate);
    int v8 = [(CarInstrumentClusterWindow *)self chromeConfiguration];
    [WeakRetained sceneConfigurationDidChange:v8];
  }
}

- (CRSUIInstrumentClusterSceneSettings)currentSceneSettings
{
  BOOL v3 = [(CarInstrumentClusterWindow *)self windowScene];
  id v4 = [v3 _FBSScene];
  id v5 = [v4 settings];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0;
      }
      id v8 = v7;

      goto LABEL_11;
    }
    int v9 = sub_100577C6C();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      BOOL v10 = (objc_class *)objc_opt_class();
      __int16 v11 = NSStringFromClass(v10);
      id v12 = (objc_class *)objc_opt_class();
      __int16 v13 = NSStringFromClass(v12);
      int v15 = 134349826;
      uint64_t v16 = self;
      __int16 v17 = 2112;
      id v18 = self;
      __int16 v19 = 2048;
      v20 = v11;
      __int16 v21 = 2112;
      v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "[%{public}p] Scene settings for window: <%@:%p> were of invalid class: %@", (uint8_t *)&v15, 0x2Au);
    }
  }
  id v8 = 0;
LABEL_11:

  return (CRSUIInstrumentClusterSceneSettings *)v8;
}

- (void)_updateChromeConfiguration
{
  BOOL v3 = [CarInstrumentClusterChromeConfiguration alloc];
  id v5 = [(CarInstrumentClusterWindow *)self currentSceneSettings];
  id v4 = [(CarInstrumentClusterChromeConfiguration *)v3 initWithInstrumentClusterSceneSettings:v5];
  [(CarInstrumentClusterWindow *)self setChromeConfiguration:v4];
}

- (void)_windowWantsToZoomInDirection:(int64_t)a3
{
  id v4 = [(CarInstrumentClusterWindow *)self zoomDelegate];
  [v4 windowWantsToZoomInDirection:a3];
}

- (void)clusterWindow:(id)a3 didChangeCompassSetting:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = sub_100577C6C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134349568;
    int v9 = self;
    __int16 v10 = 2048;
    id v11 = v6;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] clusterWindow:didChangeCompassSetting: %p, %lu", (uint8_t *)&v8, 0x20u);
  }

  [(CarInstrumentClusterWindow *)self _updateChromeConfiguration];
}

- (void)clusterWindow:(id)a3 didChangeETASetting:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = sub_100577C6C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134349568;
    int v9 = self;
    __int16 v10 = 2048;
    id v11 = v6;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] clusterWindow:didChangeETASetting: %p, %lu", (uint8_t *)&v8, 0x20u);
  }

  [(CarInstrumentClusterWindow *)self _updateChromeConfiguration];
}

- (void)clusterWindow:(id)a3 didChangeSpeedLimitSetting:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = sub_100577C6C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134349568;
    int v9 = self;
    __int16 v10 = 2048;
    id v11 = v6;
    __int16 v12 = 2048;
    unint64_t v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] clusterWindow:didChangeSpeedLimitSetting: %p, %lu", (uint8_t *)&v8, 0x20u);
  }

  [(CarInstrumentClusterWindow *)self _updateChromeConfiguration];
}

- (void)clusterWindow:(id)a3 didZoomInDirection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = sub_100577C6C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 134349568;
    int v9 = self;
    __int16 v10 = 2048;
    id v11 = v6;
    __int16 v12 = 2048;
    int64_t v13 = a4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] clusterWindow:didZoomInDirection: %p, %ld", (uint8_t *)&v8, 0x20u);
  }

  [(CarInstrumentClusterWindow *)self _windowWantsToZoomInDirection:a4];
}

- (CarInstrumentClusterChromeConfiguration)chromeConfiguration
{
  return self->_chromeConfiguration;
}

- (CarInstrumentClusterConfigurationDelegate)configurationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_configurationDelegate);

  return (CarInstrumentClusterConfigurationDelegate *)WeakRetained;
}

- (CarInstrumentClusterWindowZoomDelegate)zoomDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zoomDelegate);

  return (CarInstrumentClusterWindowZoomDelegate *)WeakRetained;
}

- (void)setZoomDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_zoomDelegate);
  objc_destroyWeak((id *)&self->_configurationDelegate);

  objc_storeStrong((id *)&self->_chromeConfiguration, 0);
}

@end