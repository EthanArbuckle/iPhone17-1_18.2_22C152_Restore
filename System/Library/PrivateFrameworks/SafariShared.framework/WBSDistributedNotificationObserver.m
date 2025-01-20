@interface WBSDistributedNotificationObserver
- (WBSDistributedNotificationObserver)init;
- (WBSDistributedNotificationObserver)initWithNotificationName:(id)a3;
- (WBSDistributedNotificationObserver)initWithNotificationName:(id)a3 type:(int64_t)a4;
- (id)notificationHandler;
- (id)timeoutHandler;
- (void)_didReceiveNotification:(id)a3;
- (void)_didTimeOut;
- (void)_invalidateTimeoutTimer;
- (void)_scheduleTimeoutTimerWithTimeout:(double)a3;
- (void)_startObserving;
- (void)_stopObserving;
- (void)setNotificationHandler:(id)a3;
- (void)setTimeoutHandler:(id)a3;
- (void)stopWaiting;
- (void)waitWithTimeout:(double)a3;
@end

@implementation WBSDistributedNotificationObserver

- (WBSDistributedNotificationObserver)init
{
  return 0;
}

- (WBSDistributedNotificationObserver)initWithNotificationName:(id)a3
{
  return [(WBSDistributedNotificationObserver *)self initWithNotificationName:a3 type:0];
}

- (WBSDistributedNotificationObserver)initWithNotificationName:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WBSDistributedNotificationObserver;
  v7 = [(WBSDistributedNotificationObserver *)&v15 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    notificationName = v7->_notificationName;
    v7->_notificationName = (NSString *)v8;

    v7->_notificationType = a4;
    id v10 = [@"com.apple.Safari.WBSCloudBookmarksSyncAgentObserver." stringByAppendingString:v6];
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], 0);
    internalQueue = v7->_internalQueue;
    v7->_internalQueue = (OS_dispatch_queue *)v11;

    v13 = v7;
  }

  return v7;
}

- (void)setNotificationHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__WBSDistributedNotificationObserver_setNotificationHandler___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void __61__WBSDistributedNotificationObserver_setNotificationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1AD0C4F80](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;
}

- (id)notificationHandler
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  id v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__WBSDistributedNotificationObserver_notificationHandler__block_invoke;
  v5[3] = &unk_1E5C8CF00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  uint64_t v3 = (void *)MEMORY[0x1AD0C4F80](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __57__WBSDistributedNotificationObserver_notificationHandler__block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setTimeoutHandler:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__WBSDistributedNotificationObserver_setTimeoutHandler___block_invoke;
  v7[3] = &unk_1E5C8CDF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(internalQueue, v7);
}

void __56__WBSDistributedNotificationObserver_setTimeoutHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1AD0C4F80](*(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;
}

- (id)timeoutHandler
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__10;
  id v10 = __Block_byref_object_dispose__10;
  id v11 = 0;
  internalQueue = self->_internalQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__WBSDistributedNotificationObserver_timeoutHandler__block_invoke;
  v5[3] = &unk_1E5C8CF00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(internalQueue, v5);
  uint64_t v3 = (void *)MEMORY[0x1AD0C4F80](v7[5]);
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __52__WBSDistributedNotificationObserver_timeoutHandler__block_invoke(uint64_t a1)
{
  uint64_t v2 = MEMORY[0x1AD0C4F80](*(void *)(*(void *)(a1 + 32) + 56));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)waitWithTimeout:(double)a3
{
  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__WBSDistributedNotificationObserver_waitWithTimeout___block_invoke;
  v4[3] = &unk_1E5C8CF50;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(internalQueue, v4);
}

uint64_t __54__WBSDistributedNotificationObserver_waitWithTimeout___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _startObserving];
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  return [v2 _scheduleTimeoutTimerWithTimeout:v3];
}

- (void)stopWaiting
{
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__WBSDistributedNotificationObserver_stopWaiting__block_invoke;
  block[3] = &unk_1E5C8C880;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __49__WBSDistributedNotificationObserver_stopWaiting__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopObserving];
}

- (void)_startObserving
{
  if (!self->_observing)
  {
    int64_t notificationType = self->_notificationType;
    if (notificationType == 1)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)handleNotification, (CFStringRef)self->_notificationName, 0, (CFNotificationSuspensionBehavior)1024);
    }
    else if (!notificationType)
    {
      id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v4 addObserver:self selector:sel__didReceiveNotification_ name:self->_notificationName object:0 suspensionBehavior:4];
    }
    self->_observing = 1;
  }
}

- (void)_stopObserving
{
  [(WBSDistributedNotificationObserver *)self _invalidateTimeoutTimer];
  if (self->_observing)
  {
    int64_t notificationType = self->_notificationType;
    if (notificationType == 1)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)self->_notificationName, 0);
    }
    else if (!notificationType)
    {
      id v4 = [MEMORY[0x1E4F28C40] defaultCenter];
      [v4 removeObserver:self name:self->_notificationName object:0];
    }
    self->_observing = 0;
  }
}

- (void)_scheduleTimeoutTimerWithTimeout:(double)a3
{
  [(WBSDistributedNotificationObserver *)self _invalidateTimeoutTimer];
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_internalQueue);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = v5;

  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer((dispatch_source_t)self->_timeoutTimer, v7, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a3 / 10.0 * 1000000000.0));
  uint64_t v8 = self->_timeoutTimer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __71__WBSDistributedNotificationObserver__scheduleTimeoutTimerWithTimeout___block_invoke;
  handler[3] = &unk_1E5C8C880;
  handler[4] = self;
  dispatch_source_set_event_handler(v8, handler);
  dispatch_resume((dispatch_object_t)self->_timeoutTimer);
}

uint64_t __71__WBSDistributedNotificationObserver__scheduleTimeoutTimerWithTimeout___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _didTimeOut];
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _stopObserving];
}

- (void)_invalidateTimeoutTimer
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel(timeoutTimer);
    id v4 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
}

- (void)_didReceiveNotification:(id)a3
{
  id v4 = a3;
  internalQueue = self->_internalQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__WBSDistributedNotificationObserver__didReceiveNotification___block_invoke;
  v7[3] = &unk_1E5C8C920;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(internalQueue, v7);
}

uint64_t __62__WBSDistributedNotificationObserver__didReceiveNotification___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(unsigned char *)(result + 24))
  {
    uint64_t v3 = *(void *)(result + 48);
    if (v3)
    {
      uint64_t result = (*(uint64_t (**)(void, void))(v3 + 16))(*(void *)(result + 48), *(void *)(a1 + 40));
      if (!result) {
        return result;
      }
      uint64_t result = *(void *)(a1 + 32);
    }
    return [(id)result _stopObserving];
  }
  return result;
}

- (void)_didTimeOut
{
  timeoutHandler = (void (**)(void))self->_timeoutHandler;
  if (timeoutHandler) {
    timeoutHandler[2]();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong(&self->_notificationHandler, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_notificationName, 0);
}

@end