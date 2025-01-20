@interface SBFLockScreenDateView
+ ($01BB1521EC52D44A8E7628F5261DCEC8)metricsForFont:(id)a3;
+ ($01BB1521EC52D44A8E7628F5261DCEC8)timeFontMetrics;
+ (double)defaultHeight;
+ (id)timeFont;
- ($01BB1521EC52D44A8E7628F5261DCEC8)customTimeMetrics;
- (BOOL)isSubtitleHidden;
- (BOOL)restrictsVibrancy;
- (BOOL)subtitleOnTop;
- (BOOL)useCompactDateFormat;
- (BOOL)useLandscapeTimeFontSize;
- (BSUIVibrancyConfiguration)vibrancyConfiguration;
- (CGRect)_subtitleViewFrameForView:(id)a3 alignmentPercent:(double)a4;
- (CGRect)_timeLabelFrameForAlignmentPercent:(double)a3;
- (CGRect)chargingVisualInformationTimeFrame;
- (CGRect)chargingVisualInformationTimeSubtitleFrame;
- (CGRect)presentationExtentForAlignmentPercent:(double)a3;
- (CGRect)restingFrame;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CSProminentDisplayViewController)prominentDisplayViewController;
- (NSDate)date;
- (NSString)customTimeNumberingSystem;
- (PRPosterContentStyle)contentStyle;
- (SBFLockScreenDateSubtitleView)customSubtitleView;
- (SBFLockScreenDateView)initWithFrame:(CGRect)a3;
- (UIColor)textColor;
- (UIEdgeInsets)_cachedGlyphInsetsTimeFontForString:(id)a3;
- (UIEdgeInsets)_timeLabelInsetsForTimeString:(id)a3;
- (UIFont)customTimeFont;
- (UIView)inlineComplicationView;
- (_UILegibilitySettings)legibilitySettings;
- (double)alignmentPercent;
- (double)dateToTimeStretch;
- (double)maximumSubtitleWidth;
- (double)subtitleAlpha;
- (double)subtitleBaselineOffsetFromOrigin;
- (double)subtitleLegibilityStrength;
- (double)timeAlpha;
- (double)timeBaselineOffsetFromOrigin;
- (double)timeLegibilityStrength;
- (id)_effectiveTextColor;
- (id)_timeLabel;
- (void)_cacheCustomTimeMetrics;
- (void)_layoutSubtitle;
- (void)_setDate:(id)a3 inTimeZone:(id)a4;
- (void)_setSubtitleAlpha:(double)a3;
- (void)_updateActiveSubtitleView;
- (void)_updateForNewFont;
- (void)_updateLabelAlpha;
- (void)_updateLabels;
- (void)_updateUsesCompactDateFormat;
- (void)layoutSubviews;
- (void)setAlignmentPercent:(double)a3;
- (void)setContentStyle:(id)a3;
- (void)setCustomSubtitleView:(id)a3;
- (void)setCustomTimeFont:(id)a3;
- (void)setCustomTimeNumberingSystem:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateToTimeStretch:(double)a3;
- (void)setInlineComplicationView:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setMaximumSubtitleWidth:(double)a3;
- (void)setProminentDisplayViewController:(id)a3;
- (void)setRestingFrame:(CGRect)a3;
- (void)setRestrictsVibrancy:(BOOL)a3;
- (void)setSubtitleHidden:(BOOL)a3;
- (void)setSubtitleLegibilityStrength:(double)a3;
- (void)setSubtitleOnTop:(BOOL)a3;
- (void)setTextColor:(id)a3;
- (void)setTimeAlpha:(double)a3 subtitleAlpha:(double)a4;
- (void)setTimeLegibilityStrength:(double)a3;
- (void)setUseCompactDateFormat:(BOOL)a3;
- (void)setUseLandscapeTimeFontSize:(BOOL)a3;
- (void)setVibrancyConfiguration:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFormat;
@end

@implementation SBFLockScreenDateView

- (void)_updateLabels
{
  v3 = (void *)MEMORY[0x1E4F4F708];
  v4 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
  id v7 = [v3 formatterForDateAsTimeNoAMPMWithLocale:v4];

  [v7 setTimeZone:self->_timeZone];
  v5 = [v7 stringFromDate:self->_date];
  if (self->_date) {
    v6 = v5;
  }
  else {
    v6 = &stru_1ED879EF8;
  }
  [(SBUILegibilityLabel *)self->_timeLabel setString:v6];
  [(SBFLockScreenDateView *)self _updateUsesCompactDateFormat];
  [(SBFLockScreenDateSubtitleDateView *)self->_dateSubtitleView _setDate:self->_date inTimeZone:self->_timeZone];
  [(SBUILegibilityLabel *)self->_timeLabel sizeToFit];
  [(SBFLockScreenDateSubtitleDateView *)self->_dateSubtitleView sizeToFit];
  [(CSProminentDisplayViewController *)self->_prominentDisplayViewController setDisplayDate:self->_date];
  [(SBFLockScreenDateView *)self setNeedsLayout];
}

- (void)_updateUsesCompactDateFormat
{
}

- (id)_timeLabel
{
  return self->_timeLabel;
}

- (void)setDate:(id)a3
{
}

- (void)_setDate:(id)a3 inTimeZone:(id)a4
{
  v6 = (NSDate *)a3;
  objc_storeStrong((id *)&self->_timeZone, a4);
  id v7 = a4;
  date = self->_date;
  self->_date = v6;

  [(SBFLockScreenDateView *)self _updateLabels];
}

+ (double)defaultHeight
{
  int v4 = __sb__runningInSpringBoard();
  char v5 = v4;
  if (v4)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      return 115.0;
    }
  }
  else
  {
    v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] != 1)
    {
      double v6 = 115.0;
LABEL_12:

      return v6;
    }
  }
  int v7 = __sb__runningInSpringBoard();
  char v8 = v7;
  if (v7)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  double v6 = dbl_18B5E40A0[v9 >= *(double *)(MEMORY[0x1E4FA6E50] + 264)];
  if ((v8 & 1) == 0) {

  }
  if ((v5 & 1) == 0) {
    goto LABEL_12;
  }
  return v6;
}

- (SBFLockScreenDateView)initWithFrame:(CGRect)a3
{
  v26.receiver = self;
  v26.super_class = (Class)SBFLockScreenDateView;
  v3 = -[SBFLockScreenDateView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  int v4 = v3;
  if (v3)
  {
    v3->_timeAlpha = 1.0;
    v3->_subtitleAlpha = 1.0;
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F43228]) initWithStyle:1];
    legibilitySettings = v4->_legibilitySettings;
    v4->_legibilitySettings = (_UILegibilitySettings *)v5;

    v4->_alignmentPercent = 0.0;
    v4->_maximumSubtitleWidth = INFINITY;
    timeZone = v4->_timeZone;
    v4->_timeZone = 0;

    char v8 = [(id)objc_opt_class() timeFont];
    [(SBFLockScreenDateView *)v4 setCustomTimeFont:v8];

    objc_initWeak(&location, v4);
    double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v10 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v11 = *MEMORY[0x1E4F43410];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __39__SBFLockScreenDateView_initWithFrame___block_invoke;
    v23[3] = &unk_1E548CE50;
    objc_copyWeak(&v24, &location);
    id v12 = (id)[v9 addObserverForName:v11 object:0 queue:v10 usingBlock:v23];

    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2050000000;
    v13 = (void *)getSBUILegibilityLabelClass_softClass;
    uint64_t v31 = getSBUILegibilityLabelClass_softClass;
    if (!getSBUILegibilityLabelClass_softClass)
    {
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __getSBUILegibilityLabelClass_block_invoke;
      v27[3] = &unk_1E548C938;
      v27[4] = &v28;
      __getSBUILegibilityLabelClass_block_invoke((uint64_t)v27);
      v13 = (void *)v29[3];
    }
    v14 = v13;
    _Block_object_dispose(&v28, 8);
    id v15 = [v14 alloc];
    uint64_t v16 = [v15 initWithSettings:v4->_legibilitySettings strength:&stru_1ED879EF8 string:v4->_customTimeFont font:*MEMORY[0x1E4F440E0]];
    timeLabel = v4->_timeLabel;
    v4->_timeLabel = (SBUILegibilityLabel *)v16;

    v18 = v4->_timeLabel;
    v19 = [MEMORY[0x1E4F428B8] clearColor];
    [(SBUILegibilityLabel *)v18 setBackgroundColor:v19];

    v20 = [[SBFLockScreenDateSubtitleDateView alloc] initWithDate:0];
    dateSubtitleView = v4->_dateSubtitleView;
    v4->_dateSubtitleView = v20;

    [(SBFLockScreenDateView *)v4 setAccessibilityIdentifier:@"lockscreen-date-view"];
    objc_storeStrong((id *)&v4->_activeSubtitleView, v4->_dateSubtitleView);
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      [(SBFLockScreenDateView *)v4 addSubview:v4->_timeLabel];
      [(SBFLockScreenDateView *)v4 addSubview:v4->_dateSubtitleView];
    }
    [(SBFLockScreenDateView *)v4 updateFormat];
    objc_destroyWeak(&v24);

    objc_destroyWeak(&location);
  }
  return v4;
}

void __39__SBFLockScreenDateView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cacheCustomTimeMetrics];
}

- (BOOL)isSubtitleHidden
{
  [(SBFLockScreenDateSubtitleDateView *)self->_dateSubtitleView alpha];
  return fabs(v2) < 2.22044605e-16;
}

- (void)setSubtitleHidden:(BOOL)a3
{
  double v3 = 1.0;
  if (a3) {
    double v3 = 0.0;
  }
  [(SBFLockScreenDateView *)self _setSubtitleAlpha:v3];
}

- (void)setUseLandscapeTimeFontSize:(BOOL)a3
{
  if (self->_useLandscapeTimeFontSize != a3)
  {
    self->_useLandscapeTimeFontSize = a3;
    -[CSProminentDisplayViewController setUsesLandscapeTimeFontVariant:](self->_prominentDisplayViewController, "setUsesLandscapeTimeFontVariant:");
  }
}

- (void)setUseCompactDateFormat:(BOOL)a3
{
  if (self->_useCompactDateFormat != a3)
  {
    self->_useCompactDateFormat = a3;
    [(SBFLockScreenDateView *)self _updateUsesCompactDateFormat];
    [(SBFLockScreenDateSubtitleDateView *)self->_dateSubtitleView sizeToFit];
    [(SBFLockScreenDateView *)self setNeedsLayout];
  }
}

- (void)setTextColor:(id)a3
{
  uint64_t v5 = (UIColor *)a3;
  p_overrideTextColor = &self->_overrideTextColor;
  if (self->_overrideTextColor != v5)
  {
    int v7 = v5;
    objc_storeStrong((id *)&self->_overrideTextColor, a3);
    [(SBUILegibilityLabel *)self->_timeLabel setTextColor:*p_overrideTextColor];
    [(CSProminentDisplayViewController *)self->_prominentDisplayViewController setTextColor:*p_overrideTextColor];
    [(SBFLockScreenDateView *)self _updateLabelAlpha];
    uint64_t v5 = v7;
  }
}

- (void)setContentStyle:(id)a3
{
}

- (void)setRestrictsVibrancy:(BOOL)a3
{
  if (self->_restrictsVibrancy != a3)
  {
    self->_restrictsVibrancy = a3;
    if (a3) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = [(BSUIVibrancyConfiguration *)self->_vibrancyConfiguration effectType];
    }
    prominentDisplayViewController = self->_prominentDisplayViewController;
    [(CSProminentDisplayViewController *)prominentDisplayViewController setEffectType:v4];
  }
}

- (void)setVibrancyConfiguration:(id)a3
{
  uint64_t v5 = (BSUIVibrancyConfiguration *)a3;
  if (self->_vibrancyConfiguration != v5)
  {
    uint64_t v16 = v5;
    objc_storeStrong((id *)&self->_vibrancyConfiguration, a3);
    double v6 = [(BSUIVibrancyConfiguration *)v16 color];
    overrideTextColor = self->_overrideTextColor;
    self->_overrideTextColor = v6;

    [(SBUILegibilityLabel *)self->_timeLabel setTextColor:self->_overrideTextColor];
    [(CSProminentDisplayViewController *)self->_prominentDisplayViewController setTextColor:self->_overrideTextColor];
    prominentDisplayViewController = self->_prominentDisplayViewController;
    if (self->_restrictsVibrancy) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = [(BSUIVibrancyConfiguration *)v16 effectType];
    }
    [(CSProminentDisplayViewController *)prominentDisplayViewController setEffectType:v9];
    [(CSProminentDisplayViewController *)self->_prominentDisplayViewController setBackgroundType:[(BSUIVibrancyConfiguration *)v16 backgroundType]];
    v10 = self->_prominentDisplayViewController;
    uint64_t v11 = [(BSUIVibrancyConfiguration *)v16 groupName];
    [(CSProminentDisplayViewController *)v10 setGroupName:v11];

    id v12 = [(BSUIVibrancyConfiguration *)v16 alternativeVibrancyEffectLUT];
    v13 = self->_prominentDisplayViewController;
    v14 = [v12 lutIdentifier];
    id v15 = [v12 bundleURL];
    [(CSProminentDisplayViewController *)v13 setAlternativeVibrancyEffectLUTIdentifier:v14 alternativeVibrancyEffectLUTBundleURL:v15];

    [(SBFLockScreenDateView *)self _updateLabelAlpha];
  }
  MEMORY[0x1F41817F8]();
}

- (void)setTimeLegibilityStrength:(double)a3
{
  if (self->_timeLegibilityStrength != a3)
  {
    self->_timeLegibilityStrength = a3;
    -[SBUILegibilityLabel setStrength:](self->_timeLabel, "setStrength:");
  }
}

- (void)setSubtitleLegibilityStrength:(double)a3
{
  if (self->_subtitleLegibilityStrength != a3)
  {
    self->_double subtitleLegibilityStrength = a3;
    -[SBFLockScreenDateSubtitleDateView setStrength:](self->_dateSubtitleView, "setStrength:");
    customSubtitleView = self->_customSubtitleView;
    double subtitleLegibilityStrength = self->_subtitleLegibilityStrength;
    [(SBFLockScreenDateSubtitleView *)customSubtitleView setStrength:subtitleLegibilityStrength];
  }
}

- (void)setLegibilitySettings:(id)a3
{
  p_legibilitySettings = &self->_legibilitySettings;
  id v8 = a3;
  if (!-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](*p_legibilitySettings, "sb_isEqualToLegibilitySettings:"))
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBUILegibilityLabel *)self->_timeLabel setLegibilitySettings:*p_legibilitySettings];
    [(SBFLockScreenDateSubtitleDateView *)self->_dateSubtitleView setLegibilitySettings:*p_legibilitySettings];
    [(SBFLockScreenDateSubtitleView *)self->_customSubtitleView setLegibilitySettings:*p_legibilitySettings];
    prominentDisplayViewController = self->_prominentDisplayViewController;
    int v7 = [(SBFLockScreenDateView *)self _effectiveTextColor];
    [(CSProminentDisplayViewController *)prominentDisplayViewController setTextColor:v7];

    [(SBFLockScreenDateView *)self _updateLabels];
  }
}

- (void)setAlignmentPercent:(double)a3
{
  if (self->_alignmentPercent != a3)
  {
    self->_alignmentPercent = a3;
    [(SBFLockScreenDateView *)self setNeedsLayout];
  }
}

- (void)setDateToTimeStretch:(double)a3
{
  if (self->_dateToTimeStretch != a3)
  {
    self->_dateToTimeStretch = a3;
    [(SBFLockScreenDateView *)self setNeedsLayout];
  }
}

- (void)setMaximumSubtitleWidth:(double)a3
{
  if (self->_maximumSubtitleWidth != a3)
  {
    [(SBFLockScreenDateView *)self bounds];
    CGFloat Width = CGRectGetWidth(v7);
    if (Width >= a3) {
      CGFloat Width = a3;
    }
    self->_maximumSubtitleCGFloat Width = Width;
    [(SBFLockScreenDateView *)self setNeedsLayout];
  }
}

- (void)updateFormat
{
  id v2 = [MEMORY[0x1E4F4F708] sharedInstance];
  [v2 resetFormattersIfNecessary];
}

- (double)timeAlpha
{
  return self->_timeAlpha;
}

- (double)subtitleAlpha
{
  return self->_subtitleAlpha;
}

- (void)setTimeAlpha:(double)a3 subtitleAlpha:(double)a4
{
  if (BSFloatEqualToFloat())
  {
    p_subtitleAlpha = &self->_subtitleAlpha;
    if (BSFloatEqualToFloat()) {
      return;
    }
    goto LABEL_5;
  }
  self->_timeAlpha = a3;
  p_subtitleAlpha = &self->_subtitleAlpha;
  if ((BSFloatEqualToFloat() & 1) == 0) {
LABEL_5:
  }
    double *p_subtitleAlpha = a4;
  [(SBFLockScreenDateView *)self _updateLabelAlpha];
}

- (void)setInlineComplicationView:(id)a3
{
  uint64_t v5 = (UIView *)a3;
  p_inlineComplicationView = &self->_inlineComplicationView;
  if (self->_inlineComplicationView != v5)
  {
    CGRect v7 = v5;
    objc_storeStrong((id *)p_inlineComplicationView, a3);
    p_inlineComplicationView = (UIView **)[(SBFLockScreenDateView *)self _updateActiveSubtitleView];
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](p_inlineComplicationView, v5);
}

- (void)setCustomSubtitleView:(id)a3
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v6 = v5;
  if (self->_customSubtitleView != (SBFLockScreenDateSubtitleView *)v5)
  {
    CGRect v7 = (void *)v5;
    uint64_t v5 = _os_feature_enabled_impl();
    uint64_t v6 = (uint64_t)v7;
    if ((v5 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_customSubtitleView, a3);
      [v7 setLegibilitySettings:self->_legibilitySettings];
      [v7 setStrength:self->_subtitleLegibilityStrength];
      uint64_t v5 = [(SBFLockScreenDateView *)self _updateActiveSubtitleView];
      uint64_t v6 = (uint64_t)v7;
    }
  }
  MEMORY[0x1F41817F8](v5, v6);
}

- (void)_updateActiveSubtitleView
{
  p_activeSubtitleView = &self->_activeSubtitleView;
  uint64_t v4 = self->_activeSubtitleView;
  customSubtitleView = (SBFLockScreenDateSubtitleDateView *)self->_customSubtitleView;
  if (!customSubtitleView)
  {
    customSubtitleView = (SBFLockScreenDateSubtitleDateView *)self->_inlineComplicationView;
    if (!customSubtitleView) {
      customSubtitleView = self->_dateSubtitleView;
    }
  }
  uint64_t v6 = customSubtitleView;
  objc_storeStrong((id *)p_activeSubtitleView, v6);
  [(SBFLockScreenDateSubtitleDateView *)v6 sizeToFit];
  if ([MEMORY[0x1E4F42FF0] _isInAnimationBlock])
  {
    [MEMORY[0x1E4F42FF0] _currentAnimationDuration];
    double v8 = v7;
    uint64_t v9 = (void *)MEMORY[0x1E4F4F898];
    v10 = (void *)MEMORY[0x1E4F4F680];
    uint64_t v11 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
    id v12 = [v10 settingsWithDuration:v11 timingFunction:v8 * 0.5];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __50__SBFLockScreenDateView__updateActiveSubtitleView__block_invoke;
    v18[3] = &unk_1E548CA88;
    v19 = v4;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__SBFLockScreenDateView__updateActiveSubtitleView__block_invoke_2;
    v13[3] = &unk_1E548CE98;
    v14 = v6;
    id v15 = self;
    uint64_t v16 = v19;
    double v17 = v8;
    [v9 animateWithSettings:v12 actions:v18 completion:v13];
  }
  else
  {
    if (v4 != self->_dateSubtitleView) {
      [(SBFLockScreenDateSubtitleDateView *)v4 removeFromSuperview];
    }
    [(SBFLockScreenDateView *)self addSubview:v6];
    [(SBFLockScreenDateView *)self _updateLabelAlpha];
    [(SBFLockScreenDateView *)self setNeedsLayout];
  }
}

uint64_t __50__SBFLockScreenDateView__updateActiveSubtitleView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __50__SBFLockScreenDateView__updateActiveSubtitleView__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  [*(id *)(a1 + 40) addSubview:*(void *)(a1 + 32)];
  id v2 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 48) != v2[54])
  {
    [*(id *)(a1 + 48) removeFromSuperview];
    id v2 = *(void **)(a1 + 40);
  }
  [v2 setNeedsLayout];
  double v3 = (void *)MEMORY[0x1E4F4F898];
  uint64_t v4 = (void *)MEMORY[0x1E4F4F680];
  double v5 = *(double *)(a1 + 56) * 0.5;
  uint64_t v6 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  double v7 = [v4 settingsWithDuration:v6 timingFunction:v5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__SBFLockScreenDateView__updateActiveSubtitleView__block_invoke_3;
  v8[3] = &unk_1E548CA88;
  v8[4] = *(void *)(a1 + 40);
  [v3 animateWithSettings:v7 actions:v8 completion:&__block_literal_global_8];
}

uint64_t __50__SBFLockScreenDateView__updateActiveSubtitleView__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLabelAlpha];
}

- (CGRect)presentationExtentForAlignmentPercent:(double)a3
{
  -[SBFLockScreenDateView _timeLabelFrameForAlignmentPercent:](self, "_timeLabelFrameForAlignmentPercent:");
  CGFloat x = v5;
  CGFloat y = v7;
  CGFloat width = v9;
  CGFloat height = v11;
  v13 = [(SBFLockScreenDateSubtitleView *)self->_customSubtitleView superview];
  if (v13)
  {
    double subtitleAlpha = self->_subtitleAlpha;

    if (subtitleAlpha > 0.0)
    {
      [(SBFLockScreenDateView *)self _subtitleViewFrameForView:self->_customSubtitleView alignmentPercent:a3];
      v34.origin.CGFloat x = v15;
      v34.origin.CGFloat y = v16;
      v34.size.CGFloat width = v17;
      v34.size.CGFloat height = v18;
      v30.origin.CGFloat x = x;
      v30.origin.CGFloat y = y;
      v30.size.CGFloat width = width;
      v30.size.CGFloat height = height;
      CGRect v31 = CGRectUnion(v30, v34);
      CGFloat x = v31.origin.x;
      CGFloat y = v31.origin.y;
      CGFloat width = v31.size.width;
      CGFloat height = v31.size.height;
    }
  }
  v19 = [(SBFLockScreenDateSubtitleDateView *)self->_dateSubtitleView superview];
  if (v19)
  {
    double v20 = self->_subtitleAlpha;

    if (v20 > 0.0)
    {
      [(SBFLockScreenDateView *)self _subtitleViewFrameForView:self->_dateSubtitleView alignmentPercent:a3];
      v35.origin.CGFloat x = v21;
      v35.origin.CGFloat y = v22;
      v35.size.CGFloat width = v23;
      v35.size.CGFloat height = v24;
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.size.CGFloat width = width;
      v32.size.CGFloat height = height;
      CGRectUnion(v32, v35);
    }
  }
  SBFMainScreenScale();
  BSRectRoundForScale();
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (void)setCustomTimeFont:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  double v5 = v4;
  if (!v4)
  {
    double v5 = +[SBFLockScreenDateView timeFont];
  }
  objc_storeStrong((id *)&self->_customTimeFont, v5);
  if (!v4) {

  }
  [(SBFLockScreenDateView *)self _cacheCustomTimeMetrics];
  [(SBFLockScreenDateView *)self _updateForNewFont];
}

- (void)setSubtitleOnTop:(BOOL)a3
{
  if (self->_subtitleOnTop != a3)
  {
    self->_subtitleOnTop = a3;
    [(SBFLockScreenDateView *)self setNeedsLayout];
  }
}

- (void)setCustomTimeNumberingSystem:(id)a3
{
  uint64_t v4 = (NSString *)[a3 copy];
  customTimeNumberingSystem = self->_customTimeNumberingSystem;
  self->_customTimeNumberingSystem = v4;

  prominentDisplayViewController = self->_prominentDisplayViewController;
  double v7 = self->_customTimeNumberingSystem;
  [(CSProminentDisplayViewController *)prominentDisplayViewController setNumberingSystem:v7];
}

- (void)_cacheCustomTimeMetrics
{
  int v3 = _os_feature_enabled_impl();
  p_customTimeMetrics = &self->_customTimeMetrics;
  double v5 = objc_opt_class();
  uint64_t v6 = v5;
  if (v3)
  {
    id v15 = +[SBFLockScreenDateView timeFont];
    [v6 metricsForFont:v15];
    p_customTimeMetrics->ascender = v7;
    self->_customTimeMetrics.descender = v8;
    self->_customTimeMetrics.bodyLeading = v9;
    self->_customTimeMetrics.capHeight = v10;
  }
  else
  {
    [v5 metricsForFont:self->_customTimeFont];
    p_customTimeMetrics->ascender = v11;
    self->_customTimeMetrics.descender = v12;
    self->_customTimeMetrics.bodyLeading = v13;
    self->_customTimeMetrics.capHeight = v14;
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[SBFLockScreenDateView _timeLabelFrameForAlignmentPercent:](self, "_timeLabelFrameForAlignmentPercent:", self->_alignmentPercent, a3.height);
  CGFloat v5 = v4;
  CGFloat rect = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(SBFLockScreenDateView *)self _subtitleViewFrameForView:self->_dateSubtitleView alignmentPercent:self->_alignmentPercent];
  CGFloat v16 = v12;
  CGFloat v17 = v13;
  CGFloat v18 = v14;
  CGFloat v19 = v15;
  if (self->_subtitleOnTop)
  {
    double v13 = v7;
    double v12 = v5;
    double v14 = v9;
    double v15 = v11;
  }
  CGFloat rect_16 = CGRectGetMaxY(*(CGRect *)&v12);
  v30.origin.CGFloat x = v5;
  v30.origin.CGFloat y = v7;
  v30.size.CGFloat width = v9;
  v30.size.CGFloat height = v11;
  double MinX = CGRectGetMinX(v30);
  v31.origin.CGFloat x = v16;
  v31.origin.CGFloat y = v17;
  v31.size.CGFloat width = v18;
  v31.size.CGFloat height = v19;
  double v21 = CGRectGetMinX(v31);
  if (MinX < v21) {
    double v21 = MinX;
  }
  double rect_8 = v21;
  v32.origin.CGFloat x = rect;
  v32.origin.CGFloat y = v7;
  v32.size.CGFloat width = v9;
  v32.size.CGFloat height = v11;
  double MaxX = CGRectGetMaxX(v32);
  v33.origin.CGFloat x = v16;
  v33.origin.CGFloat y = v17;
  v33.size.CGFloat width = v18;
  v33.size.CGFloat height = v19;
  double v23 = CGRectGetMaxX(v33);
  if (MaxX >= v23) {
    double v23 = MaxX;
  }
  double v24 = v23 - rect_8;
  if (v24 < 0.0) {
    double v24 = -v24;
  }
  double v25 = rect_16;
  result.CGFloat height = v25;
  result.CGFloat width = v24;
  return result;
}

- (CGRect)chargingVisualInformationTimeFrame
{
  [(SBFLockScreenDateView *)self _timeLabelFrameForAlignmentPercent:0.0];
  double v6 = self->_restingFrame.origin.x + v5;
  double v8 = v7 + self->_restingFrame.origin.y;
  result.size.CGFloat height = v4;
  result.size.CGFloat width = v3;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v6;
  return result;
}

- (CGRect)chargingVisualInformationTimeSubtitleFrame
{
  customSubtitleView = (SBFLockScreenDateSubtitleDateView *)self->_customSubtitleView;
  if (!customSubtitleView) {
    customSubtitleView = self->_dateSubtitleView;
  }
  [(SBFLockScreenDateView *)self _subtitleViewFrameForView:customSubtitleView alignmentPercent:0.0];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [(SBFLockScreenDateView *)self chargingVisualInformationTimeFrame];
  double v11 = v10;
  double v12 = v5 + self->_restingFrame.origin.x;
  +[SBFDashBoardViewMetrics timeLabelToSubtitleLabelDifferenceY];
  double v14 = v11 + v13;
  double v15 = v12;
  double v16 = v7;
  double v17 = v9;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)_setSubtitleAlpha:(double)a3
{
  if (self->_subtitleAlpha != a3)
  {
    self->_double subtitleAlpha = a3;
    [(SBFLockScreenDateView *)self _updateLabelAlpha];
  }
}

- (void)_updateLabelAlpha
{
  [(SBUILegibilityLabel *)self->_timeLabel setAlpha:self->_timeAlpha];
  [(SBFLockScreenDateSubtitleView *)self->_customSubtitleView setAlpha:self->_subtitleAlpha];
  [(UIView *)self->_inlineComplicationView setAlpha:self->_subtitleAlpha];
  [(CSProminentDisplayViewController *)self->_prominentDisplayViewController setContentAlpha:1 forElements:self->_timeAlpha];
  [(CSProminentDisplayViewController *)self->_prominentDisplayViewController setContentAlpha:14 forElements:self->_subtitleAlpha];
  if (self->_customSubtitleView || self->_inlineComplicationView)
  {
    dateSubtitleView = self->_dateSubtitleView;
    double subtitleAlpha = 0.0;
  }
  else
  {
    dateSubtitleView = self->_dateSubtitleView;
    double subtitleAlpha = self->_subtitleAlpha;
  }
  [(SBFLockScreenDateSubtitleDateView *)dateSubtitleView setAlpha:subtitleAlpha];
}

- (id)_effectiveTextColor
{
  overrideTextColor = self->_overrideTextColor;
  if (overrideTextColor)
  {
    double v3 = overrideTextColor;
  }
  else
  {
    double v3 = [(_UILegibilitySettings *)self->_legibilitySettings primaryColor];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SBFLockScreenDateView;
  [(SBFLockScreenDateView *)&v13 layoutSubviews];
  [(SBFLockScreenDateView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CSProminentDisplayViewController *)self->_prominentDisplayViewController view];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  timeLabel = self->_timeLabel;
  [(SBFLockScreenDateView *)self _timeLabelFrameForAlignmentPercent:self->_alignmentPercent];
  -[SBUILegibilityLabel setFrame:](timeLabel, "setFrame:");
  [(SBFLockScreenDateView *)self _layoutSubtitle];
}

- (void)_layoutSubtitle
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F1CA48] arrayWithObject:self->_dateSubtitleView];
  double v4 = v3;
  if (self->_customSubtitleView) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_inlineComplicationView) {
    objc_msgSend(v4, "addObject:");
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        -[SBFLockScreenDateView _subtitleViewFrameForView:alignmentPercent:](self, "_subtitleViewFrameForView:alignmentPercent:", v10, self->_alignmentPercent, (void)v11);
        objc_msgSend(v10, "setFrame:");
        if (objc_opt_respondsToSelector()) {
          [v10 setAlignmentPercent:self->_alignmentPercent];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (CGRect)_timeLabelFrameForAlignmentPercent:(double)a3
{
  [(SBUILegibilityLabel *)self->_timeLabel frame];
  double v6 = v5;
  double v8 = v7;
  double v9 = [(SBUILegibilityLabel *)self->_timeLabel string];
  [(SBFLockScreenDateView *)self _timeLabelInsetsForTimeString:v9];
  double v11 = v10;
  double v13 = v12;

  [(SBFLockScreenDateView *)self bounds];
  double v15 = (a3 + 1.0) * (v14 - v11 - v13 - v6) * 0.5;
  if (self->_subtitleOnTop)
  {
    [(SBFLockScreenDateView *)self bounds];
    double v16 = CGRectGetHeight(v26) - (self->_customTimeMetrics.capHeight - self->_customTimeMetrics.descender);
  }
  else
  {
    double v16 = 0.0;
  }
  double v17 = v11 + v15;
  if (_SBFLockScreenDateViewShouldRoundFramesForAlignmentPercent())
  {
    SBFMainScreenScale();
    BSRectRoundForScale();
    double v17 = v18;
    double v16 = v19;
    double v6 = v20;
    double v8 = v21;
  }
  double v22 = v17;
  double v23 = v16;
  double v24 = v6;
  double v25 = v8;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v23;
  result.origin.CGFloat x = v22;
  return result;
}

- (UIEdgeInsets)_timeLabelInsetsForTimeString:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    double v5 = objc_msgSend(v4, "substringWithRange:", 0, 1);
    double v6 = objc_msgSend(v4, "substringWithRange:", objc_msgSend(v4, "length") - 1, 1);
    [(SBFLockScreenDateView *)self _cachedGlyphInsetsTimeFontForString:v5];
    double v8 = v7;
    [(SBFLockScreenDateView *)self _cachedGlyphInsetsTimeFontForString:v6];
    double v10 = v9;
    if ([v6 isEqualToString:@"1"])
    {
      double v11 = [MEMORY[0x1E4F42D90] mainScreen];
      UIRoundToScreenScale();
      double v10 = v12;
    }
    double v13 = -v8;
    double v14 = -v10;

    double v15 = 0.0;
    double v16 = 0.0;
  }
  else
  {
    double v15 = *MEMORY[0x1E4F437F8];
    double v13 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v16 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }

  double v17 = v15;
  double v18 = v13;
  double v19 = v16;
  double v20 = v14;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (UIEdgeInsets)_cachedGlyphInsetsTimeFontForString:(id)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_cachedGlyphInsetsTimeFontForString__onceToken[0] != -1) {
    dispatch_once(_cachedGlyphInsetsTimeFontForString__onceToken, &__block_literal_global_32);
  }
  double v5 = [(id)_cachedGlyphInsetsTimeFontForString__leadingInsetForNumber objectForKeyedSubscript:v4];
  uint64_t v6 = [(id)_cachedGlyphInsetsTimeFontForString__trailingInsetForNumber objectForKeyedSubscript:v4];
  double v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    customTimeFont = self->_customTimeFont;
    uint64_t v31 = *MEMORY[0x1E4F42508];
    v32[0] = customTimeFont;
    double v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    double v11 = *MEMORY[0x1E4F1DB30];
    double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 8, v10, 0, *MEMORY[0x1E4F1DB30], v12);
    UIRectIntegralWithScale();
    double v14 = v13;
    double v16 = v15;
    objc_msgSend(v4, "boundingRectWithSize:options:attributes:context:", 0, v10, 0, v11, v12);
    UIRectIntegralWithScale();
    double v18 = v17;
    double v20 = v14 - v19;
    uint64_t v21 = [NSNumber numberWithDouble:v14 - v19];

    uint64_t v22 = [NSNumber numberWithDouble:v18 - v16 - v20];

    [(id)_cachedGlyphInsetsTimeFontForString__leadingInsetForNumber setObject:v21 forKeyedSubscript:v4];
    [(id)_cachedGlyphInsetsTimeFontForString__trailingInsetForNumber setObject:v22 forKeyedSubscript:v4];

    double v7 = (void *)v22;
    double v5 = (void *)v21;
  }
  [v5 floatValue];
  float v24 = v23;
  [v7 floatValue];
  float v26 = v25;

  double v27 = v24;
  double v28 = v26;
  double v29 = 0.0;
  double v30 = 0.0;
  result.right = v28;
  result.bottom = v30;
  result.left = v27;
  result.top = v29;
  return result;
}

uint64_t __61__SBFLockScreenDateView__cachedGlyphInsetsTimeFontForString___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  v1 = (void *)_cachedGlyphInsetsTimeFontForString__leadingInsetForNumber;
  _cachedGlyphInsetsTimeFontForString__leadingInsetForNumber = v0;

  uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:10];
  uint64_t v3 = _cachedGlyphInsetsTimeFontForString__trailingInsetForNumber;
  _cachedGlyphInsetsTimeFontForString__trailingInsetForNumber = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

- (CGRect)_subtitleViewFrameForView:(id)a3 alignmentPercent:(double)a4
{
  [a3 frame];
  double v7 = v6;
  double v9 = v8;
  [(SBFLockScreenDateView *)self maximumSubtitleWidth];
  if (v7 >= v10) {
    double v7 = v10;
  }
  double v11 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  if ((v12 & 0xFFFFFFFFFFFFFFFBLL) == 1
    || (unint64_t)([(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation] - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    [(SBFLockScreenDateView *)self bounds];
    double v14 = (v15 - v7) * 0.5 + a4 * ((v15 - v7) * 0.5);
  }
  else
  {
    [(SBFLockScreenDateView *)self bounds];
    double v14 = (a4 + 1.0) * (v13 - v7) * 0.5;
  }
  +[SBFDashBoardViewMetrics timeToSubtitleLabelBaselineDifferenceY];
  double dateToTimeStretch = self->_dateToTimeStretch;
  if (dateToTimeStretch < 0.0) {
    double dateToTimeStretch = 0.0;
  }
  double v18 = v16 + dateToTimeStretch;
  if (self->_subtitleOnTop)
  {
    +[SBFLockScreenDateSubtitleView labelFontMetrics];
    double v20 = v19;
    double v22 = v21;
    [(SBUILegibilityLabel *)self->_timeLabel origin];
    double v24 = v23 + self->_customTimeMetrics.ascender - self->_customTimeMetrics.capHeight - v18 - (v20 - v22);
  }
  else
  {
    [(SBUILegibilityLabel *)self->_timeLabel origin];
    double v26 = v18 + v25 + self->_customTimeMetrics.ascender;
    +[SBFLockScreenDateSubtitleView labelFontMetrics];
    double v24 = v26 - v27;
  }
  if (_SBFLockScreenDateViewShouldRoundFramesForAlignmentPercent())
  {
    SBFMainScreenScale();
    BSRectRoundForScale();
    double v14 = v28;
    double v24 = v29;
    double v7 = v30;
    double v9 = v31;
  }
  double v32 = v14;
  double v33 = v24;
  double v34 = v7;
  double v35 = v9;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

+ (id)timeFont
{
  if (timeFont_onceToken[0] != -1) {
    dispatch_once(timeFont_onceToken, &__block_literal_global_38);
  }
  uint64_t v3 = (void *)timeFont_timeFont;
  if (!timeFont_timeFont)
  {
    int v4 = __sb__runningInSpringBoard();
    if (v4)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        uint64_t v5 = 0;
        int v6 = 0;
        goto LABEL_13;
      }
    }
    else
    {
      v119 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v119 userInterfaceIdiom] != 1)
      {
        uint64_t v5 = 0;
        int v6 = 1;
        goto LABEL_13;
      }
    }
    int v6 = v4 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v7 = __sb__runningInSpringBoard();
      if (v7)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v120 = [MEMORY[0x1E4F42D90] mainScreen];
        [v120 _referenceBounds];
      }
      uint64_t v5 = v7 ^ 1;
      BSSizeRoundForScale();
      if (v27 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v26 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
      {
        int v146 = v7 ^ 1;
        int v147 = v6;
        memset(v133, 0, sizeof(v133));
        int v143 = 0;
        uint64_t v134 = 0;
        uint64_t v132 = 0;
        uint64_t v130 = 0;
        int v135 = 0;
        uint64_t v131 = 0;
        uint64_t v136 = 0;
        uint64_t v128 = 0;
        uint64_t v129 = 0;
        int v137 = 0;
        uint64_t v127 = 0;
        uint64_t v126 = 0;
        int v138 = 0;
        int v139 = 0;
        uint64_t v125 = 0;
        uint64_t v124 = 0;
        int v140 = 0;
        int v144 = 0;
        uint64_t v123 = 0;
        int v145 = 0;
        uint64_t v122 = 0;
        int v141 = 0;
        int v121 = 0;
        int v19 = 0;
        int v20 = 0;
        int v142 = 0;
        int v21 = 0;
        int v22 = 0;
        int v23 = 0;
        goto LABEL_70;
      }
    }
    else
    {
      uint64_t v5 = 0;
    }
LABEL_13:
    int v8 = __sb__runningInSpringBoard();
    int v146 = v5;
    int v147 = v6;
    if (v8)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v9 = 0;
        int v10 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v118 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v118 userInterfaceIdiom] != 1)
      {
        int v9 = 0;
        int v10 = 1;
        goto LABEL_22;
      }
    }
    int v10 = v8 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v7 = __sb__runningInSpringBoard();
      if (v7)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v110 = [MEMORY[0x1E4F42D90] mainScreen];
        [v110 _referenceBounds];
      }
      int v9 = v7 ^ 1;
      BSSizeRoundForScale();
      if (v29 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
      {
        int v141 = v7 ^ 1;
        int v142 = v10;
        memset(v133, 0, sizeof(v133));
        int v143 = 0;
        uint64_t v134 = 0;
        uint64_t v132 = 0;
        uint64_t v130 = 0;
        int v135 = 0;
        uint64_t v131 = 0;
        uint64_t v136 = 0;
        uint64_t v128 = 0;
        uint64_t v129 = 0;
        int v137 = 0;
        uint64_t v127 = 0;
        uint64_t v126 = 0;
        int v138 = 0;
        int v139 = 0;
        uint64_t v125 = 0;
        uint64_t v124 = 0;
        int v140 = 0;
        int v144 = 0;
        uint64_t v123 = 0;
        int v145 = 0;
        uint64_t v122 = 0;
        int v121 = 0;
        int v19 = 0;
        int v20 = 0;
        int v21 = 0;
        int v22 = 0;
        int v23 = 0;
        goto LABEL_70;
      }
    }
    else
    {
      int v9 = 0;
    }
LABEL_22:
    int v11 = __sb__runningInSpringBoard();
    int v141 = v9;
    int v142 = v10;
    if (v11)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v12 = 0;
        int v13 = 0;
        goto LABEL_31;
      }
    }
    else
    {
      v117 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v117 userInterfaceIdiom] != 1)
      {
        int v12 = 0;
        int v13 = 1;
        goto LABEL_31;
      }
    }
    int v13 = v11 ^ 1;
    if (SBFEffectiveHomeButtonType() == 2)
    {
      uint64_t v7 = __sb__runningInSpringBoard();
      if (v7)
      {
        __sb__mainScreenReferenceBounds();
      }
      else
      {
        v109 = [MEMORY[0x1E4F42D90] mainScreen];
        [v109 _referenceBounds];
      }
      int v12 = v7 ^ 1;
      BSSizeRoundForScale();
      if (v30 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
      {
        int v144 = v7 ^ 1;
        int v145 = v13;
        memset(v133, 0, sizeof(v133));
        int v143 = 0;
        uint64_t v134 = 0;
        uint64_t v132 = 0;
        uint64_t v130 = 0;
        int v135 = 0;
        uint64_t v131 = 0;
        uint64_t v136 = 0;
        uint64_t v128 = 0;
        uint64_t v129 = 0;
        int v137 = 0;
        uint64_t v127 = 0;
        uint64_t v126 = 0;
        int v138 = 0;
        int v139 = 0;
        uint64_t v125 = 0;
        uint64_t v124 = 0;
        int v140 = 0;
        uint64_t v122 = 0;
        uint64_t v123 = 0;
        int v121 = 0;
        int v19 = 0;
        int v20 = 0;
        int v21 = 0;
        int v22 = 0;
        int v23 = 0;
        goto LABEL_70;
      }
    }
    else
    {
      int v12 = 0;
    }
LABEL_31:
    int v14 = __sb__runningInSpringBoard();
    int v144 = v12;
    int v145 = v13;
    if (v14)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v15 = 0;
        uint64_t v2 = 0;
        goto LABEL_40;
      }
    }
    else
    {
      v116 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v116 userInterfaceIdiom] != 1)
      {
        int v15 = 0;
        uint64_t v2 = 1;
        goto LABEL_40;
      }
    }
    uint64_t v2 = v14 ^ 1u;
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v113 = [MEMORY[0x1E4F42D90] mainScreen];
      [v113 _referenceBounds];
    }
    int v15 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v16 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
    {
      int v139 = v7 ^ 1;
      int v140 = v2;
      memset(v133, 0, sizeof(v133));
      int v143 = 0;
      uint64_t v134 = 0;
      uint64_t v132 = 0;
      uint64_t v130 = 0;
      int v135 = 0;
      uint64_t v131 = 0;
      uint64_t v136 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      int v137 = 0;
      uint64_t v127 = 0;
      uint64_t v126 = 0;
      int v138 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v122 = 0;
      uint64_t v123 = 0;
      int v121 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      goto LABEL_70;
    }
LABEL_40:
    int v17 = __sb__runningInSpringBoard();
    int v139 = v15;
    int v140 = v2;
    if (v17)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        int v137 = 0;
        int v18 = 0;
        goto LABEL_50;
      }
    }
    else
    {
      v115 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v115 userInterfaceIdiom] != 1)
      {
        int v137 = 0;
        int v18 = 1;
        goto LABEL_50;
      }
    }
    int v18 = v17 ^ 1;
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v111 = [MEMORY[0x1E4F42D90] mainScreen];
      [v111 _referenceBounds];
    }
    int v137 = v7 ^ 1;
    BSSizeRoundForScale();
    if (v24 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
    {
      int v138 = v18;
      memset(v133, 0, sizeof(v133));
      int v143 = 0;
      uint64_t v134 = 0;
      uint64_t v132 = 0;
      uint64_t v130 = 0;
      int v135 = 0;
      uint64_t v131 = 0;
      uint64_t v136 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v126 = 0;
      uint64_t v127 = 0;
      uint64_t v124 = 0;
      uint64_t v125 = 0;
      uint64_t v122 = 0;
      uint64_t v123 = 0;
      int v121 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      goto LABEL_70;
    }
LABEL_50:
    int v25 = __sb__runningInSpringBoard();
    int v138 = v18;
    if (v25)
    {
      if (SBFEffectiveDeviceClass() != 2)
      {
        uint64_t v136 = 0;
        goto LABEL_184;
      }
    }
    else
    {
      v114 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v114 userInterfaceIdiom] != 1)
      {
        uint64_t v136 = 0x100000000;
        goto LABEL_184;
      }
    }
    HIDWORD(v136) = v25 ^ 1;
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v108 = [MEMORY[0x1E4F42D90] mainScreen];
      [v108 _referenceBounds];
    }
    LODWORD(v136) = v7 ^ 1;
    BSSizeRoundForScale();
    if (v37 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
    {
      memset(v133, 0, sizeof(v133));
      int v143 = 0;
      uint64_t v134 = 0;
      uint64_t v132 = 0;
      uint64_t v130 = 0;
      int v135 = 0;
      uint64_t v131 = 0;
      uint64_t v127 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v125 = 0;
      uint64_t v126 = 0;
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      uint64_t v122 = 0;
      int v121 = 0;
      int v19 = 0;
      int v20 = 0;
      int v21 = 0;
      int v22 = 0;
      int v23 = 0;
      goto LABEL_70;
    }
LABEL_184:
    uint64_t v7 = __sb__runningInSpringBoard();
    if (v7)
    {
      if (SBFEffectiveDeviceClass() != 2) {
        goto LABEL_186;
      }
    }
    else
    {
      v112 = [MEMORY[0x1E4F42948] currentDevice];
      if ([v112 userInterfaceIdiom] != 1)
      {
LABEL_186:
        int v135 = v7 ^ 1;
        if (!_SBF_Private_IsD94Like())
        {
LABEL_190:
          uint64_t v134 = 0;
          goto LABEL_200;
        }
        int v38 = __sb__runningInSpringBoard();
        if (v38)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_190;
          }
        }
        else
        {
          v106 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v106 userInterfaceIdiom])
          {
            uint64_t v134 = 0x100000000;
            goto LABEL_200;
          }
        }
        HIDWORD(v134) = v38 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v7 = __sb__runningInSpringBoard();
          if (v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v99 = [MEMORY[0x1E4F42D90] mainScreen];
            [v99 _referenceBounds];
          }
          LODWORD(v134) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v41 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
          {
            memset(v133, 0, sizeof(v133));
            int v143 = 0;
            uint64_t v131 = 0;
            uint64_t v132 = 0;
            uint64_t v129 = 0;
            uint64_t v130 = 0;
            uint64_t v127 = 0;
            uint64_t v128 = 0;
            uint64_t v125 = 0;
            uint64_t v126 = 0;
            uint64_t v123 = 0;
            uint64_t v124 = 0;
            uint64_t v122 = 0;
            int v121 = 0;
            int v19 = 0;
            int v20 = 0;
            int v21 = 0;
            int v22 = 0;
            int v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          LODWORD(v134) = 0;
        }
LABEL_200:
        uint64_t v7 = __sb__runningInSpringBoard();
        if (v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v143 = 0;
            HIDWORD(v133[3]) = 0;
            goto LABEL_210;
          }
        }
        else
        {
          v107 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v107 userInterfaceIdiom])
          {
            int v143 = 0;
            HIDWORD(v133[3]) = 1;
            goto LABEL_210;
          }
        }
        HIDWORD(v133[3]) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v7 = __sb__runningInSpringBoard();
          if (v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v102 = [MEMORY[0x1E4F42D90] mainScreen];
            [v102 _referenceBounds];
          }
          int v143 = v7 ^ 1;
          BSSizeRoundForScale();
          if (v39 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
            goto LABEL_214;
          }
        }
        else
        {
          int v143 = 0;
        }
LABEL_210:
        if (_SBF_Private_IsD94Like())
        {
          memset(v133, 0, 28);
          uint64_t v131 = 0;
          uint64_t v132 = 0;
          uint64_t v129 = 0;
          uint64_t v130 = 0;
          uint64_t v127 = 0;
          uint64_t v128 = 0;
          uint64_t v125 = 0;
          uint64_t v126 = 0;
          uint64_t v123 = 0;
          uint64_t v124 = 0;
          uint64_t v122 = 0;
          int v121 = 0;
          int v19 = 0;
          int v20 = 0;
          int v21 = 0;
          int v22 = 0;
          int v23 = 0;
          goto LABEL_70;
        }
LABEL_214:
        if (!_SBF_Private_IsD64Like())
        {
LABEL_218:
          *(void *)((char *)&v133[2] + 4) = 0;
          goto LABEL_228;
        }
        int v40 = __sb__runningInSpringBoard();
        if (v40)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_218;
          }
        }
        else
        {
          v103 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v103 userInterfaceIdiom])
          {
            HIDWORD(v133[2]) = 0;
            LODWORD(v133[3]) = 1;
            goto LABEL_228;
          }
        }
        LODWORD(v133[3]) = v40 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v7 = __sb__runningInSpringBoard();
          if (v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v94 = [MEMORY[0x1E4F42D90] mainScreen];
            [v94 _referenceBounds];
          }
          HIDWORD(v133[2]) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v45 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            memset(v133, 0, 20);
            uint64_t v131 = 0;
            uint64_t v132 = 0;
            uint64_t v129 = 0;
            uint64_t v130 = 0;
            uint64_t v127 = 0;
            uint64_t v128 = 0;
            uint64_t v125 = 0;
            uint64_t v126 = 0;
            uint64_t v123 = 0;
            uint64_t v124 = 0;
            uint64_t v122 = 0;
            int v121 = 0;
            int v19 = 0;
            int v20 = 0;
            int v21 = 0;
            int v22 = 0;
            int v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          HIDWORD(v133[2]) = 0;
        }
LABEL_228:
        uint64_t v7 = __sb__runningInSpringBoard();
        if (v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)((char *)&v133[1] + 4) = 0;
            goto LABEL_238;
          }
        }
        else
        {
          v105 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v105 userInterfaceIdiom])
          {
            HIDWORD(v133[1]) = 0;
            LODWORD(v133[2]) = 1;
            goto LABEL_238;
          }
        }
        LODWORD(v133[2]) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v7 = __sb__runningInSpringBoard();
          if (v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v98 = [MEMORY[0x1E4F42D90] mainScreen];
            [v98 _referenceBounds];
          }
          HIDWORD(v133[1]) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v42 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_242;
          }
        }
        else
        {
          HIDWORD(v133[1]) = 0;
        }
LABEL_238:
        if (_SBF_Private_IsD64Like())
        {
          *(void *)((char *)v133 + 4) = 0;
          LODWORD(v133[0]) = 0;
          uint64_t v131 = 0;
          uint64_t v132 = 0;
          uint64_t v129 = 0;
          uint64_t v130 = 0;
          uint64_t v127 = 0;
          uint64_t v128 = 0;
          uint64_t v125 = 0;
          uint64_t v126 = 0;
          uint64_t v123 = 0;
          uint64_t v124 = 0;
          uint64_t v122 = 0;
          int v121 = 0;
          int v19 = 0;
          int v20 = 0;
          int v21 = 0;
          int v22 = 0;
          int v23 = 0;
          goto LABEL_70;
        }
LABEL_242:
        int v43 = __sb__runningInSpringBoard();
        if (v43)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            *(void *)((char *)v133 + 4) = 0;
            goto LABEL_252;
          }
        }
        else
        {
          v104 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v104 userInterfaceIdiom])
          {
            HIDWORD(v133[0]) = 0;
            LODWORD(v133[1]) = 1;
            goto LABEL_252;
          }
        }
        LODWORD(v133[1]) = v43 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v7 = __sb__runningInSpringBoard();
          if (v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v95 = [MEMORY[0x1E4F42D90] mainScreen];
            [v95 _referenceBounds];
          }
          HIDWORD(v133[0]) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v44 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
          {
            LODWORD(v133[0]) = 0;
            uint64_t v131 = 0;
            uint64_t v132 = 0;
            uint64_t v129 = 0;
            uint64_t v130 = 0;
            uint64_t v127 = 0;
            uint64_t v128 = 0;
            uint64_t v125 = 0;
            uint64_t v126 = 0;
            uint64_t v123 = 0;
            uint64_t v124 = 0;
            uint64_t v122 = 0;
            int v121 = 0;
            int v19 = 0;
            int v20 = 0;
            int v21 = 0;
            int v22 = 0;
            int v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          HIDWORD(v133[0]) = 0;
        }
LABEL_252:
        uint64_t v7 = __sb__runningInSpringBoard();
        if (v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v133[0]) = 0;
            HIDWORD(v132) = 0;
            goto LABEL_262;
          }
        }
        else
        {
          v101 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v101 userInterfaceIdiom])
          {
            HIDWORD(v132) = 0;
            LODWORD(v133[0]) = 1;
            goto LABEL_262;
          }
        }
        LODWORD(v133[0]) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v7 = __sb__runningInSpringBoard();
          if (v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v93 = [MEMORY[0x1E4F42D90] mainScreen];
            [v93 _referenceBounds];
          }
          HIDWORD(v132) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v46 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
            goto LABEL_272;
          }
        }
        else
        {
          HIDWORD(v132) = 0;
        }
LABEL_262:
        if (_SBF_Private_IsD54())
        {
          LODWORD(v132) = 0;
          uint64_t v129 = 0;
          uint64_t v130 = 0;
          uint64_t v131 = 0;
          uint64_t v127 = 0;
          uint64_t v128 = 0;
          uint64_t v125 = 0;
          uint64_t v126 = 0;
          uint64_t v123 = 0;
          uint64_t v124 = 0;
          uint64_t v122 = 0;
          int v121 = 0;
          int v19 = 0;
          int v20 = 0;
          int v21 = 0;
          int v22 = 0;
          int v23 = 0;
          goto LABEL_70;
        }
LABEL_272:
        int v47 = __sb__runningInSpringBoard();
        if (v47)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v132) = 0;
            LODWORD(v130) = 0;
            goto LABEL_282;
          }
        }
        else
        {
          v100 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v100 userInterfaceIdiom])
          {
            LODWORD(v130) = 0;
            LODWORD(v132) = 1;
            goto LABEL_282;
          }
        }
        LODWORD(v132) = v47 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v48 = __sb__runningInSpringBoard();
          if (v48)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v90 = [MEMORY[0x1E4F42D90] mainScreen];
            [v90 _referenceBounds];
          }
          uint64_t v7 = v48 ^ 1u;
          BSSizeRoundForScale();
          LODWORD(v130) = v7;
          if (v49 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && (_SBF_Private_IsN84OrSimilarDevice() & 1) != 0)
          {
            uint64_t v128 = 0;
            uint64_t v129 = 0;
            uint64_t v131 = 0;
            HIDWORD(v130) = 0;
            uint64_t v126 = 0;
            uint64_t v127 = 0;
            uint64_t v124 = 0;
            uint64_t v125 = 0;
            uint64_t v122 = 0;
            uint64_t v123 = 0;
            int v121 = 0;
            int v19 = 0;
            int v20 = 0;
            int v21 = 0;
            int v22 = 0;
            int v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          LODWORD(v130) = 0;
        }
LABEL_282:
        uint64_t v7 = __sb__runningInSpringBoard();
        if (v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v129) = 0;
            HIDWORD(v131) = 0;
            goto LABEL_292;
          }
        }
        else
        {
          v97 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v97 userInterfaceIdiom])
          {
            HIDWORD(v131) = 0;
            HIDWORD(v129) = 1;
            goto LABEL_292;
          }
        }
        HIDWORD(v129) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v7 = __sb__runningInSpringBoard();
          if (v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v89 = [MEMORY[0x1E4F42D90] mainScreen];
            [v89 _referenceBounds];
          }
          HIDWORD(v131) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v50 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_301;
          }
        }
        else
        {
          HIDWORD(v131) = 0;
        }
LABEL_292:
        if _SBF_Private_IsD33OrSimilarDevice() && (_SBF_Private_IsN84ZoomedOrSimilarDevice())
        {
          LODWORD(v131) = 0;
          HIDWORD(v130) = 0;
          uint64_t v127 = 0;
          uint64_t v128 = 0;
          LODWORD(v129) = 0;
          uint64_t v125 = 0;
          uint64_t v126 = 0;
          uint64_t v123 = 0;
          uint64_t v124 = 0;
          uint64_t v122 = 0;
          int v121 = 0;
          int v19 = 0;
          int v20 = 0;
          int v21 = 0;
          int v22 = 0;
          int v23 = 0;
          goto LABEL_70;
        }
LABEL_301:
        if (!_SBF_Private_IsD93Like())
        {
LABEL_305:
          LODWORD(v131) = 0;
          HIDWORD(v130) = 0;
          goto LABEL_312;
        }
        int v51 = __sb__runningInSpringBoard();
        if (v51)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_305;
          }
        }
        else
        {
          v92 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v92 userInterfaceIdiom])
          {
            HIDWORD(v130) = 0;
            LODWORD(v131) = 1;
            goto LABEL_312;
          }
        }
        LODWORD(v131) = v51 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v52 = __sb__runningInSpringBoard();
          if (v52)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v83 = [MEMORY[0x1E4F42D90] mainScreen];
            [v83 _referenceBounds];
          }
          uint64_t v7 = v52 ^ 1u;
          BSSizeRoundForScale();
          HIDWORD(v130) = v7;
          if (v57 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
          {
            uint64_t v127 = 0;
            uint64_t v128 = 0;
            LODWORD(v129) = 0;
            uint64_t v125 = 0;
            uint64_t v126 = 0;
            uint64_t v123 = 0;
            uint64_t v124 = 0;
            uint64_t v122 = 0;
            int v121 = 0;
            int v19 = 0;
            int v20 = 0;
            int v21 = 0;
            int v22 = 0;
            int v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          HIDWORD(v130) = 0;
        }
LABEL_312:
        int v53 = __sb__runningInSpringBoard();
        if (v53)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v128) = 0;
            uint64_t v7 = 0;
            goto LABEL_322;
          }
        }
        else
        {
          v96 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v96 userInterfaceIdiom])
          {
            uint64_t v7 = 0;
            LODWORD(v128) = 1;
            goto LABEL_322;
          }
        }
        LODWORD(v128) = v53 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          int v54 = __sb__runningInSpringBoard();
          if (v54)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v86 = [MEMORY[0x1E4F42D90] mainScreen];
            [v86 _referenceBounds];
          }
          uint64_t v7 = v54 ^ 1u;
          BSSizeRoundForScale();
          if (v55 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
            goto LABEL_326;
          }
        }
        else
        {
          uint64_t v7 = 0;
        }
LABEL_322:
        if (_SBF_Private_IsD93Like())
        {
          LODWORD(v129) = v7;
          uint64_t v126 = 0;
          uint64_t v127 = 0;
          uint64_t v124 = 0;
          uint64_t v125 = 0;
          HIDWORD(v128) = 0;
          uint64_t v122 = 0;
          uint64_t v123 = 0;
          int v121 = 0;
          int v19 = 0;
          int v20 = 0;
          int v21 = 0;
          int v22 = 0;
          int v23 = 0;
          goto LABEL_70;
        }
LABEL_326:
        LODWORD(v129) = v7;
        if (!_SBF_Private_IsD63Like())
        {
LABEL_330:
          uint64_t v127 = 0;
          goto LABEL_340;
        }
        int v56 = __sb__runningInSpringBoard();
        if (v56)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
            goto LABEL_330;
          }
        }
        else
        {
          v87 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v87 userInterfaceIdiom])
          {
            uint64_t v127 = 0x100000000;
            goto LABEL_340;
          }
        }
        HIDWORD(v127) = v56 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v7 = __sb__runningInSpringBoard();
          if (v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v79 = [MEMORY[0x1E4F42D90] mainScreen];
            [v79 _referenceBounds];
          }
          LODWORD(v127) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v61 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            uint64_t v125 = 0;
            uint64_t v126 = 0;
            uint64_t v123 = 0;
            uint64_t v124 = 0;
            HIDWORD(v128) = 0;
            uint64_t v122 = 0;
            int v121 = 0;
            int v19 = 0;
            int v20 = 0;
            int v21 = 0;
            int v22 = 0;
            int v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          LODWORD(v127) = 0;
        }
LABEL_340:
        uint64_t v7 = __sb__runningInSpringBoard();
        if (v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v126 = 0;
            goto LABEL_350;
          }
        }
        else
        {
          v91 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v91 userInterfaceIdiom])
          {
            uint64_t v126 = 0x100000000;
            goto LABEL_350;
          }
        }
        HIDWORD(v126) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v7 = __sb__runningInSpringBoard();
          if (v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v82 = [MEMORY[0x1E4F42D90] mainScreen];
            [v82 _referenceBounds];
          }
          LODWORD(v126) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v58 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_354;
          }
        }
        else
        {
          LODWORD(v126) = 0;
        }
LABEL_350:
        if (_SBF_Private_IsD63Like())
        {
          uint64_t v124 = 0;
          uint64_t v125 = 0;
          HIDWORD(v128) = 0;
          uint64_t v122 = 0;
          uint64_t v123 = 0;
          int v121 = 0;
          int v19 = 0;
          int v20 = 0;
          int v21 = 0;
          int v22 = 0;
          int v23 = 0;
          goto LABEL_70;
        }
LABEL_354:
        int v59 = __sb__runningInSpringBoard();
        if (v59)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v125 = 0;
            goto LABEL_364;
          }
        }
        else
        {
          v88 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v88 userInterfaceIdiom])
          {
            uint64_t v125 = 0x100000000;
            goto LABEL_364;
          }
        }
        HIDWORD(v125) = v59 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v7 = __sb__runningInSpringBoard();
          if (v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v80 = [MEMORY[0x1E4F42D90] mainScreen];
            [v80 _referenceBounds];
          }
          LODWORD(v125) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v60 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
          {
            uint64_t v123 = 0;
            uint64_t v124 = 0;
            HIDWORD(v128) = 0;
            uint64_t v122 = 0;
            int v121 = 0;
            int v19 = 0;
            int v20 = 0;
            int v21 = 0;
            int v22 = 0;
            int v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          LODWORD(v125) = 0;
        }
LABEL_364:
        uint64_t v7 = __sb__runningInSpringBoard();
        if (v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            uint64_t v124 = 0;
            goto LABEL_374;
          }
        }
        else
        {
          v85 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v85 userInterfaceIdiom])
          {
            uint64_t v124 = 0x100000000;
            goto LABEL_374;
          }
        }
        HIDWORD(v124) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v7 = __sb__runningInSpringBoard();
          if (v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v78 = [MEMORY[0x1E4F42D90] mainScreen];
            [v78 _referenceBounds];
          }
          LODWORD(v124) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v62 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
            goto LABEL_384;
          }
        }
        else
        {
          LODWORD(v124) = 0;
        }
LABEL_374:
        if (_SBF_Private_IsD33OrSimilarDevice())
        {
          HIDWORD(v128) = 0;
          uint64_t v122 = 0;
          uint64_t v123 = 0;
          int v121 = 0;
          int v19 = 0;
          int v20 = 0;
          int v21 = 0;
          int v22 = 0;
          int v23 = 0;
          goto LABEL_70;
        }
LABEL_384:
        int v63 = __sb__runningInSpringBoard();
        if (v63)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            HIDWORD(v128) = 0;
            HIDWORD(v123) = 0;
            goto LABEL_394;
          }
        }
        else
        {
          v84 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v84 userInterfaceIdiom])
          {
            HIDWORD(v123) = 0;
            HIDWORD(v128) = 1;
            goto LABEL_394;
          }
        }
        HIDWORD(v128) = v63 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v7 = __sb__runningInSpringBoard();
          if (v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v77 = [MEMORY[0x1E4F42D90] mainScreen];
            [v77 _referenceBounds];
          }
          HIDWORD(v123) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v64 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
          {
            LODWORD(v123) = 0;
            uint64_t v122 = 0;
            int v121 = 0;
            int v19 = 0;
            int v20 = 0;
            int v21 = 0;
            int v22 = 0;
            int v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          HIDWORD(v123) = 0;
        }
LABEL_394:
        uint64_t v7 = __sb__runningInSpringBoard();
        if (v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v123) = 0;
            HIDWORD(v122) = 0;
            goto LABEL_404;
          }
        }
        else
        {
          v81 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v81 userInterfaceIdiom])
          {
            HIDWORD(v122) = 0;
            LODWORD(v123) = 1;
            goto LABEL_404;
          }
        }
        LODWORD(v123) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v7 = __sb__runningInSpringBoard();
          if (v7)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v76 = [MEMORY[0x1E4F42D90] mainScreen];
            [v76 _referenceBounds];
          }
          HIDWORD(v122) = v7 ^ 1;
          BSSizeRoundForScale();
          if (v65 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
            goto LABEL_411;
          }
        }
        else
        {
          HIDWORD(v122) = 0;
        }
LABEL_404:
        if (_SBF_Private_IsD53())
        {
LABEL_417:
          LODWORD(v122) = 0;
          int v121 = 0;
          int v19 = 0;
          int v20 = 0;
          int v21 = 0;
          int v22 = 0;
          int v23 = 0;
          goto LABEL_70;
        }
LABEL_411:
        if (_SBF_Private_IsD16() && (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
          || _SBF_Private_IsD52ZoomedOrSimilarDevice() && (_SBF_Private_IsD16() & 1) != 0
          || (_SBF_Private_IsD52OrSimilarDevice() & 1) != 0
          || (_SBF_Private_IsD52ZoomedOrSimilarDevice() & 1) != 0)
        {
          goto LABEL_417;
        }
        uint64_t v7 = __sb__runningInSpringBoard();
        if (v7)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            LODWORD(v122) = 0;
            int v121 = 0;
            goto LABEL_428;
          }
        }
        else
        {
          v75 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v75 userInterfaceIdiom])
          {
            int v121 = 0;
            LODWORD(v122) = 1;
            goto LABEL_428;
          }
        }
        LODWORD(v122) = v7 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v5 = __sb__runningInSpringBoard();
          if (v5)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v73 = [MEMORY[0x1E4F42D90] mainScreen];
            [v73 _referenceBounds];
          }
          int v121 = v5 ^ 1;
          BSSizeRoundForScale();
          if (v69 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
          {
            int v19 = 0;
            int v20 = 0;
            int v21 = 0;
            int v22 = 0;
            int v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          int v121 = 0;
        }
LABEL_428:
        int v66 = __sb__runningInSpringBoard();
        if (v66)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v19 = 0;
            int v20 = 0;
            goto LABEL_438;
          }
        }
        else
        {
          v74 = [MEMORY[0x1E4F42948] currentDevice];
          if ([v74 userInterfaceIdiom])
          {
            int v20 = 0;
            int v19 = 1;
            goto LABEL_438;
          }
        }
        int v19 = v66 ^ 1;
        if (SBFEffectiveHomeButtonType() == 2)
        {
          uint64_t v5 = __sb__runningInSpringBoard();
          if (v5)
          {
            __sb__mainScreenReferenceBounds();
          }
          else
          {
            v72 = [MEMORY[0x1E4F42D90] mainScreen];
            [v72 _referenceBounds];
          }
          int v20 = v5 ^ 1;
          BSSizeRoundForScale();
          if (v70 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
          {
            int v21 = 0;
            int v22 = 0;
            int v23 = 0;
            goto LABEL_70;
          }
        }
        else
        {
          int v20 = 0;
        }
LABEL_438:
        uint64_t v5 = __sb__runningInSpringBoard();
        if (v5)
        {
          if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
          {
            int v21 = 0;
            int v22 = 0;
LABEL_448:
            uint64_t v68 = __sb__runningInSpringBoard();
            if (v68)
            {
              if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
              {
LABEL_451:
                int v23 = 0;
                goto LABEL_70;
              }
            }
            else
            {
              uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
              if ([(id)v5 userInterfaceIdiom])
              {
                int v23 = 1;
                goto LABEL_70;
              }
            }
            int v23 = v68 ^ 1;
            int v71 = __sb__runningInSpringBoard();
            if (v71)
            {
              __sb__mainScreenReferenceBounds();
            }
            else
            {
              uint64_t v68 = [MEMORY[0x1E4F42D90] mainScreen];
              [(id)v68 _referenceBounds];
            }
            BSSizeRoundForScale();
            if (v71 != 1) {

            }
LABEL_70:
            if (v23) {

            }
            if (v22) {
            if (v21)
            }

            if (v20) {
            if (v19)
            }

            if (v121) {
            if (v122)
            }

            if (HIDWORD(v122)) {
            if (v123)
            }

            if (HIDWORD(v123)) {
            if (HIDWORD(v128))
            }

            if (v124) {
            if (HIDWORD(v124))
            }

            if (v125) {
            if (HIDWORD(v125))
            }

            if (v126) {
            if (HIDWORD(v126))
            }

            if (v127) {
            if (HIDWORD(v127))
            }

            if (v129) {
            if (v128)
            }

            if (HIDWORD(v130)) {
            if (v131)
            }

            if (HIDWORD(v131)) {
            if (HIDWORD(v129))
            }

            if (v130) {
            if (v132)
            }

            if (HIDWORD(v132)) {
            if (LODWORD(v133[0]))
            }

            if (HIDWORD(v133[0])) {
            if (LODWORD(v133[1]))
            }

            if (HIDWORD(v133[1])) {
            if (LODWORD(v133[2]))
            }

            if (HIDWORD(v133[2])) {
            if (LODWORD(v133[3]))
            }

            if (v143) {
            if (HIDWORD(v133[3]))
            }

            if (v134) {
            if (HIDWORD(v134))
            }

            if (v135) {
            if (v136)
            }

            if (HIDWORD(v136)) {
            if (v137)
            }
            {

              if (!v138) {
                goto LABEL_156;
              }
            }
            else if (!v138)
            {
LABEL_156:
              if (v139) {
                goto LABEL_157;
              }
              goto LABEL_167;
            }

            if (v139)
            {
LABEL_157:

              if (!v140) {
                goto LABEL_158;
              }
              goto LABEL_168;
            }
LABEL_167:
            if (!v140)
            {
LABEL_158:
              if (v144) {
                goto LABEL_159;
              }
              goto LABEL_169;
            }
LABEL_168:

            if (v144)
            {
LABEL_159:

              if (!v145) {
                goto LABEL_160;
              }
              goto LABEL_170;
            }
LABEL_169:
            if (!v145)
            {
LABEL_160:
              if (v141) {
                goto LABEL_161;
              }
              goto LABEL_171;
            }
LABEL_170:

            if (v141)
            {
LABEL_161:

              if (!v142) {
                goto LABEL_162;
              }
              goto LABEL_172;
            }
LABEL_171:
            if (!v142)
            {
LABEL_162:
              if (v146) {
                goto LABEL_163;
              }
              goto LABEL_173;
            }
LABEL_172:

            if (v146)
            {
LABEL_163:

              if (!v147) {
                goto LABEL_175;
              }
              goto LABEL_174;
            }
LABEL_173:
            if (!v147)
            {
LABEL_175:
              uint64_t v149 = 0;
              v150 = &v149;
              uint64_t v151 = 0x2050000000;
              double v31 = (void *)getCSProminentLayoutControllerClass_softClass;
              uint64_t v152 = getCSProminentLayoutControllerClass_softClass;
              if (!getCSProminentLayoutControllerClass_softClass)
              {
                v148[0] = MEMORY[0x1E4F143A8];
                v148[1] = 3221225472;
                v148[2] = __getCSProminentLayoutControllerClass_block_invoke;
                v148[3] = &unk_1E548C938;
                v148[4] = &v149;
                __getCSProminentLayoutControllerClass_block_invoke((uint64_t)v148);
                double v31 = (void *)v150[3];
              }
              id v32 = v31;
              _Block_object_dispose(&v149, 8);
              objc_msgSend(v32, "fontSizeForElementType:isLandscapeVariant:", 1, (unint64_t)(objc_msgSend((id)*MEMORY[0x1E4F43630], "activeInterfaceOrientation") - 3) < 2);
              CTFontRef v34 = CTFontCreateWithNameAndOptions(@".SFSoftTime-Semibold", v33, 0, 0x20000uLL);
              double v35 = (void *)timeFont_timeFont;
              timeFont_timeFont = (uint64_t)v34;

              uint64_t v3 = (void *)timeFont_timeFont;
              goto LABEL_178;
            }
LABEL_174:

            goto LABEL_175;
          }
        }
        else
        {
          uint64_t v7 = [MEMORY[0x1E4F42948] currentDevice];
          if ([(id)v7 userInterfaceIdiom])
          {
            int v22 = 0;
            int v21 = 1;
            goto LABEL_448;
          }
        }
        int v21 = v5 ^ 1;
        uint64_t v5 = __sb__runningInSpringBoard();
        if (v5)
        {
          __sb__mainScreenReferenceBounds();
        }
        else
        {
          uint64_t v2 = [MEMORY[0x1E4F42D90] mainScreen];
          [(id)v2 _referenceBounds];
        }
        int v22 = v5 ^ 1;
        BSSizeRoundForScale();
        if (v67 >= *(double *)(MEMORY[0x1E4FA6E50] + 56)) {
          goto LABEL_451;
        }
        goto LABEL_448;
      }
    }
    memset(v133, 0, sizeof(v133));
    int v143 = 0;
    uint64_t v134 = 0;
    uint64_t v132 = 0;
    uint64_t v130 = 0;
    uint64_t v131 = 0;
    uint64_t v127 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v125 = 0;
    uint64_t v126 = 0;
    uint64_t v123 = 0;
    uint64_t v124 = 0;
    uint64_t v122 = 0;
    int v121 = 0;
    int v19 = 0;
    int v20 = 0;
    int v21 = 0;
    int v22 = 0;
    int v23 = 0;
    int v135 = v7 ^ 1;
    goto LABEL_70;
  }
LABEL_178:
  return v3;
}

void __33__SBFLockScreenDateView_timeFont__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F43410];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_40];
}

void __33__SBFLockScreenDateView_timeFont__block_invoke_2()
{
  uint64_t v0 = (void *)timeFont_timeFont;
  timeFont_timeFont = 0;
}

+ ($01BB1521EC52D44A8E7628F5261DCEC8)timeFontMetrics
{
  if (timeFontMetrics_onceToken != -1) {
    dispatch_once(&timeFontMetrics_onceToken, &__block_literal_global_45);
  }
  double v3 = *(double *)&timeFontMetrics_timeFontMetrics;
  double v4 = *(double *)&qword_1EB3CFD10;
  if (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64((float64x2_t)timeFontMetrics_timeFontMetrics, (float64x2_t)SBFFontMetricsZero), (int32x4_t)vceqq_f64(*(float64x2_t *)&qword_1EB3CFD10, unk_18B5E6018))), 0xFuLL))))
  {
    uint64_t v7 = [a1 timeFont];
    [a1 metricsForFont:v7];
    *(void *)&timeFontMetrics_timeFontMetrics = v8;
    *((void *)&timeFontMetrics_timeFontMetrics + 1) = v9;
    qword_1EB3CFD10 = v10;
    dbl_1EB3CFD18 = v11;

    double v5 = *((double *)&timeFontMetrics_timeFontMetrics + 1);
    double v3 = *(double *)&timeFontMetrics_timeFontMetrics;
    double v4 = *(double *)&qword_1EB3CFD10;
  }
  else
  {
    double v5 = *((double *)&timeFontMetrics_timeFontMetrics + 1);
  }
  double v6 = dbl_1EB3CFD18;
  result.var3 = v6;
  result.var2 = v4;
  result.var1 = v5;
  result.var0 = v3;
  return result;
}

void __40__SBFLockScreenDateView_timeFontMetrics__block_invoke()
{
  timeFontMetrics_timeFontMetrics = SBFFontMetricsZero;
  *(_OWORD *)&qword_1EB3CFD10 = unk_18B5E6018;
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v0 = *MEMORY[0x1E4F43410];
  v1 = [MEMORY[0x1E4F28F08] mainQueue];
  id v2 = (id)[v3 addObserverForName:v0 object:0 queue:v1 usingBlock:&__block_literal_global_47];
}

double __40__SBFLockScreenDateView_timeFontMetrics__block_invoke_2()
{
  double result = *(double *)&SBFFontMetricsZero;
  timeFontMetrics_timeFontMetrics = SBFFontMetricsZero;
  *(_OWORD *)&qword_1EB3CFD10 = unk_18B5E6018;
  return result;
}

+ ($01BB1521EC52D44A8E7628F5261DCEC8)metricsForFont:(id)a3
{
  id v3 = a3;
  [v3 ascender];
  double v5 = v4;
  [v3 descender];
  double v7 = v6;
  [v3 _bodyLeading];
  double v9 = v8;
  [v3 capHeight];
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.var3 = v15;
  result.var2 = v14;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (double)timeBaselineOffsetFromOrigin
{
  [(SBUILegibilityLabel *)self->_timeLabel frame];
  double MaxY = CGRectGetMaxY(v6);
  [(SBUILegibilityLabel *)self->_timeLabel firstBaselineOffsetFromBottom];
  return MaxY - v4;
}

- (double)subtitleBaselineOffsetFromOrigin
{
  if (self->_customSubtitleView) {
    customSubtitleView = (SBFLockScreenDateSubtitleDateView *)self->_customSubtitleView;
  }
  else {
    customSubtitleView = self->_dateSubtitleView;
  }
  [(SBFLockScreenDateSubtitleView *)customSubtitleView baselineOffsetFromOrigin];
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBFLockScreenDateView;
  [(SBFLockScreenDateView *)&v15 traitCollectionDidChange:v4];
  double v5 = [(SBFLockScreenDateView *)self traitCollection];
  CGRect v6 = v5;
  if (v4)
  {
    double v7 = [v5 preferredContentSizeCategory];
    double v8 = [v4 preferredContentSizeCategory];
    if ([v7 isEqualToString:v8])
    {
      uint64_t v9 = [v6 legibilityWeight];
      uint64_t v10 = [v4 legibilityWeight];

      if (v9 == v10) {
        goto LABEL_7;
      }
    }
    else
    {
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__SBFLockScreenDateView_traitCollectionDidChange___block_invoke;
    block[3] = &unk_1E548CA88;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
LABEL_7:
  BOOL v11 = [v4 _backlightLuminance] != 1;
  double v12 = [(SBFLockScreenDateView *)self traitCollection];
  uint64_t v13 = [v12 _backlightLuminance];

  if (((v11 ^ (v13 == 1)) & 1) == 0) {
    [(CSProminentDisplayViewController *)self->_prominentDisplayViewController setUsesLightTimeFontVariant:v13 == 1];
  }
}

uint64_t __50__SBFLockScreenDateView_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForNewFont];
}

- (void)_updateForNewFont
{
  if (!_os_feature_enabled_impl()) {
    [(SBUILegibilityLabel *)self->_timeLabel setFont:self->_customTimeFont];
  }
  [(CSProminentDisplayViewController *)self->_prominentDisplayViewController setBaseFont:self->_customTimeFont];
  [(SBFLockScreenDateView *)self _updateLabels];
}

- (NSDate)date
{
  return self->_date;
}

- (UIColor)textColor
{
  return self->_overrideTextColor;
}

- (BSUIVibrancyConfiguration)vibrancyConfiguration
{
  return self->_vibrancyConfiguration;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (double)alignmentPercent
{
  return self->_alignmentPercent;
}

- (double)dateToTimeStretch
{
  return self->_dateToTimeStretch;
}

- (BOOL)useLandscapeTimeFontSize
{
  return self->_useLandscapeTimeFontSize;
}

- (BOOL)useCompactDateFormat
{
  return self->_useCompactDateFormat;
}

- (PRPosterContentStyle)contentStyle
{
  return self->_contentStyle;
}

- (double)timeLegibilityStrength
{
  return self->_timeLegibilityStrength;
}

- (double)subtitleLegibilityStrength
{
  return self->_subtitleLegibilityStrength;
}

- (double)maximumSubtitleWidth
{
  return self->_maximumSubtitleWidth;
}

- (UIFont)customTimeFont
{
  return self->_customTimeFont;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)customTimeMetrics
{
  double ascender = self->_customTimeMetrics.ascender;
  double descender = self->_customTimeMetrics.descender;
  double bodyLeading = self->_customTimeMetrics.bodyLeading;
  double capHeight = self->_customTimeMetrics.capHeight;
  result.var3 = capHeight;
  result.var2 = bodyLeading;
  result.var1 = descender;
  result.var0 = ascender;
  return result;
}

- (BOOL)subtitleOnTop
{
  return self->_subtitleOnTop;
}

- (NSString)customTimeNumberingSystem
{
  return self->_customTimeNumberingSystem;
}

- (CGRect)restingFrame
{
  double x = self->_restingFrame.origin.x;
  double y = self->_restingFrame.origin.y;
  double width = self->_restingFrame.size.width;
  double height = self->_restingFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRestingFrame:(CGRect)a3
{
  self->_restingFrame = a3;
}

- (SBFLockScreenDateSubtitleView)customSubtitleView
{
  return self->_customSubtitleView;
}

- (UIView)inlineComplicationView
{
  return self->_inlineComplicationView;
}

- (CSProminentDisplayViewController)prominentDisplayViewController
{
  return self->_prominentDisplayViewController;
}

- (void)setProminentDisplayViewController:(id)a3
{
}

- (BOOL)restrictsVibrancy
{
  return self->_restrictsVibrancy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prominentDisplayViewController, 0);
  objc_storeStrong((id *)&self->_inlineComplicationView, 0);
  objc_storeStrong((id *)&self->_customTimeNumberingSystem, 0);
  objc_storeStrong((id *)&self->_customTimeFont, 0);
  objc_storeStrong((id *)&self->_contentStyle, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_vibrancyConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideTextColor, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_activeSubtitleView, 0);
  objc_storeStrong((id *)&self->_customSubtitleView, 0);
  objc_storeStrong((id *)&self->_dateSubtitleView, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
}

@end