@interface ISDeferredDealloc
+ (id)sharedInstance;
- (ISDeferredDealloc)init;
- (void)_performDeferredDealloc:(id)a3;
- (void)_performDeferredDealloc:(id)a3 withDelay:(double)a4;
- (void)dealloc;
@end

@implementation ISDeferredDealloc

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_402);
  }
  return (id)sharedInstance__sharedInstance;
}

ISDeferredDealloc *__35__ISDeferredDealloc_sharedInstance__block_invoke()
{
  result = objc_alloc_init(ISDeferredDealloc);
  sharedInstance__sharedInstance = (uint64_t)result;
  return result;
}

void __45__ISDeferredDealloc__performDeferredDealloc___block_invoke(uint64_t a1)
{
  v1 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__ISDeferredDealloc__performDeferredDealloc___block_invoke_2;
  block[3] = &unk_1E6BECD80;
  block[4] = *(void *)(a1 + 40);
  dispatch_async(v1, block);
}

- (void)_performDeferredDealloc:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __45__ISDeferredDealloc__performDeferredDealloc___block_invoke;
    v6[3] = &unk_1E6BECF48;
    v6[4] = self;
    v6[5] = a3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
  }
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_deferredDeallocQueue);
  self->_deferredDeallocQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)ISDeferredDealloc;
  [(ISDeferredDealloc *)&v3 dealloc];
}

void __45__ISDeferredDealloc__performDeferredDealloc___block_invoke_2(uint64_t a1)
{
}

- (void)_performDeferredDealloc:(id)a3 withDelay:(double)a4
{
  if (a3)
  {
    id v7 = a3;
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    deferredDeallocQueue = self->_deferredDeallocQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__ISDeferredDealloc__performDeferredDealloc_withDelay___block_invoke;
    block[3] = &unk_1E6BECD80;
    block[4] = a3;
    dispatch_after(v8, deferredDeallocQueue, block);
  }
}

void __55__ISDeferredDealloc__performDeferredDealloc_withDelay___block_invoke(uint64_t a1)
{
}

- (ISDeferredDealloc)init
{
  v5.receiver = self;
  v5.super_class = (Class)ISDeferredDealloc;
  v2 = [(ISDeferredDealloc *)&v5 init];
  if (v2)
  {
    objc_super v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v2->_deferredDeallocQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.deferred-dealloc", v3);
  }
  return v2;
}

@end