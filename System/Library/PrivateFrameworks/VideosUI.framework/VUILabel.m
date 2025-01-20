@interface VUILabel
+ (VUILabel)labelWithAttributedString:(id)a3 textLayout:(id)a4 existingLabel:(id)a5;
+ (VUILabel)labelWithString:(id)a3 textLayout:(id)a4 existingLabel:(id)a5;
+ (unint64_t)_numberOfLinesForLayout:(id)a3;
- (BOOL)_isTruncatedForTruncationMask;
- (BOOL)_updateTextColorExcludingAttachments:(id)a3;
- (BOOL)requiresMoreThanOneLineForTextWidth:(double)a3;
- (BOOL)useLanguageAwareMarginScaling;
- (CALayer)truncationMask;
- (CGRect)cachedTextRectForBounds;
- (CGRect)previousBounds;
- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4;
- (CGSize)cachedSizeThatFits;
- (CGSize)previousTargetSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (NSString)labelName;
- (UIColor)adjustmentModeNormalTintColor;
- (UIEdgeInsets)padding;
- (UITraitCollection)previousTraitCollection;
- (VUILabel)computationLabel;
- (VUILabel)initWithFrame:(CGRect)a3;
- (VUITextLayout)textLayout;
- (double)bottomMarginWithBaselineMargin:(double)a3;
- (double)bottomMarginWithBaselineMargin:(double)a3 maximumContentSizeCategory:(unint64_t)a4;
- (double)languageAwareSystemSpacingMultiplier;
- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4;
- (double)topMarginWithBaselineMargin:(double)a3;
- (double)topMarginWithBaselineMargin:(double)a3 maximumContentSizeCategory:(unint64_t)a4;
- (double)vuiBaselineHeight;
- (id)_rangeOfStringExcludingAttachments:(id)a3;
- (id)attributedText;
- (id)attributedTextProvider;
- (id)defaultParagraphStyle;
- (int64_t)previousNumberOfLines;
- (unint64_t)numberOfLinesRequiredForTextWidth:(double)a3;
- (void)_clearCachedValues;
- (void)_configureAlignmentIfNeeded;
- (void)_setupTruncationMask;
- (void)_updateCompositingFilter;
- (void)_updateTextColor;
- (void)_updateTextColor:(BOOL)a3;
- (void)_updateTruncationMask;
- (void)dealloc;
- (void)drawTextInRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAdjustmentModeNormalTintColor:(id)a3;
- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3;
- (void)setAttributedText:(id)a3;
- (void)setAttributedTextProvider:(id)a3;
- (void)setBaselineAdjustment:(int64_t)a3;
- (void)setCachedSizeThatFits:(CGSize)a3;
- (void)setCachedTextRectForBounds:(CGRect)a3;
- (void)setComputationLabel:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setLabelName:(id)a3;
- (void)setLanguageAwareSystemSpacingMultiplier:(double)a3;
- (void)setLineBreakMode:(int64_t)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPreviousBounds:(CGRect)a3;
- (void)setPreviousNumberOfLines:(int64_t)a3;
- (void)setPreviousTargetSize:(CGSize)a3;
- (void)setPreviousTraitCollection:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setText:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setTextLayout:(id)a3;
- (void)setTruncationMask:(id)a3;
- (void)setUseLanguageAwareMarginScaling:(BOOL)a3;
- (void)setVuiAttributedText:(id)a3;
- (void)setVuiText:(id)a3;
- (void)tintColorDidChange;
- (void)useExtremeSizingOnTallScripts;
- (void)vui_setHighlighted:(BOOL)a3;
- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
@end

@implementation VUILabel

+ (VUILabel)labelWithString:(id)a3 textLayout:(id)a4 existingLabel:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v11 = v10;
  int v12 = [v8 fadesOutTextTruncation];
  v13 = [v11 computationLabel];
  v14 = v13;
  if (v12)
  {
    if (v13)
    {
      uint64_t v15 = [v11 computationLabel];
    }
    else
    {
      uint64_t v15 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    v17 = (void *)v15;

    [v17 setVuiNumberOfLines:0];
    [v17 setVuiAlpha:0.0];
    [v11 setComputationLabel:v17];
    [v11 addSubview:v17];
  }
  else
  {
    [v13 removeFromSuperview];

    [v11 setComputationLabel:0];
    [v11 setTruncationMask:0];
    v16 = [v11 layer];
    [v16 setMask:0];

    v17 = 0;
  }
  [v17 setTextLayout:v8];
  [v11 setTextLayout:v8];
  objc_msgSend(v11, "setPreferredVibrancy:", objc_msgSend(v8, "preferredVibrancy"));
  objc_msgSend(v11, "setVuiNumberOfLines:", +[VUILabel _numberOfLinesForLayout:](VUILabel, "_numberOfLinesForLayout:", v8));
  [v8 padding];
  objc_msgSend(v11, "setPadding:");
  [v11 setHighlightedTextColor:0];
  [v8 fontSize];
  [v11 setAdjustsFontForContentSizeCategory:v18 == 0.0];
  [v8 fontSize];
  [v17 setAdjustsFontForContentSizeCategory:v19 == 0.0];
  [v8 minimumScaleFactor];
  if (v20 > 0.0)
  {
    [v8 minimumScaleFactor];
    objc_msgSend(v11, "setMinimumScaleFactor:");
    [v11 setAdjustsFontSizeToFitWidth:1];
    [v8 minimumScaleFactor];
    objc_msgSend(v17, "setMinimumScaleFactor:");
    [v17 setAdjustsFontSizeToFitWidth:1];
  }
  v21 = [v8 attributedStringWithString:v7 view:v11];
  if ([v11 vuiIsRTL] && objc_msgSend(v21, "length"))
  {
    long long v35 = xmmword_1E38FD930;
    uint64_t v22 = *MEMORY[0x1E4FB0738];
    v23 = objc_msgSend(v21, "attribute:atIndex:longestEffectiveRange:inRange:", *MEMORY[0x1E4FB0738], 0, &v35, 0, objc_msgSend(v21, "length"));
    v24 = (void *)[v23 mutableCopy];

    if ((void)v35 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = (void *)[v21 mutableCopy];
      [v24 setBaseWritingDirection:1];
      [v25 addAttribute:v22 value:v24 range:v35];

      v21 = v25;
    }
  }
  [v11 setVuiAttributedText:v21];
  uint64_t v26 = [v8 shadow];
  if (v26)
  {
    v27 = (void *)v26;
    int v28 = [v8 appliesShadowToContainer];

    if (v28)
    {
      v29 = [v8 shadow];
      v30 = [v11 layer];
      id v31 = [v29 shadowColor];
      objc_msgSend(v30, "setShadowColor:", objc_msgSend(v31, "CGColor"));

      [v29 shadowBlurRadius];
      objc_msgSend(v30, "setShadowRadius:");
      [v29 shadowOffset];
      objc_msgSend(v30, "setShadowOffset:");
      [v30 setMasksToBounds:0];
    }
  }
  if (v21 && [v21 length])
  {
    uint64_t v32 = [v21 attributesAtIndex:0 effectiveRange:0];
  }
  else
  {
    uint64_t v32 = [v8 defaultAttributesForLabel:v11];
  }
  v33 = (void *)v32;
  [v11 _setDefaultAttributes:v32];
  [v17 _setDefaultAttributes:v33];
  [v11 _updateCompositingFilter];
  [v11 _configureAlignmentIfNeeded];
  if ([v8 enableAXUnderlineButtonShape]) {
    [v11 _setWantsUnderlineForAccessibilityButtonShapesEnabled:1];
  }
  [v11 _updateTextColor];

  return (VUILabel *)v11;
}

+ (VUILabel)labelWithAttributedString:(id)a3 textLayout:(id)a4 existingLabel:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v8;
  }
  else {
    id v10 = (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  v11 = v10;
  int v12 = [v7 fadesOutTextTruncation];
  v13 = [v11 computationLabel];
  v14 = v13;
  if (v12)
  {
    if (v13)
    {
      uint64_t v15 = [v11 computationLabel];
    }
    else
    {
      uint64_t v15 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    v17 = (void *)v15;

    [v17 setVuiNumberOfLines:0];
    [v17 setVuiAlpha:0.0];
    [v11 setComputationLabel:v17];
    [v11 addSubview:v17];
  }
  else
  {
    [v13 removeFromSuperview];

    [v11 setComputationLabel:0];
    [v11 setTruncationMask:0];
    v16 = [v11 layer];
    [v16 setMask:0];

    v17 = 0;
  }
  [v17 setTextLayout:v7];
  [v11 setTextLayout:v7];
  objc_msgSend(v11, "setVuiNumberOfLines:", +[VUILabel _numberOfLinesForLayout:](VUILabel, "_numberOfLinesForLayout:", v7));
  objc_msgSend(v11, "setPreferredVibrancy:", objc_msgSend(v7, "preferredVibrancy"));
  [v11 setHighlightedTextColor:0];
  [v7 fontSize];
  [v11 setAdjustsFontForContentSizeCategory:v18 == 0.0];
  [v7 fontSize];
  [v17 setAdjustsFontForContentSizeCategory:v19 == 0.0];
  [v7 minimumScaleFactor];
  if (v20 > 0.0)
  {
    [v7 minimumScaleFactor];
    objc_msgSend(v11, "setMinimumScaleFactor:");
    [v11 setAdjustsFontSizeToFitWidth:1];
    [v7 minimumScaleFactor];
    objc_msgSend(v17, "setMinimumScaleFactor:");
    [v17 setAdjustsFontSizeToFitWidth:1];
  }
  v21 = objc_msgSend(v7, "attributedStringWithAttributedString:view:updateTextColor:", v9, v11, objc_msgSend(v7, "shouldUpdateTextColor"));

  [v11 setVuiAttributedText:v21];
  [v11 _updateCompositingFilter];
  [v11 _configureAlignmentIfNeeded];
  if ([v7 enableAXUnderlineButtonShape]) {
    [v11 _setWantsUnderlineForAccessibilityButtonShapesEnabled:1];
  }

  return (VUILabel *)v11;
}

+ (unint64_t)_numberOfLinesForLayout:(id)a3
{
  v3 = (void *)MEMORY[0x1E4FB1BA8];
  id v4 = a3;
  v5 = [v3 mainScreen];
  v6 = [v5 traitCollection];

  unint64_t v7 = [v4 numberOfLinesForTraitCollection:v6];
  return v7;
}

- (VUILabel)initWithFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v25[2] = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)VUILabel;
  unint64_t v7 = -[VUILabel initWithFrame:](&v23, sel_initWithFrame_);
  id v8 = v7;
  if (v7)
  {
    v7->_cachedTextRectForBounds.origin.CGFloat x = x;
    v7->_cachedTextRectForBounds.origin.CGFloat y = y;
    v7->_cachedTextRectForBounds.size.CGFloat width = width;
    v7->_cachedTextRectForBounds.size.CGFloat height = height;
    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    v7->_previousBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    v7->_previousBounds.size = v9;
    v7->_previousNumberOfLines = 0;
    v7->_cachedSizeThatFits.CGFloat width = width;
    v7->_cachedSizeThatFits.CGFloat height = height;
    v7->_previousTargetSize = (CGSize)*MEMORY[0x1E4F1DB30];
    [(VUILabel *)v7 setPreferredVibrancy:0];
    objc_initWeak(&location, v8);
    id v10 = self;
    v25[0] = v10;
    v11 = self;
    v25[1] = v11;
    int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __26__VUILabel_initWithFrame___block_invoke;
    v20[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v21, &location);
    [(VUILabel *)v8 vui_registerForTraitChanges:v12 withHandler:v20];

    v13 = self;
    v24 = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __26__VUILabel_initWithFrame___block_invoke_2;
    v18[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v19, &location);
    [(VUILabel *)v8 vui_registerForTraitChanges:v14 withHandler:v18];

    uint64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v8 selector:sel_contrastSettingsDidChange name:*MEMORY[0x1E4FB2438] object:0];

    v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v8 selector:sel_transparencySettingsDidChange name:*MEMORY[0x1E4FB24A8] object:0];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  return v8;
}

void __26__VUILabel_initWithFrame___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained traitCollection];
  v2 = [WeakRetained textLayout];
  uint64_t v3 = [v2 numberOfLinesForTraitCollection:v1];

  [WeakRetained setVuiNumberOfLines:v3];
  id v4 = [WeakRetained textLayout];

  if (v4)
  {
    v5 = [WeakRetained attributedTextProvider];

    if (!v5
      || ([WeakRetained attributedTextProvider],
          v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(),
          v6[2](),
          unint64_t v7 = objc_claimAutoreleasedReturnValue(),
          v6,
          !v7))
    {
      id v8 = [WeakRetained textLayout];
      CGSize v9 = [WeakRetained attributedText];
      uint64_t v10 = [v9 string];
      v11 = (void *)v10;
      if (v10) {
        int v12 = (__CFString *)v10;
      }
      else {
        int v12 = &stru_1F3E921E0;
      }
      unint64_t v7 = [v8 attributedStringWithString:v12 view:WeakRetained];
    }
    [WeakRetained setAttributedText:v7];
    if (([WeakRetained isEnabled] & 1) != 0
      || ([WeakRetained textLayout],
          v13 = objc_claimAutoreleasedReturnValue(),
          [v13 disabledColor],
          v14 = objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          !v14))
    {
      if (!WeakRetained[801]) {
        goto LABEL_15;
      }
      v17 = [WeakRetained textLayout];
      double v18 = [v17 highlightOrSelectedColor];

      if (!v18) {
        goto LABEL_15;
      }
      uint64_t v15 = [WeakRetained textLayout];
      uint64_t v16 = [v15 highlightOrSelectedColor];
    }
    else
    {
      uint64_t v15 = [WeakRetained textLayout];
      uint64_t v16 = [v15 disabledColor];
    }
    id v19 = (void *)v16;
    [WeakRetained setTextColor:v16];

LABEL_15:
  }
}

void __26__VUILabel_initWithFrame___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained textLayout];
  int v2 = [v1 shouldUpdateTextColor];

  if (v2) {
    [WeakRetained _updateTextColor];
  }
  [WeakRetained _updateCompositingFilter];
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB2438] object:0];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:*MEMORY[0x1E4FB24A8] object:0];

  v5.receiver = self;
  v5.super_class = (Class)VUILabel;
  [(VUILabel *)&v5 dealloc];
}

- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    int HasExuberatedLineHeight = CTFontHasExuberatedLineHeight();
    [(VUILabel *)self languageAwareSystemSpacingMultiplier];
    double v9 = v8;
    if ([(VUILabel *)self useLanguageAwareMarginScaling] && HasExuberatedLineHeight)
    {
      uint64_t v10 = [(VUILabel *)self font];
      [v10 _scaledValueForValue:1 useLanguageAwareScaling:a4];
      double v12 = v11;

LABEL_13:
      [(VUILabel *)self baselineHeight];
      double v20 = v12 - v19;
      objc_msgSend(v6, "vui_baselineOffsetFromBottom");
      double v15 = v20 - v21;
      goto LABEL_14;
    }
    if (v9 > 0.0) {
      int v14 = HasExuberatedLineHeight;
    }
    else {
      int v14 = 0;
    }
    if (v14 != 1)
    {
      uint64_t v16 = (void *)MEMORY[0x1E4FB3C70];
      v17 = [(VUILabel *)self traitCollection];
      objc_msgSend(v16, "scaleContentSizeValue:forTraitCollection:maximumContentSizeCategory:", v17, -[VUITextLayout maximumContentSizeCategory](self->_textLayout, "maximumContentSizeCategory"), a4);
      double v12 = v18;

      goto LABEL_13;
    }
    [(VUILabel *)self _systemSpacingBelowView:v6 multiplier:v9];
  }
  else
  {
    [(VUILabel *)self topMarginWithBaselineMargin:a4];
  }
  double v15 = v13;
LABEL_14:

  return v15;
}

- (BOOL)requiresMoreThanOneLineForTextWidth:(double)a3
{
  return [(VUILabel *)self numberOfLinesRequiredForTextWidth:a3] > 1;
}

- (unint64_t)numberOfLinesRequiredForTextWidth:(double)a3
{
  unint64_t result = [(VUILabel *)self attributedText];
  if (result)
  {
    id v6 = (void *)result;
    unint64_t v7 = [(VUILabel *)self attributedText];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      -[UIView vui_sizeThatFits:layout:](self, "vui_sizeThatFits:layout:", 0, a3, 0.0);
      double v10 = v9;
      double v11 = [(VUILabel *)self font];
      [v11 lineHeight];
      double v13 = v12;

      if (v13 == 0.0)
      {
        int v14 = VUIDefaultLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[VUILabel numberOfLinesRequiredForTextWidth:](self, v14);
        }

        return 1;
      }
      else
      {
        double v15 = floor(v10 / v13);
        double v16 = ceil(v10 / v13);
        if (v10 / v13 - v15 <= 0.9) {
          return (int)v15;
        }
        return (int)v16;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)attributedText
{
  v4.receiver = self;
  v4.super_class = (Class)VUILabel;
  int v2 = [(VUILabel *)&v4 attributedText];
  return v2;
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)VUILabel;
  -[VUILabel vui_layoutSubviews:computationOnly:](&v16, sel_vui_layoutSubviews_computationOnly_);
  if (v4)
  {
    -[VUILabel sizeThatFits:](self, "sizeThatFits:", width, height);
    double v11 = v10;
    double v13 = v12;
  }
  else
  {
    double v11 = v8;
    double v13 = v9;
    [(VUILabel *)self layoutSubviews];
  }
  double v14 = v11;
  double v15 = v13;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (double)topMarginWithBaselineMargin:(double)a3
{
  unint64_t v5 = [(VUITextLayout *)self->_textLayout maximumContentSizeCategory];
  [(VUILabel *)self topMarginWithBaselineMargin:v5 maximumContentSizeCategory:a3];
  return result;
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  unint64_t v5 = [(VUITextLayout *)self->_textLayout maximumContentSizeCategory];
  [(VUILabel *)self bottomMarginWithBaselineMargin:v5 maximumContentSizeCategory:a3];
  return result;
}

- (void)setVuiText:(id)a3
{
  id v4 = a3;
  [(VUILabel *)self setText:v4];
  [(VUILabel *)self->_computationLabel setText:v4];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)VUILabel;
  [(VUILabel *)&v3 layoutSubviews];
  [(VUILabel *)self _updateTruncationMask];
}

- (double)vuiBaselineHeight
{
  [(VUILabel *)self _firstBaselineOffsetFromTop];
  double v4 = v3;
  if (v3 <= 0.0)
  {
    unint64_t v5 = [(VUILabel *)self font];

    if (v5)
    {
      id v6 = [(VUILabel *)self font];
      [v6 baselineHeight];
      double v4 = v7;
    }
  }
  return v4;
}

- (void)setVuiAttributedText:(id)a3
{
  id v4 = a3;
  [(VUILabel *)self setAttributedText:v4];
  [(VUILabel *)self->_computationLabel setAttributedText:v4];
}

- (double)topMarginWithBaselineMargin:(double)a3 maximumContentSizeCategory:(unint64_t)a4
{
  double v7 = (void *)MEMORY[0x1E4FB3C70];
  double v8 = [(VUILabel *)self vuiTraitCollection];
  [v7 scaleContentSizeValue:v8 forTraitCollection:a4 maximumContentSizeCategory:a3];
  double v10 = v9;

  [(VUILabel *)self baselineHeight];
  return v10 - v11;
}

- (double)bottomMarginWithBaselineMargin:(double)a3 maximumContentSizeCategory:(unint64_t)a4
{
  double v7 = (void *)MEMORY[0x1E4FB3C70];
  double v8 = [(VUILabel *)self vuiTraitCollection];
  [v7 scaleContentSizeValue:v8 forTraitCollection:a4 maximumContentSizeCategory:a3];
  double v10 = v9;

  [(VUILabel *)self _baselineOffsetFromBottom];
  return v10 - v11;
}

- (void)setAttributedText:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (void *)[v4 mutableCopy];
  if (UIAccessibilityDarkerSystemColorsEnabled() || UIAccessibilityIsReduceTransparencyEnabled())
  {
    uint64_t v6 = *MEMORY[0x1E4FB0700];
    uint64_t v7 = [v4 length];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __30__VUILabel_setAttributedText___block_invoke;
    v40[3] = &unk_1E6DF7C50;
    v40[4] = self;
    id v41 = v5;
    objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v7, 0, v40);
  }
  double v8 = [(VUILabel *)self _rangeOfStringExcludingAttachments:v4];
  textLayout = self->_textLayout;
  if (textLayout
    && [(VUITextLayout *)textLayout appliesDirectionalIsolates]
    && [v8 count])
  {
    id v31 = v4;
    v33 = self;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v29 = v8;
    id obj = v8;
    uint64_t v10 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v37 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "rangeValue", v29, v31);
          uint64_t v16 = v15;
          v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"⁨"];
          [v5 insertAttributedString:v17 atIndex:v14];

          double v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"⁩"];
          [v5 insertAttributedString:v18 atIndex:v14 + v16];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v36 objects:v42 count:16];
      }
      while (v11);
    }

    self = v33;
    uint64_t v19 = [(VUILabel *)v33 effectiveUserInterfaceLayoutDirection];
    id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
    if (v19 == 1) {
      double v21 = @"⁧";
    }
    else {
      double v21 = @"⁦";
    }
    uint64_t v22 = objc_msgSend(v20, "initWithString:", v21, v29, v31);
    [v5 insertAttributedString:v22 atIndex:0];

    objc_super v23 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"⁩"];
    [v5 appendAttributedString:v23];

    double v8 = v30;
    id v4 = v32;
  }
  v24 = +[VUIInterfaceFactory sharedInstance];
  v25 = [v24 languageStringHandler];

  uint64_t v26 = (void *)[v5 copy];
  v27 = [(VUILabel *)self defaultParagraphStyle];
  int v28 = [v25 makeLanguageAwareAttributedString:v26 defaultParagraphStyle:v27];

  v35.receiver = self;
  v35.super_class = (Class)VUILabel;
  [(VUILabel *)&v35 setAttributedText:v28];
  [(VUILabel *)self _clearCachedValues];
}

void __30__VUILabel_setAttributedText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v16 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v8 = v16;
  if (isKindOfClass)
  {
    id v9 = v16;
    if (UIAccessibilityDarkerSystemColorsEnabled())
    {
      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 808) highContrastTintColor];
      uint64_t v11 = v10;
      if (v10)
      {
        id v12 = v10;
      }
      else
      {
        id v12 = [*(id *)(a1 + 32) _accessibilityHigherContrastTintColorForColor:v9];
      }
      id v13 = v12;

      id v9 = v13;
    }
    if (UIAccessibilityIsReduceTransparencyEnabled())
    {
      uint64_t v14 = [v9 colorByRemovingTransparency];

      id v9 = (id)v14;
    }
    uint64_t v15 = *MEMORY[0x1E4FB0700];
    objc_msgSend(*(id *)(a1 + 40), "removeAttribute:range:", *MEMORY[0x1E4FB0700], a3, a4);
    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", v15, v9, a3, a4);

    double v8 = v16;
  }
}

- (id)defaultParagraphStyle
{
  double v3 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  id v4 = (void *)[v3 mutableCopy];

  objc_msgSend(v4, "setAlignment:", -[VUILabel textAlignment](self, "textAlignment"));
  objc_msgSend(v4, "setLineBreakMode:", -[VUILabel lineBreakMode](self, "lineBreakMode"));
  unint64_t v5 = (void *)[v4 copy];

  return v5;
}

- (void)setTextColor:(id)a3
{
  id v4 = [(VUILabel *)self _accessibilityHigherContrastTintColorForColor:a3];
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    uint64_t v5 = [v4 colorByRemovingTransparency];

    id v4 = (void *)v5;
  }
  v6.receiver = self;
  v6.super_class = (Class)VUILabel;
  [(VUILabel *)&v6 setTextColor:v4];
}

- (void)useExtremeSizingOnTallScripts
{
  if (CTFontHasExuberatedLineHeight())
  {
    [(VUILabel *)self _setExtremeSizingEnabled:1];
  }
}

- (void)setPadding:(UIEdgeInsets)a3
{
  if (self->_padding.left != a3.left
    || self->_padding.top != a3.top
    || self->_padding.right != a3.right
    || self->_padding.bottom != a3.bottom)
  {
    self->_padding = a3;
    [(VUILabel *)self _clearCachedValues];
  }
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUILabel;
  [(VUILabel *)&v4 setText:a3];
  [(VUILabel *)self _clearCachedValues];
}

- (void)setFont:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUILabel;
  [(VUILabel *)&v4 setFont:a3];
  [(VUILabel *)self _clearCachedValues];
}

- (void)setLineBreakMode:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUILabel;
  [(VUILabel *)&v4 setLineBreakMode:a3];
  [(VUILabel *)self _clearCachedValues];
}

- (void)setNumberOfLines:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUILabel;
  [(VUILabel *)&v4 setNumberOfLines:a3];
  [(VUILabel *)self _clearCachedValues];
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUILabel;
  [(VUILabel *)&v4 setAdjustsFontSizeToFitWidth:a3];
  [(VUILabel *)self _clearCachedValues];
}

- (void)setBaselineAdjustment:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VUILabel;
  [(VUILabel *)&v4 setBaselineAdjustment:a3];
  [(VUILabel *)self _clearCachedValues];
}

- (CGRect)textRectForBounds:(CGRect)a3 limitedToNumberOfLines:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(VUILabel *)self previousBounds];
  v18.origin.double x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  if (!CGRectEqualToRect(v15, v18)
    || [(VUILabel *)self previousNumberOfLines] != a4
    || ([(VUILabel *)self cachedTextRectForBounds],
        CGRectEqualToRect(v16, *MEMORY[0x1E4F1DB28])))
  {
    v14.receiver = self;
    v14.super_class = (Class)VUILabel;
    -[VUILabel textRectForBounds:limitedToNumberOfLines:](&v14, sel_textRectForBounds_limitedToNumberOfLines_, a4, x, y, width, height);
    -[VUILabel setCachedTextRectForBounds:](self, "setCachedTextRectForBounds:");
    -[VUILabel setPreviousBounds:](self, "setPreviousBounds:", x, y, width, height);
    [(VUILabel *)self setPreviousNumberOfLines:a4];
  }
  [(VUILabel *)self cachedTextRectForBounds];
  result.size.double height = v13;
  result.size.double width = v12;
  result.origin.double y = v11;
  result.origin.double x = v10;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(VUILabel *)self padding];
  double v7 = v6;
  double v9 = v8;
  double v35 = v11;
  double v36 = v10;
  double v12 = fmax(width - (v6 + v8), 0.0);
  double v13 = fmax(height - (v10 + v11), 0.0);
  [(VUILabel *)self cachedSizeThatFits];
  double v15 = v14;
  double v17 = v16;
  [(VUILabel *)self previousTargetSize];
  double v19 = v18;
  double v21 = v20;
  uint64_t v22 = [(VUILabel *)self previousTraitCollection];
  BOOL v23 = -[UIView vui_shouldRecomputeCachedSizeThatFits:previousTargetSize:previousTraitCollection:newTargetSize:](self, "vui_shouldRecomputeCachedSizeThatFits:previousTargetSize:previousTraitCollection:newTargetSize:", v22, v15, v17, v19, v21, v12, v13);

  if (v23)
  {
    v37.receiver = self;
    v37.super_class = (Class)VUILabel;
    -[VUILabel sizeThatFits:](&v37, sel_sizeThatFits_, v12, v13);
    double v25 = v24;
    VUICeilValue();
    double v27 = v26;
    VUICeilValue();
    -[VUILabel setCachedSizeThatFits:](self, "setCachedSizeThatFits:", v27, v28);
    if (v12 <= 0.0) {
      double v25 = v12;
    }
    v29 = [(VUILabel *)self vuiTraitCollection];
    [(VUILabel *)self setPreviousTraitCollection:v29];

    -[VUILabel setPreviousTargetSize:](self, "setPreviousTargetSize:", v25, v13);
  }
  [(VUILabel *)self cachedSizeThatFits];
  double v31 = v9 + v7 + v30;
  [(VUILabel *)self cachedSizeThatFits];
  double v33 = v35 + v36 + v32;
  double v34 = v31;
  result.double height = v33;
  result.double width = v34;
  return result;
}

- (void)drawTextInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(VUILabel *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(VUILabel *)self padding];
  v23.origin.CGFloat x = v9 + v16;
  v23.origin.CGFloat y = v11 + v17;
  v23.size.CGFloat width = v13 - (v16 + v18);
  v23.size.CGFloat height = v15 - (v17 + v19);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  CGRect v22 = CGRectIntersection(v21, v23);
  v20.receiver = self;
  v20.super_class = (Class)VUILabel;
  -[VUILabel drawTextInRect:](&v20, sel_drawTextInRect_, v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
}

- (void)_clearCachedValues
{
  CGPoint v2 = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_cachedTextRectForBounds.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_cachedTextRectForBounds.size = v3;
  self->_previousBounds.origin = v2;
  self->_previousBounds.size = v3;
  self->_previousNumberOfLines = 0;
  CGSize v4 = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_cachedSizeThatFits = (CGSize)*MEMORY[0x1E4F1DB30];
  self->_previousTargetSize = v4;
}

- (void)_updateTruncationMask
{
  if ([(VUITextLayout *)self->_textLayout fadesOutTextTruncation])
  {
    [(VUILabel *)self bounds];
    if (v4 != *MEMORY[0x1E4F1DB30] || v3 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      if ([(VUILabel *)self _isTruncatedForTruncationMask])
      {
        if (!self->_truncationMask) {
          [(VUILabel *)self _setupTruncationMask];
        }
        [(VUILabel *)self bounds];
        double v7 = v6;
        [(VUILabel *)self bounds];
        -[CALayer setFrame:](self->_truncationMask, "setFrame:");
        double v8 = [(CALayer *)self->_truncationMask sublayers];
        id v10 = [v8 firstObject];

        [(VUILabel *)self numberOfLinesRequiredForTextWidth:v7];
        [(VUILabel *)self bounds];
        [(VUILabel *)self vuiIsRTL];
        VUIRectWithFlippedOriginRelativeToBoundingRectWithCondition();
        objc_msgSend(v10, "setFrame:");
        double v9 = [(VUILabel *)self layer];
        [v9 setMask:self->_truncationMask];
      }
      else
      {
        id v10 = [(VUILabel *)self layer];
        [v10 setMask:0];
      }
    }
  }
}

- (void)_setupTruncationMask
{
  v13[2] = *MEMORY[0x1E4F143B8];
  double v3 = (CALayer *)objc_opt_new();
  truncationMask = self->_truncationMask;
  self->_truncationMask = v3;

  uint64_t v5 = self->_truncationMask;
  id v6 = [MEMORY[0x1E4FB1618] whiteColor];
  -[CALayer setBackgroundColor:](v5, "setBackgroundColor:", [v6 CGColor]);

  double v7 = [MEMORY[0x1E4F39BD0] layer];
  id v8 = [MEMORY[0x1E4FB1618] clearColor];
  v13[0] = [v8 CGColor];
  id v9 = [MEMORY[0x1E4FB1618] whiteColor];
  v13[1] = [v9 CGColor];
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  [v7 setColors:v10];

  if ([(VUILabel *)self vuiIsRTL]) {
    double v11 = 1.0;
  }
  else {
    double v11 = 0.0;
  }
  objc_msgSend(v7, "setStartPoint:", v11, 0.5);
  if ([(VUILabel *)self vuiIsRTL]) {
    double v12 = 0.0;
  }
  else {
    double v12 = 1.0;
  }
  objc_msgSend(v7, "setEndPoint:", v12, 0.5);
  [v7 setCompositingFilter:*MEMORY[0x1E4F3A098]];
  [(CALayer *)self->_truncationMask addSublayer:v7];
}

- (BOOL)_isTruncatedForTruncationMask
{
  computationLabel = self->_computationLabel;
  if (!computationLabel) {
    return 0;
  }
  [(VUILabel *)self bounds];
  -[UIView vui_sizeThatFits:](computationLabel, "vui_sizeThatFits:", v4, 0.0);
  double v6 = v5;
  [(VUILabel *)self bounds];
  return v6 > v7;
}

- (void)tintColorDidChange
{
  v6.receiver = self;
  v6.super_class = (Class)VUILabel;
  [(VUILabel *)&v6 tintColorDidChange];
  if ([(VUILabel *)self tintAdjustmentMode] == 2)
  {
    double v3 = objc_msgSend(MEMORY[0x1E4FB1618], "vui_keyColor");
    double v4 = [(VUILabel *)self textColor];

    if (v4 == v3)
    {
      [(VUILabel *)self setAdjustmentModeNormalTintColor:v3];
      double v5 = [MEMORY[0x1E4FB1618] systemMidGrayColor];
      [(VUILabel *)self setTextColor:v5];
    }
  }
  else if (self->_adjustmentModeNormalTintColor)
  {
    -[VUILabel setTextColor:](self, "setTextColor:");
    [(VUILabel *)self setAdjustmentModeNormalTintColor:0];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VUILabel;
  -[VUILabel setHighlighted:](&v5, sel_setHighlighted_);
  [(VUILabel *)self vui_setHighlighted:v3];
}

- (void)vui_setHighlighted:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUILabel;
  [(VUILabel *)&v5 setHighlighted:a3];
  BOOL v4 = ([(VUILabel *)self isHighlighted] & 1) != 0 || self->_selected;
  [(VUILabel *)self _updateTextColor:v4];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  self->_selected = a3;
  -[VUILabel vui_setSelected:animated:withAnimationCoordinator:](self, "vui_setSelected:animated:withAnimationCoordinator:");
}

- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  if (self->_selected) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = [(VUILabel *)self isHighlighted];
  }
  -[VUILabel _updateTextColor:](self, "_updateTextColor:", v6, a4, a5);
}

- (void)setEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUILabel;
  [(VUILabel *)&v5 setEnabled:a3];
  BOOL v4 = ([(VUILabel *)self isHighlighted] & 1) != 0 || self->_selected;
  [(VUILabel *)self _updateTextColor:v4];
}

- (void)_updateTextColor
{
  id v16 = [(VUITextLayout *)self->_textLayout color];
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    BOOL v3 = [(VUITextLayout *)self->_textLayout highContrastTintColor];
    BOOL v4 = v3;
    if (v3)
    {
      id v5 = v3;
      uint64_t v6 = v16;
    }
    else
    {
      uint64_t v7 = [(VUILabel *)self _accessibilityHigherContrastTintColorForColor:v16];
      uint64_t v6 = v16;
      id v5 = (id)v7;
    }

    id v16 = v5;
  }
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    uint64_t v8 = [v16 colorByRemovingTransparency];

    id v16 = (id)v8;
  }
  if (([(VUILabel *)self isEnabled] & 1) == 0)
  {
    id v9 = [(VUITextLayout *)self->_textLayout disabledColor];

    if (v9)
    {
      uint64_t v10 = [(VUITextLayout *)self->_textLayout disabledColor];
LABEL_17:
      double v13 = (void *)v10;

      id v16 = v13;
      goto LABEL_18;
    }
  }
  if (self->_lastSelectedOrHighlighted)
  {
    double v11 = [(VUITextLayout *)self->_textLayout highlightOrSelectedColor];

    if (v11)
    {
      uint64_t v10 = [(VUITextLayout *)self->_textLayout highlightOrSelectedColor];
      goto LABEL_17;
    }
  }
  if ([(VUILabel *)self vuiUserInterfaceStyle] == 2)
  {
    double v12 = [(VUITextLayout *)self->_textLayout darkColor];

    if (v12)
    {
      uint64_t v10 = [(VUITextLayout *)self->_textLayout darkColor];
      goto LABEL_17;
    }
  }
LABEL_18:
  if ([(VUITextLayout *)self->_textLayout appliesColorToStringAttachments]
    || (BOOL v14 = [(VUILabel *)self _updateTextColorExcludingAttachments:v16],
        double v15 = v16,
        !v14))
  {
    [(VUILabel *)self setTextColor:v16];
    double v15 = v16;
  }
}

- (void)_updateTextColor:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_lastSelectedOrHighlighted != a3 || ([(VUILabel *)self isEnabled] & 1) == 0)
  {
    uint64_t v5 = [(VUITextLayout *)self->_textLayout color];
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      BOOL v7 = [(VUITextLayout *)self->_textLayout shouldUpdateTextColor];

      if (v7)
      {
        self->_lastSelectedOrHighlighted = v3;
        id v16 = [(VUITextLayout *)self->_textLayout color];
        if ([(VUILabel *)self vuiUserInterfaceStyle] == 2)
        {
          uint64_t v8 = [(VUITextLayout *)self->_textLayout darkColor];

          if (v8)
          {
            uint64_t v9 = [(VUITextLayout *)self->_textLayout darkColor];

            id v16 = (id)v9;
          }
        }
        if (v3)
        {
          uint64_t v10 = [(VUITextLayout *)self->_textLayout highlightOrSelectedColor];

          if (v10)
          {
            uint64_t v11 = [(VUITextLayout *)self->_textLayout highlightOrSelectedColor];

            id v16 = (id)v11;
          }
        }
        if (([(VUILabel *)self isEnabled] & 1) == 0)
        {
          double v12 = [(VUITextLayout *)self->_textLayout disabledColor];

          if (v12)
          {
            uint64_t v13 = [(VUITextLayout *)self->_textLayout disabledColor];

            id v16 = (id)v13;
          }
        }
        if ([(VUITextLayout *)self->_textLayout appliesColorToStringAttachments]
          || (v14 = [(VUILabel *)self _updateTextColorExcludingAttachments:v16], double v15 = v16, !v14))
        {
          [(VUILabel *)self setTextColor:v16];
          double v15 = v16;
        }
      }
    }
  }
}

- (BOOL)_updateTextColorExcludingAttachments:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(VUILabel *)self attributedText];
  uint64_t v6 = [(VUILabel *)self _rangeOfStringExcludingAttachments:v5];

  if ([v6 count])
  {
    BOOL v7 = [(VUILabel *)self vuiAttributedText];
    uint64_t v8 = (void *)[v7 mutableCopy];

    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    BOOL v11 = v10 != 0;
    if (v10)
    {
      uint64_t v12 = v10;
      uint64_t v13 = *(void *)v20;
      uint64_t v14 = *MEMORY[0x1E4FB0700];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "rangeValue", (void)v19);
          objc_msgSend(v8, "addAttribute:value:range:", v14, v4, v16, v17);
        }
        uint64_t v12 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)_rangeOfStringExcludingAttachments:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  if (v3)
  {
    uint64_t v5 = v4;
    id v6 = 0;
    if (objc_msgSend(v3, "containsAttachmentsInRange:", 0, v4))
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__VUILabel__rangeOfStringExcludingAttachments___block_invoke;
      v9[3] = &unk_1E6DF61A8;
      id v6 = v7;
      id v10 = v6;
      objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v9);
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __47__VUILabel__rangeOfStringExcludingAttachments___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = [a2 allKeys];
  char v8 = [v7 containsObject:*MEMORY[0x1E4FB06B8]];

  if ((v8 & 1) == 0)
  {
    id v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    [v9 addObject:v10];
  }
}

- (void)_updateCompositingFilter
{
  uint64_t v3 = [(VUITextLayout *)self->_textLayout darkCompositingFilter];
  if (v3
    && (uint64_t v4 = (void *)v3,
        [(VUITextLayout *)self->_textLayout compositingFilter],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = [(VUILabel *)self traitCollection];
    uint64_t v7 = [v6 userInterfaceStyle];

    textLayout = self->_textLayout;
    if (v7 == 2) {
      [(VUITextLayout *)textLayout darkCompositingFilter];
    }
    else {
    id v10 = [(VUITextLayout *)textLayout compositingFilter];
    }
    id v9 = [(VUILabel *)self layer];
    [v9 setCompositingFilter:v10];
  }
  else
  {
    id v10 = [(VUILabel *)self layer];
    [v10 setCompositingFilter:0];
  }
}

- (void)_configureAlignmentIfNeeded
{
  textLayout = self->_textLayout;
  if (textLayout
    && [(VUITextLayout *)textLayout allowsTextAlignmentOverride]
    && [(VUILabel *)self effectiveUserInterfaceLayoutDirection] == 1
    && [(VUITextLayout *)self->_textLayout alignment] == 4)
  {
    [(VUILabel *)self setVuiTextAlignment:2];
  }
}

- (VUITextLayout)textLayout
{
  return self->_textLayout;
}

- (void)setTextLayout:(id)a3
{
}

- (NSString)labelName
{
  return self->_labelName;
}

- (void)setLabelName:(id)a3
{
}

- (UIEdgeInsets)padding
{
  double top = self->_padding.top;
  double left = self->_padding.left;
  double bottom = self->_padding.bottom;
  double right = self->_padding.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (id)attributedTextProvider
{
  return self->_attributedTextProvider;
}

- (void)setAttributedTextProvider:(id)a3
{
}

- (BOOL)useLanguageAwareMarginScaling
{
  return self->_useLanguageAwareMarginScaling;
}

- (void)setUseLanguageAwareMarginScaling:(BOOL)a3
{
  self->_useLanguageAwareMarginScaling = a3;
}

- (double)languageAwareSystemSpacingMultiplier
{
  return self->_languageAwareSystemSpacingMultiplier;
}

- (void)setLanguageAwareSystemSpacingMultiplier:(double)a3
{
  self->_languageAwareSystemSpacingMultiplier = a3;
}

- (CALayer)truncationMask
{
  return self->_truncationMask;
}

- (void)setTruncationMask:(id)a3
{
}

- (VUILabel)computationLabel
{
  return self->_computationLabel;
}

- (void)setComputationLabel:(id)a3
{
}

- (CGRect)cachedTextRectForBounds
{
  double x = self->_cachedTextRectForBounds.origin.x;
  double y = self->_cachedTextRectForBounds.origin.y;
  double width = self->_cachedTextRectForBounds.size.width;
  double height = self->_cachedTextRectForBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedTextRectForBounds:(CGRect)a3
{
  self->_cachedTextRectForBounds = a3;
}

- (CGRect)previousBounds
{
  double x = self->_previousBounds.origin.x;
  double y = self->_previousBounds.origin.y;
  double width = self->_previousBounds.size.width;
  double height = self->_previousBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousBounds:(CGRect)a3
{
  self->_previousBounds = a3;
}

- (int64_t)previousNumberOfLines
{
  return self->_previousNumberOfLines;
}

- (void)setPreviousNumberOfLines:(int64_t)a3
{
  self->_previousNumberOfLines = a3;
}

- (CGSize)cachedSizeThatFits
{
  double width = self->_cachedSizeThatFits.width;
  double height = self->_cachedSizeThatFits.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCachedSizeThatFits:(CGSize)a3
{
  self->_cachedSizeThatFits = a3;
}

- (CGSize)previousTargetSize
{
  double width = self->_previousTargetSize.width;
  double height = self->_previousTargetSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviousTargetSize:(CGSize)a3
{
  self->_previousTargetSize = a3;
}

- (UITraitCollection)previousTraitCollection
{
  return self->_previousTraitCollection;
}

- (void)setPreviousTraitCollection:(id)a3
{
}

- (UIColor)adjustmentModeNormalTintColor
{
  return self->_adjustmentModeNormalTintColor;
}

- (void)setAdjustmentModeNormalTintColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjustmentModeNormalTintColor, 0);
  objc_storeStrong((id *)&self->_previousTraitCollection, 0);
  objc_storeStrong((id *)&self->_computationLabel, 0);
  objc_storeStrong((id *)&self->_truncationMask, 0);
  objc_storeStrong(&self->_attributedTextProvider, 0);
  objc_storeStrong((id *)&self->_labelName, 0);
  objc_storeStrong((id *)&self->_textLayout, 0);
}

- (void)numberOfLinesRequiredForTextWidth:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 debugDescription];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "%@ line height is 0.0", (uint8_t *)&v4, 0xCu);
}

@end