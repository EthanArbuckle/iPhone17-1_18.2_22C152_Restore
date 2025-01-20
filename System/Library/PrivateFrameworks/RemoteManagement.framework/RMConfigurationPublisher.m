@interface RMConfigurationPublisher
+ (id)_start;
+ (id)reportDetails;
+ (id)sharedConfigurationPublisher;
+ (void)fetchVisibleConfigurationUIs;
+ (void)reprocessActiveConfigurations;
+ (void)start;
- (NSManagedObjectContext)context;
- (NSMutableArray)plugins;
- (NSMutableDictionary)eventStreamSubscriptionByToken;
- (RMConfigurationPublisher)initWithPersistentActiveIdentifiers:(id)a3 context:(id)a4;
- (RMConfigurationPublisherDelegate)delegate;
- (RMPersistentActiveIdentifiers)persistentActiveIdentifiers;
- (id)_createInternalPlugins;
- (void)_addEventStreamSubscriberWithSubscription:(id)a3;
- (void)_fetchVisibleConfigurationUIs;
- (void)_loadAllConfigurationSubscribersAllowingThemToCheckForChanges;
- (void)_loadPlugins;
- (void)_managedObjectContextDidSave:(id)a3;
- (void)_notifyChangedConfigurationsForTypes:(id)a3;
- (void)_notifyChangedConfigurationsIfNeeded;
- (void)_notifyChangedConfigurationsIfNeededWithStatusUpdate:(BOOL)a3;
- (void)_notifyMissingConfigurationUIsForTypes:(id)a3;
- (void)_notifySubscribersWithConfigurationTypes:(id)a3;
- (void)_notifySubscribersWithMissingConfigurationUITypes:(id)a3;
- (void)_removeEventStreamSubscriberForToken:(unint64_t)a3;
- (void)_reprocessActiveConfigurations;
- (void)_start;
- (void)setContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEventStreamSubscriptionByToken:(id)a3;
- (void)setPersistentActiveIdentifiers:(id)a3;
- (void)setPlugins:(id)a3;
@end

@implementation RMConfigurationPublisher

+ (id)sharedConfigurationPublisher
{
  if (qword_1000DB098 != -1) {
    dispatch_once(&qword_1000DB098, &stru_1000C5700);
  }
  v2 = (void *)qword_1000DB090;

  return v2;
}

+ (void)start
{
  id v2 = +[RMConfigurationPublisher sharedConfigurationPublisher];
}

+ (id)_start
{
  if (+[RMBundle managementScope] == (id)1) {
    id v2 = "com.apple.remotemanagement.configs.daemon";
  }
  else {
    id v2 = "com.apple.remotemanagement.configs.agent";
  }
  dispatch_queue_t v3 = dispatch_queue_create(v2, 0);
  v4 = xpc_event_publisher_create();
  v5 = +[RMPersistentController sharedController];
  v6 = [v5 persistentContainer];

  id v7 = [v6 newBackgroundContext];
  v8 = +[RMInternalStateArchiver sharedArchiver];
  v9 = [v8 persistentActiveIdentifiers];
  v10 = [[RMConfigurationPublisher alloc] initWithPersistentActiveIdentifiers:v9 context:v7];
  [(RMConfigurationPublisher *)v10 setDelegate:v8];
  v15 = v10;
  v16 = v4;
  id v11 = v4;
  xpc_event_publisher_set_handler();
  v14 = v15;
  xpc_event_publisher_set_error_handler();
  xpc_event_publisher_activate();
  v12 = v14;

  return v12;
}

- (RMConfigurationPublisher)initWithPersistentActiveIdentifiers:(id)a3 context:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)RMConfigurationPublisher;
  v9 = [(RMConfigurationPublisher *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_persistentActiveIdentifiers, a3);
    uint64_t v11 = objc_opt_new();
    plugins = v10->_plugins;
    v10->_plugins = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v10->_context, a4);
    uint64_t v13 = objc_opt_new();
    eventStreamSubscriptionByToken = v10->_eventStreamSubscriptionByToken;
    v10->_eventStreamSubscriptionByToken = (NSMutableDictionary *)v13;

    uint64_t v15 = objc_opt_new();
    startLock = v10->_startLock;
    v10->_startLock = v15;

    uint64_t v17 = objc_opt_new();
    notificationLock = v10->_notificationLock;
    v10->_notificationLock = v17;

    uint64_t v19 = objc_opt_new();
    pluginsLock = v10->_pluginsLock;
    v10->_pluginsLock = v19;
  }
  return v10;
}

- (void)_start
{
  dispatch_queue_t v3 = self->_startLock;
  objc_sync_enter(v3);
  if (self->_started)
  {
    v4 = +[RMLog configurationPublisher];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_100024F24();
    }

    objc_sync_exit(v3);
  }
  else
  {
    self->_started = 1;
    objc_sync_exit(v3);

    dispatch_queue_t v3 = _os_activity_create((void *)&_mh_execute_header, "ConfigurationPublisher: Starting...", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    v5 = +[RMLog configurationPublisher];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting configuration publisher...", v10, 2u);
    }

    v6 = +[NSNotificationCenter defaultCenter];
    id v7 = [(RMConfigurationPublisher *)self context];
    id v8 = [v7 persistentStoreCoordinator];
    [v6 addObserver:self selector:"_managedObjectContextDidSave:" name:NSManagedObjectContextDidSaveObjectIDsNotification object:v8];

    [(RMConfigurationPublisher *)self _loadAllConfigurationSubscribersAllowingThemToCheckForChanges];
    [(RMConfigurationPublisher *)self _notifyChangedConfigurationsIfNeeded];
    v9 = +[RMLog configurationPublisher];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100024EF0();
    }

    os_activity_scope_leave(&state);
  }
}

- (void)_addEventStreamSubscriberWithSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [v4 token];
  v6 = +[NSNumber numberWithUnsignedLongLong:v5];
  id v7 = self->_pluginsLock;
  objc_sync_enter(v7);
  id v8 = +[RMLog configurationPublisher];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100024FD0();
  }

  v9 = [(RMConfigurationPublisher *)self eventStreamSubscriptionByToken];
  v10 = [v9 objectForKeyedSubscript:v6];

  if (v10)
  {
    objc_sync_exit(v7);

    uint64_t v11 = +[RMLog configurationPublisher];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100024F58();
    }
  }
  else
  {
    v12 = [(RMConfigurationPublisher *)self eventStreamSubscriptionByToken];
    [v12 setObject:v4 forKeyedSubscript:v6];

    uint64_t v13 = [(RMConfigurationPublisher *)self plugins];
    [v13 addObject:v4];

    objc_sync_exit(v7);
    uint64_t v11 = +[RMLog configurationPublisher];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 134218242;
      id v15 = v5;
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Added subscriber for %llu: %{public}@.", (uint8_t *)&v14, 0x16u);
    }
  }
}

- (void)_removeEventStreamSubscriberForToken:(unint64_t)a3
{
  id v5 = self->_pluginsLock;
  objc_sync_enter(v5);
  v6 = +[RMLog configurationPublisher];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_1000250BC();
  }

  id v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v8 = [(RMConfigurationPublisher *)self eventStreamSubscriptionByToken];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    v10 = [(RMConfigurationPublisher *)self eventStreamSubscriptionByToken];
    [v10 removeObjectForKey:v7];

    uint64_t v11 = [(RMConfigurationPublisher *)self plugins];
    [v11 removeObject:v9];

    objc_sync_exit(v5);
    v12 = +[RMLog configurationPublisher];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 134218242;
      unint64_t v14 = a3;
      __int16 v15 = 2114;
      __int16 v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removed subscriber for %llu: %{public}@.", (uint8_t *)&v13, 0x16u);
    }
  }
  else
  {

    objc_sync_exit(v5);
    v12 = +[RMLog configurationPublisher];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100025048();
    }
  }
}

- (void)_loadAllConfigurationSubscribersAllowingThemToCheckForChanges
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  __int16 v16 = _os_activity_create((void *)&_mh_execute_header, "ConfigurationPublisher: Loading configuration subscriber plugins...", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v16, &state);
  dispatch_queue_t v3 = self->_pluginsLock;
  objc_sync_enter(v3);
  [(RMConfigurationPublisher *)self _loadPlugins];
  id v4 = [(RMConfigurationPublisher *)self plugins];
  id v5 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v4 count]);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = [(RMConfigurationPublisher *)self plugins];
  id v7 = [v6 countByEnumeratingWithState:&v17 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * (void)v9);
        uint64_t v11 = +[RMLog configurationPublisher];
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v12 = [v10 identifier];
          sub_100025128(v12, v24, &v25, v11);
        }

        int v13 = [v10 identifier];
        [v5 addObject:v13];

        unint64_t v14 = [v10 configurationTypes];
        [v10 applyChangedConfigurationsTypes:v14];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v17 objects:v26 count:16];
    }
    while (v7);
  }

  __int16 v15 = +[RMLog configurationPublisher];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v5;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Finished loading configuration subscriber plugins: %{public}@", buf, 0xCu);
  }

  objc_sync_exit(v3);
  os_activity_scope_leave(&state);
}

- (void)_loadPlugins
{
  dispatch_queue_t v3 = +[RMLog configurationPublisher];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000251B0();
  }

  id v4 = [(RMConfigurationPublisher *)self plugins];
  id v5 = +[RMConfigurationSubscriberServicePlugin loadPlugins];
  [v4 addObjectsFromArray:v5];

  v6 = +[RMLog configurationPublisher];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_10002517C();
  }

  id v7 = [(RMConfigurationPublisher *)self plugins];
  uint64_t v8 = [(RMConfigurationPublisher *)self _createInternalPlugins];
  [v7 addObjectsFromArray:v8];
}

- (id)_createInternalPlugins
{
  id v2 = objc_opt_new();
  id v5 = v2;
  dispatch_queue_t v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

+ (void)reprocessActiveConfigurations
{
  id v2 = +[RMConfigurationPublisher sharedConfigurationPublisher];
  [v2 _reprocessActiveConfigurations];
}

- (void)_reprocessActiveConfigurations
{
  dispatch_queue_t v3 = objc_opt_new();
  id v4 = [(RMConfigurationPublisher *)self persistentActiveIdentifiers];
  [v4 setUniqueIdentifiersByConfigurationType:v3];

  [(RMConfigurationPublisher *)self _notifyChangedConfigurationsIfNeededWithStatusUpdate:0];
}

+ (void)fetchVisibleConfigurationUIs
{
  id v2 = +[RMConfigurationPublisher sharedConfigurationPublisher];
  [v2 _fetchVisibleConfigurationUIs];
}

- (void)_fetchVisibleConfigurationUIs
{
  dispatch_queue_t v3 = [(RMConfigurationPublisher *)self context];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002343C;
  v4[3] = &unk_1000C51B0;
  v4[4] = self;
  [v3 performBlockAndWait:v4];
}

+ (id)reportDetails
{
  id v2 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  dispatch_queue_t v3 = +[RMConfigurationPublisher sharedConfigurationPublisher];
  id v4 = [v3 plugins];

  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) reportDetails];
        [v2 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v2;
}

- (void)_managedObjectContextDidSave:(id)a3
{
  id v4 = a3;
  id v5 = self->_startLock;
  objc_sync_enter(v5);
  v45 = v4;
  if (self->_started)
  {
    val = self;
    objc_sync_exit(v5);

    id v6 = [v4 userInfo];
    uint64_t v7 = [v6 objectForKeyedSubscript:NSInsertedObjectIDsKey];

    uint64_t v8 = [v4 userInfo];
    v44 = [v8 objectForKeyedSubscript:NSUpdatedObjectIDsKey];

    v9 = [v4 userInfo];
    v43 = [v9 objectForKeyedSubscript:NSDeletedObjectIDsKey];

    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    obj = v7;
    id v10 = [obj countByEnumeratingWithState:&v49 objects:buf count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v50;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v50 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(id *)(*((void *)&v49 + 1) + 8 * i);
          long long v14 = objc_msgSend(v13, "entity", val, v43, v44);
          __int16 v15 = +[RMConfigurationPayload entity];
          if ([v14 isKindOfEntity:v15]) {
            goto LABEL_37;
          }
          __int16 v16 = +[RMConfigurationPayloadState entity];
          if ([v14 isKindOfEntity:v16])
          {

LABEL_37:
LABEL_38:

LABEL_45:
            objc_initWeak((id *)buf, val);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100023EB4;
            block[3] = &unk_1000C5248;
            objc_copyWeak(&v48, (id *)buf);
            dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
            objc_destroyWeak(&v48);
            objc_destroyWeak((id *)buf);
            goto LABEL_46;
          }
          long long v17 = +[RMAssetPayloadReference entity];
          unsigned __int8 v18 = [v14 isKindOfEntity:v17];

          if (v18) {
            goto LABEL_38;
          }
        }
        id v10 = [obj countByEnumeratingWithState:&v49 objects:buf count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    id v19 = v44;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v20 = v19;
    id v21 = [v20 countByEnumeratingWithState:&v49 objects:buf count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v50;
      while (2)
      {
        for (j = 0; j != v21; j = (char *)j + 1)
        {
          if (*(void *)v50 != v22) {
            objc_enumerationMutation(v20);
          }
          id v24 = *(id *)(*((void *)&v49 + 1) + 8 * (void)j);
          uint64_t v25 = [v24 entity];
          v26 = +[RMConfigurationPayload entity];
          if ([v25 isKindOfEntity:v26]) {
            goto LABEL_40;
          }
          v27 = +[RMConfigurationPayloadState entity];
          if ([v25 isKindOfEntity:v27])
          {

LABEL_40:
LABEL_44:

            goto LABEL_45;
          }
          v28 = +[RMAssetPayloadReference entity];
          unsigned __int8 v29 = [v25 isKindOfEntity:v28];

          if (v29) {
            goto LABEL_44;
          }
        }
        id v21 = [v20 countByEnumeratingWithState:&v49 objects:buf count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }

    id v30 = v43;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v20 = v30;
    id v31 = [v20 countByEnumeratingWithState:&v49 objects:buf count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v50;
      while (2)
      {
        for (k = 0; k != v31; k = (char *)k + 1)
        {
          if (*(void *)v50 != v32) {
            objc_enumerationMutation(v20);
          }
          id v34 = *(id *)(*((void *)&v49 + 1) + 8 * (void)k);
          v35 = [v34 entity];
          v36 = +[RMConfigurationPayload entity];
          if ([v35 isKindOfEntity:v36]) {
            goto LABEL_43;
          }
          v37 = +[RMConfigurationPayloadState entity];
          if ([v35 isKindOfEntity:v37])
          {

LABEL_43:
            goto LABEL_44;
          }
          v38 = +[RMAssetPayloadReference entity];
          unsigned __int8 v39 = [v35 isKindOfEntity:v38];

          if (v39) {
            goto LABEL_44;
          }
        }
        id v31 = [v20 countByEnumeratingWithState:&v49 objects:buf count:16];
        if (v31) {
          continue;
        }
        break;
      }
    }

LABEL_46:
    id v5 = obj;
  }
  else
  {
    v40 = +[RMLog configurationPublisher];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = [v4 name];
      *(_DWORD *)buf = 138543362;
      v54 = v41;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Ignoring %{public}@, the publisher has not finish starting yet.", buf, 0xCu);
    }
    objc_sync_exit(v5);
  }
}

- (void)_notifyChangedConfigurationsIfNeeded
{
}

- (void)_notifyChangedConfigurationsIfNeededWithStatusUpdate:(BOOL)a3
{
  BOOL v34 = a3;
  dispatch_queue_t v3 = +[RMLog configurationPublisher];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100025328();
  }

  obj = self->_notificationLock;
  objc_sync_enter(obj);
  uint64_t v41 = 0;
  v42 = &v41;
  uint64_t v43 = 0x3032000000;
  v44 = sub_100024434;
  v45 = sub_100024444;
  id v46 = 0;
  id v4 = [(RMConfigurationPublisher *)self context];
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10002444C;
  v40[3] = &unk_1000C5298;
  v40[4] = &v41;
  [v4 performBlockAndWait:v40];

  id v5 = self->_persistentActiveIdentifiers;
  [(RMConfigurationPublisher *)self setPersistentActiveIdentifiers:v42[5]];
  id v6 = (void *)v42[5];
  v36 = v5;
  id v37 = v6;
  uint64_t v7 = [(RMPersistentActiveIdentifiers *)v36 uniqueIdentifiersByConfigurationType];
  uint64_t v8 = v7;
  if (v7) {
    id v9 = v7;
  }
  else {
    id v9 = (id)objc_opt_new();
  }
  id v10 = v9;

  uint64_t v11 = [v37 uniqueIdentifiersByConfigurationType];
  long long v12 = [v10 allKeys];
  id v13 = [v11 allKeys];
  long long v14 = [v12 arrayByAddingObjectsFromArray:v13];
  __int16 v15 = +[NSSet setWithArray:v14];

  unsigned __int8 v39 = objc_opt_new();
  long long v50 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  id v16 = v15;
  id v17 = [v16 countByEnumeratingWithState:&v47 objects:buf count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v48;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v16);
        }
        uint64_t v20 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        id v21 = [v10 objectForKeyedSubscript:v20];
        uint64_t v22 = v21;
        if (v21) {
          id v23 = v21;
        }
        else {
          id v23 = (id)objc_opt_new();
        }
        id v24 = v23;

        uint64_t v25 = [v11 objectForKeyedSubscript:v20];
        v26 = v25;
        if (v25) {
          id v27 = v25;
        }
        else {
          id v27 = (id)objc_opt_new();
        }
        v28 = v27;

        if (([v24 isEqualToSet:v28] & 1) == 0) {
          [v39 addObject:v20];
        }
      }
      id v17 = [v16 countByEnumeratingWithState:&v47 objects:buf count:16];
    }
    while (v17);
  }

  if ([v39 count])
  {
    unsigned __int8 v29 = +[RMLog configurationPublisher];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      long long v52 = v39;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Changed configuration types: %{public}@", buf, 0xCu);
    }

    [(RMConfigurationPublisher *)self _notifyChangedConfigurationsForTypes:v39];
    id v30 = [(RMConfigurationPublisher *)self delegate];
    [v30 configurationPublisher:self didChangePersistentActiveIdentifiers:v42[5]];

    if (v34)
    {
      id v31 = +[RMLog configurationPublisher];
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        sub_1000252C0();
      }

      uint64_t v32 = +[RMStoreController sharedController];
      [v32 observerStoresDidChange];

      v33 = +[RMSubscribedStatusKeyPathUpdater sharedUpdater];
      [v33 notifyStatusDidChangeForDeclarations];
    }
    else
    {
      v33 = +[RMLog configurationPublisher];
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        sub_1000252F4();
      }
    }
  }
  else
  {
    v33 = +[RMLog configurationPublisher];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      sub_10002528C();
    }
  }

  _Block_object_dispose(&v41, 8);
  objc_sync_exit(obj);
}

- (void)_notifyChangedConfigurationsForTypes:(id)a3
{
  id v4 = a3;

  id v5 = +[RMLog configurationPublisher];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_1000253D0(v4, v5);
  }

  [(RMConfigurationPublisher *)self _notifySubscribersWithConfigurationTypes:v4];
  id v6 = +[RMLog configurationPublisher];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v4 allObjects];
    uint64_t v8 = [v7 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
    id v9 = [v8 componentsJoinedByString:@", "];

    int v10 = 138543362;
    uint64_t v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notified configuration subscribers with configurations of types: %{public}@", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_notifySubscribersWithConfigurationTypes:(id)a3
{
  id v4 = a3;

  obj = self->_pluginsLock;
  objc_sync_enter(obj);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(RMConfigurationPublisher *)self plugins];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v10 = [v9 configurationTypes];
        id v11 = [v10 mutableCopy];

        [v11 intersectSet:v4];
        if ([v11 count])
        {
          long long v12 = +[RMLog configurationPublisher];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            id v13 = [v9 identifier];
            *(_DWORD *)buf = 138543362;
            uint64_t v20 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Triggering configuration subscriber plugin: %{public}@", buf, 0xCu);
          }
          [v9 applyChangedConfigurationsTypes:v11];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }

  objc_sync_exit(obj);
}

- (void)_notifyMissingConfigurationUIsForTypes:(id)a3
{
  id v4 = a3;

  id v5 = +[RMLog configurationPublisher];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100025498(v4, v5);
  }

  [(RMConfigurationPublisher *)self _notifySubscribersWithMissingConfigurationUITypes:v4];
  id v6 = +[RMLog configurationPublisher];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = [v4 allObjects];
    uint64_t v8 = [v7 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
    id v9 = [v8 componentsJoinedByString:@", "];

    int v10 = 138543362;
    id v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Notified configuration subscribers for UI with configurations of types: %{public}@", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_notifySubscribersWithMissingConfigurationUITypes:(id)a3
{
  id v4 = a3;

  obj = self->_pluginsLock;
  objc_sync_enter(obj);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [(RMConfigurationPublisher *)self plugins];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        int v10 = [v9 configurationTypes];
        id v11 = [v10 mutableCopy];

        [v11 intersectSet:v4];
        if ([v11 count])
        {
          long long v12 = +[RMLog configurationPublisher];
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            id v13 = [v9 identifier];
            *(_DWORD *)buf = 138543362;
            uint64_t v20 = v13;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Triggering configuration subscriber UI plugin: %{public}@", buf, 0xCu);
          }
          [v9 fetchMissingConfigurationUIs];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v6);
  }

  objc_sync_exit(obj);
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (RMPersistentActiveIdentifiers)persistentActiveIdentifiers
{
  return self->_persistentActiveIdentifiers;
}

- (void)setPersistentActiveIdentifiers:(id)a3
{
}

- (NSMutableArray)plugins
{
  return self->_plugins;
}

- (void)setPlugins:(id)a3
{
}

- (NSMutableDictionary)eventStreamSubscriptionByToken
{
  return self->_eventStreamSubscriptionByToken;
}

- (void)setEventStreamSubscriptionByToken:(id)a3
{
}

- (RMConfigurationPublisherDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RMConfigurationPublisherDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_eventStreamSubscriptionByToken, 0);
  objc_storeStrong((id *)&self->_plugins, 0);
  objc_storeStrong((id *)&self->_persistentActiveIdentifiers, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_pluginsLock, 0);
  objc_storeStrong((id *)&self->_notificationLock, 0);

  objc_storeStrong((id *)&self->_startLock, 0);
}

@end