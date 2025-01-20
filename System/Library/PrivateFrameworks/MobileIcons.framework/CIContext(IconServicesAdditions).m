@interface CIContext(IconServicesAdditions)
+ (uint64_t)_MI_sharedIconCompositorContext;
@end

@implementation CIContext(IconServicesAdditions)

+ (uint64_t)_MI_sharedIconCompositorContext
{
  if (_MI_sharedIconCompositorContext_onceToken != -1) {
    dispatch_once(&_MI_sharedIconCompositorContext_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)_MI_sharedIconCompositorContext_contextCacheClearScheduler;
  return [v0 object];
}

@end