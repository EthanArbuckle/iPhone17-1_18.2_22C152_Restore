@interface RMStatusEngine
- (NSManagedObjectContext)context;
- (NSManagedObjectID)managementSourceObjectID;
- (RMDebounceTimer)debouncer;
- (RMStatusEngine)initWithManagementSourceObjectID:(id)a3 statusQuerier:(id)a4 inContext:(id)a5;
- (RMStatusEngineDelegate)delegate;
- (RMStatusQuerier)statusQuerier;
- (id)_queryForStatusSubscriptionsReturningOnlyUnacknowledgedOnes:(BOOL)a3;
- (id)_queryForStatusWithLastReceivedDateByKeyPath:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4;
- (id)queryForStatusSubscriptions;
- (id)queryForStatusSubscriptionsWithIdentifiers:(id)a3;
- (id)queryForStatusSubscriptionsWithKeyPaths:(id)a3;
- (id)queryForStatusWithKeyPaths:(id)a3;
- (id)queryForUnacknowledgedStatusSubscriptions;
- (void)_notifyDelegateOfUnacknowledgedStatusSubscriptionsIfNeeded;
- (void)_statusDidChange:(id)a3;
- (void)_subscribeToStatusKeyPaths:(id)a3 sourceType:(signed __int16)a4;
- (void)acknowledgeStatusSubscriptions:(id)a3;
- (void)clearAllLastAcknowledgedDate;
- (void)implicitlySubscribeToStatusKeyPaths:(id)a3;
- (void)setContext:(id)a3;
- (void)setDebouncer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setManagementSourceObjectID:(id)a3;
- (void)setStatusQuerier:(id)a3;
- (void)start;
- (void)subscribeToStatusKeyPathsThenStopAfterAcknowledged:(id)a3;
@end

@implementation RMStatusEngine

- (RMStatusEngine)initWithManagementSourceObjectID:(id)a3 statusQuerier:(id)a4 inContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)RMStatusEngine;
  v12 = [(RMStatusEngine *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a5);
    objc_storeStrong((id *)&v13->_managementSourceObjectID, a3);
    objc_storeStrong((id *)&v13->_statusQuerier, a4);
    uint64_t v14 = +[RMDebounceTimer debounceTimerWithMinimumInterval:v13 maximumInterval:@"RMStatusEngine" delegate:5.0 identifier:60.0];
    debouncer = v13->_debouncer;
    v13->_debouncer = (RMDebounceTimer *)v14;
  }
  return v13;
}

- (void)start
{
  v3 = +[RMLog statusEngine];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100064790(v3);
  }

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_statusDidChange:" name:@"RMSubscribedStatusKeyPathDidChangeNotification" object:0];

  [(RMStatusEngine *)self _notifyDelegateOfUnacknowledgedStatusSubscriptionsIfNeeded];
  v5 = +[RMLog statusEngine];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Started status engine...", v6, 2u);
  }
}

- (void)_statusDidChange:(id)a3
{
  id v8 = [a3 userInfo];
  v4 = [v8 objectForKeyedSubscript:@"RMUserInfoKeyUpdatedManagementSourceObjectIDs"];
  if (!v4
    || ([(RMStatusEngine *)self managementSourceObjectID],
        v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v4 containsObject:v5],
        v5,
        v6))
  {
    v7 = [(RMStatusEngine *)self debouncer];
    [v7 trigger];
  }
}

- (void)_notifyDelegateOfUnacknowledgedStatusSubscriptionsIfNeeded
{
  v3 = [(RMStatusEngine *)self context];
  v4 = [(RMStatusEngine *)self managementSourceObjectID];
  id v5 = v3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  uint64_t v14 = sub_100064664;
  v15 = &unk_1000C6310;
  id v6 = v4;
  id v16 = v6;
  objc_super v17 = &v18;
  [v5 performBlockAndWait:&v12];
  int v7 = *((unsigned __int8 *)v19 + 24);

  _Block_object_dispose(&v18, 8);
  if (v7)
  {
    id v8 = +[RMLog statusEngine];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_1000647D4(v8);
    }

    id v9 = [(RMStatusEngine *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      id v10 = +[RMLog statusEngine];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notifying delegate of unacknowledged status subscriptions...", (uint8_t *)&v12, 2u);
      }

      [v9 statusEngineHasUnacknowledgedSubscription:self];
      id v11 = +[RMLog statusEngine];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Notified delegate of unacknowledged status subscriptions.", (uint8_t *)&v12, 2u);
      }
    }
  }
}

- (id)queryForUnacknowledgedStatusSubscriptions
{
  return [(RMStatusEngine *)self _queryForStatusSubscriptionsReturningOnlyUnacknowledgedOnes:1];
}

- (id)queryForStatusSubscriptions
{
  return [(RMStatusEngine *)self _queryForStatusSubscriptionsReturningOnlyUnacknowledgedOnes:0];
}

- (id)queryForStatusSubscriptionsWithIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = sub_100061C1C;
  char v21 = sub_100061C2C;
  id v22 = 0;
  [(RMStatusEngine *)self context];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_100061C34;
  v12 = &unk_1000C5D88;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v5;
  uint64_t v14 = self;
  id v6 = v4;
  id v15 = v6;
  id v16 = &v17;
  [v5 performBlockAndWait:&v9];
  int v7 = -[RMStatusEngine _queryForStatusWithLastReceivedDateByKeyPath:lastAcknowledgedDateByKeyPath:](self, "_queryForStatusWithLastReceivedDateByKeyPath:lastAcknowledgedDateByKeyPath:", v18[5], 0, v9, v10, v11, v12);

  _Block_object_dispose(&v17, 8);

  return v7;
}

- (id)queryForStatusWithKeyPaths:(id)a3
{
  id v4 = a3;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100061C1C;
  v30 = sub_100061C2C;
  id v31 = 0;
  [(RMStatusEngine *)self context];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000621A8;
  v21[3] = &unk_1000C5D88;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v22 = v5;
  v23 = self;
  id v6 = v4;
  id v24 = v6;
  v25 = &v26;
  [v5 performBlockAndWait:v21];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v17 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v12 = objc_msgSend((id)v27[5], "objectForKeyedSubscript:", v11, (void)v17);
        BOOL v13 = v12 == 0;

        if (v13)
        {
          uint64_t v14 = +[NSDate distantPast];
          [(id)v27[5] setObject:v14 forKeyedSubscript:v11];
        }
      }
      id v8 = [v7 countByEnumeratingWithState:&v17 objects:v32 count:16];
    }
    while (v8);
  }

  id v15 = [(RMStatusEngine *)self _queryForStatusWithLastReceivedDateByKeyPath:v27[5] lastAcknowledgedDateByKeyPath:0];

  _Block_object_dispose(&v26, 8);

  return v15;
}

- (id)queryForStatusSubscriptionsWithKeyPaths:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = sub_100061C1C;
  char v21 = sub_100061C2C;
  id v22 = 0;
  [(RMStatusEngine *)self context];
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  uint64_t v11 = sub_1000625FC;
  v12 = &unk_1000C5D88;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v5;
  uint64_t v14 = self;
  id v6 = v4;
  id v15 = v6;
  id v16 = &v17;
  [v5 performBlockAndWait:&v9];
  id v7 = -[RMStatusEngine _queryForStatusWithLastReceivedDateByKeyPath:lastAcknowledgedDateByKeyPath:](self, "_queryForStatusWithLastReceivedDateByKeyPath:lastAcknowledgedDateByKeyPath:", v18[5], 0, v9, v10, v11, v12);

  _Block_object_dispose(&v17, 8);

  return v7;
}

- (void)clearAllLastAcknowledgedDate
{
  [(RMStatusEngine *)self context];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006297C;
  v4[3] = &unk_1000C5100;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = self;
  id v3 = v5;
  [v3 performBlockAndWait:v4];
}

- (id)_queryForStatusSubscriptionsReturningOnlyUnacknowledgedOnes:(BOOL)a3
{
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = sub_100061C1C;
  id v24 = sub_100061C2C;
  id v25 = 0;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_100061C1C;
  long long v18 = sub_100061C2C;
  id v19 = 0;
  [(RMStatusEngine *)self context];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100062E04;
  v8[3] = &unk_1000C5D60;
  BOOL v13 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  uint64_t v10 = self;
  uint64_t v11 = &v14;
  v12 = &v20;
  [v5 performBlockAndWait:v8];
  id v6 = [(RMStatusEngine *)self _queryForStatusWithLastReceivedDateByKeyPath:v21[5] lastAcknowledgedDateByKeyPath:v15[5]];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v6;
}

- (id)_queryForStatusWithLastReceivedDateByKeyPath:(id)a3 lastAcknowledgedDateByKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    uint64_t v16 = 0;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x3032000000;
    id v19 = sub_100061C1C;
    uint64_t v20 = sub_100061C2C;
    id v21 = 0;
    context = self->_context;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000635F0;
    v15[3] = &unk_1000C6310;
    v15[4] = self;
    v15[5] = &v16;
    [(NSManagedObjectContext *)context performBlockAndWait:v15];
    id v9 = [v6 allKeys];
    uint64_t v10 = +[NSSet setWithArray:v9];

    uint64_t v11 = [(RMStatusEngine *)self statusQuerier];
    if (v7) {
      [v11 queryForUnacknowledgedStatusWithKeyPaths:v10 lastAcknowledgedDateByKeyPath:v7 onBehalfOfManagementChannel:v17[5]];
    }
    else {
    BOOL v13 = [v11 queryForStatusWithKeyPaths:v10 onBehalfOfManagementChannel:v17[5]];
    }

    v12 = [[RMStatusSubscriptionQueryResult alloc] initWithQueryResult:v13 lastReceivedDateByKeyPath:v6];
    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v12 = (RMStatusSubscriptionQueryResult *)objc_opt_new();
  }

  return v12;
}

- (void)acknowledgeStatusSubscriptions:(id)a3
{
  id v4 = a3;
  id v5 = [v4 statusKeyPaths];
  id v6 = [v5 allObjects];
  id v7 = [v6 sortedArrayUsingSelector:"localizedCompare:"];

  id v8 = +[RMLog statusEngine];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100064970(v7);
  }

  [(RMStatusEngine *)self context];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000637E4;
  v12[3] = &unk_1000C68A0;
  id v13 = v4;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v15 = self;
  id v16 = v7;
  id v9 = v7;
  id v10 = v14;
  id v11 = v4;
  [v10 performBlockAndWait:v12];
}

- (RMStatusEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RMStatusEngineDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (NSManagedObjectID)managementSourceObjectID
{
  return self->_managementSourceObjectID;
}

- (void)setManagementSourceObjectID:(id)a3
{
}

- (RMStatusQuerier)statusQuerier
{
  return self->_statusQuerier;
}

- (void)setStatusQuerier:(id)a3
{
}

- (RMDebounceTimer)debouncer
{
  return self->_debouncer;
}

- (void)setDebouncer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_statusQuerier, 0);
  objc_storeStrong((id *)&self->_managementSourceObjectID, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)implicitlySubscribeToStatusKeyPaths:(id)a3
{
}

- (void)subscribeToStatusKeyPathsThenStopAfterAcknowledged:(id)a3
{
}

- (void)_subscribeToStatusKeyPaths:(id)a3 sourceType:(signed __int16)a4
{
  id v6 = a3;
  if ([v6 count])
  {
    id v7 = +[RMLog statusEngine];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_100064AF4(v6);
    }

    [(RMStatusEngine *)self context];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100063EB8;
    v9[3] = &unk_1000C68C8;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = self;
    signed __int16 v13 = a4;
    id v12 = v6;
    id v8 = v10;
    [v8 performBlockAndWait:v9];
  }
}

@end