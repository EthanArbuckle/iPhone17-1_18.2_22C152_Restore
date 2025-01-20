@interface MFInvocationQueue
+ (id)sharedInvocationQueue;
+ (void)flushAllInvocationQueues;
- (MFInvocationQueue)init;
- (MFInvocationQueue)initWithMaxThreadCount:(unint64_t)a3;
- (double)threadRecycleTimeout;
- (id)copyDiagnosticInformation;
- (unint64_t)invocationCount;
- (unint64_t)maxThreadCount;
- (unint64_t)threadCount;
- (unint64_t)threadPriorityTrigger;
- (void)_drainQueue:(id)a3;
- (void)addInvocation:(id)a3;
- (void)dealloc;
- (void)didCancel:(id)a3;
- (void)removeAllItems;
- (void)setMaxThreadCount:(unint64_t)a3;
- (void)setThreadPriorityTrigger:(unint64_t)a3;
- (void)setThreadRecycleTimeout:(double)a3;
@end

@implementation MFInvocationQueue

void __33__MFInvocationQueue__drainQueue___block_invoke()
{
  id v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  _drainQueue__DebugInvocationThreads = [v0 BOOLForKey:@"DebugWorkerThreads"];
}

- (void)addInvocation:(id)a3
{
  id v20 = a3;
  if (v20)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v4 = [v20 monitor];
    }
    else
    {
      v4 = 0;
    }
    unint64_t v5 = [v4 priority];
    unint64_t threadPriorityTrigger = self->_threadPriorityTrigger;
    [(NSConditionLock *)self->_lock lock];
    NSInteger v7 = [(NSConditionLock *)self->_lock condition];
    NSInteger v8 = v7;
    atomic_fetch_add(_invocationCount, 1u);
    if (v5 <= threadPriorityTrigger || v7 == 1)
    {
      items = self->_items;
      if (!items)
      {
        v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v12 = self->_items;
        self->_items = v11;

        items = self->_items;
      }
      uint64_t v13 = [(NSMutableArray *)items count];
      if (v13)
      {
        uint64_t v14 = 0;
        v15 = v4;
        while (1)
        {
          v16 = [(NSMutableArray *)self->_items objectAtIndex:v14];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v4 = [v16 monitor];
          }
          else
          {
            v4 = 0;
          }

          unint64_t v17 = [v4 priority];
          if (v5 < v17) {
            break;
          }
          ++v14;
          v15 = v4;
          if (v13 == v14) {
            goto LABEL_17;
          }
        }
        [(NSMutableArray *)self->_items insertObject:v20 atIndex:v14];
      }
      else
      {
LABEL_17:
        [(NSMutableArray *)self->_items addObject:v20];
      }
      if (v8 != 1)
      {
        unint64_t numThreads = self->_numThreads;
        if (numThreads < self->_maxThreads)
        {
          self->_unint64_t numThreads = numThreads + 1;
          v19 = (void *)[objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:self selector:sel__drainQueue_ object:0];
          [v19 setQualityOfService:17];
          [v19 start];
        }
      }
      [(NSConditionLock *)self->_lock unlockWithCondition:2];
    }
    else
    {
      ++self->_numThreads;
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:self selector:sel__drainQueue_ object:v20];
      [v9 setQualityOfService:17];
      [v9 start];
      [(NSConditionLock *)self->_lock unlock];
    }
  }
}

+ (id)sharedInvocationQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MFInvocationQueue_sharedInvocationQueue__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInvocationQueue_onceToken != -1) {
    dispatch_once(&sharedInvocationQueue_onceToken, block);
  }
  v2 = (void *)sharedInvocationQueue_singleton;
  return v2;
}

- (void)setThreadRecycleTimeout:(double)a3
{
  self->_threadRecycleTimeout = a3;
}

- (MFInvocationQueue)init
{
  return [(MFInvocationQueue *)self initWithMaxThreadCount:1];
}

uint64_t __42__MFInvocationQueue_sharedInvocationQueue__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithMaxThreadCount:1];
  v2 = (void *)sharedInvocationQueue_singleton;
  sharedInvocationQueue_singleton = v1;

  v3 = (void *)sharedInvocationQueue_singleton;
  return [v3 setThreadRecycleTimeout:30.0];
}

- (MFInvocationQueue)initWithMaxThreadCount:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MFInvocationQueue;
  v4 = [(MFInvocationQueue *)&v10 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F734B0]) initWithName:@"InvocationQueue_lock" condition:0 andDelegate:v4];
    lock = v4->_lock;
    v4->_lock = (NSConditionLock *)v5;

    if (a3 <= 1) {
      unint64_t v7 = 1;
    }
    else {
      unint64_t v7 = a3;
    }
    v4->_maxThreads = v7;
    v4->_unint64_t threadPriorityTrigger = 7;
    NSInteger v8 = [MEMORY[0x1E4F734D0] sharedController];
    [v8 addDiagnosticsGenerator:v4];
  }
  return v4;
}

- (void)_drainQueue:(id)a3
{
  id v4 = a3;
  if (!_drainQueue__c) {
    _drainQueue__c = objc_opt_class();
  }
  uint64_t v5 = (FILE **)MEMORY[0x1E4F143C8];
  do
  {
    if (v4)
    {
      if (_drainQueue__once != -1) {
        dispatch_once(&_drainQueue__once, &__block_literal_global_9);
      }
      v6 = (void *)MEMORY[0x1AD0E3E00]();
      if (_drainQueue__DebugInvocationThreads
        || (double Current = 0.0, objc_msgSend(v4, "mf_shouldLogInvocation")))
      {
        double Current = CFAbsoluteTimeGetCurrent();
        NSInteger v8 = *v5;
        v9 = [v4 target];
        id v10 = [v9 description];
        v11 = (const char *)[v10 UTF8String];
        Name = sel_getName((SEL)[v4 selector]);
        fprintf(v8, "MFInvocationQueue starting invocation %p [%s %s]\n", v4, v11, Name);
      }
      [v4 invoke];
      if (_drainQueue__DebugInvocationThreads || objc_msgSend(v4, "mf_shouldLogInvocation"))
      {
        uint64_t v13 = *v5;
        uint64_t v14 = [v4 target];
        id v15 = [v14 description];
        v16 = (const char *)[v15 UTF8String];
        unint64_t v17 = sel_getName((SEL)[v4 selector]);
        CFAbsoluteTime v18 = CFAbsoluteTimeGetCurrent();
        fprintf(v13, "MFInvocationQueue finished invocation %p [%s %s] in %5.5fs\n", v4, v16, v17, v18 - Current);
      }
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        _MFFlushCurrentInvocation();
      }
      atomic_fetch_add(_invocationCount, 0xFFFFFFFF);
    }
    id v20 = (void *)MEMORY[0x1AD0E3E00]();
    [(NSConditionLock *)self->_lock lock];
    if (self->_numThreads > self->_maxThreads) {
      goto LABEL_24;
    }
    if (![(NSMutableArray *)self->_items count] && self->_threadRecycleTimeout > 0.0)
    {
      [(NSConditionLock *)self->_lock unlockWithCondition:1];
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:self->_threadRecycleTimeout];
      if (![(NSConditionLock *)self->_lock lockWhenCondition:2 beforeDate:v21]) {
        [(NSConditionLock *)self->_lock lock];
      }
    }
    if ([(NSMutableArray *)self->_items count])
    {
      id v4 = [(NSMutableArray *)self->_items objectAtIndexedSubscript:0];
      [(NSMutableArray *)self->_items removeObjectAtIndex:0];
    }
    else
    {
LABEL_24:
      id v4 = 0;
      --self->_numThreads;
    }
    [(NSConditionLock *)self->_lock unlockWithCondition:2 * ([(NSMutableArray *)self->_items count] != 0)];
  }
  while (v4);
}

- (void)setMaxThreadCount:(unint64_t)a3
{
  if (a3 <= 1) {
    unint64_t v3 = 1;
  }
  else {
    unint64_t v3 = a3;
  }
  self->_maxThreads = v3;
}

- (void)dealloc
{
  atomic_fetch_add(_invocationCount, -(int)[(NSMutableArray *)self->_items count]);
  v3.receiver = self;
  v3.super_class = (Class)MFInvocationQueue;
  [(MFInvocationQueue *)&v3 dealloc];
}

- (unint64_t)maxThreadCount
{
  return self->_maxThreads;
}

- (unint64_t)invocationCount
{
  [(NSConditionLock *)self->_lock lock];
  unint64_t v3 = [(NSMutableArray *)self->_items count];
  if ([(NSConditionLock *)self->_lock condition] != 1) {
    v3 += self->_numThreads;
  }
  [(NSConditionLock *)self->_lock unlock];
  return v3;
}

- (void)removeAllItems
{
  [(NSConditionLock *)self->_lock lock];
  atomic_fetch_add(_invocationCount, -(int)[(NSMutableArray *)self->_items count]);
  [(NSMutableArray *)self->_items removeAllObjects];
  lock = self->_lock;
  [(NSConditionLock *)lock unlock];
}

+ (void)flushAllInvocationQueues
{
  int v2 = 0;
  atomic_compare_exchange_strong(_invocationCount, (unsigned int *)&v2, 0);
  if (v2)
  {
    double v3 = 0.01;
    do
    {
      id v4 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
      uint64_t v5 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v3];
      [v4 runUntilDate:v5];

      int v6 = 0;
      if (v3 < 1.0) {
        double v3 = v3 + v3;
      }
      atomic_compare_exchange_strong(_invocationCount, (unsigned int *)&v6, 0);
    }
    while (v6);
  }
}

- (void)didCancel:(id)a3
{
  id v9 = a3;
  [(NSConditionLock *)self->_lock lock];
  uint64_t v4 = [(NSMutableArray *)self->_items count];
  int v5 = v4;
  if (v4)
  {
    uint64_t v6 = v4 - 1;
    do
    {
      unint64_t v7 = [(NSMutableArray *)self->_items objectAtIndex:v6];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = [v7 monitor];

        if (v8 == v9)
        {
          [v9 postActivityStarting];
          [v9 postActivityFinished:v7];
          [(NSMutableArray *)self->_items removeObjectAtIndex:v6];
        }
      }

      --v6;
    }
    while (v6 != -1);
  }
  atomic_fetch_add(_invocationCount, [(NSMutableArray *)self->_items count] - v5);
  [(NSConditionLock *)self->_lock unlock];
}

- (id)copyDiagnosticInformation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = +[MFInvocationQueue sharedInvocationQueue];

  [v3 appendString:@"\n"];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = &stru_1EFF11268;
  if (v4 == self) {
    uint64_t v6 = @"Shared ";
  }
  [v3 appendFormat:@"==== %@Invocation Queue <%@: %p> ====\n", v6, v5, self];
  objc_msgSend(v3, "appendFormat:", @"number of running threads: %d\n", self->_numThreads);
  [v3 appendString:@"==== Queued ====\n"];
  [(NSConditionLock *)self->_lock lock];
  if ([(NSMutableArray *)self->_items count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    unint64_t v7 = self->_items;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v7);
          }
          [v3 appendFormat:@"  %@\n", *(void *)(*((void *)&v12 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
  else
  {
    [v3 appendFormat:@"(empty)\n"];
  }
  [(NSConditionLock *)self->_lock unlock];
  return v3;
}

- (unint64_t)threadCount
{
  return self->_numThreads;
}

- (unint64_t)threadPriorityTrigger
{
  return self->_threadPriorityTrigger;
}

- (void)setThreadPriorityTrigger:(unint64_t)a3
{
  self->_unint64_t threadPriorityTrigger = a3;
}

- (double)threadRecycleTimeout
{
  return self->_threadRecycleTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end