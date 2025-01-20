@interface SBSplitDisplayItemPulseTransitionSwitcherModifier
- (BOOL)completesWhenChildrenComplete;
- (BOOL)isChamoisWindowingUIEnabled;
- (CGRect)frameForShelf:(id)a3;
- (SBAppLayout)appLayout;
- (SBSplitDisplayItemPulseTransitionSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 layoutRole:(int64_t)a5 chamoisWindowingUIEnabled:(BOOL)a6;
- (double)backgroundOpacityForIndex:(unint64_t)a3;
- (id)_previousHomeAffordanceAppLayout;
- (id)appLayoutsToResignActive;
- (id)containerLeafAppLayoutForShelf:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)homeAffordanceLayoutElementToPortalIntoShelf:(id)a3;
- (id)topMostLayoutElements;
- (id)visibleHomeAffordanceLayoutElements;
- (int64_t)layoutRole;
@end

@implementation SBSplitDisplayItemPulseTransitionSwitcherModifier

- (SBSplitDisplayItemPulseTransitionSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 layoutRole:(int64_t)a5 chamoisWindowingUIEnabled:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
  v13 = [(SBSwitcherModifier *)&v21 init];
  if (v13)
  {
    if (!v12)
    {
      v19 = [MEMORY[0x1E4F28B00] currentHandler];
      [v19 handleFailureInMethod:a2, v13, @"SBSplitDisplayItemPulseTransitionSwitcherModifier.m", 25, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    if (!a5)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2 object:v13 file:@"SBSplitDisplayItemPulseTransitionSwitcherModifier.m" lineNumber:26 description:@"layoutRole must not be undefined"];
    }
    objc_storeStrong((id *)&v13->_appLayout, a4);
    v13->_layoutRole = a5;
    v13->_isChamoisWindowingUIEnabled = a6;
    v14 = [v12 leafAppLayoutForRole:a5];
    v15 = [v12 itemForLayoutRole:a5];
    v16 = [[SBPulseTransitionSwitcherModifier alloc] initWithTransitionID:v11 appLayout:v14];
    v17 = [[SBSplitDisplayItemSwitcherModifier alloc] initWithDisplayItem:v15 wrappingModifier:v16];
    [(SBSplitDisplayItemSwitcherModifier *)v17 setCompletesWhenGesturePossible:1];
    [(SBChainableModifier *)v13 addChildModifier:v17];
  }
  return v13;
}

- (id)handleTransitionEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v10 handleTransitionEvent:v4];
  self->_floatingConfiguration = objc_msgSend(v4, "toFloatingConfiguration", v10.receiver, v10.super_class);
  uint64_t v6 = [v4 phase];

  if (v6 == 1)
  {
    v7 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:8 updateMode:2];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    v5 = (void *)v8;
  }
  return v5;
}

- (BOOL)completesWhenChildrenComplete
{
  return 1;
}

- (id)visibleHomeAffordanceLayoutElements
{
  v7.receiver = self;
  v7.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
  v3 = [(SBSplitDisplayItemPulseTransitionSwitcherModifier *)&v7 visibleHomeAffordanceLayoutElements];
  id v4 = [(SBSplitDisplayItemPulseTransitionSwitcherModifier *)self _previousHomeAffordanceAppLayout];
  v5 = [v3 setByAddingObject:v4];

  return v5;
}

- (id)homeAffordanceLayoutElementToPortalIntoShelf:(id)a3
{
  id v4 = a3;
  if ([v4 layoutRole] == 3)
  {
    uint64_t v5 = [(SBSplitDisplayItemPulseTransitionSwitcherModifier *)self _previousHomeAffordanceAppLayout];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
    uint64_t v5 = [(SBSplitDisplayItemPulseTransitionSwitcherModifier *)&v8 homeAffordanceLayoutElementToPortalIntoShelf:v4];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (id)_previousHomeAffordanceAppLayout
{
  appLayout = self->_appLayout;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__SBSplitDisplayItemPulseTransitionSwitcherModifier__previousHomeAffordanceAppLayout__block_invoke;
  v6[3] = &unk_1E6AF4B38;
  v6[4] = self;
  id v4 = [(SBAppLayout *)appLayout appLayoutWithItemsPassingTest:v6];
  if (!v4) {
    id v4 = self->_appLayout;
  }
  return v4;
}

uint64_t __85__SBSplitDisplayItemPulseTransitionSwitcherModifier__previousHomeAffordanceAppLayout__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  uint64_t v4 = *(void *)(v2 + 120);
  id v5 = a2;
  uint64_t v6 = [v3 itemForLayoutRole:v4];
  LODWORD(v4) = [v6 isEqual:v5];

  return v4 ^ 1;
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  if ([a3 layoutRole] == 3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    appLayout = self->_appLayout;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __84__SBSplitDisplayItemPulseTransitionSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke;
    v7[3] = &unk_1E6AF4B38;
    v7[4] = self;
    uint64_t v4 = [(SBAppLayout *)appLayout appLayoutWithItemsPassingTest:v7];
  }
  return v4;
}

uint64_t __84__SBSplitDisplayItemPulseTransitionSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  uint64_t v4 = *(void *)(v2 + 120);
  id v5 = a2;
  uint64_t v6 = [v3 itemForLayoutRole:v4];
  LODWORD(v4) = [v6 isEqual:v5];

  return v4 ^ 1;
}

- (CGRect)frameForShelf:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
  id v4 = a3;
  [(SBSplitDisplayItemPulseTransitionSwitcherModifier *)&v20 frameForShelf:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = objc_msgSend(v4, "layoutRole", v20.receiver, v20.super_class);

  if (v13 == 3)
  {
    [(SBSplitDisplayItemPulseTransitionSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:[(SBSplitDisplayItemPulseTransitionSwitcherModifier *)self switcherInterfaceOrientation] floatingConfiguration:self->_floatingConfiguration];
    double v6 = v6 + v14;
    double v8 = v8 + v15;
  }
  double v16 = v6;
  double v17 = v8;
  double v18 = v10;
  double v19 = v12;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)topMostLayoutElements
{
  v14.receiver = self;
  v14.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
  v3 = [(SBSplitDisplayItemPulseTransitionSwitcherModifier *)&v14 topMostLayoutElements];
  appLayout = self->_appLayout;
  if (self->_layoutRole == 4)
  {
    double v5 = [(SBAppLayout *)appLayout leafAppLayoutForRole:"leafAppLayoutForRole:"];
    uint64_t v6 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", v5, 0);

    v3 = (void *)v6;
  }
  else
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __74__SBSplitDisplayItemPulseTransitionSwitcherModifier_topMostLayoutElements__block_invoke;
    v13[3] = &unk_1E6AF4B38;
    v13[4] = self;
    double v7 = [(SBAppLayout *)appLayout appLayoutWithItemsPassingTest:v13];
    if (v7)
    {
      uint64_t v8 = [v3 indexOfObjectPassingTest:&__block_literal_global_275];
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = v8 + 1;
      }
      double v10 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", v7, v9);

      double v11 = [(SBAppLayout *)self->_appLayout leafAppLayoutForRole:self->_layoutRole];
      v3 = objc_msgSend(v10, "sb_arrayByInsertingOrMovingObject:toIndex:", v11, v9);
    }
  }
  return v3;
}

uint64_t __74__SBSplitDisplayItemPulseTransitionSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  uint64_t v4 = *(void *)(v2 + 120);
  id v5 = a2;
  uint64_t v6 = [v3 itemForLayoutRole:v4];
  LODWORD(v4) = [v6 isEqual:v5];

  return v4 ^ 1;
}

BOOL __74__SBSplitDisplayItemPulseTransitionSwitcherModifier_topMostLayoutElements__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 switcherLayoutElementType] == 7;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  id v5 = [(SBSplitDisplayItemPulseTransitionSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  double v7 = 0.0;
  if (![(SBAppLayout *)self->_appLayout isOrContainsAppLayout:v6])
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
    [(SBSplitDisplayItemPulseTransitionSwitcherModifier *)&v10 backgroundOpacityForIndex:a3];
    double v7 = v8;
  }

  return v7;
}

- (id)appLayoutsToResignActive
{
  if (self->_isChamoisWindowingUIEnabled)
  {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBSplitDisplayItemPulseTransitionSwitcherModifier;
    uint64_t v2 = [(SBSplitDisplayItemPulseTransitionSwitcherModifier *)&v4 appLayoutsToResignActive];
  }
  return v2;
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (BOOL)isChamoisWindowingUIEnabled
{
  return self->_isChamoisWindowingUIEnabled;
}

- (void).cxx_destruct
{
}

@end