@interface GKApplicationWorkspace
- (BOOL)applicationIsInstalled:(id)a3;
- (id)availableGameIdentifiers;
- (id)availableGamesAndIdentifiers;
- (void)openSettings;
- (void)openURL:(id)a3;
@end

@implementation GKApplicationWorkspace

- (BOOL)applicationIsInstalled:(id)a3
{
  id v3 = a3;
  v4 = +[LSApplicationWorkspace defaultWorkspace];
  unsigned __int8 v5 = [v4 applicationIsInstalled:v3];

  return v5;
}

- (id)availableGameIdentifiers
{
  v2 = +[NSMutableArray array];
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100064E58;
  v6[3] = &unk_1002D6AB8;
  id v4 = v2;
  id v7 = v4;
  [v3 enumerateBundlesOfType:0 block:v6];

  return v4;
}

- (id)availableGamesAndIdentifiers
{
  v2 = +[NSMutableDictionary dictionary];
  id v3 = +[LSApplicationWorkspace defaultWorkspace];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000650AC;
  v6[3] = &unk_1002D6AB8;
  id v4 = v2;
  id v7 = v4;
  [v3 enumerateBundlesOfType:4 block:v6];

  return v4;
}

- (void)openSettings
{
  +[NSURL URLWithString:@"prefs:root=GAMECENTER"];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  [v2 openSensitiveURL:v3 withOptions:0];
}

- (void)openURL:(id)a3
{
  id v3 = a3;
  uint64_t v10 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v11 = &__kCFBooleanTrue;
  id v4 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  unsigned __int8 v5 = +[LSApplicationWorkspace defaultWorkspace];
  id v9 = 0;
  [v5 openSensitiveURL:v3 withOptions:v4 error:&v9];
  id v6 = v9;

  if (v6)
  {
    if (!os_log_GKGeneral) {
      id v7 = (id)GKOSLoggers();
    }
    v8 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_100065344((uint64_t)v3, (uint64_t)v6, v8);
    }
  }
}

@end