@interface TVFocusableTextView
+ (double)cornerRadius;
- (BOOL)alwaysShowBackground;
- (BOOL)canBecomeFocused;
- (BOOL)disableFocus;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAlwaysFocusable;
- (BOOL)isTextTruncating;
- (BOOL)moreLabelOnNewLine;
- (BOOL)needsTextSizeComputation;
- (BOOL)trackHorizontal;
- (CGRect)_moreLabelExclusionPathFrame;
- (CGRect)_moreLabelFrame;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSAttributedString)descriptionText;
- (TVFocusableTextView)initWithFrame:(CGRect)a3;
- (UIColor)descriptionTextColor;
- (UIColor)descriptionTextHighlightColor;
- (UIColor)highlightBackgroundColor;
- (UIColor)moreLabelTextColor;
- (UIEdgeInsets)padding;
- (UILabel)moreLabel;
- (UITapGestureRecognizer)moreLabelTapGestureRecognizer;
- (UITapGestureRecognizer)playRecognizer;
- (UITapGestureRecognizer)selectRecognizer;
- (UITextView)descriptionTextView;
- (UIVisualEffectView)backgroundView;
- (_UIFloatingContentView)floatingView;
- (double)moreHighlightPadding;
- (double)moreHorizontalMargin;
- (id)playHandler;
- (id)selectionHandler;
- (int64_t)descriptionTextAlignment;
- (unint64_t)focusSizeIncrease;
- (unint64_t)maximumNumberOfLines;
- (void)_playButtonAction:(id)a3;
- (void)_recomputeTextSizeIfNeeded;
- (void)_selectButtonAction:(id)a3;
- (void)_setNeedsTextSizeComputation;
- (void)_updateBackgroundColors;
- (void)_updateTextColorsForFocusState:(BOOL)a3;
- (void)_updateTextColorsIfNeeded;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)floatingContentView:(id)a3 isTransitioningFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)layoutSubviews;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)setAlwaysFocusable:(BOOL)a3;
- (void)setAlwaysShowBackground:(BOOL)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setDescriptionText:(id)a3;
- (void)setDescriptionTextAlignment:(int64_t)a3;
- (void)setDescriptionTextColor:(id)a3;
- (void)setDescriptionTextHighlightColor:(id)a3;
- (void)setDescriptionTextView:(id)a3;
- (void)setDisableFocus:(BOOL)a3;
- (void)setFloatingView:(id)a3;
- (void)setFocusSizeIncrease:(unint64_t)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHighlightBackgroundColor:(id)a3;
- (void)setMaximumNumberOfLines:(unint64_t)a3;
- (void)setMoreHighlightPadding:(double)a3;
- (void)setMoreHorizontalMargin:(double)a3;
- (void)setMoreLabel:(id)a3;
- (void)setMoreLabelOnNewLine:(BOOL)a3;
- (void)setMoreLabelTextColor:(id)a3;
- (void)setNeedsTextSizeComputation:(BOOL)a3;
- (void)setPadding:(UIEdgeInsets)a3;
- (void)setPlayHandler:(id)a3;
- (void)setPlayRecognizer:(id)a3;
- (void)setSelectRecognizer:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)setSelectionHandler:(id)a3;
- (void)setTrackHorizontal:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation TVFocusableTextView

- (TVFocusableTextView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v48.receiver = self;
  v48.super_class = (Class)TVFocusableTextView;
  v7 = -[TVFocusableTextView initWithFrame:](&v48, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    v7->_disableFocus = 0;
    v7->_alwaysShowBackground = 0;
    v7->_moreHighlightPadding = 14.0;
    v7->_moreHorizontalMargin = 6.0;
    long long v9 = *(_OWORD *)(MEMORY[0x263F1D1C0] + 16);
    *(_OWORD *)&v7->_padding.top = *MEMORY[0x263F1D1C0];
    *(_OWORD *)&v7->_padding.bottom = v9;
    v10 = [MEMORY[0x263F1C550] clearColor];
    v47.receiver = v8;
    v47.super_class = (Class)TVFocusableTextView;
    [(TVFocusableTextView *)&v47 setBackgroundColor:v10];

    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1CC98]), "initWithFrame:", x, y, width, height);
    floatingView = v8->_floatingView;
    v8->_floatingView = (_UIFloatingContentView *)v11;

    [(_UIFloatingContentView *)v8->_floatingView setBackgroundColor:0 forState:0];
    [(_UIFloatingContentView *)v8->_floatingView setBackgroundColor:0 forState:8];
    [(_UIFloatingContentView *)v8->_floatingView setBackgroundColor:0 forState:1];
    [(_UIFloatingContentView *)v8->_floatingView setBackgroundColor:0 forState:4];
    [(_UIFloatingContentView *)v8->_floatingView setFloatingContentDelegate:v8];
    -[_UIFloatingContentView setContentMotionRotation:translation:](v8->_floatingView, "setContentMotionRotation:translation:", 0.0, 0.04, 0.0, 4.0);
    [(_UIFloatingContentView *)v8->_floatingView setFocusedSizeIncrease:20.0];
    v13 = v8->_floatingView;
    [(id)objc_opt_class() cornerRadius];
    -[_UIFloatingContentView setCornerRadius:](v13, "setCornerRadius:");
    [(TVFocusableTextView *)v8 addSubview:v8->_floatingView];
    uint64_t v14 = __37__TVFocusableTextView_initWithFrame___block_invoke();
    auxilliaryTextView = v8->_auxilliaryTextView;
    v8->_auxilliaryTextView = (UITextView *)v14;

    v8->_descriptionTextAlignment = 4;
    uint64_t v16 = __37__TVFocusableTextView_initWithFrame___block_invoke();
    descriptionTextView = v8->_descriptionTextView;
    v8->_descriptionTextView = (UITextView *)v16;

    v18 = [(_UIFloatingContentView *)v8->_floatingView contentView];
    [v18 addSubview:v8->_descriptionTextView];

    id v19 = objc_alloc(MEMORY[0x263F1C768]);
    uint64_t v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    moreLabel = v8->_moreLabel;
    v8->_moreLabel = (UILabel *)v20;

    v22 = v8->_moreLabel;
    v23 = _TVMLLocString(@"TVDescriptionMore", @"Localizable");
    v24 = [v23 localizedUppercaseString];
    [(UILabel *)v22 setText:v24];

    v25 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F1D2B8]];
    v26 = [v25 fontDescriptor];
    v27 = [v26 fontAttributes];
    v28 = (void *)[v27 mutableCopy];

    uint64_t v29 = *MEMORY[0x263F1D210];
    v30 = [v28 objectForKey:*MEMORY[0x263F1D210]];
    v31 = (void *)[v30 mutableCopy];

    if (!v31)
    {
      v31 = [MEMORY[0x263EFF9A0] dictionary];
    }
    v32 = [NSNumber numberWithDouble:*MEMORY[0x263F1D340]];
    [v31 setObject:v32 forKey:*MEMORY[0x263F1D350]];

    [v28 setObject:v31 forKey:v29];
    v33 = (void *)[objc_alloc(MEMORY[0x263F1C660]) initWithFontAttributes:v28];
    v34 = (void *)MEMORY[0x263F1C658];
    [v25 pointSize];
    v35 = objc_msgSend(v34, "fontWithDescriptor:size:", v33);
    [(UILabel *)v8->_moreLabel setFont:v35];
    [(UILabel *)v8->_moreLabel _setWantsUnderlineForAccessibilityButtonShapesEnabled:1];
    v36 = v8->_moreLabel;
    v37 = _TVMLLocString(@"TVDescriptionMore", @"Localizable");
    [(UILabel *)v36 setText:v37];

    v38 = v8->_moreLabel;
    v39 = [MEMORY[0x263F1C658] preferredFontForTextStyle:*MEMORY[0x263F03D40]];
    [(UILabel *)v38 setFont:v39];

    [(UILabel *)v8->_moreLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v8->_moreLabel sizeToFit];
    v40 = [(_UIFloatingContentView *)v8->_floatingView contentView];
    [v40 addSubview:v8->_moreLabel];

    v41 = v8->_moreLabel;
    [(TVFocusableTextView *)v8 _moreLabelFrame];
    -[UILabel setFrame:](v41, "setFrame:");
    uint64_t v42 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v8 action:sel__selectButtonAction_];
    moreLabelTapGestureRecognizer = v8->_moreLabelTapGestureRecognizer;
    v8->_moreLabelTapGestureRecognizer = (UITapGestureRecognizer *)v42;

    [(UILabel *)v8->_moreLabel addGestureRecognizer:v8->_moreLabelTapGestureRecognizer];
    [(UILabel *)v8->_moreLabel setUserInteractionEnabled:1];
    uint64_t v44 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v8 action:sel__playButtonAction_];
    playRecognizer = v8->_playRecognizer;
    v8->_playRecognizer = (UITapGestureRecognizer *)v44;

    [(UITapGestureRecognizer *)v8->_playRecognizer setAllowedPressTypes:&unk_26E59EAE8];
    [(UITapGestureRecognizer *)v8->_playRecognizer setDelegate:v8];
    [(TVFocusableTextView *)v8 addGestureRecognizer:v8->_playRecognizer];
  }
  return v8;
}

id __37__TVFocusableTextView_initWithFrame___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F1CAC8]);
  v1 = objc_msgSend(v0, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v1 setBackgroundColor:0];
  objc_msgSend(v1, "setTextContainerInset:", 0.0, -5.0, 0.0, -5.0);
  [v1 setScrollEnabled:0];
  [v1 setEditable:0];
  [v1 setUserInteractionEnabled:0];
  [v1 setAdjustsFontForContentSizeCategory:1];
  [v1 setSelectable:0];
  v2 = [v1 layer];
  [v2 setCornerRadius:0.0];

  v3 = [v1 textContainer];
  [v3 setMaximumNumberOfLines:0];

  v4 = [v1 textContainer];
  [v4 setLineBreakMode:4];

  return v1;
}

- (void)setDescriptionTextColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_descriptionTextColor = &self->_descriptionTextColor;
  if (self->_descriptionTextColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_descriptionTextColor, a3);
    p_descriptionTextColor = (UIColor **)[(TVFocusableTextView *)self setNeedsLayout];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_descriptionTextColor, v5);
}

- (void)setDescriptionTextHighlightColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_descriptionTextHighlightColor = &self->_descriptionTextHighlightColor;
  if (self->_descriptionTextHighlightColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_descriptionTextHighlightColor, a3);
    p_descriptionTextHighlightColor = (UIColor **)[(TVFocusableTextView *)self setNeedsLayout];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_descriptionTextHighlightColor, v5);
}

- (void)setDescriptionTextAlignment:(int64_t)a3
{
  if (self->_descriptionTextAlignment != a3)
  {
    self->_descriptionTextAlignment = a3;
    [(TVFocusableTextView *)self setNeedsLayout];
  }
}

- (void)setBackgroundColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_backgroundColor = &self->_backgroundColor;
  if (self->_backgroundColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_backgroundColor, a3);
    p_backgroundColor = (UIColor **)[(TVFocusableTextView *)self setNeedsLayout];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_backgroundColor, v5);
}

- (void)setHighlightBackgroundColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_highlightBackgroundColor = &self->_highlightBackgroundColor;
  if (self->_highlightBackgroundColor != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_highlightBackgroundColor, a3);
    p_highlightBackgroundColor = (UIColor **)[(TVFocusableTextView *)self setNeedsLayout];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_highlightBackgroundColor, v5);
}

- (void)setFocusSizeIncrease:(unint64_t)a3
{
  if (self->_focusSizeIncrease != a3)
  {
    self->_focusSizeIncrease = a3;
    [(_UIFloatingContentView *)self->_floatingView setFocusedSizeIncrease:(double)a3];
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
    -[UITextView setTextContainerInset:](self->_descriptionTextView, "setTextContainerInset:");
    [(TVFocusableTextView *)self setNeedsLayout];
  }
}

- (void)setAlwaysShowBackground:(BOOL)a3
{
  if (self->_alwaysShowBackground != a3)
  {
    self->_alwaysShowBackground = a3;
    [(TVFocusableTextView *)self setNeedsLayout];
  }
}

- (void)_updateBackgroundColors
{
  p_backgroundColor = &self->_backgroundColor;
  backgroundColor = self->_backgroundColor;
  if (self->_alwaysShowBackground)
  {
    v5 = backgroundColor;
    backgroundColor = self->_highlightBackgroundColor;
    if (backgroundColor) {
      goto LABEL_7;
    }
  }
  else
  {
    v5 = 0;
    if (backgroundColor) {
      goto LABEL_7;
    }
    p_backgroundColor = &self->_highlightBackgroundColor;
  }
  backgroundColor = *p_backgroundColor;
LABEL_7:
  long long v9 = backgroundColor;
  [(_UIFloatingContentView *)self->_floatingView setBackgroundColor:v5 forState:0];
  [(_UIFloatingContentView *)self->_floatingView setBackgroundColor:v9 forState:8];
  [(_UIFloatingContentView *)self->_floatingView setBackgroundColor:v9 forState:1];
  backgroundView = self->_backgroundView;
  if (self->_highlightBackgroundColor)
  {
    [(UIVisualEffectView *)self->_backgroundView removeFromSuperview];
  }
  else
  {
    double v7 = 1.0;
    if (!self->_alwaysShowBackground) {
      [(UIVisualEffectView *)self->_backgroundView alpha];
    }
    [(UIVisualEffectView *)backgroundView setAlpha:v7];
    v8 = [(_UIFloatingContentView *)self->_floatingView visualEffectContainerView];
    [v8 addSubview:self->_backgroundView];
  }
}

- (void)_updateTextColorsIfNeeded
{
  unint64_t v3 = ([(_UIFloatingContentView *)self->_floatingView controlState] >> 3) & 1;
  [(TVFocusableTextView *)self _updateTextColorsForFocusState:v3];
}

- (void)_updateTextColorsForFocusState:(BOOL)a3
{
  if (self->_descriptionTextColor && self->_descriptionTextHighlightColor)
  {
    if (a3) {
      descriptionTextHighlightColor = self->_descriptionTextHighlightColor;
    }
    else {
      descriptionTextHighlightColor = self->_descriptionTextColor;
    }
    v5 = [(TVFocusableTextView *)self _accessibilityHigherContrastTintColorForColor:descriptionTextHighlightColor];
    [(UITextView *)self->_descriptionTextView setTextColor:v5];
  }
  if (self->_moreLabelTextColor)
  {
    moreLabel = self->_moreLabel;
    -[UILabel setTextColor:](moreLabel, "setTextColor:");
  }
  else
  {
    double v7 = [(TVFocusableTextView *)self descriptionText];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      long long v9 = [(TVFocusableTextView *)self descriptionText];
      v10 = [v9 attributesAtIndex:0 effectiveRange:0];
      id v15 = (id)[v10 mutableCopy];

      uint64_t v11 = [v15 objectForKeyedSubscript:*MEMORY[0x263F1C240]];
      v12 = v11;
      if (v11)
      {
        v13 = self->_moreLabel;
        uint64_t v14 = [v11 colorWithAlphaComponent:0.5];
        [(UILabel *)v13 setTextColor:v14];
      }
    }
  }
}

- (void)layoutSubviews
{
  v22[1] = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)TVFocusableTextView;
  [(TVFocusableTextView *)&v21 layoutSubviews];
  [(TVFocusableTextView *)self bounds];
  if (v3 == 0.0 || (CGFloat v5 = v4, v4 == 0.0))
  {
    double v14 = *MEMORY[0x263F001A8];
    double v15 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v16 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v17 = *(double *)(MEMORY[0x263F001A8] + 24);
    -[UITextView setFrame:](self->_descriptionTextView, "setFrame:", *MEMORY[0x263F001A8], v15, v16, v17);
    -[_UIFloatingContentView setFrame:](self->_floatingView, "setFrame:", v14, v15, v16, v17);
    -[UIVisualEffectView setFrame:](self->_backgroundView, "setFrame:", v14, v15, v16, v17);
    -[UILabel setFrame:](self->_moreLabel, "setFrame:", v14, v15, v16, v17);
  }
  else
  {
    CGFloat v6 = v3;
    double moreHighlightPadding = self->_moreHighlightPadding;
    -[UITextView setFrame:](self->_descriptionTextView, "setFrame:", moreHighlightPadding, moreHighlightPadding + -6.0);
    double v8 = -self->_moreHighlightPadding;
    v23.origin.double x = moreHighlightPadding;
    v23.origin.double y = moreHighlightPadding + -6.0;
    v23.size.double width = v6;
    v23.size.double height = v5;
    CGFloat v9 = CGRectGetWidth(v23) + self->_moreHighlightPadding * 2.0;
    v24.origin.double x = moreHighlightPadding;
    v24.origin.double y = moreHighlightPadding + -6.0;
    v24.size.double width = v6;
    v24.size.double height = v5;
    double v10 = moreHighlightPadding + -6.0 + moreHighlightPadding + -3.0 + CGRectGetHeight(v24);
    -[_UIFloatingContentView setFrame:](self->_floatingView, "setFrame:", v8, -(moreHighlightPadding + -6.0), v9, v10);
    -[UIVisualEffectView setFrame:](self->_backgroundView, "setFrame:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v9, v10);
    [(UITextView *)self->_descriptionTextView setTextAlignment:self->_descriptionTextAlignment];
    uint64_t v11 = [(_UIFloatingContentView *)self->_floatingView contentView];
    [v11 addSubview:self->_moreLabel];

    moreLabel = self->_moreLabel;
    [(TVFocusableTextView *)self _moreLabelFrame];
    -[UILabel setFrame:](moreLabel, "setFrame:");
    [(TVFocusableTextView *)self _recomputeTextSizeIfNeeded];
    if (self->_textTruncating && !self->_disableFocus)
    {
      [(UILabel *)self->_moreLabel setHidden:0];
      [(TVFocusableTextView *)self _moreLabelExclusionPathFrame];
      v18 = (void *)MEMORY[0x263F1C478];
      CGRect v26 = CGRectIntegral(v25);
      v13 = objc_msgSend(v18, "bezierPathWithRect:", v26.origin.x, v26.origin.y, v26.size.width, v26.size.height);
      id v19 = [(UITextView *)self->_descriptionTextView textContainer];
      v22[0] = v13;
      uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:1];
      [v19 setExclusionPaths:v20];
    }
    else
    {
      [(UILabel *)self->_moreLabel setHidden:1];
      v13 = [(UITextView *)self->_descriptionTextView textContainer];
      [v13 setExclusionPaths:MEMORY[0x263EFFA68]];
    }

    [(TVFocusableTextView *)self _updateTextColorsIfNeeded];
    [(TVFocusableTextView *)self _updateBackgroundColors];
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  if (a5)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __69__TVFocusableTextView_setSelected_animated_withAnimationCoordinator___block_invoke;
    v6[3] = &unk_264BA6B48;
    v6[4] = self;
    BOOL v7 = a3;
    BOOL v8 = a4;
    [a5 addCoordinatedAnimations:v6 completion:0];
  }
  else
  {
    [(TVFocusableTextView *)self setSelected:a3 animated:a4];
  }
}

uint64_t __69__TVFocusableTextView_setSelected_animated_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelected:*(unsigned __int8 *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 41)];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  uint64_t v5 = [a3 nextFocusedView];
  uint64_t v6 = [v5 isDescendantOfView:self];

  [(TVFocusableTextView *)self _updateTextColorsForFocusState:v6];
}

- (BOOL)canBecomeFocused
{
  if ([(TVFocusableTextView *)self disableFocus]) {
    return 0;
  }
  double v3 = [(UITextView *)self->_descriptionTextView attributedText];
  uint64_t v4 = [v3 length];

  if (!v4) {
    return 0;
  }
  if ([(TVFocusableTextView *)self isAlwaysFocusable]) {
    return 1;
  }
  return [(TVFocusableTextView *)self isTextTruncating];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v6 = [(TVFocusableTextView *)self maximumNumberOfLines];
  BOOL v7 = [(UITextView *)self->_auxilliaryTextView textContainer];
  [v7 setMaximumNumberOfLines:v6];

  -[UITextView sizeThatFits:](self->_auxilliaryTextView, "sizeThatFits:", width, height);
  double v9 = v8;
  double v11 = v10;
  if (v6)
  {
    if (self->_moreLabelOnNewLine)
    {
      v12 = [(UITextView *)self->_auxilliaryTextView textContainer];
      [v12 setMaximumNumberOfLines:0];

      -[UITextView sizeThatFits:](self->_auxilliaryTextView, "sizeThatFits:", width, height);
      if (v13 > v11)
      {
        -[UILabel sizeThatFits:](self->_moreLabel, "sizeThatFits:", width, height);
        double v11 = v11 + v14;
      }
    }
  }
  if (width == 0.0) {
    double v15 = v9;
  }
  else {
    double v15 = width;
  }
  double v16 = v11;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (CGSize)intrinsicContentSize
{
  [(TVFocusableTextView *)self bounds];
  double Width = CGRectGetWidth(v8);
  -[TVFocusableTextView sizeThatFits:](self, "sizeThatFits:", Width, 0.0);
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
  [(TVFocusableTextView *)self _setNeedsTextSizeComputation];
  v8.receiver = self;
  v8.super_class = (Class)TVFocusableTextView;
  -[TVFocusableTextView setFrame:](&v8, sel_setFrame_, x, y, width, height);
}

+ (double)cornerRadius
{
  return 5.0;
}

- (void)setDescriptionText:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    unint64_t v6 = (void *)[v4 mutableCopy];
    uint64_t v7 = *MEMORY[0x263F1C268];
    uint64_t v8 = [v5 length];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __42__TVFocusableTextView_setDescriptionText___block_invoke;
    v23[3] = &unk_264BA6B70;
    id v9 = v6;
    id v24 = v9;
    objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v7, 0, v8, 0, v23);
    if (UIAccessibilityDarkerSystemColorsEnabled())
    {
      objc_initWeak(&location, self);
      uint64_t v10 = [v5 length];
      uint64_t v11 = *MEMORY[0x263F1C240];
      uint64_t v16 = MEMORY[0x263EF8330];
      uint64_t v17 = 3221225472;
      v18 = __42__TVFocusableTextView_setDescriptionText___block_invoke_2;
      id v19 = &unk_264BA6B98;
      objc_copyWeak(&v21, &location);
      id v20 = v9;
      objc_msgSend(v5, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v10, 0, &v16);

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    objc_msgSend(v9, "tv_addLanguageAwareness:", 0, v16, v17, v18, v19);
    descriptionTextView = self->_descriptionTextView;
    double v13 = (void *)[v9 copy];
    [(UITextView *)descriptionTextView setAttributedText:v13];

    auxilliaryTextView = self->_auxilliaryTextView;
    double v15 = (void *)[v9 copy];
    [(UITextView *)auxilliaryTextView setAttributedText:v15];

    [(TVFocusableTextView *)self _setNeedsTextSizeComputation];
    [(TVFocusableTextView *)self setNeedsLayout];
  }
}

uint64_t __42__TVFocusableTextView_setDescriptionText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v17 = a2;
  objc_opt_class();
  uint64_t isKindOfClass = objc_opt_isKindOfClass();
  id v8 = v17;
  if (isKindOfClass)
  {
    id v9 = (void *)[v17 mutableCopy];
    uint64_t v10 = v9;
    if (v9) {
      id v11 = v9;
    }
    else {
      id v11 = objc_alloc_init(MEMORY[0x263F1C350]);
    }
    v12 = v11;

    [v12 setLineBreakMode:0];
    [v12 setAlignment:4];
    uint64_t v13 = *MEMORY[0x263F1C268];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x263F1C268], a3, a4);
    double v14 = *(void **)(a1 + 32);
    double v15 = (void *)[v12 copy];
    objc_msgSend(v14, "addAttribute:value:range:", v13, v15, a3, a4);

    id v8 = v17;
  }
  return MEMORY[0x270F9A758](isKindOfClass, v8);
}

void __42__TVFocusableTextView_setDescriptionText___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v11 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v11;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = [WeakRetained _accessibilityHigherContrastTintColorForColor:v7];

    uint64_t v10 = *MEMORY[0x263F1C240];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x263F1C240], a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v10, v9, a3, a4);
  }
}

- (NSAttributedString)descriptionText
{
  return [(UITextView *)self->_descriptionTextView attributedText];
}

- (void)setMaximumNumberOfLines:(unint64_t)a3
{
  double v5 = [(UITextView *)self->_descriptionTextView textContainer];
  [v5 setMaximumNumberOfLines:a3];

  [(TVFocusableTextView *)self _setNeedsTextSizeComputation];
  [(TVFocusableTextView *)self setNeedsLayout];
}

- (unint64_t)maximumNumberOfLines
{
  v2 = [(UITextView *)self->_descriptionTextView textContainer];
  unint64_t v3 = [v2 maximumNumberOfLines];

  return v3;
}

- (void)setTrackHorizontal:(BOOL)a3
{
  self->_trackHorizontal = a3;
  floatingView = self->_floatingView;
  if (a3)
  {
    double v4 = 0.04;
    double v5 = 4.0;
  }
  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
  }
  -[_UIFloatingContentView setContentMotionRotation:translation:](floatingView, "setContentMotionRotation:translation:", v4, 0.04, v5, 4.0);
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
    [(UITextView *)self->_descriptionTextView bounds];
    double v4 = v3;
    double v5 = [(UITextView *)self->_auxilliaryTextView textContainer];
    objc_msgSend(v5, "setMaximumNumberOfLines:", -[TVFocusableTextView maximumNumberOfLines](self, "maximumNumberOfLines"));

    -[UITextView sizeThatFits:](self->_auxilliaryTextView, "sizeThatFits:", v4, 0.0);
    double v7 = v6;
    id v8 = [(UITextView *)self->_auxilliaryTextView textContainer];
    [v8 setMaximumNumberOfLines:0];

    -[UITextView sizeThatFits:](self->_auxilliaryTextView, "sizeThatFits:", v4, 0.0);
    self->_textTruncating = v9 > v7;
    [(TVFocusableTextView *)self setNeedsFocusUpdate];
  }
}

- (CGRect)_moreLabelExclusionPathFrame
{
  [(UITextView *)self->_descriptionTextView textContainerInset];
  double v4 = v3;
  double v6 = v5;
  [(TVFocusableTextView *)self _moreLabelFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  [(TVFocusableTextView *)self moreHorizontalMargin];
  double v16 = v15;
  if (self->_moreLabelOnNewLine)
  {
    [(UITextView *)self->_descriptionTextView frame];
    double v12 = v17 - v4 - v6;
  }
  double v18 = v8 - v16;
  double v19 = v16 + v12;
  double v20 = v10;
  double v21 = v14;
  result.size.double height = v21;
  result.size.double width = v19;
  result.origin.double y = v20;
  result.origin.double x = v18;
  return result;
}

- (CGRect)_moreLabelFrame
{
  double v3 = [(UITextView *)self->_descriptionTextView text];
  int v4 = [v3 _isNaturallyRTL];

  [(_UIFloatingContentView *)self->_floatingView bounds];
  CGFloat v6 = v5;
  CGFloat rect = v7;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(UITextView *)self->_descriptionTextView frame];
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v55 = v18;
  -[UILabel sizeThatFits:](self->_moreLabel, "sizeThatFits:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  double v20 = v19;
  CGFloat v22 = v21;
  if (self->_moreLabelOnNewLine)
  {
    if (v4)
    {
      v57.origin.double x = v6;
      v57.origin.double y = rect;
      v57.size.double width = v9;
      v57.size.double height = v11;
      double MaxX = CGRectGetMaxX(v57);
      v58.origin.double x = 0.0;
      v58.origin.double y = 0.0;
      v58.size.double width = v20;
      v58.size.double height = v22;
      double moreHighlightPadding = MaxX - CGRectGetWidth(v58) - self->_moreHighlightPadding;
    }
    else
    {
      double moreHighlightPadding = self->_moreHighlightPadding;
    }
  }
  else
  {
    double moreHighlightPadding = 4.0;
    if ((v4 & 1) == 0)
    {
      v59.origin.double x = v13;
      v59.origin.double y = v15;
      v59.size.double width = v17;
      v59.size.double height = v55;
      double v25 = CGRectGetMaxX(v59);
      v60.origin.double x = 0.0;
      v60.origin.double y = 0.0;
      v60.size.double width = v20;
      v60.size.double height = v22;
      double moreHighlightPadding = v25 - CGRectGetWidth(v60) + -4.0;
    }
    v61.origin.double y = 0.0;
    v61.origin.double x = moreHighlightPadding;
    v61.size.double width = v20;
    v61.size.double height = v22;
    double Width = CGRectGetWidth(v61);
    double v20 = v20 + 4.0;
    if (v4)
    {
      double v27 = Width;
      v62.origin.double y = 0.0;
      v62.origin.double x = moreHighlightPadding;
      v62.size.double width = v20;
      v62.size.double height = v22;
      double moreHighlightPadding = moreHighlightPadding + v27 - CGRectGetWidth(v62);
    }
  }
  v28 = [(UITextView *)self->_descriptionTextView attributedText];
  v63.origin.double x = v13;
  v63.origin.double y = v15;
  v63.size.double width = v17;
  v63.size.double height = v55;
  double MaxY = CGRectGetMaxY(v63);
  if ([v28 length])
  {
    v56[0] = 0;
    v56[1] = [v28 length];
    v30 = [v28 attributesAtIndex:0 effectiveRange:v56];
    v31 = [v30 objectForKeyedSubscript:*MEMORY[0x263F1C238]];
    [v31 descender];
    double v33 = v32;
    [v31 leading];
    double v34 = v20;
    double v36 = v33 - v35 * 0.5;
    v37 = [(UILabel *)self->_moreLabel font];
    [v37 descender];
    double v39 = v38;
    v40 = [(UILabel *)self->_moreLabel font];
    [v40 leading];
    double v42 = v36 - (v39 - v41 * 0.5);
    double v20 = v34;
    double MaxY = MaxY + v42;
  }
  v64.origin.double y = 0.0;
  v64.origin.double x = moreHighlightPadding;
  v64.size.double width = v20;
  v64.size.double height = v22;
  double Height = CGRectGetHeight(v64);
  if (v4)
  {
    if (self->_moreLabelOnNewLine) {
      double left = -self->_padding.right;
    }
    else {
      double left = self->_padding.left;
    }
    double v46 = moreHighlightPadding + left;
  }
  else
  {
    if (self->_moreLabelOnNewLine) {
      double right = -self->_padding.left;
    }
    else {
      double right = self->_padding.right;
    }
    double v46 = moreHighlightPadding - right;
  }
  float v47 = MaxY - Height;
  double v48 = floorf(v47);
  if (self->_moreLabelOnNewLine) {
    double v48 = v48 + -3.0;
  }
  double v49 = v48 - self->_padding.bottom;

  double v50 = v46;
  double v51 = v49;
  double v52 = v20;
  double v53 = v22;
  result.size.double height = v53;
  result.size.double width = v52;
  result.origin.double y = v51;
  result.origin.double x = v50;
  return result;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [v6 anyObject];
  uint64_t v9 = [v8 type];

  if ((v9 & 0xFFFFFFFFFFFFFFFDLL) == 4 && [(TVFocusableTextView *)self isFocused])
  {
    [(_UIFloatingContentView *)self->_floatingView setControlState:9 animated:1];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TVFocusableTextView;
    [(TVFocusableTextView *)&v10 pressesBegan:v6 withEvent:v7];
  }
}

- (void)tintColorDidChange
{
  v4.receiver = self;
  v4.super_class = (Class)TVFocusableTextView;
  [(TVFocusableTextView *)&v4 tintColorDidChange];
  if ([(TVFocusableTextView *)self tintAdjustmentMode] == 2) {
    [MEMORY[0x263F1C550] systemMidGrayColor];
  }
  else {
  double v3 = [(TVFocusableTextView *)self moreLabelTextColor];
  }
  [(UILabel *)self->_moreLabel setTextColor:v3];
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(TVFocusableTextView *)self playRecognizer];

  if (v5 != v4) {
    return 1;
  }
  id v7 = [(TVFocusableTextView *)self playHandler];
  BOOL v6 = v7 != 0;

  return v6;
}

- (void)floatingContentView:(id)a3 isTransitioningFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  BOOL v6 = !self->_alwaysShowBackground;
  backgroundView = self->_backgroundView;
  BOOL v6 = v6 && (a5 & 8) == 0;
  double v7 = 1.0;
  if (v6) {
    double v7 = 0.0;
  }
  -[UIVisualEffectView setAlpha:](backgroundView, "setAlpha:", a3, a4, v7);
}

- (void)_selectButtonAction:(id)a3
{
  selectionHandler = (void (**)(id, id))self->_selectionHandler;
  if (selectionHandler) {
    selectionHandler[2](selectionHandler, a3);
  }
}

- (void)_playButtonAction:(id)a3
{
  playHandler = (void (**)(id, id))self->_playHandler;
  if (playHandler) {
    playHandler[2](playHandler, a3);
  }
}

- (UIColor)descriptionTextColor
{
  return self->_descriptionTextColor;
}

- (UIColor)descriptionTextHighlightColor
{
  return self->_descriptionTextHighlightColor;
}

- (int64_t)descriptionTextAlignment
{
  return self->_descriptionTextAlignment;
}

- (UIColor)highlightBackgroundColor
{
  return self->_highlightBackgroundColor;
}

- (BOOL)isTextTruncating
{
  return self->_textTruncating;
}

- (double)moreHighlightPadding
{
  return self->_moreHighlightPadding;
}

- (void)setMoreHighlightPadding:(double)a3
{
  self->_double moreHighlightPadding = a3;
}

- (double)moreHorizontalMargin
{
  return self->_moreHorizontalMargin;
}

- (void)setMoreHorizontalMargin:(double)a3
{
  self->_moreHorizontalMargin = a3;
}

- (BOOL)moreLabelOnNewLine
{
  return self->_moreLabelOnNewLine;
}

- (void)setMoreLabelOnNewLine:(BOOL)a3
{
  self->_moreLabelOnNewLine = a3;
}

- (UIColor)moreLabelTextColor
{
  return self->_moreLabelTextColor;
}

- (void)setMoreLabelTextColor:(id)a3
{
}

- (BOOL)trackHorizontal
{
  return self->_trackHorizontal;
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

- (BOOL)alwaysShowBackground
{
  return self->_alwaysShowBackground;
}

- (unint64_t)focusSizeIncrease
{
  return self->_focusSizeIncrease;
}

- (BOOL)isAlwaysFocusable
{
  return self->_alwaysFocusable;
}

- (void)setAlwaysFocusable:(BOOL)a3
{
  self->_alwaysFocusable = a3;
}

- (BOOL)disableFocus
{
  return self->_disableFocus;
}

- (void)setDisableFocus:(BOOL)a3
{
  self->_disableFocus = a3;
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
}

- (id)playHandler
{
  return self->_playHandler;
}

- (void)setPlayHandler:(id)a3
{
}

- (UITextView)descriptionTextView
{
  return self->_descriptionTextView;
}

- (void)setDescriptionTextView:(id)a3
{
}

- (_UIFloatingContentView)floatingView
{
  return self->_floatingView;
}

- (void)setFloatingView:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UITapGestureRecognizer)selectRecognizer
{
  return self->_selectRecognizer;
}

- (void)setSelectRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)playRecognizer
{
  return self->_playRecognizer;
}

- (void)setPlayRecognizer:(id)a3
{
}

- (UILabel)moreLabel
{
  return self->_moreLabel;
}

- (void)setMoreLabel:(id)a3
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreLabelTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_moreLabel, 0);
  objc_storeStrong((id *)&self->_playRecognizer, 0);
  objc_storeStrong((id *)&self->_selectRecognizer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_floatingView, 0);
  objc_storeStrong((id *)&self->_descriptionTextView, 0);
  objc_storeStrong(&self->_playHandler, 0);
  objc_storeStrong(&self->_selectionHandler, 0);
  objc_storeStrong((id *)&self->_moreLabelTextColor, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundColor, 0);
  objc_storeStrong((id *)&self->_descriptionTextHighlightColor, 0);
  objc_storeStrong((id *)&self->_descriptionTextColor, 0);
  objc_storeStrong((id *)&self->_auxilliaryTextView, 0);
  objc_storeStrong((id *)&self->_vibrantEffectView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end