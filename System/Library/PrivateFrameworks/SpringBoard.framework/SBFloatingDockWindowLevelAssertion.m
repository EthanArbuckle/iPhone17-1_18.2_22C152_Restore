@interface SBFloatingDockWindowLevelAssertion
- (NSString)description;
- (NSString)reason;
- (SBFloatingDockController)floatingDockController;
- (SBFloatingDockWindowLevelAssertion)initWithFloatingDockController:(id)a3 priority:(unint64_t)a4 level:(double)a5 reason:(id)a6;
- (double)level;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)priority;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBFloatingDockWindowLevelAssertion

- (SBFloatingDockWindowLevelAssertion)initWithFloatingDockController:(id)a3 priority:(unint64_t)a4 level:(double)a5 reason:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SBFloatingDockWindowLevelAssertion;
  v12 = [(SBFloatingDockWindowLevelAssertion *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_floatingDockController, v10);
    v13->_priority = a4;
    v13->_level = a5;
    uint64_t v14 = [v11 copy];
    reason = v13->_reason;
    v13->_reason = (NSString *)v14;

    [v10 _addFloatingDockWindowLevelAssertion:v13];
  }

  return v13;
}

- (void)dealloc
{
  [(SBFloatingDockWindowLevelAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBFloatingDockWindowLevelAssertion;
  [(SBFloatingDockWindowLevelAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_floatingDockController);
  [WeakRetained _removeFloatingDockWindowLevelAssertion:self];
}

- (NSString)description
{
  return (NSString *)[(SBFloatingDockWindowLevelAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBFloatingDockWindowLevelAssertion *)self succinctDescriptionBuilder];
  objc_super v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  objc_super v3 = [(SBFloatingDockWindowLevelAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBFloatingDockWindowLevelAssertion *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__SBFloatingDockWindowLevelAssertion_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AF5290;
  id v6 = v5;
  id v10 = v6;
  id v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

id __76__SBFloatingDockWindowLevelAssertion_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = *(void *)(*(void *)(a1 + 40) + 16) - 1;
  if (v3 > 4) {
    id v4 = @"app switcher";
  }
  else {
    id v4 = off_1E6B0C518[v3];
  }
  id v5 = (id)[v2 appendObject:v4 withName:@"priority"];
  id v6 = (id)[*(id *)(a1 + 32) appendFloat:@"level" withName:*(double *)(*(void *)(a1 + 40) + 24)];
  return (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 32) withName:@"reason"];
}

- (SBFloatingDockController)floatingDockController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_floatingDockController);
  return (SBFloatingDockController *)WeakRetained;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (double)level
{
  return self->_level;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_floatingDockController);
}

@end