@interface UNCNotificationSystemServiceListener
- (UNCNotificationSystemServiceListener)initWithDelegate:(id)a3;
- (void)activate;
- (void)dealloc;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)systemServiceConnectionDidInvalidate:(id)a3;
@end

@implementation UNCNotificationSystemServiceListener

- (UNCNotificationSystemServiceListener)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNCNotificationSystemServiceListener;
  v5 = [(UNCNotificationSystemServiceListener *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.usernotifications.UNCNotificationSystemServiceListener", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x263EFF980] array];
    queue_connections = v6->_queue_connections;
    v6->_queue_connections = (NSMutableArray *)v10;
  }
  return v6;
}

- (void)dealloc
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__UNCNotificationSystemServiceListener_dealloc__block_invoke;
  block[3] = &unk_265567728;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)UNCNotificationSystemServiceListener;
  [(UNCNotificationSystemServiceListener *)&v4 dealloc];
}

uint64_t __47__UNCNotificationSystemServiceListener_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) invalidate];
}

- (void)activate
{
  v3 = +[UNCNotificationSystemService domain];
  objc_super v4 = +[UNCNotificationSystemService serviceInterface];
  [(BSServiceConnectionListener *)self->_queue_listener invalidate];
  v5 = (void *)MEMORY[0x263F2B9E0];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __48__UNCNotificationSystemServiceListener_activate__block_invoke;
  v17[3] = &unk_265567CC0;
  id v6 = v3;
  id v18 = v6;
  id v7 = v4;
  id v19 = v7;
  v20 = self;
  dispatch_queue_t v8 = [v5 listenerWithConfigurator:v17];
  queue_listener = self->_queue_listener;
  self->_queue_listener = v8;

  [(BSServiceConnectionListener *)self->_queue_listener activate];
  uint64_t v10 = [MEMORY[0x263F2BA00] bootstrapConfiguration];
  v11 = [v10 domainForIdentifier:v6];
  v12 = [v7 identifier];
  objc_super v13 = [v11 serviceForIdentifier:v12];
  v14 = [v13 optionForKey:@"isAutomatic"];
  char v15 = [v14 BOOLValue];

  if ((v15 & 1) == 0) {
    id v16 = (id)[MEMORY[0x263F2BA00] activateManualDomain:v6];
  }
}

void __48__UNCNotificationSystemServiceListener_activate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v5 = a2;
  [v5 setDomain:v3];
  objc_super v4 = [*(id *)(a1 + 40) identifier];
  [v5 setService:v4];

  [v5 setDelegate:*(void *)(a1 + 48)];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v6 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__UNCNotificationSystemServiceListener_listener_didReceiveConnection_withContext___block_invoke;
  v9[3] = &unk_265567628;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  dispatch_async(queue, v9);
}

void __82__UNCNotificationSystemServiceListener_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteToken];
  if ([v2 hasEntitlement:@"com.apple.private.usernotifications.systemservice"])
  {
    uint64_t v3 = [UNCNotificationSystemServiceConnection alloc];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 8));
    id v7 = [(UNCNotificationSystemServiceConnection *)v3 initWithConnection:v4 connectionDelegate:v5 delegate:WeakRetained];

    [*(id *)(*(void *)(a1 + 40) + 32) addObject:v7];
  }
  else
  {
    [*(id *)(a1 + 32) invalidate];
    id v8 = (void *)*MEMORY[0x263F1E010];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1E010], OS_LOG_TYPE_ERROR)) {
      __82__UNCNotificationSystemServiceListener_listener_didReceiveConnection_withContext___block_invoke_cold_1(v8, v2);
    }
  }
}

- (void)systemServiceConnectionDidInvalidate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __77__UNCNotificationSystemServiceListener_systemServiceConnectionDidInvalidate___block_invoke;
  v7[3] = &unk_265567628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __77__UNCNotificationSystemServiceListener_systemServiceConnectionDidInvalidate___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) removeObjectIdenticalTo:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_connections, 0);
  objc_storeStrong((id *)&self->_queue_listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __82__UNCNotificationSystemServiceListener_listener_didReceiveConnection_withContext___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  id v4 = [a2 bundleID];
  int v6 = 138543618;
  id v7 = v4;
  __int16 v8 = 2114;
  id v9 = (id)objc_opt_class();
  id v5 = v9;
  _os_log_error_impl(&dword_2608DB000, v3, OS_LOG_TYPE_ERROR, "Entitlement is missing. %{public}@ could not connect to %{public}@.", (uint8_t *)&v6, 0x16u);
}

@end