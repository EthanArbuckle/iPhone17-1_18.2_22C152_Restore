@interface SBCenterWindowToSlideOverSwitcherModifier
- (BOOL)_shouldBlurAndStretchLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)wantsSlideOverTongue;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBCenterWindowToSlideOverSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 fromFloatingAppLayout:(id)a6 toFloatingAppLayout:(id)a7 toFloatingConfiguration:(int64_t)a8 direction:(unint64_t)a9;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3;
- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)scaleForIndex:(unint64_t)a3;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionWillBegin;
- (id)visibleAppLayouts;
@end

@implementation SBCenterWindowToSlideOverSwitcherModifier

- (SBCenterWindowToSlideOverSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 fromFloatingAppLayout:(id)a6 toFloatingAppLayout:(id)a7 toFloatingConfiguration:(int64_t)a8 direction:(unint64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v38 = a7;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"SBCenterWindowToSlideOverSwitcherModifier.m", 54, @"Invalid parameter not satisfying: %@", @"fromAppLayout" object file lineNumber description];

    if (v18) {
      goto LABEL_3;
    }
  }
  v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, self, @"SBCenterWindowToSlideOverSwitcherModifier.m", 55, @"Invalid parameter not satisfying: %@", @"toAppLayout" object file lineNumber description];

LABEL_3:
  v41.receiver = self;
  v41.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  v20 = [(SBTransitionSwitcherModifier *)&v41 initWithTransitionID:v16];
  v21 = v20;
  if (v20)
  {
    if (a9 == 1) {
      v22 = v18;
    }
    else {
      v22 = v17;
    }
    objc_storeStrong((id *)&v20->_fullScreenWithCenterAppLayout, v22);
    v21->_floatingConfiguration = a8;
    if (a9 != 1)
    {
      if (!v19 || a9)
      {
        v21->_kind = 0;
        if (a9) {
          goto LABEL_17;
        }
        p_movingAppLayout = (id *)&v21->_movingAppLayout;
        id v34 = a7;
      }
      else
      {
        v21->_kind = 2;
        uint64_t v31 = [v38 leafAppLayoutForRole:1];
        movingAppLayout = v21->_movingAppLayout;
        v21->_movingAppLayout = (SBAppLayout *)v31;

        objc_storeStrong((id *)&v21->_fullScreenWithoutCenterAppLayout, a5);
        p_movingAppLayout = (id *)&v21->_outgoingFloatingAppLayout;
        id v34 = a6;
      }
      objc_storeStrong(p_movingAppLayout, v34);
      goto LABEL_17;
    }
    v23 = [v17 itemForLayoutRole:4];

    if (v23)
    {
      v21->_kind = 1;
      uint64_t v24 = [v18 leafAppLayoutForRole:4];
      v25 = v21->_movingAppLayout;
      v21->_movingAppLayout = (SBAppLayout *)v24;

      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __168__SBCenterWindowToSlideOverSwitcherModifier_initWithTransitionID_fromAppLayout_toAppLayout_fromFloatingAppLayout_toFloatingAppLayout_toFloatingConfiguration_direction___block_invoke;
      v39[3] = &unk_1E6AF4B38;
      v26 = v21;
      v40 = v26;
      uint64_t v27 = [v18 appLayoutWithItemsPassingTest:v39];
      fullScreenWithoutCenterAppLayout = v26->_fullScreenWithoutCenterAppLayout;
      v26->_fullScreenWithoutCenterAppLayout = (SBAppLayout *)v27;

      uint64_t v29 = [v17 leafAppLayoutForRole:4];
      outgoingCenterWindowAppLayout = v26->_outgoingCenterWindowAppLayout;
      v26->_outgoingCenterWindowAppLayout = (SBAppLayout *)v29;
    }
    else
    {
      v21->_kind = 0;
    }
  }
LABEL_17:

  return v21;
}

uint64_t __168__SBCenterWindowToSlideOverSwitcherModifier_initWithTransitionID_fromAppLayout_toAppLayout_fromFloatingAppLayout_toFloatingAppLayout_toFloatingConfiguration_direction___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 160) containsItem:a2] ^ 1;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  v3 = [(SBSwitcherModifier *)&v7 handleSceneReadyEvent:a3];
  v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:3];
  v5 = SBAppendSwitcherModifierResponse(v4, v3);

  return v5;
}

- (id)transitionWillBegin
{
  v21.receiver = self;
  v21.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v21 transitionWillBegin];
  if (self->_kind)
  {
    v4 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    v5 = SBAppendSwitcherModifierResponse(v4, v3);

    if (self->_kind == 2 && !self->_isInSecondStageOfDosidoAnimation)
    {
      objc_super v7 = [(SBCenterWindowToSlideOverSwitcherModifier *)self switcherSettings];
      v8 = [v7 floatingSwitcherSettings];
      [v8 overshootPullbackDelayOnscreen];
      double v10 = v9;

      UIAnimationDragCoefficient();
      float v12 = v11;
      objc_initWeak(&location, self);
      v13 = [SBTimerEventSwitcherEventResponse alloc];
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      id v17 = __64__SBCenterWindowToSlideOverSwitcherModifier_transitionWillBegin__block_invoke;
      id v18 = &unk_1E6AF90F0;
      objc_copyWeak(&v19, &location);
      v14 = [(SBTimerEventSwitcherEventResponse *)v13 initWithDelay:&v15 validator:@"kSBCenterWindowToSlideOverSwitcherModifierDosidoReason" reason:v10 * v12];
      v3 = +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v14, v5, v15, v16, v17, v18);

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
    else
    {
      v3 = v5;
    }
  }
  return v3;
}

BOOL __64__SBCenterWindowToSlideOverSwitcherModifier_transitionWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)handleTimerEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  id v4 = a3;
  v5 = [(SBTransitionSwitcherModifier *)&v10 handleTimerEvent:v4];
  v6 = objc_msgSend(v4, "reason", v10.receiver, v10.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"kSBCenterWindowToSlideOverSwitcherModifierDosidoReason"];
  if (v4)
  {
    self->_isInSecondStageOfDosidoAnimation = 1;
    objc_super v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:3];
    uint64_t v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v7 toResponse:v5];

    v5 = (void *)v8;
  }
  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v11 adjustedAppLayoutsForAppLayouts:a3];
  v5 = v4;
  if (self->_kind == 1)
  {
    uint64_t v6 = [v4 indexOfObjectPassingTest:&__block_literal_global_250];
    if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v6 = [v5 count];
    }
    objc_super v7 = objc_msgSend(v5, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_movingAppLayout, v6);

    uint64_t v8 = objc_msgSend(v7, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_outgoingCenterWindowAppLayout, v6 + 1);

    double v9 = objc_msgSend(v8, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_fullScreenWithoutCenterAppLayout, v6 + 2);

    v5 = objc_msgSend(v9, "sb_arrayByRemovingObject:", self->_fullScreenWithCenterAppLayout);
  }
  return v5;
}

BOOL __77__SBCenterWindowToSlideOverSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 environment] == 1;
}

- (id)visibleAppLayouts
{
  v8.receiver = self;
  v8.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  BOOL v3 = [(SBCenterWindowToSlideOverSwitcherModifier *)&v8 visibleAppLayouts];
  id v4 = (void *)[v3 mutableCopy];

  unint64_t kind = self->_kind;
  if (kind == 2)
  {
    uint64_t v6 = &OBJC_IVAR___SBCenterWindowToSlideOverSwitcherModifier__outgoingFloatingAppLayout;
  }
  else
  {
    if (kind != 1) {
      goto LABEL_6;
    }
    [v4 removeObject:self->_fullScreenWithCenterAppLayout];
    [v4 addObject:self->_movingAppLayout];
    [v4 addObject:self->_outgoingCenterWindowAppLayout];
    uint64_t v6 = &OBJC_IVAR___SBCenterWindowToSlideOverSwitcherModifier__fullScreenWithoutCenterAppLayout;
  }
  [v4 addObject:*(Class *)((char *)&self->super.super.super.super.isa + *v6)];
LABEL_6:
  return v4;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v36.receiver = self;
  v36.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier frameForIndex:](&v36, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  unint64_t kind = self->_kind;
  if (kind == 2)
  {
    v25 = [(SBCenterWindowToSlideOverSwitcherModifier *)self appLayouts];
    uint64_t v15 = [v25 objectAtIndex:a3];

    if (v15 == self->_outgoingFloatingAppLayout && !self->_isInSecondStageOfDosidoAnimation)
    {
      v26 = [(SBCenterWindowToSlideOverSwitcherModifier *)self medusaSettings];
      [v26 switcherSlideOverDosidoLayoutOvershootMultiplicationFactor];
      double v28 = v27;
      double v29 = v10 * v27;

      int v30 = [(SBCenterWindowToSlideOverSwitcherModifier *)self isRTLEnabled];
      double v31 = -(v10 * v28);
      if (!v30) {
        double v31 = v29;
      }
      if (self->_floatingConfiguration == 1) {
        double v31 = -v31;
      }
      double v6 = v6 + v31;
    }
    goto LABEL_13;
  }
  if (kind == 1)
  {
    v14 = [(SBCenterWindowToSlideOverSwitcherModifier *)self appLayouts];
    uint64_t v15 = [v14 objectAtIndex:a3];

    if (v15 == self->_outgoingCenterWindowAppLayout || v15 == self->_movingAppLayout)
    {
      fullScreenWithCenterAppLayout = self->_fullScreenWithCenterAppLayout;
      [(SBCenterWindowToSlideOverSwitcherModifier *)self containerViewBounds];
      -[SBCenterWindowToSlideOverSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", 4, fullScreenWithCenterAppLayout, [(SBCenterWindowToSlideOverSwitcherModifier *)self switcherInterfaceOrientation], v17, v18, v19, v20);
      double v6 = v21;
      double v8 = v22;
      double v10 = v23;
      double v12 = v24;
    }
LABEL_13:
  }
  double v32 = v6;
  double v33 = v8;
  double v34 = v10;
  double v35 = v12;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = (SBAppLayout *)a4;
  v24.receiver = self;
  v24.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v24, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (self->_kind == 1
    && (self->_outgoingCenterWindowAppLayout == v11
     || self->_movingAppLayout == v11
     || self->_fullScreenWithoutCenterAppLayout == v11))
  {
    double v19 = height;
    double v17 = width;
    double v15 = y;
    double v13 = x;
  }

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.size.double height = v23;
  result.size.double width = v22;
  result.origin.double y = v21;
  result.origin.double x = v20;
  return result;
}

- (id)topMostLayoutElements
{
  v12.receiver = self;
  v12.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  BOOL v3 = [(SBCenterWindowToSlideOverSwitcherModifier *)&v12 topMostLayoutElements];
  id v4 = v3;
  unint64_t kind = self->_kind;
  if (kind == 2)
  {
    if (self->_isInSecondStageOfDosidoAnimation) {
      goto LABEL_7;
    }
    outgoingFloatingAppLayout = self->_outgoingFloatingAppLayout;
    uint64_t v9 = 0;
  }
  else
  {
    if (kind != 1) {
      goto LABEL_7;
    }
    double v6 = objc_msgSend(v3, "sb_arrayByRemovingObject:", self->_fullScreenWithCenterAppLayout);

    double v7 = objc_msgSend(v6, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_movingAppLayout, 0);

    id v4 = objc_msgSend(v7, "sb_arrayByInsertingOrMovingObject:toIndex:", self->_outgoingCenterWindowAppLayout, 1);

    outgoingFloatingAppLayout = self->_fullScreenWithoutCenterAppLayout;
    BOOL v3 = v4;
    uint64_t v9 = 2;
  }
  uint64_t v10 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", outgoingFloatingAppLayout, v9);

  id v4 = (void *)v10;
LABEL_7:
  return v4;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  double v6 = (SBAppLayout *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  [(SBCenterWindowToSlideOverSwitcherModifier *)&v13 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  unint64_t kind = self->_kind;
  if (kind == 2)
  {
    if (self->_outgoingFloatingAppLayout == v6 && self->_isInSecondStageOfDosidoAnimation) {
      goto LABEL_8;
    }
  }
  else if (kind == 1 && (self->_fullScreenWithoutCenterAppLayout == v6 || self->_outgoingCenterWindowAppLayout == v6))
  {
LABEL_8:
    uint64_t v10 = [(SBCenterWindowToSlideOverSwitcherModifier *)self medusaSettings];
    [v10 defaultDimmingOpacity];
    double v8 = v11;
  }
  return v8;
}

- (double)scaleForIndex:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier scaleForIndex:](&v12, sel_scaleForIndex_);
  double v6 = v5;
  if (self->_kind == 2)
  {
    double v7 = [(SBCenterWindowToSlideOverSwitcherModifier *)self appLayouts];
    double v8 = [v7 objectAtIndex:a3];

    if (v8 == self->_outgoingFloatingAppLayout)
    {
      double v6 = 1.0;
      if (([(SBCenterWindowToSlideOverSwitcherModifier *)self isReduceMotionEnabled] & 1) == 0)
      {
        uint64_t v9 = [(SBCenterWindowToSlideOverSwitcherModifier *)self medusaSettings];
        [v9 switcherSlideOverContentPushInScale];
        double v6 = v10;
      }
    }
  }
  return v6;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  double v6 = (SBAppLayout *)a4;
  v12.receiver = self;
  v12.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  [(SBCenterWindowToSlideOverSwitcherModifier *)&v12 scaleForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  if (self->_kind == 1 && self->_outgoingCenterWindowAppLayout == v6)
  {
    double v8 = 1.0;
    if (([(SBCenterWindowToSlideOverSwitcherModifier *)self isReduceMotionEnabled] & 1) == 0)
    {
      uint64_t v9 = [(SBCenterWindowToSlideOverSwitcherModifier *)self medusaSettings];
      [v9 switcherCenterWindowContentPushInScale];
      double v8 = v10;
    }
  }

  return v8;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  id v4 = [(SBTransitionSwitcherModifier *)&v10 animationAttributesForLayoutElement:a3];
  double v5 = (void *)[v4 mutableCopy];

  double v6 = [(SBCenterWindowToSlideOverSwitcherModifier *)self switcherSettings];
  double v7 = [v6 animationSettings];
  double v8 = [v7 centerToSlideOverAnimationSettings];
  [v5 setLayoutSettings:v8];

  return v5;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  double v8 = (objc_class *)a4;
  v14.receiver = self;
  v14.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  [(SBCenterWindowToSlideOverSwitcherModifier *)&v14 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
  double v10 = v9;
  unint64_t kind = self->_kind;
  if (kind == 1)
  {
    objc_super v12 = &OBJC_IVAR___SBCenterWindowToSlideOverSwitcherModifier__outgoingCenterWindowAppLayout;
  }
  else
  {
    if (kind != 2) {
      goto LABEL_7;
    }
    objc_super v12 = &OBJC_IVAR___SBCenterWindowToSlideOverSwitcherModifier__outgoingFloatingAppLayout;
  }
  if (*(objc_class **)((char *)&self->super.super.super.super.isa + *v12) == v8) {
    double v10 = 1.0;
  }
LABEL_7:

  return v10;
}

- (double)shadowOpacityForLayoutRole:(int64_t)a3 atIndex:(unint64_t)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier shadowOpacityForLayoutRole:atIndex:](&v11, sel_shadowOpacityForLayoutRole_atIndex_, a3);
  double v7 = v6;
  double v8 = [(SBCenterWindowToSlideOverSwitcherModifier *)self appLayouts];
  double v9 = [v8 objectAtIndex:a4];

  if (v9 == self->_outgoingCenterWindowAppLayout) {
    double v7 = 0.0;
  }

  return v7;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight = a5.topRight;
  double bottomRight = a5.bottomRight;
  double bottomLeft = a5.bottomLeft;
  double topLeft = a5.topLeft;
  objc_super v11 = (SBAppLayout *)a4;
  v30.receiver = self;
  v30.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  -[SBCenterWindowToSlideOverSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](&v30, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, a3, v11, topLeft, bottomLeft, bottomRight, topRight);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (self->_kind == 1 && (self->_movingAppLayout == v11 || self->_outgoingCenterWindowAppLayout == v11))
  {
    fullScreenWithCenterAppLayout = self->_fullScreenWithCenterAppLayout;
    v29.receiver = self;
    v29.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
    -[SBCenterWindowToSlideOverSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](&v29, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, 4, fullScreenWithCenterAppLayout, topLeft, bottomLeft, bottomRight, topRight);
    double v13 = v21;
    double v15 = v22;
    double v17 = v23;
    double v19 = v24;
  }

  double v25 = v13;
  double v26 = v15;
  double v27 = v17;
  double v28 = v19;
  result.double topRight = v28;
  result.double bottomRight = v27;
  result.double bottomLeft = v26;
  result.double topLeft = v25;
  return result;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  LOBYTE(v7) = [(SBCenterWindowToSlideOverSwitcherModifier *)&v9 isLayoutRoleBlurred:a3 inAppLayout:v6];
  if ([(SBCenterWindowToSlideOverSwitcherModifier *)self _shouldBlurAndStretchLayoutRole:a3 inAppLayout:v6])
  {
    int v7 = [(SBCenterWindowToSlideOverSwitcherModifier *)self isLayoutRoleContentReady:a3 inAppLayout:v6] ^ 1;
  }

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  id v6 = a4;
  [(SBCenterWindowToSlideOverSwitcherModifier *)&v13 blurDelayForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  LODWORD(a3) = -[SBCenterWindowToSlideOverSwitcherModifier _shouldBlurAndStretchLayoutRole:inAppLayout:](self, "_shouldBlurAndStretchLayoutRole:inAppLayout:", a3, v6, v13.receiver, v13.super_class);

  if (a3)
  {
    objc_super v9 = [(SBCenterWindowToSlideOverSwitcherModifier *)self switcherSettings];
    double v10 = [v9 animationSettings];
    [v10 resizeBlurDelay];
    double v8 = v11;
  }
  return v8;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  id v6 = a4;
  unsigned __int8 v7 = [(SBCenterWindowToSlideOverSwitcherModifier *)&v9 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  LOBYTE(a3) = -[SBCenterWindowToSlideOverSwitcherModifier _shouldBlurAndStretchLayoutRole:inAppLayout:](self, "_shouldBlurAndStretchLayoutRole:inAppLayout:", a3, v6, v9.receiver, v9.super_class);

  return a3 | v7;
}

- (BOOL)wantsSlideOverTongue
{
  return 0;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3
{
  retstr->var3 = 0;
  *(_OWORD *)&retstr->var1.origin.double y = 0u;
  *(_OWORD *)&retstr->var1.size.double height = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  v6.receiver = self;
  v6.super_class = (Class)SBCenterWindowToSlideOverSwitcherModifier;
  UIRectCornerRadii result = (SBSwitcherShelfPresentationAttributes *)[(SBSwitcherShelfPresentationAttributes *)&v6 presentationAttributesForShelf:a4];
  retstr->var0 = 0;
  return result;
}

- (BOOL)_shouldBlurAndStretchLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  if (self->_movingAppLayout == a4) {
    return 1;
  }
  return self->_fullScreenWithCenterAppLayout == a4 && a3 == 4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_outgoingCenterWindowAppLayout, 0);
  objc_storeStrong((id *)&self->_fullScreenWithoutCenterAppLayout, 0);
  objc_storeStrong((id *)&self->_movingAppLayout, 0);
  objc_storeStrong((id *)&self->_fullScreenWithCenterAppLayout, 0);
}

@end