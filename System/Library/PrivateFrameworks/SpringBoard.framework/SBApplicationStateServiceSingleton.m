@interface SBApplicationStateServiceSingleton
+ (void)startService;
@end

@implementation SBApplicationStateServiceSingleton

+ (void)startService
{
  if (startService_onceToken != -1) {
    dispatch_once(&startService_onceToken, &__block_literal_global_6);
  }
}

uint64_t __50__SBApplicationStateServiceSingleton_startService__block_invoke()
{
  v0 = objc_alloc_init(SBApplicationStateServiceDelegate);
  v1 = (void *)__delegate;
  __delegate = (uint64_t)v0;

  id v2 = objc_alloc(MEMORY[0x1E4FB33A0]);
  v3 = [MEMORY[0x1E4F42738] _systemAnimationFenceExemptQueue];
  uint64_t v4 = [v2 initWithCalloutQueue:v3];
  v5 = (void *)__singleton;
  __singleton = v4;

  v6 = (void *)__singleton;
  uint64_t v7 = __delegate;
  return [v6 setDelegate:v7];
}

@end