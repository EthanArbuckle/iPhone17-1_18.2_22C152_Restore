@interface SPFinderStateManager
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (OS_dispatch_queue)queue;
- (SPFinderStateManager)init;
- (SPFinderStateXPCProtocol)proxy;
- (id)remoteInterface;
- (id)stateChangedBlock;
- (id)stateInfoChangedBlock;
- (void)dealloc;
- (void)disableFinderModeWithCompletion:(id)a3;
- (void)enableFinderModeWithCompletion:(id)a3;
- (void)fetchFinderState:(id)a3;
- (void)setActiveCache:(int64_t)a3 completion:(id)a4;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
- (void)setStateChangedBlock:(id)a3;
- (void)setStateInfoChangedBlock:(id)a3;
- (void)start;
- (void)stateInfoWithCompletion:(id)a3;
- (void)updateStateBlock;
@end

@implementation SPFinderStateManager

- (SPFinderStateManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)SPFinderStateManager;
  v2 = [(SPFinderStateManager *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.SPFinderStateManager", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc(MEMORY[0x263F3BA20]);
    v7 = [(SPFinderStateManager *)v2 remoteInterface];
    uint64_t v8 = [v6 initWithMachServiceName:@"com.apple.icloud.searchpartyd.finderstatemanager" options:0 remoteObjectInterface:v7 interruptionHandler:0 invalidationHandler:0];
    serviceDescription = v2->_serviceDescription;
    v2->_serviceDescription = (FMXPCServiceDescription *)v8;
  }
  return v2;
}

- (id)remoteInterface
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D312BF8];
  v3 = (void *)MEMORY[0x263EFFA08];
  v7[0] = objc_opt_class();
  dispatch_queue_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = [v3 setWithArray:v4];
  [v2 setClasses:v5 forSelector:sel_stateInfoWithCompletion_ argumentIndex:0 ofReply:1];

  return v2;
}

- (void)start
{
  v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2211E2000, v3, OS_LOG_TYPE_DEFAULT, "SPFinderStateManager: start observing state change notification", v5, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)finderStateChangedHandler, @"SPFinderStateChangedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  [(SPFinderStateManager *)self updateStateBlock];
}

- (void)enableFinderModeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2211E2000, v5, OS_LOG_TYPE_DEFAULT, "enableFinderModeWithCompletion", buf, 2u);
  }

  id v6 = [(SPFinderStateManager *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __55__SPFinderStateManager_enableFinderModeWithCompletion___block_invoke;
  v8[3] = &unk_264597B70;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __55__SPFinderStateManager_enableFinderModeWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __55__SPFinderStateManager_enableFinderModeWithCompletion___block_invoke_2;
  v2[3] = &unk_264597B70;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  _os_activity_initiate(&dword_2211E2000, "SPFinderStateManager enableFinderModeWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, v2);
}

void __55__SPFinderStateManager_enableFinderModeWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 enableFinderModeWithCompletion:*(void *)(a1 + 40)];
}

- (void)disableFinderModeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2211E2000, v5, OS_LOG_TYPE_DEFAULT, "disableFinderModeWithCompletion", buf, 2u);
  }

  id v6 = [(SPFinderStateManager *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __56__SPFinderStateManager_disableFinderModeWithCompletion___block_invoke;
  v8[3] = &unk_264597B70;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __56__SPFinderStateManager_disableFinderModeWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __56__SPFinderStateManager_disableFinderModeWithCompletion___block_invoke_2;
  v2[3] = &unk_264597B70;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  _os_activity_initiate(&dword_2211E2000, "SPFinderStateManager disableFinderModeWithCompletion:", OS_ACTIVITY_FLAG_DEFAULT, v2);
}

void __56__SPFinderStateManager_disableFinderModeWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 disableFinderModeWithCompletion:*(void *)(a1 + 40)];
}

- (void)setActiveCache:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(SPFinderStateManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SPFinderStateManager_setActiveCache_completion___block_invoke;
  block[3] = &unk_264597BA0;
  id v10 = v6;
  int64_t v11 = a3;
  block[4] = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __50__SPFinderStateManager_setActiveCache_completion___block_invoke(void *a1)
{
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __50__SPFinderStateManager_setActiveCache_completion___block_invoke_2;
  activity_block[3] = &unk_264597BA0;
  id v2 = (void *)a1[5];
  uint64_t v1 = a1[6];
  activity_block[4] = a1[4];
  uint64_t v5 = v1;
  id v4 = v2;
  _os_activity_initiate(&dword_2211E2000, "SPFinderStateManager setActiveCache:completion:", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __50__SPFinderStateManager_setActiveCache_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 setActiveCache:*(void *)(a1 + 48) completion:*(void *)(a1 + 40)];
}

- (void)updateStateBlock
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __40__SPFinderStateManager_updateStateBlock__block_invoke;
  v2[3] = &unk_264597BF0;
  v2[4] = self;
  [(SPFinderStateManager *)self stateInfoWithCompletion:v2];
}

void __40__SPFinderStateManager_updateStateBlock__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = LogCategory_Unspecified();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __40__SPFinderStateManager_updateStateBlock__block_invoke_cold_1((uint64_t)v6, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v16 = [v5 state];
      _os_log_impl(&dword_2211E2000, v8, OS_LOG_TYPE_DEFAULT, "Fetched latest finder state %i:", buf, 8u);
    }

    id v9 = [*(id *)(a1 + 32) stateChangedBlock];

    if (v9)
    {
      activity_block[0] = MEMORY[0x263EF8330];
      activity_block[1] = 3221225472;
      activity_block[2] = __40__SPFinderStateManager_updateStateBlock__block_invoke_65;
      activity_block[3] = &unk_264597BC8;
      activity_block[4] = *(void *)(a1 + 32);
      id v14 = v5;
      _os_activity_initiate(&dword_2211E2000, "SPFinderStateManager stateChangedBlock", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
    }
    id v10 = [*(id *)(a1 + 32) stateInfoChangedBlock];

    if (v10)
    {
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __40__SPFinderStateManager_updateStateBlock__block_invoke_2;
      v11[3] = &unk_264597BC8;
      v11[4] = *(void *)(a1 + 32);
      id v12 = v5;
      _os_activity_initiate(&dword_2211E2000, "SPFinderStateManager stateInfoChangedBlock", OS_ACTIVITY_FLAG_DEFAULT, v11);
    }
  }
}

void __40__SPFinderStateManager_updateStateBlock__block_invoke_65(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateChangedBlock];
  v2[2](v2, [*(id *)(a1 + 40) state]);
}

void __40__SPFinderStateManager_updateStateBlock__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateInfoChangedBlock];
  v2[2](v2, *(void *)(a1 + 40));
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = LogCategory_Unspecified();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = self;
    _os_log_impl(&dword_2211E2000, v3, OS_LOG_TYPE_DEFAULT, "SPFinderStateManager: Dealloc %@", buf, 0xCu);
  }

  id v4 = [(SPFinderStateManager *)self session];
  [v4 invalidate];

  [(SPFinderStateManager *)self setSession:0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"SPFinderStateChangedNotification", 0);
  v6.receiver = self;
  v6.super_class = (Class)SPFinderStateManager;
  [(SPFinderStateManager *)&v6 dealloc];
}

- (SPFinderStateXPCProtocol)proxy
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(SPFinderStateManager *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SPFinderStateManager *)self session];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F3BA28]);
    objc_super v6 = [(SPFinderStateManager *)self serviceDescription];
    id v7 = (void *)[v5 initWithServiceDescription:v6];
    [(SPFinderStateManager *)self setSession:v7];

    id v8 = LogCategory_Unspecified();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(SPFinderStateManager *)self serviceDescription];
      id v10 = [v9 machService];
      int v15 = 138412290;
      int v16 = v10;
      _os_log_impl(&dword_2211E2000, v8, OS_LOG_TYPE_DEFAULT, "SPFinderStateManager: Establishing XPC connection to %@", (uint8_t *)&v15, 0xCu);
    }
    int64_t v11 = [(SPFinderStateManager *)self session];
    [v11 resume];
  }
  id v12 = [(SPFinderStateManager *)self session];
  v13 = [v12 proxy];

  return (SPFinderStateXPCProtocol *)v13;
}

- (void)fetchFinderState:(id)a3
{
  id v4 = a3;
  id v5 = LogCategory_Unspecified();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2211E2000, v5, OS_LOG_TYPE_DEFAULT, "fetching Finder State...", buf, 2u);
  }

  objc_super v6 = [(SPFinderStateManager *)self queue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__SPFinderStateManager_fetchFinderState___block_invoke;
  v8[3] = &unk_264597B70;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __41__SPFinderStateManager_fetchFinderState___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __41__SPFinderStateManager_fetchFinderState___block_invoke_2;
  v2[3] = &unk_264597B70;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  _os_activity_initiate(&dword_2211E2000, "SPFinderStateManager fetchFinderState", OS_ACTIVITY_FLAG_DEFAULT, v2);
}

void __41__SPFinderStateManager_fetchFinderState___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 fetchFinderState:*(void *)(a1 + 40)];
}

- (void)stateInfoWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(SPFinderStateManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __48__SPFinderStateManager_stateInfoWithCompletion___block_invoke;
  v7[3] = &unk_264597B70;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __48__SPFinderStateManager_stateInfoWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __48__SPFinderStateManager_stateInfoWithCompletion___block_invoke_2;
  v2[3] = &unk_264597B70;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  _os_activity_initiate(&dword_2211E2000, "SPFinderStateManager stateInfoWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, v2);
}

void __48__SPFinderStateManager_stateInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxy];
  [v2 stateInfoWithCompletion:*(void *)(a1 + 40)];
}

- (id)stateInfoChangedBlock
{
  return self->stateInfoChangedBlock;
}

- (void)setStateInfoChangedBlock:(id)a3
{
}

- (id)stateChangedBlock
{
  return self->_stateChangedBlock;
}

- (void)setStateChangedBlock:(id)a3
{
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void)setProxy:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
  objc_storeStrong(&self->_stateChangedBlock, 0);
  objc_storeStrong(&self->stateInfoChangedBlock, 0);
}

void __40__SPFinderStateManager_updateStateBlock__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2211E2000, a2, OS_LOG_TYPE_ERROR, "Error fetching latest state change: %@", (uint8_t *)&v2, 0xCu);
}

@end