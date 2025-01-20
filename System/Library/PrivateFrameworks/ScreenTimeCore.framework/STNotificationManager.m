@interface STNotificationManager
+ (id)sharedNotificationManager;
- (APSConnection)connection;
- (NSData)pushToken;
- (NSMutableDictionary)delegates;
- (NSMutableSet)topics;
- (STNotificationManager)init;
- (void)_connectToAPNS;
- (void)_updateAPNSConnection;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)registerWithTopic:(id)a3 delegate:(id)a4;
- (void)setConnection:(id)a3;
- (void)setDelegates:(id)a3;
- (void)setPushToken:(id)a3;
- (void)setTopics:(id)a3;
@end

@implementation STNotificationManager

+ (id)sharedNotificationManager
{
  if (qword_100346948 != -1) {
    dispatch_once(&qword_100346948, &stru_1002FCFA8);
  }
  v2 = (void *)qword_100346940;
  return v2;
}

- (STNotificationManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)STNotificationManager;
  v2 = [(STNotificationManager *)&v8 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    delegates = v2->_delegates;
    v2->_delegates = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    topics = v2->_topics;
    v2->_topics = (NSMutableSet *)v5;
  }
  return v2;
}

- (void)registerWithTopic:(id)a3 delegate:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  v7 = [(STNotificationManager *)self topics];
  [v7 addObject:v10];

  objc_super v8 = [(STNotificationManager *)self delegates];
  v9 = [v8 objectForKeyedSubscript:v10];
  if (!v9) {
    v9 = objc_opt_new();
  }
  [v9 addObject:v6];
  [v8 setObject:v9 forKeyedSubscript:v10];
  [(STNotificationManager *)self _updateAPNSConnection];
}

- (void)_updateAPNSConnection
{
  [(STNotificationManager *)self _connectToAPNS];
  id v5 = [(STNotificationManager *)self topics];
  uint64_t v3 = [v5 allObjects];
  v4 = [(STNotificationManager *)self connection];
  [v4 _setEnabledTopics:v3];
}

- (void)_connectToAPNS
{
  uint64_t v3 = [(STNotificationManager *)self connection];

  if (!v3)
  {
    v4 = _os_activity_create((void *)&_mh_execute_header, "Connect -> APNS", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    v13.opaque[0] = 0;
    v13.opaque[1] = 0;
    os_activity_scope_enter(v4, &v13);
    id v5 = objc_alloc((Class)APSConnection);
    uint64_t v6 = APSEnvironmentProduction;
    id v7 = &_dispatch_main_q;
    id v8 = [v5 initWithEnvironmentName:v6 namedDelegatePort:@"com.apple.aps.ScreenTime" queue:&_dispatch_main_q];

    [v8 setDelegate:self];
    v9 = [v8 publicToken];
    [(STNotificationManager *)self setPushToken:v9];

    [(STNotificationManager *)self setConnection:v8];
    id v10 = [(STNotificationManager *)self pushToken];

    if (v10)
    {
      v11 = [(STNotificationManager *)self connection];
      v12 = [(STNotificationManager *)self pushToken];
      [(STNotificationManager *)self connection:v11 didReceivePublicToken:v12];
    }
    os_activity_scope_leave(&v13);
  }
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v18 = _os_activity_create((void *)&_mh_execute_header, "Token <- APNS", (os_activity_t)&_os_activity_none, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v18, &state);
  if (v6)
  {
    -[STNotificationManager setPushToken:](self, "setPushToken:", v6, v17, v18);
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = [(STNotificationManager *)self delegates];
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      do
      {
        id v10 = 0;
        do
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * (void)v10);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          v12 = [(STNotificationManager *)self delegates];
          os_activity_scope_state_s v13 = [v12 objectForKeyedSubscript:v11];

          id v14 = [v13 countByEnumeratingWithState:&v19 objects:v28 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v20;
            do
            {
              v16 = 0;
              do
              {
                if (*(void *)v20 != v15) {
                  objc_enumerationMutation(v13);
                }
                [*(id *)(*((void *)&v19 + 1) + 8 * (void)v16) receivedToken:v6];
                v16 = (char *)v16 + 1;
              }
              while (v14 != v16);
              id v14 = [v13 countByEnumeratingWithState:&v19 objects:v28 count:16];
            }
            while (v14);
          }

          id v10 = (char *)v10 + 1;
        }
        while (v10 != v8);
        id v8 = [v7 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v8);
    }
  }
  os_activity_scope_leave(&state);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "Notification <- APNS", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = +[STLog apns];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [v7 topic];
    sub_100261DE0(v10, buf, v9);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [(STNotificationManager *)self delegates];
  v12 = [v7 topic];
  os_activity_scope_state_s v13 = [v11 objectForKeyedSubscript:v12];

  id v14 = [v13 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v13);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v16) receivedNotification:v7];
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      id v14 = [v13 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v14);
  }

  os_activity_scope_leave(&state);
}

- (NSMutableDictionary)delegates
{
  return self->_delegates;
}

- (void)setDelegates:(id)a3
{
}

- (NSMutableSet)topics
{
  return self->_topics;
}

- (void)setTopics:(id)a3
{
}

- (APSConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSData)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
}

@end