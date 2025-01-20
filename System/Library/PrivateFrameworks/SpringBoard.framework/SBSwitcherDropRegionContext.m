@interface SBSwitcherDropRegionContext
- (BOOL)intersectingAppLayoutIsOnFirstRow;
- (BOOL)isSwap;
- (CGRect)originRect;
- (CGRect)targetRect;
- (CGSize)scaledIntersectingAppLayoutSize;
- (CGSize)unscaledIntersectingAppLayoutSize;
- (NSString)description;
- (SBAppLayout)closestVisibleAppLayout;
- (SBAppLayout)draggingAppLayout;
- (SBAppLayout)draggingLeafAppLayout;
- (SBAppLayout)evictedAppLayout;
- (SBAppLayout)intersectingAppLayout;
- (SBAppLayout)intersectingLeafAppLayout;
- (SBAppLayout)remainingAppLayout;
- (SBSwitcherDropRegionContext)initWithDraggingLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)displayItemsToReloadSnapshots;
- (id)droppedLeafAppLayout;
- (id)finalTargetAppLayout;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)draggingLayoutRole;
- (int64_t)effectiveDroppingAppLayoutConfiguration;
- (int64_t)intersectingAppLayoutConfiguration;
- (int64_t)intersectingLayoutRole;
- (unint64_t)currentDropAction;
- (unint64_t)currentDropRegion;
- (void)setClosestVisibleAppLayout:(id)a3;
- (void)setCurrentDropRegion:(unint64_t)a3;
- (void)setEvictedAppLayout:(id)a3;
- (void)setIntersectingAppLayout:(id)a3;
- (void)setIntersectingAppLayoutConfiguration:(int64_t)a3;
- (void)setIntersectingAppLayoutIsOnFirstRow:(BOOL)a3;
- (void)setIntersectingLayoutRole:(int64_t)a3;
- (void)setOriginRect:(CGRect)a3;
- (void)setRemainingAppLayout:(id)a3;
- (void)setScaledIntersectingAppLayoutSize:(CGSize)a3;
- (void)setTargetRect:(CGRect)a3;
- (void)setUnscaledIntersectingAppLayoutSize:(CGSize)a3;
@end

@implementation SBSwitcherDropRegionContext

- (SBSwitcherDropRegionContext)initWithDraggingLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherDropRegionContext;
  v8 = [(SBSwitcherDropRegionContext *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_draggingLayoutRole = a3;
    objc_storeStrong((id *)&v8->_draggingAppLayout, a4);
    v9->_currentDropRegion = 0;
    v9->_scaledIntersectingAppLayoutSize = (CGSize)SBInvalidSize;
    v9->_unscaledIntersectingAppLayoutSize = (CGSize)SBInvalidSize;
    v9->_intersectingLayoutRole = 0;
    v9->_intersectingAppLayoutConfiguration = 0;
  }

  return v9;
}

- (SBAppLayout)draggingLeafAppLayout
{
  return (SBAppLayout *)[(SBAppLayout *)self->_draggingAppLayout leafAppLayoutForRole:self->_draggingLayoutRole];
}

- (SBAppLayout)intersectingLeafAppLayout
{
  return (SBAppLayout *)[(SBAppLayout *)self->_intersectingAppLayout leafAppLayoutForRole:self->_intersectingLayoutRole];
}

- (unint64_t)currentDropAction
{
  int64_t v3 = [(SBAppLayout *)self->_draggingAppLayout environment];
  unint64_t currentDropRegion = self->_currentDropRegion;
  if (v3 != 2)
  {
    if (currentDropRegion == 6) {
      return 1;
    }
    if ([(SBSwitcherDropRegionContext *)self isSwap]) {
      return 4;
    }
    unint64_t v6 = self->_currentDropRegion;
    if (v6 == 3) {
      return 5;
    }
    if (v6 != 1)
    {
      if ([(SBAppLayout *)self->_draggingAppLayout isSplitConfiguration]
        && ![(SBAppLayout *)self->_intersectingAppLayout isSplitConfiguration])
      {
        return 8;
      }
      if ([(SBAppLayout *)self->_draggingAppLayout isSplitConfiguration]
        && [(SBAppLayout *)self->_intersectingAppLayout isSplitConfiguration])
      {
        return 9;
      }
      if (![(SBAppLayout *)self->_draggingAppLayout isSplitConfiguration]
        && [(SBAppLayout *)self->_intersectingAppLayout isSplitConfiguration])
      {
        return 7;
      }
      if (![(SBAppLayout *)self->_draggingAppLayout isSplitConfiguration]
        && ![(SBAppLayout *)self->_intersectingAppLayout isSplitConfiguration])
      {
        return 6;
      }
    }
    return 0;
  }
  if (currentDropRegion == 3) {
    return 3;
  }
  else {
    return 2;
  }
}

- (id)finalTargetAppLayout
{
  v49[1] = *MEMORY[0x1E4F143B8];
  v4 = [(SBAppLayout *)self->_draggingAppLayout itemForLayoutRole:self->_draggingLayoutRole];
  v5 = [(SBAppLayout *)self->_intersectingAppLayout itemForLayoutRole:1];
  unint64_t v6 = [(SBAppLayout *)self->_intersectingAppLayout itemForLayoutRole:2];
  unint64_t currentDropRegion = self->_currentDropRegion;
  unint64_t v8 = [(SBSwitcherDropRegionContext *)self currentDropAction];
  unint64_t v9 = self->_currentDropRegion;
  if (v9 == 6)
  {
    objc_super v11 = [SBAppLayout alloc];
    v12 = [NSNumber numberWithInteger:1];
    v48 = v12;
    v49[0] = v4;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
    v14 = [(SBAppLayout *)v11 initWithItemsForLayoutRoles:v13 configuration:1 environment:2 preferredDisplayOrdinal:[(SBAppLayout *)self->_intersectingAppLayout preferredDisplayOrdinal]];

LABEL_26:
    goto LABEL_34;
  }
  if (v9 != 3)
  {
    if (v9 == 1)
    {
      draggingAppLayout = self->_draggingAppLayout;
LABEL_13:
      v14 = draggingAppLayout;
      goto LABEL_34;
    }
    if ([(SBSwitcherDropRegionContext *)self isSwap])
    {
      v15 = [(SBAppLayout *)self->_draggingAppLayout flippedAppLayout];
      objc_msgSend(v15, "appLayoutByModifyingConfiguration:", -[SBSwitcherDropRegionContext effectiveDroppingAppLayoutConfiguration](self, "effectiveDroppingAppLayoutConfiguration"));
      v14 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

      goto LABEL_34;
    }
    if ((currentDropRegion & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      BOOL v16 = [(SBAppLayout *)self->_intersectingAppLayout isSplitConfiguration];
      if (currentDropRegion == 4) {
        v17 = v4;
      }
      else {
        v17 = v5;
      }
      v18 = NSNumber;
      if (v16)
      {
        if (currentDropRegion == 4) {
          v19 = v6;
        }
        else {
          v19 = v4;
        }
        id v20 = v19;
        id v21 = v17;
        v22 = [v18 numberWithInteger:1];
        v44[0] = v22;
        v45[0] = v21;
        v23 = [NSNumber numberWithInteger:2];
        v44[1] = v23;
        v45[1] = v20;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:v44 count:2];

        v25 = [SBAppLayout alloc];
        int64_t intersectingAppLayoutConfiguration = self->_intersectingAppLayoutConfiguration;
        int64_t v27 = [(SBAppLayout *)self->_intersectingAppLayout preferredDisplayOrdinal];

        v28 = v25;
        v29 = v24;
        uint64_t v30 = intersectingAppLayoutConfiguration;
      }
      else
      {
        if (currentDropRegion == 4) {
          v33 = v5;
        }
        else {
          v33 = v4;
        }
        id v34 = v33;
        id v35 = v17;
        v36 = [v18 numberWithInteger:1];
        v42[0] = v36;
        v43[0] = v35;
        v37 = [NSNumber numberWithInteger:2];
        v42[1] = v37;
        v43[1] = v34;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:2];

        v38 = [SBAppLayout alloc];
        int64_t v27 = [(SBAppLayout *)self->_intersectingAppLayout preferredDisplayOrdinal];

        v28 = v38;
        v29 = v24;
        uint64_t v30 = 3;
      }
      v14 = [(SBAppLayout *)v28 initWithItemsForLayoutRoles:v29 configuration:v30 environment:1 preferredDisplayOrdinal:v27];

      goto LABEL_34;
    }
    goto LABEL_28;
  }
  if (v8 == 3)
  {
    v31 = [NSNumber numberWithInteger:1];
    v46 = v31;
    v47 = v4;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];

    v14 = [[SBAppLayout alloc] initWithItemsForLayoutRoles:v12 configuration:1 environment:1 preferredDisplayOrdinal:[(SBAppLayout *)self->_draggingAppLayout preferredDisplayOrdinal]];
    goto LABEL_26;
  }
  if (v8 == 5)
  {
    if (![(SBAppLayout *)self->_draggingAppLayout isSplitConfiguration])
    {
      v40 = [MEMORY[0x1E4F28B00] currentHandler];
      [v40 handleFailureInMethod:a2 object:self file:@"SBSwitcherDropRegionContext.m" lineNumber:91 description:@"Expected dragging app layout to be split."];
    }
    if ([(SBAppLayout *)self->_evictedAppLayout isSplitConfiguration])
    {
      v41 = [MEMORY[0x1E4F28B00] currentHandler];
      [v41 handleFailureInMethod:a2, self, @"SBSwitcherDropRegionContext.m", 92, @"Unsplit should result in a new full app layout, not a split one" object file lineNumber description];
    }
    draggingAppLayout = self->_evictedAppLayout;
    goto LABEL_13;
  }
  v32 = [MEMORY[0x1E4F28B00] currentHandler];
  [v32 handleFailureInMethod:a2 object:self file:@"SBSwitcherDropRegionContext.m" lineNumber:104 description:@"Invalid drop region"];

LABEL_28:
  v14 = 0;
LABEL_34:

  return v14;
}

- (BOOL)isSwap
{
  if (![(SBAppLayout *)self->_draggingAppLayout isSplitConfiguration]) {
    return 0;
  }
  if (self->_draggingLayoutRole == 1) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  v4 = [(SBAppLayout *)self->_draggingAppLayout leafAppLayoutForRole:v3];
  v5 = [(SBAppLayout *)self->_intersectingAppLayout leafAppLayoutForRole:self->_intersectingLayoutRole];
  BOOL v6 = v4 == v5;

  return v6;
}

- (id)droppedLeafAppLayout
{
  uint64_t v3 = [(SBSwitcherDropRegionContext *)self draggingLeafAppLayout];
  v4 = [v3 itemForLayoutRole:1];

  v5 = [(SBSwitcherDropRegionContext *)self finalTargetAppLayout];
  BOOL v6 = [v5 leafAppLayoutForItem:v4];

  return v6;
}

- (id)displayItemsToReloadSnapshots
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = [(SBSwitcherDropRegionContext *)self finalTargetAppLayout];
  v5 = [v4 allItems];
  [v3 addObjectsFromArray:v5];

  remainingAppLayout = self->_remainingAppLayout;
  if (remainingAppLayout)
  {
    id v7 = [(SBAppLayout *)remainingAppLayout allItems];
    [v3 addObjectsFromArray:v7];
  }
  evictedAppLayout = self->_evictedAppLayout;
  if (evictedAppLayout)
  {
    unint64_t v9 = [(SBAppLayout *)evictedAppLayout allItems];
    [v3 addObjectsFromArray:v9];
  }
  v10 = [v3 allObjects];

  return v10;
}

- (int64_t)effectiveDroppingAppLayoutConfiguration
{
  int64_t intersectingAppLayoutConfiguration = self->_intersectingAppLayoutConfiguration;
  BOOL v3 = [(SBSwitcherDropRegionContext *)self isSwap];
  int64_t v4 = 2;
  uint64_t v5 = 4;
  if (intersectingAppLayoutConfiguration != 2) {
    uint64_t v5 = intersectingAppLayoutConfiguration;
  }
  if (intersectingAppLayoutConfiguration != 4) {
    int64_t v4 = v5;
  }
  if (v3) {
    return v4;
  }
  else {
    return intersectingAppLayoutConfiguration;
  }
}

- (NSString)description
{
  return (NSString *)[(SBSwitcherDropRegionContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSwitcherDropRegionContext *)self succinctDescriptionBuilder];
  BOOL v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  BOOL v3 = [(SBSwitcherDropRegionContext *)self descriptionBuilderWithMultilinePrefix:a3];
  int64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SBSwitcherDropRegionContext *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  objc_super v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = *(void *)(*(void *)(a1 + 40) + 16) - 1;
  if (v3 > 6) {
    id v4 = @"SBSwitcherDropRegionNone";
  }
  else {
    id v4 = off_1E6B07CD0[v3];
  }
  [v2 appendString:v4 withName:@"currentDropRegion"];
  uint64_t v5 = *(void **)(a1 + 32);
  unint64_t v6 = [*(id *)(a1 + 40) currentDropAction] - 1;
  if (v6 > 8) {
    id v7 = @"SBSwitcherDropActionNone";
  }
  else {
    id v7 = off_1E6B07D08[v6];
  }
  [v5 appendString:v7 withName:@"currentDropAction"];
  unint64_t v8 = *(void **)(a1 + 32);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke_2;
  v23[3] = &unk_1E6AF5290;
  id v9 = v8;
  uint64_t v10 = *(void *)(a1 + 40);
  id v24 = v9;
  uint64_t v25 = v10;
  [v9 appendBodySectionWithName:0 multilinePrefix:0 block:v23];
  objc_super v11 = *(void **)(a1 + 32);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke_3;
  v20[3] = &unk_1E6AF5290;
  id v12 = v11;
  uint64_t v13 = *(void *)(a1 + 40);
  id v21 = v12;
  uint64_t v22 = v13;
  [v12 appendBodySectionWithName:0 multilinePrefix:0 block:v20];
  v14 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke_4;
  v17[3] = &unk_1E6AF5290;
  id v15 = v14;
  uint64_t v16 = *(void *)(a1 + 40);
  id v18 = v15;
  uint64_t v19 = v16;
  [v15 appendBodySectionWithName:0 multilinePrefix:0 block:v17];
}

id __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = SBLayoutRoleDescription(*(void *)(*(void *)(a1 + 40) + 32));
  [v2 appendString:v3 withName:@"draggingLayoutRole"];

  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"draggingAppLayout"];
}

id __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = SBLayoutRoleDescription(*(void *)(*(void *)(a1 + 40) + 48));
  [v2 appendString:v3 withName:@"intersectingLayoutRole"];

  id v4 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 40) withName:@"intersectingAppLayout"];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"intersectingAppLayoutIsOnFirstRow"];
}

id __69__SBSwitcherDropRegionContext_descriptionBuilderWithMultilinePrefix___block_invoke_4(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", @"originRect", *(double *)(*(void *)(a1 + 40) + 120), *(double *)(*(void *)(a1 + 40) + 128), *(double *)(*(void *)(a1 + 40) + 136), *(double *)(*(void *)(a1 + 40) + 144));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendRect:withName:", @"targetRect", *(double *)(*(void *)(a1 + 40) + 152), *(double *)(*(void *)(a1 + 40) + 160), *(double *)(*(void *)(a1 + 40) + 168), *(double *)(*(void *)(a1 + 40) + 176));
}

- (unint64_t)currentDropRegion
{
  return self->_currentDropRegion;
}

- (void)setCurrentDropRegion:(unint64_t)a3
{
  self->_unint64_t currentDropRegion = a3;
}

- (SBAppLayout)draggingAppLayout
{
  return self->_draggingAppLayout;
}

- (int64_t)draggingLayoutRole
{
  return self->_draggingLayoutRole;
}

- (SBAppLayout)intersectingAppLayout
{
  return self->_intersectingAppLayout;
}

- (void)setIntersectingAppLayout:(id)a3
{
}

- (int64_t)intersectingLayoutRole
{
  return self->_intersectingLayoutRole;
}

- (void)setIntersectingLayoutRole:(int64_t)a3
{
  self->_intersectingLayoutRole = a3;
}

- (CGSize)scaledIntersectingAppLayoutSize
{
  double width = self->_scaledIntersectingAppLayoutSize.width;
  double height = self->_scaledIntersectingAppLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setScaledIntersectingAppLayoutSize:(CGSize)a3
{
  self->_scaledIntersectingAppLayoutSize = a3;
}

- (CGSize)unscaledIntersectingAppLayoutSize
{
  double width = self->_unscaledIntersectingAppLayoutSize.width;
  double height = self->_unscaledIntersectingAppLayoutSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setUnscaledIntersectingAppLayoutSize:(CGSize)a3
{
  self->_unscaledIntersectingAppLayoutSize = a3;
}

- (int64_t)intersectingAppLayoutConfiguration
{
  return self->_intersectingAppLayoutConfiguration;
}

- (void)setIntersectingAppLayoutConfiguration:(int64_t)a3
{
  self->_int64_t intersectingAppLayoutConfiguration = a3;
}

- (BOOL)intersectingAppLayoutIsOnFirstRow
{
  return self->_intersectingAppLayoutIsOnFirstRow;
}

- (void)setIntersectingAppLayoutIsOnFirstRow:(BOOL)a3
{
  self->_intersectingAppLayoutIsOnFirstRow = a3;
}

- (SBAppLayout)closestVisibleAppLayout
{
  return self->_closestVisibleAppLayout;
}

- (void)setClosestVisibleAppLayout:(id)a3
{
}

- (SBAppLayout)remainingAppLayout
{
  return self->_remainingAppLayout;
}

- (void)setRemainingAppLayout:(id)a3
{
}

- (SBAppLayout)evictedAppLayout
{
  return self->_evictedAppLayout;
}

- (void)setEvictedAppLayout:(id)a3
{
}

- (CGRect)originRect
{
  double x = self->_originRect.origin.x;
  double y = self->_originRect.origin.y;
  double width = self->_originRect.size.width;
  double height = self->_originRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOriginRect:(CGRect)a3
{
  self->_originRect = a3;
}

- (CGRect)targetRect
{
  double x = self->_targetRect.origin.x;
  double y = self->_targetRect.origin.y;
  double width = self->_targetRect.size.width;
  double height = self->_targetRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTargetRect:(CGRect)a3
{
  self->_targetRect = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evictedAppLayout, 0);
  objc_storeStrong((id *)&self->_remainingAppLayout, 0);
  objc_storeStrong((id *)&self->_closestVisibleAppLayout, 0);
  objc_storeStrong((id *)&self->_intersectingAppLayout, 0);
  objc_storeStrong((id *)&self->_draggingAppLayout, 0);
}

@end