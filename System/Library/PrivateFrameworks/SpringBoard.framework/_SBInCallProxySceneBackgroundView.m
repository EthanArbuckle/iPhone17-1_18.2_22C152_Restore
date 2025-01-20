@interface _SBInCallProxySceneBackgroundView
- (BOOL)isFullscreen;
- (BOOL)needsClassicModeBackground;
- (BOOL)shouldUseBrightMaterial;
- (SBApplicationSceneBackgroundView)proxyTarget;
- (_SBInCallProxySceneBackgroundView)initWithFrame:(CGRect)a3 proxyTarget:(id)a4;
- (int64_t)wallpaperStyle;
- (void)setFullscreen:(BOOL)a3;
- (void)setNeedsClassicModeBackground:(BOOL)a3;
- (void)setProxyTarget:(id)a3;
- (void)setShouldUseBrightMaterial:(BOOL)a3;
- (void)setWallpaperStyle:(int64_t)a3;
- (void)setWallpaperStyle:(int64_t)a3 withAnimationSettings:(id)a4;
@end

@implementation _SBInCallProxySceneBackgroundView

- (_SBInCallProxySceneBackgroundView)initWithFrame:(CGRect)a3 proxyTarget:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SBInCallProxySceneBackgroundView;
  v10 = -[_SBInCallProxySceneBackgroundView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10) {
    objc_storeWeak((id *)&v10->_proxyTarget, v9);
  }

  return v11;
}

- (BOOL)isFullscreen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if (objc_opt_respondsToSelector()) {
    char v3 = [WeakRetained isFullscreen];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)setFullscreen:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained setFullscreen:v3];
  }
}

- (BOOL)needsClassicModeBackground
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if (objc_opt_respondsToSelector()) {
    char v3 = [WeakRetained needsClassicModeBackground];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)setNeedsClassicModeBackground:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained setNeedsClassicModeBackground:v3];
  }
}

- (BOOL)shouldUseBrightMaterial
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if (objc_opt_respondsToSelector()) {
    char v3 = [WeakRetained shouldUseBrightMaterial];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (void)setShouldUseBrightMaterial:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained setShouldUseBrightMaterial:v3];
  }
}

- (void)setWallpaperStyle:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained setWallpaperStyle:a3];
  }
}

- (void)setWallpaperStyle:(int64_t)a3 withAnimationSettings:(id)a4
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained setWallpaperStyle:a3 withAnimationSettings:v7];
  }
}

- (int64_t)wallpaperStyle
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [WeakRetained wallpaperStyle];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (SBApplicationSceneBackgroundView)proxyTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxyTarget);
  return (SBApplicationSceneBackgroundView *)WeakRetained;
}

- (void)setProxyTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end