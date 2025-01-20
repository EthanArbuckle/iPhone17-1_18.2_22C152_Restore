@interface RCLockScreenSceneDelegate
- (BOOL)isActive;
- (BOOL)isAnimatingBackgroundColor;
- (BOOL)lockscreenWillDismissAfterRecording;
- (RCLockScreenCoordinator)lockScreenCoordinator;
- (RCLockScreenRecordingViewController)lockScreenRecordingViewController;
- (id)_mainViewController;
- (id)backgroundColorAnimation;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setLockScreenCoordinator:(id)a3;
- (void)setLockScreenRecordingViewController:(id)a3;
@end

@implementation RCLockScreenSceneDelegate

- (BOOL)isActive
{
  v2 = [(RCSceneDelegate *)self window];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isAnimatingBackgroundColor
{
  v2 = [(RCLockScreenSceneDelegate *)self backgroundColorAnimation];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)backgroundColorAnimation
{
  v2 = [(RCSceneDelegate *)self window];
  BOOL v3 = [v2 rootViewController];
  v4 = [v3 view];
  v5 = [v4 layer];
  v6 = [v5 animationForKey:@"backgroundColor"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = v6;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v27 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = objc_alloc_init(RCLockScreenCoordinator);
    lockScreenCoordinator = self->_lockScreenCoordinator;
    self->_lockScreenCoordinator = v6;

    id v8 = v27;
    v9 = [v8 screen];
    v10 = +[VMAudioService sharedInstance];
    v11 = [v10 recordingController];

    v12 = [v9 displayIdentity];
    unsigned int v13 = [v12 expectsSecureRendering];

    if (v13 && v11)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);

      if (!WeakRetained)
      {
        v15 = [(RCLockScreenSceneDelegate *)self _mainViewController];
        v16 = [v15 lockScreenRecordingViewController];
        objc_storeWeak((id *)&self->_lockScreenRecordingViewController, v16);

        v17 = self->_lockScreenCoordinator;
        id v18 = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
        [v18 setDelegate:v17];
      }
      v19 = [(RCSceneDelegate *)self window];

      if (!v19)
      {
        id v20 = [objc_alloc((Class)SBFSecureWindow) initWithWindowScene:v8];
        [(RCSceneDelegate *)self setWindow:v20];
      }
      uint64_t v21 = [(RCSceneDelegate *)self window];
      id v22 = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);
      [(id)v21 setRootViewController:v22];

      v23 = [(RCSceneDelegate *)self window];
      [v23 makeKeyAndVisible];

      v24 = +[RCRecorderStyleProvider sharedStyleProvider];
      LOBYTE(v21) = [v24 supportsLockScreenRotation];

      if ((v21 & 1) == 0)
      {
        v25 = [(RCSceneDelegate *)self window];
        [v25 setAccessibilityViewIsModal:1];

        LODWORD(v25) = UIAccessibilityScreenChangedNotification;
        v26 = [(RCSceneDelegate *)self window];
        UIAccessibilityPostNotification((UIAccessibilityNotifications)v25, v26);
      }
    }
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v14 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v5 = v14;
  if (isKindOfClass)
  {
    id v6 = v14;
    id v7 = [v6 screen];
    uint64_t v8 = [(RCSceneDelegate *)self window];
    if (v8)
    {
      v9 = (void *)v8;
      v10 = [v7 displayIdentity];
      unsigned int v11 = [v10 expectsSecureRendering];

      if (v11)
      {
        v12 = [(RCSceneDelegate *)self window];
        [v12 setHidden:1];

        unsigned int v13 = [(RCSceneDelegate *)self window];
        [v13 setRootViewController:0];

        [(RCSceneDelegate *)self setWindow:0];
      }
    }

    v5 = v14;
  }
}

- (BOOL)lockscreenWillDismissAfterRecording
{
  return [(RCLockScreenCoordinator *)self->_lockScreenCoordinator lockscreenWillDismissAfterRecording];
}

- (id)_mainViewController
{
  v2 = +[UIApplication sharedApplication];
  BOOL v3 = [v2 delegate];

  v4 = [v3 defaultSceneDelegate];
  v5 = [v4 mainViewController];

  return v5;
}

- (RCLockScreenRecordingViewController)lockScreenRecordingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockScreenRecordingViewController);

  return (RCLockScreenRecordingViewController *)WeakRetained;
}

- (void)setLockScreenRecordingViewController:(id)a3
{
}

- (RCLockScreenCoordinator)lockScreenCoordinator
{
  return self->_lockScreenCoordinator;
}

- (void)setLockScreenCoordinator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenCoordinator, 0);

  objc_destroyWeak((id *)&self->_lockScreenRecordingViewController);
}

@end