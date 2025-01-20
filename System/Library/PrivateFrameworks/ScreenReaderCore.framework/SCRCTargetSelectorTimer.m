@interface SCRCTargetSelectorTimer
+ (void)_assignThreadPriority;
+ (void)_runThread;
+ (void)initialize;
- (BOOL)_createdTimer;
- (BOOL)isCanceled;
- (BOOL)isCancelled;
- (BOOL)isPending;
- (SCRCTargetSelectorTimer)initWithTarget:(id)a3 selector:(SEL)a4;
- (id)_initWithTarget:(id)a3 selector:(SEL)a4 threadKeyOrThread:(id)a5;
- (id)threadKey;
- (void)_dispatch;
- (void)_dispatchMainThread;
- (void)_dispatchSCRCThread;
- (void)_dispatchThreadHelper:(id)a3;
- (void)_runTimerBlock:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)dispatchAfterDelay:(double)a3;
- (void)dispatchAfterDelay:(double)a3 withBlock:(id)a4;
- (void)dispatchAfterDelay:(double)a3 withObject:(id)a4;
- (void)invalidate;
@end

@implementation SCRCTargetSelectorTimer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v3 = (void *)MEMORY[0x263F08B88];
    [v3 detachNewThreadSelector:sel__runThread toTarget:a1 withObject:0];
  }
}

+ (void)_runThread
{
  [a1 _assignThreadPriority];
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  _TimerRunLoop = (uint64_t)CFRetain(Current);
  v6.version = 0;
  memset(&v6.retain, 0, 24);
  v6.info = a1;
  CFAbsoluteTime v4 = CFAbsoluteTimeGetCurrent();
  v5 = CFRunLoopTimerCreate(0, v4 + 630720000.0, 630720000.0, 0, 0, (CFRunLoopTimerCallBack)_handlerMainThread, &v6);
  CFRunLoopAddTimer((CFRunLoopRef)_TimerRunLoop, v5, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  _HaveTimerRunLoop = 1;
  CFRunLoopRunSpecific();
  __assert_rtn("+[SCRCTargetSelectorTimer _runThread]", "SCRCTargetSelectorTimer.m", 76, "false");
}

+ (void)_assignThreadPriority
{
  int64_t v2 = +[SCRCThread defaultThreadPriority];
  if (v2)
  {
    int v3 = v2;
    sched_param v7 = 0;
    int v6 = 0;
    CFAbsoluteTime v4 = pthread_self();
    pthread_getschedparam(v4, &v6, &v7);
    v7.sched_priority = v3;
    v5 = pthread_self();
    pthread_setschedparam(v5, 2, &v7);
  }
}

- (SCRCTargetSelectorTimer)initWithTarget:(id)a3 selector:(SEL)a4
{
  return [(SCRCTargetSelectorTimer *)self initWithTarget:a3 selector:a4 threadKey:0];
}

- (BOOL)_createdTimer
{
  return self->_createdTimer;
}

- (id)_initWithTarget:(id)a3 selector:(SEL)a4 threadKeyOrThread:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SCRCTargetSelectorTimer;
  v10 = [(SCRCTargetSelector *)&v22 initWithTarget:v8 selector:a4];
  v11 = v10;
  if (v10)
  {
    p_key = &v10->_key;
    objc_storeStrong(&v10->_key, a5);
    v11->_isCanceled = 1;
    v13 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v11->_lock;
    v11->_lock = v13;

    context.version = 0;
    context.info = v11;
    context.retain = (const void *(__cdecl *)(const void *))_timerRetain;
    context.release = (void (__cdecl *)(const void *))_timerRelease;
    context.copyDescription = 0;
    v11->_createdTimer = 0;
    if (*p_key)
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      double v16 = CFAbsoluteTimeGetCurrent() + 630720000.0;
      if (isKindOfClass) {
        v17 = (void (__cdecl *)(CFRunLoopTimerRef, void *))_handlerSCRCThread;
      }
      else {
        v17 = (void (__cdecl *)(CFRunLoopTimerRef, void *))_handler;
      }
    }
    else
    {
      double v16 = CFAbsoluteTimeGetCurrent() + 630720000.0;
      v17 = (void (__cdecl *)(CFRunLoopTimerRef, void *))_handlerMainThread;
    }
    timer = CFRunLoopTimerCreate(0, v16, 630720000.0, 0, 0, v17, &context);
    v11->_timer = timer;
    v11->_createdTimer = 1;
    if (_HaveTimerRunLoop)
    {
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v19 = 0;
      while (v19 != 200)
      {
        ++v19;
        usleep(0xC350u);
        if (_HaveTimerRunLoop == 1) {
          goto LABEL_14;
        }
      }
      uint64_t v19 = 201;
LABEL_14:
      timer = v11->_timer;
    }
    if (!timer) {
      -[SCRCTargetSelectorTimer _initWithTarget:selector:threadKeyOrThread:]();
    }
    if (!_TimerRunLoop) {
      -[SCRCTargetSelectorTimer _initWithTarget:selector:threadKeyOrThread:]();
    }
    if (v19 >= 201) {
      -[SCRCTargetSelectorTimer _initWithTarget:selector:threadKeyOrThread:]();
    }
    CFRunLoopAddTimer((CFRunLoopRef)_TimerRunLoop, timer, (CFRunLoopMode)*MEMORY[0x263EFFE78]);
  }

  return v11;
}

- (void)invalidate
{
  [(NSLock *)self->_lock lock];
  timer = self->_timer;
  if (timer)
  {
    CFRunLoopTimerInvalidate(timer);
    CFRelease(self->_timer);
    self->_timer = 0;
  }
  self->_isCanceled = 1;
  self->_isPending = 0;
  lock = self->_lock;
  id object = self->_object;
  self->_lock = 0;
  id v6 = object;
  id v8 = lock;

  id v7 = self->_object;
  self->_id object = 0;

  [(NSLock *)v8 unlock];
}

- (void)dealloc
{
  [(SCRCTargetSelectorTimer *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SCRCTargetSelectorTimer;
  [(SCRCTargetSelectorTimer *)&v3 dealloc];
}

- (void)dispatchAfterDelay:(double)a3
{
  [(NSLock *)self->_lock lock];
  if (self->_timer)
  {
    id v8 = self->_object;
    id object = self->_object;
    self->_id object = 0;

    self->_isCanceled = 0;
    self->_isPending = 1;
    timer = self->_timer;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(timer, Current + a3);
  }
  else
  {
    id v8 = 0;
  }
  [(NSLock *)self->_lock unlock];
}

- (void)dispatchAfterDelay:(double)a3 withBlock:(id)a4
{
  id v10 = a4;
  [(NSLock *)self->_lock lock];
  if (self->_timer)
  {
    id v6 = (void *)MEMORY[0x21D4A07D0](v10);
    id block = self->_block;
    self->_id block = v6;

    self->_isCanceled = 0;
    self->_isPending = 1;
    timer = self->_timer;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(timer, Current + a3);
  }
  [(NSLock *)self->_lock unlock];
}

- (void)dispatchAfterDelay:(double)a3 withObject:(id)a4
{
  id v10 = a4;
  [(NSLock *)self->_lock lock];
  id v7 = self->_object;
  objc_storeStrong(&self->_object, a4);
  timer = self->_timer;
  if (timer)
  {
    self->_isCanceled = 0;
    self->_isPending = 1;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(timer, Current + a3);
  }
  [(NSLock *)self->_lock unlock];
}

- (void)cancel
{
  [(NSLock *)self->_lock lock];
  if (self->_isCanceled)
  {
    id v7 = 0;
  }
  else
  {
    id block = self->_block;
    self->_id block = 0;

    self->_isCanceled = 1;
    timer = self->_timer;
    if (timer)
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      CFRunLoopTimerSetNextFireDate(timer, Current + 630720000.0);
    }
    id v7 = self->_object;
    id object = self->_object;
    self->_id object = 0;
  }
  [(NSLock *)self->_lock unlock];
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (BOOL)isCancelled
{
  return self->_isCanceled;
}

- (BOOL)isPending
{
  [(NSLock *)self->_lock lock];
  BOOL isPending = self->_isPending;
  [(NSLock *)self->_lock unlock];
  return isPending;
}

- (id)threadKey
{
  return self->_key;
}

- (void)_dispatchThreadHelper:(id)a3
{
}

- (void)_dispatch
{
  [(NSLock *)self->_lock lock];
  id v7 = self->_object;
  id object = self->_object;
  self->_id object = 0;

  [(NSLock *)self->_lock unlock];
  if (self->_block)
  {
    id key = self->_key;
    v5 = (void *)MEMORY[0x21D4A07D0]();
    [self performSelector:sel__dispatchThreadHelper_ withThreadKey:key count:1 objects:v5];

    id block = self->_block;
    self->_id block = 0;
  }
  else
  {
    id block = [(SCRCTargetSelector *)self target];
    objc_msgSend(block, "performSelector:withThreadKey:count:objects:", -[SCRCTargetSelector selector](self, "selector"), self->_key, 1, v7);
  }

  [(NSLock *)self->_lock lock];
  self->_BOOL isPending = 0;
  [(NSLock *)self->_lock unlock];
}

- (void)_dispatchMainThread
{
  [(NSLock *)self->_lock lock];
  id v5 = self->_object;
  id object = self->_object;
  self->_id object = 0;

  [(NSLock *)self->_lock unlock];
  if (self->_block)
  {
    dispatch_async(MEMORY[0x263EF83A0], self->_block);
    id block = self->_block;
    self->_id block = 0;
  }
  else
  {
    id block = [(SCRCTargetSelector *)self target];
    objc_msgSend(block, "performSelectorOnMainThread:withObject:waitUntilDone:", -[SCRCTargetSelector selector](self, "selector"), v5, 0);
  }

  [(NSLock *)self->_lock lock];
  self->_BOOL isPending = 0;
  [(NSLock *)self->_lock unlock];
}

- (void)_dispatchSCRCThread
{
  [(NSLock *)self->_lock lock];
  id v8 = self->_object;
  id object = self->_object;
  self->_id object = 0;

  [(NSLock *)self->_lock unlock];
  id key = self->_key;
  if (self->_block)
  {
    id v5 = (void *)MEMORY[0x21D4A07D0]();
    [key performSelector:sel__runTimerBlock_ onTarget:self count:1 objects:v5];

    id block = self->_block;
    self->_id block = 0;
  }
  else
  {
    id v7 = [(SCRCTargetSelector *)self selector];
    id block = [(SCRCTargetSelector *)self target];
    [key performSelector:v7 onTarget:block count:1 objects:v8];
  }

  [(NSLock *)self->_lock lock];
  self->_BOOL isPending = 0;
  [(NSLock *)self->_lock unlock];
}

- (void)_runTimerBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong(&self->_key, 0);
}

- (void)_initWithTarget:selector:threadKeyOrThread:.cold.1()
{
  __assert_rtn("-[SCRCTargetSelectorTimer _initWithTarget:selector:threadKeyOrThread:]", "SCRCTargetSelectorTimer.m", 155, "_timer != nil");
}

- (void)_initWithTarget:selector:threadKeyOrThread:.cold.2()
{
}

- (void)_initWithTarget:selector:threadKeyOrThread:.cold.3()
{
  __assert_rtn("-[SCRCTargetSelectorTimer _initWithTarget:selector:threadKeyOrThread:]", "SCRCTargetSelectorTimer.m", 157, "checkCount <= checkCountLimit");
}

@end