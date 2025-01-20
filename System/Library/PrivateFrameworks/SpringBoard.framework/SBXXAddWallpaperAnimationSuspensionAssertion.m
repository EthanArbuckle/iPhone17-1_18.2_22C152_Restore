@interface SBXXAddWallpaperAnimationSuspensionAssertion
@end

@implementation SBXXAddWallpaperAnimationSuspensionAssertion

void ___SBXXAddWallpaperAnimationSuspensionAssertion_block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = +[SBWallpaperController sharedInstance];
  v3 = SBLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v4;
    _os_log_impl(&dword_1D85BA000, v3, OS_LOG_TYPE_INFO, "Disabling dynamic wallpapers and parallax for assertion with reason=%@", buf, 0xCu);
  }

  v5 = [v2 suspendWallpaperAnimationForReason:*(void *)(a1 + 32)];
  [MEMORY[0x1E4F42FF0] animateWithDuration:&__block_literal_global_166 animations:0.1];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F4F770]) initWithPort:*(unsigned int *)(a1 + 40)];
  v7 = (void *)MEMORY[0x1E4F4F7E0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___SBXXAddWallpaperAnimationSuspensionAssertion_block_invoke_2;
  v9[3] = &unk_1E6AF5290;
  id v10 = *(id *)(a1 + 32);
  id v11 = v5;
  id v8 = v5;
  [v7 monitorSendRight:v6 withHandler:v9];
}

uint64_t ___SBXXAddWallpaperAnimationSuspensionAssertion_block_invoke_164()
{
  return [MEMORY[0x1E4F42FF0] _recenterMotionEffects];
}

void ___SBXXAddWallpaperAnimationSuspensionAssertion_block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = ___SBXXAddWallpaperAnimationSuspensionAssertion_block_invoke_3;
  v2[3] = &unk_1E6AF5290;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t ___SBXXAddWallpaperAnimationSuspensionAssertion_block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = SBLogCommon();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1D85BA000, v2, OS_LOG_TYPE_INFO, "Re-enabling dynamic wallpapers and parallax for assertion with reason=%@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) invalidate];
}

@end