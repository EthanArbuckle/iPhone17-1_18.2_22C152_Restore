@interface SBUIChevronView
- (BOOL)_setState:(int64_t)a3;
- (BOOL)_setUnified:(BOOL)a3;
- (CGAffineTransform)_transformForGrabberView:(SEL)a3 forState:(id)a4;
- (CGRect)_frameForGrabberView:(id)a3 forState:(int64_t)a4 unified:(BOOL)a5;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)description;
- (SBUIChevronView)initWithColor:(id)a3;
- (SBUIChevronView)initWithFrame:(CGRect)a3;
- (UIColor)color;
- (_SBFVibrantSettings)vibrantSettings;
- (double)animationDuration;
- (int64_t)state;
- (void)_layoutGrabberView:(id)a3 forState:(int64_t)a4;
- (void)configureForLightStyle;
- (void)layoutSubviews;
- (void)setAnimationDuration:(double)a3;
- (void)setBackgroundView:(id)a3;
- (void)setColor:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setState:(int64_t)a3 animated:(BOOL)a4;
- (void)setVibrantSettings:(id)a3;
@end

@implementation SBUIChevronView

- (SBUIChevronView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v20.receiver = self;
  v20.super_class = (Class)SBUIChevronView;
  v7 = -[SBUIChevronView initWithFrame:](&v20, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    [(SBUIChevronView *)v7 setOpaque:0];
    v9 = [(SBUIChevronView *)v8 layer];
    [v9 setAllowsGroupOpacity:1];

    v8->_animationDuration = 0.25;
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263F1CB60]), "initWithFrame:", x, y, width, height);
    alphaContainerView = v8->_alphaContainerView;
    v8->_alphaContainerView = (UIView *)v10;

    [(SBUIChevronView *)v8 addSubview:v8->_alphaContainerView];
    uint64_t v12 = _NewChevronPiece();
    leftGrabberView = v8->_leftGrabberView;
    v8->_leftGrabberView = (UIView *)v12;

    [(UIView *)v8->_alphaContainerView addSubview:v8->_leftGrabberView];
    uint64_t v14 = _NewChevronPiece();
    rightGrabberView = v8->_rightGrabberView;
    v8->_rightGrabberView = (UIView *)v14;

    [(UIView *)v8->_alphaContainerView addSubview:v8->_rightGrabberView];
    v16 = (void *)MEMORY[0x263F1CB60];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __33__SBUIChevronView_initWithFrame___block_invoke;
    v18[3] = &unk_2645D3CD0;
    v19 = v8;
    [v16 performWithoutAnimation:v18];
  }
  return v8;
}

uint64_t __33__SBUIChevronView_initWithFrame___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setUnified:*(void *)(*(void *)(a1 + 32) + 432) == 0];
  [*(id *)(a1 + 32) _layoutGrabberView:*(void *)(*(void *)(a1 + 32) + 408) forState:*(void *)(*(void *)(a1 + 32) + 432)];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[52];
  uint64_t v4 = v2[54];

  return [v2 _layoutGrabberView:v3 forState:v4];
}

- (SBUIChevronView)initWithColor:(id)a3
{
  id v4 = a3;
  v5 = -[SBUIChevronView initWithFrame:](self, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v6 = v5;
  if (v5) {
    [(SBUIChevronView *)v5 setColor:v4];
  }

  return v6;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  if (a3 == 0.0) {
    a3 = 0.25;
  }
  self->_animationDuration = a3;
}

- (void)setColor:(id)a3
{
  if (self->_color != a3)
  {
    id v4 = a3;
    double alphaComponent = 1.0;
    v6 = [v4 colorWithAlphaComponent:1.0];
    color = self->_color;
    self->_color = v6;

    [(UIView *)self->_leftGrabberView setBackgroundColor:self->_color];
    [(UIView *)self->_rightGrabberView setBackgroundColor:self->_color];
    [v4 alphaComponent];
    double v9 = v8;

    self->_double alphaComponent = v9;
    if (self->_unified) {
      double v10 = 1.0;
    }
    else {
      double v10 = v9;
    }
    [(UIView *)self->_alphaContainerView setAlpha:v10];
    leftGrabberView = self->_leftGrabberView;
    if (self->_unified) {
      double alphaComponent = self->_alphaComponent;
    }
    [(UIView *)leftGrabberView setAlpha:alphaComponent];
  }
}

- (void)configureForLightStyle
{
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  double v4 = 0.65;
  if (IsReduceTransparencyEnabled) {
    double v4 = 1.0;
  }
  [(SBUIChevronView *)self setAlpha:v4];

  [(SBUIChevronView *)self _setDrawsAsBackdropOverlayWithBlendMode:1];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 36.0;
  double v4 = 14.0;
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (CGAffineTransform)_transformForGrabberView:(SEL)a3 forState:(id)a4
{
  double v8 = (UIView *)a4;
  uint64_t v9 = MEMORY[0x263F000D0];
  long long v10 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
  *(_OWORD *)&retstr->c = v10;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v9 + 32);
  if (a5 == 1)
  {
    BOOL v12 = self->_rightGrabberView == v8;
    double v11 = 20.0;
    double v13 = -20.0;
LABEL_6:
    if (v12) {
      double v11 = v13;
    }
    goto LABEL_8;
  }
  if (!a5) {
    goto LABEL_9;
  }
  double v11 = 0.0;
  if (a5 == -1)
  {
    BOOL v12 = self->_rightGrabberView == v8;
    double v11 = -20.0;
    double v13 = 20.0;
    goto LABEL_6;
  }
LABEL_8:
  v15 = v8;
  CGAffineTransformMakeRotation(retstr, v11 * 0.0174532925);
  double v8 = v15;
LABEL_9:

  return result;
}

- (CGRect)_frameForGrabberView:(id)a3 forState:(int64_t)a4 unified:(BOOL)a5
{
  v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 scale];
  UIRectIntegralWithScale();
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

- (void)_layoutGrabberView:(id)a3 forState:(int64_t)a4
{
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v9[0] = *MEMORY[0x263F000D0];
  v9[1] = v6;
  v9[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  id v7 = a3;
  [v7 setTransform:v9];
  [(SBUIChevronView *)self _frameForGrabberView:v7 forState:a4 unified:self->_unified];
  objc_msgSend(v7, "setFrame:");
  [(SBUIChevronView *)self _transformForGrabberView:v7 forState:a4];
  [v7 setTransform:&v8];
}

- (void)layoutSubviews
{
  alphaContainerView = self->_alphaContainerView;
  [(SBUIChevronView *)self bounds];
  -[UIView setFrame:](alphaContainerView, "setFrame:");
  if ((unint64_t)(self->_state + 1) <= 2)
  {
    -[SBUIChevronView _layoutGrabberView:forState:](self, "_layoutGrabberView:forState:", self->_leftGrabberView);
    rightGrabberView = self->_rightGrabberView;
    int64_t state = self->_state;
    [(SBUIChevronView *)self _layoutGrabberView:rightGrabberView forState:state];
  }
}

- (BOOL)_setState:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 2) {
    return 0;
  }
  if (self->_state == a3) {
    return 0;
  }
  self->_int64_t state = a3;
  [(SBUIChevronView *)self setNeedsLayout];
  return 1;
}

- (BOOL)_setUnified:(BOOL)a3
{
  int v3 = a3;
  int unified = self->_unified;
  if (unified != a3)
  {
    self->_int unified = a3;
    [(UIView *)self->_rightGrabberView setHidden:a3];
    long long v6 = [(UIView *)self->_alphaContainerView layer];
    [v6 setAllowsGroupOpacity:!self->_unified];

    double v7 = 1.0;
    double alphaComponent = 1.0;
    if (!self->_unified) {
      double alphaComponent = self->_alphaComponent;
    }
    [(UIView *)self->_alphaContainerView setAlpha:alphaComponent];
    if (self->_unified) {
      double v7 = self->_alphaComponent;
    }
    [(UIView *)self->_leftGrabberView setAlpha:v7];
  }
  return unified != v3;
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(SBUIChevronView *)self _setState:a3])
  {
    if (!self->_vibrantSettings)
    {
      long long v6 = [(SBUIChevronView *)self layer];
      [v6 setShouldRasterize:0];
    }
    if ([(SBUIChevronView *)self _setUnified:0])
    {
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __37__SBUIChevronView_setState_animated___block_invoke;
      v12[3] = &unk_2645D3CD0;
      v12[4] = self;
      [MEMORY[0x263F1CB60] performWithoutAnimation:v12];
    }
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __37__SBUIChevronView_setState_animated___block_invoke_2;
    v11[3] = &unk_2645D3CD0;
    v11[4] = self;
    double v7 = (void (**)(void))MEMORY[0x223C8BC20](v11);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __37__SBUIChevronView_setState_animated___block_invoke_3;
    v10[3] = &unk_2645D42D8;
    v10[4] = self;
    uint64_t v8 = (void (**)(void, void))MEMORY[0x223C8BC20](v10);
    if (v4)
    {
      double v9 = (void *)MEMORY[0x263F1CB60];
      [(SBUIChevronView *)self animationDuration];
      objc_msgSend(v9, "animateWithDuration:animations:completion:", v7, v8);
    }
    else
    {
      v7[2](v7);
      if (v8) {
        v8[2](v8, 1);
      }
    }
  }
}

uint64_t __37__SBUIChevronView_setState_animated___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)v1[51];
  [v1 _frameForGrabberView:v2 forState:0 unified:0];

  return objc_msgSend(v2, "setFrame:");
}

uint64_t __37__SBUIChevronView_setState_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __37__SBUIChevronView_setState_animated___block_invoke_3(uint64_t a1, int a2)
{
  if (a2)
  {
    int v3 = *(void **)(a1 + 32);
    if (v3[54])
    {
      if (v3[57])
      {
        BOOL v4 = [v3 layer];
        v5 = [MEMORY[0x263F1C920] mainScreen];
        [v5 scale];
        objc_msgSend(v4, "setRasterizationScale:");

        id v8 = [*(id *)(a1 + 32) layer];
        [v8 setShouldRasterize:1];
      }
    }
    else
    {
      [v3 _setUnified:1];
      long long v6 = *(void **)(a1 + 32);
      double v7 = (void *)v6[51];
      [v6 _frameForGrabberView:v7 forState:0 unified:1];
      objc_msgSend(v7, "setFrame:");
    }
  }
}

- (void)setState:(int64_t)a3
{
}

- (NSString)description
{
  v7.receiver = self;
  v7.super_class = (Class)SBUIChevronView;
  int v3 = [(SBUIChevronView *)&v7 description];
  objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 1, 1);
  unint64_t v4 = self->_state + 1;
  if (v4 > 2) {
    v5 = @"[Invalid]";
  }
  else {
    v5 = off_2645D42F8[v4];
  }
  [v3 appendFormat:@"; state: %@>", v5];

  return (NSString *)v3;
}

- (void)setVibrantSettings:(id)a3
{
  id v16 = a3;
  uint64_t v5 = [(_SBFVibrantSettings *)self->_vibrantSettings isEqual:v16];
  id v6 = v16;
  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_vibrantSettings, a3);
    if (self->_vibrantSettings)
    {
      objc_super v7 = [(SBUIChevronView *)self layer];
      id v8 = [v7 mask];

      if (!v8)
      {
        double v9 = [(SBUIChevronView *)self layer];
        [v9 setShouldRasterize:0];

        [(UIView *)self->_alphaContainerView removeFromSuperview];
        double v10 = [(SBUIChevronView *)self layer];
        double v11 = [(UIView *)self->_alphaContainerView layer];
        [v10 setMask:v11];
      }
      [(UIView *)self->_tintView removeFromSuperview];
      [(SBUIChevronView *)self bounds];
      objc_msgSend(v16, "tintViewWithFrame:");
      double v12 = (UIView *)objc_claimAutoreleasedReturnValue();
      tintView = self->_tintView;
      self->_tintView = v12;

      uint64_t v5 = [(SBUIChevronView *)self insertSubview:self->_tintView belowSubview:self->_alphaContainerView];
      goto LABEL_6;
    }
    double v14 = [(UIView *)self->_alphaContainerView superview];

    id v6 = v16;
    if (!v14)
    {
      [(SBUIChevronView *)self addSubview:self->_alphaContainerView];
      [(UIView *)self->_tintView removeFromSuperview];
      double v15 = self->_tintView;
      self->_tintView = 0;

LABEL_6:
      id v6 = v16;
    }
  }

  MEMORY[0x270F9A758](v5, v6);
}

- (void)setBackgroundView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  p_backgroundView = &self->_backgroundView;
  backgroundView = self->_backgroundView;
  if (backgroundView != v5)
  {
    double v9 = v5;
    [(UIView *)backgroundView removeFromSuperview];
    objc_storeStrong((id *)&self->_backgroundView, a3);
    id v8 = *p_backgroundView;
    [(SBUIChevronView *)self bounds];
    -[UIView setFrame:](v8, "setFrame:");
    [(SBUIChevronView *)self addSubview:*p_backgroundView];
    backgroundView = (UIView *)[(SBUIChevronView *)self sendSubviewToBack:*p_backgroundView];
    uint64_t v5 = v9;
  }

  MEMORY[0x270F9A758](backgroundView, v5);
}

- (UIColor)color
{
  return self->_color;
}

- (_SBFVibrantSettings)vibrantSettings
{
  return self->_vibrantSettings;
}

- (int64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alphaContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_tintView, 0);
  objc_storeStrong((id *)&self->_vibrantSettings, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_rightGrabberView, 0);

  objc_storeStrong((id *)&self->_leftGrabberView, 0);
}

@end