@interface SBCenterWindowToNewSplitViewSwitcherModifier
- (BOOL)_wasItemPreviouslyCenter:(id)a3;
- (BOOL)_wasItemPreviouslyFullScreen:(id)a3;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (SBCenterWindowToNewSplitViewSwitcherModifier)initWithTransitionID:(id)a3 fromFullScreenAppLayout:(id)a4 toSpaceAppLayout:(id)a5;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)handleSceneReadyEvent:(id)a3;
- (id)topMostLayoutRolesForAppLayout:(id)a3;
@end

@implementation SBCenterWindowToNewSplitViewSwitcherModifier

- (SBCenterWindowToNewSplitViewSwitcherModifier)initWithTransitionID:(id)a3 fromFullScreenAppLayout:(id)a4 toSpaceAppLayout:(id)a5
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
    [v20 handleFailureInMethod:a2, self, @"SBCenterWindowToNewSplitViewSwitcherModifier.m", 29, @"Invalid parameter not satisfying: %@", @"fromFullScreenAppLayout" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v21 = [MEMORY[0x1E4F28B00] currentHandler];
  [v21 handleFailureInMethod:a2, self, @"SBCenterWindowToNewSplitViewSwitcherModifier.m", 30, @"Invalid parameter not satisfying: %@", @"toSpaceAppLayout" object file lineNumber description];

LABEL_3:
  v23.receiver = self;
  v23.super_class = (Class)SBCenterWindowToNewSplitViewSwitcherModifier;
  v13 = [(SBTransitionSwitcherModifier *)&v23 initWithTransitionID:v9];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_fromFullScreenAppLayout, a4);
    objc_storeStrong((id *)&v14->_toSpaceAppLayout, a5);
    toSpaceAppLayout = v14->_toSpaceAppLayout;
    v16 = [v10 itemForLayoutRole:1];
    uint64_t v17 = [(SBAppLayout *)toSpaceAppLayout layoutRoleForItem:v16];

    if (!SBLayoutRoleIsValidForSplitView(v17))
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2 object:v14 file:@"SBCenterWindowToNewSplitViewSwitcherModifier.m" lineNumber:36 description:@"Couldn't find previous fullscreen item in the new combined split layout"];
    }
    uint64_t v18 = 2;
    if (v17 != 1) {
      uint64_t v18 = 1;
    }
    v14->_layoutRoleBeingAdded = v18;
  }

  return v14;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBCenterWindowToNewSplitViewSwitcherModifier;
  v3 = [(SBSwitcherModifier *)&v7 handleSceneReadyEvent:a3];
  v4 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:3];
  v5 = SBAppendSwitcherModifierResponse(v4, v3);

  return v5;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBCenterWindowToNewSplitViewSwitcherModifier;
  LOBYTE(v7) = [(SBCenterWindowToNewSplitViewSwitcherModifier *)&v10 isLayoutRoleBlurred:a3 inAppLayout:v6];
  v8 = [v6 itemForLayoutRole:a3];
  if ([(SBCenterWindowToNewSplitViewSwitcherModifier *)self _wasItemPreviouslyFullScreen:v8]|| [(SBCenterWindowToNewSplitViewSwitcherModifier *)self _wasItemPreviouslyCenter:v8])
  {
    int v7 = [(SBCenterWindowToNewSplitViewSwitcherModifier *)self isLayoutRoleContentReady:a3 inAppLayout:v6] ^ 1;
  }

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)SBCenterWindowToNewSplitViewSwitcherModifier;
  id v6 = a4;
  [(SBCenterWindowToNewSplitViewSwitcherModifier *)&v14 blurDelayForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  id v9 = objc_msgSend(v6, "itemForLayoutRole:", a3, v14.receiver, v14.super_class);

  if ([(SBCenterWindowToNewSplitViewSwitcherModifier *)self _wasItemPreviouslyFullScreen:v9]|| [(SBCenterWindowToNewSplitViewSwitcherModifier *)self _wasItemPreviouslyCenter:v9])
  {
    objc_super v10 = [(SBCenterWindowToNewSplitViewSwitcherModifier *)self switcherSettings];
    id v11 = [v10 animationSettings];
    [v11 resizeBlurDelay];
    double v8 = v12;
  }
  return v8;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBCenterWindowToNewSplitViewSwitcherModifier;
  id v6 = a4;
  BOOL v7 = [(SBCenterWindowToNewSplitViewSwitcherModifier *)&v10 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  double v8 = objc_msgSend(v6, "itemForLayoutRole:", a3, v10.receiver, v10.super_class);

  if ([(SBCenterWindowToNewSplitViewSwitcherModifier *)self _wasItemPreviouslyFullScreen:v8]|| [(SBCenterWindowToNewSplitViewSwitcherModifier *)self _wasItemPreviouslyCenter:v8])
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBCenterWindowToNewSplitViewSwitcherModifier;
  id v4 = a3;
  v5 = [(SBCenterWindowToNewSplitViewSwitcherModifier *)&v11 topMostLayoutRolesForAppLayout:v4];
  int v6 = objc_msgSend(v4, "isEqual:", self->_toSpaceAppLayout, v11.receiver, v11.super_class);

  if (v6)
  {
    BOOL v7 = (void *)[v5 mutableCopy];
    double v8 = [NSNumber numberWithInteger:self->_layoutRoleBeingAdded];
    [v7 removeObject:v8];

    id v9 = [NSNumber numberWithInteger:self->_layoutRoleBeingAdded];
    [v7 insertObject:v9 atIndex:0];

    v5 = v7;
  }
  return v5;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (BOOL)_wasItemPreviouslyFullScreen:(id)a3
{
  fromFullScreenAppLayout = self->_fromFullScreenAppLayout;
  id v4 = a3;
  v5 = [(SBAppLayout *)fromFullScreenAppLayout itemForLayoutRole:1];
  char v6 = [v5 isEqual:v4];

  return v6;
}

- (BOOL)_wasItemPreviouslyCenter:(id)a3
{
  fromFullScreenAppLayout = self->_fromFullScreenAppLayout;
  id v4 = a3;
  v5 = [(SBAppLayout *)fromFullScreenAppLayout itemForLayoutRole:4];
  char v6 = [v5 isEqual:v4];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toSpaceAppLayout, 0);
  objc_storeStrong((id *)&self->_fromFullScreenAppLayout, 0);
}

@end