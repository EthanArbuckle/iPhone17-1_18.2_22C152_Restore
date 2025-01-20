@interface VCWatchSyncCoordinator
- (BOOL)companionSyncServiceShouldStartSession:(id)a3;
- (NSMutableSet)startedSessions;
- (OS_dispatch_queue)queue;
- (PSYSyncCoordinator)pairedSyncCoordinator;
- (SwiftVCDaemonXPCEventHandler)eventHandler;
- (VCCompanionSyncService)service;
- (VCSyncDataEndpoint)syncDataEndpoint;
- (VCWatchSyncCoordinator)initWithSyncDataEndpoint:(id)a3 eventHandler:(id)a4;
- (int64_t)companionSyncService:(id)a3 typeForSession:(id)a4;
- (void)companionSyncService:(id)a3 didFinishSyncSession:(id)a4 withError:(id)a5;
- (void)companionSyncService:(id)a3 didRejectSessionWithError:(id)a4;
- (void)companionSyncService:(id)a3 outgoingSyncSession:(id)a4 didUpdateProgress:(double)a5;
- (void)companionSyncService:(id)a3 outgoingSyncSessionDidFinishSendingChanges:(id)a4;
- (void)dealloc;
- (void)handleDeviceDidChangeVersionNotification;
- (void)handleDidUnpairNotification:(id)a3;
- (void)requestSyncIfUnrestricted;
- (void)startObservingWatchChangeNotifications;
- (void)stopObservingWatchChangeNotifications;
- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4;
- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4;
- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3;
@end

@implementation VCWatchSyncCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_syncDataEndpoint, 0);
  objc_storeStrong((id *)&self->_startedSessions, 0);
  objc_storeStrong((id *)&self->_pairedSyncCoordinator, 0);
}

- (VCCompanionSyncService)service
{
  return self->_service;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (VCSyncDataEndpoint)syncDataEndpoint
{
  return self->_syncDataEndpoint;
}

- (NSMutableSet)startedSessions
{
  return self->_startedSessions;
}

- (PSYSyncCoordinator)pairedSyncCoordinator
{
  return self->_pairedSyncCoordinator;
}

- (void)handleDidUnpairNotification:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F79E80]];

  v6 = getWFWatchSyncLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = [v5 pairingID];
    *(_DWORD *)buf = 136315394;
    v29 = "-[VCWatchSyncCoordinator handleDidUnpairNotification:]";
    __int16 v30 = 2114;
    v31 = v7;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_INFO, "%s received DidUnpair notification for pairingID=%{public}@", buf, 0x16u);
  }
  v22 = v5;
  if (v5)
  {
    v8 = [VCNRDeviceSyncService alloc];
    v9 = [(VCWatchSyncCoordinator *)self service];
    v10 = [(VCNRDeviceSyncService *)v8 initWithCompanionSyncService:v9 device:v5];
  }
  else
  {
    v10 = 0;
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v11 = [(VCWatchSyncCoordinator *)self syncDataEndpoint];
  v12 = [v11 syncDataHandlers];

  uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v23 = 0;
        char v18 = [v17 resetSyncStateForService:v10 error:&v23];
        id v19 = v23;
        if ((v18 & 1) == 0)
        {
          v20 = getWFWatchSyncLogObject();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = [(VCNRDeviceSyncService *)v10 syncServiceIdentifier];
            *(_DWORD *)buf = 136315650;
            v29 = "-[VCWatchSyncCoordinator handleDidUnpairNotification:]";
            __int16 v30 = 2114;
            v31 = v21;
            __int16 v32 = 2114;
            id v33 = v19;
            _os_log_impl(&dword_1C7D7E000, v20, OS_LOG_TYPE_ERROR, "%s Error removing sync state for sync service with identifier=%{public}@: %{public}@", buf, 0x20u);
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v24 objects:v34 count:16];
    }
    while (v14);
  }
}

- (void)handleDeviceDidChangeVersionNotification
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = getWFWatchSyncLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[VCWatchSyncCoordinator handleDeviceDidChangeVersionNotification]";
    _os_log_impl(&dword_1C7D7E000, v3, OS_LOG_TYPE_INFO, "%s Received PairedDeviceDidChangeVersion notification", (uint8_t *)&v4, 0xCu);
  }

  [(VCWatchSyncCoordinator *)self requestSyncIfUnrestricted];
}

- (void)stopObservingWatchChangeNotifications
{
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F79EB0];
  int v4 = [MEMORY[0x1E4F79EF8] sharedInstance];
  [v6 removeObserver:self name:v3 object:v4];

  v5 = [(VCWatchSyncCoordinator *)self eventHandler];
  [v5 removeObserver:self name:@"com.apple.nanoregistry.paireddevicedidchangeversion"];
}

- (void)startObservingWatchChangeNotifications
{
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *MEMORY[0x1E4F79EB0];
  int v4 = [MEMORY[0x1E4F79EF8] sharedInstance];
  [v6 addObserver:self selector:sel_handleDidUnpairNotification_ name:v3 object:v4];

  v5 = [(VCWatchSyncCoordinator *)self eventHandler];
  [v5 addObserver:self selector:sel_handleDeviceDidChangeVersionNotification name:@"com.apple.nanoregistry.paireddevicedidchangeversion"];
}

- (void)companionSyncService:(id)a3 outgoingSyncSession:(id)a4 didUpdateProgress:(double)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = [(VCWatchSyncCoordinator *)self pairedSyncCoordinator];
  v7 = [v6 activeSyncSession];

  if (v7)
  {
    [v7 reportProgress:a5];
    v8 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [v7 sessionIdentifier];
      int v10 = 136315650;
      v11 = "-[VCWatchSyncCoordinator companionSyncService:outgoingSyncSession:didUpdateProgress:]";
      __int16 v12 = 2048;
      double v13 = a5;
      __int16 v14 = 2114;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_INFO, "%s Reported progress %f for PairedSync session %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)companionSyncService:(id)a3 outgoingSyncSessionDidFinishSendingChanges:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = [(VCWatchSyncCoordinator *)self pairedSyncCoordinator];
  v5 = [v4 activeSyncSession];

  if (v5)
  {
    [v5 syncDidCompleteSending];
    id v6 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = [v5 sessionIdentifier];
      int v8 = 136315394;
      v9 = "-[VCWatchSyncCoordinator companionSyncService:outgoingSyncSessionDidFinishSendingChanges:]";
      __int16 v10 = 2114;
      v11 = v7;
      _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_INFO, "%s Finished sending changes for PairedSync session %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)companionSyncService:(id)a3 didRejectSessionWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [(VCWatchSyncCoordinator *)self pairedSyncCoordinator];
  v7 = [v6 activeSyncSession];

  if (v7)
  {
    if (v5)
    {
      [v7 syncDidFailWithError:v5];
      int v8 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = [v7 sessionIdentifier];
        int v14 = 136315650;
        uint64_t v15 = "-[VCWatchSyncCoordinator companionSyncService:didRejectSessionWithError:]";
        __int16 v16 = 2114;
        v17 = v9;
        __int16 v18 = 2114;
        id v19 = v5;
        __int16 v10 = "%s PairedSync session %{public}@ failed to start syncing with error: %{public}@";
        v11 = v8;
        os_log_type_t v12 = OS_LOG_TYPE_ERROR;
        uint32_t v13 = 32;
LABEL_7:
        _os_log_impl(&dword_1C7D7E000, v11, v12, v10, (uint8_t *)&v14, v13);
      }
    }
    else
    {
      [v7 syncDidComplete];
      int v8 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = [v7 sessionIdentifier];
        int v14 = 136315394;
        uint64_t v15 = "-[VCWatchSyncCoordinator companionSyncService:didRejectSessionWithError:]";
        __int16 v16 = 2114;
        v17 = v9;
        __int16 v10 = "%s Completed PairedSync session %{public}@ succesfully because no changes had to be sent";
        v11 = v8;
        os_log_type_t v12 = OS_LOG_TYPE_INFO;
        uint32_t v13 = 22;
        goto LABEL_7;
      }
    }
  }
}

- (void)companionSyncService:(id)a3 didFinishSyncSession:(id)a4 withError:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  v7 = [(VCWatchSyncCoordinator *)self pairedSyncCoordinator];
  int v8 = [v7 activeSyncSession];

  if (v8)
  {
    if (v6)
    {
      [v8 syncDidFailWithError:v6];
      v9 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        __int16 v10 = [v8 sessionIdentifier];
        int v15 = 136315650;
        __int16 v16 = "-[VCWatchSyncCoordinator companionSyncService:didFinishSyncSession:withError:]";
        __int16 v17 = 2114;
        __int16 v18 = v10;
        __int16 v19 = 2114;
        id v20 = v6;
        v11 = "%s PairedSync session %{public}@ failed with error: %{public}@";
        os_log_type_t v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
        uint32_t v14 = 32;
LABEL_7:
        _os_log_impl(&dword_1C7D7E000, v12, v13, v11, (uint8_t *)&v15, v14);
      }
    }
    else
    {
      [v8 syncDidComplete];
      v9 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = [v8 sessionIdentifier];
        int v15 = 136315394;
        __int16 v16 = "-[VCWatchSyncCoordinator companionSyncService:didFinishSyncSession:withError:]";
        __int16 v17 = 2114;
        __int16 v18 = v10;
        v11 = "%s Completed PairedSync session %{public}@ succesfully";
        os_log_type_t v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_INFO;
        uint32_t v14 = 22;
        goto LABEL_7;
      }
    }
  }
}

- (int64_t)companionSyncService:(id)a3 typeForSession:(id)a4
{
  int v4 = [(VCWatchSyncCoordinator *)self pairedSyncCoordinator];
  id v5 = [v4 activeSyncSession];

  if (v5)
  {
    uint64_t v6 = [v5 syncSessionType];
    if (v6) {
      int64_t v7 = 2 * (v6 == 1);
    }
    else {
      int64_t v7 = 1;
    }
  }
  else
  {
    int64_t v7 = 0;
  }

  return v7;
}

- (BOOL)companionSyncServiceShouldStartSession:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VCWatchSyncCoordinator *)self pairedSyncCoordinator];
  uint64_t v4 = [v3 syncRestriction];

  if (v4 == 1)
  {
    id v5 = getWFWatchSyncLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      int v8 = "-[VCWatchSyncCoordinator companionSyncServiceShouldStartSession:]";
      _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Not syncing because of PSYSyncRestrictionLimitPush", (uint8_t *)&v7, 0xCu);
    }
  }
  return v4 != 1;
}

- (void)syncCoordinatorDidChangeSyncRestriction:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = getWFWatchSyncLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    int v7 = "-[VCWatchSyncCoordinator syncCoordinatorDidChangeSyncRestriction:]";
    __int16 v8 = 2048;
    uint64_t v9 = [v4 syncRestriction];
    _os_log_impl(&dword_1C7D7E000, v5, OS_LOG_TYPE_INFO, "%s Sync restriction changed to %lu", (uint8_t *)&v6, 0x16u);
  }

  [(VCWatchSyncCoordinator *)self requestSyncIfUnrestricted];
}

- (void)syncCoordinator:(id)a3 didInvalidateSyncSession:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = getWFWatchSyncLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 sessionIdentifier];
    int v10 = 136315394;
    v11 = "-[VCWatchSyncCoordinator syncCoordinator:didInvalidateSyncSession:]";
    __int16 v12 = 2114;
    os_log_type_t v13 = v7;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_DEFAULT, "%s Invalidated PairedSync session %{public}@", (uint8_t *)&v10, 0x16u);
  }
  __int16 v8 = [(VCWatchSyncCoordinator *)self startedSessions];
  uint64_t v9 = [v5 sessionIdentifier];
  [v8 removeObject:v9];
}

- (void)syncCoordinator:(id)a3 beginSyncSession:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  int v6 = getWFWatchSyncLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = [v5 sessionIdentifier];
    int v8 = 136315394;
    uint64_t v9 = "-[VCWatchSyncCoordinator syncCoordinator:beginSyncSession:]";
    __int16 v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_1C7D7E000, v6, OS_LOG_TYPE_INFO, "%s Starting PairedSync session %{public}@", (uint8_t *)&v8, 0x16u);
  }
  [(VCWatchSyncCoordinator *)self requestSyncIfUnrestricted];
}

- (void)requestSyncIfUnrestricted
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(VCWatchSyncCoordinator *)self service];
  BOOL v4 = [(VCWatchSyncCoordinator *)self companionSyncServiceShouldStartSession:v3];

  if (v4)
  {
    id v5 = [(VCWatchSyncCoordinator *)self pairedSyncCoordinator];
    int v6 = [v5 activeSyncSession];

    if (v6)
    {
      int v7 = [v6 sessionIdentifier];
      int v8 = [(VCWatchSyncCoordinator *)self startedSessions];
      char v9 = [v8 containsObject:v7];

      if ((v9 & 1) == 0)
      {
        uint64_t v10 = [v6 syncSessionType];
        v11 = [(VCWatchSyncCoordinator *)self service];
        uint64_t v12 = v11;
        if (v10) {
          [v11 requestSyncImmediately];
        }
        else {
          [v11 requestFullResync];
        }

        os_log_type_t v13 = [(VCWatchSyncCoordinator *)self startedSessions];
        [v13 addObject:v7];

        uint64_t v14 = getWFWatchSyncLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v15 = 136315394;
          __int16 v16 = "-[VCWatchSyncCoordinator requestSyncIfUnrestricted]";
          __int16 v17 = 2114;
          __int16 v18 = v7;
          _os_log_impl(&dword_1C7D7E000, v14, OS_LOG_TYPE_INFO, "%s Requested CompanionSync session for PairedSync session %{public}@", (uint8_t *)&v15, 0x16u);
        }
      }
    }
    else
    {
      int v7 = [(VCWatchSyncCoordinator *)self service];
      [v7 requestSync];
    }
  }
}

- (void)dealloc
{
  [(VCWatchSyncCoordinator *)self stopObservingWatchChangeNotifications];
  v3.receiver = self;
  v3.super_class = (Class)VCWatchSyncCoordinator;
  [(VCWatchSyncCoordinator *)&v3 dealloc];
}

- (VCWatchSyncCoordinator)initWithSyncDataEndpoint:(id)a3 eventHandler:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VCWatchSyncCoordinator;
  int v7 = [(VCWatchSyncCoordinator *)&v22 init];
  if (v7)
  {
    int v8 = [MEMORY[0x1E4FB46B8] currentDevice];
    if ([v8 idiom] == 1)
    {
      char v9 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        long long v24 = "-[VCWatchSyncCoordinator initWithSyncDataEndpoint:eventHandler:]";
        uint64_t v10 = "%s Not running WatchSync on iPad";
LABEL_16:
        _os_log_impl(&dword_1C7D7E000, v9, OS_LOG_TYPE_INFO, v10, buf, 0xCu);
      }
    }
    else if (objc_opt_class())
    {
      if (objc_opt_class())
      {
        uint64_t v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        char v9 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_USER_INITIATED, 0);

        dispatch_queue_t v13 = dispatch_queue_create("com.apple.VCWatchSyncCoordinator", v9);
        queue = v7->_queue;
        v7->_queue = (OS_dispatch_queue *)v13;

        objc_storeStrong((id *)&v7->_syncDataEndpoint, a3);
        int v15 = [[VCCompanionSyncService alloc] initWithSyncDataEndpoint:v6];
        service = v7->_service;
        v7->_service = v15;

        [(VCCompanionSyncService *)v7->_service setDelegate:v7];
        if (v7->_service)
        {
          uint64_t v17 = objc_opt_new();
          startedSessions = v7->_startedSessions;
          v7->_startedSessions = (NSMutableSet *)v17;

          uint64_t v19 = [MEMORY[0x1E4F83B80] syncCoordinatorWithServiceName:@"com.apple.pairedsync.siriactionsd"];
          pairedSyncCoordinator = v7->_pairedSyncCoordinator;
          v7->_pairedSyncCoordinator = (PSYSyncCoordinator *)v19;

          [(PSYSyncCoordinator *)v7->_pairedSyncCoordinator setDelegate:v7 queue:v7->_queue];
          if (v7->_service) {
            [(VCWatchSyncCoordinator *)v7 startObservingWatchChangeNotifications];
          }
          v11 = v7;
          goto LABEL_18;
        }
      }
      else
      {
        char v9 = getWFWatchSyncLogObject();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315138;
          long long v24 = "-[VCWatchSyncCoordinator initWithSyncDataEndpoint:eventHandler:]";
          uint64_t v10 = "%s The NanoRegistry framework is not present on this device";
          goto LABEL_16;
        }
      }
    }
    else
    {
      char v9 = getWFWatchSyncLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        long long v24 = "-[VCWatchSyncCoordinator initWithSyncDataEndpoint:eventHandler:]";
        uint64_t v10 = "%s The PairedSync framework is not present on this device";
        goto LABEL_16;
      }
    }
    v11 = 0;
LABEL_18:

    goto LABEL_19;
  }
  v11 = 0;
LABEL_19:

  return v11;
}

@end