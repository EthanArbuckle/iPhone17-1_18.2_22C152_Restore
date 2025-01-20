@interface MCCCategoryRulesController
- (BOOL)createRuleWithSender:(id)a3 category:(id)a4 lastModified:(double)a5 type:(id)a6;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)notifyWebRuleWithSender:(id)a3 category:(id)a4 lastModified:(double)a5;
- (BOOL)sendPendingRules:(id)a3;
- (MCCCategoryRulesController)init;
- (MCCCategoryRulesDelegate)delegate;
- (void)_checkConnection;
- (void)agentIsAlive;
- (void)dealloc;
- (void)init;
- (void)overrideRulesChanged:(id)a3;
- (void)registerForWebRuleNotifications;
- (void)rulesChanged:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setupReconnectTimer;
@end

@implementation MCCCategoryRulesController

- (MCCCategoryRulesController)init
{
  v18.receiver = self;
  v18.super_class = (Class)MCCCategoryRulesController;
  v2 = [(MCCCategoryRulesController *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08D88] anonymousListener];
    callbackListener = v2->_callbackListener;
    v2->_callbackListener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_callbackListener setDelegate:v2];
    v5 = [[MCCSecretAgentController alloc] initWithCallbackListener:v2->_callbackListener];
    agentController = v2->_agentController;
    v2->_agentController = v5;

    objc_initWeak(&location, v2);
    v7 = [MCCBgTimer alloc];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    v14 = __34__MCCCategoryRulesController_init__block_invoke;
    v15 = &unk_2655BA8E8;
    objc_copyWeak(&v16, &location);
    uint64_t v8 = [(MCCBgTimer *)v7 initWithTimeIntervalSinceNow:&v12 block:630.0];
    bgTimer = v2->_bgTimer;
    v2->_bgTimer = (MCCBgTimer *)v8;

    [(MCCBgTimer *)v2->_bgTimer start];
    v10 = _MCCLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[MCCCategoryRulesController init]();
    }

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __34__MCCCategoryRulesController_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkConnection];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262BBA000, v0, v1, "[rules] deallocated", v2, v3, v4, v5, v6);
}

- (void)registerForWebRuleNotifications
{
  uint64_t v3 = [MEMORY[0x263EFF910] date];
  lastCheckin = self->_lastCheckin;
  self->_lastCheckin = v3;

  agentController = self->_agentController;
  [(MCCSecretAgentController *)agentController registerCategoryRulesCallback];
}

- (BOOL)createRuleWithSender:(id)a3 category:(id)a4 lastModified:(double)a5 type:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([v12 isEqualToString:@"web"])
  {
    uint64_t v13 = [[RCWebRule alloc] initWithSender:v10 category:v11 lastModified:a5];
LABEL_5:
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x2020000000;
    char v23 = 0;
    agentController = self->_agentController;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __78__MCCCategoryRulesController_createRuleWithSender_category_lastModified_type___block_invoke;
    v19[3] = &unk_2655BA910;
    v19[4] = &v20;
    [(MCCSecretAgentController *)agentController createWebRule:v13 completion:v19];
    BOOL v17 = *((unsigned char *)v21 + 24) != 0;
    _Block_object_dispose(&v20, 8);
    goto LABEL_6;
  }
  uint64_t v14 = +[RCAddress addressWith:v10];
  if (v14)
  {
    v15 = (void *)v14;
    uint64_t v13 = [[RCOverrideRule alloc] initWithEmailAddress:v14 category:v11 categoryUpdateTime:a5];

    goto LABEL_5;
  }
  _MCCLogSystem();
  uint64_t v13 = (RCWebRule *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR)) {
    -[MCCCategoryRulesController createRuleWithSender:category:lastModified:type:]();
  }
  BOOL v17 = 0;
LABEL_6:

  return v17;
}

void __78__MCCCategoryRulesController_createRuleWithSender_category_lastModified_type___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v5)
  {
    uint8_t v6 = _MCCLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __78__MCCCategoryRulesController_createRuleWithSender_category_lastModified_type___block_invoke_cold_1();
    }
  }
}

- (BOOL)notifyWebRuleWithSender:(id)a3 category:(id)a4 lastModified:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [[RCWebRule alloc] initWithSender:v8 category:v9 lastModified:a5];
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  agentController = self->_agentController;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__MCCCategoryRulesController_notifyWebRuleWithSender_category_lastModified___block_invoke;
  v13[3] = &unk_2655BA910;
  v13[4] = &v14;
  [(MCCSecretAgentController *)agentController notifyWebRule:v10 completion:v13];
  LOBYTE(self) = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return (char)self;
}

void __76__MCCCategoryRulesController_notifyWebRuleWithSender_category_lastModified___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v5)
  {
    uint8_t v6 = _MCCLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __76__MCCCategoryRulesController_notifyWebRuleWithSender_category_lastModified___block_invoke_cold_1();
    }
  }
}

- (BOOL)sendPendingRules:(id)a3
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  agentController = self->_agentController;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__MCCCategoryRulesController_sendPendingRules___block_invoke;
  v7[3] = &unk_2655BA910;
  v7[4] = &v8;
  [(MCCSecretAgentController *)agentController sendPendingRulesWithType:v4 completion:v7];
  LOBYTE(self) = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return (char)self;
}

void __47__MCCCategoryRulesController_sendPendingRules___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (v5)
  {
    uint8_t v6 = _MCCLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __47__MCCCategoryRulesController_sendPendingRules___block_invoke_cold_1();
    }
  }
}

- (void)_checkConnection
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_262BBA000, log, OS_LOG_TYPE_DEBUG, "[rules] Checking last:%@ vs now:%@", (uint8_t *)&v4, 0x16u);
}

- (void)rulesChanged:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 categoryRulesController:self didReceiveRules:v8];
    }
  }
}

- (void)agentIsAlive
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262BBA000, v0, v1, "[rules] Remote service checked in", v2, v3, v4, v5, v6);
}

- (void)overrideRulesChanged:(id)a3
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = objc_loadWeakRetained((id *)&self->_delegate);
      [v7 categoryRulesController:self didReceiveOverrideRules:v8];
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  char v6 = (NSXPCListener *)a3;
  id v7 = a4;
  callbackListener = self->_callbackListener;
  if (callbackListener == v6)
  {
    id v9 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_270E0EC50];
    uint64_t v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    id v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    [v9 setClasses:v12 forSelector:sel_rulesChanged_ argumentIndex:0 ofReply:0];

    uint64_t v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    objc_super v18 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, objc_opt_class(), 0);
    [v9 setClasses:v18 forSelector:sel_overrideRulesChanged_ argumentIndex:0 ofReply:0];

    [v7 setExportedInterface:v9];
    [v7 setExportedObject:self];
    objc_initWeak(&location, self);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke;
    v22[3] = &unk_2655BA8E8;
    objc_copyWeak(&v23, &location);
    [v7 setInterruptionHandler:v22];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_71;
    v20[3] = &unk_2655BA8E8;
    objc_copyWeak(&v21, &location);
    [v7 setInvalidationHandler:v20];
    [v7 resume];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  else
  {
    id v9 = _MCCLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MCCCategoryRulesController listener:shouldAcceptNewConnection:]();
    }
  }

  return callbackListener == v6;
}

void __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v2 = _MCCLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_cold_1();
  }

  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v3);
    char v6 = [v5 delegate];

    if (v6)
    {
      id v7 = [v5 delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = [v5 delegate];
        [v9 categoryRulesController:v5 didAlterConnectionWithReason:1];
      }
    }
  }
}

void __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_71(uint64_t a1)
{
  uint64_t v2 = _MCCLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_71_cold_1();
  }

  uint64_t v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v3);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(v3);
    [v5 setupReconnectTimer];
  }
}

- (void)setupReconnectTimer
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262BBA000, v0, v1, "[rules] Starting reconnect timer", v2, v3, v4, v5, v6);
}

void __49__MCCCategoryRulesController_setupReconnectTimer__block_invoke(uint64_t a1)
{
  uint64_t v2 = _MCCLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __49__MCCCategoryRulesController_setupReconnectTimer__block_invoke_cold_4();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = _MCCLogSystem();
  id v5 = v4;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __49__MCCCategoryRulesController_setupReconnectTimer__block_invoke_cold_3();
    }

    id v5 = objc_loadWeakRetained((id *)(a1 + 40));
    [v5 registerForWebRuleNotifications];
    uint8_t v6 = [v5 delegate];

    if (v6)
    {
      id v7 = [v5 delegate];
      char v8 = objc_opt_respondsToSelector();

      if (v8)
      {
        id v9 = _MCCLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          __49__MCCCategoryRulesController_setupReconnectTimer__block_invoke_cold_2(a1, v9);
        }

        uint64_t v10 = [v5 delegate];
        [v10 categoryRulesController:*(void *)(a1 + 32) didAlterConnectionWithReason:4];
      }
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __49__MCCCategoryRulesController_setupReconnectTimer__block_invoke_cold_1();
  }
}

- (MCCCategoryRulesDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MCCCategoryRulesDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_reconnectTimer, 0);
  objc_storeStrong((id *)&self->_bgTimer, 0);
  objc_storeStrong((id *)&self->_lastCheckin, 0);
  objc_storeStrong((id *)&self->_callbackListener, 0);
  objc_storeStrong((id *)&self->_agentController, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262BBA000, v0, v1, "[rules] started checkup timer", v2, v3, v4, v5, v6);
}

- (void)createRuleWithSender:category:lastModified:type:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "[rules] '%@' is not in standard form", v2, v3, v4, v5, v6);
}

void __78__MCCCategoryRulesController_createRuleWithSender_category_lastModified_type___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "[rules] Remote create-web-rule failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __76__MCCCategoryRulesController_notifyWebRuleWithSender_category_lastModified___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "[rules] Remote notify-web-rule failed with error: %{public}@", v2, v3, v4, v5, v6);
}

void __47__MCCCategoryRulesController_sendPendingRules___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_262BBA000, v0, v1, "Remote send pending rules failed with error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_262BBA000, v1, OS_LOG_TYPE_ERROR, "[rules] MCCCategoryRulesController NOT accepting new connection: %@ vs %@\n", v2, 0x16u);
}

void __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_262BBA000, v0, v1, "[rules] NSXPCListenerDelegate interrupted", v2, v3, v4, v5, v6);
}

void __65__MCCCategoryRulesController_listener_shouldAcceptNewConnection___block_invoke_71_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262BBA000, v0, v1, "[rules] NSXPCListenerDelegate invalidated", v2, v3, v4, v5, v6);
}

void __49__MCCCategoryRulesController_setupReconnectTimer__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4(&dword_262BBA000, v0, v1, "[rules] Self is deallocated, timer won't work", v2, v3, v4, v5, v6);
}

void __49__MCCCategoryRulesController_setupReconnectTimer__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [*(id *)(a1 + 32) delegate];
  OUTLINED_FUNCTION_3();
  __int16 v5 = 1024;
  int v6 = 4;
  _os_log_debug_impl(&dword_262BBA000, a2, OS_LOG_TYPE_DEBUG, "[rules] Sending to client %@:%d", v4, 0x12u);
}

void __49__MCCCategoryRulesController_setupReconnectTimer__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262BBA000, v0, v1, "[rules] Self does exist, firing timer", v2, v3, v4, v5, v6);
}

void __49__MCCCategoryRulesController_setupReconnectTimer__block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_262BBA000, v0, v1, "[rules] Attempting reconnect to launchagent", v2, v3, v4, v5, v6);
}

@end