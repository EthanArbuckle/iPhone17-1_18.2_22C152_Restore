@interface _SBRootFolderViewElementBorrowedAssertion
- (NSString)description;
- (NSString)reason;
- (SBRootFolderView)folderView;
- (_SBRootFolderViewElementBorrowedAssertion)initWithFolderView:(id)a3 reason:(id)a4;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)dealloc;
- (void)invalidate;
- (void)setFolderView:(id)a3;
@end

@implementation _SBRootFolderViewElementBorrowedAssertion

- (_SBRootFolderViewElementBorrowedAssertion)initWithFolderView:(id)a3 reason:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SBRootFolderViewElementBorrowedAssertion;
  v9 = [(_SBRootFolderViewElementBorrowedAssertion *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_folderView, a3);
    uint64_t v11 = [v8 copy];
    reason = v10->_reason;
    v10->_reason = (NSString *)v11;
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 8);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D7F0A000, a2, OS_LOG_TYPE_ERROR, "_SBRootFolderViewElementBorrowedAssertion deallocated but not invalidated! Reason: %{public}@", (uint8_t *)&v3, 0xCu);
}

- (void)invalidate
{
  int v3 = [(_SBRootFolderViewElementBorrowedAssertion *)self folderView];
  [v3 elementBorrowedAssertionDidInvalidate:self];

  [(_SBRootFolderViewElementBorrowedAssertion *)self setFolderView:0];
}

- (NSString)description
{
  return (NSString *)[(_SBRootFolderViewElementBorrowedAssertion *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  uint64_t v2 = [(_SBRootFolderViewElementBorrowedAssertion *)self succinctDescriptionBuilder];
  int v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int v3 = [(_SBRootFolderViewElementBorrowedAssertion *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = [(_SBRootFolderViewElementBorrowedAssertion *)self succinctDescriptionBuilder];
  uint64_t v5 = [(_SBRootFolderViewElementBorrowedAssertion *)self reason];
  id v6 = (id)[v4 appendObject:v5 withName:@"reason"];

  id v7 = [(_SBRootFolderViewElementBorrowedAssertion *)self folderView];
  id v8 = (id)[v4 appendPointer:v7 withName:@"folderView"];

  return v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (SBRootFolderView)folderView
{
  return self->_folderView;
}

- (void)setFolderView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderView, 0);
  objc_storeStrong((id *)&self->_reason, 0);
}

@end