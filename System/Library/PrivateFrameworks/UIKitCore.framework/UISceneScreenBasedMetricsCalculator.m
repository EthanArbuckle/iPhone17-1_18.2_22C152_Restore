@interface UISceneScreenBasedMetricsCalculator
@end

@implementation UISceneScreenBasedMetricsCalculator

void __73___UISceneScreenBasedMetricsCalculator__updateMetricsOnWindows_animated___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_msgSend(v7, "_isWindowServerHostingManaged", (void)v8)
          && ([v7 _sceneOrientation] != *(void *)(a1 + 40)
           || [v7 _sceneClientOrientation] != *(void *)(a1 + 48)))
        {
          [v7 _updateTransformLayer];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

@end