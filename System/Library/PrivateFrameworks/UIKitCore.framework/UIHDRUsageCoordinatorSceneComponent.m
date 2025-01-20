@interface UIHDRUsageCoordinatorSceneComponent
@end

@implementation UIHDRUsageCoordinatorSceneComponent

uint64_t __61___UIHDRUsageCoordinatorSceneComponent__powerStateDidChange___block_invoke(uint64_t a1)
{
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[8])
  {
    v3 = +[_UIHDRUsageCoordinator sharedInstance]();
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    -[_UIHDRUsageCoordinator prepareSceneForLowPowerModeChange:]((uint64_t)v3, WeakRetained);

    v2 = *(unsigned char **)(a1 + 32);
  }
  return [v2 _invalidateTraitOverrides];
}

@end