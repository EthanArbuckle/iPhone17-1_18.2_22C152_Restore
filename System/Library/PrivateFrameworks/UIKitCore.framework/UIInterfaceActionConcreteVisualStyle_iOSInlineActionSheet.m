@interface UIInterfaceActionConcreteVisualStyle_iOSInlineActionSheet
- (CGSize)minimumActionContentSize;
- (UIEdgeInsets)contentMargin;
- (double)_actionTitleFontSize;
- (double)horizontalImageContentSpacing;
- (double)verticalImageContentSpacing;
- (id)_preferredActionFont;
- (id)_regularActionFont;
- (id)newActionBackgroundViewForViewState:(id)a3;
- (id)newGroupBackgroundViewWithGroupViewState:(id)a3;
@end

@implementation UIInterfaceActionConcreteVisualStyle_iOSInlineActionSheet

- (CGSize)minimumActionContentSize
{
  double v2 = 62.0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (UIEdgeInsets)contentMargin
{
  double v3 = [(id)UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIInterfaceActionConcreteVisualStyle_iOSInlineActionSheet;
    [(UIInterfaceActionConcreteVisualStyle_iOSSheet *)&v9 contentMargin];
  }
  else
  {
    double v6 = 23.0;
    double v5 = 12.0;
    double v7 = 12.0;
    double v8 = 23.0;
  }
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (double)horizontalImageContentSpacing
{
  return 12.0;
}

- (double)verticalImageContentSpacing
{
  return 12.0;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  if (![a3 isHighlighted]) {
    return 0;
  }
  double v3 = [_UIAlertControlleriOSHighlightedBackgroundView alloc];
  return [(_UIAlertControlleriOSHighlightedBackgroundView *)v3 initWithStyle:0];
}

- (id)newGroupBackgroundViewWithGroupViewState:(id)a3
{
  inlineBackgroundView = self->_inlineBackgroundView;
  if (!inlineBackgroundView)
  {
    double v5 = [[_UIDimmingKnockoutBackdropView alloc] initWithStyle:2];
    double v6 = self->_inlineBackgroundView;
    self->_inlineBackgroundView = v5;

    inlineBackgroundView = self->_inlineBackgroundView;
  }
  return inlineBackgroundView;
}

- (double)_actionTitleFontSize
{
  v11[11] = *MEMORY[0x1E4F143B8];
  v10[0] = @"UICTContentSizeCategoryXS";
  v10[1] = @"UICTContentSizeCategoryS";
  v11[0] = &unk_1ED3F1AB8;
  v11[1] = &unk_1ED3F1AB8;
  v10[2] = @"UICTContentSizeCategoryM";
  v10[3] = @"UICTContentSizeCategoryL";
  v11[2] = &unk_1ED3F1AB8;
  v11[3] = &unk_1ED3F1AB8;
  v10[4] = @"UICTContentSizeCategoryXL";
  v10[5] = @"UICTContentSizeCategoryXXL";
  v11[4] = &unk_1ED3F1A38;
  v11[5] = &unk_1ED3F1AC8;
  v10[6] = @"UICTContentSizeCategoryAccessibilityM";
  v10[7] = @"UICTContentSizeCategoryAccessibilityL";
  v11[6] = &unk_1ED3F1A68;
  v11[7] = &unk_1ED3F1A78;
  v10[8] = @"UICTContentSizeCategoryAccessibilityXL";
  v10[9] = @"UICTContentSizeCategoryAccessibilityXXL";
  v11[8] = &unk_1ED3F1A88;
  v11[9] = &unk_1ED3F1A98;
  v10[10] = @"UICTContentSizeCategoryAccessibilityXXXL";
  v11[10] = &unk_1ED3F1AA8;
  double v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:11];
  double v3 = (void *)UIApp;
  id v4 = v2;
  double v5 = [v3 preferredContentSizeCategory];
  double v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    [v6 floatValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 22.0;
  }

  return v8;
}

- (id)_regularActionFont
{
  [(UIInterfaceActionConcreteVisualStyle_iOSInlineActionSheet *)self _actionTitleFontSize];
  return (id)objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
}

- (id)_preferredActionFont
{
  [(UIInterfaceActionConcreteVisualStyle_iOSInlineActionSheet *)self _actionTitleFontSize];
  return (id)objc_msgSend(off_1E52D39B8, "boldSystemFontOfSize:");
}

- (void).cxx_destruct
{
}

@end