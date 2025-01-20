@interface NPKPassSyncService
- (BOOL)dropAllMessages;
- (IDSService)passSyncService;
- (NPKPassSyncEngine)passSyncEngine;
- (NPKPassSyncService)initWithPassSyncEngineRole:(unint64_t)a3;
- (NPKPassSyncServiceSyncStatus)passSyncStatus;
- (OS_dispatch_queue)passSyncQueue;
- (OS_dispatch_source)passSyncEngineArchiveTimer;
- (OS_dispatch_source)passSyncEngineSyncTimer;
- (id)_archivedPassSyncEngine;
- (id)companionCatalogToSendWithStateChange;
- (id)currentLibraryPassSyncStateWithReconciledState:(id)a3;
- (id)passSyncEngine:(id)a3 dataForPassWithUniqueID:(id)a4;
- (id)passSyncEngine:(id)a3 partialDataForPassWithUniqueID:(id)a4 baseManifest:(id)a5 outRemoteAssets:(id *)a6;
- (id)passSyncEngineNeedsUpdatedPassLibraryState:(id)a3;
- (id)watchCatalogToSendWithStateChange;
- (unint64_t)settingsForPassWithUniqueID:(id)a3;
- (void)_archiveTimerFired;
- (void)_ensureSyncTimerIsSet;
- (void)_provideUpdatedLibraryStateToSyncEngineAndSyncIfNecessary:(BOOL)a3;
- (void)_syncNow;
- (void)_syncTimerFired;
- (void)_syncWhenAppropriate;
- (void)associatedPassDataRequested:(id)a3;
- (void)catalogChanged:(id)a3;
- (void)handleCatalogChangeWithCompanionCatalog:(id)a3 watchCatalog:(id)a4;
- (void)handleIncomingCompanionCatalog:(id)a3 watchCatalog:(id)a4;
- (void)handleIncomingPassSettings:(unint64_t)a3 forPassWithUniqueID:(id)a4;
- (void)handlePassLibraryChanged;
- (void)handleRequestedAssociatedData:(unint64_t)a3 forPassWithUniqueID:(id)a4;
- (void)handleSettingsChanged:(unint64_t)a3 forPassWithUniqueID:(id)a4;
- (void)passSettingsChanged:(id)a3;
- (void)passSyncEngine:(id)a3 finishedProcessingChange:(id)a4;
- (void)passSyncEngine:(id)a3 receivedStateChangeProcessed:(id)a4 changeAccepted:(BOOL)a5;
- (void)passSyncEngine:(id)a3 requestsAddPassData:(id)a4 forSyncStateItem:(id)a5 completion:(id)a6;
- (void)passSyncEngine:(id)a3 requestsRemovePassWithUniqueID:(id)a4 completion:(id)a5;
- (void)passSyncEngine:(id)a3 requestsUpdatePassData:(id)a4 forSyncStateItem:(id)a5 baseManifestHashForPartialUpdate:(id)a6 remoteAssetsForPartialUpdate:(id)a7 completion:(id)a8;
- (void)passSyncEngine:(id)a3 sendProposedReconciledState:(id)a4;
- (void)passSyncEngine:(id)a3 sendReconciledStateAcceptedWithHash:(id)a4;
- (void)passSyncEngine:(id)a3 sendReconciledStateUnrecognizedWithHash:(id)a4 version:(unint64_t)a5 currentPassSyncState:(id)a6;
- (void)passSyncEngine:(id)a3 sendStateChange:(id)a4;
- (void)passSyncEngine:(id)a3 sendStateChangeProcessedWithUUID:(id)a4 changeAccepted:(BOOL)a5 fullPassRequired:(BOOL)a6;
- (void)passSyncEngineStateChanged:(id)a3;
- (void)proposedReconciledState:(id)a3;
- (void)reconciledStateAccepted:(id)a3;
- (void)reconciledStateUnrecognized:(id)a3;
- (void)requestAssociatedData:(unint64_t)a3 forPassWithUniqueID:(id)a4;
- (void)setDropAllMessages:(BOOL)a3;
- (void)setPassSyncEngine:(id)a3;
- (void)setPassSyncEngineArchiveTimer:(id)a3;
- (void)setPassSyncEngineSyncTimer:(id)a3;
- (void)setPassSyncQueue:(id)a3;
- (void)setPassSyncService:(id)a3;
- (void)setPassSyncStatus:(id)a3;
- (void)start;
- (void)suggestSync;
- (void)syncStateChangeProcessed:(id)a3;
- (void)syncStateChanged:(id)a3;
- (void)teardownSync;
- (void)updatePassLibrary;
@end

@implementation NPKPassSyncService

- (NPKPassSyncService)initWithPassSyncEngineRole:(unint64_t)a3
{
  v22.receiver = self;
  v22.super_class = (Class)NPKPassSyncService;
  id v4 = [(NPKPassSyncService *)&v22 init];
  if (v4)
  {
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.nanopassd.passsync", 0);
    v6 = (void *)*((void *)v4 + 4);
    *((void *)v4 + 4) = v5;

    v7 = (void *)[objc_alloc(MEMORY[0x263F4A0C0]) initWithService:@"com.apple.private.alloy.passbook.general"];
    [v7 setProtobufAction:sel_syncStateChanged_ forIncomingRequestsOfType:40];
    [v7 setProtobufAction:sel_syncStateChangeProcessed_ forIncomingRequestsOfType:41];
    [v7 setProtobufAction:sel_reconciledStateUnrecognized_ forIncomingRequestsOfType:42];
    [v7 setProtobufAction:sel_proposedReconciledState_ forIncomingRequestsOfType:43];
    [v7 setProtobufAction:sel_reconciledStateAccepted_ forIncomingRequestsOfType:44];
    [v7 setProtobufAction:sel_passSettingsChanged_ forIncomingRequestsOfType:31];
    [v7 setProtobufAction:sel_catalogChanged_ forIncomingRequestsOfType:7];
    [v7 setProtobufAction:sel_associatedPassDataRequested_ forIncomingRequestsOfType:45];
    [v7 addDelegate:v4 queue:*((void *)v4 + 4)];
    objc_storeStrong((id *)v4 + 3, v7);
    objc_initWeak(&location, v4);
    v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, *((dispatch_queue_t *)v4 + 4));
    dispatch_source_set_timer(v8, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    uint64_t v16 = MEMORY[0x263EF8330];
    uint64_t v17 = 3221225472;
    v18 = __49__NPKPassSyncService_initWithPassSyncEngineRole___block_invoke;
    v19 = &unk_2644D29A8;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v8, &v16);
    dispatch_resume(v8);
    objc_storeStrong((id *)v4 + 5, v8);
    v9 = objc_alloc_init(NPKPassSyncServiceSyncStatus);
    v10 = (void *)*((void *)v4 + 7);
    *((void *)v4 + 7) = v9;

    v11 = objc_msgSend(v4, "_archivedPassSyncEngine", v16, v17, v18, v19);
    v12 = v11;
    if (v11) {
      v13 = v11;
    }
    else {
      v13 = [[NPKPassSyncEngine alloc] initWithRole:a3];
    }
    v14 = (void *)*((void *)v4 + 2);
    *((void *)v4 + 2) = v13;

    [*((id *)v4 + 2) setDelegate:v4];
    [*((id *)v4 + 2) setDataSource:v4];
    objc_destroyWeak(&v20);

    objc_destroyWeak(&location);
  }
  return (NPKPassSyncService *)v4;
}

void __49__NPKPassSyncService_initWithPassSyncEngineRole___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _archiveTimerFired];
}

- (void)start
{
  v3 = pk_Sync_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    dispatch_queue_t v5 = pk_Sync_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: starting", buf, 2u);
    }
  }
  passSyncQueue = self->_passSyncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __27__NPKPassSyncService_start__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(passSyncQueue, block);
}

uint64_t __27__NPKPassSyncService_start__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _provideUpdatedLibraryStateToSyncEngineAndSyncIfNecessary:0];
}

- (void)teardownSync
{
}

- (void)handlePassLibraryChanged
{
  v3 = pk_Sync_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    dispatch_queue_t v5 = pk_Sync_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: pass library changed", v6, 2u);
    }
  }
  [(NPKPassSyncService *)self updatePassLibrary];
}

- (void)updatePassLibrary
{
  passSyncQueue = self->_passSyncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__NPKPassSyncService_updatePassLibrary__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(passSyncQueue, block);
}

uint64_t __39__NPKPassSyncService_updatePassLibrary__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _provideUpdatedLibraryStateToSyncEngineAndSyncIfNecessary:1];
}

- (void)requestAssociatedData:(unint64_t)a3 forPassWithUniqueID:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"46D8FA11-A747-4C0B-B4F4-0AB1308739B4"];
  v8 = NPKPairedOrPairingDevice();
  char v9 = [v8 supportsCapability:v7];

  if (v9)
  {
    if (v6)
    {
      v10 = pk_Sync_log();
      BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

      if (a3)
      {
        if (v11)
        {
          v12 = pk_Sync_log();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            v13 = NSStringFromNPKAssociatedPassData(a3);
            *(_DWORD *)buf = 138412546;
            id v43 = v13;
            __int16 v44 = 2112;
            id v45 = v6;
            _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Requesting associated data:%@ for pass with uniqueID:%@", buf, 0x16u);
          }
        }
        v14 = objc_alloc_init(NPKProtoPassAssociatedDataRequest);
        [(NPKProtoPassAssociatedDataRequest *)v14 setPassUniqueID:v6];
        [(NPKProtoPassAssociatedDataRequest *)v14 setPassRequestedData:a3];
        id v15 = objc_alloc(MEMORY[0x263F4A228]);
        uint64_t v16 = [(NPKProtoPassAssociatedDataRequest *)v14 data];
        uint64_t v17 = (void *)[v15 initWithProtobufData:v16 type:45 isResponse:0];

        v18 = [NSString stringWithFormat:@"passAssociatedData-%@", v6];
        v40[0] = *MEMORY[0x263F49F80];
        v19 = [NSNumber numberWithDouble:*MEMORY[0x263F4A150]];
        uint64_t v20 = *MEMORY[0x263F49F60];
        v41[0] = v19;
        v41[1] = v18;
        uint64_t v21 = *MEMORY[0x263F49EC0];
        v40[1] = v20;
        v40[2] = v21;
        uint64_t v22 = *MEMORY[0x263F49F30];
        v41[2] = MEMORY[0x263EFFA88];
        v41[3] = MEMORY[0x263EFFA88];
        uint64_t v23 = *MEMORY[0x263F49EB0];
        v40[3] = v22;
        v40[4] = v23;
        v41[4] = MEMORY[0x263EFFA88];
        v24 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:5];

        passSyncService = self->_passSyncService;
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __64__NPKPassSyncService_requestAssociatedData_forPassWithUniqueID___block_invoke;
        v38[3] = &unk_2644D29D0;
        id v26 = v17;
        id v39 = v26;
        v27 = NPKProtoSendWithOptions(passSyncService, v26, 200, 0, 0, v38, v24);
        v28 = pk_Sync_log();
        BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

        if (v29)
        {
          v30 = pk_Sync_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v43 = v27;
            __int16 v44 = 2112;
            id v45 = v26;
            _os_log_impl(&dword_21E92F000, v30, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent pass associated data request\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
          }
        }
        goto LABEL_21;
      }
      if (!v11) {
        goto LABEL_22;
      }
      pk_Sync_log();
      v14 = (NPKProtoPassAssociatedDataRequest *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v14->super.super.super, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      *(_DWORD *)buf = 138412290;
      id v43 = v6;
      v33 = "Warning: missing associated data for pass with uniqueID:%@, will not request pass associated data";
      p_super = &v14->super.super.super;
      uint32_t v37 = 12;
      goto LABEL_20;
    }
    v34 = pk_Sync_log();
    BOOL v35 = os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT);

    if (v35)
    {
      pk_Sync_log();
      v14 = (NPKProtoPassAssociatedDataRequest *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super.super.super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v33 = "Warning: missing pass uniqueID, will not request pass associated data";
        goto LABEL_19;
      }
      goto LABEL_21;
    }
  }
  else
  {
    v31 = pk_Sync_log();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);

    if (v32)
    {
      pk_Sync_log();
      v14 = (NPKProtoPassAssociatedDataRequest *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v14->super.super.super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v33 = "Notice: Paired devices doesn't support request pass associated data";
LABEL_19:
        p_super = &v14->super.super.super;
        uint32_t v37 = 2;
LABEL_20:
        _os_log_impl(&dword_21E92F000, p_super, OS_LOG_TYPE_DEFAULT, v33, buf, v37);
      }
LABEL_21:
    }
  }
LABEL_22:
}

void __64__NPKPassSyncService_requestAssociatedData_forPassWithUniqueID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = pk_Sync_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    id v6 = pk_Sync_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v3;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: Failed to send pass associated data request: %@ error:%@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)handleSettingsChanged:(unint64_t)a3 forPassWithUniqueID:(id)a4
{
  v34[5] = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = pk_Sync_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    uint64_t v9 = pk_Sync_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v6;
      _os_log_impl(&dword_21E92F000, v9, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: pass settings changed for pass with unique ID %@", buf, 0xCu);
    }
  }
  __int16 v10 = objc_alloc_init(NPKProtoPassSettingsChangedRequest);
  [(NPKProtoPassSettingsChangedRequest *)v10 setUniqueID:v6];
  [(NPKProtoPassSettingsChangedRequest *)v10 setPassSettings:a3];
  id v11 = objc_alloc(MEMORY[0x263F4A228]);
  uint64_t v12 = [(NPKProtoPassSettingsChangedRequest *)v10 data];
  v13 = (void *)[v11 initWithProtobufData:v12 type:31 isResponse:0];

  v14 = [NSString stringWithFormat:@"passSettings-%@", v6];
  v33[0] = *MEMORY[0x263F49F80];
  id v15 = [NSNumber numberWithDouble:*MEMORY[0x263F4A150]];
  uint64_t v16 = *MEMORY[0x263F49F60];
  v34[0] = v15;
  v34[1] = v14;
  uint64_t v17 = *MEMORY[0x263F49EC0];
  v33[1] = v16;
  v33[2] = v17;
  uint64_t v18 = *MEMORY[0x263F49EB0];
  v34[2] = MEMORY[0x263EFFA88];
  v34[3] = MEMORY[0x263EFFA88];
  uint64_t v19 = *MEMORY[0x263F49F30];
  v33[3] = v18;
  v33[4] = v19;
  v34[4] = MEMORY[0x263EFFA88];
  uint64_t v20 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:5];

  passSyncService = self->_passSyncService;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __64__NPKPassSyncService_handleSettingsChanged_forPassWithUniqueID___block_invoke;
  v27[3] = &unk_2644D29D0;
  id v22 = v13;
  id v28 = v22;
  uint64_t v23 = NPKProtoSendWithOptions(passSyncService, v22, 200, 0, 0, v27, v20);
  v24 = pk_Sync_log();
  BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

  if (v25)
  {
    id v26 = pk_Sync_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v30 = v23;
      __int16 v31 = 2112;
      id v32 = v22;
      _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent pass settings\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
    }
  }
}

void __64__NPKPassSyncService_handleSettingsChanged_forPassWithUniqueID___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = pk_Sync_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_Sync_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: Failed to send pass settings: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)handleCatalogChangeWithCompanionCatalog:(id)a3 watchCatalog:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = pk_Sync_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    __int16 v10 = pk_Sync_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      id v36 = v6;
      __int16 v37 = 2048;
      id v38 = v7;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: handling catalog changed (companion %p watch %p)", buf, 0x16u);
    }
  }
  id v11 = objc_alloc_init(NPKProtoCatalog);
  if (!v6 || (NPKSecureArchiveObject(v6), (uint64_t v12 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v12 = [MEMORY[0x263EFF8F8] data];
  }
  [(NPKProtoCatalog *)v11 setCatalogData:v12];
  v13 = objc_alloc_init(NPKProtoCatalogChangedRequest);
  [(NPKProtoCatalogChangedRequest *)v13 setCompanionCatalog:v11];
  if (v7)
  {
    v14 = NPKSecureArchiveObject(v7);
    if (v14)
    {
      id v15 = objc_alloc_init(NPKProtoCatalog);
      [(NPKProtoCatalog *)v15 setCatalogData:v14];
      [(NPKProtoCatalogChangedRequest *)v13 setWatchCatalog:v15];
    }
  }
  id v16 = objc_alloc(MEMORY[0x263F4A228]);
  uint64_t v17 = [(NPKProtoCatalogChangedRequest *)v13 data];
  uint64_t v18 = (void *)[v16 initWithProtobufData:v17 type:7 isResponse:0];

  v33[0] = *MEMORY[0x263F49F80];
  uint64_t v19 = [NSNumber numberWithDouble:*MEMORY[0x263F4A150]];
  uint64_t v20 = *MEMORY[0x263F49F60];
  v34[0] = v19;
  v34[1] = @"passCatalog";
  uint64_t v21 = *MEMORY[0x263F49EC0];
  v33[1] = v20;
  v33[2] = v21;
  uint64_t v22 = *MEMORY[0x263F49EB0];
  v34[2] = MEMORY[0x263EFFA88];
  v34[3] = MEMORY[0x263EFFA88];
  uint64_t v23 = *MEMORY[0x263F49F30];
  v33[3] = v22;
  v33[4] = v23;
  v34[4] = MEMORY[0x263EFFA88];
  v24 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:5];

  passSyncService = self->_passSyncService;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __75__NPKPassSyncService_handleCatalogChangeWithCompanionCatalog_watchCatalog___block_invoke;
  v31[3] = &unk_2644D29D0;
  id v26 = v18;
  id v32 = v26;
  v27 = NPKProtoSendWithOptions(passSyncService, v26, 200, 0, 0, v31, v24);
  id v28 = pk_Sync_log();
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

  if (v29)
  {
    id v30 = pk_Sync_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v36 = v27;
      __int16 v37 = 2112;
      id v38 = v26;
      _os_log_impl(&dword_21E92F000, v30, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent catalog\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
    }
  }
}

void __75__NPKPassSyncService_handleCatalogChangeWithCompanionCatalog_watchCatalog___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = pk_Sync_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_Sync_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: Failed to send catalog: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)suggestSync
{
  passSyncQueue = self->_passSyncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__NPKPassSyncService_suggestSync__block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(passSyncQueue, block);
}

uint64_t __33__NPKPassSyncService_suggestSync__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _syncWhenAppropriate];
}

- (id)currentLibraryPassSyncStateWithReconciledState:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    uint64_t v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      uint64_t v7 = "-[NPKPassSyncService currentLibraryPassSyncStateWithReconciledState:]";
      __int16 v8 = 2082;
      BOOL v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      __int16 v10 = 2048;
      uint64_t v11 = 294;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v6, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (unint64_t)settingsForPassWithUniqueID:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = pk_General_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);

  if (v4)
  {
    uint64_t v5 = pk_General_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446722;
      uint64_t v7 = "-[NPKPassSyncService settingsForPassWithUniqueID:]";
      __int16 v8 = 2082;
      BOOL v9 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      __int16 v10 = 2048;
      uint64_t v11 = 300;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v6, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (void)handleIncomingPassSettings:(unint64_t)a3 forPassWithUniqueID:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    int v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      __int16 v8 = "-[NPKPassSyncService handleIncomingPassSettings:forPassWithUniqueID:]";
      __int16 v9 = 2082;
      __int16 v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      __int16 v11 = 2048;
      uint64_t v12 = 306;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v7, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (void)handleIncomingCompanionCatalog:(id)a3 watchCatalog:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BOOL v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    int v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      __int16 v8 = "-[NPKPassSyncService handleIncomingCompanionCatalog:watchCatalog:]";
      __int16 v9 = 2082;
      __int16 v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      __int16 v11 = 2048;
      uint64_t v12 = 311;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v7, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (id)companionCatalogToSendWithStateChange
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      int v6 = "-[NPKPassSyncService companionCatalogToSendWithStateChange]";
      __int16 v7 = 2082;
      __int16 v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      __int16 v9 = 2048;
      uint64_t v10 = 316;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (id)watchCatalogToSendWithStateChange
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = pk_General_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_General_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136446722;
      int v6 = "-[NPKPassSyncService watchCatalogToSendWithStateChange]";
      __int16 v7 = 2082;
      __int16 v8 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      __int16 v9 = 2048;
      uint64_t v10 = 322;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v5, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (void)syncStateChanged:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  passSyncQueue = self->_passSyncQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(passSyncQueue);
  int v6 = +[NPKOSTransaction transactionWithName:@"sync state changed"];
  __int16 v7 = [NPKProtoPassSyncStateChange alloc];
  __int16 v8 = [v5 data];

  __int16 v9 = [(NPKProtoPassSyncStateChange *)v7 initWithData:v8];
  uint64_t v10 = [[NPKPassSyncChange alloc] initWithProtoPassSyncChange:v9];
  if (![(NPKProtoPassSyncStateChange *)v9 hasPassSegmentIndex])
  {
LABEL_14:
    [(NPKPassSyncEngine *)self->_passSyncEngine handleStateChange:v10];
    if ([(NPKProtoPassSyncStateChange *)v9 hasCompanionCatalog]
      || [(NPKProtoPassSyncStateChange *)v9 hasWatchCatalog])
    {
      v24 = +[NPKOSTransaction transactionWithName:@"sync state changed, catalog"];
      if ([(NPKProtoPassSyncStateChange *)v9 hasCompanionCatalog])
      {
        BOOL v25 = [(NPKProtoPassSyncStateChange *)v9 companionCatalog];
        id v26 = [v25 catalogData];
        v27 = objc_opt_class();
        id v28 = NPKSecureUnarchiveObject(v26, v27);
      }
      else
      {
        id v28 = 0;
      }
      if ([(NPKProtoPassSyncStateChange *)v9 hasWatchCatalog])
      {
        id v32 = [(NPKProtoPassSyncStateChange *)v9 watchCatalog];
        v33 = [v32 catalogData];
        v34 = objc_opt_class();
        BOOL v35 = NPKSecureUnarchiveObject(v33, v34);
      }
      else
      {
        BOOL v35 = 0;
      }
      [(NPKPassSyncService *)self handleIncomingCompanionCatalog:v28 watchCatalog:v35];
      [v24 invalidate];

LABEL_26:
      goto LABEL_27;
    }
    goto LABEL_27;
  }
  unsigned int v11 = [(NPKProtoPassSyncStateChange *)v9 passSegmentIndex];
  uint64_t v12 = pk_Sync_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    v14 = pk_Sync_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [(NPKPassSyncChange *)v10 changeUUID];
      int v36 = 138412802;
      __int16 v37 = v15;
      __int16 v38 = 1024;
      unsigned int v39 = v11;
      __int16 v40 = 1024;
      unsigned int v41 = [(NPKProtoPassSyncStateChange *)v9 passSegmentTotal];
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: storing large pass data segment\n\tchange UUID: %@\n\tsegment index: %u\n\ttotal pass segments: %u", (uint8_t *)&v36, 0x18u);
    }
  }
  id v16 = [(NPKPassSyncChange *)v10 passData];
  uint64_t v17 = [(NPKPassSyncChange *)v10 changeUUID];
  NPKStoreLargePassDataSegmentForChangeUUID(v16, v17, v11);

  if ([(NPKProtoPassSyncStateChange *)v9 hasPassSegmentTotal]
    && [(NPKProtoPassSyncStateChange *)v9 passSegmentTotal] == v11 + 1)
  {
    uint64_t v18 = [(NPKPassSyncChange *)v10 changeUUID];
    uint64_t v19 = NPKDataForLargePassWithChangeUUID(v18, [(NPKProtoPassSyncStateChange *)v9 passSegmentTotal]);

    uint64_t v20 = pk_Sync_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      uint64_t v22 = pk_Sync_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = [v19 npkDescription];
        int v36 = 138412290;
        __int16 v37 = v23;
        _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: this is the last segment of pass data\n\tretrieved combined pass data: %@", (uint8_t *)&v36, 0xCu);
      }
    }
    if (v19)
    {
      [(NPKPassSyncChange *)v10 setPassData:v19];

      goto LABEL_14;
    }
  }
  BOOL v29 = pk_Sync_log();
  BOOL v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);

  if (v30)
  {
    id v28 = pk_Sync_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v31 = [(NPKPassSyncChange *)v10 changeUUID];
      int v36 = 138412290;
      __int16 v37 = v31;
      _os_log_impl(&dword_21E92F000, v28, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: not providing state change to sync engine\n\tchange UUID: %@", (uint8_t *)&v36, 0xCu);
    }
    goto LABEL_26;
  }
LABEL_27:
  [v6 invalidate];
}

- (void)syncStateChangeProcessed:(id)a3
{
  passSyncQueue = self->_passSyncQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(passSyncQueue);
  id v13 = +[NPKOSTransaction transactionWithName:@"sync state change processed"];
  int v6 = [NPKProtoPassSyncStateChangeProcessed alloc];
  __int16 v7 = [v5 data];

  __int16 v8 = [(NPKProtoPassSyncStateChangeProcessed *)v6 initWithData:v7];
  id v9 = objc_alloc(MEMORY[0x263F08C38]);
  id v10 = [(NPKProtoPassSyncStateChangeProcessed *)v8 acceptedChangeUUID];
  unsigned int v11 = objc_msgSend(v9, "initWithUUIDBytes:", objc_msgSend(v10, "bytes"));

  if ([(NPKProtoPassSyncStateChangeProcessed *)v8 hasChangeAccepted]) {
    uint64_t v12 = [(NPKProtoPassSyncStateChangeProcessed *)v8 changeAccepted];
  }
  else {
    uint64_t v12 = 1;
  }
  [(NPKPassSyncEngine *)self->_passSyncEngine handleStateChangeProcessedWithUUID:v11 changeAccepted:v12 fullPassRequired:[(NPKProtoPassSyncStateChangeProcessed *)v8 fullPassRequired]];
  [v13 invalidate];
}

- (void)reconciledStateUnrecognized:(id)a3
{
  passSyncQueue = self->_passSyncQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(passSyncQueue);
  id v14 = +[NPKOSTransaction transactionWithName:@"sync state change processed"];
  int v6 = [NPKProtoPassSyncReconciledStateUnrecognized alloc];
  __int16 v7 = [v5 data];

  __int16 v8 = [(NPKProtoPassSyncReconciledStateUnrecognized *)v6 initWithData:v7];
  id v9 = [(NPKProtoPassSyncReconciledStateUnrecognized *)v8 unrecognizedReconciledStateHash];
  uint64_t v10 = [(NPKProtoPassSyncReconciledStateUnrecognized *)v8 hasUnrecognizedReconciledStateVersion];
  unsigned int v11 = [NPKPassSyncState alloc];
  uint64_t v12 = [(NPKProtoPassSyncReconciledStateUnrecognized *)v8 libraryPassSyncState];
  id v13 = [(NPKPassSyncState *)v11 initWithProtoSyncState:v12];

  [(NPKPassSyncEngine *)self->_passSyncEngine handleReconciledStateUnrecognizedWithHash:v9 version:v10 passSyncState:v13];
  [v14 invalidate];
}

- (void)proposedReconciledState:(id)a3
{
  passSyncQueue = self->_passSyncQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(passSyncQueue);
  id v12 = +[NPKOSTransaction transactionWithName:@"proposed reconciled state"];
  int v6 = [NPKProtoPassSyncProposedReconciledState alloc];
  __int16 v7 = [v5 data];

  __int16 v8 = [(NPKProtoPassSyncProposedReconciledState *)v6 initWithData:v7];
  id v9 = [NPKPassSyncState alloc];
  uint64_t v10 = [(NPKProtoPassSyncProposedReconciledState *)v8 proposedReconciledState];
  unsigned int v11 = [(NPKPassSyncState *)v9 initWithProtoSyncState:v10];

  [(NPKPassSyncEngine *)self->_passSyncEngine handleProposedReconciledState:v11];
  [v12 invalidate];
}

- (void)reconciledStateAccepted:(id)a3
{
  passSyncQueue = self->_passSyncQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(passSyncQueue);
  id v11 = +[NPKOSTransaction transactionWithName:@"reconciled state accepted"];
  int v6 = [NPKProtoPassSyncReconciledStateAccepted alloc];
  __int16 v7 = [v5 data];

  __int16 v8 = [(NPKProtoPassSyncReconciledStateAccepted *)v6 initWithData:v7];
  passSyncEngine = self->_passSyncEngine;
  uint64_t v10 = [(NPKProtoPassSyncReconciledStateAccepted *)v8 reconciledStateHash];
  [(NPKPassSyncEngine *)passSyncEngine handleReconciledStateAcceptedWithHash:v10];

  [v11 invalidate];
}

- (void)passSettingsChanged:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Sync_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    __int16 v7 = pk_Sync_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = [v4 npkDescription];
      int v17 = 138412290;
      uint64_t v18 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: pass settings changed with protobuf %@", (uint8_t *)&v17, 0xCu);
    }
  }
  id v9 = +[NPKOSTransaction transactionWithName:@"pass settings changed"];
  uint64_t v10 = [NPKProtoPassSettingsChangedRequest alloc];
  id v11 = [v4 data];
  id v12 = [(NPKProtoPassSettingsChangedRequest *)v10 initWithData:v11];

  id v13 = [(NPKProtoPassSettingsChangedRequest *)v12 uniqueID];
  if (v13 && [(NPKProtoPassSettingsChangedRequest *)v12 hasPassSettings])
  {
    [(NPKPassSyncService *)self handleIncomingPassSettings:[(NPKProtoPassSettingsChangedRequest *)v12 passSettings] forPassWithUniqueID:v13];
  }
  else
  {
    id v14 = pk_Sync_log();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v15)
    {
      id v16 = pk_Sync_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl(&dword_21E92F000, v16, OS_LOG_TYPE_DEFAULT, "Warning: Pass sync service: No unique ID or no pass settings in protobuf", (uint8_t *)&v17, 2u);
      }
    }
  }
  [v9 invalidate];
}

- (void)catalogChanged:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Sync_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    __int16 v7 = pk_Sync_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = [v4 npkDescription];
      int v24 = 138412290;
      BOOL v25 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: catalog changed with protobuf %@", (uint8_t *)&v24, 0xCu);
    }
  }
  id v9 = +[NPKOSTransaction transactionWithName:@"Catalog changed"];
  uint64_t v10 = [NPKProtoCatalogChangedRequest alloc];
  id v11 = [v4 data];
  id v12 = [(NPKProtoCatalogChangedRequest *)v10 initWithData:v11];

  id v13 = [(NPKProtoCatalogChangedRequest *)v12 companionCatalog];
  id v14 = [v13 catalogData];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    id v16 = [(NPKProtoCatalogChangedRequest *)v12 companionCatalog];
    int v17 = [v16 catalogData];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = NPKSecureUnarchiveObject(v17, v18);
  }
  else
  {
    uint64_t v19 = 0;
  }
  uint64_t v20 = [(NPKProtoCatalogChangedRequest *)v12 watchCatalog];
  BOOL v21 = [v20 catalogData];
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = NPKSecureUnarchiveObject(v21, v22);

  [(NPKPassSyncService *)self handleIncomingCompanionCatalog:v19 watchCatalog:v23];
  [v9 invalidate];
}

- (void)associatedPassDataRequested:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = pk_Sync_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    __int16 v7 = pk_Sync_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v8 = [v4 npkDescription];
      int v21 = 138412290;
      uint64_t v22 = v8;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: associated pass data request with protobuf %@", (uint8_t *)&v21, 0xCu);
    }
  }
  id v9 = [NPKProtoPassAssociatedDataRequest alloc];
  uint64_t v10 = [v4 data];
  id v11 = [(NPKProtoPassAssociatedDataRequest *)v9 initWithData:v10];

  id v12 = [(NPKProtoPassAssociatedDataRequest *)v11 passUniqueID];
  if ([(NPKProtoPassAssociatedDataRequest *)v11 hasPassRequestedData]) {
    uint64_t v13 = [(NPKProtoPassAssociatedDataRequest *)v11 passRequestedData];
  }
  else {
    uint64_t v13 = 8;
  }
  id v14 = pk_Sync_log();
  uint64_t v15 = v14;
  if (v12)
  {
    BOOL v16 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      int v17 = pk_Sync_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = NSStringFromNPKAssociatedPassData(v13);
        int v21 = 138412546;
        uint64_t v22 = v18;
        __int16 v23 = 2112;
        int v24 = v12;
        _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: associated pass data request:%@ for Pass with uniqueID:%@", (uint8_t *)&v21, 0x16u);
      }
    }
    [(NPKPassSyncService *)self handleRequestedAssociatedData:v13 forPassWithUniqueID:v12];
  }
  else
  {
    BOOL v19 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);

    if (v19)
    {
      uint64_t v20 = pk_Sync_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_ERROR, "Error: unexpected associated pass data request with nil uniqueID", (uint8_t *)&v21, 2u);
      }
    }
  }
}

- (void)passSyncEngine:(id)a3 sendStateChange:(id)a4
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!self->_dropAllMessages)
  {
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __53__NPKPassSyncService_passSyncEngine_sendStateChange___block_invoke;
    v33[3] = &unk_2644D29F8;
    v33[4] = self;
    uint64_t v10 = MEMORY[0x223C37380](v33);
    id v11 = [v7 passData];
    id v12 = [v7 protoPassSyncChange];
    uint64_t v13 = [(NPKPassSyncService *)self companionCatalogToSendWithStateChange];
    if (v13)
    {
      id v14 = objc_alloc_init(NPKProtoCatalog);
      uint64_t v15 = NPKSecureArchiveObject(v13);
      [(NPKProtoCatalog *)v14 setCatalogData:v15];

      [v12 setCompanionCatalog:v14];
    }
    BOOL v16 = [(NPKPassSyncService *)self watchCatalogToSendWithStateChange];
    if (v16)
    {
      int v17 = objc_alloc_init(NPKProtoCatalog);
      uint64_t v18 = NPKSecureArchiveObject(v16);
      [(NPKProtoCatalog *)v17 setCatalogData:v18];

      [v12 setWatchCatalog:v17];
    }
    BOOL v19 = (void *)MEMORY[0x223C37110]();
    uint64_t v20 = v19;
    if (v11)
    {
      if ((unint64_t)[v11 length] > 0x500000)
      {
LABEL_14:
        __int16 v23 = NPKSegmentsForLargePassDataNoCopy(v11, 0x400000uLL);
        uint64_t v27 = [v23 count];
        int v24 = pk_Sync_log();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

        if (v25)
        {
          uint64_t v26 = pk_Sync_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            int v35 = v27;
            _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: splitting state change into %u pieces", buf, 8u);
          }
        }
        v28[0] = MEMORY[0x263EF8330];
        v28[1] = 3221225472;
        v28[2] = __53__NPKPassSyncService_passSyncEngine_sendStateChange___block_invoke_153;
        v28[3] = &unk_2644D2A20;
        id v29 = v12;
        uint64_t v32 = v27;
        id v30 = v7;
        id v31 = (id)v10;
        [v23 enumerateObjectsUsingBlock:v28];

        goto LABEL_20;
      }
      int v21 = [v12 data];
      unint64_t v22 = [v21 length];

      if (v22 > 0x500000) {
        goto LABEL_14;
      }
    }
    else
    {
    }
    (*(void (**)(uint64_t, void *, __CFString *))(v10 + 16))(v10, v12, @"passSyncStateChange");
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  __int16 v8 = pk_Sync_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    uint64_t v10 = pk_Sync_log();
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "Warning: Dropping state change message", buf, 2u);
    }
    goto LABEL_21;
  }
LABEL_22:
}

void __53__NPKPassSyncService_passSyncEngine_sendStateChange___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v29[4] = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = (void *)MEMORY[0x223C37110]();
  id v8 = objc_alloc(MEMORY[0x263F4A228]);
  BOOL v9 = [v5 data];
  uint64_t v10 = (void *)[v8 initWithProtobufData:v9 type:40 isResponse:0];

  v28[0] = *MEMORY[0x263F49F80];
  id v11 = [NSNumber numberWithDouble:*MEMORY[0x263F4A150]];
  uint64_t v12 = *MEMORY[0x263F49EC0];
  v29[0] = v11;
  v29[1] = MEMORY[0x263EFFA88];
  uint64_t v13 = *MEMORY[0x263F49EB0];
  v28[1] = v12;
  v28[2] = v13;
  v28[3] = *MEMORY[0x263F49F60];
  v29[2] = MEMORY[0x263EFFA88];
  v29[3] = v6;
  id v14 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];

  uint64_t v15 = *(void **)(*(void *)(a1 + 32) + 24);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __53__NPKPassSyncService_passSyncEngine_sendStateChange___block_invoke_2;
  v22[3] = &unk_2644D29D0;
  id v16 = v5;
  id v23 = v16;
  int v17 = NPKProtoSendWithOptions(v15, v10, 200, 0, 0, v22, v14);
  uint64_t v18 = pk_Sync_log();
  BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

  if (v19)
  {
    uint64_t v20 = pk_Sync_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v16 npkDescription];
      *(_DWORD *)buf = 138412546;
      BOOL v25 = v17;
      __int16 v26 = 2112;
      uint64_t v27 = v21;
      _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent state change IDS message\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
    }
  }
}

void __53__NPKPassSyncService_passSyncEngine_sendStateChange___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = pk_Sync_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_Sync_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: Failed to send pass sync state change: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __53__NPKPassSyncService_passSyncEngine_sendStateChange___block_invoke_153(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) setPassData:a2];
  [*(id *)(a1 + 32) setPassSegmentIndex:a3];
  [*(id *)(a1 + 32) setPassSegmentTotal:*(unsigned int *)(a1 + 56)];
  uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", @"passSyncStateChange-%u", a3);
  int v6 = pk_Sync_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    uint64_t v8 = pk_Sync_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = [*(id *)(a1 + 40) changeUUID];
      *(_DWORD *)buf = 67109634;
      int v12 = a3;
      __int16 v13 = 1024;
      int v14 = v9;
      __int16 v15 = 2112;
      id v16 = v10;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sending state change IDS message for segment index %u (%u total segments)\n\tChange UUID: %@", buf, 0x18u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)passSyncEngine:(id)a3 sendStateChangeProcessedWithUUID:(id)a4 changeAccepted:(BOOL)a5 fullPassRequired:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  v33[4] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  if (!self->_dropAllMessages)
  {
    __int16 v15 = objc_alloc_init(NPKProtoPassSyncStateChangeProcessed);
    if (v11)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = 0;
      [v11 getUUIDBytes:buf];
      id v16 = [MEMORY[0x263EFF8F8] dataWithBytes:buf length:16];
      [(NPKProtoPassSyncStateChangeProcessed *)v15 setAcceptedChangeUUID:v16];
    }
    [(NPKProtoPassSyncStateChangeProcessed *)v15 setChangeAccepted:v7];
    [(NPKProtoPassSyncStateChangeProcessed *)v15 setFullPassRequired:v6];
    id v17 = objc_alloc(MEMORY[0x263F4A228]);
    uint64_t v18 = [(NPKProtoPassSyncStateChangeProcessed *)v15 data];
    BOOL v19 = (void *)[v17 initWithProtobufData:v18 type:41 isResponse:0];

    v32[0] = *MEMORY[0x263F49F80];
    uint64_t v20 = [NSNumber numberWithDouble:*MEMORY[0x263F4A150]];
    uint64_t v21 = *MEMORY[0x263F49EC0];
    v33[0] = v20;
    v33[1] = MEMORY[0x263EFFA88];
    uint64_t v22 = *MEMORY[0x263F49EB0];
    v32[1] = v21;
    v32[2] = v22;
    v32[3] = *MEMORY[0x263F49F60];
    v33[2] = MEMORY[0x263EFFA88];
    v33[3] = @"passSyncStateChangeProcessed";
    id v23 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];

    passSyncService = self->_passSyncService;
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __102__NPKPassSyncService_passSyncEngine_sendStateChangeProcessedWithUUID_changeAccepted_fullPassRequired___block_invoke;
    v29[3] = &unk_2644D29D0;
    int v14 = v15;
    id v30 = v14;
    BOOL v25 = NPKProtoSendWithOptions(passSyncService, v19, 200, 0, 0, v29, v23);
    __int16 v26 = pk_Sync_log();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

    if (v27)
    {
      id v28 = pk_Sync_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v14;
        _os_log_impl(&dword_21E92F000, v28, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent state change processed IDS message\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
      }
    }
    goto LABEL_12;
  }
  int v12 = pk_Sync_log();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

  if (v13)
  {
    int v14 = pk_Sync_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_DEFAULT, "Warning: Dropping state change processed message", buf, 2u);
    }
LABEL_12:
  }
}

void __102__NPKPassSyncService_passSyncEngine_sendStateChangeProcessedWithUUID_changeAccepted_fullPassRequired___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = pk_Sync_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_Sync_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: Failed to send pass sync change accepted: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)passSyncEngine:(id)a3 sendReconciledStateUnrecognizedWithHash:(id)a4 version:(unint64_t)a5 currentPassSyncState:(id)a6
{
  v37[4] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (!self->_dropAllMessages)
  {
    id v16 = objc_alloc_init(NPKProtoPassSyncReconciledStateUnrecognized);
    [(NPKProtoPassSyncReconciledStateUnrecognized *)v16 setUnrecognizedReconciledStateHash:v11];
    [(NPKProtoPassSyncReconciledStateUnrecognized *)v16 setUnrecognizedReconciledStateVersion:a5];
    id v17 = [v12 protoSyncState];
    [(NPKProtoPassSyncReconciledStateUnrecognized *)v16 setLibraryPassSyncState:v17];

    id v18 = objc_alloc(MEMORY[0x263F4A228]);
    BOOL v19 = [(NPKProtoPassSyncReconciledStateUnrecognized *)v16 data];
    uint64_t v20 = (void *)[v18 initWithProtobufData:v19 type:42 isResponse:0];

    v36[0] = *MEMORY[0x263F49F80];
    uint64_t v21 = [NSNumber numberWithDouble:*MEMORY[0x263F4A150]];
    uint64_t v22 = *MEMORY[0x263F49EC0];
    v37[0] = v21;
    v37[1] = MEMORY[0x263EFFA88];
    uint64_t v23 = *MEMORY[0x263F49EB0];
    v36[1] = v22;
    v36[2] = v23;
    v36[3] = *MEMORY[0x263F49F60];
    v37[2] = MEMORY[0x263EFFA88];
    v37[3] = @"passSyncReconciledStateUnrecognized";
    int v24 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];

    passSyncService = self->_passSyncService;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __106__NPKPassSyncService_passSyncEngine_sendReconciledStateUnrecognizedWithHash_version_currentPassSyncState___block_invoke;
    v30[3] = &unk_2644D29D0;
    __int16 v15 = v16;
    id v31 = v15;
    __int16 v26 = NPKProtoSendWithOptions(passSyncService, v20, 200, 0, 0, v30, v24);
    BOOL v27 = pk_Sync_log();
    BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);

    if (v28)
    {
      id v29 = pk_Sync_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v26;
        __int16 v34 = 2112;
        int v35 = v15;
        _os_log_impl(&dword_21E92F000, v29, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent reconciled state unrecognized IDS message\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
      }
    }
    goto LABEL_10;
  }
  BOOL v13 = pk_Sync_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

  if (v14)
  {
    __int16 v15 = pk_Sync_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Warning: Dropping reconciled state unrecognized message", buf, 2u);
    }
LABEL_10:
  }
}

void __106__NPKPassSyncService_passSyncEngine_sendReconciledStateUnrecognizedWithHash_version_currentPassSyncState___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = pk_Sync_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_Sync_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: Failed to send pass sync reconciled state unrecognized: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)passSyncEngine:(id)a3 sendProposedReconciledState:(id)a4
{
  void v32[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!self->_dropAllMessages)
  {
    id v11 = objc_alloc_init(NPKProtoPassSyncProposedReconciledState);
    id v12 = [v7 protoSyncState];
    [(NPKProtoPassSyncProposedReconciledState *)v11 setProposedReconciledState:v12];

    id v13 = objc_alloc(MEMORY[0x263F4A228]);
    BOOL v14 = [(NPKProtoPassSyncProposedReconciledState *)v11 data];
    __int16 v15 = (void *)[v13 initWithProtobufData:v14 type:43 isResponse:0];

    v31[0] = *MEMORY[0x263F49F80];
    id v16 = [NSNumber numberWithDouble:*MEMORY[0x263F4A150]];
    uint64_t v17 = *MEMORY[0x263F49EC0];
    v32[0] = v16;
    v32[1] = MEMORY[0x263EFFA88];
    uint64_t v18 = *MEMORY[0x263F49EB0];
    v31[1] = v17;
    v31[2] = v18;
    v31[3] = *MEMORY[0x263F49F60];
    v32[2] = MEMORY[0x263EFFA88];
    v32[3] = @"passSyncReconciledStateUnrecognized";
    BOOL v19 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];

    passSyncService = self->_passSyncService;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __65__NPKPassSyncService_passSyncEngine_sendProposedReconciledState___block_invoke;
    v25[3] = &unk_2644D29D0;
    id v10 = v11;
    __int16 v26 = v10;
    uint64_t v21 = NPKProtoSendWithOptions(passSyncService, v15, 200, 0, 0, v25, v19);
    uint64_t v22 = pk_Sync_log();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

    if (v23)
    {
      int v24 = pk_Sync_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        BOOL v28 = v21;
        __int16 v29 = 2112;
        id v30 = v10;
        _os_log_impl(&dword_21E92F000, v24, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent proposed reconciled state IDS message\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
      }
    }
    goto LABEL_10;
  }
  uint64_t v8 = pk_Sync_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Sync_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Warning: Dropping proposed reconciled state message", buf, 2u);
    }
LABEL_10:
  }
}

void __65__NPKPassSyncService_passSyncEngine_sendProposedReconciledState___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = pk_Sync_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_Sync_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: Failed to send pass sync proposed reconciled state message: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)passSyncEngine:(id)a3 sendReconciledStateAcceptedWithHash:(id)a4
{
  void v31[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!self->_dropAllMessages)
  {
    id v11 = objc_alloc_init(NPKProtoPassSyncReconciledStateAccepted);
    [(NPKProtoPassSyncReconciledStateAccepted *)v11 setReconciledStateHash:v7];
    id v12 = objc_alloc(MEMORY[0x263F4A228]);
    id v13 = [(NPKProtoPassSyncReconciledStateAccepted *)v11 data];
    BOOL v14 = (void *)[v12 initWithProtobufData:v13 type:44 isResponse:0];

    v30[0] = *MEMORY[0x263F49F80];
    __int16 v15 = [NSNumber numberWithDouble:*MEMORY[0x263F4A150]];
    uint64_t v16 = *MEMORY[0x263F49EC0];
    v31[0] = v15;
    v31[1] = MEMORY[0x263EFFA88];
    uint64_t v17 = *MEMORY[0x263F49EB0];
    v30[1] = v16;
    v30[2] = v17;
    v30[3] = *MEMORY[0x263F49F60];
    v31[2] = MEMORY[0x263EFFA88];
    v31[3] = @"passSyncStateChangeProcessed";
    uint64_t v18 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];

    passSyncService = self->_passSyncService;
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __73__NPKPassSyncService_passSyncEngine_sendReconciledStateAcceptedWithHash___block_invoke;
    v24[3] = &unk_2644D29D0;
    id v10 = v11;
    BOOL v25 = v10;
    uint64_t v20 = NPKProtoSendWithOptions(passSyncService, v14, 200, 0, 0, v24, v18);
    uint64_t v21 = pk_Sync_log();
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

    if (v22)
    {
      BOOL v23 = pk_Sync_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        BOOL v27 = v20;
        __int16 v28 = 2112;
        __int16 v29 = v10;
        _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: sent reconciled state accepted IDS message\n\tMessage ID: %@\n\tProtobuf: %@", buf, 0x16u);
      }
    }
    goto LABEL_10;
  }
  uint64_t v8 = pk_Sync_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Sync_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Warning: Dropping reconciled state accepted message", buf, 2u);
    }
LABEL_10:
  }
}

void __73__NPKPassSyncService_passSyncEngine_sendReconciledStateAcceptedWithHash___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v2 = pk_Sync_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    id v4 = pk_Sync_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: Failed to send pass sync reconciled state accepted: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (void)passSyncEngineStateChanged:(id)a3
{
  id v4 = pk_Sync_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (v5)
  {
    int v6 = pk_Sync_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v9 = 0;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: got pass sync engine state changed", v9, 2u);
    }
  }
  passSyncEngineArchiveTimer = self->_passSyncEngineArchiveTimer;
  dispatch_time_t v8 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(passSyncEngineArchiveTimer, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)passSyncEngine:(id)a3 receivedStateChangeProcessed:(id)a4 changeAccepted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v7 = a4;
  dispatch_time_t v8 = pk_Sync_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    id v10 = pk_Sync_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v7;
      __int16 v14 = 1024;
      BOOL v15 = v5;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: received state change processed delegate method invoked\n\tChange: %@\n\tAccepted: %d", (uint8_t *)&v12, 0x12u);
    }
  }
  if (![v7 changeType])
  {
    id v11 = [v7 uniqueID];
    [(NPKPassSyncService *)self handleSettingsChanged:[(NPKPassSyncService *)self settingsForPassWithUniqueID:v11] forPassWithUniqueID:v11];
  }
}

- (void)passSyncEngine:(id)a3 finishedProcessingChange:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  int v6 = pk_Sync_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    dispatch_time_t v8 = pk_Sync_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: finished processing change delegate method invoked\n\tChange: %@", buf, 0xCu);
    }
  }
  passSyncQueue = self->_passSyncQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__NPKPassSyncService_passSyncEngine_finishedProcessingChange___block_invoke;
  block[3] = &unk_2644D2910;
  block[4] = self;
  dispatch_async(passSyncQueue, block);
}

uint64_t __62__NPKPassSyncService_passSyncEngine_finishedProcessingChange___block_invoke(uint64_t a1)
{
  v2 = pk_Sync_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);

  if (v3)
  {
    id v4 = pk_Sync_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass sync service: syncing when appropriate following change processed", v6, 2u);
    }
  }
  return [*(id *)(a1 + 32) _provideUpdatedLibraryStateToSyncEngineAndSyncIfNecessary:1];
}

- (void)passSyncEngine:(id)a3 requestsAddPassData:(id)a4 forSyncStateItem:(id)a5 completion:(id)a6
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

  if (v7)
  {
    dispatch_time_t v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446722;
      id v10 = "-[NPKPassSyncService passSyncEngine:requestsAddPassData:forSyncStateItem:completion:]";
      __int16 v11 = 2082;
      id v12 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      __int16 v13 = 2048;
      uint64_t v14 = 686;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v9, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (void)passSyncEngine:(id)a3 requestsUpdatePassData:(id)a4 forSyncStateItem:(id)a5 baseManifestHashForPartialUpdate:(id)a6 remoteAssetsForPartialUpdate:(id)a7 completion:(id)a8
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dispatch_time_t v8 = pk_General_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);

  if (v9)
  {
    id v10 = pk_General_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446722;
      id v12 = "-[NPKPassSyncService passSyncEngine:requestsUpdatePassData:forSyncStateItem:baseManifestHashForPartialUpdate"
            ":remoteAssetsForPartialUpdate:completion:]";
      __int16 v13 = 2082;
      uint64_t v14 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      __int16 v15 = 2048;
      uint64_t v16 = 691;
      _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v11, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (void)passSyncEngine:(id)a3 requestsRemovePassWithUniqueID:(id)a4 completion:(id)a5
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);

  if (v6)
  {
    BOOL v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136446722;
      BOOL v9 = "-[NPKPassSyncService passSyncEngine:requestsRemovePassWithUniqueID:completion:]";
      __int16 v10 = 2082;
      int v11 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      __int16 v12 = 2048;
      uint64_t v13 = 696;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v8, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (id)passSyncEngine:(id)a3 partialDataForPassWithUniqueID:(id)a4 baseManifest:(id)a5 outRemoteAssets:(id *)a6
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v6 = pk_General_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);

  if (v7)
  {
    int v8 = pk_General_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446722;
      __int16 v10 = "-[NPKPassSyncService passSyncEngine:partialDataForPassWithUniqueID:baseManifest:outRemoteAssets:]";
      __int16 v11 = 2082;
      __int16 v12 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      __int16 v13 = 2048;
      uint64_t v14 = 703;
      _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v9, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (id)passSyncEngine:(id)a3 dataForPassWithUniqueID:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      int v8 = "-[NPKPassSyncService passSyncEngine:dataForPassWithUniqueID:]";
      __int16 v9 = 2082;
      __int16 v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      __int16 v11 = 2048;
      uint64_t v12 = 709;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v7, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (id)passSyncEngineNeedsUpdatedPassLibraryState:(id)a3
{
  return [(NPKPassSyncService *)self currentLibraryPassSyncStateWithReconciledState:0];
}

- (void)handleRequestedAssociatedData:(unint64_t)a3 forPassWithUniqueID:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = pk_General_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);

  if (v5)
  {
    BOOL v6 = pk_General_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446722;
      int v8 = "-[NPKPassSyncService handleRequestedAssociatedData:forPassWithUniqueID:]";
      __int16 v9 = 2082;
      __int16 v10 = "/Library/Caches/com.apple.xbs/Sources/NanoPassbook_Frameworks/NanoPassKit/NPKPassSyncService.m";
      __int16 v11 = 2048;
      uint64_t v12 = 719;
      _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_ERROR, "Error: *** NPKAssertion failure in %{public}s, %{public}s:%ld (reason: Subclasses must override)", (uint8_t *)&v7, 0x20u);
    }
  }
  _NPKAssertAbort();
}

- (void)_provideUpdatedLibraryStateToSyncEngineAndSyncIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_passSyncQueue);
  unint64_t v5 = +[NPKPassSyncState minRemoteDevicePassSyncStateVersionSupport];
  BOOL v6 = +[NPKOSTransaction transactionWithName:@"provide updated libray state"];
  int v7 = [(NPKPassSyncEngine *)self->_passSyncEngine reconciledState];
  int v8 = [(NPKPassSyncService *)self currentLibraryPassSyncStateWithReconciledState:v7];
  __int16 v9 = [v8 passSyncStateWithVersion:v5];
  __int16 v10 = [(NPKPassSyncEngine *)self->_passSyncEngine libraryState];
  __int16 v11 = pk_Sync_log();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);

  if (v12)
  {
    uint64_t v13 = pk_Sync_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = "no";
      if (v3) {
        uint64_t v14 = "yes";
      }
      int v27 = 138412546;
      __int16 v28 = v9;
      __int16 v29 = 2080;
      id v30 = v14;
      _os_log_impl(&dword_21E92F000, v13, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Providing updated library state\n\tSync state: %@\n\tWill sync if necessary: %s", (uint8_t *)&v27, 0x16u);
    }
  }
  [(NPKPassSyncEngine *)self->_passSyncEngine setLibraryState:v9];
  [(NPKPassSyncEngine *)self->_passSyncEngine setMinSyncStateVersion:v5];
  if (v3)
  {
    if ([v9 diffWithBaselineState:v10 representsMaterialDifferenceFromState:v7])
    {
      uint64_t v15 = [(NPKPassSyncEngine *)self->_passSyncEngine processingChange];
      if (!v15)
      {
LABEL_12:
        uint64_t v18 = pk_Sync_log();
        BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

        if (v19)
        {
          uint64_t v20 = pk_Sync_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v27) = 0;
            _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: requesting sync when appropriate following update to library state", (uint8_t *)&v27, 2u);
          }
        }
        [(NPKPassSyncService *)self _syncWhenAppropriate];
        goto LABEL_26;
      }
      uint64_t v16 = (void *)v15;
      uint64_t v17 = [v7 passSyncStateByApplyingChange:v15];
      if ([v9 diffWithBaselineState:v10 representsMaterialDifferenceFromState:v17])
      {

        goto LABEL_12;
      }
      int v24 = pk_Sync_log();
      BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

      if (v25)
      {
        __int16 v26 = pk_Sync_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_21E92F000, v26, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Not syncing after providing updated library state, since change is already accounted for in processing change on top of reconciled state", (uint8_t *)&v27, 2u);
        }
      }
    }
    else
    {
      uint64_t v21 = pk_Sync_log();
      BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        BOOL v23 = pk_Sync_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_21E92F000, v23, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Not syncing after providing updated library state, since change is already accounted for in reconciled state", (uint8_t *)&v27, 2u);
        }
      }
    }
  }
LABEL_26:
  [v6 invalidate];
}

- (void)_archiveTimerFired
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_passSyncQueue);
  BOOL v3 = pk_Sync_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    unint64_t v5 = pk_Sync_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Archive timer fired; writing pass sync engine archive to disk",
        buf,
        2u);
    }
  }
  BOOL v6 = +[NPKOSTransaction transactionWithName:@"Archive timer"];
  int v7 = NPKSecureArchiveObject(self->_passSyncEngine);
  int v8 = NPKPassSyncEngineArchivePath();
  id v13 = 0;
  [v7 writeToFile:v8 options:1 error:&v13];
  id v9 = v13;

  if (v9)
  {
    __int16 v10 = pk_Sync_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);

    if (v11)
    {
      BOOL v12 = pk_Sync_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v9;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_ERROR, "Error: Pass sync service: unable to write pass sync engine archive to disk\n\tError: %@", buf, 0xCu);
      }
    }
  }
  [v6 invalidate];
}

- (void)_syncWhenAppropriate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_passSyncQueue);
  passSyncStatus = self->_passSyncStatus;
  BOOL v4 = [(NPKPassSyncEngine *)self->_passSyncEngine processingChange];
  unint64_t v5 = [(NPKPassSyncEngine *)self->_passSyncEngine candidateChange];
  BOOL v6 = [MEMORY[0x263EFF910] date];
  BOOL v7 = [(NPKPassSyncServiceSyncStatus *)passSyncStatus shouldSyncWithCurrentIncomingChange:v4 currentOutgoingChange:v5 currentDate:v6];

  int v8 = pk_Sync_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v7)
  {
    if (v9)
    {
      __int16 v10 = pk_Sync_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Syncing immediately while appropriate", buf, 2u);
      }
    }
    [(NPKPassSyncService *)self _syncNow];
  }
  else
  {
    if (v9)
    {
      BOOL v11 = pk_Sync_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v12 = 0;
        _os_log_impl(&dword_21E92F000, v11, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Setting sync timer because syncing now is not appropriate", v12, 2u);
      }
    }
    [(NPKPassSyncService *)self _ensureSyncTimerIsSet];
  }
}

- (void)_syncNow
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_passSyncQueue);
  id v3 = +[NPKOSTransaction transactionWithName:@"Sync now"];
  [(NPKPassSyncServiceSyncStatus *)self->_passSyncStatus reset];
  [(NPKPassSyncEngine *)self->_passSyncEngine syncIfNecessary];
  [v3 invalidate];
}

- (void)_ensureSyncTimerIsSet
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_passSyncQueue);
  passSyncEngineSyncTimer = self->_passSyncEngineSyncTimer;
  BOOL v4 = pk_Sync_log();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);

  if (passSyncEngineSyncTimer)
  {
    if (v5)
    {
      BOOL v6 = pk_Sync_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v6, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Sync timer is already set", buf, 2u);
      }
    }
  }
  else
  {
    if (v5)
    {
      BOOL v7 = pk_Sync_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v14 = 0x404E000000000000;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Pass sync service: Setting timer for %.2f seconds before syncing", buf, 0xCu);
      }
    }
    int v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_passSyncQueue);
    dispatch_time_t v9 = dispatch_time(0, 0xDF8476000);
    dispatch_source_set_timer(v8, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak((id *)buf, self);
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __43__NPKPassSyncService__ensureSyncTimerIsSet__block_invoke;
    handler[3] = &unk_2644D29A8;
    objc_copyWeak(&v12, (id *)buf);
    dispatch_source_set_event_handler(v8, handler);
    dispatch_resume(v8);
    __int16 v10 = self->_passSyncEngineSyncTimer;
    self->_passSyncEngineSyncTimer = (OS_dispatch_source *)v8;

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

void __43__NPKPassSyncService__ensureSyncTimerIsSet__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _syncTimerFired];
}

- (void)_syncTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_passSyncQueue);
  passSyncEngineSyncTimer = self->_passSyncEngineSyncTimer;
  if (passSyncEngineSyncTimer)
  {
    dispatch_source_cancel(passSyncEngineSyncTimer);
    BOOL v4 = self->_passSyncEngineSyncTimer;
    self->_passSyncEngineSyncTimer = 0;
  }
  [(NPKPassSyncService *)self _syncWhenAppropriate];
}

- (id)_archivedPassSyncEngine
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFF8F8];
  id v3 = NPKPassSyncEngineArchivePath();
  id v12 = 0;
  BOOL v4 = [v2 dataWithContentsOfFile:v3 options:0 error:&v12];
  id v5 = v12;

  if (v5)
  {
    BOOL v6 = pk_Sync_log();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);

    if (v7)
    {
      int v8 = pk_Sync_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v14 = v5;
        _os_log_impl(&dword_21E92F000, v8, OS_LOG_TYPE_DEFAULT, "Warning: Pass sync service: Unable to read pass sync engine archive. This is expected in the case of a fresh device install.\n\tError: %@", buf, 0xCu);
      }
    }
    dispatch_time_t v9 = 0;
  }
  else
  {
    __int16 v10 = objc_opt_class();
    dispatch_time_t v9 = NPKSecureUnarchiveObject(v4, v10);
  }

  return v9;
}

- (BOOL)dropAllMessages
{
  return self->_dropAllMessages;
}

- (void)setDropAllMessages:(BOOL)a3
{
  self->_dropAllMessages = a3;
}

- (NPKPassSyncEngine)passSyncEngine
{
  return self->_passSyncEngine;
}

- (void)setPassSyncEngine:(id)a3
{
}

- (IDSService)passSyncService
{
  return self->_passSyncService;
}

- (void)setPassSyncService:(id)a3
{
}

- (OS_dispatch_queue)passSyncQueue
{
  return self->_passSyncQueue;
}

- (void)setPassSyncQueue:(id)a3
{
}

- (OS_dispatch_source)passSyncEngineArchiveTimer
{
  return self->_passSyncEngineArchiveTimer;
}

- (void)setPassSyncEngineArchiveTimer:(id)a3
{
}

- (OS_dispatch_source)passSyncEngineSyncTimer
{
  return self->_passSyncEngineSyncTimer;
}

- (void)setPassSyncEngineSyncTimer:(id)a3
{
}

- (NPKPassSyncServiceSyncStatus)passSyncStatus
{
  return self->_passSyncStatus;
}

- (void)setPassSyncStatus:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passSyncStatus, 0);
  objc_storeStrong((id *)&self->_passSyncEngineSyncTimer, 0);
  objc_storeStrong((id *)&self->_passSyncEngineArchiveTimer, 0);
  objc_storeStrong((id *)&self->_passSyncQueue, 0);
  objc_storeStrong((id *)&self->_passSyncService, 0);
  objc_storeStrong((id *)&self->_passSyncEngine, 0);
}

@end