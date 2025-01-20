@interface SCLSuppressSchoolModeAssertionManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSHashTable)observers;
- (NSMutableSet)acquiredClients;
- (NSMutableSet)clients;
- (NSXPCListener)listener;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)targetQueue;
- (SCLSuppressSchoolModeAssertionManager)initWithTargetQueue:(id)a3;
- (os_state_data_s)_stateDataWithHints:(os_state_hints_s *)a3;
- (unint64_t)stateHandle;
- (unint64_t)status;
- (void)activate;
- (void)addObserver:(id)a3;
- (void)clientDidAcquireAssertion:(id)a3;
- (void)clientDidInvalidate:(id)a3;
- (void)dealloc;
- (void)performObserverBlock:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setAcquiredClients:(id)a3;
- (void)setClients:(id)a3;
- (void)setListener:(id)a3;
- (void)setObservers:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)setTargetQueue:(id)a3;
@end

@implementation SCLSuppressSchoolModeAssertionManager

- (SCLSuppressSchoolModeAssertionManager)initWithTargetQueue:(id)a3
{
  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SCLSuppressSchoolModeAssertionManager;
  v6 = [(SCLSuppressSchoolModeAssertionManager *)&v20 init];
  if (v6)
  {
    uint64_t v7 = [MEMORY[0x263EFF9C0] set];
    clients = v6->_clients;
    v6->_clients = (NSMutableSet *)v7;

    uint64_t v9 = [MEMORY[0x263EFF9C0] set];
    acquiredClients = v6->_acquiredClients;
    v6->_acquiredClients = (NSMutableSet *)v9;

    uint64_t v11 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v11;

    dispatch_queue_t v13 = dispatch_queue_create_with_target_V2("SCLSuppressSchoolModeAssertionManager", 0, v5);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v6->_targetQueue, a3);
    uint64_t v15 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:0x26DF07FF8];
    listener = v6->_listener;
    v6->_listener = (NSXPCListener *)v15;

    [(NSXPCListener *)v6->_listener _setQueue:v6->_queue];
    [(NSXPCListener *)v6->_listener setDelegate:v6];
    objc_initWeak(&location, v6);
    objc_copyWeak(&v18, &location);
    v6->_stateHandle = os_state_add_handler();
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v6;
}

uint64_t __61__SCLSuppressSchoolModeAssertionManager_initWithTargetQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained _stateDataWithHints:a2];

  return v4;
}

- (void)dealloc
{
  os_state_remove_handler();
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SCLSuppressSchoolModeAssertionManager;
  [(SCLSuppressSchoolModeAssertionManager *)&v3 dealloc];
}

- (void)activate
{
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  v6 = [[SCLSuppressSchoolModeAssertionClient alloc] initWithConnection:v5];
  [(SCLSuppressSchoolModeAssertionClient *)v6 setDelegate:self];
  uint64_t v7 = [(SCLSuppressSchoolModeAssertionManager *)self clients];
  [v7 addObject:v6];

  v8 = [(SCLSuppressSchoolModeAssertionManager *)self queue];
  [v5 _setQueue:v8];

  [v5 resume];
  return 1;
}

- (void)clientDidAcquireAssertion:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SCLSuppressSchoolModeAssertionManager *)self queue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = [(SCLSuppressSchoolModeAssertionManager *)self status];
  uint64_t v7 = [(SCLSuppressSchoolModeAssertionManager *)self acquiredClients];
  [v7 addObject:v4];

  unint64_t v8 = [(SCLSuppressSchoolModeAssertionManager *)self status];
  uint64_t v9 = scl_framework_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_22B7B4000, v9, OS_LOG_TYPE_DEFAULT, "Acquired suppression assertion for %@", buf, 0xCu);
  }

  if (v6 != v8)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __67__SCLSuppressSchoolModeAssertionManager_clientDidAcquireAssertion___block_invoke;
    v10[3] = &unk_2648ACC68;
    v10[4] = self;
    v10[5] = v8;
    [(SCLSuppressSchoolModeAssertionManager *)self performObserverBlock:v10];
  }
}

uint64_t __67__SCLSuppressSchoolModeAssertionManager_clientDidAcquireAssertion___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assertionManager:*(void *)(a1 + 32) didUpdateAssertionsStatus:*(void *)(a1 + 40)];
}

- (void)clientDidInvalidate:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(SCLSuppressSchoolModeAssertionManager *)self queue];
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = [(SCLSuppressSchoolModeAssertionManager *)self status];
  uint64_t v7 = [(SCLSuppressSchoolModeAssertionManager *)self acquiredClients];
  [v7 removeObject:v4];

  unint64_t v8 = [(SCLSuppressSchoolModeAssertionManager *)self clients];
  [v8 removeObject:v4];

  unint64_t v9 = [(SCLSuppressSchoolModeAssertionManager *)self status];
  v10 = scl_framework_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v4;
    _os_log_impl(&dword_22B7B4000, v10, OS_LOG_TYPE_DEFAULT, "Relinquished suppression assertion for %@", buf, 0xCu);
  }

  if (v6 != v9)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__SCLSuppressSchoolModeAssertionManager_clientDidInvalidate___block_invoke;
    v11[3] = &unk_2648ACC68;
    v11[4] = self;
    v11[5] = v9;
    [(SCLSuppressSchoolModeAssertionManager *)self performObserverBlock:v11];
  }
}

uint64_t __61__SCLSuppressSchoolModeAssertionManager_clientDidInvalidate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 assertionManager:*(void *)(a1 + 32) didUpdateAssertionsStatus:*(void *)(a1 + 40)];
}

- (unint64_t)status
{
  objc_super v3 = [(SCLSuppressSchoolModeAssertionManager *)self targetQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(SCLSuppressSchoolModeAssertionManager *)self acquiredClients];
  unint64_t v5 = [v4 count] != 0;

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SCLSuppressSchoolModeAssertionManager *)self targetQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SCLSuppressSchoolModeAssertionManager *)self observers];
  [v6 addObject:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SCLSuppressSchoolModeAssertionManager *)self targetQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SCLSuppressSchoolModeAssertionManager *)self observers];
  [v6 removeObject:v4];
}

- (void)performObserverBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  unint64_t v5 = [(SCLSuppressSchoolModeAssertionManager *)self targetQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(SCLSuppressSchoolModeAssertionManager *)self observers];
  uint64_t v7 = [v6 allObjects];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (os_state_data_s)_stateDataWithHints:(os_state_hints_s *)a3
{
  id v4 = [(SCLSuppressSchoolModeAssertionManager *)self queue];
  dispatch_assert_queue_V2(v4);

  unint64_t v5 = [MEMORY[0x263F29C40] builderWithObject:self];
  unint64_t v6 = [(SCLSuppressSchoolModeAssertionManager *)self status];
  uint64_t v7 = @"active";
  if (v6 != 1) {
    uint64_t v7 = 0;
  }
  if (v6) {
    id v8 = v7;
  }
  else {
    id v8 = @"inactive";
  }
  id v9 = (id)[v5 appendObject:v8 withName:@"status"];
  uint64_t v10 = [(SCLSuppressSchoolModeAssertionManager *)self clients];
  uint64_t v11 = [v10 allObjects];
  [v5 appendArraySection:v11 withName:@"clients" skipIfEmpty:0];

  uint64_t v12 = [v5 build];
  long long v13 = (os_state_data_s *)SCLSStateDataWithTitleDescriptionAndHints(@"SCLSuppressSchoolModeAssertionManager", (uint64_t)v12);

  return v13;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (void)setTargetQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableSet)clients
{
  return self->_clients;
}

- (void)setClients:(id)a3
{
}

- (NSMutableSet)acquiredClients
{
  return self->_acquiredClients;
}

- (void)setAcquiredClients:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_acquiredClients, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_targetQueue, 0);
}

@end