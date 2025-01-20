@interface UIStatusBarBackgroundView
- (BOOL)_styleCanGlow;
- (UIStatusBarBackgroundView)initWithFrame:(CGRect)a3 style:(id)a4 backgroundColor:(id)a5;
- (id)_backgroundImageName;
- (id)_baseImage;
- (id)_glowImage;
- (id)style;
- (void)_setGlowAnimationEnabled:(BOOL)a3 waitForNextCycle:(BOOL)a4;
- (void)_startGlowAnimationWaitForNextCycle:(BOOL)a3;
- (void)_stopGlowAnimation;
- (void)setGlowAnimationEnabled:(BOOL)a3;
- (void)setSuppressesGlow:(BOOL)a3;
@end

@implementation UIStatusBarBackgroundView

- (UIStatusBarBackgroundView)initWithFrame:(CGRect)a3 style:(id)a4 backgroundColor:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v24.receiver = self;
  v24.super_class = (Class)UIStatusBarBackgroundView;
  v14 = -[UIView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_style, a4);
    if (v13) {
      [(UIView *)v15 setBackgroundColor:v13];
    }
    v16 = [(UIStatusBarBackgroundView *)v15 _baseImage];
    if (v16)
    {
      v17 = [(UIView *)v15 layer];
      id v18 = v16;
      objc_msgSend(v17, "setContents:", objc_msgSend(v18, "CGImage"));

      [v18 scale];
      -[UIView setContentScaleFactor:](v15, "setContentScaleFactor:");
      [v18 size];
      double v20 = v19;
      if (v19 > 1.0)
      {
        double v21 = floor((v19 + -1.0) * 0.5);
        v22 = [(UIView *)v15 layer];
        objc_msgSend(v22, "setContentsCenter:", v21 / v20, 0.0, (v20 - (v21 + v21)) / v20, 1.0);
      }
    }
    [(UIView *)v15 setAutoresizingMask:18];
  }
  return v15;
}

- (id)style
{
  return self->_style;
}

- (void)setGlowAnimationEnabled:(BOOL)a3
{
}

- (void)_setGlowAnimationEnabled:(BOOL)a3 waitForNextCycle:(BOOL)a4
{
  self->_glowEnabled = a3;
  if (a3 && !self->_suppressGlow) {
    [(UIStatusBarBackgroundView *)self _startGlowAnimationWaitForNextCycle:a4];
  }
  else {
    [(UIStatusBarBackgroundView *)self _stopGlowAnimation];
  }
}

- (void)setSuppressesGlow:(BOOL)a3
{
  self->_suppressGlow = a3;
  [(UIStatusBarBackgroundView *)self _setGlowAnimationEnabled:self->_glowEnabled waitForNextCycle:1];
}

- (BOOL)_styleCanGlow
{
  [(UIStatusBarStyleAttributes *)self->_style glowAnimationDuration];
  return v2 > 0.0;
}

- (void)_startGlowAnimationWaitForNextCycle:(BOOL)a3
{
  if (self->_glowView) {
    return;
  }
  BOOL v3 = a3;
  if (![(UIStatusBarBackgroundView *)self _styleCanGlow]) {
    return;
  }
  id v28 = [(UIStatusBarBackgroundView *)self _glowImage];
  if (v28)
  {
    double v5 = CACurrentMediaTime();
    double v6 = floor(v5 / 1.5) * 1.5;
    if (v3) {
      double v7 = v6 + 1.5;
    }
    else {
      double v7 = v6;
    }
    +[UIStatusBarServer getGlowAnimationEndTimeForStyle:self->_style];
    double v9 = v8;
    if (v8 == 1.79769313e308)
    {
      float v16 = 3.4028e38;
    }
    else
    {
      [(UIStatusBarStyleAttributes *)self->_style glowAnimationDuration];
      BOOL v11 = v10 == 1.79769313e308;
      double v12 = v9 - v10;
      if (v11 || v5 > v9 || v5 < v12) {
        goto LABEL_21;
      }
      double v15 = v9 - v5 - (v7 - v5);
      float v16 = 0.0;
      if (v15 >= 1.5)
      {
        float v17 = v15;
        float v16 = ceil(v17 / 1.5);
        if (v16 < 0.0) {
          goto LABEL_21;
        }
      }
    }
    id v18 = [UIImageView alloc];
    [(UIView *)self bounds];
    double v19 = -[UIImageView initWithFrame:](v18, "initWithFrame:");
    glowView = self->_glowView;
    self->_glowView = v19;

    [(UIView *)self->_glowView setAutoresizingMask:18];
    [(UIImageView *)self->_glowView setImage:v28];
    [(UIView *)self->_glowView setAlpha:0.0];
    [(UIView *)self addSubview:self->_glowView];
    double v21 = [MEMORY[0x1E4F39B48] animation];
    [v21 setKeyPath:@"opacity"];
    v22 = [NSNumber numberWithFloat:0.0];
    [v21 setFromValue:v22];

    LODWORD(v23) = 1.0;
    objc_super v24 = [NSNumber numberWithFloat:v23];
    [v21 setToValue:v24];

    [v21 setDuration:0.75];
    [v21 setRemovedOnCompletion:0];
    v25 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    [v21 setTimingFunction:v25];

    [v21 setBeginTime:v7];
    *(float *)&double v26 = v16;
    [v21 setRepeatCount:v26];
    [v21 setFrameInterval:0.05];
    [v21 setAutoreverses:1];
    v27 = [(UIView *)self->_glowView layer];
    [v27 addAnimation:v21 forKey:@"opacity"];
  }
LABEL_21:
}

- (void)_stopGlowAnimation
{
  glowView = self->_glowView;
  if (glowView)
  {
    v4 = [(UIView *)glowView layer];
    [v4 removeAllAnimations];

    [(UIView *)self->_glowView removeFromSuperview];
    double v5 = self->_glowView;
    self->_glowView = 0;
  }
}

- (id)_backgroundImageName
{
  return [(UIStatusBarStyleAttributes *)self->_style backgroundImageName];
}

- (id)_baseImage
{
  double v2 = [(UIStatusBarBackgroundView *)self _backgroundImageName];
  if (v2)
  {
    BOOL v3 = [NSString stringWithFormat:@"%@_Base.png", v2];
    v4 = +[UIImage kitImageNamed:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_glowImage
{
  double v2 = [(UIStatusBarBackgroundView *)self _backgroundImageName];
  if (v2)
  {
    BOOL v3 = [NSString stringWithFormat:@"%@_Glow.png", v2];
    v4 = +[UIImage kitImageNamed:v3];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glowView, 0);
  objc_storeStrong((id *)&self->_style, 0);
}

@end