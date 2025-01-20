@interface SBStatusBarContainer
- (NSString)description;
- (NSString)reason;
- (SBStatusBarReusePool)reusePool;
- (UIStatusBar)statusBar;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)setReason:(id)a3;
- (void)setReusePool:(id)a3;
- (void)setStatusBar:(id)a3;
@end

@implementation SBStatusBarContainer

- (void)setStatusBar:(id)a3
{
}

- (void)setReusePool:(id)a3
{
}

- (void)setReason:(id)a3
{
}

- (void)dealloc
{
  v3 = [(SBStatusBarContainer *)self reusePool];
  [v3 _removeStatusBarContainer:self];

  v4.receiver = self;
  v4.super_class = (Class)SBStatusBarContainer;
  [(SBStatusBarContainer *)&v4 dealloc];
}

- (NSString)description
{
  return (NSString *)[(SBStatusBarContainer *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBStatusBarContainer *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__SBStatusBarContainer_succinctDescriptionBuilder__block_invoke;
  v8[3] = &unk_1E6AF5290;
  id v4 = v3;
  id v9 = v4;
  v10 = self;
  id v5 = (id)[v4 modifyProem:v8];
  id v6 = v4;

  return v6;
}

void __50__SBStatusBarContainer_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  id v2 = (id)[*(id *)(a1 + 32) appendObject:*(void *)(*(void *)(a1 + 40) + 24) withName:@"reason"];
  v3 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v4 = (id)[v3 appendObject:WeakRetained withName:@"status bar"];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBStatusBarContainer *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (UIStatusBar)statusBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBar);
  return (UIStatusBar *)WeakRetained;
}

- (SBStatusBarReusePool)reusePool
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_reusePool);
  return (SBStatusBarReusePool *)WeakRetained;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_reusePool);
  objc_destroyWeak((id *)&self->_statusBar);
}

@end