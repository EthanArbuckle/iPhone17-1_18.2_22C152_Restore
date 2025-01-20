@interface SBSlideOverAppsInFullScreenSwitcherSwitcherModifier
- (id)_handleEvent:(id)a3;
- (id)adjustedAppLayoutsForAppLayouts:(id)a3;
@end

@implementation SBSlideOverAppsInFullScreenSwitcherSwitcherModifier

- (id)_handleEvent:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSlideOverAppsInFullScreenSwitcherSwitcherModifier;
  v5 = [(SBSwitcherModifier *)&v11 _handleEvent:v4];
  if (!*(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1))
  {
    *(&self->super._verifyModifierStackCoherencyCheckAfterHandlingEvent + 1) = 1;
    v6 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v7 = SBAppendChainableModifierResponse(v6, v5);

    v5 = (void *)v7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 isExitingAnyPeekEvent])
  {
    [(SBChainableModifier *)self setState:1];
    v8 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v9 = SBAppendChainableModifierResponse(v8, v5);

    v5 = (void *)v9;
  }

  return v5;
}

- (id)adjustedAppLayoutsForAppLayouts:(id)a3
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__SBSlideOverAppsInFullScreenSwitcherSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke;
  v8[3] = &unk_1E6B0AFC8;
  v8[4] = self;
  id v4 = objc_msgSend(a3, "bs_compactMap:", v8);
  v7.receiver = self;
  v7.super_class = (Class)SBSlideOverAppsInFullScreenSwitcherSwitcherModifier;
  v5 = [(SBSlideOverAppsInFullScreenSwitcherSwitcherModifier *)&v7 adjustedAppLayoutsForAppLayouts:v4];

  return v5;
}

id __87__SBSlideOverAppsInFullScreenSwitcherSwitcherModifier_adjustedAppLayoutsForAppLayouts___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isAppLayoutMostRecentRepresentationOfDisplayItems:v3])
  {
    if ([v3 environment] == 2)
    {
      id v4 = [v3 appLayoutByModifyingEnvironment:1];
    }
    else
    {
      id v4 = v3;
    }
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end