@interface TUITransactionController
- ($61A80719B04F7407D3E47539F1B23CAA)feedId;
- (TUITransactionController)initWithQueue:(id)a3;
- (TUITransactionCoordinator)coordinator;
- (id)newDidUpdateObserver:(id)a3;
- (id)newWillUpdateObserver:(id)a3;
- (id)updateBlock;
- (void)addObserver:(id)a3;
- (void)performUpdate:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setUpdateBlock:(id)a3;
- (void)setUpdateCallback:(id)a3;
- (void)transactionCoordinator:(id)a3 didEndUpdateWithTransactionGroup:(id)a4;
- (void)transactionCoordinator:(id)a3 performUpdateForTransactionGroup:(id)a4;
- (void)transactionCoordinator:(id)a3 updateWithTransactionGroup:(id)a4;
- (void)transactionCoordinator:(id)a3 willBeginUpdateWithTransactionGroup:(id)a4;
@end

@implementation TUITransactionController

- (void)setUpdateCallback:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_79550;
    v5[3] = &unk_2536C8;
    objc_copyWeak(&v7, &location);
    id v6 = v4;
    [(TUITransactionController *)self setUpdateBlock:v5];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (id)newWillUpdateObserver:(id)a3
{
  id v4 = a3;
  v5 = [[_TUITransactionControllerJSObserver alloc] initWithWillUpdateValue:v4 didUpdateValue:0];

  [(TUITransactionController *)self addObserver:v5];
  return v5;
}

- (id)newDidUpdateObserver:(id)a3
{
  id v4 = a3;
  v5 = [[_TUITransactionControllerJSObserver alloc] initWithWillUpdateValue:0 didUpdateValue:v4];

  [(TUITransactionController *)self addObserver:v5];
  return v5;
}

- (void)performUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(TUITransactionController *)self coordinator];
  [v5 performUpdateForTransactionGroup:v4];
}

- (TUITransactionCoordinator)coordinator
{
  return self->_coordinator;
}

- (TUITransactionController)initWithQueue:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TUITransactionController;
  id v5 = [(TUITransactionController *)&v15 init];
  if (v5)
  {
    v5->_feedId.unint64_t uniqueIdentifier = TUIFeedIdentifierGenerate();
    id v6 = TUIDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unint64_t uniqueIdentifier = v5->_feedId.uniqueIdentifier;
      *(_DWORD *)buf = 134218242;
      unint64_t v17 = uniqueIdentifier;
      __int16 v18 = 2112;
      v19 = v5;
      _os_log_impl(&def_141F14, v6, OS_LOG_TYPE_INFO, "[fid:%lu] created %@", buf, 0x16u);
    }

    v8 = [[_TUITransactionControllerWorkQueueContext alloc] initWithQueue:v4];
    queueContext = v5->_queueContext;
    v5->_queueContext = (TUIWorkQueueContext *)v8;

    v10 = [[TUITransactionCoordinator alloc] initWithFeedId:v5->_feedId.uniqueIdentifier layoutQueueContext:v5->_queueContext delegate:v5];
    coordinator = v5->_coordinator;
    v5->_coordinator = v10;

    [(TUITransactionCoordinator *)v5->_coordinator setManuallyScheduleUpdates:1];
    uint64_t v12 = +[NSHashTable hashTableWithOptions:517];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v12;

    v5->_accessLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)addObserver:(id)a3
{
  if (a3)
  {
    p_accessLock = &self->_accessLock;
    id v5 = a3;
    os_unfair_lock_lock(p_accessLock);
    [(NSHashTable *)self->_observers addObject:v5];

    os_unfair_lock_unlock(p_accessLock);
  }
}

- (void)removeObserver:(id)a3
{
  if (a3)
  {
    p_accessLock = &self->_accessLock;
    id v5 = a3;
    os_unfair_lock_lock(p_accessLock);
    [(NSHashTable *)self->_observers removeObject:v5];

    os_unfair_lock_unlock(p_accessLock);
  }
}

- (void)transactionCoordinator:(id)a3 updateWithTransactionGroup:(id)a4
{
}

- (void)transactionCoordinator:(id)a3 willBeginUpdateWithTransactionGroup:(id)a4
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  id v6 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_accessLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) transactionControllerWillProcessUpdate:self v12];
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)transactionCoordinator:(id)a3 didEndUpdateWithTransactionGroup:(id)a4
{
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  id v6 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_accessLock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) transactionControllerDidProcessUpdate:self v12];
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)transactionCoordinator:(id)a3 performUpdateForTransactionGroup:(id)a4
{
  updateBlock = (void (**)(id, id))self->_updateBlock;
  if (updateBlock) {
    updateBlock[2](updateBlock, a4);
  }
  else {
    [a3 performUpdateForTransactionGroup:a4];
  }
}

- ($61A80719B04F7407D3E47539F1B23CAA)feedId
{
  return ($61A80719B04F7407D3E47539F1B23CAA)self->_feedId.uniqueIdentifier;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_queueContext, 0);
}

@end