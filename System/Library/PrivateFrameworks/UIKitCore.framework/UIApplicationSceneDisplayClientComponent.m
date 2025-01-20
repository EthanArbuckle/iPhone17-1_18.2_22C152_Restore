@interface UIApplicationSceneDisplayClientComponent
@end

@implementation UIApplicationSceneDisplayClientComponent

void __69___UIApplicationSceneDisplayClientComponent_scene_didUpdateSettings___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v1 = objc_msgSend(*(id *)(a1 + 32), "windows", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v8;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        [v6 _sceneSettingsSafeAreaInsetsDidChange];
        [v6 layoutIfNeeded];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v3);
  }
}

@end