@interface RMPushController
+ (RMPushController)sharedController;
+ (id)_connectionWithEnvironmentName:(id)a3 queue:(id)a4;
+ (void)start;
- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5;
- (NSManagedObjectContext)context;
- (NSSet)supportedKeyPaths;
- (OS_dispatch_queue)serialQueue;
- (RMPersistentHistoryNotifier)persistentHistoryNotifier;
- (RMPushController)initWithPushTokenByEnvironmentName:(id)a3 subscribedStatusKeyPathUpdater:(id)a4 context:(id)a5;
- (RMPushControllerDelegate)delegate;
- (RMSubscribedStatusKeyPathUpdater)subscribedStatusKeyPathUpdater;
- (id)_cachedPushTokenByEnvironment;
- (id)_currentPushTokenByEnvironmentName;
- (id)_environmentNameForConnection:(id)a3;
- (id)_pushEnvironmentNameForManagementChannel:(id)a3 error:(id *)a4;
- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5;
- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6;
- (void)_notifyPushTokenDidChangeIfNeeded;
- (void)_start;
- (void)_stop;
- (void)_updateConnections;
- (void)_updatePushReceivedWithTopic:(id)a3 enrollmentToken:(id)a4 syncTokens:(id)a5 forEnvironmentName:(id)a6;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)dealloc;
- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPersistentHistoryNotifier:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)setSubscribedStatusKeyPathUpdater:(id)a3;
@end

@implementation RMPushController

+ (RMPushController)sharedController
{
  if (qword_1000DB358 != -1) {
    dispatch_once(&qword_1000DB358, &stru_1000C6710);
  }
  v2 = (void *)qword_1000DB350;

  return (RMPushController *)v2;
}

+ (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005C604;
  block[3] = &unk_1000C5160;
  block[4] = a1;
  if (qword_1000DB360 != -1) {
    dispatch_once(&qword_1000DB360, block);
  }
}

- (RMPushController)initWithPushTokenByEnvironmentName:(id)a3 subscribedStatusKeyPathUpdater:(id)a4 context:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)RMPushController;
  v11 = [(RMPushController *)&v27 init];
  if (v11)
  {
    id v12 = [v8 copy];
    v13 = v12;
    if (v12) {
      v14 = v12;
    }
    else {
      v14 = &__NSDictionary0__struct;
    }
    objc_storeStrong((id *)&v11->_pushTokenByEnvironmentName, v14);

    objc_storeStrong((id *)&v11->_subscribedStatusKeyPathUpdater, a4);
    objc_storeStrong((id *)&v11->_context, a5);
    uint64_t v15 = objc_opt_new();
    connectionByEnvironmentName = v11->_connectionByEnvironmentName;
    v11->_connectionByEnvironmentName = (NSMutableDictionary *)v15;

    uint64_t v17 = objc_opt_new();
    pushTokenByEnvironmentNameLock = v11->_pushTokenByEnvironmentNameLock;
    v11->_pushTokenByEnvironmentNameLock = v17;

    v19 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v20 = dispatch_queue_create("com.apple.remotemanagementd.push", v19);
    serialQueue = v11->_serialQueue;
    v11->_serialQueue = (OS_dispatch_queue *)v20;

    v22 = [[RMPersistentHistoryNotifier alloc] initWithContext:v10];
    persistentHistoryNotifier = v11->_persistentHistoryNotifier;
    v11->_persistentHistoryNotifier = v22;

    v24 = [v10 transactionAuthor];
    if (v24)
    {
      v25 = +[NSSet setWithObject:v24];
      [(RMPersistentHistoryNotifier *)v11->_persistentHistoryNotifier setIgnoredTransactionAuthors:v25];
    }
    [(RMPersistentHistoryNotifier *)v11->_persistentHistoryNotifier setDelegate:v11];
  }
  return v11;
}

- (void)dealloc
{
  [(RMPushController *)self _stop];
  v3.receiver = self;
  v3.super_class = (Class)RMPushController;
  [(RMPushController *)&v3 dealloc];
}

- (void)_stop
{
  connectionByEnvironmentName = self->_connectionByEnvironmentName;
  if (connectionByEnvironmentName)
  {
    [(NSMutableDictionary *)connectionByEnvironmentName enumerateKeysAndObjectsUsingBlock:&stru_1000C6750];
    v4 = self->_connectionByEnvironmentName;
    self->_connectionByEnvironmentName = 0;
  }
}

- (void)_start
{
  objc_super v3 = _os_activity_create((void *)&_mh_execute_header, "PushController: starting", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  [(RMPersistentHistoryNotifier *)self->_persistentHistoryNotifier start];
  [(RMPushController *)self _updateConnections];
  [(RMPushController *)self _notifyPushTokenDidChangeIfNeeded];
  os_activity_scope_leave(&v4);
}

- (void)_updateConnections
{
  objc_super v3 = [(RMPushController *)self context];
  v19[0] = APSEnvironmentProduction;
  os_activity_scope_state_s v4 = objc_opt_new();
  v20[0] = v4;
  v19[1] = APSEnvironmentDevelopment;
  v5 = objc_opt_new();
  v20[1] = v5;
  v6 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005E86C;
  v17[3] = &unk_1000C51B0;
  id v7 = v6;
  id v18 = v7;
  [v3 performBlockAndWait:v17];

  id v8 = self->_connectionByEnvironmentName;
  id v9 = [(RMPushController *)self serialQueue];
  id v10 = self->_connectionByEnvironmentName;
  objc_sync_enter(v10);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005CB8C;
  v13[3] = &unk_1000C6778;
  v11 = v8;
  v14 = v11;
  id v12 = v9;
  id v15 = v12;
  v16 = self;
  [v7 enumerateKeysAndObjectsUsingBlock:v13];

  objc_sync_exit(v10);
}

+ (id)_connectionWithEnvironmentName:(id)a3 queue:(id)a4
{
  uint64_t v5 = qword_1000DB370;
  id v6 = a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&qword_1000DB370, &stru_1000C6798);
  }
  id v8 = [(id)qword_1000DB368 objectForKeyedSubscript:v7];
  id v9 = [objc_alloc((Class)APSConnection) initWithEnvironmentName:v7 namedDelegatePort:v8 queue:v6];

  return v9;
}

- (void)_notifyPushTokenDidChangeIfNeeded
{
  objc_super v3 = objc_opt_new();
  v24 = self->_pushTokenByEnvironmentNameLock;
  objc_sync_enter(v24);
  os_activity_scope_state_s v4 = self->_pushTokenByEnvironmentName;
  v25 = self;
  uint64_t v5 = [(RMPushController *)self _currentPushTokenByEnvironmentName];
  id v6 = [(NSDictionary *)v4 allKeys];
  id v7 = +[NSMutableSet setWithArray:v6];

  id v8 = [v5 allKeys];
  [v7 addObjectsFromArray:v8];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v13 = -[NSDictionary objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", v12, v24);
        v14 = [v5 objectForKeyedSubscript:v12];
        if (v14) {
          BOOL v15 = 1;
        }
        else {
          BOOL v15 = v13 == 0;
        }
        if (v15)
        {
          [v3 setObject:v14 forKeyedSubscript:v12];
        }
        else
        {
          v16 = +[RMLog push];
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v32 = v12;
            _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Push token for %{public}@ has been removed, ignoring change...", buf, 0xCu);
          }

          [v3 setObject:v13 forKeyedSubscript:v12];
        }
      }
      id v9 = [obj countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v9);
  }

  unsigned int v18 = [v3 isEqual:v4];
  char v19 = v18;
  if (v18)
  {
    p_super = +[RMLog push];
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
      sub_10005EB30(p_super);
    }
  }
  else
  {
    v21 = (NSDictionary *)[v3 copy];
    p_super = &v25->_pushTokenByEnvironmentName->super;
    v25->_pushTokenByEnvironmentName = v21;
  }

  objc_sync_exit(v24);
  if ((v19 & 1) == 0)
  {
    v22 = [(RMPushController *)v25 subscribedStatusKeyPathUpdater];
    [v22 notifyStatusDidChangeForKeyPath:RMModelStatusItemManagementPushToken];

    v23 = [(RMPushController *)v25 delegate];
    [v23 pushController:v25 didChangePushTokenByEnvironmentName:v3];
  }
}

- (id)_cachedPushTokenByEnvironment
{
  objc_super v3 = self->_pushTokenByEnvironmentNameLock;
  objc_sync_enter(v3);
  id v4 = [(NSDictionary *)self->_pushTokenByEnvironmentName copy];
  objc_sync_exit(v3);

  return v4;
}

- (id)_currentPushTokenByEnvironmentName
{
  objc_super v3 = objc_opt_new();
  id v4 = self->_connectionByEnvironmentName;
  objc_sync_enter(v4);
  connectionByEnvironmentName = self->_connectionByEnvironmentName;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10005D284;
  v8[3] = &unk_1000C67C0;
  id v6 = v3;
  id v9 = v6;
  [(NSMutableDictionary *)connectionByEnvironmentName enumerateKeysAndObjectsUsingBlock:v8];

  objc_sync_exit(v4);

  return v6;
}

- (NSSet)supportedKeyPaths
{
  uint64_t v5 = RMModelStatusItemManagementPushToken;
  v2 = +[NSArray arrayWithObjects:&v5 count:1];
  objc_super v3 = +[NSSet setWithArray:v2];

  return (NSSet *)v3;
}

- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [(RMPushController *)self _pushEnvironmentNameForManagementChannel:a4 error:a5];
  if (v9)
  {
    uint64_t v10 = objc_opt_new();
    uint64_t v11 = RMModelStatusItemManagementPushToken;
    if ([v8 containsObject:RMModelStatusItemManagementPushToken])
    {
      uint64_t v12 = [(RMPushController *)self _currentPushTokenByEnvironmentName];
      v13 = [(RMPushController *)self _cachedPushTokenByEnvironment];
      v14 = [v12 objectForKeyedSubscript:v9];
      uint64_t v15 = [v13 objectForKeyedSubscript:v9];
      v16 = (void *)v15;
      uint64_t v17 = v14;
      if (v14 || (uint64_t v17 = (void *)v15) != 0)
      {
        [v10 setObject:v17 forKeyedSubscript:v11];
      }
      else
      {
        char v19 = +[NSNull null];
        [v10 setObject:v19 forKeyedSubscript:v11];
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6
{
  return [(RMPushController *)self queryForStatusWithKeyPaths:a3 onBehalfOfManagementChannel:a5 error:a6];
}

- (id)_pushEnvironmentNameForManagementChannel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = sub_10005D6DC;
  v26 = sub_10005D6EC;
  id v27 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  char v19 = sub_10005D6DC;
  dispatch_queue_t v20 = sub_10005D6EC;
  id v21 = 0;
  id v7 = [(RMPushController *)self context];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005D6F4;
  v12[3] = &unk_1000C5798;
  id v8 = v6;
  id v13 = v8;
  v14 = &v16;
  uint64_t v15 = &v22;
  [v7 performBlockAndWait:v12];
  id v9 = (void *)v17[5];
  if (v9)
  {
    id v10 = 0;
    if (a4) {
      *a4 = v9;
    }
  }
  else
  {
    id v10 = (id)v23[5];
  }

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6 = a4;
  id v7 = [(RMPushController *)self _environmentNameForConnection:a3];
  id v8 = +[RMLog push];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    id v10 = v6;
    __int16 v11 = 2114;
    uint64_t v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Push token received: %{public}@ in environment: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  [(RMPushController *)self _notifyPushTokenDidChangeIfNeeded];
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a4;
  id v7 = [(RMPushController *)self _environmentNameForConnection:a3];
  id v8 = +[RMLog push];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v17 = v6;
    __int16 v18 = 2114;
    char v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Push notification received: %{public}@ in environment: %{public}@", buf, 0x16u);
  }

  if (v7)
  {
    int v9 = [v6 topic];
    id v10 = [v6 userInfo];
    if (v10)
    {
      id v15 = 0;
      __int16 v11 = +[RMProtocolPushMessage load:v10 serializationType:1 error:&v15];
      uint64_t v12 = v15;
      if (v11)
      {
        id v13 = [v11 messageEnrollmentToken];
        v14 = [v11 messageSyncTokens];
        [(RMPushController *)self _updatePushReceivedWithTopic:v9 enrollmentToken:v13 syncTokens:v14 forEnvironmentName:v7];
      }
      else
      {
        id v13 = +[RMLog push];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          id v17 = v9;
          __int16 v18 = 2114;
          char v19 = v7;
          __int16 v20 = 2114;
          id v21 = v12;
          _os_log_error_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Unable to parse push message for topic: %{public}@ in environment: %{public}@: %{public}@", buf, 0x20u);
        }
      }
    }
    else
    {
      uint64_t v12 = +[RMLog push];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10005EC1C();
      }
    }
  }
}

- (void)_updatePushReceivedWithTopic:(id)a3 enrollmentToken:(id)a4 syncTokens:(id)a5 forEnvironmentName:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = +[RMLog push];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    id v27 = v13;
    __int16 v28 = 2114;
    id v29 = v11;
    __int16 v30 = 2114;
    id v31 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Received push for environment: %{public}@ enrollment token: %{public}@ topic: %{public}@", buf, 0x20u);
  }

  [(RMPushController *)self context];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  void v20[2] = sub_10005DE08;
  v20[3] = &unk_1000C67E8;
  id v21 = v13;
  id v22 = v11;
  id v23 = v10;
  id v24 = v12;
  id v25 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = v25;
  id v16 = v12;
  id v17 = v10;
  id v18 = v11;
  id v19 = v13;
  [v15 performBlockAndWait:v20];
}

- (id)_environmentNameForConnection:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_10005D6DC;
  id v17 = sub_10005D6EC;
  id v18 = 0;
  uint64_t v5 = self->_connectionByEnvironmentName;
  objc_sync_enter(v5);
  connectionByEnvironmentName = self->_connectionByEnvironmentName;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005E3B4;
  v10[3] = &unk_1000C6810;
  id v7 = v4;
  id v11 = v7;
  id v12 = &v13;
  [(NSMutableDictionary *)connectionByEnvironmentName enumerateKeysAndObjectsUsingBlock:v10];

  objc_sync_exit(v5);
  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5
{
  id v6 = a4;
  unint64_t v7 = (unint64_t)[v6 changeType];
  id v8 = [v6 changedObjectID];
  int v9 = [v8 entity];

  id v10 = v9;
  id v11 = v10;
  if ((v7 & 0xFFFFFFFFFFFFFFFDLL) != 0)
  {
  }
  else
  {
    id v13 = +[RMHTTPConduitState entity];
    if ([v11 isKindOfEntity:v13])
    {
      id v14 = v11;
      goto LABEL_11;
    }
    id v22 = +[RMHTTPConduitConfig entity];
    unsigned __int8 v23 = [v11 isKindOfEntity:v22];

    if (v23) {
      goto LABEL_13;
    }
  }
  id v12 = [v6 updatedProperties];
  id v13 = v11;
  id v14 = v12;
  if (v7 == 1
    && (+[RMHTTPConduitState entity],
        uint64_t v15 = objc_claimAutoreleasedReturnValue(),
        unsigned int v16 = [v13 isKindOfEntity:v15],
        v15,
        v16))
  {
    id v17 = [v13 propertiesByName];
    id v18 = [v17 objectForKeyedSubscript:@"pushEnvironment"];

    id v19 = [v13 propertiesByName];
    __int16 v20 = [v19 objectForKeyedSubscript:@"pushTopic"];

    if ([v14 containsObject:v18])
    {

LABEL_11:
LABEL_13:

LABEL_14:
      BOOL v21 = 1;
      *a5 = 1;
      goto LABEL_15;
    }
    unsigned __int8 v25 = [v14 containsObject:v20];

    if (v25) {
      goto LABEL_14;
    }
  }
  else
  {
  }
  BOOL v21 = 0;
LABEL_15:

  return v21;
}

- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 insertedObjectIDs];
  if (![v8 count])
  {
    int v9 = [v7 updatedObjectIDs];
    if (![v9 count])
    {
      id v11 = [v7 deletedObjectIDs];
      id v12 = [v11 count];

      if (!v12) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  id v10 = _os_activity_create((void *)&_mh_execute_header, "PushController: refreshing", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v10, &v13);
  [(RMPushController *)self _updateConnections];
  os_activity_scope_leave(&v13);

LABEL_6:
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (RMPersistentHistoryNotifier)persistentHistoryNotifier
{
  return self->_persistentHistoryNotifier;
}

- (void)setPersistentHistoryNotifier:(id)a3
{
}

- (RMSubscribedStatusKeyPathUpdater)subscribedStatusKeyPathUpdater
{
  return self->_subscribedStatusKeyPathUpdater;
}

- (void)setSubscribedStatusKeyPathUpdater:(id)a3
{
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (RMPushControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RMPushControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_subscribedStatusKeyPathUpdater, 0);
  objc_storeStrong((id *)&self->_persistentHistoryNotifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_pushTokenByEnvironmentName, 0);
  objc_storeStrong((id *)&self->_pushTokenByEnvironmentNameLock, 0);

  objc_storeStrong((id *)&self->_connectionByEnvironmentName, 0);
}

@end