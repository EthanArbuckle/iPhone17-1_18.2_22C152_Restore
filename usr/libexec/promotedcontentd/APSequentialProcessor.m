@interface APSequentialProcessor
- (BOOL)isRunning;
- (NSEnumerator)collection;
- (NSLocking)collectionProviderLock;
- (NSLocking)lock;
- (OS_dispatch_queue)queue;
- (id)collectionProvider;
- (id)workBlock;
- (void)_next:(BOOL)a3;
- (void)setCollection:(id)a3;
- (void)setCollectionProvider:(id)a3;
- (void)setCollectionProviderLock:(id)a3;
- (void)setIsRunning:(BOOL)a3;
- (void)setLock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWorkBlock:(id)a3;
@end

@implementation APSequentialProcessor

- (void)_next:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(APSequentialProcessor *)self lock];
  [v5 lock];
  if (v3)
  {
    [(APSequentialProcessor *)self setIsRunning:0];
    [(APSequentialProcessor *)self setCollection:0];
    [v5 unlock];
  }
  else
  {
    v6 = [(APSequentialProcessor *)self collectionProviderLock];
    [v6 lock];
    v7 = [(APSequentialProcessor *)self collectionProvider];
    [(APSequentialProcessor *)self setCollectionProvider:0];
    [v6 unlock];
    if (v7)
    {
      v8 = v7[2](v7);
      [(APSequentialProcessor *)self setCollection:v8];
    }
    v9 = [(APSequentialProcessor *)self collection];
    v10 = [v9 nextObject];

    if (v10)
    {
      v11 = [(APSequentialProcessor *)self workBlock];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100124830;
      v12[3] = &unk_10022E530;
      v12[4] = self;
      ((void (**)(void, void *, void *))v11)[2](v11, v10, v12);
    }
    else
    {
      [(APSequentialProcessor *)self setCollection:0];
      [(APSequentialProcessor *)self setIsRunning:0];
    }
    [v5 unlock];
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)workBlock
{
  return self->_workBlock;
}

- (void)setWorkBlock:(id)a3
{
}

- (NSEnumerator)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (id)collectionProvider
{
  return self->_collectionProvider;
}

- (void)setCollectionProvider:(id)a3
{
}

- (NSLocking)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (NSLocking)collectionProviderLock
{
  return self->_collectionProviderLock;
}

- (void)setCollectionProviderLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionProviderLock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_collectionProvider, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong(&self->_workBlock, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end