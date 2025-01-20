@interface BCTransactionQueue
+ (id)newWithOptions:(unint64_t)a3 queue:(id)a4;
- (BCTransactionQueue)initWithOptions:(unint64_t)a3 queue:(id)a4;
- (NSMutableArray)blocksToProcess;
- (NSMutableArray)pendingTransactions;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)sync;
- (_BCTransaction)activeTransaction;
- (id)newTransaction;
- (id)newTransactionWithContext:(id)a3;
- (id)newTransactionWithName:(id)a3 info:(id)a4 context:(id)a5 originatingSceneController:(id)a6 targetSceneDescriptor:(id)a7;
- (unint64_t)options;
- (void)_cancelTransactionsConflictedByTransaction:(id)a3;
- (void)_process;
- (void)_processTransaction:(id)a3;
- (void)setActiveTransaction:(id)a3;
- (void)setBlocksToProcess:(id)a3;
- (void)setOptions:(unint64_t)a3;
- (void)setPendingTransactions:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSync:(id)a3;
- (void)sq_activateTransactions;
- (void)sq_removeFinishedTransactions;
@end

@implementation BCTransactionQueue

- (BCTransactionQueue)initWithOptions:(unint64_t)a3 queue:(id)a4
{
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BCTransactionQueue;
  v8 = [(BCTransactionQueue *)&v16 init];
  if (v8)
  {
    if (v7 == &_dispatch_main_q) {
      a3 |= 0x10uLL;
    }
    uint64_t v9 = objc_opt_new();
    blocksToProcess = v8->_blocksToProcess;
    v8->_blocksToProcess = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    pendingTransactions = v8->_pendingTransactions;
    v8->_pendingTransactions = (NSMutableArray *)v11;

    v8->_options = a3;
    objc_storeStrong((id *)&v8->_queue, a4);
    dispatch_queue_t v13 = dispatch_queue_create("BCTransactionQueue.sync", 0);
    sync = v8->_sync;
    v8->_sync = (OS_dispatch_queue *)v13;
  }
  return v8;
}

+ (id)newWithOptions:(unint64_t)a3 queue:(id)a4
{
  id v5 = a4;
  v6 = [[BCTransactionQueue alloc] initWithOptions:a3 queue:v5];

  return v6;
}

- (id)newTransaction
{
  return [(BCTransactionQueue *)self newTransactionWithName:0 info:0 context:0 originatingSceneController:0 targetSceneDescriptor:0];
}

- (id)newTransactionWithContext:(id)a3
{
  return [(BCTransactionQueue *)self newTransactionWithName:0 info:0 context:a3 originatingSceneController:0 targetSceneDescriptor:0];
}

- (id)newTransactionWithName:(id)a3 info:(id)a4 context:(id)a5 originatingSceneController:(id)a6 targetSceneDescriptor:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = objc_opt_new();
  [v17 setQueue:self];
  [v17 setName:v16];

  [v17 setInfo:v15];
  [v17 setOriginatingSceneController:v13];

  [v17 setTargetSceneDescriptor:v12];
  v18 = BCTransactionLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [v17 debugDescription];
    *(_DWORD *)buf = 138543362;
    v31 = v19;
    _os_log_impl(&def_7D91C, v18, OS_LOG_TYPE_DEFAULT, "Creating transaction: %{public}@", buf, 0xCu);
  }
  sync = self->_sync;
  v24 = _NSConcreteStackBlock;
  uint64_t v25 = 3221225472;
  v26 = sub_13B1E4;
  v27 = &unk_2C3AF8;
  v28 = self;
  id v29 = v17;
  id v21 = v17;
  dispatch_sync(sync, &v24);
  [v21 setContext:v14, v24, v25, v26, v27, v28];

  v22 = [[_BCTransactionProxy alloc] initWithTransaction:v21];
  return v22;
}

- (void)_cancelTransactionsConflictedByTransaction:(id)a3
{
  id v4 = a3;
  sync = self->_sync;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_13B2D0;
  v7[3] = &unk_2C3AF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(sync, v7);
}

- (void)_processTransaction:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  sync = self->_sync;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_13B854;
  block[3] = &unk_2C5530;
  id v6 = v4;
  uint64_t v9 = self;
  v10 = &v11;
  id v8 = v6;
  dispatch_sync(sync, block);
  if (*((unsigned char *)v12 + 24)) {
    [(BCTransactionQueue *)self _process];
  }

  _Block_object_dispose(&v11, 8);
}

- (void)sq_removeFinishedTransactions
{
  v3 = [(BCTransactionQueue *)self activeTransaction];
  unsigned int v4 = [v3 sq_isFinal];

  if (v4)
  {
    id v5 = BCTransactionLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(BCTransactionQueue *)self activeTransaction];
      id v7 = [v6 debugDescription];
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl(&def_7D91C, v5, OS_LOG_TYPE_DEFAULT, "removing active transaction: %{public}@", (uint8_t *)&v8, 0xCu);
    }
    [(BCTransactionQueue *)self setActiveTransaction:0];
  }
}

- (void)sq_activateTransactions
{
  v3 = [(BCTransactionQueue *)self activeTransaction];
  if (!v3)
  {
    unsigned int v4 = [(BCTransactionQueue *)self pendingTransactions];
    id v5 = [v4 count];

    if (!v5) {
      return;
    }
    id v6 = [(BCTransactionQueue *)self pendingTransactions];
    id v8 = [v6 firstObject];

    id v7 = [(BCTransactionQueue *)self pendingTransactions];
    [v7 removeObjectAtIndex:0];

    [(BCTransactionQueue *)self setActiveTransaction:v8];
    v3 = v8;
  }
}

- (void)_process
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_13BC58;
  v4[3] = &unk_2C3C50;
  v4[4] = self;
  v3 = objc_retainBlock(v4);
  if ((self->_options & 0x10) != 0 && +[NSThread isMainThread]) {
    ((void (*)(void *))v3[2])(v3);
  }
  else {
    dispatch_async((dispatch_queue_t)self->_queue, v3);
  }
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (void)setSync:(id)a3
{
}

- (_BCTransaction)activeTransaction
{
  return self->_activeTransaction;
}

- (void)setActiveTransaction:(id)a3
{
}

- (NSMutableArray)pendingTransactions
{
  return self->_pendingTransactions;
}

- (void)setPendingTransactions:(id)a3
{
}

- (NSMutableArray)blocksToProcess
{
  return self->_blocksToProcess;
}

- (void)setBlocksToProcess:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocksToProcess, 0);
  objc_storeStrong((id *)&self->_pendingTransactions, 0);
  objc_storeStrong((id *)&self->_activeTransaction, 0);
  objc_storeStrong((id *)&self->_sync, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end