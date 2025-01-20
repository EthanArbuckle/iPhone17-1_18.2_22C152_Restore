@interface RMMDMConduit
+ (id)_generateEnrollmentToken;
- (BOOL)_incrementConduitStateError:(signed __int16)a3 serverRetryAfter:(id)a4 error:(id *)a5;
- (BOOL)_processErrorResponse:(id)a3 error:(id *)a4;
- (BOOL)isSyncAllowed;
- (BOOL)madeChangesDuringSync;
- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5;
- (NSManagedObjectContext)context;
- (NSManagedObjectID)managementSourceObjectID;
- (RMConduitDelegate)delegate;
- (RMMDMConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4;
- (RMPersistentHistoryNotifier)persistentHistoryNotifier;
- (id)_processResponse:(id)a3 payloadClass:(Class)a4 error:(id *)a5;
- (id)_requestDataForPayload:(id)a3 error:(id *)a4;
- (id)_statusItemsToSendOnceAfterEnrollment;
- (id)statusItemsToImplicitlySubscribeTo;
- (id)statusItemsToSendDuringEnrollment;
- (signed)errorState;
- (void)_didFinishFetchingDeclarationItems:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)_didFinishFetchingObject:(id)a3 objectID:(id)a4 class:(Class)a5 endpoint:(id)a6 response:(id)a7 error:(id)a8 completionHandler:(id)a9;
- (void)_didFinishFetchingServerTokens:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)_didFinishSendingStatusWithError:(id)a3 completionHandler:(id)a4;
- (void)_executeRequestForEndpoint:(id)a3 requestData:(id)a4 expectedResponseClass:(Class)a5 completionHandler:(id)a6;
- (void)_fetchDeclarationItemsOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)_fetchNextObjectOfClass:(Class)a3 endpoint:(id)a4 completionHandler:(id)a5;
- (void)_fetchPartialObjectsWithCompletionHandler:(id)a3;
- (void)_fetchTokensOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)_processDeclarationItemsWithContext:(id)a3 infos:(id)a4 declarationItemClass:(Class)a5 declarationItemKeyPath:(id)a6;
- (void)_startObservers;
- (void)_stopObservers;
- (void)_updateWithSyncTokens:(id)a3 completionHandler:(id)a4;
- (void)_writeQAStatusData:(id)a3 completionHandler:(id)a4;
- (void)enrollWithStatusItems:(id)a3 completionHandler:(id)a4;
- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4;
- (void)sendStatusData:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setMadeChangesDuringSync:(BOOL)a3;
- (void)setPersistentHistoryNotifier:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
- (void)syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4;
- (void)unenrollWithCompletionHandler:(id)a3;
- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4;
- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4;
@end

@implementation RMMDMConduit

- (RMMDMConduit)initWithManagementSourceObjectID:(id)a3 inContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RMMDMConduit;
  v9 = [(RMMDMConduit *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managementSourceObjectID, a3);
    objc_storeStrong((id *)&v10->_context, a4);
  }

  return v10;
}

- (void)startWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "MDMConduit: starting", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v6 = +[RMLog mdmConduit];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    sub_100050208();
  }

  [(RMMDMConduit *)self context];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004A8AC;
  v8[3] = &unk_1000C5100;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v7;
  v10 = self;
  [v7 performBlockAndWait:v8];
  v4[2](v4);

  os_activity_scope_leave(&state);
}

- (void)_startObservers
{
  id v6 = [(RMMDMConduit *)self context];
  v3 = [v6 transactionAuthor];
  v4 = [[RMPersistentHistoryNotifier alloc] initWithContext:v6];
  [(RMPersistentHistoryNotifier *)v4 setDelegate:self];
  v5 = +[NSSet setWithObject:v3];
  [(RMPersistentHistoryNotifier *)v4 setIgnoredTransactionAuthors:v5];

  [(RMMDMConduit *)self setPersistentHistoryNotifier:v4];
  [(RMPersistentHistoryNotifier *)v4 start];
}

- (void)_stopObservers
{
  v3 = [(RMMDMConduit *)self persistentHistoryNotifier];
  [v3 setDelegate:0];

  [(RMMDMConduit *)self setPersistentHistoryNotifier:0];
}

- (signed)errorState
{
  v2 = self;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  __int16 v12 = 0;
  [(RMMDMConduit *)self context];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10004ABA0;
  v5[3] = &unk_1000C4E08;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = v3;
  id v7 = v2;
  id v8 = &v9;
  [v3 performBlockAndWait:v5];
  LOWORD(v2) = *((_WORD *)v10 + 12);

  _Block_object_dispose(&v9, 8);
  return (__int16)v2;
}

- (id)statusItemsToImplicitlySubscribeTo
{
  v5[0] = RMModelStatusItemManagementClientCapabilities;
  v5[1] = RMModelStatusItemManagementDeclarations;
  v2 = +[NSArray arrayWithObjects:v5 count:2];
  id v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (id)statusItemsToSendDuringEnrollment
{
  v2 = objc_opt_new();

  return v2;
}

- (id)_statusItemsToSendOnceAfterEnrollment
{
  id v3 = +[NSMutableArray arrayWithCapacity:6];
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  [(RMMDMConduit *)self context];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004AEEC;
  v7[3] = &unk_1000C4E08;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v4;
  uint64_t v9 = self;
  v10 = &v11;
  [v4 performBlockAndWait:v7];
  if (*((unsigned char *)v12 + 24))
  {
    [v3 addObject:RMModelStatusItemDeviceSerialNumber];
    [v3 addObject:RMModelStatusItemDeviceUDID];
  }
  [v3 addObject:RMModelStatusItemDeviceOperatingSystemFamily];
  [v3 addObject:RMModelStatusItemDeviceOperatingSystemVersion];
  [v3 addObject:RMModelStatusItemDeviceOperatingSystemSupplementalExtraVersion];
  [v3 addObject:RMModelStatusItemDeviceOperatingSystemBuildVersion];
  [v3 addObject:RMModelStatusItemDeviceModelFamily];
  v5 = +[NSSet setWithArray:v3];

  _Block_object_dispose(&v11, 8);

  return v5;
}

- (void)enrollWithStatusItems:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "MDMConduit: enrolling", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = +[RMLog mdmConduit];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10005023C();
  }

  +[RMMDMv1Liaison refreshState];
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = sub_10004B1B0;
  v21 = sub_10004B1C0;
  id v22 = 0;
  [(RMMDMConduit *)self context];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004B1C8;
  v13[3] = &unk_1000C4E08;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v10;
  v15 = self;
  v16 = &v17;
  [v10 performBlockAndWait:v13];
  if (v18[5])
  {
    v7[2](v7);
  }
  else
  {
    uint64_t v11 = [(RMMDMConduit *)self delegate];
    __int16 v12 = [(RMMDMConduit *)self _statusItemsToSendOnceAfterEnrollment];
    [v11 conduitNeedsToSendStatusForKeyPaths:v12];

    ((void (*)(void (**)(void), void))v7[2])(v7, 0);
  }

  _Block_object_dispose(&v17, 8);
  os_activity_scope_leave(&state);
}

+ (id)_generateEnrollmentToken
{
  v2 = objc_opt_new();
  id v3 = [v2 UUIDString];

  return v3;
}

- (void)unenrollWithCompletionHandler:(id)a3
{
  id v4 = (void (**)(id, void, uint64_t))a3;
  v5 = _os_activity_create((void *)&_mh_execute_header, "MDMConduit: unenrolling", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  [(RMMDMConduit *)self _stopObservers];
  uint64_t v11 = 0;
  __int16 v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = sub_10004B1B0;
  v15 = sub_10004B1C0;
  id v16 = 0;
  [(RMMDMConduit *)self context];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10004B610;
  v7[3] = &unk_1000C4E08;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v6;
  uint64_t v9 = self;
  id v10 = &v11;
  [v6 performBlockAndWait:v7];
  +[RMMDMv1Liaison refreshState];
  v4[2](v4, 0, v12[5]);

  _Block_object_dispose(&v11, 8);
  os_activity_scope_leave(&state);
}

- (void)_fetchTokensOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = _os_activity_create((void *)&_mh_execute_header, "MDMConduit: fetching server tokens", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[RMLog mdmConduit];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100050314();
  }

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  [(RMMDMConduit *)self context];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004BA44;
  v15[3] = &unk_1000C5BE0;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v9;
  uint64_t v17 = self;
  BOOL v19 = a3;
  v18 = &v20;
  [v9 performBlockAndWait:v15];
  if (*((unsigned char *)v21 + 24))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = RMProtocolEndpointTokens;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10004BC1C;
    v13[3] = &unk_1000C61C0;
    void v13[4] = self;
    id v14 = v6;
    [(RMMDMConduit *)self _executeRequestForEndpoint:v11 requestData:0 expectedResponseClass:v10 completionHandler:v13];
  }
  else
  {
    __int16 v12 = +[RMLog mdmConduit];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000502E0();
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);
}

- (void)_didFinishFetchingServerTokens:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id))a5;
  if (v9)
  {
    uint64_t v11 = +[RMLog mdmConduit];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003E904();
    }

    v10[2](v10, v9);
  }
  else
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    char v23 = sub_10004B1B0;
    v24 = sub_10004B1C0;
    id v25 = 0;
    [(RMMDMConduit *)self context];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10004BE50;
    v15[3] = &unk_1000C5D88;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = v12;
    uint64_t v17 = self;
    id v18 = v8;
    BOOL v19 = &v20;
    [v12 performBlockAndWait:v15];
    if (v21[5])
    {
      ((void (*)(void (**)(id, id)))v10[2])(v10);
    }
    else
    {
      uint64_t v13 = +[RMLog mdmConduit];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Successfully saved server tokens", (uint8_t *)v14, 2u);
      }

      v10[2](v10, 0);
    }

    _Block_object_dispose(&v20, 8);
  }
}

- (BOOL)isSyncAllowed
{
  return 1;
}

- (void)syncOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = _os_activity_create((void *)&_mh_execute_header, "MDMConduit: syncing only if needed", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[RMLog mdmConduit];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10003E9D4(v4, v8, v9, v10, v11, v12, v13, v14);
  }

  if (+[RMFeatureOverrides qaMode])
  {
    v15 = +[RMLog mdmConduit];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      sub_1000503B0();
    }

    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
  }
  else
  {
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10004C304;
    v31[3] = &unk_1000C5890;
    id v16 = (id)objc_opt_new();
    id v32 = v16;
    uint64_t v17 = objc_retainBlock(v31);
    [(RMMDMConduit *)self setMadeChangesDuringSync:0];
    id v18 = dispatch_group_create();
    dispatch_group_enter(v18);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10004C388;
    v26[3] = &unk_1000C5E00;
    BOOL v19 = v17;
    id v29 = v19;
    uint64_t v20 = v18;
    v27 = v20;
    v28 = self;
    BOOL v30 = v4;
    [(RMMDMConduit *)self _fetchTokensOnlyIfNeeded:v4 completionHandler:v26];
    v21 = dispatch_get_global_queue(21, 0);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10004C570;
    v23[3] = &unk_1000C5E28;
    v23[4] = self;
    id v24 = v16;
    id v25 = v6;
    id v22 = v16;
    dispatch_group_notify(v20, v21, v23);
  }
  os_activity_scope_leave(&state);
}

- (void)updateWithPushMessage:(id)a3 completionHandler:(id)a4
{
  id v11 = 0;
  id v6 = a4;
  id v7 = +[RMProtocolPushMessage loadData:a3 serializationType:1 error:&v11];
  id v8 = v11;
  if (v7)
  {
    uint64_t v9 = [v7 messageSyncTokens];
    [(RMMDMConduit *)self _updateWithSyncTokens:v9 completionHandler:v6];

    id v6 = (id)v9;
  }
  else
  {
    uint64_t v10 = +[RMLog mdmConduit];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10003EA58();
    }

    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }
}

- (void)updateWithTokensResponse:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if (!v6)
  {
    uint64_t v10 = 0;
    goto LABEL_5;
  }
  id v13 = 0;
  uint64_t v8 = +[RMProtocolTokensResponse loadData:v6 serializationType:1 error:&v13];
  id v9 = v13;
  uint64_t v10 = v9;
  if (v8)
  {

    uint64_t v10 = (void *)v8;
LABEL_5:
    id v11 = [v10 responseSyncTokens];
    [(RMMDMConduit *)self _updateWithSyncTokens:v11 completionHandler:v7];

    goto LABEL_9;
  }
  uint64_t v12 = +[RMLog mdmConduit];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_10003EAC0();
  }

  v7[2](v7, v10);
LABEL_9:
}

- (void)_updateWithSyncTokens:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_10004B1B0;
  BOOL v19 = sub_10004B1C0;
  id v20 = 0;
  [(RMMDMConduit *)self context];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10004C9C4;
  v10[3] = &unk_1000C5D88;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = v8;
  uint64_t v12 = self;
  id v9 = v6;
  id v13 = v9;
  uint64_t v14 = &v15;
  [v8 performBlockAndWait:v10];
  v7[2](v7, v16[5]);

  _Block_object_dispose(&v15, 8);
}

- (void)_fetchDeclarationItemsOnlyIfNeeded:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = _os_activity_create((void *)&_mh_execute_header, "MDMConduit: fetching declaration items", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  id v8 = +[RMLog mdmConduit];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_100050418();
  }

  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  [(RMMDMConduit *)self context];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10004CDA8;
  v15[3] = &unk_1000C5BE0;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v16 = v9;
  uint64_t v17 = self;
  BOOL v19 = a3;
  id v18 = &v20;
  [v9 performBlockAndWait:v15];
  if (*((unsigned char *)v21 + 24))
  {
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = RMProtocolEndpointDeclarationItems;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10004CF4C;
    v13[3] = &unk_1000C61C0;
    void v13[4] = self;
    id v14 = v6;
    [(RMMDMConduit *)self _executeRequestForEndpoint:v11 requestData:0 expectedResponseClass:v10 completionHandler:v13];
  }
  else
  {
    uint64_t v12 = +[RMLog mdmConduit];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_1000503E4();
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }

  _Block_object_dispose(&v20, 8);
  os_activity_scope_leave(&state);
}

- (void)_didFinishFetchingDeclarationItems:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id))a5;
  if (v9)
  {
    uint64_t v11 = +[RMLog mdmConduit];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10003EBC4();
    }

    v10[2](v10, v9);
  }
  else
  {
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    char v23 = sub_10004B1B0;
    id v24 = sub_10004B1C0;
    id v25 = 0;
    [(RMMDMConduit *)self context];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10004D180;
    v15[3] = &unk_1000C5D88;
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    id v16 = v12;
    uint64_t v17 = self;
    id v18 = v8;
    BOOL v19 = &v20;
    [v12 performBlockAndWait:v15];
    if (v21[5])
    {
      ((void (*)(void (**)(id, id)))v10[2])(v10);
    }
    else
    {
      id v13 = +[RMLog mdmConduit];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14[0] = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Successfully saved partial object", (uint8_t *)v14, 2u);
      }

      v10[2](v10, 0);
    }

    _Block_object_dispose(&v20, 8);
  }
}

- (void)_processDeclarationItemsWithContext:(id)a3 infos:(id)a4 declarationItemClass:(Class)a5 declarationItemKeyPath:(id)a6
{
  id v9 = a3;
  id v40 = a4;
  id v10 = a6;
  v39 = self;
  uint64_t v11 = [(RMMDMConduit *)self managementSourceObjectID];
  v38 = v9;
  id v12 = [v9 objectWithID:v11];

  v37 = v12;
  v35 = v10;
  id v13 = [v12 valueForKey:v10];
  id v14 = +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v13 count]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v13;
  id v15 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v50;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v50 != v17) {
          objc_enumerationMutation(obj);
        }
        BOOL v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v20 = [v19 identifier];
        v21 = [v19 serverToken];
        uint64_t v22 = +[NSString stringWithFormat:@"%@-%@", v20, v21];
        [v14 setObject:v19 forKeyedSubscript:v22];
      }
      id v16 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
    }
    while (v16);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v41 = v40;
  id v23 = [v41 countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v46;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v46 != v25) {
          objc_enumerationMutation(v41);
        }
        v27 = *(void **)(*((void *)&v45 + 1) + 8 * (void)j);
        v28 = [v27 responseIdentifier];
        id v29 = [v27 responseServerToken];
        BOOL v30 = +[NSString stringWithFormat:@"%@-%@", v28, v29];
        uint64_t v31 = [v14 objectForKeyedSubscript:v30];
        if (v31)
        {
          id v32 = (id)v31;
          [v14 removeObjectForKey:v30];
        }
        else
        {
          id v32 = [[a5 alloc] initWithContext:v38];
          [v32 setIdentifier:v28];
          [v32 setServerToken:v29];
          [v32 setManagementSource:v37];
          [(RMMDMConduit *)v39 setMadeChangesDuringSync:1];
        }
      }
      id v24 = [v41 countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v24);
  }

  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_10004D804;
  v43[3] = &unk_1000C5EA0;
  v43[4] = v39;
  id v33 = v38;
  id v44 = v33;
  [v14 enumerateKeysAndObjectsUsingBlock:v43];
}

- (void)_fetchPartialObjectsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = RMProtocolEndpointDeclarationActivation;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004D9A8;
  v8[3] = &unk_1000C5DB0;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(RMMDMConduit *)self _fetchNextObjectOfClass:v5 endpoint:v6 completionHandler:v8];
}

- (void)_fetchNextObjectOfClass:(Class)a3 endpoint:(id)a4 completionHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = _os_activity_create((void *)&_mh_execute_header, "MDMConduit: fetching next object from server", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  uint64_t v11 = +[RMLog mdmConduit];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = NSStringFromClass(a3);
    sub_10003EE30(v12, v46, v11);
  }

  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = sub_10004B1B0;
  v42 = sub_10004B1C0;
  id v43 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_10004B1B0;
  v36 = sub_10004B1C0;
  id v37 = 0;
  [(RMMDMConduit *)self context];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10004DFB8;
  v25[3] = &unk_1000C61E8;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v26 = v13;
  v27 = self;
  BOOL v30 = &v32;
  Class v31 = a3;
  id v29 = &v38;
  id v14 = v8;
  id v28 = v14;
  [v13 performBlockAndWait:v25];
  if (v39[5])
  {
    uint64_t v15 = v33[5];
    uint64_t v16 = objc_opt_class();
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10004E188;
    v20[3] = &unk_1000C6210;
    v20[4] = self;
    id v23 = &v38;
    Class v24 = a3;
    id v21 = v14;
    id v22 = v9;
    [(RMMDMConduit *)self _executeRequestForEndpoint:v15 requestData:0 expectedResponseClass:v16 completionHandler:v20];
  }
  else
  {
    uint64_t v17 = +[RMLog mdmConduit];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromClass(a3);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v19 = [(RMMDMConduit *)self managementSourceObjectID];
      sub_10003EDBC(v18, v19, buf, v17);
    }

    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);

  os_activity_scope_leave(&state);
}

- (void)_didFinishFetchingObject:(id)a3 objectID:(id)a4 class:(Class)a5 endpoint:(id)a6 response:(id)a7 error:(id)a8 completionHandler:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  BOOL v19 = (void (**)(void))a9;
  uint64_t v20 = [v17 objectForKeyedSubscript:HTTPResponseKeyStatusCode];
  id v21 = [v20 integerValue];

  BOOL v22 = v21 == (id)200 || v18 == 0;
  if (v22 || v21 == (id)404)
  {
    *(void *)id v37 = 0;
    *(void *)&v37[8] = v37;
    *(void *)&v37[16] = 0x3032000000;
    uint64_t v38 = sub_10004B1B0;
    v39 = sub_10004B1C0;
    id v40 = 0;
    [(RMMDMConduit *)self context];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10004E514;
    v29[3] = &unk_1000C6238;
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    id v30 = v23;
    Class v31 = self;
    id v32 = v15;
    id v33 = v18;
    id v24 = v16;
    id v34 = v24;
    id v35 = v14;
    v36 = v37;
    [v23 performBlockAndWait:v29];
    if (*(void *)(*(void *)&v37[8] + 40))
    {
      v19[2](v19);
    }
    else
    {
      id v26 = +[RMLog mdmConduit];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Successfully saved object, fetching next one", buf, 2u);
      }

      [(RMMDMConduit *)self _fetchNextObjectOfClass:a5 endpoint:v24 completionHandler:v19];
    }

    _Block_object_dispose(v37, 8);
  }
  else
  {
    uint64_t v25 = +[RMLog mdmConduit];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id v37 = 138543874;
      *(void *)&v37[4] = v15;
      *(_WORD *)&v37[12] = 2114;
      *(void *)&v37[14] = v16;
      *(_WORD *)&v37[22] = 2114;
      uint64_t v38 = (uint64_t (*)(uint64_t, uint64_t))v18;
      _os_log_error_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Error while fetching object %{public}@ (%{public}@): %{public}@", v37, 0x20u);
    }

    ((void (*)(void (**)(void), id))v19[2])(v19, v18);
  }
}

- (void)sendStatusData:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create((void *)&_mh_execute_header, "MDMConduit: sending status", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  id v9 = +[RMLog mdmConduit];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_10005071C();
  }

  if (+[RMFeatureOverrides qaMode])
  {
    id v10 = +[RMLog mdmConduit];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_1000506E8();
    }

    [(RMMDMConduit *)self _writeQAStatusData:v6 completionHandler:v7];
  }
  else
  {
    uint64_t v11 = RMProtocolEndpointStatus;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004E9DC;
    v12[3] = &unk_1000C61C0;
    v12[4] = self;
    id v13 = v7;
    [(RMMDMConduit *)self _executeRequestForEndpoint:v11 requestData:v6 expectedResponseClass:0 completionHandler:v12];
  }
  os_activity_scope_leave(&state);
}

- (void)_didFinishSendingStatusWithError:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, id))a4;
  if (v6)
  {
    id v8 = +[RMLog mdmConduit];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10003F048();
    }

    v7[2](v7, v6);
  }
  else
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    BOOL v19 = sub_10004B1B0;
    uint64_t v20 = sub_10004B1C0;
    id v21 = 0;
    [(RMMDMConduit *)self context];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10004EBF0;
    v12[3] = &unk_1000C4E08;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v13 = v9;
    id v14 = self;
    id v15 = &v16;
    [v9 performBlockAndWait:v12];
    if (v17[5])
    {
      ((void (*)(void (**)(id, id)))v7[2])(v7);
    }
    else
    {
      id v10 = +[RMLog mdmConduit];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Successfully sent status", (uint8_t *)&v11, 2u);
      }

      v7[2](v7, 0);
    }

    _Block_object_dispose(&v16, 8);
  }
}

- (void)_writeQAStatusData:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  id v7 = +[NSURL URLWithString:@"file:///tmp/rmd_test/Status"];
  id v8 = +[NSFileManager defaultManager];
  id v9 = [v7 path];
  unsigned __int8 v10 = [v8 fileExistsAtPath:v9 isDirectory:0];

  if ((v10 & 1) == 0)
  {
    id v21 = 0;
    unsigned __int8 v11 = [v8 createDirectoryAtURL:v7 withIntermediateDirectories:1 attributes:0 error:&v21];
    id v12 = v21;
    id v13 = v12;
    if ((v11 & 1) == 0)
    {
      v6[2](v6, v12);
      goto LABEL_8;
    }
  }
  id v20 = 0;
  id v14 = +[NSJSONSerialization JSONObjectWithData:v5 options:0 error:&v20];
  id v13 = v20;
  if (v14)
  {
    id v15 = +[RMDateFormat stringLocalTimeZoneFractionalSecondsWithDate:0];
    uint64_t v16 = [v15 stringByAppendingPathExtension:@"json"];

    id v17 = [v7 URLByAppendingPathComponent:v16 isDirectory:0];
    id v19 = v13;
    +[RMJSONUtilities serializeJSONDictionary:v14 fileURL:v17 error:&v19];
    id v18 = v19;

    id v13 = v18;
  }
  v6[2](v6, 0);

LABEL_8:
}

- (id)_processResponse:(id)a3 payloadClass:(Class)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = [v8 objectForKeyedSubscript:HTTPResponseKeyStatusCode];
  unsigned __int8 v10 = (char *)[v9 integerValue];

  unsigned __int8 v11 = [v8 objectForKeyedSubscript:HTTPResponseKeyBody];
  id v12 = +[RMLog mdmConduit];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Got back from MDM: %ld", buf, 0xCu);
  }

  if ((unint64_t)(v10 - 400) <= 0xC7)
  {
    id v24 = 0;
    unsigned __int8 v13 = [(RMMDMConduit *)self _processErrorResponse:v8 error:&v24];
    id v14 = v24;
    id v15 = v14;
    if (v13)
    {
      if (v11)
      {
        uint64_t v16 = [v11 base64EncodedStringWithOptions:0];
        if (!a5) {
          goto LABEL_30;
        }
      }
      else
      {
        uint64_t v16 = @"Empty Response Body";
        if (!a5)
        {
LABEL_30:

          goto LABEL_31;
        }
      }
      id v21 = +[RMErrorUtilities createMDMRequestInvalid:v16];
      BOOL v22 = v21;
      if (v21) {
        *a5 = v21;
      }

      goto LABEL_30;
    }
    if (!a5 || !v14) {
      goto LABEL_31;
    }
LABEL_21:
    *a5 = v15;
LABEL_31:

    id v19 = 0;
    goto LABEL_32;
  }
  if (v10 != (char *)204 && v11 != 0)
  {
    if (a4)
    {
      uint64_t v20 = [(objc_class *)a4 loadData:v11 serializationType:1 error:a5];
LABEL_25:
      id v19 = (void *)v20;
      goto LABEL_32;
    }
LABEL_24:
    uint64_t v20 = +[RMModelAnyPayload buildFromDictionary:&__NSDictionary0__struct];
    goto LABEL_25;
  }
  if (!a4 || (Class)objc_opt_class() == a4) {
    goto LABEL_24;
  }
  unsigned int v18 = [(RMMDMConduit *)self _incrementConduitStateError:2 serverRetryAfter:0 error:a5];
  id v19 = 0;
  if (a5 && v18)
  {
    id v15 = +[RMErrorUtilities createMDMRequestInvalid:@"Empty body"];
    if (!v15) {
      goto LABEL_31;
    }
    goto LABEL_21;
  }
LABEL_32:

  return v19;
}

- (BOOL)_processErrorResponse:(id)a3 error:(id *)a4
{
  uint64_t v6 = HTTPResponseKeyStatusCode;
  id v7 = a3;
  id v8 = [v7 objectForKeyedSubscript:v6];
  uint64_t v9 = (uint64_t)[v8 integerValue];

  unsigned __int8 v10 = [v7 objectForKeyedSubscript:HTTPResponseKeyHeaders];
  unsigned __int8 v11 = [v7 objectForKeyedSubscript:HTTPResponseKeyBody];

  id v12 = v11;
  uint64_t v13 = [v10 objectForKeyedSubscript:@"Content-Type"];
  id v14 = (void *)v13;
  id v15 = @"text/html";
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  uint64_t v16 = v15;
  id v17 = (char *)[(__CFString *)v16 rangeOfString:@";"];
  if (v18)
  {
    id v19 = v17;
    uint64_t v20 = v18;
    id v21 = [(__CFString *)v16 substringToIndex:v17];
    id v22 = [(__CFString *)v16 substringFromIndex:&v19[v20]];
  }
  else
  {
    id v21 = v16;
    id v22 = 0;
  }

  id v23 = v21;
  id v24 = v22;

  if (v12 && ![(__CFString *)v23 isEqualToString:@"application/json"])
  {
    v27 = 0;
    goto LABEL_23;
  }
  if ([v24 length])
  {
    uint64_t v25 = +[RMLog mdmConduit];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Unused Content-Type parameter: %{public}@", buf, 0xCu);
    }
  }
  id v26 = v12;
  if (!v12) {
    id v26 = objc_opt_new();
  }
  *(void *)buf = 0;
  v27 = +[RMProtocolErrorResponse loadData:v26 serializationType:1 error:buf];
  id v28 = *(id *)buf;
  if (v12)
  {
    if (!v27) {
      goto LABEL_19;
    }
  }
  else
  {

    if (!v27)
    {
LABEL_19:
      id v29 = +[RMLog mdmConduit];
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_10003F4E8();
      }
    }
  }

LABEL_23:
  id v30 = [v27 responseCode];
  Class v31 = v30;
  id v32 = 0;
  uint64_t v33 = 2;
  if (v9 > 409)
  {
    if (v9 == 410)
    {
      id v32 = 0;
      if ([v30 isEqualToString:RMProtocolErrorResponse_Code_enrollmentNotAllowed]) {
        uint64_t v33 = 4;
      }
      else {
        uint64_t v33 = 2;
      }
    }
    else if (v9 == 503)
    {
      id v34 = [v10 objectForKeyedSubscript:@"Retry-After"];
      if (v34)
      {
        id v35 = objc_opt_new();
        id v36 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US_POSIX"];
        [v35 setLocale:v36];

        [v35 setDateFormat:@"EEE, dd MMM yyyy HH:mm:ss Z"];
        id v32 = [v35 dateFromString:v34];
        if (!v32)
        {
          uint64_t v37 = (uint64_t)[v34 integerValue];
          if (v37 < 1)
          {
            id v32 = 0;
          }
          else
          {
            id v32 = +[NSDate dateWithTimeIntervalSinceNow:(double)v37];
          }
        }
      }
      else
      {
        id v32 = 0;
      }

      uint64_t v33 = 3;
    }
  }
  else
  {
    if (v9 == 403)
    {
      if (([v30 isEqualToString:RMProtocolErrorResponse_Code_clientVersionInvalid] & 1) != 0
        || ([v31 isEqualToString:RMProtocolErrorResponse_Code_deviceAuthInvalid] & 1) != 0
        || [v31 isEqualToString:RMProtocolErrorResponse_Code_deviceAuthMissing])
      {
        id v32 = 0;
        uint64_t v33 = 1;
        goto LABEL_45;
      }
      goto LABEL_27;
    }
    if (v9 == 404)
    {
      [v30 isEqualToString:RMProtocolErrorResponse_Code_enrollmentTokenInvalid];
LABEL_27:
      id v32 = 0;
      uint64_t v33 = 2;
    }
  }
LABEL_45:
  BOOL v38 = [(RMMDMConduit *)self _incrementConduitStateError:v33 serverRetryAfter:v32 error:a4];

  return v38;
}

- (BOOL)_incrementConduitStateError:(signed __int16)a3 serverRetryAfter:(id)a4 error:(id *)a5
{
  id v8 = a4;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_10004B1B0;
  id v23 = sub_10004B1C0;
  id v24 = 0;
  [(RMMDMConduit *)self context];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004F798;
  v13[3] = &unk_1000C5F68;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v9;
  id v15 = self;
  signed __int16 v18 = a3;
  id v10 = v8;
  id v16 = v10;
  id v17 = &v19;
  [v9 performBlockAndWait:v13];
  unsigned __int8 v11 = (void *)v20[5];
  if (a5 && v11) {
    *a5 = v11;
  }

  _Block_object_dispose(&v19, 8);
  return v11 == 0;
}

- (id)_requestDataForPayload:(id)a3 error:(id *)a4
{
  if (a3)
  {
    id v5 = [a3 serializeAsDataWithType:1 error:a4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)_executeRequestForEndpoint:(id)a3 requestData:(id)a4 expectedResponseClass:(Class)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = [a3 substringFromIndex:29];
  CFStringRef v20 = @"Endpoint";
  uint64_t v21 = v12;
  uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v14 = [v13 mutableCopy];

  [v14 setObject:v11 forKeyedSubscript:@"Data"];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10004FB04;
  v17[3] = &unk_1000C6288;
  BOOL v15 = +[RMBundle managementScope] == 0;
  v17[4] = self;
  id v18 = v10;
  Class v19 = a5;
  id v16 = v10;
  +[MDMDeclarativeManagement executeRequestForEndpoint:v12 channelType:v15 requestData:v11 completionHandler:v17];
}

- (BOOL)persistentHistoryNotifier:(id)a3 isChangeInteresting:(id)a4 stop:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v9 changeType] == (id)2)
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    id v11 = [v9 changedObjectID];
    id v12 = [v11 entity];
    uint64_t v13 = +[RMConduitConfig entity];
    unsigned int v10 = [v12 isKindOfEntity:v13];
    if (v10)
    {
      uint64_t v22 = 0;
      id v23 = &v22;
      uint64_t v24 = 0x2020000000;
      char v25 = 0;
      id v14 = [(RMMDMConduit *)self context];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10004FE44;
      v16[3] = &unk_1000C5FB8;
      v16[4] = self;
      id v17 = v11;
      id v18 = v9;
      id v19 = v12;
      id v20 = v13;
      uint64_t v21 = &v22;
      [v14 performBlockAndWait:v16];
      *a5 = *((unsigned char *)v23 + 24);

      _Block_object_dispose(&v22, 8);
    }
  }
  return v10;
}

- (void)persistentHistoryNotifier:(id)a3 hasChanges:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = [v6 insertedObjectIDs];
  if (![v7 count])
  {
    id v8 = [v6 updatedObjectIDs];
    if (![v8 count])
    {
      id v9 = [v6 deletedObjectIDs];
      if (![v9 count])
      {
        id v11 = [v14 persistentHistoryToken];
        id v12 = [v6 persistentHistoryToken];
        unsigned __int8 v13 = +[RMPersistentHistoryNotifierChanges isExistingPersistentHistoryToken:v11 fromSameStoreAsUpdatedToken:v12];

        if (v13) {
          goto LABEL_10;
        }
        goto LABEL_7;
      }
    }
  }

LABEL_7:
  unsigned int v10 = [(RMMDMConduit *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v10 conduitNeedsToSync:self];
  }

LABEL_10:
}

- (RMConduitDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RMConduitDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RMPersistentHistoryNotifier)persistentHistoryNotifier
{
  return self->_persistentHistoryNotifier;
}

- (void)setPersistentHistoryNotifier:(id)a3
{
}

- (BOOL)madeChangesDuringSync
{
  return self->_madeChangesDuringSync;
}

- (void)setMadeChangesDuringSync:(BOOL)a3
{
  self->_madeChangesDuringSync = a3;
}

- (NSManagedObjectContext)context
{
  return self->_context;
}

- (NSManagedObjectID)managementSourceObjectID
{
  return self->_managementSourceObjectID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managementSourceObjectID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_persistentHistoryNotifier, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end