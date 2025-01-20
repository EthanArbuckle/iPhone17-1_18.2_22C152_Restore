@interface SBMoveDisplaysTransitionSwitcherModifier
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)isSwitcherWindowVisible;
- (BOOL)remainingAppLayoutNeedsLayout;
- (CGPoint)anchorPointForIndex:(unint64_t)a3;
- (CGRect)frameForIndex:(unint64_t)a3;
- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5;
- (SBAppLayout)remainingAppLayout;
- (SBMoveDisplaysTransitionSwitcherModifier)initWithTransitionEvent:(id)a3;
- (SBTransitionSwitcherModifierMoveDisplaysContext)moveDisplaysContext;
- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5;
- (double)perspectiveAngleForAppLayout:(id)a3;
- (double)scaleForIndex:(unint64_t)a3;
- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)_appLayoutsContainingMovingDisplayItems;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)topMostLayoutElements;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
- (id)visibleAppLayouts;
@end

@implementation SBMoveDisplaysTransitionSwitcherModifier

- (SBMoveDisplaysTransitionSwitcherModifier)initWithTransitionEvent:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 transitionID];
  v27.receiver = self;
  v27.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
  v6 = [(SBTransitionSwitcherModifier *)&v27 initWithTransitionID:v5];

  if (v6)
  {
    v7 = [v4 moveDisplaysContext];
    v8 = [v4 fromAppLayout];
    v9 = [v4 toAppLayout];
    if ([v9 containsAnyItemFromAppLayout:v8] && (v10 = v9) != 0)
    {
      v22 = v10;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      v11 = [(SBTransitionSwitcherModifierMoveDisplaysContext *)v7 movingDisplayItems];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        int v14 = 0;
        uint64_t v15 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v24 != v15) {
              objc_enumerationMutation(v11);
            }
            v14 |= SBLayoutRoleIsValidForSplitView([v8 layoutRoleForItem:*(void *)(*((void *)&v23 + 1) + 8 * i)]);
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v13);
      }
      else
      {
        LOBYTE(v14) = 0;
      }

      v17 = v22;
    }
    else
    {
      v17 = 0;
      LOBYTE(v14) = 0;
    }
    moveDisplaysContext = v6->_moveDisplaysContext;
    v6->_moveDisplaysContext = v7;
    v19 = v7;

    remainingAppLayout = v6->_remainingAppLayout;
    v6->_remainingAppLayout = v17;

    v6->_remainingAppLayoutNeedsLayout = v14 & 1;
  }

  return v6;
}

- (id)transitionWillBegin
{
  v8.receiver = self;
  v8.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v8 transitionWillBegin];
  v3 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  id v4 = SBAppendSwitcherModifierResponse(v3, v2);

  v5 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
  v6 = SBAppendSwitcherModifierResponse(v5, v4);

  return v6;
}

- (id)transitionWillUpdate
{
  v6.receiver = self;
  v6.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionWillUpdate];
  v3 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:4 updateMode:3];
  id v4 = SBAppendSwitcherModifierResponse(v3, v2);

  return v4;
}

- (id)transitionDidEnd
{
  v6.receiver = self;
  v6.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
  v2 = [(SBTransitionSwitcherModifier *)&v6 transitionDidEnd];
  v3 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
  id v4 = SBAppendSwitcherModifierResponse(v3, v2);

  return v4;
}

- (id)handleSceneReadyEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
  id v4 = a3;
  v5 = [(SBSwitcherModifier *)&v11 handleSceneReadyEvent:v4];
  moveDisplaysContext = self->_moveDisplaysContext;
  v7 = objc_msgSend(v4, "appLayout", v11.receiver, v11.super_class);

  LODWORD(moveDisplaysContext) = [(SBTransitionSwitcherModifierMoveDisplaysContext *)moveDisplaysContext pertainsToAppLayout:v7];
  if (moveDisplaysContext)
  {
    objc_super v8 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:30 updateMode:0];
    uint64_t v9 = SBAppendSwitcherModifierResponse(v8, v5);

    v5 = (void *)v9;
  }
  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_super v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (-[SBTransitionSwitcherModifierMoveDisplaysContext pertainsToAppLayout:](self->_moveDisplaysContext, "pertainsToAppLayout:", v11, (void)v15))
        {
          uint64_t v12 = [v11 leafAppLayouts];
          [v5 addObjectsFromArray:v12];
        }
        else
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v13 = [v5 array];

  return v13;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  id v5 = [(SBMoveDisplaysTransitionSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if ([(SBTransitionSwitcherModifierMoveDisplaysContext *)self->_moveDisplaysContext pertainsToAppLayout:v6])
  {
    uint64_t v7 = [v6 itemForLayoutRole:1];
    unint64_t v8 = [(SBTransitionSwitcherModifier *)self transitionPhase];
    moveDisplaysContext = self->_moveDisplaysContext;
    if (v8 > 1) {
      [(SBTransitionSwitcherModifierMoveDisplaysContext *)moveDisplaysContext toFrameForDisplayItem:v7];
    }
    else {
      [(SBTransitionSwitcherModifierMoveDisplaysContext *)moveDisplaysContext fromFrameForDisplayItem:v7];
    }
    double v15 = v10;
    double v17 = v11;
    double v19 = v12;
    double v21 = v13;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    [(SBMoveDisplaysTransitionSwitcherModifier *)&v26 frameForIndex:a3];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
  }

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v11 = a4;
  moveDisplaysContext = self->_moveDisplaysContext;
  double v13 = [v11 itemForLayoutRole:a3];
  LODWORD(moveDisplaysContext) = [(SBTransitionSwitcherModifierMoveDisplaysContext *)moveDisplaysContext pertainsToDisplayItem:v13];

  if (!moveDisplaysContext)
  {
    v22.receiver = self;
    v22.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    -[SBMoveDisplaysTransitionSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v22, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v11, x, y, width, height);
    double x = v14;
    double y = v15;
    double width = v16;
    double height = v17;
  }

  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  id v5 = [(SBMoveDisplaysTransitionSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  double v7 = 1.0;
  if (![(SBTransitionSwitcherModifierMoveDisplaysContext *)self->_moveDisplaysContext pertainsToAppLayout:v6])
  {
    v10.receiver = self;
    v10.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    [(SBMoveDisplaysTransitionSwitcherModifier *)&v10 scaleForIndex:a3];
    double v7 = v8;
  }

  return v7;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  double v7 = 1.0;
  if (![(SBTransitionSwitcherModifierMoveDisplaysContext *)self->_moveDisplaysContext pertainsToAppLayout:v6])
  {
    v10.receiver = self;
    v10.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    [(SBMoveDisplaysTransitionSwitcherModifier *)&v10 scaleForLayoutRole:a3 inAppLayout:v6];
    double v7 = v8;
  }

  return v7;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a4;
  moveDisplaysContext = self->_moveDisplaysContext;
  objc_super v10 = [v8 itemForLayoutRole:a3];
  LOBYTE(moveDisplaysContext) = [(SBTransitionSwitcherModifierMoveDisplaysContext *)moveDisplaysContext pertainsToDisplayItem:v10];

  double v11 = 1.0;
  if ((moveDisplaysContext & 1) == 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    [(SBMoveDisplaysTransitionSwitcherModifier *)&v14 opacityForLayoutRole:a3 inAppLayout:v8 atIndex:a5];
    double v11 = v12;
  }

  return v11;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  id v5 = [(SBMoveDisplaysTransitionSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  double v7 = 0.5;
  double v8 = 0.5;
  if (![(SBTransitionSwitcherModifierMoveDisplaysContext *)self->_moveDisplaysContext pertainsToAppLayout:v6])
  {
    v13.receiver = self;
    v13.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    [(SBMoveDisplaysTransitionSwitcherModifier *)&v13 anchorPointForIndex:a3];
    double v7 = v9;
    double v8 = v10;
  }

  double v11 = v7;
  double v12 = v8;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if (![(SBTransitionSwitcherModifierMoveDisplaysContext *)self->_moveDisplaysContext pertainsToAppLayout:v4])
  {
    v8.receiver = self;
    v8.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    [(SBMoveDisplaysTransitionSwitcherModifier *)&v8 perspectiveAngleForAppLayout:v4];
    double v5 = v6;
  }

  return v5;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  moveDisplaysContext = self->_moveDisplaysContext;
  objc_super v8 = [v6 itemForLayoutRole:a3];
  LOBYTE(moveDisplaysContext) = [(SBTransitionSwitcherModifierMoveDisplaysContext *)moveDisplaysContext pertainsToDisplayItem:v8];

  if (moveDisplaysContext)
  {
    unsigned __int8 remainingAppLayoutNeedsLayout = 1;
  }
  else if ([(SBAppLayout *)self->_remainingAppLayout isOrContainsAppLayout:v6])
  {
    unsigned __int8 remainingAppLayoutNeedsLayout = self->_remainingAppLayoutNeedsLayout;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    unsigned __int8 remainingAppLayoutNeedsLayout = [(SBMoveDisplaysTransitionSwitcherModifier *)&v11 isLayoutRoleBlurred:a3 inAppLayout:v6];
  }

  return remainingAppLayoutNeedsLayout;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  moveDisplaysContext = self->_moveDisplaysContext;
  objc_super v8 = [v6 itemForLayoutRole:a3];
  LOBYTE(moveDisplaysContext) = [(SBTransitionSwitcherModifierMoveDisplaysContext *)moveDisplaysContext pertainsToDisplayItem:v8];

  if (moveDisplaysContext)
  {
    unsigned __int8 remainingAppLayoutNeedsLayout = 1;
  }
  else if ([(SBAppLayout *)self->_remainingAppLayout isOrContainsAppLayout:v6])
  {
    unsigned __int8 remainingAppLayoutNeedsLayout = self->_remainingAppLayoutNeedsLayout;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
    unsigned __int8 remainingAppLayoutNeedsLayout = [(SBMoveDisplaysTransitionSwitcherModifier *)&v11 isLayoutRoleMatchMovedToScene:a3 inAppLayout:v6];
  }

  return remainingAppLayoutNeedsLayout;
}

- (id)visibleAppLayouts
{
  v7.receiver = self;
  v7.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
  v3 = [(SBMoveDisplaysTransitionSwitcherModifier *)&v7 visibleAppLayouts];
  id v4 = [(SBMoveDisplaysTransitionSwitcherModifier *)self _appLayoutsContainingMovingDisplayItems];
  double v5 = [v3 setByAddingObjectsFromArray:v4];

  return v5;
}

- (id)topMostLayoutElements
{
  v3 = [(SBMoveDisplaysTransitionSwitcherModifier *)self _appLayoutsContainingMovingDisplayItems];
  v7.receiver = self;
  v7.super_class = (Class)SBMoveDisplaysTransitionSwitcherModifier;
  id v4 = [(SBMoveDisplaysTransitionSwitcherModifier *)&v7 topMostLayoutElements];
  double v5 = [v3 arrayByAddingObjectsFromArray:v4];

  return v5;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (id)_appLayoutsContainingMovingDisplayItems
{
  v3 = [(SBMoveDisplaysTransitionSwitcherModifier *)self appLayouts];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83__SBMoveDisplaysTransitionSwitcherModifier__appLayoutsContainingMovingDisplayItems__block_invoke;
  v7[3] = &unk_1E6AF4B60;
  v7[4] = self;
  id v4 = objc_msgSend(v3, "bs_filter:", v7);

  double v5 = [v4 sortedArrayUsingComparator:&__block_literal_global_381];

  return v5;
}

uint64_t __83__SBMoveDisplaysTransitionSwitcherModifier__appLayoutsContainingMovingDisplayItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 144) pertainsToAppLayout:a2];
}

BOOL __83__SBMoveDisplaysTransitionSwitcherModifier__appLayoutsContainingMovingDisplayItems__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  double v5 = [a2 layoutAttributesForItemInRole:1];
  uint64_t v6 = [v5 lastInteractionTime];
  objc_super v7 = [v4 layoutAttributesForItemInRole:1];

  BOOL v8 = v6 < [v7 lastInteractionTime];
  return v8;
}

- (SBTransitionSwitcherModifierMoveDisplaysContext)moveDisplaysContext
{
  return self->_moveDisplaysContext;
}

- (SBAppLayout)remainingAppLayout
{
  return self->_remainingAppLayout;
}

- (BOOL)remainingAppLayoutNeedsLayout
{
  return self->_remainingAppLayoutNeedsLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingAppLayout, 0);
  objc_storeStrong((id *)&self->_moveDisplaysContext, 0);
}

@end