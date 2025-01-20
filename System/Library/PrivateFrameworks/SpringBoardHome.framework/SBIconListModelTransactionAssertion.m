@interface SBIconListModelTransactionAssertion
- (BOOL)isInvalidated;
- (NSString)description;
- (NSString)reason;
- (SBIconListModel)listModel;
- (SBIconListModelTransactionAssertion)initWithListModel:(id)a3 reason:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation SBIconListModelTransactionAssertion

- (SBIconListModelTransactionAssertion)initWithListModel:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBIconListModelTransactionAssertion;
  v8 = [(SBIconListModelTransactionAssertion *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listModel, v6);
    uint64_t v10 = [v7 copy];
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;
  }
  return v9;
}

- (void)dealloc
{
  if (![(SBIconListModelTransactionAssertion *)self isInvalidated]) {
    NSLog(&cfstr_AssertionNotIn.isa);
  }
  [(SBIconListModelTransactionAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBIconListModelTransactionAssertion;
  [(SBIconListModelTransactionAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  if (![(SBIconListModelTransactionAssertion *)self isInvalidated])
  {
    [(SBIconListModelTransactionAssertion *)self setInvalidated:1];
    id v3 = [(SBIconListModelTransactionAssertion *)self listModel];
    [v3 removeTransactionAssertion:self];
  }
}

- (NSString)description
{
  return (NSString *)[(SBIconListModelTransactionAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBIconListModelTransactionAssertion *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBIconListModelTransactionAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBIconListModelTransactionAssertion *)self succinctDescriptionBuilder];
  v5 = [(SBIconListModelTransactionAssertion *)self reason];
  [v4 appendString:v5 withName:@"reason"];

  id v6 = [(SBIconListModelTransactionAssertion *)self listModel];
  id v7 = (id)[v4 appendPointer:v6 withName:@"listModel"];

  return v4;
}

- (SBIconListModel)listModel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listModel);
  return (SBIconListModel *)WeakRetained;
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
  objc_destroyWeak((id *)&self->_listModel);
}

@end