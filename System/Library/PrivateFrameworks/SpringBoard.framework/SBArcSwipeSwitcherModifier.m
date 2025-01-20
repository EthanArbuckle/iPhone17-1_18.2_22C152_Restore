@interface SBArcSwipeSwitcherModifier
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3;
- (BOOL)shouldPerformCrossfadeForReduceMotion;
- (SBArcSwipeSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 pinSpaceCornerRadiiToDisplayCornerRadii:(BOOL)a6;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (id)_layoutSettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToCacheFullsizeSnapshots;
- (id)appLayoutsToCacheSnapshots;
- (id)appLayoutsToResignActive;
- (id)keyboardSuppressionMode;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
@end

@implementation SBArcSwipeSwitcherModifier

- (SBArcSwipeSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 pinSpaceCornerRadiiToDisplayCornerRadii:(BOOL)a6
{
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBArcSwipeSwitcherModifier;
  v14 = [(SBTransitionSwitcherModifier *)&v17 initWithTransitionID:a3];
  if (v14)
  {
    if (!v13)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v14, @"SBArcSwipeSwitcherModifier.m", 34, @"Invalid parameter not satisfying: %@", @"toAppLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v14->_fromAppLayout, a4);
    objc_storeStrong((id *)&v14->_toAppLayout, a5);
    v14->_pinSpaceCornerRadiiToDisplayCornerRadii = a6;
  }

  return v14;
}

- (id)transitionWillBegin
{
  v11.receiver = self;
  v11.super_class = (Class)SBArcSwipeSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v11 transitionWillBegin];
  v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

  if (!self->_systemApertureSuppressionIdentifier && self->_toAppLayout)
  {
    v6 = [MEMORY[0x1E4F29128] UUID];
    systemApertureSuppressionIdentifier = self->_systemApertureSuppressionIdentifier;
    self->_systemApertureSuppressionIdentifier = v6;

    v8 = [[SBRequestSystemApertureElementSuppressionEventResponse alloc] initWithAppLayout:self->_toAppLayout wantsGlobalSuppression:0 wantsKeyLineEnabled:0 invalidationIdentifier:self->_systemApertureSuppressionIdentifier];
    uint64_t v9 = +[SBChainableModifierEventResponse responseByAppendingResponse:v8 toResponse:v5];

    v5 = (void *)v9;
  }

  return v5;
}

- (id)transitionDidEnd
{
  v8.receiver = self;
  v8.super_class = (Class)SBArcSwipeSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v8 transitionDidEnd];
  if (self->_systemApertureSuppressionIdentifier)
  {
    v4 = [[SBRelinquishSystemApertureElementSuppressionEventResponse alloc] initWithInvalidationIdentifier:self->_systemApertureSuppressionIdentifier];
    uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

    systemApertureSuppressionIdentifier = self->_systemApertureSuppressionIdentifier;
    self->_systemApertureSuppressionIdentifier = 0;

    v3 = (void *)v5;
  }
  return v3;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  uint64_t v5 = [(SBArcSwipeSwitcherModifier *)self switcherSettings];
  v6 = [v5 animationSettings];
  [v6 disableAsyncRenderingTransitionPercentage];
  double v8 = v7;

  uint64_t v9 = [(SBArcSwipeSwitcherModifier *)self _layoutSettings];
  [v9 settlingDuration];
  double v11 = v8 * v10;
  UIAnimationDragCoefficient();
  *a3 = v11 * v12;

  return 1;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBArcSwipeSwitcherModifier;
  v3 = [(SBArcSwipeSwitcherModifier *)&v6 visibleAppLayouts];
  v4 = (void *)[v3 mutableCopy];

  if (self->_toAppLayout) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_fromAppLayout) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBArcSwipeSwitcherModifier;
  v4 = [(SBTransitionSwitcherModifier *)&v8 animationAttributesForLayoutElement:a3];
  uint64_t v5 = (void *)[v4 mutableCopy];

  objc_super v6 = [(SBArcSwipeSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  return v5;
}

- (id)_layoutSettings
{
  v3 = [(SBArcSwipeSwitcherModifier *)self switcherSettings];
  v4 = [v3 animationSettings];

  if ([(SBArcSwipeSwitcherModifier *)self isReduceMotionEnabled]) {
    [v4 reduceMotionArcSwipeSettings];
  }
  else {
  uint64_t v5 = [v4 arcSwipeSettings];
  }

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
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

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  toAppLayout = self->_toAppLayout;
  if (!toAppLayout) {
    return 0;
  }
  uint64_t v5 = [(SBArcSwipeSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];
  BOOL v7 = [(SBAppLayout *)toAppLayout isEqual:v6];

  return v7;
}

- (id)appLayoutsToCacheSnapshots
{
  v3 = [(SBArcSwipeSwitcherModifier *)self appLayouts];
  if ([v3 count])
  {
    if (self->_toAppLayout)
    {
      v4 = [(SBArcSwipeSwitcherModifier *)self appLayouts];
      uint64_t v5 = [v4 indexOfObject:self->_toAppLayout];
    }
    else
    {
      uint64_t v5 = 0;
    }
    BOOL v7 = [(SBArcSwipeSwitcherModifier *)self switcherSettings];
    uint64_t v8 = [v7 numberOfSnapshotsToAlwaysKeepAround];
    if (!v8) {
      uint64_t v8 = [v7 numberOfSnapshotsToCacheInSwitcher];
    }
    objc_super v6 = -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", v5, 1, v8, 1);
  }
  else
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  v3 = [(SBArcSwipeSwitcherModifier *)self appLayouts];
  if (self->_fromAppLayout)
  {
    v4 = [(SBArcSwipeSwitcherModifier *)self appLayouts];
    NSUInteger v5 = [v4 indexOfObject:self->_toAppLayout];

    if (v5)
    {
      --v5;
      NSUInteger v6 = 3;
    }
    else
    {
      NSUInteger v6 = 2;
    }
  }
  else
  {
    NSUInteger v5 = 0;
    NSUInteger v6 = 1;
  }
  v12.length = [v3 count];
  v11.location = v5;
  v11.length = v6;
  v12.location = 0;
  NSRange v7 = NSIntersectionRange(v11, v12);
  uint64_t v8 = objc_msgSend(v3, "subarrayWithRange:", v7.location, v7.length);

  return v8;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  if (self->_pinSpaceCornerRadiiToDisplayCornerRadii)
  {
    [(SBArcSwipeSwitcherModifier *)self displayCornerRadius];
    SBRectCornerRadiiForRadius();
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBArcSwipeSwitcherModifier;
    [(SBArcSwipeSwitcherModifier *)&v7 cornerRadiiForIndex:a3];
  }
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (id)appLayoutsToResignActive
{
  if ([(SBAppLayout *)self->_fromAppLayout isEqual:self->_toAppLayout])
  {
    double v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBArcSwipeSwitcherModifier;
    double v3 = [(SBTransitionSwitcherModifier *)&v5 appLayoutsToResignActive];
  }
  return v3;
}

- (id)keyboardSuppressionMode
{
  if ([(SBAppLayout *)self->_fromAppLayout isEqual:self->_toAppLayout])
  {
    double v3 = +[SBSwitcherKeyboardSuppressionMode suppressionModeNone];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBArcSwipeSwitcherModifier;
    double v3 = [(SBTransitionSwitcherModifier *)&v5 keyboardSuppressionMode];
  }
  return v3;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBArcSwipeSwitcherModifier;
  unsigned __int16 v4 = (unsigned __int16)[(SBTransitionSwitcherModifier *)&v7 asyncRenderingAttributesForAppLayout:a3];
  if (self->_fromAppLayout == self->_toAppLayout) {
    __int16 v5 = 0;
  }
  else {
    __int16 v5 = v4;
  }
  return (SBSwitcherAsyncRenderingAttributes)(v5 | v4 & 0xFF00);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemApertureSuppressionIdentifier, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
}

@end