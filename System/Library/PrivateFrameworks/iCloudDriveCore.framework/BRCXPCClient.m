@interface BRCXPCClient
- (BOOL)_canCreateAppLibraryWithID:(id)a3 error:(id *)a4;
- (BOOL)_entitlementBooleanValueForKey:(id)a3;
- (BOOL)_hasAccessToAppLibraryID:(id)a3 error:(id *)a4;
- (BOOL)_hasPrivateIPCEntitlementForSelector:(SEL)a3 error:(id *)a4;
- (BOOL)_isAppLibraryProxyEntitled;
- (BOOL)_isAppLibraryProxyWithError:(id *)a3;
- (BOOL)_isAutomationEntitled;
- (BOOL)canAccessPath:(const char *)a3 accessKind:(int64_t)a4;
- (BOOL)canAccessPhysicalURL:(id)a3;
- (BOOL)checkTCCAccess;
- (BOOL)checkTCCAccessForSession:(id)a3;
- (BOOL)dieOnInvalidate;
- (BOOL)hasPrivateSharingInterfaceEntitlement;
- (BOOL)isSandboxed;
- (BRCAccountSessionFPFS)session;
- (BRCClientPrivilegesDescriptor)clientPriviledgesDescriptor;
- (BRCXPCClient)initWithConnection:(id)a3;
- (BRMangledID)defaultMangledID;
- (NSSet)entitledAppLibraryIDs;
- (NSString)bundleID;
- (NSString)description;
- (NSXPCConnection)connection;
- (char)cloudEnabledStatus;
- (id)_auditedURLFromPath:(id)a3;
- (id)_entitlementValueForKey:(id)a3 ofClass:(Class)a4;
- (id)_setupAppLibrary:(id)a3 error:(id *)a4;
- (id)issueContainerExtensionForURL:(id)a3 error:(id *)a4;
- (void)_auditURL:(id)a3;
- (void)_process:(int)a3 didBecomeForeground:(BOOL)a4;
- (void)_setupAppLibraryAndZoneWithID:(id)a3 recreateDocumentsIfNeeded:(BOOL)a4 reply:(id)a5;
- (void)_startMonitoringProcessIfNeeded;
- (void)_startSharingOperationAfterAcceptation:(id)a3 client:(id)a4 item:(id)a5;
- (void)_stopMonitoringProcess;
- (void)_waitForContainerToBeForcedIngestWithContainerID:(id)a3 containerURL:(id)a4 sandboxExtension:(id)a5 bundleVersion:(id)a6 error:(id)a7 reply:(id)a8;
- (void)addAppLibrary:(id)a3;
- (void)addOperation:(id)a3;
- (void)dumpToContext:(id)a3;
- (void)invalidate;
- (void)notificationPipe:(id)a3 didObserveAppLibrary:(id)a4;
- (void)notificationPipe:(id)a3 willObserveAppLibrary:(id)a4;
- (void)performBlockWithAnySession:(id)a3;
- (void)process:(int)a3 didBecomeForeground:(BOOL)a4;
- (void)removeAppLibrary:(id)a3;
- (void)setClientPriviledgesDescriptor:(id)a3;
- (void)setPrivilegesDescriptor:(id)a3;
- (void)setSession:(id)a3;
- (void)setupNonSandboxedAccessForUbiquityContainers:(id)a3 forBundleID:(id)a4;
- (void)wait;
@end

@implementation BRCXPCClient

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_personaMonitorCounts, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_appLibraries, 0);
  objc_storeStrong((id *)&self->_foregroundBackgroundHandlingQueue, 0);
  objc_storeStrong((id *)&self->_clientPriviledgesDescriptor, 0);
  objc_storeStrong((id *)&self->__session, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
}

- (void)invalidate
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  obj = self;
  objc_sync_enter(obj);
  if ((*((unsigned char *)obj + 32) & 1) == 0)
  {
    *((unsigned char *)obj + 32) |= 1u;
    brc_task_tracker_cancel(obj->_tracker);
    v2 = [(BRCXPCClient *)obj session];
    objc_sync_exit(obj);

    memset(v15, 0, sizeof(v15));
    __brc_create_section(0, (uint64_t)"-[BRCXPCClient invalidate]", 302, v15);
    v3 = brc_bread_crumbs();
    v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v17 = v15[0];
      __int16 v18 = 2112;
      v19 = obj;
      __int16 v20 = 2112;
      v21 = v3;
      _os_log_debug_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx invalidating connection with %@%@", buf, 0x20u);
    }

    [(BRCXPCClient *)obj _stopMonitoringProcess];
    v5 = [v2 notificationManager];
    [v5 pipeDelegateInvalidated:obj];

    v6 = +[BRCUserDefaults defaultsForMangledID:0];
    if ([v6 fpfsUploadV2])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v7 = [(BRCXPCClient *)obj bundleID];
        if ([v7 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProvider"])
        {
        }
        else
        {
          v8 = [(BRCXPCClient *)obj bundleID];
          int v9 = [v8 isEqualToString:@"com.apple.CloudDocs.iCloudDriveFileProviderManaged"];

          if (!v9)
          {
LABEL_14:
            objc_msgSend(v2, "unregisterClient:", obj, obj);
            [obja[8] cancelAllOperations];
            id WeakRetained = objc_loadWeakRetained(obja + 15);
            [WeakRetained invalidate];

            __brc_leave_section(v15);
            return;
          }
        }
        v10 = objc_msgSend(v2, "personaIdentifier", obj);
        v6 = +[BRCUploadSyncUpRequestsManager defaultManagerWithPersonaIdentifier:v10];

        v11 = [NSNumber numberWithInt:obj->_clientPid];
        [v6 invalidateRequestsOfClient:v11];
      }
    }

    goto LABEL_14;
  }
  objc_sync_exit(obj);
}

- (BRCAccountSessionFPFS)session
{
  return self->__session;
}

- (void)setSession:(id)a3
{
  v5 = (BRCAccountSessionFPFS *)a3;
  v6 = self;
  objc_sync_enter(v6);
  if ((*((unsigned char *)v6 + 32) & 1) == 0)
  {
    p_session = (void **)&v6->__session;
    session = v6->__session;
    if (session != v5)
    {
      [(BRCAccountSessionFPFS *)session unregisterClient:v6];
      if (!v5)
      {
        v10 = brc_bread_crumbs();
        v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          -[BRCXPCClient setSession:]();
        }
      }
      objc_storeStrong((id *)&v6->__session, a3);
      if (![(BRCAccountSessionFPFS *)v6->__session registerClient:v6])
      {
        int v9 = *p_session;
        *p_session = 0;
      }
    }
  }
  objc_sync_exit(v6);
}

- (void)setPrivilegesDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_clientPriviledgesDescriptor, a3);
  id v5 = a3;
  clientPriviledgesDescriptor = self->_clientPriviledgesDescriptor;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  [WeakRetained setUserInfo:clientPriviledgesDescriptor];
}

- (BRCXPCClient)initWithConnection:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BRCXPCClient;
  id v5 = [(BRCXPCClient *)&v24 init];
  if (v5)
  {
    if (initWithConnection__onceToken != -1) {
      dispatch_once(&initWithConnection__onceToken, &__block_literal_global_56);
    }
    uint64_t v6 = brc_task_tracker_create("XPC Client task tracker");
    v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    objc_storeWeak((id *)v5 + 15, v4);
    *((_DWORD *)v5 + 18) = [v4 processIdentifier];
    if (v4)
    {
      [v4 auditToken];
    }
    else
    {
      long long v22 = 0u;
      long long v23 = 0u;
    }
    *(_OWORD *)(v5 + 76) = v22;
    *(_OWORD *)(v5 + 92) = v23;
    id v8 = objc_alloc_init(MEMORY[0x263F08760]);
    int v9 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v8;

    objc_msgSend(NSString, "stringWithFormat:", @"xpc-client-queue-%d", *((unsigned int *)v5 + 18));
    id v10 = objc_claimAutoreleasedReturnValue();
    v11 = (const char *)[v10 UTF8String];
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v13 = initWithConnection__xpcWorkloop;
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create_with_target_V2(v11, v14, v13);

    v16 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v15;

    uint64_t v17 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    __int16 v18 = dispatch_queue_attr_make_with_autorelease_frequency(v17, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("foreground-background-handling", v18);

    __int16 v20 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v19;
  }
  return (BRCXPCClient *)v5;
}

- (void)_stopMonitoringProcess
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] stop monitoring %@%@");
}

- (void)process:(int)a3 didBecomeForeground:(BOOL)a4
{
  id v4 = [(BRCXPCClient *)self session];
  id v5 = [v4 personaIdentifier];
  BRPerformWithPersonaAndError();
}

- (NSString)bundleID
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(BRCClientPrivilegesDescriptor *)v2->_clientPriviledgesDescriptor applicationIdentifier];
  objc_sync_exit(v2);

  return (NSString *)v3;
}

- (void)_process:(int)a3 didBecomeForeground:(BOOL)a4
{
  foregroundBackgroundHandlingQueue = self->_foregroundBackgroundHandlingQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__BRCXPCClient__process_didBecomeForeground___block_invoke;
  v5[3] = &unk_2650806E8;
  v5[4] = self;
  BOOL v6 = a4;
  dispatch_async_and_wait(foregroundBackgroundHandlingQueue, v5);
}

void __44__BRCXPCClient_process_didBecomeForeground___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = brc_bread_crumbs();
    v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __44__BRCXPCClient_process_didBecomeForeground___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v4 = *(unsigned int *)(a1 + 40);
    uint64_t v5 = *(unsigned __int8 *)(a1 + 44);
    BOOL v6 = *(void **)(a1 + 32);
    [v6 _process:v4 didBecomeForeground:v5];
  }
}

void __45__BRCXPCClient__process_didBecomeForeground___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ((*(unsigned char *)(*(void *)(a1 + 32) + 109) & 1) == *(unsigned char *)(a1 + 40))
  {
    v2 = 0;
  }
  else
  {
    if (*(unsigned char *)(a1 + 40))
    {
      v3 = brc_bread_crumbs();
      uint64_t v4 = brc_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_2();
      }
    }
    else
    {
      v3 = brc_bread_crumbs();
      uint64_t v4 = brc_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_1();
      }
    }

    v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) copy];
    *(unsigned char *)(*(void *)(a1 + 32) + 109) = *(unsigned char *)(*(void *)(a1 + 32) + 109) & 0xFE | *(unsigned char *)(a1 + 40);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v11 = *(void *)(a1 + 32);
        if (*(unsigned char *)(a1 + 40)) {
          [v10 addForegroundClient:v11];
        }
        else {
          objc_msgSend(v10, "removeForegroundClient:", v11, (void)v12);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

void __35__BRCXPCClient_initWithConnection___block_invoke()
{
  dispatch_workloop_t v0 = dispatch_workloop_create("xpc-client-workloop");
  os_log_t v1 = (void *)initWithConnection__xpcWorkloop;
  initWithConnection__xpcWorkloop = (uint64_t)v0;
}

- (void)wait
{
  brc_task_tracker_wait((uint64_t)self->_tracker);
  operationQueue = self->_operationQueue;
  [(NSOperationQueue *)operationQueue waitUntilAllOperationsAreFinished];
}

- (NSString)description
{
  v3 = [(BRCXPCClient *)self session];

  if (v3) {
    uint64_t v4 = &stru_26F3822F0;
  }
  else {
    uint64_t v4 = @" (Logged out)";
  }
  id v5 = self;
  objc_sync_enter(v5);
  uint64_t v6 = [NSString stringWithFormat:@"%@%@", v5->_clientPriviledgesDescriptor, v4];
  objc_sync_exit(v5);

  return (NSString *)v6;
}

- (void)dumpToContext:(id)a3
{
  id v5 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  [v5 writeLineWithFormat:@" o %@", v4];
  objc_sync_exit(v4);
}

- (void)addOperation:(id)a3
{
  id v12 = a3;
  uint64_t v4 = self;
  objc_sync_enter(v4);
  if (*((unsigned char *)v4 + 32)) {
    [v12 cancel];
  }
  operationQueue = v4->_operationQueue;
  if (!operationQueue)
  {
    uint64_t v6 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    uint64_t v7 = v4->_operationQueue;
    v4->_operationQueue = v6;

    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v9 = dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("misc-operations", v9);

    [(NSOperationQueue *)v4->_operationQueue setUnderlyingQueue:v10];
    operationQueue = v4->_operationQueue;
  }
  [(NSOperationQueue *)operationQueue addOperation:v12];
  objc_sync_exit(v4);

  uint64_t v11 = [(BRCXPCClient *)v4 session];
  [v11 addMiscOperation:v12];
}

- (void)_startMonitoringProcessIfNeeded
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] starting monitoring %@%@");
}

- (BOOL)checkTCCAccess
{
  v2 = self;
  v3 = [(BRCXPCClient *)self session];
  LOBYTE(v2) = [(BRCXPCClient *)v2 checkTCCAccessForSession:v3];

  return (char)v2;
}

- (BOOL)checkTCCAccessForSession:(id)a3
{
  return 1;
}

- (void)addAppLibrary:(id)a3
{
  id v4 = a3;
  foregroundBackgroundHandlingQueue = self->_foregroundBackgroundHandlingQueue;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  int v9 = __30__BRCXPCClient_addAppLibrary___block_invoke;
  dispatch_queue_t v10 = &unk_26507ED98;
  uint64_t v11 = self;
  id v12 = v4;
  id v6 = v4;
  dispatch_async_and_wait(foregroundBackgroundHandlingQueue, &v7);
  [(BRCXPCClient *)self _startMonitoringProcessIfNeeded];
}

void __30__BRCXPCClient_addAppLibrary___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v1 + 32) & 1) == 0)
  {
    char v3 = *(unsigned char *)(v1 + 109);
    [*(id *)(v1 + 56) addObject:*(void *)(a1 + 40)];
    uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 56) countForObject:*(void *)(a1 + 40)];
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      dispatch_queue_t v10 = "YES";
      int v14 = 138413058;
      if (v4 == 1) {
        uint64_t v11 = "YES";
      }
      else {
        uint64_t v11 = "NO";
      }
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      if ((v3 & 1) == 0) {
        dispatch_queue_t v10 = "NO";
      }
      uint64_t v17 = v11;
      __int16 v18 = 2080;
      dispatch_queue_t v19 = v10;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - shouldNotify: %s, isForeground: %s%@", (uint8_t *)&v14, 0x2Au);
    }

    if ((v3 & 1) != 0 && v4 == 1)
    {
      brc_bread_crumbs();
      uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        long long v13 = [*(id *)(a1 + 40) logName];
        int v14 = 138412802;
        uint64_t v15 = v12;
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        dispatch_queue_t v19 = v7;
        _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - is now monitoring %@%@", (uint8_t *)&v14, 0x20u);
      }
      [*(id *)(a1 + 40) addForegroundClient:*(void *)(a1 + 32)];
    }
  }
}

- (void)removeAppLibrary:(id)a3
{
  id v4 = a3;
  foregroundBackgroundHandlingQueue = self->_foregroundBackgroundHandlingQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __33__BRCXPCClient_removeAppLibrary___block_invoke;
  v7[3] = &unk_26507ED98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async_and_wait(foregroundBackgroundHandlingQueue, v7);
}

void __33__BRCXPCClient_removeAppLibrary___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  if ((*(unsigned char *)(v1 + 32) & 1) == 0)
  {
    char v3 = *(unsigned char *)(v1 + 109);
    uint64_t v4 = [*(id *)(v1 + 56) countForObject:*(void *)(a1 + 40)];
    [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      dispatch_queue_t v10 = "YES";
      int v14 = 138413058;
      if (v4 == 1) {
        uint64_t v11 = "YES";
      }
      else {
        uint64_t v11 = "NO";
      }
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      if ((v3 & 1) == 0) {
        dispatch_queue_t v10 = "NO";
      }
      uint64_t v17 = v11;
      __int16 v18 = 2080;
      dispatch_queue_t v19 = v10;
      __int16 v20 = 2112;
      v21 = v5;
      _os_log_debug_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - shouldNotify: %s, isForeground: %s%@", (uint8_t *)&v14, 0x2Au);
    }

    if ((v3 & 1) != 0 && v4 == 1)
    {
      brc_bread_crumbs();
      uint64_t v7 = (char *)objc_claimAutoreleasedReturnValue();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = *(void *)(a1 + 32);
        long long v13 = [*(id *)(a1 + 40) logName];
        int v14 = 138412802;
        uint64_t v15 = v12;
        __int16 v16 = 2112;
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        dispatch_queue_t v19 = v7;
        _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ - is no longer monitoring %@%@", (uint8_t *)&v14, 0x20u);
      }
      [*(id *)(a1 + 40) removeForegroundClient:*(void *)(a1 + 32)];
    }
  }
}

- (void)notificationPipe:(id)a3 willObserveAppLibrary:(id)a4
{
}

- (void)notificationPipe:(id)a3 didObserveAppLibrary:(id)a4
{
}

- (char)cloudEnabledStatus
{
  v2 = self;
  objc_sync_enter(v2);
  clientPriviledgesDescriptor = v2->_clientPriviledgesDescriptor;
  uint64_t v4 = [(BRCXPCClient *)v2 session];
  LOBYTE(clientPriviledgesDescriptor) = [(BRCClientPrivilegesDescriptor *)clientPriviledgesDescriptor cloudEnabledStatusWithHasSession:v4 != 0];

  objc_sync_exit(v2);
  return (char)clientPriviledgesDescriptor;
}

- (BOOL)_hasAccessToAppLibraryID:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if ([(BRCXPCClient *)self _isAppLibraryProxyEntitled]) {
    goto LABEL_12;
  }
  if (![(BRCXPCClient *)self isSandboxed] && [(BRCXPCClient *)self checkTCCAccess])
  {
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412802;
      id v15 = v6;
      __int16 v16 = 2112;
      uint64_t v17 = self;
      __int16 v18 = 2112;
      dispatch_queue_t v19 = v7;
      _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] granting access to %@ for non-sandboxed app %@%@", (uint8_t *)&v14, 0x20u);
    }

    goto LABEL_12;
  }
  uint64_t v9 = [(BRCXPCClient *)self entitledAppLibraryIDs];
  if ([v9 count])
  {
    if (!v6
      || ([v6 appLibraryOrZoneName],
          dispatch_queue_t v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v9 containsObject:v10],
          v10,
          v11))
    {
      if ([(BRCXPCClient *)self cloudEnabledStatus] == 1)
      {

LABEL_12:
        BOOL v12 = 1;
        goto LABEL_16;
      }
    }
  }

  if (a4)
  {
    objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 1, @"Not entitled to access container");
    BOOL v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v12 = 0;
  }
LABEL_16:

  return v12;
}

- (BOOL)_canCreateAppLibraryWithID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (![(BRCXPCClient *)self _isAppLibraryProxyEntitled])
  {
    id v8 = [(BRCXPCClient *)self entitledAppLibraryIDs];
    if ([v8 count])
    {
      uint64_t v9 = [v6 appLibraryOrZoneName];
      if (v9
        && [v8 containsObject:v9]
        && [(BRCXPCClient *)self cloudEnabledStatus] == 1)
      {

        BOOL v7 = 1;
LABEL_12:

        goto LABEL_13;
      }
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 1, @"Not entitled to create container");
      BOOL v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v7 = 0;
    }
    goto LABEL_12;
  }
  BOOL v7 = 1;
LABEL_13:

  return v7;
}

- (BOOL)_isAppLibraryProxyWithError:(id *)a3
{
  if ([(BRCXPCClient *)self _isAppLibraryProxyEntitled]
    || ![(BRCXPCClient *)self isSandboxed] && [(BRCXPCClient *)self checkTCCAccess])
  {
    return 1;
  }
  id v6 = brc_bread_crumbs();
  BOOL v7 = brc_default_log();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
    -[BRCXPCClient _isAppLibraryProxyWithError:]();
  }

  if (!a3) {
    return 0;
  }
  objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 1, @"Not a container proxy");
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  BOOL result = 0;
  *a3 = v8;
  return result;
}

- (BOOL)_hasPrivateIPCEntitlementForSelector:(SEL)a3 error:(id *)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if ([(BRCXPCClient *)self _isAutomationEntitled]) {
    return 1;
  }
  id v8 = NSStringFromSelector(a3);
  uint64_t v9 = [(BRCXPCClient *)self _entitlementValueForKey:*MEMORY[0x263F32408] ofClass:objc_opt_class()];
  char v7 = [v9 containsObject:v8];
  if ((v7 & 1) == 0)
  {
    dispatch_queue_t v10 = brc_bread_crumbs();
    int v11 = brc_default_log();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      int v14 = self;
      __int16 v15 = 2112;
      __int16 v16 = v8;
      __int16 v17 = 2112;
      __int16 v18 = v10;
      _os_log_error_impl(&dword_23FA42000, v11, (os_log_type_t)0x90u, "[ERROR] %@: is trying to call %@, but has no access%@", buf, 0x20u);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x263F087E8], "br_errorWithDomain:code:description:", *MEMORY[0x263F32360], 1, @"Not entitled to access: %@", v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (id)_entitlementValueForKey:(id)a3 ofClass:(Class)a4
{
  p_connection = &self->_connection;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_connection);
  char v7 = [WeakRetained valueForEntitlement:v5];

  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)_entitlementBooleanValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCXPCClient *)self _entitlementValueForKey:v4 ofClass:objc_opt_class()];

  char v6 = [v5 BOOLValue];
  return v6;
}

- (BRMangledID)defaultMangledID
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = [(BRCClientPrivilegesDescriptor *)v2->_clientPriviledgesDescriptor defaultAppLibraryID];
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F325E0]);
    id v5 = [(BRCClientPrivilegesDescriptor *)v2->_clientPriviledgesDescriptor defaultAppLibraryID];
    char v6 = (void *)[v4 initWithAppLibraryName:v5];
  }
  else
  {
    char v6 = 0;
  }

  objc_sync_exit(v2);
  return (BRMangledID *)v6;
}

- (NSSet)entitledAppLibraryIDs
{
  v2 = self;
  objc_sync_enter(v2);
  char v3 = [(BRCClientPrivilegesDescriptor *)v2->_clientPriviledgesDescriptor appLibraryIDs];
  objc_sync_exit(v2);

  return (NSSet *)v3;
}

- (BOOL)_isAppLibraryProxyEntitled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(BRCClientPrivilegesDescriptor *)v2->_clientPriviledgesDescriptor isProxyEntitled];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)_isAutomationEntitled
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(BRCClientPrivilegesDescriptor *)v2->_clientPriviledgesDescriptor isAutomationEntitled];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)hasPrivateSharingInterfaceEntitlement
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(BRCClientPrivilegesDescriptor *)v2->_clientPriviledgesDescriptor isSharingPrivateInterfaceEntitled];
  objc_sync_exit(v2);

  return v3;
}

- (BOOL)isSandboxed
{
  return 1;
}

- (void)_auditURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 lastPathComponent];
  if (!objc_msgSend(v5, "br_isSideFaultName"))
  {
LABEL_6:

    goto LABEL_7;
  }
  char v6 = [v4 checkResourceIsReachableAndReturnError:0];

  if ((v6 & 1) == 0)
  {
    id v5 = brc_bread_crumbs();
    char v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
    {
      id v8 = [v4 path];
      int v9 = 138412802;
      dispatch_queue_t v10 = self;
      __int16 v11 = 2112;
      BOOL v12 = v8;
      __int16 v13 = 2112;
      int v14 = v5;
      _os_log_error_impl(&dword_23FA42000, v7, (os_log_type_t)0x90u, "[ERROR] Client %@ gave us a non-existing fault URL path %@%@", (uint8_t *)&v9, 0x20u);
    }
    goto LABEL_6;
  }
LABEL_7:
}

- (id)_auditedURLFromPath:(id)a3
{
  id v4 = [NSURL fileURLWithPath:a3];
  [(BRCXPCClient *)self _auditURL:v4];
  return v4;
}

- (BOOL)canAccessPath:(const char *)a3 accessKind:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v7 = *(_OWORD *)&self->auditToken.val[4];
  *(_OWORD *)buf = *(_OWORD *)self->auditToken.val;
  *(_OWORD *)&buf[16] = v7;
  __int16 v18 = a3;
  int v8 = sandbox_check_by_audit_token();
  if (!a4 && !v8)
  {
    long long v9 = *(_OWORD *)&self->auditToken.val[4];
    *(_OWORD *)buf = *(_OWORD *)self->auditToken.val;
    *(_OWORD *)&buf[16] = v9;
    __int16 v18 = a3;
    if (sandbox_check_by_audit_token()) {
      goto LABEL_4;
    }
LABEL_9:
    LOBYTE(v10) = 1;
    return v10;
  }
  if (!v8) {
    goto LABEL_9;
  }
LABEL_4:
  BOOL v10 = os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEBUG);
  if (!v10) {
    return v10;
  }
  __int16 v11 = objc_msgSend(MEMORY[0x263F08850], "defaultManager", v18);
  BOOL v12 = objc_msgSend(NSString, "br_pathWithFileSystemRepresentation:", a3);
  char v13 = [v11 fileExistsAtPath:v12];

  if (v13)
  {
    int v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v14;
      __int16 v16 = "[DEBUG] %@: denied access to %s%@";
LABEL_14:
      _os_log_debug_impl(&dword_23FA42000, v15, OS_LOG_TYPE_DEBUG, v16, buf, 0x20u);
    }
  }
  else
  {
    int v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = a3;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v14;
      __int16 v16 = "[DEBUG] %@: file doesn't exist at path: %s%@";
      goto LABEL_14;
    }
  }

  LOBYTE(v10) = 0;
  return v10;
}

- (void)performBlockWithAnySession:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v10 = 0;
  __int16 v11 = &v10;
  uint64_t v12 = 0x3032000000;
  char v13 = __Block_byref_object_copy__48;
  int v14 = __Block_byref_object_dispose__48;
  id v15 = [(BRCXPCClient *)self session];
  if (v11[5])
  {
    v4[2](v4);
  }
  else
  {
    id v5 = +[BRCAccountsManager sharedManager];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __43__BRCXPCClient_performBlockWithAnySession___block_invoke;
    v7[3] = &unk_265085A70;
    long long v9 = &v10;
    char v6 = v4;
    id v8 = v6;
    [v5 enumerateAccountHandlers:v7];

    if (!v11[5]) {
      ((void (*)(void (**)(void), void))v6[2])(v6, 0);
    }
  }
  _Block_object_dispose(&v10, 8);
}

void __43__BRCXPCClient_performBlockWithAnySession___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v8 = v3;
    id v4 = [v3 session];

    id v3 = v8;
    if (v4)
    {
      uint64_t v5 = [v8 session];
      uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      id v3 = v8;
    }
  }
}

- (BOOL)canAccessPhysicalURL:(id)a3
{
  id v4 = [a3 path];
  LOBYTE(self) = -[BRCXPCClient canAccessPath:accessKind:](self, "canAccessPath:accessKind:", [v4 fileSystemRepresentation], 0);

  return (char)self;
}

- (id)issueContainerExtensionForURL:(id)a3 error:(id *)a4
{
  uint64_t v5 = (void *)*MEMORY[0x263F32380];
  id v6 = a3;
  long long v7 = objc_msgSend(v6, "brc_issueSandboxExtensionOfClass:error:", objc_msgSend(v5, "UTF8String"), a4);

  return v7;
}

- (id)_setupAppLibrary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v16 = 0;
  __int16 v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__48;
  uint64_t v20 = __Block_byref_object_dispose__48;
  id v21 = 0;
  tracker = self->_tracker;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __39__BRCXPCClient__setupAppLibrary_error___block_invoke;
  v12[3] = &unk_265085A98;
  v12[4] = self;
  id v8 = v6;
  id v13 = v8;
  int v14 = &v16;
  id v15 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __39__BRCXPCClient__setupAppLibrary_error___block_invoke_95;
  v11[3] = &__block_descriptor_40_e5_v8__0l;
  v11[4] = a4;
  brc_task_tracker_sync(tracker, v12, v11);
  id v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v9;
}

void __39__BRCXPCClient__setupAppLibrary_error___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  int v2 = [*(id *)(a1 + 32) _canCreateAppLibraryWithID:*(void *)(a1 + 40) error:0];
  id v3 = [*(id *)(a1 + 32) session];
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v2) {
    [v3 getOrCreateAppLibraryAndPrivateZonesIfNecessary:v5];
  }
  else {
  uint64_t v6 = [v3 appLibraryByMangledID:v5];
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v9 = "create";
    if (!v2) {
      id v9 = "load";
    }
    uint64_t v10 = objc_msgSend(MEMORY[0x263F087E8], "br_errorWithPOSIXCode:description:", 1, @"can't %s app library for %@", v9, *(void *)(a1 + 40));
    if (v10)
    {
      __int16 v11 = brc_bread_crumbs();
      uint64_t v12 = brc_default_log();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        uint64_t v14 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 136315906;
        if (v14) {
          id v15 = "(passed to caller)";
        }
        else {
          id v15 = "(ignored by caller)";
        }
        __int16 v17 = "-[BRCXPCClient _setupAppLibrary:error:]_block_invoke";
        __int16 v18 = 2080;
        uint64_t v19 = v15;
        __int16 v20 = 2112;
        id v21 = v10;
        __int16 v22 = 2112;
        long long v23 = v11;
        _os_log_error_impl(&dword_23FA42000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    id v13 = *(id **)(a1 + 56);
    if (v13) {
      objc_storeStrong(v13, v10);
    }
  }
}

void __39__BRCXPCClient__setupAppLibrary_error___block_invoke_95(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v2 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorOperationCancelled");
  if (v2)
  {
    id v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, (os_log_type_t)0x90u))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 136315906;
      if (v6) {
        uint64_t v7 = "(passed to caller)";
      }
      else {
        uint64_t v7 = "(ignored by caller)";
      }
      id v9 = "-[BRCXPCClient _setupAppLibrary:error:]_block_invoke";
      __int16 v10 = 2080;
      __int16 v11 = v7;
      __int16 v12 = 2112;
      id v13 = v2;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl(&dword_23FA42000, v4, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v8, 0x2Au);
    }
  }
  uint64_t v5 = *(id **)(a1 + 32);
  if (v5) {
    objc_storeStrong(v5, v2);
  }
}

- (void)_waitForContainerToBeForcedIngestWithContainerID:(id)a3 containerURL:(id)a4 sandboxExtension:(id)a5 bundleVersion:(id)a6 error:(id)a7 reply:(id)a8
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (v15)
  {
    __int16 v20 = brc_bread_crumbs();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[BRCXPCClient _waitForContainerToBeForcedIngestWithContainerID:containerURL:sandboxExtension:bundleVersion:error:reply:]();
    }

    __int16 v22 = [(BRCXPCClient *)self session];
    long long v23 = [v22 appLibraryByID:v14];

    if (v23)
    {
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __121__BRCXPCClient__waitForContainerToBeForcedIngestWithContainerID_containerURL_sandboxExtension_bundleVersion_error_reply___block_invoke;
      v34[3] = &unk_265085AC0;
      v34[4] = self;
      id v35 = v15;
      id v36 = v16;
      id v37 = v17;
      id v38 = v18;
      id v39 = v19;
      [v23 waitForRootIngestionWithCompletion:v34];
    }
    else
    {
      v27 = brc_bread_crumbs();
      v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        -[BRCXPCClient _waitForContainerToBeForcedIngestWithContainerID:containerURL:sandboxExtension:bundleVersion:error:reply:]();
      }
      id v33 = v16;

      v29 = brc_bread_crumbs();
      v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v31 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"containerID", v14);
        *(_DWORD *)buf = 138413570;
        v41 = self;
        __int16 v42 = 2112;
        uint64_t v43 = 0;
        __int16 v44 = 2112;
        uint64_t v45 = 0;
        __int16 v46 = 2112;
        uint64_t v47 = 0;
        __int16 v48 = 2112;
        v49 = v31;
        __int16 v50 = 2112;
        v51 = v29;
        _os_log_impl(&dword_23FA42000, v30, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);
      }
      v32 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"containerID", v14);
      (*((void (**)(id, void, void, void, void *))v19 + 2))(v19, 0, 0, 0, v32);

      id v16 = v33;
    }
  }
  else
  {
    uint64_t v24 = brc_bread_crumbs();
    v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"containerID", v14);
      *(_DWORD *)buf = 138413570;
      v41 = self;
      __int16 v42 = 2112;
      uint64_t v43 = 0;
      __int16 v44 = 2112;
      uint64_t v45 = 0;
      __int16 v46 = 2112;
      uint64_t v47 = 0;
      __int16 v48 = 2112;
      v49 = v26;
      __int16 v50 = 2112;
      v51 = v24;
      _os_log_impl(&dword_23FA42000, v25, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);
    }
    long long v23 = objc_msgSend(MEMORY[0x263F087E8], "brc_errorInvalidParameter:value:", @"containerID", v14);
    (*((void (**)(id, void, void, void, void *))v19 + 2))(v19, 0, 0, 0, v23);
  }
}

uint64_t __121__BRCXPCClient__waitForContainerToBeForcedIngestWithContainerID_containerURL_sandboxExtension_bundleVersion_error_reply___block_invoke(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  int v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    uint64_t v6 = a1[6];
    uint64_t v7 = a1[7];
    uint64_t v8 = a1[8];
    int v10 = 138413570;
    uint64_t v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v7;
    __int16 v18 = 2112;
    uint64_t v19 = v8;
    __int16 v20 = 2112;
    id v21 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", (uint8_t *)&v10, 0x3Eu);
  }

  return (*(uint64_t (**)(void))(a1[9] + 16))();
}

- (void)_setupAppLibraryAndZoneWithID:(id)a3 recreateDocumentsIfNeeded:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id location = 0;
  id v9 = a5;
  int v10 = [(BRCXPCClient *)self _setupAppLibrary:v8 error:&location];
  if (v10)
  {
    if (v6)
    {
      uint64_t v11 = [(BRCXPCClient *)self session];
      __int16 v12 = [v11 clientTruthWorkloop];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __78__BRCXPCClient__setupAppLibraryAndZoneWithID_recreateDocumentsIfNeeded_reply___block_invoke;
      block[3] = &unk_26507ED98;
      block[4] = self;
      id v25 = v10;
      dispatch_async_and_wait(v12, block);
    }
    uint64_t v13 = [v10 url];
    if ([(BRCXPCClient *)self canAccessPhysicalURL:v13])
    {
      uint64_t v14 = 0;
    }
    else
    {
      id obj = location;
      uint64_t v14 = [(BRCXPCClient *)self issueContainerExtensionForURL:v13 error:&obj];
      objc_storeStrong(&location, obj);
      if (!v14)
      {

        uint64_t v13 = 0;
      }
    }
    __int16 v18 = [v10 containerMetadata];
    uint64_t v19 = [(BRCXPCClient *)self bundleID];
    __int16 v20 = [v18 versionNumberForBundleIdentifier:v19];

    [(BRCXPCClient *)self addAppLibrary:v10];
    id v21 = [v8 appLibraryOrZoneName];
    uint64_t v22 = objc_msgSend(location, "brc_wrappedError");
    [(BRCXPCClient *)self _waitForContainerToBeForcedIngestWithContainerID:v21 containerURL:v13 sandboxExtension:v14 bundleVersion:v20 error:v22 reply:v9];

    id v9 = (id)v14;
  }
  else
  {
    uint64_t v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = objc_msgSend(location, "brc_wrappedError");
      *(_DWORD *)buf = 138413570;
      v28 = self;
      __int16 v29 = 2112;
      uint64_t v30 = 0;
      __int16 v31 = 2112;
      uint64_t v32 = 0;
      __int16 v33 = 2112;
      uint64_t v34 = 0;
      __int16 v35 = 2112;
      id v36 = v17;
      __int16 v37 = 2112;
      id v38 = v15;
      _os_log_impl(&dword_23FA42000, v16, OS_LOG_TYPE_INFO, "[INFO] %@: reply(%@, %@, %@, %@)%@", buf, 0x3Eu);
    }
    uint64_t v13 = objc_msgSend(location, "brc_wrappedError");
    (*((void (**)(id, void, void, void, void *))v9 + 2))(v9, 0, 0, 0, v13);
  }
}

void __78__BRCXPCClient__setupAppLibraryAndZoneWithID_recreateDocumentsIfNeeded_reply___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) session];
  id v3 = [v2 clientDB];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __78__BRCXPCClient__setupAppLibraryAndZoneWithID_recreateDocumentsIfNeeded_reply___block_invoke_2;
  v4[3] = &unk_26507F2F8;
  id v5 = *(id *)(a1 + 40);
  [v3 performWithFlags:4 action:v4];
}

uint64_t __78__BRCXPCClient__setupAppLibraryAndZoneWithID_recreateDocumentsIfNeeded_reply___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) recreateDocumentsFolderIfNeededInDB];
}

- (void)setupNonSandboxedAccessForUbiquityContainers:(id)a3 forBundleID:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  objc_sync_enter(v8);
  id v9 = [BRCClientPrivilegesDescriptor alloc];
  long long v10 = *(_OWORD *)&v8->auditToken.val[4];
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v8->auditToken.val;
  *(_OWORD *)&v14[16] = v10;
  uint64_t v11 = [(BRCClientPrivilegesDescriptor *)v9 initWithNonSandboxedAppWithAppLibraryIDs:v6 bundleID:v7 auditToken:v14];
  [(BRCXPCClient *)v8 setPrivilegesDescriptor:v11];

  objc_sync_exit(v8);
  __int16 v12 = brc_bread_crumbs();
  uint64_t v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)uint64_t v14 = 138413058;
    *(void *)&v14[4] = v8;
    *(_WORD *)&v14[12] = 2112;
    *(void *)&v14[14] = v6;
    *(_WORD *)&v14[22] = 2112;
    *(void *)&v14[24] = v7;
    __int16 v15 = 2112;
    __int16 v16 = v12;
    _os_log_debug_impl(&dword_23FA42000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: unsandboxed app is now using %@ as %@%@", v14, 0x2Au);
  }
}

- (void)_startSharingOperationAfterAcceptation:(id)a3 client:(id)a4 item:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  [v8 setRemoteClientProxy:a4];
  long long v10 = [v9 clientZone];
  if ([v10 isSharedZone])
  {
    uint64_t v11 = [v9 clientZone];
    __int16 v12 = [v11 asSharedClientZone];
  }
  else
  {
    __int16 v12 = 0;
  }

  uint64_t v13 = [v9 itemID];
  uint64_t v14 = [v12 shareAcceptOperationForItemID:v13];

  if (v14)
  {
    __int16 v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 138412802;
      uint64_t v19 = v14;
      __int16 v20 = 2112;
      id v21 = v8;
      __int16 v22 = 2112;
      long long v23 = v15;
      _os_log_debug_impl(&dword_23FA42000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] add dependency %@ for operation %@%@", (uint8_t *)&v18, 0x20u);
    }

    [v8 addDependency:v14];
  }
  uint64_t v17 = [(BRCXPCClient *)self session];
  [v17 addMiscOperation:v8];

  [v8 schedule];
}

- (BRCClientPrivilegesDescriptor)clientPriviledgesDescriptor
{
  return self->_clientPriviledgesDescriptor;
}

- (void)setClientPriviledgesDescriptor:(id)a3
{
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (NSXPCConnection *)WeakRetained;
}

- (BOOL)dieOnInvalidate
{
  return self->_dieOnInvalidate;
}

- (void)setSession:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: session != nil%@", v2, v3, v4, v5, v6);
}

void __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] %@ - is now background%@", (void)v3, DWORD2(v3));
}

void __45__BRCXPCClient__process_didBecomeForeground___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_11_0(*MEMORY[0x263EF8340]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] %@ - is now foreground%@", (void)v3, DWORD2(v3));
}

void __44__BRCXPCClient_process_didBecomeForeground___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Failed to adopt persona, bailing out%@", v2, v3, v4, v5, v6);
}

- (void)_isAppLibraryProxyWithError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_23FA42000, v0, v1, "[ERROR] %@ is talking to us without container proxy right%@");
}

- (void)_waitForContainerToBeForcedIngestWithContainerID:containerURL:sandboxExtension:bundleVersion:error:reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_0(&dword_23FA42000, v0, v1, "[CRIT] UNREACHABLE: Container %@ should really exist!%@");
}

- (void)_waitForContainerToBeForcedIngestWithContainerID:containerURL:sandboxExtension:bundleVersion:error:reply:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Waiting for %@ to be forced ingest%@");
}

@end