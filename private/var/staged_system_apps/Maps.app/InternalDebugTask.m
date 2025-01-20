@interface InternalDebugTask
+ (int64_t)creationPreference;
- (InternalDebugTask)init;
- (void)_presentationControllerDismissalTransitionDidEndNotification:(id)a3;
- (void)_presentationControllerDismissalTransitionWillBeginNotification:(id)a3;
- (void)_presentationControllerPresentationTransitionDidEndNotification:(id)a3;
- (void)_presentationControllerPresentationTransitionWillBeginNotification:(id)a3;
- (void)_screenshotTakenNotification:(id)a3;
@end

@implementation InternalDebugTask

+ (int64_t)creationPreference
{
  return 2;
}

- (InternalDebugTask)init
{
  v29.receiver = self;
  v29.super_class = (Class)InternalDebugTask;
  v2 = [(InternalDebugTask *)&v29 init];
  if (v2)
  {
    if (+[DebugViewFrameHighlighter shouldHighlightOnLaunch])
    {
      +[DebugViewFrameHighlighter setFrameHighlightingEnabled:1];
    }
    if (+[MapsARSessionIndoorOutdoorFloatingDebugViewController shouldAttachOnLaunch])
    {
      v3 = +[MapsARSessionIndoorOutdoorFloatingDebugViewController sharedInstance];
      [v3 attach];
    }
    if (+[ThermalStateFloatingDebugViewController shouldAttachOnLaunch])
    {
      v4 = +[ThermalStateFloatingDebugViewController sharedInstance];
      [v4 attach];
    }
    if (+[VectorKitFloatingDebugViewController shouldAttachOnLaunch])
    {
      v5 = +[VectorKitFloatingDebugViewController sharedInstance];
      [v5 attach];
    }
    if (+[VLFSessionStateFloatingDebugViewController shouldAttachOnLaunch])
    {
      v6 = +[VLFSessionStateFloatingDebugViewController sharedInstance];
      [v6 attach];
    }
    if (+[VIOSessionStateFloatingDebugViewController shouldAttachOnLaunch])
    {
      v7 = +[VIOSessionStateFloatingDebugViewController sharedInstance];
      [v7 attach];
    }
    if (+[PedestrianARFloatingDebugViewController shouldAttachOnLaunch])
    {
      v8 = +[PedestrianARFloatingDebugViewController sharedInstance];
      [v8 attach];
    }
    v9 = +[NSUserDefaults standardUserDefaults];
    unsigned int v10 = [v9 BOOLForKey:@"PedestrianARViewControllerTemporarilyEnableVLTraceRecordingKey"];

    if (v10)
    {
      v11 = +[NSUserDefaults standardUserDefaults];
      [v11 removeObjectForKey:@"PedestrianARViewControllerTemporarilyEnableVLTraceRecordingKey"];

      GEOConfigSetBOOL();
    }
    v12 = +[NSUserDefaults standardUserDefaults];
    unsigned int v13 = [v12 BOOLForKey:off_1015DF058];

    if (v13)
    {
      v14 = +[NSUserDefaults standardUserDefaults];
      [v14 removeObjectForKey:@"__internal_VisualizeChromeLayoutGuidesDebug"];

      v15 = +[NSUserDefaults standardUserDefaults];
      [v15 removeObjectForKey:off_1015DF058];
    }
    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v2 selector:"_screenshotTakenNotification:" name:UIApplicationUserDidTakeScreenshotNotification object:0];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v2 selector:"_presentationControllerPresentationTransitionWillBeginNotification:" name:UIPresentationControllerPresentationTransitionWillBeginNotification object:0];

    v18 = +[NSNotificationCenter defaultCenter];
    [v18 addObserver:v2 selector:"_presentationControllerPresentationTransitionDidEndNotification:" name:UIPresentationControllerPresentationTransitionDidEndNotification object:0];

    v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v2 selector:"_presentationControllerDismissalTransitionWillBeginNotification:" name:UIPresentationControllerDismissalTransitionWillBeginNotification object:0];

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v2 selector:"_presentationControllerDismissalTransitionDidEndNotification:" name:UIPresentationControllerDismissalTransitionDidEndNotification object:0];

    v21 = +[NSUserDefaults standardUserDefaults];
    if (![v21 BOOLForKey:@"EnableRootInstallationFailureAlert"]) {
      goto LABEL_23;
    }
    v22 = +[NSFileManager defaultManager];
    unsigned int v23 = [v22 fileExistsAtPath:@"/var/staged_system_apps/Maps.app" isDirectory:0];

    if (v23)
    {
      v21 = +[UIAlertController alertControllerWithTitle:@"Possible root installation failure" message:@"Maps.app was found in /var/staged_system_apps. This usually means a root installation did not succeed. Try running \"mobile_install installStaged\"" preferredStyle:1];
      v24 = +[UIAlertAction actionWithTitle:@"OK" style:0 handler:0];
      [v21 addAction:v24];

      v25 = +[MapsInternalAlertPresentationController sharedInstance];
      v26 = +[UIApplication _maps_keyMapsWindow];
      v27 = [v26 windowScene];
      [v25 presentAlertController:v21 fromWindowScene:v27];

LABEL_23:
    }
  }
  return v2;
}

- (void)_screenshotTakenNotification:(id)a3
{
  v3 = sub_10057637C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v4 = +[UIApplication _maps_isAnySceneForegroundForRole:UIWindowSceneSessionRoleApplication];
    v5 = @"NO";
    if (v4) {
      v5 = @"YES";
    }
    v6 = v5;
    int v7 = 138543362;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Screenshot taken with Maps app foreground: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)_presentationControllerPresentationTransitionWillBeginNotification:(id)a3
{
  id v3 = a3;
  unsigned int v4 = sub_10057637C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 object];
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "UIViewController will be presented: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_presentationControllerPresentationTransitionDidEndNotification:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 userInfo];
  v5 = [v4 objectForKey:UIPresentationControllerPresentationTransitionDidEndCompletedKey];
  unsigned int v6 = [v5 BOOLValue];

  int v7 = sub_10057637C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v3 object];
    v9 = @"NO";
    if (v6) {
      v9 = @"YES";
    }
    unsigned int v10 = v9;
    int v11 = 138543618;
    v12 = v8;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "UIViewController was presented: %{public}@, completed: %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

- (void)_presentationControllerDismissalTransitionWillBeginNotification:(id)a3
{
  id v3 = a3;
  unsigned int v4 = sub_10057637C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 object];
    int v6 = 138543362;
    int v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "UIViewController will be dismissed: %{public}@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_presentationControllerDismissalTransitionDidEndNotification:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 userInfo];
  v5 = [v4 objectForKey:UIPresentationControllerDismissalTransitionDidEndCompletedKey];
  unsigned int v6 = [v5 BOOLValue];

  int v7 = sub_10057637C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v3 object];
    v9 = @"NO";
    if (v6) {
      v9 = @"YES";
    }
    unsigned int v10 = v9;
    int v11 = 138543618;
    v12 = v8;
    __int16 v13 = 2114;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "UIViewController was dismissed: %{public}@, completed: %{public}@", (uint8_t *)&v11, 0x16u);
  }
}

@end