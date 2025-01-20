@interface BLSBacklightFBSSceneEnvironment
@end

@implementation BLSBacklightFBSSceneEnvironment

id __56__BLSBacklightFBSSceneEnvironment_UIKit__initWithScene___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = bls_scenes_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v5 = [*(id *)(a1 + 32) debugDescription];
    int v6 = 138412290;
    v7 = v5;
    _os_log_debug_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEBUG, "create BLSBacklightFBSSceneEnvironment (BacklightUIServices) for scene:%@", (uint8_t *)&v6, 0xCu);
  }
  v3 = (void *)[*(id *)(a1 + 40) initWithFBSScene:*(void *)(a1 + 48)];
  return v3;
}

@end