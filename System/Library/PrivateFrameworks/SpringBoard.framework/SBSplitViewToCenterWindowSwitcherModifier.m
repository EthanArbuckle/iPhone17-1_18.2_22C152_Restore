@interface SBSplitViewToCenterWindowSwitcherModifier
- (BOOL)_isItemBeingMovedToCenter:(id)a3;
- (BOOL)_isItemBeingResized:(id)a3;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (SBSplitViewToCenterWindowSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)handleSceneReadyEvent:(id)a3;
@end

@implementation SBSplitViewToCenterWindowSwitcherModifier

- (SBSplitViewToCenterWindowSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"SBSplitViewToCenterWindowSwitcherModifier.m", 30, @"Invalid parameter not satisfying: %@", @"fromAppLayout" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SBSplitViewToCenterWindowSwitcherModifier.m", 31, @"Invalid parameter not satisfying: %@", @"toAppLayout" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
  v13 = [(SBTransitionSwitcherModifier *)&v23 initWithTransitionID:v9];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fromAppLayout, a4);
    objc_storeStrong((id *)&v14->_toAppLayout, a5);
    fromAppLayout = v14->_fromAppLayout;
    v16 = [(SBAppLayout *)v14->_toAppLayout itemForLayoutRole:4];
    v14->_int64_t layoutRoleBeingMoved = [(SBAppLayout *)fromAppLayout layoutRoleForItem:v16];

    int64_t layoutRoleBeingMoved = v14->_layoutRoleBeingMoved;
    if (!layoutRoleBeingMoved)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:v14 file:@"SBSplitViewToCenterWindowSwitcherModifier.m" lineNumber:37 description:@"Couldn't find the new center item in the from appLayout"];

      int64_t layoutRoleBeingMoved = v14->_layoutRoleBeingMoved;
    }
    if (layoutRoleBeingMoved == 1) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 1;
    }
    v14->_layoutRoleBeingResized = v18;
  }

  return v14;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
  v3 = [(SBSwitcherModifier *)&v7 handleSceneReadyEvent:a3];
  v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:3];
  v5 = SBAppendSwitcherModifierResponse(v4, v3);

  return v5;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
  LOBYTE(v7) = [(SBSplitViewToCenterWindowSwitcherModifier *)&v10 isLayoutRoleBlurred:a3 inAppLayout:v6];
  v8 = [v6 itemForLayoutRole:a3];
  if ([(SBSplitViewToCenterWindowSwitcherModifier *)self _isItemBeingMovedToCenter:v8]
    || [(SBSplitViewToCenterWindowSwitcherModifier *)self _isItemBeingResized:v8])
  {
    int v7 = [(SBSplitViewToCenterWindowSwitcherModifier *)self isLayoutRoleContentReady:a3 inAppLayout:v6] ^ 1;
  }

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
  id v6 = a4;
  [(SBSplitViewToCenterWindowSwitcherModifier *)&v14 blurDelayForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  id v9 = objc_msgSend(v6, "itemForLayoutRole:", a3, v14.receiver, v14.super_class);

  if ([(SBSplitViewToCenterWindowSwitcherModifier *)self _isItemBeingMovedToCenter:v9]
    || [(SBSplitViewToCenterWindowSwitcherModifier *)self _isItemBeingResized:v9])
  {
    objc_super v10 = [(SBSplitViewToCenterWindowSwitcherModifier *)self switcherSettings];
    id v11 = [v10 animationSettings];
    [v11 resizeBlurDelay];
    double v8 = v12;
  }
  return v8;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
  id v6 = a4;
  BOOL v7 = [(SBSplitViewToCenterWindowSwitcherModifier *)&v10 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  double v8 = objc_msgSend(v6, "itemForLayoutRole:", a3, v10.receiver, v10.super_class);

  if ([(SBSplitViewToCenterWindowSwitcherModifier *)self _isItemBeingMovedToCenter:v8]
    || [(SBSplitViewToCenterWindowSwitcherModifier *)self _isItemBeingResized:v8])
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  v5 = [(SBAppLayout *)self->_fromAppLayout itemForLayoutRole:self->_layoutRoleBeingResized];
  int v6 = [v4 containsItem:v5];

  if (v6)
  {
    unsigned __int16 v7 = SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
    unsigned __int16 v7 = (unsigned __int16)[(SBTransitionSwitcherModifier *)&v10 asyncRenderingAttributesForAppLayout:v4];
  }
  SBSwitcherAsyncRenderingAttributes v8 = (SBSwitcherAsyncRenderingAttributes)v7;

  return v8;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight = a5.topRight;
  double bottomRight = a5.bottomRight;
  double bottomLeft = a5.bottomLeft;
  double topLeft = a5.topLeft;
  v31.receiver = self;
  v31.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
  id v11 = a4;
  -[SBSplitViewToCenterWindowSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](&v31, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, a3, v11, topLeft, bottomLeft, bottomRight, topRight);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(SBSplitViewToCenterWindowSwitcherModifier *)self displayCornerRadius];
  v20 = [v11 itemForLayoutRole:a3];

  if ([(SBSplitViewToCenterWindowSwitcherModifier *)self _isItemBeingMovedToCenter:v20])
  {
    toAppLayout = self->_toAppLayout;
    v30.receiver = self;
    v30.super_class = (Class)SBSplitViewToCenterWindowSwitcherModifier;
    -[SBSplitViewToCenterWindowSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](&v30, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, 4, toAppLayout, topLeft, bottomLeft, bottomRight, topRight);
LABEL_5:
    double v13 = v22;
    double v15 = v23;
    double v17 = v24;
    double v19 = v25;
    goto LABEL_6;
  }
  if ([(SBSplitViewToCenterWindowSwitcherModifier *)self _isItemBeingResized:v20])
  {
    SBRectCornerRadiiForRadius();
    goto LABEL_5;
  }
LABEL_6:

  double v26 = v13;
  double v27 = v15;
  double v28 = v17;
  double v29 = v19;
  result.double topRight = v29;
  result.double bottomRight = v28;
  result.double bottomLeft = v27;
  result.double topLeft = v26;
  return result;
}

- (BOOL)_isItemBeingMovedToCenter:(id)a3
{
  fromAppLayout = self->_fromAppLayout;
  int64_t layoutRoleBeingMoved = self->_layoutRoleBeingMoved;
  id v5 = a3;
  int v6 = [(SBAppLayout *)fromAppLayout itemForLayoutRole:layoutRoleBeingMoved];
  LOBYTE(layoutRoleBeingMoved) = [v6 isEqual:v5];

  return layoutRoleBeingMoved;
}

- (BOOL)_isItemBeingResized:(id)a3
{
  fromAppLayout = self->_fromAppLayout;
  int64_t layoutRoleBeingResized = self->_layoutRoleBeingResized;
  id v5 = a3;
  int v6 = [(SBAppLayout *)fromAppLayout itemForLayoutRole:layoutRoleBeingResized];
  LOBYTE(layoutRoleBeingResized) = [v6 isEqual:v5];

  return layoutRoleBeingResized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end