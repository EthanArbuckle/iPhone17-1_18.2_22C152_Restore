@interface SBFolderTransactionAssertion
- (BOOL)isInvalidated;
- (NSString)description;
- (NSString)reason;
- (SBFolder)folder;
- (SBFolderTransactionAssertion)initWithFolder:(id)a3 reason:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
- (void)setInvalidated:(BOOL)a3;
@end

@implementation SBFolderTransactionAssertion

- (void)dealloc
{
  if (![(SBFolderTransactionAssertion *)self isInvalidated]) {
    NSLog(&cfstr_AssertionNotIn.isa);
  }
  [(SBFolderTransactionAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBFolderTransactionAssertion;
  [(SBFolderTransactionAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  if (![(SBFolderTransactionAssertion *)self isInvalidated])
  {
    [(SBFolderTransactionAssertion *)self setInvalidated:1];
    id v3 = [(SBFolderTransactionAssertion *)self folder];
    [v3 removeTransactionAssertion:self];
  }
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (SBFolder)folder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_folder);
  return (SBFolder *)WeakRetained;
}

- (SBFolderTransactionAssertion)initWithFolder:(id)a3 reason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBFolderTransactionAssertion;
  v8 = [(SBFolderTransactionAssertion *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_folder, v6);
    uint64_t v10 = [v7 copy];
    reason = v9->_reason;
    v9->_reason = (NSString *)v10;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_destroyWeak((id *)&self->_folder);
}

- (NSString)description
{
  return (NSString *)[(SBFolderTransactionAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBFolderTransactionAssertion *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBFolderTransactionAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(SBFolderTransactionAssertion *)self succinctDescriptionBuilder];
  v5 = [(SBFolderTransactionAssertion *)self reason];
  [v4 appendString:v5 withName:@"reason"];

  id v6 = [(SBFolderTransactionAssertion *)self folder];
  id v7 = (id)[v4 appendPointer:v6 withName:@"folder"];

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

@end