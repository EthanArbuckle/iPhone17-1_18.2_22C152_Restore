@interface SBSplitDisplayItemCrossblurSwitcherModifier
- (CGRect)frameForShelf:(id)a3;
- (SBAppLayout)fromAppLayout;
- (SBAppLayout)toAppLayout;
- (SBSplitDisplayItemCrossblurSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 layoutRole:(int64_t)a6;
- (id)_previousHomeAffordanceAppLayout;
- (id)appLayoutContainingAppLayout:(id)a3;
- (id)containerLeafAppLayoutForShelf:(id)a3;
- (id)handleEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)homeAffordanceLayoutElementToPortalIntoShelf:(id)a3;
- (id)topMostLayoutElements;
- (id)visibleHomeAffordanceLayoutElements;
- (int64_t)layoutRole;
@end

@implementation SBSplitDisplayItemCrossblurSwitcherModifier

- (SBSplitDisplayItemCrossblurSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5 layoutRole:(int64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v26.receiver = self;
  v26.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
  v14 = [(SBSwitcherModifier *)&v26 init];
  if (v14)
  {
    if (!v12)
    {
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, v14, @"SBSplitDisplayItemCrossblurSwitcherModifier.m", 24, @"Invalid parameter not satisfying: %@", @"fromAppLayout" object file lineNumber description];
    }
    if (!v13)
    {
      v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, v14, @"SBSplitDisplayItemCrossblurSwitcherModifier.m", 25, @"Invalid parameter not satisfying: %@", @"toAppLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v14->_fromAppLayout, a4);
    objc_storeStrong((id *)&v14->_toAppLayout, a5);
    v14->_layoutRole = a6;
    v15 = [(SBAppLayout *)v14->_fromAppLayout itemForLayoutRole:a6];
    v16 = [[SBSplitDisplayItemSwitcherModifier alloc] initWithDisplayItem:v15];
    [(SBChainableModifier *)v14 addChildModifier:v16];
    v17 = [(SBAppLayout *)v14->_fromAppLayout leafAppLayoutForRole:v14->_layoutRole];
    v18 = [(SBAppLayout *)v14->_toAppLayout leafAppLayoutForRole:v14->_layoutRole];
    v19 = [[SBCrossblurDosidoSwitcherModifier alloc] initWithTransitionID:v11 fromAppLayout:v17 toAppLayout:v18 direction:0];
    v20 = [(SBAppLayout *)v14->_toAppLayout itemForLayoutRole:v14->_layoutRole];
    v21 = [[SBSplitDisplayItemSwitcherModifier alloc] initWithDisplayItem:v20 wrappingModifier:v19];
    toSplitDisplayItemModifier = v14->_toSplitDisplayItemModifier;
    v14->_toSplitDisplayItemModifier = v21;

    [(SBChainableModifier *)v14 addChildModifier:v14->_toSplitDisplayItemModifier];
  }

  return v14;
}

- (id)handleEvent:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
  v4 = [(SBChainableModifier *)&v6 handleEvent:a3];
  [(SBChainableModifier *)self setState:[(SBChainableModifier *)self->_toSplitDisplayItemModifier state]];
  return v4;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  self->_floatingConfiguration = [v4 toFloatingConfiguration];
  v7.receiver = self;
  v7.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v7 handleTransitionEvent:v4];

  return v5;
}

- (id)visibleHomeAffordanceLayoutElements
{
  v7.receiver = self;
  v7.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
  v3 = [(SBSplitDisplayItemCrossblurSwitcherModifier *)&v7 visibleHomeAffordanceLayoutElements];
  id v4 = [(SBSplitDisplayItemCrossblurSwitcherModifier *)self _previousHomeAffordanceAppLayout];
  v5 = [v3 setByAddingObject:v4];

  return v5;
}

- (id)homeAffordanceLayoutElementToPortalIntoShelf:(id)a3
{
  id v4 = a3;
  if ([v4 layoutRole] == 3)
  {
    uint64_t v5 = [(SBSplitDisplayItemCrossblurSwitcherModifier *)self _previousHomeAffordanceAppLayout];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
    uint64_t v5 = [(SBSplitDisplayItemCrossblurSwitcherModifier *)&v8 homeAffordanceLayoutElementToPortalIntoShelf:v4];
  }
  objc_super v6 = (void *)v5;

  return v6;
}

- (id)_previousHomeAffordanceAppLayout
{
  fromAppLayout = self->_fromAppLayout;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__SBSplitDisplayItemCrossblurSwitcherModifier__previousHomeAffordanceAppLayout__block_invoke;
  v6[3] = &unk_1E6AF4B38;
  v6[4] = self;
  id v4 = [(SBAppLayout *)fromAppLayout appLayoutWithItemsPassingTest:v6];
  if (!v4) {
    id v4 = self->_fromAppLayout;
  }
  return v4;
}

uint64_t __79__SBSplitDisplayItemCrossblurSwitcherModifier__previousHomeAffordanceAppLayout__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  uint64_t v4 = *(void *)(v2 + 128);
  id v5 = a2;
  objc_super v6 = [v3 itemForLayoutRole:v4];
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
    fromAppLayout = self->_fromAppLayout;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__SBSplitDisplayItemCrossblurSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke;
    v7[3] = &unk_1E6AF4B38;
    v7[4] = self;
    uint64_t v4 = [(SBAppLayout *)fromAppLayout appLayoutWithItemsPassingTest:v7];
  }
  return v4;
}

uint64_t __78__SBSplitDisplayItemCrossblurSwitcherModifier_containerLeafAppLayoutForShelf___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  uint64_t v4 = *(void *)(v2 + 128);
  id v5 = a2;
  objc_super v6 = [v3 itemForLayoutRole:v4];
  LODWORD(v4) = [v6 isEqual:v5];

  return v4 ^ 1;
}

- (CGRect)frameForShelf:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
  id v4 = a3;
  [(SBSplitDisplayItemCrossblurSwitcherModifier *)&v20 frameForShelf:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  uint64_t v13 = objc_msgSend(v4, "layoutRole", v20.receiver, v20.super_class);

  if (v13 == 3)
  {
    [(SBSplitDisplayItemCrossblurSwitcherModifier *)self floatingApplicationFrameInInterfaceOrientation:[(SBSplitDisplayItemCrossblurSwitcherModifier *)self switcherInterfaceOrientation] floatingConfiguration:self->_floatingConfiguration];
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

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4 = a3;
  uint64_t v5 = 120;
  if ([(SBAppLayout *)self->_toAppLayout isOrContainsAppLayout:v4]
    || (uint64_t v5 = 112, [(SBAppLayout *)self->_fromAppLayout isOrContainsAppLayout:v4]))
  {
    id v6 = *(id *)((char *)&self->super.super.super.isa + v5);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
    id v6 = [(SBSplitDisplayItemCrossblurSwitcherModifier *)&v9 appLayoutContainingAppLayout:v4];
  }
  double v7 = v6;

  return v7;
}

- (id)topMostLayoutElements
{
  v10.receiver = self;
  v10.super_class = (Class)SBSplitDisplayItemCrossblurSwitcherModifier;
  v3 = [(SBSplitDisplayItemCrossblurSwitcherModifier *)&v10 topMostLayoutElements];
  fromAppLayout = self->_fromAppLayout;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__SBSplitDisplayItemCrossblurSwitcherModifier_topMostLayoutElements__block_invoke;
  v9[3] = &unk_1E6AF4B38;
  v9[4] = self;
  uint64_t v5 = [(SBAppLayout *)fromAppLayout appLayoutWithItemsPassingTest:v9];
  if (v5)
  {
    id v6 = [(SBAppLayout *)self->_toAppLayout leafAppLayoutForRole:self->_layoutRole];
    double v7 = objc_msgSend(v3, "sb_arrayByInsertingOrMovingObject:toIndex:", v6, 0);

    v3 = objc_msgSend(v7, "sb_arrayByInsertingOrMovingObject:toIndex:", v5, 0);
  }
  return v3;
}

uint64_t __68__SBSplitDisplayItemCrossblurSwitcherModifier_topMostLayoutElements__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  uint64_t v4 = *(void *)(v2 + 128);
  id v5 = a2;
  id v6 = [v3 itemForLayoutRole:v4];
  LODWORD(v4) = [v6 isEqual:v5];

  return v4 ^ 1;
}

- (SBAppLayout)fromAppLayout
{
  return self->_fromAppLayout;
}

- (SBAppLayout)toAppLayout
{
  return self->_toAppLayout;
}

- (int64_t)layoutRole
{
  return self->_layoutRole;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toAppLayout, 0);
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toSplitDisplayItemModifier, 0);
}

@end