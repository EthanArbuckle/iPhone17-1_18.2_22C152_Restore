@interface PhoneSceneDelegate
- (BOOL)handleShortcutItem:(id)a3;
- (BOOL)isUIInitialized;
- (UIApplicationShortcutItem)shortcutItem;
- (UIWindow)window;
- (id)_createWindowFromScene:(id)a3;
- (void)_initializeUI;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)scene:(id)a3 didUpdateUserActivity:(id)a4;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setIsUIInitialized:(BOOL)a3;
- (void)setShortcutItem:(id)a3;
- (void)setWindow:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation PhoneSceneDelegate

- (void)sceneWillEnterForeground:(id)a3
{
  v3 = sub_100012C68();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneWillEnterForeground:", v5, 2u);
  }

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"PhoneApplicationActivatedNotification" object:0];
}

- (id)_createWindowFromScene:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)UIWindow) initWithWindowScene:v3];

  v5 = [UIApp applicationTintColor];
  [v4 setTintColor:v5];

  [v4 setOverrideUserInterfaceStyle:2];
  [v4 _accessibilitySetInterfaceStyleIntent:2];
  v6 = +[UIColor clearColor];
  [v4 setBackgroundColor:v6];

  return v4;
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = sub_100012C68();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneDidBecomeActive:", (uint8_t *)&v12, 2u);
  }

  v5 = sub_100011274(@"PHLastTabTypeKey", TUBundleIdentifierMobilePhoneApplication);
  int v6 = (int)v5;

  if (v6 != 2) {
    [UIApp warmInCallServiceIfNecessary];
  }
  v7 = [(PhoneSceneDelegate *)self shortcutItem];

  if (v7)
  {
    v8 = [(PhoneSceneDelegate *)self shortcutItem];
    unsigned int v9 = [(PhoneSceneDelegate *)self handleShortcutItem:v8];

    v10 = sub_100012C68();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v11 = @"NO";
      if (v9) {
        CFStringRef v11 = @"YES";
      }
      int v12 = 138412290;
      CFStringRef v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: did handle shortcut with success: %@", (uint8_t *)&v12, 0xCu);
    }

    [(PhoneSceneDelegate *)self setShortcutItem:0];
  }
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  unsigned int v9 = sub_100012C68();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: scene:willConnectToSession:options: %@", buf, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v10 = v7;
    if (![(PhoneSceneDelegate *)self isUIInitialized])
    {
      if (!self->_window)
      {
        CFStringRef v11 = [(PhoneSceneDelegate *)self _createWindowFromScene:v10];
        window = self->_window;
        self->_window = v11;
      }
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10000A660;
      v24[3] = &unk_1000A1D50;
      v24[4] = self;
      +[UIView performWithoutAnimation:v24];
    }
  }
  else
  {
    v10 = sub_100012C68();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10006A8D4((uint64_t)v7, v10);
    }
  }

  if (+[UIApplication shouldMakeUIForDefaultPNG])
  {
    CFStringRef v13 = [(PhoneSceneDelegate *)self window];
    [v13 orderFront:0];
  }
  v14 = [v8 shortcutItem];
  [(PhoneSceneDelegate *)self setShortcutItem:v14];

  v15 = [UIApp rootViewController];
  [v15 displayUIAnimated:0];

  v16 = [v8 URLContexts];
  id v17 = [v16 count];

  if (v17)
  {
    id v18 = [v8 URLContexts];
    [(PhoneSceneDelegate *)self scene:v7 openURLContexts:v18];
  }
  else
  {
    id v18 = objc_alloc_init((Class)TUFeatureFlags);
    if ([v18 callHistorySearchEnabled])
    {
      v19 = [v8 userActivities];
      id v20 = [v19 count];

      if (v20)
      {
        v21 = [v8 userActivities];
        v22 = [v21 anyObject];

        v23 = sub_100012C68();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v22;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: connectionOptions has userActivity: %@", buf, 0xCu);
        }

        [(PhoneSceneDelegate *)self scene:v7 continueUserActivity:v22];
      }
    }
  }
}

- (UIWindow)window
{
  return self->_window;
}

- (UIApplicationShortcutItem)shortcutItem
{
  return self->_shortcutItem;
}

- (void)setShortcutItem:(id)a3
{
}

- (void)setIsUIInitialized:(BOOL)a3
{
  self->_isUIInitialized = a3;
}

- (BOOL)isUIInitialized
{
  return self->_isUIInitialized;
}

- (void)_initializeUI
{
  if (![UIApp isSuspended]
    || ([UIApp alwaysShowLocalVideo] & 1) == 0)
  {
    v2 = (void *)UIApp;
    _[v2 showInitialView];
  }
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v3 = sub_100012C68();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneDidEnterBackground:", v5, 2u);
  }

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"PhoneApplicationDeactivatedNotification" object:0];
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v7 = a4;
  id v8 = (void (**)(id, BOOL))a5;
  unsigned int v9 = sub_100012C68();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: windowScene:performActionForShortcutItem: %@", (uint8_t *)&v12, 0xCu);
  }

  [(PhoneSceneDelegate *)self setShortcutItem:v7];
  v10 = [(PhoneSceneDelegate *)self shortcutItem];
  BOOL v11 = [(PhoneSceneDelegate *)self handleShortcutItem:v10];

  [(PhoneSceneDelegate *)self setShortcutItem:0];
  v8[2](v8, v11);
}

- (BOOL)handleShortcutItem:(id)a3
{
  id v3 = a3;
  id v4 = sub_100012C68();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: handling shortcut item %@", (uint8_t *)&v10, 0xCu);
  }

  v5 = [UIApp rootViewController];
  int v6 = [v5 baseViewController];

  id v7 = [v6 selectedViewController];
  id v8 = [v7 presentedViewController];
  if (v8) {
    [v7 dismissViewControllerAnimated:0 completion:0];
  }

  return 0;
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneDidDisconnect:", v10, 2u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v4;
    id v7 = [UIApp rootViewController];
    id v8 = [v6 keyWindow];
    unsigned int v9 = [v8 rootViewController];

    if (v7 == v9) {
      [UIApp setRootViewController:0];
    }
    [(UIWindow *)self->_window setRootViewController:0];
  }
}

- (void)sceneWillResignActive:(id)a3
{
  id v3 = sub_100012C68();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate: sceneWillResignActive:", v4, 2u);
  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v4 = a4;
  v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PhoneSceneDelegate openURLContexts: %@", buf, 0xCu);
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      int v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = (void *)UIApp;
        int v12 = [*(id *)(*((void *)&v13 + 1) + 8 * (void)v10) URL:(void)v13];
        [v11 applicationOpenURL:v12];

        int v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100012C68();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v5;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Phone scene %@ will continue user activity with type %@", (uint8_t *)&v10, 0x16u);
  }

  id v8 = objc_alloc_init((Class)TUFeatureFlags);
  if ([v8 conversationHandoffEnabled]
    && [v6 isEqualToString:TUUserActivityTypeConversationHandoff])
  {
    uint64_t v9 = +[TUCallCenter sharedInstance];
    [v9 continueHandoffEligibleConversation];
  }
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100012C68();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412546;
    id v16 = v5;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Phone scene %@ is continuing user activity: %@", (uint8_t *)&v15, 0x16u);
  }

  id v8 = [v6 activityType];
  uint64_t v9 = TUCallPhoneAppHistoryActivityType();
  unsigned __int8 v10 = [v8 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    id v11 = [v6 activityType];
    unsigned int v12 = [v11 isEqualToString:TUUserActivityTypeConversationHandoff];

    if (v12)
    {
      id v13 = sub_100012C68();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:

        goto LABEL_10;
      }
      long long v14 = [v6 tu_dynamicIdentifier];
      int v15 = 138412290;
      id v16 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "FaceTime call handoff dynamic identifier was: %@", (uint8_t *)&v15, 0xCu);
    }
    else
    {
      id v13 = [UIApp rootViewController];
      long long v14 = [v13 baseViewController];
      [v14 handleUserActivityContinuation:v6];
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  unsigned __int8 v10 = sub_100012C68();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412802;
    id v12 = v7;
    __int16 v13 = 2112;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Phone scene %@ did fail to continue user activity with type %@ due to error %@", (uint8_t *)&v11, 0x20u);
  }
}

- (void)scene:(id)a3 didUpdateUserActivity:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100012C68();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v5;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Phone scene %@ did update user activity %@", (uint8_t *)&v8, 0x16u);
  }
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutItem, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end