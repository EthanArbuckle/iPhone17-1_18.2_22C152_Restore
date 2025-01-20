@interface SBIconListViewIconOverridingLayoutDelegateAssertion
- (BOOL)isInvalidated;
- (NSString)description;
- (NSString)reason;
- (SBIconListLayoutDelegate)layoutDelegate;
- (SBIconListView)listView;
- (SBIconListViewIconOverridingLayoutDelegateAssertion)initWithListView:(id)a3 layoutDelegate:(id)a4 reason:(id)a5;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation SBIconListViewIconOverridingLayoutDelegateAssertion

- (SBIconListViewIconOverridingLayoutDelegateAssertion)initWithListView:(id)a3 layoutDelegate:(id)a4 reason:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBIconListViewIconOverridingLayoutDelegateAssertion;
  v12 = [(SBIconListViewIconOverridingLayoutDelegateAssertion *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_listView, a3);
    objc_storeWeak((id *)&v13->_layoutDelegate, v10);
    uint64_t v14 = [v11 copy];
    reason = v13->_reason;
    v13->_reason = (NSString *)v14;
  }
  return v13;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 24);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_FAULT, "SBIconListViewIconOverridingLayoutDelegateAssertion deallocated but not invalidated! Reason: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)invalidate
{
  if (![(SBIconListViewIconOverridingLayoutDelegateAssertion *)self isInvalidated])
  {
    int v3 = [(SBIconListViewIconOverridingLayoutDelegateAssertion *)self listView];
    [v3 removeOverridingLayoutDelegateAssertion:self];

    [(SBIconListViewIconOverridingLayoutDelegateAssertion *)self setInvalidated:1];
  }
}

- (NSString)description
{
  return (NSString *)[(SBIconListViewIconOverridingLayoutDelegateAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBIconListViewIconOverridingLayoutDelegateAssertion *)self succinctDescriptionBuilder];
  int v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int v3 = [(SBIconListViewIconOverridingLayoutDelegateAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(SBIconListViewIconOverridingLayoutDelegateAssertion *)self succinctDescriptionBuilder];
  uint64_t v5 = [(SBIconListViewIconOverridingLayoutDelegateAssertion *)self layoutDelegate];
  id v6 = (id)[v4 appendObject:v5 withName:@"layoutDelegate"];

  v7 = [(SBIconListViewIconOverridingLayoutDelegateAssertion *)self reason];
  id v8 = (id)[v4 appendObject:v7 withName:@"reason"];

  id v9 = [(SBIconListViewIconOverridingLayoutDelegateAssertion *)self listView];
  id v10 = (id)[v4 appendPointer:v9 withName:@"listView"];

  return v4;
}

- (SBIconListLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  return (SBIconListLayoutDelegate *)WeakRetained;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBIconListView)listView
{
  return self->_listView;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listView, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
}

@end