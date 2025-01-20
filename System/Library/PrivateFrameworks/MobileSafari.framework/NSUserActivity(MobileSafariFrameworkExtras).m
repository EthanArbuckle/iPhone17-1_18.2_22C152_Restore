@interface NSUserActivity(MobileSafariFrameworkExtras)
+ (id)_sf_windowCreationActivityFromSceneConnectionOptions:()MobileSafariFrameworkExtras;
+ (id)_sf_windowCreationActivityWithMode:()MobileSafariFrameworkExtras;
+ (id)_sf_windowCreationActivityWithNavigationIntent:()MobileSafariFrameworkExtras;
+ (id)_sf_windowCreationActivityWithRecentlyClosedTabUUID:()MobileSafariFrameworkExtras browserControllerUUID:;
+ (id)_sf_windowCreationActivityWithTabUUID:()MobileSafariFrameworkExtras tabGroupUUID:browserControllerUUID:;
- (id)_sf_windowCreationMode;
- (id)_sf_windowCreationNavigationIntent;
- (id)_sf_windowCreationRecentlyClosedTabUUID;
- (id)_sf_windowCreationSourceBrowserControllerUUID;
- (id)_sf_windowCreationTabGroupUUID;
- (id)_sf_windowCreationTabUUID;
- (id)sf_windowCreationNavigationIntentID;
- (void)_sf_invalidateWindowCreationData;
@end

@implementation NSUserActivity(MobileSafariFrameworkExtras)

+ (id)_sf_windowCreationActivityFromSceneConnectionOptions:()MobileSafariFrameworkExtras
{
  v3 = [a3 userActivities];
  v4 = [v3 anyObject];

  v5 = [v4 activityType];
  int v6 = [v5 isEqualToString:@"com.apple.mobilesafari.UserActivity.create-window"];

  if (v6) {
    id v7 = v4;
  }
  else {
    id v7 = 0;
  }

  return v7;
}

+ (id)_sf_windowCreationActivityWithNavigationIntent:()MobileSafariFrameworkExtras
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28F80];
  id v4 = a3;
  v5 = [v3 processInfo];
  int v6 = [v5 globallyUniqueString];

  id v7 = windowCreationNavigationIntentDictionary();
  [v7 setObject:v4 forKeyedSubscript:v6];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.mobilesafari.UserActivity.create-window"];
  [v8 setEligibleForHandoff:0];
  v11 = @"navigation-intent-id";
  v12[0] = v6;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
  [v8 setUserInfo:v9];

  return v8;
}

+ (id)_sf_windowCreationActivityWithMode:()MobileSafariFrameworkExtras
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.mobilesafari.UserActivity.create-window"];
  [v4 setEligibleForHandoff:0];
  v8 = @"mode";
  v5 = [NSNumber numberWithInteger:a3];
  v9[0] = v5;
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  [v4 setUserInfo:v6];

  return v4;
}

+ (id)_sf_windowCreationActivityWithTabUUID:()MobileSafariFrameworkExtras tabGroupUUID:browserControllerUUID:
{
  id v7 = (objc_class *)MEMORY[0x1E4F22488];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] initWithActivityType:@"com.apple.mobilesafari.UserActivity.create-window"];
  [v11 setEligibleForHandoff:0];
  v12 = [MEMORY[0x1E4F1CA60] dictionary];
  [v12 setObject:v10 forKeyedSubscript:@"tab-uuid"];

  [v12 setObject:v9 forKeyedSubscript:@"tab-group-uuid"];
  [v12 setObject:v8 forKeyedSubscript:@"source-browser-controller-uuid"];

  [v11 setUserInfo:v12];

  return v11;
}

+ (id)_sf_windowCreationActivityWithRecentlyClosedTabUUID:()MobileSafariFrameworkExtras browserControllerUUID:
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = (objc_class *)MEMORY[0x1E4F22488];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithActivityType:@"com.apple.mobilesafari.UserActivity.create-window"];
  [v5 setEligibleForHandoff:0];
  id v8 = @"recently-closed-tab-uuid";
  v9[0] = v4;
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];

  [v5 setUserInfo:v6];

  return v5;
}

- (id)sf_windowCreationNavigationIntentID
{
  v1 = [a1 userInfo];
  v2 = objc_msgSend(v1, "safari_stringForKey:", @"navigation-intent-id");

  return v2;
}

- (id)_sf_windowCreationNavigationIntent
{
  v1 = objc_msgSend(a1, "sf_windowCreationNavigationIntentID");
  if (v1)
  {
    v2 = windowCreationNavigationIntentDictionary();
    v3 = [v2 objectForKeyedSubscript:v1];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_sf_windowCreationTabUUID
{
  v1 = [a1 userInfo];
  v2 = objc_msgSend(v1, "safari_UUIDForKey:", @"tab-uuid");

  return v2;
}

- (id)_sf_windowCreationTabGroupUUID
{
  v1 = [a1 userInfo];
  v2 = objc_msgSend(v1, "safari_UUIDForKey:", @"tab-group-uuid");

  return v2;
}

- (id)_sf_windowCreationSourceBrowserControllerUUID
{
  v1 = [a1 userInfo];
  v2 = objc_msgSend(v1, "safari_UUIDForKey:", @"source-browser-controller-uuid");

  return v2;
}

- (id)_sf_windowCreationRecentlyClosedTabUUID
{
  v1 = [a1 userInfo];
  v2 = objc_msgSend(v1, "safari_UUIDForKey:", @"recently-closed-tab-uuid");

  return v2;
}

- (id)_sf_windowCreationMode
{
  v1 = [a1 userInfo];
  v2 = objc_msgSend(v1, "safari_numberForKey:", @"mode");

  return v2;
}

- (void)_sf_invalidateWindowCreationData
{
  objc_msgSend(a1, "sf_windowCreationNavigationIntentID");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v1 = windowCreationNavigationIntentDictionary();
    [v1 removeObjectForKey:v2];
  }
}

@end