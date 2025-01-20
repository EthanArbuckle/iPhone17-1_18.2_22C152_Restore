@interface SBCenterWindowToExistingSplitViewSwitcherModifier
- (BOOL)_wasPreviousCenterAppLayout:(id)a3 layoutRole:(int64_t)a4;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBCenterWindowToExistingSplitViewSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (id)handleSceneReadyEvent:(id)a3;
- (id)topMostLayoutRolesForAppLayout:(id)a3;
- (id)visibleAppLayouts;
@end

@implementation SBCenterWindowToExistingSplitViewSwitcherModifier

- (SBCenterWindowToExistingSplitViewSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5
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
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBCenterWindowToExistingSplitViewSwitcherModifier.m", 32, @"Invalid parameter not satisfying: %@", @"fromAppLayout" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"SBCenterWindowToExistingSplitViewSwitcherModifier.m", 33, @"Invalid parameter not satisfying: %@", @"toAppLayout" object file lineNumber description];

LABEL_3:
  v25.receiver = self;
  v25.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  v13 = [(SBTransitionSwitcherModifier *)&v25 initWithTransitionID:v9];
  v14 = v13;
  if (v13)
  {
    p_fromAppLayout = (id *)&v13->_fromAppLayout;
    objc_storeStrong((id *)&v13->_fromAppLayout, a4);
    objc_storeStrong((id *)&v14->_toAppLayout, a5);
    v16 = [*p_fromAppLayout itemForLayoutRole:4];
    uint64_t v17 = [(SBAppLayout *)v14->_toAppLayout layoutRoleForItem:v16];
    v14->_layoutRoleBeingReplaced = v17;
    if (!SBLayoutRoleIsValidForSplitView(v17))
    {
      v23 = [MEMORY[0x1E4F28B00] currentHandler];
      [v23 handleFailureInMethod:a2 object:v14 file:@"SBCenterWindowToExistingSplitViewSwitcherModifier.m" lineNumber:40 description:@"Should only be replacing a split view role"];
    }
    uint64_t v18 = [*p_fromAppLayout leafAppLayoutForRole:v14->_layoutRoleBeingReplaced];
    appLayoutBeingReplaced = v14->_appLayoutBeingReplaced;
    v14->_appLayoutBeingReplaced = (SBAppLayout *)v18;

    if (!v14->_appLayoutBeingReplaced)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2 object:v14 file:@"SBCenterWindowToExistingSplitViewSwitcherModifier.m" lineNumber:43 description:@"Didn't find _appLayoutBeingReplaced"];
    }
  }

  return v14;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  v3 = [(SBSwitcherModifier *)&v7 handleSceneReadyEvent:a3];
  v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:3];
  v5 = SBAppendSwitcherModifierResponse(v4, v3);

  return v5;
}

- (id)visibleAppLayouts
{
  v6.receiver = self;
  v6.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  v3 = [(SBCenterWindowToExistingSplitViewSwitcherModifier *)&v6 visibleAppLayouts];
  v4 = (void *)[v3 mutableCopy];

  [v4 addObject:self->_appLayoutBeingReplaced];
  return v4;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  v34.receiver = self;
  v34.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  id v11 = a4;
  -[SBCenterWindowToExistingSplitViewSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v34, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  LODWORD(a3) = -[SBAppLayout isEqual:](self->_appLayoutBeingReplaced, "isEqual:", v11, v34.receiver, v34.super_class);

  if (a3)
  {
    int64_t layoutRoleBeingReplaced = self->_layoutRoleBeingReplaced;
    fromAppLayout = self->_fromAppLayout;
    [(SBCenterWindowToExistingSplitViewSwitcherModifier *)self containerViewBounds];
    -[SBCenterWindowToExistingSplitViewSwitcherModifier preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:](self, "preferredFrameForLayoutRole:inAppLayout:bounds:interfaceOrientation:", layoutRoleBeingReplaced, fromAppLayout, [(SBCenterWindowToExistingSplitViewSwitcherModifier *)self switcherInterfaceOrientation], v22, v23, v24, v25);
    double v13 = v26;
    double v15 = v27;
    double v17 = v28;
    double v19 = v29;
  }
  double v30 = v13;
  double v31 = v15;
  double v32 = v17;
  double v33 = v19;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  id v8 = a4;
  [(SBCenterWindowToExistingSplitViewSwitcherModifier *)&v12 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
  double v10 = v9;
  LODWORD(a5) = -[SBAppLayout isEqual:](self->_appLayoutBeingReplaced, "isEqual:", v8, v12.receiver, v12.super_class);

  double result = 1.0;
  if (!a5) {
    return v10;
  }
  return result;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  id v6 = a4;
  [(SBCenterWindowToExistingSplitViewSwitcherModifier *)&v12 dimmingAlphaForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  LODWORD(a3) = -[SBAppLayout isEqual:](self->_appLayoutBeingReplaced, "isEqual:", v6, v12.receiver, v12.super_class);

  if (a3)
  {
    double v9 = [(SBCenterWindowToExistingSplitViewSwitcherModifier *)self medusaSettings];
    [v9 defaultDimmingOpacity];
    double v8 = v10;
  }
  return v8;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  LOBYTE(v7) = [(SBCenterWindowToExistingSplitViewSwitcherModifier *)&v9 isLayoutRoleBlurred:a3 inAppLayout:v6];
  if ([(SBCenterWindowToExistingSplitViewSwitcherModifier *)self _wasPreviousCenterAppLayout:v6 layoutRole:a3])
  {
    int v7 = [(SBCenterWindowToExistingSplitViewSwitcherModifier *)self isLayoutRoleContentReady:a3 inAppLayout:v6] ^ 1;
  }

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  id v6 = a4;
  [(SBCenterWindowToExistingSplitViewSwitcherModifier *)&v13 blurDelayForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  LODWORD(a3) = -[SBCenterWindowToExistingSplitViewSwitcherModifier _wasPreviousCenterAppLayout:layoutRole:](self, "_wasPreviousCenterAppLayout:layoutRole:", v6, a3, v13.receiver, v13.super_class);

  if (a3)
  {
    objc_super v9 = [(SBCenterWindowToExistingSplitViewSwitcherModifier *)self switcherSettings];
    double v10 = [v9 animationSettings];
    [v10 resizeBlurDelay];
    double v8 = v11;
  }
  return v8;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  id v6 = a4;
  unsigned __int8 v7 = [(SBCenterWindowToExistingSplitViewSwitcherModifier *)&v9 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  LOBYTE(a3) = -[SBCenterWindowToExistingSplitViewSwitcherModifier _wasPreviousCenterAppLayout:layoutRole:](self, "_wasPreviousCenterAppLayout:layoutRole:", v6, a3, v9.receiver, v9.super_class);

  return a3 | v7;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBCenterWindowToExistingSplitViewSwitcherModifier;
  id v4 = a3;
  v5 = [(SBCenterWindowToExistingSplitViewSwitcherModifier *)&v11 topMostLayoutRolesForAppLayout:v4];
  BOOL v6 = -[SBCenterWindowToExistingSplitViewSwitcherModifier _wasPreviousCenterAppLayout:layoutRole:](self, "_wasPreviousCenterAppLayout:layoutRole:", v4, self->_layoutRoleBeingReplaced, v11.receiver, v11.super_class);

  if (v6)
  {
    unsigned __int8 v7 = (void *)[v5 mutableCopy];
    double v8 = [NSNumber numberWithInteger:self->_layoutRoleBeingReplaced];
    [v7 removeObject:v8];

    objc_super v9 = [NSNumber numberWithInteger:self->_layoutRoleBeingReplaced];
    [v7 insertObject:v9 atIndex:0];

    v5 = v7;
  }
  return v5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (BOOL)_wasPreviousCenterAppLayout:(id)a3 layoutRole:(int64_t)a4
{
  fromAppLayout = self->_fromAppLayout;
  id v7 = a3;
  double v8 = [(SBAppLayout *)fromAppLayout itemForLayoutRole:4];
  objc_super v9 = [v7 itemForLayoutRole:self->_layoutRoleBeingReplaced];

  if ([v8 isEqual:v9]) {
    BOOL v10 = self->_layoutRoleBeingReplaced == a4;
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayoutBeingReplaced, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
}

@end