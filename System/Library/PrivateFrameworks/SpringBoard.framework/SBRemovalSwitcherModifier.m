@interface SBRemovalSwitcherModifier
- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3;
- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4;
- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3;
- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3;
- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3;
- (SBRemovalSwitcherModifier)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 reason:(int64_t)a5;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (double)blurViewIconScaleForIndex:(unint64_t)a3;
- (id)_remainingAppLayoutForRemovingLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)handleInsertionEvent:(id)a3;
- (id)handleRemovalEvent:(id)a3;
- (id)handleResizeProgressEvent:(id)a3;
- (id)handleSceneReadyEvent:(id)a3;
- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4;
- (id)topMostLayoutElements;
- (id)visibleAppLayouts;
- (void)_performBlockWhileSimulatingPostRemovalAppLayoutState:(id)a3;
@end

@implementation SBRemovalSwitcherModifier

- (SBRemovalSwitcherModifier)initWithLayoutRole:(int64_t)a3 inAppLayout:(id)a4 reason:(int64_t)a5
{
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBRemovalSwitcherModifier;
  v11 = [(SBSwitcherModifier *)&v14 init];
  if (v11)
  {
    if (!v10)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2, v11, @"SBRemovalSwitcherModifier.m", 47, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    v11->_layoutRole = a3;
    objc_storeStrong((id *)&v11->_appLayout, a4);
    v11->_reason = a5;
    v11->_phase = 0;
    v11->_indexToScrollToAfterRemoval = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v11;
}

- (id)_remainingAppLayoutForRemovingLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v5 = a4;
  if ([v5 isCenterOverFull])
  {
    v6 = 0;
  }
  else
  {
    v7 = [v5 itemForLayoutRole:a3];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__SBRemovalSwitcherModifier__remainingAppLayoutForRemovingLayoutRole_inAppLayout___block_invoke;
    v10[3] = &unk_1E6AF4B38;
    id v11 = v7;
    id v8 = v7;
    v6 = [v5 appLayoutWithItemsPassingTest:v10];
  }
  return v6;
}

BOOL __82__SBRemovalSwitcherModifier__remainingAppLayoutForRemovingLayoutRole_inAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 32) != a2;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SBRemovalSwitcherModifier;
  id v5 = [(SBSwitcherModifier *)&v31 handleRemovalEvent:v4];
  appLayout = self->_appLayout;
  v7 = [v4 appLayout];
  LODWORD(appLayout) = [(SBAppLayout *)appLayout isEqual:v7];

  if (appLayout)
  {
    unint64_t v8 = [v4 phase];
    self->_phase = v8;
    if (v8 == 3)
    {
      if (self->_reason != 1)
      {
        v17 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
        uint64_t v18 = +[SBChainableModifierEventResponse responseByAppendingResponse:v17 toResponse:v5];

        id v5 = (void *)v18;
      }
      v15 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:4 updateMode:3];
      uint64_t v19 = +[SBChainableModifierEventResponse responseByAppendingResponse:v15 toResponse:v5];

      [(SBChainableModifier *)self setState:1];
      id v5 = (void *)v19;
    }
    else
    {
      if (v8 == 2)
      {
        v15 = objc_alloc_init(SBSwitcherModifierEventResponse);
        v20 = [(SBRemovalSwitcherModifier *)self appLayouts];
        unint64_t v21 = [v20 count];
        if (self->_indexToScrollToAfterRemoval >= v21)
        {
          uint64_t v24 = v21;
          v22 = SBLogAppSwitcher();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
            [(SBRemovalSwitcherModifier *)(uint64_t *)&self->_indexToScrollToAfterRemoval handleRemovalEvent:v22];
          }
        }
        else
        {
          v22 = objc_msgSend(v20, "objectAtIndex:");
          v23 = [[SBScrollToAppLayoutSwitcherEventResponse alloc] initWithAppLayout:v22 alignment:0 animated:0];
          [(SBChainableModifierEventResponse *)v15 addChildResponse:v23];
        }
        if (self->_reason == 1)
        {
          v25 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
          [(SBChainableModifierEventResponse *)v15 addChildResponse:v25];
          if (self->_resultingAppLayoutIfAny)
          {
            v26 = [SBInvalidateSnapshotCacheSwitcherEventResponse alloc];
            v27 = [(SBAppLayout *)self->_resultingAppLayoutIfAny allItems];
            v28 = [(SBInvalidateSnapshotCacheSwitcherEventResponse *)v26 initWithDisplayItems:v27];

            [(SBChainableModifierEventResponse *)v15 addChildResponse:v28];
          }
        }
        uint64_t v16 = +[SBChainableModifierEventResponse responseByAppendingResponse:v15 toResponse:v5];
      }
      else
      {
        if (v8 != 1) {
          goto LABEL_20;
        }
        v9 = [(SBRemovalSwitcherModifier *)self appLayouts];
        unint64_t v10 = [v9 indexOfObject:self->_appLayout];

        self->_indexToScrollToAfterRemoval = [(SBRemovalSwitcherModifier *)self indexToScrollToAfterRemovingIndex:v10];
        self->_indexOfAppLayoutPriorToRemoval = v10;
        v30.receiver = self;
        v30.super_class = (Class)SBRemovalSwitcherModifier;
        id v11 = [(SBRemovalSwitcherModifier *)&v30 visibleAppLayouts];
        visibleAppLayoutsPriorToRemoval = self->_visibleAppLayoutsPriorToRemoval;
        self->_visibleAppLayoutsPriorToRemoval = v11;

        v13 = [(SBRemovalSwitcherModifier *)self _remainingAppLayoutForRemovingLayoutRole:self->_layoutRole inAppLayout:self->_appLayout];
        resultingAppLayoutIfAny = self->_resultingAppLayoutIfAny;
        self->_resultingAppLayoutIfAny = v13;

        v15 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:2 updateMode:2];
        uint64_t v16 = +[SBChainableModifierEventResponse responseByAppendingResponse:v15 toResponse:v5];
      }
      id v5 = (void *)v16;
    }
  }
LABEL_20:

  return v5;
}

- (id)handleInsertionEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBRemovalSwitcherModifier;
  id v4 = a3;
  id v5 = [(SBSwitcherModifier *)&v8 handleInsertionEvent:v4];
  v6 = objc_msgSend(v4, "appLayout", v8.receiver, v8.super_class);

  LODWORD(v4) = BSEqualObjects();
  if (v4) {
    [(SBChainableModifier *)self setState:1];
  }
  return v5;
}

- (id)handleResizeProgressEvent:(id)a3
{
  id v4 = a3;
  [v4 progress];
  id v5 = [(SBRemovalSwitcherModifier *)self medusaSettings];
  [v5 resizeAnimationUnblurThresholdPercentage];
  self->_hasResizedEnoughToUnblur = BSFloatGreaterThanOrEqualToFloat();

  v6 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
  v10.receiver = self;
  v10.super_class = (Class)SBRemovalSwitcherModifier;
  v7 = [(SBSwitcherModifier *)&v10 handleResizeProgressEvent:v4];

  objc_super v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v6 toResponse:v7];

  return v8;
}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4 = a3;
  id v5 = [[SBUpdateLayoutSwitcherEventResponse alloc] initWithOptions:32 updateMode:2];
  v9.receiver = self;
  v9.super_class = (Class)SBRemovalSwitcherModifier;
  v6 = [(SBSwitcherModifier *)&v9 handleSceneReadyEvent:v4];

  v7 = +[SBChainableModifierEventResponse responseByAppendingResponse:v5 toResponse:v6];

  return v7;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  id v4 = a3;
  if (([v4 isOrContainsAppLayout:self->_appLayout] & 1) != 0
    || [v4 isOrContainsAppLayout:self->_resultingAppLayoutIfAny])
  {
    unsigned __int16 v5 = SBSwitcherAsyncRenderingAttributesMake(0, 0);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBRemovalSwitcherModifier;
    unsigned __int16 v5 = (unsigned __int16)[(SBRemovalSwitcherModifier *)&v8 asyncRenderingAttributesForAppLayout:v4];
  }
  SBSwitcherAsyncRenderingAttributes v6 = (SBSwitcherAsyncRenderingAttributes)v5;

  return v6;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6 = a4;
  p_appLayout = &self->_appLayout;
  if ((([v6 isOrContainsAppLayout:self->_appLayout] & 1) != 0
     || [v6 isOrContainsAppLayout:self->_resultingAppLayoutIfAny])
    && self->_layoutRole == 4)
  {
    goto LABEL_6;
  }
  if (self->_phase == 1)
  {
    if (self->_layoutRole == a3)
    {
LABEL_6:
      BOOL v8 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    p_appLayout = &self->_resultingAppLayoutIfAny;
  }
  objc_super v9 = *p_appLayout;
  objc_super v10 = v9;
  BOOL v8 = v9
    && [(SBAppLayout *)v9 isEqual:v6]
    && (![(SBRemovalSwitcherModifier *)self isLayoutRoleContentReady:a3 inAppLayout:v10]|| !self->_hasResizedEnoughToUnblur);

LABEL_15:
  return v8;
}

- (id)visibleAppLayouts
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  v18.receiver = self;
  v18.super_class = (Class)SBRemovalSwitcherModifier;
  id v4 = [(SBRemovalSwitcherModifier *)&v18 visibleAppLayouts];
  unsigned __int16 v5 = (void *)[v3 initWithSet:v4];

  id v6 = [(NSSet *)self->_visibleAppLayoutsPriorToRemoval allObjects];
  [v5 addObjectsFromArray:v6];

  [v5 addObject:self->_appLayout];
  unint64_t phase = self->_phase;
  if (phase)
  {
    if (phase == 1)
    {
      uint64_t v12 = 0;
      v13 = &v12;
      uint64_t v14 = 0x3032000000;
      v15 = __Block_byref_object_copy__95;
      uint64_t v16 = __Block_byref_object_dispose__95;
      id v17 = 0;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __46__SBRemovalSwitcherModifier_visibleAppLayouts__block_invoke;
      v11[3] = &unk_1E6AF4B88;
      v11[4] = self;
      v11[5] = &v12;
      [(SBRemovalSwitcherModifier *)self _performBlockWhileSimulatingPostRemovalAppLayoutState:v11];
      BOOL v8 = (void *)v13[5];
      if (v8)
      {
        objc_super v9 = [v8 allObjects];
        [v5 addObjectsFromArray:v9];
      }
      _Block_object_dispose(&v12, 8);
    }
    else if (self->_reason == 1)
    {
      [v5 removeObject:self->_appLayout];
    }
  }
  return v5;
}

void __46__SBRemovalSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1)
{
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)SBRemovalSwitcherModifier;
  uint64_t v2 = objc_msgSendSuper2(&v5, sel_visibleAppLayouts);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBRemovalSwitcherModifier;
  objc_super v5 = [(SBRemovalSwitcherModifier *)&v17 animationAttributesForLayoutElement:v4];
  id v6 = (void *)[v5 mutableCopy];

  if (self->_phase == 2)
  {
    uint64_t v7 = 3;
LABEL_5:
    [v6 setUpdateMode:v7];
    goto LABEL_6;
  }
  if ([v6 updateMode] == 1)
  {
    uint64_t v7 = 2;
    goto LABEL_5;
  }
LABEL_6:
  if (![v4 switcherLayoutElementType]
    && [v4 isOrContainsAppLayout:self->_appLayout])
  {
    BOOL v8 = [(SBRemovalSwitcherModifier *)self medusaSettings];
    objc_super v9 = [v8 resizeAnimationSettings];

    [v6 setLayoutSettings:v9];
    [v6 setPositionSettings:v9];
    objc_super v10 = (void *)[objc_alloc(MEMORY[0x1E4FA5F08]) initWithDefaultValues];
    id v11 = [(SBRemovalSwitcherModifier *)self switcherSettings];
    uint64_t v12 = [v11 animationSettings];
    [v12 appSwitcherTitleAndIconFadeInSlowDownFactor];
    double v14 = v13;

    [v9 response];
    [v10 setResponse:v14 * v15];
    [v6 setOpacitySettings:v10];
  }
  return v6;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  objc_super v5 = [(SBRemovalSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if (v6 == self->_appLayout)
  {
    BOOL v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBRemovalSwitcherModifier;
    BOOL v7 = [(SBRemovalSwitcherModifier *)&v9 shouldUseAnchorPointToPinLayoutRolesToSpace:a3];
  }

  return v7;
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBRemovalSwitcherModifier;
  BOOL v7 = [(SBRemovalSwitcherModifier *)&v16 resizeProgressNotificationsForLayoutRole:a3 inAppLayout:v6];
  resultingAppLayoutIfAny = self->_resultingAppLayoutIfAny;
  if (resultingAppLayoutIfAny && [(SBAppLayout *)resultingAppLayoutIfAny isEqual:v6])
  {
    objc_super v9 = [(SBRemovalSwitcherModifier *)self medusaSettings];
    [v9 resizeAnimationUnblurThresholdPercentage];
    double v11 = v10;

    v17[0] = &unk_1F3348DF8;
    uint64_t v12 = [NSNumber numberWithDouble:v11];
    v17[1] = v12;
    double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    uint64_t v14 = [v7 setByAddingObjectsFromArray:v13];

    BOOL v7 = (void *)v14;
  }

  return v7;
}

- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3
{
  if (!self->_resultingAppLayoutIfAny || self->_phase < 2) {
    return 0;
  }
  objc_super v5 = [(SBRemovalSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  BOOL v7 = [(SBAppLayout *)self->_resultingAppLayoutIfAny isEqual:v6];
  return v7;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  id v4 = a3;
  if ([(SBAppLayout *)self->_appLayout isOrContainsAppLayout:v4])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBRemovalSwitcherModifier;
    BOOL v5 = [(SBRemovalSwitcherModifier *)&v7 shouldAccessoryDrawShadowForAppLayout:v4];
  }

  return v5;
}

- (void)_performBlockWhileSimulatingPostRemovalAppLayoutState:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
  id v6 = [(SBRemovalSwitcherModifier *)self appLayouts];
  objc_super v7 = (void *)[v5 initWithArray:v6];

  appLayout = self->_appLayout;
  if (self->_resultingAppLayoutIfAny) {
    objc_msgSend(v7, "replaceObjectAtIndex:withObject:", objc_msgSend(v7, "indexOfObject:", appLayout), self->_resultingAppLayoutIfAny);
  }
  else {
    [v7 removeObject:appLayout];
  }
  objc_super v9 = [[SBOverrideAppLayoutsSwitcherModifier alloc] initWithAppLayouts:v7];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__SBRemovalSwitcherModifier__performBlockWhileSimulatingPostRemovalAppLayoutState___block_invoke;
  v12[3] = &unk_1E6AF5FC8;
  v12[4] = self;
  id v13 = v7;
  id v14 = v4;
  id v10 = v4;
  id v11 = v7;
  [(SBChainableModifier *)self performTransactionWithTemporaryChildModifier:v9 usingBlock:v12];
}

void __83__SBRemovalSwitcherModifier__performBlockWhileSimulatingPostRemovalAppLayoutState___block_invoke(id *a1)
{
  unint64_t v2 = *((void *)a1[4] + 17);
  if (v2 == 0x7FFFFFFFFFFFFFFFLL || v2 >= [a1[5] count])
  {
    BOOL v8 = (void (*)(void))*((void *)a1[6] + 2);
    v8();
  }
  else
  {
    uint64_t v3 = *((void *)a1[4] + 17);
    v11.receiver = a1[4];
    v11.super_class = (Class)SBRemovalSwitcherModifier;
    objc_msgSendSuper2(&v11, sel_contentOffsetForIndex_alignment_, v3, 0);
    id v6 = -[SBOverrideScrollViewContentOffsetSwitcherModifier initWithScrollViewContentOffset:]([SBOverrideScrollViewContentOffsetSwitcherModifier alloc], "initWithScrollViewContentOffset:", v4, v5);
    id v7 = a1[4];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__SBRemovalSwitcherModifier__performBlockWhileSimulatingPostRemovalAppLayoutState___block_invoke_2;
    v9[3] = &unk_1E6AF5300;
    id v10 = a1[6];
    [v7 performTransactionWithTemporaryChildModifier:v6 usingBlock:v9];
  }
}

uint64_t __83__SBRemovalSwitcherModifier__performBlockWhileSimulatingPostRemovalAppLayoutState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (double)blurViewIconScaleForIndex:(unint64_t)a3
{
  double v5 = [(SBRemovalSwitcherModifier *)self appLayouts];
  id v6 = [v5 objectAtIndex:a3];

  if (self->_phase == 1) {
    id v7 = &OBJC_IVAR___SBRemovalSwitcherModifier__appLayout;
  }
  else {
    id v7 = &OBJC_IVAR___SBRemovalSwitcherModifier__resultingAppLayoutIfAny;
  }
  if (v6 == *(objc_class **)((char *)&self->super.super.super.isa + *v7))
  {
    double v9 = 0.0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBRemovalSwitcherModifier;
    [(SBRemovalSwitcherModifier *)&v11 blurViewIconScaleForIndex:a3];
    double v9 = v8;
  }

  return v9;
}

- (id)topMostLayoutElements
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v23.receiver = self;
  v23.super_class = (Class)SBRemovalSwitcherModifier;
  uint64_t v3 = [(SBRemovalSwitcherModifier *)&v23 topMostLayoutElements];
  double v4 = v3;
  if (self->_phase == 2)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = (void *)MEMORY[0x1E4F28D60];
    unint64_t v7 = [v4 count];
    if (v7 >= self->_indexOfAppLayoutPriorToRemoval) {
      unint64_t indexOfAppLayoutPriorToRemoval = self->_indexOfAppLayoutPriorToRemoval;
    }
    else {
      unint64_t indexOfAppLayoutPriorToRemoval = v7;
    }
    double v9 = objc_msgSend(v6, "indexSetWithIndexesInRange:", 0, indexOfAppLayoutPriorToRemoval);
    id v10 = [v4 objectsAtIndexes:v9];
    [v5 addObjectsFromArray:v10];

    objc_super v11 = [(SBAppLayout *)self->_appLayout leafAppLayoutForRole:self->_layoutRole];
    [v5 addObject:v11];
    if (v4)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v12 = v4;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v20;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v20 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * i);
            if ((objc_msgSend(v5, "containsObject:", v17, (void)v19) & 1) == 0) {
              [v5 addObject:v17];
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v24 count:16];
        }
        while (v14);
      }
    }
  }
  else
  {
    id v5 = v3;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultingAppLayoutIfAny, 0);
  objc_storeStrong((id *)&self->_visibleAppLayoutsPriorToRemoval, 0);
  objc_storeStrong((id *)&self->_multitaskingModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

- (void)handleRemovalEvent:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_fault_impl(&dword_1D85BA000, log, OS_LOG_TYPE_FAULT, "Not scrolling after app removal. The index to scroll to (%lu) is no longer valid. The list of app layouts has %lu elements only.", (uint8_t *)&v4, 0x16u);
}

@end