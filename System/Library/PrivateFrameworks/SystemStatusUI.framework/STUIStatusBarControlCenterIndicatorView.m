@interface STUIStatusBarControlCenterIndicatorView
- (BOOL)hideWithWipe;
- (void)_setupMaskView;
- (void)_updateMaskFrame;
- (void)_updateMaskLayersFrames;
- (void)layoutSubviews;
- (void)setHideWithWipe:(BOOL)a3;
@end

@implementation STUIStatusBarControlCenterIndicatorView

- (void)_setupMaskView
{
  v16[2] = *MEMORY[0x1E4F143B8];
  v3 = [(STUIStatusBarControlCenterIndicatorView *)self maskView];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(STUIStatusBarControlCenterIndicatorView *)self bounds];
    v5 = objc_msgSend(v4, "initWithFrame:");
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(STUIStatusBarControlCenterIndicatorView *)self setMaskView:v5];
    v6 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    maskSolidLayer = self->_maskSolidLayer;
    self->_maskSolidLayer = v6;

    id v8 = [MEMORY[0x1E4FB1618] blackColor];
    -[CALayer setBackgroundColor:](self->_maskSolidLayer, "setBackgroundColor:", [v8 CGColor]);

    v9 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x1E4F39BD0]);
    maskGradientLayer = self->_maskGradientLayer;
    self->_maskGradientLayer = v9;

    id v11 = [MEMORY[0x1E4FB1618] blackColor];
    v16[0] = [v11 CGColor];
    id v12 = [MEMORY[0x1E4FB1618] clearColor];
    v16[1] = [v12 CGColor];
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    [(CAGradientLayer *)self->_maskGradientLayer setColors:v13];

    [(STUIStatusBarControlCenterIndicatorView *)self _updateMaskLayersFrames];
    v14 = [v5 layer];
    [v14 addSublayer:self->_maskSolidLayer];

    v15 = [v5 layer];
    [v15 addSublayer:self->_maskGradientLayer];
  }
}

- (BOOL)hideWithWipe
{
  return self->_hidingWithMask;
}

- (void)_updateMaskLayersFrames
{
  v3 = [(STUIStatusBarControlCenterIndicatorView *)self maskView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  -[CALayer setFrame:](self->_maskSolidLayer, "setFrame:", 0.0, -v7, v5, v7);
  maskGradientLayer = self->_maskGradientLayer;
  -[CAGradientLayer setFrame:](maskGradientLayer, "setFrame:", 0.0, 0.0, v5, v7 * 0.5);
}

- (void)_updateMaskFrame
{
  [(STUIStatusBarControlCenterIndicatorView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL hidingWithMask = self->_hidingWithMask;
  id v12 = [(STUIStatusBarControlCenterIndicatorView *)self maskView];
  id v14 = v12;
  double v13 = -v10;
  if (!hidingWithMask) {
    double v13 = v10;
  }
  objc_msgSend(v12, "setFrame:", v4, v6 + v13, v8, v10);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarControlCenterIndicatorView;
  [(STUIStatusBarControlCenterIndicatorView *)&v4 layoutSubviews];
  double v3 = [(STUIStatusBarControlCenterIndicatorView *)self maskView];

  if (v3)
  {
    [(STUIStatusBarControlCenterIndicatorView *)self _updateMaskFrame];
    [(STUIStatusBarControlCenterIndicatorView *)self _updateMaskLayersFrames];
  }
}

- (void)setHideWithWipe:(BOOL)a3
{
  if (self->_hidingWithMask != a3)
  {
    self->_BOOL hidingWithMask = a3;
    objc_super v4 = [(STUIStatusBarControlCenterIndicatorView *)self maskView];

    if (!v4) {
      [(STUIStatusBarControlCenterIndicatorView *)self _setupMaskView];
    }
    [(STUIStatusBarControlCenterIndicatorView *)self _updateMaskFrame];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskGradientLayer, 0);
  objc_storeStrong((id *)&self->_maskSolidLayer, 0);
}

@end