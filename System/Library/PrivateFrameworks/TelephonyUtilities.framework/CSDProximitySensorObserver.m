@interface CSDProximitySensorObserver
- (BOOL)isCovered;
- (CSDProximitySensorObserver)initWithQueue:(id)a3;
- (TUDelegateController)delegateController;
- (TUNotifyObserver)coveredNotifyObserver;
- (os_unfair_lock_s)accessorLock;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)dealloc;
- (void)removeDelegate:(id)a3;
- (void)setCovered:(BOOL)a3;
- (void)setCoveredNotifyObserver:(id)a3;
- (void)updateCovered;
@end

@implementation CSDProximitySensorObserver

- (CSDProximitySensorObserver)initWithQueue:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CSDProximitySensorObserver;
  v5 = [(CSDProximitySensorObserver *)&v20 init];
  v6 = v5;
  if (v5)
  {
    v5->_accessorLock._os_unfair_lock_opaque = 0;
    v7 = (TUDelegateController *)objc_alloc_init((Class)TUDelegateController);
    delegateController = v6->_delegateController;
    v6->_delegateController = v7;

    objc_initWeak(&location, v6);
    v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    v16 = sub_1001E799C;
    v17 = &unk_100505698;
    objc_copyWeak(&v18, &location);
    v9 = objc_retainBlock(&v14);
    id v10 = objc_alloc((Class)TUNotifyObserver);
    v11 = (TUNotifyObserver *)objc_msgSend(v10, "initWithNotificationName:queue:callback:", @"com.apple.backboard.proximity.changed", v4, v9, v14, v15, v16, v17);
    coveredNotifyObserver = v6->_coveredNotifyObserver;
    v6->_coveredNotifyObserver = v11;

    [(TUNotifyObserver *)v6->_coveredNotifyObserver beginObserving];
    [(CSDProximitySensorObserver *)v6 updateCovered];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (void)dealloc
{
  [(TUNotifyObserver *)self->_coveredNotifyObserver endObserving];
  v3.receiver = self;
  v3.super_class = (Class)CSDProximitySensorObserver;
  [(CSDProximitySensorObserver *)&v3 dealloc];
}

- (BOOL)isCovered
{
  v2 = self;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  LOBYTE(v2) = v2->_covered;
  os_unfair_lock_unlock(p_accessorLock);
  return (char)v2;
}

- (void)setCovered:(BOOL)a3
{
  BOOL v3 = a3;
  p_accessorLock = &self->_accessorLock;
  os_unfair_lock_lock(&self->_accessorLock);
  if (self->_covered != v3)
  {
    self->_covered = v3;
    v6 = [(CSDProximitySensorObserver *)self delegateController];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001E7BC8;
    v7[3] = &unk_10050A728;
    v7[4] = self;
    BOOL v8 = v3;
    [v6 enumerateDelegatesUsingBlock:v7];
  }
  os_unfair_lock_unlock(p_accessorLock);
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CSDProximitySensorObserver *)self delegateController];
  [v8 addDelegate:v7 queue:v6];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDProximitySensorObserver *)self delegateController];
  [v5 removeDelegate:v4];
}

- (void)updateCovered
{
  BOOL v3 = BKSHIDServicesGetObjectWithinProximity() != 0;

  [(CSDProximitySensorObserver *)self setCovered:v3];
}

- (os_unfair_lock_s)accessorLock
{
  return self->_accessorLock;
}

- (TUDelegateController)delegateController
{
  return self->_delegateController;
}

- (TUNotifyObserver)coveredNotifyObserver
{
  return self->_coveredNotifyObserver;
}

- (void)setCoveredNotifyObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coveredNotifyObserver, 0);

  objc_storeStrong((id *)&self->_delegateController, 0);
}

@end