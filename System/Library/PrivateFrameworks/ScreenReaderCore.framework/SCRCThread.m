@interface SCRCThread
+ (BOOL)_addThreadToRegisteredThreads:(id)a3 withThreadKey:(id)a4;
+ (BOOL)_removeThreadFromRegisteredThreads:(id)a3 withThreadKey:(id)a4;
+ (double)_performSelector:(SEL)a3 withThreadKey:(id)a4 onTarget:(id)a5 waitTime:(double)a6 cancelMask:(unsigned int)a7 count:(unsigned int)a8 firstObject:(id)a9 moreObjects:(char *)a10;
+ (double)lastStartTimeForKey:(id)a3;
+ (id)activity;
+ (id)currentThreadTaskCache;
+ (id)threadTaskCacheKey;
+ (int64_t)activeThreadCount;
+ (int64_t)defaultThreadPriority;
+ (void)initialize;
+ (void)invalidateForKey:(id)a3;
+ (void)postStopNotification;
+ (void)setDefaultThreadPriority:(int64_t)a3;
- (BOOL)_debug_currentlyRunningOnThisThread;
- (BOOL)_isWaitingForStoppingThread;
- (BOOL)_shouldStop;
- (BOOL)isInvalid;
- (SCRCThread)init;
- (double)_performSelector:(SEL)a3 onTarget:(id)a4 cancelMask:(unsigned int)a5 count:(unsigned int)a6 firstObject:(id)a7 moreObjects:(char *)a8;
- (double)lastStartTime;
- (double)performSelector:(SEL)a3 onTarget:(id)a4 cancelMask:(unsigned int)a5 count:(unsigned int)a6 objects:(id)a7;
- (double)performSelector:(SEL)a3 onTarget:(id)a4 count:(unsigned int)a5 objects:(id)a6;
- (id)_initWithKey:(id)a3 task:(id)a4;
- (id)_key;
- (void)_assignThreadPriority;
- (void)_enqueueImmediateTask:(id)a3 cancelMask:(unsigned int)a4 lastStartTime:(double *)a5;
- (void)_enqueueTask:(id)a3 cancelMask:(unsigned int)a4 lastStartTime:(double *)a5;
- (void)_enqueueWaitingTask:(id)a3 cancelMask:(unsigned int)a4 lastStartTime:(double *)a5;
- (void)_processQueue;
- (void)_processQueueFromTimer;
- (void)_runThread:(id)a3;
- (void)_setIsWaitingForStoppingThread:(BOOL)a3;
- (void)_setKey:(id)a3;
- (void)_setLastStartTime:(double)a3;
- (void)_threadDidStop;
- (void)dealloc;
- (void)setIsInvalid:(BOOL)a3;
@end

@implementation SCRCThread

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F08958]);
    v3 = (void *)_RegistryLock;
    _RegistryLock = (uint64_t)v2;

    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    v5 = (void *)_RegisteredThreads;
    _RegisteredThreads = v4;

    uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
    v7 = (void *)_WaitingForStoppingThreads;
    _WaitingForStoppingThreads = v6;

    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    v9 = (void *)_StoppingThreads;
    _StoppingThreads = v8;

    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    v11 = (void *)_StoppableThreads;
    _StoppableThreads = v10;

    id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
    v13 = (void *)_AvailableThreads;
    _AvailableThreads = (uint64_t)v12;

    id v15 = [MEMORY[0x263EFF910] distantFuture];
    [v15 timeIntervalSinceReferenceDate];
    _DistantFuture = v14;
  }
}

+ (id)activity
{
  return 0;
}

+ (int64_t)activeThreadCount
{
  [(id)_RegistryLock lock];
  int64_t v2 = [(id)_RegisteredThreads count];
  [(id)_RegistryLock unlock];
  return v2;
}

+ (void)setDefaultThreadPriority:(int64_t)a3
{
  __defaultThreadPriority = a3;
}

+ (int64_t)defaultThreadPriority
{
  return __defaultThreadPriority;
}

- (void)_assignThreadPriority
{
  if (__defaultThreadPriority)
  {
    sched_param v5 = 0;
    int v4 = 0;
    int64_t v2 = pthread_self();
    pthread_getschedparam(v2, &v4, &v5);
    v5.sched_priority = 47;
    v3 = pthread_self();
    pthread_setschedparam(v3, 2, &v5);
  }
}

+ (double)_performSelector:(SEL)a3 withThreadKey:(id)a4 onTarget:(id)a5 waitTime:(double)a6 cancelMask:(unsigned int)a7 count:(unsigned int)a8 firstObject:(id)a9 moreObjects:(char *)a10
{
  uint64_t v11 = *(void *)&a8;
  uint64_t v12 = *(void *)&a7;
  id v16 = a4;
  id v17 = a5;
  id v18 = a9;
  if (v16)
  {
    double v28 = 0.0;
    id v19 = +[_SCRCThreadTask newThreadTaskWithTarget:v17 selector:a3 cancelMask:v12 count:v11 firstObject:v18 moreObjects:a10];
    v20 = 0;
    if (a6 >= 0.0)
    {
      v20 = (void *)[objc_alloc(MEMORY[0x263F08748]) initWithCondition:0];
      [v19 setWaitLock:v20];
    }
    [(id)_RegistryLock lock];
    v21 = [(id)_RegisteredThreads objectForKeyedSubscript:v16];
    if (!v21)
    {
      v22 = [(id)_StoppingThreads objectForKey:v16];

      if (!v22
        || ([(id)_WaitingForStoppingThreads objectForKey:v16],
            (v21 = (unsigned char *)objc_claimAutoreleasedReturnValue()) == 0)
        && (v21 = [[SCRCThread alloc] _initWithKey:v16 task:v19],
            [v21 _setIsWaitingForStoppingThread:1],
            [(id)_WaitingForStoppingThreads setObject:v21 forKeyedSubscript:v16],
            !v21))
      {
        uint64_t v23 = [(id)_AvailableThreads count];
        if (v23)
        {
          uint64_t v24 = v23 - 1;
          v21 = [(id)_AvailableThreads objectAtIndexedSubscript:v23 - 1];
          [v21 _setKey:v16];
          [(id)_AvailableThreads removeObjectAtIndex:v24];
        }
        else
        {
          v21 = [[SCRCThread alloc] _initWithKey:v16 task:v19];

          id v19 = 0;
        }
        [(id)_RegisteredThreads setObject:v21 forKey:v16];
        v21[49] = 1;
      }
    }
    if (v19) {
      [v21 _enqueueTask:v19 cancelMask:v12 lastStartTime:&v28];
    }

    [(id)_RegistryLock unlock];
    if (v20)
    {
      if (a6 == 0.0)
      {
        [v20 lockWhenCondition:1];
        [v20 unlock];
      }
      else
      {
        v26 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSinceNow:a6];
        if ([v20 lockWhenCondition:1 beforeDate:v26]) {
          [v20 unlock];
        }
      }
    }
    double v25 = v28;
  }
  else
  {
    double v25 = 0.0;
  }

  return v25;
}

+ (double)lastStartTimeForKey:(id)a3
{
  if (!a3) {
    return 0.0;
  }
  v3 = (void *)_RegistryLock;
  id v4 = a3;
  [v3 lock];
  sched_param v5 = [(id)_RegisteredThreads objectForKeyedSubscript:v4];

  [(id)_RegistryLock unlock];
  if (v5)
  {
    [v5 lastStartTime];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
  }

  return v7;
}

+ (void)invalidateForKey:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    [(id)_RegistryLock lock];
    id v4 = [(id)_RegisteredThreads objectForKeyedSubscript:v5];
    if (v4)
    {
      [(id)_RegisteredThreads removeObjectForKey:v5];
      [(id)_StoppableThreads removeObject:v4];
      [(id)_RegistryLock unlock];
      [v4 setIsInvalid:1];
      v4[49] = 0;
    }
    else
    {
      [(id)_RegistryLock unlock];
    }

    id v3 = v5;
  }
}

+ (void)postStopNotification
{
  [(id)_RegistryLock lock];
  [(id)_StoppableThreads enumerateObjectsUsingBlock:&__block_literal_global_7];
  [(id)_StoppableThreads removeAllObjects];
  int64_t v2 = (void *)_RegistryLock;
  [v2 unlock];
}

void __34__SCRCThread_postStopNotification__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = a2;
  [v10 setIsInvalid:1];
  v10[49] = 0;
  v10[51] = 1;
  int64_t v2 = [v10 _key];

  if (v2)
  {
    id v3 = (void *)_RegisteredThreads;
    id v4 = [v10 _key];
    id v5 = [v3 objectForKey:v4];

    if (v5)
    {
      double v6 = (void *)_StoppingThreads;
      double v7 = [v10 _key];
      [v6 setObject:v10 forKeyedSubscript:v7];

      uint64_t v8 = (void *)_RegisteredThreads;
      v9 = [v10 _key];
      [v8 removeObjectForKey:v9];
    }
  }
}

- (SCRCThread)init
{
  return (SCRCThread *)[(SCRCThread *)self _initWithKey:0 task:0];
}

- (id)_initWithKey:(id)a3 task:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SCRCThread;
  v9 = [(SCRCThread *)&v18 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->__key, a3);
    id v11 = objc_alloc_init(MEMORY[0x263F08958]);
    id queueLock = v10->_queueLock;
    v10->_id queueLock = v11;

    v13 = objc_alloc_init(SCRCStackQueue);
    queue = v10->_queue;
    v10->_queue = v13;

    id v15 = objc_alloc_init(SCRCStackQueue);
    waitingQueue = v10->_waitingQueue;
    v10->_waitingQueue = v15;

    [MEMORY[0x263F08B88] detachNewThreadSelector:sel__runThread_ toTarget:v10 withObject:v8];
  }

  return v10;
}

- (void)_setKey:(id)a3
{
}

- (void)_runThread:(id)a3
{
  id v4 = a3;
  [(SCRCThread *)self _assignThreadPriority];
  Current = CFRunLoopGetCurrent();
  double v6 = [MEMORY[0x263F08B88] currentThread];
  id v7 = [v6 threadDictionary];
  [v7 setObject:self forKey:@"SCRCThreadKey"];
  id v8 = objc_opt_new();
  [v7 setObject:v8 forKey:@"SCRCThreadCache"];
  [v4 fire];
  [v7 removeObjectForKey:@"SCRCThreadCache"];
  v10.version = 0;
  memset(&v10.retain, 0, 56);
  v10.info = self;
  v10.perform = (void (__cdecl *)(void *))_handler_0;
  v9 = CFRunLoopSourceCreate(0, 0, &v10);
  CFRunLoopAddSource(Current, v9, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
  CFRunLoopSourceSignal(v9);
  [self->_queueLock lock];
  self->_source = v9;
  self->_runLoop = Current;
  [self->_queueLock unlock];
  if (![(SCRCThread *)self isInvalid])
  {
    do
      CFRunLoopRunSpecific();
    while (![(SCRCThread *)self isInvalid]);
  }
  [(SCRCThread *)self _threadDidStop];
}

- (BOOL)_debug_currentlyRunningOnThisThread
{
  runLoop = self->_runLoop;
  return runLoop == CFRunLoopGetCurrent();
}

- (void)_threadDidStop
{
  if (self->_shouldStop)
  {
    [(id)_RegistryLock lock];
    [(id)_StoppingThreads removeObjectForKey:self->__key];
    id v3 = [(id)_WaitingForStoppingThreads objectForKeyedSubscript:self->__key];
    if (v3)
    {
      [(id)_RegisteredThreads setObject:v3 forKeyedSubscript:self->__key];
      [(id)_WaitingForStoppingThreads removeObjectForKey:self->__key];
      v3[49] = 1;
      [v3 _setIsWaitingForStoppingThread:0];
    }
    [(id)_RegistryLock unlock];
  }
}

- (void)dealloc
{
  [self->_queueLock lock];
  id v3 = self->_queue;
  queue = self->_queue;
  self->_queue = 0;

  id v5 = self->_waitingQueue;
  waitingQueue = self->_waitingQueue;
  self->_waitingQueue = 0;

  id queueLock = self->_queueLock;
  source = self->_source;
  self->_source = 0;
  self->_isInvalid = 1;
  id v9 = queueLock;
  id v10 = self->_queueLock;
  self->_id queueLock = 0;

  [v9 unlock];
  if (source) {
    CFRelease(source);
  }

  v11.receiver = self;
  v11.super_class = (Class)SCRCThread;
  [(SCRCThread *)&v11 dealloc];
}

- (double)_performSelector:(SEL)a3 onTarget:(id)a4 cancelMask:(unsigned int)a5 count:(unsigned int)a6 firstObject:(id)a7 moreObjects:(char *)a8
{
  uint64_t v8 = *(void *)&a5;
  double v13 = 0.0;
  id v10 = +[_SCRCThreadTask newThreadTaskWithTarget:a4 selector:a3 cancelMask:*(void *)&a5 count:*(void *)&a6 firstObject:a7 moreObjects:a8];
  [(SCRCThread *)self _enqueueTask:v10 cancelMask:v8 lastStartTime:&v13];
  double v11 = v13;

  return v11;
}

- (double)performSelector:(SEL)a3 onTarget:(id)a4 count:(unsigned int)a5 objects:(id)a6
{
  [(SCRCThread *)self _performSelector:a3 onTarget:a4 cancelMask:0 count:*(void *)&a5 firstObject:a6 moreObjects:&v7];
  return result;
}

- (double)performSelector:(SEL)a3 onTarget:(id)a4 cancelMask:(unsigned int)a5 count:(unsigned int)a6 objects:(id)a7
{
  [(SCRCThread *)self _performSelector:a3 onTarget:a4 cancelMask:*(void *)&a5 count:*(void *)&a6 firstObject:a7 moreObjects:&v8];
  return result;
}

- (void)setIsInvalid:(BOOL)a3
{
  BOOL v3 = a3;
  [self->_queueLock lock];
  self->_isInvalid = v3;
  if (v3)
  {
    id v9 = self->_queue;
    queue = self->_queue;
    self->_queue = 0;

    double v6 = self->_waitingQueue;
    waitingQueue = self->_waitingQueue;
    self->_waitingQueue = 0;

    self->_lastStartTime = -3061152000.0;
    runLoop = self->_runLoop;
    if (runLoop) {
      CFRunLoopStop(runLoop);
    }
  }
  else
  {
    id v9 = 0;
    double v6 = 0;
  }
  [self->_queueLock unlock];
}

- (BOOL)_shouldStop
{
  return self->_shouldStop;
}

- (BOOL)isInvalid
{
  return self->_isInvalid;
}

- (void)_setIsWaitingForStoppingThread:(BOOL)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  self->_isWaitingForStoppingThread = a3;
  if (!a3)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    [self->_queueLock lock];
    while ([(SCRCStackQueue *)self->_waitingQueue count])
    {
      id v5 = [(SCRCStackQueue *)self->_waitingQueue dequeueObjectRetained];
      double v6 = (void *)MEMORY[0x21D4A07D0]();
      [v4 addObject:v6];
    }
    [self->_queueLock unlock];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (BOOL)_isWaitingForStoppingThread
{
  return self->_isWaitingForStoppingThread;
}

- (double)lastStartTime
{
  [self->_queueLock lock];
  double lastStartTime = self->_lastStartTime;
  [self->_queueLock unlock];
  double result = 0.0;
  if (lastStartTime != -3061152000.0) {
    return lastStartTime;
  }
  return result;
}

- (void)_enqueueWaitingTask:(id)a3 cancelMask:(unsigned int)a4 lastStartTime:(double *)a5
{
  id v8 = a3;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__0;
  v22[4] = __Block_byref_object_dispose__0;
  uint64_t v9 = self;
  uint64_t v23 = v9;
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  id v16 = __59__SCRCThread__enqueueWaitingTask_cancelMask_lastStartTime___block_invoke;
  uint64_t v17 = &unk_2643D72A0;
  id v19 = v22;
  id v10 = v8;
  unsigned int v21 = a4;
  id v18 = v10;
  v20 = a5;
  uint64_t v11 = (void *)MEMORY[0x21D4A07D0](&v14);
  objc_msgSend(v9->_queueLock, "lock", v14, v15, v16, v17);
  waitingQueue = v9->_waitingQueue;
  long long v13 = (void *)MEMORY[0x21D4A07D0](v11);
  [(SCRCStackQueue *)waitingQueue enqueueObject:v13];

  [v9->_queueLock unlock];
  _Block_object_dispose(v22, 8);
}

uint64_t __59__SCRCThread__enqueueWaitingTask_cancelMask_lastStartTime___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) _enqueueImmediateTask:*(void *)(a1 + 32) cancelMask:*(unsigned int *)(a1 + 56) lastStartTime:*(void *)(a1 + 48)];
}

- (void)_enqueueImmediateTask:(id)a3 cancelMask:(unsigned int)a4 lastStartTime:(double *)a5
{
  id v17 = a3;
  [self->_queueLock lock];
  if (self->_isInvalid || self->_shouldStop)
  {
    [self->_queueLock unlock];
  }
  else
  {
    if (a4 && ![(SCRCStackQueue *)self->_queue isEmpty])
    {
      queue = self->_queue;
      if (a4 == -1)
      {
        [(SCRCStackQueue *)queue removeAllObjects];
      }
      else
      {
        uint64_t v9 = [(SCRCStackQueue *)queue objectEnumerator];
        uint64_t v10 = [v9 nextObject];
        if (v10)
        {
          uint64_t v11 = v10;
          do
          {
            if ((*(_DWORD *)(v11 + 32) & a4) != 0)
            {
              long long v12 = *(void **)(v11 + 8);
              *(void *)(v11 + 8) = 0;
            }
            uint64_t v13 = [v9 nextObject];

            uint64_t v11 = v13;
          }
          while (v13);
        }
      }
    }
    [(SCRCStackQueue *)self->_queue enqueueObject:v17];
    runLoop = self->_runLoop;
    double lastStartTime = self->_lastStartTime;
    if (lastStartTime == -3061152000.0) {
      double lastStartTime = 0.0;
    }
    *a5 = lastStartTime;
    source = self->_source;
    [self->_queueLock unlock];
    if (source) {
      CFRunLoopSourceSignal(source);
    }
    if (runLoop) {
      CFRunLoopWakeUp(runLoop);
    }
  }
}

- (void)_enqueueTask:(id)a3 cancelMask:(unsigned int)a4 lastStartTime:(double *)a5
{
  if (self->_isWaitingForStoppingThread) {
    [(SCRCThread *)self _enqueueWaitingTask:a3 cancelMask:*(void *)&a4 lastStartTime:a5];
  }
  else {
    [(SCRCThread *)self _enqueueImmediateTask:a3 cancelMask:*(void *)&a4 lastStartTime:a5];
  }
}

- (void)_processQueueFromTimer
{
  self->_isTimerSet = 0;
  [(SCRCThread *)self _processQueue];
}

- (void)_processQueue
{
  [self->_queueLock lock];
  if (!self->_isInvalid)
  {
    while (1)
    {
      BOOL v3 = [(SCRCStackQueue *)self->_queue dequeueObjectRetained];
      if (!v3) {
        break;
      }
      id v4 = v3;
      self->_double lastStartTime = CFAbsoluteTimeGetCurrent();
      [self->_queueLock unlock];
      id v5 = (objc_class *)objc_opt_class();
      if (v4[2]) {
        double v6 = (const char *)v4[2];
      }
      else {
        double v6 = 0;
      }
      if (_appendInfoToRecentTaskBuffer__recentTaskOnceToken != -1) {
        dispatch_once(&_appendInfoToRecentTaskBuffer__recentTaskOnceToken, &__block_literal_global_173);
      }
      Name = class_getName(v5);
      size_t v8 = strlen(Name);
      uint64_t v9 = sel_getName(v6);
      size_t v10 = strlen(v9);
      unint64_t v11 = v8 + v10 + 4;
      unint64_t add = atomic_fetch_add(&_appendInfoToRecentTaskBuffer__recentTaskBufferOffset, v11);
      if (add + v11 < 0x258
        || (unint64_t add = 0,
            atomic_store(0, (unint64_t *)&_appendInfoToRecentTaskBuffer__recentTaskBufferOffset),
            v11 <= 0x257))
      {
        unint64_t v13 = _appendInfoToRecentTaskBuffer__recentTaskBuffer + add;
        *(_WORD *)unint64_t v13 = 91;
        uint64_t v14 = &strncpy((char *)(v13 + 1), Name, v8)[v8];
        *(_WORD *)uint64_t v14 = 32;
        strcpy(&strncpy(v14 + 1, v9, v10)[v10], "]\n");
      }
      uint64_t v15 = objc_opt_new();
      id v16 = [MEMORY[0x263F08B88] currentThread];
      id v17 = [v16 threadDictionary];

      [v17 setObject:v15 forKey:@"SCRCThreadCache"];
      [v4 fire];
      [v17 removeObjectForKey:@"SCRCThreadCache"];

      [self->_queueLock lock];
      if (self->_isInvalid) {
        goto LABEL_14;
      }
    }
    self->_double lastStartTime = -3061152000.0;
  }
LABEL_14:
  [self->_queueLock unlock];
  [(id)_RegistryLock lock];
  if (self->_isRegistered && [(SCRCStackQueue *)self->_queue isEmpty])
  {
    double NextTimerFireDate = CFRunLoopGetNextTimerFireDate(self->_runLoop, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    if (NextTimerFireDate > 0.0
      && (double v19 = NextTimerFireDate, Current = CFAbsoluteTimeGetCurrent(), v19 < Current + 31536000.0))
    {
      if (!self->_isTimerSet)
      {
        double v21 = v19 + 1.0 - Current;
        if (v21 < 0.1) {
          double v21 = 0.1;
        }
        [(SCRCThread *)self performSelector:sel__processQueueFromTimer withObject:0 afterDelay:v21];
        self->_isTimerSet = 1;
      }
    }
    else
    {
      if (!self->_isInvalid)
      {
        if ((unint64_t)[(id)_AvailableThreads count] > 5) {
          [(SCRCThread *)self setIsInvalid:1];
        }
        else {
          [(id)_AvailableThreads addObject:self];
        }
      }
      [(id)_RegisteredThreads removeObjectForKey:self->__key];
      [(id)_StoppableThreads removeObject:self];
      self->_isRegistered = 0;
    }
  }
  v22 = (void *)_RegistryLock;
  [v22 unlock];
}

+ (id)currentThreadTaskCache
{
  int64_t v2 = [MEMORY[0x263F08B88] currentThread];
  BOOL v3 = [v2 threadDictionary];

  id v4 = [v3 objectForKey:@"SCRCThreadCache"];

  return v4;
}

+ (id)threadTaskCacheKey
{
  return @"SCRCThreadCache";
}

- (void)_setLastStartTime:(double)a3
{
  self->_double lastStartTime = a3;
}

- (id)_key
{
  return self->__key;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__key, 0);
  objc_storeStrong(&self->_queueLock, 0);
  objc_storeStrong((id *)&self->_waitingQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (BOOL)_addThreadToRegisteredThreads:(id)a3 withThreadKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6
    && ([(id)_RegisteredThreads objectForKey:v6],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    [(id)_RegisteredThreads setObject:v5 forKeyedSubscript:v6];
    BOOL v8 = 1;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

+ (BOOL)_removeThreadFromRegisteredThreads:(id)a3 withThreadKey:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = [(id)_RegisteredThreads objectForKey:v6];

    if (v7)
    {
      [(id)_RegisteredThreads removeObjectForKey:v6];
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return (char)v7;
}

@end