@interface SBEntityRemovalCrossblurSwitcherModifier
- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (CGPoint)adjustedSpaceAccessoryViewAnchorPoint:(CGPoint)a3 forAppLayout:(id)a4;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)adjustedSpaceAccessoryViewFrame:(CGRect)a3 forAppLayout:(id)a4;
- (CGRect)frameForIndex:(unint64_t)a3;
- (SBEntityRemovalCrossblurSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 multitaskingModifier:(id)a5;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionDidEnd;
- (id)transitionWillUpdate;
- (id)visibleAppLayouts;
- (void)didMoveToParentModifier:(id)a3;
@end

@implementation SBEntityRemovalCrossblurSwitcherModifier

- (SBEntityRemovalCrossblurSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 multitaskingModifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  v12 = [(SBTransitionSwitcherModifier *)&v15 initWithTransitionID:v9];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_transitionID, a3);
    objc_storeStrong((id *)&v13->_appLayout, a4);
    objc_storeStrong((id *)&v13->_multitaskingModifier, a5);
  }

  return v13;
}

- (void)didMoveToParentModifier:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  -[SBChainableModifier didMoveToParentModifier:](&v13, sel_didMoveToParentModifier_);
  if (a3)
  {
    if (!self->_toHomeRemovalModifier)
    {
      v5 = [(SBEntityRemovalCrossblurSwitcherModifier *)self entityRemovalSettings];
      v6 = [v5 dosidoDeleteIntentAnimationSettings];
      [v6 toViewScaleAndAlphaResetAnimationDelay];
      double v8 = v7;
      UIAnimationDragCoefficient();
      double v10 = v8 * v9;

      id v11 = [[SBEntityRemovalToHomeSwitcherModifier alloc] initWithTransitionID:self->_transitionID homeAnimationDelay:self->_multitaskingModifier multitaskingModifier:v10];
      toHomeRemovalModifier = self->_toHomeRemovalModifier;
      self->_toHomeRemovalModifier = v11;

      [(SBChainableModifier *)self addChildModifier:self->_toHomeRemovalModifier];
    }
  }
}

- (id)transitionWillUpdate
{
  v20.receiver = self;
  v20.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v20 transitionWillUpdate];
  if (!SBReduceMotion())
  {
    v4 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:self->_appLayout shouldBlur:1 animationUpdateMode:3];
    uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

    v3 = (void *)v5;
  }
  objc_initWeak(&location, self);
  v6 = [SBTimerEventSwitcherEventResponse alloc];
  double v7 = [(SBEntityRemovalCrossblurSwitcherModifier *)self entityRemovalSettings];
  double v8 = [v7 dosidoDeleteIntentAnimationSettings];
  [v8 fromViewAlphaAnimationDelay];
  double v10 = v9;
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __64__SBEntityRemovalCrossblurSwitcherModifier_transitionWillUpdate__block_invoke;
  v17 = &unk_1E6AF90F0;
  objc_copyWeak(&v18, &location);
  id v11 = [(SBTimerEventSwitcherEventResponse *)v6 initWithDelay:&v14 validator:@"kSBEntityRemovalCrossblurSwitcherModifierAlphaAnimationDelayReason" reason:v10];

  v12 = +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v11, v3, v14, v15, v16, v17);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

  return v12;
}

BOOL __64__SBEntityRemovalCrossblurSwitcherModifier_transitionWillUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  id v4 = a3;
  uint64_t v5 = [(SBTransitionSwitcherModifier *)&v10 handleTimerEvent:v4];
  v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"kSBEntityRemovalCrossblurSwitcherModifierAlphaAnimationDelayReason"];
  if (v4)
  {
    self->_animateOpacity = 1;
    double v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
    uint64_t v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v7 toResponse:v5];

    uint64_t v5 = (void *)v8;
  }
  return v5;
}

- (id)transitionDidEnd
{
  v7.receiver = self;
  v7.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  BOOL v3 = [(SBTransitionSwitcherModifier *)&v7 transitionDidEnd];
  id v4 = [[SBBlurItemContainerSwitcherEventResponse alloc] initWithAppLayout:self->_appLayout shouldBlur:0 animationUpdateMode:2];
  uint64_t v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v4 toResponse:v3];

  return v5;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  BOOL v3 = [(SBEntityRemovalCrossblurSwitcherModifier *)&v6 visibleAppLayouts];
  id v4 = [v3 setByAddingObject:self->_appLayout];

  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBEntityRemovalCrossblurSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_appLayout isEqual:v6]
    && ![(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    if ([(SBEntityRemovalCrossblurSwitcherModifier *)self isChamoisWindowingUIEnabled])
    {
      v19 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:self->_appLayout];
      [v19 boundingBox];
      double v11 = v20;
      double v12 = v21;
      double v13 = v22;
      double v14 = v23;

      goto LABEL_5;
    }
    [(SBEntityRemovalCrossblurSwitcherModifier *)self containerViewBounds];
  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    [(SBEntityRemovalCrossblurSwitcherModifier *)&v24 frameForIndex:a3];
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
LABEL_5:

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBEntityRemovalCrossblurSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_appLayout isEqual:v6]
    && ![(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    double v8 = 1.0;
    if (!SBReduceMotion())
    {
      double v10 = [(SBEntityRemovalCrossblurSwitcherModifier *)self entityRemovalSettings];
      double v11 = [v10 dosidoDeleteIntentAnimationSettings];
      [v11 fromViewFinalScale];
      double v8 = v12;
    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    [(SBEntityRemovalCrossblurSwitcherModifier *)&v13 scaleForIndex:a3];
    double v8 = v7;
  }

  return v8;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  uint64_t v5 = [(SBEntityRemovalCrossblurSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if (![(SBAppLayout *)self->_appLayout isEqual:v6]
    || (double v7 = 0.5, v8 = 0.5, [(SBTransitionSwitcherModifier *)self isPreparingLayout]))
  {
    v13.receiver = self;
    v13.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    [(SBEntityRemovalCrossblurSwitcherModifier *)&v13 anchorPointForIndex:a3];
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
  uint64_t v5 = [(SBEntityRemovalCrossblurSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_appLayout isEqual:v6]
    && ![(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    BOOL v7 = [(SBEntityRemovalCrossblurSwitcherModifier *)&v9 shouldPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  uint64_t v5 = [(SBEntityRemovalCrossblurSwitcherModifier *)self appLayouts];
  objc_super v6 = [v5 objectAtIndex:a3];

  if ([(SBAppLayout *)self->_appLayout isEqual:v6]
    && ![(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    BOOL v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    BOOL v7 = [(SBEntityRemovalCrossblurSwitcherModifier *)&v9 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
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
    v8.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    [(SBEntityRemovalCrossblurSwitcherModifier *)&v8 perspectiveAngleForAppLayout:v4];
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
    double v18 = [(SBEntityRemovalCrossblurSwitcherModifier *)self appLayouts];
    -[SBEntityRemovalCrossblurSwitcherModifier frameForIndex:](self, "frameForIndex:", [v18 indexOfObject:self->_appLayout]);
    double v11 = v19;
    double v13 = v20;
    double v15 = v21;
    double v17 = v22;
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    -[SBEntityRemovalCrossblurSwitcherModifier adjustedSpaceAccessoryViewFrame:forAppLayout:](&v27, sel_adjustedSpaceAccessoryViewFrame_forAppLayout_, v9, x, y, width, height);
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
    || (v8 = 0.5, double v9 = 0.5, [(SBTransitionSwitcherModifier *)self isPreparingLayout]))
  {
    v14.receiver = self;
    v14.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    -[SBEntityRemovalCrossblurSwitcherModifier adjustedSpaceAccessoryViewAnchorPoint:forAppLayout:](&v14, sel_adjustedSpaceAccessoryViewAnchorPoint_forAppLayout_, v7, x, y);
    double v8 = v10;
    double v9 = v11;
  }

  double v12 = v8;
  double v13 = v9;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  if ([v4 switcherLayoutElementType] || !objc_msgSend(v4, "isEqual:", self->_appLayout))
  {
    v12.receiver = self;
    v12.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    double v8 = [(SBTransitionSwitcherModifier *)&v12 animationAttributesForLayoutElement:v4];
  }
  else
  {
    double v5 = [(SBEntityRemovalCrossblurSwitcherModifier *)self entityRemovalSettings];
    double v6 = [v5 dosidoDeleteIntentAnimationSettings];

    v13.receiver = self;
    v13.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    id v7 = [(SBTransitionSwitcherModifier *)&v13 animationAttributesForLayoutElement:v4];
    double v8 = (void *)[v7 mutableCopy];

    double v9 = [v6 fromViewScaleAnimationSettings];
    [v8 setLayoutSettings:v9];

    double v10 = [v6 fromViewAlphaAnimationSettings];
    [v8 setOpacitySettings:v10];
  }
  return v8;
}

- (id)topMostLayoutElements
{
  v6.receiver = self;
  v6.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  BOOL v3 = [(SBEntityRemovalCrossblurSwitcherModifier *)&v6 topMostLayoutElements];
  id v4 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_appLayout, 0);

  return v4;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
  id v4 = [(SBEntityRemovalCrossblurSwitcherModifier *)&v7 appLayoutsToEnsureExistForMainTransitionEvent:a3];
  double v5 = objc_msgSend(v4, "sb_arrayByAddingOrMovingObject:", self->_appLayout);

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  if ([(SBAppLayout *)self->_appLayout isEqual:v8]
    && ![(SBTransitionSwitcherModifier *)self isPreparingLayout])
  {
    if (self->_animateOpacity)
    {
      objc_super v12 = [(SBEntityRemovalCrossblurSwitcherModifier *)self entityRemovalSettings];
      objc_super v13 = [v12 dosidoDeleteIntentAnimationSettings];
      [v13 fromViewFinalAlpha];
      double v10 = v14;
    }
    else
    {
      double v10 = 1.0;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)SBEntityRemovalCrossblurSwitcherModifier;
    [(SBEntityRemovalCrossblurSwitcherModifier *)&v15 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v10 = v9;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toHomeRemovalModifier, 0);
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_transitionID, 0);
}

@end