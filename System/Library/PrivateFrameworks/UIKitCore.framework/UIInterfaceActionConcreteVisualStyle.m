@interface UIInterfaceActionConcreteVisualStyle
- (BOOL)allowsZeroSizedSectionSeparators;
- (BOOL)selectByIndirectPointerTouchRequired;
- (BOOL)selectByPressGestureRequired;
- (BOOL)selectionFeedbackEnabled;
- (CGSize)maximumActionGroupContentSize;
- (CGSize)minimumActionContentSize;
- (UIEdgeInsets)actionSequenceEdgeInsets;
- (UIEdgeInsets)contentMargin;
- (double)actionSectionSpacing;
- (double)actionSpacingForGroupViewState:(id)a3;
- (double)actionTitleLabelMinimumScaleFactor;
- (double)contentCornerRadius;
- (double)horizontalImageContentSpacing;
- (double)verticalImageContentSpacing;
- (id)actionGroupPropertiesAffectingActionsScrollViewStyling;
- (id)actionImageViewTintColorForImageProperty:(id)a3 actionViewState:(id)a4;
- (id)actionPropertiesAffectingActionRepresentationViewStyling;
- (id)actionPropertiesAffectingImageViewStyling;
- (id)actionPropertiesAffectingLabelStyling;
- (id)actionTitleLabelColorForViewState:(id)a3;
- (id)actionTitleLabelCompositingFilterForViewState:(id)a3;
- (id)actionTitleLabelFontForViewState:(id)a3;
- (id)actionViewStateForAttachingToActionRepresentationView:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultScreen;
- (id)newActionBackgroundViewForViewState:(id)a3;
- (id)newActionSeparatorViewForGroupViewState:(id)a3;
- (id)newGroupBackgroundViewWithGroupViewState:(id)a3;
- (id)newRepresentationViewForAction:(id)a3;
- (id)newSectionSeparatorViewForGroupViewState:(id)a3;
@end

@implementation UIInterfaceActionConcreteVisualStyle

id __109__UIInterfaceActionConcreteVisualStyle_ModernAppleTV__vibrancyStyleColorForUnfocusedTitleLabelWithTintColor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 userInterfaceStyle];
  if (v4 == 1000 || v4 == 2) {
    +[UIColor labelColor];
  }
  else {
  v6 = +[UIColor secondaryLabelColor];
  }
  id v7 = v6;

  v8 = [v7 resolvedColorWithTraitCollection:v3];

  v9 = [*(id *)(a1 + 32) resolvedColorWithTraitCollection:v3];

  [v8 alphaComponent];
  v10 = objc_msgSend(v9, "colorWithAlphaComponent:");

  return v10;
}

uint64_t __85__UIInterfaceActionConcreteVisualStyle_iOSSheet_newActionBackgroundViewForViewState___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = [*(id *)(a1 + 40) isHighlighted];
  return [v1 setHighlighted:v2];
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  return (id)objc_opt_new();
}

- (id)defaultScreen
{
  return +[UIScreen mainScreen];
}

- (CGSize)maximumActionGroupContentSize
{
  uint64_t v2 = [(UIInterfaceActionConcreteVisualStyle *)self defaultScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)contentCornerRadius
{
  return 0.0;
}

- (UIEdgeInsets)contentMargin
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)minimumActionContentSize
{
  double v2 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)horizontalImageContentSpacing
{
  return 0.0;
}

- (double)verticalImageContentSpacing
{
  return 0.0;
}

- (BOOL)allowsZeroSizedSectionSeparators
{
  return 0;
}

- (double)actionSectionSpacing
{
  return 0.0;
}

- (UIEdgeInsets)actionSequenceEdgeInsets
{
  double v2 = 0.0;
  double v3 = 0.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)selectByPressGestureRequired
{
  return 1;
}

- (BOOL)selectionFeedbackEnabled
{
  return 0;
}

- (BOOL)selectByIndirectPointerTouchRequired
{
  return 0;
}

- (double)actionTitleLabelMinimumScaleFactor
{
  return 0.58;
}

- (id)actionViewStateForAttachingToActionRepresentationView:(id)a3
{
  return 0;
}

- (id)newGroupBackgroundViewWithGroupViewState:(id)a3
{
  return 0;
}

- (id)newActionSeparatorViewForGroupViewState:(id)a3
{
  return 0;
}

- (id)newSectionSeparatorViewForGroupViewState:(id)a3
{
  return 0;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  return 0;
}

- (id)actionTitleLabelFontForViewState:(id)a3
{
  return (id)[off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleHeadline"];
}

- (id)actionTitleLabelColorForViewState:(id)a3
{
  return +[UIColor labelColor];
}

- (id)actionTitleLabelCompositingFilterForViewState:(id)a3
{
  return 0;
}

- (id)actionImageViewTintColorForImageProperty:(id)a3 actionViewState:(id)a4
{
  return 0;
}

- (double)actionSpacingForGroupViewState:(id)a3
{
  return 0.0;
}

- (id)actionPropertiesAffectingLabelStyling
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)actionPropertiesAffectingImageViewStyling
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)actionGroupPropertiesAffectingActionsScrollViewStyling
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)actionPropertiesAffectingActionRepresentationViewStyling
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)newRepresentationViewForAction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _typeForDeterminingViewRepresentation];
  double v6 = off_1E52D5960;
  if (v5 != 100) {
    double v6 = off_1E52D5968;
  }
  double v7 = (void *)[objc_alloc(*v6) initWithAction:v4];

  double v8 = [(UIInterfaceActionConcreteVisualStyle *)self actionViewStateForAttachingToActionRepresentationView:v7];
  [v7 setActionViewStateContext:v8];

  return v7;
}

@end