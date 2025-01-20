@interface _UICache
- (BOOL)clearsCacheOnApplicationBackground;
- (BOOL)clearsCacheOnLowMemoryWarnings;
- (_UICache)init;
- (id)cacheKeys;
- (id)objectForKey:(id)a3;
- (id)retainedObjectForKey:(id)a3;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setClearsCacheOnApplicationBackground:(BOOL)a3;
- (void)setClearsCacheOnLowMemoryWarnings:(BOOL)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation _UICache

- (id)retainedObjectForKey:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__19;
  v11 = __Block_byref_object_dispose__19;
  uint64_t v12 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33___UICache_retainedObjectForKey___block_invoke;
  block[3] = &unk_1E55CE108;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(cacheQueue, block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29___UICache_setObject_forKey___block_invoke;
  block[3] = &unk_1E55CE0E0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(cacheQueue, block);
}

- (id)objectForKey:(id)a3
{
  id v3 = [(_UICache *)self retainedObjectForKey:a3];

  return v3;
}

- (void)removeObjectForKey:(id)a3
{
  cacheQueue = self->_cacheQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31___UICache_removeObjectForKey___block_invoke;
  v4[3] = &unk_1E55CE0B8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(cacheQueue, v4);
}

- (void)dealloc
{
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __19___UICache_dealloc__block_invoke;
  block[3] = &unk_1E55C5470;
  block[4] = self;
  dispatch_sync(cacheQueue, block);
  if (!self->_clearsCacheOnLowMemoryWarnings) {
    dispatch_resume((dispatch_object_t)self->_memoryWarningsSource);
  }
  dispatch_source_cancel((dispatch_source_t)self->_memoryWarningsSource);
  dispatch_release((dispatch_object_t)self->_memoryWarningsSource);
  if (self->_clearsCacheOnApplicationBackground) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_noteObserver);
  }
  dispatch_release((dispatch_object_t)self->_cacheQueue);
  v4.receiver = self;
  v4.super_class = (Class)_UICache;
  [(_UICache *)&v4 dealloc];
}

- (_UICache)init
{
  v8.receiver = self;
  v8.super_class = (Class)_UICache;
  v2 = [(_UICache *)&v8 init];
  if (v2)
  {
    v2->_cacheQueue = (OS_dispatch_queue *)dispatch_queue_create("Internal _UICache queue", 0);
    v2->_cache = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
    id v3 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 6uLL, 0);
    v2->_memoryWarningsSource = (OS_dispatch_source *)v3;
    v6[0] = MEMORY[0x1E4F143A8];
    long long v4 = *(_OWORD *)&v2->_cacheQueue;
    v6[1] = 3221225472;
    v6[2] = __16___UICache_init__block_invoke;
    v6[3] = &unk_1E55CE0B8;
    long long v7 = v4;
    dispatch_source_set_event_handler(v3, v6);
    [(_UICache *)v2 setClearsCacheOnLowMemoryWarnings:1];
    [(_UICache *)v2 setClearsCacheOnApplicationBackground:1];
  }
  return v2;
}

- (void)setClearsCacheOnLowMemoryWarnings:(BOOL)a3
{
  if (self->_clearsCacheOnLowMemoryWarnings != a3)
  {
    memoryWarningsSource = self->_memoryWarningsSource;
    if (a3) {
      dispatch_resume(memoryWarningsSource);
    }
    else {
      dispatch_suspend(memoryWarningsSource);
    }
    self->_clearsCacheOnLowMemoryWarnings = a3;
  }
}

- (void)setClearsCacheOnApplicationBackground:(BOOL)a3
{
  if (self->_clearsCacheOnApplicationBackground != a3)
  {
    BOOL v3 = a3;
    v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    v6 = v5;
    if (v3)
    {
      long long v8 = *(_OWORD *)&self->_cacheQueue;
      uint64_t UIApplicationDidEnterBackgroundNotification_0 = getUIApplicationDidEnterBackgroundNotification_0();
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __50___UICache_setClearsCacheOnApplicationBackground___block_invoke;
      v9[3] = &unk_1E55CE130;
      long long v10 = v8;
      self->_noteObserver = (id)[v6 addObserverForName:UIApplicationDidEnterBackgroundNotification_0 object:0 queue:0 usingBlock:v9];
    }
    else
    {
      [v5 removeObserver:self->_noteObserver];
      self->_noteObserver = 0;
    }
    self->_clearsCacheOnApplicationBackground = v3;
  }
}

- (void)removeAllObjects
{
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28___UICache_removeAllObjects__block_invoke;
  block[3] = &unk_1E55C5470;
  block[4] = self;
  dispatch_sync(cacheQueue, block);
}

- (BOOL)clearsCacheOnLowMemoryWarnings
{
  return self->_clearsCacheOnLowMemoryWarnings;
}

- (BOOL)clearsCacheOnApplicationBackground
{
  return self->_clearsCacheOnApplicationBackground;
}

- (id)cacheKeys
{
  BOOL v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  cacheQueue = self->_cacheQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __21___UICache_cacheKeys__block_invoke;
  v6[3] = &unk_1E55CE0B8;
  void v6[4] = v3;
  v6[5] = self;
  dispatch_sync(cacheQueue, v6);
  return v3;
}

@end