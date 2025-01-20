@interface BRCDaemonFPFS
+ (BOOL)isDaemonRunning;
+ (id)daemon;
- (BOOL)_haveRequiredKernelFeatures;
- (BOOL)disableAccountChangesHandling;
- (BOOL)disableAppsChangesHandling;
- (BOOL)isShuttingDown;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)selfCheck:(__sFILE *)a3;
- (BOOL)shouldRejectXPCCalls;
- (BRCDaemonFPFS)init;
- (Class)containerClass;
- (NSDate)startupDate;
- (NSXPCListenerEndpoint)endpoint;
- (id)currentAccountHandler;
- (id)currentSession;
- (id)getCurrentSessionMustFinishedLoading:(BOOL)a3;
- (id)registerShareAcceptOperation:(id)a3 forURL:(id)a4;
- (unint64_t)forceIsGreedyState;
- (void)_dbgSleepIfRequested;
- (void)_finishStartup;
- (void)_initSignals;
- (void)_resumeSignals;
- (void)_setDoneXpcActivity:(id)a3 description:(id)a4;
- (void)_setupCacheDelete;
- (void)_setupVNodeRapidAging;
- (void)_startXPCListeners;
- (void)_startupAndLoadAccount;
- (void)dumpToContext:(id)a3;
- (void)exitWithCode:(int)a3;
- (void)handleExitSignal:(int)a3;
- (void)localeDidChange;
- (void)networkReachabilityChanged:(BOOL)a3;
- (void)performWithSessionForVolume:(id)a3 action:(id)a4;
- (void)registerWaiterBlock:(id)a3 forShareURL:(id)a4;
- (void)restart;
- (void)resumeIPCAcceptation;
- (void)setContainerClass:(Class)a3;
- (void)setDisableAccountChangesHandling:(BOOL)a3;
- (void)setDisableAppsChangesHandling:(BOOL)a3;
- (void)setForceIsGreedyState:(unint64_t)a3;
- (void)setUpAnonymousListener;
- (void)setUpSandbox;
- (void)start;
- (void)suspendIPCAcceptation;
- (void)waitForConfiguration;
- (void)waitOnAccountResumedQueue;
@end

@implementation BRCDaemonFPFS

void __52__BRCDaemonFPFS_listener_shouldAcceptNewConnection___block_invoke_2_137(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  memset(v5, 0, sizeof(v5));
  __brc_create_section(0, (uint64_t)"-[BRCDaemonFPFS listener:shouldAcceptNewConnection:]_block_invoke_2", 1014, v5);
  v2 = brc_bread_crumbs();
  v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v7 = v5[0];
    __int16 v8 = 2112;
    uint64_t v9 = v4;
    __int16 v10 = 2112;
    v11 = v2;
    _os_log_debug_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Client %@ connection was invalidated%@", buf, 0x20u);
  }

  [*(id *)(a1 + 40) setExportedObject:0];
  [*(id *)(a1 + 32) invalidate];
  __brc_leave_section(v5);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  v6 = (NSXPCListener *)a3;
  id v7 = a4;
  memset(v40, 0, sizeof(v40));
  __brc_create_section(0, (uint64_t)"-[BRCDaemonFPFS listener:shouldAcceptNewConnection:]", 962, v40);
  __int16 v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v28 = v40[0];
    uid_t v29 = geteuid();
    *(_DWORD *)buf = 134218754;
    v42 = (BRCClientPrivilegesDescriptor *)v28;
    __int16 v43 = 2112;
    id v44 = v7;
    __int16 v45 = 1024;
    uid_t v46 = v29;
    __int16 v47 = 2112;
    v48 = v8;
    _os_log_debug_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx received new XPC connection: %@, for uid: %u%@", buf, 0x26u);
  }

  if (!self->_shouldRejectXPCCalls)
  {
    dispatch_sync((dispatch_queue_t)self->_xpcListenersReadyQueue, &__block_literal_global_124);
    v14 = +[BRCFileProviderDaemonUtils sharedInstance];
    [v14 boostFileProvider];

    dispatch_sync((dispatch_queue_t)self->_accountReadyQueue, &__block_literal_global_127_0);
    if (!self->_disableAccountChangesHandling)
    {
      v15 = +[BRCAccountsManager sharedManager];
      char v16 = [v15 _isDeviceUnlocked];

      if ((v16 & 1) == 0)
      {
        brc_bread_crumbs();
        __int16 v10 = (BRCClientPrivilegesDescriptor *)objc_claimAutoreleasedReturnValue();
        v11 = brc_default_log();
        if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_7;
        }
        *(_DWORD *)buf = 138412290;
        v42 = v10;
        uint64_t v12 = "[WARNING] Denying xpc connection because the device is locked%@";
        goto LABEL_6;
      }
    }
    v17 = [BRCClientPrivilegesDescriptor alloc];
    if (v7) {
      [v7 auditToken];
    }
    else {
      memset(v39, 0, sizeof(v39));
    }
    __int16 v10 = [(BRCClientPrivilegesDescriptor *)v17 initWithAuditToken:v39];
    v18 = +[BRCAccountsManager sharedManager];
    if ([v18 isInSyncBubble])
    {
      BOOL v19 = [(BRCClientPrivilegesDescriptor *)v10 isSyncBubbleClientEntitled];

      if (!v19)
      {
        v11 = brc_bread_crumbs();
        v20 = brc_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v42 = (BRCClientPrivilegesDescriptor *)v11;
          _os_log_impl(&dword_23FA42000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Denying xpc connection because the daemon is in the sync bubble%@", buf, 0xCu);
        }
        BOOL v13 = 0;
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
    }
    if (self->_tokenListener == v6)
    {
      v21 = [(BRCXPCClient *)[BRCXPCTokenClient alloc] initWithConnection:v7];
      BRCXPCTokenInterface();
    }
    else
    {
      [(BRCDaemonFPFS *)self waitOnAccountResumedQueue];
      v21 = [(BRCXPCClient *)[BRCXPCRegularIPCsClient alloc] initWithConnection:v7];
      BRCXPCInterface();
    v22 = };
    [v7 setExportedInterface:v22];

    [(BRCXPCClient *)v21 setPrivilegesDescriptor:v10];
    v23 = [(BRCDaemonFPFS *)self getCurrentSessionMustFinishedLoading:1];
    [(BRCXPCClient *)v21 setSession:v23];

    v24 = brc_bread_crumbs();
    v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[BRCDaemonFPFS listener:shouldAcceptNewConnection:]();
    }

    [v7 setExportedObject:v21];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __52__BRCDaemonFPFS_listener_shouldAcceptNewConnection___block_invoke_131;
    v36[3] = &unk_2650811F0;
    id v38 = v7;
    v26 = v21;
    p_super = &v26->super.super;
    [v7 setInterruptionHandler:v36];
    uint64_t v30 = MEMORY[0x263EF8330];
    uint64_t v31 = 3221225472;
    v32 = __52__BRCDaemonFPFS_listener_shouldAcceptNewConnection___block_invoke_2_137;
    v33 = &unk_265081218;
    v11 = v26;
    v34 = v11;
    id v35 = v7;
    [v7 setInvalidationHandler:&v30];
    objc_msgSend(v7, "resume", v30, v31, v32, v33);

    BOOL v13 = 1;
    v20 = p_super;
    goto LABEL_25;
  }
  brc_bread_crumbs();
  __int16 v10 = (BRCClientPrivilegesDescriptor *)objc_claimAutoreleasedReturnValue();
  v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v10;
    uint64_t v12 = "[NOTICE] Rejecting all XPC connections%@";
LABEL_6:
    _os_log_impl(&dword_23FA42000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
  }
LABEL_7:
  BOOL v13 = 0;
LABEL_26:

  __brc_leave_section(v40);
  return v13;
}

- (id)getCurrentSessionMustFinishedLoading:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = [(BRCDaemonFPFS *)self currentAccountHandler];
  v5 = v4;
  if (v3 && ![v4 finishedLoading])
  {
    v6 = 0;
  }
  else
  {
    v6 = [v5 session];
  }

  return v6;
}

- (id)currentAccountHandler
{
  v2 = +[BRCAccountsManager sharedManager];
  BOOL v3 = [v2 accountHandlerForCurrentPersona];

  return v3;
}

- (void)waitOnAccountResumedQueue
{
}

+ (id)daemon
{
  if (daemon_once != -1) {
    dispatch_once(&daemon_once, &__block_literal_global_16);
  }
  v2 = (void *)gDaemon;
  return v2;
}

void __23__BRCDaemonFPFS_daemon__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)gDaemon;
  gDaemon = v0;

  objc_opt_class();
  id obj = (id)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(obj);
  isDaemonRunning = 1;
  objc_sync_exit(obj);
}

+ (BOOL)isDaemonRunning
{
  v2 = objc_opt_class();
  objc_sync_enter(v2);
  char v3 = isDaemonRunning;
  objc_sync_exit(v2);

  return v3;
}

- (void)_initSignals
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] We are running under bundle %@, not initializing signals because this is not bird daemon%@");
}

uint64_t __29__BRCDaemonFPFS__initSignals__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleExitSignal:2];
}

uint64_t __29__BRCDaemonFPFS__initSignals__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleExitSignal:3];
}

uint64_t __29__BRCDaemonFPFS__initSignals__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleExitSignal:15];
}

- (void)_setupVNodeRapidAging
{
  OUTLINED_FUNCTION_5_1();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
}

- (BOOL)shouldRejectXPCCalls
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uid_t v2 = geteuid();
  if (!v2)
  {
    char v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] We are running as Root user. We should reject all XPC connections%@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v2 == 0;
}

- (BRCDaemonFPFS)init
{
  v25.receiver = self;
  v25.super_class = (Class)BRCDaemonFPFS;
  uid_t v2 = [(BRCDaemonFPFS *)&v25 init];
  char v3 = v2;
  if (v2)
  {
    [(BRCDaemonFPFS *)v2 _initSignals];
    [(BRCDaemonFPFS *)v3 _setupVNodeRapidAging];
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(v4, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.bird.xpc-listener-ready", v5);

    xpcListenersReadyQueue = v3->_xpcListenersReadyQueue;
    v3->_xpcListenersReadyQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    uint64_t v9 = dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.bird.account-startup-queue", v9);

    accountReadyQueue = v3->_accountReadyQueue;
    v3->_accountReadyQueue = (OS_dispatch_queue *)v10;

    uint64_t v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    BOOL v13 = dispatch_queue_attr_make_with_autorelease_frequency(v12, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.bird.account-resume-queue", v13);

    accountResumedQueue = v3->_accountResumedQueue;
    v3->_accountResumedQueue = (OS_dispatch_queue *)v14;

    char v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(v16, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.bird.startup-queue", v17);

    startupQueue = v3->_startupQueue;
    v3->_startupQueue = (OS_dispatch_queue *)v18;

    v20 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(v20, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("account-loader", v21);

    accountLoaderQueue = v3->_accountLoaderQueue;
    v3->_accountLoaderQueue = (OS_dispatch_queue *)v22;

    v3->_shouldRejectXPCCalls = [(BRCDaemonFPFS *)v3 shouldRejectXPCCalls];
  }
  return v3;
}

- (void)waitForConfiguration
{
  dispatch_resume((dispatch_object_t)self->_sigIntSrc);
  dispatch_resume((dispatch_object_t)self->_sigQuitSrc);
  dispatch_resume((dispatch_object_t)self->_sigTermSrc);
  self->_unitTestMode = 1;
  char v3 = [MEMORY[0x263F08D88] serviceListener];
  xpcListener = self->_xpcListener;
  self->_xpcListener = v3;

  [(NSXPCListener *)self->_xpcListener setDelegate:self];
  [(NSXPCListener *)self->_xpcListener resume];
  __break(1u);
}

- (void)setUpAnonymousListener
{
  char v3 = [MEMORY[0x263F08D88] anonymousListener];
  xpcListener = self->_xpcListener;
  self->_xpcListener = v3;

  [(NSXPCListener *)self->_xpcListener setDelegate:self];
  v5 = self->_xpcListener;
  [(NSXPCListener *)v5 resume];
}

- (BOOL)_haveRequiredKernelFeatures
{
  return 1;
}

- (void)setUpSandbox
{
  if (!self->_shouldRejectXPCCalls)
  {
    uid_t v2 = +[BRCAccountsManager sharedManager];
    int v3 = [v2 isInSyncBubble];

    if (v3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"com.apple.bird.%u", getuid());
      id v4 = objc_claimAutoreleasedReturnValue();
      [v4 UTF8String];
      _set_user_dir_suffix();
    }
    else
    {
      _set_user_dir_suffix();
    }
  }
}

- (id)currentSession
{
  return [(BRCDaemonFPFS *)self getCurrentSessionMustFinishedLoading:0];
}

- (void)performWithSessionForVolume:(id)a3 action:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  memset(&v14, 0, sizeof(v14));
  id v7 = v5;
  if (lstat((const char *)[v7 fileSystemRepresentation], &v14) < 0)
  {
    uint64_t v9 = brc_bread_crumbs();
    dispatch_queue_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
      -[BRCDaemonFPFS performWithSessionForVolume:action:]((uint64_t)v7, (uint64_t)v9, v10);
    }
  }
  else
  {
    uint64_t v8 = +[BRCAccountsManager sharedManager];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    stat v13 = v14;
    v11[2] = __52__BRCDaemonFPFS_performWithSessionForVolume_action___block_invoke;
    v11[3] = &unk_265081018;
    id v12 = v6;
    [v8 enumerateAccountHandlers:v11];

    uint64_t v9 = v12;
  }
}

void __52__BRCDaemonFPFS_performWithSessionForVolume_action___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  int v3 = [v9 session];
  id v4 = [v3 volume];
  int v5 = [v4 deviceID];
  int v6 = *(_DWORD *)(a1 + 40);

  if (v5 == v6)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [v9 session];
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  }
}

- (void)_setupCacheDelete
{
  if (!self->_shouldRejectXPCCalls)
  {
    v9[9] = self;
    v9[10] = MEMORY[0x263EF8330];
    v9[11] = 3221225472;
    v9[12] = __34__BRCDaemonFPFS__setupCacheDelete__block_invoke;
    v9[13] = &unk_265081068;
    v9[14] = self;
    v9[5] = MEMORY[0x263EF8330];
    v9[6] = 3221225472;
    v9[7] = __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_40;
    v9[8] = &unk_265081068;
    CacheDeleteRegisterInfoCallbacks();
    int v3 = +[BRCUserDefaults defaultsForMangledID:0];
    id v4 = [v3 cacheDeletePushXPCActivity];

    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2_52;
    v9[3] = &unk_265081178;
    v9[4] = self;
    id v5 = v4;
    int v6 = v9;
    uint64_t v7 = v6;
    if (*MEMORY[0x263F32760])
    {
      uint64_t v8 = ((void (*)(void *))*MEMORY[0x263F32760])(v6);

      uint64_t v7 = (void *)v8;
    }
    xpc_activity_unregister("com.apple.bird.cache-delete.push");
    xpc_activity_register("com.apple.bird.cache-delete.push", v5, v7);
  }
}

id __34__BRCDaemonFPFS__setupCacheDelete__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  memset(v22, 0, sizeof(v22));
  __brc_create_section(0, (uint64_t)"-[BRCDaemonFPFS _setupCacheDelete]_block_invoke", 446, v22);
  uint64_t v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v24 = v22[0];
    __int16 v25 = 1024;
    int v26 = a2;
    __int16 v27 = 2112;
    id v28 = v5;
    __int16 v29 = 2112;
    uint64_t v30 = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cache delete requested us to compute purgeable space: (urgency: %d) %@%@", buf, 0x26u);
  }

  int v9 = +[BRCDiskSpaceReclaimer simpleUrgencyForCacheDeleteUrgency:a2];
  id v10 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  [v10 setObject:v6 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  [v10 setObject:&unk_26F3DD148 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  [v10 setObject:&unk_26F3DD148 forKeyedSubscript:@"CACHE_DELETE_NONPURGEABLE_AMOUNT"];
  v11 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_35;
  v18[3] = &unk_265081040;
  int v21 = v9;
  id v12 = v10;
  id v19 = v12;
  id v13 = v6;
  id v20 = v13;
  [v11 performWithSessionForVolume:v13 action:v18];
  stat v14 = brc_bread_crumbs();
  v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_cold_1();
  }

  id v16 = v12;
  __brc_leave_section(v22);

  return v16;
}

void __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_35(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 diskReclaimer];
  uint64_t v5 = [v4 cachedPurgeableSpaceForUrgency:*(unsigned int *)(a1 + 48)];

  uint64_t v6 = v5 & ~(v5 >> 63);
  uint64_t v7 = [v3 diskReclaimer];

  uint64_t v8 = [v7 cachedNonPurgeableSpace];
  [*(id *)(a1 + 32) setObject:*(void *)(a1 + 40) forKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  int v9 = [NSNumber numberWithLongLong:v6];
  [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  id v10 = [NSNumber numberWithUnsignedLongLong:v8];
  [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"CACHE_DELETE_NONPURGEABLE_AMOUNT"];
}

id __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_40(uint64_t a1, int a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  memset(v23, 0, sizeof(v23));
  __brc_create_section(0, (uint64_t)"-[BRCDaemonFPFS _setupCacheDelete]_block_invoke", 477, v23);
  uint64_t v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v25 = v23[0];
    __int16 v26 = 1024;
    int v27 = a2;
    __int16 v28 = 2112;
    id v29 = v5;
    __int16 v30 = 2112;
    uint64_t v31 = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cache delete requested us to purge: (urgency: %d) %@%@", buf, 0x26u);
  }

  id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v10 = *(void **)(a1 + 32);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_41;
  v18[3] = &unk_2650810B8;
  int v22 = a2;
  id v11 = v6;
  id v19 = v11;
  id v12 = v5;
  id v20 = v12;
  id v13 = v9;
  id v21 = v13;
  [v10 performWithSessionForVolume:v11 action:v18];
  stat v14 = brc_bread_crumbs();
  v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_40_cold_1();
  }

  id v16 = v13;
  __brc_leave_section(v23);

  return v16;
}

void __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_41(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x2020000000;
  int v21 = 0;
  id v4 = [v3 clientDB];
  id v5 = [v4 serialQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2;
  block[3] = &unk_265081090;
  id v16 = &v18;
  id v6 = v3;
  id v15 = v6;
  int v17 = *(_DWORD *)(a1 + 56);
  dispatch_sync(v5, block);

  if (*(int *)(a1 + 56) >= 2)
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = [v6 resetQueue];
    +[BRCAnalyticsReporter cancelSyncConsistencyReportWithMountPath:v7 queue:v8];
  }
  id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:@"CACHE_DELETE_AMOUNT"];
  uint64_t v10 = [v9 longLongValue];

  id v11 = [v6 diskReclaimer];
  uint64_t v12 = [v11 purgeSpace:v10 withUrgency:*((unsigned int *)v19 + 6)];

  [*(id *)(a1 + 48) setObject:*(void *)(a1 + 32) forKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  id v13 = [NSNumber numberWithLongLong:v12];
  [*(id *)(a1 + 48) setObject:v13 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

  _Block_object_dispose(&v18, 8);
}

void __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) diskReclaimer];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 urgencyForCacheDeleteUrgency:*(unsigned int *)(a1 + 48)];
}

id __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2_46(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  memset(v13, 0, sizeof(v13));
  __brc_create_section(0, (uint64_t)"-[BRCDaemonFPFS _setupCacheDelete]_block_invoke_2", 506, v13);
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v15 = v13[0];
    __int16 v16 = 2112;
    uint64_t v17 = a3;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_debug_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cache delete requested us to periodically purge: %@%@", buf, 0x20u);
  }

  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v7 = +[BRCAccountsManager sharedManager];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_49;
  v11[3] = &unk_265081100;
  id v8 = v6;
  id v12 = v8;
  [v7 enumerateAccountHandlers:v11];

  id v9 = v8;
  __brc_leave_section(v13);
  return v9;
}

void __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_49(uint64_t a1, void *a2)
{
  id v3 = [a2 session];
  if (v3)
  {
    id v10 = v3;
    id v4 = [v3 diskReclaimer];
    uint64_t v5 = [v4 periodicReclaimSpace];

    id v6 = [v10 volume];

    id v3 = v10;
    if (v6)
    {
      uint64_t v7 = [v10 volume];
      id v8 = [v7 mountPath];
      [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"CACHE_DELETE_VOLUME"];

      id v9 = [NSNumber numberWithLongLong:v5];
      [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:@"CACHE_DELETE_AMOUNT"];

      id v3 = v10;
    }
  }
}

void __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2_52(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (xpc_activity_should_defer(v3))
  {
    if (xpc_activity_set_state(v3, 3)) {
      goto LABEL_16;
    }
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", (uint8_t *)&buf, 0xCu);
    }
  }
  memset(v13, 0, sizeof(v13));
  __brc_create_section(0, (uint64_t)"-[BRCDaemonFPFS _setupCacheDelete]_block_invoke", 542, v13);
  id v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2_52_cold_1(v13);
  }

  if (!xpc_activity_set_state(v3, 4))
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_23FA42000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the xpc state to continue%@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  id v10 = +[BRCAccountsManager sharedManager];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_53;
  v12[3] = &unk_265081150;
  v12[4] = &buf;
  [v10 enumerateAccountHandlers:v12];

  if (*(unsigned char *)(*((void *)&buf + 1) + 24)) {
    id v11 = @"success case kBRCCacheDeletePushXPCActivityId";
  }
  else {
    id v11 = @"Error case in computePurgeableSpaceForAllUrgenciesWithReply for kBRCCacheDeletePushXPCActivityId";
  }
  [*(id *)(a1 + 32) _setDoneXpcActivity:v3 description:v11];
  _Block_object_dispose(&buf, 8);
  __brc_leave_section(v13);
LABEL_16:
}

void __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_53(uint64_t a1, void *a2)
{
  id v3 = [a2 session];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 diskReclaimer];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2_54;
    v6[3] = &unk_265081128;
    uint64_t v8 = *(void *)(a1 + 32);
    id v7 = v4;
    [v5 computePurgeableSpaceForAllUrgenciesWithReply:v6];
  }
}

void __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2_54(uint64_t a1, void *a2, void *a3, void *a4)
{
  v23[4] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, (os_log_type_t)0x90u)) {
      __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2_54_cold_3();
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    id v12 = [*(id *)(a1 + 32) volume];
    id v13 = [v12 mountPath];

    if (v13)
    {
      stat v14 = [v7 objectForKeyedSubscript:&unk_26F3DD160];
      [v14 unsignedLongLongValue];

      uint64_t v15 = [v8 unsignedLongLongValue];
      v22[0] = @"CACHE_DELETE_ID";
      v22[1] = @"CACHE_DELETE_VOLUME";
      v23[0] = @"com.apple.bird.cache-delete";
      v23[1] = v13;
      v23[2] = v7;
      v22[2] = @"CACHE_DELETE_AMOUNT";
      uint64_t v22[3] = @"CACHE_DELETE_NONPURGEABLE_AMOUNT";
      char v16 = [NSNumber numberWithUnsignedLongLong:v15];
      uint64_t v23[3] = v16;
      uint64_t v17 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];

      __int16 v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2_54_cold_2();
      }
    }
    else
    {
      uint64_t v20 = brc_bread_crumbs();
      int v21 = brc_default_log();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
        __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2_54_cold_1();
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
}

- (void)_setDoneXpcActivity:(id)a3 description:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a4;
  if (!xpc_activity_set_state((xpc_activity_t)a3, 5))
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_23FA42000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the xpc state to done for \"%@\"%@", (uint8_t *)&v8, 0x16u);
    }
  }
}

- (void)_dbgSleepIfRequested
{
  [a1 timeIntervalSinceNow];
  OUTLINED_FUNCTION_12_0(&dword_23FA42000, v1, v2, "[DEBUG] Start date expired: %@ (%f)%@", v3, v4, v5, v6, 2u);
}

- (void)_startXPCListeners
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_xpcListenersReadyQueue);
  [(BRCDaemonFPFS *)self setUpSandbox];
  uint64_t v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315650;
    id v29 = "FPFS";
    __int16 v30 = 2080;
    uint64_t v31 = "";
    __int16 v32 = 2112;
    *(void *)v33 = v3;
    _os_log_impl(&dword_23FA42000, v4, OS_LOG_TYPE_DEFAULT, "[NOTICE] starting bird in %s mode%s%@", buf, 0x20u);
  }

  uint64_t v5 = [MEMORY[0x263EFF910] date];
  startupDate = self->_startupDate;
  self->_startupDate = v5;

  memset(v27, 0, sizeof(v27));
  __brc_create_section(0, (uint64_t)"-[BRCDaemonFPFS _startXPCListeners]", 659, v27);
  id v7 = brc_bread_crumbs();
  int v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = v27[0];
    __int16 v26 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v25 = [v26 bundleIdentifier];
    pid_t v15 = getpid();
    uid_t v16 = getuid();
    OSVersion();
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    BRVersion();
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    id v19 = NSHomeDirectory();
    uint64_t v20 = objc_msgSend(v19, "br_realpath");
    int v21 = +[BRCAccountsManager sharedManager];
    int v22 = [v21 isInSyncBubble];
    v23 = @"NO";
    *(_DWORD *)long long buf = 134220034;
    id v29 = (const char *)v24;
    __int16 v30 = 2112;
    if (v22) {
      v23 = @"YES";
    }
    uint64_t v31 = v25;
    __int16 v32 = 1024;
    *(_DWORD *)v33 = v15;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = v16;
    __int16 v34 = 2112;
    id v35 = v17;
    __int16 v36 = 2112;
    id v37 = v18;
    __int16 v38 = 2112;
    v39 = v20;
    __int16 v40 = 2112;
    v41 = v23;
    __int16 v42 = 2112;
    __int16 v43 = v7;
    _os_log_debug_impl(&dword_23FA42000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Starting up, welcome, bundle:%@, pid:%d, uid:%d, os:%@, version:%@, home:\"%@\", in sync bubble:%@%@", buf, 0x54u);
  }
  [(BRCDaemonFPFS *)self _dbgSleepIfRequested];
  if (!self->_unitTestMode)
  {
    id v9 = objc_alloc(MEMORY[0x263F08D88]);
    __int16 v10 = (NSXPCListener *)[v9 initWithMachServiceName:*MEMORY[0x263F32770]];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v10;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    id v12 = objc_alloc(MEMORY[0x263F08D88]);
    id v13 = (NSXPCListener *)[v12 initWithMachServiceName:*MEMORY[0x263F32778]];
    tokenListener = self->_tokenListener;
    self->_tokenListener = v13;

    [(NSXPCListener *)self->_tokenListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener resume];
    [(NSXPCListener *)self->_tokenListener resume];
  }
  __brc_leave_section(v27);
}

- (void)_startupAndLoadAccount
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] using Cloud Database class: %@%@", (void)v3, DWORD2(v3));
}

uint64_t __39__BRCDaemonFPFS__startupAndLoadAccount__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) localeDidChange];
}

- (void)_resumeSignals
{
  if (!self->_unitTestMode)
  {
    dispatch_resume((dispatch_object_t)self->_sigIntSrc);
    dispatch_resume((dispatch_object_t)self->_sigQuitSrc);
    sigTermSrc = self->_sigTermSrc;
    dispatch_resume(sigTermSrc);
  }
}

- (void)_finishStartup
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┏%llx sending token change notification%@", (void)v3, DWORD2(v3));
}

- (void)start
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_23FA42000, v0, v1, "[CRIT] Assertion failed: qos_class_self() == QOS_CLASS_DEFAULT%@", v2, v3, v4, v5, v6);
}

void __22__BRCDaemonFPFS_start__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (qos_class_self() != QOS_CLASS_DEFAULT)
  {
    id v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCDaemonFPFS start]();
    }
  }
  [*(id *)(a1 + 32) _startXPCListeners];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __22__BRCDaemonFPFS_start__block_invoke_91;
  v9[3] = &unk_26507ED70;
  v9[4] = *(void *)(a1 + 32);
  uint64_t v2 = (void (**)(void))MEMORY[0x2455D9A50](v9);
  uint64_t v3 = +[BRCBuddyFlowObserver sharedBuddyFlowObserver];
  int v4 = [v3 observeBuddyIfNecessaryWithKey:@"DaemonStart" block:v2 description:@"Daemon start"];

  if (v4)
  {
    uint64_t v5 = brc_bread_crumbs();
    uint8_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] BYSetupAssistantNeedsToRun --> pausing daemon startup until done.%@", buf, 0xCu);
    }
  }
  else
  {
    v2[2](v2);
  }
}

void __22__BRCDaemonFPFS_start__block_invoke_91(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 64);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__BRCDaemonFPFS_start__block_invoke_2;
  block[3] = &unk_26507ED70;
  void block[4] = v1;
  dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, block);
  dispatch_async(v2, v3);
}

void __22__BRCDaemonFPFS_start__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _resumeSignals];
  [*(id *)(a1 + 32) _startupAndLoadAccount];
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_block_t v3 = *(NSObject **)(v2 + 72);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__BRCDaemonFPFS_start__block_invoke_3;
  block[3] = &unk_26507ED70;
  void block[4] = v2;
  dispatch_async(v3, block);
}

void __22__BRCDaemonFPFS_start__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupCacheDelete];
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_block_t v3 = *(NSObject **)(v2 + 80);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __22__BRCDaemonFPFS_start__block_invoke_4;
  block[3] = &unk_26507ED70;
  void block[4] = v2;
  dispatch_async(v3, block);
}

uint64_t __22__BRCDaemonFPFS_start__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishStartup];
}

- (void)restart
{
}

- (id)registerShareAcceptOperation:(id)a3 forURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = self;
  objc_sync_enter(v8);
  if (!v8->_shareAcceptOperationsByToken)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
    shareAcceptOperationsByToken = v8->_shareAcceptOperationsByToken;
    v8->_shareAcceptOperationsByToken = (NSMutableDictionary *)v9;
  }
  shareAcceptQueue = v8->_shareAcceptQueue;
  if (!shareAcceptQueue)
  {
    uint64_t v12 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x263F08A48]);
    id v13 = v8->_shareAcceptQueue;
    v8->_shareAcceptQueue = v12;

    [(NSOperationQueue *)v8->_shareAcceptQueue setName:@"share-accept"];
    shareAcceptQueue = v8->_shareAcceptQueue;
  }
  stat v14 = shareAcceptQueue;
  pid_t v15 = v8->_shareAcceptOperationsByToken;
  uid_t v16 = [v7 path];
  id v17 = [v16 lastPathComponent];
  id v18 = [(NSMutableDictionary *)v15 objectForKeyedSubscript:v17];

  if (v18)
  {
    id v19 = v18;
  }
  else
  {
    shareAcceptWaitersByToken = v8->_shareAcceptWaitersByToken;
    int v21 = [v7 path];
    int v22 = [v21 lastPathComponent];
    v23 = [(NSMutableDictionary *)shareAcceptWaitersByToken objectForKeyedSubscript:v22];

    if (v23) {
      [v6 setSkipOpenInApp:1];
    }
    uint64_t v24 = v8->_shareAcceptOperationsByToken;
    uint64_t v25 = [v7 path];
    __int16 v26 = [v25 lastPathComponent];
    [(NSMutableDictionary *)v24 setObject:v6 forKeyedSubscript:v26];
  }
  objc_sync_exit(v8);

  if (!v18)
  {
    int v27 = [v6 finishBlock];
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __53__BRCDaemonFPFS_registerShareAcceptOperation_forURL___block_invoke;
    v30[3] = &unk_2650811A0;
    id v32 = v27;
    v30[4] = v8;
    id v31 = v7;
    id v28 = v27;
    [v6 setFinishBlock:v30];
    [(NSOperationQueue *)v14 addOperation:v6];
    id v18 = v6;
  }
  return v18;
}

void __53__BRCDaemonFPFS_registerShareAcceptOperation_forURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  id v7 = *(void **)(*(void *)(a1 + 32) + 104);
  int v8 = [*(id *)(a1 + 40) path];
  uint64_t v9 = [v8 lastPathComponent];
  [v7 removeObjectForKey:v9];

  __int16 v10 = *(void **)(*(void *)(a1 + 32) + 112);
  id v11 = [*(id *)(a1 + 40) path];
  uint64_t v12 = [v11 lastPathComponent];
  uint64_t v25 = [v10 objectForKeyedSubscript:v12];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = [v25 waiterBlocks];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  uint64_t v23 = a1;
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * v16);
        if (v5)
        {
          id v26 = v6;
          id v18 = [MEMORY[0x263F054E0] wrapperWithURL:v5 readonly:0 error:&v26];
          id v19 = v26;

          id v6 = v19;
        }
        else
        {
          id v18 = 0;
        }
        (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v18, v6);

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v14);
  }

  uint64_t v20 = *(void **)(*(void *)(v23 + 32) + 112);
  int v21 = [*(id *)(v23 + 40) path];
  int v22 = [v21 lastPathComponent];
  [v20 removeObjectForKey:v22];

  objc_sync_exit(obj);
}

- (void)registerWaiterBlock:(id)a3 forShareURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = self;
  objc_sync_enter(v8);
  shareAcceptWaitersByToken = v8->_shareAcceptWaitersByToken;
  if (!shareAcceptWaitersByToken)
  {
    uint64_t v10 = objc_opt_new();
    id v11 = v8->_shareAcceptWaitersByToken;
    v8->_shareAcceptWaitersByToken = (NSMutableDictionary *)v10;

    shareAcceptWaitersByToken = v8->_shareAcceptWaitersByToken;
  }
  uint64_t v12 = [v7 path];
  id v13 = [v12 lastPathComponent];
  uint64_t v14 = [(NSMutableDictionary *)shareAcceptWaitersByToken objectForKeyedSubscript:v13];

  if (!v14)
  {
    uint64_t v14 = objc_alloc_init(BRCShareAcceptWaiterInfo);
    uint64_t v15 = v8->_shareAcceptWaitersByToken;
    uint64_t v16 = [v7 path];
    uint64_t v17 = [v16 lastPathComponent];
    [(NSMutableDictionary *)v15 setObject:v14 forKeyedSubscript:v17];
  }
  id v18 = [(BRCShareAcceptWaiterInfo *)v14 waiterBlocks];
  id v19 = (void *)MEMORY[0x2455D9A50](v6);
  [v18 addObject:v19];

  acceptWaiterTimer = v8->_acceptWaiterTimer;
  if (acceptWaiterTimer) {
    dispatch_source_cancel(acceptWaiterTimer);
  }
  dispatch_source_t v21 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v8->_accountResumedQueue);
  int v22 = v8->_acceptWaiterTimer;
  v8->_acceptWaiterTimer = (OS_dispatch_source *)v21;

  uint64_t v23 = v8->_acceptWaiterTimer;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __49__BRCDaemonFPFS_registerWaiterBlock_forShareURL___block_invoke;
  v32[3] = &unk_26507ED70;
  v32[4] = v8;
  uint64_t v24 = v23;
  uint64_t v25 = v32;
  id v26 = v24;
  long long v27 = v25;
  long long v28 = v27;
  long long v29 = v27;
  if (*MEMORY[0x263F32768])
  {
    long long v29 = ((void (*)(void *))*MEMORY[0x263F32768])(v27);
  }
  dispatch_block_t v30 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v29);
  dispatch_source_set_event_handler(v26, v30);

  dispatch_time_t v31 = dispatch_time(0, 15000000000);
  dispatch_source_set_timer((dispatch_source_t)v8->_acceptWaiterTimer, v31, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_resume((dispatch_object_t)v8->_acceptWaiterTimer);

  objc_sync_exit(v8);
}

void __49__BRCDaemonFPFS_registerWaiterBlock_forShareURL___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v20 = *(id *)(a1 + 32);
  objc_sync_enter(v20);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v25 = a1;
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 112) allKeys];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v3)
  {
    uint64_t v23 = *(void *)v31;
    uint64_t v4 = *MEMORY[0x263EFD498];
    id obj = v2;
    do
    {
      uint64_t v24 = v3;
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        id v7 = [*(id *)(*(void *)(v25 + 32) + 104) objectForKeyedSubscript:v6];
        BOOL v8 = v7 == 0;

        if (v8)
        {
          uint64_t v9 = brc_bread_crumbs();
          uint64_t v10 = brc_default_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412546;
            uint64_t v36 = v6;
            __int16 v37 = 2112;
            __int16 v38 = v9;
            _os_log_impl(&dword_23FA42000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] No accept operation found for key %@%@", buf, 0x16u);
          }

          id v11 = [*(id *)(*(void *)(v25 + 32) + 112) objectForKeyedSubscript:v6];
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          int v22 = v11;
          uint64_t v12 = [v11 waiterBlocks];
          uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v27;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v27 != v14) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * j);
                uint64_t v17 = [MEMORY[0x263F087E8] errorWithDomain:v4 code:11 userInfo:0];
                (*(void (**)(uint64_t, void, void *))(v16 + 16))(v16, 0, v17);
              }
              uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v34 count:16];
            }
            while (v13);
          }

          [*(id *)(*(void *)(v25 + 32) + 112) removeObjectForKey:v6];
        }
      }
      uint64_t v2 = obj;
      uint64_t v3 = [obj countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v3);
  }

  uint64_t v18 = *(void *)(v25 + 32);
  id v19 = *(void **)(v18 + 120);
  *(void *)(v18 + 120) = 0;

  objc_sync_exit(v20);
}

- (void)dumpToContext:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(NSMutableDictionary *)v5->_shareAcceptOperationsByToken count])
  {
    [v4 writeLineWithFormat:@"share accept operations"];
    [v4 writeLineWithFormat:@"-----------------------------------------------------"];
    [v4 pushIndentation];
    shareAcceptOperationsByToken = v5->_shareAcceptOperationsByToken;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __31__BRCDaemonFPFS_dumpToContext___block_invoke;
    v8[3] = &unk_2650811C8;
    id v7 = v4;
    id v9 = v7;
    [(NSMutableDictionary *)shareAcceptOperationsByToken enumerateKeysAndObjectsUsingBlock:v8];
    [v7 popIndentation];
    [v7 writeLineWithFormat:&stru_26F3822F0];
  }
  objc_sync_exit(v5);
}

void __31__BRCDaemonFPFS_dumpToContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [a3 descriptionWithContext:v4];
  [v4 writeLineWithFormat:@" %@: %@", v5, v6];
}

- (void)localeDidChange
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_23FA42000, v3, OS_LOG_TYPE_DEFAULT, "[NOTICE] Language changed, exiting%@", (uint8_t *)&v4, 0xCu);
  }

  exit(0);
}

uint64_t __52__BRCDaemonFPFS_listener_shouldAcceptNewConnection___block_invoke_131(uint64_t a1)
{
  [*(id *)(a1 + 40) invalidate];
  uint64_t result = [*(id *)(a1 + 32) dieOnInvalidate];
  if (result)
  {
    abc_report_panic_with_signature();
    uint64_t v3 = [NSString stringWithFormat:@"our connection was invalidated"];
    int v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __52__BRCDaemonFPFS_listener_shouldAcceptNewConnection___block_invoke_131_cold_1(v3, (uint64_t)v4, v5);
    }

    brc_append_system_info_to_message();
    uint64_t v6 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
    __assert_rtn("-[BRCDaemonFPFS listener:shouldAcceptNewConnection:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/daemon/BRCDaemon.m", 1010, v6);
  }
  return result;
}

- (NSXPCListenerEndpoint)endpoint
{
  return [(NSXPCListener *)self->_xpcListener endpoint];
}

- (BOOL)selfCheck:(__sFILE *)a3
{
  uint64_t v20 = 0;
  dispatch_source_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  int v4 = [(BRCDaemonFPFS *)self currentSession];
  id v5 = [v4 clientDB];
  [v5 performWithFlags:17 action:&__block_literal_global_141];
  id v19 = 0;
  uint64_t v6 = (void *)[v4 newConnectionWithLabel:@"checker" readonly:0 error:&v19];
  id v7 = v19;

  if (v6)
  {
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __27__BRCDaemonFPFS_selfCheck___block_invoke_145;
    uint64_t v15 = &unk_265081268;
    uint64_t v17 = &v20;
    id v16 = v4;
    uint64_t v18 = a3;
    [v6 groupInTransaction:&v12];
    objc_msgSend(v6, "brc_close", v12, v13, v14, v15);
    BOOL v8 = v16;
  }
  else
  {
    BOOL v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
      -[BRCDaemonFPFS selfCheck:]();
    }
  }
  char v10 = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return v10;
}

uint64_t __27__BRCDaemonFPFS_selfCheck___block_invoke()
{
  return 1;
}

uint64_t __27__BRCDaemonFPFS_selfCheck___block_invoke_145(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  int v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __27__BRCDaemonFPFS_selfCheck___block_invoke_2;
  v7[3] = &unk_265081240;
  long long v9 = *(_OWORD *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 enumerateServerZones:v7];

  return 0;
}

uint64_t __27__BRCDaemonFPFS_selfCheck___block_invoke_2(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 validateItemsLoggingToFile:a1[6] db:a1[4]];
  uint64_t v5 = *(void *)(a1[5] + 8);
  if (v4) {
    BOOL v6 = *(unsigned char *)(v5 + 24) != 0;
  }
  else {
    BOOL v6 = 0;
  }
  *(unsigned char *)(v5 + 24) = v6;
  int v7 = [v3 validateStructureLoggingToFile:a1[6] db:a1[4]];
  uint64_t v8 = *(void *)(a1[5] + 8);
  if (v7) {
    BOOL v9 = *(unsigned char *)(v8 + 24) != 0;
  }
  else {
    BOOL v9 = 0;
  }
  *(unsigned char *)(v8 + 24) = v9;
  int v10 = [v3 validateItemsLoggingToFile:a1[6] db:a1[4]];
  uint64_t v11 = *(void *)(a1[5] + 8);
  if (v10) {
    BOOL v12 = *(unsigned char *)(v11 + 24) != 0;
  }
  else {
    BOOL v12 = 0;
  }
  *(unsigned char *)(v11 + 24) = v12;
  int v13 = [v3 validateStructureLoggingToFile:a1[6] db:a1[4]];
  uint64_t v14 = *(void *)(a1[5] + 8);
  if (v13) {
    BOOL v15 = *(unsigned char *)(v14 + 24) != 0;
  }
  else {
    BOOL v15 = 0;
  }
  *(unsigned char *)(v14 + 24) = v15;

  return 1;
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = brc_bread_crumbs();
  BOOL v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCDaemonFPFS networkReachabilityChanged:]();
  }

  BRNotificationNameForServerAvailabilityChanges();
  id v7 = objc_claimAutoreleasedReturnValue();
  [v7 UTF8String];
  brc_notify_set_state_and_post();

  if (v3) {
    dispatch_async((dispatch_queue_t)self->_startupQueue, &__block_literal_global_149);
  }
}

void __44__BRCDaemonFPFS_networkReachabilityChanged___block_invoke()
{
  id v0 = +[BRCAccountsManager sharedManager];
  [v0 enumerateAccountHandlerIfFinishedLoading:&__block_literal_global_151];
}

void __44__BRCDaemonFPFS_networkReachabilityChanged___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = *MEMORY[0x263F05370];
  id v4 = a2;
  uint64_t v5 = [v2 errorWithDomain:v3 code:-1004 userInfo:0];
  BOOL v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __44__BRCDaemonFPFS_networkReachabilityChanged___block_invoke_2_cold_1();
  }

  uint64_t v8 = objc_msgSend(MEMORY[0x263F055B8], "br_sharedProviderManager");
  [v8 signalErrorResolved:v5 completionHandler:&__block_literal_global_156];

  BOOL v9 = [v4 session];

  int v10 = [v9 clientTruthWorkloop];

  if (v10)
  {
    uint64_t v11 = [v9 clientTruthWorkloop];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__BRCDaemonFPFS_networkReachabilityChanged___block_invoke_157;
    block[3] = &unk_26507ED70;
    id v13 = v9;
    dispatch_async(v11, block);
  }
}

void __44__BRCDaemonFPFS_networkReachabilityChanged___block_invoke_153(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__BRCDaemonFPFS_networkReachabilityChanged___block_invoke_153_cold_1();
  }
}

uint64_t __44__BRCDaemonFPFS_networkReachabilityChanged___block_invoke_157(uint64_t a1)
{
  return [*(id *)(a1 + 32) enumerateAppLibraries:&__block_literal_global_161];
}

uint64_t __44__BRCDaemonFPFS_networkReachabilityChanged___block_invoke_2_158(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = [v2 defaultClientZone];
  id v4 = [v3 serverZone];
  if (([v4 hasFetchedRecentsAndFavorites] & 1) == 0) {
    goto LABEL_6;
  }
  uint64_t v5 = [v3 serverZone];
  if (([v5 state] & 4) != 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  char v6 = [v3 isSyncBlocked];

  if ((v6 & 1) == 0) {
    [v2 scheduleFullLibraryContentsFetch];
  }
LABEL_7:

  return 1;
}

- (void)handleExitSignal:(int)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = brc_bread_crumbs();
  char v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315394;
    BOOL v12 = strsignal(a3);
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    _os_log_impl(&dword_23FA42000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] starting exit sequence because of received signal (%s)%@", (uint8_t *)&v11, 0x16u);
  }

  self->_shuttingDown = 1;
  id v7 = +[BRCFileProviderDaemonUtils sharedInstance];
  [v7 interrupt];

  [(NSXPCListener *)self->_xpcListener invalidate];
  uint64_t v8 = (BRCDaemonFPFS *)[(BRCDaemonFPFS *)self exitWithCode:0];
  [(BRCDaemonFPFS *)v8 exitWithCode:v10];
}

- (void)exitWithCode:(int)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  +[BRCAccountsManager sharedManager];
  [(id)objc_claimAutoreleasedReturnValue() enumerateAccountHandlers:&__block_literal_global_163];
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_23FA42000, v5, OS_LOG_TYPE_DEFAULT, "[NOTICE] exiting with code %d...%@", (uint8_t *)v6, 0x12u);
  }

  exit(a3);
}

void __30__BRCDaemonFPFS_exitWithCode___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 session];
  uint64_t v3 = [v2 clientDB];

  if (v3)
  {
    id v4 = [v3 serialQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __30__BRCDaemonFPFS_exitWithCode___block_invoke_2;
    block[3] = &unk_26507ED70;
    id v6 = v3;
    dispatch_sync(v4, block);
  }
}

uint64_t __30__BRCDaemonFPFS_exitWithCode___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) flush];
}

- (void)suspendIPCAcceptation
{
}

- (void)resumeIPCAcceptation
{
}

- (Class)containerClass
{
  return self->_containerClass;
}

- (void)setContainerClass:(Class)a3
{
}

- (BOOL)disableAccountChangesHandling
{
  return self->_disableAccountChangesHandling;
}

- (void)setDisableAccountChangesHandling:(BOOL)a3
{
  self->_disableAccountChangesHandling = a3;
}

- (BOOL)disableAppsChangesHandling
{
  return self->_disableAppsChangesHandling;
}

- (void)setDisableAppsChangesHandling:(BOOL)a3
{
  self->_disableAppsChangesHandling = a3;
}

- (unint64_t)forceIsGreedyState
{
  return self->_forceIsGreedyState;
}

- (void)setForceIsGreedyState:(unint64_t)a3
{
  self->_forceIsGreedyState = a3;
}

- (NSDate)startupDate
{
  return self->_startupDate;
}

- (BOOL)isShuttingDown
{
  return self->_shuttingDown;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startupDate, 0);
  objc_storeStrong((id *)&self->_containerClass, 0);
  objc_storeStrong((id *)&self->_shareAcceptQueue, 0);
  objc_storeStrong((id *)&self->_acceptWaiterTimer, 0);
  objc_storeStrong((id *)&self->_shareAcceptWaitersByToken, 0);
  objc_storeStrong((id *)&self->_shareAcceptOperationsByToken, 0);
  objc_storeStrong((id *)&self->_accountLoaderQueue, 0);
  objc_storeStrong((id *)&self->_startupQueue, 0);
  objc_storeStrong((id *)&self->_accountResumedQueue, 0);
  objc_storeStrong((id *)&self->_accountReadyQueue, 0);
  objc_storeStrong((id *)&self->_xpcListenersReadyQueue, 0);
  objc_storeStrong((id *)&self->_tokenListener, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_sigTermSrc, 0);
  objc_storeStrong((id *)&self->_sigQuitSrc, 0);
  objc_storeStrong((id *)&self->_sigIntSrc, 0);
}

- (void)performWithSessionForVolume:(NSObject *)a3 action:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = __error();
  __int16 v7 = strerror(*v6);
  int v8 = 138412802;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  int v11 = v7;
  __int16 v12 = 2112;
  uint64_t v13 = a2;
  _os_log_error_impl(&dword_23FA42000, a3, (os_log_type_t)0x90u, "[ERROR] cannot retrieve device ID for '%@': %s%@", (uint8_t *)&v8, 0x20u);
}

void __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] purgeable space is %@%@");
}

void __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_40_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Purged space is %@%@");
}

void __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2_52_cold_1(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v1, v2, "[DEBUG] ┏%llx pushing purgeable update to cache delete%@", (void)v3, DWORD2(v3));
}

void __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2_54_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_23FA42000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to get volume path%@", v1, 0xCu);
}

void __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2_54_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Purgeable info: %@ (not returned)%@");
}

void __34__BRCDaemonFPFS__setupCacheDelete__block_invoke_2_54_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5_1();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] welcome %@!%@");
}

void __52__BRCDaemonFPFS_listener_shouldAcceptNewConnection___block_invoke_131_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = brc_append_system_info_to_message();
  int v6 = 138412546;
  __int16 v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_fault_impl(&dword_23FA42000, a3, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v6, 0x16u);
}

- (void)selfCheck:.cold.1()
{
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x20u);
}

- (void)networkReachabilityChanged:.cold.1()
{
  uint64_t v0 = BRNotificationNameForServerAvailabilityChanges();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_12_0(&dword_23FA42000, v1, v2, "[DEBUG] sending server availability: %savailable (%@)%@", v3, v4, v5, v6, 2u);
}

void __44__BRCDaemonFPFS_networkReachabilityChanged___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_23FA42000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] network is now reachable -- signalling FP to resolve the error%@", v1, 0xCu);
}

void __44__BRCDaemonFPFS_networkReachabilityChanged___block_invoke_153_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_23FA42000, v0, v1, "[DEBUG] Signalling FP complete with error %@%@");
}

@end