@interface CarplayDisplayManager
- (id)_createAndSetupModel;
- (id)_rootViewControllerForCarScene;
- (void)_openURL:(id)a3;
- (void)_setUpSelectedCalendarsOnModel:(id)a3;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
@end

@implementation CarplayDisplayManager

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    int v27 = 138412546;
    id v28 = v8;
    __int16 v29 = 2112;
    id v30 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "scene:%@ willConnectToSession: %@", (uint8_t *)&v27, 0x16u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v8;
    v13 = [v12 screen];
    if (([v13 _isCarScreen] & 1) != 0 && !self->_carWindow)
    {
      v14 = [v12 coordinateSpace];
      [v14 bounds];
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;

      v23 = (UIWindow *)objc_alloc_init((Class)UIWindow);
      [(UIWindow *)v23 setAutoresizesSubviews:1];
      [(UIWindow *)v23 setAutoresizingMask:18];
      [(UIWindow *)v23 setWindowScene:v12];
      [(UIWindow *)v23 makeKeyAndVisible];
      -[UIWindow setFrame:](v23, "setFrame:", v16, v18, v20, v22);
      v24 = [(CarplayDisplayManager *)self _rootViewControllerForCarScene];
      [(UIWindow *)v23 setRootViewController:v24];

      carWindow = self->_carWindow;
      self->_carWindow = v23;
    }
  }
  else
  {
    v26 = kCalUILogCarplayHandle;
    if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v27) = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Scene connected, but it's not a window scene.", (uint8_t *)&v27, 2u);
    }
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "sceneDidDisconnect %@", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [(UIWindow *)self->_carWindow windowScene];

  if (v6 == v4)
  {
    [(UIWindow *)self->_carWindow setHidden:1];
    carWindow = self->_carWindow;
    self->_carWindow = 0;
  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  v5 = [a4 anyObject];
  id v6 = [v5 URL];

  v7 = kCalUILogCarplayHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogCarplayHandle, OS_LOG_TYPE_INFO))
  {
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "openURLContexts:%@", (uint8_t *)&v8, 0xCu);
  }
  [(CarplayDisplayManager *)self _openURL:v6];
}

- (void)_openURL:(id)a3
{
  carWindow = self->_carWindow;
  id v4 = a3;
  id v5 = [(UIWindow *)carWindow rootViewController];
  [v5 handleURL:v4];
}

- (id)_rootViewControllerForCarScene
{
  v2 = [(CarplayDisplayManager *)self _createAndSetupModel];
  v3 = [[CarplayNavigationController alloc] initWithModel:v2];

  return v3;
}

- (id)_createAndSetupModel
{
  v3 = +[Application createNewCalendarModel];
  [v3 checkLocationAuthorizationAndAllowEventLocationPrediction];
  [(CarplayDisplayManager *)self _setUpSelectedCalendarsOnModel:v3];
  id v4 = +[EKCalendarVisibilityManager unselectedCalendarIdentifiersForFocusMode];
  BOOL v5 = v4 != 0;

  [v3 setFocusFilterMode:v5];

  return v3;
}

- (void)_setUpSelectedCalendarsOnModel:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)EKCalendarVisibilityManager);
  BOOL v5 = [v3 eventStore];
  id v6 = [v3 sourceForSelectedIdentity];
  id v7 = [v4 initWithEventStore:v5 limitedToSource:v6 visibilityChangedCallback:0 queue:0];

  int v8 = [v7 visibleCalendarsForAllIdentities];
  if ([UIApp launchedToTest])
  {
    id v22 = v7;
    id v9 = [v8 mutableCopy];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v8;
    id v11 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v24;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v24 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          double v16 = [v15 title];
          unsigned int v17 = [v16 containsString:@"Legacy"];

          if (v17) {
            [v9 removeObject:v15];
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v12);
    }

    id v7 = v22;
  }
  else
  {
    id v9 = v8;
  }
  double v18 = (void *)kCalUILogHandle;
  if (os_log_type_enabled((os_log_t)kCalUILogHandle, OS_LOG_TYPE_DEBUG))
  {
    double v19 = v18;
    id v20 = [v9 count];
    *(_DWORD *)buf = 134217984;
    id v28 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Visible calendars: (%tu)", buf, 0xCu);
  }
  id v21 = [objc_alloc((Class)NSSet) initWithArray:v9];
  [v3 setSelectedCalendars:v21];
}

- (void).cxx_destruct
{
}

@end