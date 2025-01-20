@interface BrowserSceneDelegateRouter
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
@end

@implementation BrowserSceneDelegateRouter

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = +[Application sharedApplication];
  v11 = [v10 browserWindowController];
  v12 = [v8 persistentIdentifier];
  id v14 = [v11 windowForSceneID:v12 options:v7];

  [v9 setDelegate:v14];
  [v14 scene:v9 willConnectToSession:v8 options:v7];

  v13 = +[Application sharedApplication];
  [v13 startCommandLineTest];
}

@end