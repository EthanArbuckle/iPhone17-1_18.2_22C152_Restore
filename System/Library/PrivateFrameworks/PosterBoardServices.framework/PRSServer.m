@interface PRSServer
- (PRSServer)init;
- (PRSServerDelegate)delegate;
- (id)fetchActivePosterForRole:(id)a3 error:(id *)a4;
- (void)_queue_addConnection:(id)a3;
- (void)_queue_removeConnection:(id)a3;
- (void)activate;
- (void)associateConfigurationMatchingUUID:(id)a3 focusModeActivityUUID:(id)a4 completion:(id)a5;
- (void)clearMigrationFlags:(id)a3;
- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 role:(id)a5 completion:(id)a6;
- (void)deleteArchivedDataStoreNamed:(id)a3 completion:(id)a4;
- (void)deleteDataStoreWithCompletion:(id)a3;
- (void)deleteHostConfigurationForRole:(id)a3 completion:(id)a4;
- (void)deletePosterConfigurationsMatchingUUID:(id)a3 completion:(id)a4;
- (void)deletePosterDescriptorsForExtension:(id)a3 completion:(id)a4;
- (void)deleteSnapshots:(id)a3 completion:(id)a4;
- (void)deleteTransientDataWithCompletion:(id)a3;
- (void)exportArchivedDataStoreNamed:(id)a3 completion:(id)a4;
- (void)exportCurrentDataStoreToURL:(id)a3 options:(id)a4 sandboxToken:(id)a5 error:(id *)a6;
- (void)exportPosterConfigurationMatchingUUID:(id)a3 completion:(id)a4;
- (void)fetchActivePosterForRole:(id)a3 completion:(id)a4;
- (void)fetchArchivedDataStoreNamesWithCompletion:(id)a3;
- (void)fetchAssociatedHomeScreenPosterConfigurationUUID:(id)a3 completion:(id)a4;
- (void)fetchChargerIdentifierRelationshipsWithCompletion:(id)a3;
- (void)fetchContentCutoutBoundsForPosterConfiguration:(id)a3 orientation:(id)a4 completion:(id)a5;
- (void)fetchContentObstructionBoundsForPosterConfiguration:(id)a3 orientation:(id)a4 completion:(id)a5;
- (void)fetchExtensionIdentifiersWithCompletion:(id)a3;
- (void)fetchFocusUUIDForConfiguration:(id)a3 completion:(id)a4;
- (void)fetchGallery:(id)a3;
- (void)fetchLimitedOcclusionBoundsForPosterConfiguration:(id)a3 orientation:(id)a4 completion:(id)a5;
- (void)fetchMaximalContentCutoutBoundsForOrientation:(id)a3 completion:(id)a4;
- (void)fetchObscurableBoundsForPosterConfiguration:(id)a3 orientation:(id)a4 completion:(id)a5;
- (void)fetchPosterConfigurationsForExtension:(id)a3 completion:(id)a4;
- (void)fetchPosterConfigurationsForRole:(id)a3 completion:(id)a4;
- (void)fetchPosterDescriptorsForExtension:(id)a3 completion:(id)a4;
- (void)fetchPosterSnapshotsWithRequest:(id)a3 completion:(id)a4;
- (void)fetchRuntimeAssertionState:(id)a3;
- (void)fetchSelectedPosterForRole:(id)a3 completion:(id)a4;
- (void)fetchStaticPosterDescriptorsForExtension:(id)a3 completion:(id)a4;
- (void)gatherDataFreshnessState:(id)a3;
- (void)ignoreExtension:(id)a3 completion:(id)a4;
- (void)importPosterConfigurationFromArchiveData:(id)a3 completion:(id)a4;
- (void)ingestSnapshotCollection:(id)a3 forPosterConfigurationUUID:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)invalidateDataStoreWithCompletion:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)notePosterConfigurationUnderlyingModelDidChange:(id)a3;
- (void)notifyActiveChargerIdentifierDidUpdate:(id)a3 completion:(id)a4;
- (void)notifyAvailableFocusModesDidChange:(id)a3 completion:(id)a4;
- (void)notifyFocusModeDidChange:(id)a3 completion:(id)a4;
- (void)notifyPosterBoardOfApplicationUpdatesWithCompletion:(id)a3;
- (void)overnightUpdateWithCompletion:(id)a3;
- (void)prewarmWithCompletion:(id)a3;
- (void)pushPosterGalleryUpdate:(id)a3 completion:(id)a4;
- (void)pushToProactiveWithCompletion:(id)a3;
- (void)refreshPosterConfigurationMatchingUUID:(id)a3 sessionInfo:(id)a4 completion:(id)a5;
- (void)refreshPosterDescriptorsForExtension:(id)a3 sessionInfo:(id)a4 completion:(id)a5;
- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:(id)a3 extensionIdentifier:(id)a4 completion:(id)a5;
- (void)refreshSnapshotForPosterConfigurationMatchUUID:(id)a3 completion:(id)a4;
- (void)removeAllFocusConfigurationsMatchingFocusUUID:(id)a3 completion:(id)a4;
- (void)resetRole:(id)a3 completion:(id)a4;
- (void)restoreArchivedDataStoreNamed:(id)a3 backupExistingDataStore:(id)a4 completion:(id)a5;
- (void)retrieveGallery:(id)a3;
- (void)runMigration:(id)a3 migrationDescriptor:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setHostConfiguration:(id)a3 forRole:(id)a4 completion:(id)a5;
- (void)stashCurrentDataStoreWithName:(id)a3 options:(id)a4 completion:(id)a5;
- (void)terminate;
- (void)triggerMessedUpDataProtectionWithCompletion:(id)a3;
- (void)unignoreExtension:(id)a3 completion:(id)a4;
- (void)updatePosterConfiguration:(id)a3 updates:(id)a4 completion:(id)a5;
- (void)updatePosterConfigurationMatchingUUID:(id)a3 updates:(id)a4 completion:(id)a5;
- (void)updateToSelectedPosterMatchingUUID:(id)a3 role:(id)a4 completion:(id)a5;
@end

@implementation PRSServer

- (PRSServer)init
{
  v14.receiver = self;
  v14.super_class = (Class)PRSServer;
  v2 = [(PRSServer *)&v14 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.posterboardservices.Server.queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (void *)MEMORY[0x1E4F50BC8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __17__PRSServer_init__block_invoke;
    v12[3] = &unk_1E5D00A68;
    v6 = v2;
    v13 = v6;
    uint64_t v7 = [v5 listenerWithConfigurator:v12];
    connectionListener = v6->_connectionListener;
    v6->_connectionListener = (BSServiceConnectionListener *)v7;

    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    connections = v6->_connections;
    v6->_connections = (NSMutableArray *)v9;
  }
  return v2;
}

void __17__PRSServer_init__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [v5 setDomain:@"com.apple.posterboardservices"];
  dispatch_queue_t v3 = PRSServiceInterface();
  v4 = [v3 identifier];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 32)];
}

- (void)invalidate
{
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__PRSServer_listener_didReceiveConnection_withContext___block_invoke;
  v15[3] = &unk_1E5D00AB8;
  v15[4] = self;
  [v6 configureConnection:v15];
  uint64_t v7 = [v6 remoteProcess];
  v8 = [v7 bundleIdentifier];
  if (([v7 hasEntitlement:@"com.apple.posterboardservices.data-store"] & 1) != 0
    || [v8 isEqualToString:@"com.apple.migrationpluginwrapper"])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__PRSServer_listener_didReceiveConnection_withContext___block_invoke_9;
    block[3] = &unk_1E5D00978;
    block[4] = self;
    id v10 = v6;
    id v14 = v10;
    dispatch_async(queue, block);
    v11 = PRSLogCommon();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v10;
      _os_log_impl(&dword_1A78AC000, v11, OS_LOG_TYPE_DEFAULT, "PRSServer received connection: %{public}@", buf, 0xCu);
    }

    [v10 activate];
  }
  else
  {
    v12 = PRSLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v6;
      _os_log_impl(&dword_1A78AC000, v12, OS_LOG_TYPE_DEFAULT, "PRSServer rejected connection: %{public}@", buf, 0xCu);
    }

    [v6 invalidate];
  }
}

void __55__PRSServer_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = PRSDefaultServiceQuality();
  [v3 setServiceQuality:v4];

  id v5 = PRSServiceInterface();
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PRSServer_listener_didReceiveConnection_withContext___block_invoke_2;
  v6[3] = &unk_1E5D00A90;
  v6[4] = *(void *)(a1 + 32);
  [v3 setInvalidationHandler:v6];
  [v3 setTargetQueue:*(void *)(*(void *)(a1 + 32) + 8)];
}

void __55__PRSServer_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PRSLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    id v6 = v3;
    _os_log_impl(&dword_1A78AC000, v4, OS_LOG_TYPE_DEFAULT, "PRSServer received connection invalidation: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_queue_removeConnection:", v3);
}

uint64_t __55__PRSServer_listener_didReceiveConnection_withContext___block_invoke_9(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addConnection:", *(void *)(a1 + 40));
}

- (void)_queue_addConnection:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = PRSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_DEFAULT, "Adding Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableArray *)self->_connections addObject:v4];
}

- (void)_queue_removeConnection:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = PRSLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_DEFAULT, "Removing Connection: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NSMutableArray *)self->_connections removeObject:v4];
}

- (void)activate
{
}

- (void)deleteDataStoreWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  int v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    v11 = "-[PRSServer deleteDataStoreWithCompletion:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  int v6 = [MEMORY[0x1E4F50BA0] currentContext];
  id v7 = [v6 remoteProcess];
  char v8 = [v7 hasEntitlement:@"com.apple.posterboardservices.data-store.deleteDataStore"];

  if (v8)
  {
    uint64_t v9 = [(PRSServer *)self delegate];
    [v9 server:self deleteDataStoreWithCompletion:v4];
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v4[2](v4, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)triggerMessedUpDataProtectionWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  int v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    v11 = "-[PRSServer triggerMessedUpDataProtectionWithCompletion:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  int v6 = [MEMORY[0x1E4F50BA0] currentContext];
  id v7 = [v6 remoteProcess];
  if ([v7 hasEntitlement:@"com.apple.posterboardservices.data-store.deleteDataStore"])
  {
    char v8 = MEMORY[0x1AD0D2860]("-[PRSServer triggerMessedUpDataProtectionWithCompletion:]");

    if (v8)
    {
      uint64_t v9 = [(PRSServer *)self delegate];
      [v9 server:self triggerMessedUpDataProtectionWithCompletion:v4];
LABEL_9:

      goto LABEL_10;
    }
  }
  else
  {
  }
  if (v4)
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v4[2](v4, v9);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)resetRole:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  char v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    id v14 = "-[PRSServer resetRole:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F50BA0] currentContext];
  int v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.deleteDataStore"];

  if (v11)
  {
    uint64_t v12 = [(PRSServer *)self delegate];
    [v12 server:self resetRole:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)invalidateDataStoreWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  int v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    char v11 = "-[PRSServer invalidateDataStoreWithCompletion:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F50BA0] currentContext];
  id v7 = [v6 remoteProcess];
  char v8 = [v7 hasEntitlement:@"com.apple.posterboardservices.data-store.deleteDataStore"];

  if (v8)
  {
    uint64_t v9 = [(PRSServer *)self delegate];
    [v9 server:self invalidateDataStoreWithCompletion:v4];
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v4[2](v4, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)terminate
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = PRSLogPosterContents();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    id v7 = "-[PRSServer terminate]";
    _os_log_impl(&dword_1A78AC000, v2, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v6, 0xCu);
  }

  id v3 = [MEMORY[0x1E4F50BA0] currentContext];
  id v4 = [v3 remoteProcess];
  char v5 = [v4 hasEntitlement:@"com.apple.posterboardservices.data-store.deleteDataStore"];

  if (v5) {
    exit(0);
  }
}

- (void)setHostConfiguration:(id)a3 forRole:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *))a5;
  int v10 = [MEMORY[0x1E4F50BA0] currentContext];
  char v11 = [v10 remoteProcess];
  char v12 = [v11 hasEntitlement:@"com.apple.posterboardservices.host.configuration"];

  if (v12)
  {
    int v13 = [(PRSServer *)self delegate];
    [v13 server:self setHostConfiguration:v14 forRole:v8 completion:v9];
  }
  else
  {
    if (!v9) {
      goto LABEL_6;
    }
    int v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v9[2](v9, v13);
  }

LABEL_6:
}

- (void)deleteHostConfigurationForRole:(id)a3 completion:(id)a4
{
  id v11 = a3;
  int v6 = (void (**)(id, void *))a4;
  id v7 = [MEMORY[0x1E4F50BA0] currentContext];
  id v8 = [v7 remoteProcess];
  char v9 = [v8 hasEntitlement:@"com.apple.posterboardservices.host.configuration"];

  if (v9)
  {
    int v10 = [(PRSServer *)self delegate];
    [v10 server:self deleteHostConfigurationForRole:v11 completion:v6];
  }
  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    int v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v6[2](v6, v10);
  }

LABEL_6:
}

- (void)fetchExtensionIdentifiersWithCompletion:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    int v10 = "-[PRSServer fetchExtensionIdentifiersWithCompletion:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (v4)
  {
    int v6 = [(PRSServer *)self delegate];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __53__PRSServer_fetchExtensionIdentifiersWithCompletion___block_invoke;
    v7[3] = &unk_1E5D00AE0;
    id v8 = v4;
    [v6 server:self fetchExtensionIdentifiersWithCompletion:v7];
  }
}

uint64_t __53__PRSServer_fetchExtensionIdentifiersWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchPosterDescriptorsForExtension:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  char v9 = PRSLogPosterContents();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[PRSServer fetchPosterDescriptorsForExtension:completion:]";
    _os_log_impl(&dword_1A78AC000, v9, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (v8)
  {
    int v10 = [MEMORY[0x1E4F50BA0] currentContext];
    uint64_t v11 = [v10 remoteProcess];
    char v12 = [v11 auditToken];

    int v13 = [(PRSServer *)self delegate];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __59__PRSServer_fetchPosterDescriptorsForExtension_completion___block_invoke;
    v15[3] = &unk_1E5D00B08;
    id v16 = v12;
    SEL v18 = a2;
    id v17 = v8;
    id v14 = v12;
    [v13 server:self fetchPosterDescriptorsForExtension:v7 completion:v15];
  }
}

void __59__PRSServer_fetchPosterDescriptorsForExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v18 = a3;
  int v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        uint64_t v13 = *(void *)(a1 + 32);
        id v20 = 0;
        id v14 = [v12 extendContentsReadAccessToAuditToken:v13 error:&v20];
        id v15 = v20;
        if (v15)
        {
          id v16 = PRSLogPosterContents();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v19 = NSStringFromSelector(*(SEL *)(a1 + 48));
            *(_DWORD *)buf = 138412802;
            v26 = v19;
            __int16 v27 = 2112;
            id v28 = v15;
            __int16 v29 = 2112;
            v30 = v12;
            _os_log_error_impl(&dword_1A78AC000, v16, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);
          }
        }
        if (v14) {
          id v17 = v14;
        }
        else {
          id v17 = v12;
        }
        [v6 addObject:v17];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchStaticPosterDescriptorsForExtension:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = PRSLogPosterContents();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v20 = "-[PRSServer fetchStaticPosterDescriptorsForExtension:completion:]";
    _os_log_impl(&dword_1A78AC000, v9, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (v8)
  {
    uint64_t v10 = [MEMORY[0x1E4F50BA0] currentContext];
    uint64_t v11 = [v10 remoteProcess];
    char v12 = [v11 auditToken];

    uint64_t v13 = [(PRSServer *)self delegate];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __65__PRSServer_fetchStaticPosterDescriptorsForExtension_completion___block_invoke;
    v15[3] = &unk_1E5D00B08;
    id v16 = v12;
    SEL v18 = a2;
    id v17 = v8;
    id v14 = v12;
    [v13 server:self fetchStaticPosterDescriptorsForExtension:v7 completion:v15];
  }
}

void __65__PRSServer_fetchStaticPosterDescriptorsForExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v18 = a3;
  int v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        uint64_t v13 = *(void *)(a1 + 32);
        id v20 = 0;
        id v14 = [v12 extendContentsReadAccessToAuditToken:v13 error:&v20];
        id v15 = v20;
        if (v15)
        {
          id v16 = PRSLogPosterContents();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v19 = NSStringFromSelector(*(SEL *)(a1 + 48));
            *(_DWORD *)buf = 138412802;
            v26 = v19;
            __int16 v27 = 2112;
            id v28 = v15;
            __int16 v29 = 2112;
            v30 = v12;
            _os_log_error_impl(&dword_1A78AC000, v16, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);
          }
        }
        if (v14) {
          id v17 = v14;
        }
        else {
          id v17 = v12;
        }
        [v6 addObject:v17];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)refreshPosterDescriptorsForExtension:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  char v12 = PRSLogPosterContents();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v24 = "-[PRSServer refreshPosterDescriptorsForExtension:sessionInfo:completion:]";
    _os_log_impl(&dword_1A78AC000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (v9)
  {
    uint64_t v13 = [MEMORY[0x1E4F50BA0] currentContext];
    id v14 = [v13 remoteProcess];
    id v15 = [v14 auditToken];

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __73__PRSServer_refreshPosterDescriptorsForExtension_sessionInfo_completion___block_invoke;
    v19[3] = &unk_1E5D00B08;
    id v20 = v15;
    SEL v22 = a2;
    id v21 = v9;
    id v16 = v15;
    id v17 = (void *)MEMORY[0x1AD0D2EC0](v19);
  }
  else
  {
    id v17 = &__block_literal_global_7;
  }
  id v18 = [(PRSServer *)self delegate];
  [v18 server:self refreshPosterDescriptorsForExtension:v11 sessionInfo:v10 completion:v17];
}

void __73__PRSServer_refreshPosterDescriptorsForExtension_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v18 = a3;
  int v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        uint64_t v13 = *(void *)(a1 + 32);
        id v20 = 0;
        id v14 = [v12 extendContentsReadAccessToAuditToken:v13 error:&v20];
        id v15 = v20;
        if (v15)
        {
          id v16 = PRSLogPosterContents();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v19 = NSStringFromSelector(*(SEL *)(a1 + 48));
            *(_DWORD *)buf = 138412802;
            v26 = v19;
            __int16 v27 = 2112;
            id v28 = v15;
            __int16 v29 = 2112;
            v30 = v12;
            _os_log_error_impl(&dword_1A78AC000, v16, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);
          }
        }
        if (v14) {
          id v17 = v14;
        }
        else {
          id v17 = v12;
        }
        [v6 addObject:v17];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)deletePosterDescriptorsForExtension:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[PRSServer deletePosterDescriptorsForExtension:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  uint64_t v9 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.deleteDescriptors"];

  if (v11)
  {
    char v12 = [(PRSServer *)self delegate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __60__PRSServer_deletePosterDescriptorsForExtension_completion___block_invoke;
    v14[3] = &unk_1E5D00B50;
    id v15 = v7;
    [v12 server:self deletePosterDescriptorsForExtension:v6 completion:v14];

    uint64_t v13 = v15;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __60__PRSServer_deletePosterDescriptorsForExtension_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)pushToProactiveWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    char v11 = "-[PRSServer pushToProactiveWithCompletion:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  id v6 = [(PRSServer *)self delegate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__PRSServer_pushToProactiveWithCompletion___block_invoke;
  v8[3] = &unk_1E5D00B50;
  id v9 = v4;
  id v7 = v4;
  [v6 server:self pushToProactiveWithCompletion:v8];
}

uint64_t __43__PRSServer_pushToProactiveWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)pushPosterGalleryUpdate:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[PRSServer pushPosterGalleryUpdate:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  id v9 = [(PRSServer *)self delegate];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __48__PRSServer_pushPosterGalleryUpdate_completion___block_invoke;
  v11[3] = &unk_1E5D00B50;
  id v12 = v6;
  id v10 = v6;
  [v9 server:self pushPosterGalleryUpdate:v7 completion:v11];
}

uint64_t __48__PRSServer_pushPosterGalleryUpdate_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)fetchGallery:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    char v11 = "-[PRSServer fetchGallery:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  id v6 = [(PRSServer *)self delegate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __26__PRSServer_fetchGallery___block_invoke;
  v8[3] = &unk_1E5D00B78;
  id v9 = v4;
  id v7 = v4;
  [v6 server:self fetchGallery:v8];
}

uint64_t __26__PRSServer_fetchGallery___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a5);
  }
  return result;
}

- (void)retrieveGallery:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    char v11 = "-[PRSServer retrieveGallery:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  id v6 = [(PRSServer *)self delegate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __29__PRSServer_retrieveGallery___block_invoke;
  v8[3] = &unk_1E5D00B78;
  id v9 = v4;
  id v7 = v4;
  [v6 server:self retrieveGallery:v8];
}

uint64_t __29__PRSServer_retrieveGallery___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a5);
  }
  return result;
}

- (void)createPosterConfigurationForProviderIdentifier:(id)a3 posterDescriptorIdentifier:(id)a4 role:(id)a5 completion:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = PRSLogPosterContents();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v27 = "-[PRSServer createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:]";
    _os_log_impl(&dword_1A78AC000, v15, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (v11)
  {
    id v16 = [MEMORY[0x1E4F50BA0] currentContext];
    id v17 = [v16 remoteProcess];
    uint64_t v18 = [v17 auditToken];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __103__PRSServer_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke;
    v22[3] = &unk_1E5D00BA0;
    id v23 = v18;
    SEL v25 = a2;
    id v24 = v11;
    id v19 = v18;
    id v20 = (void *)MEMORY[0x1AD0D2EC0](v22);
  }
  else
  {
    id v20 = &__block_literal_global_20;
  }
  long long v21 = [(PRSServer *)self delegate];
  [v21 server:self createPosterConfigurationForProviderIdentifier:v14 posterDescriptorIdentifier:v13 role:v12 completion:v20];
}

void __103__PRSServer_createPosterConfigurationForProviderIdentifier_posterDescriptorIdentifier_role_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v13 = 0;
  uint64_t v8 = [v5 extendContentsReadAccessToAuditToken:v7 error:&v13];
  id v9 = v13;
  if (v9)
  {
    id v10 = PRSLogPosterContents();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412802;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_1A78AC000, v10, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);
    }
  }
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = v5;
  }
  (*(void (**)(void, id, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v11, v6);
}

- (void)deletePosterConfigurationsMatchingUUID:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[PRSServer deletePosterConfigurationsMatchingUUID:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F50BA0] currentContext];
  id v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.deleteDescriptors"];

  if (v11)
  {
    id v12 = [(PRSServer *)self delegate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__PRSServer_deletePosterConfigurationsMatchingUUID_completion___block_invoke;
    v14[3] = &unk_1E5D00B50;
    id v15 = v7;
    [v12 server:self deletePosterConfigurationsMatchingUUID:v6 completion:v14];

    id v13 = v15;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    id v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v13);
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __63__PRSServer_deletePosterConfigurationsMatchingUUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)exportPosterConfigurationMatchingUUID:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    id v14 = "-[PRSServer exportPosterConfigurationMatchingUUID:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F50BA0] currentContext];
  id v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.accessSwitcherConfiguration"];

  if (v11)
  {
    id v12 = [(PRSServer *)self delegate];
    [v12 server:self exportPosterConfigurationMatchingUUID:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v7[2](v7, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)importPosterConfigurationFromArchiveData:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    id v14 = "-[PRSServer importPosterConfigurationFromArchiveData:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F50BA0] currentContext];
  id v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v11)
  {
    id v12 = [(PRSServer *)self delegate];
    [v12 server:self importPosterConfigurationFromArchiveData:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v7[2](v7, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)fetchSelectedPosterForRole:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  uint64_t v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    id v14 = "-[PRSServer fetchSelectedPosterForRole:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F50BA0] currentContext];
  id v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.accessSwitcherConfiguration"];

  if (v11)
  {
    id v12 = [(PRSServer *)self delegate];
    [v12 server:self fetchSelectedPosterForRole:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v7[2](v7, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)fetchActivePosterForRole:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[PRSServer fetchActivePosterForRole:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F50BA0] currentContext];
  id v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.accessSwitcherConfiguration"];

  if (v11)
  {
    id v12 = [(PRSServer *)self delegate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __49__PRSServer_fetchActivePosterForRole_completion___block_invoke;
    v14[3] = &unk_1E5D00BE8;
    id v15 = v7;
    [v12 server:self fetchActivePosterForRole:v6 completion:v14];

    int v13 = v15;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    int v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v13);
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __49__PRSServer_fetchActivePosterForRole_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)fetchActivePosterForRole:(id)a3 error:(id *)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = PRSLogPosterContents();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    id v15 = "-[PRSServer fetchActivePosterForRole:error:]";
    _os_log_impl(&dword_1A78AC000, v7, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v14, 0xCu);
  }

  uint64_t v8 = [MEMORY[0x1E4F50BA0] currentContext];
  id v9 = [v8 remoteProcess];
  char v10 = [v9 hasEntitlement:@"com.apple.posterboardservices.data-store.accessSwitcherConfiguration"];

  if (v10)
  {
    char v11 = [(PRSServer *)self delegate];
    id v12 = [v11 server:self fetchActivePosterForRole:v6 error:a4];
  }
  else if (a4)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    id v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (void)updateToSelectedPosterMatchingUUID:(id)a3 role:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = (void (**)(id, void *))a5;
  char v11 = PRSLogPosterContents();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v19 = 136315138;
    uint64_t v20 = "-[PRSServer updateToSelectedPosterMatchingUUID:role:completion:]";
    _os_log_impl(&dword_1A78AC000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v19, 0xCu);
  }

  id v12 = [MEMORY[0x1E4F50BA0] currentContext];
  int v13 = [v12 remoteProcess];
  char v14 = [v13 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v14)
  {
    id v15 = [MEMORY[0x1E4F50BA0] currentContext];
    uint64_t v16 = [v15 remoteProcess];
    id v17 = [v16 bundleIdentifier];

    uint64_t v18 = [(PRSServer *)self delegate];
    [v18 server:self updateToSelectedConfigurationMatchingUUID:v8 role:v9 from:v17 completion:v10];

LABEL_7:
    goto LABEL_8;
  }
  if (v10)
  {
    id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v10[2](v10, v17);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)fetchPosterConfigurationsForRole:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = PRSLogPosterContents();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v23 = "-[PRSServer fetchPosterConfigurationsForRole:completion:]";
    _os_log_impl(&dword_1A78AC000, v9, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  char v10 = [MEMORY[0x1E4F50BA0] currentContext];
  char v11 = [v10 remoteProcess];
  char v12 = [v11 hasEntitlement:@"com.apple.posterboardservices.data-store.accessSwitcherConfiguration"];

  if (v12)
  {
    if (v8)
    {
      int v13 = [MEMORY[0x1E4F50BA0] currentContext];
      char v14 = [v13 remoteProcess];
      id v15 = [v14 auditToken];

      uint64_t v16 = [(PRSServer *)self delegate];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __57__PRSServer_fetchPosterConfigurationsForRole_completion___block_invoke;
      v18[3] = &unk_1E5D00B08;
      id v19 = v15;
      SEL v21 = a2;
      id v20 = v8;
      id v17 = v15;
      [v16 server:self fetchPosterConfigurationsForRole:v7 completion:v18];

LABEL_8:
    }
  }
  else if (v8)
  {
    id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v17);
    goto LABEL_8;
  }
}

void __57__PRSServer_fetchPosterConfigurationsForRole_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v18 = a3;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        uint64_t v13 = *(void *)(a1 + 32);
        id v20 = 0;
        char v14 = [v12 extendContentsReadAccessToAuditToken:v13 error:&v20];
        id v15 = v20;
        if (v15)
        {
          uint64_t v16 = PRSLogPosterContents();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v19 = NSStringFromSelector(*(SEL *)(a1 + 48));
            *(_DWORD *)buf = 138412802;
            v26 = v19;
            __int16 v27 = 2112;
            id v28 = v15;
            __int16 v29 = 2112;
            v30 = v12;
            _os_log_error_impl(&dword_1A78AC000, v16, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);
          }
        }
        if (v14) {
          id v17 = v14;
        }
        else {
          id v17 = v12;
        }
        [v6 addObject:v17];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchPosterConfigurationsForExtension:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = PRSLogPosterContents();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    long long v23 = "-[PRSServer fetchPosterConfigurationsForExtension:completion:]";
    _os_log_impl(&dword_1A78AC000, v9, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  uint64_t v10 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v11 = [v10 remoteProcess];
  char v12 = [v11 hasEntitlement:@"com.apple.posterboardservices.data-store.accessSwitcherConfiguration"];

  if (v12)
  {
    if (v8)
    {
      uint64_t v13 = [MEMORY[0x1E4F50BA0] currentContext];
      char v14 = [v13 remoteProcess];
      id v15 = [v14 auditToken];

      uint64_t v16 = [(PRSServer *)self delegate];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __62__PRSServer_fetchPosterConfigurationsForExtension_completion___block_invoke;
      v18[3] = &unk_1E5D00B08;
      id v19 = v15;
      SEL v21 = a2;
      id v20 = v8;
      id v17 = v15;
      [v16 server:self fetchPosterConfigurationsForExtension:v7 completion:v18];

LABEL_8:
    }
  }
  else if (v8)
  {
    id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    (*((void (**)(id, void, id))v8 + 2))(v8, 0, v17);
    goto LABEL_8;
  }
}

void __62__PRSServer_fetchPosterConfigurationsForExtension_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v18 = a3;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
        uint64_t v13 = *(void *)(a1 + 32);
        id v20 = 0;
        char v14 = [v12 extendContentsReadAccessToAuditToken:v13 error:&v20];
        id v15 = v20;
        if (v15)
        {
          uint64_t v16 = PRSLogPosterContents();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            id v19 = NSStringFromSelector(*(SEL *)(a1 + 48));
            *(_DWORD *)buf = 138412802;
            v26 = v19;
            __int16 v27 = 2112;
            id v28 = v15;
            __int16 v29 = 2112;
            v30 = v12;
            _os_log_error_impl(&dword_1A78AC000, v16, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);
          }
        }
        if (v14) {
          id v17 = v14;
        }
        else {
          id v17 = v12;
        }
        [v6 addObject:v17];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v9);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)fetchPosterSnapshotsWithRequest:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    char v14 = "-[PRSServer fetchPosterSnapshotsWithRequest:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  uint64_t v9 = [(PRSServer *)self delegate];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PRSServer_fetchPosterSnapshotsWithRequest_completion___block_invoke;
  v11[3] = &unk_1E5D00C10;
  id v12 = v6;
  id v10 = v6;
  [v9 server:self fetchPosterSnapshotsWithRequest:v7 completion:v11];
}

uint64_t __56__PRSServer_fetchPosterSnapshotsWithRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refreshPosterConfigurationMatchingUUID:(id)a3 sessionInfo:(id)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = PRSLogPosterContents();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v27 = "-[PRSServer refreshPosterConfigurationMatchingUUID:sessionInfo:completion:]";
    _os_log_impl(&dword_1A78AC000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  uint64_t v13 = [MEMORY[0x1E4F50BA0] currentContext];
  char v14 = [v13 remoteProcess];
  char v15 = [v14 hasEntitlement:@"com.apple.posterboardservices.data-store.refreshConfigurations"];

  if (v15)
  {
    if (v11)
    {
      uint64_t v16 = [MEMORY[0x1E4F50BA0] currentContext];
      id v17 = [v16 remoteProcess];
      id v18 = [v17 auditToken];

      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __75__PRSServer_refreshPosterConfigurationMatchingUUID_sessionInfo_completion___block_invoke;
      v22[3] = &unk_1E5D00BA0;
      id v23 = v18;
      SEL v25 = a2;
      id v24 = v11;
      id v19 = v18;
      id v20 = (void *)MEMORY[0x1AD0D2EC0](v22);
    }
    else
    {
      id v20 = &__block_literal_global_25;
    }
    long long v21 = [(PRSServer *)self delegate];
    [v21 server:self refreshPosterConfigurationMatchingUUID:v9 sessionInfo:v10 completion:v20];

    goto LABEL_10;
  }
  if (v11)
  {
    id v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    (*((void (**)(id, void, void *))v11 + 2))(v11, 0, v20);
LABEL_10:
  }
}

void __75__PRSServer_refreshPosterConfigurationMatchingUUID_sessionInfo_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v13 = 0;
  uint64_t v8 = [v5 extendContentsReadAccessToAuditToken:v7 error:&v13];
  id v9 = v13;
  if (v9)
  {
    id v10 = PRSLogPosterContents();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v12 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412802;
      char v15 = v12;
      __int16 v16 = 2112;
      id v17 = v9;
      __int16 v18 = 2112;
      id v19 = v5;
      _os_log_error_impl(&dword_1A78AC000, v10, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);
    }
  }
  if (v8) {
    id v11 = v8;
  }
  else {
    id v11 = v5;
  }
  (*(void (**)(void, id, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v11, v6);
}

- (void)associateConfigurationMatchingUUID:(id)a3 focusModeActivityUUID:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = PRSLogPosterContents();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315138;
    id v17 = "-[PRSServer associateConfigurationMatchingUUID:focusModeActivityUUID:completion:]";
    _os_log_impl(&dword_1A78AC000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v16, 0xCu);
  }

  id v12 = [MEMORY[0x1E4F50BA0] currentContext];
  id v13 = [v12 remoteProcess];
  char v14 = [v13 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v14)
  {
    char v15 = [(PRSServer *)self delegate];
    [v15 server:self associateConfigurationMatchingUUID:v8 focusModeActivityUUID:v9 completion:v10];
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    char v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v10[2](v10, v15);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)notePosterConfigurationUnderlyingModelDidChange:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    id v11 = "-[PRSServer notePosterConfigurationUnderlyingModelDidChange:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F50BA0] currentContext];
  uint64_t v7 = [v6 remoteProcess];
  int v8 = [v7 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v8)
  {
    id v9 = [(PRSServer *)self delegate];
    [v9 server:self notePosterConfigurationUnderlyingModelDidChange:v4];
  }
}

- (void)refreshSnapshotForPosterConfigurationMatchUUID:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  int v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    char v14 = "-[PRSServer refreshSnapshotForPosterConfigurationMatchUUID:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F50BA0] currentContext];
  int v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.refreshConfigurationSnapshot"];

  if (v11)
  {
    uint64_t v12 = [(PRSServer *)self delegate];
    [v12 server:self refreshSnapshotForPosterConfigurationMatchUUID:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)ingestSnapshotCollection:(id)a3 forPosterConfigurationUUID:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = PRSLogPosterContents();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "-[PRSServer ingestSnapshotCollection:forPosterConfigurationUUID:completion:]";
    _os_log_impl(&dword_1A78AC000, v11, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  uint64_t v12 = [MEMORY[0x1E4F50BA0] currentContext];
  int v13 = [v12 remoteProcess];
  char v14 = [v13 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v14)
  {
    uint64_t v15 = [(PRSServer *)self delegate];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __76__PRSServer_ingestSnapshotCollection_forPosterConfigurationUUID_completion___block_invoke;
    v17[3] = &unk_1E5D00B50;
    id v18 = v10;
    [v15 server:self ingestSnapshotCollection:v8 forPosterConfigurationUUID:v9 completion:v17];

    int v16 = v18;
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    int v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    (*((void (**)(id, void *))v10 + 2))(v10, v16);
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __76__PRSServer_ingestSnapshotCollection_forPosterConfigurationUUID_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchFocusUUIDForConfiguration:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  uint64_t v7 = [MEMORY[0x1E4F50BA0] currentContext];
  id v8 = [v7 remoteProcess];
  char v9 = [v8 hasEntitlement:@"com.apple.posterboardservices.data-store.accessSwitcherFocusConfiguration"];

  if (v9)
  {
    id v10 = [(PRSServer *)self delegate];
    [v10 server:self fetchFocusUUIDForConfiguration:v11 completion:v6];
  }
  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v6[2](v6, 0, v10);
  }

LABEL_6:
}

- (void)removeAllFocusConfigurationsMatchingFocusUUID:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void *))a4;
  uint64_t v7 = [MEMORY[0x1E4F50BA0] currentContext];
  id v8 = [v7 remoteProcess];
  char v9 = [v8 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherFocusConfiguration"];

  if (v9)
  {
    id v10 = [(PRSServer *)self delegate];
    [v10 server:self removeAllFocusConfigurationsMatchingFocusUUID:v11 completion:v6];
  }
  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v6[2](v6, v10);
  }

LABEL_6:
}

- (void)fetchContentObstructionBoundsForPosterConfiguration:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(PRSServer *)self delegate];
  uint64_t v11 = [v9 integerValue];

  [v12 server:self fetchContentObstructionBoundsForPosterConfiguration:v10 orientation:v11 completion:v8];
}

- (void)fetchMaximalContentCutoutBoundsForOrientation:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(PRSServer *)self delegate];
  uint64_t v8 = [v7 integerValue];

  [v9 server:self fetchMaximalContentCutoutBoundsForOrientation:v8 completion:v6];
}

- (void)fetchContentCutoutBoundsForPosterConfiguration:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(PRSServer *)self delegate];
  uint64_t v11 = [v9 integerValue];

  [v12 server:self fetchContentCutoutBoundsForPosterConfiguration:v10 orientation:v11 completion:v8];
}

- (void)fetchObscurableBoundsForPosterConfiguration:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(PRSServer *)self delegate];
  uint64_t v11 = [v9 integerValue];

  [v12 server:self fetchObscurableBoundsForPosterConfiguration:v10 orientation:v11 completion:v8];
}

- (void)fetchLimitedOcclusionBoundsForPosterConfiguration:(id)a3 orientation:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(PRSServer *)self delegate];
  uint64_t v11 = [v9 integerValue];

  [v12 server:self fetchLimitedOcclusionBoundsForPosterConfiguration:v10 orientation:v11 completion:v8];
}

- (void)refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:(id)a3 extensionIdentifier:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  uint64_t v11 = PRSLogPosterContents();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315138;
    id v17 = "-[PRSServer refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:extensionIdentifier:completion:]";
    _os_log_impl(&dword_1A78AC000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v16, 0xCu);
  }

  id v12 = [MEMORY[0x1E4F50BA0] currentContext];
  int v13 = [v12 remoteProcess];
  char v14 = [v13 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v14)
  {
    uint64_t v15 = [(PRSServer *)self delegate];
    [v15 server:self refreshSnapshotForGalleryItemsMatchingDescriptorIdentifier:v8 extensionIdentifier:v9 completion:v10];
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v10[2](v10, v15);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)notifyActiveChargerIdentifierDidUpdate:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    char v14 = "-[PRSServer notifyActiveChargerIdentifierDidUpdate:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F50BA0] currentContext];
  id v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v11)
  {
    id v12 = [(PRSServer *)self delegate];
    [v12 server:self notifyActiveChargerIdentifierDidUpdate:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)notifyFocusModeDidChange:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    char v14 = "-[PRSServer notifyFocusModeDidChange:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F50BA0] currentContext];
  id v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v11)
  {
    id v12 = [(PRSServer *)self delegate];
    [v12 server:self notifyFocusModeDidChange:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)notifyAvailableFocusModesDidChange:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    char v14 = "-[PRSServer notifyAvailableFocusModesDidChange:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F50BA0] currentContext];
  id v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v11)
  {
    id v12 = [(PRSServer *)self delegate];
    [v12 server:self notifyAvailableFocusModesDidChange:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)prewarmWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    char v11 = "-[PRSServer prewarmWithCompletion:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F50BA0] currentContext];
  id v7 = [v6 remoteProcess];
  char v8 = [v7 hasEntitlement:@"com.apple.posterboardservices.data-store.accessSwitcherConfiguration"];

  if (v8)
  {
    id v9 = [(PRSServer *)self delegate];
    [v9 server:self prewarmWithCompletion:v4];
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v4[2](v4, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)overnightUpdateWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    char v11 = "-[PRSServer overnightUpdateWithCompletion:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F50BA0] currentContext];
  id v7 = [v6 remoteProcess];
  char v8 = [v7 hasEntitlement:@"com.apple.posterboardservices.data-store.accessSwitcherConfiguration"];

  if (v8)
  {
    id v9 = [(PRSServer *)self delegate];
    [v9 server:self overnightUpdateWithCompletion:v4];
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v4[2](v4, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)gatherDataFreshnessState:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    char v11 = "-[PRSServer gatherDataFreshnessState:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F50BA0] currentContext];
  id v7 = [v6 remoteProcess];
  char v8 = [v7 hasEntitlement:@"com.apple.posterboardservices.data-store.accessSwitcherConfiguration"];

  if (v8)
  {
    id v9 = [(PRSServer *)self delegate];
    [v9 server:self gatherDataFreshnessState:v4];
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v4[2](v4, 0, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)deleteTransientDataWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    char v11 = "-[PRSServer deleteTransientDataWithCompletion:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F50BA0] currentContext];
  id v7 = [v6 remoteProcess];
  char v8 = [v7 hasEntitlement:@"com.apple.posterboardservices.data-store.accessSwitcherConfiguration"];

  if (v8)
  {
    id v9 = [(PRSServer *)self delegate];
    [v9 server:self deleteTransientDataWithCompletion:v4];
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v4[2](v4, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)deleteSnapshots:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  char v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    char v14 = "-[PRSServer deleteSnapshots:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F50BA0] currentContext];
  int v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v11)
  {
    uint64_t v12 = [(PRSServer *)self delegate];
    objc_msgSend(v12, "server:deleteSnapshots:completion:", self, objc_msgSend(v6, "BOOLValue"), v7);
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)notifyPosterBoardOfApplicationUpdatesWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  id v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    char v11 = "-[PRSServer notifyPosterBoardOfApplicationUpdatesWithCompletion:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F50BA0] currentContext];
  id v7 = [v6 remoteProcess];
  char v8 = [v7 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v8)
  {
    id v9 = [(PRSServer *)self delegate];
    [v9 server:self notifyPosterBoardOfApplicationUpdatesWithCompletion:v4];
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v4[2](v4, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)fetchRuntimeAssertionState:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    char v11 = "-[PRSServer fetchRuntimeAssertionState:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F50BA0] currentContext];
  id v7 = [v6 remoteProcess];
  char v8 = [v7 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v8)
  {
    id v9 = [(PRSServer *)self delegate];
    [v9 server:self fetchRuntimeAssertionState:v4];
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v4[2](v4, 0, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)fetchChargerIdentifierRelationshipsWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    char v11 = "-[PRSServer fetchChargerIdentifierRelationshipsWithCompletion:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F50BA0] currentContext];
  id v7 = [v6 remoteProcess];
  if ([v7 hasEntitlement:@"com.apple.posterboardservices.data-store.accessSwitcherConfiguration"])
  {
    char v8 = MEMORY[0x1AD0D2860]("-[PRSServer fetchChargerIdentifierRelationshipsWithCompletion:]");

    if (v8)
    {
      id v9 = [(PRSServer *)self delegate];
      [v9 server:self fetchChargerIdentifierRelationshipsWithCompletion:v4];
LABEL_9:

      goto LABEL_10;
    }
  }
  else
  {
  }
  if (v4)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v4[2](v4, 0, v9);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)fetchAssociatedHomeScreenPosterConfigurationUUID:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  char v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    char v14 = "-[PRSServer fetchAssociatedHomeScreenPosterConfigurationUUID:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F50BA0] currentContext];
  int v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.accessSwitcherConfiguration"];

  if (v11)
  {
    uint64_t v12 = [(PRSServer *)self delegate];
    [v12 server:self fetchAssociatedHomeScreenPosterConfigurationUUID:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v7[2](v7, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)updatePosterConfigurationMatchingUUID:(id)a3 updates:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = PRSLogPosterContents();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v29 = "-[PRSServer updatePosterConfigurationMatchingUUID:updates:completion:]";
    _os_log_impl(&dword_1A78AC000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  int v13 = [MEMORY[0x1E4F50BA0] currentContext];
  char v14 = [v13 remoteProcess];
  char v15 = [v14 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v15)
  {
    int v16 = [MEMORY[0x1E4F50BA0] currentContext];
    id v17 = [v16 remoteProcess];
    char v18 = [v17 hasEntitlement:@"com.apple.posterboardservices.data-store.refreshConfigurations"];

    if (v18)
    {
      id v19 = [MEMORY[0x1E4F50BA0] currentContext];
      uint64_t v20 = [v19 remoteProcess];
      uint64_t v21 = [v20 auditToken];

      long long v22 = [(PRSServer *)self delegate];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __70__PRSServer_updatePosterConfigurationMatchingUUID_updates_completion___block_invoke;
      v24[3] = &unk_1E5D00C38;
      id v25 = v21;
      id v26 = v11;
      SEL v27 = a2;
      id v23 = v21;
      [v22 server:self updatePosterConfigurationMatchingUUID:v9 updates:v10 completion:v24];

LABEL_8:
      goto LABEL_9;
    }
  }
  if (v11)
  {
    id v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v23);
    goto LABEL_8;
  }
LABEL_9:
}

void __70__PRSServer_updatePosterConfigurationMatchingUUID_updates_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v15 = 0;
    id v10 = [v7 extendContentsReadAccessToAuditToken:v9 error:&v15];
    id v11 = v15;
    if (v11)
    {
      uint64_t v12 = PRSLogPosterContents();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        char v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 138412802;
        id v17 = v14;
        __int16 v18 = 2112;
        id v19 = v11;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_error_impl(&dword_1A78AC000, v12, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);
      }
    }
    if (v10) {
      id v13 = v10;
    }
    else {
      id v13 = v7;
    }
    (*(void (**)(void, id, id, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v13, v8, 0);
  }
}

- (void)updatePosterConfiguration:(id)a3 updates:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = PRSLogPosterContents();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v29 = "-[PRSServer updatePosterConfiguration:updates:completion:]";
    _os_log_impl(&dword_1A78AC000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  id v13 = [MEMORY[0x1E4F50BA0] currentContext];
  char v14 = [v13 remoteProcess];
  char v15 = [v14 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v15)
  {
    int v16 = [MEMORY[0x1E4F50BA0] currentContext];
    id v17 = [v16 remoteProcess];
    char v18 = [v17 hasEntitlement:@"com.apple.posterboardservices.data-store.refreshConfigurations"];

    if (v18)
    {
      id v19 = [MEMORY[0x1E4F50BA0] currentContext];
      __int16 v20 = [v19 remoteProcess];
      id v21 = [v20 auditToken];

      uint64_t v22 = [(PRSServer *)self delegate];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __58__PRSServer_updatePosterConfiguration_updates_completion___block_invoke;
      v24[3] = &unk_1E5D00C38;
      id v25 = v21;
      id v26 = v11;
      SEL v27 = a2;
      id v23 = v21;
      [v22 server:self updatePosterConfiguration:v9 updates:v10 completion:v24];

LABEL_8:
      goto LABEL_9;
    }
  }
  if (v11)
  {
    id v23 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    (*((void (**)(id, void, void, id))v11 + 2))(v11, 0, 0, v23);
    goto LABEL_8;
  }
LABEL_9:
}

void __58__PRSServer_updatePosterConfiguration_updates_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 32);
    id v15 = 0;
    id v10 = [v7 extendContentsReadAccessToAuditToken:v9 error:&v15];
    id v11 = v15;
    if (v11)
    {
      uint64_t v12 = PRSLogPosterContents();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        char v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
        *(_DWORD *)buf = 138412802;
        id v17 = v14;
        __int16 v18 = 2112;
        id v19 = v11;
        __int16 v20 = 2112;
        id v21 = v7;
        _os_log_error_impl(&dword_1A78AC000, v12, OS_LOG_TYPE_ERROR, "sandbox extension did error in %@ : error=%@ poster=%@", buf, 0x20u);
      }
    }
    if (v10) {
      id v13 = v10;
    }
    else {
      id v13 = v7;
    }
    (*(void (**)(void, id, id, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v13, v8, 0);
  }
}

- (void)runMigration:(id)a3 migrationDescriptor:(id)a4 completion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  id v11 = PRSLogPosterContents();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v24 = "-[PRSServer runMigration:migrationDescriptor:completion:]";
    _os_log_impl(&dword_1A78AC000, v11, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  uint64_t v12 = [MEMORY[0x1E4F50BA0] currentContext];
  id v13 = [v12 remoteProcess];

  char v14 = [v13 bundleIdentifier];
  if (([v13 hasEntitlement:@"com.apple.posterboardservices.data-store.migration"] & 1) != 0
    || ([(__CFString *)v14 isEqualToString:@"com.apple.migrationpluginwrapper"] & 1) != 0)
  {
    id v15 = [(PRSServer *)self delegate];
    objc_msgSend(v15, "server:runMigration:migrationDescriptor:completion:", self, objc_msgSend(v8, "BOOLValue"), v9, v10);
  }
  else
  {
    if (!v10) {
      goto LABEL_7;
    }
    int v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F281F8];
    uint64_t v20 = *MEMORY[0x1E4F28588];
    id v21 = @"bundleIdentifier";
    __int16 v18 = @"(null)";
    if (v14) {
      __int16 v18 = v14;
    }
    v22[0] = @"Process not allowed to run migration.";
    v22[1] = v18;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v20 count:2];
    id v19 = objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, -1, v15, v20, v21);
    v10[2](v10, v19);
  }
LABEL_7:
}

- (void)clearMigrationFlags:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    char v14 = "-[PRSServer clearMigrationFlags:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F50BA0] currentContext];
  id v7 = [v6 remoteProcess];
  char v8 = [v7 hasEntitlement:@"com.apple.posterboardservices.data-store.migration"];

  if (v8)
  {
    id v9 = [(PRSServer *)self delegate];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__PRSServer_clearMigrationFlags___block_invoke;
    v11[3] = &unk_1E5D00C60;
    id v12 = v4;
    [v9 server:self clearMigrationFlags:v11];

    id v10 = v12;
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, MEMORY[0x1E4F1CC28], v10);
    goto LABEL_7;
  }
LABEL_8:
}

void __33__PRSServer_clearMigrationFlags___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = (void *)MEMORY[0x1E4F28ED0];
  id v6 = a3;
  id v7 = [v5 numberWithBool:a2];
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

- (void)ignoreExtension:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  char v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    char v14 = "-[PRSServer ignoreExtension:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F50BA0] currentContext];
  id v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v11)
  {
    id v12 = [(PRSServer *)self delegate];
    [v12 server:self ignoreExtension:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)unignoreExtension:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  char v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    char v14 = "-[PRSServer unignoreExtension:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F50BA0] currentContext];
  id v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.mutateSwitcherConfiguration"];

  if (v11)
  {
    id v12 = [(PRSServer *)self delegate];
    [v12 server:self unignoreExtension:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)fetchArchivedDataStoreNamesWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void, void *))a3;
  id v5 = PRSLogPosterContents();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315138;
    char v11 = "-[PRSServer fetchArchivedDataStoreNamesWithCompletion:]";
    _os_log_impl(&dword_1A78AC000, v5, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v10, 0xCu);
  }

  id v6 = [MEMORY[0x1E4F50BA0] currentContext];
  id v7 = [v6 remoteProcess];
  char v8 = [v7 hasEntitlement:@"com.apple.posterboardservices.data-store.archiveDataStore"];

  if (v8)
  {
    id v9 = [(PRSServer *)self delegate];
    [v9 server:self fetchArchivedDataStoreNamesWithCompletion:v4];
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    id v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v4[2](v4, 0, v9);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)restoreArchivedDataStoreNamed:(id)a3 backupExistingDataStore:(id)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void *))a5;
  char v11 = PRSLogPosterContents();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v17 = 136315138;
    __int16 v18 = "-[PRSServer restoreArchivedDataStoreNamed:backupExistingDataStore:completion:]";
    _os_log_impl(&dword_1A78AC000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v12 = [MEMORY[0x1E4F50BA0] currentContext];
  int v13 = [v12 remoteProcess];
  char v14 = [v13 hasEntitlement:@"com.apple.posterboardservices.data-store.archiveDataStore"];

  if (v14)
  {
    uint64_t v15 = [(PRSServer *)self delegate];
    if (v9) {
      int v16 = v9;
    }
    else {
      int v16 = (void *)MEMORY[0x1E4F1CC38];
    }
    objc_msgSend(v15, "server:restoreArchivedDataStoreNamed:backupExistingDataStore:completion:", self, v8, objc_msgSend(v16, "BOOLValue"), v10);
    goto LABEL_10;
  }
  if (v10)
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v10[2](v10, v15);
LABEL_10:
  }
}

- (void)stashCurrentDataStoreWithName:(id)a3 options:(id)a4 completion:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, void *))a5;
  char v11 = PRSLogPosterContents();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315138;
    int v17 = "-[PRSServer stashCurrentDataStoreWithName:options:completion:]";
    _os_log_impl(&dword_1A78AC000, v11, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v12 = [MEMORY[0x1E4F50BA0] currentContext];
  int v13 = [v12 remoteProcess];
  char v14 = [v13 hasEntitlement:@"com.apple.posterboardservices.data-store.archiveDataStore"];

  if (v14)
  {
    uint64_t v15 = [(PRSServer *)self delegate];
    [v15 server:self stashCurrentDataStoreWithName:v8 options:v9 completion:v10];
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v10[2](v10, v15);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)deleteArchivedDataStoreNamed:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  id v8 = PRSLogPosterContents();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315138;
    char v14 = "-[PRSServer deleteArchivedDataStoreNamed:completion:]";
    _os_log_impl(&dword_1A78AC000, v8, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [MEMORY[0x1E4F50BA0] currentContext];
  int v10 = [v9 remoteProcess];
  char v11 = [v10 hasEntitlement:@"com.apple.posterboardservices.data-store.archiveDataStore"];

  if (v11)
  {
    uint64_t v12 = [(PRSServer *)self delegate];
    [v12 server:self deleteArchivedDataStoreNamed:v6 completion:v7];
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v7[2](v7, v12);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)exportArchivedDataStoreNamed:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  id v7 = [MEMORY[0x1E4F50BA0] currentContext];
  id v8 = [v7 remoteProcess];
  char v9 = [v8 hasEntitlement:@"com.apple.posterboardservices.data-store.archiveDataStore"];

  if (v9)
  {
    int v10 = [(PRSServer *)self delegate];
    [v10 server:self exportArchivedDataStoreNamed:v11 completion:v6];
  }
  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    int v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
    v6[2](v6, 0, v10);
  }

LABEL_6:
}

- (void)exportCurrentDataStoreToURL:(id)a3 options:(id)a4 sandboxToken:(id)a5 error:(id *)a6
{
  id v16 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [MEMORY[0x1E4F50BA0] currentContext];
  int v13 = [v12 remoteProcess];
  char v14 = [v13 hasEntitlement:@"com.apple.posterboardservices.data-store.archiveDataStore"];

  if (v14)
  {
    uint64_t v15 = [(PRSServer *)self delegate];
    [v15 server:self exportCurrentDataStoreToURL:v16 options:v10 sandboxToken:v11 error:a6];
  }
  else
  {
    *a6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:-1 userInfo:0];
  }
}

- (PRSServerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRSServerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionListener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end