@interface SBPIPEnvironmentDependentOverrideAssertion
- (BOOL)invalidatesEarly;
- (NSSet)allowedEnvironmentModes;
- (SBPIPEnvironmentDependentOverrideAssertion)initWithReason:(int64_t)a3 identifier:(id)a4 windowScene:(id)a5 invalidationBlock:(id)a6;
- (id)_layoutCoordinator;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (int64_t)_environmentModeForLayoutState:(id)a3;
- (void)_updateStateForTransitionWithContext:(id)a3;
- (void)dealloc;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4;
- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4;
- (void)setAllowedEnvironmentModes:(id)a3;
- (void)setInvalidatesEarly:(BOOL)a3;
@end

@implementation SBPIPEnvironmentDependentOverrideAssertion

- (SBPIPEnvironmentDependentOverrideAssertion)initWithReason:(int64_t)a3 identifier:(id)a4 windowScene:(id)a5 invalidationBlock:(id)a6
{
  id v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SBPIPEnvironmentDependentOverrideAssertion;
  v11 = [(SBPIPBehaviorOverrideAssertion *)&v22 initWithReason:a3 identifier:a4 invalidationBlock:a6];
  v12 = v11;
  if (v11)
  {
    v11->_invalidatesEarly = 0;
    objc_storeWeak((id *)&v11->_windowScene, v10);
    v13 = [(SBPIPEnvironmentDependentOverrideAssertion *)v12 _layoutCoordinator];
    [v13 addObserver:v12];

    v14 = (void *)MEMORY[0x1E4F1CAD0];
    v15 = NSNumber;
    v16 = [v10 switcherController];
    v17 = [v16 layoutState];
    v18 = objc_msgSend(v15, "numberWithInteger:", -[SBPIPEnvironmentDependentOverrideAssertion _environmentModeForLayoutState:](v12, "_environmentModeForLayoutState:", v17));
    uint64_t v19 = [v14 setWithObject:v18];
    allowedEnvironmentModes = v12->_allowedEnvironmentModes;
    v12->_allowedEnvironmentModes = (NSSet *)v19;
  }
  return v12;
}

- (void)dealloc
{
  v3 = [(SBPIPEnvironmentDependentOverrideAssertion *)self _layoutCoordinator];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SBPIPEnvironmentDependentOverrideAssertion;
  [(BSSimpleAssertion *)&v4 dealloc];
}

- (id)_layoutCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v3 = [WeakRetained sceneManager];
  objc_super v4 = [v3 _layoutStateTransitionCoordinator];

  return v4;
}

- (int64_t)_environmentModeForLayoutState:(id)a3
{
  id v3 = a3;
  if ([v3 isFloatingSwitcherVisible]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = [v3 unlockedEnvironmentMode];
  }

  return v4;
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  if (self->_invalidatesEarly) {
    [(SBPIPEnvironmentDependentOverrideAssertion *)self _updateStateForTransitionWithContext:a4];
  }
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
}

- (void)_updateStateForTransitionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = [v4 toLayoutState];

  SBSafeCast(v5, v6);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  allowedEnvironmentModes = self->_allowedEnvironmentModes;
  v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[SBPIPEnvironmentDependentOverrideAssertion _environmentModeForLayoutState:](self, "_environmentModeForLayoutState:", v10));
  LOBYTE(allowedEnvironmentModes) = [(NSSet *)allowedEnvironmentModes containsObject:v8];

  if ((allowedEnvironmentModes & 1) == 0)
  {
    [(BSSimpleAssertion *)self invalidate];
    v9 = [(SBPIPEnvironmentDependentOverrideAssertion *)self _layoutCoordinator];
    [v9 removeObserver:self];
  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)SBPIPEnvironmentDependentOverrideAssertion;
  id v4 = [(SBPIPBehaviorOverrideAssertion *)&v20 descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSSet count](self->_allowedEnvironmentModes, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v6 = self->_allowedEnvironmentModes;
  uint64_t v7 = [(NSSet *)v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = SBStringForUnlockedEnvironmentMode(objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "unsignedIntValue", (void)v16));
        [v5 addObject:v11];
      }
      uint64_t v8 = [(NSSet *)v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v8);
  }

  v12 = [v5 componentsJoinedByString:@", "];
  [v4 appendString:v12 withName:@"Allowed Environment"];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v14 = [WeakRetained succinctDescription];
  [v4 appendString:v14 withName:@"Window Scene"];

  return v4;
}

- (BOOL)invalidatesEarly
{
  return self->_invalidatesEarly;
}

- (void)setInvalidatesEarly:(BOOL)a3
{
  self->_invalidatesEarly = a3;
}

- (NSSet)allowedEnvironmentModes
{
  return self->_allowedEnvironmentModes;
}

- (void)setAllowedEnvironmentModes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedEnvironmentModes, 0);
  objc_destroyWeak((id *)&self->_windowScene);
}

@end