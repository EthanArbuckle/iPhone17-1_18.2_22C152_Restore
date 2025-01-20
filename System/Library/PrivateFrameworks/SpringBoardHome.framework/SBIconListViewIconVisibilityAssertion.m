@interface SBIconListViewIconVisibilityAssertion
- (BOOL)isInvalidated;
- (NSString)description;
- (NSString)reason;
- (SBIconListView)listView;
- (SBIconListViewIconVisibilityAssertion)initWithListView:(id)a3 reason:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation SBIconListViewIconVisibilityAssertion

- (SBIconListViewIconVisibilityAssertion)initWithListView:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBIconListViewIconVisibilityAssertion;
  v9 = [(SBIconListViewIconVisibilityAssertion *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_listView, a3);
    uint64_t v11 = [v8 copy];
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (![(SBIconListViewIconVisibilityAssertion *)self isInvalidated])
  {
    v3 = SBLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      reason = self->_reason;
      *(_DWORD *)buf = 138543362;
      id v7 = reason;
      _os_log_impl(&dword_1D7F0A000, v3, OS_LOG_TYPE_INFO, "SBIconListViewIconVisibilityAssertion deallocated but not invalidated! Reason: %{public}@", buf, 0xCu);
    }

    [(SBIconListViewIconVisibilityAssertion *)self invalidate];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBIconListViewIconVisibilityAssertion;
  [(SBIconListViewIconVisibilityAssertion *)&v5 dealloc];
}

- (void)invalidate
{
  if (![(SBIconListViewIconVisibilityAssertion *)self isInvalidated])
  {
    v3 = [(SBIconListViewIconVisibilityAssertion *)self listView];
    [v3 removeShowAllIconsAssertion:self];

    [(SBIconListViewIconVisibilityAssertion *)self setInvalidated:1];
  }
}

- (NSString)description
{
  return (NSString *)[(SBIconListViewIconVisibilityAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBIconListViewIconVisibilityAssertion *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBIconListViewIconVisibilityAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBIconListViewIconVisibilityAssertion *)self succinctDescriptionBuilder];
  objc_super v5 = [(SBIconListViewIconVisibilityAssertion *)self reason];
  id v6 = (id)[v4 appendObject:v5 withName:@"reason"];

  id v7 = [(SBIconListViewIconVisibilityAssertion *)self listView];
  id v8 = (id)[v4 appendPointer:v7 withName:@"listView"];

  return v4;
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
}

@end