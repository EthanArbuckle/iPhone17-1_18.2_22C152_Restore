@interface SBContinuousExposePeekSwitcherModifier
- (BOOL)isSwitcherWindowVisible;
- (SBAppLayout)appLayout;
- (SBContinuousExposePeekSwitcherModifier)initWithAppLayout:(id)a3 configuration:(int64_t)a4;
- (id)appLayoutsForContinuousExposeIdentifier:(id)a3;
- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3;
- (id)debugPotentialChildModifiers;
- (id)handleEvent:(id)a3;
- (id)handleScrollEvent:(id)a3;
- (id)handleTransitionEvent:(id)a3;
- (int64_t)configuration;
- (unint64_t)maskedCornersForIndex:(unint64_t)a3;
- (unint64_t)transactionCompletionOptions;
- (void)setState:(int64_t)a3;
@end

@implementation SBContinuousExposePeekSwitcherModifier

- (SBContinuousExposePeekSwitcherModifier)initWithAppLayout:(id)a3 configuration:(int64_t)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBContinuousExposePeekSwitcherModifier;
  v9 = [(SBSwitcherModifier *)&v17 init];
  if (v9)
  {
    if (!v8)
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:a2, v9, @"SBContinuousExposePeekSwitcherModifier.m", 45, @"Invalid parameter not satisfying: %@", @"appLayout" object file lineNumber description];
    }
    objc_storeStrong((id *)&v9->_appLayout, a3);
    v9->_configuration = a4;
    v10 = [[_SBContinuousExposePeekContentSwitcherModifier alloc] initWithAppLayout:v9->_appLayout configuration:v9->_configuration];
    contentModifier = v9->_contentModifier;
    v9->_contentModifier = &v10->super;

    v12 = [SBFilteringSwitcherModifier alloc];
    v18[0] = v9->_appLayout;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    v14 = [(SBFilteringSwitcherModifier *)v12 initWithAppLayouts:v13 modifier:v9->_contentModifier];

    [(SBChainableModifier *)v9 addChildModifier:v14];
  }

  return v9;
}

- (id)debugPotentialChildModifiers
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self->_contentModifier;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)appLayoutsToEnsureExistForMainTransitionEvent:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (void)setState:(int64_t)a3
{
  int64_t v5 = [(SBChainableModifier *)self state];
  if (a3 == 1 && v5 != 1) {
    [(SBContinuousExposePeekSwitcherModifier *)self newAppLayoutsGenCount];
  }
  v6.receiver = self;
  v6.super_class = (Class)SBContinuousExposePeekSwitcherModifier;
  [(SBChainableModifier *)&v6 setState:a3];
}

- (id)handleEvent:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBContinuousExposePeekSwitcherModifier;
  int64_t v5 = [(SBChainableModifier *)&v16 handleEvent:v4];
  dismissalTransitionModifier = self->_dismissalTransitionModifier;
  if (dismissalTransitionModifier && [(SBChainableModifier *)dismissalTransitionModifier state] == 1)
  {
    v7 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v8 = SBAppendSwitcherModifierResponse(v7, v5);

    [(SBContinuousExposePeekSwitcherModifier *)self setState:1];
    int64_t v5 = (void *)v8;
  }
  if ([v4 isTransitionEvent])
  {
    id v9 = v4;
    v10 = [v9 toAppLayout];
    uint64_t v11 = [v9 fromPeekConfiguration];
    uint64_t v12 = [v9 toPeekConfiguration];
    if (SBPeekConfigurationIsValid(v11)
      && !SBPeekConfigurationIsValid(v12)
      && v10
      && ([v10 isEqual:self->_appLayout] & 1) == 0)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __54__SBContinuousExposePeekSwitcherModifier_handleEvent___block_invoke;
      v15[3] = &unk_1E6AF4B38;
      v15[4] = self;
      v13 = [v10 appLayoutWithItemsPassingTest:v15];
      [v9 setToAppLayout:v13];
    }
  }

  return v5;
}

uint64_t __54__SBContinuousExposePeekSwitcherModifier_handleEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 112) containsItem:a2] ^ 1;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)SBContinuousExposePeekSwitcherModifier;
  int64_t v5 = [(SBSwitcherModifier *)&v28 handleTransitionEvent:v4];
  uint64_t v6 = [v4 phase];
  int v7 = [v4 isAnimated];
  BOOL IsValid = SBPeekConfigurationIsValid([v4 toPeekConfiguration]);
  BOOL v9 = SBPeekConfigurationIsValid([v4 fromPeekConfiguration]);
  v27 = [v4 fromAppLayout];
  v10 = [v4 toAppLayout];
  if (v6 == 2) {
    int v11 = v7 ^ 1;
  }
  else {
    int v11 = 1;
  }
  int v12 = !IsValid;
  if ((v11 & 1) != 0 || (v12 & 1) != 0 || v9)
  {
    if (((v11 | IsValid) & 1) != 0 || !v9)
    {
      if (v6 == 3) {
        int v20 = v7;
      }
      else {
        int v20 = 1;
      }
      if (((v20 | IsValid) & 1) == 0)
      {
        v21 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
        uint64_t v22 = SBAppendSwitcherModifierResponse(v21, v5);

        [(SBContinuousExposePeekSwitcherModifier *)self setState:1];
        int64_t v5 = (void *)v22;
      }
    }
    else
    {
      objc_super v16 = [SBContinuousExposePeekTransitionModifier alloc];
      objc_super v17 = [v4 transitionID];
      v18 = [(SBContinuousExposePeekTransitionModifier *)v16 initWithTransitionID:v17 fromAppLayout:v27 toAppLayout:v10 direction:1];
      dismissalTransitionModifier = self->_dismissalTransitionModifier;
      self->_dismissalTransitionModifier = v18;

      [(SBChainableModifier *)self addChildModifier:self->_dismissalTransitionModifier];
    }
  }
  else
  {
    v13 = [SBContinuousExposePeekTransitionModifier alloc];
    v14 = [v4 transitionID];
    v15 = [(SBContinuousExposePeekTransitionModifier *)v13 initWithTransitionID:v14 fromAppLayout:v27 toAppLayout:v10 direction:0];

    [(SBChainableModifier *)self addChildModifier:v15];
  }
  if (v6 == 2) {
    int v23 = 0;
  }
  else {
    int v23 = v7;
  }
  if (((v23 | v12 | v9) & 1) == 0)
  {
    v24 = objc_alloc_init(SBInvalidateAdjustedAppLayoutsSwitcherEventResponse);
    uint64_t v25 = SBAppendSwitcherModifierResponse(v24, v5);

    int64_t v5 = (void *)v25;
  }

  return v5;
}

- (id)handleScrollEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposePeekSwitcherModifier;
  int64_t v5 = [(SBSwitcherModifier *)&v12 handleScrollEvent:v4];
  if (![v4 phase] && objc_msgSend(v4, "isUserInitiated"))
  {
    uint64_t v6 = [(SBChainableModifier *)self childModifierByKey:@"UserScrollingModifier"];
    if (!v6)
    {
      uint64_t v6 = objc_alloc_init(SBScrollingSwitcherModifier);
      [(SBChainableModifier *)self addChildModifier:v6 atLevel:0 key:@"UserScrollingModifier"];
      int v7 = SBLogAppSwitcher();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = (objc_class *)objc_opt_class();
        BOOL v9 = NSStringFromClass(v8);
        v10 = [(SBChainableModifier *)v6 succinctDescription];
        *(_DWORD *)buf = 138412546;
        v14 = v9;
        __int16 v15 = 2112;
        objc_super v16 = v10;
        _os_log_impl(&dword_1D85BA000, v7, OS_LOG_TYPE_INFO, "[%@] Adding child modifier for scroll %@.", buf, 0x16u);
      }
    }
  }
  return v5;
}

- (id)appLayoutsForContinuousExposeIdentifier:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposePeekSwitcherModifier;
  id v4 = a3;
  int64_t v5 = [(SBContinuousExposePeekSwitcherModifier *)&v12 appLayoutsForContinuousExposeIdentifier:v4];
  uint64_t v6 = [(SBAppLayout *)self->_appLayout continuousExposeIdentifier];
  int v7 = BSEqualStrings();

  if (v7)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __82__SBContinuousExposePeekSwitcherModifier_appLayoutsForContinuousExposeIdentifier___block_invoke;
    v11[3] = &unk_1E6AF4B60;
    v11[4] = self;
    objc_msgSend(v5, "bs_filter:", v11);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = v5;
  }
  BOOL v9 = v8;

  return v9;
}

uint64_t __82__SBContinuousExposePeekSwitcherModifier_appLayoutsForContinuousExposeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 containsAnyItemFromAppLayout:*(void *)(*(void *)(a1 + 32) + 112)] ^ 1;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  int64_t v5 = [(SBContinuousExposePeekSwitcherModifier *)self appLayouts];
  uint64_t v6 = [v5 objectAtIndex:a3];

  if ([v6 isEqual:self->_appLayout])
  {
    unint64_t v7 = 15;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBContinuousExposePeekSwitcherModifier;
    unint64_t v7 = [(SBContinuousExposePeekSwitcherModifier *)&v9 maskedCornersForIndex:a3];
  }

  return v7;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (unint64_t)transactionCompletionOptions
{
  if ([(SBContinuousExposePeekSwitcherModifier *)self isReduceMotionEnabled]) {
    return 6;
  }
  else {
    return 2;
  }
}

- (SBAppLayout)appLayout
{
  return self->_appLayout;
}

- (int64_t)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_dismissalTransitionModifier, 0);
  objc_storeStrong((id *)&self->_contentModifier, 0);
}

@end