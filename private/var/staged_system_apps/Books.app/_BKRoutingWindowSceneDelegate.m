@interface _BKRoutingWindowSceneDelegate
- (BKPrimarySceneControlling)sceneController;
- (id)stateRestorationActivityForScene:(id)a3;
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
- (void)setSceneController:(id)a3;
- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6;
- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5;
@end

@implementation _BKRoutingWindowSceneDelegate

- (void)windowScene:(id)a3 didUpdateCoordinateSpace:(id)a4 interfaceOrientation:(int64_t)a5 traitCollection:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(_BKRoutingWindowSceneDelegate *)self sceneController];
  [v13 windowScene:v12 didUpdateCoordinateSpace:v11 interfaceOrientation:a5 traitCollection:v10];
}

- (BKPrimarySceneControlling)sceneController
{
  return self->_sceneController;
}

- (void)setSceneController:(id)a3
{
}

- (void)sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  id v5 = [(_BKRoutingWindowSceneDelegate *)self sceneController];
  [v5 sceneWillEnterForeground:v4];
}

- (void)sceneDidBecomeActive:(id)a3
{
  id v4 = a3;
  id v5 = [(_BKRoutingWindowSceneDelegate *)self sceneController];
  [v5 sceneDidBecomeActive:v4];
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = +[BKAppDelegate sceneManager];
  [v10 routeScene:v9 willConnectToSession:v8 options:v7];
}

- (void)sceneDidDisconnect:(id)a3
{
  id v4 = a3;
  id v5 = [(_BKRoutingWindowSceneDelegate *)self sceneController];
  [v5 sceneDidDisconnect:v4];
}

- (void)sceneWillResignActive:(id)a3
{
  id v4 = a3;
  id v5 = [(_BKRoutingWindowSceneDelegate *)self sceneController];
  [v5 sceneWillResignActive:v4];
}

- (void)sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  id v5 = [(_BKRoutingWindowSceneDelegate *)self sceneController];
  [v5 sceneDidEnterBackground:v4];
}

- (void)scene:(id)a3 willContinueUserActivityWithType:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_BKRoutingWindowSceneDelegate *)self sceneController];
  [v8 scene:v7 willContinueUserActivityWithType:v6];
}

- (void)scene:(id)a3 continueUserActivity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_BKRoutingWindowSceneDelegate *)self sceneController];
  [v8 scene:v7 continueUserActivity:v6];
}

- (void)scene:(id)a3 didFailToContinueUserActivityWithType:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_BKRoutingWindowSceneDelegate *)self sceneController];
  [v11 scene:v10 didFailToContinueUserActivityWithType:v9 error:v8];
}

- (void)scene:(id)a3 didUpdateUserActivity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_BKRoutingWindowSceneDelegate *)self sceneController];
  [v8 scene:v7 didUpdateUserActivity:v6];
}

- (id)stateRestorationActivityForScene:(id)a3
{
  id v4 = a3;
  id v5 = [(_BKRoutingWindowSceneDelegate *)self sceneController];
  id v6 = [v5 stateRestorationActivityForScene:v4];

  return v6;
}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_BKRoutingWindowSceneDelegate *)self sceneController];
  [v8 scene:v7 openURLContexts:v6];
}

- (void)windowScene:(id)a3 performActionForShortcutItem:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_BKRoutingWindowSceneDelegate *)self sceneController];
  [v11 windowScene:v10 performActionForShortcutItem:v9 completionHandler:v8];
}

- (void).cxx_destruct
{
}

@end