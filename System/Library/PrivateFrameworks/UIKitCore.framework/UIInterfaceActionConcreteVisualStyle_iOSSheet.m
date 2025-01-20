@interface UIInterfaceActionConcreteVisualStyle_iOSSheet
- (CGSize)minimumActionContentSize;
- (UIEdgeInsets)contentMargin;
- (double)_systemFontSize;
- (double)actionSectionSpacing;
- (id)_preferredActionFont;
- (id)_regularActionFont;
- (id)newActionBackgroundViewForViewState:(id)a3;
@end

@implementation UIInterfaceActionConcreteVisualStyle_iOSSheet

- (UIEdgeInsets)contentMargin
{
  v3 = [(id)UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v3);

  if (IsAccessibilityCategory)
  {
    v5 = +[UIFontMetrics metricsForTextStyle:@"UICTFontTextStyleBody"];
    [v5 scaledValueForValue:8.0];
    double v7 = v6;

    double v8 = 16.0;
    double v9 = v7;
    double v10 = 16.0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)UIInterfaceActionConcreteVisualStyle_iOSSheet;
    [(UIInterfaceActionConcreteVisualStyle_iOS *)&v13 contentMargin];
    double v7 = v11;
  }
  double v12 = v7;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v12;
  return result;
}

- (CGSize)minimumActionContentSize
{
  double v2 = 57.0;
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (double)actionSectionSpacing
{
  return 8.0;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  id v4 = a3;
  v5 = [v4 action];
  if ([v5 type] == 1)
  {
    double v6 = objc_alloc_init(_UIAlertControlleriOSActionSheetCancelBackgroundView);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__UIInterfaceActionConcreteVisualStyle_iOSSheet_newActionBackgroundViewForViewState___block_invoke;
    v11[3] = &unk_1E52D9F98;
    double v7 = v6;
    double v12 = v7;
    id v13 = v4;
    +[UIView performWithoutAnimation:v11];
    double v8 = v13;
    double v9 = v7;
  }
  else if ([v4 isHighlighted])
  {
    double v9 = [(UIInterfaceActionConcreteVisualStyle_iOS *)self _highlightedView];
  }
  else
  {
    double v9 = 0;
  }

  return v9;
}

- (double)_systemFontSize
{
  v11[11] = *MEMORY[0x1E4F143B8];
  v10[0] = @"UICTContentSizeCategoryXS";
  v10[1] = @"UICTContentSizeCategoryS";
  v11[0] = &unk_1ED3F1A38;
  v11[1] = &unk_1ED3F1A38;
  v10[2] = @"UICTContentSizeCategoryM";
  v10[3] = @"UICTContentSizeCategoryL";
  v11[2] = &unk_1ED3F1A38;
  v11[3] = &unk_1ED3F1A38;
  v10[4] = @"UICTContentSizeCategoryXL";
  v10[5] = @"UICTContentSizeCategoryXXL";
  void v11[4] = &unk_1ED3F1A48;
  v11[5] = &unk_1ED3F1A58;
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
  v5 = [v3 preferredContentSizeCategory];
  double v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    [v6 floatValue];
    double v8 = v7;
  }
  else
  {
    double v8 = 24.0;
  }

  return v8;
}

- (id)_regularActionFont
{
  [(UIInterfaceActionConcreteVisualStyle_iOSSheet *)self _systemFontSize];
  return (id)objc_msgSend(off_1E52D39B8, "systemFontOfSize:");
}

- (id)_preferredActionFont
{
  [(UIInterfaceActionConcreteVisualStyle_iOSSheet *)self _systemFontSize];
  return (id)objc_msgSend(off_1E52D39B8, "boldSystemFontOfSize:");
}

@end