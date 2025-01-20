@interface PLChangeHandlingNotificationObserver
- (BOOL)_locked_stopObservingRemoteNotifications;
- (BOOL)stopObservingRemoteNotifications;
- (PLChangeHandlingNotificationObserver)initWithLowPriorityThrottleInterval:(double)a3 targetWorkloop:(id)a4;
- (id)notificationBlock;
- (int)notifyTokenHigh;
- (int)notifyTokenLow;
- (void)_inq_handleHighPriorityNotification;
- (void)_inq_handleLowPriorityNotification;
- (void)_inq_handleThrottleTimer;
- (void)_inq_suspendIfThrottling;
- (void)_locked_startObservingRemoteNotificationsWithBlock:(id)a3;
- (void)dealloc;
- (void)startObservingRemoteNotificationsWithBlock:(id)a3;
@end

@implementation PLChangeHandlingNotificationObserver

- (void)_locked_startObservingRemoteNotificationsWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLChangeHandlingNotificationObserver.m", 128, @"Invalid parameter not satisfying: %@", @"notificationBlock != nil" object file lineNumber description];
  }
  if (self->_notifyTokenLow != -1)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLChangeHandlingNotificationObserver.m", 129, @"Notify token should be invalid, but is: %d (low)", self->_notifyTokenLow object file lineNumber description];
  }
  if (self->_notifyTokenHigh != -1)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"PLChangeHandlingNotificationObserver.m", 130, @"Notify token should be invalid, but is: %d (high)", self->_notifyTokenHigh object file lineNumber description];
  }
  if (self->_notificationBlock)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"PLChangeHandlingNotificationObserver.m" lineNumber:131 description:@"Notification block is already set"];
  }
  v6 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)MEMORY[0x19F38D650](v5);
    *(_DWORD *)buf = 134217984;
    v17 = v7;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEBUG, "Change handling notification: Start observerving notifications with block: %p", buf, 0xCu);
  }
  v8 = (void *)[v5 copy];
  id notificationBlock = self->_notificationBlock;
  self->_id notificationBlock = v8;

  objc_initWeak((id *)buf, self);
  v14[1] = (id)MEMORY[0x1E4F143A8];
  v14[2] = (id)3221225472;
  v14[3] = __91__PLChangeHandlingNotificationObserver__locked_startObservingRemoteNotificationsWithBlock___block_invoke;
  v14[4] = &unk_1E5868770;
  objc_copyWeak(&v15, (id *)buf);
  pl_notify_register_dispatch_with_retry();
  objc_copyWeak(v14, (id *)buf);
  pl_notify_register_dispatch_with_retry();
  objc_destroyWeak(v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

- (void)startObservingRemoteNotificationsWithBlock:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLSafeRunWithUnfairLock();
}

uint64_t __83__PLChangeHandlingNotificationObserver_startObservingRemoteNotificationsWithBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_startObservingRemoteNotificationsWithBlock:", *(void *)(a1 + 40));
}

- (PLChangeHandlingNotificationObserver)initWithLowPriorityThrottleInterval:(double)a3 targetWorkloop:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!v8)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PLChangeHandlingNotificationObserver.m", 57, @"Invalid parameter not satisfying: %@", @"targetWorkloop" object file lineNumber description];
  }
  v21.receiver = self;
  v21.super_class = (Class)PLChangeHandlingNotificationObserver;
  v9 = [(PLChangeHandlingNotificationObserver *)&v21 init];
  v10 = v9;
  if (v9)
  {
    v9->_throttleInterval = a3;
    *(void *)&v9->_lock._os_unfair_lock_opaque = 0xFFFFFFFF00000000;
    v9->_notifyTokenHigh = -1;
    id notificationBlock = v9->_notificationBlock;
    v9->_id notificationBlock = 0;

    objc_storeStrong((id *)&v10->_targetWorkloop, a4);
    uint64_t v12 = s_dispatch_queue_create_for_notifications("com.apple.photos.PLChangeHandlingNotificationObserver.lowNotifyQueue", v10->_targetWorkloop);
    lowNotifyQueue = v10->_lowNotifyQueue;
    v10->_lowNotifyQueue = (OS_dispatch_queue *)v12;

    PLIsForegroundApplication();
    uint64_t v14 = s_dispatch_queue_create_for_notifications("com.apple.photos.PLChangeHandlingNotificationObserver.highNotifyQueue", v10->_targetWorkloop);
    highNotifyQueue = v10->_highNotifyQueue;
    v10->_highNotifyQueue = (OS_dispatch_queue *)v14;

    v16 = PLPhotosObjectLifecycleGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = objc_opt_class();
      *(_DWORD *)buf = 138412802;
      uint64_t v23 = v17;
      __int16 v24 = 2048;
      v25 = v10;
      __int16 v26 = 2048;
      double v27 = a3;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "%@ %p initWithLowPriorityThrottleInterval:%f", buf, 0x20u);
    }

    uint64_t v18 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationBlock, 0);
  objc_storeStrong((id *)&self->_highNotifyQueue, 0);
  objc_storeStrong((id *)&self->_lowNotifyQueue, 0);
  objc_storeStrong((id *)&self->_targetWorkloop, 0);
}

- (BOOL)_locked_stopObservingRemoteNotifications
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  id v3 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = (void *)MEMORY[0x19F38D650](self->_notificationBlock);
    int v10 = 134217984;
    v11 = v4;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Change handling notification: Stop observerving notifications with block: %p", (uint8_t *)&v10, 0xCu);
  }
  int notifyTokenLow = self->_notifyTokenLow;
  if (notifyTokenLow == -1)
  {
    int notifyTokenHigh = self->_notifyTokenHigh;
    if (notifyTokenHigh == -1)
    {
      BOOL v7 = self->_notificationBlock != 0;
      goto LABEL_9;
    }
  }
  else
  {
    notify_cancel(notifyTokenLow);
    int notifyTokenHigh = self->_notifyTokenHigh;
    if (notifyTokenHigh == -1) {
      goto LABEL_8;
    }
  }
  notify_cancel(notifyTokenHigh);
LABEL_8:
  BOOL v7 = 1;
LABEL_9:
  *(void *)&self->_int notifyTokenLow = -1;
  id notificationBlock = self->_notificationBlock;
  self->_id notificationBlock = 0;

  return v7;
}

- (BOOL)stopObservingRemoteNotifications
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  PLSafeRunWithUnfairLock();
  char v2 = *((unsigned char *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __72__PLChangeHandlingNotificationObserver_stopObservingRemoteNotifications__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_locked_stopObservingRemoteNotifications");
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_inq_handleHighPriorityNotification
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_targetWorkloop);
  id v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLChangeHandlingNotificationObserver _inq_handleHighPriorityNotification]"];
  uint64_t v4 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    qos_class_self();
    id v5 = PLStringFromQoSClass();
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Change handling notification: Handling high priority notification at QoS: %@", buf, 0xCu);
  }
  uint64_t v6 = [(PLChangeHandlingNotificationObserver *)self notificationBlock];
  char v7 = +[PLConcurrencyLimiter sharedLimiter];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__PLChangeHandlingNotificationObserver__inq_handleHighPriorityNotification__block_invoke;
  v10[3] = &unk_1E58742F0;
  id v11 = v3;
  id v12 = v6;
  id v8 = v3;
  id v9 = v6;
  [v7 sync:v10 identifyingBlock:0 library:0];
}

uint64_t __75__PLChangeHandlingNotificationObserver__inq_handleHighPriorityNotification__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, *(void *)(a1 + 32));
  }
  return result;
}

- (void)_inq_handleThrottleTimer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_targetWorkloop);
  id v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLChangeHandlingNotificationObserver _inq_handleThrottleTimer]"];
  uint64_t v4 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    qos_class_self();
    id v5 = PLStringFromQoSClass();
    int v6 = 138412290;
    char v7 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Change handling notification: Resuming low priority notifications at QoS: %@", (uint8_t *)&v6, 0xCu);
  }
  notify_resume([(PLChangeHandlingNotificationObserver *)self notifyTokenLow]);
  [v3 stillAlive];
}

- (void)_inq_suspendIfThrottling
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_targetWorkloop);
  if (self->_throttleInterval > 0.0)
  {
    id v3 = PLChangeHandlingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      qos_class_self();
      uint64_t v4 = PLStringFromQoSClass();
      *(_DWORD *)buf = 138412290;
      int v10 = v4;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "Change handling notification: Suspending low priority notifications at QoS: %@", buf, 0xCu);
    }
    notify_suspend([(PLChangeHandlingNotificationObserver *)self notifyTokenLow]);
    objc_initWeak((id *)buf, self);
    dispatch_time_t v5 = dispatch_time(0, (uint64_t)(self->_throttleInterval * 1000000000.0));
    lowNotifyQueue = self->_lowNotifyQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__PLChangeHandlingNotificationObserver__inq_suspendIfThrottling__block_invoke;
    block[3] = &unk_1E5875F08;
    objc_copyWeak(&v8, (id *)buf);
    dispatch_after(v5, lowNotifyQueue, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
}

void __64__PLChangeHandlingNotificationObserver__inq_suspendIfThrottling__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_inq_handleThrottleTimer");
}

- (void)_inq_handleLowPriorityNotification
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_targetWorkloop);
  id v3 = [MEMORY[0x1E4F8BA48] transaction:"-[PLChangeHandlingNotificationObserver _inq_handleLowPriorityNotification]"];
  uint64_t v4 = PLChangeHandlingGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    qos_class_self();
    dispatch_time_t v5 = PLStringFromQoSClass();
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "Change handling notification: Handling low priority notification at QoS: %@", buf, 0xCu);
  }
  [(PLChangeHandlingNotificationObserver *)self _inq_suspendIfThrottling];
  int v6 = [(PLChangeHandlingNotificationObserver *)self notificationBlock];
  char v7 = +[PLConcurrencyLimiter sharedLimiter];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__PLChangeHandlingNotificationObserver__inq_handleLowPriorityNotification__block_invoke;
  v10[3] = &unk_1E58742F0;
  id v11 = v3;
  id v12 = v6;
  id v8 = v3;
  id v9 = v6;
  [v7 sync:v10 identifyingBlock:0 library:0];
}

uint64_t __74__PLChangeHandlingNotificationObserver__inq_handleLowPriorityNotification__block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, 0, *(void *)(a1 + 32));
  }
  return result;
}

void __91__PLChangeHandlingNotificationObserver__locked_startObservingRemoteNotificationsWithBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_inq_handleLowPriorityNotification");
}

void __91__PLChangeHandlingNotificationObserver__locked_startObservingRemoteNotificationsWithBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_inq_handleHighPriorityNotification");
}

- (id)notificationBlock
{
  char v2 = PLResultWithUnfairLock();
  return v2;
}

id __57__PLChangeHandlingNotificationObserver_notificationBlock__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x19F38D650](*(void *)(*(void *)(a1 + 32) + 56));
  return v1;
}

- (int)notifyTokenHigh
{
  char v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_notifyTokenHigh;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (int)notifyTokenLow
{
  char v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LODWORD(v2) = v2->_notifyTokenLow;
  os_unfair_lock_unlock(p_lock);
  return (int)v2;
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v7 = objc_opt_class();
    __int16 v8 = 2048;
    id v9 = self;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  if ([(PLChangeHandlingNotificationObserver *)self stopObservingRemoteNotifications])
  {
    uint64_t v4 = PLChangeHandlingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_FAULT, "Deallocated PLChangeHandlingNotificationObserver while still observing notifications", buf, 2u);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)PLChangeHandlingNotificationObserver;
  [(PLChangeHandlingNotificationObserver *)&v5 dealloc];
}

@end