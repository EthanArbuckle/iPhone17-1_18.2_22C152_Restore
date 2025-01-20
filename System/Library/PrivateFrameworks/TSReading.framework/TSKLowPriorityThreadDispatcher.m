@interface TSKLowPriorityThreadDispatcher
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedLowPriorityDispatcher;
- (BOOL)isSuspended;
- (TSKLowPriorityThreadDispatcher)init;
- (id)p_dispatchQueue;
- (unint64_t)retainCount;
- (void)resume;
- (void)suspend;
@end

@implementation TSKLowPriorityThreadDispatcher

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSKLowPriorityThreadDispatcher;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedLowPriorityDispatcher
{
  id result = (id)sharedLowPriorityDispatcher_sSingletonInstance;
  if (!sharedLowPriorityDispatcher_sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!sharedLowPriorityDispatcher_sSingletonInstance)
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      sharedLowPriorityDispatcher_sSingletonInstance = v4;
      if (!v4)
      {
        v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSKLowPriorityThreadDispatcher sharedLowPriorityDispatcher]"];
        [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKThreadDispatcher.m"), 62, @"Couldn't create singleton instance of %@", a1 file lineNumber description];
      }
    }
    objc_sync_exit(a1);
    return (id)sharedLowPriorityDispatcher_sSingletonInstance;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  uint64_t v4 = [NSString stringWithUTF8String:"+[TSKLowPriorityThreadDispatcher allocWithZone:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKThreadDispatcher.m"), 62, @"Don't alloc a singleton");
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (TSKLowPriorityThreadDispatcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)TSKLowPriorityThreadDispatcher;
  v2 = [(TSKLowPriorityThreadDispatcher *)&v6 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_create("com.apple.TSKLowPriorityThreadDispatcher", 0);
    v2->_queue = (OS_dispatch_queue *)v3;
    global_queue = dispatch_get_global_queue(-2, 0);
    dispatch_set_target_queue(v3, global_queue);
  }
  return v2;
}

- (BOOL)isSuspended
{
  return self->_suspendCount > 0;
}

- (void)suspend
{
  if (!atomic_fetch_add(&self->_suspendCount, 1u)) {
    dispatch_suspend((dispatch_object_t)self->_queue);
  }
}

- (void)resume
{
  int add = atomic_fetch_add(&self->_suspendCount, 0xFFFFFFFF);
  if (add <= 0)
  {
    uint64_t v4 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSKLowPriorityThreadDispatcher resume]"];
    uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKThreadDispatcher.m"];
    [v4 handleFailureInFunction:v5 file:v6 lineNumber:93 description:@"Suspend count underflow"];
  }
  else if (add == 1)
  {
    queue = self->_queue;
    dispatch_resume(queue);
  }
}

- (id)p_dispatchQueue
{
  return self->_queue;
}

@end