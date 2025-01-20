@interface CarSceneDelegate
+ (void)initialize;
- (BOOL)shouldIgnoreActivationStateForBanner;
- (CarSceneController)sceneController;
- (ChromeViewController)chromeViewController;
- (Class)_windowClass;
- (NSString)description;
- (NSString)sceneIdentifier;
- (PPTTestCoordinatorProtocol)testCoordinator;
- (UIScene)scene;
- (UIWindow)window;
- (id)appSessionController;
- (id)entryPointsCoordinator;
- (int64_t)sceneType;
- (void)_objc_initiateDealloc;
- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8;
- (void)dealloc;
- (void)rebuildContextsForCurrentAppState;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setScene:(id)a3;
- (void)setSceneController:(id)a3;
- (void)setSceneType:(int64_t)a3;
- (void)setWindow:(id)a3;
@end

@implementation CarSceneDelegate

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __class_setCustomDeallocInitiation(a1);
  }
}

- (void)_objc_initiateDealloc
{
  if (!pthread_main_np())
  {
    v3 = sub_1000A930C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "CarSceneDelegate deallocation initiated from the background", buf, 2u);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004F3334;
  block[3] = &unk_1012ED518;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
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
        v11 = "-[CarSceneDelegate dealloc]";
        __int16 v12 = 2080;
        v13 = "CarSceneDelegate.m";
        __int16 v14 = 1024;
        int v15 = 112;
        __int16 v16 = 2080;
        v17 = "dispatch_get_main_queue()";
        __int16 v18 = 2080;
        v19 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v20 = 2080;
        v21 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        v7 = sub_1005762E4();
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
  v9.super_class = (Class)CarSceneDelegate;
  [(CarSceneDelegate *)&v9 dealloc];
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t sceneType = self->_sceneType;
  if (sceneType > 7) {
    CFStringRef v5 = @".Unknown";
  }
  else {
    CFStringRef v5 = off_101300108[sceneType];
  }
  return +[NSString stringWithFormat:@"<%@ %p: %@>", v3, self, v5];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_1000A930C();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WillConnectToSession", "", buf, 2u);
  }

  __int16 v12 = sub_1000A930C();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CarDisplayControllerPrepare", "", buf, 2u);
  }

  v13 = +[CarDisplayController sharedInstance];
  [v13 prepareCarPlay];

  __int16 v14 = sub_1000A930C();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CarDisplayControllerPrepare", "", buf, 2u);
  }

  id v15 = v8;
  [(CarSceneDelegate *)self setScene:v15];
  id v16 = [v15 _FBSScene];
  v17 = [v16 settings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  v19 = [v16 settings];
  __int16 v20 = v19;
  if (isKindOfClass)
  {
    v21 = (char *)[v19 widgetStyle];
    uint64_t v22 = 2;
    if (v21 != (char *)3) {
      uint64_t v22 = 0;
    }
    if ((unint64_t)(v21 - 1) >= 2) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = 3;
    }
LABEL_13:

    goto LABEL_19;
  }
  objc_opt_class();
  char v24 = objc_opt_isKindOfClass();

  if (v24)
  {
    if (!GEOConfigGetBOOL() || (GEOConfigGetBOOL() & 1) == 0)
    {
      __int16 v20 = [v16 settings];
      uint64_t v23 = 5;
      switch((unint64_t)[v20 itemType])
      {
        case 0uLL:
          if (GEOConfigGetBOOL()) {
            uint64_t v23 = 7;
          }
          else {
            uint64_t v23 = 4;
          }
          break;
        case 1uLL:
          uint64_t v23 = 4;
          break;
        case 2uLL:
          goto LABEL_13;
        case 3uLL:
          if (GEOConfigGetBOOL()) {
            uint64_t v23 = 7;
          }
          else {
            uint64_t v23 = 6;
          }
          break;
        default:
          uint64_t v23 = 0;
          break;
      }
      goto LABEL_13;
    }
    uint64_t v23 = 7;
  }
  else
  {
    uint64_t v23 = 1;
  }
LABEL_19:

  [(CarSceneDelegate *)self setSceneType:v23];
  v75 = self;
  v25 = +[NSArray arrayWithObjects:&v75 count:1];
  unint64_t v26 = [(CarSceneDelegate *)self sceneType];
  if (v26 > 7) {
    CFStringRef v27 = @".Unknown";
  }
  else {
    CFStringRef v27 = off_101300108[v26];
  }
  v28 = +[NSString stringWithFormat:@"%@_%p", v27, self];
  [v15 _registerSettingsDiffActionArray:v25 forKey:v28];

  v29 = sub_1000A930C();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    v30 = [v15 description];
    unint64_t v31 = [(CarSceneDelegate *)self sceneType];
    if (v31 > 7) {
      CFStringRef v32 = @".Unknown";
    }
    else {
      CFStringRef v32 = off_101300108[v31];
    }
    *(_DWORD *)buf = 138413058;
    v68 = v30;
    __int16 v69 = 2112;
    id v70 = v9;
    __int16 v71 = 2112;
    id v72 = v10;
    __int16 v73 = 2112;
    CFStringRef v74 = v32;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "-scene:willConnectToSession:withOptions: %@, %@, %@, carSceneType: %@", buf, 0x2Au);
  }
  v33 = sub_1000A930C();
  if (os_signpost_enabled(v33))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v33, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "PlatformController", "", buf, 2u);
  }

  v34 = [(CarSceneDelegate *)self appSessionController];
  v35 = [v34 primaryPlatformController];

  v36 = +[CarDisplayController sharedInstance];
  [v36 setPlatformController:v35];

  v37 = sub_1000A930C();
  if (os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v37, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "PlatformController", "", buf, 2u);
  }

  v38 = sub_1000A930C();
  if (os_signpost_enabled(v38))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IdleTimerConfiguration", "", buf, 2u);
  }

  v39 = +[UIApplication sharedMapsDelegate];
  [v39 updateNavigationIdleTimerConfiguration];

  v40 = sub_1000A930C();
  if (os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IdleTimerConfiguration", "", buf, 2u);
  }

  v41 = sub_1000A930C();
  if (os_signpost_enabled(v41))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneController", "", buf, 2u);
  }

  v42 = [(CarSceneDelegate *)self sceneController];
  [v42 _mapsCar_scene:v15 willConnectToSession:v9 options:v10];

  v43 = sub_1000A930C();
  if (os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v43, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneController", "", buf, 2u);
  }

  v44 = [v35 chromeViewController];

  if (!v44)
  {
    v45 = +[CarDisplayController sharedInstance];
    v46 = [v45 chromeViewController];
    [v35 setChromeViewController:v46];
  }
  if ((id)[(CarSceneDelegate *)self sceneType] != (id)1)
  {
    v47 = sub_1000A930C();
    if (os_signpost_enabled(v47))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v47, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CreateWindow", "", buf, 2u);
    }

    id v48 = [objc_alloc(-[CarSceneDelegate _windowClass](self, "_windowClass")) initWithWindowScene:v15];
    [(CarSceneDelegate *)self setWindow:v48];

    unint64_t v49 = [(CarSceneDelegate *)self sceneType];
    if (v49 > 7) {
      CFStringRef v50 = @".Unknown";
    }
    else {
      CFStringRef v50 = off_101300108[v49];
    }
    v51 = [@"Maps" stringByAppendingString:v50];
    v52 = [(CarSceneDelegate *)self window];
    [v52 setAccessibilityIdentifier:v51];

    v53 = [(CarSceneDelegate *)self sceneController];
    v54 = [v53 chromeViewController];
    v55 = [(CarSceneDelegate *)self window];
    [v55 setRootViewController:v54];

    v56 = [(CarSceneDelegate *)self window];
    [v56 setHidden:0];

    v57 = sub_1000A930C();
    if (os_signpost_enabled(v57))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v57, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CreateWindow", "", buf, 2u);
    }

    if ((id)[(CarSceneDelegate *)self sceneType] == (id)7)
    {
      v58 = sub_1000A930C();
      if (os_signpost_enabled(v58))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v58, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "RebuildContexts", "", buf, 2u);
      }

      [(CarSceneDelegate *)self rebuildContextsForCurrentAppState];
      v59 = sub_1000A930C();
      if (os_signpost_enabled(v59))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "RebuildContexts", "", buf, 2u);
      }
    }
  }
  v60 = sub_1000A930C();
  if (os_signpost_enabled(v60))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v60, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "EntryPointCoordinator", "", buf, 2u);
  }

  v61 = [(CarSceneDelegate *)self entryPointsCoordinator];
  v62 = [v15 coordinateSpace];
  [v62 bounds];
  [v61 willConnectToSession:v9 options:v10 windowSize:v15 scene:v63];

  v65 = sub_1000A930C();
  if (os_signpost_enabled(v65))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v65, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "EntryPointCoordinator", "", buf, 2u);
  }

  v66 = sub_1000A930C();
  if (os_signpost_enabled(v66))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v66, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WillConnectToSession", "", buf, 2u);
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = sub_1000A930C();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneDidDisconnect", "", buf, 2u);
  }

  v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v4 description];
    unint64_t v8 = [(CarSceneDelegate *)self sceneType];
    if (v8 > 7) {
      CFStringRef v9 = @".Unknown";
    }
    else {
      CFStringRef v9 = off_101300108[v8];
    }
    *(_DWORD *)buf = 138412546;
    v29 = v7;
    __int16 v30 = 2112;
    unint64_t v31 = (const char *)v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "-sceneDidDisconnect: %@, carSceneType: %@", buf, 0x16u);
  }
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v11 = dispatch_queue_get_label(0);
  if (label != v11 && (!label || !v11 || strcmp(label, v11)))
  {
    uint64_t v23 = sub_1005762E4();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      char v24 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
      v25 = dispatch_queue_get_label(0);
      *(_DWORD *)buf = 136316418;
      v29 = "-[CarSceneDelegate sceneDidDisconnect:]";
      __int16 v30 = 2080;
      unint64_t v31 = "CarSceneDelegate.m";
      __int16 v32 = 1024;
      int v33 = 182;
      __int16 v34 = 2080;
      v35 = "dispatch_get_main_queue()";
      __int16 v36 = 2080;
      v37 = v24;
      __int16 v38 = 2080;
      v39 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
        buf,
        0x3Au);
    }
    if (sub_100BB36BC())
    {
      unint64_t v26 = sub_1005762E4();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        CFStringRef v27 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v29 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  id v12 = v4;
  unint64_t v13 = [(CarSceneDelegate *)self sceneType];
  if (v13 > 7) {
    CFStringRef v14 = @".Unknown";
  }
  else {
    CFStringRef v14 = off_101300108[v13];
  }
  id v15 = +[NSString stringWithFormat:@"%@_%p", v14, self];
  [v12 _unregisterSettingsDiffActionArrayForKey:v15];

  if ((id)[(CarSceneDelegate *)self sceneType] != (id)1)
  {
    id v16 = [(CarSceneDelegate *)self window];
    [v16 setHidden:1];

    v17 = [(CarSceneDelegate *)self window];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v19 = [(CarSceneDelegate *)self window];
      [v19 invalidate];
    }
    [(CarSceneDelegate *)self setWindow:0];
  }
  __int16 v20 = [(CarSceneDelegate *)self sceneController];
  [v20 sceneDidDisconnect:v12];

  v21 = +[UIApplication sharedMapsDelegate];
  [v21 updateNavigationIdleTimerConfiguration];

  uint64_t v22 = sub_1000A930C();
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneDidDisconnect", "", buf, 2u);
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = sub_1000A930C();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneDidBecomeActive", "", (uint8_t *)&v16, 2u);
  }

  v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v4 description];
    unint64_t v8 = [(CarSceneDelegate *)self sceneType];
    if (v8 > 7) {
      CFStringRef v9 = @".Unknown";
    }
    else {
      CFStringRef v9 = off_101300108[v8];
    }
    int v16 = 138412546;
    v17 = v7;
    __int16 v18 = 2112;
    CFStringRef v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "-sceneDidBecomeActive: %@, carSceneType: %@", (uint8_t *)&v16, 0x16u);
  }
  id v10 = [(CarSceneDelegate *)self sceneController];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(CarSceneDelegate *)self sceneController];
    [v12 sceneDidBecomeActive:v4];
  }
  unint64_t v13 = [(CarSceneDelegate *)self entryPointsCoordinator];
  CFStringRef v14 = [v4 session];
  [v13 didBecomeActiveWithSession:v14];

  id v15 = sub_1000A930C();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneDidBecomeActive", "", (uint8_t *)&v16, 2u);
  }
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = sub_1000A930C();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneWillResignActive", "", (uint8_t *)&v16, 2u);
  }

  v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v4 description];
    unint64_t v8 = [(CarSceneDelegate *)self sceneType];
    if (v8 > 7) {
      CFStringRef v9 = @".Unknown";
    }
    else {
      CFStringRef v9 = off_101300108[v8];
    }
    int v16 = 138412546;
    v17 = v7;
    __int16 v18 = 2112;
    CFStringRef v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "-sceneWillResignActive: %@, carSceneType: %@", (uint8_t *)&v16, 0x16u);
  }
  id v10 = [(CarSceneDelegate *)self sceneController];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(CarSceneDelegate *)self sceneController];
    [v12 sceneWillResignActive:v4];
  }
  unint64_t v13 = [(CarSceneDelegate *)self entryPointsCoordinator];
  CFStringRef v14 = [v4 session];
  [v13 willResignActiveWithSession:v14];

  id v15 = sub_1000A930C();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneWillResignActive", "", (uint8_t *)&v16, 2u);
  }
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = sub_1000A930C();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneWillEnterForeground", "", (uint8_t *)&v16, 2u);
  }

  v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v4 description];
    unint64_t v8 = [(CarSceneDelegate *)self sceneType];
    if (v8 > 7) {
      CFStringRef v9 = @".Unknown";
    }
    else {
      CFStringRef v9 = off_101300108[v8];
    }
    int v16 = 138412546;
    v17 = v7;
    __int16 v18 = 2112;
    CFStringRef v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "-sceneWillEnterForeground: %@, carSceneType: %@", (uint8_t *)&v16, 0x16u);
  }
  id v10 = [(CarSceneDelegate *)self sceneController];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(CarSceneDelegate *)self sceneController];
    [v12 sceneWillEnterForeground:v4];
  }
  unint64_t v13 = [(CarSceneDelegate *)self entryPointsCoordinator];
  CFStringRef v14 = [v4 session];
  [v13 willEnterForegroundWithSession:v14];

  id v15 = sub_1000A930C();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneWillEnterForeground", "", (uint8_t *)&v16, 2u);
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = sub_1000A930C();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SceneDidEnterBackground", "", (uint8_t *)&v16, 2u);
  }

  v6 = sub_1000A930C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v4 description];
    unint64_t v8 = [(CarSceneDelegate *)self sceneType];
    if (v8 > 7) {
      CFStringRef v9 = @".Unknown";
    }
    else {
      CFStringRef v9 = off_101300108[v8];
    }
    int v16 = 138412546;
    v17 = v7;
    __int16 v18 = 2112;
    CFStringRef v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "-sceneDidEnterBackground: %@, carSceneType: %@", (uint8_t *)&v16, 0x16u);
  }
  id v10 = [(CarSceneDelegate *)self sceneController];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(CarSceneDelegate *)self sceneController];
    [v12 sceneDidEnterBackground:v4];
  }
  unint64_t v13 = [(CarSceneDelegate *)self entryPointsCoordinator];
  CFStringRef v14 = [v4 session];
  [v13 didEnterBackgroundWithSession:v14];

  id v15 = sub_1000A930C();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v16) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SceneDidEnterBackground", "", (uint8_t *)&v16, 2u);
  }
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  CFStringRef v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      unint64_t v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        v21 = "-[CarSceneDelegate scene:continueUserActivity:]";
        __int16 v22 = 2080;
        uint64_t v23 = "CarSceneDelegate.m";
        __int16 v24 = 1024;
        int v25 = 252;
        __int16 v26 = 2080;
        CFStringRef v27 = "dispatch_get_main_queue()";
        __int16 v28 = 2080;
        v29 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v30 = 2080;
        unint64_t v31 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        CFStringRef v14 = sub_1005762E4();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          id v15 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          v21 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1008F2E80;
  v16[3] = &unk_1012E85E0;
  v16[4] = self;
  id v17 = v7;
  id v18 = v6;
  id v19 = v18;
  id v11 = v7;
  id v12 = v18;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  CFStringRef v9 = dispatch_queue_get_label(0);
  if (label != v9)
  {
    BOOL v10 = !label || v9 == 0;
    if (v10 || strcmp(label, v9))
    {
      CFStringRef v14 = sub_1005762E4();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        __int16 v22 = "-[CarSceneDelegate scene:openURLContexts:]";
        __int16 v23 = 2080;
        __int16 v24 = "CarSceneDelegate.m";
        __int16 v25 = 1024;
        int v26 = 266;
        __int16 v27 = 2080;
        __int16 v28 = "dispatch_get_main_queue()";
        __int16 v29 = 2080;
        __int16 v30 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        __int16 v31 = 2080;
        __int16 v32 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);
      }
      if (sub_100BB36BC())
      {
        id v15 = sub_1005762E4();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          int v16 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          __int16 v22 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
    }
  }
  id v11 = v6;
  [v7 anyObject];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1008F31AC;
  v17[3] = &unk_1012E85E0;
  v17[4] = self;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v11;
  id v20 = v11;
  id v12 = v11;
  id v13 = v18;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v17);
}

- (void)_performActionsForUIScene:(id)a3 withUpdatedFBSScene:(id)a4 settingsDiff:(id)a5 fromSettings:(id)a6 transitionContext:(id)a7 lifecycleActionType:(unsigned int)a8
{
  id v12 = a3;
  id v13 = (__CFString *)a4;
  CFStringRef v14 = (__CFString *)a5;
  id v15 = a6;
  id v16 = [(CarSceneDelegate *)self scene];

  if (v16 != v12)
  {
    uint64_t v17 = sub_1000A930C();
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = [(CarSceneDelegate *)self scene];
      id v19 = [v18 _FBSScene];
      *(_DWORD *)buf = 138412546;
      v91 = v19;
      __int16 v92 = 2112;
      CFStringRef v93 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_ERROR, "CarSceneController - FBSceneUpdateAction: received callback for _FBScene that differs from current scene's _FBScene, current: %@ new: %@", buf, 0x16u);
    }
    goto LABEL_85;
  }
  CFStringRef v89 = v14;
  int64_t v20 = [(CarSceneDelegate *)self sceneType];
  v21 = v13;
  __int16 v22 = [(__CFString *)v21 settings];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  __int16 v24 = [(__CFString *)v21 settings];
  __int16 v25 = v24;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    char v28 = objc_opt_isKindOfClass();

    unint64_t v87 = v20;
    if (v28)
    {
      if (!GEOConfigGetBOOL() || (GEOConfigGetBOOL() & 1) == 0)
      {
        __int16 v25 = [(__CFString *)v21 settings];
        unint64_t v27 = 5;
        switch((unint64_t)[v25 itemType])
        {
          case 0uLL:
            if (GEOConfigGetBOOL()) {
              unint64_t v27 = 7;
            }
            else {
              unint64_t v27 = 4;
            }
            goto LABEL_24;
          case 1uLL:
            unint64_t v27 = 4;
            goto LABEL_24;
          case 2uLL:
            goto LABEL_24;
          case 3uLL:
            if (GEOConfigGetBOOL()) {
              unint64_t v27 = 7;
            }
            else {
              unint64_t v27 = 6;
            }
            goto LABEL_24;
          default:
            goto LABEL_18;
        }
      }
      v85 = v13;
      __int16 v29 = v15;
      unint64_t v27 = 7;
    }
    else
    {
      v85 = v13;
      __int16 v29 = v15;
      unint64_t v27 = 1;
    }
LABEL_25:

    __int16 v30 = [(__CFString *)v21 settings];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v31 = v30;
    }
    else {
      __int16 v31 = 0;
    }
    id v32 = v31;

    uint64_t v17 = (uint64_t)v32;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v33 = (void *)v17;
    }
    else {
      int v33 = 0;
    }
    id v34 = v33;

    id v15 = v29;
    id v35 = v29;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v36 = v35;
    }
    else {
      __int16 v36 = 0;
    }
    id v37 = v36;

    unint64_t v38 = (unint64_t)v37;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v39 = (void *)v38;
    }
    else {
      v39 = 0;
    }
    id v40 = v39;

    char v41 = v17 | v38;
    id v84 = v34;
    v86 = v40;
    if (v17 | v38)
    {
      [(id)v17 safeAreaInsetsPortrait];
      double v43 = v42;
      double v45 = v44;
      double v47 = v46;
      double v49 = v48;
      [(id)v38 safeAreaInsetsPortrait];
      BOOL v53 = v45 != v52;
      if (v43 != v54) {
        BOOL v53 = 1;
      }
      if (v49 != v51) {
        BOOL v53 = 1;
      }
      char v55 = v47 != v50 || v53;
      id v56 = [v40 layoutJustification];
      if (v56 == [v34 layoutJustification]) {
        char v41 = v55;
      }
      else {
        char v41 = 1;
      }
    }
    unint64_t v57 = v27;
    id v13 = v85;
    if (v87 == v27)
    {
      if (v87 != 7) {
        char v41 = 0;
      }
      if ((v41 & 1) == 0)
      {
        v58 = sub_1000A930C();
        v59 = v84;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349314;
          v91 = self;
          __int16 v92 = 2112;
          CFStringRef v14 = (__CFString *)v89;
          CFStringRef v93 = v89;
          v60 = "[%{public}p] CarSceneController - FBSceneUpdateAction: scene has updated, but nothing meaningful has cha"
                "nged: %@. -> ignoring the call.";
          v61 = v58;
          os_log_type_t v62 = OS_LOG_TYPE_INFO;
LABEL_82:
          _os_log_impl((void *)&_mh_execute_header, v61, v62, v60, buf, 0x16u);
          goto LABEL_83;
        }
        CFStringRef v14 = (__CFString *)v89;
LABEL_83:

LABEL_84:
        goto LABEL_85;
      }
    }
    else if (v87 < 4 || v27 <= 3)
    {
      v58 = sub_1000A930C();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        if (v87 > 7) {
          CFStringRef v65 = @".Unknown";
        }
        else {
          CFStringRef v65 = off_101300108[v87];
        }
        CFStringRef v14 = (__CFString *)v89;
        if (v57 - 1 > 6) {
          CFStringRef v83 = @".Unknown";
        }
        else {
          CFStringRef v83 = off_1013000D0[v57 - 1];
        }
        v59 = v84;
        *(_DWORD *)buf = 138412546;
        v91 = (CarSceneDelegate *)v65;
        __int16 v92 = 2112;
        CFStringRef v93 = v83;
        v60 = "CarSceneController - FBSceneUpdateAction: scene was of type: %@, update to scenetype: %@, which is not sup"
              "ported -> ignoring the call.";
        v61 = v58;
        os_log_type_t v62 = OS_LOG_TYPE_ERROR;
        goto LABEL_82;
      }
      CFStringRef v14 = (__CFString *)v89;
      goto LABEL_73;
    }
    double v63 = sub_1000A930C();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      if (v87 - 4 > 3) {
        CFStringRef v64 = @".Unknown";
      }
      else {
        CFStringRef v64 = off_1013000B0[v87 - 4];
      }
      id v88 = v15;
      if (v27 - 1 > 6) {
        CFStringRef v66 = @".Unknown";
      }
      else {
        CFStringRef v66 = off_1013000D0[v27 - 1];
      }
      v67 = [(CarSceneDelegate *)self scene];
      *(_DWORD *)buf = 138412802;
      v91 = (CarSceneDelegate *)v64;
      __int16 v92 = 2112;
      CFStringRef v93 = v66;
      __int16 v94 = 2048;
      id v95 = [v67 activationState];
      _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "CarSceneController - FBSceneUpdateAction: updating scene type from: %@, to: %@, sceneState: %ld", buf, 0x20u);

      id v15 = v88;
    }

    v68 = [(CarSceneDelegate *)self window];
    [v68 setRootViewController:0];

    __int16 v69 = [(CarSceneDelegate *)self sceneController];
    id v70 = [(CarSceneDelegate *)self scene];
    [v69 sceneDidDisconnect:v70];

    [(CarSceneDelegate *)self setSceneController:0];
    [(CarSceneDelegate *)self setSceneType:v57];
    __int16 v71 = [(CarSceneDelegate *)self sceneController];
    id v72 = [(CarSceneDelegate *)self scene];
    __int16 v73 = [(CarSceneDelegate *)self scene];
    CFStringRef v74 = [v73 session];
    [v71 _mapsCar_scene:v72 willConnectToSession:v74 options:0];

    v75 = [(CarSceneDelegate *)self sceneController];
    v76 = [v75 chromeViewController];
    v77 = [(CarSceneDelegate *)self window];
    [v77 setRootViewController:v76];

    if ((id)[(CarSceneDelegate *)self sceneType] == (id)7) {
      [(CarSceneDelegate *)self rebuildContextsForCurrentAppState];
    }
    v78 = [(CarSceneDelegate *)self scene];
    id v79 = [v78 activationState];

    BOOL v80 = v79 == (id)2;
    CFStringRef v14 = (__CFString *)v89;
    if ((unint64_t)v79 >= 2)
    {
      v59 = v84;
      if (!v80) {
        goto LABEL_84;
      }
      v58 = [(CarSceneDelegate *)self sceneController];
      v82 = [(CarSceneDelegate *)self scene];
      [v58 sceneDidEnterBackground:v82];

      goto LABEL_83;
    }
    v58 = [(CarSceneDelegate *)self sceneController];
    v81 = [(CarSceneDelegate *)self scene];
    [v58 sceneWillEnterForeground:v81];

LABEL_73:
    v59 = v84;
    goto LABEL_83;
  }
  int v26 = (char *)[v24 widgetStyle];
  if ((unint64_t)(v26 - 1) < 2)
  {
    unint64_t v87 = v20;
    unint64_t v27 = 3;
LABEL_24:
    v85 = v13;
    __int16 v29 = v15;

    goto LABEL_25;
  }
  if (v26 == (char *)3)
  {
    unint64_t v87 = v20;
    unint64_t v27 = 2;
    goto LABEL_24;
  }
LABEL_18:

  uint64_t v17 = sub_1000A930C();
  CFStringRef v14 = (__CFString *)v89;
  if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v17, OS_LOG_TYPE_ERROR, "CarSceneController - FBSceneUpdateAction: received an update request to .Unspecified scene type. Ignoring.", buf, 2u);
  }
LABEL_85:
}

- (id)appSessionController
{
  v2 = +[UIApplication sharedMapsDelegate];
  uint64_t v3 = [v2 appSessionController];

  return v3;
}

- (CarSceneController)sceneController
{
  sceneController = self->_sceneController;
  if (!sceneController)
  {
    unint64_t v4 = [(CarSceneDelegate *)self sceneType];
    if (v4 <= 7)
    {
      unint64_t v5 = v4;
      if (((1 << v4) & 0xD4) != 0)
      {
        id v6 = CarMapWidgetController;
LABEL_7:
        id v7 = (CarSceneController *)[[v6 alloc] initWithCarSceneType:v5];
LABEL_8:
        unint64_t v8 = self->_sceneController;
        self->_sceneController = v7;

        sceneController = self->_sceneController;
        goto LABEL_9;
      }
      if (((1 << v4) & 0x28) != 0)
      {
        id v6 = CarSmallWidgetController;
        goto LABEL_7;
      }
      if (v4 == 1)
      {
        id v7 = +[CarDisplayController sharedInstance];
        goto LABEL_8;
      }
    }
    id v7 = objc_alloc_init(CarUnspecifiedWidgetController);
    goto LABEL_8;
  }
LABEL_9:

  return sceneController;
}

- (id)entryPointsCoordinator
{
  uint64_t v3 = [(CarSceneDelegate *)self appSessionController];
  unint64_t v4 = [v3 primaryPlatformController];
  unint64_t v5 = [v4 entryPointsCoordinator];

  id v6 = [v5 delegate];

  if (!v6)
  {
    id v7 = [CarMapsActionController alloc];
    unint64_t v8 = [(CarSceneDelegate *)self appSessionController];
    CFStringRef v9 = [v8 primaryPlatformController];
    BOOL v10 = [(CarMapsActionController *)v7 initWithPlatformController:v9];

    [v5 setDelegate:v10];
    carActionController = self->_carActionController;
    self->_carActionController = v10;
  }

  return v5;
}

- (Class)_windowClass
{
  unint64_t v3 = [(CarSceneDelegate *)self sceneType];
  if (v3 <= 7 && (((1 << v3) & 0xF0) != 0 || ((1 << v3) & 0xD) != 0))
  {
    unint64_t v4 = objc_opt_class();
  }
  else
  {
    id v6 = sub_1000A930C();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      unint64_t v7 = [(CarSceneDelegate *)self sceneType];
      if (v7 > 7) {
        CFStringRef v8 = @".Unknown";
      }
      else {
        CFStringRef v8 = off_101300108[v7];
      }
      int v9 = 138412290;
      CFStringRef v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "windowClass called for carSceneType: %@, which is invalid", (uint8_t *)&v9, 0xCu);
    }

    unint64_t v4 = 0;
  }

  return (Class)v4;
}

- (BOOL)shouldIgnoreActivationStateForBanner
{
  unint64_t sceneType = self->_sceneType;
  if (sceneType == 7)
  {
    unint64_t v3 = [(CarSceneDelegate *)self chromeViewController];
    unint64_t v4 = [v3 topContext];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      unint64_t v5 = v4;
    }
    else {
      unint64_t v5 = 0;
    }
    id v6 = v5;

    if (v6)
    {
      unint64_t v7 = [v6 desiredCards];
      unsigned int v8 = [v7 containsObject:@"Guidance"] ^ 1;
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = sceneType > 3;
  }
  return v8;
}

- (void)rebuildContextsForCurrentAppState
{
  id v2 = [(CarSceneDelegate *)self sceneController];
  [v2 _mapsCar_rebuildContextsForCurrentAppState];
}

- (PPTTestCoordinatorProtocol)testCoordinator
{
  if ((id)[(CarSceneDelegate *)self sceneType] != (id)1) {
    goto LABEL_6;
  }
  carTestCoordinator = self->_carTestCoordinator;
  if (!carTestCoordinator)
  {
    unint64_t v4 = objc_alloc_init(CarTestCoordinator);
    unint64_t v5 = self->_carTestCoordinator;
    self->_carTestCoordinator = v4;

    carTestCoordinator = self->_carTestCoordinator;
  }
  if ([(CarTestCoordinator *)carTestCoordinator conformsToProtocol:&OBJC_PROTOCOL___PPTTestCoordinatorProtocol])id v6 = self->_carTestCoordinator; {
  else
  }
LABEL_6:
    id v6 = 0;

  return (PPTTestCoordinatorProtocol *)v6;
}

- (ChromeViewController)chromeViewController
{
  id v2 = [(CarSceneDelegate *)self sceneController];
  unint64_t v3 = [v2 chromeViewController];

  return (ChromeViewController *)v3;
}

- (NSString)sceneIdentifier
{
  unint64_t v2 = [(CarSceneDelegate *)self sceneType];
  if (v2 > 7) {
    CFStringRef v3 = @".Unknown";
  }
  else {
    CFStringRef v3 = off_101300108[v2];
  }
  return +[NSString stringWithFormat:@"CarPlay%@", v3];
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (int64_t)sceneType
{
  return self->_sceneType;
}

- (void)setSceneType:(int64_t)a3
{
  self->_unint64_t sceneType = a3;
}

- (UIScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  return (UIScene *)WeakRetained;
}

- (void)setScene:(id)a3
{
}

- (void)setSceneController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneController, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_carTestCoordinator, 0);

  objc_storeStrong((id *)&self->_carActionController, 0);
}

@end