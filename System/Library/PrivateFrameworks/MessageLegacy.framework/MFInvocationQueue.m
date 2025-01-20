@interface MFInvocationQueue
+ (id)sharedInvocationQueue;
+ (unint64_t)totalInvocationCount;
+ (void)flushAllInvocationQueues;
- (MFInvocationQueue)init;
- (MFInvocationQueue)initWithMaxThreadCount:(unint64_t)a3;
- (double)threadRecycleTimeout;
- (id)copyDiagnosticInformation;
- (int)threadPriorityTrigger;
- (unint64_t)invocationCount;
- (unint64_t)maxThreadCount;
- (unint64_t)threadCount;
- (void)_adjustThreadPrioritiesIsForeground:(BOOL)a3;
- (void)_drainQueue:(id)a3;
- (void)_processInvocation:(id)a3;
- (void)addInvocation:(id)a3;
- (void)applicationWillResume;
- (void)applicationWillSuspend;
- (void)contentProtectionStateChanged:(int)a3 previousState:(int)a4;
- (void)dealloc;
- (void)didCancel:(id)a3;
- (void)removeAllItems;
- (void)setMaxThreadCount:(unint64_t)a3;
- (void)setThreadPriorityTrigger:(int)a3;
- (void)setThreadRecycleTimeout:(double)a3;
@end

@implementation MFInvocationQueue

- (void)addInvocation:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = (void *)[a3 monitor];
    }
    else {
      v5 = 0;
    }
    unint64_t v6 = [v5 priority];
    unint64_t v7 = *(void *)&self->_threadPriorityTrigger;
    [(NSConditionLock *)self->_lock lock];
    NSInteger v8 = [(NSConditionLock *)self->_lock condition];
    NSInteger v9 = v8;
    atomic_fetch_add(&_invocationCount, 1u);
    if (v6 <= v7 || v8 == 1)
    {
      items = self->_items;
      if (!items)
      {
        items = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        self->_items = items;
      }
      uint64_t v12 = [(NSMutableArray *)items count];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = 0;
        while (1)
        {
          v15 = (void *)[(NSMutableArray *)self->_items objectAtIndex:v14];
          objc_opt_class();
          v16 = (objc_opt_isKindOfClass() & 1) != 0 ? (void *)[v15 monitor] : 0;
          if (v6 < [v16 priority]) {
            break;
          }
          if (v13 == ++v14) {
            goto LABEL_20;
          }
        }
        [(NSMutableArray *)self->_items insertObject:a3 atIndex:v14];
      }
      else
      {
LABEL_20:
        [(NSMutableArray *)self->_items addObject:a3];
      }
      if (v9 != 1)
      {
        unint64_t numThreads = self->_numThreads;
        if (numThreads < self->_maxThreads)
        {
          self->_unint64_t numThreads = numThreads + 1;
          [MEMORY[0x1E4F29060] detachNewThreadSelector:sel__drainQueue_ toTarget:self withObject:0];
        }
      }
      lock = self->_lock;
      [(NSConditionLock *)lock unlockWithCondition:2];
    }
    else
    {
      ++self->_numThreads;
      [MEMORY[0x1E4F29060] detachNewThreadSelector:sel__drainQueue_ toTarget:self withObject:a3];
      v10 = self->_lock;
      [(NSConditionLock *)v10 unlock];
    }
  }
}

- (void)_drainQueue:(id)a3
{
  if (!_drainQueue__c) {
    _drainQueue__c = objc_opt_class();
  }
  v5 = (FILE **)MEMORY[0x1E4F143C8];
  do
  {
    if (a3)
    {
      if (_drainQueue__once != -1) {
        dispatch_once(&_drainQueue__once, &__block_literal_global_3);
      }
      id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
      if (_drainQueue__DebugInvocationThreads
        || (double Current = 0.0, objc_msgSend(a3, "mf_shouldLogInvocation")))
      {
        double Current = CFAbsoluteTimeGetCurrent();
        NSInteger v8 = *v5;
        NSInteger v9 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "target"), "description"), "UTF8String");
        Name = sel_getName((SEL)[a3 selector]);
        fprintf(v8, "MFInvocationQueue starting invocation %p [%s %s]\n", a3, v9, Name);
      }
      [(MFInvocationQueue *)self _processInvocation:a3];
      if (_drainQueue__DebugInvocationThreads || objc_msgSend(a3, "mf_shouldLogInvocation"))
      {
        v11 = *v5;
        uint64_t v12 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "target"), "description"), "UTF8String");
        uint64_t v13 = sel_getName((SEL)[a3 selector]);
        CFAbsoluteTime v14 = CFAbsoluteTimeGetCurrent();
        fprintf(v11, "MFInvocationQueue finished invocation %p [%s %s] in %5.5fs\n", a3, v12, v13, v14 - Current);
      }
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        _MFFlushCurrentInvocation();
      }
      atomic_fetch_add(&_invocationCount, 0xFFFFFFFF);
    }
    id v16 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    [(NSConditionLock *)self->_lock lock];
    unint64_t numThreads = self->_numThreads;
    if (numThreads <= self->_maxThreads)
    {
      if (![(NSMutableArray *)self->_items count] && self->_threadRecycleTimeout > 0.0)
      {
        [(NSConditionLock *)self->_lock unlockWithCondition:1];
        v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSinceNow:self->_threadRecycleTimeout];
        if (![(NSConditionLock *)self->_lock lockWhenCondition:2 beforeDate:v18]) {
          [(NSConditionLock *)self->_lock lock];
        }
      }
      if ([(NSMutableArray *)self->_items count])
      {
        a3 = (id)[(NSMutableArray *)self->_items objectAtIndex:0];
        [(NSMutableArray *)self->_items removeObjectAtIndex:0];
        goto LABEL_27;
      }
      a3 = 0;
      unint64_t numThreads = self->_numThreads;
    }
    else
    {
      a3 = 0;
    }
    self->_unint64_t numThreads = numThreads - 1;
LABEL_27:
    [(NSConditionLock *)self->_lock unlockWithCondition:2 * ([(NSMutableArray *)self->_items count] != 0)];
    [v16 drain];
  }
  while (a3);
}

- (MFInvocationQueue)init
{
  return [(MFInvocationQueue *)self initWithMaxThreadCount:1];
}

- (MFInvocationQueue)initWithMaxThreadCount:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MFInvocationQueue;
  v4 = [(MFInvocationQueue *)&v8 init];
  if (v4)
  {
    v4->_lock = (NSConditionLock *)[objc_alloc(MEMORY[0x1E4F734B0]) initWithName:@"InvocationQueue_lock" condition:0 andDelegate:v4];
    if (a3 <= 1) {
      unint64_t v5 = 1;
    }
    else {
      unint64_t v5 = a3;
    }
    v4->_maxThreads = v5;
    *(void *)&v4->_threadPriorityTrigger = 7;
    v4->_threadOverrides = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v4->_isForeground = [(id)MFUserAgent() isForeground];
    if (MFIsMobileMail())
    {
      dispatch_queue_t v6 = dispatch_queue_create("com.apple.message.invocationqueue.keybag", 0);
      v4->_keybagQueue = (OS_dispatch_queue *)v6;
      MFRegisterContentProtectionObserver((uint64_t)v4, (uint64_t)v6);
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F734D0], "sharedController"), "addDiagnosticsGenerator:", v4);
  }
  return v4;
}

+ (id)sharedInvocationQueue
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__MFInvocationQueue_sharedInvocationQueue__block_invoke;
  block[3] = &unk_1E68661B8;
  block[4] = a1;
  if (sharedInvocationQueue_onceToken != -1) {
    dispatch_once(&sharedInvocationQueue_onceToken, block);
  }
  return (id)sharedInvocationQueue_singleton;
}

uint64_t __42__MFInvocationQueue_sharedInvocationQueue__block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(*(Class *)(a1 + 32)) initWithMaxThreadCount:1];
  sharedInvocationQueue_singleton = (uint64_t)v1;
  return [v1 setThreadRecycleTimeout:30.0];
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F734D0], "sharedController"), "removeDiagnosticsGenerator:", self);
  atomic_fetch_add(&_invocationCount, -(int)[(NSMutableArray *)self->_items count]);

  if (MFIsMobileMail())
  {
    MFUnregisterContentProtectionObserver((uint64_t)self);
    dispatch_release((dispatch_object_t)self->_keybagQueue);
  }
  v3.receiver = self;
  v3.super_class = (Class)MFInvocationQueue;
  [(MFInvocationQueue *)&v3 dealloc];
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
  atomic_fetch_add(&_invocationCount, -(int)[(NSMutableArray *)self->_items count]);
  [(NSMutableArray *)self->_items removeAllObjects];
  lock = self->_lock;
  [(NSConditionLock *)lock unlock];
}

- (void)_adjustThreadPrioritiesIsForeground:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__MFInvocationQueue__adjustThreadPrioritiesIsForeground___block_invoke;
  v3[3] = &unk_1E6866638;
  v3[4] = self;
  BOOL v4 = a3;
  _dispatch_sync(v3);
}

uint64_t __57__MFInvocationQueue__adjustThreadPrioritiesIsForeground___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = *(unsigned char *)(a1 + 40);
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = *(void **)(*(void *)(a1 + 32) + 56);
  uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) applyOverrideWhileForeground:*(unsigned __int8 *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (void)_processInvocation:(id)a3
{
  uint64_t v5 = 17;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [a3 isLowPriority];
    if (v6) {
      uint64_t v5 = 25;
    }
    else {
      uint64_t v5 = 17;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  long long v7 = [[_MFInvocationQOSOverride alloc] initWithPthread:pthread_self() desiredQoS:v5 lowPriority:v6];
  int __relative_priority = 0;
  qos_class_t __qos_class = QOS_CLASS_DEFAULT;
  pthread_get_qos_class_np([(_MFInvocationQOSOverride *)v7 pthread], &__qos_class, &__relative_priority);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __40__MFInvocationQueue__processInvocation___block_invoke;
  v9[3] = &unk_1E68661E0;
  v9[4] = self;
  v9[5] = v7;
  _dispatch_sync(v9);
  pthread_set_qos_class_self_np(QOS_CLASS_BACKGROUND, 0);
  [a3 invoke];
  pthread_set_qos_class_self_np(__qos_class, __relative_priority);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__MFInvocationQueue__processInvocation___block_invoke_44;
  v8[3] = &unk_1E68661E0;
  v8[4] = v7;
  v8[5] = self;
  _dispatch_sync(v8);
}

uint64_t __40__MFInvocationQueue__processInvocation___block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  unint64_t v3 = (void *)[*(id *)(*(void *)(a1 + 32) + 56) member:*(void *)(a1 + 40)];
  if (v3)
  {
    uint64_t v4 = v3;
    if ([v3 removeOverride])
    {
      uint64_t v5 = MFLogGeneral();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        __40__MFInvocationQueue__processInvocation___block_invoke_cold_1(v2, v5);
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 56) removeObject:v4];
  }
  [*(id *)(*(void *)(a1 + 32) + 56) addObject:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 40) applyOverrideWhileForeground:*(unsigned __int8 *)(*(void *)(a1 + 32) + 64)];
}

uint64_t __40__MFInvocationQueue__processInvocation___block_invoke_44(uint64_t a1)
{
  [*(id *)(a1 + 32) removeOverride];
  uint64_t v2 = *(void *)(a1 + 32);
  unint64_t v3 = *(void **)(*(void *)(a1 + 40) + 56);
  return [v3 removeObject:v2];
}

uint64_t __33__MFInvocationQueue__drainQueue___block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB18], "standardUserDefaults"), "BOOLForKey:", @"DebugWorkerThreads");
  _drainQueue__DebugInvocationThreads = result;
  return result;
}

+ (unint64_t)totalInvocationCount
{
  return _invocationCount;
}

+ (void)flushAllInvocationQueues
{
  if ([a1 totalInvocationCount])
  {
    double v3 = 0.01;
    do
    {
      uint64_t v4 = (void *)[MEMORY[0x1E4F1CAC0] currentRunLoop];
      objc_msgSend(v4, "runUntilDate:", objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceNow:", v3));
      if (v3 < 1.0) {
        double v3 = v3 + v3;
      }
    }
    while ([a1 totalInvocationCount]);
  }
}

- (void)didCancel:(id)a3
{
  [(NSConditionLock *)self->_lock lock];
  uint64_t v5 = [(NSMutableArray *)self->_items count];
  int v6 = v5;
  if (v5)
  {
    uint64_t v7 = v5 - 1;
    do
    {
      long long v8 = (void *)[(NSMutableArray *)self->_items objectAtIndex:v7];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (id)[v8 monitor] == a3)
      {
        [a3 postActivityStarting];
        [a3 postActivityFinished:v8];
        [(NSMutableArray *)self->_items removeObjectAtIndex:v7];
      }
      --v7;
    }
    while (v7 != -1);
  }
  atomic_fetch_add(&_invocationCount, [(NSMutableArray *)self->_items count] - v6);
  lock = self->_lock;
  [(NSConditionLock *)lock unlock];
}

- (void)applicationWillSuspend
{
}

- (void)applicationWillResume
{
}

- (void)contentProtectionStateChanged:(int)a3 previousState:(int)a4
{
  if (!a3 && a4 != 3)
  {
    v7[7] = v4;
    v7[8] = v5;
    [(MFInvocationQueue *)self _adjustThreadPrioritiesIsForeground:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__MFInvocationQueue_contentProtectionStateChanged_previousState___block_invoke;
    v7[3] = &unk_1E68661B8;
    v7[4] = self;
    _dispatch_sync(v7);
  }
}

uint64_t __65__MFInvocationQueue_contentProtectionStateChanged_previousState___block_invoke(uint64_t a1)
{
  uint64_t result = [(id)MFUserAgent() isForeground];
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = result;
  return result;
}

- (id)copyDiagnosticInformation
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v4 = +[MFInvocationQueue sharedInvocationQueue];
  [v3 appendString:@"\n"];
  if (v4 == self) {
    uint64_t v5 = @"Shared ";
  }
  else {
    uint64_t v5 = &stru_1F265CF90;
  }
  [v3 appendFormat:@"==== %@Invocation Queue <%@: %p> ====\n", v5, objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"number of running threads: %d\n", self->_numThreads);
  [v3 appendString:@"==== Queued ====\n"];
  [(NSConditionLock *)self->_lock lock];
  if ([(NSMutableArray *)self->_items count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    items = self->_items;
    uint64_t v7 = [(NSMutableArray *)items countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(items);
          }
          [v3 appendFormat:@"  %@\n", *(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        uint64_t v8 = [(NSMutableArray *)items countByEnumeratingWithState:&v12 objects:v16 count:16];
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

- (int)threadPriorityTrigger
{
  return *(void *)&self->_threadPriorityTrigger;
}

- (void)setThreadPriorityTrigger:(int)a3
{
  *(void *)&self->_threadPriorityTrigger = *(void *)&a3;
}

- (double)threadRecycleTimeout
{
  return self->_threadRecycleTimeout;
}

- (void)setThreadRecycleTimeout:(double)a3
{
  self->_threadRecycleTimeout = a3;
}

void __40__MFInvocationQueue__processInvocation___block_invoke_cold_1(id *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*a1 pthread];
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1CFCFE000, a2, OS_LOG_TYPE_DEBUG, "processing low pri invocation: qos override already existed for %p, just ending it", (uint8_t *)&v4, 0xCu);
}

@end