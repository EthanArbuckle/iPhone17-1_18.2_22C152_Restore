@interface SBInCallBannerSceneBackgroundView
- (BOOL)isFullscreen;
- (SBInCallBannerSceneBackgroundView)initWithFrame:(CGRect)a3;
- (SBInCallBannerSceneBackgroundView)initWithFrame:(CGRect)a3 wallpaperVariant:(int64_t)a4 transformOptions:(unint64_t)a5;
- (double)wallpaperAlpha;
- (int64_t)wallpaperStyle;
- (void)_updateBackdropView;
- (void)layoutSubviews;
- (void)setFullscreen:(BOOL)a3;
- (void)setWallpaperAlpha:(double)a3;
- (void)setWallpaperStyle:(int64_t)a3;
@end

@implementation SBInCallBannerSceneBackgroundView

- (SBInCallBannerSceneBackgroundView)initWithFrame:(CGRect)a3
{
  return -[SBInCallBannerSceneBackgroundView initWithFrame:wallpaperVariant:transformOptions:](self, "initWithFrame:wallpaperVariant:transformOptions:", 1, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (SBInCallBannerSceneBackgroundView)initWithFrame:(CGRect)a3 wallpaperVariant:(int64_t)a4 transformOptions:(unint64_t)a5
{
  v8.receiver = self;
  v8.super_class = (Class)SBInCallBannerSceneBackgroundView;
  result = -[SBInCallBannerSceneBackgroundView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_wallpaperStyle = 1;
    result->_wallpaperVariant = a4;
    result->_transformOptions = a5;
  }
  return result;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)SBInCallBannerSceneBackgroundView;
  [(SBInCallBannerSceneBackgroundView *)&v11 layoutSubviews];
  [(SBInCallBannerSceneBackgroundView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  -[SBWallpaperEffectView setFrame:](self->_wallpaperEffectView, "setFrame:", v4, v6, v8, v10);
}

- (void)setFullscreen:(BOOL)a3
{
  self->_fullscreen = a3;
  -[PBUIWallpaperEffectViewBase setFullscreen:](self->_wallpaperEffectView, "setFullscreen:");
}

- (void)setWallpaperAlpha:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_wallpaperAlpha = a3;
    if (BSFloatGreaterThanFloat() && !self->_wallpaperEffectView)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __55__SBInCallBannerSceneBackgroundView_setWallpaperAlpha___block_invoke;
      v6[3] = &unk_1E6AF4AC0;
      v6[4] = self;
      double v5 = (void (**)(void))MEMORY[0x1D948C7A0](v6);
      if ([MEMORY[0x1E4F42FF0] _isInRetargetableAnimationBlock])
      {
        [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v5];
      }
      else if ([MEMORY[0x1E4F42FF0] _isInAnimationBlockWithAnimationsEnabled])
      {
        [MEMORY[0x1E4F42FF0] performWithoutAnimation:v5];
      }
      else
      {
        v5[2](v5);
      }
    }
    [(SBWallpaperEffectView *)self->_wallpaperEffectView setAlpha:self->_wallpaperAlpha];
  }
}

uint64_t __55__SBInCallBannerSceneBackgroundView_setWallpaperAlpha___block_invoke(uint64_t a1)
{
  v2 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:*(void *)(*(void *)(a1 + 32) + 432) transformOptions:*(void *)(*(void *)(a1 + 32) + 416)];
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 424);
  *(void *)(v3 + 424) = v2;

  double v5 = *(void **)(a1 + 32);
  double v6 = (void *)v5[53];
  [v5 bounds];
  objc_msgSend(v6, "setFrame:");
  [*(id *)(*(void *)(a1 + 32) + 424) setStyle:*(void *)(*(void *)(a1 + 32) + 456)];
  [*(id *)(*(void *)(a1 + 32) + 424) setFullscreen:*(unsigned __int8 *)(*(void *)(a1 + 32) + 440)];
  [*(id *)(*(void *)(a1 + 32) + 424) setForcesOpaque:1];
  [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:0.0];
  double v7 = *(void **)(a1 + 32);
  uint64_t v8 = v7[53];
  return [v7 addSubview:v8];
}

- (void)setWallpaperStyle:(int64_t)a3
{
  if (self->_wallpaperStyle != a3)
  {
    self->_int64_t wallpaperStyle = a3;
    [(SBInCallBannerSceneBackgroundView *)self _updateBackdropView];
    wallpaperEffectView = self->_wallpaperEffectView;
    int64_t wallpaperStyle = self->_wallpaperStyle;
    [(PBUIWallpaperEffectViewBase *)wallpaperEffectView setStyle:wallpaperStyle];
  }
}

- (void)_updateBackdropView
{
  _WallpaperBackdropParametersForStyleAndAverageColor();
  [(_UIBackdropView *)self->_backdropView removeFromSuperview];
  backdropView = self->_backdropView;
  self->_backdropView = 0;
}

- (BOOL)isFullscreen
{
  return self->_fullscreen;
}

- (double)wallpaperAlpha
{
  return self->_wallpaperAlpha;
}

- (int64_t)wallpaperStyle
{
  return self->_wallpaperStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end