@interface SBCenterWindowToFullScreenSwitcherModifier
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (SBCenterWindowToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 fullScreenWithCenterAppLayout:(id)a4;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)handleSceneReadyEvent:(id)a3;
@end

@implementation SBCenterWindowToFullScreenSwitcherModifier

- (SBCenterWindowToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 fullScreenWithCenterAppLayout:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBCenterWindowToFullScreenSwitcherModifier.m", 29, @"Invalid parameter not satisfying: %@", @"fullScreenWithCenterAppLayout" object file lineNumber description];
  }
  v20.receiver = self;
  v20.super_class = (Class)SBCenterWindowToFullScreenSwitcherModifier;
  v9 = [(SBTransitionSwitcherModifier *)&v20 initWithTransitionID:v7];
  if (v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __97__SBCenterWindowToFullScreenSwitcherModifier_initWithTransitionID_fullScreenWithCenterAppLayout___block_invoke;
    v18[3] = &unk_1E6AF4B38;
    id v10 = v8;
    id v19 = v10;
    uint64_t v11 = [v10 appLayoutWithItemsPassingTest:v18];
    fullScreenAppLayoutWithCenterRemoved = v9->_fullScreenAppLayoutWithCenterRemoved;
    v9->_fullScreenAppLayoutWithCenterRemoved = (SBAppLayout *)v11;

    uint64_t v13 = [v10 itemForLayoutRole:4];
    movingCenterItem = v9->_movingCenterItem;
    v9->_movingCenterItem = (SBDisplayItem *)v13;

    if (!v9->_movingCenterItem)
    {
      v17 = [MEMORY[0x1E4F28B00] currentHandler];
      [v17 handleFailureInMethod:a2 object:v9 file:@"SBCenterWindowToFullScreenSwitcherModifier.m" lineNumber:37 description:@"fullScreenWithCenterAppLayout must have center item"];
    }
  }

  return v9;
}

BOOL __97__SBCenterWindowToFullScreenSwitcherModifier_initWithTransitionID_fullScreenWithCenterAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) layoutRoleForItem:a2] != 4;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v3 = self;
  v10.receiver = self;
  v10.super_class = (Class)SBCenterWindowToFullScreenSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v10 handleSceneReadyEvent:v4];
  v6 = objc_msgSend(v4, "appLayout", v10.receiver, v10.super_class);

  LODWORD(v3) = [v6 containsItem:v3->_movingCenterItem];
  if (v3)
  {
    id v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    v5 = (void *)v8;
  }
  return v5;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)SBCenterWindowToFullScreenSwitcherModifier;
  id v6 = a4;
  unsigned __int8 v7 = [(SBCenterWindowToFullScreenSwitcherModifier *)&v11 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  movingCenterItem = self->_movingCenterItem;
  v9 = objc_msgSend(v6, "itemForLayoutRole:", a3, v11.receiver, v11.super_class);

  LOBYTE(movingCenterItem) = [(SBDisplayItem *)movingCenterItem isEqual:v9];
  return movingCenterItem | v7;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBCenterWindowToFullScreenSwitcherModifier;
  LOBYTE(v7) = [(SBCenterWindowToFullScreenSwitcherModifier *)&v11 isLayoutRoleBlurred:a3 inAppLayout:v6];
  movingCenterItem = self->_movingCenterItem;
  v9 = [v6 itemForLayoutRole:a3];
  LODWORD(movingCenterItem) = [(SBDisplayItem *)movingCenterItem isEqual:v9];

  if (movingCenterItem) {
    int v7 = [(SBCenterWindowToFullScreenSwitcherModifier *)self isLayoutRoleContentReady:a3 inAppLayout:v6] ^ 1;
  }

  return v7;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)SBCenterWindowToFullScreenSwitcherModifier;
  id v6 = a4;
  [(SBCenterWindowToFullScreenSwitcherModifier *)&v15 blurDelayForLayoutRole:a3 inAppLayout:v6];
  double v8 = v7;
  movingCenterItem = self->_movingCenterItem;
  objc_super v10 = objc_msgSend(v6, "itemForLayoutRole:", a3, v15.receiver, v15.super_class);

  LODWORD(movingCenterItem) = [(SBDisplayItem *)movingCenterItem isEqual:v10];
  if (movingCenterItem)
  {
    objc_super v11 = [(SBCenterWindowToFullScreenSwitcherModifier *)self switcherSettings];
    v12 = [v11 animationSettings];
    [v12 resizeBlurDelay];
    double v8 = v13;
  }
  return v8;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 containsItem:self->_movingCenterItem])
  {
    unsigned __int16 v5 = SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBCenterWindowToFullScreenSwitcherModifier;
    unsigned __int16 v5 = (unsigned __int16)[(SBTransitionSwitcherModifier *)&v8 asyncRenderingAttributesForAppLayout:v4];
  }
  SBSwitcherAsyncRenderingAttributes v6 = (SBSwitcherAsyncRenderingAttributes)v5;

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movingCenterItem, 0);
  objc_storeStrong((id *)&self->_fullScreenAppLayoutWithCenterRemoved, 0);
}

@end