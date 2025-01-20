@interface _UIStatusBarVisualProvider_CarPlay
+ (BOOL)requiresIterativeOverflowLayout;
+ (BOOL)scalesWithScreenNativeScale;
+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3;
+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4;
- (BOOL)expanded;
- (BOOL)showSensorActivityIndicatorWithoutPortalView;
- (BOOL)showingPill;
- (BOOL)showingSensorActivityIndicator;
- (BOOL)supportsIndirectPointerTouchActions;
- (UIFont)clockFont;
- (_UIStatusBar)statusBar;
- (_UIStatusBarRegion)radarRegion;
- (_UIStatusBarRegion)timeRegion;
- (_UIStatusBarVisualProvider_CarPlay)init;
- (_UIStatusBarVisualProvider_PillRegionCoordinator)pillRegionCoordinator;
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

@implementation _UIStatusBarVisualProvider_CarPlay

+ (Class)visualProviderSubclassForScreen:(id)a3 visualProviderInfo:(id)a4
{
  id v4 = a4;
  v5 = objc_opt_class();
  if (v4)
  {
    v6 = [v4 objectForKey:@"_UIStatusBarCarPlayHorizontalLayoutKey"];
    int v7 = [v6 BOOLValue];

    if (v7) {
      v5 = objc_opt_class();
    }
  }
  v8 = v5;

  return v8;
}

+ (CGSize)intrinsicContentSizeForOrientation:(int64_t)a3
{
  double v3 = -1.0;
  double v4 = -1.0;
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

- (_UIStatusBarVisualProvider_CarPlay)init
{
  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarVisualProvider_CarPlay;
  v2 = [(_UIStatusBarVisualProvider_CarPlay *)&v6 init];
  if (v2)
  {
    double v3 = objc_opt_new();
    [(_UIStatusBarVisualProvider_CarPlay *)v2 setPillRegionCoordinator:v3];

    double v4 = [(_UIStatusBarVisualProvider_CarPlay *)v2 pillRegionCoordinator];
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
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v5;
    [v4 setReducesFontSize:0];
    [v4 setTypeStringProvider:self];
  }
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
  id v5 = [(_UIStatusBarVisualProvider_CarPlay *)self statusBar];
  objc_super v6 = +[_UIStatusBarStyleAttributes styleAttributesForStatusBar:v5 style:a3];

  if (a3 == 2)
  {
    int v7 = +[UIColor blackColor];
    [v6 setTextColor:v7];

    +[UIColor blackColor];
  }
  else
  {
    v8 = +[UIColor whiteColor];
    [v6 setTextColor:v8];

    +[UIColor whiteColor];
  v9 = };
  [v6 setImageTintColor:v9];

  v10 = [(_UIStatusBarVisualProvider_CarPlay *)self statusBar];
  v11 = [v10 traitCollection];
  v12 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption1" compatibleWithTraitCollection:v11];

  if (v12) {
    CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();
  }
  else {
    CopyOfSystemUIFontWithGrade = 0;
  }
  [v6 setFont:CopyOfSystemUIFontWithGrade];
  [v6 setSmallFont:CopyOfSystemUIFontWithGrade];
  v14 = [(_UIStatusBarVisualProvider_CarPlay *)self statusBar];
  v15 = [v14 traitCollection];
  v16 = [off_1E52D39B8 _preferredFontForTextStyle:@"UICTFontTextStyleCaption1" design:0 variant:1024 compatibleWithTraitCollection:v15];
  [v6 setEmphasizedFont:v16];

  v17 = [v6 imageTintColor];
  v18 = [v17 colorWithAlphaComponent:0.2];
  [v6 setImageDimmedTintColor:v18];

  return v6;
}

- (id)willUpdateWithData:(id)a3
{
  id v4 = a3;
  id v5 = [v4 sensorActivityEntry];
  objc_super v6 = v5;
  if (v5) {
    -[_UIStatusBarVisualProvider_CarPlay setShowingSensorActivityIndicator:](self, "setShowingSensorActivityIndicator:", [v5 isEnabled]);
  }
  int v7 = [v4 backgroundActivityEntry];
  v8 = [(_UIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
  [v8 updateDataForBackgroundActivity:v4];

  if (v7) {
    -[_UIStatusBarVisualProvider_CarPlay setShowingPill:](self, "setShowingPill:", [v7 isEnabled]);
  }
  v9 = [v4 radarEntry];
  v10 = v9;
  if (v9)
  {
    if ([v9 isEnabled])
    {
      v11 = +[_UIStatusBarActivityAction actionForBackgroundActivityType:29];
      v12 = [(_UIStatusBarVisualProvider_CarPlay *)self radarRegion];
      [v12 setAction:v11];
    }
    else
    {
      v11 = [(_UIStatusBarVisualProvider_CarPlay *)self radarRegion];
      [v11 setAction:0];
    }
  }
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)additionAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_UIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];

  if (v8 == v6)
  {
    v19 = [(_UIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
    v20 = [v19 animationForBackgroundActivityPillWithDuration:0.25 scale:0.25];

    goto LABEL_14;
  }
  uint64_t v9 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v10 = v6;
  if ((id)v9 == v6) {
    goto LABEL_11;
  }
  v11 = (void *)v9;
  uint64_t v12 = +[_UIStatusBarItem defaultDisplayIdentifier];
  if ((id)v12 == v6)
  {

    v10 = v11;
LABEL_11:

    goto LABEL_12;
  }
  v13 = (void *)v12;
  id v14 = +[_UIStatusBarItem defaultDisplayIdentifier];

  if (v14 != v6)
  {
    id v15 = +[_UIStatusBarItem defaultDisplayIdentifier];

    if (v15 == v6)
    {
      id v18 = [(_UIStatusBarVisualProvider_CarPlay *)self _animationForSensorIndicator];
    }
    else
    {
      id v16 = +[_UIStatusBarTimeItem pillTimeDisplayIdentifier];

      if (v16 == v6
        || (+[_UIStatusBarTimeItem shortTimeDisplayIdentifier], id v17 = (id)objc_claimAutoreleasedReturnValue(), v17, v17 == v6))
      {
        id v18 = [(_UIStatusBarVisualProvider_CarPlay *)self _animationForPillTime];
      }
      else
      {
        id v18 = v7;
      }
    }
    goto LABEL_13;
  }
LABEL_12:
  id v18 = [(_UIStatusBarVisualProvider_CarPlay *)self _defaultScaleAnimationWithIdentifier:v6];
LABEL_13:
  v20 = v18;
LABEL_14:

  return v20;
}

- (id)removalAnimationForDisplayItemWithIdentifier:(id)a3 itemAnimation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_UIStatusBarBackgroundActivityItem backgroundDisplayIdentifier];

  if (v8 == v6)
  {
    v19 = [(_UIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
    v20 = [v19 animationForBackgroundActivityPillWithDuration:0.25 scale:0.25];

    goto LABEL_14;
  }
  uint64_t v9 = +[_UIStatusBarItem defaultDisplayIdentifier];
  v10 = v6;
  if ((id)v9 == v6) {
    goto LABEL_11;
  }
  v11 = (void *)v9;
  uint64_t v12 = +[_UIStatusBarItem defaultDisplayIdentifier];
  if ((id)v12 == v6)
  {

    v10 = v11;
LABEL_11:

    goto LABEL_12;
  }
  v13 = (void *)v12;
  id v14 = +[_UIStatusBarItem defaultDisplayIdentifier];

  if (v14 != v6)
  {
    id v15 = +[_UIStatusBarItem defaultDisplayIdentifier];

    if (v15 == v6)
    {
      id v18 = [(_UIStatusBarVisualProvider_CarPlay *)self _animationForSensorIndicator];
    }
    else
    {
      id v16 = +[_UIStatusBarTimeItem pillTimeDisplayIdentifier];

      if (v16 == v6
        || (+[_UIStatusBarTimeItem shortTimeDisplayIdentifier], id v17 = (id)objc_claimAutoreleasedReturnValue(), v17, v17 == v6))
      {
        id v18 = [(_UIStatusBarVisualProvider_CarPlay *)self _animationForPillTime];
      }
      else
      {
        id v18 = v7;
      }
    }
    goto LABEL_13;
  }
LABEL_12:
  id v18 = [(_UIStatusBarVisualProvider_CarPlay *)self _defaultScaleAnimationWithIdentifier:v6];
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
  id v8 = [(_UIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
  if (([v8 handledUpdateOfActionable:v13 highlighted:v6 initialPress:v5] & 1) == 0)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v10 = v13;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_6;
    }
    id v8 = v13;
    id v11 = [(_UIStatusBarVisualProvider_CarPlay *)self radarRegion];

    if (v11 == v8)
    {
      uint64_t v12 = [(_UIStatusBarVisualProvider_CarPlay *)self pillRegionCoordinator];
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
  BOOL v5 = _UIStatusBarDefaultAnimation(self, v4, (long long *)&v7, 0.25, 0.25, 0.0);

  return v5;
}

- (id)_animationForSensorIndicator
{
  double v3 = +[_UIStatusBarItem defaultDisplayIdentifier];
  CGAffineTransformMakeScale(&v6, 0.25, 0.25);
  id v4 = _UIStatusBarDefaultAnimation(self, v3, (long long *)&v6, 0.25, 0.25, 0.0);

  return v4;
}

- (id)_animationForPillTime
{
  return +[_UIStatusBarAnimationFactory fadeAnimationWithDuration:0.25 scale:0.25];
}

- (id)orderedDisplayItemPlacementsInRegionWithIdentifier:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)overriddenStyleAttributesForDisplayItemWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[_UIStatusBarTimeItem pillTimeDisplayIdentifier];

  if (v5 == v4)
  {
    CGAffineTransform v6 = +[_UIStatusBarStyleAttributes overriddenStyleAttributes];
    CGAffineTransform v7 = [(_UIStatusBarVisualProvider_CarPlay *)self statusBar];
    id v8 = [v7 traitCollection];
    uint64_t v9 = [off_1E52D39B8 _preferredFontForTextStyle:@"UICTFontTextStyleCaption2" design:0 variant:1024 compatibleWithTraitCollection:v8];
    [v6 setEmphasizedFont:v9];

    v10 = +[UIColor whiteColor];
    [v6 setTextColor:v10];
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

- (_UIStatusBar)statusBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  return (_UIStatusBar *)WeakRetained;
}

- (void)setStatusBar:(id)a3
{
}

- (_UIStatusBarVisualProvider_PillRegionCoordinator)pillRegionCoordinator
{
  return self->_pillRegionCoordinator;
}

- (void)setPillRegionCoordinator:(id)a3
{
}

- (_UIStatusBarRegion)timeRegion
{
  return self->_timeRegion;
}

- (void)setTimeRegion:(id)a3
{
}

- (_UIStatusBarRegion)radarRegion
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