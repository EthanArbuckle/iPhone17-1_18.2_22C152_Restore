@interface UIInterfaceActionConcreteVisualStyle_iOS
- (BOOL)selectByIndirectPointerTouchRequired;
- (BOOL)selectionFeedbackEnabled;
- (UIEdgeInsets)contentMargin;
- (double)contentCornerRadius;
- (double)horizontalImageContentSpacing;
- (double)verticalImageContentSpacing;
- (id)_highlightedView;
- (id)_preferredActionFont;
- (id)_regularActionFont;
- (id)actionTitleLabelColorForViewState:(id)a3;
- (id)actionTitleLabelFontForViewState:(id)a3;
- (id)defaultScreen;
- (id)newActionBackgroundViewForViewState:(id)a3;
- (id)newActionSeparatorViewForGroupViewState:(id)a3;
- (id)newGroupBackgroundViewWithGroupViewState:(id)a3;
- (id)newSectionSeparatorViewForGroupViewState:(id)a3;
@end

@implementation UIInterfaceActionConcreteVisualStyle_iOS

- (id)defaultScreen
{
  return +[UIScreen mainScreen];
}

- (double)contentCornerRadius
{
  return 13.0;
}

- (UIEdgeInsets)contentMargin
{
  v2 = [(id)UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);

  if (IsAccessibilityCategory)
  {
    v4 = +[UIFontMetrics metricsForTextStyle:@"UICTFontTextStyleBody"];
    [v4 scaledValueForValue:11.0];
    double v6 = v5;

    double v7 = 16.0;
    double v8 = 16.0;
  }
  else
  {
    double v6 = 12.0;
    double v7 = 12.0;
    double v8 = 12.0;
  }
  double v9 = v6;
  double v10 = v6;
  result.right = v8;
  result.bottom = v10;
  result.left = v7;
  result.top = v9;
  return result;
}

- (double)horizontalImageContentSpacing
{
  return 12.0;
}

- (double)verticalImageContentSpacing
{
  return 6.0;
}

- (BOOL)selectionFeedbackEnabled
{
  return 1;
}

- (BOOL)selectByIndirectPointerTouchRequired
{
  return [(id)UIApp _supportsIndirectInputEvents];
}

- (id)actionTitleLabelFontForViewState:(id)a3
{
  if ([a3 isPreferred]) {
    [(UIInterfaceActionConcreteVisualStyle_iOS *)self _preferredActionFont];
  }
  else {
  v4 = [(UIInterfaceActionConcreteVisualStyle_iOS *)self _regularActionFont];
  }
  return v4;
}

- (id)actionTitleLabelColorForViewState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 action];
  unint64_t v5 = [v4 type];

  if (v5 >= 2)
  {
    if (v5 == 2)
    {
      id v4 = +[UIColor systemRedColor];
      goto LABEL_14;
    }
    if (v5 != 100) {
      goto LABEL_14;
    }
  }
  double v6 = [v3 tintColor];
  double v7 = +[UIColor systemBlueColor];
  id v4 = v6;
  id v8 = v7;
  if (v4 == v8)
  {

    goto LABEL_10;
  }
  double v9 = v8;
  if (!v4 || !v8)
  {

    goto LABEL_13;
  }
  int v10 = [v4 isEqual:v8];

  if (v10)
  {
LABEL_10:
    +[UIColor _systemBlueColor2];
    double v9 = v4;
    id v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:
  }
LABEL_14:

  return v4;
}

- (id)_highlightedView
{
  v2 = [[_UIAlertControlleriOSHighlightedBackgroundView alloc] initWithStyle:0];
  return v2;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  if (![a3 isHighlighted]) {
    return 0;
  }
  [(UIInterfaceActionConcreteVisualStyle_iOS *)self _highlightedView];
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)newGroupBackgroundViewWithGroupViewState:(id)a3
{
  id v3 = [_UIDimmingKnockoutBackdropView alloc];
  return [(_UIDimmingKnockoutBackdropView *)v3 initWithStyle:0];
}

- (id)newActionSeparatorViewForGroupViewState:(id)a3
{
  return (id)objc_opt_new();
}

- (id)newSectionSeparatorViewForGroupViewState:(id)a3
{
  return (id)objc_opt_new();
}

- (id)_regularActionFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
}

- (id)_preferredActionFont
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
}

@end