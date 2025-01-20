@interface BKSceneUtilities
+ (BOOL)connectionOptions:(id)a3 hasActivityType:(id)a4;
+ (BOOL)hasMultiWindowEnabled;
+ (id)URLContextOpenURLOptions:(id)a3;
+ (id)getUserInfoForConnectionOptions:(id)a3 withActivityType:(id)a4;
+ (id)sharedInstance;
- (id)_init;
- (void)destroySceneWithSceneSession:(id)a3 withAnimationType:(int64_t)a4;
- (void)requestWindowForSceneSession:(id)a3 userActivity:(id)a4 errorHandler:(id)a5;
@end

@implementation BKSceneUtilities

+ (BOOL)connectionOptions:(id)a3 hasActivityType:(id)a4
{
  id v5 = a4;
  [a3 userActivities];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) activityType:v13];
        unsigned __int8 v11 = [v10 isEqualToString:v5];

        if (v11)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v7;
}

+ (BOOL)hasMultiWindowEnabled
{
  v2 = +[UIApplication sharedApplication];
  unsigned __int8 v3 = [v2 supportsMultipleScenes];

  return v3;
}

+ (id)getUserInfoForConnectionOptions:(id)a3 withActivityType:(id)a4
{
  id v5 = a4;
  [a3 userActivities];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned __int8 v11 = [v10 activityType];
        unsigned int v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          id v7 = [v10 userInfo];
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)URLContextOpenURLOptions:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  id v5 = [v3 options];

  id v6 = [v5 sourceApplication];

  if (v6)
  {
    id v7 = [v5 sourceApplication];
    [v4 setObject:v7 forKeyedSubscript:UIApplicationOpenURLOptionsSourceApplicationKey];
  }
  uint64_t v8 = [v5 annotation];

  if (v8)
  {
    v9 = [v5 annotation];
    [v4 setObject:v9 forKeyedSubscript:UIApplicationOpenURLOptionsAnnotationKey];
  }
  id v10 = [v4 copy];

  return v10;
}

+ (id)sharedInstance
{
  if (qword_100B4A300 != -1) {
    dispatch_once(&qword_100B4A300, &stru_100A46A30);
  }
  v2 = (void *)qword_100B4A2F8;

  return v2;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)BKSceneUtilities;
  return [(BKSceneUtilities *)&v3 init];
}

- (void)requestWindowForSceneSession:(id)a3 userActivity:(id)a4 errorHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = BCSceneLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Requesting window for session: %@", buf, 0xCu);
  }

  id v11 = objc_alloc_init((Class)UISceneActivationRequestOptions);
  unsigned int v12 = [v7 scene];
  [v11 setRequestingScene:v12];

  long long v13 = +[UIApplication sharedApplication];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000EBBE8;
  v15[3] = &unk_100A46A58;
  id v16 = v8;
  id v14 = v8;
  [v13 requestSceneSessionActivation:v7 userActivity:v9 options:v11 errorHandler:v15];
}

- (void)destroySceneWithSceneSession:(id)a3 withAnimationType:(int64_t)a4
{
  id v5 = a3;
  id v6 = BCSceneLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v5 persistentIdentifier];
    int v11 = 138412290;
    unsigned int v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Running destroySceneWithSceneSession identifier=%@", (uint8_t *)&v11, 0xCu);
  }
  unsigned int v8 = [(id)objc_opt_class() hasMultiWindowEnabled];
  if (v5 && v8)
  {
    id v9 = objc_alloc_init((Class)UIWindowSceneDestructionRequestOptions);
    [v9 setWindowDismissalAnimation:a4];
    id v10 = +[UIApplication sharedApplication];
    [v10 requestSceneSessionDestruction:v5 options:v9 errorHandler:&stru_100A46A78];
  }
}

@end