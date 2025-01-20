@interface LockScreenSceneDelegate
- (PlatformController)platformController;
- (UIWindow)lockScreenWindow;
- (id)appSessionController;
- (void)mapsAppCoordinatorWillEndLockscreenSession;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)setLockScreenWindow:(id)a3;
- (void)setPlatformController:(id)a3;
@end

@implementation LockScreenSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v8;
  v12 = sub_1000A930C();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = [v11 description];
    *(_DWORD *)buf = 138412802;
    id v51 = v13;
    __int16 v52 = 2112;
    id v53 = v9;
    __int16 v54 = 2112;
    id v55 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[LockScreenSceneDelegate] -scene:willConnectToSession:withOptions: %@, %@, %@", buf, 0x20u);
  }
  v14 = [(LockScreenSceneDelegate *)self appSessionController];
  v15 = [v14 currentlyNavigatingPlatformController];

  if (v15)
  {
    v16 = [(LockScreenSceneDelegate *)self appSessionController];
    v17 = [v16 currentlyNavigatingPlatformController];
    [(LockScreenSceneDelegate *)self setPlatformController:v17];

    v18 = [(LockScreenSceneDelegate *)self appSessionController];
    v19 = [v18 activeiOSPlatformControllersToCoverSheetSceneAssociation];
    v20 = [(LockScreenSceneDelegate *)self platformController];
    v21 = [v19 objectForKey:v20];

    [v21 setLockScreenScene:v11];
    v22 = [v21 mapsScene];
    v23 = [v22 delegate];

    v24 = [v23 chromeViewController];
    if ([v24 willMoveToOrFromSecureLockScreenUI:1])
    {
      v25 = [(LockScreenSceneDelegate *)self lockScreenWindow];

      if (!v25)
      {
        v26 = sub_1000A930C();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v51 = v11;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Created lockScreenWindow for %@", buf, 0xCu);
        }

        v27 = [[LockScreenSecureWindow alloc] initWithWindowScene:v11];
        [(LockScreenSceneDelegate *)self setLockScreenWindow:v27];
      }
      v28 = sub_1000A930C();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Attaching to lock screen window", buf, 2u);
      }

      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_1005C6EE8;
      v45[3] = &unk_1012E66E0;
      v46 = v23;
      v47 = self;
      id v29 = v24;
      id v48 = v29;
      +[UIViewController _performWithoutDeferringTransitions:v45];
      v30 = [(LockScreenSceneDelegate *)self lockScreenWindow];
      [v30 makeKeyAndVisible];

      [v29 didMoveToOrFromSecureLockScreenUI:1];
      v31 = [(LockScreenSceneDelegate *)self platformController];
      v32 = [(LockScreenSceneDelegate *)self appSessionController];
      v33 = [v32 primaryPlatformController];

      if (v31 == v33)
      {
        v34 = [(LockScreenSceneDelegate *)self platformController];
        [v34 replaySessions];
      }
      if (!self->_blsAssertion)
      {
        v44 = [v11 _FBSScene];
        v35 = +[BLSRequestLiveUpdatingAttribute requestLiveUpdatingForFBSScene:v44];
        v49[0] = v35;
        v36 = +[BLSValidWhenBacklightInactiveAttribute ignoreWhenBacklightInactivates];
        v49[1] = v36;
        +[NSArray arrayWithObjects:v49 count:2];
        id v37 = v10;
        v39 = id v38 = v9;
        v40 = +[BLSAssertion acquireWithExplanation:@"Acquiring BLSAssertion for live updates" observer:0 attributes:v39];
        blsAssertion = self->_blsAssertion;
        self->_blsAssertion = v40;

        id v9 = v38;
        id v10 = v37;
      }
      v42 = sub_1000A930C();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Connected to secure lock screen window", buf, 2u);
      }

      v43 = v46;
    }
    else
    {
      v43 = sub_1000A930C();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v51 = v24;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Failed to prepare to run on the secure window: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v21 = sub_1000A930C();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failing to connect due to there not being a currently navigating platform controller", buf, 2u);
    }
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  v5 = sub_1000A930C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = [v4 description];
    *(_DWORD *)buf = 138412290;
    v31 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[LockScreenSceneDelegate] -sceneDidDisconnect: %@", buf, 0xCu);
  }
  uint64_t v7 = [(LockScreenSceneDelegate *)self lockScreenWindow];
  if (v7)
  {
    id v8 = (void *)v7;
    id v9 = [v4 screen];
    id v10 = [v9 displayIdentity];
    unsigned int v11 = [v10 expectsSecureRendering];

    if (v11)
    {
      v12 = [(LockScreenSceneDelegate *)self appSessionController];
      v13 = [v12 activeiOSPlatformControllersToCoverSheetSceneAssociation];
      v14 = [(LockScreenSceneDelegate *)self platformController];
      v15 = [v13 objectForKey:v14];

      v16 = [v15 mapsScene];
      v17 = [v16 delegate];

      v18 = [v17 chromeViewController];
      [v18 willMoveToOrFromSecureLockScreenUI:0];
      v19 = [(LockScreenSceneDelegate *)self lockScreenWindow];
      [v19 setHidden:1];

      v20 = sub_1000A930C();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Detaching from lock screen window", buf, 2u);
      }

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1005C7270;
      v27[3] = &unk_1012E66E0;
      v27[4] = self;
      id v21 = v17;
      id v28 = v21;
      id v22 = v18;
      id v29 = v22;
      +[UIViewController _performWithoutDeferringTransitions:v27];
      v23 = [v21 window];
      [v23 makeKeyAndVisible];

      [v22 didMoveToOrFromSecureLockScreenUI:0];
      v24 = sub_1000A930C();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Disconnected from secure lock screen window", buf, 2u);
      }
    }
  }
  blsAssertion = self->_blsAssertion;
  if (blsAssertion)
  {
    [(BLSAssertion *)blsAssertion invalidate];
    v26 = self->_blsAssertion;
    self->_blsAssertion = 0;
  }
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000A930C();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [v3 description];
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[LockScreenSceneDelegate] sceneDidBecomeActive: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (id)appSessionController
{
  v2 = +[UIApplication sharedMapsDelegate];
  id v3 = [v2 appSessionController];

  return v3;
}

- (void)mapsAppCoordinatorWillEndLockscreenSession
{
  id v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[LockScreenSceneDelegate] screenshotting tearing down lockscreen content", buf, 2u);
  }

  id v4 = [(LockScreenSceneDelegate *)self lockScreenWindow];
  v5 = [v4 snapshotViewAfterScreenUpdates:0];

  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  unsigned int v11 = sub_1005C75D4;
  v12 = &unk_1012E5D58;
  v13 = self;
  int v6 = [[FullscreenImageViewController alloc] initWithView:v5 scrollable:0];
  v14 = v6;
  +[UIViewController _performWithoutDeferringTransitions:&v9];
  uint64_t v7 = sub_1000A930C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [(LockScreenSceneDelegate *)self lockScreenWindow];
    *(_DWORD *)buf = 138412802;
    v16 = v5;
    __int16 v17 = 2112;
    v18 = v6;
    __int16 v19 = 2112;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[LockScreenSceneDelegate] setup screenshot: %@ hosted by: %@ in window: %@", buf, 0x20u);
  }
}

- (UIWindow)lockScreenWindow
{
  return self->_lockScreenWindow;
}

- (void)setLockScreenWindow:(id)a3
{
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (void)setPlatformController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_lockScreenWindow, 0);

  objc_storeStrong((id *)&self->_blsAssertion, 0);
}

@end