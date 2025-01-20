@interface VCCompanionSyncService
- (BOOL)isRunningOnWatch;
- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5;
- (NSSet)currentDataHandlers;
- (OS_dispatch_queue)queue;
- (SYService)service;
- (VCCompanionSyncService)initWithSyncDataEndpoint:(id)a3;
- (VCCompanionSyncServiceDelegate)delegate;
- (VCCompanionSyncSession)currentSession;
- (VCNRDeviceSyncService)currentSyncService;
- (VCSyncDataEndpoint)syncDataEndpoint;
- (WFDebouncer)debouncer;
- (void)companionSyncSession:(id)a3 didFinishWithError:(id)a4;
- (void)companionSyncSession:(id)a3 didUpdateProgress:(double)a4;
- (void)companionSyncSessionDidFinishSendingChanges:(id)a3;
- (void)configureReasonForUnderlyingSession:(id)a3 withSession:(id)a4;
- (void)dealloc;
- (void)requestFullResync;
- (void)requestSync;
- (void)requestSyncImmediately;
- (void)resetSession;
- (void)resumeServiceIfNecessary;
- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5;
- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5;
- (void)setCurrentDataHandlers:(id)a3;
- (void)setCurrentSession:(id)a3;
- (void)setCurrentSyncService:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updateCurrentSyncServiceIfNecessary;
- (void)updateSyncDataHandlers;
@end

@implementation VCCompanionSyncService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSyncService, 0);
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_currentDataHandlers, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
  objc_storeStrong((id *)&self->_syncDataEndpoint, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (VCNRDeviceSyncService)currentSyncService
{
  return self->_currentSyncService;
}

- (void)setCurrentSession:(id)a3
{
}

- (VCCompanionSyncSession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentDataHandlers:(id)a3
{
}

- (NSSet)currentDataHandlers
{
  return self->_currentDataHandlers;
}

- (WFDebouncer)debouncer
{
  return self->_debouncer;
}

- (VCSyncDataEndpoint)syncDataEndpoint
{
  return self->_syncDataEndpoint;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SYService)service
{
  return self->_service;
}

- (void)setDelegate:(id)a3
{
}

- (VCCompanionSyncServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VCCompanionSyncServiceDelegate *)WeakRetained;
}

- (void)companionSyncSession:(id)a3 didUpdateProgress:(double)a4
{
  id v6 = a3;
  id v7 = [(VCCompanionSyncService *)self delegate];
  [v7 companionSyncService:self outgoingSyncSession:v6 didUpdateProgress:a4];
}

- (void)companionSyncSessionDidFinishSendingChanges:(id)a3
{
  id v4 = a3;
  id v5 = [(VCCompanionSyncService *)self delegate];
  [v5 companionSyncService:self outgoingSyncSessionDidFinishSendingChanges:v4];
}

- (void)companionSyncSession:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(id)objc_opt_class() direction];
  v9 = @"Outgoing";
  if (v8 == 1) {
    v9 = @"Incoming";
  }
  v10 = v9;
  v11 = getWFWatchSyncLogObject();
  v12 = v11;
  if (v7)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v24 = "-[VCCompanionSyncService companionSyncSession:didFinishWithError:]";
      __int16 v25 = 2114;
      v26 = v10;
      __int16 v27 = 2114;
      id v28 = v6;
      __int16 v29 = 2114;
      id v30 = v7;
      v13 = "%s %{public}@ session=%{public}@ finished with error: %{public}@";
      v14 = v12;
      os_log_type_t v15 = OS_LOG_TYPE_ERROR;
      uint32_t v16 = 42;
LABEL_8:
      _os_log_impl(&dword_1C7D7E000, v14, v15, v13, buf, v16);
    }
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "-[VCCompanionSyncService companionSyncSession:didFinishWithError:]";
    __int16 v25 = 2114;
    v26 = v10;
    __int16 v27 = 2114;
    id v28 = v6;
    v13 = "%s %{public}@ session=%{public}@ finished successfully";
    v14 = v12;
    os_log_type_t v15 = OS_LOG_TYPE_DEBUG;
    uint32_t v16 = 32;
    goto LABEL_8;
  }

  v17 = [(VCCompanionSyncService *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VCCompanionSyncService_companionSyncSession_didFinishWithError___block_invoke;
  block[3] = &unk_1E65420A0;
  block[4] = self;
  id v21 = v6;
  id v22 = v7;
  id v18 = v7;
  id v19 = v6;
  dispatch_async(v17, block);
}

void __66__VCCompanionSyncService_companionSyncSession_didFinishWithError___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) resetSession];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 companionSyncService:*(void *)(a1 + 32) didFinishSyncSession:*(void *)(a1 + 40) withError:*(void *)(a1 + 48)];
}

- (void)service:(id)a3 didSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = getWFWatchSyncLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315650;
    v14 = "-[VCCompanionSyncService service:didSwitchFromPairingID:toPairingID:]";
    __int16 v15 = 2114;
    id v16 = v7;
    __int16 v17 = 2114;
    id v18 = v8;
    _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_INFO, "%s CompanionSync did switch from %{public}@ to %{public}@", (uint8_t *)&v13, 0x20u);
  }

  if (v8
    && ([MEMORY[0x1E4F79EF8] sharedInstance],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v10 deviceForPairingID:v8],
        v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        v11))
  {
    v12 = [[VCNRDeviceSyncService alloc] initWithCompanionSyncService:self device:v11];
    [(VCCompanionSyncService *)self setCurrentSyncService:v12];
  }
  else
  {
    [(VCCompanionSyncService *)self setCurrentSyncService:0];
  }
  [(VCCompanionSyncService *)self requestSyncImmediately];
}

- (void)service:(id)a3 willSwitchFromPairingID:(id)a4 toPairingID:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  v9 = getWFWatchSyncLogObject();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    v11 = "-[VCCompanionSyncService service:willSwitchFromPairingID:toPairingID:]";
    __int16 v12 = 2114;
    id v13 = v7;
    __int16 v14 = 2114;
    id v15 = v8;
    _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_INFO, "%s CompanionSync will switch from %{public}@ to %{public}@", (uint8_t *)&v10, 0x20u);
  }

  [(VCCompanionSyncService *)self resetSession];
}

- (void)service:(id)a3 encounteredError:(id)a4 context:(id)a5
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = getWFWatchSyncLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[VCCompanionSyncService service:encounteredError:context:]";
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_ERROR, "%s CompanionSync service encountered error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (BOOL)service:(id)a3 startSession:(id)a4 error:(id *)a5
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  [(VCCompanionSyncService *)self resetSession];
  int v9 = [(VCCompanionSyncService *)self isRunningOnWatch];
  if (v9 == [v8 isSending])
  {
    BOOL v20 = [(VCCompanionSyncService *)self isRunningOnWatch];
    uint64_t v11 = getWFWatchSyncLogObject();
    BOOL v21 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v21)
      {
        *(_DWORD *)buf = 136315138;
        v88 = "-[VCCompanionSyncService service:startSession:error:]";
        id v22 = "%s Ignoring sending session from watch; we have nothing to send";
LABEL_11:
        _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
      }
    }
    else if (v21)
    {
      *(_DWORD *)buf = 136315138;
      v88 = "-[VCCompanionSyncService service:startSession:error:]";
      id v22 = "%s Ignoring receiving session from phone; we have nothing to receive";
      goto LABEL_11;
    }
LABEL_18:
    BOOL v19 = 0;
    goto LABEL_19;
  }
  [(VCCompanionSyncService *)self updateCurrentSyncServiceIfNecessary];
  [(VCCompanionSyncService *)self updateSyncDataHandlers];
  uint64_t v10 = [(VCCompanionSyncService *)self currentSyncService];
  if (!v10)
  {
    v23 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v88 = "-[VCCompanionSyncService service:startSession:error:]";
      _os_log_impl(&dword_1C7D7E000, v23, OS_LOG_TYPE_FAULT, "%s Not starting sync because the target device is unknown", buf, 0xCu);
    }

    uint64_t v11 = 0;
    goto LABEL_18;
  }
  uint64_t v11 = v10;
  __int16 v12 = [(VCCompanionSyncService *)self delegate];
  char v13 = [v12 companionSyncServiceShouldStartSession:self];

  if ((v13 & 1) == 0)
  {
    v24 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      __int16 v25 = [(VCCompanionSyncService *)self delegate];
      *(_DWORD *)buf = 136315394;
      v88 = "-[VCCompanionSyncService service:startSession:error:]";
      __int16 v89 = 2114;
      uint64_t v90 = (uint64_t)v25;
      _os_log_impl(&dword_1C7D7E000, v24, OS_LOG_TYPE_INFO, "%s Not starting sync the %{public}@ returned NO", buf, 0x16u);
    }
    goto LABEL_18;
  }
  if (![(VCCompanionSyncService *)self isRunningOnWatch])
  {
    SEL v69 = a2;
    v70 = a5;
    id v71 = v8;
    v72 = self;
    if ([v8 isResetSync])
    {
      __int16 v27 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v88 = "-[VCCompanionSyncService service:startSession:error:]";
        __int16 v89 = 2114;
        uint64_t v90 = (uint64_t)v11;
        _os_log_impl(&dword_1C7D7E000, v27, OS_LOG_TYPE_DEFAULT, "%s Clearing sync state for service %{public}@", buf, 0x16u);
      }

      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v28 = [(VCCompanionSyncService *)self currentDataHandlers];
      uint64_t v29 = [v28 countByEnumeratingWithState:&v83 objects:v94 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v84;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v84 != v31) {
              objc_enumerationMutation(v28);
            }
            v33 = *(void **)(*((void *)&v83 + 1) + 8 * i);
            id v82 = 0;
            char v34 = [v33 resetSyncStateForService:v11 error:&v82];
            id v35 = v82;
            if ((v34 & 1) == 0)
            {
              v36 = getWFWatchSyncLogObject();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 136315394;
                v88 = "-[VCCompanionSyncService service:startSession:error:]";
                __int16 v89 = 2112;
                uint64_t v90 = (uint64_t)v35;
                _os_log_impl(&dword_1C7D7E000, v36, OS_LOG_TYPE_FAULT, "%s Error removing sync state: %@", buf, 0x16u);
              }
            }
          }
          uint64_t v30 = [v28 countByEnumeratingWithState:&v83 objects:v94 count:16];
        }
        while (v30);
      }
    }
    v74 = objc_opt_new();
    v75 = objc_opt_new();
    v73 = objc_opt_new();
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v37 = [(VCCompanionSyncService *)self currentDataHandlers];
    uint64_t v38 = [v37 countByEnumeratingWithState:&v78 objects:v93 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v79;
      do
      {
        uint64_t v41 = 0;
        do
        {
          if (*(void *)v79 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = *(void **)(*((void *)&v78 + 1) + 8 * v41);
          id v76 = 0;
          id v77 = 0;
          v43 = [v42 unsyncedChangesForSyncService:v11 metadata:&v77 error:&v76];
          id v44 = v77;
          id v45 = v76;
          v46 = v45;
          if (v44)
          {
            if ([MEMORY[0x1E4F28F98] propertyList:v44 isValidForFormat:200])
            {
              if (!v46) {
                goto LABEL_43;
              }
            }
            else
            {
              v51 = [MEMORY[0x1E4F28B00] currentHandler];
              [v51 handleFailureInMethod:v69 object:v72 file:@"VCCompanionSyncService.m" lineNumber:244 description:@"Metadata dictionary must be serializable to a property list file"];

              if (!v46)
              {
LABEL_43:
                v47 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend((id)objc_opt_class(), "messageType"));
                [v74 setObject:v44 forKey:v47];

LABEL_48:
                if (v43) {
                  [v73 addObjectsFromArray:v43];
                }
                goto LABEL_50;
              }
            }
          }
          else if (!v45)
          {
            goto LABEL_48;
          }
          v48 = getWFWatchSyncLogObject();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
          {
            v49 = (objc_class *)objc_opt_class();
            v50 = NSStringFromClass(v49);
            *(_DWORD *)buf = 136315650;
            v88 = "-[VCCompanionSyncService service:startSession:error:]";
            __int16 v89 = 2114;
            uint64_t v90 = (uint64_t)v50;
            __int16 v91 = 2112;
            v92 = v46;
            _os_log_impl(&dword_1C7D7E000, v48, OS_LOG_TYPE_FAULT, "%s Error getting unsynced changes from %{public}@: %@", buf, 0x20u);
          }
          [v75 addObject:v46];
LABEL_50:

          ++v41;
        }
        while (v39 != v41);
        uint64_t v52 = [v37 countByEnumeratingWithState:&v78 objects:v93 count:16];
        uint64_t v39 = v52;
      }
      while (v52);
    }

    uint64_t v53 = [v73 count];
    BOOL v19 = v53 != 0;
    if (v53)
    {
      v54 = getWFWatchSyncLogObject();
      id v8 = v71;
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v55 = [v73 count];
        *(_DWORD *)buf = 136315394;
        v88 = "-[VCCompanionSyncService service:startSession:error:]";
        __int16 v89 = 2048;
        uint64_t v90 = v55;
        _os_log_impl(&dword_1C7D7E000, v54, OS_LOG_TYPE_DEFAULT, "%s Got %lu changes to send", buf, 0x16u);
      }

      v56 = [VCCompanionSyncOutgoingSession alloc];
      v57 = [(VCCompanionSyncService *)v72 currentDataHandlers];
      v58 = v74;
      v59 = [(VCCompanionSyncOutgoingSession *)v56 initWithSYSession:v71 service:v11 syncDataHandlers:v57 changeSet:v73 metadata:v74];
      [(VCCompanionSyncService *)v72 setCurrentSession:v59];

      v60 = [(VCCompanionSyncService *)v72 currentSession];
      [v60 setDelegate:v72];

      id v61 = [(VCCompanionSyncService *)v72 currentSession];
      [(VCCompanionSyncService *)v72 configureReasonForUnderlyingSession:v71 withSession:v61];
LABEL_67:

      goto LABEL_19;
    }
    id v61 = [v75 firstObject];
    v62 = getWFWatchSyncLogObject();
    v63 = v62;
    id v8 = v71;
    if (v61)
    {
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_FAULT)) {
        goto LABEL_65;
      }
      *(_DWORD *)buf = 136315394;
      v88 = "-[VCCompanionSyncService service:startSession:error:]";
      __int16 v89 = 2112;
      uint64_t v90 = (uint64_t)v61;
      v64 = "%s Error getting any changes to sync: %@";
      v65 = v63;
      os_log_type_t v66 = OS_LOG_TYPE_FAULT;
      uint32_t v67 = 22;
    }
    else
    {
      if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_65;
      }
      *(_DWORD *)buf = 136315138;
      v88 = "-[VCCompanionSyncService service:startSession:error:]";
      v64 = "%s No changes to sync";
      v65 = v63;
      os_log_type_t v66 = OS_LOG_TYPE_DEFAULT;
      uint32_t v67 = 12;
    }
    _os_log_impl(&dword_1C7D7E000, v65, v66, v64, buf, v67);
LABEL_65:

    v68 = [(VCCompanionSyncService *)v72 delegate];
    [v68 companionSyncService:v72 didRejectSessionWithError:v61];

    v58 = v74;
    if (v70)
    {
      id v61 = v61;
      id *v70 = v61;
    }
    goto LABEL_67;
  }
  __int16 v14 = [VCCompanionSyncIncomingSession alloc];
  id v15 = [(VCCompanionSyncService *)self currentDataHandlers];
  uint64_t v16 = [(VCCompanionSyncSession *)v14 initWithSYSession:v8 service:v11 syncDataHandlers:v15];
  [(VCCompanionSyncService *)self setCurrentSession:v16];

  __int16 v17 = [(VCCompanionSyncService *)self currentSession];
  [v17 setDelegate:self];

  id v18 = [(VCCompanionSyncService *)self currentSession];
  [(VCCompanionSyncService *)self configureReasonForUnderlyingSession:v8 withSession:v18];

  BOOL v19 = 1;
LABEL_19:

  return v19;
}

- (void)configureReasonForUnderlyingSession:(id)a3 withSession:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  int v7 = [(VCCompanionSyncService *)self delegate];
  uint64_t v8 = [v7 companionSyncService:self typeForSession:v6];

  if (v8 == 1)
  {
    int v9 = (void *)MEMORY[0x1E4F59EB0];
  }
  else
  {
    if (v8 != 2) {
      goto LABEL_6;
    }
    int v9 = (void *)MEMORY[0x1E4F59EB8];
  }
  [v10 setReason:*v9];
LABEL_6:
}

- (void)setCurrentSyncService:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  p_currentSyncService = &self->_currentSyncService;
  BOOL v7 = [(VCNRDeviceSyncService *)self->_currentSyncService isEqual:v5];
  if (!v7 && *p_currentSyncService)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v8 = [(VCCompanionSyncService *)self currentDataHandlers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * i) deregisterSyncService:*p_currentSyncService];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v10);
    }
  }
  objc_storeStrong((id *)&self->_currentSyncService, a3);
  if (v5) {
    char v13 = v7;
  }
  else {
    char v13 = 1;
  }
  if ((v13 & 1) == 0)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    __int16 v14 = [(VCCompanionSyncService *)self currentDataHandlers];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * j) registerSyncService:v5];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }
  }
}

- (void)updateCurrentSyncServiceIfNecessary
{
  v3 = [(VCCompanionSyncService *)self currentSyncService];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F79EF8] sharedInstance];
    id v6 = [v4 getActivePairedDevice];

    if (v6)
    {
      id v5 = [[VCNRDeviceSyncService alloc] initWithCompanionSyncService:self device:v6];
      [(VCCompanionSyncService *)self setCurrentSyncService:v5];
    }
  }
}

- (void)updateSyncDataHandlers
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(VCCompanionSyncService *)self currentDataHandlers];
  id v4 = [(VCCompanionSyncService *)self syncDataEndpoint];
  id v5 = [v4 syncDataHandlers];

  id v6 = [(VCCompanionSyncService *)self currentSyncService];
  if (v6)
  {
    BOOL v7 = (void *)[v5 mutableCopy];
    [v7 minusSet:v3];
    uint64_t v8 = (void *)[v3 mutableCopy];
    [v8 minusSet:v5];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v23 + 1) + 8 * v13++) registerSyncService:v6];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v11);
    }

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v14 = v8;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v20;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * v18++), "deregisterSyncService:", v6, (void)v19);
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v16);
    }
  }
  -[VCCompanionSyncService setCurrentDataHandlers:](self, "setCurrentDataHandlers:", v5, (void)v19);
}

- (void)resetSession
{
  v3 = [(VCCompanionSyncService *)self currentSession];
  [v3 setDelegate:0];

  [(VCCompanionSyncService *)self setCurrentSession:0];
}

- (void)requestFullResync
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = getWFWatchSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[VCCompanionSyncService requestFullResync]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_DEBUG, "%s Requesting a full resync", (uint8_t *)&v5, 0xCu);
  }

  [(VCCompanionSyncService *)self resumeServiceIfNecessary];
  id v4 = [(VCCompanionSyncService *)self service];
  [v4 setNeedsResetSync];
}

- (void)requestSyncImmediately
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = getWFWatchSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    id v6 = "-[VCCompanionSyncService requestSyncImmediately]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_DEBUG, "%s Requesting a sync", (uint8_t *)&v5, 0xCu);
  }

  [(VCCompanionSyncService *)self resumeServiceIfNecessary];
  id v4 = [(VCCompanionSyncService *)self service];
  [v4 setHasChangesAvailable];
}

- (void)resumeServiceIfNecessary
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = [(VCCompanionSyncService *)self service];
  id v13 = 0;
  int v3 = [v2 resume:&v13];
  id v4 = v13;

  int v5 = [v4 domain];
  if ([v5 isEqualToString:*MEMORY[0x1E4F59EA0]])
  {
    uint64_t v6 = [v4 code];

    if (v6 == 2002)
    {
      uint64_t v7 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v15 = "-[VCCompanionSyncService resumeServiceIfNecessary]";
        uint64_t v8 = "%s SYService is already running";
LABEL_9:
        uint64_t v10 = v7;
        os_log_type_t v11 = OS_LOG_TYPE_INFO;
        uint32_t v12 = 12;
LABEL_12:
        _os_log_impl(&dword_1C7D7E000, v10, v11, v8, buf, v12);
        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
  else
  {
  }
  id v9 = getWFWatchSyncLogObject();
  uint64_t v7 = v9;
  if (v3)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v15 = "-[VCCompanionSyncService resumeServiceIfNecessary]";
      uint64_t v8 = "%s Successfully resumed SYService";
      goto LABEL_9;
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[VCCompanionSyncService resumeServiceIfNecessary]";
    __int16 v16 = 2114;
    id v17 = v4;
    uint64_t v8 = "%s Error resuming SYService: %{public}@";
    uint64_t v10 = v7;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 22;
    goto LABEL_12;
  }
LABEL_13:
}

- (void)requestSync
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = getWFWatchSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    uint64_t v6 = "-[VCCompanionSyncService requestSync]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_DEBUG, "%s Poking the debouncer to request a sync", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [(VCCompanionSyncService *)self debouncer];
  [v4 poke];
}

- (BOOL)isRunningOnWatch
{
  return 0;
}

- (void)dealloc
{
  int v3 = [(VCCompanionSyncService *)self service];
  [v3 suspend];

  [(VCCompanionSyncService *)self setCurrentSyncService:0];
  v4.receiver = self;
  v4.super_class = (Class)VCCompanionSyncService;
  [(VCCompanionSyncService *)&v4 dealloc];
}

- (VCCompanionSyncService)initWithSyncDataEndpoint:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)VCCompanionSyncService;
  uint64_t v6 = [(VCCompanionSyncService *)&v25 init];
  if (v6)
  {
    if (objc_opt_class())
    {
      if (objc_opt_class())
      {
        uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        uint64_t v8 = dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);

        dispatch_queue_t v9 = dispatch_queue_create("com.apple.shortcuts.VCCompanionSyncService", v8);
        queue = v6->_queue;
        v6->_queue = (OS_dispatch_queue *)v9;

        objc_storeStrong((id *)&v6->_syncDataEndpoint, a3);
        uint64_t v11 = [v5 syncDataHandlers];
        currentDataHandlers = v6->_currentDataHandlers;
        v6->_currentDataHandlers = (NSSet *)v11;

        uint64_t v13 = [objc_alloc(MEMORY[0x1E4FB71B8]) initWithDelay:v6->_queue maximumDelay:2.0 queue:10.0];
        debouncer = v6->_debouncer;
        v6->_debouncer = (WFDebouncer *)v13;

        [(WFDebouncer *)v6->_debouncer addTarget:v6 action:sel_requestSyncImmediately];
        uint64_t v26 = *MEMORY[0x1E4F59EA8];
        __int16 v27 = &unk_1F22707A8;
        uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F59E98]), "initWithService:priority:asMasterStore:options:", @"com.apple.private.alloy.siri.voiceshortcuts", 0, -[VCCompanionSyncService isRunningOnWatch](v6, "isRunningOnWatch") ^ 1, v15);
        service = v6->_service;
        v6->_service = (SYService *)v16;

        [(SYService *)v6->_service setDelegate:v6 queue:v6->_queue];
        [(VCCompanionSyncService *)v6 resumeServiceIfNecessary];
        uint64_t v18 = v6->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __51__VCCompanionSyncService_initWithSyncDataEndpoint___block_invoke;
        block[3] = &unk_1E65420F0;
        long long v19 = v6;
        long long v24 = v19;
        dispatch_async(v18, block);
        long long v20 = v19;

LABEL_12:
        goto LABEL_13;
      }
      uint64_t v8 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v29 = "-[VCCompanionSyncService initWithSyncDataEndpoint:]";
        long long v21 = "%s The NanoRegistry framework is not present on this device";
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v8 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v29 = "-[VCCompanionSyncService initWithSyncDataEndpoint:]";
        long long v21 = "%s The CompanionSync framework is not present on this device";
LABEL_10:
        _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_INFO, v21, buf, 0xCu);
      }
    }
    long long v20 = 0;
    goto LABEL_12;
  }
  long long v20 = 0;
LABEL_13:

  return v20;
}

uint64_t __51__VCCompanionSyncService_initWithSyncDataEndpoint___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateCurrentSyncServiceIfNecessary];
}

@end