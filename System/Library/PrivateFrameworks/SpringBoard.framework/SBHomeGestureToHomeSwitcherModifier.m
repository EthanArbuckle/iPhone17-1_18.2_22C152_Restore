@interface SBHomeGestureToHomeSwitcherModifier
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowUserInteractionEnabled;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBHomeGestureToHomeSwitcherModifier)initWithTransitionID:(id)a3 showingOrAnimatingCardsForFlyIn:(BOOL)a4;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (id)appLayoutsToCacheSnapshots;
- (id)visibleAppLayouts;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
- (unint64_t)transactionCompletionOptions;
@end

@implementation SBHomeGestureToHomeSwitcherModifier

- (SBHomeGestureToHomeSwitcherModifier)initWithTransitionID:(id)a3 showingOrAnimatingCardsForFlyIn:(BOOL)a4
{
  v6.receiver = self;
  v6.super_class = (Class)SBHomeGestureToHomeSwitcherModifier;
  result = [(SBTransitionSwitcherModifier *)&v6 initWithTransitionID:a3];
  if (result) {
    result->_showingOrAnimatingCardsForFlyIn = a4;
  }
  return result;
}

- (id)visibleAppLayouts
{
  v2 = [(SBHomeGestureToHomeSwitcherModifier *)self appLayouts];
  v3 = [v2 firstObject];

  if (v3) {
    [MEMORY[0x1E4F1CAD0] setWithObject:v3];
  }
  else {
  v4 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBHomeGestureToHomeSwitcherModifier;
  [(SBHomeGestureToHomeSwitcherModifier *)&v8 frameForIndex:a3];
  if (self->_showingOrAnimatingCardsForFlyIn) {
    double v4 = v4 + -1.0;
  }
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  if (self->_showingOrAnimatingCardsForFlyIn)
  {
    v3 = [(SBHomeGestureToHomeSwitcherModifier *)self switcherSettings];
    [v3 offscreenCardScaleForFlyIn];
    double v5 = v4;

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBHomeGestureToHomeSwitcherModifier;
    [(SBHomeGestureToHomeSwitcherModifier *)&v7 scaleForIndex:a3];
  }
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  double result = 0.0;
  if (!a5) {
    return 1.0;
  }
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  [(SBHomeGestureToHomeSwitcherModifier *)self displayCornerRadius];
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 3;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return 0;
}

- (id)appLayoutsToCacheSnapshots
{
  double v3 = [(SBHomeGestureToHomeSwitcherModifier *)self appLayouts];
  if ([v3 count])
  {
    double v4 = [(SBHomeGestureToHomeSwitcherModifier *)self switcherSettings];
    uint64_t v5 = [v4 numberOfSnapshotsToAlwaysKeepAround];
    if (!v5) {
      uint64_t v5 = [v4 numberOfSnapshotsToCacheInSwitcher];
    }
    double v6 = -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", 0, 1, v5, 1);
  }
  else
  {
    double v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (unint64_t)transactionCompletionOptions
{
  if (!self->_showingOrAnimatingCardsForFlyIn) {
    return 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)SBHomeGestureToHomeSwitcherModifier;
  return [(SBHomeGestureToHomeSwitcherModifier *)&v3 transactionCompletionOptions];
}

@end