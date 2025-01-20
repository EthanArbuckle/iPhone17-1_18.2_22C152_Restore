@interface CKKSLockStateTracker
+ (id)globalTracker;
- (BOOL)checkErrorChainForLockState:(id)a3;
- (BOOL)isLocked;
- (BOOL)isLockedError:(id)a3;
- (BOOL)lockedError:(id)a3;
- (BOOL)queueIsLocked;
- (CKKSLockStateProviderProtocol)lockStateProvider;
- (CKKSLockStateTracker)initWithProvider:(id)a3;
- (NSDate)lastUnlockTime;
- (NSDate)lastUnlockedTime;
- (NSHashTable)observers;
- (NSOperation)unlockDependency;
- (NSOperationQueue)operationQueue;
- (OS_dispatch_queue)queue;
- (id)description;
- (int)notify_token;
- (void)_onqueueRecheck;
- (void)addLockStateObserver:(id)a3;
- (void)dealloc;
- (void)recheck;
- (void)resetUnlockDependency;
- (void)setLastUnlockedTime:(id)a3;
- (void)setLockStateProvider:(id)a3;
- (void)setNotify_token:(int)a3;
- (void)setObservers:(id)a3;
- (void)setOperationQueue:(id)a3;
- (void)setQueue:(id)a3;
- (void)setQueueIsLocked:(BOOL)a3;
- (void)setUnlockDependency:(id)a3;
@end

@implementation CKKSLockStateTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUnlockedTime, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lockStateProvider, 0);

  objc_storeStrong((id *)&self->_unlockDependency, 0);
}

- (void)setLastUnlockedTime:(id)a3
{
}

- (NSDate)lastUnlockedTime
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setNotify_token:(int)a3
{
  self->_notify_token = a3;
}

- (int)notify_token
{
  return self->_notify_token;
}

- (void)setObservers:(id)a3
{
}

- (NSHashTable)observers
{
  return (NSHashTable *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOperationQueue:(id)a3
{
}

- (NSOperationQueue)operationQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setQueueIsLocked:(BOOL)a3
{
  self->_queueIsLocked = a3;
}

- (BOOL)queueIsLocked
{
  return self->_queueIsLocked;
}

- (void)setLockStateProvider:(id)a3
{
}

- (CKKSLockStateProviderProtocol)lockStateProvider
{
  return (CKKSLockStateProviderProtocol *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUnlockDependency:(id)a3
{
}

- (NSOperation)unlockDependency
{
  return (NSOperation *)objc_getProperty(self, a2, 16, 1);
}

- (void)addLockStateObserver:(id)a3
{
  id v4 = a3;
  v5 = [(CKKSLockStateTracker *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100171914;
  v7[3] = &unk_100305930;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (BOOL)isLockedError:(id)a3
{
  BOOL v4 = [(CKKSLockStateTracker *)self checkErrorChainForLockState:a3];
  if (v4)
  {
    v5 = [(CKKSLockStateTracker *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100171A90;
    block[3] = &unk_100308558;
    block[4] = self;
    dispatch_sync(v5, block);
  }
  return v4;
}

- (BOOL)checkErrorChainForLockState:(id)a3
{
  id v4 = a3;
  if (!v4) {
    return 0;
  }
  v5 = v4;
  do
  {
    BOOL v6 = [(CKKSLockStateTracker *)self lockedError:v5];
    if (v6) {
      break;
    }
    v7 = [v5 userInfo];
    uint64_t v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

    v5 = (void *)v8;
  }
  while (v8);

  return v6;
}

- (BOOL)lockedError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == (id)-25308)
  {
    id v4 = [v3 domain];
    if ([v4 isEqualToString:@"securityd"])
    {
      unsigned __int8 v5 = 1;
    }
    else
    {
      BOOL v6 = [v3 domain];
      unsigned __int8 v5 = [v6 isEqualToString:kCFErrorDomainOSStatus];
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)recheck
{
  id v3 = [(CKKSLockStateTracker *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100171CA0;
  block[3] = &unk_100308558;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (void)_onqueueRecheck
{
  id v3 = [(CKKSLockStateTracker *)self queue];
  dispatch_assert_queue_V2(v3);

  unsigned int v4 = [(CKKSLockStateTracker *)self queueIsLocked];
  unsigned __int8 v5 = [(CKKSLockStateTracker *)self lockStateProvider];
  -[CKKSLockStateTracker setQueueIsLocked:](self, "setQueueIsLocked:", [v5 queryAKSLocked]);

  if (v4 == [(CKKSLockStateTracker *)self queueIsLocked] && (byte_10035D1D8 & 1) != 0) {
    return;
  }
  byte_10035D1D8 = 1;
  if ([(CKKSLockStateTracker *)self queueIsLocked])
  {
    [(CKKSLockStateTracker *)self resetUnlockDependency];
    if ((v4 & 1) == 0) {
      goto LABEL_8;
    }
  }
  else
  {
    BOOL v6 = [(CKKSLockStateTracker *)self operationQueue];
    v7 = [(CKKSLockStateTracker *)self unlockDependency];
    [v6 addOperation:v7];

    [(CKKSLockStateTracker *)self setUnlockDependency:0];
  }
  uint64_t v8 = +[NSDate date];
  [(CKKSLockStateTracker *)self setLastUnlockedTime:v8];

LABEL_8:
  unsigned __int8 v9 = [(CKKSLockStateTracker *)self queueIsLocked];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v10 = self->_observers;
  id v11 = [(NSHashTable *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    char v13 = v9 ^ 1;
    uint64_t v14 = *(void *)v22;
LABEL_10:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v10);
      }
      id v16 = *(id *)(*((void *)&v21 + 1) + 8 * v15);
      if (!v16) {
        break;
      }
      v17 = v16;
      v18 = dispatch_get_global_queue(21, 0);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100171F20;
      v19[3] = &unk_1003055B0;
      v19[4] = v17;
      char v20 = v13;
      dispatch_async(v18, v19);

      if (v12 == (id)++v15)
      {
        id v12 = [(NSHashTable *)v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          goto LABEL_10;
        }
        break;
      }
    }
  }
}

- (void)resetUnlockDependency
{
  uint64_t v3 = [(CKKSLockStateTracker *)self unlockDependency];
  if (!v3
    || (unsigned int v4 = (void *)v3,
        [(CKKSLockStateTracker *)self unlockDependency],
        unsigned __int8 v5 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v6 = [v5 isPending],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    id v7 = +[CKKSResultOperation named:@"keybag-unlocked-dependency" withBlock:&stru_100305588];
    [v7 setDescriptionErrorCode:4];
    [(CKKSLockStateTracker *)self setUnlockDependency:v7];
  }
}

- (id)description
{
  if ([(CKKSLockStateTracker *)self isLocked])
  {
    uint64_t v3 = [(CKKSLockStateTracker *)self lastUnlockedTime];
    unsigned int v4 = +[NSString stringWithFormat:@"<CKKSLockStateTracker: %@ last:%@>", @"locked", v3];
  }
  else
  {
    unsigned int v4 = +[NSString stringWithFormat:@"<CKKSLockStateTracker: %@ last:%@>", @"unlocked", @"now"];
  }

  return v4;
}

- (NSDate)lastUnlockTime
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_10017223C;
  id v11 = sub_10017224C;
  id v12 = 0;
  uint64_t v3 = [(CKKSLockStateTracker *)self queue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100172254;
  v6[3] = &unk_100307348;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDate *)v4;
}

- (BOOL)isLocked
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001723A8;
  v5[3] = &unk_100307348;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)dealloc
{
  int notify_token = self->_notify_token;
  if (notify_token != -1) {
    notify_cancel(notify_token);
  }
  v4.receiver = self;
  v4.super_class = (Class)CKKSLockStateTracker;
  [(CKKSLockStateTracker *)&v4 dealloc];
}

- (CKKSLockStateTracker)initWithProvider:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CKKSLockStateTracker;
  uint64_t v6 = [(CKKSLockStateTracker *)&v23 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_lockStateProvider, a3);
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("lock-state-tracker", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    id v11 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v11;

    v7->_int notify_token = -1;
    v7->_queueIsLocked = 1;
    uint64_t v13 = +[NSHashTable weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v13;

    [(CKKSLockStateTracker *)v7 resetUnlockDependency];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    uint64_t v15 = v7->_queue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10017262C;
    handler[3] = &unk_100306F38;
    objc_copyWeak(&v21, &location);
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v7->_notify_token, v15, handler);
    objc_destroyWeak(&v21);
    id v16 = v7->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10017266C;
    block[3] = &unk_1003077A0;
    objc_copyWeak(&v19, &location);
    dispatch_async(v16, block);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v7;
}

+ (id)globalTracker
{
  if (qword_10035D1E8 != -1) {
    dispatch_once(&qword_10035D1E8, &stru_1003055D0);
  }
  v2 = (void *)qword_10035D1E0;

  return v2;
}

@end