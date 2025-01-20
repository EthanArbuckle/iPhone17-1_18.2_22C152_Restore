@interface OITSUFlushingManager
+ (id)_singletonAlloc;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)sharedManager;
- (BOOL)controlsActiveObject:(id)a3;
- (BOOL)controlsInactiveObject:(id)a3;
- (BOOL)isNewObject:(TSUFlushableObjectInfo *)a3;
- (OITSUFlushingManager)init;
- (TSUFlushableObjectInfo)eraseInfoForObject:(id)a3;
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
- (void)removeObject:(id)a3;
- (void)safeToFlush:(id)a3 wasAccessed:(BOOL)a4;
- (void)transferNewObjects;
- (void)unsafeToFlush:(id)a3;
@end

@implementation OITSUFlushingManager

+ (id)_singletonAlloc
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___OITSUFlushingManager;
  return objc_msgSendSuper2(&v3, sel_allocWithZone_, 0);
}

+ (id)sharedManager
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__OITSUFlushingManager_sharedManager__block_invoke;
  block[3] = &unk_264D60B18;
  block[4] = a1;
  if (+[OITSUFlushingManager sharedManager]::sOnceToken != -1) {
    dispatch_once(&+[OITSUFlushingManager sharedManager]::sOnceToken, block);
  }
  return (id)+[OITSUFlushingManager sharedManager]::sSingletonInstance;
}

uint64_t __37__OITSUFlushingManager_sharedManager__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_singletonAlloc"), "init");
  +[OITSUFlushingManager sharedManager]::sSingletonInstance = result;
  if (!result)
  {
    uint64_t v3 = [NSString stringWithUTF8String:"+[OITSUFlushingManager sharedManager]_block_invoke"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"], 144, 0, "Couldn't create singleton instance of %@", *(void *)(a1 + 32));
    return +[OITSUAssertionHandler logBacktraceThrottled];
  }
  return result;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  uint64_t v3 = [NSString stringWithUTF8String:"+[OITSUFlushingManager allocWithZone:]"];
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"], 144, 0, "Don't alloc a singleton");
  +[OITSUAssertionHandler logBacktraceThrottled];
  return 0;
}

- (unint64_t)retainCount
{
  return 0xFFFFFFFFLL;
}

- (OITSUFlushingManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)OITSUFlushingManager;
  v2 = [(OITSUFlushingManager *)&v4 init];
  if (v2)
  {
    v2->_objects = objc_alloc_init(OITSURetainedPointerKeyDictionary);
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (self->_isFlushing) {
    [(OITSUFlushingManager *)self _stopFlushingObjects];
  }
  [(NSCondition *)self->_cond lock];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  objects = self->_objects;
  uint64_t v4 = [(OITSUNoCopyDictionary *)objects countByEnumeratingWithState:&v24 objects:v29 count:16];
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
        uint64_t v9 = objc_msgSend(-[OITSUNoCopyDictionary objectForKey:](self->_objects, "objectForKey:", v8), "pointerValue");
        if (v9) {
          MEMORY[0x23EC997B0](v9, 0x1080C40DCAC275BLL);
        }
      }
      uint64_t v5 = [(OITSUNoCopyDictionary *)objects countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  inactiveObjects = self->_inactiveObjects;
  uint64_t v11 = [(OITSUNoCopyDictionary *)inactiveObjects countByEnumeratingWithState:&v20 objects:v28 count:16];
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
        uint64_t v16 = objc_msgSend(-[OITSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", v15), "pointerValue");
        if (v16) {
          MEMORY[0x23EC997B0](v16, 0x1080C40DCAC275BLL);
        }
      }
      uint64_t v12 = [(OITSUNoCopyDictionary *)inactiveObjects countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v12);
  }
  sortedObjects = (void **)self->_sortedObjects;
  if (sortedObjects)
  {
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)self->_sortedObjects, sortedObjects[1]);
    MEMORY[0x23EC997B0](sortedObjects, 0x1020C4062D53EE8);
  }
  sortedNewObjects = (void **)self->_sortedNewObjects;
  if (sortedNewObjects)
  {
    std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::destroy((uint64_t)self->_sortedNewObjects, sortedNewObjects[1]);
    MEMORY[0x23EC997B0](sortedNewObjects, 0x1020C4062D53EE8);
  }

  [(NSCondition *)self->_cond unlock];
  v19.receiver = self;
  v19.super_class = (Class)OITSUFlushingManager;
  [(OITSUFlushingManager *)&v19 dealloc];
}

- (void)addObject:(id)a3
{
  if (![(OITSUNoCopyDictionary *)self->_objects objectForKey:a3])
  {
    [(OITSUFlushingManager *)self advanceClock];
    operator new();
  }
  [(OITSUFlushingManager *)self _didUseObject:a3];
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
    uint64_t v7 = [NSString stringWithUTF8String:"-[OITSUFlushingManager removeObject:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"], 261, 0, "Flushing manager encountered a circular reference in removeObject:, returning");
    +[OITSUAssertionHandler logBacktraceThrottled];
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
  v8 = [(OITSUFlushingManager *)self eraseInfoForObject:a3];
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    p_objects = (id *)&self->_objects;
  }
  else
  {
    p_objects = (id *)&self->_inactiveObjects;
    uint64_t v11 = objc_msgSend(-[OITSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", a3), "pointerValue");
    if (!v11) {
      goto LABEL_14;
    }
    uint64_t v9 = v11;
  }
  [*p_objects removeObjectForKey:a3];
  MEMORY[0x23EC997B0](v9, 0x1080C40DCAC275BLL);
LABEL_14:
  cond = self->_cond;
  [(NSCondition *)cond unlock];
}

- (void)doneWithObject:(id)a3
{
  [(NSCondition *)self->_cond lock];
  uint64_t v5 = [(OITSUFlushingManager *)self eraseInfoForObject:a3];
  if (v5)
  {
    v5->var3 = 2;
    [(OITSUFlushingManager *)self insertObjectInfo:v5];
  }
  else
  {
    uint64_t v6 = [NSString stringWithUTF8String:"-[OITSUFlushingManager doneWithObject:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"], 312, 0, "Object not under the flushing manager's control");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  cond = self->_cond;
  [(NSCondition *)cond unlock];
}

- (void)unsafeToFlush:(id)a3
{
  [(NSCondition *)self->_cond lock];
  if (self->_flushingObject != a3)
  {
    if (![(OITSUNoCopyDictionary *)self->_inactiveObjects objectForKey:a3])
    {
      v10 = [(OITSUFlushingManager *)self eraseInfoForObject:a3];
      if (!v10)
      {
        uint64_t v5 = [NSString stringWithUTF8String:"-[OITSUFlushingManager unsafeToFlush:]"];
        +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"], 347, 0, "Object not under the flushing manager's control");
        +[OITSUAssertionHandler logBacktraceThrottled];
      }
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F08D40]) initWithBytes:&v10 objCType:"^v"];
      [(OITSUNoCopyDictionary *)self->_inactiveObjects setObject:v6 forUncopiedKey:a3];

      [(OITSUNoCopyDictionary *)self->_objects removeObjectForKey:a3];
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
  uint64_t v8 = [NSString stringWithUTF8String:"-[OITSUFlushingManager unsafeToFlush:]"];
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"], 337, 0, "Flushing manager encountered a circular reference in unsafeToFlush:, returning");
  +[OITSUAssertionHandler logBacktraceThrottled];
  cond = self->_cond;
  [(NSCondition *)cond unlock];
}

- (void)safeToFlush:(id)a3 wasAccessed:(BOOL)a4
{
  BOOL v4 = a4;
  [(NSCondition *)self->_cond lock];
  if ([(OITSUNoCopyDictionary *)self->_objects objectForKey:a3])
  {
    if (v4) {
LABEL_3:
    }
      [(OITSUFlushingManager *)self _didUseObject:a3];
  }
  else
  {
    uint64_t v9 = objc_msgSend(-[OITSUNoCopyDictionary objectForKey:](self->_inactiveObjects, "objectForKey:", a3), "pointerValue");
    if (!v9)
    {
      uint64_t v7 = [NSString stringWithUTF8String:"-[OITSUFlushingManager safeToFlush:wasAccessed:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"], 373, 0, "Object not among the flushing manager's cached objects");
      +[OITSUAssertionHandler logBacktraceThrottled];
    }
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08D40]) initWithBytes:&v9 objCType:"^v"];
    [(OITSUNoCopyDictionary *)self->_objects setObject:v8 forUncopiedKey:a3];

    [(OITSUNoCopyDictionary *)self->_inactiveObjects removeObjectForKey:a3];
    [(OITSUFlushingManager *)self insertObjectInfo:v9];
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
  block[2] = __47__OITSUFlushingManager_didReceiveMemoryWarning__block_invoke;
  block[3] = &unk_264D60B18;
  block[4] = self;
  dispatch_async(global_queue, block);
}

uint64_t __47__OITSUFlushingManager_didReceiveMemoryWarning__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _flushAllEligible];
}

- (void)_flushAllEligible
{
  [(NSCondition *)self->_isFlushingCond lock];
  if (!self->_isFlushing)
  {
    self->_isFlushing = 1;
    [(NSCondition *)self->_isFlushingCond unlock];
    [(OITSUFlushingManager *)self _bgTaskStarted];
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
    uint64_t v3 = (void *)MEMORY[0x263F08B88];
    [v3 detachNewThreadSelector:sel__backgroundThread_ toTarget:self withObject:self];
  }
}

- (void)_stopFlushingObjects
{
  if (!self->_alwaysFlushing)
  {
    [(NSCondition *)self->_isFlushingCond lock];
    if (self->_isFlushing
      || (uint64_t v3 = [NSString stringWithUTF8String:"-[OITSUFlushingManager _stopFlushingObjects]"], +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"), 469, 0, "-stopFlushingObjects called when not flushing."), +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled"), self->_isFlushing))
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
  BOOL v4 = (void *)MEMORY[0x23EC9A170]();
  uint64_t v5 = self;
  [(OITSUFlushingManager *)self _bgThreadActive];
  uint64_t v6 = (void *)MEMORY[0x23EC9A170]([(NSCondition *)self->_cond lock]);
  while (!self->_stopFlushing)
  {
    sortedObjects = self->_sortedObjects;
    if (sortedObjects[2])
    {
      uint64_t v8 = 0;
      uint64_t v8 = *(const TSUFlushableObjectInfo **)(*sortedObjects + 32);
      self->_flushingObject = (TSUiOSMemoryWarningFlushable *)v8->var0;
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__erase_unique<TSUFlushableObjectInfo *>((uint64_t **)self->_sortedObjects, &v8);
      if (v8) {
        MEMORY[0x23EC997B0](v8, 0x1080C40DCAC275BLL);
      }
      uint64_t v8 = 0;
      [(OITSUNoCopyDictionary *)self->_objects removeObjectForKey:self->_flushingObject];
      [(NSCondition *)self->_cond unlock];
      [(TSUiOSMemoryWarningFlushable *)self->_flushingObject flush];
      if (objc_opt_respondsToSelector()) {
        [(TSUiOSMemoryWarningFlushable *)self->_flushingObject setFlushingManager:0];
      }

      [(NSCondition *)self->_cond lock];
      self->_flushingObject = 0;
      [(NSCondition *)self->_cond broadcast];
      uint64_t v6 = (void *)MEMORY[0x23EC9A170]();
    }
    else
    {
      if (self->_stopFlushingWhenQueueEmpty) {
        break;
      }
      [(OITSUFlushingManager *)self advanceClock];
      [(OITSUFlushingManager *)self _bgThreadInactive];
      [(NSCondition *)self->_cond wait];
      [(OITSUFlushingManager *)self _bgThreadActive];
    }
  }
  [(OITSUFlushingManager *)self _bgThreadInactive];
  [(OITSUFlushingManager *)self _bgTaskFinished];
  [(NSCondition *)self->_cond broadcast];
  [(NSCondition *)self->_cond unlock];
  [(NSCondition *)self->_isFlushingCond lock];
  self->_isFlushing = 0;
  [(NSCondition *)self->_isFlushingCond signal];
  [(NSCondition *)self->_isFlushingCond unlock];
  self->_bgThread = 0;
}

- (BOOL)isNewObject:(TSUFlushableObjectInfo *)a3
{
  return self->_clock - a3->var4[0] <= 4 && !a3->var4[1] && a3->var3 != 2;
}

- (TSUFlushableObjectInfo)eraseInfoForObject:(id)a3
{
  BOOL v4 = (const TSUFlushableObjectInfo *)objc_msgSend(-[OITSUNoCopyDictionary objectForKey:](self->_objects, "objectForKey:", a3), "pointerValue");
  uint64_t v6 = v4;
  if (v4)
  {
    if ([(OITSUFlushingManager *)self isNewObject:v4]) {
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
  uint64_t v5 = a3;
  if (a3)
  {
    if (-[OITSUFlushingManager isNewObject:](self, "isNewObject:")) {
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerTimeStampLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>((uint64_t **)self->_sortedNewObjects, (uint64_t)&v5, (uint64_t *)&v5);
    }
    else {
      std::__tree<TSUFlushableObjectInfo *,TSUFlushableObjectInfoPointerFlushingOrderLess,std::allocator<TSUFlushableObjectInfo *>>::__emplace_unique_key_args<TSUFlushableObjectInfo *,TSUFlushableObjectInfo * const&>((uint64_t **)self->_sortedObjects, &v5, (uint64_t *)&v5);
    }
  }
  else
  {
    uint64_t v4 = [NSString stringWithUTF8String:"-[OITSUFlushingManager insertObjectInfo:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"], 598, 0, "Expecting info to be non-NULL");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
}

- (void)transferNewObjects
{
  for (uint64_t i = (char *)self->_sortedNewObjects; *(char **)i != i + 8; uint64_t i = (char *)self->_sortedNewObjects)
  {
    uint64_t v4 = 0;
    uint64_t v4 = *(TSUFlushableObjectInfo **)(*(void *)i + 32);
    if (!v4) {
      break;
    }
    if (-[OITSUFlushingManager isNewObject:](self, "isNewObject:")) {
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
  return [(OITSUNoCopyDictionary *)self->_objects objectForKey:a3] != 0;
}

- (BOOL)controlsInactiveObject:(id)a3
{
  return [(OITSUNoCopyDictionary *)self->_inactiveObjects objectForKey:a3] != 0;
}

- (void)_didUseObject:(id)a3
{
  [(OITSUFlushingManager *)self advanceClock];
  uint64_t v5 = [(OITSUFlushingManager *)self eraseInfoForObject:a3];
  if (v5)
  {
    int var3 = v5->var3;
    v5->var4[1] = v5->var4[0];
    v5->var4[0] = self->_clock;
    if (var3 == 2) {
      v5->int var3 = 1;
    }
    [(OITSUFlushingManager *)self insertObjectInfo:v5];
  }
  else
  {
    uint64_t v7 = [NSString stringWithUTF8String:"-[OITSUFlushingManager _didUseObject:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"], 639, 0, "Object not under the flushing manager's control");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
}

- (void)_bgTaskStarted
{
  uint64_t v3 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  objc_sync_enter(self);
  if (self->_backgroundTransitionTaskId != *MEMORY[0x263F1D108])
  {
    uint64_t v4 = [NSString stringWithUTF8String:"-[OITSUFlushingManager _bgTaskStarted]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"], 666, 0, "Should only be one bg task at a time");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __38__OITSUFlushingManager__bgTaskStarted__block_invoke;
  v5[3] = &unk_264D60B18;
  v5[4] = self;
  self->_backgroundTransitionTaskId = [v3 beginBackgroundTaskWithExpirationHandler:v5];
  objc_sync_exit(self);
}

uint64_t __38__OITSUFlushingManager__bgTaskStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bgTaskFinished];
}

- (void)_bgTaskFinished
{
  uint64_t v3 = (void *)[MEMORY[0x263F1C408] sharedApplication];
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
  uint64_t v3 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  objc_sync_enter(self);
  if (self->_activeBgThreadTask != *MEMORY[0x263F1D108])
  {
    uint64_t v4 = [NSString stringWithUTF8String:"-[OITSUFlushingManager _bgThreadActive]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFlushingManager.mm"], 695, 0, "Should only be one bg thread active at a time");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__OITSUFlushingManager__bgThreadActive__block_invoke;
  v5[3] = &unk_264D60B18;
  v5[4] = self;
  self->_activeBgThreadTask = [v3 beginBackgroundTaskWithExpirationHandler:v5];
  objc_sync_exit(self);
}

uint64_t __39__OITSUFlushingManager__bgThreadActive__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _bgThreadInactive];
}

- (void)_bgThreadInactive
{
  uint64_t v3 = (void *)[MEMORY[0x263F1C408] sharedApplication];
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