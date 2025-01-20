@interface UIInterfaceActionConcreteVisualStyle_CarPlay
- (BOOL)selectByPressGestureRequired;
- (CGSize)minimumActionContentSize;
- (UIEdgeInsets)contentMargin;
- (double)contentCornerRadius;
- (double)horizontalImageContentSpacing;
- (double)verticalImageContentSpacing;
- (id)_highlightedActionTitleLabelColorForViewState:(id)a3;
- (id)_normalActionTitleLabelColorForViewState:(id)a3;
- (id)_preferredActionFont;
- (id)_regularActionFont;
- (id)actionTitleLabelColorForViewState:(id)a3;
- (id)actionTitleLabelFontForViewState:(id)a3;
- (id)defaultScreen;
- (id)newActionBackgroundViewForViewState:(id)a3;
- (id)newActionSeparatorViewForGroupViewState:(id)a3;
- (id)newGroupBackgroundViewWithGroupViewState:(id)a3;
@end

@implementation UIInterfaceActionConcreteVisualStyle_CarPlay

- (id)defaultScreen
{
  return +[UIScreen _carScreen];
}

- (double)contentCornerRadius
{
  return 13.0;
}

- (UIEdgeInsets)contentMargin
{
  double v2 = 12.0;
  double v3 = 12.0;
  double v4 = 12.0;
  double v5 = 12.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
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

- (CGSize)minimumActionContentSize
{
  double v2 = 44.0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (BOOL)selectByPressGestureRequired
{
  return 1;
}

- (id)actionTitleLabelFontForViewState:(id)a3
{
  if ([a3 isPreferred]) {
    [(UIInterfaceActionConcreteVisualStyle_CarPlay *)self _preferredActionFont];
  }
  else {
  double v4 = [(UIInterfaceActionConcreteVisualStyle_CarPlay *)self _regularActionFont];
  }
  return v4;
}

- (id)actionTitleLabelColorForViewState:(id)a3
{
  id v4 = a3;
  if ([v4 isHighlighted]) {
    [(UIInterfaceActionConcreteVisualStyle_CarPlay *)self _highlightedActionTitleLabelColorForViewState:v4];
  }
  else {
  double v5 = [(UIInterfaceActionConcreteVisualStyle_CarPlay *)self _normalActionTitleLabelColorForViewState:v4];
  }

  return v5;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 action];
  char v5 = [v3 isHighlighted];

  if (v5)
  {
    v6 = off_1E52D5080;
  }
  else
  {
    if ([v4 type] != 1)
    {
      id v7 = 0;
      goto LABEL_7;
    }
    v6 = off_1E52D5088;
  }
  id v7 = objc_alloc_init(*v6);
LABEL_7:

  return v7;
}

- (id)newGroupBackgroundViewWithGroupViewState:(id)a3
{
  return objc_alloc_init(_UIAlertControllerCarBackgroundView);
}

- (id)newActionSeparatorViewForGroupViewState:(id)a3
{
  return (id)objc_opt_new();
}

- (id)_regularActionFont
{
  if (_AXSCarPlayEnhanceTextLegibilityEnabled()) {
    [off_1E52D39B8 boldSystemFontOfSize:16.0];
  }
  else {
  double v2 = [off_1E52D39B8 systemFontOfSize:16.0];
  }
  return v2;
}

- (id)_preferredActionFont
{
  return (id)[off_1E52D39B8 boldSystemFontOfSize:16.0];
}

- (id)_highlightedActionTitleLabelColorForViewState:(id)a3
{
  return +[UIColor _externalSystemDarkGrayColor];
}

- (id)_normalActionTitleLabelColorForViewState:(id)a3
{
  id v3 = a3;
  id v4 = [v3 action];
  unint64_t v5 = [v4 type];

  if (v5 >= 2)
  {
    if (v5 == 2)
    {
      uint64_t v6 = +[UIColor systemRedColor];
      goto LABEL_6;
    }
    if (v5 != 100) {
      goto LABEL_7;
    }
  }
  uint64_t v6 = [v3 tintColor];
LABEL_6:
  id v4 = (void *)v6;
LABEL_7:

  return v4;
}

@end