@interface AppleTVAppDelegate
- (AppleTVAppDelegate)init;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5;
- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4;
- (BOOL)overrideOrientation;
- (UIWindow)window;
- (id)handleEventsForARQLBackgroundURLSessionCompletionHandler;
- (id)handleEventsForBackgroundURLSessionCompletionHandler;
- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4;
- (void)_downloadSessionDidFinishEventsForARBackgroundURLSession:(id)a3;
- (void)_downloadSessionDidFinishEventsForBackgroundURLSession:(id)a3;
- (void)_downloadSessionDidTimeoutWaitingForBackgroundEventsToFinish;
- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5;
- (void)dealloc;
- (void)registerBgUrlSessionNotifications;
- (void)setHandleEventsForARQLBackgroundURLSessionCompletionHandler:(id)a3;
- (void)setHandleEventsForBackgroundURLSessionCompletionHandler:(id)a3;
- (void)setOverrideOrientation:(BOOL)a3;
- (void)setWindow:(id)a3;
@end

@implementation AppleTVAppDelegate

- (AppleTVAppDelegate)init
{
  v6.receiver = self;
  v6.super_class = (Class)AppleTVAppDelegate;
  v2 = [(AppleTVAppDelegate *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(AppleTVAppDelegate *)v2 registerBgUrlSessionNotifications];
    id v4 = +[VUITVAppLauncher sharedInstance];
  }
  return v3;
}

- (void)registerBgUrlSessionNotifications
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_downloadSessionDidFinishEventsForBackgroundURLSession:" name:TVPDownloadSessionDidFinishEventsForBackgroundURLSessionNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_downloadSessionDidFinishEventsForARBackgroundURLSession:" name:VUIARQLDownloadSessionDidFinishEventsForBackgroundURLSessionNotification object:0];
}

- (BOOL)application:(id)a3 willFinishLaunchingWithOptions:(id)a4
{
  id v4 = a4;
  v5 = VUISignpostLogObject();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.Main", "", buf, 2u);
  }

  objc_super v6 = VUISignpostLogObject();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.WillFinishLaunch", "", v12, 2u);
  }

  v7 = +[VUITVAppLauncher sharedInstance];
  unsigned __int8 v8 = [v7 applicationWillFinishLaunchingWithOptions:v4];

  v9 = VUISignpostLogObject();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)v11 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.WillFinishLaunch", "", v11, 2u);
  }

  return v8;
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v5 = a4;
  objc_super v6 = VUISignpostLogObject();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.DidFinishLaunch", "", buf, 2u);
  }

  v7 = VUISignpostLogObject();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)v26 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.MainWindow", "", v26, 2u);
  }

  unsigned __int8 v8 = +[UIScreen mainScreen];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  id v17 = [objc_alloc((Class)UIWindow) initWithFrame:v10, v12, v14, v16];
  [(AppleTVAppDelegate *)self setWindow:v17];
  v18 = +[VUITVAppLauncher sharedInstance];
  [v18 setMainWindow:v17];

  v19 = VUISignpostLogObject();
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)v25 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.MainWindow", "", v25, 2u);
  }

  v20 = +[VUITVAppLauncher sharedInstance];
  unsigned __int8 v21 = [v20 applicationDidFinishLaunchingWithOptions:v5];

  v22 = VUISignpostLogObject();
  if (os_signpost_enabled(v22))
  {
    *(_WORD *)v24 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Launch.DidFinishLaunch", "", v24, 2u);
  }

  return v21;
}

- (unint64_t)application:(id)a3 supportedInterfaceOrientationsForWindow:(id)a4
{
  id v5 = a4;
  objc_super v6 = +[UIDevice currentDevice];
  id v7 = [v6 userInterfaceIdiom];

  if (v7 == (id)1)
  {
    unint64_t v8 = 30;
  }
  else
  {
    if ([v5 conformsToProtocol:&OBJC_PROTOCOL___VUIOrientationOverride])
    {
      unsigned int v9 = [v5 overridesOrientationLock];
    }
    else
    {
      double v10 = [v5 rootViewController];
      double v11 = [v10 presentedViewController];

      if (v11)
      {
        do
        {
          double v12 = [v10 presentedViewController];

          double v13 = [v12 presentedViewController];

          double v10 = v12;
        }
        while (v13);
      }
      else
      {
        double v12 = v10;
      }
      if ([v12 conformsToProtocol:&OBJC_PROTOCOL___VUIOrientationOverride]) {
        unsigned int v9 = [v12 overridesOrientationLock];
      }
      else {
        unsigned int v9 = 0;
      }
    }
    if ([(AppleTVAppDelegate *)self overrideOrientation] | v9) {
      unint64_t v8 = 26;
    }
    else {
      unint64_t v8 = 2;
    }
  }

  return v8;
}

- (BOOL)overrideOrientation
{
  return self->_overrideOrientation;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void)dealloc
{
  v3 = +[VUITVAppLauncher sharedInstance];
  [v3 cleanUp];

  v4.receiver = self;
  v4.super_class = (Class)AppleTVAppDelegate;
  [(AppleTVAppDelegate *)&v4 dealloc];
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  unint64_t v8 = VUIDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "AppleTVAppDelegate openURL -- url %@", (uint8_t *)&v12, 0xCu);
  }

  unsigned int v9 = +[VUITVAppLauncher sharedInstance];
  unsigned __int8 v10 = [v9 openURL:v6 options:v7];

  return v10;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v5 = a4;
  id v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 activityType];
    *(_DWORD *)buf = 138412290;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "AppleTVAppDelegate continueUserActivity -- restorationHandler activityType %@", buf, 0xCu);
  }
  unint64_t v8 = [v5 activityType];
  unsigned int v9 = [v8 isEqualToString:NSUserActivityTypeBrowsingWeb];

  if (v9)
  {
    unsigned __int8 v10 = [v5 webpageURL];
    uint64_t v11 = objc_opt_new();
    int v12 = (void *)v11;
    if (v10)
    {
      id v13 = VUIDefaultLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        double v14 = [v10 absoluteString];
        *(_DWORD *)buf = 138412290;
        v26 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "AppleTVAppDelegate continueUserActivity -- process url %@", buf, 0xCu);
      }
      double v15 = [v5 _sourceApplication];
      if (v15) {
        [v12 setObject:v15 forKey:UIApplicationOpenURLOptionsSourceApplicationKey];
      }
      double v16 = [v5 referrerURL];
      id v17 = [v16 absoluteString];

      if (v17)
      {
        uint64_t v23 = LSReferrerURLKey;
        v24 = v17;
        v18 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        [v12 setObject:v18 forKey:UIApplicationOpenURLOptionsAnnotationKey];
      }
      v19 = +[VUITVAppLauncher sharedInstance];
      if ([v12 count])
      {
        id v20 = [v12 copy];
        unsigned __int8 v21 = [v19 openURL:v10 options:v20];
      }
      else
      {
        unsigned __int8 v21 = [v19 openURL:v10 options:0];
      }
    }
    else
    {
      unsigned __int8 v21 = 0;
      unsigned __int8 v10 = (void *)v11;
    }
  }
  else
  {
    unsigned __int8 v21 = 0;
  }

  return v21;
}

- (void)application:(id)a3 handleEventsForBackgroundURLSession:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  unsigned __int8 v10 = NSStringFromSelector(a2);
  uint64_t v11 = VUIDefaultLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    v19 = v10;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received %@ for background URL session %@", (uint8_t *)&v18, 0x16u);
  }

  if ([v8 isEqualToString:VUIARQLDownloadSessionConfigurationIdentifier])
  {
    int v12 = [(AppleTVAppDelegate *)self handleEventsForARQLBackgroundURLSessionCompletionHandler];

    if (v12)
    {
      id v13 = VUIDefaultLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100011A14((uint64_t)v10, v13);
      }

      double v14 = [(AppleTVAppDelegate *)self handleEventsForARQLBackgroundURLSessionCompletionHandler];
      v14[2]();

      [(AppleTVAppDelegate *)self setHandleEventsForARQLBackgroundURLSessionCompletionHandler:0];
    }
    [(AppleTVAppDelegate *)self setHandleEventsForARQLBackgroundURLSessionCompletionHandler:v9];
  }
  else
  {
    double v15 = [(AppleTVAppDelegate *)self handleEventsForBackgroundURLSessionCompletionHandler];

    if (v15)
    {
      double v16 = VUIDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100011A8C((uint64_t)v10, v16);
      }

      id v17 = [(AppleTVAppDelegate *)self handleEventsForBackgroundURLSessionCompletionHandler];
      v17[2]();

      [(AppleTVAppDelegate *)self setHandleEventsForBackgroundURLSessionCompletionHandler:0];
    }
    [(AppleTVAppDelegate *)self setHandleEventsForBackgroundURLSessionCompletionHandler:v9];
    [(AppleTVAppDelegate *)self performSelector:"_downloadSessionDidTimeoutWaitingForBackgroundEventsToFinish" withObject:0 afterDelay:10.0];
  }
}

- (void)_downloadSessionDidTimeoutWaitingForBackgroundEventsToFinish
{
  v3 = VUIDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100011B04(v3);
  }

  [(AppleTVAppDelegate *)self _downloadSessionDidFinishEventsForBackgroundURLSession:0];
}

- (void)_downloadSessionDidFinishEventsForBackgroundURLSession:(id)a3
{
  id v4 = a3;
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received %@", (uint8_t *)&v10, 0xCu);
  }
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_downloadSessionDidTimeoutWaitingForBackgroundEventsToFinish" object:0];
  id v7 = [(AppleTVAppDelegate *)self handleEventsForBackgroundURLSessionCompletionHandler];

  if (v7)
  {
    id v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Calling completion handler for application:handleEventsForBackgroundURLSession:completionHandler:", (uint8_t *)&v10, 2u);
    }

    id v9 = [(AppleTVAppDelegate *)self handleEventsForBackgroundURLSessionCompletionHandler];
    v9[2]();

    [(AppleTVAppDelegate *)self setHandleEventsForBackgroundURLSessionCompletionHandler:0];
  }
}

- (void)_downloadSessionDidFinishEventsForARBackgroundURLSession:(id)a3
{
  id v4 = a3;
  id v5 = VUIDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 name];
    int v10 = 138412290;
    uint64_t v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received %@", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [(AppleTVAppDelegate *)self handleEventsForARQLBackgroundURLSessionCompletionHandler];

  if (v7)
  {
    id v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Calling AR completion handler for application:handleEventsForBackgroundURLSession:completionHandler:", (uint8_t *)&v10, 2u);
    }

    id v9 = [(AppleTVAppDelegate *)self handleEventsForARQLBackgroundURLSessionCompletionHandler];
    v9[2]();

    [(AppleTVAppDelegate *)self setHandleEventsForARQLBackgroundURLSessionCompletionHandler:0];
  }
}

- (void)setOverrideOrientation:(BOOL)a3
{
  self->_overrideOrientation = a3;
}

- (id)handleEventsForBackgroundURLSessionCompletionHandler
{
  return self->_handleEventsForBackgroundURLSessionCompletionHandler;
}

- (void)setHandleEventsForBackgroundURLSessionCompletionHandler:(id)a3
{
}

- (id)handleEventsForARQLBackgroundURLSessionCompletionHandler
{
  return self->_handleEventsForARQLBackgroundURLSessionCompletionHandler;
}

- (void)setHandleEventsForARQLBackgroundURLSessionCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handleEventsForARQLBackgroundURLSessionCompletionHandler, 0);
  objc_storeStrong(&self->_handleEventsForBackgroundURLSessionCompletionHandler, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

- (BOOL)application:(id)a3 runTest:(id)a4 options:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[ATAPPTController sharedInstance];
  unsigned int v9 = [v8 canHandleTest:v7];

  if (v9)
  {
    int v10 = +[ATAPPTController sharedInstance];
    [v10 runTest:v7 app:v6];
  }
  return v9;
}

@end