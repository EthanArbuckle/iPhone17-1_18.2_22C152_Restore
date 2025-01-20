@interface SBUIFaceIDCoachingView
- (BOOL)allowsAlongsideCoaching;
- (NSString)currentSizeCategory;
- (NSString)labelText;
- (SBUIFaceIDCoachingView)init;
- (UIMorphingLabel)_label;
- (_UILegibilitySettings)legibilitySettings;
- (double)stringWidth;
- (unint64_t)coachingCondition;
- (void)_resizeLabelToFirstSizeCategoryThatFits;
- (void)_updateLabelTextForCurrentCoachingConditionAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setAllowsAlongsideCoaching:(BOOL)a3;
- (void)setCoachingCondition:(unint64_t)a3;
- (void)setCoachingCondition:(unint64_t)a3 animated:(BOOL)a4 delay:(double)a5;
- (void)setCurrentSizeCategory:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelText:(id)a3;
- (void)setLegibilitySettings:(id)a3;
@end

@implementation SBUIFaceIDCoachingView

- (SBUIFaceIDCoachingView)init
{
  v8.receiver = self;
  v8.super_class = (Class)SBUIFaceIDCoachingView;
  v2 = [(SBUIFaceIDCoachingView *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__contentSizeCategoryChanged name:*MEMORY[0x1E4F43788] object:0];

    v4 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v5 = [v4 preferredContentSizeCategory];
    currentSizeCategory = v2->_currentSizeCategory;
    v2->_currentSizeCategory = (NSString *)v5;
  }
  return v2;
}

- (void)layoutSubviews
{
  [(SBUIFaceIDCoachingView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SBUIFaceIDCoachingView *)self _label];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v18.origin.double x = v4;
  v18.origin.double y = v6;
  v18.size.double width = v8;
  v18.size.double height = v10;
  CGRect v19 = CGRectInset(v18, -100.0, -100.0);
  double x = v19.origin.x;
  double y = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;
  id v16 = [(SBUIFaceIDCoachingView *)self _label];
  objc_msgSend(v16, "setVisibleRect:", x, y, width, height);
}

- (double)stringWidth
{
  double v3 = [(SBUIFaceIDCoachingView *)self _label];

  if (!v3) {
    return 0.0;
  }
  double v4 = [(SBUIFaceIDCoachingView *)self _label];
  double v5 = SBUICoachingTextForSBUIFaceIDCoachingCondition(self->_coachingCondition);
  [v4 requiredWidthForText:v5];
  double v7 = v6;

  return v7;
}

- (void)setCoachingCondition:(unint64_t)a3
{
}

- (void)setCoachingCondition:(unint64_t)a3 animated:(BOOL)a4 delay:(double)a5
{
  if (self->_coachingCondition != a3)
  {
    BOOL v6 = a4;
    self->_coachingCondition = a3;
    SBUICoachingTextForSBUIFaceIDCoachingCondition(a3);
    double v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    labelText = self->_labelText;
    self->_labelText = v8;

    [(SBUIFaceIDCoachingView *)self _resizeLabelToFirstSizeCategoryThatFits];
    if (v6)
    {
      dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __62__SBUIFaceIDCoachingView_setCoachingCondition_animated_delay___block_invoke;
      v11[3] = &unk_1E5CCC5A8;
      v11[4] = self;
      BOOL v12 = v6;
      dispatch_after(v10, MEMORY[0x1E4F14428], v11);
    }
    else
    {
      [(SBUIFaceIDCoachingView *)self _updateLabelTextForCurrentCoachingConditionAnimated:0];
    }
  }
}

uint64_t __62__SBUIFaceIDCoachingView_setCoachingCondition_animated_delay___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__SBUIFaceIDCoachingView_setCoachingCondition_animated_delay___block_invoke_2;
  v2[3] = &unk_1E5CCC5A8;
  v2[4] = *(void *)(a1 + 32);
  char v3 = *(unsigned char *)(a1 + 40);
  return [MEMORY[0x1E4F42FF0] animateWithDuration:v2 animations:10.0];
}

uint64_t __62__SBUIFaceIDCoachingView_setCoachingCondition_animated_delay___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLabelTextForCurrentCoachingConditionAnimated:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setLegibilitySettings:(id)a3
{
  id v5 = a3;
  p_legibilitySettings = &self->_legibilitySettings;
  if (([(_UILegibilitySettings *)self->_legibilitySettings sb_isEqualToLegibilitySettings:v5] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    double v7 = [(_UILegibilitySettings *)*p_legibilitySettings primaryColor];
    if (v7)
    {
      label = self->_label;
      double v9 = [(_UILegibilitySettings *)*p_legibilitySettings primaryColor];
      [(UIMorphingLabel *)label setTextColor:v9];
    }
    else
    {
      dispatch_time_t v10 = SBLogLockScreenBiometricFaceIDCoaching();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[SBUIFaceIDCoachingView setLegibilitySettings:]((id *)p_legibilitySettings, v10);
      }
    }
  }
}

- (void)_updateLabelTextForCurrentCoachingConditionAnimated:(BOOL)a3
{
  id v4 = [(SBUIFaceIDCoachingView *)self _label];
  [v4 setText:self->_labelText];
}

- (UIMorphingLabel)_label
{
  label = self->_label;
  if (!label)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42BB0]);
    id v5 = (UIMorphingLabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    BOOL v6 = self->_label;
    self->_label = v5;

    [(UIMorphingLabel *)self->_label setTextAlignment:1];
    double v7 = self->_label;
    double v8 = SBUIUIFontForCoachingTextForContentSizeCategory((uint64_t)self->_currentSizeCategory);
    [(UIMorphingLabel *)v7 setFont:v8];

    [(UIMorphingLabel *)self->_label setEnableAnimation:1];
    [(UIMorphingLabel *)self->_label setSuppressLayoutSubviews:0];
    [(UIMorphingLabel *)self->_label setInitialScale:0.8];
    [(UIMorphingLabel *)self->_label setRippleDuration:0.4];
    [(UIMorphingLabel *)self->_label setGlyphScaleAnimationSpeed:10.0];
    [(SBUIFaceIDCoachingView *)self addSubview:self->_label];
    label = self->_label;
  }
  return label;
}

- (void)_resizeLabelToFirstSizeCategoryThatFits
{
  char v3 = [MEMORY[0x1E4F42738] sharedApplication];
  id v4 = [v3 preferredContentSizeCategory];

  id v5 = [(SBUIFaceIDCoachingView *)self _label];
  uint64_t v6 = SBUIUIFontForCoachingTextForContentSizeCategory((uint64_t)v4);
  [v5 setFont:v6];

  double v7 = [(SBUIFaceIDCoachingView *)self _label];
  LOBYTE(v6) = [v7 canFitText:self->_labelText];

  if ((v6 & 1) == 0)
  {
    double v8 = (void *)*MEMORY[0x1E4F437A8];
    double v9 = (void *)*MEMORY[0x1E4F43790];
    while (1)
    {
      UIContentSizeCategoryOneSmallerThanSizeCategory(v4);
      dispatch_time_t v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      IsEqualToCategordouble y = UIContentSizeCategoryIsEqualToCategory(v10, (NSString *)v4);
      BOOL v12 = UIContentSizeCategoryIsInRange(v10, v8, v9);
      if (IsEqualToCategory || !v12) {
        break;
      }
      v13 = v10;

      v14 = [(SBUIFaceIDCoachingView *)self _label];
      v15 = SBUIUIFontForCoachingTextForContentSizeCategory((uint64_t)v13);

      [v14 setFont:v15];
      id v16 = [(SBUIFaceIDCoachingView *)self _label];
      LODWORD(v15) = [v16 canFitText:self->_labelText];

      id v4 = v13;
      if (v15) {
        goto LABEL_9;
      }
    }
  }
  v13 = (NSString *)v4;
LABEL_9:
  currentSizeCategordouble y = self->_currentSizeCategory;
  self->_currentSizeCategordouble y = v13;
}

- (unint64_t)coachingCondition
{
  return self->_coachingCondition;
}

- (NSString)currentSizeCategory
{
  return self->_currentSizeCategory;
}

- (void)setCurrentSizeCategory:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (BOOL)allowsAlongsideCoaching
{
  return self->_allowsAlongsideCoaching;
}

- (void)setAllowsAlongsideCoaching:(BOOL)a3
{
  self->_allowsAlongsideCoaching = a3;
}

- (NSString)labelText
{
  return self->_labelText;
}

- (void)setLabelText:(id)a3
{
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_labelText, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_currentSizeCategory, 0);
}

- (void)setLegibilitySettings:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(*a1, "sb_description");
  id v5 = [*a1 primaryColor];
  int v6 = 138412546;
  double v7 = v4;
  __int16 v8 = 2112;
  double v9 = v5;
  _os_log_fault_impl(&dword_1A7607000, a2, OS_LOG_TYPE_FAULT, "[Legibility] Missing primary color for legibility settings: %@, color: %@", (uint8_t *)&v6, 0x16u);
}

@end