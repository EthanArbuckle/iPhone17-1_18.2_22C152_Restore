@interface FTDeviceObserver
- (BOOL)isBootLockEnabled;
- (FTDeviceDataSource)dataSource;
- (FTDeviceObserver)initWithQueue:(id)a3;
- (FTDeviceObserver)initWithQueue:(id)a3 dataSource:(id)a4;
- (FTNotifyObserver)firstUnlockNotifyObserver;
- (OS_dispatch_queue)queue;
- (TUDelegateController)delegateController;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)removeDelegate:(id)a3;
- (void)setBootLockEnabled:(BOOL)a3;
- (void)setFirstUnlockNotifyObserver:(id)a3;
@end

@implementation FTDeviceObserver

- (FTDeviceObserver)initWithQueue:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(FTDeviceDataSource);
  v6 = [(FTDeviceObserver *)self initWithQueue:v4 dataSource:v5];

  return v6;
}

- (FTDeviceObserver)initWithQueue:(id)a3 dataSource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)FTDeviceObserver;
  v9 = [(FTDeviceObserver *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    objc_storeStrong((id *)&v10->_dataSource, a4);
    v11 = (TUDelegateController *)objc_alloc_init((Class)TUDelegateController);
    delegateController = v10->_delegateController;
    v10->_delegateController = v11;

    objc_initWeak(&location, v10);
    queue = v10->_queue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000FA60;
    v15[3] = &unk_100018738;
    objc_copyWeak(&v16, &location);
    dispatch_async(queue, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (BOOL)isBootLockEnabled
{
  v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(FTDeviceObserver *)self queue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000FCD4;
  v5[3] = &unk_100018820;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setBootLockEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(FTDeviceObserver *)self queue];
  dispatch_assert_queue_V2(v5);

  if (self->_bootLockEnabled != v3)
  {
    self->_bootLockEnabled = v3;
    uint64_t v6 = [(FTDeviceObserver *)self delegateController];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000FDA4;
    v7[3] = &unk_100018848;
    v7[4] = self;
    [v6 enumerateDelegatesUsingBlock:v7];
  }
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(FTDeviceObserver *)self delegateController];
  [v8 addDelegate:v7 queue:v6];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(FTDeviceObserver *)self delegateController];
  [v5 removeDelegate:v4];
}

- (TUDelegateController)delegateController
{
  return self->_delegateController;
}

- (FTDeviceDataSource)dataSource
{
  return self->_dataSource;
}

- (FTNotifyObserver)firstUnlockNotifyObserver
{
  return self->_firstUnlockNotifyObserver;
}

- (void)setFirstUnlockNotifyObserver:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_firstUnlockNotifyObserver, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);

  objc_storeStrong((id *)&self->_delegateController, 0);
}

@end