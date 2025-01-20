@interface VCCompanionSyncOutgoingSession
+ (int64_t)direction;
- (NSDictionary)metadata;
- (NSMutableArray)pendingChanges;
- (NSMutableArray)sentChanges;
- (NSMutableArray)syncedChanges;
- (VCCompanionSyncOutgoingSession)initWithSYSession:(id)a3 service:(id)a4 syncDataHandlers:(id)a5 changeSet:(id)a6 metadata:(id)a7;
- (double)progress;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)syncSession:(id)a3 successfullySynced:(id)a4;
@end

@implementation VCCompanionSyncOutgoingSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncedChanges, 0);
  objc_storeStrong((id *)&self->_sentChanges, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_pendingChanges, 0);
}

- (NSMutableArray)syncedChanges
{
  return self->_syncedChanges;
}

- (NSMutableArray)sentChanges
{
  return self->_sentChanges;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSMutableArray)pendingChanges
{
  return self->_pendingChanges;
}

- (void)syncSession:(id)a3 successfullySynced:(id)a4
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 state] != 5)
  {
    id v44 = v6;
    v8 = [(VCCompanionSyncOutgoingSession *)self sentChanges];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = __65__VCCompanionSyncOutgoingSession_syncSession_successfullySynced___block_invoke;
    v55[3] = &unk_1E6541AF8;
    id v43 = v7;
    id v56 = v7;
    uint64_t v9 = [v8 indexesOfObjectsPassingTest:v55];

    v10 = [(VCCompanionSyncOutgoingSession *)self sentChanges];
    v11 = [v10 objectsAtIndexes:v9];

    v12 = [(VCCompanionSyncOutgoingSession *)self syncedChanges];
    [v12 addObjectsFromArray:v11];

    v13 = [(VCCompanionSyncOutgoingSession *)self sentChanges];
    v42 = (void *)v9;
    [v13 removeObjectsAtIndexes:v9];

    v14 = [(VCCompanionSyncSession *)self delegate];
    [(VCCompanionSyncOutgoingSession *)self progress];
    objc_msgSend(v14, "companionSyncSession:didUpdateProgress:", self);

    v15 = [(VCCompanionSyncOutgoingSession *)self pendingChanges];
    v16 = [(VCCompanionSyncOutgoingSession *)self pendingChanges];
    v17 = [v15 arrayByAddingObjectsFromArray:v16];

    v41 = v11;
    v49 = VCPartitionMessages(v11);
    v40 = v17;
    v46 = VCPartitionMessages(v17);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id obj = [(VCCompanionSyncSession *)self syncDataHandlers];
    uint64_t v18 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
    if (!v18) {
      goto LABEL_20;
    }
    uint64_t v19 = v18;
    uint64_t v48 = *(void *)v52;
    v47 = self;
    while (1)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v52 != v48) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        v22 = (void *)MEMORY[0x1C87C4C10]();
        v23 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_opt_class(), "messageType"));
        v24 = [v49 objectForKeyedSubscript:v23];
        if ([v24 count])
        {
          v25 = [v46 objectForKeyedSubscript:v23];
          if ([v25 count])
          {
            v26 = 0;
          }
          else
          {
            v27 = [(VCCompanionSyncOutgoingSession *)self metadata];
            v26 = [v27 objectForKeyedSubscript:v23];

            self = v47;
          }

          v28 = [(VCCompanionSyncSession *)self service];
          id v50 = 0;
          int v29 = [v21 markChangesAsSynced:v24 withSyncService:v28 metadata:v26 error:&v50];
          id v30 = v50;

          v31 = getWFWatchSyncLogObject();
          v32 = v31;
          if (v29)
          {
            self = v47;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              v33 = [(VCCompanionSyncSession *)v47 service];
              uint64_t v34 = [v24 count];
              *(_DWORD *)buf = 136315650;
              v58 = "-[VCCompanionSyncOutgoingSession syncSession:successfullySynced:]";
              __int16 v59 = 2114;
              v60 = v33;
              __int16 v61 = 2048;
              uint64_t v62 = v34;
              v35 = v32;
              os_log_type_t v36 = OS_LOG_TYPE_INFO;
              v37 = "%s Service %{public}@ marked %lu changes as synced";
              uint32_t v38 = 32;
              goto LABEL_16;
            }
          }
          else
          {
            self = v47;
            if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
            {
              v33 = [(VCCompanionSyncSession *)v47 service];
              uint64_t v39 = [v24 count];
              *(_DWORD *)buf = 136315906;
              v58 = "-[VCCompanionSyncOutgoingSession syncSession:successfullySynced:]";
              __int16 v59 = 2114;
              v60 = v33;
              __int16 v61 = 2048;
              uint64_t v62 = v39;
              __int16 v63 = 2114;
              id v64 = v30;
              v35 = v32;
              os_log_type_t v36 = OS_LOG_TYPE_FAULT;
              v37 = "%s Service %{public}@ failed to mark %lu changes as synced: %{public}@";
              uint32_t v38 = 42;
LABEL_16:
              _os_log_impl(&dword_1C7D7E000, v35, v36, v37, buf, v38);
            }
          }
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v51 objects:v65 count:16];
      if (!v19)
      {
LABEL_20:

        id v7 = v43;
        id v6 = v44;
        break;
      }
    }
  }
}

uint64_t __65__VCCompanionSyncOutgoingSession_syncSession_successfullySynced___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 objectIdentifier];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  SEL v29 = a2;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (uint64_t (**)(id, void *))a4;
  uint64_t v9 = getWFWatchSyncLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v31 = "-[VCCompanionSyncOutgoingSession syncSession:enqueueChanges:error:]";
    __int16 v32 = 2114;
    v33 = self;
    __int16 v34 = 2114;
    uint64_t v35 = (uint64_t)v7;
    _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@ -enqueueChanges called by %{public}@", buf, 0x20u);
  }

  v10 = [(VCCompanionSyncOutgoingSession *)self pendingChanges];
  v11 = [v10 firstObject];

  if (v11)
  {
    while (1)
    {
      v12 = (void *)MEMORY[0x1C87C4C10]();
      int v13 = v8[2](v8, v11);
      v14 = getWFWatchSyncLogObject();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (!v13) {
        break;
      }
      if (v15)
      {
        *(_DWORD *)buf = 136315650;
        v31 = "-[VCCompanionSyncOutgoingSession syncSession:enqueueChanges:error:]";
        __int16 v32 = 2114;
        v33 = self;
        __int16 v34 = 2114;
        uint64_t v35 = (uint64_t)v11;
        _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_DEFAULT, "%s %{public}@ successfully enqueued change=%{public}@", buf, 0x20u);
      }

      v16 = [(VCCompanionSyncOutgoingSession *)self pendingChanges];
      uint64_t v17 = [v16 indexOfObject:v11];

      if (v17)
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:v29 object:self file:@"VCCompanionSyncOutgoingSession.m" lineNumber:74 description:@"Change should be the first pending change"];
      }
      uint64_t v18 = [(VCCompanionSyncOutgoingSession *)self pendingChanges];
      [v18 removeObjectAtIndex:0];

      uint64_t v19 = [(VCCompanionSyncOutgoingSession *)self sentChanges];
      [v19 addObject:v11];

      v20 = [(VCCompanionSyncOutgoingSession *)self pendingChanges];
      uint64_t v21 = [v20 firstObject];

      v11 = (void *)v21;
      if (!v21) {
        goto LABEL_14;
      }
    }
    if (v15)
    {
      *(_DWORD *)buf = 136315650;
      v31 = "-[VCCompanionSyncOutgoingSession syncSession:enqueueChanges:error:]";
      __int16 v32 = 2114;
      v33 = self;
      __int16 v34 = 2114;
      uint64_t v35 = (uint64_t)v11;
      _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_DEFAULT, "%s %{public}@ stopped early, before sending change=%{public}@", buf, 0x20u);
    }
  }
LABEL_14:
  v23 = [(VCCompanionSyncOutgoingSession *)self pendingChanges];
  uint64_t v24 = [v23 count];

  v25 = getWFWatchSyncLogObject();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v31 = "-[VCCompanionSyncOutgoingSession syncSession:enqueueChanges:error:]";
    __int16 v32 = 2114;
    v33 = self;
    __int16 v34 = 2048;
    uint64_t v35 = v24;
    _os_log_impl(&dword_1C7D7E000, v25, OS_LOG_TYPE_DEFAULT, "%s %{public}@ finished enqueuing changes, with %lu remaining changes", buf, 0x20u);
  }

  if (v24)
  {
    v26 = [(VCCompanionSyncSession *)self transaction];
    os_transaction_needs_more_time();
    unsigned int v27 = 1;
  }
  else
  {
    v26 = [(VCCompanionSyncSession *)self delegate];
    [v26 companionSyncSessionDidFinishSendingChanges:self];
    unsigned int v27 = 2;
  }

  return v27;
}

- (double)progress
{
  v3 = [(VCCompanionSyncOutgoingSession *)self syncedChanges];
  unint64_t v4 = [v3 count];

  v5 = [(VCCompanionSyncOutgoingSession *)self pendingChanges];
  uint64_t v6 = [v5 count];
  id v7 = [(VCCompanionSyncOutgoingSession *)self sentChanges];
  uint64_t v8 = v6 + v4 + [v7 count];

  return (double)v4 / (double)(unint64_t)v8;
}

- (VCCompanionSyncOutgoingSession)initWithSYSession:(id)a3 service:(id)a4 syncDataHandlers:(id)a5 changeSet:(id)a6 metadata:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = v17;
  if (v16)
  {
    if (v17) {
      goto LABEL_3;
    }
  }
  else
  {
    id v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"VCCompanionSyncOutgoingSession.m", 42, @"Invalid parameter not satisfying: %@", @"changeSet" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  v31 = [MEMORY[0x1E4F28B00] currentHandler];
  [v31 handleFailureInMethod:a2, self, @"VCCompanionSyncOutgoingSession.m", 43, @"Invalid parameter not satisfying: %@", @"metadata" object file lineNumber description];

LABEL_3:
  v32.receiver = self;
  v32.super_class = (Class)VCCompanionSyncOutgoingSession;
  uint64_t v19 = [(VCCompanionSyncSession *)&v32 initWithSYSession:v13 service:v14 syncDataHandlers:v15];
  if (v19)
  {
    uint64_t v20 = [v16 mutableCopy];
    pendingChanges = v19->_pendingChanges;
    v19->_pendingChanges = (NSMutableArray *)v20;

    uint64_t v22 = objc_opt_new();
    sentChanges = v19->_sentChanges;
    v19->_sentChanges = (NSMutableArray *)v22;

    uint64_t v24 = objc_opt_new();
    syncedChanges = v19->_syncedChanges;
    v19->_syncedChanges = (NSMutableArray *)v24;

    uint64_t v26 = [v18 copy];
    metadata = v19->_metadata;
    v19->_metadata = (NSDictionary *)v26;

    v28 = v19;
  }

  return v19;
}

+ (int64_t)direction
{
  return 0;
}

@end