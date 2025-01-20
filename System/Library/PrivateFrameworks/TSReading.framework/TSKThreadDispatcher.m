@interface TSKThreadDispatcher
+ (id)sharedInstance;
- (id)p_dispatchQueue;
- (void)dispatch:(id)a3;
- (void)dispatchSelector:(SEL)a3 target:(id)a4 argument:(id)a5;
@end

@implementation TSKThreadDispatcher

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__TSKThreadDispatcher_sharedInstance__block_invoke;
  block[3] = &unk_2646AF7B8;
  block[4] = a1;
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, block);
  }
  return (id)sharedInstance_sInstance;
}

id __37__TSKThreadDispatcher_sharedInstance__block_invoke(uint64_t a1)
{
  id result = objc_alloc_init(*(Class *)(a1 + 32));
  sharedInstance_sInstance = (uint64_t)result;
  return result;
}

- (void)dispatch:(id)a3
{
  v4 = [(TSKThreadDispatcher *)self p_dispatchQueue];

  dispatch_async(v4, a3);
}

- (void)dispatchSelector:(SEL)a3 target:(id)a4 argument:(id)a5
{
  v8 = [(TSKThreadDispatcher *)self p_dispatchQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__TSKThreadDispatcher_dispatchSelector_target_argument___block_invoke;
  block[3] = &unk_2646B06B0;
  void block[5] = a5;
  block[6] = a3;
  block[4] = a4;
  dispatch_async(v8, block);
}

uint64_t __56__TSKThreadDispatcher_dispatchSelector_target_argument___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performSelector:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40)];
}

- (id)p_dispatchQueue
{
  return dispatch_get_global_queue(0, 0);
}

@end