@interface SBSplitDisplayItemSwitcherModifier
- (BOOL)completesWhenChildrenComplete;
- (BOOL)completesWhenGesturePossible;
- (BOOL)hasInvalidatedAppLayoutsForInsertion;
- (BOOL)hasInvalidatedAppLayoutsForRemoval;
- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBAppLayout)overrideAndPromoteChildAppLayout;
- (SBDisplayItem)displayItem;
- (SBSplitDisplayItemSwitcherModifier)initWithDisplayItem:(id)a3;
- (SBSplitDisplayItemSwitcherModifier)initWithDisplayItem:(id)a3 wrappingModifier:(id)a4;
- (SBSwitcherModifier)wrappingModifier;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)appLayoutContainingAppLayout:(id)a3;
- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3;
- (id)handleEvent:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4;
- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3;
- (void)_performOverrideAndPromoteChildAppLayoutToParent:(id)a3 withBlock:(id)a4;
- (void)setCompletesWhenGesturePossible:(BOOL)a3;
- (void)setHasInvalidatedAppLayoutsForInsertion:(BOOL)a3;
- (void)setHasInvalidatedAppLayoutsForRemoval:(BOOL)a3;
- (void)setOverrideAndPromoteChildAppLayout:(id)a3;
@end

@implementation SBSplitDisplayItemSwitcherModifier

- (SBSplitDisplayItemSwitcherModifier)initWithDisplayItem:(id)a3
{
  return [(SBSplitDisplayItemSwitcherModifier *)self initWithDisplayItem:a3 wrappingModifier:0];
}

- (SBSplitDisplayItemSwitcherModifier)initWithDisplayItem:(id)a3 wrappingModifier:(id)a4
{
  v7 = (SBDisplayItem *)a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  v9 = [(SBSwitcherModifier *)&v12 init];
  if (v9)
  {
    if (!v7)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v9, @"SBSplitDisplayItemSwitcherModifier.m", 33, @"Invalid parameter not satisfying: %@", @"displayItem" object file lineNumber description];
    }
    v9->_displayItem = v7;
    objc_storeStrong((id *)&v9->_wrappingModifier, a4);
    if (v9->_wrappingModifier) {
      -[SBChainableModifier addChildModifier:](v9, "addChildModifier:");
    }
    v9->_completesWhenGesturePossible = 0;
  }

  return v9;
}

- (BOOL)completesWhenChildrenComplete
{
  return self->_wrappingModifier != 0;
}

- (id)handleEvent:(id)a3
{
  id v4 = a3;
  if (self->_hasInvalidatedAppLayoutsForInsertion || [(SBChainableModifier *)self state] == 1)
  {
    v5 = 0;
  }
  else
  {
    self->_hasInvalidatedAppLayoutsForInsertion = 1;
    v6 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    v5 = SBAppendSwitcherModifierResponse(v6, 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  v7 = [(SBChainableModifier *)&v12 handleEvent:v4];
  id v8 = SBAppendSwitcherModifierResponse(v7, v5);

  if (!self->_hasInvalidatedAppLayoutsForRemoval && [(SBChainableModifier *)self state] == 1)
  {
    self->_hasInvalidatedAppLayoutsForRemoval = 1;
    v9 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v10 = SBAppendSwitcherModifierResponse(v9, v8);

    id v8 = (void *)v10;
  }

  return v8;
}

- (id)handleGestureEvent:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v7 handleGestureEvent:v4];
  if ([(SBSplitDisplayItemSwitcherModifier *)self completesWhenGesturePossible]
    && ![v4 phase])
  {
    [(SBChainableModifier *)self setState:1];
  }

  return v5;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  id v4 = [(SBSplitDisplayItemSwitcherModifier *)&v7 appLayoutsToEnsureExistForMainTransitionEvent:a3];
  v5 = [(SBSplitDisplayItemSwitcherModifier *)self adjustedAppLayoutsForAppLayouts:v4];

  return v5;
}

- (id)appLayoutContainingAppLayout:(id)a3
{
  id v4 = (SBAppLayout *)a3;
  v5 = v4;
  if (self->_overrideAndPromoteChildAppLayout == v4)
  {
    v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
    v6 = [(SBSplitDisplayItemSwitcherModifier *)&v9 appLayoutContainingAppLayout:v4];
  }
  objc_super v7 = v6;

  return v7;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  id v17 = a3;
  [(SBSplitDisplayItemSwitcherModifier *)&v25 adjustedAppLayoutsForAppLayouts:sel_adjustedAppLayoutsForAppLayouts_];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  v6 = v4;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v22;
    v6 = v4;
    do
    {
      uint64_t v9 = 0;
      uint64_t v18 = v7;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v21 + 1) + 8 * v9);
        if ([v10 containsItem:self->_displayItem])
        {
          v11 = [v10 allItems];
          unint64_t v12 = [v11 count];

          if (v12 >= 2)
          {
            v13 = (void *)[v6 mutableCopy];
            [v13 removeObject:v10];
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __70__SBSplitDisplayItemSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
            v20[3] = &unk_1E6AF4B38;
            v20[4] = self;
            v14 = [v10 appLayoutWithItemsPassingTest:v20];
            [v13 addObject:v14];

            v19[0] = MEMORY[0x1E4F143A8];
            v19[1] = 3221225472;
            v19[2] = __70__SBSplitDisplayItemSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2;
            v19[3] = &unk_1E6AF4B38;
            v19[4] = self;
            v15 = [v10 appLayoutWithItemsPassingTest:v19];
            [v13 addObject:v15];

            uint64_t v7 = v18;
            v6 = v13;
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  return v6;
}

uint64_t __70__SBSplitDisplayItemSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke()
{
  return BSEqualObjects();
}

uint64_t __70__SBSplitDisplayItemSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke_2()
{
  return BSEqualObjects() ^ 1;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  if ([(SBSplitDisplayItemSwitcherModifier *)self isChamoisWindowingUIEnabled])
  {
    v32.receiver = self;
    v32.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
    [(SBSplitDisplayItemSwitcherModifier *)&v32 frameForIndex:a3];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    v13 = [(SBSplitDisplayItemSwitcherModifier *)self appLayouts];
    v14 = [v13 objectAtIndex:a3];

    v15 = [(SBSplitDisplayItemSwitcherModifier *)self appLayoutContainingAppLayout:v14];
    if (([v14 containsItem:self->_displayItem] & 1) != 0
      || ![v15 containsItem:self->_displayItem])
    {
      v24.receiver = self;
      v24.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
      [(SBSplitDisplayItemSwitcherModifier *)&v24 frameForIndex:a3];
      double v6 = v16;
      double v8 = v17;
      double v10 = v18;
      double v12 = v19;
    }
    else
    {
      uint64_t v26 = 0;
      uint64_t v27 = (double *)&v26;
      uint64_t v28 = 0x4010000000;
      v29 = &unk_1D90ED3C6;
      long long v30 = 0u;
      long long v31 = 0u;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __52__SBSplitDisplayItemSwitcherModifier_frameForIndex___block_invoke;
      v25[3] = &unk_1E6AF6358;
      v25[5] = &v26;
      v25[6] = a3;
      v25[4] = self;
      [(SBSplitDisplayItemSwitcherModifier *)self _performOverrideAndPromoteChildAppLayoutToParent:v14 withBlock:v25];
      double v6 = v27[4];
      double v8 = v27[5];
      double v10 = v27[6];
      double v12 = v27[7];
      _Block_object_dispose(&v26, 8);
    }
  }
  double v20 = v6;
  double v21 = v8;
  double v22 = v10;
  double v23 = v12;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

id __52__SBSplitDisplayItemSwitcherModifier_frameForIndex___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  id result = objc_msgSendSuper2(&v9, sel_frameForIndex_, v2);
  id v4 = *(void **)(*(void *)(a1 + 40) + 8);
  v4[4] = v5;
  v4[5] = v6;
  v4[6] = v7;
  v4[7] = v8;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  if (![(SBSplitDisplayItemSwitcherModifier *)self isChamoisWindowingUIEnabled])
  {
    v47.receiver = self;
    v47.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
    double v12 = [(SBSplitDisplayItemSwitcherModifier *)&v47 appLayoutContainingAppLayout:v11];
    if (([v11 containsItem:self->_displayItem] & 1) == 0
      && [v12 containsItem:self->_displayItem])
    {
      v13 = [v11 itemForLayoutRole:a3];
      v46.receiver = self;
      v46.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
      -[SBSplitDisplayItemSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v46, sel_frameForLayoutRole_inAppLayout_withBounds_, [v12 layoutRoleForItem:v13], v12, x, y, width, height);
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      if (![v11 isSplitConfiguration])
      {
        v45.receiver = self;
        v45.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
        -[SBSplitDisplayItemSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v45, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, v25, v27, v29, v31);
        double v17 = v40;
        double v19 = v41;
        double v21 = v42;
        double v23 = v43;
        goto LABEL_3;
      }
    }
    v44.receiver = self;
    v44.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
    -[SBSplitDisplayItemSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v44, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
    double v17 = v32;
    double v19 = v33;
    double v21 = v34;
    double v23 = v35;
    goto LABEL_9;
  }
  v49.receiver = self;
  v49.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  double v12 = [(SBSplitDisplayItemSwitcherModifier *)&v49 appLayoutContainingAppLayout:v11];
  v13 = [(SBSwitcherModifier *)self autoLayoutSpaceForAppLayout:v12];
  v14 = [v11 itemForLayoutRole:a3];
  uint64_t v15 = [v12 layoutRoleForItem:v14];
  [v13 boundingBox];
  SBRectWithSize();
  v48.receiver = self;
  v48.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  -[SBSplitDisplayItemSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v48, sel_frameForLayoutRole_inAppLayout_withBounds_, v15, v12);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

LABEL_3:
LABEL_9:

  double v36 = v17;
  double v37 = v19;
  double v38 = v21;
  double v39 = v23;
  result.size.double height = v39;
  result.size.double width = v38;
  result.origin.double y = v37;
  result.origin.double x = v36;
  return result;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  id v4 = a3;
  if ([v4 containsItem:self->_displayItem])
  {
    BOOL v5 = 0;
  }
  else
  {
    uint64_t v6 = [(SBSplitDisplayItemSwitcherModifier *)self appLayoutContainingAppLayout:v4];
    v8.receiver = self;
    v8.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
    BOOL v5 = [(SBSplitDisplayItemSwitcherModifier *)&v8 isResizeGrabberVisibleForAppLayout:v6];
  }
  return v5;
}

- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  BOOL v5 = [(SBSplitDisplayItemSwitcherModifier *)&v18 resizeGrabberLayoutAttributesForAppLayout:v4];
  uint64_t v6 = [v5 leafAppLayout];
  if ([v6 containsItem:self->_displayItem])
  {
    id v7 = [(SBSplitDisplayItemSwitcherModifier *)self appLayoutContainingAppLayout:v4];
    objc_super v8 = v7;
    if (v7 != v4)
    {
      uint64_t v9 = [v7 layoutRoleForItem:self->_displayItem];
      if (v9 == 1)
      {
        double v10 = [v8 itemForLayoutRole:2];

        if (v10)
        {
          id v11 = [v8 leafAppLayoutForRole:2];
          [v5 setLeafAppLayout:v11];

          BOOL v12 = [(SBSplitDisplayItemSwitcherModifier *)self isRTLEnabled] == 0;
          uint64_t v13 = 2;
          uint64_t v14 = 8;
LABEL_8:
          if (v12) {
            uint64_t v16 = v13;
          }
          else {
            uint64_t v16 = v14;
          }
          [v5 setEdge:v16];
          goto LABEL_12;
        }
      }
      if (v9 == 2)
      {
        uint64_t v15 = [v8 leafAppLayoutForRole:1];
        [v5 setLeafAppLayout:v15];

        BOOL v12 = [(SBSplitDisplayItemSwitcherModifier *)self isRTLEnabled] == 0;
        uint64_t v13 = 8;
        uint64_t v14 = 2;
        goto LABEL_8;
      }
    }
LABEL_12:
  }
  return v5;
}

- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = v7;
  if ((unint64_t)[v7 count] >= 2)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __100__SBSplitDisplayItemSwitcherModifier_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts___block_invoke;
    v12[3] = &unk_1E6AF4B60;
    v12[4] = self;
    objc_super v8 = objc_msgSend(v7, "bs_filter:", v12);
  }
  v11.receiver = self;
  v11.super_class = (Class)SBSplitDisplayItemSwitcherModifier;
  uint64_t v9 = [(SBSplitDisplayItemSwitcherModifier *)&v11 preferredAppLayoutToReuseAccessoryForAppLayout:v6 fromAppLayouts:v8];

  return v9;
}

uint64_t __100__SBSplitDisplayItemSwitcherModifier_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsItem:*(void *)(*(void *)(a1 + 32) + 104)] ^ 1;
}

- (void)_performOverrideAndPromoteChildAppLayoutToParent:(id)a3 withBlock:(id)a4
{
  id v6 = (SBAppLayout *)a3;
  id v7 = self->_overrideAndPromoteChildAppLayout;
  overrideAndPromoteChildAppLayout = self->_overrideAndPromoteChildAppLayout;
  self->_overrideAndPromoteChildAppLayout = v6;
  objc_super v11 = v6;
  uint64_t v9 = (void (**)(void))a4;

  v9[2](v9);
  double v10 = self->_overrideAndPromoteChildAppLayout;
  self->_overrideAndPromoteChildAppLayout = v7;
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (SBSwitcherModifier)wrappingModifier
{
  return self->_wrappingModifier;
}

- (BOOL)completesWhenGesturePossible
{
  return self->_completesWhenGesturePossible;
}

- (void)setCompletesWhenGesturePossible:(BOOL)a3
{
  self->_completesWhenGesturePossible = a3;
}

- (BOOL)hasInvalidatedAppLayoutsForInsertion
{
  return self->_hasInvalidatedAppLayoutsForInsertion;
}

- (void)setHasInvalidatedAppLayoutsForInsertion:(BOOL)a3
{
  self->_hasInvalidatedAppLayoutsForInsertion = a3;
}

- (BOOL)hasInvalidatedAppLayoutsForRemoval
{
  return self->_hasInvalidatedAppLayoutsForRemoval;
}

- (void)setHasInvalidatedAppLayoutsForRemoval:(BOOL)a3
{
  self->_hasInvalidatedAppLayoutsForRemoval = a3;
}

- (SBAppLayout)overrideAndPromoteChildAppLayout
{
  return self->_overrideAndPromoteChildAppLayout;
}

- (void)setOverrideAndPromoteChildAppLayout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideAndPromoteChildAppLayout, 0);
  objc_storeStrong((id *)&self->_wrappingModifier, 0);
}

@end