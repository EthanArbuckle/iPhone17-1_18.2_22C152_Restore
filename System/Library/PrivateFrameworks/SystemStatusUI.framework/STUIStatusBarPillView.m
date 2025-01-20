@interface STUIStatusBarPillView
- (BOOL)canBecomeFocused;
- (BOOL)isUserInteractionEnabled;
- (BOOL)pulsing;
- (CALayer)pulseLayer;
- (STUIStatusBarPillView)initWithFrame:(CGRect)a3;
- (UIColor)pillColor;
- (UIEdgeInsets)alignmentRectInsets;
- (UIView)subviewForBaselineAlignment;
- (UIVisualEffect)visualEffect;
- (UIVisualEffectView)visualEffectView;
- (void)_updateBackgroundColor;
- (void)applyStyleAttributes:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)resumePersistentAnimation;
- (void)setAlignmentRectInsets:(UIEdgeInsets)a3;
- (void)setPillColor:(id)a3;
- (void)setPulseLayer:(id)a3;
- (void)setPulsing:(BOOL)a3;
- (void)setSubviewForBaselineAlignment:(id)a3;
- (void)setVisualEffect:(id)a3;
- (void)setVisualEffectView:(id)a3;
@end

@implementation STUIStatusBarPillView

- (void)setSubviewForBaselineAlignment:(id)a3
{
}

- (STUIStatusBarPillView)initWithFrame:(CGRect)a3
{
  v13[1] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)STUIStatusBarPillView;
  v3 = -[STUIStatusBarRoundedCornerView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E4FB1F00]);
  visualEffectView = v3->_visualEffectView;
  v3->_visualEffectView = v4;

  [(UIVisualEffectView *)v3->_visualEffectView setHidden:1];
  [(STUIStatusBarPillView *)v3 addSubview:v3->_visualEffectView];
  v3->_pulsing = 1;
  uint64_t v6 = [MEMORY[0x1E4F39BE8] layer];
  pulseLayer = v3->_pulseLayer;
  v3->_pulseLayer = (CALayer *)v6;

  id v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0980392157 alpha:0.18];
  -[CALayer setBackgroundColor:](v3->_pulseLayer, "setBackgroundColor:", [v8 CGColor]);

  [(CALayer *)v3->_pulseLayer setOpacity:0.0];
  v9 = [(STUIStatusBarPillView *)v3 layer];
  [v9 addSublayer:v3->_pulseLayer];

  [(STUIStatusBarPillView *)v3 setClipsToBounds:1];
  v13[0] = v3;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  [(STUIStatusBarPersistentAnimationView *)v3 setPersistentAnimations:v10];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_pulseLayer, 0);
  objc_destroyWeak((id *)&self->_subviewForBaselineAlignment);
  objc_storeStrong((id *)&self->_pillColor, 0);
  objc_storeStrong((id *)&self->_visualEffect, 0);
}

- (void)setPillColor:(id)a3
{
  objc_storeStrong((id *)&self->_pillColor, a3);
  [(STUIStatusBarPillView *)self _updateBackgroundColor];
}

- (void)resumePersistentAnimation
{
  [(STUIStatusBarPillView *)self setNeedsLayout];
  if (self->_pulsing)
  {
    id v5 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"opacity"];
    [v5 setDuration:1.0];
    v3 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    [v5 setTimingFunction:v3];

    [v5 setToValue:&unk_1F2F9CD10];
    LODWORD(v4) = 2139095040;
    [v5 setRepeatCount:v4];
    [v5 setAutoreverses:1];
    [v5 setDiscretizesTime:1];
    CAFrameRateRange v7 = CAFrameRateRangeMake(10.0, 120.0, 20.0);
    objc_msgSend(v5, "setPreferredFrameRateRange:", *(double *)&v7.minimum, *(double *)&v7.maximum, *(double *)&v7.preferred);
    [(CALayer *)self->_pulseLayer addAnimation:v5 forKey:@"pulse"];
  }
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)STUIStatusBarPillView;
  [(STUIStatusBarRoundedCornerView *)&v14 layoutSubviews];
  v3 = [(STUIStatusBarPillView *)self layer];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  pulseLayer = self->_pulseLayer;
  if (pulseLayer) {
    -[CALayer setFrame:](pulseLayer, "setFrame:", v5, v7, v9, v11);
  }
  visualEffectView = self->_visualEffectView;
  if (visualEffectView) {
    -[UIVisualEffectView setFrame:](visualEffectView, "setFrame:", v5, v7, v9, v11);
  }
}

- (void)setVisualEffect:(id)a3
{
  double v5 = (UIVisualEffect *)a3;
  if (self->_visualEffect != v5)
  {
    objc_storeStrong((id *)&self->_visualEffect, a3);
    [(UIVisualEffectView *)self->_visualEffectView setEffect:v5];
    [(UIVisualEffectView *)self->_visualEffectView setHidden:v5 == 0];
  }
}

- (void)setPulsing:(BOOL)a3
{
  if (self->_pulsing != a3)
  {
    self->_pulsing = a3;
    if (a3) {
      [(STUIStatusBarPillView *)self resumePersistentAnimation];
    }
    else {
      [(CALayer *)self->_pulseLayer removeAllAnimations];
    }
  }
}

- (BOOL)canBecomeFocused
{
  v2 = [(STUIStatusBarPillView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 3;

  return v3;
}

- (BOOL)isUserInteractionEnabled
{
  v2 = [(STUIStatusBarPillView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceIdiom] == 3;

  return v3;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarPillView;
  [(STUIStatusBarPillView *)&v5 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
  [(STUIStatusBarPillView *)self _updateBackgroundColor];
}

- (void)_updateBackgroundColor
{
  BOOL v3 = [(STUIStatusBarPillView *)self traitCollection];
  if ([v3 userInterfaceIdiom] == 3)
  {
    int v4 = [(STUIStatusBarPillView *)self isFocused];

    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4FB1618] _carSystemFocusColor];
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v5 = [(STUIStatusBarPillView *)self pillColor];
LABEL_6:
  id v6 = (id)v5;
  [(STUIStatusBarPillView *)self setBackgroundColor:v5];
}

- (void)applyStyleAttributes:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [(STUIStatusBarPillView *)self subviews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 applyStyleAttributes:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  double top = self->_alignmentRectInsets.top;
  double left = self->_alignmentRectInsets.left;
  double bottom = self->_alignmentRectInsets.bottom;
  double right = self->_alignmentRectInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setAlignmentRectInsets:(UIEdgeInsets)a3
{
  self->_alignmentRectInsets = a3;
}

- (BOOL)pulsing
{
  return self->_pulsing;
}

- (UIVisualEffect)visualEffect
{
  return self->_visualEffect;
}

- (UIColor)pillColor
{
  return self->_pillColor;
}

- (UIView)subviewForBaselineAlignment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subviewForBaselineAlignment);
  return (UIView *)WeakRetained;
}

- (CALayer)pulseLayer
{
  return self->_pulseLayer;
}

- (void)setPulseLayer:(id)a3
{
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void)setVisualEffectView:(id)a3
{
}

@end