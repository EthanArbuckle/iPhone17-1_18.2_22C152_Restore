@interface UIStandardTextCursorView
- ($1B3FB7A12BCE93AE4CB0A35ACEA563C0)originShape;
- ($6269591C569AE6F7CC7995ADEDD8665A)_shadowSpecForEffects;
- ($6269591C569AE6F7CC7995ADEDD8665A)originShadow;
- (BOOL)_trackingFloatingCursorView;
- (BOOL)assertionActivationStateForType:(unint64_t)a3;
- (BOOL)hiddenForLoupeAnimation;
- (BOOL)isBlinking;
- (BOOL)isFloatingEffectEnabled;
- (BOOL)isGhostEffectEnabled;
- (BOOL)isGlowEffectEnabled;
- (CGRect)_cursorShapeRectForBounds:(CGRect)a3;
- (UIStandardTextCursorView)initWithFrame:(CGRect)a3;
- (UIView)originView;
- (_UIStandardTextCursorViewAudioLevelProvider)audioLevelProvider;
- (double)_shapeScale;
- (id)_createFloatingCursorView;
- (id)_dictationAnimation;
- (id)_fillColorForEffects;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)obtainBlinkAnimationSuppressionAssertionForReason:(id)a3;
- (void)_performBulgeAnimation;
- (void)_setNeedsInitialDictationAnimation;
- (void)_setShapeScale:(double)a3;
- (void)_updateShadow;
- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4;
- (void)layoutSubviews;
- (void)resetBlinkAnimation;
- (void)setAudioLevelProvider:(id)a3;
- (void)setBlinking:(BOOL)a3;
- (void)setFloatingEffectEnabled:(BOOL)a3;
- (void)setGhostEffectEnabled:(BOOL)a3;
- (void)setGlowEffectEnabled:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation UIStandardTextCursorView

- (UIStandardTextCursorView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)UIStandardTextCursorView;
  v3 = -[UIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor insertionPointColor];
    [(UIView *)v3 setTintColor:v4];

    v3->_shapeScale = 1.0;
    v5 = [UIView alloc];
    uint64_t v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    cursorShapeView = v3->_cursorShapeView;
    v3->_cursorShapeView = (UIView *)v6;

    [(UIView *)v3 addSubview:v3->_cursorShapeView];
    v8 = [[_UIAssertionController alloc] initWithAssertionSubject:v3];
    assertionController = v3->_assertionController;
    v3->_assertionController = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    cursorAnimations = v3->_cursorAnimations;
    v3->_cursorAnimations = v10;
  }
  return v3;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)UIStandardTextCursorView;
  [(UIView *)&v4 tintColorDidChange];
  v3 = [(UIView *)self tintColor];
  [(_UITextCursorDictationAnimation *)self->_dictationAnimation setTintColor:v3];
}

- (void)setBlinking:(BOOL)a3
{
  BOOL v3 = a3;
  self->_blinking = a3;
  if (a3 && !self->_blinkAnimation)
  {
    v5 = [[_UITextCursorBlinkAnimation alloc] initWithCursorShapeView:self->_cursorShapeView];
    blinkAnimation = self->_blinkAnimation;
    self->_blinkAnimation = v5;

    [(NSMutableSet *)self->_cursorAnimations addObject:self->_blinkAnimation];
  }
  v7 = self->_blinkAnimation;
  [(_UITextCursorBlinkAnimation *)v7 setEnabled:v3];
}

- (void)resetBlinkAnimation
{
}

- (void)setHidden:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)UIStandardTextCursorView;
  [(UIView *)&v3 setHidden:a3];
}

- (void)_setShapeScale:(double)a3
{
  self->_shapeScale = a3;
  [(UIView *)self setNeedsLayout];
}

- (id)_fillColorForEffects
{
  if (self->_ghostEffectEnabled) {
    +[UIColor colorWithDynamicProvider:&__block_literal_global_275];
  }
  else {
  v2 = [(UIView *)self tintColor];
  }
  return v2;
}

id __48__UIStandardTextCursorView__fillColorForEffects__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 userInterfaceStyle];
  double v3 = 0.0;
  if (v2 == 2) {
    double v3 = 1.0;
  }
  objc_super v4 = +[UIColor colorWithWhite:v3 alpha:0.3];
  return v4;
}

- (CGRect)_cursorShapeRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v19 = *MEMORY[0x1E4F1DAD8];
  double v9 = CGRectGetWidth(a3);
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v20);
  if (v9 >= v10) {
    double v11 = v9;
  }
  else {
    double v11 = v10;
  }
  double v12 = self->_shapeScale + self->_shapeScale;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  double v13 = CGRectGetWidth(v21);
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  double v14 = CGRectGetHeight(v22);
  if (v13 <= v14) {
    double v15 = v12;
  }
  else {
    double v15 = v11;
  }
  if (v13 <= v14) {
    double v16 = v11;
  }
  else {
    double v16 = v12;
  }
  double v17 = v19;
  double v18 = v8;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v18;
  result.origin.CGFloat x = v17;
  return result;
}

- ($6269591C569AE6F7CC7995ADEDD8665A)_shadowSpecForEffects
{
  if (BYTE3(self[11].var2))
  {
    self = +[UIColor colorWithRed:0.274509804 green:0.431372549 blue:0.725490196 alpha:1.0];
    retstr->var0 = self;
    *(_OWORD *)&retstr->var1 = xmmword_186B96D60;
    retstr->var3 = (CGSize)xmmword_186B96D70;
  }
  else
  {
    retstr->var3.CGFloat height = 0.0;
    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
  }
  return self;
}

- (void)_updateShadow
{
  [(UIStandardTextCursorView *)self _shadowSpecForEffects];
  uint64_t v3 = [0 CGColor];
  objc_super v4 = [(UIView *)self->_cursorShapeView layer];
  [v4 setShadowColor:v3];

  v5 = [(UIView *)self->_cursorShapeView layer];
  objc_msgSend(v5, "setShadowOffset:", 0.0, 0.0);

  uint64_t v6 = [(UIView *)self->_cursorShapeView layer];
  [v6 setShadowRadius:0.0];

  v7 = [(UIView *)self->_cursorShapeView layer];
  *(float *)&double v8 = 0.0;
  [v7 setShadowOpacity:v8];
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)UIStandardTextCursorView;
  [(UIView *)&v24 layoutSubviews];
  [(UIView *)self bounds];
  -[UIStandardTextCursorView _cursorShapeRectForBounds:](self, "_cursorShapeRectForBounds:");
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  dictationAnimation = self->_dictationAnimation;
  if (dictationAnimation)
  {
    [(_UITextCursorDictationAnimation *)dictationAnimation animatedCursorShapeBounds];
    if (!CGRectIsEmpty(v25))
    {
      [(_UITextCursorDictationAnimation *)self->_dictationAnimation animatedCursorShapeBounds];
      double v4 = v12;
      double v6 = v13;
      double v8 = v14;
      double v10 = v15;
    }
  }
  [(UIView *)self bounds];
  double v17 = v16;
  double v19 = v18;
  -[UIView setBounds:](self->_cursorShapeView, "setBounds:", 0.0, 0.0, v8, v10);
  -[UIView setCenter:](self->_cursorShapeView, "setCenter:", v4 + v17 * 0.5, v6 + v19 * 0.5);
  CGRect v20 = [(UIStandardTextCursorView *)self _fillColorForEffects];
  [(UIView *)self->_cursorShapeView setBackgroundColor:v20];

  v26.origin.CGFloat x = v4;
  v26.origin.CGFloat y = v6;
  v26.size.CGFloat width = v8;
  v26.size.CGFloat height = v10;
  CGFloat v21 = CGRectGetWidth(v26) * 0.5;
  CGRect v22 = [(UIView *)self->_cursorShapeView layer];
  *(CGFloat *)v23 = v21;
  *(CGFloat *)&v23[1] = v21;
  *(CGFloat *)&v23[2] = v21;
  *(CGFloat *)&v23[3] = v21;
  *(CGFloat *)&v23[4] = v21;
  *(CGFloat *)&v23[5] = v21;
  *(CGFloat *)&v23[6] = v21;
  *(CGFloat *)&v23[7] = v21;
  [v22 setCornerRadii:v23];

  [(NSMutableSet *)self->_cursorAnimations makeObjectsPerformSelector:sel_cursorShapeDidChange];
}

- (void)setFloatingEffectEnabled:(BOOL)a3
{
  self->_floatingEffectEnabled = a3;
  [(UIStandardTextCursorView *)self _updateShadow];
  [(UIView *)self setNeedsLayout];
}

- (void)setGhostEffectEnabled:(BOOL)a3
{
  self->_ghostEffectEnabled = a3;
  [(UIView *)self setNeedsLayout];
}

- (id)_createFloatingCursorView
{
  id v3 = objc_alloc((Class)objc_opt_class());
  [(UIView *)self frame];
  double v4 = objc_msgSend(v3, "initWithFrame:");
  [v4 setFloatingEffectEnabled:1];
  [(UIStandardTextCursorView *)self _shapeScale];
  objc_msgSend(v4, "_setShapeScale:");
  double v5 = [(UIView *)self tintColor];
  [v4 setTintColor:v5];

  objc_storeWeak((id *)&self->_trackedFloatingCursorView, v4);
  return v4;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (void)_performBulgeAnimation
{
  if (!self->_dictationAnimation)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __50__UIStandardTextCursorView__performBulgeAnimation__block_invoke;
    v4[3] = &unk_1E52D9F70;
    v4[4] = self;
    +[UIView animateWithSpringDuration:0 bounce:v4 initialSpringVelocity:0 delay:0.18 options:0.8 animations:0.0 completion:0.0];
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __50__UIStandardTextCursorView__performBulgeAnimation__block_invoke_2;
    v3[3] = &unk_1E52D9F70;
    v3[4] = self;
    +[UIView animateWithSpringDuration:0 bounce:v3 initialSpringVelocity:0 delay:0.18 options:0.0 animations:0.0 completion:0.13];
  }
}

uint64_t __50__UIStandardTextCursorView__performBulgeAnimation__block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 1.1, 1.1);
  uint64_t v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

uint64_t __50__UIStandardTextCursorView__performBulgeAnimation__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (id)_dictationAnimation
{
  dictationAnimation = self->_dictationAnimation;
  if (!dictationAnimation)
  {
    CGAffineTransform v4 = [[_UITextCursorDictationAnimation alloc] initWithCursorShapeView:self->_cursorShapeView];
    CGAffineTransform v5 = self->_dictationAnimation;
    self->_dictationAnimation = v4;

    [(_UITextCursorDictationAnimation *)self->_dictationAnimation setCursorView:self];
    [(NSMutableSet *)self->_cursorAnimations addObject:self->_dictationAnimation];
    dictationAnimation = self->_dictationAnimation;
  }
  return dictationAnimation;
}

- (void)setGlowEffectEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_glowEffectEnabled = a3;
  CGAffineTransform v5 = [(UIStandardTextCursorView *)self _dictationAnimation];
  [v5 setEnabled:v3];

  if (!v3)
  {
    dictationAnimation = self->_dictationAnimation;
    self->_dictationAnimation = 0;
  }
}

- (void)_setNeedsInitialDictationAnimation
{
  id v2 = [(UIStandardTextCursorView *)self _dictationAnimation];
  [v2 setNeedsInitialDictationAnimation];
}

- (void)setAudioLevelProvider:(id)a3
{
  p_audioLevelProvider = &self->_audioLevelProvider;
  id v5 = a3;
  objc_storeWeak((id *)p_audioLevelProvider, v5);
  id v6 = [(UIStandardTextCursorView *)self _dictationAnimation];
  [v6 setAudioLevelProvider:v5];
}

- (BOOL)_trackingFloatingCursorView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trackedFloatingCursorView);
  BOOL v3 = [WeakRetained window];
  BOOL v4 = v3 != 0;

  return v4;
}

- (UIView)originView
{
  if ([(UIStandardTextCursorView *)self _trackingFloatingCursorView]) {
    id WeakRetained = (UIStandardTextCursorView *)objc_loadWeakRetained((id *)&self->_trackedFloatingCursorView);
  }
  else {
    id WeakRetained = self;
  }
  return (UIView *)WeakRetained;
}

- ($1B3FB7A12BCE93AE4CB0A35ACEA563C0)originShape
{
  [(UIView *)self bounds];
  -[UIStandardTextCursorView _cursorShapeRectForBounds:](self, "_cursorShapeRectForBounds:");
  double v6 = v5;
  CGFloat v8 = v7;
  [(UIView *)self bounds];
  retstr->var0.CGFloat x = v10 + v9 * 0.5;
  retstr->var0.CGFloat y = v12 + v11 * 0.5;
  retstr->var1.origin = (CGPoint)*MEMORY[0x1E4F1DAD8];
  retstr->var1.size.CGFloat width = v6;
  retstr->var1.size.CGFloat height = v8;
  retstr->var2 = v6 * 0.5;
  CGRect result = [(UIView *)self tintColor];
  retstr->var3 = result;
  return result;
}

- ($6269591C569AE6F7CC7995ADEDD8665A)originShadow
{
  retstr->var3.CGFloat height = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  return self;
}

- (id)obtainBlinkAnimationSuppressionAssertionForReason:(id)a3
{
  return [(_UIAssertionController *)self->_assertionController vendAssertionOfType:231 initialState:0 reason:a3 requiresExplicitInvalidation:1];
}

- (BOOL)assertionActivationStateForType:(unint64_t)a3
{
  return a3 != 231 || [(UIStandardTextCursorView *)self isBlinking];
}

- (void)assertionActivationStateChangedToState:(BOOL)a3 forType:(unint64_t)a4
{
  if (a4 == 231) {
    [(UIStandardTextCursorView *)self setBlinking:a3];
  }
}

- (BOOL)isBlinking
{
  return self->_blinking;
}

- (double)_shapeScale
{
  return self->_shapeScale;
}

- (BOOL)hiddenForLoupeAnimation
{
  return self->_hiddenForLoupeAnimation;
}

- (BOOL)isGlowEffectEnabled
{
  return self->_glowEffectEnabled;
}

- (BOOL)isFloatingEffectEnabled
{
  return self->_floatingEffectEnabled;
}

- (BOOL)isGhostEffectEnabled
{
  return self->_ghostEffectEnabled;
}

- (_UIStandardTextCursorViewAudioLevelProvider)audioLevelProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_audioLevelProvider);
  return (_UIStandardTextCursorViewAudioLevelProvider *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_audioLevelProvider);
  objc_destroyWeak((id *)&self->_trackedFloatingCursorView);
  objc_storeStrong((id *)&self->_assertionController, 0);
  objc_storeStrong((id *)&self->_cursorAnimations, 0);
  objc_storeStrong((id *)&self->_dictationAnimation, 0);
  objc_storeStrong((id *)&self->_blinkAnimation, 0);
  objc_storeStrong((id *)&self->_cursorShapeView, 0);
}

@end