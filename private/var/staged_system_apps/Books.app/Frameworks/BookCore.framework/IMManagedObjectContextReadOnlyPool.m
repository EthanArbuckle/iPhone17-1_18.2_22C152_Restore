@interface IMManagedObjectContextReadOnlyPool
- (BUCoalescingCallBlock)coalescingCleanup;
- (IMManagedObjectContextReadOnlyPool)initWithContextProvider:(id)a3;
- (NSMutableArray)contexts;
- (NSMutableArray)pendingBlocks;
- (NSMutableDictionary)lastUsedTime;
- (NSMutableIndexSet)availableContextIndexes;
- (OS_dispatch_queue)sync;
- (id)providerBlock;
- (unint64_t)inUseCount;
- (unint64_t)maxInstanceCount;
- (unint64_t)minInstanceCount;
- (void)_cleanupWithCompletion:(id)a3;
- (void)_makeAvailable:(id)a3;
- (void)_managedObjectContextDidSaveNotification:(id)a3;
- (void)_updateUseCountTime;
- (void)dealloc;
- (void)performReadOnlyBlock:(id)a3;
- (void)remoteContextDidSave:(id)a3;
- (void)setAvailableContextIndexes:(id)a3;
- (void)setCoalescingCleanup:(id)a3;
- (void)setContexts:(id)a3;
- (void)setInUseCount:(unint64_t)a3;
- (void)setLastUsedTime:(id)a3;
- (void)setMaxInstanceCount:(unint64_t)a3;
- (void)setMinInstanceCount:(unint64_t)a3;
- (void)setPendingBlocks:(id)a3;
- (void)setProviderBlock:(id)a3;
- (void)setSync:(id)a3;
@end

@implementation IMManagedObjectContextReadOnlyPool

- (IMManagedObjectContextReadOnlyPool)initWithContextProvider:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)IMManagedObjectContextReadOnlyPool;
  v5 = [(IMManagedObjectContextReadOnlyPool *)&v24 init];
  if (v5)
  {
    dispatch_queue_t v6 = dispatch_queue_create("IMManagedObjectContextReadOnlyPool", 0);
    [(IMManagedObjectContextReadOnlyPool *)v5 setSync:v6];

    v7 = [(IMManagedObjectContextReadOnlyPool *)v5 sync];
    dispatch_queue_set_specific(v7, off_3418A8, off_3418A8, 0);

    [(IMManagedObjectContextReadOnlyPool *)v5 setProviderBlock:v4];
    id v8 = [objc_alloc((Class)NSMutableArray) initWithCapacity:8];
    [(IMManagedObjectContextReadOnlyPool *)v5 setContexts:v8];

    id v9 = objc_alloc_init((Class)NSMutableArray);
    [(IMManagedObjectContextReadOnlyPool *)v5 setPendingBlocks:v9];

    id v10 = objc_alloc_init((Class)NSMutableIndexSet);
    [(IMManagedObjectContextReadOnlyPool *)v5 setAvailableContextIndexes:v10];

    [(IMManagedObjectContextReadOnlyPool *)v5 setMinInstanceCount:1];
    [(IMManagedObjectContextReadOnlyPool *)v5 setMaxInstanceCount:8];
    objc_initWeak(&location, v5);
    id v11 = objc_alloc((Class)BUCoalescingCallBlock);
    v18 = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    v20 = sub_AFD70;
    v21 = &unk_2C4028;
    objc_copyWeak(&v22, &location);
    id v12 = [v11 initWithNotifyBlock:&v18 blockDescription:@"IMManagedObjectContextReadOnlyPool"];
    -[IMManagedObjectContextReadOnlyPool setCoalescingCleanup:](v5, "setCoalescingCleanup:", v12, v18, v19, v20, v21);

    v13 = [(IMManagedObjectContextReadOnlyPool *)v5 coalescingCleanup];
    [v13 setCoalescingDelay:5.0];

    v14 = [(IMManagedObjectContextReadOnlyPool *)v5 coalescingCleanup];
    [v14 setMaximumDelay:10.0];

    v15 = objc_opt_new();
    [(IMManagedObjectContextReadOnlyPool *)v5 setLastUsedTime:v15];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v5 selector:"_managedObjectContextDidSaveNotification:" name:NSManagedObjectContextDidSaveNotification object:0];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v5;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:NSManagedObjectContextDidSaveNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)IMManagedObjectContextReadOnlyPool;
  [(IMManagedObjectContextReadOnlyPool *)&v4 dealloc];
}

- (void)_cleanupWithCompletion:(id)a3
{
  id v4 = a3;
  sync = self->_sync;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_AFED8;
  v7[3] = &unk_2C4370;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(sync, v7);
}

- (void)_updateUseCountTime
{
  unint64_t v3 = [(IMManagedObjectContextReadOnlyPool *)self inUseCount];
  if (v3 > [(IMManagedObjectContextReadOnlyPool *)self minInstanceCount])
  {
    id v4 = +[NSDate date];
    [v4 timeIntervalSinceReferenceDate];
    double v6 = v5;

    v7 = +[NSNumber numberWithDouble:v6];
    id v8 = [(IMManagedObjectContextReadOnlyPool *)self lastUsedTime];
    id v9 = +[NSNumber numberWithUnsignedInteger:[(IMManagedObjectContextReadOnlyPool *)self inUseCount]];
    [v8 setObject:v7 forKeyedSubscript:v9];

    id v10 = [(IMManagedObjectContextReadOnlyPool *)self coalescingCleanup];
    [v10 signalWithCompletion:&stru_2C82C8];
  }
}

- (void)remoteContextDidSave:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  objc_super v24 = sub_B0474;
  v25 = sub_B0484;
  id v26 = 0;
  if (dispatch_get_specific(off_3418A8))
  {
    double v5 = [(IMManagedObjectContextReadOnlyPool *)self contexts];
    id v6 = [v5 copy];
    v7 = (void *)v22[5];
    v22[5] = (uint64_t)v6;
  }
  else
  {
    sync = self->_sync;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_B048C;
    block[3] = &unk_2C39F0;
    block[4] = self;
    block[5] = &v21;
    dispatch_sync(sync, block);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = (id)v22[5];
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_B04F0;
        v14[3] = &unk_2C3AF8;
        v14[4] = v13;
        id v15 = v4;
        [v13 performBlock:v14];
      }
      id v10 = [v9 countByEnumeratingWithState:&v16 objects:v27 count:16];
    }
    while (v10);
  }

  _Block_object_dispose(&v21, 8);
}

- (void)_managedObjectContextDidSaveNotification:(id)a3
{
  id v17 = a3;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = sub_B0474;
  v29 = sub_B0484;
  id v30 = 0;
  if (dispatch_get_specific(off_3418A8))
  {
    id v4 = [(IMManagedObjectContextReadOnlyPool *)self contexts];
    id v5 = [v4 copy];
    id v6 = (void *)v26[5];
    v26[5] = (uint64_t)v5;
  }
  else
  {
    sync = self->_sync;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_B07E4;
    block[3] = &unk_2C39F0;
    block[4] = self;
    block[5] = &v25;
    dispatch_sync(sync, block);
  }
  id v8 = [v17 object];
  id v9 = [v8 persistentStoreCoordinator];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = (id)v26[5];
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v14 != v8)
        {
          id v15 = [*(id *)(*((void *)&v20 + 1) + 8 * i) persistentStoreCoordinator];
          unsigned int v16 = [v15 hasStoreInCommonWith:v9];

          if (v16)
          {
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472;
            v18[2] = sub_B0848;
            v18[3] = &unk_2C3AF8;
            v18[4] = v14;
            id v19 = v17;
            [v14 performBlock:v18];
          }
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v20 objects:v31 count:16];
    }
    while (v11);
  }

  _Block_object_dispose(&v25, 8);
}

- (void)_makeAvailable:(id)a3
{
  id v4 = a3;
  id v5 = [(IMManagedObjectContextReadOnlyPool *)self sync];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_B0908;
  v7[3] = &unk_2C3AF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)performReadOnlyBlock:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(IMManagedObjectContextReadOnlyPool *)self sync];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_B0B90;
    v6[3] = &unk_2C4370;
    v6[4] = self;
    id v7 = v4;
    dispatch_async(v5, v6);
  }
}

- (unint64_t)minInstanceCount
{
  return self->_minInstanceCount;
}

- (void)setMinInstanceCount:(unint64_t)a3
{
  self->_minInstanceCount = a3;
}

- (unint64_t)maxInstanceCount
{
  return self->_maxInstanceCount;
}

- (void)setMaxInstanceCount:(unint64_t)a3
{
  self->_maxInstanceCount = a3;
}

- (id)providerBlock
{
  return self->_providerBlock;
}

- (void)setProviderBlock:(id)a3
{
}

- (NSMutableArray)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
}

- (NSMutableIndexSet)availableContextIndexes
{
  return self->_availableContextIndexes;
}

- (void)setAvailableContextIndexes:(id)a3
{
}

- (OS_dispatch_queue)sync
{
  return self->_sync;
}

- (void)setSync:(id)a3
{
}

- (NSMutableArray)pendingBlocks
{
  return self->_pendingBlocks;
}

- (void)setPendingBlocks:(id)a3
{
}

- (BUCoalescingCallBlock)coalescingCleanup
{
  return self->_coalescingCleanup;
}

- (void)setCoalescingCleanup:(id)a3
{
}

- (NSMutableDictionary)lastUsedTime
{
  return self->_lastUsedTime;
}

- (void)setLastUsedTime:(id)a3
{
}

- (unint64_t)inUseCount
{
  return self->_inUseCount;
}

- (void)setInUseCount:(unint64_t)a3
{
  self->_inUseCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUsedTime, 0);
  objc_storeStrong((id *)&self->_coalescingCleanup, 0);
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong((id *)&self->_availableContextIndexes, 0);
  objc_storeStrong((id *)&self->_contexts, 0);

  objc_storeStrong(&self->_providerBlock, 0);
}

@end