@interface SBUICallToActionLabel
- (CAGradientLayer)gradientLayer;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSMutableArray)animationCompletionBlocks;
- (NSString)description;
- (NSString)text;
- (NSTimer)animationTimer;
- (SBUICallToActionLabel)initWithFrame:(CGRect)a3;
- (SBUILegibilityLabel)label;
- (_UILegibilitySettings)legibilitySettings;
- (double)baselineOffset;
- (id)_callToActionFont;
- (id)_fontWithTextStyle:(id)a3 symbolicTraits:(unsigned int)a4 withMaximumFontSizeCategory:(id)a5;
- (unint64_t)state;
- (void)_actuallyRunGradientAnimation;
- (void)_addAnimationCompletionBlockIfNecessary:(id)a3;
- (void)_createGradientLayer;
- (void)_createLabel;
- (void)_executePostAnimationCompletionBlocks;
- (void)_invalidateGradientAnimationTimer;
- (void)_preferredTextSizeChanged:(id)a3;
- (void)_resetGradientAndLabelBefore:(BOOL)a3;
- (void)_runFadeAnimationForFadingOut:(BOOL)a3 duration:(double)a4 completion:(id)a5;
- (void)_runGradientAnimation:(BOOL)a3;
- (void)_timerTriggered;
- (void)_updateLabelTextWithLanguage:(id)a3;
- (void)animationDidStart:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)didMoveToSuperview;
- (void)fadeIn;
- (void)fadeInImmediately:(BOOL)a3;
- (void)fadeInImmediately:(BOOL)a3 completion:(id)a4;
- (void)fadeOut;
- (void)fadeOutWithDuration:(double)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)setAnimationCompletionBlocks:(id)a3;
- (void)setAnimationTimer:(id)a3;
- (void)setGradientLayer:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setText:(id)a3;
- (void)setText:(id)a3 forLanguage:(id)a4 animated:(BOOL)a5;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)sizeToFit;
@end

@implementation SBUICallToActionLabel

- (SBUICallToActionLabel)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBUICallToActionLabel;
  v3 = -[SBUICallToActionLabel initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    animationCompletionBlocks = v3->_animationCompletionBlocks;
    v3->_animationCompletionBlocks = (NSMutableArray *)v4;

    [(SBUICallToActionLabel *)v3 _createLabel];
    [(SBUICallToActionLabel *)v3 _createGradientLayer];
    [(SBUICallToActionLabel *)v3 setState:0];
    [(SBUICallToActionLabel *)v3 bs_setHitTestingDisabled:1];
    [(SBUICallToActionLabel *)v3 setAccessibilityIdentifier:@"call-to-action-label"];
    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v3 selector:sel__preferredTextSizeChanged_ name:*MEMORY[0x1E4F43788] object:0];
  }
  return v3;
}

- (void)didMoveToSuperview
{
  v3 = [(SBUICallToActionLabel *)self superview];

  if (!v3)
  {
    [(SBUICallToActionLabel *)self cancelFadeInTimerIfNecessary];
    gradientLayer = self->_gradientLayer;
    [(CAGradientLayer *)gradientLayer removeAllAnimations];
  }
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SBUICallToActionLabel;
  [(SBUICallToActionLabel *)&v13 layoutSubviews];
  [(SBUICallToActionLabel *)self bounds];
  double x = v14.origin.x;
  double y = v14.origin.y;
  double width = v14.size.width;
  double height = v14.size.height;
  double MidX = CGRectGetMidX(v14);
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  double MidY = CGRectGetMidY(v15);
  -[SBUILegibilityLabel setFrame:](self->_label, "setFrame:", x, y, width, height);
  -[SBUILegibilityLabel setCenter:](self->_label, "setCenter:", MidX, MidY);
  [(SBUILegibilityLabel *)self->_label frame];
  long double v10 = v9;
  [(SBUILegibilityLabel *)self->_label frame];
  double v12 = fmax(hypot(v10, v11) * 2.0 + 32.0, 364.0);
  -[CAGradientLayer setBounds:](self->_gradientLayer, "setBounds:", 0.0, 0.0, v12, v12);
  -[CAGradientLayer setPosition:](self->_gradientLayer, "setPosition:", MidX, MidY + 32.0);
}

- (void)sizeToFit
{
  [(SBUILegibilityLabel *)self->_label sizeToFit];
  [(SBUILegibilityLabel *)self->_label bounds];
  -[SBUICallToActionLabel setBounds:](self, "setBounds:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SBUILegibilityLabel sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)setLegibilitySettings:(id)a3
{
  id v6 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    v5 = [(SBUICallToActionLabel *)self label];
    [v5 setLegibilitySettings:v6];
  }
}

- (double)baselineOffset
{
  v2 = [(SBUICallToActionLabel *)self label];
  [v2 baselineOffset];
  double v4 = v3;

  return v4;
}

- (void)fadeIn
{
}

- (void)fadeInImmediately:(BOOL)a3
{
}

- (void)fadeInImmediately:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(id, id))a4;
  switch([(SBUICallToActionLabel *)self state])
  {
    case 0uLL:
      [(SBUICallToActionLabel *)self _addAnimationCompletionBlockIfNecessary:v6];
      [(SBUICallToActionLabel *)self _runGradientAnimation:v4];
      break;
    case 1uLL:
      [(SBUICallToActionLabel *)self _addAnimationCompletionBlockIfNecessary:v6];
      break;
    case 2uLL:
      if (v6) {
        v6[2](v6, v6);
      }
      break;
    case 3uLL:
      [(SBUICallToActionLabel *)self _runFadeAnimationForFadingOut:0 duration:v6 completion:0.4];
      break;
    default:
      break;
  }
}

- (void)fadeOut
{
}

- (void)fadeOutWithDuration:(double)a3 completion:(id)a4
{
  v7 = (void (**)(void))a4;
  unint64_t v6 = [(SBUICallToActionLabel *)self state];
  if (v6 - 1 < 2)
  {
    [(SBUICallToActionLabel *)self _runFadeAnimationForFadingOut:1 duration:v7 completion:a3];
  }
  else if (!v6 || v6 == 3)
  {
    [(SBUICallToActionLabel *)self _invalidateGradientAnimationTimer];
    [(CAGradientLayer *)self->_gradientLayer removeAnimationForKey:@"call-to-action"];
    if (v7) {
      v7[2]();
    }
  }
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (a4)
  {
    if (a3)
    {
      [(SBUICallToActionLabel *)self fadeIn];
    }
    else
    {
      [(SBUICallToActionLabel *)self fadeOut];
    }
  }
  else
  {
    uint64_t v5 = 2;
    if (!a3) {
      uint64_t v5 = 0;
    }
    BOOL v6 = !a3;
    [(SBUICallToActionLabel *)self setState:v5];
    [(SBUICallToActionLabel *)self _resetGradientAndLabelBefore:v6];
    [(SBUICallToActionLabel *)self _invalidateGradientAnimationTimer];
    [(CAGradientLayer *)self->_gradientLayer removeAnimationForKey:@"call-to-action"];
    [(SBUICallToActionLabel *)self _executePostAnimationCompletionBlocks];
  }
}

- (void)setText:(id)a3
{
}

- (void)setText:(id)a3 forLanguage:(id)a4 animated:(BOOL)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (!self->_text || (objc_msgSend(v8, "isEqualToString:") & 1) == 0)
  {
    long double v10 = (NSString *)[v8 copy];
    text = self->_text;
    self->_text = v10;

    double v12 = SBLogDashBoardCallToActionLabel();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_super v13 = self->_text;
      uint64_t v14 = NSStringFromBOOL();
      CGRect v15 = (void *)v14;
      unint64_t v16 = self->_state - 1;
      if (v16 > 2) {
        v17 = @"hidden";
      }
      else {
        v17 = off_1E5CCEB78[v16];
      }
      *(_DWORD *)buf = 138412802;
      v27 = v13;
      __int16 v28 = 2112;
      uint64_t v29 = v14;
      __int16 v30 = 2114;
      v31 = v17;
      _os_log_impl(&dword_1A7607000, v12, OS_LOG_TYPE_INFO, "Changing call to action text: %@ (animated: %@, current state: %{public}@)", buf, 0x20u);
    }
    if (a5)
    {
      objc_initWeak((id *)buf, self);
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __54__SBUICallToActionLabel_setText_forLanguage_animated___block_invoke;
      v23 = &unk_1E5CCEB38;
      objc_copyWeak(&v25, (id *)buf);
      id v24 = v9;
      v18 = (void (**)(void))MEMORY[0x1AD0CF1C0](&v20);
      unint64_t v19 = [(SBUICallToActionLabel *)self state];
      if (v19 - 1 < 2)
      {
        [(SBUICallToActionLabel *)self _runFadeAnimationForFadingOut:1 duration:v18 completion:0.4];
      }
      else if (v19)
      {
        if (v19 == 3) {
          [(SBUICallToActionLabel *)self _addAnimationCompletionBlockIfNecessary:v18];
        }
      }
      else
      {
        v18[2](v18);
      }

      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      [(SBUICallToActionLabel *)self _updateLabelTextWithLanguage:v9];
    }
  }
}

void __54__SBUICallToActionLabel_setText_forLanguage_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateLabelTextWithLanguage:*(void *)(a1 + 32)];
  [WeakRetained fadeInImmediately:1];
}

- (NSString)description
{
  double v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  BOOL v4 = v3;
  unint64_t v5 = self->_state - 1;
  if (v5 > 2) {
    BOOL v6 = @"hidden";
  }
  else {
    BOOL v6 = off_1E5CCEB78[v5];
  }
  [v3 appendString:v6 withName:@"state"];
  v7 = [v4 build];

  return (NSString *)v7;
}

- (void)setState:(unint64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    self->_state = a3;
    BOOL v4 = SBLogDashBoardCallToActionLabel();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      unint64_t v5 = self->_state - 1;
      if (v5 > 2) {
        BOOL v6 = @"hidden";
      }
      else {
        BOOL v6 = off_1E5CCEB78[v5];
      }
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_1A7607000, v4, OS_LOG_TYPE_INFO, "Call to action label state changing to %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_updateLabelTextWithLanguage:(id)a3
{
  id v8 = a3;
  BOOL v4 = [(SBUICallToActionLabel *)self label];
  unint64_t v5 = _UIAdaptLocalizedStringForView();
  if (v5)
  {
    BOOL v6 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v5];
    if (v8)
    {
      int v7 = [v6 string];
      objc_msgSend(v6, "addAttribute:value:range:", @"NSLanguage", v8, 0, objc_msgSend(v7, "length"));
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  [v4 setAttributedText:v6];
  [v4 setNumberOfLines:4];
}

- (void)_createLabel
{
  id v10 = [(SBUICallToActionLabel *)self _callToActionFont];
  double v3 = [SBUILegibilityLabel alloc];
  BOOL v4 = [MEMORY[0x1E4F43228] sharedInstanceForStyle:1];
  unint64_t v5 = [(SBUICallToActionLabel *)self text];
  BOOL v6 = [(SBUILegibilityLabel *)v3 initWithSettings:v4 strength:v5 string:v10 font:0.25];

  int v7 = [v10 fontDescriptor];
  [v7 pointSize];
  double v9 = v8;

  [(SBUILegibilityLabel *)v6 setMinimumScaleFactor:(v9 + -2.0) / v9];
  [(SBUILegibilityLabel *)v6 setAdjustsFontSizeToFitWidth:1];
  [(SBUICallToActionLabel *)self addSubview:v6];
  [(SBUICallToActionLabel *)self setLabel:v6];
}

- (id)_callToActionFont
{
  if (_callToActionFont_onceToken != -1) {
    dispatch_once(&_callToActionFont_onceToken, &__block_literal_global_40);
  }
  unint64_t v5 = (void *)_callToActionFont_callToActionFont;
  if (!_callToActionFont_callToActionFont)
  {
    BOOL v6 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory(v6)) {
      uint64_t v7 = 32770;
    }
    else {
      uint64_t v7 = 2;
    }

    int v8 = __sb__runningInSpringBoard();
    char v9 = v8;
    if (v8)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        id v10 = (id)*MEMORY[0x1E4F43768];
LABEL_30:
        uint64_t v17 = [(SBUICallToActionLabel *)self _fontWithTextStyle:*MEMORY[0x1E4F43870] symbolicTraits:v7 withMaximumFontSizeCategory:v10];
        v18 = (void *)_callToActionFont_callToActionFont;
        _callToActionFont_callToActionFont = v17;

        unint64_t v5 = (void *)_callToActionFont_callToActionFont;
        goto LABEL_31;
      }
    }
    else
    {
      BOOL v6 = [MEMORY[0x1E4F42948] currentDevice];
      if ([(NSString *)v6 userInterfaceIdiom])
      {
        id v10 = (id)*MEMORY[0x1E4F43768];
        goto LABEL_29;
      }
    }
    int v11 = __sb__runningInSpringBoard();
    char v12 = v11;
    if (v11)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        id v10 = (id)*MEMORY[0x1E4F43770];
        if (v9) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
    }
    else
    {
      v2 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v2 userInterfaceIdiom])
      {
        id v10 = (id)*MEMORY[0x1E4F43770];
        goto LABEL_35;
      }
    }
    int v13 = __sb__runningInSpringBoard();
    char v14 = v13;
    if (v13)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      double v3 = [MEMORY[0x1E4F42D90] mainScreen];
      [v3 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v15 >= *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
      unint64_t v16 = (id *)MEMORY[0x1E4F43768];
    }
    else {
      unint64_t v16 = (id *)MEMORY[0x1E4F43770];
    }
    id v10 = *v16;
    if (v14)
    {
      if (v12) {
        goto LABEL_28;
      }
    }
    else
    {

      if (v12)
      {
LABEL_28:
        if (v9) {
          goto LABEL_30;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
LABEL_35:

    if (v9) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_31:
  return v5;
}

void __42__SBUICallToActionLabel__callToActionFont__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F43788];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_23];
}

void __42__SBUICallToActionLabel__callToActionFont__block_invoke_2()
{
  uint64_t v0 = (void *)_callToActionFont_callToActionFont;
  _callToActionFont_callToActionFont = 0;
}

- (id)_fontWithTextStyle:(id)a3 symbolicTraits:(unsigned int)a4 withMaximumFontSizeCategory:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  int v8 = (NSString *)a5;
  char v9 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
  NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v9, v8);

  int v11 = (void *)MEMORY[0x1E4F42A38];
  if (v10 == NSOrderedAscending)
  {
    int v13 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:v7];
  }
  else
  {
    char v12 = [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:v8];
    int v13 = [v11 preferredFontDescriptorWithTextStyle:v7 compatibleWithTraitCollection:v12];
  }
  char v14 = [v13 fontDescriptorWithSymbolicTraits:v6];
  double v15 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v14 size:0.0];

  return v15;
}

- (void)_createGradientLayer
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F39BD0]);
  [v3 setType:*MEMORY[0x1E4F3A3A0]];
  objc_msgSend(v3, "setStartPoint:", 0.5, 0.5);
  objc_msgSend(v3, "setEndPoint:", 1.0, 1.0);
  id v4 = [MEMORY[0x1E4F428B8] whiteColor];
  v10[0] = [v4 CGColor];
  id v5 = [MEMORY[0x1E4F428B8] clearColor];
  v10[1] = [v5 CGColor];
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  [v3 setColors:v6];

  [(SBUICallToActionLabel *)self _resetGradientAndLabelBefore:1];
  id v7 = [(SBUICallToActionLabel *)self layer];
  [v7 addSublayer:v3];

  [(SBUICallToActionLabel *)self setGradientLayer:v3];
  int v8 = [(SBUICallToActionLabel *)self label];
  char v9 = [v8 layer];
  [v9 setMask:v3];
}

- (void)_preferredTextSizeChanged:(id)a3
{
  label = self->_label;
  id v5 = [(SBUICallToActionLabel *)self _callToActionFont];
  [(SBUILegibilityLabel *)label setFont:v5];

  [(SBUICallToActionLabel *)self _updateLabelTextWithLanguage:0];
}

- (void)_runGradientAnimation:(BOOL)a3
{
  if (a3)
  {
    [(SBUICallToActionLabel *)self _invalidateGradientAnimationTimer];
    id v4 = SBLogDashBoardCallToActionLabel();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[SBUICallToActionLabel _runGradientAnimation:]();
    }

    [(SBUICallToActionLabel *)self _actuallyRunGradientAnimation];
  }
  else
  {
    id v5 = [(SBUICallToActionLabel *)self animationTimer];

    if (!v5)
    {
      uint64_t v6 = SBLogDashBoardCallToActionLabel();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[SBUICallToActionLabel _runGradientAnimation:]();
      }

      id v7 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__actuallyRunGradientAnimation selector:0 userInfo:0 repeats:4.0];
      [(SBUICallToActionLabel *)self setAnimationTimer:v7];
    }
  }
}

- (void)_invalidateGradientAnimationTimer
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7607000, v0, v1, "%{public}@: invalidating fade-in timer", v2, v3, v4, v5, v6);
}

- (void)_timerTriggered
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7607000, v0, v1, "%{public}@: fade-in timer triggered", v2, v3, v4, v5, v6);
}

- (void)_actuallyRunGradientAnimation
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_1();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A7607000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: adding gradient animation: %@", v2, 0x16u);
}

- (void)_runFadeAnimationForFadingOut:(BOOL)a3 duration:(double)a4 completion:(id)a5
{
  if (a3) {
    uint64_t v8 = 3;
  }
  else {
    uint64_t v8 = 1;
  }
  id v9 = a5;
  [(SBUICallToActionLabel *)self setState:v8];
  [(SBUICallToActionLabel *)self _invalidateGradientAnimationTimer];
  [(CAGradientLayer *)self->_gradientLayer removeAnimationForKey:@"call-to-action"];
  [(SBUICallToActionLabel *)self _addAnimationCompletionBlockIfNecessary:v9];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__SBUICallToActionLabel__runFadeAnimationForFadingOut_duration_completion___block_invoke;
  v12[3] = &unk_1E5CCC5A8;
  v12[4] = self;
  BOOL v13 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__SBUICallToActionLabel__runFadeAnimationForFadingOut_duration_completion___block_invoke_2;
  void v10[3] = &unk_1E5CCCDA8;
  BOOL v11 = a3;
  v10[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:4 delay:v12 options:v10 animations:a4 completion:0.0];
}

uint64_t __75__SBUICallToActionLabel__runFadeAnimationForFadingOut_duration_completion___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:v1];
}

uint64_t __75__SBUICallToActionLabel__runFadeAnimationForFadingOut_duration_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) setState:0];
    [*(id *)(a1 + 32) _resetGradientAndLabelBefore:1];
  }
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _executePostAnimationCompletionBlocks];
}

- (void)_resetGradientAndLabelBefore:(BOOL)a3
{
  BOOL v3 = a3;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(SBUILegibilityLabel *)self->_label setAlpha:1.0];
  gradientLayer = self->_gradientLayer;
  if (v3)
  {
    [(CAGradientLayer *)gradientLayer setLocations:&unk_1EFCEAFB8];
    uint8_t v6 = self->_gradientLayer;
    CATransform3DMakeScale(&v9, 0.0, 0.0, 1.0);
    id v7 = &v9;
  }
  else
  {
    [(CAGradientLayer *)gradientLayer setLocations:&unk_1EFCEAFD0];
    uint8_t v6 = self->_gradientLayer;
    CATransform3DMakeScale(&v8, 1.0, 1.0, 1.0);
    id v7 = &v8;
  }
  [(CAGradientLayer *)v6 setTransform:v7];
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)_addAnimationCompletionBlockIfNecessary:(id)a3
{
  if (a3)
  {
    animationCompletionBlocks = self->_animationCompletionBlocks;
    id v5 = (id)[a3 copy];
    uint64_t v4 = (void *)MEMORY[0x1AD0CF1C0]();
    [(NSMutableArray *)animationCompletionBlocks addObject:v4];
  }
}

- (void)_executePostAnimationCompletionBlocks
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  BOOL v3 = self->_animationCompletionBlocks;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v8 + 1) + 8 * v7) + 16))(*(void *)(*((void *)&v8 + 1) + 8 * v7));
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_animationCompletionBlocks removeAllObjects];
}

- (void)animationDidStart:(id)a3
{
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v6 = SBLogDashBoardCallToActionLabel();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SBUICallToActionLabel animationDidStop:finished:]();
  }

  if (v4 && [(SBUICallToActionLabel *)self state] == 1)
  {
    [(SBUICallToActionLabel *)self setState:2];
    [(SBUICallToActionLabel *)self _executePostAnimationCompletionBlocks];
  }
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (NSString)text
{
  return self->_text;
}

- (SBUILegibilityLabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (NSTimer)animationTimer
{
  return self->_animationTimer;
}

- (void)setAnimationTimer:(id)a3
{
}

- (NSMutableArray)animationCompletionBlocks
{
  return self->_animationCompletionBlocks;
}

- (void)setAnimationCompletionBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_animationTimer, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

- (void)_runGradientAnimation:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7607000, v0, v1, "%{public}@: running fade-in animation immediately", v2, v3, v4, v5, v6);
}

- (void)_runGradientAnimation:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7607000, v0, v1, "%{public}@: scheduling fade-in timer", v2, v3, v4, v5, v6);
}

- (void)animationDidStop:finished:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1A7607000, v0, v1, "%{public}@: gradient fade-in finished", v2, v3, v4, v5, v6);
}

@end