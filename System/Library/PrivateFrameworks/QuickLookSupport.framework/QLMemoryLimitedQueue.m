@interface QLMemoryLimitedQueue
- (QLMemoryLimitedQueue)initWithMaximumMemoryConsumption:(unint64_t)a3 maximumConcurrentTasks:(int)a4;
- (int)currentTaskCount;
- (unint64_t)currentSize;
- (void)addTask:(id)a3;
- (void)dequeueIfPossible;
- (void)executeTask:(id)a3;
@end

@implementation QLMemoryLimitedQueue

- (QLMemoryLimitedQueue)initWithMaximumMemoryConsumption:(unint64_t)a3 maximumConcurrentTasks:(int)a4
{
  v17.receiver = self;
  v17.super_class = (Class)QLMemoryLimitedQueue;
  v6 = [(QLMemoryLimitedQueue *)&v17 init];
  v7 = v6;
  if (v6)
  {
    v6->_maxSize = a3;
    v6->_currentTaskCount = 0;
    v6->_maxTaskCount = a4;
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.quicklook.memorylimitedqueue.serial", v8);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.quicklook.memorylimitedqueue.concurrent", v11);
    concurrentQueue = v7->_concurrentQueue;
    v7->_concurrentQueue = (OS_dispatch_queue *)v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    tasks = v7->_tasks;
    v7->_tasks = v14;
  }
  return v7;
}

- (void)addTask:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __32__QLMemoryLimitedQueue_addTask___block_invoke;
  v7[3] = &unk_2642F2250;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(serialQueue, v7);
}

uint64_t __32__QLMemoryLimitedQueue_addTask___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 dequeueIfPossible];
}

- (void)executeTask:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  uint64_t v5 = [v4 expectedMemoryConsumption];
  int currentTaskCount = self->_currentTaskCount;
  self->_currentSize += v5;
  self->_int currentTaskCount = currentTaskCount + 1;
  uint64_t v7 = MEMORY[0x263F16100];
  id v8 = *(NSObject **)(MEMORY[0x263F16100] + 112);
  if (!v8)
  {
    QLTInitLogging();
    id v8 = *(NSObject **)(v7 + 112);
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    [(QLMemoryLimitedQueue *)&self->_currentTaskCount executeTask:v8];
  }
  concurrentQueue = self->_concurrentQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __36__QLMemoryLimitedQueue_executeTask___block_invoke;
  v11[3] = &unk_2642F2250;
  id v12 = v4;
  v13 = self;
  id v10 = v4;
  dispatch_async(concurrentQueue, v11);
}

void __36__QLMemoryLimitedQueue_executeTask___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) block];
  v2[2]();

  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = *(NSObject **)(v3 + 40);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__QLMemoryLimitedQueue_executeTask___block_invoke_2;
  v5[3] = &unk_2642F2250;
  v5[4] = v3;
  id v6 = *(id *)(a1 + 32);
  dispatch_async(v4, v5);
}

uint64_t __36__QLMemoryLimitedQueue_executeTask___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) -= [*(id *)(a1 + 40) expectedMemoryConsumption];
  --*(_DWORD *)(*(void *)(a1 + 32) + 24);
  v2 = *(void **)(a1 + 32);
  return [v2 dequeueIfPossible];
}

- (void)dequeueIfPossible
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  if (self->_currentTaskCount < self->_maxTaskCount && [(NSMutableArray *)self->_tasks count])
  {
    uint64_t v3 = 0;
    int v4 = 0;
    do
    {
      if (self->_currentTaskCount >= self->_maxTaskCount) {
        break;
      }
      uint64_t v5 = [(NSMutableArray *)self->_tasks objectAtIndex:v3];
      unint64_t currentSize = self->_currentSize;
      uint64_t v7 = [v5 expectedMemoryConsumption];
      unint64_t maxSize = self->_maxSize;
      BOOL v9 = [v5 expectedMemoryConsumption] > maxSize && self->_currentTaskCount == 0;
      if (v7 + currentSize >= maxSize && !v9)
      {
        ++v4;
      }
      else
      {
        [(QLMemoryLimitedQueue *)self executeTask:v5];
        [(NSMutableArray *)self->_tasks removeObjectAtIndex:v3];
      }

      uint64_t v3 = v4;
    }
    while ([(NSMutableArray *)self->_tasks count] > (unint64_t)v4);
  }
}

- (int)currentTaskCount
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__QLMemoryLimitedQueue_currentTaskCount__block_invoke;
  v5[3] = &unk_2642F2498;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__QLMemoryLimitedQueue_currentTaskCount__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 24);
  return result;
}

- (unint64_t)currentSize
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__QLMemoryLimitedQueue_currentSize__block_invoke;
  v5[3] = &unk_2642F2498;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__QLMemoryLimitedQueue_currentSize__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
}

- (void)executeTask:(os_log_t)log .cold.1(int *a1, uint64_t *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  uint64_t v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 2048;
  uint64_t v7 = v4;
  _os_log_debug_impl(&dword_217F31000, log, OS_LOG_TYPE_DEBUG, "Executing task, tasks in flight: %d, budget in flight: %zu bytes", (uint8_t *)v5, 0x12u);
}

@end