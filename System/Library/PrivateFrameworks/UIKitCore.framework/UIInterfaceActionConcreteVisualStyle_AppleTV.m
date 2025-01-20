@interface UIInterfaceActionConcreteVisualStyle_AppleTV
- (BOOL)selectByPressGestureRequired;
- (CGSize)minimumActionContentSize;
- (UIEdgeInsets)actionSequenceEdgeInsets;
- (UIEdgeInsets)contentMargin;
- (double)actionSectionSpacing;
- (double)contentCornerRadius;
- (double)horizontalImageContentSpacing;
- (double)verticalImageContentSpacing;
- (id)actionImageViewTintColorForImageProperty:(id)a3 actionViewState:(id)a4;
- (id)actionPropertiesAffectingActionRepresentationViewStyling;
- (id)actionPropertiesAffectingLabelStyling;
- (id)actionTitleLabelColorForViewState:(id)a3;
- (id)actionTitleLabelFontForViewState:(id)a3;
- (id)actionViewStateForAttachingToActionRepresentationView:(id)a3;
- (id)defaultScreen;
- (id)newActionBackgroundViewForViewState:(id)a3;
- (id)newGroupBackgroundViewWithGroupViewState:(id)a3;
- (void)configureAttributesForActionRepresentationView:(id)a3 actionViewState:(id)a4;
- (void)configureAttributesForActionScrollView:(id)a3 groupViewState:(id)a4;
- (void)configureAttributesForTitleLabel:(id)a3 classificationLabel:(id)a4 actionViewState:(id)a5;
@end

@implementation UIInterfaceActionConcreteVisualStyle_AppleTV

- (id)actionViewStateForAttachingToActionRepresentationView:(id)a3
{
  id v3 = a3;
  v4 = [[_UIInterfaceActionRepresentationViewContext_AppleTV alloc] initWithHighlightTransformTargetView:v3];

  return v4;
}

- (id)defaultScreen
{
  return +[UIScreen mainScreen];
}

- (double)contentCornerRadius
{
  return 0.0;
}

- (UIEdgeInsets)contentMargin
{
  +[_UIAlertControllerTVBackgroundView backgroundInsetAmount];
  double v3 = v2 + 40.0;
  double v4 = 12.0;
  double v5 = 12.0;
  double v6 = v3;
  result.right = v6;
  result.bottom = v5;
  result.left = v3;
  result.top = v4;
  return result;
}

- (double)horizontalImageContentSpacing
{
  return 38.0;
}

- (double)verticalImageContentSpacing
{
  return 6.0;
}

- (double)actionSectionSpacing
{
  return 39.0;
}

- (UIEdgeInsets)actionSequenceEdgeInsets
{
  +[_UIAlertControllerTVBackgroundView backgroundInsetAmount];
  double v3 = v2 + 5.0;
  double v4 = 50.0;
  double v5 = 0.0;
  double v6 = v3;
  result.right = v6;
  result.bottom = v4;
  result.left = v3;
  result.top = v5;
  return result;
}

- (CGSize)minimumActionContentSize
{
  double v2 = 80.0;
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
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
}

- (id)actionTitleLabelColorForViewState:(id)a3
{
  id v4 = a3;
  double v5 = [v4 action];
  unint64_t v6 = [v5 type];
  if (v6 < 2 || v6 == 100)
  {
    if ([v5 isEnabled])
    {
      if ([v4 isHighlighted]) {
        +[UIColor blackColor];
      }
      else {
      uint64_t v7 = [v4 tintColor];
      }
    }
    else
    {
      uint64_t v7 = +[UIColor colorWithWhite:1.0 alpha:0.3];
    }
  }
  else
  {
    if (v6 != 2) {
      goto LABEL_12;
    }
    uint64_t v7 = +[UIColor whiteColor];
  }
  double v3 = (void *)v7;
LABEL_12:

  return v3;
}

- (id)actionImageViewTintColorForImageProperty:(id)a3 actionViewState:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [v5 action];
  uint64_t v7 = [v6 _titleTextColor];
  v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v9 = [(UIInterfaceActionConcreteVisualStyle_AppleTV *)self actionTitleLabelColorForViewState:v5];
  }
  v10 = v9;

  return v10;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  double v3 = [a3 action];
  id v4 = objc_alloc_init(_UIAlertControllerTVBackgroundView);
  [(_UIAlertControllerTVBackgroundView *)v4 _setContinuousCornerRadius:4.5];
  if ([v3 type] == 2)
  {
    id v5 = +[UIColor colorWithRed:0.968627451 green:0.149019608 blue:0.17254902 alpha:1.0];
    [(UIView *)v4 setTintColor:v5];

    [(_UIAlertControllerTVBackgroundView *)v4 setAlpha:0 forState:0.4];
    [(_UIAlertControllerTVBackgroundView *)v4 setAlpha:4 forState:0.3];
  }
  [(_UIAlertControllerTVBackgroundView *)v4 setShouldUseTintColorAsBackgroundColor:1];

  return v4;
}

- (id)newGroupBackgroundViewWithGroupViewState:(id)a3
{
  return objc_alloc_init(_UIAlertControllerTVBackgroundView);
}

- (id)actionPropertiesAffectingLabelStyling
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1ED0EA220;
  double v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)configureAttributesForTitleLabel:(id)a3 classificationLabel:(id)a4 actionViewState:(id)a5
{
  id v7 = a3;
  uint64_t v6 = [a5 isFocused];
  [v7 setMarqueeEnabled:v6];
  [v7 setMarqueeRunning:v6];
}

- (id)actionPropertiesAffectingActionRepresentationViewStyling
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = 0x1ED0EA240;
  double v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (void)configureAttributesForActionRepresentationView:(id)a3 actionViewState:(id)a4
{
  id v4 = a4;
  id v6 = [v4 actionViewStateContext];
  objc_msgSend(v6, "setHighlighted:", objc_msgSend(v4, "isHighlighted"));
  uint64_t v5 = [v4 isPressed];

  [v6 setPressed:v5];
}

- (void)configureAttributesForActionScrollView:(id)a3 groupViewState:(id)a4
{
  id v4 = a3;
  objc_msgSend(v4, "setLayoutMargins:", 0.0, 25.0, 0.0, 25.0);
  objc_msgSend(v4, "_setGradientMaskInsets:", 50.0, 0.0, 50.0, 0.0);
}

@end