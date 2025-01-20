@interface SBEntityRemovalSlideOffscreenSwitcherModifier
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBEntityRemovalSlideOffscreenSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 direction:(unint64_t)a5 animationSettings:(id)a6 multitaskingModifier:(id)a7;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (id)_layoutSettings;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillUpdate;
- (id)visibleAppLayouts;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBEntityRemovalSlideOffscreenSwitcherModifier

- (SBEntityRemovalSlideOffscreenSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 direction:(unint64_t)a5 animationSettings:(id)a6 multitaskingModifier:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
  v17 = [(SBTransitionSwitcherModifier *)&v21 initWithTransitionID:v13];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_transitionID, a3);
    objc_storeStrong((id *)&v18->_appLayout, a4);
    v18->_direction = a5;
    objc_storeStrong((id *)&v18->_multitaskingModifier, a7);
    objc_storeStrong((id *)&v18->_animationSettings, a6);
    [v15 fromViewSlideOutAnimationDelay];
    v18->_isSecondStage = v19 == 0.0;
  }

  return v18;
}

- (void)didMoveToParentModifier:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v12, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_toHomeRemovalModifier)
    {
      v5 = [(SBEntityRemovalDosidoSlideOutAnimationSettings *)self->_animationSettings defaultAnimationSettings];
      [v5 toViewScaleAndAlphaResetAnimationDelay];
      double v7 = v6;
      UIAnimationDragCoefficient();
      double v9 = v7 * v8;

      v10 = [[SBEntityRemovalToHomeSwitcherModifier alloc] initWithTransitionID:self->_transitionID homeAnimationDelay:self->_multitaskingModifier multitaskingModifier:v9];
      toHomeRemovalModifier = self->_toHomeRemovalModifier;
      self->_toHomeRemovalModifier = v10;

      [(SBChainableModifier *)self addChildModifier:self->_toHomeRemovalModifier];
    }
  }
}

- (id)transitionWillUpdate
{
  v18.receiver = self;
  v18.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v18 transitionWillUpdate];
  if (!self->_isSecondStage)
  {
    objc_initWeak(&location, self);
    [(SBEntityRemovalDosidoSlideOutAnimationSettings *)self->_animationSettings fromViewSlideOutAnimationDelay];
    double v5 = v4;
    UIAnimationDragCoefficient();
    float v7 = v6;
    float v8 = [SBTimerEventSwitcherEventResponse alloc];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __69__SBEntityRemovalSlideOffscreenSwitcherModifier_transitionWillUpdate__block_invoke;
    id v15 = &unk_1E6AF90F0;
    objc_copyWeak(&v16, &location);
    double v9 = [(SBTimerEventSwitcherEventResponse *)v8 initWithDelay:&v12 validator:@"kSBEntityRemovalSlideOffsrceenSwitcherModifierSlideDelayReson" reason:v5 * v7];
    uint64_t v10 = +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v9, v3, v12, v13, v14, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    v3 = (void *)v10;
  }
  return v3;
}

BOOL __69__SBEntityRemovalSlideOffscreenSwitcherModifier_transitionWillUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
  id v4 = a3;
  double v5 = [(SBTransitionSwitcherModifier *)&v10 handleTimerEvent:v4];
  float v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"kSBEntityRemovalSlideOffsrceenSwitcherModifierSlideDelayReson"];
  if (v4)
  {
    self->_isSecondStage = 1;
    float v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
    uint64_t v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v7 toResponse:v5];

    double v5 = (void *)v8;
  }
  return v5;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
  BOOL v3 = [(SBEntityRemovalSlideOffscreenSwitcherModifier *)&v6 visibleAppLayouts];
  id v4 = [v3 setByAddingObject:self->_appLayout];

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5 = [(SBEntityRemovalSlideOffscreenSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_appLayout isEqual:v6]
    && ![(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    if ([(SBEntityRemovalSlideOffscreenSwitcherModifier *)self isChamoisWindowingUIEnabled])
    {
      double v19 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_appLayout];
      [v19 boundingBox];
      double v8 = v20;
      double v10 = v21;
      double v12 = v22;
      double v14 = v23;
    }
    else
    {
      [(SBEntityRemovalSlideOffscreenSwitcherModifier *)self containerViewBounds];
      double v8 = v24;
      double v10 = v25;
      double v12 = v26;
      double v14 = v27;
    }
    if (self->_isSecondStage)
    {
      [(SBEntityRemovalSlideOffscreenSwitcherModifier *)self containerViewBounds];
      double v29 = v28;
      [(SBEntityRemovalDosidoSlideOutAnimationSettings *)self->_animationSettings fromViewSlideOutHeightOffsetMultiplier];
      double v31 = v29 * v30;
      double v32 = -(v29 * v30);
      if (self->_direction == 1) {
        double v32 = v31;
      }
      double v10 = v10 + v32;
    }
  }
  else
  {
    v33.receiver = self;
    v33.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    [(SBEntityRemovalSlideOffscreenSwitcherModifier *)&v33 frameForIndex:a3];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5 = [(SBEntityRemovalSlideOffscreenSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_appLayout isEqual:v6]
    && ![(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    double v9 = [(SBEntityRemovalDosidoSlideOutAnimationSettings *)self->_animationSettings defaultAnimationSettings];
    [v9 fromViewFinalScale];
    double v8 = v10;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    [(SBEntityRemovalSlideOffscreenSwitcherModifier *)&v12 scaleForIndex:a3];
    double v8 = v7;
  }

  return v8;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  double v5 = [(SBEntityRemovalSlideOffscreenSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if (![(SBAppLayout *)self->_appLayout isEqual:v6]
    || (double v7 = 0.5, v8 = 0.5, [(SBTransitionSwitcherModifier *)self isPreparingLayout]))
  {
    v13.receiver = self;
    v13.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    [(SBEntityRemovalSlideOffscreenSwitcherModifier *)&v13 anchorPointForIndex:a3];
    double v7 = v9;
    double v8 = v10;
  }

  double v11 = v7;
  double v12 = v8;
  result.y = v12;
  result.x = v11;
  return result;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  double v5 = [(SBEntityRemovalSlideOffscreenSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_appLayout isEqual:v6]
    && ![(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    BOOL v7 = [(SBEntityRemovalSlideOffscreenSwitcherModifier *)&v9 shouldPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  double v5 = [(SBEntityRemovalSlideOffscreenSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_appLayout isEqual:v6]
    && ![(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    BOOL v7 = [(SBEntityRemovalSlideOffscreenSwitcherModifier *)&v9 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  if (![(SBAppLayout *)self->_appLayout isEqual:v4]
    || (double v5 = 0.0, [(SBTransitionSwitcherModifier *)self isPreparingLayout]))
  {
    v8.receiver = self;
    v8.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    [(SBEntityRemovalSlideOffscreenSwitcherModifier *)&v8 perspectiveAngleForAppLayout:v4];
    double v5 = v6;
  }

  return v5;
}

- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  if ([(SBAppLayout *)self->_appLayout isEqual:v9]
    && ![(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    double v18 = [(SBEntityRemovalSlideOffscreenSwitcherModifier *)self appLayouts];
    -[SBEntityRemovalSlideOffscreenSwitcherModifier frameForIndex:](self, "frameForIndex:", [v18 indexOfObject:self->_appLayout]);
    double v11 = v19;
    double v13 = v20;
    double v15 = v21;
    double v17 = v22;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    -[SBEntityRemovalSlideOffscreenSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v27, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
  }

  double v23 = v11;
  double v24 = v13;
  double v25 = v15;
  double v26 = v17;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (![(SBAppLayout *)self->_appLayout isEqual:v7]
    || (double v8 = 0.5, v9 = 0.5, [(SBTransitionSwitcherModifier *)self isPreparingLayout]))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    -[SBEntityRemovalSlideOffscreenSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v14, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v7, x, y);
    double v8 = v10;
    double v9 = v11;
  }

  double v12 = v8;
  double v13 = v9;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  if (![(SBAppLayout *)self->_appLayout isEqual:v8]
    || (double v9 = 1.0, [(SBTransitionSwitcherModifier *)self isPreparingLayout]))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    [(SBEntityRemovalSlideOffscreenSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v9 = v10;
  }

  return v9;
}

- (id)topMostLayoutElements
{
  v6.receiver = self;
  v6.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
  BOOL v3 = [(SBEntityRemovalSlideOffscreenSwitcherModifier *)&v6 topMostLayoutElements];
  id v4 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_appLayout, 0);

  return v4;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
  id v4 = [(SBEntityRemovalSlideOffscreenSwitcherModifier *)&v7 appLayoutsToEnsureExistForMainTransitionEvent:a3];
  double v5 = objc_msgSend(v4, "sb_arrayByAddingOrMovingObject:", self->_appLayout);

  return v5;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  if ([v4 switcherLayoutElementType] || !objc_msgSend(v4, "isEqual:", self->_appLayout))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    objc_super v6 = [(SBTransitionSwitcherModifier *)&v9 animationAttributesForLayoutElement:v4];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBEntityRemovalSlideOffscreenSwitcherModifier;
    double v5 = [(SBTransitionSwitcherModifier *)&v10 animationAttributesForLayoutElement:v4];
    objc_super v6 = (void *)[v5 mutableCopy];

    objc_super v7 = [(SBEntityRemovalSlideOffscreenSwitcherModifier *)self _layoutSettings];
    [v6 setLayoutSettings:v7];
  }
  return v6;
}

- (id)_layoutSettings
{
  BOOL isSecondStage = self->_isSecondStage;
  animationSettings = self->_animationSettings;
  if (isSecondStage)
  {
    id v4 = [(SBEntityRemovalDosidoSlideOutAnimationSettings *)animationSettings fromViewSlideOutAnimationSettings];
  }
  else
  {
    double v5 = [(SBEntityRemovalDosidoSlideOutAnimationSettings *)animationSettings defaultAnimationSettings];
    id v4 = [v5 fromViewScaleAnimationSettings];
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationSettings, 0);
  objc_storeStrong((id *)&self->_toHomeRemovalModifier, 0);
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_transitionID, 0);
}

@end