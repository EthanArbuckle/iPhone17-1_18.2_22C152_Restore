@interface MacPlacePhotoViewerScene
+ (MacPlacePhotoViewerScene)sharedInstance;
+ (id)requestSceneActivation;
+ (void)teardownCurrentScene;
- (MacPlacePhotoViewerRootViewController)rootViewController;
- (MacPlacePhotoViewerScene)init;
- (MacPlacePhotoViewerSceneDelegate)delegate;
- (NSString)sceneTitle;
- (UIViewController)topmostViewController;
- (UIWindow)window;
- (void)_destroyCurrentSceneIfNeeded;
- (void)_presentSceneWithRootViewController:(id)a3 delegate:(id)a4;
- (void)openPhotoGalleryWithConfiguration:(id)a3 sceneDelegate:(id)a4 delegate:(id)a5;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidDisconnect:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRootViewController:(id)a3;
- (void)setWindow:(id)a3;
@end

@implementation MacPlacePhotoViewerScene

+ (MacPlacePhotoViewerScene)sharedInstance
{
  if (qword_10160F218 != -1) {
    dispatch_once(&qword_10160F218, &stru_1012F1548);
  }
  v2 = (void *)qword_10160F210;

  return (MacPlacePhotoViewerScene *)v2;
}

- (MacPlacePhotoViewerScene)init
{
  v6.receiver = self;
  v6.super_class = (Class)MacPlacePhotoViewerScene;
  v2 = [(MacPlacePhotoViewerScene *)&v6 init];
  if (v2)
  {
    v3 = [[MacPlacePhotoViewerRootViewController alloc] initWithNibName:0 bundle:0];
    rootViewController = v2->_rootViewController;
    v2->_rootViewController = v3;
  }
  return v2;
}

+ (id)requestSceneActivation
{
  v2 = +[MacPlacePhotoViewerScene sharedInstance];
  [v2 _destroyCurrentSceneIfNeeded];

  return v2;
}

+ (void)teardownCurrentScene
{
  id v2 = +[MacPlacePhotoViewerScene sharedInstance];
  [v2 _destroyCurrentSceneIfNeeded];
}

- (void)openPhotoGalleryWithConfiguration:(id)a3 sceneDelegate:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_1000A930C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[MacPlacePhotoViewerScene] -openPhotoGalleryWithConfiguration:sceneDelegate:delegate: %@, %@, %@", (uint8_t *)&v13, 0x20u);
  }

  v12 = [[MacPlacePhotoViewerRootViewController alloc] initWithConfiguration:v8 sceneDelegate:v9];
  [(MacPlacePhotoViewerScene *)self _presentSceneWithRootViewController:v12 delegate:v10];
}

- (void)_presentSceneWithRootViewController:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  [(MacPlacePhotoViewerScene *)self setRootViewController:a3];
  v7 = [(MacPlacePhotoViewerScene *)self rootViewController];
  [v7 setDelegate:self];

  [(MacPlacePhotoViewerScene *)self setDelegate:v6];
  id v10 = [objc_alloc((Class)NSUserActivity) initWithActivityType:@"com.apple.Maps.MacPlacePhotoViewer"];
  [v10 setEligibleForHandoff:0];
  id v8 = objc_alloc_init((Class)UISceneActivationRequestOptions);
  id v9 = +[UIApplication sharedApplication];
  [v9 requestSceneSessionActivation:0 userActivity:v10 options:v8 errorHandler:0];
}

- (void)_destroyCurrentSceneIfNeeded
{
  v3 = sub_1000A930C();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[MacPlacePhotoViewerScene] -_destroyCurrentSceneIfNeeded", v9, 2u);
  }

  if (qword_10160F208)
  {
    v4 = [(MacPlacePhotoViewerScene *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(MacPlacePhotoViewerScene *)self delegate];
      [v6 placePhotoViewerSceneWillDisconnect:self];
    }
    v7 = +[UIApplication sharedApplication];
    [v7 requestSceneSessionDestruction:qword_10160F208 options:0 errorHandler:0];

    id v8 = (void *)qword_10160F208;
    qword_10160F208 = 0;
  }
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_1000A930C();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = [v8 description];
    int v21 = 138412802;
    v22 = v12;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[MacPlacePhotoViewerScene] -scene:willConnectToSession:withOptions: %@, %@, %@", (uint8_t *)&v21, 0x20u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v8;
    id v14 = [v13 sizeRestrictions];
    [v14 setMinimumSize:800.0, 600.0];

    __int16 v15 = [v13 sizeRestrictions];
    [v15 setMaximumSize:800.0, 600.0];

    id v16 = +[MacPlacePhotoViewerScene sharedInstance];
    __int16 v17 = (UIWindow *)[objc_alloc((Class)UIWindow) initWithWindowScene:v13];
    window = self->_window;
    self->_window = v17;

    v19 = [v16 rootViewController];
    [(UIWindow *)self->_window setRootViewController:v19];

    [(UIWindow *)self->_window setHidden:0];
    v20 = [v16 sceneTitle];
    [v13 setTitle:v20];

    objc_storeStrong((id *)&qword_10160F208, a4);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v21) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: [scene isKindOfClass:[UIWindowScene class]]", (uint8_t *)&v21, 2u);
  }
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  char v5 = sub_1000A930C();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v4 description];
    int v11 = 138412290;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[MacPlacePhotoViewerScene] -sceneDidDisconnect: %@", (uint8_t *)&v11, 0xCu);
  }
  [(MacPlacePhotoViewerScene *)self setWindow:0];
  v7 = (void *)qword_10160F208;
  qword_10160F208 = 0;

  id v8 = [(MacPlacePhotoViewerScene *)self delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(MacPlacePhotoViewerScene *)self delegate];
    [v10 placePhotoViewerSceneWillDisconnect:self];
  }
}

- (UIViewController)topmostViewController
{
  id v2 = [(MacPlacePhotoViewerScene *)self rootViewController];
  v3 = [v2 topmostViewController];

  return (UIViewController *)v3;
}

- (NSString)sceneTitle
{
  id v2 = [(MacPlacePhotoViewerRootViewController *)self->_rootViewController configuration];
  v3 = [v2 mapItem];
  id v4 = [v3 name];

  return (NSString *)v4;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (MacPlacePhotoViewerRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)setRootViewController:(id)a3
{
}

- (MacPlacePhotoViewerSceneDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MacPlacePhotoViewerSceneDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rootViewController, 0);

  objc_storeStrong((id *)&self->_window, 0);
}

@end