@interface VisionCoreFrameworkManager
+ (id)sharedManager;
- (VisionCoreObjectCache)inferenceNetworkDescriptorsCache;
@end

@implementation VisionCoreFrameworkManager

- (VisionCoreObjectCache)inferenceNetworkDescriptorsCache
{
  return (VisionCoreObjectCache *)objc_getProperty(self, a2, 8, 1);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedManager_manager;
  return v2;
}

void __43__VisionCoreFrameworkManager_sharedManager__block_invoke()
{
  v0 = [VisionCoreFrameworkManager alloc];
  if (v0)
  {
    v5.receiver = v0;
    v5.super_class = (Class)VisionCoreFrameworkManager;
    v1 = objc_msgSendSuper2(&v5, sel_init);
    if (v1)
    {
      v2 = objc_alloc_init(VisionCoreObjectCache);
      v3 = (void *)v1[1];
      v1[1] = v2;
    }
  }
  else
  {
    v1 = 0;
  }
  v4 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v1;
}

- (void).cxx_destruct
{
}

@end