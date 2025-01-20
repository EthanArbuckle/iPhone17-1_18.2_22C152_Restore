@interface RMExternalStatusPublisher
+ (RMExternalStatusPublisher)sharedPublisher;
+ (void)start;
- (BOOL)persistStatusWithStoreIdentifier:(id)a3 status:(id)a4 error:(id *)a5;
- (NSArray)plugins;
- (NSDictionary)eventsByStatusKey;
- (NSDictionary)predicateStatusKeysByStoreIdentifier;
- (NSDictionary)publisherByEventKey;
- (NSManagedObjectContext)context;
- (NSSet)allEvents;
- (NSSet)statusKeys;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_event_publisher)XPCEventPublisher;
- (RMExternalStatusPublisher)initWithContext:(id)a3;
- (RMSharedLock)persistLock;
- (id)_buildDictionaryFromArrayValue:(id)a3;
- (id)_fetchSubscribedStatusKeyPaths;
- (id)_filteredArray:(id)a3 metadata:(id)a4 lastAcknowledgedDate:(id)a5;
- (id)_mergeOldStatus:(id)a3 newStatus:(id)a4 changedStatusKeyPaths:(id)a5 error:(id *)a6;
- (id)_queryForFilteredStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6;
- (id)_subscribedStatusKeyPathsByStoreForKeyPaths:(id)a3;
- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5;
- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6;
- (id)reportDetails;
- (id)statusForChannel:(id)a3 error:(id *)a4;
- (void)_buildPredicateStatusKeyPaths;
- (void)_loadAllStatusPublishers;
- (void)_mergeOldArrayValue:(id)a3 oldValueMetadata:(id)a4 newValue:(id)a5 completionHandler:(id)a6;
- (void)_notifyChangesWithStoreIdentifier:(id)a3 statusKeyPaths:(id)a4;
- (void)_start;
- (void)_waitForQueueWithCompletionHandler:(id)a3;
- (void)didReceiveNotificationForStream:(id)a3 notificationName:(id)a4;
- (void)listenToNotificationsForAllKeyPaths;
- (void)listenToNotificationsForSubscribedKeyPaths:(id)a3;
- (void)publishAllSubscribedStatus;
- (void)publishStatusKeys:(id)a3 storeIdentifier:(id)a4;
- (void)setAllEvents:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEventsByStatusKey:(id)a3;
- (void)setPlugins:(id)a3;
- (void)setPredicateStatusKeysByStoreIdentifier:(id)a3;
- (void)setPublisherByEventKey:(id)a3;
- (void)setStatusKeys:(id)a3;
- (void)setXPCEventPublisher:(id)a3;
@end

@implementation RMExternalStatusPublisher

+ (RMExternalStatusPublisher)sharedPublisher
{
  if (qword_1000DB138 != -1) {
    dispatch_once(&qword_1000DB138, &stru_1000C59E8);
  }
  v2 = (void *)qword_1000DB130;

  return (RMExternalStatusPublisher *)v2;
}

+ (void)start
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D19C;
  block[3] = &unk_1000C5160;
  block[4] = a1;
  if (qword_1000DB140 != -1) {
    dispatch_once(&qword_1000DB140, block);
  }
}

- (RMExternalStatusPublisher)initWithContext:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)RMExternalStatusPublisher;
  v6 = [(RMExternalStatusPublisher *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    XPCEventPublisher = v7->_XPCEventPublisher;
    v7->_XPCEventPublisher = 0;

    plugins = v7->_plugins;
    v7->_plugins = (NSArray *)&__NSArray0__struct;

    publisherByEventKey = v7->_publisherByEventKey;
    v7->_publisherByEventKey = (NSDictionary *)&__NSDictionary0__struct;

    eventsByStatusKey = v7->_eventsByStatusKey;
    v7->_eventsByStatusKey = (NSDictionary *)&__NSDictionary0__struct;

    uint64_t v12 = objc_opt_new();
    statusKeys = v7->_statusKeys;
    v7->_statusKeys = (NSSet *)v12;

    predicateStatusKeysByStoreIdentifier = v7->_predicateStatusKeysByStoreIdentifier;
    v7->_predicateStatusKeysByStoreIdentifier = (NSDictionary *)&__NSDictionary0__struct;

    v15 = (RMSharedLock *)+[RMSharedLock newSharedLockWithDescription:@"RMExternalStatusPublisher"];
    persistLock = v7->_persistLock;
    v7->_persistLock = v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.RemoteManagement.RMExternalStatusPublisher", 0);
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = (OS_dispatch_queue *)v17;
  }
  return v7;
}

- (void)_start
{
  v3 = _os_activity_create((void *)&_mh_execute_header, "ExternalStatusPublisher: Starting...", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v20.opaque[0] = 0;
  v20.opaque[1] = 0;
  os_activity_scope_enter(v3, &v20);
  v4 = +[RMLog externalStatusPublisher];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10003135C(v4, v5, v6, v7, v8, v9, v10, v11);
  }

  [(RMExternalStatusPublisher *)self _loadAllStatusPublishers];
  [(RMExternalStatusPublisher *)self listenToNotificationsForAllKeyPaths];
  [(RMExternalStatusPublisher *)self publishAllSubscribedStatus];
  uint64_t v12 = +[RMLog externalStatusPublisher];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100031324(v12, v13, v14, v15, v16, v17, v18, v19);
  }

  os_activity_scope_leave(&v20);
}

- (void)_loadAllStatusPublishers
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v26 = _os_activity_create((void *)&_mh_execute_header, "ExternalStatusPublisher: Loading XPC service plugins...", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v26, &state);
  v2 = +[RMLog externalStatusPublisher];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100031394(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t v10 = +[RMStatusPublisherServicePlugin loadPlugins];
  [(RMExternalStatusPublisher *)self setPlugins:v10];

  v30 = objc_opt_new();
  v29 = objc_opt_new();
  v28 = objc_opt_new();
  uint64_t v11 = objc_opt_new();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v12 = [(RMExternalStatusPublisher *)self plugins];
  id v13 = [v12 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v37;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v17 = [v16 statusKeysByXPCEvent];
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_10002D7D8;
        v31[3] = &unk_1000C5A10;
        id v32 = v30;
        v33 = v16;
        id v34 = v29;
        id v35 = v28;
        [v17 enumerateKeysAndObjectsUsingBlock:v31];

        uint64_t v18 = [v16 statusKeys];
        [v11 unionSet:v18];
      }
      id v13 = [v12 countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v13);
  }

  id v19 = [v30 copy];
  [(RMExternalStatusPublisher *)self setPublisherByEventKey:v19];

  id v20 = [v29 copy];
  [(RMExternalStatusPublisher *)self setEventsByStatusKey:v20];

  id v21 = [v28 copy];
  [(RMExternalStatusPublisher *)self setAllEvents:v21];

  id v22 = [v11 copy];
  [(RMExternalStatusPublisher *)self setStatusKeys:v22];

  v23 = +[RMLog externalStatusPublisher];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = [(RMExternalStatusPublisher *)self plugins];
    v25 = [v24 valueForKey:@"identifier"];
    *(_DWORD *)buf = 138543362;
    v42 = v25;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Finished loading status publisher XPC service plugins: %{public}@", buf, 0xCu);
  }
  os_activity_scope_leave(&state);
}

- (void)listenToNotificationsForAllKeyPaths
{
  uint64_t v3 = [(RMExternalStatusPublisher *)self _fetchSubscribedStatusKeyPaths];
  [(RMExternalStatusPublisher *)self _buildPredicateStatusKeyPaths];
  uint64_t v4 = +[RMLog externalStatusPublisher];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Subscribing to all key paths: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [(RMExternalStatusPublisher *)self listenToNotificationsForSubscribedKeyPaths:v3];
}

- (void)listenToNotificationsForSubscribedKeyPaths:(id)a3
{
  uint64_t v4 = +[NSMutableSet setWithSet:a3];
  int v5 = [(RMExternalStatusPublisher *)self predicateStatusKeysByStoreIdentifier];
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_10002DE1C;
  v51[3] = &unk_1000C5A38;
  id v6 = v4;
  id v52 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v51];

  uint64_t v7 = [(RMExternalStatusPublisher *)self allEvents];
  id v8 = [v7 mutableCopy];

  uint64_t v9 = objc_opt_new();
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v34 = *(void *)v48;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v48 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v47 + 1) + 8 * (void)v12);
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        uint64_t v14 = self;
        uint64_t v15 = [(RMExternalStatusPublisher *)self eventsByStatusKey];
        uint64_t v16 = [v15 objectForKeyedSubscript:v13];

        id v17 = [v16 countByEnumeratingWithState:&v43 objects:v55 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v44;
          do
          {
            id v20 = 0;
            do
            {
              if (*(void *)v44 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = *(void *)(*((void *)&v43 + 1) + 8 * (void)v20);
              if (v21)
              {
                [v9 addObject:*(void *)(*((void *)&v43 + 1) + 8 * (void)v20)];
                [v8 removeObject:v21];
              }
              id v20 = (char *)v20 + 1;
            }
            while (v18 != v20);
            id v18 = [v16 countByEnumeratingWithState:&v43 objects:v55 count:16];
          }
          while (v18);
        }

        uint64_t v12 = (char *)v12 + 1;
        self = v14;
      }
      while (v12 != v11);
      id v11 = [obj countByEnumeratingWithState:&v47 objects:v56 count:16];
    }
    while (v11);
  }

  id v22 = +[RMXPCNotifications sharedNotifier];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v23 = v9;
  id v24 = [v23 countByEnumeratingWithState:&v39 objects:v54 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v40;
    do
    {
      v27 = 0;
      do
      {
        if (*(void *)v40 != v26) {
          objc_enumerationMutation(v23);
        }
        [v22 addObserverForEvent:*(void *)(*((void *)&v39 + 1) + 8 * (void)v27) observer:self];
        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v25 = [v23 countByEnumeratingWithState:&v39 objects:v54 count:16];
    }
    while (v25);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v28 = v8;
  id v29 = [v28 countByEnumeratingWithState:&v35 objects:v53 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v31 = *(void *)v36;
    do
    {
      id v32 = 0;
      do
      {
        if (*(void *)v36 != v31) {
          objc_enumerationMutation(v28);
        }
        [v22 removeObserverForEvent:*(void *)(*((void *)&v35 + 1) + 8 * (void)v32)];
        id v32 = (char *)v32 + 1;
      }
      while (v30 != v32);
      id v30 = [v28 countByEnumeratingWithState:&v35 objects:v53 count:16];
    }
    while (v30);
  }
}

- (void)didReceiveNotificationForStream:(id)a3 notificationName:(id)a4
{
  int v5 = +[RMXPCEvent eventKeyForStream:a3 notificationName:a4];
  id v6 = +[RMLog externalStatusPublisher];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v31 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Received status notification: %{public}@", buf, 0xCu);
  }

  uint64_t v7 = [(RMExternalStatusPublisher *)self publisherByEventKey];
  id v8 = [v7 objectForKeyedSubscript:v5];

  if (v8)
  {
    id v20 = v5;
    uint64_t v19 = [v8 statusKeys];
    uint64_t v9 = -[RMExternalStatusPublisher _subscribedStatusKeyPathsByStoreForKeyPaths:](self, "_subscribedStatusKeyPathsByStoreForKeyPaths:");
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v26;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v26 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          uint64_t v15 = [v9 objectForKeyedSubscript:v14];
          uint64_t v16 = [(RMExternalStatusPublisher *)self dispatchQueue];
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10002E0BC;
          block[3] = &unk_1000C5A60;
          id v22 = v8;
          id v23 = v15;
          uint64_t v24 = v14;
          id v17 = v15;
          dispatch_async(v16, block);
        }
        id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v11);
    }

    id v18 = v19;
    int v5 = v20;
  }
  else
  {
    id v18 = +[RMLog externalStatusPublisher];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_1000313CC();
    }
  }
}

- (void)_waitForQueueWithCompletionHandler:(id)a3
{
  id v4 = a3;
  int v5 = [(RMExternalStatusPublisher *)self dispatchQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E178;
  block[3] = &unk_1000C5530;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

- (id)queryForStatusWithKeyPaths:(id)a3 onBehalfOfManagementChannel:(id)a4 error:(id *)a5
{
  return [(RMExternalStatusPublisher *)self _queryForFilteredStatusWithKeyPaths:a3 lastAcknowledgedDateByKeyPath:0 onBehalfOfManagementChannel:a4 error:a5];
}

- (id)queryForUnacknowledgedStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6
{
  return [(RMExternalStatusPublisher *)self _queryForFilteredStatusWithKeyPaths:a3 lastAcknowledgedDateByKeyPath:a4 onBehalfOfManagementChannel:a5 error:a6];
}

- (id)_queryForFilteredStatusWithKeyPaths:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4 onBehalfOfManagementChannel:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v45 = 0;
  long long v40 = self;
  uint64_t v13 = [(RMExternalStatusPublisher *)self statusForChannel:v12 error:&v45];
  id v14 = v45;
  uint64_t v15 = v14;
  if (v13)
  {
    id v35 = v14;
    id v36 = v12;
    uint64_t v16 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v10 count]);
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v37 = v10;
    id v17 = v10;
    id v18 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v42;
      long long v38 = v13;
      id v39 = v17;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v42 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          id v23 = [v13 valueForKeyPath:v22];
          if (v23)
          {
            if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
            {
              uint64_t v24 = +[NSString stringWithFormat:@"%@.%@", @"_metadata", v22];
              [v13 objectForKeyedSubscript:v24];
              v26 = long long v25 = v16;

              long long v27 = [v11 objectForKeyedSubscript:v22];
              [(RMExternalStatusPublisher *)v40 _filteredArray:v23 metadata:v26 lastAcknowledgedDate:v27];
              id v28 = v19;
              uint64_t v29 = v20;
              v31 = id v30 = v11;
              [v25 setObject:v31 forKeyedSubscript:v22];

              id v11 = v30;
              uint64_t v20 = v29;
              id v19 = v28;

              uint64_t v16 = v25;
              uint64_t v13 = v38;
              id v17 = v39;
            }
            else
            {
              [v16 setObject:v23 forKeyedSubscript:v22];
            }
          }
          else
          {
            id v32 = +[RMErrorUtilities createUnsupportedStatusValueErrorWithKeyPath:v22];
            [v16 setObject:v32 forKeyedSubscript:v22];
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v41 objects:v46 count:16];
      }
      while (v19);
    }

    id v12 = v36;
    id v10 = v37;
    uint64_t v15 = v35;
  }
  else
  {
    v33 = +[RMLog externalStatusPublisher];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      sub_100031434(v12, (uint64_t)v15, v33);
    }

    uint64_t v16 = 0;
    if (a6 && v15)
    {
      uint64_t v16 = 0;
      *a6 = v15;
    }
  }

  return v16;
}

- (id)statusForChannel:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = sub_10002E694;
  long long v26 = sub_10002E6A4;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10002E694;
  uint64_t v20 = sub_10002E6A4;
  id v21 = 0;
  uint64_t v7 = [(RMExternalStatusPublisher *)self persistLock];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002E6AC;
  v12[3] = &unk_1000C5A88;
  id v14 = &v22;
  id v8 = v6;
  id v13 = v8;
  uint64_t v15 = &v16;
  [v7 performBlockUnderLock:v12];

  if (a4)
  {
    uint64_t v9 = (void *)v17[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = (id)v23[5];

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (void)publishAllSubscribedStatus
{
  v2 = +[RMLog externalStatusPublisher];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Publishing all subscribed status items", buf, 2u);
  }

  [(RMExternalStatusPublisher *)self _subscribedStatusKeyPathsByStoreForKeyPaths:0];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v20 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
  if (v20)
  {
    uint64_t v19 = *(void *)v32;
    *(void *)&long long v3 = 134218242;
    long long v18 = v3;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = v4;
        uint64_t v5 = *(void *)(*((void *)&v31 + 1) + 8 * v4);
        id v6 = objc_msgSend(obj, "objectForKeyedSubscript:", v5, v18);
        uint64_t v7 = +[RMLog externalStatusPublisher];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          id v17 = [v6 count];
          *(_DWORD *)buf = v18;
          id v37 = v17;
          __int16 v38 = 2114;
          uint64_t v39 = v5;
          _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Publishing %lu status items for store: %{public}@", buf, 0x16u);
        }

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v8 = [(RMExternalStatusPublisher *)self plugins];
        id v9 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
        if (v9)
        {
          id v10 = v9;
          uint64_t v11 = *(void *)v28;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v28 != v11) {
                objc_enumerationMutation(v8);
              }
              id v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
              id v14 = [v13 statusKeys];
              id v15 = [v14 mutableCopy];

              [v15 intersectSet:v6];
              if ([v15 count])
              {
                uint64_t v16 = [(RMExternalStatusPublisher *)self dispatchQueue];
                block[0] = _NSConcreteStackBlock;
                block[1] = 3221225472;
                block[2] = sub_10002EA90;
                block[3] = &unk_1000C5A60;
                void block[4] = v13;
                id v25 = v15;
                uint64_t v26 = v5;
                dispatch_async(v16, block);
              }
            }
            id v10 = [v8 countByEnumeratingWithState:&v27 objects:v35 count:16];
          }
          while (v10);
        }

        uint64_t v4 = v22 + 1;
      }
      while ((id)(v22 + 1) != v20);
      id v20 = [obj countByEnumeratingWithState:&v31 objects:v40 count:16];
    }
    while (v20);
  }
}

- (BOOL)persistStatusWithStoreIdentifier:(id)a3 status:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_new();
  uint64_t v27 = 0;
  long long v28 = &v27;
  uint64_t v29 = 0x3032000000;
  long long v30 = sub_10002E694;
  long long v31 = sub_10002E6A4;
  id v32 = 0;
  uint64_t v11 = [(RMExternalStatusPublisher *)self persistLock];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10002ED6C;
  v21[3] = &unk_1000C5AB0;
  id v12 = v8;
  uint64_t v26 = &v27;
  id v22 = v12;
  id v23 = self;
  id v13 = v9;
  id v24 = v13;
  id v14 = v10;
  id v25 = v14;
  [v11 performBlockUnderLock:v21];

  uint64_t v15 = v28[5];
  if (v15)
  {
    uint64_t v16 = +[RMLog externalStatusPublisher];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_100031668();
    }

    if (a5)
    {
      id v17 = (void *)v28[5];
      if (v17) {
        *a5 = v17;
      }
    }
  }
  else if ([v14 count])
  {
    long long v18 = +[RMLog externalStatusPublisher];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      sub_100031600();
    }

    [(RMExternalStatusPublisher *)self _notifyChangesWithStoreIdentifier:v12 statusKeyPaths:v14];
  }
  else
  {
    uint64_t v19 = +[RMLog externalStatusPublisher];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      sub_100031598();
    }
  }
  _Block_object_dispose(&v27, 8);

  return v15 == 0;
}

- (void)_notifyChangesWithStoreIdentifier:(id)a3 statusKeyPaths:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[RMSubscribedStatusKeyPathUpdater sharedUpdater];
  [v8 notifyStatusDidChangeForKeyPaths:v7 managementSourceIdentifier:v6];

  id v9 = [(RMExternalStatusPublisher *)self predicateStatusKeysByStoreIdentifier];
  id v10 = [v9 objectForKeyedSubscript:v6];
  uint64_t v11 = +[NSMutableSet setWithArray:v10];

  [v11 intersectSet:v7];
  if ([v11 count])
  {
    id v12 = +[RMLog externalStatusPublisher];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000317C0();
    }

    id v13 = +[RMPredicateStatusUpdater sharedUpdater];
    [v13 notifyPredicateStatusDidChangeForManagementSourceIdentifier:v6];
  }
}

- (void)publishStatusKeys:(id)a3 storeIdentifier:(id)a4
{
  id v6 = a3;
  id v17 = self;
  id v18 = a4;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = [(RMExternalStatusPublisher *)self plugins];
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v8) {
    goto LABEL_12;
  }
  id v9 = v8;
  char v10 = 0;
  uint64_t v11 = *(void *)v23;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v23 != v11) {
        objc_enumerationMutation(v7);
      }
      id v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
      id v14 = [v6 mutableCopy];
      uint64_t v15 = [v13 statusKeys];
      [v14 intersectSet:v15];

      if ([v14 count])
      {
        uint64_t v16 = [(RMExternalStatusPublisher *)v17 dispatchQueue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10002F220;
        block[3] = &unk_1000C5A60;
        void block[4] = v13;
        id v20 = v14;
        id v21 = v18;
        dispatch_async(v16, block);

        char v10 = 1;
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v9);

  if (v10)
  {
    id v7 = [(RMExternalStatusPublisher *)v17 dispatchQueue];
    dispatch_sync(v7, &stru_1000C5AD0);
LABEL_12:
  }
}

- (id)reportDetails
{
  long long v3 = objc_opt_new();
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [(RMExternalStatusPublisher *)self plugins];
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
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) reportDetails];
        [v3 addObject:v9];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_fetchSubscribedStatusKeyPaths
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  long long v11 = sub_10002E694;
  long long v12 = sub_10002E6A4;
  id v13 = 0;
  v2 = [(RMExternalStatusPublisher *)self context];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10002F490;
  v7[3] = &unk_1000C5298;
  v7[4] = &v8;
  [v2 performBlockAndWait:v7];
  long long v3 = (void *)v9[5];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)objc_opt_new();
  }
  id v5 = v4;

  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_buildPredicateStatusKeyPaths
{
  long long v3 = [(RMExternalStatusPublisher *)self context];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002F6B0;
  v6[3] = &unk_1000C51B0;
  v6[4] = self;
  [v3 performBlockAndWait:v6];
  id v4 = +[RMLog externalStatusPublisher];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [(RMExternalStatusPublisher *)self predicateStatusKeysByStoreIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "All predicate status key paths: %{public}@", buf, 0xCu);
  }
}

- (id)_subscribedStatusKeyPathsByStoreForKeyPaths:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  id v6 = [(RMExternalStatusPublisher *)self context];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002F9C8;
  v12[3] = &unk_1000C5A60;
  id v13 = v4;
  long long v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  [v6 performBlockAndWait:v12];
  id v9 = v15;
  id v10 = v7;

  return v10;
}

- (id)_mergeOldStatus:(id)a3 newStatus:(id)a4 changedStatusKeyPaths:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = +[NSMutableDictionary dictionaryWithDictionary:v10];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = sub_10002E694;
  long long v30 = sub_10002E6A4;
  id v31 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10003009C;
  v20[3] = &unk_1000C5B20;
  id v14 = v10;
  id v21 = v14;
  id v15 = v13;
  id v22 = v15;
  id v16 = v12;
  long long v24 = self;
  long long v25 = &v26;
  id v23 = v16;
  [v11 enumerateKeysAndObjectsUsingBlock:v20];
  id v17 = (void *)v27[5];
  if (v17)
  {
    id v18 = 0;
    if (a6) {
      *a6 = v17;
    }
  }
  else
  {
    id v18 = v15;
  }

  _Block_object_dispose(&v26, 8);

  return v18;
}

- (void)_mergeOldArrayValue:(id)a3 oldValueMetadata:(id)a4 newValue:(id)a5 completionHandler:(id)a6
{
  id v29 = a3;
  id v27 = a4;
  id v30 = a5;
  uint64_t v28 = (void (**)(id, id, id, void))a6;
  id v31 = +[RMDateFormat stringUTCFractionalSecondsWithDate:0];
  uint64_t v26 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v30 count]);
  id v10 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v30 count]);
  if (v29)
  {
    id v11 = -[RMExternalStatusPublisher _buildDictionaryFromArrayValue:](self, "_buildDictionaryFromArrayValue:");
    id v12 = [(RMExternalStatusPublisher *)self _buildDictionaryFromArrayValue:v30];
    id v13 = [v27 mutableCopy];
    if ([v11 isEqualToDictionary:v12])
    {
      v28[2](v28, v29, v27, 0);
    }
    else
    {
      uint64_t v44 = 0;
      id v45 = &v44;
      uint64_t v46 = 0x2020000000;
      char v47 = 0;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100030A68;
      v36[3] = &unk_1000C5B48;
      id v37 = v11;
      id v21 = v10;
      id v38 = v21;
      id v22 = v31;
      id v39 = v22;
      long long v43 = &v44;
      id v40 = v27;
      id v23 = v26;
      id v41 = v23;
      id v24 = v13;
      id v42 = v24;
      [v12 enumerateKeysAndObjectsUsingBlock:v36];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100030BB0;
      v32[3] = &unk_1000C5B70;
      id v25 = v21;
      id v33 = v25;
      id v34 = v22;
      id v35 = &v44;
      [v24 enumerateKeysAndObjectsUsingBlock:v32];
      v28[2](v28, v23, v25, *((unsigned __int8 *)v45 + 24));

      _Block_object_dispose(&v44, 8);
    }
  }
  else
  {
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v14 = v30;
    id v15 = [v14 countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v49;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v49 != v16) {
            objc_enumerationMutation(v14);
          }
          id v18 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          CFStringRef v52 = @"last-received";
          v53 = v31;
          uint64_t v19 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
          id v20 = [v18 objectForKeyedSubscript:@"identifier"];
          [v10 setObject:v19 forKeyedSubscript:v20];
        }
        id v15 = [v14 countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v15);
    }

    v28[2](v28, v14, v10, 1);
  }
}

- (id)_filteredArray:(id)a3 metadata:(id)a4 lastAcknowledgedDate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v26 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v7 count]);
  id v25 = +[RMDateFormat stringUTCFractionalSecondsWithDate:v9];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v7;
  id v10 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v32;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v32 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        id v15 = [v14 objectForKeyedSubscript:@"identifier"];
        uint64_t v16 = [v8 objectForKeyedSubscript:v15];
        id v17 = [v16 objectForKeyedSubscript:@"last-received"];

        if (!v9 || [v17 compare:v25] == (id)1) {
          [v26 addObject:v14];
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v11);
  }

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100030F3C;
  v27[3] = &unk_1000C5B98;
  id v28 = v9;
  id v29 = v25;
  id v18 = v26;
  id v30 = v18;
  id v19 = v25;
  id v20 = v9;
  [v8 enumerateKeysAndObjectsUsingBlock:v27];
  id v21 = v30;
  id v22 = v18;

  return v22;
}

- (id)_buildDictionaryFromArrayValue:(id)a3
{
  id v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v3 count]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "objectForKeyedSubscript:", @"identifier", (void)v13);
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSSet)allEvents
{
  return self->_allEvents;
}

- (void)setAllEvents:(id)a3
{
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (RMSharedLock)persistLock
{
  return self->_persistLock;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_xpc_event_publisher)XPCEventPublisher
{
  return self->_XPCEventPublisher;
}

- (void)setXPCEventPublisher:(id)a3
{
}

- (NSArray)plugins
{
  return self->_plugins;
}

- (void)setPlugins:(id)a3
{
}

- (NSDictionary)publisherByEventKey
{
  return self->_publisherByEventKey;
}

- (void)setPublisherByEventKey:(id)a3
{
}

- (NSDictionary)eventsByStatusKey
{
  return self->_eventsByStatusKey;
}

- (void)setEventsByStatusKey:(id)a3
{
}

- (NSSet)statusKeys
{
  return self->_statusKeys;
}

- (void)setStatusKeys:(id)a3
{
}

- (NSDictionary)predicateStatusKeysByStoreIdentifier
{
  return self->_predicateStatusKeysByStoreIdentifier;
}

- (void)setPredicateStatusKeysByStoreIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicateStatusKeysByStoreIdentifier, 0);
  objc_storeStrong((id *)&self->_statusKeys, 0);
  objc_storeStrong((id *)&self->_eventsByStatusKey, 0);
  objc_storeStrong((id *)&self->_publisherByEventKey, 0);
  objc_storeStrong((id *)&self->_plugins, 0);
  objc_storeStrong((id *)&self->_XPCEventPublisher, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_persistLock, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_allEvents, 0);
}

@end