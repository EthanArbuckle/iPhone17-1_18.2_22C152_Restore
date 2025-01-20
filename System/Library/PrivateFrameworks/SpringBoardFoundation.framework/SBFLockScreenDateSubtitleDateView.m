@interface SBFLockScreenDateSubtitleDateView
+ ($01BB1521EC52D44A8E7628F5261DCEC8)dateTimeLunarDateFontMetrics;
+ (double)scaledFontSize:(double)a3 withMaximumFontSizeCategory:(id)a4;
+ (double)subtitleLabelToLunarDateLabelBaselineDifferenceY;
+ (id)dateTimeLunarDateFont;
- (BOOL)useCompactDateFormat;
- (CGRect)alternateDateLabelFrame;
- (CGRect)subtitleLabelFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSDate)date;
- (SBFLockScreenAlternateDateLabel)alternateDateLabel;
- (SBFLockScreenDateSubtitleDateView)initWithDate:(id)a3;
- (double)_lunarDateLabelYOffsetFromDateLabel;
- (double)alignmentPercent;
- (void)_overlayCalendarDidChange;
- (void)_setDate:(id)a3 inTimeZone:(id)a4;
- (void)_setupAlternateDateLabel;
- (void)_updateDateLabelForCompact;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setAlignmentPercent:(double)a3;
- (void)setAlternateDateLabel:(id)a3;
- (void)setDate:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setStrength:(double)a3;
- (void)setUseCompactDateFormat:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SBFLockScreenDateSubtitleDateView

- (void)setUseCompactDateFormat:(BOOL)a3
{
  if (self->_useCompactDateFormat != a3)
  {
    self->_useCompactDateFormat = a3;
    [(SBFLockScreenDateSubtitleDateView *)self _updateDateLabelForCompact];
  }
}

- (void)_updateDateLabelForCompact
{
  if (!self->_date)
  {
    v26 = &stru_1ED879EF8;
    [(SBFLockScreenDateSubtitleView *)self setString:&stru_1ED879EF8];
    goto LABEL_38;
  }
  v3 = (void *)0x1E4F42000;
  v4 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  unint64_t v6 = v5 & 0xFFFFFFFFFFFFFFFBLL;
  v7 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
  int v8 = __sb__runningInSpringBoard();
  char v9 = v8;
  if (v8)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v7, (UIContentSizeCategory)*MEMORY[0x1E4F43790]);

      if (v10 == NSOrderedAscending) {
        goto LABEL_32;
      }
LABEL_10:
      BOOL v12 = 0;
      goto LABEL_33;
    }
LABEL_11:
    int v13 = __sb__runningInSpringBoard();
    char v14 = v13;
    if (v13)
    {
      if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
      {
        BOOL v15 = UIContentSizeCategoryCompareToCategory(v7, (UIContentSizeCategory)*MEMORY[0x1E4F43798]) == NSOrderedAscending;
        if ((v9 & 1) == 0)
        {
LABEL_31:

          if (!v15) {
            goto LABEL_10;
          }
          goto LABEL_32;
        }
LABEL_27:

        if (v15) {
          goto LABEL_32;
        }
        goto LABEL_10;
      }
    }
    else
    {
      v3 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v3 userInterfaceIdiom])
      {
        BOOL v15 = UIContentSizeCategoryCompareToCategory(v7, (UIContentSizeCategory)*MEMORY[0x1E4F43798]) == NSOrderedAscending;
        goto LABEL_30;
      }
    }
    int v16 = __sb__runningInSpringBoard();
    char v17 = v16;
    if (v16)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      id v25 = [MEMORY[0x1E4F42D90] mainScreen];
      [v25 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v18 >= *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
      v19 = (UIContentSizeCategory *)MEMORY[0x1E4F43790];
    }
    else {
      v19 = (UIContentSizeCategory *)MEMORY[0x1E4F43798];
    }
    BOOL v15 = UIContentSizeCategoryCompareToCategory(v7, *v19) == NSOrderedAscending;
    if (v17)
    {
      if (v14) {
        goto LABEL_26;
      }
    }
    else
    {

      if (v14)
      {
LABEL_26:
        if ((v9 & 1) == 0) {
          goto LABEL_31;
        }
        goto LABEL_27;
      }
    }
LABEL_30:

    if ((v9 & 1) == 0) {
      goto LABEL_31;
    }
    goto LABEL_27;
  }
  uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
  if (![(id)v5 userInterfaceIdiom]) {
    goto LABEL_11;
  }
  NSComparisonResult v11 = UIContentSizeCategoryCompareToCategory(v7, (UIContentSizeCategory)*MEMORY[0x1E4F43790]);

  if (v11 != NSOrderedAscending) {
    goto LABEL_10;
  }
LABEL_32:
  BOOL v12 = !self->_useCompactDateFormat;
LABEL_33:
  id v20 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v20 setTimeZone:self->_timeZone];
  if (v6 == 1 || v12)
  {
    [v20 setFormattingContext:2];
    v21 = (void *)MEMORY[0x1E4F28C10];
    v22 = [MEMORY[0x1E4F1CA20] currentLocale];
    v23 = @"EEEEMMMMd";
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4F28C10];
    v22 = [MEMORY[0x1E4F1CA20] currentLocale];
    v23 = @"EEEMMMd";
  }
  v24 = [v21 dateFormatFromTemplate:v23 options:0 locale:v22];
  [v20 setDateFormat:v24];

  v26 = [v20 stringFromDate:self->_date];

  [(SBFLockScreenDateSubtitleView *)self setString:v26];
LABEL_38:
  [(SBFLockScreenAlternateDateLabel *)self->_alternateDateLabel setDate:self->_date];
}

- (void)_setDate:(id)a3 inTimeZone:(id)a4
{
  unint64_t v6 = (NSDate *)a3;
  objc_storeStrong((id *)&self->_timeZone, a4);
  id v7 = a4;
  date = self->_date;
  self->_date = v6;

  [(SBFLockScreenDateSubtitleDateView *)self _updateDateLabelForCompact];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v17.receiver = self;
  v17.super_class = (Class)SBFLockScreenDateSubtitleDateView;
  -[SBFLockScreenDateSubtitleView sizeThatFits:](&v17, sel_sizeThatFits_);
  double v7 = v6;
  double v9 = v8;
  alternateDateLabel = self->_alternateDateLabel;
  if (alternateDateLabel)
  {
    -[SBFLockScreenAlternateDateLabel sizeThatFits:](alternateDateLabel, "sizeThatFits:", width, height);
    double v12 = v11;
    double v7 = fmax(v7, v13);
    [(SBFLockScreenDateSubtitleDateView *)self _lunarDateLabelYOffsetFromDateLabel];
    double v9 = v9 + v12 + v14 - v9;
  }
  double v15 = v7;
  double v16 = v9;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (SBFLockScreenDateSubtitleDateView)initWithDate:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBFLockScreenDateSubtitleDateView;
  double v6 = [(SBFLockScreenDateSubtitleView *)&v12 initWithString:0 accessoryView:0];
  double v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_date, a3);
    timeZone = v7->_timeZone;
    v7->_timeZone = 0;

    [(SBFLockScreenDateSubtitleDateView *)v7 _setupAlternateDateLabel];
    double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v7 selector:sel__overlayCalendarDidChange name:*MEMORY[0x1E4F256A8] object:0];

    NSComparisonResult v10 = [MEMORY[0x1E4F4F708] sharedInstance];
    [v10 resetFormattersIfNecessary];
  }
  return v7;
}

- (void)_overlayCalendarDidChange
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__SBFLockScreenDateSubtitleDateView__overlayCalendarDidChange__block_invoke;
  block[3] = &unk_1E548CA88;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __62__SBFLockScreenDateSubtitleDateView__overlayCalendarDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupAlternateDateLabel];
}

- (void)_setupAlternateDateLabel
{
  alternateDateLabel = self->_alternateDateLabel;
  if (alternateDateLabel)
  {
    [(SBFLockScreenAlternateDateLabel *)alternateDateLabel removeFromSuperview];
    v4 = self->_alternateDateLabel;
    self->_alternateDateLabel = 0;
  }
  if (+[SBFLockScreenAlternateDateLabel showAlternateDate])
  {
    id v5 = [SBFLockScreenAlternateDateLabel alloc];
    double v6 = [(SBFLockScreenDateSubtitleView *)self legibilitySettings];
    double v7 = *MEMORY[0x1E4F440E0];
    double v8 = +[SBFLockScreenDateSubtitleDateView dateTimeLunarDateFont];
    double v9 = [(SBFLockScreenAlternateDateLabel *)v5 initWithSettings:v6 strength:v8 font:v7];
    NSComparisonResult v10 = self->_alternateDateLabel;
    self->_alternateDateLabel = v9;

    [(SBFLockScreenAlternateDateLabel *)self->_alternateDateLabel setDate:self->_date];
    double v11 = self->_alternateDateLabel;
    objc_super v12 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBFLockScreenAlternateDateLabel *)v11 setBackgroundColor:v12];

    double v13 = self->_alternateDateLabel;
    [(SBFLockScreenDateSubtitleDateView *)self addSubview:v13];
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenDateSubtitleDateView;
  [(SBFLockScreenDateSubtitleView *)&v4 dealloc];
}

- (void)setDate:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F1CAF0];
  id v5 = a3;
  id v6 = [v4 systemTimeZone];
  [(SBFLockScreenDateSubtitleDateView *)self _setDate:v5 inTimeZone:v6];
}

- (void)setAlignmentPercent:(double)a3
{
  if (self->_alignmentPercent != a3)
  {
    self->_alignmentPercent = a3;
    [(SBFLockScreenDateSubtitleDateView *)self setNeedsLayout];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  id v4 = a3;
  id v5 = [(SBFLockScreenDateSubtitleView *)self legibilitySettings];
  char v6 = objc_msgSend(v5, "sb_isEqualToLegibilitySettings:", v4);

  if ((v6 & 1) == 0)
  {
    [(SBFLockScreenAlternateDateLabel *)self->_alternateDateLabel setLegibilitySettings:v4];
    v7.receiver = self;
    v7.super_class = (Class)SBFLockScreenDateSubtitleDateView;
    [(SBFLockScreenDateSubtitleView *)&v7 setLegibilitySettings:v4];
  }
}

- (void)setStrength:(double)a3
{
  -[SBFLockScreenAlternateDateLabel setStrength:](self->_alternateDateLabel, "setStrength:");
  v5.receiver = self;
  v5.super_class = (Class)SBFLockScreenDateSubtitleDateView;
  [(SBFLockScreenDateSubtitleView *)&v5 setStrength:a3];
}

+ (id)dateTimeLunarDateFont
{
  if (dateTimeLunarDateFont_onceToken != -1) {
    dispatch_once(&dateTimeLunarDateFont_onceToken, &__block_literal_global_4);
  }
  if (dateTimeLunarDateFont_dateTimeLunarDateFont) {
    goto LABEL_29;
  }
  id v4 = (void *)MEMORY[0x1E4F42A30];
  objc_super v5 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v7 = 16.0;
  }
  else {
    double v7 = 15.0;
  }
  uint64_t v8 = __sb__runningInSpringBoard();
  if (v8)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
LABEL_24:
      objc_super v12 = (void *)MEMORY[0x1E4F43778];
      goto LABEL_25;
    }
  }
  else
  {
    objc_super v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v5 userInterfaceIdiom])
    {
      int v9 = 0;
      int v10 = 0;
      int v11 = 1;
      goto LABEL_24;
    }
  }
  int v11 = v8 ^ 1;
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v9 = 0;
      int v10 = 0;
      objc_super v12 = (void *)MEMORY[0x1E4F43780];
      goto LABEL_25;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v8 userInterfaceIdiom])
    {
      int v10 = 0;
      objc_super v12 = (void *)MEMORY[0x1E4F43780];
      int v9 = 1;
      goto LABEL_25;
    }
  }
  int v9 = v2 ^ 1;
  int v13 = __sb__runningInSpringBoard();
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v2 _referenceBounds];
  }
  int v10 = v13 ^ 1;
  BSSizeRoundForScale();
  if (v14 >= *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_24;
  }
  objc_super v12 = (void *)MEMORY[0x1E4F43780];
LABEL_25:
  [a1 scaledFontSize:*v12 withMaximumFontSizeCategory:v7];
  uint64_t v15 = objc_msgSend(v4, "systemFontOfSize:");
  double v16 = (void *)dateTimeLunarDateFont_dateTimeLunarDateFont;
  dateTimeLunarDateFont_dateTimeLunarDateFont = v15;

  if (v10)
  {

    if (!v9) {
      goto LABEL_27;
    }
  }
  else if (!v9)
  {
LABEL_27:
    if (!v11) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }

  if (v11) {
LABEL_28:
  }

LABEL_29:
  objc_super v17 = (void *)dateTimeLunarDateFont_dateTimeLunarDateFont;
  return v17;
}

void __58__SBFLockScreenDateSubtitleDateView_dateTimeLunarDateFont__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F43788];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_17];
}

void __58__SBFLockScreenDateSubtitleDateView_dateTimeLunarDateFont__block_invoke_2()
{
  uint64_t v0 = (void *)dateTimeLunarDateFont_dateTimeLunarDateFont;
  dateTimeLunarDateFont_dateTimeLunarDateFont = 0;
}

+ ($01BB1521EC52D44A8E7628F5261DCEC8)dateTimeLunarDateFontMetrics
{
  if (dateTimeLunarDateFontMetrics_onceToken != -1) {
    dispatch_once(&dateTimeLunarDateFontMetrics_onceToken, &__block_literal_global_22);
  }
  double v3 = *(double *)&dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics;
  if (*(double *)&dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics == 0.0)
  {
    id v4 = objc_msgSend(a1, "dateTimeLunarDateFont", *(double *)&dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics);
    [v4 ascender];
    uint64_t v6 = v5;
    [v4 descender];
    uint64_t v8 = v7;
    [v4 _bodyLeading];
    uint64_t v10 = v9;
    [v4 capHeight];
    *(void *)&dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics = v6;
    *((void *)&dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics + 1) = v8;
    qword_1E9136750 = v10;
    qword_1E9136758 = v11;

    double v3 = *(double *)&dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics;
  }
  double v12 = *((double *)&dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics + 1);
  double v13 = *(double *)&qword_1E9136750;
  double v14 = *(double *)&qword_1E9136758;
  result.var3 = v14;
  result.var2 = v13;
  result.var1 = v12;
  result.var0 = v3;
  return result;
}

void __65__SBFLockScreenDateSubtitleDateView_dateTimeLunarDateFontMetrics__block_invoke()
{
  dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics = SBFFontMetricsZero;
  *(_OWORD *)&qword_1E9136750 = unk_18B5E6018;
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F43788];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_24];
}

double __65__SBFLockScreenDateSubtitleDateView_dateTimeLunarDateFontMetrics__block_invoke_2()
{
  double result = *(double *)&SBFFontMetricsZero;
  dateTimeLunarDateFontMetrics_dateTimeLunarDateFontMetrics = SBFFontMetricsZero;
  *(_OWORD *)&qword_1E9136750 = unk_18B5E6018;
  return result;
}

+ (double)subtitleLabelToLunarDateLabelBaselineDifferenceY
{
  if (subtitleLabelToLunarDateLabelBaselineDifferenceY_onceToken != -1) {
    dispatch_once(&subtitleLabelToLunarDateLabelBaselineDifferenceY_onceToken, &__block_literal_global_26);
  }
  double result = *(double *)&subtitleLabelToLunarDateLabelBaselineDifferenceY_subtitleLabelToLunarDateLabelBaselineDifferenceY;
  if (*(double *)&subtitleLabelToLunarDateLabelBaselineDifferenceY_subtitleLabelToLunarDateLabelBaselineDifferenceY == 0.0)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F42948], "currentDevice", *(double *)&subtitleLabelToLunarDateLabelBaselineDifferenceY_subtitleLabelToLunarDateLabelBaselineDifferenceY);
    uint64_t v5 = [v4 userInterfaceIdiom];

    double v6 = 6.0;
    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
LABEL_19:
      +[SBFLockScreenDateSubtitleDateView dateTimeLunarDateFontMetrics];
      double result = v6 + v12;
      *(double *)&subtitleLabelToLunarDateLabelBaselineDifferenceY_subtitleLabelToLunarDateLabelBaselineDifferenceY = v6 + v12;
      return result;
    }
    int v7 = __sb__runningInSpringBoard();
    char v8 = v7;
    if (v7)
    {
      double v6 = 7.0;
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_19;
      }
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
      double v6 = 7.0;
      if ([(id)v5 userInterfaceIdiom] != 1)
      {
LABEL_18:

        goto LABEL_19;
      }
    }
    int v9 = __sb__runningInSpringBoard();
    char v10 = v9;
    if (v9)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      id v2 = [MEMORY[0x1E4F42D90] mainScreen];
      [v2 _referenceBounds];
    }
    BSSizeRoundForScale();
    if (v11 < *(double *)(MEMORY[0x1E4FA6E50] + 264)) {
      double v6 = 7.0;
    }
    else {
      double v6 = 11.0;
    }
    if ((v10 & 1) == 0) {

    }
    if (v8) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  return result;
}

void __85__SBFLockScreenDateSubtitleDateView_subtitleLabelToLunarDateLabelBaselineDifferenceY__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F43788];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_28];
}

void __85__SBFLockScreenDateSubtitleDateView_subtitleLabelToLunarDateLabelBaselineDifferenceY__block_invoke_2()
{
  subtitleLabelToLunarDateLabelBaselineDifferenceY_subtitleLabelToLunarDateLabelBaselineDifferenceY = 0;
}

+ (double)scaledFontSize:(double)a3 withMaximumFontSizeCategory:(id)a4
{
  uint64_t v5 = (NSString *)a4;
  double v6 = [(id)*MEMORY[0x1E4F43630] preferredContentSizeCategory];
  NSComparisonResult v7 = UIContentSizeCategoryCompareToCategory(v6, v5);

  char v8 = (void *)MEMORY[0x1E4F42A30];
  uint64_t v9 = *MEMORY[0x1E4F43870];
  if (v7 == NSOrderedAscending)
  {
    double v11 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  }
  else
  {
    char v10 = [MEMORY[0x1E4F42F80] traitCollectionWithPreferredContentSizeCategory:v5];
    double v11 = [v8 preferredFontForTextStyle:v9 compatibleWithTraitCollection:v10];
  }
  [v11 _scaledValueForValue:a3];
  double v12 = [MEMORY[0x1E4F42D90] mainScreen];
  UIRoundToScreenScale();
  double v14 = v13;

  return v14;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBFLockScreenDateSubtitleDateView;
  [(SBFLockScreenDateSubtitleView *)&v4 layoutSubviews];
  alternateDateLabel = self->_alternateDateLabel;
  if (alternateDateLabel)
  {
    [(SBFLockScreenDateSubtitleDateView *)self alternateDateLabelFrame];
    -[SBFLockScreenAlternateDateLabel setFrame:](alternateDateLabel, "setFrame:");
  }
}

- (CGRect)subtitleLabelFrame
{
  v18.receiver = self;
  v18.super_class = (Class)SBFLockScreenDateSubtitleDateView;
  [(SBFLockScreenDateSubtitleView *)&v18 subtitleLabelFrame];
  double v6 = v5;
  double v8 = v7;
  if (self->_alternateDateLabel)
  {
    [(SBFLockScreenDateSubtitleDateView *)self bounds];
    double v10 = (self->_alignmentPercent + 1.0) * (v9 - v6) * 0.5;
    int ShouldRoundFramesForAlignmentPercent = _SBFLockScreenDateViewShouldRoundFramesForAlignmentPercent();
    double v4 = 0.0;
    if (ShouldRoundFramesForAlignmentPercent)
    {
      SBFMainScreenScale();
      BSRectRoundForScale();
      double v10 = v12;
      double v6 = v13;
      double v8 = v14;
    }
  }
  else
  {
    double v10 = v3;
  }
  double v15 = v10;
  double v16 = v6;
  double v17 = v8;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.y = v4;
  result.origin.x = v15;
  return result;
}

- (CGRect)alternateDateLabelFrame
{
  [(SBFLockScreenAlternateDateLabel *)self->_alternateDateLabel sizeToFit];
  [(SBFLockScreenDateSubtitleDateView *)self bounds];
  double v4 = v3;
  [(SBFLockScreenAlternateDateLabel *)self->_alternateDateLabel frame];
  double v6 = v5;
  double v8 = v7;
  double v9 = (self->_alignmentPercent + 1.0) * (v4 - v5) * 0.5;
  [(SBFLockScreenDateSubtitleDateView *)self subtitleLabelFrame];
  double v11 = v10;
  [(SBFLockScreenDateSubtitleDateView *)self _lunarDateLabelYOffsetFromDateLabel];
  double v13 = v12 + v11;
  if (_SBFLockScreenDateViewShouldRoundFramesForAlignmentPercent())
  {
    SBFMainScreenScale();
    BSRectRoundForScale();
    double v9 = v14;
    double v13 = v15;
    double v6 = v16;
    double v8 = v17;
  }
  double v18 = v9;
  double v19 = v13;
  double v20 = v6;
  double v21 = v8;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (double)_lunarDateLabelYOffsetFromDateLabel
{
  +[SBFLockScreenDateSubtitleDateView subtitleLabelToLunarDateLabelBaselineDifferenceY];
  double v4 = v3;
  +[SBFLockScreenDateSubtitleDateView dateTimeLunarDateFontMetrics];
  double v6 = v4 - v5;
  +[SBFLockScreenDateSubtitleView labelFontMetrics];
  double v8 = v6 + v7;
  [(SBFLockScreenDateSubtitleView *)self subtitleLabelCharacterOverflowInsets];
  double v10 = v8 - v9;
  [(SBFLockScreenAlternateDateLabel *)self->_alternateDateLabel characterOverflowInsets];
  return v10 - v11;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBFLockScreenDateSubtitleDateView;
  [(SBFLockScreenDateSubtitleDateView *)&v10 traitCollectionDidChange:v4];
  if (v4)
  {
    double v5 = [(SBFLockScreenDateSubtitleDateView *)self traitCollection];
    double v6 = [v5 preferredContentSizeCategory];
    double v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __62__SBFLockScreenDateSubtitleDateView_traitCollectionDidChange___block_invoke;
      block[3] = &unk_1E548CA88;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __62__SBFLockScreenDateSubtitleDateView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 464);
  id v2 = +[SBFLockScreenDateSubtitleDateView dateTimeLunarDateFont];
  [v1 setFont:v2];
}

- (NSDate)date
{
  return self->_date;
}

- (SBFLockScreenAlternateDateLabel)alternateDateLabel
{
  return self->_alternateDateLabel;
}

- (void)setAlternateDateLabel:(id)a3
{
}

- (double)alignmentPercent
{
  return self->_alignmentPercent;
}

- (BOOL)useCompactDateFormat
{
  return self->_useCompactDateFormat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDateLabel, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
}

@end