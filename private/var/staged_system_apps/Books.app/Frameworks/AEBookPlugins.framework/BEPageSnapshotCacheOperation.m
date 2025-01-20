@interface BEPageSnapshotCacheOperation
- (BEPageSnapshotCacheDataSource)dataSource;
- (BEPageSnapshotCacheOperation)initWithDataSource:(id)a3;
- (CGSize)snapshotSize;
- (NSMutableSet)extraCompletions;
- (OS_dispatch_semaphore)dispatchSemaphore;
- (id)callbackInvocationWithImage:(id)a3;
- (id)generateImage:(CGSize)a3;
- (unint64_t)pageNumber;
- (void)addExtraCompletion:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDispatchSemaphore:(id)a3;
- (void)setExtraCompletions:(id)a3;
- (void)setPageNumber:(unint64_t)a3;
- (void)setSnapshotSize:(CGSize)a3;
@end

@implementation BEPageSnapshotCacheOperation

- (BEPageSnapshotCacheOperation)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BEPageSnapshotCacheOperation;
  v5 = [(BEPageSnapshotCacheOperation *)&v8 initWithOptions:0];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    v6->_extraCompletionsAccessLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (id)callbackInvocationWithImage:(id)a3
{
  id v4 = a3;
  v5 = [(BEPageSnapshotCacheOperation *)self renderingCacheCallbackInvocationWithImage:v4 pageNumber:[(BEPageSnapshotCacheOperation *)self pageNumber]];

  return v5;
}

- (id)generateImage:(CGSize)a3
{
  if ([(BEPageSnapshotCacheOperation *)self isCancelled])
  {
    id v4 = 0;
  }
  else
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
    [(BEPageSnapshotCacheOperation *)self setDispatchSemaphore:v5];

    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = sub_A95AC;
    v20 = sub_A95BC;
    id v21 = 0;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_A95C4;
    block[3] = &unk_1DCFE8;
    block[4] = self;
    block[5] = &v16;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v6 = [(BEPageSnapshotCacheOperation *)self dispatchSemaphore];
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

    if ([(BEPageSnapshotCacheOperation *)self isCancelled])
    {
      id v4 = 0;
    }
    else
    {
      p_extraCompletionsAccessLock = &self->_extraCompletionsAccessLock;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v11 = sub_A96F4;
      v12 = &unk_1DCFE8;
      v13 = self;
      v14 = &v16;
      objc_super v8 = v10;
      os_unfair_lock_lock(p_extraCompletionsAccessLock);
      v11((uint64_t)v8);
      os_unfair_lock_unlock(p_extraCompletionsAccessLock);

      id v4 = (id)v17[5];
    }
    _Block_object_dispose(&v16, 8);
  }

  return v4;
}

- (void)addExtraCompletion:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_A9978;
  v5[3] = &unk_1DBF08;
  p_extraCompletionsAccessLock = &self->_extraCompletionsAccessLock;
  v5[4] = self;
  id v6 = a3;
  id v4 = v6;
  os_unfair_lock_lock(p_extraCompletionsAccessLock);
  sub_A9978((uint64_t)v5);
  os_unfair_lock_unlock(p_extraCompletionsAccessLock);
}

- (unint64_t)pageNumber
{
  return self->pageNumber;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->pageNumber = a3;
}

- (CGSize)snapshotSize
{
  double width = self->snapshotSize.width;
  double height = self->snapshotSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSnapshotSize:(CGSize)a3
{
  self->snapshotSize = a3;
}

- (NSMutableSet)extraCompletions
{
  return self->_extraCompletions;
}

- (void)setExtraCompletions:(id)a3
{
}

- (BEPageSnapshotCacheDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (BEPageSnapshotCacheDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (OS_dispatch_semaphore)dispatchSemaphore
{
  return self->_dispatchSemaphore;
}

- (void)setDispatchSemaphore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchSemaphore, 0);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_storeStrong((id *)&self->_extraCompletions, 0);
}

@end