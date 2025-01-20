@interface TSUFlushingManager
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedManager;
- (BOOL)controlsActiveObject:(id)a3;
- (BOOL)controlsInactiveObject:(id)a3;
- (BOOL)isNewObject:(TSUFlushableObjectInfo *)a3;
- (TSUFlushableObjectInfo)eraseInfoForObject:(id)a3;
- (TSUFlushingManager)init;
- (unint64_t)retainCount;
- (void)_backgroundThread:(id)a3;
- (void)_bgTaskFinished;
- (void)_bgTaskStarted;
- (void)_bgThreadActive;
- (void)_bgThreadInactive;
- (void)_didUseObject:(id)a3;
- (void)_flushAllEligible;
- (void)_startFlushingObjects;
- (void)_stopFlushingObjects;
- (void)addObject:(id)a3;
- (void)advanceClock;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)doneWithObject:(id)a3;
- (void)insertObjectInfo:(TSUFlushableObjectInfo *)a3;
- (void)memoryLevelDecreased:(int)a3 was:(int)a4;
- (void)memoryLevelIncreased:(int)a3 was:(int)a4;
- (void)protectObject:(id)a3;
- (void)removeObject:(id)a3;
- (void)safeToFlush:(id)a3 wasAccessed:(BOOL)a4;
- (void)stopProtectingObject:(id)a3;
- (void)transferNewObjects;
- (void)unsafeToFlush:(id)a3;
@end

@implementation TSUFlushingManager

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___TSUFlushingManager;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedManager
{
  id result = (id)+[TSUFlushingManager sharedManager]::sSingletonInstance;
  if (!+[TSUFlushingManager sharedManager]::sSingletonInstance)
  {
    objc_sync_enter(a1);
    if (!+[TSUFlushingManager sharedManager]::sSingletonInstance)
    {
      uint64_t v4 = objc_msgSend((id)objc_msgSend(a1, "_singletonAlloc"), "init");
      __dmb(0xBu);
      +[TSUFlushingManager sharedManager]::sSingletonInstance = v4;
      if (!v4)
      {
        id v5 = +[TSUAssertionHandler currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"+[TSUFlushingManager sharedManager]"];
        [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 165, @"Couldn't create singleton instance of %@", a1 file lineNumber description];
      }
    }
    objc_sync_exit(a1);
    return (id)+[TSUFlushingManager sharedManager]::sSingletonInstance;
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  id v3 = +[TSUAssertionHandler currentHandler];
  uint64_t v4 = [NSString stringWithUTF8String:"+[TSUFlushingManager allocWithZone:]"];
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 165, @"Don't alloc a singleton");
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (TSUFlushingManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSUFlushingManager;
  v2 = [(TSUFlushingManager *)&v4 init];
  if (v2)
  {
    v2->_objects = objc_alloc_init(TSURetainedPointerKeyDictionary);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  [(TSUMemoryWatcher *)self->_memoryWatcher stopObserving];

  if (self->_isFlushing) {
    [(TSUFlushingManager *)self _stopFlushingObjects];
  }
  [(NSCondition *)self->_cond lock];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  objects = self->_objects;
  uint64_t v4 = [(TSUNoCopyDictionary *)objects countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(objects);
        }
        v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v8 setFlushingManager:0];
        }
        uint64_t v9 = objc_msgSend(-[TSUNoCopyDictionary objectForKey:](self->_objects, "objectForKey:", v8), "pointerValue");
        if (v9) {
          MEMORY[0x223C9EE80](v9, 0x1080C40DCAC275BLL);
        }
      }
      uint64_t v5 = [(TSUNoCopyDictionary *)objects countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  inactiveObjects = self->_inactiveObjects;
  uint64_t v11 = [(TSUNoCopyDictionary *)inactiveObjects countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(inactiveObjects);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          [v15 setFlushingManager:0];
        }
        uint64_t v16 = objc_msgSend(-[TSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", v15), "pointerValue");
        if (v16) {
          MEMORY[0x223C9EE80](v16, 0x1080C40DCAC275BLL);
        }
      }
      uint64_t v12 = [(TSUNoCopyDictionary *)inactiveObjects countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v12);
  }
  sortedObjects = (void **)self->_sortedObjects;
  if (sortedObjects)
  {
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)self->_sortedObjects, sortedObjects[1]);
    MEMORY[0x223C9EE80](sortedObjects, 0x1020C4062D53EE8);
  }
  sortedNewObjects = (void **)self->_sortedNewObjects;
  if (sortedNewObjects)
  {
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)self->_sortedNewObjects, sortedNewObjects[1]);
    MEMORY[0x223C9EE80](sortedNewObjects, 0x1020C4062D53EE8);
  }

  [(NSCondition *)self->_cond unlock];
  v19.receiver = self;
  v19.super_class = (Class)TSUFlushingManager;
  [(TSUFlushingManager *)&v19 dealloc];
}

- (void)addObject:(id)a3
{
  if (![(TSUNoCopyDictionary *)self->_objects objectForKey:a3])
  {
    [(TSUFlushingManager *)self advanceClock];
    operator new();
  }
  [(TSUFlushingManager *)self _didUseObject:a3];
  [(NSCondition *)self->_cond broadcast];
  [(NSCondition *)self->_cond unlock];
}

- (void)removeObject:(id)a3
{
  [(NSCondition *)self->_cond lock];
  flushingObject = self->_flushingObject;
  if (flushingObject != a3) {
    goto LABEL_6;
  }
  bgThread = self->_bgThread;
  if (bgThread == (NSThread *)[MEMORY[0x263F08B88] currentThread])
  {
    id v7 = +[TSUAssertionHandler currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSUFlushingManager removeObject:]"];
    [v7 handleFailureInFunction:v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 305, @"Flushing manager encountered a circular reference in removeObject:, returning" file lineNumber description];
    goto LABEL_14;
  }
  while (1)
  {
    flushingObject = self->_flushingObject;
LABEL_6:
    if (flushingObject != a3) {
      break;
    }
    [(NSCondition *)self->_cond wait];
  }
  if (objc_opt_respondsToSelector()) {
    [a3 setFlushingManager:0];
  }
  uint64_t v9 = [(TSUFlushingManager *)self eraseInfoForObject:a3];
  if (v9)
  {
    uint64_t v10 = (uint64_t)v9;
    p_objects = (id *)&self->_objects;
LABEL_13:
    [*p_objects removeObjectForKey:a3];
    MEMORY[0x223C9EE80](v10, 0x1080C40DCAC275BLL);
    goto LABEL_14;
  }
  p_objects = (id *)&self->_inactiveObjects;
  uint64_t v12 = objc_msgSend(-[TSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", a3), "pointerValue");
  if (v12)
  {
    uint64_t v10 = v12;
    goto LABEL_13;
  }
LABEL_14:
  cond = self->_cond;
  [(NSCondition *)cond unlock];
}

- (void)protectObject:(id)a3
{
  [(NSCondition *)self->_cond lock];
  uint64_t v5 = [(TSUFlushingManager *)self eraseInfoForObject:a3];
  if (v5)
  {
    v5->var3 = 0;
    [(TSUFlushingManager *)self insertObjectInfo:v5];
  }
  else
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSUFlushingManager protectObject:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 363, @"Object not under the flushing manager's control");
  }
  cond = self->_cond;
  [(NSCondition *)cond unlock];
}

- (void)stopProtectingObject:(id)a3
{
  [(NSCondition *)self->_cond lock];
  uint64_t v5 = [(TSUFlushingManager *)self eraseInfoForObject:a3];
  if (v5)
  {
    id v6 = v5;
    if (v5->var3)
    {
      id v7 = +[TSUAssertionHandler currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSUFlushingManager stopProtectingObject:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 387, @"The object isn't protected");
    }
    v6->var3 = 1;
    [(TSUFlushingManager *)self insertObjectInfo:v6];
  }
  else
  {
    id v9 = +[TSUAssertionHandler currentHandler];
    uint64_t v10 = [NSString stringWithUTF8String:"-[TSUFlushingManager stopProtectingObject:]"];
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 384, @"Object not under the flushing manager's control");
  }
  cond = self->_cond;
  [(NSCondition *)cond unlock];
}

- (void)doneWithObject:(id)a3
{
  [(NSCondition *)self->_cond lock];
  uint64_t v5 = [(TSUFlushingManager *)self eraseInfoForObject:a3];
  if (v5)
  {
    v5->var3 = 2;
    [(TSUFlushingManager *)self insertObjectInfo:v5];
  }
  else
  {
    id v6 = +[TSUAssertionHandler currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSUFlushingManager doneWithObject:]"];
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 406, @"Object not under the flushing manager's control");
  }
  cond = self->_cond;
  [(NSCondition *)cond unlock];
}

- (void)unsafeToFlush:(id)a3
{
  [(NSCondition *)self->_cond lock];
  if (self->_flushingObject != a3)
  {
    if (![(TSUNoCopyDictionary *)self->_inactiveObjects objectForKey:a3])
    {
      uint64_t v12 = [(TSUFlushingManager *)self eraseInfoForObject:a3];
      if (!v12)
      {
        id v5 = +[TSUAssertionHandler currentHandler];
        uint64_t v6 = [NSString stringWithUTF8String:"-[TSUFlushingManager unsafeToFlush:]"];
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 450, @"Object not under the flushing manager's control");
      }
      uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F08D40]) initWithBytes:&v12 objCType:"^v"];
      [(TSUNoCopyDictionary *)self->_inactiveObjects setObject:v7 forUncopiedKey:a3];

      [(TSUNoCopyDictionary *)self->_objects removeObjectForKey:a3];
    }
    goto LABEL_6;
  }
  bgThread = self->_bgThread;
  if (bgThread != (NSThread *)[MEMORY[0x263F08B88] currentThread])
  {
    while (self->_flushingObject == a3)
      [(NSCondition *)self->_cond wait];
LABEL_6:
    [(NSCondition *)self->_cond unlock];
    return;
  }
  id v9 = +[TSUAssertionHandler currentHandler];
  uint64_t v10 = [NSString stringWithUTF8String:"-[TSUFlushingManager unsafeToFlush:]"];
  [v9 handleFailureInFunction:v10, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 435, @"Flushing manager encountered a circular reference in unsafeToFlush:, returning" file lineNumber description];
  cond = self->_cond;
  [(NSCondition *)cond unlock];
}

- (void)safeToFlush:(id)a3 wasAccessed:(BOOL)a4
{
  BOOL v4 = a4;
  [(NSCondition *)self->_cond lock];
  if ([(TSUNoCopyDictionary *)self->_objects objectForKey:a3])
  {
    if (v4) {
LABEL_3:
    }
      [(TSUFlushingManager *)self _didUseObject:a3];
  }
  else
  {
    uint64_t v10 = objc_msgSend(-[TSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", a3), "pointerValue");
    if (!v10)
    {
      id v7 = +[TSUAssertionHandler currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"-[TSUFlushingManager safeToFlush:wasAccessed:]"];
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 480, @"Object not among the flushing manager's cached objects");
    }
    id v9 = (void *)[objc_alloc(MEMORY[0x263F08D40]) initWithBytes:&v10 objCType:"^v"];
    [(TSUNoCopyDictionary *)self->_objects setObject:v9 forUncopiedKey:a3];

    [(TSUNoCopyDictionary *)self->_inactiveObjects removeObjectForKey:a3];
    [(TSUFlushingManager *)self insertObjectInfo:v10];
    if (v4) {
      goto LABEL_3;
    }
  }
  [(NSCondition *)self->_cond unlock];
}

- (void)didReceiveMemoryWarning
{
  global_queue = dispatch_get_global_queue(2, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__TSUFlushingManager_didReceiveMemoryWarning__block_invoke;
  block[3] = &unk_26462A048;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __45__TSUFlushingManager_didReceiveMemoryWarning__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushAllEligible];
}

- (void)memoryLevelIncreased:(int)a3 was:(int)a4
{
  if (a3 < 1 || a4 > 0)
  {
    if (a4 > 3) {
      id v7 = 0;
    }
    else {
      id v7 = off_26462A080[a4];
    }
    if (a3 > 3) {
      uint64_t v8 = 0;
    }
    else {
      uint64_t v8 = off_26462A080[a3];
    }
    NSLog((NSString *)@"TSUFlushingManager: Memory level increased from %@ to %@", a2, v7, v8);
  }
  else
  {
    id v5 = 0;
    uint64_t v6 = @"Normal (0)";
    if (a4) {
      uint64_t v6 = 0;
    }
    if (a3 <= 3) {
      id v5 = off_26462A068[a3 - 1];
    }
    NSLog((NSString *)@"TSUFlushingManager: Memory level increased from %@ to %@, flushing starting.", a2, v6, v5);
    [(TSUFlushingManager *)self _startFlushingObjects];
  }
}

- (void)memoryLevelDecreased:(int)a3 was:(int)a4
{
  if (a3 > 0 || a4 < 1)
  {
    if (a4 > 3) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = off_26462A080[a4];
    }
    if (a3 > 3) {
      id v7 = 0;
    }
    else {
      id v7 = off_26462A080[a3];
    }
    NSLog((NSString *)@"TSUFlushingManager: Memory level decreased from %@ to %@", a2, v6, v7);
  }
  else
  {
    if (a4 > 3) {
      id v5 = 0;
    }
    else {
      id v5 = off_26462A068[a4 - 1];
    }
    uint64_t v8 = @"Normal (0)";
    if (a3) {
      uint64_t v8 = 0;
    }
    NSLog((NSString *)@"TSUFlushingManager: Memory level decreased from %@ to %@, flushing stopping.", a2, v5, v8);
    [(TSUFlushingManager *)self _stopFlushingObjects];
  }
}

- (void)_flushAllEligible
{
  [(NSCondition *)self->_isFlushingCond lock];
  if (!self->_isFlushing)
  {
    self->_isFlushing = 1;
    [(NSCondition *)self->_isFlushingCond unlock];
    [(TSUFlushingManager *)self _bgTaskStarted];
    *(_WORD *)&self->_stopFlushing = 256;
    [MEMORY[0x263F08B88] detachNewThreadSelector:sel__backgroundThread_ toTarget:self withObject:self];
    [(NSCondition *)self->_isFlushingCond lock];
    while (self->_isFlushing)
      [(NSCondition *)self->_isFlushingCond wait];
    self->_stopFlushingWhenQueueEmpty = 0;
  }
  isFlushingCond = self->_isFlushingCond;
  [(NSCondition *)isFlushingCond unlock];
}

- (void)_startFlushingObjects
{
  if (!self->_alwaysFlushing)
  {
    [(NSCondition *)self->_isFlushingCond lock];
    while (self->_isFlushing)
      [(NSCondition *)self->_isFlushingCond wait];
    self->_isFlushing = 1;
    [(NSCondition *)self->_isFlushingCond unlock];
    self->_stopFlushing = 0;
    id v3 = (void *)MEMORY[0x263F08B88];
    [v3 detachNewThreadSelector:sel__backgroundThread_ toTarget:self withObject:self];
  }
}

- (void)_stopFlushingObjects
{
  if (!self->_alwaysFlushing)
  {
    [(NSCondition *)self->_isFlushingCond lock];
    if (self->_isFlushing
      || (id v3 = +[TSUAssertionHandler currentHandler],
          uint64_t v4 = [NSString stringWithUTF8String:"-[TSUFlushingManager _stopFlushingObjects]"],
          objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 628, @"-stopFlushingObjects called when not flushing."), self->_isFlushing))
    {
      [(NSCondition *)self->_cond lock];
      self->_stopFlushing = 1;
      [(NSCondition *)self->_cond broadcast];
      [(NSCondition *)self->_cond unlock];
      while (self->_isFlushing)
        [(NSCondition *)self->_isFlushingCond wait];
    }
    isFlushingCond = self->_isFlushingCond;
    [(NSCondition *)isFlushingCond unlock];
  }
}

- (void)_backgroundThread:(id)a3
{
  self->_bgThread = (NSThread *)objc_msgSend(MEMORY[0x263F08B88], "currentThread", a3);
  uint64_t v4 = objc_opt_new();
  id v5 = self;
  [(TSUFlushingManager *)self _bgThreadActive];
  [(NSCondition *)self->_cond lock];
  while (!self->_stopFlushing)
  {
    sortedObjects = self->_sortedObjects;
    if (sortedObjects[2])
    {
      id v7 = 0;
      id v7 = *(const TSUFlushableObjectInfo **)(*sortedObjects + 32);
      self->_flushingObject = (TSUFlushable *)v7->var0;
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>((uint64_t **)self->_sortedObjects, &v7);
      if (v7) {
        MEMORY[0x223C9EE80](v7, 0x1080C40DCAC275BLL);
      }
      id v7 = 0;
      [(TSUNoCopyDictionary *)self->_objects removeObjectForKey:self->_flushingObject];
      [(NSCondition *)self->_cond unlock];
      [(TSUFlushable *)self->_flushingObject flush];
      if (objc_opt_respondsToSelector()) {
        [(TSUFlushable *)self->_flushingObject setFlushingManager:0];
      }

      [(NSCondition *)self->_cond lock];
      self->_flushingObject = 0;
      [(NSCondition *)self->_cond broadcast];
      [v4 drain];
      uint64_t v4 = objc_opt_new();
    }
    else
    {
      if (self->_stopFlushingWhenQueueEmpty) {
        break;
      }
      [(TSUFlushingManager *)self advanceClock];
      [(TSUFlushingManager *)self _bgThreadInactive];
      [(NSCondition *)self->_cond wait];
      [(TSUFlushingManager *)self _bgThreadActive];
    }
  }
  [(TSUFlushingManager *)self _bgThreadInactive];
  [(TSUFlushingManager *)self _bgTaskFinished];
  [(NSCondition *)self->_cond broadcast];
  [(NSCondition *)self->_cond unlock];
  [(NSCondition *)self->_isFlushingCond lock];
  self->_isFlushing = 0;
  [(NSCondition *)self->_isFlushingCond signal];
  [(NSCondition *)self->_isFlushingCond unlock];

  [v4 drain];
  self->_bgThread = 0;
}

- (BOOL)isNewObject:(TSUFlushableObjectInfo *)a3
{
  return self->_clock - a3->var4[0] <= 4 && !a3->var4[1] && a3->var3 != 2;
}

- (TSUFlushableObjectInfo)eraseInfoForObject:(id)a3
{
  uint64_t v4 = (const TSUFlushableObjectInfo *)objc_msgSend(-[TSUNoCopyDictionary objectForKey:](self->_objects, "objectForKey:", a3), "pointerValue");
  uint64_t v6 = v4;
  if (v4)
  {
    if ([(TSUFlushingManager *)self isNewObject:v4]) {
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>((uint64_t **)self->_sortedNewObjects, (uint64_t)&v6);
    }
    else {
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>((uint64_t **)self->_sortedObjects, &v6);
    }
  }
  return (TSUFlushableObjectInfo *)v6;
}

- (void)insertObjectInfo:(TSUFlushableObjectInfo *)a3
{
  id v7 = a3;
  if (a3)
  {
    if (-[TSUFlushingManager isNewObject:](self, "isNewObject:")) {
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>((uint64_t **)self->_sortedNewObjects, (uint64_t)&v7, (uint64_t *)&v7);
    }
    else {
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>((uint64_t **)self->_sortedObjects, &v7, (uint64_t *)&v7);
    }
  }
  else
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSUFlushingManager insertObjectInfo:]"];
    uint64_t v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"];
    [v4 handleFailureInFunction:v5 file:v6 lineNumber:786 description:@"Expecting info to be non-NULL"];
  }
}

- (void)transferNewObjects
{
  for (uint64_t i = (char *)self->_sortedNewObjects; *(char **)i != i + 8; uint64_t i = (char *)self->_sortedNewObjects)
  {
    id v4 = 0;
    id v4 = *(TSUFlushableObjectInfo **)(*(void *)i + 32);
    if (!v4) {
      break;
    }
    if (-[TSUFlushingManager isNewObject:](self, "isNewObject:")) {
      break;
    }
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>((uint64_t **)self->_sortedNewObjects, (uint64_t)&v4);
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>((uint64_t **)self->_sortedObjects, &v4, (uint64_t *)&v4);
  }
}

- (void)advanceClock
{
}

- (BOOL)controlsActiveObject:(id)a3
{
  return [(TSUNoCopyDictionary *)self->_objects objectForKey:a3] != 0;
}

- (BOOL)controlsInactiveObject:(id)a3
{
  return [(TSUNoCopyDictionary *)self->_inactiveObjects objectForKey:a3] != 0;
}

- (void)_didUseObject:(id)a3
{
  [(TSUFlushingManager *)self advanceClock];
  uint64_t v5 = [(TSUFlushingManager *)self eraseInfoForObject:a3];
  if (v5)
  {
    int var3 = v5->var3;
    v5->var4[1] = v5->var4[0];
    v5->var4[0] = self->_clock;
    if (var3 == 2) {
      v5->int var3 = 1;
    }
    [(TSUFlushingManager *)self insertObjectInfo:v5];
  }
  else
  {
    id v7 = +[TSUAssertionHandler currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"-[TSUFlushingManager _didUseObject:]"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 838, @"Object not under the flushing manager's control");
  }
}

- (void)_bgTaskStarted
{
  id v3 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  objc_sync_enter(self);
  if (self->_backgroundTransitionTaskId != *MEMORY[0x263F1D108])
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSUFlushingManager _bgTaskStarted]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 869, @"Should only be one bg task at a time");
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__TSUFlushingManager__bgTaskStarted__block_invoke;
  v6[3] = &unk_26462A048;
  v6[4] = self;
  self->_backgroundTransitionTaskId = [v3 beginBackgroundTaskWithName:@"TSUFlushingManager" expirationHandler:v6];
  objc_sync_exit(self);
}

uint64_t __36__TSUFlushingManager__bgTaskStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bgTaskFinished];
}

- (void)_bgTaskFinished
{
  id v3 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  objc_sync_enter(self);
  unint64_t v4 = *MEMORY[0x263F1D108];
  if (self->_backgroundTransitionTaskId != *MEMORY[0x263F1D108])
  {
    objc_msgSend(v3, "endBackgroundTask:");
    self->_backgroundTransitionTaskId = v4;
  }
  objc_sync_exit(self);
}

- (void)_bgThreadActive
{
  id v3 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  objc_sync_enter(self);
  if (self->_activeBgThreadTask != *MEMORY[0x263F1D108])
  {
    id v4 = +[TSUAssertionHandler currentHandler];
    uint64_t v5 = [NSString stringWithUTF8String:"-[TSUFlushingManager _bgThreadActive]"];
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUFlushingManager.mm"), 903, @"Should only be one bg thread active at a time");
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__TSUFlushingManager__bgThreadActive__block_invoke;
  v6[3] = &unk_26462A048;
  v6[4] = self;
  self->_activeBgThreadTask = [v3 beginBackgroundTaskWithName:@"TSUFlushingManager" expirationHandler:v6];
  objc_sync_exit(self);
}

uint64_t __37__TSUFlushingManager__bgThreadActive__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bgThreadInactive];
}

- (void)_bgThreadInactive
{
  id v3 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  objc_sync_enter(self);
  unint64_t v4 = *MEMORY[0x263F1D108];
  if (self->_activeBgThreadTask != *MEMORY[0x263F1D108])
  {
    objc_msgSend(v3, "endBackgroundTask:");
    self->_activeBgThreadTask = v4;
  }
  objc_sync_exit(self);
}

@end