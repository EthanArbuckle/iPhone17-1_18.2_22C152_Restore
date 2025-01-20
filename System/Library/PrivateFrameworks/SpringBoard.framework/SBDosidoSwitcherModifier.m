@interface SBDosidoSwitcherModifier
- (BOOL)isHomeScreenContentRequired;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)isWallpaperRequiredForSwitcher;
- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3;
- (BOOL)shouldSuppressScaleAnimation;
- (SBDosidoSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 direction:(unint64_t)a6;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (id)_layoutSettings;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleSwipeToKillEvent:(id)a3;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
- (id)visibleAppLayouts;
- (int64_t)homeScreenBackdropBlurType;
- (int64_t)wallpaperStyle;
- (void)setShouldSuppressScaleAnimation:(BOOL)a3;
@end

@implementation SBDosidoSwitcherModifier

- (SBDosidoSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 direction:(unint64_t)a6
{
  id v12 = a4;
  id v13 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBDosidoSwitcherModifier;
  v14 = [(SBTransitionSwitcherModifier *)&v18 initWithTransitionID:a3];
  if (v14)
  {
    if (v12)
    {
      if (v13)
      {
LABEL_4:
        objc_storeStrong((id *)&v14->_fromAppLayout, a4);
        objc_storeStrong((id *)&v14->_toAppLayout, a5);
        v14->_direction = a6;
        goto LABEL_5;
      }
    }
    else
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v14, @"SBDosidoSwitcherModifier.m", 33, @"Invalid parameter not satisfying: %@", @"fromAppLayout" object file lineNumber description];

      if (v13) {
        goto LABEL_4;
      }
    }
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, v14, @"SBDosidoSwitcherModifier.m", 34, @"Invalid parameter not satisfying: %@", @"toAppLayout" object file lineNumber description];

    goto LABEL_4;
  }
LABEL_5:

  return v14;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  v5 = [(SBDosidoSwitcherModifier *)self switcherSettings];
  v6 = [v5 animationSettings];
  [v6 disableAsyncRenderingTransitionPercentage];
  double v8 = v7;

  v9 = [(SBDosidoSwitcherModifier *)self _layoutSettings];
  [v9 settlingDuration];
  double v11 = v8 * v10;
  UIAnimationDragCoefficient();
  *a3 = v11 * v12;

  return 1;
}

- (id)transitionWillBegin
{
  v8.receiver = self;
  v8.super_class = (Class)SBDosidoSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v8 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:2];
  v4 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v2];

  v5 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  v6 = +[SBChainableModifierEventResponse responseByAppendingResponse:v5 toResponse:v4];

  return v6;
}

- (id)transitionWillUpdate
{
  v7.receiver = self;
  v7.super_class = (Class)SBDosidoSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v7 transitionWillUpdate];
  if (([(SBDosidoSwitcherModifier *)self isReduceMotionEnabled] & 1) == 0
    && ![(SBDosidoSwitcherModifier *)self shouldSuppressScaleAnimation])
  {
    v4 = [[SBDosidoScaleAnimationSwitcherEventResponse alloc] initWithAppLayout:self->_fromAppLayout];
    uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

    v3 = (void *)v5;
  }
  return v3;
}

- (id)handleSwipeToKillEvent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBDosidoSwitcherModifier;
  uint64_t v5 = [(SBSwitcherModifier *)&v10 handleSwipeToKillEvent:v4];
  v6 = [v4 appLayout];
  if ([(SBAppLayout *)self->_fromAppLayout isOrContainsAppLayout:v6]
    || [(SBAppLayout *)self->_toAppLayout isOrContainsAppLayout:v6])
  {
    [v4 progress];
    if ((BSFloatIsZero() & 1) == 0)
    {
      objc_super v7 = [(SBTransitionSwitcherModifier *)self interruptAndEndTransition];
      uint64_t v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v7 toResponse:v5];

      uint64_t v5 = (void *)v8;
    }
  }

  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBDosidoSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v13 adjustedAppLayoutsForAppLayouts:a3];
  unint64_t v5 = [v4 indexOfObject:self->_fromAppLayout];
  unint64_t v6 = [v4 indexOfObject:self->_toAppLayout];
  unint64_t v7 = v6;
  unint64_t direction = self->_direction;
  if (direction) {
    BOOL v9 = 0;
  }
  else {
    BOOL v9 = v6 > v5;
  }
  if (v9 || (direction == 1 ? (BOOL v10 = v6 >= v5) : (BOOL v10 = 1), !v10))
  {
    double v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v4];
    [v11 replaceObjectAtIndex:v5 withObject:self->_toAppLayout];
    [v11 replaceObjectAtIndex:v7 withObject:self->_fromAppLayout];

    id v4 = v11;
  }
  return v4;
}

- (id)visibleAppLayouts
{
  v3 = [(SBDosidoSwitcherModifier *)self appLayouts];
  unint64_t v4 = [v3 indexOfObject:self->_fromAppLayout];
  unint64_t v5 = [v3 indexOfObject:self->_toAppLayout];
  if (v4 >= v5) {
    unint64_t v6 = v5;
  }
  else {
    unint64_t v6 = v4;
  }
  if (v4 <= v5) {
    unint64_t v7 = v5;
  }
  else {
    unint64_t v7 = v4;
  }
  uint64_t v8 = (void *)MEMORY[0x1E4F1CAD0];
  BOOL v9 = [(SBDosidoSwitcherModifier *)self appLayouts];
  BOOL v10 = objc_msgSend(v9, "subarrayWithRange:", v6, v7 - v6 + 1);
  double v11 = [v8 setWithArray:v10];

  return v11;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBDosidoSwitcherModifier;
  unint64_t v4 = [(SBTransitionSwitcherModifier *)&v8 animationAttributesForLayoutElement:a3];
  unint64_t v5 = (void *)[v4 mutableCopy];

  unint64_t v6 = [(SBDosidoSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  return v5;
}

- (id)_layoutSettings
{
  v2 = [(SBDosidoSwitcherModifier *)self switcherSettings];
  v3 = [v2 animationSettings];
  unint64_t v4 = [v3 dosidoSettings];

  return v4;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  BOOL v9 = [(SBDosidoSwitcherModifier *)self visibleAppLayouts];
  double v10 = 1.0;
  if (([v9 containsObject:v8] & 1) == 0)
  {
    v13.receiver = self;
    v13.super_class = (Class)SBDosidoSwitcherModifier;
    [(SBDosidoSwitcherModifier *)&v13 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v10 = v11;
  }

  return v10;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  [(SBDosidoSwitcherModifier *)self displayCornerRadius];
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 1;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 3;
}

- (BOOL)isHomeScreenContentRequired
{
  return 0;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)shouldSuppressScaleAnimation
{
  return self->_shouldSuppressScaleAnimation;
}

- (void)setShouldSuppressScaleAnimation:(BOOL)a3
{
  self->_shouldSuppressScaleAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end