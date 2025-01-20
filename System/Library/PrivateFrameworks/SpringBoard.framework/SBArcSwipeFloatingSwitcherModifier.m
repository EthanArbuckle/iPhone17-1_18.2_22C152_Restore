@interface SBArcSwipeFloatingSwitcherModifier
- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3;
- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3;
- (BOOL)shouldPerformCrossfadeForReduceMotion;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBArcSwipeFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 floatingConfiguration:(int64_t)a6 direction:(unint64_t)a7 needsOvershoot:(BOOL)a8;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (id)_layoutSettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToResignActive;
- (id)handleTimerEvent:(id)a3;
- (id)keyboardSuppressionMode;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
- (id)visibleAppLayouts;
@end

@implementation SBArcSwipeFloatingSwitcherModifier

- (SBArcSwipeFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 floatingConfiguration:(int64_t)a6 direction:(unint64_t)a7 needsOvershoot:(BOOL)a8
{
  id v15 = a4;
  id v16 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  v17 = [(SBTransitionSwitcherModifier *)&v21 initWithTransitionID:a3];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fromAppLayout, a4);
    objc_storeStrong((id *)&v18->_toAppLayout, a5);
    v18->_floatingConfiguration = a6;
    v18->_direction = a7;
    BOOL v19 = !a8;
    if (v15 == v16) {
      BOOL v19 = 1;
    }
    v18->_hasReshuffledZOrder = v19;
  }

  return v18;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  v5 = [(SBArcSwipeFloatingSwitcherModifier *)self switcherSettings];
  v6 = [v5 animationSettings];
  [v6 disableAsyncRenderingTransitionPercentage];
  double v8 = v7;

  v9 = [(SBArcSwipeFloatingSwitcherModifier *)self _layoutSettings];
  [v9 settlingDuration];
  double v11 = v8 * v10;
  UIAnimationDragCoefficient();
  *a3 = v11 * v12;

  return 1;
}

- (id)transitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillBegin];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  v4 = +[SBChainableModifierEventResponse responseByAppendingResponse:v3 toResponse:v2];

  return v4;
}

- (id)transitionWillUpdate
{
  v22.receiver = self;
  v22.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v22 transitionWillUpdate];
  if (!self->_hasReshuffledZOrder)
  {
    uint64_t v4 = self->_floatingConfiguration != 2;
    unint64_t direction = self->_direction;
    objc_super v6 = [(SBArcSwipeFloatingSwitcherModifier *)self switcherSettings];
    double v7 = [v6 floatingSwitcherSettings];

    if (direction == v4) {
      [v7 overshootPullbackDelayOffscreen];
    }
    else {
      [v7 overshootPullbackDelayOnscreen];
    }
    double v9 = v8;
    UIAnimationDragCoefficient();
    float v11 = v10;
    objc_initWeak(&location, self);
    float v12 = [SBTimerEventSwitcherEventResponse alloc];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __58__SBArcSwipeFloatingSwitcherModifier_transitionWillUpdate__block_invoke;
    BOOL v19 = &unk_1E6AF90F0;
    objc_copyWeak(&v20, &location);
    v13 = [(SBTimerEventSwitcherEventResponse *)v12 initWithDelay:&v16 validator:@"kSBArcSwipeFloatingSwitcherModifierReshuffleReason" reason:v9 * v11];
    uint64_t v14 = +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v13, v3, v16, v17, v18, v19);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);

    v3 = (void *)v14;
  }
  return v3;
}

BOOL __58__SBArcSwipeFloatingSwitcherModifier_transitionWillUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  id v4 = a3;
  v5 = [(SBTransitionSwitcherModifier *)&v10 handleTimerEvent:v4];
  objc_super v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"kSBArcSwipeFloatingSwitcherModifierReshuffleReason"];
  if (v4)
  {
    self->_hasReshuffledZOrder = 1;
    double v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
    uint64_t v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v7 toResponse:v5];

    v5 = (void *)v8;
  }
  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v25.receiver = self;
  v25.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  -[SBArcSwipeFloatingSwitcherModifier frameForIndex:](&v25, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(SBArcSwipeFloatingSwitcherModifier *)self appLayouts];
  uint64_t v14 = [v13 objectAtIndex:a3];

  unint64_t direction = self->_direction;
  if (direction)
  {
    if (direction != 1 || [(SBAppLayout *)self->_toAppLayout isEqual:v14]) {
      goto LABEL_12;
    }
  }
  else if (![(SBAppLayout *)self->_fromAppLayout isEqual:v14])
  {
    goto LABEL_12;
  }
  if (!self->_hasReshuffledZOrder)
  {
    int v16 = [(SBArcSwipeFloatingSwitcherModifier *)self isRTLEnabled];
    [(SBArcSwipeFloatingSwitcherModifier *)self containerViewBounds];
    double v18 = 1.2;
    if (v16) {
      double v18 = -1.2;
    }
    double v19 = v17 * v18;
    double v20 = -(v17 * v18);
    if (self->_direction != 1) {
      double v20 = v19;
    }
    double v6 = v6 + v20;
  }
LABEL_12:

  double v21 = v6;
  double v22 = v8;
  double v23 = v10;
  double v24 = v12;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  -[SBArcSwipeFloatingSwitcherModifier scaleForIndex:](&v12, sel_scaleForIndex_);
  double v6 = v5;
  if ([(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    double v7 = [(SBArcSwipeFloatingSwitcherModifier *)self appLayouts];
    int64_t v8 = a3 - [v7 indexOfObject:self->_fromAppLayout];
    if (v8 < 0) {
      v8 += [v7 count];
    }
    v11.receiver = self;
    v11.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
    [(SBArcSwipeFloatingSwitcherModifier *)&v11 scaleForIndex:v8];
    double v6 = v9;
  }
  return v6;
}

- (id)topMostLayoutElements
{
  v8.receiver = self;
  v8.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  BOOL v3 = [(SBArcSwipeFloatingSwitcherModifier *)&v8 topMostLayoutElements];
  id v4 = v3;
  if (!self->_hasReshuffledZOrder)
  {
    unint64_t direction = self->_direction;
    if (direction == 1)
    {
      double v6 = (void *)[v3 mutableCopy];
      [v6 removeObject:self->_toAppLayout];
      [v6 addObject:self->_toAppLayout];
    }
    else
    {
      if (direction) {
        goto LABEL_7;
      }
      double v6 = (void *)[v3 mutableCopy];
      [v6 removeObject:self->_fromAppLayout];
      [v6 insertObject:self->_fromAppLayout atIndex:0];
    }

    id v4 = v6;
  }
LABEL_7:
  return v4;
}

- (id)visibleAppLayouts
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = v3;
  if (self->_toAppLayout) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_fromAppLayout) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v8 animationAttributesForLayoutElement:a3];
  double v5 = (void *)[v4 mutableCopy];

  double v6 = [(SBArcSwipeFloatingSwitcherModifier *)self _layoutSettings];
  [v5 setLayoutSettings:v6];

  return v5;
}

- (id)_layoutSettings
{
  id v3 = [(SBArcSwipeFloatingSwitcherModifier *)self switcherSettings];
  id v4 = [v3 animationSettings];

  if ([(SBArcSwipeFloatingSwitcherModifier *)self isReduceMotionEnabled]) {
    [v4 reduceMotionArcSwipeSettings];
  }
  else {
  double v5 = [v4 arcSwipeSettings];
  }

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 1.0;
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  toAppLayout = self->_toAppLayout;
  if (!toAppLayout) {
    return 0;
  }
  double v5 = [(SBArcSwipeFloatingSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];
  BOOL v7 = [(SBAppLayout *)toAppLayout isEqual:v6];

  return v7;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (id)appLayoutsToResignActive
{
  if ([(SBAppLayout *)self->_fromAppLayout isEqual:self->_toAppLayout])
  {
    id v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
    id v3 = [(SBTransitionSwitcherModifier *)&v5 appLayoutsToResignActive];
  }
  return v3;
}

- (id)keyboardSuppressionMode
{
  if ([(SBAppLayout *)self->_fromAppLayout isEqual:self->_toAppLayout])
  {
    id v3 = +[SBSwitcherKeyboardSuppressionMode suppressionModeNone];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
    id v3 = [(SBTransitionSwitcherModifier *)&v5 keyboardSuppressionMode];
  }
  return v3;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBArcSwipeFloatingSwitcherModifier;
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
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
}

@end