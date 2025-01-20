@interface SBIconListViewPauseLayoutAssertion
- (BOOL)isInvalidated;
- (NSString)description;
- (NSString)reason;
- (SBIconListView)listView;
- (SBIconListViewPauseLayoutAssertion)initWithListView:(id)a3 iconView:(id)a4 reason:(id)a5;
- (SBIconView)iconView;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation SBIconListViewPauseLayoutAssertion

- (SBIconListViewPauseLayoutAssertion)initWithListView:(id)a3 iconView:(id)a4 reason:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBIconListViewPauseLayoutAssertion;
  v12 = [(SBIconListViewPauseLayoutAssertion *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_listView, a3);
    objc_storeStrong((id *)&v13->_iconView, a4);
    uint64_t v14 = [v11 copy];
    reason = v13->_reason;
    v13->_reason = (NSString *)v14;
  }
  return v13;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_fault_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_FAULT, "SBIconListViewPauseLayoutAssertion deallocated but not invalidated! Reason: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)invalidate
{
  if (![(SBIconListViewPauseLayoutAssertion *)self isInvalidated])
  {
    int v3 = [(SBIconListViewPauseLayoutAssertion *)self listView];
    [v3 removePauseLayoutAssertion:self];

    [(SBIconListViewPauseLayoutAssertion *)self setInvalidated:1];
  }
}

- (NSString)description
{
  return (NSString *)[(SBIconListViewPauseLayoutAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(SBIconListViewPauseLayoutAssertion *)self succinctDescriptionBuilder];
  int v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int v3 = [(SBIconListViewPauseLayoutAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(SBIconListViewPauseLayoutAssertion *)self succinctDescriptionBuilder];
  uint64_t v5 = [(SBIconListViewPauseLayoutAssertion *)self reason];
  id v6 = (id)[v4 appendObject:v5 withName:@"reason"];

  v7 = [(SBIconListViewPauseLayoutAssertion *)self iconView];
  id v8 = (id)[v4 appendObject:v7 withName:@"iconView"];

  id v9 = [(SBIconListViewPauseLayoutAssertion *)self listView];
  id v10 = (id)[v4 appendPointer:v9 withName:@"listView"];

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBIconView)iconView
{
  return self->_iconView;
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
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end