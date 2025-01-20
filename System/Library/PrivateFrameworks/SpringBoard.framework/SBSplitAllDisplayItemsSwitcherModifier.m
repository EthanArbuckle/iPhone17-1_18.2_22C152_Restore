@interface SBSplitAllDisplayItemsSwitcherModifier
- (BOOL)hasInvalidatedAppLayoutsForInsertion;
- (BOOL)hasInvalidatedAppLayoutsForRemoval;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
- (id)handleEvent:(id)a3;
- (void)setHasInvalidatedAppLayoutsForInsertion:(BOOL)a3;
- (void)setHasInvalidatedAppLayoutsForRemoval:(BOOL)a3;
@end

@implementation SBSplitAllDisplayItemsSwitcherModifier

- (id)handleEvent:(id)a3
{
  id v4 = a3;
  if (*(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1)
    || [(SBChainableModifier *)self state] == 1)
  {
    v5 = 0;
  }
  else
  {
    *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1) = 1;
    v6 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    v5 = SBAppendSwitcherModifierResponse(v6, 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)SBSplitAllDisplayItemsSwitcherModifier;
  v7 = [(SBChainableModifier *)&v12 handleEvent:v4];
  v8 = SBAppendSwitcherModifierResponse(v7, v5);

  if (!*(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 2)
    && [(SBChainableModifier *)self state] == 1)
  {
    *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 2) = 1;
    v9 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v10 = SBAppendSwitcherModifierResponse(v9, v8);

    v8 = (void *)v10;
  }

  return v8;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  v16 = self;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_opt_new();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v3;
  uint64_t v19 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v28;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = v5;
        v6 = *(void **)(*((void *)&v27 + 1) + 8 * v5);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        v7 = objc_msgSend(v6, "allItems", v16);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v24;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v12 = *(void *)(*((void *)&v23 + 1) + 8 * i);
              v22[0] = MEMORY[0x1E4F143A8];
              v22[1] = 3221225472;
              v22[2] = __74__SBSplitAllDisplayItemsSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
              v22[3] = &unk_1E6AF4B38;
              v22[4] = v12;
              v13 = [v6 appLayoutWithItemsPassingTest:v22];
              [v4 addObject:v13];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v20 + 1;
      }
      while (v20 + 1 != v19);
      uint64_t v19 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v19);
  }

  v21.receiver = v16;
  v21.super_class = (Class)SBSplitAllDisplayItemsSwitcherModifier;
  v14 = [(SBSplitAllDisplayItemsSwitcherModifier *)&v21 adjustedAppLayoutsForAppLayouts:v4];

  return v14;
}

uint64_t __74__SBSplitAllDisplayItemsSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke()
{
  return BSEqualObjects();
}

- (BOOL)hasInvalidatedAppLayoutsForInsertion
{
  return *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1);
}

- (void)setHasInvalidatedAppLayoutsForInsertion:(BOOL)a3
{
  *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1) = a3;
}

- (BOOL)hasInvalidatedAppLayoutsForRemoval
{
  return *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 2);
}

- (void)setHasInvalidatedAppLayoutsForRemoval:(BOOL)a3
{
  *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 2) = a3;
}

@end