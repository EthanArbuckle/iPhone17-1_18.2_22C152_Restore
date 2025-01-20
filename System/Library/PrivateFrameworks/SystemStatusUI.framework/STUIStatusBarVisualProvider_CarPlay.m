@interface STUIStatusBarVisualProvider_CarPlay
+ (BOOL)requiresIterativeOverflowLayout;
+ (BOOL)scalesWithScreenNativeScale;
+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3;
+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4;
- (BOOL)expanded;
- (BOOL)showSensorActivityIndicatorWithoutPortalView;
- (BOOL)showingPill;
- (BOOL)showingSensorActivityIndicator;
- (BOOL)supportsIndirectPointerTouchActions;
- (STUIStatusBar)statusBar;
- (STUIStatusBarRegion)radarRegion;
- (STUIStatusBarRegion)timeRegion;
- (STUIStatusBarVisualProvider_CarPlay)init;
- (STUIStatusBarVisualProvider_PillRegionCoordinator)pillRegionCoordinator;
- (UIFont)clockFont;
- (double)animatedTypeDisplayItemSpacingFactorForCellularType:(int64_t)a3;
- (id)_animationForPillTime;
- (id)_animationForSensorIndicator;
- (id)_defaultScaleAnimationWithIdentifier:(id)a3;
- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)condensedFontForCellularType:(int64_t)a3 defaultFont:(id)a4 baselineOffset:(double *)a5;
- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3;
- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3;
- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4;
- (id)setupInContainerView:(id)a3;
- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4;
- (id)styleAttributesForStyle:(int64_t)a3;
- (id)willUpdateWithData:(id)a3;
- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5;
- (void)itemCreated:(id)a3;
- (void)setPillRegionCoordinator:(id)a3;
- (void)setRadarRegion:(id)a3;
- (void)setShowingPill:(BOOL)a3;
- (void)setShowingSensorActivityIndicator:(BOOL)a3;
- (void)setStatusBar:(id)a3;
- (void)setTimeRegion:(id)a3;
@end

@implementation STUIStatusBarVisualProvider_CarPlay

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v4 = a4;
  v5 = objc_opt_class();
  if (v4)
  {
    v6 = [v4 objectForKey:@"STUIStatusBarCarPlayHorizontalLayoutKey"];
    char v7 = [v6 BOOLValue];

    if (v7) {
      goto LABEL_5;
    }
    v8 = [v4 objectForKey:@"STUIStatusBarCarPlayDualLayoutDriverKey"];
    char v9 = [v8 BOOLValue];

    if ((v9 & 1) != 0
      || ([v4 objectForKey:@"STUIStatusBarCarPlayDualLayoutPassengerKey"],
          v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 BOOLValue],
          v10,
          v11))
    {
LABEL_5:
      v5 = objc_opt_class();
    }
  }
  v12 = v5;

  return v12;
}

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4FB30D8];
  double v4 = *MEMORY[0x1E4FB30D8];
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
  return 1;
}

- (UIFont)clockFont
{
  return 0;
}

- (STUIStatusBarVisualProvider_CarPlay)init
{
  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarVisualProvider_CarPlay;
  v2 = [(STUIStatusBarVisualProvider_CarPlay *)&v6 init];
  if (v2)
  {
    double v3 = objc_opt_new();
    [(STUIStatusBarVisualProvider_CarPlay *)v2 setPillRegionCoordinator:v3];

    double v4 = [(STUIStatusBarVisualProvider_CarPlay *)v2 pillRegionCoordinator];
    [v4 setVisualProvider:v2];
  }
  return v2;
}

- (BOOL)expanded
{
  return 0;
}

- (BOOL)supportsIndirectPointerTouchActions
{
  return 0;
}

- (void)itemCreated:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v8;
    [v4 setReducesFontSize:0];
    [v4 setTypeStringProvider:self];
  }
  else
  {
    v5 = [v8 identifier];
    objc_super v6 = +[STUIStatusBarItem identifier];

    if (v5 != v6) {
      goto LABEL_6;
    }
    id v7 = v8;
    objc_msgSend(v7, "setPillSize:", 15.0, 15.0);
    [v7 setPillPadding:3.0];
  }

LABEL_6:
}

- (id)stringForCellularType:(int64_t)a3 condensed:(BOOL)a4
{
  id v4 = @"􀛱";
  if (a3 != 9) {
    id v4 = 0;
  }
  if (a3 == 8) {
    id v4 = @"􀛰";
  }
  if (a4) {
    return v4;
  }
  else {
    return 0;
  }
}

- (id)condensedFontForCellularType:(int64_t)a3 defaultFont:(id)a4 baselineOffset:(double *)a5
{
  id v5 = a4;
  return v5;
}

- (double)animatedTypeDisplayItemSpacingFactorForCellularType:(int64_t)a3
{
  return 1.0;
}

- (id)styleAttributesForStyle:(int64_t)a3
{
  id v5 = [(STUIStatusBarVisualProvider_CarPlay *)self statusBar];
  objc_super v6 = +[STUIStatusBarStyleAttributes styleAttributesForStatusBar:v5 style:a3];

  if (a3 == 2)
  {
    id v7 = [MEMORY[0x1E4FB1618] blackColor];
    [v6 setTextColor:v7];

    [MEMORY[0x1E4FB1618] blackColor];
  }
  else
  {
    id v8 = [MEMORY[0x1E4FB1618] whiteColor];
    [v6 setTextColor:v8];

    [MEMORY[0x1E4FB1618] whiteColor];
  char v9 = };
  [v6 setImageTintColor:v9];

  v10 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v11 = *MEMORY[0x1E4FB28D8];
  v12 = [(STUIStatusBarVisualProvider_CarPlay *)self statusBar];
  v13 = [v12 traitCollection];
  v14 = [v10 preferredFontForTextStyle:v11 compatibleWithTraitCollection:v13];

  if (v14) {
    CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();
  }
  else {
    CopyOfSystemUIFontWithGrade = 0;
  }
  [v6 setFont:CopyOfSystemUIFontWithGrade];
  [v6 setSmallFont:CopyOfSystemUIFontWithGrade];
  v16 = (void *)MEMORY[0x1E4FB08E0];
  v17 = [(STUIStatusBarVisualProvider_CarPlay *)self statusBar];
  v18 = [v17 traitCollection];
  v19 = [v16 _preferredFontForTextStyle:v11 design:0 variant:1024 compatibleWithTraitCollection:v18];
  [v6 setEmphasizedFont:v19];

  v20 = [v6 imageTintColor];
  v21 = [v20 colorWithAlphaComponent:0.2];
  [v6 setImageDimmedTintColor:v21];

  return v6;
}

- (id)willUpdateWithData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sensorActivityEntry];
  objc_super v6 = v5;
  if (v5) {
    -[STUIStatusBarVisualProvider_CarPlay setShowingSensorActivityIndicator:](self, "setShowingSensorActivityIndicator:", [v5 isEnabled]);
  }
  id v7 = [v4 backgroundActivityEntry];
  id v8 = [(STUIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
  [v8 updateDataForBackgroundActivity:v4];

  if (v7) {
    -[STUIStatusBarVisualProvider_CarPlay setShowingPill:](self, "setShowingPill:", [v7 isEnabled]);
  }
  char v9 = [v4 radarEntry];
  v10 = v9;
  if (v9)
  {
    if ([v9 isEnabled])
    {
      uint64_t v11 = +[STUIStatusBarActivityAction actionForBackgroundActivityWithIdentifier:*MEMORY[0x1E4FA96B0]];
      v12 = [(STUIStatusBarVisualProvider_CarPlay *)self radarRegion];
      [v12 setAction:v11];
    }
    else
    {
      uint64_t v11 = [(STUIStatusBarVisualProvider_CarPlay *)self radarRegion];
      [v11 setAction:0];
    }
  }
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];

  if (v8 == v6)
  {
    v19 = [(STUIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
    v20 = [v19 animationForBackgroundActivityPillWithDuration:0.25 scale:0.25];

    goto LABEL_14;
  }
  uint64_t v9 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v10 = v6;
  if ((id)v9 == v6) {
    goto LABEL_11;
  }
  uint64_t v11 = (void *)v9;
  uint64_t v12 = +[STUIStatusBarItem defaultDisplayIdentifier];
  if ((id)v12 == v6)
  {

    v10 = v11;
LABEL_11:

    goto LABEL_12;
  }
  v13 = (void *)v12;
  id v14 = +[STUIStatusBarItem defaultDisplayIdentifier];

  if (v14 != v6)
  {
    id v15 = +[STUIStatusBarItem defaultDisplayIdentifier];

    if (v15 == v6)
    {
      id v18 = [(STUIStatusBarVisualProvider_CarPlay *)self _animationForSensorIndicator];
    }
    else
    {
      id v16 = +[STUIStatusBarTimeItem pillTimeDisplayIdentifier];

      if (v16 == v6
        || (+[STUIStatusBarTimeItem shortTimeDisplayIdentifier], id v17 = (id)objc_claimAutoreleasedReturnValue(), v17, v17 == v6))
      {
        id v18 = [(STUIStatusBarVisualProvider_CarPlay *)self _animationForPillTime];
      }
      else
      {
        id v18 = v7;
      }
    }
    goto LABEL_13;
  }
LABEL_12:
  id v18 = [(STUIStatusBarVisualProvider_CarPlay *)self _defaultScaleAnimationWithIdentifier:v6];
LABEL_13:
  v20 = v18;
LABEL_14:

  return v20;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STUIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];

  if (v8 == v6)
  {
    v19 = [(STUIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
    v20 = [v19 animationForBackgroundActivityPillWithDuration:0.25 scale:0.25];

    goto LABEL_14;
  }
  uint64_t v9 = +[STUIStatusBarItem defaultDisplayIdentifier];
  v10 = v6;
  if ((id)v9 == v6) {
    goto LABEL_11;
  }
  uint64_t v11 = (void *)v9;
  uint64_t v12 = +[STUIStatusBarItem defaultDisplayIdentifier];
  if ((id)v12 == v6)
  {

    v10 = v11;
LABEL_11:

    goto LABEL_12;
  }
  v13 = (void *)v12;
  id v14 = +[STUIStatusBarItem defaultDisplayIdentifier];

  if (v14 != v6)
  {
    id v15 = +[STUIStatusBarItem defaultDisplayIdentifier];

    if (v15 == v6)
    {
      id v18 = [(STUIStatusBarVisualProvider_CarPlay *)self _animationForSensorIndicator];
    }
    else
    {
      id v16 = +[STUIStatusBarTimeItem pillTimeDisplayIdentifier];

      if (v16 == v6
        || (+[STUIStatusBarTimeItem shortTimeDisplayIdentifier], id v17 = (id)objc_claimAutoreleasedReturnValue(), v17, v17 == v6))
      {
        id v18 = [(STUIStatusBarVisualProvider_CarPlay *)self _animationForPillTime];
      }
      else
      {
        id v18 = v7;
      }
    }
    goto LABEL_13;
  }
LABEL_12:
  id v18 = [(STUIStatusBarVisualProvider_CarPlay *)self _defaultScaleAnimationWithIdentifier:v6];
LABEL_13:
  v20 = v18;
LABEL_14:

  return v20;
}

- (void)actionable:(id)a3 highlighted:(BOOL)a4 initialPress:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v13 = a3;
  id v8 = [(STUIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
  if (([v8 handledUpdateOfActionable:v13 highlighted:v6 initialPress:v5] & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v10 = v13;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_6;
    }
    id v8 = v13;
    id v11 = [(STUIStatusBarVisualProvider_CarPlay *)self radarRegion];

    if (v11 == v8)
    {
      uint64_t v12 = [(STUIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
      [v12 updateRegion:v8 highlighted:v6 initialPress:v5 cornerRadius:8.0];
    }
  }

  v10 = v13;
LABEL_6:
}

- (id)_defaultScaleAnimationWithIdentifier:(id)a3
{
  id v4 = a3;
  CGAffineTransformMakeScale(&v7, 0.25, 0.25);
  BOOL v5 = STUIStatusBarDefaultAnimation(self, v4, (long long *)&v7, 0.25, 0.25, 0.0);

  return v5;
}

- (id)_animationForSensorIndicator
{
  double v3 = +[STUIStatusBarItem defaultDisplayIdentifier];
  CGAffineTransformMakeScale(&v6, 0.25, 0.25);
  id v4 = STUIStatusBarDefaultAnimation(self, v3, (long long *)&v6, 0.25, 0.25, 0.0);

  return v4;
}

- (id)_animationForPillTime
{
  return +[STUIStatusBarAnimationFactory fadeAnimationWithDuration:0.25 scale:0.25];
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[STUIStatusBarTimeItem pillTimeDisplayIdentifier];

  if (v5 == v4)
  {
    CGAffineTransform v6 = +[STUIStatusBarStyleAttributes overriddenStyleAttributes];
    CGAffineTransform v7 = (void *)MEMORY[0x1E4FB08E0];
    uint64_t v8 = *MEMORY[0x1E4FB28E0];
    uint64_t v9 = [(STUIStatusBarVisualProvider_CarPlay *)self statusBar];
    v10 = [v9 traitCollection];
    id v11 = [v7 _preferredFontForTextStyle:v8 design:0 variant:1024 compatibleWithTraitCollection:v10];
    [v6 setEmphasizedFont:v11];

    uint64_t v12 = [MEMORY[0x1E4FB1618] whiteColor];
    [v6 setTextColor:v12];
  }
  else
  {
    CGAffineTransform v6 = 0;
  }
  return v6;
}

- (id)setupInContainerView:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)showSensorActivityIndicatorWithoutPortalView
{
  return 1;
}

- (STUIStatusBar)statusBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  return (STUIStatusBar *)WeakRetained;
}

- (void)setStatusBar:(id)a3
{
}

- (STUIStatusBarVisualProvider_PillRegionCoordinator)pillRegionCoordinator
{
  return self->_pillRegionCoordinator;
}

- (void)setPillRegionCoordinator:(id)a3
{
}

- (STUIStatusBarRegion)timeRegion
{
  return self->_timeRegion;
}

- (void)setTimeRegion:(id)a3
{
}

- (STUIStatusBarRegion)radarRegion
{
  return self->_radarRegion;
}

- (void)setRadarRegion:(id)a3
{
}

- (BOOL)showingSensorActivityIndicator
{
  return self->_showingSensorActivityIndicator;
}

- (void)setShowingSensorActivityIndicator:(BOOL)a3
{
  self->_showingSensorActivityIndicator = a3;
}

- (BOOL)showingPill
{
  return self->_showingPill;
}

- (void)setShowingPill:(BOOL)a3
{
  self->_showingPill = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarRegion, 0);
  objc_storeStrong((id *)&self->_timeRegion, 0);
  objc_storeStrong((id *)&self->_pillRegionCoordinator, 0);
  objc_destroyWeak((id *)&self->_statusBar);
}

@end