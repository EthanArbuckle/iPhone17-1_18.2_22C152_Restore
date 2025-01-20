@interface SBAppSwitcherWallpaperGradientView
- (SBAppSwitcherWallpaperGradientView)initWithPrivateStyle:(int64_t)a3;
- (SBSwitcherWallpaperGradientAttributes)attributes;
- (void)_updateGradientColors;
- (void)layoutSubviews;
- (void)setAttributes:(SBSwitcherWallpaperGradientAttributes)a3;
- (void)setBounds:(CGRect)a3;
@end

@implementation SBAppSwitcherWallpaperGradientView

- (SBAppSwitcherWallpaperGradientView)initWithPrivateStyle:(int64_t)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBAppSwitcherWallpaperGradientView;
  v3 = [(_UIBackdropView *)&v11 initWithPrivateStyle:a3];
  v4 = v3;
  if (v3)
  {
    v3->_attributes.leadingAlpha = SBSwitcherWallpaperGradientAttributesMakeEmpty();
    v4->_attributes.trailingAlpha = v5;
    v6 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
    gradientLayer = v4->_gradientLayer;
    v4->_gradientLayer = v6;

    [(CAGradientLayer *)v4->_gradientLayer setType:*MEMORY[0x1E4F3A390]];
    [(CAGradientLayer *)v4->_gradientLayer setLocations:&unk_1F3348A08];
    -[CAGradientLayer setStartPoint:](v4->_gradientLayer, "setStartPoint:", 0.0, 0.5);
    -[CAGradientLayer setEndPoint:](v4->_gradientLayer, "setEndPoint:", 1.0, 0.5);
    [(CAGradientLayer *)v4->_gradientLayer setCompositingFilter:*MEMORY[0x1E4F3A098]];
    [(SBAppSwitcherWallpaperGradientView *)v4 _updateGradientColors];
    v8 = [(_UIBackdropView *)v4 effectView];
    v9 = [v8 layer];
    [v9 addSublayer:v4->_gradientLayer];
  }
  return v4;
}

- (void)setAttributes:(SBSwitcherWallpaperGradientAttributes)a3
{
  double trailingAlpha = a3.trailingAlpha;
  double leadingAlpha = a3.leadingAlpha;
  p_attributes = &self->_attributes;
  if ((SBSwitcherWallpaperGradientAttributesEqual() & 1) == 0)
  {
    p_attributes->double leadingAlpha = leadingAlpha;
    p_attributes->double trailingAlpha = trailingAlpha;
    [(SBAppSwitcherWallpaperGradientView *)self _updateGradientColors];
  }
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBAppSwitcherWallpaperGradientView;
  -[SBAppSwitcherWallpaperGradientView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SBAppSwitcherWallpaperGradientView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBAppSwitcherWallpaperGradientView;
  [(_UIBackdropView *)&v4 layoutSubviews];
  [(SBAppSwitcherWallpaperGradientView *)self bounds];
  -[CAGradientLayer setBounds:](self->_gradientLayer, "setBounds:");
  gradientLayer = self->_gradientLayer;
  UIRectGetCenter();
  -[CAGradientLayer setPosition:](gradientLayer, "setPosition:");
}

- (void)_updateGradientColors
{
  v7[2] = *MEMORY[0x1E4F143B8];
  gradientLayer = self->_gradientLayer;
  p_attributes = &self->_attributes;
  id v4 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:1.0 - self->_attributes.trailingAlpha];
  v7[0] = [v4 CGColor];
  id v5 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:1.0 - p_attributes->leadingAlpha];
  v7[1] = [v5 CGColor];
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:2];
  [(CAGradientLayer *)gradientLayer setColors:v6];
}

- (SBSwitcherWallpaperGradientAttributes)attributes
{
  double leadingAlpha = self->_attributes.leadingAlpha;
  double trailingAlpha = self->_attributes.trailingAlpha;
  result.double trailingAlpha = trailingAlpha;
  result.double leadingAlpha = leadingAlpha;
  return result;
}

- (void).cxx_destruct
{
}

@end