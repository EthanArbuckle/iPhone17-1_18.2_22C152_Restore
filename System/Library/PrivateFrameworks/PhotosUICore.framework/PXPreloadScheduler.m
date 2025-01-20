@interface PXPreloadScheduler
+ (PXPreloadScheduler)sharedScheduler;
- (BOOL)_isActive;
- (BOOL)_shouldExecutePendingBlock;
- (BOOL)didFinishExtendedLaunch;
- (BOOL)waitForExtendedLaunch;
- (PXPreloadScheduler)init;
- (void)_activateQueues;
- (void)_activateQueuesIfAllowed;
- (void)_didExecuteTaskWithQoS:(unint64_t)a3;
- (void)_runLoopWillStartWaiting;
- (void)_setActive:(BOOL)a3;
- (void)_updateIsActive;
- (void)_willScheduleTaskWithQoS:(unint64_t)a3;
- (void)applicationDidFinishExtendedLaunch;
- (void)dealloc;
- (void)scheduleDeferredMainQueueTask:(id)a3;
- (void)scheduleDeferredTaskWithQoS:(unint64_t)a3 block:(id)a4;
- (void)scheduleMainQueueTask:(id)a3;
- (void)scheduleMainQueueTaskAndWait:(id)a3;
- (void)scheduleTaskAfterCATransactionCommits:(id)a3;
- (void)scheduleTaskWithQoS:(unint64_t)a3 block:(id)a4;
- (void)setDidFinishExtendedLaunch:(BOOL)a3;
- (void)setWaitForExtendedLaunch:(BOOL)a3;
@end

@implementation PXPreloadScheduler

- (void)_runLoopWillStartWaiting
{
  if ([(NSMutableArray *)self->_pendingBlocks count]
    && [(PXPreloadScheduler *)self _shouldExecutePendingBlock])
  {
    v3 = [(NSMutableArray *)self->_pendingBlocks firstObject];
    if (v3)
    {
      [(NSMutableArray *)self->_pendingBlocks removeObjectAtIndex:0];
      v3[2](v3);
    }
  }
  [(PXPreloadScheduler *)self _updateIsActive];
}

- (BOOL)_shouldExecutePendingBlock
{
  [(PXDisplayLink *)self->_displayLink duration];
  if (v3 <= 0.0) {
    return 0;
  }
  double v4 = v3;
  CFTimeInterval v5 = CACurrentMediaTime();
  if (!self->_shouldIgnoreDisplayLinkTimestamps)
  {
    double waitStartTime = self->_waitStartTime;
    if (waitStartTime != 0.0 && v5 > waitStartTime + 10.0)
    {
      self->_shouldIgnoreDisplayLinkTimestamps = 1;
      v8 = PLUIGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "PXPreloadScheduler timed out waiting for space in a frame, ignoring CADisplayLink timestamps from now on.", v13, 2u);
      }
    }
  }
  [(PXDisplayLink *)self->_displayLink targetTimestamp];
  if ((v9 - v5) / v4 > 0.8 || (double v10 = self->_waitStartTime, self->_shouldIgnoreDisplayLinkTimestamps) && v5 > v10 + 0.05)
  {
    if (!self->_shouldIgnoreDisplayLinkTimestamps) {
      CFTimeInterval v5 = 0.0;
    }
    BOOL v11 = 1;
    goto LABEL_16;
  }
  BOOL v11 = 0;
  BOOL result = 0;
  if (v10 == 0.0)
  {
LABEL_16:
    self->_double waitStartTime = v5;
    return v11;
  }
  return result;
}

intptr_t __51__PXPreloadScheduler_scheduleMainQueueTaskAndWait___block_invoke(uint64_t a1)
{
  kdebug_trace();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  kdebug_trace();
  v2 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v2);
}

void __56__PXPreloadScheduler_scheduleDeferredTaskWithQoS_block___block_invoke(void *a1)
{
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PXPreloadScheduler_scheduleDeferredTaskWithQoS_block___block_invoke_2;
  block[3] = &unk_1E5DD34C0;
  double v4 = (void *)a1[5];
  uint64_t v3 = a1[6];
  block[4] = a1[4];
  uint64_t v7 = v3;
  id v6 = v4;
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
}

- (void)_updateIsActive
{
  BOOL v3 = [(NSMutableArray *)self->_pendingBlocks count] != 0;
  [(PXPreloadScheduler *)self _setActive:v3];
}

uint64_t __33__PXPreloadScheduler__setActive___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runLoopWillStartWaiting];
}

- (void)setWaitForExtendedLaunch:(BOOL)a3
{
  self->_waitForExtendedLaunch = a3;
}

- (void)_setActive:(BOOL)a3
{
  if (self->__isActive != a3)
  {
    self->__isActive = a3;
    if (a3)
    {
      id v4 = objc_alloc((Class)off_1E5DA6208);
      CFTimeInterval v5 = (PXDisplayLink *)[v4 initWithWeakTarget:self selector:sel__displayLinkTick_ deferredStart:0 runloopModes:*MEMORY[0x1E4F1C3A0] preferredFramesPerSecond:0];
      displayLink = self->_displayLink;
      self->_displayLink = v5;

      [(PXDisplayLink *)self->_displayLink setFrameRateRangeType:1];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __33__PXPreloadScheduler__setActive___block_invoke;
      block[3] = &unk_1E5DBDD20;
      block[4] = self;
      uint64_t v7 = CFRunLoopObserverCreateWithHandler(0, 0x20uLL, 1u, 2000001, block);
      self->_runloopObserver = v7;
      if (v7)
      {
        Main = CFRunLoopGetMain();
        CFRunLoopAddObserver(Main, self->_runloopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
      }
      else
      {
        BOOL v11 = PLUIGetLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "PXPreloadScheduler failed to create a run loop observer, deferred tasks will be dropped on the floor", v12, 2u);
        }
      }
    }
    else
    {
      [(PXDisplayLink *)self->_displayLink invalidate];
      double v9 = self->_displayLink;
      self->_displayLink = 0;

      if (self->_runloopObserver)
      {
        double v10 = CFRunLoopGetMain();
        CFRunLoopRemoveObserver(v10, self->_runloopObserver, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
        CFRelease(self->_runloopObserver);
        self->_runloopObserver = 0;
      }
    }
  }
}

uint64_t __48__PXPreloadScheduler_scheduleTaskWithQoS_block___block_invoke(void *a1)
{
  kdebug_trace();
  (*(void (**)(void))(a1[5] + 16))();
  kdebug_trace();
  dispatch_time_t v2 = (void *)a1[4];
  uint64_t v3 = a1[6];
  return [v2 _didExecuteTaskWithQoS:v3];
}

uint64_t __44__PXPreloadScheduler_scheduleMainQueueTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleMainQueueTaskAndWait:*(void *)(a1 + 40)];
}

- (void)scheduleMainQueueTaskAndWait:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__PXPreloadScheduler_scheduleMainQueueTaskAndWait___block_invoke;
  aBlock[3] = &unk_1E5DD0E78;
  dispatch_semaphore_t v13 = v5;
  id v14 = v4;
  aBlock[4] = self;
  id v6 = v5;
  id v7 = v4;
  v8 = _Block_copy(aBlock);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__PXPreloadScheduler_scheduleMainQueueTaskAndWait___block_invoke_2;
  block[3] = &unk_1E5DD3280;
  block[4] = self;
  id v11 = v8;
  id v9 = v8;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)_didExecuteTaskWithQoS:(unint64_t)a3
{
  if (a3 == 1) {
    dispatch_group_leave((dispatch_group_t)self->_pendingUtilityTasks);
  }
}

void __60__PXPreloadScheduler_scheduleTaskAfterCATransactionCommits___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 _performBlockAfterCATransactionCommits:*(void *)(a1 + 32)];
}

+ (PXPreloadScheduler)sharedScheduler
{
  if (sharedScheduler_onceToken != -1) {
    dispatch_once(&sharedScheduler_onceToken, &__block_literal_global_133962);
  }
  id v2 = (void *)sharedScheduler_scheduler;
  return (PXPreloadScheduler *)v2;
}

- (void)scheduleDeferredTaskWithQoS:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  [(PXPreloadScheduler *)self _willScheduleTaskWithQoS:a3];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__PXPreloadScheduler_scheduleDeferredTaskWithQoS_block___block_invoke;
  v8[3] = &unk_1E5DD34C0;
  id v9 = v6;
  unint64_t v10 = a3;
  v8[4] = self;
  id v7 = v6;
  [(PXPreloadScheduler *)self scheduleMainQueueTask:v8];
}

- (void)scheduleMainQueueTask:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PXPreloadScheduler_scheduleMainQueueTask___block_invoke;
  v6[3] = &unk_1E5DD3280;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXPreloadScheduler *)self scheduleTaskWithQoS:1 block:v6];
}

- (void)scheduleTaskWithQoS:(unint64_t)a3 block:(id)a4
{
  id v6 = a4;
  if (a3 == 2)
  {
    id v9 = self->_backgroundQueue;
    pendingUtilityTasks = self->_pendingUtilityTasks;
    id v7 = pendingUtilityTasks;
LABEL_8:
    unint64_t v10 = pendingUtilityTasks;
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    id v7 = 0;
    pendingUtilityTasks = self->_utilityQueue;
    goto LABEL_7;
  }
  id v7 = 0;
  if (!a3)
  {
    pendingUtilityTasks = self->_defaultQueue;
LABEL_7:
    id v9 = pendingUtilityTasks;
    goto LABEL_8;
  }
  id v9 = 0;
LABEL_10:
  [(PXPreloadScheduler *)self _willScheduleTaskWithQoS:a3];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PXPreloadScheduler_scheduleTaskWithQoS_block___block_invoke;
  block[3] = &unk_1E5DD34C0;
  block[4] = self;
  id v11 = v6;
  id v14 = v11;
  unint64_t v15 = a3;
  dispatch_block_t v12 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, block);
  if (v7) {
    dispatch_group_notify(v7, (dispatch_queue_t)v9, v12);
  }
  else {
    dispatch_async((dispatch_queue_t)v9, v12);
  }
}

- (void)_willScheduleTaskWithQoS:(unint64_t)a3
{
  if (a3 == 1) {
    dispatch_group_enter((dispatch_group_t)self->_pendingUtilityTasks);
  }
}

uint64_t __51__PXPreloadScheduler_scheduleMainQueueTaskAndWait___block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 64);
  uint64_t v3 = (void *)[*(id *)(a1 + 40) copy];
  [v2 addObject:v3];

  id v4 = *(void **)(a1 + 32);
  return [v4 _updateIsActive];
}

uint64_t __56__PXPreloadScheduler_applicationDidFinishExtendedLaunch__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateQueues];
}

uint64_t __26__PXPreloadScheduler_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateQueuesIfAllowed];
}

- (void)scheduleTaskAfterCATransactionCommits:(id)a3
{
  id v3 = a3;
  px_dispatch_on_main_queue();
}

- (void)applicationDidFinishExtendedLaunch
{
  if (![(PXPreloadScheduler *)self didFinishExtendedLaunch])
  {
    [(PXPreloadScheduler *)self setDidFinishExtendedLaunch:1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__PXPreloadScheduler_applicationDidFinishExtendedLaunch__block_invoke;
    block[3] = &unk_1E5DD36F8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)setDidFinishExtendedLaunch:(BOOL)a3
{
  self->_didFinishExtendedLaunch = a3;
}

- (void)_activateQueuesIfAllowed
{
  if ([(PXPreloadScheduler *)self waitForExtendedLaunch])
  {
    if (![(PXPreloadScheduler *)self didFinishExtendedLaunch])
    {
      dispatch_time_t v3 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__PXPreloadScheduler__activateQueuesIfAllowed__block_invoke;
      block[3] = &unk_1E5DD36F8;
      block[4] = self;
      dispatch_after(v3, MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    [(PXPreloadScheduler *)self _activateQueues];
  }
}

- (BOOL)didFinishExtendedLaunch
{
  return self->_didFinishExtendedLaunch;
}

- (BOOL)waitForExtendedLaunch
{
  return self->_waitForExtendedLaunch;
}

- (void)_activateQueues
{
  dispatch_activate((dispatch_object_t)self->_defaultQueue);
  dispatch_activate((dispatch_object_t)self->_utilityQueue);
  backgroundQueue = self->_backgroundQueue;
  dispatch_activate(backgroundQueue);
}

- (void)scheduleDeferredMainQueueTask:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__PXPreloadScheduler_scheduleDeferredMainQueueTask___block_invoke;
  v6[3] = &unk_1E5DD3280;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PXPreloadScheduler *)self scheduleDeferredTaskWithQoS:2 block:v6];
}

void __37__PXPreloadScheduler_sharedScheduler__block_invoke()
{
  v0 = objc_alloc_init(PXPreloadScheduler);
  v1 = (void *)sharedScheduler_scheduler;
  sharedScheduler_scheduler = (uint64_t)v0;
}

- (PXPreloadScheduler)init
{
  v23.receiver = self;
  v23.super_class = (Class)PXPreloadScheduler;
  id v2 = [(PXPreloadScheduler *)&v23 init];
  if (v2)
  {
    dispatch_time_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    id v4 = dispatch_queue_attr_make_initially_inactive(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.photos.preload-default", v4);
    defaultQueue = v2->_defaultQueue;
    v2->_defaultQueue = (OS_dispatch_queue *)v5;

    id v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v8 = dispatch_queue_attr_make_initially_inactive(v7);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.photos.preload-utility", v8);
    utilityQueue = v2->_utilityQueue;
    v2->_utilityQueue = (OS_dispatch_queue *)v9;

    id v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_block_t v12 = dispatch_queue_attr_make_initially_inactive(v11);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.photos.preload-background", v12);
    backgroundQueue = v2->_backgroundQueue;
    v2->_backgroundQueue = (OS_dispatch_queue *)v13;

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __26__PXPreloadScheduler_init__block_invoke;
    block[3] = &unk_1E5DD36F8;
    unint64_t v15 = v2;
    v22 = v15;
    dispatch_async(MEMORY[0x1E4F14428], block);
    dispatch_group_t v16 = dispatch_group_create();
    pendingUtilityTasks = v15->_pendingUtilityTasks;
    v15->_pendingUtilityTasks = (OS_dispatch_group *)v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingBlocks = v15->_pendingBlocks;
    v15->_pendingBlocks = v18;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_pendingUtilityTasks, 0);
  objc_storeStrong((id *)&self->_backgroundQueue, 0);
  objc_storeStrong((id *)&self->_utilityQueue, 0);
  objc_storeStrong((id *)&self->_defaultQueue, 0);
}

- (BOOL)_isActive
{
  return self->__isActive;
}

uint64_t __56__PXPreloadScheduler_scheduleDeferredTaskWithQoS_block___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) scheduleTaskWithQoS:*(void *)(a1 + 48) block:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _didExecuteTaskWithQoS:v3];
}

uint64_t __52__PXPreloadScheduler_scheduleDeferredMainQueueTask___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleMainQueueTaskAndWait:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  runloopObserver = self->_runloopObserver;
  if (runloopObserver) {
    CFRelease(runloopObserver);
  }
  v4.receiver = self;
  v4.super_class = (Class)PXPreloadScheduler;
  [(PXPreloadScheduler *)&v4 dealloc];
}

uint64_t __46__PXPreloadScheduler__activateQueuesIfAllowed__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateQueues];
}

@end