@interface STUIStatusBarVisualProvider_Fallback
+ (BOOL)requiresIterativeOverflowLayout;
+ (BOOL)scalesWithScreenNativeScale;
+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3;
- (BOOL)supportsIndirectPointerTouchActions;
- (NSArray)placements;
- (STUIStatusBar)statusBar;
- (UIFont)clockFont;
- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3;
- (id)setupInContainerView:(id)a3;
- (id)styleAttributesForStyle:(int64_t)a3;
- (void)setPlacements:(id)a3;
- (void)setStatusBar:(id)a3;
@end

@implementation STUIStatusBarVisualProvider_Fallback

- (BOOL)supportsIndirectPointerTouchActions
{
  return 0;
}

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4FB30D8];
  double v4 = 40.0;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)scalesWithScreenNativeScale
{
  return 0;
}

+ (BOOL)requiresIterativeOverflowLayout
{
  return 0;
}

- (UIFont)clockFont
{
  return 0;
}

- (id)setupInContainerView:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  v5 = [v3 array];
  v6 = [[STUIStatusBarRegion alloc] initWithIdentifier:@"main"];
  v7 = objc_alloc_init(STUIStatusBarRegionAxesLayout);
  v8 = objc_alloc_init(STUIStatusBarRegionAxisStackingLayout);
  [(STUIStatusBarRegionAxisStackingLayout *)v8 setAlignment:3];
  [(STUIStatusBarRegionAxisStackingLayout *)v8 setInterspace:6.0];
  [(STUIStatusBarRegionAxesLayout *)v7 setHorizontalLayout:v8];

  v9 = +[STUIStatusBarRegionAxisAligningLayout aligningLayoutWithAlignment:1];
  [(STUIStatusBarRegionAxesLayout *)v7 setVerticalLayout:v9];

  [(STUIStatusBarRegion *)v6 setLayout:v7];
  id v10 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v12 = [MEMORY[0x1E4FB1618] systemRedColor];
  v13 = [v12 colorWithAlphaComponent:0.75];
  [v11 setBackgroundColor:v13];

  [(STUIStatusBarRegion *)v6 setContentView:v11];
  v14 = [(STUIStatusBarRegion *)v6 layoutItem];
  v15 = [v14 topAnchor];
  v16 = [v4 topAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  [v5 addObject:v17];

  v18 = [(STUIStatusBarRegion *)v6 layoutItem];
  v19 = [v18 bottomAnchor];
  v20 = [v4 bottomAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [v5 addObject:v21];

  v22 = [(STUIStatusBarRegion *)v6 layoutItem];
  v23 = [v22 leadingAnchor];
  v24 = [v4 leadingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  [v5 addObject:v25];

  v26 = [(STUIStatusBarRegion *)v6 layoutItem];
  v27 = [v26 trailingAnchor];
  v28 = [v4 trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  [v5 addObject:v29];

  v30 = [(STUIStatusBarRegion *)v6 layoutItem];
  objc_msgSend(v4, "_ui_addSubLayoutItem:", v30);

  [MEMORY[0x1E4F28DC8] activateConstraints:v5];
  v33[0] = v6;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];

  return v31;
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  placements = self->_placements;
  if (!placements)
  {
    v5 = +[STUIStatusBarDisplayItemPlacement spacerPlacementWithSize:priority:](STUIStatusBarDisplayItemPlacement, "spacerPlacementWithSize:priority:", 99, 3.0, 0.0);
    v11[0] = v5;
    v6 = +[STUIStatusBarItem defaultDisplayIdentifier];
    v7 = +[STUIStatusBarDisplayItemPlacement placementWithIdentifier:v6 priority:100];
    v11[1] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    v9 = self->_placements;
    self->_placements = v8;

    placements = self->_placements;
  }
  return placements;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  id v4 = [(STUIStatusBarVisualProvider_Fallback *)self statusBar];
  v5 = +[STUIStatusBarStyleAttributes styleAttributesForStatusBar:v4 style:a3];

  v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:8.0];
  [v5 setFont:v6];

  v7 = [MEMORY[0x1E4FB1618] whiteColor];
  [v5 setTextColor:v7];

  return v5;
}

- (STUIStatusBar)statusBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  return (STUIStatusBar *)WeakRetained;
}

- (void)setStatusBar:(id)a3
{
}

- (NSArray)placements
{
  return self->_placements;
}

- (void)setPlacements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placements, 0);
  objc_destroyWeak((id *)&self->_statusBar);
}

@end