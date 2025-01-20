@interface RCPlatterSceneDelegate
- (BOOL)isInAndromeda;
- (RCPlatterViewController)platterViewController;
- (RCPlatterViewControllerCoordinator)platterViewControllerCoordinator;
- (VMAudioService)audioService;
- (id)_mainViewController;
- (id)_recorderAppDelegate;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setAudioService:(id)a3;
- (void)setBackgroundTintColorForScene:(id)a3;
- (void)setPlatterViewController:(id)a3;
- (void)setPlatterViewControllerCoordinator:(id)a3;
- (void)setResolvedMetricsForScene:(id)a3;
@end

@implementation RCPlatterSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    v8 = objc_alloc_init(RCPlatterViewControllerCoordinator);
    platterViewControllerCoordinator = self->_platterViewControllerCoordinator;
    self->_platterViewControllerCoordinator = v8;

    v10 = +[VMAudioService sharedInstance];
    audioService = self->_audioService;
    self->_audioService = v10;

    v12 = [(VMAudioService *)self->_audioService recordingController];

    if (v12)
    {
      unsigned int v13 = [v7 SBUI_isHostedBySystemAperture];
      unsigned int v14 = v13;
      if (self->_platterViewController)
      {
        if (v13)
        {
LABEL_5:
          [v7 setSystemApertureElementViewControllerProvider:self->_platterViewController];
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        v16 = [(RCPlatterSceneDelegate *)self _mainViewController];
        v17 = [v16 platterViewControllerForPresentationStyle:v14 ^ 1];
        platterViewController = self->_platterViewController;
        self->_platterViewController = v17;

        [(RCPlatterViewController *)self->_platterViewController setDelegate:self->_platterViewControllerCoordinator];
        if (v14) {
          goto LABEL_5;
        }
      }
      [(RCPlatterSceneDelegate *)self setResolvedMetricsForScene:v7];
      [(RCPlatterSceneDelegate *)self setBackgroundTintColorForScene:v7];
      id v19 = [objc_alloc((Class)UIWindow) initWithWindowScene:v7];
      [(RCSceneDelegate *)self setWindow:v19];

      v20 = [(RCSceneDelegate *)self window];
      [v20 setRootViewController:self->_platterViewController];

      v15 = [(RCSceneDelegate *)self window];
      [v15 makeKeyAndVisible];
    }
    else
    {
      v15 = OSLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        sub_10016C978(v15);
      }
    }

    goto LABEL_11;
  }
LABEL_12:
}

- (BOOL)isInAndromeda
{
  unsigned int v3 = [(RCPlatterViewController *)self->_platterViewController isViewLoaded];
  if (v3)
  {
    v4 = [(RCPlatterViewController *)self->_platterViewController view];
    v5 = [v4 window];
    id v6 = [v5 windowScene];
    id v7 = [v6 traitCollection];
    unsigned __int8 v8 = [v7 isInAndromeda];

    LOBYTE(v3) = v8;
  }
  return v3;
}

- (id)_recorderAppDelegate
{
  v2 = +[UIApplication sharedApplication];
  unsigned int v3 = [v2 delegate];

  return v3;
}

- (id)_mainViewController
{
  v2 = [(RCPlatterSceneDelegate *)self _recorderAppDelegate];
  unsigned int v3 = [v2 defaultSceneDelegate];
  v4 = [v3 mainViewController];

  return v4;
}

- (RCPlatterViewController)platterViewController
{
  return self->_platterViewController;
}

- (void)setPlatterViewController:(id)a3
{
}

- (RCPlatterViewControllerCoordinator)platterViewControllerCoordinator
{
  return self->_platterViewControllerCoordinator;
}

- (void)setPlatterViewControllerCoordinator:(id)a3
{
}

- (VMAudioService)audioService
{
  return self->_audioService;
}

- (void)setAudioService:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioService, 0);
  objc_storeStrong((id *)&self->_platterViewControllerCoordinator, 0);

  objc_storeStrong((id *)&self->_platterViewController, 0);
}

- (void)setResolvedMetricsForScene:(id)a3
{
  type metadata accessor for ActivityScene();
  if (swift_dynamicCastClass())
  {
    v5 = self;
    id v6 = a3;
    id v7 = self;
    id v9 = [v5 sharedStyleProvider];
    [v9 bannerSize];
    [v9 bannerCornerRadius];
    id v8 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics());
    ActivitySceneMetrics.init(size:cornerRadius:)();
    dispatch thunk of ActivityScene.resolvedMetrics.setter();
  }
}

- (void)setBackgroundTintColorForScene:(id)a3
{
  type metadata accessor for ActivityScene();
  if (swift_dynamicCastClass())
  {
    v5 = self;
    id v6 = a3;
    id v7 = self;
    id v9 = [v5 sharedStyleProvider];
    id v8 = [v9 bannerBackgroundColor];
    dispatch thunk of ActivityScene.backgroundTintColor.setter();
  }
}

@end