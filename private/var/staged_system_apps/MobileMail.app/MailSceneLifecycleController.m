@interface MailSceneLifecycleController
+ (id)log;
- (MFWindow)window;
- (UISceneConnectionOptions)deferredConnectionOptions;
- (id)stateRestorationActivityForScene:(id)a3;
- (void)_installDebugHandlerForScene:(id)a3;
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
- (void)setDeferredConnectionOptions:(id)a3;
- (void)setWindow:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation MailSceneLifecycleController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000879C;
  block[3] = &unk_1006044D8;
  block[4] = a1;
  if (qword_100699720 != -1) {
    dispatch_once(&qword_100699720, block);
  }
  v2 = (void *)qword_100699718;

  return v2;
}

- (void)_installDebugHandlerForScene:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v3);
    objc_copyWeak(&v6, &location);
    v4 = [v3 statusBarManager:^(NSInteger arg1, NSInteger arg2, NSInteger arg3) {
    sub_10012317C(arg1, arg2, arg3);
}];
    [v4 setDebugMenuHandler:&v5];

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v5 = a3;
  id v6 = +[MailSceneLifecycleController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = [v7 session];
    v11 = [v10 persistentIdentifier];
    v12 = +[NSString stringWithFormat:@"%@:%@", v9, v11];

    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sceneDidBecomeActive: %{public}@", buf, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v5 conformsToProtocol:&OBJC_PROTOCOL___MailSceneLifecycleResponder] & 1) == 0)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MailSceneLifecycleController.m" lineNumber:74 description:@"Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."];
  }
  [v5 mailSceneDidBecomeActive];
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v5 = a3;
  id v6 = +[MailSceneLifecycleController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = [v7 session];
    v11 = [v10 persistentIdentifier];
    v12 = +[NSString stringWithFormat:@"%@:%@", v9, v11];

    *(_DWORD *)buf = 138543362;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sceneWillEnterForeground: %{public}@", buf, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v5 conformsToProtocol:&OBJC_PROTOCOL___MailSceneLifecycleResponder] & 1) == 0)
  {
    v18 = +[NSAssertionHandler currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"MailSceneLifecycleController.m" lineNumber:88 description:@"Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."];
  }
  id v13 = v5;
  [v13 mailSceneWillEnterForeground];
  v14 = [(MailSceneLifecycleController *)self deferredConnectionOptions];
  [(MailSceneLifecycleController *)self setDeferredConnectionOptions:0];
  if (v14)
  {
    if (objc_opt_respondsToSelector())
    {
      v15 = [v14 URLContexts];
      if ([v15 count])
      {
        [v13 mailSceneOpenURLContexts:v15];
LABEL_17:

        goto LABEL_18;
      }
    }
    if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
    {
      v16 = [v14 userActivities];
      v15 = [v16 anyObject];

      if (v15)
      {
        v17 = [v15 activityType];
        [v13 mailSceneWillContinueUserActivityWithType:v17];

        [v13 mailSceneContinueUserActivity:v15];
        goto LABEL_17;
      }
    }
    if (objc_opt_respondsToSelector())
    {
      v15 = [v14 shortcutItem];
      if (v15)
      {
        [v13 mailScenePerformActionForShortcutItem:v15 completionHandler:&stru_100608C60];
        goto LABEL_17;
      }
    }
  }
LABEL_18:
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v29 = a5;
  v11 = +[MailSceneLifecycleController log];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v10;
    id v13 = a2;
    id v14 = v9;
    v15 = (objc_class *)objc_opt_class();
    v16 = NSStringFromClass(v15);
    v17 = [v14 session];
    v18 = [v17 persistentIdentifier];
    v19 = +[NSString stringWithFormat:@"%@:%@", v16, v18];

    *(_DWORD *)buf = 138543618;
    v31 = v19;
    __int16 v32 = 2112;
    id v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "scene: %{public}@ willConnectToSession: %@", buf, 0x16u);

    a2 = v13;
    id v10 = v12;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v9 conformsToProtocol:&OBJC_PROTOCOL___MailSceneLifecycleResponder] & 1) == 0)
  {
    v27 = +[NSAssertionHandler currentHandler];
    [v27 handleFailureInMethod:a2 object:self file:@"MailSceneLifecycleController.m" lineNumber:33 description:@"Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."];
  }
  id v20 = v9;
  v21 = [[MFWindow alloc] initWithWindowScene:v20];
  v22 = +[UIColor mailInteractiveColor];
  [(MFWindow *)v21 setTintColor:v22];

  v23 = [(MFWindow *)v21 layer];
  [v23 setHitTestsAsOpaque:1];

  [(MailSceneLifecycleController *)self setWindow:v21];
  [v20 mailSceneDidConnectWithOptions:v29];
  v24 = [v20 mf_rootViewController];
  if (!v24)
  {
    v28 = +[NSAssertionHandler currentHandler];
    [v28 handleFailureInMethod:a2 object:self file:@"MailSceneLifecycleController.m" lineNumber:41 description:@"Scene must provide a root view controller after connection."];
  }
  v25 = objc_opt_class();
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v25 wantsDeferredConnectionActions]) {
    [(MailSceneLifecycleController *)self setDeferredConnectionOptions:v29];
  }
  [(MailSceneLifecycleController *)self _installDebugHandlerForScene:v20];
  [(MFWindow *)v21 setRootViewController:v24];
  if ([v20 conformsToProtocol:&OBJC_PROTOCOL___MFWindowDelegate]) {
    [(MFWindow *)v21 setDelegate:v20];
  }
  v26 = [(MailSceneLifecycleController *)self window];
  [v26 makeKeyAndVisible];
}

- (MFWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (void)setDeferredConnectionOptions:(id)a3
{
}

- (UISceneConnectionOptions)deferredConnectionOptions
{
  return self->_deferredConnectionOptions;
}

- (void)sceneDidDisconnect:(id)a3
{
  id v5 = a3;
  id v6 = +[MailSceneLifecycleController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = [v7 session];
    v11 = [v10 persistentIdentifier];
    id v12 = +[NSString stringWithFormat:@"%@:%@", v9, v11];

    *(_DWORD *)buf = 138543362;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sceneDidDisconnect: %{public}@", buf, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v5 conformsToProtocol:&OBJC_PROTOCOL___MailSceneLifecycleResponder] & 1) == 0)
  {
    v15 = +[NSAssertionHandler currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"MailSceneLifecycleController.m" lineNumber:60 description:@"Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."];
  }
  id v13 = v5;
  [v13 mailSceneDidDisconnect];
  id v14 = [(MailSceneLifecycleController *)self window];
  [v14 setRootViewController:0];

  [(MailSceneLifecycleController *)self setWindow:0];
}

- (void)sceneWillResignActive:(id)a3
{
  id v5 = a3;
  id v6 = +[MailSceneLifecycleController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = [v7 session];
    v11 = [v10 persistentIdentifier];
    id v12 = +[NSString stringWithFormat:@"%@:%@", v9, v11];

    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sceneWillResignActive: %{public}@", buf, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v5 conformsToProtocol:&OBJC_PROTOCOL___MailSceneLifecycleResponder] & 1) == 0)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MailSceneLifecycleController.m" lineNumber:81 description:@"Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."];
  }
  [v5 mailSceneWillResignActive];
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v5 = a3;
  id v6 = +[MailSceneLifecycleController log];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = [v7 session];
    v11 = [v10 persistentIdentifier];
    id v12 = +[NSString stringWithFormat:@"%@:%@", v9, v11];

    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "sceneDidEnterBackground: %{public}@", buf, 0xCu);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v5 conformsToProtocol:&OBJC_PROTOCOL___MailSceneLifecycleResponder] & 1) == 0)
  {
    id v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MailSceneLifecycleController.m" lineNumber:129 description:@"Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."];
  }
  [v5 mailSceneDidEnterBackground];
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v7 conformsToProtocol:&OBJC_PROTOCOL___MailSceneLifecycleResponder] & 1) == 0)
  {
    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MailSceneLifecycleController.m" lineNumber:137 description:@"Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."];
  }
  id v9 = v7;
  if (objc_opt_respondsToSelector())
  {
    id v10 = +[MailSceneLifecycleController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v9;
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      id v14 = [v11 session];
      v15 = [v14 persistentIdentifier];
      v16 = +[NSString stringWithFormat:@"%@:%@", v13, v15];

      *(_DWORD *)buf = 138543618;
      v19 = v16;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "scene: %{public}@ willContinueUserActivityWithType: %@", buf, 0x16u);
    }
    [v9 mailSceneWillContinueUserActivityWithType:v8];
  }
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v7 conformsToProtocol:&OBJC_PROTOCOL___MailSceneLifecycleResponder] & 1) == 0)
  {
    __int16 v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"MailSceneLifecycleController.m" lineNumber:146 description:@"Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."];
  }
  id v9 = v7;
  if (objc_opt_respondsToSelector())
  {
    id v10 = +[MailSceneLifecycleController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v9;
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      id v14 = [v11 session];
      v15 = [v14 persistentIdentifier];
      v16 = +[NSString stringWithFormat:@"%@:%@", v13, v15];

      id v17 = v16;
      v18 = [v8 activityType];
      v19 = [v8 targetContentIdentifier];
      *(_DWORD *)buf = 138543874;
      id v22 = v17;
      __int16 v23 = 2112;
      v24 = v18;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "scene: %{public}@ continueUserActivity: %@, identifier: %@", buf, 0x20u);
    }
    [v9 mailSceneContinueUserActivity:v8];
  }
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v9 conformsToProtocol:&OBJC_PROTOCOL___MailSceneLifecycleResponder] & 1) == 0)
  {
    id v22 = +[NSAssertionHandler currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"MailSceneLifecycleController.m" lineNumber:155 description:@"Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."];
  }
  id v12 = v9;
  if (objc_opt_respondsToSelector())
  {
    id v13 = +[MailSceneLifecycleController log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = v12;
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      id v17 = [v14 session];
      v18 = [v17 persistentIdentifier];
      v19 = +[NSString stringWithFormat:@"%@:%@", v16, v18];

      id v20 = v19;
      id v21 = [v11 ef_publicDescription];
      *(_DWORD *)buf = 138543874;
      id v24 = v20;
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2114;
      v28 = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "scene: %{public}@ didFailToContinueUserActivityWithType: %@ error: %{public}@", buf, 0x20u);
    }
    [v12 mailSceneDidFailToContinueUserActivityWithType:v10 error:v11];
  }
}

- (void)scene:(id)a3 didUpdateUserActivity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v7 conformsToProtocol:&OBJC_PROTOCOL___MailSceneLifecycleResponder] & 1) == 0)
  {
    id v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MailSceneLifecycleController.m" lineNumber:164 description:@"Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."];
  }
  id v9 = v7;
  if (objc_opt_respondsToSelector())
  {
    id v10 = +[MailSceneLifecycleController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v9;
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      id v14 = [v11 session];
      v15 = [v14 persistentIdentifier];
      v16 = +[NSString stringWithFormat:@"%@:%@", v13, v15];

      *(_DWORD *)buf = 138543618;
      v19 = v16;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "scene: %{public}@ didUpdateUserActivity: %@", buf, 0x16u);
    }
    [v9 mailSceneDidUpdateUserActivity:v8];
  }
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v7 conformsToProtocol:&OBJC_PROTOCOL___MailSceneLifecycleResponder] & 1) == 0)
  {
    id v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MailSceneLifecycleController.m" lineNumber:175 description:@"Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."];
  }
  id v9 = v7;
  if (objc_opt_respondsToSelector())
  {
    id v10 = +[MailSceneLifecycleController log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = v9;
      id v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      id v14 = [v11 session];
      v15 = [v14 persistentIdentifier];
      v16 = +[NSString stringWithFormat:@"%@:%@", v13, v15];

      *(_DWORD *)buf = 138543618;
      v19 = v16;
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "scene: %{public}@ openURLContexts: %@", buf, 0x16u);
    }
    [v9 mailSceneOpenURLContexts:v8];
  }
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v9 conformsToProtocol:&OBJC_PROTOCOL___MailSceneLifecycleResponder] & 1) == 0)
  {
    __int16 v20 = +[NSAssertionHandler currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"MailSceneLifecycleController.m" lineNumber:186 description:@"Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."];
  }
  id v12 = v9;
  if (objc_opt_respondsToSelector())
  {
    id v13 = +[MailSceneLifecycleController log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = v12;
      v15 = (objc_class *)objc_opt_class();
      v16 = NSStringFromClass(v15);
      id v17 = [v14 session];
      v18 = [v17 persistentIdentifier];
      v19 = +[NSString stringWithFormat:@"%@:%@", v16, v18];

      *(_DWORD *)buf = 138543618;
      id v22 = v19;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "windowScene: %{public}@ performActionForShortcutItems: %@", buf, 0x16u);
    }
    [v12 mailScenePerformActionForShortcutItem:v10 completionHandler:v11];
  }
}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v5 conformsToProtocol:&OBJC_PROTOCOL___MailSceneLifecycleResponder] & 1) == 0)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"MailSceneLifecycleController.m" lineNumber:196 description:@"Scenes used with MailSceneLifecycleController should be instances of MailScene subclasses."];
  }
  id v6 = v5;
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 stateRestorationActivityForMailScene];
    id v8 = +[MailSceneLifecycleController log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = v6;
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      id v12 = [v9 session];
      id v13 = [v12 persistentIdentifier];
      id v14 = +[NSString stringWithFormat:@"%@:%@", v11, v13];

      *(_DWORD *)buf = 138543362;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "stateRestorationActivityForScene: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferredConnectionOptions, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end