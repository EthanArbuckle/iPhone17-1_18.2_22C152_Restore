@interface CarWidgetController
+ (Class)chromeViewControllerClass;
+ (Class)fallbackModeControllerClass;
- (CarChromeViewController)chromeViewController;
- (CarWidgetController)initWithCarSceneType:(int64_t)a3;
- (id)contextsForCurrentAppState;
- (int64_t)sceneType;
- (void)_mapsCar_rebuildContextsForCurrentAppState;
- (void)_mapsCar_scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)dealloc;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setChromeViewController:(id)a3;
@end

@implementation CarWidgetController

- (CarWidgetController)initWithCarSceneType:(int64_t)a3
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    BOOL v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v9 = sub_1005762E4();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v17 = "-[CarWidgetController initWithCarSceneType:]";
        __int16 v18 = 2080;
        v19 = "CarWidgetController.m";
        __int16 v20 = 1024;
        int v21 = 27;
        __int16 v22 = 2080;
        v23 = "dispatch_get_main_queue()";
        __int16 v24 = 2080;
        v25 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v26 = 2080;
        v27 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v10 = sub_1005762E4();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v17 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  if (((unint64_t)(a3 - 4) < 4 || a3 == 1) && (unint64_t)a3 <= 3)
  {
    v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v17 = "-[CarWidgetController initWithCarSceneType:]";
      __int16 v18 = 2080;
      v19 = "CarWidgetController.m";
      __int16 v20 = 1024;
      int v21 = 28;
      __int16 v22 = 2080;
      v23 = "CarSceneTypeIsDashboardWidget(sceneType) || CarSceneTypeIsInstrumentClusterWidget(sceneType)";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v17 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v15.receiver = self;
  v15.super_class = (Class)CarWidgetController;
  result = [(CarWidgetController *)&v15 init];
  if (result) {
    result->_sceneType = a3;
  }
  return result;
}

- (void)dealloc
{
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v4 = dispatch_queue_get_label(0);
  if (label != v4)
  {
    BOOL v5 = !label || v4 == 0;
    if (v5 || strcmp(label, v4))
    {
      v6 = sub_1005762E4();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v11 = "-[CarWidgetController dealloc]";
        __int16 v12 = 2080;
        v13 = "CarWidgetController.m";
        __int16 v14 = 1024;
        int v15 = 38;
        __int16 v16 = 2080;
        v17 = "dispatch_get_main_queue()";
        __int16 v18 = 2080;
        v19 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v20 = 2080;
        int v21 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        BOOL v7 = sub_1005762E4();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v8 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v11 = v8;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  v9.receiver = self;
  v9.super_class = (Class)CarWidgetController;
  [(CarWidgetController *)&v9 dealloc];
}

+ (Class)chromeViewControllerClass
{
  return 0;
}

+ (Class)fallbackModeControllerClass
{
  return 0;
}

- (void)_mapsCar_scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_1000A930C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    __int16 v12 = (objc_class *)objc_opt_class();
    v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 134349314;
    v25 = self;
    __int16 v26 = 2112;
    v27 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] willConnectToSession:options, widgetControllerClass: %@", buf, 0x16u);
  }
  __int16 v14 = +[CarSessionController sharedInstance];
  [v14 addObserver:self];

  id v15 = objc_msgSend(objc_msgSend(objc_msgSend((id)objc_opt_class(), "chromeViewControllerClass"), "alloc"), "initWithCarSceneType:", -[CarWidgetController sceneType](self, "sceneType"));
  [(CarWidgetController *)self setChromeViewController:v15];

  __int16 v16 = [(CarWidgetController *)self chromeViewController];
  [v16 setSuppressed:1];

  objc_initWeak((id *)buf, self);
  v17 = [(CarWidgetController *)self chromeViewController];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100BAA144;
  v22[3] = &unk_10131A5E8;
  objc_copyWeak(&v23, (id *)buf);
  [v17 setFallbackContextCoordinationBlock:v22];

  __int16 v18 = [(CarWidgetController *)self chromeViewController];
  v19 = [(CarWidgetController *)self contextsForCurrentAppState];
  [v18 setContexts:v19 animated:0 completion:0];

  __int16 v20 = +[CarChromeModeCoordinator sharedInstance];
  int v21 = [(CarWidgetController *)self chromeViewController];
  [v20 addChromeViewController:v21];

  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (void)_mapsCar_rebuildContextsForCurrentAppState
{
  v3 = [(CarWidgetController *)self chromeViewController];
  v4 = [(CarWidgetController *)self contextsForCurrentAppState];
  [v3 setContexts:v4 animated:0 completion:0];

  id v5 = [(CarWidgetController *)self chromeViewController];
  [v5 setNeedsUpdateComponent:@"accessories" animated:0];
}

- (void)sceneDidDisconnect:(id)a3
{
  v4 = sub_1000A930C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v9 = 134349314;
    id v10 = self;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] sceneDidDisconnect, widgetControllerClass: %@", (uint8_t *)&v9, 0x16u);
  }
  BOOL v7 = [(CarWidgetController *)self chromeViewController];
  [v7 setSuppressed:1];

  [(CarWidgetController *)self setChromeViewController:0];
  id v8 = +[CarSessionController sharedInstance];
  [v8 removeObserver:self];
}

- (void)sceneWillEnterForeground:(id)a3
{
  v4 = sub_1000A930C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v8 = 134349314;
    int v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] sceneWillEnterForeground, widgetControllerClass: %@", (uint8_t *)&v8, 0x16u);
  }
  BOOL v7 = [(CarWidgetController *)self chromeViewController];
  [v7 setSuppressed:0];
}

- (void)sceneDidEnterBackground:(id)a3
{
  v4 = sub_1000A930C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    int v7 = 134349314;
    int v8 = self;
    __int16 v9 = 2112;
    __int16 v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] sceneDidEnterBackground, widgetControllerClass: %@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)contextsForCurrentAppState
{
  return &__NSArray0__struct;
}

- (int64_t)sceneType
{
  return self->_sceneType;
}

- (CarChromeViewController)chromeViewController
{
  return self->_chromeViewController;
}

- (void)setChromeViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end