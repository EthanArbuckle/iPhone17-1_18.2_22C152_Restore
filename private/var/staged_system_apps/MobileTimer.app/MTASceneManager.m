@interface MTASceneManager
- (MTASceneDelegate)delegate;
- (MTASceneManager)init;
- (void)scene:(id)a3 continueUserActivity:(id)a4;
- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5;
- (void)scene:(id)a3 openURLContexts:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setDelegate:(id)a3;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation MTASceneManager

- (MTASceneDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTASceneDelegate *)WeakRetained;
}

- (MTASceneManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MTASceneManager;
  v2 = [(MTASceneManager *)&v6 init];
  if (v2)
  {
    v3 = +[UIApplication sharedApplication];
    v4 = [v3 delegate];
    [(MTASceneManager *)v2 setDelegate:v4];
  }
  return v2;
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ sceneDidBecomeActive", (uint8_t *)&v7, 0xCu);
  }

  objc_super v6 = [(MTASceneManager *)self delegate];
  [v6 sceneDidBecomeActive:v4];
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ sceneWillEnterForeground", (uint8_t *)&v10, 0xCu);
  }

  objc_super v6 = [v4 session];
  int v7 = [v6 role];
  unsigned int v8 = [v7 isEqualToString:UIWindowSceneSessionRoleApplication];

  if (v8)
  {
    v9 = [(MTASceneManager *)self delegate];
    [v9 sceneWillEnterForeground:v4];
  }
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = MTLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v26 = 138543362;
    v27 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ willConnectToSession", (uint8_t *)&v26, 0xCu);
  }

  v12 = [v10 role];

  unsigned int v13 = [v12 isEqualToString:UIWindowSceneSessionRoleApplication];
  if (v13)
  {
    id v14 = v8;
    v15 = [(MTASceneManager *)self delegate];
    [v15 windowSceneWillConnect:v14];

    v16 = [v9 URLContexts];
    id v17 = [v16 count];

    if (v17)
    {
      v18 = [v9 URLContexts];
      [(MTASceneManager *)self scene:v14 openURLContexts:v18];
    }
    v19 = [v9 shortcutItem];

    if (v19)
    {
      v20 = [v9 shortcutItem];
      [(MTASceneManager *)self windowScene:v14 performActionForShortcutItem:v20 completionHandler:&stru_1000A2078];
    }
    v21 = [v9 userActivities];
    id v22 = [v21 count];

    if (v22)
    {
      v23 = [v9 userActivities];
      v24 = [v23 anyObject];

      v25 = [v24 activityType];
      [(MTASceneManager *)self scene:v14 willContinueUserActivityWithType:v25];

      [(MTASceneManager *)self scene:v14 continueUserActivity:v24];
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ sceneDidEnterBackground", (uint8_t *)&v7, 0xCu);
  }

  objc_super v6 = [(MTASceneManager *)self delegate];
  [v6 sceneDidEnterBackground:v4];
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = MTLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ performActionForShortcutItem", (uint8_t *)&v13, 0xCu);
  }

  v12 = [(MTASceneManager *)self delegate];
  [v12 windowScene:v10 performActionForShortcutItem:v9 completionHandler:v8];
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = MTLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ willContinueUserActivityWithType", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(MTASceneManager *)self delegate];
  [v9 scene:v7 willContinueUserActivityWithType:v6];
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = MTLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ continueUserActivity", (uint8_t *)&v10, 0xCu);
  }

  id v9 = [(MTASceneManager *)self delegate];
  [v9 scene:v7 continueUserActivity:v6];
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = MTLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138543362;
    id v14 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ didFailToContinueUserActivityWithType", (uint8_t *)&v13, 0xCu);
  }

  v12 = [(MTASceneManager *)self delegate];
  [v12 scene:v10 didFailToContinueUserActivityWithType:v9 error:v8];
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = MTLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138543618;
    v16 = self;
    __int16 v17 = 2114;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ openURLContexts: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  id v9 = [v7 allObjects];
  id v10 = [v9 firstObject];

  if (v10)
  {
    v11 = [(MTASceneManager *)self delegate];
    v12 = [v10 URL];
    int v13 = [v10 options];
    id v14 = [v13 sourceApplication];
    [v11 scene:v6 openURL:v12 sourceApplication:v14];
  }
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  v5 = MTLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ sceneWillResignActive", (uint8_t *)&v7, 0xCu);
  }

  id v6 = [(MTASceneManager *)self delegate];
  [v6 sceneWillResignActive:v4];
}

- (void).cxx_destruct
{
}

@end