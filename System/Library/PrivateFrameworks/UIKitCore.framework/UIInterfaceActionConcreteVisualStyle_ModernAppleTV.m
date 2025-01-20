@interface UIInterfaceActionConcreteVisualStyle_ModernAppleTV
- (BOOL)allowsZeroSizedSectionSeparators;
- (CGSize)minimumActionContentSize;
- (UIEdgeInsets)actionSequenceEdgeInsets;
- (UIEdgeInsets)contentMargin;
- (double)_actionBackgroundCornerRadius;
- (double)actionSectionSpacing;
- (double)actionSpacingForGroupViewState:(id)a3;
- (double)contentCornerRadius;
- (id)_vibrancyStyleColorForUnfocusedTitleLabelWithTintColor:(id)a3;
- (id)actionTitleLabelColorForViewState:(id)a3;
- (id)actionTitleLabelCompositingFilterForViewState:(id)a3;
- (id)actionTitleLabelFontForViewState:(id)a3;
- (id)actionViewStateForAttachingToActionRepresentationView:(id)a3;
- (id)newActionBackgroundViewForViewState:(id)a3;
- (id)newGroupBackgroundViewWithGroupViewState:(id)a3;
- (void)configureAttributesForActionScrollView:(id)a3 groupViewState:(id)a4;
@end

@implementation UIInterfaceActionConcreteVisualStyle_ModernAppleTV

- (id)actionViewStateForAttachingToActionRepresentationView:(id)a3
{
  id v3 = a3;
  v4 = [[_UIInterfaceActionRepresentationViewContext_AppleTV alloc] initWithHighlightTransformTargetView:v3];

  [(_UIInterfaceActionRepresentationViewContext_AppleTV *)v4 setFocusedSizeIncrease:20.0];
  return v4;
}

- (UIEdgeInsets)contentMargin
{
  double v2 = 12.0;
  double v3 = 15.0;
  double v4 = 12.0;
  double v5 = 15.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)contentCornerRadius
{
  +[_UIAlertControllerModernTVBackgroundView contentCornerRadius];
  return result;
}

- (double)_actionBackgroundCornerRadius
{
  return 16.0;
}

- (BOOL)allowsZeroSizedSectionSeparators
{
  return 1;
}

- (double)actionSectionSpacing
{
  return 0.0;
}

- (UIEdgeInsets)actionSequenceEdgeInsets
{
  +[_UIAlertControllerModernTVBackgroundView backgroundInsetAmount];
  double v3 = v2;
  +[_UIAlertControllerModernTVBackgroundView backgroundInsetAmount];
  double v5 = v4;
  double v6 = v3;
  double v7 = v5;
  double v8 = v3;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (CGSize)minimumActionContentSize
{
  double v2 = 66.0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (id)actionTitleLabelFontForViewState:(id)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleBody"];
}

- (id)actionTitleLabelColorForViewState:(id)a3
{
  id v5 = a3;
  double v6 = [v5 action];
  unint64_t v7 = [v6 type];
  if (v7 >= 2 && v7 != 100)
  {
    if (v7 != 2) {
      goto LABEL_17;
    }
    if (([v5 isHighlighted] & 1) == 0)
    {
      uint64_t v8 = +[UIColor systemRedColor];
LABEL_13:
      v12 = (void *)v8;
      double v3 = [(UIInterfaceActionConcreteVisualStyle_ModernAppleTV *)self _vibrancyStyleColorForUnfocusedTitleLabelWithTintColor:v8];

      goto LABEL_17;
    }
LABEL_9:
    uint64_t v11 = +[UIColor whiteColor];
    goto LABEL_16;
  }
  if (([v6 isEnabled] & 1) == 0)
  {
    uint64_t v11 = +[UIColor secondaryLabelColor];
    goto LABEL_16;
  }
  int v9 = [v5 isHighlighted];
  char v10 = [v5 isPreferred];
  if (v9)
  {
    if ((v10 & 1) == 0)
    {
      uint64_t v11 = +[UIColor blackColor];
      goto LABEL_16;
    }
    goto LABEL_9;
  }
  if (v10)
  {
    uint64_t v8 = [v5 tintColor];
    goto LABEL_13;
  }
  uint64_t v11 = +[UIColor labelColor];
LABEL_16:
  double v3 = (void *)v11;
LABEL_17:

  return v3;
}

- (id)_vibrancyStyleColorForUnfocusedTitleLabelWithTintColor:(id)a3
{
  id v3 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __109__UIInterfaceActionConcreteVisualStyle_ModernAppleTV__vibrancyStyleColorForUnfocusedTitleLabelWithTintColor___block_invoke;
  v7[3] = &unk_1E52DA210;
  id v8 = v3;
  id v4 = v3;
  id v5 = +[UIColor colorWithDynamicProvider:v7];

  return v5;
}

- (id)actionTitleLabelCompositingFilterForViewState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 action];
  if ([v4 type] == 2) {
    char v5 = 0;
  }
  else {
    char v5 = [v3 isPreferred] ^ 1;
  }
  id v6 = 0;
  if (([v3 isFocused] & 1) == 0 && (v5 & 1) == 0)
  {
    unint64_t v7 = [v3 traitCollection];
    uint64_t v8 = [v7 userInterfaceStyle];

    int v9 = (id *)MEMORY[0x1E4F3A2E0];
    if (v8 != 1) {
      int v9 = (id *)MEMORY[0x1E4F3A2E8];
    }
    id v6 = *v9;
  }

  return v6;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  id v4 = a3;
  char v5 = [v4 action];
  id v6 = objc_alloc_init(_UIAlertControllerModernTVActionBackgroundView);
  if ([v5 type] == 2) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = [v4 isPreferred];
  }
  [(_UIAlertControllerModernTVActionBackgroundView *)v6 setShouldUseTintColorAsHighlightColor:v7];
  [(UIInterfaceActionConcreteVisualStyle_ModernAppleTV *)self _actionBackgroundCornerRadius];
  -[_UIAlertControllerTVBackgroundView _setContinuousCornerRadius:](v6, "_setContinuousCornerRadius:");
  if ([v5 type] == 2)
  {
    uint64_t v8 = +[UIColor systemRedColor];
  }
  else
  {
    if (![v4 isPreferred])
    {
      char v10 = +[UIColor systemGray5Color];
      [(UIView *)v6 setTintColor:v10];

      [(_UIAlertControllerModernTVActionBackgroundView *)v6 setVibrantCompositing:1 forState:0];
      goto LABEL_10;
    }
    uint64_t v8 = [v4 tintColor];
  }
  int v9 = (void *)v8;
  [(UIView *)v6 setTintColor:v8];

  [(_UIAlertControllerTVBackgroundView *)v6 setAlpha:0 forState:0.2];
LABEL_10:
  [(_UIAlertControllerTVBackgroundView *)v6 setShouldUseTintColorAsBackgroundColor:1];

  return v6;
}

- (id)newGroupBackgroundViewWithGroupViewState:(id)a3
{
  return 0;
}

- (double)actionSpacingForGroupViewState:(id)a3
{
  int v3 = [a3 isVerticalLayoutAxis];
  double result = 24.0;
  if (v3) {
    return 16.0;
  }
  return result;
}

- (void)configureAttributesForActionScrollView:(id)a3 groupViewState:(id)a4
{
  v33[4] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  +[_UIAlertControllerModernTVBackgroundView backgroundInsetAmount];
  double v7 = v6;
  objc_msgSend(v5, "_setGradientMaskLengths:", 50.0, -30.0, 50.0, -30.0);
  objc_msgSend(v5, "_setGradientMaskEdgeInsets:", v7, 0.0, v7, 0.0);
  [v5 setClipsToBounds:0];
  if (objc_opt_respondsToSelector())
  {
    v32 = self;
    id v8 = +[_UIAlertControllerModernTVBackgroundView newBackgroundVisualEffectInAlertGroup];
    +[_UIAlertControllerModernTVBackgroundView platterHairlineWidth];
    double v10 = v9;
    uint64_t v11 = objc_alloc_init(UIView);
    [(UIView *)v11 addSubview:v8];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = (void *)MEMORY[0x1E4F5B268];
    v31 = [v8 topAnchor];
    v30 = [(UIView *)v11 topAnchor];
    v29 = [v31 constraintEqualToAnchor:v30 constant:v10];
    v33[0] = v29;
    v28 = [v8 bottomAnchor];
    v27 = [(UIView *)v11 bottomAnchor];
    v25 = [v28 constraintEqualToAnchor:v27 constant:-v10];
    v33[1] = v25;
    v12 = [v8 leadingAnchor];
    v13 = [(UIView *)v11 leadingAnchor];
    v14 = [v12 constraintEqualToAnchor:v13 constant:v10];
    v33[2] = v14;
    v15 = [v8 trailingAnchor];
    v16 = [(UIView *)v11 trailingAnchor];
    v17 = [v15 constraintEqualToAnchor:v16 constant:-v10];
    v33[3] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
    [v26 activateConstraints:v18];

    [(UIInterfaceActionConcreteVisualStyle_ModernAppleTV *)v32 contentCornerRadius];
    double v20 = v19 - v10;
    v21 = [v8 layer];
    [v21 setCornerRadius:v20];

    uint64_t v22 = *MEMORY[0x1E4F39EA8];
    v23 = [v8 layer];
    [v23 setCornerCurve:v22];

    v24 = [v8 layer];
    [v24 setMasksToBounds:1];

    [v5 setBackgroundView:v11];
  }
}

@end