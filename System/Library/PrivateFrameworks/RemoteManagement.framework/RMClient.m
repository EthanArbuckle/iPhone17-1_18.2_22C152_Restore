@interface RMClient
+ (id)_makeConduitWithManagementSourceObjectID:(id)a3 inContext:(id)a4;
- (BOOL)_haltSyncing;
- (NSOperationQueue)operationQueue;
- (NSString)managementSourceIdentifier;
- (RMActivationEngine)activationEngine;
- (RMClient)initWithConduit:(id)a3 activationEngine:(id)a4 statusEngine:(id)a5 managementSourceIdentifier:(id)a6;
- (RMClient)initWithManagementSourceObjectID:(id)a3 managementSourceIdentifier:(id)a4 statusQuerier:(id)a5 persistentContainer:(id)a6;
- (RMClientDelegate)delegate;
- (RMConduit)conduit;
- (RMStatusEngine)statusEngine;
- (id)queryForStatusSubscriptionsWithIdentifiers:(id)a3;
- (void)_handleConduitError;
- (void)_processConduitErrorState:(signed __int16)a3;
- (void)_sendStatusQueryResultIfNeeded:(id)a3 fullReport:(BOOL)a4 completionHandler:(id)a5;
- (void)_setNeedsSyncing:(BOOL)a3;
- (void)_syncConduitOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)_syncIfNeeded;
- (void)_syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)applyNowWithCompletionHandler:(id)a3;
- (void)conduitNeedsToSendStatusForKeyPaths:(id)a3;
- (void)conduitNeedsToSync:(id)a3;
- (void)enrollWithCompletionHandler:(id)a3;
- (void)reenrollWithCompletionHandler:(id)a3;
- (void)sendStatusData:(id)a3 completionHandler:(id)a4;
- (void)sendStatusForSubscriptionsWithIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)setActivationEngine:(id)a3;
- (void)setConduit:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setStatusEngine:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)statusEngineHasUnacknowledgedSubscription:(id)a3;
- (void)syncIfNeededWithCompletionHandler:(id)a3;
- (void)syncWithCompletionHandler:(id)a3;
- (void)unenrollWithCompletionHandler:(id)a3;
- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4;
- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4;
@end

@implementation RMClient

- (RMClient)initWithManagementSourceObjectID:(id)a3 managementSourceIdentifier:(id)a4 statusQuerier:(id)a5 persistentContainer:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v11 newBackgroundContext];
  [v14 setAutomaticallyMergesChangesFromParent:1];
  v15 = +[NSString stringWithFormat:@"%@/%@", @"conduit", v10];
  [v14 setTransactionAuthor:v15];

  id v16 = v10;
  id v17 = [v11 newBackgroundContext];
  [v17 setAutomaticallyMergesChangesFromParent:1];
  v18 = +[NSString stringWithFormat:@"%@/%@", @"engine", v16];

  [v17 setTransactionAuthor:v18];
  v19 = [(id)objc_opt_class() _makeConduitWithManagementSourceObjectID:v13 inContext:v14];
  v20 = [[RMActivationEngine alloc] initWithManagementSourceObjectID:v13 context:v17];
  v21 = [[RMStatusEngine alloc] initWithManagementSourceObjectID:v13 statusQuerier:v12 inContext:v14];

  v22 = [(RMClient *)self initWithConduit:v19 activationEngine:v20 statusEngine:v21 managementSourceIdentifier:v16];
  return v22;
}

- (RMClient)initWithConduit:(id)a3 activationEngine:(id)a4 statusEngine:(id)a5 managementSourceIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)RMClient;
  v15 = [(RMClient *)&v25 init];
  id v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_conduit, a3);
    [v11 setDelegate:v16];
    objc_storeStrong((id *)&v16->_activationEngine, a4);
    objc_storeStrong((id *)&v16->_statusEngine, a5);
    objc_storeStrong((id *)&v16->_managementSourceIdentifier, a6);
    uint64_t v17 = objc_opt_new();
    needsSyncingLock = v16->_needsSyncingLock;
    v16->_needsSyncingLock = v17;

    v16->_needsSyncing = 1;
    v19 = +[NSString stringWithFormat:@"RMClient-%@", v14];
    v20 = (RMSharedLock *)+[RMSharedLock newSharedLockWithDescription:v19];
    syncLock = v16->_syncLock;
    v16->_syncLock = v20;

    v16->_firstSync = 1;
    uint64_t v22 = objc_opt_new();
    operationQueue = v16->_operationQueue;
    v16->_operationQueue = (NSOperationQueue *)v22;

    [(NSOperationQueue *)v16->_operationQueue setName:@"com.apple.remotemanagementd.client"];
    [(NSOperationQueue *)v16->_operationQueue setMaxConcurrentOperationCount:1];
    [(NSOperationQueue *)v16->_operationQueue setQualityOfService:17];
  }

  return v16;
}

+ (id)_makeConduitWithManagementSourceObjectID:(id)a3 inContext:(id)a4
{
  id v5 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_10000FFF0;
  v18 = sub_100010000;
  id v19 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100010008;
  v10[3] = &unk_1000C4E08;
  id v6 = a4;
  id v11 = v6;
  id v7 = v5;
  id v12 = v7;
  id v13 = &v14;
  [v6 performBlockAndWait:v10];
  id v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);

  return v8;
}

- (void)startWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create((void *)&_mh_execute_header, "Client: Starting", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = +[RMLog client];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Starting client...", buf, 2u);
  }

  id v7 = [(RMClient *)self statusEngine];
  [v7 setDelegate:self];
  [v7 start];
  id v8 = [(RMClient *)self conduit];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100010280;
  v10[3] = &unk_1000C4F68;
  void v10[4] = self;
  id v9 = v4;
  id v11 = v9;
  [v8 startWithCompletionHandler:v10];

  os_activity_scope_leave(&state);
}

- (void)enrollWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create((void *)&_mh_execute_header, "Client: Enrolling", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = +[RMLog client];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Enrolling...", buf, 2u);
  }

  id v7 = [(RMClient *)self statusEngine];
  id v8 = [(RMClient *)self conduit];
  id v9 = [v8 statusItemsToImplicitlySubscribeTo];
  [v7 implicitlySubscribeToStatusKeyPaths:v9];

  id v10 = [(RMClient *)self conduit];
  id v11 = [v10 statusItemsToSendDuringEnrollment];

  id v12 = [v7 queryForStatusWithKeyPaths:v11];
  id v13 = [(RMClient *)self conduit];
  uint64_t v14 = [v12 statusByKeyPath];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100010638;
  v18[3] = &unk_1000C4F90;
  id v15 = v7;
  id v19 = v15;
  id v16 = v12;
  id v20 = v16;
  id v17 = v4;
  id v21 = v17;
  [v13 enrollWithStatusItems:v14 completionHandler:v18];

  os_activity_scope_leave(&state);
}

- (void)reenrollWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create((void *)&_mh_execute_header, "Client: Re-enrolling", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = +[RMLog client];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "re-enrolling...", buf, 2u);
  }

  id v7 = [(RMClient *)self statusEngine];
  [v7 clearAllLastAcknowledgedDate];
  v24[0] = RMModelStatusItemManagementClientCapabilities;
  v24[1] = RMModelStatusItemManagementDeclarations;
  v24[2] = RMModelStatusItemManagementPushToken;
  id v8 = +[NSArray arrayWithObjects:v24 count:3];
  id v9 = +[NSSet setWithArray:v8];
  [v7 implicitlySubscribeToStatusKeyPaths:v9];

  id v10 = [(RMClient *)self conduit];
  id v11 = [v10 statusItemsToSendDuringEnrollment];

  id v12 = [v7 queryForStatusWithKeyPaths:v11];
  id v13 = [(RMClient *)self conduit];
  uint64_t v14 = [v12 statusByKeyPath];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100010990;
  v18[3] = &unk_1000C4F90;
  id v15 = v7;
  id v19 = v15;
  id v16 = v12;
  id v20 = v16;
  id v17 = v4;
  id v21 = v17;
  [v13 enrollWithStatusItems:v14 completionHandler:v18];

  os_activity_scope_leave(&state);
}

- (void)unenrollWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create((void *)&_mh_execute_header, "Client: Unenrolling", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  id v6 = +[RMLog client];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Unenrolling...", buf, 2u);
  }

  id v7 = [(RMClient *)self conduit];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100010B58;
  v9[3] = &unk_1000C4FB8;
  v9[4] = self;
  id v8 = v4;
  id v10 = v8;
  [v7 unenrollWithCompletionHandler:v9];

  os_activity_scope_leave(&state);
}

- (void)syncWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create((void *)&_mh_execute_header, "Client: Syncing", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v5, &v6);
  [(RMClient *)self _syncOnlyIfNeeded:0 completionHandler:v4];
  os_activity_scope_leave(&v6);
}

- (void)syncIfNeededWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create((void *)&_mh_execute_header, "Client: Syncing if needed", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v5, &v6);
  [(RMClient *)self _syncOnlyIfNeeded:1 completionHandler:v4];
  os_activity_scope_leave(&v6);
}

- (void)_syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = self->_needsSyncingLock;
  objc_sync_enter(v7);
  self->_needsSyncing = 0;
  objc_sync_exit(v7);

  [(RMSharedLock *)self->_syncLock lock];
  id v8 = +[RMLog client];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    CFStringRef v9 = &stru_1000C74D0;
    if (v4) {
      CFStringRef v9 = @" only if needed";
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v24 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Syncing%{public}@...", buf, 0xCu);
  }

  id v10 = objc_opt_new();
  id v11 = [(RMClient *)self statusEngine];
  id v12 = v11;
  if (v4) {
    [v11 queryForUnacknowledgedStatusSubscriptions];
  }
  else {
    [v11 queryForStatusSubscriptions];
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100010F3C;
  v17[3] = &unk_1000C5030;
  BOOL v13 = !v4;
  id v18 = v10;
  id v19 = self;
  BOOL v22 = v4;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v6;
  id v14 = v20;
  id v15 = v6;
  id v16 = v10;
  [(RMClient *)self _sendStatusQueryResultIfNeeded:v14 fullReport:v13 completionHandler:v17];
}

- (void)_syncConduitOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(RMClient *)self conduit];
  unsigned __int8 v8 = [v7 isSyncAllowed];

  if (v8)
  {
    if (![(RMClient *)self _haltSyncing])
    {
      id v11 = [(RMClient *)self conduit];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100011790;
      v12[3] = &unk_1000C4FB8;
      v12[4] = self;
      id v13 = v6;
      [v11 syncOnlyIfNeeded:v4 completionHandler:v12];

      goto LABEL_9;
    }
    CFStringRef v9 = +[RMLog client];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000130CC();
    }
  }
  else
  {
    CFStringRef v9 = +[RMLog client];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100013100();
    }
  }

  id v10 = +[RMErrorUtilities createStatePreventsSyncingError];
  (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v10);

LABEL_9:
}

- (void)applyNowWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(RMClient *)self activationEngine];
  [v5 syncWithCompletionHandler:v4];
}

- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = _os_activity_create((void *)&_mh_execute_header, "Client: Updating via push message", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  [(RMSharedLock *)self->_syncLock lock];
  CFStringRef v9 = +[RMLog client];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Updating via push message...", buf, 2u);
  }

  id v10 = [(RMClient *)self conduit];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100011A30;
  v12[3] = &unk_1000C4F40;
  v12[4] = self;
  id v11 = v7;
  id v13 = v11;
  [v10 updateWithPushMessage:v6 completionHandler:v12];

  os_activity_scope_leave(&state);
}

- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = _os_activity_create((void *)&_mh_execute_header, "Client: Updating via sync tokens", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  [(RMSharedLock *)self->_syncLock lock];
  CFStringRef v9 = +[RMLog client];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Updating via sync tokens...", buf, 2u);
  }

  id v10 = [(RMClient *)self conduit];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100011C64;
  v12[3] = &unk_1000C4F40;
  v12[4] = self;
  id v11 = v7;
  id v13 = v11;
  [v10 updateWithTokensResponse:v6 completionHandler:v12];

  os_activity_scope_leave(&state);
}

- (void)sendStatusData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  unsigned __int8 v8 = _os_activity_create((void *)&_mh_execute_header, "Client: Sending arbitrary status", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  CFStringRef v9 = [(RMClient *)self conduit];
  unsigned __int8 v10 = [v9 isSyncAllowed];

  if ((v10 & 1) == 0)
  {
    id v11 = +[RMLog client];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_100013204();
    }
    goto LABEL_8;
  }
  if ([(RMClient *)self _haltSyncing])
  {
    id v11 = +[RMLog client];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000131D0();
    }
LABEL_8:

    id v12 = +[RMErrorUtilities createStatePreventsSyncingError];
    v7[2](v7, v12);

    goto LABEL_12;
  }
  id v13 = +[RMLog client];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Sending arbitrary status...", buf, 2u);
  }

  id v14 = [(RMClient *)self conduit];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100011F78;
  v15[3] = &unk_1000C4F40;
  v15[4] = self;
  id v16 = v7;
  [v14 sendStatusData:v6 completionHandler:v15];

LABEL_12:
  os_activity_scope_leave(&state);
}

- (id)queryForStatusSubscriptionsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create((void *)&_mh_execute_header, "Client: querying for status subscriptions", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter(v5, &v23);
  id v6 = +[RMLog client];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [v4 allObjects];
    unsigned __int8 v8 = [v7 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
    CFStringRef v9 = [v8 componentsJoinedByString:@", "];

    *(_DWORD *)buf = 138543362;
    objc_super v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Querying for status subscriptions with identifiers %{public}@...", buf, 0xCu);
  }
  unsigned __int8 v10 = [(RMClient *)self statusEngine];
  id v11 = [v10 queryForStatusSubscriptionsWithIdentifiers:v4];

  id v12 = +[RMLog client];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    id v20 = [v4 allObjects];
    id v21 = [v20 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
    BOOL v22 = [v21 componentsJoinedByString:@", "];

    *(_DWORD *)buf = 138543362;
    objc_super v25 = v22;
    _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Found status from status subscriptions with identifiers %{public}@", buf, 0xCu);
  }
  id v13 = v11;
  id v14 = [v13 statusByKeyPath];
  if ([v14 count])
  {

LABEL_8:
    id v17 = [v13 protocolStatusReportWithFullReport:0];
    id v18 = [v17 serializeWithType:1];

    goto LABEL_9;
  }
  id v15 = [v13 errorByKeyPath];
  BOOL v16 = [v15 count] == 0;

  if (!v16) {
    goto LABEL_8;
  }
  id v18 = &__NSDictionary0__struct;
LABEL_9:

  os_activity_scope_leave(&v23);

  return v18;
}

- (void)sendStatusForSubscriptionsWithIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned __int8 v8 = _os_activity_create((void *)&_mh_execute_header, "Client: sending status for subscriptions", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v19.opaque[0] = 0;
  v19.opaque[1] = 0;
  os_activity_scope_enter(v8, &v19);
  CFStringRef v9 = +[RMLog client];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [v6 allObjects];
    id v11 = [v10 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
    id v12 = [v11 componentsJoinedByString:@", "];

    *(_DWORD *)buf = 138543362;
    id v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Querying for status subscriptions with identifiers %{public}@ then sending status...", buf, 0xCu);
  }
  id v13 = [(RMClient *)self statusEngine];
  id v14 = [v13 queryForStatusSubscriptionsWithIdentifiers:v6];

  id v15 = +[RMLog client];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    id v16 = [v6 allObjects];
    id v17 = [v16 sortedArrayUsingSelector:"caseInsensitiveCompare:"];
    id v18 = [v17 componentsJoinedByString:@", "];

    *(_DWORD *)buf = 138543362;
    id v21 = v18;
    _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "Found status from status subscriptions with identifiers %{public}@", buf, 0xCu);
  }
  [(RMClient *)self _sendStatusQueryResultIfNeeded:v14 fullReport:0 completionHandler:v7];

  os_activity_scope_leave(&v19);
}

- (void)_sendStatusQueryResultIfNeeded:(id)a3 fullReport:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  CFStringRef v9 = (void (**)(id, id))a5;
  id v10 = [v8 statusByKeyPath];
  if ([v10 count])
  {

LABEL_4:
    id v13 = [v8 protocolStatusReportWithFullReport:v6];
    id v19 = 0;
    id v14 = [v13 serializeAsDataWithType:1 error:&v19];
    id v15 = v19;
    id v16 = +[RMLog client];
    id v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        sub_10001333C();
      }

      [(RMClient *)self sendStatusData:v14 completionHandler:v9];
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1000132D4();
      }

      v9[2](v9, v15);
    }

    goto LABEL_12;
  }
  id v11 = [v8 errorByKeyPath];
  id v12 = [v11 count];

  if (v12) {
    goto LABEL_4;
  }
  id v18 = +[RMLog client];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "There was no status report to send.", buf, 2u);
  }

  v9[2](v9, 0);
LABEL_12:
}

- (BOOL)_haltSyncing
{
  v2 = [(RMClient *)self conduit];
  unsigned int v3 = [v2 errorState];

  return (v3 & 0xFFFFFFFE) == 4;
}

- (void)_handleConduitError
{
  unsigned int v3 = [(RMClient *)self conduit];
  id v4 = [v3 errorState];

  id v5 = +[RMLog client];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100013370((__int16)v4, v5);
  }

  [(RMClient *)self _processConduitErrorState:v4];
}

- (void)_processConduitErrorState:(signed __int16)a3
{
  int v3 = (unsigned __int16)a3;
  if ((a3 & 0xFFFE) == 0) {
    int v3 = 1;
  }
  if (a3 >= 2 && (v3 & 0xFFFE) != 2)
  {
    if (v3 == 5)
    {
      id v6 = [(RMClient *)self delegate];
      id v5 = [(RMClient *)self managementSourceIdentifier];
      [v6 clientNeedsToReenrollWithManagementSourceIdentifier:v5];
    }
    else
    {
      if (v3 != 4) {
        return;
      }
      id v6 = [(RMClient *)self delegate];
      id v5 = [(RMClient *)self managementSourceIdentifier];
      [v6 clientNeedsToUnenrollWithManagementSourceIdentifier:v5];
    }
  }
}

- (void)conduitNeedsToSync:(id)a3
{
  id v4 = +[RMLog client];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000133EC();
  }

  [(RMClient *)self _setNeedsSyncing:1];
}

- (void)conduitNeedsToSendStatusForKeyPaths:(id)a3
{
  id v4 = a3;
  id v5 = +[RMLog client];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100013420(v4, v5);
  }

  id v6 = [(RMClient *)self statusEngine];
  [v6 subscribeToStatusKeyPathsThenStopAfterAcknowledged:v4];

  [(RMClient *)self _setNeedsSyncing:1];
}

- (void)statusEngineHasUnacknowledgedSubscription:(id)a3
{
  id v4 = +[RMLog client];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_1000134F0();
  }

  [(RMClient *)self _setNeedsSyncing:1];
}

- (void)_setNeedsSyncing:(BOOL)a3
{
  if (a3)
  {
    id v4 = self->_needsSyncingLock;
    objc_sync_enter(v4);
    if (self->_needsSyncing)
    {
      id v5 = +[RMLog client];
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_100013558();
      }
    }
    else
    {
      self->_needsSyncing = 1;
      id v6 = +[RMLog client];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_100013524();
      }

      id v7 = (void *)os_transaction_create();
      objc_initWeak(&location, self);
      id v8 = [(RMClient *)self operationQueue];
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100012C24;
      v9[3] = &unk_1000C5058;
      objc_copyWeak(&v11, &location);
      id v5 = v7;
      id v10 = v5;
      [v8 addOperationWithBlock:v9];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }

    objc_sync_exit(v4);
  }
  else
  {
    id v4 = +[RMLog client];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10001358C();
    }
  }
}

- (void)_syncIfNeeded
{
  int v3 = +[RMLog client];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000135C0();
  }

  [(RMClient *)self _syncOnlyIfNeeded:1 completionHandler:&stru_1000C5078];
}

- (RMClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RMClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)managementSourceIdentifier
{
  return self->_managementSourceIdentifier;
}

- (RMConduit)conduit
{
  return self->_conduit;
}

- (void)setConduit:(id)a3
{
}

- (RMActivationEngine)activationEngine
{
  return self->_activationEngine;
}

- (void)setActivationEngine:(id)a3
{
}

- (RMStatusEngine)statusEngine
{
  return self->_statusEngine;
}

- (void)setStatusEngine:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_statusEngine, 0);
  objc_storeStrong((id *)&self->_activationEngine, 0);
  objc_storeStrong((id *)&self->_conduit, 0);
  objc_storeStrong((id *)&self->_managementSourceIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_syncLock, 0);

  objc_storeStrong((id *)&self->_needsSyncingLock, 0);
}

@end