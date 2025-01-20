@interface FocusableTextView
+ (FocusableTextView)textViewWithAttributedString:(id)a3 textLayout:(id)a4 existingTextView:(id)a5;
+ (double)bottomInset;
+ (double)cornerRadius;
+ (double)topInset;
- (BOOL)isTextTruncating;
- (BOOL)needsTextSizeComputation;
- (BOOL)selectable;
- (CAGradientLayer)moreButtonMaskFade;
- (CALayer)moreButtonMask;
- (CGRect)_getStartAndEndIndexOfLastVisibleLine:(id)a3 startIndex:(unint64_t *)a4 endIndex:(unint64_t *)a5;
- (CGRect)_makeLastLineBreakByClipping;
- (CGRect)_moreLabelExclusionPathFrame;
- (CGRect)_moreLabelFrame;
- (CGSize)computeSizeThatFits:(CGSize)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4;
- (FocusableTextView)initWithTextLayout:(id)a3;
- (NSAttributedString)descriptionText;
- (UIColor)descriptionTextColor;
- (UIColor)moreLabelTextColor;
- (UITapGestureRecognizer)moreLabelTapGestureRecognizer;
- (VUILabel)computationLabel;
- (VUILabel)moreLabel;
- (VUITextLayout)textLayout;
- (VUITextView)descriptionTextView;
- (double)_bottomBaselineOffset;
- (double)bottomMarginWithBaselineMargin:(double)a3;
- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4;
- (double)topMarginWithBaselineMargin:(double)a3;
- (double)vuiBaselineHeight;
- (double)vui_baselineOffsetFromBottom;
- (id)_createMoreButtonMaskFade;
- (id)makeTextView;
- (id)selectionHandler;
- (int64_t)descriptionTextAlignment;
- (int64_t)originalMaximumNumberOfLines;
- (unint64_t)maximumNumberOfLines;
- (void)_configureAlignmentWithTextAlignment:(int64_t)a3 allowsTextAlignmentOverride:(BOOL)a4;
- (void)_recomputeTextSizeIfNeeded;
- (void)_selectButtonAction:(id)a3;
- (void)_setNeedsTextSizeComputation;
- (void)_updateTextColor;
- (void)_updateTextColorsIfNeeded;
- (void)configureMoreButtonMaskWithMaskFrame:(CGRect)a3 moreLabelFrame:(CGRect)a4;
- (void)layoutSubviews_iOSAndMacOS;
- (void)setComputationLabel:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setDescriptionTextAlignment:(int64_t)a3;
- (void)setDescriptionTextColor:(id)a3;
- (void)setDescriptionTextView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMaximumNumberOfLines:(unint64_t)a3;
- (void)setMoreButtonMask:(id)a3;
- (void)setMoreButtonMaskFade:(id)a3;
- (void)setMoreLabel:(id)a3;
- (void)setMoreLabelTextColor:(id)a3;
- (void)setNeedsTextSizeComputation:(BOOL)a3;
- (void)setOriginalMaximumNumberOfLines:(int64_t)a3;
- (void)setSelectable:(BOOL)a3;
- (void)setSelectionHandler:(id)a3;
- (void)setTextLayout:(id)a3;
- (void)setupViews_iOSAndMacOS;
- (void)tintColorDidChange;
@end

@implementation FocusableTextView

+ (FocusableTextView)textViewWithAttributedString:(id)a3 textLayout:(id)a4 existingTextView:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = (FocusableTextView *)v8;
  }
  else {
    v10 = [[FocusableTextView alloc] initWithTextLayout:v7];
  }
  v11 = v10;
  v12 = [(FocusableTextView *)v10 computationLabel];
  v13 = +[VUILabel labelWithString:@"Lorem" textLayout:v7 existingLabel:v12];

  [(FocusableTextView *)v11 setComputationLabel:v13];
  v14 = [MEMORY[0x1E4FB1BA8] mainScreen];
  v15 = [v14 vuiTraitCollection];

  -[FocusableTextView setMaximumNumberOfLines:](v11, "setMaximumNumberOfLines:", [v7 numberOfLinesForTraitCollection:v15]);
  [(FocusableTextView *)v11 _updateTextColor];
  [(FocusableTextView *)v11 setDescriptionText:v9];

  -[FocusableTextView _configureAlignmentWithTextAlignment:allowsTextAlignmentOverride:](v11, "_configureAlignmentWithTextAlignment:allowsTextAlignmentOverride:", [v7 alignment], objc_msgSend(v7, "allowsTextAlignmentOverride"));
  return v11;
}

- (FocusableTextView)initWithTextLayout:(id)a3
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FocusableTextView;
  v5 = -[FocusableTextView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5)
  {
    [(FocusableTextView *)v5 setTextLayout:v4];
    id v7 = [MEMORY[0x1E4FB1618] clearColor];
    v21.receiver = v6;
    v21.super_class = (Class)FocusableTextView;
    [(FocusableTextView *)&v21 setVuiBackgroundColor:v7];

    [(FocusableTextView *)v6 setupViews_iOSAndMacOS];
    objc_initWeak(&location, v6);
    v24[0] = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __40__FocusableTextView_initWithTextLayout___block_invoke;
    v18[3] = &unk_1E6DF4CB0;
    objc_copyWeak(&v19, &location);
    [(FocusableTextView *)v6 vui_registerForTraitChanges:v8 withHandler:v18];

    uint64_t v23 = objc_opt_class();
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    v15 = __40__FocusableTextView_initWithTextLayout___block_invoke_2;
    v16 = &unk_1E6DF4CB0;
    objc_copyWeak(&v17, &location);
    [(FocusableTextView *)v6 vui_registerForTraitChanges:v9 withHandler:&v13];

    v10 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v13, v14, v15, v16);
    [v10 addObserver:v6 selector:sel__contrastSettingsDidChange name:*MEMORY[0x1E4FB2438] object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v6 selector:sel__transparencySettingsDidChange name:*MEMORY[0x1E4FB24A8] object:0];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __40__FocusableTextView_initWithTextLayout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateTextColor];
}

void __40__FocusableTextView_initWithTextLayout___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained textLayout];
  v2 = [WeakRetained vuiTraitCollection];
  uint64_t v3 = [v1 numberOfLinesForTraitCollection:v2];

  [WeakRetained setMaximumNumberOfLines:v3];
  objc_msgSend(WeakRetained, "vui_setNeedsLayout");
}

- (void)setDescriptionTextColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_descriptionTextColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_descriptionTextColor, a3);
    [(FocusableTextView *)self vui_setNeedsLayout];
    v5 = v6;
  }
}

- (void)setDescriptionTextAlignment:(int64_t)a3
{
  if (self->_descriptionTextAlignment != a3)
  {
    self->_descriptionTextAlignment = a3;
    [(FocusableTextView *)self vui_setNeedsLayout];
  }
}

- (void)setMoreLabelTextColor:(id)a3
{
  v5 = (UIColor *)a3;
  if (self->_moreLabelTextColor != v5)
  {
    objc_storeStrong((id *)&self->_moreLabelTextColor, a3);
    [(VUITextLayout *)self->_textLayout setSeeMoreTextColor:v5];
    [(FocusableTextView *)self vui_setNeedsLayout];
  }
}

- (void)_updateTextColorsIfNeeded
{
  if (self->_descriptionTextColor)
  {
    uint64_t v3 = -[FocusableTextView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:");
    [(VUITextView *)self->_descriptionTextView setTextColor:v3];
  }
  if (self->_moreLabelTextColor)
  {
    moreLabel = self->_moreLabel;
    -[VUILabel setTextColor:](moreLabel, "setTextColor:");
  }
}

- (id)makeTextView
{
  uint64_t v3 = [VUITextView alloc];
  id v4 = -[VUITextView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(VUITextView *)v4 setVuiBackgroundColor:0];
  v5 = [(VUITextView *)v4 textContainer];
  [v5 lineFragmentPadding];
  self->_defaultLineFragmentPadding = v6;

  id v7 = [(VUITextView *)v4 textContainer];
  [v7 setLineFragmentPadding:0.0];

  -[VUITextView setVuiTextContainerInset:](v4, "setVuiTextContainerInset:", 0.0, 0.0, 0.0, 0.0);
  [(VUITextView *)v4 setEditable:0];
  [(VUITextView *)v4 setScrollEnabled:0];
  [(VUITextView *)v4 setUserInteractionEnabled:0];
  [(VUITextView *)v4 setAdjustsFontForContentSizeCategory:1];
  [(VUITextView *)v4 setSelectable:0];
  id v8 = [(VUITextView *)v4 vuiLayer];
  [v8 setCornerRadius:0.0];

  id v9 = [(VUITextView *)v4 textContainer];
  [v9 setMaximumNumberOfLines:0];

  v10 = [(VUITextView *)v4 textContainer];
  [v10 setLineBreakMode:2];

  return v4;
}

- (void)setupViews_iOSAndMacOS
{
  uint64_t v3 = [(FocusableTextView *)self makeTextView];
  auxilliaryTextView = self->_auxilliaryTextView;
  self->_auxilliaryTextView = v3;

  [(FocusableTextView *)self addSubview:self->_auxilliaryTextView];
  [(VUITextView *)self->_auxilliaryTextView setAlpha:0.0];
  self->_descriptionTextAlignment = 4;
  v5 = [(FocusableTextView *)self makeTextView];
  descriptionTextView = self->_descriptionTextView;
  self->_descriptionTextView = v5;

  [(FocusableTextView *)self addSubview:self->_descriptionTextView];
  id v7 = [(FocusableTextView *)self textLayout];
  id v18 = (id)[v7 copy];

  [v18 setFontWeight:10];
  [v18 setColor:0];
  [v18 setTextStyle:21];
  [v18 setEnableAXUnderlineButtonShape:1];
  id v8 = +[VUILocalizationManager sharedInstance];
  id v9 = [v8 localizedStringForKey:@"MORE"];
  v10 = [v9 localizedUppercaseString];
  v11 = +[VUILabel labelWithString:v10 textLayout:v18 existingLabel:self->_moreLabel];
  moreLabel = self->_moreLabel;
  self->_moreLabel = v11;

  [(VUILabel *)self->_moreLabel setAdjustsFontForContentSizeCategory:1];
  [(VUILabel *)self->_moreLabel setUserInteractionEnabled:1];
  uint64_t v13 = self->_moreLabel;
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4FB08E0], "vui_fontFromTextLayout:", v18);
  [(VUILabel *)v13 setFont:v14];

  [(VUILabel *)self->_moreLabel sizeToFit];
  [(FocusableTextView *)self addSubview:self->_moreLabel];
  v15 = self->_moreLabel;
  [(FocusableTextView *)self _moreLabelFrame];
  -[VUILabel setFrame:](v15, "setFrame:");
  v16 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__selectButtonAction_];
  moreLabelTapGestureRecognizer = self->_moreLabelTapGestureRecognizer;
  self->_moreLabelTapGestureRecognizer = v16;

  [(VUILabel *)self->_moreLabel addGestureRecognizer:self->_moreLabelTapGestureRecognizer];
}

- (void)layoutSubviews_iOSAndMacOS
{
  [(FocusableTextView *)self bounds];
  if (v5 == 0.0 || (double v7 = v6, v6 == 0.0))
  {
    double v19 = *MEMORY[0x1E4F1DB28];
    double v20 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    -[VUITextView setFrame:](self->_descriptionTextView, "setFrame:", *MEMORY[0x1E4F1DB28], v20, v21, v22);
    moreLabel = self->_moreLabel;
    -[VUILabel setFrame:](moreLabel, "setFrame:", v19, v20, v21, v22);
  }
  else
  {
    double v8 = v3;
    double v9 = v4;
    double v10 = v5;
    [(VUITextView *)self->_descriptionTextView vuiTextContainerInset];
    double v12 = v9 - v11;
    [(VUITextView *)self->_descriptionTextView vuiTextContainerInset];
    double v14 = v13;
    [(VUITextView *)self->_descriptionTextView vuiTextContainerInset];
    double v16 = v7 + v14 + v15;
    -[VUITextView setFrame:](self->_descriptionTextView, "setFrame:", v8, v12, v10, v16);
    [(VUITextView *)self->_descriptionTextView setVuiTextAlignment:self->_descriptionTextAlignment];
    id v17 = self->_moreLabel;
    [(FocusableTextView *)self _moreLabelFrame];
    -[VUILabel setFrame:](v17, "setFrame:");
    [(FocusableTextView *)self _recomputeTextSizeIfNeeded];
    id v18 = self->_moreLabel;
    if (self->_textTruncating)
    {
      [(VUILabel *)v18 setHidden:0];
      [(FocusableTextView *)self _moreLabelExclusionPathFrame];
      [(VUITextView *)self->_descriptionTextView vuiTextContainerInset];
    }
    else
    {
      [(VUILabel *)v18 setHidden:1];
      v24 = [(VUITextView *)self->_descriptionTextView textContainer];
      [v24 setExclusionPaths:MEMORY[0x1E4F1CBF0]];
    }
    double v25 = *MEMORY[0x1E4F1DAD8];
    double v26 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    [(FocusableTextView *)self _moreLabelFrame];
    -[FocusableTextView configureMoreButtonMaskWithMaskFrame:moreLabelFrame:](self, "configureMoreButtonMaskWithMaskFrame:moreLabelFrame:", v25, v26, v10, v16, v27, v28, v29, v30);
    [(FocusableTextView *)self _updateTextColorsIfNeeded];
  }
}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (a4)
  {
    -[FocusableTextView computeSizeThatFits:](self, "computeSizeThatFits:", a3.width, a3.height);
    CGFloat width = v6;
    CGFloat height = v7;
  }
  else
  {
    [(FocusableTextView *)self layoutSubviews_iOSAndMacOS];
  }
  double v8 = width;
  double v9 = height;
  result.CGFloat height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CGSize)computeSizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v6 = [(FocusableTextView *)self maximumNumberOfLines];
  double v7 = [(VUITextView *)self->_auxilliaryTextView textContainer];
  [v7 setMaximumNumberOfLines:v6];

  -[VUITextView vui_sizeThatFits:](self->_auxilliaryTextView, "vui_sizeThatFits:", width, height);
  double v9 = v8;
  double v11 = v10;
  [(VUITextView *)self->_descriptionTextView vuiTextContainerInset];
  double v13 = v12;
  [(VUITextView *)self->_descriptionTextView vuiTextContainerInset];
  double v15 = v11 - (v13 + v14);
  double v16 = [(FocusableTextView *)self vuiTraitCollection];
  LODWORD(v7) = [v16 isAXEnabled];

  if (v7)
  {
    id v17 = (void *)MEMORY[0x1E4FB3C70];
    id v18 = [(FocusableTextView *)self vuiTraitCollection];
    [v17 scaleContentSizeValue:v18 forTraitCollection:5.0];
    double v15 = v15 + v19;
  }
  if (width <= 0.0) {
    double v20 = v9;
  }
  else {
    double v20 = width;
  }
  double v21 = v15;
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(FocusableTextView *)self bounds];
  double Width = CGRectGetWidth(v8);
  -[FocusableTextView computeSizeThatFits:](self, "computeSizeThatFits:", Width, 0.0);
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(FocusableTextView *)self _setNeedsTextSizeComputation];
  v8.receiver = self;
  v8.super_class = (Class)FocusableTextView;
  -[FocusableTextView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

+ (double)cornerRadius
{
  return 5.0;
}

+ (double)topInset
{
  return 1.0;
}

+ (double)bottomInset
{
  return 1.0;
}

- (void)setSelectable:(BOOL)a3
{
  BOOL v3 = a3;
  self->_selectable = a3;
  -[VUIBaseView setVuiUserInteractionEnabled:](self, "setVuiUserInteractionEnabled:");
  [(VUITextView *)self->_descriptionTextView setVuiUserInteractionEnabled:v3];
  descriptionTextView = self->_descriptionTextView;
  [(VUITextView *)descriptionTextView setSelectable:v3];
}

- (void)setDescriptionText:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    unint64_t v6 = (void *)[v4 mutableCopy];
    uint64_t v7 = *MEMORY[0x1E4FB0738];
    uint64_t v8 = [v5 length];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __40__FocusableTextView_setDescriptionText___block_invoke;
    v23[3] = &unk_1E6DFD128;
    id v9 = v6;
    id v24 = v9;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0, v23);
    if (UIAccessibilityDarkerSystemColorsEnabled())
    {
      objc_initWeak(&location, self);
      uint64_t v10 = [v5 length];
      uint64_t v11 = *MEMORY[0x1E4FB0700];
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      id v18 = __40__FocusableTextView_setDescriptionText___block_invoke_2;
      double v19 = &unk_1E6DFD150;
      objc_copyWeak(&v21, &location);
      id v20 = v9;
      objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v10, 0, &v16);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    descriptionTextView = self->_descriptionTextView;
    double v13 = objc_msgSend(v9, "copy", v16, v17, v18, v19);
    [(VUITextView *)descriptionTextView setVuiAttributedText:v13];

    auxilliaryTextView = self->_auxilliaryTextView;
    double v15 = (void *)[v9 copy];
    [(VUITextView *)auxilliaryTextView setVuiAttributedText:v15];

    [(FocusableTextView *)self _setNeedsTextSizeComputation];
    [(FocusableTextView *)self vui_setNeedsLayout];
  }
}

void __40__FocusableTextView_setDescriptionText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v16 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v8 = v16;
  if (isKindOfClass)
  {
    id v9 = (void *)[v16 mutableCopy];
    uint64_t v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    }
    double v12 = v11;

    [v12 setLineBreakMode:0];
    [v12 setAlignment:4];
    uint64_t v13 = *MEMORY[0x1E4FB0738];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4FB0738], a3, a4);
    double v14 = *(void **)(a1 + 32);
    double v15 = (void *)[v12 copy];
    objc_msgSend(v14, "addAttribute:value:range:", v13, v15, a3, a4);

    uint64_t v8 = v16;
  }
}

void __40__FocusableTextView_setDescriptionText___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v11 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v11;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = [WeakRetained _accessibilityHigherContrastTintColorForColor:v7];

    uint64_t v10 = *MEMORY[0x1E4FB0700];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4FB0700], a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v10, v9, a3, a4);
  }
}

- (NSAttributedString)descriptionText
{
  return [(VUITextView *)self->_descriptionTextView vuiAttributedText];
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  if ([(FocusableTextView *)self maximumNumberOfLines] != a3)
  {
    double v5 = [(VUITextView *)self->_descriptionTextView textContainer];
    [v5 setMaximumNumberOfLines:a3];

    [(FocusableTextView *)self _setNeedsTextSizeComputation];
    [(FocusableTextView *)self vui_setNeedsLayout];
  }
}

- (unint64_t)maximumNumberOfLines
{
  v2 = [(VUITextView *)self->_descriptionTextView textContainer];
  unint64_t v3 = [v2 maximumNumberOfLines];

  return v3;
}

- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  if (a3) {
    -[VUILabel topMarginToLabel:withBaselineMargin:](self->_computationLabel, "topMarginToLabel:withBaselineMargin:", a4);
  }
  else {
    [(FocusableTextView *)self topMarginWithBaselineMargin:a4];
  }
  return result;
}

- (double)vui_baselineOffsetFromBottom
{
  [(VUILabel *)self->_computationLabel vui_baselineOffsetFromBottom];
  return result;
}

- (double)topMarginWithBaselineMargin:(double)a3
{
  [(VUILabel *)self->_computationLabel topMarginWithBaselineMargin:a3];
  return result;
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  [(VUILabel *)self->_computationLabel bottomMarginWithBaselineMargin:a3];
  return result;
}

- (double)_bottomBaselineOffset
{
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  [(VUITextView *)self->_descriptionTextView vuiTextContainerInset];
  uint64_t v4 = v3;
  double v5 = [(VUITextView *)self->_descriptionTextView textLayoutManager];
  unint64_t v6 = [v5 documentRange];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__FocusableTextView__bottomBaselineOffset__block_invoke;
  v10[3] = &unk_1E6DFD178;
  v10[4] = v11;
  v10[5] = v4;
  [v5 enumerateTextSegmentsInRange:v6 type:0 options:0 usingBlock:v10];
  [(VUITextView *)self->_descriptionTextView bounds];
  VUIRoundValue();
  double v8 = v7;

  _Block_object_dispose(v11, 8);
  return v8;
}

uint64_t __42__FocusableTextView__bottomBaselineOffset__block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  double v7 = *(double *)(v6 + 24);
  double v8 = a3 + *(double *)(a1 + 40) + a6;
  if (v7 < v8) {
    double v7 = v8;
  }
  *(double *)(v6 + 24) = v7;
  return 1;
}

- (void)_setNeedsTextSizeComputation
{
  self->_needsTextSizeComputation = 1;
}

- (void)_recomputeTextSizeIfNeeded
{
  if (self->_needsTextSizeComputation)
  {
    self->_needsTextSizeComputation = 0;
    [(VUITextView *)self->_descriptionTextView bounds];
    double v4 = v3;
    if ([(FocusableTextView *)self maximumNumberOfLines])
    {
      double v5 = [(VUITextView *)self->_auxilliaryTextView textContainer];
      objc_msgSend(v5, "setMaximumNumberOfLines:", -[FocusableTextView maximumNumberOfLines](self, "maximumNumberOfLines"));

      -[VUITextView vui_sizeThatFits:](self->_auxilliaryTextView, "vui_sizeThatFits:", v4, 0.0);
      double v7 = v6;
      double v8 = [(VUITextView *)self->_auxilliaryTextView textContainer];
      objc_msgSend(v8, "setMaximumNumberOfLines:", -[FocusableTextView maximumNumberOfLines](self, "maximumNumberOfLines") + 1);

      -[VUITextView vui_sizeThatFits:](self->_auxilliaryTextView, "vui_sizeThatFits:", v4, 0.0);
      self->_textTruncating = v9 > v7;
    }
    else
    {
      self->_textTruncating = 0;
    }
  }
}

- (CGRect)_moreLabelExclusionPathFrame
{
  [(VUITextView *)self->_descriptionTextView vuiTextContainerInset];
  double v4 = v3;
  double v6 = v5;
  [(FocusableTextView *)self _moreLabelFrame];
  double v8 = v7;
  double v10 = v9 - v6;
  double v12 = v11 - v4;
  double v14 = v13 + 0.0;
  double defaultLineFragmentPadding = self->_defaultLineFragmentPadding;
  id v16 = [(VUITextView *)self->_descriptionTextView textContainer];
  [v16 lineFragmentPadding];
  double v18 = defaultLineFragmentPadding - v17;

  double v19 = v10 - v18;
  double v20 = v14 + v18;
  double v21 = v12;
  double v22 = v8;
  result.size.double height = v22;
  result.size.double width = v20;
  result.origin.double y = v21;
  result.origin.double x = v19;
  return result;
}

- (id)_createMoreButtonMaskFade
{
  v12[2] = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F39BD0] layer];
  id v4 = [MEMORY[0x1E4FB1618] clearColor];
  v12[0] = [v4 CGColor];
  id v5 = [MEMORY[0x1E4FB1618] whiteColor];
  v12[1] = [v5 CGColor];
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  [v3 setColors:v6];

  double v7 = [(VUITextView *)self->_descriptionTextView vuiText];
  int v8 = [v7 _isNaturallyRTL];

  if (v8) {
    double v9 = 1.0;
  }
  else {
    double v9 = 0.0;
  }
  if (v8) {
    double v10 = 0.0;
  }
  else {
    double v10 = 1.0;
  }
  objc_msgSend(v3, "setStartPoint:", v9, 0.5);
  objc_msgSend(v3, "setEndPoint:", v10, 0.5);
  [v3 setLocations:&unk_1F3F3E528];
  [v3 setCompositingFilter:*MEMORY[0x1E4F3A098]];
  [v3 setMasksToBounds:1];
  return v3;
}

- (void)configureMoreButtonMaskWithMaskFrame:(CGRect)a3 moreLabelFrame:(CGRect)a4
{
  double width = a4.size.width;
  double height = a3.size.height;
  double v6 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  char v10 = [(VUILabel *)self->_moreLabel isHidden];
  moreButtonMask = self->_moreButtonMask;
  if (v10)
  {
    self->_moreButtonMask = 0;

    moreButtonMaskFade = self->_moreButtonMaskFade;
    self->_moreButtonMaskFade = 0;
  }
  else
  {
    if (!moreButtonMask)
    {
      double v13 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
      double v14 = self->_moreButtonMask;
      self->_moreButtonMask = v13;

      id v15 = [MEMORY[0x1E4FB1618] whiteColor];
      -[CALayer setBackgroundColor:](self->_moreButtonMask, "setBackgroundColor:", [v15 CGColor]);

      [(CALayer *)self->_moreButtonMask setMasksToBounds:1];
      id v16 = [(FocusableTextView *)self _createMoreButtonMaskFade];
      double v17 = self->_moreButtonMaskFade;
      self->_moreButtonMaskFade = v16;

      [(CALayer *)self->_moreButtonMask addSublayer:self->_moreButtonMaskFade];
      moreButtonMask = self->_moreButtonMask;
    }
    -[CALayer setFrame:](moreButtonMask, "setFrame:", x, y, v6, height);
    [(FocusableTextView *)self _makeLastLineBreakByClipping];
    double v19 = v18;
    [(VUITextView *)self->_descriptionTextView vuiTextContainerInset];
    double v21 = v19 + v20;
    double v22 = width * 1.5;
    uint64_t v23 = [(VUITextView *)self->_descriptionTextView vuiText];
    int v24 = [v23 _isNaturallyRTL];

    double v25 = v6 - v22;
    if (v24) {
      double v25 = 0.0;
    }
    -[CAGradientLayer setFrame:](self->_moreButtonMaskFade, "setFrame:", v25, v21, v22, height - v21);
  }
  id v26 = [(VUITextView *)self->_descriptionTextView layer];
  [v26 setMask:self->_moreButtonMask];
}

- (CGRect)_getStartAndEndIndexOfLastVisibleLine:(id)a3 startIndex:(unint64_t *)a4 endIndex:(unint64_t *)a5
{
  id v7 = a3;
  uint64_t v29 = 0;
  double v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x2020000000;
  uint64_t v28 = 0;
  uint64_t v19 = 0;
  double v20 = (double *)&v19;
  uint64_t v21 = 0x4010000000;
  double v22 = &unk_1E3ADDC25;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long v23 = *MEMORY[0x1E4F1DB28];
  long long v24 = v8;
  double v9 = [v7 documentRange];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__FocusableTextView__getStartAndEndIndexOfLastVisibleLine_startIndex_endIndex___block_invoke;
  v18[3] = &unk_1E6DFD1A0;
  void v18[4] = &v19;
  v18[5] = &v25;
  v18[6] = &v29;
  [v7 enumerateTextSegmentsInRange:v9 type:0 options:0 usingBlock:v18];
  *a4 = v26[3];
  *a5 = v30[3];
  double v10 = v20[4];
  double v11 = v20[5];
  double v12 = v20[6];
  double v13 = v20[7];

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  result.size.double height = v17;
  result.size.double width = v16;
  result.origin.double y = v15;
  result.origin.double x = v14;
  return result;
}

uint64_t __79__FocusableTextView__getStartAndEndIndexOfLastVisibleLine_startIndex_endIndex___block_invoke(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v7 = *(double **)(a1[4] + 8);
  v7[4] = a3;
  v7[5] = a4;
  v7[6] = a5;
  v7[7] = a6;
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(*(void *)(a1[6] + 8) + 24);
  uint64_t v8 = [a2 range];
  *(void *)(*(void *)(a1[6] + 8) + 24) = v8 + v9;
  return 1;
}

- (CGRect)_makeLastLineBreakByClipping
{
  unint64_t v30 = 0;
  uint64_t v31 = 0;
  double v3 = [(VUITextView *)self->_descriptionTextView vuiAttributedText];
  id v4 = (void *)[v3 mutableCopy];
  id v5 = [(VUITextView *)self->_descriptionTextView textLayoutManager];
  [(FocusableTextView *)self _getStartAndEndIndexOfLastVisibleLine:v5 startIndex:&v31 endIndex:&v30];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  unint64_t v14 = v30;
  uint64_t v15 = v31;
  if (v14 <= [v3 length])
  {
    uint64_t v16 = v14 - v15;
    uint64_t v17 = *MEMORY[0x1E4FB0738];
    uint64_t v18 = v31;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __49__FocusableTextView__makeLastLineBreakByClipping__block_invoke;
    v28[3] = &unk_1E6DFD128;
    id v19 = v4;
    id v29 = v19;
    objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v17, v18, v16, 0, v28);
    descriptionTextView = self->_descriptionTextView;
    uint64_t v21 = (void *)[v19 copy];
    [(VUITextView *)descriptionTextView setVuiAttributedText:v21];

    auxilliaryTextView = self->_auxilliaryTextView;
    long long v23 = (void *)[v19 copy];
    [(VUITextView *)auxilliaryTextView setVuiAttributedText:v23];
  }
  double v24 = v7;
  double v25 = v9;
  double v26 = v11;
  double v27 = v13;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

void __49__FocusableTextView__makeLastLineBreakByClipping__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v16 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v8 = v16;
  if (isKindOfClass)
  {
    double v9 = (void *)[v16 mutableCopy];
    double v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = objc_alloc_init(MEMORY[0x1E4FB0848]);
    }
    double v12 = v11;

    [v12 setLineBreakMode:2];
    [v12 setAlignment:4];
    uint64_t v13 = *MEMORY[0x1E4FB0738];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4FB0738], a3, a4);
    unint64_t v14 = *(void **)(a1 + 32);
    uint64_t v15 = (void *)[v12 copy];
    objc_msgSend(v14, "addAttribute:value:range:", v13, v15, a3, a4);

    double v8 = v16;
  }
}

- (CGRect)_moreLabelFrame
{
  double v3 = [(VUITextView *)self->_descriptionTextView vuiText];
  int v4 = [v3 _isNaturallyRTL];

  [(VUITextView *)self->_descriptionTextView frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  -[VUILabel sizeThatFits:](self->_moreLabel, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v14 = v13;
  CGFloat v16 = v15;
  double v17 = 3.0;
  if ((v4 & 1) == 0)
  {
    v34.origin.double x = v6;
    v34.origin.double y = v8;
    v34.size.double width = v10;
    v34.size.double height = v12;
    double MaxX = CGRectGetMaxX(v34);
    v35.origin.double x = 0.0;
    v35.origin.double y = 0.0;
    v35.size.double width = v14;
    v35.size.double height = v16;
    double v17 = MaxX - CGRectGetWidth(v35) + -3.0;
  }
  CGFloat v19 = v10;
  CGFloat v20 = v8;
  CGFloat v21 = v6;
  v36.origin.double y = 0.0;
  v36.origin.double x = v17;
  v36.size.double width = v14;
  v36.size.double height = v16;
  double Width = CGRectGetWidth(v36);
  double v23 = v14 + 3.0;
  if (v4)
  {
    v37.origin.double y = 0.0;
    v37.origin.double x = v17;
    v37.size.double width = v23;
    v37.size.double height = v16;
    double v17 = v17 + Width - CGRectGetWidth(v37);
  }
  double v24 = [(VUITextView *)self->_descriptionTextView vuiAttributedText];
  v38.origin.double x = v21;
  v38.origin.double y = v20;
  v38.size.double width = v19;
  v38.size.double height = v12;
  double MaxY = CGRectGetMaxY(v38);
  v39.origin.double x = v17;
  v39.origin.double y = 0.0;
  v39.size.double width = v23;
  v39.size.double height = v16;
  double v26 = floor(MaxY - CGRectGetHeight(v39));
  if ([v24 length])
  {
    [(FocusableTextView *)self _bottomBaselineOffset];
    double v28 = v27;
    [(VUILabel *)self->_moreLabel vui_baselineOffsetFromBottom];
    double v26 = v26 + v29 - v28;
  }

  double v30 = v17;
  double v31 = v26;
  double v32 = v23;
  double v33 = v16;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)FocusableTextView;
  [(FocusableTextView *)&v4 tintColorDidChange];
  if ([(FocusableTextView *)self tintAdjustmentMode] == 2) {
    [MEMORY[0x1E4FB1618] systemMidGrayColor];
  }
  else {
  double v3 = [(FocusableTextView *)self moreLabelTextColor];
  }
  [(VUILabel *)self->_moreLabel setTextColor:v3];
}

- (void)_updateTextColor
{
  id v12 = [(VUITextLayout *)self->_textLayout color];
  id v3 = [(VUITextLayout *)self->_textLayout seeMoreTextColor];
  if (!v3) {
    id v3 = v12;
  }
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    objc_super v4 = [(VUITextLayout *)self->_textLayout highContrastTintColor];
    double v5 = v4;
    if (v4)
    {
      id v6 = v4;
      double v7 = v12;
    }
    else
    {
      uint64_t v8 = [(FocusableTextView *)self _accessibilityHigherContrastTintColorForColor:v12];
      double v7 = v12;
      id v6 = (id)v8;
    }

    id v12 = v6;
  }
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    uint64_t v9 = [v12 colorByRemovingTransparency];

    uint64_t v10 = [v3 colorByRemovingTransparency];

    id v3 = (id)v10;
    id v11 = (id)v9;
  }
  else
  {
    id v11 = v12;
  }
  id v13 = v11;
  [(FocusableTextView *)self setDescriptionTextColor:v11];
  [(FocusableTextView *)self setMoreLabelTextColor:v3];
}

- (void)_configureAlignmentWithTextAlignment:(int64_t)a3 allowsTextAlignmentOverride:(BOOL)a4
{
  int64_t v4 = a3;
  if (a4 && ((a3 == 4) & [(FocusableTextView *)self vuiIsRTL]) != 0) {
    int64_t v4 = 2;
  }
  [(FocusableTextView *)self setDescriptionTextAlignment:v4];
}

- (void)_selectButtonAction:(id)a3
{
  id v4 = a3;
  selectionHandler = (void (**)(void))self->_selectionHandler;
  if (selectionHandler && self->_textTruncating)
  {
    id v6 = v4;
    selectionHandler[2]();
    id v4 = v6;
  }
}

- (double)vuiBaselineHeight
{
  return self->vuiBaselineHeight;
}

- (VUILabel)computationLabel
{
  return self->_computationLabel;
}

- (void)setComputationLabel:(id)a3
{
}

- (UIColor)descriptionTextColor
{
  return self->_descriptionTextColor;
}

- (int64_t)descriptionTextAlignment
{
  return self->_descriptionTextAlignment;
}

- (BOOL)selectable
{
  return self->_selectable;
}

- (BOOL)isTextTruncating
{
  return self->_textTruncating;
}

- (UIColor)moreLabelTextColor
{
  return self->_moreLabelTextColor;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
}

- (VUITextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (void)setDescriptionTextView:(id)a3
{
}

- (UITapGestureRecognizer)moreLabelTapGestureRecognizer
{
  return self->_moreLabelTapGestureRecognizer;
}

- (BOOL)needsTextSizeComputation
{
  return self->_needsTextSizeComputation;
}

- (void)setNeedsTextSizeComputation:(BOOL)a3
{
  self->_needsTextSizeComputation = a3;
}

- (int64_t)originalMaximumNumberOfLines
{
  return self->_originalMaximumNumberOfLines;
}

- (void)setOriginalMaximumNumberOfLines:(int64_t)a3
{
  self->_originalMaximumNumberOfLines = a3;
}

- (VUITextLayout)textLayout
{
  return self->_textLayout;
}

- (void)setTextLayout:(id)a3
{
}

- (VUILabel)moreLabel
{
  return self->_moreLabel;
}

- (void)setMoreLabel:(id)a3
{
}

- (CALayer)moreButtonMask
{
  return self->_moreButtonMask;
}

- (void)setMoreButtonMask:(id)a3
{
}

- (CAGradientLayer)moreButtonMaskFade
{
  return self->_moreButtonMaskFade;
}

- (void)setMoreButtonMaskFade:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreButtonMaskFade, 0);
  objc_storeStrong((id *)&self->_moreButtonMask, 0);
  objc_storeStrong((id *)&self->_moreLabel, 0);
  objc_storeStrong((id *)&self->_textLayout, 0);
  objc_storeStrong((id *)&self->_moreLabelTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_moreLabelTextColor, 0);
  objc_storeStrong((id *)&self->_descriptionTextColor, 0);
  objc_storeStrong((id *)&self->_computationLabel, 0);
  objc_storeStrong((id *)&self->_auxilliaryTextView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end