@interface ULScheduler
+ (ULScheduler)globalAsyncScheduler;
+ (ULScheduler)immediateScheduler;
+ (id)dispatchQueueSchedulerWithQueue:(id)a3;
@end

@implementation ULScheduler

+ (ULScheduler)immediateScheduler
{
  if (immediateScheduler_ul_once_token_0 != -1) {
    dispatch_once(&immediateScheduler_ul_once_token_0, &__block_literal_global_3);
  }
  v2 = (void *)immediateScheduler_ul_once_object_0;

  return (ULScheduler *)v2;
}

uint64_t __33__ULScheduler_immediateScheduler__block_invoke()
{
  immediateScheduler_ul_once_object_0 = objc_alloc_init(ULImmediateScheduler);

  return MEMORY[0x270F9A758]();
}

+ (ULScheduler)globalAsyncScheduler
{
  if (globalAsyncScheduler_ul_once_token_1 != -1) {
    dispatch_once(&globalAsyncScheduler_ul_once_token_1, &__block_literal_global_65);
  }
  v2 = (void *)globalAsyncScheduler_ul_once_object_1;

  return (ULScheduler *)v2;
}

void __35__ULScheduler_globalAsyncScheduler__block_invoke()
{
  v0 = [ULQueueScheduler alloc];
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.MicroLocationUtilities.ULGlobalAsyncScheduler", v4);
  uint64_t v2 = [(ULQueueScheduler *)v0 initWithQueue:v1];
  v3 = (void *)globalAsyncScheduler_ul_once_object_1;
  globalAsyncScheduler_ul_once_object_1 = v2;
}

+ (id)dispatchQueueSchedulerWithQueue:(id)a3
{
  id v3 = a3;
  v4 = [[ULQueueScheduler alloc] initWithQueue:v3];

  return v4;
}

@end