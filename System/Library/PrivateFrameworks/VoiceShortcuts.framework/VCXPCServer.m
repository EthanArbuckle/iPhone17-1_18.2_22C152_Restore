@interface VCXPCServer
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)skipEntitlementsCheck;
- (NSXPCInterface)xpcInterface;
- (NSXPCListener)xpcListener;
- (NSXPCListenerEndpoint)endpoint;
- (SwiftVCDaemonXPCEventHandler)eventHandler;
- (VCCKShortcutSyncCoordinator)syncCoordinator;
- (VCSyncDataEndpoint)syncDataEndpoint;
- (VCVoiceShortcutManager)voiceShortcutManager;
- (VCXPCServer)initWithDatabaseProvider:(id)a3 triggerRegistrar:(id)a4 syncCoordinator:(id)a5 syncDataEndpoint:(id)a6 runCoordinator:(id)a7 eventHandler:(id)a8 appShortcutsUpdater:(id)a9 contextualActionSyncService:(id)a10;
- (VCXPCServer)initWithUnsecuredAnonymousListenerAndDatabaseProvider:(id)a3;
- (VCXPCServer)initWithXPCListener:(id)a3 databaseProvider:(id)a4 triggerRegistrar:(id)a5 syncCoordinator:(id)a6 syncDataEndpoint:(id)a7 runCoordinator:(id)a8 eventHandler:(id)a9 appShortcutsUpdater:(id)a10 contextualActionSyncService:(id)a11;
- (WFContextualActionSpotlightSyncService)contextualActionSyncService;
- (WFDatabaseProvider)databaseProvider;
- (WFTopHitsAppShortcutsUpdater)appShortcutsUpdater;
- (WFTriggerManager)triggerManager;
- (WFTriggerRegistrar)triggerRegistrar;
- (WFWorkflowRunCoordinator)runCoordinator;
@end

@implementation VCXPCServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v6 = a3;
  v7 = (VCXPCServer *)a4;
  v8 = getWFGeneralLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v33 = "-[VCXPCServer listener:shouldAcceptNewConnection:]";
    __int16 v34 = 2114;
    v35 = self;
    __int16 v36 = 2114;
    v37 = v6;
    __int16 v38 = 2114;
    v39 = v7;
    _os_log_impl(&dword_1C7D7E000, v8, OS_LOG_TYPE_DEBUG, "%s -[%{public}@ listener:%{public}@ shouldAcceptNewConnection:%{public}@]", buf, 0x2Au);
  }

  v9 = [(VCXPCServer *)self voiceShortcutManager];
  if (!v9)
  {
    v10 = getWFGeneralLogObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[VCXPCServer listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_1C7D7E000, v10, OS_LOG_TYPE_ERROR, "%s Rejecting connection because database is inaccessible", buf, 0xCu);
    }
    goto LABEL_18;
  }
  v10 = [MEMORY[0x1E4FB4510] accessSpecifierForXPCConnection:v7];
  if ([(VCXPCServer *)self skipEntitlementsCheck])
  {
    v11 = getWFGeneralLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v33 = "-[VCXPCServer listener:shouldAcceptNewConnection:]";
      __int16 v34 = 2114;
      v35 = v7;
      _os_log_impl(&dword_1C7D7E000, v11, OS_LOG_TYPE_DEBUG, "%s Skipping entitlement check for connection %{public}@ for testing", buf, 0x16u);
    }

    uint64_t v12 = [MEMORY[0x1E4FB4510] accessSpecifierUnrestricted];

    v10 = v12;
  }
  char v13 = [v10 allowConnection];
  v14 = getWFGeneralLogObject();
  v15 = v14;
  if ((v13 & 1) == 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v33 = "-[VCXPCServer listener:shouldAcceptNewConnection:]";
      __int16 v34 = 2114;
      v35 = v7;
      __int16 v36 = 2114;
      v37 = v10;
      _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_ERROR, "%s Rejecting connection %{public}@ because it has insufficient privileges: %{public}@", buf, 0x20u);
    }

LABEL_18:
    BOOL v22 = 0;
    goto LABEL_23;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v33 = "-[VCXPCServer listener:shouldAcceptNewConnection:]";
    __int16 v34 = 2114;
    v35 = v7;
    __int16 v36 = 2114;
    v37 = v10;
    _os_log_impl(&dword_1C7D7E000, v15, OS_LOG_TYPE_INFO, "%s Accepting connection %{public}@ with access %{public}@", buf, 0x20u);
  }

  objc_initWeak(&location, v7);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __50__VCXPCServer_listener_shouldAcceptNewConnection___block_invoke;
  v29[3] = &unk_1E6542118;
  objc_copyWeak(&v30, &location);
  [(VCXPCServer *)v7 setInterruptionHandler:v29];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __50__VCXPCServer_listener_shouldAcceptNewConnection___block_invoke_185;
  v27[3] = &unk_1E6542118;
  objc_copyWeak(&v28, &location);
  [(VCXPCServer *)v7 setInvalidationHandler:v27];
  [(VCXPCServer *)v7 setDelegate:self];
  v16 = [(VCXPCServer *)self xpcInterface];
  [(VCXPCServer *)v7 setExportedInterface:v16];

  v17 = [VCVoiceShortcutManagerAccessWrapper alloc];
  v18 = [(VCXPCServer *)self triggerRegistrar];
  v19 = [(VCXPCServer *)self syncCoordinator];
  v20 = [(VCXPCServer *)self syncDataEndpoint];
  v21 = [(VCXPCServer *)self runCoordinator];
  if (v7) {
    [(VCXPCServer *)v7 auditToken];
  }
  else {
    memset(v26, 0, sizeof(v26));
  }
  v23 = [(VCVoiceShortcutManagerAccessWrapper *)v17 initWithVoiceShortcutManager:v9 triggerRegistrar:v18 accessSpecifier:v10 syncCoordinator:v19 syncDataEndpoint:v20 runCoordinator:v21 auditToken:v26];
  [(VCXPCServer *)v7 setExportedObject:v23];

  [(VCXPCServer *)v7 resume];
  v24 = getWFGeneralLogObject();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "-[VCXPCServer listener:shouldAcceptNewConnection:]";
    __int16 v34 = 2114;
    v35 = v7;
    _os_log_impl(&dword_1C7D7E000, v24, OS_LOG_TYPE_DEBUG, "%s Resumed connection %{public}@", buf, 0x16u);
  }

  objc_destroyWeak(&v28);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
  BOOL v22 = 1;
LABEL_23:

  return v22;
}

- (NSXPCInterface)xpcInterface
{
  return self->_xpcInterface;
}

- (VCVoiceShortcutManager)voiceShortcutManager
{
  voiceShortcutManager = self->_voiceShortcutManager;
  if (!voiceShortcutManager)
  {
    v4 = [(VCXPCServer *)self databaseProvider];
    if (v4)
    {
      v5 = [VCVoiceShortcutManager alloc];
      v6 = [(VCXPCServer *)self eventHandler];
      v7 = [(VCXPCServer *)self appShortcutsUpdater];
      v8 = [(VCXPCServer *)self contextualActionSyncService];
      v9 = [(VCVoiceShortcutManager *)v5 initWithDatabaseProvider:v4 eventHandler:v6 appShortcutsUpdater:v7 contextualActionSyncService:v8];
      v10 = self->_voiceShortcutManager;
      self->_voiceShortcutManager = v9;
    }
    voiceShortcutManager = self->_voiceShortcutManager;
  }
  return voiceShortcutManager;
}

- (WFTriggerRegistrar)triggerRegistrar
{
  return self->_triggerRegistrar;
}

- (VCSyncDataEndpoint)syncDataEndpoint
{
  return self->_syncDataEndpoint;
}

- (VCCKShortcutSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (BOOL)skipEntitlementsCheck
{
  return self->_skipEntitlementsCheck;
}

- (WFWorkflowRunCoordinator)runCoordinator
{
  return self->_runCoordinator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextualActionSyncService, 0);
  objc_storeStrong((id *)&self->_appShortcutsUpdater, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_syncDataEndpoint, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_runCoordinator, 0);
  objc_storeStrong((id *)&self->_triggerRegistrar, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcInterface, 0);
  objc_storeStrong((id *)&self->_triggerManager, 0);
  objc_storeStrong((id *)&self->_voiceShortcutManager, 0);
}

- (WFContextualActionSpotlightSyncService)contextualActionSyncService
{
  return self->_contextualActionSyncService;
}

- (WFTopHitsAppShortcutsUpdater)appShortcutsUpdater
{
  return self->_appShortcutsUpdater;
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (NSXPCListener)xpcListener
{
  return self->_xpcListener;
}

- (WFTriggerManager)triggerManager
{
  return self->_triggerManager;
}

void __50__VCXPCServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = getWFGeneralLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315394;
    v4 = "-[VCXPCServer listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v5 = 2114;
    id v6 = WeakRetained;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_INFO, "%s Connection %{public}@ was interrupted", (uint8_t *)&v3, 0x16u);
  }
}

void __50__VCXPCServer_listener_shouldAcceptNewConnection___block_invoke_185(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = getWFGeneralLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315394;
    v4 = "-[VCXPCServer listener:shouldAcceptNewConnection:]_block_invoke";
    __int16 v5 = 2114;
    id v6 = WeakRetained;
    _os_log_impl(&dword_1C7D7E000, v2, OS_LOG_TYPE_INFO, "%s Connection %{public}@ was invalidated", (uint8_t *)&v3, 0x16u);
  }
}

- (NSXPCListenerEndpoint)endpoint
{
  v2 = [(VCXPCServer *)self xpcListener];
  int v3 = [v2 endpoint];

  return (NSXPCListenerEndpoint *)v3;
}

- (VCXPCServer)initWithXPCListener:(id)a3 databaseProvider:(id)a4 triggerRegistrar:(id)a5 syncCoordinator:(id)a6 syncDataEndpoint:(id)a7 runCoordinator:(id)a8 eventHandler:(id)a9 appShortcutsUpdater:(id)a10 contextualActionSyncService:(id)a11
{
  id v17 = a3;
  id v33 = a4;
  id v18 = a4;
  id v34 = a5;
  id v19 = a5;
  v20 = self;
  id v40 = v19;
  id v35 = a6;
  id v39 = a6;
  id v36 = a7;
  id v38 = a7;
  id v37 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, v20, @"VCXPCServer.m", 115, @"Invalid parameter not satisfying: %@", @"xpcListener" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  id v30 = [MEMORY[0x1E4F28B00] currentHandler];
  [v30 handleFailureInMethod:a2, v20, @"VCXPCServer.m", 116, @"Invalid parameter not satisfying: %@", @"databaseProvider" object file lineNumber description];

LABEL_3:
  v41.receiver = v20;
  v41.super_class = (Class)VCXPCServer;
  v24 = [(VCXPCServer *)&v41 init];
  if (v24)
  {
    uint64_t v25 = VCDaemonXPCInterface();
    xpcInterface = v24->_xpcInterface;
    v24->_xpcInterface = (NSXPCInterface *)v25;

    objc_storeStrong((id *)&v24->_xpcListener, a3);
    [(NSXPCListener *)v24->_xpcListener setDelegate:v24];
    objc_storeStrong((id *)&v24->_databaseProvider, v33);
    objc_storeStrong((id *)&v24->_triggerRegistrar, v34);
    objc_storeStrong((id *)&v24->_syncCoordinator, v35);
    objc_storeStrong((id *)&v24->_syncDataEndpoint, v36);
    objc_storeStrong((id *)&v24->_runCoordinator, a8);
    objc_storeStrong((id *)&v24->_eventHandler, a9);
    objc_storeStrong((id *)&v24->_appShortcutsUpdater, a10);
    objc_storeStrong((id *)&v24->_contextualActionSyncService, a11);
    [(NSXPCListener *)v24->_xpcListener resume];
    v27 = v24;
  }

  return v24;
}

- (VCXPCServer)initWithUnsecuredAnonymousListenerAndDatabaseProvider:(id)a3
{
  id v4 = a3;
  __int16 v5 = objc_opt_new();
  id v6 = [[WFWorkflowRunCoordinator alloc] initWithUserNotificationManager:v5 databaseProvider:v4];
  uint64_t v7 = [[WFTriggerRegistrar alloc] initWithDatabaseProvider:v4 eventHandler:0 userNotificationManager:v5];
  v8 = [MEMORY[0x1E4F29290] anonymousListener];
  v9 = [(VCXPCServer *)self initWithXPCListener:v8 databaseProvider:v4 triggerRegistrar:v7 syncCoordinator:0 syncDataEndpoint:0 runCoordinator:v6 eventHandler:0 appShortcutsUpdater:0 contextualActionSyncService:0];

  if (v9)
  {
    v9->_skipEntitlementsCheck = 1;
    v10 = v9;
  }

  return v9;
}

- (VCXPCServer)initWithDatabaseProvider:(id)a3 triggerRegistrar:(id)a4 syncCoordinator:(id)a5 syncDataEndpoint:(id)a6 runCoordinator:(id)a7 eventHandler:(id)a8 appShortcutsUpdater:(id)a9 contextualActionSyncService:(id)a10
{
  id v17 = (objc_class *)MEMORY[0x1E4F29290];
  id v18 = a10;
  id v19 = a9;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  id v26 = [v17 alloc];
  v27 = (void *)[v26 initWithMachServiceName:*MEMORY[0x1E4FB4C30]];
  id v28 = [(VCXPCServer *)self initWithXPCListener:v27 databaseProvider:v25 triggerRegistrar:v24 syncCoordinator:v23 syncDataEndpoint:v22 runCoordinator:v21 eventHandler:v20 appShortcutsUpdater:v19 contextualActionSyncService:v18];

  return v28;
}

@end