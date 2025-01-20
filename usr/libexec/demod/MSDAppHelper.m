@interface MSDAppHelper
+ (id)sharedInstance;
- (BOOL)isInstalledApp:(id)a3;
- (BOOL)stopAllAppsExcept:(id)a3;
- (BOOL)waitForAppToInstall:(id)a3 withTimeout:(unint64_t)a4;
- (id)acquireAppTerminationAssertionForApp:(id)a3;
- (id)bundleLocalizedNameForInstalledApp:(id)a3;
- (id)bundlePathForInstalledApp:(id)a3;
- (id)installedApps;
- (id)runningApps;
- (id)runningApps:(BOOL)a3;
- (id)visibleApps;
- (void)releaseAppTerminationAssertion:(id)a3 forApp:(id)a4;
@end

@implementation MSDAppHelper

+ (id)sharedInstance
{
  if (qword_100189B38 != -1) {
    dispatch_once(&qword_100189B38, &stru_100153368);
  }
  v2 = (void *)qword_100189B30;

  return v2;
}

- (id)installedApps
{
  v2 = +[LSApplicationWorkspace defaultWorkspace];
  v3 = [v2 allApplications];
  v4 = +[NSMutableArray arrayWithCapacity:0];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 applicationType];
        if ([v11 isEqualToString:@"User"])
        {
          unsigned __int8 v12 = [v10 isPlaceholder];

          if (v12) {
            continue;
          }
          v11 = [v10 applicationIdentifier];
          [v4 addObject:v11];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)visibleApps
{
  id v2 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  id v3 = objc_alloc_init((Class)SBSHomeScreenService);
  v4 = [v3 allHomeScreenApplicationBundleIdentifiers];
  [v2 addObjectsFromArray:v4];

  id v5 = +[NSArray arrayWithArray:v2];

  return v5;
}

- (id)runningApps:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[RBSProcessStateDescriptor descriptor];
  id v6 = +[RBSProcessPredicate predicateMatchingProcessTypeApplication];
  id v30 = +[NSMutableArray arrayWithCapacity:0];
  [v5 setValues:1];
  uint64_t v7 = FBSSceneVisibilityEndowmentNamespace;
  uint64_t v40 = FBSSceneVisibilityEndowmentNamespace;
  uint64_t v8 = +[NSArray arrayWithObjects:&v40 count:1];
  [v5 setEndowmentNamespaces:v8];

  id v36 = 0;
  v9 = +[RBSProcessState statesForPredicate:v6 withDescriptor:v5 error:&v36];
  id v10 = v36;
  v11 = v10;
  if (v9)
  {
    id v26 = v10;
    v28 = v6;
    v29 = v5;
    v31 = [(MSDAppHelper *)self visibleApps];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v27 = v9;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v32 objects:v39 count:16];
    if (!v13) {
      goto LABEL_22;
    }
    id v14 = v13;
    uint64_t v15 = *(void *)v33;
    while (1)
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v33 != v15) {
          objc_enumerationMutation(v12);
        }
        long long v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        unsigned int v18 = [v17 taskState];
        if (v3)
        {
          if (v18 != 2 && [v17 taskState] != 4) {
            goto LABEL_19;
          }
          v19 = [v17 endowmentNamespaces];
          unsigned __int8 v20 = [v19 containsObject:v7];

          if ((v20 & 1) == 0) {
            goto LABEL_19;
          }
        }
        else if (!RBSTaskStateIsRunning())
        {
          goto LABEL_19;
        }
        v21 = [v17 process];
        v22 = [v21 bundle];
        v23 = [v22 identifier];

        if (!v23)
        {
          v24 = sub_100068600();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v38 = v17;
            _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Failed to extract app bundle ID from process state: %{public}@", buf, 0xCu);
          }

LABEL_19:
          v23 = 0;
          goto LABEL_20;
        }
        if ([v31 containsObject:v23]) {
          [v30 addObject:v23];
        }
LABEL_20:
      }
      id v14 = [v12 countByEnumeratingWithState:&v32 objects:v39 count:16];
      if (!v14)
      {
LABEL_22:

        id v6 = v28;
        id v5 = v29;
        v11 = v26;
        v9 = v27;
        goto LABEL_23;
      }
    }
  }
  v31 = sub_100068600();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    sub_1000D2E64(v11);
  }
LABEL_23:

  return v30;
}

- (id)runningApps
{
  BOOL v3 = +[RBSProcessStateDescriptor descriptor];
  v4 = +[RBSProcessPredicate predicateMatchingProcessTypeApplication];
  id v5 = +[NSMutableArray arrayWithCapacity:0];
  [v3 setValues:1];
  uint64_t v34 = FBSSceneVisibilityEndowmentNamespace;
  id v6 = +[NSArray arrayWithObjects:&v34 count:1];
  [v3 setEndowmentNamespaces:v6];

  id v30 = 0;
  uint64_t v7 = +[RBSProcessState statesForPredicate:v4 withDescriptor:v3 error:&v30];
  id v8 = v30;
  v9 = v8;
  if (v7)
  {
    id v22 = v8;
    v24 = v4;
    v25 = v3;
    id v10 = [(MSDAppHelper *)self visibleApps];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v23 = v7;
    id v11 = v7;
    id v12 = [v11 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (!v12) {
      goto LABEL_17;
    }
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    while (1)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v16 taskState];
        if (!RBSTaskStateIsRunning()) {
          goto LABEL_14;
        }
        long long v17 = [v16 process];
        unsigned int v18 = [v17 bundle];
        v19 = [v18 identifier];

        if (!v19)
        {
          unsigned __int8 v20 = sub_100068600();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            long long v32 = v16;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to extract app bundle ID from process state: %{public}@", buf, 0xCu);
          }

LABEL_14:
          v19 = 0;
          goto LABEL_15;
        }
        if ([v10 containsObject:v19]) {
          [v5 addObject:v19];
        }
LABEL_15:
      }
      id v13 = [v11 countByEnumeratingWithState:&v26 objects:v33 count:16];
      if (!v13)
      {
LABEL_17:

        v4 = v24;
        BOOL v3 = v25;
        v9 = v22;
        uint64_t v7 = v23;
        goto LABEL_18;
      }
    }
  }
  id v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1000D2E64(v9);
  }
LABEL_18:

  return v5;
}

- (id)bundleLocalizedNameForInstalledApp:(id)a3
{
  id v3 = a3;
  id v9 = 0;
  id v4 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v9];
  id v5 = v9;
  if (v4)
  {
    id v6 = [v4 localizedName];
  }
  else
  {
    id v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000D2EE8((uint64_t)v3, v5);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)bundlePathForInstalledApp:(id)a3
{
  id v3 = +[LSApplicationProxy applicationProxyForIdentifier:a3];
  id v4 = [v3 bundleURL];
  id v5 = [v4 path];

  return v5;
}

- (BOOL)isInstalledApp:(id)a3
{
  id v3 = +[LSApplicationProxy applicationProxyForIdentifier:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 appState];
    unsigned __int8 v6 = [v5 isInstalled];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (BOOL)waitForAppToInstall:(id)a3 withTimeout:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[NSDistributedNotificationCenter defaultCenter];
  id v8 = +[NSDate dateWithTimeIntervalSinceNow:(double)a4];
  id v9 = objc_alloc_init((Class)NSCondition);
  id v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Wait for app to install: %{public}@", buf, 0xCu);
  }

  id v11 = +[NSOperationQueue mainQueue];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000734E8;
  v19[3] = &unk_100151B60;
  id v12 = v9;
  id v20 = v12;
  id v13 = [v7 addObserverForName:@"com.apple.LaunchServices.applicationRegistered" object:0 queue:v11 usingBlock:v19];

  if (v13)
  {
    [v12 lock];
    while (1)
    {
      BOOL v14 = [(MSDAppHelper *)self isInstalledApp:v6];
      if (v14) {
        break;
      }
      uint64_t v15 = sub_100068600();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "App is not yet installed.", buf, 2u);
      }

      if (([v12 waitUntilDate:v8] & 1) == 0)
      {
        long long v16 = sub_100068600();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1000D2FC0(v16);
        }

        break;
      }
    }
    [v12 unlock];
    [v7 removeObserver:v13];
  }
  else
  {
    long long v17 = sub_100068600();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000D2F7C(v17);
    }

    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)stopAllAppsExcept:(id)a3
{
  id v4 = a3;
  unsigned int v18 = +[LSApplicationWorkspace defaultWorkspace];
  id v5 = [v18 allApplications];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = [v10 applicationIdentifier];
        unsigned __int8 v12 = [v4 containsObject:v11];

        if ((v12 & 1) == 0)
        {
          id v13 = [v10 applicationIdentifier];
          BOOL v14 = [(MSDAppHelper *)self acquireAppTerminationAssertionForApp:v13];

          if (v14)
          {
            uint64_t v15 = [v10 applicationIdentifier];
            [(MSDAppHelper *)self releaseAppTerminationAssertion:v14 forApp:v15];
          }
          else
          {
            uint64_t v15 = sub_100068600();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              long long v16 = [v10 applicationIdentifier];
              *(_DWORD *)buf = 138543362;
              v24 = v16;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ERROR - Failed to acquire termination assertion for app:  %{public}@", buf, 0xCu);
            }
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v7);
  }

  return 1;
}

- (id)acquireAppTerminationAssertionForApp:(id)a3
{
  id v3 = a3;
  id v4 = sub_100068600();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000D3174();
  }

  id v5 = +[RBSProcessPredicate predicateMatchingBundleIdentifier:v3];
  id v6 = objc_alloc((Class)RBSTerminateContext);
  id v7 = [@"Installing application %@" stringByAppendingString:v3];
  id v8 = [v6 initWithExplanation:v7];

  [v8 setMaximumTerminationResistance:50];
  id v9 = [objc_alloc((Class)RBSTerminationAssertion) initWithPredicate:v5 context:v8];
  if (v9)
  {
    id v10 = v9;
    id v16 = 0;
    unsigned __int8 v11 = [v9 acquireWithError:&v16];
    id v12 = v16;
    id v13 = sub_100068600();
    BOOL v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        sub_1000D3078();
      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1000D30E0((uint64_t)v3, v12);
      }

      BOOL v14 = v10;
      id v10 = 0;
    }
  }
  else
  {
    BOOL v14 = sub_100068600();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1000D3004();
    }
    id v10 = 0;
    id v12 = 0;
  }

  return v10;
}

- (void)releaseAppTerminationAssertion:(id)a3 forApp:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000D32D8();
  }

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = 0;
      unsigned __int8 v8 = [v5 invalidateWithError:&v12];
      id v9 = v12;
      id v10 = sub_100068600();
      unsigned __int8 v11 = v10;
      if (v8)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          sub_1000D31DC();
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        sub_1000D3244((uint64_t)v6, v9);
      }
    }
  }
}

@end