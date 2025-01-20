@interface RBTimeProvider
+ (id)sharedInstance;
- (double)startTimeForProcess:(id)a3;
- (id)executeWithCancellingAfter:(double)a3 onQueue:(id)a4 block:(id)a5;
- (void)executeAfter:(double)a3 onQueue:(id)a4 block:(id)a5;
@end

@implementation RBTimeProvider

- (id)executeWithCancellingAfter:(double)a3 onQueue:(id)a4 block:(id)a5
{
  int64_t v6 = (uint64_t)(a3 * 1000000000.0);
  id v7 = a5;
  v8 = a4;
  dispatch_time_t v9 = dispatch_time(0, v6);
  v10 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v8);

  dispatch_set_context(v10, v10);
  dispatch_source_set_timer(v10, v9, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
  dispatch_source_set_event_handler(v10, v7);

  dispatch_activate(v10);
  v11 = +[RBTimeProviderEvent eventWithSource:v10];

  return v11;
}

- (void)executeAfter:(double)a3 onQueue:(id)a4 block:(id)a5
{
  int64_t v6 = (uint64_t)(a3 * 1000000000.0);
  id v7 = a5;
  queue = a4;
  dispatch_time_t v8 = dispatch_time(0, v6);
  dispatch_after(v8, queue, v7);
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_result;
  return v2;
}

uint64_t __32__RBTimeProvider_sharedInstance__block_invoke()
{
  sharedInstance_result = objc_alloc_init(RBTimeProvider);
  return MEMORY[0x270F9A758]();
}

- (double)startTimeForProcess:(id)a3
{
  [a3 processStartTime];
  return result;
}

@end