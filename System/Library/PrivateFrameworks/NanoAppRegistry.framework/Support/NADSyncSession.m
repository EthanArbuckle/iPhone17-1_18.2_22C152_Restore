@interface NADSyncSession
- (BOOL)isComplete;
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (BOOL)syncSession:(id)a3 rollbackChangesWithError:(id *)a4;
- (NADApplicationStoreTransaction)transaction;
- (NADSyncSession)initWithSession:(id)a3 transaction:(id)a4;
- (NADSyncSessionDelegate)delegate;
- (NSProgress)progress;
- (NSString)description;
- (SYSession)session;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)setDelegate:(id)a3;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
@end

@implementation NADSyncSession

- (NADSyncSession)initWithSession:(id)a3 transaction:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NADSyncSession;
  v9 = [(NADSyncSession *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    session = v10->_session;
    v12 = objc_alloc_init(NARSYStoreSerializer);
    [(SYSession *)session setSerializer:v12];

    v13 = v10->_session;
    uint64_t v21 = IDSSendMessageOptionBypassDuetKey;
    v22 = &__kCFBooleanTrue;
    v14 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [(SYSession *)v13 setOptions:v14];

    [(SYSession *)v10->_session setCanRollback:1];
    [(SYSession *)v10->_session setDelegate:v10];
    objc_storeStrong((id *)&v10->_transaction, a4);
    v15 = (NSProgress *)[objc_alloc((Class)NSProgress) initWithParent:0 userInfo:0];
    progress = v10->_progress;
    v10->_progress = v15;

    v17 = [v7 sessionMetadata];
    v18 = [v17 objectForKeyedSubscript:@"changeCount"];

    if (v18) {
      -[NSProgress setTotalUnitCount:](v10->_progress, "setTotalUnitCount:", [v18 integerValue]);
    }
  }
  return v10;
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [(NADSyncSession *)self session];
  uint64_t v6 = [v5 identifier];
  id v7 = (void *)v6;
  if (self->_complete) {
    CFStringRef v8 = @"YES";
  }
  else {
    CFStringRef v8 = @"NO";
  }
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ %p; identifier=%@; complete=%@>",
    v4,
    self,
    v6,
  v9 = v8);

  return (NSString *)v9;
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  return 5;
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = nar_sync_log();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000F6B8((uint64_t)self, (uint64_t)v7, v9);
    }

    v10 = [(NADSyncSession *)self transaction];
    [v10 rollback];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "session %@ didEndWithError:", (uint8_t *)&v12, 0xCu);
    }

    v10 = [(NADSyncSession *)self transaction];
    [v10 commit:0];
  }

  self->_complete = 1;
  v11 = nar_sync_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    v13 = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Completed session end %@", (uint8_t *)&v12, 0xCu);
  }
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  id v6 = a4;
  v35 = (void (**)(id, uint64_t, void))a5;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v7 = [v6 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (!v7)
  {
    uint64_t v36 = 0;
    uint64_t v9 = 0;
    goto LABEL_26;
  }
  id v8 = v7;
  uint64_t v36 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v40;
  v11 = &selRef_entityClass;
  do
  {
    int v12 = 0;
    id v37 = v8;
    do
    {
      if (*(void *)v40 != v10) {
        objc_enumerationMutation(v6);
      }
      v13 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v12);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = nar_workspace_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = [v13 objectIdentifier];
          *(_DWORD *)buf = 138412290;
          v44 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Object with bundle id added: %@", buf, 0xCu);
        }
        sub_10000C828(v13);
        id v16 = (id)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          ++v9;
          v17 = [(NADSyncSession *)self transaction];
          [v17 insertApplication:v16];
        }
        else
        {
          v17 = nar_sync_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to convert application wrapper %@", buf, 0xCu);
          }
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v18 = v10;
          v19 = v11;
          uint64_t v20 = v9;
          id v21 = v6;
          id v16 = v13;
          id v22 = objc_alloc((Class)NSUUID);
          v23 = [v16 uUID];
          v17 = [v22 initWithUUIDString:v23];

          v24 = nar_sync_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            v25 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v16 sequenceNumber]);
            v26 = [v16 uUID];
            *(_DWORD *)buf = 138412546;
            v44 = v25;
            __int16 v45 = 2112;
            v46 = v26;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Updated sequence number: %@ UUID: %@", buf, 0x16u);
          }
          v27 = [(NADSyncSession *)self transaction];
          v28 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v16 sequenceNumber]);
          [v27 setSequenceNumber:v28 UUID:v17];

          id v6 = v21;
          uint64_t v9 = v20;
          v11 = v19;
          uint64_t v10 = v18;
          id v8 = v37;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_22;
          }
          v29 = nar_sync_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            v30 = [v13 objectIdentifier];
            *(_DWORD *)buf = 138412290;
            v44 = v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Object deleted: %@", buf, 0xCu);
          }
          ++v36;
          id v16 = [(NADSyncSession *)self transaction];
          v17 = [v13 objectIdentifier];
          [v16 removeApplicationWithBundleIdentifier:v17];
        }
      }

LABEL_22:
      int v12 = (char *)v12 + 1;
    }
    while (v8 != v12);
    id v8 = [v6 countByEnumeratingWithState:&v39 objects:v47 count:16];
  }
  while (v8);
LABEL_26:
  -[NSProgress setCompletedUnitCount:](self->_progress, "setCompletedUnitCount:", (char *)-[NSProgress completedUnitCount](self->_progress, "completedUnitCount") + (void)[v6 count]);
  v31 = [(NADSyncSession *)self delegate];
  [v31 syncSessionDidUpdateProgress:self];

  v32 = nar_sync_log();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = +[NSNumber numberWithInteger:v9];
    v34 = +[NSNumber numberWithInteger:v36];
    *(_DWORD *)buf = 138412546;
    v44 = v33;
    __int16 v45 = 2112;
    v46 = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Added %@ apps; Removed %@ apps", buf, 0x16u);
  }
  v35[2](v35, 1, 0);
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  v5 = nar_sync_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    uint64_t v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "syncSession: %@ resetDataStoreWithError:", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [(NADSyncSession *)self transaction];
  [v6 removeAllEntities];

  return 1;
}

- (BOOL)syncSession:(id)a3 rollbackChangesWithError:(id *)a4
{
  v5 = [(NADSyncSession *)self transaction];
  [v5 rollback];

  id v6 = nar_sync_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_10000F740((uint64_t)self, v6);
  }

  return 1;
}

- (SYSession)session
{
  return self->_session;
}

- (NADSyncSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NADSyncSessionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSProgress)progress
{
  return self->_progress;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (NADApplicationStoreTransaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_session, 0);
}

@end