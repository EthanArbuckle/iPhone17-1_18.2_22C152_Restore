@interface UIApplication
+ (BOOL)_maps_isAnyApplicationOrCarPlayApplicationSceneConnected;
+ (BOOL)_maps_isAnyApplicationOrCarPlayApplicationSceneForeground;
+ (BOOL)_maps_isAnyCarPlayApplicationSceneForeground;
+ (BOOL)_maps_isAnySceneConnectedForRole:(id)a3;
+ (BOOL)_maps_isAnySceneForeground;
+ (BOOL)_maps_isAnySceneForegroundForRole:(id)a3;
+ (BOOL)_maps_isCarPlayApplicationScene:(id)a3;
+ (BOOL)_maps_isCarPlayWidgetScene:(id)a3;
+ (BOOL)_maps_shouldIgnoreActivationStateForScene:(id)a3;
+ (id)_maps_applicationScenes;
+ (id)_maps_carPlayApplicationSceneDelegate;
+ (id)_maps_carPlayScenes;
+ (id)_maps_keyMapsSceneDelegate;
+ (id)_maps_keyMapsWindow;
+ (id)_maps_keyMapsWindowScene;
+ (id)_maps_lockScreenSceneDelegate;
+ (id)_maps_sceneDelegateForIdentifierString:(id)a3;
+ (id)_maps_sceneForIdentifierString:(id)a3;
+ (id)sharedMapsDelegate;
+ (unint64_t)_maps_numberOfApplicationScenes;
+ (void)_mapsCarPlay_connectApplicationSceneIfNeededForSession:(id)a3 completion:(id)a4;
+ (void)_maps_openApplicationSceneSuspendedWithCompletion:(id)a3;
+ (void)_maps_unlockApplicationWithCompletion:(id)a3;
- (BOOL)_supportsAlwaysOnDisplay;
- (BOOL)screenIsLocked;
- (void)__mapsEventRecorder_sendEvent:(id)a3;
- (void)_maps_openAppStoreForAdamId:(id)a3 completion:(id)a4;
- (void)_maps_openURL:(id)a3 options:(id)a4 completionHandler:(id)a5;
- (void)callPhoneNumber:(id)a3 completion:(id)a4;
- (void)getCanCallPhoneNumber:(id)a3 completion:(id)a4;
@end

@implementation UIApplication

+ (id)_maps_keyMapsSceneDelegate
{
  v2 = +[UIApplication _maps_keyMapsWindowScene];
  v3 = [v2 delegate];

  return v3;
}

+ (BOOL)_maps_isAnySceneForeground
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 connectedScenes];

  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ((unint64_t)[*(id *)(*((void *)&v8 + 1) + 8 * i) activationState] < 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

+ (BOOL)_maps_isAnyApplicationOrCarPlayApplicationSceneForeground
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v3 = +[UIApplication sharedApplication];
  id v4 = [v3 connectedScenes];

  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ((unint64_t)[v9 activationState] <= 1)
        {
          long long v10 = [v9 session];
          long long v11 = [v10 role];
          unsigned __int8 v12 = [v11 isEqualToString:UIWindowSceneSessionRoleApplication];

          if ((v12 & 1) != 0
            || [v9 isCarScene]
            && (objc_msgSend(a1, "_maps_isCarPlayApplicationScene:", v9) & 1) != 0)
          {
            BOOL v13 = 1;
            goto LABEL_14;
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_14:

  return v13;
}

+ (BOOL)_maps_isAnyCarPlayApplicationSceneForeground
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = +[UIApplication sharedApplication];
  id v4 = [v3 connectedScenes];

  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((unint64_t)[v9 activationState] <= 1
          && [v9 isCarScene]
          && (objc_msgSend(a1, "_maps_isCarPlayApplicationScene:", v9) & 1) != 0)
        {
          BOOL v10 = 1;
          goto LABEL_13;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_13:

  return v10;
}

+ (id)_maps_carPlayScenes
{
  v2 = +[NSMutableArray array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = +[UIApplication sharedApplication];
  id v4 = [v3 connectedScenes];

  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isCarScene])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BOOL v10 = [v9 delegate];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass) {
              [v2 addObject:v9];
            }
          }
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v2;
}

+ (id)_maps_keyMapsWindowScene
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = +[UIApplication sharedApplication];
  v3 = [v2 connectedScenes];

  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        long long v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          if ([v10 _isKeyWindowScene])
          {
            long long v11 = [v10 delegate];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              id v13 = v10;

              id v6 = v13;
            }
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)_maps_isAnySceneConnectedForRole:(id)a3
{
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = +[UIApplication sharedApplication];
  id v5 = [v4 connectedScenes];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = [*(id *)(*((void *)&v13 + 1) + 8 * i) session];
        id v10 = [v9 role];
        unsigned __int8 v11 = [v10 isEqualToString:v3];

        if (v11)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v6;
}

+ (BOOL)_maps_isAnySceneForegroundForRole:(id)a3
{
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = +[UIApplication sharedApplication];
  id v6 = [v5 connectedScenes];

  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned __int8 v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ((objc_msgSend(a1, "_maps_shouldIgnoreActivationStateForScene:", v11) & 1) == 0)
        {
          long long v12 = [v11 session];
          long long v13 = [v12 role];
          unsigned int v14 = [v13 isEqualToString:v4];

          if (v14)
          {
            if ((unint64_t)[v11 activationState] < 2)
            {
              BOOL v15 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 0;
LABEL_13:

  return v15;
}

+ (BOOL)_maps_shouldIgnoreActivationStateForScene:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3
    && ([v3 session],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 role],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 isEqualToString:BNWindowSceneSessionRoleBannerSource],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    id v10 = [v4 delegate];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      long long v12 = [v4 delegate];
      unsigned __int8 v8 = [v12 shouldIgnoreActivationStateForBanner];
    }
    else
    {
      unsigned __int8 v8 = 0;
    }
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

+ (id)_maps_applicationScenes
{
  v2 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = +[UIApplication sharedApplication];
  id v4 = [v3 connectedScenes];

  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 session];
        unsigned __int8 v11 = [v10 role];
        unsigned int v12 = [v11 isEqualToString:UIWindowSceneSessionRoleApplication];

        if (v12) {
          [v2 addObject:v9];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v2;
}

+ (unint64_t)_maps_numberOfApplicationScenes
{
  v2 = [a1 _maps_applicationScenes];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

+ (id)sharedMapsDelegate
{
  v2 = [a1 sharedApplication];
  id v3 = [v2 delegate];

  return v3;
}

- (BOOL)_supportsAlwaysOnDisplay
{
  return 1;
}

- (BOOL)screenIsLocked
{
  if (SBGetScreenLockStatus()) {
    NSLog(@"Can't determine device lock state");
  }
  return 0;
}

- (void)getCanCallPhoneNumber:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    unsigned __int8 v8 = dispatch_get_global_queue(25, 0);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100660ED8;
    v9[3] = &unk_1012E76E8;
    id v10 = v5;
    id v11 = v7;
    dispatch_async(v8, v9);
  }
  else
  {
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
}

- (void)callPhoneNumber:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)TUCallProviderManager);
  id v8 = objc_alloc((Class)TUDialRequest);
  uint64_t v9 = [v7 defaultProvider];
  id v10 = [v8 initWithProvider:v9];

  id v11 = [objc_alloc((Class)TUHandle) initWithType:2 value:v6];
  [v10 setHandle:v11];
  [v10 setShowUIPrompt:0];
  id v12 = [objc_alloc((Class)TUCallCenter) initWithQueue:0];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100661228;
  v14[3] = &unk_1012E76C0;
  id v15 = v5;
  id v13 = v5;
  [v12 launchAppForDialRequest:v10 completion:v14];
}

- (void)_maps_openURL:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v7 = (void (**)(id, id))a5;
  if (a3)
  {
    id v8 = a4;
    id v9 = a3;
    id v10 = +[LSApplicationWorkspace defaultWorkspace];
    uint64_t v12 = 0;
    id v11 = [v10 openSensitiveURL:v9 withOptions:v8 error:&v12];

    if (v7) {
      v7[2](v7, v11);
    }
  }
}

- (void)_maps_openAppStoreForAdamId:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void))a4;
  if ([v9 length])
  {
    id v7 = +[NSString stringWithFormat:@"%@%@", @"itms-appss://apps.apple.com/app/id", v9];
    id v8 = +[NSURL URLWithString:v7];
    [(UIApplication *)self _maps_openURL:v8 options:0 completionHandler:v6];
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }
}

- (void)__mapsEventRecorder_sendEvent:(id)a3
{
  id v4 = a3;
  [(UIApplication *)self __mapsEventRecorder_sendEvent:v4];
  id v5 = +[MapsEventRecorder defaultRecorder];
  [v5 recordEvent:v4];
}

+ (id)_maps_keyMapsWindow
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v2 = +[UIApplication _maps_keyMapsWindowScene];
  id v3 = [v2 windows];

  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 isKeyWindow])
        {
          id v10 = v9;

          id v6 = v10;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)_maps_lockScreenSceneDelegate
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = +[UIApplication sharedApplication];
  id v3 = [v2 connectedScenes];

  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    id v5 = v4;
    id v6 = 0;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v10 = v9;
          id v11 = [v10 delegate];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            uint64_t v13 = [v10 delegate];

            id v6 = (void *)v13;
          }
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (BOOL)_maps_isCarPlayApplicationScene:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3
    && ([v3 delegate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v7 = [v4 delegate];
    BOOL v8 = [v7 sceneType] == (id)1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)_maps_isCarPlayWidgetScene:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3
    && ([v3 delegate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v7 = [v4 delegate];
    unint64_t v8 = (unint64_t)[v7 sceneType];
    unsigned int v9 = (v8 < 8) & (0xFDu >> v8);
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

+ (BOOL)_maps_isAnyApplicationOrCarPlayApplicationSceneConnected
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = +[UIApplication sharedApplication];
  id v4 = [v3 connectedScenes];

  id v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        unsigned int v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = [v9 session];
        id v11 = [v10 role];
        unsigned __int8 v12 = [v11 isEqualToString:UIWindowSceneSessionRoleApplication];

        if ((v12 & 1) != 0
          || [v9 isCarScene]
          && (objc_msgSend(a1, "_maps_isCarPlayApplicationScene:", v9) & 1) != 0)
        {
          BOOL v13 = 1;
          goto LABEL_13;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_13:

  return v13;
}

+ (id)_maps_carPlayApplicationSceneDelegate
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [a1 _maps_carPlayScenes];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        unint64_t v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(a1, "_maps_isCarPlayApplicationScene:", v8))
        {
          unsigned int v9 = [v8 delegate];
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  unsigned int v9 = 0;
LABEL_11:

  return v9;
}

+ (void)_mapsCarPlay_connectApplicationSceneIfNeededForSession:(id)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(void))a4;
  uint64_t v7 = [a3 role];
  if ([v7 isEqualToString:_UIWindowSceneSessionRoleCarPlay])
  {
    unsigned __int8 v8 = +[UIApplication _maps_isAnySceneConnectedForRole:UIWindowSceneSessionRoleApplication];

    if ((v8 & 1) == 0)
    {
      unsigned int v9 = sub_1000A930C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Connecting Maps Application scene before handling CarPlay URL or user activity", buf, 2u);
      }

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1008FD440;
      v10[3] = &unk_1012E76C0;
      long long v11 = v6;
      [a1 _maps_openApplicationSceneSuspendedWithCompletion:v10];

      goto LABEL_9;
    }
  }
  else
  {
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_9:
}

+ (void)_maps_openApplicationSceneSuspendedWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  uint64_t v10 = FBSOpenApplicationOptionKeyActivateSuspended;
  long long v11 = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  uint64_t v6 = +[FBSOpenApplicationOptions optionsWithDictionary:v5];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1008FD5E8;
  v8[3] = &unk_1012F5FE0;
  id v9 = v3;
  id v7 = v3;
  [v4 openApplication:@"com.apple.Maps" withOptions:v6 completion:v8];
}

+ (void)_maps_unlockApplicationWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[FBSOpenApplicationService serviceWithDefaultShellEndpoint];
  uint64_t v13 = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  long long v14 = &__kCFBooleanTrue;
  id v5 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  uint64_t v6 = +[FBSOpenApplicationOptions optionsWithDictionary:v5];

  id v7 = sub_1000A930C();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v12 = @"com.apple.Maps";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Will attempt to open Maps application with bundle identifier (%@) for prompt to unlock", buf, 0xCu);
  }

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008FD7A8;
  v9[3] = &unk_1012F5FE0;
  id v10 = v3;
  id v8 = v3;
  [v4 openApplication:@"com.apple.Maps" withOptions:v6 completion:v9];
}

+ (id)_maps_sceneForIdentifierString:(id)a3
{
  id v3 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = +[UIApplication sharedApplication];
  id v5 = [v4 connectedScenes];

  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 _sceneIdentifier];
        unsigned __int8 v11 = [v10 isEqualToString:v3];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

+ (id)_maps_sceneDelegateForIdentifierString:(id)a3
{
  id v3 = [a1 _maps_sceneForIdentifierString:a3];
  id v4 = [v3 delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v3 delegate];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end