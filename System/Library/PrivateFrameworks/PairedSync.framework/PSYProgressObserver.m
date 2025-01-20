@interface PSYProgressObserver
- (BOOL)_shouldHandleSyncSession:(id)a3;
- (NSDictionary)activityErrors;
- (NSString)activityLabel;
- (PSYProgressObserver)init;
- (PSYProgressObserver)initWithQueue:(id)a3;
- (PSYProgressObserverDelegate)delegate;
- (double)activityProgress;
- (double)totalProgress;
- (int64_t)progressObserverState;
- (void)_updateState;
- (void)setDelegate:(id)a3;
- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4;
- (void)syncSessionObserver:(id)a3 receivedSyncSession:(id)a4;
@end

@implementation PSYProgressObserver

- (PSYProgressObserver)init
{
  return [(PSYProgressObserver *)self initWithQueue:0];
}

- (PSYProgressObserver)initWithQueue:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PSYProgressObserver;
  v5 = [(PSYProgressObserver *)&v16 init];
  if (v5)
  {
    if (!v4)
    {
      id v4 = (id)MEMORY[0x263EF83A0];
      id v6 = MEMORY[0x263EF83A0];
    }
    objc_storeStrong((id *)&v5->_delegateQueue, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.pairedsync.progressobserver", v7);
    internalQueue = v5->_internalQueue;
    v5->_internalQueue = (OS_dispatch_queue *)v8;

    v10 = objc_alloc_init(PSYSyncSessionObserver);
    syncSessionObserver = v5->_syncSessionObserver;
    v5->_syncSessionObserver = v10;

    v12 = v5->_internalQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __37__PSYProgressObserver_initWithQueue___block_invoke;
    block[3] = &unk_2642B3DB8;
    v15 = v5;
    dispatch_async(v12, block);
  }
  return v5;
}

uint64_t __37__PSYProgressObserver_initWithQueue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setDelegate:");
  v2 = *(void **)(a1 + 32);

  return [v2 _updateState];
}

- (NSDictionary)activityErrors
{
  return 0;
}

- (double)totalProgress
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__PSYProgressObserver_totalProgress__block_invoke;
  v5[3] = &unk_2642B3E08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__PSYProgressObserver_totalProgress__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) sessionProgress];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (double)activityProgress
{
  uint64_t v6 = 0;
  v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__PSYProgressObserver_activityProgress__block_invoke;
  v5[3] = &unk_2642B4350;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __39__PSYProgressObserver_activityProgress__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 16) firstIncompleteActivity];
  [v3 activityProgress];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
}

- (NSString)activityLabel
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__PSYProgressObserver_activityLabel__block_invoke;
  v5[3] = &unk_2642B4350;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __36__PSYProgressObserver_activityLabel__block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(*(void *)(a1 + 32) + 16) firstIncompleteActivity];
  uint64_t v2 = [v6 activityInfo];
  uint64_t v3 = [v2 label];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_updateState
{
  syncSessionObserver = self->_syncSessionObserver;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __35__PSYProgressObserver__updateState__block_invoke;
  v3[3] = &unk_2642B43A0;
  v3[4] = self;
  [(PSYSyncSessionObserver *)syncSessionObserver startObservingSyncSessionsWithCompletion:v3];
}

void __35__PSYProgressObserver__updateState__block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  if (!a4)
  {
    uint64_t v9 = *(void *)(a1 + 32);
    v10 = *(NSObject **)(v9 + 24);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35__PSYProgressObserver__updateState__block_invoke_2;
    block[3] = &unk_2642B4378;
    void block[4] = v9;
    id v12 = v7;
    id v13 = v8;
    dispatch_async(v10, block);
  }
}

void __35__PSYProgressObserver__updateState__block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 48) mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(NSObject **)(v5 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __35__PSYProgressObserver__updateState__block_invoke_3;
  block[3] = &unk_2642B3DB8;
  void block[4] = v5;
  dispatch_async(v6, block);
}

void __35__PSYProgressObserver__updateState__block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 progressObserverDidChangeState:*(void *)(a1 + 32)];
}

- (int64_t)progressObserverState
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__PSYProgressObserver_progressObserverState__block_invoke;
  v5[3] = &unk_2642B4350;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __44__PSYProgressObserver_progressObserverState__block_invoke(uint64_t a1)
{
  id v2 = +[PSYRegistrySingleton registry];
  uint64_t v7 = [v2 pairingID];

  if (v7 && ([*(id *)(*(void *)(a1 + 32) + 40) containsObject:v7] & 1) != 0)
  {
    uint64_t v3 = 4;
LABEL_7:
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
    goto LABEL_8;
  }
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 16);
  if (v4)
  {
    unint64_t v5 = [v4 syncSessionState];
    if (v5 <= 2)
    {
      uint64_t v3 = qword_217A0E6B0[v5];
      goto LABEL_7;
    }
  }
LABEL_8:

  return MEMORY[0x270F9A758]();
}

- (BOOL)_shouldHandleSyncSession:(id)a3
{
  return [a3 syncSessionType] == 0;
}

- (void)syncSessionObserver:(id)a3 didReceiveUpdate:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 updatedSession];
  BOOL v7 = [(PSYProgressObserver *)self _shouldHandleSyncSession:v6];

  if (v7)
  {
    internalQueue = self->_internalQueue;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke;
    v9[3] = &unk_2642B3DE0;
    v9[4] = self;
    id v10 = v5;
    dispatch_async(internalQueue, v9);
  }
}

void __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) updatedSession];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  id v5 = [*(id *)(a1 + 40) originalSession];
  [v5 sessionProgress];
  double v7 = v6;
  uint64_t v8 = [*(id *)(a1 + 40) updatedSession];
  [v8 sessionProgress];
  double v10 = vabdd_f64(v7, v9);

  if (v10 > 0.00000011920929)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = *(NSObject **)(v11 + 32);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_2;
    block[3] = &unk_2642B3DB8;
    void block[4] = v11;
    dispatch_async(v12, block);
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_3;
  v27[3] = &unk_2642B43C8;
  id v13 = *(void **)(a1 + 40);
  v27[4] = *(void *)(a1 + 32);
  [v13 enumerateNewlyCompletedActivitiesWithBlock:v27];
  v14 = [*(id *)(a1 + 40) originalSession];
  uint64_t v15 = [v14 syncSessionState];
  objc_super v16 = [*(id *)(a1 + 40) updatedSession];
  uint64_t v17 = [v16 syncSessionState];

  if (v15 != v17)
  {
    uint64_t v18 = *(void *)(a1 + 32);
    v19 = *(NSObject **)(v18 + 32);
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_5;
    v26[3] = &unk_2642B3DB8;
    v26[4] = v18;
    dispatch_async(v19, v26);
  }
  v20 = [*(id *)(a1 + 40) updatedSession];
  uint64_t v21 = [v20 syncSessionState];

  if (v21 == 2)
  {
    v22 = *(void **)(a1 + 40);
    v23 = *(void **)(*(void *)(a1 + 32) + 40);
    v24 = [v22 updatedSession];
    v25 = [v24 pairingIdentifier];
    [v23 addObject:v25];
  }
}

void __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 progressObserverDidChangeProgress:*(void *)(a1 + 32)];
}

void __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  double v6 = *(NSObject **)(v5 + 32);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_4;
  v8[3] = &unk_2642B3DE0;
  v8[4] = v5;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_4(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) activityInfo];
  id v4 = [v3 label];
  uint64_t v5 = [*(id *)(a1 + 40) error];
  [v6 progressObserver:v2 didFinishActivity:v4 withError:v5];
}

void __60__PSYProgressObserver_syncSessionObserver_didReceiveUpdate___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 progressObserverDidChangeState:*(void *)(a1 + 32)];
}

- (void)syncSessionObserver:(id)a3 receivedSyncSession:(id)a4
{
  id v5 = a4;
  if ([(PSYProgressObserver *)self _shouldHandleSyncSession:v5])
  {
    internalQueue = self->_internalQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __63__PSYProgressObserver_syncSessionObserver_receivedSyncSession___block_invoke;
    v7[3] = &unk_2642B3DE0;
    v7[4] = self;
    id v8 = v5;
    dispatch_async(internalQueue, v7);
  }
}

void __63__PSYProgressObserver_syncSessionObserver_receivedSyncSession___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 32);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__PSYProgressObserver_syncSessionObserver_receivedSyncSession___block_invoke_2;
  block[3] = &unk_2642B3DB8;
  void block[4] = v2;
  dispatch_async(v3, block);
}

void __63__PSYProgressObserver_syncSessionObserver_receivedSyncSession___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 progressObserverDidChangeState:*(void *)(a1 + 32)];
}

- (PSYProgressObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PSYProgressObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_completedInitialSyncPairingIDs, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_currentSyncSession, 0);

  objc_storeStrong((id *)&self->_syncSessionObserver, 0);
}

@end