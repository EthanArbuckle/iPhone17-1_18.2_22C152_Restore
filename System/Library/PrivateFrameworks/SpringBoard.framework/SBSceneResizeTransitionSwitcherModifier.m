@interface SBSceneResizeTransitionSwitcherModifier
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBAppLayout)selectedAppLayout;
- (SBSceneResizeTransitionSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 minimumCardWithForDismissal:(double)a6;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3;
- (void)setSelectedAppLayout:(id)a3;
@end

@implementation SBSceneResizeTransitionSwitcherModifier

- (SBSceneResizeTransitionSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 minimumCardWithForDismissal:(double)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = v13;
  if (!v12 || !v13)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"SBSceneResizeTransitionSwitcherModifier.m", 33, @"Invalid parameter not satisfying: %@", @"fromAppLayout && toAppLayout" object file lineNumber description];
  }
  if (([v12 isSplitConfiguration] & 1) == 0)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SBSceneResizeTransitionSwitcherModifier.m", 34, @"Invalid parameter not satisfying: %@", @"[fromAppLayout isSplitConfiguration]" object file lineNumber description];
  }
  v30.receiver = self;
  v30.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  v15 = [(SBTransitionSwitcherModifier *)&v30 initWithTransitionID:v11];
  v16 = v15;
  if (v15)
  {
    p_fromAppLayout = (void **)&v15->_fromAppLayout;
    objc_storeStrong((id *)&v15->_fromAppLayout, a4);
    objc_storeStrong((id *)&v16->_toAppLayout, a5);
    v16->_minimumCardWithForDismissal = a6;
    v18 = *p_fromAppLayout;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __118__SBSceneResizeTransitionSwitcherModifier_initWithTransitionID_fromAppLayout_toAppLayout_minimumCardWithForDismissal___block_invoke;
    v28[3] = &unk_1E6AF4B38;
    v19 = v16;
    v29 = v19;
    uint64_t v20 = [v18 appLayoutWithItemsPassingTest:v28];
    discardedAppLayout = v19->_discardedAppLayout;
    v19->_discardedAppLayout = (SBAppLayout *)v20;

    v22 = v19->_discardedAppLayout;
    if (v22)
    {
      v23 = *p_fromAppLayout;
      v24 = [(SBAppLayout *)v22 itemForLayoutRole:1];
      v19->_discardedLayoutRole = [v23 layoutRoleForItem:v24];
    }
    else
    {
      v19->_discardedLayoutRole = 0;
    }
  }
  return v16;
}

uint64_t __118__SBSceneResizeTransitionSwitcherModifier_initWithTransitionID_fromAppLayout_toAppLayout_minimumCardWithForDismissal___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 144) containsItem:a2] ^ 1;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  v4 = [(SBTransitionSwitcherModifier *)&v9 animationAttributesForLayoutElement:a3];
  v5 = (void *)[v4 mutableCopy];

  v6 = [(SBSceneResizeTransitionSwitcherModifier *)self medusaSettings];
  v7 = [v6 medusaAnimationSettings];

  [v5 setLayoutSettings:v7];
  [v5 setPositionSettings:v7];
  [v5 setScaleSettings:v7];
  [v5 setOpacitySettings:v7];
  [v5 setCornerRadiusSettings:v7];
  [v5 setUpdateMode:3];

  return v5;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  v3 = [(SBSwitcherModifier *)&v7 handleSceneReadyEvent:a3];
  v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:3];
  v5 = SBAppendSwitcherModifierResponse(v4, v3);

  return v5;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  BOOL v7 = [(SBSceneResizeTransitionSwitcherModifier *)&v9 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  if ([(SBAppLayout *)self->_toAppLayout isOrContainsAppLayout:v6]
    || [(SBAppLayout *)self->_discardedAppLayout isOrContainsAppLayout:v6])
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  BOOL v7 = [v6 leafAppLayoutForRole:a3];
  if (![(SBAppLayout *)self->_fromAppLayout isOrContainsAppLayout:v7]
    && ![(SBAppLayout *)self->_toAppLayout isOrContainsAppLayout:v7])
  {
    v14.receiver = self;
    v14.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
    LOBYTE(self) = [(SBSceneResizeTransitionSwitcherModifier *)&v14 isLayoutRoleBlurred:a3 inAppLayout:v6];
    goto LABEL_18;
  }
  fromAppLayout = self->_fromAppLayout;
  if (fromAppLayout == self->_toAppLayout) {
    goto LABEL_15;
  }
  discardedAppLayout = self->_discardedAppLayout;
  if (discardedAppLayout) {
    BOOL v10 = v7 == discardedAppLayout;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    LOBYTE(self) = 1;
    goto LABEL_18;
  }
  if (discardedAppLayout) {
    BOOL v11 = v7 == discardedAppLayout;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if ([(SBAppLayout *)fromAppLayout isOrContainsAppLayout:v7])
    {
      int v12 = [(SBSceneResizeTransitionSwitcherModifier *)self isLayoutRoleContentReady:1 inAppLayout:self->_fromAppLayout];
      LODWORD(self) = v12 & [(SBSceneResizeTransitionSwitcherModifier *)self isLayoutRoleContentReady:2 inAppLayout:self->_fromAppLayout] ^ 1;
      goto LABEL_18;
    }
LABEL_15:
    LOBYTE(self) = 0;
    goto LABEL_18;
  }
  LODWORD(self) = [(SBSceneResizeTransitionSwitcherModifier *)self isLayoutRoleContentReady:1 inAppLayout:v7] ^ 1;
LABEL_18:

  return (char)self;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  id v8 = a4;
  [(SBSceneResizeTransitionSwitcherModifier *)&v14 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
  double v10 = v9;
  LODWORD(a5) = objc_msgSend(v8, "isOrContainsAppLayout:", self->_discardedAppLayout, v14.receiver, v14.super_class);

  if (a5)
  {
    BOOL v11 = [(SBSceneResizeTransitionSwitcherModifier *)self medusaSettings];
    [v11 resizeAnimationDismissItemOpacity];
    double v10 = v12;
  }
  return v10;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (self->_discardedAppLayout)
  {
    v5[0] = self->_discardedAppLayout;
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  v27.receiver = self;
  v27.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  -[SBSceneResizeTransitionSwitcherModifier frameForIndex:](&v27, sel_frameForIndex_);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  id v13 = [(SBSceneResizeTransitionSwitcherModifier *)self appLayouts];
  objc_super v14 = [v13 objectAtIndex:a3];

  if ([v14 isOrContainsAppLayout:self->_discardedAppLayout])
  {
    [(SBSceneResizeTransitionSwitcherModifier *)self switcherViewBounds];
    double v16 = v15;
    [(SBSceneResizeTransitionSwitcherModifier *)self separatorViewWidth];
    double v18 = v17 * 0.5;
    double minimumCardWithForDismissal = self->_minimumCardWithForDismissal;
    SBRectWithSize();
    double v10 = v20;
    double v12 = v21;
    int64_t discardedLayoutRole = self->_discardedLayoutRole;
    if (discardedLayoutRole == 1)
    {
      if ([(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] != 1) {
        goto LABEL_7;
      }
      int64_t discardedLayoutRole = self->_discardedLayoutRole;
    }
    if (discardedLayoutRole != 2 || [(id)*MEMORY[0x1E4F43630] userInterfaceLayoutDirection] != 1)
    {
      double v6 = v16 + v18;
      goto LABEL_9;
    }
LABEL_7:
    double v6 = -(v18 + minimumCardWithForDismissal);
LABEL_9:
    double v8 = 0.0;
  }

  double v23 = v6;
  double v24 = v8;
  double v25 = v10;
  double v26 = v12;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  id v11 = a4;
  -[SBSceneResizeTransitionSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v31, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  objc_msgSend(v11, "leafAppLayoutForRole:", a3, v31.receiver, v31.super_class);
  double v20 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  discardedAppLayout = self->_discardedAppLayout;
  if (discardedAppLayout) {
    BOOL v22 = v20 == discardedAppLayout;
  }
  else {
    BOOL v22 = 0;
  }
  if (v22)
  {
    SBRectWithSize();
    double v13 = v23;
    double v15 = v24;
    double v17 = v25;
    double v19 = v26;
  }

  double v27 = v13;
  double v28 = v15;
  double v29 = v17;
  double v30 = v19;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  [(SBSceneResizeTransitionSwitcherModifier *)self displayCornerRadius];
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  double v5 = [(SBSceneResizeTransitionSwitcherModifier *)self appLayouts];
  double v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_toAppLayout)
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
    BOOL v7 = [(SBSceneResizeTransitionSwitcherModifier *)&v9 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SBSceneResizeTransitionSwitcherModifier;
  double v4 = [(SBSceneResizeTransitionSwitcherModifier *)&v13 resizeGrabberLayoutAttributesForAppLayout:a3];
  if (self->_discardedAppLayout)
  {
    int v5 = [(SBSceneResizeTransitionSwitcherModifier *)self isRTLEnabled];
    int64_t discardedLayoutRole = self->_discardedLayoutRole;
    if (discardedLayoutRole == 1) {
      int v7 = v5;
    }
    else {
      int v7 = 1;
    }
    BOOL v8 = ((discardedLayoutRole == 2) & v5) == 0;
    uint64_t v9 = 8;
    if (!v8) {
      uint64_t v9 = 2;
    }
    if (v7) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = 2;
    }
    [v4 setEdge:v10];
    id v11 = [(SBAppLayout *)self->_toAppLayout leafAppLayoutForRole:1];
    [v4 setLeafAppLayout:v11];
  }
  return v4;
}

- (SBAppLayout)selectedAppLayout
{
  return self->_selectedAppLayout;
}

- (void)setSelectedAppLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
  objc_storeStrong((id *)&self->_discardedAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end