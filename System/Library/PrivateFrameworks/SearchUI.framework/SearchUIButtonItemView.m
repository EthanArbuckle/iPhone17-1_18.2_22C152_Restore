@interface SearchUIButtonItemView
- (BOOL)allowsAnimation;
- (BOOL)drawsBackgroundPlatter;
- (BOOL)drawsIconBackgroundPlatter;
- (BOOL)drawsTitle;
- (BOOL)isCompact;
- (BOOL)shouldAvoidBackgroundView;
- (BOOL)useContinuousCorners;
- (BOOL)useHierarchicalColorRendering;
- (CGSize)iconBackgroundViewSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)buttonTitle;
- (NUIContainerBoxView)buttonContentBoxView;
- (NUIContainerBoxView)iconBoxView;
- (NUIContainerStackView)imageViewAndLabelStackView;
- (SFButtonItemAppearance)buttonAppearance;
- (SFImage)sfImage;
- (SearchUIButtonBackgroundView)backgroundView;
- (SearchUIButtonBackgroundView)iconBackgroundView;
- (SearchUIButtonItemView)init;
- (SearchUIButtonItemViewDelegate)delegate;
- (SearchUICommandHandler)commandHandler;
- (SearchUIImageView)iconView;
- (SearchUIImageView)transitionIconView;
- (TLKLabel)tlkTitleLabel;
- (UIContextMenuInteraction)contextPreviewInteraction;
- (UIFont)buttonFont;
- (UIFont)defaultButtonFont;
- (UIFont)iconFont;
- (UIViewPropertyAnimator)selectionAnimator;
- (double)buttonAnimationOutDelay;
- (double)cornerRadius;
- (double)effectiveBaselineOffsetFromBottom;
- (double)effectiveFirstBaselineOffsetFromTop;
- (double)horizontalPadding;
- (double)minimumIconPadding;
- (double)spacingBetweenImageAndText;
- (double)verticalPaddingFontMultipler;
- (id)accessibilityIdentifier;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)createContentView;
- (id)resolvedButtonFont;
- (id)resolvedIconFont;
- (int64_t)symbolScale;
- (void)animateIconInToSFImage:(id)a3;
- (void)animateIconOutToSFImage:(id)a3;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAllowsAnimation:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setButtonAppearance:(id)a3;
- (void)setButtonContentBoxView:(id)a3;
- (void)setButtonFont:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setCommandHandler:(id)a3;
- (void)setContextPreviewInteraction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setIconBackgroundView:(id)a3;
- (void)setIconBoxView:(id)a3;
- (void)setIconFont:(id)a3;
- (void)setIconView:(id)a3;
- (void)setImageViewAndLabelStackView:(id)a3;
- (void)setIsCompact:(BOOL)a3;
- (void)setSelectionAnimator:(id)a3;
- (void)setSfImage:(id)a3;
- (void)setSfImage:(id)a3 animateTransition:(BOOL)a4;
- (void)setTlkTitleLabel:(id)a3;
- (void)setTransitionIconView:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionIconToSFImage:(id)a3;
- (void)updateFonts;
- (void)updateProminences;
@end

@implementation SearchUIButtonItemView

- (SearchUIButtonItemView)init
{
  v3 = [(id)objc_opt_class() buttonWithType:1];

  if (v3)
  {
    v4 = [(SearchUIButtonItemView *)v3 createContentView];
    [(SearchUIButtonItemView *)v3 setButtonContentBoxView:v4];

    v5 = [(SearchUIButtonItemView *)v3 buttonContentBoxView];
    [v5 setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];

    [(SearchUIButtonItemView *)v3 setAllowsAnimation:1];
    v6 = objc_opt_new();
    [(SearchUIButtonItemView *)v3 setImage:v6 forState:0];

    v7 = [(SearchUIButtonItemView *)v3 imageView];
    v8 = [(SearchUIButtonItemView *)v3 buttonContentBoxView];
    [v7 addSubview:v8];

    v9 = [(SearchUIButtonItemView *)v3 imageView];
    v10 = [v9 layer];
    [v10 setAllowsGroupOpacity:0];

    v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:v3];
    [(SearchUIButtonItemView *)v3 setContextPreviewInteraction:v11];
    [(SearchUIButtonItemView *)v3 addInteraction:v11];
    v12 = [(SearchUIButtonItemView *)v3 layer];
    [v12 setAllowsGroupOpacity:0];

    v13 = [(SearchUIButtonItemView *)v3 buttonContentBoxView];
    +[SearchUIAutoLayout fillContainerWithView:v13];
  }
  return v3;
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)SearchUIButtonItemView;
  [(SearchUIButtonItemView *)&v20 layoutSubviews];
  [(SearchUIButtonItemView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(SearchUIButtonItemView *)self imageView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(SearchUIButtonItemView *)self backgroundView];
  [(SearchUIButtonItemView *)self cornerRadius];
  double v14 = v13;
  BOOL v15 = [(SearchUIButtonItemView *)self useContinuousCorners];
  uint64_t v16 = *MEMORY[0x1E4F39EA0];
  if (v15) {
    uint64_t v17 = *MEMORY[0x1E4F39EA8];
  }
  else {
    uint64_t v17 = *MEMORY[0x1E4F39EA0];
  }
  objc_msgSend(v12, "tlks_setCornerRadius:withStyle:", v17, v14);

  v18 = [(SearchUIButtonItemView *)self iconBackgroundView];
  [(SearchUIButtonItemView *)self iconBackgroundViewSize];
  objc_msgSend(v18, "tlks_setCornerRadius:withStyle:", v16, v19 * 0.5);
}

- (id)createContentView
{
  v38[2] = *MEMORY[0x1E4F143B8];
  if ([(SearchUIButtonItemView *)self drawsBackgroundPlatter])
  {
    double v3 = objc_opt_new();
    [(SearchUIButtonItemView *)self setBackgroundView:v3];
  }
  BOOL v4 = [(SearchUIButtonItemView *)self drawsBackgroundPlatter]
    || [(SearchUIButtonItemView *)self drawsIconBackgroundPlatter];
  double v5 = objc_opt_new();
  [(SearchUIButtonItemView *)self setIconView:v5];

  double v6 = [(SearchUIButtonItemView *)self iconView];
  [v6 setUseButtonColoring:1];

  if (v4) {
    uint64_t v7 = 4;
  }
  else {
    uint64_t v7 = 6;
  }
  double v8 = [(SearchUIButtonItemView *)self iconView];
  [v8 setSymbolWeight:v7];

  double v9 = [(SearchUIButtonItemView *)self iconView];
  [v9 setHidden:1];

  double v10 = [(SearchUIButtonItemView *)self iconView];
  +[SearchUIAutoLayout requireIntrinsicSizeForView:v10];

  v11 = [(SearchUIButtonItemView *)self iconView];
  if ([(SearchUIButtonItemView *)self drawsIconBackgroundPlatter]
    && ![(SearchUIButtonItemView *)self shouldAvoidBackgroundView])
  {
    v12 = objc_opt_new();
    [(SearchUIButtonItemView *)self setIconBackgroundView:v12];

    id v13 = objc_alloc(MEMORY[0x1E4F4BEE8]);
    double v14 = [(SearchUIButtonItemView *)self iconBackgroundView];
    v38[0] = v14;
    BOOL v15 = [(SearchUIButtonItemView *)self iconView];
    v38[1] = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    uint64_t v17 = (void *)[v13 initWithArrangedSubviews:v16];

    v18 = [(SearchUIButtonItemView *)self iconView];
    [v17 setAlignment:3 forView:v18 inAxis:0];

    double v19 = [(SearchUIButtonItemView *)self iconView];
    [v17 setAlignment:3 forView:v19 inAxis:1];

    [(SearchUIButtonItemView *)self setIconBoxView:v17];
    uint64_t v20 = [(SearchUIButtonItemView *)self iconBoxView];

    v11 = (void *)v20;
  }
  v21 = objc_opt_new();
  [(SearchUIButtonItemView *)self setTlkTitleLabel:v21];

  v22 = [(SearchUIButtonItemView *)self tlkTitleLabel];
  [v22 setUseButtonColoring:1];

  if (v4) {
    uint64_t v23 = 1;
  }
  else {
    uint64_t v23 = 3;
  }
  v24 = [(SearchUIButtonItemView *)self tlkTitleLabel];
  [v24 setNumberOfLines:v23];

  v25 = [(SearchUIButtonItemView *)self tlkTitleLabel];
  [v25 setHidden:1];

  if (v4)
  {
    v37[0] = v11;
    v26 = [(SearchUIButtonItemView *)self tlkTitleLabel];
    v37[1] = v26;
    v27 = v37;
  }
  else
  {
    v26 = [(SearchUIButtonItemView *)self tlkTitleLabel];
    v36[0] = v26;
    v36[1] = v11;
    v27 = v36;
  }
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

  v29 = (void *)[objc_alloc(MEMORY[0x1E4F4BF00]) initWithArrangedSubviews:v28];
  [v29 setAlignment:3];
  [v29 setLayoutMarginsRelativeArrangement:v4];
  objc_msgSend(v29, "setAxis:", -[SearchUIButtonItemView drawsIconBackgroundPlatter](self, "drawsIconBackgroundPlatter"));
  [(SearchUIButtonItemView *)self setImageViewAndLabelStackView:v29];
  [(SearchUIButtonItemView *)self updateProminences];
  [(SearchUIButtonItemView *)self setIsCompact:0];
  if ([(SearchUIButtonItemView *)self drawsBackgroundPlatter])
  {
    v30 = [(SearchUIButtonItemView *)self backgroundView];
    v35 = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
    v32 = [v31 arrayByAddingObject:v29];
  }
  else
  {
    v32 = [MEMORY[0x1E4F1CBF0] arrayByAddingObject:v29];
  }
  v33 = (void *)[objc_alloc(MEMORY[0x1E4F4BEE8]) initWithArrangedSubviews:v32];
  [v33 setAlignment:3 forView:v29 inAxis:0];
  [v33 setAlignment:3 forView:v29 inAxis:1];

  return v33;
}

- (void)setIsCompact:(BOOL)a3
{
  self->_isCompact = a3;
  BOOL v4 = [(SearchUIButtonItemView *)self buttonTitle];
  [(SearchUIButtonItemView *)self setButtonTitle:v4];

  int64_t v5 = [(SearchUIButtonItemView *)self symbolScale];
  double v6 = [(SearchUIButtonItemView *)self iconView];
  [v6 setSymbolScale:v5];

  [(SearchUIButtonItemView *)self updateFonts];
  [(SearchUIButtonItemView *)self invalidateIntrinsicContentSize];
}

- (UIFont)defaultButtonFont
{
  v2 = (void *)MEMORY[0x1E4FAE090];
  int v3 = [MEMORY[0x1E4FAE198] isMacOS];
  BOOL v4 = (uint64_t *)MEMORY[0x1E4FB28F0];
  if (!v3) {
    BOOL v4 = (uint64_t *)MEMORY[0x1E4FB2950];
  }
  uint64_t v5 = *v4;
  uint64_t v6 = TLKSnippetModernizationEnabled() ^ 1;
  double v7 = *MEMORY[0x1E4FB09E0];
  return (UIFont *)[v2 cachedFontForTextStyle:v5 isShort:v6 fontWeight:v7];
}

- (void)setIconFont:(id)a3
{
  objc_storeStrong((id *)&self->_iconFont, a3);
  [(SearchUIButtonItemView *)self updateFonts];
}

- (void)setButtonFont:(id)a3
{
  objc_storeStrong((id *)&self->_buttonFont, a3);
  [(SearchUIButtonItemView *)self updateFonts];
}

- (id)resolvedIconFont
{
  int v3 = [(SearchUIButtonItemView *)self iconFont];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    uint64_t v6 = [(SearchUIButtonItemView *)self buttonFont];
    double v7 = v6;
    if (v6)
    {
      id v5 = v6;
    }
    else
    {
      double v8 = [(SearchUIButtonItemView *)self defaultIconFont];
      double v9 = v8;
      if (v8)
      {
        id v10 = v8;
      }
      else
      {
        id v10 = [(SearchUIButtonItemView *)self defaultButtonFont];
      }
      id v5 = v10;
    }
  }

  return v5;
}

- (id)resolvedButtonFont
{
  int v3 = [(SearchUIButtonItemView *)self buttonFont];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(SearchUIButtonItemView *)self defaultButtonFont];
  }
  uint64_t v6 = v5;

  return v6;
}

- (void)updateFonts
{
  id v18 = [(SearchUIButtonItemView *)self resolvedButtonFont];
  int v3 = [(SearchUIButtonItemView *)self resolvedIconFont];
  BOOL v4 = [(SearchUIButtonItemView *)self iconView];
  [v4 setSymbolFont:v3];

  id v5 = [(SearchUIButtonItemView *)self tlkTitleLabel];
  [v5 setFont:v18];

  [(SearchUIButtonItemView *)self horizontalPadding];
  double v7 = v6;
  objc_msgSend(MEMORY[0x1E4FAE100], "scaledValueForValue:withFont:view:", v18, self);
  double v9 = v8;
  [MEMORY[0x1E4FAE100] scaledValueForValue:v18 withFont:self view:v7];
  double v11 = v10;
  v12 = [(SearchUIButtonItemView *)self imageViewAndLabelStackView];
  objc_msgSend(v12, "setLayoutMargins:", 0.0, v9, 0.0, v11);

  id v13 = (void *)MEMORY[0x1E4FAE100];
  [(SearchUIButtonItemView *)self spacingBetweenImageAndText];
  objc_msgSend(v13, "scaledValueForValue:withFont:view:", v18, self);
  double v15 = v14;
  uint64_t v16 = [(SearchUIButtonItemView *)self imageViewAndLabelStackView];
  [v16 setSpacing:v15];

  uint64_t v17 = [(SearchUIButtonItemView *)self iconBackgroundView];
  [(SearchUIButtonItemView *)self iconBackgroundViewSize];
  objc_msgSend(v17, "setLayoutSize:withContentPriority:");
}

- (int64_t)symbolScale
{
  if ([(SearchUIButtonItemView *)self drawsBackgroundPlatter]) {
    return 2;
  }
  if ([(SearchUIButtonItemView *)self drawsIconBackgroundPlatter]) {
    return 2;
  }
  return 1;
}

- (double)spacingBetweenImageAndText
{
  BOOL v2 = [(SearchUIButtonItemView *)self drawsBackgroundPlatter];
  double result = 2.0;
  if (v2)
  {
    int v4 = objc_msgSend(MEMORY[0x1E4FAE198], "isMacOS", 2.0);
    double result = 6.0;
    if (v4) {
      return 3.0;
    }
  }
  return result;
}

- (double)cornerRadius
{
  [(SearchUIButtonItemView *)self bounds];
  return CGRectGetHeight(v3) * 0.5;
}

- (double)minimumIconPadding
{
  BOOL v2 = [(SearchUIButtonItemView *)self isCompact];
  double result = 4.0;
  if (v2) {
    return 2.0;
  }
  return result;
}

- (CGSize)iconBackgroundViewSize
{
  if ([(SearchUIButtonItemView *)self isCompact])
  {
    +[SearchUISuggestionImageUtilities maximumSize];
    double v4 = v3;
  }
  else
  {
    id v5 = [(SearchUIButtonItemView *)self resolvedIconFont];
    [v5 pointSize];
    double v4 = v6 * 2.4;
  }
  double v7 = v4;
  double v8 = v4;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SearchUIButtonItemView;
  [(SearchUIButtonItemView *)&v9 traitCollectionDidChange:v4];
  id v5 = [(SearchUIButtonItemView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(SearchUIButtonItemView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  double v6 = [(SearchUIButtonItemView *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)SearchUIButtonItemView;
  [(SearchUIButtonItemView *)&v3 didMoveToWindow];
  [(SearchUIButtonItemView *)self tlk_updateWithCurrentAppearance];
}

- (void)tlk_updateForAppearance:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SearchUIButtonItemView;
  [(SearchUIButtonItemView *)&v30 tlk_updateForAppearance:v4];
  id v5 = [(SearchUIButtonItemView *)self buttonAppearance];
  double v6 = [v5 tintColor];

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__0;
  v28 = __Block_byref_object_dispose__0;
  id v29 = 0;
  if (v6)
  {
    uint64_t v7 = objc_msgSend(objc_alloc((Class)objc_msgSend(v6, "searchUI_colorGeneratorClass")), "initWithSFColor:", v6);
    uint64_t v8 = [v4 isDark];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __50__SearchUIButtonItemView_tlk_updateForAppearance___block_invoke;
    v23[3] = &unk_1E6E72A50;
    v23[4] = &v24;
    [v7 generateUIColorsIsDark:v8 completionHandler:v23];
  }
  if ([(SearchUIButtonItemView *)self drawsBackgroundPlatter])
  {
    uint64_t v9 = v25[5];
    double v10 = [(SearchUIButtonItemView *)self backgroundView];
    [v10 setColor:v9];
  }
  if ([(SearchUIButtonItemView *)self drawsIconBackgroundPlatter])
  {
    uint64_t v11 = v25[5];
    v12 = [(SearchUIButtonItemView *)self iconBackgroundView];
    [v12 setColor:v11];
  }
  if (([(SearchUIButtonItemView *)self drawsBackgroundPlatter]
     || [(SearchUIButtonItemView *)self drawsIconBackgroundPlatter])
    && ![(SearchUIButtonItemView *)self useHierarchicalColorRendering])
  {
    uint64_t v17 = [(SearchUIButtonItemView *)self tlkTitleLabel];
    [v17 setTextColor:0];

    id v18 = [(SearchUIButtonItemView *)self iconView];
    [v18 setOverrideColor:0];

    if (v25[5])
    {
      BOOL v19 = +[SearchUIBackgroundColorUtilities backgroundColorPrefersWhiteForegroundText:](SearchUIBackgroundColorUtilities, "backgroundColorPrefersWhiteForegroundText:");
      uint64_t v20 = [MEMORY[0x1E4FAE060] appearanceWithVibrancyEnabled:1 isDark:v19];
      v21 = [(SearchUIButtonItemView *)self buttonContentBoxView];
      [v20 overrideAppearanceForView:v21];
    }
    else
    {
      v22 = (void *)MEMORY[0x1E4FAE060];
      uint64_t v20 = [(SearchUIButtonItemView *)self buttonContentBoxView];
      [v22 disableAppearanceOverrideForView:v20];
    }

    [(SearchUIButtonItemView *)self updateProminences];
  }
  else
  {
    uint64_t v13 = v25[5];
    double v14 = [(SearchUIButtonItemView *)self tlkTitleLabel];
    [v14 setTextColor:v13];

    uint64_t v15 = v25[5];
    uint64_t v16 = [(SearchUIButtonItemView *)self iconView];
    [v16 setOverrideColor:v15];
  }
  _Block_object_dispose(&v24, 8);
}

uint64_t __50__SearchUIButtonItemView_tlk_updateForAppearance___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 firstObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x1F41817F8](v3, v5);
}

- (void)setButtonAppearance:(id)a3
{
  id v9 = a3;
  if (([v9 isEqual:self->_buttonAppearance] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_buttonAppearance, a3);
    BOOL v5 = [(SearchUIButtonItemView *)self useHierarchicalColorRendering];
    double v6 = [(SearchUIButtonItemView *)self backgroundView];
    [v6 setUseHierarchicalColorRendering:v5];

    BOOL v7 = [(SearchUIButtonItemView *)self useHierarchicalColorRendering];
    uint64_t v8 = [(SearchUIButtonItemView *)self iconBackgroundView];
    [v8 setUseHierarchicalColorRendering:v7];

    [(SearchUIButtonItemView *)self tlk_updateWithCurrentAppearance];
  }
}

- (BOOL)useHierarchicalColorRendering
{
  BOOL v2 = [(SearchUIButtonItemView *)self buttonAppearance];
  uint64_t v3 = v2;
  if (v2) {
    BOOL v4 = [v2 renderingMode] == 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SearchUIButtonItemView;
  [(SearchUIButtonItemView *)&v4 setEnabled:a3];
  [(SearchUIButtonItemView *)self updateProminences];
}

- (void)updateProminences
{
  uint64_t v3 = [(SearchUIButtonItemView *)self buttonAppearance];
  objc_super v4 = [v3 tintColor];
  if (v4 || ![(SearchUIButtonItemView *)self isEnabled])
  {
    uint64_t v5 = 0;
  }
  else if ([(SearchUIButtonItemView *)self drawsBackgroundPlatter])
  {
    uint64_t v5 = 1;
  }
  else if ([(SearchUIButtonItemView *)self drawsIconBackgroundPlatter])
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v5 = 2;
  }

  double v6 = [(SearchUIButtonItemView *)self tlkTitleLabel];
  [v6 setProminence:v5];

  id v7 = [(SearchUIButtonItemView *)self iconView];
  [v7 setProminence:v5];
}

- (BOOL)useContinuousCorners
{
  return 1;
}

- (BOOL)drawsBackgroundPlatter
{
  return 1;
}

- (BOOL)drawsTitle
{
  return 1;
}

- (BOOL)drawsIconBackgroundPlatter
{
  return 0;
}

- (void)setSfImage:(id)a3
{
}

- (void)setSfImage:(id)a3 animateTransition:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (SFImage *)a3;
  sfImage = self->_sfImage;
  if (sfImage == v6) {
    goto LABEL_14;
  }
  self->_sfImage = v6;
  uint64_t v8 = v6;

  uint64_t v17 = +[SearchUIImage imageWithSFImage:v8];

  if ([(SearchUIButtonItemView *)self allowsAnimation])
  {
    id v9 = [(SearchUIButtonItemView *)self delegate];
    if (![v9 supportsContextMenuConfiguration] && v4 && v17)
    {
      double v10 = [(SearchUIButtonItemView *)self iconView];
      uint64_t v11 = [v10 currentImage];

      if (v11)
      {
        [(SearchUIButtonItemView *)self transitionIconToSFImage:v17];
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  v12 = [(SearchUIButtonItemView *)self iconView];
  [v12 updateWithImage:v17 animateTransition:0];

LABEL_10:
  uint64_t v13 = [(SearchUIButtonItemView *)self iconView];
  [v13 setHidden:v17 == 0];

  double v6 = v17;
  if (v17)
  {
    double v14 = [(SearchUIButtonItemView *)self window];

    if (!v14)
    {
      uint64_t v15 = [(SearchUIButtonItemView *)self iconView];
      uint64_t v16 = [MEMORY[0x1E4FAE060] bestAppearanceForView:self];
      objc_msgSend(v15, "tlk_updateForAppearance:", v16);
    }
    double v6 = v17;
  }
LABEL_14:
}

- (void)setButtonTitle:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_buttonTitle, a3);
  uint64_t v5 = [(SearchUIButtonItemView *)self tlkTitleLabel];
  [v5 setText:v8];

  if ([v8 length]) {
    uint64_t v6 = [(SearchUIButtonItemView *)self drawsTitle] ^ 1;
  }
  else {
    uint64_t v6 = 1;
  }
  id v7 = [(SearchUIButtonItemView *)self tlkTitleLabel];
  [v7 setHidden:v6];

  [(SearchUIButtonItemView *)self setAccessibilityLabel:v8];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(SearchUIButtonItemView *)self buttonContentBoxView];
  objc_msgSend(v6, "effectiveLayoutSizeFittingSize:", width, height);
  double v8 = v7;
  double v10 = v9;

  [(SearchUIButtonItemView *)self verticalPaddingFontMultipler];
  if (v11 != 0.0)
  {
    v12 = [(SearchUIButtonItemView *)self tlkTitleLabel];
    [v12 intrinsicContentSize];
    double v14 = v13;
    [(SearchUIButtonItemView *)self verticalPaddingFontMultipler];
    double v10 = v14 * v15;
  }
  double v16 = v8;
  double v17 = v10;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  uint64_t v5 = [(SearchUIButtonItemView *)self delegate];
  int v6 = [v5 supportsContextMenuConfiguration];

  if (v6)
  {
    double v7 = [(SearchUIButtonItemView *)self delegate];
    double v8 = [v7 previewCommandHandler];
    [(SearchUIButtonItemView *)self setCommandHandler:v8];

    double v9 = [(SearchUIButtonItemView *)self delegate];
    double v10 = [v9 customPreviewMenu];

    if (!v10
      || (v14[0] = MEMORY[0x1E4F143A8],
          v14[1] = 3221225472,
          v14[2] = __80__SearchUIButtonItemView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke,
          v14[3] = &unk_1E6E72A78,
          v14[4] = self,
          [MEMORY[0x1E4FB1678] configurationWithIdentifier:0 previewProvider:0 actionProvider:v14], (double v11 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      v12 = [(SearchUIButtonItemView *)self commandHandler];
      double v11 = +[SearchUICollectionPeekDelegate menuConfigurationForCommandHandler:v12];
    }
  }
  else
  {
    double v11 = 0;
  }
  return v11;
}

id __80__SearchUIButtonItemView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) delegate];
  BOOL v2 = [v1 customPreviewMenu];

  return v2;
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  int v6 = objc_opt_new();
  double v7 = [MEMORY[0x1E4FB1618] clearColor];
  [v6 setBackgroundColor:v7];

  if ([(SearchUIButtonItemView *)self drawsIconBackgroundPlatter])
  {
    double v8 = [(SearchUIButtonItemView *)self iconBackgroundView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = [(SearchUIButtonItemView *)self iconBoxView];
    -[SearchUIButtonItemView convertRect:fromView:](self, "convertRect:fromView:", v17, v10, v12, v14, v16);
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    uint64_t v26 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v19, v21, v23, v25);
  }
  else
  {
    if ([(SearchUIButtonItemView *)self drawsBackgroundPlatter]) {
      double v27 = 0.0;
    }
    else {
      double v27 = 5.0;
    }
    [(SearchUIButtonItemView *)self bounds];
    CGRect v39 = CGRectInset(v38, -v27, -v27);
    double x = v39.origin.x;
    double y = v39.origin.y;
    double width = v39.size.width;
    double height = v39.size.height;
    if ([(SearchUIButtonItemView *)self drawsBackgroundPlatter])
    {
      [(SearchUIButtonItemView *)self cornerRadius];
      double v33 = v32;
    }
    else
    {
      v40.origin.double x = x;
      v40.origin.double y = y;
      v40.size.double width = width;
      v40.size.double height = height;
      double v33 = CGRectGetHeight(v40) * 0.1;
    }
    if ([(SearchUIButtonItemView *)self useContinuousCorners]) {
      objc_msgSend(MEMORY[0x1E4FB14C0], "_bezierPathWithPillRect:cornerRadius:", x, y, width, height, v33);
    }
    else {
    uint64_t v26 = objc_msgSend(MEMORY[0x1E4FB14C0], "_bezierPathWithArcRoundedRect:cornerRadius:", x, y, width, height, v33);
    }
  }
  v34 = (void *)v26;
  [v6 setVisiblePath:v26];

  v35 = (void *)[objc_alloc(MEMORY[0x1E4FB1D48]) initWithView:self parameters:v6];
  return v35;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v6 = a5;
  id v7 = [(SearchUIButtonItemView *)self commandHandler];
  +[SearchUICollectionPeekDelegate contextMenuInteractionWillPerformPreviewActionForMenuWithCommandHandler:v7 animator:v6];
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIButtonItemView;
  id v9 = a3;
  [(SearchUIButtonItemView *)&v12 contextMenuInteraction:v9 willDisplayMenuForConfiguration:a4 animator:v8];
  id v10 = [(SearchUIButtonItemView *)self contextPreviewInteraction];

  if (v10 == v9)
  {
    double v11 = [(SearchUIButtonItemView *)self commandHandler];
    +[SearchUICollectionPeekDelegate contextMenuInteractionWillDisplayMenuForCommandHandler:v11 animator:v8];
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIButtonItemView;
  id v9 = a3;
  [(SearchUIButtonItemView *)&v12 contextMenuInteraction:v9 willEndForConfiguration:a4 animator:v8];
  id v10 = [(SearchUIButtonItemView *)self contextPreviewInteraction];

  if (v10 == v9)
  {
    double v11 = [(SearchUIButtonItemView *)self commandHandler];
    +[SearchUICollectionPeekDelegate contextMenuInteractionWillEndForCommandHandler:v11 animator:v8];
  }
  [(SearchUIButtonItemView *)self setCommandHandler:0];
}

- (double)effectiveFirstBaselineOffsetFromTop
{
  if ([(SearchUIButtonItemView *)self drawsBackgroundPlatter]
    || [(SearchUIButtonItemView *)self drawsIconBackgroundPlatter])
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUIButtonItemView;
    [(SearchUIButtonItemView *)&v7 effectiveFirstBaselineOffsetFromTop];
  }
  else
  {
    BOOL v4 = [(SearchUIButtonItemView *)self tlkTitleLabel];
    [v4 effectiveFirstBaselineOffsetFromTop];
    double v6 = v5;

    return v6;
  }
  return result;
}

- (double)effectiveBaselineOffsetFromBottom
{
  if ([(SearchUIButtonItemView *)self drawsBackgroundPlatter]
    || [(SearchUIButtonItemView *)self drawsIconBackgroundPlatter])
  {
    v7.receiver = self;
    v7.super_class = (Class)SearchUIButtonItemView;
    [(SearchUIButtonItemView *)&v7 effectiveBaselineOffsetFromBottom];
  }
  else
  {
    BOOL v4 = [(SearchUIButtonItemView *)self tlkTitleLabel];
    [v4 effectiveBaselineOffsetFromBottom];
    double v6 = v5;

    return v6;
  }
  return result;
}

- (id)accessibilityIdentifier
{
  return @"standard-button";
}

- (double)buttonAnimationOutDelay
{
  BOOL v2 = +[SearchUISpringAnimationSettings buttonSelection];
  [v2 perceptualDuration];
  double v4 = v3 * 0.5;

  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SearchUIButtonItemView;
  [(SearchUIButtonItemView *)&v10 touchesBegan:a3 withEvent:a4];
  if ([(SearchUIButtonItemView *)self allowsAnimation])
  {
    double v5 = [(SearchUIButtonItemView *)self delegate];
    char v6 = [v5 supportsContextMenuConfiguration];

    if ((v6 & 1) == 0)
    {
      objc_super v7 = +[SearchUISpringAnimationSettings buttonSelection];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __49__SearchUIButtonItemView_touchesBegan_withEvent___block_invoke;
      v9[3] = &unk_1E6E72730;
      v9[4] = self;
      id v8 = +[SearchUIAnimator animateWith:v7 animations:v9 completion:0];
      [(SearchUIButtonItemView *)self setSelectionAnimator:v8];
    }
  }
}

uint64_t __49__SearchUIButtonItemView_touchesBegan_withEvent___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 0.8, 0.8);
  BOOL v2 = *(void **)(a1 + 32);
  CGAffineTransform v4 = v5;
  return [v2 setTransform:&v4];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SearchUIButtonItemView;
  [(SearchUIButtonItemView *)&v10 touchesCancelled:a3 withEvent:a4];
  if ([(SearchUIButtonItemView *)self allowsAnimation])
  {
    CGAffineTransform v5 = [(SearchUIButtonItemView *)self delegate];
    char v6 = [v5 supportsContextMenuConfiguration];

    if ((v6 & 1) == 0)
    {
      objc_super v7 = +[SearchUISpringAnimationSettings buttonSelectionCancel];
      [(SearchUIButtonItemView *)self buttonAnimationOutDelay];
      objc_msgSend(v7, "setDelay:");
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __53__SearchUIButtonItemView_touchesCancelled_withEvent___block_invoke;
      v9[3] = &unk_1E6E72730;
      v9[4] = self;
      id v8 = +[SearchUIAnimator animateWith:v7 animations:v9 completion:0];
    }
  }
}

uint64_t __53__SearchUIButtonItemView_touchesCancelled_withEvent___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SearchUIButtonItemView;
  [(SearchUIButtonItemView *)&v10 touchesEnded:a3 withEvent:a4];
  if ([(SearchUIButtonItemView *)self allowsAnimation])
  {
    CGAffineTransform v5 = [(SearchUIButtonItemView *)self delegate];
    char v6 = [v5 supportsContextMenuConfiguration];

    if ((v6 & 1) == 0)
    {
      objc_super v7 = +[SearchUISpringAnimationSettings buttonSelection];
      [(SearchUIButtonItemView *)self buttonAnimationOutDelay];
      objc_msgSend(v7, "setDelay:");
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __49__SearchUIButtonItemView_touchesEnded_withEvent___block_invoke;
      v9[3] = &unk_1E6E72730;
      v9[4] = self;
      id v8 = +[SearchUIAnimator animateWith:v7 animations:v9 completion:0];
    }
  }
}

uint64_t __49__SearchUIButtonItemView_touchesEnded_withEvent___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (void)transitionIconToSFImage:(id)a3
{
  id v4 = a3;
  [(SearchUIButtonItemView *)self buttonAnimationOutDelay];
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__SearchUIButtonItemView_transitionIconToSFImage___block_invoke;
  v8[3] = &unk_1E6E72620;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v6, MEMORY[0x1E4F14428], v8);
}

void __50__SearchUIButtonItemView_transitionIconToSFImage___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) animateIconOutToSFImage:*(void *)(a1 + 40)];
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__SearchUIButtonItemView_transitionIconToSFImage___block_invoke_2;
  _OWORD v4[3] = &unk_1E6E72620;
  double v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, MEMORY[0x1E4F14428], v4);
}

uint64_t __50__SearchUIButtonItemView_transitionIconToSFImage___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) animateIconInToSFImage:*(void *)(a1 + 40)];
}

- (void)animateIconOutToSFImage:(id)a3
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v4 = [(SearchUIButtonItemView *)self transitionIconView];
  if (!v4)
  {
    id v4 = objc_opt_new();
    [(SearchUIButtonItemView *)self setTransitionIconView:v4];
    [v4 setUseButtonColoring:1];
    +[SearchUIAutoLayout requireIntrinsicSizeForView:v4];
  }
  [v4 setHidden:0];
  if ([(SearchUIButtonItemView *)self drawsBackgroundPlatter])
  {
    uint64_t v5 = 4;
  }
  else if ([(SearchUIButtonItemView *)self drawsIconBackgroundPlatter])
  {
    uint64_t v5 = 4;
  }
  else
  {
    uint64_t v5 = 6;
  }
  [v4 setSymbolWeight:v5];
  dispatch_time_t v6 = [(SearchUIButtonItemView *)self iconView];
  id v7 = [v6 currentImage];
  [v4 updateWithImage:v7];

  id v8 = [(SearchUIButtonItemView *)self iconView];
  [v8 frame];
  objc_msgSend(v4, "setFrame:");

  id v9 = [v4 imageView];
  objc_super v10 = [v9 layer];
  [v10 setOpacity:0.0];

  double v11 = [(SearchUIButtonItemView *)self transitionIconView];
  objc_super v12 = [v11 imageView];
  +[SearchUIUtilities applyGaussianBlurToView:v12 withRadius:6.0];

  double v13 = [(SearchUIButtonItemView *)self imageViewAndLabelStackView];
  double v14 = [(SearchUIButtonItemView *)self transitionIconView];
  [v13 addSubview:v14];

  double v15 = +[SearchUIBasicLayerAnimation blurFrom:0.0 to:6.0];
  double v16 = +[SearchUIBasicLayerAnimation opacityFrom:to:](_TtC8SearchUI27SearchUIBasicLayerAnimation, "opacityFrom:to:", 1.0, 0.0, v15);
  v25[1] = v16;
  double v17 = +[SearchUIBasicLayerAnimation scaleFrom:1.0 to:0.5];
  v25[2] = v17;
  double v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];

  double v19 = +[SearchUISpringAnimationSettings buttonSelection];
  double v20 = [v4 imageView];
  double v21 = [v20 layer];
  +[SearchUIAnimator animateWithLayer:v21 with:v19 key:@"disappearAnimation" animations:v18 delegate:self];

  double v22 = [(SearchUIButtonItemView *)self iconView];
  double v23 = [v22 imageView];
  double v24 = [v23 layer];
  [v24 setOpacity:0.0];
}

- (void)animateIconInToSFImage:(id)a3
{
  v20[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SearchUIButtonItemView *)self iconView];
  dispatch_time_t v6 = [v5 imageView];
  id v7 = [v6 layer];
  LODWORD(v8) = 1.0;
  [v7 setOpacity:v8];

  id v9 = [(SearchUIButtonItemView *)self iconView];
  objc_super v10 = [v9 imageView];
  +[SearchUIUtilities applyGaussianBlurToView:v10 withRadius:0.0];

  double v11 = [(SearchUIButtonItemView *)self iconView];
  [v11 updateWithImage:v4 animateTransition:0];

  objc_super v12 = +[SearchUIBasicLayerAnimation blurFrom:6.0 to:0.0];
  double v13 = +[SearchUIBasicLayerAnimation opacityFrom:to:](_TtC8SearchUI27SearchUIBasicLayerAnimation, "opacityFrom:to:", 0.0, 1.0, v12);
  v20[1] = v13;
  double v14 = +[SearchUIBasicLayerAnimation scaleFrom:0.5 to:1.0];
  v20[2] = v14;
  double v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:3];

  double v16 = +[SearchUISpringAnimationSettings buttonIconAppear];
  double v17 = [(SearchUIButtonItemView *)self iconView];
  double v18 = [v17 imageView];
  double v19 = [v18 layer];
  +[SearchUIAnimator animateWithLayer:v19 with:v16 key:@"appearAnimation" animations:v15 delegate:self];
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  id v23 = a3;
  [MEMORY[0x1E4F39CF8] begin];
  uint64_t v5 = [(SearchUIButtonItemView *)self transitionIconView];
  dispatch_time_t v6 = [v5 imageView];
  id v7 = [v6 layer];
  id v8 = [v7 animationForKey:@"disappearAnimation"];

  if (v8 == v23)
  {
    double v19 = [(SearchUIButtonItemView *)self transitionIconView];
    [v19 setHidden:1];
  }
  else
  {
    id v9 = [(SearchUIButtonItemView *)self iconView];
    objc_super v10 = [v9 imageView];
    double v11 = [v10 layer];
    id v12 = [v11 animationForKey:@"appearAnimation"];

    if (v12 != v23) {
      goto LABEL_6;
    }
    double v13 = [(SearchUIButtonItemView *)self iconView];
    double v14 = [v13 imageView];
    double v15 = [v14 layer];
    [v15 removeAllAnimations];

    double v16 = [(SearchUIButtonItemView *)self iconView];
    double v17 = [v16 imageView];
    double v18 = [v17 layer];
    [v18 setFilters:MEMORY[0x1E4F1CBF0]];

    double v19 = [(SearchUIButtonItemView *)self iconView];
    double v20 = [v19 imageView];
    double v21 = [v20 layer];
    LODWORD(v22) = 1.0;
    [v21 setOpacity:v22];
  }
LABEL_6:
  [MEMORY[0x1E4F39CF8] commit];
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (SFButtonItemAppearance)buttonAppearance
{
  return self->_buttonAppearance;
}

- (SFImage)sfImage
{
  return self->_sfImage;
}

- (SearchUIButtonItemViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SearchUIButtonItemViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIFont)iconFont
{
  return self->_iconFont;
}

- (UIFont)buttonFont
{
  return self->_buttonFont;
}

- (BOOL)isCompact
{
  return self->_isCompact;
}

- (BOOL)allowsAnimation
{
  return self->_allowsAnimation;
}

- (void)setAllowsAnimation:(BOOL)a3
{
  self->_allowsAnimation = a3;
}

- (BOOL)shouldAvoidBackgroundView
{
  return self->_shouldAvoidBackgroundView;
}

- (double)horizontalPadding
{
  return self->_horizontalPadding;
}

- (double)verticalPaddingFontMultipler
{
  return self->_verticalPaddingFontMultipler;
}

- (NUIContainerBoxView)buttonContentBoxView
{
  return (NUIContainerBoxView *)objc_getProperty(self, a2, 816, 1);
}

- (void)setButtonContentBoxView:(id)a3
{
}

- (SearchUIButtonBackgroundView)backgroundView
{
  return (SearchUIButtonBackgroundView *)objc_getProperty(self, a2, 824, 1);
}

- (void)setBackgroundView:(id)a3
{
}

- (TLKLabel)tlkTitleLabel
{
  return (TLKLabel *)objc_getProperty(self, a2, 832, 1);
}

- (void)setTlkTitleLabel:(id)a3
{
}

- (SearchUIImageView)iconView
{
  return (SearchUIImageView *)objc_getProperty(self, a2, 840, 1);
}

- (void)setIconView:(id)a3
{
}

- (SearchUIButtonBackgroundView)iconBackgroundView
{
  return (SearchUIButtonBackgroundView *)objc_getProperty(self, a2, 848, 1);
}

- (void)setIconBackgroundView:(id)a3
{
}

- (NUIContainerBoxView)iconBoxView
{
  return (NUIContainerBoxView *)objc_getProperty(self, a2, 856, 1);
}

- (void)setIconBoxView:(id)a3
{
}

- (SearchUICommandHandler)commandHandler
{
  return (SearchUICommandHandler *)objc_getProperty(self, a2, 864, 1);
}

- (void)setCommandHandler:(id)a3
{
}

- (NUIContainerStackView)imageViewAndLabelStackView
{
  return (NUIContainerStackView *)objc_getProperty(self, a2, 872, 1);
}

- (void)setImageViewAndLabelStackView:(id)a3
{
}

- (UIContextMenuInteraction)contextPreviewInteraction
{
  return (UIContextMenuInteraction *)objc_getProperty(self, a2, 880, 1);
}

- (void)setContextPreviewInteraction:(id)a3
{
}

- (UIViewPropertyAnimator)selectionAnimator
{
  return self->_selectionAnimator;
}

- (void)setSelectionAnimator:(id)a3
{
}

- (SearchUIImageView)transitionIconView
{
  return self->_transitionIconView;
}

- (void)setTransitionIconView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionIconView, 0);
  objc_storeStrong((id *)&self->_selectionAnimator, 0);
  objc_storeStrong((id *)&self->_contextPreviewInteraction, 0);
  objc_storeStrong((id *)&self->_imageViewAndLabelStackView, 0);
  objc_storeStrong((id *)&self->_commandHandler, 0);
  objc_storeStrong((id *)&self->_iconBoxView, 0);
  objc_storeStrong((id *)&self->_iconBackgroundView, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_tlkTitleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_buttonContentBoxView, 0);
  objc_storeStrong((id *)&self->_buttonFont, 0);
  objc_storeStrong((id *)&self->_iconFont, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sfImage, 0);
  objc_storeStrong((id *)&self->_buttonAppearance, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
}

@end