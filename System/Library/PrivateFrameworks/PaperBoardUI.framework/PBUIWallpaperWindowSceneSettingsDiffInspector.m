@interface PBUIWallpaperWindowSceneSettingsDiffInspector
- (void)_observeOtherSetting:(unint64_t)a3 withBlock:(id)a4;
- (void)observeCachingIdentifierWithBlock:(id)a3;
- (void)observeDisallowHomescreenRasterizationWithBlock:(id)a3;
- (void)observeDisallowLockscreenRasterizationWithBlock:(id)a3;
- (void)observeHomescreenStyleChangesDelayedWithBlock:(id)a3;
- (void)observeHomescreenStyleTransitionStateWithBlock:(id)a3;
- (void)observeHomescreenWallpaperAlphaWithBlock:(id)a3;
- (void)observeHomescreenWallpaperHiddenWithBlock:(id)a3;
- (void)observeLiveWallpaperInteractiveWithBlock:(id)a3;
- (void)observeLiveWallpaperTouchActiveWithBlock:(id)a3;
- (void)observeLockscreenOnlyWallpaperAlphaWithBlock:(id)a3;
- (void)observeLockscreenStyleTransitionStateWithBlock:(id)a3;
- (void)observeLockscreenWallpaperAlphaWithBlock:(id)a3;
- (void)observeLockscreenWallpaperContentsRectWithBlock:(id)a3;
- (void)observeLockscreenWallpaperHiddenWithBlock:(id)a3;
- (void)observeWallpaperAnimationSuspendedWithBlock:(id)a3;
- (void)observeWallpaperRequiredWithBlock:(id)a3;
- (void)observeWallpaperVariantWithBlock:(id)a3;
@end

@implementation PBUIWallpaperWindowSceneSettingsDiffInspector

- (void)observeWallpaperVariantWithBlock:(id)a3
{
}

- (void)observeLockscreenWallpaperContentsRectWithBlock:(id)a3
{
}

- (void)observeLockscreenWallpaperAlphaWithBlock:(id)a3
{
}

- (void)observeHomescreenWallpaperAlphaWithBlock:(id)a3
{
}

- (void)observeLockscreenOnlyWallpaperAlphaWithBlock:(id)a3
{
}

- (void)observeDisallowHomescreenRasterizationWithBlock:(id)a3
{
}

- (void)observeDisallowLockscreenRasterizationWithBlock:(id)a3
{
}

- (void)observeHomescreenWallpaperHiddenWithBlock:(id)a3
{
}

- (void)observeLockscreenWallpaperHiddenWithBlock:(id)a3
{
}

- (void)observeWallpaperAnimationSuspendedWithBlock:(id)a3
{
}

- (void)observeWallpaperRequiredWithBlock:(id)a3
{
}

- (void)observeHomescreenStyleChangesDelayedWithBlock:(id)a3
{
}

- (void)observeCachingIdentifierWithBlock:(id)a3
{
}

- (void)observeHomescreenStyleTransitionStateWithBlock:(id)a3
{
}

- (void)observeLockscreenStyleTransitionStateWithBlock:(id)a3
{
}

- (void)observeLiveWallpaperTouchActiveWithBlock:(id)a3
{
}

- (void)observeLiveWallpaperInteractiveWithBlock:(id)a3
{
}

- (void)_observeOtherSetting:(unint64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __80__PBUIWallpaperWindowSceneSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke;
    v8[3] = &unk_1E62B38F8;
    id v9 = v6;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:a3 withBlock:v8];
  }
}

uint64_t __80__PBUIWallpaperWindowSceneSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end