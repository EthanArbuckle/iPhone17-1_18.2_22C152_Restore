@interface SBIconsOccludedAssertion
- (BOOL)isInvalidated;
- (NSString)description;
- (NSString)reason;
- (SBIconsOccludedAssertion)initWithInvalidator:(id)a3 reason:(id)a4;
- (SBIconsOccludedAssertionInvalidating)invalidator;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation SBIconsOccludedAssertion

- (SBIconsOccludedAssertion)initWithInvalidator:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBIconsOccludedAssertion;
  v8 = [(SBIconsOccludedAssertion *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_invalidator, v6);
    uint64_t v10 = [v7 copy];
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;
  }
  return v9;
}

- (void)dealloc
{
}

- (NSString)description
{
  return (NSString *)[(SBIconsOccludedAssertion *)self descriptionWithMultilinePrefix:0];
}

- (void)invalidate
{
  if (![(SBIconsOccludedAssertion *)self isInvalidated])
  {
    [(SBIconsOccludedAssertion *)self setInvalidated:1];
    id v3 = [(SBIconsOccludedAssertion *)self invalidator];
    [v3 removeIconsOccludedAssertion:self];
  }
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBIconsOccludedAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v5 = [(SBIconsOccludedAssertion *)self reason];
  id v6 = (id)[v4 appendObject:v5 withName:@"reason"];

  id v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBIconsOccludedAssertion isInvalidated](self, "isInvalidated"), @"invalidated");
  return v4;
}

- (id)succinctDescription
{
  v2 = [(SBIconsOccludedAssertion *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (SBIconsOccludedAssertionInvalidating)invalidator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_invalidator);
  return (SBIconsOccludedAssertionInvalidating *)WeakRetained;
}

- (NSString)reason
{
  return self->_reason;
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
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_invalidator);
}

@end