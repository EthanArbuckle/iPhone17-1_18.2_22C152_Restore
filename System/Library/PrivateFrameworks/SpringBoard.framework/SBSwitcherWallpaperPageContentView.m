@interface SBSwitcherWallpaperPageContentView
- (BOOL)contentRequiresGroupOpacity;
- (BOOL)isActive;
- (BOOL)isVisible;
- (CGRect)_wallpaperFrame;
- (SBSwitcherWallpaperPageContentView)initWithFrame:(CGRect)a3;
- (SBWallpaperEffectView)wallpaperEffectView;
- (double)cornerRadius;
- (int64_t)desiredWallpaperOrientation;
- (int64_t)orientation;
- (int64_t)wallpaperStyle;
- (unint64_t)maskedCorners;
- (void)_updateCornerRadius;
- (void)_updateWallpaperOrientation;
- (void)layoutSubviews;
- (void)setActive:(BOOL)a3;
- (void)setCornerRadius:(double)a3;
- (void)setDesiredWallpaperOrientation:(int64_t)a3;
- (void)setMaskedCorners:(unint64_t)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setVisible:(BOOL)a3;
- (void)setWallpaperStyle:(int64_t)a3;
@end

@implementation SBSwitcherWallpaperPageContentView

- (unint64_t)maskedCorners
{
  return self->_maskedCorners;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)_updateCornerRadius
{
  [(SBWallpaperEffectView *)self->_wallpaperEffectView _setContinuousCornerRadius:self->_cornerRadius];
  id v3 = [(SBWallpaperEffectView *)self->_wallpaperEffectView layer];
  [v3 setMaskedCorners:self->_maskedCorners];
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    [(SBSwitcherWallpaperPageContentView *)self _updateCornerRadius];
  }
}

- (void)setMaskedCorners:(unint64_t)a3
{
  if (self->_maskedCorners != a3)
  {
    self->_maskedCorners = a3;
    [(SBSwitcherWallpaperPageContentView *)self _updateCornerRadius];
  }
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (int64_t)wallpaperStyle
{
  return self->_wallpaperStyle;
}

- (void)setWallpaperStyle:(int64_t)a3
{
  if (self->_wallpaperStyle != a3)
  {
    self->_wallpaperStyle = a3;
    wallpaperEffectView = self->_wallpaperEffectView;
    if (a3 == 1)
    {
      if (wallpaperEffectView)
      {
        self->_wallpaperEffectView = 0;
      }
      wallpaperWrapperView = self->_wallpaperWrapperView;
      if (wallpaperWrapperView)
      {
        [(BSUIOrientationTransformWrapperView *)wallpaperWrapperView removeFromSuperview];
        v6 = self->_wallpaperWrapperView;
        self->_wallpaperWrapperView = 0;
      }
    }
    else
    {
      if (!wallpaperEffectView)
      {
        v7 = [[SBWallpaperEffectView alloc] initWithWallpaperVariant:1 transformOptions:8];
        v8 = self->_wallpaperEffectView;
        self->_wallpaperEffectView = v7;

        [(SBWallpaperEffectView *)self->_wallpaperEffectView setClipsToBounds:1];
        [(SBSwitcherWallpaperPageContentView *)self setNeedsLayout];
      }
      if (!self->_wallpaperWrapperView)
      {
        id v9 = objc_alloc(MEMORY[0x1E4F4F8D0]);
        [(SBSwitcherWallpaperPageContentView *)self _wallpaperFrame];
        v10 = (BSUIOrientationTransformWrapperView *)objc_msgSend(v9, "initWithFrame:");
        v11 = self->_wallpaperWrapperView;
        self->_wallpaperWrapperView = v10;

        [(BSUIOrientationTransformWrapperView *)self->_wallpaperWrapperView addContentView:self->_wallpaperEffectView];
        v12 = [(SBSwitcherWallpaperPageContentView *)self _viewForWallpaperWrapper];
        [v12 insertSubview:self->_wallpaperWrapperView atIndex:0];
      }
      [(SBSwitcherWallpaperPageContentView *)self _updateWallpaperOrientation];
      [(PBUIWallpaperEffectViewBase *)self->_wallpaperEffectView setStyle:self->_wallpaperStyle];
      v13 = self->_wallpaperEffectView;
      [(PBUIWallpaperEffectViewBase *)v13 setForcesOpaque:1];
    }
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherWallpaperPageContentView;
  [(SBSwitcherWallpaperPageContentView *)&v4 layoutSubviews];
  wallpaperWrapperView = self->_wallpaperWrapperView;
  [(SBSwitcherWallpaperPageContentView *)self _wallpaperFrame];
  -[BSUIOrientationTransformWrapperView setFrame:](wallpaperWrapperView, "setFrame:");
  [(SBSwitcherWallpaperPageContentView *)self sendSubviewToBack:self->_wallpaperWrapperView];
  [(SBSwitcherWallpaperPageContentView *)self _updateCornerRadius];
}

- (CGRect)_wallpaperFrame
{
  [(SBSwitcherWallpaperPageContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  if (self->_wallpaperStyle != 1)
  {
    v11 = [MEMORY[0x1E4F42D90] mainScreen];
    [v11 scale];

    UIRectInset();
    double v4 = v12;
    double v6 = v13;
    double v8 = v14;
    double v10 = v15;
  }
  double v16 = v4;
  double v17 = v6;
  double v18 = v8;
  double v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (SBSwitcherWallpaperPageContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBSwitcherWallpaperPageContentView;
  double v3 = -[SBSwitcherWallpaperPageContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3)
  {
    v3->_orientation = 0;
    v3->_desiredWallpaperOrientation = 0;
    v3->_wallpaperStyle = 1;
    [(SBSwitcherWallpaperPageContentView *)v3 setClipsToBounds:1];
  }
  return v4;
}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    [(SBSwitcherWallpaperPageContentView *)self _updateWallpaperOrientation];
  }
}

- (void)setDesiredWallpaperOrientation:(int64_t)a3
{
  if (self->_desiredWallpaperOrientation != a3)
  {
    self->_desiredWallpaperOrientation = a3;
    [(SBSwitcherWallpaperPageContentView *)self _updateWallpaperOrientation];
  }
}

- (BOOL)contentRequiresGroupOpacity
{
  return 0;
}

- (void)_updateWallpaperOrientation
{
  if (self->_desiredWallpaperOrientation) {
    int64_t desiredWallpaperOrientation = self->_desiredWallpaperOrientation;
  }
  else {
    int64_t desiredWallpaperOrientation = self->_orientation;
  }
  if ((unint64_t)(desiredWallpaperOrientation - 3) < 2 != (unint64_t)(self->_orientation - 3) < 2) {
    int64_t desiredWallpaperOrientation = XBOppositeInterfaceOrientation();
  }
  if ([(id)SBApp homeScreenRotationStyle]) {
    int64_t orientation = 1;
  }
  else {
    int64_t orientation = self->_orientation;
  }
  [(BSUIOrientationTransformWrapperView *)self->_wallpaperWrapperView setContentOrientation:orientation];
  wallpaperWrapperView = self->_wallpaperWrapperView;
  [(BSUIOrientationTransformWrapperView *)wallpaperWrapperView setContainerOrientation:desiredWallpaperOrientation];
}

- (int64_t)desiredWallpaperOrientation
{
  return self->_desiredWallpaperOrientation;
}

- (SBWallpaperEffectView)wallpaperEffectView
{
  return self->_wallpaperEffectView;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isVisible
{
  return self->_visible;
}

- (void)setVisible:(BOOL)a3
{
  self->_visible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaperEffectView, 0);
  objc_storeStrong((id *)&self->_wallpaperWrapperView, 0);
}

@end