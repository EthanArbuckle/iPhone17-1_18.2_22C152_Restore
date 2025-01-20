@interface PBUIWallpaperWindowScene
- (BOOL)disallowHomescreenRasterization;
- (BOOL)disallowLockscreenRasterization;
- (BOOL)homescreenParallaxEnabled;
- (BOOL)homescreenStyleChangesDelayed;
- (BOOL)homescreenWallpaperHidden;
- (BOOL)isHomescreenContentStatic;
- (BOOL)isLockscreenContentLiveWallpaper;
- (BOOL)isLockscreenContentStatic;
- (BOOL)liveWallpaperInteractive;
- (BOOL)liveWallpaperTouchActive;
- (BOOL)lockscreenParallaxEnabled;
- (BOOL)lockscreenWallpaperHidden;
- (BOOL)wallpaperAnimationSuspended;
- (BOOL)wallpaperRequired;
- (CGRect)lockscreenWallpaperContentsRect;
- (NSString)cachingIdentifier;
- (PBUIWallpaperWindowSceneStyleTransitionState)homescreenStyleTransitionState;
- (PBUIWallpaperWindowSceneStyleTransitionState)lockscreenStyleTransitionState;
- (UIColor)homescreenAverageColor;
- (UIColor)lockscreenAverageColor;
- (_UILegibilitySettings)homescreenLegibilitySettings;
- (_UILegibilitySettings)lockscreenLegibilitySettings;
- (double)homescreenContrast;
- (double)homescreenMinimumWallpaperScale;
- (double)homescreenParallaxFactor;
- (double)homescreenWallpaperAlpha;
- (double)homescreenZoomFactor;
- (double)lockscreenContrast;
- (double)lockscreenMinimumWallpaperScale;
- (double)lockscreenOnlyWallpaperAlpha;
- (double)lockscreenParallaxFactor;
- (double)lockscreenWallpaperAlpha;
- (double)lockscreenZoomFactor;
- (id)_wallpaperSceneClientSettings;
- (id)_wallpaperSceneSettings;
- (int64_t)liveWallpaperPlaybackState;
- (int64_t)wallpaperVariant;
- (void)_handleImageSlotRequestAction:(id)a3;
- (void)_handlePreheatAction:(id)a3;
- (void)_handleUpdateAndPrewarmAction:(id)a3;
- (void)_handleUpdateLocationsAction:(id)a3;
- (void)_handleWallpaperEffectImageRequestAction:(id)a3;
- (void)_updateDisallowRasterizationForHomescreen:(BOOL)a3 lockscreen:(BOOL)a4;
- (void)_updateHomescreenStyleChangesDelayed:(BOOL)a3;
- (void)_updateHomescreenStyleTransitionStateTo:(id)a3 from:(id)a4;
- (void)_updateHomescreenWallpaperAlpha:(double)a3;
- (void)_updateLiveWallpaperInteractive:(BOOL)a3;
- (void)_updateLiveWallpaperTouchActive:(BOOL)a3;
- (void)_updateLockscreenOnlyWallpaperAlpha:(double)a3;
- (void)_updateLockscreenStyleTransitionStateTo:(id)a3 from:(id)a4;
- (void)_updateLockscreenWallpaperAlpha:(double)a3;
- (void)_updateLockscreenWallpaperContentsRect:(CGRect)a3;
- (void)_updateWallpaperAnimationSuspended:(BOOL)a3;
- (void)_updateWallpaperHiddenForHomescreen:(BOOL)a3 lockscreen:(BOOL)a4;
- (void)_updateWallpaperRequired:(BOOL)a3;
- (void)_updateWallpaperSceneClientSettingsWithBlock:(id)a3;
- (void)_updateWallpaperVariant:(int64_t)a3 inAnimationSettings:(id)a4 outAnimationSettings:(id)a5;
- (void)noteWallpaperDidChangeForVariant:(int64_t)a3;
- (void)noteWallpaperDidCompleteWallpaperChange;
- (void)noteWallpaperWillChangeForVariant:(int64_t)a3;
- (void)setHomescreenAverageColor:(id)a3;
- (void)setHomescreenContentStatic:(BOOL)a3;
- (void)setHomescreenContrast:(double)a3;
- (void)setHomescreenLegibilitySettings:(id)a3;
- (void)setHomescreenMinimumWallpaperScale:(double)a3;
- (void)setHomescreenParallaxEnabled:(BOOL)a3;
- (void)setHomescreenParallaxFactor:(double)a3;
- (void)setHomescreenZoomFactor:(double)a3;
- (void)setLiveWallpaperPlaybackState:(int64_t)a3;
- (void)setLockscreenAverageColor:(id)a3;
- (void)setLockscreenContentIsLiveWallpaper:(BOOL)a3;
- (void)setLockscreenContentStatic:(BOOL)a3;
- (void)setLockscreenContrast:(double)a3;
- (void)setLockscreenLegibilitySettings:(id)a3;
- (void)setLockscreenMinimumWallpaperScale:(double)a3;
- (void)setLockscreenParallaxEnabled:(BOOL)a3;
- (void)setLockscreenParallaxFactor:(double)a3;
- (void)setLockscreenZoomFactor:(double)a3;
@end

@implementation PBUIWallpaperWindowScene

- (int64_t)wallpaperVariant
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  int64_t v3 = [v2 wallpaperVariant];

  return v3;
}

- (CGRect)lockscreenWallpaperContentsRect
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  [v2 lockscreenWallpaperContentsRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)lockscreenWallpaperAlpha
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  [v2 lockscreenWallpaperAlpha];
  double v4 = v3;

  return v4;
}

- (double)homescreenWallpaperAlpha
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  [v2 homescreenWallpaperAlpha];
  double v4 = v3;

  return v4;
}

- (double)lockscreenOnlyWallpaperAlpha
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  [v2 lockscreenOnlyWallpaperAlpha];
  double v4 = v3;

  return v4;
}

- (BOOL)disallowHomescreenRasterization
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  char v3 = [v2 disallowHomescreenRasterization];

  return v3;
}

- (BOOL)disallowLockscreenRasterization
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  char v3 = [v2 disallowLockscreenRasterization];

  return v3;
}

- (BOOL)wallpaperAnimationSuspended
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  char v3 = [v2 wallpaperAnimationSuspended];

  return v3;
}

- (BOOL)wallpaperRequired
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  char v3 = [v2 wallpaperRequired];

  return v3;
}

- (BOOL)homescreenStyleChangesDelayed
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  char v3 = [v2 homescreenStyleChangesDelayed];

  return v3;
}

- (NSString)cachingIdentifier
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  char v3 = [v2 cachingIdentifier];

  return (NSString *)v3;
}

- (PBUIWallpaperWindowSceneStyleTransitionState)homescreenStyleTransitionState
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  char v3 = [v2 homescreenStyleTransitionState];

  return (PBUIWallpaperWindowSceneStyleTransitionState *)v3;
}

- (PBUIWallpaperWindowSceneStyleTransitionState)lockscreenStyleTransitionState
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  char v3 = [v2 lockscreenStyleTransitionState];

  return (PBUIWallpaperWindowSceneStyleTransitionState *)v3;
}

- (BOOL)liveWallpaperTouchActive
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  char v3 = [v2 liveWallpaperTouchActive];

  return v3;
}

- (BOOL)liveWallpaperInteractive
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneSettings];
  char v3 = [v2 liveWallpaperInteractive];

  return v3;
}

- (double)homescreenMinimumWallpaperScale
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  [v2 homescreenMinimumWallpaperScale];
  double v4 = v3;

  return v4;
}

- (void)setHomescreenMinimumWallpaperScale:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__PBUIWallpaperWindowScene_setHomescreenMinimumWallpaperScale___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&v3[4] = a3;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v3];
}

uint64_t __63__PBUIWallpaperWindowScene_setHomescreenMinimumWallpaperScale___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHomescreenMinimumWallpaperScale:*(double *)(a1 + 32)];
}

- (double)lockscreenMinimumWallpaperScale
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  [v2 lockscreenMinimumWallpaperScale];
  double v4 = v3;

  return v4;
}

- (void)setLockscreenMinimumWallpaperScale:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __63__PBUIWallpaperWindowScene_setLockscreenMinimumWallpaperScale___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&v3[4] = a3;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v3];
}

uint64_t __63__PBUIWallpaperWindowScene_setLockscreenMinimumWallpaperScale___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLockscreenMinimumWallpaperScale:*(double *)(a1 + 32)];
}

- (_UILegibilitySettings)homescreenLegibilitySettings
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  double v3 = [v2 homescreenLegibilitySettings];

  return (_UILegibilitySettings *)v3;
}

- (void)setHomescreenLegibilitySettings:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PBUIWallpaperWindowScene_setHomescreenLegibilitySettings___block_invoke;
  v6[3] = &unk_1E62B3088;
  id v7 = v4;
  id v5 = v4;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v6];
}

uint64_t __60__PBUIWallpaperWindowScene_setHomescreenLegibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHomescreenLegibilitySettings:*(void *)(a1 + 32)];
}

- (_UILegibilitySettings)lockscreenLegibilitySettings
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  double v3 = [v2 lockscreenLegibilitySettings];

  return (_UILegibilitySettings *)v3;
}

- (void)setLockscreenLegibilitySettings:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PBUIWallpaperWindowScene_setLockscreenLegibilitySettings___block_invoke;
  v6[3] = &unk_1E62B3088;
  id v7 = v4;
  id v5 = v4;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v6];
}

uint64_t __60__PBUIWallpaperWindowScene_setLockscreenLegibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLockscreenLegibilitySettings:*(void *)(a1 + 32)];
}

- (UIColor)homescreenAverageColor
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  double v3 = [v2 homescreenAverageColor];

  return (UIColor *)v3;
}

- (void)setHomescreenAverageColor:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PBUIWallpaperWindowScene_setHomescreenAverageColor___block_invoke;
  v6[3] = &unk_1E62B3088;
  id v7 = v4;
  id v5 = v4;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v6];
}

uint64_t __54__PBUIWallpaperWindowScene_setHomescreenAverageColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHomescreenAverageColor:*(void *)(a1 + 32)];
}

- (UIColor)lockscreenAverageColor
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  double v3 = [v2 lockscreenAverageColor];

  return (UIColor *)v3;
}

- (void)setLockscreenAverageColor:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PBUIWallpaperWindowScene_setLockscreenAverageColor___block_invoke;
  v6[3] = &unk_1E62B3088;
  id v7 = v4;
  id v5 = v4;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v6];
}

uint64_t __54__PBUIWallpaperWindowScene_setLockscreenAverageColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLockscreenAverageColor:*(void *)(a1 + 32)];
}

- (double)homescreenContrast
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  [v2 homescreenContrast];
  double v4 = v3;

  return v4;
}

- (void)setHomescreenContrast:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__PBUIWallpaperWindowScene_setHomescreenContrast___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&v3[4] = a3;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v3];
}

uint64_t __50__PBUIWallpaperWindowScene_setHomescreenContrast___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHomescreenContrast:*(double *)(a1 + 32)];
}

- (double)lockscreenContrast
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  [v2 lockscreenContrast];
  double v4 = v3;

  return v4;
}

- (void)setLockscreenContrast:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__PBUIWallpaperWindowScene_setLockscreenContrast___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&v3[4] = a3;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v3];
}

uint64_t __50__PBUIWallpaperWindowScene_setLockscreenContrast___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLockscreenContrast:*(double *)(a1 + 32)];
}

- (double)homescreenParallaxFactor
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  [v2 homescreenParallaxFactor];
  double v4 = v3;

  return v4;
}

- (void)setHomescreenParallaxFactor:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__PBUIWallpaperWindowScene_setHomescreenParallaxFactor___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&v3[4] = a3;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v3];
}

uint64_t __56__PBUIWallpaperWindowScene_setHomescreenParallaxFactor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHomescreenParallaxFactor:*(double *)(a1 + 32)];
}

- (double)lockscreenParallaxFactor
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  [v2 lockscreenParallaxFactor];
  double v4 = v3;

  return v4;
}

- (void)setLockscreenParallaxFactor:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __56__PBUIWallpaperWindowScene_setLockscreenParallaxFactor___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&v3[4] = a3;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v3];
}

uint64_t __56__PBUIWallpaperWindowScene_setLockscreenParallaxFactor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLockscreenParallaxFactor:*(double *)(a1 + 32)];
}

- (BOOL)homescreenParallaxEnabled
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  char v3 = [v2 homescreenParallaxEnabled];

  return v3;
}

- (void)setHomescreenParallaxEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__PBUIWallpaperWindowScene_setHomescreenParallaxEnabled___block_invoke;
  v3[3] = &__block_descriptor_33_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  BOOL v4 = a3;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v3];
}

uint64_t __57__PBUIWallpaperWindowScene_setHomescreenParallaxEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHomescreenParallaxEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)lockscreenParallaxEnabled
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  char v3 = [v2 lockscreenParallaxEnabled];

  return v3;
}

- (void)setLockscreenParallaxEnabled:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__PBUIWallpaperWindowScene_setLockscreenParallaxEnabled___block_invoke;
  v3[3] = &__block_descriptor_33_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  BOOL v4 = a3;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v3];
}

uint64_t __57__PBUIWallpaperWindowScene_setLockscreenParallaxEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLockscreenParallaxEnabled:*(unsigned __int8 *)(a1 + 32)];
}

- (double)homescreenZoomFactor
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  [v2 homescreenZoomFactor];
  double v4 = v3;

  return v4;
}

- (void)setHomescreenZoomFactor:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__PBUIWallpaperWindowScene_setHomescreenZoomFactor___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&void v3[4] = a3;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v3];
}

uint64_t __52__PBUIWallpaperWindowScene_setHomescreenZoomFactor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHomescreenZoomFactor:*(double *)(a1 + 32)];
}

- (double)lockscreenZoomFactor
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  [v2 lockscreenZoomFactor];
  double v4 = v3;

  return v4;
}

- (void)setLockscreenZoomFactor:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__PBUIWallpaperWindowScene_setLockscreenZoomFactor___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  *(double *)&void v3[4] = a3;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v3];
}

uint64_t __52__PBUIWallpaperWindowScene_setLockscreenZoomFactor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLockscreenZoomFactor:*(double *)(a1 + 32)];
}

- (BOOL)isHomescreenContentStatic
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  char v3 = [v2 isHomescreenContentStatic];

  return v3;
}

- (void)setHomescreenContentStatic:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__PBUIWallpaperWindowScene_setHomescreenContentStatic___block_invoke;
  v3[3] = &__block_descriptor_33_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  BOOL v4 = a3;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v3];
}

uint64_t __55__PBUIWallpaperWindowScene_setHomescreenContentStatic___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHomescreenContentStatic:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)isLockscreenContentStatic
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  char v3 = [v2 isLockscreenContentStatic];

  return v3;
}

- (void)setLockscreenContentStatic:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__PBUIWallpaperWindowScene_setLockscreenContentStatic___block_invoke;
  v3[3] = &__block_descriptor_33_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  BOOL v4 = a3;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v3];
}

uint64_t __55__PBUIWallpaperWindowScene_setLockscreenContentStatic___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLockscreenContentStatic:*(unsigned __int8 *)(a1 + 32)];
}

- (BOOL)isLockscreenContentLiveWallpaper
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  char v3 = [v2 isLockscreenContentLiveWallpaper];

  return v3;
}

- (void)setLockscreenContentIsLiveWallpaper:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64__PBUIWallpaperWindowScene_setLockscreenContentIsLiveWallpaper___block_invoke;
  v3[3] = &__block_descriptor_33_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  BOOL v4 = a3;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v3];
}

uint64_t __64__PBUIWallpaperWindowScene_setLockscreenContentIsLiveWallpaper___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLockscreenContentLiveWallpaper:*(unsigned __int8 *)(a1 + 32)];
}

- (int64_t)liveWallpaperPlaybackState
{
  v2 = [(PBUIWallpaperWindowScene *)self _wallpaperSceneClientSettings];
  int64_t v3 = [v2 liveWallpaperPlaybackState];

  return v3;
}

- (void)setLiveWallpaperPlaybackState:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __58__PBUIWallpaperWindowScene_setLiveWallpaperPlaybackState___block_invoke;
  v3[3] = &__block_descriptor_40_e55_v16__0__PBUIMutableWallpaperWindowSceneClientSettings_8l;
  void v3[4] = a3;
  [(PBUIWallpaperWindowScene *)self _updateWallpaperSceneClientSettingsWithBlock:v3];
}

uint64_t __58__PBUIWallpaperWindowScene_setLiveWallpaperPlaybackState___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setLiveWallpaperPlaybackState:*(void *)(a1 + 32)];
}

- (void)noteWallpaperWillChangeForVariant:(int64_t)a3
{
  id v7 = [(PBUIWallpaperWindowScene *)self _FBSScene];
  BOOL v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [[PBUIWallpaperWillChangeAction alloc] initWithVariant:a3];
  double v6 = [v4 setWithObject:v5];
  [v7 sendActions:v6];
}

- (void)noteWallpaperDidChangeForVariant:(int64_t)a3
{
  id v7 = [(PBUIWallpaperWindowScene *)self _FBSScene];
  BOOL v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = [[PBUIWallpaperDidChangeAction alloc] initWithVariant:a3];
  double v6 = [v4 setWithObject:v5];
  [v7 sendActions:v6];
}

- (void)noteWallpaperDidCompleteWallpaperChange
{
  id v5 = [(PBUIWallpaperWindowScene *)self _FBSScene];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  int64_t v3 = objc_alloc_init(PBUIWallpaperDidCompleteWallpaperChangeAction);
  BOOL v4 = [v2 setWithObject:v3];
  [v5 sendActions:v4];
}

- (id)_wallpaperSceneSettings
{
  v2 = [(PBUIWallpaperWindowScene *)self _FBSScene];
  int64_t v3 = [v2 settings];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)_wallpaperSceneClientSettings
{
  v2 = [(PBUIWallpaperWindowScene *)self _FBSScene];
  int64_t v3 = [v2 clientSettings];
  uint64_t v4 = objc_opt_class();
  id v5 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      double v6 = v5;
    }
    else {
      double v6 = 0;
    }
  }
  else
  {
    double v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (void)_updateWallpaperSceneClientSettingsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(PBUIWallpaperWindowScene *)self _FBSScene];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__PBUIWallpaperWindowScene__updateWallpaperSceneClientSettingsWithBlock___block_invoke;
  v7[3] = &unk_1E62B30D0;
  id v8 = v4;
  id v6 = v4;
  [v5 updateClientSettingsWithBlock:v7];
}

void __73__PBUIWallpaperWindowScene__updateWallpaperSceneClientSettingsWithBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  id v7 = v3;
  if (v4)
  {
    if (objc_opt_isKindOfClass()) {
      id v5 = v7;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)_updateWallpaperVariant:(int64_t)a3 inAnimationSettings:(id)a4 outAnimationSettings:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  double v9 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v9 wallpaperWindowScene:self didUpdateVariant:a3 inAnimationSettings:v10 outAnimationSettings:v8];
  }
}

- (void)_updateLockscreenWallpaperContentsRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "wallpaperWindowScene:didUpdateLockscreenWallpaperContentsRect:", self, x, y, width, height);
  }
}

- (void)_updateLockscreenWallpaperAlpha:(double)a3
{
  id v5 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 wallpaperWindowScene:self didUpdateLockscreenWallpaperAlpha:a3];
  }
}

- (void)_updateHomescreenWallpaperAlpha:(double)a3
{
  id v5 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 wallpaperWindowScene:self didUpdateHomescreenWallpaperAlpha:a3];
  }
}

- (void)_updateLockscreenOnlyWallpaperAlpha:(double)a3
{
  id v5 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 wallpaperWindowScene:self didUpdateLockscreenOnlyWallpaperAlpha:a3];
  }
}

- (void)_updateDisallowRasterizationForHomescreen:(BOOL)a3 lockscreen:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 wallpaperWindowScene:self didUpdateRasterizationDisallowedForHomescreen:v5 lockscreen:v4];
  }
}

- (void)_updateWallpaperHiddenForHomescreen:(BOOL)a3 lockscreen:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 wallpaperWindowScene:self didUpdateHomescreenWallpaperHidden:v5 lockscreenWallpaperHidden:v4];
  }
}

- (void)_updateWallpaperAnimationSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 wallpaperWindowScene:self didUpdateWallpaperAnimationSuspended:v3];
  }
}

- (void)_updateWallpaperRequired:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 wallpaperWindowScene:self didUpdateWallpaperRequired:v3];
  }
}

- (void)_updateHomescreenStyleChangesDelayed:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 wallpaperWindowScene:self didUpdateHomescreenStyleChangesDelayed:v3];
  }
}

- (void)_updateHomescreenStyleTransitionStateTo:(id)a3 from:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 wallpaperWindowScene:self didUpdateHomescreenStyleTransitionStateTo:v8 from:v6];
  }
}

- (void)_updateLockscreenStyleTransitionStateTo:(id)a3 from:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 wallpaperWindowScene:self didUpdateLockscreenStyleTransitionStateTo:v8 from:v6];
  }
}

- (void)_updateLiveWallpaperTouchActive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 wallpaperWindowScene:self didUpdateLiveWallpaperTouchActive:v3];
  }
}

- (void)_updateLiveWallpaperInteractive:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 wallpaperWindowScene:self didUpdateLiveWallpaperInteractive:v3];
  }
}

- (void)_handleImageSlotRequestAction:(id)a3
{
  id v4 = a3;
  id v5 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v31 = 0;
    v32 = &v31;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = 0;
    uint64_t v34 = [v4 desiredStyle];
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__2;
    v29 = __Block_byref_object_dispose__2;
    id v30 = 0;
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__2;
    v23 = __Block_byref_object_dispose__2;
    id v24 = 0;
    uint64_t v6 = [v4 variant];
    uint64_t v7 = v32[3];
    id v8 = [v4 traitCollection];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __58__PBUIWallpaperWindowScene__handleImageSlotRequestAction___block_invoke;
    v18[3] = &unk_1E62B2C10;
    v18[4] = &v25;
    v18[5] = &v19;
    v18[6] = &v31;
    [v5 wallpaperWindowScene:self requestsWallpaperEffectImageForVariant:v6 style:v7 traitCollection:v8 result:v18];

    if (v26[5])
    {
      double v9 = [v4 slotIdentifier];
      wallpaperEffectImageSlots = self->_wallpaperEffectImageSlots;
      if (!wallpaperEffectImageSlots)
      {
        double v11 = [[PBUIImageSlotRepository alloc] initWithWindowScene:self];
        double v12 = self->_wallpaperEffectImageSlots;
        self->_wallpaperEffectImageSlots = v11;

        wallpaperEffectImageSlots = self->_wallpaperEffectImageSlots;
      }
      [(id)v26[5] size];
      -[PBUIImageSlotRepository allocateImageSlotForIdentifier:size:actualStyle:url:lifetimeObject:](wallpaperEffectImageSlots, "allocateImageSlotForIdentifier:size:actualStyle:url:lifetimeObject:", v9, v32[3], v20[5], v4);
      objc_initWeak(&location, self);
      objc_initWeak(&from, v4);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __58__PBUIWallpaperWindowScene__handleImageSlotRequestAction___block_invoke_2;
      v13[3] = &unk_1E62B30F8;
      objc_copyWeak(&v14, &location);
      objc_copyWeak(&v15, &from);
      [v4 setNullificationHandler:v13];
      [(PBUIImageSlotRepository *)self->_wallpaperEffectImageSlots setImageSlot:v26[5] forIdentifier:v9];
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);
    }
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v31, 8);
  }
}

void __58__PBUIWallpaperWindowScene__handleImageSlotRequestAction___block_invoke(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = *(void *)(a1[4] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(a1[5] + 8);
  double v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  *(void *)(*(void *)(a1[6] + 8) + 24) = a4;
}

void __58__PBUIWallpaperWindowScene__handleImageSlotRequestAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PBUIWallpaperWindowScene__handleImageSlotRequestAction___block_invoke_3;
  v5[3] = &unk_1E62B2C38;
  v5[4] = WeakRetained;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

void __58__PBUIWallpaperWindowScene__handleImageSlotRequestAction___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v3 = *(void **)(a1 + 40);
    if (v3)
    {
      id v4 = *(void **)(v1 + 480);
      id v5 = [v3 slotIdentifier];
      [v4 freeImageSlotWithIdentifier:v5 lifetime:*(void *)(a1 + 40)];
    }
  }
}

- (void)_handleWallpaperEffectImageRequestAction:(id)a3
{
  id v20 = a3;
  id v4 = [v20 slotIdentifier];
  BOOL v5 = [(PBUIImageSlotRepository *)self->_wallpaperEffectImageSlots hasSlotForIdentifier:v4];
  int v6 = [v20 canSendResponse];
  if (v5)
  {
    if (!v6) {
      goto LABEL_9;
    }
    [(PBUIImageSlotRepository *)self->_wallpaperEffectImageSlots sizeForIdentifier:v4];
    double v8 = v7;
    double v10 = v9;
    int64_t v11 = [(PBUIImageSlotRepository *)self->_wallpaperEffectImageSlots actualStyleForIdentifier:v4];
    double v12 = [(PBUIImageSlotRepository *)self->_wallpaperEffectImageSlots urlForIdentifier:v4];
    if (!v12)
    {
      uint64_t v16 = [(PBUIImageSlotRepository *)self->_wallpaperEffectImageSlots ioSurfaceForIdentifier:v4];
      if (v16)
      {
        v17 = (void *)v16;
        id v15 = -[PBUIWallpaperEffectImageRequestActionIOSurfaceResponse initWithActualStyle:size:ioSurface:]([PBUIWallpaperEffectImageRequestActionIOSurfaceResponse alloc], "initWithActualStyle:size:ioSurface:", v11, v16, v8, v10);
      }
      else
      {
        v18 = (void *)MEMORY[0x1E4F4F678];
        uint64_t v19 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PBUIErrorDomain" code:0 userInfo:0];
        id v15 = [v18 responseForError:v19];
      }
      goto LABEL_8;
    }
    id v13 = -[PBUIWallpaperEffectImageRequestActionImageURLResponse initWithActualStyle:size:imageURL:]([PBUIWallpaperEffectImageRequestActionImageURLResponse alloc], "initWithActualStyle:size:imageURL:", v11, v12, v8, v10);
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    id v14 = (void *)MEMORY[0x1E4F4F678];
    double v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
    id v13 = [v14 responseForError:v12];
  }
  id v15 = (PBUIWallpaperEffectImageRequestActionIOSurfaceResponse *)v13;
LABEL_8:
  [v20 sendResponse:v15];

LABEL_9:
}

- (void)_handlePreheatAction:(id)a3
{
  id v5 = a3;
  id v4 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "wallpaperWindowScene:didReceivePreheatRequestForVariant:", self, objc_msgSend(v5, "variant"));
  }
}

- (void)_handleUpdateAndPrewarmAction:(id)a3
{
  id v9 = a3;
  id v4 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v6 = [v5 beginBackgroundTaskWithName:@"Update and prewarm" expirationHandler:0];

    [v4 wallpaperWindowSceneDidReceiveUpdateAndPrewarmRequest:self];
    double v7 = [MEMORY[0x1E4F42738] sharedApplication];
    [v7 endBackgroundTask:v6];
  }
  if ([v9 canSendResponse])
  {
    double v8 = [MEMORY[0x1E4F4F678] response];
    [v9 sendResponse:v8];
  }
}

- (void)_handleUpdateLocationsAction:(id)a3
{
  id v4 = a3;
  id v5 = [(PBUIWallpaperWindowScene *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v4 locations];
    uint64_t v7 = [v4 wallpaperMode];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __57__PBUIWallpaperWindowScene__handleUpdateLocationsAction___block_invoke;
    v9[3] = &unk_1E62B2798;
    id v10 = v4;
    [v5 wallpaperWindowScene:self didReceiveUpdateRequestForLocations:v6 wallpaperMode:v7 completion:v9];
  }
  else if ([v4 canSendResponse])
  {
    double v8 = objc_alloc_init(PBUIWallpaperUpdateActionResponse);
    [v4 sendResponse:v8];
  }
}

void __57__PBUIWallpaperWindowScene__handleUpdateLocationsAction___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) canSendResponse])
  {
    v2 = *(void **)(a1 + 32);
    id v3 = objc_alloc_init(PBUIWallpaperUpdateActionResponse);
    [v2 sendResponse:v3];
  }
}

- (BOOL)homescreenWallpaperHidden
{
  return self->_homescreenWallpaperHidden;
}

- (BOOL)lockscreenWallpaperHidden
{
  return self->_lockscreenWallpaperHidden;
}

- (void).cxx_destruct
{
}

@end