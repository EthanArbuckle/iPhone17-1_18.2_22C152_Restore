@interface W5CloudStore
+ (id)sharedStore;
- (BOOL)registerDiagnosticModePeer:(id)a3 configuration:(id)a4 error:(id *)a5;
- (BOOL)unregisterDiagnosticModePeer:(id)a3 error:(id *)a4;
- (NSUbiquitousKeyValueStore)appStore;
- (W5CloudStore)init;
- (id)_homeDiagnosticsDomain;
- (id)getMinNotificationInterval:(id)a3 notificationType:(int64_t)a4;
- (id)registeredPeers;
- (void)_setHomeDiagnosticsDomain:(id)a3;
- (void)setAppStore:(id)a3;
@end

@implementation W5CloudStore

+ (id)sharedStore
{
  if (qword_100103730 != -1) {
    dispatch_once(&qword_100103730, &stru_1000DF098);
  }
  v2 = (void *)qword_100103728;

  return v2;
}

- (W5CloudStore)init
{
  v8.receiver = self;
  v8.super_class = (Class)W5CloudStore;
  v2 = [(W5CloudStore *)&v8 init];
  if (!v2)
  {
LABEL_8:

    return 0;
  }
  v3 = (NSUbiquitousKeyValueStore *)[objc_alloc((Class)NSUbiquitousKeyValueStore) initWithStoreIdentifier:@"com.apple.wifi.app" type:0];
  appStore = v2->_appStore;
  v2->_appStore = v3;

  v5 = v2->_appStore;
  if (!v5)
  {
    v7 = sub_10009756C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315650;
      v10 = "-[W5CloudStore init]";
      __int16 v11 = 2080;
      v12 = "W5CloudStore.m";
      __int16 v13 = 1024;
      int v14 = 53;
      _os_log_send_and_compose_impl();
    }

    goto LABEL_8;
  }
  [(NSUbiquitousKeyValueStore *)v5 synchronize];
  return v2;
}

- (id)_homeDiagnosticsDomain
{
  v2 = [(W5CloudStore *)self appStore];
  v3 = [v2 objectForKey:@"home-diagnostics"];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[NSDictionary dictionary];
  }
  v5 = v4;

  return v5;
}

- (void)_setHomeDiagnosticsDomain:(id)a3
{
  id v4 = a3;
  v5 = [(W5CloudStore *)self appStore];
  [v5 setObject:v4 forKey:@"home-diagnostics"];

  id v6 = [(W5CloudStore *)self appStore];
  [v6 synchronize];
}

- (BOOL)registerDiagnosticModePeer:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = [(W5CloudStore *)self _homeDiagnosticsDomain];
  id v11 = [v10 mutableCopy];

  v12 = [v11 objectForKeyedSubscript:@"registered-app-peers"];
  if (!v12)
  {
    v12 = +[NSDictionary dictionary];
  }
  id v35 = [v12 mutableCopy];
  __int16 v13 = [v8 peer];
  int v14 = [v13 peerID];

  v36 = v9;
  if (!v14)
  {
    v29 = sub_10009756C();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 136315906;
      v41 = "-[W5CloudStore registerDiagnosticModePeer:configuration:error:]";
      __int16 v42 = 2080;
      v43 = "W5CloudStore.m";
      __int16 v44 = 1024;
      int v45 = 96;
      __int16 v46 = 2114;
      id v47 = v8;
      LODWORD(v34) = 38;
      v33 = &v40;
      _os_log_send_and_compose_impl();
    }

    if (!a5) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
  id v37 = 0;
  v15 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:&v37];
  id v16 = v37;
  if (!v15)
  {
    v30 = sub_10009756C();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v40 = 136315906;
      v41 = "-[W5CloudStore registerDiagnosticModePeer:configuration:error:]";
      __int16 v42 = 2080;
      v43 = "W5CloudStore.m";
      __int16 v44 = 1024;
      int v45 = 101;
      __int16 v46 = 2114;
      id v47 = v8;
      LODWORD(v34) = 38;
      v33 = &v40;
      _os_log_send_and_compose_impl();
    }

    if (!a5)
    {
      BOOL v27 = 0;
      goto LABEL_16;
    }
    if (v16)
    {
      id v16 = v16;
      BOOL v27 = 0;
      *a5 = v16;
      goto LABEL_16;
    }
LABEL_26:
    NSErrorUserInfoKey v38 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v39 = @"W5ParamErr";
    v31 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1, v33, v34);
    id v32 = +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v31];
    *a5 = v32;

LABEL_27:
    BOOL v27 = 0;
    id v16 = 0;
    goto LABEL_16;
  }
  v17 = +[NSMutableDictionary dictionary];
  v18 = +[NSDate date];
  [v17 setObject:v18 forKeyedSubscript:@"timestamp"];

  v19 = [v8 peer];
  v20 = [v19 name];

  if (v20)
  {
    v21 = [v8 peer];
    v22 = [v21 name];
    [v17 setObject:v22 forKeyedSubscript:@"name"];
  }
  [v17 setObject:v15 forKeyedSubscript:@"peer"];
  v23 = [v36 objectForKey:@"MinStartNotificationInterval"];
  if (v23) {
    [v17 setObject:v23 forKey:@"min-start-notification-interval"];
  }
  v24 = [v36 objectForKey:@"MinStopNotificationInterval"];

  if (v24) {
    [v17 setObject:v24 forKey:@"min-stop-notification-interval"];
  }
  [v35 setObject:v17 forKeyedSubscript:v14];
  [v11 setObject:v35 forKeyedSubscript:@"registered-app-peers"];
  [(W5CloudStore *)self _setHomeDiagnosticsDomain:v11];
  v25 = sub_10009756C();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    int v40 = 136315906;
    v41 = "-[W5CloudStore registerDiagnosticModePeer:configuration:error:]";
    __int16 v42 = 2080;
    v43 = "W5CloudStore.m";
    __int16 v44 = 1024;
    int v45 = 131;
    __int16 v46 = 2114;
    id v47 = v8;
    _os_log_send_and_compose_impl();
  }

  v26 = sub_10009756C();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    int v40 = 136315906;
    v41 = "-[W5CloudStore registerDiagnosticModePeer:configuration:error:]";
    __int16 v42 = 2080;
    v43 = "W5CloudStore.m";
    __int16 v44 = 1024;
    int v45 = 132;
    __int16 v46 = 2112;
    id v47 = v11;
    _os_log_send_and_compose_impl();
  }

  BOOL v27 = 1;
LABEL_16:

  return v27;
}

- (BOOL)unregisterDiagnosticModePeer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [(W5CloudStore *)self _homeDiagnosticsDomain];
  id v8 = [v7 mutableCopy];

  id v9 = [v8 objectForKeyedSubscript:@"registered-app-peers"];
  v10 = [v6 peer];
  id v11 = [v10 peerID];

  if (!v11)
  {
    v17 = sub_10009756C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315906;
      v21 = "-[W5CloudStore unregisterDiagnosticModePeer:error:]";
      __int16 v22 = 2080;
      v23 = "W5CloudStore.m";
      __int16 v24 = 1024;
      int v25 = 152;
      __int16 v26 = 2114;
      id v27 = v6;
LABEL_13:
      _os_log_send_and_compose_impl();
    }
LABEL_14:
    id v12 = 0;
    goto LABEL_15;
  }
  if (!v9)
  {
    v17 = sub_10009756C();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315650;
      v21 = "-[W5CloudStore unregisterDiagnosticModePeer:error:]";
      __int16 v22 = 2080;
      v23 = "W5CloudStore.m";
      __int16 v24 = 1024;
      int v25 = 153;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  id v12 = [v9 mutableCopy];
  __int16 v13 = [v12 objectForKeyedSubscript:v11];

  if (v13)
  {
    [v12 removeObjectForKey:v11];
    [v8 setObject:v12 forKeyedSubscript:@"registered-app-peers"];
    [(W5CloudStore *)self _setHomeDiagnosticsDomain:v8];
    int v14 = sub_10009756C();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 136315906;
      v21 = "-[W5CloudStore unregisterDiagnosticModePeer:error:]";
      __int16 v22 = 2080;
      v23 = "W5CloudStore.m";
      __int16 v24 = 1024;
      int v25 = 166;
      __int16 v26 = 2114;
      id v27 = v6;
      BOOL v15 = 1;
      _os_log_send_and_compose_impl();
    }
    else
    {
      BOOL v15 = 1;
    }
    goto LABEL_7;
  }
  v17 = sub_10009756C();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 136315906;
    v21 = "-[W5CloudStore unregisterDiagnosticModePeer:error:]";
    __int16 v22 = 2080;
    v23 = "W5CloudStore.m";
    __int16 v24 = 1024;
    int v25 = 156;
    __int16 v26 = 2114;
    id v27 = v11;
    _os_log_send_and_compose_impl();
  }
LABEL_15:

  if (!a4)
  {
    BOOL v15 = 0;
    goto LABEL_8;
  }
  NSErrorUserInfoKey v18 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v19 = @"W5ParamErr";
  int v14 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  +[NSError errorWithDomain:@"com.apple.wifivelocity.error" code:1 userInfo:v14];
  BOOL v15 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:

LABEL_8:
  return v15;
}

- (id)registeredPeers
{
  v2 = [(W5CloudStore *)self _homeDiagnosticsDomain];
  id v3 = [v2 mutableCopy];

  id v4 = [v3 objectForKeyedSubscript:@"registered-app-peers"];
  id v18 = +[NSMutableArray array];
  if (v4)
  {
    v17 = v4;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v5 = [v4 allValues];
    id v6 = [v5 countByEnumeratingWithState:&v20 objects:v32 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
          id v12 = [v10 objectForKeyedSubscript:@"peer"];
          id v19 = 0;
          __int16 v13 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v12 error:&v19];
          id v14 = v19;

          if (v13)
          {
            [v18 addObject:v13];
          }
          else
          {
            BOOL v15 = sub_10009756C();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              int v24 = 136315906;
              int v25 = "-[W5CloudStore registeredPeers]";
              __int16 v26 = 2080;
              id v27 = "W5CloudStore.m";
              __int16 v28 = 1024;
              int v29 = 191;
              __int16 v30 = 2114;
              id v31 = v14;
              _os_log_send_and_compose_impl();
            }
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v20 objects:v32 count:16];
      }
      while (v7);
    }

    id v4 = v17;
  }

  return v18;
}

- (id)getMinNotificationInterval:(id)a3 notificationType:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(W5CloudStore *)self _homeDiagnosticsDomain];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"registered-app-peers"];
  id v9 = [v8 objectForKey:v6];

  if (!v9) {
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    CFStringRef v10 = @"min-start-notification-interval";
    goto LABEL_7;
  }
  if (a4 != 3)
  {
LABEL_5:
    id v11 = 0;
    goto LABEL_8;
  }
  CFStringRef v10 = @"min-stop-notification-interval";
LABEL_7:
  id v11 = [v9 objectForKey:v10];
LABEL_8:

  return v11;
}

- (NSUbiquitousKeyValueStore)appStore
{
  return self->_appStore;
}

- (void)setAppStore:(id)a3
{
}

- (void).cxx_destruct
{
}

@end