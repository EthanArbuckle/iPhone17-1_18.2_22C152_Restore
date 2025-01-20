@interface SBTransitionSwitcherModifier
- (BOOL)asyncRenderingDisabled;
- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3;
- (BOOL)isInterrupted;
- (BOOL)isPreparingLayout;
- (BOOL)isUpdatingLayout;
- (BOOL)requireStripContentsInViewHierarchy;
- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3;
- (BOOL)shouldInterruptForRemovalEvent:(id)a3;
- (BOOL)shouldPerformCrossfadeForReduceMotion;
- (BOOL)wantsAsynchronousSurfaceRetentionAssertion;
- (NSUUID)transitionID;
- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3;
- (SBTransitionSwitcherModifier)initWithTransitionID:(id)a3;
- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)animationAttributesForLayoutElement:(id)a3;
- (id)appLayoutsToResignActive;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)handleGestureEvent:(id)a3;
- (id)handleRemovalEvent:(id)a3;
- (id)handleScrollEvent:(id)a3;
- (id)handleTimerEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (id)interruptAndEndTransition;
- (id)keyboardSuppressionMode;
- (id)transitionDidEnd;
- (id)transitionWillBegin;
- (id)transitionWillUpdate;
- (unint64_t)maskedCornersForIndex:(unint64_t)a3;
- (unint64_t)transitionPhase;
- (void)_setTransitionPhase:(unint64_t)a3;
@end

@implementation SBTransitionSwitcherModifier

- (BOOL)isUpdatingLayout
{
  return (self->_transitionPhase & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isPreparingLayout
{
  return self->_transitionPhase == 1;
}

- (BOOL)clipsToUnobscuredMarginAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBTransitionSwitcherModifier;
  v3 = [(SBTransitionSwitcherModifier *)&v6 animationAttributesForLayoutElement:a3];
  v4 = (void *)[v3 mutableCopy];

  [v4 setUpdateMode:3];
  return v4;
}

- (id)handleTransitionEvent:(id)a3
{
  id v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SBTransitionSwitcherModifier;
  objc_super v6 = [(SBSwitcherModifier *)&v30 handleTransitionEvent:v5];
  if ([v5 toEnvironmentMode] == 2) {
    char v7 = 1;
  }
  else {
    char v7 = [v5 toFloatingSwitcherVisible];
  }
  self->_isTransitioningToSwitcher = v7;
  v8 = [(SBTransitionSwitcherModifier *)self appLayoutsToEnsureExistForMainTransitionEvent:v5];
  appLayoutsToEnsureExist = self->_appLayoutsToEnsureExist;
  self->_appLayoutsToEnsureExist = v8;

  unint64_t v10 = [v5 phase];
  v11 = [v5 transitionID];
  int v12 = [v11 isEqual:self->_transitionID];

  if (v12)
  {
    if (v10 <= self->_transitionPhase)
    {
      v27 = [MEMORY[0x1E4F28B00] currentHandler];
      v28 = SBStringFromTransitionPhase(v10);
      v29 = SBStringFromTransitionPhase(self->_transitionPhase);
      [v27 handleFailureInMethod:a2, self, @"SBTransitionSwitcherModifier.m", 272, @"Expected a more advanced phase. Got %@, currently %@.", v28, v29 object file lineNumber description];
    }
    self->_unint64_t transitionPhase = v10;
    if (v10 == 3 && [v5 isAnimated])
    {
      v13 = [v5 fromAppLayout];
      v14 = [v5 toAppLayout];

      uint64_t v15 = [v5 fromEnvironmentMode];
      uint64_t v16 = [v5 toEnvironmentMode];
      v17 = [v5 toAppLayout];
      v18 = v17;
      if (!v17 || v13 == v14 && v15 == v16)
      {
      }
      else
      {
        uint64_t v24 = [v5 toEnvironmentMode];

        if (v24 == 3)
        {
          v25 = [[SBPreemptAnimationSwitcherEventResponse alloc] initWithOptions:2];
          uint64_t v26 = SBAppendSwitcherModifierResponse(v25, v6);

          objc_super v6 = (void *)v26;
        }
      }
    }
  }
  else
  {
    self->_isInterrupted = 1;
    self->_unint64_t transitionPhase = 3;
  }
  unint64_t transitionPhase = self->_transitionPhase;
  if (transitionPhase == 3)
  {
    [(SBChainableModifier *)self setState:1];
    unint64_t transitionPhase = self->_transitionPhase;
  }
  switch(transitionPhase)
  {
    case 3uLL:
      uint64_t v20 = [(SBTransitionSwitcherModifier *)self transitionDidEnd];
      break;
    case 2uLL:
      uint64_t v20 = [(SBTransitionSwitcherModifier *)self transitionWillUpdate];
      break;
    case 1uLL:
      uint64_t v20 = [(SBTransitionSwitcherModifier *)self transitionWillBegin];
      break;
    default:
      goto LABEL_23;
  }
  v21 = (void *)v20;
  uint64_t v22 = SBAppendSwitcherModifierResponse(v20, v6);

  objc_super v6 = (void *)v22;
LABEL_23:

  return v6;
}

- (id)transitionWillUpdate
{
  return 0;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBTransitionSwitcherModifier;
  return (SBSwitcherAsyncRenderingAttributes)((unsigned __int16)[(SBTransitionSwitcherModifier *)&v4 asyncRenderingAttributesForAppLayout:a3] & 0xFF01 | self->_wantsResignActiveAndAsyncRenderingAssertions);
}

- (BOOL)wantsAsynchronousSurfaceRetentionAssertion
{
  return 1;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 15;
}

- (double)visibleMarginForItemContainerAtIndex:(unint64_t)a3
{
  [(SBTransitionSwitcherModifier *)self frameForIndex:a3];
  return CGRectGetWidth(*(CGRect *)&v3);
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)SBTransitionSwitcherModifier;
  objc_super v4 = [(SBTransitionSwitcherModifier *)&v34 adjustedAppLayoutsForAppLayouts:a3];
  if ([(NSArray *)self->_appLayoutsToEnsureExist count])
  {
    uint64_t v20 = v4;
    objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v4];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obj = self->_appLayoutsToEnsureExist;
    uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v31;
      uint64_t v21 = *(void *)v31;
      do
      {
        uint64_t v8 = 0;
        uint64_t v22 = v6;
        do
        {
          if (*(void *)v31 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v30 + 1) + 8 * v8);
          if (([v4 containsObject:v9] & 1) == 0)
          {
            uint64_t v24 = v8;
            long long v28 = 0u;
            long long v29 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            unint64_t v10 = (void *)[v4 copy];
            uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
            if (v11)
            {
              uint64_t v12 = v11;
              uint64_t v13 = *(void *)v27;
              do
              {
                for (uint64_t i = 0; i != v12; ++i)
                {
                  if (*(void *)v27 != v13) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v15 = *(void **)(*((void *)&v26 + 1) + 8 * i);
                  if ([v15 containsAnyItemFromAppLayout:v9])
                  {
                    uint64_t v16 = [v4 indexOfObject:v15];
                    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
                    {
                      uint64_t v17 = v16;
                      [v4 removeObjectAtIndex:v16];
                      v25[0] = MEMORY[0x1E4F143A8];
                      v25[1] = 3221225472;
                      v25[2] = __64__SBTransitionSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
                      v25[3] = &unk_1E6AF4B38;
                      v25[4] = v9;
                      v18 = [v15 appLayoutWithItemsPassingTest:v25];
                      if (v18) {
                        [v4 insertObject:v18 atIndex:v17];
                      }
                    }
                  }
                }
                uint64_t v12 = [v10 countByEnumeratingWithState:&v26 objects:v35 count:16];
              }
              while (v12);
            }

            [v4 insertObject:v9 atIndex:0];
            uint64_t v7 = v21;
            uint64_t v6 = v22;
            uint64_t v8 = v24;
          }
          ++v8;
        }
        while (v8 != v6);
        uint64_t v6 = [(NSArray *)obj countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v6);
    }
  }
  return v4;
}

- (id)handleTimerEvent:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SBTransitionSwitcherModifier;
  id v4 = a3;
  uint64_t v5 = [(SBSwitcherModifier *)&v8 handleTimerEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "reason", v8.receiver, v8.super_class);

  LODWORD(v4) = [v6 isEqualToString:@"kSBTransitionModifierInvalidateAsyncRenderingReason"];
  if (v4) {
    self->_wantsResignActiveAndAsyncRenderingAssertions = 0;
  }
  return v5;
}

- (id)transitionWillBegin
{
  BOOL v3 = [(SBTransitionSwitcherModifier *)self asyncRenderingDisabled];
  id v4 = 0;
  BOOL v5 = !v3;
  if (!self->_wantsResignActiveAndAsyncRenderingAssertions) {
    BOOL v5 = 0;
  }
  self->_wantsResignActiveAndAsyncRenderingAssertions = v5;
  double v15 = 0.0;
  if (!v3)
  {
    if ([(SBTransitionSwitcherModifier *)self shouldAsyncRenderUntilDelay:&v15])
    {
      objc_initWeak(&location, self);
      uint64_t v6 = [SBTimerEventSwitcherEventResponse alloc];
      double v7 = v15;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __51__SBTransitionSwitcherModifier_transitionWillBegin__block_invoke;
      v12[3] = &unk_1E6AF90F0;
      objc_copyWeak(&v13, &location);
      objc_super v8 = [(SBTimerEventSwitcherEventResponse *)v6 initWithDelay:v12 validator:@"kSBTransitionModifierInvalidateAsyncRenderingReason" reason:v7];
      id v4 = SBAppendSwitcherModifierResponse(v8, 0);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
    else
    {
      id v4 = 0;
    }
  }
  if ([(NSArray *)self->_appLayoutsToEnsureExist count])
  {
    uint64_t v9 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v10 = +[SBChainableModifierEventResponse responseByAppendingResponse:v9 toResponse:v4];

    id v4 = (void *)v10;
  }
  return v4;
}

- (id)transitionDidEnd
{
  if ([(NSArray *)self->_appLayoutsToEnsureExist count])
  {
    v2 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    BOOL v3 = +[SBChainableModifierEventResponse responseByAppendingResponse:v2 toResponse:0];
  }
  else
  {
    BOOL v3 = 0;
  }
  return v3;
}

- (id)keyboardSuppressionMode
{
  if (self->_wantsResignActiveAndAsyncRenderingAssertions)
  {
    v2 = +[SBSwitcherKeyboardSuppressionMode suppressionModeForAllScenes];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SBTransitionSwitcherModifier;
    v2 = [(SBTransitionSwitcherModifier *)&v4 keyboardSuppressionMode];
  }
  return v2;
}

- (id)appLayoutsToResignActive
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_wantsResignActiveAndAsyncRenderingAssertions)
  {
    v2 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v3 = (void *)MEMORY[0x1E4F1CAD0];
    objc_super v4 = [(SBTransitionSwitcherModifier *)self appLayouts];
    BOOL v5 = [v3 setWithArray:v4];
    uint64_t v6 = [v2 dictionaryWithObject:v5 forKey:&unk_1F33498D8];
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)SBTransitionSwitcherModifier;
    double v7 = [(SBTransitionSwitcherModifier *)&v20 appLayoutsToResignActive];
    objc_super v8 = objc_opt_new();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v9 = objc_msgSend(v7, "allValues", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) allObjects];
          [v8 addObjectsFromArray:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v11);
    }

    uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v8 forKey:&unk_1F33498F0];
  }
  return v6;
}

BOOL __51__SBTransitionSwitcherModifier_transitionWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained parentModifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionID, 0);
  objc_storeStrong((id *)&self->_appLayoutsToEnsureExist, 0);
}

- (SBTransitionSwitcherModifier)initWithTransitionID:(id)a3
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBTransitionSwitcherModifier;
  double v7 = [(SBSwitcherModifier *)&v10 init];
  if (v7)
  {
    if (!v6)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, v7, @"SBTransitionSwitcherModifier.m", 48, @"Invalid parameter not satisfying: %@", @"transitionID" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_transitionID, a3);
    v7->_unint64_t transitionPhase = 0;
    v7->_wantsResignActiveAndAsyncRenderingAssertions = 1;
  }

  return v7;
}

- (BOOL)isInterrupted
{
  return self->_isInterrupted;
}

- (BOOL)shouldAsyncRenderUntilDelay:(double *)a3
{
  return 0;
}

- (BOOL)shouldInterruptForRemovalEvent:(id)a3
{
  return 1;
}

- (id)interruptAndEndTransition
{
  if (self->_transitionPhase == 3)
  {
    v2 = 0;
  }
  else
  {
    self->_isInterrupted = 1;
    self->_unint64_t transitionPhase = 3;
    [(SBChainableModifier *)self setState:1];
    v2 = [(SBTransitionSwitcherModifier *)self transitionDidEnd];
  }
  return v2;
}

- (BOOL)requireStripContentsInViewHierarchy
{
  return 1;
}

uint64_t __64__SBTransitionSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  objc_super v4 = [v2 allItems];
  int v5 = [v4 containsObject:v3];

  return v5 ^ 1u;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 1;
}

- (void)_setTransitionPhase:(unint64_t)a3
{
  self->_unint64_t transitionPhase = a3;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBTransitionSwitcherModifier;
  objc_super v4 = [(SBChainableModifier *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  int v5 = SBStringFromTransitionPhase(self->_transitionPhase);
  [v4 appendString:v5 withName:@"phase"];

  return v4;
}

- (id)handleGestureEvent:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)SBTransitionSwitcherModifier;
  id v4 = a3;
  int v5 = [(SBSwitcherModifier *)&v10 handleGestureEvent:v4];
  uint64_t v6 = objc_msgSend(v4, "phase", v10.receiver, v10.super_class);

  if (v6)
  {
    self->_isInterrupted = 1;
    self->_unint64_t transitionPhase = 3;
    [(SBChainableModifier *)self setState:1];
    objc_super v7 = [(SBTransitionSwitcherModifier *)self transitionDidEnd];
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    int v5 = (void *)v8;
  }
  return v5;
}

- (id)handleScrollEvent:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SBTransitionSwitcherModifier;
  id v4 = a3;
  int v5 = [(SBSwitcherModifier *)&v11 handleScrollEvent:v4];
  int v6 = objc_msgSend(v4, "isUserInitiated", v11.receiver, v11.super_class);

  if (v6 && self->_isTransitioningToSwitcher)
  {
    objc_super v7 = [(SBTransitionSwitcherModifier *)self interruptAndEndTransition];
    uint64_t v8 = +[SBChainableModifierEventResponse responseByAppendingResponse:v7 toResponse:v5];

    uint64_t v9 = [[SBPreemptAnimationSwitcherEventResponse alloc] initWithOptions:1];
    int v5 = +[SBChainableModifierEventResponse responseByAppendingResponse:v9 toResponse:v8];
  }
  return v5;
}

- (id)handleRemovalEvent:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTransitionSwitcherModifier;
  int v5 = [(SBSwitcherModifier *)&v9 handleRemovalEvent:v4];
  if ([v4 phase] == 1
    && [(SBTransitionSwitcherModifier *)self shouldInterruptForRemovalEvent:v4])
  {
    int v6 = [(SBTransitionSwitcherModifier *)self interruptAndEndTransition];
    uint64_t v7 = +[SBChainableModifierEventResponse responseByAppendingResponse:v6 toResponse:v5];

    int v5 = (void *)v7;
  }

  return v5;
}

- (NSUUID)transitionID
{
  return self->_transitionID;
}

- (unint64_t)transitionPhase
{
  return self->_transitionPhase;
}

- (BOOL)asyncRenderingDisabled
{
  return self->_asyncRenderingDisabled;
}

@end