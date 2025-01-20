@interface PUConnection
+ (id)clientInterface;
+ (id)serverInterface;
- (PUConnection)init;
- (PUConnection)initWithDelegate:(id)a3;
- (PUConnectionDelegate)delegate;
- (const)queueNameWithSuffix:(id)a3;
- (id)delegateIfRespondsToSelector:(SEL)a3;
- (id)remoteDeviceRemoveLockoutHandler;
- (id)serverConnection;
- (void)dealloc;
- (void)didDisableOnlyRemoteUnlock:(BOOL)a3 error:(id)a4;
- (void)didEnableOnlyRemoteUnlock:(BOOL)a3 error:(id)a4;
- (void)didGetRemoteDeviceState:(id)a3 error:(id)a4;
- (void)didPairForUnlock:(BOOL)a3 error:(id)a4;
- (void)didUnpairForUnlock:(BOOL)a3 error:(id)a4;
- (void)disableOnlyRemoteUnlock;
- (void)enableOnlyRemoteUnlockWithPasscode:(id)a3;
- (void)getRemoteDeviceState:(id)a3;
- (void)pairForUnlockWithPasscode:(id)a3;
- (void)queryRemoteDeviceState:(id)a3;
- (void)remoteDeviceDidCompleteRemoteAction:(BOOL)a3 remoteDeviceState:(id)a4 error:(id)a5;
- (void)remoteDeviceDidRemoveLockout:(BOOL)a3 error:(id)a4;
- (void)remoteDeviceDidUnlock;
- (void)requestDeviceSetWristDetectionDisabled:(BOOL)a3 completion:(id)a4;
- (void)requestRemoteDeviceRemoteAction:(int64_t)a3 type:(int64_t)a4;
- (void)requestRemoteDeviceRemoveLockout:(id)a3;
- (void)requestRemoteDeviceUnlockNotification;
- (void)setDelegate:(id)a3;
- (void)setRemoteDeviceRemoveLockoutHandler:(id)a3;
- (void)setServerConnection:(id)a3;
- (void)unpairForUnlock;
@end

@implementation PUConnection

- (PUConnection)initWithDelegate:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUConnection;
  v5 = [(PUConnection *)&v14 init];
  v6 = v5;
  if (v5)
  {
    dispatch_queue_t v7 = dispatch_queue_create([(PUConnection *)v5 queueNameWithSuffix:@"connection"], 0);
    serverConnectionQueue = v6->_serverConnectionQueue;
    v6->_serverConnectionQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create([(PUConnection *)v6 queueNameWithSuffix:@"delegate"], 0);
    delegateQueue = v6->_delegateQueue;
    v6->_delegateQueue = (OS_dispatch_queue *)v9;

    objc_storeWeak((id *)&v6->_delegate, v4);
    v11 = [[PUConnectionUnlockClient alloc] initWithConnection:v6];
    unlockClient = v6->_unlockClient;
    v6->_unlockClient = v11;
  }
  return v6;
}

- (PUConnection)init
{
  return [(PUConnection *)self initWithDelegate:0];
}

- (const)queueNameWithSuffix:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  dispatch_queue_t v7 = [v3 stringWithFormat:@"%@-%@", v6, v4];

  id v8 = v7;
  dispatch_queue_t v9 = (const char *)[v8 UTF8String];

  return v9;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_serverConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PUConnection;
  [(PUConnection *)&v3 dealloc];
}

+ (id)serverInterface
{
  if (serverInterface_onceToken != -1) {
    dispatch_once(&serverInterface_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)serverInterface___serverInterface;
  return v2;
}

void __31__PUConnection_serverInterface__block_invoke()
{
  v0 = (void *)MEMORY[0x263F08D80];
  v1 = &unk_26D669528;
  uint64_t v2 = [v0 interfaceWithProtocol:v1];
  objc_super v3 = (void *)serverInterface___serverInterface;
  serverInterface___serverInterface = v2;

  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(id)serverInterface___serverInterface setClasses:v6 forSelector:sel_queryRemoteDeviceState_ argumentIndex:0 ofReply:1];
}

+ (id)clientInterface
{
  if (clientInterface_onceToken != -1) {
    dispatch_once(&clientInterface_onceToken, &__block_literal_global_106);
  }
  uint64_t v2 = (void *)clientInterface___clientInterface;
  return v2;
}

void __31__PUConnection_clientInterface__block_invoke()
{
  v0 = (void *)MEMORY[0x263F08D80];
  v1 = &unk_26D668EF8;
  uint64_t v2 = [v0 interfaceWithProtocol:v1];
  objc_super v3 = (void *)clientInterface___clientInterface;
  clientInterface___clientInterface = v2;

  id v4 = (void *)MEMORY[0x263EFFA08];
  uint64_t v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(id)clientInterface___clientInterface setClasses:v6 forSelector:sel_remoteDeviceDidCompleteRemoteAction_remoteDeviceState_error_ argumentIndex:1 ofReply:0];
  [(id)clientInterface___clientInterface setClasses:v6 forSelector:sel_didGetRemoteDeviceState_error_ argumentIndex:0 ofReply:0];
}

- (id)serverConnection
{
  serverConnectionQueue = self->_serverConnectionQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __32__PUConnection_serverConnection__block_invoke;
  block[3] = &unk_2646A7FA8;
  block[4] = self;
  dispatch_sync(serverConnectionQueue, block);
  return self->_serverConnection;
}

void __32__PUConnection_serverConnection__block_invoke(uint64_t a1)
{
  if (!*(void *)(*(void *)(a1 + 32) + 8))
  {
    uint64_t v2 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.paired-unlock" options:4096];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 8);
    *(void *)(v3 + 8) = v2;

    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 8);
    id v6 = [(id)objc_opt_class() serverInterface];
    [v5 setRemoteObjectInterface:v6];

    dispatch_queue_t v7 = *(void **)(*(void *)(a1 + 32) + 8);
    id v8 = [(id)objc_opt_class() clientInterface];
    [v7 setExportedInterface:v8];

    [*(id *)(*(void *)(a1 + 32) + 8) setExportedObject:*(void *)(*(void *)(a1 + 32) + 32)];
    [*(id *)(*(void *)(a1 + 32) + 8) setInterruptionHandler:&__block_literal_global_127];
    objc_initWeak(&location, *(id *)(a1 + 32));
    dispatch_queue_t v9 = *(void **)(*(void *)(a1 + 32) + 8);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __32__PUConnection_serverConnection__block_invoke_3;
    v14[3] = &unk_2646A7F58;
    objc_copyWeak(&v15, &location);
    [v9 setInvalidationHandler:v14];
    [*(id *)(*(void *)(a1 + 32) + 8) resume];
    v10 = *(void **)(*(void *)(a1 + 32) + 8);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __32__PUConnection_serverConnection__block_invoke_4;
    v12[3] = &unk_2646A7F80;
    objc_copyWeak(&v13, &location);
    v11 = [v10 remoteObjectProxyWithErrorHandler:v12];
    [v11 checkIn];

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __32__PUConnection_serverConnection__block_invoke_2()
{
}

void __32__PUConnection_serverConnection__block_invoke_3(uint64_t a1)
{
  NSLog(&cfstr_UnlockManagerC_0.isa);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setServerConnection:0];
}

void __32__PUConnection_serverConnection__block_invoke_4(uint64_t a1, uint64_t a2)
{
  NSLog(&cfstr_PairedunlockCo.isa, a2);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setServerConnection:0];
}

- (void)setServerConnection:(id)a3
{
  id v4 = a3;
  serverConnectionQueue = self->_serverConnectionQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __36__PUConnection_setServerConnection___block_invoke;
  v7[3] = &unk_2646A7FD0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serverConnectionQueue, v7);
}

void __36__PUConnection_setServerConnection___block_invoke(uint64_t a1)
{
}

- (void)pairForUnlockWithPasscode:(id)a3
{
  id v4 = a3;
  id v6 = [(PUConnection *)self serverConnection];
  uint64_t v5 = [v6 remoteObjectProxy];
  [v5 pairForUnlockWithPasscode:v4];
}

- (void)unpairForUnlock
{
  id v3 = [(PUConnection *)self serverConnection];
  uint64_t v2 = [v3 remoteObjectProxy];
  [v2 unpairForUnlock];
}

- (void)enableOnlyRemoteUnlockWithPasscode:(id)a3
{
  id v4 = a3;
  id v6 = [(PUConnection *)self serverConnection];
  uint64_t v5 = [v6 remoteObjectProxy];
  [v5 enableOnlyRemoteUnlockWithPasscode:v4];
}

- (void)disableOnlyRemoteUnlock
{
  id v3 = [(PUConnection *)self serverConnection];
  uint64_t v2 = [v3 remoteObjectProxy];
  [v2 disableOnlyRemoteUnlock];
}

- (void)requestRemoteDeviceRemoteAction:(int64_t)a3 type:(int64_t)a4
{
  id v7 = [(PUConnection *)self serverConnection];
  id v6 = [v7 remoteObjectProxy];
  [v6 requestRemoteDeviceRemoteAction:a3 type:a4];
}

- (void)requestRemoteDeviceUnlockNotification
{
  id v3 = [(PUConnection *)self serverConnection];
  uint64_t v2 = [v3 remoteObjectProxy];
  [v2 requestRemoteDeviceUnlockNotification];
}

- (void)requestRemoteDeviceRemoveLockout:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__PUConnection_requestRemoteDeviceRemoveLockout___block_invoke;
  block[3] = &unk_2646A7FF8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __49__PUConnection_requestRemoteDeviceRemoveLockout___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 40));
  uint64_t v2 = (void *)[*(id *)(a1 + 32) copy];
  id v3 = objc_loadWeakRetained(&to);
  [v3 setRemoteDeviceRemoveLockoutHandler:v2];

  id v4 = objc_loadWeakRetained(&to);
  uint64_t v5 = [v4 serverConnection];
  id v6 = [v5 remoteObjectProxy];
  [v6 requestRemoteDeviceRemoveLockout];

  objc_destroyWeak(&to);
}

- (void)requestDeviceSetWristDetectionDisabled:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = pu_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = [NSNumber numberWithBool:v4];
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_2232EA000, v7, OS_LOG_TYPE_INFO, "connection requestDeviceSetWristDetectionDisabled: %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__PUConnection_requestDeviceSetWristDetectionDisabled_completion___block_invoke;
  block[3] = &unk_2646A8020;
  objc_copyWeak(&v13, (id *)buf);
  BOOL v14 = v4;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

void __66__PUConnection_requestDeviceSetWristDetectionDisabled_completion___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v2 = objc_loadWeakRetained(&to);
  id v3 = [v2 serverConnection];
  BOOL v4 = [v3 remoteObjectProxy];
  [v4 requestDeviceSetWristDetectionDisabled:*(unsigned __int8 *)(a1 + 48) completion:*(void *)(a1 + 32)];

  objc_destroyWeak(&to);
}

- (void)getRemoteDeviceState:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__PUConnection_getRemoteDeviceState___block_invoke;
  v6[3] = &unk_2646A8048;
  id v7 = v4;
  id v5 = v4;
  [(PUConnection *)self queryRemoteDeviceState:v6];
}

void __37__PUConnection_getRemoteDeviceState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v9 = a3;
    id v5 = a2;
    uint64_t v6 = [v5 hasPasscodeSet];
    uint64_t v7 = [v5 isPasscodeLocked];
    uint64_t v8 = [v5 isUnlockOnly];

    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, id))(v3 + 16))(v3, v6, v7, v8, v9);
  }
}

- (void)queryRemoteDeviceState:(id)a3
{
  id v4 = a3;
  id v6 = [(PUConnection *)self serverConnection];
  id v5 = [v6 remoteObjectProxy];
  [v5 queryRemoteDeviceState:v4];
}

- (id)delegateIfRespondsToSelector:(SEL)a3
{
  uint64_t v3 = [(PUConnection *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

    uint64_t v3 = 0;
  }
  return v3;
}

- (void)didPairForUnlock:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__PUConnection_didPairForUnlock_error___block_invoke;
  block[3] = &unk_2646A8070;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __39__PUConnection_didPairForUnlock_error___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 48));
  id v2 = objc_loadWeakRetained(&to);
  uint64_t v3 = [v2 delegateIfRespondsToSelector:sel_unlockConnection_didPairForUnlock_error_];

  if (v3) {
    [v3 unlockConnection:*(void *)(a1 + 32) didPairForUnlock:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 40)];
  }

  objc_destroyWeak(&to);
}

- (void)didUnpairForUnlock:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__PUConnection_didUnpairForUnlock_error___block_invoke;
  block[3] = &unk_2646A8070;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __41__PUConnection_didUnpairForUnlock_error___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 48));
  id v2 = objc_loadWeakRetained(&to);
  uint64_t v3 = [v2 delegateIfRespondsToSelector:sel_unlockConnection_didUnpairForUnlock_error_];

  if (v3) {
    [v3 unlockConnection:*(void *)(a1 + 32) didUnpairForUnlock:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 40)];
  }

  objc_destroyWeak(&to);
}

- (void)didEnableOnlyRemoteUnlock:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__PUConnection_didEnableOnlyRemoteUnlock_error___block_invoke;
  block[3] = &unk_2646A8070;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __48__PUConnection_didEnableOnlyRemoteUnlock_error___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 48));
  id v2 = objc_loadWeakRetained(&to);
  uint64_t v3 = [v2 delegateIfRespondsToSelector:sel_unlockConnection_didEnableOnlyRemoteUnlock_error_];

  if (v3) {
    [v3 unlockConnection:*(void *)(a1 + 32) didEnableOnlyRemoteUnlock:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 40)];
  }

  objc_destroyWeak(&to);
}

- (void)didDisableOnlyRemoteUnlock:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__PUConnection_didDisableOnlyRemoteUnlock_error___block_invoke;
  block[3] = &unk_2646A8070;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __49__PUConnection_didDisableOnlyRemoteUnlock_error___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 48));
  id v2 = objc_loadWeakRetained(&to);
  uint64_t v3 = [v2 delegateIfRespondsToSelector:sel_unlockConnection_didDisableOnlyRemoteUnlock_error_];

  if (v3) {
    [v3 unlockConnection:*(void *)(a1 + 32) didDisableOnlyRemoteUnlock:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 40)];
  }

  objc_destroyWeak(&to);
}

- (void)remoteDeviceDidCompleteRemoteAction:(BOOL)a3 remoteDeviceState:(id)a4 error:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __76__PUConnection_remoteDeviceDidCompleteRemoteAction_remoteDeviceState_error___block_invoke;
  v13[3] = &unk_2646A8098;
  objc_copyWeak(&v16, &location);
  BOOL v17 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(delegateQueue, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __76__PUConnection_remoteDeviceDidCompleteRemoteAction_remoteDeviceState_error___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 56));
  id v2 = objc_loadWeakRetained(&to);
  uint64_t v3 = [v2 delegateIfRespondsToSelector:sel_unlockConnection_remoteDeviceDidCompleteRemoteAction_remoteDeviceState_error_];

  if (v3) {
    [v3 unlockConnection:*(void *)(a1 + 32) remoteDeviceDidCompleteRemoteAction:*(unsigned __int8 *)(a1 + 64) remoteDeviceState:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
  }

  objc_destroyWeak(&to);
}

- (void)remoteDeviceDidUnlock
{
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__PUConnection_remoteDeviceDidUnlock__block_invoke;
  block[3] = &unk_2646A80C0;
  objc_copyWeak(&v5, &location);
  void block[4] = self;
  dispatch_async(delegateQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __37__PUConnection_remoteDeviceDidUnlock__block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v2 = objc_loadWeakRetained(&to);
  uint64_t v3 = [v2 delegateIfRespondsToSelector:sel_unlockConnectionRemoteDeviceDidUnlock_];

  if (v3) {
    [v3 unlockConnectionRemoteDeviceDidUnlock:*(void *)(a1 + 32)];
  }

  objc_destroyWeak(&to);
}

- (void)didGetRemoteDeviceState:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__PUConnection_didGetRemoteDeviceState_error___block_invoke;
  block[3] = &unk_2646A80E8;
  objc_copyWeak(&v15, &location);
  id v12 = v7;
  id v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(delegateQueue, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __46__PUConnection_didGetRemoteDeviceState_error___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 56));
  id v2 = objc_loadWeakRetained(&to);
  uint64_t v3 = [v2 delegateIfRespondsToSelector:sel_unlockConnection_remoteDeviceDidNotifyState_];

  if (!*(void *)(a1 + 32) && v3) {
    [v3 unlockConnection:*(void *)(a1 + 40) remoteDeviceDidNotifyState:*(void *)(a1 + 48)];
  }

  objc_destroyWeak(&to);
}

- (void)remoteDeviceDidRemoveLockout:(BOOL)a3 error:(id)a4
{
  id v6 = a4;
  objc_initWeak(&location, self);
  delegateQueue = self->_delegateQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51__PUConnection_remoteDeviceDidRemoveLockout_error___block_invoke;
  v9[3] = &unk_2646A8110;
  objc_copyWeak(&v11, &location);
  BOOL v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(delegateQueue, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __51__PUConnection_remoteDeviceDidRemoveLockout_error___block_invoke(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v2 = objc_loadWeakRetained(&to);
  uint64_t v3 = [v2 remoteDeviceRemoveLockoutHandler];

  if (v3)
  {
    id v4 = objc_loadWeakRetained(&to);
    id v5 = [v4 remoteDeviceRemoveLockoutHandler];
    v5[2](v5, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));

    id v6 = objc_loadWeakRetained(&to);
    [v6 setRemoteDeviceRemoveLockoutHandler:0];
  }
  objc_destroyWeak(&to);
}

- (PUConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)remoteDeviceRemoveLockoutHandler
{
  return self->_remoteDeviceRemoveLockoutHandler;
}

- (void)setRemoteDeviceRemoveLockoutHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_remoteDeviceRemoveLockoutHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_unlockClient, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_serverConnectionQueue, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

@end