@interface PDSCoordinator
- (BOOL)_disabledForAnyReason;
- (BOOL)_entries:(id)a3 includeState:(unsigned __int8)a4;
- (BOOL)_lastPushTokenDiffersFrom:(id)a3;
- (BOOL)_lastSandboxPushTokenDiffersFrom:(id)a3;
- (BOOL)_matchingEntryExistsFor:(id)a3 inStore:(id)a4;
- (BOOL)_requestMatchesPreviousRequest:(id)a3;
- (BOOL)disabled;
- (BOOL)requestPending;
- (BOOL)shouldScheduleHeartbeatForTracker:(id)a3;
- (BOOL)tokenChanged;
- (CUTDeferredTaskQueue)processDeferredTaskQueue;
- (IDSPushHandler)pushHandler;
- (IDSServerBag)serverBag;
- (NSDate)pendingRequestDate;
- (OS_dispatch_queue)queue;
- (PDSCoordinator)initWithQueue:(id)a3 serverBag:(id)a4 requestQueue:(id)a5 kvStoreBlock:(id)a6 entryStoreBlock:(id)a7 pushTokenBlock:(id)a8 systemMonitor:(id)a9 pushHandler:(id)a10;
- (PDSHeartbeatTracker)heartbeatTracker;
- (PDSRequestQueue)requestQueue;
- (double)_timeToDelayRequestForTopics:(id)a3;
- (id)entryStoreBlock;
- (id)kvStoreBlock;
- (id)pushTokenBlock;
- (int64_t)bagLoadRetries;
- (int64_t)ttlForRequest:(id)a3;
- (unint64_t)_lastRequestHash;
- (void)_bagReloaded:(id)a3;
- (void)_comparePushTokensWithEntryStore:(id)a3;
- (void)_markLastRequest:(id)a3;
- (void)_markPushToken:(id)a3;
- (void)_markSandboxPushToken:(id)a3;
- (void)_processEntryStore;
- (void)_pushTokenChangedWithEntryStore:(id)a3;
- (void)_updateAllHeartbeatEntriesWithState:(unsigned __int8)a3 inEntryStore:(id)a4;
- (void)_updateEntriesForResponse:(id)a3 fromRequest:(id)a4;
- (void)_updateOrDeleteEntry:(id)a3 inStore:(id)a4;
- (void)dealloc;
- (void)entryStore:(id)a3 didUpdatePendingTopics:(id)a4 forceImmediateUpdate:(BOOL)a5;
- (void)handler:(id)a3 pushTokenChanged:(id)a4;
- (void)registerIfNeeded;
- (void)requestQueue:(id)a3 processedRequest:(id)a4 withResponse:(id)a5;
- (void)setBagLoadRetries:(int64_t)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setEntryStoreBlock:(id)a3;
- (void)setHeartbeatTracker:(id)a3;
- (void)setKvStoreBlock:(id)a3;
- (void)setPendingRequestDate:(id)a3;
- (void)setProcessDeferredTaskQueue:(id)a3;
- (void)setPushHandler:(id)a3;
- (void)setPushTokenBlock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestPending:(BOOL)a3;
- (void)setRequestQueue:(id)a3;
- (void)setServerBag:(id)a3;
- (void)setTokenChanged:(BOOL)a3;
- (void)systemDidLeaveFirstDataProtectionLock;
@end

@implementation PDSCoordinator

- (PDSCoordinator)initWithQueue:(id)a3 serverBag:(id)a4 requestQueue:(id)a5 kvStoreBlock:(id)a6 entryStoreBlock:(id)a7 pushTokenBlock:(id)a8 systemMonitor:(id)a9 pushHandler:(id)a10
{
  id v17 = a3;
  id obj = a4;
  id v18 = a4;
  id v49 = a5;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v50 = a10;
  if (!v17)
  {
    v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"PDSCoordinator.m", 52, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  v24 = v23;
  if (!v18)
  {
    v42 = [MEMORY[0x263F08690] currentHandler];
    [v42 handleFailureInMethod:a2, self, @"PDSCoordinator.m", 53, @"Invalid parameter not satisfying: %@", @"serverBag" object file lineNumber description];
  }
  v25 = v19;
  v26 = self;
  if (v25)
  {
    if (v20) {
      goto LABEL_7;
    }
  }
  else
  {
    v43 = [MEMORY[0x263F08690] currentHandler];
    [v43 handleFailureInMethod:a2, v26, @"PDSCoordinator.m", 54, @"Invalid parameter not satisfying: %@", @"requestQueue" object file lineNumber description];

    if (v20)
    {
LABEL_7:
      if (v21) {
        goto LABEL_8;
      }
LABEL_14:
      v45 = [MEMORY[0x263F08690] currentHandler];
      [v45 handleFailureInMethod:a2, v26, @"PDSCoordinator.m", 56, @"Invalid parameter not satisfying: %@", @"entryStoreBlock" object file lineNumber description];

      if (v22) {
        goto LABEL_9;
      }
      goto LABEL_15;
    }
  }
  v44 = [MEMORY[0x263F08690] currentHandler];
  [v44 handleFailureInMethod:a2, v26, @"PDSCoordinator.m", 55, @"Invalid parameter not satisfying: %@", @"kvStoreBlock" object file lineNumber description];

  if (!v21) {
    goto LABEL_14;
  }
LABEL_8:
  if (v22) {
    goto LABEL_9;
  }
LABEL_15:
  v46 = [MEMORY[0x263F08690] currentHandler];
  [v46 handleFailureInMethod:a2, v26, @"PDSCoordinator.m", 57, @"Invalid parameter not satisfying: %@", @"pushTokenBlock" object file lineNumber description];

LABEL_9:
  v51.receiver = v26;
  v51.super_class = (Class)PDSCoordinator;
  v27 = [(PDSCoordinator *)&v51 init];
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_queue, a3);
    objc_storeStrong((id *)&v28->_serverBag, obj);
    objc_storeStrong((id *)&v28->_requestQueue, v49);
    [(PDSRequestQueue *)v28->_requestQueue setDelegate:v28];
    uint64_t v29 = MEMORY[0x223C8A560](v20);
    id kvStoreBlock = v28->_kvStoreBlock;
    v28->_id kvStoreBlock = (id)v29;

    uint64_t v31 = MEMORY[0x223C8A560](v21);
    id entryStoreBlock = v28->_entryStoreBlock;
    v28->_id entryStoreBlock = (id)v31;

    uint64_t v33 = MEMORY[0x223C8A560](v22);
    id pushTokenBlock = v28->_pushTokenBlock;
    v28->_id pushTokenBlock = (id)v33;

    *(_WORD *)&v28->_requestPending = 0;
    v28->_tokenChanged = 0;
    v28->_bagLoadRetries = 0;
    objc_storeStrong((id *)&v28->_pushHandler, a10);
    [(IDSPushHandler *)v28->_pushHandler addListener:v28 topics:0 commands:0 queue:v28->_queue];
    v35 = [MEMORY[0x263F08A00] defaultCenter];
    [v35 addObserver:v28 selector:sel__bagReloaded_ name:*MEMORY[0x263F4A1D0] object:v18];

    [v24 addListener:v28];
    v36 = [PDSHeartbeatTracker alloc];
    v37 = [(PDSCoordinator *)v28 queue];
    uint64_t v38 = [(PDSHeartbeatTracker *)v36 initWithDelegate:v28 queue:v37 kvStoreBlock:v20 serverBag:v18];
    heartbeatTracker = v28->_heartbeatTracker;
    v28->_heartbeatTracker = (PDSHeartbeatTracker *)v38;
  }
  return v28;
}

- (void)dealloc
{
  [(IDSPushHandler *)self->_pushHandler removeListener:self];
  v3.receiver = self;
  v3.super_class = (Class)PDSCoordinator;
  [(PDSCoordinator *)&v3 dealloc];
}

- (void)registerIfNeeded
{
  objc_super v3 = pds_defaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221791000, v3, OS_LOG_TYPE_DEFAULT, "Registering if needed.", buf, 2u);
  }

  v4 = [(PDSCoordinator *)self entryStoreBlock];
  v5 = v4[2]();

  if (v5)
  {
    [(PDSCoordinator *)self _comparePushTokensWithEntryStore:v5];
    [(PDSCoordinator *)self entryStore:v5 didUpdatePendingTopics:MEMORY[0x263EFFA68] forceImmediateUpdate:1];
  }
  else
  {
    v6 = pds_defaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_221791000, v6, OS_LOG_TYPE_DEFAULT, "EntryStore is nil! aborting", v7, 2u);
    }
  }
}

- (void)entryStore:(id)a3 didUpdatePendingTopics:(id)a4 forceImmediateUpdate:(BOOL)a5
{
  id v10 = a4;
  if (![(PDSCoordinator *)self _disabledForAnyReason])
  {
    [(PDSCoordinator *)self setRequestPending:1];
    double v7 = 0.0;
    if (!a5)
    {
      [(PDSCoordinator *)self _timeToDelayRequestForTopics:v10];
      double v7 = v8;
    }
    v9 = [(PDSCoordinator *)self processDeferredTaskQueue];
    [v9 enqueueExecutionWithTarget:self afterDelay:v7];
  }
}

- (void)requestQueue:(id)a3 processedRequest:(id)a4 withResponse:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  v9 = pds_defaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412290;
    uint64_t v24 = (uint64_t)v8;
    _os_log_impl(&dword_221791000, v9, OS_LOG_TYPE_DEFAULT, "Received PDS registration response: %@", (uint8_t *)&v23, 0xCu);
  }

  if ([v8 status])
  {
    id v10 = pds_defaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = [v8 status];
      int v23 = 134217984;
      uint64_t v24 = v11;
      _os_log_impl(&dword_221791000, v10, OS_LOG_TYPE_DEFAULT, "Bad response status: %ld", (uint8_t *)&v23, 0xCu);
    }

    switch([v8 status])
    {
      case 6001:
        v12 = pds_defaultLog();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
          break;
        }
        LOWORD(v23) = 0;
        v13 = "FTResponseActionDoNotRetry: Not retrying request";
        goto LABEL_18;
      case 6002:
        v12 = pds_defaultLog();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
          break;
        }
        LOWORD(v23) = 0;
        v13 = "FTResponseActionRetryWithDelay";
        goto LABEL_18;
      case 6005:
        v12 = pds_defaultLog();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
          break;
        }
        LOWORD(v23) = 0;
        v13 = "FTResponseActionRefreshCredentials";
LABEL_18:
        id v19 = v12;
        uint32_t v20 = 2;
        goto LABEL_21;
      case 6009:
        id v22 = pds_defaultLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          _os_log_impl(&dword_221791000, v22, OS_LOG_TYPE_DEFAULT, "FTResponseActionPermanentFailure: Permanently disabling", (uint8_t *)&v23, 2u);
        }

        self->_disabled = 1;
        goto LABEL_23;
      default:
        v12 = pds_defaultLog();
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
          break;
        }
        uint64_t v21 = [v8 status];
        int v23 = 134217984;
        uint64_t v24 = v21;
        v13 = "Unhandled response status: %ld";
        id v19 = v12;
        uint32_t v20 = 12;
LABEL_21:
        _os_log_impl(&dword_221791000, v19, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v23, v20);
        break;
    }
  }
  else
  {
    uint64_t v14 = [v8 ttl];
    v15 = [(PDSCoordinator *)self serverBag];
    uint64_t v16 = [v15 ttlFromBag];

    if (v14 > v16)
    {
      id v17 = [(PDSCoordinator *)self serverBag];
      [v17 ttlFromBag];

      id v18 = pds_defaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[PDSCoordinator requestQueue:processedRequest:withResponse:](v8, self, v18);
      }
    }
    [(PDSCoordinator *)self _updateEntriesForResponse:v8 fromRequest:v7];
    v12 = [(PDSCoordinator *)self heartbeatTracker];
    -[NSObject noteUpdatedHeartbeatTTL:](v12, "noteUpdatedHeartbeatTTL:", (double)[v8 ttl]);
  }

LABEL_23:
}

- (int64_t)ttlForRequest:(id)a3
{
  objc_super v3 = [(PDSCoordinator *)self serverBag];
  int64_t v4 = [v3 ttlFromBag];

  return v4;
}

- (void)_processEntryStore
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_221791000, log, OS_LOG_TYPE_FAULT, "Fault! Registering with unkown reason (neither heartbeat or state change)", v1, 2u);
}

- (void)_updateEntriesForResponse:(id)a3 fromRequest:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PDSCoordinator *)self entryStoreBlock];
  v9 = v8[2]();

  if (v9)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v10 = [v7 entries];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v30 = v7;
      uint64_t v13 = *(void *)v34;
      id v31 = v6;
      id obj = v10;
      while (1)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v34 != v13) {
            objc_enumerationMutation(obj);
          }
          v15 = *(void **)(*((void *)&v33 + 1) + 8 * v14);
          uint64_t v16 = objc_msgSend(v15, "user", v30);
          id v17 = [v6 statusByUser];
          id v18 = [v17 objectForKey:v16];

          if (!v18)
          {
            uint64_t v21 = pds_defaultLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v16;
              id v22 = v21;
              int v23 = "User status not included in response: user: %@";
              uint32_t v24 = 12;
LABEL_13:
              _os_log_impl(&dword_221791000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
            }
LABEL_14:

            goto LABEL_15;
          }
          uint64_t v19 = [v18 integerValue];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = pds_defaultLog();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v39 = v16;
              __int16 v40 = 2048;
              uint64_t v41 = v20;
              id v22 = v21;
              int v23 = "Bad user status: user: %@ status: %ld";
              uint32_t v24 = 22;
              goto LABEL_13;
            }
            goto LABEL_14;
          }
          if ([(PDSCoordinator *)self _matchingEntryExistsFor:v15 inStore:v9])
          {
            [(PDSCoordinator *)self _updateOrDeleteEntry:v15 inStore:v9];
          }
          else
          {
            uint64_t v25 = pds_defaultLog();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v15;
              _os_log_impl(&dword_221791000, v25, OS_LOG_TYPE_DEFAULT, "State has changed mid-update for entry: %@", buf, 0xCu);
            }

            v26 = [v15 registration];
            v27 = [v26 topicString];
            v37 = v27;
            v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];
            [(PDSCoordinator *)self entryStore:v9 didUpdatePendingTopics:v28 forceImmediateUpdate:1];

            id v6 = v31;
          }
LABEL_15:

          ++v14;
        }
        while (v12 != v14);
        id v10 = obj;
        uint64_t v29 = [obj countByEnumeratingWithState:&v33 objects:v42 count:16];
        uint64_t v12 = v29;
        if (!v29)
        {
          id v7 = v30;
          break;
        }
      }
    }
  }
  else
  {
    id v10 = pds_defaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221791000, v10, OS_LOG_TYPE_DEFAULT, "EntryStore is nil! aborting", buf, 2u);
    }
  }
}

- (void)_updateOrDeleteEntry:(id)a3 inStore:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 clientID];
  int v8 = [v5 state];
  v9 = [v5 user];
  if (v8 == 2)
  {
    id v14 = 0;
    char v13 = [v6 deleteEntry:v5 withError:&v14];
    id v11 = v14;
    if ((v13 & 1) == 0)
    {
      uint64_t v12 = pds_defaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
        goto LABEL_9;
      }
LABEL_10:
    }
LABEL_11:

    goto LABEL_12;
  }
  if (v8 == 1)
  {
    id v15 = 0;
    char v10 = [v6 updateEntryState:3 forUser:v9 clientID:v7 withError:&v15];
    id v11 = v15;
    if ((v10 & 1) == 0)
    {
      uint64_t v12 = pds_defaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v17 = v11;
LABEL_9:
        _os_log_impl(&dword_221791000, v12, OS_LOG_TYPE_DEFAULT, "Error updating entry: %@", buf, 0xCu);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    goto LABEL_11;
  }
LABEL_12:
}

- (BOOL)_entries:(id)a3 includeState:(unsigned __int8)a4
{
  int v4 = a4;
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = a3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "state", (void)v12) == v4)
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (unint64_t)_lastRequestHash
{
  v2 = [(PDSCoordinator *)self kvStoreBlock];
  objc_super v3 = v2[2]();

  int v4 = [v3 numberForKey:@"kPDSLastRequestHash"];
  unint64_t v5 = [v4 unsignedLongValue];

  return v5;
}

- (void)_markLastRequest:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PDSCoordinator *)self kvStoreBlock];
  v5[2]();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = NSNumber;
  uint64_t v7 = [v4 hash];

  uint64_t v8 = [v6 numberWithUnsignedInteger:v7];
  [v9 setNumber:v8 forKey:@"kPDSLastRequestHash"];
}

- (BOOL)_requestMatchesPreviousRequest:(id)a3
{
  uint64_t v4 = [a3 hash];
  return [(PDSCoordinator *)self _lastRequestHash] == v4;
}

- (BOOL)_matchingEntryExistsFor:(id)a3 inStore:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 user];
  uint64_t v8 = [v5 clientID];
  [v6 entriesForUser:v7 withClientID:v8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        if (objc_msgSend(v5, "isEqualToEntry:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          LOBYTE(v10) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v10;
}

- (double)_timeToDelayRequestForTopics:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PDSCoordinator *)self serverBag];
  [v5 coalesceDelayFromBag];
  double v7 = v6;

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * v12);
        long long v14 = [(PDSCoordinator *)self serverBag];
        LOBYTE(v13) = [v14 topicAvoidsCoalescing:v13];

        if (v13)
        {
          double v7 = 0.0;
          uint64_t v21 = v8;
          goto LABEL_18;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v31 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  if (self->_pendingRequestDate)
  {
    long long v15 = [(PDSCoordinator *)self serverBag];
    [v15 coalesceMaxPeriodFromBag];
    double v17 = v16;

    uint64_t v18 = [MEMORY[0x263EFF910] now];
    [v18 timeIntervalSinceDate:self->_pendingRequestDate];
    double v20 = v19;

    if (v7 + v20 > v17)
    {
      if (v20 <= v17) {
        double v7 = v17 - v20;
      }
      else {
        double v7 = 0.0;
      }
    }
  }
  else
  {
    id v22 = [MEMORY[0x263EFF910] now];
    pendingRequestDate = self->_pendingRequestDate;
    self->_pendingRequestDate = v22;
  }
  uint64_t v21 = pds_defaultLog();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v30 = v7;
    _os_log_impl(&dword_221791000, v21, OS_LOG_TYPE_DEFAULT, "Delay register by: %f for coalescing", buf, 0xCu);
  }
LABEL_18:

  return v7;
}

- (void)_bagReloaded:(id)a3
{
  id v4 = pds_defaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221791000, v4, OS_LOG_TYPE_DEFAULT, "Received bag loaded notification -- attempting registration", buf, 2u);
  }

  id v5 = [(PDSCoordinator *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31__PDSCoordinator__bagReloaded___block_invoke;
  block[3] = &unk_2645C8BE0;
  block[4] = self;
  dispatch_async(v5, block);
}

uint64_t __31__PDSCoordinator__bagReloaded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerIfNeeded];
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  objc_super v3 = pds_defaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221791000, v3, OS_LOG_TYPE_DEFAULT, "Left first data protection lock -- attempting registration", buf, 2u);
  }

  id v4 = [(PDSCoordinator *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__PDSCoordinator_systemDidLeaveFirstDataProtectionLock__block_invoke;
  block[3] = &unk_2645C8BE0;
  block[4] = self;
  dispatch_async(v4, block);
}

uint64_t __55__PDSCoordinator_systemDidLeaveFirstDataProtectionLock__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) registerIfNeeded];
}

- (BOOL)_disabledForAnyReason
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->_disabled)
  {
    v2 = pds_defaultLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      objc_super v3 = "PDS has been disabled by a PermanentFailure server response";
LABEL_7:
      _os_log_impl(&dword_221791000, v2, OS_LOG_TYPE_DEFAULT, v3, (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    id v5 = [(PDSCoordinator *)self serverBag];
    int v6 = [v5 bagKillSwitchActive];

    if (v6)
    {
      v2 = pds_defaultLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        objc_super v3 = "PDS has been disabled by the kill switch";
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v8 = PDSProtocolVersionNumber();
      uint64_t v9 = [v8 longLongValue];
      uint64_t v10 = [(PDSCoordinator *)self serverBag];
      uint64_t v11 = [v10 minEnabledVersion];
      uint64_t v12 = [v11 longLongValue];

      if (v9 >= v12) {
        return 0;
      }
      v2 = pds_defaultLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = PDSProtocolVersionNumber();
        long long v14 = [(PDSCoordinator *)self serverBag];
        long long v15 = [v14 minEnabledVersion];
        int v16 = 138412546;
        double v17 = v13;
        __int16 v18 = 2112;
        double v19 = v15;
        _os_log_impl(&dword_221791000, v2, OS_LOG_TYPE_DEFAULT, "PDS has been disabled because the protocol version %@ is lower than the min enabled version %@", (uint8_t *)&v16, 0x16u);
      }
    }
  }

  return 1;
}

- (void)handler:(id)a3 pushTokenChanged:(id)a4
{
  if (objc_msgSend(a4, "length", a3))
  {
    id v5 = pds_defaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_221791000, v5, OS_LOG_TYPE_DEFAULT, "Notified of push-token change.  Forcing reregister.", v6, 2u);
    }

    [(PDSCoordinator *)self registerIfNeeded];
  }
}

- (void)_comparePushTokensWithEntryStore:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PDSCoordinator *)self pushTokenBlock];
  int v6 = v5[2](v5, *MEMORY[0x263F280D0]);

  double v7 = [(PDSCoordinator *)self pushTokenBlock];
  uint64_t v8 = v7[2](v7, *MEMORY[0x263F280C8]);

  uint64_t v9 = objc_msgSend(v6, "__imHexString");
  uint64_t v10 = [v9 length];

  if (v10)
  {
    if ([(PDSCoordinator *)self _lastPushTokenDiffersFrom:v6])
    {
      uint32_t v11 = arc4random_uniform(0x64u);
      if ([MEMORY[0x263F4A1E0] isSupported] && v11 <= 9)
      {
        uint64_t v12 = [NSString stringWithFormat:@"Production push token has changed!"];
        uint64_t v13 = (void *)MEMORY[0x263F4A1E0];
        v20[0] = MEMORY[0x263EF8330];
        v20[1] = 3221225472;
        v20[2] = __51__PDSCoordinator__comparePushTokensWithEntryStore___block_invoke;
        v20[3] = &unk_2645C8C08;
        id v21 = v12;
        id v14 = v12;
        [v13 triggerCaptureWithEvent:206 context:v14 completion:v20];
      }
      long long v15 = pds_defaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = [v6 debugDescription];
        *(_DWORD *)buf = 138412290;
        int v23 = v16;
        _os_log_impl(&dword_221791000, v15, OS_LOG_TYPE_DEFAULT, "Production push token has changed! New token: %@", buf, 0xCu);
      }
      [(PDSCoordinator *)self _pushTokenChangedWithEntryStore:v4];
      [(PDSCoordinator *)self _markPushToken:v6];
      [(PDSCoordinator *)self setTokenChanged:1];
    }
    if ([(PDSCoordinator *)self _lastSandboxPushTokenDiffersFrom:v8])
    {
      double v17 = pds_defaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = [v8 debugDescription];
        *(_DWORD *)buf = 138412290;
        int v23 = v18;
        _os_log_impl(&dword_221791000, v17, OS_LOG_TYPE_DEFAULT, "Sandbox push token has changed! New token: %@", buf, 0xCu);
      }
      [(PDSCoordinator *)self _pushTokenChangedWithEntryStore:v4];
      [(PDSCoordinator *)self _markSandboxPushToken:v8];
      [(PDSCoordinator *)self setTokenChanged:1];
    }
  }
  else
  {
    double v19 = pds_defaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221791000, v19, OS_LOG_TYPE_DEFAULT, "Missing push token! aborting", buf, 2u);
    }
  }
}

void __51__PDSCoordinator__comparePushTokensWithEntryStore___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  double v7 = pds_defaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138412802;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_221791000, v7, OS_LOG_TYPE_DEFAULT, "Finished capturing AutoBugCapture diagnostics for push token change { context: %@, sessionID: %@, error: %@ }", (uint8_t *)&v9, 0x20u);
  }
}

- (BOOL)_lastPushTokenDiffersFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PDSCoordinator *)self kvStoreBlock];
  id v6 = v5[2]();

  double v7 = [v6 dataForKey:@"kPDSLastPushToken"];
  uint64_t v8 = pds_defaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v7 debugDescription];
    int v12 = 138412290;
    __int16 v13 = v9;
    _os_log_impl(&dword_221791000, v8, OS_LOG_TYPE_DEFAULT, "Last push token: %@", (uint8_t *)&v12, 0xCu);
  }
  char v10 = [v7 isEqualToData:v4];

  return v10 ^ 1;
}

- (BOOL)_lastSandboxPushTokenDiffersFrom:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(PDSCoordinator *)self kvStoreBlock];
  id v6 = v5[2]();

  uint64_t v7 = [v6 dataForKey:@"kPDSLastSandboxPushToken"];
  uint64_t v8 = pds_defaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [(id)v7 debugDescription];
    int v12 = 138412290;
    __int16 v13 = v9;
    _os_log_impl(&dword_221791000, v8, OS_LOG_TYPE_DEFAULT, "Last sandbox push token: %@", (uint8_t *)&v12, 0xCu);
  }
  if (v4 | v7) {
    int v10 = [(id)v7 isEqualToData:v4] ^ 1;
  }
  else {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)_markPushToken:(id)a3
{
  id v4 = a3;
  id v5 = [(PDSCoordinator *)self kvStoreBlock];
  v5[2]();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [v6 setData:v4 forKey:@"kPDSLastPushToken"];
}

- (void)_markSandboxPushToken:(id)a3
{
  id v4 = a3;
  id v5 = [(PDSCoordinator *)self kvStoreBlock];
  v5[2]();
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [v6 setData:v4 forKey:@"kPDSLastSandboxPushToken"];
}

- (void)_pushTokenChangedWithEntryStore:(id)a3
{
}

- (void)_updateAllHeartbeatEntriesWithState:(unsigned __int8)a3 inEntryStore:(id)a4
{
}

- (BOOL)shouldScheduleHeartbeatForTracker:(id)a3
{
  objc_super v3 = [(PDSCoordinator *)self entryStoreBlock];
  id v4 = v3[2]();

  if (v4)
  {
    char v5 = [v4 hasActiveEntries];
  }
  else
  {
    id v6 = pds_defaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_221791000, v6, OS_LOG_TYPE_DEFAULT, "EntryStore is nil! aborting", v8, 2u);
    }

    char v5 = 0;
  }

  return v5;
}

- (CUTDeferredTaskQueue)processDeferredTaskQueue
{
  processDeferredTaskQueue = self->_processDeferredTaskQueue;
  if (!processDeferredTaskQueue)
  {
    id v4 = (CUTDeferredTaskQueue *)[objc_alloc(MEMORY[0x263F33218]) initWithCapacity:1 queue:self->_queue block:&__block_literal_global];
    char v5 = self->_processDeferredTaskQueue;
    self->_processDeferredTaskQueue = v4;

    processDeferredTaskQueue = self->_processDeferredTaskQueue;
  }
  return processDeferredTaskQueue;
}

uint64_t __42__PDSCoordinator_processDeferredTaskQueue__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _processEntryStore];
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDate)pendingRequestDate
{
  return self->_pendingRequestDate;
}

- (void)setPendingRequestDate:(id)a3
{
}

- (IDSServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (void)setProcessDeferredTaskQueue:(id)a3
{
}

- (id)kvStoreBlock
{
  return self->_kvStoreBlock;
}

- (void)setKvStoreBlock:(id)a3
{
}

- (id)entryStoreBlock
{
  return self->_entryStoreBlock;
}

- (void)setEntryStoreBlock:(id)a3
{
}

- (IDSPushHandler)pushHandler
{
  return self->_pushHandler;
}

- (void)setPushHandler:(id)a3
{
}

- (id)pushTokenBlock
{
  return self->_pushTokenBlock;
}

- (void)setPushTokenBlock:(id)a3
{
}

- (PDSRequestQueue)requestQueue
{
  return self->_requestQueue;
}

- (void)setRequestQueue:(id)a3
{
}

- (BOOL)requestPending
{
  return self->_requestPending;
}

- (void)setRequestPending:(BOOL)a3
{
  self->_requestPending = a3;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)tokenChanged
{
  return self->_tokenChanged;
}

- (void)setTokenChanged:(BOOL)a3
{
  self->_tokenChanged = a3;
}

- (int64_t)bagLoadRetries
{
  return self->_bagLoadRetries;
}

- (void)setBagLoadRetries:(int64_t)a3
{
  self->_bagLoadRetries = a3;
}

- (PDSHeartbeatTracker)heartbeatTracker
{
  return self->_heartbeatTracker;
}

- (void)setHeartbeatTracker:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartbeatTracker, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong(&self->_pushTokenBlock, 0);
  objc_storeStrong((id *)&self->_pushHandler, 0);
  objc_storeStrong(&self->_entryStoreBlock, 0);
  objc_storeStrong(&self->_kvStoreBlock, 0);
  objc_storeStrong((id *)&self->_processDeferredTaskQueue, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_pendingRequestDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)requestQueue:(void *)a1 processedRequest:(void *)a2 withResponse:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 ttl];
  id v6 = [a2 serverBag];
  int v7 = 134218240;
  uint64_t v8 = v5;
  __int16 v9 = 2048;
  uint64_t v10 = [v6 ttlFromBag];
  _os_log_error_impl(&dword_221791000, a3, OS_LOG_TYPE_ERROR, "PDS TTL response exceeded bag value (%ld > %ld). Using Bag value as TTL", (uint8_t *)&v7, 0x16u);
}

@end