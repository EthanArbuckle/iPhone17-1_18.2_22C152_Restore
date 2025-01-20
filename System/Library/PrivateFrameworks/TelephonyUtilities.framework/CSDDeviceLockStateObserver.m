@interface CSDDeviceLockStateObserver
- (BOOL)hasBeenUnlockedSinceBoot;
- (CSDDeviceLockStateObserver)initWithFirstUnlockObserver:(id)a3 whenUnlockedObserver:(id)a4 queue:(id)a5;
- (CSDDeviceLockStateObserver)initWithQueue:(id)a3;
- (NSMutableArray)firstUnlockCallbacks;
- (NSMutableArray)whenUnlockedCallbacks;
- (OS_dispatch_queue)queue;
- (TUNotifyObserver)firstUnlockObserver;
- (TUNotifyObserver)whenUnlockedObserver;
- (id)hasBeenUnlockedSinceBootBlock;
- (id)mobileKeyLockStateBlock;
- (int)mobileKeyLockState;
- (void)_handleDeviceFirstUnlockNotification;
- (void)_handleDeviceLockStatusNotification;
- (void)_refreshHasBeenUnlockedSinceBoot;
- (void)performBlockAfterFirstUnlock:(id)a3;
- (void)performBlockWhenUnlocked:(id)a3;
- (void)setFirstUnlockCallbacks:(id)a3;
- (void)setFirstUnlockObserver:(id)a3;
- (void)setHasBeenUnlockedSinceBoot:(BOOL)a3;
- (void)setHasBeenUnlockedSinceBootBlock:(id)a3;
- (void)setMobileKeyLockState:(int)a3;
- (void)setMobileKeyLockStateBlock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setWhenUnlockedCallbacks:(id)a3;
- (void)setWhenUnlockedObserver:(id)a3;
@end

@implementation CSDDeviceLockStateObserver

- (CSDDeviceLockStateObserver)initWithFirstUnlockObserver:(id)a3 whenUnlockedObserver:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = a5;
  v25.receiver = self;
  v25.super_class = (Class)CSDDeviceLockStateObserver;
  v12 = [(CSDDeviceLockStateObserver *)&v25 init];
  if (v12)
  {
    dispatch_assert_queue_V2(v11);
    objc_storeStrong((id *)&v12->_queue, a5);
    uint64_t v13 = +[NSMutableArray array];
    firstUnlockCallbacks = v12->_firstUnlockCallbacks;
    v12->_firstUnlockCallbacks = (NSMutableArray *)v13;

    uint64_t v15 = +[NSMutableArray array];
    whenUnlockedCallbacks = v12->_whenUnlockedCallbacks;
    v12->_whenUnlockedCallbacks = (NSMutableArray *)v15;

    id hasBeenUnlockedSinceBootBlock = v12->_hasBeenUnlockedSinceBootBlock;
    v12->_id hasBeenUnlockedSinceBootBlock = &stru_100508BC0;

    id mobileKeyLockStateBlock = v12->_mobileKeyLockStateBlock;
    v12->_id mobileKeyLockStateBlock = &stru_100508C20;

    v12->_mobileKeyLockState = -1;
    objc_initWeak(&location, v12);
    objc_storeStrong((id *)&v12->_firstUnlockObserver, a3);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100169970;
    v22[3] = &unk_100505698;
    objc_copyWeak(&v23, &location);
    [(TUNotifyObserver *)v12->_firstUnlockObserver setCallback:v22];
    objc_storeStrong((id *)&v12->_whenUnlockedObserver, a4);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1001699B0;
    v20[3] = &unk_100505698;
    objc_copyWeak(&v21, &location);
    [(TUNotifyObserver *)v12->_whenUnlockedObserver setCallback:v20];
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (CSDDeviceLockStateObserver)initWithQueue:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)TUNotifyObserver) initWithNotificationName:@"com.apple.mobile.keybagd.first_unlock" queue:v4];
  id v6 = [objc_alloc((Class)TUNotifyObserver) initWithNotificationName:@"com.apple.mobile.keybagd.lock_status" queue:v4];
  v7 = [(CSDDeviceLockStateObserver *)self initWithFirstUnlockObserver:v5 whenUnlockedObserver:v6 queue:v4];

  return v7;
}

- (void)_refreshHasBeenUnlockedSinceBoot
{
  v3 = [(CSDDeviceLockStateObserver *)self queue];
  dispatch_assert_queue_V2(v3);

  if (![(CSDDeviceLockStateObserver *)self hasBeenUnlockedSinceBoot])
  {
    id v4 = [(CSDDeviceLockStateObserver *)self hasBeenUnlockedSinceBootBlock];
    uint64_t v5 = v4[2]();

    if (v5 != [(CSDDeviceLockStateObserver *)self hasBeenUnlockedSinceBoot])
    {
      id v6 = sub_100008DCC();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7[0] = 67109376;
        v7[1] = [(CSDDeviceLockStateObserver *)self hasBeenUnlockedSinceBoot];
        __int16 v8 = 1024;
        int v9 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "hasBeenUnlockedSinceBoot changing from %d to %d", (uint8_t *)v7, 0xEu);
      }

      [(CSDDeviceLockStateObserver *)self setHasBeenUnlockedSinceBoot:v5];
    }
  }
}

- (void)_handleDeviceFirstUnlockNotification
{
  v3 = [(CSDDeviceLockStateObserver *)self queue];
  dispatch_assert_queue_V2(v3);

  [(CSDDeviceLockStateObserver *)self _refreshHasBeenUnlockedSinceBoot];
  if ([(CSDDeviceLockStateObserver *)self hasBeenUnlockedSinceBoot])
  {
    id v4 = [(CSDDeviceLockStateObserver *)self firstUnlockObserver];
    [v4 endObserving];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [(CSDDeviceLockStateObserver *)self firstUnlockCallbacks];
    id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        int v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v9) + 16))();
          int v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    id v10 = [(CSDDeviceLockStateObserver *)self firstUnlockCallbacks];
    [v10 removeAllObjects];
  }
}

- (void)_handleDeviceLockStatusNotification
{
  v3 = [(CSDDeviceLockStateObserver *)self queue];
  dispatch_assert_queue_V2(v3);

  id v4 = [(CSDDeviceLockStateObserver *)self mobileKeyLockStateBlock];
  uint64_t v5 = v4[2]();

  BOOL v6 = v5 == 3 || v5 == 0;
  if (v6
    && [(CSDDeviceLockStateObserver *)self mobileKeyLockState]
    && [(CSDDeviceLockStateObserver *)self mobileKeyLockState] != 3)
  {
    id v7 = [(CSDDeviceLockStateObserver *)self whenUnlockedCallbacks];
    id v8 = [v7 count];

    if (v8)
    {
      int v9 = sub_100008DCC();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        unsigned int v23 = [(CSDDeviceLockStateObserver *)self mobileKeyLockState];
        __int16 v24 = 1024;
        int v25 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "mobileKeyLockState changing from %d to %d", buf, 0xEu);
      }
    }
    id v10 = [(CSDDeviceLockStateObserver *)self whenUnlockedObserver];
    [v10 endObserving];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v11 = [(CSDDeviceLockStateObserver *)self whenUnlockedCallbacks];
    id v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v17 + 1) + 8 * (void)v15) + 16))();
          uint64_t v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        id v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }

    v16 = [(CSDDeviceLockStateObserver *)self whenUnlockedCallbacks];
    [v16 removeAllObjects];
  }
  [(CSDDeviceLockStateObserver *)self setMobileKeyLockState:v5];
}

- (void)performBlockAfterFirstUnlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [(CSDDeviceLockStateObserver *)self queue];
  dispatch_assert_queue_V2(v5);

  [(CSDDeviceLockStateObserver *)self _refreshHasBeenUnlockedSinceBoot];
  unsigned int v6 = [(CSDDeviceLockStateObserver *)self hasBeenUnlockedSinceBoot];
  id v7 = sub_100008DCC();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device has been unlocked since boot, so invoking block immediately", buf, 2u);
    }

    v4[2](v4);
LABEL_12:

    return;
  }
  if (v8)
  {
    *(_WORD *)long long v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device has not been unlocked since boot, so storing block to be performed upon first unlock after boot", v18, 2u);
  }

  int v9 = [(CSDDeviceLockStateObserver *)self firstUnlockCallbacks];
  id v10 = [v4 copy];

  id v11 = objc_retainBlock(v10);
  [v9 addObject:v11];

  uint64_t v12 = [(CSDDeviceLockStateObserver *)self firstUnlockObserver];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(CSDDeviceLockStateObserver *)self firstUnlockObserver];
    unsigned __int8 v15 = [v14 isObserving];

    if ((v15 & 1) == 0)
    {
      v16 = sub_100008DCC();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Device has not been unlocked-after-boot and is not yet observing device lock-after-boot changes, so begin to observe device unlock-after-boot changes", v17, 2u);
      }

      id v4 = [(CSDDeviceLockStateObserver *)self firstUnlockObserver];
      [v4 beginObserving];
      goto LABEL_12;
    }
  }
}

- (void)performBlockWhenUnlocked:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v5 = [(CSDDeviceLockStateObserver *)self queue];
  dispatch_assert_queue_V2(v5);

  if ([(CSDDeviceLockStateObserver *)self mobileKeyLockState] == -1)
  {
    unsigned int v6 = [(CSDDeviceLockStateObserver *)self mobileKeyLockStateBlock];
    [(CSDDeviceLockStateObserver *)self setMobileKeyLockState:v6[2]()];
  }
  if ([(CSDDeviceLockStateObserver *)self mobileKeyLockState]
    && [(CSDDeviceLockStateObserver *)self mobileKeyLockState] != 3)
  {
    BOOL v8 = sub_100008DCC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding callback to perform on next unlock", v19, 2u);
    }

    int v9 = [(CSDDeviceLockStateObserver *)self whenUnlockedCallbacks];
    id v10 = [v4 copy];
    id v11 = objc_retainBlock(v10);
    [v9 addObject:v11];

    uint64_t v12 = [(CSDDeviceLockStateObserver *)self whenUnlockedObserver];
    if (v12)
    {
      id v13 = (void *)v12;
      uint64_t v14 = [(CSDDeviceLockStateObserver *)self whenUnlockedObserver];
      unsigned __int8 v15 = [v14 isObserving];

      if ((v15 & 1) == 0)
      {
        v16 = sub_100008DCC();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Device is not yet observing device unlock changes, beginning to observe device unlock changes", v18, 2u);
        }

        long long v17 = [(CSDDeviceLockStateObserver *)self whenUnlockedObserver];
        [v17 beginObserving];
      }
    }
  }
  else
  {
    id v7 = sub_100008DCC();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Device unlocked, performing callback immediately", buf, 2u);
    }

    v4[2](v4);
  }
}

- (id)hasBeenUnlockedSinceBootBlock
{
  return self->_hasBeenUnlockedSinceBootBlock;
}

- (void)setHasBeenUnlockedSinceBootBlock:(id)a3
{
}

- (id)mobileKeyLockStateBlock
{
  return self->_mobileKeyLockStateBlock;
}

- (void)setMobileKeyLockStateBlock:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSMutableArray)firstUnlockCallbacks
{
  return self->_firstUnlockCallbacks;
}

- (void)setFirstUnlockCallbacks:(id)a3
{
}

- (NSMutableArray)whenUnlockedCallbacks
{
  return self->_whenUnlockedCallbacks;
}

- (void)setWhenUnlockedCallbacks:(id)a3
{
}

- (BOOL)hasBeenUnlockedSinceBoot
{
  return self->_hasBeenUnlockedSinceBoot;
}

- (void)setHasBeenUnlockedSinceBoot:(BOOL)a3
{
  self->_hasBeenUnlockedSinceBoot = a3;
}

- (int)mobileKeyLockState
{
  return self->_mobileKeyLockState;
}

- (void)setMobileKeyLockState:(int)a3
{
  self->_mobileKeyLockState = a3;
}

- (TUNotifyObserver)firstUnlockObserver
{
  return self->_firstUnlockObserver;
}

- (void)setFirstUnlockObserver:(id)a3
{
}

- (TUNotifyObserver)whenUnlockedObserver
{
  return self->_whenUnlockedObserver;
}

- (void)setWhenUnlockedObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whenUnlockedObserver, 0);
  objc_storeStrong((id *)&self->_firstUnlockObserver, 0);
  objc_storeStrong((id *)&self->_whenUnlockedCallbacks, 0);
  objc_storeStrong((id *)&self->_firstUnlockCallbacks, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_mobileKeyLockStateBlock, 0);

  objc_storeStrong(&self->_hasBeenUnlockedSinceBootBlock, 0);
}

@end