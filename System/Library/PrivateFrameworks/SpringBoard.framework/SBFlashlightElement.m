@interface SBFlashlightElement
- (BOOL)isMinimalPresentationPossible;
- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4;
- (BOOL)overridesConcentricPaddingForView:(id)a3 inLayoutMode:(int64_t)a4;
- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)result maximumOutsets:(NSDirectionalEdgeInsets)a5;
- (NSString)elementIdentifier;
- (SBFlashlightElement)initWithStyle:(unint64_t)a3 state:(unint64_t)a4;
- (SBUISystemApertureCAPackageButton)expandedLeadingPackageButton;
- (SBUISystemApertureCAPackageContentProvider)leadingPackageViewProvider;
- (SBUISystemApertureTextContentProvider)trailingTextProvider;
- (UIColor)keyColor;
- (UILabel)expandedTitleLabel;
- (UILabel)expandedTrailingLabel;
- (double)concentricPaddingOverrideForView:(id)a3 inLayoutMode:(int64_t)a4;
- (id)_textColorForState:(unint64_t)a3;
- (id)_titleColorForStyle:(unint64_t)a3;
- (id)_titleTextForStyle:(unint64_t)a3;
- (id)_trailingTextForState:(unint64_t)a3;
- (unint64_t)state;
- (unint64_t)style;
- (void)_configureCustomViewsIfNecessary;
- (void)_layoutHuggingObstructionForLabel:(id)a3 x:(double)a4 width:(double)a5 maxLabelHeight:(double)a6;
- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5;
- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation SBFlashlightElement

- (SBFlashlightElement)initWithStyle:(unint64_t)a3 state:(unint64_t)a4
{
  id v7 = objc_alloc_init(MEMORY[0x1E4FA7D70]);
  id v8 = objc_alloc(MEMORY[0x1E4FA7D68]);
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = (void *)[v8 initWithPackageName:@"Flashlight-Leading-D83" inBundle:v9];

  objc_msgSend(v10, "setIntrinsicPackageSize:", 36.6666667, 36.6666667);
  v11 = @"OFF";
  if (a4 == 1) {
    v11 = @"ON";
  }
  if (a4 == 2) {
    v12 = @"unavailable";
  }
  else {
    v12 = v11;
  }
  [v10 setState:v12 animated:0];
  [v7 setLeadingContentViewProvider:v10];
  objc_storeStrong((id *)&self->_leadingPackageViewProvider, v10);
  id v13 = objc_alloc(MEMORY[0x1E4FA7DB0]);
  v14 = [(SBFlashlightElement *)self _trailingTextForState:a4];
  v15 = (void *)[v13 initWithText:v14 style:4];

  v16 = [(SBFlashlightElement *)self _textColorForState:a4];
  [v15 setContentColor:v16];

  [v7 setTrailingContentViewProvider:v15];
  objc_storeStrong((id *)&self->_trailingTextProvider, v15);
  self->_style = a3;
  self->_state = a4;
  v23.receiver = self;
  v23.super_class = (Class)SBFlashlightElement;
  v17 = [(SBSystemApertureProvidedContentElement *)&v23 initWithIdentifier:self contentProvider:v7];
  v18 = v17;
  if (v17)
  {
    [(SBSystemApertureProvidedContentElement *)v17 setMinimumSupportedLayoutMode:1];
    [(SBSystemApertureProvidedContentElement *)v18 setMaximumSupportedLayoutMode:3];
    [(SBSystemApertureProvidedContentElement *)v18 setPreferredLayoutMode:2];
    v19 = [MEMORY[0x1E4FA7D88] sharedInstanceForEmbeddedDisplay];
    [v19 sensorRegionSize];
    v18->_sensorObstructionHeight = v20;
    [v19 minimumExpandedSize];
    v18->_expandedHeight = v21;
  }
  return v18;
}

- (void)setState:(unint64_t)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    self->_state = a3;
    v5 = @"OFF";
    if (a3 == 1) {
      v5 = @"ON";
    }
    if (a3 == 2) {
      v5 = @"unavailable";
    }
    v6 = v5;
    id v7 = [(SBFlashlightElement *)self leadingPackageViewProvider];
    [v7 setState:v6 animated:1];

    id v8 = [(SBFlashlightElement *)self expandedLeadingPackageButton];
    [v8 setState:v6 animated:1];

    v9 = [(SBFlashlightElement *)self trailingTextProvider];
    v10 = [(SBFlashlightElement *)self _trailingTextForState:a3];
    v11 = [(SBFlashlightElement *)self _textColorForState:a3];
    [v9 swapInText:v10 textColor:v11];
    v12 = [(SBFlashlightElement *)self expandedTrailingLabel];
    [v12 setText:v10];
    [v12 setTextColor:v11];
    if ([(SBSystemApertureProvidedContentElement *)self layoutMode] == 3)
    {
      id v13 = [v12 superview];
      if (v13) {
        [(SBFlashlightElement *)self layoutHostContainerViewDidLayoutSubviews:v13];
      }
    }
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v16 = @"SBSystemApertureNotificationUserInfoElementKey";
    v17[0] = self;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    [v14 postNotificationName:@"SBSystemApertureElementKeyColorDidInvalidateNotification" object:0 userInfo:v15];
  }
}

- (NSString)elementIdentifier
{
  if (self->_style) {
    return (NSString *)@"Flashlight Unavailable";
  }
  else {
    return (NSString *)@"Flashlight";
  }
}

- (BOOL)isMinimalPresentationPossible
{
  return 1;
}

- (BOOL)isProvidedViewConcentric:(id)a3 inLayoutMode:(int64_t)a4
{
  leadingPackageViewProvider = self->_leadingPackageViewProvider;
  id v5 = a3;
  id v6 = [(SBUISystemApertureCAPackageContentProvider *)leadingPackageViewProvider providedView];

  return v6 == v5;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)result maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  CGFloat top = result.top;
  if (a3 == 3)
  {
    CGFloat trailing = a5.trailing;
    CGFloat leading = a5.leading;
    v9 = [(SBSystemApertureProvidedContentElement *)self layoutHost];
    objc_msgSend(v9, "edgeOutsetsForSize:", 1.79769313e308, self->_expandedHeight);
    CGFloat bottom = v10;

    result.CGFloat leading = leading;
    result.CGFloat trailing = trailing;
  }
  else
  {
    CGFloat bottom = result.bottom;
  }
  double v12 = top;
  double v13 = bottom;
  result.CGFloat bottom = v13;
  result.CGFloat top = v12;
  return result;
}

- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3
{
  id v44 = a3;
  int64_t v4 = [(SBSystemApertureProvidedContentElement *)self layoutMode];
  id v5 = [(SBFlashlightElement *)self expandedLeadingPackageButton];
  id v6 = v5;
  double v7 = 1.0;
  if (v4 == 3)
  {
    id v8 = [v5 superview];

    if (v8)
    {
      uint64_t v9 = [v44 effectiveUserInterfaceLayoutDirection];
      [v44 bounds];
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      CGFloat v17 = v16;
      v18 = [v44 traitCollection];
      [v18 displayScale];

      v19 = [(SBFlashlightElement *)self expandedLeadingPackageButton];
      [v19 intrinsicContentSize];
      double v21 = v20;

      v46.origin.x = v11;
      CGFloat v43 = v13;
      v46.origin.y = v13;
      v46.size.width = v15;
      v46.size.height = v17;
      CGRectGetHeight(v46);
      UIRoundToScale();
      double v23 = v22;
      if (v9 == 1)
      {
        v47.origin.x = v11;
        v47.size.width = v15;
        v47.origin.y = v13;
        v47.size.height = v17;
        CGRectGetWidth(v47);
      }
      BSPointRoundForScale();
      objc_msgSend(v6, "setFrame:");
      v24 = [(SBFlashlightElement *)self expandedTrailingLabel];
      double v25 = v23 + v21 + v23;
      v48.origin.x = v11;
      v48.origin.y = v13;
      v48.size.width = v15;
      v48.size.height = v17;
      CGRectGetHeight(v48);
      CGFloat v26 = v11;
      v27 = [v24 font];
      [v27 lineHeight];
      UIFloorToScale();
      double v29 = v28;

      v49.origin.x = v11;
      v49.origin.y = v13;
      v49.size.width = v15;
      v49.size.height = v17;
      double rect_16 = v25;
      double v30 = CGRectGetWidth(v49) - v23 - v29 - v25;
      CGFloat rect = v26;
      v50.origin.x = v26;
      v50.origin.y = v13;
      v50.size.width = v15;
      v50.size.height = v17;
      double v31 = CGRectGetHeight(v50) - self->_sensorObstructionHeight + -12.0;
      objc_msgSend(v24, "sizeThatFits:", v30, v31);
      BSSizeCeilForScale();
      if (v30 - v32 <= 0.0) {
        double v33 = v30;
      }
      else {
        double v33 = v32;
      }
      double v7 = 0.0;
      if (v30 - v32 <= 0.0) {
        double v34 = 0.0;
      }
      else {
        double v34 = v30 - v32;
      }
      if (v9 != 1)
      {
        v51.origin.x = rect;
        v51.size.width = v15;
        v51.origin.y = v43;
        v51.size.height = v17;
        double v29 = CGRectGetWidth(v51) - v33 - v29;
      }
      [(SBFlashlightElement *)self _layoutHuggingObstructionForLabel:v24 x:v29 width:v33 maxLabelHeight:v31];
      v35 = [(SBFlashlightElement *)self expandedTitleLabel];
      double v36 = v23 + v33 + v29;
      if (v9 != 1) {
        double v36 = rect_16;
      }
      [(SBFlashlightElement *)self _layoutHuggingObstructionForLabel:v35 x:v36 width:v34 maxLabelHeight:v31];
    }
    else
    {
      double v7 = 0.0;
    }
  }
  v37 = [(SBFlashlightElement *)self leadingPackageViewProvider];
  v38 = [v37 providedView];
  [v38 setAlpha:v7];

  v39 = [(SBFlashlightElement *)self trailingTextProvider];
  v40 = [v39 providedView];
  [v40 setAlpha:v7];
}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a4;
  id v10 = a5;
  if ([(SBSystemApertureProvidedContentElement *)self layoutMode] == 3)
  {
    [(SBFlashlightElement *)self _configureCustomViewsIfNecessary];
    CGFloat v11 = [(SBFlashlightElement *)self expandedLeadingPackageButton];
    [v9 addSubview:v11];

    double v12 = [(SBFlashlightElement *)self expandedTitleLabel];
    [v9 addSubview:v12];

    CGFloat v13 = [(SBFlashlightElement *)self expandedTrailingLabel];
    [v9 addSubview:v13];
  }
  v14.receiver = self;
  v14.super_class = (Class)SBFlashlightElement;
  -[SBSystemApertureProvidedContentElement contentProviderWillTransitionToSize:inContainerView:transitionCoordinator:](&v14, sel_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator_, v9, v10, width, height);
}

- (UIColor)keyColor
{
  return (UIColor *)[(SBFlashlightElement *)self _textColorForState:self->_state];
}

- (BOOL)overridesConcentricPaddingForView:(id)a3 inLayoutMode:(int64_t)a4
{
  leadingPackageViewProvider = self->_leadingPackageViewProvider;
  id v5 = a3;
  id v6 = [(SBUISystemApertureCAPackageContentProvider *)leadingPackageViewProvider providedView];

  return v6 == v5;
}

- (double)concentricPaddingOverrideForView:(id)a3 inLayoutMode:(int64_t)a4
{
  return 0.0;
}

- (id)_trailingTextForState:(unint64_t)a3
{
  if (a3 == 1)
  {
    v3 = [MEMORY[0x1E4F28B50] mainBundle];
    int64_t v4 = v3;
    id v5 = @"FLASHLIGHT_ON";
    goto LABEL_5;
  }
  if (!a3)
  {
    v3 = [MEMORY[0x1E4F28B50] mainBundle];
    int64_t v4 = v3;
    id v5 = @"FLASHLIGHT_OFF";
LABEL_5:
    id v6 = [v3 localizedStringForKey:v5 value:&stru_1F3084718 table:@"SpringBoard"];

    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:
  return v6;
}

- (id)_textColorForState:(unint64_t)a3
{
  if (a3 == 2)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x1E4F428B8], "sbui_inactiveColor");
    self = (SBFlashlightElement *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if (a3 != 1)
  {
    if (a3) {
      goto LABEL_6;
    }
    goto LABEL_4;
  }
  self = [MEMORY[0x1E4F428B8] colorWithRed:0.835294118 green:0.823529412 blue:1.0 alpha:1.0];
LABEL_6:
  return self;
}

- (id)_titleTextForStyle:(unint64_t)a3
{
  if (a3 == 1)
  {
    int64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = v4;
    id v6 = @"FLASHLIGHT_UNAVAILABLE_TITLE";
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    int64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
    id v5 = v4;
    id v6 = @"FLASHLIGHT_TITLE";
  }
  v3 = [v4 localizedStringForKey:v6 value:&stru_1F3084718 table:@"SpringBoard"];

LABEL_6:
  return v3;
}

- (id)_titleColorForStyle:(unint64_t)a3
{
  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x1E4F428B8], "sbui_inactiveColor");
    self = (SBFlashlightElement *)objc_claimAutoreleasedReturnValue();
  }
  else if (!a3)
  {
    self = [MEMORY[0x1E4F428B8] whiteColor];
  }
  return self;
}

- (void)_configureCustomViewsIfNecessary
{
  p_expandedLeadingPackageButton = &self->_expandedLeadingPackageButton;
  if (!self->_expandedLeadingPackageButton)
  {
    unint64_t state = self->_state;
    unint64_t style = self->_style;
    id v6 = objc_alloc(MEMORY[0x1E4FA7D68]);
    double v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v8 = (void *)[v6 initWithPackageName:@"Flashlight-Leading-Expanded-D83" inBundle:v7];

    objc_msgSend(v8, "setIntrinsicPackageSize:", 73.3333333, 73.3333333);
    objc_initWeak(&location, self);
    id v9 = objc_alloc(MEMORY[0x1E4FA7D60]);
    id v10 = @"OFF";
    if (state == 1) {
      id v10 = @"ON";
    }
    if (state == 2) {
      id v10 = @"unavailable";
    }
    CGFloat v11 = v10;
    double v12 = (void *)MEMORY[0x1E4F426E8];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __55__SBFlashlightElement__configureCustomViewsIfNecessary__block_invoke;
    v31[3] = &unk_1E6AF9818;
    objc_copyWeak(&v32, &location);
    CGFloat v13 = [v12 actionWithHandler:v31];
    objc_super v14 = (void *)[v9 initWithPackageProvider:v8 state:v11 primaryAction:v13];

    objc_storeStrong((id *)p_expandedLeadingPackageButton, v14);
    CGFloat v15 = (void *)MEMORY[0x1E4F42F80];
    double v16 = SBUISystemApertureDefaultContentSizeCategory();
    CGFloat v17 = [v15 traitCollectionWithPreferredContentSizeCategory:v16];

    v18 = objc_msgSend(MEMORY[0x1E4F42A30], "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 0, v17);
    id v19 = objc_alloc(MEMORY[0x1E4F42B38]);
    double v20 = *MEMORY[0x1E4F1DB28];
    double v21 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v22 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v23 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v24 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E4F1DB28], v21, v22, v23);
    double v25 = [(SBFlashlightElement *)self _titleTextForStyle:style];
    [v24 setText:v25];

    CGFloat v26 = [(SBFlashlightElement *)self _titleColorForStyle:style];
    [v24 setTextColor:v26];

    [v24 setFont:v18];
    objc_storeStrong((id *)&self->_expandedTitleLabel, v24);
    v27 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v20, v21, v22, v23);
    double v28 = [(SBFlashlightElement *)self _trailingTextForState:state];
    [(UILabel *)v27 setText:v28];

    double v29 = [(SBFlashlightElement *)self _textColorForState:state];
    [(UILabel *)v27 setTextColor:v29];

    [(UILabel *)v27 setFont:v18];
    expandedTrailingLabel = self->_expandedTrailingLabel;
    self->_expandedTrailingLabel = v27;

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
}

void __55__SBFlashlightElement__configureCustomViewsIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleExpandedLeadingButtonAction];
}

- (void)_layoutHuggingObstructionForLabel:(id)a3 x:(double)a4 width:(double)a5 maxLabelHeight:(double)a6
{
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  id v11 = a3;
  objc_msgSend(v11, "setFrame:", a4, v9, a5, a6);
  id v10 = [v11 traitCollection];
  [v10 displayScale];

  [v11 _tightBoundingRectOfFirstLine];
  UICeilToScale();
  BSRectRoundForScale();
  objc_msgSend(v11, "setFrame:");
}

- (SBUISystemApertureCAPackageContentProvider)leadingPackageViewProvider
{
  return self->_leadingPackageViewProvider;
}

- (SBUISystemApertureTextContentProvider)trailingTextProvider
{
  return self->_trailingTextProvider;
}

- (SBUISystemApertureCAPackageButton)expandedLeadingPackageButton
{
  return self->_expandedLeadingPackageButton;
}

- (UILabel)expandedTitleLabel
{
  return self->_expandedTitleLabel;
}

- (UILabel)expandedTrailingLabel
{
  return self->_expandedTrailingLabel;
}

- (unint64_t)style
{
  return self->_style;
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedTrailingLabel, 0);
  objc_storeStrong((id *)&self->_expandedTitleLabel, 0);
  objc_storeStrong((id *)&self->_expandedLeadingPackageButton, 0);
  objc_storeStrong((id *)&self->_trailingTextProvider, 0);
  objc_storeStrong((id *)&self->_leadingPackageViewProvider, 0);
}

@end