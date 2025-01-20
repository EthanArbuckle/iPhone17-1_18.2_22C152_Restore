@interface NADApplicationStoreTransaction
- (BOOL)commit:(id *)a3;
- (BOOL)isFinalized;
- (NADApplicationStore)applicationStore;
- (NADApplicationStoreTransaction)initWithApplicationStore:(id)a3;
- (OS_dispatch_queue)commandQueue;
- (void)_flushCommandQueue;
- (void)insertApplication:(id)a3;
- (void)removeAllEntities;
- (void)removeApplicationWithBundleIdentifier:(id)a3;
- (void)rollback;
- (void)setFinalized:(BOOL)a3;
- (void)setSequenceNumber:(id)a3 UUID:(id)a4;
@end

@implementation NADApplicationStoreTransaction

- (NADApplicationStoreTransaction)initWithApplicationStore:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NADApplicationStoreTransaction;
  v6 = [(NADApplicationStoreTransaction *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_applicationStore, a3);
    v8 = [v5 queue];
    dispatch_queue_t v9 = dispatch_queue_create_with_target_V2("com.nanoappregistry.transaction", 0, v8);
    commandQueue = v7->_commandQueue;
    v7->_commandQueue = (OS_dispatch_queue *)v9;

    dispatch_suspend((dispatch_object_t)v7->_commandQueue);
  }

  return v7;
}

- (void)removeAllEntities
{
  v3 = [(NADApplicationStoreTransaction *)self commandQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000676C;
  block[3] = &unk_100018598;
  block[4] = self;
  dispatch_async(v3, block);
}

- (void)insertApplication:(id)a3
{
  id v4 = a3;
  id v5 = [(NADApplicationStoreTransaction *)self commandQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006864;
  v7[3] = &unk_1000185C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)removeApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(NADApplicationStoreTransaction *)self commandQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000696C;
  v7[3] = &unk_1000185C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)setSequenceNumber:(id)a3 UUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NADApplicationStoreTransaction *)self commandQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006A98;
  block[3] = &unk_1000185E8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

- (BOOL)commit:(id *)a3
{
  unsigned __int8 v4 = [(NADApplicationStoreTransaction *)self isFinalized];
  if ((v4 & 1) == 0)
  {
    [(NADApplicationStoreTransaction *)self setFinalized:1];
    dispatch_resume((dispatch_object_t)self->_commandQueue);
    [(NADApplicationStoreTransaction *)self _flushCommandQueue];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, NARApplicationsChangedNotification, 0, 0, 0);
  }
  return v4 ^ 1;
}

- (void)rollback
{
  if (![(NADApplicationStoreTransaction *)self isFinalized])
  {
    [(NADApplicationStoreTransaction *)self setFinalized:1];
    applicationStore = self->_applicationStore;
    self->_applicationStore = 0;

    dispatch_resume((dispatch_object_t)self->_commandQueue);
    [(NADApplicationStoreTransaction *)self _flushCommandQueue];
  }
}

- (void)_flushCommandQueue
{
  v2 = [(NADApplicationStoreTransaction *)self commandQueue];
  dispatch_sync(v2, &stru_100018608);
}

- (NADApplicationStore)applicationStore
{
  return self->_applicationStore;
}

- (OS_dispatch_queue)commandQueue
{
  return self->_commandQueue;
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commandQueue, 0);

  objc_storeStrong((id *)&self->_applicationStore, 0);
}

@end