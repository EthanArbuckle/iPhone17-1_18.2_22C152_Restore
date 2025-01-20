@interface PBUIWallpaperWindowSceneClientSettingsDiffInspector
- (void)_observeOtherSetting:(unint64_t)a3 withBlock:(id)a4;
- (void)observeHomescreenAverageColorWithBlock:(id)a3;
- (void)observeHomescreenContentStaticWithBlock:(id)a3;
- (void)observeHomescreenContrastWithBlock:(id)a3;
- (void)observeHomescreenLegibilitySettingsWithBlock:(id)a3;
- (void)observeHomescreenMinimumWallpaperScaleWithBlock:(id)a3;
- (void)observeHomescreenParallaxEnabledWithBlock:(id)a3;
- (void)observeHomescreenParallaxFactorWithBlock:(id)a3;
- (void)observeHomescreenZoomFactorWithBlock:(id)a3;
- (void)observeLiveWallpaperPlaybackStateWithBlock:(id)a3;
- (void)observeLockscreenAverageColorWithBlock:(id)a3;
- (void)observeLockscreenContentLiveWallpaperWithBlock:(id)a3;
- (void)observeLockscreenContentStaticWithBlock:(id)a3;
- (void)observeLockscreenContrastWithBlock:(id)a3;
- (void)observeLockscreenLegibilitySettingsWithBlock:(id)a3;
- (void)observeLockscreenMinimumWallpaperScaleWithBlock:(id)a3;
- (void)observeLockscreenParallaxEnabledWithBlock:(id)a3;
- (void)observeLockscreenParallaxFactorWithBlock:(id)a3;
- (void)observeLockscreenZoomFactorWithBlock:(id)a3;
@end

@implementation PBUIWallpaperWindowSceneClientSettingsDiffInspector

- (void)observeHomescreenMinimumWallpaperScaleWithBlock:(id)a3
{
}

- (void)observeLockscreenMinimumWallpaperScaleWithBlock:(id)a3
{
}

- (void)observeHomescreenLegibilitySettingsWithBlock:(id)a3
{
}

- (void)observeLockscreenLegibilitySettingsWithBlock:(id)a3
{
}

- (void)observeHomescreenAverageColorWithBlock:(id)a3
{
}

- (void)observeLockscreenAverageColorWithBlock:(id)a3
{
}

- (void)observeHomescreenContrastWithBlock:(id)a3
{
}

- (void)observeLockscreenContrastWithBlock:(id)a3
{
}

- (void)observeHomescreenParallaxFactorWithBlock:(id)a3
{
}

- (void)observeLockscreenParallaxFactorWithBlock:(id)a3
{
}

- (void)observeHomescreenParallaxEnabledWithBlock:(id)a3
{
}

- (void)observeLockscreenParallaxEnabledWithBlock:(id)a3
{
}

- (void)observeHomescreenZoomFactorWithBlock:(id)a3
{
}

- (void)observeLockscreenZoomFactorWithBlock:(id)a3
{
}

- (void)observeHomescreenContentStaticWithBlock:(id)a3
{
}

- (void)observeLockscreenContentStaticWithBlock:(id)a3
{
}

- (void)observeLockscreenContentLiveWallpaperWithBlock:(id)a3
{
}

- (void)observeLiveWallpaperPlaybackStateWithBlock:(id)a3
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
    v8[2] = __86__PBUIWallpaperWindowSceneClientSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke;
    v8[3] = &unk_1E62B38F8;
    id v9 = v6;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:a3 withBlock:v8];
  }
}

uint64_t __86__PBUIWallpaperWindowSceneClientSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end