@interface SBFLockScreenDateSubtitleView
+ ($01BB1521EC52D44A8E7628F5261DCEC8)labelFontMetrics;
+ (double)scaledFontSize:(double)a3 withMaximumFontSizeCategory:(id)a4;
+ (id)labelFont;
- (CGRect)accessoryViewFrame;
- (CGRect)subtitleLabelFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)string;
- (SBFLockScreenDateSubtitleView)init;
- (SBFLockScreenDateSubtitleView)initWithString:(id)a3 accessoryView:(id)a4;
- (UIEdgeInsets)subtitleLabelCharacterOverflowInsets;
- (UIFont)font;
- (UIView)accessoryView;
- (_UILegibilitySettings)legibilitySettings;
- (double)baselineOffsetFromBottom;
- (double)baselineOffsetFromOrigin;
- (double)interItemSpacing;
- (double)strength;
- (void)_updateForCurrentSizeCategory;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAccessoryView:(id)a3;
- (void)setFont:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setStrength:(double)a3;
- (void)setString:(id)a3;
@end

@implementation SBFLockScreenDateSubtitleView

- (void)setString:(id)a3
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[UIView sizeThatFits:](self->_accessoryView, "sizeThatFits:");
  double v7 = v6;
  -[SBUILegibilityLabel sizeThatFits:](self->_label, "sizeThatFits:", width, height);
  double v9 = fmax(v7, v8);
  [(SBFLockScreenDateSubtitleView *)self interItemSpacing];
  v10 = [MEMORY[0x1E4F42D90] mainScreen];
  UIRoundToScreenScale();
  double v12 = v11;

  double v13 = v12;
  double v14 = v9;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (double)interItemSpacing
{
  if (!self->_accessoryView) {
    return 0.0;
  }
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() == 2) {
      return 12.0;
    }
    else {
      return 9.0;
    }
  }
  else
  {
    v3 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v3 userInterfaceIdiom] == 1) {
      double v2 = 12.0;
    }
    else {
      double v2 = 9.0;
    }
  }
  return v2;
}

- (SBFLockScreenDateSubtitleView)init
{
  return [(SBFLockScreenDateSubtitleView *)self initWithString:0 accessoryView:0];
}

- (SBFLockScreenDateSubtitleView)initWithString:(id)a3 accessoryView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SBFLockScreenDateSubtitleView;
  double v8 = [(SBFLockScreenDateSubtitleView *)&v23 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F43228]) initWithStyle:1];
    legibilitySettings = v8->_legibilitySettings;
    v8->_legibilitySettings = (_UILegibilitySettings *)v9;

    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    double v11 = (void *)getSBUILegibilityLabelClass_softClass_0;
    uint64_t v28 = getSBUILegibilityLabelClass_softClass_0;
    if (!getSBUILegibilityLabelClass_softClass_0)
    {
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __getSBUILegibilityLabelClass_block_invoke_0;
      v24[3] = &unk_1E548C938;
      v24[4] = &v25;
      __getSBUILegibilityLabelClass_block_invoke_0((uint64_t)v24);
      double v11 = (void *)v26[3];
    }
    double v12 = v11;
    _Block_object_dispose(&v25, 8);
    id v13 = [v12 alloc];
    double v14 = v8->_legibilitySettings;
    double v15 = *MEMORY[0x1E4F440E0];
    v16 = +[SBFLockScreenDateSubtitleView labelFont];
    uint64_t v17 = [v13 initWithSettings:v14 strength:v6 string:v16 font:v15];
    label = v8->_label;
    v8->_label = (SBUILegibilityLabel *)v17;

    v19 = v8->_label;
    v20 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBUILegibilityLabel *)v19 setBackgroundColor:v20];

    [(SBUILegibilityLabel *)v8->_label setAdjustsFontSizeToFitWidth:1];
    [(SBUILegibilityLabel *)v8->_label setMinimumScaleFactor:0.25];
    [(SBFLockScreenDateSubtitleView *)v8 addSubview:v8->_label];
    [(SBFLockScreenDateSubtitleView *)v8 setAccessoryView:v7];
    v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v8 selector:sel__updateForCurrentSizeCategory name:*MEMORY[0x1E4F43788] object:0];
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenDateSubtitleView;
  [(SBFLockScreenDateSubtitleView *)&v4 dealloc];
}

- (NSString)string
{
  return (NSString *)[(SBUILegibilityLabel *)self->_label string];
}

- (void)setAccessoryView:(id)a3
{
  v5 = (UIView *)a3;
  accessoryView = self->_accessoryView;
  if (accessoryView != v5)
  {
    id v7 = v5;
    if (accessoryView) {
      [(UIView *)accessoryView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_accessoryView, a3);
    if (v7) {
      [(SBFLockScreenDateSubtitleView *)self addSubview:self->_accessoryView];
    }
    accessoryView = (UIView *)[(SBFLockScreenDateSubtitleView *)self layoutIfNeeded];
    v5 = v7;
  }
  MEMORY[0x1F41817F8](accessoryView, v5);
}

- (void)setLegibilitySettings:(id)a3
{
  p_legibilitySettings = &self->_legibilitySettings;
  id v6 = a3;
  if (!-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](*p_legibilitySettings, "sb_isEqualToLegibilitySettings:"))
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBUILegibilityLabel *)self->_label setLegibilitySettings:*p_legibilitySettings];
  }
}

- (void)setStrength:(double)a3
{
  if (self->_strength != a3)
  {
    self->_strength = a3;
    -[SBUILegibilityLabel setStrength:](self->_label, "setStrength:");
  }
}

- (UIFont)font
{
  return (UIFont *)[(SBUILegibilityLabel *)self->_label font];
}

- (void)setFont:(id)a3
{
}

- (void)_updateForCurrentSizeCategory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SBFLockScreenDateSubtitleView__updateForCurrentSizeCategory__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __62__SBFLockScreenDateSubtitleView__updateForCurrentSizeCategory__block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  v3 = [(id)objc_opt_class() labelFont];
  [v2 setFont:v3];

  objc_super v4 = *(void **)(a1 + 32);
  return [v4 setNeedsLayout];
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBFLockScreenDateSubtitleView;
  [(SBFLockScreenDateSubtitleView *)&v5 layoutSubviews];
  [(UIView *)self->_accessoryView sizeToFit];
  accessoryView = self->_accessoryView;
  [(SBFLockScreenDateSubtitleView *)self accessoryViewFrame];
  -[UIView setFrame:](accessoryView, "setFrame:");
  [(SBUILegibilityLabel *)self->_label sizeToFit];
  label = self->_label;
  [(SBFLockScreenDateSubtitleView *)self subtitleLabelFrame];
  -[SBUILegibilityLabel setFrame:](label, "setFrame:");
}

- (CGRect)accessoryViewFrame
{
  [(SBFLockScreenDateSubtitleView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(UIView *)self->_accessoryView frame];
  UIRectCenteredYInRectScale();
  double v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  if (objc_msgSend((id)*MEMORY[0x1E4F43630], "userInterfaceLayoutDirection", 0) == 1)
  {
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.double width = v8;
    v24.size.double height = v10;
    double MaxX = CGRectGetMaxX(v24);
    v25.origin.x = v12;
    v25.origin.y = v14;
    v25.size.double width = v16;
    v25.size.double height = v18;
    double v12 = MaxX - CGRectGetWidth(v25);
  }
  double v20 = v12;
  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (CGRect)subtitleLabelFrame
{
  [(SBFLockScreenDateSubtitleView *)self bounds];
  [(SBUILegibilityLabel *)self->_label bounds];
  [(SBFLockScreenDateSubtitleView *)self accessoryViewFrame];
  CGFloat v24 = v4;
  CGFloat v25 = v3;
  double v26 = v5;
  CGFloat rect = v6;
  UIRectCenteredYInRectScale();
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  if (objc_msgSend((id)*MEMORY[0x1E4F43630], "userInterfaceLayoutDirection", 0) == 1)
  {
    v27.origin.y = v24;
    v27.origin.x = v25;
    v27.size.double width = v26;
    v27.size.double height = rect;
    double MinX = CGRectGetMinX(v27);
    [(SBFLockScreenDateSubtitleView *)self interItemSpacing];
    double v17 = MinX - v16;
    v28.origin.x = v8;
    v28.origin.y = v10;
    v28.size.double width = v12;
    v28.size.double height = v14;
    double v18 = v17 - CGRectGetWidth(v28);
  }
  else
  {
    [(SBFLockScreenDateSubtitleView *)self interItemSpacing];
    double v18 = v26 + v19;
  }
  double v20 = v10;
  double v21 = v12;
  double v22 = v14;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.y = v20;
  result.origin.x = v18;
  return result;
}

- (UIEdgeInsets)subtitleLabelCharacterOverflowInsets
{
  [(SBUILegibilityLabel *)self->_label characterOverflowInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (id)labelFont
{
  if (labelFont_onceToken != -1) {
    dispatch_once(&labelFont_onceToken, &__block_literal_global_32);
  }
  if (labelFont_timeSubtitleFont) {
    goto LABEL_31;
  }
  uint64_t v3 = 0x1E4F42000uLL;
  double v4 = (void *)MEMORY[0x1E4F42A30];
  double v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  double v7 = 22.0;
  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v8 = 23.0;
  }
  else {
    double v8 = 22.0;
  }
  uint64_t v9 = [v4 systemFontOfSize:v8];
  CGFloat v10 = (void *)labelFont_timeSubtitleFont;
  labelFont_timeSubtitleFont = v9;

  double v11 = (void *)MEMORY[0x1E4F42A30];
  CGFloat v12 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v13 = [v12 userInterfaceIdiom];

  if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v7 = 23.0;
  }
  uint64_t v14 = __sb__runningInSpringBoard();
  if (v14)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
LABEL_26:
      double v18 = (void *)MEMORY[0x1E4F43768];
      goto LABEL_27;
    }
  }
  else
  {
    CGFloat v12 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v12 userInterfaceIdiom])
    {
      int v15 = 0;
      int v16 = 0;
      int v17 = 1;
      goto LABEL_26;
    }
  }
  int v17 = v14 ^ 1;
  uint64_t v3 = __sb__runningInSpringBoard();
  if (v3)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v15 = 0;
      int v16 = 0;
      double v18 = (void *)MEMORY[0x1E4F43770];
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v14 userInterfaceIdiom])
    {
      int v16 = 0;
      double v18 = (void *)MEMORY[0x1E4F43770];
      int v15 = 1;
      goto LABEL_27;
    }
  }
  int v15 = v3 ^ 1;
  int v19 = __sb__runningInSpringBoard();
  if (v19)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v3 _referenceBounds];
  }
  int v16 = v19 ^ 1;
  BSSizeRoundForScale();
  if (v20 >= *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_26;
  }
  double v18 = (void *)MEMORY[0x1E4F43770];
LABEL_27:
  [a1 scaledFontSize:*v18 withMaximumFontSizeCategory:v7];
  uint64_t v21 = objc_msgSend(v11, "systemFontOfSize:");
  double v22 = (void *)labelFont_timeSubtitleFont;
  labelFont_timeSubtitleFont = v21;

  if (v16)
  {

    if (!v15) {
      goto LABEL_29;
    }
  }
  else if (!v15)
  {
LABEL_29:
    if (!v17) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }

  if (v17) {
LABEL_30:
  }

LABEL_31:
  double v23 = (void *)labelFont_timeSubtitleFont;
  return v23;
}

void __42__SBFLockScreenDateSubtitleView_labelFont__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F43788];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_15];
}

void __42__SBFLockScreenDateSubtitleView_labelFont__block_invoke_2()
{
  uint64_t v0 = (void *)labelFont_timeSubtitleFont;
  labelFont_timeSubtitleFont = 0;
}

+ ($01BB1521EC52D44A8E7628F5261DCEC8)labelFontMetrics
{
  if (labelFontMetrics_onceToken != -1) {
    dispatch_once(&labelFontMetrics_onceToken, &__block_literal_global_18);
  }
  double v3 = *(double *)&labelFontMetrics_labelFontMetrics;
  if (*(double *)&labelFontMetrics_labelFontMetrics == 0.0)
  {
    double v4 = objc_msgSend(a1, "labelFont", *(double *)&labelFontMetrics_labelFontMetrics);
    [v4 ascender];
    uint64_t v6 = v5;
    [v4 descender];
    uint64_t v8 = v7;
    [v4 _bodyLeading];
    uint64_t v10 = v9;
    [v4 capHeight];
    *(void *)&labelFontMetrics_labelFontMetrics = v6;
    *((void *)&labelFontMetrics_labelFontMetrics + 1) = v8;
    qword_1EB3CFC70 = v10;
    qword_1EB3CFC78 = v11;

    double v3 = *(double *)&labelFontMetrics_labelFontMetrics;
  }
  double v12 = *((double *)&labelFontMetrics_labelFontMetrics + 1);
  double v13 = *(double *)&qword_1EB3CFC70;
  double v14 = *(double *)&qword_1EB3CFC78;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v3;
  return result;
}

void __49__SBFLockScreenDateSubtitleView_labelFontMetrics__block_invoke()
{
  labelFontMetrics_labelFontMetrics = SBFFontMetricsZero;
  *(_OWORD *)&qword_1EB3CFC70 = unk_18B5E6018;
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F43788];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_20];
}

double __49__SBFLockScreenDateSubtitleView_labelFontMetrics__block_invoke_2()
{
  double result = *(double *)&SBFFontMetricsZero;
  labelFontMetrics_labelFontMetrics = SBFFontMetricsZero;
  *(_OWORD *)&qword_1EB3CFC70 = unk_18B5E6018;
  return result;
}

+ (double)scaledFontSize:(double)a3 withMaximumFontSizeCategory:(id)a4
{
  uint64_t v5 = (NSString *)a4;
  uint64_t v6 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
  NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory(v6, v5);

  uint64_t v8 = (void *)MEMORY[0x1E4F42A30];
  uint64_t v9 = *MEMORY[0x1E4F43870];
  if (v7 == NSOrderedAscending)
  {
    uint64_t v11 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  }
  else
  {
    uint64_t v10 = [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:v5];
    uint64_t v11 = [v8 preferredFontForTextStyle:v9 compatibleWithTraitCollection:v10];
  }
  [v11 _scaledValueForValue:a3];
  double v12 = [MEMORY[0x1E4F42D90] mainScreen];
  UIRoundToScreenScale();
  double v14 = v13;

  return v14;
}

- (double)baselineOffsetFromOrigin
{
  [(SBUILegibilityLabel *)self->_label frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(SBFLockScreenDateSubtitleView *)self superview];
  -[SBFLockScreenDateSubtitleView convertRect:toView:](self, "convertRect:toView:", v11, v4, v6, v8, v10);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;

  v23.origin.x = v13;
  v23.origin.y = v15;
  v23.size.double width = v17;
  v23.size.double height = v19;
  double MaxY = CGRectGetMaxY(v23);
  [(SBUILegibilityLabel *)self->_label firstBaselineOffsetFromBottom];
  return MaxY - v21;
}

- (double)baselineOffsetFromBottom
{
  [(SBUILegibilityLabel *)self->_label firstBaselineOffsetFromBottom];
  return result;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (double)strength
{
  return self->_strength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end